; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116686 () Bool)

(assert start!116686)

(declare-fun res!918364 () Bool)

(declare-fun e!779091 () Bool)

(assert (=> start!116686 (=> (not res!918364) (not e!779091))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93309 0))(
  ( (array!93310 (arr!45058 (Array (_ BitVec 32) (_ BitVec 64))) (size!45610 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93309)

(assert (=> start!116686 (= res!918364 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45610 a!4032))))))

(assert (=> start!116686 e!779091))

(assert (=> start!116686 true))

(declare-fun array_inv!34291 (array!93309) Bool)

(assert (=> start!116686 (array_inv!34291 a!4032)))

(declare-fun b!1375264 () Bool)

(declare-fun res!918365 () Bool)

(assert (=> b!1375264 (=> (not res!918365) (not e!779091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375264 (= res!918365 (validKeyInArray!0 (select (arr!45058 a!4032) i!1445)))))

(declare-fun b!1375265 () Bool)

(declare-fun res!918363 () Bool)

(declare-fun e!779092 () Bool)

(assert (=> b!1375265 (=> (not res!918363) (not e!779092))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375265 (= res!918363 (validKeyInArray!0 (select (arr!45058 a!4032) to!206)))))

(declare-fun b!1375266 () Bool)

(assert (=> b!1375266 (= e!779092 (not true))))

(declare-fun lt!604139 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93309 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375266 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!604139))))

(declare-datatypes ((Unit!45378 0))(
  ( (Unit!45379) )
))
(declare-fun lt!604138 () Unit!45378)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93309 (_ BitVec 32) (_ BitVec 32)) Unit!45378)

(assert (=> b!1375266 (= lt!604138 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375267 () Bool)

(assert (=> b!1375267 (= e!779091 e!779092)))

(declare-fun res!918367 () Bool)

(assert (=> b!1375267 (=> (not res!918367) (not e!779092))))

(declare-fun lt!604137 () (_ BitVec 32))

(assert (=> b!1375267 (= res!918367 (and (= lt!604137 lt!604139) (not (= to!206 (size!45610 a!4032)))))))

(assert (=> b!1375267 (= lt!604139 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375267 (= lt!604137 (arrayCountValidKeys!0 (array!93310 (store (arr!45058 a!4032) i!1445 k0!2947) (size!45610 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375268 () Bool)

(declare-fun res!918366 () Bool)

(assert (=> b!1375268 (=> (not res!918366) (not e!779091))))

(assert (=> b!1375268 (= res!918366 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375269 () Bool)

(declare-fun res!918368 () Bool)

(assert (=> b!1375269 (=> (not res!918368) (not e!779091))))

(assert (=> b!1375269 (= res!918368 (and (bvslt (size!45610 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45610 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116686 res!918364) b!1375264))

(assert (= (and b!1375264 res!918365) b!1375268))

(assert (= (and b!1375268 res!918366) b!1375269))

(assert (= (and b!1375269 res!918368) b!1375267))

(assert (= (and b!1375267 res!918367) b!1375265))

(assert (= (and b!1375265 res!918363) b!1375266))

(declare-fun m!1258635 () Bool)

(assert (=> b!1375265 m!1258635))

(assert (=> b!1375265 m!1258635))

(declare-fun m!1258637 () Bool)

(assert (=> b!1375265 m!1258637))

(declare-fun m!1258639 () Bool)

(assert (=> b!1375264 m!1258639))

(assert (=> b!1375264 m!1258639))

(declare-fun m!1258641 () Bool)

(assert (=> b!1375264 m!1258641))

(declare-fun m!1258643 () Bool)

(assert (=> b!1375267 m!1258643))

(declare-fun m!1258645 () Bool)

(assert (=> b!1375267 m!1258645))

(declare-fun m!1258647 () Bool)

(assert (=> b!1375267 m!1258647))

(declare-fun m!1258649 () Bool)

(assert (=> b!1375268 m!1258649))

(declare-fun m!1258651 () Bool)

(assert (=> start!116686 m!1258651))

(declare-fun m!1258653 () Bool)

(assert (=> b!1375266 m!1258653))

(declare-fun m!1258655 () Bool)

(assert (=> b!1375266 m!1258655))

(check-sat (not b!1375268) (not b!1375264) (not start!116686) (not b!1375266) (not b!1375265) (not b!1375267))
(check-sat)
