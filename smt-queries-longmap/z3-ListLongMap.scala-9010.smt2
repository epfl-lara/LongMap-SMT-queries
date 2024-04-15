; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108820 () Bool)

(assert start!108820)

(declare-fun b_free!28333 () Bool)

(declare-fun b_next!28333 () Bool)

(assert (=> start!108820 (= b_free!28333 (not b_next!28333))))

(declare-fun tp!100116 () Bool)

(declare-fun b_and!46381 () Bool)

(assert (=> start!108820 (= tp!100116 b_and!46381)))

(declare-fun b!1285063 () Bool)

(declare-fun e!734030 () Bool)

(declare-fun e!734028 () Bool)

(declare-fun mapRes!52517 () Bool)

(assert (=> b!1285063 (= e!734030 (and e!734028 mapRes!52517))))

(declare-fun condMapEmpty!52517 () Bool)

(declare-datatypes ((V!50401 0))(
  ( (V!50402 (val!17061 Int)) )
))
(declare-datatypes ((ValueCell!16088 0))(
  ( (ValueCellFull!16088 (v!19662 V!50401)) (EmptyCell!16088) )
))
(declare-datatypes ((array!84895 0))(
  ( (array!84896 (arr!40950 (Array (_ BitVec 32) ValueCell!16088)) (size!41502 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84895)

(declare-fun mapDefault!52517 () ValueCell!16088)

(assert (=> b!1285063 (= condMapEmpty!52517 (= (arr!40950 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16088)) mapDefault!52517)))))

(declare-fun b!1285064 () Bool)

(declare-fun tp_is_empty!33973 () Bool)

(assert (=> b!1285064 (= e!734028 tp_is_empty!33973)))

(declare-fun mapIsEmpty!52517 () Bool)

(assert (=> mapIsEmpty!52517 mapRes!52517))

(declare-fun b!1285065 () Bool)

(declare-fun res!853709 () Bool)

(declare-fun e!734027 () Bool)

(assert (=> b!1285065 (=> (not res!853709) (not e!734027))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84897 0))(
  ( (array!84898 (arr!40951 (Array (_ BitVec 32) (_ BitVec 64))) (size!41503 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84897)

(assert (=> b!1285065 (= res!853709 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41503 _keys!1741))))))

(declare-fun b!1285066 () Bool)

(declare-fun e!734031 () Bool)

(assert (=> b!1285066 (= e!734031 tp_is_empty!33973)))

(declare-fun b!1285067 () Bool)

(declare-fun res!853713 () Bool)

(assert (=> b!1285067 (=> (not res!853713) (not e!734027))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84897 (_ BitVec 32)) Bool)

(assert (=> b!1285067 (= res!853713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285068 () Bool)

(declare-fun res!853712 () Bool)

(assert (=> b!1285068 (=> (not res!853712) (not e!734027))))

(declare-datatypes ((List!29113 0))(
  ( (Nil!29110) (Cons!29109 (h!30318 (_ BitVec 64)) (t!42649 List!29113)) )
))
(declare-fun arrayNoDuplicates!0 (array!84897 (_ BitVec 32) List!29113) Bool)

(assert (=> b!1285068 (= res!853712 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29110))))

(declare-fun b!1285069 () Bool)

(assert (=> b!1285069 (= e!734027 false)))

(declare-fun minValue!1387 () V!50401)

(declare-fun zeroValue!1387 () V!50401)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576699 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21934 0))(
  ( (tuple2!21935 (_1!10978 (_ BitVec 64)) (_2!10978 V!50401)) )
))
(declare-datatypes ((List!29114 0))(
  ( (Nil!29111) (Cons!29110 (h!30319 tuple2!21934) (t!42650 List!29114)) )
))
(declare-datatypes ((ListLongMap!19591 0))(
  ( (ListLongMap!19592 (toList!9811 List!29114)) )
))
(declare-fun contains!7858 (ListLongMap!19591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4781 (array!84897 array!84895 (_ BitVec 32) (_ BitVec 32) V!50401 V!50401 (_ BitVec 32) Int) ListLongMap!19591)

(assert (=> b!1285069 (= lt!576699 (contains!7858 (getCurrentListMap!4781 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!853711 () Bool)

(assert (=> start!108820 (=> (not res!853711) (not e!734027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108820 (= res!853711 (validMask!0 mask!2175))))

(assert (=> start!108820 e!734027))

(assert (=> start!108820 tp_is_empty!33973))

(assert (=> start!108820 true))

(declare-fun array_inv!31221 (array!84895) Bool)

(assert (=> start!108820 (and (array_inv!31221 _values!1445) e!734030)))

(declare-fun array_inv!31222 (array!84897) Bool)

(assert (=> start!108820 (array_inv!31222 _keys!1741)))

(assert (=> start!108820 tp!100116))

(declare-fun mapNonEmpty!52517 () Bool)

(declare-fun tp!100115 () Bool)

(assert (=> mapNonEmpty!52517 (= mapRes!52517 (and tp!100115 e!734031))))

(declare-fun mapRest!52517 () (Array (_ BitVec 32) ValueCell!16088))

(declare-fun mapKey!52517 () (_ BitVec 32))

(declare-fun mapValue!52517 () ValueCell!16088)

(assert (=> mapNonEmpty!52517 (= (arr!40950 _values!1445) (store mapRest!52517 mapKey!52517 mapValue!52517))))

(declare-fun b!1285070 () Bool)

(declare-fun res!853710 () Bool)

(assert (=> b!1285070 (=> (not res!853710) (not e!734027))))

(assert (=> b!1285070 (= res!853710 (and (= (size!41502 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41503 _keys!1741) (size!41502 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108820 res!853711) b!1285070))

(assert (= (and b!1285070 res!853710) b!1285067))

(assert (= (and b!1285067 res!853713) b!1285068))

(assert (= (and b!1285068 res!853712) b!1285065))

(assert (= (and b!1285065 res!853709) b!1285069))

(assert (= (and b!1285063 condMapEmpty!52517) mapIsEmpty!52517))

(assert (= (and b!1285063 (not condMapEmpty!52517)) mapNonEmpty!52517))

(get-info :version)

(assert (= (and mapNonEmpty!52517 ((_ is ValueCellFull!16088) mapValue!52517)) b!1285066))

(assert (= (and b!1285063 ((_ is ValueCellFull!16088) mapDefault!52517)) b!1285064))

(assert (= start!108820 b!1285063))

(declare-fun m!1178089 () Bool)

(assert (=> b!1285067 m!1178089))

(declare-fun m!1178091 () Bool)

(assert (=> mapNonEmpty!52517 m!1178091))

(declare-fun m!1178093 () Bool)

(assert (=> b!1285069 m!1178093))

(assert (=> b!1285069 m!1178093))

(declare-fun m!1178095 () Bool)

(assert (=> b!1285069 m!1178095))

(declare-fun m!1178097 () Bool)

(assert (=> b!1285068 m!1178097))

(declare-fun m!1178099 () Bool)

(assert (=> start!108820 m!1178099))

(declare-fun m!1178101 () Bool)

(assert (=> start!108820 m!1178101))

(declare-fun m!1178103 () Bool)

(assert (=> start!108820 m!1178103))

(check-sat (not mapNonEmpty!52517) (not b!1285067) (not start!108820) (not b!1285069) b_and!46381 (not b_next!28333) (not b!1285068) tp_is_empty!33973)
(check-sat b_and!46381 (not b_next!28333))
