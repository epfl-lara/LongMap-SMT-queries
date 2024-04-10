; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4580 () Bool)

(assert start!4580)

(declare-fun b_free!1279 () Bool)

(declare-fun b_next!1279 () Bool)

(assert (=> start!4580 (= b_free!1279 (not b_next!1279))))

(declare-fun tp!5284 () Bool)

(declare-fun b_and!2107 () Bool)

(assert (=> start!4580 (= tp!5284 b_and!2107)))

(declare-fun b!35833 () Bool)

(declare-fun res!21751 () Bool)

(declare-fun e!22640 () Bool)

(assert (=> b!35833 (=> (not res!21751) (not e!22640))))

(declare-datatypes ((array!2481 0))(
  ( (array!2482 (arr!1185 (Array (_ BitVec 32) (_ BitVec 64))) (size!1286 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2481)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2481 (_ BitVec 32)) Bool)

(assert (=> b!35833 (= res!21751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35834 () Bool)

(declare-fun e!22641 () Bool)

(declare-fun e!22637 () Bool)

(declare-fun mapRes!2005 () Bool)

(assert (=> b!35834 (= e!22641 (and e!22637 mapRes!2005))))

(declare-fun condMapEmpty!2005 () Bool)

(declare-datatypes ((V!2003 0))(
  ( (V!2004 (val!843 Int)) )
))
(declare-datatypes ((ValueCell!617 0))(
  ( (ValueCellFull!617 (v!1941 V!2003)) (EmptyCell!617) )
))
(declare-datatypes ((array!2483 0))(
  ( (array!2484 (arr!1186 (Array (_ BitVec 32) ValueCell!617)) (size!1287 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2483)

(declare-fun mapDefault!2005 () ValueCell!617)

