; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37284 () Bool)

(assert start!37284)

(declare-fun b_free!8411 () Bool)

(declare-fun b_next!8411 () Bool)

(assert (=> start!37284 (= b_free!8411 (not b_next!8411))))

(declare-fun tp!29948 () Bool)

(declare-fun b_and!15653 () Bool)

(assert (=> start!37284 (= tp!29948 b_and!15653)))

(declare-fun b!377691 () Bool)

(declare-fun e!229933 () Bool)

(declare-fun e!229927 () Bool)

(declare-fun mapRes!15153 () Bool)

(assert (=> b!377691 (= e!229933 (and e!229927 mapRes!15153))))

(declare-fun condMapEmpty!15153 () Bool)

(declare-datatypes ((V!13183 0))(
  ( (V!13184 (val!4574 Int)) )
))
(declare-datatypes ((ValueCell!4186 0))(
  ( (ValueCellFull!4186 (v!6771 V!13183)) (EmptyCell!4186) )
))
(declare-datatypes ((array!22047 0))(
  ( (array!22048 (arr!10492 (Array (_ BitVec 32) ValueCell!4186)) (size!10844 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22047)

(declare-fun mapDefault!15153 () ValueCell!4186)

