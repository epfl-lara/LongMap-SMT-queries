; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101518 () Bool)

(assert start!101518)

(declare-fun b_free!26311 () Bool)

(declare-fun b_next!26311 () Bool)

(assert (=> start!101518 (= b_free!26311 (not b_next!26311))))

(declare-fun tp!91969 () Bool)

(declare-fun b_and!43811 () Bool)

(assert (=> start!101518 (= tp!91969 b_and!43811)))

(declare-fun b!1220415 () Bool)

(declare-fun e!692997 () Bool)

(declare-fun e!692996 () Bool)

(assert (=> b!1220415 (= e!692997 (not e!692996))))

(declare-fun res!810701 () Bool)

(assert (=> b!1220415 (=> res!810701 e!692996)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1220415 (= res!810701 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78730 0))(
  ( (array!78731 (arr!37995 (Array (_ BitVec 32) (_ BitVec 64))) (size!38533 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78730)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220415 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40291 0))(
  ( (Unit!40292) )
))
(declare-fun lt!554874 () Unit!40291)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78730 (_ BitVec 64) (_ BitVec 32)) Unit!40291)

(assert (=> b!1220415 (= lt!554874 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220416 () Bool)

(declare-fun e!693000 () Bool)

(assert (=> b!1220416 (= e!692996 e!693000)))

(declare-fun res!810697 () Bool)

(assert (=> b!1220416 (=> res!810697 e!693000)))

(assert (=> b!1220416 (= res!810697 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46481 0))(
  ( (V!46482 (val!15564 Int)) )
))
(declare-fun zeroValue!944 () V!46481)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554872 () array!78730)

(declare-datatypes ((tuple2!20118 0))(
  ( (tuple2!20119 (_1!10070 (_ BitVec 64)) (_2!10070 V!46481)) )
))
(declare-datatypes ((List!26897 0))(
  ( (Nil!26894) (Cons!26893 (h!28102 tuple2!20118) (t!40179 List!26897)) )
))
(declare-datatypes ((ListLongMap!18087 0))(
  ( (ListLongMap!18088 (toList!9059 List!26897)) )
))
(declare-fun lt!554875 () ListLongMap!18087)

(declare-fun minValue!944 () V!46481)

(declare-datatypes ((ValueCell!14798 0))(
  ( (ValueCellFull!14798 (v!18221 V!46481)) (EmptyCell!14798) )
))
(declare-datatypes ((array!78732 0))(
  ( (array!78733 (arr!37996 (Array (_ BitVec 32) ValueCell!14798)) (size!38534 (_ BitVec 32))) )
))
(declare-fun lt!554878 () array!78732)

(declare-fun getCurrentListMapNoExtraKeys!5496 (array!78730 array!78732 (_ BitVec 32) (_ BitVec 32) V!46481 V!46481 (_ BitVec 32) Int) ListLongMap!18087)

(assert (=> b!1220416 (= lt!554875 (getCurrentListMapNoExtraKeys!5496 lt!554872 lt!554878 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554880 () V!46481)

(declare-fun _values!996 () array!78732)

(assert (=> b!1220416 (= lt!554878 (array!78733 (store (arr!37996 _values!996) i!673 (ValueCellFull!14798 lt!554880)) (size!38534 _values!996)))))

(declare-fun dynLambda!3344 (Int (_ BitVec 64)) V!46481)

(assert (=> b!1220416 (= lt!554880 (dynLambda!3344 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554876 () ListLongMap!18087)

(assert (=> b!1220416 (= lt!554876 (getCurrentListMapNoExtraKeys!5496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!692990 () Bool)

(declare-fun b!1220417 () Bool)

(assert (=> b!1220417 (= e!692990 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48412 () Bool)

(declare-fun mapRes!48412 () Bool)

(declare-fun tp!91970 () Bool)

(declare-fun e!692991 () Bool)

(assert (=> mapNonEmpty!48412 (= mapRes!48412 (and tp!91970 e!692991))))

(declare-fun mapValue!48412 () ValueCell!14798)

(declare-fun mapRest!48412 () (Array (_ BitVec 32) ValueCell!14798))

(declare-fun mapKey!48412 () (_ BitVec 32))

(assert (=> mapNonEmpty!48412 (= (arr!37996 _values!996) (store mapRest!48412 mapKey!48412 mapValue!48412))))

(declare-fun b!1220418 () Bool)

(declare-fun res!810700 () Bool)

(declare-fun e!692994 () Bool)

(assert (=> b!1220418 (=> (not res!810700) (not e!692994))))

(declare-datatypes ((List!26898 0))(
  ( (Nil!26895) (Cons!26894 (h!28103 (_ BitVec 64)) (t!40180 List!26898)) )
))
(declare-fun arrayNoDuplicates!0 (array!78730 (_ BitVec 32) List!26898) Bool)

(assert (=> b!1220418 (= res!810700 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26895))))

(declare-fun b!1220419 () Bool)

(declare-fun e!692993 () Bool)

(declare-fun e!692998 () Bool)

(assert (=> b!1220419 (= e!692993 e!692998)))

(declare-fun res!810698 () Bool)

(assert (=> b!1220419 (=> res!810698 e!692998)))

(assert (=> b!1220419 (= res!810698 (not (= (select (arr!37995 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692995 () Bool)

(assert (=> b!1220419 e!692995))

(declare-fun res!810695 () Bool)

(assert (=> b!1220419 (=> (not res!810695) (not e!692995))))

(declare-fun lt!554877 () ListLongMap!18087)

(declare-fun +!4124 (ListLongMap!18087 tuple2!20118) ListLongMap!18087)

(declare-fun get!19397 (ValueCell!14798 V!46481) V!46481)

(assert (=> b!1220419 (= res!810695 (= lt!554875 (+!4124 lt!554877 (tuple2!20119 (select (arr!37995 _keys!1208) from!1455) (get!19397 (select (arr!37996 _values!996) from!1455) lt!554880)))))))

(declare-fun b!1220420 () Bool)

(declare-fun res!810691 () Bool)

(assert (=> b!1220420 (=> (not res!810691) (not e!692994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220420 (= res!810691 (validMask!0 mask!1564))))

(declare-fun b!1220421 () Bool)

(declare-fun tp_is_empty!31015 () Bool)

(assert (=> b!1220421 (= e!692991 tp_is_empty!31015)))

(declare-fun b!1220422 () Bool)

(assert (=> b!1220422 (= e!692994 e!692997)))

(declare-fun res!810689 () Bool)

(assert (=> b!1220422 (=> (not res!810689) (not e!692997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78730 (_ BitVec 32)) Bool)

(assert (=> b!1220422 (= res!810689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554872 mask!1564))))

(assert (=> b!1220422 (= lt!554872 (array!78731 (store (arr!37995 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38533 _keys!1208)))))

(declare-fun b!1220423 () Bool)

(assert (=> b!1220423 (= e!692998 true)))

(assert (=> b!1220423 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26895)))

(declare-fun lt!554873 () Unit!40291)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78730 (_ BitVec 32) (_ BitVec 32)) Unit!40291)

(assert (=> b!1220423 (= lt!554873 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1220423 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554871 () Unit!40291)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78730 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40291)

(assert (=> b!1220423 (= lt!554871 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!48412 () Bool)

(assert (=> mapIsEmpty!48412 mapRes!48412))

(declare-fun b!1220425 () Bool)

(assert (=> b!1220425 (= e!693000 e!692993)))

(declare-fun res!810699 () Bool)

(assert (=> b!1220425 (=> res!810699 e!692993)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220425 (= res!810699 (not (validKeyInArray!0 (select (arr!37995 _keys!1208) from!1455))))))

(declare-fun lt!554879 () ListLongMap!18087)

(assert (=> b!1220425 (= lt!554879 lt!554877)))

(declare-fun lt!554882 () ListLongMap!18087)

(declare-fun -!1888 (ListLongMap!18087 (_ BitVec 64)) ListLongMap!18087)

(assert (=> b!1220425 (= lt!554877 (-!1888 lt!554882 k0!934))))

(assert (=> b!1220425 (= lt!554879 (getCurrentListMapNoExtraKeys!5496 lt!554872 lt!554878 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220425 (= lt!554882 (getCurrentListMapNoExtraKeys!5496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554881 () Unit!40291)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1123 (array!78730 array!78732 (_ BitVec 32) (_ BitVec 32) V!46481 V!46481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40291)

(assert (=> b!1220425 (= lt!554881 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1123 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220426 () Bool)

(declare-fun res!810692 () Bool)

(assert (=> b!1220426 (=> (not res!810692) (not e!692994))))

(assert (=> b!1220426 (= res!810692 (= (select (arr!37995 _keys!1208) i!673) k0!934))))

(declare-fun b!1220427 () Bool)

(declare-fun res!810694 () Bool)

(assert (=> b!1220427 (=> (not res!810694) (not e!692994))))

(assert (=> b!1220427 (= res!810694 (and (= (size!38534 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38533 _keys!1208) (size!38534 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220428 () Bool)

(declare-fun res!810686 () Bool)

(assert (=> b!1220428 (=> (not res!810686) (not e!692997))))

(assert (=> b!1220428 (= res!810686 (arrayNoDuplicates!0 lt!554872 #b00000000000000000000000000000000 Nil!26895))))

(declare-fun b!1220429 () Bool)

(assert (=> b!1220429 (= e!692995 e!692990)))

(declare-fun res!810687 () Bool)

(assert (=> b!1220429 (=> res!810687 e!692990)))

(assert (=> b!1220429 (= res!810687 (not (= (select (arr!37995 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220430 () Bool)

(declare-fun e!692999 () Bool)

(assert (=> b!1220430 (= e!692999 tp_is_empty!31015)))

(declare-fun b!1220431 () Bool)

(declare-fun res!810690 () Bool)

(assert (=> b!1220431 (=> (not res!810690) (not e!692994))))

(assert (=> b!1220431 (= res!810690 (validKeyInArray!0 k0!934))))

(declare-fun res!810693 () Bool)

(assert (=> start!101518 (=> (not res!810693) (not e!692994))))

(assert (=> start!101518 (= res!810693 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38533 _keys!1208))))))

(assert (=> start!101518 e!692994))

(assert (=> start!101518 tp_is_empty!31015))

(declare-fun array_inv!29038 (array!78730) Bool)

(assert (=> start!101518 (array_inv!29038 _keys!1208)))

(assert (=> start!101518 true))

(assert (=> start!101518 tp!91969))

(declare-fun e!692992 () Bool)

(declare-fun array_inv!29039 (array!78732) Bool)

(assert (=> start!101518 (and (array_inv!29039 _values!996) e!692992)))

(declare-fun b!1220424 () Bool)

(declare-fun res!810688 () Bool)

(assert (=> b!1220424 (=> (not res!810688) (not e!692994))))

(assert (=> b!1220424 (= res!810688 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38533 _keys!1208))))))

(declare-fun b!1220432 () Bool)

(declare-fun res!810696 () Bool)

(assert (=> b!1220432 (=> (not res!810696) (not e!692994))))

(assert (=> b!1220432 (= res!810696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220433 () Bool)

(assert (=> b!1220433 (= e!692992 (and e!692999 mapRes!48412))))

(declare-fun condMapEmpty!48412 () Bool)

(declare-fun mapDefault!48412 () ValueCell!14798)

(assert (=> b!1220433 (= condMapEmpty!48412 (= (arr!37996 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14798)) mapDefault!48412)))))

(assert (= (and start!101518 res!810693) b!1220420))

(assert (= (and b!1220420 res!810691) b!1220427))

(assert (= (and b!1220427 res!810694) b!1220432))

(assert (= (and b!1220432 res!810696) b!1220418))

(assert (= (and b!1220418 res!810700) b!1220424))

(assert (= (and b!1220424 res!810688) b!1220431))

(assert (= (and b!1220431 res!810690) b!1220426))

(assert (= (and b!1220426 res!810692) b!1220422))

(assert (= (and b!1220422 res!810689) b!1220428))

(assert (= (and b!1220428 res!810686) b!1220415))

(assert (= (and b!1220415 (not res!810701)) b!1220416))

(assert (= (and b!1220416 (not res!810697)) b!1220425))

(assert (= (and b!1220425 (not res!810699)) b!1220419))

(assert (= (and b!1220419 res!810695) b!1220429))

(assert (= (and b!1220429 (not res!810687)) b!1220417))

(assert (= (and b!1220419 (not res!810698)) b!1220423))

(assert (= (and b!1220433 condMapEmpty!48412) mapIsEmpty!48412))

(assert (= (and b!1220433 (not condMapEmpty!48412)) mapNonEmpty!48412))

(get-info :version)

(assert (= (and mapNonEmpty!48412 ((_ is ValueCellFull!14798) mapValue!48412)) b!1220421))

(assert (= (and b!1220433 ((_ is ValueCellFull!14798) mapDefault!48412)) b!1220430))

(assert (= start!101518 b!1220433))

(declare-fun b_lambda!22167 () Bool)

(assert (=> (not b_lambda!22167) (not b!1220416)))

(declare-fun t!40178 () Bool)

(declare-fun tb!11103 () Bool)

(assert (=> (and start!101518 (= defaultEntry!1004 defaultEntry!1004) t!40178) tb!11103))

(declare-fun result!22821 () Bool)

(assert (=> tb!11103 (= result!22821 tp_is_empty!31015)))

(assert (=> b!1220416 t!40178))

(declare-fun b_and!43813 () Bool)

(assert (= b_and!43811 (and (=> t!40178 result!22821) b_and!43813)))

(declare-fun m!1124781 () Bool)

(assert (=> mapNonEmpty!48412 m!1124781))

(declare-fun m!1124783 () Bool)

(assert (=> b!1220422 m!1124783))

(declare-fun m!1124785 () Bool)

(assert (=> b!1220422 m!1124785))

(declare-fun m!1124787 () Bool)

(assert (=> b!1220420 m!1124787))

(declare-fun m!1124789 () Bool)

(assert (=> b!1220418 m!1124789))

(declare-fun m!1124791 () Bool)

(assert (=> b!1220423 m!1124791))

(declare-fun m!1124793 () Bool)

(assert (=> b!1220423 m!1124793))

(declare-fun m!1124795 () Bool)

(assert (=> b!1220423 m!1124795))

(declare-fun m!1124797 () Bool)

(assert (=> b!1220423 m!1124797))

(declare-fun m!1124799 () Bool)

(assert (=> start!101518 m!1124799))

(declare-fun m!1124801 () Bool)

(assert (=> start!101518 m!1124801))

(declare-fun m!1124803 () Bool)

(assert (=> b!1220415 m!1124803))

(declare-fun m!1124805 () Bool)

(assert (=> b!1220415 m!1124805))

(declare-fun m!1124807 () Bool)

(assert (=> b!1220428 m!1124807))

(declare-fun m!1124809 () Bool)

(assert (=> b!1220432 m!1124809))

(declare-fun m!1124811 () Bool)

(assert (=> b!1220419 m!1124811))

(declare-fun m!1124813 () Bool)

(assert (=> b!1220419 m!1124813))

(assert (=> b!1220419 m!1124813))

(declare-fun m!1124815 () Bool)

(assert (=> b!1220419 m!1124815))

(declare-fun m!1124817 () Bool)

(assert (=> b!1220419 m!1124817))

(declare-fun m!1124819 () Bool)

(assert (=> b!1220426 m!1124819))

(assert (=> b!1220429 m!1124811))

(declare-fun m!1124821 () Bool)

(assert (=> b!1220416 m!1124821))

(declare-fun m!1124823 () Bool)

(assert (=> b!1220416 m!1124823))

(declare-fun m!1124825 () Bool)

(assert (=> b!1220416 m!1124825))

(declare-fun m!1124827 () Bool)

(assert (=> b!1220416 m!1124827))

(declare-fun m!1124829 () Bool)

(assert (=> b!1220417 m!1124829))

(declare-fun m!1124831 () Bool)

(assert (=> b!1220431 m!1124831))

(declare-fun m!1124833 () Bool)

(assert (=> b!1220425 m!1124833))

(declare-fun m!1124835 () Bool)

(assert (=> b!1220425 m!1124835))

(declare-fun m!1124837 () Bool)

(assert (=> b!1220425 m!1124837))

(declare-fun m!1124839 () Bool)

(assert (=> b!1220425 m!1124839))

(assert (=> b!1220425 m!1124811))

(declare-fun m!1124841 () Bool)

(assert (=> b!1220425 m!1124841))

(assert (=> b!1220425 m!1124811))

(check-sat tp_is_empty!31015 (not b_lambda!22167) (not b!1220418) (not start!101518) b_and!43813 (not b!1220422) (not b!1220431) (not b!1220423) (not b!1220428) (not mapNonEmpty!48412) (not b!1220416) (not b!1220419) (not b!1220415) (not b!1220417) (not b!1220432) (not b_next!26311) (not b!1220420) (not b!1220425))
(check-sat b_and!43813 (not b_next!26311))
