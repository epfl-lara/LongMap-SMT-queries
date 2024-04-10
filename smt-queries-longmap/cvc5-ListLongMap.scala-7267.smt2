; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92784 () Bool)

(assert start!92784)

(declare-fun b!1053939 () Bool)

(declare-fun res!702929 () Bool)

(declare-fun e!598660 () Bool)

(assert (=> b!1053939 (=> (not res!702929) (not e!598660))))

(declare-datatypes ((array!66477 0))(
  ( (array!66478 (arr!31972 (Array (_ BitVec 32) (_ BitVec 64))) (size!32508 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66477)

(declare-datatypes ((List!22284 0))(
  ( (Nil!22281) (Cons!22280 (h!23489 (_ BitVec 64)) (t!31591 List!22284)) )
))
(declare-fun arrayNoDuplicates!0 (array!66477 (_ BitVec 32) List!22284) Bool)

(assert (=> b!1053939 (= res!702929 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22281))))

(declare-fun e!598666 () Bool)

(declare-fun b!1053940 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun lt!465261 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053940 (= e!598666 (arrayContainsKey!0 a!3488 k!2747 lt!465261))))

(declare-fun res!702927 () Bool)

(assert (=> start!92784 (=> (not res!702927) (not e!598660))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92784 (= res!702927 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32508 a!3488)) (bvslt (size!32508 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92784 e!598660))

(assert (=> start!92784 true))

(declare-fun array_inv!24752 (array!66477) Bool)

(assert (=> start!92784 (array_inv!24752 a!3488)))

(declare-fun b!1053941 () Bool)

(declare-fun res!702921 () Bool)

(assert (=> b!1053941 (=> (not res!702921) (not e!598660))))

(assert (=> b!1053941 (= res!702921 (= (select (arr!31972 a!3488) i!1381) k!2747))))

(declare-fun b!1053942 () Bool)

(declare-fun e!598665 () Bool)

(assert (=> b!1053942 (= e!598660 e!598665)))

(declare-fun res!702928 () Bool)

(assert (=> b!1053942 (=> (not res!702928) (not e!598665))))

(declare-fun lt!465259 () array!66477)

(assert (=> b!1053942 (= res!702928 (arrayContainsKey!0 lt!465259 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053942 (= lt!465259 (array!66478 (store (arr!31972 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32508 a!3488)))))

(declare-fun b!1053943 () Bool)

(declare-fun e!598661 () Bool)

(assert (=> b!1053943 (= e!598665 e!598661)))

(declare-fun res!702923 () Bool)

(assert (=> b!1053943 (=> (not res!702923) (not e!598661))))

(assert (=> b!1053943 (= res!702923 (not (= lt!465261 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66477 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053943 (= lt!465261 (arrayScanForKey!0 lt!465259 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053944 () Bool)

(declare-fun e!598664 () Bool)

(assert (=> b!1053944 (= e!598661 (not e!598664))))

(declare-fun res!702925 () Bool)

(assert (=> b!1053944 (=> res!702925 e!598664)))

(assert (=> b!1053944 (= res!702925 (bvsle lt!465261 i!1381))))

(declare-fun e!598663 () Bool)

(assert (=> b!1053944 e!598663))

(declare-fun res!702926 () Bool)

(assert (=> b!1053944 (=> (not res!702926) (not e!598663))))

(assert (=> b!1053944 (= res!702926 (= (select (store (arr!31972 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465261) k!2747))))

(declare-fun b!1053945 () Bool)

(assert (=> b!1053945 (= e!598664 (bvsge lt!465261 #b00000000000000000000000000000000))))

(assert (=> b!1053945 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22281)))

(declare-datatypes ((Unit!34502 0))(
  ( (Unit!34503) )
))
(declare-fun lt!465260 () Unit!34502)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66477 (_ BitVec 32) (_ BitVec 32)) Unit!34502)

(assert (=> b!1053945 (= lt!465260 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1053946 () Bool)

(assert (=> b!1053946 (= e!598663 e!598666)))

(declare-fun res!702924 () Bool)

(assert (=> b!1053946 (=> res!702924 e!598666)))

(assert (=> b!1053946 (= res!702924 (bvsle lt!465261 i!1381))))

(declare-fun b!1053947 () Bool)

(declare-fun res!702922 () Bool)

(assert (=> b!1053947 (=> (not res!702922) (not e!598660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053947 (= res!702922 (validKeyInArray!0 k!2747))))

(assert (= (and start!92784 res!702927) b!1053939))

(assert (= (and b!1053939 res!702929) b!1053947))

(assert (= (and b!1053947 res!702922) b!1053941))

(assert (= (and b!1053941 res!702921) b!1053942))

(assert (= (and b!1053942 res!702928) b!1053943))

(assert (= (and b!1053943 res!702923) b!1053944))

(assert (= (and b!1053944 res!702926) b!1053946))

(assert (= (and b!1053946 (not res!702924)) b!1053940))

(assert (= (and b!1053944 (not res!702925)) b!1053945))

(declare-fun m!974099 () Bool)

(assert (=> b!1053947 m!974099))

(declare-fun m!974101 () Bool)

(assert (=> b!1053939 m!974101))

(declare-fun m!974103 () Bool)

(assert (=> b!1053943 m!974103))

(declare-fun m!974105 () Bool)

(assert (=> start!92784 m!974105))

(declare-fun m!974107 () Bool)

(assert (=> b!1053945 m!974107))

(declare-fun m!974109 () Bool)

(assert (=> b!1053945 m!974109))

(declare-fun m!974111 () Bool)

(assert (=> b!1053941 m!974111))

(declare-fun m!974113 () Bool)

(assert (=> b!1053942 m!974113))

(declare-fun m!974115 () Bool)

(assert (=> b!1053942 m!974115))

(declare-fun m!974117 () Bool)

(assert (=> b!1053940 m!974117))

(assert (=> b!1053944 m!974115))

(declare-fun m!974119 () Bool)

(assert (=> b!1053944 m!974119))

(push 1)

