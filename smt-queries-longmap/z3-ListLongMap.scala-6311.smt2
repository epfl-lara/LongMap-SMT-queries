; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80892 () Bool)

(assert start!80892)

(declare-fun b!947853 () Bool)

(declare-fun b_free!18189 () Bool)

(declare-fun b_next!18189 () Bool)

(assert (=> b!947853 (= b_free!18189 (not b_next!18189))))

(declare-fun tp!63135 () Bool)

(declare-fun b_and!29613 () Bool)

(assert (=> b!947853 (= tp!63135 b_and!29613)))

(declare-fun mapNonEmpty!32929 () Bool)

(declare-fun mapRes!32929 () Bool)

(declare-fun tp!63134 () Bool)

(declare-fun e!533549 () Bool)

(assert (=> mapNonEmpty!32929 (= mapRes!32929 (and tp!63134 e!533549))))

(declare-datatypes ((V!32561 0))(
  ( (V!32562 (val!10399 Int)) )
))
(declare-datatypes ((ValueCell!9867 0))(
  ( (ValueCellFull!9867 (v!12934 V!32561)) (EmptyCell!9867) )
))
(declare-fun mapRest!32929 () (Array (_ BitVec 32) ValueCell!9867))

(declare-fun mapKey!32929 () (_ BitVec 32))

(declare-datatypes ((array!57396 0))(
  ( (array!57397 (arr!27606 (Array (_ BitVec 32) ValueCell!9867)) (size!28079 (_ BitVec 32))) )
))
(declare-datatypes ((array!57398 0))(
  ( (array!57399 (arr!27607 (Array (_ BitVec 32) (_ BitVec 64))) (size!28080 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4884 0))(
  ( (LongMapFixedSize!4885 (defaultEntry!5741 Int) (mask!27489 (_ BitVec 32)) (extraKeys!5473 (_ BitVec 32)) (zeroValue!5577 V!32561) (minValue!5577 V!32561) (_size!2497 (_ BitVec 32)) (_keys!10655 array!57398) (_values!5764 array!57396) (_vacant!2497 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4884)

(declare-fun mapValue!32929 () ValueCell!9867)

(assert (=> mapNonEmpty!32929 (= (arr!27606 (_values!5764 thiss!1141)) (store mapRest!32929 mapKey!32929 mapValue!32929))))

(declare-fun mapIsEmpty!32929 () Bool)

(assert (=> mapIsEmpty!32929 mapRes!32929))

(declare-fun b!947851 () Bool)

(declare-fun e!533550 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947851 (= e!533550 (not (validMask!0 (mask!27489 thiss!1141))))))

(declare-fun res!636050 () Bool)

(assert (=> start!80892 (=> (not res!636050) (not e!533550))))

(declare-fun valid!1859 (LongMapFixedSize!4884) Bool)

(assert (=> start!80892 (= res!636050 (valid!1859 thiss!1141))))

(assert (=> start!80892 e!533550))

(declare-fun e!533547 () Bool)

(assert (=> start!80892 e!533547))

(assert (=> start!80892 true))

(declare-fun b!947852 () Bool)

(declare-fun e!533551 () Bool)

(declare-fun e!533548 () Bool)

(assert (=> b!947852 (= e!533551 (and e!533548 mapRes!32929))))

(declare-fun condMapEmpty!32929 () Bool)

(declare-fun mapDefault!32929 () ValueCell!9867)

(assert (=> b!947852 (= condMapEmpty!32929 (= (arr!27606 (_values!5764 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9867)) mapDefault!32929)))))

(declare-fun tp_is_empty!20697 () Bool)

(declare-fun array_inv!21428 (array!57398) Bool)

(declare-fun array_inv!21429 (array!57396) Bool)

(assert (=> b!947853 (= e!533547 (and tp!63135 tp_is_empty!20697 (array_inv!21428 (_keys!10655 thiss!1141)) (array_inv!21429 (_values!5764 thiss!1141)) e!533551))))

(declare-fun b!947854 () Bool)

(declare-fun res!636049 () Bool)

(assert (=> b!947854 (=> (not res!636049) (not e!533550))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13516 0))(
  ( (tuple2!13517 (_1!6769 (_ BitVec 64)) (_2!6769 V!32561)) )
))
(declare-datatypes ((List!19312 0))(
  ( (Nil!19309) (Cons!19308 (h!20464 tuple2!13516) (t!27635 List!19312)) )
))
(declare-datatypes ((ListLongMap!12213 0))(
  ( (ListLongMap!12214 (toList!6122 List!19312)) )
))
(declare-fun contains!5204 (ListLongMap!12213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3355 (array!57398 array!57396 (_ BitVec 32) (_ BitVec 32) V!32561 V!32561 (_ BitVec 32) Int) ListLongMap!12213)

(assert (=> b!947854 (= res!636049 (contains!5204 (getCurrentListMap!3355 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141)) key!756))))

(declare-fun b!947855 () Bool)

(assert (=> b!947855 (= e!533548 tp_is_empty!20697)))

(declare-fun b!947856 () Bool)

(declare-fun res!636048 () Bool)

(assert (=> b!947856 (=> (not res!636048) (not e!533550))))

(assert (=> b!947856 (= res!636048 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947857 () Bool)

(assert (=> b!947857 (= e!533549 tp_is_empty!20697)))

(declare-fun b!947858 () Bool)

(declare-fun res!636047 () Bool)

(assert (=> b!947858 (=> (not res!636047) (not e!533550))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9121 0))(
  ( (MissingZero!9121 (index!38855 (_ BitVec 32))) (Found!9121 (index!38856 (_ BitVec 32))) (Intermediate!9121 (undefined!9933 Bool) (index!38857 (_ BitVec 32)) (x!81555 (_ BitVec 32))) (Undefined!9121) (MissingVacant!9121 (index!38858 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57398 (_ BitVec 32)) SeekEntryResult!9121)

(assert (=> b!947858 (= res!636047 (not ((_ is Found!9121) (seekEntry!0 key!756 (_keys!10655 thiss!1141) (mask!27489 thiss!1141)))))))

(assert (= (and start!80892 res!636050) b!947856))

(assert (= (and b!947856 res!636048) b!947858))

(assert (= (and b!947858 res!636047) b!947854))

(assert (= (and b!947854 res!636049) b!947851))

(assert (= (and b!947852 condMapEmpty!32929) mapIsEmpty!32929))

(assert (= (and b!947852 (not condMapEmpty!32929)) mapNonEmpty!32929))

(assert (= (and mapNonEmpty!32929 ((_ is ValueCellFull!9867) mapValue!32929)) b!947857))

(assert (= (and b!947852 ((_ is ValueCellFull!9867) mapDefault!32929)) b!947855))

(assert (= b!947853 b!947852))

(assert (= start!80892 b!947853))

(declare-fun m!880711 () Bool)

(assert (=> b!947854 m!880711))

(assert (=> b!947854 m!880711))

(declare-fun m!880713 () Bool)

(assert (=> b!947854 m!880713))

(declare-fun m!880715 () Bool)

(assert (=> mapNonEmpty!32929 m!880715))

(declare-fun m!880717 () Bool)

(assert (=> b!947851 m!880717))

(declare-fun m!880719 () Bool)

(assert (=> b!947853 m!880719))

(declare-fun m!880721 () Bool)

(assert (=> b!947853 m!880721))

(declare-fun m!880723 () Bool)

(assert (=> start!80892 m!880723))

(declare-fun m!880725 () Bool)

(assert (=> b!947858 m!880725))

(check-sat (not b!947854) (not b!947858) (not b_next!18189) (not mapNonEmpty!32929) b_and!29613 (not start!80892) tp_is_empty!20697 (not b!947853) (not b!947851))
(check-sat b_and!29613 (not b_next!18189))
(get-model)

(declare-fun d!114735 () Bool)

(declare-fun e!533575 () Bool)

(assert (=> d!114735 e!533575))

(declare-fun res!636065 () Bool)

(assert (=> d!114735 (=> res!636065 e!533575)))

(declare-fun lt!426763 () Bool)

(assert (=> d!114735 (= res!636065 (not lt!426763))))

(declare-fun lt!426760 () Bool)

(assert (=> d!114735 (= lt!426763 lt!426760)))

(declare-datatypes ((Unit!31941 0))(
  ( (Unit!31942) )
))
(declare-fun lt!426762 () Unit!31941)

(declare-fun e!533574 () Unit!31941)

(assert (=> d!114735 (= lt!426762 e!533574)))

(declare-fun c!98751 () Bool)

(assert (=> d!114735 (= c!98751 lt!426760)))

(declare-fun containsKey!456 (List!19312 (_ BitVec 64)) Bool)

(assert (=> d!114735 (= lt!426760 (containsKey!456 (toList!6122 (getCurrentListMap!3355 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141))) key!756))))

(assert (=> d!114735 (= (contains!5204 (getCurrentListMap!3355 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141)) key!756) lt!426763)))

(declare-fun b!947889 () Bool)

(declare-fun lt!426761 () Unit!31941)

(assert (=> b!947889 (= e!533574 lt!426761)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!352 (List!19312 (_ BitVec 64)) Unit!31941)

(assert (=> b!947889 (= lt!426761 (lemmaContainsKeyImpliesGetValueByKeyDefined!352 (toList!6122 (getCurrentListMap!3355 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141))) key!756))))

(declare-datatypes ((Option!495 0))(
  ( (Some!494 (v!12936 V!32561)) (None!493) )
))
(declare-fun isDefined!361 (Option!495) Bool)

(declare-fun getValueByKey!489 (List!19312 (_ BitVec 64)) Option!495)

(assert (=> b!947889 (isDefined!361 (getValueByKey!489 (toList!6122 (getCurrentListMap!3355 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141))) key!756))))

(declare-fun b!947890 () Bool)

(declare-fun Unit!31943 () Unit!31941)

(assert (=> b!947890 (= e!533574 Unit!31943)))

(declare-fun b!947891 () Bool)

(assert (=> b!947891 (= e!533575 (isDefined!361 (getValueByKey!489 (toList!6122 (getCurrentListMap!3355 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141))) key!756)))))

(assert (= (and d!114735 c!98751) b!947889))

(assert (= (and d!114735 (not c!98751)) b!947890))

(assert (= (and d!114735 (not res!636065)) b!947891))

(declare-fun m!880743 () Bool)

(assert (=> d!114735 m!880743))

(declare-fun m!880745 () Bool)

(assert (=> b!947889 m!880745))

(declare-fun m!880747 () Bool)

(assert (=> b!947889 m!880747))

(assert (=> b!947889 m!880747))

(declare-fun m!880749 () Bool)

(assert (=> b!947889 m!880749))

(assert (=> b!947891 m!880747))

(assert (=> b!947891 m!880747))

(assert (=> b!947891 m!880749))

(assert (=> b!947854 d!114735))

(declare-fun b!947934 () Bool)

(declare-fun e!533606 () Bool)

(declare-fun lt!426812 () ListLongMap!12213)

(declare-fun apply!870 (ListLongMap!12213 (_ BitVec 64)) V!32561)

(assert (=> b!947934 (= e!533606 (= (apply!870 lt!426812 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5577 thiss!1141)))))

(declare-fun b!947935 () Bool)

(declare-fun e!533607 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947935 (= e!533607 (validKeyInArray!0 (select (arr!27607 (_keys!10655 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947936 () Bool)

(declare-fun e!533612 () ListLongMap!12213)

(declare-fun call!41160 () ListLongMap!12213)

(assert (=> b!947936 (= e!533612 call!41160)))

(declare-fun b!947937 () Bool)

(declare-fun e!533613 () Bool)

(declare-fun call!41166 () Bool)

(assert (=> b!947937 (= e!533613 (not call!41166))))

(declare-fun b!947938 () Bool)

(declare-fun res!636090 () Bool)

(declare-fun e!533608 () Bool)

(assert (=> b!947938 (=> (not res!636090) (not e!533608))))

(assert (=> b!947938 (= res!636090 e!533613)))

(declare-fun c!98766 () Bool)

(assert (=> b!947938 (= c!98766 (not (= (bvand (extraKeys!5473 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!947939 () Bool)

(declare-fun e!533602 () Bool)

(declare-fun call!41162 () Bool)

(assert (=> b!947939 (= e!533602 (not call!41162))))

(declare-fun b!947940 () Bool)

(declare-fun e!533611 () Bool)

(assert (=> b!947940 (= e!533611 (validKeyInArray!0 (select (arr!27607 (_keys!10655 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114737 () Bool)

(assert (=> d!114737 e!533608))

(declare-fun res!636086 () Bool)

(assert (=> d!114737 (=> (not res!636086) (not e!533608))))

(assert (=> d!114737 (= res!636086 (or (bvsge #b00000000000000000000000000000000 (size!28080 (_keys!10655 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28080 (_keys!10655 thiss!1141))))))))

(declare-fun lt!426810 () ListLongMap!12213)

(assert (=> d!114737 (= lt!426812 lt!426810)))

(declare-fun lt!426816 () Unit!31941)

(declare-fun e!533609 () Unit!31941)

(assert (=> d!114737 (= lt!426816 e!533609)))

(declare-fun c!98767 () Bool)

(assert (=> d!114737 (= c!98767 e!533607)))

(declare-fun res!636091 () Bool)

(assert (=> d!114737 (=> (not res!636091) (not e!533607))))

(assert (=> d!114737 (= res!636091 (bvslt #b00000000000000000000000000000000 (size!28080 (_keys!10655 thiss!1141))))))

(declare-fun e!533614 () ListLongMap!12213)

(assert (=> d!114737 (= lt!426810 e!533614)))

(declare-fun c!98768 () Bool)

(assert (=> d!114737 (= c!98768 (and (not (= (bvand (extraKeys!5473 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5473 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114737 (validMask!0 (mask!27489 thiss!1141))))

(assert (=> d!114737 (= (getCurrentListMap!3355 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141)) lt!426812)))

(declare-fun b!947941 () Bool)

(assert (=> b!947941 (= e!533608 e!533602)))

(declare-fun c!98764 () Bool)

(assert (=> b!947941 (= c!98764 (not (= (bvand (extraKeys!5473 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!947942 () Bool)

(declare-fun lt!426808 () Unit!31941)

(assert (=> b!947942 (= e!533609 lt!426808)))

(declare-fun lt!426820 () ListLongMap!12213)

(declare-fun getCurrentListMapNoExtraKeys!3309 (array!57398 array!57396 (_ BitVec 32) (_ BitVec 32) V!32561 V!32561 (_ BitVec 32) Int) ListLongMap!12213)

(assert (=> b!947942 (= lt!426820 (getCurrentListMapNoExtraKeys!3309 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141)))))

(declare-fun lt!426817 () (_ BitVec 64))

(assert (=> b!947942 (= lt!426817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426826 () (_ BitVec 64))

(assert (=> b!947942 (= lt!426826 (select (arr!27607 (_keys!10655 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426818 () Unit!31941)

(declare-fun addStillContains!573 (ListLongMap!12213 (_ BitVec 64) V!32561 (_ BitVec 64)) Unit!31941)

(assert (=> b!947942 (= lt!426818 (addStillContains!573 lt!426820 lt!426817 (zeroValue!5577 thiss!1141) lt!426826))))

(declare-fun +!2854 (ListLongMap!12213 tuple2!13516) ListLongMap!12213)

(assert (=> b!947942 (contains!5204 (+!2854 lt!426820 (tuple2!13517 lt!426817 (zeroValue!5577 thiss!1141))) lt!426826)))

(declare-fun lt!426814 () Unit!31941)

(assert (=> b!947942 (= lt!426814 lt!426818)))

(declare-fun lt!426815 () ListLongMap!12213)

(assert (=> b!947942 (= lt!426815 (getCurrentListMapNoExtraKeys!3309 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141)))))

(declare-fun lt!426828 () (_ BitVec 64))

(assert (=> b!947942 (= lt!426828 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426824 () (_ BitVec 64))

(assert (=> b!947942 (= lt!426824 (select (arr!27607 (_keys!10655 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426813 () Unit!31941)

(declare-fun addApplyDifferent!453 (ListLongMap!12213 (_ BitVec 64) V!32561 (_ BitVec 64)) Unit!31941)

(assert (=> b!947942 (= lt!426813 (addApplyDifferent!453 lt!426815 lt!426828 (minValue!5577 thiss!1141) lt!426824))))

(assert (=> b!947942 (= (apply!870 (+!2854 lt!426815 (tuple2!13517 lt!426828 (minValue!5577 thiss!1141))) lt!426824) (apply!870 lt!426815 lt!426824))))

(declare-fun lt!426823 () Unit!31941)

(assert (=> b!947942 (= lt!426823 lt!426813)))

(declare-fun lt!426827 () ListLongMap!12213)

(assert (=> b!947942 (= lt!426827 (getCurrentListMapNoExtraKeys!3309 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141)))))

(declare-fun lt!426821 () (_ BitVec 64))

(assert (=> b!947942 (= lt!426821 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426829 () (_ BitVec 64))

(assert (=> b!947942 (= lt!426829 (select (arr!27607 (_keys!10655 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426822 () Unit!31941)

(assert (=> b!947942 (= lt!426822 (addApplyDifferent!453 lt!426827 lt!426821 (zeroValue!5577 thiss!1141) lt!426829))))

(assert (=> b!947942 (= (apply!870 (+!2854 lt!426827 (tuple2!13517 lt!426821 (zeroValue!5577 thiss!1141))) lt!426829) (apply!870 lt!426827 lt!426829))))

(declare-fun lt!426819 () Unit!31941)

(assert (=> b!947942 (= lt!426819 lt!426822)))

(declare-fun lt!426825 () ListLongMap!12213)

(assert (=> b!947942 (= lt!426825 (getCurrentListMapNoExtraKeys!3309 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141)))))

(declare-fun lt!426809 () (_ BitVec 64))

(assert (=> b!947942 (= lt!426809 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426811 () (_ BitVec 64))

(assert (=> b!947942 (= lt!426811 (select (arr!27607 (_keys!10655 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947942 (= lt!426808 (addApplyDifferent!453 lt!426825 lt!426809 (minValue!5577 thiss!1141) lt!426811))))

(assert (=> b!947942 (= (apply!870 (+!2854 lt!426825 (tuple2!13517 lt!426809 (minValue!5577 thiss!1141))) lt!426811) (apply!870 lt!426825 lt!426811))))

(declare-fun b!947943 () Bool)

(assert (=> b!947943 (= e!533602 e!533606)))

(declare-fun res!636088 () Bool)

(assert (=> b!947943 (= res!636088 call!41162)))

(assert (=> b!947943 (=> (not res!636088) (not e!533606))))

(declare-fun bm!41157 () Bool)

(declare-fun call!41165 () ListLongMap!12213)

(assert (=> bm!41157 (= call!41160 call!41165)))

(declare-fun b!947944 () Bool)

(declare-fun e!533603 () Bool)

(declare-fun get!14497 (ValueCell!9867 V!32561) V!32561)

(declare-fun dynLambda!1643 (Int (_ BitVec 64)) V!32561)

(assert (=> b!947944 (= e!533603 (= (apply!870 lt!426812 (select (arr!27607 (_keys!10655 thiss!1141)) #b00000000000000000000000000000000)) (get!14497 (select (arr!27606 (_values!5764 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1643 (defaultEntry!5741 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!947944 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28079 (_values!5764 thiss!1141))))))

(assert (=> b!947944 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28080 (_keys!10655 thiss!1141))))))

(declare-fun bm!41158 () Bool)

(assert (=> bm!41158 (= call!41166 (contains!5204 lt!426812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41159 () Bool)

(assert (=> bm!41159 (= call!41162 (contains!5204 lt!426812 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947945 () Bool)

(declare-fun e!533605 () Bool)

(assert (=> b!947945 (= e!533613 e!533605)))

(declare-fun res!636087 () Bool)

(assert (=> b!947945 (= res!636087 call!41166)))

(assert (=> b!947945 (=> (not res!636087) (not e!533605))))

(declare-fun b!947946 () Bool)

(declare-fun c!98765 () Bool)

(assert (=> b!947946 (= c!98765 (and (not (= (bvand (extraKeys!5473 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5473 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!533610 () ListLongMap!12213)

(assert (=> b!947946 (= e!533612 e!533610)))

(declare-fun b!947947 () Bool)

(assert (=> b!947947 (= e!533614 (+!2854 call!41165 (tuple2!13517 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5577 thiss!1141))))))

(declare-fun b!947948 () Bool)

(declare-fun e!533604 () Bool)

(assert (=> b!947948 (= e!533604 e!533603)))

(declare-fun res!636089 () Bool)

(assert (=> b!947948 (=> (not res!636089) (not e!533603))))

(assert (=> b!947948 (= res!636089 (contains!5204 lt!426812 (select (arr!27607 (_keys!10655 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!947948 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28080 (_keys!10655 thiss!1141))))))

(declare-fun bm!41160 () Bool)

(declare-fun call!41163 () ListLongMap!12213)

(assert (=> bm!41160 (= call!41163 (getCurrentListMapNoExtraKeys!3309 (_keys!10655 thiss!1141) (_values!5764 thiss!1141) (mask!27489 thiss!1141) (extraKeys!5473 thiss!1141) (zeroValue!5577 thiss!1141) (minValue!5577 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5741 thiss!1141)))))

(declare-fun bm!41161 () Bool)

(declare-fun call!41164 () ListLongMap!12213)

(assert (=> bm!41161 (= call!41164 call!41163)))

(declare-fun b!947949 () Bool)

(assert (=> b!947949 (= e!533605 (= (apply!870 lt!426812 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5577 thiss!1141)))))

(declare-fun b!947950 () Bool)

(declare-fun call!41161 () ListLongMap!12213)

(assert (=> b!947950 (= e!533610 call!41161)))

(declare-fun b!947951 () Bool)

(assert (=> b!947951 (= e!533614 e!533612)))

(declare-fun c!98769 () Bool)

(assert (=> b!947951 (= c!98769 (and (not (= (bvand (extraKeys!5473 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5473 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!947952 () Bool)

(declare-fun res!636084 () Bool)

(assert (=> b!947952 (=> (not res!636084) (not e!533608))))

(assert (=> b!947952 (= res!636084 e!533604)))

(declare-fun res!636092 () Bool)

(assert (=> b!947952 (=> res!636092 e!533604)))

(assert (=> b!947952 (= res!636092 (not e!533611))))

(declare-fun res!636085 () Bool)

(assert (=> b!947952 (=> (not res!636085) (not e!533611))))

(assert (=> b!947952 (= res!636085 (bvslt #b00000000000000000000000000000000 (size!28080 (_keys!10655 thiss!1141))))))

(declare-fun bm!41162 () Bool)

(assert (=> bm!41162 (= call!41165 (+!2854 (ite c!98768 call!41163 (ite c!98769 call!41164 call!41161)) (ite (or c!98768 c!98769) (tuple2!13517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5577 thiss!1141)) (tuple2!13517 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5577 thiss!1141)))))))

(declare-fun bm!41163 () Bool)

(assert (=> bm!41163 (= call!41161 call!41164)))

(declare-fun b!947953 () Bool)

(assert (=> b!947953 (= e!533610 call!41160)))

(declare-fun b!947954 () Bool)

(declare-fun Unit!31944 () Unit!31941)

(assert (=> b!947954 (= e!533609 Unit!31944)))

(assert (= (and d!114737 c!98768) b!947947))

(assert (= (and d!114737 (not c!98768)) b!947951))

(assert (= (and b!947951 c!98769) b!947936))

(assert (= (and b!947951 (not c!98769)) b!947946))

(assert (= (and b!947946 c!98765) b!947953))

(assert (= (and b!947946 (not c!98765)) b!947950))

(assert (= (or b!947953 b!947950) bm!41163))

(assert (= (or b!947936 bm!41163) bm!41161))

(assert (= (or b!947936 b!947953) bm!41157))

(assert (= (or b!947947 bm!41161) bm!41160))

(assert (= (or b!947947 bm!41157) bm!41162))

(assert (= (and d!114737 res!636091) b!947935))

(assert (= (and d!114737 c!98767) b!947942))

(assert (= (and d!114737 (not c!98767)) b!947954))

(assert (= (and d!114737 res!636086) b!947952))

(assert (= (and b!947952 res!636085) b!947940))

(assert (= (and b!947952 (not res!636092)) b!947948))

(assert (= (and b!947948 res!636089) b!947944))

(assert (= (and b!947952 res!636084) b!947938))

(assert (= (and b!947938 c!98766) b!947945))

(assert (= (and b!947938 (not c!98766)) b!947937))

(assert (= (and b!947945 res!636087) b!947949))

(assert (= (or b!947945 b!947937) bm!41158))

(assert (= (and b!947938 res!636090) b!947941))

(assert (= (and b!947941 c!98764) b!947943))

(assert (= (and b!947941 (not c!98764)) b!947939))

(assert (= (and b!947943 res!636088) b!947934))

(assert (= (or b!947943 b!947939) bm!41159))

(declare-fun b_lambda!14303 () Bool)

(assert (=> (not b_lambda!14303) (not b!947944)))

(declare-fun t!27638 () Bool)

(declare-fun tb!6175 () Bool)

(assert (=> (and b!947853 (= (defaultEntry!5741 thiss!1141) (defaultEntry!5741 thiss!1141)) t!27638) tb!6175))

(declare-fun result!12247 () Bool)

(assert (=> tb!6175 (= result!12247 tp_is_empty!20697)))

(assert (=> b!947944 t!27638))

(declare-fun b_and!29617 () Bool)

(assert (= b_and!29613 (and (=> t!27638 result!12247) b_and!29617)))

(declare-fun m!880751 () Bool)

(assert (=> b!947940 m!880751))

(assert (=> b!947940 m!880751))

(declare-fun m!880753 () Bool)

(assert (=> b!947940 m!880753))

(declare-fun m!880755 () Bool)

(assert (=> b!947934 m!880755))

(declare-fun m!880757 () Bool)

(assert (=> b!947942 m!880757))

(declare-fun m!880759 () Bool)

(assert (=> b!947942 m!880759))

(declare-fun m!880761 () Bool)

(assert (=> b!947942 m!880761))

(declare-fun m!880763 () Bool)

(assert (=> b!947942 m!880763))

(declare-fun m!880765 () Bool)

(assert (=> b!947942 m!880765))

(declare-fun m!880767 () Bool)

(assert (=> b!947942 m!880767))

(assert (=> b!947942 m!880751))

(assert (=> b!947942 m!880759))

(declare-fun m!880769 () Bool)

(assert (=> b!947942 m!880769))

(declare-fun m!880771 () Bool)

(assert (=> b!947942 m!880771))

(declare-fun m!880773 () Bool)

(assert (=> b!947942 m!880773))

(declare-fun m!880775 () Bool)

(assert (=> b!947942 m!880775))

(declare-fun m!880777 () Bool)

(assert (=> b!947942 m!880777))

(declare-fun m!880779 () Bool)

(assert (=> b!947942 m!880779))

(assert (=> b!947942 m!880771))

(assert (=> b!947942 m!880775))

(declare-fun m!880781 () Bool)

(assert (=> b!947942 m!880781))

(declare-fun m!880783 () Bool)

(assert (=> b!947942 m!880783))

(declare-fun m!880785 () Bool)

(assert (=> b!947942 m!880785))

(assert (=> b!947942 m!880767))

(declare-fun m!880787 () Bool)

(assert (=> b!947942 m!880787))

(declare-fun m!880789 () Bool)

(assert (=> b!947947 m!880789))

(declare-fun m!880791 () Bool)

(assert (=> b!947949 m!880791))

(declare-fun m!880793 () Bool)

(assert (=> bm!41159 m!880793))

(declare-fun m!880795 () Bool)

(assert (=> b!947944 m!880795))

(assert (=> b!947944 m!880751))

(declare-fun m!880797 () Bool)

(assert (=> b!947944 m!880797))

(assert (=> b!947944 m!880751))

(declare-fun m!880799 () Bool)

(assert (=> b!947944 m!880799))

(assert (=> b!947944 m!880797))

(assert (=> b!947944 m!880795))

(declare-fun m!880801 () Bool)

(assert (=> b!947944 m!880801))

(assert (=> b!947935 m!880751))

(assert (=> b!947935 m!880751))

(assert (=> b!947935 m!880753))

(assert (=> d!114737 m!880717))

(assert (=> bm!41160 m!880779))

(declare-fun m!880803 () Bool)

(assert (=> bm!41162 m!880803))

(declare-fun m!880805 () Bool)

(assert (=> bm!41158 m!880805))

(assert (=> b!947948 m!880751))

(assert (=> b!947948 m!880751))

(declare-fun m!880807 () Bool)

(assert (=> b!947948 m!880807))

(assert (=> b!947854 d!114737))

(declare-fun d!114739 () Bool)

(assert (=> d!114739 (= (validMask!0 (mask!27489 thiss!1141)) (and (or (= (mask!27489 thiss!1141) #b00000000000000000000000000000111) (= (mask!27489 thiss!1141) #b00000000000000000000000000001111) (= (mask!27489 thiss!1141) #b00000000000000000000000000011111) (= (mask!27489 thiss!1141) #b00000000000000000000000000111111) (= (mask!27489 thiss!1141) #b00000000000000000000000001111111) (= (mask!27489 thiss!1141) #b00000000000000000000000011111111) (= (mask!27489 thiss!1141) #b00000000000000000000000111111111) (= (mask!27489 thiss!1141) #b00000000000000000000001111111111) (= (mask!27489 thiss!1141) #b00000000000000000000011111111111) (= (mask!27489 thiss!1141) #b00000000000000000000111111111111) (= (mask!27489 thiss!1141) #b00000000000000000001111111111111) (= (mask!27489 thiss!1141) #b00000000000000000011111111111111) (= (mask!27489 thiss!1141) #b00000000000000000111111111111111) (= (mask!27489 thiss!1141) #b00000000000000001111111111111111) (= (mask!27489 thiss!1141) #b00000000000000011111111111111111) (= (mask!27489 thiss!1141) #b00000000000000111111111111111111) (= (mask!27489 thiss!1141) #b00000000000001111111111111111111) (= (mask!27489 thiss!1141) #b00000000000011111111111111111111) (= (mask!27489 thiss!1141) #b00000000000111111111111111111111) (= (mask!27489 thiss!1141) #b00000000001111111111111111111111) (= (mask!27489 thiss!1141) #b00000000011111111111111111111111) (= (mask!27489 thiss!1141) #b00000000111111111111111111111111) (= (mask!27489 thiss!1141) #b00000001111111111111111111111111) (= (mask!27489 thiss!1141) #b00000011111111111111111111111111) (= (mask!27489 thiss!1141) #b00000111111111111111111111111111) (= (mask!27489 thiss!1141) #b00001111111111111111111111111111) (= (mask!27489 thiss!1141) #b00011111111111111111111111111111) (= (mask!27489 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27489 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947851 d!114739))

(declare-fun d!114741 () Bool)

(declare-fun res!636099 () Bool)

(declare-fun e!533617 () Bool)

(assert (=> d!114741 (=> (not res!636099) (not e!533617))))

(declare-fun simpleValid!366 (LongMapFixedSize!4884) Bool)

(assert (=> d!114741 (= res!636099 (simpleValid!366 thiss!1141))))

(assert (=> d!114741 (= (valid!1859 thiss!1141) e!533617)))

(declare-fun b!947963 () Bool)

(declare-fun res!636100 () Bool)

(assert (=> b!947963 (=> (not res!636100) (not e!533617))))

(declare-fun arrayCountValidKeys!0 (array!57398 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947963 (= res!636100 (= (arrayCountValidKeys!0 (_keys!10655 thiss!1141) #b00000000000000000000000000000000 (size!28080 (_keys!10655 thiss!1141))) (_size!2497 thiss!1141)))))

(declare-fun b!947964 () Bool)

(declare-fun res!636101 () Bool)

(assert (=> b!947964 (=> (not res!636101) (not e!533617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57398 (_ BitVec 32)) Bool)

(assert (=> b!947964 (= res!636101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10655 thiss!1141) (mask!27489 thiss!1141)))))

(declare-fun b!947965 () Bool)

(declare-datatypes ((List!19314 0))(
  ( (Nil!19311) (Cons!19310 (h!20466 (_ BitVec 64)) (t!27639 List!19314)) )
))
(declare-fun arrayNoDuplicates!0 (array!57398 (_ BitVec 32) List!19314) Bool)

(assert (=> b!947965 (= e!533617 (arrayNoDuplicates!0 (_keys!10655 thiss!1141) #b00000000000000000000000000000000 Nil!19311))))

(assert (= (and d!114741 res!636099) b!947963))

(assert (= (and b!947963 res!636100) b!947964))

(assert (= (and b!947964 res!636101) b!947965))

(declare-fun m!880809 () Bool)

(assert (=> d!114741 m!880809))

(declare-fun m!880811 () Bool)

(assert (=> b!947963 m!880811))

(declare-fun m!880813 () Bool)

(assert (=> b!947964 m!880813))

(declare-fun m!880815 () Bool)

(assert (=> b!947965 m!880815))

(assert (=> start!80892 d!114741))

(declare-fun b!947978 () Bool)

(declare-fun e!533625 () SeekEntryResult!9121)

(declare-fun lt!426838 () SeekEntryResult!9121)

(assert (=> b!947978 (= e!533625 (Found!9121 (index!38857 lt!426838)))))

(declare-fun b!947979 () Bool)

(declare-fun e!533626 () SeekEntryResult!9121)

(assert (=> b!947979 (= e!533626 Undefined!9121)))

(declare-fun d!114743 () Bool)

(declare-fun lt!426839 () SeekEntryResult!9121)

(assert (=> d!114743 (and (or ((_ is MissingVacant!9121) lt!426839) (not ((_ is Found!9121) lt!426839)) (and (bvsge (index!38856 lt!426839) #b00000000000000000000000000000000) (bvslt (index!38856 lt!426839) (size!28080 (_keys!10655 thiss!1141))))) (not ((_ is MissingVacant!9121) lt!426839)) (or (not ((_ is Found!9121) lt!426839)) (= (select (arr!27607 (_keys!10655 thiss!1141)) (index!38856 lt!426839)) key!756)))))

(assert (=> d!114743 (= lt!426839 e!533626)))

(declare-fun c!98777 () Bool)

(assert (=> d!114743 (= c!98777 (and ((_ is Intermediate!9121) lt!426838) (undefined!9933 lt!426838)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57398 (_ BitVec 32)) SeekEntryResult!9121)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114743 (= lt!426838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27489 thiss!1141)) key!756 (_keys!10655 thiss!1141) (mask!27489 thiss!1141)))))

(assert (=> d!114743 (validMask!0 (mask!27489 thiss!1141))))

(assert (=> d!114743 (= (seekEntry!0 key!756 (_keys!10655 thiss!1141) (mask!27489 thiss!1141)) lt!426839)))

(declare-fun b!947980 () Bool)

(declare-fun e!533624 () SeekEntryResult!9121)

(declare-fun lt!426841 () SeekEntryResult!9121)

(assert (=> b!947980 (= e!533624 (ite ((_ is MissingVacant!9121) lt!426841) (MissingZero!9121 (index!38858 lt!426841)) lt!426841))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57398 (_ BitVec 32)) SeekEntryResult!9121)

(assert (=> b!947980 (= lt!426841 (seekKeyOrZeroReturnVacant!0 (x!81555 lt!426838) (index!38857 lt!426838) (index!38857 lt!426838) key!756 (_keys!10655 thiss!1141) (mask!27489 thiss!1141)))))

(declare-fun b!947981 () Bool)

(assert (=> b!947981 (= e!533626 e!533625)))

(declare-fun lt!426840 () (_ BitVec 64))

(assert (=> b!947981 (= lt!426840 (select (arr!27607 (_keys!10655 thiss!1141)) (index!38857 lt!426838)))))

(declare-fun c!98776 () Bool)

(assert (=> b!947981 (= c!98776 (= lt!426840 key!756))))

(declare-fun b!947982 () Bool)

(assert (=> b!947982 (= e!533624 (MissingZero!9121 (index!38857 lt!426838)))))

(declare-fun b!947983 () Bool)

(declare-fun c!98778 () Bool)

(assert (=> b!947983 (= c!98778 (= lt!426840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947983 (= e!533625 e!533624)))

(assert (= (and d!114743 c!98777) b!947979))

(assert (= (and d!114743 (not c!98777)) b!947981))

(assert (= (and b!947981 c!98776) b!947978))

(assert (= (and b!947981 (not c!98776)) b!947983))

(assert (= (and b!947983 c!98778) b!947982))

(assert (= (and b!947983 (not c!98778)) b!947980))

(declare-fun m!880817 () Bool)

(assert (=> d!114743 m!880817))

(declare-fun m!880819 () Bool)

(assert (=> d!114743 m!880819))

(assert (=> d!114743 m!880819))

(declare-fun m!880821 () Bool)

(assert (=> d!114743 m!880821))

(assert (=> d!114743 m!880717))

(declare-fun m!880823 () Bool)

(assert (=> b!947980 m!880823))

(declare-fun m!880825 () Bool)

(assert (=> b!947981 m!880825))

(assert (=> b!947858 d!114743))

(declare-fun d!114745 () Bool)

(assert (=> d!114745 (= (array_inv!21428 (_keys!10655 thiss!1141)) (bvsge (size!28080 (_keys!10655 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947853 d!114745))

(declare-fun d!114747 () Bool)

(assert (=> d!114747 (= (array_inv!21429 (_values!5764 thiss!1141)) (bvsge (size!28079 (_values!5764 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947853 d!114747))

(declare-fun b!947990 () Bool)

(declare-fun e!533632 () Bool)

(assert (=> b!947990 (= e!533632 tp_is_empty!20697)))

(declare-fun mapIsEmpty!32935 () Bool)

(declare-fun mapRes!32935 () Bool)

(assert (=> mapIsEmpty!32935 mapRes!32935))

(declare-fun condMapEmpty!32935 () Bool)

(declare-fun mapDefault!32935 () ValueCell!9867)

(assert (=> mapNonEmpty!32929 (= condMapEmpty!32935 (= mapRest!32929 ((as const (Array (_ BitVec 32) ValueCell!9867)) mapDefault!32935)))))

(declare-fun e!533631 () Bool)

(assert (=> mapNonEmpty!32929 (= tp!63134 (and e!533631 mapRes!32935))))

(declare-fun mapNonEmpty!32935 () Bool)

(declare-fun tp!63144 () Bool)

(assert (=> mapNonEmpty!32935 (= mapRes!32935 (and tp!63144 e!533632))))

(declare-fun mapKey!32935 () (_ BitVec 32))

(declare-fun mapRest!32935 () (Array (_ BitVec 32) ValueCell!9867))

(declare-fun mapValue!32935 () ValueCell!9867)

(assert (=> mapNonEmpty!32935 (= mapRest!32929 (store mapRest!32935 mapKey!32935 mapValue!32935))))

(declare-fun b!947991 () Bool)

(assert (=> b!947991 (= e!533631 tp_is_empty!20697)))

(assert (= (and mapNonEmpty!32929 condMapEmpty!32935) mapIsEmpty!32935))

(assert (= (and mapNonEmpty!32929 (not condMapEmpty!32935)) mapNonEmpty!32935))

(assert (= (and mapNonEmpty!32935 ((_ is ValueCellFull!9867) mapValue!32935)) b!947990))

(assert (= (and mapNonEmpty!32929 ((_ is ValueCellFull!9867) mapDefault!32935)) b!947991))

(declare-fun m!880827 () Bool)

(assert (=> mapNonEmpty!32935 m!880827))

(declare-fun b_lambda!14305 () Bool)

(assert (= b_lambda!14303 (or (and b!947853 b_free!18189) b_lambda!14305)))

(check-sat tp_is_empty!20697 (not b!947942) (not b!947934) (not b!947949) (not b_lambda!14305) (not d!114741) (not b_next!18189) b_and!29617 (not bm!41158) (not bm!41162) (not b!947889) (not b!947980) (not b!947947) (not mapNonEmpty!32935) (not d!114735) (not d!114737) (not b!947965) (not d!114743) (not bm!41160) (not b!947948) (not b!947891) (not b!947964) (not b!947963) (not b!947935) (not b!947940) (not b!947944) (not bm!41159))
(check-sat b_and!29617 (not b_next!18189))
