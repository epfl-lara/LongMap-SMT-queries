; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36984 () Bool)

(assert start!36984)

(declare-fun b_free!8125 () Bool)

(declare-fun b_next!8125 () Bool)

(assert (=> start!36984 (= b_free!8125 (not b_next!8125))))

(declare-fun tp!29091 () Bool)

(declare-fun b_and!15341 () Bool)

(assert (=> start!36984 (= tp!29091 b_and!15341)))

(declare-fun b!371206 () Bool)

(declare-fun res!208695 () Bool)

(declare-fun e!226565 () Bool)

(assert (=> b!371206 (=> (not res!208695) (not e!226565))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21471 0))(
  ( (array!21472 (arr!10204 (Array (_ BitVec 32) (_ BitVec 64))) (size!10557 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21471)

(assert (=> b!371206 (= res!208695 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10557 _keys!658))))))

(declare-fun b!371207 () Bool)

(declare-fun e!226562 () Bool)

(declare-fun tp_is_empty!8773 () Bool)

(assert (=> b!371207 (= e!226562 tp_is_empty!8773)))

(declare-fun b!371208 () Bool)

(declare-fun res!208696 () Bool)

(assert (=> b!371208 (=> (not res!208696) (not e!226565))))

(declare-datatypes ((V!12803 0))(
  ( (V!12804 (val!4431 Int)) )
))
(declare-datatypes ((ValueCell!4043 0))(
  ( (ValueCellFull!4043 (v!6622 V!12803)) (EmptyCell!4043) )
))
(declare-datatypes ((array!21473 0))(
  ( (array!21474 (arr!10205 (Array (_ BitVec 32) ValueCell!4043)) (size!10558 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21473)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371208 (= res!208696 (and (= (size!10558 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10557 _keys!658) (size!10558 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371209 () Bool)

(declare-fun e!226563 () Bool)

(declare-fun e!226564 () Bool)

(declare-fun mapRes!14724 () Bool)

(assert (=> b!371209 (= e!226563 (and e!226564 mapRes!14724))))

(declare-fun condMapEmpty!14724 () Bool)

(declare-fun mapDefault!14724 () ValueCell!4043)

(assert (=> b!371209 (= condMapEmpty!14724 (= (arr!10205 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4043)) mapDefault!14724)))))

(declare-fun mapNonEmpty!14724 () Bool)

(declare-fun tp!29090 () Bool)

(assert (=> mapNonEmpty!14724 (= mapRes!14724 (and tp!29090 e!226562))))

(declare-fun mapValue!14724 () ValueCell!4043)

(declare-fun mapKey!14724 () (_ BitVec 32))

(declare-fun mapRest!14724 () (Array (_ BitVec 32) ValueCell!4043))

(assert (=> mapNonEmpty!14724 (= (arr!10205 _values!506) (store mapRest!14724 mapKey!14724 mapValue!14724))))

(declare-fun b!371210 () Bool)

(declare-fun e!226561 () Bool)

(assert (=> b!371210 (= e!226561 (not true))))

(declare-datatypes ((tuple2!5850 0))(
  ( (tuple2!5851 (_1!2936 (_ BitVec 64)) (_2!2936 V!12803)) )
))
(declare-datatypes ((List!5686 0))(
  ( (Nil!5683) (Cons!5682 (h!6538 tuple2!5850) (t!10827 List!5686)) )
))
(declare-datatypes ((ListLongMap!4753 0))(
  ( (ListLongMap!4754 (toList!2392 List!5686)) )
))
(declare-fun lt!170066 () ListLongMap!4753)

(declare-fun lt!170068 () ListLongMap!4753)

(assert (=> b!371210 (and (= lt!170066 lt!170068) (= lt!170068 lt!170066))))

(declare-fun v!373 () V!12803)

(declare-fun lt!170067 () ListLongMap!4753)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!760 (ListLongMap!4753 tuple2!5850) ListLongMap!4753)

(assert (=> b!371210 (= lt!170068 (+!760 lt!170067 (tuple2!5851 k0!778 v!373)))))

(declare-datatypes ((Unit!11396 0))(
  ( (Unit!11397) )
))
(declare-fun lt!170069 () Unit!11396)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12803)

(declare-fun minValue!472 () V!12803)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!11 (array!21471 array!21473 (_ BitVec 32) (_ BitVec 32) V!12803 V!12803 (_ BitVec 32) (_ BitVec 64) V!12803 (_ BitVec 32) Int) Unit!11396)

(assert (=> b!371210 (= lt!170069 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!11 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170070 () array!21471)

(declare-fun getCurrentListMapNoExtraKeys!683 (array!21471 array!21473 (_ BitVec 32) (_ BitVec 32) V!12803 V!12803 (_ BitVec 32) Int) ListLongMap!4753)

(assert (=> b!371210 (= lt!170066 (getCurrentListMapNoExtraKeys!683 lt!170070 (array!21474 (store (arr!10205 _values!506) i!548 (ValueCellFull!4043 v!373)) (size!10558 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371210 (= lt!170067 (getCurrentListMapNoExtraKeys!683 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371212 () Bool)

(declare-fun res!208698 () Bool)

(assert (=> b!371212 (=> (not res!208698) (not e!226565))))

(assert (=> b!371212 (= res!208698 (or (= (select (arr!10204 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10204 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14724 () Bool)

(assert (=> mapIsEmpty!14724 mapRes!14724))

(declare-fun b!371213 () Bool)

(declare-fun res!208699 () Bool)

(assert (=> b!371213 (=> (not res!208699) (not e!226565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371213 (= res!208699 (validKeyInArray!0 k0!778))))

(declare-fun b!371214 () Bool)

(assert (=> b!371214 (= e!226564 tp_is_empty!8773)))

(declare-fun res!208691 () Bool)

(assert (=> start!36984 (=> (not res!208691) (not e!226565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36984 (= res!208691 (validMask!0 mask!970))))

(assert (=> start!36984 e!226565))

(declare-fun array_inv!7544 (array!21473) Bool)

(assert (=> start!36984 (and (array_inv!7544 _values!506) e!226563)))

(assert (=> start!36984 tp!29091))

(assert (=> start!36984 true))

(assert (=> start!36984 tp_is_empty!8773))

(declare-fun array_inv!7545 (array!21471) Bool)

(assert (=> start!36984 (array_inv!7545 _keys!658)))

(declare-fun b!371211 () Bool)

(declare-fun res!208693 () Bool)

(assert (=> b!371211 (=> (not res!208693) (not e!226565))))

(declare-datatypes ((List!5687 0))(
  ( (Nil!5684) (Cons!5683 (h!6539 (_ BitVec 64)) (t!10828 List!5687)) )
))
(declare-fun arrayNoDuplicates!0 (array!21471 (_ BitVec 32) List!5687) Bool)

(assert (=> b!371211 (= res!208693 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5684))))

(declare-fun b!371215 () Bool)

(declare-fun res!208694 () Bool)

(assert (=> b!371215 (=> (not res!208694) (not e!226565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21471 (_ BitVec 32)) Bool)

(assert (=> b!371215 (= res!208694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371216 () Bool)

(declare-fun res!208697 () Bool)

(assert (=> b!371216 (=> (not res!208697) (not e!226565))))

(declare-fun arrayContainsKey!0 (array!21471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371216 (= res!208697 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371217 () Bool)

(assert (=> b!371217 (= e!226565 e!226561)))

(declare-fun res!208700 () Bool)

(assert (=> b!371217 (=> (not res!208700) (not e!226561))))

(assert (=> b!371217 (= res!208700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170070 mask!970))))

(assert (=> b!371217 (= lt!170070 (array!21472 (store (arr!10204 _keys!658) i!548 k0!778) (size!10557 _keys!658)))))

(declare-fun b!371218 () Bool)

(declare-fun res!208692 () Bool)

(assert (=> b!371218 (=> (not res!208692) (not e!226561))))

(assert (=> b!371218 (= res!208692 (arrayNoDuplicates!0 lt!170070 #b00000000000000000000000000000000 Nil!5684))))

(assert (= (and start!36984 res!208691) b!371208))

(assert (= (and b!371208 res!208696) b!371215))

(assert (= (and b!371215 res!208694) b!371211))

(assert (= (and b!371211 res!208693) b!371206))

(assert (= (and b!371206 res!208695) b!371213))

(assert (= (and b!371213 res!208699) b!371212))

(assert (= (and b!371212 res!208698) b!371216))

(assert (= (and b!371216 res!208697) b!371217))

(assert (= (and b!371217 res!208700) b!371218))

(assert (= (and b!371218 res!208692) b!371210))

(assert (= (and b!371209 condMapEmpty!14724) mapIsEmpty!14724))

(assert (= (and b!371209 (not condMapEmpty!14724)) mapNonEmpty!14724))

(get-info :version)

(assert (= (and mapNonEmpty!14724 ((_ is ValueCellFull!4043) mapValue!14724)) b!371207))

(assert (= (and b!371209 ((_ is ValueCellFull!4043) mapDefault!14724)) b!371214))

(assert (= start!36984 b!371209))

(declare-fun m!366719 () Bool)

(assert (=> mapNonEmpty!14724 m!366719))

(declare-fun m!366721 () Bool)

(assert (=> b!371212 m!366721))

(declare-fun m!366723 () Bool)

(assert (=> b!371213 m!366723))

(declare-fun m!366725 () Bool)

(assert (=> b!371217 m!366725))

(declare-fun m!366727 () Bool)

(assert (=> b!371217 m!366727))

(declare-fun m!366729 () Bool)

(assert (=> b!371215 m!366729))

(declare-fun m!366731 () Bool)

(assert (=> b!371211 m!366731))

(declare-fun m!366733 () Bool)

(assert (=> start!36984 m!366733))

(declare-fun m!366735 () Bool)

(assert (=> start!36984 m!366735))

(declare-fun m!366737 () Bool)

(assert (=> start!36984 m!366737))

(declare-fun m!366739 () Bool)

(assert (=> b!371218 m!366739))

(declare-fun m!366741 () Bool)

(assert (=> b!371216 m!366741))

(declare-fun m!366743 () Bool)

(assert (=> b!371210 m!366743))

(declare-fun m!366745 () Bool)

(assert (=> b!371210 m!366745))

(declare-fun m!366747 () Bool)

(assert (=> b!371210 m!366747))

(declare-fun m!366749 () Bool)

(assert (=> b!371210 m!366749))

(declare-fun m!366751 () Bool)

(assert (=> b!371210 m!366751))

(check-sat b_and!15341 (not start!36984) (not b!371216) (not mapNonEmpty!14724) (not b!371210) (not b_next!8125) tp_is_empty!8773 (not b!371215) (not b!371218) (not b!371211) (not b!371213) (not b!371217))
(check-sat b_and!15341 (not b_next!8125))
