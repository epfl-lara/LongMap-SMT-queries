; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98812 () Bool)

(assert start!98812)

(declare-fun b_free!24417 () Bool)

(declare-fun b_next!24417 () Bool)

(assert (=> start!98812 (= b_free!24417 (not b_next!24417))))

(declare-fun tp!85961 () Bool)

(declare-fun b_and!39683 () Bool)

(assert (=> start!98812 (= tp!85961 b_and!39683)))

(declare-fun b!1154194 () Bool)

(declare-fun res!767061 () Bool)

(declare-fun e!656427 () Bool)

(assert (=> b!1154194 (=> (not res!767061) (not e!656427))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!74741 0))(
  ( (array!74742 (arr!36021 (Array (_ BitVec 32) (_ BitVec 64))) (size!36557 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74741)

(assert (=> b!1154194 (= res!767061 (= (select (arr!36021 _keys!1208) i!673) k0!934))))

(declare-fun b!1154195 () Bool)

(declare-fun e!656422 () Bool)

(declare-fun tp_is_empty!28947 () Bool)

(assert (=> b!1154195 (= e!656422 tp_is_empty!28947)))

(declare-fun b!1154196 () Bool)

(declare-fun e!656429 () Bool)

(declare-fun e!656419 () Bool)

(assert (=> b!1154196 (= e!656429 e!656419)))

(declare-fun res!767058 () Bool)

(assert (=> b!1154196 (=> res!767058 e!656419)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1154196 (= res!767058 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43723 0))(
  ( (V!43724 (val!14530 Int)) )
))
(declare-fun zeroValue!944 () V!43723)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18468 0))(
  ( (tuple2!18469 (_1!9245 (_ BitVec 64)) (_2!9245 V!43723)) )
))
(declare-datatypes ((List!25212 0))(
  ( (Nil!25209) (Cons!25208 (h!26417 tuple2!18468) (t!36621 List!25212)) )
))
(declare-datatypes ((ListLongMap!16437 0))(
  ( (ListLongMap!16438 (toList!8234 List!25212)) )
))
(declare-fun lt!517503 () ListLongMap!16437)

(declare-datatypes ((ValueCell!13764 0))(
  ( (ValueCellFull!13764 (v!17167 V!43723)) (EmptyCell!13764) )
))
(declare-datatypes ((array!74743 0))(
  ( (array!74744 (arr!36022 (Array (_ BitVec 32) ValueCell!13764)) (size!36558 (_ BitVec 32))) )
))
(declare-fun lt!517504 () array!74743)

(declare-fun minValue!944 () V!43723)

(declare-fun lt!517512 () array!74741)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4703 (array!74741 array!74743 (_ BitVec 32) (_ BitVec 32) V!43723 V!43723 (_ BitVec 32) Int) ListLongMap!16437)

(assert (=> b!1154196 (= lt!517503 (getCurrentListMapNoExtraKeys!4703 lt!517512 lt!517504 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517513 () V!43723)

(declare-fun _values!996 () array!74743)

(assert (=> b!1154196 (= lt!517504 (array!74744 (store (arr!36022 _values!996) i!673 (ValueCellFull!13764 lt!517513)) (size!36558 _values!996)))))

(declare-fun dynLambda!2716 (Int (_ BitVec 64)) V!43723)

(assert (=> b!1154196 (= lt!517513 (dynLambda!2716 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517501 () ListLongMap!16437)

(assert (=> b!1154196 (= lt!517501 (getCurrentListMapNoExtraKeys!4703 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45245 () Bool)

(declare-fun mapRes!45245 () Bool)

(declare-fun tp!85962 () Bool)

(assert (=> mapNonEmpty!45245 (= mapRes!45245 (and tp!85962 e!656422))))

(declare-fun mapValue!45245 () ValueCell!13764)

(declare-fun mapRest!45245 () (Array (_ BitVec 32) ValueCell!13764))

(declare-fun mapKey!45245 () (_ BitVec 32))

(assert (=> mapNonEmpty!45245 (= (arr!36022 _values!996) (store mapRest!45245 mapKey!45245 mapValue!45245))))

(declare-fun res!767056 () Bool)

(assert (=> start!98812 (=> (not res!767056) (not e!656427))))

(assert (=> start!98812 (= res!767056 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36557 _keys!1208))))))

(assert (=> start!98812 e!656427))

(assert (=> start!98812 tp_is_empty!28947))

(declare-fun array_inv!27572 (array!74741) Bool)

(assert (=> start!98812 (array_inv!27572 _keys!1208)))

(assert (=> start!98812 true))

(assert (=> start!98812 tp!85961))

(declare-fun e!656430 () Bool)

(declare-fun array_inv!27573 (array!74743) Bool)

(assert (=> start!98812 (and (array_inv!27573 _values!996) e!656430)))

(declare-fun b!1154197 () Bool)

(declare-datatypes ((Unit!37990 0))(
  ( (Unit!37991) )
))
(declare-fun e!656432 () Unit!37990)

(declare-fun Unit!37992 () Unit!37990)

(assert (=> b!1154197 (= e!656432 Unit!37992)))

(declare-fun lt!517495 () Bool)

(assert (=> b!1154197 (= lt!517495 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114612 () Bool)

(assert (=> b!1154197 (= c!114612 (and (not lt!517495) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517500 () Unit!37990)

(declare-fun e!656433 () Unit!37990)

(assert (=> b!1154197 (= lt!517500 e!656433)))

(declare-fun lt!517496 () Unit!37990)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!484 (array!74741 array!74743 (_ BitVec 32) (_ BitVec 32) V!43723 V!43723 (_ BitVec 64) (_ BitVec 32) Int) Unit!37990)

(assert (=> b!1154197 (= lt!517496 (lemmaListMapContainsThenArrayContainsFrom!484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114616 () Bool)

(assert (=> b!1154197 (= c!114616 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767053 () Bool)

(declare-fun e!656423 () Bool)

(assert (=> b!1154197 (= res!767053 e!656423)))

(declare-fun e!656421 () Bool)

(assert (=> b!1154197 (=> (not res!767053) (not e!656421))))

(assert (=> b!1154197 e!656421))

(declare-fun lt!517498 () Unit!37990)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74741 (_ BitVec 32) (_ BitVec 32)) Unit!37990)

(assert (=> b!1154197 (= lt!517498 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25213 0))(
  ( (Nil!25210) (Cons!25209 (h!26418 (_ BitVec 64)) (t!36622 List!25213)) )
))
(declare-fun arrayNoDuplicates!0 (array!74741 (_ BitVec 32) List!25213) Bool)

(assert (=> b!1154197 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25210)))

(declare-fun lt!517505 () Unit!37990)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74741 (_ BitVec 64) (_ BitVec 32) List!25213) Unit!37990)

(assert (=> b!1154197 (= lt!517505 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25210))))

(assert (=> b!1154197 false))

(declare-fun e!656425 () Bool)

(declare-fun b!1154198 () Bool)

(declare-fun call!54548 () ListLongMap!16437)

(declare-fun call!54547 () ListLongMap!16437)

(declare-fun -!1356 (ListLongMap!16437 (_ BitVec 64)) ListLongMap!16437)

(assert (=> b!1154198 (= e!656425 (= call!54547 (-!1356 call!54548 k0!934)))))

(declare-fun b!1154199 () Bool)

(declare-fun res!767049 () Bool)

(assert (=> b!1154199 (=> (not res!767049) (not e!656427))))

(assert (=> b!1154199 (= res!767049 (and (= (size!36558 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36557 _keys!1208) (size!36558 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1154200 () Bool)

(declare-fun Unit!37993 () Unit!37990)

(assert (=> b!1154200 (= e!656432 Unit!37993)))

(declare-fun b!1154201 () Bool)

(declare-fun e!656428 () Bool)

(assert (=> b!1154201 (= e!656430 (and e!656428 mapRes!45245))))

(declare-fun condMapEmpty!45245 () Bool)

(declare-fun mapDefault!45245 () ValueCell!13764)

(assert (=> b!1154201 (= condMapEmpty!45245 (= (arr!36022 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13764)) mapDefault!45245)))))

(declare-fun b!1154202 () Bool)

(declare-fun arrayContainsKey!0 (array!74741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154202 (= e!656421 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154203 () Bool)

(declare-fun e!656418 () Bool)

(assert (=> b!1154203 (= e!656427 e!656418)))

(declare-fun res!767055 () Bool)

(assert (=> b!1154203 (=> (not res!767055) (not e!656418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74741 (_ BitVec 32)) Bool)

(assert (=> b!1154203 (= res!767055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517512 mask!1564))))

(assert (=> b!1154203 (= lt!517512 (array!74742 (store (arr!36021 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36557 _keys!1208)))))

(declare-fun c!114613 () Bool)

(declare-fun call!54553 () ListLongMap!16437)

(declare-fun lt!517499 () ListLongMap!16437)

(declare-fun bm!54543 () Bool)

(declare-fun +!3647 (ListLongMap!16437 tuple2!18468) ListLongMap!16437)

(assert (=> bm!54543 (= call!54553 (+!3647 lt!517499 (ite (or c!114612 c!114613) (tuple2!18469 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18469 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1154204 () Bool)

(declare-fun res!767052 () Bool)

(assert (=> b!1154204 (=> (not res!767052) (not e!656427))))

(assert (=> b!1154204 (= res!767052 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36557 _keys!1208))))))

(declare-fun bm!54544 () Bool)

(declare-fun call!54546 () ListLongMap!16437)

(assert (=> bm!54544 (= call!54546 call!54553)))

(declare-fun b!1154205 () Bool)

(assert (=> b!1154205 (= e!656423 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154206 () Bool)

(declare-fun e!656431 () Unit!37990)

(declare-fun lt!517502 () Unit!37990)

(assert (=> b!1154206 (= e!656431 lt!517502)))

(declare-fun call!54551 () Unit!37990)

(assert (=> b!1154206 (= lt!517502 call!54551)))

(declare-fun call!54552 () Bool)

(assert (=> b!1154206 call!54552))

(declare-fun bm!54545 () Bool)

(declare-fun call!54549 () Bool)

(assert (=> bm!54545 (= call!54552 call!54549)))

(declare-fun b!1154207 () Bool)

(assert (=> b!1154207 call!54552))

(declare-fun lt!517510 () Unit!37990)

(assert (=> b!1154207 (= lt!517510 call!54551)))

(declare-fun e!656426 () Unit!37990)

(assert (=> b!1154207 (= e!656426 lt!517510)))

(declare-fun b!1154208 () Bool)

(declare-fun lt!517509 () ListLongMap!16437)

(declare-fun contains!6748 (ListLongMap!16437 (_ BitVec 64)) Bool)

(assert (=> b!1154208 (contains!6748 (+!3647 lt!517509 (tuple2!18469 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!517494 () Unit!37990)

(declare-fun call!54550 () Unit!37990)

(assert (=> b!1154208 (= lt!517494 call!54550)))

(assert (=> b!1154208 call!54549))

(assert (=> b!1154208 (= lt!517509 call!54553)))

(declare-fun lt!517506 () Unit!37990)

(declare-fun addStillContains!893 (ListLongMap!16437 (_ BitVec 64) V!43723 (_ BitVec 64)) Unit!37990)

(assert (=> b!1154208 (= lt!517506 (addStillContains!893 lt!517499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1154208 (= e!656433 lt!517494)))

(declare-fun b!1154209 () Bool)

(declare-fun res!767063 () Bool)

(assert (=> b!1154209 (=> (not res!767063) (not e!656418))))

(assert (=> b!1154209 (= res!767063 (arrayNoDuplicates!0 lt!517512 #b00000000000000000000000000000000 Nil!25210))))

(declare-fun b!1154210 () Bool)

(declare-fun res!767062 () Bool)

(assert (=> b!1154210 (=> (not res!767062) (not e!656427))))

(assert (=> b!1154210 (= res!767062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1154211 () Bool)

(assert (=> b!1154211 (= e!656428 tp_is_empty!28947)))

(declare-fun bm!54546 () Bool)

(assert (=> bm!54546 (= call!54549 (contains!6748 (ite c!114612 lt!517509 call!54546) k0!934))))

(declare-fun b!1154212 () Bool)

(assert (=> b!1154212 (= e!656431 e!656426)))

(declare-fun c!114614 () Bool)

(assert (=> b!1154212 (= c!114614 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517495))))

(declare-fun b!1154213 () Bool)

(assert (=> b!1154213 (= c!114613 (and (not lt!517495) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1154213 (= e!656433 e!656431)))

(declare-fun b!1154214 () Bool)

(declare-fun res!767060 () Bool)

(assert (=> b!1154214 (=> (not res!767060) (not e!656427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154214 (= res!767060 (validKeyInArray!0 k0!934))))

(declare-fun bm!54547 () Bool)

(assert (=> bm!54547 (= call!54550 (addStillContains!893 (ite c!114612 lt!517509 lt!517499) (ite c!114612 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114613 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114612 minValue!944 (ite c!114613 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!54548 () Bool)

(assert (=> bm!54548 (= call!54548 (getCurrentListMapNoExtraKeys!4703 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154215 () Bool)

(assert (=> b!1154215 (= e!656425 (= call!54547 call!54548))))

(declare-fun b!1154216 () Bool)

(assert (=> b!1154216 (= e!656418 (not e!656429))))

(declare-fun res!767051 () Bool)

(assert (=> b!1154216 (=> res!767051 e!656429)))

(assert (=> b!1154216 (= res!767051 (bvsgt from!1455 i!673))))

(assert (=> b!1154216 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517507 () Unit!37990)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74741 (_ BitVec 64) (_ BitVec 32)) Unit!37990)

(assert (=> b!1154216 (= lt!517507 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1154217 () Bool)

(declare-fun res!767050 () Bool)

(assert (=> b!1154217 (=> (not res!767050) (not e!656427))))

(assert (=> b!1154217 (= res!767050 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25210))))

(declare-fun e!656424 () Bool)

(declare-fun lt!517497 () ListLongMap!16437)

(declare-fun b!1154218 () Bool)

(assert (=> b!1154218 (= e!656424 (= lt!517497 (getCurrentListMapNoExtraKeys!4703 lt!517512 lt!517504 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapIsEmpty!45245 () Bool)

(assert (=> mapIsEmpty!45245 mapRes!45245))

(declare-fun b!1154219 () Bool)

(declare-fun e!656417 () Bool)

(assert (=> b!1154219 (= e!656417 true)))

(assert (=> b!1154219 e!656424))

(declare-fun res!767059 () Bool)

(assert (=> b!1154219 (=> (not res!767059) (not e!656424))))

(assert (=> b!1154219 (= res!767059 (= lt!517497 lt!517499))))

(assert (=> b!1154219 (= lt!517497 (-!1356 lt!517501 k0!934))))

(declare-fun lt!517515 () V!43723)

(assert (=> b!1154219 (= (-!1356 (+!3647 lt!517499 (tuple2!18469 (select (arr!36021 _keys!1208) from!1455) lt!517515)) (select (arr!36021 _keys!1208) from!1455)) lt!517499)))

(declare-fun lt!517511 () Unit!37990)

(declare-fun addThenRemoveForNewKeyIsSame!196 (ListLongMap!16437 (_ BitVec 64) V!43723) Unit!37990)

(assert (=> b!1154219 (= lt!517511 (addThenRemoveForNewKeyIsSame!196 lt!517499 (select (arr!36021 _keys!1208) from!1455) lt!517515))))

(declare-fun get!18348 (ValueCell!13764 V!43723) V!43723)

(assert (=> b!1154219 (= lt!517515 (get!18348 (select (arr!36022 _values!996) from!1455) lt!517513))))

(declare-fun lt!517514 () Unit!37990)

(assert (=> b!1154219 (= lt!517514 e!656432)))

(declare-fun c!114611 () Bool)

(assert (=> b!1154219 (= c!114611 (contains!6748 lt!517499 k0!934))))

(assert (=> b!1154219 (= lt!517499 (getCurrentListMapNoExtraKeys!4703 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54549 () Bool)

(assert (=> bm!54549 (= call!54547 (getCurrentListMapNoExtraKeys!4703 lt!517512 lt!517504 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154220 () Bool)

(assert (=> b!1154220 (= e!656423 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517495) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!54550 () Bool)

(assert (=> bm!54550 (= call!54551 call!54550)))

(declare-fun b!1154221 () Bool)

(assert (=> b!1154221 (= e!656419 e!656417)))

(declare-fun res!767057 () Bool)

(assert (=> b!1154221 (=> res!767057 e!656417)))

(assert (=> b!1154221 (= res!767057 (not (= (select (arr!36021 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1154221 e!656425))

(declare-fun c!114615 () Bool)

(assert (=> b!1154221 (= c!114615 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!517508 () Unit!37990)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!591 (array!74741 array!74743 (_ BitVec 32) (_ BitVec 32) V!43723 V!43723 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37990)

(assert (=> b!1154221 (= lt!517508 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154222 () Bool)

(declare-fun Unit!37994 () Unit!37990)

(assert (=> b!1154222 (= e!656426 Unit!37994)))

(declare-fun b!1154223 () Bool)

(declare-fun res!767054 () Bool)

(assert (=> b!1154223 (=> (not res!767054) (not e!656427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154223 (= res!767054 (validMask!0 mask!1564))))

(assert (= (and start!98812 res!767056) b!1154223))

(assert (= (and b!1154223 res!767054) b!1154199))

(assert (= (and b!1154199 res!767049) b!1154210))

(assert (= (and b!1154210 res!767062) b!1154217))

(assert (= (and b!1154217 res!767050) b!1154204))

(assert (= (and b!1154204 res!767052) b!1154214))

(assert (= (and b!1154214 res!767060) b!1154194))

(assert (= (and b!1154194 res!767061) b!1154203))

(assert (= (and b!1154203 res!767055) b!1154209))

(assert (= (and b!1154209 res!767063) b!1154216))

(assert (= (and b!1154216 (not res!767051)) b!1154196))

(assert (= (and b!1154196 (not res!767058)) b!1154221))

(assert (= (and b!1154221 c!114615) b!1154198))

(assert (= (and b!1154221 (not c!114615)) b!1154215))

(assert (= (or b!1154198 b!1154215) bm!54549))

(assert (= (or b!1154198 b!1154215) bm!54548))

(assert (= (and b!1154221 (not res!767057)) b!1154219))

(assert (= (and b!1154219 c!114611) b!1154197))

(assert (= (and b!1154219 (not c!114611)) b!1154200))

(assert (= (and b!1154197 c!114612) b!1154208))

(assert (= (and b!1154197 (not c!114612)) b!1154213))

(assert (= (and b!1154213 c!114613) b!1154206))

(assert (= (and b!1154213 (not c!114613)) b!1154212))

(assert (= (and b!1154212 c!114614) b!1154207))

(assert (= (and b!1154212 (not c!114614)) b!1154222))

(assert (= (or b!1154206 b!1154207) bm!54550))

(assert (= (or b!1154206 b!1154207) bm!54544))

(assert (= (or b!1154206 b!1154207) bm!54545))

(assert (= (or b!1154208 bm!54545) bm!54546))

(assert (= (or b!1154208 bm!54550) bm!54547))

(assert (= (or b!1154208 bm!54544) bm!54543))

(assert (= (and b!1154197 c!114616) b!1154205))

(assert (= (and b!1154197 (not c!114616)) b!1154220))

(assert (= (and b!1154197 res!767053) b!1154202))

(assert (= (and b!1154219 res!767059) b!1154218))

(assert (= (and b!1154201 condMapEmpty!45245) mapIsEmpty!45245))

(assert (= (and b!1154201 (not condMapEmpty!45245)) mapNonEmpty!45245))

(get-info :version)

(assert (= (and mapNonEmpty!45245 ((_ is ValueCellFull!13764) mapValue!45245)) b!1154195))

(assert (= (and b!1154201 ((_ is ValueCellFull!13764) mapDefault!45245)) b!1154211))

(assert (= start!98812 b!1154201))

(declare-fun b_lambda!19523 () Bool)

(assert (=> (not b_lambda!19523) (not b!1154196)))

(declare-fun t!36620 () Bool)

(declare-fun tb!9229 () Bool)

(assert (=> (and start!98812 (= defaultEntry!1004 defaultEntry!1004) t!36620) tb!9229))

(declare-fun result!19023 () Bool)

(assert (=> tb!9229 (= result!19023 tp_is_empty!28947)))

(assert (=> b!1154196 t!36620))

(declare-fun b_and!39685 () Bool)

(assert (= b_and!39683 (and (=> t!36620 result!19023) b_and!39685)))

(declare-fun m!1063945 () Bool)

(assert (=> b!1154202 m!1063945))

(declare-fun m!1063947 () Bool)

(assert (=> b!1154216 m!1063947))

(declare-fun m!1063949 () Bool)

(assert (=> b!1154216 m!1063949))

(declare-fun m!1063951 () Bool)

(assert (=> b!1154198 m!1063951))

(declare-fun m!1063953 () Bool)

(assert (=> bm!54543 m!1063953))

(declare-fun m!1063955 () Bool)

(assert (=> b!1154194 m!1063955))

(declare-fun m!1063957 () Bool)

(assert (=> b!1154214 m!1063957))

(declare-fun m!1063959 () Bool)

(assert (=> bm!54547 m!1063959))

(declare-fun m!1063961 () Bool)

(assert (=> b!1154219 m!1063961))

(declare-fun m!1063963 () Bool)

(assert (=> b!1154219 m!1063963))

(declare-fun m!1063965 () Bool)

(assert (=> b!1154219 m!1063965))

(declare-fun m!1063967 () Bool)

(assert (=> b!1154219 m!1063967))

(assert (=> b!1154219 m!1063965))

(declare-fun m!1063969 () Bool)

(assert (=> b!1154219 m!1063969))

(declare-fun m!1063971 () Bool)

(assert (=> b!1154219 m!1063971))

(declare-fun m!1063973 () Bool)

(assert (=> b!1154219 m!1063973))

(assert (=> b!1154219 m!1063965))

(declare-fun m!1063975 () Bool)

(assert (=> b!1154219 m!1063975))

(assert (=> b!1154219 m!1063963))

(assert (=> b!1154219 m!1063969))

(declare-fun m!1063977 () Bool)

(assert (=> b!1154219 m!1063977))

(declare-fun m!1063979 () Bool)

(assert (=> b!1154209 m!1063979))

(declare-fun m!1063981 () Bool)

(assert (=> bm!54549 m!1063981))

(assert (=> b!1154221 m!1063965))

(declare-fun m!1063983 () Bool)

(assert (=> b!1154221 m!1063983))

(assert (=> b!1154218 m!1063981))

(declare-fun m!1063985 () Bool)

(assert (=> b!1154203 m!1063985))

(declare-fun m!1063987 () Bool)

(assert (=> b!1154203 m!1063987))

(declare-fun m!1063989 () Bool)

(assert (=> bm!54546 m!1063989))

(declare-fun m!1063991 () Bool)

(assert (=> b!1154210 m!1063991))

(declare-fun m!1063993 () Bool)

(assert (=> start!98812 m!1063993))

(declare-fun m!1063995 () Bool)

(assert (=> start!98812 m!1063995))

(declare-fun m!1063997 () Bool)

(assert (=> b!1154223 m!1063997))

(declare-fun m!1063999 () Bool)

(assert (=> b!1154217 m!1063999))

(declare-fun m!1064001 () Bool)

(assert (=> b!1154197 m!1064001))

(declare-fun m!1064003 () Bool)

(assert (=> b!1154197 m!1064003))

(declare-fun m!1064005 () Bool)

(assert (=> b!1154197 m!1064005))

(declare-fun m!1064007 () Bool)

(assert (=> b!1154197 m!1064007))

(declare-fun m!1064009 () Bool)

(assert (=> b!1154196 m!1064009))

(declare-fun m!1064011 () Bool)

(assert (=> b!1154196 m!1064011))

(declare-fun m!1064013 () Bool)

(assert (=> b!1154196 m!1064013))

(declare-fun m!1064015 () Bool)

(assert (=> b!1154196 m!1064015))

(declare-fun m!1064017 () Bool)

(assert (=> b!1154208 m!1064017))

(assert (=> b!1154208 m!1064017))

(declare-fun m!1064019 () Bool)

(assert (=> b!1154208 m!1064019))

(declare-fun m!1064021 () Bool)

(assert (=> b!1154208 m!1064021))

(declare-fun m!1064023 () Bool)

(assert (=> mapNonEmpty!45245 m!1064023))

(assert (=> bm!54548 m!1063961))

(assert (=> b!1154205 m!1063945))

(check-sat (not b!1154217) (not b!1154203) b_and!39685 (not bm!54549) (not b!1154197) (not b!1154208) (not b!1154210) (not start!98812) (not b!1154214) (not b!1154196) (not b!1154219) (not bm!54548) (not b_lambda!19523) (not b!1154223) (not b!1154221) (not b!1154202) (not b!1154209) (not bm!54547) (not b!1154198) (not mapNonEmpty!45245) tp_is_empty!28947 (not b_next!24417) (not bm!54543) (not b!1154218) (not bm!54546) (not b!1154216) (not b!1154205))
(check-sat b_and!39685 (not b_next!24417))
