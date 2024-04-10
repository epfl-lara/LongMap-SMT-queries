; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98482 () Bool)

(assert start!98482)

(declare-fun b_free!24087 () Bool)

(declare-fun b_next!24087 () Bool)

(assert (=> start!98482 (= b_free!24087 (not b_next!24087))))

(declare-fun tp!84972 () Bool)

(declare-fun b_and!39023 () Bool)

(assert (=> start!98482 (= tp!84972 b_and!39023)))

(declare-fun bm!50583 () Bool)

(declare-datatypes ((V!43283 0))(
  ( (V!43284 (val!14365 Int)) )
))
(declare-datatypes ((tuple2!18156 0))(
  ( (tuple2!18157 (_1!9089 (_ BitVec 64)) (_2!9089 V!43283)) )
))
(declare-datatypes ((List!24912 0))(
  ( (Nil!24909) (Cons!24908 (h!26117 tuple2!18156) (t!35991 List!24912)) )
))
(declare-datatypes ((ListLongMap!16125 0))(
  ( (ListLongMap!16126 (toList!8078 List!24912)) )
))
(declare-fun call!50590 () ListLongMap!16125)

(declare-fun call!50586 () ListLongMap!16125)

(assert (=> bm!50583 (= call!50590 call!50586)))

(declare-fun b!1139180 () Bool)

(declare-datatypes ((Unit!37332 0))(
  ( (Unit!37333) )
))
(declare-fun e!648177 () Unit!37332)

(declare-fun Unit!37334 () Unit!37332)

(assert (=> b!1139180 (= e!648177 Unit!37334)))

(declare-fun b!1139181 () Bool)

(declare-fun res!759800 () Bool)

(declare-fun e!648182 () Bool)

(assert (=> b!1139181 (=> (not res!759800) (not e!648182))))

(declare-datatypes ((array!74093 0))(
  ( (array!74094 (arr!35697 (Array (_ BitVec 32) (_ BitVec 64))) (size!36233 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74093)

(declare-datatypes ((List!24913 0))(
  ( (Nil!24910) (Cons!24909 (h!26118 (_ BitVec 64)) (t!35992 List!24913)) )
))
(declare-fun arrayNoDuplicates!0 (array!74093 (_ BitVec 32) List!24913) Bool)

(assert (=> b!1139181 (= res!759800 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24910))))

(declare-fun b!1139182 () Bool)

(declare-fun res!759796 () Bool)

(assert (=> b!1139182 (=> (not res!759796) (not e!648182))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13599 0))(
  ( (ValueCellFull!13599 (v!17002 V!43283)) (EmptyCell!13599) )
))
(declare-datatypes ((array!74095 0))(
  ( (array!74096 (arr!35698 (Array (_ BitVec 32) ValueCell!13599)) (size!36234 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74095)

(assert (=> b!1139182 (= res!759796 (and (= (size!36234 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36233 _keys!1208) (size!36234 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139183 () Bool)

(declare-fun e!648180 () Bool)

(declare-fun call!50591 () ListLongMap!16125)

(declare-fun call!50593 () ListLongMap!16125)

(assert (=> b!1139183 (= e!648180 (= call!50591 call!50593))))

(declare-fun b!1139184 () Bool)

(declare-fun e!648173 () Unit!37332)

(declare-fun Unit!37335 () Unit!37332)

(assert (=> b!1139184 (= e!648173 Unit!37335)))

(declare-fun mapNonEmpty!44750 () Bool)

(declare-fun mapRes!44750 () Bool)

(declare-fun tp!84971 () Bool)

(declare-fun e!648169 () Bool)

(assert (=> mapNonEmpty!44750 (= mapRes!44750 (and tp!84971 e!648169))))

(declare-fun mapKey!44750 () (_ BitVec 32))

(declare-fun mapValue!44750 () ValueCell!13599)

(declare-fun mapRest!44750 () (Array (_ BitVec 32) ValueCell!13599))

(assert (=> mapNonEmpty!44750 (= (arr!35698 _values!996) (store mapRest!44750 mapKey!44750 mapValue!44750))))

(declare-fun b!1139185 () Bool)

(declare-fun res!759797 () Bool)

(assert (=> b!1139185 (=> (not res!759797) (not e!648182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139185 (= res!759797 (validMask!0 mask!1564))))

(declare-fun e!648170 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1139186 () Bool)

(declare-fun arrayContainsKey!0 (array!74093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139186 (= e!648170 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun c!111642 () Bool)

(declare-fun call!50589 () Unit!37332)

(declare-fun lt!506944 () ListLongMap!16125)

(declare-fun minValue!944 () V!43283)

(declare-fun c!111645 () Bool)

(declare-fun zeroValue!944 () V!43283)

(declare-fun lt!506953 () ListLongMap!16125)

(declare-fun bm!50584 () Bool)

(declare-fun addStillContains!769 (ListLongMap!16125 (_ BitVec 64) V!43283 (_ BitVec 64)) Unit!37332)

(assert (=> bm!50584 (= call!50589 (addStillContains!769 (ite c!111645 lt!506953 lt!506944) (ite c!111645 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111642 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111645 minValue!944 (ite c!111642 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1139187 () Bool)

(declare-fun call!50592 () Bool)

(assert (=> b!1139187 call!50592))

(declare-fun lt!506957 () Unit!37332)

(declare-fun call!50588 () Unit!37332)

(assert (=> b!1139187 (= lt!506957 call!50588)))

(assert (=> b!1139187 (= e!648173 lt!506957)))

(declare-fun b!1139188 () Bool)

(declare-fun e!648183 () Bool)

(declare-fun e!648171 () Bool)

(assert (=> b!1139188 (= e!648183 (and e!648171 mapRes!44750))))

(declare-fun condMapEmpty!44750 () Bool)

(declare-fun mapDefault!44750 () ValueCell!13599)

(assert (=> b!1139188 (= condMapEmpty!44750 (= (arr!35698 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13599)) mapDefault!44750)))))

(declare-fun b!1139189 () Bool)

(declare-fun e!648176 () Bool)

(declare-fun e!648175 () Bool)

(assert (=> b!1139189 (= e!648176 e!648175)))

(declare-fun res!759794 () Bool)

(assert (=> b!1139189 (=> res!759794 e!648175)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139189 (= res!759794 (not (= from!1455 i!673)))))

(declare-fun lt!506940 () ListLongMap!16125)

(declare-fun lt!506941 () array!74093)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!506948 () array!74095)

(declare-fun getCurrentListMapNoExtraKeys!4561 (array!74093 array!74095 (_ BitVec 32) (_ BitVec 32) V!43283 V!43283 (_ BitVec 32) Int) ListLongMap!16125)

(assert (=> b!1139189 (= lt!506940 (getCurrentListMapNoExtraKeys!4561 lt!506941 lt!506948 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2610 (Int (_ BitVec 64)) V!43283)

(assert (=> b!1139189 (= lt!506948 (array!74096 (store (arr!35698 _values!996) i!673 (ValueCellFull!13599 (dynLambda!2610 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36234 _values!996)))))

(declare-fun lt!506954 () ListLongMap!16125)

(assert (=> b!1139189 (= lt!506954 (getCurrentListMapNoExtraKeys!4561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139190 () Bool)

(declare-fun lt!506956 () Bool)

(assert (=> b!1139190 (= e!648170 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506956) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1139191 () Bool)

(declare-fun contains!6613 (ListLongMap!16125 (_ BitVec 64)) Bool)

(declare-fun +!3510 (ListLongMap!16125 tuple2!18156) ListLongMap!16125)

(assert (=> b!1139191 (contains!6613 (+!3510 lt!506953 (tuple2!18157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!506949 () Unit!37332)

(assert (=> b!1139191 (= lt!506949 call!50589)))

(declare-fun call!50587 () Bool)

(assert (=> b!1139191 call!50587))

(assert (=> b!1139191 (= lt!506953 call!50586)))

(declare-fun lt!506946 () Unit!37332)

(assert (=> b!1139191 (= lt!506946 (addStillContains!769 lt!506944 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!648172 () Unit!37332)

(assert (=> b!1139191 (= e!648172 lt!506949)))

(declare-fun bm!50585 () Bool)

(assert (=> bm!50585 (= call!50588 call!50589)))

(declare-fun bm!50586 () Bool)

(assert (=> bm!50586 (= call!50593 (getCurrentListMapNoExtraKeys!4561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139192 () Bool)

(declare-fun e!648178 () Bool)

(assert (=> b!1139192 (= e!648178 (not e!648176))))

(declare-fun res!759803 () Bool)

(assert (=> b!1139192 (=> res!759803 e!648176)))

(assert (=> b!1139192 (= res!759803 (bvsgt from!1455 i!673))))

(assert (=> b!1139192 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506951 () Unit!37332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74093 (_ BitVec 64) (_ BitVec 32)) Unit!37332)

(assert (=> b!1139192 (= lt!506951 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!50587 () Bool)

(assert (=> bm!50587 (= call!50586 (+!3510 lt!506944 (ite (or c!111645 c!111642) (tuple2!18157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1139193 () Bool)

(declare-fun res!759802 () Bool)

(assert (=> b!1139193 (=> (not res!759802) (not e!648182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74093 (_ BitVec 32)) Bool)

(assert (=> b!1139193 (= res!759802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50588 () Bool)

(assert (=> bm!50588 (= call!50592 call!50587)))

(declare-fun bm!50589 () Bool)

(assert (=> bm!50589 (= call!50591 (getCurrentListMapNoExtraKeys!4561 lt!506941 lt!506948 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139194 () Bool)

(declare-fun res!759795 () Bool)

(assert (=> b!1139194 (=> (not res!759795) (not e!648182))))

(assert (=> b!1139194 (= res!759795 (= (select (arr!35697 _keys!1208) i!673) k0!934))))

(declare-fun b!1139195 () Bool)

(declare-fun e!648168 () Bool)

(assert (=> b!1139195 (= e!648175 e!648168)))

(declare-fun res!759790 () Bool)

(assert (=> b!1139195 (=> res!759790 e!648168)))

(assert (=> b!1139195 (= res!759790 (not (= (select (arr!35697 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1139195 e!648180))

(declare-fun c!111644 () Bool)

(assert (=> b!1139195 (= c!111644 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506950 () Unit!37332)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!477 (array!74093 array!74095 (_ BitVec 32) (_ BitVec 32) V!43283 V!43283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37332)

(assert (=> b!1139195 (= lt!506950 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!477 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139196 () Bool)

(declare-fun tp_is_empty!28617 () Bool)

(assert (=> b!1139196 (= e!648171 tp_is_empty!28617)))

(declare-fun b!1139197 () Bool)

(declare-fun Unit!37336 () Unit!37332)

(assert (=> b!1139197 (= e!648177 Unit!37336)))

(assert (=> b!1139197 (= lt!506956 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139197 (= c!111645 (and (not lt!506956) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506958 () Unit!37332)

(assert (=> b!1139197 (= lt!506958 e!648172)))

(declare-fun lt!506947 () Unit!37332)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!370 (array!74093 array!74095 (_ BitVec 32) (_ BitVec 32) V!43283 V!43283 (_ BitVec 64) (_ BitVec 32) Int) Unit!37332)

(assert (=> b!1139197 (= lt!506947 (lemmaListMapContainsThenArrayContainsFrom!370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111643 () Bool)

(assert (=> b!1139197 (= c!111643 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759798 () Bool)

(assert (=> b!1139197 (= res!759798 e!648170)))

(declare-fun e!648179 () Bool)

(assert (=> b!1139197 (=> (not res!759798) (not e!648179))))

(assert (=> b!1139197 e!648179))

(declare-fun lt!506945 () Unit!37332)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74093 (_ BitVec 32) (_ BitVec 32)) Unit!37332)

(assert (=> b!1139197 (= lt!506945 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139197 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24910)))

(declare-fun lt!506952 () Unit!37332)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74093 (_ BitVec 64) (_ BitVec 32) List!24913) Unit!37332)

(assert (=> b!1139197 (= lt!506952 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24910))))

(assert (=> b!1139197 false))

(declare-fun b!1139198 () Bool)

(assert (=> b!1139198 (= e!648182 e!648178)))

(declare-fun res!759799 () Bool)

(assert (=> b!1139198 (=> (not res!759799) (not e!648178))))

(assert (=> b!1139198 (= res!759799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506941 mask!1564))))

(assert (=> b!1139198 (= lt!506941 (array!74094 (store (arr!35697 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36233 _keys!1208)))))

(declare-fun mapIsEmpty!44750 () Bool)

(assert (=> mapIsEmpty!44750 mapRes!44750))

(declare-fun b!1139199 () Bool)

(declare-fun res!759801 () Bool)

(assert (=> b!1139199 (=> (not res!759801) (not e!648182))))

(assert (=> b!1139199 (= res!759801 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36233 _keys!1208))))))

(declare-fun b!1139200 () Bool)

(assert (=> b!1139200 (= c!111642 (and (not lt!506956) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648181 () Unit!37332)

(assert (=> b!1139200 (= e!648172 e!648181)))

(declare-fun b!1139201 () Bool)

(assert (=> b!1139201 (= e!648181 e!648173)))

(declare-fun c!111646 () Bool)

(assert (=> b!1139201 (= c!111646 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506956))))

(declare-fun b!1139202 () Bool)

(declare-fun res!759793 () Bool)

(assert (=> b!1139202 (=> (not res!759793) (not e!648178))))

(assert (=> b!1139202 (= res!759793 (arrayNoDuplicates!0 lt!506941 #b00000000000000000000000000000000 Nil!24910))))

(declare-fun b!1139203 () Bool)

(assert (=> b!1139203 (= e!648179 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139204 () Bool)

(declare-fun -!1229 (ListLongMap!16125 (_ BitVec 64)) ListLongMap!16125)

(assert (=> b!1139204 (= e!648180 (= call!50591 (-!1229 call!50593 k0!934)))))

(declare-fun b!1139205 () Bool)

(assert (=> b!1139205 (= e!648168 true)))

(declare-fun lt!506955 () Bool)

(assert (=> b!1139205 (= lt!506955 (contains!6613 lt!506944 (select (arr!35697 _keys!1208) from!1455)))))

(declare-fun lt!506943 () Unit!37332)

(assert (=> b!1139205 (= lt!506943 e!648177)))

(declare-fun c!111641 () Bool)

(assert (=> b!1139205 (= c!111641 (contains!6613 lt!506944 k0!934))))

(assert (=> b!1139205 (= lt!506944 (getCurrentListMapNoExtraKeys!4561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139206 () Bool)

(declare-fun lt!506942 () Unit!37332)

(assert (=> b!1139206 (= e!648181 lt!506942)))

(assert (=> b!1139206 (= lt!506942 call!50588)))

(assert (=> b!1139206 call!50592))

(declare-fun b!1139207 () Bool)

(assert (=> b!1139207 (= e!648169 tp_is_empty!28617)))

(declare-fun bm!50590 () Bool)

(assert (=> bm!50590 (= call!50587 (contains!6613 (ite c!111645 lt!506953 call!50590) k0!934))))

(declare-fun b!1139208 () Bool)

(declare-fun res!759792 () Bool)

(assert (=> b!1139208 (=> (not res!759792) (not e!648182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139208 (= res!759792 (validKeyInArray!0 k0!934))))

(declare-fun res!759791 () Bool)

(assert (=> start!98482 (=> (not res!759791) (not e!648182))))

(assert (=> start!98482 (= res!759791 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36233 _keys!1208))))))

(assert (=> start!98482 e!648182))

(assert (=> start!98482 tp_is_empty!28617))

(declare-fun array_inv!27362 (array!74093) Bool)

(assert (=> start!98482 (array_inv!27362 _keys!1208)))

(assert (=> start!98482 true))

(assert (=> start!98482 tp!84972))

(declare-fun array_inv!27363 (array!74095) Bool)

(assert (=> start!98482 (and (array_inv!27363 _values!996) e!648183)))

(assert (= (and start!98482 res!759791) b!1139185))

(assert (= (and b!1139185 res!759797) b!1139182))

(assert (= (and b!1139182 res!759796) b!1139193))

(assert (= (and b!1139193 res!759802) b!1139181))

(assert (= (and b!1139181 res!759800) b!1139199))

(assert (= (and b!1139199 res!759801) b!1139208))

(assert (= (and b!1139208 res!759792) b!1139194))

(assert (= (and b!1139194 res!759795) b!1139198))

(assert (= (and b!1139198 res!759799) b!1139202))

(assert (= (and b!1139202 res!759793) b!1139192))

(assert (= (and b!1139192 (not res!759803)) b!1139189))

(assert (= (and b!1139189 (not res!759794)) b!1139195))

(assert (= (and b!1139195 c!111644) b!1139204))

(assert (= (and b!1139195 (not c!111644)) b!1139183))

(assert (= (or b!1139204 b!1139183) bm!50589))

(assert (= (or b!1139204 b!1139183) bm!50586))

(assert (= (and b!1139195 (not res!759790)) b!1139205))

(assert (= (and b!1139205 c!111641) b!1139197))

(assert (= (and b!1139205 (not c!111641)) b!1139180))

(assert (= (and b!1139197 c!111645) b!1139191))

(assert (= (and b!1139197 (not c!111645)) b!1139200))

(assert (= (and b!1139200 c!111642) b!1139206))

(assert (= (and b!1139200 (not c!111642)) b!1139201))

(assert (= (and b!1139201 c!111646) b!1139187))

(assert (= (and b!1139201 (not c!111646)) b!1139184))

(assert (= (or b!1139206 b!1139187) bm!50585))

(assert (= (or b!1139206 b!1139187) bm!50583))

(assert (= (or b!1139206 b!1139187) bm!50588))

(assert (= (or b!1139191 bm!50588) bm!50590))

(assert (= (or b!1139191 bm!50585) bm!50584))

(assert (= (or b!1139191 bm!50583) bm!50587))

(assert (= (and b!1139197 c!111643) b!1139186))

(assert (= (and b!1139197 (not c!111643)) b!1139190))

(assert (= (and b!1139197 res!759798) b!1139203))

(assert (= (and b!1139188 condMapEmpty!44750) mapIsEmpty!44750))

(assert (= (and b!1139188 (not condMapEmpty!44750)) mapNonEmpty!44750))

(get-info :version)

(assert (= (and mapNonEmpty!44750 ((_ is ValueCellFull!13599) mapValue!44750)) b!1139207))

(assert (= (and b!1139188 ((_ is ValueCellFull!13599) mapDefault!44750)) b!1139196))

(assert (= start!98482 b!1139188))

(declare-fun b_lambda!19193 () Bool)

(assert (=> (not b_lambda!19193) (not b!1139189)))

(declare-fun t!35990 () Bool)

(declare-fun tb!8899 () Bool)

(assert (=> (and start!98482 (= defaultEntry!1004 defaultEntry!1004) t!35990) tb!8899))

(declare-fun result!18363 () Bool)

(assert (=> tb!8899 (= result!18363 tp_is_empty!28617)))

(assert (=> b!1139189 t!35990))

(declare-fun b_and!39025 () Bool)

(assert (= b_and!39023 (and (=> t!35990 result!18363) b_and!39025)))

(declare-fun m!1050859 () Bool)

(assert (=> b!1139181 m!1050859))

(declare-fun m!1050861 () Bool)

(assert (=> b!1139194 m!1050861))

(declare-fun m!1050863 () Bool)

(assert (=> bm!50587 m!1050863))

(declare-fun m!1050865 () Bool)

(assert (=> b!1139205 m!1050865))

(assert (=> b!1139205 m!1050865))

(declare-fun m!1050867 () Bool)

(assert (=> b!1139205 m!1050867))

(declare-fun m!1050869 () Bool)

(assert (=> b!1139205 m!1050869))

(declare-fun m!1050871 () Bool)

(assert (=> b!1139205 m!1050871))

(assert (=> b!1139195 m!1050865))

(declare-fun m!1050873 () Bool)

(assert (=> b!1139195 m!1050873))

(declare-fun m!1050875 () Bool)

(assert (=> b!1139189 m!1050875))

(declare-fun m!1050877 () Bool)

(assert (=> b!1139189 m!1050877))

(declare-fun m!1050879 () Bool)

(assert (=> b!1139189 m!1050879))

(declare-fun m!1050881 () Bool)

(assert (=> b!1139189 m!1050881))

(declare-fun m!1050883 () Bool)

(assert (=> b!1139202 m!1050883))

(declare-fun m!1050885 () Bool)

(assert (=> start!98482 m!1050885))

(declare-fun m!1050887 () Bool)

(assert (=> start!98482 m!1050887))

(declare-fun m!1050889 () Bool)

(assert (=> b!1139193 m!1050889))

(declare-fun m!1050891 () Bool)

(assert (=> b!1139186 m!1050891))

(assert (=> bm!50586 m!1050871))

(declare-fun m!1050893 () Bool)

(assert (=> bm!50584 m!1050893))

(declare-fun m!1050895 () Bool)

(assert (=> bm!50589 m!1050895))

(declare-fun m!1050897 () Bool)

(assert (=> b!1139191 m!1050897))

(assert (=> b!1139191 m!1050897))

(declare-fun m!1050899 () Bool)

(assert (=> b!1139191 m!1050899))

(declare-fun m!1050901 () Bool)

(assert (=> b!1139191 m!1050901))

(declare-fun m!1050903 () Bool)

(assert (=> mapNonEmpty!44750 m!1050903))

(declare-fun m!1050905 () Bool)

(assert (=> b!1139185 m!1050905))

(declare-fun m!1050907 () Bool)

(assert (=> b!1139197 m!1050907))

(declare-fun m!1050909 () Bool)

(assert (=> b!1139197 m!1050909))

(declare-fun m!1050911 () Bool)

(assert (=> b!1139197 m!1050911))

(declare-fun m!1050913 () Bool)

(assert (=> b!1139197 m!1050913))

(assert (=> b!1139203 m!1050891))

(declare-fun m!1050915 () Bool)

(assert (=> b!1139198 m!1050915))

(declare-fun m!1050917 () Bool)

(assert (=> b!1139198 m!1050917))

(declare-fun m!1050919 () Bool)

(assert (=> bm!50590 m!1050919))

(declare-fun m!1050921 () Bool)

(assert (=> b!1139208 m!1050921))

(declare-fun m!1050923 () Bool)

(assert (=> b!1139192 m!1050923))

(declare-fun m!1050925 () Bool)

(assert (=> b!1139192 m!1050925))

(declare-fun m!1050927 () Bool)

(assert (=> b!1139204 m!1050927))

(check-sat b_and!39025 (not b!1139205) (not b!1139185) (not b!1139198) (not b!1139186) (not bm!50590) (not bm!50589) (not b!1139193) (not b!1139204) (not b!1139192) (not b_next!24087) (not b!1139195) tp_is_empty!28617 (not b!1139202) (not b!1139181) (not mapNonEmpty!44750) (not bm!50586) (not b!1139191) (not b_lambda!19193) (not b!1139189) (not start!98482) (not b!1139208) (not bm!50584) (not b!1139197) (not bm!50587) (not b!1139203))
(check-sat b_and!39025 (not b_next!24087))
