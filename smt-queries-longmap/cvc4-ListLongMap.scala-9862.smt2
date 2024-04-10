; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116862 () Bool)

(assert start!116862)

(declare-fun b!1377070 () Bool)

(declare-fun res!919884 () Bool)

(declare-fun e!780043 () Bool)

(assert (=> b!1377070 (=> (not res!919884) (not e!780043))))

(declare-datatypes ((array!93531 0))(
  ( (array!93532 (arr!45169 (Array (_ BitVec 32) (_ BitVec 64))) (size!45719 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93531)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377070 (= res!919884 (validKeyInArray!0 (select (arr!45169 a!4032) i!1445)))))

(declare-fun b!1377071 () Bool)

(declare-datatypes ((Unit!45655 0))(
  ( (Unit!45656) )
))
(declare-fun e!780044 () Unit!45655)

(declare-fun lt!605677 () Unit!45655)

(assert (=> b!1377071 (= e!780044 lt!605677)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605679 () Unit!45655)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93531 (_ BitVec 32) (_ BitVec 32)) Unit!45655)

(assert (=> b!1377071 (= lt!605679 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65923 () (_ BitVec 32))

(declare-fun lt!605676 () (_ BitVec 32))

(assert (=> b!1377071 (= call!65923 lt!605676)))

(declare-fun lt!605680 () array!93531)

(assert (=> b!1377071 (= lt!605677 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605680 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65924 () (_ BitVec 32))

(declare-fun lt!605678 () (_ BitVec 32))

(assert (=> b!1377071 (= call!65924 lt!605678)))

(declare-fun bm!65920 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93531 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65920 (= call!65923 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377072 () Bool)

(declare-fun res!919886 () Bool)

(assert (=> b!1377072 (=> (not res!919886) (not e!780043))))

(assert (=> b!1377072 (= res!919886 (and (bvslt (size!45719 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45719 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919887 () Bool)

(assert (=> start!116862 (=> (not res!919887) (not e!780043))))

(assert (=> start!116862 (= res!919887 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45719 a!4032))))))

(assert (=> start!116862 e!780043))

(assert (=> start!116862 true))

(declare-fun array_inv!34197 (array!93531) Bool)

(assert (=> start!116862 (array_inv!34197 a!4032)))

(declare-fun b!1377073 () Bool)

(declare-fun e!780045 () Bool)

(assert (=> b!1377073 (= e!780043 e!780045)))

(declare-fun res!919885 () Bool)

(assert (=> b!1377073 (=> (not res!919885) (not e!780045))))

(assert (=> b!1377073 (= res!919885 (and (= lt!605678 lt!605676) (not (= to!206 (size!45719 a!4032)))))))

(assert (=> b!1377073 (= lt!605676 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377073 (= lt!605678 (arrayCountValidKeys!0 lt!605680 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377073 (= lt!605680 (array!93532 (store (arr!45169 a!4032) i!1445 k!2947) (size!45719 a!4032)))))

(declare-fun b!1377074 () Bool)

(declare-fun res!919888 () Bool)

(assert (=> b!1377074 (=> (not res!919888) (not e!780043))))

(assert (=> b!1377074 (= res!919888 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377075 () Bool)

(declare-fun lt!605673 () Unit!45655)

(assert (=> b!1377075 (= e!780044 lt!605673)))

(declare-fun lt!605675 () Unit!45655)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93531 (_ BitVec 32) (_ BitVec 32)) Unit!45655)

(assert (=> b!1377075 (= lt!605675 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377075 (= call!65923 (bvadd #b00000000000000000000000000000001 lt!605676))))

(assert (=> b!1377075 (= lt!605673 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605680 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377075 (= call!65924 (bvadd #b00000000000000000000000000000001 lt!605678))))

(declare-fun b!1377076 () Bool)

(assert (=> b!1377076 (= e!780045 false)))

(declare-fun lt!605674 () Unit!45655)

(assert (=> b!1377076 (= lt!605674 e!780044)))

(declare-fun c!128033 () Bool)

(assert (=> b!1377076 (= c!128033 (validKeyInArray!0 (select (arr!45169 a!4032) to!206)))))

(declare-fun bm!65921 () Bool)

(assert (=> bm!65921 (= call!65924 (arrayCountValidKeys!0 lt!605680 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116862 res!919887) b!1377070))

(assert (= (and b!1377070 res!919884) b!1377074))

(assert (= (and b!1377074 res!919888) b!1377072))

(assert (= (and b!1377072 res!919886) b!1377073))

(assert (= (and b!1377073 res!919885) b!1377076))

(assert (= (and b!1377076 c!128033) b!1377075))

(assert (= (and b!1377076 (not c!128033)) b!1377071))

(assert (= (or b!1377075 b!1377071) bm!65920))

(assert (= (or b!1377075 b!1377071) bm!65921))

(declare-fun m!1261261 () Bool)

(assert (=> b!1377075 m!1261261))

(declare-fun m!1261263 () Bool)

(assert (=> b!1377075 m!1261263))

(declare-fun m!1261265 () Bool)

(assert (=> b!1377074 m!1261265))

(declare-fun m!1261267 () Bool)

(assert (=> start!116862 m!1261267))

(declare-fun m!1261269 () Bool)

(assert (=> b!1377070 m!1261269))

(assert (=> b!1377070 m!1261269))

(declare-fun m!1261271 () Bool)

(assert (=> b!1377070 m!1261271))

(declare-fun m!1261273 () Bool)

(assert (=> b!1377071 m!1261273))

(declare-fun m!1261275 () Bool)

(assert (=> b!1377071 m!1261275))

(declare-fun m!1261277 () Bool)

(assert (=> b!1377073 m!1261277))

(declare-fun m!1261279 () Bool)

(assert (=> b!1377073 m!1261279))

(declare-fun m!1261281 () Bool)

(assert (=> b!1377073 m!1261281))

(declare-fun m!1261283 () Bool)

(assert (=> b!1377076 m!1261283))

(assert (=> b!1377076 m!1261283))

(declare-fun m!1261285 () Bool)

(assert (=> b!1377076 m!1261285))

(declare-fun m!1261287 () Bool)

(assert (=> bm!65921 m!1261287))

(declare-fun m!1261289 () Bool)

(assert (=> bm!65920 m!1261289))

(push 1)

(assert (not bm!65920))

(assert (not b!1377075))

(assert (not bm!65921))

(assert (not b!1377076))

(assert (not start!116862))

(assert (not b!1377073))

(assert (not b!1377074))

(assert (not b!1377070))

(assert (not b!1377071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

