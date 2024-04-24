; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99400 () Bool)

(assert start!99400)

(declare-fun b_free!24769 () Bool)

(declare-fun b_next!24769 () Bool)

(assert (=> start!99400 (= b_free!24769 (not b_next!24769))))

(declare-fun tp!87017 () Bool)

(declare-fun b_and!40389 () Bool)

(assert (=> start!99400 (= tp!87017 b_and!40389)))

(declare-fun b!1168414 () Bool)

(declare-fun res!774733 () Bool)

(declare-fun e!664219 () Bool)

(assert (=> b!1168414 (=> (not res!774733) (not e!664219))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75475 0))(
  ( (array!75476 (arr!36382 (Array (_ BitVec 32) (_ BitVec 64))) (size!36919 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75475)

(assert (=> b!1168414 (= res!774733 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36919 _keys!1208))))))

(declare-fun mapIsEmpty!45773 () Bool)

(declare-fun mapRes!45773 () Bool)

(assert (=> mapIsEmpty!45773 mapRes!45773))

(declare-fun b!1168415 () Bool)

(declare-fun res!774735 () Bool)

(assert (=> b!1168415 (=> (not res!774735) (not e!664219))))

(declare-datatypes ((List!25535 0))(
  ( (Nil!25532) (Cons!25531 (h!26749 (_ BitVec 64)) (t!37288 List!25535)) )
))
(declare-fun arrayNoDuplicates!0 (array!75475 (_ BitVec 32) List!25535) Bool)

(assert (=> b!1168415 (= res!774735 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25532))))

(declare-fun b!1168416 () Bool)

(declare-fun e!664220 () Bool)

(declare-fun tp_is_empty!29299 () Bool)

(assert (=> b!1168416 (= e!664220 tp_is_empty!29299)))

(declare-fun res!774725 () Bool)

(assert (=> start!99400 (=> (not res!774725) (not e!664219))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99400 (= res!774725 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36919 _keys!1208))))))

(assert (=> start!99400 e!664219))

(assert (=> start!99400 tp_is_empty!29299))

(declare-fun array_inv!27892 (array!75475) Bool)

(assert (=> start!99400 (array_inv!27892 _keys!1208)))

(assert (=> start!99400 true))

(assert (=> start!99400 tp!87017))

(declare-datatypes ((V!44193 0))(
  ( (V!44194 (val!14706 Int)) )
))
(declare-datatypes ((ValueCell!13940 0))(
  ( (ValueCellFull!13940 (v!17339 V!44193)) (EmptyCell!13940) )
))
(declare-datatypes ((array!75477 0))(
  ( (array!75478 (arr!36383 (Array (_ BitVec 32) ValueCell!13940)) (size!36920 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75477)

(declare-fun e!664223 () Bool)

(declare-fun array_inv!27893 (array!75477) Bool)

(assert (=> start!99400 (and (array_inv!27893 _values!996) e!664223)))

(declare-fun mapNonEmpty!45773 () Bool)

(declare-fun tp!87018 () Bool)

(declare-fun e!664222 () Bool)

(assert (=> mapNonEmpty!45773 (= mapRes!45773 (and tp!87018 e!664222))))

(declare-fun mapKey!45773 () (_ BitVec 32))

(declare-fun mapRest!45773 () (Array (_ BitVec 32) ValueCell!13940))

(declare-fun mapValue!45773 () ValueCell!13940)

(assert (=> mapNonEmpty!45773 (= (arr!36383 _values!996) (store mapRest!45773 mapKey!45773 mapValue!45773))))

(declare-fun b!1168417 () Bool)

(declare-fun res!774728 () Bool)

(declare-fun e!664221 () Bool)

(assert (=> b!1168417 (=> (not res!774728) (not e!664221))))

(declare-fun lt!526000 () array!75475)

(assert (=> b!1168417 (= res!774728 (arrayNoDuplicates!0 lt!526000 #b00000000000000000000000000000000 Nil!25532))))

(declare-fun b!1168418 () Bool)

(assert (=> b!1168418 (= e!664222 tp_is_empty!29299)))

(declare-fun b!1168419 () Bool)

(declare-fun e!664225 () Bool)

(assert (=> b!1168419 (= e!664221 (not e!664225))))

(declare-fun res!774729 () Bool)

(assert (=> b!1168419 (=> res!774729 e!664225)))

(assert (=> b!1168419 (= res!774729 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168419 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38499 0))(
  ( (Unit!38500) )
))
(declare-fun lt!526002 () Unit!38499)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75475 (_ BitVec 64) (_ BitVec 32)) Unit!38499)

(assert (=> b!1168419 (= lt!526002 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168420 () Bool)

(assert (=> b!1168420 (= e!664223 (and e!664220 mapRes!45773))))

(declare-fun condMapEmpty!45773 () Bool)

(declare-fun mapDefault!45773 () ValueCell!13940)

(assert (=> b!1168420 (= condMapEmpty!45773 (= (arr!36383 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13940)) mapDefault!45773)))))

(declare-fun b!1168421 () Bool)

(declare-fun res!774734 () Bool)

(assert (=> b!1168421 (=> (not res!774734) (not e!664219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168421 (= res!774734 (validKeyInArray!0 k0!934))))

(declare-fun b!1168422 () Bool)

(declare-fun e!664218 () Bool)

(assert (=> b!1168422 (= e!664225 e!664218)))

(declare-fun res!774732 () Bool)

(assert (=> b!1168422 (=> res!774732 e!664218)))

(assert (=> b!1168422 (= res!774732 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44193)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18794 0))(
  ( (tuple2!18795 (_1!9408 (_ BitVec 64)) (_2!9408 V!44193)) )
))
(declare-datatypes ((List!25536 0))(
  ( (Nil!25533) (Cons!25532 (h!26750 tuple2!18794) (t!37289 List!25536)) )
))
(declare-datatypes ((ListLongMap!16771 0))(
  ( (ListLongMap!16772 (toList!8401 List!25536)) )
))
(declare-fun lt!525999 () ListLongMap!16771)

(declare-fun lt!526003 () array!75477)

(declare-fun minValue!944 () V!44193)

(declare-fun getCurrentListMapNoExtraKeys!4892 (array!75475 array!75477 (_ BitVec 32) (_ BitVec 32) V!44193 V!44193 (_ BitVec 32) Int) ListLongMap!16771)

(assert (=> b!1168422 (= lt!525999 (getCurrentListMapNoExtraKeys!4892 lt!526000 lt!526003 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2880 (Int (_ BitVec 64)) V!44193)

(assert (=> b!1168422 (= lt!526003 (array!75478 (store (arr!36383 _values!996) i!673 (ValueCellFull!13940 (dynLambda!2880 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36920 _values!996)))))

(declare-fun lt!526001 () ListLongMap!16771)

(assert (=> b!1168422 (= lt!526001 (getCurrentListMapNoExtraKeys!4892 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168423 () Bool)

(declare-fun res!774730 () Bool)

(assert (=> b!1168423 (=> (not res!774730) (not e!664219))))

(assert (=> b!1168423 (= res!774730 (and (= (size!36920 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36919 _keys!1208) (size!36920 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168424 () Bool)

(declare-fun res!774724 () Bool)

(assert (=> b!1168424 (=> (not res!774724) (not e!664219))))

(assert (=> b!1168424 (= res!774724 (= (select (arr!36382 _keys!1208) i!673) k0!934))))

(declare-fun b!1168425 () Bool)

(declare-fun res!774727 () Bool)

(assert (=> b!1168425 (=> (not res!774727) (not e!664219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168425 (= res!774727 (validMask!0 mask!1564))))

(declare-fun b!1168426 () Bool)

(assert (=> b!1168426 (= e!664218 true)))

(declare-fun -!1464 (ListLongMap!16771 (_ BitVec 64)) ListLongMap!16771)

(assert (=> b!1168426 (= (getCurrentListMapNoExtraKeys!4892 lt!526000 lt!526003 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1464 (getCurrentListMapNoExtraKeys!4892 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525998 () Unit!38499)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!689 (array!75475 array!75477 (_ BitVec 32) (_ BitVec 32) V!44193 V!44193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38499)

(assert (=> b!1168426 (= lt!525998 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!689 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168427 () Bool)

(declare-fun res!774726 () Bool)

(assert (=> b!1168427 (=> (not res!774726) (not e!664219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75475 (_ BitVec 32)) Bool)

(assert (=> b!1168427 (= res!774726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168428 () Bool)

(assert (=> b!1168428 (= e!664219 e!664221)))

(declare-fun res!774731 () Bool)

(assert (=> b!1168428 (=> (not res!774731) (not e!664221))))

(assert (=> b!1168428 (= res!774731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526000 mask!1564))))

(assert (=> b!1168428 (= lt!526000 (array!75476 (store (arr!36382 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36919 _keys!1208)))))

(assert (= (and start!99400 res!774725) b!1168425))

(assert (= (and b!1168425 res!774727) b!1168423))

(assert (= (and b!1168423 res!774730) b!1168427))

(assert (= (and b!1168427 res!774726) b!1168415))

(assert (= (and b!1168415 res!774735) b!1168414))

(assert (= (and b!1168414 res!774733) b!1168421))

(assert (= (and b!1168421 res!774734) b!1168424))

(assert (= (and b!1168424 res!774724) b!1168428))

(assert (= (and b!1168428 res!774731) b!1168417))

(assert (= (and b!1168417 res!774728) b!1168419))

(assert (= (and b!1168419 (not res!774729)) b!1168422))

(assert (= (and b!1168422 (not res!774732)) b!1168426))

(assert (= (and b!1168420 condMapEmpty!45773) mapIsEmpty!45773))

(assert (= (and b!1168420 (not condMapEmpty!45773)) mapNonEmpty!45773))

(get-info :version)

(assert (= (and mapNonEmpty!45773 ((_ is ValueCellFull!13940) mapValue!45773)) b!1168418))

(assert (= (and b!1168420 ((_ is ValueCellFull!13940) mapDefault!45773)) b!1168416))

(assert (= start!99400 b!1168420))

(declare-fun b_lambda!19869 () Bool)

(assert (=> (not b_lambda!19869) (not b!1168422)))

(declare-fun t!37287 () Bool)

(declare-fun tb!9573 () Bool)

(assert (=> (and start!99400 (= defaultEntry!1004 defaultEntry!1004) t!37287) tb!9573))

(declare-fun result!19719 () Bool)

(assert (=> tb!9573 (= result!19719 tp_is_empty!29299)))

(assert (=> b!1168422 t!37287))

(declare-fun b_and!40391 () Bool)

(assert (= b_and!40389 (and (=> t!37287 result!19719) b_and!40391)))

(declare-fun m!1076663 () Bool)

(assert (=> start!99400 m!1076663))

(declare-fun m!1076665 () Bool)

(assert (=> start!99400 m!1076665))

(declare-fun m!1076667 () Bool)

(assert (=> b!1168428 m!1076667))

(declare-fun m!1076669 () Bool)

(assert (=> b!1168428 m!1076669))

(declare-fun m!1076671 () Bool)

(assert (=> b!1168425 m!1076671))

(declare-fun m!1076673 () Bool)

(assert (=> b!1168421 m!1076673))

(declare-fun m!1076675 () Bool)

(assert (=> b!1168419 m!1076675))

(declare-fun m!1076677 () Bool)

(assert (=> b!1168419 m!1076677))

(declare-fun m!1076679 () Bool)

(assert (=> b!1168426 m!1076679))

(declare-fun m!1076681 () Bool)

(assert (=> b!1168426 m!1076681))

(assert (=> b!1168426 m!1076681))

(declare-fun m!1076683 () Bool)

(assert (=> b!1168426 m!1076683))

(declare-fun m!1076685 () Bool)

(assert (=> b!1168426 m!1076685))

(declare-fun m!1076687 () Bool)

(assert (=> b!1168424 m!1076687))

(declare-fun m!1076689 () Bool)

(assert (=> b!1168415 m!1076689))

(declare-fun m!1076691 () Bool)

(assert (=> b!1168427 m!1076691))

(declare-fun m!1076693 () Bool)

(assert (=> mapNonEmpty!45773 m!1076693))

(declare-fun m!1076695 () Bool)

(assert (=> b!1168417 m!1076695))

(declare-fun m!1076697 () Bool)

(assert (=> b!1168422 m!1076697))

(declare-fun m!1076699 () Bool)

(assert (=> b!1168422 m!1076699))

(declare-fun m!1076701 () Bool)

(assert (=> b!1168422 m!1076701))

(declare-fun m!1076703 () Bool)

(assert (=> b!1168422 m!1076703))

(check-sat (not b!1168425) (not b!1168415) (not b!1168419) (not b_lambda!19869) (not mapNonEmpty!45773) (not b!1168428) (not start!99400) (not b!1168421) (not b!1168422) (not b!1168417) b_and!40391 (not b!1168426) (not b_next!24769) tp_is_empty!29299 (not b!1168427))
(check-sat b_and!40391 (not b_next!24769))
