; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37424 () Bool)

(assert start!37424)

(declare-fun b_free!8551 () Bool)

(declare-fun b_next!8551 () Bool)

(assert (=> start!37424 (= b_free!8551 (not b_next!8551))))

(declare-fun tp!30368 () Bool)

(declare-fun b_and!15793 () Bool)

(assert (=> start!37424 (= tp!30368 b_and!15793)))

(declare-fun b!380848 () Bool)

(declare-fun e!231607 () Bool)

(declare-fun e!231609 () Bool)

(assert (=> b!380848 (= e!231607 (not e!231609))))

(declare-fun res!216282 () Bool)

(assert (=> b!380848 (=> res!216282 e!231609)))

(declare-fun lt!178407 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380848 (= res!216282 (or (and (not lt!178407) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178407) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178407)))))

(assert (=> b!380848 (= lt!178407 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13371 0))(
  ( (V!13372 (val!4644 Int)) )
))
(declare-datatypes ((ValueCell!4256 0))(
  ( (ValueCellFull!4256 (v!6841 V!13371)) (EmptyCell!4256) )
))
(declare-datatypes ((array!22317 0))(
  ( (array!22318 (arr!10627 (Array (_ BitVec 32) ValueCell!4256)) (size!10979 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22317)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6230 0))(
  ( (tuple2!6231 (_1!3126 (_ BitVec 64)) (_2!3126 V!13371)) )
))
(declare-datatypes ((List!6064 0))(
  ( (Nil!6061) (Cons!6060 (h!6916 tuple2!6230) (t!11214 List!6064)) )
))
(declare-datatypes ((ListLongMap!5143 0))(
  ( (ListLongMap!5144 (toList!2587 List!6064)) )
))
(declare-fun lt!178403 () ListLongMap!5143)

(declare-fun zeroValue!472 () V!13371)

(declare-datatypes ((array!22319 0))(
  ( (array!22320 (arr!10628 (Array (_ BitVec 32) (_ BitVec 64))) (size!10980 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22319)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13371)

(declare-fun getCurrentListMap!2003 (array!22319 array!22317 (_ BitVec 32) (_ BitVec 32) V!13371 V!13371 (_ BitVec 32) Int) ListLongMap!5143)

(assert (=> b!380848 (= lt!178403 (getCurrentListMap!2003 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178399 () array!22317)

(declare-fun lt!178402 () ListLongMap!5143)

(declare-fun lt!178400 () array!22319)

(assert (=> b!380848 (= lt!178402 (getCurrentListMap!2003 lt!178400 lt!178399 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178401 () ListLongMap!5143)

(declare-fun lt!178406 () ListLongMap!5143)

(assert (=> b!380848 (and (= lt!178401 lt!178406) (= lt!178406 lt!178401))))

(declare-fun lt!178404 () ListLongMap!5143)

(declare-fun v!373 () V!13371)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!933 (ListLongMap!5143 tuple2!6230) ListLongMap!5143)

(assert (=> b!380848 (= lt!178406 (+!933 lt!178404 (tuple2!6231 k!778 v!373)))))

(declare-datatypes ((Unit!11760 0))(
  ( (Unit!11761) )
))
(declare-fun lt!178405 () Unit!11760)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!161 (array!22319 array!22317 (_ BitVec 32) (_ BitVec 32) V!13371 V!13371 (_ BitVec 32) (_ BitVec 64) V!13371 (_ BitVec 32) Int) Unit!11760)

(assert (=> b!380848 (= lt!178405 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!161 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!837 (array!22319 array!22317 (_ BitVec 32) (_ BitVec 32) V!13371 V!13371 (_ BitVec 32) Int) ListLongMap!5143)

(assert (=> b!380848 (= lt!178401 (getCurrentListMapNoExtraKeys!837 lt!178400 lt!178399 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380848 (= lt!178399 (array!22318 (store (arr!10627 _values!506) i!548 (ValueCellFull!4256 v!373)) (size!10979 _values!506)))))

(assert (=> b!380848 (= lt!178404 (getCurrentListMapNoExtraKeys!837 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15363 () Bool)

(declare-fun mapRes!15363 () Bool)

(assert (=> mapIsEmpty!15363 mapRes!15363))

(declare-fun b!380850 () Bool)

(declare-fun res!216278 () Bool)

(assert (=> b!380850 (=> (not res!216278) (not e!231607))))

(declare-datatypes ((List!6065 0))(
  ( (Nil!6062) (Cons!6061 (h!6917 (_ BitVec 64)) (t!11215 List!6065)) )
))
(declare-fun arrayNoDuplicates!0 (array!22319 (_ BitVec 32) List!6065) Bool)

(assert (=> b!380850 (= res!216278 (arrayNoDuplicates!0 lt!178400 #b00000000000000000000000000000000 Nil!6062))))

(declare-fun mapNonEmpty!15363 () Bool)

(declare-fun tp!30369 () Bool)

(declare-fun e!231611 () Bool)

(assert (=> mapNonEmpty!15363 (= mapRes!15363 (and tp!30369 e!231611))))

(declare-fun mapValue!15363 () ValueCell!4256)

(declare-fun mapKey!15363 () (_ BitVec 32))

(declare-fun mapRest!15363 () (Array (_ BitVec 32) ValueCell!4256))

(assert (=> mapNonEmpty!15363 (= (arr!10627 _values!506) (store mapRest!15363 mapKey!15363 mapValue!15363))))

(declare-fun b!380851 () Bool)

(declare-fun tp_is_empty!9199 () Bool)

(assert (=> b!380851 (= e!231611 tp_is_empty!9199)))

(declare-fun b!380852 () Bool)

(assert (=> b!380852 (= e!231609 true)))

(assert (=> b!380852 (= lt!178402 lt!178401)))

(declare-fun b!380853 () Bool)

(declare-fun res!216274 () Bool)

(declare-fun e!231610 () Bool)

(assert (=> b!380853 (=> (not res!216274) (not e!231610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380853 (= res!216274 (validKeyInArray!0 k!778))))

(declare-fun b!380854 () Bool)

(assert (=> b!380854 (= e!231610 e!231607)))

(declare-fun res!216281 () Bool)

(assert (=> b!380854 (=> (not res!216281) (not e!231607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22319 (_ BitVec 32)) Bool)

(assert (=> b!380854 (= res!216281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178400 mask!970))))

(assert (=> b!380854 (= lt!178400 (array!22320 (store (arr!10628 _keys!658) i!548 k!778) (size!10980 _keys!658)))))

(declare-fun b!380855 () Bool)

(declare-fun e!231606 () Bool)

(assert (=> b!380855 (= e!231606 tp_is_empty!9199)))

(declare-fun b!380849 () Bool)

(declare-fun res!216280 () Bool)

(assert (=> b!380849 (=> (not res!216280) (not e!231610))))

(assert (=> b!380849 (= res!216280 (and (= (size!10979 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10980 _keys!658) (size!10979 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!216283 () Bool)

(assert (=> start!37424 (=> (not res!216283) (not e!231610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37424 (= res!216283 (validMask!0 mask!970))))

(assert (=> start!37424 e!231610))

(declare-fun e!231605 () Bool)

(declare-fun array_inv!7824 (array!22317) Bool)

(assert (=> start!37424 (and (array_inv!7824 _values!506) e!231605)))

(assert (=> start!37424 tp!30368))

(assert (=> start!37424 true))

(assert (=> start!37424 tp_is_empty!9199))

(declare-fun array_inv!7825 (array!22319) Bool)

(assert (=> start!37424 (array_inv!7825 _keys!658)))

(declare-fun b!380856 () Bool)

(declare-fun res!216276 () Bool)

(assert (=> b!380856 (=> (not res!216276) (not e!231610))))

(assert (=> b!380856 (= res!216276 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10980 _keys!658))))))

(declare-fun b!380857 () Bool)

(assert (=> b!380857 (= e!231605 (and e!231606 mapRes!15363))))

(declare-fun condMapEmpty!15363 () Bool)

(declare-fun mapDefault!15363 () ValueCell!4256)

