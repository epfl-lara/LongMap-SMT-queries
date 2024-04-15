; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39086 () Bool)

(assert start!39086)

(declare-fun b_free!9367 () Bool)

(declare-fun b_next!9367 () Bool)

(assert (=> start!39086 (= b_free!9367 (not b_next!9367))))

(declare-fun tp!33630 () Bool)

(declare-fun b_and!16727 () Bool)

(assert (=> start!39086 (= tp!33630 b_and!16727)))

(declare-fun b!410591 () Bool)

(declare-fun res!238107 () Bool)

(declare-fun e!246003 () Bool)

(assert (=> b!410591 (=> (not res!238107) (not e!246003))))

(declare-datatypes ((array!24895 0))(
  ( (array!24896 (arr!11897 (Array (_ BitVec 32) (_ BitVec 64))) (size!12250 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24895)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410591 (= res!238107 (or (= (select (arr!11897 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11897 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410592 () Bool)

(declare-fun res!238108 () Bool)

(assert (=> b!410592 (=> (not res!238108) (not e!246003))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15131 0))(
  ( (V!15132 (val!5304 Int)) )
))
(declare-datatypes ((ValueCell!4916 0))(
  ( (ValueCellFull!4916 (v!7545 V!15131)) (EmptyCell!4916) )
))
(declare-datatypes ((array!24897 0))(
  ( (array!24898 (arr!11898 (Array (_ BitVec 32) ValueCell!4916)) (size!12251 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24897)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!410592 (= res!238108 (and (= (size!12251 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12250 _keys!709) (size!12251 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410593 () Bool)

(declare-fun res!238106 () Bool)

(assert (=> b!410593 (=> (not res!238106) (not e!246003))))

(assert (=> b!410593 (= res!238106 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12250 _keys!709))))))

(declare-fun b!410594 () Bool)

(declare-fun res!238103 () Bool)

(declare-fun e!246005 () Bool)

(assert (=> b!410594 (=> (not res!238103) (not e!246005))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!410594 (= res!238103 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17400 () Bool)

(declare-fun mapRes!17400 () Bool)

(assert (=> mapIsEmpty!17400 mapRes!17400))

(declare-fun b!410595 () Bool)

(declare-fun res!238102 () Bool)

(assert (=> b!410595 (=> (not res!238102) (not e!246005))))

(declare-fun lt!188933 () array!24895)

(declare-datatypes ((List!6878 0))(
  ( (Nil!6875) (Cons!6874 (h!7730 (_ BitVec 64)) (t!12043 List!6878)) )
))
(declare-fun arrayNoDuplicates!0 (array!24895 (_ BitVec 32) List!6878) Bool)

(assert (=> b!410595 (= res!238102 (arrayNoDuplicates!0 lt!188933 #b00000000000000000000000000000000 Nil!6875))))

(declare-fun b!410596 () Bool)

(assert (=> b!410596 (= e!246003 e!246005)))

(declare-fun res!238104 () Bool)

(assert (=> b!410596 (=> (not res!238104) (not e!246005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24895 (_ BitVec 32)) Bool)

(assert (=> b!410596 (= res!238104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188933 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!410596 (= lt!188933 (array!24896 (store (arr!11897 _keys!709) i!563 k0!794) (size!12250 _keys!709)))))

(declare-fun b!410597 () Bool)

(assert (=> b!410597 (= e!246005 false)))

(declare-fun minValue!515 () V!15131)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6866 0))(
  ( (tuple2!6867 (_1!3444 (_ BitVec 64)) (_2!3444 V!15131)) )
))
(declare-datatypes ((List!6879 0))(
  ( (Nil!6876) (Cons!6875 (h!7731 tuple2!6866) (t!12044 List!6879)) )
))
(declare-datatypes ((ListLongMap!5769 0))(
  ( (ListLongMap!5770 (toList!2900 List!6879)) )
))
(declare-fun lt!188931 () ListLongMap!5769)

(declare-fun zeroValue!515 () V!15131)

(declare-fun v!412 () V!15131)

(declare-fun getCurrentListMapNoExtraKeys!1114 (array!24895 array!24897 (_ BitVec 32) (_ BitVec 32) V!15131 V!15131 (_ BitVec 32) Int) ListLongMap!5769)

(assert (=> b!410597 (= lt!188931 (getCurrentListMapNoExtraKeys!1114 lt!188933 (array!24898 (store (arr!11898 _values!549) i!563 (ValueCellFull!4916 v!412)) (size!12251 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!188932 () ListLongMap!5769)

(assert (=> b!410597 (= lt!188932 (getCurrentListMapNoExtraKeys!1114 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410598 () Bool)

(declare-fun e!246006 () Bool)

(declare-fun e!246004 () Bool)

(assert (=> b!410598 (= e!246006 (and e!246004 mapRes!17400))))

(declare-fun condMapEmpty!17400 () Bool)

(declare-fun mapDefault!17400 () ValueCell!4916)

(assert (=> b!410598 (= condMapEmpty!17400 (= (arr!11898 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4916)) mapDefault!17400)))))

(declare-fun b!410599 () Bool)

(declare-fun e!246001 () Bool)

(declare-fun tp_is_empty!10519 () Bool)

(assert (=> b!410599 (= e!246001 tp_is_empty!10519)))

(declare-fun b!410600 () Bool)

(declare-fun res!238110 () Bool)

(assert (=> b!410600 (=> (not res!238110) (not e!246003))))

(assert (=> b!410600 (= res!238110 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6875))))

(declare-fun b!410601 () Bool)

(declare-fun res!238105 () Bool)

(assert (=> b!410601 (=> (not res!238105) (not e!246003))))

(declare-fun arrayContainsKey!0 (array!24895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410601 (= res!238105 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410602 () Bool)

(declare-fun res!238109 () Bool)

(assert (=> b!410602 (=> (not res!238109) (not e!246003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410602 (= res!238109 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17400 () Bool)

(declare-fun tp!33629 () Bool)

(assert (=> mapNonEmpty!17400 (= mapRes!17400 (and tp!33629 e!246001))))

(declare-fun mapValue!17400 () ValueCell!4916)

(declare-fun mapKey!17400 () (_ BitVec 32))

(declare-fun mapRest!17400 () (Array (_ BitVec 32) ValueCell!4916))

(assert (=> mapNonEmpty!17400 (= (arr!11898 _values!549) (store mapRest!17400 mapKey!17400 mapValue!17400))))

(declare-fun b!410604 () Bool)

(declare-fun res!238100 () Bool)

(assert (=> b!410604 (=> (not res!238100) (not e!246003))))

(assert (=> b!410604 (= res!238100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410605 () Bool)

(declare-fun res!238101 () Bool)

(assert (=> b!410605 (=> (not res!238101) (not e!246003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410605 (= res!238101 (validKeyInArray!0 k0!794))))

(declare-fun b!410603 () Bool)

(assert (=> b!410603 (= e!246004 tp_is_empty!10519)))

(declare-fun res!238099 () Bool)

(assert (=> start!39086 (=> (not res!238099) (not e!246003))))

(assert (=> start!39086 (= res!238099 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12250 _keys!709))))))

(assert (=> start!39086 e!246003))

(assert (=> start!39086 tp_is_empty!10519))

(assert (=> start!39086 tp!33630))

(assert (=> start!39086 true))

(declare-fun array_inv!8728 (array!24897) Bool)

(assert (=> start!39086 (and (array_inv!8728 _values!549) e!246006)))

(declare-fun array_inv!8729 (array!24895) Bool)

(assert (=> start!39086 (array_inv!8729 _keys!709)))

(assert (= (and start!39086 res!238099) b!410602))

(assert (= (and b!410602 res!238109) b!410592))

(assert (= (and b!410592 res!238108) b!410604))

(assert (= (and b!410604 res!238100) b!410600))

(assert (= (and b!410600 res!238110) b!410593))

(assert (= (and b!410593 res!238106) b!410605))

(assert (= (and b!410605 res!238101) b!410591))

(assert (= (and b!410591 res!238107) b!410601))

(assert (= (and b!410601 res!238105) b!410596))

(assert (= (and b!410596 res!238104) b!410595))

(assert (= (and b!410595 res!238102) b!410594))

(assert (= (and b!410594 res!238103) b!410597))

(assert (= (and b!410598 condMapEmpty!17400) mapIsEmpty!17400))

(assert (= (and b!410598 (not condMapEmpty!17400)) mapNonEmpty!17400))

(get-info :version)

(assert (= (and mapNonEmpty!17400 ((_ is ValueCellFull!4916) mapValue!17400)) b!410599))

(assert (= (and b!410598 ((_ is ValueCellFull!4916) mapDefault!17400)) b!410603))

(assert (= start!39086 b!410598))

(declare-fun m!400479 () Bool)

(assert (=> b!410596 m!400479))

(declare-fun m!400481 () Bool)

(assert (=> b!410596 m!400481))

(declare-fun m!400483 () Bool)

(assert (=> b!410604 m!400483))

(declare-fun m!400485 () Bool)

(assert (=> b!410601 m!400485))

(declare-fun m!400487 () Bool)

(assert (=> b!410600 m!400487))

(declare-fun m!400489 () Bool)

(assert (=> b!410591 m!400489))

(declare-fun m!400491 () Bool)

(assert (=> b!410597 m!400491))

(declare-fun m!400493 () Bool)

(assert (=> b!410597 m!400493))

(declare-fun m!400495 () Bool)

(assert (=> b!410597 m!400495))

(declare-fun m!400497 () Bool)

(assert (=> b!410595 m!400497))

(declare-fun m!400499 () Bool)

(assert (=> mapNonEmpty!17400 m!400499))

(declare-fun m!400501 () Bool)

(assert (=> start!39086 m!400501))

(declare-fun m!400503 () Bool)

(assert (=> start!39086 m!400503))

(declare-fun m!400505 () Bool)

(assert (=> b!410605 m!400505))

(declare-fun m!400507 () Bool)

(assert (=> b!410602 m!400507))

(check-sat (not b_next!9367) b_and!16727 (not b!410597) (not start!39086) (not b!410600) (not b!410604) (not b!410601) (not b!410595) (not mapNonEmpty!17400) tp_is_empty!10519 (not b!410602) (not b!410605) (not b!410596))
(check-sat b_and!16727 (not b_next!9367))
