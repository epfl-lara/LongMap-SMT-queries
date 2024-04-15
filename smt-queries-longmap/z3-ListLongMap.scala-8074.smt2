; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99304 () Bool)

(assert start!99304)

(declare-fun b_free!24889 () Bool)

(declare-fun b_next!24889 () Bool)

(assert (=> start!99304 (= b_free!24889 (not b_next!24889))))

(declare-fun tp!87381 () Bool)

(declare-fun b_and!40623 () Bool)

(assert (=> start!99304 (= tp!87381 b_and!40623)))

(declare-fun mapNonEmpty!45956 () Bool)

(declare-fun mapRes!45956 () Bool)

(declare-fun tp!87380 () Bool)

(declare-fun e!665121 () Bool)

(assert (=> mapNonEmpty!45956 (= mapRes!45956 (and tp!87380 e!665121))))

(declare-datatypes ((V!44353 0))(
  ( (V!44354 (val!14766 Int)) )
))
(declare-datatypes ((ValueCell!14000 0))(
  ( (ValueCellFull!14000 (v!17403 V!44353)) (EmptyCell!14000) )
))
(declare-fun mapRest!45956 () (Array (_ BitVec 32) ValueCell!14000))

(declare-datatypes ((array!75586 0))(
  ( (array!75587 (arr!36443 (Array (_ BitVec 32) ValueCell!14000)) (size!36981 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75586)

(declare-fun mapKey!45956 () (_ BitVec 32))

(declare-fun mapValue!45956 () ValueCell!14000)

(assert (=> mapNonEmpty!45956 (= (arr!36443 _values!996) (store mapRest!45956 mapKey!45956 mapValue!45956))))

(declare-fun b!1170242 () Bool)

(declare-fun res!776660 () Bool)

(declare-fun e!665129 () Bool)

(assert (=> b!1170242 (=> (not res!776660) (not e!665129))))

(declare-datatypes ((array!75588 0))(
  ( (array!75589 (arr!36444 (Array (_ BitVec 32) (_ BitVec 64))) (size!36982 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75588)

(declare-datatypes ((List!25662 0))(
  ( (Nil!25659) (Cons!25658 (h!26867 (_ BitVec 64)) (t!37534 List!25662)) )
))
(declare-fun arrayNoDuplicates!0 (array!75588 (_ BitVec 32) List!25662) Bool)

(assert (=> b!1170242 (= res!776660 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25659))))

(declare-fun b!1170243 () Bool)

(declare-fun res!776653 () Bool)

(assert (=> b!1170243 (=> (not res!776653) (not e!665129))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170243 (= res!776653 (validKeyInArray!0 k0!934))))

(declare-fun b!1170244 () Bool)

(declare-fun e!665124 () Bool)

(declare-fun tp_is_empty!29419 () Bool)

(assert (=> b!1170244 (= e!665124 tp_is_empty!29419)))

(declare-fun b!1170245 () Bool)

(declare-fun e!665127 () Bool)

(declare-fun e!665131 () Bool)

(assert (=> b!1170245 (= e!665127 e!665131)))

(declare-fun res!776661 () Bool)

(assert (=> b!1170245 (=> res!776661 e!665131)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170245 (= res!776661 (not (= (select (arr!36444 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665130 () Bool)

(assert (=> b!1170245 e!665130))

(declare-fun res!776662 () Bool)

(assert (=> b!1170245 (=> (not res!776662) (not e!665130))))

(declare-datatypes ((tuple2!18950 0))(
  ( (tuple2!18951 (_1!9486 (_ BitVec 64)) (_2!9486 V!44353)) )
))
(declare-datatypes ((List!25663 0))(
  ( (Nil!25660) (Cons!25659 (h!26868 tuple2!18950) (t!37535 List!25663)) )
))
(declare-datatypes ((ListLongMap!16919 0))(
  ( (ListLongMap!16920 (toList!8475 List!25663)) )
))
(declare-fun lt!526903 () ListLongMap!16919)

(declare-fun lt!526906 () V!44353)

(declare-fun lt!526911 () ListLongMap!16919)

(declare-fun +!3794 (ListLongMap!16919 tuple2!18950) ListLongMap!16919)

(declare-fun get!18590 (ValueCell!14000 V!44353) V!44353)

(assert (=> b!1170245 (= res!776662 (= lt!526903 (+!3794 lt!526911 (tuple2!18951 (select (arr!36444 _keys!1208) from!1455) (get!18590 (select (arr!36443 _values!996) from!1455) lt!526906)))))))

(declare-fun mapIsEmpty!45956 () Bool)

(assert (=> mapIsEmpty!45956 mapRes!45956))

(declare-fun b!1170246 () Bool)

(declare-fun e!665125 () Bool)

(assert (=> b!1170246 (= e!665130 e!665125)))

(declare-fun res!776656 () Bool)

(assert (=> b!1170246 (=> res!776656 e!665125)))

(assert (=> b!1170246 (= res!776656 (not (= (select (arr!36444 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170247 () Bool)

(assert (=> b!1170247 (= e!665131 true)))

(declare-fun arrayContainsKey!0 (array!75588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170247 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38431 0))(
  ( (Unit!38432) )
))
(declare-fun lt!526904 () Unit!38431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75588 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38431)

(assert (=> b!1170247 (= lt!526904 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170248 () Bool)

(declare-fun e!665128 () Bool)

(assert (=> b!1170248 (= e!665128 (and e!665124 mapRes!45956))))

(declare-fun condMapEmpty!45956 () Bool)

(declare-fun mapDefault!45956 () ValueCell!14000)

(assert (=> b!1170248 (= condMapEmpty!45956 (= (arr!36443 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14000)) mapDefault!45956)))))

(declare-fun b!1170249 () Bool)

(declare-fun res!776647 () Bool)

(assert (=> b!1170249 (=> (not res!776647) (not e!665129))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1170249 (= res!776647 (and (= (size!36981 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36982 _keys!1208) (size!36981 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170250 () Bool)

(declare-fun res!776648 () Bool)

(assert (=> b!1170250 (=> (not res!776648) (not e!665129))))

(assert (=> b!1170250 (= res!776648 (= (select (arr!36444 _keys!1208) i!673) k0!934))))

(declare-fun b!1170252 () Bool)

(declare-fun res!776649 () Bool)

(assert (=> b!1170252 (=> (not res!776649) (not e!665129))))

(assert (=> b!1170252 (= res!776649 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36982 _keys!1208))))))

(declare-fun b!1170253 () Bool)

(assert (=> b!1170253 (= e!665125 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170254 () Bool)

(declare-fun res!776658 () Bool)

(assert (=> b!1170254 (=> (not res!776658) (not e!665129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170254 (= res!776658 (validMask!0 mask!1564))))

(declare-fun b!1170255 () Bool)

(declare-fun e!665122 () Bool)

(declare-fun e!665126 () Bool)

(assert (=> b!1170255 (= e!665122 (not e!665126))))

(declare-fun res!776650 () Bool)

(assert (=> b!1170255 (=> res!776650 e!665126)))

(assert (=> b!1170255 (= res!776650 (bvsgt from!1455 i!673))))

(assert (=> b!1170255 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526908 () Unit!38431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75588 (_ BitVec 64) (_ BitVec 32)) Unit!38431)

(assert (=> b!1170255 (= lt!526908 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170256 () Bool)

(declare-fun res!776652 () Bool)

(assert (=> b!1170256 (=> (not res!776652) (not e!665122))))

(declare-fun lt!526901 () array!75588)

(assert (=> b!1170256 (= res!776652 (arrayNoDuplicates!0 lt!526901 #b00000000000000000000000000000000 Nil!25659))))

(declare-fun b!1170257 () Bool)

(assert (=> b!1170257 (= e!665129 e!665122)))

(declare-fun res!776657 () Bool)

(assert (=> b!1170257 (=> (not res!776657) (not e!665122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75588 (_ BitVec 32)) Bool)

(assert (=> b!1170257 (= res!776657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526901 mask!1564))))

(assert (=> b!1170257 (= lt!526901 (array!75589 (store (arr!36444 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36982 _keys!1208)))))

(declare-fun b!1170258 () Bool)

(declare-fun e!665123 () Bool)

(assert (=> b!1170258 (= e!665123 e!665127)))

(declare-fun res!776655 () Bool)

(assert (=> b!1170258 (=> res!776655 e!665127)))

(assert (=> b!1170258 (= res!776655 (not (validKeyInArray!0 (select (arr!36444 _keys!1208) from!1455))))))

(declare-fun lt!526902 () ListLongMap!16919)

(assert (=> b!1170258 (= lt!526902 lt!526911)))

(declare-fun lt!526909 () ListLongMap!16919)

(declare-fun -!1474 (ListLongMap!16919 (_ BitVec 64)) ListLongMap!16919)

(assert (=> b!1170258 (= lt!526911 (-!1474 lt!526909 k0!934))))

(declare-fun zeroValue!944 () V!44353)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44353)

(declare-fun lt!526905 () array!75586)

(declare-fun getCurrentListMapNoExtraKeys!4950 (array!75588 array!75586 (_ BitVec 32) (_ BitVec 32) V!44353 V!44353 (_ BitVec 32) Int) ListLongMap!16919)

(assert (=> b!1170258 (= lt!526902 (getCurrentListMapNoExtraKeys!4950 lt!526901 lt!526905 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170258 (= lt!526909 (getCurrentListMapNoExtraKeys!4950 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526910 () Unit!38431)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!738 (array!75588 array!75586 (_ BitVec 32) (_ BitVec 32) V!44353 V!44353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38431)

(assert (=> b!1170258 (= lt!526910 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!738 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170251 () Bool)

(declare-fun res!776654 () Bool)

(assert (=> b!1170251 (=> (not res!776654) (not e!665129))))

(assert (=> b!1170251 (= res!776654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!776659 () Bool)

(assert (=> start!99304 (=> (not res!776659) (not e!665129))))

(assert (=> start!99304 (= res!776659 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36982 _keys!1208))))))

(assert (=> start!99304 e!665129))

(assert (=> start!99304 tp_is_empty!29419))

(declare-fun array_inv!27956 (array!75588) Bool)

(assert (=> start!99304 (array_inv!27956 _keys!1208)))

(assert (=> start!99304 true))

(assert (=> start!99304 tp!87381))

(declare-fun array_inv!27957 (array!75586) Bool)

(assert (=> start!99304 (and (array_inv!27957 _values!996) e!665128)))

(declare-fun b!1170259 () Bool)

(assert (=> b!1170259 (= e!665126 e!665123)))

(declare-fun res!776651 () Bool)

(assert (=> b!1170259 (=> res!776651 e!665123)))

(assert (=> b!1170259 (= res!776651 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170259 (= lt!526903 (getCurrentListMapNoExtraKeys!4950 lt!526901 lt!526905 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170259 (= lt!526905 (array!75587 (store (arr!36443 _values!996) i!673 (ValueCellFull!14000 lt!526906)) (size!36981 _values!996)))))

(declare-fun dynLambda!2875 (Int (_ BitVec 64)) V!44353)

(assert (=> b!1170259 (= lt!526906 (dynLambda!2875 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526907 () ListLongMap!16919)

(assert (=> b!1170259 (= lt!526907 (getCurrentListMapNoExtraKeys!4950 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170260 () Bool)

(assert (=> b!1170260 (= e!665121 tp_is_empty!29419)))

(assert (= (and start!99304 res!776659) b!1170254))

(assert (= (and b!1170254 res!776658) b!1170249))

(assert (= (and b!1170249 res!776647) b!1170251))

(assert (= (and b!1170251 res!776654) b!1170242))

(assert (= (and b!1170242 res!776660) b!1170252))

(assert (= (and b!1170252 res!776649) b!1170243))

(assert (= (and b!1170243 res!776653) b!1170250))

(assert (= (and b!1170250 res!776648) b!1170257))

(assert (= (and b!1170257 res!776657) b!1170256))

(assert (= (and b!1170256 res!776652) b!1170255))

(assert (= (and b!1170255 (not res!776650)) b!1170259))

(assert (= (and b!1170259 (not res!776651)) b!1170258))

(assert (= (and b!1170258 (not res!776655)) b!1170245))

(assert (= (and b!1170245 res!776662) b!1170246))

(assert (= (and b!1170246 (not res!776656)) b!1170253))

(assert (= (and b!1170245 (not res!776661)) b!1170247))

(assert (= (and b!1170248 condMapEmpty!45956) mapIsEmpty!45956))

(assert (= (and b!1170248 (not condMapEmpty!45956)) mapNonEmpty!45956))

(get-info :version)

(assert (= (and mapNonEmpty!45956 ((_ is ValueCellFull!14000) mapValue!45956)) b!1170260))

(assert (= (and b!1170248 ((_ is ValueCellFull!14000) mapDefault!45956)) b!1170244))

(assert (= start!99304 b!1170248))

(declare-fun b_lambda!20015 () Bool)

(assert (=> (not b_lambda!20015) (not b!1170259)))

(declare-fun t!37533 () Bool)

(declare-fun tb!9693 () Bool)

(assert (=> (and start!99304 (= defaultEntry!1004 defaultEntry!1004) t!37533) tb!9693))

(declare-fun result!19961 () Bool)

(assert (=> tb!9693 (= result!19961 tp_is_empty!29419)))

(assert (=> b!1170259 t!37533))

(declare-fun b_and!40625 () Bool)

(assert (= b_and!40623 (and (=> t!37533 result!19961) b_and!40625)))

(declare-fun m!1077587 () Bool)

(assert (=> start!99304 m!1077587))

(declare-fun m!1077589 () Bool)

(assert (=> start!99304 m!1077589))

(declare-fun m!1077591 () Bool)

(assert (=> b!1170250 m!1077591))

(declare-fun m!1077593 () Bool)

(assert (=> b!1170242 m!1077593))

(declare-fun m!1077595 () Bool)

(assert (=> b!1170251 m!1077595))

(declare-fun m!1077597 () Bool)

(assert (=> b!1170245 m!1077597))

(declare-fun m!1077599 () Bool)

(assert (=> b!1170245 m!1077599))

(assert (=> b!1170245 m!1077599))

(declare-fun m!1077601 () Bool)

(assert (=> b!1170245 m!1077601))

(declare-fun m!1077603 () Bool)

(assert (=> b!1170245 m!1077603))

(declare-fun m!1077605 () Bool)

(assert (=> b!1170253 m!1077605))

(assert (=> b!1170246 m!1077597))

(declare-fun m!1077607 () Bool)

(assert (=> b!1170259 m!1077607))

(declare-fun m!1077609 () Bool)

(assert (=> b!1170259 m!1077609))

(declare-fun m!1077611 () Bool)

(assert (=> b!1170259 m!1077611))

(declare-fun m!1077613 () Bool)

(assert (=> b!1170259 m!1077613))

(declare-fun m!1077615 () Bool)

(assert (=> b!1170243 m!1077615))

(declare-fun m!1077617 () Bool)

(assert (=> b!1170256 m!1077617))

(declare-fun m!1077619 () Bool)

(assert (=> b!1170257 m!1077619))

(declare-fun m!1077621 () Bool)

(assert (=> b!1170257 m!1077621))

(declare-fun m!1077623 () Bool)

(assert (=> b!1170255 m!1077623))

(declare-fun m!1077625 () Bool)

(assert (=> b!1170255 m!1077625))

(declare-fun m!1077627 () Bool)

(assert (=> b!1170254 m!1077627))

(declare-fun m!1077629 () Bool)

(assert (=> mapNonEmpty!45956 m!1077629))

(declare-fun m!1077631 () Bool)

(assert (=> b!1170247 m!1077631))

(declare-fun m!1077633 () Bool)

(assert (=> b!1170247 m!1077633))

(declare-fun m!1077635 () Bool)

(assert (=> b!1170258 m!1077635))

(declare-fun m!1077637 () Bool)

(assert (=> b!1170258 m!1077637))

(declare-fun m!1077639 () Bool)

(assert (=> b!1170258 m!1077639))

(assert (=> b!1170258 m!1077597))

(declare-fun m!1077641 () Bool)

(assert (=> b!1170258 m!1077641))

(declare-fun m!1077643 () Bool)

(assert (=> b!1170258 m!1077643))

(assert (=> b!1170258 m!1077597))

(check-sat (not b!1170254) (not start!99304) (not b_next!24889) (not b!1170255) (not b!1170258) (not b!1170253) (not mapNonEmpty!45956) (not b!1170247) (not b!1170257) tp_is_empty!29419 (not b!1170242) (not b!1170245) (not b!1170243) (not b!1170256) b_and!40625 (not b!1170251) (not b_lambda!20015) (not b!1170259))
(check-sat b_and!40625 (not b_next!24889))
