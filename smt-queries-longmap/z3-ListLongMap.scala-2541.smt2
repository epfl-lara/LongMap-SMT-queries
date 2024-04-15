; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39050 () Bool)

(assert start!39050)

(declare-fun b_free!9331 () Bool)

(declare-fun b_next!9331 () Bool)

(assert (=> start!39050 (= b_free!9331 (not b_next!9331))))

(declare-fun tp!33521 () Bool)

(declare-fun b_and!16691 () Bool)

(assert (=> start!39050 (= tp!33521 b_and!16691)))

(declare-fun b!409781 () Bool)

(declare-fun res!237451 () Bool)

(declare-fun e!245679 () Bool)

(assert (=> b!409781 (=> (not res!237451) (not e!245679))))

(declare-datatypes ((array!24825 0))(
  ( (array!24826 (arr!11862 (Array (_ BitVec 32) (_ BitVec 64))) (size!12215 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24825)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409781 (= res!237451 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409782 () Bool)

(declare-fun res!237462 () Bool)

(declare-fun e!245681 () Bool)

(assert (=> b!409782 (=> (not res!237462) (not e!245681))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409782 (= res!237462 (bvsle from!863 i!563))))

(declare-fun b!409783 () Bool)

(declare-fun res!237461 () Bool)

(assert (=> b!409783 (=> (not res!237461) (not e!245679))))

(assert (=> b!409783 (= res!237461 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12215 _keys!709))))))

(declare-fun res!237460 () Bool)

(assert (=> start!39050 (=> (not res!237460) (not e!245679))))

(assert (=> start!39050 (= res!237460 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12215 _keys!709))))))

(assert (=> start!39050 e!245679))

(declare-fun tp_is_empty!10483 () Bool)

(assert (=> start!39050 tp_is_empty!10483))

(assert (=> start!39050 tp!33521))

(assert (=> start!39050 true))

(declare-datatypes ((V!15083 0))(
  ( (V!15084 (val!5286 Int)) )
))
(declare-datatypes ((ValueCell!4898 0))(
  ( (ValueCellFull!4898 (v!7527 V!15083)) (EmptyCell!4898) )
))
(declare-datatypes ((array!24827 0))(
  ( (array!24828 (arr!11863 (Array (_ BitVec 32) ValueCell!4898)) (size!12216 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24827)

(declare-fun e!245677 () Bool)

(declare-fun array_inv!8698 (array!24827) Bool)

(assert (=> start!39050 (and (array_inv!8698 _values!549) e!245677)))

(declare-fun array_inv!8699 (array!24825) Bool)

(assert (=> start!39050 (array_inv!8699 _keys!709)))

(declare-fun b!409784 () Bool)

(assert (=> b!409784 (= e!245681 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15083)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15083)

(declare-datatypes ((tuple2!6840 0))(
  ( (tuple2!6841 (_1!3431 (_ BitVec 64)) (_2!3431 V!15083)) )
))
(declare-datatypes ((List!6852 0))(
  ( (Nil!6849) (Cons!6848 (h!7704 tuple2!6840) (t!12017 List!6852)) )
))
(declare-datatypes ((ListLongMap!5743 0))(
  ( (ListLongMap!5744 (toList!2887 List!6852)) )
))
(declare-fun lt!188795 () ListLongMap!5743)

(declare-fun getCurrentListMapNoExtraKeys!1101 (array!24825 array!24827 (_ BitVec 32) (_ BitVec 32) V!15083 V!15083 (_ BitVec 32) Int) ListLongMap!5743)

(assert (=> b!409784 (= lt!188795 (getCurrentListMapNoExtraKeys!1101 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409785 () Bool)

(declare-fun res!237457 () Bool)

(assert (=> b!409785 (=> (not res!237457) (not e!245681))))

(declare-fun lt!188794 () array!24825)

(declare-datatypes ((List!6853 0))(
  ( (Nil!6850) (Cons!6849 (h!7705 (_ BitVec 64)) (t!12018 List!6853)) )
))
(declare-fun arrayNoDuplicates!0 (array!24825 (_ BitVec 32) List!6853) Bool)

(assert (=> b!409785 (= res!237457 (arrayNoDuplicates!0 lt!188794 #b00000000000000000000000000000000 Nil!6850))))

(declare-fun b!409786 () Bool)

(declare-fun res!237452 () Bool)

(assert (=> b!409786 (=> (not res!237452) (not e!245679))))

(assert (=> b!409786 (= res!237452 (or (= (select (arr!11862 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11862 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409787 () Bool)

(declare-fun e!245678 () Bool)

(assert (=> b!409787 (= e!245678 tp_is_empty!10483)))

(declare-fun b!409788 () Bool)

(declare-fun res!237456 () Bool)

(assert (=> b!409788 (=> (not res!237456) (not e!245679))))

(assert (=> b!409788 (= res!237456 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6850))))

(declare-fun b!409789 () Bool)

(assert (=> b!409789 (= e!245679 e!245681)))

(declare-fun res!237453 () Bool)

(assert (=> b!409789 (=> (not res!237453) (not e!245681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24825 (_ BitVec 32)) Bool)

(assert (=> b!409789 (= res!237453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188794 mask!1025))))

(assert (=> b!409789 (= lt!188794 (array!24826 (store (arr!11862 _keys!709) i!563 k0!794) (size!12215 _keys!709)))))

(declare-fun b!409790 () Bool)

(declare-fun res!237454 () Bool)

(assert (=> b!409790 (=> (not res!237454) (not e!245679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409790 (= res!237454 (validMask!0 mask!1025))))

(declare-fun b!409791 () Bool)

(declare-fun e!245682 () Bool)

(assert (=> b!409791 (= e!245682 tp_is_empty!10483)))

(declare-fun b!409792 () Bool)

(declare-fun res!237458 () Bool)

(assert (=> b!409792 (=> (not res!237458) (not e!245679))))

(assert (=> b!409792 (= res!237458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409793 () Bool)

(declare-fun res!237459 () Bool)

(assert (=> b!409793 (=> (not res!237459) (not e!245679))))

(assert (=> b!409793 (= res!237459 (and (= (size!12216 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12215 _keys!709) (size!12216 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17346 () Bool)

(declare-fun mapRes!17346 () Bool)

(assert (=> mapIsEmpty!17346 mapRes!17346))

(declare-fun b!409794 () Bool)

(declare-fun res!237455 () Bool)

(assert (=> b!409794 (=> (not res!237455) (not e!245679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409794 (= res!237455 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17346 () Bool)

(declare-fun tp!33522 () Bool)

(assert (=> mapNonEmpty!17346 (= mapRes!17346 (and tp!33522 e!245682))))

(declare-fun mapValue!17346 () ValueCell!4898)

(declare-fun mapRest!17346 () (Array (_ BitVec 32) ValueCell!4898))

(declare-fun mapKey!17346 () (_ BitVec 32))

(assert (=> mapNonEmpty!17346 (= (arr!11863 _values!549) (store mapRest!17346 mapKey!17346 mapValue!17346))))

(declare-fun b!409795 () Bool)

(assert (=> b!409795 (= e!245677 (and e!245678 mapRes!17346))))

(declare-fun condMapEmpty!17346 () Bool)

(declare-fun mapDefault!17346 () ValueCell!4898)

(assert (=> b!409795 (= condMapEmpty!17346 (= (arr!11863 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4898)) mapDefault!17346)))))

(assert (= (and start!39050 res!237460) b!409790))

(assert (= (and b!409790 res!237454) b!409793))

(assert (= (and b!409793 res!237459) b!409792))

(assert (= (and b!409792 res!237458) b!409788))

(assert (= (and b!409788 res!237456) b!409783))

(assert (= (and b!409783 res!237461) b!409794))

(assert (= (and b!409794 res!237455) b!409786))

(assert (= (and b!409786 res!237452) b!409781))

(assert (= (and b!409781 res!237451) b!409789))

(assert (= (and b!409789 res!237453) b!409785))

(assert (= (and b!409785 res!237457) b!409782))

(assert (= (and b!409782 res!237462) b!409784))

(assert (= (and b!409795 condMapEmpty!17346) mapIsEmpty!17346))

(assert (= (and b!409795 (not condMapEmpty!17346)) mapNonEmpty!17346))

(get-info :version)

(assert (= (and mapNonEmpty!17346 ((_ is ValueCellFull!4898) mapValue!17346)) b!409791))

(assert (= (and b!409795 ((_ is ValueCellFull!4898) mapDefault!17346)) b!409787))

(assert (= start!39050 b!409795))

(declare-fun m!399975 () Bool)

(assert (=> b!409790 m!399975))

(declare-fun m!399977 () Bool)

(assert (=> b!409792 m!399977))

(declare-fun m!399979 () Bool)

(assert (=> b!409781 m!399979))

(declare-fun m!399981 () Bool)

(assert (=> mapNonEmpty!17346 m!399981))

(declare-fun m!399983 () Bool)

(assert (=> start!39050 m!399983))

(declare-fun m!399985 () Bool)

(assert (=> start!39050 m!399985))

(declare-fun m!399987 () Bool)

(assert (=> b!409788 m!399987))

(declare-fun m!399989 () Bool)

(assert (=> b!409785 m!399989))

(declare-fun m!399991 () Bool)

(assert (=> b!409794 m!399991))

(declare-fun m!399993 () Bool)

(assert (=> b!409784 m!399993))

(declare-fun m!399995 () Bool)

(assert (=> b!409786 m!399995))

(declare-fun m!399997 () Bool)

(assert (=> b!409789 m!399997))

(declare-fun m!399999 () Bool)

(assert (=> b!409789 m!399999))

(check-sat tp_is_empty!10483 (not b!409792) (not b!409790) (not b!409788) b_and!16691 (not b!409794) (not b_next!9331) (not b!409781) (not mapNonEmpty!17346) (not start!39050) (not b!409784) (not b!409785) (not b!409789))
(check-sat b_and!16691 (not b_next!9331))
