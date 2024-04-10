; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26334 () Bool)

(assert start!26334)

(declare-fun b!272928 () Bool)

(declare-fun e!175028 () Bool)

(declare-fun e!175030 () Bool)

(assert (=> b!272928 (= e!175028 e!175030)))

(declare-fun res!136922 () Bool)

(assert (=> b!272928 (=> (not res!136922) (not e!175030))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272928 (= res!136922 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13431 0))(
  ( (array!13432 (arr!6365 (Array (_ BitVec 32) (_ BitVec 64))) (size!6717 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13431)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!136135 () array!13431)

(assert (=> b!272928 (= lt!136135 (array!13432 (store (arr!6365 a!3325) i!1267 k!2581) (size!6717 a!3325)))))

(declare-fun res!136918 () Bool)

(declare-fun e!175029 () Bool)

(assert (=> start!26334 (=> (not res!136918) (not e!175029))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26334 (= res!136918 (validMask!0 mask!3868))))

(assert (=> start!26334 e!175029))

(declare-fun array_inv!4328 (array!13431) Bool)

(assert (=> start!26334 (array_inv!4328 a!3325)))

(assert (=> start!26334 true))

(declare-fun b!272929 () Bool)

(declare-fun res!136921 () Bool)

(assert (=> b!272929 (=> (not res!136921) (not e!175029))))

(declare-fun arrayContainsKey!0 (array!13431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272929 (= res!136921 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272930 () Bool)

(assert (=> b!272930 (= e!175030 (not true))))

(declare-datatypes ((SeekEntryResult!1523 0))(
  ( (MissingZero!1523 (index!8262 (_ BitVec 32))) (Found!1523 (index!8263 (_ BitVec 32))) (Intermediate!1523 (undefined!2335 Bool) (index!8264 (_ BitVec 32)) (x!26576 (_ BitVec 32))) (Undefined!1523) (MissingVacant!1523 (index!8265 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13431 (_ BitVec 32)) SeekEntryResult!1523)

(assert (=> b!272930 (= (seekEntryOrOpen!0 (select (arr!6365 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6365 a!3325) i!1267 k!2581) startIndex!26) lt!136135 mask!3868))))

(declare-datatypes ((Unit!8533 0))(
  ( (Unit!8534) )
))
(declare-fun lt!136132 () Unit!8533)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8533)

(assert (=> b!272930 (= lt!136132 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4173 0))(
  ( (Nil!4170) (Cons!4169 (h!4836 (_ BitVec 64)) (t!9255 List!4173)) )
))
(declare-fun arrayNoDuplicates!0 (array!13431 (_ BitVec 32) List!4173) Bool)

(assert (=> b!272930 (arrayNoDuplicates!0 lt!136135 #b00000000000000000000000000000000 Nil!4170)))

(declare-fun lt!136134 () Unit!8533)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4173) Unit!8533)

(assert (=> b!272930 (= lt!136134 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4170))))

(declare-fun b!272931 () Bool)

(declare-fun res!136926 () Bool)

(assert (=> b!272931 (=> (not res!136926) (not e!175030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272931 (= res!136926 (validKeyInArray!0 (select (arr!6365 a!3325) startIndex!26)))))

(declare-fun b!272932 () Bool)

(assert (=> b!272932 (= e!175029 e!175028)))

(declare-fun res!136924 () Bool)

(assert (=> b!272932 (=> (not res!136924) (not e!175028))))

(declare-fun lt!136133 () SeekEntryResult!1523)

(assert (=> b!272932 (= res!136924 (or (= lt!136133 (MissingZero!1523 i!1267)) (= lt!136133 (MissingVacant!1523 i!1267))))))

(assert (=> b!272932 (= lt!136133 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272933 () Bool)

(declare-fun res!136920 () Bool)

(assert (=> b!272933 (=> (not res!136920) (not e!175029))))

(assert (=> b!272933 (= res!136920 (and (= (size!6717 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6717 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6717 a!3325))))))

(declare-fun b!272934 () Bool)

(declare-fun res!136919 () Bool)

(assert (=> b!272934 (=> (not res!136919) (not e!175029))))

(assert (=> b!272934 (= res!136919 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4170))))

(declare-fun b!272935 () Bool)

(declare-fun res!136923 () Bool)

(assert (=> b!272935 (=> (not res!136923) (not e!175029))))

(assert (=> b!272935 (= res!136923 (validKeyInArray!0 k!2581))))

(declare-fun b!272936 () Bool)

(declare-fun res!136925 () Bool)

(assert (=> b!272936 (=> (not res!136925) (not e!175028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13431 (_ BitVec 32)) Bool)

(assert (=> b!272936 (= res!136925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26334 res!136918) b!272933))

(assert (= (and b!272933 res!136920) b!272935))

(assert (= (and b!272935 res!136923) b!272934))

(assert (= (and b!272934 res!136919) b!272929))

(assert (= (and b!272929 res!136921) b!272932))

(assert (= (and b!272932 res!136924) b!272936))

(assert (= (and b!272936 res!136925) b!272928))

(assert (= (and b!272928 res!136922) b!272931))

(assert (= (and b!272931 res!136926) b!272930))

(declare-fun m!287997 () Bool)

(assert (=> start!26334 m!287997))

(declare-fun m!287999 () Bool)

(assert (=> start!26334 m!287999))

(declare-fun m!288001 () Bool)

(assert (=> b!272936 m!288001))

(declare-fun m!288003 () Bool)

(assert (=> b!272931 m!288003))

(assert (=> b!272931 m!288003))

(declare-fun m!288005 () Bool)

(assert (=> b!272931 m!288005))

(declare-fun m!288007 () Bool)

(assert (=> b!272929 m!288007))

(declare-fun m!288009 () Bool)

(assert (=> b!272934 m!288009))

(declare-fun m!288011 () Bool)

(assert (=> b!272935 m!288011))

(declare-fun m!288013 () Bool)

(assert (=> b!272928 m!288013))

(declare-fun m!288015 () Bool)

(assert (=> b!272930 m!288015))

(declare-fun m!288017 () Bool)

(assert (=> b!272930 m!288017))

(assert (=> b!272930 m!288017))

(declare-fun m!288019 () Bool)

(assert (=> b!272930 m!288019))

(assert (=> b!272930 m!288013))

(assert (=> b!272930 m!288003))

(declare-fun m!288021 () Bool)

(assert (=> b!272930 m!288021))

(declare-fun m!288023 () Bool)

(assert (=> b!272930 m!288023))

(assert (=> b!272930 m!288003))

(declare-fun m!288025 () Bool)

(assert (=> b!272930 m!288025))

(declare-fun m!288027 () Bool)

(assert (=> b!272932 m!288027))

(push 1)

