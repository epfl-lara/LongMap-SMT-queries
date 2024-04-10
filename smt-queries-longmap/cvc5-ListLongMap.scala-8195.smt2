; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100036 () Bool)

(assert start!100036)

(declare-fun b_free!25615 () Bool)

(declare-fun b_next!25615 () Bool)

(assert (=> start!100036 (= b_free!25615 (not b_next!25615))))

(declare-fun tp!89558 () Bool)

(declare-fun b_and!42097 () Bool)

(assert (=> start!100036 (= tp!89558 b_and!42097)))

(declare-fun b!1192126 () Bool)

(declare-fun res!793004 () Bool)

(declare-fun e!677624 () Bool)

(assert (=> b!1192126 (=> (not res!793004) (not e!677624))))

(declare-datatypes ((array!77079 0))(
  ( (array!77080 (arr!37189 (Array (_ BitVec 32) (_ BitVec 64))) (size!37725 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77079)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45321 0))(
  ( (V!45322 (val!15129 Int)) )
))
(declare-datatypes ((ValueCell!14363 0))(
  ( (ValueCellFull!14363 (v!17767 V!45321)) (EmptyCell!14363) )
))
(declare-datatypes ((array!77081 0))(
  ( (array!77082 (arr!37190 (Array (_ BitVec 32) ValueCell!14363)) (size!37726 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77081)

(assert (=> b!1192126 (= res!793004 (and (= (size!37726 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37725 _keys!1208) (size!37726 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47045 () Bool)

(declare-fun mapRes!47045 () Bool)

(assert (=> mapIsEmpty!47045 mapRes!47045))

(declare-fun b!1192127 () Bool)

(declare-fun e!677625 () Bool)

(declare-fun e!677620 () Bool)

(assert (=> b!1192127 (= e!677625 (not e!677620))))

(declare-fun res!793007 () Bool)

(assert (=> b!1192127 (=> res!793007 e!677620)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192127 (= res!793007 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192127 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39548 0))(
  ( (Unit!39549) )
))
(declare-fun lt!542095 () Unit!39548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77079 (_ BitVec 64) (_ BitVec 32)) Unit!39548)

(assert (=> b!1192127 (= lt!542095 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1192128 () Bool)

(declare-fun res!793008 () Bool)

(assert (=> b!1192128 (=> (not res!793008) (not e!677624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77079 (_ BitVec 32)) Bool)

(assert (=> b!1192128 (= res!793008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192129 () Bool)

(declare-fun e!677619 () Bool)

(declare-fun tp_is_empty!30145 () Bool)

(assert (=> b!1192129 (= e!677619 tp_is_empty!30145)))

(declare-fun b!1192130 () Bool)

(declare-fun e!677622 () Bool)

(assert (=> b!1192130 (= e!677620 e!677622)))

(declare-fun res!793009 () Bool)

(assert (=> b!1192130 (=> res!793009 e!677622)))

(assert (=> b!1192130 (= res!793009 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45321)

(declare-fun lt!542098 () array!77079)

(declare-fun lt!542100 () array!77081)

(declare-datatypes ((tuple2!19446 0))(
  ( (tuple2!19447 (_1!9734 (_ BitVec 64)) (_2!9734 V!45321)) )
))
(declare-datatypes ((List!26190 0))(
  ( (Nil!26187) (Cons!26186 (h!27395 tuple2!19446) (t!38797 List!26190)) )
))
(declare-datatypes ((ListLongMap!17415 0))(
  ( (ListLongMap!17416 (toList!8723 List!26190)) )
))
(declare-fun lt!542097 () ListLongMap!17415)

(declare-fun minValue!944 () V!45321)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5164 (array!77079 array!77081 (_ BitVec 32) (_ BitVec 32) V!45321 V!45321 (_ BitVec 32) Int) ListLongMap!17415)

(assert (=> b!1192130 (= lt!542097 (getCurrentListMapNoExtraKeys!5164 lt!542098 lt!542100 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3097 (Int (_ BitVec 64)) V!45321)

(assert (=> b!1192130 (= lt!542100 (array!77082 (store (arr!37190 _values!996) i!673 (ValueCellFull!14363 (dynLambda!3097 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37726 _values!996)))))

(declare-fun lt!542096 () ListLongMap!17415)

(assert (=> b!1192130 (= lt!542096 (getCurrentListMapNoExtraKeys!5164 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192131 () Bool)

(declare-fun res!793011 () Bool)

(assert (=> b!1192131 (=> (not res!793011) (not e!677624))))

(assert (=> b!1192131 (= res!793011 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37725 _keys!1208))))))

(declare-fun mapNonEmpty!47045 () Bool)

(declare-fun tp!89559 () Bool)

(declare-fun e!677623 () Bool)

(assert (=> mapNonEmpty!47045 (= mapRes!47045 (and tp!89559 e!677623))))

(declare-fun mapValue!47045 () ValueCell!14363)

(declare-fun mapKey!47045 () (_ BitVec 32))

(declare-fun mapRest!47045 () (Array (_ BitVec 32) ValueCell!14363))

(assert (=> mapNonEmpty!47045 (= (arr!37190 _values!996) (store mapRest!47045 mapKey!47045 mapValue!47045))))

(declare-fun b!1192132 () Bool)

(declare-fun res!793014 () Bool)

(assert (=> b!1192132 (=> (not res!793014) (not e!677624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192132 (= res!793014 (validMask!0 mask!1564))))

(declare-fun b!1192133 () Bool)

(assert (=> b!1192133 (= e!677622 true)))

(declare-fun -!1748 (ListLongMap!17415 (_ BitVec 64)) ListLongMap!17415)

(assert (=> b!1192133 (= (getCurrentListMapNoExtraKeys!5164 lt!542098 lt!542100 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1748 (getCurrentListMapNoExtraKeys!5164 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!542099 () Unit!39548)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!957 (array!77079 array!77081 (_ BitVec 32) (_ BitVec 32) V!45321 V!45321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39548)

(assert (=> b!1192133 (= lt!542099 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!957 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!793010 () Bool)

(assert (=> start!100036 (=> (not res!793010) (not e!677624))))

(assert (=> start!100036 (= res!793010 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37725 _keys!1208))))))

(assert (=> start!100036 e!677624))

(assert (=> start!100036 tp_is_empty!30145))

(declare-fun array_inv!28358 (array!77079) Bool)

(assert (=> start!100036 (array_inv!28358 _keys!1208)))

(assert (=> start!100036 true))

(assert (=> start!100036 tp!89558))

(declare-fun e!677626 () Bool)

(declare-fun array_inv!28359 (array!77081) Bool)

(assert (=> start!100036 (and (array_inv!28359 _values!996) e!677626)))

(declare-fun b!1192134 () Bool)

(assert (=> b!1192134 (= e!677624 e!677625)))

(declare-fun res!793015 () Bool)

(assert (=> b!1192134 (=> (not res!793015) (not e!677625))))

(assert (=> b!1192134 (= res!793015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542098 mask!1564))))

(assert (=> b!1192134 (= lt!542098 (array!77080 (store (arr!37189 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37725 _keys!1208)))))

(declare-fun b!1192135 () Bool)

(assert (=> b!1192135 (= e!677626 (and e!677619 mapRes!47045))))

(declare-fun condMapEmpty!47045 () Bool)

(declare-fun mapDefault!47045 () ValueCell!14363)

