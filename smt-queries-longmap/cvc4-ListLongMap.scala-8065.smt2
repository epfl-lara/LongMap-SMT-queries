; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99234 () Bool)

(assert start!99234)

(declare-fun b_free!24839 () Bool)

(declare-fun b_next!24839 () Bool)

(assert (=> start!99234 (= b_free!24839 (not b_next!24839))))

(declare-fun tp!87227 () Bool)

(declare-fun b_and!40527 () Bool)

(assert (=> start!99234 (= tp!87227 b_and!40527)))

(declare-fun b!1168805 () Bool)

(declare-fun res!775516 () Bool)

(declare-fun e!664262 () Bool)

(assert (=> b!1168805 (=> (not res!775516) (not e!664262))))

(declare-datatypes ((array!75559 0))(
  ( (array!75560 (arr!36430 (Array (_ BitVec 32) (_ BitVec 64))) (size!36966 (_ BitVec 32))) )
))
(declare-fun lt!526256 () array!75559)

(declare-datatypes ((List!25556 0))(
  ( (Nil!25553) (Cons!25552 (h!26761 (_ BitVec 64)) (t!37387 List!25556)) )
))
(declare-fun arrayNoDuplicates!0 (array!75559 (_ BitVec 32) List!25556) Bool)

(assert (=> b!1168805 (= res!775516 (arrayNoDuplicates!0 lt!526256 #b00000000000000000000000000000000 Nil!25553))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun _keys!1208 () array!75559)

(declare-fun b!1168806 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!664266 () Bool)

(assert (=> b!1168806 (= e!664266 (or (not (= (select (arr!36430 _keys!1208) from!1455) k!934)) (bvslt (size!36966 _keys!1208) #b01111111111111111111111111111111)))))

(declare-datatypes ((V!44285 0))(
  ( (V!44286 (val!14741 Int)) )
))
(declare-datatypes ((tuple2!18818 0))(
  ( (tuple2!18819 (_1!9420 (_ BitVec 64)) (_2!9420 V!44285)) )
))
(declare-datatypes ((List!25557 0))(
  ( (Nil!25554) (Cons!25553 (h!26762 tuple2!18818) (t!37388 List!25557)) )
))
(declare-datatypes ((ListLongMap!16787 0))(
  ( (ListLongMap!16788 (toList!8409 List!25557)) )
))
(declare-fun lt!526257 () ListLongMap!16787)

(declare-datatypes ((ValueCell!13975 0))(
  ( (ValueCellFull!13975 (v!17378 V!44285)) (EmptyCell!13975) )
))
(declare-datatypes ((array!75561 0))(
  ( (array!75562 (arr!36431 (Array (_ BitVec 32) ValueCell!13975)) (size!36967 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75561)

(declare-fun lt!526255 () ListLongMap!16787)

(declare-fun lt!526251 () V!44285)

(declare-fun +!3743 (ListLongMap!16787 tuple2!18818) ListLongMap!16787)

(declare-fun get!18567 (ValueCell!13975 V!44285) V!44285)

(assert (=> b!1168806 (= lt!526255 (+!3743 lt!526257 (tuple2!18819 (select (arr!36430 _keys!1208) from!1455) (get!18567 (select (arr!36431 _values!996) from!1455) lt!526251))))))

(declare-fun b!1168807 () Bool)

(declare-fun res!775523 () Bool)

(declare-fun e!664268 () Bool)

(assert (=> b!1168807 (=> (not res!775523) (not e!664268))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75559 (_ BitVec 32)) Bool)

(assert (=> b!1168807 (= res!775523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168808 () Bool)

(declare-fun e!664264 () Bool)

(assert (=> b!1168808 (= e!664264 e!664266)))

(declare-fun res!775517 () Bool)

(assert (=> b!1168808 (=> res!775517 e!664266)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168808 (= res!775517 (not (validKeyInArray!0 (select (arr!36430 _keys!1208) from!1455))))))

(declare-fun lt!526252 () ListLongMap!16787)

(assert (=> b!1168808 (= lt!526252 lt!526257)))

(declare-fun lt!526249 () ListLongMap!16787)

(declare-fun -!1481 (ListLongMap!16787 (_ BitVec 64)) ListLongMap!16787)

(assert (=> b!1168808 (= lt!526257 (-!1481 lt!526249 k!934))))

(declare-fun zeroValue!944 () V!44285)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44285)

(declare-fun lt!526253 () array!75561)

(declare-fun getCurrentListMapNoExtraKeys!4873 (array!75559 array!75561 (_ BitVec 32) (_ BitVec 32) V!44285 V!44285 (_ BitVec 32) Int) ListLongMap!16787)

(assert (=> b!1168808 (= lt!526252 (getCurrentListMapNoExtraKeys!4873 lt!526256 lt!526253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1168808 (= lt!526249 (getCurrentListMapNoExtraKeys!4873 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38570 0))(
  ( (Unit!38571) )
))
(declare-fun lt!526254 () Unit!38570)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!708 (array!75559 array!75561 (_ BitVec 32) (_ BitVec 32) V!44285 V!44285 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38570)

(assert (=> b!1168808 (= lt!526254 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!708 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168809 () Bool)

(declare-fun e!664261 () Bool)

(assert (=> b!1168809 (= e!664261 e!664264)))

(declare-fun res!775514 () Bool)

(assert (=> b!1168809 (=> res!775514 e!664264)))

(assert (=> b!1168809 (= res!775514 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1168809 (= lt!526255 (getCurrentListMapNoExtraKeys!4873 lt!526256 lt!526253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1168809 (= lt!526253 (array!75562 (store (arr!36431 _values!996) i!673 (ValueCellFull!13975 lt!526251)) (size!36967 _values!996)))))

(declare-fun dynLambda!2852 (Int (_ BitVec 64)) V!44285)

(assert (=> b!1168809 (= lt!526251 (dynLambda!2852 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526250 () ListLongMap!16787)

(assert (=> b!1168809 (= lt!526250 (getCurrentListMapNoExtraKeys!4873 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!775515 () Bool)

(assert (=> start!99234 (=> (not res!775515) (not e!664268))))

(assert (=> start!99234 (= res!775515 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36966 _keys!1208))))))

(assert (=> start!99234 e!664268))

(declare-fun tp_is_empty!29369 () Bool)

(assert (=> start!99234 tp_is_empty!29369))

(declare-fun array_inv!27844 (array!75559) Bool)

(assert (=> start!99234 (array_inv!27844 _keys!1208)))

(assert (=> start!99234 true))

(assert (=> start!99234 tp!87227))

(declare-fun e!664269 () Bool)

(declare-fun array_inv!27845 (array!75561) Bool)

(assert (=> start!99234 (and (array_inv!27845 _values!996) e!664269)))

(declare-fun b!1168810 () Bool)

(declare-fun e!664263 () Bool)

(assert (=> b!1168810 (= e!664263 tp_is_empty!29369)))

(declare-fun b!1168811 () Bool)

(declare-fun res!775511 () Bool)

(assert (=> b!1168811 (=> (not res!775511) (not e!664268))))

(assert (=> b!1168811 (= res!775511 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36966 _keys!1208))))))

(declare-fun b!1168812 () Bool)

(declare-fun res!775522 () Bool)

(assert (=> b!1168812 (=> (not res!775522) (not e!664268))))

(assert (=> b!1168812 (= res!775522 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25553))))

(declare-fun b!1168813 () Bool)

(declare-fun res!775521 () Bool)

(assert (=> b!1168813 (=> (not res!775521) (not e!664268))))

(assert (=> b!1168813 (= res!775521 (and (= (size!36967 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36966 _keys!1208) (size!36967 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168814 () Bool)

(declare-fun e!664265 () Bool)

(assert (=> b!1168814 (= e!664265 tp_is_empty!29369)))

(declare-fun b!1168815 () Bool)

(declare-fun res!775520 () Bool)

(assert (=> b!1168815 (=> (not res!775520) (not e!664268))))

(assert (=> b!1168815 (= res!775520 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!45878 () Bool)

(declare-fun mapRes!45878 () Bool)

(assert (=> mapIsEmpty!45878 mapRes!45878))

(declare-fun b!1168816 () Bool)

(assert (=> b!1168816 (= e!664268 e!664262)))

(declare-fun res!775512 () Bool)

(assert (=> b!1168816 (=> (not res!775512) (not e!664262))))

(assert (=> b!1168816 (= res!775512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526256 mask!1564))))

(assert (=> b!1168816 (= lt!526256 (array!75560 (store (arr!36430 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36966 _keys!1208)))))

(declare-fun b!1168817 () Bool)

(declare-fun res!775518 () Bool)

(assert (=> b!1168817 (=> (not res!775518) (not e!664268))))

(assert (=> b!1168817 (= res!775518 (= (select (arr!36430 _keys!1208) i!673) k!934))))

(declare-fun b!1168818 () Bool)

(declare-fun res!775519 () Bool)

(assert (=> b!1168818 (=> (not res!775519) (not e!664268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168818 (= res!775519 (validMask!0 mask!1564))))

(declare-fun b!1168819 () Bool)

(assert (=> b!1168819 (= e!664262 (not e!664261))))

(declare-fun res!775513 () Bool)

(assert (=> b!1168819 (=> res!775513 e!664261)))

(assert (=> b!1168819 (= res!775513 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168819 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!526248 () Unit!38570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75559 (_ BitVec 64) (_ BitVec 32)) Unit!38570)

(assert (=> b!1168819 (= lt!526248 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!45878 () Bool)

(declare-fun tp!87228 () Bool)

(assert (=> mapNonEmpty!45878 (= mapRes!45878 (and tp!87228 e!664265))))

(declare-fun mapKey!45878 () (_ BitVec 32))

(declare-fun mapValue!45878 () ValueCell!13975)

(declare-fun mapRest!45878 () (Array (_ BitVec 32) ValueCell!13975))

(assert (=> mapNonEmpty!45878 (= (arr!36431 _values!996) (store mapRest!45878 mapKey!45878 mapValue!45878))))

(declare-fun b!1168820 () Bool)

(assert (=> b!1168820 (= e!664269 (and e!664263 mapRes!45878))))

(declare-fun condMapEmpty!45878 () Bool)

(declare-fun mapDefault!45878 () ValueCell!13975)

