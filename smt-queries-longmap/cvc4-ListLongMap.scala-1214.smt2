; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25754 () Bool)

(assert start!25754)

(declare-fun b!267021 () Bool)

(declare-fun e!172671 () Bool)

(assert (=> b!267021 (= e!172671 false)))

(declare-fun lt!134599 () Bool)

(declare-datatypes ((array!12933 0))(
  ( (array!12934 (arr!6121 (Array (_ BitVec 32) (_ BitVec 64))) (size!6473 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12933)

(declare-datatypes ((List!3935 0))(
  ( (Nil!3932) (Cons!3931 (h!4598 (_ BitVec 64)) (t!9017 List!3935)) )
))
(declare-fun arrayNoDuplicates!0 (array!12933 (_ BitVec 32) List!3935) Bool)

(assert (=> b!267021 (= lt!134599 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3932))))

(declare-fun res!131321 () Bool)

(declare-fun e!172673 () Bool)

(assert (=> start!25754 (=> (not res!131321) (not e!172673))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25754 (= res!131321 (validMask!0 mask!4002))))

(assert (=> start!25754 e!172673))

(assert (=> start!25754 true))

(declare-fun array_inv!4084 (array!12933) Bool)

(assert (=> start!25754 (array_inv!4084 a!3436)))

(declare-fun b!267022 () Bool)

(declare-fun res!131320 () Bool)

(assert (=> b!267022 (=> (not res!131320) (not e!172673))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267022 (= res!131320 (and (= (size!6473 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6473 a!3436))))))

(declare-fun b!267023 () Bool)

(declare-fun res!131318 () Bool)

(assert (=> b!267023 (=> (not res!131318) (not e!172671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12933 (_ BitVec 32)) Bool)

(assert (=> b!267023 (= res!131318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267024 () Bool)

(assert (=> b!267024 (= e!172673 e!172671)))

(declare-fun res!131319 () Bool)

(assert (=> b!267024 (=> (not res!131319) (not e!172671))))

(declare-datatypes ((SeekEntryResult!1312 0))(
  ( (MissingZero!1312 (index!7418 (_ BitVec 32))) (Found!1312 (index!7419 (_ BitVec 32))) (Intermediate!1312 (undefined!2124 Bool) (index!7420 (_ BitVec 32)) (x!25709 (_ BitVec 32))) (Undefined!1312) (MissingVacant!1312 (index!7421 (_ BitVec 32))) )
))
(declare-fun lt!134598 () SeekEntryResult!1312)

(assert (=> b!267024 (= res!131319 (or (= lt!134598 (MissingZero!1312 i!1355)) (= lt!134598 (MissingVacant!1312 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12933 (_ BitVec 32)) SeekEntryResult!1312)

(assert (=> b!267024 (= lt!134598 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!267025 () Bool)

(declare-fun res!131317 () Bool)

(assert (=> b!267025 (=> (not res!131317) (not e!172673))))

(declare-fun arrayContainsKey!0 (array!12933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267025 (= res!131317 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267026 () Bool)

(declare-fun res!131322 () Bool)

(assert (=> b!267026 (=> (not res!131322) (not e!172673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267026 (= res!131322 (validKeyInArray!0 k!2698))))

(assert (= (and start!25754 res!131321) b!267022))

(assert (= (and b!267022 res!131320) b!267026))

(assert (= (and b!267026 res!131322) b!267025))

(assert (= (and b!267025 res!131317) b!267024))

(assert (= (and b!267024 res!131319) b!267023))

(assert (= (and b!267023 res!131318) b!267021))

(declare-fun m!283483 () Bool)

(assert (=> b!267026 m!283483))

(declare-fun m!283485 () Bool)

(assert (=> start!25754 m!283485))

(declare-fun m!283487 () Bool)

(assert (=> start!25754 m!283487))

(declare-fun m!283489 () Bool)

(assert (=> b!267021 m!283489))

(declare-fun m!283491 () Bool)

(assert (=> b!267024 m!283491))

(declare-fun m!283493 () Bool)

(assert (=> b!267023 m!283493))

(declare-fun m!283495 () Bool)

(assert (=> b!267025 m!283495))

(push 1)

(assert (not start!25754))

(assert (not b!267026))

(assert (not b!267024))

(assert (not b!267025))

(assert (not b!267021))

(assert (not b!267023))

(check-sat)

