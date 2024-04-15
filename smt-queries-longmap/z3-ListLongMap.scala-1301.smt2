; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26366 () Bool)

(assert start!26366)

(declare-fun b!273186 () Bool)

(declare-fun res!137230 () Bool)

(declare-fun e!175109 () Bool)

(assert (=> b!273186 (=> (not res!137230) (not e!175109))))

(declare-datatypes ((array!13452 0))(
  ( (array!13453 (arr!6375 (Array (_ BitVec 32) (_ BitVec 64))) (size!6728 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13452)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13452 (_ BitVec 32)) Bool)

(assert (=> b!273186 (= res!137230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273187 () Bool)

(declare-fun e!175107 () Bool)

(assert (=> b!273187 (= e!175107 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273187 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8517 0))(
  ( (Unit!8518) )
))
(declare-fun lt!136143 () Unit!8517)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8517)

(assert (=> b!273187 (= lt!136143 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136142 () array!13452)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1532 0))(
  ( (MissingZero!1532 (index!8298 (_ BitVec 32))) (Found!1532 (index!8299 (_ BitVec 32))) (Intermediate!1532 (undefined!2344 Bool) (index!8300 (_ BitVec 32)) (x!26624 (_ BitVec 32))) (Undefined!1532) (MissingVacant!1532 (index!8301 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13452 (_ BitVec 32)) SeekEntryResult!1532)

(assert (=> b!273187 (= (seekEntryOrOpen!0 (select (arr!6375 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6375 a!3325) i!1267 k0!2581) startIndex!26) lt!136142 mask!3868))))

(declare-fun lt!136145 () Unit!8517)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13452 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8517)

(assert (=> b!273187 (= lt!136145 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4156 0))(
  ( (Nil!4153) (Cons!4152 (h!4819 (_ BitVec 64)) (t!9229 List!4156)) )
))
(declare-fun arrayNoDuplicates!0 (array!13452 (_ BitVec 32) List!4156) Bool)

(assert (=> b!273187 (arrayNoDuplicates!0 lt!136142 #b00000000000000000000000000000000 Nil!4153)))

(declare-fun lt!136146 () Unit!8517)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13452 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4156) Unit!8517)

(assert (=> b!273187 (= lt!136146 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4153))))

(declare-fun b!273188 () Bool)

(declare-fun e!175108 () Bool)

(assert (=> b!273188 (= e!175108 e!175109)))

(declare-fun res!137233 () Bool)

(assert (=> b!273188 (=> (not res!137233) (not e!175109))))

(declare-fun lt!136144 () SeekEntryResult!1532)

(assert (=> b!273188 (= res!137233 (or (= lt!136144 (MissingZero!1532 i!1267)) (= lt!136144 (MissingVacant!1532 i!1267))))))

(assert (=> b!273188 (= lt!136144 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273189 () Bool)

(declare-fun res!137235 () Bool)

(assert (=> b!273189 (=> (not res!137235) (not e!175108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273189 (= res!137235 (validKeyInArray!0 k0!2581))))

(declare-fun b!273191 () Bool)

(declare-fun res!137229 () Bool)

(assert (=> b!273191 (=> (not res!137229) (not e!175107))))

(assert (=> b!273191 (= res!137229 (validKeyInArray!0 (select (arr!6375 a!3325) startIndex!26)))))

(declare-fun b!273192 () Bool)

(assert (=> b!273192 (= e!175109 e!175107)))

(declare-fun res!137228 () Bool)

(assert (=> b!273192 (=> (not res!137228) (not e!175107))))

(assert (=> b!273192 (= res!137228 (not (= startIndex!26 i!1267)))))

(assert (=> b!273192 (= lt!136142 (array!13453 (store (arr!6375 a!3325) i!1267 k0!2581) (size!6728 a!3325)))))

(declare-fun b!273193 () Bool)

(declare-fun res!137231 () Bool)

(assert (=> b!273193 (=> (not res!137231) (not e!175108))))

(assert (=> b!273193 (= res!137231 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4153))))

(declare-fun b!273194 () Bool)

(declare-fun res!137234 () Bool)

(assert (=> b!273194 (=> (not res!137234) (not e!175108))))

(assert (=> b!273194 (= res!137234 (and (= (size!6728 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6728 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6728 a!3325))))))

(declare-fun res!137236 () Bool)

(assert (=> start!26366 (=> (not res!137236) (not e!175108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26366 (= res!137236 (validMask!0 mask!3868))))

(assert (=> start!26366 e!175108))

(declare-fun array_inv!4347 (array!13452) Bool)

(assert (=> start!26366 (array_inv!4347 a!3325)))

(assert (=> start!26366 true))

(declare-fun b!273190 () Bool)

(declare-fun res!137232 () Bool)

(assert (=> b!273190 (=> (not res!137232) (not e!175108))))

(declare-fun arrayContainsKey!0 (array!13452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273190 (= res!137232 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26366 res!137236) b!273194))

(assert (= (and b!273194 res!137234) b!273189))

(assert (= (and b!273189 res!137235) b!273193))

(assert (= (and b!273193 res!137231) b!273190))

(assert (= (and b!273190 res!137232) b!273188))

(assert (= (and b!273188 res!137233) b!273186))

(assert (= (and b!273186 res!137230) b!273192))

(assert (= (and b!273192 res!137228) b!273191))

(assert (= (and b!273191 res!137229) b!273187))

(declare-fun m!287897 () Bool)

(assert (=> b!273190 m!287897))

(declare-fun m!287899 () Bool)

(assert (=> b!273187 m!287899))

(declare-fun m!287901 () Bool)

(assert (=> b!273187 m!287901))

(declare-fun m!287903 () Bool)

(assert (=> b!273187 m!287903))

(declare-fun m!287905 () Bool)

(assert (=> b!273187 m!287905))

(declare-fun m!287907 () Bool)

(assert (=> b!273187 m!287907))

(declare-fun m!287909 () Bool)

(assert (=> b!273187 m!287909))

(declare-fun m!287911 () Bool)

(assert (=> b!273187 m!287911))

(declare-fun m!287913 () Bool)

(assert (=> b!273187 m!287913))

(declare-fun m!287915 () Bool)

(assert (=> b!273187 m!287915))

(assert (=> b!273187 m!287913))

(assert (=> b!273187 m!287903))

(declare-fun m!287917 () Bool)

(assert (=> b!273187 m!287917))

(assert (=> b!273192 m!287905))

(declare-fun m!287919 () Bool)

(assert (=> b!273186 m!287919))

(declare-fun m!287921 () Bool)

(assert (=> b!273193 m!287921))

(assert (=> b!273191 m!287913))

(assert (=> b!273191 m!287913))

(declare-fun m!287923 () Bool)

(assert (=> b!273191 m!287923))

(declare-fun m!287925 () Bool)

(assert (=> b!273189 m!287925))

(declare-fun m!287927 () Bool)

(assert (=> start!26366 m!287927))

(declare-fun m!287929 () Bool)

(assert (=> start!26366 m!287929))

(declare-fun m!287931 () Bool)

(assert (=> b!273188 m!287931))

(check-sat (not b!273188) (not b!273187) (not b!273193) (not start!26366) (not b!273191) (not b!273186) (not b!273189) (not b!273190))
(check-sat)
