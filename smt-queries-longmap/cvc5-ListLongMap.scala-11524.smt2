; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134596 () Bool)

(assert start!134596)

(declare-fun b!1570165 () Bool)

(declare-fun res!1072277 () Bool)

(declare-fun e!875424 () Bool)

(assert (=> b!1570165 (=> (not res!1072277) (not e!875424))))

(declare-datatypes ((List!36705 0))(
  ( (Nil!36702) (Cons!36701 (h!38166 (_ BitVec 64)) (t!51605 List!36705)) )
))
(declare-fun acc!619 () List!36705)

(declare-fun contains!10420 (List!36705 (_ BitVec 64)) Bool)

(assert (=> b!1570165 (= res!1072277 (not (contains!10420 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570166 () Bool)

(declare-fun res!1072276 () Bool)

(assert (=> b!1570166 (=> (not res!1072276) (not e!875424))))

(declare-fun noDuplicate!2668 (List!36705) Bool)

(assert (=> b!1570166 (= res!1072276 (noDuplicate!2668 acc!619))))

(declare-fun b!1570167 () Bool)

(declare-fun res!1072275 () Bool)

(assert (=> b!1570167 (=> (not res!1072275) (not e!875424))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104838 0))(
  ( (array!104839 (arr!50595 (Array (_ BitVec 32) (_ BitVec 64))) (size!51146 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104838)

(assert (=> b!1570167 (= res!1072275 (bvslt from!2856 (size!51146 a!3481)))))

(declare-fun b!1570168 () Bool)

(assert (=> b!1570168 (= e!875424 false)))

(declare-fun lt!673947 () Bool)

(declare-fun e!875426 () Bool)

(assert (=> b!1570168 (= lt!673947 e!875426)))

(declare-fun res!1072278 () Bool)

(assert (=> b!1570168 (=> res!1072278 e!875426)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570168 (= res!1072278 (not (validKeyInArray!0 (select (arr!50595 a!3481) from!2856))))))

(declare-fun b!1570169 () Bool)

(assert (=> b!1570169 (= e!875426 (not (contains!10420 acc!619 (select (arr!50595 a!3481) from!2856))))))

(declare-fun res!1072279 () Bool)

(assert (=> start!134596 (=> (not res!1072279) (not e!875424))))

(assert (=> start!134596 (= res!1072279 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51146 a!3481)) (bvslt (size!51146 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134596 e!875424))

(assert (=> start!134596 true))

(declare-fun array_inv!39550 (array!104838) Bool)

(assert (=> start!134596 (array_inv!39550 a!3481)))

(declare-fun b!1570170 () Bool)

(declare-fun res!1072280 () Bool)

(assert (=> b!1570170 (=> (not res!1072280) (not e!875424))))

(assert (=> b!1570170 (= res!1072280 (not (contains!10420 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134596 res!1072279) b!1570166))

(assert (= (and b!1570166 res!1072276) b!1570165))

(assert (= (and b!1570165 res!1072277) b!1570170))

(assert (= (and b!1570170 res!1072280) b!1570167))

(assert (= (and b!1570167 res!1072275) b!1570168))

(assert (= (and b!1570168 (not res!1072278)) b!1570169))

(declare-fun m!1444765 () Bool)

(assert (=> b!1570165 m!1444765))

(declare-fun m!1444767 () Bool)

(assert (=> start!134596 m!1444767))

(declare-fun m!1444769 () Bool)

(assert (=> b!1570166 m!1444769))

(declare-fun m!1444771 () Bool)

(assert (=> b!1570169 m!1444771))

(assert (=> b!1570169 m!1444771))

(declare-fun m!1444773 () Bool)

(assert (=> b!1570169 m!1444773))

(declare-fun m!1444775 () Bool)

(assert (=> b!1570170 m!1444775))

(assert (=> b!1570168 m!1444771))

(assert (=> b!1570168 m!1444771))

(declare-fun m!1444777 () Bool)

(assert (=> b!1570168 m!1444777))

(push 1)

(assert (not b!1570165))

(assert (not b!1570168))

(assert (not b!1570169))

(assert (not b!1570166))

(assert (not start!134596))

(assert (not b!1570170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

