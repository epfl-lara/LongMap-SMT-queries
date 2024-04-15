; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72748 () Bool)

(assert start!72748)

(declare-fun b!844269 () Bool)

(declare-fun res!573662 () Bool)

(declare-fun e!471215 () Bool)

(assert (=> b!844269 (=> (not res!573662) (not e!471215))))

(declare-datatypes ((array!47859 0))(
  ( (array!47860 (arr!22961 (Array (_ BitVec 32) (_ BitVec 64))) (size!23403 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47859)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47859 (_ BitVec 32)) Bool)

(assert (=> b!844269 (= res!573662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844270 () Bool)

(declare-fun e!471217 () Bool)

(declare-fun tp_is_empty!15817 () Bool)

(assert (=> b!844270 (= e!471217 tp_is_empty!15817)))

(declare-fun b!844271 () Bool)

(assert (=> b!844271 (= e!471215 false)))

(declare-fun lt!381056 () Bool)

(declare-datatypes ((List!16288 0))(
  ( (Nil!16285) (Cons!16284 (h!17415 (_ BitVec 64)) (t!22650 List!16288)) )
))
(declare-fun arrayNoDuplicates!0 (array!47859 (_ BitVec 32) List!16288) Bool)

(assert (=> b!844271 (= lt!381056 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16285))))

(declare-fun b!844272 () Bool)

(declare-fun res!573661 () Bool)

(assert (=> b!844272 (=> (not res!573661) (not e!471215))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26137 0))(
  ( (V!26138 (val!7956 Int)) )
))
(declare-datatypes ((ValueCell!7469 0))(
  ( (ValueCellFull!7469 (v!10375 V!26137)) (EmptyCell!7469) )
))
(declare-datatypes ((array!47861 0))(
  ( (array!47862 (arr!22962 (Array (_ BitVec 32) ValueCell!7469)) (size!23404 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47861)

(assert (=> b!844272 (= res!573661 (and (= (size!23404 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23403 _keys!868) (size!23404 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25325 () Bool)

(declare-fun mapRes!25325 () Bool)

(assert (=> mapIsEmpty!25325 mapRes!25325))

(declare-fun res!573660 () Bool)

(assert (=> start!72748 (=> (not res!573660) (not e!471215))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72748 (= res!573660 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23403 _keys!868))))))

(assert (=> start!72748 e!471215))

(assert (=> start!72748 true))

(declare-fun array_inv!18326 (array!47859) Bool)

(assert (=> start!72748 (array_inv!18326 _keys!868)))

(declare-fun e!471218 () Bool)

(declare-fun array_inv!18327 (array!47861) Bool)

(assert (=> start!72748 (and (array_inv!18327 _values!688) e!471218)))

(declare-fun b!844273 () Bool)

(declare-fun e!471219 () Bool)

(assert (=> b!844273 (= e!471219 tp_is_empty!15817)))

(declare-fun b!844274 () Bool)

(assert (=> b!844274 (= e!471218 (and e!471219 mapRes!25325))))

(declare-fun condMapEmpty!25325 () Bool)

(declare-fun mapDefault!25325 () ValueCell!7469)

(assert (=> b!844274 (= condMapEmpty!25325 (= (arr!22962 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7469)) mapDefault!25325)))))

(declare-fun b!844275 () Bool)

(declare-fun res!573663 () Bool)

(assert (=> b!844275 (=> (not res!573663) (not e!471215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844275 (= res!573663 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25325 () Bool)

(declare-fun tp!48644 () Bool)

(assert (=> mapNonEmpty!25325 (= mapRes!25325 (and tp!48644 e!471217))))

(declare-fun mapRest!25325 () (Array (_ BitVec 32) ValueCell!7469))

(declare-fun mapKey!25325 () (_ BitVec 32))

(declare-fun mapValue!25325 () ValueCell!7469)

(assert (=> mapNonEmpty!25325 (= (arr!22962 _values!688) (store mapRest!25325 mapKey!25325 mapValue!25325))))

(assert (= (and start!72748 res!573660) b!844275))

(assert (= (and b!844275 res!573663) b!844272))

(assert (= (and b!844272 res!573661) b!844269))

(assert (= (and b!844269 res!573662) b!844271))

(assert (= (and b!844274 condMapEmpty!25325) mapIsEmpty!25325))

(assert (= (and b!844274 (not condMapEmpty!25325)) mapNonEmpty!25325))

(get-info :version)

(assert (= (and mapNonEmpty!25325 ((_ is ValueCellFull!7469) mapValue!25325)) b!844270))

(assert (= (and b!844274 ((_ is ValueCellFull!7469) mapDefault!25325)) b!844273))

(assert (= start!72748 b!844274))

(declare-fun m!785975 () Bool)

(assert (=> mapNonEmpty!25325 m!785975))

(declare-fun m!785977 () Bool)

(assert (=> b!844269 m!785977))

(declare-fun m!785979 () Bool)

(assert (=> b!844271 m!785979))

(declare-fun m!785981 () Bool)

(assert (=> start!72748 m!785981))

(declare-fun m!785983 () Bool)

(assert (=> start!72748 m!785983))

(declare-fun m!785985 () Bool)

(assert (=> b!844275 m!785985))

(check-sat (not b!844269) (not mapNonEmpty!25325) (not b!844271) (not b!844275) tp_is_empty!15817 (not start!72748))
(check-sat)
