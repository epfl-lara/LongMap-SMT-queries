; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37410 () Bool)

(assert start!37410)

(declare-fun b_free!8551 () Bool)

(declare-fun b_next!8551 () Bool)

(assert (=> start!37410 (= b_free!8551 (not b_next!8551))))

(declare-fun tp!30369 () Bool)

(declare-fun b_and!15767 () Bool)

(assert (=> start!37410 (= tp!30369 b_and!15767)))

(declare-fun b!380577 () Bool)

(declare-fun res!216147 () Bool)

(declare-fun e!231431 () Bool)

(assert (=> b!380577 (=> (not res!216147) (not e!231431))))

(declare-datatypes ((array!22295 0))(
  ( (array!22296 (arr!10616 (Array (_ BitVec 32) (_ BitVec 64))) (size!10969 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22295)

(declare-datatypes ((List!6029 0))(
  ( (Nil!6026) (Cons!6025 (h!6881 (_ BitVec 64)) (t!11170 List!6029)) )
))
(declare-fun arrayNoDuplicates!0 (array!22295 (_ BitVec 32) List!6029) Bool)

(assert (=> b!380577 (= res!216147 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6026))))

(declare-fun b!380578 () Bool)

(declare-fun res!216154 () Bool)

(assert (=> b!380578 (=> (not res!216154) (not e!231431))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380578 (= res!216154 (or (= (select (arr!10616 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10616 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380579 () Bool)

(declare-fun res!216150 () Bool)

(assert (=> b!380579 (=> (not res!216150) (not e!231431))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22295 (_ BitVec 32)) Bool)

(assert (=> b!380579 (= res!216150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380580 () Bool)

(declare-fun res!216149 () Bool)

(declare-fun e!231433 () Bool)

(assert (=> b!380580 (=> (not res!216149) (not e!231433))))

(declare-fun lt!178165 () array!22295)

(assert (=> b!380580 (= res!216149 (arrayNoDuplicates!0 lt!178165 #b00000000000000000000000000000000 Nil!6026))))

(declare-fun b!380581 () Bool)

(declare-fun e!231432 () Bool)

(declare-fun tp_is_empty!9199 () Bool)

(assert (=> b!380581 (= e!231432 tp_is_empty!9199)))

(declare-fun b!380582 () Bool)

(declare-fun e!231434 () Bool)

(declare-fun e!231436 () Bool)

(declare-fun mapRes!15363 () Bool)

(assert (=> b!380582 (= e!231434 (and e!231436 mapRes!15363))))

(declare-fun condMapEmpty!15363 () Bool)

(declare-datatypes ((V!13371 0))(
  ( (V!13372 (val!4644 Int)) )
))
(declare-datatypes ((ValueCell!4256 0))(
  ( (ValueCellFull!4256 (v!6835 V!13371)) (EmptyCell!4256) )
))
(declare-datatypes ((array!22297 0))(
  ( (array!22298 (arr!10617 (Array (_ BitVec 32) ValueCell!4256)) (size!10970 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22297)

(declare-fun mapDefault!15363 () ValueCell!4256)

(assert (=> b!380582 (= condMapEmpty!15363 (= (arr!10617 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4256)) mapDefault!15363)))))

(declare-fun b!380583 () Bool)

(assert (=> b!380583 (= e!231436 tp_is_empty!9199)))

(declare-fun b!380584 () Bool)

(declare-fun res!216152 () Bool)

(assert (=> b!380584 (=> (not res!216152) (not e!231431))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380584 (= res!216152 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380585 () Bool)

(declare-fun res!216153 () Bool)

(assert (=> b!380585 (=> (not res!216153) (not e!231431))))

(assert (=> b!380585 (= res!216153 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10969 _keys!658))))))

(declare-fun mapIsEmpty!15363 () Bool)

(assert (=> mapIsEmpty!15363 mapRes!15363))

(declare-fun res!216151 () Bool)

(assert (=> start!37410 (=> (not res!216151) (not e!231431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37410 (= res!216151 (validMask!0 mask!970))))

(assert (=> start!37410 e!231431))

(declare-fun array_inv!7818 (array!22297) Bool)

(assert (=> start!37410 (and (array_inv!7818 _values!506) e!231434)))

(assert (=> start!37410 tp!30369))

(assert (=> start!37410 true))

(assert (=> start!37410 tp_is_empty!9199))

(declare-fun array_inv!7819 (array!22295) Bool)

(assert (=> start!37410 (array_inv!7819 _keys!658)))

(declare-fun b!380586 () Bool)

(declare-fun res!216155 () Bool)

(assert (=> b!380586 (=> (not res!216155) (not e!231431))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380586 (= res!216155 (and (= (size!10970 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10969 _keys!658) (size!10970 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380587 () Bool)

(declare-fun e!231437 () Bool)

(assert (=> b!380587 (= e!231433 (not e!231437))))

(declare-fun res!216145 () Bool)

(assert (=> b!380587 (=> res!216145 e!231437)))

(declare-fun lt!178171 () Bool)

(assert (=> b!380587 (= res!216145 (or (and (not lt!178171) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178171) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178171)))))

(assert (=> b!380587 (= lt!178171 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6200 0))(
  ( (tuple2!6201 (_1!3111 (_ BitVec 64)) (_2!3111 V!13371)) )
))
(declare-datatypes ((List!6030 0))(
  ( (Nil!6027) (Cons!6026 (h!6882 tuple2!6200) (t!11171 List!6030)) )
))
(declare-datatypes ((ListLongMap!5103 0))(
  ( (ListLongMap!5104 (toList!2567 List!6030)) )
))
(declare-fun lt!178168 () ListLongMap!5103)

(declare-fun zeroValue!472 () V!13371)

(declare-fun minValue!472 () V!13371)

(declare-fun getCurrentListMap!1961 (array!22295 array!22297 (_ BitVec 32) (_ BitVec 32) V!13371 V!13371 (_ BitVec 32) Int) ListLongMap!5103)

(assert (=> b!380587 (= lt!178168 (getCurrentListMap!1961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178172 () ListLongMap!5103)

(declare-fun lt!178173 () array!22297)

(assert (=> b!380587 (= lt!178172 (getCurrentListMap!1961 lt!178165 lt!178173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178170 () ListLongMap!5103)

(declare-fun lt!178166 () ListLongMap!5103)

(assert (=> b!380587 (and (= lt!178170 lt!178166) (= lt!178166 lt!178170))))

(declare-fun v!373 () V!13371)

(declare-fun lt!178169 () ListLongMap!5103)

(declare-fun +!935 (ListLongMap!5103 tuple2!6200) ListLongMap!5103)

(assert (=> b!380587 (= lt!178166 (+!935 lt!178169 (tuple2!6201 k0!778 v!373)))))

(declare-datatypes ((Unit!11728 0))(
  ( (Unit!11729) )
))
(declare-fun lt!178167 () Unit!11728)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!154 (array!22295 array!22297 (_ BitVec 32) (_ BitVec 32) V!13371 V!13371 (_ BitVec 32) (_ BitVec 64) V!13371 (_ BitVec 32) Int) Unit!11728)

(assert (=> b!380587 (= lt!178167 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!154 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!826 (array!22295 array!22297 (_ BitVec 32) (_ BitVec 32) V!13371 V!13371 (_ BitVec 32) Int) ListLongMap!5103)

(assert (=> b!380587 (= lt!178170 (getCurrentListMapNoExtraKeys!826 lt!178165 lt!178173 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380587 (= lt!178173 (array!22298 (store (arr!10617 _values!506) i!548 (ValueCellFull!4256 v!373)) (size!10970 _values!506)))))

(assert (=> b!380587 (= lt!178169 (getCurrentListMapNoExtraKeys!826 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15363 () Bool)

(declare-fun tp!30368 () Bool)

(assert (=> mapNonEmpty!15363 (= mapRes!15363 (and tp!30368 e!231432))))

(declare-fun mapRest!15363 () (Array (_ BitVec 32) ValueCell!4256))

(declare-fun mapKey!15363 () (_ BitVec 32))

(declare-fun mapValue!15363 () ValueCell!4256)

(assert (=> mapNonEmpty!15363 (= (arr!10617 _values!506) (store mapRest!15363 mapKey!15363 mapValue!15363))))

(declare-fun b!380588 () Bool)

(declare-fun res!216148 () Bool)

(assert (=> b!380588 (=> (not res!216148) (not e!231431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380588 (= res!216148 (validKeyInArray!0 k0!778))))

(declare-fun b!380589 () Bool)

(assert (=> b!380589 (= e!231437 true)))

(assert (=> b!380589 (= lt!178172 lt!178170)))

(declare-fun b!380590 () Bool)

(assert (=> b!380590 (= e!231431 e!231433)))

(declare-fun res!216146 () Bool)

(assert (=> b!380590 (=> (not res!216146) (not e!231433))))

(assert (=> b!380590 (= res!216146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178165 mask!970))))

(assert (=> b!380590 (= lt!178165 (array!22296 (store (arr!10616 _keys!658) i!548 k0!778) (size!10969 _keys!658)))))

(assert (= (and start!37410 res!216151) b!380586))

(assert (= (and b!380586 res!216155) b!380579))

(assert (= (and b!380579 res!216150) b!380577))

(assert (= (and b!380577 res!216147) b!380585))

(assert (= (and b!380585 res!216153) b!380588))

(assert (= (and b!380588 res!216148) b!380578))

(assert (= (and b!380578 res!216154) b!380584))

(assert (= (and b!380584 res!216152) b!380590))

(assert (= (and b!380590 res!216146) b!380580))

(assert (= (and b!380580 res!216149) b!380587))

(assert (= (and b!380587 (not res!216145)) b!380589))

(assert (= (and b!380582 condMapEmpty!15363) mapIsEmpty!15363))

(assert (= (and b!380582 (not condMapEmpty!15363)) mapNonEmpty!15363))

(get-info :version)

(assert (= (and mapNonEmpty!15363 ((_ is ValueCellFull!4256) mapValue!15363)) b!380581))

(assert (= (and b!380582 ((_ is ValueCellFull!4256) mapDefault!15363)) b!380583))

(assert (= start!37410 b!380582))

(declare-fun m!377099 () Bool)

(assert (=> b!380588 m!377099))

(declare-fun m!377101 () Bool)

(assert (=> b!380584 m!377101))

(declare-fun m!377103 () Bool)

(assert (=> b!380579 m!377103))

(declare-fun m!377105 () Bool)

(assert (=> b!380580 m!377105))

(declare-fun m!377107 () Bool)

(assert (=> mapNonEmpty!15363 m!377107))

(declare-fun m!377109 () Bool)

(assert (=> b!380590 m!377109))

(declare-fun m!377111 () Bool)

(assert (=> b!380590 m!377111))

(declare-fun m!377113 () Bool)

(assert (=> b!380577 m!377113))

(declare-fun m!377115 () Bool)

(assert (=> b!380587 m!377115))

(declare-fun m!377117 () Bool)

(assert (=> b!380587 m!377117))

(declare-fun m!377119 () Bool)

(assert (=> b!380587 m!377119))

(declare-fun m!377121 () Bool)

(assert (=> b!380587 m!377121))

(declare-fun m!377123 () Bool)

(assert (=> b!380587 m!377123))

(declare-fun m!377125 () Bool)

(assert (=> b!380587 m!377125))

(declare-fun m!377127 () Bool)

(assert (=> b!380587 m!377127))

(declare-fun m!377129 () Bool)

(assert (=> start!37410 m!377129))

(declare-fun m!377131 () Bool)

(assert (=> start!37410 m!377131))

(declare-fun m!377133 () Bool)

(assert (=> start!37410 m!377133))

(declare-fun m!377135 () Bool)

(assert (=> b!380578 m!377135))

(check-sat (not b!380579) (not b!380580) (not start!37410) (not b!380590) (not b!380577) (not b!380588) (not b_next!8551) (not mapNonEmpty!15363) (not b!380584) b_and!15767 (not b!380587) tp_is_empty!9199)
(check-sat b_and!15767 (not b_next!8551))
