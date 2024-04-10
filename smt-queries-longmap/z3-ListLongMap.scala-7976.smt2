; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98698 () Bool)

(assert start!98698)

(declare-fun b_free!24303 () Bool)

(declare-fun b_next!24303 () Bool)

(assert (=> start!98698 (= b_free!24303 (not b_next!24303))))

(declare-fun tp!85619 () Bool)

(declare-fun b_and!39455 () Bool)

(assert (=> start!98698 (= tp!85619 b_and!39455)))

(declare-fun b!1148950 () Bool)

(declare-fun e!653520 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74513 0))(
  ( (array!74514 (arr!35907 (Array (_ BitVec 32) (_ BitVec 64))) (size!36443 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74513)

(assert (=> b!1148950 (= e!653520 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36443 _keys!1208))))))

(declare-fun e!653516 () Bool)

(assert (=> b!1148950 e!653516))

(declare-fun res!764491 () Bool)

(assert (=> b!1148950 (=> (not res!764491) (not e!653516))))

(declare-datatypes ((V!43571 0))(
  ( (V!43572 (val!14473 Int)) )
))
(declare-datatypes ((tuple2!18358 0))(
  ( (tuple2!18359 (_1!9190 (_ BitVec 64)) (_2!9190 V!43571)) )
))
(declare-datatypes ((List!25109 0))(
  ( (Nil!25106) (Cons!25105 (h!26314 tuple2!18358) (t!36404 List!25109)) )
))
(declare-datatypes ((ListLongMap!16327 0))(
  ( (ListLongMap!16328 (toList!8179 List!25109)) )
))
(declare-fun lt!513740 () ListLongMap!16327)

(declare-fun lt!513742 () V!43571)

(declare-fun -!1314 (ListLongMap!16327 (_ BitVec 64)) ListLongMap!16327)

(declare-fun +!3601 (ListLongMap!16327 tuple2!18358) ListLongMap!16327)

(assert (=> b!1148950 (= res!764491 (= (-!1314 (+!3601 lt!513740 (tuple2!18359 (select (arr!35907 _keys!1208) from!1455) lt!513742)) (select (arr!35907 _keys!1208) from!1455)) lt!513740))))

(declare-datatypes ((Unit!37764 0))(
  ( (Unit!37765) )
))
(declare-fun lt!513754 () Unit!37764)

(declare-fun addThenRemoveForNewKeyIsSame!159 (ListLongMap!16327 (_ BitVec 64) V!43571) Unit!37764)

(assert (=> b!1148950 (= lt!513754 (addThenRemoveForNewKeyIsSame!159 lt!513740 (select (arr!35907 _keys!1208) from!1455) lt!513742))))

(declare-datatypes ((ValueCell!13707 0))(
  ( (ValueCellFull!13707 (v!17110 V!43571)) (EmptyCell!13707) )
))
(declare-datatypes ((array!74515 0))(
  ( (array!74516 (arr!35908 (Array (_ BitVec 32) ValueCell!13707)) (size!36444 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74515)

(declare-fun lt!513750 () V!43571)

(declare-fun get!18273 (ValueCell!13707 V!43571) V!43571)

(assert (=> b!1148950 (= lt!513742 (get!18273 (select (arr!35908 _values!996) from!1455) lt!513750))))

(declare-fun lt!513738 () Unit!37764)

(declare-fun e!653511 () Unit!37764)

(assert (=> b!1148950 (= lt!513738 e!653511)))

(declare-fun c!113585 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6702 (ListLongMap!16327 (_ BitVec 64)) Bool)

(assert (=> b!1148950 (= c!113585 (contains!6702 lt!513740 k0!934))))

(declare-fun zeroValue!944 () V!43571)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43571)

(declare-fun getCurrentListMapNoExtraKeys!4652 (array!74513 array!74515 (_ BitVec 32) (_ BitVec 32) V!43571 V!43571 (_ BitVec 32) Int) ListLongMap!16327)

(assert (=> b!1148950 (= lt!513740 (getCurrentListMapNoExtraKeys!4652 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53175 () Bool)

(declare-fun call!53185 () ListLongMap!16327)

(declare-fun call!53180 () ListLongMap!16327)

(assert (=> bm!53175 (= call!53185 call!53180)))

(declare-fun call!53178 () ListLongMap!16327)

(declare-fun bm!53176 () Bool)

(assert (=> bm!53176 (= call!53178 (getCurrentListMapNoExtraKeys!4652 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148951 () Bool)

(declare-fun res!764492 () Bool)

(declare-fun e!653523 () Bool)

(assert (=> b!1148951 (=> (not res!764492) (not e!653523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148951 (= res!764492 (validMask!0 mask!1564))))

(declare-fun b!1148952 () Bool)

(declare-fun res!764497 () Bool)

(assert (=> b!1148952 (=> (not res!764497) (not e!653523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74513 (_ BitVec 32)) Bool)

(assert (=> b!1148952 (= res!764497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!653512 () Bool)

(declare-fun b!1148953 () Bool)

(declare-fun arrayContainsKey!0 (array!74513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148953 (= e!653512 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148954 () Bool)

(declare-fun e!653522 () Bool)

(declare-fun e!653519 () Bool)

(assert (=> b!1148954 (= e!653522 (not e!653519))))

(declare-fun res!764486 () Bool)

(assert (=> b!1148954 (=> res!764486 e!653519)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148954 (= res!764486 (bvsgt from!1455 i!673))))

(assert (=> b!1148954 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513747 () Unit!37764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74513 (_ BitVec 64) (_ BitVec 32)) Unit!37764)

(assert (=> b!1148954 (= lt!513747 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1148955 () Bool)

(declare-fun e!653524 () Bool)

(declare-fun call!53179 () ListLongMap!16327)

(assert (=> b!1148955 (= e!653524 (= call!53179 call!53178))))

(declare-fun e!653513 () Bool)

(declare-fun b!1148956 () Bool)

(assert (=> b!1148956 (= e!653513 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148957 () Bool)

(declare-fun Unit!37766 () Unit!37764)

(assert (=> b!1148957 (= e!653511 Unit!37766)))

(declare-fun b!1148958 () Bool)

(declare-fun res!764496 () Bool)

(assert (=> b!1148958 (=> (not res!764496) (not e!653522))))

(declare-fun lt!513744 () array!74513)

(declare-datatypes ((List!25110 0))(
  ( (Nil!25107) (Cons!25106 (h!26315 (_ BitVec 64)) (t!36405 List!25110)) )
))
(declare-fun arrayNoDuplicates!0 (array!74513 (_ BitVec 32) List!25110) Bool)

(assert (=> b!1148958 (= res!764496 (arrayNoDuplicates!0 lt!513744 #b00000000000000000000000000000000 Nil!25107))))

(declare-fun b!1148959 () Bool)

(declare-fun e!653521 () Bool)

(assert (=> b!1148959 (= e!653521 e!653520)))

(declare-fun res!764488 () Bool)

(assert (=> b!1148959 (=> res!764488 e!653520)))

(assert (=> b!1148959 (= res!764488 (not (= (select (arr!35907 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1148959 e!653524))

(declare-fun c!113587 () Bool)

(assert (=> b!1148959 (= c!113587 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513743 () Unit!37764)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!551 (array!74513 array!74515 (_ BitVec 32) (_ BitVec 32) V!43571 V!43571 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37764)

(assert (=> b!1148959 (= lt!513743 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!551 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113589 () Bool)

(declare-fun c!113590 () Bool)

(declare-fun bm!53177 () Bool)

(assert (=> bm!53177 (= call!53180 (+!3601 lt!513740 (ite (or c!113590 c!113589) (tuple2!18359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!513745 () ListLongMap!16327)

(declare-fun b!1148960 () Bool)

(assert (=> b!1148960 (= e!653516 (= (-!1314 lt!513745 k0!934) lt!513740))))

(declare-fun b!1148961 () Bool)

(declare-fun res!764495 () Bool)

(assert (=> b!1148961 (=> (not res!764495) (not e!653523))))

(assert (=> b!1148961 (= res!764495 (= (select (arr!35907 _keys!1208) i!673) k0!934))))

(declare-fun b!1148962 () Bool)

(declare-fun res!764493 () Bool)

(assert (=> b!1148962 (=> (not res!764493) (not e!653523))))

(assert (=> b!1148962 (= res!764493 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25107))))

(declare-fun bm!53178 () Bool)

(declare-fun call!53181 () Unit!37764)

(declare-fun call!53183 () Unit!37764)

(assert (=> bm!53178 (= call!53181 call!53183)))

(declare-fun b!1148963 () Bool)

(assert (=> b!1148963 (= e!653524 (= call!53179 (-!1314 call!53178 k0!934)))))

(declare-fun b!1148964 () Bool)

(declare-fun lt!513748 () Bool)

(assert (=> b!1148964 (= e!653513 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513748) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148965 () Bool)

(declare-fun e!653518 () Unit!37764)

(declare-fun e!653517 () Unit!37764)

(assert (=> b!1148965 (= e!653518 e!653517)))

(declare-fun c!113586 () Bool)

(assert (=> b!1148965 (= c!113586 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513748))))

(declare-fun bm!53179 () Bool)

(declare-fun addStillContains!851 (ListLongMap!16327 (_ BitVec 64) V!43571 (_ BitVec 64)) Unit!37764)

(assert (=> bm!53179 (= call!53183 (addStillContains!851 lt!513740 (ite (or c!113590 c!113589) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113590 c!113589) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1148966 () Bool)

(declare-fun e!653510 () Bool)

(declare-fun tp_is_empty!28833 () Bool)

(assert (=> b!1148966 (= e!653510 tp_is_empty!28833)))

(declare-fun mapIsEmpty!45074 () Bool)

(declare-fun mapRes!45074 () Bool)

(assert (=> mapIsEmpty!45074 mapRes!45074))

(declare-fun bm!53180 () Bool)

(declare-fun lt!513737 () ListLongMap!16327)

(declare-fun call!53182 () Bool)

(assert (=> bm!53180 (= call!53182 (contains!6702 (ite c!113590 lt!513737 call!53185) k0!934))))

(declare-fun b!1148967 () Bool)

(assert (=> b!1148967 (= e!653519 e!653521)))

(declare-fun res!764489 () Bool)

(assert (=> b!1148967 (=> res!764489 e!653521)))

(assert (=> b!1148967 (= res!764489 (not (= from!1455 i!673)))))

(declare-fun lt!513751 () ListLongMap!16327)

(declare-fun lt!513752 () array!74515)

(assert (=> b!1148967 (= lt!513751 (getCurrentListMapNoExtraKeys!4652 lt!513744 lt!513752 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1148967 (= lt!513752 (array!74516 (store (arr!35908 _values!996) i!673 (ValueCellFull!13707 lt!513750)) (size!36444 _values!996)))))

(declare-fun dynLambda!2679 (Int (_ BitVec 64)) V!43571)

(assert (=> b!1148967 (= lt!513750 (dynLambda!2679 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1148967 (= lt!513745 (getCurrentListMapNoExtraKeys!4652 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1148968 () Bool)

(declare-fun res!764484 () Bool)

(assert (=> b!1148968 (=> (not res!764484) (not e!653523))))

(assert (=> b!1148968 (= res!764484 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36443 _keys!1208))))))

(declare-fun bm!53181 () Bool)

(assert (=> bm!53181 (= call!53179 (getCurrentListMapNoExtraKeys!4652 lt!513744 lt!513752 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148969 () Bool)

(declare-fun e!653525 () Bool)

(assert (=> b!1148969 (= e!653525 tp_is_empty!28833)))

(declare-fun b!1148970 () Bool)

(assert (=> b!1148970 (= c!113589 (and (not lt!513748) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653526 () Unit!37764)

(assert (=> b!1148970 (= e!653526 e!653518)))

(declare-fun b!1148971 () Bool)

(declare-fun res!764498 () Bool)

(assert (=> b!1148971 (=> (not res!764498) (not e!653523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148971 (= res!764498 (validKeyInArray!0 k0!934))))

(declare-fun b!1148972 () Bool)

(assert (=> b!1148972 (contains!6702 (+!3601 lt!513737 (tuple2!18359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!513736 () Unit!37764)

(assert (=> b!1148972 (= lt!513736 (addStillContains!851 lt!513737 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1148972 call!53182))

(assert (=> b!1148972 (= lt!513737 call!53180)))

(declare-fun lt!513739 () Unit!37764)

(assert (=> b!1148972 (= lt!513739 call!53183)))

(assert (=> b!1148972 (= e!653526 lt!513736)))

(declare-fun b!1148973 () Bool)

(declare-fun Unit!37767 () Unit!37764)

(assert (=> b!1148973 (= e!653517 Unit!37767)))

(declare-fun b!1148974 () Bool)

(assert (=> b!1148974 (= e!653523 e!653522)))

(declare-fun res!764490 () Bool)

(assert (=> b!1148974 (=> (not res!764490) (not e!653522))))

(assert (=> b!1148974 (= res!764490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513744 mask!1564))))

(assert (=> b!1148974 (= lt!513744 (array!74514 (store (arr!35907 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36443 _keys!1208)))))

(declare-fun res!764494 () Bool)

(assert (=> start!98698 (=> (not res!764494) (not e!653523))))

(assert (=> start!98698 (= res!764494 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36443 _keys!1208))))))

(assert (=> start!98698 e!653523))

(assert (=> start!98698 tp_is_empty!28833))

(declare-fun array_inv!27502 (array!74513) Bool)

(assert (=> start!98698 (array_inv!27502 _keys!1208)))

(assert (=> start!98698 true))

(assert (=> start!98698 tp!85619))

(declare-fun e!653515 () Bool)

(declare-fun array_inv!27503 (array!74515) Bool)

(assert (=> start!98698 (and (array_inv!27503 _values!996) e!653515)))

(declare-fun mapNonEmpty!45074 () Bool)

(declare-fun tp!85620 () Bool)

(assert (=> mapNonEmpty!45074 (= mapRes!45074 (and tp!85620 e!653525))))

(declare-fun mapKey!45074 () (_ BitVec 32))

(declare-fun mapRest!45074 () (Array (_ BitVec 32) ValueCell!13707))

(declare-fun mapValue!45074 () ValueCell!13707)

(assert (=> mapNonEmpty!45074 (= (arr!35908 _values!996) (store mapRest!45074 mapKey!45074 mapValue!45074))))

(declare-fun bm!53182 () Bool)

(declare-fun call!53184 () Bool)

(assert (=> bm!53182 (= call!53184 call!53182)))

(declare-fun b!1148975 () Bool)

(declare-fun Unit!37768 () Unit!37764)

(assert (=> b!1148975 (= e!653511 Unit!37768)))

(assert (=> b!1148975 (= lt!513748 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148975 (= c!113590 (and (not lt!513748) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513746 () Unit!37764)

(assert (=> b!1148975 (= lt!513746 e!653526)))

(declare-fun lt!513756 () Unit!37764)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!446 (array!74513 array!74515 (_ BitVec 32) (_ BitVec 32) V!43571 V!43571 (_ BitVec 64) (_ BitVec 32) Int) Unit!37764)

(assert (=> b!1148975 (= lt!513756 (lemmaListMapContainsThenArrayContainsFrom!446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113588 () Bool)

(assert (=> b!1148975 (= c!113588 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764485 () Bool)

(assert (=> b!1148975 (= res!764485 e!653513)))

(assert (=> b!1148975 (=> (not res!764485) (not e!653512))))

(assert (=> b!1148975 e!653512))

(declare-fun lt!513749 () Unit!37764)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74513 (_ BitVec 32) (_ BitVec 32)) Unit!37764)

(assert (=> b!1148975 (= lt!513749 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148975 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25107)))

(declare-fun lt!513753 () Unit!37764)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74513 (_ BitVec 64) (_ BitVec 32) List!25110) Unit!37764)

(assert (=> b!1148975 (= lt!513753 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25107))))

(assert (=> b!1148975 false))

(declare-fun b!1148976 () Bool)

(assert (=> b!1148976 (= e!653515 (and e!653510 mapRes!45074))))

(declare-fun condMapEmpty!45074 () Bool)

(declare-fun mapDefault!45074 () ValueCell!13707)

(assert (=> b!1148976 (= condMapEmpty!45074 (= (arr!35908 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13707)) mapDefault!45074)))))

(declare-fun b!1148977 () Bool)

(declare-fun res!764487 () Bool)

(assert (=> b!1148977 (=> (not res!764487) (not e!653523))))

(assert (=> b!1148977 (= res!764487 (and (= (size!36444 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36443 _keys!1208) (size!36444 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148978 () Bool)

(assert (=> b!1148978 call!53184))

(declare-fun lt!513741 () Unit!37764)

(assert (=> b!1148978 (= lt!513741 call!53181)))

(assert (=> b!1148978 (= e!653517 lt!513741)))

(declare-fun b!1148979 () Bool)

(declare-fun lt!513755 () Unit!37764)

(assert (=> b!1148979 (= e!653518 lt!513755)))

(assert (=> b!1148979 (= lt!513755 call!53181)))

(assert (=> b!1148979 call!53184))

(assert (= (and start!98698 res!764494) b!1148951))

(assert (= (and b!1148951 res!764492) b!1148977))

(assert (= (and b!1148977 res!764487) b!1148952))

(assert (= (and b!1148952 res!764497) b!1148962))

(assert (= (and b!1148962 res!764493) b!1148968))

(assert (= (and b!1148968 res!764484) b!1148971))

(assert (= (and b!1148971 res!764498) b!1148961))

(assert (= (and b!1148961 res!764495) b!1148974))

(assert (= (and b!1148974 res!764490) b!1148958))

(assert (= (and b!1148958 res!764496) b!1148954))

(assert (= (and b!1148954 (not res!764486)) b!1148967))

(assert (= (and b!1148967 (not res!764489)) b!1148959))

(assert (= (and b!1148959 c!113587) b!1148963))

(assert (= (and b!1148959 (not c!113587)) b!1148955))

(assert (= (or b!1148963 b!1148955) bm!53181))

(assert (= (or b!1148963 b!1148955) bm!53176))

(assert (= (and b!1148959 (not res!764488)) b!1148950))

(assert (= (and b!1148950 c!113585) b!1148975))

(assert (= (and b!1148950 (not c!113585)) b!1148957))

(assert (= (and b!1148975 c!113590) b!1148972))

(assert (= (and b!1148975 (not c!113590)) b!1148970))

(assert (= (and b!1148970 c!113589) b!1148979))

(assert (= (and b!1148970 (not c!113589)) b!1148965))

(assert (= (and b!1148965 c!113586) b!1148978))

(assert (= (and b!1148965 (not c!113586)) b!1148973))

(assert (= (or b!1148979 b!1148978) bm!53178))

(assert (= (or b!1148979 b!1148978) bm!53175))

(assert (= (or b!1148979 b!1148978) bm!53182))

(assert (= (or b!1148972 bm!53182) bm!53180))

(assert (= (or b!1148972 bm!53178) bm!53179))

(assert (= (or b!1148972 bm!53175) bm!53177))

(assert (= (and b!1148975 c!113588) b!1148956))

(assert (= (and b!1148975 (not c!113588)) b!1148964))

(assert (= (and b!1148975 res!764485) b!1148953))

(assert (= (and b!1148950 res!764491) b!1148960))

(assert (= (and b!1148976 condMapEmpty!45074) mapIsEmpty!45074))

(assert (= (and b!1148976 (not condMapEmpty!45074)) mapNonEmpty!45074))

(get-info :version)

(assert (= (and mapNonEmpty!45074 ((_ is ValueCellFull!13707) mapValue!45074)) b!1148969))

(assert (= (and b!1148976 ((_ is ValueCellFull!13707) mapDefault!45074)) b!1148966))

(assert (= start!98698 b!1148976))

(declare-fun b_lambda!19409 () Bool)

(assert (=> (not b_lambda!19409) (not b!1148967)))

(declare-fun t!36403 () Bool)

(declare-fun tb!9115 () Bool)

(assert (=> (and start!98698 (= defaultEntry!1004 defaultEntry!1004) t!36403) tb!9115))

(declare-fun result!18795 () Bool)

(assert (=> tb!9115 (= result!18795 tp_is_empty!28833)))

(assert (=> b!1148967 t!36403))

(declare-fun b_and!39457 () Bool)

(assert (= b_and!39455 (and (=> t!36403 result!18795) b_and!39457)))

(declare-fun m!1059381 () Bool)

(assert (=> b!1148958 m!1059381))

(declare-fun m!1059383 () Bool)

(assert (=> b!1148956 m!1059383))

(declare-fun m!1059385 () Bool)

(assert (=> b!1148951 m!1059385))

(declare-fun m!1059387 () Bool)

(assert (=> mapNonEmpty!45074 m!1059387))

(assert (=> b!1148953 m!1059383))

(declare-fun m!1059389 () Bool)

(assert (=> start!98698 m!1059389))

(declare-fun m!1059391 () Bool)

(assert (=> start!98698 m!1059391))

(declare-fun m!1059393 () Bool)

(assert (=> bm!53177 m!1059393))

(declare-fun m!1059395 () Bool)

(assert (=> b!1148959 m!1059395))

(declare-fun m!1059397 () Bool)

(assert (=> b!1148959 m!1059397))

(declare-fun m!1059399 () Bool)

(assert (=> b!1148950 m!1059399))

(declare-fun m!1059401 () Bool)

(assert (=> b!1148950 m!1059401))

(declare-fun m!1059403 () Bool)

(assert (=> b!1148950 m!1059403))

(declare-fun m!1059405 () Bool)

(assert (=> b!1148950 m!1059405))

(assert (=> b!1148950 m!1059403))

(assert (=> b!1148950 m!1059395))

(declare-fun m!1059407 () Bool)

(assert (=> b!1148950 m!1059407))

(assert (=> b!1148950 m!1059401))

(declare-fun m!1059409 () Bool)

(assert (=> b!1148950 m!1059409))

(assert (=> b!1148950 m!1059395))

(assert (=> b!1148950 m!1059395))

(declare-fun m!1059411 () Bool)

(assert (=> b!1148950 m!1059411))

(declare-fun m!1059413 () Bool)

(assert (=> b!1148961 m!1059413))

(declare-fun m!1059415 () Bool)

(assert (=> b!1148954 m!1059415))

(declare-fun m!1059417 () Bool)

(assert (=> b!1148954 m!1059417))

(declare-fun m!1059419 () Bool)

(assert (=> b!1148967 m!1059419))

(declare-fun m!1059421 () Bool)

(assert (=> b!1148967 m!1059421))

(declare-fun m!1059423 () Bool)

(assert (=> b!1148967 m!1059423))

(declare-fun m!1059425 () Bool)

(assert (=> b!1148967 m!1059425))

(declare-fun m!1059427 () Bool)

(assert (=> b!1148962 m!1059427))

(declare-fun m!1059429 () Bool)

(assert (=> b!1148960 m!1059429))

(declare-fun m!1059431 () Bool)

(assert (=> b!1148975 m!1059431))

(declare-fun m!1059433 () Bool)

(assert (=> b!1148975 m!1059433))

(declare-fun m!1059435 () Bool)

(assert (=> b!1148975 m!1059435))

(declare-fun m!1059437 () Bool)

(assert (=> b!1148975 m!1059437))

(declare-fun m!1059439 () Bool)

(assert (=> b!1148971 m!1059439))

(declare-fun m!1059441 () Bool)

(assert (=> b!1148974 m!1059441))

(declare-fun m!1059443 () Bool)

(assert (=> b!1148974 m!1059443))

(assert (=> bm!53176 m!1059399))

(declare-fun m!1059445 () Bool)

(assert (=> b!1148952 m!1059445))

(declare-fun m!1059447 () Bool)

(assert (=> b!1148972 m!1059447))

(assert (=> b!1148972 m!1059447))

(declare-fun m!1059449 () Bool)

(assert (=> b!1148972 m!1059449))

(declare-fun m!1059451 () Bool)

(assert (=> b!1148972 m!1059451))

(declare-fun m!1059453 () Bool)

(assert (=> bm!53180 m!1059453))

(declare-fun m!1059455 () Bool)

(assert (=> b!1148963 m!1059455))

(declare-fun m!1059457 () Bool)

(assert (=> bm!53179 m!1059457))

(declare-fun m!1059459 () Bool)

(assert (=> bm!53181 m!1059459))

(check-sat (not b!1148963) tp_is_empty!28833 (not b!1148960) (not b_next!24303) (not mapNonEmpty!45074) (not b!1148975) (not b!1148954) (not b!1148959) (not b!1148951) (not b!1148971) (not b!1148962) b_and!39457 (not b!1148950) (not b!1148958) (not b!1148956) (not b!1148972) (not b!1148967) (not b_lambda!19409) (not b!1148974) (not bm!53177) (not bm!53180) (not bm!53179) (not b!1148953) (not b!1148952) (not bm!53181) (not start!98698) (not bm!53176))
(check-sat b_and!39457 (not b_next!24303))
