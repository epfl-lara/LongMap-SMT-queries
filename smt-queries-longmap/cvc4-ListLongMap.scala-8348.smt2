; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101642 () Bool)

(assert start!101642)

(declare-fun b_free!26363 () Bool)

(declare-fun b_next!26363 () Bool)

(assert (=> start!101642 (= b_free!26363 (not b_next!26363))))

(declare-fun tp!92132 () Bool)

(declare-fun b_and!43969 () Bool)

(assert (=> start!101642 (= tp!92132 b_and!43969)))

(declare-fun b!1222480 () Bool)

(declare-fun res!812234 () Bool)

(declare-fun e!694270 () Bool)

(assert (=> b!1222480 (=> (not res!812234) (not e!694270))))

(declare-datatypes ((array!78917 0))(
  ( (array!78918 (arr!38086 (Array (_ BitVec 32) (_ BitVec 64))) (size!38622 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78917)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46549 0))(
  ( (V!46550 (val!15590 Int)) )
))
(declare-datatypes ((ValueCell!14824 0))(
  ( (ValueCellFull!14824 (v!18251 V!46549)) (EmptyCell!14824) )
))
(declare-datatypes ((array!78919 0))(
  ( (array!78920 (arr!38087 (Array (_ BitVec 32) ValueCell!14824)) (size!38623 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78919)

(assert (=> b!1222480 (= res!812234 (and (= (size!38623 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38622 _keys!1208) (size!38623 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!812229 () Bool)

(assert (=> start!101642 (=> (not res!812229) (not e!694270))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101642 (= res!812229 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38622 _keys!1208))))))

(assert (=> start!101642 e!694270))

(declare-fun tp_is_empty!31067 () Bool)

(assert (=> start!101642 tp_is_empty!31067))

(declare-fun array_inv!28978 (array!78917) Bool)

(assert (=> start!101642 (array_inv!28978 _keys!1208)))

(assert (=> start!101642 true))

(assert (=> start!101642 tp!92132))

(declare-fun e!694274 () Bool)

(declare-fun array_inv!28979 (array!78919) Bool)

(assert (=> start!101642 (and (array_inv!28979 _values!996) e!694274)))

(declare-fun b!1222481 () Bool)

(declare-fun e!694266 () Bool)

(declare-fun e!694272 () Bool)

(assert (=> b!1222481 (= e!694266 (not e!694272))))

(declare-fun res!812235 () Bool)

(assert (=> b!1222481 (=> res!812235 e!694272)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222481 (= res!812235 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222481 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40486 0))(
  ( (Unit!40487) )
))
(declare-fun lt!556204 () Unit!40486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78917 (_ BitVec 64) (_ BitVec 32)) Unit!40486)

(assert (=> b!1222481 (= lt!556204 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222482 () Bool)

(declare-fun e!694265 () Unit!40486)

(declare-fun Unit!40488 () Unit!40486)

(assert (=> b!1222482 (= e!694265 Unit!40488)))

(declare-fun b!1222483 () Bool)

(declare-fun res!812240 () Bool)

(assert (=> b!1222483 (=> (not res!812240) (not e!694270))))

(assert (=> b!1222483 (= res!812240 (= (select (arr!38086 _keys!1208) i!673) k!934))))

(declare-fun b!1222484 () Bool)

(declare-fun res!812237 () Bool)

(assert (=> b!1222484 (=> (not res!812237) (not e!694270))))

(declare-datatypes ((List!26880 0))(
  ( (Nil!26877) (Cons!26876 (h!28085 (_ BitVec 64)) (t!40223 List!26880)) )
))
(declare-fun arrayNoDuplicates!0 (array!78917 (_ BitVec 32) List!26880) Bool)

(assert (=> b!1222484 (= res!812237 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26877))))

(declare-fun b!1222485 () Bool)

(declare-fun e!694268 () Bool)

(declare-fun e!694267 () Bool)

(assert (=> b!1222485 (= e!694268 e!694267)))

(declare-fun res!812239 () Bool)

(assert (=> b!1222485 (=> res!812239 e!694267)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222485 (= res!812239 (not (validKeyInArray!0 (select (arr!38086 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20080 0))(
  ( (tuple2!20081 (_1!10051 (_ BitVec 64)) (_2!10051 V!46549)) )
))
(declare-datatypes ((List!26881 0))(
  ( (Nil!26878) (Cons!26877 (h!28086 tuple2!20080) (t!40224 List!26881)) )
))
(declare-datatypes ((ListLongMap!18049 0))(
  ( (ListLongMap!18050 (toList!9040 List!26881)) )
))
(declare-fun lt!556200 () ListLongMap!18049)

(declare-fun lt!556206 () ListLongMap!18049)

(assert (=> b!1222485 (= lt!556200 lt!556206)))

(declare-fun lt!556207 () ListLongMap!18049)

(declare-fun -!1944 (ListLongMap!18049 (_ BitVec 64)) ListLongMap!18049)

(assert (=> b!1222485 (= lt!556206 (-!1944 lt!556207 k!934))))

(declare-fun zeroValue!944 () V!46549)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556203 () array!78919)

(declare-fun minValue!944 () V!46549)

(declare-fun lt!556198 () array!78917)

(declare-fun getCurrentListMapNoExtraKeys!5462 (array!78917 array!78919 (_ BitVec 32) (_ BitVec 32) V!46549 V!46549 (_ BitVec 32) Int) ListLongMap!18049)

(assert (=> b!1222485 (= lt!556200 (getCurrentListMapNoExtraKeys!5462 lt!556198 lt!556203 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222485 (= lt!556207 (getCurrentListMapNoExtraKeys!5462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556201 () Unit!40486)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1151 (array!78917 array!78919 (_ BitVec 32) (_ BitVec 32) V!46549 V!46549 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40486)

(assert (=> b!1222485 (= lt!556201 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1151 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222486 () Bool)

(declare-fun e!694273 () Bool)

(declare-fun e!694271 () Bool)

(assert (=> b!1222486 (= e!694273 e!694271)))

(declare-fun res!812236 () Bool)

(assert (=> b!1222486 (=> res!812236 e!694271)))

(assert (=> b!1222486 (= res!812236 (not (= (select (arr!38086 _keys!1208) from!1455) k!934)))))

(declare-fun b!1222487 () Bool)

(declare-fun res!812231 () Bool)

(assert (=> b!1222487 (=> (not res!812231) (not e!694266))))

(assert (=> b!1222487 (= res!812231 (arrayNoDuplicates!0 lt!556198 #b00000000000000000000000000000000 Nil!26877))))

(declare-fun b!1222488 () Bool)

(assert (=> b!1222488 (= e!694271 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222489 () Bool)

(declare-fun e!694264 () Bool)

(declare-fun mapRes!48496 () Bool)

(assert (=> b!1222489 (= e!694274 (and e!694264 mapRes!48496))))

(declare-fun condMapEmpty!48496 () Bool)

(declare-fun mapDefault!48496 () ValueCell!14824)

