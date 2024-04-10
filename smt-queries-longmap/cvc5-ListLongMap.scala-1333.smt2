; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26556 () Bool)

(assert start!26556)

(declare-fun b!275648 () Bool)

(declare-fun res!139646 () Bool)

(declare-fun e!176279 () Bool)

(assert (=> b!275648 (=> (not res!139646) (not e!176279))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275648 (= res!139646 (validKeyInArray!0 k!2581))))

(declare-fun b!275649 () Bool)

(declare-fun res!139639 () Bool)

(assert (=> b!275649 (=> (not res!139639) (not e!176279))))

(declare-datatypes ((array!13653 0))(
  ( (array!13654 (arr!6476 (Array (_ BitVec 32) (_ BitVec 64))) (size!6828 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13653)

(declare-datatypes ((List!4284 0))(
  ( (Nil!4281) (Cons!4280 (h!4947 (_ BitVec 64)) (t!9366 List!4284)) )
))
(declare-fun arrayNoDuplicates!0 (array!13653 (_ BitVec 32) List!4284) Bool)

(assert (=> b!275649 (= res!139639 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4281))))

(declare-fun b!275650 () Bool)

(declare-fun e!176278 () Bool)

(assert (=> b!275650 (= e!176279 e!176278)))

(declare-fun res!139647 () Bool)

(assert (=> b!275650 (=> (not res!139647) (not e!176278))))

(declare-datatypes ((SeekEntryResult!1634 0))(
  ( (MissingZero!1634 (index!8706 (_ BitVec 32))) (Found!1634 (index!8707 (_ BitVec 32))) (Intermediate!1634 (undefined!2446 Bool) (index!8708 (_ BitVec 32)) (x!26983 (_ BitVec 32))) (Undefined!1634) (MissingVacant!1634 (index!8709 (_ BitVec 32))) )
))
(declare-fun lt!137443 () SeekEntryResult!1634)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275650 (= res!139647 (or (= lt!137443 (MissingZero!1634 i!1267)) (= lt!137443 (MissingVacant!1634 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13653 (_ BitVec 32)) SeekEntryResult!1634)

(assert (=> b!275650 (= lt!137443 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275651 () Bool)

(assert (=> b!275651 (= e!176278 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13653 (_ BitVec 32)) Bool)

(assert (=> b!275651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13654 (store (arr!6476 a!3325) i!1267 k!2581) (size!6828 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8683 0))(
  ( (Unit!8684) )
))
(declare-fun lt!137442 () Unit!8683)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13653 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8683)

(assert (=> b!275651 (= lt!137442 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275652 () Bool)

(declare-fun res!139645 () Bool)

(assert (=> b!275652 (=> (not res!139645) (not e!176278))))

(assert (=> b!275652 (= res!139645 (not (= startIndex!26 i!1267)))))

(declare-fun b!275653 () Bool)

(declare-fun res!139643 () Bool)

(assert (=> b!275653 (=> (not res!139643) (not e!176278))))

(assert (=> b!275653 (= res!139643 (not (validKeyInArray!0 (select (arr!6476 a!3325) startIndex!26))))))

(declare-fun res!139644 () Bool)

(assert (=> start!26556 (=> (not res!139644) (not e!176279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26556 (= res!139644 (validMask!0 mask!3868))))

(assert (=> start!26556 e!176279))

(declare-fun array_inv!4439 (array!13653) Bool)

(assert (=> start!26556 (array_inv!4439 a!3325)))

(assert (=> start!26556 true))

(declare-fun b!275654 () Bool)

(declare-fun res!139638 () Bool)

(assert (=> b!275654 (=> (not res!139638) (not e!176278))))

(assert (=> b!275654 (= res!139638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275655 () Bool)

(declare-fun res!139642 () Bool)

(assert (=> b!275655 (=> (not res!139642) (not e!176279))))

(assert (=> b!275655 (= res!139642 (and (= (size!6828 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6828 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6828 a!3325))))))

(declare-fun b!275656 () Bool)

(declare-fun res!139640 () Bool)

(assert (=> b!275656 (=> (not res!139640) (not e!176279))))

(declare-fun arrayContainsKey!0 (array!13653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275656 (= res!139640 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275657 () Bool)

(declare-fun res!139641 () Bool)

(assert (=> b!275657 (=> (not res!139641) (not e!176278))))

(assert (=> b!275657 (= res!139641 (and (bvslt startIndex!26 (bvsub (size!6828 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (= (and start!26556 res!139644) b!275655))

(assert (= (and b!275655 res!139642) b!275648))

(assert (= (and b!275648 res!139646) b!275649))

(assert (= (and b!275649 res!139639) b!275656))

(assert (= (and b!275656 res!139640) b!275650))

(assert (= (and b!275650 res!139647) b!275654))

(assert (= (and b!275654 res!139638) b!275652))

(assert (= (and b!275652 res!139645) b!275653))

(assert (= (and b!275653 res!139643) b!275657))

(assert (= (and b!275657 res!139641) b!275651))

(declare-fun m!291165 () Bool)

(assert (=> b!275648 m!291165))

(declare-fun m!291167 () Bool)

(assert (=> b!275649 m!291167))

(declare-fun m!291169 () Bool)

(assert (=> b!275653 m!291169))

(assert (=> b!275653 m!291169))

(declare-fun m!291171 () Bool)

(assert (=> b!275653 m!291171))

(declare-fun m!291173 () Bool)

(assert (=> start!26556 m!291173))

(declare-fun m!291175 () Bool)

(assert (=> start!26556 m!291175))

(declare-fun m!291177 () Bool)

(assert (=> b!275654 m!291177))

(declare-fun m!291179 () Bool)

(assert (=> b!275651 m!291179))

(declare-fun m!291181 () Bool)

(assert (=> b!275651 m!291181))

(declare-fun m!291183 () Bool)

(assert (=> b!275651 m!291183))

(declare-fun m!291185 () Bool)

(assert (=> b!275650 m!291185))

(declare-fun m!291187 () Bool)

(assert (=> b!275656 m!291187))

(push 1)

