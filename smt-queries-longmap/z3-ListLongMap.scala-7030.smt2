; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89426 () Bool)

(assert start!89426)

(declare-fun b!1023933 () Bool)

(declare-fun b_free!20233 () Bool)

(declare-fun b_next!20233 () Bool)

(assert (=> b!1023933 (= b_free!20233 (not b_next!20233))))

(declare-fun tp!71734 () Bool)

(declare-fun b_and!32459 () Bool)

(assert (=> b!1023933 (= tp!71734 b_and!32459)))

(declare-fun res!685495 () Bool)

(declare-fun e!576976 () Bool)

(assert (=> start!89426 (=> (not res!685495) (not e!576976))))

(declare-datatypes ((V!36811 0))(
  ( (V!36812 (val!12027 Int)) )
))
(declare-datatypes ((ValueCell!11273 0))(
  ( (ValueCellFull!11273 (v!14592 V!36811)) (EmptyCell!11273) )
))
(declare-datatypes ((array!63999 0))(
  ( (array!64000 (arr!30805 (Array (_ BitVec 32) (_ BitVec 64))) (size!31317 (_ BitVec 32))) )
))
(declare-datatypes ((array!64001 0))(
  ( (array!64002 (arr!30806 (Array (_ BitVec 32) ValueCell!11273)) (size!31318 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5140 0))(
  ( (LongMapFixedSize!5141 (defaultEntry!5922 Int) (mask!29583 (_ BitVec 32)) (extraKeys!5654 (_ BitVec 32)) (zeroValue!5758 V!36811) (minValue!5758 V!36811) (_size!2625 (_ BitVec 32)) (_keys!11105 array!63999) (_values!5945 array!64001) (_vacant!2625 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5140)

(declare-fun valid!1964 (LongMapFixedSize!5140) Bool)

(assert (=> start!89426 (= res!685495 (valid!1964 thiss!1427))))

(assert (=> start!89426 e!576976))

(declare-fun e!576974 () Bool)

(assert (=> start!89426 e!576974))

(assert (=> start!89426 true))

(declare-fun b!1023930 () Bool)

(declare-fun e!576977 () Bool)

(declare-fun tp_is_empty!23953 () Bool)

(assert (=> b!1023930 (= e!576977 tp_is_empty!23953)))

(declare-fun b!1023931 () Bool)

(declare-fun e!576975 () Bool)

(assert (=> b!1023931 (= e!576975 tp_is_empty!23953)))

(declare-fun b!1023932 () Bool)

(declare-fun e!576978 () Bool)

(declare-fun mapRes!37347 () Bool)

(assert (=> b!1023932 (= e!576978 (and e!576977 mapRes!37347))))

(declare-fun condMapEmpty!37347 () Bool)

(declare-fun mapDefault!37347 () ValueCell!11273)

(assert (=> b!1023932 (= condMapEmpty!37347 (= (arr!30806 (_values!5945 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11273)) mapDefault!37347)))))

(declare-fun array_inv!23895 (array!63999) Bool)

(declare-fun array_inv!23896 (array!64001) Bool)

(assert (=> b!1023933 (= e!576974 (and tp!71734 tp_is_empty!23953 (array_inv!23895 (_keys!11105 thiss!1427)) (array_inv!23896 (_values!5945 thiss!1427)) e!576978))))

(declare-fun b!1023934 () Bool)

(declare-fun res!685496 () Bool)

(assert (=> b!1023934 (=> (not res!685496) (not e!576976))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023934 (= res!685496 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023935 () Bool)

(assert (=> b!1023935 (= e!576976 (not true))))

(declare-fun lt!450816 () Bool)

(declare-fun lt!450818 () V!36811)

(assert (=> b!1023935 (= lt!450816 (valid!1964 (LongMapFixedSize!5141 (defaultEntry!5922 thiss!1427) (mask!29583 thiss!1427) (bvand (extraKeys!5654 thiss!1427) #b00000000000000000000000000000010) lt!450818 (minValue!5758 thiss!1427) (_size!2625 thiss!1427) (_keys!11105 thiss!1427) (_values!5945 thiss!1427) (_vacant!2625 thiss!1427))))))

(declare-datatypes ((tuple2!15510 0))(
  ( (tuple2!15511 (_1!7766 (_ BitVec 64)) (_2!7766 V!36811)) )
))
(declare-datatypes ((List!21676 0))(
  ( (Nil!21673) (Cons!21672 (h!22879 tuple2!15510) (t!30702 List!21676)) )
))
(declare-datatypes ((ListLongMap!13655 0))(
  ( (ListLongMap!13656 (toList!6843 List!21676)) )
))
(declare-fun -!466 (ListLongMap!13655 (_ BitVec 64)) ListLongMap!13655)

(declare-fun getCurrentListMap!3889 (array!63999 array!64001 (_ BitVec 32) (_ BitVec 32) V!36811 V!36811 (_ BitVec 32) Int) ListLongMap!13655)

(assert (=> b!1023935 (= (-!466 (getCurrentListMap!3889 (_keys!11105 thiss!1427) (_values!5945 thiss!1427) (mask!29583 thiss!1427) (extraKeys!5654 thiss!1427) (zeroValue!5758 thiss!1427) (minValue!5758 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5922 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3889 (_keys!11105 thiss!1427) (_values!5945 thiss!1427) (mask!29583 thiss!1427) (bvand (extraKeys!5654 thiss!1427) #b00000000000000000000000000000010) lt!450818 (minValue!5758 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5922 thiss!1427)))))

(declare-datatypes ((Unit!33326 0))(
  ( (Unit!33327) )
))
(declare-fun lt!450817 () Unit!33326)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!9 (array!63999 array!64001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36811 V!36811 V!36811 Int) Unit!33326)

(assert (=> b!1023935 (= lt!450817 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!9 (_keys!11105 thiss!1427) (_values!5945 thiss!1427) (mask!29583 thiss!1427) (extraKeys!5654 thiss!1427) (bvand (extraKeys!5654 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5758 thiss!1427) lt!450818 (minValue!5758 thiss!1427) (defaultEntry!5922 thiss!1427)))))

(declare-fun dynLambda!1960 (Int (_ BitVec 64)) V!36811)

(assert (=> b!1023935 (= lt!450818 (dynLambda!1960 (defaultEntry!5922 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37347 () Bool)

(declare-fun tp!71733 () Bool)

(assert (=> mapNonEmpty!37347 (= mapRes!37347 (and tp!71733 e!576975))))

(declare-fun mapValue!37347 () ValueCell!11273)

(declare-fun mapKey!37347 () (_ BitVec 32))

(declare-fun mapRest!37347 () (Array (_ BitVec 32) ValueCell!11273))

(assert (=> mapNonEmpty!37347 (= (arr!30806 (_values!5945 thiss!1427)) (store mapRest!37347 mapKey!37347 mapValue!37347))))

(declare-fun mapIsEmpty!37347 () Bool)

(assert (=> mapIsEmpty!37347 mapRes!37347))

(assert (= (and start!89426 res!685495) b!1023934))

(assert (= (and b!1023934 res!685496) b!1023935))

(assert (= (and b!1023932 condMapEmpty!37347) mapIsEmpty!37347))

(assert (= (and b!1023932 (not condMapEmpty!37347)) mapNonEmpty!37347))

(get-info :version)

(assert (= (and mapNonEmpty!37347 ((_ is ValueCellFull!11273) mapValue!37347)) b!1023931))

(assert (= (and b!1023932 ((_ is ValueCellFull!11273) mapDefault!37347)) b!1023930))

(assert (= b!1023933 b!1023932))

(assert (= start!89426 b!1023933))

(declare-fun b_lambda!15699 () Bool)

(assert (=> (not b_lambda!15699) (not b!1023935)))

(declare-fun t!30701 () Bool)

(declare-fun tb!6849 () Bool)

(assert (=> (and b!1023933 (= (defaultEntry!5922 thiss!1427) (defaultEntry!5922 thiss!1427)) t!30701) tb!6849))

(declare-fun result!14015 () Bool)

(assert (=> tb!6849 (= result!14015 tp_is_empty!23953)))

(assert (=> b!1023935 t!30701))

(declare-fun b_and!32461 () Bool)

(assert (= b_and!32459 (and (=> t!30701 result!14015) b_and!32461)))

(declare-fun m!943333 () Bool)

(assert (=> start!89426 m!943333))

(declare-fun m!943335 () Bool)

(assert (=> b!1023933 m!943335))

(declare-fun m!943337 () Bool)

(assert (=> b!1023933 m!943337))

(declare-fun m!943339 () Bool)

(assert (=> b!1023935 m!943339))

(declare-fun m!943341 () Bool)

(assert (=> b!1023935 m!943341))

(declare-fun m!943343 () Bool)

(assert (=> b!1023935 m!943343))

(declare-fun m!943345 () Bool)

(assert (=> b!1023935 m!943345))

(declare-fun m!943347 () Bool)

(assert (=> b!1023935 m!943347))

(declare-fun m!943349 () Bool)

(assert (=> b!1023935 m!943349))

(assert (=> b!1023935 m!943347))

(declare-fun m!943351 () Bool)

(assert (=> mapNonEmpty!37347 m!943351))

(check-sat (not mapNonEmpty!37347) (not b!1023935) (not b_next!20233) b_and!32461 tp_is_empty!23953 (not start!89426) (not b!1023933) (not b_lambda!15699))
(check-sat b_and!32461 (not b_next!20233))
