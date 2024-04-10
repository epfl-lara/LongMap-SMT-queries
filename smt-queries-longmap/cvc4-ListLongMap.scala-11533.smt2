; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134286 () Bool)

(assert start!134286)

(declare-fun res!1072015 () Bool)

(declare-fun e!874297 () Bool)

(assert (=> start!134286 (=> (not res!1072015) (not e!874297))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104776 0))(
  ( (array!104777 (arr!50568 (Array (_ BitVec 32) (_ BitVec 64))) (size!51118 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104776)

(assert (=> start!134286 (= res!1072015 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51118 a!3481)) (bvslt (size!51118 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134286 e!874297))

(assert (=> start!134286 true))

(declare-fun array_inv!39295 (array!104776) Bool)

(assert (=> start!134286 (array_inv!39295 a!3481)))

(declare-fun b!1568329 () Bool)

(declare-fun res!1072016 () Bool)

(assert (=> b!1568329 (=> (not res!1072016) (not e!874297))))

(declare-datatypes ((List!36700 0))(
  ( (Nil!36697) (Cons!36696 (h!38143 (_ BitVec 64)) (t!51608 List!36700)) )
))
(declare-fun acc!619 () List!36700)

(declare-fun noDuplicate!2674 (List!36700) Bool)

(assert (=> b!1568329 (= res!1072016 (noDuplicate!2674 acc!619))))

(declare-fun b!1568330 () Bool)

(declare-fun res!1072017 () Bool)

(assert (=> b!1568330 (=> (not res!1072017) (not e!874297))))

(declare-fun contains!10402 (List!36700 (_ BitVec 64)) Bool)

(assert (=> b!1568330 (= res!1072017 (not (contains!10402 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568331 () Bool)

(assert (=> b!1568331 (= e!874297 false)))

(declare-fun lt!673165 () Bool)

(assert (=> b!1568331 (= lt!673165 (contains!10402 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134286 res!1072015) b!1568329))

(assert (= (and b!1568329 res!1072016) b!1568330))

(assert (= (and b!1568330 res!1072017) b!1568331))

(declare-fun m!1443023 () Bool)

(assert (=> start!134286 m!1443023))

(declare-fun m!1443025 () Bool)

(assert (=> b!1568329 m!1443025))

(declare-fun m!1443027 () Bool)

(assert (=> b!1568330 m!1443027))

(declare-fun m!1443029 () Bool)

(assert (=> b!1568331 m!1443029))

(push 1)

(assert (not start!134286))

(assert (not b!1568331))

(assert (not b!1568330))

(assert (not b!1568329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

