; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106974 () Bool)

(assert start!106974)

(declare-fun mapIsEmpty!50575 () Bool)

(declare-fun mapRes!50575 () Bool)

(assert (=> mapIsEmpty!50575 mapRes!50575))

(declare-fun b!1268465 () Bool)

(declare-fun res!844263 () Bool)

(declare-fun e!722804 () Bool)

(assert (=> b!1268465 (=> (not res!844263) (not e!722804))))

(declare-datatypes ((array!82600 0))(
  ( (array!82601 (arr!39837 (Array (_ BitVec 32) (_ BitVec 64))) (size!40373 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82600)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82600 (_ BitVec 32)) Bool)

(assert (=> b!1268465 (= res!844263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268466 () Bool)

(declare-fun e!722806 () Bool)

(declare-fun e!722807 () Bool)

(assert (=> b!1268466 (= e!722806 (and e!722807 mapRes!50575))))

(declare-fun condMapEmpty!50575 () Bool)

(declare-datatypes ((V!48743 0))(
  ( (V!48744 (val!16406 Int)) )
))
(declare-datatypes ((ValueCell!15478 0))(
  ( (ValueCellFull!15478 (v!19043 V!48743)) (EmptyCell!15478) )
))
(declare-datatypes ((array!82602 0))(
  ( (array!82603 (arr!39838 (Array (_ BitVec 32) ValueCell!15478)) (size!40374 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82602)

(declare-fun mapDefault!50575 () ValueCell!15478)

