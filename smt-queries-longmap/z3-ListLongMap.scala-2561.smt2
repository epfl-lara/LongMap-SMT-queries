; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39170 () Bool)

(assert start!39170)

(declare-fun b_free!9451 () Bool)

(declare-fun b_next!9451 () Bool)

(assert (=> start!39170 (= b_free!9451 (not b_next!9451))))

(declare-fun tp!33882 () Bool)

(declare-fun b_and!16851 () Bool)

(assert (=> start!39170 (= tp!33882 b_and!16851)))

(declare-fun b!412703 () Bool)

(declare-fun e!246902 () Bool)

(declare-fun tp_is_empty!10603 () Bool)

(assert (=> b!412703 (= e!246902 tp_is_empty!10603)))

(declare-fun b!412704 () Bool)

(declare-fun e!246899 () Bool)

(declare-fun e!246900 () Bool)

(assert (=> b!412704 (= e!246899 e!246900)))

(declare-fun res!239740 () Bool)

(assert (=> b!412704 (=> (not res!239740) (not e!246900))))

(declare-datatypes ((array!25068 0))(
  ( (array!25069 (arr!11983 (Array (_ BitVec 32) (_ BitVec 64))) (size!12335 (_ BitVec 32))) )
))
(declare-fun lt!189563 () array!25068)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25068 (_ BitVec 32)) Bool)

(assert (=> b!412704 (= res!239740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189563 mask!1025))))

(declare-fun _keys!709 () array!25068)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412704 (= lt!189563 (array!25069 (store (arr!11983 _keys!709) i!563 k0!794) (size!12335 _keys!709)))))

(declare-fun b!412705 () Bool)

(declare-fun res!239741 () Bool)

(assert (=> b!412705 (=> (not res!239741) (not e!246899))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15243 0))(
  ( (V!15244 (val!5346 Int)) )
))
(declare-datatypes ((ValueCell!4958 0))(
  ( (ValueCellFull!4958 (v!7594 V!15243)) (EmptyCell!4958) )
))
(declare-datatypes ((array!25070 0))(
  ( (array!25071 (arr!11984 (Array (_ BitVec 32) ValueCell!4958)) (size!12336 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25070)

(assert (=> b!412705 (= res!239741 (and (= (size!12336 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12335 _keys!709) (size!12336 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412706 () Bool)

(declare-fun res!239744 () Bool)

(assert (=> b!412706 (=> (not res!239744) (not e!246900))))

(declare-datatypes ((List!6832 0))(
  ( (Nil!6829) (Cons!6828 (h!7684 (_ BitVec 64)) (t!11998 List!6832)) )
))
(declare-fun arrayNoDuplicates!0 (array!25068 (_ BitVec 32) List!6832) Bool)

(assert (=> b!412706 (= res!239744 (arrayNoDuplicates!0 lt!189563 #b00000000000000000000000000000000 Nil!6829))))

(declare-fun b!412707 () Bool)

(declare-fun res!239747 () Bool)

(assert (=> b!412707 (=> (not res!239747) (not e!246899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412707 (= res!239747 (validMask!0 mask!1025))))

(declare-fun res!239745 () Bool)

(assert (=> start!39170 (=> (not res!239745) (not e!246899))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39170 (= res!239745 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12335 _keys!709))))))

(assert (=> start!39170 e!246899))

(assert (=> start!39170 tp_is_empty!10603))

(assert (=> start!39170 tp!33882))

(assert (=> start!39170 true))

(declare-fun e!246904 () Bool)

(declare-fun array_inv!8816 (array!25070) Bool)

(assert (=> start!39170 (and (array_inv!8816 _values!549) e!246904)))

(declare-fun array_inv!8817 (array!25068) Bool)

(assert (=> start!39170 (array_inv!8817 _keys!709)))

(declare-fun b!412708 () Bool)

(declare-fun res!239737 () Bool)

(assert (=> b!412708 (=> (not res!239737) (not e!246900))))

(assert (=> b!412708 (= res!239737 (bvsle from!863 i!563))))

(declare-fun b!412709 () Bool)

(declare-fun res!239748 () Bool)

(assert (=> b!412709 (=> (not res!239748) (not e!246899))))

(declare-fun arrayContainsKey!0 (array!25068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412709 (= res!239748 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412710 () Bool)

(declare-fun res!239746 () Bool)

(assert (=> b!412710 (=> (not res!239746) (not e!246899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412710 (= res!239746 (validKeyInArray!0 k0!794))))

(declare-fun b!412711 () Bool)

(declare-fun e!246903 () Bool)

(assert (=> b!412711 (= e!246903 tp_is_empty!10603)))

(declare-fun b!412712 () Bool)

(declare-fun res!239738 () Bool)

(assert (=> b!412712 (=> (not res!239738) (not e!246899))))

(assert (=> b!412712 (= res!239738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17526 () Bool)

(declare-fun mapRes!17526 () Bool)

(assert (=> mapIsEmpty!17526 mapRes!17526))

(declare-fun b!412713 () Bool)

(assert (=> b!412713 (= e!246900 false)))

(declare-fun minValue!515 () V!15243)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6812 0))(
  ( (tuple2!6813 (_1!3417 (_ BitVec 64)) (_2!3417 V!15243)) )
))
(declare-datatypes ((List!6833 0))(
  ( (Nil!6830) (Cons!6829 (h!7685 tuple2!6812) (t!11999 List!6833)) )
))
(declare-datatypes ((ListLongMap!5727 0))(
  ( (ListLongMap!5728 (toList!2879 List!6833)) )
))
(declare-fun lt!189564 () ListLongMap!5727)

(declare-fun zeroValue!515 () V!15243)

(declare-fun v!412 () V!15243)

(declare-fun getCurrentListMapNoExtraKeys!1131 (array!25068 array!25070 (_ BitVec 32) (_ BitVec 32) V!15243 V!15243 (_ BitVec 32) Int) ListLongMap!5727)

(assert (=> b!412713 (= lt!189564 (getCurrentListMapNoExtraKeys!1131 lt!189563 (array!25071 (store (arr!11984 _values!549) i!563 (ValueCellFull!4958 v!412)) (size!12336 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189562 () ListLongMap!5727)

(assert (=> b!412713 (= lt!189562 (getCurrentListMapNoExtraKeys!1131 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412714 () Bool)

(declare-fun res!239739 () Bool)

(assert (=> b!412714 (=> (not res!239739) (not e!246899))))

(assert (=> b!412714 (= res!239739 (or (= (select (arr!11983 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11983 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412715 () Bool)

(declare-fun res!239743 () Bool)

(assert (=> b!412715 (=> (not res!239743) (not e!246899))))

(assert (=> b!412715 (= res!239743 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6829))))

(declare-fun b!412716 () Bool)

(declare-fun res!239742 () Bool)

(assert (=> b!412716 (=> (not res!239742) (not e!246899))))

(assert (=> b!412716 (= res!239742 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12335 _keys!709))))))

(declare-fun b!412717 () Bool)

(assert (=> b!412717 (= e!246904 (and e!246903 mapRes!17526))))

(declare-fun condMapEmpty!17526 () Bool)

(declare-fun mapDefault!17526 () ValueCell!4958)

(assert (=> b!412717 (= condMapEmpty!17526 (= (arr!11984 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4958)) mapDefault!17526)))))

(declare-fun mapNonEmpty!17526 () Bool)

(declare-fun tp!33881 () Bool)

(assert (=> mapNonEmpty!17526 (= mapRes!17526 (and tp!33881 e!246902))))

(declare-fun mapKey!17526 () (_ BitVec 32))

(declare-fun mapValue!17526 () ValueCell!4958)

(declare-fun mapRest!17526 () (Array (_ BitVec 32) ValueCell!4958))

(assert (=> mapNonEmpty!17526 (= (arr!11984 _values!549) (store mapRest!17526 mapKey!17526 mapValue!17526))))

(assert (= (and start!39170 res!239745) b!412707))

(assert (= (and b!412707 res!239747) b!412705))

(assert (= (and b!412705 res!239741) b!412712))

(assert (= (and b!412712 res!239738) b!412715))

(assert (= (and b!412715 res!239743) b!412716))

(assert (= (and b!412716 res!239742) b!412710))

(assert (= (and b!412710 res!239746) b!412714))

(assert (= (and b!412714 res!239739) b!412709))

(assert (= (and b!412709 res!239748) b!412704))

(assert (= (and b!412704 res!239740) b!412706))

(assert (= (and b!412706 res!239744) b!412708))

(assert (= (and b!412708 res!239737) b!412713))

(assert (= (and b!412717 condMapEmpty!17526) mapIsEmpty!17526))

(assert (= (and b!412717 (not condMapEmpty!17526)) mapNonEmpty!17526))

(get-info :version)

(assert (= (and mapNonEmpty!17526 ((_ is ValueCellFull!4958) mapValue!17526)) b!412703))

(assert (= (and b!412717 ((_ is ValueCellFull!4958) mapDefault!17526)) b!412711))

(assert (= start!39170 b!412717))

(declare-fun m!402693 () Bool)

(assert (=> b!412714 m!402693))

(declare-fun m!402695 () Bool)

(assert (=> b!412706 m!402695))

(declare-fun m!402697 () Bool)

(assert (=> b!412704 m!402697))

(declare-fun m!402699 () Bool)

(assert (=> b!412704 m!402699))

(declare-fun m!402701 () Bool)

(assert (=> mapNonEmpty!17526 m!402701))

(declare-fun m!402703 () Bool)

(assert (=> start!39170 m!402703))

(declare-fun m!402705 () Bool)

(assert (=> start!39170 m!402705))

(declare-fun m!402707 () Bool)

(assert (=> b!412710 m!402707))

(declare-fun m!402709 () Bool)

(assert (=> b!412715 m!402709))

(declare-fun m!402711 () Bool)

(assert (=> b!412709 m!402711))

(declare-fun m!402713 () Bool)

(assert (=> b!412707 m!402713))

(declare-fun m!402715 () Bool)

(assert (=> b!412713 m!402715))

(declare-fun m!402717 () Bool)

(assert (=> b!412713 m!402717))

(declare-fun m!402719 () Bool)

(assert (=> b!412713 m!402719))

(declare-fun m!402721 () Bool)

(assert (=> b!412712 m!402721))

(check-sat (not mapNonEmpty!17526) (not b_next!9451) (not b!412707) (not b!412712) (not b!412710) (not b!412709) (not b!412715) (not start!39170) b_and!16851 (not b!412706) (not b!412704) tp_is_empty!10603 (not b!412713))
(check-sat b_and!16851 (not b_next!9451))
