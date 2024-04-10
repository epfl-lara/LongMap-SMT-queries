; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101282 () Bool)

(assert start!101282)

(declare-fun b_free!26205 () Bool)

(declare-fun b_next!26205 () Bool)

(assert (=> start!101282 (= b_free!26205 (not b_next!26205))))

(declare-fun tp!91636 () Bool)

(declare-fun b_and!43527 () Bool)

(assert (=> start!101282 (= tp!91636 b_and!43527)))

(declare-fun b!1216830 () Bool)

(declare-fun e!690833 () Bool)

(declare-fun e!690832 () Bool)

(assert (=> b!1216830 (= e!690833 e!690832)))

(declare-fun res!808070 () Bool)

(assert (=> b!1216830 (=> res!808070 e!690832)))

(declare-datatypes ((array!78589 0))(
  ( (array!78590 (arr!37929 (Array (_ BitVec 32) (_ BitVec 64))) (size!38465 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78589)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216830 (= res!808070 (not (validKeyInArray!0 (select (arr!37929 _keys!1208) from!1455))))))

(declare-datatypes ((V!46339 0))(
  ( (V!46340 (val!15511 Int)) )
))
(declare-fun zeroValue!944 () V!46339)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!14745 0))(
  ( (ValueCellFull!14745 (v!18164 V!46339)) (EmptyCell!14745) )
))
(declare-datatypes ((array!78591 0))(
  ( (array!78592 (arr!37930 (Array (_ BitVec 32) ValueCell!14745)) (size!38466 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78591)

(declare-fun lt!553049 () array!78589)

(declare-fun minValue!944 () V!46339)

(declare-fun lt!553048 () array!78591)

(declare-datatypes ((tuple2!19938 0))(
  ( (tuple2!19939 (_1!9980 (_ BitVec 64)) (_2!9980 V!46339)) )
))
(declare-datatypes ((List!26742 0))(
  ( (Nil!26739) (Cons!26738 (h!27947 tuple2!19938) (t!39927 List!26742)) )
))
(declare-datatypes ((ListLongMap!17907 0))(
  ( (ListLongMap!17908 (toList!8969 List!26742)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5396 (array!78589 array!78591 (_ BitVec 32) (_ BitVec 32) V!46339 V!46339 (_ BitVec 32) Int) ListLongMap!17907)

(declare-fun -!1886 (ListLongMap!17907 (_ BitVec 64)) ListLongMap!17907)

(assert (=> b!1216830 (= (getCurrentListMapNoExtraKeys!5396 lt!553049 lt!553048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1886 (getCurrentListMapNoExtraKeys!5396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40344 0))(
  ( (Unit!40345) )
))
(declare-fun lt!553046 () Unit!40344)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1093 (array!78589 array!78591 (_ BitVec 32) (_ BitVec 32) V!46339 V!46339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40344)

(assert (=> b!1216830 (= lt!553046 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1093 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216831 () Bool)

(declare-fun e!690830 () Bool)

(declare-fun e!690831 () Bool)

(assert (=> b!1216831 (= e!690830 e!690831)))

(declare-fun res!808062 () Bool)

(assert (=> b!1216831 (=> (not res!808062) (not e!690831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78589 (_ BitVec 32)) Bool)

(assert (=> b!1216831 (= res!808062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553049 mask!1564))))

(assert (=> b!1216831 (= lt!553049 (array!78590 (store (arr!37929 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38465 _keys!1208)))))

(declare-fun b!1216832 () Bool)

(declare-fun e!690834 () Bool)

(declare-fun tp_is_empty!30909 () Bool)

(assert (=> b!1216832 (= e!690834 tp_is_empty!30909)))

(declare-fun b!1216833 () Bool)

(declare-fun res!808069 () Bool)

(assert (=> b!1216833 (=> (not res!808069) (not e!690830))))

(assert (=> b!1216833 (= res!808069 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38465 _keys!1208))))))

(declare-fun b!1216834 () Bool)

(declare-fun res!808058 () Bool)

(assert (=> b!1216834 (=> (not res!808058) (not e!690831))))

(declare-datatypes ((List!26743 0))(
  ( (Nil!26740) (Cons!26739 (h!27948 (_ BitVec 64)) (t!39928 List!26743)) )
))
(declare-fun arrayNoDuplicates!0 (array!78589 (_ BitVec 32) List!26743) Bool)

(assert (=> b!1216834 (= res!808058 (arrayNoDuplicates!0 lt!553049 #b00000000000000000000000000000000 Nil!26740))))

(declare-fun mapNonEmpty!48238 () Bool)

(declare-fun mapRes!48238 () Bool)

(declare-fun tp!91637 () Bool)

(declare-fun e!690837 () Bool)

(assert (=> mapNonEmpty!48238 (= mapRes!48238 (and tp!91637 e!690837))))

(declare-fun mapValue!48238 () ValueCell!14745)

(declare-fun mapKey!48238 () (_ BitVec 32))

(declare-fun mapRest!48238 () (Array (_ BitVec 32) ValueCell!14745))

(assert (=> mapNonEmpty!48238 (= (arr!37930 _values!996) (store mapRest!48238 mapKey!48238 mapValue!48238))))

(declare-fun b!1216835 () Bool)

(declare-fun res!808067 () Bool)

(assert (=> b!1216835 (=> (not res!808067) (not e!690830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216835 (= res!808067 (validMask!0 mask!1564))))

(declare-fun b!1216836 () Bool)

(declare-fun res!808061 () Bool)

(assert (=> b!1216836 (=> (not res!808061) (not e!690830))))

(assert (=> b!1216836 (= res!808061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!808063 () Bool)

(assert (=> start!101282 (=> (not res!808063) (not e!690830))))

(assert (=> start!101282 (= res!808063 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38465 _keys!1208))))))

(assert (=> start!101282 e!690830))

(assert (=> start!101282 tp_is_empty!30909))

(declare-fun array_inv!28876 (array!78589) Bool)

(assert (=> start!101282 (array_inv!28876 _keys!1208)))

(assert (=> start!101282 true))

(assert (=> start!101282 tp!91636))

(declare-fun e!690835 () Bool)

(declare-fun array_inv!28877 (array!78591) Bool)

(assert (=> start!101282 (and (array_inv!28877 _values!996) e!690835)))

(declare-fun b!1216837 () Bool)

(assert (=> b!1216837 (= e!690832 (bvslt from!1455 (size!38465 _keys!1208)))))

(declare-fun b!1216838 () Bool)

(declare-fun e!690836 () Bool)

(assert (=> b!1216838 (= e!690836 e!690833)))

(declare-fun res!808065 () Bool)

(assert (=> b!1216838 (=> res!808065 e!690833)))

(assert (=> b!1216838 (= res!808065 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553045 () ListLongMap!17907)

(assert (=> b!1216838 (= lt!553045 (getCurrentListMapNoExtraKeys!5396 lt!553049 lt!553048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3285 (Int (_ BitVec 64)) V!46339)

(assert (=> b!1216838 (= lt!553048 (array!78592 (store (arr!37930 _values!996) i!673 (ValueCellFull!14745 (dynLambda!3285 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38466 _values!996)))))

(declare-fun lt!553047 () ListLongMap!17907)

(assert (=> b!1216838 (= lt!553047 (getCurrentListMapNoExtraKeys!5396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216839 () Bool)

(assert (=> b!1216839 (= e!690835 (and e!690834 mapRes!48238))))

(declare-fun condMapEmpty!48238 () Bool)

(declare-fun mapDefault!48238 () ValueCell!14745)

(assert (=> b!1216839 (= condMapEmpty!48238 (= (arr!37930 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14745)) mapDefault!48238)))))

(declare-fun mapIsEmpty!48238 () Bool)

(assert (=> mapIsEmpty!48238 mapRes!48238))

(declare-fun b!1216840 () Bool)

(declare-fun res!808068 () Bool)

(assert (=> b!1216840 (=> (not res!808068) (not e!690830))))

(assert (=> b!1216840 (= res!808068 (and (= (size!38466 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38465 _keys!1208) (size!38466 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216841 () Bool)

(assert (=> b!1216841 (= e!690831 (not e!690836))))

(declare-fun res!808066 () Bool)

(assert (=> b!1216841 (=> res!808066 e!690836)))

(assert (=> b!1216841 (= res!808066 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216841 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553050 () Unit!40344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78589 (_ BitVec 64) (_ BitVec 32)) Unit!40344)

(assert (=> b!1216841 (= lt!553050 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216842 () Bool)

(assert (=> b!1216842 (= e!690837 tp_is_empty!30909)))

(declare-fun b!1216843 () Bool)

(declare-fun res!808059 () Bool)

(assert (=> b!1216843 (=> (not res!808059) (not e!690830))))

(assert (=> b!1216843 (= res!808059 (validKeyInArray!0 k0!934))))

(declare-fun b!1216844 () Bool)

(declare-fun res!808064 () Bool)

(assert (=> b!1216844 (=> (not res!808064) (not e!690830))))

(assert (=> b!1216844 (= res!808064 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26740))))

(declare-fun b!1216845 () Bool)

(declare-fun res!808060 () Bool)

(assert (=> b!1216845 (=> (not res!808060) (not e!690830))))

(assert (=> b!1216845 (= res!808060 (= (select (arr!37929 _keys!1208) i!673) k0!934))))

(assert (= (and start!101282 res!808063) b!1216835))

(assert (= (and b!1216835 res!808067) b!1216840))

(assert (= (and b!1216840 res!808068) b!1216836))

(assert (= (and b!1216836 res!808061) b!1216844))

(assert (= (and b!1216844 res!808064) b!1216833))

(assert (= (and b!1216833 res!808069) b!1216843))

(assert (= (and b!1216843 res!808059) b!1216845))

(assert (= (and b!1216845 res!808060) b!1216831))

(assert (= (and b!1216831 res!808062) b!1216834))

(assert (= (and b!1216834 res!808058) b!1216841))

(assert (= (and b!1216841 (not res!808066)) b!1216838))

(assert (= (and b!1216838 (not res!808065)) b!1216830))

(assert (= (and b!1216830 (not res!808070)) b!1216837))

(assert (= (and b!1216839 condMapEmpty!48238) mapIsEmpty!48238))

(assert (= (and b!1216839 (not condMapEmpty!48238)) mapNonEmpty!48238))

(get-info :version)

(assert (= (and mapNonEmpty!48238 ((_ is ValueCellFull!14745) mapValue!48238)) b!1216842))

(assert (= (and b!1216839 ((_ is ValueCellFull!14745) mapDefault!48238)) b!1216832))

(assert (= start!101282 b!1216839))

(declare-fun b_lambda!21881 () Bool)

(assert (=> (not b_lambda!21881) (not b!1216838)))

(declare-fun t!39926 () Bool)

(declare-fun tb!11005 () Bool)

(assert (=> (and start!101282 (= defaultEntry!1004 defaultEntry!1004) t!39926) tb!11005))

(declare-fun result!22607 () Bool)

(assert (=> tb!11005 (= result!22607 tp_is_empty!30909)))

(assert (=> b!1216838 t!39926))

(declare-fun b_and!43529 () Bool)

(assert (= b_and!43527 (and (=> t!39926 result!22607) b_and!43529)))

(declare-fun m!1121545 () Bool)

(assert (=> b!1216836 m!1121545))

(declare-fun m!1121547 () Bool)

(assert (=> b!1216843 m!1121547))

(declare-fun m!1121549 () Bool)

(assert (=> b!1216830 m!1121549))

(declare-fun m!1121551 () Bool)

(assert (=> b!1216830 m!1121551))

(assert (=> b!1216830 m!1121549))

(declare-fun m!1121553 () Bool)

(assert (=> b!1216830 m!1121553))

(declare-fun m!1121555 () Bool)

(assert (=> b!1216830 m!1121555))

(declare-fun m!1121557 () Bool)

(assert (=> b!1216830 m!1121557))

(declare-fun m!1121559 () Bool)

(assert (=> b!1216830 m!1121559))

(assert (=> b!1216830 m!1121555))

(declare-fun m!1121561 () Bool)

(assert (=> b!1216831 m!1121561))

(declare-fun m!1121563 () Bool)

(assert (=> b!1216831 m!1121563))

(declare-fun m!1121565 () Bool)

(assert (=> b!1216844 m!1121565))

(declare-fun m!1121567 () Bool)

(assert (=> b!1216834 m!1121567))

(declare-fun m!1121569 () Bool)

(assert (=> b!1216838 m!1121569))

(declare-fun m!1121571 () Bool)

(assert (=> b!1216838 m!1121571))

(declare-fun m!1121573 () Bool)

(assert (=> b!1216838 m!1121573))

(declare-fun m!1121575 () Bool)

(assert (=> b!1216838 m!1121575))

(declare-fun m!1121577 () Bool)

(assert (=> b!1216841 m!1121577))

(declare-fun m!1121579 () Bool)

(assert (=> b!1216841 m!1121579))

(declare-fun m!1121581 () Bool)

(assert (=> b!1216835 m!1121581))

(declare-fun m!1121583 () Bool)

(assert (=> mapNonEmpty!48238 m!1121583))

(declare-fun m!1121585 () Bool)

(assert (=> start!101282 m!1121585))

(declare-fun m!1121587 () Bool)

(assert (=> start!101282 m!1121587))

(declare-fun m!1121589 () Bool)

(assert (=> b!1216845 m!1121589))

(check-sat (not start!101282) (not b!1216844) (not b!1216834) tp_is_empty!30909 (not b!1216836) (not b_next!26205) (not b!1216843) (not b!1216835) (not b!1216841) (not b!1216838) (not b_lambda!21881) (not b!1216831) b_and!43529 (not b!1216830) (not mapNonEmpty!48238))
(check-sat b_and!43529 (not b_next!26205))
