; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37716 () Bool)

(assert start!37716)

(declare-fun b_free!8833 () Bool)

(declare-fun b_next!8833 () Bool)

(assert (=> start!37716 (= b_free!8833 (not b_next!8833))))

(declare-fun tp!31250 () Bool)

(declare-fun b_and!16049 () Bool)

(assert (=> start!37716 (= tp!31250 b_and!16049)))

(declare-fun b!386677 () Bool)

(declare-fun e!234492 () Bool)

(declare-fun tp_is_empty!9505 () Bool)

(assert (=> b!386677 (= e!234492 tp_is_empty!9505)))

(declare-fun b!386678 () Bool)

(declare-fun e!234490 () Bool)

(assert (=> b!386678 (= e!234490 tp_is_empty!9505)))

(declare-fun b!386679 () Bool)

(declare-fun res!220869 () Bool)

(declare-fun e!234493 () Bool)

(assert (=> b!386679 (=> (not res!220869) (not e!234493))))

(declare-datatypes ((array!22893 0))(
  ( (array!22894 (arr!10915 (Array (_ BitVec 32) (_ BitVec 64))) (size!11268 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22893)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386679 (= res!220869 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!220870 () Bool)

(assert (=> start!37716 (=> (not res!220870) (not e!234493))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37716 (= res!220870 (validMask!0 mask!970))))

(assert (=> start!37716 e!234493))

(declare-datatypes ((V!13779 0))(
  ( (V!13780 (val!4797 Int)) )
))
(declare-datatypes ((ValueCell!4409 0))(
  ( (ValueCellFull!4409 (v!6988 V!13779)) (EmptyCell!4409) )
))
(declare-datatypes ((array!22895 0))(
  ( (array!22896 (arr!10916 (Array (_ BitVec 32) ValueCell!4409)) (size!11269 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22895)

(declare-fun e!234489 () Bool)

(declare-fun array_inv!8034 (array!22895) Bool)

(assert (=> start!37716 (and (array_inv!8034 _values!506) e!234489)))

(assert (=> start!37716 tp!31250))

(assert (=> start!37716 true))

(assert (=> start!37716 tp_is_empty!9505))

(declare-fun array_inv!8035 (array!22893) Bool)

(assert (=> start!37716 (array_inv!8035 _keys!658)))

(declare-fun b!386680 () Bool)

(declare-fun res!220877 () Bool)

(assert (=> b!386680 (=> (not res!220877) (not e!234493))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386680 (= res!220877 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11268 _keys!658))))))

(declare-fun b!386681 () Bool)

(declare-fun res!220874 () Bool)

(assert (=> b!386681 (=> (not res!220874) (not e!234493))))

(declare-datatypes ((List!6268 0))(
  ( (Nil!6265) (Cons!6264 (h!7120 (_ BitVec 64)) (t!11409 List!6268)) )
))
(declare-fun arrayNoDuplicates!0 (array!22893 (_ BitVec 32) List!6268) Bool)

(assert (=> b!386681 (= res!220874 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6265))))

(declare-fun b!386682 () Bool)

(declare-fun res!220876 () Bool)

(assert (=> b!386682 (=> (not res!220876) (not e!234493))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!386682 (= res!220876 (and (= (size!11269 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11268 _keys!658) (size!11269 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386683 () Bool)

(declare-fun mapRes!15822 () Bool)

(assert (=> b!386683 (= e!234489 (and e!234490 mapRes!15822))))

(declare-fun condMapEmpty!15822 () Bool)

(declare-fun mapDefault!15822 () ValueCell!4409)

(assert (=> b!386683 (= condMapEmpty!15822 (= (arr!10916 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4409)) mapDefault!15822)))))

(declare-fun b!386684 () Bool)

(declare-fun res!220868 () Bool)

(assert (=> b!386684 (=> (not res!220868) (not e!234493))))

(assert (=> b!386684 (= res!220868 (or (= (select (arr!10915 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10915 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386685 () Bool)

(declare-fun res!220875 () Bool)

(assert (=> b!386685 (=> (not res!220875) (not e!234493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22893 (_ BitVec 32)) Bool)

(assert (=> b!386685 (= res!220875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386686 () Bool)

(declare-fun res!220871 () Bool)

(declare-fun e!234494 () Bool)

(assert (=> b!386686 (=> (not res!220871) (not e!234494))))

(declare-fun lt!181692 () array!22893)

(assert (=> b!386686 (= res!220871 (arrayNoDuplicates!0 lt!181692 #b00000000000000000000000000000000 Nil!6265))))

(declare-fun b!386687 () Bool)

(assert (=> b!386687 (= e!234493 e!234494)))

(declare-fun res!220872 () Bool)

(assert (=> b!386687 (=> (not res!220872) (not e!234494))))

(assert (=> b!386687 (= res!220872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181692 mask!970))))

(assert (=> b!386687 (= lt!181692 (array!22894 (store (arr!10915 _keys!658) i!548 k0!778) (size!11268 _keys!658)))))

(declare-fun mapNonEmpty!15822 () Bool)

(declare-fun tp!31251 () Bool)

(assert (=> mapNonEmpty!15822 (= mapRes!15822 (and tp!31251 e!234492))))

(declare-fun mapRest!15822 () (Array (_ BitVec 32) ValueCell!4409))

(declare-fun mapKey!15822 () (_ BitVec 32))

(declare-fun mapValue!15822 () ValueCell!4409)

(assert (=> mapNonEmpty!15822 (= (arr!10916 _values!506) (store mapRest!15822 mapKey!15822 mapValue!15822))))

(declare-fun b!386688 () Bool)

(declare-fun res!220873 () Bool)

(assert (=> b!386688 (=> (not res!220873) (not e!234493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386688 (= res!220873 (validKeyInArray!0 k0!778))))

(declare-fun b!386689 () Bool)

(assert (=> b!386689 (= e!234494 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6434 0))(
  ( (tuple2!6435 (_1!3228 (_ BitVec 64)) (_2!3228 V!13779)) )
))
(declare-datatypes ((List!6269 0))(
  ( (Nil!6266) (Cons!6265 (h!7121 tuple2!6434) (t!11410 List!6269)) )
))
(declare-datatypes ((ListLongMap!5337 0))(
  ( (ListLongMap!5338 (toList!2684 List!6269)) )
))
(declare-fun lt!181691 () ListLongMap!5337)

(declare-fun zeroValue!472 () V!13779)

(declare-fun v!373 () V!13779)

(declare-fun minValue!472 () V!13779)

(declare-fun getCurrentListMapNoExtraKeys!924 (array!22893 array!22895 (_ BitVec 32) (_ BitVec 32) V!13779 V!13779 (_ BitVec 32) Int) ListLongMap!5337)

(assert (=> b!386689 (= lt!181691 (getCurrentListMapNoExtraKeys!924 lt!181692 (array!22896 (store (arr!10916 _values!506) i!548 (ValueCellFull!4409 v!373)) (size!11269 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181690 () ListLongMap!5337)

(assert (=> b!386689 (= lt!181690 (getCurrentListMapNoExtraKeys!924 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15822 () Bool)

(assert (=> mapIsEmpty!15822 mapRes!15822))

(assert (= (and start!37716 res!220870) b!386682))

(assert (= (and b!386682 res!220876) b!386685))

(assert (= (and b!386685 res!220875) b!386681))

(assert (= (and b!386681 res!220874) b!386680))

(assert (= (and b!386680 res!220877) b!386688))

(assert (= (and b!386688 res!220873) b!386684))

(assert (= (and b!386684 res!220868) b!386679))

(assert (= (and b!386679 res!220869) b!386687))

(assert (= (and b!386687 res!220872) b!386686))

(assert (= (and b!386686 res!220871) b!386689))

(assert (= (and b!386683 condMapEmpty!15822) mapIsEmpty!15822))

(assert (= (and b!386683 (not condMapEmpty!15822)) mapNonEmpty!15822))

(get-info :version)

(assert (= (and mapNonEmpty!15822 ((_ is ValueCellFull!4409) mapValue!15822)) b!386677))

(assert (= (and b!386683 ((_ is ValueCellFull!4409) mapDefault!15822)) b!386678))

(assert (= start!37716 b!386683))

(declare-fun m!382451 () Bool)

(assert (=> b!386685 m!382451))

(declare-fun m!382453 () Bool)

(assert (=> b!386689 m!382453))

(declare-fun m!382455 () Bool)

(assert (=> b!386689 m!382455))

(declare-fun m!382457 () Bool)

(assert (=> b!386689 m!382457))

(declare-fun m!382459 () Bool)

(assert (=> mapNonEmpty!15822 m!382459))

(declare-fun m!382461 () Bool)

(assert (=> b!386688 m!382461))

(declare-fun m!382463 () Bool)

(assert (=> b!386686 m!382463))

(declare-fun m!382465 () Bool)

(assert (=> b!386684 m!382465))

(declare-fun m!382467 () Bool)

(assert (=> b!386687 m!382467))

(declare-fun m!382469 () Bool)

(assert (=> b!386687 m!382469))

(declare-fun m!382471 () Bool)

(assert (=> start!37716 m!382471))

(declare-fun m!382473 () Bool)

(assert (=> start!37716 m!382473))

(declare-fun m!382475 () Bool)

(assert (=> start!37716 m!382475))

(declare-fun m!382477 () Bool)

(assert (=> b!386681 m!382477))

(declare-fun m!382479 () Bool)

(assert (=> b!386679 m!382479))

(check-sat (not b!386688) b_and!16049 (not b!386689) (not b!386681) (not mapNonEmpty!15822) (not b!386679) (not b!386686) (not b_next!8833) (not b!386685) tp_is_empty!9505 (not b!386687) (not start!37716))
(check-sat b_and!16049 (not b_next!8833))
