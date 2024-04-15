; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4028 () Bool)

(assert start!4028)

(declare-fun b_free!943 () Bool)

(declare-fun b_next!943 () Bool)

(assert (=> start!4028 (= b_free!943 (not b_next!943))))

(declare-fun tp!4249 () Bool)

(declare-fun b_and!1747 () Bool)

(assert (=> start!4028 (= tp!4249 b_and!1747)))

(declare-fun b!29513 () Bool)

(declare-fun res!17709 () Bool)

(declare-fun e!19039 () Bool)

(assert (=> b!29513 (=> (not res!17709) (not e!19039))))

(declare-datatypes ((array!1801 0))(
  ( (array!1802 (arr!854 (Array (_ BitVec 32) (_ BitVec 64))) (size!955 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1801)

(declare-datatypes ((List!710 0))(
  ( (Nil!707) (Cons!706 (h!1273 (_ BitVec 64)) (t!3396 List!710)) )
))
(declare-fun arrayNoDuplicates!0 (array!1801 (_ BitVec 32) List!710) Bool)

(assert (=> b!29513 (= res!17709 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!707))))

(declare-fun b!29514 () Bool)

(declare-fun e!19041 () Bool)

(declare-fun e!19038 () Bool)

(declare-fun mapRes!1474 () Bool)

(assert (=> b!29514 (= e!19041 (and e!19038 mapRes!1474))))

(declare-fun condMapEmpty!1474 () Bool)

(declare-datatypes ((V!1555 0))(
  ( (V!1556 (val!675 Int)) )
))
(declare-datatypes ((ValueCell!449 0))(
  ( (ValueCellFull!449 (v!1763 V!1555)) (EmptyCell!449) )
))
(declare-datatypes ((array!1803 0))(
  ( (array!1804 (arr!855 (Array (_ BitVec 32) ValueCell!449)) (size!956 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1803)

(declare-fun mapDefault!1474 () ValueCell!449)

(assert (=> b!29514 (= condMapEmpty!1474 (= (arr!855 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!449)) mapDefault!1474)))))

(declare-fun b!29515 () Bool)

(declare-fun tp_is_empty!1297 () Bool)

(assert (=> b!29515 (= e!19038 tp_is_empty!1297)))

(declare-fun b!29516 () Bool)

(declare-fun e!19040 () Bool)

(assert (=> b!29516 (= e!19040 tp_is_empty!1297)))

(declare-fun b!29517 () Bool)

(declare-fun res!17713 () Bool)

(assert (=> b!29517 (=> (not res!17713) (not e!19039))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1801 (_ BitVec 32)) Bool)

(assert (=> b!29517 (= res!17713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1474 () Bool)

(assert (=> mapIsEmpty!1474 mapRes!1474))

(declare-fun b!29518 () Bool)

(assert (=> b!29518 (= e!19039 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11335 () Bool)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1555)

(declare-fun minValue!1443 () V!1555)

(declare-datatypes ((tuple2!1130 0))(
  ( (tuple2!1131 (_1!576 (_ BitVec 64)) (_2!576 V!1555)) )
))
(declare-datatypes ((List!711 0))(
  ( (Nil!708) (Cons!707 (h!1274 tuple2!1130) (t!3397 List!711)) )
))
(declare-datatypes ((ListLongMap!695 0))(
  ( (ListLongMap!696 (toList!363 List!711)) )
))
(declare-fun contains!304 (ListLongMap!695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!187 (array!1801 array!1803 (_ BitVec 32) (_ BitVec 32) V!1555 V!1555 (_ BitVec 32) Int) ListLongMap!695)

(assert (=> b!29518 (= lt!11335 (contains!304 (getCurrentListMap!187 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun mapNonEmpty!1474 () Bool)

(declare-fun tp!4248 () Bool)

(assert (=> mapNonEmpty!1474 (= mapRes!1474 (and tp!4248 e!19040))))

(declare-fun mapRest!1474 () (Array (_ BitVec 32) ValueCell!449))

(declare-fun mapKey!1474 () (_ BitVec 32))

(declare-fun mapValue!1474 () ValueCell!449)

(assert (=> mapNonEmpty!1474 (= (arr!855 _values!1501) (store mapRest!1474 mapKey!1474 mapValue!1474))))

(declare-fun res!17712 () Bool)

(assert (=> start!4028 (=> (not res!17712) (not e!19039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4028 (= res!17712 (validMask!0 mask!2294))))

(assert (=> start!4028 e!19039))

(assert (=> start!4028 true))

(assert (=> start!4028 tp!4249))

(declare-fun array_inv!597 (array!1803) Bool)

(assert (=> start!4028 (and (array_inv!597 _values!1501) e!19041)))

(declare-fun array_inv!598 (array!1801) Bool)

(assert (=> start!4028 (array_inv!598 _keys!1833)))

(assert (=> start!4028 tp_is_empty!1297))

(declare-fun b!29519 () Bool)

(declare-fun res!17710 () Bool)

(assert (=> b!29519 (=> (not res!17710) (not e!19039))))

(assert (=> b!29519 (= res!17710 (and (= (size!956 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!955 _keys!1833) (size!956 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29520 () Bool)

(declare-fun res!17711 () Bool)

(assert (=> b!29520 (=> (not res!17711) (not e!19039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29520 (= res!17711 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4028 res!17712) b!29519))

(assert (= (and b!29519 res!17710) b!29517))

(assert (= (and b!29517 res!17713) b!29513))

(assert (= (and b!29513 res!17709) b!29520))

(assert (= (and b!29520 res!17711) b!29518))

(assert (= (and b!29514 condMapEmpty!1474) mapIsEmpty!1474))

(assert (= (and b!29514 (not condMapEmpty!1474)) mapNonEmpty!1474))

(get-info :version)

(assert (= (and mapNonEmpty!1474 ((_ is ValueCellFull!449) mapValue!1474)) b!29516))

(assert (= (and b!29514 ((_ is ValueCellFull!449) mapDefault!1474)) b!29515))

(assert (= start!4028 b!29514))

(declare-fun m!23751 () Bool)

(assert (=> b!29517 m!23751))

(declare-fun m!23753 () Bool)

(assert (=> b!29513 m!23753))

(declare-fun m!23755 () Bool)

(assert (=> start!4028 m!23755))

(declare-fun m!23757 () Bool)

(assert (=> start!4028 m!23757))

(declare-fun m!23759 () Bool)

(assert (=> start!4028 m!23759))

(declare-fun m!23761 () Bool)

(assert (=> mapNonEmpty!1474 m!23761))

(declare-fun m!23763 () Bool)

(assert (=> b!29520 m!23763))

(declare-fun m!23765 () Bool)

(assert (=> b!29518 m!23765))

(assert (=> b!29518 m!23765))

(declare-fun m!23767 () Bool)

(assert (=> b!29518 m!23767))

(check-sat b_and!1747 (not mapNonEmpty!1474) (not b!29513) (not b!29518) (not start!4028) (not b_next!943) tp_is_empty!1297 (not b!29517) (not b!29520))
(check-sat b_and!1747 (not b_next!943))
