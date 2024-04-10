; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116854 () Bool)

(assert start!116854)

(declare-fun b!1376986 () Bool)

(declare-fun res!919827 () Bool)

(declare-fun e!779998 () Bool)

(assert (=> b!1376986 (=> (not res!919827) (not e!779998))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93523 0))(
  ( (array!93524 (arr!45165 (Array (_ BitVec 32) (_ BitVec 64))) (size!45715 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93523)

(assert (=> b!1376986 (= res!919827 (and (bvslt (size!45715 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45715 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919826 () Bool)

(assert (=> start!116854 (=> (not res!919826) (not e!779998))))

(assert (=> start!116854 (= res!919826 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45715 a!4032))))))

(assert (=> start!116854 e!779998))

(assert (=> start!116854 true))

(declare-fun array_inv!34193 (array!93523) Bool)

(assert (=> start!116854 (array_inv!34193 a!4032)))

(declare-fun b!1376987 () Bool)

(declare-fun e!779995 () Bool)

(assert (=> b!1376987 (= e!779995 false)))

(declare-datatypes ((Unit!45647 0))(
  ( (Unit!45648) )
))
(declare-fun lt!605577 () Unit!45647)

(declare-fun e!779997 () Unit!45647)

(assert (=> b!1376987 (= lt!605577 e!779997)))

(declare-fun c!128021 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376987 (= c!128021 (validKeyInArray!0 (select (arr!45165 a!4032) to!206)))))

(declare-fun call!65899 () (_ BitVec 32))

(declare-fun bm!65896 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93523 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65896 (= call!65899 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376988 () Bool)

(declare-fun lt!605584 () Unit!45647)

(assert (=> b!1376988 (= e!779997 lt!605584)))

(declare-fun lt!605579 () Unit!45647)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93523 (_ BitVec 32) (_ BitVec 32)) Unit!45647)

(assert (=> b!1376988 (= lt!605579 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605581 () (_ BitVec 32))

(assert (=> b!1376988 (= call!65899 lt!605581)))

(declare-fun lt!605583 () array!93523)

(assert (=> b!1376988 (= lt!605584 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605583 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65900 () (_ BitVec 32))

(declare-fun lt!605578 () (_ BitVec 32))

(assert (=> b!1376988 (= call!65900 lt!605578)))

(declare-fun b!1376989 () Bool)

(declare-fun res!919825 () Bool)

(assert (=> b!1376989 (=> (not res!919825) (not e!779998))))

(assert (=> b!1376989 (= res!919825 (validKeyInArray!0 (select (arr!45165 a!4032) i!1445)))))

(declare-fun b!1376990 () Bool)

(declare-fun lt!605582 () Unit!45647)

(assert (=> b!1376990 (= e!779997 lt!605582)))

(declare-fun lt!605580 () Unit!45647)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93523 (_ BitVec 32) (_ BitVec 32)) Unit!45647)

(assert (=> b!1376990 (= lt!605580 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376990 (= call!65899 (bvadd #b00000000000000000000000000000001 lt!605581))))

(assert (=> b!1376990 (= lt!605582 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605583 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376990 (= call!65900 (bvadd #b00000000000000000000000000000001 lt!605578))))

(declare-fun b!1376991 () Bool)

(declare-fun res!919824 () Bool)

(assert (=> b!1376991 (=> (not res!919824) (not e!779998))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376991 (= res!919824 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376992 () Bool)

(assert (=> b!1376992 (= e!779998 e!779995)))

(declare-fun res!919828 () Bool)

(assert (=> b!1376992 (=> (not res!919828) (not e!779995))))

(assert (=> b!1376992 (= res!919828 (and (= lt!605578 lt!605581) (not (= to!206 (size!45715 a!4032)))))))

(assert (=> b!1376992 (= lt!605581 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376992 (= lt!605578 (arrayCountValidKeys!0 lt!605583 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376992 (= lt!605583 (array!93524 (store (arr!45165 a!4032) i!1445 k0!2947) (size!45715 a!4032)))))

(declare-fun bm!65897 () Bool)

(assert (=> bm!65897 (= call!65900 (arrayCountValidKeys!0 lt!605583 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116854 res!919826) b!1376989))

(assert (= (and b!1376989 res!919825) b!1376991))

(assert (= (and b!1376991 res!919824) b!1376986))

(assert (= (and b!1376986 res!919827) b!1376992))

(assert (= (and b!1376992 res!919828) b!1376987))

(assert (= (and b!1376987 c!128021) b!1376990))

(assert (= (and b!1376987 (not c!128021)) b!1376988))

(assert (= (or b!1376990 b!1376988) bm!65897))

(assert (= (or b!1376990 b!1376988) bm!65896))

(declare-fun m!1261141 () Bool)

(assert (=> b!1376989 m!1261141))

(assert (=> b!1376989 m!1261141))

(declare-fun m!1261143 () Bool)

(assert (=> b!1376989 m!1261143))

(declare-fun m!1261145 () Bool)

(assert (=> b!1376988 m!1261145))

(declare-fun m!1261147 () Bool)

(assert (=> b!1376988 m!1261147))

(declare-fun m!1261149 () Bool)

(assert (=> bm!65896 m!1261149))

(declare-fun m!1261151 () Bool)

(assert (=> b!1376992 m!1261151))

(declare-fun m!1261153 () Bool)

(assert (=> b!1376992 m!1261153))

(declare-fun m!1261155 () Bool)

(assert (=> b!1376992 m!1261155))

(declare-fun m!1261157 () Bool)

(assert (=> b!1376987 m!1261157))

(assert (=> b!1376987 m!1261157))

(declare-fun m!1261159 () Bool)

(assert (=> b!1376987 m!1261159))

(declare-fun m!1261161 () Bool)

(assert (=> b!1376990 m!1261161))

(declare-fun m!1261163 () Bool)

(assert (=> b!1376990 m!1261163))

(declare-fun m!1261165 () Bool)

(assert (=> bm!65897 m!1261165))

(declare-fun m!1261167 () Bool)

(assert (=> start!116854 m!1261167))

(declare-fun m!1261169 () Bool)

(assert (=> b!1376991 m!1261169))

(check-sat (not b!1376987) (not b!1376989) (not b!1376991) (not start!116854) (not b!1376988) (not b!1376990) (not bm!65896) (not b!1376992) (not bm!65897))
