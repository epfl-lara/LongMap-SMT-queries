; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37000 () Bool)

(assert start!37000)

(declare-fun b_free!8127 () Bool)

(declare-fun b_next!8127 () Bool)

(assert (=> start!37000 (= b_free!8127 (not b_next!8127))))

(declare-fun tp!29096 () Bool)

(declare-fun b_and!15369 () Bool)

(assert (=> start!37000 (= tp!29096 b_and!15369)))

(declare-fun res!208850 () Bool)

(declare-fun e!226754 () Bool)

(assert (=> start!37000 (=> (not res!208850) (not e!226754))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37000 (= res!208850 (validMask!0 mask!970))))

(assert (=> start!37000 e!226754))

(declare-datatypes ((V!12805 0))(
  ( (V!12806 (val!4432 Int)) )
))
(declare-datatypes ((ValueCell!4044 0))(
  ( (ValueCellFull!4044 (v!6629 V!12805)) (EmptyCell!4044) )
))
(declare-datatypes ((array!21491 0))(
  ( (array!21492 (arr!10214 (Array (_ BitVec 32) ValueCell!4044)) (size!10566 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21491)

(declare-fun e!226756 () Bool)

(declare-fun array_inv!7542 (array!21491) Bool)

(assert (=> start!37000 (and (array_inv!7542 _values!506) e!226756)))

(assert (=> start!37000 tp!29096))

(assert (=> start!37000 true))

(declare-fun tp_is_empty!8775 () Bool)

(assert (=> start!37000 tp_is_empty!8775))

(declare-datatypes ((array!21493 0))(
  ( (array!21494 (arr!10215 (Array (_ BitVec 32) (_ BitVec 64))) (size!10567 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21493)

(declare-fun array_inv!7543 (array!21493) Bool)

(assert (=> start!37000 (array_inv!7543 _keys!658)))

(declare-fun b!371516 () Bool)

(declare-fun res!208854 () Bool)

(assert (=> b!371516 (=> (not res!208854) (not e!226754))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371516 (= res!208854 (and (= (size!10566 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10567 _keys!658) (size!10566 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371517 () Bool)

(declare-fun e!226755 () Bool)

(assert (=> b!371517 (= e!226755 (not true))))

(declare-datatypes ((tuple2!5880 0))(
  ( (tuple2!5881 (_1!2951 (_ BitVec 64)) (_2!2951 V!12805)) )
))
(declare-datatypes ((List!5720 0))(
  ( (Nil!5717) (Cons!5716 (h!6572 tuple2!5880) (t!10870 List!5720)) )
))
(declare-datatypes ((ListLongMap!4793 0))(
  ( (ListLongMap!4794 (toList!2412 List!5720)) )
))
(declare-fun lt!170316 () ListLongMap!4793)

(declare-fun lt!170318 () ListLongMap!4793)

(assert (=> b!371517 (and (= lt!170316 lt!170318) (= lt!170318 lt!170316))))

(declare-fun v!373 () V!12805)

(declare-fun lt!170317 () ListLongMap!4793)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!758 (ListLongMap!4793 tuple2!5880) ListLongMap!4793)

(assert (=> b!371517 (= lt!170318 (+!758 lt!170317 (tuple2!5881 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12805)

(declare-datatypes ((Unit!11422 0))(
  ( (Unit!11423) )
))
(declare-fun lt!170315 () Unit!11422)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12805)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!13 (array!21493 array!21491 (_ BitVec 32) (_ BitVec 32) V!12805 V!12805 (_ BitVec 32) (_ BitVec 64) V!12805 (_ BitVec 32) Int) Unit!11422)

(assert (=> b!371517 (= lt!170315 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!13 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170319 () array!21493)

(declare-fun getCurrentListMapNoExtraKeys!689 (array!21493 array!21491 (_ BitVec 32) (_ BitVec 32) V!12805 V!12805 (_ BitVec 32) Int) ListLongMap!4793)

(assert (=> b!371517 (= lt!170316 (getCurrentListMapNoExtraKeys!689 lt!170319 (array!21492 (store (arr!10214 _values!506) i!548 (ValueCellFull!4044 v!373)) (size!10566 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371517 (= lt!170317 (getCurrentListMapNoExtraKeys!689 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371518 () Bool)

(declare-fun res!208853 () Bool)

(assert (=> b!371518 (=> (not res!208853) (not e!226754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21493 (_ BitVec 32)) Bool)

(assert (=> b!371518 (= res!208853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371519 () Bool)

(declare-fun res!208851 () Bool)

(assert (=> b!371519 (=> (not res!208851) (not e!226754))))

(assert (=> b!371519 (= res!208851 (or (= (select (arr!10215 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10215 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371520 () Bool)

(declare-fun res!208852 () Bool)

(assert (=> b!371520 (=> (not res!208852) (not e!226754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371520 (= res!208852 (validKeyInArray!0 k0!778))))

(declare-fun b!371521 () Bool)

(declare-fun e!226752 () Bool)

(assert (=> b!371521 (= e!226752 tp_is_empty!8775)))

(declare-fun b!371522 () Bool)

(declare-fun e!226753 () Bool)

(declare-fun mapRes!14727 () Bool)

(assert (=> b!371522 (= e!226756 (and e!226753 mapRes!14727))))

(declare-fun condMapEmpty!14727 () Bool)

(declare-fun mapDefault!14727 () ValueCell!4044)

(assert (=> b!371522 (= condMapEmpty!14727 (= (arr!10214 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4044)) mapDefault!14727)))))

(declare-fun mapIsEmpty!14727 () Bool)

(assert (=> mapIsEmpty!14727 mapRes!14727))

(declare-fun b!371523 () Bool)

(declare-fun res!208857 () Bool)

(assert (=> b!371523 (=> (not res!208857) (not e!226754))))

(assert (=> b!371523 (= res!208857 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10567 _keys!658))))))

(declare-fun b!371524 () Bool)

(declare-fun res!208855 () Bool)

(assert (=> b!371524 (=> (not res!208855) (not e!226754))))

(declare-datatypes ((List!5721 0))(
  ( (Nil!5718) (Cons!5717 (h!6573 (_ BitVec 64)) (t!10871 List!5721)) )
))
(declare-fun arrayNoDuplicates!0 (array!21493 (_ BitVec 32) List!5721) Bool)

(assert (=> b!371524 (= res!208855 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5718))))

(declare-fun b!371525 () Bool)

(assert (=> b!371525 (= e!226753 tp_is_empty!8775)))

(declare-fun b!371526 () Bool)

(assert (=> b!371526 (= e!226754 e!226755)))

(declare-fun res!208858 () Bool)

(assert (=> b!371526 (=> (not res!208858) (not e!226755))))

(assert (=> b!371526 (= res!208858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170319 mask!970))))

(assert (=> b!371526 (= lt!170319 (array!21494 (store (arr!10215 _keys!658) i!548 k0!778) (size!10567 _keys!658)))))

(declare-fun b!371527 () Bool)

(declare-fun res!208859 () Bool)

(assert (=> b!371527 (=> (not res!208859) (not e!226755))))

(assert (=> b!371527 (= res!208859 (arrayNoDuplicates!0 lt!170319 #b00000000000000000000000000000000 Nil!5718))))

(declare-fun mapNonEmpty!14727 () Bool)

(declare-fun tp!29097 () Bool)

(assert (=> mapNonEmpty!14727 (= mapRes!14727 (and tp!29097 e!226752))))

(declare-fun mapValue!14727 () ValueCell!4044)

(declare-fun mapRest!14727 () (Array (_ BitVec 32) ValueCell!4044))

(declare-fun mapKey!14727 () (_ BitVec 32))

(assert (=> mapNonEmpty!14727 (= (arr!10214 _values!506) (store mapRest!14727 mapKey!14727 mapValue!14727))))

(declare-fun b!371528 () Bool)

(declare-fun res!208856 () Bool)

(assert (=> b!371528 (=> (not res!208856) (not e!226754))))

(declare-fun arrayContainsKey!0 (array!21493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371528 (= res!208856 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37000 res!208850) b!371516))

(assert (= (and b!371516 res!208854) b!371518))

(assert (= (and b!371518 res!208853) b!371524))

(assert (= (and b!371524 res!208855) b!371523))

(assert (= (and b!371523 res!208857) b!371520))

(assert (= (and b!371520 res!208852) b!371519))

(assert (= (and b!371519 res!208851) b!371528))

(assert (= (and b!371528 res!208856) b!371526))

(assert (= (and b!371526 res!208858) b!371527))

(assert (= (and b!371527 res!208859) b!371517))

(assert (= (and b!371522 condMapEmpty!14727) mapIsEmpty!14727))

(assert (= (and b!371522 (not condMapEmpty!14727)) mapNonEmpty!14727))

(get-info :version)

(assert (= (and mapNonEmpty!14727 ((_ is ValueCellFull!4044) mapValue!14727)) b!371521))

(assert (= (and b!371522 ((_ is ValueCellFull!4044) mapDefault!14727)) b!371525))

(assert (= start!37000 b!371522))

(declare-fun m!367477 () Bool)

(assert (=> b!371524 m!367477))

(declare-fun m!367479 () Bool)

(assert (=> b!371528 m!367479))

(declare-fun m!367481 () Bool)

(assert (=> b!371517 m!367481))

(declare-fun m!367483 () Bool)

(assert (=> b!371517 m!367483))

(declare-fun m!367485 () Bool)

(assert (=> b!371517 m!367485))

(declare-fun m!367487 () Bool)

(assert (=> b!371517 m!367487))

(declare-fun m!367489 () Bool)

(assert (=> b!371517 m!367489))

(declare-fun m!367491 () Bool)

(assert (=> b!371519 m!367491))

(declare-fun m!367493 () Bool)

(assert (=> b!371526 m!367493))

(declare-fun m!367495 () Bool)

(assert (=> b!371526 m!367495))

(declare-fun m!367497 () Bool)

(assert (=> mapNonEmpty!14727 m!367497))

(declare-fun m!367499 () Bool)

(assert (=> b!371520 m!367499))

(declare-fun m!367501 () Bool)

(assert (=> b!371518 m!367501))

(declare-fun m!367503 () Bool)

(assert (=> b!371527 m!367503))

(declare-fun m!367505 () Bool)

(assert (=> start!37000 m!367505))

(declare-fun m!367507 () Bool)

(assert (=> start!37000 m!367507))

(declare-fun m!367509 () Bool)

(assert (=> start!37000 m!367509))

(check-sat tp_is_empty!8775 (not b!371527) (not start!37000) (not b_next!8127) (not mapNonEmpty!14727) (not b!371526) (not b!371517) (not b!371528) (not b!371518) (not b!371520) (not b!371524) b_and!15369)
(check-sat b_and!15369 (not b_next!8127))
