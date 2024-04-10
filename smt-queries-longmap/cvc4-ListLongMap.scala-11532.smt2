; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134280 () Bool)

(assert start!134280)

(declare-fun res!1071988 () Bool)

(declare-fun e!874280 () Bool)

(assert (=> start!134280 (=> (not res!1071988) (not e!874280))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104770 0))(
  ( (array!104771 (arr!50565 (Array (_ BitVec 32) (_ BitVec 64))) (size!51115 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104770)

(assert (=> start!134280 (= res!1071988 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51115 a!3481)) (bvslt (size!51115 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134280 e!874280))

(assert (=> start!134280 true))

(declare-fun array_inv!39292 (array!104770) Bool)

(assert (=> start!134280 (array_inv!39292 a!3481)))

(declare-fun b!1568302 () Bool)

(declare-fun res!1071989 () Bool)

(assert (=> b!1568302 (=> (not res!1071989) (not e!874280))))

(declare-datatypes ((List!36697 0))(
  ( (Nil!36694) (Cons!36693 (h!38140 (_ BitVec 64)) (t!51605 List!36697)) )
))
(declare-fun acc!619 () List!36697)

(declare-fun noDuplicate!2671 (List!36697) Bool)

(assert (=> b!1568302 (= res!1071989 (noDuplicate!2671 acc!619))))

(declare-fun b!1568303 () Bool)

(declare-fun res!1071990 () Bool)

(assert (=> b!1568303 (=> (not res!1071990) (not e!874280))))

(declare-fun contains!10399 (List!36697 (_ BitVec 64)) Bool)

(assert (=> b!1568303 (= res!1071990 (not (contains!10399 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568304 () Bool)

(assert (=> b!1568304 (= e!874280 false)))

(declare-fun lt!673156 () Bool)

(assert (=> b!1568304 (= lt!673156 (contains!10399 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134280 res!1071988) b!1568302))

(assert (= (and b!1568302 res!1071989) b!1568303))

(assert (= (and b!1568303 res!1071990) b!1568304))

(declare-fun m!1442999 () Bool)

(assert (=> start!134280 m!1442999))

(declare-fun m!1443001 () Bool)

(assert (=> b!1568302 m!1443001))

(declare-fun m!1443003 () Bool)

(assert (=> b!1568303 m!1443003))

(declare-fun m!1443005 () Bool)

(assert (=> b!1568304 m!1443005))

(push 1)

(assert (not start!134280))

(assert (not b!1568304))

(assert (not b!1568303))

(assert (not b!1568302))

(check-sat)

(pop 1)

