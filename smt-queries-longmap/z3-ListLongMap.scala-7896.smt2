; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98114 () Bool)

(assert start!98114)

(declare-fun b_free!23821 () Bool)

(declare-fun b_next!23821 () Bool)

(assert (=> start!98114 (= b_free!23821 (not b_next!23821))))

(declare-fun tp!84166 () Bool)

(declare-fun b_and!38403 () Bool)

(assert (=> start!98114 (= tp!84166 b_and!38403)))

(declare-fun b!1127458 () Bool)

(declare-fun res!753460 () Bool)

(declare-fun e!641705 () Bool)

(assert (=> b!1127458 (=> (not res!753460) (not e!641705))))

(declare-datatypes ((array!73488 0))(
  ( (array!73489 (arr!35397 (Array (_ BitVec 32) (_ BitVec 64))) (size!35935 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73488)

(declare-datatypes ((List!24753 0))(
  ( (Nil!24750) (Cons!24749 (h!25958 (_ BitVec 64)) (t!35557 List!24753)) )
))
(declare-fun arrayNoDuplicates!0 (array!73488 (_ BitVec 32) List!24753) Bool)

(assert (=> b!1127458 (= res!753460 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24750))))

(declare-fun b!1127459 () Bool)

(declare-fun res!753463 () Bool)

(assert (=> b!1127459 (=> (not res!753463) (not e!641705))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73488 (_ BitVec 32)) Bool)

(assert (=> b!1127459 (= res!753463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127460 () Bool)

(declare-fun res!753454 () Bool)

(declare-fun e!641703 () Bool)

(assert (=> b!1127460 (=> (not res!753454) (not e!641703))))

(declare-fun lt!500442 () array!73488)

(assert (=> b!1127460 (= res!753454 (arrayNoDuplicates!0 lt!500442 #b00000000000000000000000000000000 Nil!24750))))

(declare-fun res!753458 () Bool)

(assert (=> start!98114 (=> (not res!753458) (not e!641705))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98114 (= res!753458 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35935 _keys!1208))))))

(assert (=> start!98114 e!641705))

(declare-fun tp_is_empty!28351 () Bool)

(assert (=> start!98114 tp_is_empty!28351))

(declare-fun array_inv!27242 (array!73488) Bool)

(assert (=> start!98114 (array_inv!27242 _keys!1208)))

(assert (=> start!98114 true))

(assert (=> start!98114 tp!84166))

(declare-datatypes ((V!42929 0))(
  ( (V!42930 (val!14232 Int)) )
))
(declare-datatypes ((ValueCell!13466 0))(
  ( (ValueCellFull!13466 (v!16864 V!42929)) (EmptyCell!13466) )
))
(declare-datatypes ((array!73490 0))(
  ( (array!73491 (arr!35398 (Array (_ BitVec 32) ValueCell!13466)) (size!35936 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73490)

(declare-fun e!641699 () Bool)

(declare-fun array_inv!27243 (array!73490) Bool)

(assert (=> start!98114 (and (array_inv!27243 _values!996) e!641699)))

(declare-fun b!1127461 () Bool)

(declare-fun res!753455 () Bool)

(assert (=> b!1127461 (=> (not res!753455) (not e!641705))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1127461 (= res!753455 (= (select (arr!35397 _keys!1208) i!673) k0!934))))

(declare-fun b!1127462 () Bool)

(declare-fun res!753453 () Bool)

(assert (=> b!1127462 (=> (not res!753453) (not e!641705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127462 (= res!753453 (validMask!0 mask!1564))))

(declare-fun b!1127463 () Bool)

(declare-fun e!641701 () Bool)

(assert (=> b!1127463 (= e!641701 true)))

(declare-fun zeroValue!944 () V!42929)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!500448 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42929)

(declare-datatypes ((tuple2!17998 0))(
  ( (tuple2!17999 (_1!9010 (_ BitVec 64)) (_2!9010 V!42929)) )
))
(declare-datatypes ((List!24754 0))(
  ( (Nil!24751) (Cons!24750 (h!25959 tuple2!17998) (t!35558 List!24754)) )
))
(declare-datatypes ((ListLongMap!15967 0))(
  ( (ListLongMap!15968 (toList!7999 List!24754)) )
))
(declare-fun contains!6456 (ListLongMap!15967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4499 (array!73488 array!73490 (_ BitVec 32) (_ BitVec 32) V!42929 V!42929 (_ BitVec 32) Int) ListLongMap!15967)

(assert (=> b!1127463 (= lt!500448 (contains!6456 (getCurrentListMapNoExtraKeys!4499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127464 () Bool)

(declare-fun res!753456 () Bool)

(assert (=> b!1127464 (=> (not res!753456) (not e!641705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127464 (= res!753456 (validKeyInArray!0 k0!934))))

(declare-fun b!1127465 () Bool)

(declare-fun e!641697 () Bool)

(assert (=> b!1127465 (= e!641703 (not e!641697))))

(declare-fun res!753459 () Bool)

(assert (=> b!1127465 (=> res!753459 e!641697)))

(assert (=> b!1127465 (= res!753459 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127465 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36795 0))(
  ( (Unit!36796) )
))
(declare-fun lt!500444 () Unit!36795)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73488 (_ BitVec 64) (_ BitVec 32)) Unit!36795)

(assert (=> b!1127465 (= lt!500444 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!47719 () Bool)

(declare-fun call!47723 () ListLongMap!15967)

(assert (=> bm!47719 (= call!47723 (getCurrentListMapNoExtraKeys!4499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47722 () ListLongMap!15967)

(declare-fun b!1127466 () Bool)

(declare-fun e!641700 () Bool)

(declare-fun -!1122 (ListLongMap!15967 (_ BitVec 64)) ListLongMap!15967)

(assert (=> b!1127466 (= e!641700 (= call!47722 (-!1122 call!47723 k0!934)))))

(declare-fun b!1127467 () Bool)

(declare-fun e!641706 () Bool)

(declare-fun mapRes!44344 () Bool)

(assert (=> b!1127467 (= e!641699 (and e!641706 mapRes!44344))))

(declare-fun condMapEmpty!44344 () Bool)

(declare-fun mapDefault!44344 () ValueCell!13466)

(assert (=> b!1127467 (= condMapEmpty!44344 (= (arr!35398 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13466)) mapDefault!44344)))))

(declare-fun b!1127468 () Bool)

(assert (=> b!1127468 (= e!641706 tp_is_empty!28351)))

(declare-fun b!1127469 () Bool)

(declare-fun e!641702 () Bool)

(assert (=> b!1127469 (= e!641702 tp_is_empty!28351)))

(declare-fun b!1127470 () Bool)

(declare-fun e!641698 () Bool)

(assert (=> b!1127470 (= e!641697 e!641698)))

(declare-fun res!753451 () Bool)

(assert (=> b!1127470 (=> res!753451 e!641698)))

(assert (=> b!1127470 (= res!753451 (not (= from!1455 i!673)))))

(declare-fun lt!500443 () ListLongMap!15967)

(declare-fun lt!500446 () array!73490)

(assert (=> b!1127470 (= lt!500443 (getCurrentListMapNoExtraKeys!4499 lt!500442 lt!500446 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2511 (Int (_ BitVec 64)) V!42929)

(assert (=> b!1127470 (= lt!500446 (array!73491 (store (arr!35398 _values!996) i!673 (ValueCellFull!13466 (dynLambda!2511 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35936 _values!996)))))

(declare-fun lt!500445 () ListLongMap!15967)

(assert (=> b!1127470 (= lt!500445 (getCurrentListMapNoExtraKeys!4499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44344 () Bool)

(declare-fun tp!84167 () Bool)

(assert (=> mapNonEmpty!44344 (= mapRes!44344 (and tp!84167 e!641702))))

(declare-fun mapRest!44344 () (Array (_ BitVec 32) ValueCell!13466))

(declare-fun mapValue!44344 () ValueCell!13466)

(declare-fun mapKey!44344 () (_ BitVec 32))

(assert (=> mapNonEmpty!44344 (= (arr!35398 _values!996) (store mapRest!44344 mapKey!44344 mapValue!44344))))

(declare-fun mapIsEmpty!44344 () Bool)

(assert (=> mapIsEmpty!44344 mapRes!44344))

(declare-fun b!1127471 () Bool)

(declare-fun res!753452 () Bool)

(assert (=> b!1127471 (=> (not res!753452) (not e!641705))))

(assert (=> b!1127471 (= res!753452 (and (= (size!35936 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35935 _keys!1208) (size!35936 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127472 () Bool)

(declare-fun res!753457 () Bool)

(assert (=> b!1127472 (=> (not res!753457) (not e!641705))))

(assert (=> b!1127472 (= res!753457 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35935 _keys!1208))))))

(declare-fun b!1127473 () Bool)

(assert (=> b!1127473 (= e!641700 (= call!47722 call!47723))))

(declare-fun b!1127474 () Bool)

(assert (=> b!1127474 (= e!641698 e!641701)))

(declare-fun res!753462 () Bool)

(assert (=> b!1127474 (=> res!753462 e!641701)))

(assert (=> b!1127474 (= res!753462 (not (= (select (arr!35397 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127474 e!641700))

(declare-fun c!109695 () Bool)

(assert (=> b!1127474 (= c!109695 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500447 () Unit!36795)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!402 (array!73488 array!73490 (_ BitVec 32) (_ BitVec 32) V!42929 V!42929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36795)

(assert (=> b!1127474 (= lt!500447 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47720 () Bool)

(assert (=> bm!47720 (= call!47722 (getCurrentListMapNoExtraKeys!4499 lt!500442 lt!500446 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127475 () Bool)

(assert (=> b!1127475 (= e!641705 e!641703)))

(declare-fun res!753461 () Bool)

(assert (=> b!1127475 (=> (not res!753461) (not e!641703))))

(assert (=> b!1127475 (= res!753461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500442 mask!1564))))

(assert (=> b!1127475 (= lt!500442 (array!73489 (store (arr!35397 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35935 _keys!1208)))))

(assert (= (and start!98114 res!753458) b!1127462))

(assert (= (and b!1127462 res!753453) b!1127471))

(assert (= (and b!1127471 res!753452) b!1127459))

(assert (= (and b!1127459 res!753463) b!1127458))

(assert (= (and b!1127458 res!753460) b!1127472))

(assert (= (and b!1127472 res!753457) b!1127464))

(assert (= (and b!1127464 res!753456) b!1127461))

(assert (= (and b!1127461 res!753455) b!1127475))

(assert (= (and b!1127475 res!753461) b!1127460))

(assert (= (and b!1127460 res!753454) b!1127465))

(assert (= (and b!1127465 (not res!753459)) b!1127470))

(assert (= (and b!1127470 (not res!753451)) b!1127474))

(assert (= (and b!1127474 c!109695) b!1127466))

(assert (= (and b!1127474 (not c!109695)) b!1127473))

(assert (= (or b!1127466 b!1127473) bm!47720))

(assert (= (or b!1127466 b!1127473) bm!47719))

(assert (= (and b!1127474 (not res!753462)) b!1127463))

(assert (= (and b!1127467 condMapEmpty!44344) mapIsEmpty!44344))

(assert (= (and b!1127467 (not condMapEmpty!44344)) mapNonEmpty!44344))

(get-info :version)

(assert (= (and mapNonEmpty!44344 ((_ is ValueCellFull!13466) mapValue!44344)) b!1127469))

(assert (= (and b!1127467 ((_ is ValueCellFull!13466) mapDefault!44344)) b!1127468))

(assert (= start!98114 b!1127467))

(declare-fun b_lambda!18773 () Bool)

(assert (=> (not b_lambda!18773) (not b!1127470)))

(declare-fun t!35556 () Bool)

(declare-fun tb!8625 () Bool)

(assert (=> (and start!98114 (= defaultEntry!1004 defaultEntry!1004) t!35556) tb!8625))

(declare-fun result!17819 () Bool)

(assert (=> tb!8625 (= result!17819 tp_is_empty!28351)))

(assert (=> b!1127470 t!35556))

(declare-fun b_and!38405 () Bool)

(assert (= b_and!38403 (and (=> t!35556 result!17819) b_and!38405)))

(declare-fun m!1040709 () Bool)

(assert (=> b!1127474 m!1040709))

(declare-fun m!1040711 () Bool)

(assert (=> b!1127474 m!1040711))

(declare-fun m!1040713 () Bool)

(assert (=> mapNonEmpty!44344 m!1040713))

(declare-fun m!1040715 () Bool)

(assert (=> bm!47720 m!1040715))

(declare-fun m!1040717 () Bool)

(assert (=> b!1127466 m!1040717))

(declare-fun m!1040719 () Bool)

(assert (=> b!1127470 m!1040719))

(declare-fun m!1040721 () Bool)

(assert (=> b!1127470 m!1040721))

(declare-fun m!1040723 () Bool)

(assert (=> b!1127470 m!1040723))

(declare-fun m!1040725 () Bool)

(assert (=> b!1127470 m!1040725))

(declare-fun m!1040727 () Bool)

(assert (=> b!1127462 m!1040727))

(declare-fun m!1040729 () Bool)

(assert (=> b!1127461 m!1040729))

(declare-fun m!1040731 () Bool)

(assert (=> start!98114 m!1040731))

(declare-fun m!1040733 () Bool)

(assert (=> start!98114 m!1040733))

(declare-fun m!1040735 () Bool)

(assert (=> b!1127460 m!1040735))

(declare-fun m!1040737 () Bool)

(assert (=> b!1127475 m!1040737))

(declare-fun m!1040739 () Bool)

(assert (=> b!1127475 m!1040739))

(declare-fun m!1040741 () Bool)

(assert (=> bm!47719 m!1040741))

(declare-fun m!1040743 () Bool)

(assert (=> b!1127458 m!1040743))

(declare-fun m!1040745 () Bool)

(assert (=> b!1127465 m!1040745))

(declare-fun m!1040747 () Bool)

(assert (=> b!1127465 m!1040747))

(assert (=> b!1127463 m!1040741))

(assert (=> b!1127463 m!1040741))

(declare-fun m!1040749 () Bool)

(assert (=> b!1127463 m!1040749))

(declare-fun m!1040751 () Bool)

(assert (=> b!1127459 m!1040751))

(declare-fun m!1040753 () Bool)

(assert (=> b!1127464 m!1040753))

(check-sat (not b_next!23821) (not start!98114) (not b!1127464) (not b!1127475) (not b!1127465) (not b_lambda!18773) (not mapNonEmpty!44344) (not b!1127458) (not bm!47720) (not b!1127462) (not b!1127470) tp_is_empty!28351 (not b!1127463) (not bm!47719) (not b!1127460) (not b!1127474) (not b!1127459) (not b!1127466) b_and!38405)
(check-sat b_and!38405 (not b_next!23821))
