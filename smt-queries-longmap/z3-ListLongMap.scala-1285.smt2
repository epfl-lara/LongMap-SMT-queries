; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26270 () Bool)

(assert start!26270)

(declare-fun res!136062 () Bool)

(declare-fun e!174730 () Bool)

(assert (=> start!26270 (=> (not res!136062) (not e!174730))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26270 (= res!136062 (validMask!0 mask!3868))))

(assert (=> start!26270 e!174730))

(declare-datatypes ((array!13367 0))(
  ( (array!13368 (arr!6333 (Array (_ BitVec 32) (_ BitVec 64))) (size!6685 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13367)

(declare-fun array_inv!4296 (array!13367) Bool)

(assert (=> start!26270 (array_inv!4296 a!3325)))

(assert (=> start!26270 true))

(declare-fun b!272064 () Bool)

(declare-fun res!136055 () Bool)

(declare-fun e!174729 () Bool)

(assert (=> b!272064 (=> (not res!136055) (not e!174729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13367 (_ BitVec 32)) Bool)

(assert (=> b!272064 (= res!136055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272065 () Bool)

(declare-fun res!136060 () Bool)

(assert (=> b!272065 (=> (not res!136060) (not e!174730))))

(declare-datatypes ((List!4141 0))(
  ( (Nil!4138) (Cons!4137 (h!4804 (_ BitVec 64)) (t!9223 List!4141)) )
))
(declare-fun arrayNoDuplicates!0 (array!13367 (_ BitVec 32) List!4141) Bool)

(assert (=> b!272065 (= res!136060 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4138))))

(declare-fun b!272066 () Bool)

(assert (=> b!272066 (= e!174729 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!272066 (arrayNoDuplicates!0 (array!13368 (store (arr!6333 a!3325) i!1267 k0!2581) (size!6685 a!3325)) #b00000000000000000000000000000000 Nil!4138)))

(declare-datatypes ((Unit!8469 0))(
  ( (Unit!8470) )
))
(declare-fun lt!135919 () Unit!8469)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4141) Unit!8469)

(assert (=> b!272066 (= lt!135919 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4138))))

(declare-fun b!272067 () Bool)

(declare-fun res!136057 () Bool)

(assert (=> b!272067 (=> (not res!136057) (not e!174730))))

(declare-fun arrayContainsKey!0 (array!13367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272067 (= res!136057 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272068 () Bool)

(declare-fun res!136056 () Bool)

(assert (=> b!272068 (=> (not res!136056) (not e!174729))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272068 (= res!136056 (not (= startIndex!26 i!1267)))))

(declare-fun b!272069 () Bool)

(declare-fun res!136061 () Bool)

(assert (=> b!272069 (=> (not res!136061) (not e!174730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272069 (= res!136061 (validKeyInArray!0 k0!2581))))

(declare-fun b!272070 () Bool)

(assert (=> b!272070 (= e!174730 e!174729)))

(declare-fun res!136059 () Bool)

(assert (=> b!272070 (=> (not res!136059) (not e!174729))))

(declare-datatypes ((SeekEntryResult!1491 0))(
  ( (MissingZero!1491 (index!8134 (_ BitVec 32))) (Found!1491 (index!8135 (_ BitVec 32))) (Intermediate!1491 (undefined!2303 Bool) (index!8136 (_ BitVec 32)) (x!26456 (_ BitVec 32))) (Undefined!1491) (MissingVacant!1491 (index!8137 (_ BitVec 32))) )
))
(declare-fun lt!135918 () SeekEntryResult!1491)

(assert (=> b!272070 (= res!136059 (or (= lt!135918 (MissingZero!1491 i!1267)) (= lt!135918 (MissingVacant!1491 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13367 (_ BitVec 32)) SeekEntryResult!1491)

(assert (=> b!272070 (= lt!135918 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272071 () Bool)

(declare-fun res!136058 () Bool)

(assert (=> b!272071 (=> (not res!136058) (not e!174729))))

(assert (=> b!272071 (= res!136058 (validKeyInArray!0 (select (arr!6333 a!3325) startIndex!26)))))

(declare-fun b!272072 () Bool)

(declare-fun res!136054 () Bool)

(assert (=> b!272072 (=> (not res!136054) (not e!174730))))

(assert (=> b!272072 (= res!136054 (and (= (size!6685 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6685 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6685 a!3325))))))

(assert (= (and start!26270 res!136062) b!272072))

(assert (= (and b!272072 res!136054) b!272069))

(assert (= (and b!272069 res!136061) b!272065))

(assert (= (and b!272065 res!136060) b!272067))

(assert (= (and b!272067 res!136057) b!272070))

(assert (= (and b!272070 res!136059) b!272064))

(assert (= (and b!272064 res!136055) b!272068))

(assert (= (and b!272068 res!136056) b!272071))

(assert (= (and b!272071 res!136058) b!272066))

(declare-fun m!287205 () Bool)

(assert (=> b!272069 m!287205))

(declare-fun m!287207 () Bool)

(assert (=> b!272070 m!287207))

(declare-fun m!287209 () Bool)

(assert (=> b!272064 m!287209))

(declare-fun m!287211 () Bool)

(assert (=> b!272065 m!287211))

(declare-fun m!287213 () Bool)

(assert (=> b!272067 m!287213))

(declare-fun m!287215 () Bool)

(assert (=> start!26270 m!287215))

(declare-fun m!287217 () Bool)

(assert (=> start!26270 m!287217))

(declare-fun m!287219 () Bool)

(assert (=> b!272066 m!287219))

(declare-fun m!287221 () Bool)

(assert (=> b!272066 m!287221))

(declare-fun m!287223 () Bool)

(assert (=> b!272066 m!287223))

(declare-fun m!287225 () Bool)

(assert (=> b!272071 m!287225))

(assert (=> b!272071 m!287225))

(declare-fun m!287227 () Bool)

(assert (=> b!272071 m!287227))

(check-sat (not b!272065) (not b!272067) (not b!272064) (not b!272071) (not b!272066) (not b!272069) (not start!26270) (not b!272070))
(check-sat)
