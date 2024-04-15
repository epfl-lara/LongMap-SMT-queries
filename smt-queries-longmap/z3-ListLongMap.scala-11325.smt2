; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131804 () Bool)

(assert start!131804)

(declare-fun res!1058965 () Bool)

(declare-fun e!858934 () Bool)

(assert (=> start!131804 (=> (not res!1058965) (not e!858934))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131804 (= res!1058965 (validMask!0 mask!926))))

(assert (=> start!131804 e!858934))

(assert (=> start!131804 true))

(declare-datatypes ((V!58901 0))(
  ( (V!58902 (val!18999 Int)) )
))
(declare-datatypes ((ValueCell!18011 0))(
  ( (ValueCellFull!18011 (v!21796 V!58901)) (EmptyCell!18011) )
))
(declare-datatypes ((array!102834 0))(
  ( (array!102835 (arr!49620 (Array (_ BitVec 32) ValueCell!18011)) (size!50172 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102834)

(declare-fun e!858933 () Bool)

(declare-fun array_inv!38797 (array!102834) Bool)

(assert (=> start!131804 (and (array_inv!38797 _values!470) e!858933)))

(declare-datatypes ((array!102836 0))(
  ( (array!102837 (arr!49621 (Array (_ BitVec 32) (_ BitVec 64))) (size!50173 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102836)

(declare-fun array_inv!38798 (array!102836) Bool)

(assert (=> start!131804 (array_inv!38798 _keys!618)))

(declare-fun mapIsEmpty!58468 () Bool)

(declare-fun mapRes!58468 () Bool)

(assert (=> mapIsEmpty!58468 mapRes!58468))

(declare-fun mapNonEmpty!58468 () Bool)

(declare-fun tp!110996 () Bool)

(declare-fun e!858932 () Bool)

(assert (=> mapNonEmpty!58468 (= mapRes!58468 (and tp!110996 e!858932))))

(declare-fun mapKey!58468 () (_ BitVec 32))

(declare-fun mapValue!58468 () ValueCell!18011)

(declare-fun mapRest!58468 () (Array (_ BitVec 32) ValueCell!18011))

(assert (=> mapNonEmpty!58468 (= (arr!49620 _values!470) (store mapRest!58468 mapKey!58468 mapValue!58468))))

(declare-fun b!1543328 () Bool)

(declare-fun tp_is_empty!37843 () Bool)

(assert (=> b!1543328 (= e!858932 tp_is_empty!37843)))

(declare-fun b!1543329 () Bool)

(assert (=> b!1543329 (= e!858934 false)))

(declare-fun lt!665731 () Bool)

(declare-datatypes ((List!35972 0))(
  ( (Nil!35969) (Cons!35968 (h!37414 (_ BitVec 64)) (t!50658 List!35972)) )
))
(declare-fun arrayNoDuplicates!0 (array!102836 (_ BitVec 32) List!35972) Bool)

(assert (=> b!1543329 (= lt!665731 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35969))))

(declare-fun b!1543330 () Bool)

(declare-fun res!1058966 () Bool)

(assert (=> b!1543330 (=> (not res!1058966) (not e!858934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102836 (_ BitVec 32)) Bool)

(assert (=> b!1543330 (= res!1058966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543331 () Bool)

(declare-fun e!858935 () Bool)

(assert (=> b!1543331 (= e!858933 (and e!858935 mapRes!58468))))

(declare-fun condMapEmpty!58468 () Bool)

(declare-fun mapDefault!58468 () ValueCell!18011)

(assert (=> b!1543331 (= condMapEmpty!58468 (= (arr!49620 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18011)) mapDefault!58468)))))

(declare-fun b!1543332 () Bool)

(declare-fun res!1058967 () Bool)

(assert (=> b!1543332 (=> (not res!1058967) (not e!858934))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543332 (= res!1058967 (and (= (size!50172 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50173 _keys!618) (size!50172 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543333 () Bool)

(assert (=> b!1543333 (= e!858935 tp_is_empty!37843)))

(assert (= (and start!131804 res!1058965) b!1543332))

(assert (= (and b!1543332 res!1058967) b!1543330))

(assert (= (and b!1543330 res!1058966) b!1543329))

(assert (= (and b!1543331 condMapEmpty!58468) mapIsEmpty!58468))

(assert (= (and b!1543331 (not condMapEmpty!58468)) mapNonEmpty!58468))

(get-info :version)

(assert (= (and mapNonEmpty!58468 ((_ is ValueCellFull!18011) mapValue!58468)) b!1543328))

(assert (= (and b!1543331 ((_ is ValueCellFull!18011) mapDefault!58468)) b!1543333))

(assert (= start!131804 b!1543331))

(declare-fun m!1423989 () Bool)

(assert (=> start!131804 m!1423989))

(declare-fun m!1423991 () Bool)

(assert (=> start!131804 m!1423991))

(declare-fun m!1423993 () Bool)

(assert (=> start!131804 m!1423993))

(declare-fun m!1423995 () Bool)

(assert (=> mapNonEmpty!58468 m!1423995))

(declare-fun m!1423997 () Bool)

(assert (=> b!1543329 m!1423997))

(declare-fun m!1423999 () Bool)

(assert (=> b!1543330 m!1423999))

(check-sat tp_is_empty!37843 (not b!1543329) (not start!131804) (not b!1543330) (not mapNonEmpty!58468))
(check-sat)
