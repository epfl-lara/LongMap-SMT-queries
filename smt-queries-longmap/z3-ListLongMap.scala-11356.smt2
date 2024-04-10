; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132042 () Bool)

(assert start!132042)

(declare-fun b_free!31755 () Bool)

(declare-fun b_next!31755 () Bool)

(assert (=> start!132042 (= b_free!31755 (not b_next!31755))))

(declare-fun tp!111517 () Bool)

(declare-fun b_and!51165 () Bool)

(assert (=> start!132042 (= tp!111517 b_and!51165)))

(declare-fun b!1547561 () Bool)

(declare-fun res!1060735 () Bool)

(declare-fun e!861420 () Bool)

(assert (=> b!1547561 (=> (not res!1060735) (not e!861420))))

(declare-datatypes ((array!103262 0))(
  ( (array!103263 (arr!49833 (Array (_ BitVec 32) (_ BitVec 64))) (size!50383 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103262)

(declare-datatypes ((List!36063 0))(
  ( (Nil!36060) (Cons!36059 (h!37504 (_ BitVec 64)) (t!50757 List!36063)) )
))
(declare-fun arrayNoDuplicates!0 (array!103262 (_ BitVec 32) List!36063) Bool)

(assert (=> b!1547561 (= res!1060735 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36060))))

(declare-fun b!1547562 () Bool)

(declare-fun e!861418 () Bool)

(declare-fun e!861417 () Bool)

(declare-fun mapRes!58750 () Bool)

(assert (=> b!1547562 (= e!861418 (and e!861417 mapRes!58750))))

(declare-fun condMapEmpty!58750 () Bool)

(declare-datatypes ((V!59151 0))(
  ( (V!59152 (val!19093 Int)) )
))
(declare-datatypes ((ValueCell!18105 0))(
  ( (ValueCellFull!18105 (v!21894 V!59151)) (EmptyCell!18105) )
))
(declare-datatypes ((array!103264 0))(
  ( (array!103265 (arr!49834 (Array (_ BitVec 32) ValueCell!18105)) (size!50384 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103264)

(declare-fun mapDefault!58750 () ValueCell!18105)

(assert (=> b!1547562 (= condMapEmpty!58750 (= (arr!49834 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18105)) mapDefault!58750)))))

(declare-fun b!1547563 () Bool)

(declare-datatypes ((tuple2!24566 0))(
  ( (tuple2!24567 (_1!12294 (_ BitVec 64)) (_2!12294 V!59151)) )
))
(declare-datatypes ((List!36064 0))(
  ( (Nil!36061) (Cons!36060 (h!37505 tuple2!24566) (t!50758 List!36064)) )
))
(declare-datatypes ((ListLongMap!22175 0))(
  ( (ListLongMap!22176 (toList!11103 List!36064)) )
))
(declare-fun e!861421 () ListLongMap!22175)

(declare-fun call!69894 () ListLongMap!22175)

(assert (=> b!1547563 (= e!861421 call!69894)))

(declare-fun bm!69887 () Bool)

(declare-fun call!69890 () ListLongMap!22175)

(declare-fun call!69891 () ListLongMap!22175)

(assert (=> bm!69887 (= call!69890 call!69891)))

(declare-fun b!1547564 () Bool)

(declare-fun e!861422 () Bool)

(declare-fun tp_is_empty!38031 () Bool)

(assert (=> b!1547564 (= e!861422 tp_is_empty!38031)))

(declare-fun b!1547565 () Bool)

(declare-fun e!861416 () ListLongMap!22175)

(declare-fun e!861423 () ListLongMap!22175)

(assert (=> b!1547565 (= e!861416 e!861423)))

(declare-fun c!142026 () Bool)

(declare-fun lt!666914 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547565 (= c!142026 (and (not lt!666914) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547566 () Bool)

(declare-fun e!861415 () Bool)

(assert (=> b!1547566 (= e!861415 (not true))))

(declare-fun minValue!436 () V!59151)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666916 () ListLongMap!22175)

(declare-fun apply!1054 (ListLongMap!22175 (_ BitVec 64)) V!59151)

(declare-fun +!4934 (ListLongMap!22175 tuple2!24566) ListLongMap!22175)

(assert (=> b!1547566 (= (apply!1054 (+!4934 lt!666916 (tuple2!24567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49833 _keys!618) from!762)) (apply!1054 lt!666916 (select (arr!49833 _keys!618) from!762)))))

(declare-datatypes ((Unit!51558 0))(
  ( (Unit!51559) )
))
(declare-fun lt!666915 () Unit!51558)

(declare-fun addApplyDifferent!596 (ListLongMap!22175 (_ BitVec 64) V!59151 (_ BitVec 64)) Unit!51558)

(assert (=> b!1547566 (= lt!666915 (addApplyDifferent!596 lt!666916 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49833 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59151)

(declare-fun contains!10061 (ListLongMap!22175 (_ BitVec 64)) Bool)

(assert (=> b!1547566 (contains!10061 (+!4934 lt!666916 (tuple2!24567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49833 _keys!618) from!762))))

(declare-fun lt!666917 () Unit!51558)

(declare-fun addStillContains!1249 (ListLongMap!22175 (_ BitVec 64) V!59151 (_ BitVec 64)) Unit!51558)

(assert (=> b!1547566 (= lt!666917 (addStillContains!1249 lt!666916 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49833 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6562 (array!103262 array!103264 (_ BitVec 32) (_ BitVec 32) V!59151 V!59151 (_ BitVec 32) Int) ListLongMap!22175)

(assert (=> b!1547566 (= lt!666916 (getCurrentListMapNoExtraKeys!6562 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547567 () Bool)

(declare-fun call!69892 () ListLongMap!22175)

(assert (=> b!1547567 (= e!861416 (+!4934 call!69892 (tuple2!24567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69888 () Bool)

(declare-fun call!69893 () ListLongMap!22175)

(assert (=> bm!69888 (= call!69893 call!69892)))

(declare-fun mapIsEmpty!58750 () Bool)

(assert (=> mapIsEmpty!58750 mapRes!58750))

(declare-fun b!1547568 () Bool)

(assert (=> b!1547568 (= e!861421 call!69893)))

(declare-fun b!1547569 () Bool)

(declare-fun res!1060740 () Bool)

(assert (=> b!1547569 (=> (not res!1060740) (not e!861420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103262 (_ BitVec 32)) Bool)

(assert (=> b!1547569 (= res!1060740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1060738 () Bool)

(assert (=> start!132042 (=> (not res!1060738) (not e!861420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132042 (= res!1060738 (validMask!0 mask!926))))

(assert (=> start!132042 e!861420))

(declare-fun array_inv!38753 (array!103262) Bool)

(assert (=> start!132042 (array_inv!38753 _keys!618)))

(assert (=> start!132042 tp_is_empty!38031))

(assert (=> start!132042 true))

(assert (=> start!132042 tp!111517))

(declare-fun array_inv!38754 (array!103264) Bool)

(assert (=> start!132042 (and (array_inv!38754 _values!470) e!861418)))

(declare-fun b!1547570 () Bool)

(declare-fun res!1060737 () Bool)

(assert (=> b!1547570 (=> (not res!1060737) (not e!861415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547570 (= res!1060737 (validKeyInArray!0 (select (arr!49833 _keys!618) from!762)))))

(declare-fun bm!69889 () Bool)

(assert (=> bm!69889 (= call!69894 call!69890)))

(declare-fun b!1547571 () Bool)

(declare-fun res!1060739 () Bool)

(assert (=> b!1547571 (=> (not res!1060739) (not e!861420))))

(assert (=> b!1547571 (= res!1060739 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50383 _keys!618))))))

(declare-fun b!1547572 () Bool)

(assert (=> b!1547572 (= e!861423 call!69893)))

(declare-fun b!1547573 () Bool)

(declare-fun c!142027 () Bool)

(assert (=> b!1547573 (= c!142027 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666914))))

(assert (=> b!1547573 (= e!861423 e!861421)))

(declare-fun mapNonEmpty!58750 () Bool)

(declare-fun tp!111516 () Bool)

(assert (=> mapNonEmpty!58750 (= mapRes!58750 (and tp!111516 e!861422))))

(declare-fun mapValue!58750 () ValueCell!18105)

(declare-fun mapKey!58750 () (_ BitVec 32))

(declare-fun mapRest!58750 () (Array (_ BitVec 32) ValueCell!18105))

(assert (=> mapNonEmpty!58750 (= (arr!49834 _values!470) (store mapRest!58750 mapKey!58750 mapValue!58750))))

(declare-fun b!1547574 () Bool)

(assert (=> b!1547574 (= e!861420 e!861415)))

(declare-fun res!1060736 () Bool)

(assert (=> b!1547574 (=> (not res!1060736) (not e!861415))))

(assert (=> b!1547574 (= res!1060736 (bvslt from!762 (size!50383 _keys!618)))))

(declare-fun lt!666913 () ListLongMap!22175)

(assert (=> b!1547574 (= lt!666913 e!861416)))

(declare-fun c!142028 () Bool)

(assert (=> b!1547574 (= c!142028 (and (not lt!666914) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547574 (= lt!666914 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69890 () Bool)

(assert (=> bm!69890 (= call!69891 (getCurrentListMapNoExtraKeys!6562 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547575 () Bool)

(assert (=> b!1547575 (= e!861417 tp_is_empty!38031)))

(declare-fun bm!69891 () Bool)

(assert (=> bm!69891 (= call!69892 (+!4934 (ite c!142028 call!69891 (ite c!142026 call!69890 call!69894)) (ite (or c!142028 c!142026) (tuple2!24567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547576 () Bool)

(declare-fun res!1060734 () Bool)

(assert (=> b!1547576 (=> (not res!1060734) (not e!861420))))

(assert (=> b!1547576 (= res!1060734 (and (= (size!50384 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50383 _keys!618) (size!50384 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132042 res!1060738) b!1547576))

(assert (= (and b!1547576 res!1060734) b!1547569))

(assert (= (and b!1547569 res!1060740) b!1547561))

(assert (= (and b!1547561 res!1060735) b!1547571))

(assert (= (and b!1547571 res!1060739) b!1547574))

(assert (= (and b!1547574 c!142028) b!1547567))

(assert (= (and b!1547574 (not c!142028)) b!1547565))

(assert (= (and b!1547565 c!142026) b!1547572))

(assert (= (and b!1547565 (not c!142026)) b!1547573))

(assert (= (and b!1547573 c!142027) b!1547568))

(assert (= (and b!1547573 (not c!142027)) b!1547563))

(assert (= (or b!1547568 b!1547563) bm!69889))

(assert (= (or b!1547572 bm!69889) bm!69887))

(assert (= (or b!1547572 b!1547568) bm!69888))

(assert (= (or b!1547567 bm!69887) bm!69890))

(assert (= (or b!1547567 bm!69888) bm!69891))

(assert (= (and b!1547574 res!1060736) b!1547570))

(assert (= (and b!1547570 res!1060737) b!1547566))

(assert (= (and b!1547562 condMapEmpty!58750) mapIsEmpty!58750))

(assert (= (and b!1547562 (not condMapEmpty!58750)) mapNonEmpty!58750))

(get-info :version)

(assert (= (and mapNonEmpty!58750 ((_ is ValueCellFull!18105) mapValue!58750)) b!1547564))

(assert (= (and b!1547562 ((_ is ValueCellFull!18105) mapDefault!58750)) b!1547575))

(assert (= start!132042 b!1547562))

(declare-fun m!1427149 () Bool)

(assert (=> start!132042 m!1427149))

(declare-fun m!1427151 () Bool)

(assert (=> start!132042 m!1427151))

(declare-fun m!1427153 () Bool)

(assert (=> start!132042 m!1427153))

(declare-fun m!1427155 () Bool)

(assert (=> bm!69891 m!1427155))

(declare-fun m!1427157 () Bool)

(assert (=> b!1547569 m!1427157))

(declare-fun m!1427159 () Bool)

(assert (=> bm!69890 m!1427159))

(declare-fun m!1427161 () Bool)

(assert (=> b!1547567 m!1427161))

(declare-fun m!1427163 () Bool)

(assert (=> b!1547561 m!1427163))

(declare-fun m!1427165 () Bool)

(assert (=> b!1547566 m!1427165))

(declare-fun m!1427167 () Bool)

(assert (=> b!1547566 m!1427167))

(declare-fun m!1427169 () Bool)

(assert (=> b!1547566 m!1427169))

(assert (=> b!1547566 m!1427159))

(assert (=> b!1547566 m!1427167))

(declare-fun m!1427171 () Bool)

(assert (=> b!1547566 m!1427171))

(assert (=> b!1547566 m!1427167))

(declare-fun m!1427173 () Bool)

(assert (=> b!1547566 m!1427173))

(assert (=> b!1547566 m!1427167))

(declare-fun m!1427175 () Bool)

(assert (=> b!1547566 m!1427175))

(assert (=> b!1547566 m!1427165))

(assert (=> b!1547566 m!1427167))

(declare-fun m!1427177 () Bool)

(assert (=> b!1547566 m!1427177))

(assert (=> b!1547566 m!1427167))

(declare-fun m!1427179 () Bool)

(assert (=> b!1547566 m!1427179))

(assert (=> b!1547566 m!1427171))

(declare-fun m!1427181 () Bool)

(assert (=> mapNonEmpty!58750 m!1427181))

(assert (=> b!1547570 m!1427167))

(assert (=> b!1547570 m!1427167))

(declare-fun m!1427183 () Bool)

(assert (=> b!1547570 m!1427183))

(check-sat (not bm!69890) (not start!132042) b_and!51165 (not b!1547569) (not bm!69891) (not b!1547566) (not b!1547561) (not b!1547567) (not b!1547570) (not b_next!31755) (not mapNonEmpty!58750) tp_is_empty!38031)
(check-sat b_and!51165 (not b_next!31755))
