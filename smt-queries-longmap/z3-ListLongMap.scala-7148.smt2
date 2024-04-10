; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90844 () Bool)

(assert start!90844)

(declare-fun b!1038430 () Bool)

(declare-fun b_free!20943 () Bool)

(declare-fun b_next!20943 () Bool)

(assert (=> b!1038430 (= b_free!20943 (not b_next!20943))))

(declare-fun tp!73989 () Bool)

(declare-fun b_and!33475 () Bool)

(assert (=> b!1038430 (= tp!73989 b_and!33475)))

(declare-fun mapIsEmpty!38538 () Bool)

(declare-fun mapRes!38538 () Bool)

(assert (=> mapIsEmpty!38538 mapRes!38538))

(declare-fun res!692726 () Bool)

(declare-fun e!587563 () Bool)

(assert (=> start!90844 (=> (not res!692726) (not e!587563))))

(declare-datatypes ((V!37757 0))(
  ( (V!37758 (val!12382 Int)) )
))
(declare-datatypes ((ValueCell!11628 0))(
  ( (ValueCellFull!11628 (v!14968 V!37757)) (EmptyCell!11628) )
))
(declare-datatypes ((array!65440 0))(
  ( (array!65441 (arr!31497 (Array (_ BitVec 32) (_ BitVec 64))) (size!32027 (_ BitVec 32))) )
))
(declare-datatypes ((array!65442 0))(
  ( (array!65443 (arr!31498 (Array (_ BitVec 32) ValueCell!11628)) (size!32028 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5850 0))(
  ( (LongMapFixedSize!5851 (defaultEntry!6307 Int) (mask!30245 (_ BitVec 32)) (extraKeys!6035 (_ BitVec 32)) (zeroValue!6141 V!37757) (minValue!6141 V!37757) (_size!2980 (_ BitVec 32)) (_keys!11508 array!65440) (_values!6330 array!65442) (_vacant!2980 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5850)

(declare-fun valid!2202 (LongMapFixedSize!5850) Bool)

(assert (=> start!90844 (= res!692726 (valid!2202 thiss!1427))))

(assert (=> start!90844 e!587563))

(declare-fun e!587564 () Bool)

(assert (=> start!90844 e!587564))

(assert (=> start!90844 true))

(declare-fun b!1038428 () Bool)

(declare-fun e!587561 () Bool)

(declare-fun tp_is_empty!24663 () Bool)

(assert (=> b!1038428 (= e!587561 tp_is_empty!24663)))

(declare-fun mapNonEmpty!38538 () Bool)

(declare-fun tp!73990 () Bool)

(declare-fun e!587565 () Bool)

(assert (=> mapNonEmpty!38538 (= mapRes!38538 (and tp!73990 e!587565))))

(declare-fun mapRest!38538 () (Array (_ BitVec 32) ValueCell!11628))

(declare-fun mapKey!38538 () (_ BitVec 32))

(declare-fun mapValue!38538 () ValueCell!11628)

(assert (=> mapNonEmpty!38538 (= (arr!31498 (_values!6330 thiss!1427)) (store mapRest!38538 mapKey!38538 mapValue!38538))))

(declare-fun b!1038429 () Bool)

(declare-fun e!587562 () Bool)

(assert (=> b!1038429 (= e!587562 (and e!587561 mapRes!38538))))

(declare-fun condMapEmpty!38538 () Bool)

(declare-fun mapDefault!38538 () ValueCell!11628)

(assert (=> b!1038429 (= condMapEmpty!38538 (= (arr!31498 (_values!6330 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11628)) mapDefault!38538)))))

(declare-fun array_inv!24353 (array!65440) Bool)

(declare-fun array_inv!24354 (array!65442) Bool)

(assert (=> b!1038430 (= e!587564 (and tp!73989 tp_is_empty!24663 (array_inv!24353 (_keys!11508 thiss!1427)) (array_inv!24354 (_values!6330 thiss!1427)) e!587562))))

(declare-fun b!1038431 () Bool)

(assert (=> b!1038431 (= e!587565 tp_is_empty!24663)))

(declare-fun b!1038432 () Bool)

(declare-fun e!587566 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038432 (= e!587566 (not (validMask!0 (mask!30245 thiss!1427))))))

(declare-fun lt!457735 () array!65440)

(declare-datatypes ((List!21937 0))(
  ( (Nil!21934) (Cons!21933 (h!23136 (_ BitVec 64)) (t!31151 List!21937)) )
))
(declare-fun arrayNoDuplicates!0 (array!65440 (_ BitVec 32) List!21937) Bool)

(assert (=> b!1038432 (arrayNoDuplicates!0 lt!457735 #b00000000000000000000000000000000 Nil!21934)))

(declare-datatypes ((Unit!33977 0))(
  ( (Unit!33978) )
))
(declare-fun lt!457734 () Unit!33977)

(declare-datatypes ((SeekEntryResult!9771 0))(
  ( (MissingZero!9771 (index!41455 (_ BitVec 32))) (Found!9771 (index!41456 (_ BitVec 32))) (Intermediate!9771 (undefined!10583 Bool) (index!41457 (_ BitVec 32)) (x!92658 (_ BitVec 32))) (Undefined!9771) (MissingVacant!9771 (index!41458 (_ BitVec 32))) )
))
(declare-fun lt!457733 () SeekEntryResult!9771)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65440 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21937) Unit!33977)

(assert (=> b!1038432 (= lt!457734 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11508 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41456 lt!457733) #b00000000000000000000000000000000 Nil!21934))))

(declare-fun arrayCountValidKeys!0 (array!65440 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038432 (= (arrayCountValidKeys!0 lt!457735 #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11508 thiss!1427) #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038432 (= lt!457735 (array!65441 (store (arr!31497 (_keys!11508 thiss!1427)) (index!41456 lt!457733) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32027 (_keys!11508 thiss!1427))))))

(declare-fun lt!457732 () Unit!33977)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65440 (_ BitVec 32) (_ BitVec 64)) Unit!33977)

(assert (=> b!1038432 (= lt!457732 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11508 thiss!1427) (index!41456 lt!457733) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038433 () Bool)

(declare-fun res!692727 () Bool)

(assert (=> b!1038433 (=> (not res!692727) (not e!587563))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038433 (= res!692727 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038434 () Bool)

(assert (=> b!1038434 (= e!587563 e!587566)))

(declare-fun res!692725 () Bool)

(assert (=> b!1038434 (=> (not res!692725) (not e!587566))))

(get-info :version)

(assert (=> b!1038434 (= res!692725 ((_ is Found!9771) lt!457733))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65440 (_ BitVec 32)) SeekEntryResult!9771)

(assert (=> b!1038434 (= lt!457733 (seekEntry!0 key!909 (_keys!11508 thiss!1427) (mask!30245 thiss!1427)))))

(assert (= (and start!90844 res!692726) b!1038433))

(assert (= (and b!1038433 res!692727) b!1038434))

(assert (= (and b!1038434 res!692725) b!1038432))

(assert (= (and b!1038429 condMapEmpty!38538) mapIsEmpty!38538))

(assert (= (and b!1038429 (not condMapEmpty!38538)) mapNonEmpty!38538))

(assert (= (and mapNonEmpty!38538 ((_ is ValueCellFull!11628) mapValue!38538)) b!1038431))

(assert (= (and b!1038429 ((_ is ValueCellFull!11628) mapDefault!38538)) b!1038428))

(assert (= b!1038430 b!1038429))

(assert (= start!90844 b!1038430))

(declare-fun m!958373 () Bool)

(assert (=> b!1038432 m!958373))

(declare-fun m!958375 () Bool)

(assert (=> b!1038432 m!958375))

(declare-fun m!958377 () Bool)

(assert (=> b!1038432 m!958377))

(declare-fun m!958379 () Bool)

(assert (=> b!1038432 m!958379))

(declare-fun m!958381 () Bool)

(assert (=> b!1038432 m!958381))

(declare-fun m!958383 () Bool)

(assert (=> b!1038432 m!958383))

(declare-fun m!958385 () Bool)

(assert (=> b!1038432 m!958385))

(declare-fun m!958387 () Bool)

(assert (=> b!1038434 m!958387))

(declare-fun m!958389 () Bool)

(assert (=> mapNonEmpty!38538 m!958389))

(declare-fun m!958391 () Bool)

(assert (=> b!1038430 m!958391))

(declare-fun m!958393 () Bool)

(assert (=> b!1038430 m!958393))

(declare-fun m!958395 () Bool)

(assert (=> start!90844 m!958395))

(check-sat (not mapNonEmpty!38538) (not b!1038434) (not b!1038432) (not b!1038430) (not start!90844) tp_is_empty!24663 (not b_next!20943) b_and!33475)
(check-sat b_and!33475 (not b_next!20943))
(get-model)

(declare-fun d!125333 () Bool)

(declare-fun e!587591 () Bool)

(assert (=> d!125333 e!587591))

(declare-fun res!692739 () Bool)

(assert (=> d!125333 (=> (not res!692739) (not e!587591))))

(assert (=> d!125333 (= res!692739 (and (bvsge (index!41456 lt!457733) #b00000000000000000000000000000000) (bvslt (index!41456 lt!457733) (size!32027 (_keys!11508 thiss!1427)))))))

(declare-fun lt!457750 () Unit!33977)

(declare-fun choose!53 (array!65440 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21937) Unit!33977)

(assert (=> d!125333 (= lt!457750 (choose!53 (_keys!11508 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41456 lt!457733) #b00000000000000000000000000000000 Nil!21934))))

(assert (=> d!125333 (bvslt (size!32027 (_keys!11508 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125333 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11508 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41456 lt!457733) #b00000000000000000000000000000000 Nil!21934) lt!457750)))

(declare-fun b!1038458 () Bool)

(assert (=> b!1038458 (= e!587591 (arrayNoDuplicates!0 (array!65441 (store (arr!31497 (_keys!11508 thiss!1427)) (index!41456 lt!457733) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32027 (_keys!11508 thiss!1427))) #b00000000000000000000000000000000 Nil!21934))))

(assert (= (and d!125333 res!692739) b!1038458))

(declare-fun m!958421 () Bool)

(assert (=> d!125333 m!958421))

(assert (=> b!1038458 m!958385))

(declare-fun m!958423 () Bool)

(assert (=> b!1038458 m!958423))

(assert (=> b!1038432 d!125333))

(declare-fun b!1038469 () Bool)

(declare-fun e!587596 () Bool)

(assert (=> b!1038469 (= e!587596 (bvslt (size!32027 (_keys!11508 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038470 () Bool)

(declare-fun e!587597 () Bool)

(assert (=> b!1038470 (= e!587597 (= (arrayCountValidKeys!0 (array!65441 (store (arr!31497 (_keys!11508 thiss!1427)) (index!41456 lt!457733) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32027 (_keys!11508 thiss!1427))) #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11508 thiss!1427) #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1038468 () Bool)

(declare-fun res!692748 () Bool)

(assert (=> b!1038468 (=> (not res!692748) (not e!587596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038468 (= res!692748 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038467 () Bool)

(declare-fun res!692749 () Bool)

(assert (=> b!1038467 (=> (not res!692749) (not e!587596))))

(assert (=> b!1038467 (= res!692749 (validKeyInArray!0 (select (arr!31497 (_keys!11508 thiss!1427)) (index!41456 lt!457733))))))

(declare-fun d!125335 () Bool)

(assert (=> d!125335 e!587597))

(declare-fun res!692751 () Bool)

(assert (=> d!125335 (=> (not res!692751) (not e!587597))))

(assert (=> d!125335 (= res!692751 (and (bvsge (index!41456 lt!457733) #b00000000000000000000000000000000) (bvslt (index!41456 lt!457733) (size!32027 (_keys!11508 thiss!1427)))))))

(declare-fun lt!457753 () Unit!33977)

(declare-fun choose!82 (array!65440 (_ BitVec 32) (_ BitVec 64)) Unit!33977)

(assert (=> d!125335 (= lt!457753 (choose!82 (_keys!11508 thiss!1427) (index!41456 lt!457733) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125335 e!587596))

(declare-fun res!692750 () Bool)

(assert (=> d!125335 (=> (not res!692750) (not e!587596))))

(assert (=> d!125335 (= res!692750 (and (bvsge (index!41456 lt!457733) #b00000000000000000000000000000000) (bvslt (index!41456 lt!457733) (size!32027 (_keys!11508 thiss!1427)))))))

(assert (=> d!125335 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11508 thiss!1427) (index!41456 lt!457733) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457753)))

(assert (= (and d!125335 res!692750) b!1038467))

(assert (= (and b!1038467 res!692749) b!1038468))

(assert (= (and b!1038468 res!692748) b!1038469))

(assert (= (and d!125335 res!692751) b!1038470))

(assert (=> b!1038470 m!958385))

(declare-fun m!958425 () Bool)

(assert (=> b!1038470 m!958425))

(assert (=> b!1038470 m!958381))

(declare-fun m!958427 () Bool)

(assert (=> b!1038468 m!958427))

(declare-fun m!958429 () Bool)

(assert (=> b!1038467 m!958429))

(assert (=> b!1038467 m!958429))

(declare-fun m!958431 () Bool)

(assert (=> b!1038467 m!958431))

(declare-fun m!958433 () Bool)

(assert (=> d!125335 m!958433))

(assert (=> b!1038432 d!125335))

(declare-fun d!125337 () Bool)

(assert (=> d!125337 (= (validMask!0 (mask!30245 thiss!1427)) (and (or (= (mask!30245 thiss!1427) #b00000000000000000000000000000111) (= (mask!30245 thiss!1427) #b00000000000000000000000000001111) (= (mask!30245 thiss!1427) #b00000000000000000000000000011111) (= (mask!30245 thiss!1427) #b00000000000000000000000000111111) (= (mask!30245 thiss!1427) #b00000000000000000000000001111111) (= (mask!30245 thiss!1427) #b00000000000000000000000011111111) (= (mask!30245 thiss!1427) #b00000000000000000000000111111111) (= (mask!30245 thiss!1427) #b00000000000000000000001111111111) (= (mask!30245 thiss!1427) #b00000000000000000000011111111111) (= (mask!30245 thiss!1427) #b00000000000000000000111111111111) (= (mask!30245 thiss!1427) #b00000000000000000001111111111111) (= (mask!30245 thiss!1427) #b00000000000000000011111111111111) (= (mask!30245 thiss!1427) #b00000000000000000111111111111111) (= (mask!30245 thiss!1427) #b00000000000000001111111111111111) (= (mask!30245 thiss!1427) #b00000000000000011111111111111111) (= (mask!30245 thiss!1427) #b00000000000000111111111111111111) (= (mask!30245 thiss!1427) #b00000000000001111111111111111111) (= (mask!30245 thiss!1427) #b00000000000011111111111111111111) (= (mask!30245 thiss!1427) #b00000000000111111111111111111111) (= (mask!30245 thiss!1427) #b00000000001111111111111111111111) (= (mask!30245 thiss!1427) #b00000000011111111111111111111111) (= (mask!30245 thiss!1427) #b00000000111111111111111111111111) (= (mask!30245 thiss!1427) #b00000001111111111111111111111111) (= (mask!30245 thiss!1427) #b00000011111111111111111111111111) (= (mask!30245 thiss!1427) #b00000111111111111111111111111111) (= (mask!30245 thiss!1427) #b00001111111111111111111111111111) (= (mask!30245 thiss!1427) #b00011111111111111111111111111111) (= (mask!30245 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30245 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1038432 d!125337))

(declare-fun bm!43941 () Bool)

(declare-fun call!43944 () (_ BitVec 32))

(assert (=> bm!43941 (= call!43944 (arrayCountValidKeys!0 lt!457735 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32027 (_keys!11508 thiss!1427))))))

(declare-fun d!125339 () Bool)

(declare-fun lt!457756 () (_ BitVec 32))

(assert (=> d!125339 (and (bvsge lt!457756 #b00000000000000000000000000000000) (bvsle lt!457756 (bvsub (size!32027 lt!457735) #b00000000000000000000000000000000)))))

(declare-fun e!587602 () (_ BitVec 32))

(assert (=> d!125339 (= lt!457756 e!587602)))

(declare-fun c!105204 () Bool)

(assert (=> d!125339 (= c!105204 (bvsge #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))))))

(assert (=> d!125339 (and (bvsle #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32027 (_keys!11508 thiss!1427)) (size!32027 lt!457735)))))

(assert (=> d!125339 (= (arrayCountValidKeys!0 lt!457735 #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))) lt!457756)))

(declare-fun b!1038479 () Bool)

(assert (=> b!1038479 (= e!587602 #b00000000000000000000000000000000)))

(declare-fun b!1038480 () Bool)

(declare-fun e!587603 () (_ BitVec 32))

(assert (=> b!1038480 (= e!587602 e!587603)))

(declare-fun c!105203 () Bool)

(assert (=> b!1038480 (= c!105203 (validKeyInArray!0 (select (arr!31497 lt!457735) #b00000000000000000000000000000000)))))

(declare-fun b!1038481 () Bool)

(assert (=> b!1038481 (= e!587603 call!43944)))

(declare-fun b!1038482 () Bool)

(assert (=> b!1038482 (= e!587603 (bvadd #b00000000000000000000000000000001 call!43944))))

(assert (= (and d!125339 c!105204) b!1038479))

(assert (= (and d!125339 (not c!105204)) b!1038480))

(assert (= (and b!1038480 c!105203) b!1038482))

(assert (= (and b!1038480 (not c!105203)) b!1038481))

(assert (= (or b!1038482 b!1038481) bm!43941))

(declare-fun m!958435 () Bool)

(assert (=> bm!43941 m!958435))

(declare-fun m!958437 () Bool)

(assert (=> b!1038480 m!958437))

(assert (=> b!1038480 m!958437))

(declare-fun m!958439 () Bool)

(assert (=> b!1038480 m!958439))

(assert (=> b!1038432 d!125339))

(declare-fun bm!43942 () Bool)

(declare-fun call!43945 () (_ BitVec 32))

(assert (=> bm!43942 (= call!43945 (arrayCountValidKeys!0 (_keys!11508 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32027 (_keys!11508 thiss!1427))))))

(declare-fun d!125341 () Bool)

(declare-fun lt!457757 () (_ BitVec 32))

(assert (=> d!125341 (and (bvsge lt!457757 #b00000000000000000000000000000000) (bvsle lt!457757 (bvsub (size!32027 (_keys!11508 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587604 () (_ BitVec 32))

(assert (=> d!125341 (= lt!457757 e!587604)))

(declare-fun c!105206 () Bool)

(assert (=> d!125341 (= c!105206 (bvsge #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))))))

(assert (=> d!125341 (and (bvsle #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32027 (_keys!11508 thiss!1427)) (size!32027 (_keys!11508 thiss!1427))))))

(assert (=> d!125341 (= (arrayCountValidKeys!0 (_keys!11508 thiss!1427) #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))) lt!457757)))

(declare-fun b!1038483 () Bool)

(assert (=> b!1038483 (= e!587604 #b00000000000000000000000000000000)))

(declare-fun b!1038484 () Bool)

(declare-fun e!587605 () (_ BitVec 32))

(assert (=> b!1038484 (= e!587604 e!587605)))

(declare-fun c!105205 () Bool)

(assert (=> b!1038484 (= c!105205 (validKeyInArray!0 (select (arr!31497 (_keys!11508 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038485 () Bool)

(assert (=> b!1038485 (= e!587605 call!43945)))

(declare-fun b!1038486 () Bool)

(assert (=> b!1038486 (= e!587605 (bvadd #b00000000000000000000000000000001 call!43945))))

(assert (= (and d!125341 c!105206) b!1038483))

(assert (= (and d!125341 (not c!105206)) b!1038484))

(assert (= (and b!1038484 c!105205) b!1038486))

(assert (= (and b!1038484 (not c!105205)) b!1038485))

(assert (= (or b!1038486 b!1038485) bm!43942))

(declare-fun m!958441 () Bool)

(assert (=> bm!43942 m!958441))

(declare-fun m!958443 () Bool)

(assert (=> b!1038484 m!958443))

(assert (=> b!1038484 m!958443))

(declare-fun m!958445 () Bool)

(assert (=> b!1038484 m!958445))

(assert (=> b!1038432 d!125341))

(declare-fun b!1038497 () Bool)

(declare-fun e!587616 () Bool)

(declare-fun call!43948 () Bool)

(assert (=> b!1038497 (= e!587616 call!43948)))

(declare-fun b!1038498 () Bool)

(assert (=> b!1038498 (= e!587616 call!43948)))

(declare-fun b!1038499 () Bool)

(declare-fun e!587615 () Bool)

(declare-fun e!587614 () Bool)

(assert (=> b!1038499 (= e!587615 e!587614)))

(declare-fun res!692759 () Bool)

(assert (=> b!1038499 (=> (not res!692759) (not e!587614))))

(declare-fun e!587617 () Bool)

(assert (=> b!1038499 (= res!692759 (not e!587617))))

(declare-fun res!692758 () Bool)

(assert (=> b!1038499 (=> (not res!692758) (not e!587617))))

(assert (=> b!1038499 (= res!692758 (validKeyInArray!0 (select (arr!31497 lt!457735) #b00000000000000000000000000000000)))))

(declare-fun bm!43945 () Bool)

(declare-fun c!105209 () Bool)

(assert (=> bm!43945 (= call!43948 (arrayNoDuplicates!0 lt!457735 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105209 (Cons!21933 (select (arr!31497 lt!457735) #b00000000000000000000000000000000) Nil!21934) Nil!21934)))))

(declare-fun d!125343 () Bool)

(declare-fun res!692760 () Bool)

(assert (=> d!125343 (=> res!692760 e!587615)))

(assert (=> d!125343 (= res!692760 (bvsge #b00000000000000000000000000000000 (size!32027 lt!457735)))))

(assert (=> d!125343 (= (arrayNoDuplicates!0 lt!457735 #b00000000000000000000000000000000 Nil!21934) e!587615)))

(declare-fun b!1038500 () Bool)

(declare-fun contains!6038 (List!21937 (_ BitVec 64)) Bool)

(assert (=> b!1038500 (= e!587617 (contains!6038 Nil!21934 (select (arr!31497 lt!457735) #b00000000000000000000000000000000)))))

(declare-fun b!1038501 () Bool)

(assert (=> b!1038501 (= e!587614 e!587616)))

(assert (=> b!1038501 (= c!105209 (validKeyInArray!0 (select (arr!31497 lt!457735) #b00000000000000000000000000000000)))))

(assert (= (and d!125343 (not res!692760)) b!1038499))

(assert (= (and b!1038499 res!692758) b!1038500))

(assert (= (and b!1038499 res!692759) b!1038501))

(assert (= (and b!1038501 c!105209) b!1038498))

(assert (= (and b!1038501 (not c!105209)) b!1038497))

(assert (= (or b!1038498 b!1038497) bm!43945))

(assert (=> b!1038499 m!958437))

(assert (=> b!1038499 m!958437))

(assert (=> b!1038499 m!958439))

(assert (=> bm!43945 m!958437))

(declare-fun m!958447 () Bool)

(assert (=> bm!43945 m!958447))

(assert (=> b!1038500 m!958437))

(assert (=> b!1038500 m!958437))

(declare-fun m!958449 () Bool)

(assert (=> b!1038500 m!958449))

(assert (=> b!1038501 m!958437))

(assert (=> b!1038501 m!958437))

(assert (=> b!1038501 m!958439))

(assert (=> b!1038432 d!125343))

(declare-fun b!1038514 () Bool)

(declare-fun c!105218 () Bool)

(declare-fun lt!457767 () (_ BitVec 64))

(assert (=> b!1038514 (= c!105218 (= lt!457767 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587625 () SeekEntryResult!9771)

(declare-fun e!587624 () SeekEntryResult!9771)

(assert (=> b!1038514 (= e!587625 e!587624)))

(declare-fun d!125345 () Bool)

(declare-fun lt!457766 () SeekEntryResult!9771)

(assert (=> d!125345 (and (or ((_ is MissingVacant!9771) lt!457766) (not ((_ is Found!9771) lt!457766)) (and (bvsge (index!41456 lt!457766) #b00000000000000000000000000000000) (bvslt (index!41456 lt!457766) (size!32027 (_keys!11508 thiss!1427))))) (not ((_ is MissingVacant!9771) lt!457766)) (or (not ((_ is Found!9771) lt!457766)) (= (select (arr!31497 (_keys!11508 thiss!1427)) (index!41456 lt!457766)) key!909)))))

(declare-fun e!587626 () SeekEntryResult!9771)

(assert (=> d!125345 (= lt!457766 e!587626)))

(declare-fun c!105216 () Bool)

(declare-fun lt!457769 () SeekEntryResult!9771)

(assert (=> d!125345 (= c!105216 (and ((_ is Intermediate!9771) lt!457769) (undefined!10583 lt!457769)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65440 (_ BitVec 32)) SeekEntryResult!9771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125345 (= lt!457769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30245 thiss!1427)) key!909 (_keys!11508 thiss!1427) (mask!30245 thiss!1427)))))

(assert (=> d!125345 (validMask!0 (mask!30245 thiss!1427))))

(assert (=> d!125345 (= (seekEntry!0 key!909 (_keys!11508 thiss!1427) (mask!30245 thiss!1427)) lt!457766)))

(declare-fun b!1038515 () Bool)

(declare-fun lt!457768 () SeekEntryResult!9771)

(assert (=> b!1038515 (= e!587624 (ite ((_ is MissingVacant!9771) lt!457768) (MissingZero!9771 (index!41458 lt!457768)) lt!457768))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65440 (_ BitVec 32)) SeekEntryResult!9771)

(assert (=> b!1038515 (= lt!457768 (seekKeyOrZeroReturnVacant!0 (x!92658 lt!457769) (index!41457 lt!457769) (index!41457 lt!457769) key!909 (_keys!11508 thiss!1427) (mask!30245 thiss!1427)))))

(declare-fun b!1038516 () Bool)

(assert (=> b!1038516 (= e!587626 e!587625)))

(assert (=> b!1038516 (= lt!457767 (select (arr!31497 (_keys!11508 thiss!1427)) (index!41457 lt!457769)))))

(declare-fun c!105217 () Bool)

(assert (=> b!1038516 (= c!105217 (= lt!457767 key!909))))

(declare-fun b!1038517 () Bool)

(assert (=> b!1038517 (= e!587626 Undefined!9771)))

(declare-fun b!1038518 () Bool)

(assert (=> b!1038518 (= e!587624 (MissingZero!9771 (index!41457 lt!457769)))))

(declare-fun b!1038519 () Bool)

(assert (=> b!1038519 (= e!587625 (Found!9771 (index!41457 lt!457769)))))

(assert (= (and d!125345 c!105216) b!1038517))

(assert (= (and d!125345 (not c!105216)) b!1038516))

(assert (= (and b!1038516 c!105217) b!1038519))

(assert (= (and b!1038516 (not c!105217)) b!1038514))

(assert (= (and b!1038514 c!105218) b!1038518))

(assert (= (and b!1038514 (not c!105218)) b!1038515))

(declare-fun m!958451 () Bool)

(assert (=> d!125345 m!958451))

(declare-fun m!958453 () Bool)

(assert (=> d!125345 m!958453))

(assert (=> d!125345 m!958453))

(declare-fun m!958455 () Bool)

(assert (=> d!125345 m!958455))

(assert (=> d!125345 m!958375))

(declare-fun m!958457 () Bool)

(assert (=> b!1038515 m!958457))

(declare-fun m!958459 () Bool)

(assert (=> b!1038516 m!958459))

(assert (=> b!1038434 d!125345))

(declare-fun d!125347 () Bool)

(declare-fun res!692767 () Bool)

(declare-fun e!587629 () Bool)

(assert (=> d!125347 (=> (not res!692767) (not e!587629))))

(declare-fun simpleValid!422 (LongMapFixedSize!5850) Bool)

(assert (=> d!125347 (= res!692767 (simpleValid!422 thiss!1427))))

(assert (=> d!125347 (= (valid!2202 thiss!1427) e!587629)))

(declare-fun b!1038526 () Bool)

(declare-fun res!692768 () Bool)

(assert (=> b!1038526 (=> (not res!692768) (not e!587629))))

(assert (=> b!1038526 (= res!692768 (= (arrayCountValidKeys!0 (_keys!11508 thiss!1427) #b00000000000000000000000000000000 (size!32027 (_keys!11508 thiss!1427))) (_size!2980 thiss!1427)))))

(declare-fun b!1038527 () Bool)

(declare-fun res!692769 () Bool)

(assert (=> b!1038527 (=> (not res!692769) (not e!587629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65440 (_ BitVec 32)) Bool)

(assert (=> b!1038527 (= res!692769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11508 thiss!1427) (mask!30245 thiss!1427)))))

(declare-fun b!1038528 () Bool)

(assert (=> b!1038528 (= e!587629 (arrayNoDuplicates!0 (_keys!11508 thiss!1427) #b00000000000000000000000000000000 Nil!21934))))

(assert (= (and d!125347 res!692767) b!1038526))

(assert (= (and b!1038526 res!692768) b!1038527))

(assert (= (and b!1038527 res!692769) b!1038528))

(declare-fun m!958461 () Bool)

(assert (=> d!125347 m!958461))

(assert (=> b!1038526 m!958381))

(declare-fun m!958463 () Bool)

(assert (=> b!1038527 m!958463))

(declare-fun m!958465 () Bool)

(assert (=> b!1038528 m!958465))

(assert (=> start!90844 d!125347))

(declare-fun d!125349 () Bool)

(assert (=> d!125349 (= (array_inv!24353 (_keys!11508 thiss!1427)) (bvsge (size!32027 (_keys!11508 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038430 d!125349))

(declare-fun d!125351 () Bool)

(assert (=> d!125351 (= (array_inv!24354 (_values!6330 thiss!1427)) (bvsge (size!32028 (_values!6330 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038430 d!125351))

(declare-fun mapNonEmpty!38544 () Bool)

(declare-fun mapRes!38544 () Bool)

(declare-fun tp!73999 () Bool)

(declare-fun e!587634 () Bool)

(assert (=> mapNonEmpty!38544 (= mapRes!38544 (and tp!73999 e!587634))))

(declare-fun mapValue!38544 () ValueCell!11628)

(declare-fun mapKey!38544 () (_ BitVec 32))

(declare-fun mapRest!38544 () (Array (_ BitVec 32) ValueCell!11628))

(assert (=> mapNonEmpty!38544 (= mapRest!38538 (store mapRest!38544 mapKey!38544 mapValue!38544))))

(declare-fun b!1038536 () Bool)

(declare-fun e!587635 () Bool)

(assert (=> b!1038536 (= e!587635 tp_is_empty!24663)))

(declare-fun condMapEmpty!38544 () Bool)

(declare-fun mapDefault!38544 () ValueCell!11628)

(assert (=> mapNonEmpty!38538 (= condMapEmpty!38544 (= mapRest!38538 ((as const (Array (_ BitVec 32) ValueCell!11628)) mapDefault!38544)))))

(assert (=> mapNonEmpty!38538 (= tp!73990 (and e!587635 mapRes!38544))))

(declare-fun mapIsEmpty!38544 () Bool)

(assert (=> mapIsEmpty!38544 mapRes!38544))

(declare-fun b!1038535 () Bool)

(assert (=> b!1038535 (= e!587634 tp_is_empty!24663)))

(assert (= (and mapNonEmpty!38538 condMapEmpty!38544) mapIsEmpty!38544))

(assert (= (and mapNonEmpty!38538 (not condMapEmpty!38544)) mapNonEmpty!38544))

(assert (= (and mapNonEmpty!38544 ((_ is ValueCellFull!11628) mapValue!38544)) b!1038535))

(assert (= (and mapNonEmpty!38538 ((_ is ValueCellFull!11628) mapDefault!38544)) b!1038536))

(declare-fun m!958467 () Bool)

(assert (=> mapNonEmpty!38544 m!958467))

(check-sat (not mapNonEmpty!38544) (not d!125345) (not bm!43942) (not b!1038458) (not bm!43945) (not b!1038484) (not b!1038526) (not bm!43941) (not b!1038470) (not b!1038528) (not b!1038501) (not b!1038468) (not b!1038499) tp_is_empty!24663 (not b!1038500) (not b!1038527) (not d!125333) (not d!125335) (not b_next!20943) (not b!1038515) b_and!33475 (not b!1038480) (not d!125347) (not b!1038467))
(check-sat b_and!33475 (not b_next!20943))
