; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91076 () Bool)

(assert start!91076)

(declare-fun b!1039724 () Bool)

(declare-fun b_free!20941 () Bool)

(declare-fun b_next!20941 () Bool)

(assert (=> b!1039724 (= b_free!20941 (not b_next!20941))))

(declare-fun tp!73983 () Bool)

(declare-fun b_and!33483 () Bool)

(assert (=> b!1039724 (= tp!73983 b_and!33483)))

(declare-fun b!1039722 () Bool)

(declare-fun e!588389 () Bool)

(declare-fun e!588384 () Bool)

(declare-fun mapRes!38535 () Bool)

(assert (=> b!1039722 (= e!588389 (and e!588384 mapRes!38535))))

(declare-fun condMapEmpty!38535 () Bool)

(declare-datatypes ((V!37755 0))(
  ( (V!37756 (val!12381 Int)) )
))
(declare-datatypes ((ValueCell!11627 0))(
  ( (ValueCellFull!11627 (v!14963 V!37755)) (EmptyCell!11627) )
))
(declare-datatypes ((array!65485 0))(
  ( (array!65486 (arr!31513 (Array (_ BitVec 32) (_ BitVec 64))) (size!32044 (_ BitVec 32))) )
))
(declare-datatypes ((array!65487 0))(
  ( (array!65488 (arr!31514 (Array (_ BitVec 32) ValueCell!11627)) (size!32045 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5848 0))(
  ( (LongMapFixedSize!5849 (defaultEntry!6306 Int) (mask!30304 (_ BitVec 32)) (extraKeys!6034 (_ BitVec 32)) (zeroValue!6140 V!37755) (minValue!6140 V!37755) (_size!2979 (_ BitVec 32)) (_keys!11545 array!65485) (_values!6329 array!65487) (_vacant!2979 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5848)

(declare-fun mapDefault!38535 () ValueCell!11627)

(assert (=> b!1039722 (= condMapEmpty!38535 (= (arr!31514 (_values!6329 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11627)) mapDefault!38535)))))

(declare-fun b!1039723 () Bool)

(declare-fun e!588388 () Bool)

(declare-fun e!588385 () Bool)

(assert (=> b!1039723 (= e!588388 e!588385)))

(declare-fun res!693226 () Bool)

(assert (=> b!1039723 (=> (not res!693226) (not e!588385))))

(declare-datatypes ((SeekEntryResult!9725 0))(
  ( (MissingZero!9725 (index!41271 (_ BitVec 32))) (Found!9725 (index!41272 (_ BitVec 32))) (Intermediate!9725 (undefined!10537 Bool) (index!41273 (_ BitVec 32)) (x!92634 (_ BitVec 32))) (Undefined!9725) (MissingVacant!9725 (index!41274 (_ BitVec 32))) )
))
(declare-fun lt!458235 () SeekEntryResult!9725)

(get-info :version)

(assert (=> b!1039723 (= res!693226 ((_ is Found!9725) lt!458235))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65485 (_ BitVec 32)) SeekEntryResult!9725)

(assert (=> b!1039723 (= lt!458235 (seekEntry!0 key!909 (_keys!11545 thiss!1427) (mask!30304 thiss!1427)))))

(declare-fun tp_is_empty!24661 () Bool)

(declare-fun e!588386 () Bool)

(declare-fun array_inv!24377 (array!65485) Bool)

(declare-fun array_inv!24378 (array!65487) Bool)

(assert (=> b!1039724 (= e!588386 (and tp!73983 tp_is_empty!24661 (array_inv!24377 (_keys!11545 thiss!1427)) (array_inv!24378 (_values!6329 thiss!1427)) e!588389))))

(declare-fun b!1039725 () Bool)

(declare-fun e!588387 () Bool)

(assert (=> b!1039725 (= e!588387 tp_is_empty!24661)))

(declare-fun res!693228 () Bool)

(assert (=> start!91076 (=> (not res!693228) (not e!588388))))

(declare-fun valid!2209 (LongMapFixedSize!5848) Bool)

(assert (=> start!91076 (= res!693228 (valid!2209 thiss!1427))))

(assert (=> start!91076 e!588388))

(assert (=> start!91076 e!588386))

(assert (=> start!91076 true))

(declare-fun mapNonEmpty!38535 () Bool)

(declare-fun tp!73984 () Bool)

(assert (=> mapNonEmpty!38535 (= mapRes!38535 (and tp!73984 e!588387))))

(declare-fun mapRest!38535 () (Array (_ BitVec 32) ValueCell!11627))

(declare-fun mapValue!38535 () ValueCell!11627)

(declare-fun mapKey!38535 () (_ BitVec 32))

(assert (=> mapNonEmpty!38535 (= (arr!31514 (_values!6329 thiss!1427)) (store mapRest!38535 mapKey!38535 mapValue!38535))))

(declare-fun b!1039726 () Bool)

(declare-fun res!693227 () Bool)

(assert (=> b!1039726 (=> (not res!693227) (not e!588388))))

(assert (=> b!1039726 (= res!693227 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039727 () Bool)

(assert (=> b!1039727 (= e!588384 tp_is_empty!24661)))

(declare-fun b!1039728 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1039728 (= e!588385 (not (validMask!0 (mask!30304 thiss!1427))))))

(declare-fun lt!458238 () array!65485)

(declare-datatypes ((List!21925 0))(
  ( (Nil!21922) (Cons!21921 (h!23133 (_ BitVec 64)) (t!31131 List!21925)) )
))
(declare-fun arrayNoDuplicates!0 (array!65485 (_ BitVec 32) List!21925) Bool)

(assert (=> b!1039728 (arrayNoDuplicates!0 lt!458238 #b00000000000000000000000000000000 Nil!21922)))

(declare-datatypes ((Unit!33977 0))(
  ( (Unit!33978) )
))
(declare-fun lt!458236 () Unit!33977)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21925) Unit!33977)

(assert (=> b!1039728 (= lt!458236 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11545 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41272 lt!458235) #b00000000000000000000000000000000 Nil!21922))))

(declare-fun arrayCountValidKeys!0 (array!65485 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039728 (= (arrayCountValidKeys!0 lt!458238 #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039728 (= lt!458238 (array!65486 (store (arr!31513 (_keys!11545 thiss!1427)) (index!41272 lt!458235) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32044 (_keys!11545 thiss!1427))))))

(declare-fun lt!458237 () Unit!33977)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65485 (_ BitVec 32) (_ BitVec 64)) Unit!33977)

(assert (=> b!1039728 (= lt!458237 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11545 thiss!1427) (index!41272 lt!458235) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38535 () Bool)

(assert (=> mapIsEmpty!38535 mapRes!38535))

(assert (= (and start!91076 res!693228) b!1039726))

(assert (= (and b!1039726 res!693227) b!1039723))

(assert (= (and b!1039723 res!693226) b!1039728))

(assert (= (and b!1039722 condMapEmpty!38535) mapIsEmpty!38535))

(assert (= (and b!1039722 (not condMapEmpty!38535)) mapNonEmpty!38535))

(assert (= (and mapNonEmpty!38535 ((_ is ValueCellFull!11627) mapValue!38535)) b!1039725))

(assert (= (and b!1039722 ((_ is ValueCellFull!11627) mapDefault!38535)) b!1039727))

(assert (= b!1039724 b!1039722))

(assert (= start!91076 b!1039724))

(declare-fun m!960013 () Bool)

(assert (=> b!1039723 m!960013))

(declare-fun m!960015 () Bool)

(assert (=> b!1039728 m!960015))

(declare-fun m!960017 () Bool)

(assert (=> b!1039728 m!960017))

(declare-fun m!960019 () Bool)

(assert (=> b!1039728 m!960019))

(declare-fun m!960021 () Bool)

(assert (=> b!1039728 m!960021))

(declare-fun m!960023 () Bool)

(assert (=> b!1039728 m!960023))

(declare-fun m!960025 () Bool)

(assert (=> b!1039728 m!960025))

(declare-fun m!960027 () Bool)

(assert (=> b!1039728 m!960027))

(declare-fun m!960029 () Bool)

(assert (=> mapNonEmpty!38535 m!960029))

(declare-fun m!960031 () Bool)

(assert (=> b!1039724 m!960031))

(declare-fun m!960033 () Bool)

(assert (=> b!1039724 m!960033))

(declare-fun m!960035 () Bool)

(assert (=> start!91076 m!960035))

(check-sat (not b!1039728) b_and!33483 (not b_next!20941) (not start!91076) (not b!1039724) tp_is_empty!24661 (not b!1039723) (not mapNonEmpty!38535))
(check-sat b_and!33483 (not b_next!20941))
(get-model)

(declare-fun b!1039779 () Bool)

(declare-fun res!693258 () Bool)

(declare-fun e!588437 () Bool)

(assert (=> b!1039779 (=> (not res!693258) (not e!588437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039779 (= res!693258 (validKeyInArray!0 (select (arr!31513 (_keys!11545 thiss!1427)) (index!41272 lt!458235))))))

(declare-fun b!1039782 () Bool)

(declare-fun e!588436 () Bool)

(assert (=> b!1039782 (= e!588436 (= (arrayCountValidKeys!0 (array!65486 (store (arr!31513 (_keys!11545 thiss!1427)) (index!41272 lt!458235) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32044 (_keys!11545 thiss!1427))) #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125795 () Bool)

(assert (=> d!125795 e!588436))

(declare-fun res!693256 () Bool)

(assert (=> d!125795 (=> (not res!693256) (not e!588436))))

(assert (=> d!125795 (= res!693256 (and (bvsge (index!41272 lt!458235) #b00000000000000000000000000000000) (bvslt (index!41272 lt!458235) (size!32044 (_keys!11545 thiss!1427)))))))

(declare-fun lt!458265 () Unit!33977)

(declare-fun choose!82 (array!65485 (_ BitVec 32) (_ BitVec 64)) Unit!33977)

(assert (=> d!125795 (= lt!458265 (choose!82 (_keys!11545 thiss!1427) (index!41272 lt!458235) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125795 e!588437))

(declare-fun res!693255 () Bool)

(assert (=> d!125795 (=> (not res!693255) (not e!588437))))

(assert (=> d!125795 (= res!693255 (and (bvsge (index!41272 lt!458235) #b00000000000000000000000000000000) (bvslt (index!41272 lt!458235) (size!32044 (_keys!11545 thiss!1427)))))))

(assert (=> d!125795 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11545 thiss!1427) (index!41272 lt!458235) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458265)))

(declare-fun b!1039780 () Bool)

(declare-fun res!693257 () Bool)

(assert (=> b!1039780 (=> (not res!693257) (not e!588437))))

(assert (=> b!1039780 (= res!693257 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039781 () Bool)

(assert (=> b!1039781 (= e!588437 (bvslt (size!32044 (_keys!11545 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!125795 res!693255) b!1039779))

(assert (= (and b!1039779 res!693258) b!1039780))

(assert (= (and b!1039780 res!693257) b!1039781))

(assert (= (and d!125795 res!693256) b!1039782))

(declare-fun m!960085 () Bool)

(assert (=> b!1039779 m!960085))

(assert (=> b!1039779 m!960085))

(declare-fun m!960087 () Bool)

(assert (=> b!1039779 m!960087))

(assert (=> b!1039782 m!960019))

(declare-fun m!960089 () Bool)

(assert (=> b!1039782 m!960089))

(assert (=> b!1039782 m!960023))

(declare-fun m!960091 () Bool)

(assert (=> d!125795 m!960091))

(declare-fun m!960093 () Bool)

(assert (=> b!1039780 m!960093))

(assert (=> b!1039728 d!125795))

(declare-fun d!125797 () Bool)

(declare-fun e!588440 () Bool)

(assert (=> d!125797 e!588440))

(declare-fun res!693261 () Bool)

(assert (=> d!125797 (=> (not res!693261) (not e!588440))))

(assert (=> d!125797 (= res!693261 (and (bvsge (index!41272 lt!458235) #b00000000000000000000000000000000) (bvslt (index!41272 lt!458235) (size!32044 (_keys!11545 thiss!1427)))))))

(declare-fun lt!458268 () Unit!33977)

(declare-fun choose!53 (array!65485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21925) Unit!33977)

(assert (=> d!125797 (= lt!458268 (choose!53 (_keys!11545 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41272 lt!458235) #b00000000000000000000000000000000 Nil!21922))))

(assert (=> d!125797 (bvslt (size!32044 (_keys!11545 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125797 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11545 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41272 lt!458235) #b00000000000000000000000000000000 Nil!21922) lt!458268)))

(declare-fun b!1039785 () Bool)

(assert (=> b!1039785 (= e!588440 (arrayNoDuplicates!0 (array!65486 (store (arr!31513 (_keys!11545 thiss!1427)) (index!41272 lt!458235) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32044 (_keys!11545 thiss!1427))) #b00000000000000000000000000000000 Nil!21922))))

(assert (= (and d!125797 res!693261) b!1039785))

(declare-fun m!960095 () Bool)

(assert (=> d!125797 m!960095))

(assert (=> b!1039785 m!960019))

(declare-fun m!960097 () Bool)

(assert (=> b!1039785 m!960097))

(assert (=> b!1039728 d!125797))

(declare-fun b!1039796 () Bool)

(declare-fun e!588450 () Bool)

(declare-fun contains!6064 (List!21925 (_ BitVec 64)) Bool)

(assert (=> b!1039796 (= e!588450 (contains!6064 Nil!21922 (select (arr!31513 lt!458238) #b00000000000000000000000000000000)))))

(declare-fun b!1039797 () Bool)

(declare-fun e!588449 () Bool)

(declare-fun call!44011 () Bool)

(assert (=> b!1039797 (= e!588449 call!44011)))

(declare-fun b!1039798 () Bool)

(declare-fun e!588451 () Bool)

(assert (=> b!1039798 (= e!588451 e!588449)))

(declare-fun c!105611 () Bool)

(assert (=> b!1039798 (= c!105611 (validKeyInArray!0 (select (arr!31513 lt!458238) #b00000000000000000000000000000000)))))

(declare-fun d!125799 () Bool)

(declare-fun res!693269 () Bool)

(declare-fun e!588452 () Bool)

(assert (=> d!125799 (=> res!693269 e!588452)))

(assert (=> d!125799 (= res!693269 (bvsge #b00000000000000000000000000000000 (size!32044 lt!458238)))))

(assert (=> d!125799 (= (arrayNoDuplicates!0 lt!458238 #b00000000000000000000000000000000 Nil!21922) e!588452)))

(declare-fun b!1039799 () Bool)

(assert (=> b!1039799 (= e!588449 call!44011)))

(declare-fun b!1039800 () Bool)

(assert (=> b!1039800 (= e!588452 e!588451)))

(declare-fun res!693270 () Bool)

(assert (=> b!1039800 (=> (not res!693270) (not e!588451))))

(assert (=> b!1039800 (= res!693270 (not e!588450))))

(declare-fun res!693268 () Bool)

(assert (=> b!1039800 (=> (not res!693268) (not e!588450))))

(assert (=> b!1039800 (= res!693268 (validKeyInArray!0 (select (arr!31513 lt!458238) #b00000000000000000000000000000000)))))

(declare-fun bm!44008 () Bool)

(assert (=> bm!44008 (= call!44011 (arrayNoDuplicates!0 lt!458238 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105611 (Cons!21921 (select (arr!31513 lt!458238) #b00000000000000000000000000000000) Nil!21922) Nil!21922)))))

(assert (= (and d!125799 (not res!693269)) b!1039800))

(assert (= (and b!1039800 res!693268) b!1039796))

(assert (= (and b!1039800 res!693270) b!1039798))

(assert (= (and b!1039798 c!105611) b!1039799))

(assert (= (and b!1039798 (not c!105611)) b!1039797))

(assert (= (or b!1039799 b!1039797) bm!44008))

(declare-fun m!960099 () Bool)

(assert (=> b!1039796 m!960099))

(assert (=> b!1039796 m!960099))

(declare-fun m!960101 () Bool)

(assert (=> b!1039796 m!960101))

(assert (=> b!1039798 m!960099))

(assert (=> b!1039798 m!960099))

(declare-fun m!960103 () Bool)

(assert (=> b!1039798 m!960103))

(assert (=> b!1039800 m!960099))

(assert (=> b!1039800 m!960099))

(assert (=> b!1039800 m!960103))

(assert (=> bm!44008 m!960099))

(declare-fun m!960105 () Bool)

(assert (=> bm!44008 m!960105))

(assert (=> b!1039728 d!125799))

(declare-fun d!125801 () Bool)

(assert (=> d!125801 (= (validMask!0 (mask!30304 thiss!1427)) (and (or (= (mask!30304 thiss!1427) #b00000000000000000000000000000111) (= (mask!30304 thiss!1427) #b00000000000000000000000000001111) (= (mask!30304 thiss!1427) #b00000000000000000000000000011111) (= (mask!30304 thiss!1427) #b00000000000000000000000000111111) (= (mask!30304 thiss!1427) #b00000000000000000000000001111111) (= (mask!30304 thiss!1427) #b00000000000000000000000011111111) (= (mask!30304 thiss!1427) #b00000000000000000000000111111111) (= (mask!30304 thiss!1427) #b00000000000000000000001111111111) (= (mask!30304 thiss!1427) #b00000000000000000000011111111111) (= (mask!30304 thiss!1427) #b00000000000000000000111111111111) (= (mask!30304 thiss!1427) #b00000000000000000001111111111111) (= (mask!30304 thiss!1427) #b00000000000000000011111111111111) (= (mask!30304 thiss!1427) #b00000000000000000111111111111111) (= (mask!30304 thiss!1427) #b00000000000000001111111111111111) (= (mask!30304 thiss!1427) #b00000000000000011111111111111111) (= (mask!30304 thiss!1427) #b00000000000000111111111111111111) (= (mask!30304 thiss!1427) #b00000000000001111111111111111111) (= (mask!30304 thiss!1427) #b00000000000011111111111111111111) (= (mask!30304 thiss!1427) #b00000000000111111111111111111111) (= (mask!30304 thiss!1427) #b00000000001111111111111111111111) (= (mask!30304 thiss!1427) #b00000000011111111111111111111111) (= (mask!30304 thiss!1427) #b00000000111111111111111111111111) (= (mask!30304 thiss!1427) #b00000001111111111111111111111111) (= (mask!30304 thiss!1427) #b00000011111111111111111111111111) (= (mask!30304 thiss!1427) #b00000111111111111111111111111111) (= (mask!30304 thiss!1427) #b00001111111111111111111111111111) (= (mask!30304 thiss!1427) #b00011111111111111111111111111111) (= (mask!30304 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30304 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1039728 d!125801))

(declare-fun d!125803 () Bool)

(declare-fun lt!458271 () (_ BitVec 32))

(assert (=> d!125803 (and (bvsge lt!458271 #b00000000000000000000000000000000) (bvsle lt!458271 (bvsub (size!32044 lt!458238) #b00000000000000000000000000000000)))))

(declare-fun e!588458 () (_ BitVec 32))

(assert (=> d!125803 (= lt!458271 e!588458)))

(declare-fun c!105617 () Bool)

(assert (=> d!125803 (= c!105617 (bvsge #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))))))

(assert (=> d!125803 (and (bvsle #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32044 (_keys!11545 thiss!1427)) (size!32044 lt!458238)))))

(assert (=> d!125803 (= (arrayCountValidKeys!0 lt!458238 #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))) lt!458271)))

(declare-fun b!1039809 () Bool)

(assert (=> b!1039809 (= e!588458 #b00000000000000000000000000000000)))

(declare-fun bm!44011 () Bool)

(declare-fun call!44014 () (_ BitVec 32))

(assert (=> bm!44011 (= call!44014 (arrayCountValidKeys!0 lt!458238 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32044 (_keys!11545 thiss!1427))))))

(declare-fun b!1039810 () Bool)

(declare-fun e!588457 () (_ BitVec 32))

(assert (=> b!1039810 (= e!588458 e!588457)))

(declare-fun c!105616 () Bool)

(assert (=> b!1039810 (= c!105616 (validKeyInArray!0 (select (arr!31513 lt!458238) #b00000000000000000000000000000000)))))

(declare-fun b!1039811 () Bool)

(assert (=> b!1039811 (= e!588457 call!44014)))

(declare-fun b!1039812 () Bool)

(assert (=> b!1039812 (= e!588457 (bvadd #b00000000000000000000000000000001 call!44014))))

(assert (= (and d!125803 c!105617) b!1039809))

(assert (= (and d!125803 (not c!105617)) b!1039810))

(assert (= (and b!1039810 c!105616) b!1039812))

(assert (= (and b!1039810 (not c!105616)) b!1039811))

(assert (= (or b!1039812 b!1039811) bm!44011))

(declare-fun m!960107 () Bool)

(assert (=> bm!44011 m!960107))

(assert (=> b!1039810 m!960099))

(assert (=> b!1039810 m!960099))

(assert (=> b!1039810 m!960103))

(assert (=> b!1039728 d!125803))

(declare-fun d!125805 () Bool)

(declare-fun lt!458272 () (_ BitVec 32))

(assert (=> d!125805 (and (bvsge lt!458272 #b00000000000000000000000000000000) (bvsle lt!458272 (bvsub (size!32044 (_keys!11545 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588460 () (_ BitVec 32))

(assert (=> d!125805 (= lt!458272 e!588460)))

(declare-fun c!105619 () Bool)

(assert (=> d!125805 (= c!105619 (bvsge #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))))))

(assert (=> d!125805 (and (bvsle #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32044 (_keys!11545 thiss!1427)) (size!32044 (_keys!11545 thiss!1427))))))

(assert (=> d!125805 (= (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))) lt!458272)))

(declare-fun b!1039813 () Bool)

(assert (=> b!1039813 (= e!588460 #b00000000000000000000000000000000)))

(declare-fun bm!44012 () Bool)

(declare-fun call!44015 () (_ BitVec 32))

(assert (=> bm!44012 (= call!44015 (arrayCountValidKeys!0 (_keys!11545 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32044 (_keys!11545 thiss!1427))))))

(declare-fun b!1039814 () Bool)

(declare-fun e!588459 () (_ BitVec 32))

(assert (=> b!1039814 (= e!588460 e!588459)))

(declare-fun c!105618 () Bool)

(assert (=> b!1039814 (= c!105618 (validKeyInArray!0 (select (arr!31513 (_keys!11545 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039815 () Bool)

(assert (=> b!1039815 (= e!588459 call!44015)))

(declare-fun b!1039816 () Bool)

(assert (=> b!1039816 (= e!588459 (bvadd #b00000000000000000000000000000001 call!44015))))

(assert (= (and d!125805 c!105619) b!1039813))

(assert (= (and d!125805 (not c!105619)) b!1039814))

(assert (= (and b!1039814 c!105618) b!1039816))

(assert (= (and b!1039814 (not c!105618)) b!1039815))

(assert (= (or b!1039816 b!1039815) bm!44012))

(declare-fun m!960109 () Bool)

(assert (=> bm!44012 m!960109))

(declare-fun m!960111 () Bool)

(assert (=> b!1039814 m!960111))

(assert (=> b!1039814 m!960111))

(declare-fun m!960113 () Bool)

(assert (=> b!1039814 m!960113))

(assert (=> b!1039728 d!125805))

(declare-fun d!125807 () Bool)

(assert (=> d!125807 (= (array_inv!24377 (_keys!11545 thiss!1427)) (bvsge (size!32044 (_keys!11545 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039724 d!125807))

(declare-fun d!125809 () Bool)

(assert (=> d!125809 (= (array_inv!24378 (_values!6329 thiss!1427)) (bvsge (size!32045 (_values!6329 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039724 d!125809))

(declare-fun b!1039829 () Bool)

(declare-fun c!105626 () Bool)

(declare-fun lt!458281 () (_ BitVec 64))

(assert (=> b!1039829 (= c!105626 (= lt!458281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588469 () SeekEntryResult!9725)

(declare-fun e!588467 () SeekEntryResult!9725)

(assert (=> b!1039829 (= e!588469 e!588467)))

(declare-fun b!1039830 () Bool)

(declare-fun e!588468 () SeekEntryResult!9725)

(assert (=> b!1039830 (= e!588468 Undefined!9725)))

(declare-fun b!1039831 () Bool)

(declare-fun lt!458282 () SeekEntryResult!9725)

(assert (=> b!1039831 (= e!588467 (MissingZero!9725 (index!41273 lt!458282)))))

(declare-fun b!1039832 () Bool)

(assert (=> b!1039832 (= e!588468 e!588469)))

(assert (=> b!1039832 (= lt!458281 (select (arr!31513 (_keys!11545 thiss!1427)) (index!41273 lt!458282)))))

(declare-fun c!105628 () Bool)

(assert (=> b!1039832 (= c!105628 (= lt!458281 key!909))))

(declare-fun b!1039833 () Bool)

(declare-fun lt!458284 () SeekEntryResult!9725)

(assert (=> b!1039833 (= e!588467 (ite ((_ is MissingVacant!9725) lt!458284) (MissingZero!9725 (index!41274 lt!458284)) lt!458284))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65485 (_ BitVec 32)) SeekEntryResult!9725)

(assert (=> b!1039833 (= lt!458284 (seekKeyOrZeroReturnVacant!0 (x!92634 lt!458282) (index!41273 lt!458282) (index!41273 lt!458282) key!909 (_keys!11545 thiss!1427) (mask!30304 thiss!1427)))))

(declare-fun d!125811 () Bool)

(declare-fun lt!458283 () SeekEntryResult!9725)

(assert (=> d!125811 (and (or ((_ is MissingVacant!9725) lt!458283) (not ((_ is Found!9725) lt!458283)) (and (bvsge (index!41272 lt!458283) #b00000000000000000000000000000000) (bvslt (index!41272 lt!458283) (size!32044 (_keys!11545 thiss!1427))))) (not ((_ is MissingVacant!9725) lt!458283)) (or (not ((_ is Found!9725) lt!458283)) (= (select (arr!31513 (_keys!11545 thiss!1427)) (index!41272 lt!458283)) key!909)))))

(assert (=> d!125811 (= lt!458283 e!588468)))

(declare-fun c!105627 () Bool)

(assert (=> d!125811 (= c!105627 (and ((_ is Intermediate!9725) lt!458282) (undefined!10537 lt!458282)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65485 (_ BitVec 32)) SeekEntryResult!9725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125811 (= lt!458282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30304 thiss!1427)) key!909 (_keys!11545 thiss!1427) (mask!30304 thiss!1427)))))

(assert (=> d!125811 (validMask!0 (mask!30304 thiss!1427))))

(assert (=> d!125811 (= (seekEntry!0 key!909 (_keys!11545 thiss!1427) (mask!30304 thiss!1427)) lt!458283)))

(declare-fun b!1039834 () Bool)

(assert (=> b!1039834 (= e!588469 (Found!9725 (index!41273 lt!458282)))))

(assert (= (and d!125811 c!105627) b!1039830))

(assert (= (and d!125811 (not c!105627)) b!1039832))

(assert (= (and b!1039832 c!105628) b!1039834))

(assert (= (and b!1039832 (not c!105628)) b!1039829))

(assert (= (and b!1039829 c!105626) b!1039831))

(assert (= (and b!1039829 (not c!105626)) b!1039833))

(declare-fun m!960115 () Bool)

(assert (=> b!1039832 m!960115))

(declare-fun m!960117 () Bool)

(assert (=> b!1039833 m!960117))

(declare-fun m!960119 () Bool)

(assert (=> d!125811 m!960119))

(declare-fun m!960121 () Bool)

(assert (=> d!125811 m!960121))

(assert (=> d!125811 m!960121))

(declare-fun m!960123 () Bool)

(assert (=> d!125811 m!960123))

(assert (=> d!125811 m!960017))

(assert (=> b!1039723 d!125811))

(declare-fun d!125813 () Bool)

(declare-fun res!693277 () Bool)

(declare-fun e!588472 () Bool)

(assert (=> d!125813 (=> (not res!693277) (not e!588472))))

(declare-fun simpleValid!422 (LongMapFixedSize!5848) Bool)

(assert (=> d!125813 (= res!693277 (simpleValid!422 thiss!1427))))

(assert (=> d!125813 (= (valid!2209 thiss!1427) e!588472)))

(declare-fun b!1039841 () Bool)

(declare-fun res!693278 () Bool)

(assert (=> b!1039841 (=> (not res!693278) (not e!588472))))

(assert (=> b!1039841 (= res!693278 (= (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32044 (_keys!11545 thiss!1427))) (_size!2979 thiss!1427)))))

(declare-fun b!1039842 () Bool)

(declare-fun res!693279 () Bool)

(assert (=> b!1039842 (=> (not res!693279) (not e!588472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65485 (_ BitVec 32)) Bool)

(assert (=> b!1039842 (= res!693279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11545 thiss!1427) (mask!30304 thiss!1427)))))

(declare-fun b!1039843 () Bool)

(assert (=> b!1039843 (= e!588472 (arrayNoDuplicates!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 Nil!21922))))

(assert (= (and d!125813 res!693277) b!1039841))

(assert (= (and b!1039841 res!693278) b!1039842))

(assert (= (and b!1039842 res!693279) b!1039843))

(declare-fun m!960125 () Bool)

(assert (=> d!125813 m!960125))

(assert (=> b!1039841 m!960023))

(declare-fun m!960127 () Bool)

(assert (=> b!1039842 m!960127))

(declare-fun m!960129 () Bool)

(assert (=> b!1039843 m!960129))

(assert (=> start!91076 d!125813))

(declare-fun mapIsEmpty!38544 () Bool)

(declare-fun mapRes!38544 () Bool)

(assert (=> mapIsEmpty!38544 mapRes!38544))

(declare-fun mapNonEmpty!38544 () Bool)

(declare-fun tp!73999 () Bool)

(declare-fun e!588477 () Bool)

(assert (=> mapNonEmpty!38544 (= mapRes!38544 (and tp!73999 e!588477))))

(declare-fun mapKey!38544 () (_ BitVec 32))

(declare-fun mapRest!38544 () (Array (_ BitVec 32) ValueCell!11627))

(declare-fun mapValue!38544 () ValueCell!11627)

(assert (=> mapNonEmpty!38544 (= mapRest!38535 (store mapRest!38544 mapKey!38544 mapValue!38544))))

(declare-fun b!1039851 () Bool)

(declare-fun e!588478 () Bool)

(assert (=> b!1039851 (= e!588478 tp_is_empty!24661)))

(declare-fun b!1039850 () Bool)

(assert (=> b!1039850 (= e!588477 tp_is_empty!24661)))

(declare-fun condMapEmpty!38544 () Bool)

(declare-fun mapDefault!38544 () ValueCell!11627)

(assert (=> mapNonEmpty!38535 (= condMapEmpty!38544 (= mapRest!38535 ((as const (Array (_ BitVec 32) ValueCell!11627)) mapDefault!38544)))))

(assert (=> mapNonEmpty!38535 (= tp!73984 (and e!588478 mapRes!38544))))

(assert (= (and mapNonEmpty!38535 condMapEmpty!38544) mapIsEmpty!38544))

(assert (= (and mapNonEmpty!38535 (not condMapEmpty!38544)) mapNonEmpty!38544))

(assert (= (and mapNonEmpty!38544 ((_ is ValueCellFull!11627) mapValue!38544)) b!1039850))

(assert (= (and mapNonEmpty!38535 ((_ is ValueCellFull!11627) mapDefault!38544)) b!1039851))

(declare-fun m!960131 () Bool)

(assert (=> mapNonEmpty!38544 m!960131))

(check-sat (not b!1039833) (not d!125811) (not d!125795) (not b!1039798) (not bm!44008) (not b!1039796) (not bm!44012) (not b!1039814) (not mapNonEmpty!38544) b_and!33483 (not b_next!20941) (not b!1039841) (not b!1039800) (not b!1039780) (not b!1039843) (not bm!44011) (not d!125813) (not d!125797) tp_is_empty!24661 (not b!1039779) (not b!1039842) (not b!1039782) (not b!1039785) (not b!1039810))
(check-sat b_and!33483 (not b_next!20941))
