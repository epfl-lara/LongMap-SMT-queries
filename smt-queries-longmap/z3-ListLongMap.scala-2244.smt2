; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36928 () Bool)

(assert start!36928)

(declare-fun b_free!8055 () Bool)

(declare-fun b_next!8055 () Bool)

(assert (=> start!36928 (= b_free!8055 (not b_next!8055))))

(declare-fun tp!28880 () Bool)

(declare-fun b_and!15297 () Bool)

(assert (=> start!36928 (= tp!28880 b_and!15297)))

(declare-fun b!370112 () Bool)

(declare-fun e!226105 () Bool)

(declare-fun e!226108 () Bool)

(assert (=> b!370112 (= e!226105 e!226108)))

(declare-fun res!207773 () Bool)

(assert (=> b!370112 (=> (not res!207773) (not e!226108))))

(declare-datatypes ((array!21349 0))(
  ( (array!21350 (arr!10143 (Array (_ BitVec 32) (_ BitVec 64))) (size!10495 (_ BitVec 32))) )
))
(declare-fun lt!169892 () array!21349)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21349 (_ BitVec 32)) Bool)

(assert (=> b!370112 (= res!207773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169892 mask!970))))

(declare-fun _keys!658 () array!21349)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!370112 (= lt!169892 (array!21350 (store (arr!10143 _keys!658) i!548 k0!778) (size!10495 _keys!658)))))

(declare-fun b!370113 () Bool)

(declare-fun e!226104 () Bool)

(declare-fun tp_is_empty!8703 () Bool)

(assert (=> b!370113 (= e!226104 tp_is_empty!8703)))

(declare-fun b!370114 () Bool)

(declare-fun res!207774 () Bool)

(assert (=> b!370114 (=> (not res!207774) (not e!226105))))

(assert (=> b!370114 (= res!207774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370115 () Bool)

(declare-fun res!207775 () Bool)

(assert (=> b!370115 (=> (not res!207775) (not e!226105))))

(declare-fun arrayContainsKey!0 (array!21349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370115 (= res!207775 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!207779 () Bool)

(assert (=> start!36928 (=> (not res!207779) (not e!226105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36928 (= res!207779 (validMask!0 mask!970))))

(assert (=> start!36928 e!226105))

(declare-datatypes ((V!12709 0))(
  ( (V!12710 (val!4396 Int)) )
))
(declare-datatypes ((ValueCell!4008 0))(
  ( (ValueCellFull!4008 (v!6593 V!12709)) (EmptyCell!4008) )
))
(declare-datatypes ((array!21351 0))(
  ( (array!21352 (arr!10144 (Array (_ BitVec 32) ValueCell!4008)) (size!10496 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21351)

(declare-fun e!226106 () Bool)

(declare-fun array_inv!7494 (array!21351) Bool)

(assert (=> start!36928 (and (array_inv!7494 _values!506) e!226106)))

(assert (=> start!36928 tp!28880))

(assert (=> start!36928 true))

(assert (=> start!36928 tp_is_empty!8703))

(declare-fun array_inv!7495 (array!21349) Bool)

(assert (=> start!36928 (array_inv!7495 _keys!658)))

(declare-fun b!370116 () Bool)

(declare-fun res!207772 () Bool)

(assert (=> b!370116 (=> (not res!207772) (not e!226105))))

(assert (=> b!370116 (= res!207772 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10495 _keys!658))))))

(declare-fun b!370117 () Bool)

(declare-fun e!226109 () Bool)

(assert (=> b!370117 (= e!226109 tp_is_empty!8703)))

(declare-fun mapIsEmpty!14619 () Bool)

(declare-fun mapRes!14619 () Bool)

(assert (=> mapIsEmpty!14619 mapRes!14619))

(declare-fun b!370118 () Bool)

(declare-fun res!207770 () Bool)

(assert (=> b!370118 (=> (not res!207770) (not e!226105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370118 (= res!207770 (validKeyInArray!0 k0!778))))

(declare-fun b!370119 () Bool)

(assert (=> b!370119 (= e!226106 (and e!226109 mapRes!14619))))

(declare-fun condMapEmpty!14619 () Bool)

(declare-fun mapDefault!14619 () ValueCell!4008)

(assert (=> b!370119 (= condMapEmpty!14619 (= (arr!10144 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4008)) mapDefault!14619)))))

(declare-fun b!370120 () Bool)

(declare-fun res!207777 () Bool)

(assert (=> b!370120 (=> (not res!207777) (not e!226105))))

(assert (=> b!370120 (= res!207777 (or (= (select (arr!10143 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10143 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370121 () Bool)

(declare-fun res!207776 () Bool)

(assert (=> b!370121 (=> (not res!207776) (not e!226105))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!370121 (= res!207776 (and (= (size!10496 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10495 _keys!658) (size!10496 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370122 () Bool)

(declare-fun res!207778 () Bool)

(assert (=> b!370122 (=> (not res!207778) (not e!226105))))

(declare-datatypes ((List!5667 0))(
  ( (Nil!5664) (Cons!5663 (h!6519 (_ BitVec 64)) (t!10817 List!5667)) )
))
(declare-fun arrayNoDuplicates!0 (array!21349 (_ BitVec 32) List!5667) Bool)

(assert (=> b!370122 (= res!207778 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5664))))

(declare-fun b!370123 () Bool)

(assert (=> b!370123 (= e!226108 false)))

(declare-datatypes ((tuple2!5830 0))(
  ( (tuple2!5831 (_1!2926 (_ BitVec 64)) (_2!2926 V!12709)) )
))
(declare-datatypes ((List!5668 0))(
  ( (Nil!5665) (Cons!5664 (h!6520 tuple2!5830) (t!10818 List!5668)) )
))
(declare-datatypes ((ListLongMap!4743 0))(
  ( (ListLongMap!4744 (toList!2387 List!5668)) )
))
(declare-fun lt!169891 () ListLongMap!4743)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12709)

(declare-fun v!373 () V!12709)

(declare-fun minValue!472 () V!12709)

(declare-fun getCurrentListMapNoExtraKeys!664 (array!21349 array!21351 (_ BitVec 32) (_ BitVec 32) V!12709 V!12709 (_ BitVec 32) Int) ListLongMap!4743)

(assert (=> b!370123 (= lt!169891 (getCurrentListMapNoExtraKeys!664 lt!169892 (array!21352 (store (arr!10144 _values!506) i!548 (ValueCellFull!4008 v!373)) (size!10496 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169893 () ListLongMap!4743)

(assert (=> b!370123 (= lt!169893 (getCurrentListMapNoExtraKeys!664 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370124 () Bool)

(declare-fun res!207771 () Bool)

(assert (=> b!370124 (=> (not res!207771) (not e!226108))))

(assert (=> b!370124 (= res!207771 (arrayNoDuplicates!0 lt!169892 #b00000000000000000000000000000000 Nil!5664))))

(declare-fun mapNonEmpty!14619 () Bool)

(declare-fun tp!28881 () Bool)

(assert (=> mapNonEmpty!14619 (= mapRes!14619 (and tp!28881 e!226104))))

(declare-fun mapValue!14619 () ValueCell!4008)

(declare-fun mapKey!14619 () (_ BitVec 32))

(declare-fun mapRest!14619 () (Array (_ BitVec 32) ValueCell!4008))

(assert (=> mapNonEmpty!14619 (= (arr!10144 _values!506) (store mapRest!14619 mapKey!14619 mapValue!14619))))

(assert (= (and start!36928 res!207779) b!370121))

(assert (= (and b!370121 res!207776) b!370114))

(assert (= (and b!370114 res!207774) b!370122))

(assert (= (and b!370122 res!207778) b!370116))

(assert (= (and b!370116 res!207772) b!370118))

(assert (= (and b!370118 res!207770) b!370120))

(assert (= (and b!370120 res!207777) b!370115))

(assert (= (and b!370115 res!207775) b!370112))

(assert (= (and b!370112 res!207773) b!370124))

(assert (= (and b!370124 res!207771) b!370123))

(assert (= (and b!370119 condMapEmpty!14619) mapIsEmpty!14619))

(assert (= (and b!370119 (not condMapEmpty!14619)) mapNonEmpty!14619))

(get-info :version)

(assert (= (and mapNonEmpty!14619 ((_ is ValueCellFull!4008) mapValue!14619)) b!370113))

(assert (= (and b!370119 ((_ is ValueCellFull!4008) mapDefault!14619)) b!370117))

(assert (= start!36928 b!370119))

(declare-fun m!366333 () Bool)

(assert (=> b!370112 m!366333))

(declare-fun m!366335 () Bool)

(assert (=> b!370112 m!366335))

(declare-fun m!366337 () Bool)

(assert (=> mapNonEmpty!14619 m!366337))

(declare-fun m!366339 () Bool)

(assert (=> b!370123 m!366339))

(declare-fun m!366341 () Bool)

(assert (=> b!370123 m!366341))

(declare-fun m!366343 () Bool)

(assert (=> b!370123 m!366343))

(declare-fun m!366345 () Bool)

(assert (=> b!370120 m!366345))

(declare-fun m!366347 () Bool)

(assert (=> b!370115 m!366347))

(declare-fun m!366349 () Bool)

(assert (=> b!370118 m!366349))

(declare-fun m!366351 () Bool)

(assert (=> start!36928 m!366351))

(declare-fun m!366353 () Bool)

(assert (=> start!36928 m!366353))

(declare-fun m!366355 () Bool)

(assert (=> start!36928 m!366355))

(declare-fun m!366357 () Bool)

(assert (=> b!370124 m!366357))

(declare-fun m!366359 () Bool)

(assert (=> b!370122 m!366359))

(declare-fun m!366361 () Bool)

(assert (=> b!370114 m!366361))

(check-sat (not b!370122) (not b!370112) (not start!36928) (not b_next!8055) (not b!370124) (not b!370118) (not mapNonEmpty!14619) b_and!15297 (not b!370114) tp_is_empty!8703 (not b!370115) (not b!370123))
(check-sat b_and!15297 (not b_next!8055))
