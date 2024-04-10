; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89272 () Bool)

(assert start!89272)

(declare-fun b!1023667 () Bool)

(declare-fun b_free!20313 () Bool)

(declare-fun b_next!20313 () Bool)

(assert (=> b!1023667 (= b_free!20313 (not b_next!20313))))

(declare-fun tp!71973 () Bool)

(declare-fun b_and!32537 () Bool)

(assert (=> b!1023667 (= tp!71973 b_and!32537)))

(declare-fun mapIsEmpty!37467 () Bool)

(declare-fun mapRes!37467 () Bool)

(assert (=> mapIsEmpty!37467 mapRes!37467))

(declare-fun e!576853 () Bool)

(declare-fun tp_is_empty!24033 () Bool)

(declare-fun e!576852 () Bool)

(declare-datatypes ((V!36917 0))(
  ( (V!36918 (val!12067 Int)) )
))
(declare-datatypes ((ValueCell!11313 0))(
  ( (ValueCellFull!11313 (v!14636 V!36917)) (EmptyCell!11313) )
))
(declare-datatypes ((array!64110 0))(
  ( (array!64111 (arr!30867 (Array (_ BitVec 32) (_ BitVec 64))) (size!31378 (_ BitVec 32))) )
))
(declare-datatypes ((array!64112 0))(
  ( (array!64113 (arr!30868 (Array (_ BitVec 32) ValueCell!11313)) (size!31379 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5220 0))(
  ( (LongMapFixedSize!5221 (defaultEntry!5962 Int) (mask!29589 (_ BitVec 32)) (extraKeys!5694 (_ BitVec 32)) (zeroValue!5798 V!36917) (minValue!5798 V!36917) (_size!2665 (_ BitVec 32)) (_keys!11107 array!64110) (_values!5985 array!64112) (_vacant!2665 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5220)

(declare-fun array_inv!23917 (array!64110) Bool)

(declare-fun array_inv!23918 (array!64112) Bool)

(assert (=> b!1023667 (= e!576852 (and tp!71973 tp_is_empty!24033 (array_inv!23917 (_keys!11107 thiss!1427)) (array_inv!23918 (_values!5985 thiss!1427)) e!576853))))

(declare-fun mapNonEmpty!37467 () Bool)

(declare-fun tp!71974 () Bool)

(declare-fun e!576851 () Bool)

(assert (=> mapNonEmpty!37467 (= mapRes!37467 (and tp!71974 e!576851))))

(declare-fun mapKey!37467 () (_ BitVec 32))

(declare-fun mapRest!37467 () (Array (_ BitVec 32) ValueCell!11313))

(declare-fun mapValue!37467 () ValueCell!11313)

(assert (=> mapNonEmpty!37467 (= (arr!30868 (_values!5985 thiss!1427)) (store mapRest!37467 mapKey!37467 mapValue!37467))))

(declare-fun b!1023668 () Bool)

(assert (=> b!1023668 (= e!576851 tp_is_empty!24033)))

(declare-fun b!1023669 () Bool)

(declare-fun res!685550 () Bool)

(declare-fun e!576850 () Bool)

(assert (=> b!1023669 (=> (not res!685550) (not e!576850))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023669 (= res!685550 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023670 () Bool)

(assert (=> b!1023670 (= e!576850 (not true))))

(declare-fun lt!450447 () Bool)

(declare-fun lt!450445 () V!36917)

(declare-fun valid!1989 (LongMapFixedSize!5220) Bool)

(assert (=> b!1023670 (= lt!450447 (valid!1989 (LongMapFixedSize!5221 (defaultEntry!5962 thiss!1427) (mask!29589 thiss!1427) (bvand (extraKeys!5694 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5798 thiss!1427) lt!450445 (_size!2665 thiss!1427) (_keys!11107 thiss!1427) (_values!5985 thiss!1427) (_vacant!2665 thiss!1427))))))

(declare-datatypes ((tuple2!15514 0))(
  ( (tuple2!15515 (_1!7768 (_ BitVec 64)) (_2!7768 V!36917)) )
))
(declare-datatypes ((List!21718 0))(
  ( (Nil!21715) (Cons!21714 (h!22912 tuple2!15514) (t!30760 List!21718)) )
))
(declare-datatypes ((ListLongMap!13655 0))(
  ( (ListLongMap!13656 (toList!6843 List!21718)) )
))
(declare-fun -!470 (ListLongMap!13655 (_ BitVec 64)) ListLongMap!13655)

(declare-fun getCurrentListMap!3891 (array!64110 array!64112 (_ BitVec 32) (_ BitVec 32) V!36917 V!36917 (_ BitVec 32) Int) ListLongMap!13655)

(assert (=> b!1023670 (= (-!470 (getCurrentListMap!3891 (_keys!11107 thiss!1427) (_values!5985 thiss!1427) (mask!29589 thiss!1427) (extraKeys!5694 thiss!1427) (zeroValue!5798 thiss!1427) (minValue!5798 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5962 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3891 (_keys!11107 thiss!1427) (_values!5985 thiss!1427) (mask!29589 thiss!1427) (bvand (extraKeys!5694 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5798 thiss!1427) lt!450445 #b00000000000000000000000000000000 (defaultEntry!5962 thiss!1427)))))

(declare-datatypes ((Unit!33329 0))(
  ( (Unit!33330) )
))
(declare-fun lt!450446 () Unit!33329)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!2 (array!64110 array!64112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36917 V!36917 V!36917 Int) Unit!33329)

(assert (=> b!1023670 (= lt!450446 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!2 (_keys!11107 thiss!1427) (_values!5985 thiss!1427) (mask!29589 thiss!1427) (extraKeys!5694 thiss!1427) (bvand (extraKeys!5694 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5798 thiss!1427) (minValue!5798 thiss!1427) lt!450445 (defaultEntry!5962 thiss!1427)))))

(declare-fun dynLambda!1940 (Int (_ BitVec 64)) V!36917)

(assert (=> b!1023670 (= lt!450445 (dynLambda!1940 (defaultEntry!5962 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1023671 () Bool)

(declare-fun e!576854 () Bool)

(assert (=> b!1023671 (= e!576854 tp_is_empty!24033)))

(declare-fun res!685549 () Bool)

(assert (=> start!89272 (=> (not res!685549) (not e!576850))))

(assert (=> start!89272 (= res!685549 (valid!1989 thiss!1427))))

(assert (=> start!89272 e!576850))

(assert (=> start!89272 e!576852))

(assert (=> start!89272 true))

(declare-fun b!1023672 () Bool)

(assert (=> b!1023672 (= e!576853 (and e!576854 mapRes!37467))))

(declare-fun condMapEmpty!37467 () Bool)

(declare-fun mapDefault!37467 () ValueCell!11313)

(assert (=> b!1023672 (= condMapEmpty!37467 (= (arr!30868 (_values!5985 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11313)) mapDefault!37467)))))

(assert (= (and start!89272 res!685549) b!1023669))

(assert (= (and b!1023669 res!685550) b!1023670))

(assert (= (and b!1023672 condMapEmpty!37467) mapIsEmpty!37467))

(assert (= (and b!1023672 (not condMapEmpty!37467)) mapNonEmpty!37467))

(get-info :version)

(assert (= (and mapNonEmpty!37467 ((_ is ValueCellFull!11313) mapValue!37467)) b!1023668))

(assert (= (and b!1023672 ((_ is ValueCellFull!11313) mapDefault!37467)) b!1023671))

(assert (= b!1023667 b!1023672))

(assert (= start!89272 b!1023667))

(declare-fun b_lambda!15697 () Bool)

(assert (=> (not b_lambda!15697) (not b!1023670)))

(declare-fun t!30759 () Bool)

(declare-fun tb!6865 () Bool)

(assert (=> (and b!1023667 (= (defaultEntry!5962 thiss!1427) (defaultEntry!5962 thiss!1427)) t!30759) tb!6865))

(declare-fun result!14039 () Bool)

(assert (=> tb!6865 (= result!14039 tp_is_empty!24033)))

(assert (=> b!1023670 t!30759))

(declare-fun b_and!32539 () Bool)

(assert (= b_and!32537 (and (=> t!30759 result!14039) b_and!32539)))

(declare-fun m!942253 () Bool)

(assert (=> b!1023667 m!942253))

(declare-fun m!942255 () Bool)

(assert (=> b!1023667 m!942255))

(declare-fun m!942257 () Bool)

(assert (=> mapNonEmpty!37467 m!942257))

(declare-fun m!942259 () Bool)

(assert (=> b!1023670 m!942259))

(declare-fun m!942261 () Bool)

(assert (=> b!1023670 m!942261))

(declare-fun m!942263 () Bool)

(assert (=> b!1023670 m!942263))

(declare-fun m!942265 () Bool)

(assert (=> b!1023670 m!942265))

(declare-fun m!942267 () Bool)

(assert (=> b!1023670 m!942267))

(declare-fun m!942269 () Bool)

(assert (=> b!1023670 m!942269))

(assert (=> b!1023670 m!942265))

(declare-fun m!942271 () Bool)

(assert (=> start!89272 m!942271))

(check-sat (not b!1023670) (not start!89272) (not mapNonEmpty!37467) b_and!32539 (not b!1023667) (not b_lambda!15697) (not b_next!20313) tp_is_empty!24033)
(check-sat b_and!32539 (not b_next!20313))
