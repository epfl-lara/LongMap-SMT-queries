; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108942 () Bool)

(assert start!108942)

(declare-fun b_free!28231 () Bool)

(declare-fun b_next!28231 () Bool)

(assert (=> start!108942 (= b_free!28231 (not b_next!28231))))

(declare-fun tp!99808 () Bool)

(declare-fun b_and!46299 () Bool)

(assert (=> start!108942 (= tp!99808 b_and!46299)))

(declare-fun b!1284901 () Bool)

(declare-fun res!853190 () Bool)

(declare-fun e!734138 () Bool)

(assert (=> b!1284901 (=> (not res!853190) (not e!734138))))

(declare-datatypes ((V!50265 0))(
  ( (V!50266 (val!17010 Int)) )
))
(declare-fun minValue!1387 () V!50265)

(declare-fun zeroValue!1387 () V!50265)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16037 0))(
  ( (ValueCellFull!16037 (v!19607 V!50265)) (EmptyCell!16037) )
))
(declare-datatypes ((array!84833 0))(
  ( (array!84834 (arr!40914 (Array (_ BitVec 32) ValueCell!16037)) (size!41465 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84833)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84835 0))(
  ( (array!84836 (arr!40915 (Array (_ BitVec 32) (_ BitVec 64))) (size!41466 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84835)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21804 0))(
  ( (tuple2!21805 (_1!10913 (_ BitVec 64)) (_2!10913 V!50265)) )
))
(declare-datatypes ((List!29012 0))(
  ( (Nil!29009) (Cons!29008 (h!30226 tuple2!21804) (t!42548 List!29012)) )
))
(declare-datatypes ((ListLongMap!19469 0))(
  ( (ListLongMap!19470 (toList!9750 List!29012)) )
))
(declare-fun contains!7881 (ListLongMap!19469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4817 (array!84835 array!84833 (_ BitVec 32) (_ BitVec 32) V!50265 V!50265 (_ BitVec 32) Int) ListLongMap!19469)

(assert (=> b!1284901 (= res!853190 (contains!7881 (getCurrentListMap!4817 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284902 () Bool)

(declare-fun e!734140 () Bool)

(declare-fun e!734139 () Bool)

(declare-fun mapRes!52364 () Bool)

(assert (=> b!1284902 (= e!734140 (and e!734139 mapRes!52364))))

(declare-fun condMapEmpty!52364 () Bool)

(declare-fun mapDefault!52364 () ValueCell!16037)

(assert (=> b!1284902 (= condMapEmpty!52364 (= (arr!40914 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16037)) mapDefault!52364)))))

(declare-fun b!1284903 () Bool)

(declare-fun res!853189 () Bool)

(assert (=> b!1284903 (=> (not res!853189) (not e!734138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84835 (_ BitVec 32)) Bool)

(assert (=> b!1284903 (= res!853189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284904 () Bool)

(declare-fun res!853184 () Bool)

(assert (=> b!1284904 (=> (not res!853184) (not e!734138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284904 (= res!853184 (validKeyInArray!0 (select (arr!40915 _keys!1741) from!2144)))))

(declare-fun b!1284905 () Bool)

(declare-fun e!734142 () Bool)

(declare-fun tp_is_empty!33871 () Bool)

(assert (=> b!1284905 (= e!734142 tp_is_empty!33871)))

(declare-fun mapNonEmpty!52364 () Bool)

(declare-fun tp!99809 () Bool)

(assert (=> mapNonEmpty!52364 (= mapRes!52364 (and tp!99809 e!734142))))

(declare-fun mapRest!52364 () (Array (_ BitVec 32) ValueCell!16037))

(declare-fun mapKey!52364 () (_ BitVec 32))

(declare-fun mapValue!52364 () ValueCell!16037)

(assert (=> mapNonEmpty!52364 (= (arr!40914 _values!1445) (store mapRest!52364 mapKey!52364 mapValue!52364))))

(declare-fun b!1284906 () Bool)

(declare-fun res!853186 () Bool)

(assert (=> b!1284906 (=> (not res!853186) (not e!734138))))

(assert (=> b!1284906 (= res!853186 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41466 _keys!1741))))))

(declare-fun mapIsEmpty!52364 () Bool)

(assert (=> mapIsEmpty!52364 mapRes!52364))

(declare-fun b!1284907 () Bool)

(declare-fun res!853191 () Bool)

(assert (=> b!1284907 (=> (not res!853191) (not e!734138))))

(assert (=> b!1284907 (= res!853191 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41466 _keys!1741))))))

(declare-fun res!853188 () Bool)

(assert (=> start!108942 (=> (not res!853188) (not e!734138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108942 (= res!853188 (validMask!0 mask!2175))))

(assert (=> start!108942 e!734138))

(assert (=> start!108942 tp_is_empty!33871))

(assert (=> start!108942 true))

(declare-fun array_inv!31247 (array!84833) Bool)

(assert (=> start!108942 (and (array_inv!31247 _values!1445) e!734140)))

(declare-fun array_inv!31248 (array!84835) Bool)

(assert (=> start!108942 (array_inv!31248 _keys!1741)))

(assert (=> start!108942 tp!99808))

(declare-fun b!1284908 () Bool)

(declare-fun res!853185 () Bool)

(assert (=> b!1284908 (=> (not res!853185) (not e!734138))))

(declare-datatypes ((List!29013 0))(
  ( (Nil!29010) (Cons!29009 (h!30227 (_ BitVec 64)) (t!42549 List!29013)) )
))
(declare-fun arrayNoDuplicates!0 (array!84835 (_ BitVec 32) List!29013) Bool)

(assert (=> b!1284908 (= res!853185 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29010))))

(declare-fun b!1284909 () Bool)

(declare-fun res!853192 () Bool)

(assert (=> b!1284909 (=> (not res!853192) (not e!734138))))

(assert (=> b!1284909 (= res!853192 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284910 () Bool)

(assert (=> b!1284910 (= e!734138 (not true))))

(declare-fun lt!577166 () ListLongMap!19469)

(assert (=> b!1284910 (contains!7881 lt!577166 k0!1205)))

(declare-datatypes ((Unit!42442 0))(
  ( (Unit!42443) )
))
(declare-fun lt!577165 () Unit!42442)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!11 ((_ BitVec 64) (_ BitVec 64) V!50265 ListLongMap!19469) Unit!42442)

(assert (=> b!1284910 (= lt!577165 (lemmaInListMapAfterAddingDiffThenInBefore!11 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577166))))

(declare-fun +!4336 (ListLongMap!19469 tuple2!21804) ListLongMap!19469)

(declare-fun getCurrentListMapNoExtraKeys!5968 (array!84835 array!84833 (_ BitVec 32) (_ BitVec 32) V!50265 V!50265 (_ BitVec 32) Int) ListLongMap!19469)

(assert (=> b!1284910 (= lt!577166 (+!4336 (getCurrentListMapNoExtraKeys!5968 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284911 () Bool)

(declare-fun res!853187 () Bool)

(assert (=> b!1284911 (=> (not res!853187) (not e!734138))))

(assert (=> b!1284911 (= res!853187 (and (= (size!41465 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41466 _keys!1741) (size!41465 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284912 () Bool)

(assert (=> b!1284912 (= e!734139 tp_is_empty!33871)))

(assert (= (and start!108942 res!853188) b!1284911))

(assert (= (and b!1284911 res!853187) b!1284903))

(assert (= (and b!1284903 res!853189) b!1284908))

(assert (= (and b!1284908 res!853185) b!1284906))

(assert (= (and b!1284906 res!853186) b!1284901))

(assert (= (and b!1284901 res!853190) b!1284907))

(assert (= (and b!1284907 res!853191) b!1284904))

(assert (= (and b!1284904 res!853184) b!1284909))

(assert (= (and b!1284909 res!853192) b!1284910))

(assert (= (and b!1284902 condMapEmpty!52364) mapIsEmpty!52364))

(assert (= (and b!1284902 (not condMapEmpty!52364)) mapNonEmpty!52364))

(get-info :version)

(assert (= (and mapNonEmpty!52364 ((_ is ValueCellFull!16037) mapValue!52364)) b!1284905))

(assert (= (and b!1284902 ((_ is ValueCellFull!16037) mapDefault!52364)) b!1284912))

(assert (= start!108942 b!1284902))

(declare-fun m!1179097 () Bool)

(assert (=> start!108942 m!1179097))

(declare-fun m!1179099 () Bool)

(assert (=> start!108942 m!1179099))

(declare-fun m!1179101 () Bool)

(assert (=> start!108942 m!1179101))

(declare-fun m!1179103 () Bool)

(assert (=> b!1284901 m!1179103))

(assert (=> b!1284901 m!1179103))

(declare-fun m!1179105 () Bool)

(assert (=> b!1284901 m!1179105))

(declare-fun m!1179107 () Bool)

(assert (=> mapNonEmpty!52364 m!1179107))

(declare-fun m!1179109 () Bool)

(assert (=> b!1284910 m!1179109))

(declare-fun m!1179111 () Bool)

(assert (=> b!1284910 m!1179111))

(declare-fun m!1179113 () Bool)

(assert (=> b!1284910 m!1179113))

(assert (=> b!1284910 m!1179113))

(declare-fun m!1179115 () Bool)

(assert (=> b!1284910 m!1179115))

(declare-fun m!1179117 () Bool)

(assert (=> b!1284903 m!1179117))

(declare-fun m!1179119 () Bool)

(assert (=> b!1284904 m!1179119))

(assert (=> b!1284904 m!1179119))

(declare-fun m!1179121 () Bool)

(assert (=> b!1284904 m!1179121))

(declare-fun m!1179123 () Bool)

(assert (=> b!1284908 m!1179123))

(check-sat (not b!1284904) (not b!1284903) (not mapNonEmpty!52364) (not b!1284908) (not b!1284901) (not b!1284910) tp_is_empty!33871 (not b_next!28231) (not start!108942) b_and!46299)
(check-sat b_and!46299 (not b_next!28231))
