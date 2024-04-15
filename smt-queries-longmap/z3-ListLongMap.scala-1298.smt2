; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26348 () Bool)

(assert start!26348)

(declare-fun b!272943 () Bool)

(declare-fun res!136986 () Bool)

(declare-fun e!174999 () Bool)

(assert (=> b!272943 (=> (not res!136986) (not e!174999))))

(declare-datatypes ((array!13434 0))(
  ( (array!13435 (arr!6366 (Array (_ BitVec 32) (_ BitVec 64))) (size!6719 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13434)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13434 (_ BitVec 32)) Bool)

(assert (=> b!272943 (= res!136986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272944 () Bool)

(declare-fun res!136990 () Bool)

(declare-fun e!175002 () Bool)

(assert (=> b!272944 (=> (not res!136990) (not e!175002))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272944 (= res!136990 (and (= (size!6719 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6719 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6719 a!3325))))))

(declare-fun b!272946 () Bool)

(declare-fun e!175001 () Bool)

(assert (=> b!272946 (= e!174999 e!175001)))

(declare-fun res!136989 () Bool)

(assert (=> b!272946 (=> (not res!136989) (not e!175001))))

(assert (=> b!272946 (= res!136989 (not (= startIndex!26 i!1267)))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136024 () array!13434)

(assert (=> b!272946 (= lt!136024 (array!13435 (store (arr!6366 a!3325) i!1267 k0!2581) (size!6719 a!3325)))))

(declare-fun b!272947 () Bool)

(declare-fun res!136992 () Bool)

(assert (=> b!272947 (=> (not res!136992) (not e!175002))))

(declare-fun arrayContainsKey!0 (array!13434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272947 (= res!136992 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272948 () Bool)

(assert (=> b!272948 (= e!175001 (not true))))

(declare-datatypes ((SeekEntryResult!1523 0))(
  ( (MissingZero!1523 (index!8262 (_ BitVec 32))) (Found!1523 (index!8263 (_ BitVec 32))) (Intermediate!1523 (undefined!2335 Bool) (index!8264 (_ BitVec 32)) (x!26591 (_ BitVec 32))) (Undefined!1523) (MissingVacant!1523 (index!8265 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13434 (_ BitVec 32)) SeekEntryResult!1523)

(assert (=> b!272948 (= (seekEntryOrOpen!0 (select (arr!6366 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6366 a!3325) i!1267 k0!2581) startIndex!26) lt!136024 mask!3868))))

(declare-datatypes ((Unit!8499 0))(
  ( (Unit!8500) )
))
(declare-fun lt!136026 () Unit!8499)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13434 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8499)

(assert (=> b!272948 (= lt!136026 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4147 0))(
  ( (Nil!4144) (Cons!4143 (h!4810 (_ BitVec 64)) (t!9220 List!4147)) )
))
(declare-fun arrayNoDuplicates!0 (array!13434 (_ BitVec 32) List!4147) Bool)

(assert (=> b!272948 (arrayNoDuplicates!0 lt!136024 #b00000000000000000000000000000000 Nil!4144)))

(declare-fun lt!136023 () Unit!8499)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13434 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4147) Unit!8499)

(assert (=> b!272948 (= lt!136023 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4144))))

(declare-fun b!272949 () Bool)

(assert (=> b!272949 (= e!175002 e!174999)))

(declare-fun res!136987 () Bool)

(assert (=> b!272949 (=> (not res!136987) (not e!174999))))

(declare-fun lt!136025 () SeekEntryResult!1523)

(assert (=> b!272949 (= res!136987 (or (= lt!136025 (MissingZero!1523 i!1267)) (= lt!136025 (MissingVacant!1523 i!1267))))))

(assert (=> b!272949 (= lt!136025 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272950 () Bool)

(declare-fun res!136993 () Bool)

(assert (=> b!272950 (=> (not res!136993) (not e!175002))))

(assert (=> b!272950 (= res!136993 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4144))))

(declare-fun b!272951 () Bool)

(declare-fun res!136988 () Bool)

(assert (=> b!272951 (=> (not res!136988) (not e!175001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272951 (= res!136988 (validKeyInArray!0 (select (arr!6366 a!3325) startIndex!26)))))

(declare-fun res!136991 () Bool)

(assert (=> start!26348 (=> (not res!136991) (not e!175002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26348 (= res!136991 (validMask!0 mask!3868))))

(assert (=> start!26348 e!175002))

(declare-fun array_inv!4338 (array!13434) Bool)

(assert (=> start!26348 (array_inv!4338 a!3325)))

(assert (=> start!26348 true))

(declare-fun b!272945 () Bool)

(declare-fun res!136985 () Bool)

(assert (=> b!272945 (=> (not res!136985) (not e!175002))))

(assert (=> b!272945 (= res!136985 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26348 res!136991) b!272944))

(assert (= (and b!272944 res!136990) b!272945))

(assert (= (and b!272945 res!136985) b!272950))

(assert (= (and b!272950 res!136993) b!272947))

(assert (= (and b!272947 res!136992) b!272949))

(assert (= (and b!272949 res!136987) b!272943))

(assert (= (and b!272943 res!136986) b!272946))

(assert (= (and b!272946 res!136989) b!272951))

(assert (= (and b!272951 res!136988) b!272948))

(declare-fun m!287597 () Bool)

(assert (=> b!272948 m!287597))

(declare-fun m!287599 () Bool)

(assert (=> b!272948 m!287599))

(assert (=> b!272948 m!287597))

(declare-fun m!287601 () Bool)

(assert (=> b!272948 m!287601))

(declare-fun m!287603 () Bool)

(assert (=> b!272948 m!287603))

(declare-fun m!287605 () Bool)

(assert (=> b!272948 m!287605))

(declare-fun m!287607 () Bool)

(assert (=> b!272948 m!287607))

(declare-fun m!287609 () Bool)

(assert (=> b!272948 m!287609))

(assert (=> b!272948 m!287605))

(declare-fun m!287611 () Bool)

(assert (=> b!272948 m!287611))

(declare-fun m!287613 () Bool)

(assert (=> b!272943 m!287613))

(declare-fun m!287615 () Bool)

(assert (=> start!26348 m!287615))

(declare-fun m!287617 () Bool)

(assert (=> start!26348 m!287617))

(declare-fun m!287619 () Bool)

(assert (=> b!272950 m!287619))

(declare-fun m!287621 () Bool)

(assert (=> b!272947 m!287621))

(assert (=> b!272951 m!287605))

(assert (=> b!272951 m!287605))

(declare-fun m!287623 () Bool)

(assert (=> b!272951 m!287623))

(declare-fun m!287625 () Bool)

(assert (=> b!272945 m!287625))

(assert (=> b!272946 m!287603))

(declare-fun m!287627 () Bool)

(assert (=> b!272949 m!287627))

(check-sat (not b!272949) (not b!272943) (not b!272947) (not b!272950) (not b!272951) (not start!26348) (not b!272945) (not b!272948))
(check-sat)
