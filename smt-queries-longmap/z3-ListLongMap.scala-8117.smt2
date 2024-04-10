; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99570 () Bool)

(assert start!99570)

(declare-fun b_free!25149 () Bool)

(declare-fun b_next!25149 () Bool)

(assert (=> start!99570 (= b_free!25149 (not b_next!25149))))

(declare-fun tp!88160 () Bool)

(declare-fun b_and!41165 () Bool)

(assert (=> start!99570 (= tp!88160 b_and!41165)))

(declare-fun b!1178685 () Bool)

(declare-fun e!670082 () Bool)

(declare-fun e!670086 () Bool)

(declare-fun mapRes!46346 () Bool)

(assert (=> b!1178685 (= e!670082 (and e!670086 mapRes!46346))))

(declare-fun condMapEmpty!46346 () Bool)

(declare-datatypes ((V!44699 0))(
  ( (V!44700 (val!14896 Int)) )
))
(declare-datatypes ((ValueCell!14130 0))(
  ( (ValueCellFull!14130 (v!17534 V!44699)) (EmptyCell!14130) )
))
(declare-datatypes ((array!76161 0))(
  ( (array!76162 (arr!36730 (Array (_ BitVec 32) ValueCell!14130)) (size!37266 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76161)

(declare-fun mapDefault!46346 () ValueCell!14130)

(assert (=> b!1178685 (= condMapEmpty!46346 (= (arr!36730 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14130)) mapDefault!46346)))))

(declare-fun b!1178686 () Bool)

(declare-fun e!670089 () Bool)

(declare-fun e!670081 () Bool)

(assert (=> b!1178686 (= e!670089 e!670081)))

(declare-fun res!783036 () Bool)

(assert (=> b!1178686 (=> res!783036 e!670081)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178686 (= res!783036 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44699)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!76163 0))(
  ( (array!76164 (arr!36731 (Array (_ BitVec 32) (_ BitVec 64))) (size!37267 (_ BitVec 32))) )
))
(declare-fun lt!532519 () array!76163)

(declare-fun lt!532529 () array!76161)

(declare-fun minValue!944 () V!44699)

(declare-datatypes ((tuple2!19062 0))(
  ( (tuple2!19063 (_1!9542 (_ BitVec 64)) (_2!9542 V!44699)) )
))
(declare-datatypes ((List!25800 0))(
  ( (Nil!25797) (Cons!25796 (h!27005 tuple2!19062) (t!37941 List!25800)) )
))
(declare-datatypes ((ListLongMap!17031 0))(
  ( (ListLongMap!17032 (toList!8531 List!25800)) )
))
(declare-fun lt!532521 () ListLongMap!17031)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4987 (array!76163 array!76161 (_ BitVec 32) (_ BitVec 32) V!44699 V!44699 (_ BitVec 32) Int) ListLongMap!17031)

(assert (=> b!1178686 (= lt!532521 (getCurrentListMapNoExtraKeys!4987 lt!532519 lt!532529 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532531 () V!44699)

(assert (=> b!1178686 (= lt!532529 (array!76162 (store (arr!36730 _values!996) i!673 (ValueCellFull!14130 lt!532531)) (size!37266 _values!996)))))

(declare-fun dynLambda!2949 (Int (_ BitVec 64)) V!44699)

(assert (=> b!1178686 (= lt!532531 (dynLambda!2949 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76163)

(declare-fun lt!532523 () ListLongMap!17031)

(assert (=> b!1178686 (= lt!532523 (getCurrentListMapNoExtraKeys!4987 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532525 () ListLongMap!17031)

(declare-fun e!670087 () Bool)

(declare-fun b!1178687 () Bool)

(declare-fun lt!532526 () tuple2!19062)

(declare-fun +!3845 (ListLongMap!17031 tuple2!19062) ListLongMap!17031)

(assert (=> b!1178687 (= e!670087 (= lt!532523 (+!3845 lt!532525 lt!532526)))))

(declare-fun b!1178688 () Bool)

(declare-fun e!670090 () Bool)

(declare-fun e!670093 () Bool)

(assert (=> b!1178688 (= e!670090 e!670093)))

(declare-fun res!783037 () Bool)

(assert (=> b!1178688 (=> res!783037 e!670093)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1178688 (= res!783037 (not (= (select (arr!36731 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178689 () Bool)

(declare-fun e!670091 () Bool)

(declare-fun e!670088 () Bool)

(assert (=> b!1178689 (= e!670091 e!670088)))

(declare-fun res!783040 () Bool)

(assert (=> b!1178689 (=> (not res!783040) (not e!670088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76163 (_ BitVec 32)) Bool)

(assert (=> b!1178689 (= res!783040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532519 mask!1564))))

(assert (=> b!1178689 (= lt!532519 (array!76164 (store (arr!36731 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37267 _keys!1208)))))

(declare-fun b!1178690 () Bool)

(assert (=> b!1178690 (= e!670088 (not e!670089))))

(declare-fun res!783038 () Bool)

(assert (=> b!1178690 (=> res!783038 e!670089)))

(assert (=> b!1178690 (= res!783038 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178690 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38938 0))(
  ( (Unit!38939) )
))
(declare-fun lt!532524 () Unit!38938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76163 (_ BitVec 64) (_ BitVec 32)) Unit!38938)

(assert (=> b!1178690 (= lt!532524 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46346 () Bool)

(assert (=> mapIsEmpty!46346 mapRes!46346))

(declare-fun b!1178692 () Bool)

(declare-fun res!783035 () Bool)

(assert (=> b!1178692 (=> (not res!783035) (not e!670091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178692 (= res!783035 (validKeyInArray!0 k0!934))))

(declare-fun b!1178693 () Bool)

(declare-fun res!783043 () Bool)

(assert (=> b!1178693 (=> (not res!783043) (not e!670091))))

(assert (=> b!1178693 (= res!783043 (and (= (size!37266 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37267 _keys!1208) (size!37266 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178694 () Bool)

(declare-fun res!783048 () Bool)

(assert (=> b!1178694 (=> (not res!783048) (not e!670091))))

(assert (=> b!1178694 (= res!783048 (= (select (arr!36731 _keys!1208) i!673) k0!934))))

(declare-fun b!1178695 () Bool)

(declare-fun e!670084 () Bool)

(assert (=> b!1178695 (= e!670084 true)))

(assert (=> b!1178695 e!670087))

(declare-fun res!783042 () Bool)

(assert (=> b!1178695 (=> (not res!783042) (not e!670087))))

(assert (=> b!1178695 (= res!783042 (not (= (select (arr!36731 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532532 () Unit!38938)

(declare-fun e!670085 () Unit!38938)

(assert (=> b!1178695 (= lt!532532 e!670085)))

(declare-fun c!116847 () Bool)

(assert (=> b!1178695 (= c!116847 (= (select (arr!36731 _keys!1208) from!1455) k0!934))))

(assert (=> b!1178695 e!670090))

(declare-fun res!783045 () Bool)

(assert (=> b!1178695 (=> (not res!783045) (not e!670090))))

(declare-fun lt!532530 () ListLongMap!17031)

(assert (=> b!1178695 (= res!783045 (= lt!532521 (+!3845 lt!532530 lt!532526)))))

(declare-fun get!18775 (ValueCell!14130 V!44699) V!44699)

(assert (=> b!1178695 (= lt!532526 (tuple2!19063 (select (arr!36731 _keys!1208) from!1455) (get!18775 (select (arr!36730 _values!996) from!1455) lt!532531)))))

(declare-fun b!1178696 () Bool)

(declare-fun res!783034 () Bool)

(assert (=> b!1178696 (=> (not res!783034) (not e!670091))))

(declare-datatypes ((List!25801 0))(
  ( (Nil!25798) (Cons!25797 (h!27006 (_ BitVec 64)) (t!37942 List!25801)) )
))
(declare-fun arrayNoDuplicates!0 (array!76163 (_ BitVec 32) List!25801) Bool)

(assert (=> b!1178696 (= res!783034 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25798))))

(declare-fun b!1178697 () Bool)

(declare-fun res!783044 () Bool)

(assert (=> b!1178697 (=> (not res!783044) (not e!670091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178697 (= res!783044 (validMask!0 mask!1564))))

(declare-fun b!1178698 () Bool)

(declare-fun Unit!38940 () Unit!38938)

(assert (=> b!1178698 (= e!670085 Unit!38940)))

(declare-fun b!1178699 () Bool)

(declare-fun res!783046 () Bool)

(assert (=> b!1178699 (=> (not res!783046) (not e!670088))))

(assert (=> b!1178699 (= res!783046 (arrayNoDuplicates!0 lt!532519 #b00000000000000000000000000000000 Nil!25798))))

(declare-fun b!1178700 () Bool)

(declare-fun res!783041 () Bool)

(assert (=> b!1178700 (=> (not res!783041) (not e!670091))))

(assert (=> b!1178700 (= res!783041 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37267 _keys!1208))))))

(declare-fun mapNonEmpty!46346 () Bool)

(declare-fun tp!88161 () Bool)

(declare-fun e!670092 () Bool)

(assert (=> mapNonEmpty!46346 (= mapRes!46346 (and tp!88161 e!670092))))

(declare-fun mapRest!46346 () (Array (_ BitVec 32) ValueCell!14130))

(declare-fun mapValue!46346 () ValueCell!14130)

(declare-fun mapKey!46346 () (_ BitVec 32))

(assert (=> mapNonEmpty!46346 (= (arr!36730 _values!996) (store mapRest!46346 mapKey!46346 mapValue!46346))))

(declare-fun b!1178701 () Bool)

(declare-fun res!783047 () Bool)

(assert (=> b!1178701 (=> (not res!783047) (not e!670091))))

(assert (=> b!1178701 (= res!783047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!783039 () Bool)

(assert (=> start!99570 (=> (not res!783039) (not e!670091))))

(assert (=> start!99570 (= res!783039 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37267 _keys!1208))))))

(assert (=> start!99570 e!670091))

(declare-fun tp_is_empty!29679 () Bool)

(assert (=> start!99570 tp_is_empty!29679))

(declare-fun array_inv!28046 (array!76163) Bool)

(assert (=> start!99570 (array_inv!28046 _keys!1208)))

(assert (=> start!99570 true))

(assert (=> start!99570 tp!88160))

(declare-fun array_inv!28047 (array!76161) Bool)

(assert (=> start!99570 (and (array_inv!28047 _values!996) e!670082)))

(declare-fun b!1178691 () Bool)

(assert (=> b!1178691 (= e!670086 tp_is_empty!29679)))

(declare-fun b!1178702 () Bool)

(declare-fun Unit!38941 () Unit!38938)

(assert (=> b!1178702 (= e!670085 Unit!38941)))

(declare-fun lt!532533 () Unit!38938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76163 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38938)

(assert (=> b!1178702 (= lt!532533 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178702 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532520 () Unit!38938)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76163 (_ BitVec 32) (_ BitVec 32)) Unit!38938)

(assert (=> b!1178702 (= lt!532520 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178702 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25798)))

(declare-fun lt!532527 () Unit!38938)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76163 (_ BitVec 64) (_ BitVec 32) List!25801) Unit!38938)

(assert (=> b!1178702 (= lt!532527 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25798))))

(assert (=> b!1178702 false))

(declare-fun b!1178703 () Bool)

(assert (=> b!1178703 (= e!670093 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178704 () Bool)

(assert (=> b!1178704 (= e!670081 e!670084)))

(declare-fun res!783049 () Bool)

(assert (=> b!1178704 (=> res!783049 e!670084)))

(assert (=> b!1178704 (= res!783049 (not (validKeyInArray!0 (select (arr!36731 _keys!1208) from!1455))))))

(declare-fun lt!532528 () ListLongMap!17031)

(assert (=> b!1178704 (= lt!532528 lt!532530)))

(declare-fun -!1577 (ListLongMap!17031 (_ BitVec 64)) ListLongMap!17031)

(assert (=> b!1178704 (= lt!532530 (-!1577 lt!532525 k0!934))))

(assert (=> b!1178704 (= lt!532528 (getCurrentListMapNoExtraKeys!4987 lt!532519 lt!532529 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178704 (= lt!532525 (getCurrentListMapNoExtraKeys!4987 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532522 () Unit!38938)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!804 (array!76163 array!76161 (_ BitVec 32) (_ BitVec 32) V!44699 V!44699 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38938)

(assert (=> b!1178704 (= lt!532522 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!804 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178705 () Bool)

(assert (=> b!1178705 (= e!670092 tp_is_empty!29679)))

(assert (= (and start!99570 res!783039) b!1178697))

(assert (= (and b!1178697 res!783044) b!1178693))

(assert (= (and b!1178693 res!783043) b!1178701))

(assert (= (and b!1178701 res!783047) b!1178696))

(assert (= (and b!1178696 res!783034) b!1178700))

(assert (= (and b!1178700 res!783041) b!1178692))

(assert (= (and b!1178692 res!783035) b!1178694))

(assert (= (and b!1178694 res!783048) b!1178689))

(assert (= (and b!1178689 res!783040) b!1178699))

(assert (= (and b!1178699 res!783046) b!1178690))

(assert (= (and b!1178690 (not res!783038)) b!1178686))

(assert (= (and b!1178686 (not res!783036)) b!1178704))

(assert (= (and b!1178704 (not res!783049)) b!1178695))

(assert (= (and b!1178695 res!783045) b!1178688))

(assert (= (and b!1178688 (not res!783037)) b!1178703))

(assert (= (and b!1178695 c!116847) b!1178702))

(assert (= (and b!1178695 (not c!116847)) b!1178698))

(assert (= (and b!1178695 res!783042) b!1178687))

(assert (= (and b!1178685 condMapEmpty!46346) mapIsEmpty!46346))

(assert (= (and b!1178685 (not condMapEmpty!46346)) mapNonEmpty!46346))

(get-info :version)

(assert (= (and mapNonEmpty!46346 ((_ is ValueCellFull!14130) mapValue!46346)) b!1178705))

(assert (= (and b!1178685 ((_ is ValueCellFull!14130) mapDefault!46346)) b!1178691))

(assert (= start!99570 b!1178685))

(declare-fun b_lambda!20293 () Bool)

(assert (=> (not b_lambda!20293) (not b!1178686)))

(declare-fun t!37940 () Bool)

(declare-fun tb!9961 () Bool)

(assert (=> (and start!99570 (= defaultEntry!1004 defaultEntry!1004) t!37940) tb!9961))

(declare-fun result!20489 () Bool)

(assert (=> tb!9961 (= result!20489 tp_is_empty!29679)))

(assert (=> b!1178686 t!37940))

(declare-fun b_and!41167 () Bool)

(assert (= b_and!41165 (and (=> t!37940 result!20489) b_and!41167)))

(declare-fun m!1086651 () Bool)

(assert (=> b!1178688 m!1086651))

(declare-fun m!1086653 () Bool)

(assert (=> b!1178697 m!1086653))

(assert (=> b!1178695 m!1086651))

(declare-fun m!1086655 () Bool)

(assert (=> b!1178695 m!1086655))

(declare-fun m!1086657 () Bool)

(assert (=> b!1178695 m!1086657))

(assert (=> b!1178695 m!1086657))

(declare-fun m!1086659 () Bool)

(assert (=> b!1178695 m!1086659))

(declare-fun m!1086661 () Bool)

(assert (=> b!1178704 m!1086661))

(declare-fun m!1086663 () Bool)

(assert (=> b!1178704 m!1086663))

(declare-fun m!1086665 () Bool)

(assert (=> b!1178704 m!1086665))

(assert (=> b!1178704 m!1086651))

(declare-fun m!1086667 () Bool)

(assert (=> b!1178704 m!1086667))

(declare-fun m!1086669 () Bool)

(assert (=> b!1178704 m!1086669))

(assert (=> b!1178704 m!1086651))

(declare-fun m!1086671 () Bool)

(assert (=> b!1178694 m!1086671))

(declare-fun m!1086673 () Bool)

(assert (=> b!1178703 m!1086673))

(declare-fun m!1086675 () Bool)

(assert (=> mapNonEmpty!46346 m!1086675))

(declare-fun m!1086677 () Bool)

(assert (=> b!1178690 m!1086677))

(declare-fun m!1086679 () Bool)

(assert (=> b!1178690 m!1086679))

(declare-fun m!1086681 () Bool)

(assert (=> b!1178692 m!1086681))

(declare-fun m!1086683 () Bool)

(assert (=> b!1178686 m!1086683))

(declare-fun m!1086685 () Bool)

(assert (=> b!1178686 m!1086685))

(declare-fun m!1086687 () Bool)

(assert (=> b!1178686 m!1086687))

(declare-fun m!1086689 () Bool)

(assert (=> b!1178686 m!1086689))

(declare-fun m!1086691 () Bool)

(assert (=> b!1178687 m!1086691))

(declare-fun m!1086693 () Bool)

(assert (=> b!1178689 m!1086693))

(declare-fun m!1086695 () Bool)

(assert (=> b!1178689 m!1086695))

(declare-fun m!1086697 () Bool)

(assert (=> b!1178696 m!1086697))

(declare-fun m!1086699 () Bool)

(assert (=> b!1178699 m!1086699))

(declare-fun m!1086701 () Bool)

(assert (=> b!1178701 m!1086701))

(declare-fun m!1086703 () Bool)

(assert (=> start!99570 m!1086703))

(declare-fun m!1086705 () Bool)

(assert (=> start!99570 m!1086705))

(declare-fun m!1086707 () Bool)

(assert (=> b!1178702 m!1086707))

(declare-fun m!1086709 () Bool)

(assert (=> b!1178702 m!1086709))

(declare-fun m!1086711 () Bool)

(assert (=> b!1178702 m!1086711))

(declare-fun m!1086713 () Bool)

(assert (=> b!1178702 m!1086713))

(declare-fun m!1086715 () Bool)

(assert (=> b!1178702 m!1086715))

(check-sat (not b!1178695) (not mapNonEmpty!46346) (not b!1178687) (not b!1178699) b_and!41167 (not b!1178703) (not b!1178701) (not b!1178692) (not b!1178686) (not start!99570) (not b!1178704) (not b!1178697) (not b_next!25149) (not b_lambda!20293) (not b!1178696) (not b!1178689) (not b!1178702) tp_is_empty!29679 (not b!1178690))
(check-sat b_and!41167 (not b_next!25149))
