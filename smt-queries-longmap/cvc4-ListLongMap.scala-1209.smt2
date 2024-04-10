; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25724 () Bool)

(assert start!25724)

(declare-fun b!266742 () Bool)

(declare-fun res!131041 () Bool)

(declare-fun e!172537 () Bool)

(assert (=> b!266742 (=> (not res!131041) (not e!172537))))

(declare-datatypes ((array!12903 0))(
  ( (array!12904 (arr!6106 (Array (_ BitVec 32) (_ BitVec 64))) (size!6458 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12903)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266742 (= res!131041 (and (= (size!6458 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6458 a!3436))))))

(declare-fun b!266743 () Bool)

(declare-fun e!172536 () Bool)

(assert (=> b!266743 (= e!172537 e!172536)))

(declare-fun res!131042 () Bool)

(assert (=> b!266743 (=> (not res!131042) (not e!172536))))

(declare-datatypes ((SeekEntryResult!1297 0))(
  ( (MissingZero!1297 (index!7358 (_ BitVec 32))) (Found!1297 (index!7359 (_ BitVec 32))) (Intermediate!1297 (undefined!2109 Bool) (index!7360 (_ BitVec 32)) (x!25654 (_ BitVec 32))) (Undefined!1297) (MissingVacant!1297 (index!7361 (_ BitVec 32))) )
))
(declare-fun lt!134517 () SeekEntryResult!1297)

(assert (=> b!266743 (= res!131042 (or (= lt!134517 (MissingZero!1297 i!1355)) (= lt!134517 (MissingVacant!1297 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12903 (_ BitVec 32)) SeekEntryResult!1297)

(assert (=> b!266743 (= lt!134517 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266744 () Bool)

(declare-fun res!131043 () Bool)

(assert (=> b!266744 (=> (not res!131043) (not e!172537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266744 (= res!131043 (validKeyInArray!0 k!2698))))

(declare-fun b!266745 () Bool)

(assert (=> b!266745 (= e!172536 false)))

(declare-fun lt!134518 () Bool)

(declare-datatypes ((List!3920 0))(
  ( (Nil!3917) (Cons!3916 (h!4583 (_ BitVec 64)) (t!9002 List!3920)) )
))
(declare-fun arrayNoDuplicates!0 (array!12903 (_ BitVec 32) List!3920) Bool)

(assert (=> b!266745 (= lt!134518 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3917))))

(declare-fun b!266746 () Bool)

(declare-fun res!131039 () Bool)

(assert (=> b!266746 (=> (not res!131039) (not e!172537))))

(declare-fun arrayContainsKey!0 (array!12903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266746 (= res!131039 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun res!131038 () Bool)

(assert (=> start!25724 (=> (not res!131038) (not e!172537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25724 (= res!131038 (validMask!0 mask!4002))))

(assert (=> start!25724 e!172537))

(assert (=> start!25724 true))

(declare-fun array_inv!4069 (array!12903) Bool)

(assert (=> start!25724 (array_inv!4069 a!3436)))

(declare-fun b!266747 () Bool)

(declare-fun res!131040 () Bool)

(assert (=> b!266747 (=> (not res!131040) (not e!172536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12903 (_ BitVec 32)) Bool)

(assert (=> b!266747 (= res!131040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25724 res!131038) b!266742))

(assert (= (and b!266742 res!131041) b!266744))

(assert (= (and b!266744 res!131043) b!266746))

(assert (= (and b!266746 res!131039) b!266743))

(assert (= (and b!266743 res!131042) b!266747))

(assert (= (and b!266747 res!131040) b!266745))

(declare-fun m!283273 () Bool)

(assert (=> start!25724 m!283273))

(declare-fun m!283275 () Bool)

(assert (=> start!25724 m!283275))

(declare-fun m!283277 () Bool)

(assert (=> b!266743 m!283277))

(declare-fun m!283279 () Bool)

(assert (=> b!266745 m!283279))

(declare-fun m!283281 () Bool)

(assert (=> b!266747 m!283281))

(declare-fun m!283283 () Bool)

(assert (=> b!266746 m!283283))

(declare-fun m!283285 () Bool)

(assert (=> b!266744 m!283285))

(push 1)

(assert (not b!266745))

(assert (not b!266744))

(assert (not b!266747))

