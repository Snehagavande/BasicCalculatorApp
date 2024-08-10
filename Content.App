<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/resultTextView"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:layout_margin="16dp"
        android:gravity="end"
        android:textSize="32sp"
        android:text="0"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent" />

    <GridLayout
        android:layout_width="0dp"
        android:layout_height="0dp"
        android:layout_margin="16dp"
        android:columnCount="4"
        android:rowCount="5"
        app:layout_constraintTop_toBottomOf="@+id/resultTextView"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent">

        <!-- Number Buttons -->
        <Button android:text="7" android:id="@+id/button7"/>
        <Button android:text="8" android:id="@+id/button8"/>
        <Button android:text="9" android:id="@+id/button9"/>
        <Button android:text="/" android:id="@+id/buttonDivide"/>

        <Button android:text="4" android:id="@+id/button4"/>
        <Button android:text="5" android:id="@+id/button5"/>
        <Button android:text="6" android:id="@+id/button6"/>
        <Button android:text="*" android:id="@+id/buttonMultiply"/>

        <Button android:text="1" android:id="@+id/button1"/>
        <Button android:text="2" android:id="@+id/button2"/>
        <Button android:text="3" android:id="@+id/button3"/>
        <Button android:text="-" android:id="@+id/buttonSubtract"/>

        <Button android:text="0" android:id="@+id/button0"/>
        <Button android:text="." android:id="@+id/buttonDot"/>
        <Button android:text="=" android:id="@+id/buttonEquals"/>
        <Button android:text="+" android:id="@+id/buttonAdd"/>

    </GridLayout>

</androidx.constraintlayout.widget.ConstraintLayout>


package com.example.calculatorapptask1;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private TextView resultTextView;
    private StringBuilder currentInput = new StringBuilder();
    private double firstOperand = 0;
    private String operator = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        resultTextView = findViewById(R.id.resultTextView);

        View.OnClickListener numberClickListener = v -> {
            Button button = (Button) v;
            currentInput.append(button.getText().toString());
            resultTextView.setText(currentInput.toString());
        };

        View.OnClickListener operatorClickListener = v -> {
            Button button = (Button) v;
            operator = button.getText().toString();
            firstOperand = Double.parseDouble(currentInput.toString());
            currentInput.setLength(0);
        };

        findViewById(R.id.button0).setOnClickListener(numberClickListener);
        findViewById(R.id.button1).setOnClickListener(numberClickListener);
        findViewById(R.id.button2).setOnClickListener(numberClickListener);
        findViewById(R.id.button3).setOnClickListener(numberClickListener);
        findViewById(R.id.button4).setOnClickListener(numberClickListener);
        findViewById(R.id.button5).setOnClickListener(numberClickListener);
        findViewById(R.id.button6).setOnClickListener(numberClickListener);
        findViewById(R.id.button7).setOnClickListener(numberClickListener);
        findViewById(R.id.button8).setOnClickListener(numberClickListener);
        findViewById(R.id.button9).setOnClickListener(numberClickListener);
        findViewById(R.id.buttonDot).setOnClickListener(numberClickListener);

        findViewById(R.id.buttonAdd).setOnClickListener(operatorClickListener);
        findViewById(R.id.buttonSubtract).setOnClickListener(operatorClickListener);
        findViewById(R.id.buttonMultiply).setOnClickListener(operatorClickListener);
        findViewById(R.id.buttonDivide).setOnClickListener(operatorClickListener);

        findViewById(R.id.buttonEquals).setOnClickListener(v -> {
            double secondOperand = Double.parseDouble(currentInput.toString());
            double result = 0;

            switch (operator) {
                case "+":
                    result = firstOperand + secondOperand;
                    break;
                case "-":
                    result = firstOperand - secondOperand;
                    break;
                case "*":
                    result = firstOperand * secondOperand;
                    break;
                case "/":
                    if (secondOperand != 0) {
                        result = firstOperand / secondOperand;
                    } else {
                        resultTextView.setText("Error");
                        return;
                    }
                    break;
            }

            resultTextView.setText(String.valueOf(result));
            currentInput.setLength(0);
            currentInput.append(result);
        });
    }
}
