; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37892 () Bool)

(assert start!37892)

(declare-fun b_free!8929 () Bool)

(declare-fun b_next!8929 () Bool)

(assert (=> start!37892 (= b_free!8929 (not b_next!8929))))

(declare-fun tp!31548 () Bool)

(declare-fun b_and!16207 () Bool)

(assert (=> start!37892 (= tp!31548 b_and!16207)))

(declare-fun b!389507 () Bool)

(declare-fun res!222789 () Bool)

(declare-fun e!235985 () Bool)

(assert (=> b!389507 (=> (not res!222789) (not e!235985))))

(declare-datatypes ((array!23097 0))(
  ( (array!23098 (arr!11014 (Array (_ BitVec 32) (_ BitVec 64))) (size!11366 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23097)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389507 (= res!222789 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!389508 () Bool)

(declare-fun res!222792 () Bool)

(assert (=> b!389508 (=> (not res!222792) (not e!235985))))

(declare-datatypes ((List!6369 0))(
  ( (Nil!6366) (Cons!6365 (h!7221 (_ BitVec 64)) (t!11525 List!6369)) )
))
(declare-fun arrayNoDuplicates!0 (array!23097 (_ BitVec 32) List!6369) Bool)

(assert (=> b!389508 (= res!222792 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6366))))

(declare-fun b!389509 () Bool)

(declare-fun res!222790 () Bool)

(assert (=> b!389509 (=> (not res!222790) (not e!235985))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23097 (_ BitVec 32)) Bool)

(assert (=> b!389509 (= res!222790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15975 () Bool)

(declare-fun mapRes!15975 () Bool)

(assert (=> mapIsEmpty!15975 mapRes!15975))

(declare-fun b!389510 () Bool)

(declare-fun e!235982 () Bool)

(declare-fun tp_is_empty!9601 () Bool)

(assert (=> b!389510 (= e!235982 tp_is_empty!9601)))

(declare-fun b!389511 () Bool)

(declare-fun e!235987 () Bool)

(assert (=> b!389511 (= e!235987 (and e!235982 mapRes!15975))))

(declare-fun condMapEmpty!15975 () Bool)

(declare-datatypes ((V!13907 0))(
  ( (V!13908 (val!4845 Int)) )
))
(declare-datatypes ((ValueCell!4457 0))(
  ( (ValueCellFull!4457 (v!7054 V!13907)) (EmptyCell!4457) )
))
(declare-datatypes ((array!23099 0))(
  ( (array!23100 (arr!11015 (Array (_ BitVec 32) ValueCell!4457)) (size!11367 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23099)

(declare-fun mapDefault!15975 () ValueCell!4457)

