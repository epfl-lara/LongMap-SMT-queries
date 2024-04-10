; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100228 () Bool)

(assert start!100228)

(declare-fun b!1195320 () Bool)

(declare-fun res!795369 () Bool)

(declare-fun e!679255 () Bool)

(assert (=> b!1195320 (=> (not res!795369) (not e!679255))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77371 0))(
  ( (array!77372 (arr!37332 (Array (_ BitVec 32) (_ BitVec 64))) (size!37868 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77371)

(assert (=> b!1195320 (= res!795369 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37868 _keys!1208))))))

(declare-fun b!1195321 () Bool)

(declare-fun e!679252 () Bool)

(assert (=> b!1195321 (= e!679252 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195321 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39628 0))(
  ( (Unit!39629) )
))
(declare-fun lt!542910 () Unit!39628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77371 (_ BitVec 64) (_ BitVec 32)) Unit!39628)

(assert (=> b!1195321 (= lt!542910 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!47279 () Bool)

(declare-fun mapRes!47279 () Bool)

(declare-fun tp!89889 () Bool)

(declare-fun e!679251 () Bool)

(assert (=> mapNonEmpty!47279 (= mapRes!47279 (and tp!89889 e!679251))))

(declare-datatypes ((V!45521 0))(
  ( (V!45522 (val!15204 Int)) )
))
(declare-datatypes ((ValueCell!14438 0))(
  ( (ValueCellFull!14438 (v!17842 V!45521)) (EmptyCell!14438) )
))
(declare-fun mapValue!47279 () ValueCell!14438)

(declare-fun mapKey!47279 () (_ BitVec 32))

(declare-datatypes ((array!77373 0))(
  ( (array!77374 (arr!37333 (Array (_ BitVec 32) ValueCell!14438)) (size!37869 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77373)

(declare-fun mapRest!47279 () (Array (_ BitVec 32) ValueCell!14438))

(assert (=> mapNonEmpty!47279 (= (arr!37333 _values!996) (store mapRest!47279 mapKey!47279 mapValue!47279))))

(declare-fun b!1195322 () Bool)

(declare-fun tp_is_empty!30295 () Bool)

(assert (=> b!1195322 (= e!679251 tp_is_empty!30295)))

(declare-fun b!1195323 () Bool)

(assert (=> b!1195323 (= e!679255 e!679252)))

(declare-fun res!795373 () Bool)

(assert (=> b!1195323 (=> (not res!795373) (not e!679252))))

(declare-fun lt!542909 () array!77371)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77371 (_ BitVec 32)) Bool)

(assert (=> b!1195323 (= res!795373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542909 mask!1564))))

(assert (=> b!1195323 (= lt!542909 (array!77372 (store (arr!37332 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37868 _keys!1208)))))

(declare-fun mapIsEmpty!47279 () Bool)

(assert (=> mapIsEmpty!47279 mapRes!47279))

(declare-fun b!1195324 () Bool)

(declare-fun res!795375 () Bool)

(assert (=> b!1195324 (=> (not res!795375) (not e!679255))))

(assert (=> b!1195324 (= res!795375 (= (select (arr!37332 _keys!1208) i!673) k!934))))

(declare-fun b!1195325 () Bool)

(declare-fun res!795370 () Bool)

(assert (=> b!1195325 (=> (not res!795370) (not e!679252))))

(declare-datatypes ((List!26277 0))(
  ( (Nil!26274) (Cons!26273 (h!27482 (_ BitVec 64)) (t!38948 List!26277)) )
))
(declare-fun arrayNoDuplicates!0 (array!77371 (_ BitVec 32) List!26277) Bool)

(assert (=> b!1195325 (= res!795370 (arrayNoDuplicates!0 lt!542909 #b00000000000000000000000000000000 Nil!26274))))

(declare-fun b!1195326 () Bool)

(declare-fun e!679254 () Bool)

(declare-fun e!679250 () Bool)

(assert (=> b!1195326 (= e!679254 (and e!679250 mapRes!47279))))

(declare-fun condMapEmpty!47279 () Bool)

(declare-fun mapDefault!47279 () ValueCell!14438)

