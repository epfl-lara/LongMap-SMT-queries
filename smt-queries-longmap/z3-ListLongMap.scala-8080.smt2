; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99340 () Bool)

(assert start!99340)

(declare-fun b_free!24925 () Bool)

(declare-fun b_next!24925 () Bool)

(assert (=> start!99340 (= b_free!24925 (not b_next!24925))))

(declare-fun tp!87488 () Bool)

(declare-fun b_and!40695 () Bool)

(assert (=> start!99340 (= tp!87488 b_and!40695)))

(declare-fun mapNonEmpty!46010 () Bool)

(declare-fun mapRes!46010 () Bool)

(declare-fun tp!87489 () Bool)

(declare-fun e!665808 () Bool)

(assert (=> mapNonEmpty!46010 (= mapRes!46010 (and tp!87489 e!665808))))

(declare-datatypes ((V!44401 0))(
  ( (V!44402 (val!14784 Int)) )
))
(declare-datatypes ((ValueCell!14018 0))(
  ( (ValueCellFull!14018 (v!17421 V!44401)) (EmptyCell!14018) )
))
(declare-fun mapValue!46010 () ValueCell!14018)

(declare-fun mapRest!46010 () (Array (_ BitVec 32) ValueCell!14018))

(declare-datatypes ((array!75654 0))(
  ( (array!75655 (arr!36477 (Array (_ BitVec 32) ValueCell!14018)) (size!37015 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75654)

(declare-fun mapKey!46010 () (_ BitVec 32))

(assert (=> mapNonEmpty!46010 (= (arr!36477 _values!996) (store mapRest!46010 mapKey!46010 mapValue!46010))))

(declare-fun b!1171391 () Bool)

(declare-fun e!665807 () Bool)

(assert (=> b!1171391 (= e!665807 true)))

(declare-fun lt!527554 () Bool)

(declare-datatypes ((List!25689 0))(
  ( (Nil!25686) (Cons!25685 (h!26894 (_ BitVec 64)) (t!37597 List!25689)) )
))
(declare-fun contains!6828 (List!25689 (_ BitVec 64)) Bool)

(assert (=> b!1171391 (= lt!527554 (contains!6828 Nil!25686 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171392 () Bool)

(declare-fun res!777604 () Bool)

(declare-fun e!665802 () Bool)

(assert (=> b!1171392 (=> (not res!777604) (not e!665802))))

(declare-datatypes ((array!75656 0))(
  ( (array!75657 (arr!36478 (Array (_ BitVec 32) (_ BitVec 64))) (size!37016 (_ BitVec 32))) )
))
(declare-fun lt!527560 () array!75656)

(declare-fun arrayNoDuplicates!0 (array!75656 (_ BitVec 32) List!25689) Bool)

(assert (=> b!1171392 (= res!777604 (arrayNoDuplicates!0 lt!527560 #b00000000000000000000000000000000 Nil!25686))))

(declare-fun b!1171393 () Bool)

(declare-fun res!777616 () Bool)

(assert (=> b!1171393 (=> res!777616 e!665807)))

(assert (=> b!1171393 (= res!777616 (contains!6828 Nil!25686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171394 () Bool)

(declare-fun res!777605 () Bool)

(declare-fun e!665809 () Bool)

(assert (=> b!1171394 (=> (not res!777605) (not e!665809))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!75656)

(assert (=> b!1171394 (= res!777605 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37016 _keys!1208))))))

(declare-fun b!1171395 () Bool)

(declare-fun e!665805 () Bool)

(declare-fun e!665798 () Bool)

(assert (=> b!1171395 (= e!665805 e!665798)))

(declare-fun res!777601 () Bool)

(assert (=> b!1171395 (=> res!777601 e!665798)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171395 (= res!777601 (not (validKeyInArray!0 (select (arr!36478 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18976 0))(
  ( (tuple2!18977 (_1!9499 (_ BitVec 64)) (_2!9499 V!44401)) )
))
(declare-datatypes ((List!25690 0))(
  ( (Nil!25687) (Cons!25686 (h!26895 tuple2!18976) (t!37598 List!25690)) )
))
(declare-datatypes ((ListLongMap!16945 0))(
  ( (ListLongMap!16946 (toList!8488 List!25690)) )
))
(declare-fun lt!527562 () ListLongMap!16945)

(declare-fun lt!527557 () ListLongMap!16945)

(assert (=> b!1171395 (= lt!527562 lt!527557)))

(declare-fun lt!527559 () ListLongMap!16945)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1482 (ListLongMap!16945 (_ BitVec 64)) ListLongMap!16945)

(assert (=> b!1171395 (= lt!527557 (-!1482 lt!527559 k0!934))))

(declare-fun zeroValue!944 () V!44401)

(declare-fun lt!527555 () array!75654)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44401)

(declare-fun getCurrentListMapNoExtraKeys!4962 (array!75656 array!75654 (_ BitVec 32) (_ BitVec 32) V!44401 V!44401 (_ BitVec 32) Int) ListLongMap!16945)

(assert (=> b!1171395 (= lt!527562 (getCurrentListMapNoExtraKeys!4962 lt!527560 lt!527555 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171395 (= lt!527559 (getCurrentListMapNoExtraKeys!4962 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38457 0))(
  ( (Unit!38458) )
))
(declare-fun lt!527553 () Unit!38457)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!746 (array!75656 array!75654 (_ BitVec 32) (_ BitVec 32) V!44401 V!44401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38457)

(assert (=> b!1171395 (= lt!527553 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!746 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171396 () Bool)

(declare-fun e!665804 () Bool)

(assert (=> b!1171396 (= e!665798 e!665804)))

(declare-fun res!777615 () Bool)

(assert (=> b!1171396 (=> res!777615 e!665804)))

(assert (=> b!1171396 (= res!777615 (not (= (select (arr!36478 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665803 () Bool)

(assert (=> b!1171396 e!665803))

(declare-fun res!777606 () Bool)

(assert (=> b!1171396 (=> (not res!777606) (not e!665803))))

(declare-fun lt!527565 () V!44401)

(declare-fun lt!527558 () ListLongMap!16945)

(declare-fun +!3807 (ListLongMap!16945 tuple2!18976) ListLongMap!16945)

(declare-fun get!18615 (ValueCell!14018 V!44401) V!44401)

(assert (=> b!1171396 (= res!777606 (= lt!527558 (+!3807 lt!527557 (tuple2!18977 (select (arr!36478 _keys!1208) from!1455) (get!18615 (select (arr!36477 _values!996) from!1455) lt!527565)))))))

(declare-fun b!1171397 () Bool)

(declare-fun e!665801 () Bool)

(assert (=> b!1171397 (= e!665803 e!665801)))

(declare-fun res!777614 () Bool)

(assert (=> b!1171397 (=> res!777614 e!665801)))

(assert (=> b!1171397 (= res!777614 (not (= (select (arr!36478 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171398 () Bool)

(declare-fun e!665800 () Bool)

(declare-fun e!665806 () Bool)

(assert (=> b!1171398 (= e!665800 (and e!665806 mapRes!46010))))

(declare-fun condMapEmpty!46010 () Bool)

(declare-fun mapDefault!46010 () ValueCell!14018)

(assert (=> b!1171398 (= condMapEmpty!46010 (= (arr!36477 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14018)) mapDefault!46010)))))

(declare-fun b!1171399 () Bool)

(assert (=> b!1171399 (= e!665809 e!665802)))

(declare-fun res!777609 () Bool)

(assert (=> b!1171399 (=> (not res!777609) (not e!665802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75656 (_ BitVec 32)) Bool)

(assert (=> b!1171399 (= res!777609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527560 mask!1564))))

(assert (=> b!1171399 (= lt!527560 (array!75657 (store (arr!36478 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37016 _keys!1208)))))

(declare-fun b!1171400 () Bool)

(declare-fun res!777608 () Bool)

(assert (=> b!1171400 (=> (not res!777608) (not e!665809))))

(assert (=> b!1171400 (= res!777608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171401 () Bool)

(declare-fun e!665797 () Bool)

(assert (=> b!1171401 (= e!665802 (not e!665797))))

(declare-fun res!777602 () Bool)

(assert (=> b!1171401 (=> res!777602 e!665797)))

(assert (=> b!1171401 (= res!777602 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171401 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527563 () Unit!38457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75656 (_ BitVec 64) (_ BitVec 32)) Unit!38457)

(assert (=> b!1171401 (= lt!527563 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171402 () Bool)

(declare-fun res!777611 () Bool)

(assert (=> b!1171402 (=> (not res!777611) (not e!665809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171402 (= res!777611 (validMask!0 mask!1564))))

(declare-fun res!777598 () Bool)

(assert (=> start!99340 (=> (not res!777598) (not e!665809))))

(assert (=> start!99340 (= res!777598 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37016 _keys!1208))))))

(assert (=> start!99340 e!665809))

(declare-fun tp_is_empty!29455 () Bool)

(assert (=> start!99340 tp_is_empty!29455))

(declare-fun array_inv!27978 (array!75656) Bool)

(assert (=> start!99340 (array_inv!27978 _keys!1208)))

(assert (=> start!99340 true))

(assert (=> start!99340 tp!87488))

(declare-fun array_inv!27979 (array!75654) Bool)

(assert (=> start!99340 (and (array_inv!27979 _values!996) e!665800)))

(declare-fun b!1171403 () Bool)

(assert (=> b!1171403 (= e!665808 tp_is_empty!29455)))

(declare-fun b!1171404 () Bool)

(assert (=> b!1171404 (= e!665804 e!665807)))

(declare-fun res!777613 () Bool)

(assert (=> b!1171404 (=> res!777613 e!665807)))

(assert (=> b!1171404 (= res!777613 (or (bvsge (size!37016 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37016 _keys!1208)) (bvsge from!1455 (size!37016 _keys!1208))))))

(assert (=> b!1171404 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25686)))

(declare-fun lt!527556 () Unit!38457)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75656 (_ BitVec 32) (_ BitVec 32)) Unit!38457)

(assert (=> b!1171404 (= lt!527556 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1171404 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527564 () Unit!38457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38457)

(assert (=> b!1171404 (= lt!527564 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171405 () Bool)

(assert (=> b!1171405 (= e!665797 e!665805)))

(declare-fun res!777610 () Bool)

(assert (=> b!1171405 (=> res!777610 e!665805)))

(assert (=> b!1171405 (= res!777610 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1171405 (= lt!527558 (getCurrentListMapNoExtraKeys!4962 lt!527560 lt!527555 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1171405 (= lt!527555 (array!75655 (store (arr!36477 _values!996) i!673 (ValueCellFull!14018 lt!527565)) (size!37015 _values!996)))))

(declare-fun dynLambda!2887 (Int (_ BitVec 64)) V!44401)

(assert (=> b!1171405 (= lt!527565 (dynLambda!2887 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527561 () ListLongMap!16945)

(assert (=> b!1171405 (= lt!527561 (getCurrentListMapNoExtraKeys!4962 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171406 () Bool)

(declare-fun res!777612 () Bool)

(assert (=> b!1171406 (=> res!777612 e!665807)))

(declare-fun noDuplicate!1625 (List!25689) Bool)

(assert (=> b!1171406 (= res!777612 (not (noDuplicate!1625 Nil!25686)))))

(declare-fun b!1171407 () Bool)

(assert (=> b!1171407 (= e!665801 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171408 () Bool)

(assert (=> b!1171408 (= e!665806 tp_is_empty!29455)))

(declare-fun b!1171409 () Bool)

(declare-fun res!777600 () Bool)

(assert (=> b!1171409 (=> (not res!777600) (not e!665809))))

(assert (=> b!1171409 (= res!777600 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46010 () Bool)

(assert (=> mapIsEmpty!46010 mapRes!46010))

(declare-fun b!1171410 () Bool)

(declare-fun res!777607 () Bool)

(assert (=> b!1171410 (=> (not res!777607) (not e!665809))))

(assert (=> b!1171410 (= res!777607 (and (= (size!37015 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37016 _keys!1208) (size!37015 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171411 () Bool)

(declare-fun res!777599 () Bool)

(assert (=> b!1171411 (=> (not res!777599) (not e!665809))))

(assert (=> b!1171411 (= res!777599 (= (select (arr!36478 _keys!1208) i!673) k0!934))))

(declare-fun b!1171412 () Bool)

(declare-fun res!777603 () Bool)

(assert (=> b!1171412 (=> (not res!777603) (not e!665809))))

(assert (=> b!1171412 (= res!777603 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25686))))

(assert (= (and start!99340 res!777598) b!1171402))

(assert (= (and b!1171402 res!777611) b!1171410))

(assert (= (and b!1171410 res!777607) b!1171400))

(assert (= (and b!1171400 res!777608) b!1171412))

(assert (= (and b!1171412 res!777603) b!1171394))

(assert (= (and b!1171394 res!777605) b!1171409))

(assert (= (and b!1171409 res!777600) b!1171411))

(assert (= (and b!1171411 res!777599) b!1171399))

(assert (= (and b!1171399 res!777609) b!1171392))

(assert (= (and b!1171392 res!777604) b!1171401))

(assert (= (and b!1171401 (not res!777602)) b!1171405))

(assert (= (and b!1171405 (not res!777610)) b!1171395))

(assert (= (and b!1171395 (not res!777601)) b!1171396))

(assert (= (and b!1171396 res!777606) b!1171397))

(assert (= (and b!1171397 (not res!777614)) b!1171407))

(assert (= (and b!1171396 (not res!777615)) b!1171404))

(assert (= (and b!1171404 (not res!777613)) b!1171406))

(assert (= (and b!1171406 (not res!777612)) b!1171393))

(assert (= (and b!1171393 (not res!777616)) b!1171391))

(assert (= (and b!1171398 condMapEmpty!46010) mapIsEmpty!46010))

(assert (= (and b!1171398 (not condMapEmpty!46010)) mapNonEmpty!46010))

(get-info :version)

(assert (= (and mapNonEmpty!46010 ((_ is ValueCellFull!14018) mapValue!46010)) b!1171403))

(assert (= (and b!1171398 ((_ is ValueCellFull!14018) mapDefault!46010)) b!1171408))

(assert (= start!99340 b!1171398))

(declare-fun b_lambda!20051 () Bool)

(assert (=> (not b_lambda!20051) (not b!1171405)))

(declare-fun t!37596 () Bool)

(declare-fun tb!9729 () Bool)

(assert (=> (and start!99340 (= defaultEntry!1004 defaultEntry!1004) t!37596) tb!9729))

(declare-fun result!20033 () Bool)

(assert (=> tb!9729 (= result!20033 tp_is_empty!29455)))

(assert (=> b!1171405 t!37596))

(declare-fun b_and!40697 () Bool)

(assert (= b_and!40695 (and (=> t!37596 result!20033) b_and!40697)))

(declare-fun m!1078721 () Bool)

(assert (=> b!1171391 m!1078721))

(declare-fun m!1078723 () Bool)

(assert (=> b!1171395 m!1078723))

(declare-fun m!1078725 () Bool)

(assert (=> b!1171395 m!1078725))

(declare-fun m!1078727 () Bool)

(assert (=> b!1171395 m!1078727))

(declare-fun m!1078729 () Bool)

(assert (=> b!1171395 m!1078729))

(declare-fun m!1078731 () Bool)

(assert (=> b!1171395 m!1078731))

(declare-fun m!1078733 () Bool)

(assert (=> b!1171395 m!1078733))

(assert (=> b!1171395 m!1078731))

(declare-fun m!1078735 () Bool)

(assert (=> mapNonEmpty!46010 m!1078735))

(declare-fun m!1078737 () Bool)

(assert (=> start!99340 m!1078737))

(declare-fun m!1078739 () Bool)

(assert (=> start!99340 m!1078739))

(declare-fun m!1078741 () Bool)

(assert (=> b!1171399 m!1078741))

(declare-fun m!1078743 () Bool)

(assert (=> b!1171399 m!1078743))

(assert (=> b!1171397 m!1078731))

(declare-fun m!1078745 () Bool)

(assert (=> b!1171406 m!1078745))

(declare-fun m!1078747 () Bool)

(assert (=> b!1171411 m!1078747))

(declare-fun m!1078749 () Bool)

(assert (=> b!1171392 m!1078749))

(declare-fun m!1078751 () Bool)

(assert (=> b!1171401 m!1078751))

(declare-fun m!1078753 () Bool)

(assert (=> b!1171401 m!1078753))

(declare-fun m!1078755 () Bool)

(assert (=> b!1171393 m!1078755))

(declare-fun m!1078757 () Bool)

(assert (=> b!1171407 m!1078757))

(declare-fun m!1078759 () Bool)

(assert (=> b!1171405 m!1078759))

(declare-fun m!1078761 () Bool)

(assert (=> b!1171405 m!1078761))

(declare-fun m!1078763 () Bool)

(assert (=> b!1171405 m!1078763))

(declare-fun m!1078765 () Bool)

(assert (=> b!1171405 m!1078765))

(declare-fun m!1078767 () Bool)

(assert (=> b!1171412 m!1078767))

(declare-fun m!1078769 () Bool)

(assert (=> b!1171409 m!1078769))

(declare-fun m!1078771 () Bool)

(assert (=> b!1171404 m!1078771))

(declare-fun m!1078773 () Bool)

(assert (=> b!1171404 m!1078773))

(declare-fun m!1078775 () Bool)

(assert (=> b!1171404 m!1078775))

(declare-fun m!1078777 () Bool)

(assert (=> b!1171404 m!1078777))

(assert (=> b!1171396 m!1078731))

(declare-fun m!1078779 () Bool)

(assert (=> b!1171396 m!1078779))

(assert (=> b!1171396 m!1078779))

(declare-fun m!1078781 () Bool)

(assert (=> b!1171396 m!1078781))

(declare-fun m!1078783 () Bool)

(assert (=> b!1171396 m!1078783))

(declare-fun m!1078785 () Bool)

(assert (=> b!1171402 m!1078785))

(declare-fun m!1078787 () Bool)

(assert (=> b!1171400 m!1078787))

(check-sat (not b!1171407) (not b!1171402) (not b!1171392) (not b!1171396) b_and!40697 (not b_next!24925) (not mapNonEmpty!46010) (not b_lambda!20051) (not b!1171395) (not b!1171400) (not b!1171406) (not b!1171393) (not b!1171399) tp_is_empty!29455 (not b!1171412) (not b!1171391) (not b!1171409) (not b!1171405) (not b!1171401) (not b!1171404) (not start!99340))
(check-sat b_and!40697 (not b_next!24925))
