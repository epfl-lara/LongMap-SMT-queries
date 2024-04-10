; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89182 () Bool)

(assert start!89182)

(declare-fun b!1022518 () Bool)

(declare-fun b_free!20223 () Bool)

(declare-fun b_next!20223 () Bool)

(assert (=> b!1022518 (= b_free!20223 (not b_next!20223))))

(declare-fun tp!71703 () Bool)

(declare-fun b_and!32429 () Bool)

(assert (=> b!1022518 (= tp!71703 b_and!32429)))

(declare-fun b!1022515 () Bool)

(declare-fun e!576043 () Bool)

(declare-fun e!576040 () Bool)

(declare-fun mapRes!37332 () Bool)

(assert (=> b!1022515 (= e!576043 (and e!576040 mapRes!37332))))

(declare-fun condMapEmpty!37332 () Bool)

(declare-datatypes ((V!36797 0))(
  ( (V!36798 (val!12022 Int)) )
))
(declare-datatypes ((ValueCell!11268 0))(
  ( (ValueCellFull!11268 (v!14591 V!36797)) (EmptyCell!11268) )
))
(declare-datatypes ((array!63930 0))(
  ( (array!63931 (arr!30777 (Array (_ BitVec 32) (_ BitVec 64))) (size!31288 (_ BitVec 32))) )
))
(declare-datatypes ((array!63932 0))(
  ( (array!63933 (arr!30778 (Array (_ BitVec 32) ValueCell!11268)) (size!31289 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5130 0))(
  ( (LongMapFixedSize!5131 (defaultEntry!5917 Int) (mask!29514 (_ BitVec 32)) (extraKeys!5649 (_ BitVec 32)) (zeroValue!5753 V!36797) (minValue!5753 V!36797) (_size!2620 (_ BitVec 32)) (_keys!11062 array!63930) (_values!5940 array!63932) (_vacant!2620 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5130)

(declare-fun mapDefault!37332 () ValueCell!11268)

(assert (=> b!1022515 (= condMapEmpty!37332 (= (arr!30778 (_values!5940 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11268)) mapDefault!37332)))))

(declare-fun mapNonEmpty!37332 () Bool)

(declare-fun tp!71704 () Bool)

(declare-fun e!576044 () Bool)

(assert (=> mapNonEmpty!37332 (= mapRes!37332 (and tp!71704 e!576044))))

(declare-fun mapValue!37332 () ValueCell!11268)

(declare-fun mapKey!37332 () (_ BitVec 32))

(declare-fun mapRest!37332 () (Array (_ BitVec 32) ValueCell!11268))

(assert (=> mapNonEmpty!37332 (= (arr!30778 (_values!5940 thiss!1427)) (store mapRest!37332 mapKey!37332 mapValue!37332))))

(declare-fun b!1022516 () Bool)

(declare-fun e!576045 () Bool)

(assert (=> b!1022516 (= e!576045 (not true))))

(declare-fun lt!450257 () Bool)

(declare-fun lt!450256 () V!36797)

(declare-fun valid!1954 (LongMapFixedSize!5130) Bool)

(assert (=> b!1022516 (= lt!450257 (valid!1954 (LongMapFixedSize!5131 (defaultEntry!5917 thiss!1427) (mask!29514 thiss!1427) (bvand (extraKeys!5649 thiss!1427) #b00000000000000000000000000000010) lt!450256 (minValue!5753 thiss!1427) (_size!2620 thiss!1427) (_keys!11062 thiss!1427) (_values!5940 thiss!1427) (_vacant!2620 thiss!1427))))))

(declare-datatypes ((tuple2!15500 0))(
  ( (tuple2!15501 (_1!7761 (_ BitVec 64)) (_2!7761 V!36797)) )
))
(declare-datatypes ((List!21684 0))(
  ( (Nil!21681) (Cons!21680 (h!22878 tuple2!15500) (t!30708 List!21684)) )
))
(declare-datatypes ((ListLongMap!13641 0))(
  ( (ListLongMap!13642 (toList!6836 List!21684)) )
))
(declare-fun -!463 (ListLongMap!13641 (_ BitVec 64)) ListLongMap!13641)

(declare-fun getCurrentListMap!3884 (array!63930 array!63932 (_ BitVec 32) (_ BitVec 32) V!36797 V!36797 (_ BitVec 32) Int) ListLongMap!13641)

(assert (=> b!1022516 (= (-!463 (getCurrentListMap!3884 (_keys!11062 thiss!1427) (_values!5940 thiss!1427) (mask!29514 thiss!1427) (extraKeys!5649 thiss!1427) (zeroValue!5753 thiss!1427) (minValue!5753 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5917 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3884 (_keys!11062 thiss!1427) (_values!5940 thiss!1427) (mask!29514 thiss!1427) (bvand (extraKeys!5649 thiss!1427) #b00000000000000000000000000000010) lt!450256 (minValue!5753 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5917 thiss!1427)))))

(declare-datatypes ((Unit!33315 0))(
  ( (Unit!33316) )
))
(declare-fun lt!450258 () Unit!33315)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!4 (array!63930 array!63932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36797 V!36797 V!36797 Int) Unit!33315)

(assert (=> b!1022516 (= lt!450258 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!4 (_keys!11062 thiss!1427) (_values!5940 thiss!1427) (mask!29514 thiss!1427) (extraKeys!5649 thiss!1427) (bvand (extraKeys!5649 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5753 thiss!1427) lt!450256 (minValue!5753 thiss!1427) (defaultEntry!5917 thiss!1427)))))

(declare-fun dynLambda!1933 (Int (_ BitVec 64)) V!36797)

(assert (=> b!1022516 (= lt!450256 (dynLambda!1933 (defaultEntry!5917 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37332 () Bool)

(assert (=> mapIsEmpty!37332 mapRes!37332))

(declare-fun b!1022517 () Bool)

(declare-fun tp_is_empty!23943 () Bool)

(assert (=> b!1022517 (= e!576044 tp_is_empty!23943)))

(declare-fun res!684956 () Bool)

(assert (=> start!89182 (=> (not res!684956) (not e!576045))))

(assert (=> start!89182 (= res!684956 (valid!1954 thiss!1427))))

(assert (=> start!89182 e!576045))

(declare-fun e!576041 () Bool)

(assert (=> start!89182 e!576041))

(assert (=> start!89182 true))

(declare-fun array_inv!23857 (array!63930) Bool)

(declare-fun array_inv!23858 (array!63932) Bool)

(assert (=> b!1022518 (= e!576041 (and tp!71703 tp_is_empty!23943 (array_inv!23857 (_keys!11062 thiss!1427)) (array_inv!23858 (_values!5940 thiss!1427)) e!576043))))

(declare-fun b!1022519 () Bool)

(declare-fun res!684955 () Bool)

(assert (=> b!1022519 (=> (not res!684955) (not e!576045))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022519 (= res!684955 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022520 () Bool)

(assert (=> b!1022520 (= e!576040 tp_is_empty!23943)))

(assert (= (and start!89182 res!684956) b!1022519))

(assert (= (and b!1022519 res!684955) b!1022516))

(assert (= (and b!1022515 condMapEmpty!37332) mapIsEmpty!37332))

(assert (= (and b!1022515 (not condMapEmpty!37332)) mapNonEmpty!37332))

(get-info :version)

(assert (= (and mapNonEmpty!37332 ((_ is ValueCellFull!11268) mapValue!37332)) b!1022517))

(assert (= (and b!1022515 ((_ is ValueCellFull!11268) mapDefault!37332)) b!1022520))

(assert (= b!1022518 b!1022515))

(assert (= start!89182 b!1022518))

(declare-fun b_lambda!15679 () Bool)

(assert (=> (not b_lambda!15679) (not b!1022516)))

(declare-fun t!30707 () Bool)

(declare-fun tb!6847 () Bool)

(assert (=> (and b!1022518 (= (defaultEntry!5917 thiss!1427) (defaultEntry!5917 thiss!1427)) t!30707) tb!6847))

(declare-fun result!14003 () Bool)

(assert (=> tb!6847 (= result!14003 tp_is_empty!23943)))

(assert (=> b!1022516 t!30707))

(declare-fun b_and!32431 () Bool)

(assert (= b_and!32429 (and (=> t!30707 result!14003) b_and!32431)))

(declare-fun m!941569 () Bool)

(assert (=> mapNonEmpty!37332 m!941569))

(declare-fun m!941571 () Bool)

(assert (=> b!1022516 m!941571))

(declare-fun m!941573 () Bool)

(assert (=> b!1022516 m!941573))

(declare-fun m!941575 () Bool)

(assert (=> b!1022516 m!941575))

(declare-fun m!941577 () Bool)

(assert (=> b!1022516 m!941577))

(declare-fun m!941579 () Bool)

(assert (=> b!1022516 m!941579))

(declare-fun m!941581 () Bool)

(assert (=> b!1022516 m!941581))

(assert (=> b!1022516 m!941579))

(declare-fun m!941583 () Bool)

(assert (=> start!89182 m!941583))

(declare-fun m!941585 () Bool)

(assert (=> b!1022518 m!941585))

(declare-fun m!941587 () Bool)

(assert (=> b!1022518 m!941587))

(check-sat tp_is_empty!23943 (not b_next!20223) (not mapNonEmpty!37332) b_and!32431 (not start!89182) (not b!1022518) (not b_lambda!15679) (not b!1022516))
(check-sat b_and!32431 (not b_next!20223))
