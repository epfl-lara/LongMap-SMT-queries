; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78450 () Bool)

(assert start!78450)

(declare-fun b!914896 () Bool)

(declare-fun res!616922 () Bool)

(declare-fun e!513344 () Bool)

(assert (=> b!914896 (=> (not res!616922) (not e!513344))))

(declare-datatypes ((array!54396 0))(
  ( (array!54397 (arr!26146 (Array (_ BitVec 32) (_ BitVec 64))) (size!26605 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54396)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54396 (_ BitVec 32)) Bool)

(assert (=> b!914896 (= res!616922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!914897 () Bool)

(declare-fun res!616921 () Bool)

(assert (=> b!914897 (=> (not res!616921) (not e!513344))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30567 0))(
  ( (V!30568 (val!9651 Int)) )
))
(declare-datatypes ((ValueCell!9119 0))(
  ( (ValueCellFull!9119 (v!12168 V!30567)) (EmptyCell!9119) )
))
(declare-datatypes ((array!54398 0))(
  ( (array!54399 (arr!26147 (Array (_ BitVec 32) ValueCell!9119)) (size!26606 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54398)

(assert (=> b!914897 (= res!616921 (and (= (size!26606 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26605 _keys!1487) (size!26606 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30549 () Bool)

(declare-fun mapRes!30549 () Bool)

(assert (=> mapIsEmpty!30549 mapRes!30549))

(declare-fun mapNonEmpty!30549 () Bool)

(declare-fun tp!58616 () Bool)

(declare-fun e!513343 () Bool)

(assert (=> mapNonEmpty!30549 (= mapRes!30549 (and tp!58616 e!513343))))

(declare-fun mapRest!30549 () (Array (_ BitVec 32) ValueCell!9119))

(declare-fun mapKey!30549 () (_ BitVec 32))

(declare-fun mapValue!30549 () ValueCell!9119)

(assert (=> mapNonEmpty!30549 (= (arr!26147 _values!1231) (store mapRest!30549 mapKey!30549 mapValue!30549))))

(declare-fun b!914899 () Bool)

(declare-fun e!513345 () Bool)

(declare-fun e!513347 () Bool)

(assert (=> b!914899 (= e!513345 (and e!513347 mapRes!30549))))

(declare-fun condMapEmpty!30549 () Bool)

(declare-fun mapDefault!30549 () ValueCell!9119)

