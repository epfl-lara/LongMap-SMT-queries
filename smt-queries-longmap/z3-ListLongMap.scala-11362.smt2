; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132026 () Bool)

(assert start!132026)

(declare-fun b_free!31789 () Bool)

(declare-fun b_next!31789 () Bool)

(assert (=> start!132026 (= b_free!31789 (not b_next!31789))))

(declare-fun tp!111619 () Bool)

(declare-fun b_and!51181 () Bool)

(assert (=> start!132026 (= tp!111619 b_and!51181)))

(declare-fun res!1060968 () Bool)

(declare-fun e!861679 () Bool)

(assert (=> start!132026 (=> (not res!1060968) (not e!861679))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132026 (= res!1060968 (validMask!0 mask!926))))

(assert (=> start!132026 e!861679))

(declare-datatypes ((array!103258 0))(
  ( (array!103259 (arr!49832 (Array (_ BitVec 32) (_ BitVec 64))) (size!50384 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103258)

(declare-fun array_inv!38957 (array!103258) Bool)

(assert (=> start!132026 (array_inv!38957 _keys!618)))

(declare-fun tp_is_empty!38065 () Bool)

(assert (=> start!132026 tp_is_empty!38065))

(assert (=> start!132026 true))

(assert (=> start!132026 tp!111619))

(declare-datatypes ((V!59197 0))(
  ( (V!59198 (val!19110 Int)) )
))
(declare-datatypes ((ValueCell!18122 0))(
  ( (ValueCellFull!18122 (v!21907 V!59197)) (EmptyCell!18122) )
))
(declare-datatypes ((array!103260 0))(
  ( (array!103261 (arr!49833 (Array (_ BitVec 32) ValueCell!18122)) (size!50385 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103260)

(declare-fun e!861681 () Bool)

(declare-fun array_inv!38958 (array!103260) Bool)

(assert (=> start!132026 (and (array_inv!38958 _values!470) e!861681)))

(declare-fun b!1548064 () Bool)

(declare-fun res!1060965 () Bool)

(assert (=> b!1548064 (=> (not res!1060965) (not e!861679))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1548064 (= res!1060965 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50384 _keys!618))))))

(declare-fun b!1548065 () Bool)

(declare-fun e!861684 () Bool)

(assert (=> b!1548065 (= e!861684 tp_is_empty!38065)))

(declare-fun b!1548066 () Bool)

(declare-fun res!1060963 () Bool)

(assert (=> b!1548066 (=> (not res!1060963) (not e!861679))))

(declare-datatypes ((List!36141 0))(
  ( (Nil!36138) (Cons!36137 (h!37583 (_ BitVec 64)) (t!50827 List!36141)) )
))
(declare-fun arrayNoDuplicates!0 (array!103258 (_ BitVec 32) List!36141) Bool)

(assert (=> b!1548066 (= res!1060963 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36138))))

(declare-fun b!1548067 () Bool)

(declare-datatypes ((tuple2!24676 0))(
  ( (tuple2!24677 (_1!12349 (_ BitVec 64)) (_2!12349 V!59197)) )
))
(declare-datatypes ((List!36142 0))(
  ( (Nil!36139) (Cons!36138 (h!37584 tuple2!24676) (t!50828 List!36142)) )
))
(declare-datatypes ((ListLongMap!22285 0))(
  ( (ListLongMap!22286 (toList!11158 List!36142)) )
))
(declare-fun e!861680 () ListLongMap!22285)

(declare-fun call!70113 () ListLongMap!22285)

(declare-fun minValue!436 () V!59197)

(declare-fun +!4982 (ListLongMap!22285 tuple2!24676) ListLongMap!22285)

(assert (=> b!1548067 (= e!861680 (+!4982 call!70113 (tuple2!24677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70107 () Bool)

(declare-fun call!70112 () ListLongMap!22285)

(declare-fun call!70114 () ListLongMap!22285)

(assert (=> bm!70107 (= call!70112 call!70114)))

(declare-fun bm!70108 () Bool)

(declare-fun call!70111 () ListLongMap!22285)

(assert (=> bm!70108 (= call!70114 call!70111)))

(declare-fun mapNonEmpty!58801 () Bool)

(declare-fun mapRes!58801 () Bool)

(declare-fun tp!111620 () Bool)

(declare-fun e!861682 () Bool)

(assert (=> mapNonEmpty!58801 (= mapRes!58801 (and tp!111620 e!861682))))

(declare-fun mapKey!58801 () (_ BitVec 32))

(declare-fun mapValue!58801 () ValueCell!18122)

(declare-fun mapRest!58801 () (Array (_ BitVec 32) ValueCell!18122))

(assert (=> mapNonEmpty!58801 (= (arr!49833 _values!470) (store mapRest!58801 mapKey!58801 mapValue!58801))))

(declare-fun c!142091 () Bool)

(declare-fun c!142090 () Bool)

(declare-fun bm!70109 () Bool)

(declare-fun zeroValue!436 () V!59197)

(assert (=> bm!70109 (= call!70113 (+!4982 (ite c!142090 call!70111 (ite c!142091 call!70114 call!70112)) (ite (or c!142090 c!142091) (tuple2!24677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58801 () Bool)

(assert (=> mapIsEmpty!58801 mapRes!58801))

(declare-fun b!1548068 () Bool)

(declare-fun e!861677 () Bool)

(assert (=> b!1548068 (= e!861677 (not true))))

(declare-fun lt!666972 () V!59197)

(declare-fun lt!666975 () ListLongMap!22285)

(declare-fun apply!1062 (ListLongMap!22285 (_ BitVec 64)) V!59197)

(assert (=> b!1548068 (= (apply!1062 lt!666975 (select (arr!49832 _keys!618) from!762)) lt!666972)))

(declare-datatypes ((Unit!51421 0))(
  ( (Unit!51422) )
))
(declare-fun lt!666979 () Unit!51421)

(declare-fun lt!666973 () ListLongMap!22285)

(declare-fun addApplyDifferent!600 (ListLongMap!22285 (_ BitVec 64) V!59197 (_ BitVec 64)) Unit!51421)

(assert (=> b!1548068 (= lt!666979 (addApplyDifferent!600 lt!666973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49832 _keys!618) from!762)))))

(declare-fun lt!666974 () V!59197)

(assert (=> b!1548068 (= lt!666974 lt!666972)))

(assert (=> b!1548068 (= lt!666972 (apply!1062 lt!666973 (select (arr!49832 _keys!618) from!762)))))

(assert (=> b!1548068 (= lt!666974 (apply!1062 (+!4982 lt!666973 (tuple2!24677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49832 _keys!618) from!762)))))

(declare-fun lt!666978 () Unit!51421)

(assert (=> b!1548068 (= lt!666978 (addApplyDifferent!600 lt!666973 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49832 _keys!618) from!762)))))

(declare-fun contains!10037 (ListLongMap!22285 (_ BitVec 64)) Bool)

(assert (=> b!1548068 (contains!10037 lt!666975 (select (arr!49832 _keys!618) from!762))))

(assert (=> b!1548068 (= lt!666975 (+!4982 lt!666973 (tuple2!24677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!666971 () Unit!51421)

(declare-fun addStillContains!1260 (ListLongMap!22285 (_ BitVec 64) V!59197 (_ BitVec 64)) Unit!51421)

(assert (=> b!1548068 (= lt!666971 (addStillContains!1260 lt!666973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49832 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6609 (array!103258 array!103260 (_ BitVec 32) (_ BitVec 32) V!59197 V!59197 (_ BitVec 32) Int) ListLongMap!22285)

(assert (=> b!1548068 (= lt!666973 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548069 () Bool)

(assert (=> b!1548069 (= e!861681 (and e!861684 mapRes!58801))))

(declare-fun condMapEmpty!58801 () Bool)

(declare-fun mapDefault!58801 () ValueCell!18122)

(assert (=> b!1548069 (= condMapEmpty!58801 (= (arr!49833 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18122)) mapDefault!58801)))))

(declare-fun b!1548070 () Bool)

(assert (=> b!1548070 (= e!861682 tp_is_empty!38065)))

(declare-fun b!1548071 () Bool)

(declare-fun res!1060962 () Bool)

(assert (=> b!1548071 (=> (not res!1060962) (not e!861679))))

(assert (=> b!1548071 (= res!1060962 (and (= (size!50385 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50384 _keys!618) (size!50385 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548072 () Bool)

(declare-fun res!1060966 () Bool)

(assert (=> b!1548072 (=> (not res!1060966) (not e!861679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103258 (_ BitVec 32)) Bool)

(assert (=> b!1548072 (= res!1060966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548073 () Bool)

(assert (=> b!1548073 (= e!861679 e!861677)))

(declare-fun res!1060964 () Bool)

(assert (=> b!1548073 (=> (not res!1060964) (not e!861677))))

(assert (=> b!1548073 (= res!1060964 (bvslt from!762 (size!50384 _keys!618)))))

(declare-fun lt!666977 () ListLongMap!22285)

(assert (=> b!1548073 (= lt!666977 e!861680)))

(declare-fun lt!666976 () Bool)

(assert (=> b!1548073 (= c!142090 (and (not lt!666976) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548073 (= lt!666976 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548074 () Bool)

(declare-fun e!861678 () ListLongMap!22285)

(declare-fun call!70110 () ListLongMap!22285)

(assert (=> b!1548074 (= e!861678 call!70110)))

(declare-fun bm!70110 () Bool)

(assert (=> bm!70110 (= call!70111 (getCurrentListMapNoExtraKeys!6609 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548075 () Bool)

(assert (=> b!1548075 (= e!861678 call!70112)))

(declare-fun b!1548076 () Bool)

(declare-fun res!1060967 () Bool)

(assert (=> b!1548076 (=> (not res!1060967) (not e!861677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548076 (= res!1060967 (validKeyInArray!0 (select (arr!49832 _keys!618) from!762)))))

(declare-fun b!1548077 () Bool)

(declare-fun e!861676 () ListLongMap!22285)

(assert (=> b!1548077 (= e!861676 call!70110)))

(declare-fun b!1548078 () Bool)

(assert (=> b!1548078 (= e!861680 e!861676)))

(assert (=> b!1548078 (= c!142091 (and (not lt!666976) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548079 () Bool)

(declare-fun c!142092 () Bool)

(assert (=> b!1548079 (= c!142092 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666976))))

(assert (=> b!1548079 (= e!861676 e!861678)))

(declare-fun bm!70111 () Bool)

(assert (=> bm!70111 (= call!70110 call!70113)))

(assert (= (and start!132026 res!1060968) b!1548071))

(assert (= (and b!1548071 res!1060962) b!1548072))

(assert (= (and b!1548072 res!1060966) b!1548066))

(assert (= (and b!1548066 res!1060963) b!1548064))

(assert (= (and b!1548064 res!1060965) b!1548073))

(assert (= (and b!1548073 c!142090) b!1548067))

(assert (= (and b!1548073 (not c!142090)) b!1548078))

(assert (= (and b!1548078 c!142091) b!1548077))

(assert (= (and b!1548078 (not c!142091)) b!1548079))

(assert (= (and b!1548079 c!142092) b!1548074))

(assert (= (and b!1548079 (not c!142092)) b!1548075))

(assert (= (or b!1548074 b!1548075) bm!70107))

(assert (= (or b!1548077 bm!70107) bm!70108))

(assert (= (or b!1548077 b!1548074) bm!70111))

(assert (= (or b!1548067 bm!70108) bm!70110))

(assert (= (or b!1548067 bm!70111) bm!70109))

(assert (= (and b!1548073 res!1060964) b!1548076))

(assert (= (and b!1548076 res!1060967) b!1548068))

(assert (= (and b!1548069 condMapEmpty!58801) mapIsEmpty!58801))

(assert (= (and b!1548069 (not condMapEmpty!58801)) mapNonEmpty!58801))

(get-info :version)

(assert (= (and mapNonEmpty!58801 ((_ is ValueCellFull!18122) mapValue!58801)) b!1548070))

(assert (= (and b!1548069 ((_ is ValueCellFull!18122) mapDefault!58801)) b!1548065))

(assert (= start!132026 b!1548069))

(declare-fun m!1426899 () Bool)

(assert (=> mapNonEmpty!58801 m!1426899))

(declare-fun m!1426901 () Bool)

(assert (=> b!1548066 m!1426901))

(declare-fun m!1426903 () Bool)

(assert (=> b!1548068 m!1426903))

(declare-fun m!1426905 () Bool)

(assert (=> b!1548068 m!1426905))

(declare-fun m!1426907 () Bool)

(assert (=> b!1548068 m!1426907))

(assert (=> b!1548068 m!1426903))

(declare-fun m!1426909 () Bool)

(assert (=> b!1548068 m!1426909))

(assert (=> b!1548068 m!1426903))

(declare-fun m!1426911 () Bool)

(assert (=> b!1548068 m!1426911))

(assert (=> b!1548068 m!1426903))

(declare-fun m!1426913 () Bool)

(assert (=> b!1548068 m!1426913))

(declare-fun m!1426915 () Bool)

(assert (=> b!1548068 m!1426915))

(assert (=> b!1548068 m!1426907))

(assert (=> b!1548068 m!1426903))

(declare-fun m!1426917 () Bool)

(assert (=> b!1548068 m!1426917))

(assert (=> b!1548068 m!1426903))

(declare-fun m!1426919 () Bool)

(assert (=> b!1548068 m!1426919))

(assert (=> b!1548068 m!1426903))

(declare-fun m!1426921 () Bool)

(assert (=> b!1548068 m!1426921))

(assert (=> b!1548068 m!1426903))

(declare-fun m!1426923 () Bool)

(assert (=> b!1548068 m!1426923))

(assert (=> bm!70110 m!1426915))

(declare-fun m!1426925 () Bool)

(assert (=> b!1548072 m!1426925))

(assert (=> b!1548076 m!1426903))

(assert (=> b!1548076 m!1426903))

(declare-fun m!1426927 () Bool)

(assert (=> b!1548076 m!1426927))

(declare-fun m!1426929 () Bool)

(assert (=> bm!70109 m!1426929))

(declare-fun m!1426931 () Bool)

(assert (=> b!1548067 m!1426931))

(declare-fun m!1426933 () Bool)

(assert (=> start!132026 m!1426933))

(declare-fun m!1426935 () Bool)

(assert (=> start!132026 m!1426935))

(declare-fun m!1426937 () Bool)

(assert (=> start!132026 m!1426937))

(check-sat (not b!1548068) tp_is_empty!38065 (not b!1548076) (not b_next!31789) b_and!51181 (not mapNonEmpty!58801) (not b!1548072) (not b!1548066) (not bm!70110) (not b!1548067) (not bm!70109) (not start!132026))
(check-sat b_and!51181 (not b_next!31789))
