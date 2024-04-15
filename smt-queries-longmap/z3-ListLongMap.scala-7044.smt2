; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89274 () Bool)

(assert start!89274)

(declare-fun b!1023560 () Bool)

(declare-fun b_free!20317 () Bool)

(declare-fun b_next!20317 () Bool)

(assert (=> b!1023560 (= b_free!20317 (not b_next!20317))))

(declare-fun tp!71985 () Bool)

(declare-fun b_and!32519 () Bool)

(assert (=> b!1023560 (= tp!71985 b_and!32519)))

(declare-fun b!1023556 () Bool)

(declare-fun e!576800 () Bool)

(declare-fun e!576796 () Bool)

(declare-fun mapRes!37473 () Bool)

(assert (=> b!1023556 (= e!576800 (and e!576796 mapRes!37473))))

(declare-fun condMapEmpty!37473 () Bool)

(declare-datatypes ((V!36923 0))(
  ( (V!36924 (val!12069 Int)) )
))
(declare-datatypes ((ValueCell!11315 0))(
  ( (ValueCellFull!11315 (v!14637 V!36923)) (EmptyCell!11315) )
))
(declare-datatypes ((array!64057 0))(
  ( (array!64058 (arr!30840 (Array (_ BitVec 32) (_ BitVec 64))) (size!31353 (_ BitVec 32))) )
))
(declare-datatypes ((array!64059 0))(
  ( (array!64060 (arr!30841 (Array (_ BitVec 32) ValueCell!11315)) (size!31354 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5224 0))(
  ( (LongMapFixedSize!5225 (defaultEntry!5964 Int) (mask!29588 (_ BitVec 32)) (extraKeys!5696 (_ BitVec 32)) (zeroValue!5800 V!36923) (minValue!5800 V!36923) (_size!2667 (_ BitVec 32)) (_keys!11105 array!64057) (_values!5987 array!64059) (_vacant!2667 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5224)

(declare-fun mapDefault!37473 () ValueCell!11315)

(assert (=> b!1023556 (= condMapEmpty!37473 (= (arr!30841 (_values!5987 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11315)) mapDefault!37473)))))

(declare-fun b!1023557 () Bool)

(declare-fun e!576797 () Bool)

(declare-fun tp_is_empty!24037 () Bool)

(assert (=> b!1023557 (= e!576797 tp_is_empty!24037)))

(declare-fun b!1023558 () Bool)

(assert (=> b!1023558 (= e!576796 tp_is_empty!24037)))

(declare-fun res!685495 () Bool)

(declare-fun e!576795 () Bool)

(assert (=> start!89274 (=> (not res!685495) (not e!576795))))

(declare-fun valid!1987 (LongMapFixedSize!5224) Bool)

(assert (=> start!89274 (= res!685495 (valid!1987 thiss!1427))))

(assert (=> start!89274 e!576795))

(declare-fun e!576798 () Bool)

(assert (=> start!89274 e!576798))

(assert (=> start!89274 true))

(declare-fun b!1023559 () Bool)

(declare-fun res!685494 () Bool)

(assert (=> b!1023559 (=> (not res!685494) (not e!576795))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023559 (= res!685494 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!37473 () Bool)

(assert (=> mapIsEmpty!37473 mapRes!37473))

(declare-fun array_inv!23909 (array!64057) Bool)

(declare-fun array_inv!23910 (array!64059) Bool)

(assert (=> b!1023560 (= e!576798 (and tp!71985 tp_is_empty!24037 (array_inv!23909 (_keys!11105 thiss!1427)) (array_inv!23910 (_values!5987 thiss!1427)) e!576800))))

(declare-fun b!1023561 () Bool)

(assert (=> b!1023561 (= e!576795 (not true))))

(declare-fun lt!450263 () Bool)

(declare-fun lt!450264 () V!36923)

(assert (=> b!1023561 (= lt!450263 (valid!1987 (LongMapFixedSize!5225 (defaultEntry!5964 thiss!1427) (mask!29588 thiss!1427) (bvand (extraKeys!5696 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5800 thiss!1427) lt!450264 (_size!2667 thiss!1427) (_keys!11105 thiss!1427) (_values!5987 thiss!1427) (_vacant!2667 thiss!1427))))))

(declare-datatypes ((tuple2!15596 0))(
  ( (tuple2!15597 (_1!7809 (_ BitVec 64)) (_2!7809 V!36923)) )
))
(declare-datatypes ((List!21749 0))(
  ( (Nil!21746) (Cons!21745 (h!22943 tuple2!15596) (t!30786 List!21749)) )
))
(declare-datatypes ((ListLongMap!13729 0))(
  ( (ListLongMap!13730 (toList!6880 List!21749)) )
))
(declare-fun -!472 (ListLongMap!13729 (_ BitVec 64)) ListLongMap!13729)

(declare-fun getCurrentListMap!3847 (array!64057 array!64059 (_ BitVec 32) (_ BitVec 32) V!36923 V!36923 (_ BitVec 32) Int) ListLongMap!13729)

(assert (=> b!1023561 (= (-!472 (getCurrentListMap!3847 (_keys!11105 thiss!1427) (_values!5987 thiss!1427) (mask!29588 thiss!1427) (extraKeys!5696 thiss!1427) (zeroValue!5800 thiss!1427) (minValue!5800 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5964 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3847 (_keys!11105 thiss!1427) (_values!5987 thiss!1427) (mask!29588 thiss!1427) (bvand (extraKeys!5696 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5800 thiss!1427) lt!450264 #b00000000000000000000000000000000 (defaultEntry!5964 thiss!1427)))))

(declare-datatypes ((Unit!33229 0))(
  ( (Unit!33230) )
))
(declare-fun lt!450265 () Unit!33229)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!4 (array!64057 array!64059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36923 V!36923 V!36923 Int) Unit!33229)

(assert (=> b!1023561 (= lt!450265 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!4 (_keys!11105 thiss!1427) (_values!5987 thiss!1427) (mask!29588 thiss!1427) (extraKeys!5696 thiss!1427) (bvand (extraKeys!5696 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5800 thiss!1427) (minValue!5800 thiss!1427) lt!450264 (defaultEntry!5964 thiss!1427)))))

(declare-fun dynLambda!1934 (Int (_ BitVec 64)) V!36923)

(assert (=> b!1023561 (= lt!450264 (dynLambda!1934 (defaultEntry!5964 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37473 () Bool)

(declare-fun tp!71986 () Bool)

(assert (=> mapNonEmpty!37473 (= mapRes!37473 (and tp!71986 e!576797))))

(declare-fun mapValue!37473 () ValueCell!11315)

(declare-fun mapRest!37473 () (Array (_ BitVec 32) ValueCell!11315))

(declare-fun mapKey!37473 () (_ BitVec 32))

(assert (=> mapNonEmpty!37473 (= (arr!30841 (_values!5987 thiss!1427)) (store mapRest!37473 mapKey!37473 mapValue!37473))))

(assert (= (and start!89274 res!685495) b!1023559))

(assert (= (and b!1023559 res!685494) b!1023561))

(assert (= (and b!1023556 condMapEmpty!37473) mapIsEmpty!37473))

(assert (= (and b!1023556 (not condMapEmpty!37473)) mapNonEmpty!37473))

(get-info :version)

(assert (= (and mapNonEmpty!37473 ((_ is ValueCellFull!11315) mapValue!37473)) b!1023557))

(assert (= (and b!1023556 ((_ is ValueCellFull!11315) mapDefault!37473)) b!1023558))

(assert (= b!1023560 b!1023556))

(assert (= start!89274 b!1023560))

(declare-fun b_lambda!15679 () Bool)

(assert (=> (not b_lambda!15679) (not b!1023561)))

(declare-fun t!30785 () Bool)

(declare-fun tb!6861 () Bool)

(assert (=> (and b!1023560 (= (defaultEntry!5964 thiss!1427) (defaultEntry!5964 thiss!1427)) t!30785) tb!6861))

(declare-fun result!14039 () Bool)

(assert (=> tb!6861 (= result!14039 tp_is_empty!24037)))

(assert (=> b!1023561 t!30785))

(declare-fun b_and!32521 () Bool)

(assert (= b_and!32519 (and (=> t!30785 result!14039) b_and!32521)))

(declare-fun m!941673 () Bool)

(assert (=> start!89274 m!941673))

(declare-fun m!941675 () Bool)

(assert (=> b!1023560 m!941675))

(declare-fun m!941677 () Bool)

(assert (=> b!1023560 m!941677))

(declare-fun m!941679 () Bool)

(assert (=> b!1023561 m!941679))

(declare-fun m!941681 () Bool)

(assert (=> b!1023561 m!941681))

(declare-fun m!941683 () Bool)

(assert (=> b!1023561 m!941683))

(declare-fun m!941685 () Bool)

(assert (=> b!1023561 m!941685))

(assert (=> b!1023561 m!941683))

(declare-fun m!941687 () Bool)

(assert (=> b!1023561 m!941687))

(declare-fun m!941689 () Bool)

(assert (=> b!1023561 m!941689))

(declare-fun m!941691 () Bool)

(assert (=> mapNonEmpty!37473 m!941691))

(check-sat (not b!1023560) tp_is_empty!24037 b_and!32521 (not b!1023561) (not mapNonEmpty!37473) (not b_next!20317) (not b_lambda!15679) (not start!89274))
(check-sat b_and!32521 (not b_next!20317))
