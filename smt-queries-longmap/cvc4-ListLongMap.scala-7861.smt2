; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97914 () Bool)

(assert start!97914)

(declare-fun b_free!23615 () Bool)

(declare-fun b_next!23615 () Bool)

(assert (=> start!97914 (= b_free!23615 (not b_next!23615))))

(declare-fun tp!83548 () Bool)

(declare-fun b_and!38013 () Bool)

(assert (=> start!97914 (= tp!83548 b_and!38013)))

(declare-fun b!1121640 () Bool)

(declare-fun e!638619 () Bool)

(declare-fun e!638622 () Bool)

(assert (=> b!1121640 (= e!638619 (not e!638622))))

(declare-fun res!749324 () Bool)

(assert (=> b!1121640 (=> res!749324 e!638622)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121640 (= res!749324 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73171 0))(
  ( (array!73172 (arr!35238 (Array (_ BitVec 32) (_ BitVec 64))) (size!35774 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73171)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121640 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36794 0))(
  ( (Unit!36795) )
))
(declare-fun lt!498426 () Unit!36794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73171 (_ BitVec 64) (_ BitVec 32)) Unit!36794)

(assert (=> b!1121640 (= lt!498426 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1121641 () Bool)

(declare-fun res!749327 () Bool)

(declare-fun e!638617 () Bool)

(assert (=> b!1121641 (=> (not res!749327) (not e!638617))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121641 (= res!749327 (validMask!0 mask!1564))))

(declare-fun b!1121642 () Bool)

(declare-fun e!638621 () Bool)

(assert (=> b!1121642 (= e!638621 true)))

(declare-fun e!638625 () Bool)

(assert (=> b!1121642 e!638625))

(declare-fun c!109413 () Bool)

(assert (=> b!1121642 (= c!109413 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42653 0))(
  ( (V!42654 (val!14129 Int)) )
))
(declare-fun zeroValue!944 () V!42653)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!498429 () Unit!36794)

(declare-datatypes ((ValueCell!13363 0))(
  ( (ValueCellFull!13363 (v!16762 V!42653)) (EmptyCell!13363) )
))
(declare-datatypes ((array!73173 0))(
  ( (array!73174 (arr!35239 (Array (_ BitVec 32) ValueCell!13363)) (size!35775 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73173)

(declare-fun minValue!944 () V!42653)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!325 (array!73171 array!73173 (_ BitVec 32) (_ BitVec 32) V!42653 V!42653 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36794)

(assert (=> b!1121642 (= lt!498429 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121643 () Bool)

(declare-fun res!749331 () Bool)

(assert (=> b!1121643 (=> (not res!749331) (not e!638617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73171 (_ BitVec 32)) Bool)

(assert (=> b!1121643 (= res!749331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121644 () Bool)

(assert (=> b!1121644 (= e!638617 e!638619)))

(declare-fun res!749333 () Bool)

(assert (=> b!1121644 (=> (not res!749333) (not e!638619))))

(declare-fun lt!498428 () array!73171)

(assert (=> b!1121644 (= res!749333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498428 mask!1564))))

(assert (=> b!1121644 (= lt!498428 (array!73172 (store (arr!35238 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35774 _keys!1208)))))

(declare-fun b!1121645 () Bool)

(declare-fun res!749328 () Bool)

(assert (=> b!1121645 (=> (not res!749328) (not e!638617))))

(assert (=> b!1121645 (= res!749328 (= (select (arr!35238 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!44035 () Bool)

(declare-fun mapRes!44035 () Bool)

(assert (=> mapIsEmpty!44035 mapRes!44035))

(declare-fun mapNonEmpty!44035 () Bool)

(declare-fun tp!83549 () Bool)

(declare-fun e!638624 () Bool)

(assert (=> mapNonEmpty!44035 (= mapRes!44035 (and tp!83549 e!638624))))

(declare-fun mapKey!44035 () (_ BitVec 32))

(declare-fun mapRest!44035 () (Array (_ BitVec 32) ValueCell!13363))

(declare-fun mapValue!44035 () ValueCell!13363)

(assert (=> mapNonEmpty!44035 (= (arr!35239 _values!996) (store mapRest!44035 mapKey!44035 mapValue!44035))))

(declare-fun lt!498431 () array!73173)

(declare-fun bm!47124 () Bool)

(declare-datatypes ((tuple2!17736 0))(
  ( (tuple2!17737 (_1!8879 (_ BitVec 64)) (_2!8879 V!42653)) )
))
(declare-datatypes ((List!24518 0))(
  ( (Nil!24515) (Cons!24514 (h!25723 tuple2!17736) (t!35125 List!24518)) )
))
(declare-datatypes ((ListLongMap!15705 0))(
  ( (ListLongMap!15706 (toList!7868 List!24518)) )
))
(declare-fun call!47128 () ListLongMap!15705)

(declare-fun getCurrentListMapNoExtraKeys!4357 (array!73171 array!73173 (_ BitVec 32) (_ BitVec 32) V!42653 V!42653 (_ BitVec 32) Int) ListLongMap!15705)

(assert (=> bm!47124 (= call!47128 (getCurrentListMapNoExtraKeys!4357 lt!498428 lt!498431 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121646 () Bool)

(declare-fun res!749334 () Bool)

(assert (=> b!1121646 (=> (not res!749334) (not e!638617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121646 (= res!749334 (validKeyInArray!0 k!934))))

(declare-fun b!1121647 () Bool)

(declare-fun e!638618 () Bool)

(declare-fun e!638620 () Bool)

(assert (=> b!1121647 (= e!638618 (and e!638620 mapRes!44035))))

(declare-fun condMapEmpty!44035 () Bool)

(declare-fun mapDefault!44035 () ValueCell!13363)

