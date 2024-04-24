; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134712 () Bool)

(assert start!134712)

(declare-fun b!1570890 () Bool)

(declare-fun res!1073003 () Bool)

(declare-fun e!875870 () Bool)

(assert (=> b!1570890 (=> (not res!1073003) (not e!875870))))

(declare-datatypes ((List!36739 0))(
  ( (Nil!36736) (Cons!36735 (h!38200 (_ BitVec 64)) (t!51639 List!36739)) )
))
(declare-fun acc!619 () List!36739)

(declare-fun noDuplicate!2702 (List!36739) Bool)

(assert (=> b!1570890 (= res!1073003 (noDuplicate!2702 acc!619))))

(declare-fun b!1570891 () Bool)

(declare-fun res!1073005 () Bool)

(assert (=> b!1570891 (=> (not res!1073005) (not e!875870))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104912 0))(
  ( (array!104913 (arr!50629 (Array (_ BitVec 32) (_ BitVec 64))) (size!51180 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104912)

(assert (=> b!1570891 (= res!1073005 (bvslt from!2856 (size!51180 a!3481)))))

(declare-fun b!1570892 () Bool)

(declare-fun e!875872 () Bool)

(assert (=> b!1570892 (= e!875870 e!875872)))

(declare-fun res!1073002 () Bool)

(assert (=> b!1570892 (=> (not res!1073002) (not e!875872))))

(declare-fun e!875873 () Bool)

(assert (=> b!1570892 (= res!1073002 e!875873)))

(declare-fun res!1073000 () Bool)

(assert (=> b!1570892 (=> res!1073000 e!875873)))

(declare-fun lt!674094 () Bool)

(assert (=> b!1570892 (= res!1073000 lt!674094)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570892 (= lt!674094 (not (validKeyInArray!0 (select (arr!50629 a!3481) from!2856))))))

(declare-fun b!1570893 () Bool)

(assert (=> b!1570893 (= e!875872 (and (not lt!674094) (bvsge (bvsub (size!51180 a!3481) (bvadd #b00000000000000000000000000000001 from!2856)) (bvsub (size!51180 a!3481) from!2856))))))

(declare-fun res!1073006 () Bool)

(assert (=> start!134712 (=> (not res!1073006) (not e!875870))))

(assert (=> start!134712 (= res!1073006 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51180 a!3481)) (bvslt (size!51180 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134712 e!875870))

(assert (=> start!134712 true))

(declare-fun array_inv!39584 (array!104912) Bool)

(assert (=> start!134712 (array_inv!39584 a!3481)))

(declare-fun b!1570894 () Bool)

(declare-fun res!1073004 () Bool)

(assert (=> b!1570894 (=> (not res!1073004) (not e!875870))))

(declare-fun contains!10454 (List!36739 (_ BitVec 64)) Bool)

(assert (=> b!1570894 (= res!1073004 (not (contains!10454 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570895 () Bool)

(declare-fun res!1073001 () Bool)

(assert (=> b!1570895 (=> (not res!1073001) (not e!875870))))

(assert (=> b!1570895 (= res!1073001 (not (contains!10454 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570896 () Bool)

(assert (=> b!1570896 (= e!875873 (not (contains!10454 acc!619 (select (arr!50629 a!3481) from!2856))))))

(assert (= (and start!134712 res!1073006) b!1570890))

(assert (= (and b!1570890 res!1073003) b!1570894))

(assert (= (and b!1570894 res!1073004) b!1570895))

(assert (= (and b!1570895 res!1073001) b!1570891))

(assert (= (and b!1570891 res!1073005) b!1570892))

(assert (= (and b!1570892 (not res!1073000)) b!1570896))

(assert (= (and b!1570892 res!1073002) b!1570893))

(declare-fun m!1445373 () Bool)

(assert (=> b!1570895 m!1445373))

(declare-fun m!1445375 () Bool)

(assert (=> b!1570890 m!1445375))

(declare-fun m!1445377 () Bool)

(assert (=> start!134712 m!1445377))

(declare-fun m!1445379 () Bool)

(assert (=> b!1570896 m!1445379))

(assert (=> b!1570896 m!1445379))

(declare-fun m!1445381 () Bool)

(assert (=> b!1570896 m!1445381))

(assert (=> b!1570892 m!1445379))

(assert (=> b!1570892 m!1445379))

(declare-fun m!1445383 () Bool)

(assert (=> b!1570892 m!1445383))

(declare-fun m!1445385 () Bool)

(assert (=> b!1570894 m!1445385))

(check-sat (not b!1570892) (not b!1570894) (not start!134712) (not b!1570890) (not b!1570895) (not b!1570896))
(check-sat)
