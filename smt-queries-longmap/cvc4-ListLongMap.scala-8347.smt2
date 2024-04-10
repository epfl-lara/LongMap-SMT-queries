; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101636 () Bool)

(assert start!101636)

(declare-fun b_free!26357 () Bool)

(declare-fun b_next!26357 () Bool)

(assert (=> start!101636 (= b_free!26357 (not b_next!26357))))

(declare-fun tp!92114 () Bool)

(declare-fun b_and!43957 () Bool)

(assert (=> start!101636 (= tp!92114 b_and!43957)))

(declare-fun b!1222296 () Bool)

(declare-fun res!812104 () Bool)

(declare-fun e!694157 () Bool)

(assert (=> b!1222296 (=> (not res!812104) (not e!694157))))

(declare-datatypes ((array!78905 0))(
  ( (array!78906 (arr!38080 (Array (_ BitVec 32) (_ BitVec 64))) (size!38616 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78905)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1222296 (= res!812104 (= (select (arr!38080 _keys!1208) i!673) k!934))))

(declare-fun b!1222297 () Bool)

(declare-fun e!694162 () Bool)

(declare-fun tp_is_empty!31061 () Bool)

(assert (=> b!1222297 (= e!694162 tp_is_empty!31061)))

(declare-fun b!1222298 () Bool)

(declare-fun e!694164 () Bool)

(declare-fun e!694158 () Bool)

(assert (=> b!1222298 (= e!694164 e!694158)))

(declare-fun res!812100 () Bool)

(assert (=> b!1222298 (=> res!812100 e!694158)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1222298 (= res!812100 (not (= (select (arr!38080 _keys!1208) from!1455) k!934)))))

(declare-fun e!694167 () Bool)

(assert (=> b!1222298 e!694167))

(declare-fun res!812093 () Bool)

(assert (=> b!1222298 (=> (not res!812093) (not e!694167))))

(declare-datatypes ((V!46541 0))(
  ( (V!46542 (val!15587 Int)) )
))
(declare-datatypes ((tuple2!20076 0))(
  ( (tuple2!20077 (_1!10049 (_ BitVec 64)) (_2!10049 V!46541)) )
))
(declare-datatypes ((List!26876 0))(
  ( (Nil!26873) (Cons!26872 (h!28081 tuple2!20076) (t!40213 List!26876)) )
))
(declare-datatypes ((ListLongMap!18045 0))(
  ( (ListLongMap!18046 (toList!9038 List!26876)) )
))
(declare-fun lt!556073 () ListLongMap!18045)

(declare-datatypes ((ValueCell!14821 0))(
  ( (ValueCellFull!14821 (v!18248 V!46541)) (EmptyCell!14821) )
))
(declare-datatypes ((array!78907 0))(
  ( (array!78908 (arr!38081 (Array (_ BitVec 32) ValueCell!14821)) (size!38617 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78907)

(declare-fun lt!556080 () ListLongMap!18045)

(declare-fun lt!556082 () V!46541)

(declare-fun +!4099 (ListLongMap!18045 tuple2!20076) ListLongMap!18045)

(declare-fun get!19438 (ValueCell!14821 V!46541) V!46541)

(assert (=> b!1222298 (= res!812093 (= lt!556073 (+!4099 lt!556080 (tuple2!20077 (select (arr!38080 _keys!1208) from!1455) (get!19438 (select (arr!38081 _values!996) from!1455) lt!556082)))))))

(declare-fun b!1222299 () Bool)

(declare-fun e!694159 () Bool)

(assert (=> b!1222299 (= e!694159 e!694164)))

(declare-fun res!812105 () Bool)

(assert (=> b!1222299 (=> res!812105 e!694164)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222299 (= res!812105 (not (validKeyInArray!0 (select (arr!38080 _keys!1208) from!1455))))))

(declare-fun lt!556074 () ListLongMap!18045)

(assert (=> b!1222299 (= lt!556074 lt!556080)))

(declare-fun lt!556075 () ListLongMap!18045)

(declare-fun -!1942 (ListLongMap!18045 (_ BitVec 64)) ListLongMap!18045)

(assert (=> b!1222299 (= lt!556080 (-!1942 lt!556075 k!934))))

(declare-fun zeroValue!944 () V!46541)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556072 () array!78905)

(declare-fun minValue!944 () V!46541)

(declare-fun lt!556078 () array!78907)

(declare-fun getCurrentListMapNoExtraKeys!5460 (array!78905 array!78907 (_ BitVec 32) (_ BitVec 32) V!46541 V!46541 (_ BitVec 32) Int) ListLongMap!18045)

(assert (=> b!1222299 (= lt!556074 (getCurrentListMapNoExtraKeys!5460 lt!556072 lt!556078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222299 (= lt!556075 (getCurrentListMapNoExtraKeys!5460 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40480 0))(
  ( (Unit!40481) )
))
(declare-fun lt!556076 () Unit!40480)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1149 (array!78905 array!78907 (_ BitVec 32) (_ BitVec 32) V!46541 V!46541 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40480)

(assert (=> b!1222299 (= lt!556076 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1149 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222300 () Bool)

(declare-fun res!812103 () Bool)

(assert (=> b!1222300 (=> (not res!812103) (not e!694157))))

(assert (=> b!1222300 (= res!812103 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38616 _keys!1208))))))

(declare-fun b!1222301 () Bool)

(declare-fun e!694161 () Bool)

(assert (=> b!1222301 (= e!694167 e!694161)))

(declare-fun res!812095 () Bool)

(assert (=> b!1222301 (=> res!812095 e!694161)))

(assert (=> b!1222301 (= res!812095 (not (= (select (arr!38080 _keys!1208) from!1455) k!934)))))

(declare-fun b!1222302 () Bool)

(declare-fun res!812106 () Bool)

(assert (=> b!1222302 (=> (not res!812106) (not e!694157))))

(assert (=> b!1222302 (= res!812106 (validKeyInArray!0 k!934))))

(declare-fun b!1222303 () Bool)

(declare-fun res!812107 () Bool)

(assert (=> b!1222303 (=> (not res!812107) (not e!694157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222303 (= res!812107 (validMask!0 mask!1564))))

(declare-fun b!1222304 () Bool)

(declare-fun res!812098 () Bool)

(assert (=> b!1222304 (=> (not res!812098) (not e!694157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78905 (_ BitVec 32)) Bool)

(assert (=> b!1222304 (= res!812098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222305 () Bool)

(declare-fun res!812094 () Bool)

(declare-fun e!694163 () Bool)

(assert (=> b!1222305 (=> (not res!812094) (not e!694163))))

(declare-datatypes ((List!26877 0))(
  ( (Nil!26874) (Cons!26873 (h!28082 (_ BitVec 64)) (t!40214 List!26877)) )
))
(declare-fun arrayNoDuplicates!0 (array!78905 (_ BitVec 32) List!26877) Bool)

(assert (=> b!1222305 (= res!812094 (arrayNoDuplicates!0 lt!556072 #b00000000000000000000000000000000 Nil!26874))))

(declare-fun mapIsEmpty!48487 () Bool)

(declare-fun mapRes!48487 () Bool)

(assert (=> mapIsEmpty!48487 mapRes!48487))

(declare-fun b!1222295 () Bool)

(declare-fun res!812101 () Bool)

(assert (=> b!1222295 (=> (not res!812101) (not e!694157))))

(assert (=> b!1222295 (= res!812101 (and (= (size!38617 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38616 _keys!1208) (size!38617 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!812099 () Bool)

(assert (=> start!101636 (=> (not res!812099) (not e!694157))))

(assert (=> start!101636 (= res!812099 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38616 _keys!1208))))))

(assert (=> start!101636 e!694157))

(assert (=> start!101636 tp_is_empty!31061))

(declare-fun array_inv!28974 (array!78905) Bool)

(assert (=> start!101636 (array_inv!28974 _keys!1208)))

(assert (=> start!101636 true))

(assert (=> start!101636 tp!92114))

(declare-fun e!694166 () Bool)

(declare-fun array_inv!28975 (array!78907) Bool)

(assert (=> start!101636 (and (array_inv!28975 _values!996) e!694166)))

(declare-fun b!1222306 () Bool)

(declare-fun arrayContainsKey!0 (array!78905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222306 (= e!694161 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222307 () Bool)

(declare-fun e!694165 () Bool)

(assert (=> b!1222307 (= e!694166 (and e!694165 mapRes!48487))))

(declare-fun condMapEmpty!48487 () Bool)

(declare-fun mapDefault!48487 () ValueCell!14821)

