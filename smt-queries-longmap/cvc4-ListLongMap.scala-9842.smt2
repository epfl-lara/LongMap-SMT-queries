; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116742 () Bool)

(assert start!116742)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93411 0))(
  ( (array!93412 (arr!45109 (Array (_ BitVec 32) (_ BitVec 64))) (size!45659 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93411)

(declare-fun call!65779 () (_ BitVec 32))

(declare-fun bm!65776 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93411 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65776 (= call!65779 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375881 () Bool)

(declare-fun res!918842 () Bool)

(declare-fun e!779449 () Bool)

(assert (=> b!1375881 (=> (not res!918842) (not e!779449))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375881 (= res!918842 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375882 () Bool)

(declare-fun res!918841 () Bool)

(assert (=> b!1375882 (=> (not res!918841) (not e!779449))))

(assert (=> b!1375882 (= res!918841 (validKeyInArray!0 (select (arr!45109 a!4032) i!1445)))))

(declare-fun b!1375883 () Bool)

(declare-datatypes ((Unit!45583 0))(
  ( (Unit!45584) )
))
(declare-fun e!779451 () Unit!45583)

(declare-fun lt!604917 () Unit!45583)

(assert (=> b!1375883 (= e!779451 lt!604917)))

(declare-fun lt!604922 () Unit!45583)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93411 (_ BitVec 32) (_ BitVec 32)) Unit!45583)

(assert (=> b!1375883 (= lt!604922 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604924 () (_ BitVec 32))

(assert (=> b!1375883 (= call!65779 (bvadd #b00000000000000000000000000000001 lt!604924))))

(declare-fun lt!604918 () array!93411)

(assert (=> b!1375883 (= lt!604917 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604918 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65780 () (_ BitVec 32))

(declare-fun lt!604916 () (_ BitVec 32))

(assert (=> b!1375883 (= call!65780 (bvadd #b00000000000000000000000000000001 lt!604916))))

(declare-fun b!1375884 () Bool)

(declare-fun e!779448 () Bool)

(assert (=> b!1375884 (= e!779449 e!779448)))

(declare-fun res!918839 () Bool)

(assert (=> b!1375884 (=> (not res!918839) (not e!779448))))

(assert (=> b!1375884 (= res!918839 (and (= lt!604916 lt!604924) (not (= to!206 (size!45659 a!4032)))))))

(assert (=> b!1375884 (= lt!604924 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375884 (= lt!604916 (arrayCountValidKeys!0 lt!604918 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375884 (= lt!604918 (array!93412 (store (arr!45109 a!4032) i!1445 k!2947) (size!45659 a!4032)))))

(declare-fun res!918844 () Bool)

(assert (=> start!116742 (=> (not res!918844) (not e!779449))))

(assert (=> start!116742 (= res!918844 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45659 a!4032))))))

(assert (=> start!116742 e!779449))

(assert (=> start!116742 true))

(declare-fun array_inv!34137 (array!93411) Bool)

(assert (=> start!116742 (array_inv!34137 a!4032)))

(declare-fun b!1375885 () Bool)

(declare-fun e!779450 () Bool)

(assert (=> b!1375885 (= e!779448 e!779450)))

(declare-fun res!918843 () Bool)

(assert (=> b!1375885 (=> (not res!918843) (not e!779450))))

(assert (=> b!1375885 (= res!918843 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45659 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604919 () Unit!45583)

(assert (=> b!1375885 (= lt!604919 e!779451)))

(declare-fun c!127961 () Bool)

(assert (=> b!1375885 (= c!127961 (validKeyInArray!0 (select (arr!45109 a!4032) to!206)))))

(declare-fun b!1375886 () Bool)

(assert (=> b!1375886 (= e!779450 false)))

(declare-fun lt!604923 () (_ BitVec 32))

(assert (=> b!1375886 (= lt!604923 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604920 () (_ BitVec 32))

(assert (=> b!1375886 (= lt!604920 (arrayCountValidKeys!0 lt!604918 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375887 () Bool)

(declare-fun res!918840 () Bool)

(assert (=> b!1375887 (=> (not res!918840) (not e!779449))))

(assert (=> b!1375887 (= res!918840 (and (bvslt (size!45659 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45659 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65777 () Bool)

(assert (=> bm!65777 (= call!65780 (arrayCountValidKeys!0 lt!604918 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375888 () Bool)

(declare-fun lt!604915 () Unit!45583)

(assert (=> b!1375888 (= e!779451 lt!604915)))

(declare-fun lt!604921 () Unit!45583)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93411 (_ BitVec 32) (_ BitVec 32)) Unit!45583)

(assert (=> b!1375888 (= lt!604921 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375888 (= call!65779 lt!604924)))

(assert (=> b!1375888 (= lt!604915 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604918 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375888 (= call!65780 lt!604916)))

(assert (= (and start!116742 res!918844) b!1375882))

(assert (= (and b!1375882 res!918841) b!1375881))

(assert (= (and b!1375881 res!918842) b!1375887))

(assert (= (and b!1375887 res!918840) b!1375884))

(assert (= (and b!1375884 res!918839) b!1375885))

(assert (= (and b!1375885 c!127961) b!1375883))

(assert (= (and b!1375885 (not c!127961)) b!1375888))

(assert (= (or b!1375883 b!1375888) bm!65776))

(assert (= (or b!1375883 b!1375888) bm!65777))

(assert (= (and b!1375885 res!918843) b!1375886))

(declare-fun m!1259821 () Bool)

(assert (=> b!1375881 m!1259821))

(declare-fun m!1259823 () Bool)

(assert (=> b!1375886 m!1259823))

(declare-fun m!1259825 () Bool)

(assert (=> b!1375886 m!1259825))

(declare-fun m!1259827 () Bool)

(assert (=> b!1375884 m!1259827))

(declare-fun m!1259829 () Bool)

(assert (=> b!1375884 m!1259829))

(declare-fun m!1259831 () Bool)

(assert (=> b!1375884 m!1259831))

(assert (=> bm!65777 m!1259825))

(declare-fun m!1259833 () Bool)

(assert (=> b!1375888 m!1259833))

(declare-fun m!1259835 () Bool)

(assert (=> b!1375888 m!1259835))

(declare-fun m!1259837 () Bool)

(assert (=> b!1375885 m!1259837))

(assert (=> b!1375885 m!1259837))

(declare-fun m!1259839 () Bool)

(assert (=> b!1375885 m!1259839))

(declare-fun m!1259841 () Bool)

(assert (=> start!116742 m!1259841))

(declare-fun m!1259843 () Bool)

(assert (=> b!1375882 m!1259843))

(assert (=> b!1375882 m!1259843))

(declare-fun m!1259845 () Bool)

(assert (=> b!1375882 m!1259845))

(declare-fun m!1259847 () Bool)

(assert (=> b!1375883 m!1259847))

(declare-fun m!1259849 () Bool)

(assert (=> b!1375883 m!1259849))

(assert (=> bm!65776 m!1259823))

(push 1)

(assert (not b!1375886))

(assert (not b!1375883))

(assert (not b!1375885))

(assert (not b!1375882))

(assert (not bm!65776))

(assert (not b!1375881))

(assert (not start!116742))

(assert (not b!1375888))

(assert (not bm!65777))

(assert (not b!1375884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

