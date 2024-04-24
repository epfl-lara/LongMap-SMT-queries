; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37032 () Bool)

(assert start!37032)

(declare-fun b_free!8173 () Bool)

(declare-fun b_next!8173 () Bool)

(assert (=> start!37032 (= b_free!8173 (not b_next!8173))))

(declare-fun tp!29235 () Bool)

(declare-fun b_and!15429 () Bool)

(assert (=> start!37032 (= tp!29235 b_and!15429)))

(declare-fun b!372364 () Bool)

(declare-fun e!227136 () Bool)

(declare-fun tp_is_empty!8821 () Bool)

(assert (=> b!372364 (= e!227136 tp_is_empty!8821)))

(declare-fun mapIsEmpty!14796 () Bool)

(declare-fun mapRes!14796 () Bool)

(assert (=> mapIsEmpty!14796 mapRes!14796))

(declare-fun b!372365 () Bool)

(declare-fun e!227135 () Bool)

(assert (=> b!372365 (= e!227135 (and e!227136 mapRes!14796))))

(declare-fun condMapEmpty!14796 () Bool)

(declare-datatypes ((V!12867 0))(
  ( (V!12868 (val!4455 Int)) )
))
(declare-datatypes ((ValueCell!4067 0))(
  ( (ValueCellFull!4067 (v!6653 V!12867)) (EmptyCell!4067) )
))
(declare-datatypes ((array!21564 0))(
  ( (array!21565 (arr!10250 (Array (_ BitVec 32) ValueCell!4067)) (size!10602 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21564)

(declare-fun mapDefault!14796 () ValueCell!4067)

(assert (=> b!372365 (= condMapEmpty!14796 (= (arr!10250 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4067)) mapDefault!14796)))))

(declare-fun b!372366 () Bool)

(declare-fun res!209537 () Bool)

(declare-fun e!227138 () Bool)

(assert (=> b!372366 (=> (not res!209537) (not e!227138))))

(declare-datatypes ((array!21566 0))(
  ( (array!21567 (arr!10251 (Array (_ BitVec 32) (_ BitVec 64))) (size!10603 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21566)

(declare-datatypes ((List!5653 0))(
  ( (Nil!5650) (Cons!5649 (h!6505 (_ BitVec 64)) (t!10795 List!5653)) )
))
(declare-fun arrayNoDuplicates!0 (array!21566 (_ BitVec 32) List!5653) Bool)

(assert (=> b!372366 (= res!209537 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5650))))

(declare-fun b!372367 () Bool)

(declare-fun res!209546 () Bool)

(assert (=> b!372367 (=> (not res!209546) (not e!227138))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21566 (_ BitVec 32)) Bool)

(assert (=> b!372367 (= res!209546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14796 () Bool)

(declare-fun tp!29234 () Bool)

(declare-fun e!227137 () Bool)

(assert (=> mapNonEmpty!14796 (= mapRes!14796 (and tp!29234 e!227137))))

(declare-fun mapRest!14796 () (Array (_ BitVec 32) ValueCell!4067))

(declare-fun mapKey!14796 () (_ BitVec 32))

(declare-fun mapValue!14796 () ValueCell!4067)

(assert (=> mapNonEmpty!14796 (= (arr!10250 _values!506) (store mapRest!14796 mapKey!14796 mapValue!14796))))

(declare-fun b!372368 () Bool)

(declare-fun e!227139 () Bool)

(assert (=> b!372368 (= e!227139 (not true))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5810 0))(
  ( (tuple2!5811 (_1!2916 (_ BitVec 64)) (_2!2916 V!12867)) )
))
(declare-datatypes ((List!5654 0))(
  ( (Nil!5651) (Cons!5650 (h!6506 tuple2!5810) (t!10796 List!5654)) )
))
(declare-datatypes ((ListLongMap!4725 0))(
  ( (ListLongMap!4726 (toList!2378 List!5654)) )
))
(declare-fun lt!170756 () ListLongMap!4725)

(declare-fun lt!170760 () array!21566)

(declare-fun zeroValue!472 () V!12867)

(declare-fun lt!170757 () array!21564)

(declare-fun minValue!472 () V!12867)

(declare-fun getCurrentListMap!1840 (array!21566 array!21564 (_ BitVec 32) (_ BitVec 32) V!12867 V!12867 (_ BitVec 32) Int) ListLongMap!4725)

(assert (=> b!372368 (= lt!170756 (getCurrentListMap!1840 lt!170760 lt!170757 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170755 () ListLongMap!4725)

(declare-fun lt!170759 () ListLongMap!4725)

(assert (=> b!372368 (and (= lt!170755 lt!170759) (= lt!170759 lt!170755))))

(declare-fun v!373 () V!12867)

(declare-fun lt!170758 () ListLongMap!4725)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!774 (ListLongMap!4725 tuple2!5810) ListLongMap!4725)

(assert (=> b!372368 (= lt!170759 (+!774 lt!170758 (tuple2!5811 k0!778 v!373)))))

(declare-datatypes ((Unit!11439 0))(
  ( (Unit!11440) )
))
(declare-fun lt!170761 () Unit!11439)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!27 (array!21566 array!21564 (_ BitVec 32) (_ BitVec 32) V!12867 V!12867 (_ BitVec 32) (_ BitVec 64) V!12867 (_ BitVec 32) Int) Unit!11439)

(assert (=> b!372368 (= lt!170761 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!27 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!687 (array!21566 array!21564 (_ BitVec 32) (_ BitVec 32) V!12867 V!12867 (_ BitVec 32) Int) ListLongMap!4725)

(assert (=> b!372368 (= lt!170755 (getCurrentListMapNoExtraKeys!687 lt!170760 lt!170757 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372368 (= lt!170757 (array!21565 (store (arr!10250 _values!506) i!548 (ValueCellFull!4067 v!373)) (size!10602 _values!506)))))

(assert (=> b!372368 (= lt!170758 (getCurrentListMapNoExtraKeys!687 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372369 () Bool)

(assert (=> b!372369 (= e!227137 tp_is_empty!8821)))

(declare-fun b!372370 () Bool)

(declare-fun res!209544 () Bool)

(assert (=> b!372370 (=> (not res!209544) (not e!227138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372370 (= res!209544 (validKeyInArray!0 k0!778))))

(declare-fun b!372371 () Bool)

(declare-fun res!209543 () Bool)

(assert (=> b!372371 (=> (not res!209543) (not e!227138))))

(declare-fun arrayContainsKey!0 (array!21566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372371 (= res!209543 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!209542 () Bool)

(assert (=> start!37032 (=> (not res!209542) (not e!227138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37032 (= res!209542 (validMask!0 mask!970))))

(assert (=> start!37032 e!227138))

(declare-fun array_inv!7600 (array!21564) Bool)

(assert (=> start!37032 (and (array_inv!7600 _values!506) e!227135)))

(assert (=> start!37032 tp!29235))

(assert (=> start!37032 true))

(assert (=> start!37032 tp_is_empty!8821))

(declare-fun array_inv!7601 (array!21566) Bool)

(assert (=> start!37032 (array_inv!7601 _keys!658)))

(declare-fun b!372372 () Bool)

(declare-fun res!209540 () Bool)

(assert (=> b!372372 (=> (not res!209540) (not e!227138))))

(assert (=> b!372372 (= res!209540 (and (= (size!10602 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10603 _keys!658) (size!10602 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372373 () Bool)

(declare-fun res!209541 () Bool)

(assert (=> b!372373 (=> (not res!209541) (not e!227139))))

(assert (=> b!372373 (= res!209541 (arrayNoDuplicates!0 lt!170760 #b00000000000000000000000000000000 Nil!5650))))

(declare-fun b!372374 () Bool)

(declare-fun res!209538 () Bool)

(assert (=> b!372374 (=> (not res!209538) (not e!227138))))

(assert (=> b!372374 (= res!209538 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10603 _keys!658))))))

(declare-fun b!372375 () Bool)

(assert (=> b!372375 (= e!227138 e!227139)))

(declare-fun res!209545 () Bool)

(assert (=> b!372375 (=> (not res!209545) (not e!227139))))

(assert (=> b!372375 (= res!209545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170760 mask!970))))

(assert (=> b!372375 (= lt!170760 (array!21567 (store (arr!10251 _keys!658) i!548 k0!778) (size!10603 _keys!658)))))

(declare-fun b!372376 () Bool)

(declare-fun res!209539 () Bool)

(assert (=> b!372376 (=> (not res!209539) (not e!227138))))

(assert (=> b!372376 (= res!209539 (or (= (select (arr!10251 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10251 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37032 res!209542) b!372372))

(assert (= (and b!372372 res!209540) b!372367))

(assert (= (and b!372367 res!209546) b!372366))

(assert (= (and b!372366 res!209537) b!372374))

(assert (= (and b!372374 res!209538) b!372370))

(assert (= (and b!372370 res!209544) b!372376))

(assert (= (and b!372376 res!209539) b!372371))

(assert (= (and b!372371 res!209543) b!372375))

(assert (= (and b!372375 res!209545) b!372373))

(assert (= (and b!372373 res!209541) b!372368))

(assert (= (and b!372365 condMapEmpty!14796) mapIsEmpty!14796))

(assert (= (and b!372365 (not condMapEmpty!14796)) mapNonEmpty!14796))

(get-info :version)

(assert (= (and mapNonEmpty!14796 ((_ is ValueCellFull!4067) mapValue!14796)) b!372369))

(assert (= (and b!372365 ((_ is ValueCellFull!4067) mapDefault!14796)) b!372364))

(assert (= start!37032 b!372365))

(declare-fun m!368513 () Bool)

(assert (=> start!37032 m!368513))

(declare-fun m!368515 () Bool)

(assert (=> start!37032 m!368515))

(declare-fun m!368517 () Bool)

(assert (=> start!37032 m!368517))

(declare-fun m!368519 () Bool)

(assert (=> b!372371 m!368519))

(declare-fun m!368521 () Bool)

(assert (=> b!372375 m!368521))

(declare-fun m!368523 () Bool)

(assert (=> b!372375 m!368523))

(declare-fun m!368525 () Bool)

(assert (=> b!372370 m!368525))

(declare-fun m!368527 () Bool)

(assert (=> b!372367 m!368527))

(declare-fun m!368529 () Bool)

(assert (=> b!372373 m!368529))

(declare-fun m!368531 () Bool)

(assert (=> b!372368 m!368531))

(declare-fun m!368533 () Bool)

(assert (=> b!372368 m!368533))

(declare-fun m!368535 () Bool)

(assert (=> b!372368 m!368535))

(declare-fun m!368537 () Bool)

(assert (=> b!372368 m!368537))

(declare-fun m!368539 () Bool)

(assert (=> b!372368 m!368539))

(declare-fun m!368541 () Bool)

(assert (=> b!372368 m!368541))

(declare-fun m!368543 () Bool)

(assert (=> b!372376 m!368543))

(declare-fun m!368545 () Bool)

(assert (=> b!372366 m!368545))

(declare-fun m!368547 () Bool)

(assert (=> mapNonEmpty!14796 m!368547))

(check-sat (not b!372375) b_and!15429 (not b_next!8173) (not b!372373) (not start!37032) (not b!372367) tp_is_empty!8821 (not b!372366) (not mapNonEmpty!14796) (not b!372370) (not b!372371) (not b!372368))
(check-sat b_and!15429 (not b_next!8173))
