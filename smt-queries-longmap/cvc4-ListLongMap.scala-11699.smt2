; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136818 () Bool)

(assert start!136818)

(declare-fun res!1078763 () Bool)

(declare-fun e!880643 () Bool)

(assert (=> start!136818 (=> (not res!1078763) (not e!880643))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105807 0))(
  ( (array!105808 (arr!51012 (Array (_ BitVec 32) (_ BitVec 64))) (size!51562 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105807)

(assert (=> start!136818 (= res!1078763 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51562 a!3559)) (bvslt (size!51562 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136818 e!880643))

(assert (=> start!136818 true))

(declare-fun array_inv!39739 (array!105807) Bool)

(assert (=> start!136818 (array_inv!39739 a!3559)))

(declare-fun b!1578823 () Bool)

(declare-fun res!1078764 () Bool)

(assert (=> b!1578823 (=> (not res!1078764) (not e!880643))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578823 (= res!1078764 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578824 () Bool)

(declare-fun res!1078762 () Bool)

(assert (=> b!1578824 (=> (not res!1078762) (not e!880643))))

(assert (=> b!1578824 (= res!1078762 (bvsle from!2937 #b00000000000000000000000000000000))))

(declare-fun b!1578825 () Bool)

(assert (=> b!1578825 (= e!880643 (not (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))))

(assert (= (and start!136818 res!1078763) b!1578823))

(assert (= (and b!1578823 res!1078764) b!1578824))

(assert (= (and b!1578824 res!1078762) b!1578825))

(declare-fun m!1450837 () Bool)

(assert (=> start!136818 m!1450837))

(declare-fun m!1450839 () Bool)

(assert (=> b!1578823 m!1450839))

(declare-fun m!1450841 () Bool)

(assert (=> b!1578825 m!1450841))

(push 1)

(assert (not b!1578823))

(assert (not b!1578825))

(assert (not start!136818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

