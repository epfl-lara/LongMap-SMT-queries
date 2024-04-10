; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37190 () Bool)

(assert start!37190)

(declare-fun b_free!8317 () Bool)

(declare-fun b_next!8317 () Bool)

(assert (=> start!37190 (= b_free!8317 (not b_next!8317))))

(declare-fun tp!29667 () Bool)

(declare-fun b_and!15559 () Bool)

(assert (=> start!37190 (= tp!29667 b_and!15559)))

(declare-fun b!375567 () Bool)

(declare-fun res!212046 () Bool)

(declare-fun e!228805 () Bool)

(assert (=> b!375567 (=> (not res!212046) (not e!228805))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21865 0))(
  ( (array!21866 (arr!10401 (Array (_ BitVec 32) (_ BitVec 64))) (size!10753 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21865)

(assert (=> b!375567 (= res!212046 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10753 _keys!658))))))

(declare-fun b!375568 () Bool)

(declare-fun e!228799 () Bool)

(assert (=> b!375568 (= e!228805 e!228799)))

(declare-fun res!212056 () Bool)

(assert (=> b!375568 (=> (not res!212056) (not e!228799))))

(declare-fun lt!173902 () array!21865)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21865 (_ BitVec 32)) Bool)

(assert (=> b!375568 (= res!212056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173902 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!375568 (= lt!173902 (array!21866 (store (arr!10401 _keys!658) i!548 k!778) (size!10753 _keys!658)))))

(declare-fun b!375569 () Bool)

(declare-fun e!228803 () Bool)

(declare-fun e!228806 () Bool)

(declare-fun mapRes!15012 () Bool)

(assert (=> b!375569 (= e!228803 (and e!228806 mapRes!15012))))

(declare-fun condMapEmpty!15012 () Bool)

(declare-datatypes ((V!13059 0))(
  ( (V!13060 (val!4527 Int)) )
))
(declare-datatypes ((ValueCell!4139 0))(
  ( (ValueCellFull!4139 (v!6724 V!13059)) (EmptyCell!4139) )
))
(declare-datatypes ((array!21867 0))(
  ( (array!21868 (arr!10402 (Array (_ BitVec 32) ValueCell!4139)) (size!10754 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21867)

(declare-fun mapDefault!15012 () ValueCell!4139)

