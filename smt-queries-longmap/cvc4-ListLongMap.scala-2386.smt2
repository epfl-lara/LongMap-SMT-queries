; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37782 () Bool)

(assert start!37782)

(declare-fun b_free!8885 () Bool)

(declare-fun b_next!8885 () Bool)

(assert (=> start!37782 (= b_free!8885 (not b_next!8885))))

(declare-fun tp!31406 () Bool)

(declare-fun b_and!16127 () Bool)

(assert (=> start!37782 (= tp!31406 b_and!16127)))

(declare-fun b!387962 () Bool)

(declare-fun res!221777 () Bool)

(declare-fun e!235134 () Bool)

(assert (=> b!387962 (=> (not res!221777) (not e!235134))))

(declare-datatypes ((array!23005 0))(
  ( (array!23006 (arr!10971 (Array (_ BitVec 32) (_ BitVec 64))) (size!11323 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23005)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387962 (= res!221777 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!387963 () Bool)

(declare-fun res!221782 () Bool)

(assert (=> b!387963 (=> (not res!221782) (not e!235134))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387963 (= res!221782 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11323 _keys!658))))))

(declare-fun b!387964 () Bool)

(declare-fun e!235135 () Bool)

(declare-fun e!235133 () Bool)

(declare-fun mapRes!15900 () Bool)

(assert (=> b!387964 (= e!235135 (and e!235133 mapRes!15900))))

(declare-fun condMapEmpty!15900 () Bool)

(declare-datatypes ((V!13847 0))(
  ( (V!13848 (val!4823 Int)) )
))
(declare-datatypes ((ValueCell!4435 0))(
  ( (ValueCellFull!4435 (v!7020 V!13847)) (EmptyCell!4435) )
))
(declare-datatypes ((array!23007 0))(
  ( (array!23008 (arr!10972 (Array (_ BitVec 32) ValueCell!4435)) (size!11324 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23007)

(declare-fun mapDefault!15900 () ValueCell!4435)

