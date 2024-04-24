; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110022 () Bool)

(assert start!110022)

(declare-fun b_free!29191 () Bool)

(declare-fun b_next!29191 () Bool)

(assert (=> start!110022 (= b_free!29191 (not b_next!29191))))

(declare-fun tp!102706 () Bool)

(declare-fun b_and!47307 () Bool)

(assert (=> start!110022 (= tp!102706 b_and!47307)))

(declare-fun b!1301907 () Bool)

(declare-fun res!864789 () Bool)

(declare-fun e!742736 () Bool)

(assert (=> b!1301907 (=> (not res!864789) (not e!742736))))

(declare-datatypes ((array!86713 0))(
  ( (array!86714 (arr!41848 (Array (_ BitVec 32) (_ BitVec 64))) (size!42399 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86713)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86713 (_ BitVec 32)) Bool)

(assert (=> b!1301907 (= res!864789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301908 () Bool)

(assert (=> b!1301908 (= e!742736 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51545 0))(
  ( (V!51546 (val!17490 Int)) )
))
(declare-datatypes ((tuple2!22574 0))(
  ( (tuple2!22575 (_1!11298 (_ BitVec 64)) (_2!11298 V!51545)) )
))
(declare-datatypes ((List!29731 0))(
  ( (Nil!29728) (Cons!29727 (h!30945 tuple2!22574) (t!43297 List!29731)) )
))
(declare-datatypes ((ListLongMap!20239 0))(
  ( (ListLongMap!20240 (toList!10135 List!29731)) )
))
(declare-fun contains!8273 (ListLongMap!20239 (_ BitVec 64)) Bool)

(assert (=> b!1301908 (not (contains!8273 (ListLongMap!20240 Nil!29728) k0!1205))))

(declare-datatypes ((Unit!43008 0))(
  ( (Unit!43009) )
))
(declare-fun lt!581918 () Unit!43008)

(declare-fun emptyContainsNothing!197 ((_ BitVec 64)) Unit!43008)

(assert (=> b!1301908 (= lt!581918 (emptyContainsNothing!197 k0!1205))))

(declare-fun lt!581915 () Unit!43008)

(declare-fun e!742737 () Unit!43008)

(assert (=> b!1301908 (= lt!581915 e!742737)))

(declare-fun c!125007 () Bool)

(declare-fun lt!581911 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1301908 (= c!125007 (and (not lt!581911) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301908 (= lt!581911 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1301909 () Bool)

(declare-fun c!125006 () Bool)

(assert (=> b!1301909 (= c!125006 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581911))))

(declare-fun e!742738 () Unit!43008)

(declare-fun e!742740 () Unit!43008)

(assert (=> b!1301909 (= e!742738 e!742740)))

(declare-fun bm!63735 () Bool)

(declare-fun call!63739 () ListLongMap!20239)

(declare-fun call!63743 () ListLongMap!20239)

(assert (=> bm!63735 (= call!63739 call!63743)))

(declare-fun lt!581914 () ListLongMap!20239)

(declare-fun bm!63736 () Bool)

(declare-fun lt!581919 () ListLongMap!20239)

(declare-fun call!63740 () Bool)

(declare-fun lt!581917 () ListLongMap!20239)

(declare-fun c!125005 () Bool)

(assert (=> bm!63736 (= call!63740 (contains!8273 (ite c!125007 lt!581919 (ite c!125005 lt!581914 lt!581917)) k0!1205))))

(declare-fun b!1301910 () Bool)

(declare-fun res!864795 () Bool)

(assert (=> b!1301910 (=> (not res!864795) (not e!742736))))

(declare-fun minValue!1387 () V!51545)

(declare-fun zeroValue!1387 () V!51545)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16517 0))(
  ( (ValueCellFull!16517 (v!20093 V!51545)) (EmptyCell!16517) )
))
(declare-datatypes ((array!86715 0))(
  ( (array!86716 (arr!41849 (Array (_ BitVec 32) ValueCell!16517)) (size!42400 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86715)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5151 (array!86713 array!86715 (_ BitVec 32) (_ BitVec 32) V!51545 V!51545 (_ BitVec 32) Int) ListLongMap!20239)

(assert (=> b!1301910 (= res!864795 (contains!8273 (getCurrentListMap!5151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1301911 () Bool)

(declare-fun e!742741 () Bool)

(declare-fun e!742742 () Bool)

(declare-fun mapRes!53822 () Bool)

(assert (=> b!1301911 (= e!742741 (and e!742742 mapRes!53822))))

(declare-fun condMapEmpty!53822 () Bool)

(declare-fun mapDefault!53822 () ValueCell!16517)

(assert (=> b!1301911 (= condMapEmpty!53822 (= (arr!41849 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16517)) mapDefault!53822)))))

(declare-fun b!1301912 () Bool)

(declare-fun Unit!43010 () Unit!43008)

(assert (=> b!1301912 (= e!742740 Unit!43010)))

(declare-fun b!1301913 () Bool)

(declare-fun res!864788 () Bool)

(assert (=> b!1301913 (=> (not res!864788) (not e!742736))))

(assert (=> b!1301913 (= res!864788 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42399 _keys!1741))))))

(declare-fun bm!63737 () Bool)

(declare-fun call!63741 () Unit!43008)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!79 ((_ BitVec 64) (_ BitVec 64) V!51545 ListLongMap!20239) Unit!43008)

(assert (=> bm!63737 (= call!63741 (lemmaInListMapAfterAddingDiffThenInBefore!79 k0!1205 (ite (or c!125007 c!125005) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125007 c!125005) zeroValue!1387 minValue!1387) (ite c!125007 lt!581919 (ite c!125005 lt!581914 lt!581917))))))

(declare-fun res!864793 () Bool)

(assert (=> start!110022 (=> (not res!864793) (not e!742736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110022 (= res!864793 (validMask!0 mask!2175))))

(assert (=> start!110022 e!742736))

(declare-fun tp_is_empty!34831 () Bool)

(assert (=> start!110022 tp_is_empty!34831))

(assert (=> start!110022 true))

(declare-fun array_inv!31903 (array!86715) Bool)

(assert (=> start!110022 (and (array_inv!31903 _values!1445) e!742741)))

(declare-fun array_inv!31904 (array!86713) Bool)

(assert (=> start!110022 (array_inv!31904 _keys!1741)))

(assert (=> start!110022 tp!102706))

(declare-fun b!1301914 () Bool)

(declare-fun res!864792 () Bool)

(assert (=> b!1301914 (=> (not res!864792) (not e!742736))))

(declare-datatypes ((List!29732 0))(
  ( (Nil!29729) (Cons!29728 (h!30946 (_ BitVec 64)) (t!43298 List!29732)) )
))
(declare-fun arrayNoDuplicates!0 (array!86713 (_ BitVec 32) List!29732) Bool)

(assert (=> b!1301914 (= res!864792 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29729))))

(declare-fun b!1301915 () Bool)

(assert (=> b!1301915 (= e!742737 e!742738)))

(assert (=> b!1301915 (= c!125005 (and (not lt!581911) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!53822 () Bool)

(declare-fun tp!102707 () Bool)

(declare-fun e!742743 () Bool)

(assert (=> mapNonEmpty!53822 (= mapRes!53822 (and tp!102707 e!742743))))

(declare-fun mapRest!53822 () (Array (_ BitVec 32) ValueCell!16517))

(declare-fun mapKey!53822 () (_ BitVec 32))

(declare-fun mapValue!53822 () ValueCell!16517)

(assert (=> mapNonEmpty!53822 (= (arr!41849 _values!1445) (store mapRest!53822 mapKey!53822 mapValue!53822))))

(declare-fun bm!63738 () Bool)

(declare-fun call!63738 () Bool)

(assert (=> bm!63738 (= call!63738 call!63740)))

(declare-fun bm!63739 () Bool)

(declare-fun call!63742 () Unit!43008)

(assert (=> bm!63739 (= call!63742 call!63741)))

(declare-fun b!1301916 () Bool)

(declare-fun res!864791 () Bool)

(assert (=> b!1301916 (=> (not res!864791) (not e!742736))))

(assert (=> b!1301916 (= res!864791 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42399 _keys!1741))))))

(declare-fun b!1301917 () Bool)

(declare-fun res!864790 () Bool)

(assert (=> b!1301917 (=> (not res!864790) (not e!742736))))

(assert (=> b!1301917 (= res!864790 (and (= (size!42400 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42399 _keys!1741) (size!42400 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53822 () Bool)

(assert (=> mapIsEmpty!53822 mapRes!53822))

(declare-fun b!1301918 () Bool)

(declare-fun lt!581912 () Unit!43008)

(assert (=> b!1301918 (= e!742740 lt!581912)))

(assert (=> b!1301918 (= lt!581917 call!63739)))

(assert (=> b!1301918 (= lt!581912 call!63742)))

(assert (=> b!1301918 call!63738))

(declare-fun bm!63740 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6144 (array!86713 array!86715 (_ BitVec 32) (_ BitVec 32) V!51545 V!51545 (_ BitVec 32) Int) ListLongMap!20239)

(assert (=> bm!63740 (= call!63743 (getCurrentListMapNoExtraKeys!6144 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301919 () Bool)

(assert (=> b!1301919 call!63738))

(declare-fun lt!581910 () Unit!43008)

(assert (=> b!1301919 (= lt!581910 call!63742)))

(assert (=> b!1301919 (= lt!581914 call!63739)))

(assert (=> b!1301919 (= e!742738 lt!581910)))

(declare-fun b!1301920 () Bool)

(declare-fun lt!581913 () Unit!43008)

(assert (=> b!1301920 (= e!742737 lt!581913)))

(assert (=> b!1301920 (= lt!581919 call!63743)))

(declare-fun lt!581916 () ListLongMap!20239)

(declare-fun +!4504 (ListLongMap!20239 tuple2!22574) ListLongMap!20239)

(assert (=> b!1301920 (= lt!581916 (+!4504 lt!581919 (tuple2!22575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581909 () Unit!43008)

(assert (=> b!1301920 (= lt!581909 (lemmaInListMapAfterAddingDiffThenInBefore!79 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581916))))

(assert (=> b!1301920 (contains!8273 lt!581916 k0!1205)))

(assert (=> b!1301920 (= lt!581913 call!63741)))

(assert (=> b!1301920 call!63740))

(declare-fun b!1301921 () Bool)

(declare-fun res!864794 () Bool)

(assert (=> b!1301921 (=> (not res!864794) (not e!742736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301921 (= res!864794 (validKeyInArray!0 (select (arr!41848 _keys!1741) from!2144)))))

(declare-fun b!1301922 () Bool)

(assert (=> b!1301922 (= e!742742 tp_is_empty!34831)))

(declare-fun b!1301923 () Bool)

(assert (=> b!1301923 (= e!742743 tp_is_empty!34831)))

(assert (= (and start!110022 res!864793) b!1301917))

(assert (= (and b!1301917 res!864790) b!1301907))

(assert (= (and b!1301907 res!864789) b!1301914))

(assert (= (and b!1301914 res!864792) b!1301913))

(assert (= (and b!1301913 res!864788) b!1301910))

(assert (= (and b!1301910 res!864795) b!1301916))

(assert (= (and b!1301916 res!864791) b!1301921))

(assert (= (and b!1301921 res!864794) b!1301908))

(assert (= (and b!1301908 c!125007) b!1301920))

(assert (= (and b!1301908 (not c!125007)) b!1301915))

(assert (= (and b!1301915 c!125005) b!1301919))

(assert (= (and b!1301915 (not c!125005)) b!1301909))

(assert (= (and b!1301909 c!125006) b!1301918))

(assert (= (and b!1301909 (not c!125006)) b!1301912))

(assert (= (or b!1301919 b!1301918) bm!63735))

(assert (= (or b!1301919 b!1301918) bm!63739))

(assert (= (or b!1301919 b!1301918) bm!63738))

(assert (= (or b!1301920 bm!63735) bm!63740))

(assert (= (or b!1301920 bm!63739) bm!63737))

(assert (= (or b!1301920 bm!63738) bm!63736))

(assert (= (and b!1301911 condMapEmpty!53822) mapIsEmpty!53822))

(assert (= (and b!1301911 (not condMapEmpty!53822)) mapNonEmpty!53822))

(get-info :version)

(assert (= (and mapNonEmpty!53822 ((_ is ValueCellFull!16517) mapValue!53822)) b!1301923))

(assert (= (and b!1301911 ((_ is ValueCellFull!16517) mapDefault!53822)) b!1301922))

(assert (= start!110022 b!1301911))

(declare-fun m!1193099 () Bool)

(assert (=> mapNonEmpty!53822 m!1193099))

(declare-fun m!1193101 () Bool)

(assert (=> bm!63737 m!1193101))

(declare-fun m!1193103 () Bool)

(assert (=> bm!63740 m!1193103))

(declare-fun m!1193105 () Bool)

(assert (=> b!1301921 m!1193105))

(assert (=> b!1301921 m!1193105))

(declare-fun m!1193107 () Bool)

(assert (=> b!1301921 m!1193107))

(declare-fun m!1193109 () Bool)

(assert (=> bm!63736 m!1193109))

(declare-fun m!1193111 () Bool)

(assert (=> b!1301908 m!1193111))

(declare-fun m!1193113 () Bool)

(assert (=> b!1301908 m!1193113))

(declare-fun m!1193115 () Bool)

(assert (=> b!1301907 m!1193115))

(declare-fun m!1193117 () Bool)

(assert (=> b!1301920 m!1193117))

(declare-fun m!1193119 () Bool)

(assert (=> b!1301920 m!1193119))

(declare-fun m!1193121 () Bool)

(assert (=> b!1301920 m!1193121))

(declare-fun m!1193123 () Bool)

(assert (=> b!1301914 m!1193123))

(declare-fun m!1193125 () Bool)

(assert (=> start!110022 m!1193125))

(declare-fun m!1193127 () Bool)

(assert (=> start!110022 m!1193127))

(declare-fun m!1193129 () Bool)

(assert (=> start!110022 m!1193129))

(declare-fun m!1193131 () Bool)

(assert (=> b!1301910 m!1193131))

(assert (=> b!1301910 m!1193131))

(declare-fun m!1193133 () Bool)

(assert (=> b!1301910 m!1193133))

(check-sat (not bm!63737) (not b!1301908) (not start!110022) (not b!1301914) b_and!47307 (not b!1301910) (not bm!63736) (not b!1301920) tp_is_empty!34831 (not b!1301907) (not bm!63740) (not b!1301921) (not mapNonEmpty!53822) (not b_next!29191))
(check-sat b_and!47307 (not b_next!29191))
