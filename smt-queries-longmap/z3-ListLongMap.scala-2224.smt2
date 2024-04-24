; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36792 () Bool)

(assert start!36792)

(declare-fun b_free!7933 () Bool)

(declare-fun b_next!7933 () Bool)

(assert (=> start!36792 (= b_free!7933 (not b_next!7933))))

(declare-fun tp!28515 () Bool)

(declare-fun b_and!15189 () Bool)

(assert (=> start!36792 (= tp!28515 b_and!15189)))

(declare-fun b!367684 () Bool)

(declare-fun e!224975 () Bool)

(declare-fun tp_is_empty!8581 () Bool)

(assert (=> b!367684 (= e!224975 tp_is_empty!8581)))

(declare-fun b!367685 () Bool)

(declare-fun res!205939 () Bool)

(declare-fun e!224978 () Bool)

(assert (=> b!367685 (=> (not res!205939) (not e!224978))))

(declare-datatypes ((array!21102 0))(
  ( (array!21103 (arr!10019 (Array (_ BitVec 32) (_ BitVec 64))) (size!10371 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21102)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21102 (_ BitVec 32)) Bool)

(assert (=> b!367685 (= res!205939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367686 () Bool)

(declare-fun e!224976 () Bool)

(assert (=> b!367686 (= e!224976 tp_is_empty!8581)))

(declare-fun res!205938 () Bool)

(assert (=> start!36792 (=> (not res!205938) (not e!224978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36792 (= res!205938 (validMask!0 mask!970))))

(assert (=> start!36792 e!224978))

(assert (=> start!36792 true))

(declare-datatypes ((V!12547 0))(
  ( (V!12548 (val!4335 Int)) )
))
(declare-datatypes ((ValueCell!3947 0))(
  ( (ValueCellFull!3947 (v!6533 V!12547)) (EmptyCell!3947) )
))
(declare-datatypes ((array!21104 0))(
  ( (array!21105 (arr!10020 (Array (_ BitVec 32) ValueCell!3947)) (size!10372 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21104)

(declare-fun e!224977 () Bool)

(declare-fun array_inv!7440 (array!21104) Bool)

(assert (=> start!36792 (and (array_inv!7440 _values!506) e!224977)))

(assert (=> start!36792 tp!28515))

(assert (=> start!36792 tp_is_empty!8581))

(declare-fun array_inv!7441 (array!21102) Bool)

(assert (=> start!36792 (array_inv!7441 _keys!658)))

(declare-fun b!367687 () Bool)

(declare-fun mapRes!14436 () Bool)

(assert (=> b!367687 (= e!224977 (and e!224975 mapRes!14436))))

(declare-fun condMapEmpty!14436 () Bool)

(declare-fun mapDefault!14436 () ValueCell!3947)

(assert (=> b!367687 (= condMapEmpty!14436 (= (arr!10020 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3947)) mapDefault!14436)))))

(declare-fun b!367688 () Bool)

(declare-fun res!205946 () Bool)

(assert (=> b!367688 (=> (not res!205946) (not e!224978))))

(declare-datatypes ((List!5480 0))(
  ( (Nil!5477) (Cons!5476 (h!6332 (_ BitVec 64)) (t!10622 List!5480)) )
))
(declare-fun arrayNoDuplicates!0 (array!21102 (_ BitVec 32) List!5480) Bool)

(assert (=> b!367688 (= res!205946 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5477))))

(declare-fun b!367689 () Bool)

(declare-fun res!205940 () Bool)

(assert (=> b!367689 (=> (not res!205940) (not e!224978))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367689 (= res!205940 (and (= (size!10372 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10371 _keys!658) (size!10372 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367690 () Bool)

(declare-fun res!205937 () Bool)

(assert (=> b!367690 (=> (not res!205937) (not e!224978))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367690 (= res!205937 (validKeyInArray!0 k0!778))))

(declare-fun b!367691 () Bool)

(declare-fun e!224974 () Bool)

(assert (=> b!367691 (= e!224978 e!224974)))

(declare-fun res!205945 () Bool)

(assert (=> b!367691 (=> (not res!205945) (not e!224974))))

(declare-fun lt!169441 () array!21102)

(assert (=> b!367691 (= res!205945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169441 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367691 (= lt!169441 (array!21103 (store (arr!10019 _keys!658) i!548 k0!778) (size!10371 _keys!658)))))

(declare-fun b!367692 () Bool)

(declare-fun res!205941 () Bool)

(assert (=> b!367692 (=> (not res!205941) (not e!224978))))

(assert (=> b!367692 (= res!205941 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10371 _keys!658))))))

(declare-fun mapIsEmpty!14436 () Bool)

(assert (=> mapIsEmpty!14436 mapRes!14436))

(declare-fun b!367693 () Bool)

(declare-fun res!205942 () Bool)

(assert (=> b!367693 (=> (not res!205942) (not e!224978))))

(assert (=> b!367693 (= res!205942 (or (= (select (arr!10019 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10019 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367694 () Bool)

(assert (=> b!367694 (= e!224974 false)))

(declare-datatypes ((tuple2!5662 0))(
  ( (tuple2!5663 (_1!2842 (_ BitVec 64)) (_2!2842 V!12547)) )
))
(declare-datatypes ((List!5481 0))(
  ( (Nil!5478) (Cons!5477 (h!6333 tuple2!5662) (t!10623 List!5481)) )
))
(declare-datatypes ((ListLongMap!4577 0))(
  ( (ListLongMap!4578 (toList!2304 List!5481)) )
))
(declare-fun lt!169440 () ListLongMap!4577)

(declare-fun zeroValue!472 () V!12547)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!12547)

(declare-fun getCurrentListMapNoExtraKeys!613 (array!21102 array!21104 (_ BitVec 32) (_ BitVec 32) V!12547 V!12547 (_ BitVec 32) Int) ListLongMap!4577)

(assert (=> b!367694 (= lt!169440 (getCurrentListMapNoExtraKeys!613 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14436 () Bool)

(declare-fun tp!28514 () Bool)

(assert (=> mapNonEmpty!14436 (= mapRes!14436 (and tp!28514 e!224976))))

(declare-fun mapRest!14436 () (Array (_ BitVec 32) ValueCell!3947))

(declare-fun mapKey!14436 () (_ BitVec 32))

(declare-fun mapValue!14436 () ValueCell!3947)

(assert (=> mapNonEmpty!14436 (= (arr!10020 _values!506) (store mapRest!14436 mapKey!14436 mapValue!14436))))

(declare-fun b!367695 () Bool)

(declare-fun res!205943 () Bool)

(assert (=> b!367695 (=> (not res!205943) (not e!224978))))

(declare-fun arrayContainsKey!0 (array!21102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367695 (= res!205943 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367696 () Bool)

(declare-fun res!205944 () Bool)

(assert (=> b!367696 (=> (not res!205944) (not e!224974))))

(assert (=> b!367696 (= res!205944 (arrayNoDuplicates!0 lt!169441 #b00000000000000000000000000000000 Nil!5477))))

(assert (= (and start!36792 res!205938) b!367689))

(assert (= (and b!367689 res!205940) b!367685))

(assert (= (and b!367685 res!205939) b!367688))

(assert (= (and b!367688 res!205946) b!367692))

(assert (= (and b!367692 res!205941) b!367690))

(assert (= (and b!367690 res!205937) b!367693))

(assert (= (and b!367693 res!205942) b!367695))

(assert (= (and b!367695 res!205943) b!367691))

(assert (= (and b!367691 res!205945) b!367696))

(assert (= (and b!367696 res!205944) b!367694))

(assert (= (and b!367687 condMapEmpty!14436) mapIsEmpty!14436))

(assert (= (and b!367687 (not condMapEmpty!14436)) mapNonEmpty!14436))

(get-info :version)

(assert (= (and mapNonEmpty!14436 ((_ is ValueCellFull!3947) mapValue!14436)) b!367686))

(assert (= (and b!367687 ((_ is ValueCellFull!3947) mapDefault!14436)) b!367684))

(assert (= start!36792 b!367687))

(declare-fun m!364841 () Bool)

(assert (=> b!367690 m!364841))

(declare-fun m!364843 () Bool)

(assert (=> mapNonEmpty!14436 m!364843))

(declare-fun m!364845 () Bool)

(assert (=> b!367696 m!364845))

(declare-fun m!364847 () Bool)

(assert (=> b!367693 m!364847))

(declare-fun m!364849 () Bool)

(assert (=> b!367688 m!364849))

(declare-fun m!364851 () Bool)

(assert (=> b!367685 m!364851))

(declare-fun m!364853 () Bool)

(assert (=> b!367691 m!364853))

(declare-fun m!364855 () Bool)

(assert (=> b!367691 m!364855))

(declare-fun m!364857 () Bool)

(assert (=> b!367695 m!364857))

(declare-fun m!364859 () Bool)

(assert (=> b!367694 m!364859))

(declare-fun m!364861 () Bool)

(assert (=> start!36792 m!364861))

(declare-fun m!364863 () Bool)

(assert (=> start!36792 m!364863))

(declare-fun m!364865 () Bool)

(assert (=> start!36792 m!364865))

(check-sat (not b!367696) (not b_next!7933) (not b!367695) (not b!367691) (not b!367694) (not mapNonEmpty!14436) b_and!15189 (not b!367688) (not b!367685) tp_is_empty!8581 (not start!36792) (not b!367690))
(check-sat b_and!15189 (not b_next!7933))
