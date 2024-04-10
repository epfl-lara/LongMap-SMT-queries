; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99384 () Bool)

(assert start!99384)

(declare-fun b_free!24963 () Bool)

(declare-fun b_next!24963 () Bool)

(assert (=> start!99384 (= b_free!24963 (not b_next!24963))))

(declare-fun tp!87602 () Bool)

(declare-fun b_and!40793 () Bool)

(assert (=> start!99384 (= tp!87602 b_and!40793)))

(declare-fun b!1172797 () Bool)

(declare-fun res!778730 () Bool)

(declare-fun e!666616 () Bool)

(assert (=> b!1172797 (=> (not res!778730) (not e!666616))))

(declare-datatypes ((array!75799 0))(
  ( (array!75800 (arr!36549 (Array (_ BitVec 32) (_ BitVec 64))) (size!37085 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75799)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75799 (_ BitVec 32)) Bool)

(assert (=> b!1172797 (= res!778730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172798 () Bool)

(declare-fun res!778731 () Bool)

(assert (=> b!1172798 (=> (not res!778731) (not e!666616))))

(declare-datatypes ((List!25653 0))(
  ( (Nil!25650) (Cons!25649 (h!26858 (_ BitVec 64)) (t!37608 List!25653)) )
))
(declare-fun arrayNoDuplicates!0 (array!75799 (_ BitVec 32) List!25653) Bool)

(assert (=> b!1172798 (= res!778731 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25650))))

(declare-fun b!1172799 () Bool)

(declare-datatypes ((Unit!38671 0))(
  ( (Unit!38672) )
))
(declare-fun e!666620 () Unit!38671)

(declare-fun Unit!38673 () Unit!38671)

(assert (=> b!1172799 (= e!666620 Unit!38673)))

(declare-fun lt!528501 () Unit!38671)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75799 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38671)

(assert (=> b!1172799 (= lt!528501 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172799 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528502 () Unit!38671)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75799 (_ BitVec 32) (_ BitVec 32)) Unit!38671)

(assert (=> b!1172799 (= lt!528502 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172799 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25650)))

(declare-fun lt!528497 () Unit!38671)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75799 (_ BitVec 64) (_ BitVec 32) List!25653) Unit!38671)

(assert (=> b!1172799 (= lt!528497 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25650))))

(assert (=> b!1172799 false))

(declare-fun b!1172800 () Bool)

(declare-fun res!778733 () Bool)

(assert (=> b!1172800 (=> (not res!778733) (not e!666616))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44451 0))(
  ( (V!44452 (val!14803 Int)) )
))
(declare-datatypes ((ValueCell!14037 0))(
  ( (ValueCellFull!14037 (v!17441 V!44451)) (EmptyCell!14037) )
))
(declare-datatypes ((array!75801 0))(
  ( (array!75802 (arr!36550 (Array (_ BitVec 32) ValueCell!14037)) (size!37086 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75801)

(assert (=> b!1172800 (= res!778733 (and (= (size!37086 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37085 _keys!1208) (size!37086 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172801 () Bool)

(declare-fun res!778739 () Bool)

(assert (=> b!1172801 (=> (not res!778739) (not e!666616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172801 (= res!778739 (validKeyInArray!0 k0!934))))

(declare-fun e!666619 () Bool)

(declare-fun b!1172802 () Bool)

(assert (=> b!1172802 (= e!666619 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172803 () Bool)

(declare-fun e!666617 () Bool)

(declare-fun e!666611 () Bool)

(declare-fun mapRes!46067 () Bool)

(assert (=> b!1172803 (= e!666617 (and e!666611 mapRes!46067))))

(declare-fun condMapEmpty!46067 () Bool)

(declare-fun mapDefault!46067 () ValueCell!14037)

(assert (=> b!1172803 (= condMapEmpty!46067 (= (arr!36550 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14037)) mapDefault!46067)))))

(declare-fun b!1172804 () Bool)

(declare-fun Unit!38674 () Unit!38671)

(assert (=> b!1172804 (= e!666620 Unit!38674)))

(declare-fun res!778734 () Bool)

(assert (=> start!99384 (=> (not res!778734) (not e!666616))))

(assert (=> start!99384 (= res!778734 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37085 _keys!1208))))))

(assert (=> start!99384 e!666616))

(declare-fun tp_is_empty!29493 () Bool)

(assert (=> start!99384 tp_is_empty!29493))

(declare-fun array_inv!27926 (array!75799) Bool)

(assert (=> start!99384 (array_inv!27926 _keys!1208)))

(assert (=> start!99384 true))

(assert (=> start!99384 tp!87602))

(declare-fun array_inv!27927 (array!75801) Bool)

(assert (=> start!99384 (and (array_inv!27927 _values!996) e!666617)))

(declare-fun b!1172805 () Bool)

(declare-fun res!778735 () Bool)

(assert (=> b!1172805 (=> (not res!778735) (not e!666616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172805 (= res!778735 (validMask!0 mask!1564))))

(declare-fun b!1172806 () Bool)

(assert (=> b!1172806 (= e!666611 tp_is_empty!29493)))

(declare-fun b!1172807 () Bool)

(declare-fun res!778728 () Bool)

(assert (=> b!1172807 (=> (not res!778728) (not e!666616))))

(assert (=> b!1172807 (= res!778728 (= (select (arr!36549 _keys!1208) i!673) k0!934))))

(declare-fun b!1172808 () Bool)

(declare-fun e!666612 () Bool)

(declare-fun e!666614 () Bool)

(assert (=> b!1172808 (= e!666612 (not e!666614))))

(declare-fun res!778737 () Bool)

(assert (=> b!1172808 (=> res!778737 e!666614)))

(assert (=> b!1172808 (= res!778737 (bvsgt from!1455 i!673))))

(assert (=> b!1172808 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528503 () Unit!38671)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75799 (_ BitVec 64) (_ BitVec 32)) Unit!38671)

(assert (=> b!1172808 (= lt!528503 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172809 () Bool)

(declare-fun e!666621 () Bool)

(assert (=> b!1172809 (= e!666621 true)))

(assert (=> b!1172809 (not (= (select (arr!36549 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528498 () Unit!38671)

(assert (=> b!1172809 (= lt!528498 e!666620)))

(declare-fun c!116568 () Bool)

(assert (=> b!1172809 (= c!116568 (= (select (arr!36549 _keys!1208) from!1455) k0!934))))

(declare-fun e!666622 () Bool)

(assert (=> b!1172809 e!666622))

(declare-fun res!778736 () Bool)

(assert (=> b!1172809 (=> (not res!778736) (not e!666622))))

(declare-fun lt!528491 () V!44451)

(declare-datatypes ((tuple2!18916 0))(
  ( (tuple2!18917 (_1!9469 (_ BitVec 64)) (_2!9469 V!44451)) )
))
(declare-datatypes ((List!25654 0))(
  ( (Nil!25651) (Cons!25650 (h!26859 tuple2!18916) (t!37609 List!25654)) )
))
(declare-datatypes ((ListLongMap!16885 0))(
  ( (ListLongMap!16886 (toList!8458 List!25654)) )
))
(declare-fun lt!528492 () ListLongMap!16885)

(declare-fun lt!528495 () ListLongMap!16885)

(declare-fun +!3778 (ListLongMap!16885 tuple2!18916) ListLongMap!16885)

(declare-fun get!18646 (ValueCell!14037 V!44451) V!44451)

(assert (=> b!1172809 (= res!778736 (= lt!528492 (+!3778 lt!528495 (tuple2!18917 (select (arr!36549 _keys!1208) from!1455) (get!18646 (select (arr!36550 _values!996) from!1455) lt!528491)))))))

(declare-fun b!1172810 () Bool)

(declare-fun e!666618 () Bool)

(assert (=> b!1172810 (= e!666618 e!666621)))

(declare-fun res!778741 () Bool)

(assert (=> b!1172810 (=> res!778741 e!666621)))

(assert (=> b!1172810 (= res!778741 (not (validKeyInArray!0 (select (arr!36549 _keys!1208) from!1455))))))

(declare-fun lt!528494 () ListLongMap!16885)

(assert (=> b!1172810 (= lt!528494 lt!528495)))

(declare-fun lt!528500 () ListLongMap!16885)

(declare-fun -!1524 (ListLongMap!16885 (_ BitVec 64)) ListLongMap!16885)

(assert (=> b!1172810 (= lt!528495 (-!1524 lt!528500 k0!934))))

(declare-fun zeroValue!944 () V!44451)

(declare-fun lt!528496 () array!75801)

(declare-fun minValue!944 () V!44451)

(declare-fun lt!528493 () array!75799)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4922 (array!75799 array!75801 (_ BitVec 32) (_ BitVec 32) V!44451 V!44451 (_ BitVec 32) Int) ListLongMap!16885)

(assert (=> b!1172810 (= lt!528494 (getCurrentListMapNoExtraKeys!4922 lt!528493 lt!528496 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172810 (= lt!528500 (getCurrentListMapNoExtraKeys!4922 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528499 () Unit!38671)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!751 (array!75799 array!75801 (_ BitVec 32) (_ BitVec 32) V!44451 V!44451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38671)

(assert (=> b!1172810 (= lt!528499 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!751 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172811 () Bool)

(assert (=> b!1172811 (= e!666614 e!666618)))

(declare-fun res!778732 () Bool)

(assert (=> b!1172811 (=> res!778732 e!666618)))

(assert (=> b!1172811 (= res!778732 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1172811 (= lt!528492 (getCurrentListMapNoExtraKeys!4922 lt!528493 lt!528496 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1172811 (= lt!528496 (array!75802 (store (arr!36550 _values!996) i!673 (ValueCellFull!14037 lt!528491)) (size!37086 _values!996)))))

(declare-fun dynLambda!2893 (Int (_ BitVec 64)) V!44451)

(assert (=> b!1172811 (= lt!528491 (dynLambda!2893 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528504 () ListLongMap!16885)

(assert (=> b!1172811 (= lt!528504 (getCurrentListMapNoExtraKeys!4922 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172812 () Bool)

(assert (=> b!1172812 (= e!666622 e!666619)))

(declare-fun res!778727 () Bool)

(assert (=> b!1172812 (=> res!778727 e!666619)))

(assert (=> b!1172812 (= res!778727 (not (= (select (arr!36549 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!46067 () Bool)

(declare-fun tp!87603 () Bool)

(declare-fun e!666615 () Bool)

(assert (=> mapNonEmpty!46067 (= mapRes!46067 (and tp!87603 e!666615))))

(declare-fun mapRest!46067 () (Array (_ BitVec 32) ValueCell!14037))

(declare-fun mapValue!46067 () ValueCell!14037)

(declare-fun mapKey!46067 () (_ BitVec 32))

(assert (=> mapNonEmpty!46067 (= (arr!36550 _values!996) (store mapRest!46067 mapKey!46067 mapValue!46067))))

(declare-fun b!1172813 () Bool)

(declare-fun res!778740 () Bool)

(assert (=> b!1172813 (=> (not res!778740) (not e!666612))))

(assert (=> b!1172813 (= res!778740 (arrayNoDuplicates!0 lt!528493 #b00000000000000000000000000000000 Nil!25650))))

(declare-fun mapIsEmpty!46067 () Bool)

(assert (=> mapIsEmpty!46067 mapRes!46067))

(declare-fun b!1172814 () Bool)

(assert (=> b!1172814 (= e!666616 e!666612)))

(declare-fun res!778738 () Bool)

(assert (=> b!1172814 (=> (not res!778738) (not e!666612))))

(assert (=> b!1172814 (= res!778738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528493 mask!1564))))

(assert (=> b!1172814 (= lt!528493 (array!75800 (store (arr!36549 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37085 _keys!1208)))))

(declare-fun b!1172815 () Bool)

(assert (=> b!1172815 (= e!666615 tp_is_empty!29493)))

(declare-fun b!1172816 () Bool)

(declare-fun res!778729 () Bool)

(assert (=> b!1172816 (=> (not res!778729) (not e!666616))))

(assert (=> b!1172816 (= res!778729 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37085 _keys!1208))))))

(assert (= (and start!99384 res!778734) b!1172805))

(assert (= (and b!1172805 res!778735) b!1172800))

(assert (= (and b!1172800 res!778733) b!1172797))

(assert (= (and b!1172797 res!778730) b!1172798))

(assert (= (and b!1172798 res!778731) b!1172816))

(assert (= (and b!1172816 res!778729) b!1172801))

(assert (= (and b!1172801 res!778739) b!1172807))

(assert (= (and b!1172807 res!778728) b!1172814))

(assert (= (and b!1172814 res!778738) b!1172813))

(assert (= (and b!1172813 res!778740) b!1172808))

(assert (= (and b!1172808 (not res!778737)) b!1172811))

(assert (= (and b!1172811 (not res!778732)) b!1172810))

(assert (= (and b!1172810 (not res!778741)) b!1172809))

(assert (= (and b!1172809 res!778736) b!1172812))

(assert (= (and b!1172812 (not res!778727)) b!1172802))

(assert (= (and b!1172809 c!116568) b!1172799))

(assert (= (and b!1172809 (not c!116568)) b!1172804))

(assert (= (and b!1172803 condMapEmpty!46067) mapIsEmpty!46067))

(assert (= (and b!1172803 (not condMapEmpty!46067)) mapNonEmpty!46067))

(get-info :version)

(assert (= (and mapNonEmpty!46067 ((_ is ValueCellFull!14037) mapValue!46067)) b!1172815))

(assert (= (and b!1172803 ((_ is ValueCellFull!14037) mapDefault!46067)) b!1172806))

(assert (= start!99384 b!1172803))

(declare-fun b_lambda!20107 () Bool)

(assert (=> (not b_lambda!20107) (not b!1172811)))

(declare-fun t!37607 () Bool)

(declare-fun tb!9775 () Bool)

(assert (=> (and start!99384 (= defaultEntry!1004 defaultEntry!1004) t!37607) tb!9775))

(declare-fun result!20117 () Bool)

(assert (=> tb!9775 (= result!20117 tp_is_empty!29493)))

(assert (=> b!1172811 t!37607))

(declare-fun b_and!40795 () Bool)

(assert (= b_and!40793 (and (=> t!37607 result!20117) b_and!40795)))

(declare-fun m!1080619 () Bool)

(assert (=> b!1172809 m!1080619))

(declare-fun m!1080621 () Bool)

(assert (=> b!1172809 m!1080621))

(assert (=> b!1172809 m!1080621))

(declare-fun m!1080623 () Bool)

(assert (=> b!1172809 m!1080623))

(declare-fun m!1080625 () Bool)

(assert (=> b!1172809 m!1080625))

(declare-fun m!1080627 () Bool)

(assert (=> b!1172813 m!1080627))

(declare-fun m!1080629 () Bool)

(assert (=> b!1172802 m!1080629))

(declare-fun m!1080631 () Bool)

(assert (=> b!1172810 m!1080631))

(declare-fun m!1080633 () Bool)

(assert (=> b!1172810 m!1080633))

(declare-fun m!1080635 () Bool)

(assert (=> b!1172810 m!1080635))

(assert (=> b!1172810 m!1080619))

(declare-fun m!1080637 () Bool)

(assert (=> b!1172810 m!1080637))

(declare-fun m!1080639 () Bool)

(assert (=> b!1172810 m!1080639))

(assert (=> b!1172810 m!1080619))

(declare-fun m!1080641 () Bool)

(assert (=> b!1172805 m!1080641))

(declare-fun m!1080643 () Bool)

(assert (=> b!1172811 m!1080643))

(declare-fun m!1080645 () Bool)

(assert (=> b!1172811 m!1080645))

(declare-fun m!1080647 () Bool)

(assert (=> b!1172811 m!1080647))

(declare-fun m!1080649 () Bool)

(assert (=> b!1172811 m!1080649))

(assert (=> b!1172812 m!1080619))

(declare-fun m!1080651 () Bool)

(assert (=> start!99384 m!1080651))

(declare-fun m!1080653 () Bool)

(assert (=> start!99384 m!1080653))

(declare-fun m!1080655 () Bool)

(assert (=> b!1172797 m!1080655))

(declare-fun m!1080657 () Bool)

(assert (=> b!1172799 m!1080657))

(declare-fun m!1080659 () Bool)

(assert (=> b!1172799 m!1080659))

(declare-fun m!1080661 () Bool)

(assert (=> b!1172799 m!1080661))

(declare-fun m!1080663 () Bool)

(assert (=> b!1172799 m!1080663))

(declare-fun m!1080665 () Bool)

(assert (=> b!1172799 m!1080665))

(declare-fun m!1080667 () Bool)

(assert (=> b!1172801 m!1080667))

(declare-fun m!1080669 () Bool)

(assert (=> mapNonEmpty!46067 m!1080669))

(declare-fun m!1080671 () Bool)

(assert (=> b!1172814 m!1080671))

(declare-fun m!1080673 () Bool)

(assert (=> b!1172814 m!1080673))

(declare-fun m!1080675 () Bool)

(assert (=> b!1172798 m!1080675))

(declare-fun m!1080677 () Bool)

(assert (=> b!1172807 m!1080677))

(declare-fun m!1080679 () Bool)

(assert (=> b!1172808 m!1080679))

(declare-fun m!1080681 () Bool)

(assert (=> b!1172808 m!1080681))

(check-sat (not b!1172808) (not b!1172813) (not b!1172809) (not mapNonEmpty!46067) (not b!1172802) b_and!40795 tp_is_empty!29493 (not b!1172801) (not start!99384) (not b!1172798) (not b!1172811) (not b!1172810) (not b_next!24963) (not b!1172797) (not b_lambda!20107) (not b!1172799) (not b!1172814) (not b!1172805))
(check-sat b_and!40795 (not b_next!24963))
