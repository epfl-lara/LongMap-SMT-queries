; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99886 () Bool)

(assert start!99886)

(declare-fun b_free!25471 () Bool)

(declare-fun b_next!25471 () Bool)

(assert (=> start!99886 (= b_free!25471 (not b_next!25471))))

(declare-fun tp!89127 () Bool)

(declare-fun b_and!41787 () Bool)

(assert (=> start!99886 (= tp!89127 b_and!41787)))

(declare-fun b!1188618 () Bool)

(declare-fun res!790353 () Bool)

(declare-fun e!675819 () Bool)

(assert (=> b!1188618 (=> (not res!790353) (not e!675819))))

(declare-datatypes ((array!76734 0))(
  ( (array!76735 (arr!37017 (Array (_ BitVec 32) (_ BitVec 64))) (size!37555 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76734)

(declare-datatypes ((List!26164 0))(
  ( (Nil!26161) (Cons!26160 (h!27369 (_ BitVec 64)) (t!38618 List!26164)) )
))
(declare-fun arrayNoDuplicates!0 (array!76734 (_ BitVec 32) List!26164) Bool)

(assert (=> b!1188618 (= res!790353 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26161))))

(declare-fun b!1188619 () Bool)

(declare-fun res!790348 () Bool)

(assert (=> b!1188619 (=> (not res!790348) (not e!675819))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188619 (= res!790348 (validKeyInArray!0 k0!934))))

(declare-fun b!1188620 () Bool)

(declare-fun e!675814 () Bool)

(assert (=> b!1188620 (= e!675819 e!675814)))

(declare-fun res!790354 () Bool)

(assert (=> b!1188620 (=> (not res!790354) (not e!675814))))

(declare-fun lt!540607 () array!76734)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76734 (_ BitVec 32)) Bool)

(assert (=> b!1188620 (= res!790354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540607 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188620 (= lt!540607 (array!76735 (store (arr!37017 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37555 _keys!1208)))))

(declare-fun b!1188621 () Bool)

(declare-fun res!790349 () Bool)

(assert (=> b!1188621 (=> (not res!790349) (not e!675819))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45129 0))(
  ( (V!45130 (val!15057 Int)) )
))
(declare-datatypes ((ValueCell!14291 0))(
  ( (ValueCellFull!14291 (v!17694 V!45129)) (EmptyCell!14291) )
))
(declare-datatypes ((array!76736 0))(
  ( (array!76737 (arr!37018 (Array (_ BitVec 32) ValueCell!14291)) (size!37556 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76736)

(assert (=> b!1188621 (= res!790349 (and (= (size!37556 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37555 _keys!1208) (size!37556 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188622 () Bool)

(declare-fun res!790352 () Bool)

(assert (=> b!1188622 (=> (not res!790352) (not e!675814))))

(assert (=> b!1188622 (= res!790352 (arrayNoDuplicates!0 lt!540607 #b00000000000000000000000000000000 Nil!26161))))

(declare-fun mapNonEmpty!46829 () Bool)

(declare-fun mapRes!46829 () Bool)

(declare-fun tp!89126 () Bool)

(declare-fun e!675818 () Bool)

(assert (=> mapNonEmpty!46829 (= mapRes!46829 (and tp!89126 e!675818))))

(declare-fun mapRest!46829 () (Array (_ BitVec 32) ValueCell!14291))

(declare-fun mapKey!46829 () (_ BitVec 32))

(declare-fun mapValue!46829 () ValueCell!14291)

(assert (=> mapNonEmpty!46829 (= (arr!37018 _values!996) (store mapRest!46829 mapKey!46829 mapValue!46829))))

(declare-fun b!1188623 () Bool)

(declare-fun res!790357 () Bool)

(assert (=> b!1188623 (=> (not res!790357) (not e!675819))))

(assert (=> b!1188623 (= res!790357 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37555 _keys!1208))))))

(declare-fun b!1188624 () Bool)

(declare-fun e!675817 () Bool)

(declare-fun e!675820 () Bool)

(assert (=> b!1188624 (= e!675817 e!675820)))

(declare-fun res!790350 () Bool)

(assert (=> b!1188624 (=> res!790350 e!675820)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188624 (= res!790350 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45129)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45129)

(declare-fun lt!540608 () array!76736)

(declare-datatypes ((tuple2!19452 0))(
  ( (tuple2!19453 (_1!9737 (_ BitVec 64)) (_2!9737 V!45129)) )
))
(declare-datatypes ((List!26165 0))(
  ( (Nil!26162) (Cons!26161 (h!27370 tuple2!19452) (t!38619 List!26165)) )
))
(declare-datatypes ((ListLongMap!17421 0))(
  ( (ListLongMap!17422 (toList!8726 List!26165)) )
))
(declare-fun lt!540611 () ListLongMap!17421)

(declare-fun getCurrentListMapNoExtraKeys!5176 (array!76734 array!76736 (_ BitVec 32) (_ BitVec 32) V!45129 V!45129 (_ BitVec 32) Int) ListLongMap!17421)

(assert (=> b!1188624 (= lt!540611 (getCurrentListMapNoExtraKeys!5176 lt!540607 lt!540608 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3072 (Int (_ BitVec 64)) V!45129)

(assert (=> b!1188624 (= lt!540608 (array!76737 (store (arr!37018 _values!996) i!673 (ValueCellFull!14291 (dynLambda!3072 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37556 _values!996)))))

(declare-fun lt!540610 () ListLongMap!17421)

(assert (=> b!1188624 (= lt!540610 (getCurrentListMapNoExtraKeys!5176 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188625 () Bool)

(declare-fun tp_is_empty!30001 () Bool)

(assert (=> b!1188625 (= e!675818 tp_is_empty!30001)))

(declare-fun b!1188626 () Bool)

(declare-fun res!790355 () Bool)

(assert (=> b!1188626 (=> (not res!790355) (not e!675819))))

(assert (=> b!1188626 (= res!790355 (= (select (arr!37017 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46829 () Bool)

(assert (=> mapIsEmpty!46829 mapRes!46829))

(declare-fun b!1188627 () Bool)

(declare-fun e!675816 () Bool)

(declare-fun e!675815 () Bool)

(assert (=> b!1188627 (= e!675816 (and e!675815 mapRes!46829))))

(declare-fun condMapEmpty!46829 () Bool)

(declare-fun mapDefault!46829 () ValueCell!14291)

(assert (=> b!1188627 (= condMapEmpty!46829 (= (arr!37018 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14291)) mapDefault!46829)))))

(declare-fun b!1188628 () Bool)

(declare-fun res!790347 () Bool)

(assert (=> b!1188628 (=> (not res!790347) (not e!675819))))

(assert (=> b!1188628 (= res!790347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188629 () Bool)

(declare-fun res!790356 () Bool)

(assert (=> b!1188629 (=> (not res!790356) (not e!675819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188629 (= res!790356 (validMask!0 mask!1564))))

(declare-fun res!790351 () Bool)

(assert (=> start!99886 (=> (not res!790351) (not e!675819))))

(assert (=> start!99886 (= res!790351 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37555 _keys!1208))))))

(assert (=> start!99886 e!675819))

(assert (=> start!99886 tp_is_empty!30001))

(declare-fun array_inv!28352 (array!76734) Bool)

(assert (=> start!99886 (array_inv!28352 _keys!1208)))

(assert (=> start!99886 true))

(assert (=> start!99886 tp!89127))

(declare-fun array_inv!28353 (array!76736) Bool)

(assert (=> start!99886 (and (array_inv!28353 _values!996) e!675816)))

(declare-fun b!1188630 () Bool)

(assert (=> b!1188630 (= e!675820 true)))

(declare-fun -!1674 (ListLongMap!17421 (_ BitVec 64)) ListLongMap!17421)

(assert (=> b!1188630 (= (getCurrentListMapNoExtraKeys!5176 lt!540607 lt!540608 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1674 (getCurrentListMapNoExtraKeys!5176 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39309 0))(
  ( (Unit!39310) )
))
(declare-fun lt!540612 () Unit!39309)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!924 (array!76734 array!76736 (_ BitVec 32) (_ BitVec 32) V!45129 V!45129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39309)

(assert (=> b!1188630 (= lt!540612 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!924 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188631 () Bool)

(assert (=> b!1188631 (= e!675815 tp_is_empty!30001)))

(declare-fun b!1188632 () Bool)

(assert (=> b!1188632 (= e!675814 (not e!675817))))

(declare-fun res!790346 () Bool)

(assert (=> b!1188632 (=> res!790346 e!675817)))

(assert (=> b!1188632 (= res!790346 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188632 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540609 () Unit!39309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76734 (_ BitVec 64) (_ BitVec 32)) Unit!39309)

(assert (=> b!1188632 (= lt!540609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99886 res!790351) b!1188629))

(assert (= (and b!1188629 res!790356) b!1188621))

(assert (= (and b!1188621 res!790349) b!1188628))

(assert (= (and b!1188628 res!790347) b!1188618))

(assert (= (and b!1188618 res!790353) b!1188623))

(assert (= (and b!1188623 res!790357) b!1188619))

(assert (= (and b!1188619 res!790348) b!1188626))

(assert (= (and b!1188626 res!790355) b!1188620))

(assert (= (and b!1188620 res!790354) b!1188622))

(assert (= (and b!1188622 res!790352) b!1188632))

(assert (= (and b!1188632 (not res!790346)) b!1188624))

(assert (= (and b!1188624 (not res!790350)) b!1188630))

(assert (= (and b!1188627 condMapEmpty!46829) mapIsEmpty!46829))

(assert (= (and b!1188627 (not condMapEmpty!46829)) mapNonEmpty!46829))

(get-info :version)

(assert (= (and mapNonEmpty!46829 ((_ is ValueCellFull!14291) mapValue!46829)) b!1188625))

(assert (= (and b!1188627 ((_ is ValueCellFull!14291) mapDefault!46829)) b!1188631))

(assert (= start!99886 b!1188627))

(declare-fun b_lambda!20597 () Bool)

(assert (=> (not b_lambda!20597) (not b!1188624)))

(declare-fun t!38617 () Bool)

(declare-fun tb!10275 () Bool)

(assert (=> (and start!99886 (= defaultEntry!1004 defaultEntry!1004) t!38617) tb!10275))

(declare-fun result!21125 () Bool)

(assert (=> tb!10275 (= result!21125 tp_is_empty!30001)))

(assert (=> b!1188624 t!38617))

(declare-fun b_and!41789 () Bool)

(assert (= b_and!41787 (and (=> t!38617 result!21125) b_and!41789)))

(declare-fun m!1096883 () Bool)

(assert (=> b!1188629 m!1096883))

(declare-fun m!1096885 () Bool)

(assert (=> b!1188632 m!1096885))

(declare-fun m!1096887 () Bool)

(assert (=> b!1188632 m!1096887))

(declare-fun m!1096889 () Bool)

(assert (=> b!1188628 m!1096889))

(declare-fun m!1096891 () Bool)

(assert (=> b!1188624 m!1096891))

(declare-fun m!1096893 () Bool)

(assert (=> b!1188624 m!1096893))

(declare-fun m!1096895 () Bool)

(assert (=> b!1188624 m!1096895))

(declare-fun m!1096897 () Bool)

(assert (=> b!1188624 m!1096897))

(declare-fun m!1096899 () Bool)

(assert (=> b!1188619 m!1096899))

(declare-fun m!1096901 () Bool)

(assert (=> start!99886 m!1096901))

(declare-fun m!1096903 () Bool)

(assert (=> start!99886 m!1096903))

(declare-fun m!1096905 () Bool)

(assert (=> b!1188620 m!1096905))

(declare-fun m!1096907 () Bool)

(assert (=> b!1188620 m!1096907))

(declare-fun m!1096909 () Bool)

(assert (=> b!1188618 m!1096909))

(declare-fun m!1096911 () Bool)

(assert (=> mapNonEmpty!46829 m!1096911))

(declare-fun m!1096913 () Bool)

(assert (=> b!1188630 m!1096913))

(declare-fun m!1096915 () Bool)

(assert (=> b!1188630 m!1096915))

(assert (=> b!1188630 m!1096915))

(declare-fun m!1096917 () Bool)

(assert (=> b!1188630 m!1096917))

(declare-fun m!1096919 () Bool)

(assert (=> b!1188630 m!1096919))

(declare-fun m!1096921 () Bool)

(assert (=> b!1188626 m!1096921))

(declare-fun m!1096923 () Bool)

(assert (=> b!1188622 m!1096923))

(check-sat tp_is_empty!30001 (not b!1188618) (not b!1188629) (not mapNonEmpty!46829) (not b_lambda!20597) (not start!99886) (not b!1188620) b_and!41789 (not b!1188628) (not b_next!25471) (not b!1188624) (not b!1188622) (not b!1188619) (not b!1188632) (not b!1188630))
(check-sat b_and!41789 (not b_next!25471))
