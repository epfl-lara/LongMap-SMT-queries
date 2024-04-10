; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!454 () Bool)

(assert start!454)

(declare-fun b!2693 () Bool)

(declare-fun e!1034 () Bool)

(declare-fun tp_is_empty!59 () Bool)

(assert (=> b!2693 (= e!1034 tp_is_empty!59)))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun e!1035 () Bool)

(declare-datatypes ((V!255 0))(
  ( (V!256 (val!35 Int)) )
))
(declare-datatypes ((ValueCell!13 0))(
  ( (ValueCellFull!13 (v!1121 V!255)) (EmptyCell!13) )
))
(declare-datatypes ((array!49 0))(
  ( (array!50 (arr!23 (Array (_ BitVec 32) ValueCell!13)) (size!85 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!49)

(declare-datatypes ((array!51 0))(
  ( (array!52 (arr!24 (Array (_ BitVec 32) (_ BitVec 64))) (size!86 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!51)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun b!2694 () Bool)

(assert (=> b!2694 (= e!1035 (and (= (size!85 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!86 _keys!1806) (size!85 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011) (not (= (size!86 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)))))))

(declare-fun res!4808 () Bool)

(assert (=> start!454 (=> (not res!4808) (not e!1035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!454 (= res!4808 (validMask!0 mask!2250))))

(assert (=> start!454 e!1035))

(assert (=> start!454 true))

(declare-fun e!1036 () Bool)

(declare-fun array_inv!9 (array!49) Bool)

(assert (=> start!454 (and (array_inv!9 _values!1492) e!1036)))

(declare-fun array_inv!10 (array!51) Bool)

(assert (=> start!454 (array_inv!10 _keys!1806)))

(declare-fun b!2695 () Bool)

(declare-fun mapRes!29 () Bool)

(assert (=> b!2695 (= e!1036 (and e!1034 mapRes!29))))

(declare-fun condMapEmpty!29 () Bool)

(declare-fun mapDefault!29 () ValueCell!13)

