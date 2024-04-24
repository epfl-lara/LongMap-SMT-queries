; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108930 () Bool)

(assert start!108930)

(declare-fun b_free!28219 () Bool)

(declare-fun b_next!28219 () Bool)

(assert (=> start!108930 (= b_free!28219 (not b_next!28219))))

(declare-fun tp!99772 () Bool)

(declare-fun b_and!46287 () Bool)

(assert (=> start!108930 (= tp!99772 b_and!46287)))

(declare-fun b!1284685 () Bool)

(declare-fun res!853026 () Bool)

(declare-fun e!734048 () Bool)

(assert (=> b!1284685 (=> (not res!853026) (not e!734048))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84809 0))(
  ( (array!84810 (arr!40902 (Array (_ BitVec 32) (_ BitVec 64))) (size!41453 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84809)

(assert (=> b!1284685 (= res!853026 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41453 _keys!1741))))))

(declare-fun b!1284686 () Bool)

(declare-fun e!734052 () Bool)

(declare-fun tp_is_empty!33859 () Bool)

(assert (=> b!1284686 (= e!734052 tp_is_empty!33859)))

(declare-fun b!1284687 () Bool)

(declare-fun res!853028 () Bool)

(assert (=> b!1284687 (=> (not res!853028) (not e!734048))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284687 (= res!853028 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!853030 () Bool)

(assert (=> start!108930 (=> (not res!853030) (not e!734048))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108930 (= res!853030 (validMask!0 mask!2175))))

(assert (=> start!108930 e!734048))

(assert (=> start!108930 tp_is_empty!33859))

(assert (=> start!108930 true))

(declare-datatypes ((V!50249 0))(
  ( (V!50250 (val!17004 Int)) )
))
(declare-datatypes ((ValueCell!16031 0))(
  ( (ValueCellFull!16031 (v!19601 V!50249)) (EmptyCell!16031) )
))
(declare-datatypes ((array!84811 0))(
  ( (array!84812 (arr!40903 (Array (_ BitVec 32) ValueCell!16031)) (size!41454 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84811)

(declare-fun e!734051 () Bool)

(declare-fun array_inv!31235 (array!84811) Bool)

(assert (=> start!108930 (and (array_inv!31235 _values!1445) e!734051)))

(declare-fun array_inv!31236 (array!84809) Bool)

(assert (=> start!108930 (array_inv!31236 _keys!1741)))

(assert (=> start!108930 tp!99772))

(declare-fun b!1284688 () Bool)

(declare-fun res!853023 () Bool)

(assert (=> b!1284688 (=> (not res!853023) (not e!734048))))

(assert (=> b!1284688 (= res!853023 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41453 _keys!1741))))))

(declare-fun b!1284689 () Bool)

(declare-fun res!853025 () Bool)

(assert (=> b!1284689 (=> (not res!853025) (not e!734048))))

(declare-datatypes ((List!29004 0))(
  ( (Nil!29001) (Cons!29000 (h!30218 (_ BitVec 64)) (t!42540 List!29004)) )
))
(declare-fun arrayNoDuplicates!0 (array!84809 (_ BitVec 32) List!29004) Bool)

(assert (=> b!1284689 (= res!853025 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29001))))

(declare-fun b!1284690 () Bool)

(declare-fun res!853022 () Bool)

(assert (=> b!1284690 (=> (not res!853022) (not e!734048))))

(declare-fun minValue!1387 () V!50249)

(declare-fun zeroValue!1387 () V!50249)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21792 0))(
  ( (tuple2!21793 (_1!10907 (_ BitVec 64)) (_2!10907 V!50249)) )
))
(declare-datatypes ((List!29005 0))(
  ( (Nil!29002) (Cons!29001 (h!30219 tuple2!21792) (t!42541 List!29005)) )
))
(declare-datatypes ((ListLongMap!19457 0))(
  ( (ListLongMap!19458 (toList!9744 List!29005)) )
))
(declare-fun contains!7875 (ListLongMap!19457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4811 (array!84809 array!84811 (_ BitVec 32) (_ BitVec 32) V!50249 V!50249 (_ BitVec 32) Int) ListLongMap!19457)

(assert (=> b!1284690 (= res!853022 (contains!7875 (getCurrentListMap!4811 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284691 () Bool)

(assert (=> b!1284691 (= e!734048 (not true))))

(declare-fun lt!577129 () ListLongMap!19457)

(assert (=> b!1284691 (contains!7875 lt!577129 k0!1205)))

(declare-datatypes ((Unit!42432 0))(
  ( (Unit!42433) )
))
(declare-fun lt!577130 () Unit!42432)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!6 ((_ BitVec 64) (_ BitVec 64) V!50249 ListLongMap!19457) Unit!42432)

(assert (=> b!1284691 (= lt!577130 (lemmaInListMapAfterAddingDiffThenInBefore!6 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577129))))

(declare-fun +!4331 (ListLongMap!19457 tuple2!21792) ListLongMap!19457)

(declare-fun getCurrentListMapNoExtraKeys!5963 (array!84809 array!84811 (_ BitVec 32) (_ BitVec 32) V!50249 V!50249 (_ BitVec 32) Int) ListLongMap!19457)

(assert (=> b!1284691 (= lt!577129 (+!4331 (getCurrentListMapNoExtraKeys!5963 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284692 () Bool)

(declare-fun res!853024 () Bool)

(assert (=> b!1284692 (=> (not res!853024) (not e!734048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84809 (_ BitVec 32)) Bool)

(assert (=> b!1284692 (= res!853024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52346 () Bool)

(declare-fun mapRes!52346 () Bool)

(assert (=> mapIsEmpty!52346 mapRes!52346))

(declare-fun b!1284693 () Bool)

(declare-fun res!853027 () Bool)

(assert (=> b!1284693 (=> (not res!853027) (not e!734048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284693 (= res!853027 (validKeyInArray!0 (select (arr!40902 _keys!1741) from!2144)))))

(declare-fun b!1284694 () Bool)

(declare-fun e!734050 () Bool)

(assert (=> b!1284694 (= e!734050 tp_is_empty!33859)))

(declare-fun b!1284695 () Bool)

(assert (=> b!1284695 (= e!734051 (and e!734050 mapRes!52346))))

(declare-fun condMapEmpty!52346 () Bool)

(declare-fun mapDefault!52346 () ValueCell!16031)

(assert (=> b!1284695 (= condMapEmpty!52346 (= (arr!40903 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16031)) mapDefault!52346)))))

(declare-fun mapNonEmpty!52346 () Bool)

(declare-fun tp!99773 () Bool)

(assert (=> mapNonEmpty!52346 (= mapRes!52346 (and tp!99773 e!734052))))

(declare-fun mapValue!52346 () ValueCell!16031)

(declare-fun mapKey!52346 () (_ BitVec 32))

(declare-fun mapRest!52346 () (Array (_ BitVec 32) ValueCell!16031))

(assert (=> mapNonEmpty!52346 (= (arr!40903 _values!1445) (store mapRest!52346 mapKey!52346 mapValue!52346))))

(declare-fun b!1284696 () Bool)

(declare-fun res!853029 () Bool)

(assert (=> b!1284696 (=> (not res!853029) (not e!734048))))

(assert (=> b!1284696 (= res!853029 (and (= (size!41454 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41453 _keys!1741) (size!41454 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108930 res!853030) b!1284696))

(assert (= (and b!1284696 res!853029) b!1284692))

(assert (= (and b!1284692 res!853024) b!1284689))

(assert (= (and b!1284689 res!853025) b!1284688))

(assert (= (and b!1284688 res!853023) b!1284690))

(assert (= (and b!1284690 res!853022) b!1284685))

(assert (= (and b!1284685 res!853026) b!1284693))

(assert (= (and b!1284693 res!853027) b!1284687))

(assert (= (and b!1284687 res!853028) b!1284691))

(assert (= (and b!1284695 condMapEmpty!52346) mapIsEmpty!52346))

(assert (= (and b!1284695 (not condMapEmpty!52346)) mapNonEmpty!52346))

(get-info :version)

(assert (= (and mapNonEmpty!52346 ((_ is ValueCellFull!16031) mapValue!52346)) b!1284686))

(assert (= (and b!1284695 ((_ is ValueCellFull!16031) mapDefault!52346)) b!1284694))

(assert (= start!108930 b!1284695))

(declare-fun m!1178929 () Bool)

(assert (=> b!1284693 m!1178929))

(assert (=> b!1284693 m!1178929))

(declare-fun m!1178931 () Bool)

(assert (=> b!1284693 m!1178931))

(declare-fun m!1178933 () Bool)

(assert (=> b!1284691 m!1178933))

(declare-fun m!1178935 () Bool)

(assert (=> b!1284691 m!1178935))

(declare-fun m!1178937 () Bool)

(assert (=> b!1284691 m!1178937))

(assert (=> b!1284691 m!1178937))

(declare-fun m!1178939 () Bool)

(assert (=> b!1284691 m!1178939))

(declare-fun m!1178941 () Bool)

(assert (=> start!108930 m!1178941))

(declare-fun m!1178943 () Bool)

(assert (=> start!108930 m!1178943))

(declare-fun m!1178945 () Bool)

(assert (=> start!108930 m!1178945))

(declare-fun m!1178947 () Bool)

(assert (=> b!1284692 m!1178947))

(declare-fun m!1178949 () Bool)

(assert (=> b!1284689 m!1178949))

(declare-fun m!1178951 () Bool)

(assert (=> b!1284690 m!1178951))

(assert (=> b!1284690 m!1178951))

(declare-fun m!1178953 () Bool)

(assert (=> b!1284690 m!1178953))

(declare-fun m!1178955 () Bool)

(assert (=> mapNonEmpty!52346 m!1178955))

(check-sat (not b!1284690) (not b!1284689) (not b!1284691) (not b_next!28219) (not start!108930) (not b!1284693) tp_is_empty!33859 b_and!46287 (not mapNonEmpty!52346) (not b!1284692))
(check-sat b_and!46287 (not b_next!28219))
