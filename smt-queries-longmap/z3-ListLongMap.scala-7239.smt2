; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92730 () Bool)

(assert start!92730)

(declare-fun b!1053185 () Bool)

(declare-fun res!701516 () Bool)

(declare-fun e!597992 () Bool)

(assert (=> b!1053185 (=> (not res!701516) (not e!597992))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053185 (= res!701516 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053186 () Bool)

(declare-fun e!597991 () Bool)

(assert (=> b!1053186 (= e!597992 e!597991)))

(declare-fun res!701514 () Bool)

(assert (=> b!1053186 (=> (not res!701514) (not e!597991))))

(declare-datatypes ((array!66346 0))(
  ( (array!66347 (arr!31906 (Array (_ BitVec 32) (_ BitVec 64))) (size!32443 (_ BitVec 32))) )
))
(declare-fun lt!464989 () array!66346)

(declare-fun arrayContainsKey!0 (array!66346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053186 (= res!701514 (arrayContainsKey!0 lt!464989 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66346)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053186 (= lt!464989 (array!66347 (store (arr!31906 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32443 a!3488)))))

(declare-fun b!1053187 () Bool)

(declare-fun e!597987 () Bool)

(declare-fun e!597993 () Bool)

(assert (=> b!1053187 (= e!597987 e!597993)))

(declare-fun res!701512 () Bool)

(assert (=> b!1053187 (=> res!701512 e!597993)))

(declare-fun lt!464993 () (_ BitVec 32))

(assert (=> b!1053187 (= res!701512 (or (bvsgt lt!464993 i!1381) (bvsle i!1381 lt!464993)))))

(declare-fun b!1053188 () Bool)

(declare-fun e!597988 () Bool)

(declare-fun e!597990 () Bool)

(assert (=> b!1053188 (= e!597988 e!597990)))

(declare-fun res!701508 () Bool)

(assert (=> b!1053188 (=> res!701508 e!597990)))

(declare-fun lt!464992 () (_ BitVec 32))

(assert (=> b!1053188 (= res!701508 (or (bvslt lt!464993 #b00000000000000000000000000000000) (bvsge lt!464992 (size!32443 a!3488)) (bvsge lt!464993 (size!32443 a!3488))))))

(assert (=> b!1053188 (arrayContainsKey!0 a!3488 k0!2747 lt!464992)))

(declare-datatypes ((Unit!34453 0))(
  ( (Unit!34454) )
))
(declare-fun lt!464991 () Unit!34453)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66346 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34453)

(assert (=> b!1053188 (= lt!464991 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464992))))

(assert (=> b!1053188 (= lt!464992 (bvadd #b00000000000000000000000000000001 lt!464993))))

(declare-datatypes ((List!22188 0))(
  ( (Nil!22185) (Cons!22184 (h!23402 (_ BitVec 64)) (t!31487 List!22188)) )
))
(declare-fun arrayNoDuplicates!0 (array!66346 (_ BitVec 32) List!22188) Bool)

(assert (=> b!1053188 (arrayNoDuplicates!0 a!3488 lt!464993 Nil!22185)))

(declare-fun lt!464988 () Unit!34453)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66346 (_ BitVec 32) (_ BitVec 32)) Unit!34453)

(assert (=> b!1053188 (= lt!464988 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464993))))

(declare-fun b!1053189 () Bool)

(declare-fun e!597989 () Bool)

(assert (=> b!1053189 (= e!597989 (not e!597988))))

(declare-fun res!701511 () Bool)

(assert (=> b!1053189 (=> res!701511 e!597988)))

(assert (=> b!1053189 (= res!701511 (or (bvsgt lt!464993 i!1381) (bvsle i!1381 lt!464993)))))

(assert (=> b!1053189 e!597987))

(declare-fun res!701509 () Bool)

(assert (=> b!1053189 (=> (not res!701509) (not e!597987))))

(assert (=> b!1053189 (= res!701509 (= (select (store (arr!31906 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464993) k0!2747))))

(declare-fun b!1053190 () Bool)

(assert (=> b!1053190 (= e!597993 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1053191 () Bool)

(declare-fun res!701515 () Bool)

(assert (=> b!1053191 (=> res!701515 e!597990)))

(declare-fun contains!6167 (List!22188 (_ BitVec 64)) Bool)

(assert (=> b!1053191 (= res!701515 (contains!6167 Nil!22185 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053192 () Bool)

(declare-fun res!701510 () Bool)

(assert (=> b!1053192 (=> res!701510 e!597990)))

(declare-fun noDuplicate!1543 (List!22188) Bool)

(assert (=> b!1053192 (= res!701510 (not (noDuplicate!1543 Nil!22185)))))

(declare-fun b!1053193 () Bool)

(declare-fun res!701507 () Bool)

(assert (=> b!1053193 (=> (not res!701507) (not e!597992))))

(assert (=> b!1053193 (= res!701507 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22185))))

(declare-fun res!701505 () Bool)

(assert (=> start!92730 (=> (not res!701505) (not e!597992))))

(assert (=> start!92730 (= res!701505 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32443 a!3488)) (bvslt (size!32443 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92730 e!597992))

(assert (=> start!92730 true))

(declare-fun array_inv!24688 (array!66346) Bool)

(assert (=> start!92730 (array_inv!24688 a!3488)))

(declare-fun b!1053184 () Bool)

(assert (=> b!1053184 (= e!597991 e!597989)))

(declare-fun res!701506 () Bool)

(assert (=> b!1053184 (=> (not res!701506) (not e!597989))))

(assert (=> b!1053184 (= res!701506 (not (= lt!464993 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66346 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053184 (= lt!464993 (arrayScanForKey!0 lt!464989 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053194 () Bool)

(assert (=> b!1053194 (= e!597990 true)))

(declare-fun lt!464990 () Bool)

(assert (=> b!1053194 (= lt!464990 (contains!6167 Nil!22185 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053195 () Bool)

(declare-fun res!701513 () Bool)

(assert (=> b!1053195 (=> (not res!701513) (not e!597992))))

(assert (=> b!1053195 (= res!701513 (= (select (arr!31906 a!3488) i!1381) k0!2747))))

(assert (= (and start!92730 res!701505) b!1053193))

(assert (= (and b!1053193 res!701507) b!1053185))

(assert (= (and b!1053185 res!701516) b!1053195))

(assert (= (and b!1053195 res!701513) b!1053186))

(assert (= (and b!1053186 res!701514) b!1053184))

(assert (= (and b!1053184 res!701506) b!1053189))

(assert (= (and b!1053189 res!701509) b!1053187))

(assert (= (and b!1053187 (not res!701512)) b!1053190))

(assert (= (and b!1053189 (not res!701511)) b!1053188))

(assert (= (and b!1053188 (not res!701508)) b!1053192))

(assert (= (and b!1053192 (not res!701510)) b!1053191))

(assert (= (and b!1053191 (not res!701515)) b!1053194))

(declare-fun m!973979 () Bool)

(assert (=> b!1053189 m!973979))

(declare-fun m!973981 () Bool)

(assert (=> b!1053189 m!973981))

(declare-fun m!973983 () Bool)

(assert (=> b!1053186 m!973983))

(assert (=> b!1053186 m!973979))

(declare-fun m!973985 () Bool)

(assert (=> b!1053185 m!973985))

(declare-fun m!973987 () Bool)

(assert (=> b!1053195 m!973987))

(declare-fun m!973989 () Bool)

(assert (=> b!1053193 m!973989))

(declare-fun m!973991 () Bool)

(assert (=> b!1053184 m!973991))

(declare-fun m!973993 () Bool)

(assert (=> start!92730 m!973993))

(declare-fun m!973995 () Bool)

(assert (=> b!1053190 m!973995))

(declare-fun m!973997 () Bool)

(assert (=> b!1053192 m!973997))

(declare-fun m!973999 () Bool)

(assert (=> b!1053188 m!973999))

(declare-fun m!974001 () Bool)

(assert (=> b!1053188 m!974001))

(declare-fun m!974003 () Bool)

(assert (=> b!1053188 m!974003))

(declare-fun m!974005 () Bool)

(assert (=> b!1053188 m!974005))

(declare-fun m!974007 () Bool)

(assert (=> b!1053191 m!974007))

(declare-fun m!974009 () Bool)

(assert (=> b!1053194 m!974009))

(check-sat (not b!1053194) (not b!1053185) (not b!1053184) (not b!1053186) (not b!1053192) (not b!1053190) (not b!1053191) (not start!92730) (not b!1053193) (not b!1053188))
(check-sat)
