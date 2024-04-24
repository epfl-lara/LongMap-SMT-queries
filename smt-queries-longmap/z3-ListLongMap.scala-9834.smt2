; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116920 () Bool)

(assert start!116920)

(declare-fun b!1376639 () Bool)

(declare-fun res!918915 () Bool)

(declare-fun e!779971 () Bool)

(assert (=> b!1376639 (=> (not res!918915) (not e!779971))))

(declare-datatypes ((array!93475 0))(
  ( (array!93476 (arr!45136 (Array (_ BitVec 32) (_ BitVec 64))) (size!45687 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93475)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376639 (= res!918915 (validKeyInArray!0 (select (arr!45136 a!4032) to!206)))))

(declare-fun res!918910 () Bool)

(declare-fun e!779969 () Bool)

(assert (=> start!116920 (=> (not res!918910) (not e!779969))))

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> start!116920 (= res!918910 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45687 a!4032))))))

(assert (=> start!116920 e!779969))

(assert (=> start!116920 true))

(declare-fun array_inv!34417 (array!93475) Bool)

(assert (=> start!116920 (array_inv!34417 a!4032)))

(declare-fun b!1376640 () Bool)

(declare-fun res!918912 () Bool)

(assert (=> b!1376640 (=> (not res!918912) (not e!779969))))

(assert (=> b!1376640 (= res!918912 (and (bvslt (size!45687 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45687 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376641 () Bool)

(declare-fun res!918911 () Bool)

(assert (=> b!1376641 (=> (not res!918911) (not e!779969))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376641 (= res!918911 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376642 () Bool)

(assert (=> b!1376642 (= e!779969 e!779971)))

(declare-fun res!918914 () Bool)

(assert (=> b!1376642 (=> (not res!918914) (not e!779971))))

(declare-fun lt!604803 () (_ BitVec 32))

(declare-fun lt!604802 () (_ BitVec 32))

(assert (=> b!1376642 (= res!918914 (and (= lt!604803 lt!604802) (not (= to!206 (size!45687 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93475 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376642 (= lt!604802 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376642 (= lt!604803 (arrayCountValidKeys!0 (array!93476 (store (arr!45136 a!4032) i!1445 k0!2947) (size!45687 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376643 () Bool)

(assert (=> b!1376643 (= e!779971 (not true))))

(assert (=> b!1376643 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!604802))))

(declare-datatypes ((Unit!45476 0))(
  ( (Unit!45477) )
))
(declare-fun lt!604801 () Unit!45476)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93475 (_ BitVec 32) (_ BitVec 32)) Unit!45476)

(assert (=> b!1376643 (= lt!604801 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376644 () Bool)

(declare-fun res!918913 () Bool)

(assert (=> b!1376644 (=> (not res!918913) (not e!779969))))

(assert (=> b!1376644 (= res!918913 (validKeyInArray!0 (select (arr!45136 a!4032) i!1445)))))

(assert (= (and start!116920 res!918910) b!1376644))

(assert (= (and b!1376644 res!918913) b!1376641))

(assert (= (and b!1376641 res!918911) b!1376640))

(assert (= (and b!1376640 res!918912) b!1376642))

(assert (= (and b!1376642 res!918914) b!1376639))

(assert (= (and b!1376639 res!918915) b!1376643))

(declare-fun m!1260761 () Bool)

(assert (=> start!116920 m!1260761))

(declare-fun m!1260763 () Bool)

(assert (=> b!1376643 m!1260763))

(declare-fun m!1260765 () Bool)

(assert (=> b!1376643 m!1260765))

(declare-fun m!1260767 () Bool)

(assert (=> b!1376641 m!1260767))

(declare-fun m!1260769 () Bool)

(assert (=> b!1376642 m!1260769))

(declare-fun m!1260771 () Bool)

(assert (=> b!1376642 m!1260771))

(declare-fun m!1260773 () Bool)

(assert (=> b!1376642 m!1260773))

(declare-fun m!1260775 () Bool)

(assert (=> b!1376644 m!1260775))

(assert (=> b!1376644 m!1260775))

(declare-fun m!1260777 () Bool)

(assert (=> b!1376644 m!1260777))

(declare-fun m!1260779 () Bool)

(assert (=> b!1376639 m!1260779))

(assert (=> b!1376639 m!1260779))

(declare-fun m!1260781 () Bool)

(assert (=> b!1376639 m!1260781))

(check-sat (not b!1376643) (not b!1376642) (not b!1376641) (not b!1376639) (not start!116920) (not b!1376644))
(check-sat)
