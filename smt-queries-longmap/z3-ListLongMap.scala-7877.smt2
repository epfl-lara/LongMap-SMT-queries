; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98242 () Bool)

(assert start!98242)

(declare-fun b_free!23707 () Bool)

(declare-fun b_next!23707 () Bool)

(assert (=> start!98242 (= b_free!23707 (not b_next!23707))))

(declare-fun tp!83824 () Bool)

(declare-fun b_and!38207 () Bool)

(assert (=> start!98242 (= tp!83824 b_and!38207)))

(declare-fun b!1125591 () Bool)

(declare-fun res!751690 () Bool)

(declare-fun e!640862 () Bool)

(assert (=> b!1125591 (=> res!751690 e!640862)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1125591 (= res!751690 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125592 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((V!42777 0))(
  ( (V!42778 (val!14175 Int)) )
))
(declare-datatypes ((tuple2!17820 0))(
  ( (tuple2!17821 (_1!8921 (_ BitVec 64)) (_2!8921 V!42777)) )
))
(declare-datatypes ((List!24609 0))(
  ( (Nil!24606) (Cons!24605 (h!25823 tuple2!17820) (t!35300 List!24609)) )
))
(declare-datatypes ((ListLongMap!15797 0))(
  ( (ListLongMap!15798 (toList!7914 List!24609)) )
))
(declare-fun call!47471 () ListLongMap!15797)

(declare-fun call!47470 () ListLongMap!15797)

(declare-fun e!640872 () Bool)

(declare-fun -!1102 (ListLongMap!15797 (_ BitVec 64)) ListLongMap!15797)

(assert (=> b!1125592 (= e!640872 (= call!47470 (-!1102 call!47471 k0!934)))))

(declare-fun b!1125593 () Bool)

(declare-fun e!640866 () Bool)

(declare-fun e!640865 () Bool)

(assert (=> b!1125593 (= e!640866 (not e!640865))))

(declare-fun res!751702 () Bool)

(assert (=> b!1125593 (=> res!751702 e!640865)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125593 (= res!751702 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73387 0))(
  ( (array!73388 (arr!35340 (Array (_ BitVec 32) (_ BitVec 64))) (size!35877 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73387)

(declare-fun arrayContainsKey!0 (array!73387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125593 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36849 0))(
  ( (Unit!36850) )
))
(declare-fun lt!499914 () Unit!36849)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73387 (_ BitVec 64) (_ BitVec 32)) Unit!36849)

(assert (=> b!1125593 (= lt!499914 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42777)

(declare-fun zeroValue!944 () V!42777)

(declare-fun bm!47467 () Bool)

(declare-datatypes ((ValueCell!13409 0))(
  ( (ValueCellFull!13409 (v!16804 V!42777)) (EmptyCell!13409) )
))
(declare-datatypes ((array!73389 0))(
  ( (array!73390 (arr!35341 (Array (_ BitVec 32) ValueCell!13409)) (size!35878 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73389)

(declare-fun getCurrentListMapNoExtraKeys!4440 (array!73387 array!73389 (_ BitVec 32) (_ BitVec 32) V!42777 V!42777 (_ BitVec 32) Int) ListLongMap!15797)

(assert (=> bm!47467 (= call!47471 (getCurrentListMapNoExtraKeys!4440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125594 () Bool)

(declare-fun e!640871 () Bool)

(assert (=> b!1125594 (= e!640871 e!640862)))

(declare-fun res!751701 () Bool)

(assert (=> b!1125594 (=> res!751701 e!640862)))

(declare-fun lt!499912 () ListLongMap!15797)

(declare-fun contains!6468 (ListLongMap!15797 (_ BitVec 64)) Bool)

(assert (=> b!1125594 (= res!751701 (not (contains!6468 lt!499912 k0!934)))))

(assert (=> b!1125594 (= lt!499912 (getCurrentListMapNoExtraKeys!4440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125595 () Bool)

(declare-fun res!751689 () Bool)

(declare-fun e!640867 () Bool)

(assert (=> b!1125595 (=> (not res!751689) (not e!640867))))

(assert (=> b!1125595 (= res!751689 (and (= (size!35878 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35877 _keys!1208) (size!35878 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125597 () Bool)

(declare-fun e!640869 () Bool)

(declare-fun tp_is_empty!28237 () Bool)

(assert (=> b!1125597 (= e!640869 tp_is_empty!28237)))

(declare-fun b!1125598 () Bool)

(assert (=> b!1125598 (= e!640867 e!640866)))

(declare-fun res!751693 () Bool)

(assert (=> b!1125598 (=> (not res!751693) (not e!640866))))

(declare-fun lt!499909 () array!73387)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73387 (_ BitVec 32)) Bool)

(assert (=> b!1125598 (= res!751693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499909 mask!1564))))

(assert (=> b!1125598 (= lt!499909 (array!73388 (store (arr!35340 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35877 _keys!1208)))))

(declare-fun b!1125599 () Bool)

(assert (=> b!1125599 (= e!640862 true)))

(declare-fun +!3446 (ListLongMap!15797 tuple2!17820) ListLongMap!15797)

(assert (=> b!1125599 (contains!6468 (+!3446 lt!499912 (tuple2!17821 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499910 () Unit!36849)

(declare-fun addStillContains!672 (ListLongMap!15797 (_ BitVec 64) V!42777 (_ BitVec 64)) Unit!36849)

(assert (=> b!1125599 (= lt!499910 (addStillContains!672 lt!499912 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1125600 () Bool)

(declare-fun e!640868 () Bool)

(assert (=> b!1125600 (= e!640868 e!640871)))

(declare-fun res!751699 () Bool)

(assert (=> b!1125600 (=> res!751699 e!640871)))

(assert (=> b!1125600 (= res!751699 (not (= (select (arr!35340 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125600 e!640872))

(declare-fun c!109961 () Bool)

(assert (=> b!1125600 (= c!109961 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499915 () Unit!36849)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!364 (array!73387 array!73389 (_ BitVec 32) (_ BitVec 32) V!42777 V!42777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36849)

(assert (=> b!1125600 (= lt!499915 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!364 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44173 () Bool)

(declare-fun mapRes!44173 () Bool)

(declare-fun tp!83825 () Bool)

(declare-fun e!640870 () Bool)

(assert (=> mapNonEmpty!44173 (= mapRes!44173 (and tp!83825 e!640870))))

(declare-fun mapValue!44173 () ValueCell!13409)

(declare-fun mapRest!44173 () (Array (_ BitVec 32) ValueCell!13409))

(declare-fun mapKey!44173 () (_ BitVec 32))

(assert (=> mapNonEmpty!44173 (= (arr!35341 _values!996) (store mapRest!44173 mapKey!44173 mapValue!44173))))

(declare-fun b!1125601 () Bool)

(declare-fun res!751695 () Bool)

(assert (=> b!1125601 (=> (not res!751695) (not e!640867))))

(assert (=> b!1125601 (= res!751695 (= (select (arr!35340 _keys!1208) i!673) k0!934))))

(declare-fun b!1125602 () Bool)

(assert (=> b!1125602 (= e!640872 (= call!47470 call!47471))))

(declare-fun b!1125603 () Bool)

(assert (=> b!1125603 (= e!640870 tp_is_empty!28237)))

(declare-fun b!1125604 () Bool)

(declare-fun res!751692 () Bool)

(assert (=> b!1125604 (=> (not res!751692) (not e!640867))))

(assert (=> b!1125604 (= res!751692 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35877 _keys!1208))))))

(declare-fun b!1125605 () Bool)

(declare-fun res!751698 () Bool)

(assert (=> b!1125605 (=> (not res!751698) (not e!640866))))

(declare-datatypes ((List!24610 0))(
  ( (Nil!24607) (Cons!24606 (h!25824 (_ BitVec 64)) (t!35301 List!24610)) )
))
(declare-fun arrayNoDuplicates!0 (array!73387 (_ BitVec 32) List!24610) Bool)

(assert (=> b!1125605 (= res!751698 (arrayNoDuplicates!0 lt!499909 #b00000000000000000000000000000000 Nil!24607))))

(declare-fun b!1125606 () Bool)

(declare-fun e!640863 () Bool)

(assert (=> b!1125606 (= e!640863 (and e!640869 mapRes!44173))))

(declare-fun condMapEmpty!44173 () Bool)

(declare-fun mapDefault!44173 () ValueCell!13409)

(assert (=> b!1125606 (= condMapEmpty!44173 (= (arr!35341 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13409)) mapDefault!44173)))))

(declare-fun b!1125607 () Bool)

(declare-fun res!751697 () Bool)

(assert (=> b!1125607 (=> (not res!751697) (not e!640867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125607 (= res!751697 (validKeyInArray!0 k0!934))))

(declare-fun b!1125608 () Bool)

(declare-fun res!751694 () Bool)

(assert (=> b!1125608 (=> (not res!751694) (not e!640867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125608 (= res!751694 (validMask!0 mask!1564))))

(declare-fun lt!499908 () array!73389)

(declare-fun bm!47468 () Bool)

(assert (=> bm!47468 (= call!47470 (getCurrentListMapNoExtraKeys!4440 lt!499909 lt!499908 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44173 () Bool)

(assert (=> mapIsEmpty!44173 mapRes!44173))

(declare-fun b!1125596 () Bool)

(declare-fun res!751691 () Bool)

(assert (=> b!1125596 (=> (not res!751691) (not e!640867))))

(assert (=> b!1125596 (= res!751691 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24607))))

(declare-fun res!751700 () Bool)

(assert (=> start!98242 (=> (not res!751700) (not e!640867))))

(assert (=> start!98242 (= res!751700 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35877 _keys!1208))))))

(assert (=> start!98242 e!640867))

(assert (=> start!98242 tp_is_empty!28237))

(declare-fun array_inv!27190 (array!73387) Bool)

(assert (=> start!98242 (array_inv!27190 _keys!1208)))

(assert (=> start!98242 true))

(assert (=> start!98242 tp!83824))

(declare-fun array_inv!27191 (array!73389) Bool)

(assert (=> start!98242 (and (array_inv!27191 _values!996) e!640863)))

(declare-fun b!1125609 () Bool)

(assert (=> b!1125609 (= e!640865 e!640868)))

(declare-fun res!751688 () Bool)

(assert (=> b!1125609 (=> res!751688 e!640868)))

(assert (=> b!1125609 (= res!751688 (not (= from!1455 i!673)))))

(declare-fun lt!499913 () ListLongMap!15797)

(assert (=> b!1125609 (= lt!499913 (getCurrentListMapNoExtraKeys!4440 lt!499909 lt!499908 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2519 (Int (_ BitVec 64)) V!42777)

(assert (=> b!1125609 (= lt!499908 (array!73390 (store (arr!35341 _values!996) i!673 (ValueCellFull!13409 (dynLambda!2519 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35878 _values!996)))))

(declare-fun lt!499911 () ListLongMap!15797)

(assert (=> b!1125609 (= lt!499911 (getCurrentListMapNoExtraKeys!4440 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125610 () Bool)

(declare-fun res!751696 () Bool)

(assert (=> b!1125610 (=> (not res!751696) (not e!640867))))

(assert (=> b!1125610 (= res!751696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98242 res!751700) b!1125608))

(assert (= (and b!1125608 res!751694) b!1125595))

(assert (= (and b!1125595 res!751689) b!1125610))

(assert (= (and b!1125610 res!751696) b!1125596))

(assert (= (and b!1125596 res!751691) b!1125604))

(assert (= (and b!1125604 res!751692) b!1125607))

(assert (= (and b!1125607 res!751697) b!1125601))

(assert (= (and b!1125601 res!751695) b!1125598))

(assert (= (and b!1125598 res!751693) b!1125605))

(assert (= (and b!1125605 res!751698) b!1125593))

(assert (= (and b!1125593 (not res!751702)) b!1125609))

(assert (= (and b!1125609 (not res!751688)) b!1125600))

(assert (= (and b!1125600 c!109961) b!1125592))

(assert (= (and b!1125600 (not c!109961)) b!1125602))

(assert (= (or b!1125592 b!1125602) bm!47468))

(assert (= (or b!1125592 b!1125602) bm!47467))

(assert (= (and b!1125600 (not res!751699)) b!1125594))

(assert (= (and b!1125594 (not res!751701)) b!1125591))

(assert (= (and b!1125591 (not res!751690)) b!1125599))

(assert (= (and b!1125606 condMapEmpty!44173) mapIsEmpty!44173))

(assert (= (and b!1125606 (not condMapEmpty!44173)) mapNonEmpty!44173))

(get-info :version)

(assert (= (and mapNonEmpty!44173 ((_ is ValueCellFull!13409) mapValue!44173)) b!1125603))

(assert (= (and b!1125606 ((_ is ValueCellFull!13409) mapDefault!44173)) b!1125597))

(assert (= start!98242 b!1125606))

(declare-fun b_lambda!18687 () Bool)

(assert (=> (not b_lambda!18687) (not b!1125609)))

(declare-fun t!35299 () Bool)

(declare-fun tb!8511 () Bool)

(assert (=> (and start!98242 (= defaultEntry!1004 defaultEntry!1004) t!35299) tb!8511))

(declare-fun result!17591 () Bool)

(assert (=> tb!8511 (= result!17591 tp_is_empty!28237)))

(assert (=> b!1125609 t!35299))

(declare-fun b_and!38209 () Bool)

(assert (= b_and!38207 (and (=> t!35299 result!17591) b_and!38209)))

(declare-fun m!1040261 () Bool)

(assert (=> start!98242 m!1040261))

(declare-fun m!1040263 () Bool)

(assert (=> start!98242 m!1040263))

(declare-fun m!1040265 () Bool)

(assert (=> b!1125593 m!1040265))

(declare-fun m!1040267 () Bool)

(assert (=> b!1125593 m!1040267))

(declare-fun m!1040269 () Bool)

(assert (=> b!1125596 m!1040269))

(declare-fun m!1040271 () Bool)

(assert (=> b!1125598 m!1040271))

(declare-fun m!1040273 () Bool)

(assert (=> b!1125598 m!1040273))

(declare-fun m!1040275 () Bool)

(assert (=> b!1125594 m!1040275))

(declare-fun m!1040277 () Bool)

(assert (=> b!1125594 m!1040277))

(declare-fun m!1040279 () Bool)

(assert (=> b!1125601 m!1040279))

(declare-fun m!1040281 () Bool)

(assert (=> b!1125609 m!1040281))

(declare-fun m!1040283 () Bool)

(assert (=> b!1125609 m!1040283))

(declare-fun m!1040285 () Bool)

(assert (=> b!1125609 m!1040285))

(declare-fun m!1040287 () Bool)

(assert (=> b!1125609 m!1040287))

(declare-fun m!1040289 () Bool)

(assert (=> b!1125599 m!1040289))

(assert (=> b!1125599 m!1040289))

(declare-fun m!1040291 () Bool)

(assert (=> b!1125599 m!1040291))

(declare-fun m!1040293 () Bool)

(assert (=> b!1125599 m!1040293))

(declare-fun m!1040295 () Bool)

(assert (=> b!1125608 m!1040295))

(declare-fun m!1040297 () Bool)

(assert (=> b!1125607 m!1040297))

(declare-fun m!1040299 () Bool)

(assert (=> b!1125600 m!1040299))

(declare-fun m!1040301 () Bool)

(assert (=> b!1125600 m!1040301))

(declare-fun m!1040303 () Bool)

(assert (=> bm!47468 m!1040303))

(declare-fun m!1040305 () Bool)

(assert (=> b!1125610 m!1040305))

(declare-fun m!1040307 () Bool)

(assert (=> mapNonEmpty!44173 m!1040307))

(assert (=> bm!47467 m!1040277))

(declare-fun m!1040309 () Bool)

(assert (=> b!1125605 m!1040309))

(declare-fun m!1040311 () Bool)

(assert (=> b!1125592 m!1040311))

(check-sat (not bm!47467) b_and!38209 (not b!1125605) tp_is_empty!28237 (not b!1125594) (not bm!47468) (not b!1125610) (not b_lambda!18687) (not b!1125609) (not b!1125596) (not mapNonEmpty!44173) (not b!1125608) (not b!1125607) (not start!98242) (not b!1125592) (not b!1125600) (not b!1125593) (not b!1125599) (not b!1125598) (not b_next!23707))
(check-sat b_and!38209 (not b_next!23707))
