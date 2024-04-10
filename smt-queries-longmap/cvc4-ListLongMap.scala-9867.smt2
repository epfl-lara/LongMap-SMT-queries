; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116892 () Bool)

(assert start!116892)

(declare-fun b!1377446 () Bool)

(declare-datatypes ((Unit!45685 0))(
  ( (Unit!45686) )
))
(declare-fun e!780258 () Unit!45685)

(declare-fun lt!606050 () Unit!45685)

(assert (=> b!1377446 (= e!780258 lt!606050)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93561 0))(
  ( (array!93562 (arr!45184 (Array (_ BitVec 32) (_ BitVec 64))) (size!45734 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93561)

(declare-fun lt!606051 () Unit!45685)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93561 (_ BitVec 32) (_ BitVec 32)) Unit!45685)

(assert (=> b!1377446 (= lt!606051 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66013 () (_ BitVec 32))

(declare-fun lt!606052 () (_ BitVec 32))

(assert (=> b!1377446 (= call!66013 (bvadd #b00000000000000000000000000000001 lt!606052))))

(declare-fun lt!606057 () array!93561)

(assert (=> b!1377446 (= lt!606050 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606057 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66014 () (_ BitVec 32))

(declare-fun lt!606054 () (_ BitVec 32))

(assert (=> b!1377446 (= call!66014 (bvadd #b00000000000000000000000000000001 lt!606054))))

(declare-fun b!1377447 () Bool)

(declare-fun e!780261 () Bool)

(assert (=> b!1377447 (= e!780261 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93561 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377447 (= (arrayCountValidKeys!0 lt!606057 (bvadd #b00000000000000000000000000000001 i!1445) (size!45734 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45734 a!4032)))))

(declare-fun lt!606055 () Unit!45685)

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45685)

(assert (=> b!1377447 (= lt!606055 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!66010 () Bool)

(assert (=> bm!66010 (= call!66013 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377449 () Bool)

(declare-fun res!920170 () Bool)

(declare-fun e!780262 () Bool)

(assert (=> b!1377449 (=> (not res!920170) (not e!780262))))

(assert (=> b!1377449 (= res!920170 (and (bvslt (size!45734 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45734 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377450 () Bool)

(declare-fun e!780259 () Bool)

(assert (=> b!1377450 (= e!780262 e!780259)))

(declare-fun res!920175 () Bool)

(assert (=> b!1377450 (=> (not res!920175) (not e!780259))))

(assert (=> b!1377450 (= res!920175 (and (= lt!606054 lt!606052) (not (= to!206 (size!45734 a!4032)))))))

(assert (=> b!1377450 (= lt!606052 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377450 (= lt!606054 (arrayCountValidKeys!0 lt!606057 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377450 (= lt!606057 (array!93562 (store (arr!45184 a!4032) i!1445 k!2947) (size!45734 a!4032)))))

(declare-fun b!1377451 () Bool)

(declare-fun lt!606058 () Unit!45685)

(assert (=> b!1377451 (= e!780258 lt!606058)))

(declare-fun lt!606053 () Unit!45685)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93561 (_ BitVec 32) (_ BitVec 32)) Unit!45685)

(assert (=> b!1377451 (= lt!606053 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377451 (= call!66013 lt!606052)))

(assert (=> b!1377451 (= lt!606058 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606057 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377451 (= call!66014 lt!606054)))

(declare-fun bm!66011 () Bool)

(assert (=> bm!66011 (= call!66014 (arrayCountValidKeys!0 lt!606057 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377452 () Bool)

(assert (=> b!1377452 (= e!780259 e!780261)))

(declare-fun res!920176 () Bool)

(assert (=> b!1377452 (=> (not res!920176) (not e!780261))))

(assert (=> b!1377452 (= res!920176 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45734 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!606056 () Unit!45685)

(assert (=> b!1377452 (= lt!606056 e!780258)))

(declare-fun c!128078 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377452 (= c!128078 (validKeyInArray!0 (select (arr!45184 a!4032) to!206)))))

(declare-fun res!920172 () Bool)

(assert (=> start!116892 (=> (not res!920172) (not e!780262))))

(assert (=> start!116892 (= res!920172 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45734 a!4032))))))

(assert (=> start!116892 e!780262))

(assert (=> start!116892 true))

(declare-fun array_inv!34212 (array!93561) Bool)

(assert (=> start!116892 (array_inv!34212 a!4032)))

(declare-fun b!1377448 () Bool)

(declare-fun res!920173 () Bool)

(assert (=> b!1377448 (=> (not res!920173) (not e!780262))))

(assert (=> b!1377448 (= res!920173 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377453 () Bool)

(declare-fun res!920171 () Bool)

(assert (=> b!1377453 (=> (not res!920171) (not e!780262))))

(assert (=> b!1377453 (= res!920171 (validKeyInArray!0 (select (arr!45184 a!4032) i!1445)))))

(declare-fun b!1377454 () Bool)

(declare-fun res!920174 () Bool)

(assert (=> b!1377454 (=> (not res!920174) (not e!780261))))

(assert (=> b!1377454 (= res!920174 (= (arrayCountValidKeys!0 lt!606057 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(assert (= (and start!116892 res!920172) b!1377453))

(assert (= (and b!1377453 res!920171) b!1377448))

(assert (= (and b!1377448 res!920173) b!1377449))

(assert (= (and b!1377449 res!920170) b!1377450))

(assert (= (and b!1377450 res!920175) b!1377452))

(assert (= (and b!1377452 c!128078) b!1377446))

(assert (= (and b!1377452 (not c!128078)) b!1377451))

(assert (= (or b!1377446 b!1377451) bm!66011))

(assert (= (or b!1377446 b!1377451) bm!66010))

(assert (= (and b!1377452 res!920176) b!1377454))

(assert (= (and b!1377454 res!920174) b!1377447))

(declare-fun m!1261745 () Bool)

(assert (=> bm!66010 m!1261745))

(declare-fun m!1261747 () Bool)

(assert (=> b!1377454 m!1261747))

(assert (=> b!1377454 m!1261745))

(declare-fun m!1261749 () Bool)

(assert (=> start!116892 m!1261749))

(assert (=> bm!66011 m!1261747))

(declare-fun m!1261751 () Bool)

(assert (=> b!1377452 m!1261751))

(assert (=> b!1377452 m!1261751))

(declare-fun m!1261753 () Bool)

(assert (=> b!1377452 m!1261753))

(declare-fun m!1261755 () Bool)

(assert (=> b!1377448 m!1261755))

(declare-fun m!1261757 () Bool)

(assert (=> b!1377451 m!1261757))

(declare-fun m!1261759 () Bool)

(assert (=> b!1377451 m!1261759))

(declare-fun m!1261761 () Bool)

(assert (=> b!1377453 m!1261761))

(assert (=> b!1377453 m!1261761))

(declare-fun m!1261763 () Bool)

(assert (=> b!1377453 m!1261763))

(declare-fun m!1261765 () Bool)

(assert (=> b!1377450 m!1261765))

(declare-fun m!1261767 () Bool)

(assert (=> b!1377450 m!1261767))

(declare-fun m!1261769 () Bool)

(assert (=> b!1377450 m!1261769))

(declare-fun m!1261771 () Bool)

(assert (=> b!1377447 m!1261771))

(declare-fun m!1261773 () Bool)

(assert (=> b!1377447 m!1261773))

(declare-fun m!1261775 () Bool)

(assert (=> b!1377447 m!1261775))

(declare-fun m!1261777 () Bool)

(assert (=> b!1377446 m!1261777))

(declare-fun m!1261779 () Bool)

(assert (=> b!1377446 m!1261779))

(push 1)

(assert (not b!1377451))

(assert (not b!1377454))

(assert (not bm!66011))

(assert (not bm!66010))

(assert (not b!1377452))

(assert (not start!116892))

(assert (not b!1377450))

(assert (not b!1377447))

(assert (not b!1377448))

(assert (not b!1377446))

(assert (not b!1377453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

