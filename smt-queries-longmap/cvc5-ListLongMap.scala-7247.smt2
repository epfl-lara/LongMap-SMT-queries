; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92544 () Bool)

(assert start!92544)

(declare-fun b!1052673 () Bool)

(declare-fun e!597704 () Bool)

(declare-fun e!597703 () Bool)

(assert (=> b!1052673 (= e!597704 e!597703)))

(declare-fun res!701805 () Bool)

(assert (=> b!1052673 (=> (not res!701805) (not e!597703))))

(declare-datatypes ((array!66345 0))(
  ( (array!66346 (arr!31912 (Array (_ BitVec 32) (_ BitVec 64))) (size!32448 (_ BitVec 32))) )
))
(declare-fun lt!464910 () array!66345)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052673 (= res!701805 (arrayContainsKey!0 lt!464910 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66345)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052673 (= lt!464910 (array!66346 (store (arr!31912 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32448 a!3488)))))

(declare-fun b!1052674 () Bool)

(declare-fun e!597706 () Bool)

(assert (=> b!1052674 (= e!597706 true)))

(declare-fun lt!464905 () (_ BitVec 32))

(assert (=> b!1052674 (not (= (select (arr!31912 a!3488) lt!464905) k!2747))))

(declare-datatypes ((Unit!34496 0))(
  ( (Unit!34497) )
))
(declare-fun lt!464909 () Unit!34496)

(declare-datatypes ((List!22224 0))(
  ( (Nil!22221) (Cons!22220 (h!23429 (_ BitVec 64)) (t!31531 List!22224)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66345 (_ BitVec 64) (_ BitVec 32) List!22224) Unit!34496)

(assert (=> b!1052674 (= lt!464909 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!464905 Nil!22221))))

(declare-fun lt!464908 () (_ BitVec 32))

(assert (=> b!1052674 (arrayContainsKey!0 a!3488 k!2747 lt!464908)))

(declare-fun lt!464906 () Unit!34496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34496)

(assert (=> b!1052674 (= lt!464906 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464908))))

(assert (=> b!1052674 (= lt!464908 (bvadd #b00000000000000000000000000000001 lt!464905))))

(declare-fun arrayNoDuplicates!0 (array!66345 (_ BitVec 32) List!22224) Bool)

(assert (=> b!1052674 (arrayNoDuplicates!0 a!3488 lt!464905 Nil!22221)))

(declare-fun lt!464907 () Unit!34496)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66345 (_ BitVec 32) (_ BitVec 32)) Unit!34496)

(assert (=> b!1052674 (= lt!464907 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464905))))

(declare-fun e!597705 () Bool)

(declare-fun b!1052675 () Bool)

(assert (=> b!1052675 (= e!597705 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052676 () Bool)

(declare-fun e!597701 () Bool)

(assert (=> b!1052676 (= e!597701 e!597705)))

(declare-fun res!701802 () Bool)

(assert (=> b!1052676 (=> res!701802 e!597705)))

(assert (=> b!1052676 (= res!701802 (or (bvsgt lt!464905 i!1381) (bvsle i!1381 lt!464905)))))

(declare-fun b!1052677 () Bool)

(declare-fun res!701806 () Bool)

(assert (=> b!1052677 (=> (not res!701806) (not e!597704))))

(assert (=> b!1052677 (= res!701806 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22221))))

(declare-fun b!1052678 () Bool)

(declare-fun res!701803 () Bool)

(assert (=> b!1052678 (=> (not res!701803) (not e!597704))))

(assert (=> b!1052678 (= res!701803 (= (select (arr!31912 a!3488) i!1381) k!2747))))

(declare-fun b!1052679 () Bool)

(declare-fun res!701804 () Bool)

(assert (=> b!1052679 (=> (not res!701804) (not e!597704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052679 (= res!701804 (validKeyInArray!0 k!2747))))

(declare-fun res!701807 () Bool)

(assert (=> start!92544 (=> (not res!701807) (not e!597704))))

(assert (=> start!92544 (= res!701807 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32448 a!3488)) (bvslt (size!32448 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92544 e!597704))

(assert (=> start!92544 true))

(declare-fun array_inv!24692 (array!66345) Bool)

(assert (=> start!92544 (array_inv!24692 a!3488)))

(declare-fun b!1052680 () Bool)

(declare-fun e!597700 () Bool)

(assert (=> b!1052680 (= e!597703 e!597700)))

(declare-fun res!701801 () Bool)

(assert (=> b!1052680 (=> (not res!701801) (not e!597700))))

(assert (=> b!1052680 (= res!701801 (not (= lt!464905 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66345 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052680 (= lt!464905 (arrayScanForKey!0 lt!464910 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052681 () Bool)

(assert (=> b!1052681 (= e!597700 (not e!597706))))

(declare-fun res!701799 () Bool)

(assert (=> b!1052681 (=> res!701799 e!597706)))

(assert (=> b!1052681 (= res!701799 (or (bvsgt lt!464905 i!1381) (bvsle i!1381 lt!464905)))))

(assert (=> b!1052681 e!597701))

(declare-fun res!701800 () Bool)

(assert (=> b!1052681 (=> (not res!701800) (not e!597701))))

(assert (=> b!1052681 (= res!701800 (= (select (store (arr!31912 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464905) k!2747))))

(assert (= (and start!92544 res!701807) b!1052677))

(assert (= (and b!1052677 res!701806) b!1052679))

(assert (= (and b!1052679 res!701804) b!1052678))

(assert (= (and b!1052678 res!701803) b!1052673))

(assert (= (and b!1052673 res!701805) b!1052680))

(assert (= (and b!1052680 res!701801) b!1052681))

(assert (= (and b!1052681 res!701800) b!1052676))

(assert (= (and b!1052676 (not res!701802)) b!1052675))

(assert (= (and b!1052681 (not res!701799)) b!1052674))

(declare-fun m!973067 () Bool)

(assert (=> b!1052680 m!973067))

(declare-fun m!973069 () Bool)

(assert (=> b!1052681 m!973069))

(declare-fun m!973071 () Bool)

(assert (=> b!1052681 m!973071))

(declare-fun m!973073 () Bool)

(assert (=> b!1052673 m!973073))

(assert (=> b!1052673 m!973069))

(declare-fun m!973075 () Bool)

(assert (=> b!1052679 m!973075))

(declare-fun m!973077 () Bool)

(assert (=> b!1052677 m!973077))

(declare-fun m!973079 () Bool)

(assert (=> start!92544 m!973079))

(declare-fun m!973081 () Bool)

(assert (=> b!1052675 m!973081))

(declare-fun m!973083 () Bool)

(assert (=> b!1052674 m!973083))

(declare-fun m!973085 () Bool)

(assert (=> b!1052674 m!973085))

(declare-fun m!973087 () Bool)

(assert (=> b!1052674 m!973087))

(declare-fun m!973089 () Bool)

(assert (=> b!1052674 m!973089))

(declare-fun m!973091 () Bool)

(assert (=> b!1052674 m!973091))

(declare-fun m!973093 () Bool)

(assert (=> b!1052674 m!973093))

(declare-fun m!973095 () Bool)

(assert (=> b!1052678 m!973095))

(push 1)

