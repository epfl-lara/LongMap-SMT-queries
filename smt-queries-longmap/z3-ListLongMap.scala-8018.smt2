; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98942 () Bool)

(assert start!98942)

(declare-fun b_free!24553 () Bool)

(declare-fun b_next!24553 () Bool)

(assert (=> start!98942 (= b_free!24553 (not b_next!24553))))

(declare-fun tp!86369 () Bool)

(declare-fun b_and!39933 () Bool)

(assert (=> start!98942 (= tp!86369 b_and!39933)))

(declare-fun b!1160326 () Bool)

(declare-fun e!659821 () Bool)

(declare-fun tp_is_empty!29083 () Bool)

(assert (=> b!1160326 (= e!659821 tp_is_empty!29083)))

(declare-datatypes ((V!43905 0))(
  ( (V!43906 (val!14598 Int)) )
))
(declare-fun zeroValue!944 () V!43905)

(declare-datatypes ((tuple2!18680 0))(
  ( (tuple2!18681 (_1!9351 (_ BitVec 64)) (_2!9351 V!43905)) )
))
(declare-datatypes ((List!25399 0))(
  ( (Nil!25396) (Cons!25395 (h!26604 tuple2!18680) (t!36935 List!25399)) )
))
(declare-datatypes ((ListLongMap!16649 0))(
  ( (ListLongMap!16650 (toList!8340 List!25399)) )
))
(declare-fun lt!521794 () ListLongMap!16649)

(declare-fun lt!521810 () ListLongMap!16649)

(declare-fun c!115813 () Bool)

(declare-fun c!115812 () Bool)

(declare-fun minValue!944 () V!43905)

(declare-fun bm!56152 () Bool)

(declare-fun call!56159 () ListLongMap!16649)

(declare-fun +!3746 (ListLongMap!16649 tuple2!18680) ListLongMap!16649)

(assert (=> bm!56152 (= call!56159 (+!3746 (ite c!115812 lt!521794 lt!521810) (ite c!115812 (tuple2!18681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115813 (tuple2!18681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-datatypes ((array!74926 0))(
  ( (array!74927 (arr!36114 (Array (_ BitVec 32) (_ BitVec 64))) (size!36652 (_ BitVec 32))) )
))
(declare-fun lt!521797 () array!74926)

(declare-datatypes ((ValueCell!13832 0))(
  ( (ValueCellFull!13832 (v!17234 V!43905)) (EmptyCell!13832) )
))
(declare-datatypes ((array!74928 0))(
  ( (array!74929 (arr!36115 (Array (_ BitVec 32) ValueCell!13832)) (size!36653 (_ BitVec 32))) )
))
(declare-fun lt!521804 () array!74928)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun call!56162 () ListLongMap!16649)

(declare-fun bm!56153 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4818 (array!74926 array!74928 (_ BitVec 32) (_ BitVec 32) V!43905 V!43905 (_ BitVec 32) Int) ListLongMap!16649)

(assert (=> bm!56153 (= call!56162 (getCurrentListMapNoExtraKeys!4818 lt!521797 lt!521804 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160327 () Bool)

(declare-fun res!770050 () Bool)

(declare-fun e!659809 () Bool)

(assert (=> b!1160327 (=> (not res!770050) (not e!659809))))

(declare-fun _keys!1208 () array!74926)

(declare-fun _values!996 () array!74928)

(assert (=> b!1160327 (= res!770050 (and (= (size!36653 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36652 _keys!1208) (size!36653 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160328 () Bool)

(declare-fun e!659818 () Bool)

(declare-fun call!56158 () ListLongMap!16649)

(assert (=> b!1160328 (= e!659818 (= call!56162 call!56158))))

(declare-fun bm!56154 () Bool)

(declare-fun call!56155 () ListLongMap!16649)

(assert (=> bm!56154 (= call!56155 call!56159)))

(declare-fun b!1160329 () Bool)

(declare-datatypes ((Unit!38098 0))(
  ( (Unit!38099) )
))
(declare-fun e!659810 () Unit!38098)

(declare-fun Unit!38100 () Unit!38098)

(assert (=> b!1160329 (= e!659810 Unit!38100)))

(declare-fun b!1160330 () Bool)

(declare-fun e!659819 () Bool)

(declare-fun e!659807 () Bool)

(declare-fun mapRes!45449 () Bool)

(assert (=> b!1160330 (= e!659819 (and e!659807 mapRes!45449))))

(declare-fun condMapEmpty!45449 () Bool)

(declare-fun mapDefault!45449 () ValueCell!13832)

(assert (=> b!1160330 (= condMapEmpty!45449 (= (arr!36115 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13832)) mapDefault!45449)))))

(declare-fun b!1160331 () Bool)

(declare-fun e!659820 () Bool)

(assert (=> b!1160331 (= e!659820 true)))

(declare-fun e!659808 () Bool)

(assert (=> b!1160331 e!659808))

(declare-fun res!770054 () Bool)

(assert (=> b!1160331 (=> (not res!770054) (not e!659808))))

(declare-fun lt!521793 () ListLongMap!16649)

(assert (=> b!1160331 (= res!770054 (= lt!521793 lt!521810))))

(declare-fun lt!521796 () ListLongMap!16649)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1390 (ListLongMap!16649 (_ BitVec 64)) ListLongMap!16649)

(assert (=> b!1160331 (= lt!521793 (-!1390 lt!521796 k0!934))))

(declare-fun lt!521799 () V!43905)

(assert (=> b!1160331 (= (-!1390 (+!3746 lt!521810 (tuple2!18681 (select (arr!36114 _keys!1208) from!1455) lt!521799)) (select (arr!36114 _keys!1208) from!1455)) lt!521810)))

(declare-fun lt!521803 () Unit!38098)

(declare-fun addThenRemoveForNewKeyIsSame!236 (ListLongMap!16649 (_ BitVec 64) V!43905) Unit!38098)

(assert (=> b!1160331 (= lt!521803 (addThenRemoveForNewKeyIsSame!236 lt!521810 (select (arr!36114 _keys!1208) from!1455) lt!521799))))

(declare-fun lt!521806 () V!43905)

(declare-fun get!18434 (ValueCell!13832 V!43905) V!43905)

(assert (=> b!1160331 (= lt!521799 (get!18434 (select (arr!36115 _values!996) from!1455) lt!521806))))

(declare-fun lt!521800 () Unit!38098)

(declare-fun e!659811 () Unit!38098)

(assert (=> b!1160331 (= lt!521800 e!659811)))

(declare-fun c!115809 () Bool)

(declare-fun contains!6788 (ListLongMap!16649 (_ BitVec 64)) Bool)

(assert (=> b!1160331 (= c!115809 (contains!6788 lt!521810 k0!934))))

(assert (=> b!1160331 (= lt!521810 (getCurrentListMapNoExtraKeys!4818 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160332 () Bool)

(declare-fun res!770052 () Bool)

(assert (=> b!1160332 (=> (not res!770052) (not e!659809))))

(declare-datatypes ((List!25400 0))(
  ( (Nil!25397) (Cons!25396 (h!26605 (_ BitVec 64)) (t!36936 List!25400)) )
))
(declare-fun arrayNoDuplicates!0 (array!74926 (_ BitVec 32) List!25400) Bool)

(assert (=> b!1160332 (= res!770052 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25397))))

(declare-fun b!1160333 () Bool)

(declare-fun e!659816 () Unit!38098)

(declare-fun lt!521809 () Unit!38098)

(assert (=> b!1160333 (= e!659816 lt!521809)))

(declare-fun call!56157 () Unit!38098)

(assert (=> b!1160333 (= lt!521809 call!56157)))

(declare-fun call!56156 () Bool)

(assert (=> b!1160333 call!56156))

(declare-fun b!1160334 () Bool)

(declare-fun e!659823 () Bool)

(assert (=> b!1160334 (= e!659809 e!659823)))

(declare-fun res!770043 () Bool)

(assert (=> b!1160334 (=> (not res!770043) (not e!659823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74926 (_ BitVec 32)) Bool)

(assert (=> b!1160334 (= res!770043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521797 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160334 (= lt!521797 (array!74927 (store (arr!36114 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36652 _keys!1208)))))

(declare-fun b!1160335 () Bool)

(declare-fun res!770049 () Bool)

(assert (=> b!1160335 (=> (not res!770049) (not e!659809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160335 (= res!770049 (validKeyInArray!0 k0!934))))

(declare-fun res!770056 () Bool)

(assert (=> start!98942 (=> (not res!770056) (not e!659809))))

(assert (=> start!98942 (= res!770056 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36652 _keys!1208))))))

(assert (=> start!98942 e!659809))

(assert (=> start!98942 tp_is_empty!29083))

(declare-fun array_inv!27748 (array!74926) Bool)

(assert (=> start!98942 (array_inv!27748 _keys!1208)))

(assert (=> start!98942 true))

(assert (=> start!98942 tp!86369))

(declare-fun array_inv!27749 (array!74928) Bool)

(assert (=> start!98942 (and (array_inv!27749 _values!996) e!659819)))

(declare-fun b!1160336 () Bool)

(assert (=> b!1160336 (contains!6788 call!56159 k0!934)))

(declare-fun lt!521791 () Unit!38098)

(declare-fun call!56161 () Unit!38098)

(assert (=> b!1160336 (= lt!521791 call!56161)))

(declare-fun call!56160 () Bool)

(assert (=> b!1160336 call!56160))

(assert (=> b!1160336 (= lt!521794 (+!3746 lt!521810 (tuple2!18681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521801 () Unit!38098)

(declare-fun addStillContains!953 (ListLongMap!16649 (_ BitVec 64) V!43905 (_ BitVec 64)) Unit!38098)

(assert (=> b!1160336 (= lt!521801 (addStillContains!953 lt!521810 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!659814 () Unit!38098)

(assert (=> b!1160336 (= e!659814 lt!521791)))

(declare-fun b!1160337 () Bool)

(declare-fun res!770044 () Bool)

(assert (=> b!1160337 (=> (not res!770044) (not e!659809))))

(assert (=> b!1160337 (= res!770044 (= (select (arr!36114 _keys!1208) i!673) k0!934))))

(declare-fun b!1160338 () Bool)

(declare-fun e!659817 () Bool)

(assert (=> b!1160338 (= e!659823 (not e!659817))))

(declare-fun res!770055 () Bool)

(assert (=> b!1160338 (=> res!770055 e!659817)))

(assert (=> b!1160338 (= res!770055 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160338 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521802 () Unit!38098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74926 (_ BitVec 64) (_ BitVec 32)) Unit!38098)

(assert (=> b!1160338 (= lt!521802 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!56155 () Bool)

(assert (=> bm!56155 (= call!56161 (addStillContains!953 (ite c!115812 lt!521794 lt!521810) (ite c!115812 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115813 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115812 minValue!944 (ite c!115813 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1160339 () Bool)

(assert (=> b!1160339 (= e!659808 (= lt!521793 (getCurrentListMapNoExtraKeys!4818 lt!521797 lt!521804 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160340 () Bool)

(assert (=> b!1160340 (= e!659818 (= call!56162 (-!1390 call!56158 k0!934)))))

(declare-fun b!1160341 () Bool)

(declare-fun res!770047 () Bool)

(assert (=> b!1160341 (=> (not res!770047) (not e!659809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160341 (= res!770047 (validMask!0 mask!1564))))

(declare-fun b!1160342 () Bool)

(declare-fun e!659822 () Bool)

(assert (=> b!1160342 (= e!659817 e!659822)))

(declare-fun res!770053 () Bool)

(assert (=> b!1160342 (=> res!770053 e!659822)))

(assert (=> b!1160342 (= res!770053 (not (= from!1455 i!673)))))

(declare-fun lt!521790 () ListLongMap!16649)

(assert (=> b!1160342 (= lt!521790 (getCurrentListMapNoExtraKeys!4818 lt!521797 lt!521804 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1160342 (= lt!521804 (array!74929 (store (arr!36115 _values!996) i!673 (ValueCellFull!13832 lt!521806)) (size!36653 _values!996)))))

(declare-fun dynLambda!2762 (Int (_ BitVec 64)) V!43905)

(assert (=> b!1160342 (= lt!521806 (dynLambda!2762 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1160342 (= lt!521796 (getCurrentListMapNoExtraKeys!4818 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160343 () Bool)

(declare-fun e!659812 () Bool)

(assert (=> b!1160343 (= e!659812 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160344 () Bool)

(assert (=> b!1160344 (= e!659816 e!659810)))

(declare-fun c!115810 () Bool)

(declare-fun lt!521811 () Bool)

(assert (=> b!1160344 (= c!115810 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521811))))

(declare-fun b!1160345 () Bool)

(assert (=> b!1160345 (= c!115813 (and (not lt!521811) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1160345 (= e!659814 e!659816)))

(declare-fun b!1160346 () Bool)

(declare-fun res!770051 () Bool)

(assert (=> b!1160346 (=> (not res!770051) (not e!659823))))

(assert (=> b!1160346 (= res!770051 (arrayNoDuplicates!0 lt!521797 #b00000000000000000000000000000000 Nil!25397))))

(declare-fun b!1160347 () Bool)

(assert (=> b!1160347 (= e!659822 e!659820)))

(declare-fun res!770045 () Bool)

(assert (=> b!1160347 (=> res!770045 e!659820)))

(assert (=> b!1160347 (= res!770045 (not (= (select (arr!36114 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1160347 e!659818))

(declare-fun c!115811 () Bool)

(assert (=> b!1160347 (= c!115811 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521808 () Unit!38098)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!658 (array!74926 array!74928 (_ BitVec 32) (_ BitVec 32) V!43905 V!43905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38098)

(assert (=> b!1160347 (= lt!521808 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!658 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56156 () Bool)

(assert (=> bm!56156 (= call!56157 call!56161)))

(declare-fun mapNonEmpty!45449 () Bool)

(declare-fun tp!86370 () Bool)

(assert (=> mapNonEmpty!45449 (= mapRes!45449 (and tp!86370 e!659821))))

(declare-fun mapValue!45449 () ValueCell!13832)

(declare-fun mapRest!45449 () (Array (_ BitVec 32) ValueCell!13832))

(declare-fun mapKey!45449 () (_ BitVec 32))

(assert (=> mapNonEmpty!45449 (= (arr!36115 _values!996) (store mapRest!45449 mapKey!45449 mapValue!45449))))

(declare-fun b!1160348 () Bool)

(declare-fun Unit!38101 () Unit!38098)

(assert (=> b!1160348 (= e!659811 Unit!38101)))

(assert (=> b!1160348 (= lt!521811 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160348 (= c!115812 (and (not lt!521811) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521792 () Unit!38098)

(assert (=> b!1160348 (= lt!521792 e!659814)))

(declare-fun lt!521807 () Unit!38098)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!528 (array!74926 array!74928 (_ BitVec 32) (_ BitVec 32) V!43905 V!43905 (_ BitVec 64) (_ BitVec 32) Int) Unit!38098)

(assert (=> b!1160348 (= lt!521807 (lemmaListMapContainsThenArrayContainsFrom!528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115814 () Bool)

(assert (=> b!1160348 (= c!115814 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770057 () Bool)

(declare-fun e!659813 () Bool)

(assert (=> b!1160348 (= res!770057 e!659813)))

(assert (=> b!1160348 (=> (not res!770057) (not e!659812))))

(assert (=> b!1160348 e!659812))

(declare-fun lt!521805 () Unit!38098)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74926 (_ BitVec 32) (_ BitVec 32)) Unit!38098)

(assert (=> b!1160348 (= lt!521805 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160348 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25397)))

(declare-fun lt!521798 () Unit!38098)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74926 (_ BitVec 64) (_ BitVec 32) List!25400) Unit!38098)

(assert (=> b!1160348 (= lt!521798 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25397))))

(assert (=> b!1160348 false))

(declare-fun b!1160349 () Bool)

(assert (=> b!1160349 (= e!659813 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521811) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!56157 () Bool)

(assert (=> bm!56157 (= call!56160 (contains!6788 (ite c!115812 lt!521794 call!56155) k0!934))))

(declare-fun bm!56158 () Bool)

(assert (=> bm!56158 (= call!56156 call!56160)))

(declare-fun b!1160350 () Bool)

(declare-fun res!770046 () Bool)

(assert (=> b!1160350 (=> (not res!770046) (not e!659809))))

(assert (=> b!1160350 (= res!770046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160351 () Bool)

(declare-fun res!770048 () Bool)

(assert (=> b!1160351 (=> (not res!770048) (not e!659809))))

(assert (=> b!1160351 (= res!770048 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36652 _keys!1208))))))

(declare-fun b!1160352 () Bool)

(assert (=> b!1160352 call!56156))

(declare-fun lt!521795 () Unit!38098)

(assert (=> b!1160352 (= lt!521795 call!56157)))

(assert (=> b!1160352 (= e!659810 lt!521795)))

(declare-fun mapIsEmpty!45449 () Bool)

(assert (=> mapIsEmpty!45449 mapRes!45449))

(declare-fun bm!56159 () Bool)

(assert (=> bm!56159 (= call!56158 (getCurrentListMapNoExtraKeys!4818 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160353 () Bool)

(declare-fun Unit!38102 () Unit!38098)

(assert (=> b!1160353 (= e!659811 Unit!38102)))

(declare-fun b!1160354 () Bool)

(assert (=> b!1160354 (= e!659813 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160355 () Bool)

(assert (=> b!1160355 (= e!659807 tp_is_empty!29083)))

(assert (= (and start!98942 res!770056) b!1160341))

(assert (= (and b!1160341 res!770047) b!1160327))

(assert (= (and b!1160327 res!770050) b!1160350))

(assert (= (and b!1160350 res!770046) b!1160332))

(assert (= (and b!1160332 res!770052) b!1160351))

(assert (= (and b!1160351 res!770048) b!1160335))

(assert (= (and b!1160335 res!770049) b!1160337))

(assert (= (and b!1160337 res!770044) b!1160334))

(assert (= (and b!1160334 res!770043) b!1160346))

(assert (= (and b!1160346 res!770051) b!1160338))

(assert (= (and b!1160338 (not res!770055)) b!1160342))

(assert (= (and b!1160342 (not res!770053)) b!1160347))

(assert (= (and b!1160347 c!115811) b!1160340))

(assert (= (and b!1160347 (not c!115811)) b!1160328))

(assert (= (or b!1160340 b!1160328) bm!56153))

(assert (= (or b!1160340 b!1160328) bm!56159))

(assert (= (and b!1160347 (not res!770045)) b!1160331))

(assert (= (and b!1160331 c!115809) b!1160348))

(assert (= (and b!1160331 (not c!115809)) b!1160353))

(assert (= (and b!1160348 c!115812) b!1160336))

(assert (= (and b!1160348 (not c!115812)) b!1160345))

(assert (= (and b!1160345 c!115813) b!1160333))

(assert (= (and b!1160345 (not c!115813)) b!1160344))

(assert (= (and b!1160344 c!115810) b!1160352))

(assert (= (and b!1160344 (not c!115810)) b!1160329))

(assert (= (or b!1160333 b!1160352) bm!56156))

(assert (= (or b!1160333 b!1160352) bm!56154))

(assert (= (or b!1160333 b!1160352) bm!56158))

(assert (= (or b!1160336 bm!56158) bm!56157))

(assert (= (or b!1160336 bm!56156) bm!56155))

(assert (= (or b!1160336 bm!56154) bm!56152))

(assert (= (and b!1160348 c!115814) b!1160354))

(assert (= (and b!1160348 (not c!115814)) b!1160349))

(assert (= (and b!1160348 res!770057) b!1160343))

(assert (= (and b!1160331 res!770054) b!1160339))

(assert (= (and b!1160330 condMapEmpty!45449) mapIsEmpty!45449))

(assert (= (and b!1160330 (not condMapEmpty!45449)) mapNonEmpty!45449))

(get-info :version)

(assert (= (and mapNonEmpty!45449 ((_ is ValueCellFull!13832) mapValue!45449)) b!1160326))

(assert (= (and b!1160330 ((_ is ValueCellFull!13832) mapDefault!45449)) b!1160355))

(assert (= start!98942 b!1160330))

(declare-fun b_lambda!19641 () Bool)

(assert (=> (not b_lambda!19641) (not b!1160342)))

(declare-fun t!36934 () Bool)

(declare-fun tb!9357 () Bool)

(assert (=> (and start!98942 (= defaultEntry!1004 defaultEntry!1004) t!36934) tb!9357))

(declare-fun result!19287 () Bool)

(assert (=> tb!9357 (= result!19287 tp_is_empty!29083)))

(assert (=> b!1160342 t!36934))

(declare-fun b_and!39935 () Bool)

(assert (= b_and!39933 (and (=> t!36934 result!19287) b_and!39935)))

(declare-fun m!1068795 () Bool)

(assert (=> b!1160339 m!1068795))

(declare-fun m!1068797 () Bool)

(assert (=> b!1160346 m!1068797))

(declare-fun m!1068799 () Bool)

(assert (=> b!1160342 m!1068799))

(declare-fun m!1068801 () Bool)

(assert (=> b!1160342 m!1068801))

(declare-fun m!1068803 () Bool)

(assert (=> b!1160342 m!1068803))

(declare-fun m!1068805 () Bool)

(assert (=> b!1160342 m!1068805))

(declare-fun m!1068807 () Bool)

(assert (=> bm!56157 m!1068807))

(declare-fun m!1068809 () Bool)

(assert (=> b!1160341 m!1068809))

(declare-fun m!1068811 () Bool)

(assert (=> b!1160334 m!1068811))

(declare-fun m!1068813 () Bool)

(assert (=> b!1160334 m!1068813))

(declare-fun m!1068815 () Bool)

(assert (=> b!1160350 m!1068815))

(declare-fun m!1068817 () Bool)

(assert (=> b!1160332 m!1068817))

(declare-fun m!1068819 () Bool)

(assert (=> start!98942 m!1068819))

(declare-fun m!1068821 () Bool)

(assert (=> start!98942 m!1068821))

(declare-fun m!1068823 () Bool)

(assert (=> b!1160337 m!1068823))

(declare-fun m!1068825 () Bool)

(assert (=> b!1160335 m!1068825))

(declare-fun m!1068827 () Bool)

(assert (=> bm!56152 m!1068827))

(declare-fun m!1068829 () Bool)

(assert (=> b!1160331 m!1068829))

(declare-fun m!1068831 () Bool)

(assert (=> b!1160331 m!1068831))

(declare-fun m!1068833 () Bool)

(assert (=> b!1160331 m!1068833))

(declare-fun m!1068835 () Bool)

(assert (=> b!1160331 m!1068835))

(declare-fun m!1068837 () Bool)

(assert (=> b!1160331 m!1068837))

(declare-fun m!1068839 () Bool)

(assert (=> b!1160331 m!1068839))

(assert (=> b!1160331 m!1068837))

(declare-fun m!1068841 () Bool)

(assert (=> b!1160331 m!1068841))

(assert (=> b!1160331 m!1068833))

(declare-fun m!1068843 () Bool)

(assert (=> b!1160331 m!1068843))

(assert (=> b!1160331 m!1068831))

(assert (=> b!1160331 m!1068837))

(declare-fun m!1068845 () Bool)

(assert (=> b!1160331 m!1068845))

(assert (=> bm!56159 m!1068829))

(assert (=> b!1160347 m!1068837))

(declare-fun m!1068847 () Bool)

(assert (=> b!1160347 m!1068847))

(declare-fun m!1068849 () Bool)

(assert (=> b!1160354 m!1068849))

(declare-fun m!1068851 () Bool)

(assert (=> b!1160348 m!1068851))

(declare-fun m!1068853 () Bool)

(assert (=> b!1160348 m!1068853))

(declare-fun m!1068855 () Bool)

(assert (=> b!1160348 m!1068855))

(declare-fun m!1068857 () Bool)

(assert (=> b!1160348 m!1068857))

(declare-fun m!1068859 () Bool)

(assert (=> bm!56155 m!1068859))

(declare-fun m!1068861 () Bool)

(assert (=> b!1160336 m!1068861))

(declare-fun m!1068863 () Bool)

(assert (=> b!1160336 m!1068863))

(declare-fun m!1068865 () Bool)

(assert (=> b!1160336 m!1068865))

(declare-fun m!1068867 () Bool)

(assert (=> mapNonEmpty!45449 m!1068867))

(assert (=> bm!56153 m!1068795))

(declare-fun m!1068869 () Bool)

(assert (=> b!1160340 m!1068869))

(declare-fun m!1068871 () Bool)

(assert (=> b!1160338 m!1068871))

(declare-fun m!1068873 () Bool)

(assert (=> b!1160338 m!1068873))

(assert (=> b!1160343 m!1068849))

(check-sat (not b!1160347) (not b!1160336) (not b!1160340) (not b!1160346) (not b!1160342) (not b!1160331) b_and!39935 (not bm!56152) (not bm!56155) tp_is_empty!29083 (not b!1160339) (not bm!56157) (not b!1160348) (not b!1160343) (not b!1160354) (not b_next!24553) (not b!1160334) (not mapNonEmpty!45449) (not start!98942) (not b!1160332) (not b!1160350) (not bm!56159) (not b!1160338) (not b_lambda!19641) (not b!1160335) (not bm!56153) (not b!1160341))
(check-sat b_and!39935 (not b_next!24553))
