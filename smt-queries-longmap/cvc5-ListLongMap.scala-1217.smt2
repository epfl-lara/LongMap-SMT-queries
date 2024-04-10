; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25768 () Bool)

(assert start!25768)

(declare-fun b!267147 () Bool)

(declare-fun e!172736 () Bool)

(declare-fun e!172734 () Bool)

(assert (=> b!267147 (= e!172736 e!172734)))

(declare-fun res!131446 () Bool)

(assert (=> b!267147 (=> (not res!131446) (not e!172734))))

(declare-datatypes ((SeekEntryResult!1319 0))(
  ( (MissingZero!1319 (index!7446 (_ BitVec 32))) (Found!1319 (index!7447 (_ BitVec 32))) (Intermediate!1319 (undefined!2131 Bool) (index!7448 (_ BitVec 32)) (x!25740 (_ BitVec 32))) (Undefined!1319) (MissingVacant!1319 (index!7449 (_ BitVec 32))) )
))
(declare-fun lt!134641 () SeekEntryResult!1319)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267147 (= res!131446 (or (= lt!134641 (MissingZero!1319 i!1355)) (= lt!134641 (MissingVacant!1319 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12947 0))(
  ( (array!12948 (arr!6128 (Array (_ BitVec 32) (_ BitVec 64))) (size!6480 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12947)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12947 (_ BitVec 32)) SeekEntryResult!1319)

(assert (=> b!267147 (= lt!134641 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!131443 () Bool)

(assert (=> start!25768 (=> (not res!131443) (not e!172736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25768 (= res!131443 (validMask!0 mask!4002))))

(assert (=> start!25768 e!172736))

(assert (=> start!25768 true))

(declare-fun array_inv!4091 (array!12947) Bool)

(assert (=> start!25768 (array_inv!4091 a!3436)))

(declare-fun b!267148 () Bool)

(declare-fun res!131448 () Bool)

(assert (=> b!267148 (=> (not res!131448) (not e!172736))))

(assert (=> b!267148 (= res!131448 (and (= (size!6480 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6480 a!3436))))))

(declare-fun b!267149 () Bool)

(declare-fun res!131447 () Bool)

(assert (=> b!267149 (=> (not res!131447) (not e!172736))))

(declare-fun arrayContainsKey!0 (array!12947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267149 (= res!131447 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267150 () Bool)

(assert (=> b!267150 (= e!172734 false)))

(declare-fun lt!134640 () Bool)

(declare-datatypes ((List!3942 0))(
  ( (Nil!3939) (Cons!3938 (h!4605 (_ BitVec 64)) (t!9024 List!3942)) )
))
(declare-fun arrayNoDuplicates!0 (array!12947 (_ BitVec 32) List!3942) Bool)

(assert (=> b!267150 (= lt!134640 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3939))))

(declare-fun b!267151 () Bool)

(declare-fun res!131445 () Bool)

(assert (=> b!267151 (=> (not res!131445) (not e!172736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267151 (= res!131445 (validKeyInArray!0 k!2698))))

(declare-fun b!267152 () Bool)

(declare-fun res!131444 () Bool)

(assert (=> b!267152 (=> (not res!131444) (not e!172734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12947 (_ BitVec 32)) Bool)

(assert (=> b!267152 (= res!131444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25768 res!131443) b!267148))

(assert (= (and b!267148 res!131448) b!267151))

(assert (= (and b!267151 res!131445) b!267149))

(assert (= (and b!267149 res!131447) b!267147))

(assert (= (and b!267147 res!131446) b!267152))

(assert (= (and b!267152 res!131444) b!267150))

(declare-fun m!283581 () Bool)

(assert (=> b!267147 m!283581))

(declare-fun m!283583 () Bool)

(assert (=> b!267151 m!283583))

(declare-fun m!283585 () Bool)

(assert (=> start!25768 m!283585))

(declare-fun m!283587 () Bool)

(assert (=> start!25768 m!283587))

(declare-fun m!283589 () Bool)

(assert (=> b!267152 m!283589))

(declare-fun m!283591 () Bool)

(assert (=> b!267149 m!283591))

(declare-fun m!283593 () Bool)

(assert (=> b!267150 m!283593))

(push 1)

