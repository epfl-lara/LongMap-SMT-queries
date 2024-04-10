; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82452 () Bool)

(assert start!82452)

(declare-fun b!961150 () Bool)

(declare-fun e!541881 () Bool)

(declare-fun tp_is_empty!21409 () Bool)

(assert (=> b!961150 (= e!541881 tp_is_empty!21409)))

(declare-fun res!643310 () Bool)

(declare-fun e!541879 () Bool)

(assert (=> start!82452 (=> (not res!643310) (not e!541879))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82452 (= res!643310 (validMask!0 mask!2110))))

(assert (=> start!82452 e!541879))

(assert (=> start!82452 true))

(declare-datatypes ((V!33529 0))(
  ( (V!33530 (val!10755 Int)) )
))
(declare-datatypes ((ValueCell!10223 0))(
  ( (ValueCellFull!10223 (v!13312 V!33529)) (EmptyCell!10223) )
))
(declare-datatypes ((array!58911 0))(
  ( (array!58912 (arr!28326 (Array (_ BitVec 32) ValueCell!10223)) (size!28805 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58911)

(declare-fun e!541877 () Bool)

(declare-fun array_inv!21949 (array!58911) Bool)

(assert (=> start!82452 (and (array_inv!21949 _values!1400) e!541877)))

(declare-datatypes ((array!58913 0))(
  ( (array!58914 (arr!28327 (Array (_ BitVec 32) (_ BitVec 64))) (size!28806 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58913)

(declare-fun array_inv!21950 (array!58913) Bool)

(assert (=> start!82452 (array_inv!21950 _keys!1686)))

(declare-fun b!961151 () Bool)

(declare-fun mapRes!34102 () Bool)

(assert (=> b!961151 (= e!541877 (and e!541881 mapRes!34102))))

(declare-fun condMapEmpty!34102 () Bool)

(declare-fun mapDefault!34102 () ValueCell!10223)

