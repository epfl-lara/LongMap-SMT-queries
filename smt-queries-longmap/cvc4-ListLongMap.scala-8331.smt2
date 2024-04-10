; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101390 () Bool)

(assert start!101390)

(declare-fun b_free!26261 () Bool)

(declare-fun b_next!26261 () Bool)

(assert (=> start!101390 (= b_free!26261 (not b_next!26261))))

(declare-fun tp!91810 () Bool)

(declare-fun b_and!43675 () Bool)

(assert (=> start!101390 (= tp!91810 b_and!43675)))

(declare-datatypes ((array!78703 0))(
  ( (array!78704 (arr!37984 (Array (_ BitVec 32) (_ BitVec 64))) (size!38520 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78703)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!691881 () Bool)

(declare-fun b!1218615 () Bool)

(declare-fun arrayContainsKey!0 (array!78703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218615 (= e!691881 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1218616 () Bool)

(declare-fun e!691873 () Bool)

(declare-fun tp_is_empty!30965 () Bool)

(assert (=> b!1218616 (= e!691873 tp_is_empty!30965)))

(declare-fun b!1218617 () Bool)

(declare-fun e!691874 () Bool)

(declare-fun e!691882 () Bool)

(assert (=> b!1218617 (= e!691874 e!691882)))

(declare-fun res!809371 () Bool)

(assert (=> b!1218617 (=> res!809371 e!691882)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218617 (= res!809371 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46413 0))(
  ( (V!46414 (val!15539 Int)) )
))
(declare-fun zeroValue!944 () V!46413)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19990 0))(
  ( (tuple2!19991 (_1!10006 (_ BitVec 64)) (_2!10006 V!46413)) )
))
(declare-datatypes ((List!26792 0))(
  ( (Nil!26789) (Cons!26788 (h!27997 tuple2!19990) (t!40033 List!26792)) )
))
(declare-datatypes ((ListLongMap!17959 0))(
  ( (ListLongMap!17960 (toList!8995 List!26792)) )
))
(declare-fun lt!553990 () ListLongMap!17959)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14773 0))(
  ( (ValueCellFull!14773 (v!18194 V!46413)) (EmptyCell!14773) )
))
(declare-datatypes ((array!78705 0))(
  ( (array!78706 (arr!37985 (Array (_ BitVec 32) ValueCell!14773)) (size!38521 (_ BitVec 32))) )
))
(declare-fun lt!553991 () array!78705)

(declare-fun lt!553984 () array!78703)

(declare-fun minValue!944 () V!46413)

(declare-fun getCurrentListMapNoExtraKeys!5421 (array!78703 array!78705 (_ BitVec 32) (_ BitVec 32) V!46413 V!46413 (_ BitVec 32) Int) ListLongMap!17959)

(assert (=> b!1218617 (= lt!553990 (getCurrentListMapNoExtraKeys!5421 lt!553984 lt!553991 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553987 () V!46413)

(declare-fun _values!996 () array!78705)

(assert (=> b!1218617 (= lt!553991 (array!78706 (store (arr!37985 _values!996) i!673 (ValueCellFull!14773 lt!553987)) (size!38521 _values!996)))))

(declare-fun dynLambda!3304 (Int (_ BitVec 64)) V!46413)

(assert (=> b!1218617 (= lt!553987 (dynLambda!3304 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553983 () ListLongMap!17959)

(assert (=> b!1218617 (= lt!553983 (getCurrentListMapNoExtraKeys!5421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218618 () Bool)

(declare-fun e!691880 () Bool)

(assert (=> b!1218618 (= e!691880 tp_is_empty!30965)))

(declare-fun b!1218619 () Bool)

(declare-fun res!809376 () Bool)

(declare-fun e!691875 () Bool)

(assert (=> b!1218619 (=> (not res!809376) (not e!691875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218619 (= res!809376 (validKeyInArray!0 k!934))))

(declare-fun b!1218620 () Bool)

(declare-fun res!809368 () Bool)

(assert (=> b!1218620 (=> (not res!809368) (not e!691875))))

(declare-datatypes ((List!26793 0))(
  ( (Nil!26790) (Cons!26789 (h!27998 (_ BitVec 64)) (t!40034 List!26793)) )
))
(declare-fun arrayNoDuplicates!0 (array!78703 (_ BitVec 32) List!26793) Bool)

(assert (=> b!1218620 (= res!809368 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26790))))

(declare-fun e!691879 () Bool)

(declare-fun b!1218621 () Bool)

(assert (=> b!1218621 (= e!691879 (or (not (= (select (arr!37984 _keys!1208) from!1455) k!934)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (size!38520 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun e!691883 () Bool)

(assert (=> b!1218621 e!691883))

(declare-fun res!809367 () Bool)

(assert (=> b!1218621 (=> (not res!809367) (not e!691883))))

(declare-fun lt!553985 () ListLongMap!17959)

(declare-fun +!4064 (ListLongMap!17959 tuple2!19990) ListLongMap!17959)

(declare-fun get!19361 (ValueCell!14773 V!46413) V!46413)

(assert (=> b!1218621 (= res!809367 (= lt!553990 (+!4064 lt!553985 (tuple2!19991 (select (arr!37984 _keys!1208) from!1455) (get!19361 (select (arr!37985 _values!996) from!1455) lt!553987)))))))

(declare-fun res!809378 () Bool)

(assert (=> start!101390 (=> (not res!809378) (not e!691875))))

(assert (=> start!101390 (= res!809378 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38520 _keys!1208))))))

(assert (=> start!101390 e!691875))

(assert (=> start!101390 tp_is_empty!30965))

(declare-fun array_inv!28908 (array!78703) Bool)

(assert (=> start!101390 (array_inv!28908 _keys!1208)))

(assert (=> start!101390 true))

(assert (=> start!101390 tp!91810))

(declare-fun e!691878 () Bool)

(declare-fun array_inv!28909 (array!78705) Bool)

(assert (=> start!101390 (and (array_inv!28909 _values!996) e!691878)))

(declare-fun b!1218622 () Bool)

(declare-fun e!691877 () Bool)

(assert (=> b!1218622 (= e!691875 e!691877)))

(declare-fun res!809373 () Bool)

(assert (=> b!1218622 (=> (not res!809373) (not e!691877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78703 (_ BitVec 32)) Bool)

(assert (=> b!1218622 (= res!809373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553984 mask!1564))))

(assert (=> b!1218622 (= lt!553984 (array!78704 (store (arr!37984 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38520 _keys!1208)))))

(declare-fun mapNonEmpty!48328 () Bool)

(declare-fun mapRes!48328 () Bool)

(declare-fun tp!91811 () Bool)

(assert (=> mapNonEmpty!48328 (= mapRes!48328 (and tp!91811 e!691880))))

(declare-fun mapRest!48328 () (Array (_ BitVec 32) ValueCell!14773))

(declare-fun mapKey!48328 () (_ BitVec 32))

(declare-fun mapValue!48328 () ValueCell!14773)

(assert (=> mapNonEmpty!48328 (= (arr!37985 _values!996) (store mapRest!48328 mapKey!48328 mapValue!48328))))

(declare-fun b!1218623 () Bool)

(assert (=> b!1218623 (= e!691877 (not e!691874))))

(declare-fun res!809372 () Bool)

(assert (=> b!1218623 (=> res!809372 e!691874)))

(assert (=> b!1218623 (= res!809372 (bvsgt from!1455 i!673))))

(assert (=> b!1218623 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40394 0))(
  ( (Unit!40395) )
))
(declare-fun lt!553989 () Unit!40394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78703 (_ BitVec 64) (_ BitVec 32)) Unit!40394)

(assert (=> b!1218623 (= lt!553989 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1218624 () Bool)

(declare-fun res!809374 () Bool)

(assert (=> b!1218624 (=> (not res!809374) (not e!691875))))

(assert (=> b!1218624 (= res!809374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218625 () Bool)

(declare-fun res!809375 () Bool)

(assert (=> b!1218625 (=> (not res!809375) (not e!691875))))

(assert (=> b!1218625 (= res!809375 (and (= (size!38521 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38520 _keys!1208) (size!38521 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218626 () Bool)

(declare-fun res!809380 () Bool)

(assert (=> b!1218626 (=> (not res!809380) (not e!691875))))

(assert (=> b!1218626 (= res!809380 (= (select (arr!37984 _keys!1208) i!673) k!934))))

(declare-fun b!1218627 () Bool)

(assert (=> b!1218627 (= e!691882 e!691879)))

(declare-fun res!809370 () Bool)

(assert (=> b!1218627 (=> res!809370 e!691879)))

(assert (=> b!1218627 (= res!809370 (not (validKeyInArray!0 (select (arr!37984 _keys!1208) from!1455))))))

(declare-fun lt!553992 () ListLongMap!17959)

(assert (=> b!1218627 (= lt!553992 lt!553985)))

(declare-fun lt!553988 () ListLongMap!17959)

(declare-fun -!1909 (ListLongMap!17959 (_ BitVec 64)) ListLongMap!17959)

(assert (=> b!1218627 (= lt!553985 (-!1909 lt!553988 k!934))))

(assert (=> b!1218627 (= lt!553992 (getCurrentListMapNoExtraKeys!5421 lt!553984 lt!553991 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218627 (= lt!553988 (getCurrentListMapNoExtraKeys!5421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553986 () Unit!40394)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1116 (array!78703 array!78705 (_ BitVec 32) (_ BitVec 32) V!46413 V!46413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40394)

(assert (=> b!1218627 (= lt!553986 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1116 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218628 () Bool)

(declare-fun res!809381 () Bool)

(assert (=> b!1218628 (=> (not res!809381) (not e!691875))))

(assert (=> b!1218628 (= res!809381 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38520 _keys!1208))))))

(declare-fun b!1218629 () Bool)

(assert (=> b!1218629 (= e!691883 e!691881)))

(declare-fun res!809379 () Bool)

(assert (=> b!1218629 (=> res!809379 e!691881)))

(assert (=> b!1218629 (= res!809379 (not (= (select (arr!37984 _keys!1208) from!1455) k!934)))))

(declare-fun b!1218630 () Bool)

(assert (=> b!1218630 (= e!691878 (and e!691873 mapRes!48328))))

(declare-fun condMapEmpty!48328 () Bool)

(declare-fun mapDefault!48328 () ValueCell!14773)

