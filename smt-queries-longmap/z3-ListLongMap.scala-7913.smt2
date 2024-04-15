; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98216 () Bool)

(assert start!98216)

(declare-fun b_free!23923 () Bool)

(declare-fun b_next!23923 () Bool)

(assert (=> start!98216 (= b_free!23923 (not b_next!23923))))

(declare-fun tp!84473 () Bool)

(declare-fun b_and!38607 () Bool)

(assert (=> start!98216 (= tp!84473 b_and!38607)))

(declare-fun bm!48523 () Bool)

(declare-fun call!48531 () Bool)

(declare-fun call!48529 () Bool)

(assert (=> bm!48523 (= call!48531 call!48529)))

(declare-fun res!755620 () Bool)

(declare-fun e!643643 () Bool)

(assert (=> start!98216 (=> (not res!755620) (not e!643643))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73686 0))(
  ( (array!73687 (arr!35496 (Array (_ BitVec 32) (_ BitVec 64))) (size!36034 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73686)

(assert (=> start!98216 (= res!755620 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36034 _keys!1208))))))

(assert (=> start!98216 e!643643))

(declare-fun tp_is_empty!28453 () Bool)

(assert (=> start!98216 tp_is_empty!28453))

(declare-fun array_inv!27304 (array!73686) Bool)

(assert (=> start!98216 (array_inv!27304 _keys!1208)))

(assert (=> start!98216 true))

(assert (=> start!98216 tp!84473))

(declare-datatypes ((V!43065 0))(
  ( (V!43066 (val!14283 Int)) )
))
(declare-datatypes ((ValueCell!13517 0))(
  ( (ValueCellFull!13517 (v!16915 V!43065)) (EmptyCell!13517) )
))
(declare-datatypes ((array!73688 0))(
  ( (array!73689 (arr!35497 (Array (_ BitVec 32) ValueCell!13517)) (size!36035 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73688)

(declare-fun e!643644 () Bool)

(declare-fun array_inv!27305 (array!73688) Bool)

(assert (=> start!98216 (and (array_inv!27305 _values!996) e!643644)))

(declare-fun zeroValue!944 () V!43065)

(declare-datatypes ((tuple2!18086 0))(
  ( (tuple2!18087 (_1!9054 (_ BitVec 64)) (_2!9054 V!43065)) )
))
(declare-datatypes ((List!24836 0))(
  ( (Nil!24833) (Cons!24832 (h!26041 tuple2!18086) (t!35742 List!24836)) )
))
(declare-datatypes ((ListLongMap!16055 0))(
  ( (ListLongMap!16056 (toList!8043 List!24836)) )
))
(declare-fun call!48530 () ListLongMap!16055)

(declare-fun c!110098 () Bool)

(declare-fun c!110097 () Bool)

(declare-fun lt!502168 () ListLongMap!16055)

(declare-fun bm!48524 () Bool)

(declare-fun minValue!944 () V!43065)

(declare-fun +!3483 (ListLongMap!16055 tuple2!18086) ListLongMap!16055)

(assert (=> bm!48524 (= call!48530 (+!3483 lt!502168 (ite (or c!110097 c!110098) (tuple2!18087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1130987 () Bool)

(declare-fun e!643652 () Bool)

(declare-fun e!643651 () Bool)

(assert (=> b!1130987 (= e!643652 e!643651)))

(declare-fun res!755621 () Bool)

(assert (=> b!1130987 (=> res!755621 e!643651)))

(assert (=> b!1130987 (= res!755621 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36034 _keys!1208))))))

(declare-datatypes ((Unit!36896 0))(
  ( (Unit!36897) )
))
(declare-fun lt!502179 () Unit!36896)

(declare-fun e!643645 () Unit!36896)

(assert (=> b!1130987 (= lt!502179 e!643645)))

(declare-fun lt!502176 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1130987 (= c!110097 (and (not lt!502176) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130987 (= lt!502176 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130988 () Bool)

(assert (=> b!1130988 call!48531))

(declare-fun lt!502172 () Unit!36896)

(declare-fun call!48532 () Unit!36896)

(assert (=> b!1130988 (= lt!502172 call!48532)))

(declare-fun e!643647 () Unit!36896)

(assert (=> b!1130988 (= e!643647 lt!502172)))

(declare-fun b!1130989 () Bool)

(declare-fun e!643654 () Bool)

(assert (=> b!1130989 (= e!643654 tp_is_empty!28453)))

(declare-fun b!1130990 () Bool)

(declare-fun c!110100 () Bool)

(assert (=> b!1130990 (= c!110100 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502176))))

(declare-fun e!643642 () Unit!36896)

(assert (=> b!1130990 (= e!643647 e!643642)))

(declare-fun bm!48525 () Bool)

(declare-fun call!48528 () Unit!36896)

(assert (=> bm!48525 (= call!48532 call!48528)))

(declare-fun b!1130991 () Bool)

(declare-fun e!643653 () Bool)

(declare-fun e!643648 () Bool)

(assert (=> b!1130991 (= e!643653 e!643648)))

(declare-fun res!755622 () Bool)

(assert (=> b!1130991 (=> res!755622 e!643648)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1130991 (= res!755622 (not (= (select (arr!35496 _keys!1208) from!1455) k0!934)))))

(declare-fun e!643650 () Bool)

(assert (=> b!1130991 e!643650))

(declare-fun c!110099 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130991 (= c!110099 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!502173 () Unit!36896)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!433 (array!73686 array!73688 (_ BitVec 32) (_ BitVec 32) V!43065 V!43065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36896)

(assert (=> b!1130991 (= lt!502173 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130992 () Bool)

(declare-fun call!48527 () ListLongMap!16055)

(declare-fun call!48526 () ListLongMap!16055)

(assert (=> b!1130992 (= e!643650 (= call!48527 call!48526))))

(declare-fun bm!48526 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4542 (array!73686 array!73688 (_ BitVec 32) (_ BitVec 32) V!43065 V!43065 (_ BitVec 32) Int) ListLongMap!16055)

(assert (=> bm!48526 (= call!48526 (getCurrentListMapNoExtraKeys!4542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130993 () Bool)

(declare-fun res!755615 () Bool)

(assert (=> b!1130993 (=> (not res!755615) (not e!643643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73686 (_ BitVec 32)) Bool)

(assert (=> b!1130993 (= res!755615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130994 () Bool)

(declare-fun e!643646 () Bool)

(declare-fun e!643655 () Bool)

(assert (=> b!1130994 (= e!643646 (not e!643655))))

(declare-fun res!755626 () Bool)

(assert (=> b!1130994 (=> res!755626 e!643655)))

(assert (=> b!1130994 (= res!755626 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130994 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502177 () Unit!36896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73686 (_ BitVec 64) (_ BitVec 32)) Unit!36896)

(assert (=> b!1130994 (= lt!502177 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun lt!502178 () array!73688)

(declare-fun lt!502182 () array!73686)

(declare-fun bm!48527 () Bool)

(assert (=> bm!48527 (= call!48527 (getCurrentListMapNoExtraKeys!4542 lt!502182 lt!502178 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130995 () Bool)

(declare-fun lt!502170 () Unit!36896)

(assert (=> b!1130995 (= e!643642 lt!502170)))

(assert (=> b!1130995 (= lt!502170 call!48532)))

(assert (=> b!1130995 call!48531))

(declare-fun b!1130996 () Bool)

(declare-fun res!755629 () Bool)

(assert (=> b!1130996 (=> (not res!755629) (not e!643643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130996 (= res!755629 (validKeyInArray!0 k0!934))))

(declare-fun b!1130997 () Bool)

(declare-fun e!643649 () Bool)

(declare-fun mapRes!44497 () Bool)

(assert (=> b!1130997 (= e!643644 (and e!643649 mapRes!44497))))

(declare-fun condMapEmpty!44497 () Bool)

(declare-fun mapDefault!44497 () ValueCell!13517)

(assert (=> b!1130997 (= condMapEmpty!44497 (= (arr!35497 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13517)) mapDefault!44497)))))

(declare-fun b!1130998 () Bool)

(declare-fun res!755627 () Bool)

(assert (=> b!1130998 (=> (not res!755627) (not e!643643))))

(assert (=> b!1130998 (= res!755627 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36034 _keys!1208))))))

(declare-fun mapNonEmpty!44497 () Bool)

(declare-fun tp!84472 () Bool)

(assert (=> mapNonEmpty!44497 (= mapRes!44497 (and tp!84472 e!643654))))

(declare-fun mapRest!44497 () (Array (_ BitVec 32) ValueCell!13517))

(declare-fun mapValue!44497 () ValueCell!13517)

(declare-fun mapKey!44497 () (_ BitVec 32))

(assert (=> mapNonEmpty!44497 (= (arr!35497 _values!996) (store mapRest!44497 mapKey!44497 mapValue!44497))))

(declare-fun b!1130999 () Bool)

(assert (=> b!1130999 (= e!643648 e!643652)))

(declare-fun res!755624 () Bool)

(assert (=> b!1130999 (=> res!755624 e!643652)))

(declare-fun contains!6495 (ListLongMap!16055 (_ BitVec 64)) Bool)

(assert (=> b!1130999 (= res!755624 (not (contains!6495 lt!502168 k0!934)))))

(assert (=> b!1130999 (= lt!502168 (getCurrentListMapNoExtraKeys!4542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44497 () Bool)

(assert (=> mapIsEmpty!44497 mapRes!44497))

(declare-fun bm!48528 () Bool)

(declare-fun lt!502181 () ListLongMap!16055)

(declare-fun addStillContains!701 (ListLongMap!16055 (_ BitVec 64) V!43065 (_ BitVec 64)) Unit!36896)

(assert (=> bm!48528 (= call!48528 (addStillContains!701 (ite c!110097 lt!502181 lt!502168) (ite c!110097 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110098 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110097 minValue!944 (ite c!110098 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1131000 () Bool)

(assert (=> b!1131000 (= e!643655 e!643653)))

(declare-fun res!755623 () Bool)

(assert (=> b!1131000 (=> res!755623 e!643653)))

(assert (=> b!1131000 (= res!755623 (not (= from!1455 i!673)))))

(declare-fun lt!502171 () ListLongMap!16055)

(assert (=> b!1131000 (= lt!502171 (getCurrentListMapNoExtraKeys!4542 lt!502182 lt!502178 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2544 (Int (_ BitVec 64)) V!43065)

(assert (=> b!1131000 (= lt!502178 (array!73689 (store (arr!35497 _values!996) i!673 (ValueCellFull!13517 (dynLambda!2544 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36035 _values!996)))))

(declare-fun lt!502174 () ListLongMap!16055)

(assert (=> b!1131000 (= lt!502174 (getCurrentListMapNoExtraKeys!4542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1131001 () Bool)

(assert (=> b!1131001 (= e!643649 tp_is_empty!28453)))

(declare-fun b!1131002 () Bool)

(declare-fun res!755619 () Bool)

(assert (=> b!1131002 (=> (not res!755619) (not e!643646))))

(declare-datatypes ((List!24837 0))(
  ( (Nil!24834) (Cons!24833 (h!26042 (_ BitVec 64)) (t!35743 List!24837)) )
))
(declare-fun arrayNoDuplicates!0 (array!73686 (_ BitVec 32) List!24837) Bool)

(assert (=> b!1131002 (= res!755619 (arrayNoDuplicates!0 lt!502182 #b00000000000000000000000000000000 Nil!24834))))

(declare-fun b!1131003 () Bool)

(declare-fun res!755617 () Bool)

(assert (=> b!1131003 (=> (not res!755617) (not e!643643))))

(assert (=> b!1131003 (= res!755617 (= (select (arr!35496 _keys!1208) i!673) k0!934))))

(declare-fun b!1131004 () Bool)

(declare-fun res!755618 () Bool)

(assert (=> b!1131004 (=> (not res!755618) (not e!643643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131004 (= res!755618 (validMask!0 mask!1564))))

(declare-fun b!1131005 () Bool)

(assert (=> b!1131005 (= e!643645 e!643647)))

(assert (=> b!1131005 (= c!110098 (and (not lt!502176) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131006 () Bool)

(declare-fun -!1150 (ListLongMap!16055 (_ BitVec 64)) ListLongMap!16055)

(assert (=> b!1131006 (= e!643650 (= call!48527 (-!1150 call!48526 k0!934)))))

(declare-fun b!1131007 () Bool)

(declare-fun res!755616 () Bool)

(assert (=> b!1131007 (=> (not res!755616) (not e!643643))))

(assert (=> b!1131007 (= res!755616 (and (= (size!36035 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36034 _keys!1208) (size!36035 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131008 () Bool)

(assert (=> b!1131008 (= e!643643 e!643646)))

(declare-fun res!755628 () Bool)

(assert (=> b!1131008 (=> (not res!755628) (not e!643646))))

(assert (=> b!1131008 (= res!755628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502182 mask!1564))))

(assert (=> b!1131008 (= lt!502182 (array!73687 (store (arr!35496 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36034 _keys!1208)))))

(declare-fun b!1131009 () Bool)

(declare-fun Unit!36898 () Unit!36896)

(assert (=> b!1131009 (= e!643642 Unit!36898)))

(declare-fun b!1131010 () Bool)

(declare-fun lt!502175 () Unit!36896)

(assert (=> b!1131010 (= e!643645 lt!502175)))

(declare-fun lt!502169 () Unit!36896)

(assert (=> b!1131010 (= lt!502169 (addStillContains!701 lt!502168 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1131010 (= lt!502181 call!48530)))

(assert (=> b!1131010 call!48529))

(assert (=> b!1131010 (= lt!502175 call!48528)))

(assert (=> b!1131010 (contains!6495 (+!3483 lt!502181 (tuple2!18087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!48529 () Bool)

(declare-fun call!48533 () ListLongMap!16055)

(assert (=> bm!48529 (= call!48529 (contains!6495 (ite c!110097 lt!502181 call!48533) k0!934))))

(declare-fun bm!48530 () Bool)

(assert (=> bm!48530 (= call!48533 call!48530)))

(declare-fun b!1131011 () Bool)

(declare-fun res!755625 () Bool)

(assert (=> b!1131011 (=> (not res!755625) (not e!643643))))

(assert (=> b!1131011 (= res!755625 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24834))))

(declare-fun b!1131012 () Bool)

(assert (=> b!1131012 (= e!643651 true)))

(declare-fun lt!502180 () Bool)

(declare-fun getCurrentListMap!4368 (array!73686 array!73688 (_ BitVec 32) (_ BitVec 32) V!43065 V!43065 (_ BitVec 32) Int) ListLongMap!16055)

(assert (=> b!1131012 (= lt!502180 (contains!6495 (getCurrentListMap!4368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(assert (= (and start!98216 res!755620) b!1131004))

(assert (= (and b!1131004 res!755618) b!1131007))

(assert (= (and b!1131007 res!755616) b!1130993))

(assert (= (and b!1130993 res!755615) b!1131011))

(assert (= (and b!1131011 res!755625) b!1130998))

(assert (= (and b!1130998 res!755627) b!1130996))

(assert (= (and b!1130996 res!755629) b!1131003))

(assert (= (and b!1131003 res!755617) b!1131008))

(assert (= (and b!1131008 res!755628) b!1131002))

(assert (= (and b!1131002 res!755619) b!1130994))

(assert (= (and b!1130994 (not res!755626)) b!1131000))

(assert (= (and b!1131000 (not res!755623)) b!1130991))

(assert (= (and b!1130991 c!110099) b!1131006))

(assert (= (and b!1130991 (not c!110099)) b!1130992))

(assert (= (or b!1131006 b!1130992) bm!48527))

(assert (= (or b!1131006 b!1130992) bm!48526))

(assert (= (and b!1130991 (not res!755622)) b!1130999))

(assert (= (and b!1130999 (not res!755624)) b!1130987))

(assert (= (and b!1130987 c!110097) b!1131010))

(assert (= (and b!1130987 (not c!110097)) b!1131005))

(assert (= (and b!1131005 c!110098) b!1130988))

(assert (= (and b!1131005 (not c!110098)) b!1130990))

(assert (= (and b!1130990 c!110100) b!1130995))

(assert (= (and b!1130990 (not c!110100)) b!1131009))

(assert (= (or b!1130988 b!1130995) bm!48525))

(assert (= (or b!1130988 b!1130995) bm!48530))

(assert (= (or b!1130988 b!1130995) bm!48523))

(assert (= (or b!1131010 bm!48523) bm!48529))

(assert (= (or b!1131010 bm!48525) bm!48528))

(assert (= (or b!1131010 bm!48530) bm!48524))

(assert (= (and b!1130987 (not res!755621)) b!1131012))

(assert (= (and b!1130997 condMapEmpty!44497) mapIsEmpty!44497))

(assert (= (and b!1130997 (not condMapEmpty!44497)) mapNonEmpty!44497))

(get-info :version)

(assert (= (and mapNonEmpty!44497 ((_ is ValueCellFull!13517) mapValue!44497)) b!1130989))

(assert (= (and b!1130997 ((_ is ValueCellFull!13517) mapDefault!44497)) b!1131001))

(assert (= start!98216 b!1130997))

(declare-fun b_lambda!18875 () Bool)

(assert (=> (not b_lambda!18875) (not b!1131000)))

(declare-fun t!35741 () Bool)

(declare-fun tb!8727 () Bool)

(assert (=> (and start!98216 (= defaultEntry!1004 defaultEntry!1004) t!35741) tb!8727))

(declare-fun result!18023 () Bool)

(assert (=> tb!8727 (= result!18023 tp_is_empty!28453)))

(assert (=> b!1131000 t!35741))

(declare-fun b_and!38609 () Bool)

(assert (= b_and!38607 (and (=> t!35741 result!18023) b_and!38609)))

(declare-fun m!1043489 () Bool)

(assert (=> bm!48526 m!1043489))

(declare-fun m!1043491 () Bool)

(assert (=> b!1131004 m!1043491))

(declare-fun m!1043493 () Bool)

(assert (=> b!1131012 m!1043493))

(assert (=> b!1131012 m!1043493))

(declare-fun m!1043495 () Bool)

(assert (=> b!1131012 m!1043495))

(declare-fun m!1043497 () Bool)

(assert (=> b!1131006 m!1043497))

(declare-fun m!1043499 () Bool)

(assert (=> b!1130996 m!1043499))

(declare-fun m!1043501 () Bool)

(assert (=> b!1130999 m!1043501))

(assert (=> b!1130999 m!1043489))

(declare-fun m!1043503 () Bool)

(assert (=> b!1131002 m!1043503))

(declare-fun m!1043505 () Bool)

(assert (=> b!1130993 m!1043505))

(declare-fun m!1043507 () Bool)

(assert (=> mapNonEmpty!44497 m!1043507))

(declare-fun m!1043509 () Bool)

(assert (=> b!1131010 m!1043509))

(declare-fun m!1043511 () Bool)

(assert (=> b!1131010 m!1043511))

(assert (=> b!1131010 m!1043511))

(declare-fun m!1043513 () Bool)

(assert (=> b!1131010 m!1043513))

(declare-fun m!1043515 () Bool)

(assert (=> bm!48527 m!1043515))

(declare-fun m!1043517 () Bool)

(assert (=> b!1131003 m!1043517))

(declare-fun m!1043519 () Bool)

(assert (=> b!1131000 m!1043519))

(declare-fun m!1043521 () Bool)

(assert (=> b!1131000 m!1043521))

(declare-fun m!1043523 () Bool)

(assert (=> b!1131000 m!1043523))

(declare-fun m!1043525 () Bool)

(assert (=> b!1131000 m!1043525))

(declare-fun m!1043527 () Bool)

(assert (=> start!98216 m!1043527))

(declare-fun m!1043529 () Bool)

(assert (=> start!98216 m!1043529))

(declare-fun m!1043531 () Bool)

(assert (=> b!1130994 m!1043531))

(declare-fun m!1043533 () Bool)

(assert (=> b!1130994 m!1043533))

(declare-fun m!1043535 () Bool)

(assert (=> bm!48524 m!1043535))

(declare-fun m!1043537 () Bool)

(assert (=> b!1131011 m!1043537))

(declare-fun m!1043539 () Bool)

(assert (=> bm!48529 m!1043539))

(declare-fun m!1043541 () Bool)

(assert (=> b!1130991 m!1043541))

(declare-fun m!1043543 () Bool)

(assert (=> b!1130991 m!1043543))

(declare-fun m!1043545 () Bool)

(assert (=> bm!48528 m!1043545))

(declare-fun m!1043547 () Bool)

(assert (=> b!1131008 m!1043547))

(declare-fun m!1043549 () Bool)

(assert (=> b!1131008 m!1043549))

(check-sat (not b!1130991) (not b!1131004) (not start!98216) (not b!1131008) (not b!1131000) (not bm!48524) (not b!1131010) (not bm!48526) (not bm!48528) (not b!1131011) (not b!1130993) (not mapNonEmpty!44497) tp_is_empty!28453 b_and!38609 (not b_lambda!18875) (not b!1131006) (not bm!48527) (not b!1131012) (not b_next!23923) (not b!1130996) (not b!1130994) (not b!1131002) (not bm!48529) (not b!1130999))
(check-sat b_and!38609 (not b_next!23923))
