; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99536 () Bool)

(assert start!99536)

(declare-fun b_free!25115 () Bool)

(declare-fun b_next!25115 () Bool)

(assert (=> start!99536 (= b_free!25115 (not b_next!25115))))

(declare-fun tp!88058 () Bool)

(declare-fun b_and!41097 () Bool)

(assert (=> start!99536 (= tp!88058 b_and!41097)))

(declare-fun b!1177580 () Bool)

(declare-fun e!669422 () Bool)

(assert (=> b!1177580 (= e!669422 true)))

(declare-fun e!669418 () Bool)

(assert (=> b!1177580 e!669418))

(declare-fun res!782232 () Bool)

(assert (=> b!1177580 (=> (not res!782232) (not e!669418))))

(declare-datatypes ((array!76097 0))(
  ( (array!76098 (arr!36698 (Array (_ BitVec 32) (_ BitVec 64))) (size!37234 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76097)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177580 (= res!782232 (not (= (select (arr!36698 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38893 0))(
  ( (Unit!38894) )
))
(declare-fun lt!531754 () Unit!38893)

(declare-fun e!669426 () Unit!38893)

(assert (=> b!1177580 (= lt!531754 e!669426)))

(declare-fun c!116796 () Bool)

(assert (=> b!1177580 (= c!116796 (= (select (arr!36698 _keys!1208) from!1455) k!934))))

(declare-fun e!669429 () Bool)

(assert (=> b!1177580 e!669429))

(declare-fun res!782225 () Bool)

(assert (=> b!1177580 (=> (not res!782225) (not e!669429))))

(declare-datatypes ((V!44653 0))(
  ( (V!44654 (val!14879 Int)) )
))
(declare-datatypes ((tuple2!19038 0))(
  ( (tuple2!19039 (_1!9530 (_ BitVec 64)) (_2!9530 V!44653)) )
))
(declare-datatypes ((List!25775 0))(
  ( (Nil!25772) (Cons!25771 (h!26980 tuple2!19038) (t!37882 List!25775)) )
))
(declare-datatypes ((ListLongMap!17007 0))(
  ( (ListLongMap!17008 (toList!8519 List!25775)) )
))
(declare-fun lt!531767 () ListLongMap!17007)

(declare-fun lt!531755 () ListLongMap!17007)

(declare-fun lt!531760 () tuple2!19038)

(declare-fun +!3834 (ListLongMap!17007 tuple2!19038) ListLongMap!17007)

(assert (=> b!1177580 (= res!782225 (= lt!531755 (+!3834 lt!531767 lt!531760)))))

(declare-datatypes ((ValueCell!14113 0))(
  ( (ValueCellFull!14113 (v!17517 V!44653)) (EmptyCell!14113) )
))
(declare-datatypes ((array!76099 0))(
  ( (array!76100 (arr!36699 (Array (_ BitVec 32) ValueCell!14113)) (size!37235 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76099)

(declare-fun lt!531759 () V!44653)

(declare-fun get!18752 (ValueCell!14113 V!44653) V!44653)

(assert (=> b!1177580 (= lt!531760 (tuple2!19039 (select (arr!36698 _keys!1208) from!1455) (get!18752 (select (arr!36699 _values!996) from!1455) lt!531759)))))

(declare-fun b!1177581 () Bool)

(declare-fun res!782230 () Bool)

(declare-fun e!669423 () Bool)

(assert (=> b!1177581 (=> (not res!782230) (not e!669423))))

(declare-datatypes ((List!25776 0))(
  ( (Nil!25773) (Cons!25772 (h!26981 (_ BitVec 64)) (t!37883 List!25776)) )
))
(declare-fun arrayNoDuplicates!0 (array!76097 (_ BitVec 32) List!25776) Bool)

(assert (=> b!1177581 (= res!782230 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25773))))

(declare-fun b!1177582 () Bool)

(declare-fun res!782218 () Bool)

(declare-fun e!669425 () Bool)

(assert (=> b!1177582 (=> (not res!782218) (not e!669425))))

(declare-fun lt!531763 () array!76097)

(assert (=> b!1177582 (= res!782218 (arrayNoDuplicates!0 lt!531763 #b00000000000000000000000000000000 Nil!25773))))

(declare-fun b!1177583 () Bool)

(declare-fun res!782231 () Bool)

(assert (=> b!1177583 (=> (not res!782231) (not e!669423))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1177583 (= res!782231 (and (= (size!37235 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37234 _keys!1208) (size!37235 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46295 () Bool)

(declare-fun mapRes!46295 () Bool)

(assert (=> mapIsEmpty!46295 mapRes!46295))

(declare-fun b!1177584 () Bool)

(declare-fun e!669421 () Bool)

(assert (=> b!1177584 (= e!669425 (not e!669421))))

(declare-fun res!782233 () Bool)

(assert (=> b!1177584 (=> res!782233 e!669421)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177584 (= res!782233 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177584 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!531761 () Unit!38893)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76097 (_ BitVec 64) (_ BitVec 32)) Unit!38893)

(assert (=> b!1177584 (= lt!531761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1177585 () Bool)

(declare-fun e!669428 () Bool)

(assert (=> b!1177585 (= e!669429 e!669428)))

(declare-fun res!782224 () Bool)

(assert (=> b!1177585 (=> res!782224 e!669428)))

(assert (=> b!1177585 (= res!782224 (not (= (select (arr!36698 _keys!1208) from!1455) k!934)))))

(declare-fun res!782228 () Bool)

(assert (=> start!99536 (=> (not res!782228) (not e!669423))))

(assert (=> start!99536 (= res!782228 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37234 _keys!1208))))))

(assert (=> start!99536 e!669423))

(declare-fun tp_is_empty!29645 () Bool)

(assert (=> start!99536 tp_is_empty!29645))

(declare-fun array_inv!28026 (array!76097) Bool)

(assert (=> start!99536 (array_inv!28026 _keys!1208)))

(assert (=> start!99536 true))

(assert (=> start!99536 tp!88058))

(declare-fun e!669420 () Bool)

(declare-fun array_inv!28027 (array!76099) Bool)

(assert (=> start!99536 (and (array_inv!28027 _values!996) e!669420)))

(declare-fun b!1177586 () Bool)

(declare-fun Unit!38895 () Unit!38893)

(assert (=> b!1177586 (= e!669426 Unit!38895)))

(declare-fun lt!531762 () Unit!38893)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76097 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38893)

(assert (=> b!1177586 (= lt!531762 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177586 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531765 () Unit!38893)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76097 (_ BitVec 32) (_ BitVec 32)) Unit!38893)

(assert (=> b!1177586 (= lt!531765 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177586 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25773)))

(declare-fun lt!531758 () Unit!38893)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76097 (_ BitVec 64) (_ BitVec 32) List!25776) Unit!38893)

(assert (=> b!1177586 (= lt!531758 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25773))))

(assert (=> b!1177586 false))

(declare-fun mapNonEmpty!46295 () Bool)

(declare-fun tp!88059 () Bool)

(declare-fun e!669430 () Bool)

(assert (=> mapNonEmpty!46295 (= mapRes!46295 (and tp!88059 e!669430))))

(declare-fun mapValue!46295 () ValueCell!14113)

(declare-fun mapKey!46295 () (_ BitVec 32))

(declare-fun mapRest!46295 () (Array (_ BitVec 32) ValueCell!14113))

(assert (=> mapNonEmpty!46295 (= (arr!36699 _values!996) (store mapRest!46295 mapKey!46295 mapValue!46295))))

(declare-fun b!1177587 () Bool)

(declare-fun e!669424 () Bool)

(assert (=> b!1177587 (= e!669424 e!669422)))

(declare-fun res!782221 () Bool)

(assert (=> b!1177587 (=> res!782221 e!669422)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177587 (= res!782221 (not (validKeyInArray!0 (select (arr!36698 _keys!1208) from!1455))))))

(declare-fun lt!531766 () ListLongMap!17007)

(assert (=> b!1177587 (= lt!531766 lt!531767)))

(declare-fun lt!531764 () ListLongMap!17007)

(declare-fun -!1568 (ListLongMap!17007 (_ BitVec 64)) ListLongMap!17007)

(assert (=> b!1177587 (= lt!531767 (-!1568 lt!531764 k!934))))

(declare-fun zeroValue!944 () V!44653)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44653)

(declare-fun lt!531757 () array!76099)

(declare-fun getCurrentListMapNoExtraKeys!4976 (array!76097 array!76099 (_ BitVec 32) (_ BitVec 32) V!44653 V!44653 (_ BitVec 32) Int) ListLongMap!17007)

(assert (=> b!1177587 (= lt!531766 (getCurrentListMapNoExtraKeys!4976 lt!531763 lt!531757 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177587 (= lt!531764 (getCurrentListMapNoExtraKeys!4976 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531768 () Unit!38893)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!795 (array!76097 array!76099 (_ BitVec 32) (_ BitVec 32) V!44653 V!44653 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38893)

(assert (=> b!1177587 (= lt!531768 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!795 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177588 () Bool)

(declare-fun e!669419 () Bool)

(assert (=> b!1177588 (= e!669419 tp_is_empty!29645)))

(declare-fun b!1177589 () Bool)

(declare-fun res!782223 () Bool)

(assert (=> b!1177589 (=> (not res!782223) (not e!669423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177589 (= res!782223 (validMask!0 mask!1564))))

(declare-fun b!1177590 () Bool)

(assert (=> b!1177590 (= e!669420 (and e!669419 mapRes!46295))))

(declare-fun condMapEmpty!46295 () Bool)

(declare-fun mapDefault!46295 () ValueCell!14113)

