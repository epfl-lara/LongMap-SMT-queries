; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108678 () Bool)

(assert start!108678)

(declare-fun b_free!28191 () Bool)

(declare-fun b_next!28191 () Bool)

(assert (=> start!108678 (= b_free!28191 (not b_next!28191))))

(declare-fun tp!99688 () Bool)

(declare-fun b_and!46257 () Bool)

(assert (=> start!108678 (= tp!99688 b_and!46257)))

(declare-fun b!1282876 () Bool)

(declare-fun res!852124 () Bool)

(declare-fun e!732993 () Bool)

(assert (=> b!1282876 (=> (not res!852124) (not e!732993))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84730 0))(
  ( (array!84731 (arr!40867 (Array (_ BitVec 32) (_ BitVec 64))) (size!41417 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84730)

(assert (=> b!1282876 (= res!852124 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41417 _keys!1741))))))

(declare-fun b!1282877 () Bool)

(declare-fun res!852125 () Bool)

(assert (=> b!1282877 (=> (not res!852125) (not e!732993))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84730 (_ BitVec 32)) Bool)

(assert (=> b!1282877 (= res!852125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282878 () Bool)

(declare-fun res!852126 () Bool)

(assert (=> b!1282878 (=> (not res!852126) (not e!732993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282878 (= res!852126 (validKeyInArray!0 (select (arr!40867 _keys!1741) from!2144)))))

(declare-fun mapIsEmpty!52304 () Bool)

(declare-fun mapRes!52304 () Bool)

(assert (=> mapIsEmpty!52304 mapRes!52304))

(declare-fun b!1282879 () Bool)

(declare-fun res!852130 () Bool)

(assert (=> b!1282879 (=> (not res!852130) (not e!732993))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282879 (= res!852130 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1282880 () Bool)

(declare-fun e!732994 () Bool)

(declare-fun tp_is_empty!33831 () Bool)

(assert (=> b!1282880 (= e!732994 tp_is_empty!33831)))

(declare-fun mapNonEmpty!52304 () Bool)

(declare-fun tp!99689 () Bool)

(declare-fun e!732995 () Bool)

(assert (=> mapNonEmpty!52304 (= mapRes!52304 (and tp!99689 e!732995))))

(declare-datatypes ((V!50211 0))(
  ( (V!50212 (val!16990 Int)) )
))
(declare-datatypes ((ValueCell!16017 0))(
  ( (ValueCellFull!16017 (v!19592 V!50211)) (EmptyCell!16017) )
))
(declare-fun mapRest!52304 () (Array (_ BitVec 32) ValueCell!16017))

(declare-datatypes ((array!84732 0))(
  ( (array!84733 (arr!40868 (Array (_ BitVec 32) ValueCell!16017)) (size!41418 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84732)

(declare-fun mapValue!52304 () ValueCell!16017)

(declare-fun mapKey!52304 () (_ BitVec 32))

(assert (=> mapNonEmpty!52304 (= (arr!40868 _values!1445) (store mapRest!52304 mapKey!52304 mapValue!52304))))

(declare-fun b!1282881 () Bool)

(assert (=> b!1282881 (= e!732995 tp_is_empty!33831)))

(declare-fun b!1282883 () Bool)

(declare-fun res!852131 () Bool)

(assert (=> b!1282883 (=> (not res!852131) (not e!732993))))

(declare-fun minValue!1387 () V!50211)

(declare-fun zeroValue!1387 () V!50211)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21758 0))(
  ( (tuple2!21759 (_1!10890 (_ BitVec 64)) (_2!10890 V!50211)) )
))
(declare-datatypes ((List!28955 0))(
  ( (Nil!28952) (Cons!28951 (h!30160 tuple2!21758) (t!42499 List!28955)) )
))
(declare-datatypes ((ListLongMap!19415 0))(
  ( (ListLongMap!19416 (toList!9723 List!28955)) )
))
(declare-fun contains!7840 (ListLongMap!19415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4807 (array!84730 array!84732 (_ BitVec 32) (_ BitVec 32) V!50211 V!50211 (_ BitVec 32) Int) ListLongMap!19415)

(assert (=> b!1282883 (= res!852131 (contains!7840 (getCurrentListMap!4807 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282884 () Bool)

(declare-fun res!852132 () Bool)

(assert (=> b!1282884 (=> (not res!852132) (not e!732993))))

(declare-datatypes ((List!28956 0))(
  ( (Nil!28953) (Cons!28952 (h!30161 (_ BitVec 64)) (t!42500 List!28956)) )
))
(declare-fun arrayNoDuplicates!0 (array!84730 (_ BitVec 32) List!28956) Bool)

(assert (=> b!1282884 (= res!852132 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28953))))

(declare-fun b!1282885 () Bool)

(declare-fun e!732992 () Bool)

(assert (=> b!1282885 (= e!732992 (and e!732994 mapRes!52304))))

(declare-fun condMapEmpty!52304 () Bool)

(declare-fun mapDefault!52304 () ValueCell!16017)

(assert (=> b!1282885 (= condMapEmpty!52304 (= (arr!40868 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16017)) mapDefault!52304)))))

(declare-fun b!1282882 () Bool)

(declare-fun res!852127 () Bool)

(assert (=> b!1282882 (=> (not res!852127) (not e!732993))))

(assert (=> b!1282882 (= res!852127 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41417 _keys!1741))))))

(declare-fun res!852129 () Bool)

(assert (=> start!108678 (=> (not res!852129) (not e!732993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108678 (= res!852129 (validMask!0 mask!2175))))

(assert (=> start!108678 e!732993))

(assert (=> start!108678 tp_is_empty!33831))

(assert (=> start!108678 true))

(declare-fun array_inv!31003 (array!84732) Bool)

(assert (=> start!108678 (and (array_inv!31003 _values!1445) e!732992)))

(declare-fun array_inv!31004 (array!84730) Bool)

(assert (=> start!108678 (array_inv!31004 _keys!1741)))

(assert (=> start!108678 tp!99688))

(declare-fun b!1282886 () Bool)

(assert (=> b!1282886 (= e!732993 false)))

(declare-fun lt!576574 () Bool)

(declare-fun +!4275 (ListLongMap!19415 tuple2!21758) ListLongMap!19415)

(declare-fun getCurrentListMapNoExtraKeys!5905 (array!84730 array!84732 (_ BitVec 32) (_ BitVec 32) V!50211 V!50211 (_ BitVec 32) Int) ListLongMap!19415)

(assert (=> b!1282886 (= lt!576574 (contains!7840 (+!4275 (+!4275 (getCurrentListMapNoExtraKeys!5905 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!21759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1282887 () Bool)

(declare-fun res!852128 () Bool)

(assert (=> b!1282887 (=> (not res!852128) (not e!732993))))

(assert (=> b!1282887 (= res!852128 (and (= (size!41418 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41417 _keys!1741) (size!41418 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108678 res!852129) b!1282887))

(assert (= (and b!1282887 res!852128) b!1282877))

(assert (= (and b!1282877 res!852125) b!1282884))

(assert (= (and b!1282884 res!852132) b!1282876))

(assert (= (and b!1282876 res!852124) b!1282883))

(assert (= (and b!1282883 res!852131) b!1282882))

(assert (= (and b!1282882 res!852127) b!1282878))

(assert (= (and b!1282878 res!852126) b!1282879))

(assert (= (and b!1282879 res!852130) b!1282886))

(assert (= (and b!1282885 condMapEmpty!52304) mapIsEmpty!52304))

(assert (= (and b!1282885 (not condMapEmpty!52304)) mapNonEmpty!52304))

(get-info :version)

(assert (= (and mapNonEmpty!52304 ((_ is ValueCellFull!16017) mapValue!52304)) b!1282881))

(assert (= (and b!1282885 ((_ is ValueCellFull!16017) mapDefault!52304)) b!1282880))

(assert (= start!108678 b!1282885))

(declare-fun m!1176925 () Bool)

(assert (=> start!108678 m!1176925))

(declare-fun m!1176927 () Bool)

(assert (=> start!108678 m!1176927))

(declare-fun m!1176929 () Bool)

(assert (=> start!108678 m!1176929))

(declare-fun m!1176931 () Bool)

(assert (=> b!1282884 m!1176931))

(declare-fun m!1176933 () Bool)

(assert (=> b!1282883 m!1176933))

(assert (=> b!1282883 m!1176933))

(declare-fun m!1176935 () Bool)

(assert (=> b!1282883 m!1176935))

(declare-fun m!1176937 () Bool)

(assert (=> mapNonEmpty!52304 m!1176937))

(declare-fun m!1176939 () Bool)

(assert (=> b!1282886 m!1176939))

(assert (=> b!1282886 m!1176939))

(declare-fun m!1176941 () Bool)

(assert (=> b!1282886 m!1176941))

(assert (=> b!1282886 m!1176941))

(declare-fun m!1176943 () Bool)

(assert (=> b!1282886 m!1176943))

(assert (=> b!1282886 m!1176943))

(declare-fun m!1176945 () Bool)

(assert (=> b!1282886 m!1176945))

(declare-fun m!1176947 () Bool)

(assert (=> b!1282877 m!1176947))

(declare-fun m!1176949 () Bool)

(assert (=> b!1282878 m!1176949))

(assert (=> b!1282878 m!1176949))

(declare-fun m!1176951 () Bool)

(assert (=> b!1282878 m!1176951))

(check-sat (not b!1282886) (not b!1282884) b_and!46257 tp_is_empty!33831 (not b!1282878) (not start!108678) (not b!1282877) (not b!1282883) (not mapNonEmpty!52304) (not b_next!28191))
(check-sat b_and!46257 (not b_next!28191))
