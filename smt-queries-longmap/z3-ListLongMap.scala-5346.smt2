; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71604 () Bool)

(assert start!71604)

(declare-fun b_free!13483 () Bool)

(declare-fun b_next!13483 () Bool)

(assert (=> start!71604 (= b_free!13483 (not b_next!13483))))

(declare-fun tp!47230 () Bool)

(declare-fun b_and!22499 () Bool)

(assert (=> start!71604 (= tp!47230 b_and!22499)))

(declare-fun res!565509 () Bool)

(declare-fun e!463062 () Bool)

(assert (=> start!71604 (=> (not res!565509) (not e!463062))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71604 (= res!565509 (validMask!0 mask!1312))))

(assert (=> start!71604 e!463062))

(declare-fun tp_is_empty!15193 () Bool)

(assert (=> start!71604 tp_is_empty!15193))

(declare-datatypes ((array!46563 0))(
  ( (array!46564 (arr!22315 (Array (_ BitVec 32) (_ BitVec 64))) (size!22735 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46563)

(declare-fun array_inv!17817 (array!46563) Bool)

(assert (=> start!71604 (array_inv!17817 _keys!976)))

(assert (=> start!71604 true))

(declare-datatypes ((V!25259 0))(
  ( (V!25260 (val!7644 Int)) )
))
(declare-datatypes ((ValueCell!7181 0))(
  ( (ValueCellFull!7181 (v!10084 V!25259)) (EmptyCell!7181) )
))
(declare-datatypes ((array!46565 0))(
  ( (array!46566 (arr!22316 (Array (_ BitVec 32) ValueCell!7181)) (size!22736 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46565)

(declare-fun e!463064 () Bool)

(declare-fun array_inv!17818 (array!46565) Bool)

(assert (=> start!71604 (and (array_inv!17818 _values!788) e!463064)))

(assert (=> start!71604 tp!47230))

(declare-fun b!830544 () Bool)

(declare-fun res!565507 () Bool)

(assert (=> b!830544 (=> (not res!565507) (not e!463062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46563 (_ BitVec 32)) Bool)

(assert (=> b!830544 (= res!565507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24436 () Bool)

(declare-fun mapRes!24436 () Bool)

(declare-fun tp!47229 () Bool)

(declare-fun e!463065 () Bool)

(assert (=> mapNonEmpty!24436 (= mapRes!24436 (and tp!47229 e!463065))))

(declare-fun mapRest!24436 () (Array (_ BitVec 32) ValueCell!7181))

(declare-fun mapValue!24436 () ValueCell!7181)

(declare-fun mapKey!24436 () (_ BitVec 32))

(assert (=> mapNonEmpty!24436 (= (arr!22316 _values!788) (store mapRest!24436 mapKey!24436 mapValue!24436))))

(declare-fun mapIsEmpty!24436 () Bool)

(assert (=> mapIsEmpty!24436 mapRes!24436))

(declare-fun b!830545 () Bool)

(declare-fun res!565506 () Bool)

(assert (=> b!830545 (=> (not res!565506) (not e!463062))))

(declare-datatypes ((List!15839 0))(
  ( (Nil!15836) (Cons!15835 (h!16970 (_ BitVec 64)) (t!22192 List!15839)) )
))
(declare-fun arrayNoDuplicates!0 (array!46563 (_ BitVec 32) List!15839) Bool)

(assert (=> b!830545 (= res!565506 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15836))))

(declare-fun b!830546 () Bool)

(declare-fun res!565505 () Bool)

(assert (=> b!830546 (=> (not res!565505) (not e!463062))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!830546 (= res!565505 (and (= (size!22736 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22735 _keys!976) (size!22736 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!830547 () Bool)

(declare-fun e!463063 () Bool)

(assert (=> b!830547 (= e!463063 tp_is_empty!15193)))

(declare-fun b!830548 () Bool)

(assert (=> b!830548 (= e!463064 (and e!463063 mapRes!24436))))

(declare-fun condMapEmpty!24436 () Bool)

(declare-fun mapDefault!24436 () ValueCell!7181)

(assert (=> b!830548 (= condMapEmpty!24436 (= (arr!22316 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7181)) mapDefault!24436)))))

(declare-fun b!830549 () Bool)

(declare-fun e!463060 () Bool)

(assert (=> b!830549 (= e!463062 (not e!463060))))

(declare-fun res!565508 () Bool)

(assert (=> b!830549 (=> res!565508 e!463060)))

(assert (=> b!830549 (= res!565508 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10068 0))(
  ( (tuple2!10069 (_1!5045 (_ BitVec 64)) (_2!5045 V!25259)) )
))
(declare-datatypes ((List!15840 0))(
  ( (Nil!15837) (Cons!15836 (h!16971 tuple2!10068) (t!22193 List!15840)) )
))
(declare-datatypes ((ListLongMap!8893 0))(
  ( (ListLongMap!8894 (toList!4462 List!15840)) )
))
(declare-fun lt!376646 () ListLongMap!8893)

(declare-fun lt!376648 () ListLongMap!8893)

(assert (=> b!830549 (= lt!376646 lt!376648)))

(declare-fun zeroValueBefore!34 () V!25259)

(declare-fun zeroValueAfter!34 () V!25259)

(declare-fun minValue!754 () V!25259)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28436 0))(
  ( (Unit!28437) )
))
(declare-fun lt!376647 () Unit!28436)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!600 (array!46563 array!46565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25259 V!25259 V!25259 V!25259 (_ BitVec 32) Int) Unit!28436)

(assert (=> b!830549 (= lt!376647 (lemmaNoChangeToArrayThenSameMapNoExtras!600 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2533 (array!46563 array!46565 (_ BitVec 32) (_ BitVec 32) V!25259 V!25259 (_ BitVec 32) Int) ListLongMap!8893)

(assert (=> b!830549 (= lt!376648 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830549 (= lt!376646 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830550 () Bool)

(declare-fun getCurrentListMap!2555 (array!46563 array!46565 (_ BitVec 32) (_ BitVec 32) V!25259 V!25259 (_ BitVec 32) Int) ListLongMap!8893)

(declare-fun +!1984 (ListLongMap!8893 tuple2!10068) ListLongMap!8893)

(assert (=> b!830550 (= e!463060 (= (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1984 (+!1984 lt!376646 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376645 () ListLongMap!8893)

(assert (=> b!830550 (= lt!376645 (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830551 () Bool)

(assert (=> b!830551 (= e!463065 tp_is_empty!15193)))

(assert (= (and start!71604 res!565509) b!830546))

(assert (= (and b!830546 res!565505) b!830544))

(assert (= (and b!830544 res!565507) b!830545))

(assert (= (and b!830545 res!565506) b!830549))

(assert (= (and b!830549 (not res!565508)) b!830550))

(assert (= (and b!830548 condMapEmpty!24436) mapIsEmpty!24436))

(assert (= (and b!830548 (not condMapEmpty!24436)) mapNonEmpty!24436))

(get-info :version)

(assert (= (and mapNonEmpty!24436 ((_ is ValueCellFull!7181) mapValue!24436)) b!830551))

(assert (= (and b!830548 ((_ is ValueCellFull!7181) mapDefault!24436)) b!830547))

(assert (= start!71604 b!830548))

(declare-fun m!773953 () Bool)

(assert (=> b!830550 m!773953))

(declare-fun m!773955 () Bool)

(assert (=> b!830550 m!773955))

(assert (=> b!830550 m!773955))

(declare-fun m!773957 () Bool)

(assert (=> b!830550 m!773957))

(declare-fun m!773959 () Bool)

(assert (=> b!830550 m!773959))

(declare-fun m!773961 () Bool)

(assert (=> b!830549 m!773961))

(declare-fun m!773963 () Bool)

(assert (=> b!830549 m!773963))

(declare-fun m!773965 () Bool)

(assert (=> b!830549 m!773965))

(declare-fun m!773967 () Bool)

(assert (=> b!830545 m!773967))

(declare-fun m!773969 () Bool)

(assert (=> b!830544 m!773969))

(declare-fun m!773971 () Bool)

(assert (=> mapNonEmpty!24436 m!773971))

(declare-fun m!773973 () Bool)

(assert (=> start!71604 m!773973))

(declare-fun m!773975 () Bool)

(assert (=> start!71604 m!773975))

(declare-fun m!773977 () Bool)

(assert (=> start!71604 m!773977))

(check-sat tp_is_empty!15193 (not b!830550) (not b!830549) b_and!22499 (not b_next!13483) (not start!71604) (not b!830545) (not b!830544) (not mapNonEmpty!24436))
(check-sat b_and!22499 (not b_next!13483))
(get-model)

(declare-fun bm!36203 () Bool)

(declare-fun call!36206 () ListLongMap!8893)

(declare-fun call!36208 () ListLongMap!8893)

(assert (=> bm!36203 (= call!36206 call!36208)))

(declare-fun b!830643 () Bool)

(declare-fun e!463128 () Unit!28436)

(declare-fun Unit!28440 () Unit!28436)

(assert (=> b!830643 (= e!463128 Unit!28440)))

(declare-fun bm!36204 () Bool)

(declare-fun call!36207 () Bool)

(declare-fun lt!376717 () ListLongMap!8893)

(declare-fun contains!4180 (ListLongMap!8893 (_ BitVec 64)) Bool)

(assert (=> bm!36204 (= call!36207 (contains!4180 lt!376717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830644 () Bool)

(declare-fun e!463134 () ListLongMap!8893)

(declare-fun call!36211 () ListLongMap!8893)

(assert (=> b!830644 (= e!463134 call!36211)))

(declare-fun b!830645 () Bool)

(declare-fun e!463139 () Bool)

(declare-fun e!463133 () Bool)

(assert (=> b!830645 (= e!463139 e!463133)))

(declare-fun c!90068 () Bool)

(assert (=> b!830645 (= c!90068 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830646 () Bool)

(declare-fun e!463135 () Bool)

(assert (=> b!830646 (= e!463133 e!463135)))

(declare-fun res!565559 () Bool)

(declare-fun call!36209 () Bool)

(assert (=> b!830646 (= res!565559 call!36209)))

(assert (=> b!830646 (=> (not res!565559) (not e!463135))))

(declare-fun b!830647 () Bool)

(declare-fun call!36212 () ListLongMap!8893)

(assert (=> b!830647 (= e!463134 call!36212)))

(declare-fun b!830648 () Bool)

(declare-fun e!463136 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!830648 (= e!463136 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36205 () Bool)

(assert (=> bm!36205 (= call!36211 call!36206)))

(declare-fun bm!36206 () Bool)

(declare-fun call!36210 () ListLongMap!8893)

(assert (=> bm!36206 (= call!36212 call!36210)))

(declare-fun d!105601 () Bool)

(assert (=> d!105601 e!463139))

(declare-fun res!565560 () Bool)

(assert (=> d!105601 (=> (not res!565560) (not e!463139))))

(assert (=> d!105601 (= res!565560 (or (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))))

(declare-fun lt!376737 () ListLongMap!8893)

(assert (=> d!105601 (= lt!376717 lt!376737)))

(declare-fun lt!376726 () Unit!28436)

(assert (=> d!105601 (= lt!376726 e!463128)))

(declare-fun c!90064 () Bool)

(assert (=> d!105601 (= c!90064 e!463136)))

(declare-fun res!565563 () Bool)

(assert (=> d!105601 (=> (not res!565563) (not e!463136))))

(assert (=> d!105601 (= res!565563 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun e!463137 () ListLongMap!8893)

(assert (=> d!105601 (= lt!376737 e!463137)))

(declare-fun c!90065 () Bool)

(assert (=> d!105601 (= c!90065 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105601 (validMask!0 mask!1312)))

(assert (=> d!105601 (= (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376717)))

(declare-fun b!830642 () Bool)

(declare-fun e!463132 () Bool)

(assert (=> b!830642 (= e!463132 (not call!36207))))

(declare-fun b!830649 () Bool)

(declare-fun e!463140 () ListLongMap!8893)

(assert (=> b!830649 (= e!463140 call!36212)))

(declare-fun b!830650 () Bool)

(assert (=> b!830650 (= e!463137 e!463140)))

(declare-fun c!90067 () Bool)

(assert (=> b!830650 (= c!90067 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830651 () Bool)

(declare-fun res!565566 () Bool)

(assert (=> b!830651 (=> (not res!565566) (not e!463139))))

(assert (=> b!830651 (= res!565566 e!463132)))

(declare-fun c!90066 () Bool)

(assert (=> b!830651 (= c!90066 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830652 () Bool)

(assert (=> b!830652 (= e!463137 (+!1984 call!36210 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36207 () Bool)

(assert (=> bm!36207 (= call!36209 (contains!4180 lt!376717 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830653 () Bool)

(declare-fun c!90069 () Bool)

(assert (=> b!830653 (= c!90069 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830653 (= e!463140 e!463134)))

(declare-fun b!830654 () Bool)

(assert (=> b!830654 (= e!463133 (not call!36209))))

(declare-fun b!830655 () Bool)

(declare-fun apply!370 (ListLongMap!8893 (_ BitVec 64)) V!25259)

(assert (=> b!830655 (= e!463135 (= (apply!370 lt!376717 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830656 () Bool)

(declare-fun e!463131 () Bool)

(assert (=> b!830656 (= e!463132 e!463131)))

(declare-fun res!565558 () Bool)

(assert (=> b!830656 (= res!565558 call!36207)))

(assert (=> b!830656 (=> (not res!565558) (not e!463131))))

(declare-fun b!830657 () Bool)

(declare-fun e!463129 () Bool)

(declare-fun e!463130 () Bool)

(assert (=> b!830657 (= e!463129 e!463130)))

(declare-fun res!565564 () Bool)

(assert (=> b!830657 (=> (not res!565564) (not e!463130))))

(assert (=> b!830657 (= res!565564 (contains!4180 lt!376717 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830657 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830658 () Bool)

(declare-fun res!565561 () Bool)

(assert (=> b!830658 (=> (not res!565561) (not e!463139))))

(assert (=> b!830658 (= res!565561 e!463129)))

(declare-fun res!565565 () Bool)

(assert (=> b!830658 (=> res!565565 e!463129)))

(declare-fun e!463138 () Bool)

(assert (=> b!830658 (= res!565565 (not e!463138))))

(declare-fun res!565562 () Bool)

(assert (=> b!830658 (=> (not res!565562) (not e!463138))))

(assert (=> b!830658 (= res!565562 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun bm!36208 () Bool)

(assert (=> bm!36208 (= call!36208 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830659 () Bool)

(assert (=> b!830659 (= e!463131 (= (apply!370 lt!376717 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!36209 () Bool)

(assert (=> bm!36209 (= call!36210 (+!1984 (ite c!90065 call!36208 (ite c!90067 call!36206 call!36211)) (ite (or c!90065 c!90067) (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830660 () Bool)

(declare-fun get!11814 (ValueCell!7181 V!25259) V!25259)

(declare-fun dynLambda!978 (Int (_ BitVec 64)) V!25259)

(assert (=> b!830660 (= e!463130 (= (apply!370 lt!376717 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)) (get!11814 (select (arr!22316 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830660 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22736 _values!788)))))

(assert (=> b!830660 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830661 () Bool)

(assert (=> b!830661 (= e!463138 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830662 () Bool)

(declare-fun lt!376731 () Unit!28436)

(assert (=> b!830662 (= e!463128 lt!376731)))

(declare-fun lt!376738 () ListLongMap!8893)

(assert (=> b!830662 (= lt!376738 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376722 () (_ BitVec 64))

(assert (=> b!830662 (= lt!376722 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376730 () (_ BitVec 64))

(assert (=> b!830662 (= lt!376730 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376725 () Unit!28436)

(declare-fun addStillContains!321 (ListLongMap!8893 (_ BitVec 64) V!25259 (_ BitVec 64)) Unit!28436)

(assert (=> b!830662 (= lt!376725 (addStillContains!321 lt!376738 lt!376722 zeroValueBefore!34 lt!376730))))

(assert (=> b!830662 (contains!4180 (+!1984 lt!376738 (tuple2!10069 lt!376722 zeroValueBefore!34)) lt!376730)))

(declare-fun lt!376729 () Unit!28436)

(assert (=> b!830662 (= lt!376729 lt!376725)))

(declare-fun lt!376734 () ListLongMap!8893)

(assert (=> b!830662 (= lt!376734 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376736 () (_ BitVec 64))

(assert (=> b!830662 (= lt!376736 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376735 () (_ BitVec 64))

(assert (=> b!830662 (= lt!376735 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376733 () Unit!28436)

(declare-fun addApplyDifferent!321 (ListLongMap!8893 (_ BitVec 64) V!25259 (_ BitVec 64)) Unit!28436)

(assert (=> b!830662 (= lt!376733 (addApplyDifferent!321 lt!376734 lt!376736 minValue!754 lt!376735))))

(assert (=> b!830662 (= (apply!370 (+!1984 lt!376734 (tuple2!10069 lt!376736 minValue!754)) lt!376735) (apply!370 lt!376734 lt!376735))))

(declare-fun lt!376721 () Unit!28436)

(assert (=> b!830662 (= lt!376721 lt!376733)))

(declare-fun lt!376732 () ListLongMap!8893)

(assert (=> b!830662 (= lt!376732 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376718 () (_ BitVec 64))

(assert (=> b!830662 (= lt!376718 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376720 () (_ BitVec 64))

(assert (=> b!830662 (= lt!376720 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376719 () Unit!28436)

(assert (=> b!830662 (= lt!376719 (addApplyDifferent!321 lt!376732 lt!376718 zeroValueBefore!34 lt!376720))))

(assert (=> b!830662 (= (apply!370 (+!1984 lt!376732 (tuple2!10069 lt!376718 zeroValueBefore!34)) lt!376720) (apply!370 lt!376732 lt!376720))))

(declare-fun lt!376724 () Unit!28436)

(assert (=> b!830662 (= lt!376724 lt!376719)))

(declare-fun lt!376728 () ListLongMap!8893)

(assert (=> b!830662 (= lt!376728 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376727 () (_ BitVec 64))

(assert (=> b!830662 (= lt!376727 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376723 () (_ BitVec 64))

(assert (=> b!830662 (= lt!376723 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830662 (= lt!376731 (addApplyDifferent!321 lt!376728 lt!376727 minValue!754 lt!376723))))

(assert (=> b!830662 (= (apply!370 (+!1984 lt!376728 (tuple2!10069 lt!376727 minValue!754)) lt!376723) (apply!370 lt!376728 lt!376723))))

(assert (= (and d!105601 c!90065) b!830652))

(assert (= (and d!105601 (not c!90065)) b!830650))

(assert (= (and b!830650 c!90067) b!830649))

(assert (= (and b!830650 (not c!90067)) b!830653))

(assert (= (and b!830653 c!90069) b!830647))

(assert (= (and b!830653 (not c!90069)) b!830644))

(assert (= (or b!830647 b!830644) bm!36205))

(assert (= (or b!830649 bm!36205) bm!36203))

(assert (= (or b!830649 b!830647) bm!36206))

(assert (= (or b!830652 bm!36203) bm!36208))

(assert (= (or b!830652 bm!36206) bm!36209))

(assert (= (and d!105601 res!565563) b!830648))

(assert (= (and d!105601 c!90064) b!830662))

(assert (= (and d!105601 (not c!90064)) b!830643))

(assert (= (and d!105601 res!565560) b!830658))

(assert (= (and b!830658 res!565562) b!830661))

(assert (= (and b!830658 (not res!565565)) b!830657))

(assert (= (and b!830657 res!565564) b!830660))

(assert (= (and b!830658 res!565561) b!830651))

(assert (= (and b!830651 c!90066) b!830656))

(assert (= (and b!830651 (not c!90066)) b!830642))

(assert (= (and b!830656 res!565558) b!830659))

(assert (= (or b!830656 b!830642) bm!36204))

(assert (= (and b!830651 res!565566) b!830645))

(assert (= (and b!830645 c!90068) b!830646))

(assert (= (and b!830645 (not c!90068)) b!830654))

(assert (= (and b!830646 res!565559) b!830655))

(assert (= (or b!830646 b!830654) bm!36207))

(declare-fun b_lambda!11313 () Bool)

(assert (=> (not b_lambda!11313) (not b!830660)))

(declare-fun t!22197 () Bool)

(declare-fun tb!4213 () Bool)

(assert (=> (and start!71604 (= defaultEntry!796 defaultEntry!796) t!22197) tb!4213))

(declare-fun result!7995 () Bool)

(assert (=> tb!4213 (= result!7995 tp_is_empty!15193)))

(assert (=> b!830660 t!22197))

(declare-fun b_and!22505 () Bool)

(assert (= b_and!22499 (and (=> t!22197 result!7995) b_and!22505)))

(declare-fun m!774031 () Bool)

(assert (=> bm!36207 m!774031))

(declare-fun m!774033 () Bool)

(assert (=> b!830662 m!774033))

(assert (=> b!830662 m!773965))

(declare-fun m!774035 () Bool)

(assert (=> b!830662 m!774035))

(declare-fun m!774037 () Bool)

(assert (=> b!830662 m!774037))

(declare-fun m!774039 () Bool)

(assert (=> b!830662 m!774039))

(declare-fun m!774041 () Bool)

(assert (=> b!830662 m!774041))

(declare-fun m!774043 () Bool)

(assert (=> b!830662 m!774043))

(declare-fun m!774045 () Bool)

(assert (=> b!830662 m!774045))

(declare-fun m!774047 () Bool)

(assert (=> b!830662 m!774047))

(declare-fun m!774049 () Bool)

(assert (=> b!830662 m!774049))

(assert (=> b!830662 m!774039))

(declare-fun m!774051 () Bool)

(assert (=> b!830662 m!774051))

(declare-fun m!774053 () Bool)

(assert (=> b!830662 m!774053))

(declare-fun m!774055 () Bool)

(assert (=> b!830662 m!774055))

(declare-fun m!774057 () Bool)

(assert (=> b!830662 m!774057))

(assert (=> b!830662 m!774043))

(declare-fun m!774059 () Bool)

(assert (=> b!830662 m!774059))

(assert (=> b!830662 m!774047))

(declare-fun m!774061 () Bool)

(assert (=> b!830662 m!774061))

(assert (=> b!830662 m!774051))

(declare-fun m!774063 () Bool)

(assert (=> b!830662 m!774063))

(assert (=> d!105601 m!773973))

(declare-fun m!774065 () Bool)

(assert (=> bm!36204 m!774065))

(assert (=> b!830648 m!774037))

(assert (=> b!830648 m!774037))

(declare-fun m!774067 () Bool)

(assert (=> b!830648 m!774067))

(declare-fun m!774069 () Bool)

(assert (=> bm!36209 m!774069))

(declare-fun m!774071 () Bool)

(assert (=> b!830652 m!774071))

(assert (=> b!830657 m!774037))

(assert (=> b!830657 m!774037))

(declare-fun m!774073 () Bool)

(assert (=> b!830657 m!774073))

(assert (=> b!830661 m!774037))

(assert (=> b!830661 m!774037))

(assert (=> b!830661 m!774067))

(declare-fun m!774075 () Bool)

(assert (=> b!830655 m!774075))

(declare-fun m!774077 () Bool)

(assert (=> b!830660 m!774077))

(declare-fun m!774079 () Bool)

(assert (=> b!830660 m!774079))

(assert (=> b!830660 m!774077))

(assert (=> b!830660 m!774079))

(declare-fun m!774081 () Bool)

(assert (=> b!830660 m!774081))

(assert (=> b!830660 m!774037))

(assert (=> b!830660 m!774037))

(declare-fun m!774083 () Bool)

(assert (=> b!830660 m!774083))

(declare-fun m!774085 () Bool)

(assert (=> b!830659 m!774085))

(assert (=> bm!36208 m!773965))

(assert (=> b!830550 d!105601))

(declare-fun d!105603 () Bool)

(declare-fun e!463143 () Bool)

(assert (=> d!105603 e!463143))

(declare-fun res!565571 () Bool)

(assert (=> d!105603 (=> (not res!565571) (not e!463143))))

(declare-fun lt!376750 () ListLongMap!8893)

(assert (=> d!105603 (= res!565571 (contains!4180 lt!376750 (_1!5045 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376747 () List!15840)

(assert (=> d!105603 (= lt!376750 (ListLongMap!8894 lt!376747))))

(declare-fun lt!376748 () Unit!28436)

(declare-fun lt!376749 () Unit!28436)

(assert (=> d!105603 (= lt!376748 lt!376749)))

(declare-datatypes ((Option!420 0))(
  ( (Some!419 (v!10087 V!25259)) (None!418) )
))
(declare-fun getValueByKey!414 (List!15840 (_ BitVec 64)) Option!420)

(assert (=> d!105603 (= (getValueByKey!414 lt!376747 (_1!5045 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5045 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!228 (List!15840 (_ BitVec 64) V!25259) Unit!28436)

(assert (=> d!105603 (= lt!376749 (lemmaContainsTupThenGetReturnValue!228 lt!376747 (_1!5045 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5045 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!267 (List!15840 (_ BitVec 64) V!25259) List!15840)

(assert (=> d!105603 (= lt!376747 (insertStrictlySorted!267 (toList!4462 (+!1984 lt!376646 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (_1!5045 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5045 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105603 (= (+!1984 (+!1984 lt!376646 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376750)))

(declare-fun b!830669 () Bool)

(declare-fun res!565572 () Bool)

(assert (=> b!830669 (=> (not res!565572) (not e!463143))))

(assert (=> b!830669 (= res!565572 (= (getValueByKey!414 (toList!4462 lt!376750) (_1!5045 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5045 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830670 () Bool)

(declare-fun contains!4181 (List!15840 tuple2!10068) Bool)

(assert (=> b!830670 (= e!463143 (contains!4181 (toList!4462 lt!376750) (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105603 res!565571) b!830669))

(assert (= (and b!830669 res!565572) b!830670))

(declare-fun m!774087 () Bool)

(assert (=> d!105603 m!774087))

(declare-fun m!774089 () Bool)

(assert (=> d!105603 m!774089))

(declare-fun m!774091 () Bool)

(assert (=> d!105603 m!774091))

(declare-fun m!774093 () Bool)

(assert (=> d!105603 m!774093))

(declare-fun m!774095 () Bool)

(assert (=> b!830669 m!774095))

(declare-fun m!774097 () Bool)

(assert (=> b!830670 m!774097))

(assert (=> b!830550 d!105603))

(declare-fun d!105605 () Bool)

(declare-fun e!463144 () Bool)

(assert (=> d!105605 e!463144))

(declare-fun res!565573 () Bool)

(assert (=> d!105605 (=> (not res!565573) (not e!463144))))

(declare-fun lt!376754 () ListLongMap!8893)

(assert (=> d!105605 (= res!565573 (contains!4180 lt!376754 (_1!5045 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!376751 () List!15840)

(assert (=> d!105605 (= lt!376754 (ListLongMap!8894 lt!376751))))

(declare-fun lt!376752 () Unit!28436)

(declare-fun lt!376753 () Unit!28436)

(assert (=> d!105605 (= lt!376752 lt!376753)))

(assert (=> d!105605 (= (getValueByKey!414 lt!376751 (_1!5045 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!419 (_2!5045 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105605 (= lt!376753 (lemmaContainsTupThenGetReturnValue!228 lt!376751 (_1!5045 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5045 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105605 (= lt!376751 (insertStrictlySorted!267 (toList!4462 lt!376646) (_1!5045 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5045 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105605 (= (+!1984 lt!376646 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!376754)))

(declare-fun b!830671 () Bool)

(declare-fun res!565574 () Bool)

(assert (=> b!830671 (=> (not res!565574) (not e!463144))))

(assert (=> b!830671 (= res!565574 (= (getValueByKey!414 (toList!4462 lt!376754) (_1!5045 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!419 (_2!5045 (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!830672 () Bool)

(assert (=> b!830672 (= e!463144 (contains!4181 (toList!4462 lt!376754) (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105605 res!565573) b!830671))

(assert (= (and b!830671 res!565574) b!830672))

(declare-fun m!774099 () Bool)

(assert (=> d!105605 m!774099))

(declare-fun m!774101 () Bool)

(assert (=> d!105605 m!774101))

(declare-fun m!774103 () Bool)

(assert (=> d!105605 m!774103))

(declare-fun m!774105 () Bool)

(assert (=> d!105605 m!774105))

(declare-fun m!774107 () Bool)

(assert (=> b!830671 m!774107))

(declare-fun m!774109 () Bool)

(assert (=> b!830672 m!774109))

(assert (=> b!830550 d!105605))

(declare-fun bm!36210 () Bool)

(declare-fun call!36213 () ListLongMap!8893)

(declare-fun call!36215 () ListLongMap!8893)

(assert (=> bm!36210 (= call!36213 call!36215)))

(declare-fun b!830674 () Bool)

(declare-fun e!463145 () Unit!28436)

(declare-fun Unit!28441 () Unit!28436)

(assert (=> b!830674 (= e!463145 Unit!28441)))

(declare-fun bm!36211 () Bool)

(declare-fun call!36214 () Bool)

(declare-fun lt!376755 () ListLongMap!8893)

(assert (=> bm!36211 (= call!36214 (contains!4180 lt!376755 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830675 () Bool)

(declare-fun e!463151 () ListLongMap!8893)

(declare-fun call!36218 () ListLongMap!8893)

(assert (=> b!830675 (= e!463151 call!36218)))

(declare-fun b!830676 () Bool)

(declare-fun e!463156 () Bool)

(declare-fun e!463150 () Bool)

(assert (=> b!830676 (= e!463156 e!463150)))

(declare-fun c!90074 () Bool)

(assert (=> b!830676 (= c!90074 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830677 () Bool)

(declare-fun e!463152 () Bool)

(assert (=> b!830677 (= e!463150 e!463152)))

(declare-fun res!565576 () Bool)

(declare-fun call!36216 () Bool)

(assert (=> b!830677 (= res!565576 call!36216)))

(assert (=> b!830677 (=> (not res!565576) (not e!463152))))

(declare-fun b!830678 () Bool)

(declare-fun call!36219 () ListLongMap!8893)

(assert (=> b!830678 (= e!463151 call!36219)))

(declare-fun b!830679 () Bool)

(declare-fun e!463153 () Bool)

(assert (=> b!830679 (= e!463153 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36212 () Bool)

(assert (=> bm!36212 (= call!36218 call!36213)))

(declare-fun bm!36213 () Bool)

(declare-fun call!36217 () ListLongMap!8893)

(assert (=> bm!36213 (= call!36219 call!36217)))

(declare-fun d!105607 () Bool)

(assert (=> d!105607 e!463156))

(declare-fun res!565577 () Bool)

(assert (=> d!105607 (=> (not res!565577) (not e!463156))))

(assert (=> d!105607 (= res!565577 (or (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))))

(declare-fun lt!376775 () ListLongMap!8893)

(assert (=> d!105607 (= lt!376755 lt!376775)))

(declare-fun lt!376764 () Unit!28436)

(assert (=> d!105607 (= lt!376764 e!463145)))

(declare-fun c!90070 () Bool)

(assert (=> d!105607 (= c!90070 e!463153)))

(declare-fun res!565580 () Bool)

(assert (=> d!105607 (=> (not res!565580) (not e!463153))))

(assert (=> d!105607 (= res!565580 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun e!463154 () ListLongMap!8893)

(assert (=> d!105607 (= lt!376775 e!463154)))

(declare-fun c!90071 () Bool)

(assert (=> d!105607 (= c!90071 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105607 (validMask!0 mask!1312)))

(assert (=> d!105607 (= (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376755)))

(declare-fun b!830673 () Bool)

(declare-fun e!463149 () Bool)

(assert (=> b!830673 (= e!463149 (not call!36214))))

(declare-fun b!830680 () Bool)

(declare-fun e!463157 () ListLongMap!8893)

(assert (=> b!830680 (= e!463157 call!36219)))

(declare-fun b!830681 () Bool)

(assert (=> b!830681 (= e!463154 e!463157)))

(declare-fun c!90073 () Bool)

(assert (=> b!830681 (= c!90073 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830682 () Bool)

(declare-fun res!565583 () Bool)

(assert (=> b!830682 (=> (not res!565583) (not e!463156))))

(assert (=> b!830682 (= res!565583 e!463149)))

(declare-fun c!90072 () Bool)

(assert (=> b!830682 (= c!90072 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830683 () Bool)

(assert (=> b!830683 (= e!463154 (+!1984 call!36217 (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36214 () Bool)

(assert (=> bm!36214 (= call!36216 (contains!4180 lt!376755 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830684 () Bool)

(declare-fun c!90075 () Bool)

(assert (=> b!830684 (= c!90075 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830684 (= e!463157 e!463151)))

(declare-fun b!830685 () Bool)

(assert (=> b!830685 (= e!463150 (not call!36216))))

(declare-fun b!830686 () Bool)

(assert (=> b!830686 (= e!463152 (= (apply!370 lt!376755 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830687 () Bool)

(declare-fun e!463148 () Bool)

(assert (=> b!830687 (= e!463149 e!463148)))

(declare-fun res!565575 () Bool)

(assert (=> b!830687 (= res!565575 call!36214)))

(assert (=> b!830687 (=> (not res!565575) (not e!463148))))

(declare-fun b!830688 () Bool)

(declare-fun e!463146 () Bool)

(declare-fun e!463147 () Bool)

(assert (=> b!830688 (= e!463146 e!463147)))

(declare-fun res!565581 () Bool)

(assert (=> b!830688 (=> (not res!565581) (not e!463147))))

(assert (=> b!830688 (= res!565581 (contains!4180 lt!376755 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830688 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830689 () Bool)

(declare-fun res!565578 () Bool)

(assert (=> b!830689 (=> (not res!565578) (not e!463156))))

(assert (=> b!830689 (= res!565578 e!463146)))

(declare-fun res!565582 () Bool)

(assert (=> b!830689 (=> res!565582 e!463146)))

(declare-fun e!463155 () Bool)

(assert (=> b!830689 (= res!565582 (not e!463155))))

(declare-fun res!565579 () Bool)

(assert (=> b!830689 (=> (not res!565579) (not e!463155))))

(assert (=> b!830689 (= res!565579 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun bm!36215 () Bool)

(assert (=> bm!36215 (= call!36215 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830690 () Bool)

(assert (=> b!830690 (= e!463148 (= (apply!370 lt!376755 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun bm!36216 () Bool)

(assert (=> bm!36216 (= call!36217 (+!1984 (ite c!90071 call!36215 (ite c!90073 call!36213 call!36218)) (ite (or c!90071 c!90073) (tuple2!10069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830691 () Bool)

(assert (=> b!830691 (= e!463147 (= (apply!370 lt!376755 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)) (get!11814 (select (arr!22316 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22736 _values!788)))))

(assert (=> b!830691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830692 () Bool)

(assert (=> b!830692 (= e!463155 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830693 () Bool)

(declare-fun lt!376769 () Unit!28436)

(assert (=> b!830693 (= e!463145 lt!376769)))

(declare-fun lt!376776 () ListLongMap!8893)

(assert (=> b!830693 (= lt!376776 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376760 () (_ BitVec 64))

(assert (=> b!830693 (= lt!376760 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376768 () (_ BitVec 64))

(assert (=> b!830693 (= lt!376768 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376763 () Unit!28436)

(assert (=> b!830693 (= lt!376763 (addStillContains!321 lt!376776 lt!376760 zeroValueAfter!34 lt!376768))))

(assert (=> b!830693 (contains!4180 (+!1984 lt!376776 (tuple2!10069 lt!376760 zeroValueAfter!34)) lt!376768)))

(declare-fun lt!376767 () Unit!28436)

(assert (=> b!830693 (= lt!376767 lt!376763)))

(declare-fun lt!376772 () ListLongMap!8893)

(assert (=> b!830693 (= lt!376772 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376774 () (_ BitVec 64))

(assert (=> b!830693 (= lt!376774 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376773 () (_ BitVec 64))

(assert (=> b!830693 (= lt!376773 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376771 () Unit!28436)

(assert (=> b!830693 (= lt!376771 (addApplyDifferent!321 lt!376772 lt!376774 minValue!754 lt!376773))))

(assert (=> b!830693 (= (apply!370 (+!1984 lt!376772 (tuple2!10069 lt!376774 minValue!754)) lt!376773) (apply!370 lt!376772 lt!376773))))

(declare-fun lt!376759 () Unit!28436)

(assert (=> b!830693 (= lt!376759 lt!376771)))

(declare-fun lt!376770 () ListLongMap!8893)

(assert (=> b!830693 (= lt!376770 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376756 () (_ BitVec 64))

(assert (=> b!830693 (= lt!376756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376758 () (_ BitVec 64))

(assert (=> b!830693 (= lt!376758 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376757 () Unit!28436)

(assert (=> b!830693 (= lt!376757 (addApplyDifferent!321 lt!376770 lt!376756 zeroValueAfter!34 lt!376758))))

(assert (=> b!830693 (= (apply!370 (+!1984 lt!376770 (tuple2!10069 lt!376756 zeroValueAfter!34)) lt!376758) (apply!370 lt!376770 lt!376758))))

(declare-fun lt!376762 () Unit!28436)

(assert (=> b!830693 (= lt!376762 lt!376757)))

(declare-fun lt!376766 () ListLongMap!8893)

(assert (=> b!830693 (= lt!376766 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376765 () (_ BitVec 64))

(assert (=> b!830693 (= lt!376765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376761 () (_ BitVec 64))

(assert (=> b!830693 (= lt!376761 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830693 (= lt!376769 (addApplyDifferent!321 lt!376766 lt!376765 minValue!754 lt!376761))))

(assert (=> b!830693 (= (apply!370 (+!1984 lt!376766 (tuple2!10069 lt!376765 minValue!754)) lt!376761) (apply!370 lt!376766 lt!376761))))

(assert (= (and d!105607 c!90071) b!830683))

(assert (= (and d!105607 (not c!90071)) b!830681))

(assert (= (and b!830681 c!90073) b!830680))

(assert (= (and b!830681 (not c!90073)) b!830684))

(assert (= (and b!830684 c!90075) b!830678))

(assert (= (and b!830684 (not c!90075)) b!830675))

(assert (= (or b!830678 b!830675) bm!36212))

(assert (= (or b!830680 bm!36212) bm!36210))

(assert (= (or b!830680 b!830678) bm!36213))

(assert (= (or b!830683 bm!36210) bm!36215))

(assert (= (or b!830683 bm!36213) bm!36216))

(assert (= (and d!105607 res!565580) b!830679))

(assert (= (and d!105607 c!90070) b!830693))

(assert (= (and d!105607 (not c!90070)) b!830674))

(assert (= (and d!105607 res!565577) b!830689))

(assert (= (and b!830689 res!565579) b!830692))

(assert (= (and b!830689 (not res!565582)) b!830688))

(assert (= (and b!830688 res!565581) b!830691))

(assert (= (and b!830689 res!565578) b!830682))

(assert (= (and b!830682 c!90072) b!830687))

(assert (= (and b!830682 (not c!90072)) b!830673))

(assert (= (and b!830687 res!565575) b!830690))

(assert (= (or b!830687 b!830673) bm!36211))

(assert (= (and b!830682 res!565583) b!830676))

(assert (= (and b!830676 c!90074) b!830677))

(assert (= (and b!830676 (not c!90074)) b!830685))

(assert (= (and b!830677 res!565576) b!830686))

(assert (= (or b!830677 b!830685) bm!36214))

(declare-fun b_lambda!11315 () Bool)

(assert (=> (not b_lambda!11315) (not b!830691)))

(assert (=> b!830691 t!22197))

(declare-fun b_and!22507 () Bool)

(assert (= b_and!22505 (and (=> t!22197 result!7995) b_and!22507)))

(declare-fun m!774111 () Bool)

(assert (=> bm!36214 m!774111))

(declare-fun m!774113 () Bool)

(assert (=> b!830693 m!774113))

(assert (=> b!830693 m!773963))

(declare-fun m!774115 () Bool)

(assert (=> b!830693 m!774115))

(assert (=> b!830693 m!774037))

(declare-fun m!774117 () Bool)

(assert (=> b!830693 m!774117))

(declare-fun m!774119 () Bool)

(assert (=> b!830693 m!774119))

(declare-fun m!774121 () Bool)

(assert (=> b!830693 m!774121))

(declare-fun m!774123 () Bool)

(assert (=> b!830693 m!774123))

(declare-fun m!774125 () Bool)

(assert (=> b!830693 m!774125))

(declare-fun m!774127 () Bool)

(assert (=> b!830693 m!774127))

(assert (=> b!830693 m!774117))

(declare-fun m!774129 () Bool)

(assert (=> b!830693 m!774129))

(declare-fun m!774131 () Bool)

(assert (=> b!830693 m!774131))

(declare-fun m!774133 () Bool)

(assert (=> b!830693 m!774133))

(declare-fun m!774135 () Bool)

(assert (=> b!830693 m!774135))

(assert (=> b!830693 m!774121))

(declare-fun m!774137 () Bool)

(assert (=> b!830693 m!774137))

(assert (=> b!830693 m!774125))

(declare-fun m!774139 () Bool)

(assert (=> b!830693 m!774139))

(assert (=> b!830693 m!774129))

(declare-fun m!774141 () Bool)

(assert (=> b!830693 m!774141))

(assert (=> d!105607 m!773973))

(declare-fun m!774143 () Bool)

(assert (=> bm!36211 m!774143))

(assert (=> b!830679 m!774037))

(assert (=> b!830679 m!774037))

(assert (=> b!830679 m!774067))

(declare-fun m!774145 () Bool)

(assert (=> bm!36216 m!774145))

(declare-fun m!774147 () Bool)

(assert (=> b!830683 m!774147))

(assert (=> b!830688 m!774037))

(assert (=> b!830688 m!774037))

(declare-fun m!774149 () Bool)

(assert (=> b!830688 m!774149))

(assert (=> b!830692 m!774037))

(assert (=> b!830692 m!774037))

(assert (=> b!830692 m!774067))

(declare-fun m!774151 () Bool)

(assert (=> b!830686 m!774151))

(assert (=> b!830691 m!774077))

(assert (=> b!830691 m!774079))

(assert (=> b!830691 m!774077))

(assert (=> b!830691 m!774079))

(assert (=> b!830691 m!774081))

(assert (=> b!830691 m!774037))

(assert (=> b!830691 m!774037))

(declare-fun m!774153 () Bool)

(assert (=> b!830691 m!774153))

(declare-fun m!774155 () Bool)

(assert (=> b!830690 m!774155))

(assert (=> bm!36215 m!773963))

(assert (=> b!830550 d!105607))

(declare-fun d!105609 () Bool)

(assert (=> d!105609 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376779 () Unit!28436)

(declare-fun choose!1420 (array!46563 array!46565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25259 V!25259 V!25259 V!25259 (_ BitVec 32) Int) Unit!28436)

(assert (=> d!105609 (= lt!376779 (choose!1420 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105609 (validMask!0 mask!1312)))

(assert (=> d!105609 (= (lemmaNoChangeToArrayThenSameMapNoExtras!600 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376779)))

(declare-fun bs!23190 () Bool)

(assert (= bs!23190 d!105609))

(assert (=> bs!23190 m!773965))

(assert (=> bs!23190 m!773963))

(declare-fun m!774157 () Bool)

(assert (=> bs!23190 m!774157))

(assert (=> bs!23190 m!773973))

(assert (=> b!830549 d!105609))

(declare-fun b!830718 () Bool)

(declare-fun lt!376798 () Unit!28436)

(declare-fun lt!376795 () Unit!28436)

(assert (=> b!830718 (= lt!376798 lt!376795)))

(declare-fun lt!376800 () V!25259)

(declare-fun lt!376794 () (_ BitVec 64))

(declare-fun lt!376797 () (_ BitVec 64))

(declare-fun lt!376796 () ListLongMap!8893)

(assert (=> b!830718 (not (contains!4180 (+!1984 lt!376796 (tuple2!10069 lt!376794 lt!376800)) lt!376797))))

(declare-fun addStillNotContains!197 (ListLongMap!8893 (_ BitVec 64) V!25259 (_ BitVec 64)) Unit!28436)

(assert (=> b!830718 (= lt!376795 (addStillNotContains!197 lt!376796 lt!376794 lt!376800 lt!376797))))

(assert (=> b!830718 (= lt!376797 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830718 (= lt!376800 (get!11814 (select (arr!22316 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830718 (= lt!376794 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36222 () ListLongMap!8893)

(assert (=> b!830718 (= lt!376796 call!36222)))

(declare-fun e!463178 () ListLongMap!8893)

(assert (=> b!830718 (= e!463178 (+!1984 call!36222 (tuple2!10069 (select (arr!22315 _keys!976) #b00000000000000000000000000000000) (get!11814 (select (arr!22316 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830719 () Bool)

(declare-fun e!463176 () Bool)

(declare-fun lt!376799 () ListLongMap!8893)

(declare-fun isEmpty!658 (ListLongMap!8893) Bool)

(assert (=> b!830719 (= e!463176 (isEmpty!658 lt!376799))))

(declare-fun b!830720 () Bool)

(declare-fun e!463172 () Bool)

(declare-fun e!463173 () Bool)

(assert (=> b!830720 (= e!463172 e!463173)))

(declare-fun c!90085 () Bool)

(declare-fun e!463175 () Bool)

(assert (=> b!830720 (= c!90085 e!463175)))

(declare-fun res!565594 () Bool)

(assert (=> b!830720 (=> (not res!565594) (not e!463175))))

(assert (=> b!830720 (= res!565594 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830721 () Bool)

(declare-fun e!463174 () Bool)

(assert (=> b!830721 (= e!463173 e!463174)))

(assert (=> b!830721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun res!565593 () Bool)

(assert (=> b!830721 (= res!565593 (contains!4180 lt!376799 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830721 (=> (not res!565593) (not e!463174))))

(declare-fun b!830722 () Bool)

(assert (=> b!830722 (= e!463175 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830722 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830723 () Bool)

(assert (=> b!830723 (= e!463176 (= lt!376799 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830724 () Bool)

(assert (=> b!830724 (= e!463178 call!36222)))

(declare-fun d!105611 () Bool)

(assert (=> d!105611 e!463172))

(declare-fun res!565592 () Bool)

(assert (=> d!105611 (=> (not res!565592) (not e!463172))))

(assert (=> d!105611 (= res!565592 (not (contains!4180 lt!376799 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463177 () ListLongMap!8893)

(assert (=> d!105611 (= lt!376799 e!463177)))

(declare-fun c!90084 () Bool)

(assert (=> d!105611 (= c!90084 (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105611 (validMask!0 mask!1312)))

(assert (=> d!105611 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376799)))

(declare-fun b!830725 () Bool)

(assert (=> b!830725 (= e!463173 e!463176)))

(declare-fun c!90086 () Bool)

(assert (=> b!830725 (= c!90086 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830726 () Bool)

(assert (=> b!830726 (= e!463177 e!463178)))

(declare-fun c!90087 () Bool)

(assert (=> b!830726 (= c!90087 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36219 () Bool)

(assert (=> bm!36219 (= call!36222 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830727 () Bool)

(assert (=> b!830727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> b!830727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22736 _values!788)))))

(assert (=> b!830727 (= e!463174 (= (apply!370 lt!376799 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)) (get!11814 (select (arr!22316 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830728 () Bool)

(declare-fun res!565595 () Bool)

(assert (=> b!830728 (=> (not res!565595) (not e!463172))))

(assert (=> b!830728 (= res!565595 (not (contains!4180 lt!376799 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830729 () Bool)

(assert (=> b!830729 (= e!463177 (ListLongMap!8894 Nil!15837))))

(assert (= (and d!105611 c!90084) b!830729))

(assert (= (and d!105611 (not c!90084)) b!830726))

(assert (= (and b!830726 c!90087) b!830718))

(assert (= (and b!830726 (not c!90087)) b!830724))

(assert (= (or b!830718 b!830724) bm!36219))

(assert (= (and d!105611 res!565592) b!830728))

(assert (= (and b!830728 res!565595) b!830720))

(assert (= (and b!830720 res!565594) b!830722))

(assert (= (and b!830720 c!90085) b!830721))

(assert (= (and b!830720 (not c!90085)) b!830725))

(assert (= (and b!830721 res!565593) b!830727))

(assert (= (and b!830725 c!90086) b!830723))

(assert (= (and b!830725 (not c!90086)) b!830719))

(declare-fun b_lambda!11317 () Bool)

(assert (=> (not b_lambda!11317) (not b!830718)))

(assert (=> b!830718 t!22197))

(declare-fun b_and!22509 () Bool)

(assert (= b_and!22507 (and (=> t!22197 result!7995) b_and!22509)))

(declare-fun b_lambda!11319 () Bool)

(assert (=> (not b_lambda!11319) (not b!830727)))

(assert (=> b!830727 t!22197))

(declare-fun b_and!22511 () Bool)

(assert (= b_and!22509 (and (=> t!22197 result!7995) b_and!22511)))

(assert (=> b!830721 m!774037))

(assert (=> b!830721 m!774037))

(declare-fun m!774159 () Bool)

(assert (=> b!830721 m!774159))

(assert (=> b!830722 m!774037))

(assert (=> b!830722 m!774037))

(assert (=> b!830722 m!774067))

(assert (=> b!830718 m!774077))

(assert (=> b!830718 m!774079))

(assert (=> b!830718 m!774081))

(assert (=> b!830718 m!774077))

(assert (=> b!830718 m!774037))

(assert (=> b!830718 m!774079))

(declare-fun m!774161 () Bool)

(assert (=> b!830718 m!774161))

(declare-fun m!774163 () Bool)

(assert (=> b!830718 m!774163))

(declare-fun m!774165 () Bool)

(assert (=> b!830718 m!774165))

(assert (=> b!830718 m!774161))

(declare-fun m!774167 () Bool)

(assert (=> b!830718 m!774167))

(assert (=> b!830726 m!774037))

(assert (=> b!830726 m!774037))

(assert (=> b!830726 m!774067))

(declare-fun m!774169 () Bool)

(assert (=> d!105611 m!774169))

(assert (=> d!105611 m!773973))

(assert (=> b!830727 m!774077))

(assert (=> b!830727 m!774079))

(assert (=> b!830727 m!774081))

(assert (=> b!830727 m!774077))

(assert (=> b!830727 m!774037))

(assert (=> b!830727 m!774079))

(assert (=> b!830727 m!774037))

(declare-fun m!774171 () Bool)

(assert (=> b!830727 m!774171))

(declare-fun m!774173 () Bool)

(assert (=> b!830728 m!774173))

(declare-fun m!774175 () Bool)

(assert (=> bm!36219 m!774175))

(declare-fun m!774177 () Bool)

(assert (=> b!830719 m!774177))

(assert (=> b!830723 m!774175))

(assert (=> b!830549 d!105611))

(declare-fun b!830730 () Bool)

(declare-fun lt!376805 () Unit!28436)

(declare-fun lt!376802 () Unit!28436)

(assert (=> b!830730 (= lt!376805 lt!376802)))

(declare-fun lt!376803 () ListLongMap!8893)

(declare-fun lt!376801 () (_ BitVec 64))

(declare-fun lt!376804 () (_ BitVec 64))

(declare-fun lt!376807 () V!25259)

(assert (=> b!830730 (not (contains!4180 (+!1984 lt!376803 (tuple2!10069 lt!376801 lt!376807)) lt!376804))))

(assert (=> b!830730 (= lt!376802 (addStillNotContains!197 lt!376803 lt!376801 lt!376807 lt!376804))))

(assert (=> b!830730 (= lt!376804 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830730 (= lt!376807 (get!11814 (select (arr!22316 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830730 (= lt!376801 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36223 () ListLongMap!8893)

(assert (=> b!830730 (= lt!376803 call!36223)))

(declare-fun e!463185 () ListLongMap!8893)

(assert (=> b!830730 (= e!463185 (+!1984 call!36223 (tuple2!10069 (select (arr!22315 _keys!976) #b00000000000000000000000000000000) (get!11814 (select (arr!22316 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830731 () Bool)

(declare-fun e!463183 () Bool)

(declare-fun lt!376806 () ListLongMap!8893)

(assert (=> b!830731 (= e!463183 (isEmpty!658 lt!376806))))

(declare-fun b!830732 () Bool)

(declare-fun e!463179 () Bool)

(declare-fun e!463180 () Bool)

(assert (=> b!830732 (= e!463179 e!463180)))

(declare-fun c!90089 () Bool)

(declare-fun e!463182 () Bool)

(assert (=> b!830732 (= c!90089 e!463182)))

(declare-fun res!565598 () Bool)

(assert (=> b!830732 (=> (not res!565598) (not e!463182))))

(assert (=> b!830732 (= res!565598 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830733 () Bool)

(declare-fun e!463181 () Bool)

(assert (=> b!830733 (= e!463180 e!463181)))

(assert (=> b!830733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun res!565597 () Bool)

(assert (=> b!830733 (= res!565597 (contains!4180 lt!376806 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830733 (=> (not res!565597) (not e!463181))))

(declare-fun b!830734 () Bool)

(assert (=> b!830734 (= e!463182 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830734 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830735 () Bool)

(assert (=> b!830735 (= e!463183 (= lt!376806 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830736 () Bool)

(assert (=> b!830736 (= e!463185 call!36223)))

(declare-fun d!105613 () Bool)

(assert (=> d!105613 e!463179))

(declare-fun res!565596 () Bool)

(assert (=> d!105613 (=> (not res!565596) (not e!463179))))

(assert (=> d!105613 (= res!565596 (not (contains!4180 lt!376806 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463184 () ListLongMap!8893)

(assert (=> d!105613 (= lt!376806 e!463184)))

(declare-fun c!90088 () Bool)

(assert (=> d!105613 (= c!90088 (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105613 (validMask!0 mask!1312)))

(assert (=> d!105613 (= (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376806)))

(declare-fun b!830737 () Bool)

(assert (=> b!830737 (= e!463180 e!463183)))

(declare-fun c!90090 () Bool)

(assert (=> b!830737 (= c!90090 (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(declare-fun b!830738 () Bool)

(assert (=> b!830738 (= e!463184 e!463185)))

(declare-fun c!90091 () Bool)

(assert (=> b!830738 (= c!90091 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36220 () Bool)

(assert (=> bm!36220 (= call!36223 (getCurrentListMapNoExtraKeys!2533 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830739 () Bool)

(assert (=> b!830739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> b!830739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22736 _values!788)))))

(assert (=> b!830739 (= e!463181 (= (apply!370 lt!376806 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)) (get!11814 (select (arr!22316 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830740 () Bool)

(declare-fun res!565599 () Bool)

(assert (=> b!830740 (=> (not res!565599) (not e!463179))))

(assert (=> b!830740 (= res!565599 (not (contains!4180 lt!376806 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830741 () Bool)

(assert (=> b!830741 (= e!463184 (ListLongMap!8894 Nil!15837))))

(assert (= (and d!105613 c!90088) b!830741))

(assert (= (and d!105613 (not c!90088)) b!830738))

(assert (= (and b!830738 c!90091) b!830730))

(assert (= (and b!830738 (not c!90091)) b!830736))

(assert (= (or b!830730 b!830736) bm!36220))

(assert (= (and d!105613 res!565596) b!830740))

(assert (= (and b!830740 res!565599) b!830732))

(assert (= (and b!830732 res!565598) b!830734))

(assert (= (and b!830732 c!90089) b!830733))

(assert (= (and b!830732 (not c!90089)) b!830737))

(assert (= (and b!830733 res!565597) b!830739))

(assert (= (and b!830737 c!90090) b!830735))

(assert (= (and b!830737 (not c!90090)) b!830731))

(declare-fun b_lambda!11321 () Bool)

(assert (=> (not b_lambda!11321) (not b!830730)))

(assert (=> b!830730 t!22197))

(declare-fun b_and!22513 () Bool)

(assert (= b_and!22511 (and (=> t!22197 result!7995) b_and!22513)))

(declare-fun b_lambda!11323 () Bool)

(assert (=> (not b_lambda!11323) (not b!830739)))

(assert (=> b!830739 t!22197))

(declare-fun b_and!22515 () Bool)

(assert (= b_and!22513 (and (=> t!22197 result!7995) b_and!22515)))

(assert (=> b!830733 m!774037))

(assert (=> b!830733 m!774037))

(declare-fun m!774179 () Bool)

(assert (=> b!830733 m!774179))

(assert (=> b!830734 m!774037))

(assert (=> b!830734 m!774037))

(assert (=> b!830734 m!774067))

(assert (=> b!830730 m!774077))

(assert (=> b!830730 m!774079))

(assert (=> b!830730 m!774081))

(assert (=> b!830730 m!774077))

(assert (=> b!830730 m!774037))

(assert (=> b!830730 m!774079))

(declare-fun m!774181 () Bool)

(assert (=> b!830730 m!774181))

(declare-fun m!774183 () Bool)

(assert (=> b!830730 m!774183))

(declare-fun m!774185 () Bool)

(assert (=> b!830730 m!774185))

(assert (=> b!830730 m!774181))

(declare-fun m!774187 () Bool)

(assert (=> b!830730 m!774187))

(assert (=> b!830738 m!774037))

(assert (=> b!830738 m!774037))

(assert (=> b!830738 m!774067))

(declare-fun m!774189 () Bool)

(assert (=> d!105613 m!774189))

(assert (=> d!105613 m!773973))

(assert (=> b!830739 m!774077))

(assert (=> b!830739 m!774079))

(assert (=> b!830739 m!774081))

(assert (=> b!830739 m!774077))

(assert (=> b!830739 m!774037))

(assert (=> b!830739 m!774079))

(assert (=> b!830739 m!774037))

(declare-fun m!774191 () Bool)

(assert (=> b!830739 m!774191))

(declare-fun m!774193 () Bool)

(assert (=> b!830740 m!774193))

(declare-fun m!774195 () Bool)

(assert (=> bm!36220 m!774195))

(declare-fun m!774197 () Bool)

(assert (=> b!830731 m!774197))

(assert (=> b!830735 m!774195))

(assert (=> b!830549 d!105613))

(declare-fun d!105615 () Bool)

(assert (=> d!105615 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71604 d!105615))

(declare-fun d!105617 () Bool)

(assert (=> d!105617 (= (array_inv!17817 _keys!976) (bvsge (size!22735 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71604 d!105617))

(declare-fun d!105619 () Bool)

(assert (=> d!105619 (= (array_inv!17818 _values!788) (bvsge (size!22736 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71604 d!105619))

(declare-fun b!830752 () Bool)

(declare-fun e!463197 () Bool)

(declare-fun e!463194 () Bool)

(assert (=> b!830752 (= e!463197 e!463194)))

(declare-fun res!565606 () Bool)

(assert (=> b!830752 (=> (not res!565606) (not e!463194))))

(declare-fun e!463195 () Bool)

(assert (=> b!830752 (= res!565606 (not e!463195))))

(declare-fun res!565608 () Bool)

(assert (=> b!830752 (=> (not res!565608) (not e!463195))))

(assert (=> b!830752 (= res!565608 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105621 () Bool)

(declare-fun res!565607 () Bool)

(assert (=> d!105621 (=> res!565607 e!463197)))

(assert (=> d!105621 (= res!565607 (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105621 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15836) e!463197)))

(declare-fun b!830753 () Bool)

(declare-fun contains!4182 (List!15839 (_ BitVec 64)) Bool)

(assert (=> b!830753 (= e!463195 (contains!4182 Nil!15836 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36223 () Bool)

(declare-fun call!36226 () Bool)

(declare-fun c!90094 () Bool)

(assert (=> bm!36223 (= call!36226 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90094 (Cons!15835 (select (arr!22315 _keys!976) #b00000000000000000000000000000000) Nil!15836) Nil!15836)))))

(declare-fun b!830754 () Bool)

(declare-fun e!463196 () Bool)

(assert (=> b!830754 (= e!463196 call!36226)))

(declare-fun b!830755 () Bool)

(assert (=> b!830755 (= e!463194 e!463196)))

(assert (=> b!830755 (= c!90094 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830756 () Bool)

(assert (=> b!830756 (= e!463196 call!36226)))

(assert (= (and d!105621 (not res!565607)) b!830752))

(assert (= (and b!830752 res!565608) b!830753))

(assert (= (and b!830752 res!565606) b!830755))

(assert (= (and b!830755 c!90094) b!830754))

(assert (= (and b!830755 (not c!90094)) b!830756))

(assert (= (or b!830754 b!830756) bm!36223))

(assert (=> b!830752 m!774037))

(assert (=> b!830752 m!774037))

(assert (=> b!830752 m!774067))

(assert (=> b!830753 m!774037))

(assert (=> b!830753 m!774037))

(declare-fun m!774199 () Bool)

(assert (=> b!830753 m!774199))

(assert (=> bm!36223 m!774037))

(declare-fun m!774201 () Bool)

(assert (=> bm!36223 m!774201))

(assert (=> b!830755 m!774037))

(assert (=> b!830755 m!774037))

(assert (=> b!830755 m!774067))

(assert (=> b!830545 d!105621))

(declare-fun b!830765 () Bool)

(declare-fun e!463205 () Bool)

(declare-fun call!36229 () Bool)

(assert (=> b!830765 (= e!463205 call!36229)))

(declare-fun b!830766 () Bool)

(declare-fun e!463204 () Bool)

(assert (=> b!830766 (= e!463204 call!36229)))

(declare-fun d!105623 () Bool)

(declare-fun res!565613 () Bool)

(declare-fun e!463206 () Bool)

(assert (=> d!105623 (=> res!565613 e!463206)))

(assert (=> d!105623 (= res!565613 (bvsge #b00000000000000000000000000000000 (size!22735 _keys!976)))))

(assert (=> d!105623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!463206)))

(declare-fun b!830767 () Bool)

(assert (=> b!830767 (= e!463206 e!463204)))

(declare-fun c!90097 () Bool)

(assert (=> b!830767 (= c!90097 (validKeyInArray!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830768 () Bool)

(assert (=> b!830768 (= e!463204 e!463205)))

(declare-fun lt!376816 () (_ BitVec 64))

(assert (=> b!830768 (= lt!376816 (select (arr!22315 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376814 () Unit!28436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46563 (_ BitVec 64) (_ BitVec 32)) Unit!28436)

(assert (=> b!830768 (= lt!376814 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376816 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!830768 (arrayContainsKey!0 _keys!976 lt!376816 #b00000000000000000000000000000000)))

(declare-fun lt!376815 () Unit!28436)

(assert (=> b!830768 (= lt!376815 lt!376814)))

(declare-fun res!565614 () Bool)

(declare-datatypes ((SeekEntryResult!8693 0))(
  ( (MissingZero!8693 (index!37143 (_ BitVec 32))) (Found!8693 (index!37144 (_ BitVec 32))) (Intermediate!8693 (undefined!9505 Bool) (index!37145 (_ BitVec 32)) (x!70034 (_ BitVec 32))) (Undefined!8693) (MissingVacant!8693 (index!37146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46563 (_ BitVec 32)) SeekEntryResult!8693)

(assert (=> b!830768 (= res!565614 (= (seekEntryOrOpen!0 (select (arr!22315 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8693 #b00000000000000000000000000000000)))))

(assert (=> b!830768 (=> (not res!565614) (not e!463205))))

(declare-fun bm!36226 () Bool)

(assert (=> bm!36226 (= call!36229 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!105623 (not res!565613)) b!830767))

(assert (= (and b!830767 c!90097) b!830768))

(assert (= (and b!830767 (not c!90097)) b!830766))

(assert (= (and b!830768 res!565614) b!830765))

(assert (= (or b!830765 b!830766) bm!36226))

(assert (=> b!830767 m!774037))

(assert (=> b!830767 m!774037))

(assert (=> b!830767 m!774067))

(assert (=> b!830768 m!774037))

(declare-fun m!774203 () Bool)

(assert (=> b!830768 m!774203))

(declare-fun m!774205 () Bool)

(assert (=> b!830768 m!774205))

(assert (=> b!830768 m!774037))

(declare-fun m!774207 () Bool)

(assert (=> b!830768 m!774207))

(declare-fun m!774209 () Bool)

(assert (=> bm!36226 m!774209))

(assert (=> b!830544 d!105623))

(declare-fun b!830776 () Bool)

(declare-fun e!463211 () Bool)

(assert (=> b!830776 (= e!463211 tp_is_empty!15193)))

(declare-fun mapNonEmpty!24445 () Bool)

(declare-fun mapRes!24445 () Bool)

(declare-fun tp!47245 () Bool)

(declare-fun e!463212 () Bool)

(assert (=> mapNonEmpty!24445 (= mapRes!24445 (and tp!47245 e!463212))))

(declare-fun mapRest!24445 () (Array (_ BitVec 32) ValueCell!7181))

(declare-fun mapKey!24445 () (_ BitVec 32))

(declare-fun mapValue!24445 () ValueCell!7181)

(assert (=> mapNonEmpty!24445 (= mapRest!24436 (store mapRest!24445 mapKey!24445 mapValue!24445))))

(declare-fun mapIsEmpty!24445 () Bool)

(assert (=> mapIsEmpty!24445 mapRes!24445))

(declare-fun condMapEmpty!24445 () Bool)

(declare-fun mapDefault!24445 () ValueCell!7181)

(assert (=> mapNonEmpty!24436 (= condMapEmpty!24445 (= mapRest!24436 ((as const (Array (_ BitVec 32) ValueCell!7181)) mapDefault!24445)))))

(assert (=> mapNonEmpty!24436 (= tp!47229 (and e!463211 mapRes!24445))))

(declare-fun b!830775 () Bool)

(assert (=> b!830775 (= e!463212 tp_is_empty!15193)))

(assert (= (and mapNonEmpty!24436 condMapEmpty!24445) mapIsEmpty!24445))

(assert (= (and mapNonEmpty!24436 (not condMapEmpty!24445)) mapNonEmpty!24445))

(assert (= (and mapNonEmpty!24445 ((_ is ValueCellFull!7181) mapValue!24445)) b!830775))

(assert (= (and mapNonEmpty!24436 ((_ is ValueCellFull!7181) mapDefault!24445)) b!830776))

(declare-fun m!774211 () Bool)

(assert (=> mapNonEmpty!24445 m!774211))

(declare-fun b_lambda!11325 () Bool)

(assert (= b_lambda!11319 (or (and start!71604 b_free!13483) b_lambda!11325)))

(declare-fun b_lambda!11327 () Bool)

(assert (= b_lambda!11313 (or (and start!71604 b_free!13483) b_lambda!11327)))

(declare-fun b_lambda!11329 () Bool)

(assert (= b_lambda!11317 (or (and start!71604 b_free!13483) b_lambda!11329)))

(declare-fun b_lambda!11331 () Bool)

(assert (= b_lambda!11315 (or (and start!71604 b_free!13483) b_lambda!11331)))

(declare-fun b_lambda!11333 () Bool)

(assert (= b_lambda!11323 (or (and start!71604 b_free!13483) b_lambda!11333)))

(declare-fun b_lambda!11335 () Bool)

(assert (= b_lambda!11321 (or (and start!71604 b_free!13483) b_lambda!11335)))

(check-sat b_and!22515 (not bm!36220) (not b!830755) (not b!830672) (not b!830655) (not b!830662) (not b_lambda!11333) (not d!105609) (not mapNonEmpty!24445) (not b!830739) (not b!830735) (not b_lambda!11331) (not b!830648) (not b!830659) (not bm!36216) (not b!830688) (not b!830738) (not b_lambda!11329) (not b!830652) tp_is_empty!15193 (not b!830734) (not bm!36204) (not b!830731) (not b!830669) (not bm!36207) (not b!830730) (not b!830733) (not b!830690) (not bm!36208) (not b_lambda!11327) (not b!830691) (not b!830686) (not b!830728) (not b!830721) (not b!830671) (not bm!36219) (not d!105613) (not b!830670) (not b!830768) (not b_next!13483) (not b!830692) (not bm!36226) (not b_lambda!11335) (not bm!36223) (not b!830660) (not b!830683) (not d!105605) (not bm!36214) (not b!830727) (not b!830722) (not d!105603) (not b!830679) (not b!830767) (not b_lambda!11325) (not bm!36215) (not b!830723) (not b!830657) (not d!105611) (not b!830718) (not b!830740) (not b!830661) (not b!830752) (not b!830693) (not d!105601) (not d!105607) (not b!830753) (not bm!36209) (not bm!36211) (not b!830726) (not b!830719))
(check-sat b_and!22515 (not b_next!13483))
