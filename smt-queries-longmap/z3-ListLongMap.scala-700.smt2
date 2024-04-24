; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16708 () Bool)

(assert start!16708)

(declare-fun b!167534 () Bool)

(declare-fun b_free!4009 () Bool)

(declare-fun b_next!4009 () Bool)

(assert (=> b!167534 (= b_free!4009 (not b_next!4009))))

(declare-fun tp!14628 () Bool)

(declare-fun b_and!10437 () Bool)

(assert (=> b!167534 (= tp!14628 b_and!10437)))

(declare-fun e!110027 () Bool)

(declare-fun e!110024 () Bool)

(declare-datatypes ((V!4729 0))(
  ( (V!4730 (val!1950 Int)) )
))
(declare-datatypes ((ValueCell!1562 0))(
  ( (ValueCellFull!1562 (v!3816 V!4729)) (EmptyCell!1562) )
))
(declare-datatypes ((array!6705 0))(
  ( (array!6706 (arr!3188 (Array (_ BitVec 32) (_ BitVec 64))) (size!3476 (_ BitVec 32))) )
))
(declare-datatypes ((array!6707 0))(
  ( (array!6708 (arr!3189 (Array (_ BitVec 32) ValueCell!1562)) (size!3477 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2032 0))(
  ( (LongMapFixedSize!2033 (defaultEntry!3458 Int) (mask!8207 (_ BitVec 32)) (extraKeys!3199 (_ BitVec 32)) (zeroValue!3301 V!4729) (minValue!3301 V!4729) (_size!1065 (_ BitVec 32)) (_keys!5283 array!6705) (_values!3441 array!6707) (_vacant!1065 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2032)

(declare-fun tp_is_empty!3811 () Bool)

(declare-fun array_inv!2037 (array!6705) Bool)

(declare-fun array_inv!2038 (array!6707) Bool)

(assert (=> b!167534 (= e!110024 (and tp!14628 tp_is_empty!3811 (array_inv!2037 (_keys!5283 thiss!1248)) (array_inv!2038 (_values!3441 thiss!1248)) e!110027))))

(declare-fun b!167535 () Bool)

(declare-datatypes ((Unit!5139 0))(
  ( (Unit!5140) )
))
(declare-fun e!110028 () Unit!5139)

(declare-fun Unit!5141 () Unit!5139)

(assert (=> b!167535 (= e!110028 Unit!5141)))

(declare-fun lt!83776 () Unit!5139)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!103 (array!6705 array!6707 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 64) Int) Unit!5139)

(assert (=> b!167535 (= lt!83776 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!103 (_keys!5283 thiss!1248) (_values!3441 thiss!1248) (mask!8207 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) key!828 (defaultEntry!3458 thiss!1248)))))

(assert (=> b!167535 false))

(declare-fun res!79690 () Bool)

(declare-fun e!110031 () Bool)

(assert (=> start!16708 (=> (not res!79690) (not e!110031))))

(declare-fun valid!896 (LongMapFixedSize!2032) Bool)

(assert (=> start!16708 (= res!79690 (valid!896 thiss!1248))))

(assert (=> start!16708 e!110031))

(assert (=> start!16708 e!110024))

(assert (=> start!16708 true))

(assert (=> start!16708 tp_is_empty!3811))

(declare-fun mapNonEmpty!6435 () Bool)

(declare-fun mapRes!6435 () Bool)

(declare-fun tp!14627 () Bool)

(declare-fun e!110025 () Bool)

(assert (=> mapNonEmpty!6435 (= mapRes!6435 (and tp!14627 e!110025))))

(declare-fun mapRest!6435 () (Array (_ BitVec 32) ValueCell!1562))

(declare-fun mapKey!6435 () (_ BitVec 32))

(declare-fun mapValue!6435 () ValueCell!1562)

(assert (=> mapNonEmpty!6435 (= (arr!3189 (_values!3441 thiss!1248)) (store mapRest!6435 mapKey!6435 mapValue!6435))))

(declare-fun b!167536 () Bool)

(declare-datatypes ((SeekEntryResult!473 0))(
  ( (MissingZero!473 (index!4060 (_ BitVec 32))) (Found!473 (index!4061 (_ BitVec 32))) (Intermediate!473 (undefined!1285 Bool) (index!4062 (_ BitVec 32)) (x!18525 (_ BitVec 32))) (Undefined!473) (MissingVacant!473 (index!4063 (_ BitVec 32))) )
))
(declare-fun lt!83774 () SeekEntryResult!473)

(declare-fun e!110026 () Bool)

(assert (=> b!167536 (= e!110026 (= (select (arr!3188 (_keys!5283 thiss!1248)) (index!4061 lt!83774)) key!828))))

(declare-fun b!167537 () Bool)

(declare-fun res!79687 () Bool)

(declare-fun e!110033 () Bool)

(assert (=> b!167537 (=> res!79687 e!110033)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6705 (_ BitVec 32)) Bool)

(assert (=> b!167537 (= res!79687 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5283 thiss!1248) (mask!8207 thiss!1248))))))

(declare-fun b!167538 () Bool)

(declare-fun e!110030 () Bool)

(assert (=> b!167538 (= e!110030 tp_is_empty!3811)))

(declare-fun b!167539 () Bool)

(assert (=> b!167539 (= e!110027 (and e!110030 mapRes!6435))))

(declare-fun condMapEmpty!6435 () Bool)

(declare-fun mapDefault!6435 () ValueCell!1562)

(assert (=> b!167539 (= condMapEmpty!6435 (= (arr!3189 (_values!3441 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1562)) mapDefault!6435)))))

(declare-fun b!167540 () Bool)

(declare-fun e!110029 () Bool)

(assert (=> b!167540 (= e!110029 (not e!110033))))

(declare-fun res!79689 () Bool)

(assert (=> b!167540 (=> res!79689 e!110033)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167540 (= res!79689 (not (validMask!0 (mask!8207 thiss!1248))))))

(declare-fun v!309 () V!4729)

(declare-datatypes ((tuple2!3100 0))(
  ( (tuple2!3101 (_1!1561 (_ BitVec 64)) (_2!1561 V!4729)) )
))
(declare-datatypes ((List!2115 0))(
  ( (Nil!2112) (Cons!2111 (h!2728 tuple2!3100) (t!6909 List!2115)) )
))
(declare-datatypes ((ListLongMap!2061 0))(
  ( (ListLongMap!2062 (toList!1046 List!2115)) )
))
(declare-fun lt!83775 () ListLongMap!2061)

(declare-fun +!214 (ListLongMap!2061 tuple2!3100) ListLongMap!2061)

(declare-fun getCurrentListMap!708 (array!6705 array!6707 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 32) Int) ListLongMap!2061)

(assert (=> b!167540 (= (+!214 lt!83775 (tuple2!3101 key!828 v!309)) (getCurrentListMap!708 (_keys!5283 thiss!1248) (array!6708 (store (arr!3189 (_values!3441 thiss!1248)) (index!4061 lt!83774) (ValueCellFull!1562 v!309)) (size!3477 (_values!3441 thiss!1248))) (mask!8207 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3458 thiss!1248)))))

(declare-fun lt!83773 () Unit!5139)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!72 (array!6705 array!6707 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 32) (_ BitVec 64) V!4729 Int) Unit!5139)

(assert (=> b!167540 (= lt!83773 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!72 (_keys!5283 thiss!1248) (_values!3441 thiss!1248) (mask!8207 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) (index!4061 lt!83774) key!828 v!309 (defaultEntry!3458 thiss!1248)))))

(declare-fun lt!83772 () Unit!5139)

(assert (=> b!167540 (= lt!83772 e!110028)))

(declare-fun c!30308 () Bool)

(declare-fun contains!1098 (ListLongMap!2061 (_ BitVec 64)) Bool)

(assert (=> b!167540 (= c!30308 (contains!1098 lt!83775 key!828))))

(assert (=> b!167540 (= lt!83775 (getCurrentListMap!708 (_keys!5283 thiss!1248) (_values!3441 thiss!1248) (mask!8207 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3458 thiss!1248)))))

(declare-fun b!167541 () Bool)

(declare-fun lt!83778 () Unit!5139)

(assert (=> b!167541 (= e!110028 lt!83778)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!109 (array!6705 array!6707 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 64) Int) Unit!5139)

(assert (=> b!167541 (= lt!83778 (lemmaInListMapThenSeekEntryOrOpenFindsIt!109 (_keys!5283 thiss!1248) (_values!3441 thiss!1248) (mask!8207 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) key!828 (defaultEntry!3458 thiss!1248)))))

(declare-fun res!79686 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167541 (= res!79686 (inRange!0 (index!4061 lt!83774) (mask!8207 thiss!1248)))))

(assert (=> b!167541 (=> (not res!79686) (not e!110026))))

(assert (=> b!167541 e!110026))

(declare-fun b!167542 () Bool)

(declare-fun res!79688 () Bool)

(assert (=> b!167542 (=> (not res!79688) (not e!110031))))

(assert (=> b!167542 (= res!79688 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167543 () Bool)

(assert (=> b!167543 (= e!110033 true)))

(declare-fun lt!83777 () Bool)

(declare-datatypes ((List!2116 0))(
  ( (Nil!2113) (Cons!2112 (h!2729 (_ BitVec 64)) (t!6910 List!2116)) )
))
(declare-fun arrayNoDuplicates!0 (array!6705 (_ BitVec 32) List!2116) Bool)

(assert (=> b!167543 (= lt!83777 (arrayNoDuplicates!0 (_keys!5283 thiss!1248) #b00000000000000000000000000000000 Nil!2113))))

(declare-fun mapIsEmpty!6435 () Bool)

(assert (=> mapIsEmpty!6435 mapRes!6435))

(declare-fun b!167544 () Bool)

(assert (=> b!167544 (= e!110025 tp_is_empty!3811)))

(declare-fun b!167545 () Bool)

(assert (=> b!167545 (= e!110031 e!110029)))

(declare-fun res!79691 () Bool)

(assert (=> b!167545 (=> (not res!79691) (not e!110029))))

(get-info :version)

(assert (=> b!167545 (= res!79691 (and (not ((_ is Undefined!473) lt!83774)) (not ((_ is MissingVacant!473) lt!83774)) (not ((_ is MissingZero!473) lt!83774)) ((_ is Found!473) lt!83774)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6705 (_ BitVec 32)) SeekEntryResult!473)

(assert (=> b!167545 (= lt!83774 (seekEntryOrOpen!0 key!828 (_keys!5283 thiss!1248) (mask!8207 thiss!1248)))))

(declare-fun b!167546 () Bool)

(declare-fun res!79692 () Bool)

(assert (=> b!167546 (=> res!79692 e!110033)))

(assert (=> b!167546 (= res!79692 (or (not (= (size!3477 (_values!3441 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8207 thiss!1248)))) (not (= (size!3476 (_keys!5283 thiss!1248)) (size!3477 (_values!3441 thiss!1248)))) (bvslt (mask!8207 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3199 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3199 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16708 res!79690) b!167542))

(assert (= (and b!167542 res!79688) b!167545))

(assert (= (and b!167545 res!79691) b!167540))

(assert (= (and b!167540 c!30308) b!167541))

(assert (= (and b!167540 (not c!30308)) b!167535))

(assert (= (and b!167541 res!79686) b!167536))

(assert (= (and b!167540 (not res!79689)) b!167546))

(assert (= (and b!167546 (not res!79692)) b!167537))

(assert (= (and b!167537 (not res!79687)) b!167543))

(assert (= (and b!167539 condMapEmpty!6435) mapIsEmpty!6435))

(assert (= (and b!167539 (not condMapEmpty!6435)) mapNonEmpty!6435))

(assert (= (and mapNonEmpty!6435 ((_ is ValueCellFull!1562) mapValue!6435)) b!167544))

(assert (= (and b!167539 ((_ is ValueCellFull!1562) mapDefault!6435)) b!167538))

(assert (= b!167534 b!167539))

(assert (= start!16708 b!167534))

(declare-fun m!196817 () Bool)

(assert (=> b!167543 m!196817))

(declare-fun m!196819 () Bool)

(assert (=> b!167541 m!196819))

(declare-fun m!196821 () Bool)

(assert (=> b!167541 m!196821))

(declare-fun m!196823 () Bool)

(assert (=> start!16708 m!196823))

(declare-fun m!196825 () Bool)

(assert (=> b!167537 m!196825))

(declare-fun m!196827 () Bool)

(assert (=> mapNonEmpty!6435 m!196827))

(declare-fun m!196829 () Bool)

(assert (=> b!167536 m!196829))

(declare-fun m!196831 () Bool)

(assert (=> b!167540 m!196831))

(declare-fun m!196833 () Bool)

(assert (=> b!167540 m!196833))

(declare-fun m!196835 () Bool)

(assert (=> b!167540 m!196835))

(declare-fun m!196837 () Bool)

(assert (=> b!167540 m!196837))

(declare-fun m!196839 () Bool)

(assert (=> b!167540 m!196839))

(declare-fun m!196841 () Bool)

(assert (=> b!167540 m!196841))

(declare-fun m!196843 () Bool)

(assert (=> b!167540 m!196843))

(declare-fun m!196845 () Bool)

(assert (=> b!167534 m!196845))

(declare-fun m!196847 () Bool)

(assert (=> b!167534 m!196847))

(declare-fun m!196849 () Bool)

(assert (=> b!167535 m!196849))

(declare-fun m!196851 () Bool)

(assert (=> b!167545 m!196851))

(check-sat (not b!167545) (not b!167541) (not b!167540) b_and!10437 tp_is_empty!3811 (not start!16708) (not b!167534) (not b!167543) (not b_next!4009) (not mapNonEmpty!6435) (not b!167537) (not b!167535))
(check-sat b_and!10437 (not b_next!4009))
