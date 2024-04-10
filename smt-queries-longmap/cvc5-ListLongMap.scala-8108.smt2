; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99514 () Bool)

(assert start!99514)

(declare-fun b_free!25093 () Bool)

(declare-fun b_next!25093 () Bool)

(assert (=> start!99514 (= b_free!25093 (not b_next!25093))))

(declare-fun tp!87993 () Bool)

(declare-fun b_and!41053 () Bool)

(assert (=> start!99514 (= tp!87993 b_and!41053)))

(declare-fun b!1176865 () Bool)

(declare-fun e!668999 () Bool)

(declare-fun e!668997 () Bool)

(assert (=> b!1176865 (= e!668999 e!668997)))

(declare-fun res!781701 () Bool)

(assert (=> b!1176865 (=> res!781701 e!668997)))

(declare-datatypes ((array!76053 0))(
  ( (array!76054 (arr!36676 (Array (_ BitVec 32) (_ BitVec 64))) (size!37212 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76053)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176865 (= res!781701 (not (= (select (arr!36676 _keys!1208) from!1455) k!934)))))

(declare-fun b!1176866 () Bool)

(declare-fun res!781690 () Bool)

(declare-fun e!668998 () Bool)

(assert (=> b!1176866 (=> (not res!781690) (not e!668998))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76053 (_ BitVec 32)) Bool)

(assert (=> b!1176866 (= res!781690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176867 () Bool)

(declare-fun e!669000 () Bool)

(declare-fun tp_is_empty!29623 () Bool)

(assert (=> b!1176867 (= e!669000 tp_is_empty!29623)))

(declare-fun res!781695 () Bool)

(assert (=> start!99514 (=> (not res!781695) (not e!668998))))

(assert (=> start!99514 (= res!781695 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37212 _keys!1208))))))

(assert (=> start!99514 e!668998))

(assert (=> start!99514 tp_is_empty!29623))

(declare-fun array_inv!28010 (array!76053) Bool)

(assert (=> start!99514 (array_inv!28010 _keys!1208)))

(assert (=> start!99514 true))

(assert (=> start!99514 tp!87993))

(declare-datatypes ((V!44625 0))(
  ( (V!44626 (val!14868 Int)) )
))
(declare-datatypes ((ValueCell!14102 0))(
  ( (ValueCellFull!14102 (v!17506 V!44625)) (EmptyCell!14102) )
))
(declare-datatypes ((array!76055 0))(
  ( (array!76056 (arr!36677 (Array (_ BitVec 32) ValueCell!14102)) (size!37213 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76055)

(declare-fun e!668990 () Bool)

(declare-fun array_inv!28011 (array!76055) Bool)

(assert (=> start!99514 (and (array_inv!28011 _values!996) e!668990)))

(declare-fun b!1176868 () Bool)

(declare-fun e!668992 () Bool)

(declare-fun e!668994 () Bool)

(assert (=> b!1176868 (= e!668992 e!668994)))

(declare-fun res!781700 () Bool)

(assert (=> b!1176868 (=> res!781700 e!668994)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176868 (= res!781700 (not (validKeyInArray!0 (select (arr!36676 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19016 0))(
  ( (tuple2!19017 (_1!9519 (_ BitVec 64)) (_2!9519 V!44625)) )
))
(declare-datatypes ((List!25754 0))(
  ( (Nil!25751) (Cons!25750 (h!26959 tuple2!19016) (t!37839 List!25754)) )
))
(declare-datatypes ((ListLongMap!16985 0))(
  ( (ListLongMap!16986 (toList!8508 List!25754)) )
))
(declare-fun lt!531268 () ListLongMap!16985)

(declare-fun lt!531267 () ListLongMap!16985)

(assert (=> b!1176868 (= lt!531268 lt!531267)))

(declare-fun lt!531264 () ListLongMap!16985)

(declare-fun -!1559 (ListLongMap!16985 (_ BitVec 64)) ListLongMap!16985)

(assert (=> b!1176868 (= lt!531267 (-!1559 lt!531264 k!934))))

(declare-fun zeroValue!944 () V!44625)

(declare-fun lt!531270 () array!76055)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44625)

(declare-fun lt!531271 () array!76053)

(declare-fun getCurrentListMapNoExtraKeys!4966 (array!76053 array!76055 (_ BitVec 32) (_ BitVec 32) V!44625 V!44625 (_ BitVec 32) Int) ListLongMap!16985)

(assert (=> b!1176868 (= lt!531268 (getCurrentListMapNoExtraKeys!4966 lt!531271 lt!531270 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176868 (= lt!531264 (getCurrentListMapNoExtraKeys!4966 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38858 0))(
  ( (Unit!38859) )
))
(declare-fun lt!531260 () Unit!38858)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!786 (array!76053 array!76055 (_ BitVec 32) (_ BitVec 32) V!44625 V!44625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38858)

(assert (=> b!1176868 (= lt!531260 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46262 () Bool)

(declare-fun mapRes!46262 () Bool)

(declare-fun tp!87992 () Bool)

(assert (=> mapNonEmpty!46262 (= mapRes!46262 (and tp!87992 e!669000))))

(declare-fun mapKey!46262 () (_ BitVec 32))

(declare-fun mapValue!46262 () ValueCell!14102)

(declare-fun mapRest!46262 () (Array (_ BitVec 32) ValueCell!14102))

(assert (=> mapNonEmpty!46262 (= (arr!36677 _values!996) (store mapRest!46262 mapKey!46262 mapValue!46262))))

(declare-fun b!1176869 () Bool)

(declare-fun res!781698 () Bool)

(assert (=> b!1176869 (=> (not res!781698) (not e!668998))))

(assert (=> b!1176869 (= res!781698 (= (select (arr!36676 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!46262 () Bool)

(assert (=> mapIsEmpty!46262 mapRes!46262))

(declare-fun b!1176870 () Bool)

(declare-fun res!781692 () Bool)

(assert (=> b!1176870 (=> (not res!781692) (not e!668998))))

(assert (=> b!1176870 (= res!781692 (and (= (size!37213 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37212 _keys!1208) (size!37213 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176871 () Bool)

(declare-fun res!781694 () Bool)

(assert (=> b!1176871 (=> (not res!781694) (not e!668998))))

(declare-datatypes ((List!25755 0))(
  ( (Nil!25752) (Cons!25751 (h!26960 (_ BitVec 64)) (t!37840 List!25755)) )
))
(declare-fun arrayNoDuplicates!0 (array!76053 (_ BitVec 32) List!25755) Bool)

(assert (=> b!1176871 (= res!781694 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25752))))

(declare-fun b!1176872 () Bool)

(declare-fun res!781702 () Bool)

(declare-fun e!668991 () Bool)

(assert (=> b!1176872 (=> (not res!781702) (not e!668991))))

(assert (=> b!1176872 (= res!781702 (arrayNoDuplicates!0 lt!531271 #b00000000000000000000000000000000 Nil!25752))))

(declare-fun b!1176873 () Bool)

(declare-fun e!668989 () Bool)

(assert (=> b!1176873 (= e!668990 (and e!668989 mapRes!46262))))

(declare-fun condMapEmpty!46262 () Bool)

(declare-fun mapDefault!46262 () ValueCell!14102)

