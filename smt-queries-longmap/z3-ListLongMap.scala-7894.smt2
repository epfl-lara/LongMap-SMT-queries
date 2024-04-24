; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98344 () Bool)

(assert start!98344)

(declare-fun b_free!23809 () Bool)

(declare-fun b_next!23809 () Bool)

(assert (=> start!98344 (= b_free!23809 (not b_next!23809))))

(declare-fun tp!84130 () Bool)

(declare-fun b_and!38411 () Bool)

(assert (=> start!98344 (= tp!84130 b_and!38411)))

(declare-datatypes ((V!42913 0))(
  ( (V!42914 (val!14226 Int)) )
))
(declare-fun zeroValue!944 () V!42913)

(declare-datatypes ((tuple2!17908 0))(
  ( (tuple2!17909 (_1!8965 (_ BitVec 64)) (_2!8965 V!42913)) )
))
(declare-datatypes ((List!24692 0))(
  ( (Nil!24689) (Cons!24688 (h!25906 tuple2!17908) (t!35485 List!24692)) )
))
(declare-datatypes ((ListLongMap!15885 0))(
  ( (ListLongMap!15886 (toList!7958 List!24692)) )
))
(declare-fun call!47776 () ListLongMap!15885)

(declare-datatypes ((array!73583 0))(
  ( (array!73584 (arr!35438 (Array (_ BitVec 32) (_ BitVec 64))) (size!35975 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73583)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47773 () Bool)

(declare-datatypes ((ValueCell!13460 0))(
  ( (ValueCellFull!13460 (v!16855 V!42913)) (EmptyCell!13460) )
))
(declare-datatypes ((array!73585 0))(
  ( (array!73586 (arr!35439 (Array (_ BitVec 32) ValueCell!13460)) (size!35976 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73585)

(declare-fun minValue!944 () V!42913)

(declare-fun getCurrentListMapNoExtraKeys!4479 (array!73583 array!73585 (_ BitVec 32) (_ BitVec 32) V!42913 V!42913 (_ BitVec 32) Int) ListLongMap!15885)

(assert (=> bm!47773 (= call!47776 (getCurrentListMapNoExtraKeys!4479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44326 () Bool)

(declare-fun mapRes!44326 () Bool)

(declare-fun tp!84131 () Bool)

(declare-fun e!642453 () Bool)

(assert (=> mapNonEmpty!44326 (= mapRes!44326 (and tp!84131 e!642453))))

(declare-fun mapKey!44326 () (_ BitVec 32))

(declare-fun mapValue!44326 () ValueCell!13460)

(declare-fun mapRest!44326 () (Array (_ BitVec 32) ValueCell!13460))

(assert (=> mapNonEmpty!44326 (= (arr!35439 _values!996) (store mapRest!44326 mapKey!44326 mapValue!44326))))

(declare-fun lt!501032 () array!73583)

(declare-fun bm!47774 () Bool)

(declare-fun lt!501033 () array!73585)

(declare-fun call!47777 () ListLongMap!15885)

(assert (=> bm!47774 (= call!47777 (getCurrentListMapNoExtraKeys!4479 lt!501032 lt!501033 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128578 () Bool)

(declare-fun e!642462 () Bool)

(declare-fun e!642454 () Bool)

(assert (=> b!1128578 (= e!642462 (not e!642454))))

(declare-fun res!753809 () Bool)

(assert (=> b!1128578 (=> res!753809 e!642454)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128578 (= res!753809 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128578 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36923 0))(
  ( (Unit!36924) )
))
(declare-fun lt!501035 () Unit!36923)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73583 (_ BitVec 64) (_ BitVec 32)) Unit!36923)

(assert (=> b!1128578 (= lt!501035 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128579 () Bool)

(declare-fun e!642457 () Bool)

(assert (=> b!1128579 (= e!642457 true)))

(declare-fun lt!501037 () Bool)

(declare-fun contains!6501 (ListLongMap!15885 (_ BitVec 64)) Bool)

(assert (=> b!1128579 (= lt!501037 (contains!6501 (getCurrentListMapNoExtraKeys!4479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1128580 () Bool)

(declare-fun e!642461 () Bool)

(declare-fun e!642456 () Bool)

(assert (=> b!1128580 (= e!642461 (and e!642456 mapRes!44326))))

(declare-fun condMapEmpty!44326 () Bool)

(declare-fun mapDefault!44326 () ValueCell!13460)

(assert (=> b!1128580 (= condMapEmpty!44326 (= (arr!35439 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13460)) mapDefault!44326)))))

(declare-fun b!1128581 () Bool)

(declare-fun tp_is_empty!28339 () Bool)

(assert (=> b!1128581 (= e!642456 tp_is_empty!28339)))

(declare-fun b!1128582 () Bool)

(declare-fun e!642458 () Bool)

(assert (=> b!1128582 (= e!642458 (= call!47777 call!47776))))

(declare-fun b!1128583 () Bool)

(declare-fun e!642459 () Bool)

(assert (=> b!1128583 (= e!642454 e!642459)))

(declare-fun res!753813 () Bool)

(assert (=> b!1128583 (=> res!753813 e!642459)))

(assert (=> b!1128583 (= res!753813 (not (= from!1455 i!673)))))

(declare-fun lt!501034 () ListLongMap!15885)

(assert (=> b!1128583 (= lt!501034 (getCurrentListMapNoExtraKeys!4479 lt!501032 lt!501033 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2548 (Int (_ BitVec 64)) V!42913)

(assert (=> b!1128583 (= lt!501033 (array!73586 (store (arr!35439 _values!996) i!673 (ValueCellFull!13460 (dynLambda!2548 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35976 _values!996)))))

(declare-fun lt!501031 () ListLongMap!15885)

(assert (=> b!1128583 (= lt!501031 (getCurrentListMapNoExtraKeys!4479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128584 () Bool)

(assert (=> b!1128584 (= e!642459 e!642457)))

(declare-fun res!753810 () Bool)

(assert (=> b!1128584 (=> res!753810 e!642457)))

(assert (=> b!1128584 (= res!753810 (not (= (select (arr!35438 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128584 e!642458))

(declare-fun c!110114 () Bool)

(assert (=> b!1128584 (= c!110114 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501036 () Unit!36923)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!393 (array!73583 array!73585 (_ BitVec 32) (_ BitVec 32) V!42913 V!42913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36923)

(assert (=> b!1128584 (= lt!501036 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44326 () Bool)

(assert (=> mapIsEmpty!44326 mapRes!44326))

(declare-fun b!1128585 () Bool)

(declare-fun res!753818 () Bool)

(declare-fun e!642460 () Bool)

(assert (=> b!1128585 (=> (not res!753818) (not e!642460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73583 (_ BitVec 32)) Bool)

(assert (=> b!1128585 (= res!753818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128586 () Bool)

(declare-fun res!753819 () Bool)

(assert (=> b!1128586 (=> (not res!753819) (not e!642460))))

(assert (=> b!1128586 (= res!753819 (and (= (size!35976 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35975 _keys!1208) (size!35976 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128587 () Bool)

(declare-fun res!753816 () Bool)

(assert (=> b!1128587 (=> (not res!753816) (not e!642462))))

(declare-datatypes ((List!24693 0))(
  ( (Nil!24690) (Cons!24689 (h!25907 (_ BitVec 64)) (t!35486 List!24693)) )
))
(declare-fun arrayNoDuplicates!0 (array!73583 (_ BitVec 32) List!24693) Bool)

(assert (=> b!1128587 (= res!753816 (arrayNoDuplicates!0 lt!501032 #b00000000000000000000000000000000 Nil!24690))))

(declare-fun b!1128588 () Bool)

(declare-fun res!753812 () Bool)

(assert (=> b!1128588 (=> (not res!753812) (not e!642460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128588 (= res!753812 (validMask!0 mask!1564))))

(declare-fun b!1128589 () Bool)

(declare-fun res!753815 () Bool)

(assert (=> b!1128589 (=> (not res!753815) (not e!642460))))

(assert (=> b!1128589 (= res!753815 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24690))))

(declare-fun b!1128590 () Bool)

(declare-fun -!1132 (ListLongMap!15885 (_ BitVec 64)) ListLongMap!15885)

(assert (=> b!1128590 (= e!642458 (= call!47777 (-!1132 call!47776 k0!934)))))

(declare-fun b!1128591 () Bool)

(assert (=> b!1128591 (= e!642460 e!642462)))

(declare-fun res!753811 () Bool)

(assert (=> b!1128591 (=> (not res!753811) (not e!642462))))

(assert (=> b!1128591 (= res!753811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501032 mask!1564))))

(assert (=> b!1128591 (= lt!501032 (array!73584 (store (arr!35438 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35975 _keys!1208)))))

(declare-fun res!753820 () Bool)

(assert (=> start!98344 (=> (not res!753820) (not e!642460))))

(assert (=> start!98344 (= res!753820 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35975 _keys!1208))))))

(assert (=> start!98344 e!642460))

(assert (=> start!98344 tp_is_empty!28339))

(declare-fun array_inv!27248 (array!73583) Bool)

(assert (=> start!98344 (array_inv!27248 _keys!1208)))

(assert (=> start!98344 true))

(assert (=> start!98344 tp!84130))

(declare-fun array_inv!27249 (array!73585) Bool)

(assert (=> start!98344 (and (array_inv!27249 _values!996) e!642461)))

(declare-fun b!1128592 () Bool)

(declare-fun res!753817 () Bool)

(assert (=> b!1128592 (=> (not res!753817) (not e!642460))))

(assert (=> b!1128592 (= res!753817 (= (select (arr!35438 _keys!1208) i!673) k0!934))))

(declare-fun b!1128593 () Bool)

(declare-fun res!753814 () Bool)

(assert (=> b!1128593 (=> (not res!753814) (not e!642460))))

(assert (=> b!1128593 (= res!753814 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35975 _keys!1208))))))

(declare-fun b!1128594 () Bool)

(declare-fun res!753808 () Bool)

(assert (=> b!1128594 (=> (not res!753808) (not e!642460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128594 (= res!753808 (validKeyInArray!0 k0!934))))

(declare-fun b!1128595 () Bool)

(assert (=> b!1128595 (= e!642453 tp_is_empty!28339)))

(assert (= (and start!98344 res!753820) b!1128588))

(assert (= (and b!1128588 res!753812) b!1128586))

(assert (= (and b!1128586 res!753819) b!1128585))

(assert (= (and b!1128585 res!753818) b!1128589))

(assert (= (and b!1128589 res!753815) b!1128593))

(assert (= (and b!1128593 res!753814) b!1128594))

(assert (= (and b!1128594 res!753808) b!1128592))

(assert (= (and b!1128592 res!753817) b!1128591))

(assert (= (and b!1128591 res!753811) b!1128587))

(assert (= (and b!1128587 res!753816) b!1128578))

(assert (= (and b!1128578 (not res!753809)) b!1128583))

(assert (= (and b!1128583 (not res!753813)) b!1128584))

(assert (= (and b!1128584 c!110114) b!1128590))

(assert (= (and b!1128584 (not c!110114)) b!1128582))

(assert (= (or b!1128590 b!1128582) bm!47774))

(assert (= (or b!1128590 b!1128582) bm!47773))

(assert (= (and b!1128584 (not res!753810)) b!1128579))

(assert (= (and b!1128580 condMapEmpty!44326) mapIsEmpty!44326))

(assert (= (and b!1128580 (not condMapEmpty!44326)) mapNonEmpty!44326))

(get-info :version)

(assert (= (and mapNonEmpty!44326 ((_ is ValueCellFull!13460) mapValue!44326)) b!1128595))

(assert (= (and b!1128580 ((_ is ValueCellFull!13460) mapDefault!44326)) b!1128581))

(assert (= start!98344 b!1128580))

(declare-fun b_lambda!18789 () Bool)

(assert (=> (not b_lambda!18789) (not b!1128583)))

(declare-fun t!35484 () Bool)

(declare-fun tb!8613 () Bool)

(assert (=> (and start!98344 (= defaultEntry!1004 defaultEntry!1004) t!35484) tb!8613))

(declare-fun result!17795 () Bool)

(assert (=> tb!8613 (= result!17795 tp_is_empty!28339)))

(assert (=> b!1128583 t!35484))

(declare-fun b_and!38413 () Bool)

(assert (= b_and!38411 (and (=> t!35484 result!17795) b_and!38413)))

(declare-fun m!1042737 () Bool)

(assert (=> b!1128588 m!1042737))

(declare-fun m!1042739 () Bool)

(assert (=> b!1128592 m!1042739))

(declare-fun m!1042741 () Bool)

(assert (=> mapNonEmpty!44326 m!1042741))

(declare-fun m!1042743 () Bool)

(assert (=> start!98344 m!1042743))

(declare-fun m!1042745 () Bool)

(assert (=> start!98344 m!1042745))

(declare-fun m!1042747 () Bool)

(assert (=> b!1128590 m!1042747))

(declare-fun m!1042749 () Bool)

(assert (=> b!1128589 m!1042749))

(declare-fun m!1042751 () Bool)

(assert (=> b!1128594 m!1042751))

(declare-fun m!1042753 () Bool)

(assert (=> b!1128585 m!1042753))

(declare-fun m!1042755 () Bool)

(assert (=> b!1128579 m!1042755))

(assert (=> b!1128579 m!1042755))

(declare-fun m!1042757 () Bool)

(assert (=> b!1128579 m!1042757))

(declare-fun m!1042759 () Bool)

(assert (=> b!1128587 m!1042759))

(declare-fun m!1042761 () Bool)

(assert (=> bm!47774 m!1042761))

(assert (=> bm!47773 m!1042755))

(declare-fun m!1042763 () Bool)

(assert (=> b!1128584 m!1042763))

(declare-fun m!1042765 () Bool)

(assert (=> b!1128584 m!1042765))

(declare-fun m!1042767 () Bool)

(assert (=> b!1128591 m!1042767))

(declare-fun m!1042769 () Bool)

(assert (=> b!1128591 m!1042769))

(declare-fun m!1042771 () Bool)

(assert (=> b!1128583 m!1042771))

(declare-fun m!1042773 () Bool)

(assert (=> b!1128583 m!1042773))

(declare-fun m!1042775 () Bool)

(assert (=> b!1128583 m!1042775))

(declare-fun m!1042777 () Bool)

(assert (=> b!1128583 m!1042777))

(declare-fun m!1042779 () Bool)

(assert (=> b!1128578 m!1042779))

(declare-fun m!1042781 () Bool)

(assert (=> b!1128578 m!1042781))

(check-sat (not b!1128588) (not b!1128578) tp_is_empty!28339 (not bm!47773) (not b_next!23809) (not b!1128579) (not b!1128584) (not start!98344) (not bm!47774) b_and!38413 (not b!1128594) (not b!1128590) (not mapNonEmpty!44326) (not b!1128591) (not b!1128583) (not b!1128587) (not b!1128589) (not b!1128585) (not b_lambda!18789))
(check-sat b_and!38413 (not b_next!23809))
