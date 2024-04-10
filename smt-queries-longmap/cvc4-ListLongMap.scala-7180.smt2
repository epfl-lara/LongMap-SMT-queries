; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91896 () Bool)

(assert start!91896)

(declare-fun b!1045292 () Bool)

(declare-fun b_free!21137 () Bool)

(declare-fun b_next!21137 () Bool)

(assert (=> b!1045292 (= b_free!21137 (not b_next!21137))))

(declare-fun tp!74667 () Bool)

(declare-fun b_and!33753 () Bool)

(assert (=> b!1045292 (= tp!74667 b_and!33753)))

(declare-fun b!1045288 () Bool)

(declare-fun e!592512 () Bool)

(declare-fun e!592513 () Bool)

(assert (=> b!1045288 (= e!592512 (not e!592513))))

(declare-fun res!696036 () Bool)

(assert (=> b!1045288 (=> res!696036 e!592513)))

(declare-datatypes ((V!38015 0))(
  ( (V!38016 (val!12479 Int)) )
))
(declare-datatypes ((ValueCell!11725 0))(
  ( (ValueCellFull!11725 (v!15074 V!38015)) (EmptyCell!11725) )
))
(declare-datatypes ((Unit!34143 0))(
  ( (Unit!34144) )
))
(declare-datatypes ((array!65888 0))(
  ( (array!65889 (arr!31691 (Array (_ BitVec 32) (_ BitVec 64))) (size!32226 (_ BitVec 32))) )
))
(declare-datatypes ((array!65890 0))(
  ( (array!65891 (arr!31692 (Array (_ BitVec 32) ValueCell!11725)) (size!32227 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6044 0))(
  ( (LongMapFixedSize!6045 (defaultEntry!6416 Int) (mask!30541 (_ BitVec 32)) (extraKeys!6144 (_ BitVec 32)) (zeroValue!6250 V!38015) (minValue!6250 V!38015) (_size!3077 (_ BitVec 32)) (_keys!11686 array!65888) (_values!6439 array!65890) (_vacant!3077 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15788 0))(
  ( (tuple2!15789 (_1!7905 Unit!34143) (_2!7905 LongMapFixedSize!6044)) )
))
(declare-fun lt!461408 () tuple2!15788)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15790 0))(
  ( (tuple2!15791 (_1!7906 (_ BitVec 64)) (_2!7906 V!38015)) )
))
(declare-datatypes ((List!22018 0))(
  ( (Nil!22015) (Cons!22014 (h!23222 tuple2!15790) (t!31282 List!22018)) )
))
(declare-datatypes ((ListLongMap!13793 0))(
  ( (ListLongMap!13794 (toList!6912 List!22018)) )
))
(declare-fun contains!6080 (ListLongMap!13793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3960 (array!65888 array!65890 (_ BitVec 32) (_ BitVec 32) V!38015 V!38015 (_ BitVec 32) Int) ListLongMap!13793)

(assert (=> b!1045288 (= res!696036 (not (contains!6080 (getCurrentListMap!3960 (_keys!11686 (_2!7905 lt!461408)) (_values!6439 (_2!7905 lt!461408)) (mask!30541 (_2!7905 lt!461408)) (extraKeys!6144 (_2!7905 lt!461408)) (zeroValue!6250 (_2!7905 lt!461408)) (minValue!6250 (_2!7905 lt!461408)) #b00000000000000000000000000000000 (defaultEntry!6416 (_2!7905 lt!461408))) key!909)))))

(declare-fun lt!461406 () array!65890)

(declare-fun lt!461403 () array!65888)

(declare-fun thiss!1427 () LongMapFixedSize!6044)

(declare-fun Unit!34145 () Unit!34143)

(declare-fun Unit!34146 () Unit!34143)

(assert (=> b!1045288 (= lt!461408 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3077 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15789 Unit!34145 (LongMapFixedSize!6045 (defaultEntry!6416 thiss!1427) (mask!30541 thiss!1427) (extraKeys!6144 thiss!1427) (zeroValue!6250 thiss!1427) (minValue!6250 thiss!1427) (bvsub (_size!3077 thiss!1427) #b00000000000000000000000000000001) lt!461403 lt!461406 (bvadd #b00000000000000000000000000000001 (_vacant!3077 thiss!1427)))) (tuple2!15789 Unit!34146 (LongMapFixedSize!6045 (defaultEntry!6416 thiss!1427) (mask!30541 thiss!1427) (extraKeys!6144 thiss!1427) (zeroValue!6250 thiss!1427) (minValue!6250 thiss!1427) (bvsub (_size!3077 thiss!1427) #b00000000000000000000000000000001) lt!461403 lt!461406 (_vacant!3077 thiss!1427)))))))

(declare-fun -!539 (ListLongMap!13793 (_ BitVec 64)) ListLongMap!13793)

(assert (=> b!1045288 (= (-!539 (getCurrentListMap!3960 (_keys!11686 thiss!1427) (_values!6439 thiss!1427) (mask!30541 thiss!1427) (extraKeys!6144 thiss!1427) (zeroValue!6250 thiss!1427) (minValue!6250 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6416 thiss!1427)) key!909) (getCurrentListMap!3960 lt!461403 lt!461406 (mask!30541 thiss!1427) (extraKeys!6144 thiss!1427) (zeroValue!6250 thiss!1427) (minValue!6250 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6416 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9847 0))(
  ( (MissingZero!9847 (index!41759 (_ BitVec 32))) (Found!9847 (index!41760 (_ BitVec 32))) (Intermediate!9847 (undefined!10659 Bool) (index!41761 (_ BitVec 32)) (x!93361 (_ BitVec 32))) (Undefined!9847) (MissingVacant!9847 (index!41762 (_ BitVec 32))) )
))
(declare-fun lt!461402 () SeekEntryResult!9847)

(declare-fun dynLambda!2009 (Int (_ BitVec 64)) V!38015)

(assert (=> b!1045288 (= lt!461406 (array!65891 (store (arr!31692 (_values!6439 thiss!1427)) (index!41760 lt!461402) (ValueCellFull!11725 (dynLambda!2009 (defaultEntry!6416 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32227 (_values!6439 thiss!1427))))))

(declare-fun lt!461400 () Unit!34143)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!60 (array!65888 array!65890 (_ BitVec 32) (_ BitVec 32) V!38015 V!38015 (_ BitVec 32) (_ BitVec 64) Int) Unit!34143)

(assert (=> b!1045288 (= lt!461400 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!60 (_keys!11686 thiss!1427) (_values!6439 thiss!1427) (mask!30541 thiss!1427) (extraKeys!6144 thiss!1427) (zeroValue!6250 thiss!1427) (minValue!6250 thiss!1427) (index!41760 lt!461402) key!909 (defaultEntry!6416 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045288 (not (arrayContainsKey!0 lt!461403 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461404 () Unit!34143)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65888 (_ BitVec 32) (_ BitVec 64)) Unit!34143)

(assert (=> b!1045288 (= lt!461404 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11686 thiss!1427) (index!41760 lt!461402) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65888 (_ BitVec 32)) Bool)

(assert (=> b!1045288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461403 (mask!30541 thiss!1427))))

(declare-fun lt!461407 () Unit!34143)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65888 (_ BitVec 32) (_ BitVec 32)) Unit!34143)

(assert (=> b!1045288 (= lt!461407 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11686 thiss!1427) (index!41760 lt!461402) (mask!30541 thiss!1427)))))

(declare-datatypes ((List!22019 0))(
  ( (Nil!22016) (Cons!22015 (h!23223 (_ BitVec 64)) (t!31283 List!22019)) )
))
(declare-fun arrayNoDuplicates!0 (array!65888 (_ BitVec 32) List!22019) Bool)

(assert (=> b!1045288 (arrayNoDuplicates!0 lt!461403 #b00000000000000000000000000000000 Nil!22016)))

(declare-fun lt!461401 () Unit!34143)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65888 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22019) Unit!34143)

(assert (=> b!1045288 (= lt!461401 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11686 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41760 lt!461402) #b00000000000000000000000000000000 Nil!22016))))

(declare-fun arrayCountValidKeys!0 (array!65888 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045288 (= (arrayCountValidKeys!0 lt!461403 #b00000000000000000000000000000000 (size!32226 (_keys!11686 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11686 thiss!1427) #b00000000000000000000000000000000 (size!32226 (_keys!11686 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045288 (= lt!461403 (array!65889 (store (arr!31691 (_keys!11686 thiss!1427)) (index!41760 lt!461402) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32226 (_keys!11686 thiss!1427))))))

(declare-fun lt!461405 () Unit!34143)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65888 (_ BitVec 32) (_ BitVec 64)) Unit!34143)

(assert (=> b!1045288 (= lt!461405 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11686 thiss!1427) (index!41760 lt!461402) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045289 () Bool)

(declare-fun res!696032 () Bool)

(declare-fun e!592508 () Bool)

(assert (=> b!1045289 (=> (not res!696032) (not e!592508))))

(assert (=> b!1045289 (= res!696032 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38924 () Bool)

(declare-fun mapRes!38924 () Bool)

(declare-fun tp!74666 () Bool)

(declare-fun e!592507 () Bool)

(assert (=> mapNonEmpty!38924 (= mapRes!38924 (and tp!74666 e!592507))))

(declare-fun mapRest!38924 () (Array (_ BitVec 32) ValueCell!11725))

(declare-fun mapKey!38924 () (_ BitVec 32))

(declare-fun mapValue!38924 () ValueCell!11725)

(assert (=> mapNonEmpty!38924 (= (arr!31692 (_values!6439 thiss!1427)) (store mapRest!38924 mapKey!38924 mapValue!38924))))

(declare-fun b!1045290 () Bool)

(assert (=> b!1045290 (= e!592513 (or (not (= (size!32227 (_values!6439 (_2!7905 lt!461408))) (bvadd #b00000000000000000000000000000001 (mask!30541 (_2!7905 lt!461408))))) (not (= (size!32226 (_keys!11686 (_2!7905 lt!461408))) (size!32227 (_values!6439 (_2!7905 lt!461408))))) (bvslt (mask!30541 (_2!7905 lt!461408)) #b00000000000000000000000000000000) (bvsge (extraKeys!6144 (_2!7905 lt!461408)) #b00000000000000000000000000000000)))))

(declare-fun b!1045291 () Bool)

(declare-fun e!592511 () Bool)

(declare-fun tp_is_empty!24857 () Bool)

(assert (=> b!1045291 (= e!592511 tp_is_empty!24857)))

(declare-fun e!592506 () Bool)

(declare-fun e!592510 () Bool)

(declare-fun array_inv!24479 (array!65888) Bool)

(declare-fun array_inv!24480 (array!65890) Bool)

(assert (=> b!1045292 (= e!592506 (and tp!74667 tp_is_empty!24857 (array_inv!24479 (_keys!11686 thiss!1427)) (array_inv!24480 (_values!6439 thiss!1427)) e!592510))))

(declare-fun b!1045293 () Bool)

(declare-fun res!696035 () Bool)

(assert (=> b!1045293 (=> res!696035 e!592513)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045293 (= res!696035 (not (validMask!0 (mask!30541 (_2!7905 lt!461408)))))))

(declare-fun mapIsEmpty!38924 () Bool)

(assert (=> mapIsEmpty!38924 mapRes!38924))

(declare-fun b!1045294 () Bool)

(assert (=> b!1045294 (= e!592510 (and e!592511 mapRes!38924))))

(declare-fun condMapEmpty!38924 () Bool)

(declare-fun mapDefault!38924 () ValueCell!11725)

