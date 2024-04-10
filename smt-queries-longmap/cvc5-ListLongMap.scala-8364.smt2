; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101766 () Bool)

(assert start!101766)

(declare-fun b_free!26455 () Bool)

(declare-fun b_next!26455 () Bool)

(assert (=> start!101766 (= b_free!26455 (not b_next!26455))))

(declare-fun tp!92411 () Bool)

(declare-fun b_and!44171 () Bool)

(assert (=> start!101766 (= tp!92411 b_and!44171)))

(declare-fun b!1225557 () Bool)

(declare-fun e!696069 () Bool)

(declare-fun tp_is_empty!31159 () Bool)

(assert (=> b!1225557 (= e!696069 tp_is_empty!31159)))

(declare-fun b!1225558 () Bool)

(declare-fun res!814448 () Bool)

(declare-fun e!696073 () Bool)

(assert (=> b!1225558 (=> (not res!814448) (not e!696073))))

(declare-datatypes ((array!79097 0))(
  ( (array!79098 (arr!38175 (Array (_ BitVec 32) (_ BitVec 64))) (size!38711 (_ BitVec 32))) )
))
(declare-fun lt!558494 () array!79097)

(declare-datatypes ((List!26955 0))(
  ( (Nil!26952) (Cons!26951 (h!28160 (_ BitVec 64)) (t!40390 List!26955)) )
))
(declare-fun arrayNoDuplicates!0 (array!79097 (_ BitVec 32) List!26955) Bool)

(assert (=> b!1225558 (= res!814448 (arrayNoDuplicates!0 lt!558494 #b00000000000000000000000000000000 Nil!26952))))

(declare-fun b!1225559 () Bool)

(declare-fun res!814449 () Bool)

(declare-fun e!696075 () Bool)

(assert (=> b!1225559 (=> (not res!814449) (not e!696075))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225559 (= res!814449 (validMask!0 mask!1564))))

(declare-fun b!1225560 () Bool)

(declare-fun e!696074 () Bool)

(assert (=> b!1225560 (= e!696074 true)))

(declare-datatypes ((V!46673 0))(
  ( (V!46674 (val!15636 Int)) )
))
(declare-fun zeroValue!944 () V!46673)

(declare-datatypes ((ValueCell!14870 0))(
  ( (ValueCellFull!14870 (v!18298 V!46673)) (EmptyCell!14870) )
))
(declare-datatypes ((array!79099 0))(
  ( (array!79100 (arr!38176 (Array (_ BitVec 32) ValueCell!14870)) (size!38712 (_ BitVec 32))) )
))
(declare-fun lt!558490 () array!79099)

(declare-fun _keys!1208 () array!79097)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!79099)

(declare-fun minValue!944 () V!46673)

(declare-datatypes ((tuple2!20154 0))(
  ( (tuple2!20155 (_1!10088 (_ BitVec 64)) (_2!10088 V!46673)) )
))
(declare-datatypes ((List!26956 0))(
  ( (Nil!26953) (Cons!26952 (h!28161 tuple2!20154) (t!40391 List!26956)) )
))
(declare-datatypes ((ListLongMap!18123 0))(
  ( (ListLongMap!18124 (toList!9077 List!26956)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5496 (array!79097 array!79099 (_ BitVec 32) (_ BitVec 32) V!46673 V!46673 (_ BitVec 32) Int) ListLongMap!18123)

(declare-fun -!1976 (ListLongMap!18123 (_ BitVec 64)) ListLongMap!18123)

(assert (=> b!1225560 (= (getCurrentListMapNoExtraKeys!5496 lt!558494 lt!558490 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1976 (getCurrentListMapNoExtraKeys!5496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40620 0))(
  ( (Unit!40621) )
))
(declare-fun lt!558493 () Unit!40620)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1182 (array!79097 array!79099 (_ BitVec 32) (_ BitVec 32) V!46673 V!46673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40620)

(assert (=> b!1225560 (= lt!558493 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1182 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225561 () Bool)

(declare-fun e!696076 () Bool)

(assert (=> b!1225561 (= e!696073 (not e!696076))))

(declare-fun res!814443 () Bool)

(assert (=> b!1225561 (=> res!814443 e!696076)))

(assert (=> b!1225561 (= res!814443 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225561 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!558492 () Unit!40620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79097 (_ BitVec 64) (_ BitVec 32)) Unit!40620)

(assert (=> b!1225561 (= lt!558492 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!814451 () Bool)

(assert (=> start!101766 (=> (not res!814451) (not e!696075))))

(assert (=> start!101766 (= res!814451 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38711 _keys!1208))))))

(assert (=> start!101766 e!696075))

(assert (=> start!101766 tp_is_empty!31159))

(declare-fun array_inv!29032 (array!79097) Bool)

(assert (=> start!101766 (array_inv!29032 _keys!1208)))

(assert (=> start!101766 true))

(assert (=> start!101766 tp!92411))

(declare-fun e!696071 () Bool)

(declare-fun array_inv!29033 (array!79099) Bool)

(assert (=> start!101766 (and (array_inv!29033 _values!996) e!696071)))

(declare-fun mapNonEmpty!48637 () Bool)

(declare-fun mapRes!48637 () Bool)

(declare-fun tp!92410 () Bool)

(declare-fun e!696072 () Bool)

(assert (=> mapNonEmpty!48637 (= mapRes!48637 (and tp!92410 e!696072))))

(declare-fun mapRest!48637 () (Array (_ BitVec 32) ValueCell!14870))

(declare-fun mapValue!48637 () ValueCell!14870)

(declare-fun mapKey!48637 () (_ BitVec 32))

(assert (=> mapNonEmpty!48637 (= (arr!38176 _values!996) (store mapRest!48637 mapKey!48637 mapValue!48637))))

(declare-fun b!1225562 () Bool)

(declare-fun res!814446 () Bool)

(assert (=> b!1225562 (=> (not res!814446) (not e!696075))))

(assert (=> b!1225562 (= res!814446 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38711 _keys!1208))))))

(declare-fun b!1225563 () Bool)

(declare-fun res!814444 () Bool)

(assert (=> b!1225563 (=> (not res!814444) (not e!696075))))

(assert (=> b!1225563 (= res!814444 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26952))))

(declare-fun b!1225564 () Bool)

(assert (=> b!1225564 (= e!696072 tp_is_empty!31159)))

(declare-fun mapIsEmpty!48637 () Bool)

(assert (=> mapIsEmpty!48637 mapRes!48637))

(declare-fun b!1225565 () Bool)

(assert (=> b!1225565 (= e!696075 e!696073)))

(declare-fun res!814450 () Bool)

(assert (=> b!1225565 (=> (not res!814450) (not e!696073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79097 (_ BitVec 32)) Bool)

(assert (=> b!1225565 (= res!814450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558494 mask!1564))))

(assert (=> b!1225565 (= lt!558494 (array!79098 (store (arr!38175 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38711 _keys!1208)))))

(declare-fun b!1225566 () Bool)

(declare-fun res!814453 () Bool)

(assert (=> b!1225566 (=> (not res!814453) (not e!696075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225566 (= res!814453 (validKeyInArray!0 k!934))))

(declare-fun b!1225567 () Bool)

(assert (=> b!1225567 (= e!696071 (and e!696069 mapRes!48637))))

(declare-fun condMapEmpty!48637 () Bool)

(declare-fun mapDefault!48637 () ValueCell!14870)

