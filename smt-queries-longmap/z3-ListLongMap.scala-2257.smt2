; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36990 () Bool)

(assert start!36990)

(declare-fun b_free!8131 () Bool)

(declare-fun b_next!8131 () Bool)

(assert (=> start!36990 (= b_free!8131 (not b_next!8131))))

(declare-fun tp!29109 () Bool)

(declare-fun b_and!15387 () Bool)

(assert (=> start!36990 (= tp!29109 b_and!15387)))

(declare-fun b!371545 () Bool)

(declare-fun res!208915 () Bool)

(declare-fun e!226758 () Bool)

(assert (=> b!371545 (=> (not res!208915) (not e!226758))))

(declare-datatypes ((array!21484 0))(
  ( (array!21485 (arr!10210 (Array (_ BitVec 32) (_ BitVec 64))) (size!10562 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21484)

(declare-datatypes ((List!5621 0))(
  ( (Nil!5618) (Cons!5617 (h!6473 (_ BitVec 64)) (t!10763 List!5621)) )
))
(declare-fun arrayNoDuplicates!0 (array!21484 (_ BitVec 32) List!5621) Bool)

(assert (=> b!371545 (= res!208915 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5618))))

(declare-fun b!371546 () Bool)

(declare-fun res!208910 () Bool)

(assert (=> b!371546 (=> (not res!208910) (not e!226758))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371546 (= res!208910 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10562 _keys!658))))))

(declare-fun b!371547 () Bool)

(declare-fun res!208913 () Bool)

(assert (=> b!371547 (=> (not res!208913) (not e!226758))))

(assert (=> b!371547 (= res!208913 (or (= (select (arr!10210 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10210 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371548 () Bool)

(declare-fun res!208911 () Bool)

(declare-fun e!226757 () Bool)

(assert (=> b!371548 (=> (not res!208911) (not e!226757))))

(declare-fun lt!170368 () array!21484)

(assert (=> b!371548 (= res!208911 (arrayNoDuplicates!0 lt!170368 #b00000000000000000000000000000000 Nil!5618))))

(declare-fun b!371549 () Bool)

(assert (=> b!371549 (= e!226758 e!226757)))

(declare-fun res!208914 () Bool)

(assert (=> b!371549 (=> (not res!208914) (not e!226757))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21484 (_ BitVec 32)) Bool)

(assert (=> b!371549 (= res!208914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170368 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!371549 (= lt!170368 (array!21485 (store (arr!10210 _keys!658) i!548 k0!778) (size!10562 _keys!658)))))

(declare-fun res!208912 () Bool)

(assert (=> start!36990 (=> (not res!208912) (not e!226758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36990 (= res!208912 (validMask!0 mask!970))))

(assert (=> start!36990 e!226758))

(declare-datatypes ((V!12811 0))(
  ( (V!12812 (val!4434 Int)) )
))
(declare-datatypes ((ValueCell!4046 0))(
  ( (ValueCellFull!4046 (v!6632 V!12811)) (EmptyCell!4046) )
))
(declare-datatypes ((array!21486 0))(
  ( (array!21487 (arr!10211 (Array (_ BitVec 32) ValueCell!4046)) (size!10563 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21486)

(declare-fun e!226760 () Bool)

(declare-fun array_inv!7570 (array!21486) Bool)

(assert (=> start!36990 (and (array_inv!7570 _values!506) e!226760)))

(assert (=> start!36990 tp!29109))

(assert (=> start!36990 true))

(declare-fun tp_is_empty!8779 () Bool)

(assert (=> start!36990 tp_is_empty!8779))

(declare-fun array_inv!7571 (array!21484) Bool)

(assert (=> start!36990 (array_inv!7571 _keys!658)))

(declare-fun b!371550 () Bool)

(declare-fun res!208916 () Bool)

(assert (=> b!371550 (=> (not res!208916) (not e!226758))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371550 (= res!208916 (and (= (size!10563 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10562 _keys!658) (size!10563 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14733 () Bool)

(declare-fun mapRes!14733 () Bool)

(assert (=> mapIsEmpty!14733 mapRes!14733))

(declare-fun b!371551 () Bool)

(declare-fun e!226756 () Bool)

(assert (=> b!371551 (= e!226756 tp_is_empty!8779)))

(declare-fun b!371552 () Bool)

(declare-fun e!226761 () Bool)

(assert (=> b!371552 (= e!226761 tp_is_empty!8779)))

(declare-fun mapNonEmpty!14733 () Bool)

(declare-fun tp!29108 () Bool)

(assert (=> mapNonEmpty!14733 (= mapRes!14733 (and tp!29108 e!226761))))

(declare-fun mapValue!14733 () ValueCell!4046)

(declare-fun mapRest!14733 () (Array (_ BitVec 32) ValueCell!4046))

(declare-fun mapKey!14733 () (_ BitVec 32))

(assert (=> mapNonEmpty!14733 (= (arr!10211 _values!506) (store mapRest!14733 mapKey!14733 mapValue!14733))))

(declare-fun b!371553 () Bool)

(declare-fun res!208909 () Bool)

(assert (=> b!371553 (=> (not res!208909) (not e!226758))))

(assert (=> b!371553 (= res!208909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371554 () Bool)

(assert (=> b!371554 (= e!226760 (and e!226756 mapRes!14733))))

(declare-fun condMapEmpty!14733 () Bool)

(declare-fun mapDefault!14733 () ValueCell!4046)

(assert (=> b!371554 (= condMapEmpty!14733 (= (arr!10211 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4046)) mapDefault!14733)))))

(declare-fun b!371555 () Bool)

(declare-fun res!208908 () Bool)

(assert (=> b!371555 (=> (not res!208908) (not e!226758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371555 (= res!208908 (validKeyInArray!0 k0!778))))

(declare-fun b!371556 () Bool)

(assert (=> b!371556 (= e!226757 (not true))))

(declare-datatypes ((tuple2!5782 0))(
  ( (tuple2!5783 (_1!2902 (_ BitVec 64)) (_2!2902 V!12811)) )
))
(declare-datatypes ((List!5622 0))(
  ( (Nil!5619) (Cons!5618 (h!6474 tuple2!5782) (t!10764 List!5622)) )
))
(declare-datatypes ((ListLongMap!4697 0))(
  ( (ListLongMap!4698 (toList!2364 List!5622)) )
))
(declare-fun lt!170365 () ListLongMap!4697)

(declare-fun lt!170367 () ListLongMap!4697)

(assert (=> b!371556 (and (= lt!170365 lt!170367) (= lt!170367 lt!170365))))

(declare-fun v!373 () V!12811)

(declare-fun lt!170364 () ListLongMap!4697)

(declare-fun +!760 (ListLongMap!4697 tuple2!5782) ListLongMap!4697)

(assert (=> b!371556 (= lt!170367 (+!760 lt!170364 (tuple2!5783 k0!778 v!373)))))

(declare-datatypes ((Unit!11411 0))(
  ( (Unit!11412) )
))
(declare-fun lt!170366 () Unit!11411)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12811)

(declare-fun minValue!472 () V!12811)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!13 (array!21484 array!21486 (_ BitVec 32) (_ BitVec 32) V!12811 V!12811 (_ BitVec 32) (_ BitVec 64) V!12811 (_ BitVec 32) Int) Unit!11411)

(assert (=> b!371556 (= lt!170366 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!13 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!673 (array!21484 array!21486 (_ BitVec 32) (_ BitVec 32) V!12811 V!12811 (_ BitVec 32) Int) ListLongMap!4697)

(assert (=> b!371556 (= lt!170365 (getCurrentListMapNoExtraKeys!673 lt!170368 (array!21487 (store (arr!10211 _values!506) i!548 (ValueCellFull!4046 v!373)) (size!10563 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371556 (= lt!170364 (getCurrentListMapNoExtraKeys!673 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371557 () Bool)

(declare-fun res!208907 () Bool)

(assert (=> b!371557 (=> (not res!208907) (not e!226758))))

(declare-fun arrayContainsKey!0 (array!21484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371557 (= res!208907 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36990 res!208912) b!371550))

(assert (= (and b!371550 res!208916) b!371553))

(assert (= (and b!371553 res!208909) b!371545))

(assert (= (and b!371545 res!208915) b!371546))

(assert (= (and b!371546 res!208910) b!371555))

(assert (= (and b!371555 res!208908) b!371547))

(assert (= (and b!371547 res!208913) b!371557))

(assert (= (and b!371557 res!208907) b!371549))

(assert (= (and b!371549 res!208914) b!371548))

(assert (= (and b!371548 res!208911) b!371556))

(assert (= (and b!371554 condMapEmpty!14733) mapIsEmpty!14733))

(assert (= (and b!371554 (not condMapEmpty!14733)) mapNonEmpty!14733))

(get-info :version)

(assert (= (and mapNonEmpty!14733 ((_ is ValueCellFull!4046) mapValue!14733)) b!371552))

(assert (= (and b!371554 ((_ is ValueCellFull!4046) mapDefault!14733)) b!371551))

(assert (= start!36990 b!371554))

(declare-fun m!367775 () Bool)

(assert (=> b!371553 m!367775))

(declare-fun m!367777 () Bool)

(assert (=> b!371555 m!367777))

(declare-fun m!367779 () Bool)

(assert (=> b!371557 m!367779))

(declare-fun m!367781 () Bool)

(assert (=> b!371548 m!367781))

(declare-fun m!367783 () Bool)

(assert (=> b!371547 m!367783))

(declare-fun m!367785 () Bool)

(assert (=> mapNonEmpty!14733 m!367785))

(declare-fun m!367787 () Bool)

(assert (=> b!371556 m!367787))

(declare-fun m!367789 () Bool)

(assert (=> b!371556 m!367789))

(declare-fun m!367791 () Bool)

(assert (=> b!371556 m!367791))

(declare-fun m!367793 () Bool)

(assert (=> b!371556 m!367793))

(declare-fun m!367795 () Bool)

(assert (=> b!371556 m!367795))

(declare-fun m!367797 () Bool)

(assert (=> start!36990 m!367797))

(declare-fun m!367799 () Bool)

(assert (=> start!36990 m!367799))

(declare-fun m!367801 () Bool)

(assert (=> start!36990 m!367801))

(declare-fun m!367803 () Bool)

(assert (=> b!371549 m!367803))

(declare-fun m!367805 () Bool)

(assert (=> b!371549 m!367805))

(declare-fun m!367807 () Bool)

(assert (=> b!371545 m!367807))

(check-sat (not start!36990) (not b!371545) (not b!371557) (not b!371556) (not b!371548) (not b!371549) b_and!15387 (not b!371555) (not b!371553) (not b_next!8131) (not mapNonEmpty!14733) tp_is_empty!8779)
(check-sat b_and!15387 (not b_next!8131))
