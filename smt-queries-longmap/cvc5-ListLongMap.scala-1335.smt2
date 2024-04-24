; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26572 () Bool)

(assert start!26572)

(declare-fun b!275935 () Bool)

(declare-fun res!139900 () Bool)

(declare-fun e!176375 () Bool)

(assert (=> b!275935 (=> (not res!139900) (not e!176375))))

(declare-datatypes ((array!13668 0))(
  ( (array!13669 (arr!6483 (Array (_ BitVec 32) (_ BitVec 64))) (size!6835 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13668)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275935 (= res!139900 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275936 () Bool)

(declare-fun res!139899 () Bool)

(declare-fun e!176374 () Bool)

(assert (=> b!275936 (=> (not res!139899) (not e!176374))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13668 (_ BitVec 32)) Bool)

(assert (=> b!275936 (= res!139899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275937 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275937 (= e!176374 (not (bvsle startIndex!26 (size!6835 a!3325))))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275937 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13669 (store (arr!6483 a!3325) i!1267 k!2581) (size!6835 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8679 0))(
  ( (Unit!8680) )
))
(declare-fun lt!137550 () Unit!8679)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13668 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8679)

(assert (=> b!275937 (= lt!137550 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275938 () Bool)

(declare-fun res!139905 () Bool)

(assert (=> b!275938 (=> (not res!139905) (not e!176375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275938 (= res!139905 (validKeyInArray!0 k!2581))))

(declare-fun b!275939 () Bool)

(declare-fun res!139906 () Bool)

(assert (=> b!275939 (=> (not res!139906) (not e!176375))))

(declare-datatypes ((List!4204 0))(
  ( (Nil!4201) (Cons!4200 (h!4867 (_ BitVec 64)) (t!9278 List!4204)) )
))
(declare-fun arrayNoDuplicates!0 (array!13668 (_ BitVec 32) List!4204) Bool)

(assert (=> b!275939 (= res!139906 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4201))))

(declare-fun b!275940 () Bool)

(declare-fun res!139908 () Bool)

(assert (=> b!275940 (=> (not res!139908) (not e!176374))))

(assert (=> b!275940 (= res!139908 (not (validKeyInArray!0 (select (arr!6483 a!3325) startIndex!26))))))

(declare-fun b!275941 () Bool)

(assert (=> b!275941 (= e!176375 e!176374)))

(declare-fun res!139904 () Bool)

(assert (=> b!275941 (=> (not res!139904) (not e!176374))))

(declare-datatypes ((SeekEntryResult!1606 0))(
  ( (MissingZero!1606 (index!8594 (_ BitVec 32))) (Found!1606 (index!8595 (_ BitVec 32))) (Intermediate!1606 (undefined!2418 Bool) (index!8596 (_ BitVec 32)) (x!26971 (_ BitVec 32))) (Undefined!1606) (MissingVacant!1606 (index!8597 (_ BitVec 32))) )
))
(declare-fun lt!137549 () SeekEntryResult!1606)

(assert (=> b!275941 (= res!139904 (or (= lt!137549 (MissingZero!1606 i!1267)) (= lt!137549 (MissingVacant!1606 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13668 (_ BitVec 32)) SeekEntryResult!1606)

(assert (=> b!275941 (= lt!137549 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275942 () Bool)

(declare-fun res!139902 () Bool)

(assert (=> b!275942 (=> (not res!139902) (not e!176375))))

(assert (=> b!275942 (= res!139902 (and (= (size!6835 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6835 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6835 a!3325))))))

(declare-fun b!275943 () Bool)

(declare-fun res!139903 () Bool)

(assert (=> b!275943 (=> (not res!139903) (not e!176374))))

(assert (=> b!275943 (= res!139903 (and (bvslt startIndex!26 (bvsub (size!6835 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun res!139907 () Bool)

(assert (=> start!26572 (=> (not res!139907) (not e!176375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26572 (= res!139907 (validMask!0 mask!3868))))

(assert (=> start!26572 e!176375))

(declare-fun array_inv!4433 (array!13668) Bool)

(assert (=> start!26572 (array_inv!4433 a!3325)))

(assert (=> start!26572 true))

(declare-fun b!275944 () Bool)

(declare-fun res!139901 () Bool)

(assert (=> b!275944 (=> (not res!139901) (not e!176374))))

(assert (=> b!275944 (= res!139901 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26572 res!139907) b!275942))

(assert (= (and b!275942 res!139902) b!275938))

(assert (= (and b!275938 res!139905) b!275939))

(assert (= (and b!275939 res!139906) b!275935))

(assert (= (and b!275935 res!139900) b!275941))

(assert (= (and b!275941 res!139904) b!275936))

(assert (= (and b!275936 res!139899) b!275944))

(assert (= (and b!275944 res!139901) b!275940))

(assert (= (and b!275940 res!139908) b!275943))

(assert (= (and b!275943 res!139903) b!275937))

(declare-fun m!291563 () Bool)

(assert (=> b!275937 m!291563))

(declare-fun m!291565 () Bool)

(assert (=> b!275937 m!291565))

(declare-fun m!291567 () Bool)

(assert (=> b!275937 m!291567))

(declare-fun m!291569 () Bool)

(assert (=> b!275940 m!291569))

(assert (=> b!275940 m!291569))

(declare-fun m!291571 () Bool)

(assert (=> b!275940 m!291571))

(declare-fun m!291573 () Bool)

(assert (=> start!26572 m!291573))

(declare-fun m!291575 () Bool)

(assert (=> start!26572 m!291575))

(declare-fun m!291577 () Bool)

(assert (=> b!275936 m!291577))

(declare-fun m!291579 () Bool)

(assert (=> b!275941 m!291579))

(declare-fun m!291581 () Bool)

(assert (=> b!275935 m!291581))

(declare-fun m!291583 () Bool)

(assert (=> b!275938 m!291583))

(declare-fun m!291585 () Bool)

(assert (=> b!275939 m!291585))

(push 1)

(assert (not b!275935))

(assert (not b!275941))

(assert (not start!26572))

(assert (not b!275939))

(assert (not b!275936))

(assert (not b!275938))

(assert (not b!275940))

(assert (not b!275937))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

