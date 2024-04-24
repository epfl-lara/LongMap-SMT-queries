; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26430 () Bool)

(assert start!26430)

(declare-fun b!274273 () Bool)

(declare-fun res!138241 () Bool)

(declare-fun e!175630 () Bool)

(assert (=> b!274273 (=> (not res!138241) (not e!175630))))

(declare-datatypes ((array!13526 0))(
  ( (array!13527 (arr!6412 (Array (_ BitVec 32) (_ BitVec 64))) (size!6764 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13526)

(declare-datatypes ((List!4133 0))(
  ( (Nil!4130) (Cons!4129 (h!4796 (_ BitVec 64)) (t!9207 List!4133)) )
))
(declare-fun arrayNoDuplicates!0 (array!13526 (_ BitVec 32) List!4133) Bool)

(assert (=> b!274273 (= res!138241 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4130))))

(declare-fun res!138246 () Bool)

(assert (=> start!26430 (=> (not res!138246) (not e!175630))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26430 (= res!138246 (validMask!0 mask!3868))))

(assert (=> start!26430 e!175630))

(declare-fun array_inv!4362 (array!13526) Bool)

(assert (=> start!26430 (array_inv!4362 a!3325)))

(assert (=> start!26430 true))

(declare-fun b!274274 () Bool)

(declare-fun res!138239 () Bool)

(assert (=> b!274274 (=> (not res!138239) (not e!175630))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274274 (= res!138239 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274275 () Bool)

(declare-fun res!138243 () Bool)

(assert (=> b!274275 (=> (not res!138243) (not e!175630))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274275 (= res!138243 (and (= (size!6764 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6764 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6764 a!3325))))))

(declare-fun b!274276 () Bool)

(declare-fun e!175633 () Bool)

(declare-fun e!175631 () Bool)

(assert (=> b!274276 (= e!175633 e!175631)))

(declare-fun res!138237 () Bool)

(assert (=> b!274276 (=> (not res!138237) (not e!175631))))

(assert (=> b!274276 (= res!138237 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136879 () array!13526)

(assert (=> b!274276 (= lt!136879 (array!13527 (store (arr!6412 a!3325) i!1267 k0!2581) (size!6764 a!3325)))))

(declare-fun b!274277 () Bool)

(declare-fun res!138245 () Bool)

(assert (=> b!274277 (=> (not res!138245) (not e!175630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274277 (= res!138245 (validKeyInArray!0 k0!2581))))

(declare-fun b!274278 () Bool)

(declare-fun e!175632 () Bool)

(assert (=> b!274278 (= e!175631 (not e!175632))))

(declare-fun res!138238 () Bool)

(assert (=> b!274278 (=> res!138238 e!175632)))

(assert (=> b!274278 (= res!138238 (or (bvsge startIndex!26 (bvsub (size!6764 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13526 (_ BitVec 32)) Bool)

(assert (=> b!274278 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8609 0))(
  ( (Unit!8610) )
))
(declare-fun lt!136882 () Unit!8609)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> b!274278 (= lt!136882 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1535 0))(
  ( (MissingZero!1535 (index!8310 (_ BitVec 32))) (Found!1535 (index!8311 (_ BitVec 32))) (Intermediate!1535 (undefined!2347 Bool) (index!8312 (_ BitVec 32)) (x!26716 (_ BitVec 32))) (Undefined!1535) (MissingVacant!1535 (index!8313 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13526 (_ BitVec 32)) SeekEntryResult!1535)

(assert (=> b!274278 (= (seekEntryOrOpen!0 (select (arr!6412 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6412 a!3325) i!1267 k0!2581) startIndex!26) lt!136879 mask!3868))))

(declare-fun lt!136880 () Unit!8609)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13526 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> b!274278 (= lt!136880 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274278 (arrayNoDuplicates!0 lt!136879 #b00000000000000000000000000000000 Nil!4130)))

(declare-fun lt!136883 () Unit!8609)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13526 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4133) Unit!8609)

(assert (=> b!274278 (= lt!136883 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4130))))

(declare-fun b!274279 () Bool)

(assert (=> b!274279 (= e!175630 e!175633)))

(declare-fun res!138244 () Bool)

(assert (=> b!274279 (=> (not res!138244) (not e!175633))))

(declare-fun lt!136881 () SeekEntryResult!1535)

(assert (=> b!274279 (= res!138244 (or (= lt!136881 (MissingZero!1535 i!1267)) (= lt!136881 (MissingVacant!1535 i!1267))))))

(assert (=> b!274279 (= lt!136881 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274280 () Bool)

(declare-fun res!138242 () Bool)

(assert (=> b!274280 (=> (not res!138242) (not e!175633))))

(assert (=> b!274280 (= res!138242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274281 () Bool)

(assert (=> b!274281 (= e!175632 true)))

(assert (=> b!274281 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136879 mask!3868)))

(declare-fun lt!136884 () Unit!8609)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13526 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> b!274281 (= lt!136884 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274282 () Bool)

(declare-fun res!138240 () Bool)

(assert (=> b!274282 (=> (not res!138240) (not e!175631))))

(assert (=> b!274282 (= res!138240 (validKeyInArray!0 (select (arr!6412 a!3325) startIndex!26)))))

(assert (= (and start!26430 res!138246) b!274275))

(assert (= (and b!274275 res!138243) b!274277))

(assert (= (and b!274277 res!138245) b!274273))

(assert (= (and b!274273 res!138241) b!274274))

(assert (= (and b!274274 res!138239) b!274279))

(assert (= (and b!274279 res!138244) b!274280))

(assert (= (and b!274280 res!138242) b!274276))

(assert (= (and b!274276 res!138237) b!274282))

(assert (= (and b!274282 res!138240) b!274278))

(assert (= (and b!274278 (not res!138238)) b!274281))

(declare-fun m!289883 () Bool)

(assert (=> b!274281 m!289883))

(declare-fun m!289885 () Bool)

(assert (=> b!274281 m!289885))

(declare-fun m!289887 () Bool)

(assert (=> b!274277 m!289887))

(declare-fun m!289889 () Bool)

(assert (=> b!274282 m!289889))

(assert (=> b!274282 m!289889))

(declare-fun m!289891 () Bool)

(assert (=> b!274282 m!289891))

(declare-fun m!289893 () Bool)

(assert (=> b!274278 m!289893))

(declare-fun m!289895 () Bool)

(assert (=> b!274278 m!289895))

(declare-fun m!289897 () Bool)

(assert (=> b!274278 m!289897))

(declare-fun m!289899 () Bool)

(assert (=> b!274278 m!289899))

(declare-fun m!289901 () Bool)

(assert (=> b!274278 m!289901))

(assert (=> b!274278 m!289889))

(declare-fun m!289903 () Bool)

(assert (=> b!274278 m!289903))

(assert (=> b!274278 m!289889))

(declare-fun m!289905 () Bool)

(assert (=> b!274278 m!289905))

(assert (=> b!274278 m!289897))

(declare-fun m!289907 () Bool)

(assert (=> b!274278 m!289907))

(declare-fun m!289909 () Bool)

(assert (=> b!274278 m!289909))

(declare-fun m!289911 () Bool)

(assert (=> start!26430 m!289911))

(declare-fun m!289913 () Bool)

(assert (=> start!26430 m!289913))

(declare-fun m!289915 () Bool)

(assert (=> b!274279 m!289915))

(declare-fun m!289917 () Bool)

(assert (=> b!274273 m!289917))

(declare-fun m!289919 () Bool)

(assert (=> b!274280 m!289919))

(assert (=> b!274276 m!289899))

(declare-fun m!289921 () Bool)

(assert (=> b!274274 m!289921))

(check-sat (not b!274281) (not b!274273) (not b!274280) (not b!274274) (not b!274279) (not b!274277) (not b!274282) (not start!26430) (not b!274278))
(check-sat)
