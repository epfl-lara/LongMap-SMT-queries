; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134282 () Bool)

(assert start!134282)

(declare-fun res!1071999 () Bool)

(declare-fun e!874285 () Bool)

(assert (=> start!134282 (=> (not res!1071999) (not e!874285))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104772 0))(
  ( (array!104773 (arr!50566 (Array (_ BitVec 32) (_ BitVec 64))) (size!51116 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104772)

(assert (=> start!134282 (= res!1071999 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51116 a!3481)) (bvslt (size!51116 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134282 e!874285))

(assert (=> start!134282 true))

(declare-fun array_inv!39293 (array!104772) Bool)

(assert (=> start!134282 (array_inv!39293 a!3481)))

(declare-fun b!1568311 () Bool)

(declare-fun res!1071997 () Bool)

(assert (=> b!1568311 (=> (not res!1071997) (not e!874285))))

(declare-datatypes ((List!36698 0))(
  ( (Nil!36695) (Cons!36694 (h!38141 (_ BitVec 64)) (t!51606 List!36698)) )
))
(declare-fun acc!619 () List!36698)

(declare-fun noDuplicate!2672 (List!36698) Bool)

(assert (=> b!1568311 (= res!1071997 (noDuplicate!2672 acc!619))))

(declare-fun b!1568312 () Bool)

(declare-fun res!1071998 () Bool)

(assert (=> b!1568312 (=> (not res!1071998) (not e!874285))))

(declare-fun contains!10400 (List!36698 (_ BitVec 64)) Bool)

(assert (=> b!1568312 (= res!1071998 (not (contains!10400 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568313 () Bool)

(assert (=> b!1568313 (= e!874285 false)))

(declare-fun lt!673159 () Bool)

(assert (=> b!1568313 (= lt!673159 (contains!10400 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134282 res!1071999) b!1568311))

(assert (= (and b!1568311 res!1071997) b!1568312))

(assert (= (and b!1568312 res!1071998) b!1568313))

(declare-fun m!1443007 () Bool)

(assert (=> start!134282 m!1443007))

(declare-fun m!1443009 () Bool)

(assert (=> b!1568311 m!1443009))

(declare-fun m!1443011 () Bool)

(assert (=> b!1568312 m!1443011))

(declare-fun m!1443013 () Bool)

(assert (=> b!1568313 m!1443013))

(push 1)

(assert (not b!1568311))

(assert (not start!134282))

(assert (not b!1568313))

(assert (not b!1568312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

