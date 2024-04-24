; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26418 () Bool)

(assert start!26418)

(declare-fun b!274109 () Bool)

(declare-fun res!138074 () Bool)

(declare-fun e!175559 () Bool)

(assert (=> b!274109 (=> (not res!138074) (not e!175559))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274109 (= res!138074 (validKeyInArray!0 k0!2581))))

(declare-fun b!274110 () Bool)

(declare-fun res!138073 () Bool)

(assert (=> b!274110 (=> (not res!138073) (not e!175559))))

(declare-datatypes ((array!13514 0))(
  ( (array!13515 (arr!6406 (Array (_ BitVec 32) (_ BitVec 64))) (size!6758 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13514)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274110 (= res!138073 (and (= (size!6758 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6758 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6758 a!3325))))))

(declare-fun b!274111 () Bool)

(declare-fun res!138077 () Bool)

(assert (=> b!274111 (=> (not res!138077) (not e!175559))))

(declare-fun arrayContainsKey!0 (array!13514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274111 (= res!138077 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274112 () Bool)

(declare-fun e!175557 () Bool)

(assert (=> b!274112 (= e!175557 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13514 (_ BitVec 32)) Bool)

(assert (=> b!274112 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8597 0))(
  ( (Unit!8598) )
))
(declare-fun lt!136791 () Unit!8597)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8597)

(assert (=> b!274112 (= lt!136791 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136789 () array!13514)

(declare-datatypes ((SeekEntryResult!1529 0))(
  ( (MissingZero!1529 (index!8286 (_ BitVec 32))) (Found!1529 (index!8287 (_ BitVec 32))) (Intermediate!1529 (undefined!2341 Bool) (index!8288 (_ BitVec 32)) (x!26694 (_ BitVec 32))) (Undefined!1529) (MissingVacant!1529 (index!8289 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13514 (_ BitVec 32)) SeekEntryResult!1529)

(assert (=> b!274112 (= (seekEntryOrOpen!0 (select (arr!6406 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6406 a!3325) i!1267 k0!2581) startIndex!26) lt!136789 mask!3868))))

(declare-fun lt!136788 () Unit!8597)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8597)

(assert (=> b!274112 (= lt!136788 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4127 0))(
  ( (Nil!4124) (Cons!4123 (h!4790 (_ BitVec 64)) (t!9201 List!4127)) )
))
(declare-fun arrayNoDuplicates!0 (array!13514 (_ BitVec 32) List!4127) Bool)

(assert (=> b!274112 (arrayNoDuplicates!0 lt!136789 #b00000000000000000000000000000000 Nil!4124)))

(declare-fun lt!136787 () Unit!8597)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13514 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4127) Unit!8597)

(assert (=> b!274112 (= lt!136787 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4124))))

(declare-fun b!274113 () Bool)

(declare-fun res!138080 () Bool)

(declare-fun e!175556 () Bool)

(assert (=> b!274113 (=> (not res!138080) (not e!175556))))

(assert (=> b!274113 (= res!138080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274114 () Bool)

(declare-fun res!138075 () Bool)

(assert (=> b!274114 (=> (not res!138075) (not e!175559))))

(assert (=> b!274114 (= res!138075 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4124))))

(declare-fun b!274115 () Bool)

(declare-fun res!138078 () Bool)

(assert (=> b!274115 (=> (not res!138078) (not e!175557))))

(assert (=> b!274115 (= res!138078 (validKeyInArray!0 (select (arr!6406 a!3325) startIndex!26)))))

(declare-fun res!138076 () Bool)

(assert (=> start!26418 (=> (not res!138076) (not e!175559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26418 (= res!138076 (validMask!0 mask!3868))))

(assert (=> start!26418 e!175559))

(declare-fun array_inv!4356 (array!13514) Bool)

(assert (=> start!26418 (array_inv!4356 a!3325)))

(assert (=> start!26418 true))

(declare-fun b!274116 () Bool)

(assert (=> b!274116 (= e!175556 e!175557)))

(declare-fun res!138079 () Bool)

(assert (=> b!274116 (=> (not res!138079) (not e!175557))))

(assert (=> b!274116 (= res!138079 (not (= startIndex!26 i!1267)))))

(assert (=> b!274116 (= lt!136789 (array!13515 (store (arr!6406 a!3325) i!1267 k0!2581) (size!6758 a!3325)))))

(declare-fun b!274117 () Bool)

(assert (=> b!274117 (= e!175559 e!175556)))

(declare-fun res!138081 () Bool)

(assert (=> b!274117 (=> (not res!138081) (not e!175556))))

(declare-fun lt!136790 () SeekEntryResult!1529)

(assert (=> b!274117 (= res!138081 (or (= lt!136790 (MissingZero!1529 i!1267)) (= lt!136790 (MissingVacant!1529 i!1267))))))

(assert (=> b!274117 (= lt!136790 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26418 res!138076) b!274110))

(assert (= (and b!274110 res!138073) b!274109))

(assert (= (and b!274109 res!138074) b!274114))

(assert (= (and b!274114 res!138075) b!274111))

(assert (= (and b!274111 res!138077) b!274117))

(assert (= (and b!274117 res!138081) b!274113))

(assert (= (and b!274113 res!138080) b!274116))

(assert (= (and b!274116 res!138079) b!274115))

(assert (= (and b!274115 res!138078) b!274112))

(declare-fun m!289667 () Bool)

(assert (=> start!26418 m!289667))

(declare-fun m!289669 () Bool)

(assert (=> start!26418 m!289669))

(declare-fun m!289671 () Bool)

(assert (=> b!274114 m!289671))

(declare-fun m!289673 () Bool)

(assert (=> b!274113 m!289673))

(declare-fun m!289675 () Bool)

(assert (=> b!274116 m!289675))

(declare-fun m!289677 () Bool)

(assert (=> b!274115 m!289677))

(assert (=> b!274115 m!289677))

(declare-fun m!289679 () Bool)

(assert (=> b!274115 m!289679))

(declare-fun m!289681 () Bool)

(assert (=> b!274109 m!289681))

(declare-fun m!289683 () Bool)

(assert (=> b!274117 m!289683))

(declare-fun m!289685 () Bool)

(assert (=> b!274111 m!289685))

(declare-fun m!289687 () Bool)

(assert (=> b!274112 m!289687))

(declare-fun m!289689 () Bool)

(assert (=> b!274112 m!289689))

(assert (=> b!274112 m!289689))

(declare-fun m!289691 () Bool)

(assert (=> b!274112 m!289691))

(assert (=> b!274112 m!289675))

(declare-fun m!289693 () Bool)

(assert (=> b!274112 m!289693))

(assert (=> b!274112 m!289677))

(declare-fun m!289695 () Bool)

(assert (=> b!274112 m!289695))

(assert (=> b!274112 m!289677))

(declare-fun m!289697 () Bool)

(assert (=> b!274112 m!289697))

(declare-fun m!289699 () Bool)

(assert (=> b!274112 m!289699))

(declare-fun m!289701 () Bool)

(assert (=> b!274112 m!289701))

(check-sat (not b!274112) (not b!274117) (not b!274113) (not b!274115) (not b!274109) (not b!274114) (not b!274111) (not start!26418))
(check-sat)
