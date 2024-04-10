; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134724 () Bool)

(assert start!134724)

(declare-fun res!1073737 () Bool)

(declare-fun e!876298 () Bool)

(assert (=> start!134724 (=> (not res!1073737) (not e!876298))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134724 (= res!1073737 (validMask!0 mask!889))))

(assert (=> start!134724 e!876298))

(assert (=> start!134724 true))

(declare-datatypes ((array!104878 0))(
  ( (array!104879 (arr!50613 (Array (_ BitVec 32) (_ BitVec 64))) (size!51163 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104878)

(declare-fun array_inv!39340 (array!104878) Bool)

(assert (=> start!134724 (array_inv!39340 _keys!600)))

(declare-fun b!1571626 () Bool)

(declare-fun res!1073739 () Bool)

(assert (=> b!1571626 (=> (not res!1073739) (not e!876298))))

(assert (=> b!1571626 (= res!1073739 (= (size!51163 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571627 () Bool)

(declare-fun res!1073738 () Bool)

(assert (=> b!1571627 (=> (not res!1073738) (not e!876298))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571627 (= res!1073738 (validKeyInArray!0 k!754))))

(declare-fun b!1571628 () Bool)

(assert (=> b!1571628 (= e!876298 (and (bvsge mask!889 #b00000000000000000000000000000000) (bvsgt mask!889 #b00111111111111111111111111111111)))))

(assert (= (and start!134724 res!1073737) b!1571626))

(assert (= (and b!1571626 res!1073739) b!1571627))

(assert (= (and b!1571627 res!1073738) b!1571628))

(declare-fun m!1445521 () Bool)

(assert (=> start!134724 m!1445521))

(declare-fun m!1445523 () Bool)

(assert (=> start!134724 m!1445523))

(declare-fun m!1445525 () Bool)

(assert (=> b!1571627 m!1445525))

(push 1)

(assert (not b!1571627))

(assert (not start!134724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164591 () Bool)

(assert (=> d!164591 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

