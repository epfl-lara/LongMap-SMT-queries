; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98638 () Bool)

(assert start!98638)

(declare-fun b_free!24243 () Bool)

(declare-fun b_next!24243 () Bool)

(assert (=> start!98638 (= b_free!24243 (not b_next!24243))))

(declare-fun tp!85439 () Bool)

(declare-fun b_and!39335 () Bool)

(assert (=> start!98638 (= tp!85439 b_and!39335)))

(declare-fun b!1146190 () Bool)

(declare-fun e!651995 () Bool)

(declare-fun e!651981 () Bool)

(assert (=> b!1146190 (= e!651995 e!651981)))

(declare-fun res!763140 () Bool)

(assert (=> b!1146190 (=> res!763140 e!651981)))

(declare-datatypes ((array!74395 0))(
  ( (array!74396 (arr!35848 (Array (_ BitVec 32) (_ BitVec 64))) (size!36384 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74395)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1146190 (= res!763140 (not (= (select (arr!35848 _keys!1208) from!1455) k0!934)))))

(declare-fun e!651980 () Bool)

(assert (=> b!1146190 e!651980))

(declare-fun c!113046 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146190 (= c!113046 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43491 0))(
  ( (V!43492 (val!14443 Int)) )
))
(declare-fun zeroValue!944 () V!43491)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37634 0))(
  ( (Unit!37635) )
))
(declare-fun lt!511848 () Unit!37634)

(declare-datatypes ((ValueCell!13677 0))(
  ( (ValueCellFull!13677 (v!17080 V!43491)) (EmptyCell!13677) )
))
(declare-datatypes ((array!74397 0))(
  ( (array!74398 (arr!35849 (Array (_ BitVec 32) ValueCell!13677)) (size!36385 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74397)

(declare-fun minValue!944 () V!43491)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!527 (array!74395 array!74397 (_ BitVec 32) (_ BitVec 32) V!43491 V!43491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37634)

(assert (=> b!1146190 (= lt!511848 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!527 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146191 () Bool)

(declare-fun call!52465 () Bool)

(assert (=> b!1146191 call!52465))

(declare-fun lt!511853 () Unit!37634)

(declare-fun call!52460 () Unit!37634)

(assert (=> b!1146191 (= lt!511853 call!52460)))

(declare-fun e!651990 () Unit!37634)

(assert (=> b!1146191 (= e!651990 lt!511853)))

(declare-fun b!1146192 () Bool)

(declare-fun e!651994 () Bool)

(assert (=> b!1146192 (= e!651994 e!651995)))

(declare-fun res!763146 () Bool)

(assert (=> b!1146192 (=> res!763146 e!651995)))

(assert (=> b!1146192 (= res!763146 (not (= from!1455 i!673)))))

(declare-fun lt!511847 () array!74395)

(declare-fun lt!511846 () array!74397)

(declare-datatypes ((tuple2!18298 0))(
  ( (tuple2!18299 (_1!9160 (_ BitVec 64)) (_2!9160 V!43491)) )
))
(declare-datatypes ((List!25051 0))(
  ( (Nil!25048) (Cons!25047 (h!26256 tuple2!18298) (t!36286 List!25051)) )
))
(declare-datatypes ((ListLongMap!16267 0))(
  ( (ListLongMap!16268 (toList!8149 List!25051)) )
))
(declare-fun lt!511855 () ListLongMap!16267)

(declare-fun getCurrentListMapNoExtraKeys!4624 (array!74395 array!74397 (_ BitVec 32) (_ BitVec 32) V!43491 V!43491 (_ BitVec 32) Int) ListLongMap!16267)

(assert (=> b!1146192 (= lt!511855 (getCurrentListMapNoExtraKeys!4624 lt!511847 lt!511846 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!511856 () V!43491)

(assert (=> b!1146192 (= lt!511846 (array!74398 (store (arr!35849 _values!996) i!673 (ValueCellFull!13677 lt!511856)) (size!36385 _values!996)))))

(declare-fun dynLambda!2658 (Int (_ BitVec 64)) V!43491)

(assert (=> b!1146192 (= lt!511856 (dynLambda!2658 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511851 () ListLongMap!16267)

(assert (=> b!1146192 (= lt!511851 (getCurrentListMapNoExtraKeys!4624 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1146193 () Bool)

(declare-fun e!651987 () Unit!37634)

(declare-fun Unit!37636 () Unit!37634)

(assert (=> b!1146193 (= e!651987 Unit!37636)))

(declare-fun b!1146194 () Bool)

(declare-fun e!651984 () Unit!37634)

(declare-fun lt!511852 () Unit!37634)

(assert (=> b!1146194 (= e!651984 lt!511852)))

(assert (=> b!1146194 (= lt!511852 call!52460)))

(assert (=> b!1146194 call!52465))

(declare-fun res!763135 () Bool)

(declare-fun e!651991 () Bool)

(assert (=> start!98638 (=> (not res!763135) (not e!651991))))

(assert (=> start!98638 (= res!763135 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36384 _keys!1208))))))

(assert (=> start!98638 e!651991))

(declare-fun tp_is_empty!28773 () Bool)

(assert (=> start!98638 tp_is_empty!28773))

(declare-fun array_inv!27462 (array!74395) Bool)

(assert (=> start!98638 (array_inv!27462 _keys!1208)))

(assert (=> start!98638 true))

(assert (=> start!98638 tp!85439))

(declare-fun e!651982 () Bool)

(declare-fun array_inv!27463 (array!74397) Bool)

(assert (=> start!98638 (and (array_inv!27463 _values!996) e!651982)))

(declare-fun b!1146195 () Bool)

(declare-fun res!763143 () Bool)

(assert (=> b!1146195 (=> (not res!763143) (not e!651991))))

(assert (=> b!1146195 (= res!763143 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36384 _keys!1208))))))

(declare-fun b!1146196 () Bool)

(declare-fun res!763134 () Bool)

(declare-fun e!651993 () Bool)

(assert (=> b!1146196 (=> (not res!763134) (not e!651993))))

(declare-datatypes ((List!25052 0))(
  ( (Nil!25049) (Cons!25048 (h!26257 (_ BitVec 64)) (t!36287 List!25052)) )
))
(declare-fun arrayNoDuplicates!0 (array!74395 (_ BitVec 32) List!25052) Bool)

(assert (=> b!1146196 (= res!763134 (arrayNoDuplicates!0 lt!511847 #b00000000000000000000000000000000 Nil!25049))))

(declare-fun call!52458 () ListLongMap!16267)

(declare-fun bm!52455 () Bool)

(assert (=> bm!52455 (= call!52458 (getCurrentListMapNoExtraKeys!4624 lt!511847 lt!511846 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146197 () Bool)

(declare-fun call!52463 () ListLongMap!16267)

(assert (=> b!1146197 (= e!651980 (= call!52458 call!52463))))

(declare-fun call!52461 () Bool)

(declare-fun lt!511862 () ListLongMap!16267)

(declare-fun c!113049 () Bool)

(declare-fun call!52464 () ListLongMap!16267)

(declare-fun bm!52456 () Bool)

(declare-fun contains!6675 (ListLongMap!16267 (_ BitVec 64)) Bool)

(assert (=> bm!52456 (= call!52461 (contains!6675 (ite c!113049 lt!511862 call!52464) k0!934))))

(declare-fun b!1146198 () Bool)

(declare-fun res!763138 () Bool)

(assert (=> b!1146198 (=> (not res!763138) (not e!651991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146198 (= res!763138 (validKeyInArray!0 k0!934))))

(declare-fun e!651985 () Bool)

(declare-fun b!1146199 () Bool)

(declare-fun arrayContainsKey!0 (array!74395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146199 (= e!651985 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146200 () Bool)

(declare-fun -!1287 (ListLongMap!16267 (_ BitVec 64)) ListLongMap!16267)

(assert (=> b!1146200 (= e!651980 (= call!52458 (-!1287 call!52463 k0!934)))))

(declare-fun mapNonEmpty!44984 () Bool)

(declare-fun mapRes!44984 () Bool)

(declare-fun tp!85440 () Bool)

(declare-fun e!651983 () Bool)

(assert (=> mapNonEmpty!44984 (= mapRes!44984 (and tp!85440 e!651983))))

(declare-fun mapRest!44984 () (Array (_ BitVec 32) ValueCell!13677))

(declare-fun mapKey!44984 () (_ BitVec 32))

(declare-fun mapValue!44984 () ValueCell!13677)

(assert (=> mapNonEmpty!44984 (= (arr!35849 _values!996) (store mapRest!44984 mapKey!44984 mapValue!44984))))

(declare-fun b!1146201 () Bool)

(assert (=> b!1146201 (= e!651984 e!651990)))

(declare-fun c!113048 () Bool)

(declare-fun lt!511860 () Bool)

(assert (=> b!1146201 (= c!113048 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511860))))

(declare-fun b!1146202 () Bool)

(declare-fun res!763144 () Bool)

(assert (=> b!1146202 (=> (not res!763144) (not e!651991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74395 (_ BitVec 32)) Bool)

(assert (=> b!1146202 (= res!763144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52457 () Bool)

(declare-fun call!52462 () ListLongMap!16267)

(declare-fun c!113047 () Bool)

(declare-fun lt!511857 () ListLongMap!16267)

(declare-fun +!3574 (ListLongMap!16267 tuple2!18298) ListLongMap!16267)

(assert (=> bm!52457 (= call!52462 (+!3574 (ite c!113049 lt!511862 lt!511857) (ite c!113049 (tuple2!18299 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113047 (tuple2!18299 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18299 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1146203 () Bool)

(declare-fun Unit!37637 () Unit!37634)

(assert (=> b!1146203 (= e!651990 Unit!37637)))

(declare-fun call!52459 () Unit!37634)

(declare-fun bm!52458 () Bool)

(declare-fun addStillContains!827 (ListLongMap!16267 (_ BitVec 64) V!43491 (_ BitVec 64)) Unit!37634)

(assert (=> bm!52458 (= call!52459 (addStillContains!827 (ite c!113049 lt!511862 lt!511857) (ite c!113049 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113047 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113049 minValue!944 (ite c!113047 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1146204 () Bool)

(assert (=> b!1146204 (= c!113047 (and (not lt!511860) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651992 () Unit!37634)

(assert (=> b!1146204 (= e!651992 e!651984)))

(declare-fun b!1146205 () Bool)

(declare-fun e!651986 () Bool)

(assert (=> b!1146205 (= e!651986 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511860) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1146206 () Bool)

(assert (=> b!1146206 (= e!651986 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52459 () Bool)

(assert (=> bm!52459 (= call!52460 call!52459)))

(declare-fun bm!52460 () Bool)

(assert (=> bm!52460 (= call!52463 (getCurrentListMapNoExtraKeys!4624 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146207 () Bool)

(assert (=> b!1146207 (= e!651983 tp_is_empty!28773)))

(declare-fun b!1146208 () Bool)

(declare-fun res!763147 () Bool)

(assert (=> b!1146208 (=> (not res!763147) (not e!651991))))

(assert (=> b!1146208 (= res!763147 (and (= (size!36385 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36384 _keys!1208) (size!36385 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146209 () Bool)

(declare-fun res!763137 () Bool)

(assert (=> b!1146209 (=> (not res!763137) (not e!651991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146209 (= res!763137 (validMask!0 mask!1564))))

(declare-fun b!1146210 () Bool)

(declare-fun res!763141 () Bool)

(assert (=> b!1146210 (=> (not res!763141) (not e!651991))))

(assert (=> b!1146210 (= res!763141 (= (select (arr!35848 _keys!1208) i!673) k0!934))))

(declare-fun b!1146211 () Bool)

(declare-fun Unit!37638 () Unit!37634)

(assert (=> b!1146211 (= e!651987 Unit!37638)))

(assert (=> b!1146211 (= lt!511860 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146211 (= c!113049 (and (not lt!511860) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511861 () Unit!37634)

(assert (=> b!1146211 (= lt!511861 e!651992)))

(declare-fun lt!511854 () Unit!37634)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!421 (array!74395 array!74397 (_ BitVec 32) (_ BitVec 32) V!43491 V!43491 (_ BitVec 64) (_ BitVec 32) Int) Unit!37634)

(assert (=> b!1146211 (= lt!511854 (lemmaListMapContainsThenArrayContainsFrom!421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113045 () Bool)

(assert (=> b!1146211 (= c!113045 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763139 () Bool)

(assert (=> b!1146211 (= res!763139 e!651986)))

(assert (=> b!1146211 (=> (not res!763139) (not e!651985))))

(assert (=> b!1146211 e!651985))

(declare-fun lt!511864 () Unit!37634)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74395 (_ BitVec 32) (_ BitVec 32)) Unit!37634)

(assert (=> b!1146211 (= lt!511864 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146211 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25049)))

(declare-fun lt!511850 () Unit!37634)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74395 (_ BitVec 64) (_ BitVec 32) List!25052) Unit!37634)

(assert (=> b!1146211 (= lt!511850 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25049))))

(assert (=> b!1146211 false))

(declare-fun b!1146212 () Bool)

(assert (=> b!1146212 (= e!651981 true)))

(declare-fun e!651988 () Bool)

(assert (=> b!1146212 e!651988))

(declare-fun res!763145 () Bool)

(assert (=> b!1146212 (=> (not res!763145) (not e!651988))))

(declare-fun lt!511849 () V!43491)

(assert (=> b!1146212 (= res!763145 (= (-!1287 (+!3574 lt!511857 (tuple2!18299 (select (arr!35848 _keys!1208) from!1455) lt!511849)) (select (arr!35848 _keys!1208) from!1455)) lt!511857))))

(declare-fun lt!511858 () Unit!37634)

(declare-fun addThenRemoveForNewKeyIsSame!136 (ListLongMap!16267 (_ BitVec 64) V!43491) Unit!37634)

(assert (=> b!1146212 (= lt!511858 (addThenRemoveForNewKeyIsSame!136 lt!511857 (select (arr!35848 _keys!1208) from!1455) lt!511849))))

(declare-fun get!18230 (ValueCell!13677 V!43491) V!43491)

(assert (=> b!1146212 (= lt!511849 (get!18230 (select (arr!35849 _values!996) from!1455) lt!511856))))

(declare-fun lt!511863 () Unit!37634)

(assert (=> b!1146212 (= lt!511863 e!651987)))

(declare-fun c!113050 () Bool)

(assert (=> b!1146212 (= c!113050 (contains!6675 lt!511857 k0!934))))

(assert (=> b!1146212 (= lt!511857 (getCurrentListMapNoExtraKeys!4624 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146213 () Bool)

(declare-fun e!651996 () Bool)

(assert (=> b!1146213 (= e!651996 tp_is_empty!28773)))

(declare-fun b!1146214 () Bool)

(assert (=> b!1146214 (= e!651991 e!651993)))

(declare-fun res!763136 () Bool)

(assert (=> b!1146214 (=> (not res!763136) (not e!651993))))

(assert (=> b!1146214 (= res!763136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511847 mask!1564))))

(assert (=> b!1146214 (= lt!511847 (array!74396 (store (arr!35848 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36384 _keys!1208)))))

(declare-fun b!1146215 () Bool)

(assert (=> b!1146215 (= e!651988 (= (-!1287 lt!511851 k0!934) lt!511857))))

(declare-fun b!1146216 () Bool)

(declare-fun res!763148 () Bool)

(assert (=> b!1146216 (=> (not res!763148) (not e!651991))))

(assert (=> b!1146216 (= res!763148 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25049))))

(declare-fun bm!52461 () Bool)

(assert (=> bm!52461 (= call!52465 call!52461)))

(declare-fun bm!52462 () Bool)

(assert (=> bm!52462 (= call!52464 call!52462)))

(declare-fun mapIsEmpty!44984 () Bool)

(assert (=> mapIsEmpty!44984 mapRes!44984))

(declare-fun b!1146217 () Bool)

(assert (=> b!1146217 (= e!651993 (not e!651994))))

(declare-fun res!763142 () Bool)

(assert (=> b!1146217 (=> res!763142 e!651994)))

(assert (=> b!1146217 (= res!763142 (bvsgt from!1455 i!673))))

(assert (=> b!1146217 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511866 () Unit!37634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74395 (_ BitVec 64) (_ BitVec 32)) Unit!37634)

(assert (=> b!1146217 (= lt!511866 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1146218 () Bool)

(assert (=> b!1146218 (contains!6675 call!52462 k0!934)))

(declare-fun lt!511859 () Unit!37634)

(assert (=> b!1146218 (= lt!511859 call!52459)))

(assert (=> b!1146218 call!52461))

(assert (=> b!1146218 (= lt!511862 (+!3574 lt!511857 (tuple2!18299 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511865 () Unit!37634)

(assert (=> b!1146218 (= lt!511865 (addStillContains!827 lt!511857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1146218 (= e!651992 lt!511859)))

(declare-fun b!1146219 () Bool)

(assert (=> b!1146219 (= e!651982 (and e!651996 mapRes!44984))))

(declare-fun condMapEmpty!44984 () Bool)

(declare-fun mapDefault!44984 () ValueCell!13677)

(assert (=> b!1146219 (= condMapEmpty!44984 (= (arr!35849 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13677)) mapDefault!44984)))))

(assert (= (and start!98638 res!763135) b!1146209))

(assert (= (and b!1146209 res!763137) b!1146208))

(assert (= (and b!1146208 res!763147) b!1146202))

(assert (= (and b!1146202 res!763144) b!1146216))

(assert (= (and b!1146216 res!763148) b!1146195))

(assert (= (and b!1146195 res!763143) b!1146198))

(assert (= (and b!1146198 res!763138) b!1146210))

(assert (= (and b!1146210 res!763141) b!1146214))

(assert (= (and b!1146214 res!763136) b!1146196))

(assert (= (and b!1146196 res!763134) b!1146217))

(assert (= (and b!1146217 (not res!763142)) b!1146192))

(assert (= (and b!1146192 (not res!763146)) b!1146190))

(assert (= (and b!1146190 c!113046) b!1146200))

(assert (= (and b!1146190 (not c!113046)) b!1146197))

(assert (= (or b!1146200 b!1146197) bm!52455))

(assert (= (or b!1146200 b!1146197) bm!52460))

(assert (= (and b!1146190 (not res!763140)) b!1146212))

(assert (= (and b!1146212 c!113050) b!1146211))

(assert (= (and b!1146212 (not c!113050)) b!1146193))

(assert (= (and b!1146211 c!113049) b!1146218))

(assert (= (and b!1146211 (not c!113049)) b!1146204))

(assert (= (and b!1146204 c!113047) b!1146194))

(assert (= (and b!1146204 (not c!113047)) b!1146201))

(assert (= (and b!1146201 c!113048) b!1146191))

(assert (= (and b!1146201 (not c!113048)) b!1146203))

(assert (= (or b!1146194 b!1146191) bm!52459))

(assert (= (or b!1146194 b!1146191) bm!52462))

(assert (= (or b!1146194 b!1146191) bm!52461))

(assert (= (or b!1146218 bm!52461) bm!52456))

(assert (= (or b!1146218 bm!52459) bm!52458))

(assert (= (or b!1146218 bm!52462) bm!52457))

(assert (= (and b!1146211 c!113045) b!1146206))

(assert (= (and b!1146211 (not c!113045)) b!1146205))

(assert (= (and b!1146211 res!763139) b!1146199))

(assert (= (and b!1146212 res!763145) b!1146215))

(assert (= (and b!1146219 condMapEmpty!44984) mapIsEmpty!44984))

(assert (= (and b!1146219 (not condMapEmpty!44984)) mapNonEmpty!44984))

(get-info :version)

(assert (= (and mapNonEmpty!44984 ((_ is ValueCellFull!13677) mapValue!44984)) b!1146207))

(assert (= (and b!1146219 ((_ is ValueCellFull!13677) mapDefault!44984)) b!1146213))

(assert (= start!98638 b!1146219))

(declare-fun b_lambda!19349 () Bool)

(assert (=> (not b_lambda!19349) (not b!1146192)))

(declare-fun t!36285 () Bool)

(declare-fun tb!9055 () Bool)

(assert (=> (and start!98638 (= defaultEntry!1004 defaultEntry!1004) t!36285) tb!9055))

(declare-fun result!18675 () Bool)

(assert (=> tb!9055 (= result!18675 tp_is_empty!28773)))

(assert (=> b!1146192 t!36285))

(declare-fun b_and!39337 () Bool)

(assert (= b_and!39335 (and (=> t!36285 result!18675) b_and!39337)))

(declare-fun m!1056979 () Bool)

(assert (=> bm!52455 m!1056979))

(declare-fun m!1056981 () Bool)

(assert (=> b!1146218 m!1056981))

(declare-fun m!1056983 () Bool)

(assert (=> b!1146218 m!1056983))

(declare-fun m!1056985 () Bool)

(assert (=> b!1146218 m!1056985))

(declare-fun m!1056987 () Bool)

(assert (=> b!1146206 m!1056987))

(declare-fun m!1056989 () Bool)

(assert (=> b!1146216 m!1056989))

(declare-fun m!1056991 () Bool)

(assert (=> b!1146200 m!1056991))

(declare-fun m!1056993 () Bool)

(assert (=> start!98638 m!1056993))

(declare-fun m!1056995 () Bool)

(assert (=> start!98638 m!1056995))

(declare-fun m!1056997 () Bool)

(assert (=> b!1146217 m!1056997))

(declare-fun m!1056999 () Bool)

(assert (=> b!1146217 m!1056999))

(assert (=> b!1146199 m!1056987))

(declare-fun m!1057001 () Bool)

(assert (=> b!1146210 m!1057001))

(declare-fun m!1057003 () Bool)

(assert (=> bm!52460 m!1057003))

(declare-fun m!1057005 () Bool)

(assert (=> b!1146202 m!1057005))

(declare-fun m!1057007 () Bool)

(assert (=> bm!52457 m!1057007))

(declare-fun m!1057009 () Bool)

(assert (=> bm!52456 m!1057009))

(declare-fun m!1057011 () Bool)

(assert (=> bm!52458 m!1057011))

(assert (=> b!1146212 m!1057003))

(declare-fun m!1057013 () Bool)

(assert (=> b!1146212 m!1057013))

(declare-fun m!1057015 () Bool)

(assert (=> b!1146212 m!1057015))

(declare-fun m!1057017 () Bool)

(assert (=> b!1146212 m!1057017))

(declare-fun m!1057019 () Bool)

(assert (=> b!1146212 m!1057019))

(declare-fun m!1057021 () Bool)

(assert (=> b!1146212 m!1057021))

(assert (=> b!1146212 m!1057013))

(assert (=> b!1146212 m!1057019))

(declare-fun m!1057023 () Bool)

(assert (=> b!1146212 m!1057023))

(assert (=> b!1146212 m!1057015))

(declare-fun m!1057025 () Bool)

(assert (=> b!1146212 m!1057025))

(assert (=> b!1146212 m!1057015))

(declare-fun m!1057027 () Bool)

(assert (=> b!1146198 m!1057027))

(declare-fun m!1057029 () Bool)

(assert (=> b!1146214 m!1057029))

(declare-fun m!1057031 () Bool)

(assert (=> b!1146214 m!1057031))

(declare-fun m!1057033 () Bool)

(assert (=> b!1146215 m!1057033))

(declare-fun m!1057035 () Bool)

(assert (=> b!1146209 m!1057035))

(declare-fun m!1057037 () Bool)

(assert (=> b!1146192 m!1057037))

(declare-fun m!1057039 () Bool)

(assert (=> b!1146192 m!1057039))

(declare-fun m!1057041 () Bool)

(assert (=> b!1146192 m!1057041))

(declare-fun m!1057043 () Bool)

(assert (=> b!1146192 m!1057043))

(declare-fun m!1057045 () Bool)

(assert (=> b!1146211 m!1057045))

(declare-fun m!1057047 () Bool)

(assert (=> b!1146211 m!1057047))

(declare-fun m!1057049 () Bool)

(assert (=> b!1146211 m!1057049))

(declare-fun m!1057051 () Bool)

(assert (=> b!1146211 m!1057051))

(assert (=> b!1146190 m!1057015))

(declare-fun m!1057053 () Bool)

(assert (=> b!1146190 m!1057053))

(declare-fun m!1057055 () Bool)

(assert (=> b!1146196 m!1057055))

(declare-fun m!1057057 () Bool)

(assert (=> mapNonEmpty!44984 m!1057057))

(check-sat (not bm!52455) (not b!1146209) (not b_lambda!19349) (not b!1146199) (not mapNonEmpty!44984) (not b!1146198) b_and!39337 (not b!1146218) (not b!1146211) (not b!1146200) (not b!1146212) (not b!1146196) (not bm!52460) (not bm!52457) (not start!98638) (not b!1146192) (not b!1146215) (not b!1146217) (not bm!52456) (not b!1146202) (not b_next!24243) (not b!1146216) (not b!1146206) (not b!1146190) (not bm!52458) (not b!1146214) tp_is_empty!28773)
(check-sat b_and!39337 (not b_next!24243))
