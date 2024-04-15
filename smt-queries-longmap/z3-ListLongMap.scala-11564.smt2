; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134670 () Bool)

(assert start!134670)

(declare-fun res!1073591 () Bool)

(declare-fun e!876089 () Bool)

(assert (=> start!134670 (=> (not res!1073591) (not e!876089))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134670 (= res!1073591 (validMask!0 mask!889))))

(assert (=> start!134670 e!876089))

(assert (=> start!134670 true))

(declare-datatypes ((array!104802 0))(
  ( (array!104803 (arr!50576 (Array (_ BitVec 32) (_ BitVec 64))) (size!51128 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104802)

(declare-fun array_inv!39512 (array!104802) Bool)

(assert (=> start!134670 (array_inv!39512 _keys!600)))

(declare-fun b!1571295 () Bool)

(declare-fun res!1073592 () Bool)

(assert (=> b!1571295 (=> (not res!1073592) (not e!876089))))

(assert (=> b!1571295 (= res!1073592 (= (size!51128 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571296 () Bool)

(declare-fun res!1073590 () Bool)

(assert (=> b!1571296 (=> (not res!1073590) (not e!876089))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571296 (= res!1073590 (validKeyInArray!0 k0!754))))

(declare-fun b!1571297 () Bool)

(assert (=> b!1571297 (= e!876089 (and (bvsge mask!889 #b00000000000000000000000000000000) (bvsgt mask!889 #b00111111111111111111111111111111)))))

(assert (= (and start!134670 res!1073591) b!1571295))

(assert (= (and b!1571295 res!1073592) b!1571296))

(assert (= (and b!1571296 res!1073590) b!1571297))

(declare-fun m!1444617 () Bool)

(assert (=> start!134670 m!1444617))

(declare-fun m!1444619 () Bool)

(assert (=> start!134670 m!1444619))

(declare-fun m!1444621 () Bool)

(assert (=> b!1571296 m!1444621))

(check-sat (not b!1571296) (not start!134670))
(check-sat)
(get-model)

(declare-fun d!164331 () Bool)

(assert (=> d!164331 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571296 d!164331))

(declare-fun d!164333 () Bool)

(assert (=> d!164333 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!134670 d!164333))

(declare-fun d!164343 () Bool)

(assert (=> d!164343 (= (array_inv!39512 _keys!600) (bvsge (size!51128 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!134670 d!164343))

(check-sat)
