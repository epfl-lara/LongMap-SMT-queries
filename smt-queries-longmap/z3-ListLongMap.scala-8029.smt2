; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99250 () Bool)

(assert start!99250)

(declare-fun b_free!24619 () Bool)

(declare-fun b_next!24619 () Bool)

(assert (=> start!99250 (= b_free!24619 (not b_next!24619))))

(declare-fun tp!86568 () Bool)

(declare-fun b_and!40089 () Bool)

(assert (=> start!99250 (= tp!86568 b_and!40089)))

(declare-fun mapNonEmpty!45548 () Bool)

(declare-fun mapRes!45548 () Bool)

(declare-fun tp!86567 () Bool)

(declare-fun e!662409 () Bool)

(assert (=> mapNonEmpty!45548 (= mapRes!45548 (and tp!86567 e!662409))))

(declare-datatypes ((V!43993 0))(
  ( (V!43994 (val!14631 Int)) )
))
(declare-datatypes ((ValueCell!13865 0))(
  ( (ValueCellFull!13865 (v!17264 V!43993)) (EmptyCell!13865) )
))
(declare-fun mapRest!45548 () (Array (_ BitVec 32) ValueCell!13865))

(declare-datatypes ((array!75185 0))(
  ( (array!75186 (arr!36237 (Array (_ BitVec 32) ValueCell!13865)) (size!36774 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75185)

(declare-fun mapKey!45548 () (_ BitVec 32))

(declare-fun mapValue!45548 () ValueCell!13865)

(assert (=> mapNonEmpty!45548 (= (arr!36237 _values!996) (store mapRest!45548 mapKey!45548 mapValue!45548))))

(declare-fun b!1164775 () Bool)

(declare-fun c!116828 () Bool)

(declare-fun lt!524656 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1164775 (= c!116828 (and (not lt!524656) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38377 0))(
  ( (Unit!38378) )
))
(declare-fun e!662405 () Unit!38377)

(declare-fun e!662408 () Unit!38377)

(assert (=> b!1164775 (= e!662405 e!662408)))

(declare-fun b!1164776 () Bool)

(declare-fun e!662404 () Unit!38377)

(declare-fun Unit!38379 () Unit!38377)

(assert (=> b!1164776 (= e!662404 Unit!38379)))

(declare-fun b!1164777 () Bool)

(declare-fun e!662410 () Bool)

(declare-fun e!662401 () Bool)

(assert (=> b!1164777 (= e!662410 (not e!662401))))

(declare-fun res!772105 () Bool)

(assert (=> b!1164777 (=> res!772105 e!662401)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164777 (= res!772105 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75187 0))(
  ( (array!75188 (arr!36238 (Array (_ BitVec 32) (_ BitVec 64))) (size!36775 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75187)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164777 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!524655 () Unit!38377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75187 (_ BitVec 64) (_ BitVec 32)) Unit!38377)

(assert (=> b!1164777 (= lt!524655 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164778 () Bool)

(declare-fun res!772111 () Bool)

(declare-fun e!662403 () Bool)

(assert (=> b!1164778 (=> (not res!772111) (not e!662403))))

(assert (=> b!1164778 (= res!772111 (= (select (arr!36238 _keys!1208) i!673) k0!934))))

(declare-fun b!1164779 () Bool)

(declare-fun e!662413 () Bool)

(assert (=> b!1164779 (= e!662413 true)))

(declare-fun e!662412 () Bool)

(assert (=> b!1164779 e!662412))

(declare-fun res!772113 () Bool)

(assert (=> b!1164779 (=> (not res!772113) (not e!662412))))

(declare-datatypes ((tuple2!18684 0))(
  ( (tuple2!18685 (_1!9353 (_ BitVec 64)) (_2!9353 V!43993)) )
))
(declare-datatypes ((List!25418 0))(
  ( (Nil!25415) (Cons!25414 (h!26632 tuple2!18684) (t!37021 List!25418)) )
))
(declare-datatypes ((ListLongMap!16661 0))(
  ( (ListLongMap!16662 (toList!8346 List!25418)) )
))
(declare-fun lt!524645 () ListLongMap!16661)

(declare-fun lt!524654 () ListLongMap!16661)

(assert (=> b!1164779 (= res!772113 (= lt!524645 lt!524654))))

(declare-fun lt!524652 () ListLongMap!16661)

(declare-fun -!1440 (ListLongMap!16661 (_ BitVec 64)) ListLongMap!16661)

(assert (=> b!1164779 (= lt!524645 (-!1440 lt!524652 k0!934))))

(declare-fun lt!524659 () V!43993)

(declare-fun +!3761 (ListLongMap!16661 tuple2!18684) ListLongMap!16661)

(assert (=> b!1164779 (= (-!1440 (+!3761 lt!524654 (tuple2!18685 (select (arr!36238 _keys!1208) from!1455) lt!524659)) (select (arr!36238 _keys!1208) from!1455)) lt!524654)))

(declare-fun lt!524658 () Unit!38377)

(declare-fun addThenRemoveForNewKeyIsSame!267 (ListLongMap!16661 (_ BitVec 64) V!43993) Unit!38377)

(assert (=> b!1164779 (= lt!524658 (addThenRemoveForNewKeyIsSame!267 lt!524654 (select (arr!36238 _keys!1208) from!1455) lt!524659))))

(declare-fun lt!524664 () V!43993)

(declare-fun get!18518 (ValueCell!13865 V!43993) V!43993)

(assert (=> b!1164779 (= lt!524659 (get!18518 (select (arr!36237 _values!996) from!1455) lt!524664))))

(declare-fun lt!524662 () Unit!38377)

(declare-fun e!662414 () Unit!38377)

(assert (=> b!1164779 (= lt!524662 e!662414)))

(declare-fun c!116832 () Bool)

(declare-fun contains!6862 (ListLongMap!16661 (_ BitVec 64)) Bool)

(assert (=> b!1164779 (= c!116832 (contains!6862 lt!524654 k0!934))))

(declare-fun zeroValue!944 () V!43993)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43993)

(declare-fun getCurrentListMapNoExtraKeys!4837 (array!75187 array!75185 (_ BitVec 32) (_ BitVec 32) V!43993 V!43993 (_ BitVec 32) Int) ListLongMap!16661)

(assert (=> b!1164779 (= lt!524654 (getCurrentListMapNoExtraKeys!4837 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164780 () Bool)

(declare-fun e!662411 () Bool)

(assert (=> b!1164780 (= e!662411 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524656) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!662400 () Bool)

(declare-fun b!1164781 () Bool)

(declare-fun call!57041 () ListLongMap!16661)

(declare-fun call!57037 () ListLongMap!16661)

(assert (=> b!1164781 (= e!662400 (= call!57037 (-!1440 call!57041 k0!934)))))

(declare-fun b!1164782 () Bool)

(assert (=> b!1164782 (= e!662403 e!662410)))

(declare-fun res!772115 () Bool)

(assert (=> b!1164782 (=> (not res!772115) (not e!662410))))

(declare-fun lt!524644 () array!75187)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75187 (_ BitVec 32)) Bool)

(assert (=> b!1164782 (= res!772115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524644 mask!1564))))

(assert (=> b!1164782 (= lt!524644 (array!75188 (store (arr!36238 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36775 _keys!1208)))))

(declare-fun b!1164783 () Bool)

(declare-fun lt!524651 () Unit!38377)

(assert (=> b!1164783 (= e!662408 lt!524651)))

(declare-fun call!57039 () Unit!38377)

(assert (=> b!1164783 (= lt!524651 call!57039)))

(declare-fun call!57038 () Bool)

(assert (=> b!1164783 call!57038))

(declare-fun b!1164784 () Bool)

(declare-fun res!772103 () Bool)

(assert (=> b!1164784 (=> (not res!772103) (not e!662403))))

(assert (=> b!1164784 (= res!772103 (and (= (size!36774 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36775 _keys!1208) (size!36774 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!57032 () Bool)

(declare-fun lt!524647 () array!75185)

(assert (=> bm!57032 (= call!57037 (getCurrentListMapNoExtraKeys!4837 lt!524644 lt!524647 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164785 () Bool)

(declare-fun e!662402 () Bool)

(assert (=> b!1164785 (= e!662401 e!662402)))

(declare-fun res!772107 () Bool)

(assert (=> b!1164785 (=> res!772107 e!662402)))

(assert (=> b!1164785 (= res!772107 (not (= from!1455 i!673)))))

(declare-fun lt!524660 () ListLongMap!16661)

(assert (=> b!1164785 (= lt!524660 (getCurrentListMapNoExtraKeys!4837 lt!524644 lt!524647 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1164785 (= lt!524647 (array!75186 (store (arr!36237 _values!996) i!673 (ValueCellFull!13865 lt!524664)) (size!36774 _values!996)))))

(declare-fun dynLambda!2827 (Int (_ BitVec 64)) V!43993)

(assert (=> b!1164785 (= lt!524664 (dynLambda!2827 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1164785 (= lt!524652 (getCurrentListMapNoExtraKeys!4837 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164786 () Bool)

(declare-fun Unit!38380 () Unit!38377)

(assert (=> b!1164786 (= e!662414 Unit!38380)))

(assert (=> b!1164786 (= lt!524656 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116831 () Bool)

(assert (=> b!1164786 (= c!116831 (and (not lt!524656) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524649 () Unit!38377)

(assert (=> b!1164786 (= lt!524649 e!662405)))

(declare-fun lt!524646 () Unit!38377)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!561 (array!75187 array!75185 (_ BitVec 32) (_ BitVec 32) V!43993 V!43993 (_ BitVec 64) (_ BitVec 32) Int) Unit!38377)

(assert (=> b!1164786 (= lt!524646 (lemmaListMapContainsThenArrayContainsFrom!561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116827 () Bool)

(assert (=> b!1164786 (= c!116827 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!772106 () Bool)

(assert (=> b!1164786 (= res!772106 e!662411)))

(declare-fun e!662415 () Bool)

(assert (=> b!1164786 (=> (not res!772106) (not e!662415))))

(assert (=> b!1164786 e!662415))

(declare-fun lt!524648 () Unit!38377)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75187 (_ BitVec 32) (_ BitVec 32)) Unit!38377)

(assert (=> b!1164786 (= lt!524648 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25419 0))(
  ( (Nil!25416) (Cons!25415 (h!26633 (_ BitVec 64)) (t!37022 List!25419)) )
))
(declare-fun arrayNoDuplicates!0 (array!75187 (_ BitVec 32) List!25419) Bool)

(assert (=> b!1164786 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25416)))

(declare-fun lt!524653 () Unit!38377)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75187 (_ BitVec 64) (_ BitVec 32) List!25419) Unit!38377)

(assert (=> b!1164786 (= lt!524653 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25416))))

(assert (=> b!1164786 false))

(declare-fun b!1164787 () Bool)

(declare-fun e!662406 () Bool)

(declare-fun tp_is_empty!29149 () Bool)

(assert (=> b!1164787 (= e!662406 tp_is_empty!29149)))

(declare-fun bm!57033 () Bool)

(assert (=> bm!57033 (= call!57041 (getCurrentListMapNoExtraKeys!4837 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1164788 () Bool)

(declare-fun res!772112 () Bool)

(assert (=> b!1164788 (=> (not res!772112) (not e!662410))))

(assert (=> b!1164788 (= res!772112 (arrayNoDuplicates!0 lt!524644 #b00000000000000000000000000000000 Nil!25416))))

(declare-fun b!1164789 () Bool)

(declare-fun res!772104 () Bool)

(assert (=> b!1164789 (=> (not res!772104) (not e!662403))))

(assert (=> b!1164789 (= res!772104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!772108 () Bool)

(assert (=> start!99250 (=> (not res!772108) (not e!662403))))

(assert (=> start!99250 (= res!772108 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36775 _keys!1208))))))

(assert (=> start!99250 e!662403))

(assert (=> start!99250 tp_is_empty!29149))

(declare-fun array_inv!27790 (array!75187) Bool)

(assert (=> start!99250 (array_inv!27790 _keys!1208)))

(assert (=> start!99250 true))

(assert (=> start!99250 tp!86568))

(declare-fun e!662407 () Bool)

(declare-fun array_inv!27791 (array!75185) Bool)

(assert (=> start!99250 (and (array_inv!27791 _values!996) e!662407)))

(declare-fun b!1164790 () Bool)

(declare-fun res!772114 () Bool)

(assert (=> b!1164790 (=> (not res!772114) (not e!662403))))

(assert (=> b!1164790 (= res!772114 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36775 _keys!1208))))))

(declare-fun b!1164791 () Bool)

(assert (=> b!1164791 (= e!662412 (= lt!524645 (getCurrentListMapNoExtraKeys!4837 lt!524644 lt!524647 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1164792 () Bool)

(declare-fun Unit!38381 () Unit!38377)

(assert (=> b!1164792 (= e!662414 Unit!38381)))

(declare-fun b!1164793 () Bool)

(declare-fun res!772110 () Bool)

(assert (=> b!1164793 (=> (not res!772110) (not e!662403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164793 (= res!772110 (validKeyInArray!0 k0!934))))

(declare-fun b!1164794 () Bool)

(declare-fun res!772102 () Bool)

(assert (=> b!1164794 (=> (not res!772102) (not e!662403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164794 (= res!772102 (validMask!0 mask!1564))))

(declare-fun call!57042 () ListLongMap!16661)

(declare-fun bm!57034 () Bool)

(assert (=> bm!57034 (= call!57042 (+!3761 lt!524654 (ite (or c!116831 c!116828) (tuple2!18685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18685 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1164795 () Bool)

(assert (=> b!1164795 (= e!662411 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1164796 () Bool)

(assert (=> b!1164796 (= e!662409 tp_is_empty!29149)))

(declare-fun mapIsEmpty!45548 () Bool)

(assert (=> mapIsEmpty!45548 mapRes!45548))

(declare-fun b!1164797 () Bool)

(assert (=> b!1164797 call!57038))

(declare-fun lt!524661 () Unit!38377)

(assert (=> b!1164797 (= lt!524661 call!57039)))

(assert (=> b!1164797 (= e!662404 lt!524661)))

(declare-fun b!1164798 () Bool)

(assert (=> b!1164798 (= e!662415 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!57035 () Bool)

(declare-fun call!57035 () Bool)

(assert (=> bm!57035 (= call!57038 call!57035)))

(declare-fun b!1164799 () Bool)

(assert (=> b!1164799 (= e!662408 e!662404)))

(declare-fun c!116830 () Bool)

(assert (=> b!1164799 (= c!116830 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!524656))))

(declare-fun bm!57036 () Bool)

(declare-fun call!57040 () Unit!38377)

(assert (=> bm!57036 (= call!57039 call!57040)))

(declare-fun b!1164800 () Bool)

(assert (=> b!1164800 (= e!662402 e!662413)))

(declare-fun res!772109 () Bool)

(assert (=> b!1164800 (=> res!772109 e!662413)))

(assert (=> b!1164800 (= res!772109 (not (= (select (arr!36238 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1164800 e!662400))

(declare-fun c!116829 () Bool)

(assert (=> b!1164800 (= c!116829 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!524650 () Unit!38377)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!666 (array!75187 array!75185 (_ BitVec 32) (_ BitVec 32) V!43993 V!43993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38377)

(assert (=> b!1164800 (= lt!524650 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!666 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!524657 () ListLongMap!16661)

(declare-fun bm!57037 () Bool)

(declare-fun addStillContains!979 (ListLongMap!16661 (_ BitVec 64) V!43993 (_ BitVec 64)) Unit!38377)

(assert (=> bm!57037 (= call!57040 (addStillContains!979 (ite c!116831 lt!524657 lt!524654) (ite c!116831 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116828 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116831 minValue!944 (ite c!116828 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1164801 () Bool)

(assert (=> b!1164801 (= e!662400 (= call!57037 call!57041))))

(declare-fun b!1164802 () Bool)

(declare-fun res!772116 () Bool)

(assert (=> b!1164802 (=> (not res!772116) (not e!662403))))

(assert (=> b!1164802 (= res!772116 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25416))))

(declare-fun b!1164803 () Bool)

(assert (=> b!1164803 (contains!6862 (+!3761 lt!524657 (tuple2!18685 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!524663 () Unit!38377)

(assert (=> b!1164803 (= lt!524663 call!57040)))

(assert (=> b!1164803 call!57035))

(assert (=> b!1164803 (= lt!524657 call!57042)))

(declare-fun lt!524665 () Unit!38377)

(assert (=> b!1164803 (= lt!524665 (addStillContains!979 lt!524654 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1164803 (= e!662405 lt!524663)))

(declare-fun call!57036 () ListLongMap!16661)

(declare-fun bm!57038 () Bool)

(assert (=> bm!57038 (= call!57035 (contains!6862 (ite c!116831 lt!524657 call!57036) k0!934))))

(declare-fun bm!57039 () Bool)

(assert (=> bm!57039 (= call!57036 call!57042)))

(declare-fun b!1164804 () Bool)

(assert (=> b!1164804 (= e!662407 (and e!662406 mapRes!45548))))

(declare-fun condMapEmpty!45548 () Bool)

(declare-fun mapDefault!45548 () ValueCell!13865)

(assert (=> b!1164804 (= condMapEmpty!45548 (= (arr!36237 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13865)) mapDefault!45548)))))

(assert (= (and start!99250 res!772108) b!1164794))

(assert (= (and b!1164794 res!772102) b!1164784))

(assert (= (and b!1164784 res!772103) b!1164789))

(assert (= (and b!1164789 res!772104) b!1164802))

(assert (= (and b!1164802 res!772116) b!1164790))

(assert (= (and b!1164790 res!772114) b!1164793))

(assert (= (and b!1164793 res!772110) b!1164778))

(assert (= (and b!1164778 res!772111) b!1164782))

(assert (= (and b!1164782 res!772115) b!1164788))

(assert (= (and b!1164788 res!772112) b!1164777))

(assert (= (and b!1164777 (not res!772105)) b!1164785))

(assert (= (and b!1164785 (not res!772107)) b!1164800))

(assert (= (and b!1164800 c!116829) b!1164781))

(assert (= (and b!1164800 (not c!116829)) b!1164801))

(assert (= (or b!1164781 b!1164801) bm!57032))

(assert (= (or b!1164781 b!1164801) bm!57033))

(assert (= (and b!1164800 (not res!772109)) b!1164779))

(assert (= (and b!1164779 c!116832) b!1164786))

(assert (= (and b!1164779 (not c!116832)) b!1164792))

(assert (= (and b!1164786 c!116831) b!1164803))

(assert (= (and b!1164786 (not c!116831)) b!1164775))

(assert (= (and b!1164775 c!116828) b!1164783))

(assert (= (and b!1164775 (not c!116828)) b!1164799))

(assert (= (and b!1164799 c!116830) b!1164797))

(assert (= (and b!1164799 (not c!116830)) b!1164776))

(assert (= (or b!1164783 b!1164797) bm!57036))

(assert (= (or b!1164783 b!1164797) bm!57039))

(assert (= (or b!1164783 b!1164797) bm!57035))

(assert (= (or b!1164803 bm!57035) bm!57038))

(assert (= (or b!1164803 bm!57036) bm!57037))

(assert (= (or b!1164803 bm!57039) bm!57034))

(assert (= (and b!1164786 c!116827) b!1164795))

(assert (= (and b!1164786 (not c!116827)) b!1164780))

(assert (= (and b!1164786 res!772106) b!1164798))

(assert (= (and b!1164779 res!772113) b!1164791))

(assert (= (and b!1164804 condMapEmpty!45548) mapIsEmpty!45548))

(assert (= (and b!1164804 (not condMapEmpty!45548)) mapNonEmpty!45548))

(get-info :version)

(assert (= (and mapNonEmpty!45548 ((_ is ValueCellFull!13865) mapValue!45548)) b!1164796))

(assert (= (and b!1164804 ((_ is ValueCellFull!13865) mapDefault!45548)) b!1164787))

(assert (= start!99250 b!1164804))

(declare-fun b_lambda!19719 () Bool)

(assert (=> (not b_lambda!19719) (not b!1164785)))

(declare-fun t!37020 () Bool)

(declare-fun tb!9423 () Bool)

(assert (=> (and start!99250 (= defaultEntry!1004 defaultEntry!1004) t!37020) tb!9423))

(declare-fun result!19419 () Bool)

(assert (=> tb!9423 (= result!19419 tp_is_empty!29149)))

(assert (=> b!1164785 t!37020))

(declare-fun b_and!40091 () Bool)

(assert (= b_and!40089 (and (=> t!37020 result!19419) b_and!40091)))

(declare-fun m!1073621 () Bool)

(assert (=> b!1164793 m!1073621))

(declare-fun m!1073623 () Bool)

(assert (=> bm!57032 m!1073623))

(declare-fun m!1073625 () Bool)

(assert (=> mapNonEmpty!45548 m!1073625))

(declare-fun m!1073627 () Bool)

(assert (=> bm!57037 m!1073627))

(declare-fun m!1073629 () Bool)

(assert (=> b!1164778 m!1073629))

(assert (=> b!1164791 m!1073623))

(declare-fun m!1073631 () Bool)

(assert (=> bm!57038 m!1073631))

(declare-fun m!1073633 () Bool)

(assert (=> b!1164779 m!1073633))

(declare-fun m!1073635 () Bool)

(assert (=> b!1164779 m!1073635))

(declare-fun m!1073637 () Bool)

(assert (=> b!1164779 m!1073637))

(declare-fun m!1073639 () Bool)

(assert (=> b!1164779 m!1073639))

(declare-fun m!1073641 () Bool)

(assert (=> b!1164779 m!1073641))

(declare-fun m!1073643 () Bool)

(assert (=> b!1164779 m!1073643))

(declare-fun m!1073645 () Bool)

(assert (=> b!1164779 m!1073645))

(assert (=> b!1164779 m!1073639))

(assert (=> b!1164779 m!1073645))

(assert (=> b!1164779 m!1073639))

(declare-fun m!1073647 () Bool)

(assert (=> b!1164779 m!1073647))

(assert (=> b!1164779 m!1073635))

(declare-fun m!1073649 () Bool)

(assert (=> b!1164779 m!1073649))

(declare-fun m!1073651 () Bool)

(assert (=> start!99250 m!1073651))

(declare-fun m!1073653 () Bool)

(assert (=> start!99250 m!1073653))

(declare-fun m!1073655 () Bool)

(assert (=> b!1164788 m!1073655))

(declare-fun m!1073657 () Bool)

(assert (=> b!1164785 m!1073657))

(declare-fun m!1073659 () Bool)

(assert (=> b!1164785 m!1073659))

(declare-fun m!1073661 () Bool)

(assert (=> b!1164785 m!1073661))

(declare-fun m!1073663 () Bool)

(assert (=> b!1164785 m!1073663))

(assert (=> b!1164800 m!1073639))

(declare-fun m!1073665 () Bool)

(assert (=> b!1164800 m!1073665))

(declare-fun m!1073667 () Bool)

(assert (=> b!1164798 m!1073667))

(declare-fun m!1073669 () Bool)

(assert (=> b!1164786 m!1073669))

(declare-fun m!1073671 () Bool)

(assert (=> b!1164786 m!1073671))

(declare-fun m!1073673 () Bool)

(assert (=> b!1164786 m!1073673))

(declare-fun m!1073675 () Bool)

(assert (=> b!1164786 m!1073675))

(declare-fun m!1073677 () Bool)

(assert (=> b!1164782 m!1073677))

(declare-fun m!1073679 () Bool)

(assert (=> b!1164782 m!1073679))

(declare-fun m!1073681 () Bool)

(assert (=> b!1164781 m!1073681))

(declare-fun m!1073683 () Bool)

(assert (=> bm!57034 m!1073683))

(assert (=> b!1164795 m!1073667))

(declare-fun m!1073685 () Bool)

(assert (=> b!1164789 m!1073685))

(declare-fun m!1073687 () Bool)

(assert (=> b!1164802 m!1073687))

(declare-fun m!1073689 () Bool)

(assert (=> b!1164803 m!1073689))

(assert (=> b!1164803 m!1073689))

(declare-fun m!1073691 () Bool)

(assert (=> b!1164803 m!1073691))

(declare-fun m!1073693 () Bool)

(assert (=> b!1164803 m!1073693))

(declare-fun m!1073695 () Bool)

(assert (=> b!1164777 m!1073695))

(declare-fun m!1073697 () Bool)

(assert (=> b!1164777 m!1073697))

(declare-fun m!1073699 () Bool)

(assert (=> b!1164794 m!1073699))

(assert (=> bm!57033 m!1073633))

(check-sat (not bm!57033) (not b_next!24619) (not b!1164777) (not b!1164781) (not b!1164782) (not b!1164802) (not bm!57034) (not b!1164794) tp_is_empty!29149 (not b!1164788) (not bm!57032) (not b!1164791) (not b!1164786) (not b!1164800) (not bm!57037) (not b!1164795) (not start!99250) (not b!1164793) b_and!40091 (not mapNonEmpty!45548) (not bm!57038) (not b_lambda!19719) (not b!1164779) (not b!1164798) (not b!1164785) (not b!1164803) (not b!1164789))
(check-sat b_and!40091 (not b_next!24619))
