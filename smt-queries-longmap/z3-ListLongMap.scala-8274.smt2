; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100950 () Bool)

(assert start!100950)

(declare-fun b_free!25915 () Bool)

(declare-fun b_next!25915 () Bool)

(assert (=> start!100950 (= b_free!25915 (not b_next!25915))))

(declare-fun tp!90744 () Bool)

(declare-fun b_and!42801 () Bool)

(assert (=> start!100950 (= tp!90744 b_and!42801)))

(declare-fun b!1206055 () Bool)

(declare-fun e!684995 () Bool)

(declare-fun e!685006 () Bool)

(assert (=> b!1206055 (= e!684995 e!685006)))

(declare-fun res!801961 () Bool)

(assert (=> b!1206055 (=> res!801961 e!685006)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206055 (= res!801961 (not (= from!1455 i!673)))))

(declare-datatypes ((V!45953 0))(
  ( (V!45954 (val!15366 Int)) )
))
(declare-fun zeroValue!944 () V!45953)

(declare-datatypes ((ValueCell!14600 0))(
  ( (ValueCellFull!14600 (v!18005 V!45953)) (EmptyCell!14600) )
))
(declare-datatypes ((array!78051 0))(
  ( (array!78052 (arr!37661 (Array (_ BitVec 32) ValueCell!14600)) (size!38198 (_ BitVec 32))) )
))
(declare-fun lt!546863 () array!78051)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45953)

(declare-datatypes ((tuple2!19718 0))(
  ( (tuple2!19719 (_1!9870 (_ BitVec 64)) (_2!9870 V!45953)) )
))
(declare-datatypes ((List!26528 0))(
  ( (Nil!26525) (Cons!26524 (h!27742 tuple2!19718) (t!39415 List!26528)) )
))
(declare-datatypes ((ListLongMap!17695 0))(
  ( (ListLongMap!17696 (toList!8863 List!26528)) )
))
(declare-fun lt!546852 () ListLongMap!17695)

(declare-datatypes ((array!78053 0))(
  ( (array!78054 (arr!37662 (Array (_ BitVec 32) (_ BitVec 64))) (size!38199 (_ BitVec 32))) )
))
(declare-fun lt!546856 () array!78053)

(declare-fun getCurrentListMapNoExtraKeys!5328 (array!78053 array!78051 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 32) Int) ListLongMap!17695)

(assert (=> b!1206055 (= lt!546852 (getCurrentListMapNoExtraKeys!5328 lt!546856 lt!546863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78051)

(declare-fun dynLambda!3252 (Int (_ BitVec 64)) V!45953)

(assert (=> b!1206055 (= lt!546863 (array!78052 (store (arr!37661 _values!996) i!673 (ValueCellFull!14600 (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38198 _values!996)))))

(declare-fun _keys!1208 () array!78053)

(declare-fun lt!546861 () ListLongMap!17695)

(assert (=> b!1206055 (= lt!546861 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206056 () Bool)

(declare-fun res!801973 () Bool)

(declare-fun e!685007 () Bool)

(assert (=> b!1206056 (=> (not res!801973) (not e!685007))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206056 (= res!801973 (validKeyInArray!0 k0!934))))

(declare-fun b!1206057 () Bool)

(declare-fun e!685008 () Bool)

(assert (=> b!1206057 (= e!685008 (not e!684995))))

(declare-fun res!801965 () Bool)

(assert (=> b!1206057 (=> res!801965 e!684995)))

(assert (=> b!1206057 (= res!801965 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206057 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39904 0))(
  ( (Unit!39905) )
))
(declare-fun lt!546858 () Unit!39904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78053 (_ BitVec 64) (_ BitVec 32)) Unit!39904)

(assert (=> b!1206057 (= lt!546858 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!58355 () ListLongMap!17695)

(declare-fun lt!546853 () ListLongMap!17695)

(declare-fun bm!58351 () Bool)

(declare-fun call!58361 () Bool)

(declare-fun c!118552 () Bool)

(declare-fun contains!6942 (ListLongMap!17695 (_ BitVec 64)) Bool)

(assert (=> bm!58351 (= call!58361 (contains!6942 (ite c!118552 lt!546853 call!58355) k0!934))))

(declare-fun b!1206058 () Bool)

(declare-fun res!801966 () Bool)

(assert (=> b!1206058 (=> (not res!801966) (not e!685007))))

(assert (=> b!1206058 (= res!801966 (= (select (arr!37662 _keys!1208) i!673) k0!934))))

(declare-fun b!1206059 () Bool)

(declare-fun c!118551 () Bool)

(declare-fun lt!546865 () Bool)

(assert (=> b!1206059 (= c!118551 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546865))))

(declare-fun e!685003 () Unit!39904)

(declare-fun e!684996 () Unit!39904)

(assert (=> b!1206059 (= e!685003 e!684996)))

(declare-fun b!1206061 () Bool)

(declare-fun e!685000 () Bool)

(declare-fun call!58359 () ListLongMap!17695)

(declare-fun call!58360 () ListLongMap!17695)

(declare-fun -!1808 (ListLongMap!17695 (_ BitVec 64)) ListLongMap!17695)

(assert (=> b!1206061 (= e!685000 (= call!58360 (-!1808 call!58359 k0!934)))))

(declare-fun b!1206062 () Bool)

(declare-fun res!801964 () Bool)

(assert (=> b!1206062 (=> (not res!801964) (not e!685007))))

(assert (=> b!1206062 (= res!801964 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38199 _keys!1208))))))

(declare-fun b!1206063 () Bool)

(declare-fun e!685002 () Bool)

(declare-fun tp_is_empty!30619 () Bool)

(assert (=> b!1206063 (= e!685002 tp_is_empty!30619)))

(declare-fun bm!58352 () Bool)

(declare-fun call!58356 () ListLongMap!17695)

(assert (=> bm!58352 (= call!58355 call!58356)))

(declare-fun b!1206064 () Bool)

(declare-fun res!801963 () Bool)

(assert (=> b!1206064 (=> (not res!801963) (not e!685007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206064 (= res!801963 (validMask!0 mask!1564))))

(declare-fun b!1206065 () Bool)

(declare-fun Unit!39906 () Unit!39904)

(assert (=> b!1206065 (= e!684996 Unit!39906)))

(declare-fun bm!58353 () Bool)

(declare-fun call!58358 () Unit!39904)

(declare-fun call!58357 () Unit!39904)

(assert (=> bm!58353 (= call!58358 call!58357)))

(declare-fun bm!58354 () Bool)

(assert (=> bm!58354 (= call!58359 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58355 () Bool)

(assert (=> bm!58355 (= call!58360 (getCurrentListMapNoExtraKeys!5328 lt!546856 lt!546863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206066 () Bool)

(declare-fun res!801969 () Bool)

(assert (=> b!1206066 (=> (not res!801969) (not e!685008))))

(declare-datatypes ((List!26529 0))(
  ( (Nil!26526) (Cons!26525 (h!27743 (_ BitVec 64)) (t!39416 List!26529)) )
))
(declare-fun arrayNoDuplicates!0 (array!78053 (_ BitVec 32) List!26529) Bool)

(assert (=> b!1206066 (= res!801969 (arrayNoDuplicates!0 lt!546856 #b00000000000000000000000000000000 Nil!26526))))

(declare-fun mapIsEmpty!47781 () Bool)

(declare-fun mapRes!47781 () Bool)

(assert (=> mapIsEmpty!47781 mapRes!47781))

(declare-fun e!684997 () Bool)

(declare-fun b!1206067 () Bool)

(assert (=> b!1206067 (= e!684997 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546865) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206068 () Bool)

(declare-fun res!801972 () Bool)

(assert (=> b!1206068 (=> (not res!801972) (not e!685007))))

(assert (=> b!1206068 (= res!801972 (and (= (size!38198 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38199 _keys!1208) (size!38198 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!546857 () ListLongMap!17695)

(declare-fun c!118549 () Bool)

(declare-fun bm!58356 () Bool)

(declare-fun addStillContains!1013 (ListLongMap!17695 (_ BitVec 64) V!45953 (_ BitVec 64)) Unit!39904)

(assert (=> bm!58356 (= call!58357 (addStillContains!1013 (ite c!118552 lt!546853 lt!546857) (ite c!118552 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118549 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118552 minValue!944 (ite c!118549 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1206069 () Bool)

(declare-fun res!801971 () Bool)

(assert (=> b!1206069 (=> (not res!801971) (not e!685007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78053 (_ BitVec 32)) Bool)

(assert (=> b!1206069 (= res!801971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!58357 () Bool)

(declare-fun call!58354 () Bool)

(assert (=> bm!58357 (= call!58354 call!58361)))

(declare-fun b!1206070 () Bool)

(declare-fun e!685004 () Bool)

(declare-fun e!685009 () Bool)

(assert (=> b!1206070 (= e!685004 e!685009)))

(declare-fun res!801962 () Bool)

(assert (=> b!1206070 (=> res!801962 e!685009)))

(assert (=> b!1206070 (= res!801962 (not (contains!6942 lt!546857 k0!934)))))

(assert (=> b!1206070 (= lt!546857 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206071 () Bool)

(assert (=> b!1206071 (= e!685007 e!685008)))

(declare-fun res!801967 () Bool)

(assert (=> b!1206071 (=> (not res!801967) (not e!685008))))

(assert (=> b!1206071 (= res!801967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546856 mask!1564))))

(assert (=> b!1206071 (= lt!546856 (array!78054 (store (arr!37662 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38199 _keys!1208)))))

(declare-fun b!1206072 () Bool)

(declare-fun res!801974 () Bool)

(assert (=> b!1206072 (=> (not res!801974) (not e!685007))))

(assert (=> b!1206072 (= res!801974 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26526))))

(declare-fun mapNonEmpty!47781 () Bool)

(declare-fun tp!90745 () Bool)

(assert (=> mapNonEmpty!47781 (= mapRes!47781 (and tp!90745 e!685002))))

(declare-fun mapRest!47781 () (Array (_ BitVec 32) ValueCell!14600))

(declare-fun mapKey!47781 () (_ BitVec 32))

(declare-fun mapValue!47781 () ValueCell!14600)

(assert (=> mapNonEmpty!47781 (= (arr!37661 _values!996) (store mapRest!47781 mapKey!47781 mapValue!47781))))

(declare-fun b!1206073 () Bool)

(assert (=> b!1206073 call!58354))

(declare-fun lt!546859 () Unit!39904)

(assert (=> b!1206073 (= lt!546859 call!58358)))

(assert (=> b!1206073 (= e!685003 lt!546859)))

(declare-fun b!1206074 () Bool)

(declare-fun e!685001 () Bool)

(assert (=> b!1206074 (= e!685001 tp_is_empty!30619)))

(declare-fun b!1206075 () Bool)

(assert (=> b!1206075 (= e!684997 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206076 () Bool)

(declare-fun e!685005 () Bool)

(assert (=> b!1206076 (= e!685005 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206077 () Bool)

(assert (=> b!1206077 (= e!685000 (= call!58360 call!58359))))

(declare-fun res!801970 () Bool)

(assert (=> start!100950 (=> (not res!801970) (not e!685007))))

(assert (=> start!100950 (= res!801970 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38199 _keys!1208))))))

(assert (=> start!100950 e!685007))

(assert (=> start!100950 tp_is_empty!30619))

(declare-fun array_inv!28758 (array!78053) Bool)

(assert (=> start!100950 (array_inv!28758 _keys!1208)))

(assert (=> start!100950 true))

(assert (=> start!100950 tp!90744))

(declare-fun e!684998 () Bool)

(declare-fun array_inv!28759 (array!78051) Bool)

(assert (=> start!100950 (and (array_inv!28759 _values!996) e!684998)))

(declare-fun b!1206060 () Bool)

(declare-fun lt!546855 () Unit!39904)

(assert (=> b!1206060 (= e!684996 lt!546855)))

(assert (=> b!1206060 (= lt!546855 call!58358)))

(assert (=> b!1206060 call!58354))

(declare-fun b!1206078 () Bool)

(declare-fun e!684994 () Unit!39904)

(declare-fun lt!546851 () Unit!39904)

(assert (=> b!1206078 (= e!684994 lt!546851)))

(declare-fun lt!546860 () Unit!39904)

(assert (=> b!1206078 (= lt!546860 (addStillContains!1013 lt!546857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1206078 (= lt!546853 call!58356)))

(assert (=> b!1206078 call!58361))

(assert (=> b!1206078 (= lt!546851 call!58357)))

(declare-fun +!4029 (ListLongMap!17695 tuple2!19718) ListLongMap!17695)

(assert (=> b!1206078 (contains!6942 (+!4029 lt!546853 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!58358 () Bool)

(assert (=> bm!58358 (= call!58356 (+!4029 lt!546857 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1206079 () Bool)

(assert (=> b!1206079 (= e!685009 (bvslt (size!38199 _keys!1208) #b01111111111111111111111111111111))))

(assert (=> b!1206079 e!685005))

(declare-fun res!801960 () Bool)

(assert (=> b!1206079 (=> (not res!801960) (not e!685005))))

(assert (=> b!1206079 (= res!801960 e!684997)))

(declare-fun c!118550 () Bool)

(assert (=> b!1206079 (= c!118550 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546854 () Unit!39904)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!569 (array!78053 array!78051 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 64) (_ BitVec 32) Int) Unit!39904)

(assert (=> b!1206079 (= lt!546854 (lemmaListMapContainsThenArrayContainsFrom!569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546862 () Unit!39904)

(assert (=> b!1206079 (= lt!546862 e!684994)))

(assert (=> b!1206079 (= c!118552 (and (not lt!546865) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206079 (= lt!546865 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206080 () Bool)

(assert (=> b!1206080 (= e!685006 e!685004)))

(declare-fun res!801968 () Bool)

(assert (=> b!1206080 (=> res!801968 e!685004)))

(assert (=> b!1206080 (= res!801968 (not (= (select (arr!37662 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1206080 e!685000))

(declare-fun c!118553 () Bool)

(assert (=> b!1206080 (= c!118553 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546864 () Unit!39904)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1027 (array!78053 array!78051 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39904)

(assert (=> b!1206080 (= lt!546864 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1027 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206081 () Bool)

(assert (=> b!1206081 (= e!684998 (and e!685001 mapRes!47781))))

(declare-fun condMapEmpty!47781 () Bool)

(declare-fun mapDefault!47781 () ValueCell!14600)

(assert (=> b!1206081 (= condMapEmpty!47781 (= (arr!37661 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14600)) mapDefault!47781)))))

(declare-fun b!1206082 () Bool)

(assert (=> b!1206082 (= e!684994 e!685003)))

(assert (=> b!1206082 (= c!118549 (and (not lt!546865) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!100950 res!801970) b!1206064))

(assert (= (and b!1206064 res!801963) b!1206068))

(assert (= (and b!1206068 res!801972) b!1206069))

(assert (= (and b!1206069 res!801971) b!1206072))

(assert (= (and b!1206072 res!801974) b!1206062))

(assert (= (and b!1206062 res!801964) b!1206056))

(assert (= (and b!1206056 res!801973) b!1206058))

(assert (= (and b!1206058 res!801966) b!1206071))

(assert (= (and b!1206071 res!801967) b!1206066))

(assert (= (and b!1206066 res!801969) b!1206057))

(assert (= (and b!1206057 (not res!801965)) b!1206055))

(assert (= (and b!1206055 (not res!801961)) b!1206080))

(assert (= (and b!1206080 c!118553) b!1206061))

(assert (= (and b!1206080 (not c!118553)) b!1206077))

(assert (= (or b!1206061 b!1206077) bm!58355))

(assert (= (or b!1206061 b!1206077) bm!58354))

(assert (= (and b!1206080 (not res!801968)) b!1206070))

(assert (= (and b!1206070 (not res!801962)) b!1206079))

(assert (= (and b!1206079 c!118552) b!1206078))

(assert (= (and b!1206079 (not c!118552)) b!1206082))

(assert (= (and b!1206082 c!118549) b!1206073))

(assert (= (and b!1206082 (not c!118549)) b!1206059))

(assert (= (and b!1206059 c!118551) b!1206060))

(assert (= (and b!1206059 (not c!118551)) b!1206065))

(assert (= (or b!1206073 b!1206060) bm!58353))

(assert (= (or b!1206073 b!1206060) bm!58352))

(assert (= (or b!1206073 b!1206060) bm!58357))

(assert (= (or b!1206078 bm!58357) bm!58351))

(assert (= (or b!1206078 bm!58353) bm!58356))

(assert (= (or b!1206078 bm!58352) bm!58358))

(assert (= (and b!1206079 c!118550) b!1206075))

(assert (= (and b!1206079 (not c!118550)) b!1206067))

(assert (= (and b!1206079 res!801960) b!1206076))

(assert (= (and b!1206081 condMapEmpty!47781) mapIsEmpty!47781))

(assert (= (and b!1206081 (not condMapEmpty!47781)) mapNonEmpty!47781))

(get-info :version)

(assert (= (and mapNonEmpty!47781 ((_ is ValueCellFull!14600) mapValue!47781)) b!1206063))

(assert (= (and b!1206081 ((_ is ValueCellFull!14600) mapDefault!47781)) b!1206074))

(assert (= start!100950 b!1206081))

(declare-fun b_lambda!21275 () Bool)

(assert (=> (not b_lambda!21275) (not b!1206055)))

(declare-fun t!39414 () Bool)

(declare-fun tb!10707 () Bool)

(assert (=> (and start!100950 (= defaultEntry!1004 defaultEntry!1004) t!39414) tb!10707))

(declare-fun result!22005 () Bool)

(assert (=> tb!10707 (= result!22005 tp_is_empty!30619)))

(assert (=> b!1206055 t!39414))

(declare-fun b_and!42803 () Bool)

(assert (= b_and!42801 (and (=> t!39414 result!22005) b_and!42803)))

(declare-fun m!1112343 () Bool)

(assert (=> bm!58354 m!1112343))

(declare-fun m!1112345 () Bool)

(assert (=> b!1206072 m!1112345))

(declare-fun m!1112347 () Bool)

(assert (=> bm!58358 m!1112347))

(declare-fun m!1112349 () Bool)

(assert (=> mapNonEmpty!47781 m!1112349))

(declare-fun m!1112351 () Bool)

(assert (=> b!1206075 m!1112351))

(declare-fun m!1112353 () Bool)

(assert (=> b!1206058 m!1112353))

(declare-fun m!1112355 () Bool)

(assert (=> b!1206064 m!1112355))

(declare-fun m!1112357 () Bool)

(assert (=> b!1206066 m!1112357))

(declare-fun m!1112359 () Bool)

(assert (=> b!1206080 m!1112359))

(declare-fun m!1112361 () Bool)

(assert (=> b!1206080 m!1112361))

(declare-fun m!1112363 () Bool)

(assert (=> b!1206057 m!1112363))

(declare-fun m!1112365 () Bool)

(assert (=> b!1206057 m!1112365))

(declare-fun m!1112367 () Bool)

(assert (=> b!1206070 m!1112367))

(assert (=> b!1206070 m!1112343))

(assert (=> b!1206076 m!1112351))

(declare-fun m!1112369 () Bool)

(assert (=> b!1206069 m!1112369))

(declare-fun m!1112371 () Bool)

(assert (=> start!100950 m!1112371))

(declare-fun m!1112373 () Bool)

(assert (=> start!100950 m!1112373))

(declare-fun m!1112375 () Bool)

(assert (=> b!1206078 m!1112375))

(declare-fun m!1112377 () Bool)

(assert (=> b!1206078 m!1112377))

(assert (=> b!1206078 m!1112377))

(declare-fun m!1112379 () Bool)

(assert (=> b!1206078 m!1112379))

(declare-fun m!1112381 () Bool)

(assert (=> b!1206056 m!1112381))

(declare-fun m!1112383 () Bool)

(assert (=> b!1206079 m!1112383))

(declare-fun m!1112385 () Bool)

(assert (=> bm!58351 m!1112385))

(declare-fun m!1112387 () Bool)

(assert (=> b!1206055 m!1112387))

(declare-fun m!1112389 () Bool)

(assert (=> b!1206055 m!1112389))

(declare-fun m!1112391 () Bool)

(assert (=> b!1206055 m!1112391))

(declare-fun m!1112393 () Bool)

(assert (=> b!1206055 m!1112393))

(declare-fun m!1112395 () Bool)

(assert (=> b!1206071 m!1112395))

(declare-fun m!1112397 () Bool)

(assert (=> b!1206071 m!1112397))

(declare-fun m!1112399 () Bool)

(assert (=> bm!58356 m!1112399))

(declare-fun m!1112401 () Bool)

(assert (=> b!1206061 m!1112401))

(declare-fun m!1112403 () Bool)

(assert (=> bm!58355 m!1112403))

(check-sat (not bm!58355) (not b!1206080) (not b!1206075) (not b!1206072) (not b!1206069) (not bm!58356) (not b!1206064) b_and!42803 (not start!100950) (not b!1206057) (not b!1206061) (not b!1206076) (not b_next!25915) (not bm!58358) (not b!1206055) (not b!1206070) (not b!1206071) tp_is_empty!30619 (not b!1206079) (not b!1206066) (not bm!58354) (not b!1206056) (not b_lambda!21275) (not b!1206078) (not mapNonEmpty!47781) (not bm!58351))
(check-sat b_and!42803 (not b_next!25915))
(get-model)

(declare-fun b_lambda!21281 () Bool)

(assert (= b_lambda!21275 (or (and start!100950 b_free!25915) b_lambda!21281)))

(check-sat (not bm!58355) (not b!1206080) (not b!1206075) (not b!1206072) (not b!1206069) (not b!1206078) (not bm!58356) (not b!1206064) b_and!42803 (not start!100950) (not b!1206057) (not b!1206061) (not b!1206076) (not b_next!25915) (not bm!58358) (not b!1206070) (not b!1206071) tp_is_empty!30619 (not b!1206079) (not b!1206066) (not bm!58354) (not b!1206056) (not mapNonEmpty!47781) (not bm!58351) (not b_lambda!21281) (not b!1206055))
(check-sat b_and!42803 (not b_next!25915))
(get-model)

(declare-fun d!133277 () Bool)

(declare-fun res!802069 () Bool)

(declare-fun e!685110 () Bool)

(assert (=> d!133277 (=> res!802069 e!685110)))

(assert (=> d!133277 (= res!802069 (= (select (arr!37662 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133277 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!685110)))

(declare-fun b!1206261 () Bool)

(declare-fun e!685111 () Bool)

(assert (=> b!1206261 (= e!685110 e!685111)))

(declare-fun res!802070 () Bool)

(assert (=> b!1206261 (=> (not res!802070) (not e!685111))))

(assert (=> b!1206261 (= res!802070 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38199 _keys!1208)))))

(declare-fun b!1206262 () Bool)

(assert (=> b!1206262 (= e!685111 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133277 (not res!802069)) b!1206261))

(assert (= (and b!1206261 res!802070) b!1206262))

(declare-fun m!1112529 () Bool)

(assert (=> d!133277 m!1112529))

(declare-fun m!1112531 () Bool)

(assert (=> b!1206262 m!1112531))

(assert (=> b!1206076 d!133277))

(assert (=> b!1206075 d!133277))

(declare-fun d!133279 () Bool)

(declare-fun lt!546958 () ListLongMap!17695)

(assert (=> d!133279 (not (contains!6942 lt!546958 k0!934))))

(declare-fun removeStrictlySorted!95 (List!26528 (_ BitVec 64)) List!26528)

(assert (=> d!133279 (= lt!546958 (ListLongMap!17696 (removeStrictlySorted!95 (toList!8863 call!58359) k0!934)))))

(assert (=> d!133279 (= (-!1808 call!58359 k0!934) lt!546958)))

(declare-fun bs!34114 () Bool)

(assert (= bs!34114 d!133279))

(declare-fun m!1112533 () Bool)

(assert (=> bs!34114 m!1112533))

(declare-fun m!1112535 () Bool)

(assert (=> bs!34114 m!1112535))

(assert (=> b!1206061 d!133279))

(declare-fun d!133281 () Bool)

(assert (=> d!133281 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1206064 d!133281))

(declare-fun b!1206287 () Bool)

(declare-fun e!685132 () Bool)

(declare-fun lt!546979 () ListLongMap!17695)

(declare-fun isEmpty!989 (ListLongMap!17695) Bool)

(assert (=> b!1206287 (= e!685132 (isEmpty!989 lt!546979))))

(declare-fun b!1206288 () Bool)

(declare-fun lt!546978 () Unit!39904)

(declare-fun lt!546974 () Unit!39904)

(assert (=> b!1206288 (= lt!546978 lt!546974)))

(declare-fun lt!546975 () (_ BitVec 64))

(declare-fun lt!546976 () (_ BitVec 64))

(declare-fun lt!546973 () ListLongMap!17695)

(declare-fun lt!546977 () V!45953)

(assert (=> b!1206288 (not (contains!6942 (+!4029 lt!546973 (tuple2!19719 lt!546975 lt!546977)) lt!546976))))

(declare-fun addStillNotContains!293 (ListLongMap!17695 (_ BitVec 64) V!45953 (_ BitVec 64)) Unit!39904)

(assert (=> b!1206288 (= lt!546974 (addStillNotContains!293 lt!546973 lt!546975 lt!546977 lt!546976))))

(assert (=> b!1206288 (= lt!546976 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19245 (ValueCell!14600 V!45953) V!45953)

(assert (=> b!1206288 (= lt!546977 (get!19245 (select (arr!37661 lt!546863) from!1455) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206288 (= lt!546975 (select (arr!37662 lt!546856) from!1455))))

(declare-fun call!58412 () ListLongMap!17695)

(assert (=> b!1206288 (= lt!546973 call!58412)))

(declare-fun e!685126 () ListLongMap!17695)

(assert (=> b!1206288 (= e!685126 (+!4029 call!58412 (tuple2!19719 (select (arr!37662 lt!546856) from!1455) (get!19245 (select (arr!37661 lt!546863) from!1455) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1206289 () Bool)

(assert (=> b!1206289 (= e!685126 call!58412)))

(declare-fun b!1206290 () Bool)

(declare-fun e!685127 () Bool)

(assert (=> b!1206290 (= e!685127 (validKeyInArray!0 (select (arr!37662 lt!546856) from!1455)))))

(assert (=> b!1206290 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1206291 () Bool)

(declare-fun e!685130 () Bool)

(declare-fun e!685128 () Bool)

(assert (=> b!1206291 (= e!685130 e!685128)))

(declare-fun c!118592 () Bool)

(assert (=> b!1206291 (= c!118592 e!685127)))

(declare-fun res!802082 () Bool)

(assert (=> b!1206291 (=> (not res!802082) (not e!685127))))

(assert (=> b!1206291 (= res!802082 (bvslt from!1455 (size!38199 lt!546856)))))

(declare-fun b!1206292 () Bool)

(declare-fun e!685129 () ListLongMap!17695)

(assert (=> b!1206292 (= e!685129 e!685126)))

(declare-fun c!118595 () Bool)

(assert (=> b!1206292 (= c!118595 (validKeyInArray!0 (select (arr!37662 lt!546856) from!1455)))))

(declare-fun bm!58409 () Bool)

(assert (=> bm!58409 (= call!58412 (getCurrentListMapNoExtraKeys!5328 lt!546856 lt!546863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206294 () Bool)

(assert (=> b!1206294 (= e!685128 e!685132)))

(declare-fun c!118593 () Bool)

(assert (=> b!1206294 (= c!118593 (bvslt from!1455 (size!38199 lt!546856)))))

(declare-fun b!1206295 () Bool)

(assert (=> b!1206295 (= e!685129 (ListLongMap!17696 Nil!26525))))

(declare-fun b!1206296 () Bool)

(declare-fun e!685131 () Bool)

(assert (=> b!1206296 (= e!685128 e!685131)))

(assert (=> b!1206296 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38199 lt!546856)))))

(declare-fun res!802081 () Bool)

(assert (=> b!1206296 (= res!802081 (contains!6942 lt!546979 (select (arr!37662 lt!546856) from!1455)))))

(assert (=> b!1206296 (=> (not res!802081) (not e!685131))))

(declare-fun b!1206297 () Bool)

(assert (=> b!1206297 (= e!685132 (= lt!546979 (getCurrentListMapNoExtraKeys!5328 lt!546856 lt!546863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206298 () Bool)

(declare-fun res!802079 () Bool)

(assert (=> b!1206298 (=> (not res!802079) (not e!685130))))

(assert (=> b!1206298 (= res!802079 (not (contains!6942 lt!546979 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!133283 () Bool)

(assert (=> d!133283 e!685130))

(declare-fun res!802080 () Bool)

(assert (=> d!133283 (=> (not res!802080) (not e!685130))))

(assert (=> d!133283 (= res!802080 (not (contains!6942 lt!546979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133283 (= lt!546979 e!685129)))

(declare-fun c!118594 () Bool)

(assert (=> d!133283 (= c!118594 (bvsge from!1455 (size!38199 lt!546856)))))

(assert (=> d!133283 (validMask!0 mask!1564)))

(assert (=> d!133283 (= (getCurrentListMapNoExtraKeys!5328 lt!546856 lt!546863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546979)))

(declare-fun b!1206293 () Bool)

(assert (=> b!1206293 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38199 lt!546856)))))

(assert (=> b!1206293 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38198 lt!546863)))))

(declare-fun apply!972 (ListLongMap!17695 (_ BitVec 64)) V!45953)

(assert (=> b!1206293 (= e!685131 (= (apply!972 lt!546979 (select (arr!37662 lt!546856) from!1455)) (get!19245 (select (arr!37661 lt!546863) from!1455) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133283 c!118594) b!1206295))

(assert (= (and d!133283 (not c!118594)) b!1206292))

(assert (= (and b!1206292 c!118595) b!1206288))

(assert (= (and b!1206292 (not c!118595)) b!1206289))

(assert (= (or b!1206288 b!1206289) bm!58409))

(assert (= (and d!133283 res!802080) b!1206298))

(assert (= (and b!1206298 res!802079) b!1206291))

(assert (= (and b!1206291 res!802082) b!1206290))

(assert (= (and b!1206291 c!118592) b!1206296))

(assert (= (and b!1206291 (not c!118592)) b!1206294))

(assert (= (and b!1206296 res!802081) b!1206293))

(assert (= (and b!1206294 c!118593) b!1206297))

(assert (= (and b!1206294 (not c!118593)) b!1206287))

(declare-fun b_lambda!21283 () Bool)

(assert (=> (not b_lambda!21283) (not b!1206288)))

(assert (=> b!1206288 t!39414))

(declare-fun b_and!42813 () Bool)

(assert (= b_and!42803 (and (=> t!39414 result!22005) b_and!42813)))

(declare-fun b_lambda!21285 () Bool)

(assert (=> (not b_lambda!21285) (not b!1206293)))

(assert (=> b!1206293 t!39414))

(declare-fun b_and!42815 () Bool)

(assert (= b_and!42813 (and (=> t!39414 result!22005) b_and!42815)))

(declare-fun m!1112537 () Bool)

(assert (=> b!1206296 m!1112537))

(assert (=> b!1206296 m!1112537))

(declare-fun m!1112539 () Bool)

(assert (=> b!1206296 m!1112539))

(assert (=> b!1206290 m!1112537))

(assert (=> b!1206290 m!1112537))

(declare-fun m!1112541 () Bool)

(assert (=> b!1206290 m!1112541))

(assert (=> b!1206292 m!1112537))

(assert (=> b!1206292 m!1112537))

(assert (=> b!1206292 m!1112541))

(declare-fun m!1112543 () Bool)

(assert (=> b!1206298 m!1112543))

(declare-fun m!1112545 () Bool)

(assert (=> b!1206287 m!1112545))

(declare-fun m!1112547 () Bool)

(assert (=> b!1206293 m!1112547))

(assert (=> b!1206293 m!1112537))

(assert (=> b!1206293 m!1112537))

(declare-fun m!1112549 () Bool)

(assert (=> b!1206293 m!1112549))

(assert (=> b!1206293 m!1112547))

(assert (=> b!1206293 m!1112389))

(declare-fun m!1112551 () Bool)

(assert (=> b!1206293 m!1112551))

(assert (=> b!1206293 m!1112389))

(declare-fun m!1112553 () Bool)

(assert (=> d!133283 m!1112553))

(assert (=> d!133283 m!1112355))

(declare-fun m!1112555 () Bool)

(assert (=> b!1206288 m!1112555))

(assert (=> b!1206288 m!1112547))

(declare-fun m!1112557 () Bool)

(assert (=> b!1206288 m!1112557))

(assert (=> b!1206288 m!1112537))

(declare-fun m!1112559 () Bool)

(assert (=> b!1206288 m!1112559))

(assert (=> b!1206288 m!1112559))

(declare-fun m!1112561 () Bool)

(assert (=> b!1206288 m!1112561))

(assert (=> b!1206288 m!1112547))

(assert (=> b!1206288 m!1112389))

(assert (=> b!1206288 m!1112551))

(assert (=> b!1206288 m!1112389))

(declare-fun m!1112563 () Bool)

(assert (=> bm!58409 m!1112563))

(assert (=> b!1206297 m!1112563))

(assert (=> b!1206055 d!133283))

(declare-fun b!1206299 () Bool)

(declare-fun e!685139 () Bool)

(declare-fun lt!546986 () ListLongMap!17695)

(assert (=> b!1206299 (= e!685139 (isEmpty!989 lt!546986))))

(declare-fun b!1206300 () Bool)

(declare-fun lt!546985 () Unit!39904)

(declare-fun lt!546981 () Unit!39904)

(assert (=> b!1206300 (= lt!546985 lt!546981)))

(declare-fun lt!546980 () ListLongMap!17695)

(declare-fun lt!546982 () (_ BitVec 64))

(declare-fun lt!546983 () (_ BitVec 64))

(declare-fun lt!546984 () V!45953)

(assert (=> b!1206300 (not (contains!6942 (+!4029 lt!546980 (tuple2!19719 lt!546982 lt!546984)) lt!546983))))

(assert (=> b!1206300 (= lt!546981 (addStillNotContains!293 lt!546980 lt!546982 lt!546984 lt!546983))))

(assert (=> b!1206300 (= lt!546983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206300 (= lt!546984 (get!19245 (select (arr!37661 _values!996) from!1455) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206300 (= lt!546982 (select (arr!37662 _keys!1208) from!1455))))

(declare-fun call!58413 () ListLongMap!17695)

(assert (=> b!1206300 (= lt!546980 call!58413)))

(declare-fun e!685133 () ListLongMap!17695)

(assert (=> b!1206300 (= e!685133 (+!4029 call!58413 (tuple2!19719 (select (arr!37662 _keys!1208) from!1455) (get!19245 (select (arr!37661 _values!996) from!1455) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1206301 () Bool)

(assert (=> b!1206301 (= e!685133 call!58413)))

(declare-fun b!1206302 () Bool)

(declare-fun e!685134 () Bool)

(assert (=> b!1206302 (= e!685134 (validKeyInArray!0 (select (arr!37662 _keys!1208) from!1455)))))

(assert (=> b!1206302 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1206303 () Bool)

(declare-fun e!685137 () Bool)

(declare-fun e!685135 () Bool)

(assert (=> b!1206303 (= e!685137 e!685135)))

(declare-fun c!118596 () Bool)

(assert (=> b!1206303 (= c!118596 e!685134)))

(declare-fun res!802086 () Bool)

(assert (=> b!1206303 (=> (not res!802086) (not e!685134))))

(assert (=> b!1206303 (= res!802086 (bvslt from!1455 (size!38199 _keys!1208)))))

(declare-fun b!1206304 () Bool)

(declare-fun e!685136 () ListLongMap!17695)

(assert (=> b!1206304 (= e!685136 e!685133)))

(declare-fun c!118599 () Bool)

(assert (=> b!1206304 (= c!118599 (validKeyInArray!0 (select (arr!37662 _keys!1208) from!1455)))))

(declare-fun bm!58410 () Bool)

(assert (=> bm!58410 (= call!58413 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206306 () Bool)

(assert (=> b!1206306 (= e!685135 e!685139)))

(declare-fun c!118597 () Bool)

(assert (=> b!1206306 (= c!118597 (bvslt from!1455 (size!38199 _keys!1208)))))

(declare-fun b!1206307 () Bool)

(assert (=> b!1206307 (= e!685136 (ListLongMap!17696 Nil!26525))))

(declare-fun b!1206308 () Bool)

(declare-fun e!685138 () Bool)

(assert (=> b!1206308 (= e!685135 e!685138)))

(assert (=> b!1206308 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38199 _keys!1208)))))

(declare-fun res!802085 () Bool)

(assert (=> b!1206308 (= res!802085 (contains!6942 lt!546986 (select (arr!37662 _keys!1208) from!1455)))))

(assert (=> b!1206308 (=> (not res!802085) (not e!685138))))

(declare-fun b!1206309 () Bool)

(assert (=> b!1206309 (= e!685139 (= lt!546986 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206310 () Bool)

(declare-fun res!802083 () Bool)

(assert (=> b!1206310 (=> (not res!802083) (not e!685137))))

(assert (=> b!1206310 (= res!802083 (not (contains!6942 lt!546986 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!133285 () Bool)

(assert (=> d!133285 e!685137))

(declare-fun res!802084 () Bool)

(assert (=> d!133285 (=> (not res!802084) (not e!685137))))

(assert (=> d!133285 (= res!802084 (not (contains!6942 lt!546986 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133285 (= lt!546986 e!685136)))

(declare-fun c!118598 () Bool)

(assert (=> d!133285 (= c!118598 (bvsge from!1455 (size!38199 _keys!1208)))))

(assert (=> d!133285 (validMask!0 mask!1564)))

(assert (=> d!133285 (= (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!546986)))

(declare-fun b!1206305 () Bool)

(assert (=> b!1206305 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38199 _keys!1208)))))

(assert (=> b!1206305 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38198 _values!996)))))

(assert (=> b!1206305 (= e!685138 (= (apply!972 lt!546986 (select (arr!37662 _keys!1208) from!1455)) (get!19245 (select (arr!37661 _values!996) from!1455) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133285 c!118598) b!1206307))

(assert (= (and d!133285 (not c!118598)) b!1206304))

(assert (= (and b!1206304 c!118599) b!1206300))

(assert (= (and b!1206304 (not c!118599)) b!1206301))

(assert (= (or b!1206300 b!1206301) bm!58410))

(assert (= (and d!133285 res!802084) b!1206310))

(assert (= (and b!1206310 res!802083) b!1206303))

(assert (= (and b!1206303 res!802086) b!1206302))

(assert (= (and b!1206303 c!118596) b!1206308))

(assert (= (and b!1206303 (not c!118596)) b!1206306))

(assert (= (and b!1206308 res!802085) b!1206305))

(assert (= (and b!1206306 c!118597) b!1206309))

(assert (= (and b!1206306 (not c!118597)) b!1206299))

(declare-fun b_lambda!21287 () Bool)

(assert (=> (not b_lambda!21287) (not b!1206300)))

(assert (=> b!1206300 t!39414))

(declare-fun b_and!42817 () Bool)

(assert (= b_and!42815 (and (=> t!39414 result!22005) b_and!42817)))

(declare-fun b_lambda!21289 () Bool)

(assert (=> (not b_lambda!21289) (not b!1206305)))

(assert (=> b!1206305 t!39414))

(declare-fun b_and!42819 () Bool)

(assert (= b_and!42817 (and (=> t!39414 result!22005) b_and!42819)))

(assert (=> b!1206308 m!1112359))

(assert (=> b!1206308 m!1112359))

(declare-fun m!1112565 () Bool)

(assert (=> b!1206308 m!1112565))

(assert (=> b!1206302 m!1112359))

(assert (=> b!1206302 m!1112359))

(declare-fun m!1112567 () Bool)

(assert (=> b!1206302 m!1112567))

(assert (=> b!1206304 m!1112359))

(assert (=> b!1206304 m!1112359))

(assert (=> b!1206304 m!1112567))

(declare-fun m!1112569 () Bool)

(assert (=> b!1206310 m!1112569))

(declare-fun m!1112571 () Bool)

(assert (=> b!1206299 m!1112571))

(declare-fun m!1112573 () Bool)

(assert (=> b!1206305 m!1112573))

(assert (=> b!1206305 m!1112359))

(assert (=> b!1206305 m!1112359))

(declare-fun m!1112575 () Bool)

(assert (=> b!1206305 m!1112575))

(assert (=> b!1206305 m!1112573))

(assert (=> b!1206305 m!1112389))

(declare-fun m!1112577 () Bool)

(assert (=> b!1206305 m!1112577))

(assert (=> b!1206305 m!1112389))

(declare-fun m!1112579 () Bool)

(assert (=> d!133285 m!1112579))

(assert (=> d!133285 m!1112355))

(declare-fun m!1112581 () Bool)

(assert (=> b!1206300 m!1112581))

(assert (=> b!1206300 m!1112573))

(declare-fun m!1112583 () Bool)

(assert (=> b!1206300 m!1112583))

(assert (=> b!1206300 m!1112359))

(declare-fun m!1112585 () Bool)

(assert (=> b!1206300 m!1112585))

(assert (=> b!1206300 m!1112585))

(declare-fun m!1112587 () Bool)

(assert (=> b!1206300 m!1112587))

(assert (=> b!1206300 m!1112573))

(assert (=> b!1206300 m!1112389))

(assert (=> b!1206300 m!1112577))

(assert (=> b!1206300 m!1112389))

(declare-fun m!1112589 () Bool)

(assert (=> bm!58410 m!1112589))

(assert (=> b!1206309 m!1112589))

(assert (=> b!1206055 d!133285))

(declare-fun d!133287 () Bool)

(assert (=> d!133287 (contains!6942 (+!4029 lt!546857 (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!546989 () Unit!39904)

(declare-fun choose!1800 (ListLongMap!17695 (_ BitVec 64) V!45953 (_ BitVec 64)) Unit!39904)

(assert (=> d!133287 (= lt!546989 (choose!1800 lt!546857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133287 (contains!6942 lt!546857 k0!934)))

(assert (=> d!133287 (= (addStillContains!1013 lt!546857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!546989)))

(declare-fun bs!34115 () Bool)

(assert (= bs!34115 d!133287))

(declare-fun m!1112591 () Bool)

(assert (=> bs!34115 m!1112591))

(assert (=> bs!34115 m!1112591))

(declare-fun m!1112593 () Bool)

(assert (=> bs!34115 m!1112593))

(declare-fun m!1112595 () Bool)

(assert (=> bs!34115 m!1112595))

(assert (=> bs!34115 m!1112367))

(assert (=> b!1206078 d!133287))

(declare-fun d!133289 () Bool)

(declare-fun e!685144 () Bool)

(assert (=> d!133289 e!685144))

(declare-fun res!802089 () Bool)

(assert (=> d!133289 (=> res!802089 e!685144)))

(declare-fun lt!547000 () Bool)

(assert (=> d!133289 (= res!802089 (not lt!547000))))

(declare-fun lt!547001 () Bool)

(assert (=> d!133289 (= lt!547000 lt!547001)))

(declare-fun lt!546999 () Unit!39904)

(declare-fun e!685145 () Unit!39904)

(assert (=> d!133289 (= lt!546999 e!685145)))

(declare-fun c!118602 () Bool)

(assert (=> d!133289 (= c!118602 lt!547001)))

(declare-fun containsKey!592 (List!26528 (_ BitVec 64)) Bool)

(assert (=> d!133289 (= lt!547001 (containsKey!592 (toList!8863 (+!4029 lt!546853 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!133289 (= (contains!6942 (+!4029 lt!546853 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!547000)))

(declare-fun b!1206318 () Bool)

(declare-fun lt!546998 () Unit!39904)

(assert (=> b!1206318 (= e!685145 lt!546998)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!420 (List!26528 (_ BitVec 64)) Unit!39904)

(assert (=> b!1206318 (= lt!546998 (lemmaContainsKeyImpliesGetValueByKeyDefined!420 (toList!8863 (+!4029 lt!546853 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-datatypes ((Option!681 0))(
  ( (Some!680 (v!18008 V!45953)) (None!679) )
))
(declare-fun isDefined!458 (Option!681) Bool)

(declare-fun getValueByKey!630 (List!26528 (_ BitVec 64)) Option!681)

(assert (=> b!1206318 (isDefined!458 (getValueByKey!630 (toList!8863 (+!4029 lt!546853 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1206319 () Bool)

(declare-fun Unit!39911 () Unit!39904)

(assert (=> b!1206319 (= e!685145 Unit!39911)))

(declare-fun b!1206320 () Bool)

(assert (=> b!1206320 (= e!685144 (isDefined!458 (getValueByKey!630 (toList!8863 (+!4029 lt!546853 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!133289 c!118602) b!1206318))

(assert (= (and d!133289 (not c!118602)) b!1206319))

(assert (= (and d!133289 (not res!802089)) b!1206320))

(declare-fun m!1112597 () Bool)

(assert (=> d!133289 m!1112597))

(declare-fun m!1112599 () Bool)

(assert (=> b!1206318 m!1112599))

(declare-fun m!1112601 () Bool)

(assert (=> b!1206318 m!1112601))

(assert (=> b!1206318 m!1112601))

(declare-fun m!1112603 () Bool)

(assert (=> b!1206318 m!1112603))

(assert (=> b!1206320 m!1112601))

(assert (=> b!1206320 m!1112601))

(assert (=> b!1206320 m!1112603))

(assert (=> b!1206078 d!133289))

(declare-fun d!133291 () Bool)

(declare-fun e!685148 () Bool)

(assert (=> d!133291 e!685148))

(declare-fun res!802095 () Bool)

(assert (=> d!133291 (=> (not res!802095) (not e!685148))))

(declare-fun lt!547012 () ListLongMap!17695)

(assert (=> d!133291 (= res!802095 (contains!6942 lt!547012 (_1!9870 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!547010 () List!26528)

(assert (=> d!133291 (= lt!547012 (ListLongMap!17696 lt!547010))))

(declare-fun lt!547013 () Unit!39904)

(declare-fun lt!547011 () Unit!39904)

(assert (=> d!133291 (= lt!547013 lt!547011)))

(assert (=> d!133291 (= (getValueByKey!630 lt!547010 (_1!9870 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!680 (_2!9870 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!312 (List!26528 (_ BitVec 64) V!45953) Unit!39904)

(assert (=> d!133291 (= lt!547011 (lemmaContainsTupThenGetReturnValue!312 lt!547010 (_1!9870 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9870 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!405 (List!26528 (_ BitVec 64) V!45953) List!26528)

(assert (=> d!133291 (= lt!547010 (insertStrictlySorted!405 (toList!8863 lt!546853) (_1!9870 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9870 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133291 (= (+!4029 lt!546853 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!547012)))

(declare-fun b!1206325 () Bool)

(declare-fun res!802094 () Bool)

(assert (=> b!1206325 (=> (not res!802094) (not e!685148))))

(assert (=> b!1206325 (= res!802094 (= (getValueByKey!630 (toList!8863 lt!547012) (_1!9870 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!680 (_2!9870 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1206326 () Bool)

(declare-fun contains!6944 (List!26528 tuple2!19718) Bool)

(assert (=> b!1206326 (= e!685148 (contains!6944 (toList!8863 lt!547012) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133291 res!802095) b!1206325))

(assert (= (and b!1206325 res!802094) b!1206326))

(declare-fun m!1112605 () Bool)

(assert (=> d!133291 m!1112605))

(declare-fun m!1112607 () Bool)

(assert (=> d!133291 m!1112607))

(declare-fun m!1112609 () Bool)

(assert (=> d!133291 m!1112609))

(declare-fun m!1112611 () Bool)

(assert (=> d!133291 m!1112611))

(declare-fun m!1112613 () Bool)

(assert (=> b!1206325 m!1112613))

(declare-fun m!1112615 () Bool)

(assert (=> b!1206326 m!1112615))

(assert (=> b!1206078 d!133291))

(declare-fun b!1206335 () Bool)

(declare-fun e!685156 () Bool)

(declare-fun e!685157 () Bool)

(assert (=> b!1206335 (= e!685156 e!685157)))

(declare-fun lt!547020 () (_ BitVec 64))

(assert (=> b!1206335 (= lt!547020 (select (arr!37662 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!547021 () Unit!39904)

(assert (=> b!1206335 (= lt!547021 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!547020 #b00000000000000000000000000000000))))

(assert (=> b!1206335 (arrayContainsKey!0 _keys!1208 lt!547020 #b00000000000000000000000000000000)))

(declare-fun lt!547022 () Unit!39904)

(assert (=> b!1206335 (= lt!547022 lt!547021)))

(declare-fun res!802100 () Bool)

(declare-datatypes ((SeekEntryResult!9892 0))(
  ( (MissingZero!9892 (index!41939 (_ BitVec 32))) (Found!9892 (index!41940 (_ BitVec 32))) (Intermediate!9892 (undefined!10704 Bool) (index!41941 (_ BitVec 32)) (x!106422 (_ BitVec 32))) (Undefined!9892) (MissingVacant!9892 (index!41942 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78053 (_ BitVec 32)) SeekEntryResult!9892)

(assert (=> b!1206335 (= res!802100 (= (seekEntryOrOpen!0 (select (arr!37662 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9892 #b00000000000000000000000000000000)))))

(assert (=> b!1206335 (=> (not res!802100) (not e!685157))))

(declare-fun b!1206336 () Bool)

(declare-fun e!685155 () Bool)

(assert (=> b!1206336 (= e!685155 e!685156)))

(declare-fun c!118605 () Bool)

(assert (=> b!1206336 (= c!118605 (validKeyInArray!0 (select (arr!37662 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133293 () Bool)

(declare-fun res!802101 () Bool)

(assert (=> d!133293 (=> res!802101 e!685155)))

(assert (=> d!133293 (= res!802101 (bvsge #b00000000000000000000000000000000 (size!38199 _keys!1208)))))

(assert (=> d!133293 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!685155)))

(declare-fun b!1206337 () Bool)

(declare-fun call!58416 () Bool)

(assert (=> b!1206337 (= e!685157 call!58416)))

(declare-fun bm!58413 () Bool)

(assert (=> bm!58413 (= call!58416 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1206338 () Bool)

(assert (=> b!1206338 (= e!685156 call!58416)))

(assert (= (and d!133293 (not res!802101)) b!1206336))

(assert (= (and b!1206336 c!118605) b!1206335))

(assert (= (and b!1206336 (not c!118605)) b!1206338))

(assert (= (and b!1206335 res!802100) b!1206337))

(assert (= (or b!1206337 b!1206338) bm!58413))

(declare-fun m!1112617 () Bool)

(assert (=> b!1206335 m!1112617))

(declare-fun m!1112619 () Bool)

(assert (=> b!1206335 m!1112619))

(declare-fun m!1112621 () Bool)

(assert (=> b!1206335 m!1112621))

(assert (=> b!1206335 m!1112617))

(declare-fun m!1112623 () Bool)

(assert (=> b!1206335 m!1112623))

(assert (=> b!1206336 m!1112617))

(assert (=> b!1206336 m!1112617))

(declare-fun m!1112625 () Bool)

(assert (=> b!1206336 m!1112625))

(declare-fun m!1112627 () Bool)

(assert (=> bm!58413 m!1112627))

(assert (=> b!1206069 d!133293))

(declare-fun d!133295 () Bool)

(assert (=> d!133295 (= (array_inv!28758 _keys!1208) (bvsge (size!38199 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100950 d!133295))

(declare-fun d!133297 () Bool)

(assert (=> d!133297 (= (array_inv!28759 _values!996) (bvsge (size!38198 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100950 d!133297))

(declare-fun d!133299 () Bool)

(assert (=> d!133299 (contains!6942 (+!4029 (ite c!118552 lt!546853 lt!546857) (tuple2!19719 (ite c!118552 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118549 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118552 minValue!944 (ite c!118549 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!547023 () Unit!39904)

(assert (=> d!133299 (= lt!547023 (choose!1800 (ite c!118552 lt!546853 lt!546857) (ite c!118552 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118549 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118552 minValue!944 (ite c!118549 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133299 (contains!6942 (ite c!118552 lt!546853 lt!546857) k0!934)))

(assert (=> d!133299 (= (addStillContains!1013 (ite c!118552 lt!546853 lt!546857) (ite c!118552 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118549 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118552 minValue!944 (ite c!118549 zeroValue!944 minValue!944)) k0!934) lt!547023)))

(declare-fun bs!34116 () Bool)

(assert (= bs!34116 d!133299))

(declare-fun m!1112629 () Bool)

(assert (=> bs!34116 m!1112629))

(assert (=> bs!34116 m!1112629))

(declare-fun m!1112631 () Bool)

(assert (=> bs!34116 m!1112631))

(declare-fun m!1112633 () Bool)

(assert (=> bs!34116 m!1112633))

(declare-fun m!1112635 () Bool)

(assert (=> bs!34116 m!1112635))

(assert (=> bm!58356 d!133299))

(declare-fun b!1206339 () Bool)

(declare-fun e!685164 () Bool)

(declare-fun lt!547030 () ListLongMap!17695)

(assert (=> b!1206339 (= e!685164 (isEmpty!989 lt!547030))))

(declare-fun b!1206340 () Bool)

(declare-fun lt!547029 () Unit!39904)

(declare-fun lt!547025 () Unit!39904)

(assert (=> b!1206340 (= lt!547029 lt!547025)))

(declare-fun lt!547028 () V!45953)

(declare-fun lt!547026 () (_ BitVec 64))

(declare-fun lt!547024 () ListLongMap!17695)

(declare-fun lt!547027 () (_ BitVec 64))

(assert (=> b!1206340 (not (contains!6942 (+!4029 lt!547024 (tuple2!19719 lt!547026 lt!547028)) lt!547027))))

(assert (=> b!1206340 (= lt!547025 (addStillNotContains!293 lt!547024 lt!547026 lt!547028 lt!547027))))

(assert (=> b!1206340 (= lt!547027 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206340 (= lt!547028 (get!19245 (select (arr!37661 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206340 (= lt!547026 (select (arr!37662 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58417 () ListLongMap!17695)

(assert (=> b!1206340 (= lt!547024 call!58417)))

(declare-fun e!685158 () ListLongMap!17695)

(assert (=> b!1206340 (= e!685158 (+!4029 call!58417 (tuple2!19719 (select (arr!37662 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19245 (select (arr!37661 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1206341 () Bool)

(assert (=> b!1206341 (= e!685158 call!58417)))

(declare-fun b!1206342 () Bool)

(declare-fun e!685159 () Bool)

(assert (=> b!1206342 (= e!685159 (validKeyInArray!0 (select (arr!37662 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206342 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1206343 () Bool)

(declare-fun e!685162 () Bool)

(declare-fun e!685160 () Bool)

(assert (=> b!1206343 (= e!685162 e!685160)))

(declare-fun c!118606 () Bool)

(assert (=> b!1206343 (= c!118606 e!685159)))

(declare-fun res!802105 () Bool)

(assert (=> b!1206343 (=> (not res!802105) (not e!685159))))

(assert (=> b!1206343 (= res!802105 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 _keys!1208)))))

(declare-fun b!1206344 () Bool)

(declare-fun e!685161 () ListLongMap!17695)

(assert (=> b!1206344 (= e!685161 e!685158)))

(declare-fun c!118609 () Bool)

(assert (=> b!1206344 (= c!118609 (validKeyInArray!0 (select (arr!37662 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun bm!58414 () Bool)

(assert (=> bm!58414 (= call!58417 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206346 () Bool)

(assert (=> b!1206346 (= e!685160 e!685164)))

(declare-fun c!118607 () Bool)

(assert (=> b!1206346 (= c!118607 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 _keys!1208)))))

(declare-fun b!1206347 () Bool)

(assert (=> b!1206347 (= e!685161 (ListLongMap!17696 Nil!26525))))

(declare-fun b!1206348 () Bool)

(declare-fun e!685163 () Bool)

(assert (=> b!1206348 (= e!685160 e!685163)))

(assert (=> b!1206348 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 _keys!1208)))))

(declare-fun res!802104 () Bool)

(assert (=> b!1206348 (= res!802104 (contains!6942 lt!547030 (select (arr!37662 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206348 (=> (not res!802104) (not e!685163))))

(declare-fun b!1206349 () Bool)

(assert (=> b!1206349 (= e!685164 (= lt!547030 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206350 () Bool)

(declare-fun res!802102 () Bool)

(assert (=> b!1206350 (=> (not res!802102) (not e!685162))))

(assert (=> b!1206350 (= res!802102 (not (contains!6942 lt!547030 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!133301 () Bool)

(assert (=> d!133301 e!685162))

(declare-fun res!802103 () Bool)

(assert (=> d!133301 (=> (not res!802103) (not e!685162))))

(assert (=> d!133301 (= res!802103 (not (contains!6942 lt!547030 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133301 (= lt!547030 e!685161)))

(declare-fun c!118608 () Bool)

(assert (=> d!133301 (= c!118608 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 _keys!1208)))))

(assert (=> d!133301 (validMask!0 mask!1564)))

(assert (=> d!133301 (= (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547030)))

(declare-fun b!1206345 () Bool)

(assert (=> b!1206345 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 _keys!1208)))))

(assert (=> b!1206345 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38198 _values!996)))))

(assert (=> b!1206345 (= e!685163 (= (apply!972 lt!547030 (select (arr!37662 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19245 (select (arr!37661 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133301 c!118608) b!1206347))

(assert (= (and d!133301 (not c!118608)) b!1206344))

(assert (= (and b!1206344 c!118609) b!1206340))

(assert (= (and b!1206344 (not c!118609)) b!1206341))

(assert (= (or b!1206340 b!1206341) bm!58414))

(assert (= (and d!133301 res!802103) b!1206350))

(assert (= (and b!1206350 res!802102) b!1206343))

(assert (= (and b!1206343 res!802105) b!1206342))

(assert (= (and b!1206343 c!118606) b!1206348))

(assert (= (and b!1206343 (not c!118606)) b!1206346))

(assert (= (and b!1206348 res!802104) b!1206345))

(assert (= (and b!1206346 c!118607) b!1206349))

(assert (= (and b!1206346 (not c!118607)) b!1206339))

(declare-fun b_lambda!21291 () Bool)

(assert (=> (not b_lambda!21291) (not b!1206340)))

(assert (=> b!1206340 t!39414))

(declare-fun b_and!42821 () Bool)

(assert (= b_and!42819 (and (=> t!39414 result!22005) b_and!42821)))

(declare-fun b_lambda!21293 () Bool)

(assert (=> (not b_lambda!21293) (not b!1206345)))

(assert (=> b!1206345 t!39414))

(declare-fun b_and!42823 () Bool)

(assert (= b_and!42821 (and (=> t!39414 result!22005) b_and!42823)))

(assert (=> b!1206348 m!1112529))

(assert (=> b!1206348 m!1112529))

(declare-fun m!1112637 () Bool)

(assert (=> b!1206348 m!1112637))

(assert (=> b!1206342 m!1112529))

(assert (=> b!1206342 m!1112529))

(declare-fun m!1112639 () Bool)

(assert (=> b!1206342 m!1112639))

(assert (=> b!1206344 m!1112529))

(assert (=> b!1206344 m!1112529))

(assert (=> b!1206344 m!1112639))

(declare-fun m!1112641 () Bool)

(assert (=> b!1206350 m!1112641))

(declare-fun m!1112643 () Bool)

(assert (=> b!1206339 m!1112643))

(declare-fun m!1112645 () Bool)

(assert (=> b!1206345 m!1112645))

(assert (=> b!1206345 m!1112529))

(assert (=> b!1206345 m!1112529))

(declare-fun m!1112647 () Bool)

(assert (=> b!1206345 m!1112647))

(assert (=> b!1206345 m!1112645))

(assert (=> b!1206345 m!1112389))

(declare-fun m!1112649 () Bool)

(assert (=> b!1206345 m!1112649))

(assert (=> b!1206345 m!1112389))

(declare-fun m!1112651 () Bool)

(assert (=> d!133301 m!1112651))

(assert (=> d!133301 m!1112355))

(declare-fun m!1112653 () Bool)

(assert (=> b!1206340 m!1112653))

(assert (=> b!1206340 m!1112645))

(declare-fun m!1112655 () Bool)

(assert (=> b!1206340 m!1112655))

(assert (=> b!1206340 m!1112529))

(declare-fun m!1112657 () Bool)

(assert (=> b!1206340 m!1112657))

(assert (=> b!1206340 m!1112657))

(declare-fun m!1112659 () Bool)

(assert (=> b!1206340 m!1112659))

(assert (=> b!1206340 m!1112645))

(assert (=> b!1206340 m!1112389))

(assert (=> b!1206340 m!1112649))

(assert (=> b!1206340 m!1112389))

(declare-fun m!1112661 () Bool)

(assert (=> bm!58414 m!1112661))

(assert (=> b!1206349 m!1112661))

(assert (=> bm!58354 d!133301))

(declare-fun d!133303 () Bool)

(declare-fun e!685165 () Bool)

(assert (=> d!133303 e!685165))

(declare-fun res!802106 () Bool)

(assert (=> d!133303 (=> res!802106 e!685165)))

(declare-fun lt!547033 () Bool)

(assert (=> d!133303 (= res!802106 (not lt!547033))))

(declare-fun lt!547034 () Bool)

(assert (=> d!133303 (= lt!547033 lt!547034)))

(declare-fun lt!547032 () Unit!39904)

(declare-fun e!685166 () Unit!39904)

(assert (=> d!133303 (= lt!547032 e!685166)))

(declare-fun c!118610 () Bool)

(assert (=> d!133303 (= c!118610 lt!547034)))

(assert (=> d!133303 (= lt!547034 (containsKey!592 (toList!8863 (ite c!118552 lt!546853 call!58355)) k0!934))))

(assert (=> d!133303 (= (contains!6942 (ite c!118552 lt!546853 call!58355) k0!934) lt!547033)))

(declare-fun b!1206351 () Bool)

(declare-fun lt!547031 () Unit!39904)

(assert (=> b!1206351 (= e!685166 lt!547031)))

(assert (=> b!1206351 (= lt!547031 (lemmaContainsKeyImpliesGetValueByKeyDefined!420 (toList!8863 (ite c!118552 lt!546853 call!58355)) k0!934))))

(assert (=> b!1206351 (isDefined!458 (getValueByKey!630 (toList!8863 (ite c!118552 lt!546853 call!58355)) k0!934))))

(declare-fun b!1206352 () Bool)

(declare-fun Unit!39912 () Unit!39904)

(assert (=> b!1206352 (= e!685166 Unit!39912)))

(declare-fun b!1206353 () Bool)

(assert (=> b!1206353 (= e!685165 (isDefined!458 (getValueByKey!630 (toList!8863 (ite c!118552 lt!546853 call!58355)) k0!934)))))

(assert (= (and d!133303 c!118610) b!1206351))

(assert (= (and d!133303 (not c!118610)) b!1206352))

(assert (= (and d!133303 (not res!802106)) b!1206353))

(declare-fun m!1112663 () Bool)

(assert (=> d!133303 m!1112663))

(declare-fun m!1112665 () Bool)

(assert (=> b!1206351 m!1112665))

(declare-fun m!1112667 () Bool)

(assert (=> b!1206351 m!1112667))

(assert (=> b!1206351 m!1112667))

(declare-fun m!1112669 () Bool)

(assert (=> b!1206351 m!1112669))

(assert (=> b!1206353 m!1112667))

(assert (=> b!1206353 m!1112667))

(assert (=> b!1206353 m!1112669))

(assert (=> bm!58351 d!133303))

(declare-fun call!58423 () ListLongMap!17695)

(declare-fun call!58422 () ListLongMap!17695)

(declare-fun b!1206360 () Bool)

(declare-fun e!685172 () Bool)

(assert (=> b!1206360 (= e!685172 (= call!58423 (-!1808 call!58422 k0!934)))))

(assert (=> b!1206360 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38198 _values!996)))))

(declare-fun bm!58419 () Bool)

(assert (=> bm!58419 (= call!58423 (getCurrentListMapNoExtraKeys!5328 (array!78054 (store (arr!37662 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38199 _keys!1208)) (array!78052 (store (arr!37661 _values!996) i!673 (ValueCellFull!14600 (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38198 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206361 () Bool)

(declare-fun e!685171 () Bool)

(assert (=> b!1206361 (= e!685171 e!685172)))

(declare-fun c!118613 () Bool)

(assert (=> b!1206361 (= c!118613 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133305 () Bool)

(assert (=> d!133305 e!685171))

(declare-fun res!802109 () Bool)

(assert (=> d!133305 (=> (not res!802109) (not e!685171))))

(assert (=> d!133305 (= res!802109 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38199 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38199 _keys!1208))))))))

(declare-fun lt!547037 () Unit!39904)

(declare-fun choose!1801 (array!78053 array!78051 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39904)

(assert (=> d!133305 (= lt!547037 (choose!1801 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133305 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 _keys!1208)))))

(assert (=> d!133305 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1027 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547037)))

(declare-fun bm!58420 () Bool)

(assert (=> bm!58420 (= call!58422 (getCurrentListMapNoExtraKeys!5328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206362 () Bool)

(assert (=> b!1206362 (= e!685172 (= call!58423 call!58422))))

(assert (=> b!1206362 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38198 _values!996)))))

(assert (= (and d!133305 res!802109) b!1206361))

(assert (= (and b!1206361 c!118613) b!1206360))

(assert (= (and b!1206361 (not c!118613)) b!1206362))

(assert (= (or b!1206360 b!1206362) bm!58420))

(assert (= (or b!1206360 b!1206362) bm!58419))

(declare-fun b_lambda!21295 () Bool)

(assert (=> (not b_lambda!21295) (not bm!58419)))

(assert (=> bm!58419 t!39414))

(declare-fun b_and!42825 () Bool)

(assert (= b_and!42823 (and (=> t!39414 result!22005) b_and!42825)))

(declare-fun m!1112671 () Bool)

(assert (=> b!1206360 m!1112671))

(assert (=> bm!58419 m!1112397))

(assert (=> bm!58419 m!1112389))

(assert (=> bm!58419 m!1112391))

(declare-fun m!1112673 () Bool)

(assert (=> bm!58419 m!1112673))

(declare-fun m!1112675 () Bool)

(assert (=> d!133305 m!1112675))

(assert (=> bm!58420 m!1112343))

(assert (=> b!1206080 d!133305))

(declare-fun b!1206363 () Bool)

(declare-fun e!685174 () Bool)

(declare-fun e!685175 () Bool)

(assert (=> b!1206363 (= e!685174 e!685175)))

(declare-fun lt!547038 () (_ BitVec 64))

(assert (=> b!1206363 (= lt!547038 (select (arr!37662 lt!546856) #b00000000000000000000000000000000))))

(declare-fun lt!547039 () Unit!39904)

(assert (=> b!1206363 (= lt!547039 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!546856 lt!547038 #b00000000000000000000000000000000))))

(assert (=> b!1206363 (arrayContainsKey!0 lt!546856 lt!547038 #b00000000000000000000000000000000)))

(declare-fun lt!547040 () Unit!39904)

(assert (=> b!1206363 (= lt!547040 lt!547039)))

(declare-fun res!802110 () Bool)

(assert (=> b!1206363 (= res!802110 (= (seekEntryOrOpen!0 (select (arr!37662 lt!546856) #b00000000000000000000000000000000) lt!546856 mask!1564) (Found!9892 #b00000000000000000000000000000000)))))

(assert (=> b!1206363 (=> (not res!802110) (not e!685175))))

(declare-fun b!1206364 () Bool)

(declare-fun e!685173 () Bool)

(assert (=> b!1206364 (= e!685173 e!685174)))

(declare-fun c!118614 () Bool)

(assert (=> b!1206364 (= c!118614 (validKeyInArray!0 (select (arr!37662 lt!546856) #b00000000000000000000000000000000)))))

(declare-fun d!133307 () Bool)

(declare-fun res!802111 () Bool)

(assert (=> d!133307 (=> res!802111 e!685173)))

(assert (=> d!133307 (= res!802111 (bvsge #b00000000000000000000000000000000 (size!38199 lt!546856)))))

(assert (=> d!133307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546856 mask!1564) e!685173)))

(declare-fun b!1206365 () Bool)

(declare-fun call!58424 () Bool)

(assert (=> b!1206365 (= e!685175 call!58424)))

(declare-fun bm!58421 () Bool)

(assert (=> bm!58421 (= call!58424 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!546856 mask!1564))))

(declare-fun b!1206366 () Bool)

(assert (=> b!1206366 (= e!685174 call!58424)))

(assert (= (and d!133307 (not res!802111)) b!1206364))

(assert (= (and b!1206364 c!118614) b!1206363))

(assert (= (and b!1206364 (not c!118614)) b!1206366))

(assert (= (and b!1206363 res!802110) b!1206365))

(assert (= (or b!1206365 b!1206366) bm!58421))

(declare-fun m!1112677 () Bool)

(assert (=> b!1206363 m!1112677))

(declare-fun m!1112679 () Bool)

(assert (=> b!1206363 m!1112679))

(declare-fun m!1112681 () Bool)

(assert (=> b!1206363 m!1112681))

(assert (=> b!1206363 m!1112677))

(declare-fun m!1112683 () Bool)

(assert (=> b!1206363 m!1112683))

(assert (=> b!1206364 m!1112677))

(assert (=> b!1206364 m!1112677))

(declare-fun m!1112685 () Bool)

(assert (=> b!1206364 m!1112685))

(declare-fun m!1112687 () Bool)

(assert (=> bm!58421 m!1112687))

(assert (=> b!1206071 d!133307))

(declare-fun d!133309 () Bool)

(declare-fun res!802112 () Bool)

(declare-fun e!685176 () Bool)

(assert (=> d!133309 (=> res!802112 e!685176)))

(assert (=> d!133309 (= res!802112 (= (select (arr!37662 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133309 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!685176)))

(declare-fun b!1206367 () Bool)

(declare-fun e!685177 () Bool)

(assert (=> b!1206367 (= e!685176 e!685177)))

(declare-fun res!802113 () Bool)

(assert (=> b!1206367 (=> (not res!802113) (not e!685177))))

(assert (=> b!1206367 (= res!802113 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38199 _keys!1208)))))

(declare-fun b!1206368 () Bool)

(assert (=> b!1206368 (= e!685177 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133309 (not res!802112)) b!1206367))

(assert (= (and b!1206367 res!802113) b!1206368))

(assert (=> d!133309 m!1112617))

(declare-fun m!1112689 () Bool)

(assert (=> b!1206368 m!1112689))

(assert (=> b!1206057 d!133309))

(declare-fun d!133311 () Bool)

(assert (=> d!133311 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547043 () Unit!39904)

(declare-fun choose!13 (array!78053 (_ BitVec 64) (_ BitVec 32)) Unit!39904)

(assert (=> d!133311 (= lt!547043 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133311 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133311 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!547043)))

(declare-fun bs!34117 () Bool)

(assert (= bs!34117 d!133311))

(assert (=> bs!34117 m!1112363))

(declare-fun m!1112691 () Bool)

(assert (=> bs!34117 m!1112691))

(assert (=> b!1206057 d!133311))

(declare-fun d!133313 () Bool)

(declare-fun e!685180 () Bool)

(assert (=> d!133313 e!685180))

(declare-fun c!118617 () Bool)

(assert (=> d!133313 (= c!118617 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547046 () Unit!39904)

(declare-fun choose!1802 (array!78053 array!78051 (_ BitVec 32) (_ BitVec 32) V!45953 V!45953 (_ BitVec 64) (_ BitVec 32) Int) Unit!39904)

(assert (=> d!133313 (= lt!547046 (choose!1802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133313 (validMask!0 mask!1564)))

(assert (=> d!133313 (= (lemmaListMapContainsThenArrayContainsFrom!569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547046)))

(declare-fun b!1206373 () Bool)

(assert (=> b!1206373 (= e!685180 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206374 () Bool)

(assert (=> b!1206374 (= e!685180 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133313 c!118617) b!1206373))

(assert (= (and d!133313 (not c!118617)) b!1206374))

(declare-fun m!1112693 () Bool)

(assert (=> d!133313 m!1112693))

(assert (=> d!133313 m!1112355))

(assert (=> b!1206373 m!1112351))

(assert (=> b!1206079 d!133313))

(declare-fun d!133315 () Bool)

(declare-fun e!685181 () Bool)

(assert (=> d!133315 e!685181))

(declare-fun res!802114 () Bool)

(assert (=> d!133315 (=> res!802114 e!685181)))

(declare-fun lt!547049 () Bool)

(assert (=> d!133315 (= res!802114 (not lt!547049))))

(declare-fun lt!547050 () Bool)

(assert (=> d!133315 (= lt!547049 lt!547050)))

(declare-fun lt!547048 () Unit!39904)

(declare-fun e!685182 () Unit!39904)

(assert (=> d!133315 (= lt!547048 e!685182)))

(declare-fun c!118618 () Bool)

(assert (=> d!133315 (= c!118618 lt!547050)))

(assert (=> d!133315 (= lt!547050 (containsKey!592 (toList!8863 lt!546857) k0!934))))

(assert (=> d!133315 (= (contains!6942 lt!546857 k0!934) lt!547049)))

(declare-fun b!1206375 () Bool)

(declare-fun lt!547047 () Unit!39904)

(assert (=> b!1206375 (= e!685182 lt!547047)))

(assert (=> b!1206375 (= lt!547047 (lemmaContainsKeyImpliesGetValueByKeyDefined!420 (toList!8863 lt!546857) k0!934))))

(assert (=> b!1206375 (isDefined!458 (getValueByKey!630 (toList!8863 lt!546857) k0!934))))

(declare-fun b!1206376 () Bool)

(declare-fun Unit!39913 () Unit!39904)

(assert (=> b!1206376 (= e!685182 Unit!39913)))

(declare-fun b!1206377 () Bool)

(assert (=> b!1206377 (= e!685181 (isDefined!458 (getValueByKey!630 (toList!8863 lt!546857) k0!934)))))

(assert (= (and d!133315 c!118618) b!1206375))

(assert (= (and d!133315 (not c!118618)) b!1206376))

(assert (= (and d!133315 (not res!802114)) b!1206377))

(declare-fun m!1112695 () Bool)

(assert (=> d!133315 m!1112695))

(declare-fun m!1112697 () Bool)

(assert (=> b!1206375 m!1112697))

(declare-fun m!1112699 () Bool)

(assert (=> b!1206375 m!1112699))

(assert (=> b!1206375 m!1112699))

(declare-fun m!1112701 () Bool)

(assert (=> b!1206375 m!1112701))

(assert (=> b!1206377 m!1112699))

(assert (=> b!1206377 m!1112699))

(assert (=> b!1206377 m!1112701))

(assert (=> b!1206070 d!133315))

(assert (=> b!1206070 d!133301))

(declare-fun d!133317 () Bool)

(assert (=> d!133317 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1206056 d!133317))

(declare-fun d!133319 () Bool)

(declare-fun e!685183 () Bool)

(assert (=> d!133319 e!685183))

(declare-fun res!802116 () Bool)

(assert (=> d!133319 (=> (not res!802116) (not e!685183))))

(declare-fun lt!547053 () ListLongMap!17695)

(assert (=> d!133319 (= res!802116 (contains!6942 lt!547053 (_1!9870 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!547051 () List!26528)

(assert (=> d!133319 (= lt!547053 (ListLongMap!17696 lt!547051))))

(declare-fun lt!547054 () Unit!39904)

(declare-fun lt!547052 () Unit!39904)

(assert (=> d!133319 (= lt!547054 lt!547052)))

(assert (=> d!133319 (= (getValueByKey!630 lt!547051 (_1!9870 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!680 (_2!9870 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133319 (= lt!547052 (lemmaContainsTupThenGetReturnValue!312 lt!547051 (_1!9870 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9870 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133319 (= lt!547051 (insertStrictlySorted!405 (toList!8863 lt!546857) (_1!9870 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9870 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133319 (= (+!4029 lt!546857 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!547053)))

(declare-fun b!1206378 () Bool)

(declare-fun res!802115 () Bool)

(assert (=> b!1206378 (=> (not res!802115) (not e!685183))))

(assert (=> b!1206378 (= res!802115 (= (getValueByKey!630 (toList!8863 lt!547053) (_1!9870 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!680 (_2!9870 (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1206379 () Bool)

(assert (=> b!1206379 (= e!685183 (contains!6944 (toList!8863 lt!547053) (ite (or c!118552 c!118549) (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133319 res!802116) b!1206378))

(assert (= (and b!1206378 res!802115) b!1206379))

(declare-fun m!1112703 () Bool)

(assert (=> d!133319 m!1112703))

(declare-fun m!1112705 () Bool)

(assert (=> d!133319 m!1112705))

(declare-fun m!1112707 () Bool)

(assert (=> d!133319 m!1112707))

(declare-fun m!1112709 () Bool)

(assert (=> d!133319 m!1112709))

(declare-fun m!1112711 () Bool)

(assert (=> b!1206378 m!1112711))

(declare-fun m!1112713 () Bool)

(assert (=> b!1206379 m!1112713))

(assert (=> bm!58358 d!133319))

(declare-fun bm!58424 () Bool)

(declare-fun call!58427 () Bool)

(declare-fun c!118621 () Bool)

(assert (=> bm!58424 (= call!58427 (arrayNoDuplicates!0 lt!546856 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118621 (Cons!26525 (select (arr!37662 lt!546856) #b00000000000000000000000000000000) Nil!26526) Nil!26526)))))

(declare-fun b!1206390 () Bool)

(declare-fun e!685193 () Bool)

(assert (=> b!1206390 (= e!685193 call!58427)))

(declare-fun b!1206391 () Bool)

(declare-fun e!685194 () Bool)

(assert (=> b!1206391 (= e!685194 e!685193)))

(assert (=> b!1206391 (= c!118621 (validKeyInArray!0 (select (arr!37662 lt!546856) #b00000000000000000000000000000000)))))

(declare-fun b!1206393 () Bool)

(declare-fun e!685195 () Bool)

(declare-fun contains!6945 (List!26529 (_ BitVec 64)) Bool)

(assert (=> b!1206393 (= e!685195 (contains!6945 Nil!26526 (select (arr!37662 lt!546856) #b00000000000000000000000000000000)))))

(declare-fun b!1206394 () Bool)

(declare-fun e!685192 () Bool)

(assert (=> b!1206394 (= e!685192 e!685194)))

(declare-fun res!802123 () Bool)

(assert (=> b!1206394 (=> (not res!802123) (not e!685194))))

(assert (=> b!1206394 (= res!802123 (not e!685195))))

(declare-fun res!802124 () Bool)

(assert (=> b!1206394 (=> (not res!802124) (not e!685195))))

(assert (=> b!1206394 (= res!802124 (validKeyInArray!0 (select (arr!37662 lt!546856) #b00000000000000000000000000000000)))))

(declare-fun d!133321 () Bool)

(declare-fun res!802125 () Bool)

(assert (=> d!133321 (=> res!802125 e!685192)))

(assert (=> d!133321 (= res!802125 (bvsge #b00000000000000000000000000000000 (size!38199 lt!546856)))))

(assert (=> d!133321 (= (arrayNoDuplicates!0 lt!546856 #b00000000000000000000000000000000 Nil!26526) e!685192)))

(declare-fun b!1206392 () Bool)

(assert (=> b!1206392 (= e!685193 call!58427)))

(assert (= (and d!133321 (not res!802125)) b!1206394))

(assert (= (and b!1206394 res!802124) b!1206393))

(assert (= (and b!1206394 res!802123) b!1206391))

(assert (= (and b!1206391 c!118621) b!1206392))

(assert (= (and b!1206391 (not c!118621)) b!1206390))

(assert (= (or b!1206392 b!1206390) bm!58424))

(assert (=> bm!58424 m!1112677))

(declare-fun m!1112715 () Bool)

(assert (=> bm!58424 m!1112715))

(assert (=> b!1206391 m!1112677))

(assert (=> b!1206391 m!1112677))

(assert (=> b!1206391 m!1112685))

(assert (=> b!1206393 m!1112677))

(assert (=> b!1206393 m!1112677))

(declare-fun m!1112717 () Bool)

(assert (=> b!1206393 m!1112717))

(assert (=> b!1206394 m!1112677))

(assert (=> b!1206394 m!1112677))

(assert (=> b!1206394 m!1112685))

(assert (=> b!1206066 d!133321))

(declare-fun b!1206395 () Bool)

(declare-fun e!685202 () Bool)

(declare-fun lt!547061 () ListLongMap!17695)

(assert (=> b!1206395 (= e!685202 (isEmpty!989 lt!547061))))

(declare-fun b!1206396 () Bool)

(declare-fun lt!547060 () Unit!39904)

(declare-fun lt!547056 () Unit!39904)

(assert (=> b!1206396 (= lt!547060 lt!547056)))

(declare-fun lt!547058 () (_ BitVec 64))

(declare-fun lt!547057 () (_ BitVec 64))

(declare-fun lt!547059 () V!45953)

(declare-fun lt!547055 () ListLongMap!17695)

(assert (=> b!1206396 (not (contains!6942 (+!4029 lt!547055 (tuple2!19719 lt!547057 lt!547059)) lt!547058))))

(assert (=> b!1206396 (= lt!547056 (addStillNotContains!293 lt!547055 lt!547057 lt!547059 lt!547058))))

(assert (=> b!1206396 (= lt!547058 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1206396 (= lt!547059 (get!19245 (select (arr!37661 lt!546863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1206396 (= lt!547057 (select (arr!37662 lt!546856) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!58428 () ListLongMap!17695)

(assert (=> b!1206396 (= lt!547055 call!58428)))

(declare-fun e!685196 () ListLongMap!17695)

(assert (=> b!1206396 (= e!685196 (+!4029 call!58428 (tuple2!19719 (select (arr!37662 lt!546856) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19245 (select (arr!37661 lt!546863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1206397 () Bool)

(assert (=> b!1206397 (= e!685196 call!58428)))

(declare-fun b!1206398 () Bool)

(declare-fun e!685197 () Bool)

(assert (=> b!1206398 (= e!685197 (validKeyInArray!0 (select (arr!37662 lt!546856) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206398 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1206399 () Bool)

(declare-fun e!685200 () Bool)

(declare-fun e!685198 () Bool)

(assert (=> b!1206399 (= e!685200 e!685198)))

(declare-fun c!118622 () Bool)

(assert (=> b!1206399 (= c!118622 e!685197)))

(declare-fun res!802129 () Bool)

(assert (=> b!1206399 (=> (not res!802129) (not e!685197))))

(assert (=> b!1206399 (= res!802129 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 lt!546856)))))

(declare-fun b!1206400 () Bool)

(declare-fun e!685199 () ListLongMap!17695)

(assert (=> b!1206400 (= e!685199 e!685196)))

(declare-fun c!118625 () Bool)

(assert (=> b!1206400 (= c!118625 (validKeyInArray!0 (select (arr!37662 lt!546856) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun bm!58425 () Bool)

(assert (=> bm!58425 (= call!58428 (getCurrentListMapNoExtraKeys!5328 lt!546856 lt!546863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1206402 () Bool)

(assert (=> b!1206402 (= e!685198 e!685202)))

(declare-fun c!118623 () Bool)

(assert (=> b!1206402 (= c!118623 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 lt!546856)))))

(declare-fun b!1206403 () Bool)

(assert (=> b!1206403 (= e!685199 (ListLongMap!17696 Nil!26525))))

(declare-fun b!1206404 () Bool)

(declare-fun e!685201 () Bool)

(assert (=> b!1206404 (= e!685198 e!685201)))

(assert (=> b!1206404 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 lt!546856)))))

(declare-fun res!802128 () Bool)

(assert (=> b!1206404 (= res!802128 (contains!6942 lt!547061 (select (arr!37662 lt!546856) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1206404 (=> (not res!802128) (not e!685201))))

(declare-fun b!1206405 () Bool)

(assert (=> b!1206405 (= e!685202 (= lt!547061 (getCurrentListMapNoExtraKeys!5328 lt!546856 lt!546863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1206406 () Bool)

(declare-fun res!802126 () Bool)

(assert (=> b!1206406 (=> (not res!802126) (not e!685200))))

(assert (=> b!1206406 (= res!802126 (not (contains!6942 lt!547061 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!133323 () Bool)

(assert (=> d!133323 e!685200))

(declare-fun res!802127 () Bool)

(assert (=> d!133323 (=> (not res!802127) (not e!685200))))

(assert (=> d!133323 (= res!802127 (not (contains!6942 lt!547061 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133323 (= lt!547061 e!685199)))

(declare-fun c!118624 () Bool)

(assert (=> d!133323 (= c!118624 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 lt!546856)))))

(assert (=> d!133323 (validMask!0 mask!1564)))

(assert (=> d!133323 (= (getCurrentListMapNoExtraKeys!5328 lt!546856 lt!546863 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547061)))

(declare-fun b!1206401 () Bool)

(assert (=> b!1206401 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38199 lt!546856)))))

(assert (=> b!1206401 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38198 lt!546863)))))

(assert (=> b!1206401 (= e!685201 (= (apply!972 lt!547061 (select (arr!37662 lt!546856) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19245 (select (arr!37661 lt!546863) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3252 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133323 c!118624) b!1206403))

(assert (= (and d!133323 (not c!118624)) b!1206400))

(assert (= (and b!1206400 c!118625) b!1206396))

(assert (= (and b!1206400 (not c!118625)) b!1206397))

(assert (= (or b!1206396 b!1206397) bm!58425))

(assert (= (and d!133323 res!802127) b!1206406))

(assert (= (and b!1206406 res!802126) b!1206399))

(assert (= (and b!1206399 res!802129) b!1206398))

(assert (= (and b!1206399 c!118622) b!1206404))

(assert (= (and b!1206399 (not c!118622)) b!1206402))

(assert (= (and b!1206404 res!802128) b!1206401))

(assert (= (and b!1206402 c!118623) b!1206405))

(assert (= (and b!1206402 (not c!118623)) b!1206395))

(declare-fun b_lambda!21297 () Bool)

(assert (=> (not b_lambda!21297) (not b!1206396)))

(assert (=> b!1206396 t!39414))

(declare-fun b_and!42827 () Bool)

(assert (= b_and!42825 (and (=> t!39414 result!22005) b_and!42827)))

(declare-fun b_lambda!21299 () Bool)

(assert (=> (not b_lambda!21299) (not b!1206401)))

(assert (=> b!1206401 t!39414))

(declare-fun b_and!42829 () Bool)

(assert (= b_and!42827 (and (=> t!39414 result!22005) b_and!42829)))

(declare-fun m!1112719 () Bool)

(assert (=> b!1206404 m!1112719))

(assert (=> b!1206404 m!1112719))

(declare-fun m!1112721 () Bool)

(assert (=> b!1206404 m!1112721))

(assert (=> b!1206398 m!1112719))

(assert (=> b!1206398 m!1112719))

(declare-fun m!1112723 () Bool)

(assert (=> b!1206398 m!1112723))

(assert (=> b!1206400 m!1112719))

(assert (=> b!1206400 m!1112719))

(assert (=> b!1206400 m!1112723))

(declare-fun m!1112725 () Bool)

(assert (=> b!1206406 m!1112725))

(declare-fun m!1112727 () Bool)

(assert (=> b!1206395 m!1112727))

(declare-fun m!1112729 () Bool)

(assert (=> b!1206401 m!1112729))

(assert (=> b!1206401 m!1112719))

(assert (=> b!1206401 m!1112719))

(declare-fun m!1112731 () Bool)

(assert (=> b!1206401 m!1112731))

(assert (=> b!1206401 m!1112729))

(assert (=> b!1206401 m!1112389))

(declare-fun m!1112733 () Bool)

(assert (=> b!1206401 m!1112733))

(assert (=> b!1206401 m!1112389))

(declare-fun m!1112735 () Bool)

(assert (=> d!133323 m!1112735))

(assert (=> d!133323 m!1112355))

(declare-fun m!1112737 () Bool)

(assert (=> b!1206396 m!1112737))

(assert (=> b!1206396 m!1112729))

(declare-fun m!1112739 () Bool)

(assert (=> b!1206396 m!1112739))

(assert (=> b!1206396 m!1112719))

(declare-fun m!1112741 () Bool)

(assert (=> b!1206396 m!1112741))

(assert (=> b!1206396 m!1112741))

(declare-fun m!1112743 () Bool)

(assert (=> b!1206396 m!1112743))

(assert (=> b!1206396 m!1112729))

(assert (=> b!1206396 m!1112389))

(assert (=> b!1206396 m!1112733))

(assert (=> b!1206396 m!1112389))

(declare-fun m!1112745 () Bool)

(assert (=> bm!58425 m!1112745))

(assert (=> b!1206405 m!1112745))

(assert (=> bm!58355 d!133323))

(declare-fun bm!58426 () Bool)

(declare-fun call!58429 () Bool)

(declare-fun c!118626 () Bool)

(assert (=> bm!58426 (= call!58429 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118626 (Cons!26525 (select (arr!37662 _keys!1208) #b00000000000000000000000000000000) Nil!26526) Nil!26526)))))

(declare-fun b!1206407 () Bool)

(declare-fun e!685204 () Bool)

(assert (=> b!1206407 (= e!685204 call!58429)))

(declare-fun b!1206408 () Bool)

(declare-fun e!685205 () Bool)

(assert (=> b!1206408 (= e!685205 e!685204)))

(assert (=> b!1206408 (= c!118626 (validKeyInArray!0 (select (arr!37662 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1206410 () Bool)

(declare-fun e!685206 () Bool)

(assert (=> b!1206410 (= e!685206 (contains!6945 Nil!26526 (select (arr!37662 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1206411 () Bool)

(declare-fun e!685203 () Bool)

(assert (=> b!1206411 (= e!685203 e!685205)))

(declare-fun res!802130 () Bool)

(assert (=> b!1206411 (=> (not res!802130) (not e!685205))))

(assert (=> b!1206411 (= res!802130 (not e!685206))))

(declare-fun res!802131 () Bool)

(assert (=> b!1206411 (=> (not res!802131) (not e!685206))))

(assert (=> b!1206411 (= res!802131 (validKeyInArray!0 (select (arr!37662 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133325 () Bool)

(declare-fun res!802132 () Bool)

(assert (=> d!133325 (=> res!802132 e!685203)))

(assert (=> d!133325 (= res!802132 (bvsge #b00000000000000000000000000000000 (size!38199 _keys!1208)))))

(assert (=> d!133325 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26526) e!685203)))

(declare-fun b!1206409 () Bool)

(assert (=> b!1206409 (= e!685204 call!58429)))

(assert (= (and d!133325 (not res!802132)) b!1206411))

(assert (= (and b!1206411 res!802131) b!1206410))

(assert (= (and b!1206411 res!802130) b!1206408))

(assert (= (and b!1206408 c!118626) b!1206409))

(assert (= (and b!1206408 (not c!118626)) b!1206407))

(assert (= (or b!1206409 b!1206407) bm!58426))

(assert (=> bm!58426 m!1112617))

(declare-fun m!1112747 () Bool)

(assert (=> bm!58426 m!1112747))

(assert (=> b!1206408 m!1112617))

(assert (=> b!1206408 m!1112617))

(assert (=> b!1206408 m!1112625))

(assert (=> b!1206410 m!1112617))

(assert (=> b!1206410 m!1112617))

(declare-fun m!1112749 () Bool)

(assert (=> b!1206410 m!1112749))

(assert (=> b!1206411 m!1112617))

(assert (=> b!1206411 m!1112617))

(assert (=> b!1206411 m!1112625))

(assert (=> b!1206072 d!133325))

(declare-fun condMapEmpty!47790 () Bool)

(declare-fun mapDefault!47790 () ValueCell!14600)

(assert (=> mapNonEmpty!47781 (= condMapEmpty!47790 (= mapRest!47781 ((as const (Array (_ BitVec 32) ValueCell!14600)) mapDefault!47790)))))

(declare-fun e!685212 () Bool)

(declare-fun mapRes!47790 () Bool)

(assert (=> mapNonEmpty!47781 (= tp!90745 (and e!685212 mapRes!47790))))

(declare-fun b!1206418 () Bool)

(declare-fun e!685211 () Bool)

(assert (=> b!1206418 (= e!685211 tp_is_empty!30619)))

(declare-fun mapNonEmpty!47790 () Bool)

(declare-fun tp!90760 () Bool)

(assert (=> mapNonEmpty!47790 (= mapRes!47790 (and tp!90760 e!685211))))

(declare-fun mapValue!47790 () ValueCell!14600)

(declare-fun mapKey!47790 () (_ BitVec 32))

(declare-fun mapRest!47790 () (Array (_ BitVec 32) ValueCell!14600))

(assert (=> mapNonEmpty!47790 (= mapRest!47781 (store mapRest!47790 mapKey!47790 mapValue!47790))))

(declare-fun mapIsEmpty!47790 () Bool)

(assert (=> mapIsEmpty!47790 mapRes!47790))

(declare-fun b!1206419 () Bool)

(assert (=> b!1206419 (= e!685212 tp_is_empty!30619)))

(assert (= (and mapNonEmpty!47781 condMapEmpty!47790) mapIsEmpty!47790))

(assert (= (and mapNonEmpty!47781 (not condMapEmpty!47790)) mapNonEmpty!47790))

(assert (= (and mapNonEmpty!47790 ((_ is ValueCellFull!14600) mapValue!47790)) b!1206418))

(assert (= (and mapNonEmpty!47781 ((_ is ValueCellFull!14600) mapDefault!47790)) b!1206419))

(declare-fun m!1112751 () Bool)

(assert (=> mapNonEmpty!47790 m!1112751))

(declare-fun b_lambda!21301 () Bool)

(assert (= b_lambda!21283 (or (and start!100950 b_free!25915) b_lambda!21301)))

(declare-fun b_lambda!21303 () Bool)

(assert (= b_lambda!21293 (or (and start!100950 b_free!25915) b_lambda!21303)))

(declare-fun b_lambda!21305 () Bool)

(assert (= b_lambda!21297 (or (and start!100950 b_free!25915) b_lambda!21305)))

(declare-fun b_lambda!21307 () Bool)

(assert (= b_lambda!21289 (or (and start!100950 b_free!25915) b_lambda!21307)))

(declare-fun b_lambda!21309 () Bool)

(assert (= b_lambda!21299 (or (and start!100950 b_free!25915) b_lambda!21309)))

(declare-fun b_lambda!21311 () Bool)

(assert (= b_lambda!21291 (or (and start!100950 b_free!25915) b_lambda!21311)))

(declare-fun b_lambda!21313 () Bool)

(assert (= b_lambda!21295 (or (and start!100950 b_free!25915) b_lambda!21313)))

(declare-fun b_lambda!21315 () Bool)

(assert (= b_lambda!21287 (or (and start!100950 b_free!25915) b_lambda!21315)))

(declare-fun b_lambda!21317 () Bool)

(assert (= b_lambda!21285 (or (and start!100950 b_free!25915) b_lambda!21317)))

(check-sat (not b_lambda!21313) (not d!133301) (not b!1206318) (not b!1206308) (not bm!58409) (not b!1206353) (not b!1206348) (not b!1206379) (not b!1206360) (not d!133289) (not bm!58419) (not mapNonEmpty!47790) (not d!133299) (not b!1206290) (not b!1206393) (not d!133311) (not b!1206288) (not bm!58424) (not b!1206320) (not bm!58421) (not b!1206410) (not b!1206342) (not b!1206336) (not b!1206298) (not b!1206411) (not b!1206401) (not d!133291) (not b!1206300) (not b!1206398) (not b!1206335) tp_is_empty!30619 (not bm!58410) (not b!1206391) (not d!133283) (not bm!58420) (not b_lambda!21315) (not d!133287) (not b!1206296) (not b!1206292) (not b!1206262) (not b_lambda!21317) (not b!1206287) (not b!1206364) (not b_lambda!21311) (not b!1206304) (not b!1206293) (not b!1206350) (not b_lambda!21307) (not b!1206299) (not b!1206405) (not b!1206394) (not b_lambda!21309) (not b_lambda!21305) (not b!1206375) (not bm!58425) (not d!133323) (not b!1206305) (not b_lambda!21303) (not d!133279) (not d!133315) (not d!133313) (not b!1206309) (not b!1206395) (not b!1206377) (not b!1206351) (not b!1206349) (not b!1206345) (not b!1206344) (not d!133319) b_and!42829 (not d!133303) (not b_next!25915) (not b!1206400) (not b!1206408) (not b!1206373) (not b!1206325) (not b!1206297) (not b!1206363) (not b!1206368) (not b!1206404) (not b!1206378) (not b_lambda!21301) (not bm!58413) (not b!1206310) (not bm!58426) (not d!133285) (not b_lambda!21281) (not b!1206302) (not d!133305) (not b!1206406) (not b!1206326) (not b!1206339) (not b!1206340) (not b!1206396) (not bm!58414))
(check-sat b_and!42829 (not b_next!25915))
