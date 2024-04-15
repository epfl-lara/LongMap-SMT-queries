; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135426 () Bool)

(assert start!135426)

(declare-fun res!1075345 () Bool)

(declare-fun e!877690 () Bool)

(assert (=> start!135426 (=> (not res!1075345) (not e!877690))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135426 (= res!1075345 (validMask!0 mask!877))))

(assert (=> start!135426 e!877690))

(assert (=> start!135426 true))

(declare-datatypes ((array!105132 0))(
  ( (array!105133 (arr!50717 (Array (_ BitVec 32) (_ BitVec 64))) (size!51269 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105132)

(declare-fun array_inv!39653 (array!105132) Bool)

(assert (=> start!135426 (array_inv!39653 _keys!591)))

(declare-fun b!1573869 () Bool)

(declare-fun res!1075347 () Bool)

(assert (=> b!1573869 (=> (not res!1075347) (not e!877690))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1573869 (= res!1075347 (and (= (size!51269 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51269 _keys!591)) (bvslt i!537 (size!51269 _keys!591))))))

(declare-fun b!1573870 () Bool)

(declare-fun res!1075346 () Bool)

(assert (=> b!1573870 (=> (not res!1075346) (not e!877690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573870 (= res!1075346 (validKeyInArray!0 (select (arr!50717 _keys!591) i!537)))))

(declare-fun b!1573871 () Bool)

(assert (=> b!1573871 (= e!877690 (bvsge (size!51269 _keys!591) #b01111111111111111111111111111111))))

(assert (= (and start!135426 res!1075345) b!1573869))

(assert (= (and b!1573869 res!1075347) b!1573870))

(assert (= (and b!1573870 res!1075346) b!1573871))

(declare-fun m!1446549 () Bool)

(assert (=> start!135426 m!1446549))

(declare-fun m!1446551 () Bool)

(assert (=> start!135426 m!1446551))

(declare-fun m!1446553 () Bool)

(assert (=> b!1573870 m!1446553))

(assert (=> b!1573870 m!1446553))

(declare-fun m!1446555 () Bool)

(assert (=> b!1573870 m!1446555))

(check-sat (not b!1573870) (not start!135426))
(check-sat)
(get-model)

(declare-fun d!164899 () Bool)

(assert (=> d!164899 (= (validKeyInArray!0 (select (arr!50717 _keys!591) i!537)) (and (not (= (select (arr!50717 _keys!591) i!537) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50717 _keys!591) i!537) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573870 d!164899))

(declare-fun d!164901 () Bool)

(assert (=> d!164901 (= (validMask!0 mask!877) (and (or (= mask!877 #b00000000000000000000000000000111) (= mask!877 #b00000000000000000000000000001111) (= mask!877 #b00000000000000000000000000011111) (= mask!877 #b00000000000000000000000000111111) (= mask!877 #b00000000000000000000000001111111) (= mask!877 #b00000000000000000000000011111111) (= mask!877 #b00000000000000000000000111111111) (= mask!877 #b00000000000000000000001111111111) (= mask!877 #b00000000000000000000011111111111) (= mask!877 #b00000000000000000000111111111111) (= mask!877 #b00000000000000000001111111111111) (= mask!877 #b00000000000000000011111111111111) (= mask!877 #b00000000000000000111111111111111) (= mask!877 #b00000000000000001111111111111111) (= mask!877 #b00000000000000011111111111111111) (= mask!877 #b00000000000000111111111111111111) (= mask!877 #b00000000000001111111111111111111) (= mask!877 #b00000000000011111111111111111111) (= mask!877 #b00000000000111111111111111111111) (= mask!877 #b00000000001111111111111111111111) (= mask!877 #b00000000011111111111111111111111) (= mask!877 #b00000000111111111111111111111111) (= mask!877 #b00000001111111111111111111111111) (= mask!877 #b00000011111111111111111111111111) (= mask!877 #b00000111111111111111111111111111) (= mask!877 #b00001111111111111111111111111111) (= mask!877 #b00011111111111111111111111111111) (= mask!877 #b00111111111111111111111111111111)) (bvsle mask!877 #b00111111111111111111111111111111)))))

(assert (=> start!135426 d!164901))

(declare-fun d!164909 () Bool)

(assert (=> d!164909 (= (array_inv!39653 _keys!591) (bvsge (size!51269 _keys!591) #b00000000000000000000000000000000))))

(assert (=> start!135426 d!164909))

(check-sat)
