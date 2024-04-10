; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89536 () Bool)

(assert start!89536)

(declare-fun b!1026976 () Bool)

(declare-fun b_free!20535 () Bool)

(declare-fun b_next!20535 () Bool)

(assert (=> b!1026976 (= b_free!20535 (not b_next!20535))))

(declare-fun tp!72651 () Bool)

(declare-fun b_and!32781 () Bool)

(assert (=> b!1026976 (= tp!72651 b_and!32781)))

(declare-fun b!1026971 () Bool)

(declare-fun res!687428 () Bool)

(declare-fun e!579474 () Bool)

(assert (=> b!1026971 (=> res!687428 e!579474)))

(declare-datatypes ((V!37213 0))(
  ( (V!37214 (val!12178 Int)) )
))
(declare-datatypes ((ValueCell!11424 0))(
  ( (ValueCellFull!11424 (v!14747 V!37213)) (EmptyCell!11424) )
))
(declare-datatypes ((array!64560 0))(
  ( (array!64561 (arr!31089 (Array (_ BitVec 32) (_ BitVec 64))) (size!31602 (_ BitVec 32))) )
))
(declare-datatypes ((array!64562 0))(
  ( (array!64563 (arr!31090 (Array (_ BitVec 32) ValueCell!11424)) (size!31603 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5442 0))(
  ( (LongMapFixedSize!5443 (defaultEntry!6073 Int) (mask!29779 (_ BitVec 32)) (extraKeys!5805 (_ BitVec 32)) (zeroValue!5909 V!37213) (minValue!5909 V!37213) (_size!2776 (_ BitVec 32)) (_keys!11220 array!64560) (_values!6096 array!64562) (_vacant!2776 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5442)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64560 (_ BitVec 32)) Bool)

(assert (=> b!1026971 (= res!687428 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11220 thiss!1427) (mask!29779 thiss!1427))))))

(declare-fun b!1026972 () Bool)

(declare-fun res!687423 () Bool)

(assert (=> b!1026972 (=> res!687423 e!579474)))

(assert (=> b!1026972 (= res!687423 (or (not (= (size!31603 (_values!6096 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29779 thiss!1427)))) (not (= (size!31602 (_keys!11220 thiss!1427)) (size!31603 (_values!6096 thiss!1427)))) (bvslt (mask!29779 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5805 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5805 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026973 () Bool)

(declare-fun e!579475 () Bool)

(declare-fun e!579476 () Bool)

(declare-fun mapRes!37811 () Bool)

(assert (=> b!1026973 (= e!579475 (and e!579476 mapRes!37811))))

(declare-fun condMapEmpty!37811 () Bool)

(declare-fun mapDefault!37811 () ValueCell!11424)

(assert (=> b!1026973 (= condMapEmpty!37811 (= (arr!31090 (_values!6096 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11424)) mapDefault!37811)))))

(declare-fun mapNonEmpty!37811 () Bool)

(declare-fun tp!72650 () Bool)

(declare-fun e!579472 () Bool)

(assert (=> mapNonEmpty!37811 (= mapRes!37811 (and tp!72650 e!579472))))

(declare-fun mapKey!37811 () (_ BitVec 32))

(declare-fun mapRest!37811 () (Array (_ BitVec 32) ValueCell!11424))

(declare-fun mapValue!37811 () ValueCell!11424)

(assert (=> mapNonEmpty!37811 (= (arr!31090 (_values!6096 thiss!1427)) (store mapRest!37811 mapKey!37811 mapValue!37811))))

(declare-fun b!1026974 () Bool)

(declare-fun tp_is_empty!24255 () Bool)

(assert (=> b!1026974 (= e!579472 tp_is_empty!24255)))

(declare-fun b!1026975 () Bool)

(declare-fun e!579478 () Bool)

(declare-fun e!579477 () Bool)

(assert (=> b!1026975 (= e!579478 e!579477)))

(declare-fun res!687425 () Bool)

(assert (=> b!1026975 (=> (not res!687425) (not e!579477))))

(declare-datatypes ((SeekEntryResult!9660 0))(
  ( (MissingZero!9660 (index!41011 (_ BitVec 32))) (Found!9660 (index!41012 (_ BitVec 32))) (Intermediate!9660 (undefined!10472 Bool) (index!41013 (_ BitVec 32)) (x!91370 (_ BitVec 32))) (Undefined!9660) (MissingVacant!9660 (index!41014 (_ BitVec 32))) )
))
(declare-fun lt!451934 () SeekEntryResult!9660)

(get-info :version)

(assert (=> b!1026975 (= res!687425 ((_ is Found!9660) lt!451934))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64560 (_ BitVec 32)) SeekEntryResult!9660)

(assert (=> b!1026975 (= lt!451934 (seekEntry!0 key!909 (_keys!11220 thiss!1427) (mask!29779 thiss!1427)))))

(declare-fun mapIsEmpty!37811 () Bool)

(assert (=> mapIsEmpty!37811 mapRes!37811))

(declare-fun e!579471 () Bool)

(declare-fun array_inv!24073 (array!64560) Bool)

(declare-fun array_inv!24074 (array!64562) Bool)

(assert (=> b!1026976 (= e!579471 (and tp!72651 tp_is_empty!24255 (array_inv!24073 (_keys!11220 thiss!1427)) (array_inv!24074 (_values!6096 thiss!1427)) e!579475))))

(declare-fun b!1026977 () Bool)

(declare-fun res!687426 () Bool)

(assert (=> b!1026977 (=> (not res!687426) (not e!579478))))

(assert (=> b!1026977 (= res!687426 (not (= key!909 (bvneg key!909))))))

(declare-fun res!687424 () Bool)

(assert (=> start!89536 (=> (not res!687424) (not e!579478))))

(declare-fun valid!2064 (LongMapFixedSize!5442) Bool)

(assert (=> start!89536 (= res!687424 (valid!2064 thiss!1427))))

(assert (=> start!89536 e!579478))

(assert (=> start!89536 e!579471))

(assert (=> start!89536 true))

(declare-fun b!1026978 () Bool)

(assert (=> b!1026978 (= e!579476 tp_is_empty!24255)))

(declare-fun b!1026979 () Bool)

(assert (=> b!1026979 (= e!579474 true)))

(declare-fun lt!451933 () Bool)

(declare-datatypes ((List!21794 0))(
  ( (Nil!21791) (Cons!21790 (h!22988 (_ BitVec 64)) (t!30856 List!21794)) )
))
(declare-fun arrayNoDuplicates!0 (array!64560 (_ BitVec 32) List!21794) Bool)

(assert (=> b!1026979 (= lt!451933 (arrayNoDuplicates!0 (_keys!11220 thiss!1427) #b00000000000000000000000000000000 Nil!21791))))

(declare-fun b!1026980 () Bool)

(assert (=> b!1026980 (= e!579477 (not e!579474))))

(declare-fun res!687427 () Bool)

(assert (=> b!1026980 (=> res!687427 e!579474)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026980 (= res!687427 (not (validMask!0 (mask!29779 thiss!1427))))))

(declare-fun lt!451932 () array!64560)

(declare-fun arrayContainsKey!0 (array!64560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026980 (not (arrayContainsKey!0 lt!451932 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33463 0))(
  ( (Unit!33464) )
))
(declare-fun lt!451935 () Unit!33463)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64560 (_ BitVec 32) (_ BitVec 64)) Unit!33463)

(assert (=> b!1026980 (= lt!451935 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11220 thiss!1427) (index!41012 lt!451934) key!909))))

(assert (=> b!1026980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451932 (mask!29779 thiss!1427))))

(declare-fun lt!451931 () Unit!33463)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64560 (_ BitVec 32) (_ BitVec 32)) Unit!33463)

(assert (=> b!1026980 (= lt!451931 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11220 thiss!1427) (index!41012 lt!451934) (mask!29779 thiss!1427)))))

(assert (=> b!1026980 (arrayNoDuplicates!0 lt!451932 #b00000000000000000000000000000000 Nil!21791)))

(declare-fun lt!451929 () Unit!33463)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64560 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21794) Unit!33463)

(assert (=> b!1026980 (= lt!451929 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11220 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41012 lt!451934) #b00000000000000000000000000000000 Nil!21791))))

(declare-fun arrayCountValidKeys!0 (array!64560 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026980 (= (arrayCountValidKeys!0 lt!451932 #b00000000000000000000000000000000 (size!31602 (_keys!11220 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11220 thiss!1427) #b00000000000000000000000000000000 (size!31602 (_keys!11220 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026980 (= lt!451932 (array!64561 (store (arr!31089 (_keys!11220 thiss!1427)) (index!41012 lt!451934) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31602 (_keys!11220 thiss!1427))))))

(declare-fun lt!451930 () Unit!33463)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64560 (_ BitVec 32) (_ BitVec 64)) Unit!33463)

(assert (=> b!1026980 (= lt!451930 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11220 thiss!1427) (index!41012 lt!451934) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89536 res!687424) b!1026977))

(assert (= (and b!1026977 res!687426) b!1026975))

(assert (= (and b!1026975 res!687425) b!1026980))

(assert (= (and b!1026980 (not res!687427)) b!1026972))

(assert (= (and b!1026972 (not res!687423)) b!1026971))

(assert (= (and b!1026971 (not res!687428)) b!1026979))

(assert (= (and b!1026973 condMapEmpty!37811) mapIsEmpty!37811))

(assert (= (and b!1026973 (not condMapEmpty!37811)) mapNonEmpty!37811))

(assert (= (and mapNonEmpty!37811 ((_ is ValueCellFull!11424) mapValue!37811)) b!1026974))

(assert (= (and b!1026973 ((_ is ValueCellFull!11424) mapDefault!37811)) b!1026978))

(assert (= b!1026976 b!1026973))

(assert (= start!89536 b!1026976))

(declare-fun m!945343 () Bool)

(assert (=> start!89536 m!945343))

(declare-fun m!945345 () Bool)

(assert (=> mapNonEmpty!37811 m!945345))

(declare-fun m!945347 () Bool)

(assert (=> b!1026979 m!945347))

(declare-fun m!945349 () Bool)

(assert (=> b!1026975 m!945349))

(declare-fun m!945351 () Bool)

(assert (=> b!1026971 m!945351))

(declare-fun m!945353 () Bool)

(assert (=> b!1026980 m!945353))

(declare-fun m!945355 () Bool)

(assert (=> b!1026980 m!945355))

(declare-fun m!945357 () Bool)

(assert (=> b!1026980 m!945357))

(declare-fun m!945359 () Bool)

(assert (=> b!1026980 m!945359))

(declare-fun m!945361 () Bool)

(assert (=> b!1026980 m!945361))

(declare-fun m!945363 () Bool)

(assert (=> b!1026980 m!945363))

(declare-fun m!945365 () Bool)

(assert (=> b!1026980 m!945365))

(declare-fun m!945367 () Bool)

(assert (=> b!1026980 m!945367))

(declare-fun m!945369 () Bool)

(assert (=> b!1026980 m!945369))

(declare-fun m!945371 () Bool)

(assert (=> b!1026980 m!945371))

(declare-fun m!945373 () Bool)

(assert (=> b!1026980 m!945373))

(declare-fun m!945375 () Bool)

(assert (=> b!1026976 m!945375))

(declare-fun m!945377 () Bool)

(assert (=> b!1026976 m!945377))

(check-sat (not b!1026975) (not b!1026971) (not mapNonEmpty!37811) (not start!89536) (not b!1026980) (not b!1026976) b_and!32781 tp_is_empty!24255 (not b_next!20535) (not b!1026979))
(check-sat b_and!32781 (not b_next!20535))
