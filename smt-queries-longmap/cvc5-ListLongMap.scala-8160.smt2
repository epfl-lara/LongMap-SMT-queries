; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99826 () Bool)

(assert start!99826)

(declare-fun b_free!25405 () Bool)

(declare-fun b_next!25405 () Bool)

(assert (=> start!99826 (= b_free!25405 (not b_next!25405))))

(declare-fun tp!88929 () Bool)

(declare-fun b_and!41677 () Bool)

(assert (=> start!99826 (= tp!88929 b_and!41677)))

(declare-fun b!1186841 () Bool)

(declare-fun e!674822 () Bool)

(declare-fun e!674820 () Bool)

(assert (=> b!1186841 (= e!674822 e!674820)))

(declare-fun res!789018 () Bool)

(assert (=> b!1186841 (=> res!789018 e!674820)))

(declare-datatypes ((array!76665 0))(
  ( (array!76666 (arr!36982 (Array (_ BitVec 32) (_ BitVec 64))) (size!37518 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76665)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186841 (= res!789018 (not (validKeyInArray!0 (select (arr!36982 _keys!1208) from!1455))))))

(declare-datatypes ((V!45041 0))(
  ( (V!45042 (val!15024 Int)) )
))
(declare-datatypes ((tuple2!19282 0))(
  ( (tuple2!19283 (_1!9652 (_ BitVec 64)) (_2!9652 V!45041)) )
))
(declare-datatypes ((List!26022 0))(
  ( (Nil!26019) (Cons!26018 (h!27227 tuple2!19282) (t!38419 List!26022)) )
))
(declare-datatypes ((ListLongMap!17251 0))(
  ( (ListLongMap!17252 (toList!8641 List!26022)) )
))
(declare-fun lt!539301 () ListLongMap!17251)

(declare-fun lt!539295 () ListLongMap!17251)

(assert (=> b!1186841 (= lt!539301 lt!539295)))

(declare-fun lt!539296 () ListLongMap!17251)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1673 (ListLongMap!17251 (_ BitVec 64)) ListLongMap!17251)

(assert (=> b!1186841 (= lt!539295 (-!1673 lt!539296 k!934))))

(declare-fun zeroValue!944 () V!45041)

(declare-fun lt!539303 () array!76665)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45041)

(declare-datatypes ((ValueCell!14258 0))(
  ( (ValueCellFull!14258 (v!17662 V!45041)) (EmptyCell!14258) )
))
(declare-datatypes ((array!76667 0))(
  ( (array!76668 (arr!36983 (Array (_ BitVec 32) ValueCell!14258)) (size!37519 (_ BitVec 32))) )
))
(declare-fun lt!539300 () array!76667)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5084 (array!76665 array!76667 (_ BitVec 32) (_ BitVec 32) V!45041 V!45041 (_ BitVec 32) Int) ListLongMap!17251)

(assert (=> b!1186841 (= lt!539301 (getCurrentListMapNoExtraKeys!5084 lt!539303 lt!539300 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76667)

(assert (=> b!1186841 (= lt!539296 (getCurrentListMapNoExtraKeys!5084 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39346 0))(
  ( (Unit!39347) )
))
(declare-fun lt!539306 () Unit!39346)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!885 (array!76665 array!76667 (_ BitVec 32) (_ BitVec 32) V!45041 V!45041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39346)

(assert (=> b!1186841 (= lt!539306 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!885 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186842 () Bool)

(declare-fun e!674821 () Bool)

(assert (=> b!1186842 (= e!674821 e!674822)))

(declare-fun res!789022 () Bool)

(assert (=> b!1186842 (=> res!789022 e!674822)))

(assert (=> b!1186842 (= res!789022 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!539313 () ListLongMap!17251)

(assert (=> b!1186842 (= lt!539313 (getCurrentListMapNoExtraKeys!5084 lt!539303 lt!539300 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539307 () V!45041)

(assert (=> b!1186842 (= lt!539300 (array!76668 (store (arr!36983 _values!996) i!673 (ValueCellFull!14258 lt!539307)) (size!37519 _values!996)))))

(declare-fun dynLambda!3033 (Int (_ BitVec 64)) V!45041)

(assert (=> b!1186842 (= lt!539307 (dynLambda!3033 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539302 () ListLongMap!17251)

(assert (=> b!1186842 (= lt!539302 (getCurrentListMapNoExtraKeys!5084 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186843 () Bool)

(declare-fun res!789027 () Bool)

(declare-fun e!674823 () Bool)

(assert (=> b!1186843 (=> (not res!789027) (not e!674823))))

(assert (=> b!1186843 (= res!789027 (and (= (size!37519 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37518 _keys!1208) (size!37519 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186844 () Bool)

(declare-fun e!674829 () Bool)

(declare-fun tp_is_empty!29935 () Bool)

(assert (=> b!1186844 (= e!674829 tp_is_empty!29935)))

(declare-fun b!1186845 () Bool)

(declare-fun res!789026 () Bool)

(declare-fun e!674827 () Bool)

(assert (=> b!1186845 (=> (not res!789026) (not e!674827))))

(declare-datatypes ((List!26023 0))(
  ( (Nil!26020) (Cons!26019 (h!27228 (_ BitVec 64)) (t!38420 List!26023)) )
))
(declare-fun arrayNoDuplicates!0 (array!76665 (_ BitVec 32) List!26023) Bool)

(assert (=> b!1186845 (= res!789026 (arrayNoDuplicates!0 lt!539303 #b00000000000000000000000000000000 Nil!26020))))

(declare-fun mapNonEmpty!46730 () Bool)

(declare-fun mapRes!46730 () Bool)

(declare-fun tp!88928 () Bool)

(declare-fun e!674825 () Bool)

(assert (=> mapNonEmpty!46730 (= mapRes!46730 (and tp!88928 e!674825))))

(declare-fun mapValue!46730 () ValueCell!14258)

(declare-fun mapRest!46730 () (Array (_ BitVec 32) ValueCell!14258))

(declare-fun mapKey!46730 () (_ BitVec 32))

(assert (=> mapNonEmpty!46730 (= (arr!36983 _values!996) (store mapRest!46730 mapKey!46730 mapValue!46730))))

(declare-fun b!1186846 () Bool)

(declare-fun e!674830 () Bool)

(declare-fun arrayContainsKey!0 (array!76665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186846 (= e!674830 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186847 () Bool)

(declare-fun res!789019 () Bool)

(assert (=> b!1186847 (=> (not res!789019) (not e!674823))))

(assert (=> b!1186847 (= res!789019 (= (select (arr!36982 _keys!1208) i!673) k!934))))

(declare-fun b!1186848 () Bool)

(assert (=> b!1186848 (= e!674825 tp_is_empty!29935)))

(declare-fun b!1186849 () Bool)

(declare-fun e!674826 () Bool)

(assert (=> b!1186849 (= e!674826 e!674830)))

(declare-fun res!789020 () Bool)

(assert (=> b!1186849 (=> res!789020 e!674830)))

(assert (=> b!1186849 (= res!789020 (not (= (select (arr!36982 _keys!1208) from!1455) k!934)))))

(declare-fun mapIsEmpty!46730 () Bool)

(assert (=> mapIsEmpty!46730 mapRes!46730))

(declare-fun b!1186850 () Bool)

(assert (=> b!1186850 (= e!674823 e!674827)))

(declare-fun res!789014 () Bool)

(assert (=> b!1186850 (=> (not res!789014) (not e!674827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76665 (_ BitVec 32)) Bool)

(assert (=> b!1186850 (= res!789014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539303 mask!1564))))

(assert (=> b!1186850 (= lt!539303 (array!76666 (store (arr!36982 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37518 _keys!1208)))))

(declare-fun b!1186851 () Bool)

(declare-fun res!789015 () Bool)

(assert (=> b!1186851 (=> (not res!789015) (not e!674823))))

(assert (=> b!1186851 (= res!789015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186852 () Bool)

(declare-fun e!674828 () Bool)

(assert (=> b!1186852 (= e!674828 (and e!674829 mapRes!46730))))

(declare-fun condMapEmpty!46730 () Bool)

(declare-fun mapDefault!46730 () ValueCell!14258)

