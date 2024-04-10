; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20450 () Bool)

(assert start!20450)

(declare-fun b_free!5109 () Bool)

(declare-fun b_next!5109 () Bool)

(assert (=> start!20450 (= b_free!5109 (not b_next!5109))))

(declare-fun tp!18359 () Bool)

(declare-fun b_and!11855 () Bool)

(assert (=> start!20450 (= tp!18359 b_and!11855)))

(declare-fun b!202599 () Bool)

(declare-fun res!97128 () Bool)

(declare-fun e!132696 () Bool)

(assert (=> b!202599 (=> (not res!97128) (not e!132696))))

(declare-datatypes ((array!9155 0))(
  ( (array!9156 (arr!4328 (Array (_ BitVec 32) (_ BitVec 64))) (size!4653 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9155)

(declare-datatypes ((List!2737 0))(
  ( (Nil!2734) (Cons!2733 (h!3375 (_ BitVec 64)) (t!7668 List!2737)) )
))
(declare-fun arrayNoDuplicates!0 (array!9155 (_ BitVec 32) List!2737) Bool)

(assert (=> b!202599 (= res!97128 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2734))))

(declare-fun res!97126 () Bool)

(assert (=> start!20450 (=> (not res!97126) (not e!132696))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20450 (= res!97126 (validMask!0 mask!1149))))

(assert (=> start!20450 e!132696))

(declare-datatypes ((V!6267 0))(
  ( (V!6268 (val!2527 Int)) )
))
(declare-datatypes ((ValueCell!2139 0))(
  ( (ValueCellFull!2139 (v!4497 V!6267)) (EmptyCell!2139) )
))
(declare-datatypes ((array!9157 0))(
  ( (array!9158 (arr!4329 (Array (_ BitVec 32) ValueCell!2139)) (size!4654 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9157)

(declare-fun e!132697 () Bool)

(declare-fun array_inv!2855 (array!9157) Bool)

(assert (=> start!20450 (and (array_inv!2855 _values!649) e!132697)))

(assert (=> start!20450 true))

(declare-fun tp_is_empty!4965 () Bool)

(assert (=> start!20450 tp_is_empty!4965))

(declare-fun array_inv!2856 (array!9155) Bool)

(assert (=> start!20450 (array_inv!2856 _keys!825)))

(assert (=> start!20450 tp!18359))

(declare-fun b!202600 () Bool)

(declare-fun res!97132 () Bool)

(assert (=> b!202600 (=> (not res!97132) (not e!132696))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202600 (= res!97132 (and (= (size!4654 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4653 _keys!825) (size!4654 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202601 () Bool)

(declare-fun res!97125 () Bool)

(assert (=> b!202601 (=> (not res!97125) (not e!132696))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202601 (= res!97125 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4653 _keys!825))))))

(declare-fun b!202602 () Bool)

(declare-fun e!132695 () Bool)

(declare-fun mapRes!8516 () Bool)

(assert (=> b!202602 (= e!132697 (and e!132695 mapRes!8516))))

(declare-fun condMapEmpty!8516 () Bool)

(declare-fun mapDefault!8516 () ValueCell!2139)

(assert (=> b!202602 (= condMapEmpty!8516 (= (arr!4329 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2139)) mapDefault!8516)))))

(declare-fun b!202603 () Bool)

(declare-fun res!97124 () Bool)

(assert (=> b!202603 (=> (not res!97124) (not e!132696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9155 (_ BitVec 32)) Bool)

(assert (=> b!202603 (= res!97124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202604 () Bool)

(declare-fun e!132693 () Bool)

(assert (=> b!202604 (= e!132693 true)))

(declare-datatypes ((tuple2!3834 0))(
  ( (tuple2!3835 (_1!1928 (_ BitVec 64)) (_2!1928 V!6267)) )
))
(declare-datatypes ((List!2738 0))(
  ( (Nil!2735) (Cons!2734 (h!3376 tuple2!3834) (t!7669 List!2738)) )
))
(declare-datatypes ((ListLongMap!2747 0))(
  ( (ListLongMap!2748 (toList!1389 List!2738)) )
))
(declare-fun lt!101777 () ListLongMap!2747)

(declare-fun lt!101779 () ListLongMap!2747)

(declare-fun lt!101780 () tuple2!3834)

(declare-fun +!416 (ListLongMap!2747 tuple2!3834) ListLongMap!2747)

(assert (=> b!202604 (= lt!101777 (+!416 lt!101779 lt!101780))))

(declare-fun v!520 () V!6267)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!101786 () ListLongMap!2747)

(declare-fun zeroValue!615 () V!6267)

(declare-datatypes ((Unit!6126 0))(
  ( (Unit!6127) )
))
(declare-fun lt!101782 () Unit!6126)

(declare-fun addCommutativeForDiffKeys!132 (ListLongMap!2747 (_ BitVec 64) V!6267 (_ BitVec 64) V!6267) Unit!6126)

(assert (=> b!202604 (= lt!101782 (addCommutativeForDiffKeys!132 lt!101786 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202605 () Bool)

(declare-fun e!132692 () Bool)

(assert (=> b!202605 (= e!132692 e!132693)))

(declare-fun res!97129 () Bool)

(assert (=> b!202605 (=> res!97129 e!132693)))

(assert (=> b!202605 (= res!97129 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101783 () ListLongMap!2747)

(assert (=> b!202605 (= lt!101783 lt!101777)))

(declare-fun lt!101781 () ListLongMap!2747)

(declare-fun lt!101785 () tuple2!3834)

(assert (=> b!202605 (= lt!101777 (+!416 lt!101781 lt!101785))))

(declare-fun lt!101784 () ListLongMap!2747)

(assert (=> b!202605 (= lt!101784 lt!101779)))

(assert (=> b!202605 (= lt!101779 (+!416 lt!101786 lt!101785))))

(declare-fun lt!101778 () ListLongMap!2747)

(assert (=> b!202605 (= lt!101783 (+!416 lt!101778 lt!101785))))

(assert (=> b!202605 (= lt!101785 (tuple2!3835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202606 () Bool)

(assert (=> b!202606 (= e!132695 tp_is_empty!4965)))

(declare-fun b!202607 () Bool)

(declare-fun res!97130 () Bool)

(assert (=> b!202607 (=> (not res!97130) (not e!132696))))

(assert (=> b!202607 (= res!97130 (= (select (arr!4328 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8516 () Bool)

(declare-fun tp!18358 () Bool)

(declare-fun e!132698 () Bool)

(assert (=> mapNonEmpty!8516 (= mapRes!8516 (and tp!18358 e!132698))))

(declare-fun mapRest!8516 () (Array (_ BitVec 32) ValueCell!2139))

(declare-fun mapValue!8516 () ValueCell!2139)

(declare-fun mapKey!8516 () (_ BitVec 32))

(assert (=> mapNonEmpty!8516 (= (arr!4329 _values!649) (store mapRest!8516 mapKey!8516 mapValue!8516))))

(declare-fun b!202608 () Bool)

(assert (=> b!202608 (= e!132698 tp_is_empty!4965)))

(declare-fun b!202609 () Bool)

(declare-fun res!97131 () Bool)

(assert (=> b!202609 (=> (not res!97131) (not e!132696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202609 (= res!97131 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8516 () Bool)

(assert (=> mapIsEmpty!8516 mapRes!8516))

(declare-fun b!202610 () Bool)

(assert (=> b!202610 (= e!132696 (not e!132692))))

(declare-fun res!97127 () Bool)

(assert (=> b!202610 (=> res!97127 e!132692)))

(assert (=> b!202610 (= res!97127 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6267)

(declare-fun getCurrentListMap!968 (array!9155 array!9157 (_ BitVec 32) (_ BitVec 32) V!6267 V!6267 (_ BitVec 32) Int) ListLongMap!2747)

(assert (=> b!202610 (= lt!101784 (getCurrentListMap!968 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101776 () array!9157)

(assert (=> b!202610 (= lt!101783 (getCurrentListMap!968 _keys!825 lt!101776 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202610 (and (= lt!101778 lt!101781) (= lt!101781 lt!101778))))

(assert (=> b!202610 (= lt!101781 (+!416 lt!101786 lt!101780))))

(assert (=> b!202610 (= lt!101780 (tuple2!3835 k0!843 v!520))))

(declare-fun lt!101787 () Unit!6126)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!81 (array!9155 array!9157 (_ BitVec 32) (_ BitVec 32) V!6267 V!6267 (_ BitVec 32) (_ BitVec 64) V!6267 (_ BitVec 32) Int) Unit!6126)

(assert (=> b!202610 (= lt!101787 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!81 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!342 (array!9155 array!9157 (_ BitVec 32) (_ BitVec 32) V!6267 V!6267 (_ BitVec 32) Int) ListLongMap!2747)

(assert (=> b!202610 (= lt!101778 (getCurrentListMapNoExtraKeys!342 _keys!825 lt!101776 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202610 (= lt!101776 (array!9158 (store (arr!4329 _values!649) i!601 (ValueCellFull!2139 v!520)) (size!4654 _values!649)))))

(assert (=> b!202610 (= lt!101786 (getCurrentListMapNoExtraKeys!342 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20450 res!97126) b!202600))

(assert (= (and b!202600 res!97132) b!202603))

(assert (= (and b!202603 res!97124) b!202599))

(assert (= (and b!202599 res!97128) b!202601))

(assert (= (and b!202601 res!97125) b!202609))

(assert (= (and b!202609 res!97131) b!202607))

(assert (= (and b!202607 res!97130) b!202610))

(assert (= (and b!202610 (not res!97127)) b!202605))

(assert (= (and b!202605 (not res!97129)) b!202604))

(assert (= (and b!202602 condMapEmpty!8516) mapIsEmpty!8516))

(assert (= (and b!202602 (not condMapEmpty!8516)) mapNonEmpty!8516))

(get-info :version)

(assert (= (and mapNonEmpty!8516 ((_ is ValueCellFull!2139) mapValue!8516)) b!202608))

(assert (= (and b!202602 ((_ is ValueCellFull!2139) mapDefault!8516)) b!202606))

(assert (= start!20450 b!202602))

(declare-fun m!229931 () Bool)

(assert (=> b!202605 m!229931))

(declare-fun m!229933 () Bool)

(assert (=> b!202605 m!229933))

(declare-fun m!229935 () Bool)

(assert (=> b!202605 m!229935))

(declare-fun m!229937 () Bool)

(assert (=> b!202604 m!229937))

(declare-fun m!229939 () Bool)

(assert (=> b!202604 m!229939))

(declare-fun m!229941 () Bool)

(assert (=> start!20450 m!229941))

(declare-fun m!229943 () Bool)

(assert (=> start!20450 m!229943))

(declare-fun m!229945 () Bool)

(assert (=> start!20450 m!229945))

(declare-fun m!229947 () Bool)

(assert (=> b!202607 m!229947))

(declare-fun m!229949 () Bool)

(assert (=> b!202609 m!229949))

(declare-fun m!229951 () Bool)

(assert (=> b!202599 m!229951))

(declare-fun m!229953 () Bool)

(assert (=> b!202610 m!229953))

(declare-fun m!229955 () Bool)

(assert (=> b!202610 m!229955))

(declare-fun m!229957 () Bool)

(assert (=> b!202610 m!229957))

(declare-fun m!229959 () Bool)

(assert (=> b!202610 m!229959))

(declare-fun m!229961 () Bool)

(assert (=> b!202610 m!229961))

(declare-fun m!229963 () Bool)

(assert (=> b!202610 m!229963))

(declare-fun m!229965 () Bool)

(assert (=> b!202610 m!229965))

(declare-fun m!229967 () Bool)

(assert (=> b!202603 m!229967))

(declare-fun m!229969 () Bool)

(assert (=> mapNonEmpty!8516 m!229969))

(check-sat (not b!202604) tp_is_empty!4965 (not mapNonEmpty!8516) (not start!20450) (not b!202610) (not b!202605) b_and!11855 (not b!202609) (not b!202603) (not b!202599) (not b_next!5109))
(check-sat b_and!11855 (not b_next!5109))
