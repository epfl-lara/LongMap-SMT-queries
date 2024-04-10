; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37864 () Bool)

(assert start!37864)

(declare-fun b_free!8923 () Bool)

(declare-fun b_next!8923 () Bool)

(assert (=> start!37864 (= b_free!8923 (not b_next!8923))))

(declare-fun tp!31527 () Bool)

(declare-fun b_and!16189 () Bool)

(assert (=> start!37864 (= tp!31527 b_and!16189)))

(declare-fun b!389155 () Bool)

(declare-fun res!222575 () Bool)

(declare-fun e!235782 () Bool)

(assert (=> b!389155 (=> (not res!222575) (not e!235782))))

(declare-datatypes ((array!23083 0))(
  ( (array!23084 (arr!11008 (Array (_ BitVec 32) (_ BitVec 64))) (size!11360 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23083)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389155 (= res!222575 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!389156 () Bool)

(declare-fun e!235781 () Bool)

(declare-fun e!235779 () Bool)

(declare-fun mapRes!15963 () Bool)

(assert (=> b!389156 (= e!235781 (and e!235779 mapRes!15963))))

(declare-fun condMapEmpty!15963 () Bool)

(declare-datatypes ((V!13899 0))(
  ( (V!13900 (val!4842 Int)) )
))
(declare-datatypes ((ValueCell!4454 0))(
  ( (ValueCellFull!4454 (v!7047 V!13899)) (EmptyCell!4454) )
))
(declare-datatypes ((array!23085 0))(
  ( (array!23086 (arr!11009 (Array (_ BitVec 32) ValueCell!4454)) (size!11361 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23085)

(declare-fun mapDefault!15963 () ValueCell!4454)

