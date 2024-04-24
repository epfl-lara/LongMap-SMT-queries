; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134668 () Bool)

(assert start!134668)

(declare-fun b!1570573 () Bool)

(declare-fun e!875697 () Bool)

(assert (=> b!1570573 (= e!875697 false)))

(declare-fun lt!674028 () Bool)

(declare-fun e!875698 () Bool)

(assert (=> b!1570573 (= lt!674028 e!875698)))

(declare-fun res!1072686 () Bool)

(assert (=> b!1570573 (=> res!1072686 e!875698)))

(declare-datatypes ((array!104868 0))(
  ( (array!104869 (arr!50607 (Array (_ BitVec 32) (_ BitVec 64))) (size!51158 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104868)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1570573 (= res!1072686 (not (validKeyInArray!0 (select (arr!50607 a!3481) from!2856))))))

(declare-datatypes ((List!36717 0))(
  ( (Nil!36714) (Cons!36713 (h!38178 (_ BitVec 64)) (t!51617 List!36717)) )
))
(declare-fun acc!619 () List!36717)

(declare-fun b!1570574 () Bool)

(declare-fun contains!10432 (List!36717 (_ BitVec 64)) Bool)

(assert (=> b!1570574 (= e!875698 (not (contains!10432 acc!619 (select (arr!50607 a!3481) from!2856))))))

(declare-fun b!1570575 () Bool)

(declare-fun res!1072685 () Bool)

(assert (=> b!1570575 (=> (not res!1072685) (not e!875697))))

(assert (=> b!1570575 (= res!1072685 (bvslt from!2856 (size!51158 a!3481)))))

(declare-fun b!1570576 () Bool)

(declare-fun res!1072684 () Bool)

(assert (=> b!1570576 (=> (not res!1072684) (not e!875697))))

(assert (=> b!1570576 (= res!1072684 (not (contains!10432 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1072683 () Bool)

(assert (=> start!134668 (=> (not res!1072683) (not e!875697))))

(assert (=> start!134668 (= res!1072683 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51158 a!3481)) (bvslt (size!51158 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134668 e!875697))

(assert (=> start!134668 true))

(declare-fun array_inv!39562 (array!104868) Bool)

(assert (=> start!134668 (array_inv!39562 a!3481)))

(declare-fun b!1570577 () Bool)

(declare-fun res!1072688 () Bool)

(assert (=> b!1570577 (=> (not res!1072688) (not e!875697))))

(assert (=> b!1570577 (= res!1072688 (not (contains!10432 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1570578 () Bool)

(declare-fun res!1072687 () Bool)

(assert (=> b!1570578 (=> (not res!1072687) (not e!875697))))

(declare-fun noDuplicate!2680 (List!36717) Bool)

(assert (=> b!1570578 (= res!1072687 (noDuplicate!2680 acc!619))))

(assert (= (and start!134668 res!1072683) b!1570578))

(assert (= (and b!1570578 res!1072687) b!1570576))

(assert (= (and b!1570576 res!1072684) b!1570577))

(assert (= (and b!1570577 res!1072688) b!1570575))

(assert (= (and b!1570575 res!1072685) b!1570573))

(assert (= (and b!1570573 (not res!1072686)) b!1570574))

(declare-fun m!1445119 () Bool)

(assert (=> b!1570573 m!1445119))

(assert (=> b!1570573 m!1445119))

(declare-fun m!1445121 () Bool)

(assert (=> b!1570573 m!1445121))

(declare-fun m!1445123 () Bool)

(assert (=> start!134668 m!1445123))

(declare-fun m!1445125 () Bool)

(assert (=> b!1570578 m!1445125))

(assert (=> b!1570574 m!1445119))

(assert (=> b!1570574 m!1445119))

(declare-fun m!1445127 () Bool)

(assert (=> b!1570574 m!1445127))

(declare-fun m!1445129 () Bool)

(assert (=> b!1570576 m!1445129))

(declare-fun m!1445131 () Bool)

(assert (=> b!1570577 m!1445131))

(push 1)

(assert (not b!1570577))

(assert (not b!1570578))

(assert (not b!1570576))

(assert (not b!1570573))

(assert (not start!134668))

(assert (not b!1570574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

