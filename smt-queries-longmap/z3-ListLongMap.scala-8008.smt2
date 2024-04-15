; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98882 () Bool)

(assert start!98882)

(declare-fun b_free!24493 () Bool)

(declare-fun b_next!24493 () Bool)

(assert (=> start!98882 (= b_free!24493 (not b_next!24493))))

(declare-fun tp!86190 () Bool)

(declare-fun b_and!39813 () Bool)

(assert (=> start!98882 (= tp!86190 b_and!39813)))

(declare-fun b!1157566 () Bool)

(declare-fun e!658289 () Bool)

(declare-fun tp_is_empty!29023 () Bool)

(assert (=> b!1157566 (= e!658289 tp_is_empty!29023)))

(declare-fun b!1157567 () Bool)

(declare-fun res!768705 () Bool)

(declare-fun e!658290 () Bool)

(assert (=> b!1157567 (=> (not res!768705) (not e!658290))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43825 0))(
  ( (V!43826 (val!14568 Int)) )
))
(declare-datatypes ((ValueCell!13802 0))(
  ( (ValueCellFull!13802 (v!17204 V!43825)) (EmptyCell!13802) )
))
(declare-datatypes ((array!74808 0))(
  ( (array!74809 (arr!36055 (Array (_ BitVec 32) ValueCell!13802)) (size!36593 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74808)

(declare-datatypes ((array!74810 0))(
  ( (array!74811 (arr!36056 (Array (_ BitVec 32) (_ BitVec 64))) (size!36594 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74810)

(assert (=> b!1157567 (= res!768705 (and (= (size!36593 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36594 _keys!1208) (size!36593 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157568 () Bool)

(declare-fun res!768695 () Bool)

(assert (=> b!1157568 (=> (not res!768695) (not e!658290))))

(declare-datatypes ((List!25346 0))(
  ( (Nil!25343) (Cons!25342 (h!26551 (_ BitVec 64)) (t!36822 List!25346)) )
))
(declare-fun arrayNoDuplicates!0 (array!74810 (_ BitVec 32) List!25346) Bool)

(assert (=> b!1157568 (= res!768695 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25343))))

(declare-fun zeroValue!944 () V!43825)

(declare-datatypes ((tuple2!18620 0))(
  ( (tuple2!18621 (_1!9321 (_ BitVec 64)) (_2!9321 V!43825)) )
))
(declare-datatypes ((List!25347 0))(
  ( (Nil!25344) (Cons!25343 (h!26552 tuple2!18620) (t!36823 List!25347)) )
))
(declare-datatypes ((ListLongMap!16589 0))(
  ( (ListLongMap!16590 (toList!8310 List!25347)) )
))
(declare-fun call!55441 () ListLongMap!16589)

(declare-fun bm!55432 () Bool)

(declare-fun c!115269 () Bool)

(declare-fun c!115273 () Bool)

(declare-fun lt!519813 () ListLongMap!16589)

(declare-fun minValue!944 () V!43825)

(declare-fun +!3719 (ListLongMap!16589 tuple2!18620) ListLongMap!16589)

(assert (=> bm!55432 (= call!55441 (+!3719 lt!519813 (ite (or c!115269 c!115273) (tuple2!18621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!55433 () Bool)

(declare-datatypes ((Unit!37986 0))(
  ( (Unit!37987) )
))
(declare-fun call!55435 () Unit!37986)

(declare-fun lt!519829 () ListLongMap!16589)

(declare-fun addStillContains!929 (ListLongMap!16589 (_ BitVec 64) V!43825 (_ BitVec 64)) Unit!37986)

(assert (=> bm!55433 (= call!55435 (addStillContains!929 (ite c!115269 lt!519829 lt!519813) (ite c!115269 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115273 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115269 minValue!944 (ite c!115273 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1157569 () Bool)

(declare-fun e!658284 () Bool)

(assert (=> b!1157569 (= e!658290 e!658284)))

(declare-fun res!768697 () Bool)

(assert (=> b!1157569 (=> (not res!768697) (not e!658284))))

(declare-fun lt!519820 () array!74810)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74810 (_ BitVec 32)) Bool)

(assert (=> b!1157569 (= res!768697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519820 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157569 (= lt!519820 (array!74811 (store (arr!36056 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36594 _keys!1208)))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!658287 () Bool)

(declare-fun b!1157570 () Bool)

(declare-fun arrayContainsKey!0 (array!74810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157570 (= e!658287 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157571 () Bool)

(declare-fun e!658288 () Bool)

(declare-fun mapRes!45359 () Bool)

(assert (=> b!1157571 (= e!658288 (and e!658289 mapRes!45359))))

(declare-fun condMapEmpty!45359 () Bool)

(declare-fun mapDefault!45359 () ValueCell!13802)

(assert (=> b!1157571 (= condMapEmpty!45359 (= (arr!36055 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13802)) mapDefault!45359)))))

(declare-fun res!768702 () Bool)

(assert (=> start!98882 (=> (not res!768702) (not e!658290))))

(assert (=> start!98882 (= res!768702 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36594 _keys!1208))))))

(assert (=> start!98882 e!658290))

(assert (=> start!98882 tp_is_empty!29023))

(declare-fun array_inv!27706 (array!74810) Bool)

(assert (=> start!98882 (array_inv!27706 _keys!1208)))

(assert (=> start!98882 true))

(assert (=> start!98882 tp!86190))

(declare-fun array_inv!27707 (array!74808) Bool)

(assert (=> start!98882 (and (array_inv!27707 _values!996) e!658288)))

(declare-fun mapIsEmpty!45359 () Bool)

(assert (=> mapIsEmpty!45359 mapRes!45359))

(declare-fun bm!55434 () Bool)

(declare-fun call!55440 () Bool)

(declare-fun call!55436 () ListLongMap!16589)

(declare-fun contains!6762 (ListLongMap!16589 (_ BitVec 64)) Bool)

(assert (=> bm!55434 (= call!55440 (contains!6762 (ite c!115269 lt!519829 call!55436) k0!934))))

(declare-fun b!1157572 () Bool)

(declare-fun e!658285 () Unit!37986)

(declare-fun e!658292 () Unit!37986)

(assert (=> b!1157572 (= e!658285 e!658292)))

(declare-fun c!115272 () Bool)

(declare-fun lt!519819 () Bool)

(assert (=> b!1157572 (= c!115272 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519819))))

(declare-fun b!1157573 () Bool)

(declare-fun e!658279 () Bool)

(declare-fun e!658277 () Bool)

(assert (=> b!1157573 (= e!658279 e!658277)))

(declare-fun res!768700 () Bool)

(assert (=> b!1157573 (=> res!768700 e!658277)))

(assert (=> b!1157573 (= res!768700 (not (= (select (arr!36056 _keys!1208) from!1455) k0!934)))))

(declare-fun e!658286 () Bool)

(assert (=> b!1157573 e!658286))

(declare-fun c!115270 () Bool)

(assert (=> b!1157573 (= c!115270 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!519825 () Unit!37986)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!638 (array!74810 array!74808 (_ BitVec 32) (_ BitVec 32) V!43825 V!43825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37986)

(assert (=> b!1157573 (= lt!519825 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!638 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55435 () Bool)

(assert (=> bm!55435 (= call!55436 call!55441)))

(declare-fun b!1157574 () Bool)

(declare-fun e!658283 () Bool)

(assert (=> b!1157574 (= e!658284 (not e!658283))))

(declare-fun res!768699 () Bool)

(assert (=> b!1157574 (=> res!768699 e!658283)))

(assert (=> b!1157574 (= res!768699 (bvsgt from!1455 i!673))))

(assert (=> b!1157574 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519810 () Unit!37986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74810 (_ BitVec 64) (_ BitVec 32)) Unit!37986)

(assert (=> b!1157574 (= lt!519810 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1157575 () Bool)

(assert (=> b!1157575 (= e!658287 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519819) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55436 () Bool)

(declare-fun call!55439 () Unit!37986)

(assert (=> bm!55436 (= call!55439 call!55435)))

(declare-fun b!1157576 () Bool)

(declare-fun res!768707 () Bool)

(assert (=> b!1157576 (=> (not res!768707) (not e!658290))))

(assert (=> b!1157576 (= res!768707 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36594 _keys!1208))))))

(declare-fun b!1157577 () Bool)

(declare-fun e!658282 () Unit!37986)

(declare-fun Unit!37988 () Unit!37986)

(assert (=> b!1157577 (= e!658282 Unit!37988)))

(declare-fun bm!55437 () Bool)

(declare-fun call!55438 () Bool)

(assert (=> bm!55437 (= call!55438 call!55440)))

(declare-fun b!1157578 () Bool)

(declare-fun lt!519827 () Unit!37986)

(assert (=> b!1157578 (= e!658285 lt!519827)))

(assert (=> b!1157578 (= lt!519827 call!55439)))

(assert (=> b!1157578 call!55438))

(declare-fun b!1157579 () Bool)

(assert (=> b!1157579 (contains!6762 (+!3719 lt!519829 (tuple2!18621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!519821 () Unit!37986)

(assert (=> b!1157579 (= lt!519821 call!55435)))

(assert (=> b!1157579 call!55440))

(assert (=> b!1157579 (= lt!519829 call!55441)))

(declare-fun lt!519824 () Unit!37986)

(assert (=> b!1157579 (= lt!519824 (addStillContains!929 lt!519813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!658291 () Unit!37986)

(assert (=> b!1157579 (= e!658291 lt!519821)))

(declare-fun b!1157580 () Bool)

(declare-fun call!55442 () ListLongMap!16589)

(declare-fun call!55437 () ListLongMap!16589)

(assert (=> b!1157580 (= e!658286 (= call!55442 call!55437))))

(declare-fun b!1157581 () Bool)

(declare-fun e!658278 () Bool)

(assert (=> b!1157581 (= e!658278 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!55438 () Bool)

(declare-fun lt!519823 () array!74808)

(declare-fun getCurrentListMapNoExtraKeys!4790 (array!74810 array!74808 (_ BitVec 32) (_ BitVec 32) V!43825 V!43825 (_ BitVec 32) Int) ListLongMap!16589)

(assert (=> bm!55438 (= call!55442 (getCurrentListMapNoExtraKeys!4790 lt!519820 lt!519823 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157582 () Bool)

(assert (=> b!1157582 (= c!115273 (and (not lt!519819) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157582 (= e!658291 e!658285)))

(declare-fun b!1157583 () Bool)

(assert (=> b!1157583 (= e!658283 e!658279)))

(declare-fun res!768698 () Bool)

(assert (=> b!1157583 (=> res!768698 e!658279)))

(assert (=> b!1157583 (= res!768698 (not (= from!1455 i!673)))))

(declare-fun lt!519815 () ListLongMap!16589)

(assert (=> b!1157583 (= lt!519815 (getCurrentListMapNoExtraKeys!4790 lt!519820 lt!519823 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!519816 () V!43825)

(assert (=> b!1157583 (= lt!519823 (array!74809 (store (arr!36055 _values!996) i!673 (ValueCellFull!13802 lt!519816)) (size!36593 _values!996)))))

(declare-fun dynLambda!2743 (Int (_ BitVec 64)) V!43825)

(assert (=> b!1157583 (= lt!519816 (dynLambda!2743 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!519818 () ListLongMap!16589)

(assert (=> b!1157583 (= lt!519818 (getCurrentListMapNoExtraKeys!4790 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157584 () Bool)

(declare-fun -!1366 (ListLongMap!16589 (_ BitVec 64)) ListLongMap!16589)

(assert (=> b!1157584 (= e!658286 (= call!55442 (-!1366 call!55437 k0!934)))))

(declare-fun b!1157585 () Bool)

(declare-fun res!768706 () Bool)

(assert (=> b!1157585 (=> (not res!768706) (not e!658290))))

(assert (=> b!1157585 (= res!768706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1157586 () Bool)

(declare-fun res!768693 () Bool)

(assert (=> b!1157586 (=> (not res!768693) (not e!658290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157586 (= res!768693 (validKeyInArray!0 k0!934))))

(declare-fun b!1157587 () Bool)

(declare-fun Unit!37989 () Unit!37986)

(assert (=> b!1157587 (= e!658292 Unit!37989)))

(declare-fun bm!55439 () Bool)

(assert (=> bm!55439 (= call!55437 (getCurrentListMapNoExtraKeys!4790 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157588 () Bool)

(declare-fun Unit!37990 () Unit!37986)

(assert (=> b!1157588 (= e!658282 Unit!37990)))

(assert (=> b!1157588 (= lt!519819 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157588 (= c!115269 (and (not lt!519819) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519830 () Unit!37986)

(assert (=> b!1157588 (= lt!519830 e!658291)))

(declare-fun lt!519812 () Unit!37986)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!510 (array!74810 array!74808 (_ BitVec 32) (_ BitVec 32) V!43825 V!43825 (_ BitVec 64) (_ BitVec 32) Int) Unit!37986)

(assert (=> b!1157588 (= lt!519812 (lemmaListMapContainsThenArrayContainsFrom!510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115271 () Bool)

(assert (=> b!1157588 (= c!115271 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768704 () Bool)

(assert (=> b!1157588 (= res!768704 e!658287)))

(assert (=> b!1157588 (=> (not res!768704) (not e!658278))))

(assert (=> b!1157588 e!658278))

(declare-fun lt!519831 () Unit!37986)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74810 (_ BitVec 32) (_ BitVec 32)) Unit!37986)

(assert (=> b!1157588 (= lt!519831 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1157588 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25343)))

(declare-fun lt!519826 () Unit!37986)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74810 (_ BitVec 64) (_ BitVec 32) List!25346) Unit!37986)

(assert (=> b!1157588 (= lt!519826 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25343))))

(assert (=> b!1157588 false))

(declare-fun b!1157589 () Bool)

(assert (=> b!1157589 call!55438))

(declare-fun lt!519817 () Unit!37986)

(assert (=> b!1157589 (= lt!519817 call!55439)))

(assert (=> b!1157589 (= e!658292 lt!519817)))

(declare-fun b!1157590 () Bool)

(declare-fun e!658280 () Bool)

(assert (=> b!1157590 (= e!658280 tp_is_empty!29023)))

(declare-fun b!1157591 () Bool)

(assert (=> b!1157591 (= e!658277 true)))

(declare-fun e!658281 () Bool)

(assert (=> b!1157591 e!658281))

(declare-fun res!768696 () Bool)

(assert (=> b!1157591 (=> (not res!768696) (not e!658281))))

(declare-fun lt!519811 () ListLongMap!16589)

(assert (=> b!1157591 (= res!768696 (= lt!519811 lt!519813))))

(assert (=> b!1157591 (= lt!519811 (-!1366 lt!519818 k0!934))))

(declare-fun lt!519822 () V!43825)

(assert (=> b!1157591 (= (-!1366 (+!3719 lt!519813 (tuple2!18621 (select (arr!36056 _keys!1208) from!1455) lt!519822)) (select (arr!36056 _keys!1208) from!1455)) lt!519813)))

(declare-fun lt!519828 () Unit!37986)

(declare-fun addThenRemoveForNewKeyIsSame!218 (ListLongMap!16589 (_ BitVec 64) V!43825) Unit!37986)

(assert (=> b!1157591 (= lt!519828 (addThenRemoveForNewKeyIsSame!218 lt!519813 (select (arr!36056 _keys!1208) from!1455) lt!519822))))

(declare-fun get!18396 (ValueCell!13802 V!43825) V!43825)

(assert (=> b!1157591 (= lt!519822 (get!18396 (select (arr!36055 _values!996) from!1455) lt!519816))))

(declare-fun lt!519814 () Unit!37986)

(assert (=> b!1157591 (= lt!519814 e!658282)))

(declare-fun c!115274 () Bool)

(assert (=> b!1157591 (= c!115274 (contains!6762 lt!519813 k0!934))))

(assert (=> b!1157591 (= lt!519813 (getCurrentListMapNoExtraKeys!4790 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157592 () Bool)

(declare-fun res!768694 () Bool)

(assert (=> b!1157592 (=> (not res!768694) (not e!658290))))

(assert (=> b!1157592 (= res!768694 (= (select (arr!36056 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45359 () Bool)

(declare-fun tp!86189 () Bool)

(assert (=> mapNonEmpty!45359 (= mapRes!45359 (and tp!86189 e!658280))))

(declare-fun mapRest!45359 () (Array (_ BitVec 32) ValueCell!13802))

(declare-fun mapValue!45359 () ValueCell!13802)

(declare-fun mapKey!45359 () (_ BitVec 32))

(assert (=> mapNonEmpty!45359 (= (arr!36055 _values!996) (store mapRest!45359 mapKey!45359 mapValue!45359))))

(declare-fun b!1157593 () Bool)

(declare-fun res!768703 () Bool)

(assert (=> b!1157593 (=> (not res!768703) (not e!658290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157593 (= res!768703 (validMask!0 mask!1564))))

(declare-fun b!1157594 () Bool)

(assert (=> b!1157594 (= e!658281 (= lt!519811 (getCurrentListMapNoExtraKeys!4790 lt!519820 lt!519823 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1157595 () Bool)

(declare-fun res!768701 () Bool)

(assert (=> b!1157595 (=> (not res!768701) (not e!658284))))

(assert (=> b!1157595 (= res!768701 (arrayNoDuplicates!0 lt!519820 #b00000000000000000000000000000000 Nil!25343))))

(assert (= (and start!98882 res!768702) b!1157593))

(assert (= (and b!1157593 res!768703) b!1157567))

(assert (= (and b!1157567 res!768705) b!1157585))

(assert (= (and b!1157585 res!768706) b!1157568))

(assert (= (and b!1157568 res!768695) b!1157576))

(assert (= (and b!1157576 res!768707) b!1157586))

(assert (= (and b!1157586 res!768693) b!1157592))

(assert (= (and b!1157592 res!768694) b!1157569))

(assert (= (and b!1157569 res!768697) b!1157595))

(assert (= (and b!1157595 res!768701) b!1157574))

(assert (= (and b!1157574 (not res!768699)) b!1157583))

(assert (= (and b!1157583 (not res!768698)) b!1157573))

(assert (= (and b!1157573 c!115270) b!1157584))

(assert (= (and b!1157573 (not c!115270)) b!1157580))

(assert (= (or b!1157584 b!1157580) bm!55438))

(assert (= (or b!1157584 b!1157580) bm!55439))

(assert (= (and b!1157573 (not res!768700)) b!1157591))

(assert (= (and b!1157591 c!115274) b!1157588))

(assert (= (and b!1157591 (not c!115274)) b!1157577))

(assert (= (and b!1157588 c!115269) b!1157579))

(assert (= (and b!1157588 (not c!115269)) b!1157582))

(assert (= (and b!1157582 c!115273) b!1157578))

(assert (= (and b!1157582 (not c!115273)) b!1157572))

(assert (= (and b!1157572 c!115272) b!1157589))

(assert (= (and b!1157572 (not c!115272)) b!1157587))

(assert (= (or b!1157578 b!1157589) bm!55436))

(assert (= (or b!1157578 b!1157589) bm!55435))

(assert (= (or b!1157578 b!1157589) bm!55437))

(assert (= (or b!1157579 bm!55437) bm!55434))

(assert (= (or b!1157579 bm!55436) bm!55433))

(assert (= (or b!1157579 bm!55435) bm!55432))

(assert (= (and b!1157588 c!115271) b!1157570))

(assert (= (and b!1157588 (not c!115271)) b!1157575))

(assert (= (and b!1157588 res!768704) b!1157581))

(assert (= (and b!1157591 res!768696) b!1157594))

(assert (= (and b!1157571 condMapEmpty!45359) mapIsEmpty!45359))

(assert (= (and b!1157571 (not condMapEmpty!45359)) mapNonEmpty!45359))

(get-info :version)

(assert (= (and mapNonEmpty!45359 ((_ is ValueCellFull!13802) mapValue!45359)) b!1157590))

(assert (= (and b!1157571 ((_ is ValueCellFull!13802) mapDefault!45359)) b!1157566))

(assert (= start!98882 b!1157571))

(declare-fun b_lambda!19581 () Bool)

(assert (=> (not b_lambda!19581) (not b!1157583)))

(declare-fun t!36821 () Bool)

(declare-fun tb!9297 () Bool)

(assert (=> (and start!98882 (= defaultEntry!1004 defaultEntry!1004) t!36821) tb!9297))

(declare-fun result!19167 () Bool)

(assert (=> tb!9297 (= result!19167 tp_is_empty!29023)))

(assert (=> b!1157583 t!36821))

(declare-fun b_and!39815 () Bool)

(assert (= b_and!39813 (and (=> t!36821 result!19167) b_and!39815)))

(declare-fun m!1066395 () Bool)

(assert (=> mapNonEmpty!45359 m!1066395))

(declare-fun m!1066397 () Bool)

(assert (=> b!1157595 m!1066397))

(declare-fun m!1066399 () Bool)

(assert (=> b!1157581 m!1066399))

(declare-fun m!1066401 () Bool)

(assert (=> b!1157574 m!1066401))

(declare-fun m!1066403 () Bool)

(assert (=> b!1157574 m!1066403))

(declare-fun m!1066405 () Bool)

(assert (=> b!1157588 m!1066405))

(declare-fun m!1066407 () Bool)

(assert (=> b!1157588 m!1066407))

(declare-fun m!1066409 () Bool)

(assert (=> b!1157588 m!1066409))

(declare-fun m!1066411 () Bool)

(assert (=> b!1157588 m!1066411))

(declare-fun m!1066413 () Bool)

(assert (=> b!1157569 m!1066413))

(declare-fun m!1066415 () Bool)

(assert (=> b!1157569 m!1066415))

(declare-fun m!1066417 () Bool)

(assert (=> bm!55439 m!1066417))

(declare-fun m!1066419 () Bool)

(assert (=> bm!55438 m!1066419))

(assert (=> b!1157570 m!1066399))

(declare-fun m!1066421 () Bool)

(assert (=> b!1157586 m!1066421))

(declare-fun m!1066423 () Bool)

(assert (=> b!1157573 m!1066423))

(declare-fun m!1066425 () Bool)

(assert (=> b!1157573 m!1066425))

(declare-fun m!1066427 () Bool)

(assert (=> bm!55432 m!1066427))

(declare-fun m!1066429 () Bool)

(assert (=> b!1157579 m!1066429))

(assert (=> b!1157579 m!1066429))

(declare-fun m!1066431 () Bool)

(assert (=> b!1157579 m!1066431))

(declare-fun m!1066433 () Bool)

(assert (=> b!1157579 m!1066433))

(declare-fun m!1066435 () Bool)

(assert (=> b!1157568 m!1066435))

(declare-fun m!1066437 () Bool)

(assert (=> bm!55433 m!1066437))

(declare-fun m!1066439 () Bool)

(assert (=> b!1157585 m!1066439))

(declare-fun m!1066441 () Bool)

(assert (=> b!1157583 m!1066441))

(declare-fun m!1066443 () Bool)

(assert (=> b!1157583 m!1066443))

(declare-fun m!1066445 () Bool)

(assert (=> b!1157583 m!1066445))

(declare-fun m!1066447 () Bool)

(assert (=> b!1157583 m!1066447))

(assert (=> b!1157591 m!1066417))

(declare-fun m!1066449 () Bool)

(assert (=> b!1157591 m!1066449))

(declare-fun m!1066451 () Bool)

(assert (=> b!1157591 m!1066451))

(assert (=> b!1157591 m!1066451))

(assert (=> b!1157591 m!1066423))

(declare-fun m!1066453 () Bool)

(assert (=> b!1157591 m!1066453))

(declare-fun m!1066455 () Bool)

(assert (=> b!1157591 m!1066455))

(assert (=> b!1157591 m!1066423))

(declare-fun m!1066457 () Bool)

(assert (=> b!1157591 m!1066457))

(assert (=> b!1157591 m!1066449))

(declare-fun m!1066459 () Bool)

(assert (=> b!1157591 m!1066459))

(assert (=> b!1157591 m!1066423))

(declare-fun m!1066461 () Bool)

(assert (=> b!1157591 m!1066461))

(declare-fun m!1066463 () Bool)

(assert (=> start!98882 m!1066463))

(declare-fun m!1066465 () Bool)

(assert (=> start!98882 m!1066465))

(declare-fun m!1066467 () Bool)

(assert (=> b!1157593 m!1066467))

(declare-fun m!1066469 () Bool)

(assert (=> bm!55434 m!1066469))

(declare-fun m!1066471 () Bool)

(assert (=> b!1157592 m!1066471))

(assert (=> b!1157594 m!1066419))

(declare-fun m!1066473 () Bool)

(assert (=> b!1157584 m!1066473))

(check-sat (not b!1157585) (not b_lambda!19581) (not b!1157595) (not b!1157588) (not b!1157568) (not start!98882) (not bm!55433) b_and!39815 (not bm!55434) (not b!1157593) (not b!1157574) (not bm!55439) (not bm!55438) (not b!1157591) (not b!1157584) (not b!1157573) (not b!1157586) (not b!1157583) tp_is_empty!29023 (not b!1157594) (not b!1157579) (not mapNonEmpty!45359) (not b!1157570) (not b_next!24493) (not b!1157581) (not b!1157569) (not bm!55432))
(check-sat b_and!39815 (not b_next!24493))
