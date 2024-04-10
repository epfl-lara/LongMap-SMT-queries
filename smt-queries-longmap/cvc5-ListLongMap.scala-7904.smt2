; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98168 () Bool)

(assert start!98168)

(declare-fun b_free!23869 () Bool)

(declare-fun b_next!23869 () Bool)

(assert (=> start!98168 (= b_free!23869 (not b_next!23869))))

(declare-fun tp!84310 () Bool)

(declare-fun b_and!38521 () Bool)

(assert (=> start!98168 (= tp!84310 b_and!38521)))

(declare-fun b!1128956 () Bool)

(declare-fun res!754469 () Bool)

(declare-fun e!642516 () Bool)

(assert (=> b!1128956 (=> (not res!754469) (not e!642516))))

(declare-datatypes ((array!73655 0))(
  ( (array!73656 (arr!35480 (Array (_ BitVec 32) (_ BitVec 64))) (size!36016 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73655)

(declare-datatypes ((List!24714 0))(
  ( (Nil!24711) (Cons!24710 (h!25919 (_ BitVec 64)) (t!35575 List!24714)) )
))
(declare-fun arrayNoDuplicates!0 (array!73655 (_ BitVec 32) List!24714) Bool)

(assert (=> b!1128956 (= res!754469 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24711))))

(declare-datatypes ((V!42993 0))(
  ( (V!42994 (val!14256 Int)) )
))
(declare-datatypes ((tuple2!17946 0))(
  ( (tuple2!17947 (_1!8984 (_ BitVec 64)) (_2!8984 V!42993)) )
))
(declare-datatypes ((List!24715 0))(
  ( (Nil!24712) (Cons!24711 (h!25920 tuple2!17946) (t!35576 List!24715)) )
))
(declare-datatypes ((ListLongMap!15915 0))(
  ( (ListLongMap!15916 (toList!7973 List!24715)) )
))
(declare-fun call!47902 () ListLongMap!15915)

(declare-fun call!47908 () Bool)

(declare-fun lt!501155 () ListLongMap!15915)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!109801 () Bool)

(declare-fun bm!47898 () Bool)

(declare-fun contains!6496 (ListLongMap!15915 (_ BitVec 64)) Bool)

(assert (=> bm!47898 (= call!47908 (contains!6496 (ite c!109801 lt!501155 call!47902) k!934))))

(declare-fun b!1128957 () Bool)

(declare-datatypes ((Unit!36984 0))(
  ( (Unit!36985) )
))
(declare-fun e!642514 () Unit!36984)

(declare-fun e!642512 () Unit!36984)

(assert (=> b!1128957 (= e!642514 e!642512)))

(declare-fun c!109803 () Bool)

(declare-fun lt!501162 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1128957 (= c!109803 (and (not lt!501162) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!47899 () Bool)

(declare-fun call!47903 () Bool)

(assert (=> bm!47899 (= call!47903 call!47908)))

(declare-fun b!1128958 () Bool)

(declare-fun e!642522 () Bool)

(assert (=> b!1128958 (= e!642516 e!642522)))

(declare-fun res!754476 () Bool)

(assert (=> b!1128958 (=> (not res!754476) (not e!642522))))

(declare-fun lt!501166 () array!73655)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73655 (_ BitVec 32)) Bool)

(assert (=> b!1128958 (= res!754476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501166 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128958 (= lt!501166 (array!73656 (store (arr!35480 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36016 _keys!1208)))))

(declare-fun b!1128959 () Bool)

(declare-fun res!754481 () Bool)

(assert (=> b!1128959 (=> (not res!754481) (not e!642516))))

(declare-datatypes ((ValueCell!13490 0))(
  ( (ValueCellFull!13490 (v!16889 V!42993)) (EmptyCell!13490) )
))
(declare-datatypes ((array!73657 0))(
  ( (array!73658 (arr!35481 (Array (_ BitVec 32) ValueCell!13490)) (size!36017 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73657)

(assert (=> b!1128959 (= res!754481 (and (= (size!36017 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36016 _keys!1208) (size!36017 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128960 () Bool)

(declare-fun res!754483 () Bool)

(assert (=> b!1128960 (=> (not res!754483) (not e!642516))))

(assert (=> b!1128960 (= res!754483 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36016 _keys!1208))))))

(declare-fun b!1128962 () Bool)

(declare-fun e!642517 () Bool)

(declare-fun e!642513 () Bool)

(assert (=> b!1128962 (= e!642517 e!642513)))

(declare-fun res!754480 () Bool)

(assert (=> b!1128962 (=> res!754480 e!642513)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128962 (= res!754480 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42993)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42993)

(declare-fun lt!501163 () ListLongMap!15915)

(declare-fun lt!501156 () array!73657)

(declare-fun getCurrentListMapNoExtraKeys!4460 (array!73655 array!73657 (_ BitVec 32) (_ BitVec 32) V!42993 V!42993 (_ BitVec 32) Int) ListLongMap!15915)

(assert (=> b!1128962 (= lt!501163 (getCurrentListMapNoExtraKeys!4460 lt!501166 lt!501156 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2540 (Int (_ BitVec 64)) V!42993)

(assert (=> b!1128962 (= lt!501156 (array!73658 (store (arr!35481 _values!996) i!673 (ValueCellFull!13490 (dynLambda!2540 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36017 _values!996)))))

(declare-fun lt!501164 () ListLongMap!15915)

(assert (=> b!1128962 (= lt!501164 (getCurrentListMapNoExtraKeys!4460 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128963 () Bool)

(declare-fun e!642519 () Bool)

(declare-fun e!642521 () Bool)

(assert (=> b!1128963 (= e!642519 e!642521)))

(declare-fun res!754473 () Bool)

(assert (=> b!1128963 (=> res!754473 e!642521)))

(assert (=> b!1128963 (= res!754473 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36016 _keys!1208))))))

(declare-fun lt!501157 () Unit!36984)

(assert (=> b!1128963 (= lt!501157 e!642514)))

(assert (=> b!1128963 (= c!109801 (and (not lt!501162) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1128963 (= lt!501162 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!47906 () ListLongMap!15915)

(declare-fun c!109800 () Bool)

(declare-fun bm!47900 () Bool)

(assert (=> bm!47900 (= call!47906 (getCurrentListMapNoExtraKeys!4460 (ite c!109800 lt!501166 _keys!1208) (ite c!109800 lt!501156 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47905 () ListLongMap!15915)

(declare-fun b!1128964 () Bool)

(declare-fun e!642509 () Bool)

(declare-fun -!1155 (ListLongMap!15915 (_ BitVec 64)) ListLongMap!15915)

(assert (=> b!1128964 (= e!642509 (= call!47906 (-!1155 call!47905 k!934)))))

(declare-fun bm!47901 () Bool)

(assert (=> bm!47901 (= call!47905 (getCurrentListMapNoExtraKeys!4460 (ite c!109800 _keys!1208 lt!501166) (ite c!109800 _values!996 lt!501156) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128965 () Bool)

(declare-fun res!754471 () Bool)

(assert (=> b!1128965 (=> (not res!754471) (not e!642516))))

(assert (=> b!1128965 (= res!754471 (= (select (arr!35480 _keys!1208) i!673) k!934))))

(declare-fun b!1128966 () Bool)

(assert (=> b!1128966 (= e!642522 (not e!642517))))

(declare-fun res!754479 () Bool)

(assert (=> b!1128966 (=> res!754479 e!642517)))

(assert (=> b!1128966 (= res!754479 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128966 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501158 () Unit!36984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73655 (_ BitVec 64) (_ BitVec 32)) Unit!36984)

(assert (=> b!1128966 (= lt!501158 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1128967 () Bool)

(declare-fun res!754474 () Bool)

(assert (=> b!1128967 (=> (not res!754474) (not e!642516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128967 (= res!754474 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!44416 () Bool)

(declare-fun mapRes!44416 () Bool)

(declare-fun tp!84311 () Bool)

(declare-fun e!642510 () Bool)

(assert (=> mapNonEmpty!44416 (= mapRes!44416 (and tp!84311 e!642510))))

(declare-fun mapKey!44416 () (_ BitVec 32))

(declare-fun mapValue!44416 () ValueCell!13490)

(declare-fun mapRest!44416 () (Array (_ BitVec 32) ValueCell!13490))

(assert (=> mapNonEmpty!44416 (= (arr!35481 _values!996) (store mapRest!44416 mapKey!44416 mapValue!44416))))

(declare-fun b!1128968 () Bool)

(declare-fun e!642515 () Bool)

(declare-fun e!642508 () Bool)

(assert (=> b!1128968 (= e!642515 (and e!642508 mapRes!44416))))

(declare-fun condMapEmpty!44416 () Bool)

(declare-fun mapDefault!44416 () ValueCell!13490)

