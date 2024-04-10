; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99712 () Bool)

(assert start!99712)

(declare-fun b_free!25291 () Bool)

(declare-fun b_next!25291 () Bool)

(assert (=> start!99712 (= b_free!25291 (not b_next!25291))))

(declare-fun tp!88587 () Bool)

(declare-fun b_and!41449 () Bool)

(assert (=> start!99712 (= tp!88587 b_and!41449)))

(declare-fun b!1183307 () Bool)

(declare-fun e!672767 () Bool)

(declare-fun e!672776 () Bool)

(assert (=> b!1183307 (= e!672767 e!672776)))

(declare-fun res!786463 () Bool)

(assert (=> b!1183307 (=> res!786463 e!672776)))

(declare-datatypes ((array!76443 0))(
  ( (array!76444 (arr!36871 (Array (_ BitVec 32) (_ BitVec 64))) (size!37407 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76443)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183307 (= res!786463 (not (validKeyInArray!0 (select (arr!36871 _keys!1208) from!1455))))))

(declare-datatypes ((V!44889 0))(
  ( (V!44890 (val!14967 Int)) )
))
(declare-datatypes ((tuple2!19188 0))(
  ( (tuple2!19189 (_1!9605 (_ BitVec 64)) (_2!9605 V!44889)) )
))
(declare-datatypes ((List!25928 0))(
  ( (Nil!25925) (Cons!25924 (h!27133 tuple2!19188) (t!38211 List!25928)) )
))
(declare-datatypes ((ListLongMap!17157 0))(
  ( (ListLongMap!17158 (toList!8594 List!25928)) )
))
(declare-fun lt!536061 () ListLongMap!17157)

(declare-fun lt!536056 () ListLongMap!17157)

(assert (=> b!1183307 (= lt!536061 lt!536056)))

(declare-fun lt!536057 () ListLongMap!17157)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1629 (ListLongMap!17157 (_ BitVec 64)) ListLongMap!17157)

(assert (=> b!1183307 (= lt!536056 (-!1629 lt!536057 k!934))))

(declare-fun zeroValue!944 () V!44889)

(declare-datatypes ((ValueCell!14201 0))(
  ( (ValueCellFull!14201 (v!17605 V!44889)) (EmptyCell!14201) )
))
(declare-datatypes ((array!76445 0))(
  ( (array!76446 (arr!36872 (Array (_ BitVec 32) ValueCell!14201)) (size!37408 (_ BitVec 32))) )
))
(declare-fun lt!536060 () array!76445)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!536064 () array!76443)

(declare-fun minValue!944 () V!44889)

(declare-fun getCurrentListMapNoExtraKeys!5045 (array!76443 array!76445 (_ BitVec 32) (_ BitVec 32) V!44889 V!44889 (_ BitVec 32) Int) ListLongMap!17157)

(assert (=> b!1183307 (= lt!536061 (getCurrentListMapNoExtraKeys!5045 lt!536064 lt!536060 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76445)

(assert (=> b!1183307 (= lt!536057 (getCurrentListMapNoExtraKeys!5045 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39161 0))(
  ( (Unit!39162) )
))
(declare-fun lt!536052 () Unit!39161)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!851 (array!76443 array!76445 (_ BitVec 32) (_ BitVec 32) V!44889 V!44889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39161)

(assert (=> b!1183307 (= lt!536052 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!851 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183308 () Bool)

(assert (=> b!1183308 (= e!672776 true)))

(declare-fun lt!536054 () ListLongMap!17157)

(declare-fun lt!536063 () ListLongMap!17157)

(assert (=> b!1183308 (= (-!1629 lt!536054 k!934) lt!536063)))

(declare-fun lt!536049 () Unit!39161)

(declare-fun lt!536055 () V!44889)

(declare-fun addRemoveCommutativeForDiffKeys!155 (ListLongMap!17157 (_ BitVec 64) V!44889 (_ BitVec 64)) Unit!39161)

(assert (=> b!1183308 (= lt!536049 (addRemoveCommutativeForDiffKeys!155 lt!536057 (select (arr!36871 _keys!1208) from!1455) lt!536055 k!934))))

(declare-fun lt!536058 () ListLongMap!17157)

(assert (=> b!1183308 (and (= lt!536058 lt!536054) (= lt!536056 lt!536061))))

(declare-fun lt!536051 () tuple2!19188)

(declare-fun +!3892 (ListLongMap!17157 tuple2!19188) ListLongMap!17157)

(assert (=> b!1183308 (= lt!536054 (+!3892 lt!536057 lt!536051))))

(assert (=> b!1183308 (not (= (select (arr!36871 _keys!1208) from!1455) k!934))))

(declare-fun lt!536046 () Unit!39161)

(declare-fun e!672768 () Unit!39161)

(assert (=> b!1183308 (= lt!536046 e!672768)))

(declare-fun c!117060 () Bool)

(assert (=> b!1183308 (= c!117060 (= (select (arr!36871 _keys!1208) from!1455) k!934))))

(declare-fun e!672775 () Bool)

(assert (=> b!1183308 e!672775))

(declare-fun res!786451 () Bool)

(assert (=> b!1183308 (=> (not res!786451) (not e!672775))))

(declare-fun lt!536059 () ListLongMap!17157)

(assert (=> b!1183308 (= res!786451 (= lt!536059 lt!536063))))

(assert (=> b!1183308 (= lt!536063 (+!3892 lt!536056 lt!536051))))

(assert (=> b!1183308 (= lt!536051 (tuple2!19189 (select (arr!36871 _keys!1208) from!1455) lt!536055))))

(declare-fun lt!536062 () V!44889)

(declare-fun get!18863 (ValueCell!14201 V!44889) V!44889)

(assert (=> b!1183308 (= lt!536055 (get!18863 (select (arr!36872 _values!996) from!1455) lt!536062))))

(declare-fun b!1183309 () Bool)

(declare-fun e!672770 () Bool)

(declare-fun tp_is_empty!29821 () Bool)

(assert (=> b!1183309 (= e!672770 tp_is_empty!29821)))

(declare-fun b!1183310 () Bool)

(declare-fun res!786454 () Bool)

(declare-fun e!672778 () Bool)

(assert (=> b!1183310 (=> (not res!786454) (not e!672778))))

(assert (=> b!1183310 (= res!786454 (validKeyInArray!0 k!934))))

(declare-fun b!1183311 () Bool)

(declare-fun e!672772 () Bool)

(declare-fun mapRes!46559 () Bool)

(assert (=> b!1183311 (= e!672772 (and e!672770 mapRes!46559))))

(declare-fun condMapEmpty!46559 () Bool)

(declare-fun mapDefault!46559 () ValueCell!14201)

