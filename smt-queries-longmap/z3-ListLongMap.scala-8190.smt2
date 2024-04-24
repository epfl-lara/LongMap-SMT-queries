; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100242 () Bool)

(assert start!100242)

(declare-fun b_free!25585 () Bool)

(declare-fun b_next!25585 () Bool)

(assert (=> start!100242 (= b_free!25585 (not b_next!25585))))

(declare-fun tp!89468 () Bool)

(declare-fun b_and!42039 () Bool)

(assert (=> start!100242 (= tp!89468 b_and!42039)))

(declare-fun mapNonEmpty!47000 () Bool)

(declare-fun mapRes!47000 () Bool)

(declare-fun tp!89469 () Bool)

(declare-fun e!678095 () Bool)

(assert (=> mapNonEmpty!47000 (= mapRes!47000 (and tp!89469 e!678095))))

(declare-datatypes ((V!45281 0))(
  ( (V!45282 (val!15114 Int)) )
))
(declare-datatypes ((ValueCell!14348 0))(
  ( (ValueCellFull!14348 (v!17748 V!45281)) (EmptyCell!14348) )
))
(declare-fun mapRest!47000 () (Array (_ BitVec 32) ValueCell!14348))

(declare-fun mapKey!47000 () (_ BitVec 32))

(declare-datatypes ((array!77063 0))(
  ( (array!77064 (arr!37175 (Array (_ BitVec 32) ValueCell!14348)) (size!37712 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77063)

(declare-fun mapValue!47000 () ValueCell!14348)

(assert (=> mapNonEmpty!47000 (= (arr!37175 _values!996) (store mapRest!47000 mapKey!47000 mapValue!47000))))

(declare-fun b!1192710 () Bool)

(declare-fun e!678094 () Bool)

(declare-fun e!678096 () Bool)

(assert (=> b!1192710 (= e!678094 (and e!678096 mapRes!47000))))

(declare-fun condMapEmpty!47000 () Bool)

(declare-fun mapDefault!47000 () ValueCell!14348)

(assert (=> b!1192710 (= condMapEmpty!47000 (= (arr!37175 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14348)) mapDefault!47000)))))

(declare-fun b!1192711 () Bool)

(declare-fun res!792978 () Bool)

(declare-fun e!678091 () Bool)

(assert (=> b!1192711 (=> (not res!792978) (not e!678091))))

(declare-datatypes ((array!77065 0))(
  ( (array!77066 (arr!37176 (Array (_ BitVec 32) (_ BitVec 64))) (size!37713 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77065)

(declare-datatypes ((List!26199 0))(
  ( (Nil!26196) (Cons!26195 (h!27413 (_ BitVec 64)) (t!38768 List!26199)) )
))
(declare-fun arrayNoDuplicates!0 (array!77065 (_ BitVec 32) List!26199) Bool)

(assert (=> b!1192711 (= res!792978 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26196))))

(declare-fun b!1192712 () Bool)

(declare-fun tp_is_empty!30115 () Bool)

(assert (=> b!1192712 (= e!678095 tp_is_empty!30115)))

(declare-fun mapIsEmpty!47000 () Bool)

(assert (=> mapIsEmpty!47000 mapRes!47000))

(declare-fun b!1192714 () Bool)

(declare-fun res!792977 () Bool)

(assert (=> b!1192714 (=> (not res!792977) (not e!678091))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77065 (_ BitVec 32)) Bool)

(assert (=> b!1192714 (= res!792977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192715 () Bool)

(declare-fun res!792982 () Bool)

(assert (=> b!1192715 (=> (not res!792982) (not e!678091))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192715 (= res!792982 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37713 _keys!1208))))))

(declare-fun b!1192716 () Bool)

(assert (=> b!1192716 (= e!678096 tp_is_empty!30115)))

(declare-fun b!1192717 () Bool)

(declare-fun res!792973 () Bool)

(assert (=> b!1192717 (=> (not res!792973) (not e!678091))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192717 (= res!792973 (validKeyInArray!0 k0!934))))

(declare-fun b!1192718 () Bool)

(declare-fun e!678092 () Bool)

(assert (=> b!1192718 (= e!678092 true)))

(declare-fun zeroValue!944 () V!45281)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!542311 () array!77065)

(declare-fun minValue!944 () V!45281)

(declare-fun lt!542312 () array!77063)

(declare-datatypes ((tuple2!19454 0))(
  ( (tuple2!19455 (_1!9738 (_ BitVec 64)) (_2!9738 V!45281)) )
))
(declare-datatypes ((List!26200 0))(
  ( (Nil!26197) (Cons!26196 (h!27414 tuple2!19454) (t!38769 List!26200)) )
))
(declare-datatypes ((ListLongMap!17431 0))(
  ( (ListLongMap!17432 (toList!8731 List!26200)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5199 (array!77065 array!77063 (_ BitVec 32) (_ BitVec 32) V!45281 V!45281 (_ BitVec 32) Int) ListLongMap!17431)

(declare-fun -!1740 (ListLongMap!17431 (_ BitVec 64)) ListLongMap!17431)

(assert (=> b!1192718 (= (getCurrentListMapNoExtraKeys!5199 lt!542311 lt!542312 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1740 (getCurrentListMapNoExtraKeys!5199 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39505 0))(
  ( (Unit!39506) )
))
(declare-fun lt!542314 () Unit!39505)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!955 (array!77065 array!77063 (_ BitVec 32) (_ BitVec 32) V!45281 V!45281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39505)

(assert (=> b!1192718 (= lt!542314 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!955 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192719 () Bool)

(declare-fun e!678093 () Bool)

(assert (=> b!1192719 (= e!678091 e!678093)))

(declare-fun res!792980 () Bool)

(assert (=> b!1192719 (=> (not res!792980) (not e!678093))))

(assert (=> b!1192719 (= res!792980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542311 mask!1564))))

(assert (=> b!1192719 (= lt!542311 (array!77066 (store (arr!37176 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37713 _keys!1208)))))

(declare-fun b!1192720 () Bool)

(declare-fun res!792983 () Bool)

(assert (=> b!1192720 (=> (not res!792983) (not e!678093))))

(assert (=> b!1192720 (= res!792983 (arrayNoDuplicates!0 lt!542311 #b00000000000000000000000000000000 Nil!26196))))

(declare-fun b!1192721 () Bool)

(declare-fun res!792981 () Bool)

(assert (=> b!1192721 (=> (not res!792981) (not e!678091))))

(assert (=> b!1192721 (= res!792981 (= (select (arr!37176 _keys!1208) i!673) k0!934))))

(declare-fun b!1192722 () Bool)

(declare-fun res!792976 () Bool)

(assert (=> b!1192722 (=> (not res!792976) (not e!678091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192722 (= res!792976 (validMask!0 mask!1564))))

(declare-fun b!1192723 () Bool)

(declare-fun res!792975 () Bool)

(assert (=> b!1192723 (=> (not res!792975) (not e!678091))))

(assert (=> b!1192723 (= res!792975 (and (= (size!37712 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37713 _keys!1208) (size!37712 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192724 () Bool)

(declare-fun e!678097 () Bool)

(assert (=> b!1192724 (= e!678097 e!678092)))

(declare-fun res!792972 () Bool)

(assert (=> b!1192724 (=> res!792972 e!678092)))

(assert (=> b!1192724 (= res!792972 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542310 () ListLongMap!17431)

(assert (=> b!1192724 (= lt!542310 (getCurrentListMapNoExtraKeys!5199 lt!542311 lt!542312 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3153 (Int (_ BitVec 64)) V!45281)

(assert (=> b!1192724 (= lt!542312 (array!77064 (store (arr!37175 _values!996) i!673 (ValueCellFull!14348 (dynLambda!3153 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37712 _values!996)))))

(declare-fun lt!542309 () ListLongMap!17431)

(assert (=> b!1192724 (= lt!542309 (getCurrentListMapNoExtraKeys!5199 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192713 () Bool)

(assert (=> b!1192713 (= e!678093 (not e!678097))))

(declare-fun res!792979 () Bool)

(assert (=> b!1192713 (=> res!792979 e!678097)))

(assert (=> b!1192713 (= res!792979 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192713 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542313 () Unit!39505)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77065 (_ BitVec 64) (_ BitVec 32)) Unit!39505)

(assert (=> b!1192713 (= lt!542313 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!792974 () Bool)

(assert (=> start!100242 (=> (not res!792974) (not e!678091))))

(assert (=> start!100242 (= res!792974 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37713 _keys!1208))))))

(assert (=> start!100242 e!678091))

(assert (=> start!100242 tp_is_empty!30115))

(declare-fun array_inv!28410 (array!77065) Bool)

(assert (=> start!100242 (array_inv!28410 _keys!1208)))

(assert (=> start!100242 true))

(assert (=> start!100242 tp!89468))

(declare-fun array_inv!28411 (array!77063) Bool)

(assert (=> start!100242 (and (array_inv!28411 _values!996) e!678094)))

(assert (= (and start!100242 res!792974) b!1192722))

(assert (= (and b!1192722 res!792976) b!1192723))

(assert (= (and b!1192723 res!792975) b!1192714))

(assert (= (and b!1192714 res!792977) b!1192711))

(assert (= (and b!1192711 res!792978) b!1192715))

(assert (= (and b!1192715 res!792982) b!1192717))

(assert (= (and b!1192717 res!792973) b!1192721))

(assert (= (and b!1192721 res!792981) b!1192719))

(assert (= (and b!1192719 res!792980) b!1192720))

(assert (= (and b!1192720 res!792983) b!1192713))

(assert (= (and b!1192713 (not res!792979)) b!1192724))

(assert (= (and b!1192724 (not res!792972)) b!1192718))

(assert (= (and b!1192710 condMapEmpty!47000) mapIsEmpty!47000))

(assert (= (and b!1192710 (not condMapEmpty!47000)) mapNonEmpty!47000))

(get-info :version)

(assert (= (and mapNonEmpty!47000 ((_ is ValueCellFull!14348) mapValue!47000)) b!1192712))

(assert (= (and b!1192710 ((_ is ValueCellFull!14348) mapDefault!47000)) b!1192716))

(assert (= start!100242 b!1192710))

(declare-fun b_lambda!20723 () Bool)

(assert (=> (not b_lambda!20723) (not b!1192724)))

(declare-fun t!38767 () Bool)

(declare-fun tb!10389 () Bool)

(assert (=> (and start!100242 (= defaultEntry!1004 defaultEntry!1004) t!38767) tb!10389))

(declare-fun result!21353 () Bool)

(assert (=> tb!10389 (= result!21353 tp_is_empty!30115)))

(assert (=> b!1192724 t!38767))

(declare-fun b_and!42041 () Bool)

(assert (= b_and!42039 (and (=> t!38767 result!21353) b_and!42041)))

(declare-fun m!1101459 () Bool)

(assert (=> b!1192720 m!1101459))

(declare-fun m!1101461 () Bool)

(assert (=> b!1192724 m!1101461))

(declare-fun m!1101463 () Bool)

(assert (=> b!1192724 m!1101463))

(declare-fun m!1101465 () Bool)

(assert (=> b!1192724 m!1101465))

(declare-fun m!1101467 () Bool)

(assert (=> b!1192724 m!1101467))

(declare-fun m!1101469 () Bool)

(assert (=> b!1192711 m!1101469))

(declare-fun m!1101471 () Bool)

(assert (=> start!100242 m!1101471))

(declare-fun m!1101473 () Bool)

(assert (=> start!100242 m!1101473))

(declare-fun m!1101475 () Bool)

(assert (=> b!1192722 m!1101475))

(declare-fun m!1101477 () Bool)

(assert (=> b!1192717 m!1101477))

(declare-fun m!1101479 () Bool)

(assert (=> b!1192714 m!1101479))

(declare-fun m!1101481 () Bool)

(assert (=> b!1192713 m!1101481))

(declare-fun m!1101483 () Bool)

(assert (=> b!1192713 m!1101483))

(declare-fun m!1101485 () Bool)

(assert (=> b!1192721 m!1101485))

(declare-fun m!1101487 () Bool)

(assert (=> mapNonEmpty!47000 m!1101487))

(declare-fun m!1101489 () Bool)

(assert (=> b!1192719 m!1101489))

(declare-fun m!1101491 () Bool)

(assert (=> b!1192719 m!1101491))

(declare-fun m!1101493 () Bool)

(assert (=> b!1192718 m!1101493))

(declare-fun m!1101495 () Bool)

(assert (=> b!1192718 m!1101495))

(assert (=> b!1192718 m!1101495))

(declare-fun m!1101497 () Bool)

(assert (=> b!1192718 m!1101497))

(declare-fun m!1101499 () Bool)

(assert (=> b!1192718 m!1101499))

(check-sat (not b_lambda!20723) (not b!1192719) (not b!1192724) (not b_next!25585) (not b!1192720) (not start!100242) (not b!1192711) (not b!1192713) (not b!1192722) (not b!1192718) tp_is_empty!30115 b_and!42041 (not b!1192714) (not mapNonEmpty!47000) (not b!1192717))
(check-sat b_and!42041 (not b_next!25585))
