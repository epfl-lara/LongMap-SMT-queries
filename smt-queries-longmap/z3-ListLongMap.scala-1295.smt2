; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26328 () Bool)

(assert start!26328)

(declare-fun res!136865 () Bool)

(declare-fun e!175016 () Bool)

(assert (=> start!26328 (=> (not res!136865) (not e!175016))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26328 (= res!136865 (validMask!0 mask!3868))))

(assert (=> start!26328 e!175016))

(declare-datatypes ((array!13424 0))(
  ( (array!13425 (arr!6361 (Array (_ BitVec 32) (_ BitVec 64))) (size!6713 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13424)

(declare-fun array_inv!4311 (array!13424) Bool)

(assert (=> start!26328 (array_inv!4311 a!3325)))

(assert (=> start!26328 true))

(declare-fun b!272894 () Bool)

(declare-fun e!175017 () Bool)

(assert (=> b!272894 (= e!175017 (not true))))

(declare-fun lt!136158 () array!13424)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1484 0))(
  ( (MissingZero!1484 (index!8106 (_ BitVec 32))) (Found!1484 (index!8107 (_ BitVec 32))) (Intermediate!1484 (undefined!2296 Bool) (index!8108 (_ BitVec 32)) (x!26529 (_ BitVec 32))) (Undefined!1484) (MissingVacant!1484 (index!8109 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13424 (_ BitVec 32)) SeekEntryResult!1484)

(assert (=> b!272894 (= (seekEntryOrOpen!0 (select (arr!6361 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6361 a!3325) i!1267 k0!2581) startIndex!26) lt!136158 mask!3868))))

(declare-datatypes ((Unit!8507 0))(
  ( (Unit!8508) )
))
(declare-fun lt!136157 () Unit!8507)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13424 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8507)

(assert (=> b!272894 (= lt!136157 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4082 0))(
  ( (Nil!4079) (Cons!4078 (h!4745 (_ BitVec 64)) (t!9156 List!4082)) )
))
(declare-fun arrayNoDuplicates!0 (array!13424 (_ BitVec 32) List!4082) Bool)

(assert (=> b!272894 (arrayNoDuplicates!0 lt!136158 #b00000000000000000000000000000000 Nil!4079)))

(declare-fun lt!136156 () Unit!8507)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13424 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4082) Unit!8507)

(assert (=> b!272894 (= lt!136156 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4079))))

(declare-fun b!272895 () Bool)

(declare-fun res!136861 () Bool)

(assert (=> b!272895 (=> (not res!136861) (not e!175016))))

(assert (=> b!272895 (= res!136861 (and (= (size!6713 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6713 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6713 a!3325))))))

(declare-fun b!272896 () Bool)

(declare-fun res!136862 () Bool)

(assert (=> b!272896 (=> (not res!136862) (not e!175017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272896 (= res!136862 (validKeyInArray!0 (select (arr!6361 a!3325) startIndex!26)))))

(declare-fun b!272897 () Bool)

(declare-fun res!136859 () Bool)

(declare-fun e!175018 () Bool)

(assert (=> b!272897 (=> (not res!136859) (not e!175018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13424 (_ BitVec 32)) Bool)

(assert (=> b!272897 (= res!136859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272898 () Bool)

(declare-fun res!136866 () Bool)

(assert (=> b!272898 (=> (not res!136866) (not e!175016))))

(assert (=> b!272898 (= res!136866 (validKeyInArray!0 k0!2581))))

(declare-fun b!272899 () Bool)

(declare-fun res!136864 () Bool)

(assert (=> b!272899 (=> (not res!136864) (not e!175016))))

(assert (=> b!272899 (= res!136864 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4079))))

(declare-fun b!272900 () Bool)

(assert (=> b!272900 (= e!175018 e!175017)))

(declare-fun res!136860 () Bool)

(assert (=> b!272900 (=> (not res!136860) (not e!175017))))

(assert (=> b!272900 (= res!136860 (not (= startIndex!26 i!1267)))))

(assert (=> b!272900 (= lt!136158 (array!13425 (store (arr!6361 a!3325) i!1267 k0!2581) (size!6713 a!3325)))))

(declare-fun b!272901 () Bool)

(assert (=> b!272901 (= e!175016 e!175018)))

(declare-fun res!136863 () Bool)

(assert (=> b!272901 (=> (not res!136863) (not e!175018))))

(declare-fun lt!136155 () SeekEntryResult!1484)

(assert (=> b!272901 (= res!136863 (or (= lt!136155 (MissingZero!1484 i!1267)) (= lt!136155 (MissingVacant!1484 i!1267))))))

(assert (=> b!272901 (= lt!136155 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272902 () Bool)

(declare-fun res!136858 () Bool)

(assert (=> b!272902 (=> (not res!136858) (not e!175016))))

(declare-fun arrayContainsKey!0 (array!13424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272902 (= res!136858 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26328 res!136865) b!272895))

(assert (= (and b!272895 res!136861) b!272898))

(assert (= (and b!272898 res!136866) b!272899))

(assert (= (and b!272899 res!136864) b!272902))

(assert (= (and b!272902 res!136858) b!272901))

(assert (= (and b!272901 res!136863) b!272897))

(assert (= (and b!272897 res!136859) b!272900))

(assert (= (and b!272900 res!136860) b!272896))

(assert (= (and b!272896 res!136862) b!272894))

(declare-fun m!288107 () Bool)

(assert (=> b!272899 m!288107))

(declare-fun m!288109 () Bool)

(assert (=> b!272898 m!288109))

(declare-fun m!288111 () Bool)

(assert (=> b!272896 m!288111))

(assert (=> b!272896 m!288111))

(declare-fun m!288113 () Bool)

(assert (=> b!272896 m!288113))

(declare-fun m!288115 () Bool)

(assert (=> b!272897 m!288115))

(declare-fun m!288117 () Bool)

(assert (=> start!26328 m!288117))

(declare-fun m!288119 () Bool)

(assert (=> start!26328 m!288119))

(declare-fun m!288121 () Bool)

(assert (=> b!272894 m!288121))

(declare-fun m!288123 () Bool)

(assert (=> b!272894 m!288123))

(declare-fun m!288125 () Bool)

(assert (=> b!272894 m!288125))

(assert (=> b!272894 m!288111))

(declare-fun m!288127 () Bool)

(assert (=> b!272894 m!288127))

(assert (=> b!272894 m!288111))

(declare-fun m!288129 () Bool)

(assert (=> b!272894 m!288129))

(assert (=> b!272894 m!288123))

(declare-fun m!288131 () Bool)

(assert (=> b!272894 m!288131))

(declare-fun m!288133 () Bool)

(assert (=> b!272894 m!288133))

(assert (=> b!272900 m!288125))

(declare-fun m!288135 () Bool)

(assert (=> b!272901 m!288135))

(declare-fun m!288137 () Bool)

(assert (=> b!272902 m!288137))

(check-sat (not b!272894) (not b!272897) (not b!272902) (not b!272896) (not start!26328) (not b!272901) (not b!272898) (not b!272899))
(check-sat)
