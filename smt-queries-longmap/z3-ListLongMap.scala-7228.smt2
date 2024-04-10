; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92432 () Bool)

(assert start!92432)

(declare-fun b!1050931 () Bool)

(declare-fun e!596456 () Bool)

(declare-fun e!596458 () Bool)

(assert (=> b!1050931 (= e!596456 e!596458)))

(declare-fun res!700060 () Bool)

(assert (=> b!1050931 (=> (not res!700060) (not e!596458))))

(declare-fun lt!464112 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050931 (= res!700060 (not (= lt!464112 i!1381)))))

(declare-datatypes ((array!66233 0))(
  ( (array!66234 (arr!31856 (Array (_ BitVec 32) (_ BitVec 64))) (size!32392 (_ BitVec 32))) )
))
(declare-fun lt!464111 () array!66233)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66233 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050931 (= lt!464112 (arrayScanForKey!0 lt!464111 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700058 () Bool)

(declare-fun e!596457 () Bool)

(assert (=> start!92432 (=> (not res!700058) (not e!596457))))

(declare-fun a!3488 () array!66233)

(assert (=> start!92432 (= res!700058 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32392 a!3488)) (bvslt (size!32392 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92432 e!596457))

(assert (=> start!92432 true))

(declare-fun array_inv!24636 (array!66233) Bool)

(assert (=> start!92432 (array_inv!24636 a!3488)))

(declare-fun b!1050932 () Bool)

(assert (=> b!1050932 (= e!596457 e!596456)))

(declare-fun res!700063 () Bool)

(assert (=> b!1050932 (=> (not res!700063) (not e!596456))))

(declare-fun arrayContainsKey!0 (array!66233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050932 (= res!700063 (arrayContainsKey!0 lt!464111 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050932 (= lt!464111 (array!66234 (store (arr!31856 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32392 a!3488)))))

(declare-fun b!1050933 () Bool)

(declare-fun res!700059 () Bool)

(assert (=> b!1050933 (=> (not res!700059) (not e!596457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050933 (= res!700059 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050934 () Bool)

(declare-fun res!700064 () Bool)

(assert (=> b!1050934 (=> (not res!700064) (not e!596457))))

(declare-datatypes ((List!22168 0))(
  ( (Nil!22165) (Cons!22164 (h!23373 (_ BitVec 64)) (t!31475 List!22168)) )
))
(declare-fun arrayNoDuplicates!0 (array!66233 (_ BitVec 32) List!22168) Bool)

(assert (=> b!1050934 (= res!700064 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22165))))

(declare-fun b!1050935 () Bool)

(assert (=> b!1050935 (= e!596458 (not true))))

(declare-fun e!596460 () Bool)

(assert (=> b!1050935 e!596460))

(declare-fun res!700057 () Bool)

(assert (=> b!1050935 (=> (not res!700057) (not e!596460))))

(assert (=> b!1050935 (= res!700057 (= (select (store (arr!31856 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464112) k0!2747))))

(declare-fun b!1050936 () Bool)

(declare-fun e!596461 () Bool)

(assert (=> b!1050936 (= e!596461 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050937 () Bool)

(declare-fun res!700061 () Bool)

(assert (=> b!1050937 (=> (not res!700061) (not e!596457))))

(assert (=> b!1050937 (= res!700061 (= (select (arr!31856 a!3488) i!1381) k0!2747))))

(declare-fun b!1050938 () Bool)

(assert (=> b!1050938 (= e!596460 e!596461)))

(declare-fun res!700062 () Bool)

(assert (=> b!1050938 (=> res!700062 e!596461)))

(assert (=> b!1050938 (= res!700062 (or (bvsgt lt!464112 i!1381) (bvsle i!1381 lt!464112)))))

(assert (= (and start!92432 res!700058) b!1050934))

(assert (= (and b!1050934 res!700064) b!1050933))

(assert (= (and b!1050933 res!700059) b!1050937))

(assert (= (and b!1050937 res!700061) b!1050932))

(assert (= (and b!1050932 res!700063) b!1050931))

(assert (= (and b!1050931 res!700060) b!1050935))

(assert (= (and b!1050935 res!700057) b!1050938))

(assert (= (and b!1050938 (not res!700062)) b!1050936))

(declare-fun m!971537 () Bool)

(assert (=> b!1050935 m!971537))

(declare-fun m!971539 () Bool)

(assert (=> b!1050935 m!971539))

(declare-fun m!971541 () Bool)

(assert (=> b!1050933 m!971541))

(declare-fun m!971543 () Bool)

(assert (=> b!1050937 m!971543))

(declare-fun m!971545 () Bool)

(assert (=> b!1050931 m!971545))

(declare-fun m!971547 () Bool)

(assert (=> b!1050934 m!971547))

(declare-fun m!971549 () Bool)

(assert (=> b!1050936 m!971549))

(declare-fun m!971551 () Bool)

(assert (=> b!1050932 m!971551))

(assert (=> b!1050932 m!971537))

(declare-fun m!971553 () Bool)

(assert (=> start!92432 m!971553))

(check-sat (not b!1050931) (not b!1050933) (not start!92432) (not b!1050934) (not b!1050932) (not b!1050936))
