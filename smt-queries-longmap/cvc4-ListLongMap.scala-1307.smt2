; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26404 () Bool)

(assert start!26404)

(declare-fun b!273873 () Bool)

(declare-fun res!137867 () Bool)

(declare-fun e!175450 () Bool)

(assert (=> b!273873 (=> (not res!137867) (not e!175450))))

(declare-datatypes ((array!13501 0))(
  ( (array!13502 (arr!6400 (Array (_ BitVec 32) (_ BitVec 64))) (size!6752 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13501)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13501 (_ BitVec 32)) Bool)

(assert (=> b!273873 (= res!137867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273874 () Bool)

(declare-fun e!175449 () Bool)

(assert (=> b!273874 (= e!175449 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273874 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8603 0))(
  ( (Unit!8604) )
))
(declare-fun lt!136624 () Unit!8603)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8603)

(assert (=> b!273874 (= lt!136624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136625 () array!13501)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1558 0))(
  ( (MissingZero!1558 (index!8402 (_ BitVec 32))) (Found!1558 (index!8403 (_ BitVec 32))) (Intermediate!1558 (undefined!2370 Bool) (index!8404 (_ BitVec 32)) (x!26699 (_ BitVec 32))) (Undefined!1558) (MissingVacant!1558 (index!8405 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13501 (_ BitVec 32)) SeekEntryResult!1558)

(assert (=> b!273874 (= (seekEntryOrOpen!0 (select (arr!6400 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6400 a!3325) i!1267 k!2581) startIndex!26) lt!136625 mask!3868))))

(declare-fun lt!136623 () Unit!8603)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13501 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8603)

(assert (=> b!273874 (= lt!136623 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4208 0))(
  ( (Nil!4205) (Cons!4204 (h!4871 (_ BitVec 64)) (t!9290 List!4208)) )
))
(declare-fun arrayNoDuplicates!0 (array!13501 (_ BitVec 32) List!4208) Bool)

(assert (=> b!273874 (arrayNoDuplicates!0 lt!136625 #b00000000000000000000000000000000 Nil!4205)))

(declare-fun lt!136626 () Unit!8603)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13501 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4208) Unit!8603)

(assert (=> b!273874 (= lt!136626 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4205))))

(declare-fun res!137869 () Bool)

(declare-fun e!175448 () Bool)

(assert (=> start!26404 (=> (not res!137869) (not e!175448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26404 (= res!137869 (validMask!0 mask!3868))))

(assert (=> start!26404 e!175448))

(declare-fun array_inv!4363 (array!13501) Bool)

(assert (=> start!26404 (array_inv!4363 a!3325)))

(assert (=> start!26404 true))

(declare-fun b!273875 () Bool)

(assert (=> b!273875 (= e!175448 e!175450)))

(declare-fun res!137871 () Bool)

(assert (=> b!273875 (=> (not res!137871) (not e!175450))))

(declare-fun lt!136627 () SeekEntryResult!1558)

(assert (=> b!273875 (= res!137871 (or (= lt!136627 (MissingZero!1558 i!1267)) (= lt!136627 (MissingVacant!1558 i!1267))))))

(assert (=> b!273875 (= lt!136627 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273876 () Bool)

(declare-fun res!137865 () Bool)

(assert (=> b!273876 (=> (not res!137865) (not e!175448))))

(declare-fun arrayContainsKey!0 (array!13501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273876 (= res!137865 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273877 () Bool)

(assert (=> b!273877 (= e!175450 e!175449)))

(declare-fun res!137864 () Bool)

(assert (=> b!273877 (=> (not res!137864) (not e!175449))))

(assert (=> b!273877 (= res!137864 (not (= startIndex!26 i!1267)))))

(assert (=> b!273877 (= lt!136625 (array!13502 (store (arr!6400 a!3325) i!1267 k!2581) (size!6752 a!3325)))))

(declare-fun b!273878 () Bool)

(declare-fun res!137863 () Bool)

(assert (=> b!273878 (=> (not res!137863) (not e!175448))))

(assert (=> b!273878 (= res!137863 (and (= (size!6752 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6752 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6752 a!3325))))))

(declare-fun b!273879 () Bool)

(declare-fun res!137866 () Bool)

(assert (=> b!273879 (=> (not res!137866) (not e!175449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273879 (= res!137866 (validKeyInArray!0 (select (arr!6400 a!3325) startIndex!26)))))

(declare-fun b!273880 () Bool)

(declare-fun res!137870 () Bool)

(assert (=> b!273880 (=> (not res!137870) (not e!175448))))

(assert (=> b!273880 (= res!137870 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4205))))

(declare-fun b!273881 () Bool)

(declare-fun res!137868 () Bool)

(assert (=> b!273881 (=> (not res!137868) (not e!175448))))

(assert (=> b!273881 (= res!137868 (validKeyInArray!0 k!2581))))

(assert (= (and start!26404 res!137869) b!273878))

(assert (= (and b!273878 res!137863) b!273881))

(assert (= (and b!273881 res!137868) b!273880))

(assert (= (and b!273880 res!137870) b!273876))

(assert (= (and b!273876 res!137865) b!273875))

(assert (= (and b!273875 res!137871) b!273873))

(assert (= (and b!273873 res!137867) b!273877))

(assert (= (and b!273877 res!137864) b!273879))

(assert (= (and b!273879 res!137866) b!273874))

(declare-fun m!289209 () Bool)

(assert (=> b!273879 m!289209))

(assert (=> b!273879 m!289209))

(declare-fun m!289211 () Bool)

(assert (=> b!273879 m!289211))

(declare-fun m!289213 () Bool)

(assert (=> b!273880 m!289213))

(declare-fun m!289215 () Bool)

(assert (=> b!273875 m!289215))

(declare-fun m!289217 () Bool)

(assert (=> b!273876 m!289217))

(declare-fun m!289219 () Bool)

(assert (=> b!273874 m!289219))

(declare-fun m!289221 () Bool)

(assert (=> b!273874 m!289221))

(declare-fun m!289223 () Bool)

(assert (=> b!273874 m!289223))

(assert (=> b!273874 m!289223))

(declare-fun m!289225 () Bool)

(assert (=> b!273874 m!289225))

(declare-fun m!289227 () Bool)

(assert (=> b!273874 m!289227))

(declare-fun m!289229 () Bool)

(assert (=> b!273874 m!289229))

(assert (=> b!273874 m!289209))

(declare-fun m!289231 () Bool)

(assert (=> b!273874 m!289231))

(declare-fun m!289233 () Bool)

(assert (=> b!273874 m!289233))

(assert (=> b!273874 m!289209))

(declare-fun m!289235 () Bool)

(assert (=> b!273874 m!289235))

(declare-fun m!289237 () Bool)

(assert (=> start!26404 m!289237))

(declare-fun m!289239 () Bool)

(assert (=> start!26404 m!289239))

(assert (=> b!273877 m!289227))

(declare-fun m!289241 () Bool)

(assert (=> b!273881 m!289241))

(declare-fun m!289243 () Bool)

(assert (=> b!273873 m!289243))

(push 1)

