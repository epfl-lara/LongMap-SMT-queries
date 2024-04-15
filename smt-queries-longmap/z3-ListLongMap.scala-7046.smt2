; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89286 () Bool)

(assert start!89286)

(declare-fun b!1023680 () Bool)

(declare-fun b_free!20329 () Bool)

(declare-fun b_next!20329 () Bool)

(assert (=> b!1023680 (= b_free!20329 (not b_next!20329))))

(declare-fun tp!72022 () Bool)

(declare-fun b_and!32543 () Bool)

(assert (=> b!1023680 (= tp!72022 b_and!32543)))

(declare-fun b!1023676 () Bool)

(declare-fun e!576907 () Bool)

(declare-fun e!576904 () Bool)

(declare-fun mapRes!37491 () Bool)

(assert (=> b!1023676 (= e!576907 (and e!576904 mapRes!37491))))

(declare-fun condMapEmpty!37491 () Bool)

(declare-datatypes ((V!36939 0))(
  ( (V!36940 (val!12075 Int)) )
))
(declare-datatypes ((ValueCell!11321 0))(
  ( (ValueCellFull!11321 (v!14643 V!36939)) (EmptyCell!11321) )
))
(declare-datatypes ((array!64081 0))(
  ( (array!64082 (arr!30852 (Array (_ BitVec 32) (_ BitVec 64))) (size!31365 (_ BitVec 32))) )
))
(declare-datatypes ((array!64083 0))(
  ( (array!64084 (arr!30853 (Array (_ BitVec 32) ValueCell!11321)) (size!31366 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5236 0))(
  ( (LongMapFixedSize!5237 (defaultEntry!5970 Int) (mask!29598 (_ BitVec 32)) (extraKeys!5702 (_ BitVec 32)) (zeroValue!5806 V!36939) (minValue!5806 V!36939) (_size!2673 (_ BitVec 32)) (_keys!11111 array!64081) (_values!5993 array!64083) (_vacant!2673 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5236)

(declare-fun mapDefault!37491 () ValueCell!11321)

(assert (=> b!1023676 (= condMapEmpty!37491 (= (arr!30853 (_values!5993 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11321)) mapDefault!37491)))))

(declare-fun mapIsEmpty!37491 () Bool)

(assert (=> mapIsEmpty!37491 mapRes!37491))

(declare-fun mapNonEmpty!37491 () Bool)

(declare-fun tp!72021 () Bool)

(declare-fun e!576905 () Bool)

(assert (=> mapNonEmpty!37491 (= mapRes!37491 (and tp!72021 e!576905))))

(declare-fun mapValue!37491 () ValueCell!11321)

(declare-fun mapKey!37491 () (_ BitVec 32))

(declare-fun mapRest!37491 () (Array (_ BitVec 32) ValueCell!11321))

(assert (=> mapNonEmpty!37491 (= (arr!30853 (_values!5993 thiss!1427)) (store mapRest!37491 mapKey!37491 mapValue!37491))))

(declare-fun b!1023677 () Bool)

(declare-fun tp_is_empty!24049 () Bool)

(assert (=> b!1023677 (= e!576905 tp_is_empty!24049)))

(declare-fun b!1023678 () Bool)

(declare-fun res!685531 () Bool)

(declare-fun e!576908 () Bool)

(assert (=> b!1023678 (=> (not res!685531) (not e!576908))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023678 (= res!685531 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023679 () Bool)

(assert (=> b!1023679 (= e!576904 tp_is_empty!24049)))

(declare-fun e!576906 () Bool)

(declare-fun array_inv!23917 (array!64081) Bool)

(declare-fun array_inv!23918 (array!64083) Bool)

(assert (=> b!1023680 (= e!576906 (and tp!72022 tp_is_empty!24049 (array_inv!23917 (_keys!11111 thiss!1427)) (array_inv!23918 (_values!5993 thiss!1427)) e!576907))))

(declare-fun res!685530 () Bool)

(assert (=> start!89286 (=> (not res!685530) (not e!576908))))

(declare-fun valid!1991 (LongMapFixedSize!5236) Bool)

(assert (=> start!89286 (= res!685530 (valid!1991 thiss!1427))))

(assert (=> start!89286 e!576908))

(assert (=> start!89286 e!576906))

(assert (=> start!89286 true))

(declare-fun b!1023681 () Bool)

(assert (=> b!1023681 (= e!576908 (not true))))

(declare-fun lt!450319 () Bool)

(declare-fun lt!450317 () V!36939)

(assert (=> b!1023681 (= lt!450319 (valid!1991 (LongMapFixedSize!5237 (defaultEntry!5970 thiss!1427) (mask!29598 thiss!1427) (bvand (extraKeys!5702 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5806 thiss!1427) lt!450317 (_size!2673 thiss!1427) (_keys!11111 thiss!1427) (_values!5993 thiss!1427) (_vacant!2673 thiss!1427))))))

(declare-datatypes ((tuple2!15604 0))(
  ( (tuple2!15605 (_1!7813 (_ BitVec 64)) (_2!7813 V!36939)) )
))
(declare-datatypes ((List!21753 0))(
  ( (Nil!21750) (Cons!21749 (h!22947 tuple2!15604) (t!30802 List!21753)) )
))
(declare-datatypes ((ListLongMap!13737 0))(
  ( (ListLongMap!13738 (toList!6884 List!21753)) )
))
(declare-fun -!476 (ListLongMap!13737 (_ BitVec 64)) ListLongMap!13737)

(declare-fun getCurrentListMap!3851 (array!64081 array!64083 (_ BitVec 32) (_ BitVec 32) V!36939 V!36939 (_ BitVec 32) Int) ListLongMap!13737)

(assert (=> b!1023681 (= (-!476 (getCurrentListMap!3851 (_keys!11111 thiss!1427) (_values!5993 thiss!1427) (mask!29598 thiss!1427) (extraKeys!5702 thiss!1427) (zeroValue!5806 thiss!1427) (minValue!5806 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5970 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3851 (_keys!11111 thiss!1427) (_values!5993 thiss!1427) (mask!29598 thiss!1427) (bvand (extraKeys!5702 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5806 thiss!1427) lt!450317 #b00000000000000000000000000000000 (defaultEntry!5970 thiss!1427)))))

(declare-datatypes ((Unit!33237 0))(
  ( (Unit!33238) )
))
(declare-fun lt!450318 () Unit!33237)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!8 (array!64081 array!64083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36939 V!36939 V!36939 Int) Unit!33237)

(assert (=> b!1023681 (= lt!450318 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!8 (_keys!11111 thiss!1427) (_values!5993 thiss!1427) (mask!29598 thiss!1427) (extraKeys!5702 thiss!1427) (bvand (extraKeys!5702 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5806 thiss!1427) (minValue!5806 thiss!1427) lt!450317 (defaultEntry!5970 thiss!1427)))))

(declare-fun dynLambda!1938 (Int (_ BitVec 64)) V!36939)

(assert (=> b!1023681 (= lt!450317 (dynLambda!1938 (defaultEntry!5970 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89286 res!685530) b!1023678))

(assert (= (and b!1023678 res!685531) b!1023681))

(assert (= (and b!1023676 condMapEmpty!37491) mapIsEmpty!37491))

(assert (= (and b!1023676 (not condMapEmpty!37491)) mapNonEmpty!37491))

(get-info :version)

(assert (= (and mapNonEmpty!37491 ((_ is ValueCellFull!11321) mapValue!37491)) b!1023677))

(assert (= (and b!1023676 ((_ is ValueCellFull!11321) mapDefault!37491)) b!1023679))

(assert (= b!1023680 b!1023676))

(assert (= start!89286 b!1023680))

(declare-fun b_lambda!15691 () Bool)

(assert (=> (not b_lambda!15691) (not b!1023681)))

(declare-fun t!30801 () Bool)

(declare-fun tb!6873 () Bool)

(assert (=> (and b!1023680 (= (defaultEntry!5970 thiss!1427) (defaultEntry!5970 thiss!1427)) t!30801) tb!6873))

(declare-fun result!14063 () Bool)

(assert (=> tb!6873 (= result!14063 tp_is_empty!24049)))

(assert (=> b!1023681 t!30801))

(declare-fun b_and!32545 () Bool)

(assert (= b_and!32543 (and (=> t!30801 result!14063) b_and!32545)))

(declare-fun m!941793 () Bool)

(assert (=> mapNonEmpty!37491 m!941793))

(declare-fun m!941795 () Bool)

(assert (=> b!1023680 m!941795))

(declare-fun m!941797 () Bool)

(assert (=> b!1023680 m!941797))

(declare-fun m!941799 () Bool)

(assert (=> start!89286 m!941799))

(declare-fun m!941801 () Bool)

(assert (=> b!1023681 m!941801))

(declare-fun m!941803 () Bool)

(assert (=> b!1023681 m!941803))

(declare-fun m!941805 () Bool)

(assert (=> b!1023681 m!941805))

(declare-fun m!941807 () Bool)

(assert (=> b!1023681 m!941807))

(declare-fun m!941809 () Bool)

(assert (=> b!1023681 m!941809))

(declare-fun m!941811 () Bool)

(assert (=> b!1023681 m!941811))

(assert (=> b!1023681 m!941807))

(check-sat (not mapNonEmpty!37491) (not start!89286) b_and!32545 (not b_lambda!15691) (not b!1023680) (not b!1023681) tp_is_empty!24049 (not b_next!20329))
(check-sat b_and!32545 (not b_next!20329))
