; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134310 () Bool)

(assert start!134310)

(declare-fun res!1072246 () Bool)

(declare-fun e!874424 () Bool)

(assert (=> start!134310 (=> (not res!1072246) (not e!874424))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104800 0))(
  ( (array!104801 (arr!50580 (Array (_ BitVec 32) (_ BitVec 64))) (size!51130 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104800)

(assert (=> start!134310 (= res!1072246 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51130 a!3481)) (bvslt (size!51130 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134310 e!874424))

(assert (=> start!134310 true))

(declare-fun array_inv!39307 (array!104800) Bool)

(assert (=> start!134310 (array_inv!39307 a!3481)))

(declare-fun b!1568559 () Bool)

(declare-fun res!1072248 () Bool)

(assert (=> b!1568559 (=> (not res!1072248) (not e!874424))))

(declare-datatypes ((List!36712 0))(
  ( (Nil!36709) (Cons!36708 (h!38155 (_ BitVec 64)) (t!51620 List!36712)) )
))
(declare-fun acc!619 () List!36712)

(declare-fun contains!10414 (List!36712 (_ BitVec 64)) Bool)

(assert (=> b!1568559 (= res!1072248 (not (contains!10414 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!874423 () Bool)

(declare-fun b!1568560 () Bool)

(assert (=> b!1568560 (= e!874423 (not (contains!10414 acc!619 (select (arr!50580 a!3481) from!2856))))))

(declare-fun b!1568561 () Bool)

(declare-fun e!874421 () Bool)

(assert (=> b!1568561 (= e!874424 e!874421)))

(declare-fun res!1072250 () Bool)

(assert (=> b!1568561 (=> (not res!1072250) (not e!874421))))

(assert (=> b!1568561 (= res!1072250 e!874423)))

(declare-fun res!1072247 () Bool)

(assert (=> b!1568561 (=> res!1072247 e!874423)))

(declare-fun lt!673201 () Bool)

(assert (=> b!1568561 (= res!1072247 (not lt!673201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568561 (= lt!673201 (validKeyInArray!0 (select (arr!50580 a!3481) from!2856)))))

(declare-fun b!1568562 () Bool)

(declare-fun res!1072249 () Bool)

(assert (=> b!1568562 (=> (not res!1072249) (not e!874424))))

(assert (=> b!1568562 (= res!1072249 (bvslt from!2856 (size!51130 a!3481)))))

(declare-fun b!1568563 () Bool)

(declare-fun res!1072251 () Bool)

(assert (=> b!1568563 (=> (not res!1072251) (not e!874424))))

(declare-fun noDuplicate!2686 (List!36712) Bool)

(assert (=> b!1568563 (= res!1072251 (noDuplicate!2686 acc!619))))

(declare-fun b!1568564 () Bool)

(declare-fun res!1072245 () Bool)

(assert (=> b!1568564 (=> (not res!1072245) (not e!874424))))

(assert (=> b!1568564 (= res!1072245 (not (contains!10414 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568565 () Bool)

(assert (=> b!1568565 (= e!874421 (and (not lt!673201) (bvsge (bvsub (size!51130 a!3481) (bvadd #b00000000000000000000000000000001 from!2856)) (bvsub (size!51130 a!3481) from!2856))))))

(assert (= (and start!134310 res!1072246) b!1568563))

(assert (= (and b!1568563 res!1072251) b!1568564))

(assert (= (and b!1568564 res!1072245) b!1568559))

(assert (= (and b!1568559 res!1072248) b!1568562))

(assert (= (and b!1568562 res!1072249) b!1568561))

(assert (= (and b!1568561 (not res!1072247)) b!1568560))

(assert (= (and b!1568561 res!1072250) b!1568565))

(declare-fun m!1443185 () Bool)

(assert (=> b!1568564 m!1443185))

(declare-fun m!1443187 () Bool)

(assert (=> start!134310 m!1443187))

(declare-fun m!1443189 () Bool)

(assert (=> b!1568561 m!1443189))

(assert (=> b!1568561 m!1443189))

(declare-fun m!1443191 () Bool)

(assert (=> b!1568561 m!1443191))

(declare-fun m!1443193 () Bool)

(assert (=> b!1568563 m!1443193))

(assert (=> b!1568560 m!1443189))

(assert (=> b!1568560 m!1443189))

(declare-fun m!1443195 () Bool)

(assert (=> b!1568560 m!1443195))

(declare-fun m!1443197 () Bool)

(assert (=> b!1568559 m!1443197))

(push 1)

(assert (not b!1568561))

(assert (not b!1568559))

(assert (not start!134310))

(assert (not b!1568563))

(assert (not b!1568564))

(assert (not b!1568560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

