; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89448 () Bool)

(assert start!89448)

(declare-fun b!1025638 () Bool)

(declare-fun b_free!20449 () Bool)

(declare-fun b_next!20449 () Bool)

(assert (=> b!1025638 (= b_free!20449 (not b_next!20449))))

(declare-fun tp!72393 () Bool)

(declare-fun b_and!32669 () Bool)

(assert (=> b!1025638 (= tp!72393 b_and!32669)))

(declare-fun mapIsEmpty!37682 () Bool)

(declare-fun mapRes!37682 () Bool)

(assert (=> mapIsEmpty!37682 mapRes!37682))

(declare-fun b!1025631 () Bool)

(declare-fun e!578352 () Bool)

(declare-fun e!578351 () Bool)

(assert (=> b!1025631 (= e!578352 (not e!578351))))

(declare-fun res!686687 () Bool)

(assert (=> b!1025631 (=> res!686687 e!578351)))

(declare-datatypes ((V!37099 0))(
  ( (V!37100 (val!12135 Int)) )
))
(declare-datatypes ((ValueCell!11381 0))(
  ( (ValueCellFull!11381 (v!14703 V!37099)) (EmptyCell!11381) )
))
(declare-datatypes ((array!64327 0))(
  ( (array!64328 (arr!30972 (Array (_ BitVec 32) (_ BitVec 64))) (size!31487 (_ BitVec 32))) )
))
(declare-datatypes ((array!64329 0))(
  ( (array!64330 (arr!30973 (Array (_ BitVec 32) ValueCell!11381)) (size!31488 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5356 0))(
  ( (LongMapFixedSize!5357 (defaultEntry!6030 Int) (mask!29703 (_ BitVec 32)) (extraKeys!5762 (_ BitVec 32)) (zeroValue!5866 V!37099) (minValue!5866 V!37099) (_size!2733 (_ BitVec 32)) (_keys!11173 array!64327) (_values!6053 array!64329) (_vacant!2733 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5356)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025631 (= res!686687 (not (validMask!0 (mask!29703 thiss!1427))))))

(declare-fun lt!450895 () array!64327)

(declare-datatypes ((List!21795 0))(
  ( (Nil!21792) (Cons!21791 (h!22989 (_ BitVec 64)) (t!30848 List!21795)) )
))
(declare-fun arrayNoDuplicates!0 (array!64327 (_ BitVec 32) List!21795) Bool)

(assert (=> b!1025631 (arrayNoDuplicates!0 lt!450895 #b00000000000000000000000000000000 Nil!21792)))

(declare-datatypes ((Unit!33303 0))(
  ( (Unit!33304) )
))
(declare-fun lt!450894 () Unit!33303)

(declare-datatypes ((SeekEntryResult!9623 0))(
  ( (MissingZero!9623 (index!40863 (_ BitVec 32))) (Found!9623 (index!40864 (_ BitVec 32))) (Intermediate!9623 (undefined!10435 Bool) (index!40865 (_ BitVec 32)) (x!91218 (_ BitVec 32))) (Undefined!9623) (MissingVacant!9623 (index!40866 (_ BitVec 32))) )
))
(declare-fun lt!450898 () SeekEntryResult!9623)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64327 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21795) Unit!33303)

(assert (=> b!1025631 (= lt!450894 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11173 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40864 lt!450898) #b00000000000000000000000000000000 Nil!21792))))

(declare-fun arrayCountValidKeys!0 (array!64327 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025631 (= (arrayCountValidKeys!0 lt!450895 #b00000000000000000000000000000000 (size!31487 (_keys!11173 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11173 thiss!1427) #b00000000000000000000000000000000 (size!31487 (_keys!11173 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025631 (= lt!450895 (array!64328 (store (arr!30972 (_keys!11173 thiss!1427)) (index!40864 lt!450898) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31487 (_keys!11173 thiss!1427))))))

(declare-fun lt!450896 () Unit!33303)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64327 (_ BitVec 32) (_ BitVec 64)) Unit!33303)

(assert (=> b!1025631 (= lt!450896 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11173 thiss!1427) (index!40864 lt!450898) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025632 () Bool)

(declare-fun e!578355 () Bool)

(declare-fun tp_is_empty!24169 () Bool)

(assert (=> b!1025632 (= e!578355 tp_is_empty!24169)))

(declare-fun b!1025633 () Bool)

(declare-fun res!686685 () Bool)

(assert (=> b!1025633 (=> res!686685 e!578351)))

(assert (=> b!1025633 (= res!686685 (not (arrayNoDuplicates!0 (_keys!11173 thiss!1427) #b00000000000000000000000000000000 Nil!21792)))))

(declare-fun b!1025634 () Bool)

(declare-fun res!686684 () Bool)

(declare-fun e!578354 () Bool)

(assert (=> b!1025634 (=> (not res!686684) (not e!578354))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025634 (= res!686684 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025635 () Bool)

(assert (=> b!1025635 (= e!578354 e!578352)))

(declare-fun res!686689 () Bool)

(assert (=> b!1025635 (=> (not res!686689) (not e!578352))))

(get-info :version)

(assert (=> b!1025635 (= res!686689 ((_ is Found!9623) lt!450898))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64327 (_ BitVec 32)) SeekEntryResult!9623)

(assert (=> b!1025635 (= lt!450898 (seekEntry!0 key!909 (_keys!11173 thiss!1427) (mask!29703 thiss!1427)))))

(declare-fun b!1025636 () Bool)

(declare-fun e!578348 () Bool)

(assert (=> b!1025636 (= e!578348 tp_is_empty!24169)))

(declare-fun b!1025637 () Bool)

(assert (=> b!1025637 (= e!578351 true)))

(declare-fun lt!450897 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64327 (_ BitVec 32)) Bool)

(assert (=> b!1025637 (= lt!450897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11173 thiss!1427) (mask!29703 thiss!1427)))))

(declare-fun mapNonEmpty!37682 () Bool)

(declare-fun tp!72392 () Bool)

(assert (=> mapNonEmpty!37682 (= mapRes!37682 (and tp!72392 e!578348))))

(declare-fun mapKey!37682 () (_ BitVec 32))

(declare-fun mapRest!37682 () (Array (_ BitVec 32) ValueCell!11381))

(declare-fun mapValue!37682 () ValueCell!11381)

(assert (=> mapNonEmpty!37682 (= (arr!30973 (_values!6053 thiss!1427)) (store mapRest!37682 mapKey!37682 mapValue!37682))))

(declare-fun e!578350 () Bool)

(declare-fun e!578349 () Bool)

(declare-fun array_inv!23999 (array!64327) Bool)

(declare-fun array_inv!24000 (array!64329) Bool)

(assert (=> b!1025638 (= e!578350 (and tp!72393 tp_is_empty!24169 (array_inv!23999 (_keys!11173 thiss!1427)) (array_inv!24000 (_values!6053 thiss!1427)) e!578349))))

(declare-fun res!686683 () Bool)

(assert (=> start!89448 (=> (not res!686683) (not e!578354))))

(declare-fun valid!2030 (LongMapFixedSize!5356) Bool)

(assert (=> start!89448 (= res!686683 (valid!2030 thiss!1427))))

(assert (=> start!89448 e!578354))

(assert (=> start!89448 e!578350))

(assert (=> start!89448 true))

(declare-fun b!1025639 () Bool)

(declare-fun res!686686 () Bool)

(assert (=> b!1025639 (=> res!686686 e!578351)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025639 (= res!686686 (not (validKeyInArray!0 (select (arr!30972 (_keys!11173 thiss!1427)) (index!40864 lt!450898)))))))

(declare-fun b!1025640 () Bool)

(declare-fun res!686688 () Bool)

(assert (=> b!1025640 (=> res!686688 e!578351)))

(assert (=> b!1025640 (= res!686688 (or (not (= (size!31487 (_keys!11173 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29703 thiss!1427)))) (bvslt (index!40864 lt!450898) #b00000000000000000000000000000000) (bvsge (index!40864 lt!450898) (size!31487 (_keys!11173 thiss!1427)))))))

(declare-fun b!1025641 () Bool)

(assert (=> b!1025641 (= e!578349 (and e!578355 mapRes!37682))))

(declare-fun condMapEmpty!37682 () Bool)

(declare-fun mapDefault!37682 () ValueCell!11381)

(assert (=> b!1025641 (= condMapEmpty!37682 (= (arr!30973 (_values!6053 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11381)) mapDefault!37682)))))

(assert (= (and start!89448 res!686683) b!1025634))

(assert (= (and b!1025634 res!686684) b!1025635))

(assert (= (and b!1025635 res!686689) b!1025631))

(assert (= (and b!1025631 (not res!686687)) b!1025640))

(assert (= (and b!1025640 (not res!686688)) b!1025639))

(assert (= (and b!1025639 (not res!686686)) b!1025633))

(assert (= (and b!1025633 (not res!686685)) b!1025637))

(assert (= (and b!1025641 condMapEmpty!37682) mapIsEmpty!37682))

(assert (= (and b!1025641 (not condMapEmpty!37682)) mapNonEmpty!37682))

(assert (= (and mapNonEmpty!37682 ((_ is ValueCellFull!11381) mapValue!37682)) b!1025636))

(assert (= (and b!1025641 ((_ is ValueCellFull!11381) mapDefault!37682)) b!1025632))

(assert (= b!1025638 b!1025641))

(assert (= start!89448 b!1025638))

(declare-fun m!943331 () Bool)

(assert (=> b!1025631 m!943331))

(declare-fun m!943333 () Bool)

(assert (=> b!1025631 m!943333))

(declare-fun m!943335 () Bool)

(assert (=> b!1025631 m!943335))

(declare-fun m!943337 () Bool)

(assert (=> b!1025631 m!943337))

(declare-fun m!943339 () Bool)

(assert (=> b!1025631 m!943339))

(declare-fun m!943341 () Bool)

(assert (=> b!1025631 m!943341))

(declare-fun m!943343 () Bool)

(assert (=> b!1025631 m!943343))

(declare-fun m!943345 () Bool)

(assert (=> start!89448 m!943345))

(declare-fun m!943347 () Bool)

(assert (=> b!1025635 m!943347))

(declare-fun m!943349 () Bool)

(assert (=> b!1025633 m!943349))

(declare-fun m!943351 () Bool)

(assert (=> b!1025639 m!943351))

(assert (=> b!1025639 m!943351))

(declare-fun m!943353 () Bool)

(assert (=> b!1025639 m!943353))

(declare-fun m!943355 () Bool)

(assert (=> b!1025638 m!943355))

(declare-fun m!943357 () Bool)

(assert (=> b!1025638 m!943357))

(declare-fun m!943359 () Bool)

(assert (=> mapNonEmpty!37682 m!943359))

(declare-fun m!943361 () Bool)

(assert (=> b!1025637 m!943361))

(check-sat (not b!1025639) (not start!89448) (not b!1025635) (not b!1025637) tp_is_empty!24169 (not b!1025633) b_and!32669 (not mapNonEmpty!37682) (not b_next!20449) (not b!1025638) (not b!1025631))
(check-sat b_and!32669 (not b_next!20449))
