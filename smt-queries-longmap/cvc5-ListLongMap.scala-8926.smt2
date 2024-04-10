; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108238 () Bool)

(assert start!108238)

(declare-fun res!849186 () Bool)

(declare-fun e!729989 () Bool)

(assert (=> start!108238 (=> (not res!849186) (not e!729989))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108238 (= res!849186 (validMask!0 mask!2175))))

(assert (=> start!108238 e!729989))

(assert (=> start!108238 true))

(declare-datatypes ((V!49729 0))(
  ( (V!49730 (val!16809 Int)) )
))
(declare-datatypes ((ValueCell!15836 0))(
  ( (ValueCellFull!15836 (v!19408 V!49729)) (EmptyCell!15836) )
))
(declare-datatypes ((array!84026 0))(
  ( (array!84027 (arr!40522 (Array (_ BitVec 32) ValueCell!15836)) (size!41072 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84026)

(declare-fun e!729988 () Bool)

(declare-fun array_inv!30781 (array!84026) Bool)

(assert (=> start!108238 (and (array_inv!30781 _values!1445) e!729988)))

(declare-datatypes ((array!84028 0))(
  ( (array!84029 (arr!40523 (Array (_ BitVec 32) (_ BitVec 64))) (size!41073 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84028)

(declare-fun array_inv!30782 (array!84028) Bool)

(assert (=> start!108238 (array_inv!30782 _keys!1741)))

(declare-fun mapIsEmpty!51740 () Bool)

(declare-fun mapRes!51740 () Bool)

(assert (=> mapIsEmpty!51740 mapRes!51740))

(declare-fun b!1278097 () Bool)

(declare-fun e!729986 () Bool)

(assert (=> b!1278097 (= e!729988 (and e!729986 mapRes!51740))))

(declare-fun condMapEmpty!51740 () Bool)

(declare-fun mapDefault!51740 () ValueCell!15836)

