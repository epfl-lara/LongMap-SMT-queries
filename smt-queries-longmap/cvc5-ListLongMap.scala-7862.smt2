; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97916 () Bool)

(assert start!97916)

(declare-fun b_free!23617 () Bool)

(declare-fun b_next!23617 () Bool)

(assert (=> start!97916 (= b_free!23617 (not b_next!23617))))

(declare-fun tp!83555 () Bool)

(declare-fun b_and!38017 () Bool)

(assert (=> start!97916 (= tp!83555 b_and!38017)))

(declare-datatypes ((V!42657 0))(
  ( (V!42658 (val!14130 Int)) )
))
(declare-datatypes ((tuple2!17738 0))(
  ( (tuple2!17739 (_1!8880 (_ BitVec 64)) (_2!8880 V!42657)) )
))
(declare-datatypes ((List!24519 0))(
  ( (Nil!24516) (Cons!24515 (h!25724 tuple2!17738) (t!35128 List!24519)) )
))
(declare-datatypes ((ListLongMap!15707 0))(
  ( (ListLongMap!15708 (toList!7869 List!24519)) )
))
(declare-fun call!47133 () ListLongMap!15707)

(declare-fun e!638650 () Bool)

(declare-fun call!47134 () ListLongMap!15707)

(declare-fun b!1121693 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1078 (ListLongMap!15707 (_ BitVec 64)) ListLongMap!15707)

(assert (=> b!1121693 (= e!638650 (= call!47133 (-!1078 call!47134 k!934)))))

(declare-fun b!1121694 () Bool)

(declare-fun res!749360 () Bool)

(declare-fun e!638645 () Bool)

(assert (=> b!1121694 (=> (not res!749360) (not e!638645))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73175 0))(
  ( (array!73176 (arr!35240 (Array (_ BitVec 32) (_ BitVec 64))) (size!35776 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73175)

(assert (=> b!1121694 (= res!749360 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35776 _keys!1208))))))

(declare-fun b!1121695 () Bool)

(declare-fun e!638647 () Bool)

(declare-fun e!638652 () Bool)

(assert (=> b!1121695 (= e!638647 (not e!638652))))

(declare-fun res!749363 () Bool)

(assert (=> b!1121695 (=> res!749363 e!638652)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1121695 (= res!749363 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121695 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36796 0))(
  ( (Unit!36797) )
))
(declare-fun lt!498444 () Unit!36796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73175 (_ BitVec 64) (_ BitVec 32)) Unit!36796)

(assert (=> b!1121695 (= lt!498444 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1121696 () Bool)

(declare-fun res!749371 () Bool)

(assert (=> b!1121696 (=> (not res!749371) (not e!638647))))

(declare-fun lt!498449 () array!73175)

(declare-datatypes ((List!24520 0))(
  ( (Nil!24517) (Cons!24516 (h!25725 (_ BitVec 64)) (t!35129 List!24520)) )
))
(declare-fun arrayNoDuplicates!0 (array!73175 (_ BitVec 32) List!24520) Bool)

(assert (=> b!1121696 (= res!749371 (arrayNoDuplicates!0 lt!498449 #b00000000000000000000000000000000 Nil!24517))))

(declare-fun b!1121697 () Bool)

(declare-fun res!749368 () Bool)

(assert (=> b!1121697 (=> (not res!749368) (not e!638645))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73175 (_ BitVec 32)) Bool)

(assert (=> b!1121697 (= res!749368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121698 () Bool)

(assert (=> b!1121698 (= e!638645 e!638647)))

(declare-fun res!749367 () Bool)

(assert (=> b!1121698 (=> (not res!749367) (not e!638647))))

(assert (=> b!1121698 (= res!749367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498449 mask!1564))))

(assert (=> b!1121698 (= lt!498449 (array!73176 (store (arr!35240 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35776 _keys!1208)))))

(declare-fun b!1121699 () Bool)

(declare-fun e!638646 () Bool)

(assert (=> b!1121699 (= e!638646 true)))

(assert (=> b!1121699 e!638650))

(declare-fun c!109416 () Bool)

(assert (=> b!1121699 (= c!109416 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42657)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13364 0))(
  ( (ValueCellFull!13364 (v!16763 V!42657)) (EmptyCell!13364) )
))
(declare-datatypes ((array!73177 0))(
  ( (array!73178 (arr!35241 (Array (_ BitVec 32) ValueCell!13364)) (size!35777 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73177)

(declare-fun minValue!944 () V!42657)

(declare-fun lt!498446 () Unit!36796)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!326 (array!73175 array!73177 (_ BitVec 32) (_ BitVec 32) V!42657 V!42657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36796)

(assert (=> b!1121699 (= lt!498446 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!326 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44038 () Bool)

(declare-fun mapRes!44038 () Bool)

(declare-fun tp!83554 () Bool)

(declare-fun e!638651 () Bool)

(assert (=> mapNonEmpty!44038 (= mapRes!44038 (and tp!83554 e!638651))))

(declare-fun mapKey!44038 () (_ BitVec 32))

(declare-fun mapRest!44038 () (Array (_ BitVec 32) ValueCell!13364))

(declare-fun mapValue!44038 () ValueCell!13364)

(assert (=> mapNonEmpty!44038 (= (arr!35241 _values!996) (store mapRest!44038 mapKey!44038 mapValue!44038))))

(declare-fun lt!498445 () array!73177)

(declare-fun bm!47130 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4358 (array!73175 array!73177 (_ BitVec 32) (_ BitVec 32) V!42657 V!42657 (_ BitVec 32) Int) ListLongMap!15707)

(assert (=> bm!47130 (= call!47133 (getCurrentListMapNoExtraKeys!4358 lt!498449 lt!498445 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121701 () Bool)

(declare-fun res!749370 () Bool)

(assert (=> b!1121701 (=> (not res!749370) (not e!638645))))

(assert (=> b!1121701 (= res!749370 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24517))))

(declare-fun b!1121702 () Bool)

(assert (=> b!1121702 (= e!638650 (= call!47133 call!47134))))

(declare-fun mapIsEmpty!44038 () Bool)

(assert (=> mapIsEmpty!44038 mapRes!44038))

(declare-fun b!1121703 () Bool)

(declare-fun res!749361 () Bool)

(assert (=> b!1121703 (=> (not res!749361) (not e!638645))))

(assert (=> b!1121703 (= res!749361 (and (= (size!35777 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35776 _keys!1208) (size!35777 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121704 () Bool)

(declare-fun tp_is_empty!28147 () Bool)

(assert (=> b!1121704 (= e!638651 tp_is_empty!28147)))

(declare-fun b!1121705 () Bool)

(declare-fun res!749366 () Bool)

(assert (=> b!1121705 (=> (not res!749366) (not e!638645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121705 (= res!749366 (validMask!0 mask!1564))))

(declare-fun b!1121706 () Bool)

(assert (=> b!1121706 (= e!638652 e!638646)))

(declare-fun res!749365 () Bool)

(assert (=> b!1121706 (=> res!749365 e!638646)))

(assert (=> b!1121706 (= res!749365 (not (= from!1455 i!673)))))

(declare-fun lt!498448 () ListLongMap!15707)

(assert (=> b!1121706 (= lt!498448 (getCurrentListMapNoExtraKeys!4358 lt!498449 lt!498445 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2457 (Int (_ BitVec 64)) V!42657)

(assert (=> b!1121706 (= lt!498445 (array!73178 (store (arr!35241 _values!996) i!673 (ValueCellFull!13364 (dynLambda!2457 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35777 _values!996)))))

(declare-fun lt!498447 () ListLongMap!15707)

(assert (=> b!1121706 (= lt!498447 (getCurrentListMapNoExtraKeys!4358 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121707 () Bool)

(declare-fun e!638644 () Bool)

(declare-fun e!638649 () Bool)

(assert (=> b!1121707 (= e!638644 (and e!638649 mapRes!44038))))

(declare-fun condMapEmpty!44038 () Bool)

(declare-fun mapDefault!44038 () ValueCell!13364)

