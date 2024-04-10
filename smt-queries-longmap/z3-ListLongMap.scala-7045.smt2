; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89284 () Bool)

(assert start!89284)

(declare-fun b!1023789 () Bool)

(declare-fun b_free!20325 () Bool)

(declare-fun b_next!20325 () Bool)

(assert (=> b!1023789 (= b_free!20325 (not b_next!20325))))

(declare-fun tp!72010 () Bool)

(declare-fun b_and!32561 () Bool)

(assert (=> b!1023789 (= tp!72010 b_and!32561)))

(declare-fun b!1023787 () Bool)

(declare-fun e!576962 () Bool)

(declare-fun tp_is_empty!24045 () Bool)

(assert (=> b!1023787 (= e!576962 tp_is_empty!24045)))

(declare-fun b!1023788 () Bool)

(declare-fun e!576963 () Bool)

(declare-fun mapRes!37485 () Bool)

(assert (=> b!1023788 (= e!576963 (and e!576962 mapRes!37485))))

(declare-fun condMapEmpty!37485 () Bool)

(declare-datatypes ((V!36933 0))(
  ( (V!36934 (val!12073 Int)) )
))
(declare-datatypes ((ValueCell!11319 0))(
  ( (ValueCellFull!11319 (v!14642 V!36933)) (EmptyCell!11319) )
))
(declare-datatypes ((array!64134 0))(
  ( (array!64135 (arr!30879 (Array (_ BitVec 32) (_ BitVec 64))) (size!31390 (_ BitVec 32))) )
))
(declare-datatypes ((array!64136 0))(
  ( (array!64137 (arr!30880 (Array (_ BitVec 32) ValueCell!11319)) (size!31391 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5232 0))(
  ( (LongMapFixedSize!5233 (defaultEntry!5968 Int) (mask!29599 (_ BitVec 32)) (extraKeys!5700 (_ BitVec 32)) (zeroValue!5804 V!36933) (minValue!5804 V!36933) (_size!2671 (_ BitVec 32)) (_keys!11113 array!64134) (_values!5991 array!64136) (_vacant!2671 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5232)

(declare-fun mapDefault!37485 () ValueCell!11319)

(assert (=> b!1023788 (= condMapEmpty!37485 (= (arr!30880 (_values!5991 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11319)) mapDefault!37485)))))

(declare-fun e!576961 () Bool)

(declare-fun array_inv!23925 (array!64134) Bool)

(declare-fun array_inv!23926 (array!64136) Bool)

(assert (=> b!1023789 (= e!576961 (and tp!72010 tp_is_empty!24045 (array_inv!23925 (_keys!11113 thiss!1427)) (array_inv!23926 (_values!5991 thiss!1427)) e!576963))))

(declare-fun b!1023790 () Bool)

(declare-fun e!576958 () Bool)

(assert (=> b!1023790 (= e!576958 (not true))))

(declare-fun lt!450499 () Bool)

(declare-fun lt!450500 () V!36933)

(declare-fun valid!1993 (LongMapFixedSize!5232) Bool)

(assert (=> b!1023790 (= lt!450499 (valid!1993 (LongMapFixedSize!5233 (defaultEntry!5968 thiss!1427) (mask!29599 thiss!1427) (bvand (extraKeys!5700 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5804 thiss!1427) lt!450500 (_size!2671 thiss!1427) (_keys!11113 thiss!1427) (_values!5991 thiss!1427) (_vacant!2671 thiss!1427))))))

(declare-datatypes ((tuple2!15518 0))(
  ( (tuple2!15519 (_1!7770 (_ BitVec 64)) (_2!7770 V!36933)) )
))
(declare-datatypes ((List!21720 0))(
  ( (Nil!21717) (Cons!21716 (h!22914 tuple2!15518) (t!30774 List!21720)) )
))
(declare-datatypes ((ListLongMap!13659 0))(
  ( (ListLongMap!13660 (toList!6845 List!21720)) )
))
(declare-fun -!472 (ListLongMap!13659 (_ BitVec 64)) ListLongMap!13659)

(declare-fun getCurrentListMap!3893 (array!64134 array!64136 (_ BitVec 32) (_ BitVec 32) V!36933 V!36933 (_ BitVec 32) Int) ListLongMap!13659)

(assert (=> b!1023790 (= (-!472 (getCurrentListMap!3893 (_keys!11113 thiss!1427) (_values!5991 thiss!1427) (mask!29599 thiss!1427) (extraKeys!5700 thiss!1427) (zeroValue!5804 thiss!1427) (minValue!5804 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5968 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3893 (_keys!11113 thiss!1427) (_values!5991 thiss!1427) (mask!29599 thiss!1427) (bvand (extraKeys!5700 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5804 thiss!1427) lt!450500 #b00000000000000000000000000000000 (defaultEntry!5968 thiss!1427)))))

(declare-datatypes ((Unit!33333 0))(
  ( (Unit!33334) )
))
(declare-fun lt!450501 () Unit!33333)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!4 (array!64134 array!64136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36933 V!36933 V!36933 Int) Unit!33333)

(assert (=> b!1023790 (= lt!450501 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!4 (_keys!11113 thiss!1427) (_values!5991 thiss!1427) (mask!29599 thiss!1427) (extraKeys!5700 thiss!1427) (bvand (extraKeys!5700 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5804 thiss!1427) (minValue!5804 thiss!1427) lt!450500 (defaultEntry!5968 thiss!1427)))))

(declare-fun dynLambda!1942 (Int (_ BitVec 64)) V!36933)

(assert (=> b!1023790 (= lt!450500 (dynLambda!1942 (defaultEntry!5968 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!685585 () Bool)

(assert (=> start!89284 (=> (not res!685585) (not e!576958))))

(assert (=> start!89284 (= res!685585 (valid!1993 thiss!1427))))

(assert (=> start!89284 e!576958))

(assert (=> start!89284 e!576961))

(assert (=> start!89284 true))

(declare-fun mapIsEmpty!37485 () Bool)

(assert (=> mapIsEmpty!37485 mapRes!37485))

(declare-fun mapNonEmpty!37485 () Bool)

(declare-fun tp!72009 () Bool)

(declare-fun e!576959 () Bool)

(assert (=> mapNonEmpty!37485 (= mapRes!37485 (and tp!72009 e!576959))))

(declare-fun mapKey!37485 () (_ BitVec 32))

(declare-fun mapValue!37485 () ValueCell!11319)

(declare-fun mapRest!37485 () (Array (_ BitVec 32) ValueCell!11319))

(assert (=> mapNonEmpty!37485 (= (arr!30880 (_values!5991 thiss!1427)) (store mapRest!37485 mapKey!37485 mapValue!37485))))

(declare-fun b!1023791 () Bool)

(declare-fun res!685586 () Bool)

(assert (=> b!1023791 (=> (not res!685586) (not e!576958))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023791 (= res!685586 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023792 () Bool)

(assert (=> b!1023792 (= e!576959 tp_is_empty!24045)))

(assert (= (and start!89284 res!685585) b!1023791))

(assert (= (and b!1023791 res!685586) b!1023790))

(assert (= (and b!1023788 condMapEmpty!37485) mapIsEmpty!37485))

(assert (= (and b!1023788 (not condMapEmpty!37485)) mapNonEmpty!37485))

(get-info :version)

(assert (= (and mapNonEmpty!37485 ((_ is ValueCellFull!11319) mapValue!37485)) b!1023792))

(assert (= (and b!1023788 ((_ is ValueCellFull!11319) mapDefault!37485)) b!1023787))

(assert (= b!1023789 b!1023788))

(assert (= start!89284 b!1023789))

(declare-fun b_lambda!15709 () Bool)

(assert (=> (not b_lambda!15709) (not b!1023790)))

(declare-fun t!30773 () Bool)

(declare-fun tb!6877 () Bool)

(assert (=> (and b!1023789 (= (defaultEntry!5968 thiss!1427) (defaultEntry!5968 thiss!1427)) t!30773) tb!6877))

(declare-fun result!14063 () Bool)

(assert (=> tb!6877 (= result!14063 tp_is_empty!24045)))

(assert (=> b!1023790 t!30773))

(declare-fun b_and!32563 () Bool)

(assert (= b_and!32561 (and (=> t!30773 result!14063) b_and!32563)))

(declare-fun m!942373 () Bool)

(assert (=> b!1023789 m!942373))

(declare-fun m!942375 () Bool)

(assert (=> b!1023789 m!942375))

(declare-fun m!942377 () Bool)

(assert (=> b!1023790 m!942377))

(declare-fun m!942379 () Bool)

(assert (=> b!1023790 m!942379))

(declare-fun m!942381 () Bool)

(assert (=> b!1023790 m!942381))

(declare-fun m!942383 () Bool)

(assert (=> b!1023790 m!942383))

(declare-fun m!942385 () Bool)

(assert (=> b!1023790 m!942385))

(assert (=> b!1023790 m!942381))

(declare-fun m!942387 () Bool)

(assert (=> b!1023790 m!942387))

(declare-fun m!942389 () Bool)

(assert (=> start!89284 m!942389))

(declare-fun m!942391 () Bool)

(assert (=> mapNonEmpty!37485 m!942391))

(check-sat (not b_next!20325) (not start!89284) (not b!1023789) (not mapNonEmpty!37485) (not b!1023790) b_and!32563 (not b_lambda!15709) tp_is_empty!24045)
(check-sat b_and!32563 (not b_next!20325))
