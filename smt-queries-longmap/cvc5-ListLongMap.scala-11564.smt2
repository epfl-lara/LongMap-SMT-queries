; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134720 () Bool)

(assert start!134720)

(declare-fun res!1073720 () Bool)

(declare-fun e!876286 () Bool)

(assert (=> start!134720 (=> (not res!1073720) (not e!876286))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134720 (= res!1073720 (validMask!0 mask!889))))

(assert (=> start!134720 e!876286))

(assert (=> start!134720 true))

(declare-datatypes ((array!104874 0))(
  ( (array!104875 (arr!50611 (Array (_ BitVec 32) (_ BitVec 64))) (size!51161 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104874)

(declare-fun array_inv!39338 (array!104874) Bool)

(assert (=> start!134720 (array_inv!39338 _keys!600)))

(declare-fun b!1571608 () Bool)

(declare-fun res!1073719 () Bool)

(assert (=> b!1571608 (=> (not res!1073719) (not e!876286))))

(assert (=> b!1571608 (= res!1073719 (= (size!51161 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571609 () Bool)

(declare-fun res!1073721 () Bool)

(assert (=> b!1571609 (=> (not res!1073721) (not e!876286))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571609 (= res!1073721 (validKeyInArray!0 k!754))))

(declare-fun b!1571610 () Bool)

(assert (=> b!1571610 (= e!876286 (and (bvsge mask!889 #b00000000000000000000000000000000) (bvsgt mask!889 #b00111111111111111111111111111111)))))

(assert (= (and start!134720 res!1073720) b!1571608))

(assert (= (and b!1571608 res!1073719) b!1571609))

(assert (= (and b!1571609 res!1073721) b!1571610))

(declare-fun m!1445509 () Bool)

(assert (=> start!134720 m!1445509))

(declare-fun m!1445511 () Bool)

(assert (=> start!134720 m!1445511))

(declare-fun m!1445513 () Bool)

(assert (=> b!1571609 m!1445513))

(push 1)

(assert (not start!134720))

(assert (not b!1571609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164589 () Bool)

(assert (=> d!164589 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

