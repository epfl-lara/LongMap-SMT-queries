; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40516 () Bool)

(assert start!40516)

(declare-fun b!446346 () Bool)

(declare-fun res!264915 () Bool)

(declare-fun e!262238 () Bool)

(assert (=> b!446346 (=> (not res!264915) (not e!262238))))

(declare-datatypes ((array!27571 0))(
  ( (array!27572 (arr!13232 (Array (_ BitVec 32) (_ BitVec 64))) (size!13584 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27571)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446346 (= res!264915 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!446347 () Bool)

(declare-fun e!262241 () Bool)

(declare-fun tp_is_empty!11881 () Bool)

(assert (=> b!446347 (= e!262241 tp_is_empty!11881)))

(declare-fun b!446348 () Bool)

(declare-fun e!262237 () Bool)

(assert (=> b!446348 (= e!262237 false)))

(declare-fun lt!203794 () Bool)

(declare-fun lt!203795 () array!27571)

(declare-datatypes ((List!7917 0))(
  ( (Nil!7914) (Cons!7913 (h!8769 (_ BitVec 64)) (t!13677 List!7917)) )
))
(declare-fun arrayNoDuplicates!0 (array!27571 (_ BitVec 32) List!7917) Bool)

(assert (=> b!446348 (= lt!203794 (arrayNoDuplicates!0 lt!203795 #b00000000000000000000000000000000 Nil!7914))))

(declare-fun b!446349 () Bool)

(declare-fun res!264913 () Bool)

(assert (=> b!446349 (=> (not res!264913) (not e!262238))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446349 (= res!264913 (or (= (select (arr!13232 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13232 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446350 () Bool)

(declare-fun res!264914 () Bool)

(assert (=> b!446350 (=> (not res!264914) (not e!262238))))

(assert (=> b!446350 (= res!264914 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7914))))

(declare-fun b!446351 () Bool)

(declare-fun e!262240 () Bool)

(declare-fun e!262239 () Bool)

(declare-fun mapRes!19452 () Bool)

(assert (=> b!446351 (= e!262240 (and e!262239 mapRes!19452))))

(declare-fun condMapEmpty!19452 () Bool)

(declare-datatypes ((V!16947 0))(
  ( (V!16948 (val!5985 Int)) )
))
(declare-datatypes ((ValueCell!5597 0))(
  ( (ValueCellFull!5597 (v!8240 V!16947)) (EmptyCell!5597) )
))
(declare-datatypes ((array!27573 0))(
  ( (array!27574 (arr!13233 (Array (_ BitVec 32) ValueCell!5597)) (size!13585 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27573)

(declare-fun mapDefault!19452 () ValueCell!5597)

