; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3252 () Bool)

(assert start!3252)

(declare-fun b!19883 () Bool)

(declare-fun b_free!697 () Bool)

(declare-fun b_next!697 () Bool)

(assert (=> b!19883 (= b_free!697 (not b_next!697))))

(declare-fun tp!3313 () Bool)

(declare-fun b_and!1359 () Bool)

(assert (=> b!19883 (= tp!3313 b_and!1359)))

(declare-fun b!19881 () Bool)

(declare-fun e!12910 () Bool)

(declare-fun e!12915 () Bool)

(declare-fun mapRes!907 () Bool)

(assert (=> b!19881 (= e!12910 (and e!12915 mapRes!907))))

(declare-fun condMapEmpty!907 () Bool)

(declare-datatypes ((V!1107 0))(
  ( (V!1108 (val!507 Int)) )
))
(declare-datatypes ((ValueCell!281 0))(
  ( (ValueCellFull!281 (v!1531 V!1107)) (EmptyCell!281) )
))
(declare-datatypes ((array!1125 0))(
  ( (array!1126 (arr!536 (Array (_ BitVec 32) ValueCell!281)) (size!629 (_ BitVec 32))) )
))
(declare-datatypes ((array!1127 0))(
  ( (array!1128 (arr!537 (Array (_ BitVec 32) (_ BitVec 64))) (size!630 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!148 0))(
  ( (LongMapFixedSize!149 (defaultEntry!1695 Int) (mask!4653 (_ BitVec 32)) (extraKeys!1603 (_ BitVec 32)) (zeroValue!1627 V!1107) (minValue!1627 V!1107) (_size!110 (_ BitVec 32)) (_keys!3121 array!1127) (_values!1689 array!1125) (_vacant!110 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!148 0))(
  ( (Cell!149 (v!1532 LongMapFixedSize!148)) )
))
(declare-datatypes ((LongMap!148 0))(
  ( (LongMap!149 (underlying!85 Cell!148)) )
))
(declare-fun thiss!938 () LongMap!148)

(declare-fun mapDefault!907 () ValueCell!281)

(assert (=> b!19881 (= condMapEmpty!907 (= (arr!536 (_values!1689 (v!1532 (underlying!85 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!281)) mapDefault!907)))))

(declare-fun mapIsEmpty!907 () Bool)

(assert (=> mapIsEmpty!907 mapRes!907))

(declare-fun b!19882 () Bool)

(declare-fun e!12914 () Bool)

(declare-fun tp_is_empty!961 () Bool)

(assert (=> b!19882 (= e!12914 tp_is_empty!961)))

(declare-fun e!12912 () Bool)

(declare-fun array_inv!381 (array!1127) Bool)

(declare-fun array_inv!382 (array!1125) Bool)

(assert (=> b!19883 (= e!12912 (and tp!3313 tp_is_empty!961 (array_inv!381 (_keys!3121 (v!1532 (underlying!85 thiss!938)))) (array_inv!382 (_values!1689 (v!1532 (underlying!85 thiss!938)))) e!12910))))

(declare-fun b!19884 () Bool)

(declare-fun e!12917 () Bool)

(declare-fun lt!5682 () LongMapFixedSize!148)

(declare-fun valid!85 (LongMapFixedSize!148) Bool)

(assert (=> b!19884 (= e!12917 (not (valid!85 lt!5682)))))

(declare-fun res!13317 () Bool)

(declare-fun e!12916 () Bool)

(assert (=> start!3252 (=> (not res!13317) (not e!12916))))

(declare-fun valid!86 (LongMap!148) Bool)

(assert (=> start!3252 (= res!13317 (valid!86 thiss!938))))

(assert (=> start!3252 e!12916))

(declare-fun e!12913 () Bool)

(assert (=> start!3252 e!12913))

(declare-fun b!19885 () Bool)

(assert (=> b!19885 (= e!12916 e!12917)))

(declare-fun res!13316 () Bool)

(assert (=> b!19885 (=> (not res!13316) (not e!12917))))

(assert (=> b!19885 (= res!13316 (and (= (bvand (extraKeys!1603 (v!1532 (underlying!85 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1603 (v!1532 (underlying!85 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun getNewLongMapFixedSize!16 ((_ BitVec 32) Int) LongMapFixedSize!148)

(declare-fun computeNewMask!11 (LongMap!148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19885 (= lt!5682 (getNewLongMapFixedSize!16 (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) (defaultEntry!1695 (v!1532 (underlying!85 thiss!938)))))))

(declare-fun b!19886 () Bool)

(declare-fun e!12918 () Bool)

(assert (=> b!19886 (= e!12913 e!12918)))

(declare-fun b!19887 () Bool)

(assert (=> b!19887 (= e!12915 tp_is_empty!961)))

(declare-fun mapNonEmpty!907 () Bool)

(declare-fun tp!3312 () Bool)

(assert (=> mapNonEmpty!907 (= mapRes!907 (and tp!3312 e!12914))))

(declare-fun mapValue!907 () ValueCell!281)

(declare-fun mapRest!907 () (Array (_ BitVec 32) ValueCell!281))

(declare-fun mapKey!907 () (_ BitVec 32))

(assert (=> mapNonEmpty!907 (= (arr!536 (_values!1689 (v!1532 (underlying!85 thiss!938)))) (store mapRest!907 mapKey!907 mapValue!907))))

(declare-fun b!19888 () Bool)

(assert (=> b!19888 (= e!12918 e!12912)))

(assert (= (and start!3252 res!13317) b!19885))

(assert (= (and b!19885 res!13316) b!19884))

(assert (= (and b!19881 condMapEmpty!907) mapIsEmpty!907))

(assert (= (and b!19881 (not condMapEmpty!907)) mapNonEmpty!907))

(get-info :version)

(assert (= (and mapNonEmpty!907 ((_ is ValueCellFull!281) mapValue!907)) b!19882))

(assert (= (and b!19881 ((_ is ValueCellFull!281) mapDefault!907)) b!19887))

(assert (= b!19883 b!19881))

(assert (= b!19888 b!19883))

(assert (= b!19886 b!19888))

(assert (= start!3252 b!19886))

(declare-fun m!13951 () Bool)

(assert (=> start!3252 m!13951))

(declare-fun m!13953 () Bool)

(assert (=> mapNonEmpty!907 m!13953))

(declare-fun m!13955 () Bool)

(assert (=> b!19885 m!13955))

(assert (=> b!19885 m!13955))

(declare-fun m!13957 () Bool)

(assert (=> b!19885 m!13957))

(declare-fun m!13959 () Bool)

(assert (=> b!19884 m!13959))

(declare-fun m!13961 () Bool)

(assert (=> b!19883 m!13961))

(declare-fun m!13963 () Bool)

(assert (=> b!19883 m!13963))

(check-sat b_and!1359 (not mapNonEmpty!907) tp_is_empty!961 (not b!19883) (not b_next!697) (not start!3252) (not b!19885) (not b!19884))
(check-sat b_and!1359 (not b_next!697))
(get-model)

(declare-fun d!3617 () Bool)

(declare-fun res!13336 () Bool)

(declare-fun e!12975 () Bool)

(assert (=> d!3617 (=> (not res!13336) (not e!12975))))

(declare-fun simpleValid!15 (LongMapFixedSize!148) Bool)

(assert (=> d!3617 (= res!13336 (simpleValid!15 lt!5682))))

(assert (=> d!3617 (= (valid!85 lt!5682) e!12975)))

(declare-fun b!19943 () Bool)

(declare-fun res!13337 () Bool)

(assert (=> b!19943 (=> (not res!13337) (not e!12975))))

(declare-fun arrayCountValidKeys!0 (array!1127 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19943 (= res!13337 (= (arrayCountValidKeys!0 (_keys!3121 lt!5682) #b00000000000000000000000000000000 (size!630 (_keys!3121 lt!5682))) (_size!110 lt!5682)))))

(declare-fun b!19944 () Bool)

(declare-fun res!13338 () Bool)

(assert (=> b!19944 (=> (not res!13338) (not e!12975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1127 (_ BitVec 32)) Bool)

(assert (=> b!19944 (= res!13338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3121 lt!5682) (mask!4653 lt!5682)))))

(declare-fun b!19945 () Bool)

(declare-datatypes ((List!548 0))(
  ( (Nil!545) (Cons!544 (h!1110 (_ BitVec 64)) (t!3191 List!548)) )
))
(declare-fun arrayNoDuplicates!0 (array!1127 (_ BitVec 32) List!548) Bool)

(assert (=> b!19945 (= e!12975 (arrayNoDuplicates!0 (_keys!3121 lt!5682) #b00000000000000000000000000000000 Nil!545))))

(assert (= (and d!3617 res!13336) b!19943))

(assert (= (and b!19943 res!13337) b!19944))

(assert (= (and b!19944 res!13338) b!19945))

(declare-fun m!13993 () Bool)

(assert (=> d!3617 m!13993))

(declare-fun m!13995 () Bool)

(assert (=> b!19943 m!13995))

(declare-fun m!13997 () Bool)

(assert (=> b!19944 m!13997))

(declare-fun m!13999 () Bool)

(assert (=> b!19945 m!13999))

(assert (=> b!19884 d!3617))

(declare-fun d!3619 () Bool)

(assert (=> d!3619 (= (array_inv!381 (_keys!3121 (v!1532 (underlying!85 thiss!938)))) (bvsge (size!630 (_keys!3121 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19883 d!3619))

(declare-fun d!3621 () Bool)

(assert (=> d!3621 (= (array_inv!382 (_values!1689 (v!1532 (underlying!85 thiss!938)))) (bvsge (size!629 (_values!1689 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19883 d!3621))

(declare-fun d!3623 () Bool)

(assert (=> d!3623 (= (valid!86 thiss!938) (valid!85 (v!1532 (underlying!85 thiss!938))))))

(declare-fun bs!884 () Bool)

(assert (= bs!884 d!3623))

(declare-fun m!14001 () Bool)

(assert (=> bs!884 m!14001))

(assert (=> start!3252 d!3623))

(declare-fun d!3625 () Bool)

(declare-fun e!12984 () Bool)

(assert (=> d!3625 e!12984))

(declare-fun res!13343 () Bool)

(assert (=> d!3625 (=> (not res!13343) (not e!12984))))

(declare-fun lt!5753 () LongMapFixedSize!148)

(assert (=> d!3625 (= res!13343 (valid!85 lt!5753))))

(declare-fun lt!5737 () LongMapFixedSize!148)

(assert (=> d!3625 (= lt!5753 lt!5737)))

(declare-datatypes ((Unit!415 0))(
  ( (Unit!416) )
))
(declare-fun lt!5752 () Unit!415)

(declare-fun e!12982 () Unit!415)

(assert (=> d!3625 (= lt!5752 e!12982)))

(declare-fun c!2138 () Bool)

(declare-datatypes ((tuple2!840 0))(
  ( (tuple2!841 (_1!423 (_ BitVec 64)) (_2!423 V!1107)) )
))
(declare-datatypes ((List!549 0))(
  ( (Nil!546) (Cons!545 (h!1111 tuple2!840) (t!3192 List!549)) )
))
(declare-datatypes ((ListLongMap!547 0))(
  ( (ListLongMap!548 (toList!289 List!549)) )
))
(declare-fun map!380 (LongMapFixedSize!148) ListLongMap!547)

(assert (=> d!3625 (= c!2138 (not (= (map!380 lt!5737) (ListLongMap!548 Nil!546))))))

(declare-fun lt!5743 () Unit!415)

(declare-fun lt!5744 () Unit!415)

(assert (=> d!3625 (= lt!5743 lt!5744)))

(declare-fun lt!5741 () array!1127)

(declare-fun lt!5756 () (_ BitVec 32))

(declare-fun lt!5755 () List!548)

(assert (=> d!3625 (arrayNoDuplicates!0 lt!5741 lt!5756 lt!5755)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1127 (_ BitVec 32) (_ BitVec 32) List!548) Unit!415)

(assert (=> d!3625 (= lt!5744 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5741 lt!5756 (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001) lt!5755))))

(assert (=> d!3625 (= lt!5755 Nil!545)))

(assert (=> d!3625 (= lt!5756 #b00000000000000000000000000000000)))

(assert (=> d!3625 (= lt!5741 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5742 () Unit!415)

(declare-fun lt!5747 () Unit!415)

(assert (=> d!3625 (= lt!5742 lt!5747)))

(declare-fun lt!5735 () (_ BitVec 32))

(declare-fun lt!5748 () array!1127)

(assert (=> d!3625 (arrayForallSeekEntryOrOpenFound!0 lt!5735 lt!5748 (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1127 (_ BitVec 32) (_ BitVec 32)) Unit!415)

(assert (=> d!3625 (= lt!5747 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5748 (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) lt!5735))))

(assert (=> d!3625 (= lt!5735 #b00000000000000000000000000000000)))

(assert (=> d!3625 (= lt!5748 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5736 () Unit!415)

(declare-fun lt!5745 () Unit!415)

(assert (=> d!3625 (= lt!5736 lt!5745)))

(declare-fun lt!5754 () array!1127)

(declare-fun lt!5749 () (_ BitVec 32))

(declare-fun lt!5750 () (_ BitVec 32))

(assert (=> d!3625 (= (arrayCountValidKeys!0 lt!5754 lt!5749 lt!5750) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1127 (_ BitVec 32) (_ BitVec 32)) Unit!415)

(assert (=> d!3625 (= lt!5745 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5754 lt!5749 lt!5750))))

(assert (=> d!3625 (= lt!5750 (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3625 (= lt!5749 #b00000000000000000000000000000000)))

(assert (=> d!3625 (= lt!5754 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!132 (Int (_ BitVec 64)) V!1107)

(assert (=> d!3625 (= lt!5737 (LongMapFixedSize!149 (defaultEntry!1695 (v!1532 (underlying!85 thiss!938))) (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!132 (defaultEntry!1695 (v!1532 (underlying!85 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!132 (defaultEntry!1695 (v!1532 (underlying!85 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)) (array!1126 ((as const (Array (_ BitVec 32) ValueCell!281)) EmptyCell!281) (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3625 (validMask!0 (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))))))

(assert (=> d!3625 (= (getNewLongMapFixedSize!16 (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) (defaultEntry!1695 (v!1532 (underlying!85 thiss!938)))) lt!5753)))

(declare-fun b!19958 () Bool)

(declare-fun res!13344 () Bool)

(assert (=> b!19958 (=> (not res!13344) (not e!12984))))

(assert (=> b!19958 (= res!13344 (= (mask!4653 lt!5753) (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938))))))))

(declare-fun b!19959 () Bool)

(declare-fun e!12983 () Bool)

(declare-fun lt!5746 () tuple2!840)

(declare-fun lt!5751 () (_ BitVec 32))

(assert (=> b!19959 (= e!12983 (ite (= (_1!423 lt!5746) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5751 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5751 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!19960 () Bool)

(declare-fun Unit!417 () Unit!415)

(assert (=> b!19960 (= e!12982 Unit!417)))

(declare-fun head!820 (List!549) tuple2!840)

(assert (=> b!19960 (= lt!5746 (head!820 (toList!289 (map!380 lt!5737))))))

(declare-fun lt!5740 () array!1127)

(assert (=> b!19960 (= lt!5740 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!19960 (= lt!5751 #b00000000000000000000000000000000)))

(declare-fun lt!5739 () Unit!415)

(declare-fun lemmaKeyInListMapIsInArray!89 (array!1127 array!1125 (_ BitVec 32) (_ BitVec 32) V!1107 V!1107 (_ BitVec 64) Int) Unit!415)

(assert (=> b!19960 (= lt!5739 (lemmaKeyInListMapIsInArray!89 lt!5740 (array!1126 ((as const (Array (_ BitVec 32) ValueCell!281)) EmptyCell!281) (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) lt!5751 (dynLambda!132 (defaultEntry!1695 (v!1532 (underlying!85 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!132 (defaultEntry!1695 (v!1532 (underlying!85 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!423 lt!5746) (defaultEntry!1695 (v!1532 (underlying!85 thiss!938)))))))

(declare-fun c!2137 () Bool)

(assert (=> b!19960 (= c!2137 (and (not (= (_1!423 lt!5746) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!423 lt!5746) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!19960 e!12983))

(declare-fun lt!5757 () Unit!415)

(assert (=> b!19960 (= lt!5757 lt!5739)))

(declare-fun lt!5738 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1127 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19960 (= lt!5738 (arrayScanForKey!0 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)) (_1!423 lt!5746) #b00000000000000000000000000000000))))

(assert (=> b!19960 false))

(declare-fun b!19961 () Bool)

(declare-fun arrayContainsKey!0 (array!1127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19961 (= e!12983 (arrayContainsKey!0 lt!5740 (_1!423 lt!5746) #b00000000000000000000000000000000))))

(declare-fun b!19962 () Bool)

(declare-fun Unit!418 () Unit!415)

(assert (=> b!19962 (= e!12982 Unit!418)))

(declare-fun b!19963 () Bool)

(assert (=> b!19963 (= e!12984 (= (map!380 lt!5753) (ListLongMap!548 Nil!546)))))

(assert (= (and d!3625 c!2138) b!19960))

(assert (= (and d!3625 (not c!2138)) b!19962))

(assert (= (and b!19960 c!2137) b!19961))

(assert (= (and b!19960 (not c!2137)) b!19959))

(assert (= (and d!3625 res!13343) b!19958))

(assert (= (and b!19958 res!13344) b!19963))

(declare-fun b_lambda!1469 () Bool)

(assert (=> (not b_lambda!1469) (not d!3625)))

(declare-fun t!3190 () Bool)

(declare-fun tb!629 () Bool)

(assert (=> (and b!19883 (= (defaultEntry!1695 (v!1532 (underlying!85 thiss!938))) (defaultEntry!1695 (v!1532 (underlying!85 thiss!938)))) t!3190) tb!629))

(declare-fun result!1033 () Bool)

(assert (=> tb!629 (= result!1033 tp_is_empty!961)))

(assert (=> d!3625 t!3190))

(declare-fun b_and!1365 () Bool)

(assert (= b_and!1359 (and (=> t!3190 result!1033) b_and!1365)))

(declare-fun b_lambda!1471 () Bool)

(assert (=> (not b_lambda!1471) (not b!19960)))

(assert (=> b!19960 t!3190))

(declare-fun b_and!1367 () Bool)

(assert (= b_and!1365 (and (=> t!3190 result!1033) b_and!1367)))

(declare-fun m!14003 () Bool)

(assert (=> d!3625 m!14003))

(declare-fun m!14005 () Bool)

(assert (=> d!3625 m!14005))

(assert (=> d!3625 m!13955))

(declare-fun m!14007 () Bool)

(assert (=> d!3625 m!14007))

(declare-fun m!14009 () Bool)

(assert (=> d!3625 m!14009))

(declare-fun m!14011 () Bool)

(assert (=> d!3625 m!14011))

(declare-fun m!14013 () Bool)

(assert (=> d!3625 m!14013))

(assert (=> d!3625 m!13955))

(declare-fun m!14015 () Bool)

(assert (=> d!3625 m!14015))

(declare-fun m!14017 () Bool)

(assert (=> d!3625 m!14017))

(declare-fun m!14019 () Bool)

(assert (=> d!3625 m!14019))

(assert (=> d!3625 m!13955))

(declare-fun m!14021 () Bool)

(assert (=> d!3625 m!14021))

(assert (=> b!19960 m!14019))

(assert (=> b!19960 m!13955))

(assert (=> b!19960 m!14019))

(assert (=> b!19960 m!14019))

(declare-fun m!14023 () Bool)

(assert (=> b!19960 m!14023))

(declare-fun m!14025 () Bool)

(assert (=> b!19960 m!14025))

(declare-fun m!14027 () Bool)

(assert (=> b!19960 m!14027))

(assert (=> b!19960 m!14003))

(declare-fun m!14029 () Bool)

(assert (=> b!19961 m!14029))

(declare-fun m!14031 () Bool)

(assert (=> b!19963 m!14031))

(assert (=> b!19885 d!3625))

(declare-fun d!3627 () Bool)

(declare-fun e!12990 () Bool)

(assert (=> d!3627 e!12990))

(declare-fun res!13347 () Bool)

(assert (=> d!3627 (=> (not res!13347) (not e!12990))))

(declare-fun lt!5763 () (_ BitVec 32))

(assert (=> d!3627 (= res!13347 (validMask!0 lt!5763))))

(declare-datatypes ((tuple2!842 0))(
  ( (tuple2!843 (_1!424 Unit!415) (_2!424 (_ BitVec 32))) )
))
(declare-fun e!12989 () tuple2!842)

(assert (=> d!3627 (= lt!5763 (_2!424 e!12989))))

(declare-fun c!2141 () Bool)

(declare-fun lt!5762 () tuple2!842)

(assert (=> d!3627 (= c!2141 (and (bvsgt (_2!424 lt!5762) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!110 (v!1532 (underlying!85 thiss!938)))) (_2!424 lt!5762)) (bvsge (bvadd (bvand (bvashr (_2!424 lt!5762) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!110 (v!1532 (underlying!85 thiss!938))))))))

(declare-fun Unit!419 () Unit!415)

(declare-fun Unit!420 () Unit!415)

(assert (=> d!3627 (= lt!5762 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!110 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))))) (mask!4653 (v!1532 (underlying!85 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!110 (v!1532 (underlying!85 thiss!938)))) (mask!4653 (v!1532 (underlying!85 thiss!938))))) (tuple2!843 Unit!419 (bvand (bvadd (bvshl (mask!4653 (v!1532 (underlying!85 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!843 Unit!420 (mask!4653 (v!1532 (underlying!85 thiss!938))))))))

(assert (=> d!3627 (validMask!0 (mask!4653 (v!1532 (underlying!85 thiss!938))))))

(assert (=> d!3627 (= (computeNewMask!11 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) lt!5763)))

(declare-fun b!19972 () Bool)

(declare-fun computeNewMaskWhile!6 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!842)

(assert (=> b!19972 (= e!12989 (computeNewMaskWhile!6 (_size!110 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (mask!4653 (v!1532 (underlying!85 thiss!938))) (_2!424 lt!5762)))))

(declare-fun b!19973 () Bool)

(declare-fun Unit!421 () Unit!415)

(assert (=> b!19973 (= e!12989 (tuple2!843 Unit!421 (_2!424 lt!5762)))))

(declare-fun b!19974 () Bool)

(assert (=> b!19974 (= e!12990 (bvsle (_size!110 (v!1532 (underlying!85 thiss!938))) (bvadd lt!5763 #b00000000000000000000000000000001)))))

(assert (= (and d!3627 c!2141) b!19972))

(assert (= (and d!3627 (not c!2141)) b!19973))

(assert (= (and d!3627 res!13347) b!19974))

(declare-fun m!14033 () Bool)

(assert (=> d!3627 m!14033))

(declare-fun m!14035 () Bool)

(assert (=> d!3627 m!14035))

(declare-fun m!14037 () Bool)

(assert (=> b!19972 m!14037))

(assert (=> b!19885 d!3627))

(declare-fun b!19981 () Bool)

(declare-fun e!12996 () Bool)

(assert (=> b!19981 (= e!12996 tp_is_empty!961)))

(declare-fun mapNonEmpty!916 () Bool)

(declare-fun mapRes!916 () Bool)

(declare-fun tp!3328 () Bool)

(assert (=> mapNonEmpty!916 (= mapRes!916 (and tp!3328 e!12996))))

(declare-fun mapKey!916 () (_ BitVec 32))

(declare-fun mapValue!916 () ValueCell!281)

(declare-fun mapRest!916 () (Array (_ BitVec 32) ValueCell!281))

(assert (=> mapNonEmpty!916 (= mapRest!907 (store mapRest!916 mapKey!916 mapValue!916))))

(declare-fun mapIsEmpty!916 () Bool)

(assert (=> mapIsEmpty!916 mapRes!916))

(declare-fun condMapEmpty!916 () Bool)

(declare-fun mapDefault!916 () ValueCell!281)

(assert (=> mapNonEmpty!907 (= condMapEmpty!916 (= mapRest!907 ((as const (Array (_ BitVec 32) ValueCell!281)) mapDefault!916)))))

(declare-fun e!12995 () Bool)

(assert (=> mapNonEmpty!907 (= tp!3312 (and e!12995 mapRes!916))))

(declare-fun b!19982 () Bool)

(assert (=> b!19982 (= e!12995 tp_is_empty!961)))

(assert (= (and mapNonEmpty!907 condMapEmpty!916) mapIsEmpty!916))

(assert (= (and mapNonEmpty!907 (not condMapEmpty!916)) mapNonEmpty!916))

(assert (= (and mapNonEmpty!916 ((_ is ValueCellFull!281) mapValue!916)) b!19981))

(assert (= (and mapNonEmpty!907 ((_ is ValueCellFull!281) mapDefault!916)) b!19982))

(declare-fun m!14039 () Bool)

(assert (=> mapNonEmpty!916 m!14039))

(declare-fun b_lambda!1473 () Bool)

(assert (= b_lambda!1469 (or (and b!19883 b_free!697) b_lambda!1473)))

(declare-fun b_lambda!1475 () Bool)

(assert (= b_lambda!1471 (or (and b!19883 b_free!697) b_lambda!1475)))

(check-sat (not b_lambda!1475) (not b_lambda!1473) (not mapNonEmpty!916) (not b!19961) (not d!3625) tp_is_empty!961 (not b!19963) (not b!19960) (not d!3617) (not b!19944) (not b!19972) (not b!19945) (not b!19943) (not d!3627) (not d!3623) (not b_next!697) b_and!1367)
(check-sat b_and!1367 (not b_next!697))
