; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3270 () Bool)

(assert start!3270)

(declare-fun b!19999 () Bool)

(declare-fun b_free!703 () Bool)

(declare-fun b_next!703 () Bool)

(assert (=> b!19999 (= b_free!703 (not b_next!703))))

(declare-fun tp!3334 () Bool)

(declare-fun b_and!1369 () Bool)

(assert (=> b!19999 (= tp!3334 b_and!1369)))

(declare-fun e!13016 () Bool)

(declare-datatypes ((V!1115 0))(
  ( (V!1116 (val!510 Int)) )
))
(declare-datatypes ((ValueCell!284 0))(
  ( (ValueCellFull!284 (v!1537 V!1115)) (EmptyCell!284) )
))
(declare-datatypes ((array!1139 0))(
  ( (array!1140 (arr!542 (Array (_ BitVec 32) ValueCell!284)) (size!635 (_ BitVec 32))) )
))
(declare-datatypes ((array!1141 0))(
  ( (array!1142 (arr!543 (Array (_ BitVec 32) (_ BitVec 64))) (size!636 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!154 0))(
  ( (LongMapFixedSize!155 (defaultEntry!1699 Int) (mask!4659 (_ BitVec 32)) (extraKeys!1606 (_ BitVec 32)) (zeroValue!1630 V!1115) (minValue!1630 V!1115) (_size!114 (_ BitVec 32)) (_keys!3124 array!1141) (_values!1692 array!1139) (_vacant!114 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!154 0))(
  ( (Cell!155 (v!1538 LongMapFixedSize!154)) )
))
(declare-datatypes ((LongMap!154 0))(
  ( (LongMap!155 (underlying!88 Cell!154)) )
))
(declare-fun thiss!938 () LongMap!154)

(declare-fun tp_is_empty!967 () Bool)

(declare-fun e!13022 () Bool)

(declare-fun array_inv!383 (array!1141) Bool)

(declare-fun array_inv!384 (array!1139) Bool)

(assert (=> b!19999 (= e!13022 (and tp!3334 tp_is_empty!967 (array_inv!383 (_keys!3124 (v!1538 (underlying!88 thiss!938)))) (array_inv!384 (_values!1692 (v!1538 (underlying!88 thiss!938)))) e!13016))))

(declare-fun mapNonEmpty!919 () Bool)

(declare-fun mapRes!919 () Bool)

(declare-fun tp!3333 () Bool)

(declare-fun e!13023 () Bool)

(assert (=> mapNonEmpty!919 (= mapRes!919 (and tp!3333 e!13023))))

(declare-fun mapRest!919 () (Array (_ BitVec 32) ValueCell!284))

(declare-fun mapKey!919 () (_ BitVec 32))

(declare-fun mapValue!919 () ValueCell!284)

(assert (=> mapNonEmpty!919 (= (arr!542 (_values!1692 (v!1538 (underlying!88 thiss!938)))) (store mapRest!919 mapKey!919 mapValue!919))))

(declare-fun mapIsEmpty!919 () Bool)

(assert (=> mapIsEmpty!919 mapRes!919))

(declare-fun b!20000 () Bool)

(assert (=> b!20000 (= e!13023 tp_is_empty!967)))

(declare-fun b!20001 () Bool)

(declare-fun e!13018 () Bool)

(declare-fun e!13021 () Bool)

(assert (=> b!20001 (= e!13018 e!13021)))

(declare-fun res!13352 () Bool)

(declare-fun e!13017 () Bool)

(assert (=> start!3270 (=> (not res!13352) (not e!13017))))

(declare-fun valid!87 (LongMap!154) Bool)

(assert (=> start!3270 (= res!13352 (valid!87 thiss!938))))

(assert (=> start!3270 e!13017))

(assert (=> start!3270 e!13018))

(declare-fun b!20002 () Bool)

(declare-fun e!13019 () Bool)

(assert (=> b!20002 (= e!13016 (and e!13019 mapRes!919))))

(declare-fun condMapEmpty!919 () Bool)

(declare-fun mapDefault!919 () ValueCell!284)

(assert (=> b!20002 (= condMapEmpty!919 (= (arr!542 (_values!1692 (v!1538 (underlying!88 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!284)) mapDefault!919)))))

(declare-fun b!20003 () Bool)

(assert (=> b!20003 (= e!13019 tp_is_empty!967)))

(declare-fun b!20004 () Bool)

(declare-fun e!13015 () Bool)

(assert (=> b!20004 (= e!13017 e!13015)))

(declare-fun res!13353 () Bool)

(assert (=> b!20004 (=> (not res!13353) (not e!13015))))

(assert (=> b!20004 (= res!13353 (and (= (bvand (extraKeys!1606 (v!1538 (underlying!88 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1606 (v!1538 (underlying!88 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!5766 () LongMapFixedSize!154)

(declare-fun getNewLongMapFixedSize!18 ((_ BitVec 32) Int) LongMapFixedSize!154)

(declare-fun computeNewMask!13 (LongMap!154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20004 (= lt!5766 (getNewLongMapFixedSize!18 (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) (defaultEntry!1699 (v!1538 (underlying!88 thiss!938)))))))

(declare-fun b!20005 () Bool)

(declare-fun valid!88 (LongMapFixedSize!154) Bool)

(assert (=> b!20005 (= e!13015 (not (valid!88 lt!5766)))))

(declare-fun b!20006 () Bool)

(assert (=> b!20006 (= e!13021 e!13022)))

(assert (= (and start!3270 res!13352) b!20004))

(assert (= (and b!20004 res!13353) b!20005))

(assert (= (and b!20002 condMapEmpty!919) mapIsEmpty!919))

(assert (= (and b!20002 (not condMapEmpty!919)) mapNonEmpty!919))

(get-info :version)

(assert (= (and mapNonEmpty!919 ((_ is ValueCellFull!284) mapValue!919)) b!20000))

(assert (= (and b!20002 ((_ is ValueCellFull!284) mapDefault!919)) b!20003))

(assert (= b!19999 b!20002))

(assert (= b!20006 b!19999))

(assert (= b!20001 b!20006))

(assert (= start!3270 b!20001))

(declare-fun m!14041 () Bool)

(assert (=> b!20004 m!14041))

(assert (=> b!20004 m!14041))

(declare-fun m!14043 () Bool)

(assert (=> b!20004 m!14043))

(declare-fun m!14045 () Bool)

(assert (=> b!20005 m!14045))

(declare-fun m!14047 () Bool)

(assert (=> start!3270 m!14047))

(declare-fun m!14049 () Bool)

(assert (=> mapNonEmpty!919 m!14049))

(declare-fun m!14051 () Bool)

(assert (=> b!19999 m!14051))

(declare-fun m!14053 () Bool)

(assert (=> b!19999 m!14053))

(check-sat (not mapNonEmpty!919) (not b_next!703) (not b!19999) tp_is_empty!967 b_and!1369 (not b!20005) (not start!3270) (not b!20004))
(check-sat b_and!1369 (not b_next!703))
(get-model)

(declare-fun d!3631 () Bool)

(declare-fun res!13372 () Bool)

(declare-fun e!13080 () Bool)

(assert (=> d!3631 (=> (not res!13372) (not e!13080))))

(declare-fun simpleValid!16 (LongMapFixedSize!154) Bool)

(assert (=> d!3631 (= res!13372 (simpleValid!16 lt!5766))))

(assert (=> d!3631 (= (valid!88 lt!5766) e!13080)))

(declare-fun b!20061 () Bool)

(declare-fun res!13373 () Bool)

(assert (=> b!20061 (=> (not res!13373) (not e!13080))))

(declare-fun arrayCountValidKeys!0 (array!1141 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20061 (= res!13373 (= (arrayCountValidKeys!0 (_keys!3124 lt!5766) #b00000000000000000000000000000000 (size!636 (_keys!3124 lt!5766))) (_size!114 lt!5766)))))

(declare-fun b!20062 () Bool)

(declare-fun res!13374 () Bool)

(assert (=> b!20062 (=> (not res!13374) (not e!13080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1141 (_ BitVec 32)) Bool)

(assert (=> b!20062 (= res!13374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3124 lt!5766) (mask!4659 lt!5766)))))

(declare-fun b!20063 () Bool)

(declare-datatypes ((List!550 0))(
  ( (Nil!547) (Cons!546 (h!1112 (_ BitVec 64)) (t!3195 List!550)) )
))
(declare-fun arrayNoDuplicates!0 (array!1141 (_ BitVec 32) List!550) Bool)

(assert (=> b!20063 (= e!13080 (arrayNoDuplicates!0 (_keys!3124 lt!5766) #b00000000000000000000000000000000 Nil!547))))

(assert (= (and d!3631 res!13372) b!20061))

(assert (= (and b!20061 res!13373) b!20062))

(assert (= (and b!20062 res!13374) b!20063))

(declare-fun m!14083 () Bool)

(assert (=> d!3631 m!14083))

(declare-fun m!14085 () Bool)

(assert (=> b!20061 m!14085))

(declare-fun m!14087 () Bool)

(assert (=> b!20062 m!14087))

(declare-fun m!14089 () Bool)

(assert (=> b!20063 m!14089))

(assert (=> b!20005 d!3631))

(declare-fun d!3633 () Bool)

(declare-fun e!13087 () Bool)

(assert (=> d!3633 e!13087))

(declare-fun res!13380 () Bool)

(assert (=> d!3633 (=> (not res!13380) (not e!13087))))

(declare-fun lt!5836 () LongMapFixedSize!154)

(assert (=> d!3633 (= res!13380 (valid!88 lt!5836))))

(declare-fun lt!5837 () LongMapFixedSize!154)

(assert (=> d!3633 (= lt!5836 lt!5837)))

(declare-datatypes ((Unit!422 0))(
  ( (Unit!423) )
))
(declare-fun lt!5838 () Unit!422)

(declare-fun e!13088 () Unit!422)

(assert (=> d!3633 (= lt!5838 e!13088)))

(declare-fun c!2147 () Bool)

(declare-datatypes ((tuple2!844 0))(
  ( (tuple2!845 (_1!425 (_ BitVec 64)) (_2!425 V!1115)) )
))
(declare-datatypes ((List!551 0))(
  ( (Nil!548) (Cons!547 (h!1113 tuple2!844) (t!3196 List!551)) )
))
(declare-datatypes ((ListLongMap!549 0))(
  ( (ListLongMap!550 (toList!290 List!551)) )
))
(declare-fun map!383 (LongMapFixedSize!154) ListLongMap!549)

(assert (=> d!3633 (= c!2147 (not (= (map!383 lt!5837) (ListLongMap!550 Nil!548))))))

(declare-fun lt!5831 () Unit!422)

(declare-fun lt!5824 () Unit!422)

(assert (=> d!3633 (= lt!5831 lt!5824)))

(declare-fun lt!5826 () array!1141)

(declare-fun lt!5839 () (_ BitVec 32))

(declare-fun lt!5821 () List!550)

(assert (=> d!3633 (arrayNoDuplicates!0 lt!5826 lt!5839 lt!5821)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1141 (_ BitVec 32) (_ BitVec 32) List!550) Unit!422)

(assert (=> d!3633 (= lt!5824 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5826 lt!5839 (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001) lt!5821))))

(assert (=> d!3633 (= lt!5821 Nil!547)))

(assert (=> d!3633 (= lt!5839 #b00000000000000000000000000000000)))

(assert (=> d!3633 (= lt!5826 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5833 () Unit!422)

(declare-fun lt!5820 () Unit!422)

(assert (=> d!3633 (= lt!5833 lt!5820)))

(declare-fun lt!5829 () (_ BitVec 32))

(declare-fun lt!5835 () array!1141)

(assert (=> d!3633 (arrayForallSeekEntryOrOpenFound!0 lt!5829 lt!5835 (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1141 (_ BitVec 32) (_ BitVec 32)) Unit!422)

(assert (=> d!3633 (= lt!5820 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5835 (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) lt!5829))))

(assert (=> d!3633 (= lt!5829 #b00000000000000000000000000000000)))

(assert (=> d!3633 (= lt!5835 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5841 () Unit!422)

(declare-fun lt!5827 () Unit!422)

(assert (=> d!3633 (= lt!5841 lt!5827)))

(declare-fun lt!5840 () array!1141)

(declare-fun lt!5822 () (_ BitVec 32))

(declare-fun lt!5834 () (_ BitVec 32))

(assert (=> d!3633 (= (arrayCountValidKeys!0 lt!5840 lt!5822 lt!5834) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1141 (_ BitVec 32) (_ BitVec 32)) Unit!422)

(assert (=> d!3633 (= lt!5827 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5840 lt!5822 lt!5834))))

(assert (=> d!3633 (= lt!5834 (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3633 (= lt!5822 #b00000000000000000000000000000000)))

(assert (=> d!3633 (= lt!5840 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!133 (Int (_ BitVec 64)) V!1115)

(assert (=> d!3633 (= lt!5837 (LongMapFixedSize!155 (defaultEntry!1699 (v!1538 (underlying!88 thiss!938))) (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!133 (defaultEntry!1699 (v!1538 (underlying!88 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!133 (defaultEntry!1699 (v!1538 (underlying!88 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)) (array!1140 ((as const (Array (_ BitVec 32) ValueCell!284)) EmptyCell!284) (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3633 (validMask!0 (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))))))

(assert (=> d!3633 (= (getNewLongMapFixedSize!18 (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) (defaultEntry!1699 (v!1538 (underlying!88 thiss!938)))) lt!5836)))

(declare-fun b!20076 () Bool)

(declare-fun Unit!424 () Unit!422)

(assert (=> b!20076 (= e!13088 Unit!424)))

(declare-fun b!20077 () Bool)

(declare-fun Unit!425 () Unit!422)

(assert (=> b!20077 (= e!13088 Unit!425)))

(declare-fun lt!5828 () tuple2!844)

(declare-fun head!821 (List!551) tuple2!844)

(assert (=> b!20077 (= lt!5828 (head!821 (toList!290 (map!383 lt!5837))))))

(declare-fun lt!5832 () array!1141)

(assert (=> b!20077 (= lt!5832 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5823 () (_ BitVec 32))

(assert (=> b!20077 (= lt!5823 #b00000000000000000000000000000000)))

(declare-fun lt!5830 () Unit!422)

(declare-fun lemmaKeyInListMapIsInArray!90 (array!1141 array!1139 (_ BitVec 32) (_ BitVec 32) V!1115 V!1115 (_ BitVec 64) Int) Unit!422)

(assert (=> b!20077 (= lt!5830 (lemmaKeyInListMapIsInArray!90 lt!5832 (array!1140 ((as const (Array (_ BitVec 32) ValueCell!284)) EmptyCell!284) (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) lt!5823 (dynLambda!133 (defaultEntry!1699 (v!1538 (underlying!88 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!133 (defaultEntry!1699 (v!1538 (underlying!88 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!425 lt!5828) (defaultEntry!1699 (v!1538 (underlying!88 thiss!938)))))))

(declare-fun c!2146 () Bool)

(assert (=> b!20077 (= c!2146 (and (not (= (_1!425 lt!5828) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!425 lt!5828) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!13089 () Bool)

(assert (=> b!20077 e!13089))

(declare-fun lt!5825 () Unit!422)

(assert (=> b!20077 (= lt!5825 lt!5830)))

(declare-fun lt!5819 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1141 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20077 (= lt!5819 (arrayScanForKey!0 (array!1142 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000001)) (_1!425 lt!5828) #b00000000000000000000000000000000))))

(assert (=> b!20077 false))

(declare-fun b!20078 () Bool)

(assert (=> b!20078 (= e!13087 (= (map!383 lt!5836) (ListLongMap!550 Nil!548)))))

(declare-fun b!20079 () Bool)

(assert (=> b!20079 (= e!13089 (ite (= (_1!425 lt!5828) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5823 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5823 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!20080 () Bool)

(declare-fun res!13379 () Bool)

(assert (=> b!20080 (=> (not res!13379) (not e!13087))))

(assert (=> b!20080 (= res!13379 (= (mask!4659 lt!5836) (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938))))))))

(declare-fun b!20081 () Bool)

(declare-fun arrayContainsKey!0 (array!1141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!20081 (= e!13089 (arrayContainsKey!0 lt!5832 (_1!425 lt!5828) #b00000000000000000000000000000000))))

(assert (= (and d!3633 c!2147) b!20077))

(assert (= (and d!3633 (not c!2147)) b!20076))

(assert (= (and b!20077 c!2146) b!20081))

(assert (= (and b!20077 (not c!2146)) b!20079))

(assert (= (and d!3633 res!13380) b!20080))

(assert (= (and b!20080 res!13379) b!20078))

(declare-fun b_lambda!1477 () Bool)

(assert (=> (not b_lambda!1477) (not d!3633)))

(declare-fun t!3194 () Bool)

(declare-fun tb!631 () Bool)

(assert (=> (and b!19999 (= (defaultEntry!1699 (v!1538 (underlying!88 thiss!938))) (defaultEntry!1699 (v!1538 (underlying!88 thiss!938)))) t!3194) tb!631))

(declare-fun result!1039 () Bool)

(assert (=> tb!631 (= result!1039 tp_is_empty!967)))

(assert (=> d!3633 t!3194))

(declare-fun b_and!1375 () Bool)

(assert (= b_and!1369 (and (=> t!3194 result!1039) b_and!1375)))

(declare-fun b_lambda!1479 () Bool)

(assert (=> (not b_lambda!1479) (not b!20077)))

(assert (=> b!20077 t!3194))

(declare-fun b_and!1377 () Bool)

(assert (= b_and!1375 (and (=> t!3194 result!1039) b_and!1377)))

(assert (=> d!3633 m!14041))

(declare-fun m!14091 () Bool)

(assert (=> d!3633 m!14091))

(assert (=> d!3633 m!14041))

(declare-fun m!14093 () Bool)

(assert (=> d!3633 m!14093))

(declare-fun m!14095 () Bool)

(assert (=> d!3633 m!14095))

(declare-fun m!14097 () Bool)

(assert (=> d!3633 m!14097))

(declare-fun m!14099 () Bool)

(assert (=> d!3633 m!14099))

(declare-fun m!14101 () Bool)

(assert (=> d!3633 m!14101))

(assert (=> d!3633 m!14041))

(declare-fun m!14103 () Bool)

(assert (=> d!3633 m!14103))

(declare-fun m!14105 () Bool)

(assert (=> d!3633 m!14105))

(declare-fun m!14107 () Bool)

(assert (=> d!3633 m!14107))

(declare-fun m!14109 () Bool)

(assert (=> d!3633 m!14109))

(assert (=> b!20077 m!14095))

(declare-fun m!14111 () Bool)

(assert (=> b!20077 m!14111))

(assert (=> b!20077 m!14041))

(assert (=> b!20077 m!14097))

(assert (=> b!20077 m!14097))

(declare-fun m!14113 () Bool)

(assert (=> b!20077 m!14113))

(declare-fun m!14115 () Bool)

(assert (=> b!20077 m!14115))

(assert (=> b!20077 m!14097))

(declare-fun m!14117 () Bool)

(assert (=> b!20078 m!14117))

(declare-fun m!14119 () Bool)

(assert (=> b!20081 m!14119))

(assert (=> b!20004 d!3633))

(declare-fun d!3635 () Bool)

(declare-fun e!13094 () Bool)

(assert (=> d!3635 e!13094))

(declare-fun res!13383 () Bool)

(assert (=> d!3635 (=> (not res!13383) (not e!13094))))

(declare-fun lt!5847 () (_ BitVec 32))

(assert (=> d!3635 (= res!13383 (validMask!0 lt!5847))))

(declare-datatypes ((tuple2!846 0))(
  ( (tuple2!847 (_1!426 Unit!422) (_2!426 (_ BitVec 32))) )
))
(declare-fun e!13095 () tuple2!846)

(assert (=> d!3635 (= lt!5847 (_2!426 e!13095))))

(declare-fun c!2150 () Bool)

(declare-fun lt!5846 () tuple2!846)

(assert (=> d!3635 (= c!2150 (and (bvsgt (_2!426 lt!5846) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!114 (v!1538 (underlying!88 thiss!938)))) (_2!426 lt!5846)) (bvsge (bvadd (bvand (bvashr (_2!426 lt!5846) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!114 (v!1538 (underlying!88 thiss!938))))))))

(declare-fun Unit!426 () Unit!422)

(declare-fun Unit!427 () Unit!422)

(assert (=> d!3635 (= lt!5846 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!114 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))))) (mask!4659 (v!1538 (underlying!88 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!114 (v!1538 (underlying!88 thiss!938)))) (mask!4659 (v!1538 (underlying!88 thiss!938))))) (tuple2!847 Unit!426 (bvand (bvadd (bvshl (mask!4659 (v!1538 (underlying!88 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!847 Unit!427 (mask!4659 (v!1538 (underlying!88 thiss!938))))))))

(assert (=> d!3635 (validMask!0 (mask!4659 (v!1538 (underlying!88 thiss!938))))))

(assert (=> d!3635 (= (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) lt!5847)))

(declare-fun b!20090 () Bool)

(declare-fun computeNewMaskWhile!7 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!846)

(assert (=> b!20090 (= e!13095 (computeNewMaskWhile!7 (_size!114 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (mask!4659 (v!1538 (underlying!88 thiss!938))) (_2!426 lt!5846)))))

(declare-fun b!20091 () Bool)

(declare-fun Unit!428 () Unit!422)

(assert (=> b!20091 (= e!13095 (tuple2!847 Unit!428 (_2!426 lt!5846)))))

(declare-fun b!20092 () Bool)

(assert (=> b!20092 (= e!13094 (bvsle (_size!114 (v!1538 (underlying!88 thiss!938))) (bvadd lt!5847 #b00000000000000000000000000000001)))))

(assert (= (and d!3635 c!2150) b!20090))

(assert (= (and d!3635 (not c!2150)) b!20091))

(assert (= (and d!3635 res!13383) b!20092))

(declare-fun m!14121 () Bool)

(assert (=> d!3635 m!14121))

(declare-fun m!14123 () Bool)

(assert (=> d!3635 m!14123))

(declare-fun m!14125 () Bool)

(assert (=> b!20090 m!14125))

(assert (=> b!20004 d!3635))

(declare-fun d!3637 () Bool)

(assert (=> d!3637 (= (valid!87 thiss!938) (valid!88 (v!1538 (underlying!88 thiss!938))))))

(declare-fun bs!888 () Bool)

(assert (= bs!888 d!3637))

(declare-fun m!14127 () Bool)

(assert (=> bs!888 m!14127))

(assert (=> start!3270 d!3637))

(declare-fun d!3639 () Bool)

(assert (=> d!3639 (= (array_inv!383 (_keys!3124 (v!1538 (underlying!88 thiss!938)))) (bvsge (size!636 (_keys!3124 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19999 d!3639))

(declare-fun d!3641 () Bool)

(assert (=> d!3641 (= (array_inv!384 (_values!1692 (v!1538 (underlying!88 thiss!938)))) (bvsge (size!635 (_values!1692 (v!1538 (underlying!88 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19999 d!3641))

(declare-fun mapNonEmpty!928 () Bool)

(declare-fun mapRes!928 () Bool)

(declare-fun tp!3349 () Bool)

(declare-fun e!13100 () Bool)

(assert (=> mapNonEmpty!928 (= mapRes!928 (and tp!3349 e!13100))))

(declare-fun mapValue!928 () ValueCell!284)

(declare-fun mapRest!928 () (Array (_ BitVec 32) ValueCell!284))

(declare-fun mapKey!928 () (_ BitVec 32))

(assert (=> mapNonEmpty!928 (= mapRest!919 (store mapRest!928 mapKey!928 mapValue!928))))

(declare-fun mapIsEmpty!928 () Bool)

(assert (=> mapIsEmpty!928 mapRes!928))

(declare-fun b!20100 () Bool)

(declare-fun e!13101 () Bool)

(assert (=> b!20100 (= e!13101 tp_is_empty!967)))

(declare-fun condMapEmpty!928 () Bool)

(declare-fun mapDefault!928 () ValueCell!284)

(assert (=> mapNonEmpty!919 (= condMapEmpty!928 (= mapRest!919 ((as const (Array (_ BitVec 32) ValueCell!284)) mapDefault!928)))))

(assert (=> mapNonEmpty!919 (= tp!3333 (and e!13101 mapRes!928))))

(declare-fun b!20099 () Bool)

(assert (=> b!20099 (= e!13100 tp_is_empty!967)))

(assert (= (and mapNonEmpty!919 condMapEmpty!928) mapIsEmpty!928))

(assert (= (and mapNonEmpty!919 (not condMapEmpty!928)) mapNonEmpty!928))

(assert (= (and mapNonEmpty!928 ((_ is ValueCellFull!284) mapValue!928)) b!20099))

(assert (= (and mapNonEmpty!919 ((_ is ValueCellFull!284) mapDefault!928)) b!20100))

(declare-fun m!14129 () Bool)

(assert (=> mapNonEmpty!928 m!14129))

(declare-fun b_lambda!1481 () Bool)

(assert (= b_lambda!1477 (or (and b!19999 b_free!703) b_lambda!1481)))

(declare-fun b_lambda!1483 () Bool)

(assert (= b_lambda!1479 (or (and b!19999 b_free!703) b_lambda!1483)))

(check-sat (not b_lambda!1483) (not b!20061) (not b_next!703) (not b!20063) (not d!3631) (not mapNonEmpty!928) (not b!20078) tp_is_empty!967 (not b_lambda!1481) (not b!20062) (not b!20077) (not d!3637) b_and!1377 (not b!20090) (not d!3635) (not b!20081) (not d!3633))
(check-sat b_and!1377 (not b_next!703))
