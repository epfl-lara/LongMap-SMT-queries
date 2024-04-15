; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131846 () Bool)

(assert start!131846)

(declare-fun b_free!31609 () Bool)

(declare-fun b_next!31609 () Bool)

(assert (=> start!131846 (= b_free!31609 (not b_next!31609))))

(declare-fun tp!111079 () Bool)

(declare-fun b_and!51001 () Bool)

(assert (=> start!131846 (= tp!111079 b_and!51001)))

(declare-datatypes ((array!102912 0))(
  ( (array!102913 (arr!49659 (Array (_ BitVec 32) (_ BitVec 64))) (size!50211 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102912)

(declare-datatypes ((V!58957 0))(
  ( (V!58958 (val!19020 Int)) )
))
(declare-fun zeroValue!436 () V!58957)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-datatypes ((tuple2!24500 0))(
  ( (tuple2!24501 (_1!12261 (_ BitVec 64)) (_2!12261 V!58957)) )
))
(declare-datatypes ((List!35990 0))(
  ( (Nil!35987) (Cons!35986 (h!37432 tuple2!24500) (t!50676 List!35990)) )
))
(declare-datatypes ((ListLongMap!22109 0))(
  ( (ListLongMap!22110 (toList!11070 List!35990)) )
))
(declare-fun call!68764 () ListLongMap!22109)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18032 0))(
  ( (ValueCellFull!18032 (v!21817 V!58957)) (EmptyCell!18032) )
))
(declare-datatypes ((array!102914 0))(
  ( (array!102915 (arr!49660 (Array (_ BitVec 32) ValueCell!18032)) (size!50212 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102914)

(declare-fun minValue!436 () V!58957)

(declare-fun bm!68757 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6540 (array!102912 array!102914 (_ BitVec 32) (_ BitVec 32) V!58957 V!58957 (_ BitVec 32) Int) ListLongMap!22109)

(assert (=> bm!68757 (= call!68764 (getCurrentListMapNoExtraKeys!6540 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1543866 () Bool)

(declare-fun e!859314 () ListLongMap!22109)

(declare-fun e!859310 () ListLongMap!22109)

(assert (=> b!1543866 (= e!859314 e!859310)))

(declare-fun c!141282 () Bool)

(declare-fun lt!665814 () Bool)

(assert (=> b!1543866 (= c!141282 (and (not lt!665814) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1059197 () Bool)

(declare-fun e!859312 () Bool)

(assert (=> start!131846 (=> (not res!1059197) (not e!859312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131846 (= res!1059197 (validMask!0 mask!926))))

(assert (=> start!131846 e!859312))

(declare-fun array_inv!38825 (array!102912) Bool)

(assert (=> start!131846 (array_inv!38825 _keys!618)))

(declare-fun tp_is_empty!37885 () Bool)

(assert (=> start!131846 tp_is_empty!37885))

(assert (=> start!131846 true))

(assert (=> start!131846 tp!111079))

(declare-fun e!859308 () Bool)

(declare-fun array_inv!38826 (array!102914) Bool)

(assert (=> start!131846 (and (array_inv!38826 _values!470) e!859308)))

(declare-fun b!1543867 () Bool)

(declare-fun e!859309 () ListLongMap!22109)

(declare-fun call!68762 () ListLongMap!22109)

(assert (=> b!1543867 (= e!859309 call!68762)))

(declare-fun mapIsEmpty!58531 () Bool)

(declare-fun mapRes!58531 () Bool)

(assert (=> mapIsEmpty!58531 mapRes!58531))

(declare-fun b!1543868 () Bool)

(declare-fun res!1059194 () Bool)

(assert (=> b!1543868 (=> (not res!1059194) (not e!859312))))

(assert (=> b!1543868 (= res!1059194 (and (= (size!50212 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50211 _keys!618) (size!50212 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543869 () Bool)

(declare-fun c!141280 () Bool)

(assert (=> b!1543869 (= c!141280 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665814))))

(assert (=> b!1543869 (= e!859310 e!859309)))

(declare-fun b!1543870 () Bool)

(declare-fun e!859311 () Bool)

(assert (=> b!1543870 (= e!859311 tp_is_empty!37885)))

(declare-fun bm!68758 () Bool)

(declare-fun call!68763 () ListLongMap!22109)

(declare-fun call!68760 () ListLongMap!22109)

(assert (=> bm!68758 (= call!68763 call!68760)))

(declare-fun bm!68759 () Bool)

(declare-fun call!68761 () ListLongMap!22109)

(assert (=> bm!68759 (= call!68762 call!68761)))

(declare-fun b!1543871 () Bool)

(assert (=> b!1543871 (= e!859310 call!68762)))

(declare-fun b!1543872 () Bool)

(declare-fun +!4904 (ListLongMap!22109 tuple2!24500) ListLongMap!22109)

(assert (=> b!1543872 (= e!859314 (+!4904 call!68761 (tuple2!24501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1543873 () Bool)

(declare-fun res!1059196 () Bool)

(assert (=> b!1543873 (=> (not res!1059196) (not e!859312))))

(declare-datatypes ((List!35991 0))(
  ( (Nil!35988) (Cons!35987 (h!37433 (_ BitVec 64)) (t!50677 List!35991)) )
))
(declare-fun arrayNoDuplicates!0 (array!102912 (_ BitVec 32) List!35991) Bool)

(assert (=> b!1543873 (= res!1059196 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35988))))

(declare-fun c!141281 () Bool)

(declare-fun bm!68760 () Bool)

(assert (=> bm!68760 (= call!68761 (+!4904 (ite c!141281 call!68764 (ite c!141282 call!68760 call!68763)) (ite (or c!141281 c!141282) (tuple2!24501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1543874 () Bool)

(declare-fun e!859313 () Bool)

(assert (=> b!1543874 (= e!859313 tp_is_empty!37885)))

(declare-fun b!1543875 () Bool)

(assert (=> b!1543875 (= e!859309 call!68763)))

(declare-fun b!1543876 () Bool)

(declare-fun res!1059198 () Bool)

(assert (=> b!1543876 (=> (not res!1059198) (not e!859312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102912 (_ BitVec 32)) Bool)

(assert (=> b!1543876 (= res!1059198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543877 () Bool)

(assert (=> b!1543877 (= e!859308 (and e!859313 mapRes!58531))))

(declare-fun condMapEmpty!58531 () Bool)

(declare-fun mapDefault!58531 () ValueCell!18032)

(assert (=> b!1543877 (= condMapEmpty!58531 (= (arr!49660 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18032)) mapDefault!58531)))))

(declare-fun mapNonEmpty!58531 () Bool)

(declare-fun tp!111080 () Bool)

(assert (=> mapNonEmpty!58531 (= mapRes!58531 (and tp!111080 e!859311))))

(declare-fun mapKey!58531 () (_ BitVec 32))

(declare-fun mapValue!58531 () ValueCell!18032)

(declare-fun mapRest!58531 () (Array (_ BitVec 32) ValueCell!18032))

(assert (=> mapNonEmpty!58531 (= (arr!49660 _values!470) (store mapRest!58531 mapKey!58531 mapValue!58531))))

(declare-fun b!1543878 () Bool)

(declare-fun res!1059195 () Bool)

(assert (=> b!1543878 (=> (not res!1059195) (not e!859312))))

(assert (=> b!1543878 (= res!1059195 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50211 _keys!618))))))

(declare-fun bm!68761 () Bool)

(assert (=> bm!68761 (= call!68760 call!68764)))

(declare-fun b!1543879 () Bool)

(assert (=> b!1543879 (= e!859312 false)))

(declare-fun lt!665815 () ListLongMap!22109)

(assert (=> b!1543879 (= lt!665815 e!859314)))

(assert (=> b!1543879 (= c!141281 (and (not lt!665814) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1543879 (= lt!665814 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!131846 res!1059197) b!1543868))

(assert (= (and b!1543868 res!1059194) b!1543876))

(assert (= (and b!1543876 res!1059198) b!1543873))

(assert (= (and b!1543873 res!1059196) b!1543878))

(assert (= (and b!1543878 res!1059195) b!1543879))

(assert (= (and b!1543879 c!141281) b!1543872))

(assert (= (and b!1543879 (not c!141281)) b!1543866))

(assert (= (and b!1543866 c!141282) b!1543871))

(assert (= (and b!1543866 (not c!141282)) b!1543869))

(assert (= (and b!1543869 c!141280) b!1543867))

(assert (= (and b!1543869 (not c!141280)) b!1543875))

(assert (= (or b!1543867 b!1543875) bm!68758))

(assert (= (or b!1543871 bm!68758) bm!68761))

(assert (= (or b!1543871 b!1543867) bm!68759))

(assert (= (or b!1543872 bm!68761) bm!68757))

(assert (= (or b!1543872 bm!68759) bm!68760))

(assert (= (and b!1543877 condMapEmpty!58531) mapIsEmpty!58531))

(assert (= (and b!1543877 (not condMapEmpty!58531)) mapNonEmpty!58531))

(get-info :version)

(assert (= (and mapNonEmpty!58531 ((_ is ValueCellFull!18032) mapValue!58531)) b!1543870))

(assert (= (and b!1543877 ((_ is ValueCellFull!18032) mapDefault!58531)) b!1543874))

(assert (= start!131846 b!1543877))

(declare-fun m!1424277 () Bool)

(assert (=> bm!68760 m!1424277))

(declare-fun m!1424279 () Bool)

(assert (=> mapNonEmpty!58531 m!1424279))

(declare-fun m!1424281 () Bool)

(assert (=> bm!68757 m!1424281))

(declare-fun m!1424283 () Bool)

(assert (=> b!1543876 m!1424283))

(declare-fun m!1424285 () Bool)

(assert (=> start!131846 m!1424285))

(declare-fun m!1424287 () Bool)

(assert (=> start!131846 m!1424287))

(declare-fun m!1424289 () Bool)

(assert (=> start!131846 m!1424289))

(declare-fun m!1424291 () Bool)

(assert (=> b!1543872 m!1424291))

(declare-fun m!1424293 () Bool)

(assert (=> b!1543873 m!1424293))

(check-sat (not bm!68760) b_and!51001 (not bm!68757) (not b!1543876) (not b!1543873) (not b!1543872) (not start!131846) (not b_next!31609) (not mapNonEmpty!58531) tp_is_empty!37885)
(check-sat b_and!51001 (not b_next!31609))
