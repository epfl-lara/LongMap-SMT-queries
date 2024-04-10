; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116838 () Bool)

(assert start!116838)

(declare-fun b!1376818 () Bool)

(declare-fun res!919707 () Bool)

(declare-fun e!779902 () Bool)

(assert (=> b!1376818 (=> (not res!919707) (not e!779902))))

(declare-datatypes ((array!93507 0))(
  ( (array!93508 (arr!45157 (Array (_ BitVec 32) (_ BitVec 64))) (size!45707 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93507)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376818 (= res!919707 (validKeyInArray!0 (select (arr!45157 a!4032) i!1445)))))

(declare-fun b!1376819 () Bool)

(declare-fun res!919703 () Bool)

(declare-fun e!779900 () Bool)

(assert (=> b!1376819 (=> (not res!919703) (not e!779900))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376819 (= res!919703 (not (validKeyInArray!0 (select (arr!45157 a!4032) to!206))))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun e!779901 () Bool)

(declare-fun b!1376820 () Bool)

(assert (=> b!1376820 (= e!779901 (not (validKeyInArray!0 (select (store (arr!45157 a!4032) i!1445 k!2947) to!206))))))

(declare-fun b!1376821 () Bool)

(assert (=> b!1376821 (= e!779902 e!779900)))

(declare-fun res!919702 () Bool)

(assert (=> b!1376821 (=> (not res!919702) (not e!779900))))

(declare-fun lt!605392 () (_ BitVec 32))

(declare-fun lt!605391 () (_ BitVec 32))

(assert (=> b!1376821 (= res!919702 (and (= lt!605392 lt!605391) (not (= to!206 (size!45707 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93507 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376821 (= lt!605391 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376821 (= lt!605392 (arrayCountValidKeys!0 (array!93508 (store (arr!45157 a!4032) i!1445 k!2947) (size!45707 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376822 () Bool)

(declare-fun res!919705 () Bool)

(assert (=> b!1376822 (=> (not res!919705) (not e!779902))))

(assert (=> b!1376822 (= res!919705 (and (bvslt (size!45707 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45707 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376823 () Bool)

(assert (=> b!1376823 (= e!779900 (not e!779901))))

(declare-fun res!919708 () Bool)

(assert (=> b!1376823 (=> (not res!919708) (not e!779901))))

(assert (=> b!1376823 (= res!919708 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45707 a!4032))))))

(assert (=> b!1376823 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605391)))

(declare-datatypes ((Unit!45631 0))(
  ( (Unit!45632) )
))
(declare-fun lt!605390 () Unit!45631)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93507 (_ BitVec 32) (_ BitVec 32)) Unit!45631)

(assert (=> b!1376823 (= lt!605390 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376824 () Bool)

(declare-fun res!919704 () Bool)

(assert (=> b!1376824 (=> (not res!919704) (not e!779902))))

(assert (=> b!1376824 (= res!919704 (not (validKeyInArray!0 k!2947)))))

(declare-fun res!919706 () Bool)

(assert (=> start!116838 (=> (not res!919706) (not e!779902))))

(assert (=> start!116838 (= res!919706 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45707 a!4032))))))

(assert (=> start!116838 e!779902))

(assert (=> start!116838 true))

(declare-fun array_inv!34185 (array!93507) Bool)

(assert (=> start!116838 (array_inv!34185 a!4032)))

(assert (= (and start!116838 res!919706) b!1376818))

(assert (= (and b!1376818 res!919707) b!1376824))

(assert (= (and b!1376824 res!919704) b!1376822))

(assert (= (and b!1376822 res!919705) b!1376821))

(assert (= (and b!1376821 res!919702) b!1376819))

(assert (= (and b!1376819 res!919703) b!1376823))

(assert (= (and b!1376823 res!919708) b!1376820))

(declare-fun m!1260905 () Bool)

(assert (=> b!1376819 m!1260905))

(assert (=> b!1376819 m!1260905))

(declare-fun m!1260907 () Bool)

(assert (=> b!1376819 m!1260907))

(declare-fun m!1260909 () Bool)

(assert (=> b!1376821 m!1260909))

(declare-fun m!1260911 () Bool)

(assert (=> b!1376821 m!1260911))

(declare-fun m!1260913 () Bool)

(assert (=> b!1376821 m!1260913))

(declare-fun m!1260915 () Bool)

(assert (=> b!1376818 m!1260915))

(assert (=> b!1376818 m!1260915))

(declare-fun m!1260917 () Bool)

(assert (=> b!1376818 m!1260917))

(assert (=> b!1376820 m!1260911))

(declare-fun m!1260919 () Bool)

(assert (=> b!1376820 m!1260919))

(assert (=> b!1376820 m!1260919))

(declare-fun m!1260921 () Bool)

(assert (=> b!1376820 m!1260921))

(declare-fun m!1260923 () Bool)

(assert (=> start!116838 m!1260923))

(declare-fun m!1260925 () Bool)

(assert (=> b!1376823 m!1260925))

(declare-fun m!1260927 () Bool)

(assert (=> b!1376823 m!1260927))

(declare-fun m!1260929 () Bool)

(assert (=> b!1376824 m!1260929))

(push 1)

(assert (not b!1376818))

(assert (not b!1376819))

(assert (not b!1376824))

(assert (not start!116838))

(assert (not b!1376823))

(assert (not b!1376820))

(assert (not b!1376821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

