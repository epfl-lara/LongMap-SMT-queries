; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99458 () Bool)

(assert start!99458)

(declare-fun b_free!25037 () Bool)

(declare-fun b_next!25037 () Bool)

(assert (=> start!99458 (= b_free!25037 (not b_next!25037))))

(declare-fun tp!87824 () Bool)

(declare-fun b_and!40941 () Bool)

(assert (=> start!99458 (= tp!87824 b_and!40941)))

(declare-fun mapNonEmpty!46178 () Bool)

(declare-fun mapRes!46178 () Bool)

(declare-fun tp!87825 () Bool)

(declare-fun e!667950 () Bool)

(assert (=> mapNonEmpty!46178 (= mapRes!46178 (and tp!87825 e!667950))))

(declare-datatypes ((V!44549 0))(
  ( (V!44550 (val!14840 Int)) )
))
(declare-datatypes ((ValueCell!14074 0))(
  ( (ValueCellFull!14074 (v!17478 V!44549)) (EmptyCell!14074) )
))
(declare-fun mapRest!46178 () (Array (_ BitVec 32) ValueCell!14074))

(declare-fun mapKey!46178 () (_ BitVec 32))

(declare-fun mapValue!46178 () ValueCell!14074)

(declare-datatypes ((array!75945 0))(
  ( (array!75946 (arr!36622 (Array (_ BitVec 32) ValueCell!14074)) (size!37158 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75945)

(assert (=> mapNonEmpty!46178 (= (arr!36622 _values!996) (store mapRest!46178 mapKey!46178 mapValue!46178))))

(declare-fun b!1175091 () Bool)

(declare-fun res!780393 () Bool)

(declare-fun e!667952 () Bool)

(assert (=> b!1175091 (=> (not res!780393) (not e!667952))))

(declare-datatypes ((array!75947 0))(
  ( (array!75948 (arr!36623 (Array (_ BitVec 32) (_ BitVec 64))) (size!37159 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75947)

(declare-datatypes ((List!25714 0))(
  ( (Nil!25711) (Cons!25710 (h!26919 (_ BitVec 64)) (t!37743 List!25714)) )
))
(declare-fun arrayNoDuplicates!0 (array!75947 (_ BitVec 32) List!25714) Bool)

(assert (=> b!1175091 (= res!780393 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25711))))

(declare-fun b!1175092 () Bool)

(declare-fun e!667954 () Bool)

(declare-fun tp_is_empty!29567 () Bool)

(assert (=> b!1175092 (= e!667954 tp_is_empty!29567)))

(declare-fun b!1175093 () Bool)

(declare-fun e!667949 () Bool)

(declare-fun e!667953 () Bool)

(assert (=> b!1175093 (= e!667949 e!667953)))

(declare-fun res!780397 () Bool)

(assert (=> b!1175093 (=> res!780397 e!667953)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175093 (= res!780397 (not (validKeyInArray!0 (select (arr!36623 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18976 0))(
  ( (tuple2!18977 (_1!9499 (_ BitVec 64)) (_2!9499 V!44549)) )
))
(declare-datatypes ((List!25715 0))(
  ( (Nil!25712) (Cons!25711 (h!26920 tuple2!18976) (t!37744 List!25715)) )
))
(declare-datatypes ((ListLongMap!16945 0))(
  ( (ListLongMap!16946 (toList!8488 List!25715)) )
))
(declare-fun lt!530058 () ListLongMap!16945)

(declare-fun lt!530049 () ListLongMap!16945)

(assert (=> b!1175093 (= lt!530058 lt!530049)))

(declare-fun lt!530055 () ListLongMap!16945)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1544 (ListLongMap!16945 (_ BitVec 64)) ListLongMap!16945)

(assert (=> b!1175093 (= lt!530049 (-!1544 lt!530055 k!934))))

(declare-fun zeroValue!944 () V!44549)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!530045 () array!75947)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530054 () array!75945)

(declare-fun minValue!944 () V!44549)

(declare-fun getCurrentListMapNoExtraKeys!4948 (array!75947 array!75945 (_ BitVec 32) (_ BitVec 32) V!44549 V!44549 (_ BitVec 32) Int) ListLongMap!16945)

(assert (=> b!1175093 (= lt!530058 (getCurrentListMapNoExtraKeys!4948 lt!530045 lt!530054 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175093 (= lt!530055 (getCurrentListMapNoExtraKeys!4948 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38781 0))(
  ( (Unit!38782) )
))
(declare-fun lt!530050 () Unit!38781)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!771 (array!75947 array!75945 (_ BitVec 32) (_ BitVec 32) V!44549 V!44549 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38781)

(assert (=> b!1175093 (= lt!530050 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!771 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175094 () Bool)

(declare-fun res!780392 () Bool)

(assert (=> b!1175094 (=> (not res!780392) (not e!667952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75947 (_ BitVec 32)) Bool)

(assert (=> b!1175094 (= res!780392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175095 () Bool)

(assert (=> b!1175095 (= e!667953 true)))

(assert (=> b!1175095 (not (= (select (arr!36623 _keys!1208) from!1455) k!934))))

(declare-fun lt!530047 () Unit!38781)

(declare-fun e!667943 () Unit!38781)

(assert (=> b!1175095 (= lt!530047 e!667943)))

(declare-fun c!116679 () Bool)

(assert (=> b!1175095 (= c!116679 (= (select (arr!36623 _keys!1208) from!1455) k!934))))

(declare-fun e!667947 () Bool)

(assert (=> b!1175095 e!667947))

(declare-fun res!780395 () Bool)

(assert (=> b!1175095 (=> (not res!780395) (not e!667947))))

(declare-fun lt!530052 () ListLongMap!16945)

(declare-fun lt!530053 () V!44549)

(declare-fun +!3804 (ListLongMap!16945 tuple2!18976) ListLongMap!16945)

(declare-fun get!18696 (ValueCell!14074 V!44549) V!44549)

(assert (=> b!1175095 (= res!780395 (= lt!530052 (+!3804 lt!530049 (tuple2!18977 (select (arr!36623 _keys!1208) from!1455) (get!18696 (select (arr!36622 _values!996) from!1455) lt!530053)))))))

(declare-fun mapIsEmpty!46178 () Bool)

(assert (=> mapIsEmpty!46178 mapRes!46178))

(declare-fun b!1175096 () Bool)

(declare-fun res!780403 () Bool)

(declare-fun e!667944 () Bool)

(assert (=> b!1175096 (=> (not res!780403) (not e!667944))))

(assert (=> b!1175096 (= res!780403 (arrayNoDuplicates!0 lt!530045 #b00000000000000000000000000000000 Nil!25711))))

(declare-fun b!1175097 () Bool)

(assert (=> b!1175097 (= e!667950 tp_is_empty!29567)))

(declare-fun e!667945 () Bool)

(declare-fun b!1175098 () Bool)

(declare-fun arrayContainsKey!0 (array!75947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175098 (= e!667945 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1175099 () Bool)

(assert (=> b!1175099 (= e!667947 e!667945)))

(declare-fun res!780401 () Bool)

(assert (=> b!1175099 (=> res!780401 e!667945)))

(assert (=> b!1175099 (= res!780401 (not (= (select (arr!36623 _keys!1208) from!1455) k!934)))))

(declare-fun b!1175100 () Bool)

(declare-fun e!667948 () Bool)

(assert (=> b!1175100 (= e!667948 (and e!667954 mapRes!46178))))

(declare-fun condMapEmpty!46178 () Bool)

(declare-fun mapDefault!46178 () ValueCell!14074)

