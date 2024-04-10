; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3220 () Bool)

(assert start!3220)

(declare-fun b!19591 () Bool)

(declare-fun b_free!687 () Bool)

(declare-fun b_next!687 () Bool)

(assert (=> b!19591 (= b_free!687 (not b_next!687))))

(declare-fun tp!3277 () Bool)

(declare-fun b_and!1347 () Bool)

(assert (=> b!19591 (= tp!3277 b_and!1347)))

(declare-fun b!19585 () Bool)

(declare-fun e!12693 () Bool)

(declare-fun tp_is_empty!951 () Bool)

(assert (=> b!19585 (= e!12693 tp_is_empty!951)))

(declare-fun mapNonEmpty!886 () Bool)

(declare-fun mapRes!886 () Bool)

(declare-fun tp!3276 () Bool)

(declare-fun e!12694 () Bool)

(assert (=> mapNonEmpty!886 (= mapRes!886 (and tp!3276 e!12694))))

(declare-fun mapKey!886 () (_ BitVec 32))

(declare-datatypes ((V!1093 0))(
  ( (V!1094 (val!502 Int)) )
))
(declare-datatypes ((ValueCell!276 0))(
  ( (ValueCellFull!276 (v!1520 V!1093)) (EmptyCell!276) )
))
(declare-fun mapValue!886 () ValueCell!276)

(declare-datatypes ((array!1119 0))(
  ( (array!1120 (arr!535 (Array (_ BitVec 32) ValueCell!276)) (size!628 (_ BitVec 32))) )
))
(declare-datatypes ((array!1121 0))(
  ( (array!1122 (arr!536 (Array (_ BitVec 32) (_ BitVec 64))) (size!629 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!138 0))(
  ( (LongMapFixedSize!139 (defaultEntry!1688 Int) (mask!4642 (_ BitVec 32)) (extraKeys!1598 (_ BitVec 32)) (zeroValue!1622 V!1093) (minValue!1622 V!1093) (_size!103 (_ BitVec 32)) (_keys!3116 array!1121) (_values!1684 array!1119) (_vacant!103 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!138 0))(
  ( (Cell!139 (v!1521 LongMapFixedSize!138)) )
))
(declare-datatypes ((LongMap!138 0))(
  ( (LongMap!139 (underlying!80 Cell!138)) )
))
(declare-fun thiss!938 () LongMap!138)

(declare-fun mapRest!886 () (Array (_ BitVec 32) ValueCell!276))

(assert (=> mapNonEmpty!886 (= (arr!535 (_values!1684 (v!1521 (underlying!80 thiss!938)))) (store mapRest!886 mapKey!886 mapValue!886))))

(declare-fun b!19586 () Bool)

(declare-fun e!12699 () Bool)

(declare-fun e!12701 () Bool)

(assert (=> b!19586 (= e!12699 e!12701)))

(declare-fun res!13230 () Bool)

(assert (=> b!19586 (=> (not res!13230) (not e!12701))))

(assert (=> b!19586 (= res!13230 (and (not (= (bvand (extraKeys!1598 (v!1521 (underlying!80 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1598 (v!1521 (underlying!80 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!5436 () LongMapFixedSize!138)

(declare-fun getNewLongMapFixedSize!10 ((_ BitVec 32) Int) LongMapFixedSize!138)

(declare-fun computeNewMask!6 (LongMap!138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19586 (= lt!5436 (getNewLongMapFixedSize!10 (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) (defaultEntry!1688 (v!1521 (underlying!80 thiss!938)))))))

(declare-fun b!19587 () Bool)

(declare-fun e!12696 () Bool)

(assert (=> b!19587 (= e!12696 (and e!12693 mapRes!886))))

(declare-fun condMapEmpty!886 () Bool)

(declare-fun mapDefault!886 () ValueCell!276)

(assert (=> b!19587 (= condMapEmpty!886 (= (arr!535 (_values!1684 (v!1521 (underlying!80 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!276)) mapDefault!886)))))

(declare-fun b!19588 () Bool)

(declare-fun e!12700 () Bool)

(declare-fun e!12695 () Bool)

(assert (=> b!19588 (= e!12700 e!12695)))

(declare-fun b!19589 () Bool)

(declare-fun valid!65 (LongMapFixedSize!138) Bool)

(assert (=> b!19589 (= e!12701 (not (valid!65 lt!5436)))))

(declare-fun array_inv!363 (array!1121) Bool)

(declare-fun array_inv!364 (array!1119) Bool)

(assert (=> b!19591 (= e!12695 (and tp!3277 tp_is_empty!951 (array_inv!363 (_keys!3116 (v!1521 (underlying!80 thiss!938)))) (array_inv!364 (_values!1684 (v!1521 (underlying!80 thiss!938)))) e!12696))))

(declare-fun mapIsEmpty!886 () Bool)

(assert (=> mapIsEmpty!886 mapRes!886))

(declare-fun b!19592 () Bool)

(declare-fun e!12697 () Bool)

(assert (=> b!19592 (= e!12697 e!12700)))

(declare-fun res!13231 () Bool)

(assert (=> start!3220 (=> (not res!13231) (not e!12699))))

(declare-fun valid!66 (LongMap!138) Bool)

(assert (=> start!3220 (= res!13231 (valid!66 thiss!938))))

(assert (=> start!3220 e!12699))

(assert (=> start!3220 e!12697))

(declare-fun b!19590 () Bool)

(assert (=> b!19590 (= e!12694 tp_is_empty!951)))

(assert (= (and start!3220 res!13231) b!19586))

(assert (= (and b!19586 res!13230) b!19589))

(assert (= (and b!19587 condMapEmpty!886) mapIsEmpty!886))

(assert (= (and b!19587 (not condMapEmpty!886)) mapNonEmpty!886))

(get-info :version)

(assert (= (and mapNonEmpty!886 ((_ is ValueCellFull!276) mapValue!886)) b!19590))

(assert (= (and b!19587 ((_ is ValueCellFull!276) mapDefault!886)) b!19585))

(assert (= b!19591 b!19587))

(assert (= b!19588 b!19591))

(assert (= b!19592 b!19588))

(assert (= start!3220 b!19592))

(declare-fun m!13767 () Bool)

(assert (=> mapNonEmpty!886 m!13767))

(declare-fun m!13769 () Bool)

(assert (=> b!19586 m!13769))

(assert (=> b!19586 m!13769))

(declare-fun m!13771 () Bool)

(assert (=> b!19586 m!13771))

(declare-fun m!13773 () Bool)

(assert (=> b!19591 m!13773))

(declare-fun m!13775 () Bool)

(assert (=> b!19591 m!13775))

(declare-fun m!13777 () Bool)

(assert (=> b!19589 m!13777))

(declare-fun m!13779 () Bool)

(assert (=> start!3220 m!13779))

(check-sat (not b!19591) (not b!19586) (not b!19589) tp_is_empty!951 (not start!3220) b_and!1347 (not b_next!687) (not mapNonEmpty!886))
(check-sat b_and!1347 (not b_next!687))
(get-model)

(declare-fun d!3619 () Bool)

(declare-fun res!13244 () Bool)

(declare-fun e!12731 () Bool)

(assert (=> d!3619 (=> (not res!13244) (not e!12731))))

(declare-fun simpleValid!13 (LongMapFixedSize!138) Bool)

(assert (=> d!3619 (= res!13244 (simpleValid!13 lt!5436))))

(assert (=> d!3619 (= (valid!65 lt!5436) e!12731)))

(declare-fun b!19623 () Bool)

(declare-fun res!13245 () Bool)

(assert (=> b!19623 (=> (not res!13245) (not e!12731))))

(declare-fun arrayCountValidKeys!0 (array!1121 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19623 (= res!13245 (= (arrayCountValidKeys!0 (_keys!3116 lt!5436) #b00000000000000000000000000000000 (size!629 (_keys!3116 lt!5436))) (_size!103 lt!5436)))))

(declare-fun b!19624 () Bool)

(declare-fun res!13246 () Bool)

(assert (=> b!19624 (=> (not res!13246) (not e!12731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1121 (_ BitVec 32)) Bool)

(assert (=> b!19624 (= res!13246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3116 lt!5436) (mask!4642 lt!5436)))))

(declare-fun b!19625 () Bool)

(declare-datatypes ((List!547 0))(
  ( (Nil!544) (Cons!543 (h!1109 (_ BitVec 64)) (t!3192 List!547)) )
))
(declare-fun arrayNoDuplicates!0 (array!1121 (_ BitVec 32) List!547) Bool)

(assert (=> b!19625 (= e!12731 (arrayNoDuplicates!0 (_keys!3116 lt!5436) #b00000000000000000000000000000000 Nil!544))))

(assert (= (and d!3619 res!13244) b!19623))

(assert (= (and b!19623 res!13245) b!19624))

(assert (= (and b!19624 res!13246) b!19625))

(declare-fun m!13795 () Bool)

(assert (=> d!3619 m!13795))

(declare-fun m!13797 () Bool)

(assert (=> b!19623 m!13797))

(declare-fun m!13799 () Bool)

(assert (=> b!19624 m!13799))

(declare-fun m!13801 () Bool)

(assert (=> b!19625 m!13801))

(assert (=> b!19589 d!3619))

(declare-fun d!3621 () Bool)

(assert (=> d!3621 (= (array_inv!363 (_keys!3116 (v!1521 (underlying!80 thiss!938)))) (bvsge (size!629 (_keys!3116 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19591 d!3621))

(declare-fun d!3623 () Bool)

(assert (=> d!3623 (= (array_inv!364 (_values!1684 (v!1521 (underlying!80 thiss!938)))) (bvsge (size!628 (_values!1684 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19591 d!3623))

(declare-fun b!19638 () Bool)

(declare-fun res!13251 () Bool)

(declare-fun e!12738 () Bool)

(assert (=> b!19638 (=> (not res!13251) (not e!12738))))

(declare-fun lt!5493 () LongMapFixedSize!138)

(assert (=> b!19638 (= res!13251 (= (mask!4642 lt!5493) (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938))))))))

(declare-fun b!19639 () Bool)

(declare-datatypes ((tuple2!820 0))(
  ( (tuple2!821 (_1!413 (_ BitVec 64)) (_2!413 V!1093)) )
))
(declare-datatypes ((List!548 0))(
  ( (Nil!545) (Cons!544 (h!1110 tuple2!820) (t!3193 List!548)) )
))
(declare-datatypes ((ListLongMap!545 0))(
  ( (ListLongMap!546 (toList!288 List!548)) )
))
(declare-fun map!372 (LongMapFixedSize!138) ListLongMap!545)

(assert (=> b!19639 (= e!12738 (= (map!372 lt!5493) (ListLongMap!546 Nil!545)))))

(declare-fun d!3625 () Bool)

(assert (=> d!3625 e!12738))

(declare-fun res!13252 () Bool)

(assert (=> d!3625 (=> (not res!13252) (not e!12738))))

(assert (=> d!3625 (= res!13252 (valid!65 lt!5493))))

(declare-fun lt!5502 () LongMapFixedSize!138)

(assert (=> d!3625 (= lt!5493 lt!5502)))

(declare-datatypes ((Unit!389 0))(
  ( (Unit!390) )
))
(declare-fun lt!5490 () Unit!389)

(declare-fun e!12740 () Unit!389)

(assert (=> d!3625 (= lt!5490 e!12740)))

(declare-fun c!2088 () Bool)

(assert (=> d!3625 (= c!2088 (not (= (map!372 lt!5502) (ListLongMap!546 Nil!545))))))

(declare-fun lt!5486 () Unit!389)

(declare-fun lt!5491 () Unit!389)

(assert (=> d!3625 (= lt!5486 lt!5491)))

(declare-fun lt!5507 () array!1121)

(declare-fun lt!5503 () (_ BitVec 32))

(declare-fun lt!5506 () List!547)

(assert (=> d!3625 (arrayNoDuplicates!0 lt!5507 lt!5503 lt!5506)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1121 (_ BitVec 32) (_ BitVec 32) List!547) Unit!389)

(assert (=> d!3625 (= lt!5491 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5507 lt!5503 (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001) lt!5506))))

(assert (=> d!3625 (= lt!5506 Nil!544)))

(assert (=> d!3625 (= lt!5503 #b00000000000000000000000000000000)))

(assert (=> d!3625 (= lt!5507 (array!1122 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5501 () Unit!389)

(declare-fun lt!5495 () Unit!389)

(assert (=> d!3625 (= lt!5501 lt!5495)))

(declare-fun lt!5487 () (_ BitVec 32))

(declare-fun lt!5488 () array!1121)

(assert (=> d!3625 (arrayForallSeekEntryOrOpenFound!0 lt!5487 lt!5488 (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1121 (_ BitVec 32) (_ BitVec 32)) Unit!389)

(assert (=> d!3625 (= lt!5495 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5488 (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) lt!5487))))

(assert (=> d!3625 (= lt!5487 #b00000000000000000000000000000000)))

(assert (=> d!3625 (= lt!5488 (array!1122 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5489 () Unit!389)

(declare-fun lt!5494 () Unit!389)

(assert (=> d!3625 (= lt!5489 lt!5494)))

(declare-fun lt!5505 () array!1121)

(declare-fun lt!5499 () (_ BitVec 32))

(declare-fun lt!5496 () (_ BitVec 32))

(assert (=> d!3625 (= (arrayCountValidKeys!0 lt!5505 lt!5499 lt!5496) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1121 (_ BitVec 32) (_ BitVec 32)) Unit!389)

(assert (=> d!3625 (= lt!5494 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5505 lt!5499 lt!5496))))

(assert (=> d!3625 (= lt!5496 (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3625 (= lt!5499 #b00000000000000000000000000000000)))

(assert (=> d!3625 (= lt!5505 (array!1122 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!134 (Int (_ BitVec 64)) V!1093)

(assert (=> d!3625 (= lt!5502 (LongMapFixedSize!139 (defaultEntry!1688 (v!1521 (underlying!80 thiss!938))) (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!134 (defaultEntry!1688 (v!1521 (underlying!80 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!134 (defaultEntry!1688 (v!1521 (underlying!80 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1122 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001)) (array!1120 ((as const (Array (_ BitVec 32) ValueCell!276)) EmptyCell!276) (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3625 (validMask!0 (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))))))

(assert (=> d!3625 (= (getNewLongMapFixedSize!10 (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) (defaultEntry!1688 (v!1521 (underlying!80 thiss!938)))) lt!5493)))

(declare-fun b!19640 () Bool)

(declare-fun Unit!391 () Unit!389)

(assert (=> b!19640 (= e!12740 Unit!391)))

(declare-fun lt!5500 () tuple2!820)

(declare-fun head!820 (List!548) tuple2!820)

(assert (=> b!19640 (= lt!5500 (head!820 (toList!288 (map!372 lt!5502))))))

(declare-fun lt!5498 () array!1121)

(assert (=> b!19640 (= lt!5498 (array!1122 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5497 () (_ BitVec 32))

(assert (=> b!19640 (= lt!5497 #b00000000000000000000000000000000)))

(declare-fun lt!5504 () Unit!389)

(declare-fun lemmaKeyInListMapIsInArray!81 (array!1121 array!1119 (_ BitVec 32) (_ BitVec 32) V!1093 V!1093 (_ BitVec 64) Int) Unit!389)

(assert (=> b!19640 (= lt!5504 (lemmaKeyInListMapIsInArray!81 lt!5498 (array!1120 ((as const (Array (_ BitVec 32) ValueCell!276)) EmptyCell!276) (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) lt!5497 (dynLambda!134 (defaultEntry!1688 (v!1521 (underlying!80 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!134 (defaultEntry!1688 (v!1521 (underlying!80 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!413 lt!5500) (defaultEntry!1688 (v!1521 (underlying!80 thiss!938)))))))

(declare-fun c!2087 () Bool)

(assert (=> b!19640 (= c!2087 (and (not (= (_1!413 lt!5500) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!413 lt!5500) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!12739 () Bool)

(assert (=> b!19640 e!12739))

(declare-fun lt!5508 () Unit!389)

(assert (=> b!19640 (= lt!5508 lt!5504)))

(declare-fun lt!5492 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1121 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19640 (= lt!5492 (arrayScanForKey!0 (array!1122 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) #b00000000000000000000000000000001)) (_1!413 lt!5500) #b00000000000000000000000000000000))))

(assert (=> b!19640 false))

(declare-fun b!19641 () Bool)

(declare-fun arrayContainsKey!0 (array!1121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19641 (= e!12739 (arrayContainsKey!0 lt!5498 (_1!413 lt!5500) #b00000000000000000000000000000000))))

(declare-fun b!19642 () Bool)

(assert (=> b!19642 (= e!12739 (ite (= (_1!413 lt!5500) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5497 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5497 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!19643 () Bool)

(declare-fun Unit!392 () Unit!389)

(assert (=> b!19643 (= e!12740 Unit!392)))

(assert (= (and d!3625 c!2088) b!19640))

(assert (= (and d!3625 (not c!2088)) b!19643))

(assert (= (and b!19640 c!2087) b!19641))

(assert (= (and b!19640 (not c!2087)) b!19642))

(assert (= (and d!3625 res!13252) b!19638))

(assert (= (and b!19638 res!13251) b!19639))

(declare-fun b_lambda!1465 () Bool)

(assert (=> (not b_lambda!1465) (not d!3625)))

(declare-fun t!3191 () Bool)

(declare-fun tb!631 () Bool)

(assert (=> (and b!19591 (= (defaultEntry!1688 (v!1521 (underlying!80 thiss!938))) (defaultEntry!1688 (v!1521 (underlying!80 thiss!938)))) t!3191) tb!631))

(declare-fun result!1027 () Bool)

(assert (=> tb!631 (= result!1027 tp_is_empty!951)))

(assert (=> d!3625 t!3191))

(declare-fun b_and!1351 () Bool)

(assert (= b_and!1347 (and (=> t!3191 result!1027) b_and!1351)))

(declare-fun b_lambda!1467 () Bool)

(assert (=> (not b_lambda!1467) (not b!19640)))

(assert (=> b!19640 t!3191))

(declare-fun b_and!1353 () Bool)

(assert (= b_and!1351 (and (=> t!3191 result!1027) b_and!1353)))

(declare-fun m!13803 () Bool)

(assert (=> b!19639 m!13803))

(declare-fun m!13805 () Bool)

(assert (=> d!3625 m!13805))

(assert (=> d!3625 m!13769))

(declare-fun m!13807 () Bool)

(assert (=> d!3625 m!13807))

(declare-fun m!13809 () Bool)

(assert (=> d!3625 m!13809))

(assert (=> d!3625 m!13769))

(declare-fun m!13811 () Bool)

(assert (=> d!3625 m!13811))

(declare-fun m!13813 () Bool)

(assert (=> d!3625 m!13813))

(declare-fun m!13815 () Bool)

(assert (=> d!3625 m!13815))

(declare-fun m!13817 () Bool)

(assert (=> d!3625 m!13817))

(declare-fun m!13819 () Bool)

(assert (=> d!3625 m!13819))

(declare-fun m!13821 () Bool)

(assert (=> d!3625 m!13821))

(assert (=> d!3625 m!13769))

(declare-fun m!13823 () Bool)

(assert (=> d!3625 m!13823))

(assert (=> b!19640 m!13809))

(declare-fun m!13825 () Bool)

(assert (=> b!19640 m!13825))

(assert (=> b!19640 m!13813))

(assert (=> b!19640 m!13769))

(assert (=> b!19640 m!13809))

(assert (=> b!19640 m!13809))

(declare-fun m!13827 () Bool)

(assert (=> b!19640 m!13827))

(declare-fun m!13829 () Bool)

(assert (=> b!19640 m!13829))

(declare-fun m!13831 () Bool)

(assert (=> b!19641 m!13831))

(assert (=> b!19586 d!3625))

(declare-fun d!3627 () Bool)

(declare-fun e!12745 () Bool)

(assert (=> d!3627 e!12745))

(declare-fun res!13255 () Bool)

(assert (=> d!3627 (=> (not res!13255) (not e!12745))))

(declare-fun lt!5513 () (_ BitVec 32))

(assert (=> d!3627 (= res!13255 (validMask!0 lt!5513))))

(declare-datatypes ((tuple2!822 0))(
  ( (tuple2!823 (_1!414 Unit!389) (_2!414 (_ BitVec 32))) )
))
(declare-fun e!12746 () tuple2!822)

(assert (=> d!3627 (= lt!5513 (_2!414 e!12746))))

(declare-fun c!2091 () Bool)

(declare-fun lt!5514 () tuple2!822)

(assert (=> d!3627 (= c!2091 (and (bvsgt (_2!414 lt!5514) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!103 (v!1521 (underlying!80 thiss!938)))) (_2!414 lt!5514)) (bvsge (bvadd (bvand (bvashr (_2!414 lt!5514) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!103 (v!1521 (underlying!80 thiss!938))))))))

(declare-fun Unit!393 () Unit!389)

(declare-fun Unit!394 () Unit!389)

(assert (=> d!3627 (= lt!5514 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!103 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))))) (mask!4642 (v!1521 (underlying!80 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!103 (v!1521 (underlying!80 thiss!938)))) (mask!4642 (v!1521 (underlying!80 thiss!938))))) (tuple2!823 Unit!393 (bvand (bvadd (bvshl (mask!4642 (v!1521 (underlying!80 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!823 Unit!394 (mask!4642 (v!1521 (underlying!80 thiss!938))))))))

(assert (=> d!3627 (validMask!0 (mask!4642 (v!1521 (underlying!80 thiss!938))))))

(assert (=> d!3627 (= (computeNewMask!6 thiss!938 (mask!4642 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (_size!103 (v!1521 (underlying!80 thiss!938)))) lt!5513)))

(declare-fun b!19652 () Bool)

(declare-fun computeNewMaskWhile!4 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!822)

(assert (=> b!19652 (= e!12746 (computeNewMaskWhile!4 (_size!103 (v!1521 (underlying!80 thiss!938))) (_vacant!103 (v!1521 (underlying!80 thiss!938))) (mask!4642 (v!1521 (underlying!80 thiss!938))) (_2!414 lt!5514)))))

(declare-fun b!19653 () Bool)

(declare-fun Unit!395 () Unit!389)

(assert (=> b!19653 (= e!12746 (tuple2!823 Unit!395 (_2!414 lt!5514)))))

(declare-fun b!19654 () Bool)

(assert (=> b!19654 (= e!12745 (bvsle (_size!103 (v!1521 (underlying!80 thiss!938))) (bvadd lt!5513 #b00000000000000000000000000000001)))))

(assert (= (and d!3627 c!2091) b!19652))

(assert (= (and d!3627 (not c!2091)) b!19653))

(assert (= (and d!3627 res!13255) b!19654))

(declare-fun m!13833 () Bool)

(assert (=> d!3627 m!13833))

(declare-fun m!13835 () Bool)

(assert (=> d!3627 m!13835))

(declare-fun m!13837 () Bool)

(assert (=> b!19652 m!13837))

(assert (=> b!19586 d!3627))

(declare-fun d!3629 () Bool)

(assert (=> d!3629 (= (valid!66 thiss!938) (valid!65 (v!1521 (underlying!80 thiss!938))))))

(declare-fun bs!878 () Bool)

(assert (= bs!878 d!3629))

(declare-fun m!13839 () Bool)

(assert (=> bs!878 m!13839))

(assert (=> start!3220 d!3629))

(declare-fun condMapEmpty!892 () Bool)

(declare-fun mapDefault!892 () ValueCell!276)

(assert (=> mapNonEmpty!886 (= condMapEmpty!892 (= mapRest!886 ((as const (Array (_ BitVec 32) ValueCell!276)) mapDefault!892)))))

(declare-fun e!12752 () Bool)

(declare-fun mapRes!892 () Bool)

(assert (=> mapNonEmpty!886 (= tp!3276 (and e!12752 mapRes!892))))

(declare-fun mapNonEmpty!892 () Bool)

(declare-fun tp!3286 () Bool)

(declare-fun e!12751 () Bool)

(assert (=> mapNonEmpty!892 (= mapRes!892 (and tp!3286 e!12751))))

(declare-fun mapKey!892 () (_ BitVec 32))

(declare-fun mapValue!892 () ValueCell!276)

(declare-fun mapRest!892 () (Array (_ BitVec 32) ValueCell!276))

(assert (=> mapNonEmpty!892 (= mapRest!886 (store mapRest!892 mapKey!892 mapValue!892))))

(declare-fun b!19662 () Bool)

(assert (=> b!19662 (= e!12752 tp_is_empty!951)))

(declare-fun b!19661 () Bool)

(assert (=> b!19661 (= e!12751 tp_is_empty!951)))

(declare-fun mapIsEmpty!892 () Bool)

(assert (=> mapIsEmpty!892 mapRes!892))

(assert (= (and mapNonEmpty!886 condMapEmpty!892) mapIsEmpty!892))

(assert (= (and mapNonEmpty!886 (not condMapEmpty!892)) mapNonEmpty!892))

(assert (= (and mapNonEmpty!892 ((_ is ValueCellFull!276) mapValue!892)) b!19661))

(assert (= (and mapNonEmpty!886 ((_ is ValueCellFull!276) mapDefault!892)) b!19662))

(declare-fun m!13841 () Bool)

(assert (=> mapNonEmpty!892 m!13841))

(declare-fun b_lambda!1469 () Bool)

(assert (= b_lambda!1467 (or (and b!19591 b_free!687) b_lambda!1469)))

(declare-fun b_lambda!1471 () Bool)

(assert (= b_lambda!1465 (or (and b!19591 b_free!687) b_lambda!1471)))

(check-sat (not b!19624) (not d!3619) (not b_next!687) (not b!19639) (not d!3625) (not b_lambda!1471) b_and!1353 (not b!19640) (not d!3627) (not b_lambda!1469) (not d!3629) (not b!19641) (not b!19625) (not mapNonEmpty!892) tp_is_empty!951 (not b!19623) (not b!19652))
(check-sat b_and!1353 (not b_next!687))
