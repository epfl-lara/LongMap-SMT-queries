; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99956 () Bool)

(assert start!99956)

(declare-fun b_free!25535 () Bool)

(declare-fun b_next!25535 () Bool)

(assert (=> start!99956 (= b_free!25535 (not b_next!25535))))

(declare-fun tp!89318 () Bool)

(declare-fun b_and!41937 () Bool)

(assert (=> start!99956 (= tp!89318 b_and!41937)))

(declare-fun b!1190246 () Bool)

(declare-fun res!791574 () Bool)

(declare-fun e!676666 () Bool)

(assert (=> b!1190246 (=> (not res!791574) (not e!676666))))

(declare-datatypes ((array!76921 0))(
  ( (array!76922 (arr!37110 (Array (_ BitVec 32) (_ BitVec 64))) (size!37646 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76921)

(declare-datatypes ((List!26126 0))(
  ( (Nil!26123) (Cons!26122 (h!27331 (_ BitVec 64)) (t!38653 List!26126)) )
))
(declare-fun arrayNoDuplicates!0 (array!76921 (_ BitVec 32) List!26126) Bool)

(assert (=> b!1190246 (= res!791574 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26123))))

(declare-fun b!1190247 () Bool)

(declare-fun res!791570 () Bool)

(declare-fun e!676661 () Bool)

(assert (=> b!1190247 (=> (not res!791570) (not e!676661))))

(declare-fun lt!541380 () array!76921)

(assert (=> b!1190247 (= res!791570 (arrayNoDuplicates!0 lt!541380 #b00000000000000000000000000000000 Nil!26123))))

(declare-fun b!1190248 () Bool)

(declare-fun res!791572 () Bool)

(assert (=> b!1190248 (=> (not res!791572) (not e!676666))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190248 (= res!791572 (validMask!0 mask!1564))))

(declare-fun b!1190249 () Bool)

(declare-fun res!791573 () Bool)

(assert (=> b!1190249 (=> (not res!791573) (not e!676666))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190249 (= res!791573 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37646 _keys!1208))))))

(declare-fun b!1190250 () Bool)

(declare-fun res!791571 () Bool)

(assert (=> b!1190250 (=> (not res!791571) (not e!676666))))

(declare-datatypes ((V!45213 0))(
  ( (V!45214 (val!15089 Int)) )
))
(declare-datatypes ((ValueCell!14323 0))(
  ( (ValueCellFull!14323 (v!17727 V!45213)) (EmptyCell!14323) )
))
(declare-datatypes ((array!76923 0))(
  ( (array!76924 (arr!37111 (Array (_ BitVec 32) ValueCell!14323)) (size!37647 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76923)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1190250 (= res!791571 (and (= (size!37647 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37646 _keys!1208) (size!37647 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190251 () Bool)

(declare-fun res!791568 () Bool)

(assert (=> b!1190251 (=> (not res!791568) (not e!676666))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190251 (= res!791568 (validKeyInArray!0 k!934))))

(declare-fun b!1190252 () Bool)

(declare-fun e!676664 () Bool)

(assert (=> b!1190252 (= e!676664 true)))

(declare-fun zeroValue!944 () V!45213)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!541375 () array!76923)

(declare-fun minValue!944 () V!45213)

(declare-datatypes ((tuple2!19380 0))(
  ( (tuple2!19381 (_1!9701 (_ BitVec 64)) (_2!9701 V!45213)) )
))
(declare-datatypes ((List!26127 0))(
  ( (Nil!26124) (Cons!26123 (h!27332 tuple2!19380) (t!38654 List!26127)) )
))
(declare-datatypes ((ListLongMap!17349 0))(
  ( (ListLongMap!17350 (toList!8690 List!26127)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5131 (array!76921 array!76923 (_ BitVec 32) (_ BitVec 32) V!45213 V!45213 (_ BitVec 32) Int) ListLongMap!17349)

(declare-fun -!1717 (ListLongMap!17349 (_ BitVec 64)) ListLongMap!17349)

(assert (=> b!1190252 (= (getCurrentListMapNoExtraKeys!5131 lt!541380 lt!541375 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1717 (getCurrentListMapNoExtraKeys!5131 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39476 0))(
  ( (Unit!39477) )
))
(declare-fun lt!541378 () Unit!39476)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!926 (array!76921 array!76923 (_ BitVec 32) (_ BitVec 32) V!45213 V!45213 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39476)

(assert (=> b!1190252 (= lt!541378 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!926 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190253 () Bool)

(declare-fun e!676665 () Bool)

(assert (=> b!1190253 (= e!676665 e!676664)))

(declare-fun res!791566 () Bool)

(assert (=> b!1190253 (=> res!791566 e!676664)))

(assert (=> b!1190253 (= res!791566 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541376 () ListLongMap!17349)

(assert (=> b!1190253 (= lt!541376 (getCurrentListMapNoExtraKeys!5131 lt!541380 lt!541375 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3072 (Int (_ BitVec 64)) V!45213)

(assert (=> b!1190253 (= lt!541375 (array!76924 (store (arr!37111 _values!996) i!673 (ValueCellFull!14323 (dynLambda!3072 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37647 _values!996)))))

(declare-fun lt!541377 () ListLongMap!17349)

(assert (=> b!1190253 (= lt!541377 (getCurrentListMapNoExtraKeys!5131 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190254 () Bool)

(declare-fun e!676660 () Bool)

(declare-fun tp_is_empty!30065 () Bool)

(assert (=> b!1190254 (= e!676660 tp_is_empty!30065)))

(declare-fun mapNonEmpty!46925 () Bool)

(declare-fun mapRes!46925 () Bool)

(declare-fun tp!89319 () Bool)

(assert (=> mapNonEmpty!46925 (= mapRes!46925 (and tp!89319 e!676660))))

(declare-fun mapRest!46925 () (Array (_ BitVec 32) ValueCell!14323))

(declare-fun mapValue!46925 () ValueCell!14323)

(declare-fun mapKey!46925 () (_ BitVec 32))

(assert (=> mapNonEmpty!46925 (= (arr!37111 _values!996) (store mapRest!46925 mapKey!46925 mapValue!46925))))

(declare-fun b!1190255 () Bool)

(declare-fun res!791569 () Bool)

(assert (=> b!1190255 (=> (not res!791569) (not e!676666))))

(assert (=> b!1190255 (= res!791569 (= (select (arr!37110 _keys!1208) i!673) k!934))))

(declare-fun b!1190256 () Bool)

(declare-fun e!676659 () Bool)

(declare-fun e!676663 () Bool)

(assert (=> b!1190256 (= e!676659 (and e!676663 mapRes!46925))))

(declare-fun condMapEmpty!46925 () Bool)

(declare-fun mapDefault!46925 () ValueCell!14323)

