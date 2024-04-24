; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93288 () Bool)

(assert start!93288)

(declare-fun b!1057045 () Bool)

(declare-fun e!600895 () Bool)

(assert (=> b!1057045 (= e!600895 true)))

(assert (=> b!1057045 false))

(declare-datatypes ((array!66628 0))(
  ( (array!66629 (arr!32035 (Array (_ BitVec 32) (_ BitVec 64))) (size!32572 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66628)

(declare-datatypes ((Unit!34597 0))(
  ( (Unit!34598) )
))
(declare-fun lt!466396 () Unit!34597)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22317 0))(
  ( (Nil!22314) (Cons!22313 (h!23531 (_ BitVec 64)) (t!31616 List!22317)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66628 (_ BitVec 64) (_ BitVec 32) List!22317) Unit!34597)

(assert (=> b!1057045 (= lt!466396 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22314))))

(declare-fun arrayContainsKey!0 (array!66628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057045 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!466394 () Unit!34597)

(declare-fun lt!466393 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66628 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34597)

(assert (=> b!1057045 (= lt!466394 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466393 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66628 (_ BitVec 32) List!22317) Bool)

(assert (=> b!1057045 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22314)))

(declare-fun lt!466395 () Unit!34597)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66628 (_ BitVec 32) (_ BitVec 32)) Unit!34597)

(assert (=> b!1057045 (= lt!466395 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1057046 () Bool)

(declare-fun res!705062 () Bool)

(declare-fun e!600899 () Bool)

(assert (=> b!1057046 (=> (not res!705062) (not e!600899))))

(assert (=> b!1057046 (= res!705062 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22314))))

(declare-fun b!1057048 () Bool)

(declare-fun e!600896 () Bool)

(assert (=> b!1057048 (= e!600896 (not e!600895))))

(declare-fun res!705061 () Bool)

(assert (=> b!1057048 (=> res!705061 e!600895)))

(assert (=> b!1057048 (= res!705061 (bvsle lt!466393 i!1381))))

(declare-fun e!600901 () Bool)

(assert (=> b!1057048 e!600901))

(declare-fun res!705055 () Bool)

(assert (=> b!1057048 (=> (not res!705055) (not e!600901))))

(assert (=> b!1057048 (= res!705055 (= (select (store (arr!32035 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466393) k0!2747))))

(declare-fun b!1057049 () Bool)

(declare-fun e!600900 () Bool)

(assert (=> b!1057049 (= e!600900 (arrayContainsKey!0 a!3488 k0!2747 lt!466393))))

(declare-fun b!1057050 () Bool)

(declare-fun res!705060 () Bool)

(assert (=> b!1057050 (=> (not res!705060) (not e!600899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057050 (= res!705060 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057051 () Bool)

(declare-fun e!600898 () Bool)

(assert (=> b!1057051 (= e!600898 e!600896)))

(declare-fun res!705054 () Bool)

(assert (=> b!1057051 (=> (not res!705054) (not e!600896))))

(assert (=> b!1057051 (= res!705054 (not (= lt!466393 i!1381)))))

(declare-fun lt!466397 () array!66628)

(declare-fun arrayScanForKey!0 (array!66628 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057051 (= lt!466393 (arrayScanForKey!0 lt!466397 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057052 () Bool)

(assert (=> b!1057052 (= e!600901 e!600900)))

(declare-fun res!705056 () Bool)

(assert (=> b!1057052 (=> res!705056 e!600900)))

(assert (=> b!1057052 (= res!705056 (bvsle lt!466393 i!1381))))

(declare-fun b!1057053 () Bool)

(declare-fun res!705057 () Bool)

(assert (=> b!1057053 (=> (not res!705057) (not e!600899))))

(assert (=> b!1057053 (= res!705057 (= (select (arr!32035 a!3488) i!1381) k0!2747))))

(declare-fun res!705058 () Bool)

(assert (=> start!93288 (=> (not res!705058) (not e!600899))))

(assert (=> start!93288 (= res!705058 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32572 a!3488)) (bvslt (size!32572 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93288 e!600899))

(assert (=> start!93288 true))

(declare-fun array_inv!24817 (array!66628) Bool)

(assert (=> start!93288 (array_inv!24817 a!3488)))

(declare-fun b!1057047 () Bool)

(assert (=> b!1057047 (= e!600899 e!600898)))

(declare-fun res!705059 () Bool)

(assert (=> b!1057047 (=> (not res!705059) (not e!600898))))

(assert (=> b!1057047 (= res!705059 (arrayContainsKey!0 lt!466397 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057047 (= lt!466397 (array!66629 (store (arr!32035 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32572 a!3488)))))

(assert (= (and start!93288 res!705058) b!1057046))

(assert (= (and b!1057046 res!705062) b!1057050))

(assert (= (and b!1057050 res!705060) b!1057053))

(assert (= (and b!1057053 res!705057) b!1057047))

(assert (= (and b!1057047 res!705059) b!1057051))

(assert (= (and b!1057051 res!705054) b!1057048))

(assert (= (and b!1057048 res!705055) b!1057052))

(assert (= (and b!1057052 (not res!705056)) b!1057049))

(assert (= (and b!1057048 (not res!705061)) b!1057045))

(declare-fun m!977369 () Bool)

(assert (=> b!1057051 m!977369))

(declare-fun m!977371 () Bool)

(assert (=> b!1057053 m!977371))

(declare-fun m!977373 () Bool)

(assert (=> b!1057050 m!977373))

(declare-fun m!977375 () Bool)

(assert (=> start!93288 m!977375))

(declare-fun m!977377 () Bool)

(assert (=> b!1057046 m!977377))

(declare-fun m!977379 () Bool)

(assert (=> b!1057049 m!977379))

(declare-fun m!977381 () Bool)

(assert (=> b!1057048 m!977381))

(declare-fun m!977383 () Bool)

(assert (=> b!1057048 m!977383))

(declare-fun m!977385 () Bool)

(assert (=> b!1057045 m!977385))

(declare-fun m!977387 () Bool)

(assert (=> b!1057045 m!977387))

(declare-fun m!977389 () Bool)

(assert (=> b!1057045 m!977389))

(declare-fun m!977391 () Bool)

(assert (=> b!1057045 m!977391))

(declare-fun m!977393 () Bool)

(assert (=> b!1057045 m!977393))

(declare-fun m!977395 () Bool)

(assert (=> b!1057047 m!977395))

(assert (=> b!1057047 m!977381))

(check-sat (not start!93288) (not b!1057047) (not b!1057049) (not b!1057051) (not b!1057045) (not b!1057050) (not b!1057046))
(check-sat)
