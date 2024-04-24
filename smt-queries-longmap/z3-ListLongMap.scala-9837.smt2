; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116938 () Bool)

(assert start!116938)

(declare-fun res!919055 () Bool)

(declare-fun e!780048 () Bool)

(assert (=> start!116938 (=> (not res!919055) (not e!780048))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93493 0))(
  ( (array!93494 (arr!45145 (Array (_ BitVec 32) (_ BitVec 64))) (size!45696 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93493)

(assert (=> start!116938 (= res!919055 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45696 a!4032))))))

(assert (=> start!116938 e!780048))

(assert (=> start!116938 true))

(declare-fun array_inv!34426 (array!93493) Bool)

(assert (=> start!116938 (array_inv!34426 a!4032)))

(declare-fun b!1376787 () Bool)

(declare-fun res!919059 () Bool)

(assert (=> b!1376787 (=> (not res!919059) (not e!780048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376787 (= res!919059 (validKeyInArray!0 (select (arr!45145 a!4032) i!1445)))))

(declare-fun b!1376788 () Bool)

(declare-fun e!780045 () Bool)

(assert (=> b!1376788 (= e!780045 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604888 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93493 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376788 (= lt!604888 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604894 () array!93493)

(declare-fun lt!604890 () (_ BitVec 32))

(assert (=> b!1376788 (= lt!604890 (arrayCountValidKeys!0 lt!604894 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376789 () Bool)

(declare-fun res!919057 () Bool)

(assert (=> b!1376789 (=> (not res!919057) (not e!780048))))

(assert (=> b!1376789 (= res!919057 (and (bvslt (size!45696 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45696 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376790 () Bool)

(declare-fun res!919056 () Bool)

(assert (=> b!1376790 (=> (not res!919056) (not e!780048))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376790 (= res!919056 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376791 () Bool)

(declare-datatypes ((Unit!45488 0))(
  ( (Unit!45489) )
))
(declare-fun e!780047 () Unit!45488)

(declare-fun lt!604893 () Unit!45488)

(assert (=> b!1376791 (= e!780047 lt!604893)))

(declare-fun lt!604889 () Unit!45488)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93493 (_ BitVec 32) (_ BitVec 32)) Unit!45488)

(assert (=> b!1376791 (= lt!604889 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65746 () (_ BitVec 32))

(declare-fun lt!604896 () (_ BitVec 32))

(assert (=> b!1376791 (= call!65746 (bvadd #b00000000000000000000000000000001 lt!604896))))

(assert (=> b!1376791 (= lt!604893 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604894 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65745 () (_ BitVec 32))

(declare-fun lt!604891 () (_ BitVec 32))

(assert (=> b!1376791 (= call!65745 (bvadd #b00000000000000000000000000000001 lt!604891))))

(declare-fun bm!65742 () Bool)

(assert (=> bm!65742 (= call!65746 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376792 () Bool)

(declare-fun e!780046 () Bool)

(assert (=> b!1376792 (= e!780048 e!780046)))

(declare-fun res!919058 () Bool)

(assert (=> b!1376792 (=> (not res!919058) (not e!780046))))

(assert (=> b!1376792 (= res!919058 (and (= lt!604891 lt!604896) (not (= to!206 (size!45696 a!4032)))))))

(assert (=> b!1376792 (= lt!604896 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376792 (= lt!604891 (arrayCountValidKeys!0 lt!604894 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376792 (= lt!604894 (array!93494 (store (arr!45145 a!4032) i!1445 k0!2947) (size!45696 a!4032)))))

(declare-fun bm!65743 () Bool)

(assert (=> bm!65743 (= call!65745 (arrayCountValidKeys!0 lt!604894 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376793 () Bool)

(declare-fun lt!604895 () Unit!45488)

(assert (=> b!1376793 (= e!780047 lt!604895)))

(declare-fun lt!604887 () Unit!45488)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93493 (_ BitVec 32) (_ BitVec 32)) Unit!45488)

(assert (=> b!1376793 (= lt!604887 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376793 (= call!65746 lt!604896)))

(assert (=> b!1376793 (= lt!604895 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604894 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376793 (= call!65745 lt!604891)))

(declare-fun b!1376794 () Bool)

(assert (=> b!1376794 (= e!780046 e!780045)))

(declare-fun res!919054 () Bool)

(assert (=> b!1376794 (=> (not res!919054) (not e!780045))))

(assert (=> b!1376794 (= res!919054 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45696 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604892 () Unit!45488)

(assert (=> b!1376794 (= lt!604892 e!780047)))

(declare-fun c!128314 () Bool)

(assert (=> b!1376794 (= c!128314 (validKeyInArray!0 (select (arr!45145 a!4032) to!206)))))

(assert (= (and start!116938 res!919055) b!1376787))

(assert (= (and b!1376787 res!919059) b!1376790))

(assert (= (and b!1376790 res!919056) b!1376789))

(assert (= (and b!1376789 res!919057) b!1376792))

(assert (= (and b!1376792 res!919058) b!1376794))

(assert (= (and b!1376794 c!128314) b!1376791))

(assert (= (and b!1376794 (not c!128314)) b!1376793))

(assert (= (or b!1376791 b!1376793) bm!65743))

(assert (= (or b!1376791 b!1376793) bm!65742))

(assert (= (and b!1376794 res!919054) b!1376788))

(declare-fun m!1260935 () Bool)

(assert (=> start!116938 m!1260935))

(declare-fun m!1260937 () Bool)

(assert (=> b!1376790 m!1260937))

(declare-fun m!1260939 () Bool)

(assert (=> bm!65743 m!1260939))

(declare-fun m!1260941 () Bool)

(assert (=> b!1376793 m!1260941))

(declare-fun m!1260943 () Bool)

(assert (=> b!1376793 m!1260943))

(declare-fun m!1260945 () Bool)

(assert (=> b!1376791 m!1260945))

(declare-fun m!1260947 () Bool)

(assert (=> b!1376791 m!1260947))

(declare-fun m!1260949 () Bool)

(assert (=> b!1376792 m!1260949))

(declare-fun m!1260951 () Bool)

(assert (=> b!1376792 m!1260951))

(declare-fun m!1260953 () Bool)

(assert (=> b!1376792 m!1260953))

(declare-fun m!1260955 () Bool)

(assert (=> b!1376794 m!1260955))

(assert (=> b!1376794 m!1260955))

(declare-fun m!1260957 () Bool)

(assert (=> b!1376794 m!1260957))

(declare-fun m!1260959 () Bool)

(assert (=> b!1376788 m!1260959))

(assert (=> b!1376788 m!1260939))

(declare-fun m!1260961 () Bool)

(assert (=> b!1376787 m!1260961))

(assert (=> b!1376787 m!1260961))

(declare-fun m!1260963 () Bool)

(assert (=> b!1376787 m!1260963))

(assert (=> bm!65742 m!1260959))

(check-sat (not b!1376793) (not b!1376787) (not bm!65743) (not b!1376788) (not b!1376792) (not start!116938) (not b!1376790) (not b!1376794) (not bm!65742) (not b!1376791))
(check-sat)
