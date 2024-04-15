; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98708 () Bool)

(assert start!98708)

(declare-fun b_free!24319 () Bool)

(declare-fun b_next!24319 () Bool)

(assert (=> start!98708 (= b_free!24319 (not b_next!24319))))

(declare-fun tp!85668 () Bool)

(declare-fun b_and!39465 () Bool)

(assert (=> start!98708 (= tp!85668 b_and!39465)))

(declare-fun mapNonEmpty!45098 () Bool)

(declare-fun mapRes!45098 () Bool)

(declare-fun tp!85667 () Bool)

(declare-fun e!653854 () Bool)

(assert (=> mapNonEmpty!45098 (= mapRes!45098 (and tp!85667 e!653854))))

(declare-datatypes ((V!43593 0))(
  ( (V!43594 (val!14481 Int)) )
))
(declare-datatypes ((ValueCell!13715 0))(
  ( (ValueCellFull!13715 (v!17117 V!43593)) (EmptyCell!13715) )
))
(declare-fun mapRest!45098 () (Array (_ BitVec 32) ValueCell!13715))

(declare-datatypes ((array!74466 0))(
  ( (array!74467 (arr!35884 (Array (_ BitVec 32) ValueCell!13715)) (size!36422 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74466)

(declare-fun mapValue!45098 () ValueCell!13715)

(declare-fun mapKey!45098 () (_ BitVec 32))

(assert (=> mapNonEmpty!45098 (= (arr!35884 _values!996) (store mapRest!45098 mapKey!45098 mapValue!45098))))

(declare-fun zeroValue!944 () V!43593)

(declare-fun bm!53344 () Bool)

(declare-fun c!113707 () Bool)

(declare-datatypes ((tuple2!18452 0))(
  ( (tuple2!18453 (_1!9237 (_ BitVec 64)) (_2!9237 V!43593)) )
))
(declare-datatypes ((List!25187 0))(
  ( (Nil!25184) (Cons!25183 (h!26392 tuple2!18452) (t!36489 List!25187)) )
))
(declare-datatypes ((ListLongMap!16421 0))(
  ( (ListLongMap!16422 (toList!8226 List!25187)) )
))
(declare-fun lt!514073 () ListLongMap!16421)

(declare-fun lt!514086 () ListLongMap!16421)

(declare-fun c!113703 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!37627 0))(
  ( (Unit!37628) )
))
(declare-fun call!53350 () Unit!37627)

(declare-fun minValue!944 () V!43593)

(declare-fun addStillContains!853 (ListLongMap!16421 (_ BitVec 64) V!43593 (_ BitVec 64)) Unit!37627)

(assert (=> bm!53344 (= call!53350 (addStillContains!853 (ite c!113707 lt!514086 lt!514073) (ite c!113707 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113703 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113707 minValue!944 (ite c!113703 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapIsEmpty!45098 () Bool)

(assert (=> mapIsEmpty!45098 mapRes!45098))

(declare-fun b!1149562 () Bool)

(declare-fun res!764780 () Bool)

(declare-fun e!653856 () Bool)

(assert (=> b!1149562 (=> (not res!764780) (not e!653856))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149562 (= res!764780 (validMask!0 mask!1564))))

(declare-fun res!764788 () Bool)

(assert (=> start!98708 (=> (not res!764788) (not e!653856))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74468 0))(
  ( (array!74469 (arr!35885 (Array (_ BitVec 32) (_ BitVec 64))) (size!36423 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74468)

(assert (=> start!98708 (= res!764788 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36423 _keys!1208))))))

(assert (=> start!98708 e!653856))

(declare-fun tp_is_empty!28849 () Bool)

(assert (=> start!98708 tp_is_empty!28849))

(declare-fun array_inv!27574 (array!74468) Bool)

(assert (=> start!98708 (array_inv!27574 _keys!1208)))

(assert (=> start!98708 true))

(assert (=> start!98708 tp!85668))

(declare-fun e!653845 () Bool)

(declare-fun array_inv!27575 (array!74466) Bool)

(assert (=> start!98708 (and (array_inv!27575 _values!996) e!653845)))

(declare-fun b!1149563 () Bool)

(declare-fun e!653842 () Bool)

(assert (=> b!1149563 (= e!653842 tp_is_empty!28849)))

(declare-fun b!1149564 () Bool)

(assert (=> b!1149564 (= e!653854 tp_is_empty!28849)))

(declare-fun b!1149565 () Bool)

(declare-fun e!653840 () Unit!37627)

(declare-fun Unit!37629 () Unit!37627)

(assert (=> b!1149565 (= e!653840 Unit!37629)))

(declare-fun b!1149566 () Bool)

(declare-fun e!653851 () Unit!37627)

(declare-fun Unit!37630 () Unit!37627)

(assert (=> b!1149566 (= e!653851 Unit!37630)))

(declare-fun e!653850 () Bool)

(declare-fun b!1149567 () Bool)

(declare-fun call!53352 () ListLongMap!16421)

(declare-fun call!53354 () ListLongMap!16421)

(declare-fun -!1295 (ListLongMap!16421 (_ BitVec 64)) ListLongMap!16421)

(assert (=> b!1149567 (= e!653850 (= call!53354 (-!1295 call!53352 k0!934)))))

(declare-fun b!1149568 () Bool)

(declare-fun Unit!37631 () Unit!37627)

(assert (=> b!1149568 (= e!653840 Unit!37631)))

(declare-fun lt!514078 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1149568 (= lt!514078 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149568 (= c!113707 (and (not lt!514078) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514089 () Unit!37627)

(declare-fun e!653849 () Unit!37627)

(assert (=> b!1149568 (= lt!514089 e!653849)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!514082 () Unit!37627)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!445 (array!74468 array!74466 (_ BitVec 32) (_ BitVec 32) V!43593 V!43593 (_ BitVec 64) (_ BitVec 32) Int) Unit!37627)

(assert (=> b!1149568 (= lt!514082 (lemmaListMapContainsThenArrayContainsFrom!445 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113708 () Bool)

(assert (=> b!1149568 (= c!113708 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764783 () Bool)

(declare-fun e!653843 () Bool)

(assert (=> b!1149568 (= res!764783 e!653843)))

(declare-fun e!653841 () Bool)

(assert (=> b!1149568 (=> (not res!764783) (not e!653841))))

(assert (=> b!1149568 e!653841))

(declare-fun lt!514084 () Unit!37627)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74468 (_ BitVec 32) (_ BitVec 32)) Unit!37627)

(assert (=> b!1149568 (= lt!514084 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25188 0))(
  ( (Nil!25185) (Cons!25184 (h!26393 (_ BitVec 64)) (t!36490 List!25188)) )
))
(declare-fun arrayNoDuplicates!0 (array!74468 (_ BitVec 32) List!25188) Bool)

(assert (=> b!1149568 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25185)))

(declare-fun lt!514075 () Unit!37627)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74468 (_ BitVec 64) (_ BitVec 32) List!25188) Unit!37627)

(assert (=> b!1149568 (= lt!514075 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25185))))

(assert (=> b!1149568 false))

(declare-fun call!53353 () Bool)

(declare-fun bm!53345 () Bool)

(declare-fun call!53347 () ListLongMap!16421)

(declare-fun contains!6683 (ListLongMap!16421 (_ BitVec 64)) Bool)

(assert (=> bm!53345 (= call!53353 (contains!6683 (ite c!113707 lt!514086 call!53347) k0!934))))

(declare-fun b!1149569 () Bool)

(declare-fun e!653853 () Bool)

(declare-fun e!653847 () Bool)

(assert (=> b!1149569 (= e!653853 e!653847)))

(declare-fun res!764779 () Bool)

(assert (=> b!1149569 (=> res!764779 e!653847)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149569 (= res!764779 (not (= from!1455 i!673)))))

(declare-fun lt!514077 () ListLongMap!16421)

(declare-fun lt!514087 () array!74466)

(declare-fun lt!514074 () array!74468)

(declare-fun getCurrentListMapNoExtraKeys!4710 (array!74468 array!74466 (_ BitVec 32) (_ BitVec 32) V!43593 V!43593 (_ BitVec 32) Int) ListLongMap!16421)

(assert (=> b!1149569 (= lt!514077 (getCurrentListMapNoExtraKeys!4710 lt!514074 lt!514087 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!514076 () V!43593)

(assert (=> b!1149569 (= lt!514087 (array!74467 (store (arr!35884 _values!996) i!673 (ValueCellFull!13715 lt!514076)) (size!36422 _values!996)))))

(declare-fun dynLambda!2676 (Int (_ BitVec 64)) V!43593)

(assert (=> b!1149569 (= lt!514076 (dynLambda!2676 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!514072 () ListLongMap!16421)

(assert (=> b!1149569 (= lt!514072 (getCurrentListMapNoExtraKeys!4710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1149570 () Bool)

(declare-fun res!764781 () Bool)

(assert (=> b!1149570 (=> (not res!764781) (not e!653856))))

(assert (=> b!1149570 (= res!764781 (= (select (arr!35885 _keys!1208) i!673) k0!934))))

(declare-fun b!1149571 () Bool)

(declare-fun res!764790 () Bool)

(assert (=> b!1149571 (=> (not res!764790) (not e!653856))))

(assert (=> b!1149571 (= res!764790 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36423 _keys!1208))))))

(declare-fun bm!53346 () Bool)

(declare-fun call!53349 () Unit!37627)

(assert (=> bm!53346 (= call!53349 call!53350)))

(declare-fun b!1149572 () Bool)

(declare-fun e!653852 () Bool)

(assert (=> b!1149572 (= e!653852 true)))

(declare-fun e!653855 () Bool)

(assert (=> b!1149572 e!653855))

(declare-fun res!764784 () Bool)

(assert (=> b!1149572 (=> (not res!764784) (not e!653855))))

(declare-fun lt!514081 () ListLongMap!16421)

(assert (=> b!1149572 (= res!764784 (= lt!514081 lt!514073))))

(assert (=> b!1149572 (= lt!514081 (-!1295 lt!514072 k0!934))))

(declare-fun lt!514080 () V!43593)

(declare-fun +!3642 (ListLongMap!16421 tuple2!18452) ListLongMap!16421)

(assert (=> b!1149572 (= (-!1295 (+!3642 lt!514073 (tuple2!18453 (select (arr!35885 _keys!1208) from!1455) lt!514080)) (select (arr!35885 _keys!1208) from!1455)) lt!514073)))

(declare-fun lt!514068 () Unit!37627)

(declare-fun addThenRemoveForNewKeyIsSame!153 (ListLongMap!16421 (_ BitVec 64) V!43593) Unit!37627)

(assert (=> b!1149572 (= lt!514068 (addThenRemoveForNewKeyIsSame!153 lt!514073 (select (arr!35885 _keys!1208) from!1455) lt!514080))))

(declare-fun get!18273 (ValueCell!13715 V!43593) V!43593)

(assert (=> b!1149572 (= lt!514080 (get!18273 (select (arr!35884 _values!996) from!1455) lt!514076))))

(declare-fun lt!514083 () Unit!37627)

(assert (=> b!1149572 (= lt!514083 e!653840)))

(declare-fun c!113705 () Bool)

(assert (=> b!1149572 (= c!113705 (contains!6683 lt!514073 k0!934))))

(assert (=> b!1149572 (= lt!514073 (getCurrentListMapNoExtraKeys!4710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149573 () Bool)

(declare-fun res!764785 () Bool)

(assert (=> b!1149573 (=> (not res!764785) (not e!653856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74468 (_ BitVec 32)) Bool)

(assert (=> b!1149573 (= res!764785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149574 () Bool)

(assert (=> b!1149574 (contains!6683 (+!3642 lt!514086 (tuple2!18453 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!514085 () Unit!37627)

(assert (=> b!1149574 (= lt!514085 call!53350)))

(assert (=> b!1149574 call!53353))

(declare-fun call!53348 () ListLongMap!16421)

(assert (=> b!1149574 (= lt!514086 call!53348)))

(declare-fun lt!514071 () Unit!37627)

(assert (=> b!1149574 (= lt!514071 (addStillContains!853 lt!514073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1149574 (= e!653849 lt!514085)))

(declare-fun b!1149575 () Bool)

(declare-fun e!653846 () Bool)

(assert (=> b!1149575 (= e!653856 e!653846)))

(declare-fun res!764787 () Bool)

(assert (=> b!1149575 (=> (not res!764787) (not e!653846))))

(assert (=> b!1149575 (= res!764787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514074 mask!1564))))

(assert (=> b!1149575 (= lt!514074 (array!74469 (store (arr!35885 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36423 _keys!1208)))))

(declare-fun bm!53347 () Bool)

(assert (=> bm!53347 (= call!53347 call!53348)))

(declare-fun b!1149576 () Bool)

(assert (=> b!1149576 (= e!653855 (= lt!514081 (getCurrentListMapNoExtraKeys!4710 lt!514074 lt!514087 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1149577 () Bool)

(declare-fun res!764789 () Bool)

(assert (=> b!1149577 (=> (not res!764789) (not e!653846))))

(assert (=> b!1149577 (= res!764789 (arrayNoDuplicates!0 lt!514074 #b00000000000000000000000000000000 Nil!25185))))

(declare-fun bm!53348 () Bool)

(assert (=> bm!53348 (= call!53352 (getCurrentListMapNoExtraKeys!4710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149578 () Bool)

(assert (=> b!1149578 (= e!653843 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514078) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1149579 () Bool)

(declare-fun arrayContainsKey!0 (array!74468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149579 (= e!653843 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149580 () Bool)

(declare-fun res!764778 () Bool)

(assert (=> b!1149580 (=> (not res!764778) (not e!653856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149580 (= res!764778 (validKeyInArray!0 k0!934))))

(declare-fun bm!53349 () Bool)

(assert (=> bm!53349 (= call!53354 (getCurrentListMapNoExtraKeys!4710 lt!514074 lt!514087 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149581 () Bool)

(declare-fun e!653848 () Unit!37627)

(assert (=> b!1149581 (= e!653848 e!653851)))

(declare-fun c!113706 () Bool)

(assert (=> b!1149581 (= c!113706 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514078))))

(declare-fun b!1149582 () Bool)

(assert (=> b!1149582 (= e!653845 (and e!653842 mapRes!45098))))

(declare-fun condMapEmpty!45098 () Bool)

(declare-fun mapDefault!45098 () ValueCell!13715)

(assert (=> b!1149582 (= condMapEmpty!45098 (= (arr!35884 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13715)) mapDefault!45098)))))

(declare-fun bm!53350 () Bool)

(assert (=> bm!53350 (= call!53348 (+!3642 lt!514073 (ite (or c!113707 c!113703) (tuple2!18453 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18453 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1149583 () Bool)

(declare-fun res!764791 () Bool)

(assert (=> b!1149583 (=> (not res!764791) (not e!653856))))

(assert (=> b!1149583 (= res!764791 (and (= (size!36422 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36423 _keys!1208) (size!36422 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149584 () Bool)

(assert (=> b!1149584 (= e!653850 (= call!53354 call!53352))))

(declare-fun b!1149585 () Bool)

(assert (=> b!1149585 (= c!113703 (and (not lt!514078) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149585 (= e!653849 e!653848)))

(declare-fun b!1149586 () Bool)

(assert (=> b!1149586 (= e!653847 e!653852)))

(declare-fun res!764782 () Bool)

(assert (=> b!1149586 (=> res!764782 e!653852)))

(assert (=> b!1149586 (= res!764782 (not (= (select (arr!35885 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1149586 e!653850))

(declare-fun c!113704 () Bool)

(assert (=> b!1149586 (= c!113704 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514069 () Unit!37627)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!570 (array!74468 array!74466 (_ BitVec 32) (_ BitVec 32) V!43593 V!43593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37627)

(assert (=> b!1149586 (= lt!514069 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!570 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149587 () Bool)

(assert (=> b!1149587 (= e!653841 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149588 () Bool)

(declare-fun call!53351 () Bool)

(assert (=> b!1149588 call!53351))

(declare-fun lt!514070 () Unit!37627)

(assert (=> b!1149588 (= lt!514070 call!53349)))

(assert (=> b!1149588 (= e!653851 lt!514070)))

(declare-fun bm!53351 () Bool)

(assert (=> bm!53351 (= call!53351 call!53353)))

(declare-fun b!1149589 () Bool)

(assert (=> b!1149589 (= e!653846 (not e!653853))))

(declare-fun res!764792 () Bool)

(assert (=> b!1149589 (=> res!764792 e!653853)))

(assert (=> b!1149589 (= res!764792 (bvsgt from!1455 i!673))))

(assert (=> b!1149589 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514088 () Unit!37627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74468 (_ BitVec 64) (_ BitVec 32)) Unit!37627)

(assert (=> b!1149589 (= lt!514088 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1149590 () Bool)

(declare-fun lt!514079 () Unit!37627)

(assert (=> b!1149590 (= e!653848 lt!514079)))

(assert (=> b!1149590 (= lt!514079 call!53349)))

(assert (=> b!1149590 call!53351))

(declare-fun b!1149591 () Bool)

(declare-fun res!764786 () Bool)

(assert (=> b!1149591 (=> (not res!764786) (not e!653856))))

(assert (=> b!1149591 (= res!764786 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25185))))

(assert (= (and start!98708 res!764788) b!1149562))

(assert (= (and b!1149562 res!764780) b!1149583))

(assert (= (and b!1149583 res!764791) b!1149573))

(assert (= (and b!1149573 res!764785) b!1149591))

(assert (= (and b!1149591 res!764786) b!1149571))

(assert (= (and b!1149571 res!764790) b!1149580))

(assert (= (and b!1149580 res!764778) b!1149570))

(assert (= (and b!1149570 res!764781) b!1149575))

(assert (= (and b!1149575 res!764787) b!1149577))

(assert (= (and b!1149577 res!764789) b!1149589))

(assert (= (and b!1149589 (not res!764792)) b!1149569))

(assert (= (and b!1149569 (not res!764779)) b!1149586))

(assert (= (and b!1149586 c!113704) b!1149567))

(assert (= (and b!1149586 (not c!113704)) b!1149584))

(assert (= (or b!1149567 b!1149584) bm!53349))

(assert (= (or b!1149567 b!1149584) bm!53348))

(assert (= (and b!1149586 (not res!764782)) b!1149572))

(assert (= (and b!1149572 c!113705) b!1149568))

(assert (= (and b!1149572 (not c!113705)) b!1149565))

(assert (= (and b!1149568 c!113707) b!1149574))

(assert (= (and b!1149568 (not c!113707)) b!1149585))

(assert (= (and b!1149585 c!113703) b!1149590))

(assert (= (and b!1149585 (not c!113703)) b!1149581))

(assert (= (and b!1149581 c!113706) b!1149588))

(assert (= (and b!1149581 (not c!113706)) b!1149566))

(assert (= (or b!1149590 b!1149588) bm!53346))

(assert (= (or b!1149590 b!1149588) bm!53347))

(assert (= (or b!1149590 b!1149588) bm!53351))

(assert (= (or b!1149574 bm!53351) bm!53345))

(assert (= (or b!1149574 bm!53346) bm!53344))

(assert (= (or b!1149574 bm!53347) bm!53350))

(assert (= (and b!1149568 c!113708) b!1149579))

(assert (= (and b!1149568 (not c!113708)) b!1149578))

(assert (= (and b!1149568 res!764783) b!1149587))

(assert (= (and b!1149572 res!764784) b!1149576))

(assert (= (and b!1149582 condMapEmpty!45098) mapIsEmpty!45098))

(assert (= (and b!1149582 (not condMapEmpty!45098)) mapNonEmpty!45098))

(get-info :version)

(assert (= (and mapNonEmpty!45098 ((_ is ValueCellFull!13715) mapValue!45098)) b!1149564))

(assert (= (and b!1149582 ((_ is ValueCellFull!13715) mapDefault!45098)) b!1149563))

(assert (= start!98708 b!1149582))

(declare-fun b_lambda!19407 () Bool)

(assert (=> (not b_lambda!19407) (not b!1149569)))

(declare-fun t!36488 () Bool)

(declare-fun tb!9123 () Bool)

(assert (=> (and start!98708 (= defaultEntry!1004 defaultEntry!1004) t!36488) tb!9123))

(declare-fun result!18819 () Bool)

(assert (=> tb!9123 (= result!18819 tp_is_empty!28849)))

(assert (=> b!1149569 t!36488))

(declare-fun b_and!39467 () Bool)

(assert (= b_and!39465 (and (=> t!36488 result!18819) b_and!39467)))

(declare-fun m!1059423 () Bool)

(assert (=> start!98708 m!1059423))

(declare-fun m!1059425 () Bool)

(assert (=> start!98708 m!1059425))

(declare-fun m!1059427 () Bool)

(assert (=> bm!53345 m!1059427))

(declare-fun m!1059429 () Bool)

(assert (=> b!1149580 m!1059429))

(declare-fun m!1059431 () Bool)

(assert (=> b!1149574 m!1059431))

(assert (=> b!1149574 m!1059431))

(declare-fun m!1059433 () Bool)

(assert (=> b!1149574 m!1059433))

(declare-fun m!1059435 () Bool)

(assert (=> b!1149574 m!1059435))

(declare-fun m!1059437 () Bool)

(assert (=> b!1149573 m!1059437))

(declare-fun m!1059439 () Bool)

(assert (=> bm!53348 m!1059439))

(declare-fun m!1059441 () Bool)

(assert (=> b!1149567 m!1059441))

(assert (=> b!1149572 m!1059439))

(declare-fun m!1059443 () Bool)

(assert (=> b!1149572 m!1059443))

(declare-fun m!1059445 () Bool)

(assert (=> b!1149572 m!1059445))

(declare-fun m!1059447 () Bool)

(assert (=> b!1149572 m!1059447))

(declare-fun m!1059449 () Bool)

(assert (=> b!1149572 m!1059449))

(declare-fun m!1059451 () Bool)

(assert (=> b!1149572 m!1059451))

(assert (=> b!1149572 m!1059447))

(declare-fun m!1059453 () Bool)

(assert (=> b!1149572 m!1059453))

(declare-fun m!1059455 () Bool)

(assert (=> b!1149572 m!1059455))

(assert (=> b!1149572 m!1059445))

(assert (=> b!1149572 m!1059447))

(assert (=> b!1149572 m!1059443))

(declare-fun m!1059457 () Bool)

(assert (=> b!1149572 m!1059457))

(declare-fun m!1059459 () Bool)

(assert (=> bm!53349 m!1059459))

(declare-fun m!1059461 () Bool)

(assert (=> b!1149569 m!1059461))

(declare-fun m!1059463 () Bool)

(assert (=> b!1149569 m!1059463))

(declare-fun m!1059465 () Bool)

(assert (=> b!1149569 m!1059465))

(declare-fun m!1059467 () Bool)

(assert (=> b!1149569 m!1059467))

(declare-fun m!1059469 () Bool)

(assert (=> b!1149577 m!1059469))

(declare-fun m!1059471 () Bool)

(assert (=> b!1149562 m!1059471))

(declare-fun m!1059473 () Bool)

(assert (=> bm!53344 m!1059473))

(declare-fun m!1059475 () Bool)

(assert (=> b!1149587 m!1059475))

(declare-fun m!1059477 () Bool)

(assert (=> b!1149589 m!1059477))

(declare-fun m!1059479 () Bool)

(assert (=> b!1149589 m!1059479))

(assert (=> b!1149586 m!1059447))

(declare-fun m!1059481 () Bool)

(assert (=> b!1149586 m!1059481))

(declare-fun m!1059483 () Bool)

(assert (=> b!1149568 m!1059483))

(declare-fun m!1059485 () Bool)

(assert (=> b!1149568 m!1059485))

(declare-fun m!1059487 () Bool)

(assert (=> b!1149568 m!1059487))

(declare-fun m!1059489 () Bool)

(assert (=> b!1149568 m!1059489))

(declare-fun m!1059491 () Bool)

(assert (=> b!1149591 m!1059491))

(declare-fun m!1059493 () Bool)

(assert (=> mapNonEmpty!45098 m!1059493))

(declare-fun m!1059495 () Bool)

(assert (=> bm!53350 m!1059495))

(declare-fun m!1059497 () Bool)

(assert (=> b!1149575 m!1059497))

(declare-fun m!1059499 () Bool)

(assert (=> b!1149575 m!1059499))

(assert (=> b!1149579 m!1059475))

(assert (=> b!1149576 m!1059459))

(declare-fun m!1059501 () Bool)

(assert (=> b!1149570 m!1059501))

(check-sat (not bm!53344) (not b_next!24319) (not b!1149574) (not b!1149591) (not b!1149579) b_and!39467 (not b!1149575) (not bm!53349) (not bm!53345) (not b_lambda!19407) (not b!1149568) (not start!98708) (not b!1149569) (not mapNonEmpty!45098) (not b!1149567) (not b!1149580) (not b!1149576) (not b!1149573) (not b!1149586) (not bm!53350) (not bm!53348) tp_is_empty!28849 (not b!1149572) (not b!1149589) (not b!1149587) (not b!1149562) (not b!1149577))
(check-sat b_and!39467 (not b_next!24319))
