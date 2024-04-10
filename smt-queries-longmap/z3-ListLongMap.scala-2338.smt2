; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37492 () Bool)

(assert start!37492)

(declare-fun b_free!8619 () Bool)

(declare-fun b_next!8619 () Bool)

(assert (=> start!37492 (= b_free!8619 (not b_next!8619))))

(declare-fun tp!30572 () Bool)

(declare-fun b_and!15861 () Bool)

(assert (=> start!37492 (= tp!30572 b_and!15861)))

(declare-fun b!382276 () Bool)

(declare-fun res!217397 () Bool)

(declare-fun e!232324 () Bool)

(assert (=> b!382276 (=> (not res!217397) (not e!232324))))

(declare-datatypes ((array!22443 0))(
  ( (array!22444 (arr!10690 (Array (_ BitVec 32) (_ BitVec 64))) (size!11042 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22443)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22443 (_ BitVec 32)) Bool)

(assert (=> b!382276 (= res!217397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382277 () Bool)

(declare-fun e!232323 () Bool)

(assert (=> b!382277 (= e!232324 e!232323)))

(declare-fun res!217399 () Bool)

(assert (=> b!382277 (=> (not res!217399) (not e!232323))))

(declare-fun lt!179322 () array!22443)

(assert (=> b!382277 (= res!217399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179322 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382277 (= lt!179322 (array!22444 (store (arr!10690 _keys!658) i!548 k0!778) (size!11042 _keys!658)))))

(declare-fun b!382278 () Bool)

(declare-fun e!232321 () Bool)

(declare-fun tp_is_empty!9267 () Bool)

(assert (=> b!382278 (= e!232321 tp_is_empty!9267)))

(declare-fun b!382279 () Bool)

(declare-fun e!232322 () Bool)

(assert (=> b!382279 (= e!232323 (not e!232322))))

(declare-fun res!217401 () Bool)

(assert (=> b!382279 (=> res!217401 e!232322)))

(declare-fun lt!179323 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382279 (= res!217401 (or (and (not lt!179323) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179323) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179323)))))

(assert (=> b!382279 (= lt!179323 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13461 0))(
  ( (V!13462 (val!4678 Int)) )
))
(declare-datatypes ((ValueCell!4290 0))(
  ( (ValueCellFull!4290 (v!6875 V!13461)) (EmptyCell!4290) )
))
(declare-datatypes ((array!22445 0))(
  ( (array!22446 (arr!10691 (Array (_ BitVec 32) ValueCell!4290)) (size!11043 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22445)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6288 0))(
  ( (tuple2!6289 (_1!3155 (_ BitVec 64)) (_2!3155 V!13461)) )
))
(declare-datatypes ((List!6119 0))(
  ( (Nil!6116) (Cons!6115 (h!6971 tuple2!6288) (t!11269 List!6119)) )
))
(declare-datatypes ((ListLongMap!5201 0))(
  ( (ListLongMap!5202 (toList!2616 List!6119)) )
))
(declare-fun lt!179320 () ListLongMap!5201)

(declare-fun zeroValue!472 () V!13461)

(declare-fun minValue!472 () V!13461)

(declare-fun getCurrentListMap!2023 (array!22443 array!22445 (_ BitVec 32) (_ BitVec 32) V!13461 V!13461 (_ BitVec 32) Int) ListLongMap!5201)

(assert (=> b!382279 (= lt!179320 (getCurrentListMap!2023 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179324 () array!22445)

(declare-fun lt!179319 () ListLongMap!5201)

(assert (=> b!382279 (= lt!179319 (getCurrentListMap!2023 lt!179322 lt!179324 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179318 () ListLongMap!5201)

(declare-fun lt!179317 () ListLongMap!5201)

(assert (=> b!382279 (and (= lt!179318 lt!179317) (= lt!179317 lt!179318))))

(declare-fun lt!179325 () ListLongMap!5201)

(declare-fun v!373 () V!13461)

(declare-fun +!953 (ListLongMap!5201 tuple2!6288) ListLongMap!5201)

(assert (=> b!382279 (= lt!179317 (+!953 lt!179325 (tuple2!6289 k0!778 v!373)))))

(declare-datatypes ((Unit!11800 0))(
  ( (Unit!11801) )
))
(declare-fun lt!179321 () Unit!11800)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!181 (array!22443 array!22445 (_ BitVec 32) (_ BitVec 32) V!13461 V!13461 (_ BitVec 32) (_ BitVec 64) V!13461 (_ BitVec 32) Int) Unit!11800)

(assert (=> b!382279 (= lt!179321 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!181 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!857 (array!22443 array!22445 (_ BitVec 32) (_ BitVec 32) V!13461 V!13461 (_ BitVec 32) Int) ListLongMap!5201)

(assert (=> b!382279 (= lt!179318 (getCurrentListMapNoExtraKeys!857 lt!179322 lt!179324 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382279 (= lt!179324 (array!22446 (store (arr!10691 _values!506) i!548 (ValueCellFull!4290 v!373)) (size!11043 _values!506)))))

(assert (=> b!382279 (= lt!179325 (getCurrentListMapNoExtraKeys!857 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15465 () Bool)

(declare-fun mapRes!15465 () Bool)

(declare-fun tp!30573 () Bool)

(declare-fun e!232320 () Bool)

(assert (=> mapNonEmpty!15465 (= mapRes!15465 (and tp!30573 e!232320))))

(declare-fun mapValue!15465 () ValueCell!4290)

(declare-fun mapRest!15465 () (Array (_ BitVec 32) ValueCell!4290))

(declare-fun mapKey!15465 () (_ BitVec 32))

(assert (=> mapNonEmpty!15465 (= (arr!10691 _values!506) (store mapRest!15465 mapKey!15465 mapValue!15465))))

(declare-fun b!382280 () Bool)

(assert (=> b!382280 (= e!232322 true)))

(assert (=> b!382280 (= lt!179319 lt!179318)))

(declare-fun b!382281 () Bool)

(declare-fun res!217404 () Bool)

(assert (=> b!382281 (=> (not res!217404) (not e!232324))))

(assert (=> b!382281 (= res!217404 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11042 _keys!658))))))

(declare-fun res!217406 () Bool)

(assert (=> start!37492 (=> (not res!217406) (not e!232324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37492 (= res!217406 (validMask!0 mask!970))))

(assert (=> start!37492 e!232324))

(declare-fun e!232325 () Bool)

(declare-fun array_inv!7870 (array!22445) Bool)

(assert (=> start!37492 (and (array_inv!7870 _values!506) e!232325)))

(assert (=> start!37492 tp!30572))

(assert (=> start!37492 true))

(assert (=> start!37492 tp_is_empty!9267))

(declare-fun array_inv!7871 (array!22443) Bool)

(assert (=> start!37492 (array_inv!7871 _keys!658)))

(declare-fun b!382282 () Bool)

(declare-fun res!217402 () Bool)

(assert (=> b!382282 (=> (not res!217402) (not e!232324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382282 (= res!217402 (validKeyInArray!0 k0!778))))

(declare-fun b!382283 () Bool)

(declare-fun res!217396 () Bool)

(assert (=> b!382283 (=> (not res!217396) (not e!232324))))

(assert (=> b!382283 (= res!217396 (and (= (size!11043 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11042 _keys!658) (size!11043 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382284 () Bool)

(assert (=> b!382284 (= e!232320 tp_is_empty!9267)))

(declare-fun b!382285 () Bool)

(assert (=> b!382285 (= e!232325 (and e!232321 mapRes!15465))))

(declare-fun condMapEmpty!15465 () Bool)

(declare-fun mapDefault!15465 () ValueCell!4290)

(assert (=> b!382285 (= condMapEmpty!15465 (= (arr!10691 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4290)) mapDefault!15465)))))

(declare-fun b!382286 () Bool)

(declare-fun res!217398 () Bool)

(assert (=> b!382286 (=> (not res!217398) (not e!232324))))

(declare-datatypes ((List!6120 0))(
  ( (Nil!6117) (Cons!6116 (h!6972 (_ BitVec 64)) (t!11270 List!6120)) )
))
(declare-fun arrayNoDuplicates!0 (array!22443 (_ BitVec 32) List!6120) Bool)

(assert (=> b!382286 (= res!217398 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6117))))

(declare-fun b!382287 () Bool)

(declare-fun res!217400 () Bool)

(assert (=> b!382287 (=> (not res!217400) (not e!232324))))

(assert (=> b!382287 (= res!217400 (or (= (select (arr!10690 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10690 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15465 () Bool)

(assert (=> mapIsEmpty!15465 mapRes!15465))

(declare-fun b!382288 () Bool)

(declare-fun res!217403 () Bool)

(assert (=> b!382288 (=> (not res!217403) (not e!232323))))

(assert (=> b!382288 (= res!217403 (arrayNoDuplicates!0 lt!179322 #b00000000000000000000000000000000 Nil!6117))))

(declare-fun b!382289 () Bool)

(declare-fun res!217405 () Bool)

(assert (=> b!382289 (=> (not res!217405) (not e!232324))))

(declare-fun arrayContainsKey!0 (array!22443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382289 (= res!217405 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37492 res!217406) b!382283))

(assert (= (and b!382283 res!217396) b!382276))

(assert (= (and b!382276 res!217397) b!382286))

(assert (= (and b!382286 res!217398) b!382281))

(assert (= (and b!382281 res!217404) b!382282))

(assert (= (and b!382282 res!217402) b!382287))

(assert (= (and b!382287 res!217400) b!382289))

(assert (= (and b!382289 res!217405) b!382277))

(assert (= (and b!382277 res!217399) b!382288))

(assert (= (and b!382288 res!217403) b!382279))

(assert (= (and b!382279 (not res!217401)) b!382280))

(assert (= (and b!382285 condMapEmpty!15465) mapIsEmpty!15465))

(assert (= (and b!382285 (not condMapEmpty!15465)) mapNonEmpty!15465))

(get-info :version)

(assert (= (and mapNonEmpty!15465 ((_ is ValueCellFull!4290) mapValue!15465)) b!382284))

(assert (= (and b!382285 ((_ is ValueCellFull!4290) mapDefault!15465)) b!382278))

(assert (= start!37492 b!382285))

(declare-fun m!379115 () Bool)

(assert (=> b!382276 m!379115))

(declare-fun m!379117 () Bool)

(assert (=> b!382277 m!379117))

(declare-fun m!379119 () Bool)

(assert (=> b!382277 m!379119))

(declare-fun m!379121 () Bool)

(assert (=> b!382287 m!379121))

(declare-fun m!379123 () Bool)

(assert (=> b!382286 m!379123))

(declare-fun m!379125 () Bool)

(assert (=> start!37492 m!379125))

(declare-fun m!379127 () Bool)

(assert (=> start!37492 m!379127))

(declare-fun m!379129 () Bool)

(assert (=> start!37492 m!379129))

(declare-fun m!379131 () Bool)

(assert (=> b!382282 m!379131))

(declare-fun m!379133 () Bool)

(assert (=> b!382288 m!379133))

(declare-fun m!379135 () Bool)

(assert (=> mapNonEmpty!15465 m!379135))

(declare-fun m!379137 () Bool)

(assert (=> b!382289 m!379137))

(declare-fun m!379139 () Bool)

(assert (=> b!382279 m!379139))

(declare-fun m!379141 () Bool)

(assert (=> b!382279 m!379141))

(declare-fun m!379143 () Bool)

(assert (=> b!382279 m!379143))

(declare-fun m!379145 () Bool)

(assert (=> b!382279 m!379145))

(declare-fun m!379147 () Bool)

(assert (=> b!382279 m!379147))

(declare-fun m!379149 () Bool)

(assert (=> b!382279 m!379149))

(declare-fun m!379151 () Bool)

(assert (=> b!382279 m!379151))

(check-sat (not b!382277) (not start!37492) tp_is_empty!9267 (not b_next!8619) (not b!382282) (not b!382276) (not b!382288) b_and!15861 (not b!382286) (not mapNonEmpty!15465) (not b!382279) (not b!382289))
(check-sat b_and!15861 (not b_next!8619))
