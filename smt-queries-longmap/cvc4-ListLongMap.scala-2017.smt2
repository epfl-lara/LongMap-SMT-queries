; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35182 () Bool)

(assert start!35182)

(declare-fun b_free!7775 () Bool)

(declare-fun b_next!7775 () Bool)

(assert (=> start!35182 (= b_free!7775 (not b_next!7775))))

(declare-fun tp!26916 () Bool)

(declare-fun b_and!15013 () Bool)

(assert (=> start!35182 (= tp!26916 b_and!15013)))

(declare-fun b!352672 () Bool)

(declare-fun e!215965 () Bool)

(declare-fun tp_is_empty!7727 () Bool)

(assert (=> b!352672 (= e!215965 tp_is_empty!7727)))

(declare-fun b!352673 () Bool)

(declare-fun res!195554 () Bool)

(declare-fun e!215967 () Bool)

(assert (=> b!352673 (=> (not res!195554) (not e!215967))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11279 0))(
  ( (V!11280 (val!3908 Int)) )
))
(declare-fun zeroValue!1467 () V!11279)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3520 0))(
  ( (ValueCellFull!3520 (v!6099 V!11279)) (EmptyCell!3520) )
))
(declare-datatypes ((array!19045 0))(
  ( (array!19046 (arr!9024 (Array (_ BitVec 32) ValueCell!3520)) (size!9376 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19045)

(declare-datatypes ((array!19047 0))(
  ( (array!19048 (arr!9025 (Array (_ BitVec 32) (_ BitVec 64))) (size!9377 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19047)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11279)

(declare-datatypes ((tuple2!5632 0))(
  ( (tuple2!5633 (_1!2827 (_ BitVec 64)) (_2!2827 V!11279)) )
))
(declare-datatypes ((List!5252 0))(
  ( (Nil!5249) (Cons!5248 (h!6104 tuple2!5632) (t!10398 List!5252)) )
))
(declare-datatypes ((ListLongMap!4545 0))(
  ( (ListLongMap!4546 (toList!2288 List!5252)) )
))
(declare-fun contains!2361 (ListLongMap!4545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1809 (array!19047 array!19045 (_ BitVec 32) (_ BitVec 32) V!11279 V!11279 (_ BitVec 32) Int) ListLongMap!4545)

(assert (=> b!352673 (= res!195554 (not (contains!2361 (getCurrentListMap!1809 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!352675 () Bool)

(declare-fun res!195553 () Bool)

(assert (=> b!352675 (=> (not res!195553) (not e!215967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19047 (_ BitVec 32)) Bool)

(assert (=> b!352675 (= res!195553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352676 () Bool)

(assert (=> b!352676 (= e!215967 false)))

(declare-datatypes ((SeekEntryResult!3471 0))(
  ( (MissingZero!3471 (index!16063 (_ BitVec 32))) (Found!3471 (index!16064 (_ BitVec 32))) (Intermediate!3471 (undefined!4283 Bool) (index!16065 (_ BitVec 32)) (x!35079 (_ BitVec 32))) (Undefined!3471) (MissingVacant!3471 (index!16066 (_ BitVec 32))) )
))
(declare-fun lt!165328 () SeekEntryResult!3471)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19047 (_ BitVec 32)) SeekEntryResult!3471)

(assert (=> b!352676 (= lt!165328 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!352677 () Bool)

(declare-fun res!195556 () Bool)

(assert (=> b!352677 (=> (not res!195556) (not e!215967))))

(declare-datatypes ((List!5253 0))(
  ( (Nil!5250) (Cons!5249 (h!6105 (_ BitVec 64)) (t!10399 List!5253)) )
))
(declare-fun arrayNoDuplicates!0 (array!19047 (_ BitVec 32) List!5253) Bool)

(assert (=> b!352677 (= res!195556 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5250))))

(declare-fun b!352678 () Bool)

(declare-fun e!215964 () Bool)

(assert (=> b!352678 (= e!215964 tp_is_empty!7727)))

(declare-fun mapIsEmpty!13074 () Bool)

(declare-fun mapRes!13074 () Bool)

(assert (=> mapIsEmpty!13074 mapRes!13074))

(declare-fun b!352679 () Bool)

(declare-fun e!215963 () Bool)

(assert (=> b!352679 (= e!215963 (and e!215964 mapRes!13074))))

(declare-fun condMapEmpty!13074 () Bool)

(declare-fun mapDefault!13074 () ValueCell!3520)

