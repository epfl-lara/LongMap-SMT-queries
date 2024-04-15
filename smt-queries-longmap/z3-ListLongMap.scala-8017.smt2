; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98936 () Bool)

(assert start!98936)

(declare-fun b_free!24547 () Bool)

(declare-fun b_next!24547 () Bool)

(assert (=> start!98936 (= b_free!24547 (not b_next!24547))))

(declare-fun tp!86352 () Bool)

(declare-fun b_and!39921 () Bool)

(assert (=> start!98936 (= tp!86352 b_and!39921)))

(declare-datatypes ((V!43897 0))(
  ( (V!43898 (val!14595 Int)) )
))
(declare-fun zeroValue!944 () V!43897)

(declare-fun c!115757 () Bool)

(declare-fun c!115755 () Bool)

(declare-datatypes ((tuple2!18674 0))(
  ( (tuple2!18675 (_1!9348 (_ BitVec 64)) (_2!9348 V!43897)) )
))
(declare-datatypes ((List!25394 0))(
  ( (Nil!25391) (Cons!25390 (h!26599 tuple2!18674) (t!36924 List!25394)) )
))
(declare-datatypes ((ListLongMap!16643 0))(
  ( (ListLongMap!16644 (toList!8337 List!25394)) )
))
(declare-fun lt!521604 () ListLongMap!16643)

(declare-fun lt!521607 () ListLongMap!16643)

(declare-fun call!56087 () ListLongMap!16643)

(declare-fun bm!56080 () Bool)

(declare-fun minValue!944 () V!43897)

(declare-fun +!3743 (ListLongMap!16643 tuple2!18674) ListLongMap!16643)

(assert (=> bm!56080 (= call!56087 (+!3743 (ite c!115757 lt!521607 lt!521604) (ite c!115757 (tuple2!18675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115755 (tuple2!18675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18675 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!56086 () ListLongMap!16643)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!56081 () Bool)

(declare-fun call!56085 () Bool)

(declare-fun contains!6786 (ListLongMap!16643 (_ BitVec 64)) Bool)

(assert (=> bm!56081 (= call!56085 (contains!6786 (ite c!115757 lt!521607 call!56086) k0!934))))

(declare-fun b!1160050 () Bool)

(declare-fun e!659659 () Bool)

(assert (=> b!1160050 (= e!659659 true)))

(declare-fun e!659668 () Bool)

(assert (=> b!1160050 e!659668))

(declare-fun res!769915 () Bool)

(assert (=> b!1160050 (=> (not res!769915) (not e!659668))))

(declare-fun lt!521598 () ListLongMap!16643)

(assert (=> b!1160050 (= res!769915 (= lt!521598 lt!521604))))

(declare-fun lt!521592 () ListLongMap!16643)

(declare-fun -!1388 (ListLongMap!16643 (_ BitVec 64)) ListLongMap!16643)

(assert (=> b!1160050 (= lt!521598 (-!1388 lt!521592 k0!934))))

(declare-datatypes ((array!74916 0))(
  ( (array!74917 (arr!36109 (Array (_ BitVec 32) (_ BitVec 64))) (size!36647 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74916)

(declare-fun lt!521596 () V!43897)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1160050 (= (-!1388 (+!3743 lt!521604 (tuple2!18675 (select (arr!36109 _keys!1208) from!1455) lt!521596)) (select (arr!36109 _keys!1208) from!1455)) lt!521604)))

(declare-datatypes ((Unit!38085 0))(
  ( (Unit!38086) )
))
(declare-fun lt!521605 () Unit!38085)

(declare-fun addThenRemoveForNewKeyIsSame!234 (ListLongMap!16643 (_ BitVec 64) V!43897) Unit!38085)

(assert (=> b!1160050 (= lt!521605 (addThenRemoveForNewKeyIsSame!234 lt!521604 (select (arr!36109 _keys!1208) from!1455) lt!521596))))

(declare-fun lt!521609 () V!43897)

(declare-datatypes ((ValueCell!13829 0))(
  ( (ValueCellFull!13829 (v!17231 V!43897)) (EmptyCell!13829) )
))
(declare-datatypes ((array!74918 0))(
  ( (array!74919 (arr!36110 (Array (_ BitVec 32) ValueCell!13829)) (size!36648 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74918)

(declare-fun get!18430 (ValueCell!13829 V!43897) V!43897)

(assert (=> b!1160050 (= lt!521596 (get!18430 (select (arr!36110 _values!996) from!1455) lt!521609))))

(declare-fun lt!521600 () Unit!38085)

(declare-fun e!659666 () Unit!38085)

(assert (=> b!1160050 (= lt!521600 e!659666)))

(declare-fun c!115758 () Bool)

(assert (=> b!1160050 (= c!115758 (contains!6786 lt!521604 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4816 (array!74916 array!74918 (_ BitVec 32) (_ BitVec 32) V!43897 V!43897 (_ BitVec 32) Int) ListLongMap!16643)

(assert (=> b!1160050 (= lt!521604 (getCurrentListMapNoExtraKeys!4816 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160051 () Bool)

(declare-fun e!659654 () Bool)

(declare-fun arrayContainsKey!0 (array!74916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160051 (= e!659654 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160052 () Bool)

(declare-fun e!659662 () Bool)

(declare-fun e!659669 () Bool)

(declare-fun mapRes!45440 () Bool)

(assert (=> b!1160052 (= e!659662 (and e!659669 mapRes!45440))))

(declare-fun condMapEmpty!45440 () Bool)

(declare-fun mapDefault!45440 () ValueCell!13829)

(assert (=> b!1160052 (= condMapEmpty!45440 (= (arr!36110 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13829)) mapDefault!45440)))))

(declare-fun e!659656 () Bool)

(declare-fun call!56083 () ListLongMap!16643)

(declare-fun call!56089 () ListLongMap!16643)

(declare-fun b!1160053 () Bool)

(assert (=> b!1160053 (= e!659656 (= call!56089 (-!1388 call!56083 k0!934)))))

(declare-fun bm!56082 () Bool)

(assert (=> bm!56082 (= call!56083 (getCurrentListMapNoExtraKeys!4816 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160054 () Bool)

(declare-fun Unit!38087 () Unit!38085)

(assert (=> b!1160054 (= e!659666 Unit!38087)))

(declare-fun b!1160055 () Bool)

(declare-fun res!769919 () Bool)

(declare-fun e!659655 () Bool)

(assert (=> b!1160055 (=> (not res!769919) (not e!659655))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160055 (= res!769919 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36647 _keys!1208))))))

(declare-fun mapIsEmpty!45440 () Bool)

(assert (=> mapIsEmpty!45440 mapRes!45440))

(declare-fun b!1160056 () Bool)

(declare-fun res!769917 () Bool)

(declare-fun e!659658 () Bool)

(assert (=> b!1160056 (=> (not res!769917) (not e!659658))))

(declare-fun lt!521594 () array!74916)

(declare-datatypes ((List!25395 0))(
  ( (Nil!25392) (Cons!25391 (h!26600 (_ BitVec 64)) (t!36925 List!25395)) )
))
(declare-fun arrayNoDuplicates!0 (array!74916 (_ BitVec 32) List!25395) Bool)

(assert (=> b!1160056 (= res!769917 (arrayNoDuplicates!0 lt!521594 #b00000000000000000000000000000000 Nil!25392))))

(declare-fun b!1160057 () Bool)

(declare-fun lt!521608 () Bool)

(assert (=> b!1160057 (= c!115755 (and (not lt!521608) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!659665 () Unit!38085)

(declare-fun e!659663 () Unit!38085)

(assert (=> b!1160057 (= e!659665 e!659663)))

(declare-fun b!1160058 () Bool)

(declare-fun res!769909 () Bool)

(assert (=> b!1160058 (=> (not res!769909) (not e!659655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160058 (= res!769909 (validMask!0 mask!1564))))

(declare-fun res!769908 () Bool)

(assert (=> start!98936 (=> (not res!769908) (not e!659655))))

(assert (=> start!98936 (= res!769908 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36647 _keys!1208))))))

(assert (=> start!98936 e!659655))

(declare-fun tp_is_empty!29077 () Bool)

(assert (=> start!98936 tp_is_empty!29077))

(declare-fun array_inv!27744 (array!74916) Bool)

(assert (=> start!98936 (array_inv!27744 _keys!1208)))

(assert (=> start!98936 true))

(assert (=> start!98936 tp!86352))

(declare-fun array_inv!27745 (array!74918) Bool)

(assert (=> start!98936 (and (array_inv!27745 _values!996) e!659662)))

(declare-fun b!1160059 () Bool)

(declare-fun e!659661 () Bool)

(declare-fun e!659660 () Bool)

(assert (=> b!1160059 (= e!659661 e!659660)))

(declare-fun res!769922 () Bool)

(assert (=> b!1160059 (=> res!769922 e!659660)))

(assert (=> b!1160059 (= res!769922 (not (= from!1455 i!673)))))

(declare-fun lt!521601 () ListLongMap!16643)

(declare-fun lt!521602 () array!74918)

(assert (=> b!1160059 (= lt!521601 (getCurrentListMapNoExtraKeys!4816 lt!521594 lt!521602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1160059 (= lt!521602 (array!74919 (store (arr!36110 _values!996) i!673 (ValueCellFull!13829 lt!521609)) (size!36648 _values!996)))))

(declare-fun dynLambda!2760 (Int (_ BitVec 64)) V!43897)

(assert (=> b!1160059 (= lt!521609 (dynLambda!2760 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1160059 (= lt!521592 (getCurrentListMapNoExtraKeys!4816 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160060 () Bool)

(declare-fun call!56088 () Bool)

(assert (=> b!1160060 call!56088))

(declare-fun lt!521612 () Unit!38085)

(declare-fun call!56084 () Unit!38085)

(assert (=> b!1160060 (= lt!521612 call!56084)))

(declare-fun e!659657 () Unit!38085)

(assert (=> b!1160060 (= e!659657 lt!521612)))

(declare-fun b!1160061 () Bool)

(assert (=> b!1160061 (= e!659660 e!659659)))

(declare-fun res!769920 () Bool)

(assert (=> b!1160061 (=> res!769920 e!659659)))

(assert (=> b!1160061 (= res!769920 (not (= (select (arr!36109 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1160061 e!659656))

(declare-fun c!115759 () Bool)

(assert (=> b!1160061 (= c!115759 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!521593 () Unit!38085)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!656 (array!74916 array!74918 (_ BitVec 32) (_ BitVec 32) V!43897 V!43897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38085)

(assert (=> b!1160061 (= lt!521593 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!656 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160062 () Bool)

(assert (=> b!1160062 (= e!659655 e!659658)))

(declare-fun res!769916 () Bool)

(assert (=> b!1160062 (=> (not res!769916) (not e!659658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74916 (_ BitVec 32)) Bool)

(assert (=> b!1160062 (= res!769916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521594 mask!1564))))

(assert (=> b!1160062 (= lt!521594 (array!74917 (store (arr!36109 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36647 _keys!1208)))))

(declare-fun b!1160063 () Bool)

(assert (=> b!1160063 (contains!6786 call!56087 k0!934)))

(declare-fun lt!521610 () Unit!38085)

(declare-fun addStillContains!951 (ListLongMap!16643 (_ BitVec 64) V!43897 (_ BitVec 64)) Unit!38085)

(assert (=> b!1160063 (= lt!521610 (addStillContains!951 lt!521607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1160063 call!56085))

(assert (=> b!1160063 (= lt!521607 (+!3743 lt!521604 (tuple2!18675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521611 () Unit!38085)

(declare-fun call!56090 () Unit!38085)

(assert (=> b!1160063 (= lt!521611 call!56090)))

(assert (=> b!1160063 (= e!659665 lt!521610)))

(declare-fun b!1160064 () Bool)

(declare-fun e!659664 () Bool)

(assert (=> b!1160064 (= e!659664 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521608) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160065 () Bool)

(assert (=> b!1160065 (= e!659669 tp_is_empty!29077)))

(declare-fun b!1160066 () Bool)

(assert (=> b!1160066 (= e!659668 (= lt!521598 (getCurrentListMapNoExtraKeys!4816 lt!521594 lt!521602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1160067 () Bool)

(assert (=> b!1160067 (= e!659656 (= call!56089 call!56083))))

(declare-fun b!1160068 () Bool)

(declare-fun res!769918 () Bool)

(assert (=> b!1160068 (=> (not res!769918) (not e!659655))))

(assert (=> b!1160068 (= res!769918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!56083 () Bool)

(assert (=> bm!56083 (= call!56086 call!56087)))

(declare-fun b!1160069 () Bool)

(assert (=> b!1160069 (= e!659664 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160070 () Bool)

(assert (=> b!1160070 (= e!659658 (not e!659661))))

(declare-fun res!769921 () Bool)

(assert (=> b!1160070 (=> res!769921 e!659661)))

(assert (=> b!1160070 (= res!769921 (bvsgt from!1455 i!673))))

(assert (=> b!1160070 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521613 () Unit!38085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74916 (_ BitVec 64) (_ BitVec 32)) Unit!38085)

(assert (=> b!1160070 (= lt!521613 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1160071 () Bool)

(declare-fun res!769912 () Bool)

(assert (=> b!1160071 (=> (not res!769912) (not e!659655))))

(assert (=> b!1160071 (= res!769912 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25392))))

(declare-fun b!1160072 () Bool)

(declare-fun e!659670 () Bool)

(assert (=> b!1160072 (= e!659670 tp_is_empty!29077)))

(declare-fun bm!56084 () Bool)

(assert (=> bm!56084 (= call!56088 call!56085)))

(declare-fun bm!56085 () Bool)

(assert (=> bm!56085 (= call!56089 (getCurrentListMapNoExtraKeys!4816 lt!521594 lt!521602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56086 () Bool)

(assert (=> bm!56086 (= call!56084 call!56090)))

(declare-fun b!1160073 () Bool)

(declare-fun res!769910 () Bool)

(assert (=> b!1160073 (=> (not res!769910) (not e!659655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160073 (= res!769910 (validKeyInArray!0 k0!934))))

(declare-fun b!1160074 () Bool)

(declare-fun res!769914 () Bool)

(assert (=> b!1160074 (=> (not res!769914) (not e!659655))))

(assert (=> b!1160074 (= res!769914 (and (= (size!36648 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36647 _keys!1208) (size!36648 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160075 () Bool)

(declare-fun Unit!38088 () Unit!38085)

(assert (=> b!1160075 (= e!659657 Unit!38088)))

(declare-fun b!1160076 () Bool)

(assert (=> b!1160076 (= e!659663 e!659657)))

(declare-fun c!115756 () Bool)

(assert (=> b!1160076 (= c!115756 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521608))))

(declare-fun b!1160077 () Bool)

(declare-fun Unit!38089 () Unit!38085)

(assert (=> b!1160077 (= e!659666 Unit!38089)))

(assert (=> b!1160077 (= lt!521608 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160077 (= c!115757 (and (not lt!521608) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!521595 () Unit!38085)

(assert (=> b!1160077 (= lt!521595 e!659665)))

(declare-fun lt!521606 () Unit!38085)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!526 (array!74916 array!74918 (_ BitVec 32) (_ BitVec 32) V!43897 V!43897 (_ BitVec 64) (_ BitVec 32) Int) Unit!38085)

(assert (=> b!1160077 (= lt!521606 (lemmaListMapContainsThenArrayContainsFrom!526 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115760 () Bool)

(assert (=> b!1160077 (= c!115760 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769911 () Bool)

(assert (=> b!1160077 (= res!769911 e!659664)))

(assert (=> b!1160077 (=> (not res!769911) (not e!659654))))

(assert (=> b!1160077 e!659654))

(declare-fun lt!521597 () Unit!38085)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74916 (_ BitVec 32) (_ BitVec 32)) Unit!38085)

(assert (=> b!1160077 (= lt!521597 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160077 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25392)))

(declare-fun lt!521599 () Unit!38085)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74916 (_ BitVec 64) (_ BitVec 32) List!25395) Unit!38085)

(assert (=> b!1160077 (= lt!521599 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25392))))

(assert (=> b!1160077 false))

(declare-fun b!1160078 () Bool)

(declare-fun lt!521603 () Unit!38085)

(assert (=> b!1160078 (= e!659663 lt!521603)))

(assert (=> b!1160078 (= lt!521603 call!56084)))

(assert (=> b!1160078 call!56088))

(declare-fun bm!56087 () Bool)

(assert (=> bm!56087 (= call!56090 (addStillContains!951 lt!521604 (ite (or c!115757 c!115755) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115757 c!115755) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1160079 () Bool)

(declare-fun res!769913 () Bool)

(assert (=> b!1160079 (=> (not res!769913) (not e!659655))))

(assert (=> b!1160079 (= res!769913 (= (select (arr!36109 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45440 () Bool)

(declare-fun tp!86351 () Bool)

(assert (=> mapNonEmpty!45440 (= mapRes!45440 (and tp!86351 e!659670))))

(declare-fun mapRest!45440 () (Array (_ BitVec 32) ValueCell!13829))

(declare-fun mapKey!45440 () (_ BitVec 32))

(declare-fun mapValue!45440 () ValueCell!13829)

(assert (=> mapNonEmpty!45440 (= (arr!36110 _values!996) (store mapRest!45440 mapKey!45440 mapValue!45440))))

(assert (= (and start!98936 res!769908) b!1160058))

(assert (= (and b!1160058 res!769909) b!1160074))

(assert (= (and b!1160074 res!769914) b!1160068))

(assert (= (and b!1160068 res!769918) b!1160071))

(assert (= (and b!1160071 res!769912) b!1160055))

(assert (= (and b!1160055 res!769919) b!1160073))

(assert (= (and b!1160073 res!769910) b!1160079))

(assert (= (and b!1160079 res!769913) b!1160062))

(assert (= (and b!1160062 res!769916) b!1160056))

(assert (= (and b!1160056 res!769917) b!1160070))

(assert (= (and b!1160070 (not res!769921)) b!1160059))

(assert (= (and b!1160059 (not res!769922)) b!1160061))

(assert (= (and b!1160061 c!115759) b!1160053))

(assert (= (and b!1160061 (not c!115759)) b!1160067))

(assert (= (or b!1160053 b!1160067) bm!56085))

(assert (= (or b!1160053 b!1160067) bm!56082))

(assert (= (and b!1160061 (not res!769920)) b!1160050))

(assert (= (and b!1160050 c!115758) b!1160077))

(assert (= (and b!1160050 (not c!115758)) b!1160054))

(assert (= (and b!1160077 c!115757) b!1160063))

(assert (= (and b!1160077 (not c!115757)) b!1160057))

(assert (= (and b!1160057 c!115755) b!1160078))

(assert (= (and b!1160057 (not c!115755)) b!1160076))

(assert (= (and b!1160076 c!115756) b!1160060))

(assert (= (and b!1160076 (not c!115756)) b!1160075))

(assert (= (or b!1160078 b!1160060) bm!56086))

(assert (= (or b!1160078 b!1160060) bm!56083))

(assert (= (or b!1160078 b!1160060) bm!56084))

(assert (= (or b!1160063 bm!56084) bm!56081))

(assert (= (or b!1160063 bm!56086) bm!56087))

(assert (= (or b!1160063 bm!56083) bm!56080))

(assert (= (and b!1160077 c!115760) b!1160069))

(assert (= (and b!1160077 (not c!115760)) b!1160064))

(assert (= (and b!1160077 res!769911) b!1160051))

(assert (= (and b!1160050 res!769915) b!1160066))

(assert (= (and b!1160052 condMapEmpty!45440) mapIsEmpty!45440))

(assert (= (and b!1160052 (not condMapEmpty!45440)) mapNonEmpty!45440))

(get-info :version)

(assert (= (and mapNonEmpty!45440 ((_ is ValueCellFull!13829) mapValue!45440)) b!1160072))

(assert (= (and b!1160052 ((_ is ValueCellFull!13829) mapDefault!45440)) b!1160065))

(assert (= start!98936 b!1160052))

(declare-fun b_lambda!19635 () Bool)

(assert (=> (not b_lambda!19635) (not b!1160059)))

(declare-fun t!36923 () Bool)

(declare-fun tb!9351 () Bool)

(assert (=> (and start!98936 (= defaultEntry!1004 defaultEntry!1004) t!36923) tb!9351))

(declare-fun result!19275 () Bool)

(assert (=> tb!9351 (= result!19275 tp_is_empty!29077)))

(assert (=> b!1160059 t!36923))

(declare-fun b_and!39923 () Bool)

(assert (= b_and!39921 (and (=> t!36923 result!19275) b_and!39923)))

(declare-fun m!1068555 () Bool)

(assert (=> b!1160077 m!1068555))

(declare-fun m!1068557 () Bool)

(assert (=> b!1160077 m!1068557))

(declare-fun m!1068559 () Bool)

(assert (=> b!1160077 m!1068559))

(declare-fun m!1068561 () Bool)

(assert (=> b!1160077 m!1068561))

(declare-fun m!1068563 () Bool)

(assert (=> bm!56080 m!1068563))

(declare-fun m!1068565 () Bool)

(assert (=> bm!56082 m!1068565))

(declare-fun m!1068567 () Bool)

(assert (=> b!1160056 m!1068567))

(declare-fun m!1068569 () Bool)

(assert (=> b!1160063 m!1068569))

(declare-fun m!1068571 () Bool)

(assert (=> b!1160063 m!1068571))

(declare-fun m!1068573 () Bool)

(assert (=> b!1160063 m!1068573))

(declare-fun m!1068575 () Bool)

(assert (=> bm!56081 m!1068575))

(declare-fun m!1068577 () Bool)

(assert (=> b!1160066 m!1068577))

(declare-fun m!1068579 () Bool)

(assert (=> b!1160053 m!1068579))

(declare-fun m!1068581 () Bool)

(assert (=> b!1160073 m!1068581))

(declare-fun m!1068583 () Bool)

(assert (=> mapNonEmpty!45440 m!1068583))

(declare-fun m!1068585 () Bool)

(assert (=> start!98936 m!1068585))

(declare-fun m!1068587 () Bool)

(assert (=> start!98936 m!1068587))

(declare-fun m!1068589 () Bool)

(assert (=> b!1160058 m!1068589))

(declare-fun m!1068591 () Bool)

(assert (=> bm!56087 m!1068591))

(declare-fun m!1068593 () Bool)

(assert (=> b!1160079 m!1068593))

(assert (=> b!1160050 m!1068565))

(declare-fun m!1068595 () Bool)

(assert (=> b!1160050 m!1068595))

(declare-fun m!1068597 () Bool)

(assert (=> b!1160050 m!1068597))

(declare-fun m!1068599 () Bool)

(assert (=> b!1160050 m!1068599))

(declare-fun m!1068601 () Bool)

(assert (=> b!1160050 m!1068601))

(assert (=> b!1160050 m!1068597))

(declare-fun m!1068603 () Bool)

(assert (=> b!1160050 m!1068603))

(assert (=> b!1160050 m!1068595))

(assert (=> b!1160050 m!1068601))

(declare-fun m!1068605 () Bool)

(assert (=> b!1160050 m!1068605))

(declare-fun m!1068607 () Bool)

(assert (=> b!1160050 m!1068607))

(declare-fun m!1068609 () Bool)

(assert (=> b!1160050 m!1068609))

(assert (=> b!1160050 m!1068597))

(declare-fun m!1068611 () Bool)

(assert (=> b!1160068 m!1068611))

(declare-fun m!1068613 () Bool)

(assert (=> b!1160051 m!1068613))

(declare-fun m!1068615 () Bool)

(assert (=> b!1160070 m!1068615))

(declare-fun m!1068617 () Bool)

(assert (=> b!1160070 m!1068617))

(declare-fun m!1068619 () Bool)

(assert (=> b!1160062 m!1068619))

(declare-fun m!1068621 () Bool)

(assert (=> b!1160062 m!1068621))

(assert (=> b!1160061 m!1068597))

(declare-fun m!1068623 () Bool)

(assert (=> b!1160061 m!1068623))

(assert (=> bm!56085 m!1068577))

(declare-fun m!1068625 () Bool)

(assert (=> b!1160059 m!1068625))

(declare-fun m!1068627 () Bool)

(assert (=> b!1160059 m!1068627))

(declare-fun m!1068629 () Bool)

(assert (=> b!1160059 m!1068629))

(declare-fun m!1068631 () Bool)

(assert (=> b!1160059 m!1068631))

(assert (=> b!1160069 m!1068613))

(declare-fun m!1068633 () Bool)

(assert (=> b!1160071 m!1068633))

(check-sat (not b_lambda!19635) (not start!98936) (not b!1160058) (not b!1160073) (not b_next!24547) (not b!1160053) (not b!1160062) (not b!1160068) (not bm!56081) (not b!1160071) (not b!1160050) (not bm!56080) (not b!1160070) (not b!1160061) b_and!39923 (not b!1160056) (not mapNonEmpty!45440) (not b!1160063) (not bm!56087) tp_is_empty!29077 (not b!1160066) (not b!1160069) (not bm!56082) (not b!1160051) (not b!1160077) (not b!1160059) (not bm!56085))
(check-sat b_and!39923 (not b_next!24547))
