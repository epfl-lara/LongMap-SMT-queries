; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99882 () Bool)

(assert start!99882)

(declare-fun b_free!25225 () Bool)

(declare-fun b_next!25225 () Bool)

(assert (=> start!99882 (= b_free!25225 (not b_next!25225))))

(declare-fun tp!88388 () Bool)

(declare-fun b_and!41319 () Bool)

(assert (=> start!99882 (= tp!88388 b_and!41319)))

(declare-fun b!1182518 () Bool)

(declare-fun res!785450 () Bool)

(declare-fun e!672403 () Bool)

(assert (=> b!1182518 (=> (not res!785450) (not e!672403))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182518 (= res!785450 (validMask!0 mask!1564))))

(declare-fun b!1182519 () Bool)

(declare-fun e!672396 () Bool)

(declare-fun e!672401 () Bool)

(assert (=> b!1182519 (= e!672396 e!672401)))

(declare-fun res!785442 () Bool)

(assert (=> b!1182519 (=> res!785442 e!672401)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182519 (= res!785442 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44801 0))(
  ( (V!44802 (val!14934 Int)) )
))
(declare-fun zeroValue!944 () V!44801)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19176 0))(
  ( (tuple2!19177 (_1!9599 (_ BitVec 64)) (_2!9599 V!44801)) )
))
(declare-datatypes ((List!25905 0))(
  ( (Nil!25902) (Cons!25901 (h!27119 tuple2!19176) (t!38114 List!25905)) )
))
(declare-datatypes ((ListLongMap!17153 0))(
  ( (ListLongMap!17154 (toList!8592 List!25905)) )
))
(declare-fun lt!534726 () ListLongMap!17153)

(declare-datatypes ((array!76361 0))(
  ( (array!76362 (arr!36824 (Array (_ BitVec 32) (_ BitVec 64))) (size!37361 (_ BitVec 32))) )
))
(declare-fun lt!534719 () array!76361)

(declare-fun minValue!944 () V!44801)

(declare-datatypes ((ValueCell!14168 0))(
  ( (ValueCellFull!14168 (v!17568 V!44801)) (EmptyCell!14168) )
))
(declare-datatypes ((array!76363 0))(
  ( (array!76364 (arr!36825 (Array (_ BitVec 32) ValueCell!14168)) (size!37362 (_ BitVec 32))) )
))
(declare-fun lt!534718 () array!76363)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5067 (array!76361 array!76363 (_ BitVec 32) (_ BitVec 32) V!44801 V!44801 (_ BitVec 32) Int) ListLongMap!17153)

(assert (=> b!1182519 (= lt!534726 (getCurrentListMapNoExtraKeys!5067 lt!534719 lt!534718 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534727 () V!44801)

(declare-fun _values!996 () array!76363)

(assert (=> b!1182519 (= lt!534718 (array!76364 (store (arr!36825 _values!996) i!673 (ValueCellFull!14168 lt!534727)) (size!37362 _values!996)))))

(declare-fun dynLambda!3033 (Int (_ BitVec 64)) V!44801)

(assert (=> b!1182519 (= lt!534727 (dynLambda!3033 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76361)

(declare-fun lt!534722 () ListLongMap!17153)

(assert (=> b!1182519 (= lt!534722 (getCurrentListMapNoExtraKeys!5067 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182520 () Bool)

(declare-datatypes ((Unit!39055 0))(
  ( (Unit!39056) )
))
(declare-fun e!672398 () Unit!39055)

(declare-fun Unit!39057 () Unit!39055)

(assert (=> b!1182520 (= e!672398 Unit!39057)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!534717 () Unit!39055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39055)

(assert (=> b!1182520 (= lt!534717 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182520 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534723 () Unit!39055)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76361 (_ BitVec 32) (_ BitVec 32)) Unit!39055)

(assert (=> b!1182520 (= lt!534723 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25906 0))(
  ( (Nil!25903) (Cons!25902 (h!27120 (_ BitVec 64)) (t!38115 List!25906)) )
))
(declare-fun arrayNoDuplicates!0 (array!76361 (_ BitVec 32) List!25906) Bool)

(assert (=> b!1182520 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25903)))

(declare-fun lt!534721 () Unit!39055)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76361 (_ BitVec 64) (_ BitVec 32) List!25906) Unit!39055)

(assert (=> b!1182520 (= lt!534721 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25903))))

(assert (=> b!1182520 false))

(declare-fun b!1182521 () Bool)

(declare-fun e!672395 () Bool)

(assert (=> b!1182521 (= e!672395 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37361 _keys!1208))))))

(declare-fun e!672402 () Bool)

(assert (=> b!1182521 e!672402))

(declare-fun res!785449 () Bool)

(assert (=> b!1182521 (=> (not res!785449) (not e!672402))))

(assert (=> b!1182521 (= res!785449 (not (= (select (arr!36824 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!534715 () Unit!39055)

(assert (=> b!1182521 (= lt!534715 e!672398)))

(declare-fun c!117359 () Bool)

(assert (=> b!1182521 (= c!117359 (= (select (arr!36824 _keys!1208) from!1455) k0!934))))

(declare-fun e!672397 () Bool)

(assert (=> b!1182521 e!672397))

(declare-fun res!785448 () Bool)

(assert (=> b!1182521 (=> (not res!785448) (not e!672397))))

(declare-fun lt!534714 () tuple2!19176)

(declare-fun lt!534725 () ListLongMap!17153)

(declare-fun +!3915 (ListLongMap!17153 tuple2!19176) ListLongMap!17153)

(assert (=> b!1182521 (= res!785448 (= lt!534726 (+!3915 lt!534725 lt!534714)))))

(declare-fun get!18869 (ValueCell!14168 V!44801) V!44801)

(assert (=> b!1182521 (= lt!534714 (tuple2!19177 (select (arr!36824 _keys!1208) from!1455) (get!18869 (select (arr!36825 _values!996) from!1455) lt!534727)))))

(declare-fun b!1182522 () Bool)

(declare-fun res!785440 () Bool)

(declare-fun e!672400 () Bool)

(assert (=> b!1182522 (=> (not res!785440) (not e!672400))))

(assert (=> b!1182522 (= res!785440 (arrayNoDuplicates!0 lt!534719 #b00000000000000000000000000000000 Nil!25903))))

(declare-fun b!1182523 () Bool)

(declare-fun res!785447 () Bool)

(assert (=> b!1182523 (=> (not res!785447) (not e!672403))))

(assert (=> b!1182523 (= res!785447 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37361 _keys!1208))))))

(declare-fun b!1182524 () Bool)

(declare-fun e!672405 () Bool)

(declare-fun tp_is_empty!29755 () Bool)

(assert (=> b!1182524 (= e!672405 tp_is_empty!29755)))

(declare-fun b!1182525 () Bool)

(declare-fun Unit!39058 () Unit!39055)

(assert (=> b!1182525 (= e!672398 Unit!39058)))

(declare-fun b!1182526 () Bool)

(declare-fun lt!534724 () ListLongMap!17153)

(assert (=> b!1182526 (= e!672402 (= lt!534725 lt!534724))))

(declare-fun b!1182527 () Bool)

(assert (=> b!1182527 (= e!672400 (not e!672396))))

(declare-fun res!785443 () Bool)

(assert (=> b!1182527 (=> res!785443 e!672396)))

(assert (=> b!1182527 (= res!785443 (bvsgt from!1455 i!673))))

(assert (=> b!1182527 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534716 () Unit!39055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76361 (_ BitVec 64) (_ BitVec 32)) Unit!39055)

(assert (=> b!1182527 (= lt!534716 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182528 () Bool)

(declare-fun res!785446 () Bool)

(assert (=> b!1182528 (=> (not res!785446) (not e!672402))))

(declare-fun lt!534720 () ListLongMap!17153)

(assert (=> b!1182528 (= res!785446 (= lt!534722 (+!3915 lt!534720 lt!534714)))))

(declare-fun b!1182529 () Bool)

(declare-fun res!785441 () Bool)

(assert (=> b!1182529 (=> (not res!785441) (not e!672403))))

(assert (=> b!1182529 (= res!785441 (and (= (size!37362 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37361 _keys!1208) (size!37362 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182530 () Bool)

(declare-fun e!672406 () Bool)

(declare-fun mapRes!46460 () Bool)

(assert (=> b!1182530 (= e!672406 (and e!672405 mapRes!46460))))

(declare-fun condMapEmpty!46460 () Bool)

(declare-fun mapDefault!46460 () ValueCell!14168)

(assert (=> b!1182530 (= condMapEmpty!46460 (= (arr!36825 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14168)) mapDefault!46460)))))

(declare-fun b!1182531 () Bool)

(declare-fun res!785452 () Bool)

(assert (=> b!1182531 (=> (not res!785452) (not e!672403))))

(assert (=> b!1182531 (= res!785452 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25903))))

(declare-fun b!1182532 () Bool)

(declare-fun res!785454 () Bool)

(assert (=> b!1182532 (=> (not res!785454) (not e!672403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76361 (_ BitVec 32)) Bool)

(assert (=> b!1182532 (= res!785454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182533 () Bool)

(assert (=> b!1182533 (= e!672403 e!672400)))

(declare-fun res!785445 () Bool)

(assert (=> b!1182533 (=> (not res!785445) (not e!672400))))

(assert (=> b!1182533 (= res!785445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534719 mask!1564))))

(assert (=> b!1182533 (= lt!534719 (array!76362 (store (arr!36824 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37361 _keys!1208)))))

(declare-fun b!1182534 () Bool)

(declare-fun res!785456 () Bool)

(assert (=> b!1182534 (=> (not res!785456) (not e!672403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182534 (= res!785456 (validKeyInArray!0 k0!934))))

(declare-fun b!1182535 () Bool)

(declare-fun e!672404 () Bool)

(assert (=> b!1182535 (= e!672404 tp_is_empty!29755)))

(declare-fun b!1182536 () Bool)

(declare-fun e!672399 () Bool)

(assert (=> b!1182536 (= e!672397 e!672399)))

(declare-fun res!785455 () Bool)

(assert (=> b!1182536 (=> res!785455 e!672399)))

(assert (=> b!1182536 (= res!785455 (not (= (select (arr!36824 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182537 () Bool)

(assert (=> b!1182537 (= e!672399 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46460 () Bool)

(declare-fun tp!88389 () Bool)

(assert (=> mapNonEmpty!46460 (= mapRes!46460 (and tp!88389 e!672404))))

(declare-fun mapKey!46460 () (_ BitVec 32))

(declare-fun mapRest!46460 () (Array (_ BitVec 32) ValueCell!14168))

(declare-fun mapValue!46460 () ValueCell!14168)

(assert (=> mapNonEmpty!46460 (= (arr!36825 _values!996) (store mapRest!46460 mapKey!46460 mapValue!46460))))

(declare-fun b!1182538 () Bool)

(declare-fun res!785444 () Bool)

(assert (=> b!1182538 (=> (not res!785444) (not e!672403))))

(assert (=> b!1182538 (= res!785444 (= (select (arr!36824 _keys!1208) i!673) k0!934))))

(declare-fun res!785453 () Bool)

(assert (=> start!99882 (=> (not res!785453) (not e!672403))))

(assert (=> start!99882 (= res!785453 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37361 _keys!1208))))))

(assert (=> start!99882 e!672403))

(assert (=> start!99882 tp_is_empty!29755))

(declare-fun array_inv!28192 (array!76361) Bool)

(assert (=> start!99882 (array_inv!28192 _keys!1208)))

(assert (=> start!99882 true))

(assert (=> start!99882 tp!88388))

(declare-fun array_inv!28193 (array!76363) Bool)

(assert (=> start!99882 (and (array_inv!28193 _values!996) e!672406)))

(declare-fun b!1182539 () Bool)

(assert (=> b!1182539 (= e!672401 e!672395)))

(declare-fun res!785451 () Bool)

(assert (=> b!1182539 (=> res!785451 e!672395)))

(assert (=> b!1182539 (= res!785451 (not (validKeyInArray!0 (select (arr!36824 _keys!1208) from!1455))))))

(assert (=> b!1182539 (= lt!534724 lt!534725)))

(declare-fun -!1617 (ListLongMap!17153 (_ BitVec 64)) ListLongMap!17153)

(assert (=> b!1182539 (= lt!534725 (-!1617 lt!534720 k0!934))))

(assert (=> b!1182539 (= lt!534724 (getCurrentListMapNoExtraKeys!5067 lt!534719 lt!534718 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182539 (= lt!534720 (getCurrentListMapNoExtraKeys!5067 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534713 () Unit!39055)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!842 (array!76361 array!76363 (_ BitVec 32) (_ BitVec 32) V!44801 V!44801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39055)

(assert (=> b!1182539 (= lt!534713 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!842 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46460 () Bool)

(assert (=> mapIsEmpty!46460 mapRes!46460))

(assert (= (and start!99882 res!785453) b!1182518))

(assert (= (and b!1182518 res!785450) b!1182529))

(assert (= (and b!1182529 res!785441) b!1182532))

(assert (= (and b!1182532 res!785454) b!1182531))

(assert (= (and b!1182531 res!785452) b!1182523))

(assert (= (and b!1182523 res!785447) b!1182534))

(assert (= (and b!1182534 res!785456) b!1182538))

(assert (= (and b!1182538 res!785444) b!1182533))

(assert (= (and b!1182533 res!785445) b!1182522))

(assert (= (and b!1182522 res!785440) b!1182527))

(assert (= (and b!1182527 (not res!785443)) b!1182519))

(assert (= (and b!1182519 (not res!785442)) b!1182539))

(assert (= (and b!1182539 (not res!785451)) b!1182521))

(assert (= (and b!1182521 res!785448) b!1182536))

(assert (= (and b!1182536 (not res!785455)) b!1182537))

(assert (= (and b!1182521 c!117359) b!1182520))

(assert (= (and b!1182521 (not c!117359)) b!1182525))

(assert (= (and b!1182521 res!785449) b!1182528))

(assert (= (and b!1182528 res!785446) b!1182526))

(assert (= (and b!1182530 condMapEmpty!46460) mapIsEmpty!46460))

(assert (= (and b!1182530 (not condMapEmpty!46460)) mapNonEmpty!46460))

(get-info :version)

(assert (= (and mapNonEmpty!46460 ((_ is ValueCellFull!14168) mapValue!46460)) b!1182535))

(assert (= (and b!1182530 ((_ is ValueCellFull!14168) mapDefault!46460)) b!1182524))

(assert (= start!99882 b!1182530))

(declare-fun b_lambda!20363 () Bool)

(assert (=> (not b_lambda!20363) (not b!1182519)))

(declare-fun t!38113 () Bool)

(declare-fun tb!10029 () Bool)

(assert (=> (and start!99882 (= defaultEntry!1004 defaultEntry!1004) t!38113) tb!10029))

(declare-fun result!20633 () Bool)

(assert (=> tb!10029 (= result!20633 tp_is_empty!29755)))

(assert (=> b!1182519 t!38113))

(declare-fun b_and!41321 () Bool)

(assert (= b_and!41319 (and (=> t!38113 result!20633) b_and!41321)))

(declare-fun m!1090731 () Bool)

(assert (=> b!1182531 m!1090731))

(declare-fun m!1090733 () Bool)

(assert (=> b!1182539 m!1090733))

(declare-fun m!1090735 () Bool)

(assert (=> b!1182539 m!1090735))

(declare-fun m!1090737 () Bool)

(assert (=> b!1182539 m!1090737))

(declare-fun m!1090739 () Bool)

(assert (=> b!1182539 m!1090739))

(declare-fun m!1090741 () Bool)

(assert (=> b!1182539 m!1090741))

(declare-fun m!1090743 () Bool)

(assert (=> b!1182539 m!1090743))

(assert (=> b!1182539 m!1090741))

(declare-fun m!1090745 () Bool)

(assert (=> b!1182533 m!1090745))

(declare-fun m!1090747 () Bool)

(assert (=> b!1182533 m!1090747))

(declare-fun m!1090749 () Bool)

(assert (=> b!1182518 m!1090749))

(declare-fun m!1090751 () Bool)

(assert (=> b!1182532 m!1090751))

(assert (=> b!1182536 m!1090741))

(declare-fun m!1090753 () Bool)

(assert (=> b!1182520 m!1090753))

(declare-fun m!1090755 () Bool)

(assert (=> b!1182520 m!1090755))

(declare-fun m!1090757 () Bool)

(assert (=> b!1182520 m!1090757))

(declare-fun m!1090759 () Bool)

(assert (=> b!1182520 m!1090759))

(declare-fun m!1090761 () Bool)

(assert (=> b!1182520 m!1090761))

(declare-fun m!1090763 () Bool)

(assert (=> b!1182522 m!1090763))

(assert (=> b!1182521 m!1090741))

(declare-fun m!1090765 () Bool)

(assert (=> b!1182521 m!1090765))

(declare-fun m!1090767 () Bool)

(assert (=> b!1182521 m!1090767))

(assert (=> b!1182521 m!1090767))

(declare-fun m!1090769 () Bool)

(assert (=> b!1182521 m!1090769))

(declare-fun m!1090771 () Bool)

(assert (=> b!1182534 m!1090771))

(declare-fun m!1090773 () Bool)

(assert (=> b!1182538 m!1090773))

(declare-fun m!1090775 () Bool)

(assert (=> b!1182527 m!1090775))

(declare-fun m!1090777 () Bool)

(assert (=> b!1182527 m!1090777))

(declare-fun m!1090779 () Bool)

(assert (=> mapNonEmpty!46460 m!1090779))

(declare-fun m!1090781 () Bool)

(assert (=> b!1182528 m!1090781))

(declare-fun m!1090783 () Bool)

(assert (=> b!1182537 m!1090783))

(declare-fun m!1090785 () Bool)

(assert (=> b!1182519 m!1090785))

(declare-fun m!1090787 () Bool)

(assert (=> b!1182519 m!1090787))

(declare-fun m!1090789 () Bool)

(assert (=> b!1182519 m!1090789))

(declare-fun m!1090791 () Bool)

(assert (=> b!1182519 m!1090791))

(declare-fun m!1090793 () Bool)

(assert (=> start!99882 m!1090793))

(declare-fun m!1090795 () Bool)

(assert (=> start!99882 m!1090795))

(check-sat (not b!1182531) (not b!1182534) (not b!1182518) (not b!1182537) (not start!99882) b_and!41321 (not b!1182533) (not b!1182519) (not mapNonEmpty!46460) (not b_next!25225) (not b!1182520) (not b!1182521) (not b!1182532) tp_is_empty!29755 (not b!1182539) (not b!1182527) (not b_lambda!20363) (not b!1182528) (not b!1182522))
(check-sat b_and!41321 (not b_next!25225))
