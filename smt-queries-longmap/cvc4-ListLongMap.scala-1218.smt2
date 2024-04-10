; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25778 () Bool)

(assert start!25778)

(declare-fun b!267253 () Bool)

(declare-fun res!131553 () Bool)

(declare-fun e!172781 () Bool)

(assert (=> b!267253 (=> (not res!131553) (not e!172781))))

(declare-datatypes ((array!12957 0))(
  ( (array!12958 (arr!6133 (Array (_ BitVec 32) (_ BitVec 64))) (size!6485 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12957)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267253 (= res!131553 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267254 () Bool)

(declare-fun res!131550 () Bool)

(assert (=> b!267254 (=> (not res!131550) (not e!172781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267254 (= res!131550 (validKeyInArray!0 k!2698))))

(declare-fun b!267255 () Bool)

(declare-fun res!131552 () Bool)

(declare-fun e!172780 () Bool)

(assert (=> b!267255 (=> (not res!131552) (not e!172780))))

(declare-datatypes ((List!3947 0))(
  ( (Nil!3944) (Cons!3943 (h!4610 (_ BitVec 64)) (t!9029 List!3947)) )
))
(declare-fun arrayNoDuplicates!0 (array!12957 (_ BitVec 32) List!3947) Bool)

(assert (=> b!267255 (= res!131552 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3944))))

(declare-fun res!131551 () Bool)

(assert (=> start!25778 (=> (not res!131551) (not e!172781))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25778 (= res!131551 (validMask!0 mask!4002))))

(assert (=> start!25778 e!172781))

(assert (=> start!25778 true))

(declare-fun array_inv!4096 (array!12957) Bool)

(assert (=> start!25778 (array_inv!4096 a!3436)))

(declare-fun b!267256 () Bool)

(declare-fun res!131549 () Bool)

(assert (=> b!267256 (=> (not res!131549) (not e!172780))))

(assert (=> b!267256 (= res!131549 (bvslt #b00000000000000000000000000000000 (size!6485 a!3436)))))

(declare-fun b!267257 () Bool)

(declare-fun res!131555 () Bool)

(assert (=> b!267257 (=> (not res!131555) (not e!172780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12957 (_ BitVec 32)) Bool)

(assert (=> b!267257 (= res!131555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267258 () Bool)

(assert (=> b!267258 (= e!172780 (not true))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12958 (store (arr!6133 a!3436) i!1355 k!2698) (size!6485 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8297 0))(
  ( (Unit!8298) )
))
(declare-fun lt!134670 () Unit!8297)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12957 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8297)

(assert (=> b!267258 (= lt!134670 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!267259 () Bool)

(declare-fun res!131556 () Bool)

(assert (=> b!267259 (=> (not res!131556) (not e!172781))))

(assert (=> b!267259 (= res!131556 (and (= (size!6485 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6485 a!3436))))))

(declare-fun b!267260 () Bool)

(assert (=> b!267260 (= e!172781 e!172780)))

(declare-fun res!131554 () Bool)

(assert (=> b!267260 (=> (not res!131554) (not e!172780))))

(declare-datatypes ((SeekEntryResult!1324 0))(
  ( (MissingZero!1324 (index!7466 (_ BitVec 32))) (Found!1324 (index!7467 (_ BitVec 32))) (Intermediate!1324 (undefined!2136 Bool) (index!7468 (_ BitVec 32)) (x!25753 (_ BitVec 32))) (Undefined!1324) (MissingVacant!1324 (index!7469 (_ BitVec 32))) )
))
(declare-fun lt!134671 () SeekEntryResult!1324)

(assert (=> b!267260 (= res!131554 (or (= lt!134671 (MissingZero!1324 i!1355)) (= lt!134671 (MissingVacant!1324 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12957 (_ BitVec 32)) SeekEntryResult!1324)

(assert (=> b!267260 (= lt!134671 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(assert (= (and start!25778 res!131551) b!267259))

(assert (= (and b!267259 res!131556) b!267254))

(assert (= (and b!267254 res!131550) b!267253))

(assert (= (and b!267253 res!131553) b!267260))

(assert (= (and b!267260 res!131554) b!267257))

(assert (= (and b!267257 res!131555) b!267255))

(assert (= (and b!267255 res!131552) b!267256))

(assert (= (and b!267256 res!131549) b!267258))

(declare-fun m!283663 () Bool)

(assert (=> b!267255 m!283663))

(declare-fun m!283665 () Bool)

(assert (=> b!267258 m!283665))

(declare-fun m!283667 () Bool)

(assert (=> b!267258 m!283667))

(declare-fun m!283669 () Bool)

(assert (=> b!267258 m!283669))

(declare-fun m!283671 () Bool)

(assert (=> b!267257 m!283671))

(declare-fun m!283673 () Bool)

(assert (=> b!267253 m!283673))

(declare-fun m!283675 () Bool)

(assert (=> start!25778 m!283675))

(declare-fun m!283677 () Bool)

(assert (=> start!25778 m!283677))

(declare-fun m!283679 () Bool)

(assert (=> b!267260 m!283679))

(declare-fun m!283681 () Bool)

(assert (=> b!267254 m!283681))

(push 1)

(assert (not b!267253))

(assert (not start!25778))

(assert (not b!267255))

(assert (not b!267258))

(assert (not b!267257))

(assert (not b!267254))

(assert (not b!267260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

