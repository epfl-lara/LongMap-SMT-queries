; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99190 () Bool)

(assert start!99190)

(declare-fun b_free!24795 () Bool)

(declare-fun b_next!24795 () Bool)

(assert (=> start!99190 (= b_free!24795 (not b_next!24795))))

(declare-fun tp!87095 () Bool)

(declare-fun b_and!40439 () Bool)

(assert (=> start!99190 (= tp!87095 b_and!40439)))

(declare-fun b!1167736 () Bool)

(declare-fun res!774695 () Bool)

(declare-fun e!663698 () Bool)

(assert (=> b!1167736 (=> (not res!774695) (not e!663698))))

(declare-datatypes ((array!75473 0))(
  ( (array!75474 (arr!36387 (Array (_ BitVec 32) (_ BitVec 64))) (size!36923 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75473)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75473 (_ BitVec 32)) Bool)

(assert (=> b!1167736 (= res!774695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167737 () Bool)

(declare-fun res!774687 () Bool)

(assert (=> b!1167737 (=> (not res!774687) (not e!663698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167737 (= res!774687 (validMask!0 mask!1564))))

(declare-fun b!1167738 () Bool)

(declare-fun e!663704 () Bool)

(declare-fun tp_is_empty!29325 () Bool)

(assert (=> b!1167738 (= e!663704 tp_is_empty!29325)))

(declare-fun b!1167739 () Bool)

(declare-fun res!774686 () Bool)

(assert (=> b!1167739 (=> (not res!774686) (not e!663698))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167739 (= res!774686 (= (select (arr!36387 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45812 () Bool)

(declare-fun mapRes!45812 () Bool)

(declare-fun tp!87096 () Bool)

(assert (=> mapNonEmpty!45812 (= mapRes!45812 (and tp!87096 e!663704))))

(declare-datatypes ((V!44227 0))(
  ( (V!44228 (val!14719 Int)) )
))
(declare-datatypes ((ValueCell!13953 0))(
  ( (ValueCellFull!13953 (v!17356 V!44227)) (EmptyCell!13953) )
))
(declare-fun mapRest!45812 () (Array (_ BitVec 32) ValueCell!13953))

(declare-fun mapValue!45812 () ValueCell!13953)

(declare-datatypes ((array!75475 0))(
  ( (array!75476 (arr!36388 (Array (_ BitVec 32) ValueCell!13953)) (size!36924 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75475)

(declare-fun mapKey!45812 () (_ BitVec 32))

(assert (=> mapNonEmpty!45812 (= (arr!36388 _values!996) (store mapRest!45812 mapKey!45812 mapValue!45812))))

(declare-fun b!1167740 () Bool)

(declare-fun res!774689 () Bool)

(assert (=> b!1167740 (=> (not res!774689) (not e!663698))))

(declare-datatypes ((List!25518 0))(
  ( (Nil!25515) (Cons!25514 (h!26723 (_ BitVec 64)) (t!37305 List!25518)) )
))
(declare-fun arrayNoDuplicates!0 (array!75473 (_ BitVec 32) List!25518) Bool)

(assert (=> b!1167740 (= res!774689 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25515))))

(declare-fun b!1167741 () Bool)

(declare-fun res!774684 () Bool)

(declare-fun e!663699 () Bool)

(assert (=> b!1167741 (=> (not res!774684) (not e!663699))))

(declare-fun lt!525749 () array!75473)

(assert (=> b!1167741 (= res!774684 (arrayNoDuplicates!0 lt!525749 #b00000000000000000000000000000000 Nil!25515))))

(declare-fun b!1167742 () Bool)

(declare-fun e!663701 () Bool)

(assert (=> b!1167742 (= e!663701 true)))

(declare-fun zeroValue!944 () V!44227)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!525751 () array!75475)

(declare-fun minValue!944 () V!44227)

(declare-datatypes ((tuple2!18778 0))(
  ( (tuple2!18779 (_1!9400 (_ BitVec 64)) (_2!9400 V!44227)) )
))
(declare-datatypes ((List!25519 0))(
  ( (Nil!25516) (Cons!25515 (h!26724 tuple2!18778) (t!37306 List!25519)) )
))
(declare-datatypes ((ListLongMap!16747 0))(
  ( (ListLongMap!16748 (toList!8389 List!25519)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4853 (array!75473 array!75475 (_ BitVec 32) (_ BitVec 32) V!44227 V!44227 (_ BitVec 32) Int) ListLongMap!16747)

(declare-fun -!1464 (ListLongMap!16747 (_ BitVec 64)) ListLongMap!16747)

(assert (=> b!1167742 (= (getCurrentListMapNoExtraKeys!4853 lt!525749 lt!525751 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1464 (getCurrentListMapNoExtraKeys!4853 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38530 0))(
  ( (Unit!38531) )
))
(declare-fun lt!525752 () Unit!38530)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!691 (array!75473 array!75475 (_ BitVec 32) (_ BitVec 32) V!44227 V!44227 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38530)

(assert (=> b!1167742 (= lt!525752 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!691 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167743 () Bool)

(declare-fun res!774685 () Bool)

(assert (=> b!1167743 (=> (not res!774685) (not e!663698))))

(assert (=> b!1167743 (= res!774685 (and (= (size!36924 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36923 _keys!1208) (size!36924 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167744 () Bool)

(declare-fun e!663705 () Bool)

(assert (=> b!1167744 (= e!663705 tp_is_empty!29325)))

(declare-fun b!1167745 () Bool)

(declare-fun e!663702 () Bool)

(assert (=> b!1167745 (= e!663702 e!663701)))

(declare-fun res!774690 () Bool)

(assert (=> b!1167745 (=> res!774690 e!663701)))

(assert (=> b!1167745 (= res!774690 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525750 () ListLongMap!16747)

(assert (=> b!1167745 (= lt!525750 (getCurrentListMapNoExtraKeys!4853 lt!525749 lt!525751 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2834 (Int (_ BitVec 64)) V!44227)

(assert (=> b!1167745 (= lt!525751 (array!75476 (store (arr!36388 _values!996) i!673 (ValueCellFull!13953 (dynLambda!2834 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36924 _values!996)))))

(declare-fun lt!525748 () ListLongMap!16747)

(assert (=> b!1167745 (= lt!525748 (getCurrentListMapNoExtraKeys!4853 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167746 () Bool)

(declare-fun res!774693 () Bool)

(assert (=> b!1167746 (=> (not res!774693) (not e!663698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167746 (= res!774693 (validKeyInArray!0 k0!934))))

(declare-fun b!1167747 () Bool)

(assert (=> b!1167747 (= e!663698 e!663699)))

(declare-fun res!774692 () Bool)

(assert (=> b!1167747 (=> (not res!774692) (not e!663699))))

(assert (=> b!1167747 (= res!774692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525749 mask!1564))))

(assert (=> b!1167747 (= lt!525749 (array!75474 (store (arr!36387 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36923 _keys!1208)))))

(declare-fun res!774694 () Bool)

(assert (=> start!99190 (=> (not res!774694) (not e!663698))))

(assert (=> start!99190 (= res!774694 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36923 _keys!1208))))))

(assert (=> start!99190 e!663698))

(assert (=> start!99190 tp_is_empty!29325))

(declare-fun array_inv!27816 (array!75473) Bool)

(assert (=> start!99190 (array_inv!27816 _keys!1208)))

(assert (=> start!99190 true))

(assert (=> start!99190 tp!87095))

(declare-fun e!663703 () Bool)

(declare-fun array_inv!27817 (array!75475) Bool)

(assert (=> start!99190 (and (array_inv!27817 _values!996) e!663703)))

(declare-fun b!1167748 () Bool)

(assert (=> b!1167748 (= e!663699 (not e!663702))))

(declare-fun res!774688 () Bool)

(assert (=> b!1167748 (=> res!774688 e!663702)))

(assert (=> b!1167748 (= res!774688 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167748 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525753 () Unit!38530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75473 (_ BitVec 64) (_ BitVec 32)) Unit!38530)

(assert (=> b!1167748 (= lt!525753 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167749 () Bool)

(assert (=> b!1167749 (= e!663703 (and e!663705 mapRes!45812))))

(declare-fun condMapEmpty!45812 () Bool)

(declare-fun mapDefault!45812 () ValueCell!13953)

(assert (=> b!1167749 (= condMapEmpty!45812 (= (arr!36388 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13953)) mapDefault!45812)))))

(declare-fun b!1167750 () Bool)

(declare-fun res!774691 () Bool)

(assert (=> b!1167750 (=> (not res!774691) (not e!663698))))

(assert (=> b!1167750 (= res!774691 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36923 _keys!1208))))))

(declare-fun mapIsEmpty!45812 () Bool)

(assert (=> mapIsEmpty!45812 mapRes!45812))

(assert (= (and start!99190 res!774694) b!1167737))

(assert (= (and b!1167737 res!774687) b!1167743))

(assert (= (and b!1167743 res!774685) b!1167736))

(assert (= (and b!1167736 res!774695) b!1167740))

(assert (= (and b!1167740 res!774689) b!1167750))

(assert (= (and b!1167750 res!774691) b!1167746))

(assert (= (and b!1167746 res!774693) b!1167739))

(assert (= (and b!1167739 res!774686) b!1167747))

(assert (= (and b!1167747 res!774692) b!1167741))

(assert (= (and b!1167741 res!774684) b!1167748))

(assert (= (and b!1167748 (not res!774688)) b!1167745))

(assert (= (and b!1167745 (not res!774690)) b!1167742))

(assert (= (and b!1167749 condMapEmpty!45812) mapIsEmpty!45812))

(assert (= (and b!1167749 (not condMapEmpty!45812)) mapNonEmpty!45812))

(get-info :version)

(assert (= (and mapNonEmpty!45812 ((_ is ValueCellFull!13953) mapValue!45812)) b!1167738))

(assert (= (and b!1167749 ((_ is ValueCellFull!13953) mapDefault!45812)) b!1167744))

(assert (= start!99190 b!1167749))

(declare-fun b_lambda!19901 () Bool)

(assert (=> (not b_lambda!19901) (not b!1167745)))

(declare-fun t!37304 () Bool)

(declare-fun tb!9607 () Bool)

(assert (=> (and start!99190 (= defaultEntry!1004 defaultEntry!1004) t!37304) tb!9607))

(declare-fun result!19779 () Bool)

(assert (=> tb!9607 (= result!19779 tp_is_empty!29325)))

(assert (=> b!1167745 t!37304))

(declare-fun b_and!40441 () Bool)

(assert (= b_and!40439 (and (=> t!37304 result!19779) b_and!40441)))

(declare-fun m!1075637 () Bool)

(assert (=> b!1167736 m!1075637))

(declare-fun m!1075639 () Bool)

(assert (=> b!1167740 m!1075639))

(declare-fun m!1075641 () Bool)

(assert (=> b!1167745 m!1075641))

(declare-fun m!1075643 () Bool)

(assert (=> b!1167745 m!1075643))

(declare-fun m!1075645 () Bool)

(assert (=> b!1167745 m!1075645))

(declare-fun m!1075647 () Bool)

(assert (=> b!1167745 m!1075647))

(declare-fun m!1075649 () Bool)

(assert (=> start!99190 m!1075649))

(declare-fun m!1075651 () Bool)

(assert (=> start!99190 m!1075651))

(declare-fun m!1075653 () Bool)

(assert (=> mapNonEmpty!45812 m!1075653))

(declare-fun m!1075655 () Bool)

(assert (=> b!1167748 m!1075655))

(declare-fun m!1075657 () Bool)

(assert (=> b!1167748 m!1075657))

(declare-fun m!1075659 () Bool)

(assert (=> b!1167742 m!1075659))

(declare-fun m!1075661 () Bool)

(assert (=> b!1167742 m!1075661))

(assert (=> b!1167742 m!1075661))

(declare-fun m!1075663 () Bool)

(assert (=> b!1167742 m!1075663))

(declare-fun m!1075665 () Bool)

(assert (=> b!1167742 m!1075665))

(declare-fun m!1075667 () Bool)

(assert (=> b!1167739 m!1075667))

(declare-fun m!1075669 () Bool)

(assert (=> b!1167737 m!1075669))

(declare-fun m!1075671 () Bool)

(assert (=> b!1167747 m!1075671))

(declare-fun m!1075673 () Bool)

(assert (=> b!1167747 m!1075673))

(declare-fun m!1075675 () Bool)

(assert (=> b!1167741 m!1075675))

(declare-fun m!1075677 () Bool)

(assert (=> b!1167746 m!1075677))

(check-sat (not mapNonEmpty!45812) (not b!1167747) (not b!1167742) (not b!1167740) (not b!1167741) (not start!99190) (not b!1167746) (not b_next!24795) b_and!40441 (not b!1167748) (not b_lambda!19901) (not b!1167736) (not b!1167737) (not b!1167745) tp_is_empty!29325)
(check-sat b_and!40441 (not b_next!24795))
