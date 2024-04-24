; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4154 () Bool)

(assert start!4154)

(declare-fun b_free!1063 () Bool)

(declare-fun b_next!1063 () Bool)

(assert (=> start!4154 (= b_free!1063 (not b_next!1063))))

(declare-fun tp!4609 () Bool)

(declare-fun b_and!1863 () Bool)

(assert (=> start!4154 (= tp!4609 b_and!1863)))

(declare-fun mapIsEmpty!1654 () Bool)

(declare-fun mapRes!1654 () Bool)

(assert (=> mapIsEmpty!1654 mapRes!1654))

(declare-fun b!31277 () Bool)

(declare-fun res!18944 () Bool)

(declare-fun e!19983 () Bool)

(assert (=> b!31277 (=> (not res!18944) (not e!19983))))

(declare-datatypes ((array!2037 0))(
  ( (array!2038 (arr!972 (Array (_ BitVec 32) (_ BitVec 64))) (size!1073 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2037)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2037 (_ BitVec 32)) Bool)

(assert (=> b!31277 (= res!18944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!18943 () Bool)

(assert (=> start!4154 (=> (not res!18943) (not e!19983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4154 (= res!18943 (validMask!0 mask!2294))))

(assert (=> start!4154 e!19983))

(assert (=> start!4154 true))

(assert (=> start!4154 tp!4609))

(declare-datatypes ((V!1715 0))(
  ( (V!1716 (val!735 Int)) )
))
(declare-datatypes ((ValueCell!509 0))(
  ( (ValueCellFull!509 (v!1824 V!1715)) (EmptyCell!509) )
))
(declare-datatypes ((array!2039 0))(
  ( (array!2040 (arr!973 (Array (_ BitVec 32) ValueCell!509)) (size!1074 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2039)

(declare-fun e!19985 () Bool)

(declare-fun array_inv!667 (array!2039) Bool)

(assert (=> start!4154 (and (array_inv!667 _values!1501) e!19985)))

(declare-fun array_inv!668 (array!2037) Bool)

(assert (=> start!4154 (array_inv!668 _keys!1833)))

(declare-fun tp_is_empty!1417 () Bool)

(assert (=> start!4154 tp_is_empty!1417))

(declare-fun b!31278 () Bool)

(declare-fun res!18947 () Bool)

(assert (=> b!31278 (=> (not res!18947) (not e!19983))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31278 (= res!18947 (and (= (size!1074 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1073 _keys!1833) (size!1074 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31279 () Bool)

(declare-fun e!19984 () Bool)

(assert (=> b!31279 (= e!19984 tp_is_empty!1417)))

(declare-fun b!31280 () Bool)

(declare-fun res!18946 () Bool)

(assert (=> b!31280 (=> (not res!18946) (not e!19983))))

(declare-datatypes ((List!792 0))(
  ( (Nil!789) (Cons!788 (h!1355 (_ BitVec 64)) (t!3479 List!792)) )
))
(declare-fun arrayNoDuplicates!0 (array!2037 (_ BitVec 32) List!792) Bool)

(assert (=> b!31280 (= res!18946 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!789))))

(declare-fun b!31281 () Bool)

(assert (=> b!31281 (= e!19985 (and e!19984 mapRes!1654))))

(declare-fun condMapEmpty!1654 () Bool)

(declare-fun mapDefault!1654 () ValueCell!509)

(assert (=> b!31281 (= condMapEmpty!1654 (= (arr!973 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!509)) mapDefault!1654)))))

(declare-fun mapNonEmpty!1654 () Bool)

(declare-fun tp!4608 () Bool)

(declare-fun e!19987 () Bool)

(assert (=> mapNonEmpty!1654 (= mapRes!1654 (and tp!4608 e!19987))))

(declare-fun mapKey!1654 () (_ BitVec 32))

(declare-fun mapValue!1654 () ValueCell!509)

(declare-fun mapRest!1654 () (Array (_ BitVec 32) ValueCell!509))

(assert (=> mapNonEmpty!1654 (= (arr!973 _values!1501) (store mapRest!1654 mapKey!1654 mapValue!1654))))

(declare-fun b!31282 () Bool)

(assert (=> b!31282 (= e!19987 tp_is_empty!1417)))

(declare-fun b!31283 () Bool)

(assert (=> b!31283 (= e!19983 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11511 () Bool)

(declare-fun zeroValue!1443 () V!1715)

(declare-fun minValue!1443 () V!1715)

(declare-datatypes ((tuple2!1198 0))(
  ( (tuple2!1199 (_1!610 (_ BitVec 64)) (_2!610 V!1715)) )
))
(declare-datatypes ((List!793 0))(
  ( (Nil!790) (Cons!789 (h!1356 tuple2!1198) (t!3480 List!793)) )
))
(declare-datatypes ((ListLongMap!769 0))(
  ( (ListLongMap!770 (toList!400 List!793)) )
))
(declare-fun contains!342 (ListLongMap!769 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!225 (array!2037 array!2039 (_ BitVec 32) (_ BitVec 32) V!1715 V!1715 (_ BitVec 32) Int) ListLongMap!769)

(assert (=> b!31283 (= lt!11511 (contains!342 (getCurrentListMap!225 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!31284 () Bool)

(declare-fun res!18945 () Bool)

(assert (=> b!31284 (=> (not res!18945) (not e!19983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31284 (= res!18945 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4154 res!18943) b!31278))

(assert (= (and b!31278 res!18947) b!31277))

(assert (= (and b!31277 res!18944) b!31280))

(assert (= (and b!31280 res!18946) b!31284))

(assert (= (and b!31284 res!18945) b!31283))

(assert (= (and b!31281 condMapEmpty!1654) mapIsEmpty!1654))

(assert (= (and b!31281 (not condMapEmpty!1654)) mapNonEmpty!1654))

(get-info :version)

(assert (= (and mapNonEmpty!1654 ((_ is ValueCellFull!509) mapValue!1654)) b!31282))

(assert (= (and b!31281 ((_ is ValueCellFull!509) mapDefault!1654)) b!31279))

(assert (= start!4154 b!31281))

(declare-fun m!25001 () Bool)

(assert (=> b!31283 m!25001))

(assert (=> b!31283 m!25001))

(declare-fun m!25003 () Bool)

(assert (=> b!31283 m!25003))

(declare-fun m!25005 () Bool)

(assert (=> b!31280 m!25005))

(declare-fun m!25007 () Bool)

(assert (=> b!31284 m!25007))

(declare-fun m!25009 () Bool)

(assert (=> b!31277 m!25009))

(declare-fun m!25011 () Bool)

(assert (=> mapNonEmpty!1654 m!25011))

(declare-fun m!25013 () Bool)

(assert (=> start!4154 m!25013))

(declare-fun m!25015 () Bool)

(assert (=> start!4154 m!25015))

(declare-fun m!25017 () Bool)

(assert (=> start!4154 m!25017))

(check-sat (not b!31284) (not mapNonEmpty!1654) (not b!31277) b_and!1863 (not b!31283) (not b!31280) (not b_next!1063) (not start!4154) tp_is_empty!1417)
(check-sat b_and!1863 (not b_next!1063))
