; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26568 () Bool)

(assert start!26568)

(declare-fun b!275828 () Bool)

(declare-fun e!176333 () Bool)

(declare-fun e!176331 () Bool)

(assert (=> b!275828 (= e!176333 e!176331)))

(declare-fun res!139822 () Bool)

(assert (=> b!275828 (=> (not res!139822) (not e!176331))))

(declare-datatypes ((SeekEntryResult!1640 0))(
  ( (MissingZero!1640 (index!8730 (_ BitVec 32))) (Found!1640 (index!8731 (_ BitVec 32))) (Intermediate!1640 (undefined!2452 Bool) (index!8732 (_ BitVec 32)) (x!27005 (_ BitVec 32))) (Undefined!1640) (MissingVacant!1640 (index!8733 (_ BitVec 32))) )
))
(declare-fun lt!137478 () SeekEntryResult!1640)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275828 (= res!139822 (or (= lt!137478 (MissingZero!1640 i!1267)) (= lt!137478 (MissingVacant!1640 i!1267))))))

(declare-datatypes ((array!13665 0))(
  ( (array!13666 (arr!6482 (Array (_ BitVec 32) (_ BitVec 64))) (size!6834 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13665)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13665 (_ BitVec 32)) SeekEntryResult!1640)

(assert (=> b!275828 (= lt!137478 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275829 () Bool)

(declare-fun res!139820 () Bool)

(assert (=> b!275829 (=> (not res!139820) (not e!176331))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275829 (= res!139820 (and (bvslt startIndex!26 (bvsub (size!6834 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun res!139821 () Bool)

(assert (=> start!26568 (=> (not res!139821) (not e!176333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26568 (= res!139821 (validMask!0 mask!3868))))

(assert (=> start!26568 e!176333))

(declare-fun array_inv!4445 (array!13665) Bool)

(assert (=> start!26568 (array_inv!4445 a!3325)))

(assert (=> start!26568 true))

(declare-fun b!275830 () Bool)

(declare-fun res!139819 () Bool)

(assert (=> b!275830 (=> (not res!139819) (not e!176333))))

(declare-fun arrayContainsKey!0 (array!13665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275830 (= res!139819 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275831 () Bool)

(assert (=> b!275831 (= e!176331 (not (bvsle startIndex!26 (size!6834 a!3325))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13665 (_ BitVec 32)) Bool)

(assert (=> b!275831 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13666 (store (arr!6482 a!3325) i!1267 k!2581) (size!6834 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8695 0))(
  ( (Unit!8696) )
))
(declare-fun lt!137479 () Unit!8695)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8695)

(assert (=> b!275831 (= lt!137479 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275832 () Bool)

(declare-fun res!139823 () Bool)

(assert (=> b!275832 (=> (not res!139823) (not e!176331))))

(assert (=> b!275832 (= res!139823 (not (= startIndex!26 i!1267)))))

(declare-fun b!275833 () Bool)

(declare-fun res!139826 () Bool)

(assert (=> b!275833 (=> (not res!139826) (not e!176333))))

(declare-datatypes ((List!4290 0))(
  ( (Nil!4287) (Cons!4286 (h!4953 (_ BitVec 64)) (t!9372 List!4290)) )
))
(declare-fun arrayNoDuplicates!0 (array!13665 (_ BitVec 32) List!4290) Bool)

(assert (=> b!275833 (= res!139826 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4287))))

(declare-fun b!275834 () Bool)

(declare-fun res!139824 () Bool)

(assert (=> b!275834 (=> (not res!139824) (not e!176331))))

(assert (=> b!275834 (= res!139824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275835 () Bool)

(declare-fun res!139825 () Bool)

(assert (=> b!275835 (=> (not res!139825) (not e!176331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275835 (= res!139825 (not (validKeyInArray!0 (select (arr!6482 a!3325) startIndex!26))))))

(declare-fun b!275836 () Bool)

(declare-fun res!139818 () Bool)

(assert (=> b!275836 (=> (not res!139818) (not e!176333))))

(assert (=> b!275836 (= res!139818 (validKeyInArray!0 k!2581))))

(declare-fun b!275837 () Bool)

(declare-fun res!139827 () Bool)

(assert (=> b!275837 (=> (not res!139827) (not e!176333))))

(assert (=> b!275837 (= res!139827 (and (= (size!6834 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6834 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6834 a!3325))))))

(assert (= (and start!26568 res!139821) b!275837))

(assert (= (and b!275837 res!139827) b!275836))

(assert (= (and b!275836 res!139818) b!275833))

(assert (= (and b!275833 res!139826) b!275830))

(assert (= (and b!275830 res!139819) b!275828))

(assert (= (and b!275828 res!139822) b!275834))

(assert (= (and b!275834 res!139824) b!275832))

(assert (= (and b!275832 res!139823) b!275835))

(assert (= (and b!275835 res!139825) b!275829))

(assert (= (and b!275829 res!139820) b!275831))

(declare-fun m!291309 () Bool)

(assert (=> b!275834 m!291309))

(declare-fun m!291311 () Bool)

(assert (=> b!275830 m!291311))

(declare-fun m!291313 () Bool)

(assert (=> b!275835 m!291313))

(assert (=> b!275835 m!291313))

(declare-fun m!291315 () Bool)

(assert (=> b!275835 m!291315))

(declare-fun m!291317 () Bool)

(assert (=> b!275831 m!291317))

(declare-fun m!291319 () Bool)

(assert (=> b!275831 m!291319))

(declare-fun m!291321 () Bool)

(assert (=> b!275831 m!291321))

(declare-fun m!291323 () Bool)

(assert (=> start!26568 m!291323))

(declare-fun m!291325 () Bool)

(assert (=> start!26568 m!291325))

(declare-fun m!291327 () Bool)

(assert (=> b!275828 m!291327))

(declare-fun m!291329 () Bool)

(assert (=> b!275833 m!291329))

(declare-fun m!291331 () Bool)

(assert (=> b!275836 m!291331))

(push 1)

(assert (not b!275833))

(assert (not b!275831))

(assert (not b!275836))

(assert (not b!275835))

(assert (not b!275830))

(assert (not start!26568))

(assert (not b!275828))

(assert (not b!275834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

