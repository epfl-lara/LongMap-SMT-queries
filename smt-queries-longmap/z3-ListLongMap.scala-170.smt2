; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3246 () Bool)

(assert start!3246)

(declare-fun b!19857 () Bool)

(declare-fun b_free!697 () Bool)

(declare-fun b_next!697 () Bool)

(assert (=> b!19857 (= b_free!697 (not b_next!697))))

(declare-fun tp!3313 () Bool)

(declare-fun b_and!1359 () Bool)

(assert (=> b!19857 (= tp!3313 b_and!1359)))

(declare-fun tp_is_empty!961 () Bool)

(declare-fun e!12898 () Bool)

(declare-fun e!12894 () Bool)

(declare-datatypes ((V!1107 0))(
  ( (V!1108 (val!507 Int)) )
))
(declare-datatypes ((ValueCell!281 0))(
  ( (ValueCellFull!281 (v!1530 V!1107)) (EmptyCell!281) )
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
  ( (Cell!149 (v!1531 LongMapFixedSize!148)) )
))
(declare-datatypes ((LongMap!148 0))(
  ( (LongMap!149 (underlying!85 Cell!148)) )
))
(declare-fun thiss!938 () LongMap!148)

(declare-fun array_inv!377 (array!1127) Bool)

(declare-fun array_inv!378 (array!1125) Bool)

(assert (=> b!19857 (= e!12894 (and tp!3313 tp_is_empty!961 (array_inv!377 (_keys!3121 (v!1531 (underlying!85 thiss!938)))) (array_inv!378 (_values!1689 (v!1531 (underlying!85 thiss!938)))) e!12898))))

(declare-fun b!19858 () Bool)

(declare-fun e!12899 () Bool)

(assert (=> b!19858 (= e!12899 tp_is_empty!961)))

(declare-fun b!19859 () Bool)

(declare-fun e!12897 () Bool)

(declare-fun e!12900 () Bool)

(assert (=> b!19859 (= e!12897 e!12900)))

(declare-fun res!13306 () Bool)

(assert (=> b!19859 (=> (not res!13306) (not e!12900))))

(assert (=> b!19859 (= res!13306 (and (= (bvand (extraKeys!1603 (v!1531 (underlying!85 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1603 (v!1531 (underlying!85 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!5678 () LongMapFixedSize!148)

(declare-fun getNewLongMapFixedSize!13 ((_ BitVec 32) Int) LongMapFixedSize!148)

(declare-fun computeNewMask!10 (LongMap!148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19859 (= lt!5678 (getNewLongMapFixedSize!13 (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) (defaultEntry!1695 (v!1531 (underlying!85 thiss!938)))))))

(declare-fun b!19860 () Bool)

(declare-fun e!12893 () Bool)

(declare-fun mapRes!907 () Bool)

(assert (=> b!19860 (= e!12898 (and e!12893 mapRes!907))))

(declare-fun condMapEmpty!907 () Bool)

(declare-fun mapDefault!907 () ValueCell!281)

(assert (=> b!19860 (= condMapEmpty!907 (= (arr!536 (_values!1689 (v!1531 (underlying!85 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!281)) mapDefault!907)))))

(declare-fun b!19862 () Bool)

(declare-fun e!12901 () Bool)

(declare-fun e!12895 () Bool)

(assert (=> b!19862 (= e!12901 e!12895)))

(declare-fun b!19863 () Bool)

(assert (=> b!19863 (= e!12895 e!12894)))

(declare-fun mapIsEmpty!907 () Bool)

(assert (=> mapIsEmpty!907 mapRes!907))

(declare-fun mapNonEmpty!907 () Bool)

(declare-fun tp!3312 () Bool)

(assert (=> mapNonEmpty!907 (= mapRes!907 (and tp!3312 e!12899))))

(declare-fun mapValue!907 () ValueCell!281)

(declare-fun mapRest!907 () (Array (_ BitVec 32) ValueCell!281))

(declare-fun mapKey!907 () (_ BitVec 32))

(assert (=> mapNonEmpty!907 (= (arr!536 (_values!1689 (v!1531 (underlying!85 thiss!938)))) (store mapRest!907 mapKey!907 mapValue!907))))

(declare-fun b!19864 () Bool)

(assert (=> b!19864 (= e!12893 tp_is_empty!961)))

(declare-fun res!13307 () Bool)

(assert (=> start!3246 (=> (not res!13307) (not e!12897))))

(declare-fun valid!81 (LongMap!148) Bool)

(assert (=> start!3246 (= res!13307 (valid!81 thiss!938))))

(assert (=> start!3246 e!12897))

(assert (=> start!3246 e!12901))

(declare-fun b!19861 () Bool)

(declare-fun valid!82 (LongMapFixedSize!148) Bool)

(assert (=> b!19861 (= e!12900 (not (valid!82 lt!5678)))))

(assert (= (and start!3246 res!13307) b!19859))

(assert (= (and b!19859 res!13306) b!19861))

(assert (= (and b!19860 condMapEmpty!907) mapIsEmpty!907))

(assert (= (and b!19860 (not condMapEmpty!907)) mapNonEmpty!907))

(get-info :version)

(assert (= (and mapNonEmpty!907 ((_ is ValueCellFull!281) mapValue!907)) b!19858))

(assert (= (and b!19860 ((_ is ValueCellFull!281) mapDefault!907)) b!19864))

(assert (= b!19857 b!19860))

(assert (= b!19863 b!19857))

(assert (= b!19862 b!19863))

(assert (= start!3246 b!19862))

(declare-fun m!13937 () Bool)

(assert (=> b!19859 m!13937))

(assert (=> b!19859 m!13937))

(declare-fun m!13939 () Bool)

(assert (=> b!19859 m!13939))

(declare-fun m!13941 () Bool)

(assert (=> b!19861 m!13941))

(declare-fun m!13943 () Bool)

(assert (=> mapNonEmpty!907 m!13943))

(declare-fun m!13945 () Bool)

(assert (=> b!19857 m!13945))

(declare-fun m!13947 () Bool)

(assert (=> b!19857 m!13947))

(declare-fun m!13949 () Bool)

(assert (=> start!3246 m!13949))

(check-sat tp_is_empty!961 (not start!3246) (not b!19859) (not b!19857) (not mapNonEmpty!907) (not b_next!697) (not b!19861) b_and!1359)
(check-sat b_and!1359 (not b_next!697))
(get-model)

(declare-fun d!3611 () Bool)

(assert (=> d!3611 (= (valid!81 thiss!938) (valid!82 (v!1531 (underlying!85 thiss!938))))))

(declare-fun bs!884 () Bool)

(assert (= bs!884 d!3611))

(declare-fun m!13979 () Bool)

(assert (=> bs!884 m!13979))

(assert (=> start!3246 d!3611))

(declare-fun b!19925 () Bool)

(declare-datatypes ((Unit!412 0))(
  ( (Unit!413) )
))
(declare-fun e!12962 () Unit!412)

(declare-fun Unit!414 () Unit!412)

(assert (=> b!19925 (= e!12962 Unit!414)))

(declare-datatypes ((tuple2!834 0))(
  ( (tuple2!835 (_1!420 (_ BitVec 64)) (_2!420 V!1107)) )
))
(declare-fun lt!5733 () tuple2!834)

(declare-fun lt!5747 () LongMapFixedSize!148)

(declare-datatypes ((List!547 0))(
  ( (Nil!544) (Cons!543 (h!1109 tuple2!834) (t!3189 List!547)) )
))
(declare-fun head!822 (List!547) tuple2!834)

(declare-datatypes ((ListLongMap!545 0))(
  ( (ListLongMap!546 (toList!288 List!547)) )
))
(declare-fun map!378 (LongMapFixedSize!148) ListLongMap!545)

(assert (=> b!19925 (= lt!5733 (head!822 (toList!288 (map!378 lt!5747))))))

(declare-fun lt!5748 () array!1127)

(assert (=> b!19925 (= lt!5748 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5740 () (_ BitVec 32))

(assert (=> b!19925 (= lt!5740 #b00000000000000000000000000000000)))

(declare-fun lt!5732 () Unit!412)

(declare-fun lemmaKeyInListMapIsInArray!89 (array!1127 array!1125 (_ BitVec 32) (_ BitVec 32) V!1107 V!1107 (_ BitVec 64) Int) Unit!412)

(declare-fun dynLambda!135 (Int (_ BitVec 64)) V!1107)

(assert (=> b!19925 (= lt!5732 (lemmaKeyInListMapIsInArray!89 lt!5748 (array!1126 ((as const (Array (_ BitVec 32) ValueCell!281)) EmptyCell!281) (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) lt!5740 (dynLambda!135 (defaultEntry!1695 (v!1531 (underlying!85 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!135 (defaultEntry!1695 (v!1531 (underlying!85 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!420 lt!5733) (defaultEntry!1695 (v!1531 (underlying!85 thiss!938)))))))

(declare-fun c!2131 () Bool)

(assert (=> b!19925 (= c!2131 (and (not (= (_1!420 lt!5733) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!420 lt!5733) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!12963 () Bool)

(assert (=> b!19925 e!12963))

(declare-fun lt!5737 () Unit!412)

(assert (=> b!19925 (= lt!5737 lt!5732)))

(declare-fun lt!5738 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1127 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19925 (= lt!5738 (arrayScanForKey!0 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)) (_1!420 lt!5733) #b00000000000000000000000000000000))))

(assert (=> b!19925 false))

(declare-fun b!19926 () Bool)

(declare-fun arrayContainsKey!0 (array!1127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19926 (= e!12963 (arrayContainsKey!0 lt!5748 (_1!420 lt!5733) #b00000000000000000000000000000000))))

(declare-fun b!19927 () Bool)

(assert (=> b!19927 (= e!12963 (ite (= (_1!420 lt!5733) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5740 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5740 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3613 () Bool)

(declare-fun e!12964 () Bool)

(assert (=> d!3613 e!12964))

(declare-fun res!13325 () Bool)

(assert (=> d!3613 (=> (not res!13325) (not e!12964))))

(declare-fun lt!5750 () LongMapFixedSize!148)

(assert (=> d!3613 (= res!13325 (valid!82 lt!5750))))

(assert (=> d!3613 (= lt!5750 lt!5747)))

(declare-fun lt!5734 () Unit!412)

(assert (=> d!3613 (= lt!5734 e!12962)))

(declare-fun c!2130 () Bool)

(assert (=> d!3613 (= c!2130 (not (= (map!378 lt!5747) (ListLongMap!546 Nil!544))))))

(declare-fun lt!5753 () Unit!412)

(declare-fun lt!5751 () Unit!412)

(assert (=> d!3613 (= lt!5753 lt!5751)))

(declare-fun lt!5752 () array!1127)

(declare-fun lt!5746 () (_ BitVec 32))

(declare-datatypes ((List!548 0))(
  ( (Nil!545) (Cons!544 (h!1110 (_ BitVec 64)) (t!3190 List!548)) )
))
(declare-fun lt!5739 () List!548)

(declare-fun arrayNoDuplicates!0 (array!1127 (_ BitVec 32) List!548) Bool)

(assert (=> d!3613 (arrayNoDuplicates!0 lt!5752 lt!5746 lt!5739)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1127 (_ BitVec 32) (_ BitVec 32) List!548) Unit!412)

(assert (=> d!3613 (= lt!5751 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5752 lt!5746 (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001) lt!5739))))

(assert (=> d!3613 (= lt!5739 Nil!545)))

(assert (=> d!3613 (= lt!5746 #b00000000000000000000000000000000)))

(assert (=> d!3613 (= lt!5752 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5742 () Unit!412)

(declare-fun lt!5745 () Unit!412)

(assert (=> d!3613 (= lt!5742 lt!5745)))

(declare-fun lt!5744 () (_ BitVec 32))

(declare-fun lt!5731 () array!1127)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1127 (_ BitVec 32)) Bool)

(assert (=> d!3613 (arrayForallSeekEntryOrOpenFound!0 lt!5744 lt!5731 (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1127 (_ BitVec 32) (_ BitVec 32)) Unit!412)

(assert (=> d!3613 (= lt!5745 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5731 (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) lt!5744))))

(assert (=> d!3613 (= lt!5744 #b00000000000000000000000000000000)))

(assert (=> d!3613 (= lt!5731 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5749 () Unit!412)

(declare-fun lt!5736 () Unit!412)

(assert (=> d!3613 (= lt!5749 lt!5736)))

(declare-fun lt!5735 () array!1127)

(declare-fun lt!5741 () (_ BitVec 32))

(declare-fun lt!5743 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1127 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3613 (= (arrayCountValidKeys!0 lt!5735 lt!5741 lt!5743) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1127 (_ BitVec 32) (_ BitVec 32)) Unit!412)

(assert (=> d!3613 (= lt!5736 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5735 lt!5741 lt!5743))))

(assert (=> d!3613 (= lt!5743 (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3613 (= lt!5741 #b00000000000000000000000000000000)))

(assert (=> d!3613 (= lt!5735 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3613 (= lt!5747 (LongMapFixedSize!149 (defaultEntry!1695 (v!1531 (underlying!85 thiss!938))) (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!135 (defaultEntry!1695 (v!1531 (underlying!85 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!135 (defaultEntry!1695 (v!1531 (underlying!85 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1128 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)) (array!1126 ((as const (Array (_ BitVec 32) ValueCell!281)) EmptyCell!281) (bvadd (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3613 (validMask!0 (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))))))

(assert (=> d!3613 (= (getNewLongMapFixedSize!13 (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) (defaultEntry!1695 (v!1531 (underlying!85 thiss!938)))) lt!5750)))

(declare-fun b!19928 () Bool)

(declare-fun res!13324 () Bool)

(assert (=> b!19928 (=> (not res!13324) (not e!12964))))

(assert (=> b!19928 (= res!13324 (= (mask!4653 lt!5750) (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938))))))))

(declare-fun b!19929 () Bool)

(declare-fun Unit!415 () Unit!412)

(assert (=> b!19929 (= e!12962 Unit!415)))

(declare-fun b!19930 () Bool)

(assert (=> b!19930 (= e!12964 (= (map!378 lt!5750) (ListLongMap!546 Nil!544)))))

(assert (= (and d!3613 c!2130) b!19925))

(assert (= (and d!3613 (not c!2130)) b!19929))

(assert (= (and b!19925 c!2131) b!19926))

(assert (= (and b!19925 (not c!2131)) b!19927))

(assert (= (and d!3613 res!13325) b!19928))

(assert (= (and b!19928 res!13324) b!19930))

(declare-fun b_lambda!1469 () Bool)

(assert (=> (not b_lambda!1469) (not b!19925)))

(declare-fun t!3188 () Bool)

(declare-fun tb!629 () Bool)

(assert (=> (and b!19857 (= (defaultEntry!1695 (v!1531 (underlying!85 thiss!938))) (defaultEntry!1695 (v!1531 (underlying!85 thiss!938)))) t!3188) tb!629))

(declare-fun result!1033 () Bool)

(assert (=> tb!629 (= result!1033 tp_is_empty!961)))

(assert (=> b!19925 t!3188))

(declare-fun b_and!1365 () Bool)

(assert (= b_and!1359 (and (=> t!3188 result!1033) b_and!1365)))

(declare-fun b_lambda!1471 () Bool)

(assert (=> (not b_lambda!1471) (not d!3613)))

(assert (=> d!3613 t!3188))

(declare-fun b_and!1367 () Bool)

(assert (= b_and!1365 (and (=> t!3188 result!1033) b_and!1367)))

(declare-fun m!13981 () Bool)

(assert (=> b!19925 m!13981))

(declare-fun m!13983 () Bool)

(assert (=> b!19925 m!13983))

(declare-fun m!13985 () Bool)

(assert (=> b!19925 m!13985))

(assert (=> b!19925 m!13937))

(assert (=> b!19925 m!13985))

(assert (=> b!19925 m!13985))

(declare-fun m!13987 () Bool)

(assert (=> b!19925 m!13987))

(declare-fun m!13989 () Bool)

(assert (=> b!19925 m!13989))

(declare-fun m!13991 () Bool)

(assert (=> b!19926 m!13991))

(assert (=> d!3613 m!13937))

(declare-fun m!13993 () Bool)

(assert (=> d!3613 m!13993))

(assert (=> d!3613 m!13983))

(declare-fun m!13995 () Bool)

(assert (=> d!3613 m!13995))

(declare-fun m!13997 () Bool)

(assert (=> d!3613 m!13997))

(declare-fun m!13999 () Bool)

(assert (=> d!3613 m!13999))

(assert (=> d!3613 m!13985))

(assert (=> d!3613 m!13937))

(declare-fun m!14001 () Bool)

(assert (=> d!3613 m!14001))

(assert (=> d!3613 m!13937))

(declare-fun m!14003 () Bool)

(assert (=> d!3613 m!14003))

(declare-fun m!14005 () Bool)

(assert (=> d!3613 m!14005))

(declare-fun m!14007 () Bool)

(assert (=> d!3613 m!14007))

(declare-fun m!14009 () Bool)

(assert (=> b!19930 m!14009))

(assert (=> b!19859 d!3613))

(declare-fun d!3615 () Bool)

(declare-fun e!12970 () Bool)

(assert (=> d!3615 e!12970))

(declare-fun res!13328 () Bool)

(assert (=> d!3615 (=> (not res!13328) (not e!12970))))

(declare-fun lt!5758 () (_ BitVec 32))

(assert (=> d!3615 (= res!13328 (validMask!0 lt!5758))))

(declare-datatypes ((tuple2!836 0))(
  ( (tuple2!837 (_1!421 Unit!412) (_2!421 (_ BitVec 32))) )
))
(declare-fun e!12969 () tuple2!836)

(assert (=> d!3615 (= lt!5758 (_2!421 e!12969))))

(declare-fun c!2134 () Bool)

(declare-fun lt!5759 () tuple2!836)

(assert (=> d!3615 (= c!2134 (and (bvsgt (_2!421 lt!5759) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!110 (v!1531 (underlying!85 thiss!938)))) (_2!421 lt!5759)) (bvsge (bvadd (bvand (bvashr (_2!421 lt!5759) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!110 (v!1531 (underlying!85 thiss!938))))))))

(declare-fun Unit!416 () Unit!412)

(declare-fun Unit!417 () Unit!412)

(assert (=> d!3615 (= lt!5759 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!110 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))))) (mask!4653 (v!1531 (underlying!85 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!110 (v!1531 (underlying!85 thiss!938)))) (mask!4653 (v!1531 (underlying!85 thiss!938))))) (tuple2!837 Unit!416 (bvand (bvadd (bvshl (mask!4653 (v!1531 (underlying!85 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!837 Unit!417 (mask!4653 (v!1531 (underlying!85 thiss!938))))))))

(assert (=> d!3615 (validMask!0 (mask!4653 (v!1531 (underlying!85 thiss!938))))))

(assert (=> d!3615 (= (computeNewMask!10 thiss!938 (mask!4653 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (_size!110 (v!1531 (underlying!85 thiss!938)))) lt!5758)))

(declare-fun b!19939 () Bool)

(declare-fun computeNewMaskWhile!6 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!836)

(assert (=> b!19939 (= e!12969 (computeNewMaskWhile!6 (_size!110 (v!1531 (underlying!85 thiss!938))) (_vacant!110 (v!1531 (underlying!85 thiss!938))) (mask!4653 (v!1531 (underlying!85 thiss!938))) (_2!421 lt!5759)))))

(declare-fun b!19940 () Bool)

(declare-fun Unit!418 () Unit!412)

(assert (=> b!19940 (= e!12969 (tuple2!837 Unit!418 (_2!421 lt!5759)))))

(declare-fun b!19941 () Bool)

(assert (=> b!19941 (= e!12970 (bvsle (_size!110 (v!1531 (underlying!85 thiss!938))) (bvadd lt!5758 #b00000000000000000000000000000001)))))

(assert (= (and d!3615 c!2134) b!19939))

(assert (= (and d!3615 (not c!2134)) b!19940))

(assert (= (and d!3615 res!13328) b!19941))

(declare-fun m!14011 () Bool)

(assert (=> d!3615 m!14011))

(declare-fun m!14013 () Bool)

(assert (=> d!3615 m!14013))

(declare-fun m!14015 () Bool)

(assert (=> b!19939 m!14015))

(assert (=> b!19859 d!3615))

(declare-fun d!3617 () Bool)

(assert (=> d!3617 (= (array_inv!377 (_keys!3121 (v!1531 (underlying!85 thiss!938)))) (bvsge (size!630 (_keys!3121 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19857 d!3617))

(declare-fun d!3619 () Bool)

(assert (=> d!3619 (= (array_inv!378 (_values!1689 (v!1531 (underlying!85 thiss!938)))) (bvsge (size!629 (_values!1689 (v!1531 (underlying!85 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19857 d!3619))

(declare-fun d!3621 () Bool)

(declare-fun res!13335 () Bool)

(declare-fun e!12973 () Bool)

(assert (=> d!3621 (=> (not res!13335) (not e!12973))))

(declare-fun simpleValid!15 (LongMapFixedSize!148) Bool)

(assert (=> d!3621 (= res!13335 (simpleValid!15 lt!5678))))

(assert (=> d!3621 (= (valid!82 lt!5678) e!12973)))

(declare-fun b!19948 () Bool)

(declare-fun res!13336 () Bool)

(assert (=> b!19948 (=> (not res!13336) (not e!12973))))

(assert (=> b!19948 (= res!13336 (= (arrayCountValidKeys!0 (_keys!3121 lt!5678) #b00000000000000000000000000000000 (size!630 (_keys!3121 lt!5678))) (_size!110 lt!5678)))))

(declare-fun b!19949 () Bool)

(declare-fun res!13337 () Bool)

(assert (=> b!19949 (=> (not res!13337) (not e!12973))))

(assert (=> b!19949 (= res!13337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3121 lt!5678) (mask!4653 lt!5678)))))

(declare-fun b!19950 () Bool)

(assert (=> b!19950 (= e!12973 (arrayNoDuplicates!0 (_keys!3121 lt!5678) #b00000000000000000000000000000000 Nil!545))))

(assert (= (and d!3621 res!13335) b!19948))

(assert (= (and b!19948 res!13336) b!19949))

(assert (= (and b!19949 res!13337) b!19950))

(declare-fun m!14017 () Bool)

(assert (=> d!3621 m!14017))

(declare-fun m!14019 () Bool)

(assert (=> b!19948 m!14019))

(declare-fun m!14021 () Bool)

(assert (=> b!19949 m!14021))

(declare-fun m!14023 () Bool)

(assert (=> b!19950 m!14023))

(assert (=> b!19861 d!3621))

(declare-fun b!19958 () Bool)

(declare-fun e!12978 () Bool)

(assert (=> b!19958 (= e!12978 tp_is_empty!961)))

(declare-fun condMapEmpty!916 () Bool)

(declare-fun mapDefault!916 () ValueCell!281)

(assert (=> mapNonEmpty!907 (= condMapEmpty!916 (= mapRest!907 ((as const (Array (_ BitVec 32) ValueCell!281)) mapDefault!916)))))

(declare-fun mapRes!916 () Bool)

(assert (=> mapNonEmpty!907 (= tp!3312 (and e!12978 mapRes!916))))

(declare-fun mapIsEmpty!916 () Bool)

(assert (=> mapIsEmpty!916 mapRes!916))

(declare-fun b!19957 () Bool)

(declare-fun e!12979 () Bool)

(assert (=> b!19957 (= e!12979 tp_is_empty!961)))

(declare-fun mapNonEmpty!916 () Bool)

(declare-fun tp!3328 () Bool)

(assert (=> mapNonEmpty!916 (= mapRes!916 (and tp!3328 e!12979))))

(declare-fun mapRest!916 () (Array (_ BitVec 32) ValueCell!281))

(declare-fun mapKey!916 () (_ BitVec 32))

(declare-fun mapValue!916 () ValueCell!281)

(assert (=> mapNonEmpty!916 (= mapRest!907 (store mapRest!916 mapKey!916 mapValue!916))))

(assert (= (and mapNonEmpty!907 condMapEmpty!916) mapIsEmpty!916))

(assert (= (and mapNonEmpty!907 (not condMapEmpty!916)) mapNonEmpty!916))

(assert (= (and mapNonEmpty!916 ((_ is ValueCellFull!281) mapValue!916)) b!19957))

(assert (= (and mapNonEmpty!907 ((_ is ValueCellFull!281) mapDefault!916)) b!19958))

(declare-fun m!14025 () Bool)

(assert (=> mapNonEmpty!916 m!14025))

(declare-fun b_lambda!1473 () Bool)

(assert (= b_lambda!1469 (or (and b!19857 b_free!697) b_lambda!1473)))

(declare-fun b_lambda!1475 () Bool)

(assert (= b_lambda!1471 (or (and b!19857 b_free!697) b_lambda!1475)))

(check-sat tp_is_empty!961 (not b!19926) (not b!19939) (not b!19950) (not d!3611) (not b!19930) (not b!19948) (not b_next!697) (not d!3621) (not d!3615) (not b!19925) (not d!3613) (not mapNonEmpty!916) (not b!19949) (not b_lambda!1473) (not b_lambda!1475) b_and!1367)
(check-sat b_and!1367 (not b_next!697))
