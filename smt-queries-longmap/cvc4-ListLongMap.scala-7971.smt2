; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98670 () Bool)

(assert start!98670)

(declare-fun b_free!24275 () Bool)

(declare-fun b_next!24275 () Bool)

(assert (=> start!98670 (= b_free!24275 (not b_next!24275))))

(declare-fun tp!85535 () Bool)

(declare-fun b_and!39399 () Bool)

(assert (=> start!98670 (= tp!85535 b_and!39399)))

(declare-fun mapNonEmpty!45032 () Bool)

(declare-fun mapRes!45032 () Bool)

(declare-fun tp!85536 () Bool)

(declare-fun e!652800 () Bool)

(assert (=> mapNonEmpty!45032 (= mapRes!45032 (and tp!85536 e!652800))))

(declare-datatypes ((V!43533 0))(
  ( (V!43534 (val!14459 Int)) )
))
(declare-datatypes ((ValueCell!13693 0))(
  ( (ValueCellFull!13693 (v!17096 V!43533)) (EmptyCell!13693) )
))
(declare-fun mapRest!45032 () (Array (_ BitVec 32) ValueCell!13693))

(declare-fun mapKey!45032 () (_ BitVec 32))

(declare-fun mapValue!45032 () ValueCell!13693)

(declare-datatypes ((array!74457 0))(
  ( (array!74458 (arr!35879 (Array (_ BitVec 32) ValueCell!13693)) (size!36415 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74457)

(assert (=> mapNonEmpty!45032 (= (arr!35879 _values!996) (store mapRest!45032 mapKey!45032 mapValue!45032))))

(declare-fun mapIsEmpty!45032 () Bool)

(assert (=> mapIsEmpty!45032 mapRes!45032))

(declare-fun b!1147662 () Bool)

(declare-fun tp_is_empty!28805 () Bool)

(assert (=> b!1147662 (= e!652800 tp_is_empty!28805)))

(declare-fun b!1147663 () Bool)

(declare-fun e!652798 () Bool)

(declare-fun e!652809 () Bool)

(assert (=> b!1147663 (= e!652798 e!652809)))

(declare-fun res!763854 () Bool)

(assert (=> b!1147663 (=> res!763854 e!652809)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147663 (= res!763854 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43533)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18330 0))(
  ( (tuple2!18331 (_1!9176 (_ BitVec 64)) (_2!9176 V!43533)) )
))
(declare-datatypes ((List!25081 0))(
  ( (Nil!25078) (Cons!25077 (h!26286 tuple2!18330) (t!36348 List!25081)) )
))
(declare-datatypes ((ListLongMap!16299 0))(
  ( (ListLongMap!16300 (toList!8165 List!25081)) )
))
(declare-fun lt!512868 () ListLongMap!16299)

(declare-datatypes ((array!74459 0))(
  ( (array!74460 (arr!35880 (Array (_ BitVec 32) (_ BitVec 64))) (size!36416 (_ BitVec 32))) )
))
(declare-fun lt!512861 () array!74459)

(declare-fun minValue!944 () V!43533)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!512870 () array!74457)

(declare-fun getCurrentListMapNoExtraKeys!4639 (array!74459 array!74457 (_ BitVec 32) (_ BitVec 32) V!43533 V!43533 (_ BitVec 32) Int) ListLongMap!16299)

(assert (=> b!1147663 (= lt!512868 (getCurrentListMapNoExtraKeys!4639 lt!512861 lt!512870 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!512862 () V!43533)

(assert (=> b!1147663 (= lt!512870 (array!74458 (store (arr!35879 _values!996) i!673 (ValueCellFull!13693 lt!512862)) (size!36415 _values!996)))))

(declare-fun dynLambda!2669 (Int (_ BitVec 64)) V!43533)

(assert (=> b!1147663 (= lt!512862 (dynLambda!2669 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74459)

(declare-fun lt!512855 () ListLongMap!16299)

(assert (=> b!1147663 (= lt!512855 (getCurrentListMapNoExtraKeys!4639 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52839 () Bool)

(declare-fun call!52845 () ListLongMap!16299)

(assert (=> bm!52839 (= call!52845 (getCurrentListMapNoExtraKeys!4639 lt!512861 lt!512870 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147664 () Bool)

(declare-datatypes ((Unit!37701 0))(
  ( (Unit!37702) )
))
(declare-fun e!652808 () Unit!37701)

(declare-fun Unit!37703 () Unit!37701)

(assert (=> b!1147664 (= e!652808 Unit!37703)))

(declare-fun b!1147665 () Bool)

(declare-fun e!652812 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!512857 () ListLongMap!16299)

(declare-fun -!1301 (ListLongMap!16299 (_ BitVec 64)) ListLongMap!16299)

(assert (=> b!1147665 (= e!652812 (= (-!1301 lt!512855 k!934) lt!512857))))

(declare-fun b!1147667 () Bool)

(declare-fun e!652810 () Bool)

(assert (=> b!1147667 (= e!652809 e!652810)))

(declare-fun res!763855 () Bool)

(assert (=> b!1147667 (=> res!763855 e!652810)))

(assert (=> b!1147667 (= res!763855 (not (= (select (arr!35880 _keys!1208) from!1455) k!934)))))

(declare-fun e!652806 () Bool)

(assert (=> b!1147667 e!652806))

(declare-fun c!113335 () Bool)

(assert (=> b!1147667 (= c!113335 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512874 () Unit!37701)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!538 (array!74459 array!74457 (_ BitVec 32) (_ BitVec 32) V!43533 V!43533 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37701)

(assert (=> b!1147667 (= lt!512874 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147668 () Bool)

(declare-fun res!763862 () Bool)

(declare-fun e!652807 () Bool)

(assert (=> b!1147668 (=> (not res!763862) (not e!652807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147668 (= res!763862 (validKeyInArray!0 k!934))))

(declare-fun b!1147669 () Bool)

(declare-fun call!52849 () Bool)

(assert (=> b!1147669 call!52849))

(declare-fun lt!512873 () Unit!37701)

(declare-fun call!52842 () Unit!37701)

(assert (=> b!1147669 (= lt!512873 call!52842)))

(assert (=> b!1147669 (= e!652808 lt!512873)))

(declare-fun bm!52840 () Bool)

(declare-fun call!52843 () ListLongMap!16299)

(declare-fun call!52844 () ListLongMap!16299)

(assert (=> bm!52840 (= call!52843 call!52844)))

(declare-fun b!1147670 () Bool)

(declare-fun e!652802 () Bool)

(declare-fun arrayContainsKey!0 (array!74459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147670 (= e!652802 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147671 () Bool)

(declare-fun res!763860 () Bool)

(assert (=> b!1147671 (=> (not res!763860) (not e!652807))))

(assert (=> b!1147671 (= res!763860 (and (= (size!36415 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36416 _keys!1208) (size!36415 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147672 () Bool)

(declare-fun e!652803 () Unit!37701)

(assert (=> b!1147672 (= e!652803 e!652808)))

(declare-fun c!113338 () Bool)

(declare-fun lt!512869 () Bool)

(assert (=> b!1147672 (= c!113338 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512869))))

(declare-fun b!1147673 () Bool)

(declare-fun res!763863 () Bool)

(assert (=> b!1147673 (=> (not res!763863) (not e!652807))))

(assert (=> b!1147673 (= res!763863 (= (select (arr!35880 _keys!1208) i!673) k!934))))

(declare-fun b!1147674 () Bool)

(declare-fun e!652805 () Unit!37701)

(declare-fun Unit!37704 () Unit!37701)

(assert (=> b!1147674 (= e!652805 Unit!37704)))

(assert (=> b!1147674 (= lt!512869 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113336 () Bool)

(assert (=> b!1147674 (= c!113336 (and (not lt!512869) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512860 () Unit!37701)

(declare-fun e!652796 () Unit!37701)

(assert (=> b!1147674 (= lt!512860 e!652796)))

(declare-fun lt!512854 () Unit!37701)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!433 (array!74459 array!74457 (_ BitVec 32) (_ BitVec 32) V!43533 V!43533 (_ BitVec 64) (_ BitVec 32) Int) Unit!37701)

(assert (=> b!1147674 (= lt!512854 (lemmaListMapContainsThenArrayContainsFrom!433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113337 () Bool)

(assert (=> b!1147674 (= c!113337 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763861 () Bool)

(declare-fun e!652811 () Bool)

(assert (=> b!1147674 (= res!763861 e!652811)))

(assert (=> b!1147674 (=> (not res!763861) (not e!652802))))

(assert (=> b!1147674 e!652802))

(declare-fun lt!512871 () Unit!37701)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74459 (_ BitVec 32) (_ BitVec 32)) Unit!37701)

(assert (=> b!1147674 (= lt!512871 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25082 0))(
  ( (Nil!25079) (Cons!25078 (h!26287 (_ BitVec 64)) (t!36349 List!25082)) )
))
(declare-fun arrayNoDuplicates!0 (array!74459 (_ BitVec 32) List!25082) Bool)

(assert (=> b!1147674 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25079)))

(declare-fun lt!512866 () Unit!37701)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74459 (_ BitVec 64) (_ BitVec 32) List!25082) Unit!37701)

(assert (=> b!1147674 (= lt!512866 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25079))))

(assert (=> b!1147674 false))

(declare-fun b!1147675 () Bool)

(declare-fun e!652804 () Bool)

(assert (=> b!1147675 (= e!652804 tp_is_empty!28805)))

(declare-fun b!1147676 () Bool)

(declare-fun e!652799 () Bool)

(assert (=> b!1147676 (= e!652807 e!652799)))

(declare-fun res!763859 () Bool)

(assert (=> b!1147676 (=> (not res!763859) (not e!652799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74459 (_ BitVec 32)) Bool)

(assert (=> b!1147676 (= res!763859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512861 mask!1564))))

(assert (=> b!1147676 (= lt!512861 (array!74460 (store (arr!35880 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36416 _keys!1208)))))

(declare-fun bm!52841 () Bool)

(declare-fun lt!512872 () ListLongMap!16299)

(declare-fun c!113334 () Bool)

(declare-fun +!3588 (ListLongMap!16299 tuple2!18330) ListLongMap!16299)

(assert (=> bm!52841 (= call!52844 (+!3588 (ite c!113336 lt!512872 lt!512857) (ite c!113336 (tuple2!18331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113334 (tuple2!18331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1147677 () Bool)

(assert (=> b!1147677 (= e!652811 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!52848 () ListLongMap!16299)

(declare-fun b!1147678 () Bool)

(assert (=> b!1147678 (= e!652806 (= call!52845 (-!1301 call!52848 k!934)))))

(declare-fun b!1147679 () Bool)

(declare-fun contains!6688 (ListLongMap!16299 (_ BitVec 64)) Bool)

(assert (=> b!1147679 (contains!6688 call!52844 k!934)))

(declare-fun lt!512864 () Unit!37701)

(declare-fun call!52846 () Unit!37701)

(assert (=> b!1147679 (= lt!512864 call!52846)))

(declare-fun call!52847 () Bool)

(assert (=> b!1147679 call!52847))

(assert (=> b!1147679 (= lt!512872 (+!3588 lt!512857 (tuple2!18331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512863 () Unit!37701)

(declare-fun addStillContains!839 (ListLongMap!16299 (_ BitVec 64) V!43533 (_ BitVec 64)) Unit!37701)

(assert (=> b!1147679 (= lt!512863 (addStillContains!839 lt!512857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1147679 (= e!652796 lt!512864)))

(declare-fun bm!52842 () Bool)

(assert (=> bm!52842 (= call!52846 (addStillContains!839 (ite c!113336 lt!512872 lt!512857) (ite c!113336 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113334 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113336 minValue!944 (ite c!113334 zeroValue!944 minValue!944)) k!934))))

(declare-fun bm!52843 () Bool)

(assert (=> bm!52843 (= call!52848 (getCurrentListMapNoExtraKeys!4639 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147680 () Bool)

(declare-fun lt!512858 () Unit!37701)

(assert (=> b!1147680 (= e!652803 lt!512858)))

(assert (=> b!1147680 (= lt!512858 call!52842)))

(assert (=> b!1147680 call!52849))

(declare-fun b!1147681 () Bool)

(assert (=> b!1147681 (= c!113334 (and (not lt!512869) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147681 (= e!652796 e!652803)))

(declare-fun b!1147682 () Bool)

(declare-fun res!763868 () Bool)

(assert (=> b!1147682 (=> (not res!763868) (not e!652807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147682 (= res!763868 (validMask!0 mask!1564))))

(declare-fun b!1147683 () Bool)

(declare-fun res!763857 () Bool)

(assert (=> b!1147683 (=> (not res!763857) (not e!652799))))

(assert (=> b!1147683 (= res!763857 (arrayNoDuplicates!0 lt!512861 #b00000000000000000000000000000000 Nil!25079))))

(declare-fun b!1147684 () Bool)

(declare-fun res!763867 () Bool)

(assert (=> b!1147684 (=> (not res!763867) (not e!652807))))

(assert (=> b!1147684 (= res!763867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1147685 () Bool)

(declare-fun e!652797 () Bool)

(assert (=> b!1147685 (= e!652797 (and e!652804 mapRes!45032))))

(declare-fun condMapEmpty!45032 () Bool)

(declare-fun mapDefault!45032 () ValueCell!13693)

