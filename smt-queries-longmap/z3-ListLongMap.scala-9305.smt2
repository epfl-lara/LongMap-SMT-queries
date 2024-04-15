; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111222 () Bool)

(assert start!111222)

(declare-fun res!873985 () Bool)

(declare-fun e!751136 () Bool)

(assert (=> start!111222 (=> (not res!873985) (not e!751136))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111222 (= res!873985 (validMask!0 mask!2019))))

(assert (=> start!111222 e!751136))

(assert (=> start!111222 true))

(declare-datatypes ((V!52761 0))(
  ( (V!52762 (val!17946 Int)) )
))
(declare-datatypes ((ValueCell!16973 0))(
  ( (ValueCellFull!16973 (v!20574 V!52761)) (EmptyCell!16973) )
))
(declare-datatypes ((array!88355 0))(
  ( (array!88356 (arr!42657 (Array (_ BitVec 32) ValueCell!16973)) (size!43209 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88355)

(declare-fun e!751135 () Bool)

(declare-fun array_inv!32397 (array!88355) Bool)

(assert (=> start!111222 (and (array_inv!32397 _values!1337) e!751135)))

(declare-datatypes ((array!88357 0))(
  ( (array!88358 (arr!42658 (Array (_ BitVec 32) (_ BitVec 64))) (size!43210 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88357)

(declare-fun array_inv!32398 (array!88357) Bool)

(assert (=> start!111222 (array_inv!32398 _keys!1609)))

(declare-fun b!1316635 () Bool)

(declare-fun e!751132 () Bool)

(declare-fun tp_is_empty!35743 () Bool)

(assert (=> b!1316635 (= e!751132 tp_is_empty!35743)))

(declare-fun mapIsEmpty!55247 () Bool)

(declare-fun mapRes!55247 () Bool)

(assert (=> mapIsEmpty!55247 mapRes!55247))

(declare-fun b!1316636 () Bool)

(declare-fun e!751133 () Bool)

(assert (=> b!1316636 (= e!751133 tp_is_empty!35743)))

(declare-fun b!1316637 () Bool)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1316637 (= e!751136 (and (= (size!43209 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43210 _keys!1609) (size!43209 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011) (= (size!43210 _keys!1609) (bvadd #b00000000000000000000000000000001 mask!2019)) (bvsgt #b00000000000000000000000000000000 (size!43210 _keys!1609))))))

(declare-fun b!1316638 () Bool)

(assert (=> b!1316638 (= e!751135 (and e!751133 mapRes!55247))))

(declare-fun condMapEmpty!55247 () Bool)

(declare-fun mapDefault!55247 () ValueCell!16973)

(assert (=> b!1316638 (= condMapEmpty!55247 (= (arr!42657 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16973)) mapDefault!55247)))))

(declare-fun mapNonEmpty!55247 () Bool)

(declare-fun tp!105354 () Bool)

(assert (=> mapNonEmpty!55247 (= mapRes!55247 (and tp!105354 e!751132))))

(declare-fun mapKey!55247 () (_ BitVec 32))

(declare-fun mapValue!55247 () ValueCell!16973)

(declare-fun mapRest!55247 () (Array (_ BitVec 32) ValueCell!16973))

(assert (=> mapNonEmpty!55247 (= (arr!42657 _values!1337) (store mapRest!55247 mapKey!55247 mapValue!55247))))

(assert (= (and start!111222 res!873985) b!1316637))

(assert (= (and b!1316638 condMapEmpty!55247) mapIsEmpty!55247))

(assert (= (and b!1316638 (not condMapEmpty!55247)) mapNonEmpty!55247))

(get-info :version)

(assert (= (and mapNonEmpty!55247 ((_ is ValueCellFull!16973) mapValue!55247)) b!1316635))

(assert (= (and b!1316638 ((_ is ValueCellFull!16973) mapDefault!55247)) b!1316636))

(assert (= start!111222 b!1316638))

(declare-fun m!1204319 () Bool)

(assert (=> start!111222 m!1204319))

(declare-fun m!1204321 () Bool)

(assert (=> start!111222 m!1204321))

(declare-fun m!1204323 () Bool)

(assert (=> start!111222 m!1204323))

(declare-fun m!1204325 () Bool)

(assert (=> mapNonEmpty!55247 m!1204325))

(check-sat (not start!111222) (not mapNonEmpty!55247) tp_is_empty!35743)
(check-sat)
(get-model)

(declare-fun d!142555 () Bool)

(assert (=> d!142555 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111222 d!142555))

(declare-fun d!142557 () Bool)

(assert (=> d!142557 (= (array_inv!32397 _values!1337) (bvsge (size!43209 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111222 d!142557))

(declare-fun d!142559 () Bool)

(assert (=> d!142559 (= (array_inv!32398 _keys!1609) (bvsge (size!43210 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111222 d!142559))

(declare-fun b!1316669 () Bool)

(declare-fun e!751171 () Bool)

(assert (=> b!1316669 (= e!751171 tp_is_empty!35743)))

(declare-fun condMapEmpty!55256 () Bool)

(declare-fun mapDefault!55256 () ValueCell!16973)

(assert (=> mapNonEmpty!55247 (= condMapEmpty!55256 (= mapRest!55247 ((as const (Array (_ BitVec 32) ValueCell!16973)) mapDefault!55256)))))

(declare-fun e!751172 () Bool)

(declare-fun mapRes!55256 () Bool)

(assert (=> mapNonEmpty!55247 (= tp!105354 (and e!751172 mapRes!55256))))

(declare-fun b!1316670 () Bool)

(assert (=> b!1316670 (= e!751172 tp_is_empty!35743)))

(declare-fun mapNonEmpty!55256 () Bool)

(declare-fun tp!105363 () Bool)

(assert (=> mapNonEmpty!55256 (= mapRes!55256 (and tp!105363 e!751171))))

(declare-fun mapRest!55256 () (Array (_ BitVec 32) ValueCell!16973))

(declare-fun mapKey!55256 () (_ BitVec 32))

(declare-fun mapValue!55256 () ValueCell!16973)

(assert (=> mapNonEmpty!55256 (= mapRest!55247 (store mapRest!55256 mapKey!55256 mapValue!55256))))

(declare-fun mapIsEmpty!55256 () Bool)

(assert (=> mapIsEmpty!55256 mapRes!55256))

(assert (= (and mapNonEmpty!55247 condMapEmpty!55256) mapIsEmpty!55256))

(assert (= (and mapNonEmpty!55247 (not condMapEmpty!55256)) mapNonEmpty!55256))

(assert (= (and mapNonEmpty!55256 ((_ is ValueCellFull!16973) mapValue!55256)) b!1316669))

(assert (= (and mapNonEmpty!55247 ((_ is ValueCellFull!16973) mapDefault!55256)) b!1316670))

(declare-fun m!1204343 () Bool)

(assert (=> mapNonEmpty!55256 m!1204343))

(check-sat (not mapNonEmpty!55256) tp_is_empty!35743)
(check-sat)
