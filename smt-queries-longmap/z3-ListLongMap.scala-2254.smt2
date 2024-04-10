; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36988 () Bool)

(assert start!36988)

(declare-fun b_free!8115 () Bool)

(declare-fun b_next!8115 () Bool)

(assert (=> start!36988 (= b_free!8115 (not b_next!8115))))

(declare-fun tp!29061 () Bool)

(declare-fun b_and!15357 () Bool)

(assert (=> start!36988 (= tp!29061 b_and!15357)))

(declare-fun mapIsEmpty!14709 () Bool)

(declare-fun mapRes!14709 () Bool)

(assert (=> mapIsEmpty!14709 mapRes!14709))

(declare-fun b!371282 () Bool)

(declare-fun e!226648 () Bool)

(declare-fun e!226646 () Bool)

(assert (=> b!371282 (= e!226648 (and e!226646 mapRes!14709))))

(declare-fun condMapEmpty!14709 () Bool)

(declare-datatypes ((V!12789 0))(
  ( (V!12790 (val!4426 Int)) )
))
(declare-datatypes ((ValueCell!4038 0))(
  ( (ValueCellFull!4038 (v!6623 V!12789)) (EmptyCell!4038) )
))
(declare-datatypes ((array!21467 0))(
  ( (array!21468 (arr!10202 (Array (_ BitVec 32) ValueCell!4038)) (size!10554 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21467)

(declare-fun mapDefault!14709 () ValueCell!4038)

(assert (=> b!371282 (= condMapEmpty!14709 (= (arr!10202 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4038)) mapDefault!14709)))))

(declare-fun b!371283 () Bool)

(declare-fun e!226649 () Bool)

(assert (=> b!371283 (= e!226649 (not true))))

(declare-datatypes ((tuple2!5872 0))(
  ( (tuple2!5873 (_1!2947 (_ BitVec 64)) (_2!2947 V!12789)) )
))
(declare-datatypes ((List!5711 0))(
  ( (Nil!5708) (Cons!5707 (h!6563 tuple2!5872) (t!10861 List!5711)) )
))
(declare-datatypes ((ListLongMap!4785 0))(
  ( (ListLongMap!4786 (toList!2408 List!5711)) )
))
(declare-fun lt!170226 () ListLongMap!4785)

(declare-fun lt!170228 () ListLongMap!4785)

(assert (=> b!371283 (and (= lt!170226 lt!170228) (= lt!170228 lt!170226))))

(declare-fun v!373 () V!12789)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!170227 () ListLongMap!4785)

(declare-fun +!754 (ListLongMap!4785 tuple2!5872) ListLongMap!4785)

(assert (=> b!371283 (= lt!170228 (+!754 lt!170227 (tuple2!5873 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11414 0))(
  ( (Unit!11415) )
))
(declare-fun lt!170229 () Unit!11414)

(declare-datatypes ((array!21469 0))(
  ( (array!21470 (arr!10203 (Array (_ BitVec 32) (_ BitVec 64))) (size!10555 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21469)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun zeroValue!472 () V!12789)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12789)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!9 (array!21469 array!21467 (_ BitVec 32) (_ BitVec 32) V!12789 V!12789 (_ BitVec 32) (_ BitVec 64) V!12789 (_ BitVec 32) Int) Unit!11414)

(assert (=> b!371283 (= lt!170229 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!9 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170225 () array!21469)

(declare-fun getCurrentListMapNoExtraKeys!685 (array!21469 array!21467 (_ BitVec 32) (_ BitVec 32) V!12789 V!12789 (_ BitVec 32) Int) ListLongMap!4785)

(assert (=> b!371283 (= lt!170226 (getCurrentListMapNoExtraKeys!685 lt!170225 (array!21468 (store (arr!10202 _values!506) i!548 (ValueCellFull!4038 v!373)) (size!10554 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371283 (= lt!170227 (getCurrentListMapNoExtraKeys!685 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371284 () Bool)

(declare-fun res!208672 () Bool)

(declare-fun e!226644 () Bool)

(assert (=> b!371284 (=> (not res!208672) (not e!226644))))

(declare-datatypes ((List!5712 0))(
  ( (Nil!5709) (Cons!5708 (h!6564 (_ BitVec 64)) (t!10862 List!5712)) )
))
(declare-fun arrayNoDuplicates!0 (array!21469 (_ BitVec 32) List!5712) Bool)

(assert (=> b!371284 (= res!208672 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5709))))

(declare-fun b!371285 () Bool)

(declare-fun res!208671 () Bool)

(assert (=> b!371285 (=> (not res!208671) (not e!226649))))

(assert (=> b!371285 (= res!208671 (arrayNoDuplicates!0 lt!170225 #b00000000000000000000000000000000 Nil!5709))))

(declare-fun mapNonEmpty!14709 () Bool)

(declare-fun tp!29060 () Bool)

(declare-fun e!226645 () Bool)

(assert (=> mapNonEmpty!14709 (= mapRes!14709 (and tp!29060 e!226645))))

(declare-fun mapValue!14709 () ValueCell!4038)

(declare-fun mapKey!14709 () (_ BitVec 32))

(declare-fun mapRest!14709 () (Array (_ BitVec 32) ValueCell!4038))

(assert (=> mapNonEmpty!14709 (= (arr!10202 _values!506) (store mapRest!14709 mapKey!14709 mapValue!14709))))

(declare-fun b!371286 () Bool)

(declare-fun res!208678 () Bool)

(assert (=> b!371286 (=> (not res!208678) (not e!226644))))

(assert (=> b!371286 (= res!208678 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10555 _keys!658))))))

(declare-fun res!208674 () Bool)

(assert (=> start!36988 (=> (not res!208674) (not e!226644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36988 (= res!208674 (validMask!0 mask!970))))

(assert (=> start!36988 e!226644))

(declare-fun array_inv!7534 (array!21467) Bool)

(assert (=> start!36988 (and (array_inv!7534 _values!506) e!226648)))

(assert (=> start!36988 tp!29061))

(assert (=> start!36988 true))

(declare-fun tp_is_empty!8763 () Bool)

(assert (=> start!36988 tp_is_empty!8763))

(declare-fun array_inv!7535 (array!21469) Bool)

(assert (=> start!36988 (array_inv!7535 _keys!658)))

(declare-fun b!371287 () Bool)

(declare-fun res!208673 () Bool)

(assert (=> b!371287 (=> (not res!208673) (not e!226644))))

(assert (=> b!371287 (= res!208673 (or (= (select (arr!10203 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10203 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371288 () Bool)

(declare-fun res!208675 () Bool)

(assert (=> b!371288 (=> (not res!208675) (not e!226644))))

(declare-fun arrayContainsKey!0 (array!21469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371288 (= res!208675 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371289 () Bool)

(assert (=> b!371289 (= e!226645 tp_is_empty!8763)))

(declare-fun b!371290 () Bool)

(declare-fun res!208670 () Bool)

(assert (=> b!371290 (=> (not res!208670) (not e!226644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21469 (_ BitVec 32)) Bool)

(assert (=> b!371290 (= res!208670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371291 () Bool)

(declare-fun res!208676 () Bool)

(assert (=> b!371291 (=> (not res!208676) (not e!226644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371291 (= res!208676 (validKeyInArray!0 k0!778))))

(declare-fun b!371292 () Bool)

(declare-fun res!208679 () Bool)

(assert (=> b!371292 (=> (not res!208679) (not e!226644))))

(assert (=> b!371292 (= res!208679 (and (= (size!10554 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10555 _keys!658) (size!10554 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371293 () Bool)

(assert (=> b!371293 (= e!226646 tp_is_empty!8763)))

(declare-fun b!371294 () Bool)

(assert (=> b!371294 (= e!226644 e!226649)))

(declare-fun res!208677 () Bool)

(assert (=> b!371294 (=> (not res!208677) (not e!226649))))

(assert (=> b!371294 (= res!208677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170225 mask!970))))

(assert (=> b!371294 (= lt!170225 (array!21470 (store (arr!10203 _keys!658) i!548 k0!778) (size!10555 _keys!658)))))

(assert (= (and start!36988 res!208674) b!371292))

(assert (= (and b!371292 res!208679) b!371290))

(assert (= (and b!371290 res!208670) b!371284))

(assert (= (and b!371284 res!208672) b!371286))

(assert (= (and b!371286 res!208678) b!371291))

(assert (= (and b!371291 res!208676) b!371287))

(assert (= (and b!371287 res!208673) b!371288))

(assert (= (and b!371288 res!208675) b!371294))

(assert (= (and b!371294 res!208677) b!371285))

(assert (= (and b!371285 res!208671) b!371283))

(assert (= (and b!371282 condMapEmpty!14709) mapIsEmpty!14709))

(assert (= (and b!371282 (not condMapEmpty!14709)) mapNonEmpty!14709))

(get-info :version)

(assert (= (and mapNonEmpty!14709 ((_ is ValueCellFull!4038) mapValue!14709)) b!371289))

(assert (= (and b!371282 ((_ is ValueCellFull!4038) mapDefault!14709)) b!371293))

(assert (= start!36988 b!371282))

(declare-fun m!367273 () Bool)

(assert (=> b!371288 m!367273))

(declare-fun m!367275 () Bool)

(assert (=> b!371283 m!367275))

(declare-fun m!367277 () Bool)

(assert (=> b!371283 m!367277))

(declare-fun m!367279 () Bool)

(assert (=> b!371283 m!367279))

(declare-fun m!367281 () Bool)

(assert (=> b!371283 m!367281))

(declare-fun m!367283 () Bool)

(assert (=> b!371283 m!367283))

(declare-fun m!367285 () Bool)

(assert (=> mapNonEmpty!14709 m!367285))

(declare-fun m!367287 () Bool)

(assert (=> start!36988 m!367287))

(declare-fun m!367289 () Bool)

(assert (=> start!36988 m!367289))

(declare-fun m!367291 () Bool)

(assert (=> start!36988 m!367291))

(declare-fun m!367293 () Bool)

(assert (=> b!371285 m!367293))

(declare-fun m!367295 () Bool)

(assert (=> b!371290 m!367295))

(declare-fun m!367297 () Bool)

(assert (=> b!371287 m!367297))

(declare-fun m!367299 () Bool)

(assert (=> b!371284 m!367299))

(declare-fun m!367301 () Bool)

(assert (=> b!371291 m!367301))

(declare-fun m!367303 () Bool)

(assert (=> b!371294 m!367303))

(declare-fun m!367305 () Bool)

(assert (=> b!371294 m!367305))

(check-sat (not b!371285) (not b!371284) (not mapNonEmpty!14709) (not b!371288) (not b!371294) (not b!371291) (not b!371290) (not start!36988) (not b!371283) b_and!15357 tp_is_empty!8763 (not b_next!8115))
(check-sat b_and!15357 (not b_next!8115))
