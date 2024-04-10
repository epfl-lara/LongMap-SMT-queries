; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39186 () Bool)

(assert start!39186)

(declare-fun b_free!9453 () Bool)

(declare-fun b_next!9453 () Bool)

(assert (=> start!39186 (= b_free!9453 (not b_next!9453))))

(declare-fun tp!33888 () Bool)

(declare-fun b_and!16839 () Bool)

(assert (=> start!39186 (= tp!33888 b_and!16839)))

(declare-fun b!412797 () Bool)

(declare-fun e!246952 () Bool)

(declare-fun e!246954 () Bool)

(declare-fun mapRes!17529 () Bool)

(assert (=> b!412797 (= e!246952 (and e!246954 mapRes!17529))))

(declare-fun condMapEmpty!17529 () Bool)

(declare-datatypes ((V!15245 0))(
  ( (V!15246 (val!5347 Int)) )
))
(declare-datatypes ((ValueCell!4959 0))(
  ( (ValueCellFull!4959 (v!7594 V!15245)) (EmptyCell!4959) )
))
(declare-datatypes ((array!25069 0))(
  ( (array!25070 (arr!11984 (Array (_ BitVec 32) ValueCell!4959)) (size!12336 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25069)

(declare-fun mapDefault!17529 () ValueCell!4959)

(assert (=> b!412797 (= condMapEmpty!17529 (= (arr!11984 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4959)) mapDefault!17529)))))

(declare-fun b!412798 () Bool)

(declare-fun e!246949 () Bool)

(assert (=> b!412798 (= e!246949 false)))

(declare-datatypes ((array!25071 0))(
  ( (array!25072 (arr!11985 (Array (_ BitVec 32) (_ BitVec 64))) (size!12337 (_ BitVec 32))) )
))
(declare-fun lt!189553 () array!25071)

(declare-fun minValue!515 () V!15245)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15245)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15245)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!6940 0))(
  ( (tuple2!6941 (_1!3481 (_ BitVec 64)) (_2!3481 V!15245)) )
))
(declare-datatypes ((List!6967 0))(
  ( (Nil!6964) (Cons!6963 (h!7819 tuple2!6940) (t!12141 List!6967)) )
))
(declare-datatypes ((ListLongMap!5853 0))(
  ( (ListLongMap!5854 (toList!2942 List!6967)) )
))
(declare-fun lt!189554 () ListLongMap!5853)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1150 (array!25071 array!25069 (_ BitVec 32) (_ BitVec 32) V!15245 V!15245 (_ BitVec 32) Int) ListLongMap!5853)

(assert (=> b!412798 (= lt!189554 (getCurrentListMapNoExtraKeys!1150 lt!189553 (array!25070 (store (arr!11984 _values!549) i!563 (ValueCellFull!4959 v!412)) (size!12336 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!25071)

(declare-fun lt!189552 () ListLongMap!5853)

(assert (=> b!412798 (= lt!189552 (getCurrentListMapNoExtraKeys!1150 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412799 () Bool)

(declare-fun res!239780 () Bool)

(declare-fun e!246953 () Bool)

(assert (=> b!412799 (=> (not res!239780) (not e!246953))))

(assert (=> b!412799 (= res!239780 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12337 _keys!709))))))

(declare-fun b!412800 () Bool)

(assert (=> b!412800 (= e!246953 e!246949)))

(declare-fun res!239776 () Bool)

(assert (=> b!412800 (=> (not res!239776) (not e!246949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25071 (_ BitVec 32)) Bool)

(assert (=> b!412800 (= res!239776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189553 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!412800 (= lt!189553 (array!25072 (store (arr!11985 _keys!709) i!563 k0!794) (size!12337 _keys!709)))))

(declare-fun b!412801 () Bool)

(declare-fun res!239781 () Bool)

(assert (=> b!412801 (=> (not res!239781) (not e!246953))))

(assert (=> b!412801 (= res!239781 (or (= (select (arr!11985 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11985 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17529 () Bool)

(assert (=> mapIsEmpty!17529 mapRes!17529))

(declare-fun b!412802 () Bool)

(declare-fun res!239785 () Bool)

(assert (=> b!412802 (=> (not res!239785) (not e!246953))))

(assert (=> b!412802 (= res!239785 (and (= (size!12336 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12337 _keys!709) (size!12336 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412804 () Bool)

(declare-fun res!239779 () Bool)

(assert (=> b!412804 (=> (not res!239779) (not e!246953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412804 (= res!239779 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17529 () Bool)

(declare-fun tp!33887 () Bool)

(declare-fun e!246951 () Bool)

(assert (=> mapNonEmpty!17529 (= mapRes!17529 (and tp!33887 e!246951))))

(declare-fun mapValue!17529 () ValueCell!4959)

(declare-fun mapKey!17529 () (_ BitVec 32))

(declare-fun mapRest!17529 () (Array (_ BitVec 32) ValueCell!4959))

(assert (=> mapNonEmpty!17529 (= (arr!11984 _values!549) (store mapRest!17529 mapKey!17529 mapValue!17529))))

(declare-fun b!412805 () Bool)

(declare-fun res!239777 () Bool)

(assert (=> b!412805 (=> (not res!239777) (not e!246953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412805 (= res!239777 (validMask!0 mask!1025))))

(declare-fun b!412806 () Bool)

(declare-fun tp_is_empty!10605 () Bool)

(assert (=> b!412806 (= e!246954 tp_is_empty!10605)))

(declare-fun b!412807 () Bool)

(declare-fun res!239782 () Bool)

(assert (=> b!412807 (=> (not res!239782) (not e!246953))))

(declare-fun arrayContainsKey!0 (array!25071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412807 (= res!239782 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!239787 () Bool)

(assert (=> start!39186 (=> (not res!239787) (not e!246953))))

(assert (=> start!39186 (= res!239787 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12337 _keys!709))))))

(assert (=> start!39186 e!246953))

(assert (=> start!39186 tp_is_empty!10605))

(assert (=> start!39186 tp!33888))

(assert (=> start!39186 true))

(declare-fun array_inv!8738 (array!25069) Bool)

(assert (=> start!39186 (and (array_inv!8738 _values!549) e!246952)))

(declare-fun array_inv!8739 (array!25071) Bool)

(assert (=> start!39186 (array_inv!8739 _keys!709)))

(declare-fun b!412803 () Bool)

(declare-fun res!239786 () Bool)

(assert (=> b!412803 (=> (not res!239786) (not e!246953))))

(assert (=> b!412803 (= res!239786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412808 () Bool)

(declare-fun res!239784 () Bool)

(assert (=> b!412808 (=> (not res!239784) (not e!246949))))

(assert (=> b!412808 (= res!239784 (bvsle from!863 i!563))))

(declare-fun b!412809 () Bool)

(declare-fun res!239778 () Bool)

(assert (=> b!412809 (=> (not res!239778) (not e!246953))))

(declare-datatypes ((List!6968 0))(
  ( (Nil!6965) (Cons!6964 (h!7820 (_ BitVec 64)) (t!12142 List!6968)) )
))
(declare-fun arrayNoDuplicates!0 (array!25071 (_ BitVec 32) List!6968) Bool)

(assert (=> b!412809 (= res!239778 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6965))))

(declare-fun b!412810 () Bool)

(assert (=> b!412810 (= e!246951 tp_is_empty!10605)))

(declare-fun b!412811 () Bool)

(declare-fun res!239783 () Bool)

(assert (=> b!412811 (=> (not res!239783) (not e!246949))))

(assert (=> b!412811 (= res!239783 (arrayNoDuplicates!0 lt!189553 #b00000000000000000000000000000000 Nil!6965))))

(assert (= (and start!39186 res!239787) b!412805))

(assert (= (and b!412805 res!239777) b!412802))

(assert (= (and b!412802 res!239785) b!412803))

(assert (= (and b!412803 res!239786) b!412809))

(assert (= (and b!412809 res!239778) b!412799))

(assert (= (and b!412799 res!239780) b!412804))

(assert (= (and b!412804 res!239779) b!412801))

(assert (= (and b!412801 res!239781) b!412807))

(assert (= (and b!412807 res!239782) b!412800))

(assert (= (and b!412800 res!239776) b!412811))

(assert (= (and b!412811 res!239783) b!412808))

(assert (= (and b!412808 res!239784) b!412798))

(assert (= (and b!412797 condMapEmpty!17529) mapIsEmpty!17529))

(assert (= (and b!412797 (not condMapEmpty!17529)) mapNonEmpty!17529))

(get-info :version)

(assert (= (and mapNonEmpty!17529 ((_ is ValueCellFull!4959) mapValue!17529)) b!412810))

(assert (= (and b!412797 ((_ is ValueCellFull!4959) mapDefault!17529)) b!412806))

(assert (= start!39186 b!412797))

(declare-fun m!402493 () Bool)

(assert (=> b!412804 m!402493))

(declare-fun m!402495 () Bool)

(assert (=> b!412807 m!402495))

(declare-fun m!402497 () Bool)

(assert (=> b!412811 m!402497))

(declare-fun m!402499 () Bool)

(assert (=> b!412798 m!402499))

(declare-fun m!402501 () Bool)

(assert (=> b!412798 m!402501))

(declare-fun m!402503 () Bool)

(assert (=> b!412798 m!402503))

(declare-fun m!402505 () Bool)

(assert (=> b!412801 m!402505))

(declare-fun m!402507 () Bool)

(assert (=> b!412809 m!402507))

(declare-fun m!402509 () Bool)

(assert (=> b!412800 m!402509))

(declare-fun m!402511 () Bool)

(assert (=> b!412800 m!402511))

(declare-fun m!402513 () Bool)

(assert (=> start!39186 m!402513))

(declare-fun m!402515 () Bool)

(assert (=> start!39186 m!402515))

(declare-fun m!402517 () Bool)

(assert (=> mapNonEmpty!17529 m!402517))

(declare-fun m!402519 () Bool)

(assert (=> b!412803 m!402519))

(declare-fun m!402521 () Bool)

(assert (=> b!412805 m!402521))

(check-sat (not mapNonEmpty!17529) (not b!412803) (not b!412809) (not b!412798) (not b!412805) tp_is_empty!10605 (not b!412807) (not b_next!9453) b_and!16839 (not b!412811) (not b!412800) (not b!412804) (not start!39186))
(check-sat b_and!16839 (not b_next!9453))
