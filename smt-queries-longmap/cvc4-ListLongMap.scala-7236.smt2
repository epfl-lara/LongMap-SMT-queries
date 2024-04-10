; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92482 () Bool)

(assert start!92482)

(declare-fun b!1051617 () Bool)

(declare-fun e!596976 () Bool)

(declare-fun e!596983 () Bool)

(assert (=> b!1051617 (= e!596976 e!596983)))

(declare-fun res!700751 () Bool)

(assert (=> b!1051617 (=> (not res!700751) (not e!596983))))

(declare-fun lt!464352 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051617 (= res!700751 (not (= lt!464352 i!1381)))))

(declare-datatypes ((array!66283 0))(
  ( (array!66284 (arr!31881 (Array (_ BitVec 32) (_ BitVec 64))) (size!32417 (_ BitVec 32))) )
))
(declare-fun lt!464348 () array!66283)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66283 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051617 (= lt!464352 (arrayScanForKey!0 lt!464348 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051618 () Bool)

(declare-fun e!596982 () Bool)

(assert (=> b!1051618 (= e!596982 e!596976)))

(declare-fun res!700743 () Bool)

(assert (=> b!1051618 (=> (not res!700743) (not e!596976))))

(declare-fun arrayContainsKey!0 (array!66283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051618 (= res!700743 (arrayContainsKey!0 lt!464348 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66283)

(assert (=> b!1051618 (= lt!464348 (array!66284 (store (arr!31881 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32417 a!3488)))))

(declare-fun b!1051619 () Bool)

(declare-fun e!596980 () Bool)

(assert (=> b!1051619 (= e!596983 (not e!596980))))

(declare-fun res!700745 () Bool)

(assert (=> b!1051619 (=> res!700745 e!596980)))

(assert (=> b!1051619 (= res!700745 (or (bvsgt lt!464352 i!1381) (bvsle i!1381 lt!464352)))))

(declare-fun e!596981 () Bool)

(assert (=> b!1051619 e!596981))

(declare-fun res!700749 () Bool)

(assert (=> b!1051619 (=> (not res!700749) (not e!596981))))

(assert (=> b!1051619 (= res!700749 (= (select (store (arr!31881 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464352) k!2747))))

(declare-fun b!1051620 () Bool)

(declare-fun res!700744 () Bool)

(declare-fun e!596977 () Bool)

(assert (=> b!1051620 (=> res!700744 e!596977)))

(declare-datatypes ((List!22193 0))(
  ( (Nil!22190) (Cons!22189 (h!23398 (_ BitVec 64)) (t!31500 List!22193)) )
))
(declare-fun noDuplicate!1520 (List!22193) Bool)

(assert (=> b!1051620 (= res!700744 (not (noDuplicate!1520 Nil!22190)))))

(declare-fun b!1051621 () Bool)

(assert (=> b!1051621 (= e!596977 true)))

(declare-fun lt!464350 () Bool)

(declare-fun contains!6135 (List!22193 (_ BitVec 64)) Bool)

(assert (=> b!1051621 (= lt!464350 (contains!6135 Nil!22190 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051622 () Bool)

(declare-fun e!596979 () Bool)

(assert (=> b!1051622 (= e!596981 e!596979)))

(declare-fun res!700746 () Bool)

(assert (=> b!1051622 (=> res!700746 e!596979)))

(assert (=> b!1051622 (= res!700746 (or (bvsgt lt!464352 i!1381) (bvsle i!1381 lt!464352)))))

(declare-fun b!1051623 () Bool)

(declare-fun res!700752 () Bool)

(assert (=> b!1051623 (=> (not res!700752) (not e!596982))))

(assert (=> b!1051623 (= res!700752 (= (select (arr!31881 a!3488) i!1381) k!2747))))

(declare-fun b!1051625 () Bool)

(declare-fun res!700754 () Bool)

(assert (=> b!1051625 (=> (not res!700754) (not e!596982))))

(declare-fun arrayNoDuplicates!0 (array!66283 (_ BitVec 32) List!22193) Bool)

(assert (=> b!1051625 (= res!700754 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22190))))

(declare-fun b!1051626 () Bool)

(declare-fun res!700750 () Bool)

(assert (=> b!1051626 (=> (not res!700750) (not e!596982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051626 (= res!700750 (validKeyInArray!0 k!2747))))

(declare-fun b!1051627 () Bool)

(assert (=> b!1051627 (= e!596980 e!596977)))

(declare-fun res!700748 () Bool)

(assert (=> b!1051627 (=> res!700748 e!596977)))

(declare-fun lt!464347 () (_ BitVec 32))

(assert (=> b!1051627 (= res!700748 (or (bvslt lt!464352 #b00000000000000000000000000000000) (bvsge lt!464347 (size!32417 a!3488)) (bvsge lt!464352 (size!32417 a!3488))))))

(assert (=> b!1051627 (arrayContainsKey!0 a!3488 k!2747 lt!464347)))

(declare-datatypes ((Unit!34434 0))(
  ( (Unit!34435) )
))
(declare-fun lt!464349 () Unit!34434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34434)

(assert (=> b!1051627 (= lt!464349 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464347))))

(assert (=> b!1051627 (= lt!464347 (bvadd #b00000000000000000000000000000001 lt!464352))))

(assert (=> b!1051627 (arrayNoDuplicates!0 a!3488 lt!464352 Nil!22190)))

(declare-fun lt!464351 () Unit!34434)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66283 (_ BitVec 32) (_ BitVec 32)) Unit!34434)

(assert (=> b!1051627 (= lt!464351 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464352))))

(declare-fun b!1051628 () Bool)

(declare-fun res!700747 () Bool)

(assert (=> b!1051628 (=> res!700747 e!596977)))

(assert (=> b!1051628 (= res!700747 (contains!6135 Nil!22190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051624 () Bool)

(assert (=> b!1051624 (= e!596979 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!700753 () Bool)

(assert (=> start!92482 (=> (not res!700753) (not e!596982))))

(assert (=> start!92482 (= res!700753 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32417 a!3488)) (bvslt (size!32417 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92482 e!596982))

(assert (=> start!92482 true))

(declare-fun array_inv!24661 (array!66283) Bool)

(assert (=> start!92482 (array_inv!24661 a!3488)))

(assert (= (and start!92482 res!700753) b!1051625))

(assert (= (and b!1051625 res!700754) b!1051626))

(assert (= (and b!1051626 res!700750) b!1051623))

(assert (= (and b!1051623 res!700752) b!1051618))

(assert (= (and b!1051618 res!700743) b!1051617))

(assert (= (and b!1051617 res!700751) b!1051619))

(assert (= (and b!1051619 res!700749) b!1051622))

(assert (= (and b!1051622 (not res!700746)) b!1051624))

(assert (= (and b!1051619 (not res!700745)) b!1051627))

(assert (= (and b!1051627 (not res!700748)) b!1051620))

(assert (= (and b!1051620 (not res!700744)) b!1051628))

(assert (= (and b!1051628 (not res!700747)) b!1051621))

(declare-fun m!972087 () Bool)

(assert (=> b!1051618 m!972087))

(declare-fun m!972089 () Bool)

(assert (=> b!1051618 m!972089))

(declare-fun m!972091 () Bool)

(assert (=> b!1051626 m!972091))

(declare-fun m!972093 () Bool)

(assert (=> b!1051617 m!972093))

(declare-fun m!972095 () Bool)

(assert (=> b!1051621 m!972095))

(assert (=> b!1051619 m!972089))

(declare-fun m!972097 () Bool)

(assert (=> b!1051619 m!972097))

(declare-fun m!972099 () Bool)

(assert (=> b!1051628 m!972099))

(declare-fun m!972101 () Bool)

(assert (=> b!1051624 m!972101))

(declare-fun m!972103 () Bool)

(assert (=> b!1051625 m!972103))

(declare-fun m!972105 () Bool)

(assert (=> b!1051620 m!972105))

(declare-fun m!972107 () Bool)

(assert (=> start!92482 m!972107))

(declare-fun m!972109 () Bool)

(assert (=> b!1051627 m!972109))

(declare-fun m!972111 () Bool)

(assert (=> b!1051627 m!972111))

(declare-fun m!972113 () Bool)

(assert (=> b!1051627 m!972113))

(declare-fun m!972115 () Bool)

(assert (=> b!1051627 m!972115))

(declare-fun m!972117 () Bool)

(assert (=> b!1051623 m!972117))

(push 1)

