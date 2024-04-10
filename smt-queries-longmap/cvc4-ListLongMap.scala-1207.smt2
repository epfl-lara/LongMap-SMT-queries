; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25712 () Bool)

(assert start!25712)

(declare-fun res!130934 () Bool)

(declare-fun e!172482 () Bool)

(assert (=> start!25712 (=> (not res!130934) (not e!172482))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25712 (= res!130934 (validMask!0 mask!4002))))

(assert (=> start!25712 e!172482))

(assert (=> start!25712 true))

(declare-datatypes ((array!12891 0))(
  ( (array!12892 (arr!6100 (Array (_ BitVec 32) (_ BitVec 64))) (size!6452 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12891)

(declare-fun array_inv!4063 (array!12891) Bool)

(assert (=> start!25712 (array_inv!4063 a!3436)))

(declare-fun b!266634 () Bool)

(declare-fun res!130933 () Bool)

(assert (=> b!266634 (=> (not res!130933) (not e!172482))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266634 (= res!130933 (validKeyInArray!0 k!2698))))

(declare-fun b!266635 () Bool)

(declare-fun res!130932 () Bool)

(assert (=> b!266635 (=> (not res!130932) (not e!172482))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266635 (= res!130932 (and (= (size!6452 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6452 a!3436))))))

(declare-fun b!266636 () Bool)

(declare-fun res!130930 () Bool)

(assert (=> b!266636 (=> (not res!130930) (not e!172482))))

(declare-fun arrayContainsKey!0 (array!12891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266636 (= res!130930 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266637 () Bool)

(declare-fun res!130935 () Bool)

(declare-fun e!172483 () Bool)

(assert (=> b!266637 (=> (not res!130935) (not e!172483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12891 (_ BitVec 32)) Bool)

(assert (=> b!266637 (= res!130935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266638 () Bool)

(assert (=> b!266638 (= e!172483 false)))

(declare-fun lt!134481 () Bool)

(declare-datatypes ((List!3914 0))(
  ( (Nil!3911) (Cons!3910 (h!4577 (_ BitVec 64)) (t!8996 List!3914)) )
))
(declare-fun arrayNoDuplicates!0 (array!12891 (_ BitVec 32) List!3914) Bool)

(assert (=> b!266638 (= lt!134481 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3911))))

(declare-fun b!266639 () Bool)

(assert (=> b!266639 (= e!172482 e!172483)))

(declare-fun res!130931 () Bool)

(assert (=> b!266639 (=> (not res!130931) (not e!172483))))

(declare-datatypes ((SeekEntryResult!1291 0))(
  ( (MissingZero!1291 (index!7334 (_ BitVec 32))) (Found!1291 (index!7335 (_ BitVec 32))) (Intermediate!1291 (undefined!2103 Bool) (index!7336 (_ BitVec 32)) (x!25632 (_ BitVec 32))) (Undefined!1291) (MissingVacant!1291 (index!7337 (_ BitVec 32))) )
))
(declare-fun lt!134482 () SeekEntryResult!1291)

(assert (=> b!266639 (= res!130931 (or (= lt!134482 (MissingZero!1291 i!1355)) (= lt!134482 (MissingVacant!1291 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12891 (_ BitVec 32)) SeekEntryResult!1291)

(assert (=> b!266639 (= lt!134482 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25712 res!130934) b!266635))

(assert (= (and b!266635 res!130932) b!266634))

(assert (= (and b!266634 res!130933) b!266636))

(assert (= (and b!266636 res!130930) b!266639))

(assert (= (and b!266639 res!130931) b!266637))

(assert (= (and b!266637 res!130935) b!266638))

(declare-fun m!283189 () Bool)

(assert (=> b!266639 m!283189))

(declare-fun m!283191 () Bool)

(assert (=> b!266634 m!283191))

(declare-fun m!283193 () Bool)

(assert (=> b!266636 m!283193))

(declare-fun m!283195 () Bool)

(assert (=> b!266638 m!283195))

(declare-fun m!283197 () Bool)

(assert (=> start!25712 m!283197))

(declare-fun m!283199 () Bool)

(assert (=> start!25712 m!283199))

(declare-fun m!283201 () Bool)

(assert (=> b!266637 m!283201))

(push 1)

