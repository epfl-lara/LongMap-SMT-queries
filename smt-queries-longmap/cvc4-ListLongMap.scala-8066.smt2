; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99266 () Bool)

(assert start!99266)

(declare-fun b_free!24845 () Bool)

(declare-fun b_next!24845 () Bool)

(assert (=> start!99266 (= b_free!24845 (not b_next!24845))))

(declare-fun tp!87249 () Bool)

(declare-fun b_and!40557 () Bool)

(assert (=> start!99266 (= tp!87249 b_and!40557)))

(declare-fun mapIsEmpty!45890 () Bool)

(declare-fun mapRes!45890 () Bool)

(assert (=> mapIsEmpty!45890 mapRes!45890))

(declare-fun b!1169114 () Bool)

(declare-fun e!664455 () Bool)

(declare-fun e!664454 () Bool)

(assert (=> b!1169114 (= e!664455 e!664454)))

(declare-fun res!775710 () Bool)

(assert (=> b!1169114 (=> res!775710 e!664454)))

(declare-datatypes ((array!75573 0))(
  ( (array!75574 (arr!36436 (Array (_ BitVec 32) (_ BitVec 64))) (size!36972 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75573)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169114 (= res!775710 (not (validKeyInArray!0 (select (arr!36436 _keys!1208) from!1455))))))

(declare-datatypes ((V!44293 0))(
  ( (V!44294 (val!14744 Int)) )
))
(declare-datatypes ((tuple2!18824 0))(
  ( (tuple2!18825 (_1!9423 (_ BitVec 64)) (_2!9423 V!44293)) )
))
(declare-datatypes ((List!25562 0))(
  ( (Nil!25559) (Cons!25558 (h!26767 tuple2!18824) (t!37399 List!25562)) )
))
(declare-datatypes ((ListLongMap!16793 0))(
  ( (ListLongMap!16794 (toList!8412 List!25562)) )
))
(declare-fun lt!526422 () ListLongMap!16793)

(declare-fun lt!526421 () ListLongMap!16793)

(assert (=> b!1169114 (= lt!526422 lt!526421)))

(declare-fun lt!526414 () ListLongMap!16793)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1484 (ListLongMap!16793 (_ BitVec 64)) ListLongMap!16793)

(assert (=> b!1169114 (= lt!526421 (-!1484 lt!526414 k!934))))

(declare-fun zeroValue!944 () V!44293)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!526420 () array!75573)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44293)

(declare-datatypes ((ValueCell!13978 0))(
  ( (ValueCellFull!13978 (v!17382 V!44293)) (EmptyCell!13978) )
))
(declare-datatypes ((array!75575 0))(
  ( (array!75576 (arr!36437 (Array (_ BitVec 32) ValueCell!13978)) (size!36973 (_ BitVec 32))) )
))
(declare-fun lt!526415 () array!75575)

(declare-fun getCurrentListMapNoExtraKeys!4876 (array!75573 array!75575 (_ BitVec 32) (_ BitVec 32) V!44293 V!44293 (_ BitVec 32) Int) ListLongMap!16793)

(assert (=> b!1169114 (= lt!526422 (getCurrentListMapNoExtraKeys!4876 lt!526420 lt!526415 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75575)

(assert (=> b!1169114 (= lt!526414 (getCurrentListMapNoExtraKeys!4876 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38576 0))(
  ( (Unit!38577) )
))
(declare-fun lt!526417 () Unit!38576)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!711 (array!75573 array!75575 (_ BitVec 32) (_ BitVec 32) V!44293 V!44293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38576)

(assert (=> b!1169114 (= lt!526417 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!711 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45890 () Bool)

(declare-fun tp!87248 () Bool)

(declare-fun e!664459 () Bool)

(assert (=> mapNonEmpty!45890 (= mapRes!45890 (and tp!87248 e!664459))))

(declare-fun mapKey!45890 () (_ BitVec 32))

(declare-fun mapValue!45890 () ValueCell!13978)

(declare-fun mapRest!45890 () (Array (_ BitVec 32) ValueCell!13978))

(assert (=> mapNonEmpty!45890 (= (arr!36437 _values!996) (store mapRest!45890 mapKey!45890 mapValue!45890))))

(declare-fun b!1169115 () Bool)

(declare-fun res!775716 () Bool)

(declare-fun e!664456 () Bool)

(assert (=> b!1169115 (=> (not res!775716) (not e!664456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169115 (= res!775716 (validMask!0 mask!1564))))

(declare-fun b!1169116 () Bool)

(declare-fun res!775705 () Bool)

(assert (=> b!1169116 (=> (not res!775705) (not e!664456))))

(assert (=> b!1169116 (= res!775705 (and (= (size!36973 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36972 _keys!1208) (size!36973 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169117 () Bool)

(declare-fun res!775706 () Bool)

(assert (=> b!1169117 (=> (not res!775706) (not e!664456))))

(assert (=> b!1169117 (= res!775706 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36972 _keys!1208))))))

(declare-fun b!1169118 () Bool)

(declare-fun e!664458 () Bool)

(assert (=> b!1169118 (= e!664458 e!664455)))

(declare-fun res!775703 () Bool)

(assert (=> b!1169118 (=> res!775703 e!664455)))

(assert (=> b!1169118 (= res!775703 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526416 () ListLongMap!16793)

(assert (=> b!1169118 (= lt!526416 (getCurrentListMapNoExtraKeys!4876 lt!526420 lt!526415 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526413 () V!44293)

(assert (=> b!1169118 (= lt!526415 (array!75576 (store (arr!36437 _values!996) i!673 (ValueCellFull!13978 lt!526413)) (size!36973 _values!996)))))

(declare-fun dynLambda!2855 (Int (_ BitVec 64)) V!44293)

(assert (=> b!1169118 (= lt!526413 (dynLambda!2855 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526419 () ListLongMap!16793)

(assert (=> b!1169118 (= lt!526419 (getCurrentListMapNoExtraKeys!4876 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!775717 () Bool)

(assert (=> start!99266 (=> (not res!775717) (not e!664456))))

(assert (=> start!99266 (= res!775717 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36972 _keys!1208))))))

(assert (=> start!99266 e!664456))

(declare-fun tp_is_empty!29375 () Bool)

(assert (=> start!99266 tp_is_empty!29375))

(declare-fun array_inv!27850 (array!75573) Bool)

(assert (=> start!99266 (array_inv!27850 _keys!1208)))

(assert (=> start!99266 true))

(assert (=> start!99266 tp!87249))

(declare-fun e!664453 () Bool)

(declare-fun array_inv!27851 (array!75575) Bool)

(assert (=> start!99266 (and (array_inv!27851 _values!996) e!664453)))

(declare-fun b!1169119 () Bool)

(declare-fun e!664462 () Bool)

(declare-fun e!664461 () Bool)

(assert (=> b!1169119 (= e!664462 e!664461)))

(declare-fun res!775704 () Bool)

(assert (=> b!1169119 (=> res!775704 e!664461)))

(assert (=> b!1169119 (= res!775704 (not (= (select (arr!36436 _keys!1208) from!1455) k!934)))))

(declare-fun b!1169120 () Bool)

(declare-fun res!775715 () Bool)

(assert (=> b!1169120 (=> (not res!775715) (not e!664456))))

(assert (=> b!1169120 (= res!775715 (= (select (arr!36436 _keys!1208) i!673) k!934))))

(declare-fun b!1169121 () Bool)

(declare-fun res!775713 () Bool)

(assert (=> b!1169121 (=> (not res!775713) (not e!664456))))

(assert (=> b!1169121 (= res!775713 (validKeyInArray!0 k!934))))

(declare-fun b!1169122 () Bool)

(assert (=> b!1169122 (= e!664454 true)))

(assert (=> b!1169122 e!664462))

(declare-fun res!775708 () Bool)

(assert (=> b!1169122 (=> (not res!775708) (not e!664462))))

(declare-fun +!3745 (ListLongMap!16793 tuple2!18824) ListLongMap!16793)

(declare-fun get!18573 (ValueCell!13978 V!44293) V!44293)

(assert (=> b!1169122 (= res!775708 (= lt!526416 (+!3745 lt!526421 (tuple2!18825 (select (arr!36436 _keys!1208) from!1455) (get!18573 (select (arr!36437 _values!996) from!1455) lt!526413)))))))

(declare-fun b!1169123 () Bool)

(declare-fun e!664452 () Bool)

(assert (=> b!1169123 (= e!664453 (and e!664452 mapRes!45890))))

(declare-fun condMapEmpty!45890 () Bool)

(declare-fun mapDefault!45890 () ValueCell!13978)

