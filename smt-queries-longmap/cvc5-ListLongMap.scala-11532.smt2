; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134230 () Bool)

(assert start!134230)

(declare-fun res!1071860 () Bool)

(declare-fun e!874081 () Bool)

(assert (=> start!134230 (=> (not res!1071860) (not e!874081))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104698 0))(
  ( (array!104699 (arr!50530 (Array (_ BitVec 32) (_ BitVec 64))) (size!51082 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104698)

(assert (=> start!134230 (= res!1071860 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51082 a!3481)) (bvslt (size!51082 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134230 e!874081))

(assert (=> start!134230 true))

(declare-fun array_inv!39466 (array!104698) Bool)

(assert (=> start!134230 (array_inv!39466 a!3481)))

(declare-fun b!1567989 () Bool)

(declare-fun res!1071859 () Bool)

(assert (=> b!1567989 (=> (not res!1071859) (not e!874081))))

(declare-datatypes ((List!36738 0))(
  ( (Nil!36735) (Cons!36734 (h!38182 (_ BitVec 64)) (t!51638 List!36738)) )
))
(declare-fun acc!619 () List!36738)

(declare-fun noDuplicate!2695 (List!36738) Bool)

(assert (=> b!1567989 (= res!1071859 (noDuplicate!2695 acc!619))))

(declare-fun b!1567990 () Bool)

(declare-fun res!1071861 () Bool)

(assert (=> b!1567990 (=> (not res!1071861) (not e!874081))))

(declare-fun contains!10354 (List!36738 (_ BitVec 64)) Bool)

(assert (=> b!1567990 (= res!1071861 (not (contains!10354 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567991 () Bool)

(assert (=> b!1567991 (= e!874081 false)))

(declare-fun lt!672870 () Bool)

(assert (=> b!1567991 (= lt!672870 (contains!10354 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134230 res!1071860) b!1567989))

(assert (= (and b!1567989 res!1071859) b!1567990))

(assert (= (and b!1567990 res!1071861) b!1567991))

(declare-fun m!1442107 () Bool)

(assert (=> start!134230 m!1442107))

(declare-fun m!1442109 () Bool)

(assert (=> b!1567989 m!1442109))

(declare-fun m!1442111 () Bool)

(assert (=> b!1567990 m!1442111))

(declare-fun m!1442113 () Bool)

(assert (=> b!1567991 m!1442113))

(push 1)

(assert (not b!1567991))

(assert (not b!1567989))

(assert (not b!1567990))

(assert (not start!134230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

