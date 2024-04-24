; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39038 () Bool)

(assert start!39038)

(declare-fun b_free!9319 () Bool)

(declare-fun b_next!9319 () Bool)

(assert (=> start!39038 (= b_free!9319 (not b_next!9319))))

(declare-fun tp!33486 () Bool)

(declare-fun b_and!16719 () Bool)

(assert (=> start!39038 (= tp!33486 b_and!16719)))

(declare-fun b!409733 () Bool)

(declare-fun res!237369 () Bool)

(declare-fun e!245713 () Bool)

(assert (=> b!409733 (=> (not res!237369) (not e!245713))))

(declare-datatypes ((array!24810 0))(
  ( (array!24811 (arr!11854 (Array (_ BitVec 32) (_ BitVec 64))) (size!12206 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24810)

(declare-datatypes ((List!6740 0))(
  ( (Nil!6737) (Cons!6736 (h!7592 (_ BitVec 64)) (t!11906 List!6740)) )
))
(declare-fun arrayNoDuplicates!0 (array!24810 (_ BitVec 32) List!6740) Bool)

(assert (=> b!409733 (= res!237369 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6737))))

(declare-fun b!409734 () Bool)

(declare-fun res!237368 () Bool)

(assert (=> b!409734 (=> (not res!237368) (not e!245713))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409734 (= res!237368 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17328 () Bool)

(declare-fun mapRes!17328 () Bool)

(assert (=> mapIsEmpty!17328 mapRes!17328))

(declare-fun b!409735 () Bool)

(declare-fun res!237372 () Bool)

(declare-fun e!245714 () Bool)

(assert (=> b!409735 (=> (not res!237372) (not e!245714))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409735 (= res!237372 (bvsle from!863 i!563))))

(declare-fun b!409736 () Bool)

(declare-fun res!237364 () Bool)

(assert (=> b!409736 (=> (not res!237364) (not e!245713))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24810 (_ BitVec 32)) Bool)

(assert (=> b!409736 (= res!237364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409738 () Bool)

(declare-fun e!245711 () Bool)

(declare-fun tp_is_empty!10471 () Bool)

(assert (=> b!409738 (= e!245711 tp_is_empty!10471)))

(declare-fun b!409739 () Bool)

(declare-fun res!237366 () Bool)

(assert (=> b!409739 (=> (not res!237366) (not e!245713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409739 (= res!237366 (validMask!0 mask!1025))))

(declare-fun b!409740 () Bool)

(declare-fun res!237361 () Bool)

(assert (=> b!409740 (=> (not res!237361) (not e!245713))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15067 0))(
  ( (V!15068 (val!5280 Int)) )
))
(declare-datatypes ((ValueCell!4892 0))(
  ( (ValueCellFull!4892 (v!7528 V!15067)) (EmptyCell!4892) )
))
(declare-datatypes ((array!24812 0))(
  ( (array!24813 (arr!11855 (Array (_ BitVec 32) ValueCell!4892)) (size!12207 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24812)

(assert (=> b!409740 (= res!237361 (and (= (size!12207 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12206 _keys!709) (size!12207 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409741 () Bool)

(assert (=> b!409741 (= e!245714 false)))

(declare-fun minValue!515 () V!15067)

(declare-fun zeroValue!515 () V!15067)

(declare-datatypes ((tuple2!6722 0))(
  ( (tuple2!6723 (_1!3372 (_ BitVec 64)) (_2!3372 V!15067)) )
))
(declare-datatypes ((List!6741 0))(
  ( (Nil!6738) (Cons!6737 (h!7593 tuple2!6722) (t!11907 List!6741)) )
))
(declare-datatypes ((ListLongMap!5637 0))(
  ( (ListLongMap!5638 (toList!2834 List!6741)) )
))
(declare-fun lt!189012 () ListLongMap!5637)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1086 (array!24810 array!24812 (_ BitVec 32) (_ BitVec 32) V!15067 V!15067 (_ BitVec 32) Int) ListLongMap!5637)

(assert (=> b!409741 (= lt!189012 (getCurrentListMapNoExtraKeys!1086 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!237371 () Bool)

(assert (=> start!39038 (=> (not res!237371) (not e!245713))))

(assert (=> start!39038 (= res!237371 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12206 _keys!709))))))

(assert (=> start!39038 e!245713))

(assert (=> start!39038 tp_is_empty!10471))

(assert (=> start!39038 tp!33486))

(assert (=> start!39038 true))

(declare-fun e!245712 () Bool)

(declare-fun array_inv!8736 (array!24812) Bool)

(assert (=> start!39038 (and (array_inv!8736 _values!549) e!245712)))

(declare-fun array_inv!8737 (array!24810) Bool)

(assert (=> start!39038 (array_inv!8737 _keys!709)))

(declare-fun b!409737 () Bool)

(assert (=> b!409737 (= e!245713 e!245714)))

(declare-fun res!237370 () Bool)

(assert (=> b!409737 (=> (not res!237370) (not e!245714))))

(declare-fun lt!189011 () array!24810)

(assert (=> b!409737 (= res!237370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189011 mask!1025))))

(assert (=> b!409737 (= lt!189011 (array!24811 (store (arr!11854 _keys!709) i!563 k0!794) (size!12206 _keys!709)))))

(declare-fun b!409742 () Bool)

(declare-fun res!237365 () Bool)

(assert (=> b!409742 (=> (not res!237365) (not e!245714))))

(assert (=> b!409742 (= res!237365 (arrayNoDuplicates!0 lt!189011 #b00000000000000000000000000000000 Nil!6737))))

(declare-fun b!409743 () Bool)

(declare-fun res!237363 () Bool)

(assert (=> b!409743 (=> (not res!237363) (not e!245713))))

(assert (=> b!409743 (= res!237363 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12206 _keys!709))))))

(declare-fun b!409744 () Bool)

(assert (=> b!409744 (= e!245712 (and e!245711 mapRes!17328))))

(declare-fun condMapEmpty!17328 () Bool)

(declare-fun mapDefault!17328 () ValueCell!4892)

(assert (=> b!409744 (= condMapEmpty!17328 (= (arr!11855 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4892)) mapDefault!17328)))))

(declare-fun b!409745 () Bool)

(declare-fun e!245715 () Bool)

(assert (=> b!409745 (= e!245715 tp_is_empty!10471)))

(declare-fun mapNonEmpty!17328 () Bool)

(declare-fun tp!33485 () Bool)

(assert (=> mapNonEmpty!17328 (= mapRes!17328 (and tp!33485 e!245715))))

(declare-fun mapRest!17328 () (Array (_ BitVec 32) ValueCell!4892))

(declare-fun mapValue!17328 () ValueCell!4892)

(declare-fun mapKey!17328 () (_ BitVec 32))

(assert (=> mapNonEmpty!17328 (= (arr!11855 _values!549) (store mapRest!17328 mapKey!17328 mapValue!17328))))

(declare-fun b!409746 () Bool)

(declare-fun res!237367 () Bool)

(assert (=> b!409746 (=> (not res!237367) (not e!245713))))

(assert (=> b!409746 (= res!237367 (or (= (select (arr!11854 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11854 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409747 () Bool)

(declare-fun res!237362 () Bool)

(assert (=> b!409747 (=> (not res!237362) (not e!245713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409747 (= res!237362 (validKeyInArray!0 k0!794))))

(assert (= (and start!39038 res!237371) b!409739))

(assert (= (and b!409739 res!237366) b!409740))

(assert (= (and b!409740 res!237361) b!409736))

(assert (= (and b!409736 res!237364) b!409733))

(assert (= (and b!409733 res!237369) b!409743))

(assert (= (and b!409743 res!237363) b!409747))

(assert (= (and b!409747 res!237362) b!409746))

(assert (= (and b!409746 res!237367) b!409734))

(assert (= (and b!409734 res!237368) b!409737))

(assert (= (and b!409737 res!237370) b!409742))

(assert (= (and b!409742 res!237365) b!409735))

(assert (= (and b!409735 res!237372) b!409741))

(assert (= (and b!409744 condMapEmpty!17328) mapIsEmpty!17328))

(assert (= (and b!409744 (not condMapEmpty!17328)) mapNonEmpty!17328))

(get-info :version)

(assert (= (and mapNonEmpty!17328 ((_ is ValueCellFull!4892) mapValue!17328)) b!409745))

(assert (= (and b!409744 ((_ is ValueCellFull!4892) mapDefault!17328)) b!409738))

(assert (= start!39038 b!409744))

(declare-fun m!400773 () Bool)

(assert (=> b!409747 m!400773))

(declare-fun m!400775 () Bool)

(assert (=> mapNonEmpty!17328 m!400775))

(declare-fun m!400777 () Bool)

(assert (=> b!409736 m!400777))

(declare-fun m!400779 () Bool)

(assert (=> b!409741 m!400779))

(declare-fun m!400781 () Bool)

(assert (=> b!409739 m!400781))

(declare-fun m!400783 () Bool)

(assert (=> b!409733 m!400783))

(declare-fun m!400785 () Bool)

(assert (=> start!39038 m!400785))

(declare-fun m!400787 () Bool)

(assert (=> start!39038 m!400787))

(declare-fun m!400789 () Bool)

(assert (=> b!409737 m!400789))

(declare-fun m!400791 () Bool)

(assert (=> b!409737 m!400791))

(declare-fun m!400793 () Bool)

(assert (=> b!409742 m!400793))

(declare-fun m!400795 () Bool)

(assert (=> b!409734 m!400795))

(declare-fun m!400797 () Bool)

(assert (=> b!409746 m!400797))

(check-sat (not b!409736) (not mapNonEmpty!17328) b_and!16719 (not b!409739) (not b!409741) (not b!409747) (not b!409734) (not b!409733) (not b!409737) (not b!409742) tp_is_empty!10471 (not start!39038) (not b_next!9319))
(check-sat b_and!16719 (not b_next!9319))
