; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40300 () Bool)

(assert start!40300)

(declare-fun b!442533 () Bool)

(declare-fun res!262112 () Bool)

(declare-fun e!260452 () Bool)

(assert (=> b!442533 (=> (not res!262112) (not e!260452))))

(declare-datatypes ((array!27211 0))(
  ( (array!27212 (arr!13054 (Array (_ BitVec 32) (_ BitVec 64))) (size!13406 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27211)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27211 (_ BitVec 32)) Bool)

(assert (=> b!442533 (= res!262112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19173 () Bool)

(declare-fun mapRes!19173 () Bool)

(assert (=> mapIsEmpty!19173 mapRes!19173))

(declare-fun b!442534 () Bool)

(declare-fun e!260451 () Bool)

(declare-fun e!260455 () Bool)

(assert (=> b!442534 (= e!260451 (and e!260455 mapRes!19173))))

(declare-fun condMapEmpty!19173 () Bool)

(declare-datatypes ((V!16703 0))(
  ( (V!16704 (val!5894 Int)) )
))
(declare-datatypes ((ValueCell!5506 0))(
  ( (ValueCellFull!5506 (v!8145 V!16703)) (EmptyCell!5506) )
))
(declare-datatypes ((array!27213 0))(
  ( (array!27214 (arr!13055 (Array (_ BitVec 32) ValueCell!5506)) (size!13407 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27213)

(declare-fun mapDefault!19173 () ValueCell!5506)

