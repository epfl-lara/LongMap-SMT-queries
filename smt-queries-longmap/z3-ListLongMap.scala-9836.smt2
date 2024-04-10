; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116704 () Bool)

(assert start!116704)

(declare-fun b!1375433 () Bool)

(declare-fun e!779171 () Bool)

(assert (=> b!1375433 (= e!779171 (not true))))

(declare-fun lt!604373 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93373 0))(
  ( (array!93374 (arr!45090 (Array (_ BitVec 32) (_ BitVec 64))) (size!45640 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93373)

(declare-fun arrayCountValidKeys!0 (array!93373 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375433 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!604373)))

(declare-datatypes ((Unit!45545 0))(
  ( (Unit!45546) )
))
(declare-fun lt!604375 () Unit!45545)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93373 (_ BitVec 32) (_ BitVec 32)) Unit!45545)

(assert (=> b!1375433 (= lt!604375 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!918501 () Bool)

(declare-fun e!779173 () Bool)

(assert (=> start!116704 (=> (not res!918501) (not e!779173))))

(assert (=> start!116704 (= res!918501 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45640 a!4032))))))

(assert (=> start!116704 e!779173))

(assert (=> start!116704 true))

(declare-fun array_inv!34118 (array!93373) Bool)

(assert (=> start!116704 (array_inv!34118 a!4032)))

(declare-fun b!1375434 () Bool)

(declare-fun res!918498 () Bool)

(assert (=> b!1375434 (=> (not res!918498) (not e!779173))))

(assert (=> b!1375434 (= res!918498 (and (bvslt (size!45640 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45640 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375435 () Bool)

(assert (=> b!1375435 (= e!779173 e!779171)))

(declare-fun res!918500 () Bool)

(assert (=> b!1375435 (=> (not res!918500) (not e!779171))))

(declare-fun lt!604374 () (_ BitVec 32))

(assert (=> b!1375435 (= res!918500 (and (= lt!604374 lt!604373) (not (= to!206 (size!45640 a!4032)))))))

(assert (=> b!1375435 (= lt!604373 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375435 (= lt!604374 (arrayCountValidKeys!0 (array!93374 (store (arr!45090 a!4032) i!1445 k0!2947) (size!45640 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375436 () Bool)

(declare-fun res!918497 () Bool)

(assert (=> b!1375436 (=> (not res!918497) (not e!779171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375436 (= res!918497 (not (validKeyInArray!0 (select (arr!45090 a!4032) to!206))))))

(declare-fun b!1375437 () Bool)

(declare-fun res!918499 () Bool)

(assert (=> b!1375437 (=> (not res!918499) (not e!779173))))

(assert (=> b!1375437 (= res!918499 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375438 () Bool)

(declare-fun res!918502 () Bool)

(assert (=> b!1375438 (=> (not res!918502) (not e!779173))))

(assert (=> b!1375438 (= res!918502 (validKeyInArray!0 (select (arr!45090 a!4032) i!1445)))))

(assert (= (and start!116704 res!918501) b!1375438))

(assert (= (and b!1375438 res!918502) b!1375437))

(assert (= (and b!1375437 res!918499) b!1375434))

(assert (= (and b!1375434 res!918498) b!1375435))

(assert (= (and b!1375435 res!918500) b!1375436))

(assert (= (and b!1375436 res!918497) b!1375433))

(declare-fun m!1259267 () Bool)

(assert (=> b!1375433 m!1259267))

(declare-fun m!1259269 () Bool)

(assert (=> b!1375433 m!1259269))

(declare-fun m!1259271 () Bool)

(assert (=> start!116704 m!1259271))

(declare-fun m!1259273 () Bool)

(assert (=> b!1375435 m!1259273))

(declare-fun m!1259275 () Bool)

(assert (=> b!1375435 m!1259275))

(declare-fun m!1259277 () Bool)

(assert (=> b!1375435 m!1259277))

(declare-fun m!1259279 () Bool)

(assert (=> b!1375438 m!1259279))

(assert (=> b!1375438 m!1259279))

(declare-fun m!1259281 () Bool)

(assert (=> b!1375438 m!1259281))

(declare-fun m!1259283 () Bool)

(assert (=> b!1375437 m!1259283))

(declare-fun m!1259285 () Bool)

(assert (=> b!1375436 m!1259285))

(assert (=> b!1375436 m!1259285))

(declare-fun m!1259287 () Bool)

(assert (=> b!1375436 m!1259287))

(check-sat (not b!1375437) (not b!1375435) (not b!1375433) (not b!1375438) (not b!1375436) (not start!116704))
(check-sat)
