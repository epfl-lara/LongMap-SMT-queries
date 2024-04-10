; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40314 () Bool)

(assert start!40314)

(declare-fun b!442690 () Bool)

(declare-fun res!262205 () Bool)

(declare-fun e!260558 () Bool)

(assert (=> b!442690 (=> (not res!262205) (not e!260558))))

(declare-datatypes ((array!27237 0))(
  ( (array!27238 (arr!13067 (Array (_ BitVec 32) (_ BitVec 64))) (size!13419 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27237)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27237 (_ BitVec 32)) Bool)

(assert (=> b!442690 (= res!262205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442691 () Bool)

(declare-fun res!262206 () Bool)

(assert (=> b!442691 (=> (not res!262206) (not e!260558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442691 (= res!262206 (validMask!0 mask!1025))))

(declare-fun b!442692 () Bool)

(declare-fun e!260556 () Bool)

(declare-fun e!260559 () Bool)

(declare-fun mapRes!19194 () Bool)

(assert (=> b!442692 (= e!260556 (and e!260559 mapRes!19194))))

(declare-fun condMapEmpty!19194 () Bool)

(declare-datatypes ((V!16723 0))(
  ( (V!16724 (val!5901 Int)) )
))
(declare-datatypes ((ValueCell!5513 0))(
  ( (ValueCellFull!5513 (v!8152 V!16723)) (EmptyCell!5513) )
))
(declare-datatypes ((array!27239 0))(
  ( (array!27240 (arr!13068 (Array (_ BitVec 32) ValueCell!5513)) (size!13420 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27239)

(declare-fun mapDefault!19194 () ValueCell!5513)

