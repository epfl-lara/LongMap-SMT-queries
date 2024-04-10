; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134306 () Bool)

(assert start!134306)

(declare-datatypes ((array!104796 0))(
  ( (array!104797 (arr!50578 (Array (_ BitVec 32) (_ BitVec 64))) (size!51128 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104796)

(declare-fun b!1568517 () Bool)

(declare-fun e!874398 () Bool)

(declare-fun lt!673195 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(assert (=> b!1568517 (= e!874398 (and (not lt!673195) (bvsge (bvsub (size!51128 a!3481) (bvadd #b00000000000000000000000000000001 from!2856)) (bvsub (size!51128 a!3481) from!2856))))))

(declare-fun b!1568518 () Bool)

(declare-fun res!1072205 () Bool)

(declare-fun e!874400 () Bool)

(assert (=> b!1568518 (=> (not res!1072205) (not e!874400))))

(declare-datatypes ((List!36710 0))(
  ( (Nil!36707) (Cons!36706 (h!38153 (_ BitVec 64)) (t!51618 List!36710)) )
))
(declare-fun acc!619 () List!36710)

(declare-fun noDuplicate!2684 (List!36710) Bool)

(assert (=> b!1568518 (= res!1072205 (noDuplicate!2684 acc!619))))

(declare-fun b!1568519 () Bool)

(assert (=> b!1568519 (= e!874400 e!874398)))

(declare-fun res!1072208 () Bool)

(assert (=> b!1568519 (=> (not res!1072208) (not e!874398))))

(declare-fun e!874397 () Bool)

(assert (=> b!1568519 (= res!1072208 e!874397)))

(declare-fun res!1072209 () Bool)

(assert (=> b!1568519 (=> res!1072209 e!874397)))

(assert (=> b!1568519 (= res!1072209 (not lt!673195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568519 (= lt!673195 (validKeyInArray!0 (select (arr!50578 a!3481) from!2856)))))

(declare-fun b!1568520 () Bool)

(declare-fun contains!10412 (List!36710 (_ BitVec 64)) Bool)

(assert (=> b!1568520 (= e!874397 (not (contains!10412 acc!619 (select (arr!50578 a!3481) from!2856))))))

(declare-fun b!1568521 () Bool)

(declare-fun res!1072204 () Bool)

(assert (=> b!1568521 (=> (not res!1072204) (not e!874400))))

(assert (=> b!1568521 (= res!1072204 (not (contains!10412 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568522 () Bool)

(declare-fun res!1072207 () Bool)

(assert (=> b!1568522 (=> (not res!1072207) (not e!874400))))

(assert (=> b!1568522 (= res!1072207 (not (contains!10412 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1072206 () Bool)

(assert (=> start!134306 (=> (not res!1072206) (not e!874400))))

(assert (=> start!134306 (= res!1072206 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51128 a!3481)) (bvslt (size!51128 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134306 e!874400))

(assert (=> start!134306 true))

(declare-fun array_inv!39305 (array!104796) Bool)

(assert (=> start!134306 (array_inv!39305 a!3481)))

(declare-fun b!1568523 () Bool)

(declare-fun res!1072203 () Bool)

(assert (=> b!1568523 (=> (not res!1072203) (not e!874400))))

(assert (=> b!1568523 (= res!1072203 (bvslt from!2856 (size!51128 a!3481)))))

(assert (= (and start!134306 res!1072206) b!1568518))

(assert (= (and b!1568518 res!1072205) b!1568522))

(assert (= (and b!1568522 res!1072207) b!1568521))

(assert (= (and b!1568521 res!1072204) b!1568523))

(assert (= (and b!1568523 res!1072203) b!1568519))

(assert (= (and b!1568519 (not res!1072209)) b!1568520))

(assert (= (and b!1568519 res!1072208) b!1568517))

(declare-fun m!1443157 () Bool)

(assert (=> b!1568518 m!1443157))

(declare-fun m!1443159 () Bool)

(assert (=> b!1568521 m!1443159))

(declare-fun m!1443161 () Bool)

(assert (=> b!1568520 m!1443161))

(assert (=> b!1568520 m!1443161))

(declare-fun m!1443163 () Bool)

(assert (=> b!1568520 m!1443163))

(declare-fun m!1443165 () Bool)

(assert (=> b!1568522 m!1443165))

(declare-fun m!1443167 () Bool)

(assert (=> start!134306 m!1443167))

(assert (=> b!1568519 m!1443161))

(assert (=> b!1568519 m!1443161))

(declare-fun m!1443169 () Bool)

(assert (=> b!1568519 m!1443169))

(push 1)

(assert (not b!1568520))

(assert (not b!1568519))

(assert (not b!1568518))

(assert (not start!134306))

(assert (not b!1568521))

(assert (not b!1568522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

