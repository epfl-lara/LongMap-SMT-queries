; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72820 () Bool)

(assert start!72820)

(declare-fun b!845075 () Bool)

(declare-fun res!574094 () Bool)

(declare-fun e!471768 () Bool)

(assert (=> b!845075 (=> (not res!574094) (not e!471768))))

(declare-datatypes ((array!47964 0))(
  ( (array!47965 (arr!23013 (Array (_ BitVec 32) (_ BitVec 64))) (size!23453 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47964)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47964 (_ BitVec 32)) Bool)

(assert (=> b!845075 (= res!574094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845076 () Bool)

(declare-fun res!574097 () Bool)

(assert (=> b!845076 (=> (not res!574097) (not e!471768))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26209 0))(
  ( (V!26210 (val!7983 Int)) )
))
(declare-datatypes ((ValueCell!7496 0))(
  ( (ValueCellFull!7496 (v!10408 V!26209)) (EmptyCell!7496) )
))
(declare-datatypes ((array!47966 0))(
  ( (array!47967 (arr!23014 (Array (_ BitVec 32) ValueCell!7496)) (size!23454 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47966)

(assert (=> b!845076 (= res!574097 (and (= (size!23454 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23453 _keys!868) (size!23454 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845077 () Bool)

(declare-fun e!471772 () Bool)

(declare-fun e!471771 () Bool)

(declare-fun mapRes!25406 () Bool)

(assert (=> b!845077 (= e!471772 (and e!471771 mapRes!25406))))

(declare-fun condMapEmpty!25406 () Bool)

(declare-fun mapDefault!25406 () ValueCell!7496)

