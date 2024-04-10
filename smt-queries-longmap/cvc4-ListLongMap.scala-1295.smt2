; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26332 () Bool)

(assert start!26332)

(declare-fun res!136894 () Bool)

(declare-fun e!175018 () Bool)

(assert (=> start!26332 (=> (not res!136894) (not e!175018))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26332 (= res!136894 (validMask!0 mask!3868))))

(assert (=> start!26332 e!175018))

(declare-datatypes ((array!13429 0))(
  ( (array!13430 (arr!6364 (Array (_ BitVec 32) (_ BitVec 64))) (size!6716 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13429)

(declare-fun array_inv!4327 (array!13429) Bool)

(assert (=> start!26332 (array_inv!4327 a!3325)))

(assert (=> start!26332 true))

(declare-fun b!272901 () Bool)

(declare-fun e!175016 () Bool)

(assert (=> b!272901 (= e!175018 e!175016)))

(declare-fun res!136899 () Bool)

(assert (=> b!272901 (=> (not res!136899) (not e!175016))))

(declare-datatypes ((SeekEntryResult!1522 0))(
  ( (MissingZero!1522 (index!8258 (_ BitVec 32))) (Found!1522 (index!8259 (_ BitVec 32))) (Intermediate!1522 (undefined!2334 Bool) (index!8260 (_ BitVec 32)) (x!26567 (_ BitVec 32))) (Undefined!1522) (MissingVacant!1522 (index!8261 (_ BitVec 32))) )
))
(declare-fun lt!136120 () SeekEntryResult!1522)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272901 (= res!136899 (or (= lt!136120 (MissingZero!1522 i!1267)) (= lt!136120 (MissingVacant!1522 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13429 (_ BitVec 32)) SeekEntryResult!1522)

(assert (=> b!272901 (= lt!136120 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272902 () Bool)

(declare-fun e!175017 () Bool)

(assert (=> b!272902 (= e!175016 e!175017)))

(declare-fun res!136897 () Bool)

(assert (=> b!272902 (=> (not res!136897) (not e!175017))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272902 (= res!136897 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136121 () array!13429)

(assert (=> b!272902 (= lt!136121 (array!13430 (store (arr!6364 a!3325) i!1267 k!2581) (size!6716 a!3325)))))

(declare-fun b!272903 () Bool)

(declare-fun res!136898 () Bool)

(assert (=> b!272903 (=> (not res!136898) (not e!175018))))

(assert (=> b!272903 (= res!136898 (and (= (size!6716 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6716 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6716 a!3325))))))

(declare-fun b!272904 () Bool)

(assert (=> b!272904 (= e!175017 (not true))))

(assert (=> b!272904 (= (seekEntryOrOpen!0 (select (arr!6364 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6364 a!3325) i!1267 k!2581) startIndex!26) lt!136121 mask!3868))))

(declare-datatypes ((Unit!8531 0))(
  ( (Unit!8532) )
))
(declare-fun lt!136123 () Unit!8531)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13429 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8531)

(assert (=> b!272904 (= lt!136123 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4172 0))(
  ( (Nil!4169) (Cons!4168 (h!4835 (_ BitVec 64)) (t!9254 List!4172)) )
))
(declare-fun arrayNoDuplicates!0 (array!13429 (_ BitVec 32) List!4172) Bool)

(assert (=> b!272904 (arrayNoDuplicates!0 lt!136121 #b00000000000000000000000000000000 Nil!4169)))

(declare-fun lt!136122 () Unit!8531)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13429 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4172) Unit!8531)

(assert (=> b!272904 (= lt!136122 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4169))))

(declare-fun b!272905 () Bool)

(declare-fun res!136895 () Bool)

(assert (=> b!272905 (=> (not res!136895) (not e!175016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13429 (_ BitVec 32)) Bool)

(assert (=> b!272905 (= res!136895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272906 () Bool)

(declare-fun res!136891 () Bool)

(assert (=> b!272906 (=> (not res!136891) (not e!175018))))

(declare-fun arrayContainsKey!0 (array!13429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272906 (= res!136891 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272907 () Bool)

(declare-fun res!136893 () Bool)

(assert (=> b!272907 (=> (not res!136893) (not e!175018))))

(assert (=> b!272907 (= res!136893 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4169))))

(declare-fun b!272908 () Bool)

(declare-fun res!136896 () Bool)

(assert (=> b!272908 (=> (not res!136896) (not e!175017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272908 (= res!136896 (validKeyInArray!0 (select (arr!6364 a!3325) startIndex!26)))))

(declare-fun b!272909 () Bool)

(declare-fun res!136892 () Bool)

(assert (=> b!272909 (=> (not res!136892) (not e!175018))))

(assert (=> b!272909 (= res!136892 (validKeyInArray!0 k!2581))))

(assert (= (and start!26332 res!136894) b!272903))

(assert (= (and b!272903 res!136898) b!272909))

(assert (= (and b!272909 res!136892) b!272907))

(assert (= (and b!272907 res!136893) b!272906))

(assert (= (and b!272906 res!136891) b!272901))

(assert (= (and b!272901 res!136899) b!272905))

(assert (= (and b!272905 res!136895) b!272902))

(assert (= (and b!272902 res!136897) b!272908))

(assert (= (and b!272908 res!136896) b!272904))

(declare-fun m!287965 () Bool)

(assert (=> b!272905 m!287965))

(declare-fun m!287967 () Bool)

(assert (=> b!272901 m!287967))

(declare-fun m!287969 () Bool)

(assert (=> b!272906 m!287969))

(declare-fun m!287971 () Bool)

(assert (=> b!272904 m!287971))

(declare-fun m!287973 () Bool)

(assert (=> b!272904 m!287973))

(declare-fun m!287975 () Bool)

(assert (=> b!272904 m!287975))

(declare-fun m!287977 () Bool)

(assert (=> b!272904 m!287977))

(declare-fun m!287979 () Bool)

(assert (=> b!272904 m!287979))

(declare-fun m!287981 () Bool)

(assert (=> b!272904 m!287981))

(assert (=> b!272904 m!287973))

(declare-fun m!287983 () Bool)

(assert (=> b!272904 m!287983))

(assert (=> b!272904 m!287977))

(declare-fun m!287985 () Bool)

(assert (=> b!272904 m!287985))

(declare-fun m!287987 () Bool)

(assert (=> b!272909 m!287987))

(assert (=> b!272908 m!287977))

(assert (=> b!272908 m!287977))

(declare-fun m!287989 () Bool)

(assert (=> b!272908 m!287989))

(assert (=> b!272902 m!287975))

(declare-fun m!287991 () Bool)

(assert (=> b!272907 m!287991))

(declare-fun m!287993 () Bool)

(assert (=> start!26332 m!287993))

(declare-fun m!287995 () Bool)

(assert (=> start!26332 m!287995))

(push 1)

