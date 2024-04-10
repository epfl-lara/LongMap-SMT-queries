; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97434 () Bool)

(assert start!97434)

(declare-fun b_free!23405 () Bool)

(declare-fun b_next!23405 () Bool)

(assert (=> start!97434 (= b_free!23405 (not b_next!23405))))

(declare-fun tp!82514 () Bool)

(declare-fun b_and!37647 () Bool)

(assert (=> start!97434 (= tp!82514 b_and!37647)))

(declare-fun b!1111531 () Bool)

(declare-fun res!741751 () Bool)

(declare-fun e!633815 () Bool)

(assert (=> b!1111531 (=> (not res!741751) (not e!633815))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!72247 0))(
  ( (array!72248 (arr!34776 (Array (_ BitVec 32) (_ BitVec 64))) (size!35312 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72247)

(assert (=> b!1111531 (= res!741751 (= (select (arr!34776 _keys!1208) i!673) k!934))))

(declare-fun b!1111532 () Bool)

(declare-fun e!633819 () Bool)

(declare-fun tp_is_empty!27665 () Bool)

(assert (=> b!1111532 (= e!633819 tp_is_empty!27665)))

(declare-fun b!1111533 () Bool)

(declare-fun res!741750 () Bool)

(assert (=> b!1111533 (=> (not res!741750) (not e!633815))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72247 (_ BitVec 32)) Bool)

(assert (=> b!1111533 (= res!741750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!42013 0))(
  ( (V!42014 (val!13889 Int)) )
))
(declare-fun zeroValue!944 () V!42013)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46908 () Bool)

(declare-datatypes ((ValueCell!13123 0))(
  ( (ValueCellFull!13123 (v!16522 V!42013)) (EmptyCell!13123) )
))
(declare-datatypes ((array!72249 0))(
  ( (array!72250 (arr!34777 (Array (_ BitVec 32) ValueCell!13123)) (size!35313 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72249)

(declare-fun minValue!944 () V!42013)

(declare-datatypes ((tuple2!17580 0))(
  ( (tuple2!17581 (_1!8801 (_ BitVec 64)) (_2!8801 V!42013)) )
))
(declare-datatypes ((List!24263 0))(
  ( (Nil!24260) (Cons!24259 (h!25468 tuple2!17580) (t!34714 List!24263)) )
))
(declare-datatypes ((ListLongMap!15549 0))(
  ( (ListLongMap!15550 (toList!7790 List!24263)) )
))
(declare-fun call!46912 () ListLongMap!15549)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4281 (array!72247 array!72249 (_ BitVec 32) (_ BitVec 32) V!42013 V!42013 (_ BitVec 32) Int) ListLongMap!15549)

(assert (=> bm!46908 (= call!46912 (getCurrentListMapNoExtraKeys!4281 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111534 () Bool)

(declare-fun res!741756 () Bool)

(assert (=> b!1111534 (=> (not res!741756) (not e!633815))))

(declare-datatypes ((List!24264 0))(
  ( (Nil!24261) (Cons!24260 (h!25469 (_ BitVec 64)) (t!34715 List!24264)) )
))
(declare-fun arrayNoDuplicates!0 (array!72247 (_ BitVec 32) List!24264) Bool)

(assert (=> b!1111534 (= res!741756 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24261))))

(declare-fun b!1111535 () Bool)

(declare-fun res!741747 () Bool)

(assert (=> b!1111535 (=> (not res!741747) (not e!633815))))

(assert (=> b!1111535 (= res!741747 (and (= (size!35313 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35312 _keys!1208) (size!35313 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43315 () Bool)

(declare-fun mapRes!43315 () Bool)

(assert (=> mapIsEmpty!43315 mapRes!43315))

(declare-fun b!1111536 () Bool)

(declare-fun e!633816 () Bool)

(declare-fun call!46911 () ListLongMap!15549)

(assert (=> b!1111536 (= e!633816 (= call!46911 call!46912))))

(declare-fun b!1111537 () Bool)

(declare-fun e!633817 () Bool)

(assert (=> b!1111537 (= e!633817 tp_is_empty!27665)))

(declare-fun res!741752 () Bool)

(assert (=> start!97434 (=> (not res!741752) (not e!633815))))

(assert (=> start!97434 (= res!741752 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35312 _keys!1208))))))

(assert (=> start!97434 e!633815))

(assert (=> start!97434 tp_is_empty!27665))

(declare-fun array_inv!26748 (array!72247) Bool)

(assert (=> start!97434 (array_inv!26748 _keys!1208)))

(assert (=> start!97434 true))

(assert (=> start!97434 tp!82514))

(declare-fun e!633814 () Bool)

(declare-fun array_inv!26749 (array!72249) Bool)

(assert (=> start!97434 (and (array_inv!26749 _values!996) e!633814)))

(declare-fun mapNonEmpty!43315 () Bool)

(declare-fun tp!82513 () Bool)

(assert (=> mapNonEmpty!43315 (= mapRes!43315 (and tp!82513 e!633819))))

(declare-fun mapRest!43315 () (Array (_ BitVec 32) ValueCell!13123))

(declare-fun mapKey!43315 () (_ BitVec 32))

(declare-fun mapValue!43315 () ValueCell!13123)

(assert (=> mapNonEmpty!43315 (= (arr!34777 _values!996) (store mapRest!43315 mapKey!43315 mapValue!43315))))

(declare-fun b!1111538 () Bool)

(declare-fun e!633818 () Bool)

(declare-fun e!633813 () Bool)

(assert (=> b!1111538 (= e!633818 (not e!633813))))

(declare-fun res!741755 () Bool)

(assert (=> b!1111538 (=> res!741755 e!633813)))

(assert (=> b!1111538 (= res!741755 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35312 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111538 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36478 0))(
  ( (Unit!36479) )
))
(declare-fun lt!496359 () Unit!36478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72247 (_ BitVec 64) (_ BitVec 32)) Unit!36478)

(assert (=> b!1111538 (= lt!496359 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun lt!496361 () array!72247)

(declare-fun bm!46909 () Bool)

(declare-fun dynLambda!2408 (Int (_ BitVec 64)) V!42013)

(assert (=> bm!46909 (= call!46911 (getCurrentListMapNoExtraKeys!4281 lt!496361 (array!72250 (store (arr!34777 _values!996) i!673 (ValueCellFull!13123 (dynLambda!2408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35313 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111539 () Bool)

(declare-fun res!741748 () Bool)

(assert (=> b!1111539 (=> (not res!741748) (not e!633818))))

(assert (=> b!1111539 (= res!741748 (arrayNoDuplicates!0 lt!496361 #b00000000000000000000000000000000 Nil!24261))))

(declare-fun b!1111540 () Bool)

(assert (=> b!1111540 (= e!633813 true)))

(assert (=> b!1111540 e!633816))

(declare-fun c!109305 () Bool)

(assert (=> b!1111540 (= c!109305 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496360 () Unit!36478)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!304 (array!72247 array!72249 (_ BitVec 32) (_ BitVec 32) V!42013 V!42013 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36478)

(assert (=> b!1111540 (= lt!496360 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111541 () Bool)

(declare-fun res!741749 () Bool)

(assert (=> b!1111541 (=> (not res!741749) (not e!633815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111541 (= res!741749 (validKeyInArray!0 k!934))))

(declare-fun b!1111542 () Bool)

(assert (=> b!1111542 (= e!633814 (and e!633817 mapRes!43315))))

(declare-fun condMapEmpty!43315 () Bool)

(declare-fun mapDefault!43315 () ValueCell!13123)

