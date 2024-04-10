; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100286 () Bool)

(assert start!100286)

(declare-fun b!1196451 () Bool)

(declare-fun res!796239 () Bool)

(declare-fun e!679774 () Bool)

(assert (=> b!1196451 (=> (not res!796239) (not e!679774))))

(declare-datatypes ((array!77485 0))(
  ( (array!77486 (arr!37389 (Array (_ BitVec 32) (_ BitVec 64))) (size!37925 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77485)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1196451 (= res!796239 (= (select (arr!37389 _keys!1208) i!673) k!934))))

(declare-fun b!1196452 () Bool)

(declare-fun e!679777 () Bool)

(declare-fun tp_is_empty!30353 () Bool)

(assert (=> b!1196452 (= e!679777 tp_is_empty!30353)))

(declare-fun mapNonEmpty!47366 () Bool)

(declare-fun mapRes!47366 () Bool)

(declare-fun tp!89976 () Bool)

(declare-fun e!679776 () Bool)

(assert (=> mapNonEmpty!47366 (= mapRes!47366 (and tp!89976 e!679776))))

(declare-fun mapKey!47366 () (_ BitVec 32))

(declare-datatypes ((V!45597 0))(
  ( (V!45598 (val!15233 Int)) )
))
(declare-datatypes ((ValueCell!14467 0))(
  ( (ValueCellFull!14467 (v!17871 V!45597)) (EmptyCell!14467) )
))
(declare-fun mapRest!47366 () (Array (_ BitVec 32) ValueCell!14467))

(declare-fun mapValue!47366 () ValueCell!14467)

(declare-datatypes ((array!77487 0))(
  ( (array!77488 (arr!37390 (Array (_ BitVec 32) ValueCell!14467)) (size!37926 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77487)

(assert (=> mapNonEmpty!47366 (= (arr!37390 _values!996) (store mapRest!47366 mapKey!47366 mapValue!47366))))

(declare-fun b!1196454 () Bool)

(declare-fun res!796237 () Bool)

(assert (=> b!1196454 (=> (not res!796237) (not e!679774))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1196454 (= res!796237 (and (= (size!37926 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37925 _keys!1208) (size!37926 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196455 () Bool)

(declare-fun res!796243 () Bool)

(assert (=> b!1196455 (=> (not res!796243) (not e!679774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196455 (= res!796243 (validMask!0 mask!1564))))

(declare-fun b!1196456 () Bool)

(declare-fun res!796240 () Bool)

(assert (=> b!1196456 (=> (not res!796240) (not e!679774))))

(declare-datatypes ((List!26303 0))(
  ( (Nil!26300) (Cons!26299 (h!27508 (_ BitVec 64)) (t!38974 List!26303)) )
))
(declare-fun arrayNoDuplicates!0 (array!77485 (_ BitVec 32) List!26303) Bool)

(assert (=> b!1196456 (= res!796240 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26300))))

(declare-fun b!1196457 () Bool)

(declare-fun res!796242 () Bool)

(assert (=> b!1196457 (=> (not res!796242) (not e!679774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196457 (= res!796242 (validKeyInArray!0 k!934))))

(declare-fun b!1196458 () Bool)

(declare-fun e!679773 () Bool)

(assert (=> b!1196458 (= e!679774 e!679773)))

(declare-fun res!796246 () Bool)

(assert (=> b!1196458 (=> (not res!796246) (not e!679773))))

(declare-fun lt!543083 () array!77485)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77485 (_ BitVec 32)) Bool)

(assert (=> b!1196458 (= res!796246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543083 mask!1564))))

(assert (=> b!1196458 (= lt!543083 (array!77486 (store (arr!37389 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37925 _keys!1208)))))

(declare-fun b!1196459 () Bool)

(declare-fun res!796244 () Bool)

(assert (=> b!1196459 (=> (not res!796244) (not e!679774))))

(assert (=> b!1196459 (= res!796244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47366 () Bool)

(assert (=> mapIsEmpty!47366 mapRes!47366))

(declare-fun b!1196453 () Bool)

(assert (=> b!1196453 (= e!679773 (not true))))

(declare-fun arrayContainsKey!0 (array!77485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196453 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39672 0))(
  ( (Unit!39673) )
))
(declare-fun lt!543084 () Unit!39672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77485 (_ BitVec 64) (_ BitVec 32)) Unit!39672)

(assert (=> b!1196453 (= lt!543084 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!796238 () Bool)

(assert (=> start!100286 (=> (not res!796238) (not e!679774))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100286 (= res!796238 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37925 _keys!1208))))))

(assert (=> start!100286 e!679774))

(declare-fun array_inv!28498 (array!77485) Bool)

(assert (=> start!100286 (array_inv!28498 _keys!1208)))

(assert (=> start!100286 true))

(declare-fun e!679775 () Bool)

(declare-fun array_inv!28499 (array!77487) Bool)

(assert (=> start!100286 (and (array_inv!28499 _values!996) e!679775)))

(declare-fun b!1196460 () Bool)

(declare-fun res!796245 () Bool)

(assert (=> b!1196460 (=> (not res!796245) (not e!679773))))

(assert (=> b!1196460 (= res!796245 (arrayNoDuplicates!0 lt!543083 #b00000000000000000000000000000000 Nil!26300))))

(declare-fun b!1196461 () Bool)

(assert (=> b!1196461 (= e!679776 tp_is_empty!30353)))

(declare-fun b!1196462 () Bool)

(declare-fun res!796241 () Bool)

(assert (=> b!1196462 (=> (not res!796241) (not e!679774))))

(assert (=> b!1196462 (= res!796241 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37925 _keys!1208))))))

(declare-fun b!1196463 () Bool)

(assert (=> b!1196463 (= e!679775 (and e!679777 mapRes!47366))))

(declare-fun condMapEmpty!47366 () Bool)

(declare-fun mapDefault!47366 () ValueCell!14467)

