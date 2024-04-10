; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98892 () Bool)

(assert start!98892)

(declare-fun b_free!24497 () Bool)

(declare-fun b_next!24497 () Bool)

(assert (=> start!98892 (= b_free!24497 (not b_next!24497))))

(declare-fun tp!86201 () Bool)

(declare-fun b_and!39843 () Bool)

(assert (=> start!98892 (= tp!86201 b_and!39843)))

(declare-fun b!1157874 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((V!43829 0))(
  ( (V!43830 (val!14570 Int)) )
))
(declare-datatypes ((tuple2!18542 0))(
  ( (tuple2!18543 (_1!9282 (_ BitVec 64)) (_2!9282 V!43829)) )
))
(declare-datatypes ((List!25282 0))(
  ( (Nil!25279) (Cons!25278 (h!26487 tuple2!18542) (t!36771 List!25282)) )
))
(declare-datatypes ((ListLongMap!16511 0))(
  ( (ListLongMap!16512 (toList!8271 List!25282)) )
))
(declare-fun call!55506 () ListLongMap!16511)

(declare-fun call!55512 () ListLongMap!16511)

(declare-fun e!658473 () Bool)

(declare-fun -!1385 (ListLongMap!16511 (_ BitVec 64)) ListLongMap!16511)

(assert (=> b!1157874 (= e!658473 (= call!55506 (-!1385 call!55512 k!934)))))

(declare-fun b!1157875 () Bool)

(declare-fun res!768852 () Bool)

(declare-fun e!658469 () Bool)

(assert (=> b!1157875 (=> (not res!768852) (not e!658469))))

(declare-datatypes ((array!74897 0))(
  ( (array!74898 (arr!36099 (Array (_ BitVec 32) (_ BitVec 64))) (size!36635 (_ BitVec 32))) )
))
(declare-fun lt!520137 () array!74897)

(declare-datatypes ((List!25283 0))(
  ( (Nil!25280) (Cons!25279 (h!26488 (_ BitVec 64)) (t!36772 List!25283)) )
))
(declare-fun arrayNoDuplicates!0 (array!74897 (_ BitVec 32) List!25283) Bool)

(assert (=> b!1157875 (= res!768852 (arrayNoDuplicates!0 lt!520137 #b00000000000000000000000000000000 Nil!25280))))

(declare-fun b!1157876 () Bool)

(declare-fun e!658458 () Bool)

(declare-fun e!658459 () Bool)

(assert (=> b!1157876 (= e!658458 e!658459)))

(declare-fun res!768863 () Bool)

(assert (=> b!1157876 (=> res!768863 e!658459)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157876 (= res!768863 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43829)

(declare-datatypes ((ValueCell!13804 0))(
  ( (ValueCellFull!13804 (v!17207 V!43829)) (EmptyCell!13804) )
))
(declare-datatypes ((array!74899 0))(
  ( (array!74900 (arr!36100 (Array (_ BitVec 32) ValueCell!13804)) (size!36636 (_ BitVec 32))) )
))
(declare-fun lt!520151 () array!74899)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!520134 () ListLongMap!16511)

(declare-fun minValue!944 () V!43829)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4738 (array!74897 array!74899 (_ BitVec 32) (_ BitVec 32) V!43829 V!43829 (_ BitVec 32) Int) ListLongMap!16511)

(assert (=> b!1157876 (= lt!520134 (getCurrentListMapNoExtraKeys!4738 lt!520137 lt!520151 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520142 () V!43829)

(declare-fun _values!996 () array!74899)

(assert (=> b!1157876 (= lt!520151 (array!74900 (store (arr!36100 _values!996) i!673 (ValueCellFull!13804 lt!520142)) (size!36636 _values!996)))))

(declare-fun dynLambda!2744 (Int (_ BitVec 64)) V!43829)

(assert (=> b!1157876 (= lt!520142 (dynLambda!2744 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74897)

(declare-fun lt!520154 () ListLongMap!16511)

(assert (=> b!1157876 (= lt!520154 (getCurrentListMapNoExtraKeys!4738 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!55503 () Bool)

(declare-fun call!55510 () Bool)

(declare-fun call!55509 () Bool)

(assert (=> bm!55503 (= call!55510 call!55509)))

(declare-fun b!1157877 () Bool)

(declare-fun c!115335 () Bool)

(declare-fun lt!520150 () Bool)

(assert (=> b!1157877 (= c!115335 (and (not lt!520150) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38149 0))(
  ( (Unit!38150) )
))
(declare-fun e!658464 () Unit!38149)

(declare-fun e!658472 () Unit!38149)

(assert (=> b!1157877 (= e!658464 e!658472)))

(declare-fun bm!55504 () Bool)

(declare-fun call!55511 () ListLongMap!16511)

(declare-fun call!55508 () ListLongMap!16511)

(assert (=> bm!55504 (= call!55511 call!55508)))

(declare-fun b!1157878 () Bool)

(assert (=> b!1157878 (= e!658473 (= call!55506 call!55512))))

(declare-fun b!1157879 () Bool)

(assert (=> b!1157879 call!55510))

(declare-fun lt!520144 () Unit!38149)

(declare-fun call!55513 () Unit!38149)

(assert (=> b!1157879 (= lt!520144 call!55513)))

(declare-fun e!658466 () Unit!38149)

(assert (=> b!1157879 (= e!658466 lt!520144)))

(declare-fun mapNonEmpty!45365 () Bool)

(declare-fun mapRes!45365 () Bool)

(declare-fun tp!86202 () Bool)

(declare-fun e!658457 () Bool)

(assert (=> mapNonEmpty!45365 (= mapRes!45365 (and tp!86202 e!658457))))

(declare-fun mapValue!45365 () ValueCell!13804)

(declare-fun mapRest!45365 () (Array (_ BitVec 32) ValueCell!13804))

(declare-fun mapKey!45365 () (_ BitVec 32))

(assert (=> mapNonEmpty!45365 (= (arr!36100 _values!996) (store mapRest!45365 mapKey!45365 mapValue!45365))))

(declare-fun bm!55505 () Bool)

(assert (=> bm!55505 (= call!55506 (getCurrentListMapNoExtraKeys!4738 lt!520137 lt!520151 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157880 () Bool)

(declare-fun e!658462 () Bool)

(assert (=> b!1157880 (= e!658459 e!658462)))

(declare-fun res!768853 () Bool)

(assert (=> b!1157880 (=> res!768853 e!658462)))

(assert (=> b!1157880 (= res!768853 (not (= (select (arr!36099 _keys!1208) from!1455) k!934)))))

(assert (=> b!1157880 e!658473))

(declare-fun c!115336 () Bool)

(assert (=> b!1157880 (= c!115336 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520143 () Unit!38149)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!617 (array!74897 array!74899 (_ BitVec 32) (_ BitVec 32) V!43829 V!43829 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38149)

(assert (=> b!1157880 (= lt!520143 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!617 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!658470 () Bool)

(declare-fun lt!520155 () ListLongMap!16511)

(declare-fun b!1157881 () Bool)

(assert (=> b!1157881 (= e!658470 (= lt!520155 (getCurrentListMapNoExtraKeys!4738 lt!520137 lt!520151 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapIsEmpty!45365 () Bool)

(assert (=> mapIsEmpty!45365 mapRes!45365))

(declare-fun lt!520145 () ListLongMap!16511)

(declare-fun c!115332 () Bool)

(declare-fun bm!55506 () Bool)

(declare-fun contains!6782 (ListLongMap!16511 (_ BitVec 64)) Bool)

(assert (=> bm!55506 (= call!55509 (contains!6782 (ite c!115332 lt!520145 call!55511) k!934))))

(declare-fun b!1157882 () Bool)

(declare-fun Unit!38151 () Unit!38149)

(assert (=> b!1157882 (= e!658466 Unit!38151)))

(declare-fun b!1157883 () Bool)

(declare-fun e!658467 () Bool)

(declare-fun tp_is_empty!29027 () Bool)

(assert (=> b!1157883 (= e!658467 tp_is_empty!29027)))

(declare-fun bm!55507 () Bool)

(assert (=> bm!55507 (= call!55512 (getCurrentListMapNoExtraKeys!4738 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!658465 () Bool)

(declare-fun b!1157884 () Bool)

(declare-fun arrayContainsKey!0 (array!74897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157884 (= e!658465 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157885 () Bool)

(declare-fun e!658461 () Bool)

(assert (=> b!1157885 (= e!658461 e!658469)))

(declare-fun res!768850 () Bool)

(assert (=> b!1157885 (=> (not res!768850) (not e!658469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74897 (_ BitVec 32)) Bool)

(assert (=> b!1157885 (= res!768850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520137 mask!1564))))

(assert (=> b!1157885 (= lt!520137 (array!74898 (store (arr!36099 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36635 _keys!1208)))))

(declare-fun bm!55508 () Bool)

(declare-fun call!55507 () Unit!38149)

(assert (=> bm!55508 (= call!55513 call!55507)))

(declare-fun b!1157886 () Bool)

(declare-fun res!768854 () Bool)

(assert (=> b!1157886 (=> (not res!768854) (not e!658461))))

(assert (=> b!1157886 (= res!768854 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25280))))

(declare-fun b!1157887 () Bool)

(declare-fun e!658468 () Bool)

(assert (=> b!1157887 (= e!658468 (and e!658467 mapRes!45365))))

(declare-fun condMapEmpty!45365 () Bool)

(declare-fun mapDefault!45365 () ValueCell!13804)

