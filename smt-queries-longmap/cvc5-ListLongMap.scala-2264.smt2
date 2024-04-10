; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37046 () Bool)

(assert start!37046)

(declare-fun b_free!8173 () Bool)

(declare-fun b_next!8173 () Bool)

(assert (=> start!37046 (= b_free!8173 (not b_next!8173))))

(declare-fun tp!29235 () Bool)

(declare-fun b_and!15415 () Bool)

(assert (=> start!37046 (= tp!29235 b_and!15415)))

(declare-fun b!372413 () Bool)

(declare-fun e!227168 () Bool)

(declare-fun tp_is_empty!8821 () Bool)

(assert (=> b!372413 (= e!227168 tp_is_empty!8821)))

(declare-fun b!372414 () Bool)

(declare-fun res!209547 () Bool)

(declare-fun e!227166 () Bool)

(assert (=> b!372414 (=> (not res!209547) (not e!227166))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21583 0))(
  ( (array!21584 (arr!10260 (Array (_ BitVec 32) (_ BitVec 64))) (size!10612 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21583)

(assert (=> b!372414 (= res!209547 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10612 _keys!658))))))

(declare-fun b!372415 () Bool)

(declare-fun res!209549 () Bool)

(assert (=> b!372415 (=> (not res!209549) (not e!227166))))

(declare-datatypes ((List!5752 0))(
  ( (Nil!5749) (Cons!5748 (h!6604 (_ BitVec 64)) (t!10902 List!5752)) )
))
(declare-fun arrayNoDuplicates!0 (array!21583 (_ BitVec 32) List!5752) Bool)

(assert (=> b!372415 (= res!209549 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5749))))

(declare-fun b!372416 () Bool)

(declare-fun res!209540 () Bool)

(assert (=> b!372416 (=> (not res!209540) (not e!227166))))

(declare-datatypes ((V!12867 0))(
  ( (V!12868 (val!4455 Int)) )
))
(declare-datatypes ((ValueCell!4067 0))(
  ( (ValueCellFull!4067 (v!6652 V!12867)) (EmptyCell!4067) )
))
(declare-datatypes ((array!21585 0))(
  ( (array!21586 (arr!10261 (Array (_ BitVec 32) ValueCell!4067)) (size!10613 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21585)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372416 (= res!209540 (and (= (size!10613 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10612 _keys!658) (size!10613 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14796 () Bool)

(declare-fun mapRes!14796 () Bool)

(assert (=> mapIsEmpty!14796 mapRes!14796))

(declare-fun b!372417 () Bool)

(declare-fun e!227169 () Bool)

(declare-fun e!227167 () Bool)

(assert (=> b!372417 (= e!227169 (and e!227167 mapRes!14796))))

(declare-fun condMapEmpty!14796 () Bool)

(declare-fun mapDefault!14796 () ValueCell!4067)

