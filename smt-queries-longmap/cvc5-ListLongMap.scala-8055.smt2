; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99170 () Bool)

(assert start!99170)

(declare-fun b_free!24775 () Bool)

(declare-fun b_next!24775 () Bool)

(assert (=> start!99170 (= b_free!24775 (not b_next!24775))))

(declare-fun tp!87035 () Bool)

(declare-fun b_and!40399 () Bool)

(assert (=> start!99170 (= tp!87035 b_and!40399)))

(declare-fun b!1167266 () Bool)

(declare-fun e!663462 () Bool)

(declare-fun tp_is_empty!29305 () Bool)

(assert (=> b!1167266 (= e!663462 tp_is_empty!29305)))

(declare-fun mapNonEmpty!45782 () Bool)

(declare-fun mapRes!45782 () Bool)

(declare-fun tp!87036 () Bool)

(assert (=> mapNonEmpty!45782 (= mapRes!45782 (and tp!87036 e!663462))))

(declare-datatypes ((V!44201 0))(
  ( (V!44202 (val!14709 Int)) )
))
(declare-datatypes ((ValueCell!13943 0))(
  ( (ValueCellFull!13943 (v!17346 V!44201)) (EmptyCell!13943) )
))
(declare-fun mapRest!45782 () (Array (_ BitVec 32) ValueCell!13943))

(declare-fun mapValue!45782 () ValueCell!13943)

(declare-fun mapKey!45782 () (_ BitVec 32))

(declare-datatypes ((array!75439 0))(
  ( (array!75440 (arr!36370 (Array (_ BitVec 32) ValueCell!13943)) (size!36906 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75439)

(assert (=> mapNonEmpty!45782 (= (arr!36370 _values!996) (store mapRest!45782 mapKey!45782 mapValue!45782))))

(declare-fun mapIsEmpty!45782 () Bool)

(assert (=> mapIsEmpty!45782 mapRes!45782))

(declare-fun b!1167267 () Bool)

(declare-fun e!663465 () Bool)

(declare-fun e!663464 () Bool)

(assert (=> b!1167267 (= e!663465 e!663464)))

(declare-fun res!774331 () Bool)

(assert (=> b!1167267 (=> res!774331 e!663464)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167267 (= res!774331 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44201)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!75441 0))(
  ( (array!75442 (arr!36371 (Array (_ BitVec 32) (_ BitVec 64))) (size!36907 (_ BitVec 32))) )
))
(declare-fun lt!525572 () array!75441)

(declare-datatypes ((tuple2!18764 0))(
  ( (tuple2!18765 (_1!9393 (_ BitVec 64)) (_2!9393 V!44201)) )
))
(declare-datatypes ((List!25504 0))(
  ( (Nil!25501) (Cons!25500 (h!26709 tuple2!18764) (t!37271 List!25504)) )
))
(declare-datatypes ((ListLongMap!16733 0))(
  ( (ListLongMap!16734 (toList!8382 List!25504)) )
))
(declare-fun lt!525571 () ListLongMap!16733)

(declare-fun lt!525573 () array!75439)

(declare-fun minValue!944 () V!44201)

(declare-fun getCurrentListMapNoExtraKeys!4846 (array!75441 array!75439 (_ BitVec 32) (_ BitVec 32) V!44201 V!44201 (_ BitVec 32) Int) ListLongMap!16733)

(assert (=> b!1167267 (= lt!525571 (getCurrentListMapNoExtraKeys!4846 lt!525572 lt!525573 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2829 (Int (_ BitVec 64)) V!44201)

(assert (=> b!1167267 (= lt!525573 (array!75440 (store (arr!36370 _values!996) i!673 (ValueCellFull!13943 (dynLambda!2829 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36906 _values!996)))))

(declare-fun _keys!1208 () array!75441)

(declare-fun lt!525568 () ListLongMap!16733)

(assert (=> b!1167267 (= lt!525568 (getCurrentListMapNoExtraKeys!4846 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167268 () Bool)

(declare-fun res!774330 () Bool)

(declare-fun e!663461 () Bool)

(assert (=> b!1167268 (=> (not res!774330) (not e!663461))))

(assert (=> b!1167268 (= res!774330 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36907 _keys!1208))))))

(declare-fun b!1167269 () Bool)

(declare-fun res!774329 () Bool)

(assert (=> b!1167269 (=> (not res!774329) (not e!663461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167269 (= res!774329 (validMask!0 mask!1564))))

(declare-fun res!774327 () Bool)

(assert (=> start!99170 (=> (not res!774327) (not e!663461))))

(assert (=> start!99170 (= res!774327 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36907 _keys!1208))))))

(assert (=> start!99170 e!663461))

(assert (=> start!99170 tp_is_empty!29305))

(declare-fun array_inv!27804 (array!75441) Bool)

(assert (=> start!99170 (array_inv!27804 _keys!1208)))

(assert (=> start!99170 true))

(assert (=> start!99170 tp!87035))

(declare-fun e!663463 () Bool)

(declare-fun array_inv!27805 (array!75439) Bool)

(assert (=> start!99170 (and (array_inv!27805 _values!996) e!663463)))

(declare-fun b!1167270 () Bool)

(declare-fun res!774325 () Bool)

(declare-fun e!663459 () Bool)

(assert (=> b!1167270 (=> (not res!774325) (not e!663459))))

(declare-datatypes ((List!25505 0))(
  ( (Nil!25502) (Cons!25501 (h!26710 (_ BitVec 64)) (t!37272 List!25505)) )
))
(declare-fun arrayNoDuplicates!0 (array!75441 (_ BitVec 32) List!25505) Bool)

(assert (=> b!1167270 (= res!774325 (arrayNoDuplicates!0 lt!525572 #b00000000000000000000000000000000 Nil!25502))))

(declare-fun b!1167271 () Bool)

(declare-fun res!774333 () Bool)

(assert (=> b!1167271 (=> (not res!774333) (not e!663461))))

(assert (=> b!1167271 (= res!774333 (and (= (size!36906 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36907 _keys!1208) (size!36906 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167272 () Bool)

(assert (=> b!1167272 (= e!663461 e!663459)))

(declare-fun res!774334 () Bool)

(assert (=> b!1167272 (=> (not res!774334) (not e!663459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75441 (_ BitVec 32)) Bool)

(assert (=> b!1167272 (= res!774334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525572 mask!1564))))

(assert (=> b!1167272 (= lt!525572 (array!75442 (store (arr!36371 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36907 _keys!1208)))))

(declare-fun b!1167273 () Bool)

(declare-fun res!774328 () Bool)

(assert (=> b!1167273 (=> (not res!774328) (not e!663461))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167273 (= res!774328 (validKeyInArray!0 k!934))))

(declare-fun b!1167274 () Bool)

(declare-fun res!774326 () Bool)

(assert (=> b!1167274 (=> (not res!774326) (not e!663461))))

(assert (=> b!1167274 (= res!774326 (= (select (arr!36371 _keys!1208) i!673) k!934))))

(declare-fun b!1167275 () Bool)

(declare-fun res!774324 () Bool)

(assert (=> b!1167275 (=> (not res!774324) (not e!663461))))

(assert (=> b!1167275 (= res!774324 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25502))))

(declare-fun b!1167276 () Bool)

(declare-fun e!663458 () Bool)

(assert (=> b!1167276 (= e!663463 (and e!663458 mapRes!45782))))

(declare-fun condMapEmpty!45782 () Bool)

(declare-fun mapDefault!45782 () ValueCell!13943)

