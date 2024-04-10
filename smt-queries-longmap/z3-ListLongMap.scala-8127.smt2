; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99630 () Bool)

(assert start!99630)

(declare-fun b_free!25209 () Bool)

(declare-fun b_next!25209 () Bool)

(assert (=> start!99630 (= b_free!25209 (not b_next!25209))))

(declare-fun tp!88341 () Bool)

(declare-fun b_and!41285 () Bool)

(assert (=> start!99630 (= tp!88341 b_and!41285)))

(declare-fun b!1180685 () Bool)

(declare-fun res!784534 () Bool)

(declare-fun e!671255 () Bool)

(assert (=> b!1180685 (=> (not res!784534) (not e!671255))))

(declare-datatypes ((array!76281 0))(
  ( (array!76282 (arr!36790 (Array (_ BitVec 32) (_ BitVec 64))) (size!37326 (_ BitVec 32))) )
))
(declare-fun lt!533875 () array!76281)

(declare-datatypes ((List!25855 0))(
  ( (Nil!25852) (Cons!25851 (h!27060 (_ BitVec 64)) (t!38056 List!25855)) )
))
(declare-fun arrayNoDuplicates!0 (array!76281 (_ BitVec 32) List!25855) Bool)

(assert (=> b!1180685 (= res!784534 (arrayNoDuplicates!0 lt!533875 #b00000000000000000000000000000000 Nil!25852))))

(declare-fun b!1180686 () Bool)

(declare-fun e!671262 () Bool)

(declare-fun e!671256 () Bool)

(assert (=> b!1180686 (= e!671262 e!671256)))

(declare-fun res!784526 () Bool)

(assert (=> b!1180686 (=> res!784526 e!671256)))

(declare-fun _keys!1208 () array!76281)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1180686 (= res!784526 (not (= (select (arr!36790 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180687 () Bool)

(declare-fun res!784527 () Bool)

(declare-fun e!671258 () Bool)

(assert (=> b!1180687 (=> (not res!784527) (not e!671258))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180687 (= res!784527 (validMask!0 mask!1564))))

(declare-fun b!1180689 () Bool)

(assert (=> b!1180689 (= e!671258 e!671255)))

(declare-fun res!784530 () Bool)

(assert (=> b!1180689 (=> (not res!784530) (not e!671255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76281 (_ BitVec 32)) Bool)

(assert (=> b!1180689 (= res!784530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533875 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1180689 (= lt!533875 (array!76282 (store (arr!36790 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37326 _keys!1208)))))

(declare-fun mapNonEmpty!46436 () Bool)

(declare-fun mapRes!46436 () Bool)

(declare-fun tp!88340 () Bool)

(declare-fun e!671253 () Bool)

(assert (=> mapNonEmpty!46436 (= mapRes!46436 (and tp!88340 e!671253))))

(declare-datatypes ((V!44779 0))(
  ( (V!44780 (val!14926 Int)) )
))
(declare-datatypes ((ValueCell!14160 0))(
  ( (ValueCellFull!14160 (v!17564 V!44779)) (EmptyCell!14160) )
))
(declare-fun mapValue!46436 () ValueCell!14160)

(declare-fun mapRest!46436 () (Array (_ BitVec 32) ValueCell!14160))

(declare-fun mapKey!46436 () (_ BitVec 32))

(declare-datatypes ((array!76283 0))(
  ( (array!76284 (arr!36791 (Array (_ BitVec 32) ValueCell!14160)) (size!37327 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76283)

(assert (=> mapNonEmpty!46436 (= (arr!36791 _values!996) (store mapRest!46436 mapKey!46436 mapValue!46436))))

(declare-fun mapIsEmpty!46436 () Bool)

(assert (=> mapIsEmpty!46436 mapRes!46436))

(declare-fun b!1180690 () Bool)

(declare-fun res!784533 () Bool)

(assert (=> b!1180690 (=> (not res!784533) (not e!671258))))

(assert (=> b!1180690 (= res!784533 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25852))))

(declare-fun b!1180691 () Bool)

(declare-fun arrayContainsKey!0 (array!76281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180691 (= e!671256 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180692 () Bool)

(declare-fun e!671252 () Bool)

(declare-fun tp_is_empty!29739 () Bool)

(assert (=> b!1180692 (= e!671252 tp_is_empty!29739)))

(declare-fun b!1180693 () Bool)

(declare-fun res!784537 () Bool)

(assert (=> b!1180693 (=> (not res!784537) (not e!671258))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1180693 (= res!784537 (and (= (size!37327 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37326 _keys!1208) (size!37327 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180694 () Bool)

(declare-fun res!784529 () Bool)

(assert (=> b!1180694 (=> (not res!784529) (not e!671258))))

(assert (=> b!1180694 (= res!784529 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37326 _keys!1208))))))

(declare-fun b!1180695 () Bool)

(declare-fun e!671254 () Bool)

(assert (=> b!1180695 (= e!671254 true)))

(declare-fun e!671263 () Bool)

(assert (=> b!1180695 e!671263))

(declare-fun res!784525 () Bool)

(assert (=> b!1180695 (=> (not res!784525) (not e!671263))))

(assert (=> b!1180695 (= res!784525 (not (= (select (arr!36790 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!39033 0))(
  ( (Unit!39034) )
))
(declare-fun lt!533872 () Unit!39033)

(declare-fun e!671257 () Unit!39033)

(assert (=> b!1180695 (= lt!533872 e!671257)))

(declare-fun c!116937 () Bool)

(assert (=> b!1180695 (= c!116937 (= (select (arr!36790 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180695 e!671262))

(declare-fun res!784540 () Bool)

(assert (=> b!1180695 (=> (not res!784540) (not e!671262))))

(declare-datatypes ((tuple2!19116 0))(
  ( (tuple2!19117 (_1!9569 (_ BitVec 64)) (_2!9569 V!44779)) )
))
(declare-fun lt!533876 () tuple2!19116)

(declare-datatypes ((List!25856 0))(
  ( (Nil!25853) (Cons!25852 (h!27061 tuple2!19116) (t!38057 List!25856)) )
))
(declare-datatypes ((ListLongMap!17085 0))(
  ( (ListLongMap!17086 (toList!8558 List!25856)) )
))
(declare-fun lt!533873 () ListLongMap!17085)

(declare-fun lt!533882 () ListLongMap!17085)

(declare-fun +!3867 (ListLongMap!17085 tuple2!19116) ListLongMap!17085)

(assert (=> b!1180695 (= res!784540 (= lt!533873 (+!3867 lt!533882 lt!533876)))))

(declare-fun lt!533869 () V!44779)

(declare-fun get!18814 (ValueCell!14160 V!44779) V!44779)

(assert (=> b!1180695 (= lt!533876 (tuple2!19117 (select (arr!36790 _keys!1208) from!1455) (get!18814 (select (arr!36791 _values!996) from!1455) lt!533869)))))

(declare-fun b!1180696 () Bool)

(declare-fun res!784536 () Bool)

(assert (=> b!1180696 (=> (not res!784536) (not e!671258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180696 (= res!784536 (validKeyInArray!0 k0!934))))

(declare-fun b!1180697 () Bool)

(declare-fun lt!533878 () ListLongMap!17085)

(assert (=> b!1180697 (= e!671263 (= lt!533882 lt!533878))))

(declare-fun b!1180698 () Bool)

(declare-fun e!671260 () Bool)

(assert (=> b!1180698 (= e!671255 (not e!671260))))

(declare-fun res!784535 () Bool)

(assert (=> b!1180698 (=> res!784535 e!671260)))

(assert (=> b!1180698 (= res!784535 (bvsgt from!1455 i!673))))

(assert (=> b!1180698 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533883 () Unit!39033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76281 (_ BitVec 64) (_ BitVec 32)) Unit!39033)

(assert (=> b!1180698 (= lt!533883 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180699 () Bool)

(assert (=> b!1180699 (= e!671253 tp_is_empty!29739)))

(declare-fun b!1180700 () Bool)

(declare-fun Unit!39035 () Unit!39033)

(assert (=> b!1180700 (= e!671257 Unit!39035)))

(declare-fun b!1180701 () Bool)

(declare-fun res!784532 () Bool)

(assert (=> b!1180701 (=> (not res!784532) (not e!671258))))

(assert (=> b!1180701 (= res!784532 (= (select (arr!36790 _keys!1208) i!673) k0!934))))

(declare-fun b!1180702 () Bool)

(declare-fun e!671259 () Bool)

(assert (=> b!1180702 (= e!671259 (and e!671252 mapRes!46436))))

(declare-fun condMapEmpty!46436 () Bool)

(declare-fun mapDefault!46436 () ValueCell!14160)

(assert (=> b!1180702 (= condMapEmpty!46436 (= (arr!36791 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14160)) mapDefault!46436)))))

(declare-fun b!1180688 () Bool)

(declare-fun res!784528 () Bool)

(assert (=> b!1180688 (=> (not res!784528) (not e!671258))))

(assert (=> b!1180688 (= res!784528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!784538 () Bool)

(assert (=> start!99630 (=> (not res!784538) (not e!671258))))

(assert (=> start!99630 (= res!784538 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37326 _keys!1208))))))

(assert (=> start!99630 e!671258))

(assert (=> start!99630 tp_is_empty!29739))

(declare-fun array_inv!28090 (array!76281) Bool)

(assert (=> start!99630 (array_inv!28090 _keys!1208)))

(assert (=> start!99630 true))

(assert (=> start!99630 tp!88341))

(declare-fun array_inv!28091 (array!76283) Bool)

(assert (=> start!99630 (and (array_inv!28091 _values!996) e!671259)))

(declare-fun b!1180703 () Bool)

(declare-fun e!671261 () Bool)

(assert (=> b!1180703 (= e!671260 e!671261)))

(declare-fun res!784531 () Bool)

(assert (=> b!1180703 (=> res!784531 e!671261)))

(assert (=> b!1180703 (= res!784531 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44779)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44779)

(declare-fun lt!533871 () array!76283)

(declare-fun getCurrentListMapNoExtraKeys!5012 (array!76281 array!76283 (_ BitVec 32) (_ BitVec 32) V!44779 V!44779 (_ BitVec 32) Int) ListLongMap!17085)

(assert (=> b!1180703 (= lt!533873 (getCurrentListMapNoExtraKeys!5012 lt!533875 lt!533871 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1180703 (= lt!533871 (array!76284 (store (arr!36791 _values!996) i!673 (ValueCellFull!14160 lt!533869)) (size!37327 _values!996)))))

(declare-fun dynLambda!2969 (Int (_ BitVec 64)) V!44779)

(assert (=> b!1180703 (= lt!533869 (dynLambda!2969 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533874 () ListLongMap!17085)

(assert (=> b!1180703 (= lt!533874 (getCurrentListMapNoExtraKeys!5012 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180704 () Bool)

(assert (=> b!1180704 (= e!671261 e!671254)))

(declare-fun res!784539 () Bool)

(assert (=> b!1180704 (=> res!784539 e!671254)))

(assert (=> b!1180704 (= res!784539 (not (validKeyInArray!0 (select (arr!36790 _keys!1208) from!1455))))))

(assert (=> b!1180704 (= lt!533878 lt!533882)))

(declare-fun lt!533879 () ListLongMap!17085)

(declare-fun -!1599 (ListLongMap!17085 (_ BitVec 64)) ListLongMap!17085)

(assert (=> b!1180704 (= lt!533882 (-!1599 lt!533879 k0!934))))

(assert (=> b!1180704 (= lt!533878 (getCurrentListMapNoExtraKeys!5012 lt!533875 lt!533871 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180704 (= lt!533879 (getCurrentListMapNoExtraKeys!5012 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533870 () Unit!39033)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!826 (array!76281 array!76283 (_ BitVec 32) (_ BitVec 32) V!44779 V!44779 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39033)

(assert (=> b!1180704 (= lt!533870 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180705 () Bool)

(declare-fun res!784524 () Bool)

(assert (=> b!1180705 (=> (not res!784524) (not e!671263))))

(assert (=> b!1180705 (= res!784524 (= lt!533874 (+!3867 lt!533879 lt!533876)))))

(declare-fun b!1180706 () Bool)

(declare-fun Unit!39036 () Unit!39033)

(assert (=> b!1180706 (= e!671257 Unit!39036)))

(declare-fun lt!533880 () Unit!39033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39033)

(assert (=> b!1180706 (= lt!533880 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1180706 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533881 () Unit!39033)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76281 (_ BitVec 32) (_ BitVec 32)) Unit!39033)

(assert (=> b!1180706 (= lt!533881 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1180706 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25852)))

(declare-fun lt!533877 () Unit!39033)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76281 (_ BitVec 64) (_ BitVec 32) List!25855) Unit!39033)

(assert (=> b!1180706 (= lt!533877 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25852))))

(assert (=> b!1180706 false))

(assert (= (and start!99630 res!784538) b!1180687))

(assert (= (and b!1180687 res!784527) b!1180693))

(assert (= (and b!1180693 res!784537) b!1180688))

(assert (= (and b!1180688 res!784528) b!1180690))

(assert (= (and b!1180690 res!784533) b!1180694))

(assert (= (and b!1180694 res!784529) b!1180696))

(assert (= (and b!1180696 res!784536) b!1180701))

(assert (= (and b!1180701 res!784532) b!1180689))

(assert (= (and b!1180689 res!784530) b!1180685))

(assert (= (and b!1180685 res!784534) b!1180698))

(assert (= (and b!1180698 (not res!784535)) b!1180703))

(assert (= (and b!1180703 (not res!784531)) b!1180704))

(assert (= (and b!1180704 (not res!784539)) b!1180695))

(assert (= (and b!1180695 res!784540) b!1180686))

(assert (= (and b!1180686 (not res!784526)) b!1180691))

(assert (= (and b!1180695 c!116937) b!1180706))

(assert (= (and b!1180695 (not c!116937)) b!1180700))

(assert (= (and b!1180695 res!784525) b!1180705))

(assert (= (and b!1180705 res!784524) b!1180697))

(assert (= (and b!1180702 condMapEmpty!46436) mapIsEmpty!46436))

(assert (= (and b!1180702 (not condMapEmpty!46436)) mapNonEmpty!46436))

(get-info :version)

(assert (= (and mapNonEmpty!46436 ((_ is ValueCellFull!14160) mapValue!46436)) b!1180699))

(assert (= (and b!1180702 ((_ is ValueCellFull!14160) mapDefault!46436)) b!1180692))

(assert (= start!99630 b!1180702))

(declare-fun b_lambda!20353 () Bool)

(assert (=> (not b_lambda!20353) (not b!1180703)))

(declare-fun t!38055 () Bool)

(declare-fun tb!10021 () Bool)

(assert (=> (and start!99630 (= defaultEntry!1004 defaultEntry!1004) t!38055) tb!10021))

(declare-fun result!20609 () Bool)

(assert (=> tb!10021 (= result!20609 tp_is_empty!29739)))

(assert (=> b!1180703 t!38055))

(declare-fun b_and!41287 () Bool)

(assert (= b_and!41285 (and (=> t!38055 result!20609) b_and!41287)))

(declare-fun m!1088631 () Bool)

(assert (=> b!1180705 m!1088631))

(declare-fun m!1088633 () Bool)

(assert (=> b!1180690 m!1088633))

(declare-fun m!1088635 () Bool)

(assert (=> b!1180706 m!1088635))

(declare-fun m!1088637 () Bool)

(assert (=> b!1180706 m!1088637))

(declare-fun m!1088639 () Bool)

(assert (=> b!1180706 m!1088639))

(declare-fun m!1088641 () Bool)

(assert (=> b!1180706 m!1088641))

(declare-fun m!1088643 () Bool)

(assert (=> b!1180706 m!1088643))

(declare-fun m!1088645 () Bool)

(assert (=> b!1180685 m!1088645))

(declare-fun m!1088647 () Bool)

(assert (=> b!1180688 m!1088647))

(declare-fun m!1088649 () Bool)

(assert (=> b!1180687 m!1088649))

(declare-fun m!1088651 () Bool)

(assert (=> b!1180703 m!1088651))

(declare-fun m!1088653 () Bool)

(assert (=> b!1180703 m!1088653))

(declare-fun m!1088655 () Bool)

(assert (=> b!1180703 m!1088655))

(declare-fun m!1088657 () Bool)

(assert (=> b!1180703 m!1088657))

(declare-fun m!1088659 () Bool)

(assert (=> b!1180698 m!1088659))

(declare-fun m!1088661 () Bool)

(assert (=> b!1180698 m!1088661))

(declare-fun m!1088663 () Bool)

(assert (=> b!1180691 m!1088663))

(declare-fun m!1088665 () Bool)

(assert (=> b!1180696 m!1088665))

(declare-fun m!1088667 () Bool)

(assert (=> b!1180704 m!1088667))

(declare-fun m!1088669 () Bool)

(assert (=> b!1180704 m!1088669))

(declare-fun m!1088671 () Bool)

(assert (=> b!1180704 m!1088671))

(declare-fun m!1088673 () Bool)

(assert (=> b!1180704 m!1088673))

(assert (=> b!1180704 m!1088671))

(declare-fun m!1088675 () Bool)

(assert (=> b!1180704 m!1088675))

(declare-fun m!1088677 () Bool)

(assert (=> b!1180704 m!1088677))

(assert (=> b!1180686 m!1088671))

(assert (=> b!1180695 m!1088671))

(declare-fun m!1088679 () Bool)

(assert (=> b!1180695 m!1088679))

(declare-fun m!1088681 () Bool)

(assert (=> b!1180695 m!1088681))

(assert (=> b!1180695 m!1088681))

(declare-fun m!1088683 () Bool)

(assert (=> b!1180695 m!1088683))

(declare-fun m!1088685 () Bool)

(assert (=> mapNonEmpty!46436 m!1088685))

(declare-fun m!1088687 () Bool)

(assert (=> start!99630 m!1088687))

(declare-fun m!1088689 () Bool)

(assert (=> start!99630 m!1088689))

(declare-fun m!1088691 () Bool)

(assert (=> b!1180701 m!1088691))

(declare-fun m!1088693 () Bool)

(assert (=> b!1180689 m!1088693))

(declare-fun m!1088695 () Bool)

(assert (=> b!1180689 m!1088695))

(check-sat (not b!1180698) (not b!1180685) (not b!1180705) (not start!99630) (not b!1180690) (not b!1180689) (not mapNonEmpty!46436) (not b!1180687) (not b!1180696) (not b!1180706) (not b!1180688) b_and!41287 (not b_next!25209) (not b!1180704) (not b!1180695) (not b!1180703) (not b!1180691) tp_is_empty!29739 (not b_lambda!20353))
(check-sat b_and!41287 (not b_next!25209))
