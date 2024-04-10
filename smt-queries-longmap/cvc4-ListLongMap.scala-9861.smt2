; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116856 () Bool)

(assert start!116856)

(declare-fun b!1377008 () Bool)

(declare-datatypes ((Unit!45649 0))(
  ( (Unit!45650) )
))
(declare-fun e!780010 () Unit!45649)

(declare-fun lt!605602 () Unit!45649)

(assert (=> b!1377008 (= e!780010 lt!605602)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93525 0))(
  ( (array!93526 (arr!45166 (Array (_ BitVec 32) (_ BitVec 64))) (size!45716 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93525)

(declare-fun lt!605604 () Unit!45649)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93525 (_ BitVec 32) (_ BitVec 32)) Unit!45649)

(assert (=> b!1377008 (= lt!605604 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65906 () (_ BitVec 32))

(declare-fun lt!605605 () (_ BitVec 32))

(assert (=> b!1377008 (= call!65906 lt!605605)))

(declare-fun lt!605608 () array!93525)

(assert (=> b!1377008 (= lt!605602 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605608 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65905 () (_ BitVec 32))

(declare-fun lt!605601 () (_ BitVec 32))

(assert (=> b!1377008 (= call!65905 lt!605601)))

(declare-fun b!1377009 () Bool)

(declare-fun res!919841 () Bool)

(declare-fun e!780008 () Bool)

(assert (=> b!1377009 (=> (not res!919841) (not e!780008))))

(assert (=> b!1377009 (= res!919841 (and (bvslt (size!45716 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45716 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377010 () Bool)

(declare-fun e!780009 () Bool)

(assert (=> b!1377010 (= e!780009 false)))

(declare-fun lt!605607 () Unit!45649)

(assert (=> b!1377010 (= lt!605607 e!780010)))

(declare-fun c!128024 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377010 (= c!128024 (validKeyInArray!0 (select (arr!45166 a!4032) to!206)))))

(declare-fun bm!65902 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93525 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65902 (= call!65906 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377011 () Bool)

(assert (=> b!1377011 (= e!780008 e!780009)))

(declare-fun res!919840 () Bool)

(assert (=> b!1377011 (=> (not res!919840) (not e!780009))))

(assert (=> b!1377011 (= res!919840 (and (= lt!605601 lt!605605) (not (= to!206 (size!45716 a!4032)))))))

(assert (=> b!1377011 (= lt!605605 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377011 (= lt!605601 (arrayCountValidKeys!0 lt!605608 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377011 (= lt!605608 (array!93526 (store (arr!45166 a!4032) i!1445 k!2947) (size!45716 a!4032)))))

(declare-fun bm!65903 () Bool)

(assert (=> bm!65903 (= call!65905 (arrayCountValidKeys!0 lt!605608 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377012 () Bool)

(declare-fun res!919842 () Bool)

(assert (=> b!1377012 (=> (not res!919842) (not e!780008))))

(assert (=> b!1377012 (= res!919842 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377013 () Bool)

(declare-fun lt!605603 () Unit!45649)

(assert (=> b!1377013 (= e!780010 lt!605603)))

(declare-fun lt!605606 () Unit!45649)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93525 (_ BitVec 32) (_ BitVec 32)) Unit!45649)

(assert (=> b!1377013 (= lt!605606 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377013 (= call!65906 (bvadd #b00000000000000000000000000000001 lt!605605))))

(assert (=> b!1377013 (= lt!605603 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605608 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377013 (= call!65905 (bvadd #b00000000000000000000000000000001 lt!605601))))

(declare-fun res!919843 () Bool)

(assert (=> start!116856 (=> (not res!919843) (not e!780008))))

(assert (=> start!116856 (= res!919843 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45716 a!4032))))))

(assert (=> start!116856 e!780008))

(assert (=> start!116856 true))

(declare-fun array_inv!34194 (array!93525) Bool)

(assert (=> start!116856 (array_inv!34194 a!4032)))

(declare-fun b!1377007 () Bool)

(declare-fun res!919839 () Bool)

(assert (=> b!1377007 (=> (not res!919839) (not e!780008))))

(assert (=> b!1377007 (= res!919839 (validKeyInArray!0 (select (arr!45166 a!4032) i!1445)))))

(assert (= (and start!116856 res!919843) b!1377007))

(assert (= (and b!1377007 res!919839) b!1377012))

(assert (= (and b!1377012 res!919842) b!1377009))

(assert (= (and b!1377009 res!919841) b!1377011))

(assert (= (and b!1377011 res!919840) b!1377010))

(assert (= (and b!1377010 c!128024) b!1377013))

(assert (= (and b!1377010 (not c!128024)) b!1377008))

(assert (= (or b!1377013 b!1377008) bm!65902))

(assert (= (or b!1377013 b!1377008) bm!65903))

(declare-fun m!1261171 () Bool)

(assert (=> bm!65902 m!1261171))

(declare-fun m!1261173 () Bool)

(assert (=> b!1377011 m!1261173))

(declare-fun m!1261175 () Bool)

(assert (=> b!1377011 m!1261175))

(declare-fun m!1261177 () Bool)

(assert (=> b!1377011 m!1261177))

(declare-fun m!1261179 () Bool)

(assert (=> b!1377013 m!1261179))

(declare-fun m!1261181 () Bool)

(assert (=> b!1377013 m!1261181))

(declare-fun m!1261183 () Bool)

(assert (=> start!116856 m!1261183))

(declare-fun m!1261185 () Bool)

(assert (=> bm!65903 m!1261185))

(declare-fun m!1261187 () Bool)

(assert (=> b!1377010 m!1261187))

(assert (=> b!1377010 m!1261187))

(declare-fun m!1261189 () Bool)

(assert (=> b!1377010 m!1261189))

(declare-fun m!1261191 () Bool)

(assert (=> b!1377007 m!1261191))

(assert (=> b!1377007 m!1261191))

(declare-fun m!1261193 () Bool)

(assert (=> b!1377007 m!1261193))

(declare-fun m!1261195 () Bool)

(assert (=> b!1377008 m!1261195))

(declare-fun m!1261197 () Bool)

(assert (=> b!1377008 m!1261197))

(declare-fun m!1261199 () Bool)

(assert (=> b!1377012 m!1261199))

(push 1)

(assert (not b!1377011))

(assert (not bm!65903))

(assert (not b!1377007))

(assert (not bm!65902))

(assert (not b!1377008))

(assert (not b!1377010))

(assert (not b!1377013))

(assert (not b!1377012))

(assert (not start!116856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

