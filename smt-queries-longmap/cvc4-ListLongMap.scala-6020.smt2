; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78008 () Bool)

(assert start!78008)

(declare-fun b_free!16535 () Bool)

(declare-fun b_next!16535 () Bool)

(assert (=> start!78008 (= b_free!16535 (not b_next!16535))))

(declare-fun tp!57875 () Bool)

(declare-fun b_and!27107 () Bool)

(assert (=> start!78008 (= tp!57875 b_and!27107)))

(declare-fun mapIsEmpty!30151 () Bool)

(declare-fun mapRes!30151 () Bool)

(assert (=> mapIsEmpty!30151 mapRes!30151))

(declare-fun b!910632 () Bool)

(declare-fun e!510599 () Bool)

(declare-fun tp_is_empty!18953 () Bool)

(assert (=> b!910632 (= e!510599 tp_is_empty!18953)))

(declare-fun b!910633 () Bool)

(declare-fun res!614472 () Bool)

(declare-fun e!510597 () Bool)

(assert (=> b!910633 (=> (not res!614472) (not e!510597))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53922 0))(
  ( (array!53923 (arr!25917 (Array (_ BitVec 32) (_ BitVec 64))) (size!26376 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53922)

(declare-datatypes ((V!30235 0))(
  ( (V!30236 (val!9527 Int)) )
))
(declare-datatypes ((ValueCell!8995 0))(
  ( (ValueCellFull!8995 (v!12036 V!30235)) (EmptyCell!8995) )
))
(declare-datatypes ((array!53924 0))(
  ( (array!53925 (arr!25918 (Array (_ BitVec 32) ValueCell!8995)) (size!26377 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53924)

(assert (=> b!910633 (= res!614472 (and (= (size!26377 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26376 _keys!1386) (size!26377 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910634 () Bool)

(declare-fun res!614474 () Bool)

(assert (=> b!910634 (=> (not res!614474) (not e!510597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53922 (_ BitVec 32)) Bool)

(assert (=> b!910634 (= res!614474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30151 () Bool)

(declare-fun tp!57876 () Bool)

(declare-fun e!510600 () Bool)

(assert (=> mapNonEmpty!30151 (= mapRes!30151 (and tp!57876 e!510600))))

(declare-fun mapKey!30151 () (_ BitVec 32))

(declare-fun mapValue!30151 () ValueCell!8995)

(declare-fun mapRest!30151 () (Array (_ BitVec 32) ValueCell!8995))

(assert (=> mapNonEmpty!30151 (= (arr!25918 _values!1152) (store mapRest!30151 mapKey!30151 mapValue!30151))))

(declare-fun b!910635 () Bool)

(assert (=> b!910635 (= e!510600 tp_is_empty!18953)))

(declare-fun b!910636 () Bool)

(declare-fun res!614473 () Bool)

(assert (=> b!910636 (=> (not res!614473) (not e!510597))))

(declare-datatypes ((List!18206 0))(
  ( (Nil!18203) (Cons!18202 (h!19348 (_ BitVec 64)) (t!25791 List!18206)) )
))
(declare-fun arrayNoDuplicates!0 (array!53922 (_ BitVec 32) List!18206) Bool)

(assert (=> b!910636 (= res!614473 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18203))))

(declare-fun res!614475 () Bool)

(assert (=> start!78008 (=> (not res!614475) (not e!510597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78008 (= res!614475 (validMask!0 mask!1756))))

(assert (=> start!78008 e!510597))

(declare-fun e!510596 () Bool)

(declare-fun array_inv!20266 (array!53924) Bool)

(assert (=> start!78008 (and (array_inv!20266 _values!1152) e!510596)))

(assert (=> start!78008 tp!57875))

(assert (=> start!78008 true))

(assert (=> start!78008 tp_is_empty!18953))

(declare-fun array_inv!20267 (array!53922) Bool)

(assert (=> start!78008 (array_inv!20267 _keys!1386)))

(declare-fun b!910637 () Bool)

(assert (=> b!910637 (= e!510596 (and e!510599 mapRes!30151))))

(declare-fun condMapEmpty!30151 () Bool)

(declare-fun mapDefault!30151 () ValueCell!8995)

