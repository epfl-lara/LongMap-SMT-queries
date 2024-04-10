; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89450 () Bool)

(assert start!89450)

(declare-fun b!1025787 () Bool)

(declare-fun b_free!20449 () Bool)

(declare-fun b_next!20449 () Bool)

(assert (=> b!1025787 (= b_free!20449 (not b_next!20449))))

(declare-fun tp!72392 () Bool)

(declare-fun b_and!32695 () Bool)

(assert (=> b!1025787 (= tp!72392 b_and!32695)))

(declare-fun res!686752 () Bool)

(declare-fun e!578445 () Bool)

(assert (=> start!89450 (=> (not res!686752) (not e!578445))))

(declare-datatypes ((V!37099 0))(
  ( (V!37100 (val!12135 Int)) )
))
(declare-datatypes ((ValueCell!11381 0))(
  ( (ValueCellFull!11381 (v!14704 V!37099)) (EmptyCell!11381) )
))
(declare-datatypes ((array!64388 0))(
  ( (array!64389 (arr!31003 (Array (_ BitVec 32) (_ BitVec 64))) (size!31516 (_ BitVec 32))) )
))
(declare-datatypes ((array!64390 0))(
  ( (array!64391 (arr!31004 (Array (_ BitVec 32) ValueCell!11381)) (size!31517 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5356 0))(
  ( (LongMapFixedSize!5357 (defaultEntry!6030 Int) (mask!29708 (_ BitVec 32)) (extraKeys!5762 (_ BitVec 32)) (zeroValue!5866 V!37099) (minValue!5866 V!37099) (_size!2733 (_ BitVec 32)) (_keys!11177 array!64388) (_values!6053 array!64390) (_vacant!2733 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5356)

(declare-fun valid!2036 (LongMapFixedSize!5356) Bool)

(assert (=> start!89450 (= res!686752 (valid!2036 thiss!1427))))

(assert (=> start!89450 e!578445))

(declare-fun e!578441 () Bool)

(assert (=> start!89450 e!578441))

(assert (=> start!89450 true))

(declare-fun b!1025782 () Bool)

(declare-fun e!578442 () Bool)

(assert (=> b!1025782 (= e!578442 true)))

(declare-fun lt!451098 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64388 (_ BitVec 32)) Bool)

(assert (=> b!1025782 (= lt!451098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11177 thiss!1427) (mask!29708 thiss!1427)))))

(declare-fun b!1025783 () Bool)

(declare-fun e!578440 () Bool)

(declare-fun tp_is_empty!24169 () Bool)

(assert (=> b!1025783 (= e!578440 tp_is_empty!24169)))

(declare-fun b!1025784 () Bool)

(declare-fun e!578439 () Bool)

(assert (=> b!1025784 (= e!578439 tp_is_empty!24169)))

(declare-fun mapNonEmpty!37682 () Bool)

(declare-fun mapRes!37682 () Bool)

(declare-fun tp!72393 () Bool)

(assert (=> mapNonEmpty!37682 (= mapRes!37682 (and tp!72393 e!578439))))

(declare-fun mapValue!37682 () ValueCell!11381)

(declare-fun mapKey!37682 () (_ BitVec 32))

(declare-fun mapRest!37682 () (Array (_ BitVec 32) ValueCell!11381))

(assert (=> mapNonEmpty!37682 (= (arr!31004 (_values!6053 thiss!1427)) (store mapRest!37682 mapKey!37682 mapValue!37682))))

(declare-fun b!1025785 () Bool)

(declare-fun res!686750 () Bool)

(assert (=> b!1025785 (=> res!686750 e!578442)))

(declare-datatypes ((List!21760 0))(
  ( (Nil!21757) (Cons!21756 (h!22954 (_ BitVec 64)) (t!30822 List!21760)) )
))
(declare-fun arrayNoDuplicates!0 (array!64388 (_ BitVec 32) List!21760) Bool)

(assert (=> b!1025785 (= res!686750 (not (arrayNoDuplicates!0 (_keys!11177 thiss!1427) #b00000000000000000000000000000000 Nil!21757)))))

(declare-fun b!1025786 () Bool)

(declare-fun e!578443 () Bool)

(assert (=> b!1025786 (= e!578445 e!578443)))

(declare-fun res!686756 () Bool)

(assert (=> b!1025786 (=> (not res!686756) (not e!578443))))

(declare-datatypes ((SeekEntryResult!9629 0))(
  ( (MissingZero!9629 (index!40887 (_ BitVec 32))) (Found!9629 (index!40888 (_ BitVec 32))) (Intermediate!9629 (undefined!10441 Bool) (index!40889 (_ BitVec 32)) (x!91227 (_ BitVec 32))) (Undefined!9629) (MissingVacant!9629 (index!40890 (_ BitVec 32))) )
))
(declare-fun lt!451096 () SeekEntryResult!9629)

(assert (=> b!1025786 (= res!686756 (is-Found!9629 lt!451096))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64388 (_ BitVec 32)) SeekEntryResult!9629)

(assert (=> b!1025786 (= lt!451096 (seekEntry!0 key!909 (_keys!11177 thiss!1427) (mask!29708 thiss!1427)))))

(declare-fun e!578446 () Bool)

(declare-fun array_inv!24011 (array!64388) Bool)

(declare-fun array_inv!24012 (array!64390) Bool)

(assert (=> b!1025787 (= e!578441 (and tp!72392 tp_is_empty!24169 (array_inv!24011 (_keys!11177 thiss!1427)) (array_inv!24012 (_values!6053 thiss!1427)) e!578446))))

(declare-fun mapIsEmpty!37682 () Bool)

(assert (=> mapIsEmpty!37682 mapRes!37682))

(declare-fun b!1025788 () Bool)

(declare-fun res!686754 () Bool)

(assert (=> b!1025788 (=> res!686754 e!578442)))

(assert (=> b!1025788 (= res!686754 (or (not (= (size!31516 (_keys!11177 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29708 thiss!1427)))) (bvslt (index!40888 lt!451096) #b00000000000000000000000000000000) (bvsge (index!40888 lt!451096) (size!31516 (_keys!11177 thiss!1427)))))))

(declare-fun b!1025789 () Bool)

(declare-fun res!686755 () Bool)

(assert (=> b!1025789 (=> (not res!686755) (not e!578445))))

(assert (=> b!1025789 (= res!686755 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025790 () Bool)

(assert (=> b!1025790 (= e!578443 (not e!578442))))

(declare-fun res!686751 () Bool)

(assert (=> b!1025790 (=> res!686751 e!578442)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025790 (= res!686751 (not (validMask!0 (mask!29708 thiss!1427))))))

(declare-fun lt!451097 () array!64388)

(assert (=> b!1025790 (arrayNoDuplicates!0 lt!451097 #b00000000000000000000000000000000 Nil!21757)))

(declare-datatypes ((Unit!33405 0))(
  ( (Unit!33406) )
))
(declare-fun lt!451094 () Unit!33405)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21760) Unit!33405)

(assert (=> b!1025790 (= lt!451094 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11177 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40888 lt!451096) #b00000000000000000000000000000000 Nil!21757))))

(declare-fun arrayCountValidKeys!0 (array!64388 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025790 (= (arrayCountValidKeys!0 lt!451097 #b00000000000000000000000000000000 (size!31516 (_keys!11177 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11177 thiss!1427) #b00000000000000000000000000000000 (size!31516 (_keys!11177 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025790 (= lt!451097 (array!64389 (store (arr!31003 (_keys!11177 thiss!1427)) (index!40888 lt!451096) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31516 (_keys!11177 thiss!1427))))))

(declare-fun lt!451095 () Unit!33405)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64388 (_ BitVec 32) (_ BitVec 64)) Unit!33405)

(assert (=> b!1025790 (= lt!451095 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11177 thiss!1427) (index!40888 lt!451096) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025791 () Bool)

(declare-fun res!686753 () Bool)

(assert (=> b!1025791 (=> res!686753 e!578442)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025791 (= res!686753 (not (validKeyInArray!0 (select (arr!31003 (_keys!11177 thiss!1427)) (index!40888 lt!451096)))))))

(declare-fun b!1025792 () Bool)

(assert (=> b!1025792 (= e!578446 (and e!578440 mapRes!37682))))

(declare-fun condMapEmpty!37682 () Bool)

(declare-fun mapDefault!37682 () ValueCell!11381)

