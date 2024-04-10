; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100268 () Bool)

(assert start!100268)

(declare-fun b!1196100 () Bool)

(declare-fun e!679614 () Bool)

(declare-fun tp_is_empty!30335 () Bool)

(assert (=> b!1196100 (= e!679614 tp_is_empty!30335)))

(declare-fun b!1196101 () Bool)

(declare-fun res!795974 () Bool)

(declare-fun e!679612 () Bool)

(assert (=> b!1196101 (=> (not res!795974) (not e!679612))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196101 (= res!795974 (validKeyInArray!0 k!934))))

(declare-fun b!1196102 () Bool)

(declare-fun res!795971 () Bool)

(assert (=> b!1196102 (=> (not res!795971) (not e!679612))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196102 (= res!795971 (validMask!0 mask!1564))))

(declare-fun b!1196103 () Bool)

(declare-fun res!795972 () Bool)

(assert (=> b!1196103 (=> (not res!795972) (not e!679612))))

(declare-datatypes ((array!77451 0))(
  ( (array!77452 (arr!37372 (Array (_ BitVec 32) (_ BitVec 64))) (size!37908 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77451)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196103 (= res!795972 (= (select (arr!37372 _keys!1208) i!673) k!934))))

(declare-fun b!1196104 () Bool)

(declare-fun res!795969 () Bool)

(assert (=> b!1196104 (=> (not res!795969) (not e!679612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77451 (_ BitVec 32)) Bool)

(assert (=> b!1196104 (= res!795969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196105 () Bool)

(declare-fun res!795975 () Bool)

(assert (=> b!1196105 (=> (not res!795975) (not e!679612))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45573 0))(
  ( (V!45574 (val!15224 Int)) )
))
(declare-datatypes ((ValueCell!14458 0))(
  ( (ValueCellFull!14458 (v!17862 V!45573)) (EmptyCell!14458) )
))
(declare-datatypes ((array!77453 0))(
  ( (array!77454 (arr!37373 (Array (_ BitVec 32) ValueCell!14458)) (size!37909 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77453)

(assert (=> b!1196105 (= res!795975 (and (= (size!37909 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37908 _keys!1208) (size!37909 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47339 () Bool)

(declare-fun mapRes!47339 () Bool)

(declare-fun tp!89949 () Bool)

(declare-fun e!679615 () Bool)

(assert (=> mapNonEmpty!47339 (= mapRes!47339 (and tp!89949 e!679615))))

(declare-fun mapRest!47339 () (Array (_ BitVec 32) ValueCell!14458))

(declare-fun mapKey!47339 () (_ BitVec 32))

(declare-fun mapValue!47339 () ValueCell!14458)

(assert (=> mapNonEmpty!47339 (= (arr!37373 _values!996) (store mapRest!47339 mapKey!47339 mapValue!47339))))

(declare-fun b!1196106 () Bool)

(declare-fun res!795967 () Bool)

(assert (=> b!1196106 (=> (not res!795967) (not e!679612))))

(declare-datatypes ((List!26295 0))(
  ( (Nil!26292) (Cons!26291 (h!27500 (_ BitVec 64)) (t!38966 List!26295)) )
))
(declare-fun arrayNoDuplicates!0 (array!77451 (_ BitVec 32) List!26295) Bool)

(assert (=> b!1196106 (= res!795967 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26292))))

(declare-fun b!1196108 () Bool)

(declare-fun res!795973 () Bool)

(declare-fun e!679610 () Bool)

(assert (=> b!1196108 (=> (not res!795973) (not e!679610))))

(declare-fun lt!543030 () array!77451)

(assert (=> b!1196108 (= res!795973 (arrayNoDuplicates!0 lt!543030 #b00000000000000000000000000000000 Nil!26292))))

(declare-fun b!1196109 () Bool)

(assert (=> b!1196109 (= e!679612 e!679610)))

(declare-fun res!795968 () Bool)

(assert (=> b!1196109 (=> (not res!795968) (not e!679610))))

(assert (=> b!1196109 (= res!795968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543030 mask!1564))))

(assert (=> b!1196109 (= lt!543030 (array!77452 (store (arr!37372 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37908 _keys!1208)))))

(declare-fun b!1196110 () Bool)

(assert (=> b!1196110 (= e!679610 (not true))))

(declare-fun arrayContainsKey!0 (array!77451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196110 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39660 0))(
  ( (Unit!39661) )
))
(declare-fun lt!543029 () Unit!39660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77451 (_ BitVec 64) (_ BitVec 32)) Unit!39660)

(assert (=> b!1196110 (= lt!543029 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1196111 () Bool)

(declare-fun e!679613 () Bool)

(assert (=> b!1196111 (= e!679613 (and e!679614 mapRes!47339))))

(declare-fun condMapEmpty!47339 () Bool)

(declare-fun mapDefault!47339 () ValueCell!14458)

