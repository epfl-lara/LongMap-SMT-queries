; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37074 () Bool)

(assert start!37074)

(declare-fun b_free!8215 () Bool)

(declare-fun b_next!8215 () Bool)

(assert (=> start!37074 (= b_free!8215 (not b_next!8215))))

(declare-fun tp!29361 () Bool)

(declare-fun b_and!15471 () Bool)

(assert (=> start!37074 (= tp!29361 b_and!15471)))

(declare-fun b!373223 () Bool)

(declare-fun res!210210 () Bool)

(declare-fun e!227546 () Bool)

(assert (=> b!373223 (=> (not res!210210) (not e!227546))))

(declare-datatypes ((array!21648 0))(
  ( (array!21649 (arr!10292 (Array (_ BitVec 32) (_ BitVec 64))) (size!10644 (_ BitVec 32))) )
))
(declare-fun lt!171322 () array!21648)

(declare-datatypes ((List!5689 0))(
  ( (Nil!5686) (Cons!5685 (h!6541 (_ BitVec 64)) (t!10831 List!5689)) )
))
(declare-fun arrayNoDuplicates!0 (array!21648 (_ BitVec 32) List!5689) Bool)

(assert (=> b!373223 (= res!210210 (arrayNoDuplicates!0 lt!171322 #b00000000000000000000000000000000 Nil!5686))))

(declare-fun mapNonEmpty!14859 () Bool)

(declare-fun mapRes!14859 () Bool)

(declare-fun tp!29360 () Bool)

(declare-fun e!227549 () Bool)

(assert (=> mapNonEmpty!14859 (= mapRes!14859 (and tp!29360 e!227549))))

(declare-datatypes ((V!12923 0))(
  ( (V!12924 (val!4476 Int)) )
))
(declare-datatypes ((ValueCell!4088 0))(
  ( (ValueCellFull!4088 (v!6674 V!12923)) (EmptyCell!4088) )
))
(declare-fun mapRest!14859 () (Array (_ BitVec 32) ValueCell!4088))

(declare-datatypes ((array!21650 0))(
  ( (array!21651 (arr!10293 (Array (_ BitVec 32) ValueCell!4088)) (size!10645 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21650)

(declare-fun mapValue!14859 () ValueCell!4088)

(declare-fun mapKey!14859 () (_ BitVec 32))

(assert (=> mapNonEmpty!14859 (= (arr!10293 _values!506) (store mapRest!14859 mapKey!14859 mapValue!14859))))

(declare-fun b!373224 () Bool)

(declare-fun e!227548 () Bool)

(assert (=> b!373224 (= e!227546 (not e!227548))))

(declare-fun res!210218 () Bool)

(assert (=> b!373224 (=> res!210218 e!227548)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373224 (= res!210218 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5844 0))(
  ( (tuple2!5845 (_1!2933 (_ BitVec 64)) (_2!2933 V!12923)) )
))
(declare-datatypes ((List!5690 0))(
  ( (Nil!5687) (Cons!5686 (h!6542 tuple2!5844) (t!10832 List!5690)) )
))
(declare-datatypes ((ListLongMap!4759 0))(
  ( (ListLongMap!4760 (toList!2395 List!5690)) )
))
(declare-fun lt!171312 () ListLongMap!4759)

(declare-fun zeroValue!472 () V!12923)

(declare-fun _keys!658 () array!21648)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12923)

(declare-fun getCurrentListMap!1856 (array!21648 array!21650 (_ BitVec 32) (_ BitVec 32) V!12923 V!12923 (_ BitVec 32) Int) ListLongMap!4759)

(assert (=> b!373224 (= lt!171312 (getCurrentListMap!1856 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171313 () array!21650)

(declare-fun lt!171310 () ListLongMap!4759)

(assert (=> b!373224 (= lt!171310 (getCurrentListMap!1856 lt!171322 lt!171313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171318 () ListLongMap!4759)

(declare-fun lt!171307 () ListLongMap!4759)

(assert (=> b!373224 (and (= lt!171318 lt!171307) (= lt!171307 lt!171318))))

(declare-fun lt!171308 () ListLongMap!4759)

(declare-fun lt!171321 () tuple2!5844)

(declare-fun +!791 (ListLongMap!4759 tuple2!5844) ListLongMap!4759)

(assert (=> b!373224 (= lt!171307 (+!791 lt!171308 lt!171321))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!12923)

(assert (=> b!373224 (= lt!171321 (tuple2!5845 k0!778 v!373))))

(declare-datatypes ((Unit!11471 0))(
  ( (Unit!11472) )
))
(declare-fun lt!171309 () Unit!11471)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!43 (array!21648 array!21650 (_ BitVec 32) (_ BitVec 32) V!12923 V!12923 (_ BitVec 32) (_ BitVec 64) V!12923 (_ BitVec 32) Int) Unit!11471)

(assert (=> b!373224 (= lt!171309 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!43 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!703 (array!21648 array!21650 (_ BitVec 32) (_ BitVec 32) V!12923 V!12923 (_ BitVec 32) Int) ListLongMap!4759)

(assert (=> b!373224 (= lt!171318 (getCurrentListMapNoExtraKeys!703 lt!171322 lt!171313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373224 (= lt!171313 (array!21651 (store (arr!10293 _values!506) i!548 (ValueCellFull!4088 v!373)) (size!10645 _values!506)))))

(assert (=> b!373224 (= lt!171308 (getCurrentListMapNoExtraKeys!703 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373225 () Bool)

(declare-fun res!210207 () Bool)

(declare-fun e!227547 () Bool)

(assert (=> b!373225 (=> (not res!210207) (not e!227547))))

(assert (=> b!373225 (= res!210207 (or (= (select (arr!10292 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10292 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373226 () Bool)

(declare-fun res!210209 () Bool)

(assert (=> b!373226 (=> (not res!210209) (not e!227547))))

(assert (=> b!373226 (= res!210209 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10644 _keys!658))))))

(declare-fun b!373227 () Bool)

(declare-fun e!227543 () Bool)

(assert (=> b!373227 (= e!227543 true)))

(declare-fun lt!171311 () ListLongMap!4759)

(declare-fun lt!171319 () tuple2!5844)

(declare-fun lt!171320 () ListLongMap!4759)

(assert (=> b!373227 (= (+!791 lt!171311 lt!171319) (+!791 lt!171320 lt!171321))))

(declare-fun lt!171315 () ListLongMap!4759)

(declare-fun lt!171306 () Unit!11471)

(declare-fun addCommutativeForDiffKeys!220 (ListLongMap!4759 (_ BitVec 64) V!12923 (_ BitVec 64) V!12923) Unit!11471)

(assert (=> b!373227 (= lt!171306 (addCommutativeForDiffKeys!220 lt!171315 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373229 () Bool)

(declare-fun res!210215 () Bool)

(assert (=> b!373229 (=> (not res!210215) (not e!227547))))

(assert (=> b!373229 (= res!210215 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5686))))

(declare-fun b!373230 () Bool)

(declare-fun res!210208 () Bool)

(assert (=> b!373230 (=> (not res!210208) (not e!227547))))

(declare-fun arrayContainsKey!0 (array!21648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373230 (= res!210208 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373231 () Bool)

(declare-fun res!210211 () Bool)

(assert (=> b!373231 (=> (not res!210211) (not e!227547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373231 (= res!210211 (validKeyInArray!0 k0!778))))

(declare-fun b!373232 () Bool)

(assert (=> b!373232 (= e!227548 e!227543)))

(declare-fun res!210216 () Bool)

(assert (=> b!373232 (=> res!210216 e!227543)))

(assert (=> b!373232 (= res!210216 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171314 () ListLongMap!4759)

(assert (=> b!373232 (= lt!171314 lt!171311)))

(assert (=> b!373232 (= lt!171311 (+!791 lt!171315 lt!171321))))

(declare-fun lt!171316 () Unit!11471)

(assert (=> b!373232 (= lt!171316 (addCommutativeForDiffKeys!220 lt!171308 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!373232 (= lt!171310 (+!791 lt!171314 lt!171319))))

(declare-fun lt!171317 () tuple2!5844)

(assert (=> b!373232 (= lt!171314 (+!791 lt!171307 lt!171317))))

(assert (=> b!373232 (= lt!171312 lt!171320)))

(assert (=> b!373232 (= lt!171320 (+!791 lt!171315 lt!171319))))

(assert (=> b!373232 (= lt!171315 (+!791 lt!171308 lt!171317))))

(assert (=> b!373232 (= lt!171310 (+!791 (+!791 lt!171318 lt!171317) lt!171319))))

(assert (=> b!373232 (= lt!171319 (tuple2!5845 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373232 (= lt!171317 (tuple2!5845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373233 () Bool)

(declare-fun tp_is_empty!8863 () Bool)

(assert (=> b!373233 (= e!227549 tp_is_empty!8863)))

(declare-fun mapIsEmpty!14859 () Bool)

(assert (=> mapIsEmpty!14859 mapRes!14859))

(declare-fun b!373228 () Bool)

(assert (=> b!373228 (= e!227547 e!227546)))

(declare-fun res!210217 () Bool)

(assert (=> b!373228 (=> (not res!210217) (not e!227546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21648 (_ BitVec 32)) Bool)

(assert (=> b!373228 (= res!210217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171322 mask!970))))

(assert (=> b!373228 (= lt!171322 (array!21649 (store (arr!10292 _keys!658) i!548 k0!778) (size!10644 _keys!658)))))

(declare-fun res!210212 () Bool)

(assert (=> start!37074 (=> (not res!210212) (not e!227547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37074 (= res!210212 (validMask!0 mask!970))))

(assert (=> start!37074 e!227547))

(declare-fun e!227545 () Bool)

(declare-fun array_inv!7640 (array!21650) Bool)

(assert (=> start!37074 (and (array_inv!7640 _values!506) e!227545)))

(assert (=> start!37074 tp!29361))

(assert (=> start!37074 true))

(assert (=> start!37074 tp_is_empty!8863))

(declare-fun array_inv!7641 (array!21648) Bool)

(assert (=> start!37074 (array_inv!7641 _keys!658)))

(declare-fun b!373234 () Bool)

(declare-fun e!227544 () Bool)

(assert (=> b!373234 (= e!227545 (and e!227544 mapRes!14859))))

(declare-fun condMapEmpty!14859 () Bool)

(declare-fun mapDefault!14859 () ValueCell!4088)

(assert (=> b!373234 (= condMapEmpty!14859 (= (arr!10293 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4088)) mapDefault!14859)))))

(declare-fun b!373235 () Bool)

(assert (=> b!373235 (= e!227544 tp_is_empty!8863)))

(declare-fun b!373236 () Bool)

(declare-fun res!210213 () Bool)

(assert (=> b!373236 (=> (not res!210213) (not e!227547))))

(assert (=> b!373236 (= res!210213 (and (= (size!10645 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10644 _keys!658) (size!10645 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373237 () Bool)

(declare-fun res!210214 () Bool)

(assert (=> b!373237 (=> (not res!210214) (not e!227547))))

(assert (=> b!373237 (= res!210214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37074 res!210212) b!373236))

(assert (= (and b!373236 res!210213) b!373237))

(assert (= (and b!373237 res!210214) b!373229))

(assert (= (and b!373229 res!210215) b!373226))

(assert (= (and b!373226 res!210209) b!373231))

(assert (= (and b!373231 res!210211) b!373225))

(assert (= (and b!373225 res!210207) b!373230))

(assert (= (and b!373230 res!210208) b!373228))

(assert (= (and b!373228 res!210217) b!373223))

(assert (= (and b!373223 res!210210) b!373224))

(assert (= (and b!373224 (not res!210218)) b!373232))

(assert (= (and b!373232 (not res!210216)) b!373227))

(assert (= (and b!373234 condMapEmpty!14859) mapIsEmpty!14859))

(assert (= (and b!373234 (not condMapEmpty!14859)) mapNonEmpty!14859))

(get-info :version)

(assert (= (and mapNonEmpty!14859 ((_ is ValueCellFull!4088) mapValue!14859)) b!373233))

(assert (= (and b!373234 ((_ is ValueCellFull!4088) mapDefault!14859)) b!373235))

(assert (= start!37074 b!373234))

(declare-fun m!369365 () Bool)

(assert (=> b!373232 m!369365))

(declare-fun m!369367 () Bool)

(assert (=> b!373232 m!369367))

(declare-fun m!369369 () Bool)

(assert (=> b!373232 m!369369))

(declare-fun m!369371 () Bool)

(assert (=> b!373232 m!369371))

(declare-fun m!369373 () Bool)

(assert (=> b!373232 m!369373))

(declare-fun m!369375 () Bool)

(assert (=> b!373232 m!369375))

(declare-fun m!369377 () Bool)

(assert (=> b!373232 m!369377))

(assert (=> b!373232 m!369375))

(declare-fun m!369379 () Bool)

(assert (=> b!373232 m!369379))

(declare-fun m!369381 () Bool)

(assert (=> b!373227 m!369381))

(declare-fun m!369383 () Bool)

(assert (=> b!373227 m!369383))

(declare-fun m!369385 () Bool)

(assert (=> b!373227 m!369385))

(declare-fun m!369387 () Bool)

(assert (=> b!373231 m!369387))

(declare-fun m!369389 () Bool)

(assert (=> b!373225 m!369389))

(declare-fun m!369391 () Bool)

(assert (=> start!37074 m!369391))

(declare-fun m!369393 () Bool)

(assert (=> start!37074 m!369393))

(declare-fun m!369395 () Bool)

(assert (=> start!37074 m!369395))

(declare-fun m!369397 () Bool)

(assert (=> b!373224 m!369397))

(declare-fun m!369399 () Bool)

(assert (=> b!373224 m!369399))

(declare-fun m!369401 () Bool)

(assert (=> b!373224 m!369401))

(declare-fun m!369403 () Bool)

(assert (=> b!373224 m!369403))

(declare-fun m!369405 () Bool)

(assert (=> b!373224 m!369405))

(declare-fun m!369407 () Bool)

(assert (=> b!373224 m!369407))

(declare-fun m!369409 () Bool)

(assert (=> b!373224 m!369409))

(declare-fun m!369411 () Bool)

(assert (=> b!373230 m!369411))

(declare-fun m!369413 () Bool)

(assert (=> b!373228 m!369413))

(declare-fun m!369415 () Bool)

(assert (=> b!373228 m!369415))

(declare-fun m!369417 () Bool)

(assert (=> b!373223 m!369417))

(declare-fun m!369419 () Bool)

(assert (=> b!373237 m!369419))

(declare-fun m!369421 () Bool)

(assert (=> b!373229 m!369421))

(declare-fun m!369423 () Bool)

(assert (=> mapNonEmpty!14859 m!369423))

(check-sat (not b!373230) (not start!37074) tp_is_empty!8863 (not mapNonEmpty!14859) (not b!373231) (not b!373228) (not b!373223) (not b!373232) (not b!373224) (not b_next!8215) (not b!373237) (not b!373227) (not b!373229) b_and!15471)
(check-sat b_and!15471 (not b_next!8215))
