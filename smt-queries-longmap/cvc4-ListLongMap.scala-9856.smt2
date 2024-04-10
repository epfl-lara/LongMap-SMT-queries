; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116826 () Bool)

(assert start!116826)

(declare-fun b!1376701 () Bool)

(declare-fun res!919591 () Bool)

(declare-fun e!779839 () Bool)

(assert (=> b!1376701 (=> (not res!919591) (not e!779839))))

(declare-datatypes ((array!93495 0))(
  ( (array!93496 (arr!45151 (Array (_ BitVec 32) (_ BitVec 64))) (size!45701 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93495)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376701 (= res!919591 (not (validKeyInArray!0 (select (arr!45151 a!4032) to!206))))))

(declare-fun res!919589 () Bool)

(assert (=> start!116826 (=> (not res!919589) (not e!779839))))

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> start!116826 (= res!919589 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45701 a!4032))))))

(assert (=> start!116826 e!779839))

(assert (=> start!116826 true))

(declare-fun array_inv!34179 (array!93495) Bool)

(assert (=> start!116826 (array_inv!34179 a!4032)))

(declare-fun b!1376702 () Bool)

(declare-fun res!919587 () Bool)

(assert (=> b!1376702 (=> (not res!919587) (not e!779839))))

(assert (=> b!1376702 (= res!919587 (not (= to!206 (size!45701 a!4032))))))

(declare-fun b!1376703 () Bool)

(declare-fun res!919590 () Bool)

(assert (=> b!1376703 (=> (not res!919590) (not e!779839))))

(assert (=> b!1376703 (= res!919590 (validKeyInArray!0 (select (arr!45151 a!4032) i!1445)))))

(declare-fun b!1376704 () Bool)

(declare-fun res!919588 () Bool)

(assert (=> b!1376704 (=> (not res!919588) (not e!779839))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93495 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376704 (= res!919588 (= (arrayCountValidKeys!0 (array!93496 (store (arr!45151 a!4032) i!1445 k!2947) (size!45701 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376705 () Bool)

(declare-fun res!919585 () Bool)

(assert (=> b!1376705 (=> (not res!919585) (not e!779839))))

(assert (=> b!1376705 (= res!919585 (and (bvslt (size!45701 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45701 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376706 () Bool)

(declare-fun res!919586 () Bool)

(assert (=> b!1376706 (=> (not res!919586) (not e!779839))))

(assert (=> b!1376706 (= res!919586 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376707 () Bool)

(assert (=> b!1376707 (= e!779839 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45701 a!4032))))))

(assert (= (and start!116826 res!919589) b!1376703))

(assert (= (and b!1376703 res!919590) b!1376706))

(assert (= (and b!1376706 res!919586) b!1376705))

(assert (= (and b!1376705 res!919585) b!1376704))

(assert (= (and b!1376704 res!919588) b!1376702))

(assert (= (and b!1376702 res!919587) b!1376701))

(assert (= (and b!1376701 res!919591) b!1376707))

(declare-fun m!1260769 () Bool)

(assert (=> b!1376703 m!1260769))

(assert (=> b!1376703 m!1260769))

(declare-fun m!1260771 () Bool)

(assert (=> b!1376703 m!1260771))

(declare-fun m!1260773 () Bool)

(assert (=> start!116826 m!1260773))

(declare-fun m!1260775 () Bool)

(assert (=> b!1376704 m!1260775))

(declare-fun m!1260777 () Bool)

(assert (=> b!1376704 m!1260777))

(declare-fun m!1260779 () Bool)

(assert (=> b!1376704 m!1260779))

(declare-fun m!1260781 () Bool)

(assert (=> b!1376706 m!1260781))

(declare-fun m!1260783 () Bool)

(assert (=> b!1376701 m!1260783))

(assert (=> b!1376701 m!1260783))

(declare-fun m!1260785 () Bool)

(assert (=> b!1376701 m!1260785))

(push 1)

(assert (not b!1376704))

(assert (not b!1376706))

(assert (not start!116826))

(assert (not b!1376701))

(assert (not b!1376703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

