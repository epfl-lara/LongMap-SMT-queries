; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3474 () Bool)

(assert start!3474)

(declare-fun b!22813 () Bool)

(declare-fun b_free!753 () Bool)

(declare-fun b_next!753 () Bool)

(assert (=> b!22813 (= b_free!753 (not b_next!753))))

(declare-fun tp!3503 () Bool)

(declare-fun b_and!1471 () Bool)

(assert (=> b!22813 (= tp!3503 b_and!1471)))

(declare-fun b!22808 () Bool)

(declare-fun e!14833 () Bool)

(declare-fun tp_is_empty!1017 () Bool)

(assert (=> b!22808 (= e!14833 tp_is_empty!1017)))

(declare-fun b!22809 () Bool)

(declare-datatypes ((V!1181 0))(
  ( (V!1182 (val!535 Int)) )
))
(declare-datatypes ((ValueCell!309 0))(
  ( (ValueCellFull!309 (v!1596 V!1181)) (EmptyCell!309) )
))
(declare-datatypes ((array!1269 0))(
  ( (array!1270 (arr!601 (Array (_ BitVec 32) ValueCell!309)) (size!697 (_ BitVec 32))) )
))
(declare-datatypes ((array!1271 0))(
  ( (array!1272 (arr!602 (Array (_ BitVec 32) (_ BitVec 64))) (size!698 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!204 0))(
  ( (LongMapFixedSize!205 (defaultEntry!1739 Int) (mask!4723 (_ BitVec 32)) (extraKeys!1638 (_ BitVec 32)) (zeroValue!1663 V!1181) (minValue!1663 V!1181) (_size!146 (_ BitVec 32)) (_keys!3161 array!1271) (_values!1726 array!1269) (_vacant!146 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!942 0))(
  ( (tuple2!943 (_1!480 Bool) (_2!480 LongMapFixedSize!204)) )
))
(declare-fun lt!7923 () tuple2!942)

(declare-fun call!1742 () tuple2!942)

(assert (=> b!22809 (= lt!7923 call!1742)))

(declare-datatypes ((Cell!204 0))(
  ( (Cell!205 (v!1597 LongMapFixedSize!204)) )
))
(declare-datatypes ((tuple2!944 0))(
  ( (tuple2!945 (_1!481 Bool) (_2!481 Cell!204)) )
))
(declare-fun e!14840 () tuple2!944)

(assert (=> b!22809 (= e!14840 (tuple2!945 (_1!480 lt!7923) (Cell!205 (_2!480 lt!7923))))))

(declare-fun b!22810 () Bool)

(declare-fun e!14834 () tuple2!944)

(declare-fun lt!7921 () LongMapFixedSize!204)

(assert (=> b!22810 (= e!14834 (tuple2!945 true (Cell!205 lt!7921)))))

(declare-fun b!22812 () Bool)

(declare-fun e!14835 () Bool)

(declare-fun e!14841 () Bool)

(assert (=> b!22812 (= e!14835 e!14841)))

(declare-fun bm!1738 () Bool)

(declare-fun call!1741 () tuple2!942)

(assert (=> bm!1738 (= call!1742 call!1741)))

(declare-fun e!14831 () Bool)

(declare-fun e!14839 () Bool)

(declare-datatypes ((LongMap!204 0))(
  ( (LongMap!205 (underlying!113 Cell!204)) )
))
(declare-fun thiss!938 () LongMap!204)

(declare-fun array_inv!405 (array!1271) Bool)

(declare-fun array_inv!406 (array!1269) Bool)

(assert (=> b!22813 (= e!14839 (and tp!3503 tp_is_empty!1017 (array_inv!405 (_keys!3161 (v!1597 (underlying!113 thiss!938)))) (array_inv!406 (_values!1726 (v!1597 (underlying!113 thiss!938)))) e!14831))))

(declare-fun mapNonEmpty!1013 () Bool)

(declare-fun mapRes!1013 () Bool)

(declare-fun tp!3502 () Bool)

(declare-fun e!14832 () Bool)

(assert (=> mapNonEmpty!1013 (= mapRes!1013 (and tp!3502 e!14832))))

(declare-fun mapValue!1013 () ValueCell!309)

(declare-fun mapRest!1013 () (Array (_ BitVec 32) ValueCell!309))

(declare-fun mapKey!1013 () (_ BitVec 32))

(assert (=> mapNonEmpty!1013 (= (arr!601 (_values!1726 (v!1597 (underlying!113 thiss!938)))) (store mapRest!1013 mapKey!1013 mapValue!1013))))

(declare-fun b!22814 () Bool)

(declare-fun e!14836 () Bool)

(declare-fun e!14838 () Bool)

(assert (=> b!22814 (= e!14836 e!14838)))

(declare-fun res!14244 () Bool)

(assert (=> b!22814 (=> (not res!14244) (not e!14838))))

(declare-fun e!14842 () tuple2!944)

(assert (=> b!22814 (= res!14244 (_1!481 e!14842))))

(declare-fun c!2845 () Bool)

(declare-fun lt!7922 () Bool)

(assert (=> b!22814 (= c!2845 (and (not lt!7922) (not (= (bvand (extraKeys!1638 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22814 (= lt!7922 (= (bvand (extraKeys!1638 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!31 ((_ BitVec 32) Int) LongMapFixedSize!204)

(declare-fun computeNewMask!27 (LongMap!204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22814 (= lt!7921 (getNewLongMapFixedSize!31 (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) (defaultEntry!1739 (v!1597 (underlying!113 thiss!938)))))))

(declare-fun b!22815 () Bool)

(declare-fun lt!7924 () tuple2!942)

(assert (=> b!22815 (= e!14834 (tuple2!945 (_1!480 lt!7924) (Cell!205 (_2!480 lt!7924))))))

(assert (=> b!22815 (= lt!7924 call!1742)))

(declare-fun b!22816 () Bool)

(declare-fun lt!7925 () tuple2!942)

(declare-fun lt!7926 () tuple2!942)

(assert (=> b!22816 (= e!14842 (tuple2!945 (and (_1!480 lt!7925) (_1!480 lt!7926)) (Cell!205 (_2!480 lt!7926))))))

(declare-fun update!30 (LongMapFixedSize!204 (_ BitVec 64) V!1181) tuple2!942)

(assert (=> b!22816 (= lt!7925 (update!30 lt!7921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1663 (v!1597 (underlying!113 thiss!938)))))))

(assert (=> b!22816 (= lt!7926 call!1741)))

(declare-fun bm!1739 () Bool)

(declare-fun c!2846 () Bool)

(assert (=> bm!1739 (= call!1741 (update!30 (ite c!2845 (_2!480 lt!7925) lt!7921) (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938)))))))))

(declare-fun b!22817 () Bool)

(declare-fun c!2844 () Bool)

(assert (=> b!22817 (= c!2844 (and (not (= (bvand (extraKeys!1638 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7922))))

(assert (=> b!22817 (= e!14840 e!14834)))

(declare-fun b!22818 () Bool)

(assert (=> b!22818 (= e!14841 e!14839)))

(declare-fun b!22819 () Bool)

(assert (=> b!22819 (= e!14832 tp_is_empty!1017)))

(declare-fun b!22820 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!22820 (= e!14838 (not (validMask!0 (mask!4723 (v!1597 (underlying!113 thiss!938))))))))

(declare-fun res!14243 () Bool)

(assert (=> start!3474 (=> (not res!14243) (not e!14836))))

(declare-fun valid!100 (LongMap!204) Bool)

(assert (=> start!3474 (= res!14243 (valid!100 thiss!938))))

(assert (=> start!3474 e!14836))

(assert (=> start!3474 e!14835))

(declare-fun b!22811 () Bool)

(assert (=> b!22811 (= e!14842 e!14840)))

(assert (=> b!22811 (= c!2846 (and (not lt!7922) (= (bvand (extraKeys!1638 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22821 () Bool)

(assert (=> b!22821 (= e!14831 (and e!14833 mapRes!1013))))

(declare-fun condMapEmpty!1013 () Bool)

(declare-fun mapDefault!1013 () ValueCell!309)

(assert (=> b!22821 (= condMapEmpty!1013 (= (arr!601 (_values!1726 (v!1597 (underlying!113 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!309)) mapDefault!1013)))))

(declare-fun mapIsEmpty!1013 () Bool)

(assert (=> mapIsEmpty!1013 mapRes!1013))

(assert (= (and start!3474 res!14243) b!22814))

(assert (= (and b!22814 c!2845) b!22816))

(assert (= (and b!22814 (not c!2845)) b!22811))

(assert (= (and b!22811 c!2846) b!22809))

(assert (= (and b!22811 (not c!2846)) b!22817))

(assert (= (and b!22817 c!2844) b!22815))

(assert (= (and b!22817 (not c!2844)) b!22810))

(assert (= (or b!22809 b!22815) bm!1738))

(assert (= (or b!22816 bm!1738) bm!1739))

(assert (= (and b!22814 res!14244) b!22820))

(assert (= (and b!22821 condMapEmpty!1013) mapIsEmpty!1013))

(assert (= (and b!22821 (not condMapEmpty!1013)) mapNonEmpty!1013))

(get-info :version)

(assert (= (and mapNonEmpty!1013 ((_ is ValueCellFull!309) mapValue!1013)) b!22819))

(assert (= (and b!22821 ((_ is ValueCellFull!309) mapDefault!1013)) b!22808))

(assert (= b!22813 b!22821))

(assert (= b!22818 b!22813))

(assert (= b!22812 b!22818))

(assert (= start!3474 b!22812))

(declare-fun m!16530 () Bool)

(assert (=> mapNonEmpty!1013 m!16530))

(declare-fun m!16532 () Bool)

(assert (=> b!22820 m!16532))

(declare-fun m!16534 () Bool)

(assert (=> start!3474 m!16534))

(declare-fun m!16536 () Bool)

(assert (=> bm!1739 m!16536))

(declare-fun m!16538 () Bool)

(assert (=> b!22813 m!16538))

(declare-fun m!16540 () Bool)

(assert (=> b!22813 m!16540))

(declare-fun m!16542 () Bool)

(assert (=> b!22814 m!16542))

(assert (=> b!22814 m!16542))

(declare-fun m!16544 () Bool)

(assert (=> b!22814 m!16544))

(declare-fun m!16546 () Bool)

(assert (=> b!22816 m!16546))

(check-sat (not b!22820) (not b_next!753) (not b!22814) (not bm!1739) (not start!3474) (not b!22816) (not b!22813) (not mapNonEmpty!1013) b_and!1471 tp_is_empty!1017)
(check-sat b_and!1471 (not b_next!753))
(get-model)

(declare-fun d!3967 () Bool)

(assert (=> d!3967 (= (validMask!0 (mask!4723 (v!1597 (underlying!113 thiss!938)))) (and (or (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000000000111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000000001111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000000011111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000000111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000001111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000011111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000001111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000011111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000001111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000011111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000001111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000011111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000001111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000011111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000111111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000001111111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000011111111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000111111111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000001111111111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000011111111111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000111111111111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00001111111111111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00011111111111111111111111111111) (= (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!22820 d!3967))

(declare-fun c!2889 () Bool)

(declare-datatypes ((tuple2!950 0))(
  ( (tuple2!951 (_1!484 (_ BitVec 64)) (_2!484 V!1181)) )
))
(declare-datatypes ((List!566 0))(
  ( (Nil!563) (Cons!562 (h!1128 tuple2!950) (t!3235 List!566)) )
))
(declare-datatypes ((ListLongMap!565 0))(
  ( (ListLongMap!566 (toList!298 List!566)) )
))
(declare-fun call!1800 () ListLongMap!565)

(declare-fun call!1820 () ListLongMap!565)

(declare-fun call!1804 () ListLongMap!565)

(declare-fun bm!1794 () Bool)

(declare-fun c!2885 () Bool)

(declare-fun +!44 (ListLongMap!565 tuple2!950) ListLongMap!565)

(assert (=> bm!1794 (= call!1804 (+!44 (ite c!2885 call!1820 call!1800) (ite c!2885 (ite c!2889 (tuple2!951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1663 (v!1597 (underlying!113 thiss!938)))) (tuple2!951 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))))) (tuple2!951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1663 (v!1597 (underlying!113 thiss!938)))))))))

(declare-fun b!22944 () Bool)

(declare-fun e!14921 () ListLongMap!565)

(declare-fun call!1810 () ListLongMap!565)

(assert (=> b!22944 (= e!14921 call!1810)))

(declare-fun bm!1796 () Bool)

(declare-datatypes ((Unit!501 0))(
  ( (Unit!502) )
))
(declare-fun call!1809 () Unit!501)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!9 (array!1271 array!1269 (_ BitVec 32) (_ BitVec 32) V!1181 V!1181 (_ BitVec 64) Int) Unit!501)

(assert (=> bm!1796 (= call!1809 (lemmaInListMapThenSeekEntryOrOpenFindsIt!9 (_keys!3161 lt!7921) (_values!1726 lt!7921) (mask!4723 lt!7921) (extraKeys!1638 lt!7921) (zeroValue!1663 lt!7921) (minValue!1663 lt!7921) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1739 lt!7921)))))

(declare-fun b!22945 () Bool)

(declare-fun e!14933 () Unit!501)

(declare-fun lt!8021 () Unit!501)

(assert (=> b!22945 (= e!14933 lt!8021)))

(assert (=> b!22945 (= lt!8021 call!1809)))

(declare-datatypes ((SeekEntryResult!53 0))(
  ( (MissingZero!53 (index!2333 (_ BitVec 32))) (Found!53 (index!2334 (_ BitVec 32))) (Intermediate!53 (undefined!865 Bool) (index!2335 (_ BitVec 32)) (x!5503 (_ BitVec 32))) (Undefined!53) (MissingVacant!53 (index!2336 (_ BitVec 32))) )
))
(declare-fun lt!8022 () SeekEntryResult!53)

(declare-fun call!1801 () SeekEntryResult!53)

(assert (=> b!22945 (= lt!8022 call!1801)))

(declare-fun res!14281 () Bool)

(assert (=> b!22945 (= res!14281 ((_ is Found!53) lt!8022))))

(declare-fun e!14923 () Bool)

(assert (=> b!22945 (=> (not res!14281) (not e!14923))))

(assert (=> b!22945 e!14923))

(declare-fun c!2893 () Bool)

(declare-fun bm!1797 () Bool)

(declare-fun c!2883 () Bool)

(declare-fun c!2894 () Bool)

(declare-fun lt!8000 () SeekEntryResult!53)

(declare-fun c!2891 () Bool)

(declare-fun c!2887 () Bool)

(declare-fun lt!8004 () SeekEntryResult!53)

(declare-fun call!1798 () Bool)

(declare-fun lt!8012 () SeekEntryResult!53)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1797 (= call!1798 (inRange!0 (ite c!2887 (ite c!2891 (index!2334 lt!8004) (ite c!2893 (index!2333 lt!8012) (index!2336 lt!8012))) (ite c!2894 (index!2334 lt!8022) (ite c!2883 (index!2333 lt!8000) (index!2336 lt!8000)))) (mask!4723 lt!7921)))))

(declare-fun bm!1798 () Bool)

(declare-fun call!1803 () Bool)

(assert (=> bm!1798 (= call!1803 call!1798)))

(declare-fun b!22946 () Bool)

(declare-fun e!14928 () Bool)

(assert (=> b!22946 (= e!14928 ((_ is Undefined!53) lt!8000))))

(declare-fun b!22947 () Bool)

(declare-fun lt!8018 () Unit!501)

(declare-fun lt!8005 () Unit!501)

(assert (=> b!22947 (= lt!8018 lt!8005)))

(declare-fun call!1806 () ListLongMap!565)

(declare-fun call!1807 () ListLongMap!565)

(assert (=> b!22947 (= call!1806 call!1807)))

(declare-fun lt!8024 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!9 (array!1271 array!1269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1181 V!1181 V!1181 Int) Unit!501)

(assert (=> b!22947 (= lt!8005 (lemmaChangeLongMinValueKeyThenAddPairToListMap!9 (_keys!3161 lt!7921) (_values!1726 lt!7921) (mask!4723 lt!7921) (extraKeys!1638 lt!7921) lt!8024 (zeroValue!1663 lt!7921) (minValue!1663 lt!7921) (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (defaultEntry!1739 lt!7921)))))

(assert (=> b!22947 (= lt!8024 (bvor (extraKeys!1638 lt!7921) #b00000000000000000000000000000010))))

(declare-fun e!14939 () tuple2!942)

(assert (=> b!22947 (= e!14939 (tuple2!943 true (LongMapFixedSize!205 (defaultEntry!1739 lt!7921) (mask!4723 lt!7921) (bvor (extraKeys!1638 lt!7921) #b00000000000000000000000000000010) (zeroValue!1663 lt!7921) (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (_size!146 lt!7921) (_keys!3161 lt!7921) (_values!1726 lt!7921) (_vacant!146 lt!7921))))))

(declare-fun b!22948 () Bool)

(declare-fun e!14922 () tuple2!942)

(declare-fun lt!8013 () tuple2!942)

(assert (=> b!22948 (= e!14922 (tuple2!943 (_1!480 lt!8013) (_2!480 lt!8013)))))

(declare-fun call!1817 () tuple2!942)

(assert (=> b!22948 (= lt!8013 call!1817)))

(declare-fun b!22949 () Bool)

(declare-fun e!14930 () Bool)

(declare-fun e!14929 () Bool)

(assert (=> b!22949 (= e!14930 e!14929)))

(declare-fun res!14291 () Bool)

(declare-fun call!1818 () ListLongMap!565)

(declare-fun contains!229 (ListLongMap!565 (_ BitVec 64)) Bool)

(assert (=> b!22949 (= res!14291 (contains!229 call!1818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22949 (=> (not res!14291) (not e!14929))))

(declare-fun bm!1795 () Bool)

(declare-fun call!1814 () Unit!501)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!9 (array!1271 array!1269 (_ BitVec 32) (_ BitVec 32) V!1181 V!1181 (_ BitVec 64) Int) Unit!501)

(assert (=> bm!1795 (= call!1814 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!9 (_keys!3161 lt!7921) (_values!1726 lt!7921) (mask!4723 lt!7921) (extraKeys!1638 lt!7921) (zeroValue!1663 lt!7921) (minValue!1663 lt!7921) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1739 lt!7921)))))

(declare-fun d!3969 () Bool)

(declare-fun e!14936 () Bool)

(assert (=> d!3969 e!14936))

(declare-fun res!14285 () Bool)

(assert (=> d!3969 (=> (not res!14285) (not e!14936))))

(declare-fun lt!8019 () tuple2!942)

(declare-fun valid!101 (LongMapFixedSize!204) Bool)

(assert (=> d!3969 (= res!14285 (valid!101 (_2!480 lt!8019)))))

(declare-fun e!14931 () tuple2!942)

(assert (=> d!3969 (= lt!8019 e!14931)))

(assert (=> d!3969 (= c!2885 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3969 (valid!101 lt!7921)))

(assert (=> d!3969 (= (update!30 lt!7921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1663 (v!1597 (underlying!113 thiss!938)))) lt!8019)))

(declare-fun b!22950 () Bool)

(assert (=> b!22950 (= e!14923 (= (select (arr!602 (_keys!3161 lt!7921)) (index!2334 lt!8022)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22951 () Bool)

(declare-fun c!2886 () Bool)

(assert (=> b!22951 (= c!2886 ((_ is MissingVacant!53) lt!8000))))

(declare-fun e!14941 () Bool)

(assert (=> b!22951 (= e!14941 e!14928)))

(declare-fun b!22952 () Bool)

(declare-fun e!14925 () Unit!501)

(declare-fun lt!8025 () Unit!501)

(assert (=> b!22952 (= e!14925 lt!8025)))

(assert (=> b!22952 (= lt!8025 call!1814)))

(declare-fun call!1812 () SeekEntryResult!53)

(assert (=> b!22952 (= lt!8012 call!1812)))

(assert (=> b!22952 (= c!2893 ((_ is MissingZero!53) lt!8012))))

(declare-fun e!14937 () Bool)

(assert (=> b!22952 e!14937))

(declare-fun b!22953 () Bool)

(declare-fun e!14935 () tuple2!942)

(assert (=> b!22953 (= e!14931 e!14935)))

(declare-fun lt!8009 () SeekEntryResult!53)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1271 (_ BitVec 32)) SeekEntryResult!53)

(assert (=> b!22953 (= lt!8009 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3161 lt!7921) (mask!4723 lt!7921)))))

(assert (=> b!22953 (= c!2887 ((_ is Undefined!53) lt!8009))))

(declare-fun b!22954 () Bool)

(declare-fun e!14924 () Bool)

(assert (=> b!22954 (= e!14928 e!14924)))

(declare-fun res!14280 () Bool)

(declare-fun call!1813 () Bool)

(assert (=> b!22954 (= res!14280 call!1813)))

(assert (=> b!22954 (=> (not res!14280) (not e!14924))))

(declare-fun bm!1799 () Bool)

(declare-fun call!1808 () Bool)

(declare-fun call!1816 () Bool)

(assert (=> bm!1799 (= call!1808 call!1816)))

(declare-fun bm!1800 () Bool)

(declare-fun call!1819 () SeekEntryResult!53)

(assert (=> bm!1800 (= call!1819 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3161 lt!7921) (mask!4723 lt!7921)))))

(declare-fun bm!1801 () Bool)

(assert (=> bm!1801 (= call!1812 call!1819)))

(declare-fun bm!1802 () Bool)

(declare-fun call!1805 () ListLongMap!565)

(assert (=> bm!1802 (= call!1810 call!1805)))

(declare-fun bm!1803 () Bool)

(declare-fun call!1797 () Bool)

(declare-fun call!1815 () Bool)

(assert (=> bm!1803 (= call!1797 call!1815)))

(declare-fun b!22955 () Bool)

(assert (=> b!22955 (= e!14931 e!14939)))

(assert (=> b!22955 (= c!2889 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22956 () Bool)

(declare-fun res!14292 () Bool)

(assert (=> b!22956 (= res!14292 call!1816)))

(declare-fun e!14934 () Bool)

(assert (=> b!22956 (=> (not res!14292) (not e!14934))))

(declare-fun b!22957 () Bool)

(declare-fun lt!8007 () Unit!501)

(declare-fun lt!8010 () Unit!501)

(assert (=> b!22957 (= lt!8007 lt!8010)))

(assert (=> b!22957 (= call!1806 call!1807)))

(declare-fun lt!8001 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!9 (array!1271 array!1269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1181 V!1181 V!1181 Int) Unit!501)

(assert (=> b!22957 (= lt!8010 (lemmaChangeZeroKeyThenAddPairToListMap!9 (_keys!3161 lt!7921) (_values!1726 lt!7921) (mask!4723 lt!7921) (extraKeys!1638 lt!7921) lt!8001 (zeroValue!1663 lt!7921) (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 lt!7921) (defaultEntry!1739 lt!7921)))))

(assert (=> b!22957 (= lt!8001 (bvor (extraKeys!1638 lt!7921) #b00000000000000000000000000000001))))

(assert (=> b!22957 (= e!14939 (tuple2!943 true (LongMapFixedSize!205 (defaultEntry!1739 lt!7921) (mask!4723 lt!7921) (bvor (extraKeys!1638 lt!7921) #b00000000000000000000000000000001) (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 lt!7921) (_size!146 lt!7921) (_keys!3161 lt!7921) (_values!1726 lt!7921) (_vacant!146 lt!7921))))))

(declare-fun c!2884 () Bool)

(declare-fun bm!1804 () Bool)

(declare-fun updateHelperNewKey!9 (LongMapFixedSize!204 (_ BitVec 64) V!1181 (_ BitVec 32)) tuple2!942)

(assert (=> bm!1804 (= call!1817 (updateHelperNewKey!9 lt!7921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2884 (index!2336 lt!8009) (index!2333 lt!8009))))))

(declare-fun bm!1805 () Bool)

(assert (=> bm!1805 (= call!1806 call!1804)))

(declare-fun bm!1806 () Bool)

(assert (=> bm!1806 (= call!1801 call!1819)))

(declare-fun b!22958 () Bool)

(declare-fun call!1811 () Bool)

(assert (=> b!22958 (= e!14924 (not call!1811))))

(declare-fun b!22959 () Bool)

(declare-fun e!14926 () Bool)

(declare-fun e!14938 () Bool)

(assert (=> b!22959 (= e!14926 e!14938)))

(declare-fun res!14287 () Bool)

(assert (=> b!22959 (= res!14287 call!1808)))

(assert (=> b!22959 (=> (not res!14287) (not e!14938))))

(declare-fun b!22960 () Bool)

(declare-fun res!14283 () Bool)

(declare-fun e!14932 () Bool)

(assert (=> b!22960 (=> (not res!14283) (not e!14932))))

(assert (=> b!22960 (= res!14283 (= (select (arr!602 (_keys!3161 lt!7921)) (index!2333 lt!8000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1807 () Bool)

(declare-fun arrayContainsKey!0 (array!1271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1807 (= call!1815 (arrayContainsKey!0 (_keys!3161 lt!7921) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!22961 () Bool)

(declare-fun res!14282 () Bool)

(declare-fun e!14927 () Bool)

(assert (=> b!22961 (=> (not res!14282) (not e!14927))))

(assert (=> b!22961 (= res!14282 (= (select (arr!602 (_keys!3161 lt!7921)) (index!2333 lt!8012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22962 () Bool)

(declare-fun Unit!503 () Unit!501)

(assert (=> b!22962 (= e!14925 Unit!503)))

(declare-fun lt!8020 () Unit!501)

(assert (=> b!22962 (= lt!8020 call!1809)))

(assert (=> b!22962 (= lt!8004 call!1812)))

(declare-fun res!14286 () Bool)

(assert (=> b!22962 (= res!14286 ((_ is Found!53) lt!8004))))

(assert (=> b!22962 (=> (not res!14286) (not e!14934))))

(assert (=> b!22962 e!14934))

(declare-fun lt!8014 () Unit!501)

(assert (=> b!22962 (= lt!8014 lt!8020)))

(assert (=> b!22962 false))

(declare-fun b!22963 () Bool)

(declare-fun e!14940 () tuple2!942)

(assert (=> b!22963 (= e!14922 e!14940)))

(declare-fun c!2888 () Bool)

(assert (=> b!22963 (= c!2888 ((_ is MissingZero!53) lt!8009))))

(declare-fun b!22964 () Bool)

(declare-fun res!14289 () Bool)

(assert (=> b!22964 (=> (not res!14289) (not e!14932))))

(assert (=> b!22964 (= res!14289 call!1813)))

(assert (=> b!22964 (= e!14941 e!14932)))

(declare-fun b!22965 () Bool)

(declare-fun lt!8023 () tuple2!942)

(assert (=> b!22965 (= lt!8023 call!1817)))

(assert (=> b!22965 (= e!14940 (tuple2!943 (_1!480 lt!8023) (_2!480 lt!8023)))))

(declare-fun bm!1808 () Bool)

(assert (=> bm!1808 (= call!1820 call!1805)))

(declare-fun b!22966 () Bool)

(assert (=> b!22966 (= e!14936 e!14930)))

(declare-fun c!2892 () Bool)

(assert (=> b!22966 (= c!2892 (_1!480 lt!8019))))

(declare-fun b!22967 () Bool)

(assert (=> b!22967 (= e!14932 (not call!1811))))

(declare-fun b!22968 () Bool)

(declare-fun res!14290 () Bool)

(assert (=> b!22968 (=> (not res!14290) (not e!14927))))

(assert (=> b!22968 (= res!14290 call!1808)))

(assert (=> b!22968 (= e!14937 e!14927)))

(declare-fun b!22969 () Bool)

(assert (=> b!22969 (= c!2884 ((_ is MissingVacant!53) lt!8009))))

(assert (=> b!22969 (= e!14935 e!14922)))

(declare-fun bm!1809 () Bool)

(assert (=> bm!1809 (= call!1811 call!1815)))

(declare-fun b!22970 () Bool)

(declare-fun res!14279 () Bool)

(assert (=> b!22970 (= res!14279 call!1803)))

(assert (=> b!22970 (=> (not res!14279) (not e!14923))))

(declare-fun call!1802 () ListLongMap!565)

(declare-fun b!22971 () Bool)

(assert (=> b!22971 (= e!14929 (= call!1818 (+!44 call!1802 (tuple2!951 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1663 (v!1597 (underlying!113 thiss!938)))))))))

(declare-fun b!22972 () Bool)

(declare-fun Unit!504 () Unit!501)

(assert (=> b!22972 (= e!14933 Unit!504)))

(declare-fun lt!8017 () Unit!501)

(assert (=> b!22972 (= lt!8017 call!1814)))

(assert (=> b!22972 (= lt!8000 call!1801)))

(assert (=> b!22972 (= c!2883 ((_ is MissingZero!53) lt!8000))))

(assert (=> b!22972 e!14941))

(declare-fun lt!8003 () Unit!501)

(assert (=> b!22972 (= lt!8003 lt!8017)))

(assert (=> b!22972 false))

(declare-fun bm!1810 () Bool)

(declare-fun map!404 (LongMapFixedSize!204) ListLongMap!565)

(assert (=> bm!1810 (= call!1818 (map!404 (_2!480 lt!8019)))))

(declare-fun b!22973 () Bool)

(declare-fun c!2890 () Bool)

(assert (=> b!22973 (= c!2890 ((_ is MissingVacant!53) lt!8012))))

(assert (=> b!22973 (= e!14937 e!14926)))

(declare-fun bm!1811 () Bool)

(assert (=> bm!1811 (= call!1816 call!1798)))

(declare-fun bm!1812 () Bool)

(assert (=> bm!1812 (= call!1802 (map!404 lt!7921))))

(declare-fun b!22974 () Bool)

(assert (=> b!22974 (= e!14938 (not call!1797))))

(declare-fun b!22975 () Bool)

(assert (=> b!22975 (= e!14930 (= call!1818 call!1802))))

(declare-fun b!22976 () Bool)

(declare-fun lt!8016 () Unit!501)

(assert (=> b!22976 (= lt!8016 e!14925)))

(declare-fun call!1799 () Bool)

(assert (=> b!22976 (= c!2891 call!1799)))

(assert (=> b!22976 (= e!14935 (tuple2!943 false lt!7921))))

(declare-fun b!22977 () Bool)

(assert (=> b!22977 (= e!14926 ((_ is Undefined!53) lt!8012))))

(declare-fun b!22978 () Bool)

(declare-fun res!14284 () Bool)

(assert (=> b!22978 (= res!14284 (= (select (arr!602 (_keys!3161 lt!7921)) (index!2336 lt!8012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22978 (=> (not res!14284) (not e!14938))))

(declare-fun b!22979 () Bool)

(assert (=> b!22979 (= e!14927 (not call!1797))))

(declare-fun b!22980 () Bool)

(declare-fun lt!7999 () Unit!501)

(declare-fun lt!8015 () Unit!501)

(assert (=> b!22980 (= lt!7999 lt!8015)))

(assert (=> b!22980 call!1799))

(declare-fun lt!8002 () array!1269)

(declare-fun lemmaValidKeyInArrayIsInListMap!9 (array!1271 array!1269 (_ BitVec 32) (_ BitVec 32) V!1181 V!1181 (_ BitVec 32) Int) Unit!501)

(assert (=> b!22980 (= lt!8015 (lemmaValidKeyInArrayIsInListMap!9 (_keys!3161 lt!7921) lt!8002 (mask!4723 lt!7921) (extraKeys!1638 lt!7921) (zeroValue!1663 lt!7921) (minValue!1663 lt!7921) (index!2334 lt!8009) (defaultEntry!1739 lt!7921)))))

(assert (=> b!22980 (= lt!8002 (array!1270 (store (arr!601 (_values!1726 lt!7921)) (index!2334 lt!8009) (ValueCellFull!309 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))))) (size!697 (_values!1726 lt!7921))))))

(declare-fun lt!8008 () Unit!501)

(declare-fun lt!8006 () Unit!501)

(assert (=> b!22980 (= lt!8008 lt!8006)))

(assert (=> b!22980 (= call!1804 call!1810)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!9 (array!1271 array!1269 (_ BitVec 32) (_ BitVec 32) V!1181 V!1181 (_ BitVec 32) (_ BitVec 64) V!1181 Int) Unit!501)

(assert (=> b!22980 (= lt!8006 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!9 (_keys!3161 lt!7921) (_values!1726 lt!7921) (mask!4723 lt!7921) (extraKeys!1638 lt!7921) (zeroValue!1663 lt!7921) (minValue!1663 lt!7921) (index!2334 lt!8009) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (defaultEntry!1739 lt!7921)))))

(declare-fun lt!8011 () Unit!501)

(assert (=> b!22980 (= lt!8011 e!14933)))

(assert (=> b!22980 (= c!2894 (contains!229 call!1800 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22980 (= e!14940 (tuple2!943 true (LongMapFixedSize!205 (defaultEntry!1739 lt!7921) (mask!4723 lt!7921) (extraKeys!1638 lt!7921) (zeroValue!1663 lt!7921) (minValue!1663 lt!7921) (_size!146 lt!7921) (_keys!3161 lt!7921) (array!1270 (store (arr!601 (_values!1726 lt!7921)) (index!2334 lt!8009) (ValueCellFull!309 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))))) (size!697 (_values!1726 lt!7921))) (_vacant!146 lt!7921))))))

(declare-fun bm!1813 () Bool)

(assert (=> bm!1813 (= call!1813 call!1803)))

(declare-fun b!22981 () Bool)

(declare-fun res!14288 () Bool)

(assert (=> b!22981 (= res!14288 (= (select (arr!602 (_keys!3161 lt!7921)) (index!2336 lt!8000)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22981 (=> (not res!14288) (not e!14924))))

(declare-fun bm!1814 () Bool)

(declare-fun getCurrentListMap!129 (array!1271 array!1269 (_ BitVec 32) (_ BitVec 32) V!1181 V!1181 (_ BitVec 32) Int) ListLongMap!565)

(assert (=> bm!1814 (= call!1800 (getCurrentListMap!129 (_keys!3161 lt!7921) (_values!1726 lt!7921) (mask!4723 lt!7921) (ite c!2885 (ite c!2889 lt!8001 lt!8024) (extraKeys!1638 lt!7921)) (ite (and c!2885 c!2889) (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (zeroValue!1663 lt!7921)) (ite c!2885 (ite c!2889 (minValue!1663 lt!7921) (zeroValue!1663 (v!1597 (underlying!113 thiss!938)))) (minValue!1663 lt!7921)) #b00000000000000000000000000000000 (defaultEntry!1739 lt!7921)))))

(declare-fun b!22982 () Bool)

(assert (=> b!22982 (= e!14921 (getCurrentListMap!129 (_keys!3161 lt!7921) lt!8002 (mask!4723 lt!7921) (extraKeys!1638 lt!7921) (zeroValue!1663 lt!7921) (minValue!1663 lt!7921) #b00000000000000000000000000000000 (defaultEntry!1739 lt!7921)))))

(declare-fun b!22983 () Bool)

(assert (=> b!22983 (= e!14934 (= (select (arr!602 (_keys!3161 lt!7921)) (index!2334 lt!8004)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1815 () Bool)

(assert (=> bm!1815 (= call!1805 (getCurrentListMap!129 (_keys!3161 lt!7921) (ite (or c!2885 c!2887) (_values!1726 lt!7921) (array!1270 (store (arr!601 (_values!1726 lt!7921)) (index!2334 lt!8009) (ValueCellFull!309 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))))) (size!697 (_values!1726 lt!7921)))) (mask!4723 lt!7921) (extraKeys!1638 lt!7921) (zeroValue!1663 lt!7921) (minValue!1663 lt!7921) #b00000000000000000000000000000000 (defaultEntry!1739 lt!7921)))))

(declare-fun bm!1816 () Bool)

(assert (=> bm!1816 (= call!1807 call!1800)))

(declare-fun bm!1817 () Bool)

(declare-fun c!2882 () Bool)

(assert (=> bm!1817 (= c!2882 c!2887)))

(assert (=> bm!1817 (= call!1799 (contains!229 e!14921 (ite c!2887 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!602 (_keys!3161 lt!7921)) (index!2334 lt!8009)))))))

(assert (= (and d!3969 c!2885) b!22955))

(assert (= (and d!3969 (not c!2885)) b!22953))

(assert (= (and b!22955 c!2889) b!22957))

(assert (= (and b!22955 (not c!2889)) b!22947))

(assert (= (or b!22957 b!22947) bm!1816))

(assert (= (or b!22957 b!22947) bm!1808))

(assert (= (or b!22957 b!22947) bm!1805))

(assert (= (and b!22953 c!2887) b!22976))

(assert (= (and b!22953 (not c!2887)) b!22969))

(assert (= (and b!22976 c!2891) b!22962))

(assert (= (and b!22976 (not c!2891)) b!22952))

(assert (= (and b!22962 res!14286) b!22956))

(assert (= (and b!22956 res!14292) b!22983))

(assert (= (and b!22952 c!2893) b!22968))

(assert (= (and b!22952 (not c!2893)) b!22973))

(assert (= (and b!22968 res!14290) b!22961))

(assert (= (and b!22961 res!14282) b!22979))

(assert (= (and b!22973 c!2890) b!22959))

(assert (= (and b!22973 (not c!2890)) b!22977))

(assert (= (and b!22959 res!14287) b!22978))

(assert (= (and b!22978 res!14284) b!22974))

(assert (= (or b!22968 b!22959) bm!1799))

(assert (= (or b!22979 b!22974) bm!1803))

(assert (= (or b!22956 bm!1799) bm!1811))

(assert (= (or b!22962 b!22952) bm!1801))

(assert (= (and b!22969 c!2884) b!22948))

(assert (= (and b!22969 (not c!2884)) b!22963))

(assert (= (and b!22963 c!2888) b!22965))

(assert (= (and b!22963 (not c!2888)) b!22980))

(assert (= (and b!22980 c!2894) b!22945))

(assert (= (and b!22980 (not c!2894)) b!22972))

(assert (= (and b!22945 res!14281) b!22970))

(assert (= (and b!22970 res!14279) b!22950))

(assert (= (and b!22972 c!2883) b!22964))

(assert (= (and b!22972 (not c!2883)) b!22951))

(assert (= (and b!22964 res!14289) b!22960))

(assert (= (and b!22960 res!14283) b!22967))

(assert (= (and b!22951 c!2886) b!22954))

(assert (= (and b!22951 (not c!2886)) b!22946))

(assert (= (and b!22954 res!14280) b!22981))

(assert (= (and b!22981 res!14288) b!22958))

(assert (= (or b!22964 b!22954) bm!1813))

(assert (= (or b!22967 b!22958) bm!1809))

(assert (= (or b!22970 bm!1813) bm!1798))

(assert (= (or b!22945 b!22972) bm!1806))

(assert (= (or b!22948 b!22965) bm!1804))

(assert (= (or b!22962 b!22945) bm!1796))

(assert (= (or bm!1803 bm!1809) bm!1807))

(assert (= (or b!22976 b!22980) bm!1802))

(assert (= (or bm!1801 bm!1806) bm!1800))

(assert (= (or b!22952 b!22972) bm!1795))

(assert (= (or bm!1811 bm!1798) bm!1797))

(assert (= (or b!22976 b!22980) bm!1817))

(assert (= (and bm!1817 c!2882) b!22944))

(assert (= (and bm!1817 (not c!2882)) b!22982))

(assert (= (or bm!1808 bm!1802) bm!1815))

(assert (= (or bm!1816 b!22980) bm!1814))

(assert (= (or bm!1805 b!22980) bm!1794))

(assert (= (and d!3969 res!14285) b!22966))

(assert (= (and b!22966 c!2892) b!22949))

(assert (= (and b!22966 (not c!2892)) b!22975))

(assert (= (and b!22949 res!14291) b!22971))

(assert (= (or b!22971 b!22975) bm!1812))

(assert (= (or b!22949 b!22971 b!22975) bm!1810))

(declare-fun m!16566 () Bool)

(assert (=> b!22981 m!16566))

(declare-fun m!16568 () Bool)

(assert (=> b!22961 m!16568))

(declare-fun m!16570 () Bool)

(assert (=> b!22953 m!16570))

(declare-fun m!16572 () Bool)

(assert (=> bm!1810 m!16572))

(declare-fun m!16574 () Bool)

(assert (=> d!3969 m!16574))

(declare-fun m!16576 () Bool)

(assert (=> d!3969 m!16576))

(declare-fun m!16578 () Bool)

(assert (=> bm!1817 m!16578))

(declare-fun m!16580 () Bool)

(assert (=> bm!1817 m!16580))

(declare-fun m!16582 () Bool)

(assert (=> bm!1797 m!16582))

(declare-fun m!16584 () Bool)

(assert (=> bm!1804 m!16584))

(assert (=> bm!1800 m!16570))

(declare-fun m!16586 () Bool)

(assert (=> bm!1795 m!16586))

(declare-fun m!16588 () Bool)

(assert (=> bm!1815 m!16588))

(declare-fun m!16590 () Bool)

(assert (=> bm!1815 m!16590))

(declare-fun m!16592 () Bool)

(assert (=> b!22947 m!16592))

(declare-fun m!16594 () Bool)

(assert (=> b!22971 m!16594))

(declare-fun m!16596 () Bool)

(assert (=> b!22978 m!16596))

(declare-fun m!16598 () Bool)

(assert (=> b!22982 m!16598))

(declare-fun m!16600 () Bool)

(assert (=> b!22949 m!16600))

(declare-fun m!16602 () Bool)

(assert (=> b!22960 m!16602))

(declare-fun m!16604 () Bool)

(assert (=> bm!1812 m!16604))

(declare-fun m!16606 () Bool)

(assert (=> bm!1794 m!16606))

(declare-fun m!16608 () Bool)

(assert (=> bm!1814 m!16608))

(declare-fun m!16610 () Bool)

(assert (=> b!22950 m!16610))

(declare-fun m!16612 () Bool)

(assert (=> b!22983 m!16612))

(declare-fun m!16614 () Bool)

(assert (=> bm!1807 m!16614))

(declare-fun m!16616 () Bool)

(assert (=> bm!1796 m!16616))

(declare-fun m!16618 () Bool)

(assert (=> b!22980 m!16618))

(assert (=> b!22980 m!16588))

(declare-fun m!16620 () Bool)

(assert (=> b!22980 m!16620))

(declare-fun m!16622 () Bool)

(assert (=> b!22980 m!16622))

(declare-fun m!16624 () Bool)

(assert (=> b!22957 m!16624))

(assert (=> b!22816 d!3969))

(declare-fun b!22996 () Bool)

(declare-fun e!14948 () Bool)

(declare-fun lt!8094 () LongMapFixedSize!204)

(assert (=> b!22996 (= e!14948 (= (map!404 lt!8094) (ListLongMap!566 Nil!563)))))

(declare-fun b!22997 () Bool)

(declare-fun e!14949 () Bool)

(declare-fun lt!8092 () tuple2!950)

(declare-fun lt!8085 () (_ BitVec 32))

(assert (=> b!22997 (= e!14949 (ite (= (_1!484 lt!8092) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!8085 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!8085 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3971 () Bool)

(assert (=> d!3971 e!14948))

(declare-fun res!14297 () Bool)

(assert (=> d!3971 (=> (not res!14297) (not e!14948))))

(assert (=> d!3971 (= res!14297 (valid!101 lt!8094))))

(declare-fun lt!8078 () LongMapFixedSize!204)

(assert (=> d!3971 (= lt!8094 lt!8078)))

(declare-fun lt!8072 () Unit!501)

(declare-fun e!14950 () Unit!501)

(assert (=> d!3971 (= lt!8072 e!14950)))

(declare-fun c!2900 () Bool)

(assert (=> d!3971 (= c!2900 (not (= (map!404 lt!8078) (ListLongMap!566 Nil!563))))))

(declare-fun lt!8079 () Unit!501)

(declare-fun lt!8083 () Unit!501)

(assert (=> d!3971 (= lt!8079 lt!8083)))

(declare-fun lt!8077 () array!1271)

(declare-fun lt!8088 () (_ BitVec 32))

(declare-datatypes ((List!567 0))(
  ( (Nil!564) (Cons!563 (h!1129 (_ BitVec 64)) (t!3236 List!567)) )
))
(declare-fun lt!8081 () List!567)

(declare-fun arrayNoDuplicates!0 (array!1271 (_ BitVec 32) List!567) Bool)

(assert (=> d!3971 (arrayNoDuplicates!0 lt!8077 lt!8088 lt!8081)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1271 (_ BitVec 32) (_ BitVec 32) List!567) Unit!501)

(assert (=> d!3971 (= lt!8083 (lemmaArrayNoDuplicatesInAll0Array!0 lt!8077 lt!8088 (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001) lt!8081))))

(assert (=> d!3971 (= lt!8081 Nil!564)))

(assert (=> d!3971 (= lt!8088 #b00000000000000000000000000000000)))

(assert (=> d!3971 (= lt!8077 (array!1272 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!8076 () Unit!501)

(declare-fun lt!8082 () Unit!501)

(assert (=> d!3971 (= lt!8076 lt!8082)))

(declare-fun lt!8084 () (_ BitVec 32))

(declare-fun lt!8089 () array!1271)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1271 (_ BitVec 32)) Bool)

(assert (=> d!3971 (arrayForallSeekEntryOrOpenFound!0 lt!8084 lt!8089 (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1271 (_ BitVec 32) (_ BitVec 32)) Unit!501)

(assert (=> d!3971 (= lt!8082 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!8089 (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) lt!8084))))

(assert (=> d!3971 (= lt!8084 #b00000000000000000000000000000000)))

(assert (=> d!3971 (= lt!8089 (array!1272 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!8090 () Unit!501)

(declare-fun lt!8074 () Unit!501)

(assert (=> d!3971 (= lt!8090 lt!8074)))

(declare-fun lt!8086 () array!1271)

(declare-fun lt!8080 () (_ BitVec 32))

(declare-fun lt!8087 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1271 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3971 (= (arrayCountValidKeys!0 lt!8086 lt!8080 lt!8087) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1271 (_ BitVec 32) (_ BitVec 32)) Unit!501)

(assert (=> d!3971 (= lt!8074 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!8086 lt!8080 lt!8087))))

(assert (=> d!3971 (= lt!8087 (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3971 (= lt!8080 #b00000000000000000000000000000000)))

(assert (=> d!3971 (= lt!8086 (array!1272 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!143 (Int (_ BitVec 64)) V!1181)

(assert (=> d!3971 (= lt!8078 (LongMapFixedSize!205 (defaultEntry!1739 (v!1597 (underlying!113 thiss!938))) (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!143 (defaultEntry!1739 (v!1597 (underlying!113 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!143 (defaultEntry!1739 (v!1597 (underlying!113 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1272 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001)) (array!1270 ((as const (Array (_ BitVec 32) ValueCell!309)) EmptyCell!309) (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3971 (validMask!0 (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))))))

(assert (=> d!3971 (= (getNewLongMapFixedSize!31 (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) (defaultEntry!1739 (v!1597 (underlying!113 thiss!938)))) lt!8094)))

(declare-fun b!22998 () Bool)

(declare-fun lt!8075 () array!1271)

(assert (=> b!22998 (= e!14949 (arrayContainsKey!0 lt!8075 (_1!484 lt!8092) #b00000000000000000000000000000000))))

(declare-fun b!22999 () Bool)

(declare-fun Unit!505 () Unit!501)

(assert (=> b!22999 (= e!14950 Unit!505)))

(declare-fun head!829 (List!566) tuple2!950)

(assert (=> b!22999 (= lt!8092 (head!829 (toList!298 (map!404 lt!8078))))))

(assert (=> b!22999 (= lt!8075 (array!1272 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22999 (= lt!8085 #b00000000000000000000000000000000)))

(declare-fun lt!8073 () Unit!501)

(declare-fun lemmaKeyInListMapIsInArray!90 (array!1271 array!1269 (_ BitVec 32) (_ BitVec 32) V!1181 V!1181 (_ BitVec 64) Int) Unit!501)

(assert (=> b!22999 (= lt!8073 (lemmaKeyInListMapIsInArray!90 lt!8075 (array!1270 ((as const (Array (_ BitVec 32) ValueCell!309)) EmptyCell!309) (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) lt!8085 (dynLambda!143 (defaultEntry!1739 (v!1597 (underlying!113 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!143 (defaultEntry!1739 (v!1597 (underlying!113 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!484 lt!8092) (defaultEntry!1739 (v!1597 (underlying!113 thiss!938)))))))

(declare-fun c!2899 () Bool)

(assert (=> b!22999 (= c!2899 (and (not (= (_1!484 lt!8092) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!484 lt!8092) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22999 e!14949))

(declare-fun lt!8091 () Unit!501)

(assert (=> b!22999 (= lt!8091 lt!8073)))

(declare-fun lt!8093 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1271 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22999 (= lt!8093 (arrayScanForKey!0 (array!1272 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000001)) (_1!484 lt!8092) #b00000000000000000000000000000000))))

(assert (=> b!22999 false))

(declare-fun b!23000 () Bool)

(declare-fun Unit!506 () Unit!501)

(assert (=> b!23000 (= e!14950 Unit!506)))

(declare-fun b!23001 () Bool)

(declare-fun res!14298 () Bool)

(assert (=> b!23001 (=> (not res!14298) (not e!14948))))

(assert (=> b!23001 (= res!14298 (= (mask!4723 lt!8094) (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938))))))))

(assert (= (and d!3971 c!2900) b!22999))

(assert (= (and d!3971 (not c!2900)) b!23000))

(assert (= (and b!22999 c!2899) b!22998))

(assert (= (and b!22999 (not c!2899)) b!22997))

(assert (= (and d!3971 res!14297) b!23001))

(assert (= (and b!23001 res!14298) b!22996))

(declare-fun b_lambda!1567 () Bool)

(assert (=> (not b_lambda!1567) (not d!3971)))

(declare-fun t!3234 () Bool)

(declare-fun tb!655 () Bool)

(assert (=> (and b!22813 (= (defaultEntry!1739 (v!1597 (underlying!113 thiss!938))) (defaultEntry!1739 (v!1597 (underlying!113 thiss!938)))) t!3234) tb!655))

(declare-fun result!1087 () Bool)

(assert (=> tb!655 (= result!1087 tp_is_empty!1017)))

(assert (=> d!3971 t!3234))

(declare-fun b_and!1475 () Bool)

(assert (= b_and!1471 (and (=> t!3234 result!1087) b_and!1475)))

(declare-fun b_lambda!1569 () Bool)

(assert (=> (not b_lambda!1569) (not b!22999)))

(assert (=> b!22999 t!3234))

(declare-fun b_and!1477 () Bool)

(assert (= b_and!1475 (and (=> t!3234 result!1087) b_and!1477)))

(declare-fun m!16626 () Bool)

(assert (=> b!22996 m!16626))

(declare-fun m!16628 () Bool)

(assert (=> d!3971 m!16628))

(declare-fun m!16630 () Bool)

(assert (=> d!3971 m!16630))

(declare-fun m!16632 () Bool)

(assert (=> d!3971 m!16632))

(assert (=> d!3971 m!16542))

(declare-fun m!16634 () Bool)

(assert (=> d!3971 m!16634))

(declare-fun m!16636 () Bool)

(assert (=> d!3971 m!16636))

(declare-fun m!16638 () Bool)

(assert (=> d!3971 m!16638))

(assert (=> d!3971 m!16542))

(declare-fun m!16640 () Bool)

(assert (=> d!3971 m!16640))

(declare-fun m!16642 () Bool)

(assert (=> d!3971 m!16642))

(declare-fun m!16644 () Bool)

(assert (=> d!3971 m!16644))

(assert (=> d!3971 m!16542))

(declare-fun m!16646 () Bool)

(assert (=> d!3971 m!16646))

(declare-fun m!16648 () Bool)

(assert (=> b!22998 m!16648))

(declare-fun m!16650 () Bool)

(assert (=> b!22999 m!16650))

(assert (=> b!22999 m!16628))

(assert (=> b!22999 m!16638))

(declare-fun m!16652 () Bool)

(assert (=> b!22999 m!16652))

(assert (=> b!22999 m!16542))

(assert (=> b!22999 m!16638))

(assert (=> b!22999 m!16638))

(declare-fun m!16654 () Bool)

(assert (=> b!22999 m!16654))

(assert (=> b!22814 d!3971))

(declare-fun d!3973 () Bool)

(declare-fun e!14956 () Bool)

(assert (=> d!3973 e!14956))

(declare-fun res!14301 () Bool)

(assert (=> d!3973 (=> (not res!14301) (not e!14956))))

(declare-fun lt!8100 () (_ BitVec 32))

(assert (=> d!3973 (= res!14301 (validMask!0 lt!8100))))

(declare-datatypes ((tuple2!952 0))(
  ( (tuple2!953 (_1!485 Unit!501) (_2!485 (_ BitVec 32))) )
))
(declare-fun e!14955 () tuple2!952)

(assert (=> d!3973 (= lt!8100 (_2!485 e!14955))))

(declare-fun c!2903 () Bool)

(declare-fun lt!8099 () tuple2!952)

(assert (=> d!3973 (= c!2903 (and (bvsgt (_2!485 lt!8099) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!146 (v!1597 (underlying!113 thiss!938)))) (_2!485 lt!8099)) (bvsge (bvadd (bvand (bvashr (_2!485 lt!8099) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!146 (v!1597 (underlying!113 thiss!938))))))))

(declare-fun Unit!507 () Unit!501)

(declare-fun Unit!508 () Unit!501)

(assert (=> d!3973 (= lt!8099 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!146 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))))) (mask!4723 (v!1597 (underlying!113 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!146 (v!1597 (underlying!113 thiss!938)))) (mask!4723 (v!1597 (underlying!113 thiss!938))))) (tuple2!953 Unit!507 (bvand (bvadd (bvshl (mask!4723 (v!1597 (underlying!113 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!953 Unit!508 (mask!4723 (v!1597 (underlying!113 thiss!938))))))))

(assert (=> d!3973 (validMask!0 (mask!4723 (v!1597 (underlying!113 thiss!938))))))

(assert (=> d!3973 (= (computeNewMask!27 thiss!938 (mask!4723 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (_size!146 (v!1597 (underlying!113 thiss!938)))) lt!8100)))

(declare-fun b!23010 () Bool)

(declare-fun computeNewMaskWhile!13 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!952)

(assert (=> b!23010 (= e!14955 (computeNewMaskWhile!13 (_size!146 (v!1597 (underlying!113 thiss!938))) (_vacant!146 (v!1597 (underlying!113 thiss!938))) (mask!4723 (v!1597 (underlying!113 thiss!938))) (_2!485 lt!8099)))))

(declare-fun b!23011 () Bool)

(declare-fun Unit!509 () Unit!501)

(assert (=> b!23011 (= e!14955 (tuple2!953 Unit!509 (_2!485 lt!8099)))))

(declare-fun b!23012 () Bool)

(assert (=> b!23012 (= e!14956 (bvsle (_size!146 (v!1597 (underlying!113 thiss!938))) (bvadd lt!8100 #b00000000000000000000000000000001)))))

(assert (= (and d!3973 c!2903) b!23010))

(assert (= (and d!3973 (not c!2903)) b!23011))

(assert (= (and d!3973 res!14301) b!23012))

(declare-fun m!16656 () Bool)

(assert (=> d!3973 m!16656))

(assert (=> d!3973 m!16532))

(declare-fun m!16658 () Bool)

(assert (=> b!23010 m!16658))

(assert (=> b!22814 d!3973))

(declare-fun d!3975 () Bool)

(assert (=> d!3975 (= (valid!100 thiss!938) (valid!101 (v!1597 (underlying!113 thiss!938))))))

(declare-fun bs!945 () Bool)

(assert (= bs!945 d!3975))

(declare-fun m!16660 () Bool)

(assert (=> bs!945 m!16660))

(assert (=> start!3474 d!3975))

(declare-fun c!2911 () Bool)

(declare-fun call!1828 () ListLongMap!565)

(declare-fun call!1824 () ListLongMap!565)

(declare-fun bm!1818 () Bool)

(declare-fun c!2907 () Bool)

(declare-fun call!1844 () ListLongMap!565)

(assert (=> bm!1818 (= call!1828 (+!44 (ite c!2907 call!1844 call!1824) (ite c!2907 (ite c!2911 (tuple2!951 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938)))))) (tuple2!951 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))))) (tuple2!951 (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938)))))))))))

(declare-fun b!23013 () Bool)

(declare-fun e!14957 () ListLongMap!565)

(declare-fun call!1834 () ListLongMap!565)

(assert (=> b!23013 (= e!14957 call!1834)))

(declare-fun call!1833 () Unit!501)

(declare-fun bm!1820 () Bool)

(assert (=> bm!1820 (= call!1833 (lemmaInListMapThenSeekEntryOrOpenFindsIt!9 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(declare-fun b!23014 () Bool)

(declare-fun e!14969 () Unit!501)

(declare-fun lt!8123 () Unit!501)

(assert (=> b!23014 (= e!14969 lt!8123)))

(assert (=> b!23014 (= lt!8123 call!1833)))

(declare-fun lt!8124 () SeekEntryResult!53)

(declare-fun call!1825 () SeekEntryResult!53)

(assert (=> b!23014 (= lt!8124 call!1825)))

(declare-fun res!14304 () Bool)

(assert (=> b!23014 (= res!14304 ((_ is Found!53) lt!8124))))

(declare-fun e!14959 () Bool)

(assert (=> b!23014 (=> (not res!14304) (not e!14959))))

(assert (=> b!23014 e!14959))

(declare-fun bm!1821 () Bool)

(declare-fun c!2905 () Bool)

(declare-fun c!2909 () Bool)

(declare-fun lt!8106 () SeekEntryResult!53)

(declare-fun c!2915 () Bool)

(declare-fun lt!8102 () SeekEntryResult!53)

(declare-fun call!1822 () Bool)

(declare-fun lt!8114 () SeekEntryResult!53)

(declare-fun c!2913 () Bool)

(declare-fun c!2916 () Bool)

(assert (=> bm!1821 (= call!1822 (inRange!0 (ite c!2909 (ite c!2913 (index!2334 lt!8106) (ite c!2915 (index!2333 lt!8114) (index!2336 lt!8114))) (ite c!2916 (index!2334 lt!8124) (ite c!2905 (index!2333 lt!8102) (index!2336 lt!8102)))) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(declare-fun bm!1822 () Bool)

(declare-fun call!1827 () Bool)

(assert (=> bm!1822 (= call!1827 call!1822)))

(declare-fun b!23015 () Bool)

(declare-fun e!14964 () Bool)

(assert (=> b!23015 (= e!14964 ((_ is Undefined!53) lt!8102))))

(declare-fun b!23016 () Bool)

(declare-fun lt!8120 () Unit!501)

(declare-fun lt!8107 () Unit!501)

(assert (=> b!23016 (= lt!8120 lt!8107)))

(declare-fun call!1830 () ListLongMap!565)

(declare-fun call!1831 () ListLongMap!565)

(assert (=> b!23016 (= call!1830 call!1831)))

(declare-fun lt!8126 () (_ BitVec 32))

(assert (=> b!23016 (= lt!8107 (lemmaChangeLongMinValueKeyThenAddPairToListMap!9 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) lt!8126 (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))) (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(assert (=> b!23016 (= lt!8126 (bvor (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) #b00000000000000000000000000000010))))

(declare-fun e!14975 () tuple2!942)

(assert (=> b!23016 (= e!14975 (tuple2!943 true (LongMapFixedSize!205 (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (bvor (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) #b00000000000000000000000000000010) (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))) (_size!146 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_vacant!146 (ite c!2845 (_2!480 lt!7925) lt!7921)))))))

(declare-fun b!23017 () Bool)

(declare-fun e!14958 () tuple2!942)

(declare-fun lt!8115 () tuple2!942)

(assert (=> b!23017 (= e!14958 (tuple2!943 (_1!480 lt!8115) (_2!480 lt!8115)))))

(declare-fun call!1841 () tuple2!942)

(assert (=> b!23017 (= lt!8115 call!1841)))

(declare-fun b!23018 () Bool)

(declare-fun e!14966 () Bool)

(declare-fun e!14965 () Bool)

(assert (=> b!23018 (= e!14966 e!14965)))

(declare-fun call!1842 () ListLongMap!565)

(declare-fun res!14314 () Bool)

(assert (=> b!23018 (= res!14314 (contains!229 call!1842 (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!23018 (=> (not res!14314) (not e!14965))))

(declare-fun call!1838 () Unit!501)

(declare-fun bm!1819 () Bool)

(assert (=> bm!1819 (= call!1838 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!9 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(declare-fun d!3977 () Bool)

(declare-fun e!14972 () Bool)

(assert (=> d!3977 e!14972))

(declare-fun res!14308 () Bool)

(assert (=> d!3977 (=> (not res!14308) (not e!14972))))

(declare-fun lt!8121 () tuple2!942)

(assert (=> d!3977 (= res!14308 (valid!101 (_2!480 lt!8121)))))

(declare-fun e!14967 () tuple2!942)

(assert (=> d!3977 (= lt!8121 e!14967)))

(assert (=> d!3977 (= c!2907 (= (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3977 (valid!101 (ite c!2845 (_2!480 lt!7925) lt!7921))))

(assert (=> d!3977 (= (update!30 (ite c!2845 (_2!480 lt!7925) lt!7921) (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938)))))) lt!8121)))

(declare-fun b!23019 () Bool)

(assert (=> b!23019 (= e!14959 (= (select (arr!602 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2334 lt!8124)) (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!23020 () Bool)

(declare-fun c!2908 () Bool)

(assert (=> b!23020 (= c!2908 ((_ is MissingVacant!53) lt!8102))))

(declare-fun e!14977 () Bool)

(assert (=> b!23020 (= e!14977 e!14964)))

(declare-fun b!23021 () Bool)

(declare-fun e!14961 () Unit!501)

(declare-fun lt!8127 () Unit!501)

(assert (=> b!23021 (= e!14961 lt!8127)))

(assert (=> b!23021 (= lt!8127 call!1838)))

(declare-fun call!1836 () SeekEntryResult!53)

(assert (=> b!23021 (= lt!8114 call!1836)))

(assert (=> b!23021 (= c!2915 ((_ is MissingZero!53) lt!8114))))

(declare-fun e!14973 () Bool)

(assert (=> b!23021 e!14973))

(declare-fun b!23022 () Bool)

(declare-fun e!14971 () tuple2!942)

(assert (=> b!23022 (= e!14967 e!14971)))

(declare-fun lt!8111 () SeekEntryResult!53)

(assert (=> b!23022 (= lt!8111 (seekEntryOrOpen!0 (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(assert (=> b!23022 (= c!2909 ((_ is Undefined!53) lt!8111))))

(declare-fun b!23023 () Bool)

(declare-fun e!14960 () Bool)

(assert (=> b!23023 (= e!14964 e!14960)))

(declare-fun res!14303 () Bool)

(declare-fun call!1837 () Bool)

(assert (=> b!23023 (= res!14303 call!1837)))

(assert (=> b!23023 (=> (not res!14303) (not e!14960))))

(declare-fun bm!1823 () Bool)

(declare-fun call!1832 () Bool)

(declare-fun call!1840 () Bool)

(assert (=> bm!1823 (= call!1832 call!1840)))

(declare-fun call!1843 () SeekEntryResult!53)

(declare-fun bm!1824 () Bool)

(assert (=> bm!1824 (= call!1843 (seekEntryOrOpen!0 (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(declare-fun bm!1825 () Bool)

(assert (=> bm!1825 (= call!1836 call!1843)))

(declare-fun bm!1826 () Bool)

(declare-fun call!1829 () ListLongMap!565)

(assert (=> bm!1826 (= call!1834 call!1829)))

(declare-fun bm!1827 () Bool)

(declare-fun call!1821 () Bool)

(declare-fun call!1839 () Bool)

(assert (=> bm!1827 (= call!1821 call!1839)))

(declare-fun b!23024 () Bool)

(assert (=> b!23024 (= e!14967 e!14975)))

(assert (=> b!23024 (= c!2911 (= (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!23025 () Bool)

(declare-fun res!14315 () Bool)

(assert (=> b!23025 (= res!14315 call!1840)))

(declare-fun e!14970 () Bool)

(assert (=> b!23025 (=> (not res!14315) (not e!14970))))

(declare-fun b!23026 () Bool)

(declare-fun lt!8109 () Unit!501)

(declare-fun lt!8112 () Unit!501)

(assert (=> b!23026 (= lt!8109 lt!8112)))

(assert (=> b!23026 (= call!1830 call!1831)))

(declare-fun lt!8103 () (_ BitVec 32))

(assert (=> b!23026 (= lt!8112 (lemmaChangeZeroKeyThenAddPairToListMap!9 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) lt!8103 (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(assert (=> b!23026 (= lt!8103 (bvor (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) #b00000000000000000000000000000001))))

(assert (=> b!23026 (= e!14975 (tuple2!943 true (LongMapFixedSize!205 (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (bvor (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) #b00000000000000000000000000000001) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_size!146 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_vacant!146 (ite c!2845 (_2!480 lt!7925) lt!7921)))))))

(declare-fun c!2906 () Bool)

(declare-fun bm!1828 () Bool)

(assert (=> bm!1828 (= call!1841 (updateHelperNewKey!9 (ite c!2845 (_2!480 lt!7925) lt!7921) (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))) (ite c!2906 (index!2336 lt!8111) (index!2333 lt!8111))))))

(declare-fun bm!1829 () Bool)

(assert (=> bm!1829 (= call!1830 call!1828)))

(declare-fun bm!1830 () Bool)

(assert (=> bm!1830 (= call!1825 call!1843)))

(declare-fun b!23027 () Bool)

(declare-fun call!1835 () Bool)

(assert (=> b!23027 (= e!14960 (not call!1835))))

(declare-fun b!23028 () Bool)

(declare-fun e!14962 () Bool)

(declare-fun e!14974 () Bool)

(assert (=> b!23028 (= e!14962 e!14974)))

(declare-fun res!14310 () Bool)

(assert (=> b!23028 (= res!14310 call!1832)))

(assert (=> b!23028 (=> (not res!14310) (not e!14974))))

(declare-fun b!23029 () Bool)

(declare-fun res!14306 () Bool)

(declare-fun e!14968 () Bool)

(assert (=> b!23029 (=> (not res!14306) (not e!14968))))

(assert (=> b!23029 (= res!14306 (= (select (arr!602 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2333 lt!8102)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1831 () Bool)

(assert (=> bm!1831 (= call!1839 (arrayContainsKey!0 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!23030 () Bool)

(declare-fun res!14305 () Bool)

(declare-fun e!14963 () Bool)

(assert (=> b!23030 (=> (not res!14305) (not e!14963))))

(assert (=> b!23030 (= res!14305 (= (select (arr!602 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2333 lt!8114)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!23031 () Bool)

(declare-fun Unit!510 () Unit!501)

(assert (=> b!23031 (= e!14961 Unit!510)))

(declare-fun lt!8122 () Unit!501)

(assert (=> b!23031 (= lt!8122 call!1833)))

(assert (=> b!23031 (= lt!8106 call!1836)))

(declare-fun res!14309 () Bool)

(assert (=> b!23031 (= res!14309 ((_ is Found!53) lt!8106))))

(assert (=> b!23031 (=> (not res!14309) (not e!14970))))

(assert (=> b!23031 e!14970))

(declare-fun lt!8116 () Unit!501)

(assert (=> b!23031 (= lt!8116 lt!8122)))

(assert (=> b!23031 false))

(declare-fun b!23032 () Bool)

(declare-fun e!14976 () tuple2!942)

(assert (=> b!23032 (= e!14958 e!14976)))

(declare-fun c!2910 () Bool)

(assert (=> b!23032 (= c!2910 ((_ is MissingZero!53) lt!8111))))

(declare-fun b!23033 () Bool)

(declare-fun res!14312 () Bool)

(assert (=> b!23033 (=> (not res!14312) (not e!14968))))

(assert (=> b!23033 (= res!14312 call!1837)))

(assert (=> b!23033 (= e!14977 e!14968)))

(declare-fun b!23034 () Bool)

(declare-fun lt!8125 () tuple2!942)

(assert (=> b!23034 (= lt!8125 call!1841)))

(assert (=> b!23034 (= e!14976 (tuple2!943 (_1!480 lt!8125) (_2!480 lt!8125)))))

(declare-fun bm!1832 () Bool)

(assert (=> bm!1832 (= call!1844 call!1829)))

(declare-fun b!23035 () Bool)

(assert (=> b!23035 (= e!14972 e!14966)))

(declare-fun c!2914 () Bool)

(assert (=> b!23035 (= c!2914 (_1!480 lt!8121))))

(declare-fun b!23036 () Bool)

(assert (=> b!23036 (= e!14968 (not call!1835))))

(declare-fun b!23037 () Bool)

(declare-fun res!14313 () Bool)

(assert (=> b!23037 (=> (not res!14313) (not e!14963))))

(assert (=> b!23037 (= res!14313 call!1832)))

(assert (=> b!23037 (= e!14973 e!14963)))

(declare-fun b!23038 () Bool)

(assert (=> b!23038 (= c!2906 ((_ is MissingVacant!53) lt!8111))))

(assert (=> b!23038 (= e!14971 e!14958)))

(declare-fun bm!1833 () Bool)

(assert (=> bm!1833 (= call!1835 call!1839)))

(declare-fun b!23039 () Bool)

(declare-fun res!14302 () Bool)

(assert (=> b!23039 (= res!14302 call!1827)))

(assert (=> b!23039 (=> (not res!14302) (not e!14959))))

(declare-fun call!1826 () ListLongMap!565)

(declare-fun b!23040 () Bool)

(assert (=> b!23040 (= e!14965 (= call!1842 (+!44 call!1826 (tuple2!951 (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938)))))))))))

(declare-fun b!23041 () Bool)

(declare-fun Unit!511 () Unit!501)

(assert (=> b!23041 (= e!14969 Unit!511)))

(declare-fun lt!8119 () Unit!501)

(assert (=> b!23041 (= lt!8119 call!1838)))

(assert (=> b!23041 (= lt!8102 call!1825)))

(assert (=> b!23041 (= c!2905 ((_ is MissingZero!53) lt!8102))))

(assert (=> b!23041 e!14977))

(declare-fun lt!8105 () Unit!501)

(assert (=> b!23041 (= lt!8105 lt!8119)))

(assert (=> b!23041 false))

(declare-fun bm!1834 () Bool)

(assert (=> bm!1834 (= call!1842 (map!404 (_2!480 lt!8121)))))

(declare-fun b!23042 () Bool)

(declare-fun c!2912 () Bool)

(assert (=> b!23042 (= c!2912 ((_ is MissingVacant!53) lt!8114))))

(assert (=> b!23042 (= e!14973 e!14962)))

(declare-fun bm!1835 () Bool)

(assert (=> bm!1835 (= call!1840 call!1822)))

(declare-fun bm!1836 () Bool)

(assert (=> bm!1836 (= call!1826 (map!404 (ite c!2845 (_2!480 lt!7925) lt!7921)))))

(declare-fun b!23043 () Bool)

(assert (=> b!23043 (= e!14974 (not call!1821))))

(declare-fun b!23044 () Bool)

(assert (=> b!23044 (= e!14966 (= call!1842 call!1826))))

(declare-fun b!23045 () Bool)

(declare-fun lt!8118 () Unit!501)

(assert (=> b!23045 (= lt!8118 e!14961)))

(declare-fun call!1823 () Bool)

(assert (=> b!23045 (= c!2913 call!1823)))

(assert (=> b!23045 (= e!14971 (tuple2!943 false (ite c!2845 (_2!480 lt!7925) lt!7921)))))

(declare-fun b!23046 () Bool)

(assert (=> b!23046 (= e!14962 ((_ is Undefined!53) lt!8114))))

(declare-fun b!23047 () Bool)

(declare-fun res!14307 () Bool)

(assert (=> b!23047 (= res!14307 (= (select (arr!602 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2336 lt!8114)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!23047 (=> (not res!14307) (not e!14974))))

(declare-fun b!23048 () Bool)

(assert (=> b!23048 (= e!14963 (not call!1821))))

(declare-fun b!23049 () Bool)

(declare-fun lt!8101 () Unit!501)

(declare-fun lt!8117 () Unit!501)

(assert (=> b!23049 (= lt!8101 lt!8117)))

(assert (=> b!23049 call!1823))

(declare-fun lt!8104 () array!1269)

(assert (=> b!23049 (= lt!8117 (lemmaValidKeyInArrayIsInListMap!9 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) lt!8104 (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (index!2334 lt!8111) (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(assert (=> b!23049 (= lt!8104 (array!1270 (store (arr!601 (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2334 lt!8111) (ValueCellFull!309 (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))))) (size!697 (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)))))))

(declare-fun lt!8110 () Unit!501)

(declare-fun lt!8108 () Unit!501)

(assert (=> b!23049 (= lt!8110 lt!8108)))

(assert (=> b!23049 (= call!1828 call!1834)))

(assert (=> b!23049 (= lt!8108 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!9 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (index!2334 lt!8111) (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))) (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(declare-fun lt!8113 () Unit!501)

(assert (=> b!23049 (= lt!8113 e!14969)))

(assert (=> b!23049 (= c!2916 (contains!229 call!1824 (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!23049 (= e!14976 (tuple2!943 true (LongMapFixedSize!205 (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_size!146 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (array!1270 (store (arr!601 (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2334 lt!8111) (ValueCellFull!309 (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))))) (size!697 (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)))) (_vacant!146 (ite c!2845 (_2!480 lt!7925) lt!7921)))))))

(declare-fun bm!1837 () Bool)

(assert (=> bm!1837 (= call!1837 call!1827)))

(declare-fun res!14311 () Bool)

(declare-fun b!23050 () Bool)

(assert (=> b!23050 (= res!14311 (= (select (arr!602 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2336 lt!8102)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!23050 (=> (not res!14311) (not e!14960))))

(declare-fun bm!1838 () Bool)

(assert (=> bm!1838 (= call!1824 (getCurrentListMap!129 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (ite c!2907 (ite c!2911 lt!8103 lt!8126) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921))) (ite (and c!2907 c!2911) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))) (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921))) (ite c!2907 (ite c!2911 (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938)))))) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921))) #b00000000000000000000000000000000 (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(declare-fun b!23051 () Bool)

(assert (=> b!23051 (= e!14957 (getCurrentListMap!129 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) lt!8104 (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) #b00000000000000000000000000000000 (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(declare-fun b!23052 () Bool)

(assert (=> b!23052 (= e!14970 (= (select (arr!602 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2334 lt!8106)) (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!1839 () Bool)

(assert (=> bm!1839 (= call!1829 (getCurrentListMap!129 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921)) (ite (or c!2907 c!2909) (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921)) (array!1270 (store (arr!601 (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2334 lt!8111) (ValueCellFull!309 (ite c!2845 (minValue!1663 (v!1597 (underlying!113 thiss!938))) (ite c!2846 (zeroValue!1663 (v!1597 (underlying!113 thiss!938))) (minValue!1663 (v!1597 (underlying!113 thiss!938))))))) (size!697 (_values!1726 (ite c!2845 (_2!480 lt!7925) lt!7921))))) (mask!4723 (ite c!2845 (_2!480 lt!7925) lt!7921)) (extraKeys!1638 (ite c!2845 (_2!480 lt!7925) lt!7921)) (zeroValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) (minValue!1663 (ite c!2845 (_2!480 lt!7925) lt!7921)) #b00000000000000000000000000000000 (defaultEntry!1739 (ite c!2845 (_2!480 lt!7925) lt!7921))))))

(declare-fun bm!1840 () Bool)

(assert (=> bm!1840 (= call!1831 call!1824)))

(declare-fun bm!1841 () Bool)

(declare-fun c!2904 () Bool)

(assert (=> bm!1841 (= c!2904 c!2909)))

(assert (=> bm!1841 (= call!1823 (contains!229 e!14957 (ite c!2909 (ite c!2845 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2846 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!602 (_keys!3161 (ite c!2845 (_2!480 lt!7925) lt!7921))) (index!2334 lt!8111)))))))

(assert (= (and d!3977 c!2907) b!23024))

(assert (= (and d!3977 (not c!2907)) b!23022))

(assert (= (and b!23024 c!2911) b!23026))

(assert (= (and b!23024 (not c!2911)) b!23016))

(assert (= (or b!23026 b!23016) bm!1840))

(assert (= (or b!23026 b!23016) bm!1832))

(assert (= (or b!23026 b!23016) bm!1829))

(assert (= (and b!23022 c!2909) b!23045))

(assert (= (and b!23022 (not c!2909)) b!23038))

(assert (= (and b!23045 c!2913) b!23031))

(assert (= (and b!23045 (not c!2913)) b!23021))

(assert (= (and b!23031 res!14309) b!23025))

(assert (= (and b!23025 res!14315) b!23052))

(assert (= (and b!23021 c!2915) b!23037))

(assert (= (and b!23021 (not c!2915)) b!23042))

(assert (= (and b!23037 res!14313) b!23030))

(assert (= (and b!23030 res!14305) b!23048))

(assert (= (and b!23042 c!2912) b!23028))

(assert (= (and b!23042 (not c!2912)) b!23046))

(assert (= (and b!23028 res!14310) b!23047))

(assert (= (and b!23047 res!14307) b!23043))

(assert (= (or b!23037 b!23028) bm!1823))

(assert (= (or b!23048 b!23043) bm!1827))

(assert (= (or b!23025 bm!1823) bm!1835))

(assert (= (or b!23031 b!23021) bm!1825))

(assert (= (and b!23038 c!2906) b!23017))

(assert (= (and b!23038 (not c!2906)) b!23032))

(assert (= (and b!23032 c!2910) b!23034))

(assert (= (and b!23032 (not c!2910)) b!23049))

(assert (= (and b!23049 c!2916) b!23014))

(assert (= (and b!23049 (not c!2916)) b!23041))

(assert (= (and b!23014 res!14304) b!23039))

(assert (= (and b!23039 res!14302) b!23019))

(assert (= (and b!23041 c!2905) b!23033))

(assert (= (and b!23041 (not c!2905)) b!23020))

(assert (= (and b!23033 res!14312) b!23029))

(assert (= (and b!23029 res!14306) b!23036))

(assert (= (and b!23020 c!2908) b!23023))

(assert (= (and b!23020 (not c!2908)) b!23015))

(assert (= (and b!23023 res!14303) b!23050))

(assert (= (and b!23050 res!14311) b!23027))

(assert (= (or b!23033 b!23023) bm!1837))

(assert (= (or b!23036 b!23027) bm!1833))

(assert (= (or b!23039 bm!1837) bm!1822))

(assert (= (or b!23014 b!23041) bm!1830))

(assert (= (or b!23017 b!23034) bm!1828))

(assert (= (or b!23031 b!23014) bm!1820))

(assert (= (or bm!1827 bm!1833) bm!1831))

(assert (= (or b!23045 b!23049) bm!1826))

(assert (= (or bm!1825 bm!1830) bm!1824))

(assert (= (or b!23021 b!23041) bm!1819))

(assert (= (or bm!1835 bm!1822) bm!1821))

(assert (= (or b!23045 b!23049) bm!1841))

(assert (= (and bm!1841 c!2904) b!23013))

(assert (= (and bm!1841 (not c!2904)) b!23051))

(assert (= (or bm!1832 bm!1826) bm!1839))

(assert (= (or bm!1840 b!23049) bm!1838))

(assert (= (or bm!1829 b!23049) bm!1818))

(assert (= (and d!3977 res!14308) b!23035))

(assert (= (and b!23035 c!2914) b!23018))

(assert (= (and b!23035 (not c!2914)) b!23044))

(assert (= (and b!23018 res!14314) b!23040))

(assert (= (or b!23040 b!23044) bm!1836))

(assert (= (or b!23018 b!23040 b!23044) bm!1834))

(declare-fun m!16662 () Bool)

(assert (=> b!23050 m!16662))

(declare-fun m!16664 () Bool)

(assert (=> b!23030 m!16664))

(declare-fun m!16666 () Bool)

(assert (=> b!23022 m!16666))

(declare-fun m!16668 () Bool)

(assert (=> bm!1834 m!16668))

(declare-fun m!16670 () Bool)

(assert (=> d!3977 m!16670))

(declare-fun m!16672 () Bool)

(assert (=> d!3977 m!16672))

(declare-fun m!16674 () Bool)

(assert (=> bm!1841 m!16674))

(declare-fun m!16676 () Bool)

(assert (=> bm!1841 m!16676))

(declare-fun m!16678 () Bool)

(assert (=> bm!1821 m!16678))

(declare-fun m!16680 () Bool)

(assert (=> bm!1828 m!16680))

(assert (=> bm!1824 m!16666))

(declare-fun m!16682 () Bool)

(assert (=> bm!1819 m!16682))

(declare-fun m!16684 () Bool)

(assert (=> bm!1839 m!16684))

(declare-fun m!16686 () Bool)

(assert (=> bm!1839 m!16686))

(declare-fun m!16688 () Bool)

(assert (=> b!23016 m!16688))

(declare-fun m!16690 () Bool)

(assert (=> b!23040 m!16690))

(declare-fun m!16692 () Bool)

(assert (=> b!23047 m!16692))

(declare-fun m!16694 () Bool)

(assert (=> b!23051 m!16694))

(declare-fun m!16696 () Bool)

(assert (=> b!23018 m!16696))

(declare-fun m!16698 () Bool)

(assert (=> b!23029 m!16698))

(declare-fun m!16700 () Bool)

(assert (=> bm!1836 m!16700))

(declare-fun m!16702 () Bool)

(assert (=> bm!1818 m!16702))

(declare-fun m!16704 () Bool)

(assert (=> bm!1838 m!16704))

(declare-fun m!16706 () Bool)

(assert (=> b!23019 m!16706))

(declare-fun m!16708 () Bool)

(assert (=> b!23052 m!16708))

(declare-fun m!16710 () Bool)

(assert (=> bm!1831 m!16710))

(declare-fun m!16712 () Bool)

(assert (=> bm!1820 m!16712))

(declare-fun m!16714 () Bool)

(assert (=> b!23049 m!16714))

(assert (=> b!23049 m!16684))

(declare-fun m!16716 () Bool)

(assert (=> b!23049 m!16716))

(declare-fun m!16718 () Bool)

(assert (=> b!23049 m!16718))

(declare-fun m!16720 () Bool)

(assert (=> b!23026 m!16720))

(assert (=> bm!1739 d!3977))

(declare-fun d!3979 () Bool)

(assert (=> d!3979 (= (array_inv!405 (_keys!3161 (v!1597 (underlying!113 thiss!938)))) (bvsge (size!698 (_keys!3161 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22813 d!3979))

(declare-fun d!3981 () Bool)

(assert (=> d!3981 (= (array_inv!406 (_values!1726 (v!1597 (underlying!113 thiss!938)))) (bvsge (size!697 (_values!1726 (v!1597 (underlying!113 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22813 d!3981))

(declare-fun condMapEmpty!1019 () Bool)

(declare-fun mapDefault!1019 () ValueCell!309)

(assert (=> mapNonEmpty!1013 (= condMapEmpty!1019 (= mapRest!1013 ((as const (Array (_ BitVec 32) ValueCell!309)) mapDefault!1019)))))

(declare-fun e!14983 () Bool)

(declare-fun mapRes!1019 () Bool)

(assert (=> mapNonEmpty!1013 (= tp!3502 (and e!14983 mapRes!1019))))

(declare-fun b!23060 () Bool)

(assert (=> b!23060 (= e!14983 tp_is_empty!1017)))

(declare-fun mapIsEmpty!1019 () Bool)

(assert (=> mapIsEmpty!1019 mapRes!1019))

(declare-fun b!23059 () Bool)

(declare-fun e!14982 () Bool)

(assert (=> b!23059 (= e!14982 tp_is_empty!1017)))

(declare-fun mapNonEmpty!1019 () Bool)

(declare-fun tp!3512 () Bool)

(assert (=> mapNonEmpty!1019 (= mapRes!1019 (and tp!3512 e!14982))))

(declare-fun mapKey!1019 () (_ BitVec 32))

(declare-fun mapRest!1019 () (Array (_ BitVec 32) ValueCell!309))

(declare-fun mapValue!1019 () ValueCell!309)

(assert (=> mapNonEmpty!1019 (= mapRest!1013 (store mapRest!1019 mapKey!1019 mapValue!1019))))

(assert (= (and mapNonEmpty!1013 condMapEmpty!1019) mapIsEmpty!1019))

(assert (= (and mapNonEmpty!1013 (not condMapEmpty!1019)) mapNonEmpty!1019))

(assert (= (and mapNonEmpty!1019 ((_ is ValueCellFull!309) mapValue!1019)) b!23059))

(assert (= (and mapNonEmpty!1013 ((_ is ValueCellFull!309) mapDefault!1019)) b!23060))

(declare-fun m!16722 () Bool)

(assert (=> mapNonEmpty!1019 m!16722))

(declare-fun b_lambda!1571 () Bool)

(assert (= b_lambda!1569 (or (and b!22813 b_free!753) b_lambda!1571)))

(declare-fun b_lambda!1573 () Bool)

(assert (= b_lambda!1567 (or (and b!22813 b_free!753) b_lambda!1573)))

(check-sat (not b!22947) (not bm!1800) (not bm!1810) (not b!22980) (not d!3971) (not bm!1797) (not bm!1815) (not bm!1838) (not bm!1841) (not b_lambda!1571) (not bm!1819) (not b!22949) (not bm!1804) (not b!22953) (not bm!1824) (not b!22971) (not b!23022) (not d!3977) (not b!22982) (not bm!1817) (not bm!1828) (not bm!1820) (not b!23018) (not bm!1796) (not bm!1818) (not b_next!753) (not b!23049) (not d!3973) (not bm!1814) (not bm!1831) (not b!23051) (not b!22957) (not b!22998) (not bm!1839) (not b!23026) (not d!3969) (not bm!1836) (not bm!1812) (not b!23040) (not bm!1795) (not bm!1834) (not b!23016) (not bm!1807) (not b_lambda!1573) (not b!22996) (not bm!1821) (not d!3975) (not bm!1794) (not b!23010) tp_is_empty!1017 (not mapNonEmpty!1019) b_and!1477 (not b!22999))
(check-sat b_and!1477 (not b_next!753))
