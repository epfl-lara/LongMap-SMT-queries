; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26336 () Bool)

(assert start!26336)

(declare-fun res!136949 () Bool)

(declare-fun e!175040 () Bool)

(assert (=> start!26336 (=> (not res!136949) (not e!175040))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26336 (= res!136949 (validMask!0 mask!3868))))

(assert (=> start!26336 e!175040))

(declare-datatypes ((array!13433 0))(
  ( (array!13434 (arr!6366 (Array (_ BitVec 32) (_ BitVec 64))) (size!6718 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13433)

(declare-fun array_inv!4329 (array!13433) Bool)

(assert (=> start!26336 (array_inv!4329 a!3325)))

(assert (=> start!26336 true))

(declare-fun b!272955 () Bool)

(declare-fun e!175043 () Bool)

(declare-fun e!175042 () Bool)

(assert (=> b!272955 (= e!175043 e!175042)))

(declare-fun res!136951 () Bool)

(assert (=> b!272955 (=> (not res!136951) (not e!175042))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272955 (= res!136951 (not (= startIndex!26 i!1267)))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136146 () array!13433)

(assert (=> b!272955 (= lt!136146 (array!13434 (store (arr!6366 a!3325) i!1267 k0!2581) (size!6718 a!3325)))))

(declare-fun b!272956 () Bool)

(declare-fun res!136952 () Bool)

(assert (=> b!272956 (=> (not res!136952) (not e!175040))))

(declare-datatypes ((List!4174 0))(
  ( (Nil!4171) (Cons!4170 (h!4837 (_ BitVec 64)) (t!9256 List!4174)) )
))
(declare-fun arrayNoDuplicates!0 (array!13433 (_ BitVec 32) List!4174) Bool)

(assert (=> b!272956 (= res!136952 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4171))))

(declare-fun b!272957 () Bool)

(declare-fun res!136948 () Bool)

(assert (=> b!272957 (=> (not res!136948) (not e!175040))))

(assert (=> b!272957 (= res!136948 (and (= (size!6718 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6718 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6718 a!3325))))))

(declare-fun b!272958 () Bool)

(assert (=> b!272958 (= e!175040 e!175043)))

(declare-fun res!136953 () Bool)

(assert (=> b!272958 (=> (not res!136953) (not e!175043))))

(declare-datatypes ((SeekEntryResult!1524 0))(
  ( (MissingZero!1524 (index!8266 (_ BitVec 32))) (Found!1524 (index!8267 (_ BitVec 32))) (Intermediate!1524 (undefined!2336 Bool) (index!8268 (_ BitVec 32)) (x!26577 (_ BitVec 32))) (Undefined!1524) (MissingVacant!1524 (index!8269 (_ BitVec 32))) )
))
(declare-fun lt!136145 () SeekEntryResult!1524)

(assert (=> b!272958 (= res!136953 (or (= lt!136145 (MissingZero!1524 i!1267)) (= lt!136145 (MissingVacant!1524 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13433 (_ BitVec 32)) SeekEntryResult!1524)

(assert (=> b!272958 (= lt!136145 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272959 () Bool)

(declare-fun res!136945 () Bool)

(assert (=> b!272959 (=> (not res!136945) (not e!175040))))

(declare-fun arrayContainsKey!0 (array!13433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272959 (= res!136945 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272960 () Bool)

(declare-fun res!136946 () Bool)

(assert (=> b!272960 (=> (not res!136946) (not e!175043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13433 (_ BitVec 32)) Bool)

(assert (=> b!272960 (= res!136946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272961 () Bool)

(assert (=> b!272961 (= e!175042 (not true))))

(assert (=> b!272961 (= (seekEntryOrOpen!0 (select (arr!6366 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6366 a!3325) i!1267 k0!2581) startIndex!26) lt!136146 mask!3868))))

(declare-datatypes ((Unit!8535 0))(
  ( (Unit!8536) )
))
(declare-fun lt!136147 () Unit!8535)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8535)

(assert (=> b!272961 (= lt!136147 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!272961 (arrayNoDuplicates!0 lt!136146 #b00000000000000000000000000000000 Nil!4171)))

(declare-fun lt!136144 () Unit!8535)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13433 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4174) Unit!8535)

(assert (=> b!272961 (= lt!136144 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4171))))

(declare-fun b!272962 () Bool)

(declare-fun res!136950 () Bool)

(assert (=> b!272962 (=> (not res!136950) (not e!175042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272962 (= res!136950 (validKeyInArray!0 (select (arr!6366 a!3325) startIndex!26)))))

(declare-fun b!272963 () Bool)

(declare-fun res!136947 () Bool)

(assert (=> b!272963 (=> (not res!136947) (not e!175040))))

(assert (=> b!272963 (= res!136947 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26336 res!136949) b!272957))

(assert (= (and b!272957 res!136948) b!272963))

(assert (= (and b!272963 res!136947) b!272956))

(assert (= (and b!272956 res!136952) b!272959))

(assert (= (and b!272959 res!136945) b!272958))

(assert (= (and b!272958 res!136953) b!272960))

(assert (= (and b!272960 res!136946) b!272955))

(assert (= (and b!272955 res!136951) b!272962))

(assert (= (and b!272962 res!136950) b!272961))

(declare-fun m!288029 () Bool)

(assert (=> b!272961 m!288029))

(declare-fun m!288031 () Bool)

(assert (=> b!272961 m!288031))

(declare-fun m!288033 () Bool)

(assert (=> b!272961 m!288033))

(declare-fun m!288035 () Bool)

(assert (=> b!272961 m!288035))

(declare-fun m!288037 () Bool)

(assert (=> b!272961 m!288037))

(declare-fun m!288039 () Bool)

(assert (=> b!272961 m!288039))

(declare-fun m!288041 () Bool)

(assert (=> b!272961 m!288041))

(assert (=> b!272961 m!288041))

(declare-fun m!288043 () Bool)

(assert (=> b!272961 m!288043))

(assert (=> b!272961 m!288035))

(declare-fun m!288045 () Bool)

(assert (=> b!272959 m!288045))

(declare-fun m!288047 () Bool)

(assert (=> start!26336 m!288047))

(declare-fun m!288049 () Bool)

(assert (=> start!26336 m!288049))

(declare-fun m!288051 () Bool)

(assert (=> b!272956 m!288051))

(declare-fun m!288053 () Bool)

(assert (=> b!272958 m!288053))

(declare-fun m!288055 () Bool)

(assert (=> b!272960 m!288055))

(assert (=> b!272962 m!288035))

(assert (=> b!272962 m!288035))

(declare-fun m!288057 () Bool)

(assert (=> b!272962 m!288057))

(declare-fun m!288059 () Bool)

(assert (=> b!272963 m!288059))

(assert (=> b!272955 m!288029))

(check-sat (not b!272958) (not b!272961) (not b!272962) (not b!272959) (not b!272956) (not b!272960) (not start!26336) (not b!272963))
(check-sat)
