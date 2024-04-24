; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100548 () Bool)

(assert start!100548)

(declare-fun b_free!25699 () Bool)

(declare-fun b_next!25699 () Bool)

(assert (=> start!100548 (= b_free!25699 (not b_next!25699))))

(declare-fun tp!90044 () Bool)

(declare-fun b_and!42267 () Bool)

(assert (=> start!100548 (= tp!90044 b_and!42267)))

(declare-fun b!1198352 () Bool)

(declare-fun e!680897 () Bool)

(declare-datatypes ((V!45633 0))(
  ( (V!45634 (val!15246 Int)) )
))
(declare-datatypes ((tuple2!19548 0))(
  ( (tuple2!19549 (_1!9785 (_ BitVec 64)) (_2!9785 V!45633)) )
))
(declare-datatypes ((List!26348 0))(
  ( (Nil!26345) (Cons!26344 (h!27562 tuple2!19548) (t!39031 List!26348)) )
))
(declare-datatypes ((ListLongMap!17525 0))(
  ( (ListLongMap!17526 (toList!8778 List!26348)) )
))
(declare-fun call!57283 () ListLongMap!17525)

(declare-fun call!57284 () ListLongMap!17525)

(assert (=> b!1198352 (= e!680897 (= call!57283 call!57284))))

(declare-fun mapIsEmpty!47405 () Bool)

(declare-fun mapRes!47405 () Bool)

(assert (=> mapIsEmpty!47405 mapRes!47405))

(declare-fun zeroValue!944 () V!45633)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!57280 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77573 0))(
  ( (array!77574 (arr!37427 (Array (_ BitVec 32) (_ BitVec 64))) (size!37964 (_ BitVec 32))) )
))
(declare-fun lt!543674 () array!77573)

(declare-datatypes ((ValueCell!14480 0))(
  ( (ValueCellFull!14480 (v!17880 V!45633)) (EmptyCell!14480) )
))
(declare-datatypes ((array!77575 0))(
  ( (array!77576 (arr!37428 (Array (_ BitVec 32) ValueCell!14480)) (size!37965 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77575)

(declare-fun minValue!944 () V!45633)

(declare-fun getCurrentListMapNoExtraKeys!5245 (array!77573 array!77575 (_ BitVec 32) (_ BitVec 32) V!45633 V!45633 (_ BitVec 32) Int) ListLongMap!17525)

(declare-fun dynLambda!3193 (Int (_ BitVec 64)) V!45633)

(assert (=> bm!57280 (= call!57283 (getCurrentListMapNoExtraKeys!5245 lt!543674 (array!77576 (store (arr!37428 _values!996) i!673 (ValueCellFull!14480 (dynLambda!3193 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37965 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198353 () Bool)

(declare-fun res!797165 () Bool)

(declare-fun e!680900 () Bool)

(assert (=> b!1198353 (=> (not res!797165) (not e!680900))))

(declare-fun _keys!1208 () array!77573)

(assert (=> b!1198353 (= res!797165 (and (= (size!37965 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37964 _keys!1208) (size!37965 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!797167 () Bool)

(assert (=> start!100548 (=> (not res!797167) (not e!680900))))

(assert (=> start!100548 (= res!797167 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37964 _keys!1208))))))

(assert (=> start!100548 e!680900))

(declare-fun tp_is_empty!30379 () Bool)

(assert (=> start!100548 tp_is_empty!30379))

(declare-fun array_inv!28596 (array!77573) Bool)

(assert (=> start!100548 (array_inv!28596 _keys!1208)))

(assert (=> start!100548 true))

(assert (=> start!100548 tp!90044))

(declare-fun e!680901 () Bool)

(declare-fun array_inv!28597 (array!77575) Bool)

(assert (=> start!100548 (and (array_inv!28597 _values!996) e!680901)))

(declare-fun b!1198354 () Bool)

(declare-fun res!797169 () Bool)

(assert (=> b!1198354 (=> (not res!797169) (not e!680900))))

(declare-datatypes ((List!26349 0))(
  ( (Nil!26346) (Cons!26345 (h!27563 (_ BitVec 64)) (t!39032 List!26349)) )
))
(declare-fun arrayNoDuplicates!0 (array!77573 (_ BitVec 32) List!26349) Bool)

(assert (=> b!1198354 (= res!797169 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26346))))

(declare-fun b!1198355 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1777 (ListLongMap!17525 (_ BitVec 64)) ListLongMap!17525)

(assert (=> b!1198355 (= e!680897 (= call!57283 (-!1777 call!57284 k0!934)))))

(declare-fun b!1198356 () Bool)

(declare-fun e!680899 () Bool)

(assert (=> b!1198356 (= e!680900 e!680899)))

(declare-fun res!797173 () Bool)

(assert (=> b!1198356 (=> (not res!797173) (not e!680899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77573 (_ BitVec 32)) Bool)

(assert (=> b!1198356 (= res!797173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543674 mask!1564))))

(assert (=> b!1198356 (= lt!543674 (array!77574 (store (arr!37427 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37964 _keys!1208)))))

(declare-fun b!1198357 () Bool)

(declare-fun e!680898 () Bool)

(assert (=> b!1198357 (= e!680899 (not e!680898))))

(declare-fun res!797172 () Bool)

(assert (=> b!1198357 (=> res!797172 e!680898)))

(assert (=> b!1198357 (= res!797172 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37964 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198357 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39663 0))(
  ( (Unit!39664) )
))
(declare-fun lt!543676 () Unit!39663)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77573 (_ BitVec 64) (_ BitVec 32)) Unit!39663)

(assert (=> b!1198357 (= lt!543676 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198358 () Bool)

(assert (=> b!1198358 (= e!680898 (bvslt i!673 (size!37965 _values!996)))))

(assert (=> b!1198358 e!680897))

(declare-fun c!117761 () Bool)

(assert (=> b!1198358 (= c!117761 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!543675 () Unit!39663)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!993 (array!77573 array!77575 (_ BitVec 32) (_ BitVec 32) V!45633 V!45633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39663)

(assert (=> b!1198358 (= lt!543675 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!993 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198359 () Bool)

(declare-fun res!797171 () Bool)

(assert (=> b!1198359 (=> (not res!797171) (not e!680900))))

(assert (=> b!1198359 (= res!797171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198360 () Bool)

(declare-fun res!797166 () Bool)

(assert (=> b!1198360 (=> (not res!797166) (not e!680900))))

(assert (=> b!1198360 (= res!797166 (= (select (arr!37427 _keys!1208) i!673) k0!934))))

(declare-fun b!1198361 () Bool)

(declare-fun res!797168 () Bool)

(assert (=> b!1198361 (=> (not res!797168) (not e!680899))))

(assert (=> b!1198361 (= res!797168 (arrayNoDuplicates!0 lt!543674 #b00000000000000000000000000000000 Nil!26346))))

(declare-fun b!1198362 () Bool)

(declare-fun e!680896 () Bool)

(assert (=> b!1198362 (= e!680896 tp_is_empty!30379)))

(declare-fun b!1198363 () Bool)

(declare-fun res!797164 () Bool)

(assert (=> b!1198363 (=> (not res!797164) (not e!680900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198363 (= res!797164 (validKeyInArray!0 k0!934))))

(declare-fun b!1198364 () Bool)

(declare-fun res!797170 () Bool)

(assert (=> b!1198364 (=> (not res!797170) (not e!680900))))

(assert (=> b!1198364 (= res!797170 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37964 _keys!1208))))))

(declare-fun b!1198365 () Bool)

(declare-fun res!797174 () Bool)

(assert (=> b!1198365 (=> (not res!797174) (not e!680900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198365 (= res!797174 (validMask!0 mask!1564))))

(declare-fun bm!57281 () Bool)

(assert (=> bm!57281 (= call!57284 (getCurrentListMapNoExtraKeys!5245 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1198366 () Bool)

(assert (=> b!1198366 (= e!680901 (and e!680896 mapRes!47405))))

(declare-fun condMapEmpty!47405 () Bool)

(declare-fun mapDefault!47405 () ValueCell!14480)

(assert (=> b!1198366 (= condMapEmpty!47405 (= (arr!37428 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14480)) mapDefault!47405)))))

(declare-fun b!1198367 () Bool)

(declare-fun e!680902 () Bool)

(assert (=> b!1198367 (= e!680902 tp_is_empty!30379)))

(declare-fun mapNonEmpty!47405 () Bool)

(declare-fun tp!90045 () Bool)

(assert (=> mapNonEmpty!47405 (= mapRes!47405 (and tp!90045 e!680902))))

(declare-fun mapRest!47405 () (Array (_ BitVec 32) ValueCell!14480))

(declare-fun mapKey!47405 () (_ BitVec 32))

(declare-fun mapValue!47405 () ValueCell!14480)

(assert (=> mapNonEmpty!47405 (= (arr!37428 _values!996) (store mapRest!47405 mapKey!47405 mapValue!47405))))

(assert (= (and start!100548 res!797167) b!1198365))

(assert (= (and b!1198365 res!797174) b!1198353))

(assert (= (and b!1198353 res!797165) b!1198359))

(assert (= (and b!1198359 res!797171) b!1198354))

(assert (= (and b!1198354 res!797169) b!1198364))

(assert (= (and b!1198364 res!797170) b!1198363))

(assert (= (and b!1198363 res!797164) b!1198360))

(assert (= (and b!1198360 res!797166) b!1198356))

(assert (= (and b!1198356 res!797173) b!1198361))

(assert (= (and b!1198361 res!797168) b!1198357))

(assert (= (and b!1198357 (not res!797172)) b!1198358))

(assert (= (and b!1198358 c!117761) b!1198355))

(assert (= (and b!1198358 (not c!117761)) b!1198352))

(assert (= (or b!1198355 b!1198352) bm!57280))

(assert (= (or b!1198355 b!1198352) bm!57281))

(assert (= (and b!1198366 condMapEmpty!47405) mapIsEmpty!47405))

(assert (= (and b!1198366 (not condMapEmpty!47405)) mapNonEmpty!47405))

(get-info :version)

(assert (= (and mapNonEmpty!47405 ((_ is ValueCellFull!14480) mapValue!47405)) b!1198367))

(assert (= (and b!1198366 ((_ is ValueCellFull!14480) mapDefault!47405)) b!1198362))

(assert (= start!100548 b!1198366))

(declare-fun b_lambda!20837 () Bool)

(assert (=> (not b_lambda!20837) (not bm!57280)))

(declare-fun t!39030 () Bool)

(declare-fun tb!10503 () Bool)

(assert (=> (and start!100548 (= defaultEntry!1004 defaultEntry!1004) t!39030) tb!10503))

(declare-fun result!21587 () Bool)

(assert (=> tb!10503 (= result!21587 tp_is_empty!30379)))

(assert (=> bm!57280 t!39030))

(declare-fun b_and!42269 () Bool)

(assert (= b_and!42267 (and (=> t!39030 result!21587) b_and!42269)))

(declare-fun m!1105701 () Bool)

(assert (=> bm!57280 m!1105701))

(declare-fun m!1105703 () Bool)

(assert (=> bm!57280 m!1105703))

(declare-fun m!1105705 () Bool)

(assert (=> bm!57280 m!1105705))

(declare-fun m!1105707 () Bool)

(assert (=> bm!57281 m!1105707))

(declare-fun m!1105709 () Bool)

(assert (=> b!1198359 m!1105709))

(declare-fun m!1105711 () Bool)

(assert (=> b!1198356 m!1105711))

(declare-fun m!1105713 () Bool)

(assert (=> b!1198356 m!1105713))

(declare-fun m!1105715 () Bool)

(assert (=> b!1198361 m!1105715))

(declare-fun m!1105717 () Bool)

(assert (=> b!1198357 m!1105717))

(declare-fun m!1105719 () Bool)

(assert (=> b!1198357 m!1105719))

(declare-fun m!1105721 () Bool)

(assert (=> b!1198363 m!1105721))

(declare-fun m!1105723 () Bool)

(assert (=> start!100548 m!1105723))

(declare-fun m!1105725 () Bool)

(assert (=> start!100548 m!1105725))

(declare-fun m!1105727 () Bool)

(assert (=> mapNonEmpty!47405 m!1105727))

(declare-fun m!1105729 () Bool)

(assert (=> b!1198360 m!1105729))

(declare-fun m!1105731 () Bool)

(assert (=> b!1198355 m!1105731))

(declare-fun m!1105733 () Bool)

(assert (=> b!1198358 m!1105733))

(declare-fun m!1105735 () Bool)

(assert (=> b!1198354 m!1105735))

(declare-fun m!1105737 () Bool)

(assert (=> b!1198365 m!1105737))

(check-sat (not start!100548) (not mapNonEmpty!47405) tp_is_empty!30379 (not b!1198357) (not b!1198359) (not b!1198355) (not b_next!25699) b_and!42269 (not b!1198361) (not b!1198356) (not b_lambda!20837) (not bm!57281) (not bm!57280) (not b!1198354) (not b!1198358) (not b!1198365) (not b!1198363))
(check-sat b_and!42269 (not b_next!25699))
