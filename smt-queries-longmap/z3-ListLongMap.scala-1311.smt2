; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26424 () Bool)

(assert start!26424)

(declare-fun b!274190 () Bool)

(declare-fun res!138161 () Bool)

(declare-fun e!175592 () Bool)

(assert (=> b!274190 (=> (not res!138161) (not e!175592))))

(declare-datatypes ((array!13520 0))(
  ( (array!13521 (arr!6409 (Array (_ BitVec 32) (_ BitVec 64))) (size!6761 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13520)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13520 (_ BitVec 32)) Bool)

(assert (=> b!274190 (= res!138161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!138154 () Bool)

(declare-fun e!175593 () Bool)

(assert (=> start!26424 (=> (not res!138154) (not e!175593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26424 (= res!138154 (validMask!0 mask!3868))))

(assert (=> start!26424 e!175593))

(declare-fun array_inv!4359 (array!13520) Bool)

(assert (=> start!26424 (array_inv!4359 a!3325)))

(assert (=> start!26424 true))

(declare-fun b!274191 () Bool)

(declare-fun res!138155 () Bool)

(declare-fun e!175595 () Bool)

(assert (=> b!274191 (=> (not res!138155) (not e!175595))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274191 (= res!138155 (validKeyInArray!0 (select (arr!6409 a!3325) startIndex!26)))))

(declare-fun b!274192 () Bool)

(declare-fun res!138157 () Bool)

(assert (=> b!274192 (=> (not res!138157) (not e!175593))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!274192 (= res!138157 (validKeyInArray!0 k0!2581))))

(declare-fun b!274193 () Bool)

(assert (=> b!274193 (= e!175595 (not true))))

(assert (=> b!274193 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8603 0))(
  ( (Unit!8604) )
))
(declare-fun lt!136835 () Unit!8603)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8603)

(assert (=> b!274193 (= lt!136835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136832 () array!13520)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1532 0))(
  ( (MissingZero!1532 (index!8298 (_ BitVec 32))) (Found!1532 (index!8299 (_ BitVec 32))) (Intermediate!1532 (undefined!2344 Bool) (index!8300 (_ BitVec 32)) (x!26705 (_ BitVec 32))) (Undefined!1532) (MissingVacant!1532 (index!8301 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13520 (_ BitVec 32)) SeekEntryResult!1532)

(assert (=> b!274193 (= (seekEntryOrOpen!0 (select (arr!6409 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6409 a!3325) i!1267 k0!2581) startIndex!26) lt!136832 mask!3868))))

(declare-fun lt!136834 () Unit!8603)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13520 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8603)

(assert (=> b!274193 (= lt!136834 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4130 0))(
  ( (Nil!4127) (Cons!4126 (h!4793 (_ BitVec 64)) (t!9204 List!4130)) )
))
(declare-fun arrayNoDuplicates!0 (array!13520 (_ BitVec 32) List!4130) Bool)

(assert (=> b!274193 (arrayNoDuplicates!0 lt!136832 #b00000000000000000000000000000000 Nil!4127)))

(declare-fun lt!136833 () Unit!8603)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4130) Unit!8603)

(assert (=> b!274193 (= lt!136833 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4127))))

(declare-fun b!274194 () Bool)

(assert (=> b!274194 (= e!175592 e!175595)))

(declare-fun res!138159 () Bool)

(assert (=> b!274194 (=> (not res!138159) (not e!175595))))

(assert (=> b!274194 (= res!138159 (not (= startIndex!26 i!1267)))))

(assert (=> b!274194 (= lt!136832 (array!13521 (store (arr!6409 a!3325) i!1267 k0!2581) (size!6761 a!3325)))))

(declare-fun b!274195 () Bool)

(declare-fun res!138156 () Bool)

(assert (=> b!274195 (=> (not res!138156) (not e!175593))))

(assert (=> b!274195 (= res!138156 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4127))))

(declare-fun b!274196 () Bool)

(declare-fun res!138160 () Bool)

(assert (=> b!274196 (=> (not res!138160) (not e!175593))))

(assert (=> b!274196 (= res!138160 (and (= (size!6761 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6761 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6761 a!3325))))))

(declare-fun b!274197 () Bool)

(assert (=> b!274197 (= e!175593 e!175592)))

(declare-fun res!138158 () Bool)

(assert (=> b!274197 (=> (not res!138158) (not e!175592))))

(declare-fun lt!136836 () SeekEntryResult!1532)

(assert (=> b!274197 (= res!138158 (or (= lt!136836 (MissingZero!1532 i!1267)) (= lt!136836 (MissingVacant!1532 i!1267))))))

(assert (=> b!274197 (= lt!136836 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274198 () Bool)

(declare-fun res!138162 () Bool)

(assert (=> b!274198 (=> (not res!138162) (not e!175593))))

(declare-fun arrayContainsKey!0 (array!13520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274198 (= res!138162 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26424 res!138154) b!274196))

(assert (= (and b!274196 res!138160) b!274192))

(assert (= (and b!274192 res!138157) b!274195))

(assert (= (and b!274195 res!138156) b!274198))

(assert (= (and b!274198 res!138162) b!274197))

(assert (= (and b!274197 res!138158) b!274190))

(assert (= (and b!274190 res!138161) b!274194))

(assert (= (and b!274194 res!138159) b!274191))

(assert (= (and b!274191 res!138155) b!274193))

(declare-fun m!289775 () Bool)

(assert (=> b!274191 m!289775))

(assert (=> b!274191 m!289775))

(declare-fun m!289777 () Bool)

(assert (=> b!274191 m!289777))

(declare-fun m!289779 () Bool)

(assert (=> b!274197 m!289779))

(declare-fun m!289781 () Bool)

(assert (=> b!274194 m!289781))

(declare-fun m!289783 () Bool)

(assert (=> b!274195 m!289783))

(declare-fun m!289785 () Bool)

(assert (=> b!274193 m!289785))

(declare-fun m!289787 () Bool)

(assert (=> b!274193 m!289787))

(declare-fun m!289789 () Bool)

(assert (=> b!274193 m!289789))

(assert (=> b!274193 m!289787))

(assert (=> b!274193 m!289781))

(declare-fun m!289791 () Bool)

(assert (=> b!274193 m!289791))

(assert (=> b!274193 m!289775))

(declare-fun m!289793 () Bool)

(assert (=> b!274193 m!289793))

(declare-fun m!289795 () Bool)

(assert (=> b!274193 m!289795))

(declare-fun m!289797 () Bool)

(assert (=> b!274193 m!289797))

(assert (=> b!274193 m!289775))

(declare-fun m!289799 () Bool)

(assert (=> b!274193 m!289799))

(declare-fun m!289801 () Bool)

(assert (=> b!274198 m!289801))

(declare-fun m!289803 () Bool)

(assert (=> start!26424 m!289803))

(declare-fun m!289805 () Bool)

(assert (=> start!26424 m!289805))

(declare-fun m!289807 () Bool)

(assert (=> b!274190 m!289807))

(declare-fun m!289809 () Bool)

(assert (=> b!274192 m!289809))

(check-sat (not b!274198) (not b!274190) (not b!274193) (not b!274191) (not b!274195) (not b!274192) (not start!26424) (not b!274197))
(check-sat)
