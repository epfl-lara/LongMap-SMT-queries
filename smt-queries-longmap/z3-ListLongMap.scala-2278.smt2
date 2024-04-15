; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37116 () Bool)

(assert start!37116)

(declare-fun b_free!8257 () Bool)

(declare-fun b_next!8257 () Bool)

(assert (=> start!37116 (= b_free!8257 (not b_next!8257))))

(declare-fun tp!29487 () Bool)

(declare-fun b_and!15473 () Bool)

(assert (=> start!37116 (= tp!29487 b_and!15473)))

(declare-fun b!373946 () Bool)

(declare-fun res!210848 () Bool)

(declare-fun e!227906 () Bool)

(assert (=> b!373946 (=> (not res!210848) (not e!227906))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12979 0))(
  ( (V!12980 (val!4497 Int)) )
))
(declare-datatypes ((ValueCell!4109 0))(
  ( (ValueCellFull!4109 (v!6688 V!12979)) (EmptyCell!4109) )
))
(declare-datatypes ((array!21727 0))(
  ( (array!21728 (arr!10332 (Array (_ BitVec 32) ValueCell!4109)) (size!10685 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21727)

(declare-datatypes ((array!21729 0))(
  ( (array!21730 (arr!10333 (Array (_ BitVec 32) (_ BitVec 64))) (size!10686 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21729)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!373946 (= res!210848 (and (= (size!10685 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10686 _keys!658) (size!10685 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14922 () Bool)

(declare-fun mapRes!14922 () Bool)

(declare-fun tp!29486 () Bool)

(declare-fun e!227910 () Bool)

(assert (=> mapNonEmpty!14922 (= mapRes!14922 (and tp!29486 e!227910))))

(declare-fun mapRest!14922 () (Array (_ BitVec 32) ValueCell!4109))

(declare-fun mapKey!14922 () (_ BitVec 32))

(declare-fun mapValue!14922 () ValueCell!4109)

(assert (=> mapNonEmpty!14922 (= (arr!10332 _values!506) (store mapRest!14922 mapKey!14922 mapValue!14922))))

(declare-fun b!373948 () Bool)

(declare-fun e!227907 () Bool)

(declare-fun tp_is_empty!8905 () Bool)

(assert (=> b!373948 (= e!227907 tp_is_empty!8905)))

(declare-fun b!373949 () Bool)

(declare-fun res!210841 () Bool)

(assert (=> b!373949 (=> (not res!210841) (not e!227906))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373949 (= res!210841 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10686 _keys!658))))))

(declare-fun b!373950 () Bool)

(declare-fun e!227909 () Bool)

(declare-fun e!227905 () Bool)

(assert (=> b!373950 (= e!227909 (not e!227905))))

(declare-fun res!210845 () Bool)

(assert (=> b!373950 (=> res!210845 e!227905)))

(assert (=> b!373950 (= res!210845 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12979)

(declare-datatypes ((tuple2!5946 0))(
  ( (tuple2!5947 (_1!2984 (_ BitVec 64)) (_2!2984 V!12979)) )
))
(declare-datatypes ((List!5782 0))(
  ( (Nil!5779) (Cons!5778 (h!6634 tuple2!5946) (t!10923 List!5782)) )
))
(declare-datatypes ((ListLongMap!4849 0))(
  ( (ListLongMap!4850 (toList!2440 List!5782)) )
))
(declare-fun lt!172135 () ListLongMap!4849)

(declare-fun minValue!472 () V!12979)

(declare-fun getCurrentListMap!1861 (array!21729 array!21727 (_ BitVec 32) (_ BitVec 32) V!12979 V!12979 (_ BitVec 32) Int) ListLongMap!4849)

(assert (=> b!373950 (= lt!172135 (getCurrentListMap!1861 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172127 () ListLongMap!4849)

(declare-fun lt!172134 () array!21729)

(declare-fun lt!172124 () array!21727)

(assert (=> b!373950 (= lt!172127 (getCurrentListMap!1861 lt!172134 lt!172124 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!172136 () ListLongMap!4849)

(declare-fun lt!172133 () ListLongMap!4849)

(assert (=> b!373950 (and (= lt!172136 lt!172133) (= lt!172133 lt!172136))))

(declare-fun lt!172125 () ListLongMap!4849)

(declare-fun lt!172132 () tuple2!5946)

(declare-fun +!808 (ListLongMap!4849 tuple2!5946) ListLongMap!4849)

(assert (=> b!373950 (= lt!172133 (+!808 lt!172125 lt!172132))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!12979)

(assert (=> b!373950 (= lt!172132 (tuple2!5947 k0!778 v!373))))

(declare-datatypes ((Unit!11488 0))(
  ( (Unit!11489) )
))
(declare-fun lt!172128 () Unit!11488)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!54 (array!21729 array!21727 (_ BitVec 32) (_ BitVec 32) V!12979 V!12979 (_ BitVec 32) (_ BitVec 64) V!12979 (_ BitVec 32) Int) Unit!11488)

(assert (=> b!373950 (= lt!172128 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!54 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!726 (array!21729 array!21727 (_ BitVec 32) (_ BitVec 32) V!12979 V!12979 (_ BitVec 32) Int) ListLongMap!4849)

(assert (=> b!373950 (= lt!172136 (getCurrentListMapNoExtraKeys!726 lt!172134 lt!172124 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373950 (= lt!172124 (array!21728 (store (arr!10332 _values!506) i!548 (ValueCellFull!4109 v!373)) (size!10685 _values!506)))))

(assert (=> b!373950 (= lt!172125 (getCurrentListMapNoExtraKeys!726 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14922 () Bool)

(assert (=> mapIsEmpty!14922 mapRes!14922))

(declare-fun b!373951 () Bool)

(declare-fun e!227911 () Bool)

(assert (=> b!373951 (= e!227911 (and e!227907 mapRes!14922))))

(declare-fun condMapEmpty!14922 () Bool)

(declare-fun mapDefault!14922 () ValueCell!4109)

(assert (=> b!373951 (= condMapEmpty!14922 (= (arr!10332 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4109)) mapDefault!14922)))))

(declare-fun b!373952 () Bool)

(declare-fun e!227908 () Bool)

(assert (=> b!373952 (= e!227908 true)))

(declare-fun lt!172129 () ListLongMap!4849)

(declare-fun lt!172140 () ListLongMap!4849)

(declare-fun lt!172139 () tuple2!5946)

(assert (=> b!373952 (= (+!808 lt!172140 lt!172139) (+!808 lt!172129 lt!172132))))

(declare-fun lt!172138 () Unit!11488)

(declare-fun lt!172137 () ListLongMap!4849)

(declare-fun addCommutativeForDiffKeys!225 (ListLongMap!4849 (_ BitVec 64) V!12979 (_ BitVec 64) V!12979) Unit!11488)

(assert (=> b!373952 (= lt!172138 (addCommutativeForDiffKeys!225 lt!172137 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373953 () Bool)

(assert (=> b!373953 (= e!227905 e!227908)))

(declare-fun res!210843 () Bool)

(assert (=> b!373953 (=> res!210843 e!227908)))

(assert (=> b!373953 (= res!210843 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172130 () ListLongMap!4849)

(assert (=> b!373953 (= lt!172130 lt!172140)))

(assert (=> b!373953 (= lt!172140 (+!808 lt!172137 lt!172132))))

(declare-fun lt!172131 () Unit!11488)

(assert (=> b!373953 (= lt!172131 (addCommutativeForDiffKeys!225 lt!172125 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!373953 (= lt!172127 (+!808 lt!172130 lt!172139))))

(declare-fun lt!172126 () tuple2!5946)

(assert (=> b!373953 (= lt!172130 (+!808 lt!172133 lt!172126))))

(assert (=> b!373953 (= lt!172135 lt!172129)))

(assert (=> b!373953 (= lt!172129 (+!808 lt!172137 lt!172139))))

(assert (=> b!373953 (= lt!172137 (+!808 lt!172125 lt!172126))))

(assert (=> b!373953 (= lt!172127 (+!808 (+!808 lt!172136 lt!172126) lt!172139))))

(assert (=> b!373953 (= lt!172139 (tuple2!5947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373953 (= lt!172126 (tuple2!5947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373954 () Bool)

(declare-fun res!210840 () Bool)

(assert (=> b!373954 (=> (not res!210840) (not e!227906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21729 (_ BitVec 32)) Bool)

(assert (=> b!373954 (= res!210840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373955 () Bool)

(declare-fun res!210839 () Bool)

(assert (=> b!373955 (=> (not res!210839) (not e!227906))))

(declare-fun arrayContainsKey!0 (array!21729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373955 (= res!210839 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!373956 () Bool)

(assert (=> b!373956 (= e!227910 tp_is_empty!8905)))

(declare-fun b!373957 () Bool)

(declare-fun res!210837 () Bool)

(assert (=> b!373957 (=> (not res!210837) (not e!227906))))

(declare-datatypes ((List!5783 0))(
  ( (Nil!5780) (Cons!5779 (h!6635 (_ BitVec 64)) (t!10924 List!5783)) )
))
(declare-fun arrayNoDuplicates!0 (array!21729 (_ BitVec 32) List!5783) Bool)

(assert (=> b!373957 (= res!210837 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5780))))

(declare-fun b!373958 () Bool)

(declare-fun res!210847 () Bool)

(assert (=> b!373958 (=> (not res!210847) (not e!227909))))

(assert (=> b!373958 (= res!210847 (arrayNoDuplicates!0 lt!172134 #b00000000000000000000000000000000 Nil!5780))))

(declare-fun res!210838 () Bool)

(assert (=> start!37116 (=> (not res!210838) (not e!227906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37116 (= res!210838 (validMask!0 mask!970))))

(assert (=> start!37116 e!227906))

(declare-fun array_inv!7622 (array!21727) Bool)

(assert (=> start!37116 (and (array_inv!7622 _values!506) e!227911)))

(assert (=> start!37116 tp!29487))

(assert (=> start!37116 true))

(assert (=> start!37116 tp_is_empty!8905))

(declare-fun array_inv!7623 (array!21729) Bool)

(assert (=> start!37116 (array_inv!7623 _keys!658)))

(declare-fun b!373947 () Bool)

(assert (=> b!373947 (= e!227906 e!227909)))

(declare-fun res!210844 () Bool)

(assert (=> b!373947 (=> (not res!210844) (not e!227909))))

(assert (=> b!373947 (= res!210844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172134 mask!970))))

(assert (=> b!373947 (= lt!172134 (array!21730 (store (arr!10333 _keys!658) i!548 k0!778) (size!10686 _keys!658)))))

(declare-fun b!373959 () Bool)

(declare-fun res!210842 () Bool)

(assert (=> b!373959 (=> (not res!210842) (not e!227906))))

(assert (=> b!373959 (= res!210842 (or (= (select (arr!10333 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10333 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373960 () Bool)

(declare-fun res!210846 () Bool)

(assert (=> b!373960 (=> (not res!210846) (not e!227906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373960 (= res!210846 (validKeyInArray!0 k0!778))))

(assert (= (and start!37116 res!210838) b!373946))

(assert (= (and b!373946 res!210848) b!373954))

(assert (= (and b!373954 res!210840) b!373957))

(assert (= (and b!373957 res!210837) b!373949))

(assert (= (and b!373949 res!210841) b!373960))

(assert (= (and b!373960 res!210846) b!373959))

(assert (= (and b!373959 res!210842) b!373955))

(assert (= (and b!373955 res!210839) b!373947))

(assert (= (and b!373947 res!210844) b!373958))

(assert (= (and b!373958 res!210847) b!373950))

(assert (= (and b!373950 (not res!210845)) b!373953))

(assert (= (and b!373953 (not res!210843)) b!373952))

(assert (= (and b!373951 condMapEmpty!14922) mapIsEmpty!14922))

(assert (= (and b!373951 (not condMapEmpty!14922)) mapNonEmpty!14922))

(get-info :version)

(assert (= (and mapNonEmpty!14922 ((_ is ValueCellFull!4109) mapValue!14922)) b!373956))

(assert (= (and b!373951 ((_ is ValueCellFull!4109) mapDefault!14922)) b!373948))

(assert (= start!37116 b!373951))

(declare-fun m!369671 () Bool)

(assert (=> b!373954 m!369671))

(declare-fun m!369673 () Bool)

(assert (=> b!373947 m!369673))

(declare-fun m!369675 () Bool)

(assert (=> b!373947 m!369675))

(declare-fun m!369677 () Bool)

(assert (=> b!373960 m!369677))

(declare-fun m!369679 () Bool)

(assert (=> b!373959 m!369679))

(declare-fun m!369681 () Bool)

(assert (=> mapNonEmpty!14922 m!369681))

(declare-fun m!369683 () Bool)

(assert (=> b!373955 m!369683))

(declare-fun m!369685 () Bool)

(assert (=> b!373958 m!369685))

(declare-fun m!369687 () Bool)

(assert (=> b!373950 m!369687))

(declare-fun m!369689 () Bool)

(assert (=> b!373950 m!369689))

(declare-fun m!369691 () Bool)

(assert (=> b!373950 m!369691))

(declare-fun m!369693 () Bool)

(assert (=> b!373950 m!369693))

(declare-fun m!369695 () Bool)

(assert (=> b!373950 m!369695))

(declare-fun m!369697 () Bool)

(assert (=> b!373950 m!369697))

(declare-fun m!369699 () Bool)

(assert (=> b!373950 m!369699))

(declare-fun m!369701 () Bool)

(assert (=> b!373957 m!369701))

(declare-fun m!369703 () Bool)

(assert (=> start!37116 m!369703))

(declare-fun m!369705 () Bool)

(assert (=> start!37116 m!369705))

(declare-fun m!369707 () Bool)

(assert (=> start!37116 m!369707))

(declare-fun m!369709 () Bool)

(assert (=> b!373952 m!369709))

(declare-fun m!369711 () Bool)

(assert (=> b!373952 m!369711))

(declare-fun m!369713 () Bool)

(assert (=> b!373952 m!369713))

(declare-fun m!369715 () Bool)

(assert (=> b!373953 m!369715))

(declare-fun m!369717 () Bool)

(assert (=> b!373953 m!369717))

(declare-fun m!369719 () Bool)

(assert (=> b!373953 m!369719))

(declare-fun m!369721 () Bool)

(assert (=> b!373953 m!369721))

(declare-fun m!369723 () Bool)

(assert (=> b!373953 m!369723))

(assert (=> b!373953 m!369721))

(declare-fun m!369725 () Bool)

(assert (=> b!373953 m!369725))

(declare-fun m!369727 () Bool)

(assert (=> b!373953 m!369727))

(declare-fun m!369729 () Bool)

(assert (=> b!373953 m!369729))

(check-sat tp_is_empty!8905 (not mapNonEmpty!14922) (not b!373958) (not b_next!8257) (not b!373952) (not b!373960) b_and!15473 (not b!373955) (not b!373947) (not b!373953) (not b!373957) (not b!373954) (not b!373950) (not start!37116))
(check-sat b_and!15473 (not b_next!8257))
