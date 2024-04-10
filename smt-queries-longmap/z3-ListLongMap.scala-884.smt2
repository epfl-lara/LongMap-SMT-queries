; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20402 () Bool)

(assert start!20402)

(declare-fun b_free!5061 () Bool)

(declare-fun b_next!5061 () Bool)

(assert (=> start!20402 (= b_free!5061 (not b_next!5061))))

(declare-fun tp!18214 () Bool)

(declare-fun b_and!11807 () Bool)

(assert (=> start!20402 (= tp!18214 b_and!11807)))

(declare-fun b!201726 () Bool)

(declare-fun res!96469 () Bool)

(declare-fun e!132193 () Bool)

(assert (=> b!201726 (=> (not res!96469) (not e!132193))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9063 0))(
  ( (array!9064 (arr!4282 (Array (_ BitVec 32) (_ BitVec 64))) (size!4607 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9063)

(assert (=> b!201726 (= res!96469 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4607 _keys!825))))))

(declare-fun b!201727 () Bool)

(declare-fun res!96470 () Bool)

(assert (=> b!201727 (=> (not res!96470) (not e!132193))))

(declare-datatypes ((List!2703 0))(
  ( (Nil!2700) (Cons!2699 (h!3341 (_ BitVec 64)) (t!7634 List!2703)) )
))
(declare-fun arrayNoDuplicates!0 (array!9063 (_ BitVec 32) List!2703) Bool)

(assert (=> b!201727 (= res!96470 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2700))))

(declare-fun b!201728 () Bool)

(declare-fun e!132188 () Bool)

(assert (=> b!201728 (= e!132193 (not e!132188))))

(declare-fun res!96467 () Bool)

(assert (=> b!201728 (=> res!96467 e!132188)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201728 (= res!96467 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6203 0))(
  ( (V!6204 (val!2503 Int)) )
))
(declare-datatypes ((ValueCell!2115 0))(
  ( (ValueCellFull!2115 (v!4473 V!6203)) (EmptyCell!2115) )
))
(declare-datatypes ((array!9065 0))(
  ( (array!9066 (arr!4283 (Array (_ BitVec 32) ValueCell!2115)) (size!4608 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9065)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3792 0))(
  ( (tuple2!3793 (_1!1907 (_ BitVec 64)) (_2!1907 V!6203)) )
))
(declare-datatypes ((List!2704 0))(
  ( (Nil!2701) (Cons!2700 (h!3342 tuple2!3792) (t!7635 List!2704)) )
))
(declare-datatypes ((ListLongMap!2705 0))(
  ( (ListLongMap!2706 (toList!1368 List!2704)) )
))
(declare-fun lt!100765 () ListLongMap!2705)

(declare-fun zeroValue!615 () V!6203)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6203)

(declare-fun getCurrentListMap!955 (array!9063 array!9065 (_ BitVec 32) (_ BitVec 32) V!6203 V!6203 (_ BitVec 32) Int) ListLongMap!2705)

(assert (=> b!201728 (= lt!100765 (getCurrentListMap!955 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100754 () array!9065)

(declare-fun lt!100760 () ListLongMap!2705)

(assert (=> b!201728 (= lt!100760 (getCurrentListMap!955 _keys!825 lt!100754 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100753 () ListLongMap!2705)

(declare-fun lt!100759 () ListLongMap!2705)

(assert (=> b!201728 (and (= lt!100753 lt!100759) (= lt!100759 lt!100753))))

(declare-fun lt!100763 () ListLongMap!2705)

(declare-fun lt!100766 () tuple2!3792)

(declare-fun +!395 (ListLongMap!2705 tuple2!3792) ListLongMap!2705)

(assert (=> b!201728 (= lt!100759 (+!395 lt!100763 lt!100766))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6203)

(assert (=> b!201728 (= lt!100766 (tuple2!3793 k0!843 v!520))))

(declare-datatypes ((Unit!6090 0))(
  ( (Unit!6091) )
))
(declare-fun lt!100752 () Unit!6090)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!68 (array!9063 array!9065 (_ BitVec 32) (_ BitVec 32) V!6203 V!6203 (_ BitVec 32) (_ BitVec 64) V!6203 (_ BitVec 32) Int) Unit!6090)

(assert (=> b!201728 (= lt!100752 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!68 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!329 (array!9063 array!9065 (_ BitVec 32) (_ BitVec 32) V!6203 V!6203 (_ BitVec 32) Int) ListLongMap!2705)

(assert (=> b!201728 (= lt!100753 (getCurrentListMapNoExtraKeys!329 _keys!825 lt!100754 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201728 (= lt!100754 (array!9066 (store (arr!4283 _values!649) i!601 (ValueCellFull!2115 v!520)) (size!4608 _values!649)))))

(assert (=> b!201728 (= lt!100763 (getCurrentListMapNoExtraKeys!329 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201729 () Bool)

(declare-fun e!132194 () Bool)

(declare-fun tp_is_empty!4917 () Bool)

(assert (=> b!201729 (= e!132194 tp_is_empty!4917)))

(declare-fun res!96472 () Bool)

(assert (=> start!20402 (=> (not res!96472) (not e!132193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20402 (= res!96472 (validMask!0 mask!1149))))

(assert (=> start!20402 e!132193))

(declare-fun e!132190 () Bool)

(declare-fun array_inv!2827 (array!9065) Bool)

(assert (=> start!20402 (and (array_inv!2827 _values!649) e!132190)))

(assert (=> start!20402 true))

(assert (=> start!20402 tp_is_empty!4917))

(declare-fun array_inv!2828 (array!9063) Bool)

(assert (=> start!20402 (array_inv!2828 _keys!825)))

(assert (=> start!20402 tp!18214))

(declare-fun b!201730 () Bool)

(declare-fun e!132189 () Bool)

(assert (=> b!201730 (= e!132188 e!132189)))

(declare-fun res!96471 () Bool)

(assert (=> b!201730 (=> res!96471 e!132189)))

(assert (=> b!201730 (= res!96471 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100762 () ListLongMap!2705)

(declare-fun lt!100767 () ListLongMap!2705)

(assert (=> b!201730 (= lt!100762 lt!100767)))

(declare-fun lt!100756 () ListLongMap!2705)

(assert (=> b!201730 (= lt!100767 (+!395 lt!100756 lt!100766))))

(declare-fun lt!100764 () Unit!6090)

(declare-fun addCommutativeForDiffKeys!116 (ListLongMap!2705 (_ BitVec 64) V!6203 (_ BitVec 64) V!6203) Unit!6090)

(assert (=> b!201730 (= lt!100764 (addCommutativeForDiffKeys!116 lt!100763 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100757 () tuple2!3792)

(assert (=> b!201730 (= lt!100760 (+!395 lt!100762 lt!100757))))

(declare-fun lt!100755 () tuple2!3792)

(assert (=> b!201730 (= lt!100762 (+!395 lt!100759 lt!100755))))

(declare-fun lt!100758 () ListLongMap!2705)

(assert (=> b!201730 (= lt!100765 lt!100758)))

(assert (=> b!201730 (= lt!100758 (+!395 lt!100756 lt!100757))))

(assert (=> b!201730 (= lt!100756 (+!395 lt!100763 lt!100755))))

(assert (=> b!201730 (= lt!100760 (+!395 (+!395 lt!100753 lt!100755) lt!100757))))

(assert (=> b!201730 (= lt!100757 (tuple2!3793 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201730 (= lt!100755 (tuple2!3793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201731 () Bool)

(declare-fun res!96473 () Bool)

(assert (=> b!201731 (=> (not res!96473) (not e!132193))))

(assert (=> b!201731 (= res!96473 (= (select (arr!4282 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8444 () Bool)

(declare-fun mapRes!8444 () Bool)

(declare-fun tp!18215 () Bool)

(declare-fun e!132191 () Bool)

(assert (=> mapNonEmpty!8444 (= mapRes!8444 (and tp!18215 e!132191))))

(declare-fun mapRest!8444 () (Array (_ BitVec 32) ValueCell!2115))

(declare-fun mapValue!8444 () ValueCell!2115)

(declare-fun mapKey!8444 () (_ BitVec 32))

(assert (=> mapNonEmpty!8444 (= (arr!4283 _values!649) (store mapRest!8444 mapKey!8444 mapValue!8444))))

(declare-fun b!201732 () Bool)

(declare-fun res!96475 () Bool)

(assert (=> b!201732 (=> (not res!96475) (not e!132193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201732 (= res!96475 (validKeyInArray!0 k0!843))))

(declare-fun b!201733 () Bool)

(assert (=> b!201733 (= e!132190 (and e!132194 mapRes!8444))))

(declare-fun condMapEmpty!8444 () Bool)

(declare-fun mapDefault!8444 () ValueCell!2115)

(assert (=> b!201733 (= condMapEmpty!8444 (= (arr!4283 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2115)) mapDefault!8444)))))

(declare-fun b!201734 () Bool)

(assert (=> b!201734 (= e!132189 true)))

(assert (=> b!201734 (= (+!395 lt!100767 lt!100757) (+!395 lt!100758 lt!100766))))

(declare-fun lt!100761 () Unit!6090)

(assert (=> b!201734 (= lt!100761 (addCommutativeForDiffKeys!116 lt!100756 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8444 () Bool)

(assert (=> mapIsEmpty!8444 mapRes!8444))

(declare-fun b!201735 () Bool)

(declare-fun res!96468 () Bool)

(assert (=> b!201735 (=> (not res!96468) (not e!132193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9063 (_ BitVec 32)) Bool)

(assert (=> b!201735 (= res!96468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201736 () Bool)

(assert (=> b!201736 (= e!132191 tp_is_empty!4917)))

(declare-fun b!201737 () Bool)

(declare-fun res!96474 () Bool)

(assert (=> b!201737 (=> (not res!96474) (not e!132193))))

(assert (=> b!201737 (= res!96474 (and (= (size!4608 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4607 _keys!825) (size!4608 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20402 res!96472) b!201737))

(assert (= (and b!201737 res!96474) b!201735))

(assert (= (and b!201735 res!96468) b!201727))

(assert (= (and b!201727 res!96470) b!201726))

(assert (= (and b!201726 res!96469) b!201732))

(assert (= (and b!201732 res!96475) b!201731))

(assert (= (and b!201731 res!96473) b!201728))

(assert (= (and b!201728 (not res!96467)) b!201730))

(assert (= (and b!201730 (not res!96471)) b!201734))

(assert (= (and b!201733 condMapEmpty!8444) mapIsEmpty!8444))

(assert (= (and b!201733 (not condMapEmpty!8444)) mapNonEmpty!8444))

(get-info :version)

(assert (= (and mapNonEmpty!8444 ((_ is ValueCellFull!2115) mapValue!8444)) b!201736))

(assert (= (and b!201733 ((_ is ValueCellFull!2115) mapDefault!8444)) b!201729))

(assert (= start!20402 b!201733))

(declare-fun m!228779 () Bool)

(assert (=> b!201727 m!228779))

(declare-fun m!228781 () Bool)

(assert (=> b!201734 m!228781))

(declare-fun m!228783 () Bool)

(assert (=> b!201734 m!228783))

(declare-fun m!228785 () Bool)

(assert (=> b!201734 m!228785))

(declare-fun m!228787 () Bool)

(assert (=> b!201728 m!228787))

(declare-fun m!228789 () Bool)

(assert (=> b!201728 m!228789))

(declare-fun m!228791 () Bool)

(assert (=> b!201728 m!228791))

(declare-fun m!228793 () Bool)

(assert (=> b!201728 m!228793))

(declare-fun m!228795 () Bool)

(assert (=> b!201728 m!228795))

(declare-fun m!228797 () Bool)

(assert (=> b!201728 m!228797))

(declare-fun m!228799 () Bool)

(assert (=> b!201728 m!228799))

(declare-fun m!228801 () Bool)

(assert (=> start!20402 m!228801))

(declare-fun m!228803 () Bool)

(assert (=> start!20402 m!228803))

(declare-fun m!228805 () Bool)

(assert (=> start!20402 m!228805))

(declare-fun m!228807 () Bool)

(assert (=> b!201731 m!228807))

(declare-fun m!228809 () Bool)

(assert (=> b!201730 m!228809))

(declare-fun m!228811 () Bool)

(assert (=> b!201730 m!228811))

(declare-fun m!228813 () Bool)

(assert (=> b!201730 m!228813))

(declare-fun m!228815 () Bool)

(assert (=> b!201730 m!228815))

(declare-fun m!228817 () Bool)

(assert (=> b!201730 m!228817))

(declare-fun m!228819 () Bool)

(assert (=> b!201730 m!228819))

(declare-fun m!228821 () Bool)

(assert (=> b!201730 m!228821))

(assert (=> b!201730 m!228817))

(declare-fun m!228823 () Bool)

(assert (=> b!201730 m!228823))

(declare-fun m!228825 () Bool)

(assert (=> mapNonEmpty!8444 m!228825))

(declare-fun m!228827 () Bool)

(assert (=> b!201732 m!228827))

(declare-fun m!228829 () Bool)

(assert (=> b!201735 m!228829))

(check-sat (not mapNonEmpty!8444) (not b!201734) (not b_next!5061) (not b!201728) tp_is_empty!4917 (not b!201730) (not start!20402) (not b!201735) (not b!201732) (not b!201727) b_and!11807)
(check-sat b_and!11807 (not b_next!5061))
