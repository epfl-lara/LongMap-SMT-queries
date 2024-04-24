; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99100 () Bool)

(assert start!99100)

(declare-fun b_free!24469 () Bool)

(declare-fun b_next!24469 () Bool)

(assert (=> start!99100 (= b_free!24469 (not b_next!24469))))

(declare-fun tp!86118 () Bool)

(declare-fun b_and!39789 () Bool)

(assert (=> start!99100 (= tp!86118 b_and!39789)))

(declare-datatypes ((V!43793 0))(
  ( (V!43794 (val!14556 Int)) )
))
(declare-datatypes ((tuple2!18538 0))(
  ( (tuple2!18539 (_1!9280 (_ BitVec 64)) (_2!9280 V!43793)) )
))
(declare-datatypes ((List!25280 0))(
  ( (Nil!25277) (Cons!25276 (h!26494 tuple2!18538) (t!36733 List!25280)) )
))
(declare-datatypes ((ListLongMap!16515 0))(
  ( (ListLongMap!16516 (toList!8273 List!25280)) )
))
(declare-fun call!55240 () ListLongMap!16515)

(declare-fun b!1157875 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!658586 () Bool)

(declare-fun call!55236 () ListLongMap!16515)

(declare-fun -!1375 (ListLongMap!16515 (_ BitVec 64)) ListLongMap!16515)

(assert (=> b!1157875 (= e!658586 (= call!55240 (-!1375 call!55236 k0!934)))))

(declare-fun zeroValue!944 () V!43793)

(declare-fun lt!519695 () ListLongMap!16515)

(declare-fun c!115477 () Bool)

(declare-fun c!115479 () Bool)

(declare-fun bm!55232 () Bool)

(declare-fun minValue!944 () V!43793)

(declare-fun call!55239 () ListLongMap!16515)

(declare-fun +!3695 (ListLongMap!16515 tuple2!18538) ListLongMap!16515)

(assert (=> bm!55232 (= call!55239 (+!3695 lt!519695 (ite (or c!115479 c!115477) (tuple2!18539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18539 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13790 0))(
  ( (ValueCellFull!13790 (v!17189 V!43793)) (EmptyCell!13790) )
))
(declare-datatypes ((array!74889 0))(
  ( (array!74890 (arr!36089 (Array (_ BitVec 32) ValueCell!13790)) (size!36626 (_ BitVec 32))) )
))
(declare-fun lt!519696 () array!74889)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun e!658583 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74891 0))(
  ( (array!74892 (arr!36090 (Array (_ BitVec 32) (_ BitVec 64))) (size!36627 (_ BitVec 32))) )
))
(declare-fun lt!519701 () array!74891)

(declare-fun b!1157876 () Bool)

(declare-fun lt!519705 () ListLongMap!16515)

(declare-fun getCurrentListMapNoExtraKeys!4767 (array!74891 array!74889 (_ BitVec 32) (_ BitVec 32) V!43793 V!43793 (_ BitVec 32) Int) ListLongMap!16515)

(assert (=> b!1157876 (= e!658583 (= lt!519705 (getCurrentListMapNoExtraKeys!4767 lt!519701 lt!519696 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapIsEmpty!45323 () Bool)

(declare-fun mapRes!45323 () Bool)

(assert (=> mapIsEmpty!45323 mapRes!45323))

(declare-fun bm!55233 () Bool)

(declare-datatypes ((Unit!38073 0))(
  ( (Unit!38074) )
))
(declare-fun call!55237 () Unit!38073)

(declare-fun addStillContains!917 (ListLongMap!16515 (_ BitVec 64) V!43793 (_ BitVec 64)) Unit!38073)

(assert (=> bm!55233 (= call!55237 (addStillContains!917 lt!519695 (ite (or c!115479 c!115477) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115479 c!115477) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1157878 () Bool)

(declare-fun res!768736 () Bool)

(declare-fun e!658590 () Bool)

(assert (=> b!1157878 (=> (not res!768736) (not e!658590))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!74891)

(assert (=> b!1157878 (= res!768736 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36627 _keys!1208))))))

(declare-fun b!1157879 () Bool)

(declare-fun e!658580 () Unit!38073)

(declare-fun Unit!38075 () Unit!38073)

(assert (=> b!1157879 (= e!658580 Unit!38075)))

(declare-fun b!1157880 () Bool)

(declare-fun e!658585 () Bool)

(declare-fun tp_is_empty!28999 () Bool)

(assert (=> b!1157880 (= e!658585 tp_is_empty!28999)))

(declare-fun mapNonEmpty!45323 () Bool)

(declare-fun tp!86117 () Bool)

(declare-fun e!658579 () Bool)

(assert (=> mapNonEmpty!45323 (= mapRes!45323 (and tp!86117 e!658579))))

(declare-fun mapValue!45323 () ValueCell!13790)

(declare-fun mapKey!45323 () (_ BitVec 32))

(declare-fun mapRest!45323 () (Array (_ BitVec 32) ValueCell!13790))

(declare-fun _values!996 () array!74889)

(assert (=> mapNonEmpty!45323 (= (arr!36089 _values!996) (store mapRest!45323 mapKey!45323 mapValue!45323))))

(declare-fun bm!55234 () Bool)

(assert (=> bm!55234 (= call!55240 (getCurrentListMapNoExtraKeys!4767 lt!519701 lt!519696 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157881 () Bool)

(declare-fun lt!519703 () ListLongMap!16515)

(declare-fun contains!6796 (ListLongMap!16515 (_ BitVec 64)) Bool)

(assert (=> b!1157881 (contains!6796 (+!3695 lt!519703 (tuple2!18539 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!519698 () Unit!38073)

(assert (=> b!1157881 (= lt!519698 (addStillContains!917 lt!519703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!55238 () Bool)

(assert (=> b!1157881 call!55238))

(assert (=> b!1157881 (= lt!519703 call!55239)))

(declare-fun lt!519694 () Unit!38073)

(assert (=> b!1157881 (= lt!519694 call!55237)))

(declare-fun e!658584 () Unit!38073)

(assert (=> b!1157881 (= e!658584 lt!519698)))

(declare-fun b!1157882 () Bool)

(declare-fun e!658581 () Bool)

(declare-fun arrayContainsKey!0 (array!74891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157882 (= e!658581 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157883 () Bool)

(declare-fun e!658589 () Bool)

(assert (=> b!1157883 (= e!658589 true)))

(assert (=> b!1157883 e!658583))

(declare-fun res!768731 () Bool)

(assert (=> b!1157883 (=> (not res!768731) (not e!658583))))

(assert (=> b!1157883 (= res!768731 (= lt!519705 lt!519695))))

(declare-fun lt!519697 () ListLongMap!16515)

(assert (=> b!1157883 (= lt!519705 (-!1375 lt!519697 k0!934))))

(declare-fun lt!519715 () V!43793)

(assert (=> b!1157883 (= (-!1375 (+!3695 lt!519695 (tuple2!18539 (select (arr!36090 _keys!1208) from!1455) lt!519715)) (select (arr!36090 _keys!1208) from!1455)) lt!519695)))

(declare-fun lt!519702 () Unit!38073)

(declare-fun addThenRemoveForNewKeyIsSame!212 (ListLongMap!16515 (_ BitVec 64) V!43793) Unit!38073)

(assert (=> b!1157883 (= lt!519702 (addThenRemoveForNewKeyIsSame!212 lt!519695 (select (arr!36090 _keys!1208) from!1455) lt!519715))))

(declare-fun lt!519708 () V!43793)

(declare-fun get!18413 (ValueCell!13790 V!43793) V!43793)

(assert (=> b!1157883 (= lt!519715 (get!18413 (select (arr!36089 _values!996) from!1455) lt!519708))))

(declare-fun lt!519712 () Unit!38073)

(assert (=> b!1157883 (= lt!519712 e!658580)))

(declare-fun c!115478 () Bool)

(assert (=> b!1157883 (= c!115478 (contains!6796 lt!519695 k0!934))))

(assert (=> b!1157883 (= lt!519695 (getCurrentListMapNoExtraKeys!4767 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!658591 () Bool)

(declare-fun b!1157884 () Bool)

(assert (=> b!1157884 (= e!658591 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157885 () Bool)

(declare-fun call!55235 () Bool)

(assert (=> b!1157885 call!55235))

(declare-fun lt!519704 () Unit!38073)

(declare-fun call!55242 () Unit!38073)

(assert (=> b!1157885 (= lt!519704 call!55242)))

(declare-fun e!658575 () Unit!38073)

(assert (=> b!1157885 (= e!658575 lt!519704)))

(declare-fun bm!55235 () Bool)

(declare-fun call!55241 () ListLongMap!16515)

(assert (=> bm!55235 (= call!55238 (contains!6796 (ite c!115479 lt!519703 call!55241) k0!934))))

(declare-fun b!1157886 () Bool)

(declare-fun res!768734 () Bool)

(assert (=> b!1157886 (=> (not res!768734) (not e!658590))))

(assert (=> b!1157886 (= res!768734 (and (= (size!36626 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36627 _keys!1208) (size!36626 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157887 () Bool)

(assert (=> b!1157887 (= e!658586 (= call!55240 call!55236))))

(declare-fun b!1157888 () Bool)

(declare-fun res!768735 () Bool)

(assert (=> b!1157888 (=> (not res!768735) (not e!658590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157888 (= res!768735 (validMask!0 mask!1564))))

(declare-fun b!1157889 () Bool)

(declare-fun e!658577 () Bool)

(declare-fun e!658582 () Bool)

(assert (=> b!1157889 (= e!658577 e!658582)))

(declare-fun res!768740 () Bool)

(assert (=> b!1157889 (=> res!768740 e!658582)))

(assert (=> b!1157889 (= res!768740 (not (= from!1455 i!673)))))

(declare-fun lt!519713 () ListLongMap!16515)

(assert (=> b!1157889 (= lt!519713 (getCurrentListMapNoExtraKeys!4767 lt!519701 lt!519696 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1157889 (= lt!519696 (array!74890 (store (arr!36089 _values!996) i!673 (ValueCellFull!13790 lt!519708)) (size!36626 _values!996)))))

(declare-fun dynLambda!2780 (Int (_ BitVec 64)) V!43793)

(assert (=> b!1157889 (= lt!519708 (dynLambda!2780 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1157889 (= lt!519697 (getCurrentListMapNoExtraKeys!4767 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157890 () Bool)

(declare-fun Unit!38076 () Unit!38073)

(assert (=> b!1157890 (= e!658575 Unit!38076)))

(declare-fun bm!55236 () Bool)

(assert (=> bm!55236 (= call!55241 call!55239)))

(declare-fun b!1157877 () Bool)

(assert (=> b!1157877 (= e!658579 tp_is_empty!28999)))

(declare-fun res!768732 () Bool)

(assert (=> start!99100 (=> (not res!768732) (not e!658590))))

(assert (=> start!99100 (= res!768732 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36627 _keys!1208))))))

(assert (=> start!99100 e!658590))

(assert (=> start!99100 tp_is_empty!28999))

(declare-fun array_inv!27680 (array!74891) Bool)

(assert (=> start!99100 (array_inv!27680 _keys!1208)))

(assert (=> start!99100 true))

(assert (=> start!99100 tp!86118))

(declare-fun e!658578 () Bool)

(declare-fun array_inv!27681 (array!74889) Bool)

(assert (=> start!99100 (and (array_inv!27681 _values!996) e!658578)))

(declare-fun bm!55237 () Bool)

(assert (=> bm!55237 (= call!55236 (getCurrentListMapNoExtraKeys!4767 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157891 () Bool)

(declare-fun e!658588 () Unit!38073)

(assert (=> b!1157891 (= e!658588 e!658575)))

(declare-fun c!115481 () Bool)

(declare-fun lt!519700 () Bool)

(assert (=> b!1157891 (= c!115481 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519700))))

(declare-fun b!1157892 () Bool)

(declare-fun e!658576 () Bool)

(assert (=> b!1157892 (= e!658590 e!658576)))

(declare-fun res!768739 () Bool)

(assert (=> b!1157892 (=> (not res!768739) (not e!658576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74891 (_ BitVec 32)) Bool)

(assert (=> b!1157892 (= res!768739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519701 mask!1564))))

(assert (=> b!1157892 (= lt!519701 (array!74892 (store (arr!36090 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36627 _keys!1208)))))

(declare-fun b!1157893 () Bool)

(declare-fun lt!519709 () Unit!38073)

(assert (=> b!1157893 (= e!658588 lt!519709)))

(assert (=> b!1157893 (= lt!519709 call!55242)))

(assert (=> b!1157893 call!55235))

(declare-fun bm!55238 () Bool)

(assert (=> bm!55238 (= call!55235 call!55238)))

(declare-fun b!1157894 () Bool)

(assert (=> b!1157894 (= e!658582 e!658589)))

(declare-fun res!768737 () Bool)

(assert (=> b!1157894 (=> res!768737 e!658589)))

(assert (=> b!1157894 (= res!768737 (not (= (select (arr!36090 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1157894 e!658586))

(declare-fun c!115482 () Bool)

(assert (=> b!1157894 (= c!115482 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519706 () Unit!38073)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!616 (array!74891 array!74889 (_ BitVec 32) (_ BitVec 32) V!43793 V!43793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38073)

(assert (=> b!1157894 (= lt!519706 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157895 () Bool)

(declare-fun Unit!38077 () Unit!38073)

(assert (=> b!1157895 (= e!658580 Unit!38077)))

(assert (=> b!1157895 (= lt!519700 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157895 (= c!115479 (and (not lt!519700) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519710 () Unit!38073)

(assert (=> b!1157895 (= lt!519710 e!658584)))

(declare-fun lt!519707 () Unit!38073)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!506 (array!74891 array!74889 (_ BitVec 32) (_ BitVec 32) V!43793 V!43793 (_ BitVec 64) (_ BitVec 32) Int) Unit!38073)

(assert (=> b!1157895 (= lt!519707 (lemmaListMapContainsThenArrayContainsFrom!506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115480 () Bool)

(assert (=> b!1157895 (= c!115480 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768727 () Bool)

(assert (=> b!1157895 (= res!768727 e!658591)))

(assert (=> b!1157895 (=> (not res!768727) (not e!658581))))

(assert (=> b!1157895 e!658581))

(declare-fun lt!519699 () Unit!38073)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74891 (_ BitVec 32) (_ BitVec 32)) Unit!38073)

(assert (=> b!1157895 (= lt!519699 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25281 0))(
  ( (Nil!25278) (Cons!25277 (h!26495 (_ BitVec 64)) (t!36734 List!25281)) )
))
(declare-fun arrayNoDuplicates!0 (array!74891 (_ BitVec 32) List!25281) Bool)

(assert (=> b!1157895 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25278)))

(declare-fun lt!519711 () Unit!38073)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74891 (_ BitVec 64) (_ BitVec 32) List!25281) Unit!38073)

(assert (=> b!1157895 (= lt!519711 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25278))))

(assert (=> b!1157895 false))

(declare-fun b!1157896 () Bool)

(assert (=> b!1157896 (= e!658578 (and e!658585 mapRes!45323))))

(declare-fun condMapEmpty!45323 () Bool)

(declare-fun mapDefault!45323 () ValueCell!13790)

(assert (=> b!1157896 (= condMapEmpty!45323 (= (arr!36089 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13790)) mapDefault!45323)))))

(declare-fun b!1157897 () Bool)

(declare-fun res!768730 () Bool)

(assert (=> b!1157897 (=> (not res!768730) (not e!658590))))

(assert (=> b!1157897 (= res!768730 (= (select (arr!36090 _keys!1208) i!673) k0!934))))

(declare-fun b!1157898 () Bool)

(declare-fun res!768733 () Bool)

(assert (=> b!1157898 (=> (not res!768733) (not e!658590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157898 (= res!768733 (validKeyInArray!0 k0!934))))

(declare-fun bm!55239 () Bool)

(assert (=> bm!55239 (= call!55242 call!55237)))

(declare-fun b!1157899 () Bool)

(assert (=> b!1157899 (= e!658576 (not e!658577))))

(declare-fun res!768738 () Bool)

(assert (=> b!1157899 (=> res!768738 e!658577)))

(assert (=> b!1157899 (= res!768738 (bvsgt from!1455 i!673))))

(assert (=> b!1157899 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519714 () Unit!38073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74891 (_ BitVec 64) (_ BitVec 32)) Unit!38073)

(assert (=> b!1157899 (= lt!519714 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1157900 () Bool)

(declare-fun res!768741 () Bool)

(assert (=> b!1157900 (=> (not res!768741) (not e!658590))))

(assert (=> b!1157900 (= res!768741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1157901 () Bool)

(declare-fun res!768728 () Bool)

(assert (=> b!1157901 (=> (not res!768728) (not e!658576))))

(assert (=> b!1157901 (= res!768728 (arrayNoDuplicates!0 lt!519701 #b00000000000000000000000000000000 Nil!25278))))

(declare-fun b!1157902 () Bool)

(assert (=> b!1157902 (= e!658591 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519700) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157903 () Bool)

(declare-fun res!768729 () Bool)

(assert (=> b!1157903 (=> (not res!768729) (not e!658590))))

(assert (=> b!1157903 (= res!768729 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25278))))

(declare-fun b!1157904 () Bool)

(assert (=> b!1157904 (= c!115477 (and (not lt!519700) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157904 (= e!658584 e!658588)))

(assert (= (and start!99100 res!768732) b!1157888))

(assert (= (and b!1157888 res!768735) b!1157886))

(assert (= (and b!1157886 res!768734) b!1157900))

(assert (= (and b!1157900 res!768741) b!1157903))

(assert (= (and b!1157903 res!768729) b!1157878))

(assert (= (and b!1157878 res!768736) b!1157898))

(assert (= (and b!1157898 res!768733) b!1157897))

(assert (= (and b!1157897 res!768730) b!1157892))

(assert (= (and b!1157892 res!768739) b!1157901))

(assert (= (and b!1157901 res!768728) b!1157899))

(assert (= (and b!1157899 (not res!768738)) b!1157889))

(assert (= (and b!1157889 (not res!768740)) b!1157894))

(assert (= (and b!1157894 c!115482) b!1157875))

(assert (= (and b!1157894 (not c!115482)) b!1157887))

(assert (= (or b!1157875 b!1157887) bm!55234))

(assert (= (or b!1157875 b!1157887) bm!55237))

(assert (= (and b!1157894 (not res!768737)) b!1157883))

(assert (= (and b!1157883 c!115478) b!1157895))

(assert (= (and b!1157883 (not c!115478)) b!1157879))

(assert (= (and b!1157895 c!115479) b!1157881))

(assert (= (and b!1157895 (not c!115479)) b!1157904))

(assert (= (and b!1157904 c!115477) b!1157893))

(assert (= (and b!1157904 (not c!115477)) b!1157891))

(assert (= (and b!1157891 c!115481) b!1157885))

(assert (= (and b!1157891 (not c!115481)) b!1157890))

(assert (= (or b!1157893 b!1157885) bm!55239))

(assert (= (or b!1157893 b!1157885) bm!55236))

(assert (= (or b!1157893 b!1157885) bm!55238))

(assert (= (or b!1157881 bm!55238) bm!55235))

(assert (= (or b!1157881 bm!55239) bm!55233))

(assert (= (or b!1157881 bm!55236) bm!55232))

(assert (= (and b!1157895 c!115480) b!1157884))

(assert (= (and b!1157895 (not c!115480)) b!1157902))

(assert (= (and b!1157895 res!768727) b!1157882))

(assert (= (and b!1157883 res!768731) b!1157876))

(assert (= (and b!1157896 condMapEmpty!45323) mapIsEmpty!45323))

(assert (= (and b!1157896 (not condMapEmpty!45323)) mapNonEmpty!45323))

(get-info :version)

(assert (= (and mapNonEmpty!45323 ((_ is ValueCellFull!13790) mapValue!45323)) b!1157877))

(assert (= (and b!1157896 ((_ is ValueCellFull!13790) mapDefault!45323)) b!1157880))

(assert (= start!99100 b!1157896))

(declare-fun b_lambda!19569 () Bool)

(assert (=> (not b_lambda!19569) (not b!1157889)))

(declare-fun t!36732 () Bool)

(declare-fun tb!9273 () Bool)

(assert (=> (and start!99100 (= defaultEntry!1004 defaultEntry!1004) t!36732) tb!9273))

(declare-fun result!19119 () Bool)

(assert (=> tb!9273 (= result!19119 tp_is_empty!28999)))

(assert (=> b!1157889 t!36732))

(declare-fun b_and!39791 () Bool)

(assert (= b_and!39789 (and (=> t!36732 result!19119) b_and!39791)))

(declare-fun m!1067597 () Bool)

(assert (=> b!1157881 m!1067597))

(assert (=> b!1157881 m!1067597))

(declare-fun m!1067599 () Bool)

(assert (=> b!1157881 m!1067599))

(declare-fun m!1067601 () Bool)

(assert (=> b!1157881 m!1067601))

(declare-fun m!1067603 () Bool)

(assert (=> b!1157876 m!1067603))

(declare-fun m!1067605 () Bool)

(assert (=> b!1157898 m!1067605))

(declare-fun m!1067607 () Bool)

(assert (=> b!1157883 m!1067607))

(declare-fun m!1067609 () Bool)

(assert (=> b!1157883 m!1067609))

(declare-fun m!1067611 () Bool)

(assert (=> b!1157883 m!1067611))

(declare-fun m!1067613 () Bool)

(assert (=> b!1157883 m!1067613))

(declare-fun m!1067615 () Bool)

(assert (=> b!1157883 m!1067615))

(declare-fun m!1067617 () Bool)

(assert (=> b!1157883 m!1067617))

(declare-fun m!1067619 () Bool)

(assert (=> b!1157883 m!1067619))

(assert (=> b!1157883 m!1067615))

(assert (=> b!1157883 m!1067617))

(declare-fun m!1067621 () Bool)

(assert (=> b!1157883 m!1067621))

(assert (=> b!1157883 m!1067617))

(assert (=> b!1157883 m!1067611))

(declare-fun m!1067623 () Bool)

(assert (=> b!1157883 m!1067623))

(declare-fun m!1067625 () Bool)

(assert (=> bm!55232 m!1067625))

(declare-fun m!1067627 () Bool)

(assert (=> bm!55233 m!1067627))

(declare-fun m!1067629 () Bool)

(assert (=> b!1157882 m!1067629))

(declare-fun m!1067631 () Bool)

(assert (=> b!1157888 m!1067631))

(declare-fun m!1067633 () Bool)

(assert (=> b!1157899 m!1067633))

(declare-fun m!1067635 () Bool)

(assert (=> b!1157899 m!1067635))

(declare-fun m!1067637 () Bool)

(assert (=> start!99100 m!1067637))

(declare-fun m!1067639 () Bool)

(assert (=> start!99100 m!1067639))

(declare-fun m!1067641 () Bool)

(assert (=> b!1157903 m!1067641))

(assert (=> bm!55234 m!1067603))

(assert (=> bm!55237 m!1067607))

(declare-fun m!1067643 () Bool)

(assert (=> mapNonEmpty!45323 m!1067643))

(declare-fun m!1067645 () Bool)

(assert (=> b!1157897 m!1067645))

(assert (=> b!1157894 m!1067617))

(declare-fun m!1067647 () Bool)

(assert (=> b!1157894 m!1067647))

(declare-fun m!1067649 () Bool)

(assert (=> bm!55235 m!1067649))

(declare-fun m!1067651 () Bool)

(assert (=> b!1157875 m!1067651))

(declare-fun m!1067653 () Bool)

(assert (=> b!1157900 m!1067653))

(declare-fun m!1067655 () Bool)

(assert (=> b!1157889 m!1067655))

(declare-fun m!1067657 () Bool)

(assert (=> b!1157889 m!1067657))

(declare-fun m!1067659 () Bool)

(assert (=> b!1157889 m!1067659))

(declare-fun m!1067661 () Bool)

(assert (=> b!1157889 m!1067661))

(declare-fun m!1067663 () Bool)

(assert (=> b!1157901 m!1067663))

(declare-fun m!1067665 () Bool)

(assert (=> b!1157895 m!1067665))

(declare-fun m!1067667 () Bool)

(assert (=> b!1157895 m!1067667))

(declare-fun m!1067669 () Bool)

(assert (=> b!1157895 m!1067669))

(declare-fun m!1067671 () Bool)

(assert (=> b!1157895 m!1067671))

(assert (=> b!1157884 m!1067629))

(declare-fun m!1067673 () Bool)

(assert (=> b!1157892 m!1067673))

(declare-fun m!1067675 () Bool)

(assert (=> b!1157892 m!1067675))

(check-sat (not b!1157888) (not b!1157903) (not b!1157881) (not bm!55235) (not bm!55232) (not mapNonEmpty!45323) (not b_next!24469) (not b!1157875) (not b!1157898) (not b!1157882) (not b!1157895) (not b!1157899) tp_is_empty!28999 (not b!1157876) (not b!1157889) (not bm!55234) (not b!1157900) (not b_lambda!19569) (not bm!55233) (not start!99100) (not b!1157884) b_and!39791 (not b!1157883) (not b!1157892) (not b!1157901) (not bm!55237) (not b!1157894))
(check-sat b_and!39791 (not b_next!24469))
