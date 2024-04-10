; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37318 () Bool)

(assert start!37318)

(declare-fun b_free!8445 () Bool)

(declare-fun b_next!8445 () Bool)

(assert (=> start!37318 (= b_free!8445 (not b_next!8445))))

(declare-fun tp!30050 () Bool)

(declare-fun b_and!15687 () Bool)

(assert (=> start!37318 (= tp!30050 b_and!15687)))

(declare-fun b!378466 () Bool)

(declare-fun res!214375 () Bool)

(declare-fun e!230335 () Bool)

(assert (=> b!378466 (=> (not res!214375) (not e!230335))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22111 0))(
  ( (array!22112 (arr!10524 (Array (_ BitVec 32) (_ BitVec 64))) (size!10876 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22111)

(assert (=> b!378466 (= res!214375 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10876 _keys!658))))))

(declare-fun b!378467 () Bool)

(declare-fun res!214368 () Bool)

(assert (=> b!378467 (=> (not res!214368) (not e!230335))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13229 0))(
  ( (V!13230 (val!4591 Int)) )
))
(declare-datatypes ((ValueCell!4203 0))(
  ( (ValueCellFull!4203 (v!6788 V!13229)) (EmptyCell!4203) )
))
(declare-datatypes ((array!22113 0))(
  ( (array!22114 (arr!10525 (Array (_ BitVec 32) ValueCell!4203)) (size!10877 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22113)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!378467 (= res!214368 (and (= (size!10877 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10876 _keys!658) (size!10877 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378468 () Bool)

(declare-fun e!230341 () Bool)

(declare-fun tp_is_empty!9093 () Bool)

(assert (=> b!378468 (= e!230341 tp_is_empty!9093)))

(declare-fun mapNonEmpty!15204 () Bool)

(declare-fun mapRes!15204 () Bool)

(declare-fun tp!30051 () Bool)

(assert (=> mapNonEmpty!15204 (= mapRes!15204 (and tp!30051 e!230341))))

(declare-fun mapKey!15204 () (_ BitVec 32))

(declare-fun mapValue!15204 () ValueCell!4203)

(declare-fun mapRest!15204 () (Array (_ BitVec 32) ValueCell!4203))

(assert (=> mapNonEmpty!15204 (= (arr!10525 _values!506) (store mapRest!15204 mapKey!15204 mapValue!15204))))

(declare-fun b!378469 () Bool)

(declare-fun e!230339 () Bool)

(assert (=> b!378469 (= e!230339 tp_is_empty!9093)))

(declare-fun b!378470 () Bool)

(declare-fun res!214377 () Bool)

(assert (=> b!378470 (=> (not res!214377) (not e!230335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22111 (_ BitVec 32)) Bool)

(assert (=> b!378470 (= res!214377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378471 () Bool)

(declare-fun e!230342 () Bool)

(declare-fun e!230337 () Bool)

(assert (=> b!378471 (= e!230342 e!230337)))

(declare-fun res!214373 () Bool)

(assert (=> b!378471 (=> res!214373 e!230337)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!378471 (= res!214373 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6132 0))(
  ( (tuple2!6133 (_1!3077 (_ BitVec 64)) (_2!3077 V!13229)) )
))
(declare-datatypes ((List!5970 0))(
  ( (Nil!5967) (Cons!5966 (h!6822 tuple2!6132) (t!11120 List!5970)) )
))
(declare-datatypes ((ListLongMap!5045 0))(
  ( (ListLongMap!5046 (toList!2538 List!5970)) )
))
(declare-fun lt!176349 () ListLongMap!5045)

(declare-fun lt!176347 () ListLongMap!5045)

(assert (=> b!378471 (= lt!176349 lt!176347)))

(declare-fun lt!176341 () ListLongMap!5045)

(declare-fun lt!176346 () tuple2!6132)

(declare-fun +!884 (ListLongMap!5045 tuple2!6132) ListLongMap!5045)

(assert (=> b!378471 (= lt!176347 (+!884 lt!176341 lt!176346))))

(declare-fun lt!176352 () ListLongMap!5045)

(declare-fun lt!176343 () ListLongMap!5045)

(assert (=> b!378471 (= lt!176352 lt!176343)))

(declare-fun lt!176345 () ListLongMap!5045)

(assert (=> b!378471 (= lt!176343 (+!884 lt!176345 lt!176346))))

(declare-fun lt!176351 () ListLongMap!5045)

(assert (=> b!378471 (= lt!176352 (+!884 lt!176351 lt!176346))))

(declare-fun minValue!472 () V!13229)

(assert (=> b!378471 (= lt!176346 (tuple2!6133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378472 () Bool)

(assert (=> b!378472 (= e!230337 true)))

(declare-fun lt!176348 () tuple2!6132)

(assert (=> b!378472 (= lt!176343 (+!884 lt!176347 lt!176348))))

(declare-fun v!373 () V!13229)

(declare-datatypes ((Unit!11668 0))(
  ( (Unit!11669) )
))
(declare-fun lt!176350 () Unit!11668)

(declare-fun addCommutativeForDiffKeys!287 (ListLongMap!5045 (_ BitVec 64) V!13229 (_ BitVec 64) V!13229) Unit!11668)

(assert (=> b!378472 (= lt!176350 (addCommutativeForDiffKeys!287 lt!176341 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378473 () Bool)

(declare-fun res!214379 () Bool)

(assert (=> b!378473 (=> (not res!214379) (not e!230335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378473 (= res!214379 (validKeyInArray!0 k0!778))))

(declare-fun b!378474 () Bool)

(declare-fun res!214374 () Bool)

(declare-fun e!230340 () Bool)

(assert (=> b!378474 (=> (not res!214374) (not e!230340))))

(declare-fun lt!176340 () array!22111)

(declare-datatypes ((List!5971 0))(
  ( (Nil!5968) (Cons!5967 (h!6823 (_ BitVec 64)) (t!11121 List!5971)) )
))
(declare-fun arrayNoDuplicates!0 (array!22111 (_ BitVec 32) List!5971) Bool)

(assert (=> b!378474 (= res!214374 (arrayNoDuplicates!0 lt!176340 #b00000000000000000000000000000000 Nil!5968))))

(declare-fun b!378475 () Bool)

(declare-fun res!214371 () Bool)

(assert (=> b!378475 (=> (not res!214371) (not e!230335))))

(assert (=> b!378475 (= res!214371 (or (= (select (arr!10524 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10524 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15204 () Bool)

(assert (=> mapIsEmpty!15204 mapRes!15204))

(declare-fun res!214372 () Bool)

(assert (=> start!37318 (=> (not res!214372) (not e!230335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37318 (= res!214372 (validMask!0 mask!970))))

(assert (=> start!37318 e!230335))

(declare-fun e!230336 () Bool)

(declare-fun array_inv!7752 (array!22113) Bool)

(assert (=> start!37318 (and (array_inv!7752 _values!506) e!230336)))

(assert (=> start!37318 tp!30050))

(assert (=> start!37318 true))

(assert (=> start!37318 tp_is_empty!9093))

(declare-fun array_inv!7753 (array!22111) Bool)

(assert (=> start!37318 (array_inv!7753 _keys!658)))

(declare-fun b!378465 () Bool)

(declare-fun res!214376 () Bool)

(assert (=> b!378465 (=> (not res!214376) (not e!230335))))

(assert (=> b!378465 (= res!214376 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5968))))

(declare-fun b!378476 () Bool)

(assert (=> b!378476 (= e!230335 e!230340)))

(declare-fun res!214369 () Bool)

(assert (=> b!378476 (=> (not res!214369) (not e!230340))))

(assert (=> b!378476 (= res!214369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176340 mask!970))))

(assert (=> b!378476 (= lt!176340 (array!22112 (store (arr!10524 _keys!658) i!548 k0!778) (size!10876 _keys!658)))))

(declare-fun b!378477 () Bool)

(assert (=> b!378477 (= e!230340 (not e!230342))))

(declare-fun res!214370 () Bool)

(assert (=> b!378477 (=> res!214370 e!230342)))

(assert (=> b!378477 (= res!214370 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13229)

(declare-fun getCurrentListMap!1964 (array!22111 array!22113 (_ BitVec 32) (_ BitVec 32) V!13229 V!13229 (_ BitVec 32) Int) ListLongMap!5045)

(assert (=> b!378477 (= lt!176349 (getCurrentListMap!1964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176344 () array!22113)

(assert (=> b!378477 (= lt!176352 (getCurrentListMap!1964 lt!176340 lt!176344 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378477 (and (= lt!176351 lt!176345) (= lt!176345 lt!176351))))

(assert (=> b!378477 (= lt!176345 (+!884 lt!176341 lt!176348))))

(assert (=> b!378477 (= lt!176348 (tuple2!6133 k0!778 v!373))))

(declare-fun lt!176342 () Unit!11668)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!122 (array!22111 array!22113 (_ BitVec 32) (_ BitVec 32) V!13229 V!13229 (_ BitVec 32) (_ BitVec 64) V!13229 (_ BitVec 32) Int) Unit!11668)

(assert (=> b!378477 (= lt!176342 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!122 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!798 (array!22111 array!22113 (_ BitVec 32) (_ BitVec 32) V!13229 V!13229 (_ BitVec 32) Int) ListLongMap!5045)

(assert (=> b!378477 (= lt!176351 (getCurrentListMapNoExtraKeys!798 lt!176340 lt!176344 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378477 (= lt!176344 (array!22114 (store (arr!10525 _values!506) i!548 (ValueCellFull!4203 v!373)) (size!10877 _values!506)))))

(assert (=> b!378477 (= lt!176341 (getCurrentListMapNoExtraKeys!798 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378478 () Bool)

(assert (=> b!378478 (= e!230336 (and e!230339 mapRes!15204))))

(declare-fun condMapEmpty!15204 () Bool)

(declare-fun mapDefault!15204 () ValueCell!4203)

(assert (=> b!378478 (= condMapEmpty!15204 (= (arr!10525 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4203)) mapDefault!15204)))))

(declare-fun b!378479 () Bool)

(declare-fun res!214378 () Bool)

(assert (=> b!378479 (=> (not res!214378) (not e!230335))))

(declare-fun arrayContainsKey!0 (array!22111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378479 (= res!214378 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37318 res!214372) b!378467))

(assert (= (and b!378467 res!214368) b!378470))

(assert (= (and b!378470 res!214377) b!378465))

(assert (= (and b!378465 res!214376) b!378466))

(assert (= (and b!378466 res!214375) b!378473))

(assert (= (and b!378473 res!214379) b!378475))

(assert (= (and b!378475 res!214371) b!378479))

(assert (= (and b!378479 res!214378) b!378476))

(assert (= (and b!378476 res!214369) b!378474))

(assert (= (and b!378474 res!214374) b!378477))

(assert (= (and b!378477 (not res!214370)) b!378471))

(assert (= (and b!378471 (not res!214373)) b!378472))

(assert (= (and b!378478 condMapEmpty!15204) mapIsEmpty!15204))

(assert (= (and b!378478 (not condMapEmpty!15204)) mapNonEmpty!15204))

(get-info :version)

(assert (= (and mapNonEmpty!15204 ((_ is ValueCellFull!4203) mapValue!15204)) b!378468))

(assert (= (and b!378478 ((_ is ValueCellFull!4203) mapDefault!15204)) b!378469))

(assert (= start!37318 b!378478))

(declare-fun m!375279 () Bool)

(assert (=> start!37318 m!375279))

(declare-fun m!375281 () Bool)

(assert (=> start!37318 m!375281))

(declare-fun m!375283 () Bool)

(assert (=> start!37318 m!375283))

(declare-fun m!375285 () Bool)

(assert (=> b!378470 m!375285))

(declare-fun m!375287 () Bool)

(assert (=> b!378465 m!375287))

(declare-fun m!375289 () Bool)

(assert (=> b!378475 m!375289))

(declare-fun m!375291 () Bool)

(assert (=> b!378479 m!375291))

(declare-fun m!375293 () Bool)

(assert (=> b!378474 m!375293))

(declare-fun m!375295 () Bool)

(assert (=> b!378471 m!375295))

(declare-fun m!375297 () Bool)

(assert (=> b!378471 m!375297))

(declare-fun m!375299 () Bool)

(assert (=> b!378471 m!375299))

(declare-fun m!375301 () Bool)

(assert (=> b!378476 m!375301))

(declare-fun m!375303 () Bool)

(assert (=> b!378476 m!375303))

(declare-fun m!375305 () Bool)

(assert (=> b!378472 m!375305))

(declare-fun m!375307 () Bool)

(assert (=> b!378472 m!375307))

(declare-fun m!375309 () Bool)

(assert (=> b!378473 m!375309))

(declare-fun m!375311 () Bool)

(assert (=> b!378477 m!375311))

(declare-fun m!375313 () Bool)

(assert (=> b!378477 m!375313))

(declare-fun m!375315 () Bool)

(assert (=> b!378477 m!375315))

(declare-fun m!375317 () Bool)

(assert (=> b!378477 m!375317))

(declare-fun m!375319 () Bool)

(assert (=> b!378477 m!375319))

(declare-fun m!375321 () Bool)

(assert (=> b!378477 m!375321))

(declare-fun m!375323 () Bool)

(assert (=> b!378477 m!375323))

(declare-fun m!375325 () Bool)

(assert (=> mapNonEmpty!15204 m!375325))

(check-sat (not b!378476) (not b!378472) (not mapNonEmpty!15204) (not b_next!8445) b_and!15687 (not b!378477) tp_is_empty!9093 (not b!378471) (not b!378470) (not b!378474) (not b!378465) (not start!37318) (not b!378479) (not b!378473))
(check-sat b_and!15687 (not b_next!8445))
