; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99428 () Bool)

(assert start!99428)

(declare-fun b_free!25007 () Bool)

(declare-fun b_next!25007 () Bool)

(assert (=> start!99428 (= b_free!25007 (not b_next!25007))))

(declare-fun tp!87735 () Bool)

(declare-fun b_and!40881 () Bool)

(assert (=> start!99428 (= tp!87735 b_and!40881)))

(declare-fun b!1174161 () Bool)

(declare-fun e!667413 () Bool)

(assert (=> b!1174161 (= e!667413 true)))

(declare-datatypes ((array!75885 0))(
  ( (array!75886 (arr!36592 (Array (_ BitVec 32) (_ BitVec 64))) (size!37128 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75885)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1174161 (not (= (select (arr!36592 _keys!1208) from!1455) k!934))))

(declare-datatypes ((Unit!38731 0))(
  ( (Unit!38732) )
))
(declare-fun lt!529415 () Unit!38731)

(declare-fun e!667414 () Unit!38731)

(assert (=> b!1174161 (= lt!529415 e!667414)))

(declare-fun c!116634 () Bool)

(assert (=> b!1174161 (= c!116634 (= (select (arr!36592 _keys!1208) from!1455) k!934))))

(declare-fun e!667408 () Bool)

(assert (=> b!1174161 e!667408))

(declare-fun res!779729 () Bool)

(assert (=> b!1174161 (=> (not res!779729) (not e!667408))))

(declare-datatypes ((V!44509 0))(
  ( (V!44510 (val!14825 Int)) )
))
(declare-datatypes ((tuple2!18948 0))(
  ( (tuple2!18949 (_1!9485 (_ BitVec 64)) (_2!9485 V!44509)) )
))
(declare-datatypes ((List!25687 0))(
  ( (Nil!25684) (Cons!25683 (h!26892 tuple2!18948) (t!37686 List!25687)) )
))
(declare-datatypes ((ListLongMap!16917 0))(
  ( (ListLongMap!16918 (toList!8474 List!25687)) )
))
(declare-fun lt!529418 () ListLongMap!16917)

(declare-fun lt!529423 () ListLongMap!16917)

(declare-datatypes ((ValueCell!14059 0))(
  ( (ValueCellFull!14059 (v!17463 V!44509)) (EmptyCell!14059) )
))
(declare-datatypes ((array!75887 0))(
  ( (array!75888 (arr!36593 (Array (_ BitVec 32) ValueCell!14059)) (size!37129 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75887)

(declare-fun lt!529416 () V!44509)

(declare-fun +!3792 (ListLongMap!16917 tuple2!18948) ListLongMap!16917)

(declare-fun get!18674 (ValueCell!14059 V!44509) V!44509)

(assert (=> b!1174161 (= res!779729 (= lt!529423 (+!3792 lt!529418 (tuple2!18949 (select (arr!36592 _keys!1208) from!1455) (get!18674 (select (arr!36593 _values!996) from!1455) lt!529416)))))))

(declare-fun b!1174162 () Bool)

(declare-fun Unit!38733 () Unit!38731)

(assert (=> b!1174162 (= e!667414 Unit!38733)))

(declare-fun b!1174163 () Bool)

(declare-fun e!667409 () Bool)

(declare-fun e!667404 () Bool)

(assert (=> b!1174163 (= e!667409 (not e!667404))))

(declare-fun res!779724 () Bool)

(assert (=> b!1174163 (=> res!779724 e!667404)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174163 (= res!779724 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174163 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!529422 () Unit!38731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75885 (_ BitVec 64) (_ BitVec 32)) Unit!38731)

(assert (=> b!1174163 (= lt!529422 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!46133 () Bool)

(declare-fun mapRes!46133 () Bool)

(assert (=> mapIsEmpty!46133 mapRes!46133))

(declare-fun b!1174164 () Bool)

(declare-fun e!667410 () Bool)

(assert (=> b!1174164 (= e!667410 e!667413)))

(declare-fun res!779730 () Bool)

(assert (=> b!1174164 (=> res!779730 e!667413)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174164 (= res!779730 (not (validKeyInArray!0 (select (arr!36592 _keys!1208) from!1455))))))

(declare-fun lt!529421 () ListLongMap!16917)

(assert (=> b!1174164 (= lt!529421 lt!529418)))

(declare-fun lt!529427 () ListLongMap!16917)

(declare-fun -!1535 (ListLongMap!16917 (_ BitVec 64)) ListLongMap!16917)

(assert (=> b!1174164 (= lt!529418 (-!1535 lt!529427 k!934))))

(declare-fun zeroValue!944 () V!44509)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529428 () array!75885)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!529425 () array!75887)

(declare-fun minValue!944 () V!44509)

(declare-fun getCurrentListMapNoExtraKeys!4935 (array!75885 array!75887 (_ BitVec 32) (_ BitVec 32) V!44509 V!44509 (_ BitVec 32) Int) ListLongMap!16917)

(assert (=> b!1174164 (= lt!529421 (getCurrentListMapNoExtraKeys!4935 lt!529428 lt!529425 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174164 (= lt!529427 (getCurrentListMapNoExtraKeys!4935 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529424 () Unit!38731)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!762 (array!75885 array!75887 (_ BitVec 32) (_ BitVec 32) V!44509 V!44509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38731)

(assert (=> b!1174164 (= lt!529424 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!762 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174165 () Bool)

(declare-fun e!667405 () Bool)

(declare-fun tp_is_empty!29537 () Bool)

(assert (=> b!1174165 (= e!667405 tp_is_empty!29537)))

(declare-fun b!1174167 () Bool)

(declare-fun res!779721 () Bool)

(declare-fun e!667411 () Bool)

(assert (=> b!1174167 (=> (not res!779721) (not e!667411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75885 (_ BitVec 32)) Bool)

(assert (=> b!1174167 (= res!779721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174168 () Bool)

(declare-fun res!779722 () Bool)

(assert (=> b!1174168 (=> (not res!779722) (not e!667411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174168 (= res!779722 (validMask!0 mask!1564))))

(declare-fun e!667406 () Bool)

(declare-fun b!1174169 () Bool)

(assert (=> b!1174169 (= e!667406 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1174170 () Bool)

(declare-fun res!779728 () Bool)

(assert (=> b!1174170 (=> (not res!779728) (not e!667411))))

(assert (=> b!1174170 (= res!779728 (and (= (size!37129 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37128 _keys!1208) (size!37129 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174171 () Bool)

(assert (=> b!1174171 (= e!667411 e!667409)))

(declare-fun res!779718 () Bool)

(assert (=> b!1174171 (=> (not res!779718) (not e!667409))))

(assert (=> b!1174171 (= res!779718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529428 mask!1564))))

(assert (=> b!1174171 (= lt!529428 (array!75886 (store (arr!36592 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37128 _keys!1208)))))

(declare-fun b!1174172 () Bool)

(declare-fun e!667412 () Bool)

(declare-fun e!667403 () Bool)

(assert (=> b!1174172 (= e!667412 (and e!667403 mapRes!46133))))

(declare-fun condMapEmpty!46133 () Bool)

(declare-fun mapDefault!46133 () ValueCell!14059)

