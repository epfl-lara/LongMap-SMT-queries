; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132320 () Bool)

(assert start!132320)

(declare-fun b_free!31621 () Bool)

(declare-fun b_next!31621 () Bool)

(assert (=> start!132320 (= b_free!31621 (not b_next!31621))))

(declare-fun tp!111114 () Bool)

(declare-fun b_and!51033 () Bool)

(assert (=> start!132320 (= tp!111114 b_and!51033)))

(declare-fun b!1546867 () Bool)

(declare-fun c!142223 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667044 () Bool)

(assert (=> b!1546867 (= c!142223 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667044))))

(declare-datatypes ((V!58973 0))(
  ( (V!58974 (val!19026 Int)) )
))
(declare-datatypes ((tuple2!24498 0))(
  ( (tuple2!24499 (_1!12260 (_ BitVec 64)) (_2!12260 V!58973)) )
))
(declare-datatypes ((List!35993 0))(
  ( (Nil!35990) (Cons!35989 (h!37452 tuple2!24498) (t!50679 List!35993)) )
))
(declare-datatypes ((ListLongMap!22115 0))(
  ( (ListLongMap!22116 (toList!11073 List!35993)) )
))
(declare-fun e!861163 () ListLongMap!22115)

(declare-fun e!861164 () ListLongMap!22115)

(assert (=> b!1546867 (= e!861163 e!861164)))

(declare-fun b!1546868 () Bool)

(declare-fun e!861158 () ListLongMap!22115)

(declare-fun call!69036 () ListLongMap!22115)

(declare-fun minValue!436 () V!58973)

(declare-fun +!4920 (ListLongMap!22115 tuple2!24498) ListLongMap!22115)

(assert (=> b!1546868 (= e!861158 (+!4920 call!69036 (tuple2!24499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546869 () Bool)

(declare-fun res!1060276 () Bool)

(declare-fun e!861162 () Bool)

(assert (=> b!1546869 (=> (not res!1060276) (not e!861162))))

(declare-datatypes ((array!103126 0))(
  ( (array!103127 (arr!49758 (Array (_ BitVec 32) (_ BitVec 64))) (size!50309 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103126)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103126 (_ BitVec 32)) Bool)

(assert (=> b!1546869 (= res!1060276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69033 () Bool)

(declare-fun call!69039 () ListLongMap!22115)

(declare-fun call!69035 () ListLongMap!22115)

(assert (=> bm!69033 (= call!69039 call!69035)))

(declare-fun b!1546870 () Bool)

(declare-fun e!861165 () Bool)

(declare-fun tp_is_empty!37897 () Bool)

(assert (=> b!1546870 (= e!861165 tp_is_empty!37897)))

(declare-fun b!1546871 () Bool)

(declare-fun res!1060275 () Bool)

(assert (=> b!1546871 (=> (not res!1060275) (not e!861162))))

(declare-datatypes ((List!35994 0))(
  ( (Nil!35991) (Cons!35990 (h!37453 (_ BitVec 64)) (t!50680 List!35994)) )
))
(declare-fun arrayNoDuplicates!0 (array!103126 (_ BitVec 32) List!35994) Bool)

(assert (=> b!1546871 (= res!1060275 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35991))))

(declare-fun mapIsEmpty!58549 () Bool)

(declare-fun mapRes!58549 () Bool)

(assert (=> mapIsEmpty!58549 mapRes!58549))

(declare-fun bm!69034 () Bool)

(declare-fun call!69037 () ListLongMap!22115)

(assert (=> bm!69034 (= call!69037 call!69036)))

(declare-fun res!1060273 () Bool)

(assert (=> start!132320 (=> (not res!1060273) (not e!861162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132320 (= res!1060273 (validMask!0 mask!926))))

(assert (=> start!132320 e!861162))

(declare-fun array_inv!38967 (array!103126) Bool)

(assert (=> start!132320 (array_inv!38967 _keys!618)))

(assert (=> start!132320 tp_is_empty!37897))

(assert (=> start!132320 true))

(assert (=> start!132320 tp!111114))

(declare-datatypes ((ValueCell!18038 0))(
  ( (ValueCellFull!18038 (v!21819 V!58973)) (EmptyCell!18038) )
))
(declare-datatypes ((array!103128 0))(
  ( (array!103129 (arr!49759 (Array (_ BitVec 32) ValueCell!18038)) (size!50310 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103128)

(declare-fun e!861161 () Bool)

(declare-fun array_inv!38968 (array!103128) Bool)

(assert (=> start!132320 (and (array_inv!38968 _values!470) e!861161)))

(declare-fun zeroValue!436 () V!58973)

(declare-fun bm!69032 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6560 (array!103126 array!103128 (_ BitVec 32) (_ BitVec 32) V!58973 V!58973 (_ BitVec 32) Int) ListLongMap!22115)

(assert (=> bm!69032 (= call!69035 (getCurrentListMapNoExtraKeys!6560 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546872 () Bool)

(declare-fun res!1060277 () Bool)

(assert (=> b!1546872 (=> (not res!1060277) (not e!861162))))

(assert (=> b!1546872 (= res!1060277 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50309 _keys!618))))))

(declare-fun b!1546873 () Bool)

(declare-fun res!1060274 () Bool)

(assert (=> b!1546873 (=> (not res!1060274) (not e!861162))))

(assert (=> b!1546873 (= res!1060274 (and (= (size!50310 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50309 _keys!618) (size!50310 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546874 () Bool)

(declare-fun e!861160 () Bool)

(assert (=> b!1546874 (= e!861160 tp_is_empty!37897)))

(declare-fun mapNonEmpty!58549 () Bool)

(declare-fun tp!111115 () Bool)

(assert (=> mapNonEmpty!58549 (= mapRes!58549 (and tp!111115 e!861165))))

(declare-fun mapRest!58549 () (Array (_ BitVec 32) ValueCell!18038))

(declare-fun mapValue!58549 () ValueCell!18038)

(declare-fun mapKey!58549 () (_ BitVec 32))

(assert (=> mapNonEmpty!58549 (= (arr!49759 _values!470) (store mapRest!58549 mapKey!58549 mapValue!58549))))

(declare-fun b!1546875 () Bool)

(assert (=> b!1546875 (= e!861158 e!861163)))

(declare-fun c!142224 () Bool)

(assert (=> b!1546875 (= c!142224 (and (not lt!667044) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546876 () Bool)

(assert (=> b!1546876 (= e!861162 false)))

(declare-fun lt!667045 () ListLongMap!22115)

(assert (=> b!1546876 (= lt!667045 e!861158)))

(declare-fun c!142225 () Bool)

(assert (=> b!1546876 (= c!142225 (and (not lt!667044) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546876 (= lt!667044 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546877 () Bool)

(assert (=> b!1546877 (= e!861161 (and e!861160 mapRes!58549))))

(declare-fun condMapEmpty!58549 () Bool)

(declare-fun mapDefault!58549 () ValueCell!18038)

(assert (=> b!1546877 (= condMapEmpty!58549 (= (arr!49759 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18038)) mapDefault!58549)))))

(declare-fun bm!69035 () Bool)

(declare-fun call!69038 () ListLongMap!22115)

(assert (=> bm!69035 (= call!69038 call!69039)))

(declare-fun bm!69036 () Bool)

(assert (=> bm!69036 (= call!69036 (+!4920 (ite c!142225 call!69035 (ite c!142224 call!69039 call!69038)) (ite (or c!142225 c!142224) (tuple2!24499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546878 () Bool)

(assert (=> b!1546878 (= e!861164 call!69038)))

(declare-fun b!1546879 () Bool)

(assert (=> b!1546879 (= e!861163 call!69037)))

(declare-fun b!1546880 () Bool)

(assert (=> b!1546880 (= e!861164 call!69037)))

(assert (= (and start!132320 res!1060273) b!1546873))

(assert (= (and b!1546873 res!1060274) b!1546869))

(assert (= (and b!1546869 res!1060276) b!1546871))

(assert (= (and b!1546871 res!1060275) b!1546872))

(assert (= (and b!1546872 res!1060277) b!1546876))

(assert (= (and b!1546876 c!142225) b!1546868))

(assert (= (and b!1546876 (not c!142225)) b!1546875))

(assert (= (and b!1546875 c!142224) b!1546879))

(assert (= (and b!1546875 (not c!142224)) b!1546867))

(assert (= (and b!1546867 c!142223) b!1546880))

(assert (= (and b!1546867 (not c!142223)) b!1546878))

(assert (= (or b!1546880 b!1546878) bm!69035))

(assert (= (or b!1546879 bm!69035) bm!69033))

(assert (= (or b!1546879 b!1546880) bm!69034))

(assert (= (or b!1546868 bm!69033) bm!69032))

(assert (= (or b!1546868 bm!69034) bm!69036))

(assert (= (and b!1546877 condMapEmpty!58549) mapIsEmpty!58549))

(assert (= (and b!1546877 (not condMapEmpty!58549)) mapNonEmpty!58549))

(get-info :version)

(assert (= (and mapNonEmpty!58549 ((_ is ValueCellFull!18038) mapValue!58549)) b!1546870))

(assert (= (and b!1546877 ((_ is ValueCellFull!18038) mapDefault!58549)) b!1546874))

(assert (= start!132320 b!1546877))

(declare-fun m!1427535 () Bool)

(assert (=> b!1546868 m!1427535))

(declare-fun m!1427537 () Bool)

(assert (=> mapNonEmpty!58549 m!1427537))

(declare-fun m!1427539 () Bool)

(assert (=> bm!69032 m!1427539))

(declare-fun m!1427541 () Bool)

(assert (=> b!1546871 m!1427541))

(declare-fun m!1427543 () Bool)

(assert (=> bm!69036 m!1427543))

(declare-fun m!1427545 () Bool)

(assert (=> b!1546869 m!1427545))

(declare-fun m!1427547 () Bool)

(assert (=> start!132320 m!1427547))

(declare-fun m!1427549 () Bool)

(assert (=> start!132320 m!1427549))

(declare-fun m!1427551 () Bool)

(assert (=> start!132320 m!1427551))

(check-sat b_and!51033 tp_is_empty!37897 (not b!1546868) (not start!132320) (not bm!69032) (not b!1546871) (not bm!69036) (not b_next!31621) (not mapNonEmpty!58549) (not b!1546869))
(check-sat b_and!51033 (not b_next!31621))
