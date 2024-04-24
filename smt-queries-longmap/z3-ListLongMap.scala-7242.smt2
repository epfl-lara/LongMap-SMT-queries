; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92748 () Bool)

(assert start!92748)

(declare-fun b!1053508 () Bool)

(declare-fun res!701831 () Bool)

(declare-fun e!598203 () Bool)

(assert (=> b!1053508 (=> (not res!701831) (not e!598203))))

(declare-datatypes ((array!66364 0))(
  ( (array!66365 (arr!31915 (Array (_ BitVec 32) (_ BitVec 64))) (size!32452 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66364)

(declare-datatypes ((List!22197 0))(
  ( (Nil!22194) (Cons!22193 (h!23411 (_ BitVec 64)) (t!31496 List!22197)) )
))
(declare-fun arrayNoDuplicates!0 (array!66364 (_ BitVec 32) List!22197) Bool)

(assert (=> b!1053508 (= res!701831 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22194))))

(declare-fun b!1053509 () Bool)

(declare-fun res!701833 () Bool)

(declare-fun e!598206 () Bool)

(assert (=> b!1053509 (=> res!701833 e!598206)))

(declare-fun contains!6176 (List!22197 (_ BitVec 64)) Bool)

(assert (=> b!1053509 (= res!701833 (contains!6176 Nil!22194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053510 () Bool)

(declare-fun e!598205 () Bool)

(declare-fun e!598208 () Bool)

(assert (=> b!1053510 (= e!598205 e!598208)))

(declare-fun res!701840 () Bool)

(assert (=> b!1053510 (=> res!701840 e!598208)))

(declare-fun lt!465150 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053510 (= res!701840 (or (bvsgt lt!465150 i!1381) (bvsle i!1381 lt!465150)))))

(declare-fun b!1053511 () Bool)

(declare-fun e!598204 () Bool)

(declare-fun e!598209 () Bool)

(assert (=> b!1053511 (= e!598204 e!598209)))

(declare-fun res!701829 () Bool)

(assert (=> b!1053511 (=> (not res!701829) (not e!598209))))

(assert (=> b!1053511 (= res!701829 (not (= lt!465150 i!1381)))))

(declare-fun lt!465151 () array!66364)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66364 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053511 (= lt!465150 (arrayScanForKey!0 lt!465151 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053512 () Bool)

(declare-fun e!598207 () Bool)

(assert (=> b!1053512 (= e!598209 (not e!598207))))

(declare-fun res!701838 () Bool)

(assert (=> b!1053512 (=> res!701838 e!598207)))

(assert (=> b!1053512 (= res!701838 (or (bvsgt lt!465150 i!1381) (bvsle i!1381 lt!465150)))))

(assert (=> b!1053512 e!598205))

(declare-fun res!701834 () Bool)

(assert (=> b!1053512 (=> (not res!701834) (not e!598205))))

(assert (=> b!1053512 (= res!701834 (= (select (store (arr!31915 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465150) k0!2747))))

(declare-fun b!1053513 () Bool)

(declare-fun res!701830 () Bool)

(assert (=> b!1053513 (=> (not res!701830) (not e!598203))))

(assert (=> b!1053513 (= res!701830 (= (select (arr!31915 a!3488) i!1381) k0!2747))))

(declare-fun res!701837 () Bool)

(assert (=> start!92748 (=> (not res!701837) (not e!598203))))

(assert (=> start!92748 (= res!701837 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32452 a!3488)) (bvslt (size!32452 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92748 e!598203))

(assert (=> start!92748 true))

(declare-fun array_inv!24697 (array!66364) Bool)

(assert (=> start!92748 (array_inv!24697 a!3488)))

(declare-fun b!1053514 () Bool)

(assert (=> b!1053514 (= e!598203 e!598204)))

(declare-fun res!701832 () Bool)

(assert (=> b!1053514 (=> (not res!701832) (not e!598204))))

(declare-fun arrayContainsKey!0 (array!66364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053514 (= res!701832 (arrayContainsKey!0 lt!465151 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053514 (= lt!465151 (array!66365 (store (arr!31915 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32452 a!3488)))))

(declare-fun b!1053515 () Bool)

(declare-fun res!701836 () Bool)

(assert (=> b!1053515 (=> (not res!701836) (not e!598203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053515 (= res!701836 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053516 () Bool)

(declare-fun res!701839 () Bool)

(assert (=> b!1053516 (=> res!701839 e!598206)))

(declare-fun noDuplicate!1552 (List!22197) Bool)

(assert (=> b!1053516 (= res!701839 (not (noDuplicate!1552 Nil!22194)))))

(declare-fun b!1053517 () Bool)

(assert (=> b!1053517 (= e!598207 e!598206)))

(declare-fun res!701835 () Bool)

(assert (=> b!1053517 (=> res!701835 e!598206)))

(declare-fun lt!465152 () (_ BitVec 32))

(assert (=> b!1053517 (= res!701835 (or (bvslt lt!465150 #b00000000000000000000000000000000) (bvsge lt!465152 (size!32452 a!3488)) (bvsge lt!465150 (size!32452 a!3488))))))

(assert (=> b!1053517 (arrayContainsKey!0 a!3488 k0!2747 lt!465152)))

(declare-datatypes ((Unit!34471 0))(
  ( (Unit!34472) )
))
(declare-fun lt!465155 () Unit!34471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34471)

(assert (=> b!1053517 (= lt!465155 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!465152))))

(assert (=> b!1053517 (= lt!465152 (bvadd #b00000000000000000000000000000001 lt!465150))))

(assert (=> b!1053517 (arrayNoDuplicates!0 a!3488 lt!465150 Nil!22194)))

(declare-fun lt!465154 () Unit!34471)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66364 (_ BitVec 32) (_ BitVec 32)) Unit!34471)

(assert (=> b!1053517 (= lt!465154 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465150))))

(declare-fun b!1053518 () Bool)

(assert (=> b!1053518 (= e!598206 true)))

(declare-fun lt!465153 () Bool)

(assert (=> b!1053518 (= lt!465153 (contains!6176 Nil!22194 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053519 () Bool)

(assert (=> b!1053519 (= e!598208 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!92748 res!701837) b!1053508))

(assert (= (and b!1053508 res!701831) b!1053515))

(assert (= (and b!1053515 res!701836) b!1053513))

(assert (= (and b!1053513 res!701830) b!1053514))

(assert (= (and b!1053514 res!701832) b!1053511))

(assert (= (and b!1053511 res!701829) b!1053512))

(assert (= (and b!1053512 res!701834) b!1053510))

(assert (= (and b!1053510 (not res!701840)) b!1053519))

(assert (= (and b!1053512 (not res!701838)) b!1053517))

(assert (= (and b!1053517 (not res!701835)) b!1053516))

(assert (= (and b!1053516 (not res!701839)) b!1053509))

(assert (= (and b!1053509 (not res!701833)) b!1053518))

(declare-fun m!974267 () Bool)

(assert (=> b!1053519 m!974267))

(declare-fun m!974269 () Bool)

(assert (=> b!1053516 m!974269))

(declare-fun m!974271 () Bool)

(assert (=> b!1053509 m!974271))

(declare-fun m!974273 () Bool)

(assert (=> b!1053515 m!974273))

(declare-fun m!974275 () Bool)

(assert (=> b!1053514 m!974275))

(declare-fun m!974277 () Bool)

(assert (=> b!1053514 m!974277))

(declare-fun m!974279 () Bool)

(assert (=> b!1053518 m!974279))

(declare-fun m!974281 () Bool)

(assert (=> b!1053513 m!974281))

(declare-fun m!974283 () Bool)

(assert (=> b!1053508 m!974283))

(declare-fun m!974285 () Bool)

(assert (=> start!92748 m!974285))

(declare-fun m!974287 () Bool)

(assert (=> b!1053517 m!974287))

(declare-fun m!974289 () Bool)

(assert (=> b!1053517 m!974289))

(declare-fun m!974291 () Bool)

(assert (=> b!1053517 m!974291))

(declare-fun m!974293 () Bool)

(assert (=> b!1053517 m!974293))

(declare-fun m!974295 () Bool)

(assert (=> b!1053511 m!974295))

(assert (=> b!1053512 m!974277))

(declare-fun m!974297 () Bool)

(assert (=> b!1053512 m!974297))

(check-sat (not b!1053514) (not b!1053519) (not b!1053508) (not b!1053518) (not b!1053509) (not b!1053515) (not start!92748) (not b!1053517) (not b!1053511) (not b!1053516))
(check-sat)
