; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82442 () Bool)

(assert start!82442)

(declare-fun b!961110 () Bool)

(declare-fun e!541848 () Bool)

(declare-datatypes ((array!58905 0))(
  ( (array!58906 (arr!28324 (Array (_ BitVec 32) (_ BitVec 64))) (size!28803 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58905)

(assert (=> b!961110 (= e!541848 (and (bvsle #b00000000000000000000000000000000 (size!28803 _keys!1686)) (bvsge (size!28803 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun b!961111 () Bool)

(declare-fun res!643293 () Bool)

(assert (=> b!961111 (=> (not res!643293) (not e!541848))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58905 (_ BitVec 32)) Bool)

(assert (=> b!961111 (= res!643293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34096 () Bool)

(declare-fun mapRes!34096 () Bool)

(assert (=> mapIsEmpty!34096 mapRes!34096))

(declare-fun b!961113 () Bool)

(declare-fun e!541851 () Bool)

(declare-fun tp_is_empty!21407 () Bool)

(assert (=> b!961113 (= e!541851 tp_is_empty!21407)))

(declare-fun b!961114 () Bool)

(declare-fun e!541850 () Bool)

(assert (=> b!961114 (= e!541850 tp_is_empty!21407)))

(declare-fun b!961112 () Bool)

(declare-fun e!541847 () Bool)

(assert (=> b!961112 (= e!541847 (and e!541850 mapRes!34096))))

(declare-fun condMapEmpty!34096 () Bool)

(declare-datatypes ((V!33525 0))(
  ( (V!33526 (val!10754 Int)) )
))
(declare-datatypes ((ValueCell!10222 0))(
  ( (ValueCellFull!10222 (v!13311 V!33525)) (EmptyCell!10222) )
))
(declare-datatypes ((array!58907 0))(
  ( (array!58908 (arr!28325 (Array (_ BitVec 32) ValueCell!10222)) (size!28804 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58907)

(declare-fun mapDefault!34096 () ValueCell!10222)

