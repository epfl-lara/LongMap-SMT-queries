; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39132 () Bool)

(assert start!39132)

(declare-fun b_free!9399 () Bool)

(declare-fun b_next!9399 () Bool)

(assert (=> start!39132 (= b_free!9399 (not b_next!9399))))

(declare-fun tp!33726 () Bool)

(declare-fun b_and!16785 () Bool)

(assert (=> start!39132 (= tp!33726 b_and!16785)))

(declare-fun mapIsEmpty!17448 () Bool)

(declare-fun mapRes!17448 () Bool)

(assert (=> mapIsEmpty!17448 mapRes!17448))

(declare-fun b!411582 () Bool)

(declare-fun res!238810 () Bool)

(declare-fun e!246463 () Bool)

(assert (=> b!411582 (=> (not res!238810) (not e!246463))))

(declare-datatypes ((array!24963 0))(
  ( (array!24964 (arr!11931 (Array (_ BitVec 32) (_ BitVec 64))) (size!12283 (_ BitVec 32))) )
))
(declare-fun lt!189310 () array!24963)

(declare-datatypes ((List!6927 0))(
  ( (Nil!6924) (Cons!6923 (h!7779 (_ BitVec 64)) (t!12101 List!6927)) )
))
(declare-fun arrayNoDuplicates!0 (array!24963 (_ BitVec 32) List!6927) Bool)

(assert (=> b!411582 (= res!238810 (arrayNoDuplicates!0 lt!189310 #b00000000000000000000000000000000 Nil!6924))))

(declare-fun b!411583 () Bool)

(declare-fun res!238808 () Bool)

(declare-fun e!246466 () Bool)

(assert (=> b!411583 (=> (not res!238808) (not e!246466))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411583 (= res!238808 (validMask!0 mask!1025))))

(declare-fun b!411584 () Bool)

(declare-fun res!238809 () Bool)

(assert (=> b!411584 (=> (not res!238809) (not e!246466))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!24963)

(assert (=> b!411584 (= res!238809 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12283 _keys!709))))))

(declare-fun b!411585 () Bool)

(declare-fun e!246467 () Bool)

(declare-fun tp_is_empty!10551 () Bool)

(assert (=> b!411585 (= e!246467 tp_is_empty!10551)))

(declare-fun b!411586 () Bool)

(declare-fun e!246464 () Bool)

(assert (=> b!411586 (= e!246464 (and e!246467 mapRes!17448))))

(declare-fun condMapEmpty!17448 () Bool)

(declare-datatypes ((V!15173 0))(
  ( (V!15174 (val!5320 Int)) )
))
(declare-datatypes ((ValueCell!4932 0))(
  ( (ValueCellFull!4932 (v!7567 V!15173)) (EmptyCell!4932) )
))
(declare-datatypes ((array!24965 0))(
  ( (array!24966 (arr!11932 (Array (_ BitVec 32) ValueCell!4932)) (size!12284 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24965)

(declare-fun mapDefault!17448 () ValueCell!4932)

(assert (=> b!411586 (= condMapEmpty!17448 (= (arr!11932 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4932)) mapDefault!17448)))))

(declare-fun b!411587 () Bool)

(declare-fun res!238813 () Bool)

(assert (=> b!411587 (=> (not res!238813) (not e!246463))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!411587 (= res!238813 (bvsle from!863 i!563))))

(declare-fun b!411589 () Bool)

(declare-fun res!238815 () Bool)

(assert (=> b!411589 (=> (not res!238815) (not e!246466))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411589 (= res!238815 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17448 () Bool)

(declare-fun tp!33725 () Bool)

(declare-fun e!246468 () Bool)

(assert (=> mapNonEmpty!17448 (= mapRes!17448 (and tp!33725 e!246468))))

(declare-fun mapRest!17448 () (Array (_ BitVec 32) ValueCell!4932))

(declare-fun mapValue!17448 () ValueCell!4932)

(declare-fun mapKey!17448 () (_ BitVec 32))

(assert (=> mapNonEmpty!17448 (= (arr!11932 _values!549) (store mapRest!17448 mapKey!17448 mapValue!17448))))

(declare-fun b!411590 () Bool)

(declare-fun res!238804 () Bool)

(assert (=> b!411590 (=> (not res!238804) (not e!246466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24963 (_ BitVec 32)) Bool)

(assert (=> b!411590 (= res!238804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411591 () Bool)

(declare-fun res!238814 () Bool)

(assert (=> b!411591 (=> (not res!238814) (not e!246466))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!411591 (= res!238814 (and (= (size!12284 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12283 _keys!709) (size!12284 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411592 () Bool)

(declare-fun res!238812 () Bool)

(assert (=> b!411592 (=> (not res!238812) (not e!246466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411592 (= res!238812 (validKeyInArray!0 k0!794))))

(declare-fun b!411593 () Bool)

(assert (=> b!411593 (= e!246466 e!246463)))

(declare-fun res!238806 () Bool)

(assert (=> b!411593 (=> (not res!238806) (not e!246463))))

(assert (=> b!411593 (= res!238806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189310 mask!1025))))

(assert (=> b!411593 (= lt!189310 (array!24964 (store (arr!11931 _keys!709) i!563 k0!794) (size!12283 _keys!709)))))

(declare-fun b!411594 () Bool)

(assert (=> b!411594 (= e!246468 tp_is_empty!10551)))

(declare-fun b!411595 () Bool)

(declare-fun res!238811 () Bool)

(assert (=> b!411595 (=> (not res!238811) (not e!246466))))

(assert (=> b!411595 (= res!238811 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6924))))

(declare-fun b!411596 () Bool)

(assert (=> b!411596 (= e!246463 false)))

(declare-datatypes ((tuple2!6902 0))(
  ( (tuple2!6903 (_1!3462 (_ BitVec 64)) (_2!3462 V!15173)) )
))
(declare-datatypes ((List!6928 0))(
  ( (Nil!6925) (Cons!6924 (h!7780 tuple2!6902) (t!12102 List!6928)) )
))
(declare-datatypes ((ListLongMap!5815 0))(
  ( (ListLongMap!5816 (toList!2923 List!6928)) )
))
(declare-fun lt!189309 () ListLongMap!5815)

(declare-fun minValue!515 () V!15173)

(declare-fun defaultEntry!557 () Int)

(declare-fun v!412 () V!15173)

(declare-fun zeroValue!515 () V!15173)

(declare-fun getCurrentListMapNoExtraKeys!1131 (array!24963 array!24965 (_ BitVec 32) (_ BitVec 32) V!15173 V!15173 (_ BitVec 32) Int) ListLongMap!5815)

(assert (=> b!411596 (= lt!189309 (getCurrentListMapNoExtraKeys!1131 lt!189310 (array!24966 (store (arr!11932 _values!549) i!563 (ValueCellFull!4932 v!412)) (size!12284 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189311 () ListLongMap!5815)

(assert (=> b!411596 (= lt!189311 (getCurrentListMapNoExtraKeys!1131 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411588 () Bool)

(declare-fun res!238805 () Bool)

(assert (=> b!411588 (=> (not res!238805) (not e!246466))))

(assert (=> b!411588 (= res!238805 (or (= (select (arr!11931 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11931 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!238807 () Bool)

(assert (=> start!39132 (=> (not res!238807) (not e!246466))))

(assert (=> start!39132 (= res!238807 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12283 _keys!709))))))

(assert (=> start!39132 e!246466))

(assert (=> start!39132 tp_is_empty!10551))

(assert (=> start!39132 tp!33726))

(assert (=> start!39132 true))

(declare-fun array_inv!8704 (array!24965) Bool)

(assert (=> start!39132 (and (array_inv!8704 _values!549) e!246464)))

(declare-fun array_inv!8705 (array!24963) Bool)

(assert (=> start!39132 (array_inv!8705 _keys!709)))

(assert (= (and start!39132 res!238807) b!411583))

(assert (= (and b!411583 res!238808) b!411591))

(assert (= (and b!411591 res!238814) b!411590))

(assert (= (and b!411590 res!238804) b!411595))

(assert (= (and b!411595 res!238811) b!411584))

(assert (= (and b!411584 res!238809) b!411592))

(assert (= (and b!411592 res!238812) b!411588))

(assert (= (and b!411588 res!238805) b!411589))

(assert (= (and b!411589 res!238815) b!411593))

(assert (= (and b!411593 res!238806) b!411582))

(assert (= (and b!411582 res!238810) b!411587))

(assert (= (and b!411587 res!238813) b!411596))

(assert (= (and b!411586 condMapEmpty!17448) mapIsEmpty!17448))

(assert (= (and b!411586 (not condMapEmpty!17448)) mapNonEmpty!17448))

(get-info :version)

(assert (= (and mapNonEmpty!17448 ((_ is ValueCellFull!4932) mapValue!17448)) b!411594))

(assert (= (and b!411586 ((_ is ValueCellFull!4932) mapDefault!17448)) b!411585))

(assert (= start!39132 b!411586))

(declare-fun m!401683 () Bool)

(assert (=> b!411592 m!401683))

(declare-fun m!401685 () Bool)

(assert (=> b!411588 m!401685))

(declare-fun m!401687 () Bool)

(assert (=> b!411589 m!401687))

(declare-fun m!401689 () Bool)

(assert (=> b!411582 m!401689))

(declare-fun m!401691 () Bool)

(assert (=> b!411590 m!401691))

(declare-fun m!401693 () Bool)

(assert (=> b!411593 m!401693))

(declare-fun m!401695 () Bool)

(assert (=> b!411593 m!401695))

(declare-fun m!401697 () Bool)

(assert (=> b!411583 m!401697))

(declare-fun m!401699 () Bool)

(assert (=> mapNonEmpty!17448 m!401699))

(declare-fun m!401701 () Bool)

(assert (=> start!39132 m!401701))

(declare-fun m!401703 () Bool)

(assert (=> start!39132 m!401703))

(declare-fun m!401705 () Bool)

(assert (=> b!411596 m!401705))

(declare-fun m!401707 () Bool)

(assert (=> b!411596 m!401707))

(declare-fun m!401709 () Bool)

(assert (=> b!411596 m!401709))

(declare-fun m!401711 () Bool)

(assert (=> b!411595 m!401711))

(check-sat (not b!411582) tp_is_empty!10551 (not start!39132) (not b!411592) (not b_next!9399) (not mapNonEmpty!17448) (not b!411589) b_and!16785 (not b!411590) (not b!411583) (not b!411593) (not b!411596) (not b!411595))
(check-sat b_and!16785 (not b_next!9399))
