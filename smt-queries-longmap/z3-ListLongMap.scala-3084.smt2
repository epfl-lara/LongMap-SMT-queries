; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43382 () Bool)

(assert start!43382)

(declare-fun b_free!12223 () Bool)

(declare-fun b_next!12223 () Bool)

(assert (=> start!43382 (= b_free!12223 (not b_next!12223))))

(declare-fun tp!42945 () Bool)

(declare-fun b_and!20989 () Bool)

(assert (=> start!43382 (= tp!42945 b_and!20989)))

(declare-fun b!480830 () Bool)

(declare-fun e!282903 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!480830 (= e!282903 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480831 () Bool)

(declare-fun res!286755 () Bool)

(declare-fun e!282901 () Bool)

(assert (=> b!480831 (=> (not res!286755) (not e!282901))))

(declare-datatypes ((array!31120 0))(
  ( (array!31121 (arr!14964 (Array (_ BitVec 32) (_ BitVec 64))) (size!15322 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31120)

(declare-datatypes ((List!9060 0))(
  ( (Nil!9057) (Cons!9056 (h!9912 (_ BitVec 64)) (t!15262 List!9060)) )
))
(declare-fun arrayNoDuplicates!0 (array!31120 (_ BitVec 32) List!9060) Bool)

(assert (=> b!480831 (= res!286755 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9057))))

(declare-fun res!286757 () Bool)

(assert (=> start!43382 (=> (not res!286757) (not e!282901))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43382 (= res!286757 (validMask!0 mask!2352))))

(assert (=> start!43382 e!282901))

(assert (=> start!43382 true))

(declare-fun tp_is_empty!13735 () Bool)

(assert (=> start!43382 tp_is_empty!13735))

(declare-datatypes ((V!19385 0))(
  ( (V!19386 (val!6915 Int)) )
))
(declare-datatypes ((ValueCell!6506 0))(
  ( (ValueCellFull!6506 (v!9207 V!19385)) (EmptyCell!6506) )
))
(declare-datatypes ((array!31122 0))(
  ( (array!31123 (arr!14965 (Array (_ BitVec 32) ValueCell!6506)) (size!15323 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31122)

(declare-fun e!282905 () Bool)

(declare-fun array_inv!10866 (array!31122) Bool)

(assert (=> start!43382 (and (array_inv!10866 _values!1516) e!282905)))

(assert (=> start!43382 tp!42945))

(declare-fun array_inv!10867 (array!31120) Bool)

(assert (=> start!43382 (array_inv!10867 _keys!1874)))

(declare-fun b!480832 () Bool)

(declare-fun res!286760 () Bool)

(assert (=> b!480832 (=> (not res!286760) (not e!282901))))

(declare-fun minValue!1458 () V!19385)

(declare-fun zeroValue!1458 () V!19385)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8992 0))(
  ( (tuple2!8993 (_1!4507 (_ BitVec 64)) (_2!4507 V!19385)) )
))
(declare-datatypes ((List!9061 0))(
  ( (Nil!9058) (Cons!9057 (h!9913 tuple2!8992) (t!15263 List!9061)) )
))
(declare-datatypes ((ListLongMap!7907 0))(
  ( (ListLongMap!7908 (toList!3969 List!9061)) )
))
(declare-fun contains!2599 (ListLongMap!7907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2283 (array!31120 array!31122 (_ BitVec 32) (_ BitVec 32) V!19385 V!19385 (_ BitVec 32) Int) ListLongMap!7907)

(assert (=> b!480832 (= res!286760 (contains!2599 (getCurrentListMap!2283 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapNonEmpty!22306 () Bool)

(declare-fun mapRes!22306 () Bool)

(declare-fun tp!42946 () Bool)

(declare-fun e!282902 () Bool)

(assert (=> mapNonEmpty!22306 (= mapRes!22306 (and tp!42946 e!282902))))

(declare-fun mapValue!22306 () ValueCell!6506)

(declare-fun mapRest!22306 () (Array (_ BitVec 32) ValueCell!6506))

(declare-fun mapKey!22306 () (_ BitVec 32))

(assert (=> mapNonEmpty!22306 (= (arr!14965 _values!1516) (store mapRest!22306 mapKey!22306 mapValue!22306))))

(declare-fun b!480833 () Bool)

(assert (=> b!480833 (= e!282902 tp_is_empty!13735)))

(declare-fun b!480834 () Bool)

(declare-fun res!286759 () Bool)

(assert (=> b!480834 (=> (not res!286759) (not e!282901))))

(assert (=> b!480834 (= res!286759 (and (= (size!15323 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15322 _keys!1874) (size!15323 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480835 () Bool)

(declare-fun res!286756 () Bool)

(assert (=> b!480835 (=> (not res!286756) (not e!282901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480835 (= res!286756 (validKeyInArray!0 k0!1332))))

(declare-fun b!480836 () Bool)

(declare-fun e!282906 () Bool)

(assert (=> b!480836 (= e!282906 tp_is_empty!13735)))

(declare-fun mapIsEmpty!22306 () Bool)

(assert (=> mapIsEmpty!22306 mapRes!22306))

(declare-fun b!480837 () Bool)

(declare-fun res!286758 () Bool)

(assert (=> b!480837 (=> (not res!286758) (not e!282901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31120 (_ BitVec 32)) Bool)

(assert (=> b!480837 (= res!286758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480838 () Bool)

(assert (=> b!480838 (= e!282905 (and e!282906 mapRes!22306))))

(declare-fun condMapEmpty!22306 () Bool)

(declare-fun mapDefault!22306 () ValueCell!6506)

(assert (=> b!480838 (= condMapEmpty!22306 (= (arr!14965 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6506)) mapDefault!22306)))))

(declare-fun lt!218264 () (_ BitVec 32))

(declare-fun b!480839 () Bool)

(assert (=> b!480839 (= e!282901 (not (or (not (= (size!15322 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsge lt!218264 #b00000000000000000000000000000000))))))

(assert (=> b!480839 (arrayForallSeekEntryOrOpenFound!0 lt!218264 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14073 0))(
  ( (Unit!14074) )
))
(declare-fun lt!218266 () Unit!14073)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14073)

(assert (=> b!480839 (= lt!218266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218264))))

(declare-fun arrayScanForKey!0 (array!31120 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480839 (= lt!218264 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480839 e!282903))

(declare-fun c!57793 () Bool)

(assert (=> b!480839 (= c!57793 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218265 () Unit!14073)

(declare-fun lemmaKeyInListMapIsInArray!130 (array!31120 array!31122 (_ BitVec 32) (_ BitVec 32) V!19385 V!19385 (_ BitVec 64) Int) Unit!14073)

(assert (=> b!480839 (= lt!218265 (lemmaKeyInListMapIsInArray!130 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480840 () Bool)

(declare-fun arrayContainsKey!0 (array!31120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480840 (= e!282903 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (= (and start!43382 res!286757) b!480834))

(assert (= (and b!480834 res!286759) b!480837))

(assert (= (and b!480837 res!286758) b!480831))

(assert (= (and b!480831 res!286755) b!480832))

(assert (= (and b!480832 res!286760) b!480835))

(assert (= (and b!480835 res!286756) b!480839))

(assert (= (and b!480839 c!57793) b!480840))

(assert (= (and b!480839 (not c!57793)) b!480830))

(assert (= (and b!480838 condMapEmpty!22306) mapIsEmpty!22306))

(assert (= (and b!480838 (not condMapEmpty!22306)) mapNonEmpty!22306))

(get-info :version)

(assert (= (and mapNonEmpty!22306 ((_ is ValueCellFull!6506) mapValue!22306)) b!480833))

(assert (= (and b!480838 ((_ is ValueCellFull!6506) mapDefault!22306)) b!480836))

(assert (= start!43382 b!480838))

(declare-fun m!462625 () Bool)

(assert (=> b!480837 m!462625))

(declare-fun m!462627 () Bool)

(assert (=> mapNonEmpty!22306 m!462627))

(declare-fun m!462629 () Bool)

(assert (=> b!480835 m!462629))

(declare-fun m!462631 () Bool)

(assert (=> start!43382 m!462631))

(declare-fun m!462633 () Bool)

(assert (=> start!43382 m!462633))

(declare-fun m!462635 () Bool)

(assert (=> start!43382 m!462635))

(declare-fun m!462637 () Bool)

(assert (=> b!480839 m!462637))

(declare-fun m!462639 () Bool)

(assert (=> b!480839 m!462639))

(declare-fun m!462641 () Bool)

(assert (=> b!480839 m!462641))

(declare-fun m!462643 () Bool)

(assert (=> b!480839 m!462643))

(declare-fun m!462645 () Bool)

(assert (=> b!480832 m!462645))

(assert (=> b!480832 m!462645))

(declare-fun m!462647 () Bool)

(assert (=> b!480832 m!462647))

(declare-fun m!462649 () Bool)

(assert (=> b!480831 m!462649))

(declare-fun m!462651 () Bool)

(assert (=> b!480840 m!462651))

(check-sat (not b!480840) (not b!480831) (not b!480839) (not start!43382) (not b_next!12223) (not b!480832) (not b!480837) (not mapNonEmpty!22306) tp_is_empty!13735 (not b!480835) b_and!20989)
(check-sat b_and!20989 (not b_next!12223))
(get-model)

(declare-fun d!76769 () Bool)

(declare-fun res!286801 () Bool)

(declare-fun e!282947 () Bool)

(assert (=> d!76769 (=> res!286801 e!282947)))

(assert (=> d!76769 (= res!286801 (= (select (arr!14964 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76769 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282947)))

(declare-fun b!480911 () Bool)

(declare-fun e!282948 () Bool)

(assert (=> b!480911 (= e!282947 e!282948)))

(declare-fun res!286802 () Bool)

(assert (=> b!480911 (=> (not res!286802) (not e!282948))))

(assert (=> b!480911 (= res!286802 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15322 _keys!1874)))))

(declare-fun b!480912 () Bool)

(assert (=> b!480912 (= e!282948 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76769 (not res!286801)) b!480911))

(assert (= (and b!480911 res!286802) b!480912))

(declare-fun m!462709 () Bool)

(assert (=> d!76769 m!462709))

(declare-fun m!462711 () Bool)

(assert (=> b!480912 m!462711))

(assert (=> b!480840 d!76769))

(declare-fun b!480923 () Bool)

(declare-fun e!282960 () Bool)

(declare-fun e!282959 () Bool)

(assert (=> b!480923 (= e!282960 e!282959)))

(declare-fun res!286810 () Bool)

(assert (=> b!480923 (=> (not res!286810) (not e!282959))))

(declare-fun e!282958 () Bool)

(assert (=> b!480923 (= res!286810 (not e!282958))))

(declare-fun res!286811 () Bool)

(assert (=> b!480923 (=> (not res!286811) (not e!282958))))

(assert (=> b!480923 (= res!286811 (validKeyInArray!0 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480924 () Bool)

(declare-fun e!282957 () Bool)

(assert (=> b!480924 (= e!282959 e!282957)))

(declare-fun c!57802 () Bool)

(assert (=> b!480924 (= c!57802 (validKeyInArray!0 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30887 () Bool)

(declare-fun call!30890 () Bool)

(assert (=> bm!30887 (= call!30890 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57802 (Cons!9056 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000) Nil!9057) Nil!9057)))))

(declare-fun b!480925 () Bool)

(declare-fun contains!2600 (List!9060 (_ BitVec 64)) Bool)

(assert (=> b!480925 (= e!282958 (contains!2600 Nil!9057 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!480926 () Bool)

(assert (=> b!480926 (= e!282957 call!30890)))

(declare-fun d!76771 () Bool)

(declare-fun res!286809 () Bool)

(assert (=> d!76771 (=> res!286809 e!282960)))

(assert (=> d!76771 (= res!286809 (bvsge #b00000000000000000000000000000000 (size!15322 _keys!1874)))))

(assert (=> d!76771 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9057) e!282960)))

(declare-fun b!480927 () Bool)

(assert (=> b!480927 (= e!282957 call!30890)))

(assert (= (and d!76771 (not res!286809)) b!480923))

(assert (= (and b!480923 res!286811) b!480925))

(assert (= (and b!480923 res!286810) b!480924))

(assert (= (and b!480924 c!57802) b!480926))

(assert (= (and b!480924 (not c!57802)) b!480927))

(assert (= (or b!480926 b!480927) bm!30887))

(assert (=> b!480923 m!462709))

(assert (=> b!480923 m!462709))

(declare-fun m!462713 () Bool)

(assert (=> b!480923 m!462713))

(assert (=> b!480924 m!462709))

(assert (=> b!480924 m!462709))

(assert (=> b!480924 m!462713))

(assert (=> bm!30887 m!462709))

(declare-fun m!462715 () Bool)

(assert (=> bm!30887 m!462715))

(assert (=> b!480925 m!462709))

(assert (=> b!480925 m!462709))

(declare-fun m!462717 () Bool)

(assert (=> b!480925 m!462717))

(assert (=> b!480831 d!76771))

(declare-fun d!76773 () Bool)

(assert (=> d!76773 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!480835 d!76773))

(declare-fun b!480936 () Bool)

(declare-fun e!282969 () Bool)

(declare-fun e!282967 () Bool)

(assert (=> b!480936 (= e!282969 e!282967)))

(declare-fun c!57805 () Bool)

(assert (=> b!480936 (= c!57805 (validKeyInArray!0 (select (arr!14964 _keys!1874) lt!218264)))))

(declare-fun b!480937 () Bool)

(declare-fun call!30893 () Bool)

(assert (=> b!480937 (= e!282967 call!30893)))

(declare-fun b!480938 () Bool)

(declare-fun e!282968 () Bool)

(assert (=> b!480938 (= e!282967 e!282968)))

(declare-fun lt!218291 () (_ BitVec 64))

(assert (=> b!480938 (= lt!218291 (select (arr!14964 _keys!1874) lt!218264))))

(declare-fun lt!218293 () Unit!14073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31120 (_ BitVec 64) (_ BitVec 32)) Unit!14073)

(assert (=> b!480938 (= lt!218293 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218291 lt!218264))))

(assert (=> b!480938 (arrayContainsKey!0 _keys!1874 lt!218291 #b00000000000000000000000000000000)))

(declare-fun lt!218292 () Unit!14073)

(assert (=> b!480938 (= lt!218292 lt!218293)))

(declare-fun res!286817 () Bool)

(declare-datatypes ((SeekEntryResult!3519 0))(
  ( (MissingZero!3519 (index!16255 (_ BitVec 32))) (Found!3519 (index!16256 (_ BitVec 32))) (Intermediate!3519 (undefined!4331 Bool) (index!16257 (_ BitVec 32)) (x!45122 (_ BitVec 32))) (Undefined!3519) (MissingVacant!3519 (index!16258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31120 (_ BitVec 32)) SeekEntryResult!3519)

(assert (=> b!480938 (= res!286817 (= (seekEntryOrOpen!0 (select (arr!14964 _keys!1874) lt!218264) _keys!1874 mask!2352) (Found!3519 lt!218264)))))

(assert (=> b!480938 (=> (not res!286817) (not e!282968))))

(declare-fun b!480939 () Bool)

(assert (=> b!480939 (= e!282968 call!30893)))

(declare-fun d!76775 () Bool)

(declare-fun res!286816 () Bool)

(assert (=> d!76775 (=> res!286816 e!282969)))

(assert (=> d!76775 (= res!286816 (bvsge lt!218264 (size!15322 _keys!1874)))))

(assert (=> d!76775 (= (arrayForallSeekEntryOrOpenFound!0 lt!218264 _keys!1874 mask!2352) e!282969)))

(declare-fun bm!30890 () Bool)

(assert (=> bm!30890 (= call!30893 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!218264 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76775 (not res!286816)) b!480936))

(assert (= (and b!480936 c!57805) b!480938))

(assert (= (and b!480936 (not c!57805)) b!480937))

(assert (= (and b!480938 res!286817) b!480939))

(assert (= (or b!480939 b!480937) bm!30890))

(declare-fun m!462719 () Bool)

(assert (=> b!480936 m!462719))

(assert (=> b!480936 m!462719))

(declare-fun m!462721 () Bool)

(assert (=> b!480936 m!462721))

(assert (=> b!480938 m!462719))

(declare-fun m!462723 () Bool)

(assert (=> b!480938 m!462723))

(declare-fun m!462725 () Bool)

(assert (=> b!480938 m!462725))

(assert (=> b!480938 m!462719))

(declare-fun m!462727 () Bool)

(assert (=> b!480938 m!462727))

(declare-fun m!462729 () Bool)

(assert (=> bm!30890 m!462729))

(assert (=> b!480839 d!76775))

(declare-fun d!76777 () Bool)

(assert (=> d!76777 (arrayForallSeekEntryOrOpenFound!0 lt!218264 _keys!1874 mask!2352)))

(declare-fun lt!218296 () Unit!14073)

(declare-fun choose!38 (array!31120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14073)

(assert (=> d!76777 (= lt!218296 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218264))))

(assert (=> d!76777 (validMask!0 mask!2352)))

(assert (=> d!76777 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218264) lt!218296)))

(declare-fun bs!15316 () Bool)

(assert (= bs!15316 d!76777))

(assert (=> bs!15316 m!462637))

(declare-fun m!462731 () Bool)

(assert (=> bs!15316 m!462731))

(assert (=> bs!15316 m!462631))

(assert (=> b!480839 d!76777))

(declare-fun d!76779 () Bool)

(declare-fun lt!218299 () (_ BitVec 32))

(assert (=> d!76779 (and (or (bvslt lt!218299 #b00000000000000000000000000000000) (bvsge lt!218299 (size!15322 _keys!1874)) (and (bvsge lt!218299 #b00000000000000000000000000000000) (bvslt lt!218299 (size!15322 _keys!1874)))) (bvsge lt!218299 #b00000000000000000000000000000000) (bvslt lt!218299 (size!15322 _keys!1874)) (= (select (arr!14964 _keys!1874) lt!218299) k0!1332))))

(declare-fun e!282972 () (_ BitVec 32))

(assert (=> d!76779 (= lt!218299 e!282972)))

(declare-fun c!57808 () Bool)

(assert (=> d!76779 (= c!57808 (= (select (arr!14964 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76779 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15322 _keys!1874)) (bvslt (size!15322 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76779 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218299)))

(declare-fun b!480944 () Bool)

(assert (=> b!480944 (= e!282972 #b00000000000000000000000000000000)))

(declare-fun b!480945 () Bool)

(assert (=> b!480945 (= e!282972 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76779 c!57808) b!480944))

(assert (= (and d!76779 (not c!57808)) b!480945))

(declare-fun m!462733 () Bool)

(assert (=> d!76779 m!462733))

(assert (=> d!76779 m!462709))

(declare-fun m!462735 () Bool)

(assert (=> b!480945 m!462735))

(assert (=> b!480839 d!76779))

(declare-fun d!76781 () Bool)

(declare-fun e!282975 () Bool)

(assert (=> d!76781 e!282975))

(declare-fun c!57811 () Bool)

(assert (=> d!76781 (= c!57811 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218302 () Unit!14073)

(declare-fun choose!1382 (array!31120 array!31122 (_ BitVec 32) (_ BitVec 32) V!19385 V!19385 (_ BitVec 64) Int) Unit!14073)

(assert (=> d!76781 (= lt!218302 (choose!1382 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76781 (validMask!0 mask!2352)))

(assert (=> d!76781 (= (lemmaKeyInListMapIsInArray!130 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218302)))

(declare-fun b!480950 () Bool)

(assert (=> b!480950 (= e!282975 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480951 () Bool)

(assert (=> b!480951 (= e!282975 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76781 c!57811) b!480950))

(assert (= (and d!76781 (not c!57811)) b!480951))

(declare-fun m!462737 () Bool)

(assert (=> d!76781 m!462737))

(assert (=> d!76781 m!462631))

(assert (=> b!480950 m!462651))

(assert (=> b!480839 d!76781))

(declare-fun d!76783 () Bool)

(assert (=> d!76783 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43382 d!76783))

(declare-fun d!76785 () Bool)

(assert (=> d!76785 (= (array_inv!10866 _values!1516) (bvsge (size!15323 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43382 d!76785))

(declare-fun d!76787 () Bool)

(assert (=> d!76787 (= (array_inv!10867 _keys!1874) (bvsge (size!15322 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43382 d!76787))

(declare-fun d!76789 () Bool)

(declare-fun e!282981 () Bool)

(assert (=> d!76789 e!282981))

(declare-fun res!286820 () Bool)

(assert (=> d!76789 (=> res!286820 e!282981)))

(declare-fun lt!218314 () Bool)

(assert (=> d!76789 (= res!286820 (not lt!218314))))

(declare-fun lt!218311 () Bool)

(assert (=> d!76789 (= lt!218314 lt!218311)))

(declare-fun lt!218313 () Unit!14073)

(declare-fun e!282980 () Unit!14073)

(assert (=> d!76789 (= lt!218313 e!282980)))

(declare-fun c!57814 () Bool)

(assert (=> d!76789 (= c!57814 lt!218311)))

(declare-fun containsKey!356 (List!9061 (_ BitVec 64)) Bool)

(assert (=> d!76789 (= lt!218311 (containsKey!356 (toList!3969 (getCurrentListMap!2283 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76789 (= (contains!2599 (getCurrentListMap!2283 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218314)))

(declare-fun b!480958 () Bool)

(declare-fun lt!218312 () Unit!14073)

(assert (=> b!480958 (= e!282980 lt!218312)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!304 (List!9061 (_ BitVec 64)) Unit!14073)

(assert (=> b!480958 (= lt!218312 (lemmaContainsKeyImpliesGetValueByKeyDefined!304 (toList!3969 (getCurrentListMap!2283 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!401 0))(
  ( (Some!400 (v!9210 V!19385)) (None!399) )
))
(declare-fun isDefined!305 (Option!401) Bool)

(declare-fun getValueByKey!395 (List!9061 (_ BitVec 64)) Option!401)

(assert (=> b!480958 (isDefined!305 (getValueByKey!395 (toList!3969 (getCurrentListMap!2283 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!480959 () Bool)

(declare-fun Unit!14077 () Unit!14073)

(assert (=> b!480959 (= e!282980 Unit!14077)))

(declare-fun b!480960 () Bool)

(assert (=> b!480960 (= e!282981 (isDefined!305 (getValueByKey!395 (toList!3969 (getCurrentListMap!2283 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76789 c!57814) b!480958))

(assert (= (and d!76789 (not c!57814)) b!480959))

(assert (= (and d!76789 (not res!286820)) b!480960))

(declare-fun m!462739 () Bool)

(assert (=> d!76789 m!462739))

(declare-fun m!462741 () Bool)

(assert (=> b!480958 m!462741))

(declare-fun m!462743 () Bool)

(assert (=> b!480958 m!462743))

(assert (=> b!480958 m!462743))

(declare-fun m!462745 () Bool)

(assert (=> b!480958 m!462745))

(assert (=> b!480960 m!462743))

(assert (=> b!480960 m!462743))

(assert (=> b!480960 m!462745))

(assert (=> b!480832 d!76789))

(declare-fun bm!30905 () Bool)

(declare-fun call!30910 () ListLongMap!7907)

(declare-fun getCurrentListMapNoExtraKeys!2125 (array!31120 array!31122 (_ BitVec 32) (_ BitVec 32) V!19385 V!19385 (_ BitVec 32) Int) ListLongMap!7907)

(assert (=> bm!30905 (= call!30910 (getCurrentListMapNoExtraKeys!2125 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!481003 () Bool)

(declare-fun e!283015 () Bool)

(declare-fun call!30914 () Bool)

(assert (=> b!481003 (= e!283015 (not call!30914))))

(declare-fun b!481004 () Bool)

(declare-fun res!286846 () Bool)

(declare-fun e!283018 () Bool)

(assert (=> b!481004 (=> (not res!286846) (not e!283018))))

(declare-fun e!283019 () Bool)

(assert (=> b!481004 (= res!286846 e!283019)))

(declare-fun res!286840 () Bool)

(assert (=> b!481004 (=> res!286840 e!283019)))

(declare-fun e!283016 () Bool)

(assert (=> b!481004 (= res!286840 (not e!283016))))

(declare-fun res!286841 () Bool)

(assert (=> b!481004 (=> (not res!286841) (not e!283016))))

(assert (=> b!481004 (= res!286841 (bvslt #b00000000000000000000000000000000 (size!15322 _keys!1874)))))

(declare-fun b!481005 () Bool)

(declare-fun res!286844 () Bool)

(assert (=> b!481005 (=> (not res!286844) (not e!283018))))

(declare-fun e!283020 () Bool)

(assert (=> b!481005 (= res!286844 e!283020)))

(declare-fun c!57827 () Bool)

(assert (=> b!481005 (= c!57827 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!481006 () Bool)

(declare-fun e!283013 () ListLongMap!7907)

(declare-fun call!30909 () ListLongMap!7907)

(assert (=> b!481006 (= e!283013 call!30909)))

(declare-fun b!481007 () Bool)

(declare-fun e!283009 () Bool)

(assert (=> b!481007 (= e!283019 e!283009)))

(declare-fun res!286839 () Bool)

(assert (=> b!481007 (=> (not res!286839) (not e!283009))))

(declare-fun lt!218361 () ListLongMap!7907)

(assert (=> b!481007 (= res!286839 (contains!2599 lt!218361 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!481007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15322 _keys!1874)))))

(declare-fun b!481008 () Bool)

(declare-fun e!283012 () Bool)

(declare-fun apply!341 (ListLongMap!7907 (_ BitVec 64)) V!19385)

(assert (=> b!481008 (= e!283012 (= (apply!341 lt!218361 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun bm!30906 () Bool)

(declare-fun call!30912 () ListLongMap!7907)

(assert (=> bm!30906 (= call!30909 call!30912)))

(declare-fun b!481009 () Bool)

(assert (=> b!481009 (= e!283016 (validKeyInArray!0 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun c!57832 () Bool)

(declare-fun bm!30907 () Bool)

(declare-fun call!30913 () ListLongMap!7907)

(declare-fun c!57828 () Bool)

(declare-fun call!30908 () ListLongMap!7907)

(declare-fun +!1780 (ListLongMap!7907 tuple2!8992) ListLongMap!7907)

(assert (=> bm!30907 (= call!30912 (+!1780 (ite c!57828 call!30910 (ite c!57832 call!30913 call!30908)) (ite (or c!57828 c!57832) (tuple2!8993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!8993 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!481010 () Bool)

(declare-fun e!283017 () ListLongMap!7907)

(assert (=> b!481010 (= e!283017 call!30909)))

(declare-fun b!481011 () Bool)

(declare-fun e!283010 () Bool)

(assert (=> b!481011 (= e!283010 (= (apply!341 lt!218361 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun bm!30908 () Bool)

(assert (=> bm!30908 (= call!30908 call!30913)))

(declare-fun b!481012 () Bool)

(assert (=> b!481012 (= e!283015 e!283010)))

(declare-fun res!286845 () Bool)

(assert (=> b!481012 (= res!286845 call!30914)))

(assert (=> b!481012 (=> (not res!286845) (not e!283010))))

(declare-fun bm!30909 () Bool)

(assert (=> bm!30909 (= call!30913 call!30910)))

(declare-fun b!481013 () Bool)

(declare-fun e!283008 () Unit!14073)

(declare-fun lt!218377 () Unit!14073)

(assert (=> b!481013 (= e!283008 lt!218377)))

(declare-fun lt!218366 () ListLongMap!7907)

(assert (=> b!481013 (= lt!218366 (getCurrentListMapNoExtraKeys!2125 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218380 () (_ BitVec 64))

(assert (=> b!481013 (= lt!218380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218373 () (_ BitVec 64))

(assert (=> b!481013 (= lt!218373 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218372 () Unit!14073)

(declare-fun addStillContains!299 (ListLongMap!7907 (_ BitVec 64) V!19385 (_ BitVec 64)) Unit!14073)

(assert (=> b!481013 (= lt!218372 (addStillContains!299 lt!218366 lt!218380 zeroValue!1458 lt!218373))))

(assert (=> b!481013 (contains!2599 (+!1780 lt!218366 (tuple2!8993 lt!218380 zeroValue!1458)) lt!218373)))

(declare-fun lt!218367 () Unit!14073)

(assert (=> b!481013 (= lt!218367 lt!218372)))

(declare-fun lt!218365 () ListLongMap!7907)

(assert (=> b!481013 (= lt!218365 (getCurrentListMapNoExtraKeys!2125 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218379 () (_ BitVec 64))

(assert (=> b!481013 (= lt!218379 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218359 () (_ BitVec 64))

(assert (=> b!481013 (= lt!218359 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218370 () Unit!14073)

(declare-fun addApplyDifferent!299 (ListLongMap!7907 (_ BitVec 64) V!19385 (_ BitVec 64)) Unit!14073)

(assert (=> b!481013 (= lt!218370 (addApplyDifferent!299 lt!218365 lt!218379 minValue!1458 lt!218359))))

(assert (=> b!481013 (= (apply!341 (+!1780 lt!218365 (tuple2!8993 lt!218379 minValue!1458)) lt!218359) (apply!341 lt!218365 lt!218359))))

(declare-fun lt!218364 () Unit!14073)

(assert (=> b!481013 (= lt!218364 lt!218370)))

(declare-fun lt!218360 () ListLongMap!7907)

(assert (=> b!481013 (= lt!218360 (getCurrentListMapNoExtraKeys!2125 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218368 () (_ BitVec 64))

(assert (=> b!481013 (= lt!218368 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218369 () (_ BitVec 64))

(assert (=> b!481013 (= lt!218369 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218362 () Unit!14073)

(assert (=> b!481013 (= lt!218362 (addApplyDifferent!299 lt!218360 lt!218368 zeroValue!1458 lt!218369))))

(assert (=> b!481013 (= (apply!341 (+!1780 lt!218360 (tuple2!8993 lt!218368 zeroValue!1458)) lt!218369) (apply!341 lt!218360 lt!218369))))

(declare-fun lt!218374 () Unit!14073)

(assert (=> b!481013 (= lt!218374 lt!218362)))

(declare-fun lt!218371 () ListLongMap!7907)

(assert (=> b!481013 (= lt!218371 (getCurrentListMapNoExtraKeys!2125 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218376 () (_ BitVec 64))

(assert (=> b!481013 (= lt!218376 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218378 () (_ BitVec 64))

(assert (=> b!481013 (= lt!218378 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!481013 (= lt!218377 (addApplyDifferent!299 lt!218371 lt!218376 minValue!1458 lt!218378))))

(assert (=> b!481013 (= (apply!341 (+!1780 lt!218371 (tuple2!8993 lt!218376 minValue!1458)) lt!218378) (apply!341 lt!218371 lt!218378))))

(declare-fun b!481014 () Bool)

(declare-fun e!283014 () ListLongMap!7907)

(assert (=> b!481014 (= e!283014 e!283017)))

(assert (=> b!481014 (= c!57832 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!481015 () Bool)

(declare-fun call!30911 () Bool)

(assert (=> b!481015 (= e!283020 (not call!30911))))

(declare-fun bm!30910 () Bool)

(assert (=> bm!30910 (= call!30914 (contains!2599 lt!218361 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!481016 () Bool)

(assert (=> b!481016 (= e!283013 call!30908)))

(declare-fun bm!30911 () Bool)

(assert (=> bm!30911 (= call!30911 (contains!2599 lt!218361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!481017 () Bool)

(declare-fun get!7261 (ValueCell!6506 V!19385) V!19385)

(declare-fun dynLambda!949 (Int (_ BitVec 64)) V!19385)

(assert (=> b!481017 (= e!283009 (= (apply!341 lt!218361 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000)) (get!7261 (select (arr!14965 _values!1516) #b00000000000000000000000000000000) (dynLambda!949 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!481017 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15323 _values!1516)))))

(assert (=> b!481017 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15322 _keys!1874)))))

(declare-fun b!481018 () Bool)

(assert (=> b!481018 (= e!283018 e!283015)))

(declare-fun c!57830 () Bool)

(assert (=> b!481018 (= c!57830 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!76791 () Bool)

(assert (=> d!76791 e!283018))

(declare-fun res!286842 () Bool)

(assert (=> d!76791 (=> (not res!286842) (not e!283018))))

(assert (=> d!76791 (= res!286842 (or (bvsge #b00000000000000000000000000000000 (size!15322 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15322 _keys!1874)))))))

(declare-fun lt!218375 () ListLongMap!7907)

(assert (=> d!76791 (= lt!218361 lt!218375)))

(declare-fun lt!218363 () Unit!14073)

(assert (=> d!76791 (= lt!218363 e!283008)))

(declare-fun c!57829 () Bool)

(declare-fun e!283011 () Bool)

(assert (=> d!76791 (= c!57829 e!283011)))

(declare-fun res!286843 () Bool)

(assert (=> d!76791 (=> (not res!286843) (not e!283011))))

(assert (=> d!76791 (= res!286843 (bvslt #b00000000000000000000000000000000 (size!15322 _keys!1874)))))

(assert (=> d!76791 (= lt!218375 e!283014)))

(assert (=> d!76791 (= c!57828 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76791 (validMask!0 mask!2352)))

(assert (=> d!76791 (= (getCurrentListMap!2283 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218361)))

(declare-fun b!481019 () Bool)

(assert (=> b!481019 (= e!283011 (validKeyInArray!0 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481020 () Bool)

(assert (=> b!481020 (= e!283014 (+!1780 call!30912 (tuple2!8993 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!481021 () Bool)

(assert (=> b!481021 (= e!283020 e!283012)))

(declare-fun res!286847 () Bool)

(assert (=> b!481021 (= res!286847 call!30911)))

(assert (=> b!481021 (=> (not res!286847) (not e!283012))))

(declare-fun b!481022 () Bool)

(declare-fun Unit!14078 () Unit!14073)

(assert (=> b!481022 (= e!283008 Unit!14078)))

(declare-fun b!481023 () Bool)

(declare-fun c!57831 () Bool)

(assert (=> b!481023 (= c!57831 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!481023 (= e!283017 e!283013)))

(assert (= (and d!76791 c!57828) b!481020))

(assert (= (and d!76791 (not c!57828)) b!481014))

(assert (= (and b!481014 c!57832) b!481010))

(assert (= (and b!481014 (not c!57832)) b!481023))

(assert (= (and b!481023 c!57831) b!481006))

(assert (= (and b!481023 (not c!57831)) b!481016))

(assert (= (or b!481006 b!481016) bm!30908))

(assert (= (or b!481010 bm!30908) bm!30909))

(assert (= (or b!481010 b!481006) bm!30906))

(assert (= (or b!481020 bm!30909) bm!30905))

(assert (= (or b!481020 bm!30906) bm!30907))

(assert (= (and d!76791 res!286843) b!481019))

(assert (= (and d!76791 c!57829) b!481013))

(assert (= (and d!76791 (not c!57829)) b!481022))

(assert (= (and d!76791 res!286842) b!481004))

(assert (= (and b!481004 res!286841) b!481009))

(assert (= (and b!481004 (not res!286840)) b!481007))

(assert (= (and b!481007 res!286839) b!481017))

(assert (= (and b!481004 res!286846) b!481005))

(assert (= (and b!481005 c!57827) b!481021))

(assert (= (and b!481005 (not c!57827)) b!481015))

(assert (= (and b!481021 res!286847) b!481008))

(assert (= (or b!481021 b!481015) bm!30911))

(assert (= (and b!481005 res!286844) b!481018))

(assert (= (and b!481018 c!57830) b!481012))

(assert (= (and b!481018 (not c!57830)) b!481003))

(assert (= (and b!481012 res!286845) b!481011))

(assert (= (or b!481012 b!481003) bm!30910))

(declare-fun b_lambda!10813 () Bool)

(assert (=> (not b_lambda!10813) (not b!481017)))

(declare-fun t!15266 () Bool)

(declare-fun tb!4155 () Bool)

(assert (=> (and start!43382 (= defaultEntry!1519 defaultEntry!1519) t!15266) tb!4155))

(declare-fun result!7749 () Bool)

(assert (=> tb!4155 (= result!7749 tp_is_empty!13735)))

(assert (=> b!481017 t!15266))

(declare-fun b_and!20995 () Bool)

(assert (= b_and!20989 (and (=> t!15266 result!7749) b_and!20995)))

(assert (=> b!481019 m!462709))

(assert (=> b!481019 m!462709))

(assert (=> b!481019 m!462713))

(declare-fun m!462747 () Bool)

(assert (=> bm!30907 m!462747))

(declare-fun m!462749 () Bool)

(assert (=> b!481020 m!462749))

(declare-fun m!462751 () Bool)

(assert (=> b!481013 m!462751))

(declare-fun m!462753 () Bool)

(assert (=> b!481013 m!462753))

(declare-fun m!462755 () Bool)

(assert (=> b!481013 m!462755))

(declare-fun m!462757 () Bool)

(assert (=> b!481013 m!462757))

(declare-fun m!462759 () Bool)

(assert (=> b!481013 m!462759))

(declare-fun m!462761 () Bool)

(assert (=> b!481013 m!462761))

(declare-fun m!462763 () Bool)

(assert (=> b!481013 m!462763))

(declare-fun m!462765 () Bool)

(assert (=> b!481013 m!462765))

(declare-fun m!462767 () Bool)

(assert (=> b!481013 m!462767))

(declare-fun m!462769 () Bool)

(assert (=> b!481013 m!462769))

(assert (=> b!481013 m!462751))

(declare-fun m!462771 () Bool)

(assert (=> b!481013 m!462771))

(assert (=> b!481013 m!462709))

(assert (=> b!481013 m!462759))

(declare-fun m!462773 () Bool)

(assert (=> b!481013 m!462773))

(declare-fun m!462775 () Bool)

(assert (=> b!481013 m!462775))

(declare-fun m!462777 () Bool)

(assert (=> b!481013 m!462777))

(assert (=> b!481013 m!462777))

(declare-fun m!462779 () Bool)

(assert (=> b!481013 m!462779))

(declare-fun m!462781 () Bool)

(assert (=> b!481013 m!462781))

(assert (=> b!481013 m!462765))

(declare-fun m!462783 () Bool)

(assert (=> bm!30910 m!462783))

(declare-fun m!462785 () Bool)

(assert (=> b!481011 m!462785))

(declare-fun m!462787 () Bool)

(assert (=> b!481008 m!462787))

(assert (=> d!76791 m!462631))

(declare-fun m!462789 () Bool)

(assert (=> bm!30911 m!462789))

(assert (=> bm!30905 m!462757))

(declare-fun m!462791 () Bool)

(assert (=> b!481017 m!462791))

(declare-fun m!462793 () Bool)

(assert (=> b!481017 m!462793))

(assert (=> b!481017 m!462709))

(declare-fun m!462795 () Bool)

(assert (=> b!481017 m!462795))

(assert (=> b!481017 m!462793))

(assert (=> b!481017 m!462791))

(declare-fun m!462797 () Bool)

(assert (=> b!481017 m!462797))

(assert (=> b!481017 m!462709))

(assert (=> b!481009 m!462709))

(assert (=> b!481009 m!462709))

(assert (=> b!481009 m!462713))

(assert (=> b!481007 m!462709))

(assert (=> b!481007 m!462709))

(declare-fun m!462799 () Bool)

(assert (=> b!481007 m!462799))

(assert (=> b!480832 d!76791))

(declare-fun b!481026 () Bool)

(declare-fun e!283023 () Bool)

(declare-fun e!283021 () Bool)

(assert (=> b!481026 (= e!283023 e!283021)))

(declare-fun c!57833 () Bool)

(assert (=> b!481026 (= c!57833 (validKeyInArray!0 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481027 () Bool)

(declare-fun call!30915 () Bool)

(assert (=> b!481027 (= e!283021 call!30915)))

(declare-fun b!481028 () Bool)

(declare-fun e!283022 () Bool)

(assert (=> b!481028 (= e!283021 e!283022)))

(declare-fun lt!218381 () (_ BitVec 64))

(assert (=> b!481028 (= lt!218381 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218383 () Unit!14073)

(assert (=> b!481028 (= lt!218383 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218381 #b00000000000000000000000000000000))))

(assert (=> b!481028 (arrayContainsKey!0 _keys!1874 lt!218381 #b00000000000000000000000000000000)))

(declare-fun lt!218382 () Unit!14073)

(assert (=> b!481028 (= lt!218382 lt!218383)))

(declare-fun res!286849 () Bool)

(assert (=> b!481028 (= res!286849 (= (seekEntryOrOpen!0 (select (arr!14964 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3519 #b00000000000000000000000000000000)))))

(assert (=> b!481028 (=> (not res!286849) (not e!283022))))

(declare-fun b!481029 () Bool)

(assert (=> b!481029 (= e!283022 call!30915)))

(declare-fun d!76793 () Bool)

(declare-fun res!286848 () Bool)

(assert (=> d!76793 (=> res!286848 e!283023)))

(assert (=> d!76793 (= res!286848 (bvsge #b00000000000000000000000000000000 (size!15322 _keys!1874)))))

(assert (=> d!76793 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!283023)))

(declare-fun bm!30912 () Bool)

(assert (=> bm!30912 (= call!30915 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76793 (not res!286848)) b!481026))

(assert (= (and b!481026 c!57833) b!481028))

(assert (= (and b!481026 (not c!57833)) b!481027))

(assert (= (and b!481028 res!286849) b!481029))

(assert (= (or b!481029 b!481027) bm!30912))

(assert (=> b!481026 m!462709))

(assert (=> b!481026 m!462709))

(assert (=> b!481026 m!462713))

(assert (=> b!481028 m!462709))

(declare-fun m!462801 () Bool)

(assert (=> b!481028 m!462801))

(declare-fun m!462803 () Bool)

(assert (=> b!481028 m!462803))

(assert (=> b!481028 m!462709))

(declare-fun m!462805 () Bool)

(assert (=> b!481028 m!462805))

(declare-fun m!462807 () Bool)

(assert (=> bm!30912 m!462807))

(assert (=> b!480837 d!76793))

(declare-fun b!481037 () Bool)

(declare-fun e!283028 () Bool)

(assert (=> b!481037 (= e!283028 tp_is_empty!13735)))

(declare-fun mapNonEmpty!22315 () Bool)

(declare-fun mapRes!22315 () Bool)

(declare-fun tp!42961 () Bool)

(declare-fun e!283029 () Bool)

(assert (=> mapNonEmpty!22315 (= mapRes!22315 (and tp!42961 e!283029))))

(declare-fun mapKey!22315 () (_ BitVec 32))

(declare-fun mapRest!22315 () (Array (_ BitVec 32) ValueCell!6506))

(declare-fun mapValue!22315 () ValueCell!6506)

(assert (=> mapNonEmpty!22315 (= mapRest!22306 (store mapRest!22315 mapKey!22315 mapValue!22315))))

(declare-fun mapIsEmpty!22315 () Bool)

(assert (=> mapIsEmpty!22315 mapRes!22315))

(declare-fun b!481036 () Bool)

(assert (=> b!481036 (= e!283029 tp_is_empty!13735)))

(declare-fun condMapEmpty!22315 () Bool)

(declare-fun mapDefault!22315 () ValueCell!6506)

(assert (=> mapNonEmpty!22306 (= condMapEmpty!22315 (= mapRest!22306 ((as const (Array (_ BitVec 32) ValueCell!6506)) mapDefault!22315)))))

(assert (=> mapNonEmpty!22306 (= tp!42946 (and e!283028 mapRes!22315))))

(assert (= (and mapNonEmpty!22306 condMapEmpty!22315) mapIsEmpty!22315))

(assert (= (and mapNonEmpty!22306 (not condMapEmpty!22315)) mapNonEmpty!22315))

(assert (= (and mapNonEmpty!22315 ((_ is ValueCellFull!6506) mapValue!22315)) b!481036))

(assert (= (and mapNonEmpty!22306 ((_ is ValueCellFull!6506) mapDefault!22315)) b!481037))

(declare-fun m!462809 () Bool)

(assert (=> mapNonEmpty!22315 m!462809))

(declare-fun b_lambda!10815 () Bool)

(assert (= b_lambda!10813 (or (and start!43382 b_free!12223) b_lambda!10815)))

(check-sat (not b!480945) (not b!481008) (not b!480958) (not b!481011) (not b!480960) (not b!481028) (not b!481026) (not bm!30890) (not bm!30911) (not b_next!12223) (not bm!30907) (not d!76777) (not d!76791) (not b!481013) (not b_lambda!10815) (not b!481019) (not b!480936) (not d!76781) (not b!480925) (not bm!30910) (not b!480924) (not bm!30905) tp_is_empty!13735 (not b!480912) (not d!76789) (not b!480950) (not b!480938) (not mapNonEmpty!22315) (not bm!30887) (not b!481009) b_and!20995 (not b!481007) (not b!481017) (not bm!30912) (not b!480923) (not b!481020))
(check-sat b_and!20995 (not b_next!12223))
