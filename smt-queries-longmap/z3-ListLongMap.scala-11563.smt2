; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134698 () Bool)

(assert start!134698)

(declare-fun res!1073701 () Bool)

(declare-fun e!876274 () Bool)

(assert (=> start!134698 (=> (not res!1073701) (not e!876274))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134698 (= res!1073701 (validMask!0 mask!889))))

(assert (=> start!134698 e!876274))

(assert (=> start!134698 true))

(declare-datatypes ((array!104867 0))(
  ( (array!104868 (arr!50609 (Array (_ BitVec 32) (_ BitVec 64))) (size!51159 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104867)

(declare-fun array_inv!39336 (array!104867) Bool)

(assert (=> start!134698 (array_inv!39336 _keys!600)))

(declare-fun b!1571590 () Bool)

(declare-fun res!1073703 () Bool)

(assert (=> b!1571590 (=> (not res!1073703) (not e!876274))))

(assert (=> b!1571590 (= res!1073703 (= (size!51159 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571591 () Bool)

(declare-fun res!1073702 () Bool)

(assert (=> b!1571591 (=> (not res!1073702) (not e!876274))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571591 (= res!1073702 (validKeyInArray!0 k0!754))))

(declare-fun b!1571592 () Bool)

(assert (=> b!1571592 (= e!876274 (bvslt mask!889 #b00000000000000000000000000000000))))

(assert (= (and start!134698 res!1073701) b!1571590))

(assert (= (and b!1571590 res!1073703) b!1571591))

(assert (= (and b!1571591 res!1073702) b!1571592))

(declare-fun m!1445497 () Bool)

(assert (=> start!134698 m!1445497))

(declare-fun m!1445499 () Bool)

(assert (=> start!134698 m!1445499))

(declare-fun m!1445501 () Bool)

(assert (=> b!1571591 m!1445501))

(check-sat (not b!1571591) (not start!134698))
(check-sat)
(get-model)

(declare-fun d!164565 () Bool)

(assert (=> d!164565 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571591 d!164565))

(declare-fun d!164567 () Bool)

(assert (=> d!164567 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134698 d!164567))

(declare-fun d!164577 () Bool)

(assert (=> d!164577 (= (array_inv!39336 _keys!600) (bvsge (size!51159 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134698 d!164577))

(check-sat)