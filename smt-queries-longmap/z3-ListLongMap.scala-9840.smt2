; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116956 () Bool)

(assert start!116956)

(declare-fun b!1377003 () Bool)

(declare-fun e!780183 () Bool)

(assert (=> b!1377003 (= e!780183 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93511 0))(
  ( (array!93512 (arr!45154 (Array (_ BitVec 32) (_ BitVec 64))) (size!45705 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93511)

(declare-fun lt!605157 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93511 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377003 (= lt!605157 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!605162 () array!93511)

(declare-fun lt!605159 () (_ BitVec 32))

(assert (=> b!1377003 (= lt!605159 (arrayCountValidKeys!0 lt!605162 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377004 () Bool)

(declare-fun res!919218 () Bool)

(declare-fun e!780181 () Bool)

(assert (=> b!1377004 (=> (not res!919218) (not e!780181))))

(assert (=> b!1377004 (= res!919218 (and (bvslt (size!45705 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45705 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919220 () Bool)

(assert (=> start!116956 (=> (not res!919220) (not e!780181))))

(assert (=> start!116956 (= res!919220 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45705 a!4032))))))

(assert (=> start!116956 e!780181))

(assert (=> start!116956 true))

(declare-fun array_inv!34435 (array!93511) Bool)

(assert (=> start!116956 (array_inv!34435 a!4032)))

(declare-fun b!1377005 () Bool)

(declare-fun e!780184 () Bool)

(assert (=> b!1377005 (= e!780184 e!780183)))

(declare-fun res!919217 () Bool)

(assert (=> b!1377005 (=> (not res!919217) (not e!780183))))

(assert (=> b!1377005 (= res!919217 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45705 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45506 0))(
  ( (Unit!45507) )
))
(declare-fun lt!605158 () Unit!45506)

(declare-fun e!780182 () Unit!45506)

(assert (=> b!1377005 (= lt!605158 e!780182)))

(declare-fun c!128341 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377005 (= c!128341 (validKeyInArray!0 (select (arr!45154 a!4032) to!206)))))

(declare-fun bm!65796 () Bool)

(declare-fun call!65799 () (_ BitVec 32))

(assert (=> bm!65796 (= call!65799 (arrayCountValidKeys!0 lt!605162 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377006 () Bool)

(declare-fun res!919221 () Bool)

(assert (=> b!1377006 (=> (not res!919221) (not e!780181))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377006 (= res!919221 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377007 () Bool)

(declare-fun lt!605165 () Unit!45506)

(assert (=> b!1377007 (= e!780182 lt!605165)))

(declare-fun lt!605161 () Unit!45506)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93511 (_ BitVec 32) (_ BitVec 32)) Unit!45506)

(assert (=> b!1377007 (= lt!605161 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65800 () (_ BitVec 32))

(declare-fun lt!605166 () (_ BitVec 32))

(assert (=> b!1377007 (= call!65800 (bvadd #b00000000000000000000000000000001 lt!605166))))

(assert (=> b!1377007 (= lt!605165 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605162 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605163 () (_ BitVec 32))

(assert (=> b!1377007 (= call!65799 (bvadd #b00000000000000000000000000000001 lt!605163))))

(declare-fun bm!65797 () Bool)

(assert (=> bm!65797 (= call!65800 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377008 () Bool)

(assert (=> b!1377008 (= e!780181 e!780184)))

(declare-fun res!919219 () Bool)

(assert (=> b!1377008 (=> (not res!919219) (not e!780184))))

(assert (=> b!1377008 (= res!919219 (and (= lt!605163 lt!605166) (not (= to!206 (size!45705 a!4032)))))))

(assert (=> b!1377008 (= lt!605166 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377008 (= lt!605163 (arrayCountValidKeys!0 lt!605162 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377008 (= lt!605162 (array!93512 (store (arr!45154 a!4032) i!1445 k0!2947) (size!45705 a!4032)))))

(declare-fun b!1377009 () Bool)

(declare-fun lt!605160 () Unit!45506)

(assert (=> b!1377009 (= e!780182 lt!605160)))

(declare-fun lt!605164 () Unit!45506)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93511 (_ BitVec 32) (_ BitVec 32)) Unit!45506)

(assert (=> b!1377009 (= lt!605164 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377009 (= call!65800 lt!605166)))

(assert (=> b!1377009 (= lt!605160 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605162 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377009 (= call!65799 lt!605163)))

(declare-fun b!1377010 () Bool)

(declare-fun res!919216 () Bool)

(assert (=> b!1377010 (=> (not res!919216) (not e!780181))))

(assert (=> b!1377010 (= res!919216 (validKeyInArray!0 (select (arr!45154 a!4032) i!1445)))))

(assert (= (and start!116956 res!919220) b!1377010))

(assert (= (and b!1377010 res!919216) b!1377006))

(assert (= (and b!1377006 res!919221) b!1377004))

(assert (= (and b!1377004 res!919218) b!1377008))

(assert (= (and b!1377008 res!919219) b!1377005))

(assert (= (and b!1377005 c!128341) b!1377007))

(assert (= (and b!1377005 (not c!128341)) b!1377009))

(assert (= (or b!1377007 b!1377009) bm!65797))

(assert (= (or b!1377007 b!1377009) bm!65796))

(assert (= (and b!1377005 res!919217) b!1377003))

(declare-fun m!1261209 () Bool)

(assert (=> b!1377009 m!1261209))

(declare-fun m!1261211 () Bool)

(assert (=> b!1377009 m!1261211))

(declare-fun m!1261213 () Bool)

(assert (=> bm!65797 m!1261213))

(assert (=> b!1377003 m!1261213))

(declare-fun m!1261215 () Bool)

(assert (=> b!1377003 m!1261215))

(declare-fun m!1261217 () Bool)

(assert (=> b!1377008 m!1261217))

(declare-fun m!1261219 () Bool)

(assert (=> b!1377008 m!1261219))

(declare-fun m!1261221 () Bool)

(assert (=> b!1377008 m!1261221))

(declare-fun m!1261223 () Bool)

(assert (=> b!1377007 m!1261223))

(declare-fun m!1261225 () Bool)

(assert (=> b!1377007 m!1261225))

(declare-fun m!1261227 () Bool)

(assert (=> b!1377006 m!1261227))

(declare-fun m!1261229 () Bool)

(assert (=> b!1377005 m!1261229))

(assert (=> b!1377005 m!1261229))

(declare-fun m!1261231 () Bool)

(assert (=> b!1377005 m!1261231))

(declare-fun m!1261233 () Bool)

(assert (=> b!1377010 m!1261233))

(assert (=> b!1377010 m!1261233))

(declare-fun m!1261235 () Bool)

(assert (=> b!1377010 m!1261235))

(assert (=> bm!65796 m!1261215))

(declare-fun m!1261237 () Bool)

(assert (=> start!116956 m!1261237))

(check-sat (not start!116956) (not b!1377010) (not b!1377007) (not bm!65797) (not b!1377003) (not b!1377006) (not b!1377005) (not bm!65796) (not b!1377008) (not b!1377009))
(check-sat)
