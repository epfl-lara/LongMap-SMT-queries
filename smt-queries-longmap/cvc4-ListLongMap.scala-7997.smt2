; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98826 () Bool)

(assert start!98826)

(declare-fun b_free!24431 () Bool)

(declare-fun b_next!24431 () Bool)

(assert (=> start!98826 (= b_free!24431 (not b_next!24431))))

(declare-fun tp!86004 () Bool)

(declare-fun b_and!39711 () Bool)

(assert (=> start!98826 (= tp!86004 b_and!39711)))

(declare-fun b!1154838 () Bool)

(declare-datatypes ((Unit!38021 0))(
  ( (Unit!38022) )
))
(declare-fun e!656784 () Unit!38021)

(declare-fun Unit!38023 () Unit!38021)

(assert (=> b!1154838 (= e!656784 Unit!38023)))

(declare-fun b!1154839 () Bool)

(declare-fun res!767367 () Bool)

(declare-fun e!656783 () Bool)

(assert (=> b!1154839 (=> (not res!767367) (not e!656783))))

(declare-datatypes ((array!74769 0))(
  ( (array!74770 (arr!36035 (Array (_ BitVec 32) (_ BitVec 64))) (size!36571 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74769)

(declare-datatypes ((List!25226 0))(
  ( (Nil!25223) (Cons!25222 (h!26431 (_ BitVec 64)) (t!36649 List!25226)) )
))
(declare-fun arrayNoDuplicates!0 (array!74769 (_ BitVec 32) List!25226) Bool)

(assert (=> b!1154839 (= res!767367 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25223))))

(declare-fun b!1154840 () Bool)

(declare-fun e!656789 () Bool)

(declare-fun e!656790 () Bool)

(assert (=> b!1154840 (= e!656789 (not e!656790))))

(declare-fun res!767366 () Bool)

(assert (=> b!1154840 (=> res!767366 e!656790)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154840 (= res!767366 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154840 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!517959 () Unit!38021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74769 (_ BitVec 64) (_ BitVec 32)) Unit!38021)

(assert (=> b!1154840 (= lt!517959 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1154841 () Bool)

(declare-fun res!767377 () Bool)

(assert (=> b!1154841 (=> (not res!767377) (not e!656789))))

(declare-fun lt!517964 () array!74769)

(assert (=> b!1154841 (= res!767377 (arrayNoDuplicates!0 lt!517964 #b00000000000000000000000000000000 Nil!25223))))

(declare-fun b!1154842 () Bool)

(declare-fun e!656776 () Bool)

(assert (=> b!1154842 (= e!656776 true)))

(declare-fun e!656782 () Bool)

(assert (=> b!1154842 e!656782))

(declare-fun res!767373 () Bool)

(assert (=> b!1154842 (=> (not res!767373) (not e!656782))))

(declare-datatypes ((V!43741 0))(
  ( (V!43742 (val!14537 Int)) )
))
(declare-datatypes ((tuple2!18482 0))(
  ( (tuple2!18483 (_1!9252 (_ BitVec 64)) (_2!9252 V!43741)) )
))
(declare-datatypes ((List!25227 0))(
  ( (Nil!25224) (Cons!25223 (h!26432 tuple2!18482) (t!36650 List!25227)) )
))
(declare-datatypes ((ListLongMap!16451 0))(
  ( (ListLongMap!16452 (toList!8241 List!25227)) )
))
(declare-fun lt!517971 () ListLongMap!16451)

(declare-fun lt!517970 () ListLongMap!16451)

(assert (=> b!1154842 (= res!767373 (= lt!517971 lt!517970))))

(declare-fun lt!517975 () ListLongMap!16451)

(declare-fun -!1361 (ListLongMap!16451 (_ BitVec 64)) ListLongMap!16451)

(assert (=> b!1154842 (= lt!517971 (-!1361 lt!517975 k!934))))

(declare-fun lt!517969 () V!43741)

(declare-fun +!3654 (ListLongMap!16451 tuple2!18482) ListLongMap!16451)

(assert (=> b!1154842 (= (-!1361 (+!3654 lt!517970 (tuple2!18483 (select (arr!36035 _keys!1208) from!1455) lt!517969)) (select (arr!36035 _keys!1208) from!1455)) lt!517970)))

(declare-fun lt!517976 () Unit!38021)

(declare-fun addThenRemoveForNewKeyIsSame!201 (ListLongMap!16451 (_ BitVec 64) V!43741) Unit!38021)

(assert (=> b!1154842 (= lt!517976 (addThenRemoveForNewKeyIsSame!201 lt!517970 (select (arr!36035 _keys!1208) from!1455) lt!517969))))

(declare-fun lt!517958 () V!43741)

(declare-datatypes ((ValueCell!13771 0))(
  ( (ValueCellFull!13771 (v!17174 V!43741)) (EmptyCell!13771) )
))
(declare-datatypes ((array!74771 0))(
  ( (array!74772 (arr!36036 (Array (_ BitVec 32) ValueCell!13771)) (size!36572 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74771)

(declare-fun get!18357 (ValueCell!13771 V!43741) V!43741)

(assert (=> b!1154842 (= lt!517969 (get!18357 (select (arr!36036 _values!996) from!1455) lt!517958))))

(declare-fun lt!517962 () Unit!38021)

(declare-fun e!656775 () Unit!38021)

(assert (=> b!1154842 (= lt!517962 e!656775)))

(declare-fun c!114741 () Bool)

(declare-fun contains!6754 (ListLongMap!16451 (_ BitVec 64)) Bool)

(assert (=> b!1154842 (= c!114741 (contains!6754 lt!517970 k!934))))

(declare-fun zeroValue!944 () V!43741)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43741)

(declare-fun getCurrentListMapNoExtraKeys!4710 (array!74769 array!74771 (_ BitVec 32) (_ BitVec 32) V!43741 V!43741 (_ BitVec 32) Int) ListLongMap!16451)

(assert (=> b!1154842 (= lt!517970 (getCurrentListMapNoExtraKeys!4710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114738 () Bool)

(declare-fun call!54721 () Unit!38021)

(declare-fun bm!54711 () Bool)

(declare-fun c!114739 () Bool)

(declare-fun addStillContains!899 (ListLongMap!16451 (_ BitVec 64) V!43741 (_ BitVec 64)) Unit!38021)

(assert (=> bm!54711 (= call!54721 (addStillContains!899 lt!517970 (ite (or c!114739 c!114738) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114739 c!114738) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1154843 () Bool)

(declare-fun e!656787 () Unit!38021)

(assert (=> b!1154843 (= e!656787 e!656784)))

(declare-fun c!114737 () Bool)

(declare-fun lt!517977 () Bool)

(assert (=> b!1154843 (= c!114737 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517977))))

(declare-fun b!1154844 () Bool)

(declare-fun call!54717 () ListLongMap!16451)

(assert (=> b!1154844 (contains!6754 call!54717 k!934)))

(declare-fun lt!517965 () ListLongMap!16451)

(declare-fun lt!517974 () Unit!38021)

(assert (=> b!1154844 (= lt!517974 (addStillContains!899 lt!517965 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!54715 () Bool)

(assert (=> b!1154844 call!54715))

(assert (=> b!1154844 (= lt!517965 (+!3654 lt!517970 (tuple2!18483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517973 () Unit!38021)

(assert (=> b!1154844 (= lt!517973 call!54721)))

(declare-fun e!656777 () Unit!38021)

(assert (=> b!1154844 (= e!656777 lt!517974)))

(declare-fun b!1154845 () Bool)

(declare-fun Unit!38024 () Unit!38021)

(assert (=> b!1154845 (= e!656775 Unit!38024)))

(assert (=> b!1154845 (= lt!517977 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154845 (= c!114739 (and (not lt!517977) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517957 () Unit!38021)

(assert (=> b!1154845 (= lt!517957 e!656777)))

(declare-fun lt!517968 () Unit!38021)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!489 (array!74769 array!74771 (_ BitVec 32) (_ BitVec 32) V!43741 V!43741 (_ BitVec 64) (_ BitVec 32) Int) Unit!38021)

(assert (=> b!1154845 (= lt!517968 (lemmaListMapContainsThenArrayContainsFrom!489 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114742 () Bool)

(assert (=> b!1154845 (= c!114742 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767364 () Bool)

(declare-fun e!656774 () Bool)

(assert (=> b!1154845 (= res!767364 e!656774)))

(declare-fun e!656785 () Bool)

(assert (=> b!1154845 (=> (not res!767364) (not e!656785))))

(assert (=> b!1154845 e!656785))

(declare-fun lt!517972 () Unit!38021)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74769 (_ BitVec 32) (_ BitVec 32)) Unit!38021)

(assert (=> b!1154845 (= lt!517972 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1154845 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25223)))

(declare-fun lt!517961 () Unit!38021)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74769 (_ BitVec 64) (_ BitVec 32) List!25226) Unit!38021)

(assert (=> b!1154845 (= lt!517961 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25223))))

(assert (=> b!1154845 false))

(declare-fun mapNonEmpty!45266 () Bool)

(declare-fun mapRes!45266 () Bool)

(declare-fun tp!86003 () Bool)

(declare-fun e!656788 () Bool)

(assert (=> mapNonEmpty!45266 (= mapRes!45266 (and tp!86003 e!656788))))

(declare-fun mapKey!45266 () (_ BitVec 32))

(declare-fun mapRest!45266 () (Array (_ BitVec 32) ValueCell!13771))

(declare-fun mapValue!45266 () ValueCell!13771)

(assert (=> mapNonEmpty!45266 (= (arr!36036 _values!996) (store mapRest!45266 mapKey!45266 mapValue!45266))))

(declare-fun b!1154846 () Bool)

(assert (=> b!1154846 (= e!656783 e!656789)))

(declare-fun res!767376 () Bool)

(assert (=> b!1154846 (=> (not res!767376) (not e!656789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74769 (_ BitVec 32)) Bool)

(assert (=> b!1154846 (= res!767376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517964 mask!1564))))

(assert (=> b!1154846 (= lt!517964 (array!74770 (store (arr!36035 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36571 _keys!1208)))))

(declare-fun b!1154847 () Bool)

(declare-fun e!656780 () Bool)

(declare-fun e!656778 () Bool)

(assert (=> b!1154847 (= e!656780 (and e!656778 mapRes!45266))))

(declare-fun condMapEmpty!45266 () Bool)

(declare-fun mapDefault!45266 () ValueCell!13771)

