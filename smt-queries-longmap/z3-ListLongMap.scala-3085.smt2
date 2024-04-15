; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43412 () Bool)

(assert start!43412)

(declare-fun b_free!12229 () Bool)

(declare-fun b_next!12229 () Bool)

(assert (=> start!43412 (= b_free!12229 (not b_next!12229))))

(declare-fun tp!42967 () Bool)

(declare-fun b_and!20961 () Bool)

(assert (=> start!43412 (= tp!42967 b_and!20961)))

(declare-fun b!480850 () Bool)

(declare-fun res!286745 () Bool)

(declare-fun e!282907 () Bool)

(assert (=> b!480850 (=> (not res!286745) (not e!282907))))

(declare-datatypes ((array!31145 0))(
  ( (array!31146 (arr!14976 (Array (_ BitVec 32) (_ BitVec 64))) (size!15335 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31145)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31145 (_ BitVec 32)) Bool)

(assert (=> b!480850 (= res!286745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480851 () Bool)

(declare-fun res!286741 () Bool)

(assert (=> b!480851 (=> (not res!286741) (not e!282907))))

(declare-datatypes ((List!9192 0))(
  ( (Nil!9189) (Cons!9188 (h!10044 (_ BitVec 64)) (t!15395 List!9192)) )
))
(declare-fun arrayNoDuplicates!0 (array!31145 (_ BitVec 32) List!9192) Bool)

(assert (=> b!480851 (= res!286741 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9189))))

(declare-fun b!480852 () Bool)

(declare-fun res!286744 () Bool)

(assert (=> b!480852 (=> (not res!286744) (not e!282907))))

(declare-datatypes ((V!19393 0))(
  ( (V!19394 (val!6918 Int)) )
))
(declare-datatypes ((ValueCell!6509 0))(
  ( (ValueCellFull!6509 (v!9204 V!19393)) (EmptyCell!6509) )
))
(declare-datatypes ((array!31147 0))(
  ( (array!31148 (arr!14977 (Array (_ BitVec 32) ValueCell!6509)) (size!15336 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31147)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!480852 (= res!286744 (and (= (size!15336 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15335 _keys!1874) (size!15336 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480853 () Bool)

(declare-fun res!286740 () Bool)

(assert (=> b!480853 (=> (not res!286740) (not e!282907))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19393)

(declare-fun zeroValue!1458 () V!19393)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9128 0))(
  ( (tuple2!9129 (_1!4575 (_ BitVec 64)) (_2!4575 V!19393)) )
))
(declare-datatypes ((List!9193 0))(
  ( (Nil!9190) (Cons!9189 (h!10045 tuple2!9128) (t!15396 List!9193)) )
))
(declare-datatypes ((ListLongMap!8031 0))(
  ( (ListLongMap!8032 (toList!4031 List!9193)) )
))
(declare-fun contains!2609 (ListLongMap!8031 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2284 (array!31145 array!31147 (_ BitVec 32) (_ BitVec 32) V!19393 V!19393 (_ BitVec 32) Int) ListLongMap!8031)

(assert (=> b!480853 (= res!286740 (contains!2609 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480854 () Bool)

(declare-fun res!286743 () Bool)

(assert (=> b!480854 (=> (not res!286743) (not e!282907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480854 (= res!286743 (validKeyInArray!0 k0!1332))))

(declare-fun res!286742 () Bool)

(assert (=> start!43412 (=> (not res!286742) (not e!282907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43412 (= res!286742 (validMask!0 mask!2352))))

(assert (=> start!43412 e!282907))

(assert (=> start!43412 true))

(declare-fun tp_is_empty!13741 () Bool)

(assert (=> start!43412 tp_is_empty!13741))

(declare-fun e!282910 () Bool)

(declare-fun array_inv!10892 (array!31147) Bool)

(assert (=> start!43412 (and (array_inv!10892 _values!1516) e!282910)))

(assert (=> start!43412 tp!42967))

(declare-fun array_inv!10893 (array!31145) Bool)

(assert (=> start!43412 (array_inv!10893 _keys!1874)))

(declare-fun b!480855 () Bool)

(declare-fun e!282909 () Bool)

(assert (=> b!480855 (= e!282909 tp_is_empty!13741)))

(declare-fun b!480856 () Bool)

(declare-fun e!282911 () Bool)

(declare-fun mapRes!22318 () Bool)

(assert (=> b!480856 (= e!282910 (and e!282911 mapRes!22318))))

(declare-fun condMapEmpty!22318 () Bool)

(declare-fun mapDefault!22318 () ValueCell!6509)

(assert (=> b!480856 (= condMapEmpty!22318 (= (arr!14977 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6509)) mapDefault!22318)))))

(declare-fun b!480857 () Bool)

(declare-fun e!282908 () Bool)

(declare-fun arrayContainsKey!0 (array!31145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480857 (= e!282908 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22318 () Bool)

(assert (=> mapIsEmpty!22318 mapRes!22318))

(declare-fun b!480858 () Bool)

(assert (=> b!480858 (= e!282908 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22318 () Bool)

(declare-fun tp!42966 () Bool)

(assert (=> mapNonEmpty!22318 (= mapRes!22318 (and tp!42966 e!282909))))

(declare-fun mapRest!22318 () (Array (_ BitVec 32) ValueCell!6509))

(declare-fun mapKey!22318 () (_ BitVec 32))

(declare-fun mapValue!22318 () ValueCell!6509)

(assert (=> mapNonEmpty!22318 (= (arr!14977 _values!1516) (store mapRest!22318 mapKey!22318 mapValue!22318))))

(declare-fun b!480859 () Bool)

(assert (=> b!480859 (= e!282911 tp_is_empty!13741)))

(declare-fun lt!218145 () (_ BitVec 32))

(declare-fun b!480860 () Bool)

(assert (=> b!480860 (= e!282907 (not (or (not (= (size!15335 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvslt lt!218145 #b00000000000000000000000000000000) (bvsle lt!218145 (size!15335 _keys!1874)))))))

(assert (=> b!480860 (arrayForallSeekEntryOrOpenFound!0 lt!218145 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14094 0))(
  ( (Unit!14095) )
))
(declare-fun lt!218146 () Unit!14094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14094)

(assert (=> b!480860 (= lt!218146 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218145))))

(declare-fun arrayScanForKey!0 (array!31145 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480860 (= lt!218145 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480860 e!282908))

(declare-fun c!57792 () Bool)

(assert (=> b!480860 (= c!57792 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218144 () Unit!14094)

(declare-fun lemmaKeyInListMapIsInArray!135 (array!31145 array!31147 (_ BitVec 32) (_ BitVec 32) V!19393 V!19393 (_ BitVec 64) Int) Unit!14094)

(assert (=> b!480860 (= lt!218144 (lemmaKeyInListMapIsInArray!135 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (= (and start!43412 res!286742) b!480852))

(assert (= (and b!480852 res!286744) b!480850))

(assert (= (and b!480850 res!286745) b!480851))

(assert (= (and b!480851 res!286741) b!480853))

(assert (= (and b!480853 res!286740) b!480854))

(assert (= (and b!480854 res!286743) b!480860))

(assert (= (and b!480860 c!57792) b!480857))

(assert (= (and b!480860 (not c!57792)) b!480858))

(assert (= (and b!480856 condMapEmpty!22318) mapIsEmpty!22318))

(assert (= (and b!480856 (not condMapEmpty!22318)) mapNonEmpty!22318))

(get-info :version)

(assert (= (and mapNonEmpty!22318 ((_ is ValueCellFull!6509) mapValue!22318)) b!480855))

(assert (= (and b!480856 ((_ is ValueCellFull!6509) mapDefault!22318)) b!480859))

(assert (= start!43412 b!480856))

(declare-fun m!461895 () Bool)

(assert (=> start!43412 m!461895))

(declare-fun m!461897 () Bool)

(assert (=> start!43412 m!461897))

(declare-fun m!461899 () Bool)

(assert (=> start!43412 m!461899))

(declare-fun m!461901 () Bool)

(assert (=> b!480857 m!461901))

(declare-fun m!461903 () Bool)

(assert (=> b!480860 m!461903))

(declare-fun m!461905 () Bool)

(assert (=> b!480860 m!461905))

(declare-fun m!461907 () Bool)

(assert (=> b!480860 m!461907))

(declare-fun m!461909 () Bool)

(assert (=> b!480860 m!461909))

(declare-fun m!461911 () Bool)

(assert (=> mapNonEmpty!22318 m!461911))

(declare-fun m!461913 () Bool)

(assert (=> b!480854 m!461913))

(declare-fun m!461915 () Bool)

(assert (=> b!480853 m!461915))

(assert (=> b!480853 m!461915))

(declare-fun m!461917 () Bool)

(assert (=> b!480853 m!461917))

(declare-fun m!461919 () Bool)

(assert (=> b!480851 m!461919))

(declare-fun m!461921 () Bool)

(assert (=> b!480850 m!461921))

(check-sat tp_is_empty!13741 (not b!480860) b_and!20961 (not b_next!12229) (not b!480857) (not start!43412) (not b!480854) (not b!480853) (not b!480851) (not mapNonEmpty!22318) (not b!480850))
(check-sat b_and!20961 (not b_next!12229))
(get-model)

(declare-fun d!76565 () Bool)

(declare-fun res!286786 () Bool)

(declare-fun e!282957 () Bool)

(assert (=> d!76565 (=> res!286786 e!282957)))

(assert (=> d!76565 (= res!286786 (bvsge lt!218145 (size!15335 _keys!1874)))))

(assert (=> d!76565 (= (arrayForallSeekEntryOrOpenFound!0 lt!218145 _keys!1874 mask!2352) e!282957)))

(declare-fun b!480935 () Bool)

(declare-fun e!282955 () Bool)

(declare-fun e!282956 () Bool)

(assert (=> b!480935 (= e!282955 e!282956)))

(declare-fun lt!218171 () (_ BitVec 64))

(assert (=> b!480935 (= lt!218171 (select (arr!14976 _keys!1874) lt!218145))))

(declare-fun lt!218172 () Unit!14094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31145 (_ BitVec 64) (_ BitVec 32)) Unit!14094)

(assert (=> b!480935 (= lt!218172 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218171 lt!218145))))

(assert (=> b!480935 (arrayContainsKey!0 _keys!1874 lt!218171 #b00000000000000000000000000000000)))

(declare-fun lt!218173 () Unit!14094)

(assert (=> b!480935 (= lt!218173 lt!218172)))

(declare-fun res!286787 () Bool)

(declare-datatypes ((SeekEntryResult!3566 0))(
  ( (MissingZero!3566 (index!16443 (_ BitVec 32))) (Found!3566 (index!16444 (_ BitVec 32))) (Intermediate!3566 (undefined!4378 Bool) (index!16445 (_ BitVec 32)) (x!45185 (_ BitVec 32))) (Undefined!3566) (MissingVacant!3566 (index!16446 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31145 (_ BitVec 32)) SeekEntryResult!3566)

(assert (=> b!480935 (= res!286787 (= (seekEntryOrOpen!0 (select (arr!14976 _keys!1874) lt!218145) _keys!1874 mask!2352) (Found!3566 lt!218145)))))

(assert (=> b!480935 (=> (not res!286787) (not e!282956))))

(declare-fun b!480936 () Bool)

(declare-fun call!30907 () Bool)

(assert (=> b!480936 (= e!282956 call!30907)))

(declare-fun b!480937 () Bool)

(assert (=> b!480937 (= e!282957 e!282955)))

(declare-fun c!57801 () Bool)

(assert (=> b!480937 (= c!57801 (validKeyInArray!0 (select (arr!14976 _keys!1874) lt!218145)))))

(declare-fun bm!30904 () Bool)

(assert (=> bm!30904 (= call!30907 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!218145 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!480938 () Bool)

(assert (=> b!480938 (= e!282955 call!30907)))

(assert (= (and d!76565 (not res!286786)) b!480937))

(assert (= (and b!480937 c!57801) b!480935))

(assert (= (and b!480937 (not c!57801)) b!480938))

(assert (= (and b!480935 res!286787) b!480936))

(assert (= (or b!480936 b!480938) bm!30904))

(declare-fun m!461979 () Bool)

(assert (=> b!480935 m!461979))

(declare-fun m!461981 () Bool)

(assert (=> b!480935 m!461981))

(declare-fun m!461983 () Bool)

(assert (=> b!480935 m!461983))

(assert (=> b!480935 m!461979))

(declare-fun m!461985 () Bool)

(assert (=> b!480935 m!461985))

(assert (=> b!480937 m!461979))

(assert (=> b!480937 m!461979))

(declare-fun m!461987 () Bool)

(assert (=> b!480937 m!461987))

(declare-fun m!461989 () Bool)

(assert (=> bm!30904 m!461989))

(assert (=> b!480860 d!76565))

(declare-fun d!76567 () Bool)

(assert (=> d!76567 (arrayForallSeekEntryOrOpenFound!0 lt!218145 _keys!1874 mask!2352)))

(declare-fun lt!218176 () Unit!14094)

(declare-fun choose!38 (array!31145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14094)

(assert (=> d!76567 (= lt!218176 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218145))))

(assert (=> d!76567 (validMask!0 mask!2352)))

(assert (=> d!76567 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218145) lt!218176)))

(declare-fun bs!15274 () Bool)

(assert (= bs!15274 d!76567))

(assert (=> bs!15274 m!461903))

(declare-fun m!461991 () Bool)

(assert (=> bs!15274 m!461991))

(assert (=> bs!15274 m!461895))

(assert (=> b!480860 d!76567))

(declare-fun d!76569 () Bool)

(declare-fun lt!218179 () (_ BitVec 32))

(assert (=> d!76569 (and (or (bvslt lt!218179 #b00000000000000000000000000000000) (bvsge lt!218179 (size!15335 _keys!1874)) (and (bvsge lt!218179 #b00000000000000000000000000000000) (bvslt lt!218179 (size!15335 _keys!1874)))) (bvsge lt!218179 #b00000000000000000000000000000000) (bvslt lt!218179 (size!15335 _keys!1874)) (= (select (arr!14976 _keys!1874) lt!218179) k0!1332))))

(declare-fun e!282960 () (_ BitVec 32))

(assert (=> d!76569 (= lt!218179 e!282960)))

(declare-fun c!57804 () Bool)

(assert (=> d!76569 (= c!57804 (= (select (arr!14976 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76569 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)) (bvslt (size!15335 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76569 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218179)))

(declare-fun b!480943 () Bool)

(assert (=> b!480943 (= e!282960 #b00000000000000000000000000000000)))

(declare-fun b!480944 () Bool)

(assert (=> b!480944 (= e!282960 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76569 c!57804) b!480943))

(assert (= (and d!76569 (not c!57804)) b!480944))

(declare-fun m!461993 () Bool)

(assert (=> d!76569 m!461993))

(declare-fun m!461995 () Bool)

(assert (=> d!76569 m!461995))

(declare-fun m!461997 () Bool)

(assert (=> b!480944 m!461997))

(assert (=> b!480860 d!76569))

(declare-fun d!76571 () Bool)

(declare-fun e!282963 () Bool)

(assert (=> d!76571 e!282963))

(declare-fun c!57807 () Bool)

(assert (=> d!76571 (= c!57807 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218182 () Unit!14094)

(declare-fun choose!1385 (array!31145 array!31147 (_ BitVec 32) (_ BitVec 32) V!19393 V!19393 (_ BitVec 64) Int) Unit!14094)

(assert (=> d!76571 (= lt!218182 (choose!1385 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76571 (validMask!0 mask!2352)))

(assert (=> d!76571 (= (lemmaKeyInListMapIsInArray!135 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218182)))

(declare-fun b!480949 () Bool)

(assert (=> b!480949 (= e!282963 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480950 () Bool)

(assert (=> b!480950 (= e!282963 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76571 c!57807) b!480949))

(assert (= (and d!76571 (not c!57807)) b!480950))

(declare-fun m!461999 () Bool)

(assert (=> d!76571 m!461999))

(assert (=> d!76571 m!461895))

(assert (=> b!480949 m!461901))

(assert (=> b!480860 d!76571))

(declare-fun d!76573 () Bool)

(declare-fun res!286792 () Bool)

(declare-fun e!282968 () Bool)

(assert (=> d!76573 (=> res!286792 e!282968)))

(assert (=> d!76573 (= res!286792 (= (select (arr!14976 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76573 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282968)))

(declare-fun b!480955 () Bool)

(declare-fun e!282969 () Bool)

(assert (=> b!480955 (= e!282968 e!282969)))

(declare-fun res!286793 () Bool)

(assert (=> b!480955 (=> (not res!286793) (not e!282969))))

(assert (=> b!480955 (= res!286793 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15335 _keys!1874)))))

(declare-fun b!480956 () Bool)

(assert (=> b!480956 (= e!282969 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76573 (not res!286792)) b!480955))

(assert (= (and b!480955 res!286793) b!480956))

(assert (=> d!76573 m!461995))

(declare-fun m!462001 () Bool)

(assert (=> b!480956 m!462001))

(assert (=> b!480857 d!76573))

(declare-fun d!76575 () Bool)

(declare-fun e!282974 () Bool)

(assert (=> d!76575 e!282974))

(declare-fun res!286796 () Bool)

(assert (=> d!76575 (=> res!286796 e!282974)))

(declare-fun lt!218194 () Bool)

(assert (=> d!76575 (= res!286796 (not lt!218194))))

(declare-fun lt!218192 () Bool)

(assert (=> d!76575 (= lt!218194 lt!218192)))

(declare-fun lt!218191 () Unit!14094)

(declare-fun e!282975 () Unit!14094)

(assert (=> d!76575 (= lt!218191 e!282975)))

(declare-fun c!57810 () Bool)

(assert (=> d!76575 (= c!57810 lt!218192)))

(declare-fun containsKey!355 (List!9193 (_ BitVec 64)) Bool)

(assert (=> d!76575 (= lt!218192 (containsKey!355 (toList!4031 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76575 (= (contains!2609 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218194)))

(declare-fun b!480963 () Bool)

(declare-fun lt!218193 () Unit!14094)

(assert (=> b!480963 (= e!282975 lt!218193)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!304 (List!9193 (_ BitVec 64)) Unit!14094)

(assert (=> b!480963 (= lt!218193 (lemmaContainsKeyImpliesGetValueByKeyDefined!304 (toList!4031 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!399 0))(
  ( (Some!398 (v!9207 V!19393)) (None!397) )
))
(declare-fun isDefined!305 (Option!399) Bool)

(declare-fun getValueByKey!393 (List!9193 (_ BitVec 64)) Option!399)

(assert (=> b!480963 (isDefined!305 (getValueByKey!393 (toList!4031 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!480964 () Bool)

(declare-fun Unit!14100 () Unit!14094)

(assert (=> b!480964 (= e!282975 Unit!14100)))

(declare-fun b!480965 () Bool)

(assert (=> b!480965 (= e!282974 (isDefined!305 (getValueByKey!393 (toList!4031 (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76575 c!57810) b!480963))

(assert (= (and d!76575 (not c!57810)) b!480964))

(assert (= (and d!76575 (not res!286796)) b!480965))

(declare-fun m!462003 () Bool)

(assert (=> d!76575 m!462003))

(declare-fun m!462005 () Bool)

(assert (=> b!480963 m!462005))

(declare-fun m!462007 () Bool)

(assert (=> b!480963 m!462007))

(assert (=> b!480963 m!462007))

(declare-fun m!462009 () Bool)

(assert (=> b!480963 m!462009))

(assert (=> b!480965 m!462007))

(assert (=> b!480965 m!462007))

(assert (=> b!480965 m!462009))

(assert (=> b!480853 d!76575))

(declare-fun b!481008 () Bool)

(declare-fun res!286821 () Bool)

(declare-fun e!283005 () Bool)

(assert (=> b!481008 (=> (not res!286821) (not e!283005))))

(declare-fun e!283013 () Bool)

(assert (=> b!481008 (= res!286821 e!283013)))

(declare-fun res!286816 () Bool)

(assert (=> b!481008 (=> res!286816 e!283013)))

(declare-fun e!283008 () Bool)

(assert (=> b!481008 (= res!286816 (not e!283008))))

(declare-fun res!286817 () Bool)

(assert (=> b!481008 (=> (not res!286817) (not e!283008))))

(assert (=> b!481008 (= res!286817 (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(declare-fun b!481009 () Bool)

(declare-fun e!283011 () ListLongMap!8031)

(declare-fun call!30925 () ListLongMap!8031)

(declare-fun +!1810 (ListLongMap!8031 tuple2!9128) ListLongMap!8031)

(assert (=> b!481009 (= e!283011 (+!1810 call!30925 (tuple2!9129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!481010 () Bool)

(assert (=> b!481010 (= e!283008 (validKeyInArray!0 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481011 () Bool)

(declare-fun e!283010 () Bool)

(declare-fun e!283012 () Bool)

(assert (=> b!481011 (= e!283010 e!283012)))

(declare-fun res!286815 () Bool)

(declare-fun call!30927 () Bool)

(assert (=> b!481011 (= res!286815 call!30927)))

(assert (=> b!481011 (=> (not res!286815) (not e!283012))))

(declare-fun b!481012 () Bool)

(assert (=> b!481012 (= e!283010 (not call!30927))))

(declare-fun b!481013 () Bool)

(declare-fun e!283004 () Bool)

(assert (=> b!481013 (= e!283005 e!283004)))

(declare-fun c!57828 () Bool)

(assert (=> b!481013 (= c!57828 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!481014 () Bool)

(declare-fun e!283006 () ListLongMap!8031)

(declare-fun call!30923 () ListLongMap!8031)

(assert (=> b!481014 (= e!283006 call!30923)))

(declare-fun b!481015 () Bool)

(declare-fun e!283003 () ListLongMap!8031)

(declare-fun call!30928 () ListLongMap!8031)

(assert (=> b!481015 (= e!283003 call!30928)))

(declare-fun bm!30919 () Bool)

(declare-fun call!30926 () ListLongMap!8031)

(assert (=> bm!30919 (= call!30928 call!30926)))

(declare-fun call!30924 () ListLongMap!8031)

(declare-fun bm!30920 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2146 (array!31145 array!31147 (_ BitVec 32) (_ BitVec 32) V!19393 V!19393 (_ BitVec 32) Int) ListLongMap!8031)

(assert (=> bm!30920 (= call!30924 (getCurrentListMapNoExtraKeys!2146 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!481016 () Bool)

(declare-fun e!283014 () Bool)

(assert (=> b!481016 (= e!283004 e!283014)))

(declare-fun res!286823 () Bool)

(declare-fun call!30922 () Bool)

(assert (=> b!481016 (= res!286823 call!30922)))

(assert (=> b!481016 (=> (not res!286823) (not e!283014))))

(declare-fun b!481017 () Bool)

(declare-fun lt!218255 () ListLongMap!8031)

(declare-fun apply!342 (ListLongMap!8031 (_ BitVec 64)) V!19393)

(assert (=> b!481017 (= e!283014 (= (apply!342 lt!218255 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!481018 () Bool)

(declare-fun e!283007 () Unit!14094)

(declare-fun lt!218241 () Unit!14094)

(assert (=> b!481018 (= e!283007 lt!218241)))

(declare-fun lt!218256 () ListLongMap!8031)

(assert (=> b!481018 (= lt!218256 (getCurrentListMapNoExtraKeys!2146 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218260 () (_ BitVec 64))

(assert (=> b!481018 (= lt!218260 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218240 () (_ BitVec 64))

(assert (=> b!481018 (= lt!218240 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218250 () Unit!14094)

(declare-fun addStillContains!300 (ListLongMap!8031 (_ BitVec 64) V!19393 (_ BitVec 64)) Unit!14094)

(assert (=> b!481018 (= lt!218250 (addStillContains!300 lt!218256 lt!218260 zeroValue!1458 lt!218240))))

(assert (=> b!481018 (contains!2609 (+!1810 lt!218256 (tuple2!9129 lt!218260 zeroValue!1458)) lt!218240)))

(declare-fun lt!218257 () Unit!14094)

(assert (=> b!481018 (= lt!218257 lt!218250)))

(declare-fun lt!218242 () ListLongMap!8031)

(assert (=> b!481018 (= lt!218242 (getCurrentListMapNoExtraKeys!2146 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218243 () (_ BitVec 64))

(assert (=> b!481018 (= lt!218243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218254 () (_ BitVec 64))

(assert (=> b!481018 (= lt!218254 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218239 () Unit!14094)

(declare-fun addApplyDifferent!300 (ListLongMap!8031 (_ BitVec 64) V!19393 (_ BitVec 64)) Unit!14094)

(assert (=> b!481018 (= lt!218239 (addApplyDifferent!300 lt!218242 lt!218243 minValue!1458 lt!218254))))

(assert (=> b!481018 (= (apply!342 (+!1810 lt!218242 (tuple2!9129 lt!218243 minValue!1458)) lt!218254) (apply!342 lt!218242 lt!218254))))

(declare-fun lt!218246 () Unit!14094)

(assert (=> b!481018 (= lt!218246 lt!218239)))

(declare-fun lt!218245 () ListLongMap!8031)

(assert (=> b!481018 (= lt!218245 (getCurrentListMapNoExtraKeys!2146 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218248 () (_ BitVec 64))

(assert (=> b!481018 (= lt!218248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218251 () (_ BitVec 64))

(assert (=> b!481018 (= lt!218251 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218253 () Unit!14094)

(assert (=> b!481018 (= lt!218253 (addApplyDifferent!300 lt!218245 lt!218248 zeroValue!1458 lt!218251))))

(assert (=> b!481018 (= (apply!342 (+!1810 lt!218245 (tuple2!9129 lt!218248 zeroValue!1458)) lt!218251) (apply!342 lt!218245 lt!218251))))

(declare-fun lt!218249 () Unit!14094)

(assert (=> b!481018 (= lt!218249 lt!218253)))

(declare-fun lt!218252 () ListLongMap!8031)

(assert (=> b!481018 (= lt!218252 (getCurrentListMapNoExtraKeys!2146 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218244 () (_ BitVec 64))

(assert (=> b!481018 (= lt!218244 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218259 () (_ BitVec 64))

(assert (=> b!481018 (= lt!218259 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!481018 (= lt!218241 (addApplyDifferent!300 lt!218252 lt!218244 minValue!1458 lt!218259))))

(assert (=> b!481018 (= (apply!342 (+!1810 lt!218252 (tuple2!9129 lt!218244 minValue!1458)) lt!218259) (apply!342 lt!218252 lt!218259))))

(declare-fun d!76577 () Bool)

(assert (=> d!76577 e!283005))

(declare-fun res!286820 () Bool)

(assert (=> d!76577 (=> (not res!286820) (not e!283005))))

(assert (=> d!76577 (= res!286820 (or (bvsge #b00000000000000000000000000000000 (size!15335 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))))

(declare-fun lt!218258 () ListLongMap!8031)

(assert (=> d!76577 (= lt!218255 lt!218258)))

(declare-fun lt!218247 () Unit!14094)

(assert (=> d!76577 (= lt!218247 e!283007)))

(declare-fun c!57826 () Bool)

(declare-fun e!283009 () Bool)

(assert (=> d!76577 (= c!57826 e!283009)))

(declare-fun res!286818 () Bool)

(assert (=> d!76577 (=> (not res!286818) (not e!283009))))

(assert (=> d!76577 (= res!286818 (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(assert (=> d!76577 (= lt!218258 e!283011)))

(declare-fun c!57827 () Bool)

(assert (=> d!76577 (= c!57827 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76577 (validMask!0 mask!2352)))

(assert (=> d!76577 (= (getCurrentListMap!2284 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218255)))

(declare-fun b!481019 () Bool)

(declare-fun Unit!14101 () Unit!14094)

(assert (=> b!481019 (= e!283007 Unit!14101)))

(declare-fun b!481020 () Bool)

(declare-fun res!286822 () Bool)

(assert (=> b!481020 (=> (not res!286822) (not e!283005))))

(assert (=> b!481020 (= res!286822 e!283010)))

(declare-fun c!57823 () Bool)

(assert (=> b!481020 (= c!57823 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30921 () Bool)

(assert (=> bm!30921 (= call!30923 call!30925)))

(declare-fun b!481021 () Bool)

(assert (=> b!481021 (= e!283003 call!30923)))

(declare-fun bm!30922 () Bool)

(declare-fun c!57825 () Bool)

(assert (=> bm!30922 (= call!30925 (+!1810 (ite c!57827 call!30924 (ite c!57825 call!30926 call!30928)) (ite (or c!57827 c!57825) (tuple2!9129 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!481022 () Bool)

(declare-fun c!57824 () Bool)

(assert (=> b!481022 (= c!57824 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!481022 (= e!283006 e!283003)))

(declare-fun bm!30923 () Bool)

(assert (=> bm!30923 (= call!30926 call!30924)))

(declare-fun bm!30924 () Bool)

(assert (=> bm!30924 (= call!30922 (contains!2609 lt!218255 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!481023 () Bool)

(assert (=> b!481023 (= e!283009 (validKeyInArray!0 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481024 () Bool)

(assert (=> b!481024 (= e!283011 e!283006)))

(assert (=> b!481024 (= c!57825 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30925 () Bool)

(assert (=> bm!30925 (= call!30927 (contains!2609 lt!218255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!481025 () Bool)

(assert (=> b!481025 (= e!283004 (not call!30922))))

(declare-fun b!481026 () Bool)

(declare-fun e!283002 () Bool)

(declare-fun get!7267 (ValueCell!6509 V!19393) V!19393)

(declare-fun dynLambda!956 (Int (_ BitVec 64)) V!19393)

(assert (=> b!481026 (= e!283002 (= (apply!342 lt!218255 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000)) (get!7267 (select (arr!14977 _values!1516) #b00000000000000000000000000000000) (dynLambda!956 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!481026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15336 _values!1516)))))

(assert (=> b!481026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(declare-fun b!481027 () Bool)

(assert (=> b!481027 (= e!283012 (= (apply!342 lt!218255 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!481028 () Bool)

(assert (=> b!481028 (= e!283013 e!283002)))

(declare-fun res!286819 () Bool)

(assert (=> b!481028 (=> (not res!286819) (not e!283002))))

(assert (=> b!481028 (= res!286819 (contains!2609 lt!218255 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!481028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(assert (= (and d!76577 c!57827) b!481009))

(assert (= (and d!76577 (not c!57827)) b!481024))

(assert (= (and b!481024 c!57825) b!481014))

(assert (= (and b!481024 (not c!57825)) b!481022))

(assert (= (and b!481022 c!57824) b!481021))

(assert (= (and b!481022 (not c!57824)) b!481015))

(assert (= (or b!481021 b!481015) bm!30919))

(assert (= (or b!481014 bm!30919) bm!30923))

(assert (= (or b!481014 b!481021) bm!30921))

(assert (= (or b!481009 bm!30923) bm!30920))

(assert (= (or b!481009 bm!30921) bm!30922))

(assert (= (and d!76577 res!286818) b!481023))

(assert (= (and d!76577 c!57826) b!481018))

(assert (= (and d!76577 (not c!57826)) b!481019))

(assert (= (and d!76577 res!286820) b!481008))

(assert (= (and b!481008 res!286817) b!481010))

(assert (= (and b!481008 (not res!286816)) b!481028))

(assert (= (and b!481028 res!286819) b!481026))

(assert (= (and b!481008 res!286821) b!481020))

(assert (= (and b!481020 c!57823) b!481011))

(assert (= (and b!481020 (not c!57823)) b!481012))

(assert (= (and b!481011 res!286815) b!481027))

(assert (= (or b!481011 b!481012) bm!30925))

(assert (= (and b!481020 res!286822) b!481013))

(assert (= (and b!481013 c!57828) b!481016))

(assert (= (and b!481013 (not c!57828)) b!481025))

(assert (= (and b!481016 res!286823) b!481017))

(assert (= (or b!481016 b!481025) bm!30924))

(declare-fun b_lambda!10785 () Bool)

(assert (=> (not b_lambda!10785) (not b!481026)))

(declare-fun t!15402 () Bool)

(declare-fun tb!4157 () Bool)

(assert (=> (and start!43412 (= defaultEntry!1519 defaultEntry!1519) t!15402) tb!4157))

(declare-fun result!7755 () Bool)

(assert (=> tb!4157 (= result!7755 tp_is_empty!13741)))

(assert (=> b!481026 t!15402))

(declare-fun b_and!20967 () Bool)

(assert (= b_and!20961 (and (=> t!15402 result!7755) b_and!20967)))

(assert (=> b!481010 m!461995))

(assert (=> b!481010 m!461995))

(declare-fun m!462011 () Bool)

(assert (=> b!481010 m!462011))

(declare-fun m!462013 () Bool)

(assert (=> b!481009 m!462013))

(declare-fun m!462015 () Bool)

(assert (=> bm!30924 m!462015))

(declare-fun m!462017 () Bool)

(assert (=> bm!30925 m!462017))

(declare-fun m!462019 () Bool)

(assert (=> b!481026 m!462019))

(assert (=> b!481026 m!461995))

(declare-fun m!462021 () Bool)

(assert (=> b!481026 m!462021))

(assert (=> b!481026 m!461995))

(declare-fun m!462023 () Bool)

(assert (=> b!481026 m!462023))

(assert (=> b!481026 m!462019))

(assert (=> b!481026 m!462021))

(declare-fun m!462025 () Bool)

(assert (=> b!481026 m!462025))

(assert (=> b!481028 m!461995))

(assert (=> b!481028 m!461995))

(declare-fun m!462027 () Bool)

(assert (=> b!481028 m!462027))

(declare-fun m!462029 () Bool)

(assert (=> bm!30922 m!462029))

(assert (=> b!481023 m!461995))

(assert (=> b!481023 m!461995))

(assert (=> b!481023 m!462011))

(declare-fun m!462031 () Bool)

(assert (=> b!481018 m!462031))

(declare-fun m!462033 () Bool)

(assert (=> b!481018 m!462033))

(declare-fun m!462035 () Bool)

(assert (=> b!481018 m!462035))

(declare-fun m!462037 () Bool)

(assert (=> b!481018 m!462037))

(declare-fun m!462039 () Bool)

(assert (=> b!481018 m!462039))

(declare-fun m!462041 () Bool)

(assert (=> b!481018 m!462041))

(declare-fun m!462043 () Bool)

(assert (=> b!481018 m!462043))

(declare-fun m!462045 () Bool)

(assert (=> b!481018 m!462045))

(declare-fun m!462047 () Bool)

(assert (=> b!481018 m!462047))

(declare-fun m!462049 () Bool)

(assert (=> b!481018 m!462049))

(assert (=> b!481018 m!462041))

(declare-fun m!462051 () Bool)

(assert (=> b!481018 m!462051))

(assert (=> b!481018 m!461995))

(declare-fun m!462053 () Bool)

(assert (=> b!481018 m!462053))

(declare-fun m!462055 () Bool)

(assert (=> b!481018 m!462055))

(assert (=> b!481018 m!462045))

(declare-fun m!462057 () Bool)

(assert (=> b!481018 m!462057))

(declare-fun m!462059 () Bool)

(assert (=> b!481018 m!462059))

(assert (=> b!481018 m!462057))

(declare-fun m!462061 () Bool)

(assert (=> b!481018 m!462061))

(assert (=> b!481018 m!462037))

(assert (=> bm!30920 m!462053))

(assert (=> d!76577 m!461895))

(declare-fun m!462063 () Bool)

(assert (=> b!481027 m!462063))

(declare-fun m!462065 () Bool)

(assert (=> b!481017 m!462065))

(assert (=> b!480853 d!76577))

(declare-fun d!76579 () Bool)

(assert (=> d!76579 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!480854 d!76579))

(declare-fun b!481041 () Bool)

(declare-fun e!283023 () Bool)

(declare-fun e!283024 () Bool)

(assert (=> b!481041 (= e!283023 e!283024)))

(declare-fun c!57831 () Bool)

(assert (=> b!481041 (= c!57831 (validKeyInArray!0 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481042 () Bool)

(declare-fun e!283026 () Bool)

(assert (=> b!481042 (= e!283026 e!283023)))

(declare-fun res!286832 () Bool)

(assert (=> b!481042 (=> (not res!286832) (not e!283023))))

(declare-fun e!283025 () Bool)

(assert (=> b!481042 (= res!286832 (not e!283025))))

(declare-fun res!286831 () Bool)

(assert (=> b!481042 (=> (not res!286831) (not e!283025))))

(assert (=> b!481042 (= res!286831 (validKeyInArray!0 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76581 () Bool)

(declare-fun res!286830 () Bool)

(assert (=> d!76581 (=> res!286830 e!283026)))

(assert (=> d!76581 (= res!286830 (bvsge #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(assert (=> d!76581 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9189) e!283026)))

(declare-fun bm!30928 () Bool)

(declare-fun call!30931 () Bool)

(assert (=> bm!30928 (= call!30931 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57831 (Cons!9188 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000) Nil!9189) Nil!9189)))))

(declare-fun b!481043 () Bool)

(assert (=> b!481043 (= e!283024 call!30931)))

(declare-fun b!481044 () Bool)

(declare-fun contains!2612 (List!9192 (_ BitVec 64)) Bool)

(assert (=> b!481044 (= e!283025 (contains!2612 Nil!9189 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!481045 () Bool)

(assert (=> b!481045 (= e!283024 call!30931)))

(assert (= (and d!76581 (not res!286830)) b!481042))

(assert (= (and b!481042 res!286831) b!481044))

(assert (= (and b!481042 res!286832) b!481041))

(assert (= (and b!481041 c!57831) b!481043))

(assert (= (and b!481041 (not c!57831)) b!481045))

(assert (= (or b!481043 b!481045) bm!30928))

(assert (=> b!481041 m!461995))

(assert (=> b!481041 m!461995))

(assert (=> b!481041 m!462011))

(assert (=> b!481042 m!461995))

(assert (=> b!481042 m!461995))

(assert (=> b!481042 m!462011))

(assert (=> bm!30928 m!461995))

(declare-fun m!462067 () Bool)

(assert (=> bm!30928 m!462067))

(assert (=> b!481044 m!461995))

(assert (=> b!481044 m!461995))

(declare-fun m!462069 () Bool)

(assert (=> b!481044 m!462069))

(assert (=> b!480851 d!76581))

(declare-fun d!76583 () Bool)

(declare-fun res!286833 () Bool)

(declare-fun e!283029 () Bool)

(assert (=> d!76583 (=> res!286833 e!283029)))

(assert (=> d!76583 (= res!286833 (bvsge #b00000000000000000000000000000000 (size!15335 _keys!1874)))))

(assert (=> d!76583 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!283029)))

(declare-fun b!481046 () Bool)

(declare-fun e!283027 () Bool)

(declare-fun e!283028 () Bool)

(assert (=> b!481046 (= e!283027 e!283028)))

(declare-fun lt!218261 () (_ BitVec 64))

(assert (=> b!481046 (= lt!218261 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218262 () Unit!14094)

(assert (=> b!481046 (= lt!218262 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218261 #b00000000000000000000000000000000))))

(assert (=> b!481046 (arrayContainsKey!0 _keys!1874 lt!218261 #b00000000000000000000000000000000)))

(declare-fun lt!218263 () Unit!14094)

(assert (=> b!481046 (= lt!218263 lt!218262)))

(declare-fun res!286834 () Bool)

(assert (=> b!481046 (= res!286834 (= (seekEntryOrOpen!0 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3566 #b00000000000000000000000000000000)))))

(assert (=> b!481046 (=> (not res!286834) (not e!283028))))

(declare-fun b!481047 () Bool)

(declare-fun call!30932 () Bool)

(assert (=> b!481047 (= e!283028 call!30932)))

(declare-fun b!481048 () Bool)

(assert (=> b!481048 (= e!283029 e!283027)))

(declare-fun c!57832 () Bool)

(assert (=> b!481048 (= c!57832 (validKeyInArray!0 (select (arr!14976 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30929 () Bool)

(assert (=> bm!30929 (= call!30932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!481049 () Bool)

(assert (=> b!481049 (= e!283027 call!30932)))

(assert (= (and d!76583 (not res!286833)) b!481048))

(assert (= (and b!481048 c!57832) b!481046))

(assert (= (and b!481048 (not c!57832)) b!481049))

(assert (= (and b!481046 res!286834) b!481047))

(assert (= (or b!481047 b!481049) bm!30929))

(assert (=> b!481046 m!461995))

(declare-fun m!462071 () Bool)

(assert (=> b!481046 m!462071))

(declare-fun m!462073 () Bool)

(assert (=> b!481046 m!462073))

(assert (=> b!481046 m!461995))

(declare-fun m!462075 () Bool)

(assert (=> b!481046 m!462075))

(assert (=> b!481048 m!461995))

(assert (=> b!481048 m!461995))

(assert (=> b!481048 m!462011))

(declare-fun m!462077 () Bool)

(assert (=> bm!30929 m!462077))

(assert (=> b!480850 d!76583))

(declare-fun d!76585 () Bool)

(assert (=> d!76585 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43412 d!76585))

(declare-fun d!76587 () Bool)

(assert (=> d!76587 (= (array_inv!10892 _values!1516) (bvsge (size!15336 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43412 d!76587))

(declare-fun d!76589 () Bool)

(assert (=> d!76589 (= (array_inv!10893 _keys!1874) (bvsge (size!15335 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43412 d!76589))

(declare-fun mapIsEmpty!22327 () Bool)

(declare-fun mapRes!22327 () Bool)

(assert (=> mapIsEmpty!22327 mapRes!22327))

(declare-fun mapNonEmpty!22327 () Bool)

(declare-fun tp!42982 () Bool)

(declare-fun e!283034 () Bool)

(assert (=> mapNonEmpty!22327 (= mapRes!22327 (and tp!42982 e!283034))))

(declare-fun mapKey!22327 () (_ BitVec 32))

(declare-fun mapValue!22327 () ValueCell!6509)

(declare-fun mapRest!22327 () (Array (_ BitVec 32) ValueCell!6509))

(assert (=> mapNonEmpty!22327 (= mapRest!22318 (store mapRest!22327 mapKey!22327 mapValue!22327))))

(declare-fun condMapEmpty!22327 () Bool)

(declare-fun mapDefault!22327 () ValueCell!6509)

(assert (=> mapNonEmpty!22318 (= condMapEmpty!22327 (= mapRest!22318 ((as const (Array (_ BitVec 32) ValueCell!6509)) mapDefault!22327)))))

(declare-fun e!283035 () Bool)

(assert (=> mapNonEmpty!22318 (= tp!42966 (and e!283035 mapRes!22327))))

(declare-fun b!481057 () Bool)

(assert (=> b!481057 (= e!283035 tp_is_empty!13741)))

(declare-fun b!481056 () Bool)

(assert (=> b!481056 (= e!283034 tp_is_empty!13741)))

(assert (= (and mapNonEmpty!22318 condMapEmpty!22327) mapIsEmpty!22327))

(assert (= (and mapNonEmpty!22318 (not condMapEmpty!22327)) mapNonEmpty!22327))

(assert (= (and mapNonEmpty!22327 ((_ is ValueCellFull!6509) mapValue!22327)) b!481056))

(assert (= (and mapNonEmpty!22318 ((_ is ValueCellFull!6509) mapDefault!22327)) b!481057))

(declare-fun m!462079 () Bool)

(assert (=> mapNonEmpty!22327 m!462079))

(declare-fun b_lambda!10787 () Bool)

(assert (= b_lambda!10785 (or (and start!43412 b_free!12229) b_lambda!10787)))

(check-sat (not mapNonEmpty!22327) (not bm!30929) tp_is_empty!13741 (not bm!30922) (not b!481026) (not bm!30924) (not d!76571) (not bm!30920) (not b!480944) (not b!481044) (not bm!30925) (not bm!30928) (not b!480949) (not b!481010) (not b!480937) (not b!481048) (not b!480965) b_and!20967 (not b!481017) (not b!481009) (not d!76575) (not b!481018) (not b!480963) (not b!480935) (not d!76567) (not b!481027) (not b!481023) (not b!481041) (not b!481042) (not bm!30904) (not d!76577) (not b!480956) (not b_lambda!10787) (not b_next!12229) (not b!481028) (not b!481046))
(check-sat b_and!20967 (not b_next!12229))
