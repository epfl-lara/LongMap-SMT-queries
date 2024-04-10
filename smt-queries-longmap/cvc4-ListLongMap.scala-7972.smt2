; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98676 () Bool)

(assert start!98676)

(declare-fun b_free!24281 () Bool)

(declare-fun b_next!24281 () Bool)

(assert (=> start!98676 (= b_free!24281 (not b_next!24281))))

(declare-fun tp!85553 () Bool)

(declare-fun b_and!39411 () Bool)

(assert (=> start!98676 (= tp!85553 b_and!39411)))

(declare-fun b!1147938 () Bool)

(declare-datatypes ((Unit!37714 0))(
  ( (Unit!37715) )
))
(declare-fun e!652956 () Unit!37714)

(declare-fun lt!513059 () Unit!37714)

(assert (=> b!1147938 (= e!652956 lt!513059)))

(declare-fun call!52921 () Unit!37714)

(assert (=> b!1147938 (= lt!513059 call!52921)))

(declare-fun call!52918 () Bool)

(assert (=> b!1147938 call!52918))

(declare-fun res!763991 () Bool)

(declare-fun e!652959 () Bool)

(assert (=> start!98676 (=> (not res!763991) (not e!652959))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74469 0))(
  ( (array!74470 (arr!35885 (Array (_ BitVec 32) (_ BitVec 64))) (size!36421 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74469)

(assert (=> start!98676 (= res!763991 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36421 _keys!1208))))))

(assert (=> start!98676 e!652959))

(declare-fun tp_is_empty!28811 () Bool)

(assert (=> start!98676 tp_is_empty!28811))

(declare-fun array_inv!27486 (array!74469) Bool)

(assert (=> start!98676 (array_inv!27486 _keys!1208)))

(assert (=> start!98676 true))

(assert (=> start!98676 tp!85553))

(declare-datatypes ((V!43541 0))(
  ( (V!43542 (val!14462 Int)) )
))
(declare-datatypes ((ValueCell!13696 0))(
  ( (ValueCellFull!13696 (v!17099 V!43541)) (EmptyCell!13696) )
))
(declare-datatypes ((array!74471 0))(
  ( (array!74472 (arr!35886 (Array (_ BitVec 32) ValueCell!13696)) (size!36422 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74471)

(declare-fun e!652962 () Bool)

(declare-fun array_inv!27487 (array!74471) Bool)

(assert (=> start!98676 (and (array_inv!27487 _values!996) e!652962)))

(declare-fun bm!52911 () Bool)

(declare-fun call!52916 () Unit!37714)

(assert (=> bm!52911 (= call!52921 call!52916)))

(declare-fun b!1147939 () Bool)

(declare-fun res!763989 () Bool)

(assert (=> b!1147939 (=> (not res!763989) (not e!652959))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147939 (= res!763989 (validMask!0 mask!1564))))

(declare-fun b!1147940 () Bool)

(declare-fun e!652965 () Bool)

(declare-fun e!652952 () Bool)

(assert (=> b!1147940 (= e!652965 e!652952)))

(declare-fun res!763997 () Bool)

(assert (=> b!1147940 (=> res!763997 e!652952)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1147940 (= res!763997 (not (= (select (arr!35885 _keys!1208) from!1455) k!934)))))

(declare-fun e!652949 () Bool)

(assert (=> b!1147940 e!652949))

(declare-fun c!113388 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147940 (= c!113388 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43541)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!513061 () Unit!37714)

(declare-fun minValue!944 () V!43541)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!541 (array!74469 array!74471 (_ BitVec 32) (_ BitVec 32) V!43541 V!43541 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37714)

(assert (=> b!1147940 (= lt!513061 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!541 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45041 () Bool)

(declare-fun mapRes!45041 () Bool)

(assert (=> mapIsEmpty!45041 mapRes!45041))

(declare-fun bm!52912 () Bool)

(declare-fun call!52917 () Bool)

(assert (=> bm!52912 (= call!52918 call!52917)))

(declare-fun b!1147941 () Bool)

(declare-fun res!763995 () Bool)

(assert (=> b!1147941 (=> (not res!763995) (not e!652959))))

(assert (=> b!1147941 (= res!763995 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36421 _keys!1208))))))

(declare-fun b!1147942 () Bool)

(declare-fun e!652957 () Bool)

(assert (=> b!1147942 (= e!652957 e!652965)))

(declare-fun res!763992 () Bool)

(assert (=> b!1147942 (=> res!763992 e!652965)))

(assert (=> b!1147942 (= res!763992 (not (= from!1455 i!673)))))

(declare-fun lt!513060 () array!74469)

(declare-datatypes ((tuple2!18336 0))(
  ( (tuple2!18337 (_1!9179 (_ BitVec 64)) (_2!9179 V!43541)) )
))
(declare-datatypes ((List!25087 0))(
  ( (Nil!25084) (Cons!25083 (h!26292 tuple2!18336) (t!36360 List!25087)) )
))
(declare-datatypes ((ListLongMap!16305 0))(
  ( (ListLongMap!16306 (toList!8168 List!25087)) )
))
(declare-fun lt!513043 () ListLongMap!16305)

(declare-fun lt!513063 () array!74471)

(declare-fun getCurrentListMapNoExtraKeys!4642 (array!74469 array!74471 (_ BitVec 32) (_ BitVec 32) V!43541 V!43541 (_ BitVec 32) Int) ListLongMap!16305)

(assert (=> b!1147942 (= lt!513043 (getCurrentListMapNoExtraKeys!4642 lt!513060 lt!513063 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513045 () V!43541)

(assert (=> b!1147942 (= lt!513063 (array!74472 (store (arr!35886 _values!996) i!673 (ValueCellFull!13696 lt!513045)) (size!36422 _values!996)))))

(declare-fun dynLambda!2672 (Int (_ BitVec 64)) V!43541)

(assert (=> b!1147942 (= lt!513045 (dynLambda!2672 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!513048 () ListLongMap!16305)

(assert (=> b!1147942 (= lt!513048 (getCurrentListMapNoExtraKeys!4642 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147943 () Bool)

(declare-fun res!764000 () Bool)

(declare-fun e!652951 () Bool)

(assert (=> b!1147943 (=> (not res!764000) (not e!652951))))

(declare-datatypes ((List!25088 0))(
  ( (Nil!25085) (Cons!25084 (h!26293 (_ BitVec 64)) (t!36361 List!25088)) )
))
(declare-fun arrayNoDuplicates!0 (array!74469 (_ BitVec 32) List!25088) Bool)

(assert (=> b!1147943 (= res!764000 (arrayNoDuplicates!0 lt!513060 #b00000000000000000000000000000000 Nil!25085))))

(declare-fun mapNonEmpty!45041 () Bool)

(declare-fun tp!85554 () Bool)

(declare-fun e!652960 () Bool)

(assert (=> mapNonEmpty!45041 (= mapRes!45041 (and tp!85554 e!652960))))

(declare-fun mapRest!45041 () (Array (_ BitVec 32) ValueCell!13696))

(declare-fun mapValue!45041 () ValueCell!13696)

(declare-fun mapKey!45041 () (_ BitVec 32))

(assert (=> mapNonEmpty!45041 (= (arr!35886 _values!996) (store mapRest!45041 mapKey!45041 mapValue!45041))))

(declare-fun b!1147944 () Bool)

(declare-fun e!652954 () Bool)

(assert (=> b!1147944 (= e!652954 tp_is_empty!28811)))

(declare-fun b!1147945 () Bool)

(declare-fun res!764002 () Bool)

(assert (=> b!1147945 (=> (not res!764002) (not e!652959))))

(assert (=> b!1147945 (= res!764002 (= (select (arr!35885 _keys!1208) i!673) k!934))))

(declare-fun b!1147946 () Bool)

(assert (=> b!1147946 (= e!652951 (not e!652957))))

(declare-fun res!763990 () Bool)

(assert (=> b!1147946 (=> res!763990 e!652957)))

(assert (=> b!1147946 (= res!763990 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147946 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!513053 () Unit!37714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74469 (_ BitVec 64) (_ BitVec 32)) Unit!37714)

(assert (=> b!1147946 (= lt!513053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1147947 () Bool)

(declare-fun res!763994 () Bool)

(assert (=> b!1147947 (=> (not res!763994) (not e!652959))))

(assert (=> b!1147947 (= res!763994 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25085))))

(declare-fun e!652963 () Bool)

(declare-fun b!1147948 () Bool)

(assert (=> b!1147948 (= e!652963 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147949 () Bool)

(declare-fun e!652964 () Unit!37714)

(declare-fun Unit!37716 () Unit!37714)

(assert (=> b!1147949 (= e!652964 Unit!37716)))

(declare-fun lt!513058 () Bool)

(assert (=> b!1147949 (= lt!513058 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113391 () Bool)

(assert (=> b!1147949 (= c!113391 (and (not lt!513058) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513044 () Unit!37714)

(declare-fun e!652961 () Unit!37714)

(assert (=> b!1147949 (= lt!513044 e!652961)))

(declare-fun lt!513046 () Unit!37714)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!436 (array!74469 array!74471 (_ BitVec 32) (_ BitVec 32) V!43541 V!43541 (_ BitVec 64) (_ BitVec 32) Int) Unit!37714)

(assert (=> b!1147949 (= lt!513046 (lemmaListMapContainsThenArrayContainsFrom!436 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113389 () Bool)

(assert (=> b!1147949 (= c!113389 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763998 () Bool)

(assert (=> b!1147949 (= res!763998 e!652963)))

(declare-fun e!652955 () Bool)

(assert (=> b!1147949 (=> (not res!763998) (not e!652955))))

(assert (=> b!1147949 e!652955))

(declare-fun lt!513049 () Unit!37714)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74469 (_ BitVec 32) (_ BitVec 32)) Unit!37714)

(assert (=> b!1147949 (= lt!513049 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1147949 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25085)))

(declare-fun lt!513054 () Unit!37714)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74469 (_ BitVec 64) (_ BitVec 32) List!25088) Unit!37714)

(assert (=> b!1147949 (= lt!513054 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25085))))

(assert (=> b!1147949 false))

(declare-fun b!1147950 () Bool)

(assert (=> b!1147950 (= e!652959 e!652951)))

(declare-fun res!764003 () Bool)

(assert (=> b!1147950 (=> (not res!764003) (not e!652951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74469 (_ BitVec 32)) Bool)

(assert (=> b!1147950 (= res!764003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513060 mask!1564))))

(assert (=> b!1147950 (= lt!513060 (array!74470 (store (arr!35885 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36421 _keys!1208)))))

(declare-fun b!1147951 () Bool)

(declare-fun Unit!37717 () Unit!37714)

(assert (=> b!1147951 (= e!652964 Unit!37717)))

(declare-fun b!1147952 () Bool)

(assert (=> b!1147952 (= e!652960 tp_is_empty!28811)))

(declare-fun b!1147953 () Bool)

(declare-fun call!52915 () ListLongMap!16305)

(declare-fun contains!6691 (ListLongMap!16305 (_ BitVec 64)) Bool)

(assert (=> b!1147953 (contains!6691 call!52915 k!934)))

(declare-fun lt!513056 () ListLongMap!16305)

(declare-fun lt!513062 () Unit!37714)

(declare-fun addStillContains!842 (ListLongMap!16305 (_ BitVec 64) V!43541 (_ BitVec 64)) Unit!37714)

(assert (=> b!1147953 (= lt!513062 (addStillContains!842 lt!513056 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1147953 call!52917))

(declare-fun lt!513052 () ListLongMap!16305)

(declare-fun +!3591 (ListLongMap!16305 tuple2!18336) ListLongMap!16305)

(assert (=> b!1147953 (= lt!513056 (+!3591 lt!513052 (tuple2!18337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513050 () Unit!37714)

(assert (=> b!1147953 (= lt!513050 call!52916)))

(assert (=> b!1147953 (= e!652961 lt!513062)))

(declare-fun call!52919 () ListLongMap!16305)

(declare-fun bm!52913 () Bool)

(assert (=> bm!52913 (= call!52919 (getCurrentListMapNoExtraKeys!4642 lt!513060 lt!513063 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147954 () Bool)

(assert (=> b!1147954 (= e!652962 (and e!652954 mapRes!45041))))

(declare-fun condMapEmpty!45041 () Bool)

(declare-fun mapDefault!45041 () ValueCell!13696)

