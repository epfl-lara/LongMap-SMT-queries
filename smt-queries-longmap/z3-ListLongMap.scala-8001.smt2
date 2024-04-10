; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98848 () Bool)

(assert start!98848)

(declare-fun b_free!24453 () Bool)

(declare-fun b_next!24453 () Bool)

(assert (=> start!98848 (= b_free!24453 (not b_next!24453))))

(declare-fun tp!86069 () Bool)

(declare-fun b_and!39755 () Bool)

(assert (=> start!98848 (= tp!86069 b_and!39755)))

(declare-fun b!1155850 () Bool)

(declare-fun res!767870 () Bool)

(declare-fun e!657336 () Bool)

(assert (=> b!1155850 (=> (not res!767870) (not e!657336))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155850 (= res!767870 (validMask!0 mask!1564))))

(declare-fun b!1155851 () Bool)

(declare-fun e!657349 () Bool)

(declare-fun e!657348 () Bool)

(declare-fun mapRes!45299 () Bool)

(assert (=> b!1155851 (= e!657349 (and e!657348 mapRes!45299))))

(declare-fun condMapEmpty!45299 () Bool)

(declare-datatypes ((V!43771 0))(
  ( (V!43772 (val!14548 Int)) )
))
(declare-datatypes ((ValueCell!13782 0))(
  ( (ValueCellFull!13782 (v!17185 V!43771)) (EmptyCell!13782) )
))
(declare-datatypes ((array!74813 0))(
  ( (array!74814 (arr!36057 (Array (_ BitVec 32) ValueCell!13782)) (size!36593 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74813)

(declare-fun mapDefault!45299 () ValueCell!13782)

(assert (=> b!1155851 (= condMapEmpty!45299 (= (arr!36057 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13782)) mapDefault!45299)))))

(declare-datatypes ((array!74815 0))(
  ( (array!74816 (arr!36058 (Array (_ BitVec 32) (_ BitVec 64))) (size!36594 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74815)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1155852 () Bool)

(declare-fun e!657339 () Bool)

(declare-fun arrayContainsKey!0 (array!74815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155852 (= e!657339 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun zeroValue!944 () V!43771)

(declare-datatypes ((tuple2!18504 0))(
  ( (tuple2!18505 (_1!9263 (_ BitVec 64)) (_2!9263 V!43771)) )
))
(declare-datatypes ((List!25247 0))(
  ( (Nil!25244) (Cons!25243 (h!26452 tuple2!18504) (t!36692 List!25247)) )
))
(declare-datatypes ((ListLongMap!16473 0))(
  ( (ListLongMap!16474 (toList!8252 List!25247)) )
))
(declare-fun lt!518699 () ListLongMap!16473)

(declare-fun c!114939 () Bool)

(declare-fun c!114938 () Bool)

(declare-fun bm!54975 () Bool)

(declare-fun lt!518688 () ListLongMap!16473)

(declare-fun minValue!944 () V!43771)

(declare-fun call!54984 () ListLongMap!16473)

(declare-fun +!3665 (ListLongMap!16473 tuple2!18504) ListLongMap!16473)

(assert (=> bm!54975 (= call!54984 (+!3665 (ite c!114939 lt!518688 lt!518699) (ite c!114939 (tuple2!18505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114938 (tuple2!18505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1155853 () Bool)

(declare-fun e!657340 () Bool)

(declare-fun e!657341 () Bool)

(assert (=> b!1155853 (= e!657340 (not e!657341))))

(declare-fun res!767865 () Bool)

(assert (=> b!1155853 (=> res!767865 e!657341)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155853 (= res!767865 (bvsgt from!1455 i!673))))

(assert (=> b!1155853 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38067 0))(
  ( (Unit!38068) )
))
(declare-fun lt!518697 () Unit!38067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74815 (_ BitVec 64) (_ BitVec 32)) Unit!38067)

(assert (=> b!1155853 (= lt!518697 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1155854 () Bool)

(declare-fun e!657337 () Unit!38067)

(declare-fun e!657350 () Unit!38067)

(assert (=> b!1155854 (= e!657337 e!657350)))

(declare-fun c!114940 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!518687 () Bool)

(assert (=> b!1155854 (= c!114940 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518687))))

(declare-fun call!54978 () ListLongMap!16473)

(declare-fun bm!54976 () Bool)

(declare-fun call!54983 () Bool)

(declare-fun contains!6764 (ListLongMap!16473 (_ BitVec 64)) Bool)

(assert (=> bm!54976 (= call!54983 (contains!6764 (ite c!114939 lt!518688 call!54978) k0!934))))

(declare-fun b!1155855 () Bool)

(declare-fun e!657345 () Bool)

(assert (=> b!1155855 (= e!657341 e!657345)))

(declare-fun res!767872 () Bool)

(assert (=> b!1155855 (=> res!767872 e!657345)))

(assert (=> b!1155855 (= res!767872 (not (= from!1455 i!673)))))

(declare-fun lt!518691 () array!74815)

(declare-fun lt!518683 () ListLongMap!16473)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518682 () array!74813)

(declare-fun getCurrentListMapNoExtraKeys!4721 (array!74815 array!74813 (_ BitVec 32) (_ BitVec 32) V!43771 V!43771 (_ BitVec 32) Int) ListLongMap!16473)

(assert (=> b!1155855 (= lt!518683 (getCurrentListMapNoExtraKeys!4721 lt!518691 lt!518682 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518690 () V!43771)

(assert (=> b!1155855 (= lt!518682 (array!74814 (store (arr!36057 _values!996) i!673 (ValueCellFull!13782 lt!518690)) (size!36593 _values!996)))))

(declare-fun dynLambda!2729 (Int (_ BitVec 64)) V!43771)

(assert (=> b!1155855 (= lt!518690 (dynLambda!2729 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518685 () ListLongMap!16473)

(assert (=> b!1155855 (= lt!518685 (getCurrentListMapNoExtraKeys!4721 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155856 () Bool)

(assert (=> b!1155856 (= e!657336 e!657340)))

(declare-fun res!767871 () Bool)

(assert (=> b!1155856 (=> (not res!767871) (not e!657340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74815 (_ BitVec 32)) Bool)

(assert (=> b!1155856 (= res!767871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518691 mask!1564))))

(assert (=> b!1155856 (= lt!518691 (array!74816 (store (arr!36058 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36594 _keys!1208)))))

(declare-fun bm!54977 () Bool)

(declare-fun call!54982 () Unit!38067)

(declare-fun call!54981 () Unit!38067)

(assert (=> bm!54977 (= call!54982 call!54981)))

(declare-fun b!1155857 () Bool)

(declare-fun call!54980 () Bool)

(assert (=> b!1155857 call!54980))

(declare-fun lt!518694 () Unit!38067)

(assert (=> b!1155857 (= lt!518694 call!54982)))

(assert (=> b!1155857 (= e!657350 lt!518694)))

(declare-fun b!1155858 () Bool)

(declare-fun e!657347 () Bool)

(assert (=> b!1155858 (= e!657345 e!657347)))

(declare-fun res!767861 () Bool)

(assert (=> b!1155858 (=> res!767861 e!657347)))

(assert (=> b!1155858 (= res!767861 (not (= (select (arr!36058 _keys!1208) from!1455) k0!934)))))

(declare-fun e!657343 () Bool)

(assert (=> b!1155858 e!657343))

(declare-fun c!114937 () Bool)

(assert (=> b!1155858 (= c!114937 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518696 () Unit!38067)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!602 (array!74815 array!74813 (_ BitVec 32) (_ BitVec 32) V!43771 V!43771 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38067)

(assert (=> b!1155858 (= lt!518696 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!602 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155859 () Bool)

(declare-fun res!767873 () Bool)

(assert (=> b!1155859 (=> (not res!767873) (not e!657336))))

(assert (=> b!1155859 (= res!767873 (and (= (size!36593 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36594 _keys!1208) (size!36593 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!54978 () Bool)

(declare-fun call!54985 () ListLongMap!16473)

(assert (=> bm!54978 (= call!54985 (getCurrentListMapNoExtraKeys!4721 lt!518691 lt!518682 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155860 () Bool)

(declare-fun e!657338 () Bool)

(declare-fun tp_is_empty!28983 () Bool)

(assert (=> b!1155860 (= e!657338 tp_is_empty!28983)))

(declare-fun b!1155861 () Bool)

(declare-fun res!767864 () Bool)

(assert (=> b!1155861 (=> (not res!767864) (not e!657336))))

(assert (=> b!1155861 (= res!767864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!657335 () Bool)

(declare-fun b!1155862 () Bool)

(assert (=> b!1155862 (= e!657335 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518687) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155863 () Bool)

(declare-fun res!767869 () Bool)

(assert (=> b!1155863 (=> (not res!767869) (not e!657336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155863 (= res!767869 (validKeyInArray!0 k0!934))))

(declare-fun b!1155864 () Bool)

(declare-fun res!767868 () Bool)

(assert (=> b!1155864 (=> (not res!767868) (not e!657336))))

(assert (=> b!1155864 (= res!767868 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36594 _keys!1208))))))

(declare-fun bm!54979 () Bool)

(assert (=> bm!54979 (= call!54980 call!54983)))

(declare-fun b!1155865 () Bool)

(declare-fun res!767867 () Bool)

(assert (=> b!1155865 (=> (not res!767867) (not e!657336))))

(declare-datatypes ((List!25248 0))(
  ( (Nil!25245) (Cons!25244 (h!26453 (_ BitVec 64)) (t!36693 List!25248)) )
))
(declare-fun arrayNoDuplicates!0 (array!74815 (_ BitVec 32) List!25248) Bool)

(assert (=> b!1155865 (= res!767867 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25245))))

(declare-fun b!1155866 () Bool)

(declare-fun e!657351 () Unit!38067)

(declare-fun Unit!38069 () Unit!38067)

(assert (=> b!1155866 (= e!657351 Unit!38069)))

(declare-fun b!1155867 () Bool)

(declare-fun call!54979 () ListLongMap!16473)

(assert (=> b!1155867 (= e!657343 (= call!54985 call!54979))))

(declare-fun b!1155868 () Bool)

(assert (=> b!1155868 (= e!657335 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155869 () Bool)

(assert (=> b!1155869 (= e!657347 true)))

(declare-fun e!657344 () Bool)

(assert (=> b!1155869 e!657344))

(declare-fun res!767862 () Bool)

(assert (=> b!1155869 (=> (not res!767862) (not e!657344))))

(declare-fun lt!518702 () ListLongMap!16473)

(assert (=> b!1155869 (= res!767862 (= lt!518702 lt!518699))))

(declare-fun -!1370 (ListLongMap!16473 (_ BitVec 64)) ListLongMap!16473)

(assert (=> b!1155869 (= lt!518702 (-!1370 lt!518685 k0!934))))

(declare-fun lt!518692 () V!43771)

(assert (=> b!1155869 (= (-!1370 (+!3665 lt!518699 (tuple2!18505 (select (arr!36058 _keys!1208) from!1455) lt!518692)) (select (arr!36058 _keys!1208) from!1455)) lt!518699)))

(declare-fun lt!518686 () Unit!38067)

(declare-fun addThenRemoveForNewKeyIsSame!209 (ListLongMap!16473 (_ BitVec 64) V!43771) Unit!38067)

(assert (=> b!1155869 (= lt!518686 (addThenRemoveForNewKeyIsSame!209 lt!518699 (select (arr!36058 _keys!1208) from!1455) lt!518692))))

(declare-fun get!18373 (ValueCell!13782 V!43771) V!43771)

(assert (=> b!1155869 (= lt!518692 (get!18373 (select (arr!36057 _values!996) from!1455) lt!518690))))

(declare-fun lt!518689 () Unit!38067)

(assert (=> b!1155869 (= lt!518689 e!657351)))

(declare-fun c!114935 () Bool)

(assert (=> b!1155869 (= c!114935 (contains!6764 lt!518699 k0!934))))

(assert (=> b!1155869 (= lt!518699 (getCurrentListMapNoExtraKeys!4721 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45299 () Bool)

(assert (=> mapIsEmpty!45299 mapRes!45299))

(declare-fun bm!54980 () Bool)

(assert (=> bm!54980 (= call!54979 (getCurrentListMapNoExtraKeys!4721 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155870 () Bool)

(assert (=> b!1155870 (= e!657344 (= lt!518702 (getCurrentListMapNoExtraKeys!4721 lt!518691 lt!518682 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!54981 () Bool)

(assert (=> bm!54981 (= call!54978 call!54984)))

(declare-fun b!1155871 () Bool)

(declare-fun Unit!38070 () Unit!38067)

(assert (=> b!1155871 (= e!657350 Unit!38070)))

(declare-fun b!1155872 () Bool)

(assert (=> b!1155872 (contains!6764 call!54984 k0!934)))

(declare-fun lt!518684 () Unit!38067)

(assert (=> b!1155872 (= lt!518684 call!54981)))

(assert (=> b!1155872 call!54983))

(assert (=> b!1155872 (= lt!518688 (+!3665 lt!518699 (tuple2!18505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518695 () Unit!38067)

(declare-fun addStillContains!908 (ListLongMap!16473 (_ BitVec 64) V!43771 (_ BitVec 64)) Unit!38067)

(assert (=> b!1155872 (= lt!518695 (addStillContains!908 lt!518699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!657342 () Unit!38067)

(assert (=> b!1155872 (= e!657342 lt!518684)))

(declare-fun bm!54982 () Bool)

(assert (=> bm!54982 (= call!54981 (addStillContains!908 (ite c!114939 lt!518688 lt!518699) (ite c!114939 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114938 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114939 minValue!944 (ite c!114938 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1155873 () Bool)

(assert (=> b!1155873 (= e!657348 tp_is_empty!28983)))

(declare-fun b!1155874 () Bool)

(declare-fun res!767866 () Bool)

(assert (=> b!1155874 (=> (not res!767866) (not e!657336))))

(assert (=> b!1155874 (= res!767866 (= (select (arr!36058 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45299 () Bool)

(declare-fun tp!86070 () Bool)

(assert (=> mapNonEmpty!45299 (= mapRes!45299 (and tp!86070 e!657338))))

(declare-fun mapValue!45299 () ValueCell!13782)

(declare-fun mapKey!45299 () (_ BitVec 32))

(declare-fun mapRest!45299 () (Array (_ BitVec 32) ValueCell!13782))

(assert (=> mapNonEmpty!45299 (= (arr!36057 _values!996) (store mapRest!45299 mapKey!45299 mapValue!45299))))

(declare-fun b!1155875 () Bool)

(declare-fun lt!518700 () Unit!38067)

(assert (=> b!1155875 (= e!657337 lt!518700)))

(assert (=> b!1155875 (= lt!518700 call!54982)))

(assert (=> b!1155875 call!54980))

(declare-fun b!1155876 () Bool)

(assert (=> b!1155876 (= e!657343 (= call!54985 (-!1370 call!54979 k0!934)))))

(declare-fun res!767860 () Bool)

(assert (=> start!98848 (=> (not res!767860) (not e!657336))))

(assert (=> start!98848 (= res!767860 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36594 _keys!1208))))))

(assert (=> start!98848 e!657336))

(assert (=> start!98848 tp_is_empty!28983))

(declare-fun array_inv!27596 (array!74815) Bool)

(assert (=> start!98848 (array_inv!27596 _keys!1208)))

(assert (=> start!98848 true))

(assert (=> start!98848 tp!86069))

(declare-fun array_inv!27597 (array!74813) Bool)

(assert (=> start!98848 (and (array_inv!27597 _values!996) e!657349)))

(declare-fun b!1155877 () Bool)

(declare-fun res!767859 () Bool)

(assert (=> b!1155877 (=> (not res!767859) (not e!657340))))

(assert (=> b!1155877 (= res!767859 (arrayNoDuplicates!0 lt!518691 #b00000000000000000000000000000000 Nil!25245))))

(declare-fun b!1155878 () Bool)

(declare-fun Unit!38071 () Unit!38067)

(assert (=> b!1155878 (= e!657351 Unit!38071)))

(assert (=> b!1155878 (= lt!518687 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155878 (= c!114939 (and (not lt!518687) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518701 () Unit!38067)

(assert (=> b!1155878 (= lt!518701 e!657342)))

(declare-fun lt!518693 () Unit!38067)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!497 (array!74815 array!74813 (_ BitVec 32) (_ BitVec 32) V!43771 V!43771 (_ BitVec 64) (_ BitVec 32) Int) Unit!38067)

(assert (=> b!1155878 (= lt!518693 (lemmaListMapContainsThenArrayContainsFrom!497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114936 () Bool)

(assert (=> b!1155878 (= c!114936 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767863 () Bool)

(assert (=> b!1155878 (= res!767863 e!657335)))

(assert (=> b!1155878 (=> (not res!767863) (not e!657339))))

(assert (=> b!1155878 e!657339))

(declare-fun lt!518698 () Unit!38067)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74815 (_ BitVec 32) (_ BitVec 32)) Unit!38067)

(assert (=> b!1155878 (= lt!518698 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155878 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25245)))

(declare-fun lt!518703 () Unit!38067)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74815 (_ BitVec 64) (_ BitVec 32) List!25248) Unit!38067)

(assert (=> b!1155878 (= lt!518703 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25245))))

(assert (=> b!1155878 false))

(declare-fun b!1155879 () Bool)

(assert (=> b!1155879 (= c!114938 (and (not lt!518687) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1155879 (= e!657342 e!657337)))

(assert (= (and start!98848 res!767860) b!1155850))

(assert (= (and b!1155850 res!767870) b!1155859))

(assert (= (and b!1155859 res!767873) b!1155861))

(assert (= (and b!1155861 res!767864) b!1155865))

(assert (= (and b!1155865 res!767867) b!1155864))

(assert (= (and b!1155864 res!767868) b!1155863))

(assert (= (and b!1155863 res!767869) b!1155874))

(assert (= (and b!1155874 res!767866) b!1155856))

(assert (= (and b!1155856 res!767871) b!1155877))

(assert (= (and b!1155877 res!767859) b!1155853))

(assert (= (and b!1155853 (not res!767865)) b!1155855))

(assert (= (and b!1155855 (not res!767872)) b!1155858))

(assert (= (and b!1155858 c!114937) b!1155876))

(assert (= (and b!1155858 (not c!114937)) b!1155867))

(assert (= (or b!1155876 b!1155867) bm!54978))

(assert (= (or b!1155876 b!1155867) bm!54980))

(assert (= (and b!1155858 (not res!767861)) b!1155869))

(assert (= (and b!1155869 c!114935) b!1155878))

(assert (= (and b!1155869 (not c!114935)) b!1155866))

(assert (= (and b!1155878 c!114939) b!1155872))

(assert (= (and b!1155878 (not c!114939)) b!1155879))

(assert (= (and b!1155879 c!114938) b!1155875))

(assert (= (and b!1155879 (not c!114938)) b!1155854))

(assert (= (and b!1155854 c!114940) b!1155857))

(assert (= (and b!1155854 (not c!114940)) b!1155871))

(assert (= (or b!1155875 b!1155857) bm!54977))

(assert (= (or b!1155875 b!1155857) bm!54981))

(assert (= (or b!1155875 b!1155857) bm!54979))

(assert (= (or b!1155872 bm!54979) bm!54976))

(assert (= (or b!1155872 bm!54977) bm!54982))

(assert (= (or b!1155872 bm!54981) bm!54975))

(assert (= (and b!1155878 c!114936) b!1155868))

(assert (= (and b!1155878 (not c!114936)) b!1155862))

(assert (= (and b!1155878 res!767863) b!1155852))

(assert (= (and b!1155869 res!767862) b!1155870))

(assert (= (and b!1155851 condMapEmpty!45299) mapIsEmpty!45299))

(assert (= (and b!1155851 (not condMapEmpty!45299)) mapNonEmpty!45299))

(get-info :version)

(assert (= (and mapNonEmpty!45299 ((_ is ValueCellFull!13782) mapValue!45299)) b!1155860))

(assert (= (and b!1155851 ((_ is ValueCellFull!13782) mapDefault!45299)) b!1155873))

(assert (= start!98848 b!1155851))

(declare-fun b_lambda!19559 () Bool)

(assert (=> (not b_lambda!19559) (not b!1155855)))

(declare-fun t!36691 () Bool)

(declare-fun tb!9265 () Bool)

(assert (=> (and start!98848 (= defaultEntry!1004 defaultEntry!1004) t!36691) tb!9265))

(declare-fun result!19095 () Bool)

(assert (=> tb!9265 (= result!19095 tp_is_empty!28983)))

(assert (=> b!1155855 t!36691))

(declare-fun b_and!39757 () Bool)

(assert (= b_and!39755 (and (=> t!36691 result!19095) b_and!39757)))

(declare-fun m!1065389 () Bool)

(assert (=> bm!54980 m!1065389))

(declare-fun m!1065391 () Bool)

(assert (=> b!1155858 m!1065391))

(declare-fun m!1065393 () Bool)

(assert (=> b!1155858 m!1065393))

(declare-fun m!1065395 () Bool)

(assert (=> b!1155861 m!1065395))

(declare-fun m!1065397 () Bool)

(assert (=> b!1155863 m!1065397))

(declare-fun m!1065399 () Bool)

(assert (=> b!1155852 m!1065399))

(declare-fun m!1065401 () Bool)

(assert (=> b!1155870 m!1065401))

(declare-fun m!1065403 () Bool)

(assert (=> b!1155874 m!1065403))

(declare-fun m!1065405 () Bool)

(assert (=> b!1155856 m!1065405))

(declare-fun m!1065407 () Bool)

(assert (=> b!1155856 m!1065407))

(declare-fun m!1065409 () Bool)

(assert (=> start!98848 m!1065409))

(declare-fun m!1065411 () Bool)

(assert (=> start!98848 m!1065411))

(declare-fun m!1065413 () Bool)

(assert (=> b!1155853 m!1065413))

(declare-fun m!1065415 () Bool)

(assert (=> b!1155853 m!1065415))

(declare-fun m!1065417 () Bool)

(assert (=> b!1155877 m!1065417))

(assert (=> b!1155869 m!1065389))

(declare-fun m!1065419 () Bool)

(assert (=> b!1155869 m!1065419))

(declare-fun m!1065421 () Bool)

(assert (=> b!1155869 m!1065421))

(declare-fun m!1065423 () Bool)

(assert (=> b!1155869 m!1065423))

(assert (=> b!1155869 m!1065421))

(assert (=> b!1155869 m!1065391))

(declare-fun m!1065425 () Bool)

(assert (=> b!1155869 m!1065425))

(assert (=> b!1155869 m!1065391))

(assert (=> b!1155869 m!1065419))

(declare-fun m!1065427 () Bool)

(assert (=> b!1155869 m!1065427))

(declare-fun m!1065429 () Bool)

(assert (=> b!1155869 m!1065429))

(assert (=> b!1155869 m!1065391))

(declare-fun m!1065431 () Bool)

(assert (=> b!1155869 m!1065431))

(declare-fun m!1065433 () Bool)

(assert (=> b!1155878 m!1065433))

(declare-fun m!1065435 () Bool)

(assert (=> b!1155878 m!1065435))

(declare-fun m!1065437 () Bool)

(assert (=> b!1155878 m!1065437))

(declare-fun m!1065439 () Bool)

(assert (=> b!1155878 m!1065439))

(assert (=> b!1155868 m!1065399))

(declare-fun m!1065441 () Bool)

(assert (=> bm!54982 m!1065441))

(declare-fun m!1065443 () Bool)

(assert (=> b!1155855 m!1065443))

(declare-fun m!1065445 () Bool)

(assert (=> b!1155855 m!1065445))

(declare-fun m!1065447 () Bool)

(assert (=> b!1155855 m!1065447))

(declare-fun m!1065449 () Bool)

(assert (=> b!1155855 m!1065449))

(declare-fun m!1065451 () Bool)

(assert (=> bm!54975 m!1065451))

(declare-fun m!1065453 () Bool)

(assert (=> b!1155876 m!1065453))

(assert (=> bm!54978 m!1065401))

(declare-fun m!1065455 () Bool)

(assert (=> b!1155865 m!1065455))

(declare-fun m!1065457 () Bool)

(assert (=> b!1155872 m!1065457))

(declare-fun m!1065459 () Bool)

(assert (=> b!1155872 m!1065459))

(declare-fun m!1065461 () Bool)

(assert (=> b!1155872 m!1065461))

(declare-fun m!1065463 () Bool)

(assert (=> bm!54976 m!1065463))

(declare-fun m!1065465 () Bool)

(assert (=> b!1155850 m!1065465))

(declare-fun m!1065467 () Bool)

(assert (=> mapNonEmpty!45299 m!1065467))

(check-sat (not b!1155858) (not b!1155852) (not bm!54976) (not b_lambda!19559) (not b!1155868) (not b!1155850) (not mapNonEmpty!45299) (not b_next!24453) (not b!1155869) (not b!1155870) (not b!1155863) (not b!1155876) (not b!1155872) tp_is_empty!28983 b_and!39757 (not b!1155855) (not b!1155853) (not b!1155878) (not bm!54978) (not b!1155856) (not bm!54980) (not b!1155861) (not b!1155865) (not b!1155877) (not start!98848) (not bm!54982) (not bm!54975))
(check-sat b_and!39757 (not b_next!24453))
