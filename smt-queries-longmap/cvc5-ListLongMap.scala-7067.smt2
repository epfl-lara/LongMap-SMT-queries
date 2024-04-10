; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89456 () Bool)

(assert start!89456)

(declare-fun b!1025875 () Bool)

(declare-fun b_free!20455 () Bool)

(declare-fun b_next!20455 () Bool)

(assert (=> b!1025875 (= b_free!20455 (not b_next!20455))))

(declare-fun tp!72410 () Bool)

(declare-fun b_and!32701 () Bool)

(assert (=> b!1025875 (= tp!72410 b_and!32701)))

(declare-fun res!686809 () Bool)

(declare-fun e!578511 () Bool)

(assert (=> start!89456 (=> (not res!686809) (not e!578511))))

(declare-datatypes ((V!37107 0))(
  ( (V!37108 (val!12138 Int)) )
))
(declare-datatypes ((ValueCell!11384 0))(
  ( (ValueCellFull!11384 (v!14707 V!37107)) (EmptyCell!11384) )
))
(declare-datatypes ((array!64400 0))(
  ( (array!64401 (arr!31009 (Array (_ BitVec 32) (_ BitVec 64))) (size!31522 (_ BitVec 32))) )
))
(declare-datatypes ((array!64402 0))(
  ( (array!64403 (arr!31010 (Array (_ BitVec 32) ValueCell!11384)) (size!31523 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5362 0))(
  ( (LongMapFixedSize!5363 (defaultEntry!6033 Int) (mask!29713 (_ BitVec 32)) (extraKeys!5765 (_ BitVec 32)) (zeroValue!5869 V!37107) (minValue!5869 V!37107) (_size!2736 (_ BitVec 32)) (_keys!11180 array!64400) (_values!6056 array!64402) (_vacant!2736 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5362)

(declare-fun valid!2039 (LongMapFixedSize!5362) Bool)

(assert (=> start!89456 (= res!686809 (valid!2039 thiss!1427))))

(assert (=> start!89456 e!578511))

(declare-fun e!578517 () Bool)

(assert (=> start!89456 e!578517))

(assert (=> start!89456 true))

(declare-fun mapIsEmpty!37691 () Bool)

(declare-fun mapRes!37691 () Bool)

(assert (=> mapIsEmpty!37691 mapRes!37691))

(declare-fun tp_is_empty!24175 () Bool)

(declare-fun e!578515 () Bool)

(declare-fun array_inv!24017 (array!64400) Bool)

(declare-fun array_inv!24018 (array!64402) Bool)

(assert (=> b!1025875 (= e!578517 (and tp!72410 tp_is_empty!24175 (array_inv!24017 (_keys!11180 thiss!1427)) (array_inv!24018 (_values!6056 thiss!1427)) e!578515))))

(declare-fun b!1025876 () Bool)

(declare-fun e!578512 () Bool)

(declare-fun e!578514 () Bool)

(assert (=> b!1025876 (= e!578512 (not e!578514))))

(declare-fun res!686807 () Bool)

(assert (=> b!1025876 (=> res!686807 e!578514)))

(declare-datatypes ((SeekEntryResult!9632 0))(
  ( (MissingZero!9632 (index!40899 (_ BitVec 32))) (Found!9632 (index!40900 (_ BitVec 32))) (Intermediate!9632 (undefined!10444 Bool) (index!40901 (_ BitVec 32)) (x!91238 (_ BitVec 32))) (Undefined!9632) (MissingVacant!9632 (index!40902 (_ BitVec 32))) )
))
(declare-fun lt!451146 () SeekEntryResult!9632)

(assert (=> b!1025876 (= res!686807 (or (bvslt (index!40900 lt!451146) #b00000000000000000000000000000000) (bvsge (index!40900 lt!451146) (size!31522 (_keys!11180 thiss!1427))) (bvsge (size!31522 (_keys!11180 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451145 () array!64400)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64400 (_ BitVec 32)) Bool)

(assert (=> b!1025876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451145 (mask!29713 thiss!1427))))

(declare-datatypes ((Unit!33411 0))(
  ( (Unit!33412) )
))
(declare-fun lt!451143 () Unit!33411)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64400 (_ BitVec 32) (_ BitVec 32)) Unit!33411)

(assert (=> b!1025876 (= lt!451143 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11180 thiss!1427) (index!40900 lt!451146) (mask!29713 thiss!1427)))))

(declare-datatypes ((List!21763 0))(
  ( (Nil!21760) (Cons!21759 (h!22957 (_ BitVec 64)) (t!30825 List!21763)) )
))
(declare-fun arrayNoDuplicates!0 (array!64400 (_ BitVec 32) List!21763) Bool)

(assert (=> b!1025876 (arrayNoDuplicates!0 lt!451145 #b00000000000000000000000000000000 Nil!21760)))

(declare-fun lt!451141 () Unit!33411)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64400 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21763) Unit!33411)

(assert (=> b!1025876 (= lt!451141 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11180 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40900 lt!451146) #b00000000000000000000000000000000 Nil!21760))))

(declare-fun arrayCountValidKeys!0 (array!64400 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025876 (= (arrayCountValidKeys!0 lt!451145 #b00000000000000000000000000000000 (size!31522 (_keys!11180 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11180 thiss!1427) #b00000000000000000000000000000000 (size!31522 (_keys!11180 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025876 (= lt!451145 (array!64401 (store (arr!31009 (_keys!11180 thiss!1427)) (index!40900 lt!451146) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31522 (_keys!11180 thiss!1427))))))

(declare-fun lt!451144 () Unit!33411)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64400 (_ BitVec 32) (_ BitVec 64)) Unit!33411)

(assert (=> b!1025876 (= lt!451144 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11180 thiss!1427) (index!40900 lt!451146) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025877 () Bool)

(assert (=> b!1025877 (= e!578514 true)))

(declare-fun lt!451142 () Bool)

(assert (=> b!1025877 (= lt!451142 (arrayNoDuplicates!0 (_keys!11180 thiss!1427) #b00000000000000000000000000000000 Nil!21760))))

(declare-fun b!1025878 () Bool)

(declare-fun res!686810 () Bool)

(assert (=> b!1025878 (=> (not res!686810) (not e!578511))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025878 (= res!686810 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025879 () Bool)

(declare-fun e!578518 () Bool)

(assert (=> b!1025879 (= e!578518 tp_is_empty!24175)))

(declare-fun b!1025880 () Bool)

(assert (=> b!1025880 (= e!578511 e!578512)))

(declare-fun res!686808 () Bool)

(assert (=> b!1025880 (=> (not res!686808) (not e!578512))))

(assert (=> b!1025880 (= res!686808 (is-Found!9632 lt!451146))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64400 (_ BitVec 32)) SeekEntryResult!9632)

(assert (=> b!1025880 (= lt!451146 (seekEntry!0 key!909 (_keys!11180 thiss!1427) (mask!29713 thiss!1427)))))

(declare-fun b!1025881 () Bool)

(assert (=> b!1025881 (= e!578515 (and e!578518 mapRes!37691))))

(declare-fun condMapEmpty!37691 () Bool)

(declare-fun mapDefault!37691 () ValueCell!11384)

