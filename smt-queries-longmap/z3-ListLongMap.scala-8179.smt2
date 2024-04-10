; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99942 () Bool)

(assert start!99942)

(declare-fun b_free!25521 () Bool)

(declare-fun b_next!25521 () Bool)

(assert (=> start!99942 (= b_free!25521 (not b_next!25521))))

(declare-fun tp!89277 () Bool)

(declare-fun b_and!41909 () Bool)

(assert (=> start!99942 (= tp!89277 b_and!41909)))

(declare-fun res!791321 () Bool)

(declare-fun e!676494 () Bool)

(assert (=> start!99942 (=> (not res!791321) (not e!676494))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76893 0))(
  ( (array!76894 (arr!37096 (Array (_ BitVec 32) (_ BitVec 64))) (size!37632 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76893)

(assert (=> start!99942 (= res!791321 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37632 _keys!1208))))))

(assert (=> start!99942 e!676494))

(declare-fun tp_is_empty!30051 () Bool)

(assert (=> start!99942 tp_is_empty!30051))

(declare-fun array_inv!28294 (array!76893) Bool)

(assert (=> start!99942 (array_inv!28294 _keys!1208)))

(assert (=> start!99942 true))

(assert (=> start!99942 tp!89277))

(declare-datatypes ((V!45195 0))(
  ( (V!45196 (val!15082 Int)) )
))
(declare-datatypes ((ValueCell!14316 0))(
  ( (ValueCellFull!14316 (v!17720 V!45195)) (EmptyCell!14316) )
))
(declare-datatypes ((array!76895 0))(
  ( (array!76896 (arr!37097 (Array (_ BitVec 32) ValueCell!14316)) (size!37633 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76895)

(declare-fun e!676491 () Bool)

(declare-fun array_inv!28295 (array!76895) Bool)

(assert (=> start!99942 (and (array_inv!28295 _values!996) e!676491)))

(declare-fun b!1189917 () Bool)

(declare-fun res!791318 () Bool)

(declare-fun e!676495 () Bool)

(assert (=> b!1189917 (=> (not res!791318) (not e!676495))))

(declare-fun lt!541253 () array!76893)

(declare-datatypes ((List!26114 0))(
  ( (Nil!26111) (Cons!26110 (h!27319 (_ BitVec 64)) (t!38627 List!26114)) )
))
(declare-fun arrayNoDuplicates!0 (array!76893 (_ BitVec 32) List!26114) Bool)

(assert (=> b!1189917 (= res!791318 (arrayNoDuplicates!0 lt!541253 #b00000000000000000000000000000000 Nil!26111))))

(declare-fun b!1189918 () Bool)

(declare-fun e!676496 () Bool)

(assert (=> b!1189918 (= e!676496 tp_is_empty!30051)))

(declare-fun b!1189919 () Bool)

(declare-fun e!676492 () Bool)

(assert (=> b!1189919 (= e!676492 tp_is_empty!30051)))

(declare-fun b!1189920 () Bool)

(declare-fun res!791316 () Bool)

(assert (=> b!1189920 (=> (not res!791316) (not e!676494))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189920 (= res!791316 (validMask!0 mask!1564))))

(declare-fun b!1189921 () Bool)

(declare-fun res!791312 () Bool)

(assert (=> b!1189921 (=> (not res!791312) (not e!676494))))

(assert (=> b!1189921 (= res!791312 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26111))))

(declare-fun b!1189922 () Bool)

(declare-fun e!676497 () Bool)

(declare-fun e!676498 () Bool)

(assert (=> b!1189922 (= e!676497 e!676498)))

(declare-fun res!791313 () Bool)

(assert (=> b!1189922 (=> res!791313 e!676498)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189922 (= res!791313 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45195)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19368 0))(
  ( (tuple2!19369 (_1!9695 (_ BitVec 64)) (_2!9695 V!45195)) )
))
(declare-datatypes ((List!26115 0))(
  ( (Nil!26112) (Cons!26111 (h!27320 tuple2!19368) (t!38628 List!26115)) )
))
(declare-datatypes ((ListLongMap!17337 0))(
  ( (ListLongMap!17338 (toList!8684 List!26115)) )
))
(declare-fun lt!541252 () ListLongMap!17337)

(declare-fun lt!541251 () array!76895)

(declare-fun minValue!944 () V!45195)

(declare-fun getCurrentListMapNoExtraKeys!5125 (array!76893 array!76895 (_ BitVec 32) (_ BitVec 32) V!45195 V!45195 (_ BitVec 32) Int) ListLongMap!17337)

(assert (=> b!1189922 (= lt!541252 (getCurrentListMapNoExtraKeys!5125 lt!541253 lt!541251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3067 (Int (_ BitVec 64)) V!45195)

(assert (=> b!1189922 (= lt!541251 (array!76896 (store (arr!37097 _values!996) i!673 (ValueCellFull!14316 (dynLambda!3067 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37633 _values!996)))))

(declare-fun lt!541249 () ListLongMap!17337)

(assert (=> b!1189922 (= lt!541249 (getCurrentListMapNoExtraKeys!5125 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189923 () Bool)

(declare-fun res!791315 () Bool)

(assert (=> b!1189923 (=> (not res!791315) (not e!676494))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1189923 (= res!791315 (= (select (arr!37096 _keys!1208) i!673) k0!934))))

(declare-fun b!1189924 () Bool)

(declare-fun res!791319 () Bool)

(assert (=> b!1189924 (=> (not res!791319) (not e!676494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76893 (_ BitVec 32)) Bool)

(assert (=> b!1189924 (= res!791319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189925 () Bool)

(assert (=> b!1189925 (= e!676495 (not e!676497))))

(declare-fun res!791314 () Bool)

(assert (=> b!1189925 (=> res!791314 e!676497)))

(assert (=> b!1189925 (= res!791314 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189925 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39468 0))(
  ( (Unit!39469) )
))
(declare-fun lt!541254 () Unit!39468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76893 (_ BitVec 64) (_ BitVec 32)) Unit!39468)

(assert (=> b!1189925 (= lt!541254 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189926 () Bool)

(declare-fun res!791323 () Bool)

(assert (=> b!1189926 (=> (not res!791323) (not e!676494))))

(assert (=> b!1189926 (= res!791323 (and (= (size!37633 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37632 _keys!1208) (size!37633 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189927 () Bool)

(declare-fun mapRes!46904 () Bool)

(assert (=> b!1189927 (= e!676491 (and e!676492 mapRes!46904))))

(declare-fun condMapEmpty!46904 () Bool)

(declare-fun mapDefault!46904 () ValueCell!14316)

(assert (=> b!1189927 (= condMapEmpty!46904 (= (arr!37097 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14316)) mapDefault!46904)))))

(declare-fun b!1189928 () Bool)

(assert (=> b!1189928 (= e!676498 true)))

(declare-fun -!1713 (ListLongMap!17337 (_ BitVec 64)) ListLongMap!17337)

(assert (=> b!1189928 (= (getCurrentListMapNoExtraKeys!5125 lt!541253 lt!541251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1713 (getCurrentListMapNoExtraKeys!5125 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541250 () Unit!39468)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!922 (array!76893 array!76895 (_ BitVec 32) (_ BitVec 32) V!45195 V!45195 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39468)

(assert (=> b!1189928 (= lt!541250 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!922 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189929 () Bool)

(declare-fun res!791322 () Bool)

(assert (=> b!1189929 (=> (not res!791322) (not e!676494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189929 (= res!791322 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46904 () Bool)

(declare-fun tp!89276 () Bool)

(assert (=> mapNonEmpty!46904 (= mapRes!46904 (and tp!89276 e!676496))))

(declare-fun mapKey!46904 () (_ BitVec 32))

(declare-fun mapValue!46904 () ValueCell!14316)

(declare-fun mapRest!46904 () (Array (_ BitVec 32) ValueCell!14316))

(assert (=> mapNonEmpty!46904 (= (arr!37097 _values!996) (store mapRest!46904 mapKey!46904 mapValue!46904))))

(declare-fun mapIsEmpty!46904 () Bool)

(assert (=> mapIsEmpty!46904 mapRes!46904))

(declare-fun b!1189930 () Bool)

(declare-fun res!791320 () Bool)

(assert (=> b!1189930 (=> (not res!791320) (not e!676494))))

(assert (=> b!1189930 (= res!791320 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37632 _keys!1208))))))

(declare-fun b!1189931 () Bool)

(assert (=> b!1189931 (= e!676494 e!676495)))

(declare-fun res!791317 () Bool)

(assert (=> b!1189931 (=> (not res!791317) (not e!676495))))

(assert (=> b!1189931 (= res!791317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541253 mask!1564))))

(assert (=> b!1189931 (= lt!541253 (array!76894 (store (arr!37096 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37632 _keys!1208)))))

(assert (= (and start!99942 res!791321) b!1189920))

(assert (= (and b!1189920 res!791316) b!1189926))

(assert (= (and b!1189926 res!791323) b!1189924))

(assert (= (and b!1189924 res!791319) b!1189921))

(assert (= (and b!1189921 res!791312) b!1189930))

(assert (= (and b!1189930 res!791320) b!1189929))

(assert (= (and b!1189929 res!791322) b!1189923))

(assert (= (and b!1189923 res!791315) b!1189931))

(assert (= (and b!1189931 res!791317) b!1189917))

(assert (= (and b!1189917 res!791318) b!1189925))

(assert (= (and b!1189925 (not res!791314)) b!1189922))

(assert (= (and b!1189922 (not res!791313)) b!1189928))

(assert (= (and b!1189927 condMapEmpty!46904) mapIsEmpty!46904))

(assert (= (and b!1189927 (not condMapEmpty!46904)) mapNonEmpty!46904))

(get-info :version)

(assert (= (and mapNonEmpty!46904 ((_ is ValueCellFull!14316) mapValue!46904)) b!1189918))

(assert (= (and b!1189927 ((_ is ValueCellFull!14316) mapDefault!46904)) b!1189919))

(assert (= start!99942 b!1189927))

(declare-fun b_lambda!20665 () Bool)

(assert (=> (not b_lambda!20665) (not b!1189922)))

(declare-fun t!38626 () Bool)

(declare-fun tb!10333 () Bool)

(assert (=> (and start!99942 (= defaultEntry!1004 defaultEntry!1004) t!38626) tb!10333))

(declare-fun result!21233 () Bool)

(assert (=> tb!10333 (= result!21233 tp_is_empty!30051)))

(assert (=> b!1189922 t!38626))

(declare-fun b_and!41911 () Bool)

(assert (= b_and!41909 (and (=> t!38626 result!21233) b_and!41911)))

(declare-fun m!1098543 () Bool)

(assert (=> b!1189931 m!1098543))

(declare-fun m!1098545 () Bool)

(assert (=> b!1189931 m!1098545))

(declare-fun m!1098547 () Bool)

(assert (=> b!1189928 m!1098547))

(declare-fun m!1098549 () Bool)

(assert (=> b!1189928 m!1098549))

(assert (=> b!1189928 m!1098549))

(declare-fun m!1098551 () Bool)

(assert (=> b!1189928 m!1098551))

(declare-fun m!1098553 () Bool)

(assert (=> b!1189928 m!1098553))

(declare-fun m!1098555 () Bool)

(assert (=> b!1189917 m!1098555))

(declare-fun m!1098557 () Bool)

(assert (=> b!1189925 m!1098557))

(declare-fun m!1098559 () Bool)

(assert (=> b!1189925 m!1098559))

(declare-fun m!1098561 () Bool)

(assert (=> b!1189924 m!1098561))

(declare-fun m!1098563 () Bool)

(assert (=> b!1189929 m!1098563))

(declare-fun m!1098565 () Bool)

(assert (=> b!1189920 m!1098565))

(declare-fun m!1098567 () Bool)

(assert (=> b!1189922 m!1098567))

(declare-fun m!1098569 () Bool)

(assert (=> b!1189922 m!1098569))

(declare-fun m!1098571 () Bool)

(assert (=> b!1189922 m!1098571))

(declare-fun m!1098573 () Bool)

(assert (=> b!1189922 m!1098573))

(declare-fun m!1098575 () Bool)

(assert (=> mapNonEmpty!46904 m!1098575))

(declare-fun m!1098577 () Bool)

(assert (=> start!99942 m!1098577))

(declare-fun m!1098579 () Bool)

(assert (=> start!99942 m!1098579))

(declare-fun m!1098581 () Bool)

(assert (=> b!1189923 m!1098581))

(declare-fun m!1098583 () Bool)

(assert (=> b!1189921 m!1098583))

(check-sat (not b!1189917) (not b!1189928) (not b!1189929) (not b!1189925) (not mapNonEmpty!46904) (not b_next!25521) (not b_lambda!20665) (not b!1189920) (not b!1189921) b_and!41911 tp_is_empty!30051 (not b!1189931) (not start!99942) (not b!1189922) (not b!1189924))
(check-sat b_and!41911 (not b_next!25521))
