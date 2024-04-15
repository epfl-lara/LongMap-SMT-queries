; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109108 () Bool)

(assert start!109108)

(declare-fun b_free!28597 () Bool)

(declare-fun b_next!28597 () Bool)

(assert (=> start!109108 (= b_free!28597 (not b_next!28597))))

(declare-fun tp!100911 () Bool)

(declare-fun b_and!46669 () Bool)

(assert (=> start!109108 (= tp!100911 b_and!46669)))

(declare-fun b!1289965 () Bool)

(declare-fun res!856941 () Bool)

(declare-fun e!736483 () Bool)

(assert (=> b!1289965 (=> (not res!856941) (not e!736483))))

(declare-datatypes ((array!85403 0))(
  ( (array!85404 (arr!41203 (Array (_ BitVec 32) (_ BitVec 64))) (size!41755 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85403)

(declare-datatypes ((List!29299 0))(
  ( (Nil!29296) (Cons!29295 (h!30504 (_ BitVec 64)) (t!42855 List!29299)) )
))
(declare-fun arrayNoDuplicates!0 (array!85403 (_ BitVec 32) List!29299) Bool)

(assert (=> b!1289965 (= res!856941 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29296))))

(declare-fun b!1289966 () Bool)

(declare-fun e!736484 () Bool)

(declare-fun e!736480 () Bool)

(declare-fun mapRes!52916 () Bool)

(assert (=> b!1289966 (= e!736484 (and e!736480 mapRes!52916))))

(declare-fun condMapEmpty!52916 () Bool)

(declare-datatypes ((V!50753 0))(
  ( (V!50754 (val!17193 Int)) )
))
(declare-datatypes ((ValueCell!16220 0))(
  ( (ValueCellFull!16220 (v!19795 V!50753)) (EmptyCell!16220) )
))
(declare-datatypes ((array!85405 0))(
  ( (array!85406 (arr!41204 (Array (_ BitVec 32) ValueCell!16220)) (size!41756 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85405)

(declare-fun mapDefault!52916 () ValueCell!16220)

(assert (=> b!1289966 (= condMapEmpty!52916 (= (arr!41204 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16220)) mapDefault!52916)))))

(declare-fun b!1289967 () Bool)

(declare-fun res!856939 () Bool)

(assert (=> b!1289967 (=> (not res!856939) (not e!736483))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85403 (_ BitVec 32)) Bool)

(assert (=> b!1289967 (= res!856939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289968 () Bool)

(declare-fun res!856936 () Bool)

(assert (=> b!1289968 (=> (not res!856936) (not e!736483))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1289968 (= res!856936 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41755 _keys!1741))))))

(declare-fun b!1289969 () Bool)

(declare-fun e!736485 () Bool)

(declare-fun tp_is_empty!34237 () Bool)

(assert (=> b!1289969 (= e!736485 tp_is_empty!34237)))

(declare-fun b!1289970 () Bool)

(declare-fun res!856935 () Bool)

(assert (=> b!1289970 (=> (not res!856935) (not e!736483))))

(assert (=> b!1289970 (= res!856935 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41755 _keys!1741))))))

(declare-fun mapIsEmpty!52916 () Bool)

(assert (=> mapIsEmpty!52916 mapRes!52916))

(declare-fun b!1289972 () Bool)

(declare-fun e!736482 () Bool)

(assert (=> b!1289972 (= e!736483 (not e!736482))))

(declare-fun res!856937 () Bool)

(assert (=> b!1289972 (=> res!856937 e!736482)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289972 (= res!856937 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22140 0))(
  ( (tuple2!22141 (_1!11081 (_ BitVec 64)) (_2!11081 V!50753)) )
))
(declare-datatypes ((List!29300 0))(
  ( (Nil!29297) (Cons!29296 (h!30505 tuple2!22140) (t!42856 List!29300)) )
))
(declare-datatypes ((ListLongMap!19797 0))(
  ( (ListLongMap!19798 (toList!9914 List!29300)) )
))
(declare-fun contains!7962 (ListLongMap!19797 (_ BitVec 64)) Bool)

(assert (=> b!1289972 (not (contains!7962 (ListLongMap!19798 Nil!29297) k0!1205))))

(declare-datatypes ((Unit!42526 0))(
  ( (Unit!42527) )
))
(declare-fun lt!578276 () Unit!42526)

(declare-fun emptyContainsNothing!63 ((_ BitVec 64)) Unit!42526)

(assert (=> b!1289972 (= lt!578276 (emptyContainsNothing!63 k0!1205))))

(declare-fun b!1289973 () Bool)

(assert (=> b!1289973 (= e!736482 true)))

(declare-fun lt!578277 () ListLongMap!19797)

(declare-fun minValue!1387 () V!50753)

(declare-fun +!4394 (ListLongMap!19797 tuple2!22140) ListLongMap!19797)

(assert (=> b!1289973 (not (contains!7962 (+!4394 lt!578277 (tuple2!22141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578275 () Unit!42526)

(declare-fun addStillNotContains!371 (ListLongMap!19797 (_ BitVec 64) V!50753 (_ BitVec 64)) Unit!42526)

(assert (=> b!1289973 (= lt!578275 (addStillNotContains!371 lt!578277 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50753)

(assert (=> b!1289973 (not (contains!7962 (+!4394 lt!578277 (tuple2!22141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578278 () Unit!42526)

(assert (=> b!1289973 (= lt!578278 (addStillNotContains!371 lt!578277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6025 (array!85403 array!85405 (_ BitVec 32) (_ BitVec 32) V!50753 V!50753 (_ BitVec 32) Int) ListLongMap!19797)

(assert (=> b!1289973 (= lt!578277 (getCurrentListMapNoExtraKeys!6025 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289974 () Bool)

(assert (=> b!1289974 (= e!736480 tp_is_empty!34237)))

(declare-fun mapNonEmpty!52916 () Bool)

(declare-fun tp!100910 () Bool)

(assert (=> mapNonEmpty!52916 (= mapRes!52916 (and tp!100910 e!736485))))

(declare-fun mapKey!52916 () (_ BitVec 32))

(declare-fun mapValue!52916 () ValueCell!16220)

(declare-fun mapRest!52916 () (Array (_ BitVec 32) ValueCell!16220))

(assert (=> mapNonEmpty!52916 (= (arr!41204 _values!1445) (store mapRest!52916 mapKey!52916 mapValue!52916))))

(declare-fun b!1289971 () Bool)

(declare-fun res!856933 () Bool)

(assert (=> b!1289971 (=> (not res!856933) (not e!736483))))

(assert (=> b!1289971 (= res!856933 (and (= (size!41756 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41755 _keys!1741) (size!41756 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!856934 () Bool)

(assert (=> start!109108 (=> (not res!856934) (not e!736483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109108 (= res!856934 (validMask!0 mask!2175))))

(assert (=> start!109108 e!736483))

(assert (=> start!109108 tp_is_empty!34237))

(assert (=> start!109108 true))

(declare-fun array_inv!31393 (array!85405) Bool)

(assert (=> start!109108 (and (array_inv!31393 _values!1445) e!736484)))

(declare-fun array_inv!31394 (array!85403) Bool)

(assert (=> start!109108 (array_inv!31394 _keys!1741)))

(assert (=> start!109108 tp!100911))

(declare-fun b!1289975 () Bool)

(declare-fun res!856938 () Bool)

(assert (=> b!1289975 (=> (not res!856938) (not e!736483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289975 (= res!856938 (not (validKeyInArray!0 (select (arr!41203 _keys!1741) from!2144))))))

(declare-fun b!1289976 () Bool)

(declare-fun res!856940 () Bool)

(assert (=> b!1289976 (=> (not res!856940) (not e!736483))))

(declare-fun getCurrentListMap!4864 (array!85403 array!85405 (_ BitVec 32) (_ BitVec 32) V!50753 V!50753 (_ BitVec 32) Int) ListLongMap!19797)

(assert (=> b!1289976 (= res!856940 (contains!7962 (getCurrentListMap!4864 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109108 res!856934) b!1289971))

(assert (= (and b!1289971 res!856933) b!1289967))

(assert (= (and b!1289967 res!856939) b!1289965))

(assert (= (and b!1289965 res!856941) b!1289970))

(assert (= (and b!1289970 res!856935) b!1289976))

(assert (= (and b!1289976 res!856940) b!1289968))

(assert (= (and b!1289968 res!856936) b!1289975))

(assert (= (and b!1289975 res!856938) b!1289972))

(assert (= (and b!1289972 (not res!856937)) b!1289973))

(assert (= (and b!1289966 condMapEmpty!52916) mapIsEmpty!52916))

(assert (= (and b!1289966 (not condMapEmpty!52916)) mapNonEmpty!52916))

(get-info :version)

(assert (= (and mapNonEmpty!52916 ((_ is ValueCellFull!16220) mapValue!52916)) b!1289969))

(assert (= (and b!1289966 ((_ is ValueCellFull!16220) mapDefault!52916)) b!1289974))

(assert (= start!109108 b!1289966))

(declare-fun m!1182081 () Bool)

(assert (=> b!1289973 m!1182081))

(declare-fun m!1182083 () Bool)

(assert (=> b!1289973 m!1182083))

(declare-fun m!1182085 () Bool)

(assert (=> b!1289973 m!1182085))

(declare-fun m!1182087 () Bool)

(assert (=> b!1289973 m!1182087))

(declare-fun m!1182089 () Bool)

(assert (=> b!1289973 m!1182089))

(declare-fun m!1182091 () Bool)

(assert (=> b!1289973 m!1182091))

(declare-fun m!1182093 () Bool)

(assert (=> b!1289973 m!1182093))

(assert (=> b!1289973 m!1182089))

(assert (=> b!1289973 m!1182081))

(declare-fun m!1182095 () Bool)

(assert (=> b!1289965 m!1182095))

(declare-fun m!1182097 () Bool)

(assert (=> mapNonEmpty!52916 m!1182097))

(declare-fun m!1182099 () Bool)

(assert (=> b!1289976 m!1182099))

(assert (=> b!1289976 m!1182099))

(declare-fun m!1182101 () Bool)

(assert (=> b!1289976 m!1182101))

(declare-fun m!1182103 () Bool)

(assert (=> b!1289975 m!1182103))

(assert (=> b!1289975 m!1182103))

(declare-fun m!1182105 () Bool)

(assert (=> b!1289975 m!1182105))

(declare-fun m!1182107 () Bool)

(assert (=> b!1289972 m!1182107))

(declare-fun m!1182109 () Bool)

(assert (=> b!1289972 m!1182109))

(declare-fun m!1182111 () Bool)

(assert (=> start!109108 m!1182111))

(declare-fun m!1182113 () Bool)

(assert (=> start!109108 m!1182113))

(declare-fun m!1182115 () Bool)

(assert (=> start!109108 m!1182115))

(declare-fun m!1182117 () Bool)

(assert (=> b!1289967 m!1182117))

(check-sat (not b!1289973) tp_is_empty!34237 b_and!46669 (not start!109108) (not b!1289976) (not b_next!28597) (not mapNonEmpty!52916) (not b!1289975) (not b!1289972) (not b!1289965) (not b!1289967))
(check-sat b_and!46669 (not b_next!28597))
