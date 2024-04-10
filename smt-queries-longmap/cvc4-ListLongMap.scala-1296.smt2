; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26338 () Bool)

(assert start!26338)

(declare-fun b!272982 () Bool)

(declare-fun res!136977 () Bool)

(declare-fun e!175053 () Bool)

(assert (=> b!272982 (=> (not res!136977) (not e!175053))))

(declare-datatypes ((array!13435 0))(
  ( (array!13436 (arr!6367 (Array (_ BitVec 32) (_ BitVec 64))) (size!6719 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13435)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272982 (= res!136977 (validKeyInArray!0 (select (arr!6367 a!3325) startIndex!26)))))

(declare-fun res!136974 () Bool)

(declare-fun e!175052 () Bool)

(assert (=> start!26338 (=> (not res!136974) (not e!175052))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26338 (= res!136974 (validMask!0 mask!3868))))

(assert (=> start!26338 e!175052))

(declare-fun array_inv!4330 (array!13435) Bool)

(assert (=> start!26338 (array_inv!4330 a!3325)))

(assert (=> start!26338 true))

(declare-fun b!272983 () Bool)

(declare-fun res!136975 () Bool)

(assert (=> b!272983 (=> (not res!136975) (not e!175052))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272983 (= res!136975 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272984 () Bool)

(assert (=> b!272984 (= e!175053 (not true))))

(declare-fun lt!136159 () array!13435)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1525 0))(
  ( (MissingZero!1525 (index!8270 (_ BitVec 32))) (Found!1525 (index!8271 (_ BitVec 32))) (Intermediate!1525 (undefined!2337 Bool) (index!8272 (_ BitVec 32)) (x!26578 (_ BitVec 32))) (Undefined!1525) (MissingVacant!1525 (index!8273 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13435 (_ BitVec 32)) SeekEntryResult!1525)

(assert (=> b!272984 (= (seekEntryOrOpen!0 (select (arr!6367 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6367 a!3325) i!1267 k!2581) startIndex!26) lt!136159 mask!3868))))

(declare-datatypes ((Unit!8537 0))(
  ( (Unit!8538) )
))
(declare-fun lt!136157 () Unit!8537)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8537)

(assert (=> b!272984 (= lt!136157 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4175 0))(
  ( (Nil!4172) (Cons!4171 (h!4838 (_ BitVec 64)) (t!9257 List!4175)) )
))
(declare-fun arrayNoDuplicates!0 (array!13435 (_ BitVec 32) List!4175) Bool)

(assert (=> b!272984 (arrayNoDuplicates!0 lt!136159 #b00000000000000000000000000000000 Nil!4172)))

(declare-fun lt!136158 () Unit!8537)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13435 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4175) Unit!8537)

(assert (=> b!272984 (= lt!136158 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4172))))

(declare-fun b!272985 () Bool)

(declare-fun res!136980 () Bool)

(assert (=> b!272985 (=> (not res!136980) (not e!175052))))

(assert (=> b!272985 (= res!136980 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4172))))

(declare-fun b!272986 () Bool)

(declare-fun res!136972 () Bool)

(declare-fun e!175055 () Bool)

(assert (=> b!272986 (=> (not res!136972) (not e!175055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13435 (_ BitVec 32)) Bool)

(assert (=> b!272986 (= res!136972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272987 () Bool)

(assert (=> b!272987 (= e!175052 e!175055)))

(declare-fun res!136976 () Bool)

(assert (=> b!272987 (=> (not res!136976) (not e!175055))))

(declare-fun lt!136156 () SeekEntryResult!1525)

(assert (=> b!272987 (= res!136976 (or (= lt!136156 (MissingZero!1525 i!1267)) (= lt!136156 (MissingVacant!1525 i!1267))))))

(assert (=> b!272987 (= lt!136156 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272988 () Bool)

(declare-fun res!136978 () Bool)

(assert (=> b!272988 (=> (not res!136978) (not e!175052))))

(assert (=> b!272988 (= res!136978 (and (= (size!6719 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6719 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6719 a!3325))))))

(declare-fun b!272989 () Bool)

(assert (=> b!272989 (= e!175055 e!175053)))

(declare-fun res!136973 () Bool)

(assert (=> b!272989 (=> (not res!136973) (not e!175053))))

(assert (=> b!272989 (= res!136973 (not (= startIndex!26 i!1267)))))

(assert (=> b!272989 (= lt!136159 (array!13436 (store (arr!6367 a!3325) i!1267 k!2581) (size!6719 a!3325)))))

(declare-fun b!272990 () Bool)

(declare-fun res!136979 () Bool)

(assert (=> b!272990 (=> (not res!136979) (not e!175052))))

(assert (=> b!272990 (= res!136979 (validKeyInArray!0 k!2581))))

(assert (= (and start!26338 res!136974) b!272988))

(assert (= (and b!272988 res!136978) b!272990))

(assert (= (and b!272990 res!136979) b!272985))

(assert (= (and b!272985 res!136980) b!272983))

(assert (= (and b!272983 res!136975) b!272987))

(assert (= (and b!272987 res!136976) b!272986))

(assert (= (and b!272986 res!136972) b!272989))

(assert (= (and b!272989 res!136973) b!272982))

(assert (= (and b!272982 res!136977) b!272984))

(declare-fun m!288061 () Bool)

(assert (=> b!272990 m!288061))

(declare-fun m!288063 () Bool)

(assert (=> b!272983 m!288063))

(declare-fun m!288065 () Bool)

(assert (=> b!272984 m!288065))

(declare-fun m!288067 () Bool)

(assert (=> b!272984 m!288067))

(assert (=> b!272984 m!288065))

(declare-fun m!288069 () Bool)

(assert (=> b!272984 m!288069))

(declare-fun m!288071 () Bool)

(assert (=> b!272984 m!288071))

(declare-fun m!288073 () Bool)

(assert (=> b!272984 m!288073))

(assert (=> b!272984 m!288071))

(declare-fun m!288075 () Bool)

(assert (=> b!272984 m!288075))

(declare-fun m!288077 () Bool)

(assert (=> b!272984 m!288077))

(declare-fun m!288079 () Bool)

(assert (=> b!272984 m!288079))

(assert (=> b!272982 m!288071))

(assert (=> b!272982 m!288071))

(declare-fun m!288081 () Bool)

(assert (=> b!272982 m!288081))

(assert (=> b!272989 m!288069))

(declare-fun m!288083 () Bool)

(assert (=> b!272986 m!288083))

(declare-fun m!288085 () Bool)

(assert (=> start!26338 m!288085))

(declare-fun m!288087 () Bool)

(assert (=> start!26338 m!288087))

(declare-fun m!288089 () Bool)

(assert (=> b!272987 m!288089))

(declare-fun m!288091 () Bool)

(assert (=> b!272985 m!288091))

(push 1)

