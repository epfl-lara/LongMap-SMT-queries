; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92426 () Bool)

(assert start!92426)

(declare-fun b!1050859 () Bool)

(declare-fun res!699987 () Bool)

(declare-fun e!596403 () Bool)

(assert (=> b!1050859 (=> (not res!699987) (not e!596403))))

(declare-datatypes ((array!66227 0))(
  ( (array!66228 (arr!31853 (Array (_ BitVec 32) (_ BitVec 64))) (size!32389 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66227)

(declare-datatypes ((List!22165 0))(
  ( (Nil!22162) (Cons!22161 (h!23370 (_ BitVec 64)) (t!31472 List!22165)) )
))
(declare-fun arrayNoDuplicates!0 (array!66227 (_ BitVec 32) List!22165) Bool)

(assert (=> b!1050859 (= res!699987 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22162))))

(declare-fun b!1050860 () Bool)

(declare-fun res!699991 () Bool)

(assert (=> b!1050860 (=> (not res!699991) (not e!596403))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050860 (= res!699991 (= (select (arr!31853 a!3488) i!1381) k0!2747))))

(declare-fun res!699990 () Bool)

(assert (=> start!92426 (=> (not res!699990) (not e!596403))))

(assert (=> start!92426 (= res!699990 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32389 a!3488)) (bvslt (size!32389 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92426 e!596403))

(assert (=> start!92426 true))

(declare-fun array_inv!24633 (array!66227) Bool)

(assert (=> start!92426 (array_inv!24633 a!3488)))

(declare-fun b!1050861 () Bool)

(declare-fun e!596407 () Bool)

(declare-fun arrayContainsKey!0 (array!66227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050861 (= e!596407 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050862 () Bool)

(declare-fun res!699988 () Bool)

(assert (=> b!1050862 (=> (not res!699988) (not e!596403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050862 (= res!699988 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050863 () Bool)

(declare-fun e!596404 () Bool)

(assert (=> b!1050863 (= e!596404 e!596407)))

(declare-fun res!699992 () Bool)

(assert (=> b!1050863 (=> res!699992 e!596407)))

(declare-fun lt!464093 () (_ BitVec 32))

(assert (=> b!1050863 (= res!699992 (or (bvsgt lt!464093 i!1381) (bvsle i!1381 lt!464093)))))

(declare-fun b!1050864 () Bool)

(declare-fun e!596402 () Bool)

(assert (=> b!1050864 (= e!596402 (not true))))

(assert (=> b!1050864 e!596404))

(declare-fun res!699986 () Bool)

(assert (=> b!1050864 (=> (not res!699986) (not e!596404))))

(assert (=> b!1050864 (= res!699986 (= (select (store (arr!31853 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464093) k0!2747))))

(declare-fun b!1050865 () Bool)

(declare-fun e!596405 () Bool)

(assert (=> b!1050865 (= e!596405 e!596402)))

(declare-fun res!699985 () Bool)

(assert (=> b!1050865 (=> (not res!699985) (not e!596402))))

(assert (=> b!1050865 (= res!699985 (not (= lt!464093 i!1381)))))

(declare-fun lt!464094 () array!66227)

(declare-fun arrayScanForKey!0 (array!66227 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050865 (= lt!464093 (arrayScanForKey!0 lt!464094 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050866 () Bool)

(assert (=> b!1050866 (= e!596403 e!596405)))

(declare-fun res!699989 () Bool)

(assert (=> b!1050866 (=> (not res!699989) (not e!596405))))

(assert (=> b!1050866 (= res!699989 (arrayContainsKey!0 lt!464094 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050866 (= lt!464094 (array!66228 (store (arr!31853 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32389 a!3488)))))

(assert (= (and start!92426 res!699990) b!1050859))

(assert (= (and b!1050859 res!699987) b!1050862))

(assert (= (and b!1050862 res!699988) b!1050860))

(assert (= (and b!1050860 res!699991) b!1050866))

(assert (= (and b!1050866 res!699989) b!1050865))

(assert (= (and b!1050865 res!699985) b!1050864))

(assert (= (and b!1050864 res!699986) b!1050863))

(assert (= (and b!1050863 (not res!699992)) b!1050861))

(declare-fun m!971483 () Bool)

(assert (=> b!1050866 m!971483))

(declare-fun m!971485 () Bool)

(assert (=> b!1050866 m!971485))

(declare-fun m!971487 () Bool)

(assert (=> b!1050860 m!971487))

(assert (=> b!1050864 m!971485))

(declare-fun m!971489 () Bool)

(assert (=> b!1050864 m!971489))

(declare-fun m!971491 () Bool)

(assert (=> b!1050859 m!971491))

(declare-fun m!971493 () Bool)

(assert (=> start!92426 m!971493))

(declare-fun m!971495 () Bool)

(assert (=> b!1050861 m!971495))

(declare-fun m!971497 () Bool)

(assert (=> b!1050865 m!971497))

(declare-fun m!971499 () Bool)

(assert (=> b!1050862 m!971499))

(check-sat (not b!1050859) (not b!1050862) (not b!1050866) (not start!92426) (not b!1050861) (not b!1050865))
(check-sat)
