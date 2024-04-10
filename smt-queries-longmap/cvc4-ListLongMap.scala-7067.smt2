; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89460 () Bool)

(assert start!89460)

(declare-fun b!1025927 () Bool)

(declare-fun b_free!20459 () Bool)

(declare-fun b_next!20459 () Bool)

(assert (=> b!1025927 (= b_free!20459 (not b_next!20459))))

(declare-fun tp!72422 () Bool)

(declare-fun b_and!32705 () Bool)

(assert (=> b!1025927 (= tp!72422 b_and!32705)))

(declare-fun b!1025923 () Bool)

(declare-fun e!578562 () Bool)

(declare-fun e!578566 () Bool)

(assert (=> b!1025923 (= e!578562 e!578566)))

(declare-fun res!686833 () Bool)

(assert (=> b!1025923 (=> (not res!686833) (not e!578566))))

(declare-datatypes ((SeekEntryResult!9634 0))(
  ( (MissingZero!9634 (index!40907 (_ BitVec 32))) (Found!9634 (index!40908 (_ BitVec 32))) (Intermediate!9634 (undefined!10446 Bool) (index!40909 (_ BitVec 32)) (x!91240 (_ BitVec 32))) (Undefined!9634) (MissingVacant!9634 (index!40910 (_ BitVec 32))) )
))
(declare-fun lt!451178 () SeekEntryResult!9634)

(assert (=> b!1025923 (= res!686833 (is-Found!9634 lt!451178))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37111 0))(
  ( (V!37112 (val!12140 Int)) )
))
(declare-datatypes ((ValueCell!11386 0))(
  ( (ValueCellFull!11386 (v!14709 V!37111)) (EmptyCell!11386) )
))
(declare-datatypes ((array!64408 0))(
  ( (array!64409 (arr!31013 (Array (_ BitVec 32) (_ BitVec 64))) (size!31526 (_ BitVec 32))) )
))
(declare-datatypes ((array!64410 0))(
  ( (array!64411 (arr!31014 (Array (_ BitVec 32) ValueCell!11386)) (size!31527 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5366 0))(
  ( (LongMapFixedSize!5367 (defaultEntry!6035 Int) (mask!29715 (_ BitVec 32)) (extraKeys!5767 (_ BitVec 32)) (zeroValue!5871 V!37111) (minValue!5871 V!37111) (_size!2738 (_ BitVec 32)) (_keys!11182 array!64408) (_values!6058 array!64410) (_vacant!2738 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5366)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64408 (_ BitVec 32)) SeekEntryResult!9634)

(assert (=> b!1025923 (= lt!451178 (seekEntry!0 key!909 (_keys!11182 thiss!1427) (mask!29715 thiss!1427)))))

(declare-fun res!686831 () Bool)

(assert (=> start!89460 (=> (not res!686831) (not e!578562))))

(declare-fun valid!2041 (LongMapFixedSize!5366) Bool)

(assert (=> start!89460 (= res!686831 (valid!2041 thiss!1427))))

(assert (=> start!89460 e!578562))

(declare-fun e!578560 () Bool)

(assert (=> start!89460 e!578560))

(assert (=> start!89460 true))

(declare-fun b!1025924 () Bool)

(declare-fun e!578564 () Bool)

(assert (=> b!1025924 (= e!578564 true)))

(declare-fun lt!451181 () Bool)

(declare-datatypes ((List!21765 0))(
  ( (Nil!21762) (Cons!21761 (h!22959 (_ BitVec 64)) (t!30827 List!21765)) )
))
(declare-fun arrayNoDuplicates!0 (array!64408 (_ BitVec 32) List!21765) Bool)

(assert (=> b!1025924 (= lt!451181 (arrayNoDuplicates!0 (_keys!11182 thiss!1427) #b00000000000000000000000000000000 Nil!21762))))

(declare-fun mapNonEmpty!37697 () Bool)

(declare-fun mapRes!37697 () Bool)

(declare-fun tp!72423 () Bool)

(declare-fun e!578565 () Bool)

(assert (=> mapNonEmpty!37697 (= mapRes!37697 (and tp!72423 e!578565))))

(declare-fun mapValue!37697 () ValueCell!11386)

(declare-fun mapRest!37697 () (Array (_ BitVec 32) ValueCell!11386))

(declare-fun mapKey!37697 () (_ BitVec 32))

(assert (=> mapNonEmpty!37697 (= (arr!31014 (_values!6058 thiss!1427)) (store mapRest!37697 mapKey!37697 mapValue!37697))))

(declare-fun mapIsEmpty!37697 () Bool)

(assert (=> mapIsEmpty!37697 mapRes!37697))

(declare-fun b!1025925 () Bool)

(assert (=> b!1025925 (= e!578566 (not e!578564))))

(declare-fun res!686832 () Bool)

(assert (=> b!1025925 (=> res!686832 e!578564)))

(assert (=> b!1025925 (= res!686832 (or (bvslt (index!40908 lt!451178) #b00000000000000000000000000000000) (bvsge (index!40908 lt!451178) (size!31526 (_keys!11182 thiss!1427))) (bvsge (size!31526 (_keys!11182 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451179 () array!64408)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64408 (_ BitVec 32)) Bool)

(assert (=> b!1025925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451179 (mask!29715 thiss!1427))))

(declare-datatypes ((Unit!33415 0))(
  ( (Unit!33416) )
))
(declare-fun lt!451182 () Unit!33415)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64408 (_ BitVec 32) (_ BitVec 32)) Unit!33415)

(assert (=> b!1025925 (= lt!451182 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11182 thiss!1427) (index!40908 lt!451178) (mask!29715 thiss!1427)))))

(assert (=> b!1025925 (arrayNoDuplicates!0 lt!451179 #b00000000000000000000000000000000 Nil!21762)))

(declare-fun lt!451177 () Unit!33415)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64408 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21765) Unit!33415)

(assert (=> b!1025925 (= lt!451177 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11182 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40908 lt!451178) #b00000000000000000000000000000000 Nil!21762))))

(declare-fun arrayCountValidKeys!0 (array!64408 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025925 (= (arrayCountValidKeys!0 lt!451179 #b00000000000000000000000000000000 (size!31526 (_keys!11182 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11182 thiss!1427) #b00000000000000000000000000000000 (size!31526 (_keys!11182 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025925 (= lt!451179 (array!64409 (store (arr!31013 (_keys!11182 thiss!1427)) (index!40908 lt!451178) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31526 (_keys!11182 thiss!1427))))))

(declare-fun lt!451180 () Unit!33415)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64408 (_ BitVec 32) (_ BitVec 64)) Unit!33415)

(assert (=> b!1025925 (= lt!451180 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11182 thiss!1427) (index!40908 lt!451178) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025926 () Bool)

(declare-fun e!578563 () Bool)

(declare-fun tp_is_empty!24179 () Bool)

(assert (=> b!1025926 (= e!578563 tp_is_empty!24179)))

(declare-fun e!578561 () Bool)

(declare-fun array_inv!24021 (array!64408) Bool)

(declare-fun array_inv!24022 (array!64410) Bool)

(assert (=> b!1025927 (= e!578560 (and tp!72422 tp_is_empty!24179 (array_inv!24021 (_keys!11182 thiss!1427)) (array_inv!24022 (_values!6058 thiss!1427)) e!578561))))

(declare-fun b!1025928 () Bool)

(assert (=> b!1025928 (= e!578565 tp_is_empty!24179)))

(declare-fun b!1025929 () Bool)

(declare-fun res!686834 () Bool)

(assert (=> b!1025929 (=> (not res!686834) (not e!578562))))

(assert (=> b!1025929 (= res!686834 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025930 () Bool)

(assert (=> b!1025930 (= e!578561 (and e!578563 mapRes!37697))))

(declare-fun condMapEmpty!37697 () Bool)

(declare-fun mapDefault!37697 () ValueCell!11386)

