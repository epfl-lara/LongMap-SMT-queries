; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98806 () Bool)

(assert start!98806)

(declare-fun b_free!24175 () Bool)

(declare-fun b_next!24175 () Bool)

(assert (=> start!98806 (= b_free!24175 (not b_next!24175))))

(declare-fun tp!85235 () Bool)

(declare-fun b_and!39201 () Bool)

(assert (=> start!98806 (= tp!85235 b_and!39201)))

(declare-datatypes ((array!74309 0))(
  ( (array!74310 (arr!35799 (Array (_ BitVec 32) (_ BitVec 64))) (size!36336 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74309)

(declare-fun b!1144385 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!651115 () Bool)

(declare-fun arrayContainsKey!0 (array!74309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144385 (= e!651115 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144386 () Bool)

(declare-datatypes ((Unit!37483 0))(
  ( (Unit!37484) )
))
(declare-fun e!651126 () Unit!37483)

(declare-fun e!651125 () Unit!37483)

(assert (=> b!1144386 (= e!651126 e!651125)))

(declare-fun c!112836 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!510194 () Bool)

(assert (=> b!1144386 (= c!112836 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510194))))

(declare-fun b!1144387 () Bool)

(declare-fun call!51707 () Bool)

(assert (=> b!1144387 call!51707))

(declare-fun lt!510199 () Unit!37483)

(declare-fun call!51711 () Unit!37483)

(assert (=> b!1144387 (= lt!510199 call!51711)))

(assert (=> b!1144387 (= e!651125 lt!510199)))

(declare-fun b!1144388 () Bool)

(declare-datatypes ((V!43401 0))(
  ( (V!43402 (val!14409 Int)) )
))
(declare-datatypes ((tuple2!18252 0))(
  ( (tuple2!18253 (_1!9137 (_ BitVec 64)) (_2!9137 V!43401)) )
))
(declare-datatypes ((List!25008 0))(
  ( (Nil!25005) (Cons!25004 (h!26222 tuple2!18252) (t!36167 List!25008)) )
))
(declare-datatypes ((ListLongMap!16229 0))(
  ( (ListLongMap!16230 (toList!8130 List!25008)) )
))
(declare-fun call!51714 () ListLongMap!16229)

(declare-fun call!51713 () ListLongMap!16229)

(declare-fun e!651114 () Bool)

(declare-fun -!1259 (ListLongMap!16229 (_ BitVec 64)) ListLongMap!16229)

(assert (=> b!1144388 (= e!651114 (= call!51714 (-!1259 call!51713 k0!934)))))

(declare-fun b!1144389 () Bool)

(declare-fun e!651122 () Bool)

(declare-fun e!651123 () Bool)

(assert (=> b!1144389 (= e!651122 (not e!651123))))

(declare-fun res!762151 () Bool)

(assert (=> b!1144389 (=> res!762151 e!651123)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144389 (= res!762151 (bvsgt from!1455 i!673))))

(assert (=> b!1144389 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510202 () Unit!37483)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74309 (_ BitVec 64) (_ BitVec 32)) Unit!37483)

(assert (=> b!1144389 (= lt!510202 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44882 () Bool)

(declare-fun mapRes!44882 () Bool)

(declare-fun tp!85236 () Bool)

(declare-fun e!651118 () Bool)

(assert (=> mapNonEmpty!44882 (= mapRes!44882 (and tp!85236 e!651118))))

(declare-fun mapKey!44882 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13643 0))(
  ( (ValueCellFull!13643 (v!17042 V!43401)) (EmptyCell!13643) )
))
(declare-fun mapRest!44882 () (Array (_ BitVec 32) ValueCell!13643))

(declare-fun mapValue!44882 () ValueCell!13643)

(declare-datatypes ((array!74311 0))(
  ( (array!74312 (arr!35800 (Array (_ BitVec 32) ValueCell!13643)) (size!36337 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74311)

(assert (=> mapNonEmpty!44882 (= (arr!35800 _values!996) (store mapRest!44882 mapKey!44882 mapValue!44882))))

(declare-fun b!1144390 () Bool)

(declare-fun res!762159 () Bool)

(declare-fun e!651113 () Bool)

(assert (=> b!1144390 (=> (not res!762159) (not e!651113))))

(declare-datatypes ((List!25009 0))(
  ( (Nil!25006) (Cons!25005 (h!26223 (_ BitVec 64)) (t!36168 List!25009)) )
))
(declare-fun arrayNoDuplicates!0 (array!74309 (_ BitVec 32) List!25009) Bool)

(assert (=> b!1144390 (= res!762159 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25006))))

(declare-fun b!1144391 () Bool)

(declare-fun lt!510190 () Unit!37483)

(assert (=> b!1144391 (= e!651126 lt!510190)))

(assert (=> b!1144391 (= lt!510190 call!51711)))

(assert (=> b!1144391 call!51707))

(declare-fun b!1144392 () Bool)

(declare-fun e!651116 () Bool)

(assert (=> b!1144392 (= e!651116 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144393 () Bool)

(declare-fun Unit!37485 () Unit!37483)

(assert (=> b!1144393 (= e!651125 Unit!37485)))

(declare-fun b!1144394 () Bool)

(declare-fun res!762158 () Bool)

(assert (=> b!1144394 (=> (not res!762158) (not e!651113))))

(assert (=> b!1144394 (= res!762158 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36336 _keys!1208))))))

(declare-fun zeroValue!944 () V!43401)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!510197 () array!74309)

(declare-fun lt!510198 () array!74311)

(declare-fun minValue!944 () V!43401)

(declare-fun bm!51704 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4635 (array!74309 array!74311 (_ BitVec 32) (_ BitVec 32) V!43401 V!43401 (_ BitVec 32) Int) ListLongMap!16229)

(assert (=> bm!51704 (= call!51714 (getCurrentListMapNoExtraKeys!4635 lt!510197 lt!510198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144395 () Bool)

(declare-fun e!651127 () Unit!37483)

(declare-fun Unit!37486 () Unit!37483)

(assert (=> b!1144395 (= e!651127 Unit!37486)))

(declare-fun b!1144396 () Bool)

(declare-fun tp_is_empty!28705 () Bool)

(assert (=> b!1144396 (= e!651118 tp_is_empty!28705)))

(declare-fun bm!51705 () Bool)

(declare-fun call!51712 () Bool)

(assert (=> bm!51705 (= call!51707 call!51712)))

(declare-fun b!1144397 () Bool)

(declare-fun res!762157 () Bool)

(assert (=> b!1144397 (=> (not res!762157) (not e!651113))))

(assert (=> b!1144397 (= res!762157 (= (select (arr!35799 _keys!1208) i!673) k0!934))))

(declare-fun b!1144398 () Bool)

(declare-fun Unit!37487 () Unit!37483)

(assert (=> b!1144398 (= e!651127 Unit!37487)))

(assert (=> b!1144398 (= lt!510194 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112831 () Bool)

(assert (=> b!1144398 (= c!112831 (and (not lt!510194) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510201 () Unit!37483)

(declare-fun e!651119 () Unit!37483)

(assert (=> b!1144398 (= lt!510201 e!651119)))

(declare-fun lt!510191 () Unit!37483)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!402 (array!74309 array!74311 (_ BitVec 32) (_ BitVec 32) V!43401 V!43401 (_ BitVec 64) (_ BitVec 32) Int) Unit!37483)

(assert (=> b!1144398 (= lt!510191 (lemmaListMapContainsThenArrayContainsFrom!402 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112832 () Bool)

(assert (=> b!1144398 (= c!112832 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762146 () Bool)

(assert (=> b!1144398 (= res!762146 e!651116)))

(assert (=> b!1144398 (=> (not res!762146) (not e!651115))))

(assert (=> b!1144398 e!651115))

(declare-fun lt!510196 () Unit!37483)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74309 (_ BitVec 32) (_ BitVec 32)) Unit!37483)

(assert (=> b!1144398 (= lt!510196 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1144398 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25006)))

(declare-fun lt!510188 () Unit!37483)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74309 (_ BitVec 64) (_ BitVec 32) List!25009) Unit!37483)

(assert (=> b!1144398 (= lt!510188 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25006))))

(assert (=> b!1144398 false))

(declare-fun b!1144399 () Bool)

(declare-fun res!762156 () Bool)

(assert (=> b!1144399 (=> (not res!762156) (not e!651122))))

(assert (=> b!1144399 (= res!762156 (arrayNoDuplicates!0 lt!510197 #b00000000000000000000000000000000 Nil!25006))))

(declare-fun mapIsEmpty!44882 () Bool)

(assert (=> mapIsEmpty!44882 mapRes!44882))

(declare-fun b!1144400 () Bool)

(declare-fun e!651112 () Bool)

(assert (=> b!1144400 (= e!651112 tp_is_empty!28705)))

(declare-fun b!1144401 () Bool)

(declare-fun res!762149 () Bool)

(assert (=> b!1144401 (=> (not res!762149) (not e!651113))))

(assert (=> b!1144401 (= res!762149 (and (= (size!36337 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36336 _keys!1208) (size!36337 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1144402 () Bool)

(declare-fun res!762152 () Bool)

(assert (=> b!1144402 (=> (not res!762152) (not e!651113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144402 (= res!762152 (validKeyInArray!0 k0!934))))

(declare-fun bm!51706 () Bool)

(declare-fun call!51709 () Unit!37483)

(declare-fun c!112833 () Bool)

(declare-fun lt!510203 () ListLongMap!16229)

(declare-fun addStillContains!802 (ListLongMap!16229 (_ BitVec 64) V!43401 (_ BitVec 64)) Unit!37483)

(assert (=> bm!51706 (= call!51709 (addStillContains!802 lt!510203 (ite (or c!112831 c!112833) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112831 c!112833) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!51707 () Bool)

(assert (=> bm!51707 (= call!51713 (getCurrentListMapNoExtraKeys!4635 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144403 () Bool)

(declare-fun res!762148 () Bool)

(assert (=> b!1144403 (=> (not res!762148) (not e!651113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74309 (_ BitVec 32)) Bool)

(assert (=> b!1144403 (= res!762148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!510205 () ListLongMap!16229)

(declare-fun bm!51708 () Bool)

(declare-fun call!51710 () ListLongMap!16229)

(declare-fun contains!6674 (ListLongMap!16229 (_ BitVec 64)) Bool)

(assert (=> bm!51708 (= call!51712 (contains!6674 (ite c!112831 lt!510205 call!51710) k0!934))))

(declare-fun b!1144404 () Bool)

(assert (=> b!1144404 (= e!651116 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510194) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1144405 () Bool)

(assert (=> b!1144405 (= e!651113 e!651122)))

(declare-fun res!762155 () Bool)

(assert (=> b!1144405 (=> (not res!762155) (not e!651122))))

(assert (=> b!1144405 (= res!762155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510197 mask!1564))))

(assert (=> b!1144405 (= lt!510197 (array!74310 (store (arr!35799 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36336 _keys!1208)))))

(declare-fun bm!51709 () Bool)

(declare-fun call!51708 () ListLongMap!16229)

(assert (=> bm!51709 (= call!51710 call!51708)))

(declare-fun b!1144406 () Bool)

(declare-fun e!651124 () Bool)

(assert (=> b!1144406 (= e!651124 true)))

(declare-fun lt!510208 () V!43401)

(declare-fun +!3575 (ListLongMap!16229 tuple2!18252) ListLongMap!16229)

(assert (=> b!1144406 (= (-!1259 (+!3575 lt!510203 (tuple2!18253 (select (arr!35799 _keys!1208) from!1455) lt!510208)) (select (arr!35799 _keys!1208) from!1455)) lt!510203)))

(declare-fun lt!510195 () Unit!37483)

(declare-fun addThenRemoveForNewKeyIsSame!116 (ListLongMap!16229 (_ BitVec 64) V!43401) Unit!37483)

(assert (=> b!1144406 (= lt!510195 (addThenRemoveForNewKeyIsSame!116 lt!510203 (select (arr!35799 _keys!1208) from!1455) lt!510208))))

(declare-fun lt!510204 () V!43401)

(declare-fun get!18219 (ValueCell!13643 V!43401) V!43401)

(assert (=> b!1144406 (= lt!510208 (get!18219 (select (arr!35800 _values!996) from!1455) lt!510204))))

(declare-fun lt!510189 () Unit!37483)

(assert (=> b!1144406 (= lt!510189 e!651127)))

(declare-fun c!112835 () Bool)

(assert (=> b!1144406 (= c!112835 (contains!6674 lt!510203 k0!934))))

(assert (=> b!1144406 (= lt!510203 (getCurrentListMapNoExtraKeys!4635 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51710 () Bool)

(assert (=> bm!51710 (= call!51711 call!51709)))

(declare-fun b!1144407 () Bool)

(declare-fun res!762150 () Bool)

(assert (=> b!1144407 (=> (not res!762150) (not e!651113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144407 (= res!762150 (validMask!0 mask!1564))))

(declare-fun bm!51711 () Bool)

(assert (=> bm!51711 (= call!51708 (+!3575 (ite c!112831 lt!510205 lt!510203) (ite c!112831 (tuple2!18253 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112833 (tuple2!18253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18253 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1144408 () Bool)

(assert (=> b!1144408 (contains!6674 call!51708 k0!934)))

(declare-fun lt!510207 () Unit!37483)

(assert (=> b!1144408 (= lt!510207 (addStillContains!802 lt!510205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1144408 call!51712))

(assert (=> b!1144408 (= lt!510205 (+!3575 lt!510203 (tuple2!18253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510206 () Unit!37483)

(assert (=> b!1144408 (= lt!510206 call!51709)))

(assert (=> b!1144408 (= e!651119 lt!510207)))

(declare-fun res!762147 () Bool)

(assert (=> start!98806 (=> (not res!762147) (not e!651113))))

(assert (=> start!98806 (= res!762147 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36336 _keys!1208))))))

(assert (=> start!98806 e!651113))

(assert (=> start!98806 tp_is_empty!28705))

(declare-fun array_inv!27478 (array!74309) Bool)

(assert (=> start!98806 (array_inv!27478 _keys!1208)))

(assert (=> start!98806 true))

(assert (=> start!98806 tp!85235))

(declare-fun e!651120 () Bool)

(declare-fun array_inv!27479 (array!74311) Bool)

(assert (=> start!98806 (and (array_inv!27479 _values!996) e!651120)))

(declare-fun b!1144409 () Bool)

(declare-fun e!651121 () Bool)

(assert (=> b!1144409 (= e!651123 e!651121)))

(declare-fun res!762154 () Bool)

(assert (=> b!1144409 (=> res!762154 e!651121)))

(assert (=> b!1144409 (= res!762154 (not (= from!1455 i!673)))))

(declare-fun lt!510192 () ListLongMap!16229)

(assert (=> b!1144409 (= lt!510192 (getCurrentListMapNoExtraKeys!4635 lt!510197 lt!510198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1144409 (= lt!510198 (array!74312 (store (arr!35800 _values!996) i!673 (ValueCellFull!13643 lt!510204)) (size!36337 _values!996)))))

(declare-fun dynLambda!2669 (Int (_ BitVec 64)) V!43401)

(assert (=> b!1144409 (= lt!510204 (dynLambda!2669 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510200 () ListLongMap!16229)

(assert (=> b!1144409 (= lt!510200 (getCurrentListMapNoExtraKeys!4635 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1144410 () Bool)

(assert (=> b!1144410 (= e!651114 (= call!51714 call!51713))))

(declare-fun b!1144411 () Bool)

(assert (=> b!1144411 (= c!112833 (and (not lt!510194) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1144411 (= e!651119 e!651126)))

(declare-fun b!1144412 () Bool)

(assert (=> b!1144412 (= e!651120 (and e!651112 mapRes!44882))))

(declare-fun condMapEmpty!44882 () Bool)

(declare-fun mapDefault!44882 () ValueCell!13643)

(assert (=> b!1144412 (= condMapEmpty!44882 (= (arr!35800 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13643)) mapDefault!44882)))))

(declare-fun b!1144413 () Bool)

(assert (=> b!1144413 (= e!651121 e!651124)))

(declare-fun res!762153 () Bool)

(assert (=> b!1144413 (=> res!762153 e!651124)))

(assert (=> b!1144413 (= res!762153 (not (= (select (arr!35799 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1144413 e!651114))

(declare-fun c!112834 () Bool)

(assert (=> b!1144413 (= c!112834 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510193 () Unit!37483)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!511 (array!74309 array!74311 (_ BitVec 32) (_ BitVec 32) V!43401 V!43401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37483)

(assert (=> b!1144413 (= lt!510193 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98806 res!762147) b!1144407))

(assert (= (and b!1144407 res!762150) b!1144401))

(assert (= (and b!1144401 res!762149) b!1144403))

(assert (= (and b!1144403 res!762148) b!1144390))

(assert (= (and b!1144390 res!762159) b!1144394))

(assert (= (and b!1144394 res!762158) b!1144402))

(assert (= (and b!1144402 res!762152) b!1144397))

(assert (= (and b!1144397 res!762157) b!1144405))

(assert (= (and b!1144405 res!762155) b!1144399))

(assert (= (and b!1144399 res!762156) b!1144389))

(assert (= (and b!1144389 (not res!762151)) b!1144409))

(assert (= (and b!1144409 (not res!762154)) b!1144413))

(assert (= (and b!1144413 c!112834) b!1144388))

(assert (= (and b!1144413 (not c!112834)) b!1144410))

(assert (= (or b!1144388 b!1144410) bm!51707))

(assert (= (or b!1144388 b!1144410) bm!51704))

(assert (= (and b!1144413 (not res!762153)) b!1144406))

(assert (= (and b!1144406 c!112835) b!1144398))

(assert (= (and b!1144406 (not c!112835)) b!1144395))

(assert (= (and b!1144398 c!112831) b!1144408))

(assert (= (and b!1144398 (not c!112831)) b!1144411))

(assert (= (and b!1144411 c!112833) b!1144391))

(assert (= (and b!1144411 (not c!112833)) b!1144386))

(assert (= (and b!1144386 c!112836) b!1144387))

(assert (= (and b!1144386 (not c!112836)) b!1144393))

(assert (= (or b!1144391 b!1144387) bm!51710))

(assert (= (or b!1144391 b!1144387) bm!51709))

(assert (= (or b!1144391 b!1144387) bm!51705))

(assert (= (or b!1144408 bm!51705) bm!51708))

(assert (= (or b!1144408 bm!51710) bm!51706))

(assert (= (or b!1144408 bm!51709) bm!51711))

(assert (= (and b!1144398 c!112832) b!1144392))

(assert (= (and b!1144398 (not c!112832)) b!1144404))

(assert (= (and b!1144398 res!762146) b!1144385))

(assert (= (and b!1144412 condMapEmpty!44882) mapIsEmpty!44882))

(assert (= (and b!1144412 (not condMapEmpty!44882)) mapNonEmpty!44882))

(get-info :version)

(assert (= (and mapNonEmpty!44882 ((_ is ValueCellFull!13643) mapValue!44882)) b!1144396))

(assert (= (and b!1144412 ((_ is ValueCellFull!13643) mapDefault!44882)) b!1144400))

(assert (= start!98806 b!1144412))

(declare-fun b_lambda!19275 () Bool)

(assert (=> (not b_lambda!19275) (not b!1144409)))

(declare-fun t!36166 () Bool)

(declare-fun tb!8979 () Bool)

(assert (=> (and start!98806 (= defaultEntry!1004 defaultEntry!1004) t!36166) tb!8979))

(declare-fun result!18531 () Bool)

(assert (=> tb!8979 (= result!18531 tp_is_empty!28705)))

(assert (=> b!1144409 t!36166))

(declare-fun b_and!39203 () Bool)

(assert (= b_and!39201 (and (=> t!36166 result!18531) b_and!39203)))

(declare-fun m!1055855 () Bool)

(assert (=> b!1144398 m!1055855))

(declare-fun m!1055857 () Bool)

(assert (=> b!1144398 m!1055857))

(declare-fun m!1055859 () Bool)

(assert (=> b!1144398 m!1055859))

(declare-fun m!1055861 () Bool)

(assert (=> b!1144398 m!1055861))

(declare-fun m!1055863 () Bool)

(assert (=> b!1144413 m!1055863))

(declare-fun m!1055865 () Bool)

(assert (=> b!1144413 m!1055865))

(declare-fun m!1055867 () Bool)

(assert (=> b!1144406 m!1055867))

(declare-fun m!1055869 () Bool)

(assert (=> b!1144406 m!1055869))

(declare-fun m!1055871 () Bool)

(assert (=> b!1144406 m!1055871))

(declare-fun m!1055873 () Bool)

(assert (=> b!1144406 m!1055873))

(declare-fun m!1055875 () Bool)

(assert (=> b!1144406 m!1055875))

(assert (=> b!1144406 m!1055863))

(declare-fun m!1055877 () Bool)

(assert (=> b!1144406 m!1055877))

(assert (=> b!1144406 m!1055863))

(declare-fun m!1055879 () Bool)

(assert (=> b!1144406 m!1055879))

(assert (=> b!1144406 m!1055863))

(assert (=> b!1144406 m!1055871))

(assert (=> b!1144406 m!1055875))

(declare-fun m!1055881 () Bool)

(assert (=> b!1144389 m!1055881))

(declare-fun m!1055883 () Bool)

(assert (=> b!1144389 m!1055883))

(declare-fun m!1055885 () Bool)

(assert (=> mapNonEmpty!44882 m!1055885))

(declare-fun m!1055887 () Bool)

(assert (=> b!1144399 m!1055887))

(declare-fun m!1055889 () Bool)

(assert (=> b!1144408 m!1055889))

(declare-fun m!1055891 () Bool)

(assert (=> b!1144408 m!1055891))

(declare-fun m!1055893 () Bool)

(assert (=> b!1144408 m!1055893))

(assert (=> bm!51707 m!1055867))

(declare-fun m!1055895 () Bool)

(assert (=> bm!51706 m!1055895))

(declare-fun m!1055897 () Bool)

(assert (=> bm!51708 m!1055897))

(declare-fun m!1055899 () Bool)

(assert (=> bm!51711 m!1055899))

(declare-fun m!1055901 () Bool)

(assert (=> b!1144405 m!1055901))

(declare-fun m!1055903 () Bool)

(assert (=> b!1144405 m!1055903))

(declare-fun m!1055905 () Bool)

(assert (=> b!1144390 m!1055905))

(declare-fun m!1055907 () Bool)

(assert (=> b!1144392 m!1055907))

(assert (=> b!1144385 m!1055907))

(declare-fun m!1055909 () Bool)

(assert (=> b!1144397 m!1055909))

(declare-fun m!1055911 () Bool)

(assert (=> b!1144409 m!1055911))

(declare-fun m!1055913 () Bool)

(assert (=> b!1144409 m!1055913))

(declare-fun m!1055915 () Bool)

(assert (=> b!1144409 m!1055915))

(declare-fun m!1055917 () Bool)

(assert (=> b!1144409 m!1055917))

(declare-fun m!1055919 () Bool)

(assert (=> start!98806 m!1055919))

(declare-fun m!1055921 () Bool)

(assert (=> start!98806 m!1055921))

(declare-fun m!1055923 () Bool)

(assert (=> bm!51704 m!1055923))

(declare-fun m!1055925 () Bool)

(assert (=> b!1144403 m!1055925))

(declare-fun m!1055927 () Bool)

(assert (=> b!1144388 m!1055927))

(declare-fun m!1055929 () Bool)

(assert (=> b!1144407 m!1055929))

(declare-fun m!1055931 () Bool)

(assert (=> b!1144402 m!1055931))

(check-sat (not b!1144385) (not b!1144413) (not b_next!24175) (not bm!51706) (not b!1144399) (not b!1144388) (not b!1144406) (not bm!51707) (not bm!51704) (not b!1144407) (not b!1144403) (not b!1144390) tp_is_empty!28705 (not b!1144408) (not start!98806) (not b!1144398) (not bm!51708) (not b!1144389) (not b!1144405) b_and!39203 (not b!1144402) (not bm!51711) (not b!1144409) (not b_lambda!19275) (not b!1144392) (not mapNonEmpty!44882))
(check-sat b_and!39203 (not b_next!24175))
