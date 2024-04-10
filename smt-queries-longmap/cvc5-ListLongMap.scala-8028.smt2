; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99008 () Bool)

(assert start!99008)

(declare-fun b_free!24613 () Bool)

(declare-fun b_next!24613 () Bool)

(assert (=> start!99008 (= b_free!24613 (not b_next!24613))))

(declare-fun tp!86550 () Bool)

(declare-fun b_and!40075 () Bool)

(assert (=> start!99008 (= tp!86550 b_and!40075)))

(declare-fun b!1163210 () Bool)

(declare-fun res!771461 () Bool)

(declare-fun e!661417 () Bool)

(assert (=> b!1163210 (=> (not res!771461) (not e!661417))))

(declare-datatypes ((array!75125 0))(
  ( (array!75126 (arr!36213 (Array (_ BitVec 32) (_ BitVec 64))) (size!36749 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75125)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1163210 (= res!771461 (= (select (arr!36213 _keys!1208) i!673) k!934))))

(declare-fun bm!56895 () Bool)

(declare-datatypes ((Unit!38387 0))(
  ( (Unit!38388) )
))
(declare-fun call!56899 () Unit!38387)

(declare-fun call!56901 () Unit!38387)

(assert (=> bm!56895 (= call!56899 call!56901)))

(declare-fun mapNonEmpty!45539 () Bool)

(declare-fun mapRes!45539 () Bool)

(declare-fun tp!86549 () Bool)

(declare-fun e!661429 () Bool)

(assert (=> mapNonEmpty!45539 (= mapRes!45539 (and tp!86549 e!661429))))

(declare-fun mapKey!45539 () (_ BitVec 32))

(declare-datatypes ((V!43985 0))(
  ( (V!43986 (val!14628 Int)) )
))
(declare-datatypes ((ValueCell!13862 0))(
  ( (ValueCellFull!13862 (v!17265 V!43985)) (EmptyCell!13862) )
))
(declare-fun mapValue!45539 () ValueCell!13862)

(declare-fun mapRest!45539 () (Array (_ BitVec 32) ValueCell!13862))

(declare-datatypes ((array!75127 0))(
  ( (array!75128 (arr!36214 (Array (_ BitVec 32) ValueCell!13862)) (size!36750 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75127)

(assert (=> mapNonEmpty!45539 (= (arr!36214 _values!996) (store mapRest!45539 mapKey!45539 mapValue!45539))))

(declare-fun b!1163211 () Bool)

(declare-fun e!661425 () Bool)

(declare-fun e!661427 () Bool)

(assert (=> b!1163211 (= e!661425 (not e!661427))))

(declare-fun res!771472 () Bool)

(assert (=> b!1163211 (=> res!771472 e!661427)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1163211 (= res!771472 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163211 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!523972 () Unit!38387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75125 (_ BitVec 64) (_ BitVec 32)) Unit!38387)

(assert (=> b!1163211 (= lt!523972 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun zeroValue!944 () V!43985)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18652 0))(
  ( (tuple2!18653 (_1!9337 (_ BitVec 64)) (_2!9337 V!43985)) )
))
(declare-datatypes ((List!25385 0))(
  ( (Nil!25382) (Cons!25381 (h!26590 tuple2!18652) (t!36990 List!25385)) )
))
(declare-datatypes ((ListLongMap!16621 0))(
  ( (ListLongMap!16622 (toList!8326 List!25385)) )
))
(declare-fun call!56903 () ListLongMap!16621)

(declare-fun bm!56896 () Bool)

(declare-fun minValue!944 () V!43985)

(declare-fun getCurrentListMapNoExtraKeys!4790 (array!75125 array!75127 (_ BitVec 32) (_ BitVec 32) V!43985 V!43985 (_ BitVec 32) Int) ListLongMap!16621)

(assert (=> bm!56896 (= call!56903 (getCurrentListMapNoExtraKeys!4790 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163212 () Bool)

(declare-fun res!771473 () Bool)

(assert (=> b!1163212 (=> (not res!771473) (not e!661425))))

(declare-fun lt!523969 () array!75125)

(declare-datatypes ((List!25386 0))(
  ( (Nil!25383) (Cons!25382 (h!26591 (_ BitVec 64)) (t!36991 List!25386)) )
))
(declare-fun arrayNoDuplicates!0 (array!75125 (_ BitVec 32) List!25386) Bool)

(assert (=> b!1163212 (= res!771473 (arrayNoDuplicates!0 lt!523969 #b00000000000000000000000000000000 Nil!25383))))

(declare-fun bm!56897 () Bool)

(declare-fun call!56905 () ListLongMap!16621)

(declare-fun call!56902 () ListLongMap!16621)

(assert (=> bm!56897 (= call!56905 call!56902)))

(declare-fun b!1163213 () Bool)

(declare-fun e!661419 () Bool)

(assert (=> b!1163213 (= e!661419 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!771464 () Bool)

(assert (=> start!99008 (=> (not res!771464) (not e!661417))))

(assert (=> start!99008 (= res!771464 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36749 _keys!1208))))))

(assert (=> start!99008 e!661417))

(declare-fun tp_is_empty!29143 () Bool)

(assert (=> start!99008 tp_is_empty!29143))

(declare-fun array_inv!27710 (array!75125) Bool)

(assert (=> start!99008 (array_inv!27710 _keys!1208)))

(assert (=> start!99008 true))

(assert (=> start!99008 tp!86550))

(declare-fun e!661431 () Bool)

(declare-fun array_inv!27711 (array!75127) Bool)

(assert (=> start!99008 (and (array_inv!27711 _values!996) e!661431)))

(declare-fun b!1163214 () Bool)

(declare-fun res!771465 () Bool)

(assert (=> b!1163214 (=> (not res!771465) (not e!661417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163214 (= res!771465 (validKeyInArray!0 k!934))))

(declare-fun e!661422 () Bool)

(declare-fun b!1163215 () Bool)

(declare-fun lt!523974 () Bool)

(assert (=> b!1163215 (= e!661422 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523974) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163216 () Bool)

(assert (=> b!1163216 (= e!661429 tp_is_empty!29143)))

(declare-fun mapIsEmpty!45539 () Bool)

(assert (=> mapIsEmpty!45539 mapRes!45539))

(declare-fun b!1163217 () Bool)

(declare-fun res!771469 () Bool)

(assert (=> b!1163217 (=> (not res!771469) (not e!661417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75125 (_ BitVec 32)) Bool)

(assert (=> b!1163217 (= res!771469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163218 () Bool)

(declare-fun e!661416 () Unit!38387)

(declare-fun e!661426 () Unit!38387)

(assert (=> b!1163218 (= e!661416 e!661426)))

(declare-fun c!116377 () Bool)

(assert (=> b!1163218 (= c!116377 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523974))))

(declare-fun bm!56898 () Bool)

(declare-fun call!56898 () Bool)

(declare-fun call!56904 () Bool)

(assert (=> bm!56898 (= call!56898 call!56904)))

(declare-fun b!1163219 () Bool)

(declare-fun e!661421 () Unit!38387)

(declare-fun Unit!38389 () Unit!38387)

(assert (=> b!1163219 (= e!661421 Unit!38389)))

(declare-fun b!1163220 () Bool)

(declare-fun e!661428 () Bool)

(assert (=> b!1163220 (= e!661428 true)))

(declare-fun e!661420 () Bool)

(assert (=> b!1163220 e!661420))

(declare-fun res!771468 () Bool)

(assert (=> b!1163220 (=> (not res!771468) (not e!661420))))

(declare-fun lt!523973 () ListLongMap!16621)

(declare-fun lt!523979 () ListLongMap!16621)

(assert (=> b!1163220 (= res!771468 (= lt!523973 lt!523979))))

(declare-fun lt!523975 () ListLongMap!16621)

(declare-fun -!1430 (ListLongMap!16621 (_ BitVec 64)) ListLongMap!16621)

(assert (=> b!1163220 (= lt!523973 (-!1430 lt!523975 k!934))))

(declare-fun lt!523965 () V!43985)

(declare-fun +!3729 (ListLongMap!16621 tuple2!18652) ListLongMap!16621)

(assert (=> b!1163220 (= (-!1430 (+!3729 lt!523979 (tuple2!18653 (select (arr!36213 _keys!1208) from!1455) lt!523965)) (select (arr!36213 _keys!1208) from!1455)) lt!523979)))

(declare-fun lt!523968 () Unit!38387)

(declare-fun addThenRemoveForNewKeyIsSame!263 (ListLongMap!16621 (_ BitVec 64) V!43985) Unit!38387)

(assert (=> b!1163220 (= lt!523968 (addThenRemoveForNewKeyIsSame!263 lt!523979 (select (arr!36213 _keys!1208) from!1455) lt!523965))))

(declare-fun lt!523983 () V!43985)

(declare-fun get!18481 (ValueCell!13862 V!43985) V!43985)

(assert (=> b!1163220 (= lt!523965 (get!18481 (select (arr!36214 _values!996) from!1455) lt!523983))))

(declare-fun lt!523966 () Unit!38387)

(assert (=> b!1163220 (= lt!523966 e!661421)))

(declare-fun c!116378 () Bool)

(declare-fun contains!6830 (ListLongMap!16621 (_ BitVec 64)) Bool)

(assert (=> b!1163220 (= c!116378 (contains!6830 lt!523979 k!934))))

(assert (=> b!1163220 (= lt!523979 (getCurrentListMapNoExtraKeys!4790 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163221 () Bool)

(declare-fun e!661423 () Bool)

(assert (=> b!1163221 (= e!661431 (and e!661423 mapRes!45539))))

(declare-fun condMapEmpty!45539 () Bool)

(declare-fun mapDefault!45539 () ValueCell!13862)

