; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98502 () Bool)

(assert start!98502)

(declare-fun b_free!24107 () Bool)

(declare-fun b_next!24107 () Bool)

(assert (=> start!98502 (= b_free!24107 (not b_next!24107))))

(declare-fun tp!85031 () Bool)

(declare-fun b_and!39063 () Bool)

(assert (=> start!98502 (= tp!85031 b_and!39063)))

(declare-fun b!1140070 () Bool)

(declare-fun res!760213 () Bool)

(declare-fun e!648655 () Bool)

(assert (=> b!1140070 (=> (not res!760213) (not e!648655))))

(declare-datatypes ((array!74133 0))(
  ( (array!74134 (arr!35717 (Array (_ BitVec 32) (_ BitVec 64))) (size!36253 (_ BitVec 32))) )
))
(declare-fun lt!507562 () array!74133)

(declare-datatypes ((List!24931 0))(
  ( (Nil!24928) (Cons!24927 (h!26136 (_ BitVec 64)) (t!36030 List!24931)) )
))
(declare-fun arrayNoDuplicates!0 (array!74133 (_ BitVec 32) List!24931) Bool)

(assert (=> b!1140070 (= res!760213 (arrayNoDuplicates!0 lt!507562 #b00000000000000000000000000000000 Nil!24928))))

(declare-fun b!1140071 () Bool)

(declare-fun e!648650 () Bool)

(declare-fun e!648653 () Bool)

(assert (=> b!1140071 (= e!648650 e!648653)))

(declare-fun res!760211 () Bool)

(assert (=> b!1140071 (=> res!760211 e!648653)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140071 (= res!760211 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43309 0))(
  ( (V!43310 (val!14375 Int)) )
))
(declare-fun zeroValue!944 () V!43309)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13609 0))(
  ( (ValueCellFull!13609 (v!17012 V!43309)) (EmptyCell!13609) )
))
(declare-datatypes ((array!74135 0))(
  ( (array!74136 (arr!35718 (Array (_ BitVec 32) ValueCell!13609)) (size!36254 (_ BitVec 32))) )
))
(declare-fun lt!507564 () array!74135)

(declare-datatypes ((tuple2!18176 0))(
  ( (tuple2!18177 (_1!9099 (_ BitVec 64)) (_2!9099 V!43309)) )
))
(declare-datatypes ((List!24932 0))(
  ( (Nil!24929) (Cons!24928 (h!26137 tuple2!18176) (t!36031 List!24932)) )
))
(declare-datatypes ((ListLongMap!16145 0))(
  ( (ListLongMap!16146 (toList!8088 List!24932)) )
))
(declare-fun lt!507578 () ListLongMap!16145)

(declare-fun minValue!944 () V!43309)

(declare-fun getCurrentListMapNoExtraKeys!4570 (array!74133 array!74135 (_ BitVec 32) (_ BitVec 32) V!43309 V!43309 (_ BitVec 32) Int) ListLongMap!16145)

(assert (=> b!1140071 (= lt!507578 (getCurrentListMapNoExtraKeys!4570 lt!507562 lt!507564 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507574 () V!43309)

(declare-fun _values!996 () array!74135)

(assert (=> b!1140071 (= lt!507564 (array!74136 (store (arr!35718 _values!996) i!673 (ValueCellFull!13609 lt!507574)) (size!36254 _values!996)))))

(declare-fun dynLambda!2619 (Int (_ BitVec 64)) V!43309)

(assert (=> b!1140071 (= lt!507574 (dynLambda!2619 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74133)

(declare-fun lt!507577 () ListLongMap!16145)

(assert (=> b!1140071 (= lt!507577 (getCurrentListMapNoExtraKeys!4570 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!648656 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1140072 () Bool)

(declare-fun arrayContainsKey!0 (array!74133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140072 (= e!648656 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140073 () Bool)

(declare-datatypes ((Unit!37378 0))(
  ( (Unit!37379) )
))
(declare-fun e!648660 () Unit!37378)

(declare-fun lt!507579 () Unit!37378)

(assert (=> b!1140073 (= e!648660 lt!507579)))

(declare-fun call!50830 () Unit!37378)

(assert (=> b!1140073 (= lt!507579 call!50830)))

(declare-fun call!50833 () Bool)

(assert (=> b!1140073 call!50833))

(declare-fun res!760217 () Bool)

(declare-fun e!648663 () Bool)

(assert (=> start!98502 (=> (not res!760217) (not e!648663))))

(assert (=> start!98502 (= res!760217 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36253 _keys!1208))))))

(assert (=> start!98502 e!648663))

(declare-fun tp_is_empty!28637 () Bool)

(assert (=> start!98502 tp_is_empty!28637))

(declare-fun array_inv!27378 (array!74133) Bool)

(assert (=> start!98502 (array_inv!27378 _keys!1208)))

(assert (=> start!98502 true))

(assert (=> start!98502 tp!85031))

(declare-fun e!648648 () Bool)

(declare-fun array_inv!27379 (array!74135) Bool)

(assert (=> start!98502 (and (array_inv!27379 _values!996) e!648648)))

(declare-fun b!1140074 () Bool)

(declare-fun res!760222 () Bool)

(assert (=> b!1140074 (=> (not res!760222) (not e!648663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140074 (= res!760222 (validMask!0 mask!1564))))

(declare-fun b!1140075 () Bool)

(declare-fun e!648659 () Bool)

(assert (=> b!1140075 (= e!648659 tp_is_empty!28637)))

(declare-fun b!1140076 () Bool)

(declare-fun e!648652 () Bool)

(assert (=> b!1140076 (= e!648652 true)))

(declare-fun lt!507573 () ListLongMap!16145)

(declare-fun lt!507576 () V!43309)

(declare-fun -!1238 (ListLongMap!16145 (_ BitVec 64)) ListLongMap!16145)

(declare-fun +!3520 (ListLongMap!16145 tuple2!18176) ListLongMap!16145)

(assert (=> b!1140076 (= (-!1238 (+!3520 lt!507573 (tuple2!18177 (select (arr!35717 _keys!1208) from!1455) lt!507576)) (select (arr!35717 _keys!1208) from!1455)) lt!507573)))

(declare-fun lt!507571 () Unit!37378)

(declare-fun addThenRemoveForNewKeyIsSame!93 (ListLongMap!16145 (_ BitVec 64) V!43309) Unit!37378)

(assert (=> b!1140076 (= lt!507571 (addThenRemoveForNewKeyIsSame!93 lt!507573 (select (arr!35717 _keys!1208) from!1455) lt!507576))))

(declare-fun get!18141 (ValueCell!13609 V!43309) V!43309)

(assert (=> b!1140076 (= lt!507576 (get!18141 (select (arr!35718 _values!996) from!1455) lt!507574))))

(declare-fun lt!507566 () Unit!37378)

(declare-fun e!648658 () Unit!37378)

(assert (=> b!1140076 (= lt!507566 e!648658)))

(declare-fun c!111825 () Bool)

(declare-fun contains!6623 (ListLongMap!16145 (_ BitVec 64)) Bool)

(assert (=> b!1140076 (= c!111825 (contains!6623 lt!507573 k!934))))

(assert (=> b!1140076 (= lt!507573 (getCurrentListMapNoExtraKeys!4570 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140077 () Bool)

(declare-fun Unit!37380 () Unit!37378)

(assert (=> b!1140077 (= e!648658 Unit!37380)))

(declare-fun lt!507582 () Bool)

(assert (=> b!1140077 (= lt!507582 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111826 () Bool)

(assert (=> b!1140077 (= c!111826 (and (not lt!507582) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507580 () Unit!37378)

(declare-fun e!648654 () Unit!37378)

(assert (=> b!1140077 (= lt!507580 e!648654)))

(declare-fun lt!507569 () Unit!37378)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!378 (array!74133 array!74135 (_ BitVec 32) (_ BitVec 32) V!43309 V!43309 (_ BitVec 64) (_ BitVec 32) Int) Unit!37378)

(assert (=> b!1140077 (= lt!507569 (lemmaListMapContainsThenArrayContainsFrom!378 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111824 () Bool)

(assert (=> b!1140077 (= c!111824 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760210 () Bool)

(assert (=> b!1140077 (= res!760210 e!648656)))

(declare-fun e!648651 () Bool)

(assert (=> b!1140077 (=> (not res!760210) (not e!648651))))

(assert (=> b!1140077 e!648651))

(declare-fun lt!507570 () Unit!37378)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74133 (_ BitVec 32) (_ BitVec 32)) Unit!37378)

(assert (=> b!1140077 (= lt!507570 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140077 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24928)))

(declare-fun lt!507575 () Unit!37378)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74133 (_ BitVec 64) (_ BitVec 32) List!24931) Unit!37378)

(assert (=> b!1140077 (= lt!507575 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24928))))

(assert (=> b!1140077 false))

(declare-fun bm!50823 () Bool)

(declare-fun call!50829 () ListLongMap!16145)

(assert (=> bm!50823 (= call!50829 (getCurrentListMapNoExtraKeys!4570 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50824 () Bool)

(declare-fun call!50828 () Bool)

(assert (=> bm!50824 (= call!50833 call!50828)))

(declare-fun b!1140078 () Bool)

(declare-fun e!648657 () Bool)

(assert (=> b!1140078 (= e!648657 tp_is_empty!28637)))

(declare-fun b!1140079 () Bool)

(declare-fun res!760212 () Bool)

(assert (=> b!1140079 (=> (not res!760212) (not e!648663))))

(assert (=> b!1140079 (= res!760212 (and (= (size!36254 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36253 _keys!1208) (size!36254 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140080 () Bool)

(declare-fun c!111822 () Bool)

(assert (=> b!1140080 (= c!111822 (and (not lt!507582) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1140080 (= e!648654 e!648660)))

(declare-fun bm!50825 () Bool)

(declare-fun call!50826 () ListLongMap!16145)

(assert (=> bm!50825 (= call!50826 (+!3520 lt!507573 (ite (or c!111826 c!111822) (tuple2!18177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1140081 () Bool)

(declare-fun e!648661 () Bool)

(declare-fun call!50827 () ListLongMap!16145)

(assert (=> b!1140081 (= e!648661 (= call!50827 call!50829))))

(declare-fun b!1140082 () Bool)

(assert (=> b!1140082 (= e!648661 (= call!50827 (-!1238 call!50829 k!934)))))

(declare-fun b!1140083 () Bool)

(assert (=> b!1140083 (= e!648663 e!648655)))

(declare-fun res!760215 () Bool)

(assert (=> b!1140083 (=> (not res!760215) (not e!648655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74133 (_ BitVec 32)) Bool)

(assert (=> b!1140083 (= res!760215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507562 mask!1564))))

(assert (=> b!1140083 (= lt!507562 (array!74134 (store (arr!35717 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36253 _keys!1208)))))

(declare-fun b!1140084 () Bool)

(assert (=> b!1140084 (= e!648651 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140085 () Bool)

(declare-fun mapRes!44780 () Bool)

(assert (=> b!1140085 (= e!648648 (and e!648659 mapRes!44780))))

(declare-fun condMapEmpty!44780 () Bool)

(declare-fun mapDefault!44780 () ValueCell!13609)

