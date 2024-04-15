; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26432 () Bool)

(assert start!26432)

(declare-fun b!274079 () Bool)

(declare-fun e!175505 () Bool)

(assert (=> b!274079 (= e!175505 true)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13518 0))(
  ( (array!13519 (arr!6408 (Array (_ BitVec 32) (_ BitVec 64))) (size!6761 (_ BitVec 32))) )
))
(declare-fun lt!136644 () array!13518)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13518 (_ BitVec 32)) Bool)

(assert (=> b!274079 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136644 mask!3868)))

(declare-datatypes ((Unit!8583 0))(
  ( (Unit!8584) )
))
(declare-fun lt!136641 () Unit!8583)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun a!3325 () array!13518)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13518 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8583)

(assert (=> b!274079 (= lt!136641 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274080 () Bool)

(declare-fun res!138125 () Bool)

(declare-fun e!175509 () Bool)

(assert (=> b!274080 (=> (not res!138125) (not e!175509))))

(declare-fun arrayContainsKey!0 (array!13518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274080 (= res!138125 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274081 () Bool)

(declare-fun e!175508 () Bool)

(assert (=> b!274081 (= e!175509 e!175508)))

(declare-fun res!138128 () Bool)

(assert (=> b!274081 (=> (not res!138128) (not e!175508))))

(declare-datatypes ((SeekEntryResult!1565 0))(
  ( (MissingZero!1565 (index!8430 (_ BitVec 32))) (Found!1565 (index!8431 (_ BitVec 32))) (Intermediate!1565 (undefined!2377 Bool) (index!8432 (_ BitVec 32)) (x!26745 (_ BitVec 32))) (Undefined!1565) (MissingVacant!1565 (index!8433 (_ BitVec 32))) )
))
(declare-fun lt!136642 () SeekEntryResult!1565)

(assert (=> b!274081 (= res!138128 (or (= lt!136642 (MissingZero!1565 i!1267)) (= lt!136642 (MissingVacant!1565 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13518 (_ BitVec 32)) SeekEntryResult!1565)

(assert (=> b!274081 (= lt!136642 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274082 () Bool)

(declare-fun res!138122 () Bool)

(assert (=> b!274082 (=> (not res!138122) (not e!175509))))

(declare-datatypes ((List!4189 0))(
  ( (Nil!4186) (Cons!4185 (h!4852 (_ BitVec 64)) (t!9262 List!4189)) )
))
(declare-fun arrayNoDuplicates!0 (array!13518 (_ BitVec 32) List!4189) Bool)

(assert (=> b!274082 (= res!138122 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4186))))

(declare-fun res!138129 () Bool)

(assert (=> start!26432 (=> (not res!138129) (not e!175509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26432 (= res!138129 (validMask!0 mask!3868))))

(assert (=> start!26432 e!175509))

(declare-fun array_inv!4380 (array!13518) Bool)

(assert (=> start!26432 (array_inv!4380 a!3325)))

(assert (=> start!26432 true))

(declare-fun b!274083 () Bool)

(declare-fun e!175507 () Bool)

(assert (=> b!274083 (= e!175507 (not e!175505))))

(declare-fun res!138123 () Bool)

(assert (=> b!274083 (=> res!138123 e!175505)))

(assert (=> b!274083 (= res!138123 (or (bvsge startIndex!26 (bvsub (size!6761 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274083 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136640 () Unit!8583)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8583)

(assert (=> b!274083 (= lt!136640 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274083 (= (seekEntryOrOpen!0 (select (arr!6408 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6408 a!3325) i!1267 k0!2581) startIndex!26) lt!136644 mask!3868))))

(declare-fun lt!136643 () Unit!8583)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13518 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8583)

(assert (=> b!274083 (= lt!136643 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274083 (arrayNoDuplicates!0 lt!136644 #b00000000000000000000000000000000 Nil!4186)))

(declare-fun lt!136639 () Unit!8583)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4189) Unit!8583)

(assert (=> b!274083 (= lt!136639 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4186))))

(declare-fun b!274084 () Bool)

(declare-fun res!138121 () Bool)

(assert (=> b!274084 (=> (not res!138121) (not e!175507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274084 (= res!138121 (validKeyInArray!0 (select (arr!6408 a!3325) startIndex!26)))))

(declare-fun b!274085 () Bool)

(assert (=> b!274085 (= e!175508 e!175507)))

(declare-fun res!138124 () Bool)

(assert (=> b!274085 (=> (not res!138124) (not e!175507))))

(assert (=> b!274085 (= res!138124 (not (= startIndex!26 i!1267)))))

(assert (=> b!274085 (= lt!136644 (array!13519 (store (arr!6408 a!3325) i!1267 k0!2581) (size!6761 a!3325)))))

(declare-fun b!274086 () Bool)

(declare-fun res!138126 () Bool)

(assert (=> b!274086 (=> (not res!138126) (not e!175508))))

(assert (=> b!274086 (= res!138126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274087 () Bool)

(declare-fun res!138130 () Bool)

(assert (=> b!274087 (=> (not res!138130) (not e!175509))))

(assert (=> b!274087 (= res!138130 (and (= (size!6761 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6761 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6761 a!3325))))))

(declare-fun b!274088 () Bool)

(declare-fun res!138127 () Bool)

(assert (=> b!274088 (=> (not res!138127) (not e!175509))))

(assert (=> b!274088 (= res!138127 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26432 res!138129) b!274087))

(assert (= (and b!274087 res!138130) b!274088))

(assert (= (and b!274088 res!138127) b!274082))

(assert (= (and b!274082 res!138122) b!274080))

(assert (= (and b!274080 res!138125) b!274081))

(assert (= (and b!274081 res!138128) b!274086))

(assert (= (and b!274086 res!138126) b!274085))

(assert (= (and b!274085 res!138124) b!274084))

(assert (= (and b!274084 res!138121) b!274083))

(assert (= (and b!274083 (not res!138123)) b!274079))

(declare-fun m!289085 () Bool)

(assert (=> b!274082 m!289085))

(declare-fun m!289087 () Bool)

(assert (=> b!274081 m!289087))

(declare-fun m!289089 () Bool)

(assert (=> b!274079 m!289089))

(declare-fun m!289091 () Bool)

(assert (=> b!274079 m!289091))

(declare-fun m!289093 () Bool)

(assert (=> b!274086 m!289093))

(declare-fun m!289095 () Bool)

(assert (=> start!26432 m!289095))

(declare-fun m!289097 () Bool)

(assert (=> start!26432 m!289097))

(declare-fun m!289099 () Bool)

(assert (=> b!274083 m!289099))

(declare-fun m!289101 () Bool)

(assert (=> b!274083 m!289101))

(declare-fun m!289103 () Bool)

(assert (=> b!274083 m!289103))

(assert (=> b!274083 m!289101))

(declare-fun m!289105 () Bool)

(assert (=> b!274083 m!289105))

(declare-fun m!289107 () Bool)

(assert (=> b!274083 m!289107))

(declare-fun m!289109 () Bool)

(assert (=> b!274083 m!289109))

(declare-fun m!289111 () Bool)

(assert (=> b!274083 m!289111))

(declare-fun m!289113 () Bool)

(assert (=> b!274083 m!289113))

(assert (=> b!274083 m!289109))

(declare-fun m!289115 () Bool)

(assert (=> b!274083 m!289115))

(declare-fun m!289117 () Bool)

(assert (=> b!274083 m!289117))

(assert (=> b!274085 m!289103))

(declare-fun m!289119 () Bool)

(assert (=> b!274080 m!289119))

(declare-fun m!289121 () Bool)

(assert (=> b!274088 m!289121))

(assert (=> b!274084 m!289109))

(assert (=> b!274084 m!289109))

(declare-fun m!289123 () Bool)

(assert (=> b!274084 m!289123))

(check-sat (not b!274084) (not b!274081) (not b!274080) (not start!26432) (not b!274088) (not b!274083) (not b!274086) (not b!274082) (not b!274079))
(check-sat)
