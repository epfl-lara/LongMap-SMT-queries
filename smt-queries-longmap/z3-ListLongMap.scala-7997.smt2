; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99058 () Bool)

(assert start!99058)

(declare-fun b_free!24427 () Bool)

(declare-fun b_next!24427 () Bool)

(assert (=> start!99058 (= b_free!24427 (not b_next!24427))))

(declare-fun tp!85992 () Bool)

(declare-fun b_and!39705 () Bool)

(assert (=> start!99058 (= tp!85992 b_and!39705)))

(declare-fun b!1155943 () Bool)

(declare-fun call!54738 () Bool)

(assert (=> b!1155943 call!54738))

(declare-datatypes ((Unit!37994 0))(
  ( (Unit!37995) )
))
(declare-fun lt!518323 () Unit!37994)

(declare-fun call!54737 () Unit!37994)

(assert (=> b!1155943 (= lt!518323 call!54737)))

(declare-fun e!657514 () Unit!37994)

(assert (=> b!1155943 (= e!657514 lt!518323)))

(declare-fun bm!54728 () Bool)

(declare-fun call!54734 () Bool)

(declare-datatypes ((V!43737 0))(
  ( (V!43738 (val!14535 Int)) )
))
(declare-datatypes ((tuple2!18496 0))(
  ( (tuple2!18497 (_1!9259 (_ BitVec 64)) (_2!9259 V!43737)) )
))
(declare-datatypes ((List!25241 0))(
  ( (Nil!25238) (Cons!25237 (h!26455 tuple2!18496) (t!36652 List!25241)) )
))
(declare-datatypes ((ListLongMap!16473 0))(
  ( (ListLongMap!16474 (toList!8252 List!25241)) )
))
(declare-fun lt!518310 () ListLongMap!16473)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!54732 () ListLongMap!16473)

(declare-fun c!115103 () Bool)

(declare-fun contains!6778 (ListLongMap!16473 (_ BitVec 64)) Bool)

(assert (=> bm!54728 (= call!54734 (contains!6778 (ite c!115103 lt!518310 call!54732) k0!934))))

(declare-fun bm!54729 () Bool)

(declare-fun call!54731 () Unit!37994)

(assert (=> bm!54729 (= call!54737 call!54731)))

(declare-fun b!1155944 () Bool)

(declare-fun res!767788 () Bool)

(declare-fun e!657515 () Bool)

(assert (=> b!1155944 (=> (not res!767788) (not e!657515))))

(declare-datatypes ((array!74805 0))(
  ( (array!74806 (arr!36047 (Array (_ BitVec 32) (_ BitVec 64))) (size!36584 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74805)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155944 (= res!767788 (= (select (arr!36047 _keys!1208) i!673) k0!934))))

(declare-fun b!1155945 () Bool)

(declare-fun c!115104 () Bool)

(declare-fun lt!518311 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1155945 (= c!115104 (and (not lt!518311) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657504 () Unit!37994)

(declare-fun e!657520 () Unit!37994)

(assert (=> b!1155945 (= e!657504 e!657520)))

(declare-fun b!1155946 () Bool)

(declare-fun res!767789 () Bool)

(assert (=> b!1155946 (=> (not res!767789) (not e!657515))))

(assert (=> b!1155946 (= res!767789 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36584 _keys!1208))))))

(declare-fun b!1155947 () Bool)

(declare-fun res!767793 () Bool)

(assert (=> b!1155947 (=> (not res!767793) (not e!657515))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155947 (= res!767793 (validMask!0 mask!1564))))

(declare-fun b!1155949 () Bool)

(declare-fun res!767791 () Bool)

(assert (=> b!1155949 (=> (not res!767791) (not e!657515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74805 (_ BitVec 32)) Bool)

(assert (=> b!1155949 (= res!767791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155950 () Bool)

(declare-fun Unit!37996 () Unit!37994)

(assert (=> b!1155950 (= e!657514 Unit!37996)))

(declare-fun b!1155951 () Bool)

(declare-fun res!767783 () Bool)

(assert (=> b!1155951 (=> (not res!767783) (not e!657515))))

(declare-datatypes ((ValueCell!13769 0))(
  ( (ValueCellFull!13769 (v!17168 V!43737)) (EmptyCell!13769) )
))
(declare-datatypes ((array!74807 0))(
  ( (array!74808 (arr!36048 (Array (_ BitVec 32) ValueCell!13769)) (size!36585 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74807)

(assert (=> b!1155951 (= res!767783 (and (= (size!36585 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36584 _keys!1208) (size!36585 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!43737)

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!54733 () ListLongMap!16473)

(declare-fun bm!54730 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43737)

(declare-fun getCurrentListMapNoExtraKeys!4747 (array!74805 array!74807 (_ BitVec 32) (_ BitVec 32) V!43737 V!43737 (_ BitVec 32) Int) ListLongMap!16473)

(assert (=> bm!54730 (= call!54733 (getCurrentListMapNoExtraKeys!4747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155952 () Bool)

(declare-fun res!767787 () Bool)

(assert (=> b!1155952 (=> (not res!767787) (not e!657515))))

(declare-datatypes ((List!25242 0))(
  ( (Nil!25239) (Cons!25238 (h!26456 (_ BitVec 64)) (t!36653 List!25242)) )
))
(declare-fun arrayNoDuplicates!0 (array!74805 (_ BitVec 32) List!25242) Bool)

(assert (=> b!1155952 (= res!767787 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25239))))

(declare-fun b!1155953 () Bool)

(declare-fun e!657517 () Bool)

(declare-fun e!657509 () Bool)

(declare-fun mapRes!45260 () Bool)

(assert (=> b!1155953 (= e!657517 (and e!657509 mapRes!45260))))

(declare-fun condMapEmpty!45260 () Bool)

(declare-fun mapDefault!45260 () ValueCell!13769)

(assert (=> b!1155953 (= condMapEmpty!45260 (= (arr!36048 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13769)) mapDefault!45260)))))

(declare-fun b!1155954 () Bool)

(declare-fun tp_is_empty!28957 () Bool)

(assert (=> b!1155954 (= e!657509 tp_is_empty!28957)))

(declare-fun b!1155955 () Bool)

(declare-fun e!657508 () Unit!37994)

(declare-fun Unit!37997 () Unit!37994)

(assert (=> b!1155955 (= e!657508 Unit!37997)))

(declare-fun lt!518314 () ListLongMap!16473)

(declare-fun call!54736 () ListLongMap!16473)

(declare-fun bm!54731 () Bool)

(declare-fun +!3679 (ListLongMap!16473 tuple2!18496) ListLongMap!16473)

(assert (=> bm!54731 (= call!54736 (+!3679 (ite c!115103 lt!518310 lt!518314) (ite c!115103 (tuple2!18497 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115104 (tuple2!18497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18497 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1155956 () Bool)

(declare-fun e!657510 () Bool)

(assert (=> b!1155956 (= e!657510 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518311) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155957 () Bool)

(declare-fun e!657518 () Bool)

(declare-fun e!657516 () Bool)

(assert (=> b!1155957 (= e!657518 e!657516)))

(declare-fun res!767792 () Bool)

(assert (=> b!1155957 (=> res!767792 e!657516)))

(assert (=> b!1155957 (= res!767792 (not (= (select (arr!36047 _keys!1208) from!1455) k0!934)))))

(declare-fun e!657506 () Bool)

(assert (=> b!1155957 e!657506))

(declare-fun c!115101 () Bool)

(assert (=> b!1155957 (= c!115101 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518325 () Unit!37994)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!600 (array!74805 array!74807 (_ BitVec 32) (_ BitVec 32) V!43737 V!43737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37994)

(assert (=> b!1155957 (= lt!518325 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!600 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155958 () Bool)

(assert (=> b!1155958 (= e!657516 true)))

(declare-fun e!657507 () Bool)

(assert (=> b!1155958 e!657507))

(declare-fun res!767794 () Bool)

(assert (=> b!1155958 (=> (not res!767794) (not e!657507))))

(declare-fun lt!518312 () ListLongMap!16473)

(assert (=> b!1155958 (= res!767794 (= lt!518312 lt!518314))))

(declare-fun lt!518313 () ListLongMap!16473)

(declare-fun -!1360 (ListLongMap!16473 (_ BitVec 64)) ListLongMap!16473)

(assert (=> b!1155958 (= lt!518312 (-!1360 lt!518313 k0!934))))

(declare-fun lt!518329 () V!43737)

(assert (=> b!1155958 (= (-!1360 (+!3679 lt!518314 (tuple2!18497 (select (arr!36047 _keys!1208) from!1455) lt!518329)) (select (arr!36047 _keys!1208) from!1455)) lt!518314)))

(declare-fun lt!518319 () Unit!37994)

(declare-fun addThenRemoveForNewKeyIsSame!200 (ListLongMap!16473 (_ BitVec 64) V!43737) Unit!37994)

(assert (=> b!1155958 (= lt!518319 (addThenRemoveForNewKeyIsSame!200 lt!518314 (select (arr!36047 _keys!1208) from!1455) lt!518329))))

(declare-fun lt!518328 () V!43737)

(declare-fun get!18387 (ValueCell!13769 V!43737) V!43737)

(assert (=> b!1155958 (= lt!518329 (get!18387 (select (arr!36048 _values!996) from!1455) lt!518328))))

(declare-fun lt!518327 () Unit!37994)

(assert (=> b!1155958 (= lt!518327 e!657508)))

(declare-fun c!115099 () Bool)

(assert (=> b!1155958 (= c!115099 (contains!6778 lt!518314 k0!934))))

(assert (=> b!1155958 (= lt!518314 (getCurrentListMapNoExtraKeys!4747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!518326 () array!74807)

(declare-fun lt!518309 () array!74805)

(declare-fun call!54735 () ListLongMap!16473)

(declare-fun bm!54732 () Bool)

(assert (=> bm!54732 (= call!54735 (getCurrentListMapNoExtraKeys!4747 lt!518309 lt!518326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54733 () Bool)

(declare-fun addStillContains!901 (ListLongMap!16473 (_ BitVec 64) V!43737 (_ BitVec 64)) Unit!37994)

(assert (=> bm!54733 (= call!54731 (addStillContains!901 (ite c!115103 lt!518310 lt!518314) (ite c!115103 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115104 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115103 minValue!944 (ite c!115104 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1155959 () Bool)

(assert (=> b!1155959 (= e!657520 e!657514)))

(declare-fun c!115102 () Bool)

(assert (=> b!1155959 (= c!115102 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518311))))

(declare-fun b!1155960 () Bool)

(declare-fun e!657512 () Bool)

(assert (=> b!1155960 (= e!657512 e!657518)))

(declare-fun res!767796 () Bool)

(assert (=> b!1155960 (=> res!767796 e!657518)))

(assert (=> b!1155960 (= res!767796 (not (= from!1455 i!673)))))

(declare-fun lt!518308 () ListLongMap!16473)

(assert (=> b!1155960 (= lt!518308 (getCurrentListMapNoExtraKeys!4747 lt!518309 lt!518326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1155960 (= lt!518326 (array!74808 (store (arr!36048 _values!996) i!673 (ValueCellFull!13769 lt!518328)) (size!36585 _values!996)))))

(declare-fun dynLambda!2764 (Int (_ BitVec 64)) V!43737)

(assert (=> b!1155960 (= lt!518328 (dynLambda!2764 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1155960 (= lt!518313 (getCurrentListMapNoExtraKeys!4747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155961 () Bool)

(declare-fun e!657513 () Bool)

(assert (=> b!1155961 (= e!657513 tp_is_empty!28957)))

(declare-fun e!657505 () Bool)

(declare-fun b!1155962 () Bool)

(declare-fun arrayContainsKey!0 (array!74805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155962 (= e!657505 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45260 () Bool)

(declare-fun tp!85991 () Bool)

(assert (=> mapNonEmpty!45260 (= mapRes!45260 (and tp!85991 e!657513))))

(declare-fun mapKey!45260 () (_ BitVec 32))

(declare-fun mapValue!45260 () ValueCell!13769)

(declare-fun mapRest!45260 () (Array (_ BitVec 32) ValueCell!13769))

(assert (=> mapNonEmpty!45260 (= (arr!36048 _values!996) (store mapRest!45260 mapKey!45260 mapValue!45260))))

(declare-fun b!1155963 () Bool)

(assert (=> b!1155963 (= e!657506 (= call!54735 (-!1360 call!54733 k0!934)))))

(declare-fun b!1155964 () Bool)

(declare-fun Unit!37998 () Unit!37994)

(assert (=> b!1155964 (= e!657508 Unit!37998)))

(assert (=> b!1155964 (= lt!518311 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155964 (= c!115103 (and (not lt!518311) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518318 () Unit!37994)

(assert (=> b!1155964 (= lt!518318 e!657504)))

(declare-fun lt!518320 () Unit!37994)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!494 (array!74805 array!74807 (_ BitVec 32) (_ BitVec 32) V!43737 V!43737 (_ BitVec 64) (_ BitVec 32) Int) Unit!37994)

(assert (=> b!1155964 (= lt!518320 (lemmaListMapContainsThenArrayContainsFrom!494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115100 () Bool)

(assert (=> b!1155964 (= c!115100 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767795 () Bool)

(assert (=> b!1155964 (= res!767795 e!657510)))

(assert (=> b!1155964 (=> (not res!767795) (not e!657505))))

(assert (=> b!1155964 e!657505))

(declare-fun lt!518324 () Unit!37994)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74805 (_ BitVec 32) (_ BitVec 32)) Unit!37994)

(assert (=> b!1155964 (= lt!518324 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155964 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25239)))

(declare-fun lt!518317 () Unit!37994)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74805 (_ BitVec 64) (_ BitVec 32) List!25242) Unit!37994)

(assert (=> b!1155964 (= lt!518317 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25239))))

(assert (=> b!1155964 false))

(declare-fun bm!54734 () Bool)

(assert (=> bm!54734 (= call!54732 call!54736)))

(declare-fun b!1155965 () Bool)

(declare-fun lt!518315 () Unit!37994)

(assert (=> b!1155965 (= e!657520 lt!518315)))

(assert (=> b!1155965 (= lt!518315 call!54737)))

(assert (=> b!1155965 call!54738))

(declare-fun b!1155966 () Bool)

(assert (=> b!1155966 (= e!657510 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!767785 () Bool)

(assert (=> start!99058 (=> (not res!767785) (not e!657515))))

(assert (=> start!99058 (= res!767785 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36584 _keys!1208))))))

(assert (=> start!99058 e!657515))

(assert (=> start!99058 tp_is_empty!28957))

(declare-fun array_inv!27648 (array!74805) Bool)

(assert (=> start!99058 (array_inv!27648 _keys!1208)))

(assert (=> start!99058 true))

(assert (=> start!99058 tp!85992))

(declare-fun array_inv!27649 (array!74807) Bool)

(assert (=> start!99058 (and (array_inv!27649 _values!996) e!657517)))

(declare-fun b!1155948 () Bool)

(declare-fun e!657519 () Bool)

(assert (=> b!1155948 (= e!657519 (not e!657512))))

(declare-fun res!767786 () Bool)

(assert (=> b!1155948 (=> res!767786 e!657512)))

(assert (=> b!1155948 (= res!767786 (bvsgt from!1455 i!673))))

(assert (=> b!1155948 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518321 () Unit!37994)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74805 (_ BitVec 64) (_ BitVec 32)) Unit!37994)

(assert (=> b!1155948 (= lt!518321 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1155967 () Bool)

(assert (=> b!1155967 (= e!657507 (= lt!518312 (getCurrentListMapNoExtraKeys!4747 lt!518309 lt!518326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1155968 () Bool)

(declare-fun res!767790 () Bool)

(assert (=> b!1155968 (=> (not res!767790) (not e!657515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155968 (= res!767790 (validKeyInArray!0 k0!934))))

(declare-fun b!1155969 () Bool)

(declare-fun res!767784 () Bool)

(assert (=> b!1155969 (=> (not res!767784) (not e!657519))))

(assert (=> b!1155969 (= res!767784 (arrayNoDuplicates!0 lt!518309 #b00000000000000000000000000000000 Nil!25239))))

(declare-fun mapIsEmpty!45260 () Bool)

(assert (=> mapIsEmpty!45260 mapRes!45260))

(declare-fun b!1155970 () Bool)

(assert (=> b!1155970 (= e!657515 e!657519)))

(declare-fun res!767782 () Bool)

(assert (=> b!1155970 (=> (not res!767782) (not e!657519))))

(assert (=> b!1155970 (= res!767782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518309 mask!1564))))

(assert (=> b!1155970 (= lt!518309 (array!74806 (store (arr!36047 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36584 _keys!1208)))))

(declare-fun bm!54735 () Bool)

(assert (=> bm!54735 (= call!54738 call!54734)))

(declare-fun b!1155971 () Bool)

(assert (=> b!1155971 (= e!657506 (= call!54735 call!54733))))

(declare-fun b!1155972 () Bool)

(assert (=> b!1155972 (contains!6778 call!54736 k0!934)))

(declare-fun lt!518322 () Unit!37994)

(assert (=> b!1155972 (= lt!518322 call!54731)))

(assert (=> b!1155972 call!54734))

(assert (=> b!1155972 (= lt!518310 (+!3679 lt!518314 (tuple2!18497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518316 () Unit!37994)

(assert (=> b!1155972 (= lt!518316 (addStillContains!901 lt!518314 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1155972 (= e!657504 lt!518322)))

(assert (= (and start!99058 res!767785) b!1155947))

(assert (= (and b!1155947 res!767793) b!1155951))

(assert (= (and b!1155951 res!767783) b!1155949))

(assert (= (and b!1155949 res!767791) b!1155952))

(assert (= (and b!1155952 res!767787) b!1155946))

(assert (= (and b!1155946 res!767789) b!1155968))

(assert (= (and b!1155968 res!767790) b!1155944))

(assert (= (and b!1155944 res!767788) b!1155970))

(assert (= (and b!1155970 res!767782) b!1155969))

(assert (= (and b!1155969 res!767784) b!1155948))

(assert (= (and b!1155948 (not res!767786)) b!1155960))

(assert (= (and b!1155960 (not res!767796)) b!1155957))

(assert (= (and b!1155957 c!115101) b!1155963))

(assert (= (and b!1155957 (not c!115101)) b!1155971))

(assert (= (or b!1155963 b!1155971) bm!54732))

(assert (= (or b!1155963 b!1155971) bm!54730))

(assert (= (and b!1155957 (not res!767792)) b!1155958))

(assert (= (and b!1155958 c!115099) b!1155964))

(assert (= (and b!1155958 (not c!115099)) b!1155955))

(assert (= (and b!1155964 c!115103) b!1155972))

(assert (= (and b!1155964 (not c!115103)) b!1155945))

(assert (= (and b!1155945 c!115104) b!1155965))

(assert (= (and b!1155945 (not c!115104)) b!1155959))

(assert (= (and b!1155959 c!115102) b!1155943))

(assert (= (and b!1155959 (not c!115102)) b!1155950))

(assert (= (or b!1155965 b!1155943) bm!54729))

(assert (= (or b!1155965 b!1155943) bm!54734))

(assert (= (or b!1155965 b!1155943) bm!54735))

(assert (= (or b!1155972 bm!54735) bm!54728))

(assert (= (or b!1155972 bm!54729) bm!54733))

(assert (= (or b!1155972 bm!54734) bm!54731))

(assert (= (and b!1155964 c!115100) b!1155966))

(assert (= (and b!1155964 (not c!115100)) b!1155956))

(assert (= (and b!1155964 res!767795) b!1155962))

(assert (= (and b!1155958 res!767794) b!1155967))

(assert (= (and b!1155953 condMapEmpty!45260) mapIsEmpty!45260))

(assert (= (and b!1155953 (not condMapEmpty!45260)) mapNonEmpty!45260))

(get-info :version)

(assert (= (and mapNonEmpty!45260 ((_ is ValueCellFull!13769) mapValue!45260)) b!1155961))

(assert (= (and b!1155953 ((_ is ValueCellFull!13769) mapDefault!45260)) b!1155954))

(assert (= start!99058 b!1155953))

(declare-fun b_lambda!19527 () Bool)

(assert (=> (not b_lambda!19527) (not b!1155960)))

(declare-fun t!36651 () Bool)

(declare-fun tb!9231 () Bool)

(assert (=> (and start!99058 (= defaultEntry!1004 defaultEntry!1004) t!36651) tb!9231))

(declare-fun result!19035 () Bool)

(assert (=> tb!9231 (= result!19035 tp_is_empty!28957)))

(assert (=> b!1155960 t!36651))

(declare-fun b_and!39707 () Bool)

(assert (= b_and!39705 (and (=> t!36651 result!19035) b_and!39707)))

(declare-fun m!1065917 () Bool)

(assert (=> b!1155963 m!1065917))

(declare-fun m!1065919 () Bool)

(assert (=> b!1155967 m!1065919))

(declare-fun m!1065921 () Bool)

(assert (=> b!1155964 m!1065921))

(declare-fun m!1065923 () Bool)

(assert (=> b!1155964 m!1065923))

(declare-fun m!1065925 () Bool)

(assert (=> b!1155964 m!1065925))

(declare-fun m!1065927 () Bool)

(assert (=> b!1155964 m!1065927))

(declare-fun m!1065929 () Bool)

(assert (=> b!1155962 m!1065929))

(declare-fun m!1065931 () Bool)

(assert (=> b!1155947 m!1065931))

(declare-fun m!1065933 () Bool)

(assert (=> start!99058 m!1065933))

(declare-fun m!1065935 () Bool)

(assert (=> start!99058 m!1065935))

(declare-fun m!1065937 () Bool)

(assert (=> mapNonEmpty!45260 m!1065937))

(declare-fun m!1065939 () Bool)

(assert (=> b!1155952 m!1065939))

(declare-fun m!1065941 () Bool)

(assert (=> b!1155949 m!1065941))

(declare-fun m!1065943 () Bool)

(assert (=> bm!54733 m!1065943))

(declare-fun m!1065945 () Bool)

(assert (=> b!1155972 m!1065945))

(declare-fun m!1065947 () Bool)

(assert (=> b!1155972 m!1065947))

(declare-fun m!1065949 () Bool)

(assert (=> b!1155972 m!1065949))

(declare-fun m!1065951 () Bool)

(assert (=> bm!54731 m!1065951))

(declare-fun m!1065953 () Bool)

(assert (=> b!1155968 m!1065953))

(declare-fun m!1065955 () Bool)

(assert (=> b!1155969 m!1065955))

(assert (=> b!1155966 m!1065929))

(assert (=> bm!54732 m!1065919))

(declare-fun m!1065957 () Bool)

(assert (=> b!1155944 m!1065957))

(declare-fun m!1065959 () Bool)

(assert (=> b!1155957 m!1065959))

(declare-fun m!1065961 () Bool)

(assert (=> b!1155957 m!1065961))

(declare-fun m!1065963 () Bool)

(assert (=> b!1155970 m!1065963))

(declare-fun m!1065965 () Bool)

(assert (=> b!1155970 m!1065965))

(assert (=> b!1155958 m!1065959))

(declare-fun m!1065967 () Bool)

(assert (=> b!1155958 m!1065967))

(declare-fun m!1065969 () Bool)

(assert (=> b!1155958 m!1065969))

(declare-fun m!1065971 () Bool)

(assert (=> b!1155958 m!1065971))

(assert (=> b!1155958 m!1065959))

(declare-fun m!1065973 () Bool)

(assert (=> b!1155958 m!1065973))

(declare-fun m!1065975 () Bool)

(assert (=> b!1155958 m!1065975))

(declare-fun m!1065977 () Bool)

(assert (=> b!1155958 m!1065977))

(assert (=> b!1155958 m!1065971))

(assert (=> b!1155958 m!1065959))

(declare-fun m!1065979 () Bool)

(assert (=> b!1155958 m!1065979))

(assert (=> b!1155958 m!1065969))

(declare-fun m!1065981 () Bool)

(assert (=> b!1155958 m!1065981))

(declare-fun m!1065983 () Bool)

(assert (=> b!1155960 m!1065983))

(declare-fun m!1065985 () Bool)

(assert (=> b!1155960 m!1065985))

(declare-fun m!1065987 () Bool)

(assert (=> b!1155960 m!1065987))

(declare-fun m!1065989 () Bool)

(assert (=> b!1155960 m!1065989))

(declare-fun m!1065991 () Bool)

(assert (=> b!1155948 m!1065991))

(declare-fun m!1065993 () Bool)

(assert (=> b!1155948 m!1065993))

(declare-fun m!1065995 () Bool)

(assert (=> bm!54728 m!1065995))

(assert (=> bm!54730 m!1065975))

(check-sat (not b!1155969) b_and!39707 (not bm!54732) (not b!1155970) (not start!99058) (not b!1155972) (not b!1155958) (not b!1155947) (not b!1155968) (not b!1155960) (not b!1155964) (not b!1155957) (not b!1155952) (not b!1155966) (not b_next!24427) (not bm!54731) (not bm!54728) (not b!1155949) (not bm!54730) (not b!1155967) tp_is_empty!28957 (not bm!54733) (not mapNonEmpty!45260) (not b!1155963) (not b!1155962) (not b_lambda!19527) (not b!1155948))
(check-sat b_and!39707 (not b_next!24427))
