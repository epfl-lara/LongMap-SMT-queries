; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97718 () Bool)

(assert start!97718)

(declare-fun b!1117239 () Bool)

(declare-fun res!746058 () Bool)

(declare-fun e!636465 () Bool)

(assert (=> b!1117239 (=> (not res!746058) (not e!636465))))

(declare-datatypes ((array!72793 0))(
  ( (array!72794 (arr!35049 (Array (_ BitVec 32) (_ BitVec 64))) (size!35585 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72793)

(declare-datatypes ((List!24383 0))(
  ( (Nil!24380) (Cons!24379 (h!25588 (_ BitVec 64)) (t!34864 List!24383)) )
))
(declare-fun arrayNoDuplicates!0 (array!72793 (_ BitVec 32) List!24383) Bool)

(assert (=> b!1117239 (= res!746058 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24380))))

(declare-fun b!1117240 () Bool)

(declare-fun res!746060 () Bool)

(assert (=> b!1117240 (=> (not res!746060) (not e!636465))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1117240 (= res!746060 (= (select (arr!35049 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!43741 () Bool)

(declare-fun mapRes!43741 () Bool)

(declare-fun tp!82985 () Bool)

(declare-fun e!636462 () Bool)

(assert (=> mapNonEmpty!43741 (= mapRes!43741 (and tp!82985 e!636462))))

(declare-datatypes ((V!42393 0))(
  ( (V!42394 (val!14031 Int)) )
))
(declare-datatypes ((ValueCell!13265 0))(
  ( (ValueCellFull!13265 (v!16664 V!42393)) (EmptyCell!13265) )
))
(declare-fun mapValue!43741 () ValueCell!13265)

(declare-fun mapKey!43741 () (_ BitVec 32))

(declare-fun mapRest!43741 () (Array (_ BitVec 32) ValueCell!13265))

(declare-datatypes ((array!72795 0))(
  ( (array!72796 (arr!35050 (Array (_ BitVec 32) ValueCell!13265)) (size!35586 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72795)

(assert (=> mapNonEmpty!43741 (= (arr!35050 _values!996) (store mapRest!43741 mapKey!43741 mapValue!43741))))

(declare-fun b!1117241 () Bool)

(declare-fun e!636460 () Bool)

(assert (=> b!1117241 (= e!636460 (not true))))

(declare-fun arrayContainsKey!0 (array!72793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117241 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36664 0))(
  ( (Unit!36665) )
))
(declare-fun lt!497257 () Unit!36664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72793 (_ BitVec 64) (_ BitVec 32)) Unit!36664)

(assert (=> b!1117241 (= lt!497257 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1117242 () Bool)

(declare-fun res!746056 () Bool)

(assert (=> b!1117242 (=> (not res!746056) (not e!636465))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1117242 (= res!746056 (and (= (size!35586 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35585 _keys!1208) (size!35586 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117243 () Bool)

(declare-fun tp_is_empty!27949 () Bool)

(assert (=> b!1117243 (= e!636462 tp_is_empty!27949)))

(declare-fun b!1117244 () Bool)

(declare-fun e!636463 () Bool)

(declare-fun e!636464 () Bool)

(assert (=> b!1117244 (= e!636463 (and e!636464 mapRes!43741))))

(declare-fun condMapEmpty!43741 () Bool)

(declare-fun mapDefault!43741 () ValueCell!13265)

