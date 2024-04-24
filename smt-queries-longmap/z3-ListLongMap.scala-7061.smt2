; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89654 () Bool)

(assert start!89654)

(declare-fun b!1026607 () Bool)

(declare-fun b_free!20419 () Bool)

(declare-fun b_next!20419 () Bool)

(assert (=> b!1026607 (= b_free!20419 (not b_next!20419))))

(declare-fun tp!72302 () Bool)

(declare-fun b_and!32675 () Bool)

(assert (=> b!1026607 (= tp!72302 b_and!32675)))

(declare-fun b!1026602 () Bool)

(declare-fun res!686951 () Bool)

(declare-fun e!578927 () Bool)

(assert (=> b!1026602 (=> res!686951 e!578927)))

(declare-datatypes ((V!37059 0))(
  ( (V!37060 (val!12120 Int)) )
))
(declare-datatypes ((ValueCell!11366 0))(
  ( (ValueCellFull!11366 (v!14685 V!37059)) (EmptyCell!11366) )
))
(declare-datatypes ((array!64377 0))(
  ( (array!64378 (arr!30991 (Array (_ BitVec 32) (_ BitVec 64))) (size!31505 (_ BitVec 32))) )
))
(declare-datatypes ((array!64379 0))(
  ( (array!64380 (arr!30992 (Array (_ BitVec 32) ValueCell!11366)) (size!31506 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5326 0))(
  ( (LongMapFixedSize!5327 (defaultEntry!6015 Int) (mask!29743 (_ BitVec 32)) (extraKeys!5747 (_ BitVec 32)) (zeroValue!5851 V!37059) (minValue!5851 V!37059) (_size!2718 (_ BitVec 32)) (_keys!11200 array!64377) (_values!6038 array!64379) (_vacant!2718 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5326)

(declare-datatypes ((SeekEntryResult!9572 0))(
  ( (MissingZero!9572 (index!40659 (_ BitVec 32))) (Found!9572 (index!40660 (_ BitVec 32))) (Intermediate!9572 (undefined!10384 Bool) (index!40661 (_ BitVec 32)) (x!91152 (_ BitVec 32))) (Undefined!9572) (MissingVacant!9572 (index!40662 (_ BitVec 32))) )
))
(declare-fun lt!451388 () SeekEntryResult!9572)

(assert (=> b!1026602 (= res!686951 (or (not (= (size!31505 (_keys!11200 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29743 thiss!1427)))) (bvslt (index!40660 lt!451388) #b00000000000000000000000000000000) (bvsge (index!40660 lt!451388) (size!31505 (_keys!11200 thiss!1427)))))))

(declare-fun b!1026603 () Bool)

(declare-fun e!578928 () Bool)

(assert (=> b!1026603 (= e!578928 (not e!578927))))

(declare-fun res!686947 () Bool)

(assert (=> b!1026603 (=> res!686947 e!578927)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026603 (= res!686947 (not (validMask!0 (mask!29743 thiss!1427))))))

(declare-fun lt!451387 () array!64377)

(declare-datatypes ((List!21736 0))(
  ( (Nil!21733) (Cons!21732 (h!22939 (_ BitVec 64)) (t!30790 List!21736)) )
))
(declare-fun arrayNoDuplicates!0 (array!64377 (_ BitVec 32) List!21736) Bool)

(assert (=> b!1026603 (arrayNoDuplicates!0 lt!451387 #b00000000000000000000000000000000 Nil!21733)))

(declare-datatypes ((Unit!33394 0))(
  ( (Unit!33395) )
))
(declare-fun lt!451384 () Unit!33394)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21736) Unit!33394)

(assert (=> b!1026603 (= lt!451384 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11200 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40660 lt!451388) #b00000000000000000000000000000000 Nil!21733))))

(declare-fun arrayCountValidKeys!0 (array!64377 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026603 (= (arrayCountValidKeys!0 lt!451387 #b00000000000000000000000000000000 (size!31505 (_keys!11200 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11200 thiss!1427) #b00000000000000000000000000000000 (size!31505 (_keys!11200 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026603 (= lt!451387 (array!64378 (store (arr!30991 (_keys!11200 thiss!1427)) (index!40660 lt!451388) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31505 (_keys!11200 thiss!1427))))))

(declare-fun lt!451385 () Unit!33394)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64377 (_ BitVec 32) (_ BitVec 64)) Unit!33394)

(assert (=> b!1026603 (= lt!451385 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11200 thiss!1427) (index!40660 lt!451388) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026604 () Bool)

(assert (=> b!1026604 (= e!578927 true)))

(declare-fun lt!451386 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64377 (_ BitVec 32)) Bool)

(assert (=> b!1026604 (= lt!451386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11200 thiss!1427) (mask!29743 thiss!1427)))))

(declare-fun b!1026605 () Bool)

(declare-fun e!578924 () Bool)

(declare-fun e!578925 () Bool)

(declare-fun mapRes!37637 () Bool)

(assert (=> b!1026605 (= e!578924 (and e!578925 mapRes!37637))))

(declare-fun condMapEmpty!37637 () Bool)

(declare-fun mapDefault!37637 () ValueCell!11366)

(assert (=> b!1026605 (= condMapEmpty!37637 (= (arr!30992 (_values!6038 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11366)) mapDefault!37637)))))

(declare-fun b!1026606 () Bool)

(declare-fun res!686950 () Bool)

(assert (=> b!1026606 (=> res!686950 e!578927)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1026606 (= res!686950 (not (validKeyInArray!0 (select (arr!30991 (_keys!11200 thiss!1427)) (index!40660 lt!451388)))))))

(declare-fun e!578923 () Bool)

(declare-fun tp_is_empty!24139 () Bool)

(declare-fun array_inv!24023 (array!64377) Bool)

(declare-fun array_inv!24024 (array!64379) Bool)

(assert (=> b!1026607 (= e!578923 (and tp!72302 tp_is_empty!24139 (array_inv!24023 (_keys!11200 thiss!1427)) (array_inv!24024 (_values!6038 thiss!1427)) e!578924))))

(declare-fun res!686946 () Bool)

(declare-fun e!578922 () Bool)

(assert (=> start!89654 (=> (not res!686946) (not e!578922))))

(declare-fun valid!2031 (LongMapFixedSize!5326) Bool)

(assert (=> start!89654 (= res!686946 (valid!2031 thiss!1427))))

(assert (=> start!89654 e!578922))

(assert (=> start!89654 e!578923))

(assert (=> start!89654 true))

(declare-fun b!1026608 () Bool)

(declare-fun res!686949 () Bool)

(assert (=> b!1026608 (=> (not res!686949) (not e!578922))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026608 (= res!686949 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026609 () Bool)

(assert (=> b!1026609 (= e!578925 tp_is_empty!24139)))

(declare-fun b!1026610 () Bool)

(assert (=> b!1026610 (= e!578922 e!578928)))

(declare-fun res!686945 () Bool)

(assert (=> b!1026610 (=> (not res!686945) (not e!578928))))

(get-info :version)

(assert (=> b!1026610 (= res!686945 ((_ is Found!9572) lt!451388))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64377 (_ BitVec 32)) SeekEntryResult!9572)

(assert (=> b!1026610 (= lt!451388 (seekEntry!0 key!909 (_keys!11200 thiss!1427) (mask!29743 thiss!1427)))))

(declare-fun mapNonEmpty!37637 () Bool)

(declare-fun tp!72303 () Bool)

(declare-fun e!578926 () Bool)

(assert (=> mapNonEmpty!37637 (= mapRes!37637 (and tp!72303 e!578926))))

(declare-fun mapValue!37637 () ValueCell!11366)

(declare-fun mapRest!37637 () (Array (_ BitVec 32) ValueCell!11366))

(declare-fun mapKey!37637 () (_ BitVec 32))

(assert (=> mapNonEmpty!37637 (= (arr!30992 (_values!6038 thiss!1427)) (store mapRest!37637 mapKey!37637 mapValue!37637))))

(declare-fun mapIsEmpty!37637 () Bool)

(assert (=> mapIsEmpty!37637 mapRes!37637))

(declare-fun b!1026611 () Bool)

(declare-fun res!686948 () Bool)

(assert (=> b!1026611 (=> res!686948 e!578927)))

(assert (=> b!1026611 (= res!686948 (not (arrayNoDuplicates!0 (_keys!11200 thiss!1427) #b00000000000000000000000000000000 Nil!21733)))))

(declare-fun b!1026612 () Bool)

(assert (=> b!1026612 (= e!578926 tp_is_empty!24139)))

(assert (= (and start!89654 res!686946) b!1026608))

(assert (= (and b!1026608 res!686949) b!1026610))

(assert (= (and b!1026610 res!686945) b!1026603))

(assert (= (and b!1026603 (not res!686947)) b!1026602))

(assert (= (and b!1026602 (not res!686951)) b!1026606))

(assert (= (and b!1026606 (not res!686950)) b!1026611))

(assert (= (and b!1026611 (not res!686948)) b!1026604))

(assert (= (and b!1026605 condMapEmpty!37637) mapIsEmpty!37637))

(assert (= (and b!1026605 (not condMapEmpty!37637)) mapNonEmpty!37637))

(assert (= (and mapNonEmpty!37637 ((_ is ValueCellFull!11366) mapValue!37637)) b!1026612))

(assert (= (and b!1026605 ((_ is ValueCellFull!11366) mapDefault!37637)) b!1026609))

(assert (= b!1026607 b!1026605))

(assert (= start!89654 b!1026607))

(declare-fun m!945135 () Bool)

(assert (=> mapNonEmpty!37637 m!945135))

(declare-fun m!945137 () Bool)

(assert (=> start!89654 m!945137))

(declare-fun m!945139 () Bool)

(assert (=> b!1026610 m!945139))

(declare-fun m!945141 () Bool)

(assert (=> b!1026611 m!945141))

(declare-fun m!945143 () Bool)

(assert (=> b!1026606 m!945143))

(assert (=> b!1026606 m!945143))

(declare-fun m!945145 () Bool)

(assert (=> b!1026606 m!945145))

(declare-fun m!945147 () Bool)

(assert (=> b!1026607 m!945147))

(declare-fun m!945149 () Bool)

(assert (=> b!1026607 m!945149))

(declare-fun m!945151 () Bool)

(assert (=> b!1026604 m!945151))

(declare-fun m!945153 () Bool)

(assert (=> b!1026603 m!945153))

(declare-fun m!945155 () Bool)

(assert (=> b!1026603 m!945155))

(declare-fun m!945157 () Bool)

(assert (=> b!1026603 m!945157))

(declare-fun m!945159 () Bool)

(assert (=> b!1026603 m!945159))

(declare-fun m!945161 () Bool)

(assert (=> b!1026603 m!945161))

(declare-fun m!945163 () Bool)

(assert (=> b!1026603 m!945163))

(declare-fun m!945165 () Bool)

(assert (=> b!1026603 m!945165))

(check-sat b_and!32675 (not b!1026607) tp_is_empty!24139 (not b!1026603) (not b!1026606) (not b_next!20419) (not start!89654) (not b!1026604) (not b!1026610) (not mapNonEmpty!37637) (not b!1026611))
(check-sat b_and!32675 (not b_next!20419))
