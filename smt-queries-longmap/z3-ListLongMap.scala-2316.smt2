; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37344 () Bool)

(assert start!37344)

(declare-fun b_free!8485 () Bool)

(declare-fun b_next!8485 () Bool)

(assert (=> start!37344 (= b_free!8485 (not b_next!8485))))

(declare-fun tp!30171 () Bool)

(declare-fun b_and!15741 () Bool)

(assert (=> start!37344 (= tp!30171 b_and!15741)))

(declare-fun b!379316 () Bool)

(declare-fun e!230790 () Bool)

(declare-fun tp_is_empty!9133 () Bool)

(assert (=> b!379316 (= e!230790 tp_is_empty!9133)))

(declare-fun b!379317 () Bool)

(declare-fun res!215092 () Bool)

(declare-fun e!230783 () Bool)

(assert (=> b!379317 (=> (not res!215092) (not e!230783))))

(declare-datatypes ((array!22174 0))(
  ( (array!22175 (arr!10555 (Array (_ BitVec 32) (_ BitVec 64))) (size!10907 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22174)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22174 (_ BitVec 32)) Bool)

(assert (=> b!379317 (= res!215092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379318 () Bool)

(declare-fun e!230787 () Bool)

(assert (=> b!379318 (= e!230783 e!230787)))

(declare-fun res!215088 () Bool)

(assert (=> b!379318 (=> (not res!215088) (not e!230787))))

(declare-fun lt!177144 () array!22174)

(assert (=> b!379318 (= res!215088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177144 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379318 (= lt!177144 (array!22175 (store (arr!10555 _keys!658) i!548 k0!778) (size!10907 _keys!658)))))

(declare-fun mapNonEmpty!15264 () Bool)

(declare-fun mapRes!15264 () Bool)

(declare-fun tp!30170 () Bool)

(assert (=> mapNonEmpty!15264 (= mapRes!15264 (and tp!30170 e!230790))))

(declare-fun mapKey!15264 () (_ BitVec 32))

(declare-datatypes ((V!13283 0))(
  ( (V!13284 (val!4611 Int)) )
))
(declare-datatypes ((ValueCell!4223 0))(
  ( (ValueCellFull!4223 (v!6809 V!13283)) (EmptyCell!4223) )
))
(declare-fun mapRest!15264 () (Array (_ BitVec 32) ValueCell!4223))

(declare-fun mapValue!15264 () ValueCell!4223)

(declare-datatypes ((array!22176 0))(
  ( (array!22177 (arr!10556 (Array (_ BitVec 32) ValueCell!4223)) (size!10908 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22176)

(assert (=> mapNonEmpty!15264 (= (arr!10556 _values!506) (store mapRest!15264 mapKey!15264 mapValue!15264))))

(declare-fun b!379319 () Bool)

(declare-fun res!215085 () Bool)

(assert (=> b!379319 (=> (not res!215085) (not e!230783))))

(declare-datatypes ((List!5899 0))(
  ( (Nil!5896) (Cons!5895 (h!6751 (_ BitVec 64)) (t!11041 List!5899)) )
))
(declare-fun arrayNoDuplicates!0 (array!22174 (_ BitVec 32) List!5899) Bool)

(assert (=> b!379319 (= res!215085 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5896))))

(declare-fun b!379320 () Bool)

(declare-fun res!215087 () Bool)

(assert (=> b!379320 (=> (not res!215087) (not e!230787))))

(assert (=> b!379320 (= res!215087 (arrayNoDuplicates!0 lt!177144 #b00000000000000000000000000000000 Nil!5896))))

(declare-fun res!215095 () Bool)

(assert (=> start!37344 (=> (not res!215095) (not e!230783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37344 (= res!215095 (validMask!0 mask!970))))

(assert (=> start!37344 e!230783))

(declare-fun e!230785 () Bool)

(declare-fun array_inv!7822 (array!22176) Bool)

(assert (=> start!37344 (and (array_inv!7822 _values!506) e!230785)))

(assert (=> start!37344 tp!30171))

(assert (=> start!37344 true))

(assert (=> start!37344 tp_is_empty!9133))

(declare-fun array_inv!7823 (array!22174) Bool)

(assert (=> start!37344 (array_inv!7823 _keys!658)))

(declare-fun b!379321 () Bool)

(declare-fun e!230786 () Bool)

(assert (=> b!379321 (= e!230787 (not e!230786))))

(declare-fun res!215089 () Bool)

(assert (=> b!379321 (=> res!215089 e!230786)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379321 (= res!215089 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6062 0))(
  ( (tuple2!6063 (_1!3042 (_ BitVec 64)) (_2!3042 V!13283)) )
))
(declare-datatypes ((List!5900 0))(
  ( (Nil!5897) (Cons!5896 (h!6752 tuple2!6062) (t!11042 List!5900)) )
))
(declare-datatypes ((ListLongMap!4977 0))(
  ( (ListLongMap!4978 (toList!2504 List!5900)) )
))
(declare-fun lt!177149 () ListLongMap!4977)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13283)

(declare-fun minValue!472 () V!13283)

(declare-fun getCurrentListMap!1944 (array!22174 array!22176 (_ BitVec 32) (_ BitVec 32) V!13283 V!13283 (_ BitVec 32) Int) ListLongMap!4977)

(assert (=> b!379321 (= lt!177149 (getCurrentListMap!1944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177151 () ListLongMap!4977)

(declare-fun lt!177143 () array!22176)

(assert (=> b!379321 (= lt!177151 (getCurrentListMap!1944 lt!177144 lt!177143 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177150 () ListLongMap!4977)

(declare-fun lt!177146 () ListLongMap!4977)

(assert (=> b!379321 (and (= lt!177150 lt!177146) (= lt!177146 lt!177150))))

(declare-fun lt!177142 () ListLongMap!4977)

(declare-fun lt!177141 () tuple2!6062)

(declare-fun +!900 (ListLongMap!4977 tuple2!6062) ListLongMap!4977)

(assert (=> b!379321 (= lt!177146 (+!900 lt!177142 lt!177141))))

(declare-fun v!373 () V!13283)

(assert (=> b!379321 (= lt!177141 (tuple2!6063 k0!778 v!373))))

(declare-datatypes ((Unit!11681 0))(
  ( (Unit!11682) )
))
(declare-fun lt!177148 () Unit!11681)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!131 (array!22174 array!22176 (_ BitVec 32) (_ BitVec 32) V!13283 V!13283 (_ BitVec 32) (_ BitVec 64) V!13283 (_ BitVec 32) Int) Unit!11681)

(assert (=> b!379321 (= lt!177148 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!131 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!791 (array!22174 array!22176 (_ BitVec 32) (_ BitVec 32) V!13283 V!13283 (_ BitVec 32) Int) ListLongMap!4977)

(assert (=> b!379321 (= lt!177150 (getCurrentListMapNoExtraKeys!791 lt!177144 lt!177143 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379321 (= lt!177143 (array!22177 (store (arr!10556 _values!506) i!548 (ValueCellFull!4223 v!373)) (size!10908 _values!506)))))

(assert (=> b!379321 (= lt!177142 (getCurrentListMapNoExtraKeys!791 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379322 () Bool)

(declare-fun res!215094 () Bool)

(assert (=> b!379322 (=> (not res!215094) (not e!230783))))

(declare-fun arrayContainsKey!0 (array!22174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379322 (= res!215094 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379323 () Bool)

(declare-fun e!230784 () Bool)

(assert (=> b!379323 (= e!230785 (and e!230784 mapRes!15264))))

(declare-fun condMapEmpty!15264 () Bool)

(declare-fun mapDefault!15264 () ValueCell!4223)

(assert (=> b!379323 (= condMapEmpty!15264 (= (arr!10556 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4223)) mapDefault!15264)))))

(declare-fun mapIsEmpty!15264 () Bool)

(assert (=> mapIsEmpty!15264 mapRes!15264))

(declare-fun b!379324 () Bool)

(declare-fun res!215096 () Bool)

(assert (=> b!379324 (=> (not res!215096) (not e!230783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379324 (= res!215096 (validKeyInArray!0 k0!778))))

(declare-fun b!379325 () Bool)

(declare-fun res!215091 () Bool)

(assert (=> b!379325 (=> (not res!215091) (not e!230783))))

(assert (=> b!379325 (= res!215091 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10907 _keys!658))))))

(declare-fun b!379326 () Bool)

(assert (=> b!379326 (= e!230784 tp_is_empty!9133)))

(declare-fun b!379327 () Bool)

(declare-fun e!230789 () Bool)

(assert (=> b!379327 (= e!230789 true)))

(declare-fun lt!177139 () ListLongMap!4977)

(declare-fun lt!177145 () ListLongMap!4977)

(assert (=> b!379327 (= lt!177139 (+!900 lt!177145 lt!177141))))

(declare-fun lt!177140 () Unit!11681)

(declare-fun addCommutativeForDiffKeys!312 (ListLongMap!4977 (_ BitVec 64) V!13283 (_ BitVec 64) V!13283) Unit!11681)

(assert (=> b!379327 (= lt!177140 (addCommutativeForDiffKeys!312 lt!177142 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379328 () Bool)

(declare-fun res!215086 () Bool)

(assert (=> b!379328 (=> (not res!215086) (not e!230783))))

(assert (=> b!379328 (= res!215086 (and (= (size!10908 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10907 _keys!658) (size!10908 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379329 () Bool)

(assert (=> b!379329 (= e!230786 e!230789)))

(declare-fun res!215090 () Bool)

(assert (=> b!379329 (=> res!215090 e!230789)))

(assert (=> b!379329 (= res!215090 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379329 (= lt!177149 lt!177145)))

(declare-fun lt!177147 () tuple2!6062)

(assert (=> b!379329 (= lt!177145 (+!900 lt!177142 lt!177147))))

(assert (=> b!379329 (= lt!177151 lt!177139)))

(assert (=> b!379329 (= lt!177139 (+!900 lt!177146 lt!177147))))

(assert (=> b!379329 (= lt!177151 (+!900 lt!177150 lt!177147))))

(assert (=> b!379329 (= lt!177147 (tuple2!6063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379330 () Bool)

(declare-fun res!215093 () Bool)

(assert (=> b!379330 (=> (not res!215093) (not e!230783))))

(assert (=> b!379330 (= res!215093 (or (= (select (arr!10555 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10555 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37344 res!215095) b!379328))

(assert (= (and b!379328 res!215086) b!379317))

(assert (= (and b!379317 res!215092) b!379319))

(assert (= (and b!379319 res!215085) b!379325))

(assert (= (and b!379325 res!215091) b!379324))

(assert (= (and b!379324 res!215096) b!379330))

(assert (= (and b!379330 res!215093) b!379322))

(assert (= (and b!379322 res!215094) b!379318))

(assert (= (and b!379318 res!215088) b!379320))

(assert (= (and b!379320 res!215087) b!379321))

(assert (= (and b!379321 (not res!215089)) b!379329))

(assert (= (and b!379329 (not res!215090)) b!379327))

(assert (= (and b!379323 condMapEmpty!15264) mapIsEmpty!15264))

(assert (= (and b!379323 (not condMapEmpty!15264)) mapNonEmpty!15264))

(get-info :version)

(assert (= (and mapNonEmpty!15264 ((_ is ValueCellFull!4223) mapValue!15264)) b!379316))

(assert (= (and b!379323 ((_ is ValueCellFull!4223) mapDefault!15264)) b!379326))

(assert (= start!37344 b!379323))

(declare-fun m!376469 () Bool)

(assert (=> b!379322 m!376469))

(declare-fun m!376471 () Bool)

(assert (=> start!37344 m!376471))

(declare-fun m!376473 () Bool)

(assert (=> start!37344 m!376473))

(declare-fun m!376475 () Bool)

(assert (=> start!37344 m!376475))

(declare-fun m!376477 () Bool)

(assert (=> b!379317 m!376477))

(declare-fun m!376479 () Bool)

(assert (=> b!379319 m!376479))

(declare-fun m!376481 () Bool)

(assert (=> b!379327 m!376481))

(declare-fun m!376483 () Bool)

(assert (=> b!379327 m!376483))

(declare-fun m!376485 () Bool)

(assert (=> b!379330 m!376485))

(declare-fun m!376487 () Bool)

(assert (=> b!379329 m!376487))

(declare-fun m!376489 () Bool)

(assert (=> b!379329 m!376489))

(declare-fun m!376491 () Bool)

(assert (=> b!379329 m!376491))

(declare-fun m!376493 () Bool)

(assert (=> mapNonEmpty!15264 m!376493))

(declare-fun m!376495 () Bool)

(assert (=> b!379320 m!376495))

(declare-fun m!376497 () Bool)

(assert (=> b!379324 m!376497))

(declare-fun m!376499 () Bool)

(assert (=> b!379318 m!376499))

(declare-fun m!376501 () Bool)

(assert (=> b!379318 m!376501))

(declare-fun m!376503 () Bool)

(assert (=> b!379321 m!376503))

(declare-fun m!376505 () Bool)

(assert (=> b!379321 m!376505))

(declare-fun m!376507 () Bool)

(assert (=> b!379321 m!376507))

(declare-fun m!376509 () Bool)

(assert (=> b!379321 m!376509))

(declare-fun m!376511 () Bool)

(assert (=> b!379321 m!376511))

(declare-fun m!376513 () Bool)

(assert (=> b!379321 m!376513))

(declare-fun m!376515 () Bool)

(assert (=> b!379321 m!376515))

(check-sat (not start!37344) (not b!379327) (not b!379317) (not b!379318) (not b!379320) (not b!379321) (not b!379329) (not b!379322) (not mapNonEmpty!15264) (not b!379324) (not b!379319) b_and!15741 tp_is_empty!9133 (not b_next!8485))
(check-sat b_and!15741 (not b_next!8485))
