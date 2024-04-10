; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89286 () Bool)

(assert start!89286)

(declare-fun b!1023811 () Bool)

(declare-fun b_free!20327 () Bool)

(declare-fun b_next!20327 () Bool)

(assert (=> b!1023811 (= b_free!20327 (not b_next!20327))))

(declare-fun tp!72015 () Bool)

(declare-fun b_and!32565 () Bool)

(assert (=> b!1023811 (= tp!72015 b_and!32565)))

(declare-fun mapIsEmpty!37488 () Bool)

(declare-fun mapRes!37488 () Bool)

(assert (=> mapIsEmpty!37488 mapRes!37488))

(declare-fun b!1023807 () Bool)

(declare-fun e!576979 () Bool)

(declare-fun tp_is_empty!24047 () Bool)

(assert (=> b!1023807 (= e!576979 tp_is_empty!24047)))

(declare-fun b!1023808 () Bool)

(declare-fun res!685592 () Bool)

(declare-fun e!576976 () Bool)

(assert (=> b!1023808 (=> (not res!685592) (not e!576976))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023808 (= res!685592 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!685591 () Bool)

(assert (=> start!89286 (=> (not res!685591) (not e!576976))))

(declare-datatypes ((V!36935 0))(
  ( (V!36936 (val!12074 Int)) )
))
(declare-datatypes ((ValueCell!11320 0))(
  ( (ValueCellFull!11320 (v!14643 V!36935)) (EmptyCell!11320) )
))
(declare-datatypes ((array!64138 0))(
  ( (array!64139 (arr!30881 (Array (_ BitVec 32) (_ BitVec 64))) (size!31392 (_ BitVec 32))) )
))
(declare-datatypes ((array!64140 0))(
  ( (array!64141 (arr!30882 (Array (_ BitVec 32) ValueCell!11320)) (size!31393 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5234 0))(
  ( (LongMapFixedSize!5235 (defaultEntry!5969 Int) (mask!29600 (_ BitVec 32)) (extraKeys!5701 (_ BitVec 32)) (zeroValue!5805 V!36935) (minValue!5805 V!36935) (_size!2672 (_ BitVec 32)) (_keys!11114 array!64138) (_values!5992 array!64140) (_vacant!2672 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5234)

(declare-fun valid!1994 (LongMapFixedSize!5234) Bool)

(assert (=> start!89286 (= res!685591 (valid!1994 thiss!1427))))

(assert (=> start!89286 e!576976))

(declare-fun e!576977 () Bool)

(assert (=> start!89286 e!576977))

(assert (=> start!89286 true))

(declare-fun b!1023809 () Bool)

(declare-fun e!576981 () Bool)

(assert (=> b!1023809 (= e!576981 tp_is_empty!24047)))

(declare-fun mapNonEmpty!37488 () Bool)

(declare-fun tp!72016 () Bool)

(assert (=> mapNonEmpty!37488 (= mapRes!37488 (and tp!72016 e!576979))))

(declare-fun mapValue!37488 () ValueCell!11320)

(declare-fun mapRest!37488 () (Array (_ BitVec 32) ValueCell!11320))

(declare-fun mapKey!37488 () (_ BitVec 32))

(assert (=> mapNonEmpty!37488 (= (arr!30882 (_values!5992 thiss!1427)) (store mapRest!37488 mapKey!37488 mapValue!37488))))

(declare-fun b!1023810 () Bool)

(assert (=> b!1023810 (= e!576976 (not true))))

(declare-fun lt!450508 () Bool)

(declare-fun lt!450509 () V!36935)

(assert (=> b!1023810 (= lt!450508 (valid!1994 (LongMapFixedSize!5235 (defaultEntry!5969 thiss!1427) (mask!29600 thiss!1427) (bvand (extraKeys!5701 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5805 thiss!1427) lt!450509 (_size!2672 thiss!1427) (_keys!11114 thiss!1427) (_values!5992 thiss!1427) (_vacant!2672 thiss!1427))))))

(declare-datatypes ((tuple2!15520 0))(
  ( (tuple2!15521 (_1!7771 (_ BitVec 64)) (_2!7771 V!36935)) )
))
(declare-datatypes ((List!21721 0))(
  ( (Nil!21718) (Cons!21717 (h!22915 tuple2!15520) (t!30777 List!21721)) )
))
(declare-datatypes ((ListLongMap!13661 0))(
  ( (ListLongMap!13662 (toList!6846 List!21721)) )
))
(declare-fun -!473 (ListLongMap!13661 (_ BitVec 64)) ListLongMap!13661)

(declare-fun getCurrentListMap!3894 (array!64138 array!64140 (_ BitVec 32) (_ BitVec 32) V!36935 V!36935 (_ BitVec 32) Int) ListLongMap!13661)

(assert (=> b!1023810 (= (-!473 (getCurrentListMap!3894 (_keys!11114 thiss!1427) (_values!5992 thiss!1427) (mask!29600 thiss!1427) (extraKeys!5701 thiss!1427) (zeroValue!5805 thiss!1427) (minValue!5805 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5969 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3894 (_keys!11114 thiss!1427) (_values!5992 thiss!1427) (mask!29600 thiss!1427) (bvand (extraKeys!5701 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5805 thiss!1427) lt!450509 #b00000000000000000000000000000000 (defaultEntry!5969 thiss!1427)))))

(declare-datatypes ((Unit!33335 0))(
  ( (Unit!33336) )
))
(declare-fun lt!450510 () Unit!33335)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!5 (array!64138 array!64140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36935 V!36935 V!36935 Int) Unit!33335)

(assert (=> b!1023810 (= lt!450510 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!5 (_keys!11114 thiss!1427) (_values!5992 thiss!1427) (mask!29600 thiss!1427) (extraKeys!5701 thiss!1427) (bvand (extraKeys!5701 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5805 thiss!1427) (minValue!5805 thiss!1427) lt!450509 (defaultEntry!5969 thiss!1427)))))

(declare-fun dynLambda!1943 (Int (_ BitVec 64)) V!36935)

(assert (=> b!1023810 (= lt!450509 (dynLambda!1943 (defaultEntry!5969 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!576978 () Bool)

(declare-fun array_inv!23927 (array!64138) Bool)

(declare-fun array_inv!23928 (array!64140) Bool)

(assert (=> b!1023811 (= e!576977 (and tp!72015 tp_is_empty!24047 (array_inv!23927 (_keys!11114 thiss!1427)) (array_inv!23928 (_values!5992 thiss!1427)) e!576978))))

(declare-fun b!1023812 () Bool)

(assert (=> b!1023812 (= e!576978 (and e!576981 mapRes!37488))))

(declare-fun condMapEmpty!37488 () Bool)

(declare-fun mapDefault!37488 () ValueCell!11320)

