; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82496 () Bool)

(assert start!82496)

(declare-fun mapIsEmpty!34141 () Bool)

(declare-fun mapRes!34141 () Bool)

(assert (=> mapIsEmpty!34141 mapRes!34141))

(declare-fun b!961442 () Bool)

(declare-fun e!542105 () Bool)

(declare-fun tp_is_empty!21431 () Bool)

(assert (=> b!961442 (= e!542105 tp_is_empty!21431)))

(declare-fun b!961443 () Bool)

(declare-fun e!542101 () Bool)

(assert (=> b!961443 (= e!542101 tp_is_empty!21431)))

(declare-fun res!643477 () Bool)

(declare-fun e!542102 () Bool)

(assert (=> start!82496 (=> (not res!643477) (not e!542102))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82496 (= res!643477 (validMask!0 mask!2110))))

(assert (=> start!82496 e!542102))

(assert (=> start!82496 true))

(declare-datatypes ((V!33557 0))(
  ( (V!33558 (val!10766 Int)) )
))
(declare-datatypes ((ValueCell!10234 0))(
  ( (ValueCellFull!10234 (v!13324 V!33557)) (EmptyCell!10234) )
))
(declare-datatypes ((array!58959 0))(
  ( (array!58960 (arr!28348 (Array (_ BitVec 32) ValueCell!10234)) (size!28827 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58959)

(declare-fun e!542104 () Bool)

(declare-fun array_inv!21967 (array!58959) Bool)

(assert (=> start!82496 (and (array_inv!21967 _values!1400) e!542104)))

(declare-datatypes ((array!58961 0))(
  ( (array!58962 (arr!28349 (Array (_ BitVec 32) (_ BitVec 64))) (size!28828 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58961)

(declare-fun array_inv!21968 (array!58961) Bool)

(assert (=> start!82496 (array_inv!21968 _keys!1686)))

(declare-fun b!961444 () Bool)

(assert (=> b!961444 (= e!542104 (and e!542101 mapRes!34141))))

(declare-fun condMapEmpty!34141 () Bool)

(declare-fun mapDefault!34141 () ValueCell!10234)

