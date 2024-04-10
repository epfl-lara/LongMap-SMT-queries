; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116874 () Bool)

(assert start!116874)

(declare-fun b!1377204 () Bool)

(declare-fun res!919986 () Bool)

(declare-fun e!780126 () Bool)

(assert (=> b!1377204 (=> (not res!919986) (not e!780126))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93543 0))(
  ( (array!93544 (arr!45175 (Array (_ BitVec 32) (_ BitVec 64))) (size!45725 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93543)

(assert (=> b!1377204 (= res!919986 (and (bvslt (size!45725 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45725 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun call!65960 () (_ BitVec 32))

(declare-fun bm!65956 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93543 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65956 (= call!65960 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377205 () Bool)

(declare-fun res!919987 () Bool)

(assert (=> b!1377205 (=> (not res!919987) (not e!780126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377205 (= res!919987 (validKeyInArray!0 (select (arr!45175 a!4032) i!1445)))))

(declare-fun b!1377206 () Bool)

(declare-fun res!919985 () Bool)

(assert (=> b!1377206 (=> (not res!919985) (not e!780126))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377206 (= res!919985 (not (validKeyInArray!0 k!2947)))))

(declare-fun e!780125 () Bool)

(declare-fun lt!605819 () array!93543)

(declare-fun b!1377207 () Bool)

(assert (=> b!1377207 (= e!780125 (not (= (arrayCountValidKeys!0 lt!605819 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))))

(declare-fun b!1377209 () Bool)

(declare-fun e!780123 () Bool)

(assert (=> b!1377209 (= e!780123 e!780125)))

(declare-fun res!919984 () Bool)

(assert (=> b!1377209 (=> (not res!919984) (not e!780125))))

(assert (=> b!1377209 (= res!919984 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45725 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45667 0))(
  ( (Unit!45668) )
))
(declare-fun lt!605824 () Unit!45667)

(declare-fun e!780124 () Unit!45667)

(assert (=> b!1377209 (= lt!605824 e!780124)))

(declare-fun c!128051 () Bool)

(assert (=> b!1377209 (= c!128051 (validKeyInArray!0 (select (arr!45175 a!4032) to!206)))))

(declare-fun b!1377210 () Bool)

(declare-fun lt!605823 () Unit!45667)

(assert (=> b!1377210 (= e!780124 lt!605823)))

(declare-fun lt!605820 () Unit!45667)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93543 (_ BitVec 32) (_ BitVec 32)) Unit!45667)

(assert (=> b!1377210 (= lt!605820 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605822 () (_ BitVec 32))

(assert (=> b!1377210 (= call!65960 (bvadd #b00000000000000000000000000000001 lt!605822))))

(assert (=> b!1377210 (= lt!605823 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605819 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65959 () (_ BitVec 32))

(declare-fun lt!605821 () (_ BitVec 32))

(assert (=> b!1377210 (= call!65959 (bvadd #b00000000000000000000000000000001 lt!605821))))

(declare-fun bm!65957 () Bool)

(assert (=> bm!65957 (= call!65959 (arrayCountValidKeys!0 lt!605819 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377211 () Bool)

(declare-fun lt!605817 () Unit!45667)

(assert (=> b!1377211 (= e!780124 lt!605817)))

(declare-fun lt!605818 () Unit!45667)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93543 (_ BitVec 32) (_ BitVec 32)) Unit!45667)

(assert (=> b!1377211 (= lt!605818 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377211 (= call!65960 lt!605822)))

(assert (=> b!1377211 (= lt!605817 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605819 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377211 (= call!65959 lt!605821)))

(declare-fun res!919982 () Bool)

(assert (=> start!116874 (=> (not res!919982) (not e!780126))))

(assert (=> start!116874 (= res!919982 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45725 a!4032))))))

(assert (=> start!116874 e!780126))

(assert (=> start!116874 true))

(declare-fun array_inv!34203 (array!93543) Bool)

(assert (=> start!116874 (array_inv!34203 a!4032)))

(declare-fun b!1377208 () Bool)

(assert (=> b!1377208 (= e!780126 e!780123)))

(declare-fun res!919983 () Bool)

(assert (=> b!1377208 (=> (not res!919983) (not e!780123))))

(assert (=> b!1377208 (= res!919983 (and (= lt!605821 lt!605822) (not (= to!206 (size!45725 a!4032)))))))

(assert (=> b!1377208 (= lt!605822 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377208 (= lt!605821 (arrayCountValidKeys!0 lt!605819 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377208 (= lt!605819 (array!93544 (store (arr!45175 a!4032) i!1445 k!2947) (size!45725 a!4032)))))

(assert (= (and start!116874 res!919982) b!1377205))

(assert (= (and b!1377205 res!919987) b!1377206))

(assert (= (and b!1377206 res!919985) b!1377204))

(assert (= (and b!1377204 res!919986) b!1377208))

(assert (= (and b!1377208 res!919983) b!1377209))

(assert (= (and b!1377209 c!128051) b!1377210))

(assert (= (and b!1377209 (not c!128051)) b!1377211))

(assert (= (or b!1377210 b!1377211) bm!65956))

(assert (= (or b!1377210 b!1377211) bm!65957))

(assert (= (and b!1377209 res!919984) b!1377207))

(declare-fun m!1261441 () Bool)

(assert (=> bm!65956 m!1261441))

(declare-fun m!1261443 () Bool)

(assert (=> b!1377211 m!1261443))

(declare-fun m!1261445 () Bool)

(assert (=> b!1377211 m!1261445))

(declare-fun m!1261447 () Bool)

(assert (=> b!1377209 m!1261447))

(assert (=> b!1377209 m!1261447))

(declare-fun m!1261449 () Bool)

(assert (=> b!1377209 m!1261449))

(declare-fun m!1261451 () Bool)

(assert (=> start!116874 m!1261451))

(declare-fun m!1261453 () Bool)

(assert (=> bm!65957 m!1261453))

(declare-fun m!1261455 () Bool)

(assert (=> b!1377206 m!1261455))

(declare-fun m!1261457 () Bool)

(assert (=> b!1377205 m!1261457))

(assert (=> b!1377205 m!1261457))

(declare-fun m!1261459 () Bool)

(assert (=> b!1377205 m!1261459))

(declare-fun m!1261461 () Bool)

(assert (=> b!1377210 m!1261461))

(declare-fun m!1261463 () Bool)

(assert (=> b!1377210 m!1261463))

(declare-fun m!1261465 () Bool)

(assert (=> b!1377208 m!1261465))

(declare-fun m!1261467 () Bool)

(assert (=> b!1377208 m!1261467))

(declare-fun m!1261469 () Bool)

(assert (=> b!1377208 m!1261469))

(assert (=> b!1377207 m!1261453))

(assert (=> b!1377207 m!1261441))

(push 1)

(assert (not b!1377207))

(assert (not b!1377209))

(assert (not bm!65957))

(assert (not b!1377211))

(assert (not start!116874))

(assert (not b!1377205))

(assert (not b!1377208))

(assert (not bm!65956))

(assert (not b!1377206))

(assert (not b!1377210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

