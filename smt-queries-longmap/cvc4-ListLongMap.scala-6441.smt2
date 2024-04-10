; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82490 () Bool)

(assert start!82490)

(declare-fun res!643450 () Bool)

(declare-fun e!542060 () Bool)

(assert (=> start!82490 (=> (not res!643450) (not e!542060))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82490 (= res!643450 (validMask!0 mask!2110))))

(assert (=> start!82490 e!542060))

(assert (=> start!82490 true))

(declare-datatypes ((V!33549 0))(
  ( (V!33550 (val!10763 Int)) )
))
(declare-datatypes ((ValueCell!10231 0))(
  ( (ValueCellFull!10231 (v!13321 V!33549)) (EmptyCell!10231) )
))
(declare-datatypes ((array!58947 0))(
  ( (array!58948 (arr!28342 (Array (_ BitVec 32) ValueCell!10231)) (size!28821 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58947)

(declare-fun e!542057 () Bool)

(declare-fun array_inv!21961 (array!58947) Bool)

(assert (=> start!82490 (and (array_inv!21961 _values!1400) e!542057)))

(declare-datatypes ((array!58949 0))(
  ( (array!58950 (arr!28343 (Array (_ BitVec 32) (_ BitVec 64))) (size!28822 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58949)

(declare-fun array_inv!21962 (array!58949) Bool)

(assert (=> start!82490 (array_inv!21962 _keys!1686)))

(declare-fun mapIsEmpty!34132 () Bool)

(declare-fun mapRes!34132 () Bool)

(assert (=> mapIsEmpty!34132 mapRes!34132))

(declare-fun mapNonEmpty!34132 () Bool)

(declare-fun tp!65061 () Bool)

(declare-fun e!542059 () Bool)

(assert (=> mapNonEmpty!34132 (= mapRes!34132 (and tp!65061 e!542059))))

(declare-fun mapRest!34132 () (Array (_ BitVec 32) ValueCell!10231))

(declare-fun mapValue!34132 () ValueCell!10231)

(declare-fun mapKey!34132 () (_ BitVec 32))

(assert (=> mapNonEmpty!34132 (= (arr!28342 _values!1400) (store mapRest!34132 mapKey!34132 mapValue!34132))))

(declare-fun b!961388 () Bool)

(declare-fun e!542058 () Bool)

(assert (=> b!961388 (= e!542057 (and e!542058 mapRes!34132))))

(declare-fun condMapEmpty!34132 () Bool)

(declare-fun mapDefault!34132 () ValueCell!10231)

