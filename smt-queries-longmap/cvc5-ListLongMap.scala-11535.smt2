; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134710 () Bool)

(assert start!134710)

(declare-fun b!1570870 () Bool)

(declare-fun res!1072983 () Bool)

(declare-fun e!875860 () Bool)

(assert (=> b!1570870 (=> (not res!1072983) (not e!875860))))

(declare-datatypes ((List!36738 0))(
  ( (Nil!36735) (Cons!36734 (h!38199 (_ BitVec 64)) (t!51638 List!36738)) )
))
(declare-fun acc!619 () List!36738)

(declare-fun noDuplicate!2701 (List!36738) Bool)

(assert (=> b!1570870 (= res!1072983 (noDuplicate!2701 acc!619))))

(declare-fun b!1570871 () Bool)

(assert (=> b!1570871 (= e!875860 false)))

(declare-fun lt!674091 () Bool)

(declare-fun e!875861 () Bool)

(assert (=> b!1570871 (= lt!674091 e!875861)))

(declare-fun res!1072984 () Bool)

(assert (=> b!1570871 (=> res!1072984 e!875861)))

(declare-datatypes ((array!104910 0))(
  ( (array!104911 (arr!50628 (Array (_ BitVec 32) (_ BitVec 64))) (size!51179 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104910)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570871 (= res!1072984 (not (validKeyInArray!0 (select (arr!50628 a!3481) from!2856))))))

(declare-fun b!1570872 () Bool)

(declare-fun contains!10453 (List!36738 (_ BitVec 64)) Bool)

(assert (=> b!1570872 (= e!875861 (not (contains!10453 acc!619 (select (arr!50628 a!3481) from!2856))))))

(declare-fun b!1570873 () Bool)

(declare-fun res!1072982 () Bool)

(assert (=> b!1570873 (=> (not res!1072982) (not e!875860))))

(assert (=> b!1570873 (= res!1072982 (not (contains!10453 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570874 () Bool)

(declare-fun res!1072981 () Bool)

(assert (=> b!1570874 (=> (not res!1072981) (not e!875860))))

(assert (=> b!1570874 (= res!1072981 (not (contains!10453 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1072985 () Bool)

(assert (=> start!134710 (=> (not res!1072985) (not e!875860))))

(assert (=> start!134710 (= res!1072985 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51179 a!3481)) (bvslt (size!51179 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134710 e!875860))

(assert (=> start!134710 true))

(declare-fun array_inv!39583 (array!104910) Bool)

(assert (=> start!134710 (array_inv!39583 a!3481)))

(declare-fun b!1570875 () Bool)

(declare-fun res!1072980 () Bool)

(assert (=> b!1570875 (=> (not res!1072980) (not e!875860))))

(assert (=> b!1570875 (= res!1072980 (bvslt from!2856 (size!51179 a!3481)))))

(assert (= (and start!134710 res!1072985) b!1570870))

(assert (= (and b!1570870 res!1072983) b!1570873))

(assert (= (and b!1570873 res!1072982) b!1570874))

(assert (= (and b!1570874 res!1072981) b!1570875))

(assert (= (and b!1570875 res!1072980) b!1570871))

(assert (= (and b!1570871 (not res!1072984)) b!1570872))

(declare-fun m!1445359 () Bool)

(assert (=> b!1570872 m!1445359))

(assert (=> b!1570872 m!1445359))

(declare-fun m!1445361 () Bool)

(assert (=> b!1570872 m!1445361))

(declare-fun m!1445363 () Bool)

(assert (=> b!1570874 m!1445363))

(declare-fun m!1445365 () Bool)

(assert (=> b!1570870 m!1445365))

(assert (=> b!1570871 m!1445359))

(assert (=> b!1570871 m!1445359))

(declare-fun m!1445367 () Bool)

(assert (=> b!1570871 m!1445367))

(declare-fun m!1445369 () Bool)

(assert (=> b!1570873 m!1445369))

(declare-fun m!1445371 () Bool)

(assert (=> start!134710 m!1445371))

(push 1)

(assert (not b!1570873))

(assert (not start!134710))

(assert (not b!1570872))

(assert (not b!1570870))

(assert (not b!1570874))

(assert (not b!1570871))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

