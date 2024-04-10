; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100048 () Bool)

(assert start!100048)

(declare-fun b_free!25627 () Bool)

(declare-fun b_next!25627 () Bool)

(assert (=> start!100048 (= b_free!25627 (not b_next!25627))))

(declare-fun tp!89595 () Bool)

(declare-fun b_and!42121 () Bool)

(assert (=> start!100048 (= tp!89595 b_and!42121)))

(declare-fun b!1192408 () Bool)

(declare-fun res!793228 () Bool)

(declare-fun e!677763 () Bool)

(assert (=> b!1192408 (=> (not res!793228) (not e!677763))))

(declare-datatypes ((array!77099 0))(
  ( (array!77100 (arr!37199 (Array (_ BitVec 32) (_ BitVec 64))) (size!37735 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77099)

(declare-datatypes ((List!26195 0))(
  ( (Nil!26192) (Cons!26191 (h!27400 (_ BitVec 64)) (t!38814 List!26195)) )
))
(declare-fun arrayNoDuplicates!0 (array!77099 (_ BitVec 32) List!26195) Bool)

(assert (=> b!1192408 (= res!793228 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26192))))

(declare-fun res!793229 () Bool)

(assert (=> start!100048 (=> (not res!793229) (not e!677763))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100048 (= res!793229 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37735 _keys!1208))))))

(assert (=> start!100048 e!677763))

(declare-fun tp_is_empty!30157 () Bool)

(assert (=> start!100048 tp_is_empty!30157))

(declare-fun array_inv!28364 (array!77099) Bool)

(assert (=> start!100048 (array_inv!28364 _keys!1208)))

(assert (=> start!100048 true))

(assert (=> start!100048 tp!89595))

(declare-datatypes ((V!45337 0))(
  ( (V!45338 (val!15135 Int)) )
))
(declare-datatypes ((ValueCell!14369 0))(
  ( (ValueCellFull!14369 (v!17773 V!45337)) (EmptyCell!14369) )
))
(declare-datatypes ((array!77101 0))(
  ( (array!77102 (arr!37200 (Array (_ BitVec 32) ValueCell!14369)) (size!37736 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77101)

(declare-fun e!677769 () Bool)

(declare-fun array_inv!28365 (array!77101) Bool)

(assert (=> start!100048 (and (array_inv!28365 _values!996) e!677769)))

(declare-fun b!1192409 () Bool)

(declare-fun res!793221 () Bool)

(assert (=> b!1192409 (=> (not res!793221) (not e!677763))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77099 (_ BitVec 32)) Bool)

(assert (=> b!1192409 (= res!793221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192410 () Bool)

(declare-fun res!793224 () Bool)

(declare-fun e!677767 () Bool)

(assert (=> b!1192410 (=> (not res!793224) (not e!677767))))

(declare-fun lt!542203 () array!77099)

(assert (=> b!1192410 (= res!793224 (arrayNoDuplicates!0 lt!542203 #b00000000000000000000000000000000 Nil!26192))))

(declare-fun b!1192411 () Bool)

(assert (=> b!1192411 (= e!677763 e!677767)))

(declare-fun res!793223 () Bool)

(assert (=> b!1192411 (=> (not res!793223) (not e!677767))))

(assert (=> b!1192411 (= res!793223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542203 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192411 (= lt!542203 (array!77100 (store (arr!37199 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37735 _keys!1208)))))

(declare-fun b!1192412 () Bool)

(declare-fun res!793231 () Bool)

(assert (=> b!1192412 (=> (not res!793231) (not e!677763))))

(assert (=> b!1192412 (= res!793231 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37735 _keys!1208))))))

(declare-fun b!1192413 () Bool)

(declare-fun e!677765 () Bool)

(assert (=> b!1192413 (= e!677765 true)))

(declare-fun zeroValue!944 () V!45337)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!542207 () array!77101)

(declare-fun minValue!944 () V!45337)

(declare-datatypes ((tuple2!19452 0))(
  ( (tuple2!19453 (_1!9737 (_ BitVec 64)) (_2!9737 V!45337)) )
))
(declare-datatypes ((List!26196 0))(
  ( (Nil!26193) (Cons!26192 (h!27401 tuple2!19452) (t!38815 List!26196)) )
))
(declare-datatypes ((ListLongMap!17421 0))(
  ( (ListLongMap!17422 (toList!8726 List!26196)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5167 (array!77099 array!77101 (_ BitVec 32) (_ BitVec 32) V!45337 V!45337 (_ BitVec 32) Int) ListLongMap!17421)

(declare-fun -!1751 (ListLongMap!17421 (_ BitVec 64)) ListLongMap!17421)

(assert (=> b!1192413 (= (getCurrentListMapNoExtraKeys!5167 lt!542203 lt!542207 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1751 (getCurrentListMapNoExtraKeys!5167 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39556 0))(
  ( (Unit!39557) )
))
(declare-fun lt!542208 () Unit!39556)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!960 (array!77099 array!77101 (_ BitVec 32) (_ BitVec 32) V!45337 V!45337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39556)

(assert (=> b!1192413 (= lt!542208 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!960 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192414 () Bool)

(declare-fun res!793220 () Bool)

(assert (=> b!1192414 (=> (not res!793220) (not e!677763))))

(assert (=> b!1192414 (= res!793220 (and (= (size!37736 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37735 _keys!1208) (size!37736 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192415 () Bool)

(declare-fun e!677768 () Bool)

(assert (=> b!1192415 (= e!677768 tp_is_empty!30157)))

(declare-fun b!1192416 () Bool)

(declare-fun res!793230 () Bool)

(assert (=> b!1192416 (=> (not res!793230) (not e!677763))))

(assert (=> b!1192416 (= res!793230 (= (select (arr!37199 _keys!1208) i!673) k!934))))

(declare-fun b!1192417 () Bool)

(declare-fun e!677766 () Bool)

(assert (=> b!1192417 (= e!677767 (not e!677766))))

(declare-fun res!793222 () Bool)

(assert (=> b!1192417 (=> res!793222 e!677766)))

(assert (=> b!1192417 (= res!793222 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192417 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!542204 () Unit!39556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77099 (_ BitVec 64) (_ BitVec 32)) Unit!39556)

(assert (=> b!1192417 (= lt!542204 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1192418 () Bool)

(declare-fun mapRes!47063 () Bool)

(assert (=> b!1192418 (= e!677769 (and e!677768 mapRes!47063))))

(declare-fun condMapEmpty!47063 () Bool)

(declare-fun mapDefault!47063 () ValueCell!14369)

