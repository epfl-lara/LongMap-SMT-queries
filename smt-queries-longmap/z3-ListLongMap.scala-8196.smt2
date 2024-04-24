; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100278 () Bool)

(assert start!100278)

(declare-fun b_free!25621 () Bool)

(declare-fun b_next!25621 () Bool)

(assert (=> start!100278 (= b_free!25621 (not b_next!25621))))

(declare-fun tp!89577 () Bool)

(declare-fun b_and!42111 () Bool)

(assert (=> start!100278 (= tp!89577 b_and!42111)))

(declare-fun mapNonEmpty!47054 () Bool)

(declare-fun mapRes!47054 () Bool)

(declare-fun tp!89576 () Bool)

(declare-fun e!678529 () Bool)

(assert (=> mapNonEmpty!47054 (= mapRes!47054 (and tp!89576 e!678529))))

(declare-fun mapKey!47054 () (_ BitVec 32))

(declare-datatypes ((V!45329 0))(
  ( (V!45330 (val!15132 Int)) )
))
(declare-datatypes ((ValueCell!14366 0))(
  ( (ValueCellFull!14366 (v!17766 V!45329)) (EmptyCell!14366) )
))
(declare-fun mapValue!47054 () ValueCell!14366)

(declare-datatypes ((array!77129 0))(
  ( (array!77130 (arr!37208 (Array (_ BitVec 32) ValueCell!14366)) (size!37745 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77129)

(declare-fun mapRest!47054 () (Array (_ BitVec 32) ValueCell!14366))

(assert (=> mapNonEmpty!47054 (= (arr!37208 _values!996) (store mapRest!47054 mapKey!47054 mapValue!47054))))

(declare-fun b!1193556 () Bool)

(declare-fun res!793626 () Bool)

(declare-fun e!678524 () Bool)

(assert (=> b!1193556 (=> (not res!793626) (not e!678524))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193556 (= res!793626 (validKeyInArray!0 k0!934))))

(declare-fun b!1193557 () Bool)

(declare-fun res!793631 () Bool)

(assert (=> b!1193557 (=> (not res!793631) (not e!678524))))

(declare-datatypes ((array!77131 0))(
  ( (array!77132 (arr!37209 (Array (_ BitVec 32) (_ BitVec 64))) (size!37746 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77131)

(declare-datatypes ((List!26224 0))(
  ( (Nil!26221) (Cons!26220 (h!27438 (_ BitVec 64)) (t!38829 List!26224)) )
))
(declare-fun arrayNoDuplicates!0 (array!77131 (_ BitVec 32) List!26224) Bool)

(assert (=> b!1193557 (= res!793631 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26221))))

(declare-fun b!1193558 () Bool)

(declare-fun e!678530 () Bool)

(declare-fun e!678528 () Bool)

(assert (=> b!1193558 (= e!678530 (not e!678528))))

(declare-fun res!793624 () Bool)

(assert (=> b!1193558 (=> res!793624 e!678528)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193558 (= res!793624 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193558 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39531 0))(
  ( (Unit!39532) )
))
(declare-fun lt!542635 () Unit!39531)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77131 (_ BitVec 64) (_ BitVec 32)) Unit!39531)

(assert (=> b!1193558 (= lt!542635 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193559 () Bool)

(declare-fun res!793625 () Bool)

(assert (=> b!1193559 (=> (not res!793625) (not e!678524))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77131 (_ BitVec 32)) Bool)

(assert (=> b!1193559 (= res!793625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193561 () Bool)

(declare-fun res!793622 () Bool)

(assert (=> b!1193561 (=> (not res!793622) (not e!678524))))

(assert (=> b!1193561 (= res!793622 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37746 _keys!1208))))))

(declare-fun b!1193562 () Bool)

(assert (=> b!1193562 (= e!678524 e!678530)))

(declare-fun res!793629 () Bool)

(assert (=> b!1193562 (=> (not res!793629) (not e!678530))))

(declare-fun lt!542638 () array!77131)

(assert (=> b!1193562 (= res!793629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542638 mask!1564))))

(assert (=> b!1193562 (= lt!542638 (array!77132 (store (arr!37209 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37746 _keys!1208)))))

(declare-fun b!1193563 () Bool)

(declare-fun e!678526 () Bool)

(assert (=> b!1193563 (= e!678526 true)))

(declare-fun zeroValue!944 () V!45329)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45329)

(declare-fun lt!542633 () array!77129)

(declare-datatypes ((tuple2!19482 0))(
  ( (tuple2!19483 (_1!9752 (_ BitVec 64)) (_2!9752 V!45329)) )
))
(declare-datatypes ((List!26225 0))(
  ( (Nil!26222) (Cons!26221 (h!27439 tuple2!19482) (t!38830 List!26225)) )
))
(declare-datatypes ((ListLongMap!17459 0))(
  ( (ListLongMap!17460 (toList!8745 List!26225)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5213 (array!77131 array!77129 (_ BitVec 32) (_ BitVec 32) V!45329 V!45329 (_ BitVec 32) Int) ListLongMap!17459)

(declare-fun -!1752 (ListLongMap!17459 (_ BitVec 64)) ListLongMap!17459)

(assert (=> b!1193563 (= (getCurrentListMapNoExtraKeys!5213 lt!542638 lt!542633 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1752 (getCurrentListMapNoExtraKeys!5213 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542637 () Unit!39531)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!967 (array!77131 array!77129 (_ BitVec 32) (_ BitVec 32) V!45329 V!45329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39531)

(assert (=> b!1193563 (= lt!542637 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!967 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193564 () Bool)

(declare-fun res!793627 () Bool)

(assert (=> b!1193564 (=> (not res!793627) (not e!678524))))

(assert (=> b!1193564 (= res!793627 (= (select (arr!37209 _keys!1208) i!673) k0!934))))

(declare-fun b!1193565 () Bool)

(declare-fun e!678525 () Bool)

(declare-fun e!678523 () Bool)

(assert (=> b!1193565 (= e!678525 (and e!678523 mapRes!47054))))

(declare-fun condMapEmpty!47054 () Bool)

(declare-fun mapDefault!47054 () ValueCell!14366)

(assert (=> b!1193565 (= condMapEmpty!47054 (= (arr!37208 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14366)) mapDefault!47054)))))

(declare-fun res!793621 () Bool)

(assert (=> start!100278 (=> (not res!793621) (not e!678524))))

(assert (=> start!100278 (= res!793621 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37746 _keys!1208))))))

(assert (=> start!100278 e!678524))

(declare-fun tp_is_empty!30151 () Bool)

(assert (=> start!100278 tp_is_empty!30151))

(declare-fun array_inv!28432 (array!77131) Bool)

(assert (=> start!100278 (array_inv!28432 _keys!1208)))

(assert (=> start!100278 true))

(assert (=> start!100278 tp!89577))

(declare-fun array_inv!28433 (array!77129) Bool)

(assert (=> start!100278 (and (array_inv!28433 _values!996) e!678525)))

(declare-fun b!1193560 () Bool)

(declare-fun res!793623 () Bool)

(assert (=> b!1193560 (=> (not res!793623) (not e!678524))))

(assert (=> b!1193560 (= res!793623 (and (= (size!37745 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37746 _keys!1208) (size!37745 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47054 () Bool)

(assert (=> mapIsEmpty!47054 mapRes!47054))

(declare-fun b!1193566 () Bool)

(declare-fun res!793620 () Bool)

(assert (=> b!1193566 (=> (not res!793620) (not e!678530))))

(assert (=> b!1193566 (= res!793620 (arrayNoDuplicates!0 lt!542638 #b00000000000000000000000000000000 Nil!26221))))

(declare-fun b!1193567 () Bool)

(assert (=> b!1193567 (= e!678528 e!678526)))

(declare-fun res!793628 () Bool)

(assert (=> b!1193567 (=> res!793628 e!678526)))

(assert (=> b!1193567 (= res!793628 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542636 () ListLongMap!17459)

(assert (=> b!1193567 (= lt!542636 (getCurrentListMapNoExtraKeys!5213 lt!542638 lt!542633 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3164 (Int (_ BitVec 64)) V!45329)

(assert (=> b!1193567 (= lt!542633 (array!77130 (store (arr!37208 _values!996) i!673 (ValueCellFull!14366 (dynLambda!3164 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37745 _values!996)))))

(declare-fun lt!542634 () ListLongMap!17459)

(assert (=> b!1193567 (= lt!542634 (getCurrentListMapNoExtraKeys!5213 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193568 () Bool)

(assert (=> b!1193568 (= e!678523 tp_is_empty!30151)))

(declare-fun b!1193569 () Bool)

(declare-fun res!793630 () Bool)

(assert (=> b!1193569 (=> (not res!793630) (not e!678524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193569 (= res!793630 (validMask!0 mask!1564))))

(declare-fun b!1193570 () Bool)

(assert (=> b!1193570 (= e!678529 tp_is_empty!30151)))

(assert (= (and start!100278 res!793621) b!1193569))

(assert (= (and b!1193569 res!793630) b!1193560))

(assert (= (and b!1193560 res!793623) b!1193559))

(assert (= (and b!1193559 res!793625) b!1193557))

(assert (= (and b!1193557 res!793631) b!1193561))

(assert (= (and b!1193561 res!793622) b!1193556))

(assert (= (and b!1193556 res!793626) b!1193564))

(assert (= (and b!1193564 res!793627) b!1193562))

(assert (= (and b!1193562 res!793629) b!1193566))

(assert (= (and b!1193566 res!793620) b!1193558))

(assert (= (and b!1193558 (not res!793624)) b!1193567))

(assert (= (and b!1193567 (not res!793628)) b!1193563))

(assert (= (and b!1193565 condMapEmpty!47054) mapIsEmpty!47054))

(assert (= (and b!1193565 (not condMapEmpty!47054)) mapNonEmpty!47054))

(get-info :version)

(assert (= (and mapNonEmpty!47054 ((_ is ValueCellFull!14366) mapValue!47054)) b!1193570))

(assert (= (and b!1193565 ((_ is ValueCellFull!14366) mapDefault!47054)) b!1193568))

(assert (= start!100278 b!1193565))

(declare-fun b_lambda!20759 () Bool)

(assert (=> (not b_lambda!20759) (not b!1193567)))

(declare-fun t!38828 () Bool)

(declare-fun tb!10425 () Bool)

(assert (=> (and start!100278 (= defaultEntry!1004 defaultEntry!1004) t!38828) tb!10425))

(declare-fun result!21425 () Bool)

(assert (=> tb!10425 (= result!21425 tp_is_empty!30151)))

(assert (=> b!1193567 t!38828))

(declare-fun b_and!42113 () Bool)

(assert (= b_and!42111 (and (=> t!38828 result!21425) b_and!42113)))

(declare-fun m!1102215 () Bool)

(assert (=> b!1193562 m!1102215))

(declare-fun m!1102217 () Bool)

(assert (=> b!1193562 m!1102217))

(declare-fun m!1102219 () Bool)

(assert (=> b!1193569 m!1102219))

(declare-fun m!1102221 () Bool)

(assert (=> mapNonEmpty!47054 m!1102221))

(declare-fun m!1102223 () Bool)

(assert (=> b!1193556 m!1102223))

(declare-fun m!1102225 () Bool)

(assert (=> b!1193557 m!1102225))

(declare-fun m!1102227 () Bool)

(assert (=> b!1193566 m!1102227))

(declare-fun m!1102229 () Bool)

(assert (=> b!1193567 m!1102229))

(declare-fun m!1102231 () Bool)

(assert (=> b!1193567 m!1102231))

(declare-fun m!1102233 () Bool)

(assert (=> b!1193567 m!1102233))

(declare-fun m!1102235 () Bool)

(assert (=> b!1193567 m!1102235))

(declare-fun m!1102237 () Bool)

(assert (=> b!1193564 m!1102237))

(declare-fun m!1102239 () Bool)

(assert (=> b!1193559 m!1102239))

(declare-fun m!1102241 () Bool)

(assert (=> b!1193563 m!1102241))

(declare-fun m!1102243 () Bool)

(assert (=> b!1193563 m!1102243))

(assert (=> b!1193563 m!1102243))

(declare-fun m!1102245 () Bool)

(assert (=> b!1193563 m!1102245))

(declare-fun m!1102247 () Bool)

(assert (=> b!1193563 m!1102247))

(declare-fun m!1102249 () Bool)

(assert (=> start!100278 m!1102249))

(declare-fun m!1102251 () Bool)

(assert (=> start!100278 m!1102251))

(declare-fun m!1102253 () Bool)

(assert (=> b!1193558 m!1102253))

(declare-fun m!1102255 () Bool)

(assert (=> b!1193558 m!1102255))

(check-sat (not b!1193563) (not b_lambda!20759) (not b!1193557) (not b!1193569) (not b!1193556) (not b!1193567) (not b!1193566) (not b!1193559) (not b!1193558) (not b_next!25621) (not mapNonEmpty!47054) (not b!1193562) (not start!100278) tp_is_empty!30151 b_and!42113)
(check-sat b_and!42113 (not b_next!25621))
