; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97416 () Bool)

(assert start!97416)

(declare-fun b_free!23387 () Bool)

(declare-fun b_next!23387 () Bool)

(assert (=> start!97416 (= b_free!23387 (not b_next!23387))))

(declare-fun tp!82459 () Bool)

(declare-fun b_and!37611 () Bool)

(assert (=> start!97416 (= tp!82459 b_and!37611)))

(declare-fun b!1111081 () Bool)

(declare-fun e!633601 () Bool)

(declare-fun tp_is_empty!27647 () Bool)

(assert (=> b!1111081 (= e!633601 tp_is_empty!27647)))

(declare-fun b!1111082 () Bool)

(declare-fun e!633597 () Bool)

(declare-fun e!633600 () Bool)

(assert (=> b!1111082 (= e!633597 e!633600)))

(declare-fun res!741454 () Bool)

(assert (=> b!1111082 (=> (not res!741454) (not e!633600))))

(declare-datatypes ((array!72211 0))(
  ( (array!72212 (arr!34758 (Array (_ BitVec 32) (_ BitVec 64))) (size!35294 (_ BitVec 32))) )
))
(declare-fun lt!496280 () array!72211)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72211 (_ BitVec 32)) Bool)

(assert (=> b!1111082 (= res!741454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496280 mask!1564))))

(declare-fun _keys!1208 () array!72211)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111082 (= lt!496280 (array!72212 (store (arr!34758 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35294 _keys!1208)))))

(declare-fun mapIsEmpty!43288 () Bool)

(declare-fun mapRes!43288 () Bool)

(assert (=> mapIsEmpty!43288 mapRes!43288))

(declare-fun b!1111083 () Bool)

(declare-fun res!741450 () Bool)

(assert (=> b!1111083 (=> (not res!741450) (not e!633597))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111083 (= res!741450 (validKeyInArray!0 k!934))))

(declare-fun b!1111084 () Bool)

(declare-fun res!741455 () Bool)

(assert (=> b!1111084 (=> (not res!741455) (not e!633597))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41989 0))(
  ( (V!41990 (val!13880 Int)) )
))
(declare-datatypes ((ValueCell!13114 0))(
  ( (ValueCellFull!13114 (v!16513 V!41989)) (EmptyCell!13114) )
))
(declare-datatypes ((array!72213 0))(
  ( (array!72214 (arr!34759 (Array (_ BitVec 32) ValueCell!13114)) (size!35295 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72213)

(assert (=> b!1111084 (= res!741455 (and (= (size!35295 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35294 _keys!1208) (size!35295 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111085 () Bool)

(declare-fun res!741453 () Bool)

(assert (=> b!1111085 (=> (not res!741453) (not e!633597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111085 (= res!741453 (validMask!0 mask!1564))))

(declare-fun b!1111086 () Bool)

(declare-fun res!741456 () Bool)

(assert (=> b!1111086 (=> (not res!741456) (not e!633600))))

(declare-datatypes ((List!24246 0))(
  ( (Nil!24243) (Cons!24242 (h!25451 (_ BitVec 64)) (t!34679 List!24246)) )
))
(declare-fun arrayNoDuplicates!0 (array!72211 (_ BitVec 32) List!24246) Bool)

(assert (=> b!1111086 (= res!741456 (arrayNoDuplicates!0 lt!496280 #b00000000000000000000000000000000 Nil!24243))))

(declare-fun b!1111087 () Bool)

(declare-fun res!741452 () Bool)

(assert (=> b!1111087 (=> (not res!741452) (not e!633597))))

(assert (=> b!1111087 (= res!741452 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35294 _keys!1208))))))

(declare-fun b!1111088 () Bool)

(declare-fun res!741458 () Bool)

(assert (=> b!1111088 (=> (not res!741458) (not e!633597))))

(assert (=> b!1111088 (= res!741458 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24243))))

(declare-fun res!741451 () Bool)

(assert (=> start!97416 (=> (not res!741451) (not e!633597))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97416 (= res!741451 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35294 _keys!1208))))))

(assert (=> start!97416 e!633597))

(assert (=> start!97416 tp_is_empty!27647))

(declare-fun array_inv!26738 (array!72211) Bool)

(assert (=> start!97416 (array_inv!26738 _keys!1208)))

(assert (=> start!97416 true))

(assert (=> start!97416 tp!82459))

(declare-fun e!633596 () Bool)

(declare-fun array_inv!26739 (array!72213) Bool)

(assert (=> start!97416 (and (array_inv!26739 _values!996) e!633596)))

(declare-fun b!1111089 () Bool)

(declare-fun e!633598 () Bool)

(assert (=> b!1111089 (= e!633600 (not e!633598))))

(declare-fun res!741459 () Bool)

(assert (=> b!1111089 (=> res!741459 e!633598)))

(assert (=> b!1111089 (= res!741459 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35294 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111089 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36462 0))(
  ( (Unit!36463) )
))
(declare-fun lt!496278 () Unit!36462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72211 (_ BitVec 64) (_ BitVec 32)) Unit!36462)

(assert (=> b!1111089 (= lt!496278 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((tuple2!17562 0))(
  ( (tuple2!17563 (_1!8792 (_ BitVec 64)) (_2!8792 V!41989)) )
))
(declare-datatypes ((List!24247 0))(
  ( (Nil!24244) (Cons!24243 (h!25452 tuple2!17562) (t!34680 List!24247)) )
))
(declare-datatypes ((ListLongMap!15531 0))(
  ( (ListLongMap!15532 (toList!7781 List!24247)) )
))
(declare-fun call!46858 () ListLongMap!15531)

(declare-fun e!633599 () Bool)

(declare-fun b!1111090 () Bool)

(declare-fun call!46857 () ListLongMap!15531)

(declare-fun -!1050 (ListLongMap!15531 (_ BitVec 64)) ListLongMap!15531)

(assert (=> b!1111090 (= e!633599 (= call!46858 (-!1050 call!46857 k!934)))))

(declare-fun b!1111091 () Bool)

(declare-fun res!741457 () Bool)

(assert (=> b!1111091 (=> (not res!741457) (not e!633597))))

(assert (=> b!1111091 (= res!741457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun zeroValue!944 () V!41989)

(declare-fun bm!46854 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41989)

(declare-fun getCurrentListMapNoExtraKeys!4273 (array!72211 array!72213 (_ BitVec 32) (_ BitVec 32) V!41989 V!41989 (_ BitVec 32) Int) ListLongMap!15531)

(declare-fun dynLambda!2402 (Int (_ BitVec 64)) V!41989)

(assert (=> bm!46854 (= call!46858 (getCurrentListMapNoExtraKeys!4273 lt!496280 (array!72214 (store (arr!34759 _values!996) i!673 (ValueCellFull!13114 (dynLambda!2402 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35295 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111092 () Bool)

(assert (=> b!1111092 (= e!633598 true)))

(assert (=> b!1111092 e!633599))

(declare-fun c!109278 () Bool)

(assert (=> b!1111092 (= c!109278 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496279 () Unit!36462)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!299 (array!72211 array!72213 (_ BitVec 32) (_ BitVec 32) V!41989 V!41989 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36462)

(assert (=> b!1111092 (= lt!496279 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!299 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46855 () Bool)

(assert (=> bm!46855 (= call!46857 (getCurrentListMapNoExtraKeys!4273 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111093 () Bool)

(declare-fun res!741460 () Bool)

(assert (=> b!1111093 (=> (not res!741460) (not e!633597))))

(assert (=> b!1111093 (= res!741460 (= (select (arr!34758 _keys!1208) i!673) k!934))))

(declare-fun b!1111094 () Bool)

(declare-fun e!633603 () Bool)

(assert (=> b!1111094 (= e!633603 tp_is_empty!27647)))

(declare-fun b!1111095 () Bool)

(assert (=> b!1111095 (= e!633599 (= call!46858 call!46857))))

(declare-fun mapNonEmpty!43288 () Bool)

(declare-fun tp!82460 () Bool)

(assert (=> mapNonEmpty!43288 (= mapRes!43288 (and tp!82460 e!633603))))

(declare-fun mapKey!43288 () (_ BitVec 32))

(declare-fun mapRest!43288 () (Array (_ BitVec 32) ValueCell!13114))

(declare-fun mapValue!43288 () ValueCell!13114)

(assert (=> mapNonEmpty!43288 (= (arr!34759 _values!996) (store mapRest!43288 mapKey!43288 mapValue!43288))))

(declare-fun b!1111096 () Bool)

(assert (=> b!1111096 (= e!633596 (and e!633601 mapRes!43288))))

(declare-fun condMapEmpty!43288 () Bool)

(declare-fun mapDefault!43288 () ValueCell!13114)

