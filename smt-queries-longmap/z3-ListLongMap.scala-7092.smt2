; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89968 () Bool)

(assert start!89968)

(declare-fun b!1030287 () Bool)

(declare-fun b_free!20607 () Bool)

(declare-fun b_next!20607 () Bool)

(assert (=> b!1030287 (= b_free!20607 (not b_next!20607))))

(declare-fun tp!72889 () Bool)

(declare-fun b_and!32975 () Bool)

(assert (=> b!1030287 (= tp!72889 b_and!32975)))

(declare-fun b!1030283 () Bool)

(declare-fun res!688989 () Bool)

(declare-fun e!581768 () Bool)

(assert (=> b!1030283 (=> (not res!688989) (not e!581768))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1030283 (= res!688989 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030284 () Bool)

(declare-fun e!581767 () Bool)

(declare-fun tp_is_empty!24327 () Bool)

(assert (=> b!1030284 (= e!581767 tp_is_empty!24327)))

(declare-fun mapIsEmpty!37941 () Bool)

(declare-fun mapRes!37941 () Bool)

(assert (=> mapIsEmpty!37941 mapRes!37941))

(declare-fun mapNonEmpty!37941 () Bool)

(declare-fun tp!72888 () Bool)

(declare-fun e!581770 () Bool)

(assert (=> mapNonEmpty!37941 (= mapRes!37941 (and tp!72888 e!581770))))

(declare-datatypes ((V!37309 0))(
  ( (V!37310 (val!12214 Int)) )
))
(declare-datatypes ((ValueCell!11460 0))(
  ( (ValueCellFull!11460 (v!14791 V!37309)) (EmptyCell!11460) )
))
(declare-datatypes ((array!64716 0))(
  ( (array!64717 (arr!31161 (Array (_ BitVec 32) (_ BitVec 64))) (size!31678 (_ BitVec 32))) )
))
(declare-datatypes ((array!64718 0))(
  ( (array!64719 (arr!31162 (Array (_ BitVec 32) ValueCell!11460)) (size!31679 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5514 0))(
  ( (LongMapFixedSize!5515 (defaultEntry!6129 Int) (mask!29903 (_ BitVec 32)) (extraKeys!5861 (_ BitVec 32)) (zeroValue!5965 V!37309) (minValue!5965 V!37309) (_size!2812 (_ BitVec 32)) (_keys!11300 array!64716) (_values!6152 array!64718) (_vacant!2812 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5514)

(declare-fun mapKey!37941 () (_ BitVec 32))

(declare-fun mapValue!37941 () ValueCell!11460)

(declare-fun mapRest!37941 () (Array (_ BitVec 32) ValueCell!11460))

(assert (=> mapNonEmpty!37941 (= (arr!31162 (_values!6152 thiss!1427)) (store mapRest!37941 mapKey!37941 mapValue!37941))))

(declare-fun b!1030285 () Bool)

(declare-fun res!688987 () Bool)

(declare-fun e!581765 () Bool)

(assert (=> b!1030285 (=> res!688987 e!581765)))

(declare-datatypes ((Unit!33645 0))(
  ( (Unit!33646) )
))
(declare-datatypes ((tuple2!15574 0))(
  ( (tuple2!15575 (_1!7798 Unit!33645) (_2!7798 LongMapFixedSize!5514)) )
))
(declare-fun lt!454422 () tuple2!15574)

(assert (=> b!1030285 (= res!688987 (or (not (= (size!31679 (_values!6152 (_2!7798 lt!454422))) (bvadd #b00000000000000000000000000000001 (mask!29903 (_2!7798 lt!454422))))) (not (= (size!31678 (_keys!11300 (_2!7798 lt!454422))) (size!31679 (_values!6152 (_2!7798 lt!454422))))) (bvslt (mask!29903 (_2!7798 lt!454422)) #b00000000000000000000000000000000) (bvslt (extraKeys!5861 (_2!7798 lt!454422)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5861 (_2!7798 lt!454422)) #b00000000000000000000000000000011)))))

(declare-fun b!1030286 () Bool)

(assert (=> b!1030286 (= e!581770 tp_is_empty!24327)))

(declare-fun e!581769 () Bool)

(declare-fun e!581771 () Bool)

(declare-fun array_inv!24123 (array!64716) Bool)

(declare-fun array_inv!24124 (array!64718) Bool)

(assert (=> b!1030287 (= e!581771 (and tp!72889 tp_is_empty!24327 (array_inv!24123 (_keys!11300 thiss!1427)) (array_inv!24124 (_values!6152 thiss!1427)) e!581769))))

(declare-fun res!688988 () Bool)

(assert (=> start!89968 (=> (not res!688988) (not e!581768))))

(declare-fun valid!2087 (LongMapFixedSize!5514) Bool)

(assert (=> start!89968 (= res!688988 (valid!2087 thiss!1427))))

(assert (=> start!89968 e!581768))

(assert (=> start!89968 e!581771))

(assert (=> start!89968 true))

(declare-fun b!1030288 () Bool)

(assert (=> b!1030288 (= e!581769 (and e!581767 mapRes!37941))))

(declare-fun condMapEmpty!37941 () Bool)

(declare-fun mapDefault!37941 () ValueCell!11460)

(assert (=> b!1030288 (= condMapEmpty!37941 (= (arr!31162 (_values!6152 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11460)) mapDefault!37941)))))

(declare-fun b!1030289 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64716 (_ BitVec 32)) Bool)

(assert (=> b!1030289 (= e!581765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11300 (_2!7798 lt!454422)) (mask!29903 (_2!7798 lt!454422))))))

(declare-fun b!1030290 () Bool)

(declare-fun e!581766 () Bool)

(assert (=> b!1030290 (= e!581766 (not e!581765))))

(declare-fun res!688986 () Bool)

(assert (=> b!1030290 (=> res!688986 e!581765)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030290 (= res!688986 (not (validMask!0 (mask!29903 (_2!7798 lt!454422)))))))

(declare-fun lt!454421 () array!64716)

(declare-fun lt!454427 () array!64718)

(declare-fun Unit!33647 () Unit!33645)

(declare-fun Unit!33648 () Unit!33645)

(assert (=> b!1030290 (= lt!454422 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2812 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15575 Unit!33647 (LongMapFixedSize!5515 (defaultEntry!6129 thiss!1427) (mask!29903 thiss!1427) (extraKeys!5861 thiss!1427) (zeroValue!5965 thiss!1427) (minValue!5965 thiss!1427) (bvsub (_size!2812 thiss!1427) #b00000000000000000000000000000001) lt!454421 lt!454427 (bvadd #b00000000000000000000000000000001 (_vacant!2812 thiss!1427)))) (tuple2!15575 Unit!33648 (LongMapFixedSize!5515 (defaultEntry!6129 thiss!1427) (mask!29903 thiss!1427) (extraKeys!5861 thiss!1427) (zeroValue!5965 thiss!1427) (minValue!5965 thiss!1427) (bvsub (_size!2812 thiss!1427) #b00000000000000000000000000000001) lt!454421 lt!454427 (_vacant!2812 thiss!1427)))))))

(declare-datatypes ((tuple2!15576 0))(
  ( (tuple2!15577 (_1!7799 (_ BitVec 64)) (_2!7799 V!37309)) )
))
(declare-datatypes ((List!21831 0))(
  ( (Nil!21828) (Cons!21827 (h!23029 tuple2!15576) (t!30933 List!21831)) )
))
(declare-datatypes ((ListLongMap!13691 0))(
  ( (ListLongMap!13692 (toList!6861 List!21831)) )
))
(declare-fun -!488 (ListLongMap!13691 (_ BitVec 64)) ListLongMap!13691)

(declare-fun getCurrentListMap!3909 (array!64716 array!64718 (_ BitVec 32) (_ BitVec 32) V!37309 V!37309 (_ BitVec 32) Int) ListLongMap!13691)

(assert (=> b!1030290 (= (-!488 (getCurrentListMap!3909 (_keys!11300 thiss!1427) (_values!6152 thiss!1427) (mask!29903 thiss!1427) (extraKeys!5861 thiss!1427) (zeroValue!5965 thiss!1427) (minValue!5965 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6129 thiss!1427)) key!909) (getCurrentListMap!3909 lt!454421 lt!454427 (mask!29903 thiss!1427) (extraKeys!5861 thiss!1427) (zeroValue!5965 thiss!1427) (minValue!5965 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6129 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9687 0))(
  ( (MissingZero!9687 (index!41119 (_ BitVec 32))) (Found!9687 (index!41120 (_ BitVec 32))) (Intermediate!9687 (undefined!10499 Bool) (index!41121 (_ BitVec 32)) (x!91681 (_ BitVec 32))) (Undefined!9687) (MissingVacant!9687 (index!41122 (_ BitVec 32))) )
))
(declare-fun lt!454425 () SeekEntryResult!9687)

(declare-fun dynLambda!1958 (Int (_ BitVec 64)) V!37309)

(assert (=> b!1030290 (= lt!454427 (array!64719 (store (arr!31162 (_values!6152 thiss!1427)) (index!41120 lt!454425) (ValueCellFull!11460 (dynLambda!1958 (defaultEntry!6129 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31679 (_values!6152 thiss!1427))))))

(declare-fun lt!454428 () Unit!33645)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!14 (array!64716 array!64718 (_ BitVec 32) (_ BitVec 32) V!37309 V!37309 (_ BitVec 32) (_ BitVec 64) Int) Unit!33645)

(assert (=> b!1030290 (= lt!454428 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!14 (_keys!11300 thiss!1427) (_values!6152 thiss!1427) (mask!29903 thiss!1427) (extraKeys!5861 thiss!1427) (zeroValue!5965 thiss!1427) (minValue!5965 thiss!1427) (index!41120 lt!454425) key!909 (defaultEntry!6129 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030290 (not (arrayContainsKey!0 lt!454421 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454424 () Unit!33645)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64716 (_ BitVec 32) (_ BitVec 64)) Unit!33645)

(assert (=> b!1030290 (= lt!454424 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11300 thiss!1427) (index!41120 lt!454425) key!909))))

(assert (=> b!1030290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454421 (mask!29903 thiss!1427))))

(declare-fun lt!454423 () Unit!33645)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64716 (_ BitVec 32) (_ BitVec 32)) Unit!33645)

(assert (=> b!1030290 (= lt!454423 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11300 thiss!1427) (index!41120 lt!454425) (mask!29903 thiss!1427)))))

(declare-datatypes ((List!21832 0))(
  ( (Nil!21829) (Cons!21828 (h!23030 (_ BitVec 64)) (t!30934 List!21832)) )
))
(declare-fun arrayNoDuplicates!0 (array!64716 (_ BitVec 32) List!21832) Bool)

(assert (=> b!1030290 (arrayNoDuplicates!0 lt!454421 #b00000000000000000000000000000000 Nil!21829)))

(declare-fun lt!454426 () Unit!33645)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64716 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21832) Unit!33645)

(assert (=> b!1030290 (= lt!454426 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11300 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41120 lt!454425) #b00000000000000000000000000000000 Nil!21829))))

(declare-fun arrayCountValidKeys!0 (array!64716 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030290 (= (arrayCountValidKeys!0 lt!454421 #b00000000000000000000000000000000 (size!31678 (_keys!11300 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11300 thiss!1427) #b00000000000000000000000000000000 (size!31678 (_keys!11300 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030290 (= lt!454421 (array!64717 (store (arr!31161 (_keys!11300 thiss!1427)) (index!41120 lt!454425) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31678 (_keys!11300 thiss!1427))))))

(declare-fun lt!454420 () Unit!33645)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64716 (_ BitVec 32) (_ BitVec 64)) Unit!33645)

(assert (=> b!1030290 (= lt!454420 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11300 thiss!1427) (index!41120 lt!454425) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030291 () Bool)

(assert (=> b!1030291 (= e!581768 e!581766)))

(declare-fun res!688985 () Bool)

(assert (=> b!1030291 (=> (not res!688985) (not e!581766))))

(get-info :version)

(assert (=> b!1030291 (= res!688985 ((_ is Found!9687) lt!454425))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64716 (_ BitVec 32)) SeekEntryResult!9687)

(assert (=> b!1030291 (= lt!454425 (seekEntry!0 key!909 (_keys!11300 thiss!1427) (mask!29903 thiss!1427)))))

(assert (= (and start!89968 res!688988) b!1030283))

(assert (= (and b!1030283 res!688989) b!1030291))

(assert (= (and b!1030291 res!688985) b!1030290))

(assert (= (and b!1030290 (not res!688986)) b!1030285))

(assert (= (and b!1030285 (not res!688987)) b!1030289))

(assert (= (and b!1030288 condMapEmpty!37941) mapIsEmpty!37941))

(assert (= (and b!1030288 (not condMapEmpty!37941)) mapNonEmpty!37941))

(assert (= (and mapNonEmpty!37941 ((_ is ValueCellFull!11460) mapValue!37941)) b!1030286))

(assert (= (and b!1030288 ((_ is ValueCellFull!11460) mapDefault!37941)) b!1030284))

(assert (= b!1030287 b!1030288))

(assert (= start!89968 b!1030287))

(declare-fun b_lambda!15937 () Bool)

(assert (=> (not b_lambda!15937) (not b!1030290)))

(declare-fun t!30932 () Bool)

(declare-fun tb!6925 () Bool)

(assert (=> (and b!1030287 (= (defaultEntry!6129 thiss!1427) (defaultEntry!6129 thiss!1427)) t!30932) tb!6925))

(declare-fun result!14177 () Bool)

(assert (=> tb!6925 (= result!14177 tp_is_empty!24327)))

(assert (=> b!1030290 t!30932))

(declare-fun b_and!32977 () Bool)

(assert (= b_and!32975 (and (=> t!30932 result!14177) b_and!32977)))

(declare-fun m!949953 () Bool)

(assert (=> b!1030291 m!949953))

(declare-fun m!949955 () Bool)

(assert (=> mapNonEmpty!37941 m!949955))

(declare-fun m!949957 () Bool)

(assert (=> b!1030289 m!949957))

(declare-fun m!949959 () Bool)

(assert (=> start!89968 m!949959))

(declare-fun m!949961 () Bool)

(assert (=> b!1030287 m!949961))

(declare-fun m!949963 () Bool)

(assert (=> b!1030287 m!949963))

(declare-fun m!949965 () Bool)

(assert (=> b!1030290 m!949965))

(declare-fun m!949967 () Bool)

(assert (=> b!1030290 m!949967))

(declare-fun m!949969 () Bool)

(assert (=> b!1030290 m!949969))

(declare-fun m!949971 () Bool)

(assert (=> b!1030290 m!949971))

(declare-fun m!949973 () Bool)

(assert (=> b!1030290 m!949973))

(declare-fun m!949975 () Bool)

(assert (=> b!1030290 m!949975))

(declare-fun m!949977 () Bool)

(assert (=> b!1030290 m!949977))

(declare-fun m!949979 () Bool)

(assert (=> b!1030290 m!949979))

(declare-fun m!949981 () Bool)

(assert (=> b!1030290 m!949981))

(assert (=> b!1030290 m!949979))

(declare-fun m!949983 () Bool)

(assert (=> b!1030290 m!949983))

(declare-fun m!949985 () Bool)

(assert (=> b!1030290 m!949985))

(declare-fun m!949987 () Bool)

(assert (=> b!1030290 m!949987))

(declare-fun m!949989 () Bool)

(assert (=> b!1030290 m!949989))

(declare-fun m!949991 () Bool)

(assert (=> b!1030290 m!949991))

(declare-fun m!949993 () Bool)

(assert (=> b!1030290 m!949993))

(declare-fun m!949995 () Bool)

(assert (=> b!1030290 m!949995))

(declare-fun m!949997 () Bool)

(assert (=> b!1030290 m!949997))

(check-sat (not b_lambda!15937) (not b_next!20607) (not b!1030291) b_and!32977 (not b!1030287) tp_is_empty!24327 (not b!1030289) (not mapNonEmpty!37941) (not b!1030290) (not start!89968))
(check-sat b_and!32977 (not b_next!20607))
