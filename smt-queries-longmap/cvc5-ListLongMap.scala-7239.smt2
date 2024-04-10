; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92496 () Bool)

(assert start!92496)

(declare-fun b!1051869 () Bool)

(declare-fun res!701005 () Bool)

(declare-fun e!597146 () Bool)

(assert (=> b!1051869 (=> (not res!701005) (not e!597146))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051869 (= res!701005 (validKeyInArray!0 k!2747))))

(declare-fun b!1051870 () Bool)

(declare-fun res!701003 () Bool)

(assert (=> b!1051870 (=> (not res!701003) (not e!597146))))

(declare-datatypes ((array!66297 0))(
  ( (array!66298 (arr!31888 (Array (_ BitVec 32) (_ BitVec 64))) (size!32424 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66297)

(declare-datatypes ((List!22200 0))(
  ( (Nil!22197) (Cons!22196 (h!23405 (_ BitVec 64)) (t!31507 List!22200)) )
))
(declare-fun arrayNoDuplicates!0 (array!66297 (_ BitVec 32) List!22200) Bool)

(assert (=> b!1051870 (= res!701003 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22197))))

(declare-fun b!1051871 () Bool)

(declare-fun e!597147 () Bool)

(assert (=> b!1051871 (= e!597147 true)))

(declare-fun lt!464477 () Bool)

(declare-fun contains!6142 (List!22200 (_ BitVec 64)) Bool)

(assert (=> b!1051871 (= lt!464477 (contains!6142 Nil!22197 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051872 () Bool)

(declare-fun res!700995 () Bool)

(assert (=> b!1051872 (=> res!700995 e!597147)))

(declare-fun noDuplicate!1527 (List!22200) Bool)

(assert (=> b!1051872 (= res!700995 (not (noDuplicate!1527 Nil!22197)))))

(declare-fun b!1051873 () Bool)

(declare-fun res!700999 () Bool)

(assert (=> b!1051873 (=> (not res!700999) (not e!597146))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051873 (= res!700999 (= (select (arr!31888 a!3488) i!1381) k!2747))))

(declare-fun b!1051874 () Bool)

(declare-fun e!597145 () Bool)

(assert (=> b!1051874 (= e!597145 e!597147)))

(declare-fun res!701006 () Bool)

(assert (=> b!1051874 (=> res!701006 e!597147)))

(declare-fun lt!464473 () (_ BitVec 32))

(declare-fun lt!464478 () (_ BitVec 32))

(assert (=> b!1051874 (= res!701006 (or (bvslt lt!464478 #b00000000000000000000000000000000) (bvsge lt!464473 (size!32424 a!3488)) (bvsge lt!464478 (size!32424 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051874 (arrayContainsKey!0 a!3488 k!2747 lt!464473)))

(declare-datatypes ((Unit!34448 0))(
  ( (Unit!34449) )
))
(declare-fun lt!464475 () Unit!34448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66297 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34448)

(assert (=> b!1051874 (= lt!464475 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464473))))

(assert (=> b!1051874 (= lt!464473 (bvadd #b00000000000000000000000000000001 lt!464478))))

(assert (=> b!1051874 (arrayNoDuplicates!0 a!3488 lt!464478 Nil!22197)))

(declare-fun lt!464474 () Unit!34448)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66297 (_ BitVec 32) (_ BitVec 32)) Unit!34448)

(assert (=> b!1051874 (= lt!464474 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464478))))

(declare-fun b!1051875 () Bool)

(declare-fun e!597151 () Bool)

(declare-fun e!597148 () Bool)

(assert (=> b!1051875 (= e!597151 e!597148)))

(declare-fun res!701002 () Bool)

(assert (=> b!1051875 (=> res!701002 e!597148)))

(assert (=> b!1051875 (= res!701002 (or (bvsgt lt!464478 i!1381) (bvsle i!1381 lt!464478)))))

(declare-fun res!701004 () Bool)

(assert (=> start!92496 (=> (not res!701004) (not e!597146))))

(assert (=> start!92496 (= res!701004 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32424 a!3488)) (bvslt (size!32424 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92496 e!597146))

(assert (=> start!92496 true))

(declare-fun array_inv!24668 (array!66297) Bool)

(assert (=> start!92496 (array_inv!24668 a!3488)))

(declare-fun b!1051876 () Bool)

(declare-fun res!700997 () Bool)

(assert (=> b!1051876 (=> res!700997 e!597147)))

(assert (=> b!1051876 (= res!700997 (contains!6142 Nil!22197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051877 () Bool)

(declare-fun e!597150 () Bool)

(assert (=> b!1051877 (= e!597146 e!597150)))

(declare-fun res!700998 () Bool)

(assert (=> b!1051877 (=> (not res!700998) (not e!597150))))

(declare-fun lt!464476 () array!66297)

(assert (=> b!1051877 (= res!700998 (arrayContainsKey!0 lt!464476 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051877 (= lt!464476 (array!66298 (store (arr!31888 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32424 a!3488)))))

(declare-fun b!1051878 () Bool)

(assert (=> b!1051878 (= e!597148 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051879 () Bool)

(declare-fun e!597149 () Bool)

(assert (=> b!1051879 (= e!597149 (not e!597145))))

(declare-fun res!700996 () Bool)

(assert (=> b!1051879 (=> res!700996 e!597145)))

(assert (=> b!1051879 (= res!700996 (or (bvsgt lt!464478 i!1381) (bvsle i!1381 lt!464478)))))

(assert (=> b!1051879 e!597151))

(declare-fun res!701000 () Bool)

(assert (=> b!1051879 (=> (not res!701000) (not e!597151))))

(assert (=> b!1051879 (= res!701000 (= (select (store (arr!31888 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464478) k!2747))))

(declare-fun b!1051880 () Bool)

(assert (=> b!1051880 (= e!597150 e!597149)))

(declare-fun res!701001 () Bool)

(assert (=> b!1051880 (=> (not res!701001) (not e!597149))))

(assert (=> b!1051880 (= res!701001 (not (= lt!464478 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66297 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051880 (= lt!464478 (arrayScanForKey!0 lt!464476 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92496 res!701004) b!1051870))

(assert (= (and b!1051870 res!701003) b!1051869))

(assert (= (and b!1051869 res!701005) b!1051873))

(assert (= (and b!1051873 res!700999) b!1051877))

(assert (= (and b!1051877 res!700998) b!1051880))

(assert (= (and b!1051880 res!701001) b!1051879))

(assert (= (and b!1051879 res!701000) b!1051875))

(assert (= (and b!1051875 (not res!701002)) b!1051878))

(assert (= (and b!1051879 (not res!700996)) b!1051874))

(assert (= (and b!1051874 (not res!701006)) b!1051872))

(assert (= (and b!1051872 (not res!700995)) b!1051876))

(assert (= (and b!1051876 (not res!700997)) b!1051871))

(declare-fun m!972311 () Bool)

(assert (=> b!1051876 m!972311))

(declare-fun m!972313 () Bool)

(assert (=> start!92496 m!972313))

(declare-fun m!972315 () Bool)

(assert (=> b!1051874 m!972315))

(declare-fun m!972317 () Bool)

(assert (=> b!1051874 m!972317))

(declare-fun m!972319 () Bool)

(assert (=> b!1051874 m!972319))

(declare-fun m!972321 () Bool)

(assert (=> b!1051874 m!972321))

(declare-fun m!972323 () Bool)

(assert (=> b!1051872 m!972323))

(declare-fun m!972325 () Bool)

(assert (=> b!1051869 m!972325))

(declare-fun m!972327 () Bool)

(assert (=> b!1051878 m!972327))

(declare-fun m!972329 () Bool)

(assert (=> b!1051879 m!972329))

(declare-fun m!972331 () Bool)

(assert (=> b!1051879 m!972331))

(declare-fun m!972333 () Bool)

(assert (=> b!1051880 m!972333))

(declare-fun m!972335 () Bool)

(assert (=> b!1051873 m!972335))

(declare-fun m!972337 () Bool)

(assert (=> b!1051877 m!972337))

(assert (=> b!1051877 m!972329))

(declare-fun m!972339 () Bool)

(assert (=> b!1051870 m!972339))

(declare-fun m!972341 () Bool)

(assert (=> b!1051871 m!972341))

(push 1)

