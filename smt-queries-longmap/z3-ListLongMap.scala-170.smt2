; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3258 () Bool)

(assert start!3258)

(declare-fun b!19938 () Bool)

(declare-fun b_free!699 () Bool)

(declare-fun b_next!699 () Bool)

(assert (=> b!19938 (= b_free!699 (not b_next!699))))

(declare-fun tp!3318 () Bool)

(declare-fun b_and!1367 () Bool)

(assert (=> b!19938 (= tp!3318 b_and!1367)))

(declare-fun b!19935 () Bool)

(declare-fun e!12969 () Bool)

(declare-fun e!12971 () Bool)

(declare-fun mapRes!910 () Bool)

(assert (=> b!19935 (= e!12969 (and e!12971 mapRes!910))))

(declare-fun condMapEmpty!910 () Bool)

(declare-datatypes ((V!1109 0))(
  ( (V!1110 (val!508 Int)) )
))
(declare-datatypes ((ValueCell!282 0))(
  ( (ValueCellFull!282 (v!1533 V!1109)) (EmptyCell!282) )
))
(declare-datatypes ((array!1147 0))(
  ( (array!1148 (arr!547 (Array (_ BitVec 32) ValueCell!282)) (size!640 (_ BitVec 32))) )
))
(declare-datatypes ((array!1149 0))(
  ( (array!1150 (arr!548 (Array (_ BitVec 32) (_ BitVec 64))) (size!641 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!150 0))(
  ( (LongMapFixedSize!151 (defaultEntry!1696 Int) (mask!4654 (_ BitVec 32)) (extraKeys!1604 (_ BitVec 32)) (zeroValue!1628 V!1109) (minValue!1628 V!1109) (_size!111 (_ BitVec 32)) (_keys!3122 array!1149) (_values!1690 array!1147) (_vacant!111 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!150 0))(
  ( (Cell!151 (v!1534 LongMapFixedSize!150)) )
))
(declare-datatypes ((LongMap!150 0))(
  ( (LongMap!151 (underlying!86 Cell!150)) )
))
(declare-fun thiss!938 () LongMap!150)

(declare-fun mapDefault!910 () ValueCell!282)

(assert (=> b!19935 (= condMapEmpty!910 (= (arr!547 (_values!1690 (v!1534 (underlying!86 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!282)) mapDefault!910)))))

(declare-fun mapNonEmpty!910 () Bool)

(declare-fun tp!3319 () Bool)

(declare-fun e!12967 () Bool)

(assert (=> mapNonEmpty!910 (= mapRes!910 (and tp!3319 e!12967))))

(declare-fun mapValue!910 () ValueCell!282)

(declare-fun mapKey!910 () (_ BitVec 32))

(declare-fun mapRest!910 () (Array (_ BitVec 32) ValueCell!282))

(assert (=> mapNonEmpty!910 (= (arr!547 (_values!1690 (v!1534 (underlying!86 thiss!938)))) (store mapRest!910 mapKey!910 mapValue!910))))

(declare-fun b!19936 () Bool)

(declare-fun e!12965 () Bool)

(declare-fun e!12970 () Bool)

(assert (=> b!19936 (= e!12965 e!12970)))

(declare-fun res!13345 () Bool)

(assert (=> b!19936 (=> (not res!13345) (not e!12970))))

(assert (=> b!19936 (= res!13345 (and (= (bvand (extraKeys!1604 (v!1534 (underlying!86 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1604 (v!1534 (underlying!86 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!5685 () LongMapFixedSize!150)

(declare-fun getNewLongMapFixedSize!15 ((_ BitVec 32) Int) LongMapFixedSize!150)

(declare-fun computeNewMask!11 (LongMap!150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19936 (= lt!5685 (getNewLongMapFixedSize!15 (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) (defaultEntry!1696 (v!1534 (underlying!86 thiss!938)))))))

(declare-fun b!19937 () Bool)

(declare-fun tp_is_empty!963 () Bool)

(assert (=> b!19937 (= e!12967 tp_is_empty!963)))

(declare-fun mapIsEmpty!910 () Bool)

(assert (=> mapIsEmpty!910 mapRes!910))

(declare-fun e!12964 () Bool)

(declare-fun array_inv!371 (array!1149) Bool)

(declare-fun array_inv!372 (array!1147) Bool)

(assert (=> b!19938 (= e!12964 (and tp!3318 tp_is_empty!963 (array_inv!371 (_keys!3122 (v!1534 (underlying!86 thiss!938)))) (array_inv!372 (_values!1690 (v!1534 (underlying!86 thiss!938)))) e!12969))))

(declare-fun b!19939 () Bool)

(declare-fun e!12968 () Bool)

(declare-fun e!12966 () Bool)

(assert (=> b!19939 (= e!12968 e!12966)))

(declare-fun b!19940 () Bool)

(declare-fun valid!72 (LongMapFixedSize!150) Bool)

(assert (=> b!19940 (= e!12970 (not (valid!72 lt!5685)))))

(declare-fun res!13344 () Bool)

(assert (=> start!3258 (=> (not res!13344) (not e!12965))))

(declare-fun valid!73 (LongMap!150) Bool)

(assert (=> start!3258 (= res!13344 (valid!73 thiss!938))))

(assert (=> start!3258 e!12965))

(assert (=> start!3258 e!12968))

(declare-fun b!19941 () Bool)

(assert (=> b!19941 (= e!12971 tp_is_empty!963)))

(declare-fun b!19942 () Bool)

(assert (=> b!19942 (= e!12966 e!12964)))

(assert (= (and start!3258 res!13344) b!19936))

(assert (= (and b!19936 res!13345) b!19940))

(assert (= (and b!19935 condMapEmpty!910) mapIsEmpty!910))

(assert (= (and b!19935 (not condMapEmpty!910)) mapNonEmpty!910))

(get-info :version)

(assert (= (and mapNonEmpty!910 ((_ is ValueCellFull!282) mapValue!910)) b!19937))

(assert (= (and b!19935 ((_ is ValueCellFull!282) mapDefault!910)) b!19941))

(assert (= b!19938 b!19935))

(assert (= b!19942 b!19938))

(assert (= b!19939 b!19942))

(assert (= start!3258 b!19939))

(declare-fun m!14013 () Bool)

(assert (=> b!19936 m!14013))

(assert (=> b!19936 m!14013))

(declare-fun m!14015 () Bool)

(assert (=> b!19936 m!14015))

(declare-fun m!14017 () Bool)

(assert (=> b!19938 m!14017))

(declare-fun m!14019 () Bool)

(assert (=> b!19938 m!14019))

(declare-fun m!14021 () Bool)

(assert (=> mapNonEmpty!910 m!14021))

(declare-fun m!14023 () Bool)

(assert (=> b!19940 m!14023))

(declare-fun m!14025 () Bool)

(assert (=> start!3258 m!14025))

(check-sat (not b!19938) (not b!19936) b_and!1367 tp_is_empty!963 (not start!3258) (not mapNonEmpty!910) (not b!19940) (not b_next!699))
(check-sat b_and!1367 (not b_next!699))
(get-model)

(declare-fun d!3649 () Bool)

(assert (=> d!3649 (= (array_inv!371 (_keys!3122 (v!1534 (underlying!86 thiss!938)))) (bvsge (size!641 (_keys!3122 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19938 d!3649))

(declare-fun d!3651 () Bool)

(assert (=> d!3651 (= (array_inv!372 (_values!1690 (v!1534 (underlying!86 thiss!938)))) (bvsge (size!640 (_values!1690 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19938 d!3651))

(declare-fun b!19979 () Bool)

(declare-fun res!13356 () Bool)

(declare-fun e!13005 () Bool)

(assert (=> b!19979 (=> (not res!13356) (not e!13005))))

(declare-fun lt!5738 () LongMapFixedSize!150)

(assert (=> b!19979 (= res!13356 (= (mask!4654 lt!5738) (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938))))))))

(declare-fun d!3653 () Bool)

(assert (=> d!3653 e!13005))

(declare-fun res!13357 () Bool)

(assert (=> d!3653 (=> (not res!13357) (not e!13005))))

(assert (=> d!3653 (= res!13357 (valid!72 lt!5738))))

(declare-fun lt!5748 () LongMapFixedSize!150)

(assert (=> d!3653 (= lt!5738 lt!5748)))

(declare-datatypes ((Unit!405 0))(
  ( (Unit!406) )
))
(declare-fun lt!5755 () Unit!405)

(declare-fun e!13007 () Unit!405)

(assert (=> d!3653 (= lt!5755 e!13007)))

(declare-fun c!2142 () Bool)

(declare-datatypes ((tuple2!830 0))(
  ( (tuple2!831 (_1!418 (_ BitVec 64)) (_2!418 V!1109)) )
))
(declare-datatypes ((List!551 0))(
  ( (Nil!548) (Cons!547 (h!1113 tuple2!830) (t!3200 List!551)) )
))
(declare-datatypes ((ListLongMap!549 0))(
  ( (ListLongMap!550 (toList!290 List!551)) )
))
(declare-fun map!378 (LongMapFixedSize!150) ListLongMap!549)

(assert (=> d!3653 (= c!2142 (not (= (map!378 lt!5748) (ListLongMap!550 Nil!548))))))

(declare-fun lt!5737 () Unit!405)

(declare-fun lt!5751 () Unit!405)

(assert (=> d!3653 (= lt!5737 lt!5751)))

(declare-fun lt!5745 () array!1149)

(declare-fun lt!5744 () (_ BitVec 32))

(declare-datatypes ((List!552 0))(
  ( (Nil!549) (Cons!548 (h!1114 (_ BitVec 64)) (t!3201 List!552)) )
))
(declare-fun lt!5754 () List!552)

(declare-fun arrayNoDuplicates!0 (array!1149 (_ BitVec 32) List!552) Bool)

(assert (=> d!3653 (arrayNoDuplicates!0 lt!5745 lt!5744 lt!5754)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1149 (_ BitVec 32) (_ BitVec 32) List!552) Unit!405)

(assert (=> d!3653 (= lt!5751 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5745 lt!5744 (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001) lt!5754))))

(assert (=> d!3653 (= lt!5754 Nil!549)))

(assert (=> d!3653 (= lt!5744 #b00000000000000000000000000000000)))

(assert (=> d!3653 (= lt!5745 (array!1150 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5740 () Unit!405)

(declare-fun lt!5752 () Unit!405)

(assert (=> d!3653 (= lt!5740 lt!5752)))

(declare-fun lt!5742 () (_ BitVec 32))

(declare-fun lt!5743 () array!1149)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1149 (_ BitVec 32)) Bool)

(assert (=> d!3653 (arrayForallSeekEntryOrOpenFound!0 lt!5742 lt!5743 (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1149 (_ BitVec 32) (_ BitVec 32)) Unit!405)

(assert (=> d!3653 (= lt!5752 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5743 (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) lt!5742))))

(assert (=> d!3653 (= lt!5742 #b00000000000000000000000000000000)))

(assert (=> d!3653 (= lt!5743 (array!1150 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5739 () Unit!405)

(declare-fun lt!5750 () Unit!405)

(assert (=> d!3653 (= lt!5739 lt!5750)))

(declare-fun lt!5736 () array!1149)

(declare-fun lt!5746 () (_ BitVec 32))

(declare-fun lt!5749 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1149 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3653 (= (arrayCountValidKeys!0 lt!5736 lt!5746 lt!5749) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1149 (_ BitVec 32) (_ BitVec 32)) Unit!405)

(assert (=> d!3653 (= lt!5750 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5736 lt!5746 lt!5749))))

(assert (=> d!3653 (= lt!5749 (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3653 (= lt!5746 #b00000000000000000000000000000000)))

(assert (=> d!3653 (= lt!5736 (array!1150 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!136 (Int (_ BitVec 64)) V!1109)

(assert (=> d!3653 (= lt!5748 (LongMapFixedSize!151 (defaultEntry!1696 (v!1534 (underlying!86 thiss!938))) (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!136 (defaultEntry!1696 (v!1534 (underlying!86 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!136 (defaultEntry!1696 (v!1534 (underlying!86 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1150 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001)) (array!1148 ((as const (Array (_ BitVec 32) ValueCell!282)) EmptyCell!282) (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3653 (validMask!0 (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))))))

(assert (=> d!3653 (= (getNewLongMapFixedSize!15 (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) (defaultEntry!1696 (v!1534 (underlying!86 thiss!938)))) lt!5738)))

(declare-fun b!19980 () Bool)

(declare-fun Unit!407 () Unit!405)

(assert (=> b!19980 (= e!13007 Unit!407)))

(declare-fun lt!5753 () tuple2!830)

(declare-fun head!822 (List!551) tuple2!830)

(assert (=> b!19980 (= lt!5753 (head!822 (toList!290 (map!378 lt!5748))))))

(declare-fun lt!5747 () array!1149)

(assert (=> b!19980 (= lt!5747 (array!1150 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5756 () (_ BitVec 32))

(assert (=> b!19980 (= lt!5756 #b00000000000000000000000000000000)))

(declare-fun lt!5741 () Unit!405)

(declare-fun lemmaKeyInListMapIsInArray!83 (array!1149 array!1147 (_ BitVec 32) (_ BitVec 32) V!1109 V!1109 (_ BitVec 64) Int) Unit!405)

(assert (=> b!19980 (= lt!5741 (lemmaKeyInListMapIsInArray!83 lt!5747 (array!1148 ((as const (Array (_ BitVec 32) ValueCell!282)) EmptyCell!282) (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) lt!5756 (dynLambda!136 (defaultEntry!1696 (v!1534 (underlying!86 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!136 (defaultEntry!1696 (v!1534 (underlying!86 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!418 lt!5753) (defaultEntry!1696 (v!1534 (underlying!86 thiss!938)))))))

(declare-fun c!2141 () Bool)

(assert (=> b!19980 (= c!2141 (and (not (= (_1!418 lt!5753) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!418 lt!5753) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!13006 () Bool)

(assert (=> b!19980 e!13006))

(declare-fun lt!5735 () Unit!405)

(assert (=> b!19980 (= lt!5735 lt!5741)))

(declare-fun lt!5757 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1149 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19980 (= lt!5757 (arrayScanForKey!0 (array!1150 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) #b00000000000000000000000000000001)) (_1!418 lt!5753) #b00000000000000000000000000000000))))

(assert (=> b!19980 false))

(declare-fun b!19981 () Bool)

(declare-fun Unit!408 () Unit!405)

(assert (=> b!19981 (= e!13007 Unit!408)))

(declare-fun b!19982 () Bool)

(assert (=> b!19982 (= e!13005 (= (map!378 lt!5738) (ListLongMap!550 Nil!548)))))

(declare-fun b!19983 () Bool)

(declare-fun arrayContainsKey!0 (array!1149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19983 (= e!13006 (arrayContainsKey!0 lt!5747 (_1!418 lt!5753) #b00000000000000000000000000000000))))

(declare-fun b!19984 () Bool)

(assert (=> b!19984 (= e!13006 (ite (= (_1!418 lt!5753) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5756 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5756 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!3653 c!2142) b!19980))

(assert (= (and d!3653 (not c!2142)) b!19981))

(assert (= (and b!19980 c!2141) b!19983))

(assert (= (and b!19980 (not c!2141)) b!19984))

(assert (= (and d!3653 res!13357) b!19979))

(assert (= (and b!19979 res!13356) b!19982))

(declare-fun b_lambda!1481 () Bool)

(assert (=> (not b_lambda!1481) (not d!3653)))

(declare-fun t!3199 () Bool)

(declare-fun tb!635 () Bool)

(assert (=> (and b!19938 (= (defaultEntry!1696 (v!1534 (underlying!86 thiss!938))) (defaultEntry!1696 (v!1534 (underlying!86 thiss!938)))) t!3199) tb!635))

(declare-fun result!1039 () Bool)

(assert (=> tb!635 (= result!1039 tp_is_empty!963)))

(assert (=> d!3653 t!3199))

(declare-fun b_and!1371 () Bool)

(assert (= b_and!1367 (and (=> t!3199 result!1039) b_and!1371)))

(declare-fun b_lambda!1483 () Bool)

(assert (=> (not b_lambda!1483) (not b!19980)))

(assert (=> b!19980 t!3199))

(declare-fun b_and!1373 () Bool)

(assert (= b_and!1371 (and (=> t!3199 result!1039) b_and!1373)))

(assert (=> d!3653 m!14013))

(declare-fun m!14041 () Bool)

(assert (=> d!3653 m!14041))

(declare-fun m!14043 () Bool)

(assert (=> d!3653 m!14043))

(declare-fun m!14045 () Bool)

(assert (=> d!3653 m!14045))

(declare-fun m!14047 () Bool)

(assert (=> d!3653 m!14047))

(assert (=> d!3653 m!14013))

(declare-fun m!14049 () Bool)

(assert (=> d!3653 m!14049))

(declare-fun m!14051 () Bool)

(assert (=> d!3653 m!14051))

(assert (=> d!3653 m!14013))

(declare-fun m!14053 () Bool)

(assert (=> d!3653 m!14053))

(declare-fun m!14055 () Bool)

(assert (=> d!3653 m!14055))

(declare-fun m!14057 () Bool)

(assert (=> d!3653 m!14057))

(declare-fun m!14059 () Bool)

(assert (=> d!3653 m!14059))

(assert (=> b!19980 m!14057))

(declare-fun m!14061 () Bool)

(assert (=> b!19980 m!14061))

(assert (=> b!19980 m!14013))

(assert (=> b!19980 m!14057))

(assert (=> b!19980 m!14057))

(declare-fun m!14063 () Bool)

(assert (=> b!19980 m!14063))

(declare-fun m!14065 () Bool)

(assert (=> b!19980 m!14065))

(assert (=> b!19980 m!14051))

(declare-fun m!14067 () Bool)

(assert (=> b!19982 m!14067))

(declare-fun m!14069 () Bool)

(assert (=> b!19983 m!14069))

(assert (=> b!19936 d!3653))

(declare-fun d!3655 () Bool)

(declare-fun e!13013 () Bool)

(assert (=> d!3655 e!13013))

(declare-fun res!13360 () Bool)

(assert (=> d!3655 (=> (not res!13360) (not e!13013))))

(declare-fun lt!5763 () (_ BitVec 32))

(assert (=> d!3655 (= res!13360 (validMask!0 lt!5763))))

(declare-datatypes ((tuple2!832 0))(
  ( (tuple2!833 (_1!419 Unit!405) (_2!419 (_ BitVec 32))) )
))
(declare-fun e!13012 () tuple2!832)

(assert (=> d!3655 (= lt!5763 (_2!419 e!13012))))

(declare-fun c!2145 () Bool)

(declare-fun lt!5762 () tuple2!832)

(assert (=> d!3655 (= c!2145 (and (bvsgt (_2!419 lt!5762) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!111 (v!1534 (underlying!86 thiss!938)))) (_2!419 lt!5762)) (bvsge (bvadd (bvand (bvashr (_2!419 lt!5762) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!111 (v!1534 (underlying!86 thiss!938))))))))

(declare-fun Unit!409 () Unit!405)

(declare-fun Unit!410 () Unit!405)

(assert (=> d!3655 (= lt!5762 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!111 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))))) (mask!4654 (v!1534 (underlying!86 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!111 (v!1534 (underlying!86 thiss!938)))) (mask!4654 (v!1534 (underlying!86 thiss!938))))) (tuple2!833 Unit!409 (bvand (bvadd (bvshl (mask!4654 (v!1534 (underlying!86 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!833 Unit!410 (mask!4654 (v!1534 (underlying!86 thiss!938))))))))

(assert (=> d!3655 (validMask!0 (mask!4654 (v!1534 (underlying!86 thiss!938))))))

(assert (=> d!3655 (= (computeNewMask!11 thiss!938 (mask!4654 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (_size!111 (v!1534 (underlying!86 thiss!938)))) lt!5763)))

(declare-fun b!19993 () Bool)

(declare-fun computeNewMaskWhile!6 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!832)

(assert (=> b!19993 (= e!13012 (computeNewMaskWhile!6 (_size!111 (v!1534 (underlying!86 thiss!938))) (_vacant!111 (v!1534 (underlying!86 thiss!938))) (mask!4654 (v!1534 (underlying!86 thiss!938))) (_2!419 lt!5762)))))

(declare-fun b!19994 () Bool)

(declare-fun Unit!411 () Unit!405)

(assert (=> b!19994 (= e!13012 (tuple2!833 Unit!411 (_2!419 lt!5762)))))

(declare-fun b!19995 () Bool)

(assert (=> b!19995 (= e!13013 (bvsle (_size!111 (v!1534 (underlying!86 thiss!938))) (bvadd lt!5763 #b00000000000000000000000000000001)))))

(assert (= (and d!3655 c!2145) b!19993))

(assert (= (and d!3655 (not c!2145)) b!19994))

(assert (= (and d!3655 res!13360) b!19995))

(declare-fun m!14071 () Bool)

(assert (=> d!3655 m!14071))

(declare-fun m!14073 () Bool)

(assert (=> d!3655 m!14073))

(declare-fun m!14075 () Bool)

(assert (=> b!19993 m!14075))

(assert (=> b!19936 d!3655))

(declare-fun d!3657 () Bool)

(assert (=> d!3657 (= (valid!73 thiss!938) (valid!72 (v!1534 (underlying!86 thiss!938))))))

(declare-fun bs!886 () Bool)

(assert (= bs!886 d!3657))

(declare-fun m!14077 () Bool)

(assert (=> bs!886 m!14077))

(assert (=> start!3258 d!3657))

(declare-fun d!3659 () Bool)

(declare-fun res!13367 () Bool)

(declare-fun e!13016 () Bool)

(assert (=> d!3659 (=> (not res!13367) (not e!13016))))

(declare-fun simpleValid!15 (LongMapFixedSize!150) Bool)

(assert (=> d!3659 (= res!13367 (simpleValid!15 lt!5685))))

(assert (=> d!3659 (= (valid!72 lt!5685) e!13016)))

(declare-fun b!20002 () Bool)

(declare-fun res!13368 () Bool)

(assert (=> b!20002 (=> (not res!13368) (not e!13016))))

(assert (=> b!20002 (= res!13368 (= (arrayCountValidKeys!0 (_keys!3122 lt!5685) #b00000000000000000000000000000000 (size!641 (_keys!3122 lt!5685))) (_size!111 lt!5685)))))

(declare-fun b!20003 () Bool)

(declare-fun res!13369 () Bool)

(assert (=> b!20003 (=> (not res!13369) (not e!13016))))

(assert (=> b!20003 (= res!13369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3122 lt!5685) (mask!4654 lt!5685)))))

(declare-fun b!20004 () Bool)

(assert (=> b!20004 (= e!13016 (arrayNoDuplicates!0 (_keys!3122 lt!5685) #b00000000000000000000000000000000 Nil!549))))

(assert (= (and d!3659 res!13367) b!20002))

(assert (= (and b!20002 res!13368) b!20003))

(assert (= (and b!20003 res!13369) b!20004))

(declare-fun m!14079 () Bool)

(assert (=> d!3659 m!14079))

(declare-fun m!14081 () Bool)

(assert (=> b!20002 m!14081))

(declare-fun m!14083 () Bool)

(assert (=> b!20003 m!14083))

(declare-fun m!14085 () Bool)

(assert (=> b!20004 m!14085))

(assert (=> b!19940 d!3659))

(declare-fun condMapEmpty!916 () Bool)

(declare-fun mapDefault!916 () ValueCell!282)

(assert (=> mapNonEmpty!910 (= condMapEmpty!916 (= mapRest!910 ((as const (Array (_ BitVec 32) ValueCell!282)) mapDefault!916)))))

(declare-fun e!13021 () Bool)

(declare-fun mapRes!916 () Bool)

(assert (=> mapNonEmpty!910 (= tp!3319 (and e!13021 mapRes!916))))

(declare-fun mapIsEmpty!916 () Bool)

(assert (=> mapIsEmpty!916 mapRes!916))

(declare-fun mapNonEmpty!916 () Bool)

(declare-fun tp!3328 () Bool)

(declare-fun e!13022 () Bool)

(assert (=> mapNonEmpty!916 (= mapRes!916 (and tp!3328 e!13022))))

(declare-fun mapRest!916 () (Array (_ BitVec 32) ValueCell!282))

(declare-fun mapValue!916 () ValueCell!282)

(declare-fun mapKey!916 () (_ BitVec 32))

(assert (=> mapNonEmpty!916 (= mapRest!910 (store mapRest!916 mapKey!916 mapValue!916))))

(declare-fun b!20012 () Bool)

(assert (=> b!20012 (= e!13021 tp_is_empty!963)))

(declare-fun b!20011 () Bool)

(assert (=> b!20011 (= e!13022 tp_is_empty!963)))

(assert (= (and mapNonEmpty!910 condMapEmpty!916) mapIsEmpty!916))

(assert (= (and mapNonEmpty!910 (not condMapEmpty!916)) mapNonEmpty!916))

(assert (= (and mapNonEmpty!916 ((_ is ValueCellFull!282) mapValue!916)) b!20011))

(assert (= (and mapNonEmpty!910 ((_ is ValueCellFull!282) mapDefault!916)) b!20012))

(declare-fun m!14087 () Bool)

(assert (=> mapNonEmpty!916 m!14087))

(declare-fun b_lambda!1485 () Bool)

(assert (= b_lambda!1481 (or (and b!19938 b_free!699) b_lambda!1485)))

(declare-fun b_lambda!1487 () Bool)

(assert (= b_lambda!1483 (or (and b!19938 b_free!699) b_lambda!1487)))

(check-sat (not d!3659) (not d!3657) (not b!20002) tp_is_empty!963 b_and!1373 (not b!20003) (not d!3653) (not b_next!699) (not d!3655) (not b_lambda!1487) (not b!19983) (not b!19982) (not b!19980) (not b!20004) (not b!19993) (not b_lambda!1485) (not mapNonEmpty!916))
(check-sat b_and!1373 (not b_next!699))
