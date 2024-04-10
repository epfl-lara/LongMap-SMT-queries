; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111224 () Bool)

(assert start!111224)

(declare-fun mapNonEmpty!55250 () Bool)

(declare-fun mapRes!55250 () Bool)

(declare-fun tp!105356 () Bool)

(declare-fun e!751182 () Bool)

(assert (=> mapNonEmpty!55250 (= mapRes!55250 (and tp!105356 e!751182))))

(declare-datatypes ((V!52763 0))(
  ( (V!52764 (val!17947 Int)) )
))
(declare-datatypes ((ValueCell!16974 0))(
  ( (ValueCellFull!16974 (v!20576 V!52763)) (EmptyCell!16974) )
))
(declare-fun mapRest!55250 () (Array (_ BitVec 32) ValueCell!16974))

(declare-datatypes ((array!88448 0))(
  ( (array!88449 (arr!42703 (Array (_ BitVec 32) ValueCell!16974)) (size!43253 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88448)

(declare-fun mapValue!55250 () ValueCell!16974)

(declare-fun mapKey!55250 () (_ BitVec 32))

(assert (=> mapNonEmpty!55250 (= (arr!42703 _values!1337) (store mapRest!55250 mapKey!55250 mapValue!55250))))

(declare-datatypes ((array!88450 0))(
  ( (array!88451 (arr!42704 (Array (_ BitVec 32) (_ BitVec 64))) (size!43254 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88450)

(declare-fun e!751183 () Bool)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun b!1316717 () Bool)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1316717 (= e!751183 (and (= (size!43253 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43254 _keys!1609) (size!43253 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011) (= (size!43254 _keys!1609) (bvadd #b00000000000000000000000000000001 mask!2019)) (bvsgt #b00000000000000000000000000000000 (size!43254 _keys!1609))))))

(declare-fun mapIsEmpty!55250 () Bool)

(assert (=> mapIsEmpty!55250 mapRes!55250))

(declare-fun b!1316718 () Bool)

(declare-fun tp_is_empty!35745 () Bool)

(assert (=> b!1316718 (= e!751182 tp_is_empty!35745)))

(declare-fun b!1316719 () Bool)

(declare-fun e!751181 () Bool)

(assert (=> b!1316719 (= e!751181 tp_is_empty!35745)))

(declare-fun b!1316720 () Bool)

(declare-fun e!751180 () Bool)

(assert (=> b!1316720 (= e!751180 (and e!751181 mapRes!55250))))

(declare-fun condMapEmpty!55250 () Bool)

(declare-fun mapDefault!55250 () ValueCell!16974)

(assert (=> b!1316720 (= condMapEmpty!55250 (= (arr!42703 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16974)) mapDefault!55250)))))

(declare-fun res!874017 () Bool)

(assert (=> start!111224 (=> (not res!874017) (not e!751183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111224 (= res!874017 (validMask!0 mask!2019))))

(assert (=> start!111224 e!751183))

(assert (=> start!111224 true))

(declare-fun array_inv!32253 (array!88448) Bool)

(assert (=> start!111224 (and (array_inv!32253 _values!1337) e!751180)))

(declare-fun array_inv!32254 (array!88450) Bool)

(assert (=> start!111224 (array_inv!32254 _keys!1609)))

(assert (= (and start!111224 res!874017) b!1316717))

(assert (= (and b!1316720 condMapEmpty!55250) mapIsEmpty!55250))

(assert (= (and b!1316720 (not condMapEmpty!55250)) mapNonEmpty!55250))

(get-info :version)

(assert (= (and mapNonEmpty!55250 ((_ is ValueCellFull!16974) mapValue!55250)) b!1316718))

(assert (= (and b!1316720 ((_ is ValueCellFull!16974) mapDefault!55250)) b!1316719))

(assert (= start!111224 b!1316720))

(declare-fun m!1204843 () Bool)

(assert (=> mapNonEmpty!55250 m!1204843))

(declare-fun m!1204845 () Bool)

(assert (=> start!111224 m!1204845))

(declare-fun m!1204847 () Bool)

(assert (=> start!111224 m!1204847))

(declare-fun m!1204849 () Bool)

(assert (=> start!111224 m!1204849))

(check-sat (not start!111224) (not mapNonEmpty!55250) tp_is_empty!35745)
(check-sat)
(get-model)

(declare-fun d!142671 () Bool)

(assert (=> d!142671 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111224 d!142671))

(declare-fun d!142673 () Bool)

(assert (=> d!142673 (= (array_inv!32253 _values!1337) (bvsge (size!43253 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111224 d!142673))

(declare-fun d!142675 () Bool)

(assert (=> d!142675 (= (array_inv!32254 _keys!1609) (bvsge (size!43254 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111224 d!142675))

(declare-fun mapIsEmpty!55256 () Bool)

(declare-fun mapRes!55256 () Bool)

(assert (=> mapIsEmpty!55256 mapRes!55256))

(declare-fun condMapEmpty!55256 () Bool)

(declare-fun mapDefault!55256 () ValueCell!16974)

(assert (=> mapNonEmpty!55250 (= condMapEmpty!55256 (= mapRest!55250 ((as const (Array (_ BitVec 32) ValueCell!16974)) mapDefault!55256)))))

(declare-fun e!751204 () Bool)

(assert (=> mapNonEmpty!55250 (= tp!105356 (and e!751204 mapRes!55256))))

(declare-fun mapNonEmpty!55256 () Bool)

(declare-fun tp!105362 () Bool)

(declare-fun e!751205 () Bool)

(assert (=> mapNonEmpty!55256 (= mapRes!55256 (and tp!105362 e!751205))))

(declare-fun mapValue!55256 () ValueCell!16974)

(declare-fun mapKey!55256 () (_ BitVec 32))

(declare-fun mapRest!55256 () (Array (_ BitVec 32) ValueCell!16974))

(assert (=> mapNonEmpty!55256 (= mapRest!55250 (store mapRest!55256 mapKey!55256 mapValue!55256))))

(declare-fun b!1316740 () Bool)

(assert (=> b!1316740 (= e!751204 tp_is_empty!35745)))

(declare-fun b!1316739 () Bool)

(assert (=> b!1316739 (= e!751205 tp_is_empty!35745)))

(assert (= (and mapNonEmpty!55250 condMapEmpty!55256) mapIsEmpty!55256))

(assert (= (and mapNonEmpty!55250 (not condMapEmpty!55256)) mapNonEmpty!55256))

(assert (= (and mapNonEmpty!55256 ((_ is ValueCellFull!16974) mapValue!55256)) b!1316739))

(assert (= (and mapNonEmpty!55250 ((_ is ValueCellFull!16974) mapDefault!55256)) b!1316740))

(declare-fun m!1204859 () Bool)

(assert (=> mapNonEmpty!55256 m!1204859))

(check-sat (not mapNonEmpty!55256) tp_is_empty!35745)
(check-sat)
