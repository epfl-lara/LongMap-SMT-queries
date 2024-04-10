; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134300 () Bool)

(assert start!134300)

(declare-fun b!1568454 () Bool)

(declare-fun res!1072145 () Bool)

(declare-fun e!874361 () Bool)

(assert (=> b!1568454 (=> (not res!1072145) (not e!874361))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104790 0))(
  ( (array!104791 (arr!50575 (Array (_ BitVec 32) (_ BitVec 64))) (size!51125 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104790)

(assert (=> b!1568454 (= res!1072145 (bvslt from!2856 (size!51125 a!3481)))))

(declare-fun res!1072143 () Bool)

(assert (=> start!134300 (=> (not res!1072143) (not e!874361))))

(assert (=> start!134300 (= res!1072143 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51125 a!3481)) (bvslt (size!51125 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134300 e!874361))

(assert (=> start!134300 true))

(declare-fun array_inv!39302 (array!104790) Bool)

(assert (=> start!134300 (array_inv!39302 a!3481)))

(declare-datatypes ((List!36707 0))(
  ( (Nil!36704) (Cons!36703 (h!38150 (_ BitVec 64)) (t!51615 List!36707)) )
))
(declare-fun acc!619 () List!36707)

(declare-fun e!874364 () Bool)

(declare-fun b!1568455 () Bool)

(declare-fun contains!10409 (List!36707 (_ BitVec 64)) Bool)

(assert (=> b!1568455 (= e!874364 (not (contains!10409 acc!619 (select (arr!50575 a!3481) from!2856))))))

(declare-fun b!1568456 () Bool)

(declare-fun res!1072141 () Bool)

(assert (=> b!1568456 (=> (not res!1072141) (not e!874361))))

(assert (=> b!1568456 (= res!1072141 (not (contains!10409 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568457 () Bool)

(declare-fun e!874362 () Bool)

(assert (=> b!1568457 (= e!874361 e!874362)))

(declare-fun res!1072140 () Bool)

(assert (=> b!1568457 (=> (not res!1072140) (not e!874362))))

(assert (=> b!1568457 (= res!1072140 e!874364)))

(declare-fun res!1072146 () Bool)

(assert (=> b!1568457 (=> res!1072146 e!874364)))

(declare-fun lt!673186 () Bool)

(assert (=> b!1568457 (= res!1072146 lt!673186)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568457 (= lt!673186 (not (validKeyInArray!0 (select (arr!50575 a!3481) from!2856))))))

(declare-fun b!1568458 () Bool)

(declare-fun res!1072142 () Bool)

(assert (=> b!1568458 (=> (not res!1072142) (not e!874361))))

(assert (=> b!1568458 (= res!1072142 (not (contains!10409 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568459 () Bool)

(declare-fun res!1072144 () Bool)

(assert (=> b!1568459 (=> (not res!1072144) (not e!874361))))

(declare-fun noDuplicate!2681 (List!36707) Bool)

(assert (=> b!1568459 (= res!1072144 (noDuplicate!2681 acc!619))))

(declare-fun b!1568460 () Bool)

(assert (=> b!1568460 (= e!874362 (and (not lt!673186) (bvsge (bvsub (size!51125 a!3481) (bvadd #b00000000000000000000000000000001 from!2856)) (bvsub (size!51125 a!3481) from!2856))))))

(assert (= (and start!134300 res!1072143) b!1568459))

(assert (= (and b!1568459 res!1072144) b!1568458))

(assert (= (and b!1568458 res!1072142) b!1568456))

(assert (= (and b!1568456 res!1072141) b!1568454))

(assert (= (and b!1568454 res!1072145) b!1568457))

(assert (= (and b!1568457 (not res!1072146)) b!1568455))

(assert (= (and b!1568457 res!1072140) b!1568460))

(declare-fun m!1443115 () Bool)

(assert (=> b!1568455 m!1443115))

(assert (=> b!1568455 m!1443115))

(declare-fun m!1443117 () Bool)

(assert (=> b!1568455 m!1443117))

(declare-fun m!1443119 () Bool)

(assert (=> start!134300 m!1443119))

(assert (=> b!1568457 m!1443115))

(assert (=> b!1568457 m!1443115))

(declare-fun m!1443121 () Bool)

(assert (=> b!1568457 m!1443121))

(declare-fun m!1443123 () Bool)

(assert (=> b!1568458 m!1443123))

(declare-fun m!1443125 () Bool)

(assert (=> b!1568459 m!1443125))

(declare-fun m!1443127 () Bool)

(assert (=> b!1568456 m!1443127))

(push 1)

(assert (not b!1568455))

(assert (not b!1568459))

(assert (not b!1568456))

(assert (not b!1568457))

(assert (not b!1568458))

(assert (not start!134300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

