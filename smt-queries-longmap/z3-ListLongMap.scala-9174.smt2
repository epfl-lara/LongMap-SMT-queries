; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110334 () Bool)

(assert start!110334)

(declare-fun b_free!29317 () Bool)

(declare-fun b_next!29317 () Bool)

(assert (=> start!110334 (= b_free!29317 (not b_next!29317))))

(declare-fun tp!103121 () Bool)

(declare-fun b_and!47505 () Bool)

(assert (=> start!110334 (= tp!103121 b_and!47505)))

(declare-fun b!1305830 () Bool)

(declare-fun e!744867 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1305830 (= e!744867 (and (or (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1305831 () Bool)

(declare-fun e!744863 () Bool)

(declare-fun tp_is_empty!34957 () Bool)

(assert (=> b!1305831 (= e!744863 tp_is_empty!34957)))

(declare-fun b!1305832 () Bool)

(declare-fun e!744866 () Bool)

(declare-fun mapRes!54046 () Bool)

(assert (=> b!1305832 (= e!744866 (and e!744863 mapRes!54046))))

(declare-fun condMapEmpty!54046 () Bool)

(declare-datatypes ((V!51713 0))(
  ( (V!51714 (val!17553 Int)) )
))
(declare-datatypes ((ValueCell!16580 0))(
  ( (ValueCellFull!16580 (v!20177 V!51713)) (EmptyCell!16580) )
))
(declare-datatypes ((array!86837 0))(
  ( (array!86838 (arr!41905 (Array (_ BitVec 32) ValueCell!16580)) (size!42457 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86837)

(declare-fun mapDefault!54046 () ValueCell!16580)

(assert (=> b!1305832 (= condMapEmpty!54046 (= (arr!41905 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16580)) mapDefault!54046)))))

(declare-fun b!1305833 () Bool)

(declare-fun res!867025 () Bool)

(assert (=> b!1305833 (=> (not res!867025) (not e!744867))))

(declare-datatypes ((array!86839 0))(
  ( (array!86840 (arr!41906 (Array (_ BitVec 32) (_ BitVec 64))) (size!42458 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86839)

(declare-datatypes ((List!29830 0))(
  ( (Nil!29827) (Cons!29826 (h!31035 (_ BitVec 64)) (t!43426 List!29830)) )
))
(declare-fun arrayNoDuplicates!0 (array!86839 (_ BitVec 32) List!29830) Bool)

(assert (=> b!1305833 (= res!867025 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29827))))

(declare-fun res!867024 () Bool)

(assert (=> start!110334 (=> (not res!867024) (not e!744867))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110334 (= res!867024 (validMask!0 mask!2175))))

(assert (=> start!110334 e!744867))

(assert (=> start!110334 tp_is_empty!34957))

(assert (=> start!110334 true))

(declare-fun array_inv!31871 (array!86837) Bool)

(assert (=> start!110334 (and (array_inv!31871 _values!1445) e!744866)))

(declare-fun array_inv!31872 (array!86839) Bool)

(assert (=> start!110334 (array_inv!31872 _keys!1741)))

(assert (=> start!110334 tp!103121))

(declare-fun b!1305834 () Bool)

(declare-fun res!867023 () Bool)

(assert (=> b!1305834 (=> (not res!867023) (not e!744867))))

(declare-fun minValue!1387 () V!51713)

(declare-fun zeroValue!1387 () V!51713)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22728 0))(
  ( (tuple2!22729 (_1!11375 (_ BitVec 64)) (_2!11375 V!51713)) )
))
(declare-datatypes ((List!29831 0))(
  ( (Nil!29828) (Cons!29827 (h!31036 tuple2!22728) (t!43427 List!29831)) )
))
(declare-datatypes ((ListLongMap!20385 0))(
  ( (ListLongMap!20386 (toList!10208 List!29831)) )
))
(declare-fun contains!8280 (ListLongMap!20385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5103 (array!86839 array!86837 (_ BitVec 32) (_ BitVec 32) V!51713 V!51713 (_ BitVec 32) Int) ListLongMap!20385)

(assert (=> b!1305834 (= res!867023 (contains!8280 (getCurrentListMap!5103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1305835 () Bool)

(declare-fun res!867026 () Bool)

(assert (=> b!1305835 (=> (not res!867026) (not e!744867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86839 (_ BitVec 32)) Bool)

(assert (=> b!1305835 (= res!867026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!54046 () Bool)

(assert (=> mapIsEmpty!54046 mapRes!54046))

(declare-fun mapNonEmpty!54046 () Bool)

(declare-fun tp!103120 () Bool)

(declare-fun e!744864 () Bool)

(assert (=> mapNonEmpty!54046 (= mapRes!54046 (and tp!103120 e!744864))))

(declare-fun mapValue!54046 () ValueCell!16580)

(declare-fun mapRest!54046 () (Array (_ BitVec 32) ValueCell!16580))

(declare-fun mapKey!54046 () (_ BitVec 32))

(assert (=> mapNonEmpty!54046 (= (arr!41905 _values!1445) (store mapRest!54046 mapKey!54046 mapValue!54046))))

(declare-fun b!1305836 () Bool)

(assert (=> b!1305836 (= e!744864 tp_is_empty!34957)))

(declare-fun b!1305837 () Bool)

(declare-fun res!867022 () Bool)

(assert (=> b!1305837 (=> (not res!867022) (not e!744867))))

(assert (=> b!1305837 (= res!867022 (and (= (size!42457 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42458 _keys!1741) (size!42457 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305838 () Bool)

(declare-fun res!867021 () Bool)

(assert (=> b!1305838 (=> (not res!867021) (not e!744867))))

(assert (=> b!1305838 (= res!867021 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42458 _keys!1741))))))

(assert (= (and start!110334 res!867024) b!1305837))

(assert (= (and b!1305837 res!867022) b!1305835))

(assert (= (and b!1305835 res!867026) b!1305833))

(assert (= (and b!1305833 res!867025) b!1305838))

(assert (= (and b!1305838 res!867021) b!1305834))

(assert (= (and b!1305834 res!867023) b!1305830))

(assert (= (and b!1305832 condMapEmpty!54046) mapIsEmpty!54046))

(assert (= (and b!1305832 (not condMapEmpty!54046)) mapNonEmpty!54046))

(get-info :version)

(assert (= (and mapNonEmpty!54046 ((_ is ValueCellFull!16580) mapValue!54046)) b!1305836))

(assert (= (and b!1305832 ((_ is ValueCellFull!16580) mapDefault!54046)) b!1305831))

(assert (= start!110334 b!1305832))

(declare-fun m!1196609 () Bool)

(assert (=> start!110334 m!1196609))

(declare-fun m!1196611 () Bool)

(assert (=> start!110334 m!1196611))

(declare-fun m!1196613 () Bool)

(assert (=> start!110334 m!1196613))

(declare-fun m!1196615 () Bool)

(assert (=> b!1305833 m!1196615))

(declare-fun m!1196617 () Bool)

(assert (=> b!1305835 m!1196617))

(declare-fun m!1196619 () Bool)

(assert (=> mapNonEmpty!54046 m!1196619))

(declare-fun m!1196621 () Bool)

(assert (=> b!1305834 m!1196621))

(assert (=> b!1305834 m!1196621))

(declare-fun m!1196623 () Bool)

(assert (=> b!1305834 m!1196623))

(check-sat b_and!47505 (not b!1305834) (not mapNonEmpty!54046) (not b!1305835) (not b_next!29317) tp_is_empty!34957 (not b!1305833) (not start!110334))
(check-sat b_and!47505 (not b_next!29317))
(get-model)

(declare-fun d!142081 () Bool)

(declare-fun e!744902 () Bool)

(assert (=> d!142081 e!744902))

(declare-fun res!867065 () Bool)

(assert (=> d!142081 (=> res!867065 e!744902)))

(declare-fun lt!584625 () Bool)

(assert (=> d!142081 (= res!867065 (not lt!584625))))

(declare-fun lt!584624 () Bool)

(assert (=> d!142081 (= lt!584625 lt!584624)))

(declare-datatypes ((Unit!43101 0))(
  ( (Unit!43102) )
))
(declare-fun lt!584627 () Unit!43101)

(declare-fun e!744903 () Unit!43101)

(assert (=> d!142081 (= lt!584627 e!744903)))

(declare-fun c!125493 () Bool)

(assert (=> d!142081 (= c!125493 lt!584624)))

(declare-fun containsKey!730 (List!29831 (_ BitVec 64)) Bool)

(assert (=> d!142081 (= lt!584624 (containsKey!730 (toList!10208 (getCurrentListMap!5103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142081 (= (contains!8280 (getCurrentListMap!5103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584625)))

(declare-fun b!1305899 () Bool)

(declare-fun lt!584626 () Unit!43101)

(assert (=> b!1305899 (= e!744903 lt!584626)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!477 (List!29831 (_ BitVec 64)) Unit!43101)

(assert (=> b!1305899 (= lt!584626 (lemmaContainsKeyImpliesGetValueByKeyDefined!477 (toList!10208 (getCurrentListMap!5103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!764 0))(
  ( (Some!763 (v!20180 V!51713)) (None!762) )
))
(declare-fun isDefined!520 (Option!764) Bool)

(declare-fun getValueByKey!713 (List!29831 (_ BitVec 64)) Option!764)

(assert (=> b!1305899 (isDefined!520 (getValueByKey!713 (toList!10208 (getCurrentListMap!5103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1305900 () Bool)

(declare-fun Unit!43103 () Unit!43101)

(assert (=> b!1305900 (= e!744903 Unit!43103)))

(declare-fun b!1305901 () Bool)

(assert (=> b!1305901 (= e!744902 (isDefined!520 (getValueByKey!713 (toList!10208 (getCurrentListMap!5103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142081 c!125493) b!1305899))

(assert (= (and d!142081 (not c!125493)) b!1305900))

(assert (= (and d!142081 (not res!867065)) b!1305901))

(declare-fun m!1196657 () Bool)

(assert (=> d!142081 m!1196657))

(declare-fun m!1196659 () Bool)

(assert (=> b!1305899 m!1196659))

(declare-fun m!1196661 () Bool)

(assert (=> b!1305899 m!1196661))

(assert (=> b!1305899 m!1196661))

(declare-fun m!1196663 () Bool)

(assert (=> b!1305899 m!1196663))

(assert (=> b!1305901 m!1196661))

(assert (=> b!1305901 m!1196661))

(assert (=> b!1305901 m!1196663))

(assert (=> b!1305834 d!142081))

(declare-fun b!1305944 () Bool)

(declare-fun res!867092 () Bool)

(declare-fun e!744938 () Bool)

(assert (=> b!1305944 (=> (not res!867092) (not e!744938))))

(declare-fun e!744934 () Bool)

(assert (=> b!1305944 (= res!867092 e!744934)))

(declare-fun c!125506 () Bool)

(assert (=> b!1305944 (= c!125506 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1305945 () Bool)

(declare-fun e!744937 () ListLongMap!20385)

(declare-fun e!744933 () ListLongMap!20385)

(assert (=> b!1305945 (= e!744937 e!744933)))

(declare-fun c!125511 () Bool)

(assert (=> b!1305945 (= c!125511 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305946 () Bool)

(declare-fun call!64593 () ListLongMap!20385)

(assert (=> b!1305946 (= e!744933 call!64593)))

(declare-fun b!1305947 () Bool)

(declare-fun call!64591 () Bool)

(assert (=> b!1305947 (= e!744934 (not call!64591))))

(declare-fun b!1305948 () Bool)

(declare-fun e!744936 () ListLongMap!20385)

(declare-fun call!64594 () ListLongMap!20385)

(assert (=> b!1305948 (= e!744936 call!64594)))

(declare-fun b!1305950 () Bool)

(declare-fun lt!584685 () ListLongMap!20385)

(declare-fun e!744935 () Bool)

(declare-fun apply!1020 (ListLongMap!20385 (_ BitVec 64)) V!51713)

(declare-fun get!21196 (ValueCell!16580 V!51713) V!51713)

(declare-fun dynLambda!3458 (Int (_ BitVec 64)) V!51713)

(assert (=> b!1305950 (= e!744935 (= (apply!1020 lt!584685 (select (arr!41906 _keys!1741) from!2144)) (get!21196 (select (arr!41905 _values!1445) from!2144) (dynLambda!3458 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305950 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42457 _values!1445)))))

(assert (=> b!1305950 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42458 _keys!1741)))))

(declare-fun b!1305951 () Bool)

(declare-fun e!744930 () Bool)

(assert (=> b!1305951 (= e!744930 (= (apply!1020 lt!584685 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!64586 () Bool)

(declare-fun call!64592 () ListLongMap!20385)

(assert (=> bm!64586 (= call!64594 call!64592)))

(declare-fun b!1305952 () Bool)

(assert (=> b!1305952 (= e!744936 call!64593)))

(declare-fun b!1305953 () Bool)

(declare-fun e!744941 () Bool)

(assert (=> b!1305953 (= e!744941 (= (apply!1020 lt!584685 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1305954 () Bool)

(declare-fun e!744932 () Unit!43101)

(declare-fun Unit!43104 () Unit!43101)

(assert (=> b!1305954 (= e!744932 Unit!43104)))

(declare-fun b!1305955 () Bool)

(declare-fun call!64589 () ListLongMap!20385)

(declare-fun +!4528 (ListLongMap!20385 tuple2!22728) ListLongMap!20385)

(assert (=> b!1305955 (= e!744937 (+!4528 call!64589 (tuple2!22729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1305956 () Bool)

(declare-fun e!744942 () Bool)

(declare-fun call!64595 () Bool)

(assert (=> b!1305956 (= e!744942 (not call!64595))))

(declare-fun b!1305957 () Bool)

(assert (=> b!1305957 (= e!744938 e!744942)))

(declare-fun c!125509 () Bool)

(assert (=> b!1305957 (= c!125509 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305958 () Bool)

(declare-fun lt!584672 () Unit!43101)

(assert (=> b!1305958 (= e!744932 lt!584672)))

(declare-fun lt!584683 () ListLongMap!20385)

(declare-fun getCurrentListMapNoExtraKeys!6161 (array!86839 array!86837 (_ BitVec 32) (_ BitVec 32) V!51713 V!51713 (_ BitVec 32) Int) ListLongMap!20385)

(assert (=> b!1305958 (= lt!584683 (getCurrentListMapNoExtraKeys!6161 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584678 () (_ BitVec 64))

(assert (=> b!1305958 (= lt!584678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584675 () (_ BitVec 64))

(assert (=> b!1305958 (= lt!584675 (select (arr!41906 _keys!1741) from!2144))))

(declare-fun lt!584693 () Unit!43101)

(declare-fun addStillContains!1115 (ListLongMap!20385 (_ BitVec 64) V!51713 (_ BitVec 64)) Unit!43101)

(assert (=> b!1305958 (= lt!584693 (addStillContains!1115 lt!584683 lt!584678 zeroValue!1387 lt!584675))))

(assert (=> b!1305958 (contains!8280 (+!4528 lt!584683 (tuple2!22729 lt!584678 zeroValue!1387)) lt!584675)))

(declare-fun lt!584689 () Unit!43101)

(assert (=> b!1305958 (= lt!584689 lt!584693)))

(declare-fun lt!584692 () ListLongMap!20385)

(assert (=> b!1305958 (= lt!584692 (getCurrentListMapNoExtraKeys!6161 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584680 () (_ BitVec 64))

(assert (=> b!1305958 (= lt!584680 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584682 () (_ BitVec 64))

(assert (=> b!1305958 (= lt!584682 (select (arr!41906 _keys!1741) from!2144))))

(declare-fun lt!584686 () Unit!43101)

(declare-fun addApplyDifferent!558 (ListLongMap!20385 (_ BitVec 64) V!51713 (_ BitVec 64)) Unit!43101)

(assert (=> b!1305958 (= lt!584686 (addApplyDifferent!558 lt!584692 lt!584680 minValue!1387 lt!584682))))

(assert (=> b!1305958 (= (apply!1020 (+!4528 lt!584692 (tuple2!22729 lt!584680 minValue!1387)) lt!584682) (apply!1020 lt!584692 lt!584682))))

(declare-fun lt!584679 () Unit!43101)

(assert (=> b!1305958 (= lt!584679 lt!584686)))

(declare-fun lt!584691 () ListLongMap!20385)

(assert (=> b!1305958 (= lt!584691 (getCurrentListMapNoExtraKeys!6161 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584677 () (_ BitVec 64))

(assert (=> b!1305958 (= lt!584677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584684 () (_ BitVec 64))

(assert (=> b!1305958 (= lt!584684 (select (arr!41906 _keys!1741) from!2144))))

(declare-fun lt!584681 () Unit!43101)

(assert (=> b!1305958 (= lt!584681 (addApplyDifferent!558 lt!584691 lt!584677 zeroValue!1387 lt!584684))))

(assert (=> b!1305958 (= (apply!1020 (+!4528 lt!584691 (tuple2!22729 lt!584677 zeroValue!1387)) lt!584684) (apply!1020 lt!584691 lt!584684))))

(declare-fun lt!584674 () Unit!43101)

(assert (=> b!1305958 (= lt!584674 lt!584681)))

(declare-fun lt!584673 () ListLongMap!20385)

(assert (=> b!1305958 (= lt!584673 (getCurrentListMapNoExtraKeys!6161 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584687 () (_ BitVec 64))

(assert (=> b!1305958 (= lt!584687 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584676 () (_ BitVec 64))

(assert (=> b!1305958 (= lt!584676 (select (arr!41906 _keys!1741) from!2144))))

(assert (=> b!1305958 (= lt!584672 (addApplyDifferent!558 lt!584673 lt!584687 minValue!1387 lt!584676))))

(assert (=> b!1305958 (= (apply!1020 (+!4528 lt!584673 (tuple2!22729 lt!584687 minValue!1387)) lt!584676) (apply!1020 lt!584673 lt!584676))))

(declare-fun b!1305959 () Bool)

(declare-fun res!867090 () Bool)

(assert (=> b!1305959 (=> (not res!867090) (not e!744938))))

(declare-fun e!744939 () Bool)

(assert (=> b!1305959 (= res!867090 e!744939)))

(declare-fun res!867089 () Bool)

(assert (=> b!1305959 (=> res!867089 e!744939)))

(declare-fun e!744931 () Bool)

(assert (=> b!1305959 (= res!867089 (not e!744931))))

(declare-fun res!867087 () Bool)

(assert (=> b!1305959 (=> (not res!867087) (not e!744931))))

(assert (=> b!1305959 (= res!867087 (bvslt from!2144 (size!42458 _keys!1741)))))

(declare-fun b!1305960 () Bool)

(declare-fun c!125510 () Bool)

(assert (=> b!1305960 (= c!125510 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1305960 (= e!744933 e!744936)))

(declare-fun b!1305949 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305949 (= e!744931 (validKeyInArray!0 (select (arr!41906 _keys!1741) from!2144)))))

(declare-fun d!142083 () Bool)

(assert (=> d!142083 e!744938))

(declare-fun res!867088 () Bool)

(assert (=> d!142083 (=> (not res!867088) (not e!744938))))

(assert (=> d!142083 (= res!867088 (or (bvsge from!2144 (size!42458 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42458 _keys!1741)))))))

(declare-fun lt!584688 () ListLongMap!20385)

(assert (=> d!142083 (= lt!584685 lt!584688)))

(declare-fun lt!584690 () Unit!43101)

(assert (=> d!142083 (= lt!584690 e!744932)))

(declare-fun c!125507 () Bool)

(declare-fun e!744940 () Bool)

(assert (=> d!142083 (= c!125507 e!744940)))

(declare-fun res!867085 () Bool)

(assert (=> d!142083 (=> (not res!867085) (not e!744940))))

(assert (=> d!142083 (= res!867085 (bvslt from!2144 (size!42458 _keys!1741)))))

(assert (=> d!142083 (= lt!584688 e!744937)))

(declare-fun c!125508 () Bool)

(assert (=> d!142083 (= c!125508 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142083 (validMask!0 mask!2175)))

(assert (=> d!142083 (= (getCurrentListMap!5103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584685)))

(declare-fun b!1305961 () Bool)

(assert (=> b!1305961 (= e!744934 e!744941)))

(declare-fun res!867091 () Bool)

(assert (=> b!1305961 (= res!867091 call!64591)))

(assert (=> b!1305961 (=> (not res!867091) (not e!744941))))

(declare-fun call!64590 () ListLongMap!20385)

(declare-fun bm!64587 () Bool)

(assert (=> bm!64587 (= call!64590 (getCurrentListMapNoExtraKeys!6161 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305962 () Bool)

(assert (=> b!1305962 (= e!744939 e!744935)))

(declare-fun res!867084 () Bool)

(assert (=> b!1305962 (=> (not res!867084) (not e!744935))))

(assert (=> b!1305962 (= res!867084 (contains!8280 lt!584685 (select (arr!41906 _keys!1741) from!2144)))))

(assert (=> b!1305962 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42458 _keys!1741)))))

(declare-fun bm!64588 () Bool)

(assert (=> bm!64588 (= call!64595 (contains!8280 lt!584685 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305963 () Bool)

(assert (=> b!1305963 (= e!744940 (validKeyInArray!0 (select (arr!41906 _keys!1741) from!2144)))))

(declare-fun bm!64589 () Bool)

(assert (=> bm!64589 (= call!64591 (contains!8280 lt!584685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64590 () Bool)

(assert (=> bm!64590 (= call!64589 (+!4528 (ite c!125508 call!64590 (ite c!125511 call!64592 call!64594)) (ite (or c!125508 c!125511) (tuple2!22729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!64591 () Bool)

(assert (=> bm!64591 (= call!64593 call!64589)))

(declare-fun b!1305964 () Bool)

(assert (=> b!1305964 (= e!744942 e!744930)))

(declare-fun res!867086 () Bool)

(assert (=> b!1305964 (= res!867086 call!64595)))

(assert (=> b!1305964 (=> (not res!867086) (not e!744930))))

(declare-fun bm!64592 () Bool)

(assert (=> bm!64592 (= call!64592 call!64590)))

(assert (= (and d!142083 c!125508) b!1305955))

(assert (= (and d!142083 (not c!125508)) b!1305945))

(assert (= (and b!1305945 c!125511) b!1305946))

(assert (= (and b!1305945 (not c!125511)) b!1305960))

(assert (= (and b!1305960 c!125510) b!1305952))

(assert (= (and b!1305960 (not c!125510)) b!1305948))

(assert (= (or b!1305952 b!1305948) bm!64586))

(assert (= (or b!1305946 bm!64586) bm!64592))

(assert (= (or b!1305946 b!1305952) bm!64591))

(assert (= (or b!1305955 bm!64592) bm!64587))

(assert (= (or b!1305955 bm!64591) bm!64590))

(assert (= (and d!142083 res!867085) b!1305963))

(assert (= (and d!142083 c!125507) b!1305958))

(assert (= (and d!142083 (not c!125507)) b!1305954))

(assert (= (and d!142083 res!867088) b!1305959))

(assert (= (and b!1305959 res!867087) b!1305949))

(assert (= (and b!1305959 (not res!867089)) b!1305962))

(assert (= (and b!1305962 res!867084) b!1305950))

(assert (= (and b!1305959 res!867090) b!1305944))

(assert (= (and b!1305944 c!125506) b!1305961))

(assert (= (and b!1305944 (not c!125506)) b!1305947))

(assert (= (and b!1305961 res!867091) b!1305953))

(assert (= (or b!1305961 b!1305947) bm!64589))

(assert (= (and b!1305944 res!867092) b!1305957))

(assert (= (and b!1305957 c!125509) b!1305964))

(assert (= (and b!1305957 (not c!125509)) b!1305956))

(assert (= (and b!1305964 res!867086) b!1305951))

(assert (= (or b!1305964 b!1305956) bm!64588))

(declare-fun b_lambda!23349 () Bool)

(assert (=> (not b_lambda!23349) (not b!1305950)))

(declare-fun t!43432 () Bool)

(declare-fun tb!11401 () Bool)

(assert (=> (and start!110334 (= defaultEntry!1448 defaultEntry!1448) t!43432) tb!11401))

(declare-fun result!23841 () Bool)

(assert (=> tb!11401 (= result!23841 tp_is_empty!34957)))

(assert (=> b!1305950 t!43432))

(declare-fun b_and!47511 () Bool)

(assert (= b_and!47505 (and (=> t!43432 result!23841) b_and!47511)))

(declare-fun m!1196665 () Bool)

(assert (=> b!1305950 m!1196665))

(assert (=> b!1305950 m!1196665))

(declare-fun m!1196667 () Bool)

(assert (=> b!1305950 m!1196667))

(declare-fun m!1196669 () Bool)

(assert (=> b!1305950 m!1196669))

(declare-fun m!1196671 () Bool)

(assert (=> b!1305950 m!1196671))

(assert (=> b!1305950 m!1196671))

(declare-fun m!1196673 () Bool)

(assert (=> b!1305950 m!1196673))

(assert (=> b!1305950 m!1196667))

(declare-fun m!1196675 () Bool)

(assert (=> bm!64589 m!1196675))

(declare-fun m!1196677 () Bool)

(assert (=> bm!64590 m!1196677))

(declare-fun m!1196679 () Bool)

(assert (=> b!1305953 m!1196679))

(declare-fun m!1196681 () Bool)

(assert (=> b!1305955 m!1196681))

(declare-fun m!1196683 () Bool)

(assert (=> bm!64588 m!1196683))

(declare-fun m!1196685 () Bool)

(assert (=> b!1305958 m!1196685))

(declare-fun m!1196687 () Bool)

(assert (=> b!1305958 m!1196687))

(declare-fun m!1196689 () Bool)

(assert (=> b!1305958 m!1196689))

(declare-fun m!1196691 () Bool)

(assert (=> b!1305958 m!1196691))

(assert (=> b!1305958 m!1196671))

(declare-fun m!1196693 () Bool)

(assert (=> b!1305958 m!1196693))

(declare-fun m!1196695 () Bool)

(assert (=> b!1305958 m!1196695))

(declare-fun m!1196697 () Bool)

(assert (=> b!1305958 m!1196697))

(declare-fun m!1196699 () Bool)

(assert (=> b!1305958 m!1196699))

(declare-fun m!1196701 () Bool)

(assert (=> b!1305958 m!1196701))

(assert (=> b!1305958 m!1196687))

(declare-fun m!1196703 () Bool)

(assert (=> b!1305958 m!1196703))

(declare-fun m!1196705 () Bool)

(assert (=> b!1305958 m!1196705))

(assert (=> b!1305958 m!1196685))

(declare-fun m!1196707 () Bool)

(assert (=> b!1305958 m!1196707))

(declare-fun m!1196709 () Bool)

(assert (=> b!1305958 m!1196709))

(assert (=> b!1305958 m!1196691))

(declare-fun m!1196711 () Bool)

(assert (=> b!1305958 m!1196711))

(declare-fun m!1196713 () Bool)

(assert (=> b!1305958 m!1196713))

(declare-fun m!1196715 () Bool)

(assert (=> b!1305958 m!1196715))

(assert (=> b!1305958 m!1196695))

(assert (=> b!1305963 m!1196671))

(assert (=> b!1305963 m!1196671))

(declare-fun m!1196717 () Bool)

(assert (=> b!1305963 m!1196717))

(assert (=> d!142083 m!1196609))

(assert (=> bm!64587 m!1196715))

(assert (=> b!1305962 m!1196671))

(assert (=> b!1305962 m!1196671))

(declare-fun m!1196719 () Bool)

(assert (=> b!1305962 m!1196719))

(assert (=> b!1305949 m!1196671))

(assert (=> b!1305949 m!1196671))

(assert (=> b!1305949 m!1196717))

(declare-fun m!1196721 () Bool)

(assert (=> b!1305951 m!1196721))

(assert (=> b!1305834 d!142083))

(declare-fun bm!64595 () Bool)

(declare-fun call!64598 () Bool)

(declare-fun c!125514 () Bool)

(assert (=> bm!64595 (= call!64598 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125514 (Cons!29826 (select (arr!41906 _keys!1741) #b00000000000000000000000000000000) Nil!29827) Nil!29827)))))

(declare-fun d!142085 () Bool)

(declare-fun res!867099 () Bool)

(declare-fun e!744952 () Bool)

(assert (=> d!142085 (=> res!867099 e!744952)))

(assert (=> d!142085 (= res!867099 (bvsge #b00000000000000000000000000000000 (size!42458 _keys!1741)))))

(assert (=> d!142085 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29827) e!744952)))

(declare-fun b!1305977 () Bool)

(declare-fun e!744954 () Bool)

(assert (=> b!1305977 (= e!744954 call!64598)))

(declare-fun b!1305978 () Bool)

(declare-fun e!744953 () Bool)

(declare-fun contains!8283 (List!29830 (_ BitVec 64)) Bool)

(assert (=> b!1305978 (= e!744953 (contains!8283 Nil!29827 (select (arr!41906 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305979 () Bool)

(assert (=> b!1305979 (= e!744954 call!64598)))

(declare-fun b!1305980 () Bool)

(declare-fun e!744951 () Bool)

(assert (=> b!1305980 (= e!744951 e!744954)))

(assert (=> b!1305980 (= c!125514 (validKeyInArray!0 (select (arr!41906 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305981 () Bool)

(assert (=> b!1305981 (= e!744952 e!744951)))

(declare-fun res!867100 () Bool)

(assert (=> b!1305981 (=> (not res!867100) (not e!744951))))

(assert (=> b!1305981 (= res!867100 (not e!744953))))

(declare-fun res!867101 () Bool)

(assert (=> b!1305981 (=> (not res!867101) (not e!744953))))

(assert (=> b!1305981 (= res!867101 (validKeyInArray!0 (select (arr!41906 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142085 (not res!867099)) b!1305981))

(assert (= (and b!1305981 res!867101) b!1305978))

(assert (= (and b!1305981 res!867100) b!1305980))

(assert (= (and b!1305980 c!125514) b!1305977))

(assert (= (and b!1305980 (not c!125514)) b!1305979))

(assert (= (or b!1305977 b!1305979) bm!64595))

(declare-fun m!1196723 () Bool)

(assert (=> bm!64595 m!1196723))

(declare-fun m!1196725 () Bool)

(assert (=> bm!64595 m!1196725))

(assert (=> b!1305978 m!1196723))

(assert (=> b!1305978 m!1196723))

(declare-fun m!1196727 () Bool)

(assert (=> b!1305978 m!1196727))

(assert (=> b!1305980 m!1196723))

(assert (=> b!1305980 m!1196723))

(declare-fun m!1196729 () Bool)

(assert (=> b!1305980 m!1196729))

(assert (=> b!1305981 m!1196723))

(assert (=> b!1305981 m!1196723))

(assert (=> b!1305981 m!1196729))

(assert (=> b!1305833 d!142085))

(declare-fun d!142087 () Bool)

(assert (=> d!142087 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110334 d!142087))

(declare-fun d!142089 () Bool)

(assert (=> d!142089 (= (array_inv!31871 _values!1445) (bvsge (size!42457 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110334 d!142089))

(declare-fun d!142091 () Bool)

(assert (=> d!142091 (= (array_inv!31872 _keys!1741) (bvsge (size!42458 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110334 d!142091))

(declare-fun bm!64598 () Bool)

(declare-fun call!64601 () Bool)

(assert (=> bm!64598 (= call!64601 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1305990 () Bool)

(declare-fun e!744961 () Bool)

(assert (=> b!1305990 (= e!744961 call!64601)))

(declare-fun b!1305991 () Bool)

(declare-fun e!744963 () Bool)

(assert (=> b!1305991 (= e!744961 e!744963)))

(declare-fun lt!584701 () (_ BitVec 64))

(assert (=> b!1305991 (= lt!584701 (select (arr!41906 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!584702 () Unit!43101)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86839 (_ BitVec 64) (_ BitVec 32)) Unit!43101)

(assert (=> b!1305991 (= lt!584702 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584701 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1305991 (arrayContainsKey!0 _keys!1741 lt!584701 #b00000000000000000000000000000000)))

(declare-fun lt!584700 () Unit!43101)

(assert (=> b!1305991 (= lt!584700 lt!584702)))

(declare-fun res!867106 () Bool)

(declare-datatypes ((SeekEntryResult!10029 0))(
  ( (MissingZero!10029 (index!42487 (_ BitVec 32))) (Found!10029 (index!42488 (_ BitVec 32))) (Intermediate!10029 (undefined!10841 Bool) (index!42489 (_ BitVec 32)) (x!115964 (_ BitVec 32))) (Undefined!10029) (MissingVacant!10029 (index!42490 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86839 (_ BitVec 32)) SeekEntryResult!10029)

(assert (=> b!1305991 (= res!867106 (= (seekEntryOrOpen!0 (select (arr!41906 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10029 #b00000000000000000000000000000000)))))

(assert (=> b!1305991 (=> (not res!867106) (not e!744963))))

(declare-fun b!1305992 () Bool)

(declare-fun e!744962 () Bool)

(assert (=> b!1305992 (= e!744962 e!744961)))

(declare-fun c!125517 () Bool)

(assert (=> b!1305992 (= c!125517 (validKeyInArray!0 (select (arr!41906 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142093 () Bool)

(declare-fun res!867107 () Bool)

(assert (=> d!142093 (=> res!867107 e!744962)))

(assert (=> d!142093 (= res!867107 (bvsge #b00000000000000000000000000000000 (size!42458 _keys!1741)))))

(assert (=> d!142093 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744962)))

(declare-fun b!1305993 () Bool)

(assert (=> b!1305993 (= e!744963 call!64601)))

(assert (= (and d!142093 (not res!867107)) b!1305992))

(assert (= (and b!1305992 c!125517) b!1305991))

(assert (= (and b!1305992 (not c!125517)) b!1305990))

(assert (= (and b!1305991 res!867106) b!1305993))

(assert (= (or b!1305993 b!1305990) bm!64598))

(declare-fun m!1196731 () Bool)

(assert (=> bm!64598 m!1196731))

(assert (=> b!1305991 m!1196723))

(declare-fun m!1196733 () Bool)

(assert (=> b!1305991 m!1196733))

(declare-fun m!1196735 () Bool)

(assert (=> b!1305991 m!1196735))

(assert (=> b!1305991 m!1196723))

(declare-fun m!1196737 () Bool)

(assert (=> b!1305991 m!1196737))

(assert (=> b!1305992 m!1196723))

(assert (=> b!1305992 m!1196723))

(assert (=> b!1305992 m!1196729))

(assert (=> b!1305835 d!142093))

(declare-fun mapIsEmpty!54055 () Bool)

(declare-fun mapRes!54055 () Bool)

(assert (=> mapIsEmpty!54055 mapRes!54055))

(declare-fun b!1306000 () Bool)

(declare-fun e!744969 () Bool)

(assert (=> b!1306000 (= e!744969 tp_is_empty!34957)))

(declare-fun condMapEmpty!54055 () Bool)

(declare-fun mapDefault!54055 () ValueCell!16580)

(assert (=> mapNonEmpty!54046 (= condMapEmpty!54055 (= mapRest!54046 ((as const (Array (_ BitVec 32) ValueCell!16580)) mapDefault!54055)))))

(declare-fun e!744968 () Bool)

(assert (=> mapNonEmpty!54046 (= tp!103120 (and e!744968 mapRes!54055))))

(declare-fun b!1306001 () Bool)

(assert (=> b!1306001 (= e!744968 tp_is_empty!34957)))

(declare-fun mapNonEmpty!54055 () Bool)

(declare-fun tp!103136 () Bool)

(assert (=> mapNonEmpty!54055 (= mapRes!54055 (and tp!103136 e!744969))))

(declare-fun mapValue!54055 () ValueCell!16580)

(declare-fun mapKey!54055 () (_ BitVec 32))

(declare-fun mapRest!54055 () (Array (_ BitVec 32) ValueCell!16580))

(assert (=> mapNonEmpty!54055 (= mapRest!54046 (store mapRest!54055 mapKey!54055 mapValue!54055))))

(assert (= (and mapNonEmpty!54046 condMapEmpty!54055) mapIsEmpty!54055))

(assert (= (and mapNonEmpty!54046 (not condMapEmpty!54055)) mapNonEmpty!54055))

(assert (= (and mapNonEmpty!54055 ((_ is ValueCellFull!16580) mapValue!54055)) b!1306000))

(assert (= (and mapNonEmpty!54046 ((_ is ValueCellFull!16580) mapDefault!54055)) b!1306001))

(declare-fun m!1196739 () Bool)

(assert (=> mapNonEmpty!54055 m!1196739))

(declare-fun b_lambda!23351 () Bool)

(assert (= b_lambda!23349 (or (and start!110334 b_free!29317) b_lambda!23351)))

(check-sat (not d!142083) b_and!47511 (not b!1305899) (not d!142081) (not bm!64598) (not bm!64590) (not b!1305955) (not b_next!29317) (not b!1305981) (not b!1305951) (not b!1305958) (not b!1305950) (not bm!64589) (not b!1305991) (not b!1305901) (not b!1305978) (not b!1305962) (not mapNonEmpty!54055) (not b!1305992) (not b!1305949) (not b_lambda!23351) (not bm!64587) (not bm!64595) (not b!1305953) tp_is_empty!34957 (not b!1305963) (not b!1305980) (not bm!64588))
(check-sat b_and!47511 (not b_next!29317))
