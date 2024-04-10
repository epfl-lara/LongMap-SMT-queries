; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98156 () Bool)

(assert start!98156)

(declare-fun b_free!23857 () Bool)

(declare-fun b_next!23857 () Bool)

(assert (=> start!98156 (= b_free!23857 (not b_next!23857))))

(declare-fun tp!84275 () Bool)

(declare-fun b_and!38497 () Bool)

(assert (=> start!98156 (= tp!84275 b_and!38497)))

(declare-datatypes ((V!42977 0))(
  ( (V!42978 (val!14250 Int)) )
))
(declare-datatypes ((tuple2!17936 0))(
  ( (tuple2!17937 (_1!8979 (_ BitVec 64)) (_2!8979 V!42977)) )
))
(declare-datatypes ((List!24704 0))(
  ( (Nil!24701) (Cons!24700 (h!25909 tuple2!17936) (t!35553 List!24704)) )
))
(declare-datatypes ((ListLongMap!15905 0))(
  ( (ListLongMap!15906 (toList!7968 List!24704)) )
))
(declare-fun call!47853 () ListLongMap!15905)

(declare-fun e!642321 () Bool)

(declare-fun b!1128597 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!47854 () ListLongMap!15905)

(declare-fun -!1150 (ListLongMap!15905 (_ BitVec 64)) ListLongMap!15905)

(assert (=> b!1128597 (= e!642321 (= call!47854 (-!1150 call!47853 k!934)))))

(declare-fun zeroValue!944 () V!42977)

(declare-datatypes ((array!73633 0))(
  ( (array!73634 (arr!35469 (Array (_ BitVec 32) (_ BitVec 64))) (size!36005 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73633)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47850 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13484 0))(
  ( (ValueCellFull!13484 (v!16883 V!42977)) (EmptyCell!13484) )
))
(declare-datatypes ((array!73635 0))(
  ( (array!73636 (arr!35470 (Array (_ BitVec 32) ValueCell!13484)) (size!36006 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73635)

(declare-fun minValue!944 () V!42977)

(declare-fun getCurrentListMapNoExtraKeys!4455 (array!73633 array!73635 (_ BitVec 32) (_ BitVec 32) V!42977 V!42977 (_ BitVec 32) Int) ListLongMap!15905)

(assert (=> bm!47850 (= call!47853 (getCurrentListMapNoExtraKeys!4455 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128598 () Bool)

(declare-fun res!754224 () Bool)

(declare-fun e!642326 () Bool)

(assert (=> b!1128598 (=> (not res!754224) (not e!642326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128598 (= res!754224 (validKeyInArray!0 k!934))))

(declare-fun b!1128599 () Bool)

(declare-fun e!642327 () Bool)

(declare-fun tp_is_empty!28387 () Bool)

(assert (=> b!1128599 (= e!642327 tp_is_empty!28387)))

(declare-fun b!1128600 () Bool)

(declare-fun e!642323 () Bool)

(assert (=> b!1128600 (= e!642323 (or (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36005 _keys!1208)))))))

(declare-fun res!754227 () Bool)

(assert (=> start!98156 (=> (not res!754227) (not e!642326))))

(assert (=> start!98156 (= res!754227 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36005 _keys!1208))))))

(assert (=> start!98156 e!642326))

(assert (=> start!98156 tp_is_empty!28387))

(declare-fun array_inv!27214 (array!73633) Bool)

(assert (=> start!98156 (array_inv!27214 _keys!1208)))

(assert (=> start!98156 true))

(assert (=> start!98156 tp!84275))

(declare-fun e!642320 () Bool)

(declare-fun array_inv!27215 (array!73635) Bool)

(assert (=> start!98156 (and (array_inv!27215 _values!996) e!642320)))

(declare-fun b!1128601 () Bool)

(declare-fun res!754236 () Bool)

(assert (=> b!1128601 (=> (not res!754236) (not e!642326))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128601 (= res!754236 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36005 _keys!1208))))))

(declare-fun b!1128602 () Bool)

(declare-fun res!754230 () Bool)

(assert (=> b!1128602 (=> (not res!754230) (not e!642326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73633 (_ BitVec 32)) Bool)

(assert (=> b!1128602 (= res!754230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128603 () Bool)

(declare-fun e!642324 () Bool)

(assert (=> b!1128603 (= e!642326 e!642324)))

(declare-fun res!754233 () Bool)

(assert (=> b!1128603 (=> (not res!754233) (not e!642324))))

(declare-fun lt!501019 () array!73633)

(assert (=> b!1128603 (= res!754233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501019 mask!1564))))

(assert (=> b!1128603 (= lt!501019 (array!73634 (store (arr!35469 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36005 _keys!1208)))))

(declare-fun b!1128604 () Bool)

(declare-fun e!642325 () Bool)

(assert (=> b!1128604 (= e!642324 (not e!642325))))

(declare-fun res!754225 () Bool)

(assert (=> b!1128604 (=> res!754225 e!642325)))

(assert (=> b!1128604 (= res!754225 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128604 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36974 0))(
  ( (Unit!36975) )
))
(declare-fun lt!501021 () Unit!36974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73633 (_ BitVec 64) (_ BitVec 32)) Unit!36974)

(assert (=> b!1128604 (= lt!501021 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1128605 () Bool)

(declare-fun e!642318 () Bool)

(assert (=> b!1128605 (= e!642325 e!642318)))

(declare-fun res!754234 () Bool)

(assert (=> b!1128605 (=> res!754234 e!642318)))

(assert (=> b!1128605 (= res!754234 (not (= from!1455 i!673)))))

(declare-fun lt!501018 () array!73635)

(declare-fun lt!501023 () ListLongMap!15905)

(assert (=> b!1128605 (= lt!501023 (getCurrentListMapNoExtraKeys!4455 lt!501019 lt!501018 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2536 (Int (_ BitVec 64)) V!42977)

(assert (=> b!1128605 (= lt!501018 (array!73636 (store (arr!35470 _values!996) i!673 (ValueCellFull!13484 (dynLambda!2536 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36006 _values!996)))))

(declare-fun lt!501020 () ListLongMap!15905)

(assert (=> b!1128605 (= lt!501020 (getCurrentListMapNoExtraKeys!4455 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128606 () Bool)

(assert (=> b!1128606 (= e!642318 e!642323)))

(declare-fun res!754235 () Bool)

(assert (=> b!1128606 (=> res!754235 e!642323)))

(assert (=> b!1128606 (= res!754235 (not (= (select (arr!35469 _keys!1208) from!1455) k!934)))))

(assert (=> b!1128606 e!642321))

(declare-fun c!109776 () Bool)

(assert (=> b!1128606 (= c!109776 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501022 () Unit!36974)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!404 (array!73633 array!73635 (_ BitVec 32) (_ BitVec 32) V!42977 V!42977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36974)

(assert (=> b!1128606 (= lt!501022 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!404 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47851 () Bool)

(assert (=> bm!47851 (= call!47854 (getCurrentListMapNoExtraKeys!4455 lt!501019 lt!501018 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128607 () Bool)

(declare-fun res!754228 () Bool)

(assert (=> b!1128607 (=> (not res!754228) (not e!642326))))

(declare-datatypes ((List!24705 0))(
  ( (Nil!24702) (Cons!24701 (h!25910 (_ BitVec 64)) (t!35554 List!24705)) )
))
(declare-fun arrayNoDuplicates!0 (array!73633 (_ BitVec 32) List!24705) Bool)

(assert (=> b!1128607 (= res!754228 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24702))))

(declare-fun b!1128608 () Bool)

(declare-fun e!642322 () Bool)

(assert (=> b!1128608 (= e!642322 tp_is_empty!28387)))

(declare-fun b!1128609 () Bool)

(declare-fun res!754231 () Bool)

(assert (=> b!1128609 (=> res!754231 e!642323)))

(declare-fun contains!6492 (ListLongMap!15905 (_ BitVec 64)) Bool)

(assert (=> b!1128609 (= res!754231 (not (contains!6492 (getCurrentListMapNoExtraKeys!4455 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934)))))

(declare-fun b!1128610 () Bool)

(declare-fun res!754237 () Bool)

(assert (=> b!1128610 (=> (not res!754237) (not e!642326))))

(assert (=> b!1128610 (= res!754237 (and (= (size!36006 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36005 _keys!1208) (size!36006 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44398 () Bool)

(declare-fun mapRes!44398 () Bool)

(declare-fun tp!84274 () Bool)

(assert (=> mapNonEmpty!44398 (= mapRes!44398 (and tp!84274 e!642322))))

(declare-fun mapKey!44398 () (_ BitVec 32))

(declare-fun mapRest!44398 () (Array (_ BitVec 32) ValueCell!13484))

(declare-fun mapValue!44398 () ValueCell!13484)

(assert (=> mapNonEmpty!44398 (= (arr!35470 _values!996) (store mapRest!44398 mapKey!44398 mapValue!44398))))

(declare-fun b!1128611 () Bool)

(declare-fun res!754232 () Bool)

(assert (=> b!1128611 (=> (not res!754232) (not e!642326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128611 (= res!754232 (validMask!0 mask!1564))))

(declare-fun b!1128612 () Bool)

(assert (=> b!1128612 (= e!642321 (= call!47854 call!47853))))

(declare-fun b!1128613 () Bool)

(assert (=> b!1128613 (= e!642320 (and e!642327 mapRes!44398))))

(declare-fun condMapEmpty!44398 () Bool)

(declare-fun mapDefault!44398 () ValueCell!13484)

