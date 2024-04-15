; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101062 () Bool)

(assert start!101062)

(declare-fun b_free!26029 () Bool)

(declare-fun b_next!26029 () Bool)

(assert (=> start!101062 (= b_free!26029 (not b_next!26029))))

(declare-fun tp!91105 () Bool)

(declare-fun b_and!43131 () Bool)

(assert (=> start!101062 (= tp!91105 b_and!43131)))

(declare-fun b!1211060 () Bool)

(declare-fun e!687781 () Bool)

(declare-fun e!687777 () Bool)

(assert (=> b!1211060 (= e!687781 e!687777)))

(declare-fun res!804600 () Bool)

(assert (=> b!1211060 (=> (not res!804600) (not e!687777))))

(declare-datatypes ((array!78166 0))(
  ( (array!78167 (arr!37719 (Array (_ BitVec 32) (_ BitVec 64))) (size!38257 (_ BitVec 32))) )
))
(declare-fun lt!549880 () array!78166)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78166 (_ BitVec 32)) Bool)

(assert (=> b!1211060 (= res!804600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549880 mask!1564))))

(declare-fun _keys!1208 () array!78166)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211060 (= lt!549880 (array!78167 (store (arr!37719 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38257 _keys!1208)))))

(declare-fun b!1211061 () Bool)

(declare-datatypes ((Unit!39986 0))(
  ( (Unit!39987) )
))
(declare-fun e!687790 () Unit!39986)

(declare-fun lt!549891 () Unit!39986)

(assert (=> b!1211061 (= e!687790 lt!549891)))

(declare-fun call!59793 () Unit!39986)

(assert (=> b!1211061 (= lt!549891 call!59793)))

(declare-fun call!59788 () Bool)

(assert (=> b!1211061 call!59788))

(declare-fun b!1211062 () Bool)

(declare-fun e!687782 () Unit!39986)

(declare-fun Unit!39988 () Unit!39986)

(assert (=> b!1211062 (= e!687782 Unit!39988)))

(declare-fun b!1211063 () Bool)

(declare-fun e!687780 () Bool)

(assert (=> b!1211063 (= e!687780 true)))

(declare-fun e!687784 () Bool)

(assert (=> b!1211063 e!687784))

(declare-fun res!804588 () Bool)

(assert (=> b!1211063 (=> (not res!804588) (not e!687784))))

(declare-datatypes ((V!46105 0))(
  ( (V!46106 (val!15423 Int)) )
))
(declare-datatypes ((tuple2!19886 0))(
  ( (tuple2!19887 (_1!9954 (_ BitVec 64)) (_2!9954 V!46105)) )
))
(declare-datatypes ((List!26664 0))(
  ( (Nil!26661) (Cons!26660 (h!27869 tuple2!19886) (t!39664 List!26664)) )
))
(declare-datatypes ((ListLongMap!17855 0))(
  ( (ListLongMap!17856 (toList!8943 List!26664)) )
))
(declare-fun lt!549881 () ListLongMap!17855)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!549882 () V!46105)

(declare-fun -!1821 (ListLongMap!17855 (_ BitVec 64)) ListLongMap!17855)

(declare-fun +!4065 (ListLongMap!17855 tuple2!19886) ListLongMap!17855)

(assert (=> b!1211063 (= res!804588 (= (-!1821 (+!4065 lt!549881 (tuple2!19887 (select (arr!37719 _keys!1208) from!1455) lt!549882)) (select (arr!37719 _keys!1208) from!1455)) lt!549881))))

(declare-fun lt!549897 () Unit!39986)

(declare-fun addThenRemoveForNewKeyIsSame!259 (ListLongMap!17855 (_ BitVec 64) V!46105) Unit!39986)

(assert (=> b!1211063 (= lt!549897 (addThenRemoveForNewKeyIsSame!259 lt!549881 (select (arr!37719 _keys!1208) from!1455) lt!549882))))

(declare-datatypes ((ValueCell!14657 0))(
  ( (ValueCellFull!14657 (v!18074 V!46105)) (EmptyCell!14657) )
))
(declare-datatypes ((array!78168 0))(
  ( (array!78169 (arr!37720 (Array (_ BitVec 32) ValueCell!14657)) (size!38258 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78168)

(declare-fun lt!549884 () V!46105)

(declare-fun get!19238 (ValueCell!14657 V!46105) V!46105)

(assert (=> b!1211063 (= lt!549882 (get!19238 (select (arr!37720 _values!996) from!1455) lt!549884))))

(declare-fun lt!549892 () Unit!39986)

(assert (=> b!1211063 (= lt!549892 e!687782)))

(declare-fun c!119391 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6951 (ListLongMap!17855 (_ BitVec 64)) Bool)

(assert (=> b!1211063 (= c!119391 (contains!6951 lt!549881 k0!934))))

(declare-fun zeroValue!944 () V!46105)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!46105)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5385 (array!78166 array!78168 (_ BitVec 32) (_ BitVec 32) V!46105 V!46105 (_ BitVec 32) Int) ListLongMap!17855)

(assert (=> b!1211063 (= lt!549881 (getCurrentListMapNoExtraKeys!5385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119396 () Bool)

(declare-fun call!59790 () Unit!39986)

(declare-fun c!119393 () Bool)

(declare-fun lt!549883 () ListLongMap!17855)

(declare-fun bm!59783 () Bool)

(declare-fun addStillContains!1050 (ListLongMap!17855 (_ BitVec 64) V!46105 (_ BitVec 64)) Unit!39986)

(assert (=> bm!59783 (= call!59790 (addStillContains!1050 (ite c!119393 lt!549883 lt!549881) (ite c!119393 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119396 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119393 minValue!944 (ite c!119396 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1211064 () Bool)

(declare-fun e!687778 () Bool)

(declare-fun tp_is_empty!30733 () Bool)

(assert (=> b!1211064 (= e!687778 tp_is_empty!30733)))

(declare-fun bm!59784 () Bool)

(assert (=> bm!59784 (= call!59793 call!59790)))

(declare-fun b!1211065 () Bool)

(declare-fun e!687792 () Bool)

(declare-fun call!59792 () ListLongMap!17855)

(declare-fun call!59786 () ListLongMap!17855)

(assert (=> b!1211065 (= e!687792 (= call!59792 call!59786))))

(declare-fun e!687789 () Bool)

(declare-fun b!1211066 () Bool)

(declare-fun arrayContainsKey!0 (array!78166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211066 (= e!687789 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211067 () Bool)

(declare-fun res!804596 () Bool)

(assert (=> b!1211067 (=> (not res!804596) (not e!687781))))

(assert (=> b!1211067 (= res!804596 (= (select (arr!37719 _keys!1208) i!673) k0!934))))

(declare-fun bm!59786 () Bool)

(declare-fun call!59791 () ListLongMap!17855)

(declare-fun call!59789 () ListLongMap!17855)

(assert (=> bm!59786 (= call!59791 call!59789)))

(declare-fun b!1211068 () Bool)

(declare-fun e!687785 () Bool)

(assert (=> b!1211068 (= e!687785 tp_is_empty!30733)))

(declare-fun b!1211069 () Bool)

(declare-fun res!804594 () Bool)

(assert (=> b!1211069 (=> (not res!804594) (not e!687781))))

(assert (=> b!1211069 (= res!804594 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38257 _keys!1208))))))

(declare-fun bm!59787 () Bool)

(declare-fun call!59787 () Bool)

(assert (=> bm!59787 (= call!59788 call!59787)))

(declare-fun b!1211070 () Bool)

(declare-fun e!687786 () Bool)

(assert (=> b!1211070 (= e!687786 e!687780)))

(declare-fun res!804601 () Bool)

(assert (=> b!1211070 (=> res!804601 e!687780)))

(assert (=> b!1211070 (= res!804601 (not (= (select (arr!37719 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1211070 e!687792))

(declare-fun c!119394 () Bool)

(assert (=> b!1211070 (= c!119394 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549898 () Unit!39986)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1063 (array!78166 array!78168 (_ BitVec 32) (_ BitVec 32) V!46105 V!46105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39986)

(assert (=> b!1211070 (= lt!549898 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1063 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211071 () Bool)

(assert (=> b!1211071 (= e!687792 (= call!59792 (-!1821 call!59786 k0!934)))))

(declare-fun lt!549888 () ListLongMap!17855)

(declare-fun b!1211072 () Bool)

(assert (=> b!1211072 (= e!687784 (= (-!1821 lt!549888 k0!934) lt!549881))))

(declare-fun bm!59788 () Bool)

(assert (=> bm!59788 (= call!59787 (contains!6951 (ite c!119393 lt!549883 call!59791) k0!934))))

(declare-fun b!1211073 () Bool)

(declare-fun res!804595 () Bool)

(assert (=> b!1211073 (=> (not res!804595) (not e!687781))))

(assert (=> b!1211073 (= res!804595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211074 () Bool)

(assert (=> b!1211074 (contains!6951 call!59789 k0!934)))

(declare-fun lt!549893 () Unit!39986)

(assert (=> b!1211074 (= lt!549893 call!59790)))

(assert (=> b!1211074 call!59787))

(assert (=> b!1211074 (= lt!549883 (+!4065 lt!549881 (tuple2!19887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549899 () Unit!39986)

(assert (=> b!1211074 (= lt!549899 (addStillContains!1050 lt!549881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!687793 () Unit!39986)

(assert (=> b!1211074 (= e!687793 lt!549893)))

(declare-fun b!1211075 () Bool)

(declare-fun res!804599 () Bool)

(assert (=> b!1211075 (=> (not res!804599) (not e!687781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211075 (= res!804599 (validMask!0 mask!1564))))

(declare-fun b!1211076 () Bool)

(declare-fun e!687787 () Bool)

(assert (=> b!1211076 (= e!687787 e!687786)))

(declare-fun res!804592 () Bool)

(assert (=> b!1211076 (=> res!804592 e!687786)))

(assert (=> b!1211076 (= res!804592 (not (= from!1455 i!673)))))

(declare-fun lt!549890 () array!78168)

(declare-fun lt!549885 () ListLongMap!17855)

(assert (=> b!1211076 (= lt!549885 (getCurrentListMapNoExtraKeys!5385 lt!549880 lt!549890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1211076 (= lt!549890 (array!78169 (store (arr!37720 _values!996) i!673 (ValueCellFull!14657 lt!549884)) (size!38258 _values!996)))))

(declare-fun dynLambda!3244 (Int (_ BitVec 64)) V!46105)

(assert (=> b!1211076 (= lt!549884 (dynLambda!3244 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1211076 (= lt!549888 (getCurrentListMapNoExtraKeys!5385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1211077 () Bool)

(declare-fun Unit!39989 () Unit!39986)

(assert (=> b!1211077 (= e!687782 Unit!39989)))

(declare-fun lt!549896 () Bool)

(assert (=> b!1211077 (= lt!549896 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211077 (= c!119393 (and (not lt!549896) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549895 () Unit!39986)

(assert (=> b!1211077 (= lt!549895 e!687793)))

(declare-fun lt!549886 () Unit!39986)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!591 (array!78166 array!78168 (_ BitVec 32) (_ BitVec 32) V!46105 V!46105 (_ BitVec 64) (_ BitVec 32) Int) Unit!39986)

(assert (=> b!1211077 (= lt!549886 (lemmaListMapContainsThenArrayContainsFrom!591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119392 () Bool)

(assert (=> b!1211077 (= c!119392 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804598 () Bool)

(assert (=> b!1211077 (= res!804598 e!687789)))

(declare-fun e!687783 () Bool)

(assert (=> b!1211077 (=> (not res!804598) (not e!687783))))

(assert (=> b!1211077 e!687783))

(declare-fun lt!549894 () Unit!39986)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78166 (_ BitVec 32) (_ BitVec 32)) Unit!39986)

(assert (=> b!1211077 (= lt!549894 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26665 0))(
  ( (Nil!26662) (Cons!26661 (h!27870 (_ BitVec 64)) (t!39665 List!26665)) )
))
(declare-fun arrayNoDuplicates!0 (array!78166 (_ BitVec 32) List!26665) Bool)

(assert (=> b!1211077 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26662)))

(declare-fun lt!549889 () Unit!39986)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78166 (_ BitVec 64) (_ BitVec 32) List!26665) Unit!39986)

(assert (=> b!1211077 (= lt!549889 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26662))))

(assert (=> b!1211077 false))

(declare-fun b!1211078 () Bool)

(declare-fun e!687779 () Unit!39986)

(declare-fun Unit!39990 () Unit!39986)

(assert (=> b!1211078 (= e!687779 Unit!39990)))

(declare-fun bm!59785 () Bool)

(assert (=> bm!59785 (= call!59792 (getCurrentListMapNoExtraKeys!5385 lt!549880 lt!549890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!804590 () Bool)

(assert (=> start!101062 (=> (not res!804590) (not e!687781))))

(assert (=> start!101062 (= res!804590 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38257 _keys!1208))))))

(assert (=> start!101062 e!687781))

(assert (=> start!101062 tp_is_empty!30733))

(declare-fun array_inv!28840 (array!78166) Bool)

(assert (=> start!101062 (array_inv!28840 _keys!1208)))

(assert (=> start!101062 true))

(assert (=> start!101062 tp!91105))

(declare-fun e!687788 () Bool)

(declare-fun array_inv!28841 (array!78168) Bool)

(assert (=> start!101062 (and (array_inv!28841 _values!996) e!687788)))

(declare-fun bm!59789 () Bool)

(assert (=> bm!59789 (= call!59789 (+!4065 (ite c!119393 lt!549883 lt!549881) (ite c!119393 (tuple2!19887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119396 (tuple2!19887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1211079 () Bool)

(declare-fun mapRes!47971 () Bool)

(assert (=> b!1211079 (= e!687788 (and e!687785 mapRes!47971))))

(declare-fun condMapEmpty!47971 () Bool)

(declare-fun mapDefault!47971 () ValueCell!14657)

(assert (=> b!1211079 (= condMapEmpty!47971 (= (arr!37720 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14657)) mapDefault!47971)))))

(declare-fun mapNonEmpty!47971 () Bool)

(declare-fun tp!91106 () Bool)

(assert (=> mapNonEmpty!47971 (= mapRes!47971 (and tp!91106 e!687778))))

(declare-fun mapRest!47971 () (Array (_ BitVec 32) ValueCell!14657))

(declare-fun mapValue!47971 () ValueCell!14657)

(declare-fun mapKey!47971 () (_ BitVec 32))

(assert (=> mapNonEmpty!47971 (= (arr!37720 _values!996) (store mapRest!47971 mapKey!47971 mapValue!47971))))

(declare-fun b!1211080 () Bool)

(declare-fun res!804591 () Bool)

(assert (=> b!1211080 (=> (not res!804591) (not e!687781))))

(assert (=> b!1211080 (= res!804591 (and (= (size!38258 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38257 _keys!1208) (size!38258 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1211081 () Bool)

(declare-fun res!804597 () Bool)

(assert (=> b!1211081 (=> (not res!804597) (not e!687777))))

(assert (=> b!1211081 (= res!804597 (arrayNoDuplicates!0 lt!549880 #b00000000000000000000000000000000 Nil!26662))))

(declare-fun b!1211082 () Bool)

(assert (=> b!1211082 (= c!119396 (and (not lt!549896) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1211082 (= e!687793 e!687790)))

(declare-fun b!1211083 () Bool)

(assert (=> b!1211083 (= e!687790 e!687779)))

(declare-fun c!119395 () Bool)

(assert (=> b!1211083 (= c!119395 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549896))))

(declare-fun b!1211084 () Bool)

(assert (=> b!1211084 call!59788))

(declare-fun lt!549887 () Unit!39986)

(assert (=> b!1211084 (= lt!549887 call!59793)))

(assert (=> b!1211084 (= e!687779 lt!549887)))

(declare-fun bm!59790 () Bool)

(assert (=> bm!59790 (= call!59786 (getCurrentListMapNoExtraKeys!5385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211085 () Bool)

(declare-fun res!804593 () Bool)

(assert (=> b!1211085 (=> (not res!804593) (not e!687781))))

(assert (=> b!1211085 (= res!804593 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26662))))

(declare-fun b!1211086 () Bool)

(assert (=> b!1211086 (= e!687783 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211087 () Bool)

(assert (=> b!1211087 (= e!687777 (not e!687787))))

(declare-fun res!804587 () Bool)

(assert (=> b!1211087 (=> res!804587 e!687787)))

(assert (=> b!1211087 (= res!804587 (bvsgt from!1455 i!673))))

(assert (=> b!1211087 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549879 () Unit!39986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78166 (_ BitVec 64) (_ BitVec 32)) Unit!39986)

(assert (=> b!1211087 (= lt!549879 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1211088 () Bool)

(declare-fun res!804589 () Bool)

(assert (=> b!1211088 (=> (not res!804589) (not e!687781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211088 (= res!804589 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47971 () Bool)

(assert (=> mapIsEmpty!47971 mapRes!47971))

(declare-fun b!1211089 () Bool)

(assert (=> b!1211089 (= e!687789 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549896) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!101062 res!804590) b!1211075))

(assert (= (and b!1211075 res!804599) b!1211080))

(assert (= (and b!1211080 res!804591) b!1211073))

(assert (= (and b!1211073 res!804595) b!1211085))

(assert (= (and b!1211085 res!804593) b!1211069))

(assert (= (and b!1211069 res!804594) b!1211088))

(assert (= (and b!1211088 res!804589) b!1211067))

(assert (= (and b!1211067 res!804596) b!1211060))

(assert (= (and b!1211060 res!804600) b!1211081))

(assert (= (and b!1211081 res!804597) b!1211087))

(assert (= (and b!1211087 (not res!804587)) b!1211076))

(assert (= (and b!1211076 (not res!804592)) b!1211070))

(assert (= (and b!1211070 c!119394) b!1211071))

(assert (= (and b!1211070 (not c!119394)) b!1211065))

(assert (= (or b!1211071 b!1211065) bm!59785))

(assert (= (or b!1211071 b!1211065) bm!59790))

(assert (= (and b!1211070 (not res!804601)) b!1211063))

(assert (= (and b!1211063 c!119391) b!1211077))

(assert (= (and b!1211063 (not c!119391)) b!1211062))

(assert (= (and b!1211077 c!119393) b!1211074))

(assert (= (and b!1211077 (not c!119393)) b!1211082))

(assert (= (and b!1211082 c!119396) b!1211061))

(assert (= (and b!1211082 (not c!119396)) b!1211083))

(assert (= (and b!1211083 c!119395) b!1211084))

(assert (= (and b!1211083 (not c!119395)) b!1211078))

(assert (= (or b!1211061 b!1211084) bm!59784))

(assert (= (or b!1211061 b!1211084) bm!59786))

(assert (= (or b!1211061 b!1211084) bm!59787))

(assert (= (or b!1211074 bm!59787) bm!59788))

(assert (= (or b!1211074 bm!59784) bm!59783))

(assert (= (or b!1211074 bm!59786) bm!59789))

(assert (= (and b!1211077 c!119392) b!1211066))

(assert (= (and b!1211077 (not c!119392)) b!1211089))

(assert (= (and b!1211077 res!804598) b!1211086))

(assert (= (and b!1211063 res!804588) b!1211072))

(assert (= (and b!1211079 condMapEmpty!47971) mapIsEmpty!47971))

(assert (= (and b!1211079 (not condMapEmpty!47971)) mapNonEmpty!47971))

(get-info :version)

(assert (= (and mapNonEmpty!47971 ((_ is ValueCellFull!14657) mapValue!47971)) b!1211064))

(assert (= (and b!1211079 ((_ is ValueCellFull!14657) mapDefault!47971)) b!1211068))

(assert (= start!101062 b!1211079))

(declare-fun b_lambda!21641 () Bool)

(assert (=> (not b_lambda!21641) (not b!1211076)))

(declare-fun t!39663 () Bool)

(declare-fun tb!10821 () Bool)

(assert (=> (and start!101062 (= defaultEntry!1004 defaultEntry!1004) t!39663) tb!10821))

(declare-fun result!22245 () Bool)

(assert (=> tb!10821 (= result!22245 tp_is_empty!30733)))

(assert (=> b!1211076 t!39663))

(declare-fun b_and!43133 () Bool)

(assert (= b_and!43131 (and (=> t!39663 result!22245) b_and!43133)))

(declare-fun m!1116051 () Bool)

(assert (=> b!1211066 m!1116051))

(declare-fun m!1116053 () Bool)

(assert (=> bm!59785 m!1116053))

(declare-fun m!1116055 () Bool)

(assert (=> b!1211077 m!1116055))

(declare-fun m!1116057 () Bool)

(assert (=> b!1211077 m!1116057))

(declare-fun m!1116059 () Bool)

(assert (=> b!1211077 m!1116059))

(declare-fun m!1116061 () Bool)

(assert (=> b!1211077 m!1116061))

(declare-fun m!1116063 () Bool)

(assert (=> b!1211072 m!1116063))

(declare-fun m!1116065 () Bool)

(assert (=> mapNonEmpty!47971 m!1116065))

(declare-fun m!1116067 () Bool)

(assert (=> b!1211073 m!1116067))

(assert (=> b!1211086 m!1116051))

(declare-fun m!1116069 () Bool)

(assert (=> b!1211074 m!1116069))

(declare-fun m!1116071 () Bool)

(assert (=> b!1211074 m!1116071))

(declare-fun m!1116073 () Bool)

(assert (=> b!1211074 m!1116073))

(declare-fun m!1116075 () Bool)

(assert (=> bm!59789 m!1116075))

(declare-fun m!1116077 () Bool)

(assert (=> b!1211075 m!1116077))

(declare-fun m!1116079 () Bool)

(assert (=> b!1211076 m!1116079))

(declare-fun m!1116081 () Bool)

(assert (=> b!1211076 m!1116081))

(declare-fun m!1116083 () Bool)

(assert (=> b!1211076 m!1116083))

(declare-fun m!1116085 () Bool)

(assert (=> b!1211076 m!1116085))

(declare-fun m!1116087 () Bool)

(assert (=> b!1211085 m!1116087))

(declare-fun m!1116089 () Bool)

(assert (=> bm!59783 m!1116089))

(declare-fun m!1116091 () Bool)

(assert (=> b!1211088 m!1116091))

(declare-fun m!1116093 () Bool)

(assert (=> start!101062 m!1116093))

(declare-fun m!1116095 () Bool)

(assert (=> start!101062 m!1116095))

(declare-fun m!1116097 () Bool)

(assert (=> bm!59790 m!1116097))

(declare-fun m!1116099 () Bool)

(assert (=> b!1211060 m!1116099))

(declare-fun m!1116101 () Bool)

(assert (=> b!1211060 m!1116101))

(assert (=> b!1211063 m!1116097))

(declare-fun m!1116103 () Bool)

(assert (=> b!1211063 m!1116103))

(declare-fun m!1116105 () Bool)

(assert (=> b!1211063 m!1116105))

(declare-fun m!1116107 () Bool)

(assert (=> b!1211063 m!1116107))

(declare-fun m!1116109 () Bool)

(assert (=> b!1211063 m!1116109))

(declare-fun m!1116111 () Bool)

(assert (=> b!1211063 m!1116111))

(assert (=> b!1211063 m!1116103))

(declare-fun m!1116113 () Bool)

(assert (=> b!1211063 m!1116113))

(assert (=> b!1211063 m!1116109))

(assert (=> b!1211063 m!1116107))

(assert (=> b!1211063 m!1116109))

(declare-fun m!1116115 () Bool)

(assert (=> b!1211063 m!1116115))

(declare-fun m!1116117 () Bool)

(assert (=> b!1211071 m!1116117))

(declare-fun m!1116119 () Bool)

(assert (=> bm!59788 m!1116119))

(declare-fun m!1116121 () Bool)

(assert (=> b!1211081 m!1116121))

(declare-fun m!1116123 () Bool)

(assert (=> b!1211067 m!1116123))

(assert (=> b!1211070 m!1116109))

(declare-fun m!1116125 () Bool)

(assert (=> b!1211070 m!1116125))

(declare-fun m!1116127 () Bool)

(assert (=> b!1211087 m!1116127))

(declare-fun m!1116129 () Bool)

(assert (=> b!1211087 m!1116129))

(check-sat (not bm!59790) (not b!1211085) (not bm!59789) (not b!1211071) (not b!1211081) (not mapNonEmpty!47971) (not b!1211066) (not start!101062) (not b!1211076) b_and!43133 tp_is_empty!30733 (not bm!59783) (not b!1211088) (not b!1211087) (not b!1211074) (not b!1211073) (not b_next!26029) (not b!1211070) (not bm!59785) (not b_lambda!21641) (not bm!59788) (not b!1211086) (not b!1211060) (not b!1211075) (not b!1211072) (not b!1211063) (not b!1211077))
(check-sat b_and!43133 (not b_next!26029))
