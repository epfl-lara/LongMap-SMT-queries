; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117096 () Bool)

(assert start!117096)

(declare-fun b!1378426 () Bool)

(declare-fun e!780922 () Bool)

(declare-fun e!780920 () Bool)

(assert (=> b!1378426 (= e!780922 e!780920)))

(declare-fun res!920438 () Bool)

(assert (=> b!1378426 (=> (not res!920438) (not e!780920))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!606210 () (_ BitVec 32))

(declare-fun lt!606205 () (_ BitVec 32))

(declare-datatypes ((array!93651 0))(
  ( (array!93652 (arr!45224 (Array (_ BitVec 32) (_ BitVec 64))) (size!45775 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93651)

(assert (=> b!1378426 (= res!920438 (and (= lt!606210 lt!606205) (not (= to!206 (size!45775 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93651 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378426 (= lt!606205 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606209 () array!93651)

(assert (=> b!1378426 (= lt!606210 (arrayCountValidKeys!0 lt!606209 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1378426 (= lt!606209 (array!93652 (store (arr!45224 a!4032) i!1445 k!2947) (size!45775 a!4032)))))

(declare-fun b!1378427 () Bool)

(declare-fun res!920436 () Bool)

(assert (=> b!1378427 (=> (not res!920436) (not e!780922))))

(assert (=> b!1378427 (= res!920436 (and (bvslt (size!45775 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45775 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!66000 () Bool)

(declare-fun call!66004 () (_ BitVec 32))

(assert (=> bm!66000 (= call!66004 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378428 () Bool)

(declare-fun res!920437 () Bool)

(assert (=> b!1378428 (=> (not res!920437) (not e!780922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378428 (= res!920437 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1378429 () Bool)

(declare-datatypes ((Unit!45598 0))(
  ( (Unit!45599) )
))
(declare-fun e!780921 () Unit!45598)

(declare-fun lt!606208 () Unit!45598)

(assert (=> b!1378429 (= e!780921 lt!606208)))

(declare-fun lt!606206 () Unit!45598)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93651 (_ BitVec 32) (_ BitVec 32)) Unit!45598)

(assert (=> b!1378429 (= lt!606206 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378429 (= call!66004 (bvadd #b00000000000000000000000000000001 lt!606205))))

(assert (=> b!1378429 (= lt!606208 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606209 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66003 () (_ BitVec 32))

(assert (=> b!1378429 (= call!66003 (bvadd #b00000000000000000000000000000001 lt!606210))))

(declare-fun b!1378430 () Bool)

(assert (=> b!1378430 (= e!780920 (or (bvslt (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) (size!45775 a!4032)) (bvsle (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!606207 () Unit!45598)

(assert (=> b!1378430 (= lt!606207 e!780921)))

(declare-fun c!128443 () Bool)

(assert (=> b!1378430 (= c!128443 (validKeyInArray!0 (select (arr!45224 a!4032) to!206)))))

(declare-fun b!1378431 () Bool)

(declare-fun lt!606203 () Unit!45598)

(assert (=> b!1378431 (= e!780921 lt!606203)))

(declare-fun lt!606204 () Unit!45598)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93651 (_ BitVec 32) (_ BitVec 32)) Unit!45598)

(assert (=> b!1378431 (= lt!606204 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378431 (= call!66004 lt!606205)))

(assert (=> b!1378431 (= lt!606203 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606209 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378431 (= call!66003 lt!606210)))

(declare-fun res!920435 () Bool)

(assert (=> start!117096 (=> (not res!920435) (not e!780922))))

(assert (=> start!117096 (= res!920435 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45775 a!4032))))))

(assert (=> start!117096 e!780922))

(assert (=> start!117096 true))

(declare-fun array_inv!34505 (array!93651) Bool)

(assert (=> start!117096 (array_inv!34505 a!4032)))

(declare-fun b!1378432 () Bool)

(declare-fun res!920439 () Bool)

(assert (=> b!1378432 (=> (not res!920439) (not e!780922))))

(assert (=> b!1378432 (= res!920439 (validKeyInArray!0 (select (arr!45224 a!4032) i!1445)))))

(declare-fun bm!66001 () Bool)

(assert (=> bm!66001 (= call!66003 (arrayCountValidKeys!0 lt!606209 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!117096 res!920435) b!1378432))

(assert (= (and b!1378432 res!920439) b!1378428))

(assert (= (and b!1378428 res!920437) b!1378427))

(assert (= (and b!1378427 res!920436) b!1378426))

(assert (= (and b!1378426 res!920438) b!1378430))

(assert (= (and b!1378430 c!128443) b!1378429))

(assert (= (and b!1378430 (not c!128443)) b!1378431))

(assert (= (or b!1378429 b!1378431) bm!66001))

(assert (= (or b!1378429 b!1378431) bm!66000))

(declare-fun m!1262961 () Bool)

(assert (=> b!1378431 m!1262961))

(declare-fun m!1262963 () Bool)

(assert (=> b!1378431 m!1262963))

(declare-fun m!1262965 () Bool)

(assert (=> b!1378430 m!1262965))

(assert (=> b!1378430 m!1262965))

(declare-fun m!1262967 () Bool)

(assert (=> b!1378430 m!1262967))

(declare-fun m!1262969 () Bool)

(assert (=> bm!66000 m!1262969))

(declare-fun m!1262971 () Bool)

(assert (=> b!1378429 m!1262971))

(declare-fun m!1262973 () Bool)

(assert (=> b!1378429 m!1262973))

(declare-fun m!1262975 () Bool)

(assert (=> b!1378432 m!1262975))

(assert (=> b!1378432 m!1262975))

(declare-fun m!1262977 () Bool)

(assert (=> b!1378432 m!1262977))

(declare-fun m!1262979 () Bool)

(assert (=> b!1378426 m!1262979))

(declare-fun m!1262981 () Bool)

(assert (=> b!1378426 m!1262981))

(declare-fun m!1262983 () Bool)

(assert (=> b!1378426 m!1262983))

(declare-fun m!1262985 () Bool)

(assert (=> bm!66001 m!1262985))

(declare-fun m!1262987 () Bool)

(assert (=> start!117096 m!1262987))

(declare-fun m!1262989 () Bool)

(assert (=> b!1378428 m!1262989))

(push 1)

(assert (not b!1378431))

(assert (not b!1378429))

(assert (not b!1378432))

(assert (not bm!66000))

(assert (not b!1378428))

(assert (not b!1378430))

(assert (not bm!66001))

(assert (not start!117096))

(assert (not b!1378426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

