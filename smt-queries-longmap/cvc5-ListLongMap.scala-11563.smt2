; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134696 () Bool)

(assert start!134696)

(declare-fun res!1073692 () Bool)

(declare-fun e!876268 () Bool)

(assert (=> start!134696 (=> (not res!1073692) (not e!876268))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134696 (= res!1073692 (validMask!0 mask!889))))

(assert (=> start!134696 e!876268))

(assert (=> start!134696 true))

(declare-datatypes ((array!104865 0))(
  ( (array!104866 (arr!50608 (Array (_ BitVec 32) (_ BitVec 64))) (size!51158 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104865)

(declare-fun array_inv!39335 (array!104865) Bool)

(assert (=> start!134696 (array_inv!39335 _keys!600)))

(declare-fun b!1571581 () Bool)

(declare-fun res!1073693 () Bool)

(assert (=> b!1571581 (=> (not res!1073693) (not e!876268))))

(assert (=> b!1571581 (= res!1073693 (= (size!51158 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571582 () Bool)

(declare-fun res!1073694 () Bool)

(assert (=> b!1571582 (=> (not res!1073694) (not e!876268))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571582 (= res!1073694 (validKeyInArray!0 k!754))))

(declare-fun b!1571583 () Bool)

(assert (=> b!1571583 (= e!876268 (bvslt mask!889 #b00000000000000000000000000000000))))

(assert (= (and start!134696 res!1073692) b!1571581))

(assert (= (and b!1571581 res!1073693) b!1571582))

(assert (= (and b!1571582 res!1073694) b!1571583))

(declare-fun m!1445491 () Bool)

(assert (=> start!134696 m!1445491))

(declare-fun m!1445493 () Bool)

(assert (=> start!134696 m!1445493))

(declare-fun m!1445495 () Bool)

(assert (=> b!1571582 m!1445495))

(push 1)

(assert (not b!1571582))

(assert (not start!134696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164569 () Bool)

(assert (=> d!164569 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571582 d!164569))

(declare-fun d!164573 () Bool)

(assert (=> d!164573 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134696 d!164573))

(declare-fun d!164579 () Bool)

(assert (=> d!164579 (= (array_inv!39335 _keys!600) (bvsge (size!51158 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134696 d!164579))

(push 1)

