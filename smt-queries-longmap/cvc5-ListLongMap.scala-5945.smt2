; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77486 () Bool)

(assert start!77486)

(declare-fun b!902956 () Bool)

(declare-fun res!609273 () Bool)

(declare-fun e!505830 () Bool)

(assert (=> b!902956 (=> (not res!609273) (not e!505830))))

(declare-datatypes ((array!53056 0))(
  ( (array!53057 (arr!25488 (Array (_ BitVec 32) (_ BitVec 64))) (size!25947 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53056)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53056 (_ BitVec 32)) Bool)

(assert (=> b!902956 (= res!609273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902957 () Bool)

(assert (=> b!902957 (= e!505830 false)))

(declare-fun lt!407943 () Bool)

(declare-datatypes ((List!17900 0))(
  ( (Nil!17897) (Cons!17896 (h!19042 (_ BitVec 64)) (t!25283 List!17900)) )
))
(declare-fun arrayNoDuplicates!0 (array!53056 (_ BitVec 32) List!17900) Bool)

(assert (=> b!902957 (= lt!407943 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17897))))

(declare-fun b!902958 () Bool)

(declare-fun res!609274 () Bool)

(assert (=> b!902958 (=> (not res!609274) (not e!505830))))

(declare-datatypes ((V!29631 0))(
  ( (V!29632 (val!9300 Int)) )
))
(declare-datatypes ((ValueCell!8768 0))(
  ( (ValueCellFull!8768 (v!11805 V!29631)) (EmptyCell!8768) )
))
(declare-datatypes ((array!53058 0))(
  ( (array!53059 (arr!25489 (Array (_ BitVec 32) ValueCell!8768)) (size!25948 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53058)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902958 (= res!609274 (and (= (size!25948 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25947 _keys!1386) (size!25948 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29458 () Bool)

(declare-fun mapRes!29458 () Bool)

(declare-fun tp!56517 () Bool)

(declare-fun e!505829 () Bool)

(assert (=> mapNonEmpty!29458 (= mapRes!29458 (and tp!56517 e!505829))))

(declare-fun mapRest!29458 () (Array (_ BitVec 32) ValueCell!8768))

(declare-fun mapValue!29458 () ValueCell!8768)

(declare-fun mapKey!29458 () (_ BitVec 32))

(assert (=> mapNonEmpty!29458 (= (arr!25489 _values!1152) (store mapRest!29458 mapKey!29458 mapValue!29458))))

(declare-fun mapIsEmpty!29458 () Bool)

(assert (=> mapIsEmpty!29458 mapRes!29458))

(declare-fun b!902960 () Bool)

(declare-fun e!505832 () Bool)

(declare-fun e!505833 () Bool)

(assert (=> b!902960 (= e!505832 (and e!505833 mapRes!29458))))

(declare-fun condMapEmpty!29458 () Bool)

(declare-fun mapDefault!29458 () ValueCell!8768)

