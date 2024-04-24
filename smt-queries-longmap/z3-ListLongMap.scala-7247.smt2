; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92778 () Bool)

(assert start!92778)

(declare-fun b!1053988 () Bool)

(declare-fun e!598549 () Bool)

(assert (=> b!1053988 (= e!598549 true)))

(declare-datatypes ((array!66394 0))(
  ( (array!66395 (arr!31930 (Array (_ BitVec 32) (_ BitVec 64))) (size!32467 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66394)

(declare-fun lt!465425 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1053988 (not (= (select (arr!31930 a!3488) lt!465425) k0!2747))))

(declare-datatypes ((Unit!34501 0))(
  ( (Unit!34502) )
))
(declare-fun lt!465424 () Unit!34501)

(declare-datatypes ((List!22212 0))(
  ( (Nil!22209) (Cons!22208 (h!23426 (_ BitVec 64)) (t!31511 List!22212)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66394 (_ BitVec 64) (_ BitVec 32) List!22212) Unit!34501)

(assert (=> b!1053988 (= lt!465424 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!465425 Nil!22209))))

(declare-fun lt!465422 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053988 (arrayContainsKey!0 a!3488 k0!2747 lt!465422)))

(declare-fun lt!465421 () Unit!34501)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34501)

(assert (=> b!1053988 (= lt!465421 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!465422))))

(assert (=> b!1053988 (= lt!465422 (bvadd #b00000000000000000000000000000001 lt!465425))))

(declare-fun arrayNoDuplicates!0 (array!66394 (_ BitVec 32) List!22212) Bool)

(assert (=> b!1053988 (arrayNoDuplicates!0 a!3488 lt!465425 Nil!22209)))

(declare-fun lt!465423 () Unit!34501)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66394 (_ BitVec 32) (_ BitVec 32)) Unit!34501)

(assert (=> b!1053988 (= lt!465423 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465425))))

(declare-fun b!1053989 () Bool)

(declare-fun e!598545 () Bool)

(declare-fun e!598543 () Bool)

(assert (=> b!1053989 (= e!598545 e!598543)))

(declare-fun res!702309 () Bool)

(assert (=> b!1053989 (=> (not res!702309) (not e!598543))))

(assert (=> b!1053989 (= res!702309 (not (= lt!465425 i!1381)))))

(declare-fun lt!465420 () array!66394)

(declare-fun arrayScanForKey!0 (array!66394 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053989 (= lt!465425 (arrayScanForKey!0 lt!465420 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053990 () Bool)

(assert (=> b!1053990 (= e!598543 (not e!598549))))

(declare-fun res!702315 () Bool)

(assert (=> b!1053990 (=> res!702315 e!598549)))

(assert (=> b!1053990 (= res!702315 (or (bvsgt lt!465425 i!1381) (bvsle i!1381 lt!465425)))))

(declare-fun e!598544 () Bool)

(assert (=> b!1053990 e!598544))

(declare-fun res!702317 () Bool)

(assert (=> b!1053990 (=> (not res!702317) (not e!598544))))

(assert (=> b!1053990 (= res!702317 (= (select (store (arr!31930 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465425) k0!2747))))

(declare-fun b!1053991 () Bool)

(declare-fun e!598546 () Bool)

(assert (=> b!1053991 (= e!598546 e!598545)))

(declare-fun res!702310 () Bool)

(assert (=> b!1053991 (=> (not res!702310) (not e!598545))))

(assert (=> b!1053991 (= res!702310 (arrayContainsKey!0 lt!465420 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053991 (= lt!465420 (array!66395 (store (arr!31930 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32467 a!3488)))))

(declare-fun b!1053992 () Bool)

(declare-fun res!702316 () Bool)

(assert (=> b!1053992 (=> (not res!702316) (not e!598546))))

(assert (=> b!1053992 (= res!702316 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22209))))

(declare-fun b!1053993 () Bool)

(declare-fun e!598548 () Bool)

(assert (=> b!1053993 (= e!598548 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1053994 () Bool)

(assert (=> b!1053994 (= e!598544 e!598548)))

(declare-fun res!702312 () Bool)

(assert (=> b!1053994 (=> res!702312 e!598548)))

(assert (=> b!1053994 (= res!702312 (or (bvsgt lt!465425 i!1381) (bvsle i!1381 lt!465425)))))

(declare-fun res!702313 () Bool)

(assert (=> start!92778 (=> (not res!702313) (not e!598546))))

(assert (=> start!92778 (= res!702313 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32467 a!3488)) (bvslt (size!32467 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92778 e!598546))

(assert (=> start!92778 true))

(declare-fun array_inv!24712 (array!66394) Bool)

(assert (=> start!92778 (array_inv!24712 a!3488)))

(declare-fun b!1053995 () Bool)

(declare-fun res!702314 () Bool)

(assert (=> b!1053995 (=> (not res!702314) (not e!598546))))

(assert (=> b!1053995 (= res!702314 (= (select (arr!31930 a!3488) i!1381) k0!2747))))

(declare-fun b!1053996 () Bool)

(declare-fun res!702311 () Bool)

(assert (=> b!1053996 (=> (not res!702311) (not e!598546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053996 (= res!702311 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92778 res!702313) b!1053992))

(assert (= (and b!1053992 res!702316) b!1053996))

(assert (= (and b!1053996 res!702311) b!1053995))

(assert (= (and b!1053995 res!702314) b!1053991))

(assert (= (and b!1053991 res!702310) b!1053989))

(assert (= (and b!1053989 res!702309) b!1053990))

(assert (= (and b!1053990 res!702317) b!1053994))

(assert (= (and b!1053994 (not res!702312)) b!1053993))

(assert (= (and b!1053990 (not res!702315)) b!1053988))

(declare-fun m!974735 () Bool)

(assert (=> b!1053990 m!974735))

(declare-fun m!974737 () Bool)

(assert (=> b!1053990 m!974737))

(declare-fun m!974739 () Bool)

(assert (=> b!1053995 m!974739))

(declare-fun m!974741 () Bool)

(assert (=> b!1053989 m!974741))

(declare-fun m!974743 () Bool)

(assert (=> b!1053988 m!974743))

(declare-fun m!974745 () Bool)

(assert (=> b!1053988 m!974745))

(declare-fun m!974747 () Bool)

(assert (=> b!1053988 m!974747))

(declare-fun m!974749 () Bool)

(assert (=> b!1053988 m!974749))

(declare-fun m!974751 () Bool)

(assert (=> b!1053988 m!974751))

(declare-fun m!974753 () Bool)

(assert (=> b!1053988 m!974753))

(declare-fun m!974755 () Bool)

(assert (=> b!1053991 m!974755))

(assert (=> b!1053991 m!974735))

(declare-fun m!974757 () Bool)

(assert (=> b!1053993 m!974757))

(declare-fun m!974759 () Bool)

(assert (=> b!1053992 m!974759))

(declare-fun m!974761 () Bool)

(assert (=> b!1053996 m!974761))

(declare-fun m!974763 () Bool)

(assert (=> start!92778 m!974763))

(check-sat (not b!1053996) (not b!1053991) (not b!1053988) (not b!1053989) (not start!92778) (not b!1053993) (not b!1053992))
(check-sat)
