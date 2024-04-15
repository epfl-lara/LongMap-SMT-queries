; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98378 () Bool)

(assert start!98378)

(declare-fun b_free!23989 () Bool)

(declare-fun b_next!23989 () Bool)

(assert (=> start!98378 (= b_free!23989 (not b_next!23989))))

(declare-fun tp!84677 () Bool)

(declare-fun b_and!38805 () Bool)

(assert (=> start!98378 (= tp!84677 b_and!38805)))

(declare-fun b!1134573 () Bool)

(declare-fun e!645681 () Bool)

(declare-fun e!645690 () Bool)

(assert (=> b!1134573 (= e!645681 e!645690)))

(declare-fun res!757423 () Bool)

(assert (=> b!1134573 (=> res!757423 e!645690)))

(declare-datatypes ((V!43153 0))(
  ( (V!43154 (val!14316 Int)) )
))
(declare-datatypes ((tuple2!18148 0))(
  ( (tuple2!18149 (_1!9085 (_ BitVec 64)) (_2!9085 V!43153)) )
))
(declare-datatypes ((List!24894 0))(
  ( (Nil!24891) (Cons!24890 (h!26099 tuple2!18148) (t!35866 List!24894)) )
))
(declare-datatypes ((ListLongMap!16117 0))(
  ( (ListLongMap!16118 (toList!8074 List!24894)) )
))
(declare-fun lt!504169 () ListLongMap!16117)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6532 (ListLongMap!16117 (_ BitVec 64)) Bool)

(assert (=> b!1134573 (= res!757423 (not (contains!6532 lt!504169 k0!934)))))

(declare-fun zeroValue!944 () V!43153)

(declare-datatypes ((array!73822 0))(
  ( (array!73823 (arr!35562 (Array (_ BitVec 32) (_ BitVec 64))) (size!36100 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73822)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13550 0))(
  ( (ValueCellFull!13550 (v!16952 V!43153)) (EmptyCell!13550) )
))
(declare-datatypes ((array!73824 0))(
  ( (array!73825 (arr!35563 (Array (_ BitVec 32) ValueCell!13550)) (size!36101 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73824)

(declare-fun minValue!944 () V!43153)

(declare-fun getCurrentListMapNoExtraKeys!4572 (array!73822 array!73824 (_ BitVec 32) (_ BitVec 32) V!43153 V!43153 (_ BitVec 32) Int) ListLongMap!16117)

(assert (=> b!1134573 (= lt!504169 (getCurrentListMapNoExtraKeys!4572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!757427 () Bool)

(declare-fun e!645692 () Bool)

(assert (=> start!98378 (=> (not res!757427) (not e!645692))))

(assert (=> start!98378 (= res!757427 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36100 _keys!1208))))))

(assert (=> start!98378 e!645692))

(declare-fun tp_is_empty!28519 () Bool)

(assert (=> start!98378 tp_is_empty!28519))

(declare-fun array_inv!27344 (array!73822) Bool)

(assert (=> start!98378 (array_inv!27344 _keys!1208)))

(assert (=> start!98378 true))

(assert (=> start!98378 tp!84677))

(declare-fun e!645687 () Bool)

(declare-fun array_inv!27345 (array!73824) Bool)

(assert (=> start!98378 (and (array_inv!27345 _values!996) e!645687)))

(declare-fun b!1134574 () Bool)

(declare-fun e!645693 () Bool)

(declare-fun mapRes!44603 () Bool)

(assert (=> b!1134574 (= e!645687 (and e!645693 mapRes!44603))))

(declare-fun condMapEmpty!44603 () Bool)

(declare-fun mapDefault!44603 () ValueCell!13550)

(assert (=> b!1134574 (= condMapEmpty!44603 (= (arr!35563 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13550)) mapDefault!44603)))))

(declare-fun b!1134575 () Bool)

(declare-fun res!757432 () Bool)

(declare-fun e!645691 () Bool)

(assert (=> b!1134575 (=> res!757432 e!645691)))

(declare-datatypes ((List!24895 0))(
  ( (Nil!24892) (Cons!24891 (h!26100 (_ BitVec 64)) (t!35867 List!24895)) )
))
(declare-fun noDuplicate!1605 (List!24895) Bool)

(assert (=> b!1134575 (= res!757432 (not (noDuplicate!1605 Nil!24892)))))

(declare-fun e!645682 () Bool)

(declare-fun call!49390 () ListLongMap!16117)

(declare-fun b!1134576 () Bool)

(declare-fun call!49389 () ListLongMap!16117)

(declare-fun -!1173 (ListLongMap!16117 (_ BitVec 64)) ListLongMap!16117)

(assert (=> b!1134576 (= e!645682 (= call!49390 (-!1173 call!49389 k0!934)))))

(declare-fun b!1134577 () Bool)

(declare-fun call!49391 () Bool)

(assert (=> b!1134577 call!49391))

(declare-datatypes ((Unit!37016 0))(
  ( (Unit!37017) )
))
(declare-fun lt!504160 () Unit!37016)

(declare-fun call!49393 () Unit!37016)

(assert (=> b!1134577 (= lt!504160 call!49393)))

(declare-fun e!645680 () Unit!37016)

(assert (=> b!1134577 (= e!645680 lt!504160)))

(declare-fun lt!504166 () ListLongMap!16117)

(declare-fun call!49394 () Unit!37016)

(declare-fun c!110797 () Bool)

(declare-fun c!110796 () Bool)

(declare-fun bm!49384 () Bool)

(declare-fun addStillContains!724 (ListLongMap!16117 (_ BitVec 64) V!43153 (_ BitVec 64)) Unit!37016)

(assert (=> bm!49384 (= call!49394 (addStillContains!724 (ite c!110797 lt!504166 lt!504169) (ite c!110797 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110796 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110797 minValue!944 (ite c!110796 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1134578 () Bool)

(declare-fun e!645686 () Bool)

(assert (=> b!1134578 (= e!645686 tp_is_empty!28519)))

(declare-fun b!1134579 () Bool)

(assert (=> b!1134579 (= e!645690 e!645691)))

(declare-fun res!757428 () Bool)

(assert (=> b!1134579 (=> res!757428 e!645691)))

(assert (=> b!1134579 (= res!757428 (or (bvsge (size!36100 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36100 _keys!1208)) (bvsge from!1455 (size!36100 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!73822 (_ BitVec 32) List!24895) Bool)

(assert (=> b!1134579 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24892)))

(declare-fun lt!504174 () Unit!37016)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73822 (_ BitVec 32) (_ BitVec 32)) Unit!37016)

(assert (=> b!1134579 (= lt!504174 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!645688 () Bool)

(assert (=> b!1134579 e!645688))

(declare-fun res!757426 () Bool)

(assert (=> b!1134579 (=> (not res!757426) (not e!645688))))

(declare-fun e!645685 () Bool)

(assert (=> b!1134579 (= res!757426 e!645685)))

(declare-fun c!110798 () Bool)

(assert (=> b!1134579 (= c!110798 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504172 () Unit!37016)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!338 (array!73822 array!73824 (_ BitVec 32) (_ BitVec 32) V!43153 V!43153 (_ BitVec 64) (_ BitVec 32) Int) Unit!37016)

(assert (=> b!1134579 (= lt!504172 (lemmaListMapContainsThenArrayContainsFrom!338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504173 () Unit!37016)

(declare-fun e!645679 () Unit!37016)

(assert (=> b!1134579 (= lt!504173 e!645679)))

(declare-fun lt!504165 () Bool)

(assert (=> b!1134579 (= c!110797 (and (not lt!504165) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134579 (= lt!504165 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1134580 () Bool)

(declare-fun c!110795 () Bool)

(assert (=> b!1134580 (= c!110795 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504165))))

(declare-fun e!645684 () Unit!37016)

(assert (=> b!1134580 (= e!645680 e!645684)))

(declare-fun b!1134581 () Bool)

(declare-fun res!757422 () Bool)

(assert (=> b!1134581 (=> (not res!757422) (not e!645692))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134581 (= res!757422 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36100 _keys!1208))))))

(declare-fun b!1134582 () Bool)

(declare-fun res!757429 () Bool)

(assert (=> b!1134582 (=> (not res!757429) (not e!645692))))

(assert (=> b!1134582 (= res!757429 (and (= (size!36101 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36100 _keys!1208) (size!36101 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134583 () Bool)

(assert (=> b!1134583 (= e!645693 tp_is_empty!28519)))

(declare-fun b!1134584 () Bool)

(declare-fun e!645683 () Bool)

(assert (=> b!1134584 (= e!645692 e!645683)))

(declare-fun res!757434 () Bool)

(assert (=> b!1134584 (=> (not res!757434) (not e!645683))))

(declare-fun lt!504164 () array!73822)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73822 (_ BitVec 32)) Bool)

(assert (=> b!1134584 (= res!757434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504164 mask!1564))))

(assert (=> b!1134584 (= lt!504164 (array!73823 (store (arr!35562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36100 _keys!1208)))))

(declare-fun b!1134585 () Bool)

(declare-fun res!757424 () Bool)

(assert (=> b!1134585 (=> (not res!757424) (not e!645692))))

(assert (=> b!1134585 (= res!757424 (= (select (arr!35562 _keys!1208) i!673) k0!934))))

(declare-fun b!1134586 () Bool)

(declare-fun arrayContainsKey!0 (array!73822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134586 (= e!645685 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134587 () Bool)

(assert (=> b!1134587 (= e!645685 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504165) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134588 () Bool)

(assert (=> b!1134588 (= e!645691 true)))

(declare-fun lt!504161 () Bool)

(declare-fun contains!6533 (List!24895 (_ BitVec 64)) Bool)

(assert (=> b!1134588 (= lt!504161 (contains!6533 Nil!24892 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134589 () Bool)

(assert (=> b!1134589 (= e!645679 e!645680)))

(assert (=> b!1134589 (= c!110796 (and (not lt!504165) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1134590 () Bool)

(declare-fun lt!504171 () Unit!37016)

(assert (=> b!1134590 (= e!645679 lt!504171)))

(declare-fun lt!504158 () Unit!37016)

(assert (=> b!1134590 (= lt!504158 (addStillContains!724 lt!504169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun call!49392 () ListLongMap!16117)

(assert (=> b!1134590 (= lt!504166 call!49392)))

(declare-fun call!49387 () Bool)

(assert (=> b!1134590 call!49387))

(assert (=> b!1134590 (= lt!504171 call!49394)))

(declare-fun +!3507 (ListLongMap!16117 tuple2!18148) ListLongMap!16117)

(assert (=> b!1134590 (contains!6532 (+!3507 lt!504166 (tuple2!18149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1134591 () Bool)

(declare-fun res!757436 () Bool)

(assert (=> b!1134591 (=> res!757436 e!645691)))

(assert (=> b!1134591 (= res!757436 (contains!6533 Nil!24892 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1134592 () Bool)

(declare-fun e!645689 () Bool)

(declare-fun e!645678 () Bool)

(assert (=> b!1134592 (= e!645689 e!645678)))

(declare-fun res!757438 () Bool)

(assert (=> b!1134592 (=> res!757438 e!645678)))

(assert (=> b!1134592 (= res!757438 (not (= from!1455 i!673)))))

(declare-fun lt!504162 () array!73824)

(declare-fun lt!504163 () ListLongMap!16117)

(assert (=> b!1134592 (= lt!504163 (getCurrentListMapNoExtraKeys!4572 lt!504164 lt!504162 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2568 (Int (_ BitVec 64)) V!43153)

(assert (=> b!1134592 (= lt!504162 (array!73825 (store (arr!35563 _values!996) i!673 (ValueCellFull!13550 (dynLambda!2568 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36101 _values!996)))))

(declare-fun lt!504159 () ListLongMap!16117)

(assert (=> b!1134592 (= lt!504159 (getCurrentListMapNoExtraKeys!4572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49385 () Bool)

(assert (=> bm!49385 (= call!49389 (getCurrentListMapNoExtraKeys!4572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49386 () Bool)

(assert (=> bm!49386 (= call!49393 call!49394)))

(declare-fun mapIsEmpty!44603 () Bool)

(assert (=> mapIsEmpty!44603 mapRes!44603))

(declare-fun bm!49387 () Bool)

(assert (=> bm!49387 (= call!49390 (getCurrentListMapNoExtraKeys!4572 lt!504164 lt!504162 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134593 () Bool)

(assert (=> b!1134593 (= e!645688 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134594 () Bool)

(declare-fun res!757431 () Bool)

(assert (=> b!1134594 (=> (not res!757431) (not e!645683))))

(assert (=> b!1134594 (= res!757431 (arrayNoDuplicates!0 lt!504164 #b00000000000000000000000000000000 Nil!24892))))

(declare-fun b!1134595 () Bool)

(declare-fun lt!504170 () Unit!37016)

(assert (=> b!1134595 (= e!645684 lt!504170)))

(assert (=> b!1134595 (= lt!504170 call!49393)))

(assert (=> b!1134595 call!49391))

(declare-fun b!1134596 () Bool)

(assert (=> b!1134596 (= e!645678 e!645681)))

(declare-fun res!757435 () Bool)

(assert (=> b!1134596 (=> res!757435 e!645681)))

(assert (=> b!1134596 (= res!757435 (not (= (select (arr!35562 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1134596 e!645682))

(declare-fun c!110794 () Bool)

(assert (=> b!1134596 (= c!110794 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504168 () Unit!37016)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!458 (array!73822 array!73824 (_ BitVec 32) (_ BitVec 32) V!43153 V!43153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37016)

(assert (=> b!1134596 (= lt!504168 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49388 () Bool)

(declare-fun call!49388 () ListLongMap!16117)

(assert (=> bm!49388 (= call!49388 call!49392)))

(declare-fun bm!49389 () Bool)

(assert (=> bm!49389 (= call!49387 (contains!6532 (ite c!110797 lt!504166 call!49388) k0!934))))

(declare-fun b!1134597 () Bool)

(declare-fun res!757430 () Bool)

(assert (=> b!1134597 (=> (not res!757430) (not e!645692))))

(assert (=> b!1134597 (= res!757430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134598 () Bool)

(declare-fun res!757439 () Bool)

(assert (=> b!1134598 (=> (not res!757439) (not e!645692))))

(assert (=> b!1134598 (= res!757439 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24892))))

(declare-fun mapNonEmpty!44603 () Bool)

(declare-fun tp!84678 () Bool)

(assert (=> mapNonEmpty!44603 (= mapRes!44603 (and tp!84678 e!645686))))

(declare-fun mapRest!44603 () (Array (_ BitVec 32) ValueCell!13550))

(declare-fun mapValue!44603 () ValueCell!13550)

(declare-fun mapKey!44603 () (_ BitVec 32))

(assert (=> mapNonEmpty!44603 (= (arr!35563 _values!996) (store mapRest!44603 mapKey!44603 mapValue!44603))))

(declare-fun b!1134599 () Bool)

(declare-fun res!757433 () Bool)

(assert (=> b!1134599 (=> (not res!757433) (not e!645692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134599 (= res!757433 (validMask!0 mask!1564))))

(declare-fun b!1134600 () Bool)

(declare-fun Unit!37018 () Unit!37016)

(assert (=> b!1134600 (= e!645684 Unit!37018)))

(declare-fun b!1134601 () Bool)

(assert (=> b!1134601 (= e!645683 (not e!645689))))

(declare-fun res!757437 () Bool)

(assert (=> b!1134601 (=> res!757437 e!645689)))

(assert (=> b!1134601 (= res!757437 (bvsgt from!1455 i!673))))

(assert (=> b!1134601 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504167 () Unit!37016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73822 (_ BitVec 64) (_ BitVec 32)) Unit!37016)

(assert (=> b!1134601 (= lt!504167 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1134602 () Bool)

(assert (=> b!1134602 (= e!645682 (= call!49390 call!49389))))

(declare-fun bm!49390 () Bool)

(assert (=> bm!49390 (= call!49392 (+!3507 lt!504169 (ite (or c!110797 c!110796) (tuple2!18149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1134603 () Bool)

(declare-fun res!757425 () Bool)

(assert (=> b!1134603 (=> (not res!757425) (not e!645692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134603 (= res!757425 (validKeyInArray!0 k0!934))))

(declare-fun bm!49391 () Bool)

(assert (=> bm!49391 (= call!49391 call!49387)))

(assert (= (and start!98378 res!757427) b!1134599))

(assert (= (and b!1134599 res!757433) b!1134582))

(assert (= (and b!1134582 res!757429) b!1134597))

(assert (= (and b!1134597 res!757430) b!1134598))

(assert (= (and b!1134598 res!757439) b!1134581))

(assert (= (and b!1134581 res!757422) b!1134603))

(assert (= (and b!1134603 res!757425) b!1134585))

(assert (= (and b!1134585 res!757424) b!1134584))

(assert (= (and b!1134584 res!757434) b!1134594))

(assert (= (and b!1134594 res!757431) b!1134601))

(assert (= (and b!1134601 (not res!757437)) b!1134592))

(assert (= (and b!1134592 (not res!757438)) b!1134596))

(assert (= (and b!1134596 c!110794) b!1134576))

(assert (= (and b!1134596 (not c!110794)) b!1134602))

(assert (= (or b!1134576 b!1134602) bm!49387))

(assert (= (or b!1134576 b!1134602) bm!49385))

(assert (= (and b!1134596 (not res!757435)) b!1134573))

(assert (= (and b!1134573 (not res!757423)) b!1134579))

(assert (= (and b!1134579 c!110797) b!1134590))

(assert (= (and b!1134579 (not c!110797)) b!1134589))

(assert (= (and b!1134589 c!110796) b!1134577))

(assert (= (and b!1134589 (not c!110796)) b!1134580))

(assert (= (and b!1134580 c!110795) b!1134595))

(assert (= (and b!1134580 (not c!110795)) b!1134600))

(assert (= (or b!1134577 b!1134595) bm!49386))

(assert (= (or b!1134577 b!1134595) bm!49388))

(assert (= (or b!1134577 b!1134595) bm!49391))

(assert (= (or b!1134590 bm!49391) bm!49389))

(assert (= (or b!1134590 bm!49386) bm!49384))

(assert (= (or b!1134590 bm!49388) bm!49390))

(assert (= (and b!1134579 c!110798) b!1134586))

(assert (= (and b!1134579 (not c!110798)) b!1134587))

(assert (= (and b!1134579 res!757426) b!1134593))

(assert (= (and b!1134579 (not res!757428)) b!1134575))

(assert (= (and b!1134575 (not res!757432)) b!1134591))

(assert (= (and b!1134591 (not res!757436)) b!1134588))

(assert (= (and b!1134574 condMapEmpty!44603) mapIsEmpty!44603))

(assert (= (and b!1134574 (not condMapEmpty!44603)) mapNonEmpty!44603))

(get-info :version)

(assert (= (and mapNonEmpty!44603 ((_ is ValueCellFull!13550) mapValue!44603)) b!1134578))

(assert (= (and b!1134574 ((_ is ValueCellFull!13550) mapDefault!44603)) b!1134583))

(assert (= start!98378 b!1134574))

(declare-fun b_lambda!19077 () Bool)

(assert (=> (not b_lambda!19077) (not b!1134592)))

(declare-fun t!35865 () Bool)

(declare-fun tb!8793 () Bool)

(assert (=> (and start!98378 (= defaultEntry!1004 defaultEntry!1004) t!35865) tb!8793))

(declare-fun result!18159 () Bool)

(assert (=> tb!8793 (= result!18159 tp_is_empty!28519)))

(assert (=> b!1134592 t!35865))

(declare-fun b_and!38807 () Bool)

(assert (= b_and!38805 (and (=> t!35865 result!18159) b_and!38807)))

(declare-fun m!1046839 () Bool)

(assert (=> b!1134599 m!1046839))

(declare-fun m!1046841 () Bool)

(assert (=> bm!49385 m!1046841))

(declare-fun m!1046843 () Bool)

(assert (=> b!1134575 m!1046843))

(declare-fun m!1046845 () Bool)

(assert (=> bm!49384 m!1046845))

(declare-fun m!1046847 () Bool)

(assert (=> b!1134590 m!1046847))

(declare-fun m!1046849 () Bool)

(assert (=> b!1134590 m!1046849))

(assert (=> b!1134590 m!1046849))

(declare-fun m!1046851 () Bool)

(assert (=> b!1134590 m!1046851))

(declare-fun m!1046853 () Bool)

(assert (=> b!1134586 m!1046853))

(declare-fun m!1046855 () Bool)

(assert (=> b!1134598 m!1046855))

(declare-fun m!1046857 () Bool)

(assert (=> bm!49390 m!1046857))

(declare-fun m!1046859 () Bool)

(assert (=> b!1134591 m!1046859))

(declare-fun m!1046861 () Bool)

(assert (=> mapNonEmpty!44603 m!1046861))

(declare-fun m!1046863 () Bool)

(assert (=> bm!49389 m!1046863))

(declare-fun m!1046865 () Bool)

(assert (=> b!1134596 m!1046865))

(declare-fun m!1046867 () Bool)

(assert (=> b!1134596 m!1046867))

(declare-fun m!1046869 () Bool)

(assert (=> b!1134603 m!1046869))

(declare-fun m!1046871 () Bool)

(assert (=> b!1134573 m!1046871))

(assert (=> b!1134573 m!1046841))

(declare-fun m!1046873 () Bool)

(assert (=> start!98378 m!1046873))

(declare-fun m!1046875 () Bool)

(assert (=> start!98378 m!1046875))

(declare-fun m!1046877 () Bool)

(assert (=> b!1134576 m!1046877))

(declare-fun m!1046879 () Bool)

(assert (=> b!1134594 m!1046879))

(assert (=> b!1134593 m!1046853))

(declare-fun m!1046881 () Bool)

(assert (=> b!1134588 m!1046881))

(declare-fun m!1046883 () Bool)

(assert (=> b!1134585 m!1046883))

(declare-fun m!1046885 () Bool)

(assert (=> b!1134601 m!1046885))

(declare-fun m!1046887 () Bool)

(assert (=> b!1134601 m!1046887))

(declare-fun m!1046889 () Bool)

(assert (=> b!1134597 m!1046889))

(declare-fun m!1046891 () Bool)

(assert (=> b!1134579 m!1046891))

(declare-fun m!1046893 () Bool)

(assert (=> b!1134579 m!1046893))

(declare-fun m!1046895 () Bool)

(assert (=> b!1134579 m!1046895))

(declare-fun m!1046897 () Bool)

(assert (=> bm!49387 m!1046897))

(declare-fun m!1046899 () Bool)

(assert (=> b!1134584 m!1046899))

(declare-fun m!1046901 () Bool)

(assert (=> b!1134584 m!1046901))

(declare-fun m!1046903 () Bool)

(assert (=> b!1134592 m!1046903))

(declare-fun m!1046905 () Bool)

(assert (=> b!1134592 m!1046905))

(declare-fun m!1046907 () Bool)

(assert (=> b!1134592 m!1046907))

(declare-fun m!1046909 () Bool)

(assert (=> b!1134592 m!1046909))

(check-sat (not bm!49390) (not b!1134579) (not bm!49385) (not b!1134599) (not mapNonEmpty!44603) (not b!1134593) b_and!38807 (not b!1134601) (not b!1134598) (not start!98378) (not b!1134591) (not b!1134584) (not b!1134573) (not b_next!23989) tp_is_empty!28519 (not bm!49387) (not b!1134596) (not b!1134597) (not b!1134576) (not bm!49384) (not b!1134603) (not b!1134588) (not b!1134586) (not b!1134592) (not b!1134575) (not bm!49389) (not b_lambda!19077) (not b!1134594) (not b!1134590))
(check-sat b_and!38807 (not b_next!23989))
