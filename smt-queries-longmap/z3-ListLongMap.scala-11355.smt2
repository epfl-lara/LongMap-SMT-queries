; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132036 () Bool)

(assert start!132036)

(declare-fun b_free!31749 () Bool)

(declare-fun b_next!31749 () Bool)

(assert (=> start!132036 (= b_free!31749 (not b_next!31749))))

(declare-fun tp!111498 () Bool)

(declare-fun b_and!51159 () Bool)

(assert (=> start!132036 (= tp!111498 b_and!51159)))

(declare-fun b!1547417 () Bool)

(declare-datatypes ((V!59143 0))(
  ( (V!59144 (val!19090 Int)) )
))
(declare-datatypes ((tuple2!24560 0))(
  ( (tuple2!24561 (_1!12291 (_ BitVec 64)) (_2!12291 V!59143)) )
))
(declare-datatypes ((List!36058 0))(
  ( (Nil!36055) (Cons!36054 (h!37499 tuple2!24560) (t!50752 List!36058)) )
))
(declare-datatypes ((ListLongMap!22169 0))(
  ( (ListLongMap!22170 (toList!11100 List!36058)) )
))
(declare-fun e!861334 () ListLongMap!22169)

(declare-fun call!69849 () ListLongMap!22169)

(declare-fun minValue!436 () V!59143)

(declare-fun +!4931 (ListLongMap!22169 tuple2!24560) ListLongMap!22169)

(assert (=> b!1547417 (= e!861334 (+!4931 call!69849 (tuple2!24561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547418 () Bool)

(declare-fun e!861335 () Bool)

(declare-fun e!861341 () Bool)

(declare-fun mapRes!58741 () Bool)

(assert (=> b!1547418 (= e!861335 (and e!861341 mapRes!58741))))

(declare-fun condMapEmpty!58741 () Bool)

(declare-datatypes ((ValueCell!18102 0))(
  ( (ValueCellFull!18102 (v!21891 V!59143)) (EmptyCell!18102) )
))
(declare-datatypes ((array!103250 0))(
  ( (array!103251 (arr!49827 (Array (_ BitVec 32) ValueCell!18102)) (size!50377 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103250)

(declare-fun mapDefault!58741 () ValueCell!18102)

(assert (=> b!1547418 (= condMapEmpty!58741 (= (arr!49827 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18102)) mapDefault!58741)))))

(declare-fun b!1547419 () Bool)

(declare-fun res!1060672 () Bool)

(declare-fun e!861337 () Bool)

(assert (=> b!1547419 (=> (not res!1060672) (not e!861337))))

(declare-datatypes ((array!103252 0))(
  ( (array!103253 (arr!49828 (Array (_ BitVec 32) (_ BitVec 64))) (size!50378 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103252)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547419 (= res!1060672 (validKeyInArray!0 (select (arr!49828 _keys!618) from!762)))))

(declare-fun b!1547420 () Bool)

(declare-fun e!861339 () ListLongMap!22169)

(declare-fun call!69846 () ListLongMap!22169)

(assert (=> b!1547420 (= e!861339 call!69846)))

(declare-fun b!1547421 () Bool)

(declare-fun e!861340 () Bool)

(declare-fun tp_is_empty!38025 () Bool)

(assert (=> b!1547421 (= e!861340 tp_is_empty!38025)))

(declare-fun b!1547422 () Bool)

(declare-fun res!1060675 () Bool)

(declare-fun e!861342 () Bool)

(assert (=> b!1547422 (=> (not res!1060675) (not e!861342))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1547422 (= res!1060675 (and (= (size!50377 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50378 _keys!618) (size!50377 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!69842 () Bool)

(declare-fun call!69848 () ListLongMap!22169)

(declare-fun call!69847 () ListLongMap!22169)

(assert (=> bm!69842 (= call!69848 call!69847)))

(declare-fun b!1547423 () Bool)

(declare-fun res!1060677 () Bool)

(assert (=> b!1547423 (=> (not res!1060677) (not e!861342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103252 (_ BitVec 32)) Bool)

(assert (=> b!1547423 (= res!1060677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun zeroValue!436 () V!59143)

(declare-fun call!69845 () ListLongMap!22169)

(declare-fun bm!69843 () Bool)

(declare-fun c!142000 () Bool)

(declare-fun c!141999 () Bool)

(assert (=> bm!69843 (= call!69849 (+!4931 (ite c!141999 call!69845 (ite c!142000 call!69847 call!69848)) (ite (or c!141999 c!142000) (tuple2!24561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69844 () Bool)

(assert (=> bm!69844 (= call!69847 call!69845)))

(declare-fun res!1060673 () Bool)

(assert (=> start!132036 (=> (not res!1060673) (not e!861342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132036 (= res!1060673 (validMask!0 mask!926))))

(assert (=> start!132036 e!861342))

(declare-fun array_inv!38749 (array!103252) Bool)

(assert (=> start!132036 (array_inv!38749 _keys!618)))

(assert (=> start!132036 tp_is_empty!38025))

(assert (=> start!132036 true))

(assert (=> start!132036 tp!111498))

(declare-fun array_inv!38750 (array!103250) Bool)

(assert (=> start!132036 (and (array_inv!38750 _values!470) e!861335)))

(declare-fun b!1547424 () Bool)

(declare-fun c!142001 () Bool)

(declare-fun lt!666869 () Bool)

(assert (=> b!1547424 (= c!142001 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666869))))

(declare-fun e!861336 () ListLongMap!22169)

(assert (=> b!1547424 (= e!861336 e!861339)))

(declare-fun mapNonEmpty!58741 () Bool)

(declare-fun tp!111499 () Bool)

(assert (=> mapNonEmpty!58741 (= mapRes!58741 (and tp!111499 e!861340))))

(declare-fun mapRest!58741 () (Array (_ BitVec 32) ValueCell!18102))

(declare-fun mapKey!58741 () (_ BitVec 32))

(declare-fun mapValue!58741 () ValueCell!18102)

(assert (=> mapNonEmpty!58741 (= (arr!49827 _values!470) (store mapRest!58741 mapKey!58741 mapValue!58741))))

(declare-fun mapIsEmpty!58741 () Bool)

(assert (=> mapIsEmpty!58741 mapRes!58741))

(declare-fun b!1547425 () Bool)

(assert (=> b!1547425 (= e!861342 e!861337)))

(declare-fun res!1060676 () Bool)

(assert (=> b!1547425 (=> (not res!1060676) (not e!861337))))

(assert (=> b!1547425 (= res!1060676 (bvslt from!762 (size!50378 _keys!618)))))

(declare-fun lt!666871 () ListLongMap!22169)

(assert (=> b!1547425 (= lt!666871 e!861334)))

(assert (=> b!1547425 (= c!141999 (and (not lt!666869) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547425 (= lt!666869 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547426 () Bool)

(declare-fun res!1060674 () Bool)

(assert (=> b!1547426 (=> (not res!1060674) (not e!861342))))

(declare-datatypes ((List!36059 0))(
  ( (Nil!36056) (Cons!36055 (h!37500 (_ BitVec 64)) (t!50753 List!36059)) )
))
(declare-fun arrayNoDuplicates!0 (array!103252 (_ BitVec 32) List!36059) Bool)

(assert (=> b!1547426 (= res!1060674 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36056))))

(declare-fun b!1547427 () Bool)

(assert (=> b!1547427 (= e!861341 tp_is_empty!38025)))

(declare-fun bm!69845 () Bool)

(assert (=> bm!69845 (= call!69846 call!69849)))

(declare-fun b!1547428 () Bool)

(declare-fun res!1060671 () Bool)

(assert (=> b!1547428 (=> (not res!1060671) (not e!861342))))

(assert (=> b!1547428 (= res!1060671 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50378 _keys!618))))))

(declare-fun b!1547429 () Bool)

(assert (=> b!1547429 (= e!861334 e!861336)))

(assert (=> b!1547429 (= c!142000 (and (not lt!666869) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69846 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6560 (array!103252 array!103250 (_ BitVec 32) (_ BitVec 32) V!59143 V!59143 (_ BitVec 32) Int) ListLongMap!22169)

(assert (=> bm!69846 (= call!69845 (getCurrentListMapNoExtraKeys!6560 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547430 () Bool)

(assert (=> b!1547430 (= e!861339 call!69848)))

(declare-fun b!1547431 () Bool)

(assert (=> b!1547431 (= e!861336 call!69846)))

(declare-fun b!1547432 () Bool)

(assert (=> b!1547432 (= e!861337 (not true))))

(declare-fun lt!666872 () ListLongMap!22169)

(declare-fun apply!1052 (ListLongMap!22169 (_ BitVec 64)) V!59143)

(assert (=> b!1547432 (= (apply!1052 (+!4931 lt!666872 (tuple2!24561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49828 _keys!618) from!762)) (apply!1052 lt!666872 (select (arr!49828 _keys!618) from!762)))))

(declare-datatypes ((Unit!51554 0))(
  ( (Unit!51555) )
))
(declare-fun lt!666870 () Unit!51554)

(declare-fun addApplyDifferent!594 (ListLongMap!22169 (_ BitVec 64) V!59143 (_ BitVec 64)) Unit!51554)

(assert (=> b!1547432 (= lt!666870 (addApplyDifferent!594 lt!666872 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49828 _keys!618) from!762)))))

(declare-fun contains!10059 (ListLongMap!22169 (_ BitVec 64)) Bool)

(assert (=> b!1547432 (contains!10059 (+!4931 lt!666872 (tuple2!24561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49828 _keys!618) from!762))))

(declare-fun lt!666868 () Unit!51554)

(declare-fun addStillContains!1247 (ListLongMap!22169 (_ BitVec 64) V!59143 (_ BitVec 64)) Unit!51554)

(assert (=> b!1547432 (= lt!666868 (addStillContains!1247 lt!666872 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49828 _keys!618) from!762)))))

(assert (=> b!1547432 (= lt!666872 (getCurrentListMapNoExtraKeys!6560 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!132036 res!1060673) b!1547422))

(assert (= (and b!1547422 res!1060675) b!1547423))

(assert (= (and b!1547423 res!1060677) b!1547426))

(assert (= (and b!1547426 res!1060674) b!1547428))

(assert (= (and b!1547428 res!1060671) b!1547425))

(assert (= (and b!1547425 c!141999) b!1547417))

(assert (= (and b!1547425 (not c!141999)) b!1547429))

(assert (= (and b!1547429 c!142000) b!1547431))

(assert (= (and b!1547429 (not c!142000)) b!1547424))

(assert (= (and b!1547424 c!142001) b!1547420))

(assert (= (and b!1547424 (not c!142001)) b!1547430))

(assert (= (or b!1547420 b!1547430) bm!69842))

(assert (= (or b!1547431 bm!69842) bm!69844))

(assert (= (or b!1547431 b!1547420) bm!69845))

(assert (= (or b!1547417 bm!69844) bm!69846))

(assert (= (or b!1547417 bm!69845) bm!69843))

(assert (= (and b!1547425 res!1060676) b!1547419))

(assert (= (and b!1547419 res!1060672) b!1547432))

(assert (= (and b!1547418 condMapEmpty!58741) mapIsEmpty!58741))

(assert (= (and b!1547418 (not condMapEmpty!58741)) mapNonEmpty!58741))

(get-info :version)

(assert (= (and mapNonEmpty!58741 ((_ is ValueCellFull!18102) mapValue!58741)) b!1547421))

(assert (= (and b!1547418 ((_ is ValueCellFull!18102) mapDefault!58741)) b!1547427))

(assert (= start!132036 b!1547418))

(declare-fun m!1427041 () Bool)

(assert (=> b!1547419 m!1427041))

(assert (=> b!1547419 m!1427041))

(declare-fun m!1427043 () Bool)

(assert (=> b!1547419 m!1427043))

(declare-fun m!1427045 () Bool)

(assert (=> bm!69843 m!1427045))

(declare-fun m!1427047 () Bool)

(assert (=> b!1547426 m!1427047))

(declare-fun m!1427049 () Bool)

(assert (=> bm!69846 m!1427049))

(assert (=> b!1547432 m!1427041))

(declare-fun m!1427051 () Bool)

(assert (=> b!1547432 m!1427051))

(assert (=> b!1547432 m!1427049))

(assert (=> b!1547432 m!1427041))

(declare-fun m!1427053 () Bool)

(assert (=> b!1547432 m!1427053))

(assert (=> b!1547432 m!1427041))

(declare-fun m!1427055 () Bool)

(assert (=> b!1547432 m!1427055))

(assert (=> b!1547432 m!1427041))

(declare-fun m!1427057 () Bool)

(assert (=> b!1547432 m!1427057))

(assert (=> b!1547432 m!1427041))

(declare-fun m!1427059 () Bool)

(assert (=> b!1547432 m!1427059))

(declare-fun m!1427061 () Bool)

(assert (=> b!1547432 m!1427061))

(assert (=> b!1547432 m!1427061))

(assert (=> b!1547432 m!1427041))

(declare-fun m!1427063 () Bool)

(assert (=> b!1547432 m!1427063))

(assert (=> b!1547432 m!1427053))

(declare-fun m!1427065 () Bool)

(assert (=> b!1547417 m!1427065))

(declare-fun m!1427067 () Bool)

(assert (=> mapNonEmpty!58741 m!1427067))

(declare-fun m!1427069 () Bool)

(assert (=> start!132036 m!1427069))

(declare-fun m!1427071 () Bool)

(assert (=> start!132036 m!1427071))

(declare-fun m!1427073 () Bool)

(assert (=> start!132036 m!1427073))

(declare-fun m!1427075 () Bool)

(assert (=> b!1547423 m!1427075))

(check-sat tp_is_empty!38025 (not b!1547426) (not bm!69846) (not b!1547432) (not b!1547417) (not b_next!31749) (not b!1547423) (not mapNonEmpty!58741) b_and!51159 (not b!1547419) (not start!132036) (not bm!69843))
(check-sat b_and!51159 (not b_next!31749))
