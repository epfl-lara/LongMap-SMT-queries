; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40296 () Bool)

(assert start!40296)

(declare-fun b!442491 () Bool)

(declare-fun res!262086 () Bool)

(declare-fun e!260421 () Bool)

(assert (=> b!442491 (=> (not res!262086) (not e!260421))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442491 (= res!262086 (validMask!0 mask!1025))))

(declare-fun b!442492 () Bool)

(declare-fun e!260424 () Bool)

(declare-fun tp_is_empty!11695 () Bool)

(assert (=> b!442492 (= e!260424 tp_is_empty!11695)))

(declare-fun b!442493 () Bool)

(declare-fun res!262087 () Bool)

(assert (=> b!442493 (=> (not res!262087) (not e!260421))))

(declare-datatypes ((array!27203 0))(
  ( (array!27204 (arr!13050 (Array (_ BitVec 32) (_ BitVec 64))) (size!13402 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27203)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27203 (_ BitVec 32)) Bool)

(assert (=> b!442493 (= res!262087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442494 () Bool)

(declare-fun e!260423 () Bool)

(declare-fun e!260425 () Bool)

(declare-fun mapRes!19167 () Bool)

(assert (=> b!442494 (= e!260423 (and e!260425 mapRes!19167))))

(declare-fun condMapEmpty!19167 () Bool)

(declare-datatypes ((V!16699 0))(
  ( (V!16700 (val!5892 Int)) )
))
(declare-datatypes ((ValueCell!5504 0))(
  ( (ValueCellFull!5504 (v!8143 V!16699)) (EmptyCell!5504) )
))
(declare-datatypes ((array!27205 0))(
  ( (array!27206 (arr!13051 (Array (_ BitVec 32) ValueCell!5504)) (size!13403 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27205)

(declare-fun mapDefault!19167 () ValueCell!5504)

