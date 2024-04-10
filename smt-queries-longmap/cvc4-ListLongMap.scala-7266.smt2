; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92782 () Bool)

(assert start!92782)

(declare-fun b!1053913 () Bool)

(declare-fun res!702895 () Bool)

(declare-fun e!598641 () Bool)

(assert (=> b!1053913 (=> (not res!702895) (not e!598641))))

(declare-datatypes ((array!66475 0))(
  ( (array!66476 (arr!31971 (Array (_ BitVec 32) (_ BitVec 64))) (size!32507 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66475)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053913 (= res!702895 (= (select (arr!31971 a!3488) i!1381) k!2747))))

(declare-fun b!1053914 () Bool)

(declare-fun res!702896 () Bool)

(assert (=> b!1053914 (=> (not res!702896) (not e!598641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053914 (= res!702896 (validKeyInArray!0 k!2747))))

(declare-fun b!1053915 () Bool)

(declare-fun e!598644 () Bool)

(declare-fun e!598642 () Bool)

(assert (=> b!1053915 (= e!598644 e!598642)))

(declare-fun res!702900 () Bool)

(assert (=> b!1053915 (=> (not res!702900) (not e!598642))))

(declare-fun lt!465252 () (_ BitVec 32))

(assert (=> b!1053915 (= res!702900 (not (= lt!465252 i!1381)))))

(declare-fun lt!465251 () array!66475)

(declare-fun arrayScanForKey!0 (array!66475 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053915 (= lt!465252 (arrayScanForKey!0 lt!465251 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053916 () Bool)

(assert (=> b!1053916 (= e!598641 e!598644)))

(declare-fun res!702901 () Bool)

(assert (=> b!1053916 (=> (not res!702901) (not e!598644))))

(declare-fun arrayContainsKey!0 (array!66475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053916 (= res!702901 (arrayContainsKey!0 lt!465251 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053916 (= lt!465251 (array!66476 (store (arr!31971 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32507 a!3488)))))

(declare-fun b!1053917 () Bool)

(declare-fun e!598645 () Bool)

(declare-fun e!598640 () Bool)

(assert (=> b!1053917 (= e!598645 e!598640)))

(declare-fun res!702898 () Bool)

(assert (=> b!1053917 (=> res!702898 e!598640)))

(assert (=> b!1053917 (= res!702898 (bvsle lt!465252 i!1381))))

(declare-fun b!1053918 () Bool)

(declare-fun res!702902 () Bool)

(assert (=> b!1053918 (=> (not res!702902) (not e!598641))))

(declare-datatypes ((List!22283 0))(
  ( (Nil!22280) (Cons!22279 (h!23488 (_ BitVec 64)) (t!31590 List!22283)) )
))
(declare-fun arrayNoDuplicates!0 (array!66475 (_ BitVec 32) List!22283) Bool)

(assert (=> b!1053918 (= res!702902 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22280))))

(declare-fun res!702899 () Bool)

(assert (=> start!92782 (=> (not res!702899) (not e!598641))))

(assert (=> start!92782 (= res!702899 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32507 a!3488)) (bvslt (size!32507 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92782 e!598641))

(assert (=> start!92782 true))

(declare-fun array_inv!24751 (array!66475) Bool)

(assert (=> start!92782 (array_inv!24751 a!3488)))

(declare-fun b!1053919 () Bool)

(assert (=> b!1053919 (= e!598640 (arrayContainsKey!0 a!3488 k!2747 lt!465252))))

(declare-fun b!1053920 () Bool)

(assert (=> b!1053920 (= e!598642 (not true))))

(assert (=> b!1053920 e!598645))

(declare-fun res!702897 () Bool)

(assert (=> b!1053920 (=> (not res!702897) (not e!598645))))

(assert (=> b!1053920 (= res!702897 (= (select (store (arr!31971 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465252) k!2747))))

(assert (= (and start!92782 res!702899) b!1053918))

(assert (= (and b!1053918 res!702902) b!1053914))

(assert (= (and b!1053914 res!702896) b!1053913))

(assert (= (and b!1053913 res!702895) b!1053916))

(assert (= (and b!1053916 res!702901) b!1053915))

(assert (= (and b!1053915 res!702900) b!1053920))

(assert (= (and b!1053920 res!702897) b!1053917))

(assert (= (and b!1053917 (not res!702898)) b!1053919))

(declare-fun m!974081 () Bool)

(assert (=> b!1053915 m!974081))

(declare-fun m!974083 () Bool)

(assert (=> b!1053916 m!974083))

(declare-fun m!974085 () Bool)

(assert (=> b!1053916 m!974085))

(declare-fun m!974087 () Bool)

(assert (=> b!1053913 m!974087))

(assert (=> b!1053920 m!974085))

(declare-fun m!974089 () Bool)

(assert (=> b!1053920 m!974089))

(declare-fun m!974091 () Bool)

(assert (=> b!1053919 m!974091))

(declare-fun m!974093 () Bool)

(assert (=> start!92782 m!974093))

(declare-fun m!974095 () Bool)

(assert (=> b!1053914 m!974095))

(declare-fun m!974097 () Bool)

(assert (=> b!1053918 m!974097))

(push 1)

(assert (not b!1053915))

(assert (not b!1053918))

