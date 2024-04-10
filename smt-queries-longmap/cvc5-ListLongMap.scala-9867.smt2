; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116888 () Bool)

(assert start!116888)

(declare-fun b!1377392 () Bool)

(declare-fun res!920134 () Bool)

(declare-fun e!780231 () Bool)

(assert (=> b!1377392 (=> (not res!920134) (not e!780231))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93557 0))(
  ( (array!93558 (arr!45182 (Array (_ BitVec 32) (_ BitVec 64))) (size!45732 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93557)

(declare-fun lt!606002 () array!93557)

(declare-fun arrayCountValidKeys!0 (array!93557 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377392 (= res!920134 (= (arrayCountValidKeys!0 lt!606002 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377393 () Bool)

(declare-datatypes ((Unit!45681 0))(
  ( (Unit!45682) )
))
(declare-fun e!780230 () Unit!45681)

(declare-fun lt!606001 () Unit!45681)

(assert (=> b!1377393 (= e!780230 lt!606001)))

(declare-fun lt!606004 () Unit!45681)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93557 (_ BitVec 32) (_ BitVec 32)) Unit!45681)

(assert (=> b!1377393 (= lt!606004 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66002 () (_ BitVec 32))

(declare-fun lt!606003 () (_ BitVec 32))

(assert (=> b!1377393 (= call!66002 lt!606003)))

(assert (=> b!1377393 (= lt!606001 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606002 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66001 () (_ BitVec 32))

(declare-fun lt!605997 () (_ BitVec 32))

(assert (=> b!1377393 (= call!66001 lt!605997)))

(declare-fun b!1377394 () Bool)

(declare-fun res!920132 () Bool)

(declare-fun e!780232 () Bool)

(assert (=> b!1377394 (=> (not res!920132) (not e!780232))))

(assert (=> b!1377394 (= res!920132 (and (bvslt (size!45732 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45732 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65998 () Bool)

(assert (=> bm!65998 (= call!66001 (arrayCountValidKeys!0 lt!606002 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!920130 () Bool)

(assert (=> start!116888 (=> (not res!920130) (not e!780232))))

(assert (=> start!116888 (= res!920130 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45732 a!4032))))))

(assert (=> start!116888 e!780232))

(assert (=> start!116888 true))

(declare-fun array_inv!34210 (array!93557) Bool)

(assert (=> start!116888 (array_inv!34210 a!4032)))

(declare-fun b!1377395 () Bool)

(declare-fun e!780228 () Bool)

(assert (=> b!1377395 (= e!780228 e!780231)))

(declare-fun res!920131 () Bool)

(assert (=> b!1377395 (=> (not res!920131) (not e!780231))))

(assert (=> b!1377395 (= res!920131 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45732 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605998 () Unit!45681)

(assert (=> b!1377395 (= lt!605998 e!780230)))

(declare-fun c!128072 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377395 (= c!128072 (validKeyInArray!0 (select (arr!45182 a!4032) to!206)))))

(declare-fun bm!65999 () Bool)

(assert (=> bm!65999 (= call!66002 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377396 () Bool)

(declare-fun res!920128 () Bool)

(assert (=> b!1377396 (=> (not res!920128) (not e!780232))))

(assert (=> b!1377396 (= res!920128 (validKeyInArray!0 (select (arr!45182 a!4032) i!1445)))))

(declare-fun b!1377397 () Bool)

(assert (=> b!1377397 (= e!780231 (not true))))

(assert (=> b!1377397 (= (arrayCountValidKeys!0 lt!606002 (bvadd #b00000000000000000000000000000001 i!1445) (size!45732 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45732 a!4032)))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!606000 () Unit!45681)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93557 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45681)

(assert (=> b!1377397 (= lt!606000 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377398 () Bool)

(assert (=> b!1377398 (= e!780232 e!780228)))

(declare-fun res!920129 () Bool)

(assert (=> b!1377398 (=> (not res!920129) (not e!780228))))

(assert (=> b!1377398 (= res!920129 (and (= lt!605997 lt!606003) (not (= to!206 (size!45732 a!4032)))))))

(assert (=> b!1377398 (= lt!606003 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377398 (= lt!605997 (arrayCountValidKeys!0 lt!606002 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377398 (= lt!606002 (array!93558 (store (arr!45182 a!4032) i!1445 k!2947) (size!45732 a!4032)))))

(declare-fun b!1377399 () Bool)

(declare-fun res!920133 () Bool)

(assert (=> b!1377399 (=> (not res!920133) (not e!780232))))

(assert (=> b!1377399 (= res!920133 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377400 () Bool)

(declare-fun lt!605999 () Unit!45681)

(assert (=> b!1377400 (= e!780230 lt!605999)))

(declare-fun lt!605996 () Unit!45681)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93557 (_ BitVec 32) (_ BitVec 32)) Unit!45681)

(assert (=> b!1377400 (= lt!605996 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377400 (= call!66002 (bvadd #b00000000000000000000000000000001 lt!606003))))

(assert (=> b!1377400 (= lt!605999 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606002 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377400 (= call!66001 (bvadd #b00000000000000000000000000000001 lt!605997))))

(assert (= (and start!116888 res!920130) b!1377396))

(assert (= (and b!1377396 res!920128) b!1377399))

(assert (= (and b!1377399 res!920133) b!1377394))

(assert (= (and b!1377394 res!920132) b!1377398))

(assert (= (and b!1377398 res!920129) b!1377395))

(assert (= (and b!1377395 c!128072) b!1377400))

(assert (= (and b!1377395 (not c!128072)) b!1377393))

(assert (= (or b!1377400 b!1377393) bm!65998))

(assert (= (or b!1377400 b!1377393) bm!65999))

(assert (= (and b!1377395 res!920131) b!1377392))

(assert (= (and b!1377392 res!920134) b!1377397))

(declare-fun m!1261673 () Bool)

(assert (=> b!1377398 m!1261673))

(declare-fun m!1261675 () Bool)

(assert (=> b!1377398 m!1261675))

(declare-fun m!1261677 () Bool)

(assert (=> b!1377398 m!1261677))

(declare-fun m!1261679 () Bool)

(assert (=> b!1377396 m!1261679))

(assert (=> b!1377396 m!1261679))

(declare-fun m!1261681 () Bool)

(assert (=> b!1377396 m!1261681))

(declare-fun m!1261683 () Bool)

(assert (=> b!1377393 m!1261683))

(declare-fun m!1261685 () Bool)

(assert (=> b!1377393 m!1261685))

(declare-fun m!1261687 () Bool)

(assert (=> b!1377395 m!1261687))

(assert (=> b!1377395 m!1261687))

(declare-fun m!1261689 () Bool)

(assert (=> b!1377395 m!1261689))

(declare-fun m!1261691 () Bool)

(assert (=> b!1377400 m!1261691))

(declare-fun m!1261693 () Bool)

(assert (=> b!1377400 m!1261693))

(declare-fun m!1261695 () Bool)

(assert (=> b!1377397 m!1261695))

(declare-fun m!1261697 () Bool)

(assert (=> b!1377397 m!1261697))

(declare-fun m!1261699 () Bool)

(assert (=> b!1377397 m!1261699))

(declare-fun m!1261701 () Bool)

(assert (=> bm!65999 m!1261701))

(declare-fun m!1261703 () Bool)

(assert (=> b!1377392 m!1261703))

(assert (=> b!1377392 m!1261701))

(declare-fun m!1261705 () Bool)

(assert (=> b!1377399 m!1261705))

(declare-fun m!1261707 () Bool)

(assert (=> start!116888 m!1261707))

(assert (=> bm!65998 m!1261703))

(push 1)

(assert (not b!1377400))

(assert (not b!1377393))

(assert (not b!1377397))

(assert (not bm!65998))

(assert (not b!1377396))

