; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136776 () Bool)

(assert start!136776)

(declare-fun res!1078595 () Bool)

(declare-fun e!880528 () Bool)

(assert (=> start!136776 (=> (not res!1078595) (not e!880528))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105774 0))(
  ( (array!105775 (arr!50997 (Array (_ BitVec 32) (_ BitVec 64))) (size!51547 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105774)

(assert (=> start!136776 (= res!1078595 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51547 a!3559)) (bvslt (size!51547 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136776 e!880528))

(assert (=> start!136776 true))

(declare-fun array_inv!39724 (array!105774) Bool)

(assert (=> start!136776 (array_inv!39724 a!3559)))

(declare-fun b!1578656 () Bool)

(declare-fun res!1078596 () Bool)

(assert (=> b!1578656 (=> (not res!1078596) (not e!880528))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578656 (= res!1078596 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578657 () Bool)

(assert (=> b!1578657 (= e!880528 (and (bvsle from!2937 #b00000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!51547 a!3559))))))

(assert (= (and start!136776 res!1078595) b!1578656))

(assert (= (and b!1578656 res!1078596) b!1578657))

(declare-fun m!1450719 () Bool)

(assert (=> start!136776 m!1450719))

(declare-fun m!1450721 () Bool)

(assert (=> b!1578656 m!1450721))

(push 1)

(assert (not start!136776))

(assert (not b!1578656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

