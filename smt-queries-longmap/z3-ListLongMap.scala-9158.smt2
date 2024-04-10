; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109898 () Bool)

(assert start!109898)

(declare-fun b_free!29223 () Bool)

(declare-fun b_next!29223 () Bool)

(assert (=> start!109898 (= b_free!29223 (not b_next!29223))))

(declare-fun tp!102806 () Bool)

(declare-fun b_and!47355 () Bool)

(assert (=> start!109898 (= tp!102806 b_and!47355)))

(declare-fun b!1301856 () Bool)

(declare-fun e!742556 () Bool)

(declare-fun e!742555 () Bool)

(declare-fun mapRes!53874 () Bool)

(assert (=> b!1301856 (= e!742556 (and e!742555 mapRes!53874))))

(declare-fun condMapEmpty!53874 () Bool)

(declare-datatypes ((V!51587 0))(
  ( (V!51588 (val!17506 Int)) )
))
(declare-datatypes ((ValueCell!16533 0))(
  ( (ValueCellFull!16533 (v!20117 V!51587)) (EmptyCell!16533) )
))
(declare-datatypes ((array!86736 0))(
  ( (array!86737 (arr!41863 (Array (_ BitVec 32) ValueCell!16533)) (size!42413 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86736)

(declare-fun mapDefault!53874 () ValueCell!16533)

(assert (=> b!1301856 (= condMapEmpty!53874 (= (arr!41863 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16533)) mapDefault!53874)))))

(declare-fun b!1301857 () Bool)

(declare-datatypes ((Unit!43095 0))(
  ( (Unit!43096) )
))
(declare-fun e!742554 () Unit!43095)

(declare-fun lt!582278 () Unit!43095)

(assert (=> b!1301857 (= e!742554 lt!582278)))

(declare-datatypes ((tuple2!22584 0))(
  ( (tuple2!22585 (_1!11303 (_ BitVec 64)) (_2!11303 V!51587)) )
))
(declare-datatypes ((List!29712 0))(
  ( (Nil!29709) (Cons!29708 (h!30917 tuple2!22584) (t!43296 List!29712)) )
))
(declare-datatypes ((ListLongMap!20241 0))(
  ( (ListLongMap!20242 (toList!10136 List!29712)) )
))
(declare-fun lt!582287 () ListLongMap!20241)

(declare-fun call!64007 () ListLongMap!20241)

(assert (=> b!1301857 (= lt!582287 call!64007)))

(declare-fun lt!582286 () ListLongMap!20241)

(declare-fun zeroValue!1387 () V!51587)

(declare-fun +!4463 (ListLongMap!20241 tuple2!22584) ListLongMap!20241)

(assert (=> b!1301857 (= lt!582286 (+!4463 lt!582287 (tuple2!22585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!582280 () Unit!43095)

(declare-fun call!64009 () Unit!43095)

(assert (=> b!1301857 (= lt!582280 call!64009)))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8264 (ListLongMap!20241 (_ BitVec 64)) Bool)

(assert (=> b!1301857 (contains!8264 lt!582286 k0!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!85 ((_ BitVec 64) (_ BitVec 64) V!51587 ListLongMap!20241) Unit!43095)

(assert (=> b!1301857 (= lt!582278 (lemmaInListMapAfterAddingDiffThenInBefore!85 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582287))))

(declare-fun call!64008 () Bool)

(assert (=> b!1301857 call!64008))

(declare-fun minValue!1387 () V!51587)

(declare-fun lt!582277 () ListLongMap!20241)

(declare-fun c!124863 () Bool)

(declare-fun lt!582282 () ListLongMap!20241)

(declare-fun c!124862 () Bool)

(declare-fun bm!64003 () Bool)

(assert (=> bm!64003 (= call!64009 (lemmaInListMapAfterAddingDiffThenInBefore!85 k0!1205 (ite c!124863 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124862 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124863 minValue!1387 (ite c!124862 zeroValue!1387 minValue!1387)) (ite c!124863 lt!582286 (ite c!124862 lt!582282 lt!582277))))))

(declare-fun bm!64004 () Bool)

(declare-fun call!64010 () Unit!43095)

(assert (=> bm!64004 (= call!64010 call!64009)))

(declare-fun b!1301858 () Bool)

(declare-fun e!742557 () Unit!43095)

(declare-fun lt!582284 () Unit!43095)

(assert (=> b!1301858 (= e!742557 lt!582284)))

(declare-fun call!64011 () ListLongMap!20241)

(assert (=> b!1301858 (= lt!582277 call!64011)))

(assert (=> b!1301858 (= lt!582284 call!64010)))

(declare-fun call!64006 () Bool)

(assert (=> b!1301858 call!64006))

(declare-fun res!864845 () Bool)

(declare-fun e!742553 () Bool)

(assert (=> start!109898 (=> (not res!864845) (not e!742553))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109898 (= res!864845 (validMask!0 mask!2175))))

(assert (=> start!109898 e!742553))

(declare-fun tp_is_empty!34863 () Bool)

(assert (=> start!109898 tp_is_empty!34863))

(assert (=> start!109898 true))

(declare-fun array_inv!31667 (array!86736) Bool)

(assert (=> start!109898 (and (array_inv!31667 _values!1445) e!742556)))

(declare-datatypes ((array!86738 0))(
  ( (array!86739 (arr!41864 (Array (_ BitVec 32) (_ BitVec 64))) (size!42414 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86738)

(declare-fun array_inv!31668 (array!86738) Bool)

(assert (=> start!109898 (array_inv!31668 _keys!1741)))

(assert (=> start!109898 tp!102806))

(declare-fun b!1301859 () Bool)

(declare-fun e!742558 () Bool)

(assert (=> b!1301859 (= e!742553 (not e!742558))))

(declare-fun res!864842 () Bool)

(assert (=> b!1301859 (=> res!864842 e!742558)))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1301859 (= res!864842 (= k0!1205 (select (arr!41864 _keys!1741) from!2144)))))

(assert (=> b!1301859 (not (contains!8264 (ListLongMap!20242 Nil!29709) k0!1205))))

(declare-fun lt!582288 () Unit!43095)

(declare-fun emptyContainsNothing!203 ((_ BitVec 64)) Unit!43095)

(assert (=> b!1301859 (= lt!582288 (emptyContainsNothing!203 k0!1205))))

(declare-fun lt!582285 () Unit!43095)

(assert (=> b!1301859 (= lt!582285 e!742554)))

(declare-fun lt!582279 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1301859 (= c!124863 (and (not lt!582279) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301859 (= lt!582279 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1301860 () Bool)

(assert (=> b!1301860 call!64006))

(declare-fun lt!582283 () Unit!43095)

(assert (=> b!1301860 (= lt!582283 call!64010)))

(assert (=> b!1301860 (= lt!582282 call!64011)))

(declare-fun e!742561 () Unit!43095)

(assert (=> b!1301860 (= e!742561 lt!582283)))

(declare-fun b!1301861 () Bool)

(declare-fun res!864844 () Bool)

(assert (=> b!1301861 (=> (not res!864844) (not e!742553))))

(declare-datatypes ((List!29713 0))(
  ( (Nil!29710) (Cons!29709 (h!30918 (_ BitVec 64)) (t!43297 List!29713)) )
))
(declare-fun arrayNoDuplicates!0 (array!86738 (_ BitVec 32) List!29713) Bool)

(assert (=> b!1301861 (= res!864844 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29710))))

(declare-fun mapNonEmpty!53874 () Bool)

(declare-fun tp!102807 () Bool)

(declare-fun e!742560 () Bool)

(assert (=> mapNonEmpty!53874 (= mapRes!53874 (and tp!102807 e!742560))))

(declare-fun mapKey!53874 () (_ BitVec 32))

(declare-fun mapValue!53874 () ValueCell!16533)

(declare-fun mapRest!53874 () (Array (_ BitVec 32) ValueCell!16533))

(assert (=> mapNonEmpty!53874 (= (arr!41863 _values!1445) (store mapRest!53874 mapKey!53874 mapValue!53874))))

(declare-fun b!1301862 () Bool)

(assert (=> b!1301862 (= e!742558 true)))

(declare-fun lt!582281 () V!51587)

(assert (=> b!1301862 (not (contains!8264 (+!4463 (ListLongMap!20242 Nil!29709) (tuple2!22585 (select (arr!41864 _keys!1741) from!2144) lt!582281)) k0!1205))))

(declare-fun lt!582276 () Unit!43095)

(declare-fun addStillNotContains!461 (ListLongMap!20241 (_ BitVec 64) V!51587 (_ BitVec 64)) Unit!43095)

(assert (=> b!1301862 (= lt!582276 (addStillNotContains!461 (ListLongMap!20242 Nil!29709) (select (arr!41864 _keys!1741) from!2144) lt!582281 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun get!21141 (ValueCell!16533 V!51587) V!51587)

(declare-fun dynLambda!3423 (Int (_ BitVec 64)) V!51587)

(assert (=> b!1301862 (= lt!582281 (get!21141 (select (arr!41863 _values!1445) from!2144) (dynLambda!3423 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301863 () Bool)

(assert (=> b!1301863 (= e!742554 e!742561)))

(assert (=> b!1301863 (= c!124862 (and (not lt!582279) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!53874 () Bool)

(assert (=> mapIsEmpty!53874 mapRes!53874))

(declare-fun b!1301864 () Bool)

(declare-fun res!864843 () Bool)

(assert (=> b!1301864 (=> (not res!864843) (not e!742553))))

(assert (=> b!1301864 (= res!864843 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42414 _keys!1741))))))

(declare-fun b!1301865 () Bool)

(declare-fun res!864849 () Bool)

(assert (=> b!1301865 (=> (not res!864849) (not e!742553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301865 (= res!864849 (validKeyInArray!0 (select (arr!41864 _keys!1741) from!2144)))))

(declare-fun b!1301866 () Bool)

(assert (=> b!1301866 (= e!742555 tp_is_empty!34863)))

(declare-fun b!1301867 () Bool)

(declare-fun res!864847 () Bool)

(assert (=> b!1301867 (=> (not res!864847) (not e!742553))))

(declare-fun getCurrentListMap!5161 (array!86738 array!86736 (_ BitVec 32) (_ BitVec 32) V!51587 V!51587 (_ BitVec 32) Int) ListLongMap!20241)

(assert (=> b!1301867 (= res!864847 (contains!8264 (getCurrentListMap!5161 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1301868 () Bool)

(declare-fun res!864848 () Bool)

(assert (=> b!1301868 (=> (not res!864848) (not e!742553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86738 (_ BitVec 32)) Bool)

(assert (=> b!1301868 (= res!864848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!64005 () Bool)

(assert (=> bm!64005 (= call!64006 call!64008)))

(declare-fun bm!64006 () Bool)

(assert (=> bm!64006 (= call!64008 (contains!8264 (ite c!124863 lt!582287 (ite c!124862 lt!582282 lt!582277)) k0!1205))))

(declare-fun bm!64007 () Bool)

(assert (=> bm!64007 (= call!64011 call!64007)))

(declare-fun b!1301869 () Bool)

(declare-fun res!864850 () Bool)

(assert (=> b!1301869 (=> (not res!864850) (not e!742553))))

(assert (=> b!1301869 (= res!864850 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42414 _keys!1741))))))

(declare-fun b!1301870 () Bool)

(declare-fun Unit!43097 () Unit!43095)

(assert (=> b!1301870 (= e!742557 Unit!43097)))

(declare-fun b!1301871 () Bool)

(declare-fun c!124864 () Bool)

(assert (=> b!1301871 (= c!124864 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582279))))

(assert (=> b!1301871 (= e!742561 e!742557)))

(declare-fun bm!64008 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6095 (array!86738 array!86736 (_ BitVec 32) (_ BitVec 32) V!51587 V!51587 (_ BitVec 32) Int) ListLongMap!20241)

(assert (=> bm!64008 (= call!64007 (getCurrentListMapNoExtraKeys!6095 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301872 () Bool)

(declare-fun res!864846 () Bool)

(assert (=> b!1301872 (=> (not res!864846) (not e!742553))))

(assert (=> b!1301872 (= res!864846 (and (= (size!42413 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42414 _keys!1741) (size!42413 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301873 () Bool)

(assert (=> b!1301873 (= e!742560 tp_is_empty!34863)))

(assert (= (and start!109898 res!864845) b!1301872))

(assert (= (and b!1301872 res!864846) b!1301868))

(assert (= (and b!1301868 res!864848) b!1301861))

(assert (= (and b!1301861 res!864844) b!1301864))

(assert (= (and b!1301864 res!864843) b!1301867))

(assert (= (and b!1301867 res!864847) b!1301869))

(assert (= (and b!1301869 res!864850) b!1301865))

(assert (= (and b!1301865 res!864849) b!1301859))

(assert (= (and b!1301859 c!124863) b!1301857))

(assert (= (and b!1301859 (not c!124863)) b!1301863))

(assert (= (and b!1301863 c!124862) b!1301860))

(assert (= (and b!1301863 (not c!124862)) b!1301871))

(assert (= (and b!1301871 c!124864) b!1301858))

(assert (= (and b!1301871 (not c!124864)) b!1301870))

(assert (= (or b!1301860 b!1301858) bm!64007))

(assert (= (or b!1301860 b!1301858) bm!64004))

(assert (= (or b!1301860 b!1301858) bm!64005))

(assert (= (or b!1301857 bm!64007) bm!64008))

(assert (= (or b!1301857 bm!64004) bm!64003))

(assert (= (or b!1301857 bm!64005) bm!64006))

(assert (= (and b!1301859 (not res!864842)) b!1301862))

(assert (= (and b!1301856 condMapEmpty!53874) mapIsEmpty!53874))

(assert (= (and b!1301856 (not condMapEmpty!53874)) mapNonEmpty!53874))

(get-info :version)

(assert (= (and mapNonEmpty!53874 ((_ is ValueCellFull!16533) mapValue!53874)) b!1301873))

(assert (= (and b!1301856 ((_ is ValueCellFull!16533) mapDefault!53874)) b!1301866))

(assert (= start!109898 b!1301856))

(declare-fun b_lambda!23215 () Bool)

(assert (=> (not b_lambda!23215) (not b!1301862)))

(declare-fun t!43295 () Bool)

(declare-fun tb!11387 () Bool)

(assert (=> (and start!109898 (= defaultEntry!1448 defaultEntry!1448) t!43295) tb!11387))

(declare-fun result!23787 () Bool)

(assert (=> tb!11387 (= result!23787 tp_is_empty!34863)))

(assert (=> b!1301862 t!43295))

(declare-fun b_and!47357 () Bool)

(assert (= b_and!47355 (and (=> t!43295 result!23787) b_and!47357)))

(declare-fun m!1192723 () Bool)

(assert (=> b!1301862 m!1192723))

(declare-fun m!1192725 () Bool)

(assert (=> b!1301862 m!1192725))

(declare-fun m!1192727 () Bool)

(assert (=> b!1301862 m!1192727))

(declare-fun m!1192729 () Bool)

(assert (=> b!1301862 m!1192729))

(assert (=> b!1301862 m!1192725))

(assert (=> b!1301862 m!1192723))

(declare-fun m!1192731 () Bool)

(assert (=> b!1301862 m!1192731))

(assert (=> b!1301862 m!1192727))

(declare-fun m!1192733 () Bool)

(assert (=> b!1301862 m!1192733))

(declare-fun m!1192735 () Bool)

(assert (=> b!1301862 m!1192735))

(assert (=> b!1301862 m!1192733))

(assert (=> b!1301859 m!1192733))

(declare-fun m!1192737 () Bool)

(assert (=> b!1301859 m!1192737))

(declare-fun m!1192739 () Bool)

(assert (=> b!1301859 m!1192739))

(declare-fun m!1192741 () Bool)

(assert (=> b!1301868 m!1192741))

(declare-fun m!1192743 () Bool)

(assert (=> b!1301861 m!1192743))

(declare-fun m!1192745 () Bool)

(assert (=> bm!64008 m!1192745))

(assert (=> b!1301865 m!1192733))

(assert (=> b!1301865 m!1192733))

(declare-fun m!1192747 () Bool)

(assert (=> b!1301865 m!1192747))

(declare-fun m!1192749 () Bool)

(assert (=> b!1301857 m!1192749))

(declare-fun m!1192751 () Bool)

(assert (=> b!1301857 m!1192751))

(declare-fun m!1192753 () Bool)

(assert (=> b!1301857 m!1192753))

(declare-fun m!1192755 () Bool)

(assert (=> bm!64003 m!1192755))

(declare-fun m!1192757 () Bool)

(assert (=> start!109898 m!1192757))

(declare-fun m!1192759 () Bool)

(assert (=> start!109898 m!1192759))

(declare-fun m!1192761 () Bool)

(assert (=> start!109898 m!1192761))

(declare-fun m!1192763 () Bool)

(assert (=> mapNonEmpty!53874 m!1192763))

(declare-fun m!1192765 () Bool)

(assert (=> bm!64006 m!1192765))

(declare-fun m!1192767 () Bool)

(assert (=> b!1301867 m!1192767))

(assert (=> b!1301867 m!1192767))

(declare-fun m!1192769 () Bool)

(assert (=> b!1301867 m!1192769))

(check-sat (not bm!64008) (not b!1301867) (not b_lambda!23215) (not mapNonEmpty!53874) b_and!47357 (not b_next!29223) (not b!1301865) (not start!109898) (not b!1301861) (not bm!64006) (not bm!64003) (not b!1301857) tp_is_empty!34863 (not b!1301862) (not b!1301868) (not b!1301859))
(check-sat b_and!47357 (not b_next!29223))
