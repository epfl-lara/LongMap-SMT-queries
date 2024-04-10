; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37422 () Bool)

(assert start!37422)

(declare-fun b_free!8549 () Bool)

(declare-fun b_next!8549 () Bool)

(assert (=> start!37422 (= b_free!8549 (not b_next!8549))))

(declare-fun tp!30363 () Bool)

(declare-fun b_and!15791 () Bool)

(assert (=> start!37422 (= tp!30363 b_and!15791)))

(declare-fun b!380805 () Bool)

(declare-fun res!216251 () Bool)

(declare-fun e!231590 () Bool)

(assert (=> b!380805 (=> (not res!216251) (not e!231590))))

(declare-datatypes ((array!22313 0))(
  ( (array!22314 (arr!10625 (Array (_ BitVec 32) (_ BitVec 64))) (size!10977 (_ BitVec 32))) )
))
(declare-fun lt!178379 () array!22313)

(declare-datatypes ((List!6062 0))(
  ( (Nil!6059) (Cons!6058 (h!6914 (_ BitVec 64)) (t!11212 List!6062)) )
))
(declare-fun arrayNoDuplicates!0 (array!22313 (_ BitVec 32) List!6062) Bool)

(assert (=> b!380805 (= res!216251 (arrayNoDuplicates!0 lt!178379 #b00000000000000000000000000000000 Nil!6059))))

(declare-fun b!380806 () Bool)

(declare-fun res!216247 () Bool)

(declare-fun e!231589 () Bool)

(assert (=> b!380806 (=> (not res!216247) (not e!231589))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380806 (= res!216247 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!15360 () Bool)

(declare-fun mapRes!15360 () Bool)

(declare-fun tp!30362 () Bool)

(declare-fun e!231586 () Bool)

(assert (=> mapNonEmpty!15360 (= mapRes!15360 (and tp!30362 e!231586))))

(declare-datatypes ((V!13367 0))(
  ( (V!13368 (val!4643 Int)) )
))
(declare-datatypes ((ValueCell!4255 0))(
  ( (ValueCellFull!4255 (v!6840 V!13367)) (EmptyCell!4255) )
))
(declare-fun mapRest!15360 () (Array (_ BitVec 32) ValueCell!4255))

(declare-datatypes ((array!22315 0))(
  ( (array!22316 (arr!10626 (Array (_ BitVec 32) ValueCell!4255)) (size!10978 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22315)

(declare-fun mapValue!15360 () ValueCell!4255)

(declare-fun mapKey!15360 () (_ BitVec 32))

(assert (=> mapNonEmpty!15360 (= (arr!10626 _values!506) (store mapRest!15360 mapKey!15360 mapValue!15360))))

(declare-fun b!380807 () Bool)

(declare-fun res!216248 () Bool)

(assert (=> b!380807 (=> (not res!216248) (not e!231589))))

(declare-fun _keys!658 () array!22313)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22313 (_ BitVec 32)) Bool)

(assert (=> b!380807 (= res!216248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380808 () Bool)

(declare-fun res!216250 () Bool)

(assert (=> b!380808 (=> (not res!216250) (not e!231589))))

(assert (=> b!380808 (= res!216250 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6059))))

(declare-fun b!380809 () Bool)

(declare-fun tp_is_empty!9197 () Bool)

(assert (=> b!380809 (= e!231586 tp_is_empty!9197)))

(declare-fun b!380810 () Bool)

(declare-fun e!231585 () Bool)

(assert (=> b!380810 (= e!231585 tp_is_empty!9197)))

(declare-fun b!380811 () Bool)

(assert (=> b!380811 (= e!231589 e!231590)))

(declare-fun res!216249 () Bool)

(assert (=> b!380811 (=> (not res!216249) (not e!231590))))

(assert (=> b!380811 (= res!216249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178379 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380811 (= lt!178379 (array!22314 (store (arr!10625 _keys!658) i!548 k!778) (size!10977 _keys!658)))))

(declare-fun res!216245 () Bool)

(assert (=> start!37422 (=> (not res!216245) (not e!231589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37422 (= res!216245 (validMask!0 mask!970))))

(assert (=> start!37422 e!231589))

(declare-fun e!231587 () Bool)

(declare-fun array_inv!7822 (array!22315) Bool)

(assert (=> start!37422 (and (array_inv!7822 _values!506) e!231587)))

(assert (=> start!37422 tp!30363))

(assert (=> start!37422 true))

(assert (=> start!37422 tp_is_empty!9197))

(declare-fun array_inv!7823 (array!22313) Bool)

(assert (=> start!37422 (array_inv!7823 _keys!658)))

(declare-fun b!380812 () Bool)

(declare-fun e!231588 () Bool)

(declare-fun e!231583 () Bool)

(assert (=> b!380812 (= e!231588 e!231583)))

(declare-fun res!216243 () Bool)

(assert (=> b!380812 (=> res!216243 e!231583)))

(assert (=> b!380812 (= res!216243 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6228 0))(
  ( (tuple2!6229 (_1!3125 (_ BitVec 64)) (_2!3125 V!13367)) )
))
(declare-datatypes ((List!6063 0))(
  ( (Nil!6060) (Cons!6059 (h!6915 tuple2!6228) (t!11213 List!6063)) )
))
(declare-datatypes ((ListLongMap!5141 0))(
  ( (ListLongMap!5142 (toList!2586 List!6063)) )
))
(declare-fun lt!178372 () ListLongMap!5141)

(declare-fun lt!178378 () ListLongMap!5141)

(assert (=> b!380812 (= lt!178372 lt!178378)))

(declare-fun lt!178373 () ListLongMap!5141)

(declare-fun lt!178376 () tuple2!6228)

(declare-fun +!932 (ListLongMap!5141 tuple2!6228) ListLongMap!5141)

(assert (=> b!380812 (= lt!178378 (+!932 lt!178373 lt!178376))))

(declare-fun lt!178380 () ListLongMap!5141)

(declare-fun lt!178375 () ListLongMap!5141)

(assert (=> b!380812 (= lt!178380 lt!178375)))

(declare-fun lt!178371 () ListLongMap!5141)

(assert (=> b!380812 (= lt!178375 (+!932 lt!178371 lt!178376))))

(declare-fun lt!178374 () ListLongMap!5141)

(assert (=> b!380812 (= lt!178380 (+!932 lt!178374 lt!178376))))

(declare-fun minValue!472 () V!13367)

(assert (=> b!380812 (= lt!178376 (tuple2!6229 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380813 () Bool)

(assert (=> b!380813 (= e!231590 (not e!231588))))

(declare-fun res!216244 () Bool)

(assert (=> b!380813 (=> res!216244 e!231588)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380813 (= res!216244 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13367)

(declare-fun getCurrentListMap!2002 (array!22313 array!22315 (_ BitVec 32) (_ BitVec 32) V!13367 V!13367 (_ BitVec 32) Int) ListLongMap!5141)

(assert (=> b!380813 (= lt!178372 (getCurrentListMap!2002 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178377 () array!22315)

(assert (=> b!380813 (= lt!178380 (getCurrentListMap!2002 lt!178379 lt!178377 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380813 (and (= lt!178374 lt!178371) (= lt!178371 lt!178374))))

(declare-fun lt!178369 () tuple2!6228)

(assert (=> b!380813 (= lt!178371 (+!932 lt!178373 lt!178369))))

(declare-fun v!373 () V!13367)

(assert (=> b!380813 (= lt!178369 (tuple2!6229 k!778 v!373))))

(declare-datatypes ((Unit!11758 0))(
  ( (Unit!11759) )
))
(declare-fun lt!178368 () Unit!11758)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!160 (array!22313 array!22315 (_ BitVec 32) (_ BitVec 32) V!13367 V!13367 (_ BitVec 32) (_ BitVec 64) V!13367 (_ BitVec 32) Int) Unit!11758)

(assert (=> b!380813 (= lt!178368 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!160 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!836 (array!22313 array!22315 (_ BitVec 32) (_ BitVec 32) V!13367 V!13367 (_ BitVec 32) Int) ListLongMap!5141)

(assert (=> b!380813 (= lt!178374 (getCurrentListMapNoExtraKeys!836 lt!178379 lt!178377 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380813 (= lt!178377 (array!22316 (store (arr!10626 _values!506) i!548 (ValueCellFull!4255 v!373)) (size!10978 _values!506)))))

(assert (=> b!380813 (= lt!178373 (getCurrentListMapNoExtraKeys!836 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380814 () Bool)

(assert (=> b!380814 (= e!231583 (bvsle #b00000000000000000000000000000000 (size!10977 _keys!658)))))

(assert (=> b!380814 (= lt!178375 (+!932 lt!178378 lt!178369))))

(declare-fun lt!178370 () Unit!11758)

(declare-fun addCommutativeForDiffKeys!328 (ListLongMap!5141 (_ BitVec 64) V!13367 (_ BitVec 64) V!13367) Unit!11758)

(assert (=> b!380814 (= lt!178370 (addCommutativeForDiffKeys!328 lt!178373 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380815 () Bool)

(assert (=> b!380815 (= e!231587 (and e!231585 mapRes!15360))))

(declare-fun condMapEmpty!15360 () Bool)

(declare-fun mapDefault!15360 () ValueCell!4255)

