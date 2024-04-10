; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37314 () Bool)

(assert start!37314)

(declare-fun b_free!8441 () Bool)

(declare-fun b_next!8441 () Bool)

(assert (=> start!37314 (= b_free!8441 (not b_next!8441))))

(declare-fun tp!30038 () Bool)

(declare-fun b_and!15683 () Bool)

(assert (=> start!37314 (= tp!30038 b_and!15683)))

(declare-fun b!378374 () Bool)

(declare-fun res!214302 () Bool)

(declare-fun e!230287 () Bool)

(assert (=> b!378374 (=> (not res!214302) (not e!230287))))

(declare-datatypes ((array!22103 0))(
  ( (array!22104 (arr!10520 (Array (_ BitVec 32) (_ BitVec 64))) (size!10872 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22103)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378374 (= res!214302 (or (= (select (arr!10520 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10520 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378375 () Bool)

(declare-fun e!230294 () Bool)

(assert (=> b!378375 (= e!230287 e!230294)))

(declare-fun res!214298 () Bool)

(assert (=> b!378375 (=> (not res!214298) (not e!230294))))

(declare-fun lt!176269 () array!22103)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22103 (_ BitVec 32)) Bool)

(assert (=> b!378375 (= res!214298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176269 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!378375 (= lt!176269 (array!22104 (store (arr!10520 _keys!658) i!548 k!778) (size!10872 _keys!658)))))

(declare-fun b!378376 () Bool)

(declare-fun res!214297 () Bool)

(assert (=> b!378376 (=> (not res!214297) (not e!230294))))

(declare-datatypes ((List!5966 0))(
  ( (Nil!5963) (Cons!5962 (h!6818 (_ BitVec 64)) (t!11116 List!5966)) )
))
(declare-fun arrayNoDuplicates!0 (array!22103 (_ BitVec 32) List!5966) Bool)

(assert (=> b!378376 (= res!214297 (arrayNoDuplicates!0 lt!176269 #b00000000000000000000000000000000 Nil!5963))))

(declare-fun b!378377 () Bool)

(declare-fun res!214305 () Bool)

(assert (=> b!378377 (=> (not res!214305) (not e!230287))))

(assert (=> b!378377 (= res!214305 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5963))))

(declare-fun b!378378 () Bool)

(declare-fun res!214299 () Bool)

(assert (=> b!378378 (=> (not res!214299) (not e!230287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378378 (= res!214299 (validKeyInArray!0 k!778))))

(declare-fun b!378379 () Bool)

(declare-fun e!230293 () Bool)

(assert (=> b!378379 (= e!230294 (not e!230293))))

(declare-fun res!214295 () Bool)

(assert (=> b!378379 (=> res!214295 e!230293)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378379 (= res!214295 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13223 0))(
  ( (V!13224 (val!4589 Int)) )
))
(declare-datatypes ((ValueCell!4201 0))(
  ( (ValueCellFull!4201 (v!6786 V!13223)) (EmptyCell!4201) )
))
(declare-datatypes ((array!22105 0))(
  ( (array!22106 (arr!10521 (Array (_ BitVec 32) ValueCell!4201)) (size!10873 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22105)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13223)

(declare-datatypes ((tuple2!6128 0))(
  ( (tuple2!6129 (_1!3075 (_ BitVec 64)) (_2!3075 V!13223)) )
))
(declare-datatypes ((List!5967 0))(
  ( (Nil!5964) (Cons!5963 (h!6819 tuple2!6128) (t!11117 List!5967)) )
))
(declare-datatypes ((ListLongMap!5041 0))(
  ( (ListLongMap!5042 (toList!2536 List!5967)) )
))
(declare-fun lt!176271 () ListLongMap!5041)

(declare-fun minValue!472 () V!13223)

(declare-fun getCurrentListMap!1962 (array!22103 array!22105 (_ BitVec 32) (_ BitVec 32) V!13223 V!13223 (_ BitVec 32) Int) ListLongMap!5041)

(assert (=> b!378379 (= lt!176271 (getCurrentListMap!1962 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176272 () ListLongMap!5041)

(declare-fun lt!176266 () array!22105)

(assert (=> b!378379 (= lt!176272 (getCurrentListMap!1962 lt!176269 lt!176266 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176267 () ListLongMap!5041)

(declare-fun lt!176268 () ListLongMap!5041)

(assert (=> b!378379 (and (= lt!176267 lt!176268) (= lt!176268 lt!176267))))

(declare-fun v!373 () V!13223)

(declare-fun lt!176273 () ListLongMap!5041)

(declare-fun +!882 (ListLongMap!5041 tuple2!6128) ListLongMap!5041)

(assert (=> b!378379 (= lt!176268 (+!882 lt!176273 (tuple2!6129 k!778 v!373)))))

(declare-datatypes ((Unit!11664 0))(
  ( (Unit!11665) )
))
(declare-fun lt!176274 () Unit!11664)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!120 (array!22103 array!22105 (_ BitVec 32) (_ BitVec 32) V!13223 V!13223 (_ BitVec 32) (_ BitVec 64) V!13223 (_ BitVec 32) Int) Unit!11664)

(assert (=> b!378379 (= lt!176274 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!120 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!796 (array!22103 array!22105 (_ BitVec 32) (_ BitVec 32) V!13223 V!13223 (_ BitVec 32) Int) ListLongMap!5041)

(assert (=> b!378379 (= lt!176267 (getCurrentListMapNoExtraKeys!796 lt!176269 lt!176266 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378379 (= lt!176266 (array!22106 (store (arr!10521 _values!506) i!548 (ValueCellFull!4201 v!373)) (size!10873 _values!506)))))

(assert (=> b!378379 (= lt!176273 (getCurrentListMapNoExtraKeys!796 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378380 () Bool)

(declare-fun res!214307 () Bool)

(assert (=> b!378380 (=> (not res!214307) (not e!230287))))

(assert (=> b!378380 (= res!214307 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10872 _keys!658))))))

(declare-fun res!214303 () Bool)

(assert (=> start!37314 (=> (not res!214303) (not e!230287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37314 (= res!214303 (validMask!0 mask!970))))

(assert (=> start!37314 e!230287))

(declare-fun e!230290 () Bool)

(declare-fun array_inv!7748 (array!22105) Bool)

(assert (=> start!37314 (and (array_inv!7748 _values!506) e!230290)))

(assert (=> start!37314 tp!30038))

(assert (=> start!37314 true))

(declare-fun tp_is_empty!9089 () Bool)

(assert (=> start!37314 tp_is_empty!9089))

(declare-fun array_inv!7749 (array!22103) Bool)

(assert (=> start!37314 (array_inv!7749 _keys!658)))

(declare-fun lt!176270 () tuple2!6128)

(declare-fun b!378381 () Bool)

(declare-fun e!230291 () Bool)

(assert (=> b!378381 (= e!230291 (= lt!176271 (+!882 lt!176273 lt!176270)))))

(declare-fun b!378382 () Bool)

(declare-fun res!214304 () Bool)

(assert (=> b!378382 (=> (not res!214304) (not e!230287))))

(assert (=> b!378382 (= res!214304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378383 () Bool)

(declare-fun res!214306 () Bool)

(assert (=> b!378383 (=> (not res!214306) (not e!230291))))

(assert (=> b!378383 (= res!214306 (= lt!176272 (+!882 lt!176268 lt!176270)))))

(declare-fun b!378384 () Bool)

(assert (=> b!378384 (= e!230293 true)))

(assert (=> b!378384 e!230291))

(declare-fun res!214300 () Bool)

(assert (=> b!378384 (=> (not res!214300) (not e!230291))))

(assert (=> b!378384 (= res!214300 (= lt!176272 (+!882 lt!176267 lt!176270)))))

(assert (=> b!378384 (= lt!176270 (tuple2!6129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378385 () Bool)

(declare-fun res!214296 () Bool)

(assert (=> b!378385 (=> (not res!214296) (not e!230287))))

(assert (=> b!378385 (= res!214296 (and (= (size!10873 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10872 _keys!658) (size!10873 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378386 () Bool)

(declare-fun res!214301 () Bool)

(assert (=> b!378386 (=> (not res!214301) (not e!230287))))

(declare-fun arrayContainsKey!0 (array!22103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378386 (= res!214301 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!378387 () Bool)

(declare-fun e!230292 () Bool)

(assert (=> b!378387 (= e!230292 tp_is_empty!9089)))

(declare-fun mapIsEmpty!15198 () Bool)

(declare-fun mapRes!15198 () Bool)

(assert (=> mapIsEmpty!15198 mapRes!15198))

(declare-fun b!378388 () Bool)

(declare-fun e!230289 () Bool)

(assert (=> b!378388 (= e!230289 tp_is_empty!9089)))

(declare-fun mapNonEmpty!15198 () Bool)

(declare-fun tp!30039 () Bool)

(assert (=> mapNonEmpty!15198 (= mapRes!15198 (and tp!30039 e!230289))))

(declare-fun mapRest!15198 () (Array (_ BitVec 32) ValueCell!4201))

(declare-fun mapKey!15198 () (_ BitVec 32))

(declare-fun mapValue!15198 () ValueCell!4201)

(assert (=> mapNonEmpty!15198 (= (arr!10521 _values!506) (store mapRest!15198 mapKey!15198 mapValue!15198))))

(declare-fun b!378389 () Bool)

(assert (=> b!378389 (= e!230290 (and e!230292 mapRes!15198))))

(declare-fun condMapEmpty!15198 () Bool)

(declare-fun mapDefault!15198 () ValueCell!4201)

