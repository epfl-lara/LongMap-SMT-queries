; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36972 () Bool)

(assert start!36972)

(declare-fun b_free!8113 () Bool)

(declare-fun b_next!8113 () Bool)

(assert (=> start!36972 (= b_free!8113 (not b_next!8113))))

(declare-fun tp!29054 () Bool)

(declare-fun b_and!15369 () Bool)

(assert (=> start!36972 (= tp!29054 b_and!15369)))

(declare-fun b!371194 () Bool)

(declare-fun res!208639 () Bool)

(declare-fun e!226597 () Bool)

(assert (=> b!371194 (=> (not res!208639) (not e!226597))))

(declare-datatypes ((array!21448 0))(
  ( (array!21449 (arr!10192 (Array (_ BitVec 32) (_ BitVec 64))) (size!10544 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21448)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371194 (= res!208639 (or (= (select (arr!10192 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10192 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371195 () Bool)

(declare-fun e!226596 () Bool)

(declare-fun tp_is_empty!8761 () Bool)

(assert (=> b!371195 (= e!226596 tp_is_empty!8761)))

(declare-fun b!371196 () Bool)

(declare-fun res!208638 () Bool)

(assert (=> b!371196 (=> (not res!208638) (not e!226597))))

(assert (=> b!371196 (= res!208638 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10544 _keys!658))))))

(declare-fun b!371197 () Bool)

(declare-fun e!226599 () Bool)

(assert (=> b!371197 (= e!226599 (not true))))

(declare-datatypes ((V!12787 0))(
  ( (V!12788 (val!4425 Int)) )
))
(declare-datatypes ((tuple2!5770 0))(
  ( (tuple2!5771 (_1!2896 (_ BitVec 64)) (_2!2896 V!12787)) )
))
(declare-datatypes ((List!5607 0))(
  ( (Nil!5604) (Cons!5603 (h!6459 tuple2!5770) (t!10749 List!5607)) )
))
(declare-datatypes ((ListLongMap!4685 0))(
  ( (ListLongMap!4686 (toList!2358 List!5607)) )
))
(declare-fun lt!170233 () ListLongMap!4685)

(declare-fun lt!170230 () ListLongMap!4685)

(assert (=> b!371197 (and (= lt!170233 lt!170230) (= lt!170230 lt!170233))))

(declare-fun lt!170232 () ListLongMap!4685)

(declare-fun v!373 () V!12787)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!754 (ListLongMap!4685 tuple2!5770) ListLongMap!4685)

(assert (=> b!371197 (= lt!170230 (+!754 lt!170232 (tuple2!5771 k0!778 v!373)))))

(declare-datatypes ((ValueCell!4037 0))(
  ( (ValueCellFull!4037 (v!6623 V!12787)) (EmptyCell!4037) )
))
(declare-datatypes ((array!21450 0))(
  ( (array!21451 (arr!10193 (Array (_ BitVec 32) ValueCell!4037)) (size!10545 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21450)

(declare-fun zeroValue!472 () V!12787)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11399 0))(
  ( (Unit!11400) )
))
(declare-fun lt!170231 () Unit!11399)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12787)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!7 (array!21448 array!21450 (_ BitVec 32) (_ BitVec 32) V!12787 V!12787 (_ BitVec 32) (_ BitVec 64) V!12787 (_ BitVec 32) Int) Unit!11399)

(assert (=> b!371197 (= lt!170231 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!7 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170229 () array!21448)

(declare-fun getCurrentListMapNoExtraKeys!667 (array!21448 array!21450 (_ BitVec 32) (_ BitVec 32) V!12787 V!12787 (_ BitVec 32) Int) ListLongMap!4685)

(assert (=> b!371197 (= lt!170233 (getCurrentListMapNoExtraKeys!667 lt!170229 (array!21451 (store (arr!10193 _values!506) i!548 (ValueCellFull!4037 v!373)) (size!10545 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371197 (= lt!170232 (getCurrentListMapNoExtraKeys!667 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!208645 () Bool)

(assert (=> start!36972 (=> (not res!208645) (not e!226597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36972 (= res!208645 (validMask!0 mask!970))))

(assert (=> start!36972 e!226597))

(declare-fun e!226594 () Bool)

(declare-fun array_inv!7558 (array!21450) Bool)

(assert (=> start!36972 (and (array_inv!7558 _values!506) e!226594)))

(assert (=> start!36972 tp!29054))

(assert (=> start!36972 true))

(assert (=> start!36972 tp_is_empty!8761))

(declare-fun array_inv!7559 (array!21448) Bool)

(assert (=> start!36972 (array_inv!7559 _keys!658)))

(declare-fun b!371198 () Bool)

(declare-fun res!208641 () Bool)

(assert (=> b!371198 (=> (not res!208641) (not e!226597))))

(declare-datatypes ((List!5608 0))(
  ( (Nil!5605) (Cons!5604 (h!6460 (_ BitVec 64)) (t!10750 List!5608)) )
))
(declare-fun arrayNoDuplicates!0 (array!21448 (_ BitVec 32) List!5608) Bool)

(assert (=> b!371198 (= res!208641 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5605))))

(declare-fun b!371199 () Bool)

(declare-fun e!226598 () Bool)

(assert (=> b!371199 (= e!226598 tp_is_empty!8761)))

(declare-fun b!371200 () Bool)

(declare-fun res!208640 () Bool)

(assert (=> b!371200 (=> (not res!208640) (not e!226597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371200 (= res!208640 (validKeyInArray!0 k0!778))))

(declare-fun b!371201 () Bool)

(declare-fun res!208644 () Bool)

(assert (=> b!371201 (=> (not res!208644) (not e!226597))))

(declare-fun arrayContainsKey!0 (array!21448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371201 (= res!208644 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14706 () Bool)

(declare-fun mapRes!14706 () Bool)

(assert (=> mapIsEmpty!14706 mapRes!14706))

(declare-fun mapNonEmpty!14706 () Bool)

(declare-fun tp!29055 () Bool)

(assert (=> mapNonEmpty!14706 (= mapRes!14706 (and tp!29055 e!226598))))

(declare-fun mapRest!14706 () (Array (_ BitVec 32) ValueCell!4037))

(declare-fun mapValue!14706 () ValueCell!4037)

(declare-fun mapKey!14706 () (_ BitVec 32))

(assert (=> mapNonEmpty!14706 (= (arr!10193 _values!506) (store mapRest!14706 mapKey!14706 mapValue!14706))))

(declare-fun b!371202 () Bool)

(declare-fun res!208637 () Bool)

(assert (=> b!371202 (=> (not res!208637) (not e!226597))))

(assert (=> b!371202 (= res!208637 (and (= (size!10545 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10544 _keys!658) (size!10545 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371203 () Bool)

(declare-fun res!208646 () Bool)

(assert (=> b!371203 (=> (not res!208646) (not e!226597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21448 (_ BitVec 32)) Bool)

(assert (=> b!371203 (= res!208646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371204 () Bool)

(assert (=> b!371204 (= e!226597 e!226599)))

(declare-fun res!208642 () Bool)

(assert (=> b!371204 (=> (not res!208642) (not e!226599))))

(assert (=> b!371204 (= res!208642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170229 mask!970))))

(assert (=> b!371204 (= lt!170229 (array!21449 (store (arr!10192 _keys!658) i!548 k0!778) (size!10544 _keys!658)))))

(declare-fun b!371205 () Bool)

(assert (=> b!371205 (= e!226594 (and e!226596 mapRes!14706))))

(declare-fun condMapEmpty!14706 () Bool)

(declare-fun mapDefault!14706 () ValueCell!4037)

(assert (=> b!371205 (= condMapEmpty!14706 (= (arr!10193 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4037)) mapDefault!14706)))))

(declare-fun b!371206 () Bool)

(declare-fun res!208643 () Bool)

(assert (=> b!371206 (=> (not res!208643) (not e!226599))))

(assert (=> b!371206 (= res!208643 (arrayNoDuplicates!0 lt!170229 #b00000000000000000000000000000000 Nil!5605))))

(assert (= (and start!36972 res!208645) b!371202))

(assert (= (and b!371202 res!208637) b!371203))

(assert (= (and b!371203 res!208646) b!371198))

(assert (= (and b!371198 res!208641) b!371196))

(assert (= (and b!371196 res!208638) b!371200))

(assert (= (and b!371200 res!208640) b!371194))

(assert (= (and b!371194 res!208639) b!371201))

(assert (= (and b!371201 res!208644) b!371204))

(assert (= (and b!371204 res!208642) b!371206))

(assert (= (and b!371206 res!208643) b!371197))

(assert (= (and b!371205 condMapEmpty!14706) mapIsEmpty!14706))

(assert (= (and b!371205 (not condMapEmpty!14706)) mapNonEmpty!14706))

(get-info :version)

(assert (= (and mapNonEmpty!14706 ((_ is ValueCellFull!4037) mapValue!14706)) b!371199))

(assert (= (and b!371205 ((_ is ValueCellFull!4037) mapDefault!14706)) b!371195))

(assert (= start!36972 b!371205))

(declare-fun m!367469 () Bool)

(assert (=> b!371194 m!367469))

(declare-fun m!367471 () Bool)

(assert (=> b!371201 m!367471))

(declare-fun m!367473 () Bool)

(assert (=> b!371203 m!367473))

(declare-fun m!367475 () Bool)

(assert (=> mapNonEmpty!14706 m!367475))

(declare-fun m!367477 () Bool)

(assert (=> b!371197 m!367477))

(declare-fun m!367479 () Bool)

(assert (=> b!371197 m!367479))

(declare-fun m!367481 () Bool)

(assert (=> b!371197 m!367481))

(declare-fun m!367483 () Bool)

(assert (=> b!371197 m!367483))

(declare-fun m!367485 () Bool)

(assert (=> b!371197 m!367485))

(declare-fun m!367487 () Bool)

(assert (=> b!371204 m!367487))

(declare-fun m!367489 () Bool)

(assert (=> b!371204 m!367489))

(declare-fun m!367491 () Bool)

(assert (=> b!371200 m!367491))

(declare-fun m!367493 () Bool)

(assert (=> b!371206 m!367493))

(declare-fun m!367495 () Bool)

(assert (=> start!36972 m!367495))

(declare-fun m!367497 () Bool)

(assert (=> start!36972 m!367497))

(declare-fun m!367499 () Bool)

(assert (=> start!36972 m!367499))

(declare-fun m!367501 () Bool)

(assert (=> b!371198 m!367501))

(check-sat (not b!371206) (not b!371204) tp_is_empty!8761 (not b!371198) (not b!371201) b_and!15369 (not start!36972) (not b!371197) (not b!371200) (not b_next!8113) (not mapNonEmpty!14706) (not b!371203))
(check-sat b_and!15369 (not b_next!8113))
