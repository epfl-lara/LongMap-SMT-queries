; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108524 () Bool)

(assert start!108524)

(declare-fun b_free!28071 () Bool)

(declare-fun b_next!28071 () Bool)

(assert (=> start!108524 (= b_free!28071 (not b_next!28071))))

(declare-fun tp!99322 () Bool)

(declare-fun b_and!46131 () Bool)

(assert (=> start!108524 (= tp!99322 b_and!46131)))

(declare-fun b!1280965 () Bool)

(declare-fun e!731900 () Bool)

(declare-fun tp_is_empty!33711 () Bool)

(assert (=> b!1280965 (= e!731900 tp_is_empty!33711)))

(declare-fun b!1280966 () Bool)

(declare-fun res!850903 () Bool)

(declare-fun e!731896 () Bool)

(assert (=> b!1280966 (=> (not res!850903) (not e!731896))))

(declare-datatypes ((array!84496 0))(
  ( (array!84497 (arr!40752 (Array (_ BitVec 32) (_ BitVec 64))) (size!41302 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84496)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84496 (_ BitVec 32)) Bool)

(assert (=> b!1280966 (= res!850903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280967 () Bool)

(declare-fun res!850907 () Bool)

(assert (=> b!1280967 (=> (not res!850907) (not e!731896))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1280967 (= res!850907 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41302 _keys!1741)) (not (= (select (arr!40752 _keys!1741) from!2144) k0!1205))))))

(declare-fun mapNonEmpty!52118 () Bool)

(declare-fun mapRes!52118 () Bool)

(declare-fun tp!99323 () Bool)

(declare-fun e!731899 () Bool)

(assert (=> mapNonEmpty!52118 (= mapRes!52118 (and tp!99323 e!731899))))

(declare-datatypes ((V!50051 0))(
  ( (V!50052 (val!16930 Int)) )
))
(declare-datatypes ((ValueCell!15957 0))(
  ( (ValueCellFull!15957 (v!19530 V!50051)) (EmptyCell!15957) )
))
(declare-fun mapRest!52118 () (Array (_ BitVec 32) ValueCell!15957))

(declare-fun mapKey!52118 () (_ BitVec 32))

(declare-fun mapValue!52118 () ValueCell!15957)

(declare-datatypes ((array!84498 0))(
  ( (array!84499 (arr!40753 (Array (_ BitVec 32) ValueCell!15957)) (size!41303 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84498)

(assert (=> mapNonEmpty!52118 (= (arr!40753 _values!1445) (store mapRest!52118 mapKey!52118 mapValue!52118))))

(declare-fun b!1280968 () Bool)

(assert (=> b!1280968 (= e!731899 tp_is_empty!33711)))

(declare-fun b!1280969 () Bool)

(declare-fun res!850905 () Bool)

(assert (=> b!1280969 (=> (not res!850905) (not e!731896))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280969 (= res!850905 (and (= (size!41303 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41302 _keys!1741) (size!41303 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280970 () Bool)

(assert (=> b!1280970 (= e!731896 (not true))))

(declare-fun minValue!1387 () V!50051)

(declare-fun zeroValue!1387 () V!50051)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21674 0))(
  ( (tuple2!21675 (_1!10848 (_ BitVec 64)) (_2!10848 V!50051)) )
))
(declare-datatypes ((List!28870 0))(
  ( (Nil!28867) (Cons!28866 (h!30075 tuple2!21674) (t!42410 List!28870)) )
))
(declare-datatypes ((ListLongMap!19331 0))(
  ( (ListLongMap!19332 (toList!9681 List!28870)) )
))
(declare-fun contains!7796 (ListLongMap!19331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4765 (array!84496 array!84498 (_ BitVec 32) (_ BitVec 32) V!50051 V!50051 (_ BitVec 32) Int) ListLongMap!19331)

(assert (=> b!1280970 (contains!7796 (getCurrentListMap!4765 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42419 0))(
  ( (Unit!42420) )
))
(declare-fun lt!576179 () Unit!42419)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!14 (array!84496 array!84498 (_ BitVec 32) (_ BitVec 32) V!50051 V!50051 (_ BitVec 64) (_ BitVec 32) Int) Unit!42419)

(assert (=> b!1280970 (= lt!576179 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!14 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280971 () Bool)

(declare-fun res!850901 () Bool)

(assert (=> b!1280971 (=> (not res!850901) (not e!731896))))

(assert (=> b!1280971 (= res!850901 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41302 _keys!1741))))))

(declare-fun b!1280972 () Bool)

(declare-fun res!850906 () Bool)

(assert (=> b!1280972 (=> (not res!850906) (not e!731896))))

(assert (=> b!1280972 (= res!850906 (contains!7796 (getCurrentListMap!4765 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280973 () Bool)

(declare-fun res!850904 () Bool)

(assert (=> b!1280973 (=> (not res!850904) (not e!731896))))

(declare-datatypes ((List!28871 0))(
  ( (Nil!28868) (Cons!28867 (h!30076 (_ BitVec 64)) (t!42411 List!28871)) )
))
(declare-fun arrayNoDuplicates!0 (array!84496 (_ BitVec 32) List!28871) Bool)

(assert (=> b!1280973 (= res!850904 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28868))))

(declare-fun res!850902 () Bool)

(assert (=> start!108524 (=> (not res!850902) (not e!731896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108524 (= res!850902 (validMask!0 mask!2175))))

(assert (=> start!108524 e!731896))

(assert (=> start!108524 tp_is_empty!33711))

(assert (=> start!108524 true))

(declare-fun e!731898 () Bool)

(declare-fun array_inv!30925 (array!84498) Bool)

(assert (=> start!108524 (and (array_inv!30925 _values!1445) e!731898)))

(declare-fun array_inv!30926 (array!84496) Bool)

(assert (=> start!108524 (array_inv!30926 _keys!1741)))

(assert (=> start!108524 tp!99322))

(declare-fun b!1280974 () Bool)

(assert (=> b!1280974 (= e!731898 (and e!731900 mapRes!52118))))

(declare-fun condMapEmpty!52118 () Bool)

(declare-fun mapDefault!52118 () ValueCell!15957)

(assert (=> b!1280974 (= condMapEmpty!52118 (= (arr!40753 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15957)) mapDefault!52118)))))

(declare-fun mapIsEmpty!52118 () Bool)

(assert (=> mapIsEmpty!52118 mapRes!52118))

(assert (= (and start!108524 res!850902) b!1280969))

(assert (= (and b!1280969 res!850905) b!1280966))

(assert (= (and b!1280966 res!850903) b!1280973))

(assert (= (and b!1280973 res!850904) b!1280971))

(assert (= (and b!1280971 res!850901) b!1280972))

(assert (= (and b!1280972 res!850906) b!1280967))

(assert (= (and b!1280967 res!850907) b!1280970))

(assert (= (and b!1280974 condMapEmpty!52118) mapIsEmpty!52118))

(assert (= (and b!1280974 (not condMapEmpty!52118)) mapNonEmpty!52118))

(get-info :version)

(assert (= (and mapNonEmpty!52118 ((_ is ValueCellFull!15957) mapValue!52118)) b!1280968))

(assert (= (and b!1280974 ((_ is ValueCellFull!15957) mapDefault!52118)) b!1280965))

(assert (= start!108524 b!1280974))

(declare-fun m!1175477 () Bool)

(assert (=> start!108524 m!1175477))

(declare-fun m!1175479 () Bool)

(assert (=> start!108524 m!1175479))

(declare-fun m!1175481 () Bool)

(assert (=> start!108524 m!1175481))

(declare-fun m!1175483 () Bool)

(assert (=> b!1280970 m!1175483))

(assert (=> b!1280970 m!1175483))

(declare-fun m!1175485 () Bool)

(assert (=> b!1280970 m!1175485))

(declare-fun m!1175487 () Bool)

(assert (=> b!1280970 m!1175487))

(declare-fun m!1175489 () Bool)

(assert (=> mapNonEmpty!52118 m!1175489))

(declare-fun m!1175491 () Bool)

(assert (=> b!1280966 m!1175491))

(declare-fun m!1175493 () Bool)

(assert (=> b!1280967 m!1175493))

(declare-fun m!1175495 () Bool)

(assert (=> b!1280972 m!1175495))

(assert (=> b!1280972 m!1175495))

(declare-fun m!1175497 () Bool)

(assert (=> b!1280972 m!1175497))

(declare-fun m!1175499 () Bool)

(assert (=> b!1280973 m!1175499))

(check-sat b_and!46131 (not b!1280966) (not start!108524) (not mapNonEmpty!52118) (not b_next!28071) (not b!1280970) tp_is_empty!33711 (not b!1280972) (not b!1280973))
(check-sat b_and!46131 (not b_next!28071))
