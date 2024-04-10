; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98934 () Bool)

(assert start!98934)

(declare-fun b_free!24539 () Bool)

(declare-fun b_next!24539 () Bool)

(assert (=> start!98934 (= b_free!24539 (not b_next!24539))))

(declare-fun tp!86327 () Bool)

(declare-fun b_and!39927 () Bool)

(assert (=> start!98934 (= tp!86327 b_and!39927)))

(declare-fun b!1159806 () Bool)

(declare-fun res!769808 () Bool)

(declare-fun e!659542 () Bool)

(assert (=> b!1159806 (=> (not res!769808) (not e!659542))))

(declare-datatypes ((array!74979 0))(
  ( (array!74980 (arr!36140 (Array (_ BitVec 32) (_ BitVec 64))) (size!36676 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74979)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43885 0))(
  ( (V!43886 (val!14591 Int)) )
))
(declare-datatypes ((ValueCell!13825 0))(
  ( (ValueCellFull!13825 (v!17228 V!43885)) (EmptyCell!13825) )
))
(declare-datatypes ((array!74981 0))(
  ( (array!74982 (arr!36141 (Array (_ BitVec 32) ValueCell!13825)) (size!36677 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74981)

(assert (=> b!1159806 (= res!769808 (and (= (size!36677 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36676 _keys!1208) (size!36677 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1159807 () Bool)

(declare-datatypes ((Unit!38230 0))(
  ( (Unit!38231) )
))
(declare-fun e!659528 () Unit!38230)

(declare-fun lt!521539 () Unit!38230)

(assert (=> b!1159807 (= e!659528 lt!521539)))

(declare-fun call!56017 () Unit!38230)

(assert (=> b!1159807 (= lt!521539 call!56017)))

(declare-fun call!56012 () Bool)

(assert (=> b!1159807 call!56012))

(declare-fun b!1159808 () Bool)

(declare-fun e!659541 () Bool)

(declare-fun e!659533 () Bool)

(assert (=> b!1159808 (= e!659541 (not e!659533))))

(declare-fun res!769807 () Bool)

(assert (=> b!1159808 (=> res!769807 e!659533)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159808 (= res!769807 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159808 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!521535 () Unit!38230)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74979 (_ BitVec 64) (_ BitVec 32)) Unit!38230)

(assert (=> b!1159808 (= lt!521535 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1159809 () Bool)

(declare-fun e!659529 () Unit!38230)

(declare-fun Unit!38232 () Unit!38230)

(assert (=> b!1159809 (= e!659529 Unit!38232)))

(declare-fun lt!521532 () Bool)

(assert (=> b!1159809 (= lt!521532 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115710 () Bool)

(assert (=> b!1159809 (= c!115710 (and (not lt!521532) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521527 () Unit!38230)

(declare-fun e!659540 () Unit!38230)

(assert (=> b!1159809 (= lt!521527 e!659540)))

(declare-fun zeroValue!944 () V!43885)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!521540 () Unit!38230)

(declare-fun minValue!944 () V!43885)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!525 (array!74979 array!74981 (_ BitVec 32) (_ BitVec 32) V!43885 V!43885 (_ BitVec 64) (_ BitVec 32) Int) Unit!38230)

(assert (=> b!1159809 (= lt!521540 (lemmaListMapContainsThenArrayContainsFrom!525 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115709 () Bool)

(assert (=> b!1159809 (= c!115709 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769804 () Bool)

(declare-fun e!659543 () Bool)

(assert (=> b!1159809 (= res!769804 e!659543)))

(declare-fun e!659530 () Bool)

(assert (=> b!1159809 (=> (not res!769804) (not e!659530))))

(assert (=> b!1159809 e!659530))

(declare-fun lt!521541 () Unit!38230)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74979 (_ BitVec 32) (_ BitVec 32)) Unit!38230)

(assert (=> b!1159809 (= lt!521541 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25318 0))(
  ( (Nil!25315) (Cons!25314 (h!26523 (_ BitVec 64)) (t!36849 List!25318)) )
))
(declare-fun arrayNoDuplicates!0 (array!74979 (_ BitVec 32) List!25318) Bool)

(assert (=> b!1159809 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25315)))

(declare-fun lt!521525 () Unit!38230)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74979 (_ BitVec 64) (_ BitVec 32) List!25318) Unit!38230)

(assert (=> b!1159809 (= lt!521525 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25315))))

(assert (=> b!1159809 false))

(declare-fun b!1159810 () Bool)

(assert (=> b!1159810 (= e!659542 e!659541)))

(declare-fun res!769803 () Bool)

(assert (=> b!1159810 (=> (not res!769803) (not e!659541))))

(declare-fun lt!521524 () array!74979)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74979 (_ BitVec 32)) Bool)

(assert (=> b!1159810 (= res!769803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521524 mask!1564))))

(assert (=> b!1159810 (= lt!521524 (array!74980 (store (arr!36140 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36676 _keys!1208)))))

(declare-fun lt!521537 () array!74981)

(declare-fun bm!56007 () Bool)

(declare-datatypes ((tuple2!18580 0))(
  ( (tuple2!18581 (_1!9301 (_ BitVec 64)) (_2!9301 V!43885)) )
))
(declare-datatypes ((List!25319 0))(
  ( (Nil!25316) (Cons!25315 (h!26524 tuple2!18580) (t!36850 List!25319)) )
))
(declare-datatypes ((ListLongMap!16549 0))(
  ( (ListLongMap!16550 (toList!8290 List!25319)) )
))
(declare-fun call!56010 () ListLongMap!16549)

(declare-fun getCurrentListMapNoExtraKeys!4754 (array!74979 array!74981 (_ BitVec 32) (_ BitVec 32) V!43885 V!43885 (_ BitVec 32) Int) ListLongMap!16549)

(assert (=> bm!56007 (= call!56010 (getCurrentListMapNoExtraKeys!4754 lt!521524 lt!521537 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159811 () Bool)

(declare-fun call!56014 () ListLongMap!16549)

(declare-fun contains!6797 (ListLongMap!16549 (_ BitVec 64)) Bool)

(assert (=> b!1159811 (contains!6797 call!56014 k!934)))

(declare-fun lt!521522 () Unit!38230)

(declare-fun call!56013 () Unit!38230)

(assert (=> b!1159811 (= lt!521522 call!56013)))

(declare-fun call!56015 () Bool)

(assert (=> b!1159811 call!56015))

(declare-fun lt!521536 () ListLongMap!16549)

(declare-fun lt!521528 () ListLongMap!16549)

(declare-fun +!3696 (ListLongMap!16549 tuple2!18580) ListLongMap!16549)

(assert (=> b!1159811 (= lt!521536 (+!3696 lt!521528 (tuple2!18581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521534 () Unit!38230)

(declare-fun addStillContains!938 (ListLongMap!16549 (_ BitVec 64) V!43885 (_ BitVec 64)) Unit!38230)

(assert (=> b!1159811 (= lt!521534 (addStillContains!938 lt!521528 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1159811 (= e!659540 lt!521522)))

(declare-fun bm!56008 () Bool)

(declare-fun call!56011 () ListLongMap!16549)

(assert (=> bm!56008 (= call!56011 (getCurrentListMapNoExtraKeys!4754 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56009 () Bool)

(assert (=> bm!56009 (= call!56017 call!56013)))

(declare-fun bm!56010 () Bool)

(declare-fun c!115713 () Bool)

(assert (=> bm!56010 (= call!56013 (addStillContains!938 (ite c!115710 lt!521536 lt!521528) (ite c!115710 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115713 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115710 minValue!944 (ite c!115713 zeroValue!944 minValue!944)) k!934))))

(declare-fun res!769797 () Bool)

(assert (=> start!98934 (=> (not res!769797) (not e!659542))))

(assert (=> start!98934 (= res!769797 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36676 _keys!1208))))))

(assert (=> start!98934 e!659542))

(declare-fun tp_is_empty!29069 () Bool)

(assert (=> start!98934 tp_is_empty!29069))

(declare-fun array_inv!27654 (array!74979) Bool)

(assert (=> start!98934 (array_inv!27654 _keys!1208)))

(assert (=> start!98934 true))

(assert (=> start!98934 tp!86327))

(declare-fun e!659538 () Bool)

(declare-fun array_inv!27655 (array!74981) Bool)

(assert (=> start!98934 (and (array_inv!27655 _values!996) e!659538)))

(declare-fun mapIsEmpty!45428 () Bool)

(declare-fun mapRes!45428 () Bool)

(assert (=> mapIsEmpty!45428 mapRes!45428))

(declare-fun b!1159812 () Bool)

(declare-fun res!769800 () Bool)

(assert (=> b!1159812 (=> (not res!769800) (not e!659542))))

(assert (=> b!1159812 (= res!769800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1159813 () Bool)

(assert (=> b!1159813 call!56012))

(declare-fun lt!521531 () Unit!38230)

(assert (=> b!1159813 (= lt!521531 call!56017)))

(declare-fun e!659535 () Unit!38230)

(assert (=> b!1159813 (= e!659535 lt!521531)))

(declare-fun b!1159814 () Bool)

(assert (=> b!1159814 (= e!659543 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1159815 () Bool)

(declare-fun e!659537 () Bool)

(declare-fun lt!521526 () ListLongMap!16549)

(assert (=> b!1159815 (= e!659537 (= lt!521526 (getCurrentListMapNoExtraKeys!4754 lt!521524 lt!521537 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1159816 () Bool)

(declare-fun e!659544 () Bool)

(assert (=> b!1159816 (= e!659544 (= call!56010 call!56011))))

(declare-fun bm!56011 () Bool)

(assert (=> bm!56011 (= call!56012 call!56015)))

(declare-fun b!1159817 () Bool)

(declare-fun e!659536 () Bool)

(assert (=> b!1159817 (= e!659536 true)))

(assert (=> b!1159817 e!659537))

(declare-fun res!769794 () Bool)

(assert (=> b!1159817 (=> (not res!769794) (not e!659537))))

(assert (=> b!1159817 (= res!769794 (= lt!521526 lt!521528))))

(declare-fun lt!521523 () ListLongMap!16549)

(declare-fun -!1400 (ListLongMap!16549 (_ BitVec 64)) ListLongMap!16549)

(assert (=> b!1159817 (= lt!521526 (-!1400 lt!521523 k!934))))

(declare-fun lt!521520 () V!43885)

(assert (=> b!1159817 (= (-!1400 (+!3696 lt!521528 (tuple2!18581 (select (arr!36140 _keys!1208) from!1455) lt!521520)) (select (arr!36140 _keys!1208) from!1455)) lt!521528)))

(declare-fun lt!521533 () Unit!38230)

(declare-fun addThenRemoveForNewKeyIsSame!235 (ListLongMap!16549 (_ BitVec 64) V!43885) Unit!38230)

(assert (=> b!1159817 (= lt!521533 (addThenRemoveForNewKeyIsSame!235 lt!521528 (select (arr!36140 _keys!1208) from!1455) lt!521520))))

(declare-fun lt!521521 () V!43885)

(declare-fun get!18427 (ValueCell!13825 V!43885) V!43885)

(assert (=> b!1159817 (= lt!521520 (get!18427 (select (arr!36141 _values!996) from!1455) lt!521521))))

(declare-fun lt!521529 () Unit!38230)

(assert (=> b!1159817 (= lt!521529 e!659529)))

(declare-fun c!115712 () Bool)

(assert (=> b!1159817 (= c!115712 (contains!6797 lt!521528 k!934))))

(assert (=> b!1159817 (= lt!521528 (getCurrentListMapNoExtraKeys!4754 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159818 () Bool)

(assert (=> b!1159818 (= e!659543 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521532) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1159819 () Bool)

(assert (=> b!1159819 (= e!659544 (= call!56010 (-!1400 call!56011 k!934)))))

(declare-fun b!1159820 () Bool)

(declare-fun res!769795 () Bool)

(assert (=> b!1159820 (=> (not res!769795) (not e!659541))))

(assert (=> b!1159820 (= res!769795 (arrayNoDuplicates!0 lt!521524 #b00000000000000000000000000000000 Nil!25315))))

(declare-fun b!1159821 () Bool)

(declare-fun res!769802 () Bool)

(assert (=> b!1159821 (=> (not res!769802) (not e!659542))))

(assert (=> b!1159821 (= res!769802 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25315))))

(declare-fun b!1159822 () Bool)

(declare-fun res!769801 () Bool)

(assert (=> b!1159822 (=> (not res!769801) (not e!659542))))

(assert (=> b!1159822 (= res!769801 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36676 _keys!1208))))))

(declare-fun b!1159823 () Bool)

(declare-fun e!659532 () Bool)

(assert (=> b!1159823 (= e!659532 tp_is_empty!29069)))

(declare-fun b!1159824 () Bool)

(declare-fun e!659534 () Bool)

(assert (=> b!1159824 (= e!659534 e!659536)))

(declare-fun res!769798 () Bool)

(assert (=> b!1159824 (=> res!769798 e!659536)))

(assert (=> b!1159824 (= res!769798 (not (= (select (arr!36140 _keys!1208) from!1455) k!934)))))

(assert (=> b!1159824 e!659544))

(declare-fun c!115711 () Bool)

(assert (=> b!1159824 (= c!115711 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521538 () Unit!38230)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!631 (array!74979 array!74981 (_ BitVec 32) (_ BitVec 32) V!43885 V!43885 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38230)

(assert (=> b!1159824 (= lt!521538 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!631 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159825 () Bool)

(declare-fun e!659539 () Bool)

(assert (=> b!1159825 (= e!659538 (and e!659539 mapRes!45428))))

(declare-fun condMapEmpty!45428 () Bool)

(declare-fun mapDefault!45428 () ValueCell!13825)

