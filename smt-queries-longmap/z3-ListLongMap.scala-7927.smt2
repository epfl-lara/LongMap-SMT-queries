; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98396 () Bool)

(assert start!98396)

(declare-fun b_free!24007 () Bool)

(declare-fun b_next!24007 () Bool)

(assert (=> start!98396 (= b_free!24007 (not b_next!24007))))

(declare-fun tp!84731 () Bool)

(declare-fun b_and!38841 () Bool)

(assert (=> start!98396 (= tp!84731 b_and!38841)))

(declare-fun b!1135428 () Bool)

(declare-fun e!646147 () Bool)

(declare-fun e!646150 () Bool)

(assert (=> b!1135428 (= e!646147 e!646150)))

(declare-fun res!757913 () Bool)

(assert (=> b!1135428 (=> res!757913 e!646150)))

(declare-datatypes ((array!73858 0))(
  ( (array!73859 (arr!35580 (Array (_ BitVec 32) (_ BitVec 64))) (size!36118 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73858)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1135428 (= res!757913 (not (= (select (arr!35580 _keys!1208) from!1455) k0!934)))))

(declare-fun e!646138 () Bool)

(assert (=> b!1135428 e!646138))

(declare-fun c!110929 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135428 (= c!110929 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43177 0))(
  ( (V!43178 (val!14325 Int)) )
))
(declare-fun zeroValue!944 () V!43177)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13559 0))(
  ( (ValueCellFull!13559 (v!16961 V!43177)) (EmptyCell!13559) )
))
(declare-datatypes ((array!73860 0))(
  ( (array!73861 (arr!35581 (Array (_ BitVec 32) ValueCell!13559)) (size!36119 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73860)

(declare-fun minValue!944 () V!43177)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37041 0))(
  ( (Unit!37042) )
))
(declare-fun lt!504627 () Unit!37041)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!465 (array!73858 array!73860 (_ BitVec 32) (_ BitVec 32) V!43177 V!43177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37041)

(assert (=> b!1135428 (= lt!504627 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135429 () Bool)

(declare-fun e!646142 () Unit!37041)

(declare-fun lt!504625 () Unit!37041)

(assert (=> b!1135429 (= e!646142 lt!504625)))

(declare-datatypes ((tuple2!18166 0))(
  ( (tuple2!18167 (_1!9094 (_ BitVec 64)) (_2!9094 V!43177)) )
))
(declare-datatypes ((List!24912 0))(
  ( (Nil!24909) (Cons!24908 (h!26117 tuple2!18166) (t!35902 List!24912)) )
))
(declare-datatypes ((ListLongMap!16135 0))(
  ( (ListLongMap!16136 (toList!8083 List!24912)) )
))
(declare-fun lt!504633 () ListLongMap!16135)

(declare-fun lt!504622 () Unit!37041)

(declare-fun addStillContains!732 (ListLongMap!16135 (_ BitVec 64) V!43177 (_ BitVec 64)) Unit!37041)

(assert (=> b!1135429 (= lt!504622 (addStillContains!732 lt!504633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!504632 () ListLongMap!16135)

(declare-fun call!49610 () ListLongMap!16135)

(assert (=> b!1135429 (= lt!504632 call!49610)))

(declare-fun call!49607 () Bool)

(assert (=> b!1135429 call!49607))

(declare-fun call!49606 () Unit!37041)

(assert (=> b!1135429 (= lt!504625 call!49606)))

(declare-fun contains!6549 (ListLongMap!16135 (_ BitVec 64)) Bool)

(declare-fun +!3515 (ListLongMap!16135 tuple2!18166) ListLongMap!16135)

(assert (=> b!1135429 (contains!6549 (+!3515 lt!504632 (tuple2!18167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1135430 () Bool)

(declare-fun res!757916 () Bool)

(declare-fun e!646139 () Bool)

(assert (=> b!1135430 (=> (not res!757916) (not e!646139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135430 (= res!757916 (validMask!0 mask!1564))))

(declare-fun b!1135431 () Bool)

(declare-fun res!757917 () Bool)

(assert (=> b!1135431 (=> (not res!757917) (not e!646139))))

(declare-datatypes ((List!24913 0))(
  ( (Nil!24910) (Cons!24909 (h!26118 (_ BitVec 64)) (t!35903 List!24913)) )
))
(declare-fun arrayNoDuplicates!0 (array!73858 (_ BitVec 32) List!24913) Bool)

(assert (=> b!1135431 (= res!757917 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24910))))

(declare-fun b!1135432 () Bool)

(declare-fun res!757912 () Bool)

(declare-fun e!646140 () Bool)

(assert (=> b!1135432 (=> res!757912 e!646140)))

(declare-fun noDuplicate!1612 (List!24913) Bool)

(assert (=> b!1135432 (= res!757912 (not (noDuplicate!1612 Nil!24910)))))

(declare-fun b!1135433 () Bool)

(declare-fun call!49605 () ListLongMap!16135)

(declare-fun call!49603 () ListLongMap!16135)

(assert (=> b!1135433 (= e!646138 (= call!49605 call!49603))))

(declare-fun b!1135434 () Bool)

(declare-fun e!646149 () Bool)

(declare-fun arrayContainsKey!0 (array!73858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135434 (= e!646149 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135435 () Bool)

(declare-fun res!757921 () Bool)

(assert (=> b!1135435 (=> (not res!757921) (not e!646139))))

(assert (=> b!1135435 (= res!757921 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36118 _keys!1208))))))

(declare-fun b!1135436 () Bool)

(declare-fun e!646143 () Unit!37041)

(declare-fun Unit!37043 () Unit!37041)

(assert (=> b!1135436 (= e!646143 Unit!37043)))

(declare-fun b!1135437 () Bool)

(declare-fun e!646151 () Bool)

(declare-fun e!646137 () Bool)

(assert (=> b!1135437 (= e!646151 (not e!646137))))

(declare-fun res!757918 () Bool)

(assert (=> b!1135437 (=> res!757918 e!646137)))

(assert (=> b!1135437 (= res!757918 (bvsgt from!1455 i!673))))

(assert (=> b!1135437 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504618 () Unit!37041)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73858 (_ BitVec 64) (_ BitVec 32)) Unit!37041)

(assert (=> b!1135437 (= lt!504618 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1135439 () Bool)

(declare-fun res!757908 () Bool)

(assert (=> b!1135439 (=> (not res!757908) (not e!646151))))

(declare-fun lt!504628 () array!73858)

(assert (=> b!1135439 (= res!757908 (arrayNoDuplicates!0 lt!504628 #b00000000000000000000000000000000 Nil!24910))))

(declare-fun b!1135440 () Bool)

(declare-fun res!757925 () Bool)

(assert (=> b!1135440 (=> (not res!757925) (not e!646139))))

(assert (=> b!1135440 (= res!757925 (= (select (arr!35580 _keys!1208) i!673) k0!934))))

(declare-fun call!49608 () ListLongMap!16135)

(declare-fun bm!49600 () Bool)

(declare-fun c!110933 () Bool)

(assert (=> bm!49600 (= call!49607 (contains!6549 (ite c!110933 lt!504632 call!49608) k0!934))))

(declare-fun b!1135441 () Bool)

(declare-fun lt!504626 () Unit!37041)

(assert (=> b!1135441 (= e!646143 lt!504626)))

(declare-fun call!49609 () Unit!37041)

(assert (=> b!1135441 (= lt!504626 call!49609)))

(declare-fun call!49604 () Bool)

(assert (=> b!1135441 call!49604))

(declare-fun b!1135442 () Bool)

(declare-fun e!646148 () Bool)

(assert (=> b!1135442 (= e!646150 e!646148)))

(declare-fun res!757920 () Bool)

(assert (=> b!1135442 (=> res!757920 e!646148)))

(assert (=> b!1135442 (= res!757920 (not (contains!6549 lt!504633 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4581 (array!73858 array!73860 (_ BitVec 32) (_ BitVec 32) V!43177 V!43177 (_ BitVec 32) Int) ListLongMap!16135)

(assert (=> b!1135442 (= lt!504633 (getCurrentListMapNoExtraKeys!4581 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135443 () Bool)

(assert (=> b!1135443 (= e!646139 e!646151)))

(declare-fun res!757909 () Bool)

(assert (=> b!1135443 (=> (not res!757909) (not e!646151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73858 (_ BitVec 32)) Bool)

(assert (=> b!1135443 (= res!757909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504628 mask!1564))))

(assert (=> b!1135443 (= lt!504628 (array!73859 (store (arr!35580 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36118 _keys!1208)))))

(declare-fun b!1135444 () Bool)

(declare-fun e!646136 () Unit!37041)

(assert (=> b!1135444 (= e!646142 e!646136)))

(declare-fun c!110932 () Bool)

(declare-fun lt!504617 () Bool)

(assert (=> b!1135444 (= c!110932 (and (not lt!504617) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!49601 () Bool)

(assert (=> bm!49601 (= call!49609 call!49606)))

(declare-fun mapIsEmpty!44630 () Bool)

(declare-fun mapRes!44630 () Bool)

(assert (=> mapIsEmpty!44630 mapRes!44630))

(declare-fun bm!49602 () Bool)

(assert (=> bm!49602 (= call!49603 (getCurrentListMapNoExtraKeys!4581 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135445 () Bool)

(assert (=> b!1135445 (= e!646148 e!646140)))

(declare-fun res!757914 () Bool)

(assert (=> b!1135445 (=> res!757914 e!646140)))

(assert (=> b!1135445 (= res!757914 (or (bvsge (size!36118 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36118 _keys!1208)) (bvsge from!1455 (size!36118 _keys!1208))))))

(assert (=> b!1135445 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24910)))

(declare-fun lt!504629 () Unit!37041)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73858 (_ BitVec 32) (_ BitVec 32)) Unit!37041)

(assert (=> b!1135445 (= lt!504629 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1135445 e!646149))

(declare-fun res!757924 () Bool)

(assert (=> b!1135445 (=> (not res!757924) (not e!646149))))

(declare-fun e!646152 () Bool)

(assert (=> b!1135445 (= res!757924 e!646152)))

(declare-fun c!110931 () Bool)

(assert (=> b!1135445 (= c!110931 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504631 () Unit!37041)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!345 (array!73858 array!73860 (_ BitVec 32) (_ BitVec 32) V!43177 V!43177 (_ BitVec 64) (_ BitVec 32) Int) Unit!37041)

(assert (=> b!1135445 (= lt!504631 (lemmaListMapContainsThenArrayContainsFrom!345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504624 () Unit!37041)

(assert (=> b!1135445 (= lt!504624 e!646142)))

(assert (=> b!1135445 (= c!110933 (and (not lt!504617) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135445 (= lt!504617 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!49603 () Bool)

(assert (=> bm!49603 (= call!49608 call!49610)))

(declare-fun b!1135446 () Bool)

(declare-fun res!757919 () Bool)

(assert (=> b!1135446 (=> (not res!757919) (not e!646139))))

(assert (=> b!1135446 (= res!757919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1135438 () Bool)

(declare-fun c!110930 () Bool)

(assert (=> b!1135438 (= c!110930 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504617))))

(assert (=> b!1135438 (= e!646136 e!646143)))

(declare-fun res!757910 () Bool)

(assert (=> start!98396 (=> (not res!757910) (not e!646139))))

(assert (=> start!98396 (= res!757910 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36118 _keys!1208))))))

(assert (=> start!98396 e!646139))

(declare-fun tp_is_empty!28537 () Bool)

(assert (=> start!98396 tp_is_empty!28537))

(declare-fun array_inv!27356 (array!73858) Bool)

(assert (=> start!98396 (array_inv!27356 _keys!1208)))

(assert (=> start!98396 true))

(assert (=> start!98396 tp!84731))

(declare-fun e!646146 () Bool)

(declare-fun array_inv!27357 (array!73860) Bool)

(assert (=> start!98396 (and (array_inv!27357 _values!996) e!646146)))

(declare-fun b!1135447 () Bool)

(assert (=> b!1135447 (= e!646137 e!646147)))

(declare-fun res!757922 () Bool)

(assert (=> b!1135447 (=> res!757922 e!646147)))

(assert (=> b!1135447 (= res!757922 (not (= from!1455 i!673)))))

(declare-fun lt!504620 () array!73860)

(declare-fun lt!504619 () ListLongMap!16135)

(assert (=> b!1135447 (= lt!504619 (getCurrentListMapNoExtraKeys!4581 lt!504628 lt!504620 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2575 (Int (_ BitVec 64)) V!43177)

(assert (=> b!1135447 (= lt!504620 (array!73861 (store (arr!35581 _values!996) i!673 (ValueCellFull!13559 (dynLambda!2575 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36119 _values!996)))))

(declare-fun lt!504630 () ListLongMap!16135)

(assert (=> b!1135447 (= lt!504630 (getCurrentListMapNoExtraKeys!4581 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49604 () Bool)

(assert (=> bm!49604 (= call!49604 call!49607)))

(declare-fun b!1135448 () Bool)

(assert (=> b!1135448 call!49604))

(declare-fun lt!504621 () Unit!37041)

(assert (=> b!1135448 (= lt!504621 call!49609)))

(assert (=> b!1135448 (= e!646136 lt!504621)))

(declare-fun b!1135449 () Bool)

(declare-fun res!757911 () Bool)

(assert (=> b!1135449 (=> (not res!757911) (not e!646139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135449 (= res!757911 (validKeyInArray!0 k0!934))))

(declare-fun b!1135450 () Bool)

(declare-fun e!646141 () Bool)

(assert (=> b!1135450 (= e!646146 (and e!646141 mapRes!44630))))

(declare-fun condMapEmpty!44630 () Bool)

(declare-fun mapDefault!44630 () ValueCell!13559)

(assert (=> b!1135450 (= condMapEmpty!44630 (= (arr!35581 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13559)) mapDefault!44630)))))

(declare-fun b!1135451 () Bool)

(declare-fun res!757915 () Bool)

(assert (=> b!1135451 (=> (not res!757915) (not e!646139))))

(assert (=> b!1135451 (= res!757915 (and (= (size!36119 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36118 _keys!1208) (size!36119 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!49605 () Bool)

(assert (=> bm!49605 (= call!49606 (addStillContains!732 (ite c!110933 lt!504632 lt!504633) (ite c!110933 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110932 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110933 minValue!944 (ite c!110932 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1135452 () Bool)

(declare-fun e!646144 () Bool)

(assert (=> b!1135452 (= e!646144 tp_is_empty!28537)))

(declare-fun b!1135453 () Bool)

(assert (=> b!1135453 (= e!646152 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135454 () Bool)

(assert (=> b!1135454 (= e!646141 tp_is_empty!28537)))

(declare-fun mapNonEmpty!44630 () Bool)

(declare-fun tp!84732 () Bool)

(assert (=> mapNonEmpty!44630 (= mapRes!44630 (and tp!84732 e!646144))))

(declare-fun mapRest!44630 () (Array (_ BitVec 32) ValueCell!13559))

(declare-fun mapValue!44630 () ValueCell!13559)

(declare-fun mapKey!44630 () (_ BitVec 32))

(assert (=> mapNonEmpty!44630 (= (arr!35581 _values!996) (store mapRest!44630 mapKey!44630 mapValue!44630))))

(declare-fun b!1135455 () Bool)

(assert (=> b!1135455 (= e!646140 true)))

(declare-fun lt!504623 () Bool)

(declare-fun contains!6550 (List!24913 (_ BitVec 64)) Bool)

(assert (=> b!1135455 (= lt!504623 (contains!6550 Nil!24910 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49606 () Bool)

(assert (=> bm!49606 (= call!49605 (getCurrentListMapNoExtraKeys!4581 lt!504628 lt!504620 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135456 () Bool)

(declare-fun res!757923 () Bool)

(assert (=> b!1135456 (=> res!757923 e!646140)))

(assert (=> b!1135456 (= res!757923 (contains!6550 Nil!24910 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135457 () Bool)

(assert (=> b!1135457 (= e!646152 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504617) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49607 () Bool)

(assert (=> bm!49607 (= call!49610 (+!3515 lt!504633 (ite (or c!110933 c!110932) (tuple2!18167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1135458 () Bool)

(declare-fun -!1181 (ListLongMap!16135 (_ BitVec 64)) ListLongMap!16135)

(assert (=> b!1135458 (= e!646138 (= call!49605 (-!1181 call!49603 k0!934)))))

(assert (= (and start!98396 res!757910) b!1135430))

(assert (= (and b!1135430 res!757916) b!1135451))

(assert (= (and b!1135451 res!757915) b!1135446))

(assert (= (and b!1135446 res!757919) b!1135431))

(assert (= (and b!1135431 res!757917) b!1135435))

(assert (= (and b!1135435 res!757921) b!1135449))

(assert (= (and b!1135449 res!757911) b!1135440))

(assert (= (and b!1135440 res!757925) b!1135443))

(assert (= (and b!1135443 res!757909) b!1135439))

(assert (= (and b!1135439 res!757908) b!1135437))

(assert (= (and b!1135437 (not res!757918)) b!1135447))

(assert (= (and b!1135447 (not res!757922)) b!1135428))

(assert (= (and b!1135428 c!110929) b!1135458))

(assert (= (and b!1135428 (not c!110929)) b!1135433))

(assert (= (or b!1135458 b!1135433) bm!49606))

(assert (= (or b!1135458 b!1135433) bm!49602))

(assert (= (and b!1135428 (not res!757913)) b!1135442))

(assert (= (and b!1135442 (not res!757920)) b!1135445))

(assert (= (and b!1135445 c!110933) b!1135429))

(assert (= (and b!1135445 (not c!110933)) b!1135444))

(assert (= (and b!1135444 c!110932) b!1135448))

(assert (= (and b!1135444 (not c!110932)) b!1135438))

(assert (= (and b!1135438 c!110930) b!1135441))

(assert (= (and b!1135438 (not c!110930)) b!1135436))

(assert (= (or b!1135448 b!1135441) bm!49601))

(assert (= (or b!1135448 b!1135441) bm!49603))

(assert (= (or b!1135448 b!1135441) bm!49604))

(assert (= (or b!1135429 bm!49604) bm!49600))

(assert (= (or b!1135429 bm!49601) bm!49605))

(assert (= (or b!1135429 bm!49603) bm!49607))

(assert (= (and b!1135445 c!110931) b!1135453))

(assert (= (and b!1135445 (not c!110931)) b!1135457))

(assert (= (and b!1135445 res!757924) b!1135434))

(assert (= (and b!1135445 (not res!757914)) b!1135432))

(assert (= (and b!1135432 (not res!757912)) b!1135456))

(assert (= (and b!1135456 (not res!757923)) b!1135455))

(assert (= (and b!1135450 condMapEmpty!44630) mapIsEmpty!44630))

(assert (= (and b!1135450 (not condMapEmpty!44630)) mapNonEmpty!44630))

(get-info :version)

(assert (= (and mapNonEmpty!44630 ((_ is ValueCellFull!13559) mapValue!44630)) b!1135452))

(assert (= (and b!1135450 ((_ is ValueCellFull!13559) mapDefault!44630)) b!1135454))

(assert (= start!98396 b!1135450))

(declare-fun b_lambda!19095 () Bool)

(assert (=> (not b_lambda!19095) (not b!1135447)))

(declare-fun t!35901 () Bool)

(declare-fun tb!8811 () Bool)

(assert (=> (and start!98396 (= defaultEntry!1004 defaultEntry!1004) t!35901) tb!8811))

(declare-fun result!18195 () Bool)

(assert (=> tb!8811 (= result!18195 tp_is_empty!28537)))

(assert (=> b!1135447 t!35901))

(declare-fun b_and!38843 () Bool)

(assert (= b_and!38841 (and (=> t!35901 result!18195) b_and!38843)))

(declare-fun m!1047487 () Bool)

(assert (=> bm!49606 m!1047487))

(declare-fun m!1047489 () Bool)

(assert (=> bm!49605 m!1047489))

(declare-fun m!1047491 () Bool)

(assert (=> b!1135449 m!1047491))

(declare-fun m!1047493 () Bool)

(assert (=> b!1135437 m!1047493))

(declare-fun m!1047495 () Bool)

(assert (=> b!1135437 m!1047495))

(declare-fun m!1047497 () Bool)

(assert (=> b!1135430 m!1047497))

(declare-fun m!1047499 () Bool)

(assert (=> start!98396 m!1047499))

(declare-fun m!1047501 () Bool)

(assert (=> start!98396 m!1047501))

(declare-fun m!1047503 () Bool)

(assert (=> b!1135453 m!1047503))

(declare-fun m!1047505 () Bool)

(assert (=> bm!49607 m!1047505))

(declare-fun m!1047507 () Bool)

(assert (=> b!1135432 m!1047507))

(declare-fun m!1047509 () Bool)

(assert (=> b!1135456 m!1047509))

(declare-fun m!1047511 () Bool)

(assert (=> b!1135429 m!1047511))

(declare-fun m!1047513 () Bool)

(assert (=> b!1135429 m!1047513))

(assert (=> b!1135429 m!1047513))

(declare-fun m!1047515 () Bool)

(assert (=> b!1135429 m!1047515))

(declare-fun m!1047517 () Bool)

(assert (=> mapNonEmpty!44630 m!1047517))

(declare-fun m!1047519 () Bool)

(assert (=> b!1135447 m!1047519))

(declare-fun m!1047521 () Bool)

(assert (=> b!1135447 m!1047521))

(declare-fun m!1047523 () Bool)

(assert (=> b!1135447 m!1047523))

(declare-fun m!1047525 () Bool)

(assert (=> b!1135447 m!1047525))

(declare-fun m!1047527 () Bool)

(assert (=> bm!49602 m!1047527))

(declare-fun m!1047529 () Bool)

(assert (=> b!1135431 m!1047529))

(declare-fun m!1047531 () Bool)

(assert (=> b!1135428 m!1047531))

(declare-fun m!1047533 () Bool)

(assert (=> b!1135428 m!1047533))

(declare-fun m!1047535 () Bool)

(assert (=> b!1135442 m!1047535))

(assert (=> b!1135442 m!1047527))

(declare-fun m!1047537 () Bool)

(assert (=> b!1135443 m!1047537))

(declare-fun m!1047539 () Bool)

(assert (=> b!1135443 m!1047539))

(assert (=> b!1135434 m!1047503))

(declare-fun m!1047541 () Bool)

(assert (=> b!1135439 m!1047541))

(declare-fun m!1047543 () Bool)

(assert (=> b!1135445 m!1047543))

(declare-fun m!1047545 () Bool)

(assert (=> b!1135445 m!1047545))

(declare-fun m!1047547 () Bool)

(assert (=> b!1135445 m!1047547))

(declare-fun m!1047549 () Bool)

(assert (=> b!1135458 m!1047549))

(declare-fun m!1047551 () Bool)

(assert (=> b!1135440 m!1047551))

(declare-fun m!1047553 () Bool)

(assert (=> bm!49600 m!1047553))

(declare-fun m!1047555 () Bool)

(assert (=> b!1135446 m!1047555))

(declare-fun m!1047557 () Bool)

(assert (=> b!1135455 m!1047557))

(check-sat (not b_next!24007) (not b!1135439) (not bm!49607) (not b!1135434) (not b!1135458) (not start!98396) (not mapNonEmpty!44630) (not b!1135445) (not b!1135429) (not bm!49606) (not b!1135446) (not bm!49600) (not b!1135430) (not bm!49605) (not b!1135443) (not b!1135453) tp_is_empty!28537 (not b!1135437) (not b!1135428) (not b!1135442) (not b!1135431) (not b_lambda!19095) (not b!1135449) b_and!38843 (not b!1135432) (not bm!49602) (not b!1135456) (not b!1135455) (not b!1135447))
(check-sat b_and!38843 (not b_next!24007))
