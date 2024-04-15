; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3208 () Bool)

(assert start!3208)

(declare-fun b!19508 () Bool)

(declare-fun b_free!685 () Bool)

(declare-fun b_next!685 () Bool)

(assert (=> b!19508 (= b_free!685 (not b_next!685))))

(declare-fun tp!3271 () Bool)

(declare-fun b_and!1339 () Bool)

(assert (=> b!19508 (= tp!3271 b_and!1339)))

(declare-fun b!19501 () Bool)

(declare-fun e!12621 () Bool)

(declare-fun tp_is_empty!949 () Bool)

(assert (=> b!19501 (= e!12621 tp_is_empty!949)))

(declare-fun b!19502 () Bool)

(declare-fun e!12623 () Bool)

(declare-fun e!12628 () Bool)

(assert (=> b!19502 (= e!12623 e!12628)))

(declare-fun res!13193 () Bool)

(assert (=> b!19502 (=> (not res!13193) (not e!12628))))

(declare-datatypes ((V!1091 0))(
  ( (V!1092 (val!501 Int)) )
))
(declare-datatypes ((ValueCell!275 0))(
  ( (ValueCellFull!275 (v!1517 V!1091)) (EmptyCell!275) )
))
(declare-datatypes ((array!1097 0))(
  ( (array!1098 (arr!524 (Array (_ BitVec 32) ValueCell!275)) (size!617 (_ BitVec 32))) )
))
(declare-datatypes ((array!1099 0))(
  ( (array!1100 (arr!525 (Array (_ BitVec 32) (_ BitVec 64))) (size!618 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!136 0))(
  ( (LongMapFixedSize!137 (defaultEntry!1687 Int) (mask!4641 (_ BitVec 32)) (extraKeys!1597 (_ BitVec 32)) (zeroValue!1621 V!1091) (minValue!1621 V!1091) (_size!102 (_ BitVec 32)) (_keys!3115 array!1099) (_values!1683 array!1097) (_vacant!102 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!136 0))(
  ( (Cell!137 (v!1518 LongMapFixedSize!136)) )
))
(declare-datatypes ((LongMap!136 0))(
  ( (LongMap!137 (underlying!79 Cell!136)) )
))
(declare-fun thiss!938 () LongMap!136)

(assert (=> b!19502 (= res!13193 (and (not (= (bvand (extraKeys!1597 (v!1518 (underlying!79 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1597 (v!1518 (underlying!79 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!5429 () LongMapFixedSize!136)

(declare-fun getNewLongMapFixedSize!10 ((_ BitVec 32) Int) LongMapFixedSize!136)

(declare-fun computeNewMask!7 (LongMap!136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19502 (= lt!5429 (getNewLongMapFixedSize!10 (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) (defaultEntry!1687 (v!1518 (underlying!79 thiss!938)))))))

(declare-fun res!13192 () Bool)

(assert (=> start!3208 (=> (not res!13192) (not e!12623))))

(declare-fun valid!73 (LongMap!136) Bool)

(assert (=> start!3208 (= res!13192 (valid!73 thiss!938))))

(assert (=> start!3208 e!12623))

(declare-fun e!12620 () Bool)

(assert (=> start!3208 e!12620))

(declare-fun b!19503 () Bool)

(declare-fun e!12622 () Bool)

(declare-fun e!12625 () Bool)

(assert (=> b!19503 (= e!12622 e!12625)))

(declare-fun b!19504 () Bool)

(assert (=> b!19504 (= e!12620 e!12622)))

(declare-fun b!19505 () Bool)

(declare-fun e!12626 () Bool)

(assert (=> b!19505 (= e!12626 tp_is_empty!949)))

(declare-fun mapIsEmpty!883 () Bool)

(declare-fun mapRes!883 () Bool)

(assert (=> mapIsEmpty!883 mapRes!883))

(declare-fun b!19506 () Bool)

(declare-fun valid!74 (LongMapFixedSize!136) Bool)

(assert (=> b!19506 (= e!12628 (not (valid!74 lt!5429)))))

(declare-fun mapNonEmpty!883 () Bool)

(declare-fun tp!3270 () Bool)

(assert (=> mapNonEmpty!883 (= mapRes!883 (and tp!3270 e!12626))))

(declare-fun mapRest!883 () (Array (_ BitVec 32) ValueCell!275))

(declare-fun mapKey!883 () (_ BitVec 32))

(declare-fun mapValue!883 () ValueCell!275)

(assert (=> mapNonEmpty!883 (= (arr!524 (_values!1683 (v!1518 (underlying!79 thiss!938)))) (store mapRest!883 mapKey!883 mapValue!883))))

(declare-fun b!19507 () Bool)

(declare-fun e!12627 () Bool)

(assert (=> b!19507 (= e!12627 (and e!12621 mapRes!883))))

(declare-fun condMapEmpty!883 () Bool)

(declare-fun mapDefault!883 () ValueCell!275)

(assert (=> b!19507 (= condMapEmpty!883 (= (arr!524 (_values!1683 (v!1518 (underlying!79 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!275)) mapDefault!883)))))

(declare-fun array_inv!369 (array!1099) Bool)

(declare-fun array_inv!370 (array!1097) Bool)

(assert (=> b!19508 (= e!12625 (and tp!3271 tp_is_empty!949 (array_inv!369 (_keys!3115 (v!1518 (underlying!79 thiss!938)))) (array_inv!370 (_values!1683 (v!1518 (underlying!79 thiss!938)))) e!12627))))

(assert (= (and start!3208 res!13192) b!19502))

(assert (= (and b!19502 res!13193) b!19506))

(assert (= (and b!19507 condMapEmpty!883) mapIsEmpty!883))

(assert (= (and b!19507 (not condMapEmpty!883)) mapNonEmpty!883))

(get-info :version)

(assert (= (and mapNonEmpty!883 ((_ is ValueCellFull!275) mapValue!883)) b!19505))

(assert (= (and b!19507 ((_ is ValueCellFull!275) mapDefault!883)) b!19501))

(assert (= b!19508 b!19507))

(assert (= b!19503 b!19508))

(assert (= b!19504 b!19503))

(assert (= start!3208 b!19504))

(declare-fun m!13691 () Bool)

(assert (=> b!19506 m!13691))

(declare-fun m!13693 () Bool)

(assert (=> start!3208 m!13693))

(declare-fun m!13695 () Bool)

(assert (=> b!19508 m!13695))

(declare-fun m!13697 () Bool)

(assert (=> b!19508 m!13697))

(declare-fun m!13699 () Bool)

(assert (=> b!19502 m!13699))

(assert (=> b!19502 m!13699))

(declare-fun m!13701 () Bool)

(assert (=> b!19502 m!13701))

(declare-fun m!13703 () Bool)

(assert (=> mapNonEmpty!883 m!13703))

(check-sat tp_is_empty!949 b_and!1339 (not b!19508) (not b!19506) (not b_next!685) (not b!19502) (not mapNonEmpty!883) (not start!3208))
(check-sat b_and!1339 (not b_next!685))
(get-model)

(declare-fun d!3581 () Bool)

(declare-fun res!13212 () Bool)

(declare-fun e!12685 () Bool)

(assert (=> d!3581 (=> (not res!13212) (not e!12685))))

(declare-fun simpleValid!13 (LongMapFixedSize!136) Bool)

(assert (=> d!3581 (= res!13212 (simpleValid!13 lt!5429))))

(assert (=> d!3581 (= (valid!74 lt!5429) e!12685)))

(declare-fun b!19563 () Bool)

(declare-fun res!13213 () Bool)

(assert (=> b!19563 (=> (not res!13213) (not e!12685))))

(declare-fun arrayCountValidKeys!0 (array!1099 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19563 (= res!13213 (= (arrayCountValidKeys!0 (_keys!3115 lt!5429) #b00000000000000000000000000000000 (size!618 (_keys!3115 lt!5429))) (_size!102 lt!5429)))))

(declare-fun b!19564 () Bool)

(declare-fun res!13214 () Bool)

(assert (=> b!19564 (=> (not res!13214) (not e!12685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1099 (_ BitVec 32)) Bool)

(assert (=> b!19564 (= res!13214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3115 lt!5429) (mask!4641 lt!5429)))))

(declare-fun b!19565 () Bool)

(declare-datatypes ((List!543 0))(
  ( (Nil!540) (Cons!539 (h!1105 (_ BitVec 64)) (t!3181 List!543)) )
))
(declare-fun arrayNoDuplicates!0 (array!1099 (_ BitVec 32) List!543) Bool)

(assert (=> b!19565 (= e!12685 (arrayNoDuplicates!0 (_keys!3115 lt!5429) #b00000000000000000000000000000000 Nil!540))))

(assert (= (and d!3581 res!13212) b!19563))

(assert (= (and b!19563 res!13213) b!19564))

(assert (= (and b!19564 res!13214) b!19565))

(declare-fun m!13733 () Bool)

(assert (=> d!3581 m!13733))

(declare-fun m!13735 () Bool)

(assert (=> b!19563 m!13735))

(declare-fun m!13737 () Bool)

(assert (=> b!19564 m!13737))

(declare-fun m!13739 () Bool)

(assert (=> b!19565 m!13739))

(assert (=> b!19506 d!3581))

(declare-fun b!19578 () Bool)

(declare-fun e!12694 () Bool)

(declare-datatypes ((tuple2!824 0))(
  ( (tuple2!825 (_1!415 (_ BitVec 64)) (_2!415 V!1091)) )
))
(declare-fun lt!5489 () tuple2!824)

(declare-fun lt!5483 () (_ BitVec 32))

(assert (=> b!19578 (= e!12694 (ite (= (_1!415 lt!5489) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5483 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5483 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!19579 () Bool)

(declare-datatypes ((Unit!396 0))(
  ( (Unit!397) )
))
(declare-fun e!12692 () Unit!396)

(declare-fun Unit!398 () Unit!396)

(assert (=> b!19579 (= e!12692 Unit!398)))

(declare-fun lt!5502 () LongMapFixedSize!136)

(declare-datatypes ((List!544 0))(
  ( (Nil!541) (Cons!540 (h!1106 tuple2!824) (t!3182 List!544)) )
))
(declare-fun head!820 (List!544) tuple2!824)

(declare-datatypes ((ListLongMap!541 0))(
  ( (ListLongMap!542 (toList!286 List!544)) )
))
(declare-fun map!372 (LongMapFixedSize!136) ListLongMap!541)

(assert (=> b!19579 (= lt!5489 (head!820 (toList!286 (map!372 lt!5502))))))

(declare-fun lt!5482 () array!1099)

(assert (=> b!19579 (= lt!5482 (array!1100 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!19579 (= lt!5483 #b00000000000000000000000000000000)))

(declare-fun lt!5504 () Unit!396)

(declare-fun lemmaKeyInListMapIsInArray!87 (array!1099 array!1097 (_ BitVec 32) (_ BitVec 32) V!1091 V!1091 (_ BitVec 64) Int) Unit!396)

(declare-fun dynLambda!133 (Int (_ BitVec 64)) V!1091)

(assert (=> b!19579 (= lt!5504 (lemmaKeyInListMapIsInArray!87 lt!5482 (array!1098 ((as const (Array (_ BitVec 32) ValueCell!275)) EmptyCell!275) (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) lt!5483 (dynLambda!133 (defaultEntry!1687 (v!1518 (underlying!79 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!133 (defaultEntry!1687 (v!1518 (underlying!79 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!415 lt!5489) (defaultEntry!1687 (v!1518 (underlying!79 thiss!938)))))))

(declare-fun c!2073 () Bool)

(assert (=> b!19579 (= c!2073 (and (not (= (_1!415 lt!5489) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!415 lt!5489) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!19579 e!12694))

(declare-fun lt!5491 () Unit!396)

(assert (=> b!19579 (= lt!5491 lt!5504)))

(declare-fun lt!5496 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1099 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19579 (= lt!5496 (arrayScanForKey!0 (array!1100 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)) (_1!415 lt!5489) #b00000000000000000000000000000000))))

(assert (=> b!19579 false))

(declare-fun b!19580 () Bool)

(declare-fun res!13219 () Bool)

(declare-fun e!12693 () Bool)

(assert (=> b!19580 (=> (not res!13219) (not e!12693))))

(declare-fun lt!5490 () LongMapFixedSize!136)

(assert (=> b!19580 (= res!13219 (= (mask!4641 lt!5490) (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938))))))))

(declare-fun b!19581 () Bool)

(assert (=> b!19581 (= e!12693 (= (map!372 lt!5490) (ListLongMap!542 Nil!541)))))

(declare-fun b!19583 () Bool)

(declare-fun Unit!399 () Unit!396)

(assert (=> b!19583 (= e!12692 Unit!399)))

(declare-fun d!3583 () Bool)

(assert (=> d!3583 e!12693))

(declare-fun res!13220 () Bool)

(assert (=> d!3583 (=> (not res!13220) (not e!12693))))

(assert (=> d!3583 (= res!13220 (valid!74 lt!5490))))

(assert (=> d!3583 (= lt!5490 lt!5502)))

(declare-fun lt!5493 () Unit!396)

(assert (=> d!3583 (= lt!5493 e!12692)))

(declare-fun c!2074 () Bool)

(assert (=> d!3583 (= c!2074 (not (= (map!372 lt!5502) (ListLongMap!542 Nil!541))))))

(declare-fun lt!5498 () Unit!396)

(declare-fun lt!5486 () Unit!396)

(assert (=> d!3583 (= lt!5498 lt!5486)))

(declare-fun lt!5492 () array!1099)

(declare-fun lt!5494 () (_ BitVec 32))

(declare-fun lt!5499 () List!543)

(assert (=> d!3583 (arrayNoDuplicates!0 lt!5492 lt!5494 lt!5499)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1099 (_ BitVec 32) (_ BitVec 32) List!543) Unit!396)

(assert (=> d!3583 (= lt!5486 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5492 lt!5494 (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001) lt!5499))))

(assert (=> d!3583 (= lt!5499 Nil!540)))

(assert (=> d!3583 (= lt!5494 #b00000000000000000000000000000000)))

(assert (=> d!3583 (= lt!5492 (array!1100 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5487 () Unit!396)

(declare-fun lt!5485 () Unit!396)

(assert (=> d!3583 (= lt!5487 lt!5485)))

(declare-fun lt!5495 () (_ BitVec 32))

(declare-fun lt!5501 () array!1099)

(assert (=> d!3583 (arrayForallSeekEntryOrOpenFound!0 lt!5495 lt!5501 (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1099 (_ BitVec 32) (_ BitVec 32)) Unit!396)

(assert (=> d!3583 (= lt!5485 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5501 (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) lt!5495))))

(assert (=> d!3583 (= lt!5495 #b00000000000000000000000000000000)))

(assert (=> d!3583 (= lt!5501 (array!1100 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5497 () Unit!396)

(declare-fun lt!5500 () Unit!396)

(assert (=> d!3583 (= lt!5497 lt!5500)))

(declare-fun lt!5484 () array!1099)

(declare-fun lt!5488 () (_ BitVec 32))

(declare-fun lt!5503 () (_ BitVec 32))

(assert (=> d!3583 (= (arrayCountValidKeys!0 lt!5484 lt!5488 lt!5503) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1099 (_ BitVec 32) (_ BitVec 32)) Unit!396)

(assert (=> d!3583 (= lt!5500 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5484 lt!5488 lt!5503))))

(assert (=> d!3583 (= lt!5503 (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3583 (= lt!5488 #b00000000000000000000000000000000)))

(assert (=> d!3583 (= lt!5484 (array!1100 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3583 (= lt!5502 (LongMapFixedSize!137 (defaultEntry!1687 (v!1518 (underlying!79 thiss!938))) (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!133 (defaultEntry!1687 (v!1518 (underlying!79 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!133 (defaultEntry!1687 (v!1518 (underlying!79 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1100 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)) (array!1098 ((as const (Array (_ BitVec 32) ValueCell!275)) EmptyCell!275) (bvadd (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3583 (validMask!0 (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))))))

(assert (=> d!3583 (= (getNewLongMapFixedSize!10 (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) (defaultEntry!1687 (v!1518 (underlying!79 thiss!938)))) lt!5490)))

(declare-fun b!19582 () Bool)

(declare-fun arrayContainsKey!0 (array!1099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19582 (= e!12694 (arrayContainsKey!0 lt!5482 (_1!415 lt!5489) #b00000000000000000000000000000000))))

(assert (= (and d!3583 c!2074) b!19579))

(assert (= (and d!3583 (not c!2074)) b!19583))

(assert (= (and b!19579 c!2073) b!19582))

(assert (= (and b!19579 (not c!2073)) b!19578))

(assert (= (and d!3583 res!13220) b!19580))

(assert (= (and b!19580 res!13219) b!19581))

(declare-fun b_lambda!1453 () Bool)

(assert (=> (not b_lambda!1453) (not b!19579)))

(declare-fun t!3180 () Bool)

(declare-fun tb!625 () Bool)

(assert (=> (and b!19508 (= (defaultEntry!1687 (v!1518 (underlying!79 thiss!938))) (defaultEntry!1687 (v!1518 (underlying!79 thiss!938)))) t!3180) tb!625))

(declare-fun result!1021 () Bool)

(assert (=> tb!625 (= result!1021 tp_is_empty!949)))

(assert (=> b!19579 t!3180))

(declare-fun b_and!1345 () Bool)

(assert (= b_and!1339 (and (=> t!3180 result!1021) b_and!1345)))

(declare-fun b_lambda!1455 () Bool)

(assert (=> (not b_lambda!1455) (not d!3583)))

(assert (=> d!3583 t!3180))

(declare-fun b_and!1347 () Bool)

(assert (= b_and!1345 (and (=> t!3180 result!1021) b_and!1347)))

(declare-fun m!13741 () Bool)

(assert (=> b!19579 m!13741))

(declare-fun m!13743 () Bool)

(assert (=> b!19579 m!13743))

(declare-fun m!13745 () Bool)

(assert (=> b!19579 m!13745))

(assert (=> b!19579 m!13699))

(assert (=> b!19579 m!13745))

(assert (=> b!19579 m!13745))

(declare-fun m!13747 () Bool)

(assert (=> b!19579 m!13747))

(declare-fun m!13749 () Bool)

(assert (=> b!19579 m!13749))

(declare-fun m!13751 () Bool)

(assert (=> b!19581 m!13751))

(assert (=> d!3583 m!13699))

(declare-fun m!13753 () Bool)

(assert (=> d!3583 m!13753))

(declare-fun m!13755 () Bool)

(assert (=> d!3583 m!13755))

(assert (=> d!3583 m!13699))

(declare-fun m!13757 () Bool)

(assert (=> d!3583 m!13757))

(declare-fun m!13759 () Bool)

(assert (=> d!3583 m!13759))

(declare-fun m!13761 () Bool)

(assert (=> d!3583 m!13761))

(assert (=> d!3583 m!13745))

(declare-fun m!13763 () Bool)

(assert (=> d!3583 m!13763))

(assert (=> d!3583 m!13699))

(declare-fun m!13765 () Bool)

(assert (=> d!3583 m!13765))

(declare-fun m!13767 () Bool)

(assert (=> d!3583 m!13767))

(assert (=> d!3583 m!13749))

(declare-fun m!13769 () Bool)

(assert (=> b!19582 m!13769))

(assert (=> b!19502 d!3583))

(declare-fun d!3585 () Bool)

(declare-fun e!12699 () Bool)

(assert (=> d!3585 e!12699))

(declare-fun res!13223 () Bool)

(assert (=> d!3585 (=> (not res!13223) (not e!12699))))

(declare-fun lt!5510 () (_ BitVec 32))

(assert (=> d!3585 (= res!13223 (validMask!0 lt!5510))))

(declare-datatypes ((tuple2!826 0))(
  ( (tuple2!827 (_1!416 Unit!396) (_2!416 (_ BitVec 32))) )
))
(declare-fun e!12700 () tuple2!826)

(assert (=> d!3585 (= lt!5510 (_2!416 e!12700))))

(declare-fun c!2077 () Bool)

(declare-fun lt!5509 () tuple2!826)

(assert (=> d!3585 (= c!2077 (and (bvsgt (_2!416 lt!5509) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!102 (v!1518 (underlying!79 thiss!938)))) (_2!416 lt!5509)) (bvsge (bvadd (bvand (bvashr (_2!416 lt!5509) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!102 (v!1518 (underlying!79 thiss!938))))))))

(declare-fun Unit!400 () Unit!396)

(declare-fun Unit!401 () Unit!396)

(assert (=> d!3585 (= lt!5509 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!102 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))))) (mask!4641 (v!1518 (underlying!79 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!102 (v!1518 (underlying!79 thiss!938)))) (mask!4641 (v!1518 (underlying!79 thiss!938))))) (tuple2!827 Unit!400 (bvand (bvadd (bvshl (mask!4641 (v!1518 (underlying!79 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!827 Unit!401 (mask!4641 (v!1518 (underlying!79 thiss!938))))))))

(assert (=> d!3585 (validMask!0 (mask!4641 (v!1518 (underlying!79 thiss!938))))))

(assert (=> d!3585 (= (computeNewMask!7 thiss!938 (mask!4641 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (_size!102 (v!1518 (underlying!79 thiss!938)))) lt!5510)))

(declare-fun b!19592 () Bool)

(declare-fun computeNewMaskWhile!4 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!826)

(assert (=> b!19592 (= e!12700 (computeNewMaskWhile!4 (_size!102 (v!1518 (underlying!79 thiss!938))) (_vacant!102 (v!1518 (underlying!79 thiss!938))) (mask!4641 (v!1518 (underlying!79 thiss!938))) (_2!416 lt!5509)))))

(declare-fun b!19593 () Bool)

(declare-fun Unit!402 () Unit!396)

(assert (=> b!19593 (= e!12700 (tuple2!827 Unit!402 (_2!416 lt!5509)))))

(declare-fun b!19594 () Bool)

(assert (=> b!19594 (= e!12699 (bvsle (_size!102 (v!1518 (underlying!79 thiss!938))) (bvadd lt!5510 #b00000000000000000000000000000001)))))

(assert (= (and d!3585 c!2077) b!19592))

(assert (= (and d!3585 (not c!2077)) b!19593))

(assert (= (and d!3585 res!13223) b!19594))

(declare-fun m!13771 () Bool)

(assert (=> d!3585 m!13771))

(declare-fun m!13773 () Bool)

(assert (=> d!3585 m!13773))

(declare-fun m!13775 () Bool)

(assert (=> b!19592 m!13775))

(assert (=> b!19502 d!3585))

(declare-fun d!3587 () Bool)

(assert (=> d!3587 (= (valid!73 thiss!938) (valid!74 (v!1518 (underlying!79 thiss!938))))))

(declare-fun bs!876 () Bool)

(assert (= bs!876 d!3587))

(declare-fun m!13777 () Bool)

(assert (=> bs!876 m!13777))

(assert (=> start!3208 d!3587))

(declare-fun d!3589 () Bool)

(assert (=> d!3589 (= (array_inv!369 (_keys!3115 (v!1518 (underlying!79 thiss!938)))) (bvsge (size!618 (_keys!3115 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19508 d!3589))

(declare-fun d!3591 () Bool)

(assert (=> d!3591 (= (array_inv!370 (_values!1683 (v!1518 (underlying!79 thiss!938)))) (bvsge (size!617 (_values!1683 (v!1518 (underlying!79 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19508 d!3591))

(declare-fun mapNonEmpty!892 () Bool)

(declare-fun mapRes!892 () Bool)

(declare-fun tp!3286 () Bool)

(declare-fun e!12706 () Bool)

(assert (=> mapNonEmpty!892 (= mapRes!892 (and tp!3286 e!12706))))

(declare-fun mapKey!892 () (_ BitVec 32))

(declare-fun mapValue!892 () ValueCell!275)

(declare-fun mapRest!892 () (Array (_ BitVec 32) ValueCell!275))

(assert (=> mapNonEmpty!892 (= mapRest!883 (store mapRest!892 mapKey!892 mapValue!892))))

(declare-fun condMapEmpty!892 () Bool)

(declare-fun mapDefault!892 () ValueCell!275)

(assert (=> mapNonEmpty!883 (= condMapEmpty!892 (= mapRest!883 ((as const (Array (_ BitVec 32) ValueCell!275)) mapDefault!892)))))

(declare-fun e!12705 () Bool)

(assert (=> mapNonEmpty!883 (= tp!3270 (and e!12705 mapRes!892))))

(declare-fun mapIsEmpty!892 () Bool)

(assert (=> mapIsEmpty!892 mapRes!892))

(declare-fun b!19601 () Bool)

(assert (=> b!19601 (= e!12706 tp_is_empty!949)))

(declare-fun b!19602 () Bool)

(assert (=> b!19602 (= e!12705 tp_is_empty!949)))

(assert (= (and mapNonEmpty!883 condMapEmpty!892) mapIsEmpty!892))

(assert (= (and mapNonEmpty!883 (not condMapEmpty!892)) mapNonEmpty!892))

(assert (= (and mapNonEmpty!892 ((_ is ValueCellFull!275) mapValue!892)) b!19601))

(assert (= (and mapNonEmpty!883 ((_ is ValueCellFull!275) mapDefault!892)) b!19602))

(declare-fun m!13779 () Bool)

(assert (=> mapNonEmpty!892 m!13779))

(declare-fun b_lambda!1457 () Bool)

(assert (= b_lambda!1455 (or (and b!19508 b_free!685) b_lambda!1457)))

(declare-fun b_lambda!1459 () Bool)

(assert (= b_lambda!1453 (or (and b!19508 b_free!685) b_lambda!1459)))

(check-sat (not b!19565) (not b!19581) b_and!1347 (not d!3585) (not b_lambda!1459) (not mapNonEmpty!892) (not b!19564) (not d!3587) (not b_next!685) (not d!3583) tp_is_empty!949 (not b!19582) (not b_lambda!1457) (not d!3581) (not b!19592) (not b!19563) (not b!19579))
(check-sat b_and!1347 (not b_next!685))
