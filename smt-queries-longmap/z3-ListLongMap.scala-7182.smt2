; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91970 () Bool)

(assert start!91970)

(declare-fun b!1045705 () Bool)

(declare-fun b_free!21145 () Bool)

(declare-fun b_next!21145 () Bool)

(assert (=> b!1045705 (= b_free!21145 (not b_next!21145))))

(declare-fun tp!74696 () Bool)

(declare-fun b_and!33759 () Bool)

(assert (=> b!1045705 (= tp!74696 b_and!33759)))

(declare-fun b!1045699 () Bool)

(declare-fun res!696235 () Bool)

(declare-fun e!592799 () Bool)

(assert (=> b!1045699 (=> (not res!696235) (not e!592799))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1045699 (= res!696235 (not (= key!909 (bvneg key!909))))))

(declare-fun res!696234 () Bool)

(assert (=> start!91970 (=> (not res!696234) (not e!592799))))

(declare-datatypes ((V!38027 0))(
  ( (V!38028 (val!12483 Int)) )
))
(declare-datatypes ((ValueCell!11729 0))(
  ( (ValueCellFull!11729 (v!15079 V!38027)) (EmptyCell!11729) )
))
(declare-datatypes ((array!65847 0))(
  ( (array!65848 (arr!31668 (Array (_ BitVec 32) (_ BitVec 64))) (size!32205 (_ BitVec 32))) )
))
(declare-datatypes ((array!65849 0))(
  ( (array!65850 (arr!31669 (Array (_ BitVec 32) ValueCell!11729)) (size!32206 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6052 0))(
  ( (LongMapFixedSize!6053 (defaultEntry!6424 Int) (mask!30556 (_ BitVec 32)) (extraKeys!6152 (_ BitVec 32)) (zeroValue!6258 V!38027) (minValue!6258 V!38027) (_size!3081 (_ BitVec 32)) (_keys!11694 array!65847) (_values!6447 array!65849) (_vacant!3081 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6052)

(declare-fun valid!2266 (LongMapFixedSize!6052) Bool)

(assert (=> start!91970 (= res!696234 (valid!2266 thiss!1427))))

(assert (=> start!91970 e!592799))

(declare-fun e!592795 () Bool)

(assert (=> start!91970 e!592795))

(assert (=> start!91970 true))

(declare-fun b!1045700 () Bool)

(declare-fun e!592800 () Bool)

(declare-fun tp_is_empty!24865 () Bool)

(assert (=> b!1045700 (= e!592800 tp_is_empty!24865)))

(declare-fun b!1045701 () Bool)

(declare-fun res!696236 () Bool)

(declare-fun e!592802 () Bool)

(assert (=> b!1045701 (=> res!696236 e!592802)))

(declare-datatypes ((Unit!34047 0))(
  ( (Unit!34048) )
))
(declare-datatypes ((tuple2!15870 0))(
  ( (tuple2!15871 (_1!7946 Unit!34047) (_2!7946 LongMapFixedSize!6052)) )
))
(declare-fun lt!461639 () tuple2!15870)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045701 (= res!696236 (not (validMask!0 (mask!30556 (_2!7946 lt!461639)))))))

(declare-fun mapIsEmpty!38942 () Bool)

(declare-fun mapRes!38942 () Bool)

(assert (=> mapIsEmpty!38942 mapRes!38942))

(declare-fun mapNonEmpty!38942 () Bool)

(declare-fun tp!74697 () Bool)

(declare-fun e!592796 () Bool)

(assert (=> mapNonEmpty!38942 (= mapRes!38942 (and tp!74697 e!592796))))

(declare-fun mapValue!38942 () ValueCell!11729)

(declare-fun mapRest!38942 () (Array (_ BitVec 32) ValueCell!11729))

(declare-fun mapKey!38942 () (_ BitVec 32))

(assert (=> mapNonEmpty!38942 (= (arr!31669 (_values!6447 thiss!1427)) (store mapRest!38942 mapKey!38942 mapValue!38942))))

(declare-fun b!1045702 () Bool)

(declare-fun res!696232 () Bool)

(assert (=> b!1045702 (=> res!696232 e!592802)))

(assert (=> b!1045702 (= res!696232 (or (not (= (size!32206 (_values!6447 (_2!7946 lt!461639))) (bvadd #b00000000000000000000000000000001 (mask!30556 (_2!7946 lt!461639))))) (not (= (size!32205 (_keys!11694 (_2!7946 lt!461639))) (size!32206 (_values!6447 (_2!7946 lt!461639))))) (bvslt (mask!30556 (_2!7946 lt!461639)) #b00000000000000000000000000000000) (bvslt (extraKeys!6152 (_2!7946 lt!461639)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6152 (_2!7946 lt!461639)) #b00000000000000000000000000000011)))))

(declare-fun b!1045703 () Bool)

(declare-fun e!592797 () Bool)

(assert (=> b!1045703 (= e!592799 e!592797)))

(declare-fun res!696231 () Bool)

(assert (=> b!1045703 (=> (not res!696231) (not e!592797))))

(declare-datatypes ((SeekEntryResult!9850 0))(
  ( (MissingZero!9850 (index!41771 (_ BitVec 32))) (Found!9850 (index!41772 (_ BitVec 32))) (Intermediate!9850 (undefined!10662 Bool) (index!41773 (_ BitVec 32)) (x!93421 (_ BitVec 32))) (Undefined!9850) (MissingVacant!9850 (index!41774 (_ BitVec 32))) )
))
(declare-fun lt!461640 () SeekEntryResult!9850)

(get-info :version)

(assert (=> b!1045703 (= res!696231 ((_ is Found!9850) lt!461640))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65847 (_ BitVec 32)) SeekEntryResult!9850)

(assert (=> b!1045703 (= lt!461640 (seekEntry!0 key!909 (_keys!11694 thiss!1427) (mask!30556 thiss!1427)))))

(declare-fun b!1045704 () Bool)

(assert (=> b!1045704 (= e!592796 tp_is_empty!24865)))

(declare-fun e!592801 () Bool)

(declare-fun array_inv!24471 (array!65847) Bool)

(declare-fun array_inv!24472 (array!65849) Bool)

(assert (=> b!1045705 (= e!592795 (and tp!74696 tp_is_empty!24865 (array_inv!24471 (_keys!11694 thiss!1427)) (array_inv!24472 (_values!6447 thiss!1427)) e!592801))))

(declare-fun b!1045706 () Bool)

(assert (=> b!1045706 (= e!592797 (not e!592802))))

(declare-fun res!696233 () Bool)

(assert (=> b!1045706 (=> res!696233 e!592802)))

(declare-datatypes ((tuple2!15872 0))(
  ( (tuple2!15873 (_1!7947 (_ BitVec 64)) (_2!7947 V!38027)) )
))
(declare-datatypes ((List!22058 0))(
  ( (Nil!22055) (Cons!22054 (h!23262 tuple2!15872) (t!31325 List!22058)) )
))
(declare-datatypes ((ListLongMap!13865 0))(
  ( (ListLongMap!13866 (toList!6948 List!22058)) )
))
(declare-fun contains!6062 (ListLongMap!13865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3914 (array!65847 array!65849 (_ BitVec 32) (_ BitVec 32) V!38027 V!38027 (_ BitVec 32) Int) ListLongMap!13865)

(assert (=> b!1045706 (= res!696233 (not (contains!6062 (getCurrentListMap!3914 (_keys!11694 (_2!7946 lt!461639)) (_values!6447 (_2!7946 lt!461639)) (mask!30556 (_2!7946 lt!461639)) (extraKeys!6152 (_2!7946 lt!461639)) (zeroValue!6258 (_2!7946 lt!461639)) (minValue!6258 (_2!7946 lt!461639)) #b00000000000000000000000000000000 (defaultEntry!6424 (_2!7946 lt!461639))) key!909)))))

(declare-fun lt!461643 () array!65849)

(declare-fun lt!461641 () array!65847)

(declare-fun Unit!34049 () Unit!34047)

(declare-fun Unit!34050 () Unit!34047)

(assert (=> b!1045706 (= lt!461639 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3081 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15871 Unit!34049 (LongMapFixedSize!6053 (defaultEntry!6424 thiss!1427) (mask!30556 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) (bvsub (_size!3081 thiss!1427) #b00000000000000000000000000000001) lt!461641 lt!461643 (bvadd #b00000000000000000000000000000001 (_vacant!3081 thiss!1427)))) (tuple2!15871 Unit!34050 (LongMapFixedSize!6053 (defaultEntry!6424 thiss!1427) (mask!30556 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) (bvsub (_size!3081 thiss!1427) #b00000000000000000000000000000001) lt!461641 lt!461643 (_vacant!3081 thiss!1427)))))))

(declare-fun -!540 (ListLongMap!13865 (_ BitVec 64)) ListLongMap!13865)

(assert (=> b!1045706 (= (-!540 (getCurrentListMap!3914 (_keys!11694 thiss!1427) (_values!6447 thiss!1427) (mask!30556 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6424 thiss!1427)) key!909) (getCurrentListMap!3914 lt!461641 lt!461643 (mask!30556 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6424 thiss!1427)))))

(declare-fun dynLambda!2001 (Int (_ BitVec 64)) V!38027)

(assert (=> b!1045706 (= lt!461643 (array!65850 (store (arr!31669 (_values!6447 thiss!1427)) (index!41772 lt!461640) (ValueCellFull!11729 (dynLambda!2001 (defaultEntry!6424 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6447 thiss!1427))))))

(declare-fun lt!461645 () Unit!34047)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!62 (array!65847 array!65849 (_ BitVec 32) (_ BitVec 32) V!38027 V!38027 (_ BitVec 32) (_ BitVec 64) Int) Unit!34047)

(assert (=> b!1045706 (= lt!461645 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!62 (_keys!11694 thiss!1427) (_values!6447 thiss!1427) (mask!30556 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) (index!41772 lt!461640) key!909 (defaultEntry!6424 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045706 (not (arrayContainsKey!0 lt!461641 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461638 () Unit!34047)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65847 (_ BitVec 32) (_ BitVec 64)) Unit!34047)

(assert (=> b!1045706 (= lt!461638 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11694 thiss!1427) (index!41772 lt!461640) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65847 (_ BitVec 32)) Bool)

(assert (=> b!1045706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461641 (mask!30556 thiss!1427))))

(declare-fun lt!461642 () Unit!34047)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65847 (_ BitVec 32) (_ BitVec 32)) Unit!34047)

(assert (=> b!1045706 (= lt!461642 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11694 thiss!1427) (index!41772 lt!461640) (mask!30556 thiss!1427)))))

(declare-datatypes ((List!22059 0))(
  ( (Nil!22056) (Cons!22055 (h!23263 (_ BitVec 64)) (t!31326 List!22059)) )
))
(declare-fun arrayNoDuplicates!0 (array!65847 (_ BitVec 32) List!22059) Bool)

(assert (=> b!1045706 (arrayNoDuplicates!0 lt!461641 #b00000000000000000000000000000000 Nil!22056)))

(declare-fun lt!461644 () Unit!34047)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65847 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22059) Unit!34047)

(assert (=> b!1045706 (= lt!461644 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11694 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41772 lt!461640) #b00000000000000000000000000000000 Nil!22056))))

(declare-fun arrayCountValidKeys!0 (array!65847 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045706 (= (arrayCountValidKeys!0 lt!461641 #b00000000000000000000000000000000 (size!32205 (_keys!11694 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11694 thiss!1427) #b00000000000000000000000000000000 (size!32205 (_keys!11694 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045706 (= lt!461641 (array!65848 (store (arr!31668 (_keys!11694 thiss!1427)) (index!41772 lt!461640) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32205 (_keys!11694 thiss!1427))))))

(declare-fun lt!461646 () Unit!34047)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65847 (_ BitVec 32) (_ BitVec 64)) Unit!34047)

(assert (=> b!1045706 (= lt!461646 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11694 thiss!1427) (index!41772 lt!461640) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045707 () Bool)

(assert (=> b!1045707 (= e!592802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11694 (_2!7946 lt!461639)) (mask!30556 (_2!7946 lt!461639))))))

(declare-fun b!1045708 () Bool)

(assert (=> b!1045708 (= e!592801 (and e!592800 mapRes!38942))))

(declare-fun condMapEmpty!38942 () Bool)

(declare-fun mapDefault!38942 () ValueCell!11729)

(assert (=> b!1045708 (= condMapEmpty!38942 (= (arr!31669 (_values!6447 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11729)) mapDefault!38942)))))

(assert (= (and start!91970 res!696234) b!1045699))

(assert (= (and b!1045699 res!696235) b!1045703))

(assert (= (and b!1045703 res!696231) b!1045706))

(assert (= (and b!1045706 (not res!696233)) b!1045701))

(assert (= (and b!1045701 (not res!696236)) b!1045702))

(assert (= (and b!1045702 (not res!696232)) b!1045707))

(assert (= (and b!1045708 condMapEmpty!38942) mapIsEmpty!38942))

(assert (= (and b!1045708 (not condMapEmpty!38942)) mapNonEmpty!38942))

(assert (= (and mapNonEmpty!38942 ((_ is ValueCellFull!11729) mapValue!38942)) b!1045704))

(assert (= (and b!1045708 ((_ is ValueCellFull!11729) mapDefault!38942)) b!1045700))

(assert (= b!1045705 b!1045708))

(assert (= start!91970 b!1045705))

(declare-fun b_lambda!16307 () Bool)

(assert (=> (not b_lambda!16307) (not b!1045706)))

(declare-fun t!31324 () Bool)

(declare-fun tb!7089 () Bool)

(assert (=> (and b!1045705 (= (defaultEntry!6424 thiss!1427) (defaultEntry!6424 thiss!1427)) t!31324) tb!7089))

(declare-fun result!14611 () Bool)

(assert (=> tb!7089 (= result!14611 tp_is_empty!24865)))

(assert (=> b!1045706 t!31324))

(declare-fun b_and!33761 () Bool)

(assert (= b_and!33759 (and (=> t!31324 result!14611) b_and!33761)))

(declare-fun m!965031 () Bool)

(assert (=> b!1045701 m!965031))

(declare-fun m!965033 () Bool)

(assert (=> b!1045706 m!965033))

(declare-fun m!965035 () Bool)

(assert (=> b!1045706 m!965035))

(declare-fun m!965037 () Bool)

(assert (=> b!1045706 m!965037))

(declare-fun m!965039 () Bool)

(assert (=> b!1045706 m!965039))

(declare-fun m!965041 () Bool)

(assert (=> b!1045706 m!965041))

(declare-fun m!965043 () Bool)

(assert (=> b!1045706 m!965043))

(declare-fun m!965045 () Bool)

(assert (=> b!1045706 m!965045))

(declare-fun m!965047 () Bool)

(assert (=> b!1045706 m!965047))

(declare-fun m!965049 () Bool)

(assert (=> b!1045706 m!965049))

(declare-fun m!965051 () Bool)

(assert (=> b!1045706 m!965051))

(declare-fun m!965053 () Bool)

(assert (=> b!1045706 m!965053))

(assert (=> b!1045706 m!965037))

(declare-fun m!965055 () Bool)

(assert (=> b!1045706 m!965055))

(declare-fun m!965057 () Bool)

(assert (=> b!1045706 m!965057))

(declare-fun m!965059 () Bool)

(assert (=> b!1045706 m!965059))

(declare-fun m!965061 () Bool)

(assert (=> b!1045706 m!965061))

(declare-fun m!965063 () Bool)

(assert (=> b!1045706 m!965063))

(declare-fun m!965065 () Bool)

(assert (=> b!1045706 m!965065))

(declare-fun m!965067 () Bool)

(assert (=> b!1045706 m!965067))

(assert (=> b!1045706 m!965057))

(declare-fun m!965069 () Bool)

(assert (=> b!1045703 m!965069))

(declare-fun m!965071 () Bool)

(assert (=> b!1045705 m!965071))

(declare-fun m!965073 () Bool)

(assert (=> b!1045705 m!965073))

(declare-fun m!965075 () Bool)

(assert (=> mapNonEmpty!38942 m!965075))

(declare-fun m!965077 () Bool)

(assert (=> b!1045707 m!965077))

(declare-fun m!965079 () Bool)

(assert (=> start!91970 m!965079))

(check-sat tp_is_empty!24865 (not b_next!21145) (not b!1045701) (not b!1045706) (not mapNonEmpty!38942) (not b_lambda!16307) (not start!91970) b_and!33761 (not b!1045703) (not b!1045707) (not b!1045705))
(check-sat b_and!33761 (not b_next!21145))
