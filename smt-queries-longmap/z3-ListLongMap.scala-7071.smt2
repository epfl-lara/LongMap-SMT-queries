; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89478 () Bool)

(assert start!89478)

(declare-fun b!1026016 () Bool)

(declare-fun b_free!20479 () Bool)

(declare-fun b_next!20479 () Bool)

(assert (=> b!1026016 (= b_free!20479 (not b_next!20479))))

(declare-fun tp!72482 () Bool)

(declare-fun b_and!32699 () Bool)

(assert (=> b!1026016 (= tp!72482 b_and!32699)))

(declare-fun b!1026012 () Bool)

(declare-fun e!578708 () Bool)

(declare-fun tp_is_empty!24199 () Bool)

(assert (=> b!1026012 (= e!578708 tp_is_empty!24199)))

(declare-fun b!1026013 () Bool)

(declare-fun res!686887 () Bool)

(declare-fun e!578713 () Bool)

(assert (=> b!1026013 (=> (not res!686887) (not e!578713))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026013 (= res!686887 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37727 () Bool)

(declare-fun mapRes!37727 () Bool)

(assert (=> mapIsEmpty!37727 mapRes!37727))

(declare-fun b!1026014 () Bool)

(declare-fun e!578715 () Bool)

(assert (=> b!1026014 (= e!578715 (and e!578708 mapRes!37727))))

(declare-fun condMapEmpty!37727 () Bool)

(declare-datatypes ((V!37139 0))(
  ( (V!37140 (val!12150 Int)) )
))
(declare-datatypes ((ValueCell!11396 0))(
  ( (ValueCellFull!11396 (v!14718 V!37139)) (EmptyCell!11396) )
))
(declare-datatypes ((array!64387 0))(
  ( (array!64388 (arr!31002 (Array (_ BitVec 32) (_ BitVec 64))) (size!31517 (_ BitVec 32))) )
))
(declare-datatypes ((array!64389 0))(
  ( (array!64390 (arr!31003 (Array (_ BitVec 32) ValueCell!11396)) (size!31518 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5386 0))(
  ( (LongMapFixedSize!5387 (defaultEntry!6045 Int) (mask!29728 (_ BitVec 32)) (extraKeys!5777 (_ BitVec 32)) (zeroValue!5881 V!37139) (minValue!5881 V!37139) (_size!2748 (_ BitVec 32)) (_keys!11188 array!64387) (_values!6068 array!64389) (_vacant!2748 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5386)

(declare-fun mapDefault!37727 () ValueCell!11396)

(assert (=> b!1026014 (= condMapEmpty!37727 (= (arr!31003 (_values!6068 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11396)) mapDefault!37727)))))

(declare-fun b!1026015 () Bool)

(declare-fun e!578709 () Bool)

(assert (=> b!1026015 (= e!578709 true)))

(declare-fun lt!451161 () Bool)

(declare-datatypes ((List!21807 0))(
  ( (Nil!21804) (Cons!21803 (h!23001 (_ BitVec 64)) (t!30860 List!21807)) )
))
(declare-fun arrayNoDuplicates!0 (array!64387 (_ BitVec 32) List!21807) Bool)

(assert (=> b!1026015 (= lt!451161 (arrayNoDuplicates!0 (_keys!11188 thiss!1427) #b00000000000000000000000000000000 Nil!21804))))

(declare-fun e!578711 () Bool)

(declare-fun array_inv!24021 (array!64387) Bool)

(declare-fun array_inv!24022 (array!64389) Bool)

(assert (=> b!1026016 (= e!578711 (and tp!72482 tp_is_empty!24199 (array_inv!24021 (_keys!11188 thiss!1427)) (array_inv!24022 (_values!6068 thiss!1427)) e!578715))))

(declare-fun b!1026017 () Bool)

(declare-fun e!578710 () Bool)

(assert (=> b!1026017 (= e!578710 tp_is_empty!24199)))

(declare-fun b!1026018 () Bool)

(declare-fun e!578714 () Bool)

(assert (=> b!1026018 (= e!578714 (not e!578709))))

(declare-fun res!686884 () Bool)

(assert (=> b!1026018 (=> res!686884 e!578709)))

(declare-datatypes ((SeekEntryResult!9634 0))(
  ( (MissingZero!9634 (index!40907 (_ BitVec 32))) (Found!9634 (index!40908 (_ BitVec 32))) (Intermediate!9634 (undefined!10446 Bool) (index!40909 (_ BitVec 32)) (x!91269 (_ BitVec 32))) (Undefined!9634) (MissingVacant!9634 (index!40910 (_ BitVec 32))) )
))
(declare-fun lt!451160 () SeekEntryResult!9634)

(assert (=> b!1026018 (= res!686884 (or (bvslt (index!40908 lt!451160) #b00000000000000000000000000000000) (bvsge (index!40908 lt!451160) (size!31517 (_keys!11188 thiss!1427))) (bvsge (size!31517 (_keys!11188 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451158 () array!64387)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64387 (_ BitVec 32)) Bool)

(assert (=> b!1026018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451158 (mask!29728 thiss!1427))))

(declare-datatypes ((Unit!33321 0))(
  ( (Unit!33322) )
))
(declare-fun lt!451157 () Unit!33321)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64387 (_ BitVec 32) (_ BitVec 32)) Unit!33321)

(assert (=> b!1026018 (= lt!451157 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11188 thiss!1427) (index!40908 lt!451160) (mask!29728 thiss!1427)))))

(assert (=> b!1026018 (arrayNoDuplicates!0 lt!451158 #b00000000000000000000000000000000 Nil!21804)))

(declare-fun lt!451159 () Unit!33321)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64387 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21807) Unit!33321)

(assert (=> b!1026018 (= lt!451159 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11188 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40908 lt!451160) #b00000000000000000000000000000000 Nil!21804))))

(declare-fun arrayCountValidKeys!0 (array!64387 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026018 (= (arrayCountValidKeys!0 lt!451158 #b00000000000000000000000000000000 (size!31517 (_keys!11188 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11188 thiss!1427) #b00000000000000000000000000000000 (size!31517 (_keys!11188 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026018 (= lt!451158 (array!64388 (store (arr!31002 (_keys!11188 thiss!1427)) (index!40908 lt!451160) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31517 (_keys!11188 thiss!1427))))))

(declare-fun lt!451162 () Unit!33321)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64387 (_ BitVec 32) (_ BitVec 64)) Unit!33321)

(assert (=> b!1026018 (= lt!451162 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11188 thiss!1427) (index!40908 lt!451160) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37727 () Bool)

(declare-fun tp!72483 () Bool)

(assert (=> mapNonEmpty!37727 (= mapRes!37727 (and tp!72483 e!578710))))

(declare-fun mapValue!37727 () ValueCell!11396)

(declare-fun mapRest!37727 () (Array (_ BitVec 32) ValueCell!11396))

(declare-fun mapKey!37727 () (_ BitVec 32))

(assert (=> mapNonEmpty!37727 (= (arr!31003 (_values!6068 thiss!1427)) (store mapRest!37727 mapKey!37727 mapValue!37727))))

(declare-fun b!1026019 () Bool)

(assert (=> b!1026019 (= e!578713 e!578714)))

(declare-fun res!686885 () Bool)

(assert (=> b!1026019 (=> (not res!686885) (not e!578714))))

(get-info :version)

(assert (=> b!1026019 (= res!686885 ((_ is Found!9634) lt!451160))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64387 (_ BitVec 32)) SeekEntryResult!9634)

(assert (=> b!1026019 (= lt!451160 (seekEntry!0 key!909 (_keys!11188 thiss!1427) (mask!29728 thiss!1427)))))

(declare-fun res!686886 () Bool)

(assert (=> start!89478 (=> (not res!686886) (not e!578713))))

(declare-fun valid!2042 (LongMapFixedSize!5386) Bool)

(assert (=> start!89478 (= res!686886 (valid!2042 thiss!1427))))

(assert (=> start!89478 e!578713))

(assert (=> start!89478 e!578711))

(assert (=> start!89478 true))

(assert (= (and start!89478 res!686886) b!1026013))

(assert (= (and b!1026013 res!686887) b!1026019))

(assert (= (and b!1026019 res!686885) b!1026018))

(assert (= (and b!1026018 (not res!686884)) b!1026015))

(assert (= (and b!1026014 condMapEmpty!37727) mapIsEmpty!37727))

(assert (= (and b!1026014 (not condMapEmpty!37727)) mapNonEmpty!37727))

(assert (= (and mapNonEmpty!37727 ((_ is ValueCellFull!11396) mapValue!37727)) b!1026017))

(assert (= (and b!1026014 ((_ is ValueCellFull!11396) mapDefault!37727)) b!1026012))

(assert (= b!1026016 b!1026014))

(assert (= start!89478 b!1026016))

(declare-fun m!943763 () Bool)

(assert (=> b!1026016 m!943763))

(declare-fun m!943765 () Bool)

(assert (=> b!1026016 m!943765))

(declare-fun m!943767 () Bool)

(assert (=> b!1026019 m!943767))

(declare-fun m!943769 () Bool)

(assert (=> b!1026015 m!943769))

(declare-fun m!943771 () Bool)

(assert (=> b!1026018 m!943771))

(declare-fun m!943773 () Bool)

(assert (=> b!1026018 m!943773))

(declare-fun m!943775 () Bool)

(assert (=> b!1026018 m!943775))

(declare-fun m!943777 () Bool)

(assert (=> b!1026018 m!943777))

(declare-fun m!943779 () Bool)

(assert (=> b!1026018 m!943779))

(declare-fun m!943781 () Bool)

(assert (=> b!1026018 m!943781))

(declare-fun m!943783 () Bool)

(assert (=> b!1026018 m!943783))

(declare-fun m!943785 () Bool)

(assert (=> b!1026018 m!943785))

(declare-fun m!943787 () Bool)

(assert (=> mapNonEmpty!37727 m!943787))

(declare-fun m!943789 () Bool)

(assert (=> start!89478 m!943789))

(check-sat (not mapNonEmpty!37727) (not b!1026018) b_and!32699 (not start!89478) (not b_next!20479) (not b!1026019) tp_is_empty!24199 (not b!1026015) (not b!1026016))
(check-sat b_and!32699 (not b_next!20479))
