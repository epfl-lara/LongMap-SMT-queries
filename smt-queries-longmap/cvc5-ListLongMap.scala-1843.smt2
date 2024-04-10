; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33396 () Bool)

(assert start!33396)

(declare-fun b!331705 () Bool)

(declare-fun e!203553 () Bool)

(declare-fun tp_is_empty!6679 () Bool)

(assert (=> b!331705 (= e!203553 tp_is_empty!6679)))

(declare-fun res!182750 () Bool)

(declare-fun e!203557 () Bool)

(assert (=> start!33396 (=> (not res!182750) (not e!203557))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33396 (= res!182750 (validMask!0 mask!2385))))

(assert (=> start!33396 e!203557))

(assert (=> start!33396 true))

(declare-datatypes ((V!9883 0))(
  ( (V!9884 (val!3384 Int)) )
))
(declare-datatypes ((ValueCell!2996 0))(
  ( (ValueCellFull!2996 (v!5542 V!9883)) (EmptyCell!2996) )
))
(declare-datatypes ((array!16953 0))(
  ( (array!16954 (arr!8014 (Array (_ BitVec 32) ValueCell!2996)) (size!8366 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16953)

(declare-fun e!203556 () Bool)

(declare-fun array_inv!5972 (array!16953) Bool)

(assert (=> start!33396 (and (array_inv!5972 _values!1525) e!203556)))

(declare-datatypes ((array!16955 0))(
  ( (array!16956 (arr!8015 (Array (_ BitVec 32) (_ BitVec 64))) (size!8367 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16955)

(declare-fun array_inv!5973 (array!16955) Bool)

(assert (=> start!33396 (array_inv!5973 _keys!1895)))

(declare-fun b!331706 () Bool)

(declare-fun res!182749 () Bool)

(assert (=> b!331706 (=> (not res!182749) (not e!203557))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331706 (= res!182749 (and (= (size!8366 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8367 _keys!1895) (size!8366 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331707 () Bool)

(declare-fun mapRes!11394 () Bool)

(assert (=> b!331707 (= e!203556 (and e!203553 mapRes!11394))))

(declare-fun condMapEmpty!11394 () Bool)

(declare-fun mapDefault!11394 () ValueCell!2996)

