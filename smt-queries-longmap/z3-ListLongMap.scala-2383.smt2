; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37762 () Bool)

(assert start!37762)

(declare-fun b_free!8865 () Bool)

(declare-fun b_next!8865 () Bool)

(assert (=> start!37762 (= b_free!8865 (not b_next!8865))))

(declare-fun tp!31347 () Bool)

(declare-fun b_and!16107 () Bool)

(assert (=> start!37762 (= tp!31347 b_and!16107)))

(declare-fun res!221477 () Bool)

(declare-fun e!234956 () Bool)

(assert (=> start!37762 (=> (not res!221477) (not e!234956))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37762 (= res!221477 (validMask!0 mask!970))))

(assert (=> start!37762 e!234956))

(declare-datatypes ((V!13821 0))(
  ( (V!13822 (val!4813 Int)) )
))
(declare-datatypes ((ValueCell!4425 0))(
  ( (ValueCellFull!4425 (v!7010 V!13821)) (EmptyCell!4425) )
))
(declare-datatypes ((array!22965 0))(
  ( (array!22966 (arr!10951 (Array (_ BitVec 32) ValueCell!4425)) (size!11303 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22965)

(declare-fun e!234953 () Bool)

(declare-fun array_inv!8056 (array!22965) Bool)

(assert (=> start!37762 (and (array_inv!8056 _values!506) e!234953)))

(assert (=> start!37762 tp!31347))

(assert (=> start!37762 true))

(declare-fun tp_is_empty!9537 () Bool)

(assert (=> start!37762 tp_is_empty!9537))

(declare-datatypes ((array!22967 0))(
  ( (array!22968 (arr!10952 (Array (_ BitVec 32) (_ BitVec 64))) (size!11304 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22967)

(declare-fun array_inv!8057 (array!22967) Bool)

(assert (=> start!37762 (array_inv!8057 _keys!658)))

(declare-fun b!387572 () Bool)

(declare-fun e!234955 () Bool)

(assert (=> b!387572 (= e!234956 e!234955)))

(declare-fun res!221486 () Bool)

(assert (=> b!387572 (=> (not res!221486) (not e!234955))))

(declare-fun lt!182068 () array!22967)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22967 (_ BitVec 32)) Bool)

(assert (=> b!387572 (= res!221486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182068 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!387572 (= lt!182068 (array!22968 (store (arr!10952 _keys!658) i!548 k0!778) (size!11304 _keys!658)))))

(declare-fun b!387573 () Bool)

(declare-fun e!234952 () Bool)

(assert (=> b!387573 (= e!234952 tp_is_empty!9537)))

(declare-fun b!387574 () Bool)

(declare-fun res!221482 () Bool)

(assert (=> b!387574 (=> (not res!221482) (not e!234956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387574 (= res!221482 (validKeyInArray!0 k0!778))))

(declare-fun b!387575 () Bool)

(declare-fun res!221480 () Bool)

(assert (=> b!387575 (=> (not res!221480) (not e!234956))))

(declare-datatypes ((List!6321 0))(
  ( (Nil!6318) (Cons!6317 (h!7173 (_ BitVec 64)) (t!11471 List!6321)) )
))
(declare-fun arrayNoDuplicates!0 (array!22967 (_ BitVec 32) List!6321) Bool)

(assert (=> b!387575 (= res!221480 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6318))))

(declare-fun mapNonEmpty!15870 () Bool)

(declare-fun mapRes!15870 () Bool)

(declare-fun tp!31346 () Bool)

(assert (=> mapNonEmpty!15870 (= mapRes!15870 (and tp!31346 e!234952))))

(declare-fun mapRest!15870 () (Array (_ BitVec 32) ValueCell!4425))

(declare-fun mapKey!15870 () (_ BitVec 32))

(declare-fun mapValue!15870 () ValueCell!4425)

(assert (=> mapNonEmpty!15870 (= (arr!10951 _values!506) (store mapRest!15870 mapKey!15870 mapValue!15870))))

(declare-fun b!387576 () Bool)

(declare-fun res!221481 () Bool)

(assert (=> b!387576 (=> (not res!221481) (not e!234956))))

(assert (=> b!387576 (= res!221481 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11304 _keys!658))))))

(declare-fun b!387577 () Bool)

(declare-fun res!221478 () Bool)

(assert (=> b!387577 (=> (not res!221478) (not e!234956))))

(assert (=> b!387577 (= res!221478 (or (= (select (arr!10952 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10952 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387578 () Bool)

(declare-fun res!221479 () Bool)

(assert (=> b!387578 (=> (not res!221479) (not e!234956))))

(assert (=> b!387578 (= res!221479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15870 () Bool)

(assert (=> mapIsEmpty!15870 mapRes!15870))

(declare-fun b!387579 () Bool)

(declare-fun res!221485 () Bool)

(assert (=> b!387579 (=> (not res!221485) (not e!234955))))

(assert (=> b!387579 (= res!221485 (arrayNoDuplicates!0 lt!182068 #b00000000000000000000000000000000 Nil!6318))))

(declare-fun b!387580 () Bool)

(declare-fun e!234951 () Bool)

(assert (=> b!387580 (= e!234951 tp_is_empty!9537)))

(declare-fun b!387581 () Bool)

(assert (=> b!387581 (= e!234953 (and e!234951 mapRes!15870))))

(declare-fun condMapEmpty!15870 () Bool)

(declare-fun mapDefault!15870 () ValueCell!4425)

(assert (=> b!387581 (= condMapEmpty!15870 (= (arr!10951 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4425)) mapDefault!15870)))))

(declare-fun b!387582 () Bool)

(assert (=> b!387582 (= e!234955 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13821)

(declare-datatypes ((tuple2!6470 0))(
  ( (tuple2!6471 (_1!3246 (_ BitVec 64)) (_2!3246 V!13821)) )
))
(declare-datatypes ((List!6322 0))(
  ( (Nil!6319) (Cons!6318 (h!7174 tuple2!6470) (t!11472 List!6322)) )
))
(declare-datatypes ((ListLongMap!5383 0))(
  ( (ListLongMap!5384 (toList!2707 List!6322)) )
))
(declare-fun lt!182069 () ListLongMap!5383)

(declare-fun zeroValue!472 () V!13821)

(declare-fun minValue!472 () V!13821)

(declare-fun getCurrentListMapNoExtraKeys!936 (array!22967 array!22965 (_ BitVec 32) (_ BitVec 32) V!13821 V!13821 (_ BitVec 32) Int) ListLongMap!5383)

(assert (=> b!387582 (= lt!182069 (getCurrentListMapNoExtraKeys!936 lt!182068 (array!22966 (store (arr!10951 _values!506) i!548 (ValueCellFull!4425 v!373)) (size!11303 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182070 () ListLongMap!5383)

(assert (=> b!387582 (= lt!182070 (getCurrentListMapNoExtraKeys!936 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387583 () Bool)

(declare-fun res!221483 () Bool)

(assert (=> b!387583 (=> (not res!221483) (not e!234956))))

(declare-fun arrayContainsKey!0 (array!22967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387583 (= res!221483 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387584 () Bool)

(declare-fun res!221484 () Bool)

(assert (=> b!387584 (=> (not res!221484) (not e!234956))))

(assert (=> b!387584 (= res!221484 (and (= (size!11303 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11304 _keys!658) (size!11303 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37762 res!221477) b!387584))

(assert (= (and b!387584 res!221484) b!387578))

(assert (= (and b!387578 res!221479) b!387575))

(assert (= (and b!387575 res!221480) b!387576))

(assert (= (and b!387576 res!221481) b!387574))

(assert (= (and b!387574 res!221482) b!387577))

(assert (= (and b!387577 res!221478) b!387583))

(assert (= (and b!387583 res!221483) b!387572))

(assert (= (and b!387572 res!221486) b!387579))

(assert (= (and b!387579 res!221485) b!387582))

(assert (= (and b!387581 condMapEmpty!15870) mapIsEmpty!15870))

(assert (= (and b!387581 (not condMapEmpty!15870)) mapNonEmpty!15870))

(get-info :version)

(assert (= (and mapNonEmpty!15870 ((_ is ValueCellFull!4425) mapValue!15870)) b!387573))

(assert (= (and b!387581 ((_ is ValueCellFull!4425) mapDefault!15870)) b!387580))

(assert (= start!37762 b!387581))

(declare-fun m!383655 () Bool)

(assert (=> b!387575 m!383655))

(declare-fun m!383657 () Bool)

(assert (=> b!387574 m!383657))

(declare-fun m!383659 () Bool)

(assert (=> b!387572 m!383659))

(declare-fun m!383661 () Bool)

(assert (=> b!387572 m!383661))

(declare-fun m!383663 () Bool)

(assert (=> b!387579 m!383663))

(declare-fun m!383665 () Bool)

(assert (=> b!387577 m!383665))

(declare-fun m!383667 () Bool)

(assert (=> mapNonEmpty!15870 m!383667))

(declare-fun m!383669 () Bool)

(assert (=> b!387578 m!383669))

(declare-fun m!383671 () Bool)

(assert (=> start!37762 m!383671))

(declare-fun m!383673 () Bool)

(assert (=> start!37762 m!383673))

(declare-fun m!383675 () Bool)

(assert (=> start!37762 m!383675))

(declare-fun m!383677 () Bool)

(assert (=> b!387583 m!383677))

(declare-fun m!383679 () Bool)

(assert (=> b!387582 m!383679))

(declare-fun m!383681 () Bool)

(assert (=> b!387582 m!383681))

(declare-fun m!383683 () Bool)

(assert (=> b!387582 m!383683))

(check-sat (not mapNonEmpty!15870) (not b!387579) tp_is_empty!9537 (not b!387574) (not start!37762) (not b_next!8865) (not b!387578) (not b!387583) b_and!16107 (not b!387582) (not b!387575) (not b!387572))
(check-sat b_and!16107 (not b_next!8865))
