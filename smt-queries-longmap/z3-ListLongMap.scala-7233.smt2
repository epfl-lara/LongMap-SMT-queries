; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92462 () Bool)

(assert start!92462)

(declare-fun b!1051323 () Bool)

(declare-fun e!596760 () Bool)

(declare-fun e!596764 () Bool)

(assert (=> b!1051323 (= e!596760 e!596764)))

(declare-fun res!700456 () Bool)

(assert (=> b!1051323 (=> res!700456 e!596764)))

(declare-fun lt!464234 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051323 (= res!700456 (or (bvsgt lt!464234 i!1381) (bvsle i!1381 lt!464234)))))

(declare-fun b!1051324 () Bool)

(declare-fun e!596761 () Bool)

(declare-fun e!596759 () Bool)

(assert (=> b!1051324 (= e!596761 (not e!596759))))

(declare-fun res!700454 () Bool)

(assert (=> b!1051324 (=> res!700454 e!596759)))

(assert (=> b!1051324 (= res!700454 (or (bvsgt lt!464234 i!1381) (bvsle i!1381 lt!464234)))))

(assert (=> b!1051324 e!596760))

(declare-fun res!700457 () Bool)

(assert (=> b!1051324 (=> (not res!700457) (not e!596760))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-datatypes ((array!66263 0))(
  ( (array!66264 (arr!31871 (Array (_ BitVec 32) (_ BitVec 64))) (size!32407 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66263)

(assert (=> b!1051324 (= res!700457 (= (select (store (arr!31871 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464234) k0!2747))))

(declare-fun b!1051325 () Bool)

(declare-fun res!700449 () Bool)

(declare-fun e!596758 () Bool)

(assert (=> b!1051325 (=> (not res!700449) (not e!596758))))

(declare-datatypes ((List!22183 0))(
  ( (Nil!22180) (Cons!22179 (h!23388 (_ BitVec 64)) (t!31490 List!22183)) )
))
(declare-fun arrayNoDuplicates!0 (array!66263 (_ BitVec 32) List!22183) Bool)

(assert (=> b!1051325 (= res!700449 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22180))))

(declare-fun b!1051326 () Bool)

(declare-fun res!700450 () Bool)

(assert (=> b!1051326 (=> (not res!700450) (not e!596758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051326 (= res!700450 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051327 () Bool)

(declare-fun res!700451 () Bool)

(assert (=> b!1051327 (=> (not res!700451) (not e!596758))))

(assert (=> b!1051327 (= res!700451 (= (select (arr!31871 a!3488) i!1381) k0!2747))))

(declare-fun b!1051328 () Bool)

(declare-fun e!596762 () Bool)

(assert (=> b!1051328 (= e!596762 e!596761)))

(declare-fun res!700452 () Bool)

(assert (=> b!1051328 (=> (not res!700452) (not e!596761))))

(assert (=> b!1051328 (= res!700452 (not (= lt!464234 i!1381)))))

(declare-fun lt!464235 () array!66263)

(declare-fun arrayScanForKey!0 (array!66263 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051328 (= lt!464234 (arrayScanForKey!0 lt!464235 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700453 () Bool)

(assert (=> start!92462 (=> (not res!700453) (not e!596758))))

(assert (=> start!92462 (= res!700453 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32407 a!3488)) (bvslt (size!32407 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92462 e!596758))

(assert (=> start!92462 true))

(declare-fun array_inv!24651 (array!66263) Bool)

(assert (=> start!92462 (array_inv!24651 a!3488)))

(declare-fun b!1051329 () Bool)

(declare-fun arrayContainsKey!0 (array!66263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051329 (= e!596764 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051330 () Bool)

(assert (=> b!1051330 (= e!596759 true)))

(assert (=> b!1051330 (arrayNoDuplicates!0 a!3488 lt!464234 Nil!22180)))

(declare-datatypes ((Unit!34414 0))(
  ( (Unit!34415) )
))
(declare-fun lt!464233 () Unit!34414)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66263 (_ BitVec 32) (_ BitVec 32)) Unit!34414)

(assert (=> b!1051330 (= lt!464233 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464234))))

(declare-fun b!1051331 () Bool)

(assert (=> b!1051331 (= e!596758 e!596762)))

(declare-fun res!700455 () Bool)

(assert (=> b!1051331 (=> (not res!700455) (not e!596762))))

(assert (=> b!1051331 (= res!700455 (arrayContainsKey!0 lt!464235 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051331 (= lt!464235 (array!66264 (store (arr!31871 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32407 a!3488)))))

(assert (= (and start!92462 res!700453) b!1051325))

(assert (= (and b!1051325 res!700449) b!1051326))

(assert (= (and b!1051326 res!700450) b!1051327))

(assert (= (and b!1051327 res!700451) b!1051331))

(assert (= (and b!1051331 res!700455) b!1051328))

(assert (= (and b!1051328 res!700452) b!1051324))

(assert (= (and b!1051324 res!700457) b!1051323))

(assert (= (and b!1051323 (not res!700456)) b!1051329))

(assert (= (and b!1051324 (not res!700454)) b!1051330))

(declare-fun m!971847 () Bool)

(assert (=> start!92462 m!971847))

(declare-fun m!971849 () Bool)

(assert (=> b!1051328 m!971849))

(declare-fun m!971851 () Bool)

(assert (=> b!1051327 m!971851))

(declare-fun m!971853 () Bool)

(assert (=> b!1051330 m!971853))

(declare-fun m!971855 () Bool)

(assert (=> b!1051330 m!971855))

(declare-fun m!971857 () Bool)

(assert (=> b!1051331 m!971857))

(declare-fun m!971859 () Bool)

(assert (=> b!1051331 m!971859))

(declare-fun m!971861 () Bool)

(assert (=> b!1051329 m!971861))

(declare-fun m!971863 () Bool)

(assert (=> b!1051325 m!971863))

(assert (=> b!1051324 m!971859))

(declare-fun m!971865 () Bool)

(assert (=> b!1051324 m!971865))

(declare-fun m!971867 () Bool)

(assert (=> b!1051326 m!971867))

(check-sat (not b!1051331) (not b!1051328) (not b!1051325) (not b!1051330) (not b!1051326) (not start!92462) (not b!1051329))
(check-sat)
