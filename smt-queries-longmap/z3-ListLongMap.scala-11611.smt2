; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135888 () Bool)

(assert start!135888)

(declare-fun res!1076336 () Bool)

(declare-fun e!879398 () Bool)

(assert (=> start!135888 (=> (not res!1076336) (not e!879398))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135888 (= res!1076336 (validMask!0 mask!877))))

(assert (=> start!135888 e!879398))

(assert (=> start!135888 true))

(declare-datatypes ((array!105326 0))(
  ( (array!105327 (arr!50806 (Array (_ BitVec 32) (_ BitVec 64))) (size!51357 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105326)

(declare-fun array_inv!39761 (array!105326) Bool)

(assert (=> start!135888 (array_inv!39761 _keys!591)))

(declare-fun b!1576618 () Bool)

(declare-fun res!1076335 () Bool)

(assert (=> b!1576618 (=> (not res!1076335) (not e!879398))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1576618 (= res!1076335 (and (= (size!51357 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51357 _keys!591)) (bvslt i!537 (size!51357 _keys!591))))))

(declare-fun b!1576619 () Bool)

(declare-fun res!1076334 () Bool)

(assert (=> b!1576619 (=> (not res!1076334) (not e!879398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576619 (= res!1076334 (validKeyInArray!0 (select (arr!50806 _keys!591) i!537)))))

(declare-fun b!1576620 () Bool)

(assert (=> b!1576620 (= e!879398 (bvsge (size!51357 _keys!591) #b01111111111111111111111111111111))))

(assert (= (and start!135888 res!1076336) b!1576618))

(assert (= (and b!1576618 res!1076335) b!1576619))

(assert (= (and b!1576619 res!1076334) b!1576620))

(declare-fun m!1449699 () Bool)

(assert (=> start!135888 m!1449699))

(declare-fun m!1449701 () Bool)

(assert (=> start!135888 m!1449701))

(declare-fun m!1449703 () Bool)

(assert (=> b!1576619 m!1449703))

(assert (=> b!1576619 m!1449703))

(declare-fun m!1449705 () Bool)

(assert (=> b!1576619 m!1449705))

(check-sat (not b!1576619) (not start!135888))
(check-sat)
(get-model)

(declare-fun d!165855 () Bool)

(assert (=> d!165855 (= (validKeyInArray!0 (select (arr!50806 _keys!591) i!537)) (and (not (= (select (arr!50806 _keys!591) i!537) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50806 _keys!591) i!537) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576619 d!165855))

(declare-fun d!165857 () Bool)

(assert (=> d!165857 (= (validMask!0 mask!877) (and (or (= mask!877 #b00000000000000000000000000000111) (= mask!877 #b00000000000000000000000000001111) (= mask!877 #b00000000000000000000000000011111) (= mask!877 #b00000000000000000000000000111111) (= mask!877 #b00000000000000000000000001111111) (= mask!877 #b00000000000000000000000011111111) (= mask!877 #b00000000000000000000000111111111) (= mask!877 #b00000000000000000000001111111111) (= mask!877 #b00000000000000000000011111111111) (= mask!877 #b00000000000000000000111111111111) (= mask!877 #b00000000000000000001111111111111) (= mask!877 #b00000000000000000011111111111111) (= mask!877 #b00000000000000000111111111111111) (= mask!877 #b00000000000000001111111111111111) (= mask!877 #b00000000000000011111111111111111) (= mask!877 #b00000000000000111111111111111111) (= mask!877 #b00000000000001111111111111111111) (= mask!877 #b00000000000011111111111111111111) (= mask!877 #b00000000000111111111111111111111) (= mask!877 #b00000000001111111111111111111111) (= mask!877 #b00000000011111111111111111111111) (= mask!877 #b00000000111111111111111111111111) (= mask!877 #b00000001111111111111111111111111) (= mask!877 #b00000011111111111111111111111111) (= mask!877 #b00000111111111111111111111111111) (= mask!877 #b00001111111111111111111111111111) (= mask!877 #b00011111111111111111111111111111) (= mask!877 #b00111111111111111111111111111111)) (bvsle mask!877 #b00111111111111111111111111111111)))))

(assert (=> start!135888 d!165857))

(declare-fun d!165865 () Bool)

(assert (=> d!165865 (= (array_inv!39761 _keys!591) (bvsge (size!51357 _keys!591) #b00000000000000000000000000000000))))

(assert (=> start!135888 d!165865))

(check-sat)
