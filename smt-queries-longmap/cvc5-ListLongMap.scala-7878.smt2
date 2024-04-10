; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98012 () Bool)

(assert start!98012)

(declare-fun b_free!23713 () Bool)

(declare-fun b_next!23713 () Bool)

(assert (=> start!98012 (= b_free!23713 (not b_next!23713))))

(declare-fun tp!83842 () Bool)

(declare-fun b_and!38209 () Bool)

(assert (=> start!98012 (= tp!83842 b_and!38209)))

(declare-fun b!1124450 () Bool)

(declare-fun res!751313 () Bool)

(declare-fun e!640109 () Bool)

(assert (=> b!1124450 (=> (not res!751313) (not e!640109))))

(declare-datatypes ((array!73353 0))(
  ( (array!73354 (arr!35329 (Array (_ BitVec 32) (_ BitVec 64))) (size!35865 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73353)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42785 0))(
  ( (V!42786 (val!14178 Int)) )
))
(declare-datatypes ((ValueCell!13412 0))(
  ( (ValueCellFull!13412 (v!16811 V!42785)) (EmptyCell!13412) )
))
(declare-datatypes ((array!73355 0))(
  ( (array!73356 (arr!35330 (Array (_ BitVec 32) ValueCell!13412)) (size!35866 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73355)

(assert (=> b!1124450 (= res!751313 (and (= (size!35866 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35865 _keys!1208) (size!35866 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124451 () Bool)

(declare-fun res!751307 () Bool)

(assert (=> b!1124451 (=> (not res!751307) (not e!640109))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1124451 (= res!751307 (= (select (arr!35329 _keys!1208) i!673) k!934))))

(declare-fun b!1124452 () Bool)

(declare-fun e!640116 () Bool)

(declare-fun tp_is_empty!28243 () Bool)

(assert (=> b!1124452 (= e!640116 tp_is_empty!28243)))

(declare-datatypes ((tuple2!17810 0))(
  ( (tuple2!17811 (_1!8916 (_ BitVec 64)) (_2!8916 V!42785)) )
))
(declare-datatypes ((List!24589 0))(
  ( (Nil!24586) (Cons!24585 (h!25794 tuple2!17810) (t!35294 List!24589)) )
))
(declare-datatypes ((ListLongMap!15779 0))(
  ( (ListLongMap!15780 (toList!7905 List!24589)) )
))
(declare-fun call!47422 () ListLongMap!15779)

(declare-fun b!1124453 () Bool)

(declare-fun e!640111 () Bool)

(declare-fun call!47421 () ListLongMap!15779)

(declare-fun -!1109 (ListLongMap!15779 (_ BitVec 64)) ListLongMap!15779)

(assert (=> b!1124453 (= e!640111 (= call!47422 (-!1109 call!47421 k!934)))))

(declare-fun b!1124454 () Bool)

(declare-fun e!640114 () Bool)

(assert (=> b!1124454 (= e!640114 true)))

(declare-fun lt!499467 () ListLongMap!15779)

(declare-fun zeroValue!944 () V!42785)

(declare-fun contains!6443 (ListLongMap!15779 (_ BitVec 64)) Bool)

(declare-fun +!3414 (ListLongMap!15779 tuple2!17810) ListLongMap!15779)

(assert (=> b!1124454 (contains!6443 (+!3414 lt!499467 (tuple2!17811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-datatypes ((Unit!36862 0))(
  ( (Unit!36863) )
))
(declare-fun lt!499472 () Unit!36862)

(declare-fun addStillContains!676 (ListLongMap!15779 (_ BitVec 64) V!42785 (_ BitVec 64)) Unit!36862)

(assert (=> b!1124454 (= lt!499472 (addStillContains!676 lt!499467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun b!1124455 () Bool)

(declare-fun e!640113 () Bool)

(assert (=> b!1124455 (= e!640113 e!640114)))

(declare-fun res!751303 () Bool)

(assert (=> b!1124455 (=> res!751303 e!640114)))

(assert (=> b!1124455 (= res!751303 (not (contains!6443 lt!499467 k!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42785)

(declare-fun getCurrentListMapNoExtraKeys!4393 (array!73353 array!73355 (_ BitVec 32) (_ BitVec 32) V!42785 V!42785 (_ BitVec 32) Int) ListLongMap!15779)

(assert (=> b!1124455 (= lt!499467 (getCurrentListMapNoExtraKeys!4393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124456 () Bool)

(declare-fun res!751312 () Bool)

(assert (=> b!1124456 (=> (not res!751312) (not e!640109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124456 (= res!751312 (validKeyInArray!0 k!934))))

(declare-fun b!1124457 () Bool)

(declare-fun e!640108 () Bool)

(assert (=> b!1124457 (= e!640109 e!640108)))

(declare-fun res!751314 () Bool)

(assert (=> b!1124457 (=> (not res!751314) (not e!640108))))

(declare-fun lt!499465 () array!73353)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73353 (_ BitVec 32)) Bool)

(assert (=> b!1124457 (= res!751314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499465 mask!1564))))

(assert (=> b!1124457 (= lt!499465 (array!73354 (store (arr!35329 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35865 _keys!1208)))))

(declare-fun b!1124458 () Bool)

(declare-fun res!751301 () Bool)

(assert (=> b!1124458 (=> (not res!751301) (not e!640108))))

(declare-datatypes ((List!24590 0))(
  ( (Nil!24587) (Cons!24586 (h!25795 (_ BitVec 64)) (t!35295 List!24590)) )
))
(declare-fun arrayNoDuplicates!0 (array!73353 (_ BitVec 32) List!24590) Bool)

(assert (=> b!1124458 (= res!751301 (arrayNoDuplicates!0 lt!499465 #b00000000000000000000000000000000 Nil!24587))))

(declare-fun b!1124459 () Bool)

(declare-fun e!640106 () Bool)

(assert (=> b!1124459 (= e!640106 e!640113)))

(declare-fun res!751302 () Bool)

(assert (=> b!1124459 (=> res!751302 e!640113)))

(assert (=> b!1124459 (= res!751302 (not (= (select (arr!35329 _keys!1208) from!1455) k!934)))))

(assert (=> b!1124459 e!640111))

(declare-fun c!109560 () Bool)

(assert (=> b!1124459 (= c!109560 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499471 () Unit!36862)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!355 (array!73353 array!73355 (_ BitVec 32) (_ BitVec 32) V!42785 V!42785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36862)

(assert (=> b!1124459 (= lt!499471 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44182 () Bool)

(declare-fun mapRes!44182 () Bool)

(declare-fun tp!83843 () Bool)

(assert (=> mapNonEmpty!44182 (= mapRes!44182 (and tp!83843 e!640116))))

(declare-fun mapValue!44182 () ValueCell!13412)

(declare-fun mapKey!44182 () (_ BitVec 32))

(declare-fun mapRest!44182 () (Array (_ BitVec 32) ValueCell!13412))

(assert (=> mapNonEmpty!44182 (= (arr!35330 _values!996) (store mapRest!44182 mapKey!44182 mapValue!44182))))

(declare-fun b!1124460 () Bool)

(declare-fun res!751311 () Bool)

(assert (=> b!1124460 (=> res!751311 e!640114)))

(assert (=> b!1124460 (= res!751311 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1124461 () Bool)

(declare-fun res!751315 () Bool)

(assert (=> b!1124461 (=> (not res!751315) (not e!640109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124461 (= res!751315 (validMask!0 mask!1564))))

(declare-fun bm!47418 () Bool)

(assert (=> bm!47418 (= call!47421 (getCurrentListMapNoExtraKeys!4393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44182 () Bool)

(assert (=> mapIsEmpty!44182 mapRes!44182))

(declare-fun res!751304 () Bool)

(assert (=> start!98012 (=> (not res!751304) (not e!640109))))

(assert (=> start!98012 (= res!751304 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35865 _keys!1208))))))

(assert (=> start!98012 e!640109))

(assert (=> start!98012 tp_is_empty!28243))

(declare-fun array_inv!27118 (array!73353) Bool)

(assert (=> start!98012 (array_inv!27118 _keys!1208)))

(assert (=> start!98012 true))

(assert (=> start!98012 tp!83842))

(declare-fun e!640107 () Bool)

(declare-fun array_inv!27119 (array!73355) Bool)

(assert (=> start!98012 (and (array_inv!27119 _values!996) e!640107)))

(declare-fun b!1124462 () Bool)

(declare-fun e!640115 () Bool)

(assert (=> b!1124462 (= e!640115 tp_is_empty!28243)))

(declare-fun b!1124463 () Bool)

(declare-fun res!751310 () Bool)

(assert (=> b!1124463 (=> (not res!751310) (not e!640109))))

(assert (=> b!1124463 (= res!751310 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35865 _keys!1208))))))

(declare-fun b!1124464 () Bool)

(declare-fun res!751305 () Bool)

(assert (=> b!1124464 (=> (not res!751305) (not e!640109))))

(assert (=> b!1124464 (= res!751305 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24587))))

(declare-fun b!1124465 () Bool)

(declare-fun e!640110 () Bool)

(assert (=> b!1124465 (= e!640110 e!640106)))

(declare-fun res!751309 () Bool)

(assert (=> b!1124465 (=> res!751309 e!640106)))

(assert (=> b!1124465 (= res!751309 (not (= from!1455 i!673)))))

(declare-fun lt!499469 () array!73355)

(declare-fun lt!499470 () ListLongMap!15779)

(assert (=> b!1124465 (= lt!499470 (getCurrentListMapNoExtraKeys!4393 lt!499465 lt!499469 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2488 (Int (_ BitVec 64)) V!42785)

(assert (=> b!1124465 (= lt!499469 (array!73356 (store (arr!35330 _values!996) i!673 (ValueCellFull!13412 (dynLambda!2488 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35866 _values!996)))))

(declare-fun lt!499466 () ListLongMap!15779)

(assert (=> b!1124465 (= lt!499466 (getCurrentListMapNoExtraKeys!4393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47419 () Bool)

(assert (=> bm!47419 (= call!47422 (getCurrentListMapNoExtraKeys!4393 lt!499465 lt!499469 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124466 () Bool)

(declare-fun res!751306 () Bool)

(assert (=> b!1124466 (=> (not res!751306) (not e!640109))))

(assert (=> b!1124466 (= res!751306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124467 () Bool)

(assert (=> b!1124467 (= e!640111 (= call!47422 call!47421))))

(declare-fun b!1124468 () Bool)

(assert (=> b!1124468 (= e!640108 (not e!640110))))

(declare-fun res!751308 () Bool)

(assert (=> b!1124468 (=> res!751308 e!640110)))

(assert (=> b!1124468 (= res!751308 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124468 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!499468 () Unit!36862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73353 (_ BitVec 64) (_ BitVec 32)) Unit!36862)

(assert (=> b!1124468 (= lt!499468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1124469 () Bool)

(assert (=> b!1124469 (= e!640107 (and e!640115 mapRes!44182))))

(declare-fun condMapEmpty!44182 () Bool)

(declare-fun mapDefault!44182 () ValueCell!13412)

