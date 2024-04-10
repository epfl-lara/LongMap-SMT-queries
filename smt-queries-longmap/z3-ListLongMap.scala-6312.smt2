; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80912 () Bool)

(assert start!80912)

(declare-fun b!948037 () Bool)

(declare-fun b_free!18195 () Bool)

(declare-fun b_next!18195 () Bool)

(assert (=> b!948037 (= b_free!18195 (not b_next!18195))))

(declare-fun tp!63155 () Bool)

(declare-fun b_and!29621 () Bool)

(assert (=> b!948037 (= tp!63155 b_and!29621)))

(declare-fun e!533668 () Bool)

(declare-fun tp_is_empty!20703 () Bool)

(declare-fun e!533664 () Bool)

(declare-datatypes ((V!32569 0))(
  ( (V!32570 (val!10402 Int)) )
))
(declare-datatypes ((ValueCell!9870 0))(
  ( (ValueCellFull!9870 (v!12938 V!32569)) (EmptyCell!9870) )
))
(declare-datatypes ((array!57410 0))(
  ( (array!57411 (arr!27612 (Array (_ BitVec 32) ValueCell!9870)) (size!28085 (_ BitVec 32))) )
))
(declare-datatypes ((array!57412 0))(
  ( (array!57413 (arr!27613 (Array (_ BitVec 32) (_ BitVec 64))) (size!28086 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4890 0))(
  ( (LongMapFixedSize!4891 (defaultEntry!5745 Int) (mask!27497 (_ BitVec 32)) (extraKeys!5477 (_ BitVec 32)) (zeroValue!5581 V!32569) (minValue!5581 V!32569) (_size!2500 (_ BitVec 32)) (_keys!10660 array!57412) (_values!5768 array!57410) (_vacant!2500 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4890)

(declare-fun array_inv!21434 (array!57412) Bool)

(declare-fun array_inv!21435 (array!57410) Bool)

(assert (=> b!948037 (= e!533668 (and tp!63155 tp_is_empty!20703 (array_inv!21434 (_keys!10660 thiss!1141)) (array_inv!21435 (_values!5768 thiss!1141)) e!533664))))

(declare-fun res!636128 () Bool)

(declare-fun e!533663 () Bool)

(assert (=> start!80912 (=> (not res!636128) (not e!533663))))

(declare-fun valid!1861 (LongMapFixedSize!4890) Bool)

(assert (=> start!80912 (= res!636128 (valid!1861 thiss!1141))))

(assert (=> start!80912 e!533663))

(assert (=> start!80912 e!533668))

(assert (=> start!80912 true))

(declare-fun mapIsEmpty!32941 () Bool)

(declare-fun mapRes!32941 () Bool)

(assert (=> mapIsEmpty!32941 mapRes!32941))

(declare-fun b!948038 () Bool)

(declare-fun res!636130 () Bool)

(assert (=> b!948038 (=> (not res!636130) (not e!533663))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9124 0))(
  ( (MissingZero!9124 (index!38867 (_ BitVec 32))) (Found!9124 (index!38868 (_ BitVec 32))) (Intermediate!9124 (undefined!9936 Bool) (index!38869 (_ BitVec 32)) (x!81576 (_ BitVec 32))) (Undefined!9124) (MissingVacant!9124 (index!38870 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57412 (_ BitVec 32)) SeekEntryResult!9124)

(assert (=> b!948038 (= res!636130 (not ((_ is Found!9124) (seekEntry!0 key!756 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)))))))

(declare-fun b!948039 () Bool)

(declare-fun e!533666 () Bool)

(assert (=> b!948039 (= e!533666 tp_is_empty!20703)))

(declare-fun b!948040 () Bool)

(assert (=> b!948040 (= e!533664 (and e!533666 mapRes!32941))))

(declare-fun condMapEmpty!32941 () Bool)

(declare-fun mapDefault!32941 () ValueCell!9870)

(assert (=> b!948040 (= condMapEmpty!32941 (= (arr!27612 (_values!5768 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9870)) mapDefault!32941)))))

(declare-fun b!948041 () Bool)

(declare-fun res!636131 () Bool)

(assert (=> b!948041 (=> (not res!636131) (not e!533663))))

(assert (=> b!948041 (= res!636131 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948042 () Bool)

(declare-fun res!636127 () Bool)

(assert (=> b!948042 (=> (not res!636127) (not e!533663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948042 (= res!636127 (validMask!0 (mask!27497 thiss!1141)))))

(declare-fun mapNonEmpty!32941 () Bool)

(declare-fun tp!63156 () Bool)

(declare-fun e!533667 () Bool)

(assert (=> mapNonEmpty!32941 (= mapRes!32941 (and tp!63156 e!533667))))

(declare-fun mapKey!32941 () (_ BitVec 32))

(declare-fun mapRest!32941 () (Array (_ BitVec 32) ValueCell!9870))

(declare-fun mapValue!32941 () ValueCell!9870)

(assert (=> mapNonEmpty!32941 (= (arr!27612 (_values!5768 thiss!1141)) (store mapRest!32941 mapKey!32941 mapValue!32941))))

(declare-fun b!948043 () Bool)

(assert (=> b!948043 (= e!533667 tp_is_empty!20703)))

(declare-fun b!948044 () Bool)

(assert (=> b!948044 (= e!533663 (not (= (size!28085 (_values!5768 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27497 thiss!1141)))))))

(declare-fun b!948045 () Bool)

(declare-fun res!636129 () Bool)

(assert (=> b!948045 (=> (not res!636129) (not e!533663))))

(declare-datatypes ((tuple2!13522 0))(
  ( (tuple2!13523 (_1!6772 (_ BitVec 64)) (_2!6772 V!32569)) )
))
(declare-datatypes ((List!19316 0))(
  ( (Nil!19313) (Cons!19312 (h!20468 tuple2!13522) (t!27641 List!19316)) )
))
(declare-datatypes ((ListLongMap!12219 0))(
  ( (ListLongMap!12220 (toList!6125 List!19316)) )
))
(declare-fun contains!5207 (ListLongMap!12219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3358 (array!57412 array!57410 (_ BitVec 32) (_ BitVec 32) V!32569 V!32569 (_ BitVec 32) Int) ListLongMap!12219)

(assert (=> b!948045 (= res!636129 (contains!5207 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)) key!756))))

(assert (= (and start!80912 res!636128) b!948041))

(assert (= (and b!948041 res!636131) b!948038))

(assert (= (and b!948038 res!636130) b!948045))

(assert (= (and b!948045 res!636129) b!948042))

(assert (= (and b!948042 res!636127) b!948044))

(assert (= (and b!948040 condMapEmpty!32941) mapIsEmpty!32941))

(assert (= (and b!948040 (not condMapEmpty!32941)) mapNonEmpty!32941))

(assert (= (and mapNonEmpty!32941 ((_ is ValueCellFull!9870) mapValue!32941)) b!948043))

(assert (= (and b!948040 ((_ is ValueCellFull!9870) mapDefault!32941)) b!948039))

(assert (= b!948037 b!948040))

(assert (= start!80912 b!948037))

(declare-fun m!880845 () Bool)

(assert (=> b!948042 m!880845))

(declare-fun m!880847 () Bool)

(assert (=> mapNonEmpty!32941 m!880847))

(declare-fun m!880849 () Bool)

(assert (=> start!80912 m!880849))

(declare-fun m!880851 () Bool)

(assert (=> b!948037 m!880851))

(declare-fun m!880853 () Bool)

(assert (=> b!948037 m!880853))

(declare-fun m!880855 () Bool)

(assert (=> b!948045 m!880855))

(assert (=> b!948045 m!880855))

(declare-fun m!880857 () Bool)

(assert (=> b!948045 m!880857))

(declare-fun m!880859 () Bool)

(assert (=> b!948038 m!880859))

(check-sat (not b!948045) (not b!948042) b_and!29621 (not b!948038) (not mapNonEmpty!32941) (not b!948037) (not b_next!18195) (not start!80912) tp_is_empty!20703)
(check-sat b_and!29621 (not b_next!18195))
(get-model)

(declare-fun b!948085 () Bool)

(declare-fun e!533695 () SeekEntryResult!9124)

(declare-fun e!533694 () SeekEntryResult!9124)

(assert (=> b!948085 (= e!533695 e!533694)))

(declare-fun lt!426851 () (_ BitVec 64))

(declare-fun lt!426853 () SeekEntryResult!9124)

(assert (=> b!948085 (= lt!426851 (select (arr!27613 (_keys!10660 thiss!1141)) (index!38869 lt!426853)))))

(declare-fun c!98786 () Bool)

(assert (=> b!948085 (= c!98786 (= lt!426851 key!756))))

(declare-fun b!948086 () Bool)

(declare-fun e!533693 () SeekEntryResult!9124)

(declare-fun lt!426850 () SeekEntryResult!9124)

(assert (=> b!948086 (= e!533693 (ite ((_ is MissingVacant!9124) lt!426850) (MissingZero!9124 (index!38870 lt!426850)) lt!426850))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57412 (_ BitVec 32)) SeekEntryResult!9124)

(assert (=> b!948086 (= lt!426850 (seekKeyOrZeroReturnVacant!0 (x!81576 lt!426853) (index!38869 lt!426853) (index!38869 lt!426853) key!756 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)))))

(declare-fun d!114751 () Bool)

(declare-fun lt!426852 () SeekEntryResult!9124)

(assert (=> d!114751 (and (or ((_ is MissingVacant!9124) lt!426852) (not ((_ is Found!9124) lt!426852)) (and (bvsge (index!38868 lt!426852) #b00000000000000000000000000000000) (bvslt (index!38868 lt!426852) (size!28086 (_keys!10660 thiss!1141))))) (not ((_ is MissingVacant!9124) lt!426852)) (or (not ((_ is Found!9124) lt!426852)) (= (select (arr!27613 (_keys!10660 thiss!1141)) (index!38868 lt!426852)) key!756)))))

(assert (=> d!114751 (= lt!426852 e!533695)))

(declare-fun c!98787 () Bool)

(assert (=> d!114751 (= c!98787 (and ((_ is Intermediate!9124) lt!426853) (undefined!9936 lt!426853)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57412 (_ BitVec 32)) SeekEntryResult!9124)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114751 (= lt!426853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27497 thiss!1141)) key!756 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)))))

(assert (=> d!114751 (validMask!0 (mask!27497 thiss!1141))))

(assert (=> d!114751 (= (seekEntry!0 key!756 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)) lt!426852)))

(declare-fun b!948087 () Bool)

(declare-fun c!98785 () Bool)

(assert (=> b!948087 (= c!98785 (= lt!426851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948087 (= e!533694 e!533693)))

(declare-fun b!948088 () Bool)

(assert (=> b!948088 (= e!533695 Undefined!9124)))

(declare-fun b!948089 () Bool)

(assert (=> b!948089 (= e!533693 (MissingZero!9124 (index!38869 lt!426853)))))

(declare-fun b!948090 () Bool)

(assert (=> b!948090 (= e!533694 (Found!9124 (index!38869 lt!426853)))))

(assert (= (and d!114751 c!98787) b!948088))

(assert (= (and d!114751 (not c!98787)) b!948085))

(assert (= (and b!948085 c!98786) b!948090))

(assert (= (and b!948085 (not c!98786)) b!948087))

(assert (= (and b!948087 c!98785) b!948089))

(assert (= (and b!948087 (not c!98785)) b!948086))

(declare-fun m!880877 () Bool)

(assert (=> b!948085 m!880877))

(declare-fun m!880879 () Bool)

(assert (=> b!948086 m!880879))

(declare-fun m!880881 () Bool)

(assert (=> d!114751 m!880881))

(declare-fun m!880883 () Bool)

(assert (=> d!114751 m!880883))

(assert (=> d!114751 m!880883))

(declare-fun m!880885 () Bool)

(assert (=> d!114751 m!880885))

(assert (=> d!114751 m!880845))

(assert (=> b!948038 d!114751))

(declare-fun d!114753 () Bool)

(assert (=> d!114753 (= (validMask!0 (mask!27497 thiss!1141)) (and (or (= (mask!27497 thiss!1141) #b00000000000000000000000000000111) (= (mask!27497 thiss!1141) #b00000000000000000000000000001111) (= (mask!27497 thiss!1141) #b00000000000000000000000000011111) (= (mask!27497 thiss!1141) #b00000000000000000000000000111111) (= (mask!27497 thiss!1141) #b00000000000000000000000001111111) (= (mask!27497 thiss!1141) #b00000000000000000000000011111111) (= (mask!27497 thiss!1141) #b00000000000000000000000111111111) (= (mask!27497 thiss!1141) #b00000000000000000000001111111111) (= (mask!27497 thiss!1141) #b00000000000000000000011111111111) (= (mask!27497 thiss!1141) #b00000000000000000000111111111111) (= (mask!27497 thiss!1141) #b00000000000000000001111111111111) (= (mask!27497 thiss!1141) #b00000000000000000011111111111111) (= (mask!27497 thiss!1141) #b00000000000000000111111111111111) (= (mask!27497 thiss!1141) #b00000000000000001111111111111111) (= (mask!27497 thiss!1141) #b00000000000000011111111111111111) (= (mask!27497 thiss!1141) #b00000000000000111111111111111111) (= (mask!27497 thiss!1141) #b00000000000001111111111111111111) (= (mask!27497 thiss!1141) #b00000000000011111111111111111111) (= (mask!27497 thiss!1141) #b00000000000111111111111111111111) (= (mask!27497 thiss!1141) #b00000000001111111111111111111111) (= (mask!27497 thiss!1141) #b00000000011111111111111111111111) (= (mask!27497 thiss!1141) #b00000000111111111111111111111111) (= (mask!27497 thiss!1141) #b00000001111111111111111111111111) (= (mask!27497 thiss!1141) #b00000011111111111111111111111111) (= (mask!27497 thiss!1141) #b00000111111111111111111111111111) (= (mask!27497 thiss!1141) #b00001111111111111111111111111111) (= (mask!27497 thiss!1141) #b00011111111111111111111111111111) (= (mask!27497 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27497 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948042 d!114753))

(declare-fun d!114755 () Bool)

(assert (=> d!114755 (= (array_inv!21434 (_keys!10660 thiss!1141)) (bvsge (size!28086 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948037 d!114755))

(declare-fun d!114757 () Bool)

(assert (=> d!114757 (= (array_inv!21435 (_values!5768 thiss!1141)) (bvsge (size!28085 (_values!5768 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948037 d!114757))

(declare-fun d!114759 () Bool)

(declare-fun e!533700 () Bool)

(assert (=> d!114759 e!533700))

(declare-fun res!636149 () Bool)

(assert (=> d!114759 (=> res!636149 e!533700)))

(declare-fun lt!426864 () Bool)

(assert (=> d!114759 (= res!636149 (not lt!426864))))

(declare-fun lt!426862 () Bool)

(assert (=> d!114759 (= lt!426864 lt!426862)))

(declare-datatypes ((Unit!31945 0))(
  ( (Unit!31946) )
))
(declare-fun lt!426863 () Unit!31945)

(declare-fun e!533701 () Unit!31945)

(assert (=> d!114759 (= lt!426863 e!533701)))

(declare-fun c!98790 () Bool)

(assert (=> d!114759 (= c!98790 lt!426862)))

(declare-fun containsKey!457 (List!19316 (_ BitVec 64)) Bool)

(assert (=> d!114759 (= lt!426862 (containsKey!457 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756))))

(assert (=> d!114759 (= (contains!5207 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)) key!756) lt!426864)))

(declare-fun b!948097 () Bool)

(declare-fun lt!426865 () Unit!31945)

(assert (=> b!948097 (= e!533701 lt!426865)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!353 (List!19316 (_ BitVec 64)) Unit!31945)

(assert (=> b!948097 (= lt!426865 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756))))

(declare-datatypes ((Option!496 0))(
  ( (Some!495 (v!12940 V!32569)) (None!494) )
))
(declare-fun isDefined!362 (Option!496) Bool)

(declare-fun getValueByKey!490 (List!19316 (_ BitVec 64)) Option!496)

(assert (=> b!948097 (isDefined!362 (getValueByKey!490 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756))))

(declare-fun b!948098 () Bool)

(declare-fun Unit!31947 () Unit!31945)

(assert (=> b!948098 (= e!533701 Unit!31947)))

(declare-fun b!948099 () Bool)

(assert (=> b!948099 (= e!533700 (isDefined!362 (getValueByKey!490 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756)))))

(assert (= (and d!114759 c!98790) b!948097))

(assert (= (and d!114759 (not c!98790)) b!948098))

(assert (= (and d!114759 (not res!636149)) b!948099))

(declare-fun m!880887 () Bool)

(assert (=> d!114759 m!880887))

(declare-fun m!880889 () Bool)

(assert (=> b!948097 m!880889))

(declare-fun m!880891 () Bool)

(assert (=> b!948097 m!880891))

(assert (=> b!948097 m!880891))

(declare-fun m!880893 () Bool)

(assert (=> b!948097 m!880893))

(assert (=> b!948099 m!880891))

(assert (=> b!948099 m!880891))

(assert (=> b!948099 m!880893))

(assert (=> b!948045 d!114759))

(declare-fun b!948142 () Bool)

(declare-fun e!533732 () Unit!31945)

(declare-fun lt!426914 () Unit!31945)

(assert (=> b!948142 (= e!533732 lt!426914)))

(declare-fun lt!426910 () ListLongMap!12219)

(declare-fun getCurrentListMapNoExtraKeys!3310 (array!57412 array!57410 (_ BitVec 32) (_ BitVec 32) V!32569 V!32569 (_ BitVec 32) Int) ListLongMap!12219)

(assert (=> b!948142 (= lt!426910 (getCurrentListMapNoExtraKeys!3310 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))))

(declare-fun lt!426915 () (_ BitVec 64))

(assert (=> b!948142 (= lt!426915 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426913 () (_ BitVec 64))

(assert (=> b!948142 (= lt!426913 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426929 () Unit!31945)

(declare-fun addStillContains!574 (ListLongMap!12219 (_ BitVec 64) V!32569 (_ BitVec 64)) Unit!31945)

(assert (=> b!948142 (= lt!426929 (addStillContains!574 lt!426910 lt!426915 (zeroValue!5581 thiss!1141) lt!426913))))

(declare-fun +!2855 (ListLongMap!12219 tuple2!13522) ListLongMap!12219)

(assert (=> b!948142 (contains!5207 (+!2855 lt!426910 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141))) lt!426913)))

(declare-fun lt!426917 () Unit!31945)

(assert (=> b!948142 (= lt!426917 lt!426929)))

(declare-fun lt!426923 () ListLongMap!12219)

(assert (=> b!948142 (= lt!426923 (getCurrentListMapNoExtraKeys!3310 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))))

(declare-fun lt!426930 () (_ BitVec 64))

(assert (=> b!948142 (= lt!426930 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426926 () (_ BitVec 64))

(assert (=> b!948142 (= lt!426926 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426928 () Unit!31945)

(declare-fun addApplyDifferent!454 (ListLongMap!12219 (_ BitVec 64) V!32569 (_ BitVec 64)) Unit!31945)

(assert (=> b!948142 (= lt!426928 (addApplyDifferent!454 lt!426923 lt!426930 (minValue!5581 thiss!1141) lt!426926))))

(declare-fun apply!871 (ListLongMap!12219 (_ BitVec 64)) V!32569)

(assert (=> b!948142 (= (apply!871 (+!2855 lt!426923 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141))) lt!426926) (apply!871 lt!426923 lt!426926))))

(declare-fun lt!426924 () Unit!31945)

(assert (=> b!948142 (= lt!426924 lt!426928)))

(declare-fun lt!426911 () ListLongMap!12219)

(assert (=> b!948142 (= lt!426911 (getCurrentListMapNoExtraKeys!3310 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))))

(declare-fun lt!426925 () (_ BitVec 64))

(assert (=> b!948142 (= lt!426925 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426922 () (_ BitVec 64))

(assert (=> b!948142 (= lt!426922 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426916 () Unit!31945)

(assert (=> b!948142 (= lt!426916 (addApplyDifferent!454 lt!426911 lt!426925 (zeroValue!5581 thiss!1141) lt!426922))))

(assert (=> b!948142 (= (apply!871 (+!2855 lt!426911 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141))) lt!426922) (apply!871 lt!426911 lt!426922))))

(declare-fun lt!426919 () Unit!31945)

(assert (=> b!948142 (= lt!426919 lt!426916)))

(declare-fun lt!426927 () ListLongMap!12219)

(assert (=> b!948142 (= lt!426927 (getCurrentListMapNoExtraKeys!3310 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))))

(declare-fun lt!426912 () (_ BitVec 64))

(assert (=> b!948142 (= lt!426912 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426921 () (_ BitVec 64))

(assert (=> b!948142 (= lt!426921 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948142 (= lt!426914 (addApplyDifferent!454 lt!426927 lt!426912 (minValue!5581 thiss!1141) lt!426921))))

(assert (=> b!948142 (= (apply!871 (+!2855 lt!426927 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141))) lt!426921) (apply!871 lt!426927 lt!426921))))

(declare-fun b!948143 () Bool)

(declare-fun e!533728 () ListLongMap!12219)

(declare-fun call!41183 () ListLongMap!12219)

(assert (=> b!948143 (= e!533728 call!41183)))

(declare-fun b!948144 () Bool)

(declare-fun c!98807 () Bool)

(assert (=> b!948144 (= c!98807 (and (not (= (bvand (extraKeys!5477 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5477 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!533733 () ListLongMap!12219)

(assert (=> b!948144 (= e!533733 e!533728)))

(declare-fun bm!41178 () Bool)

(declare-fun call!41187 () Bool)

(declare-fun lt!426920 () ListLongMap!12219)

(assert (=> bm!41178 (= call!41187 (contains!5207 lt!426920 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948145 () Bool)

(declare-fun e!533740 () Bool)

(assert (=> b!948145 (= e!533740 (= (apply!871 lt!426920 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5581 thiss!1141)))))

(declare-fun bm!41179 () Bool)

(declare-fun call!41186 () ListLongMap!12219)

(assert (=> bm!41179 (= call!41183 call!41186)))

(declare-fun b!948146 () Bool)

(declare-fun e!533731 () Bool)

(declare-fun get!14500 (ValueCell!9870 V!32569) V!32569)

(declare-fun dynLambda!1644 (Int (_ BitVec 64)) V!32569)

(assert (=> b!948146 (= e!533731 (= (apply!871 lt!426920 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)) (get!14500 (select (arr!27612 (_values!5768 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1644 (defaultEntry!5745 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948146 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28085 (_values!5768 thiss!1141))))))

(assert (=> b!948146 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(declare-fun b!948147 () Bool)

(declare-fun e!533736 () ListLongMap!12219)

(assert (=> b!948147 (= e!533736 (+!2855 call!41186 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))))))

(declare-fun b!948148 () Bool)

(declare-fun e!533739 () Bool)

(declare-fun e!533730 () Bool)

(assert (=> b!948148 (= e!533739 e!533730)))

(declare-fun res!636171 () Bool)

(declare-fun call!41182 () Bool)

(assert (=> b!948148 (= res!636171 call!41182)))

(assert (=> b!948148 (=> (not res!636171) (not e!533730))))

(declare-fun bm!41180 () Bool)

(declare-fun call!41184 () ListLongMap!12219)

(assert (=> bm!41180 (= call!41184 (getCurrentListMapNoExtraKeys!3310 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))))

(declare-fun b!948149 () Bool)

(assert (=> b!948149 (= e!533739 (not call!41182))))

(declare-fun bm!41181 () Bool)

(assert (=> bm!41181 (= call!41182 (contains!5207 lt!426920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948150 () Bool)

(declare-fun res!636173 () Bool)

(declare-fun e!533735 () Bool)

(assert (=> b!948150 (=> (not res!636173) (not e!533735))))

(declare-fun e!533737 () Bool)

(assert (=> b!948150 (= res!636173 e!533737)))

(declare-fun res!636175 () Bool)

(assert (=> b!948150 (=> res!636175 e!533737)))

(declare-fun e!533734 () Bool)

(assert (=> b!948150 (= res!636175 (not e!533734))))

(declare-fun res!636170 () Bool)

(assert (=> b!948150 (=> (not res!636170) (not e!533734))))

(assert (=> b!948150 (= res!636170 (bvslt #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(declare-fun b!948152 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948152 (= e!533734 (validKeyInArray!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun call!41185 () ListLongMap!12219)

(declare-fun bm!41182 () Bool)

(declare-fun call!41181 () ListLongMap!12219)

(declare-fun c!98806 () Bool)

(declare-fun c!98808 () Bool)

(assert (=> bm!41182 (= call!41186 (+!2855 (ite c!98806 call!41184 (ite c!98808 call!41185 call!41181)) (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))))))

(declare-fun b!948153 () Bool)

(declare-fun e!533729 () Bool)

(assert (=> b!948153 (= e!533729 (not call!41187))))

(declare-fun b!948154 () Bool)

(declare-fun res!636174 () Bool)

(assert (=> b!948154 (=> (not res!636174) (not e!533735))))

(assert (=> b!948154 (= res!636174 e!533739)))

(declare-fun c!98804 () Bool)

(assert (=> b!948154 (= c!98804 (not (= (bvand (extraKeys!5477 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!948155 () Bool)

(assert (=> b!948155 (= e!533730 (= (apply!871 lt!426920 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5581 thiss!1141)))))

(declare-fun b!948156 () Bool)

(assert (=> b!948156 (= e!533729 e!533740)))

(declare-fun res!636168 () Bool)

(assert (=> b!948156 (= res!636168 call!41187)))

(assert (=> b!948156 (=> (not res!636168) (not e!533740))))

(declare-fun bm!41183 () Bool)

(assert (=> bm!41183 (= call!41185 call!41184)))

(declare-fun b!948151 () Bool)

(declare-fun Unit!31948 () Unit!31945)

(assert (=> b!948151 (= e!533732 Unit!31948)))

(declare-fun d!114761 () Bool)

(assert (=> d!114761 e!533735))

(declare-fun res!636172 () Bool)

(assert (=> d!114761 (=> (not res!636172) (not e!533735))))

(assert (=> d!114761 (= res!636172 (or (bvsge #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))))

(declare-fun lt!426918 () ListLongMap!12219)

(assert (=> d!114761 (= lt!426920 lt!426918)))

(declare-fun lt!426931 () Unit!31945)

(assert (=> d!114761 (= lt!426931 e!533732)))

(declare-fun c!98803 () Bool)

(declare-fun e!533738 () Bool)

(assert (=> d!114761 (= c!98803 e!533738)))

(declare-fun res!636176 () Bool)

(assert (=> d!114761 (=> (not res!636176) (not e!533738))))

(assert (=> d!114761 (= res!636176 (bvslt #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(assert (=> d!114761 (= lt!426918 e!533736)))

(assert (=> d!114761 (= c!98806 (and (not (= (bvand (extraKeys!5477 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5477 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114761 (validMask!0 (mask!27497 thiss!1141))))

(assert (=> d!114761 (= (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)) lt!426920)))

(declare-fun bm!41184 () Bool)

(assert (=> bm!41184 (= call!41181 call!41185)))

(declare-fun b!948157 () Bool)

(assert (=> b!948157 (= e!533736 e!533733)))

(assert (=> b!948157 (= c!98808 (and (not (= (bvand (extraKeys!5477 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5477 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!948158 () Bool)

(assert (=> b!948158 (= e!533728 call!41181)))

(declare-fun b!948159 () Bool)

(assert (=> b!948159 (= e!533737 e!533731)))

(declare-fun res!636169 () Bool)

(assert (=> b!948159 (=> (not res!636169) (not e!533731))))

(assert (=> b!948159 (= res!636169 (contains!5207 lt!426920 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(declare-fun b!948160 () Bool)

(assert (=> b!948160 (= e!533733 call!41183)))

(declare-fun b!948161 () Bool)

(assert (=> b!948161 (= e!533738 (validKeyInArray!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948162 () Bool)

(assert (=> b!948162 (= e!533735 e!533729)))

(declare-fun c!98805 () Bool)

(assert (=> b!948162 (= c!98805 (not (= (bvand (extraKeys!5477 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!114761 c!98806) b!948147))

(assert (= (and d!114761 (not c!98806)) b!948157))

(assert (= (and b!948157 c!98808) b!948160))

(assert (= (and b!948157 (not c!98808)) b!948144))

(assert (= (and b!948144 c!98807) b!948143))

(assert (= (and b!948144 (not c!98807)) b!948158))

(assert (= (or b!948143 b!948158) bm!41184))

(assert (= (or b!948160 bm!41184) bm!41183))

(assert (= (or b!948160 b!948143) bm!41179))

(assert (= (or b!948147 bm!41183) bm!41180))

(assert (= (or b!948147 bm!41179) bm!41182))

(assert (= (and d!114761 res!636176) b!948161))

(assert (= (and d!114761 c!98803) b!948142))

(assert (= (and d!114761 (not c!98803)) b!948151))

(assert (= (and d!114761 res!636172) b!948150))

(assert (= (and b!948150 res!636170) b!948152))

(assert (= (and b!948150 (not res!636175)) b!948159))

(assert (= (and b!948159 res!636169) b!948146))

(assert (= (and b!948150 res!636173) b!948154))

(assert (= (and b!948154 c!98804) b!948148))

(assert (= (and b!948154 (not c!98804)) b!948149))

(assert (= (and b!948148 res!636171) b!948155))

(assert (= (or b!948148 b!948149) bm!41181))

(assert (= (and b!948154 res!636174) b!948162))

(assert (= (and b!948162 c!98805) b!948156))

(assert (= (and b!948162 (not c!98805)) b!948153))

(assert (= (and b!948156 res!636168) b!948145))

(assert (= (or b!948156 b!948153) bm!41178))

(declare-fun b_lambda!14307 () Bool)

(assert (=> (not b_lambda!14307) (not b!948146)))

(declare-fun t!27643 () Bool)

(declare-fun tb!6177 () Bool)

(assert (=> (and b!948037 (= (defaultEntry!5745 thiss!1141) (defaultEntry!5745 thiss!1141)) t!27643) tb!6177))

(declare-fun result!12253 () Bool)

(assert (=> tb!6177 (= result!12253 tp_is_empty!20703)))

(assert (=> b!948146 t!27643))

(declare-fun b_and!29625 () Bool)

(assert (= b_and!29621 (and (=> t!27643 result!12253) b_and!29625)))

(declare-fun m!880895 () Bool)

(assert (=> bm!41178 m!880895))

(declare-fun m!880897 () Bool)

(assert (=> bm!41180 m!880897))

(declare-fun m!880899 () Bool)

(assert (=> b!948145 m!880899))

(declare-fun m!880901 () Bool)

(assert (=> b!948147 m!880901))

(assert (=> d!114761 m!880845))

(declare-fun m!880903 () Bool)

(assert (=> b!948152 m!880903))

(assert (=> b!948152 m!880903))

(declare-fun m!880905 () Bool)

(assert (=> b!948152 m!880905))

(assert (=> b!948159 m!880903))

(assert (=> b!948159 m!880903))

(declare-fun m!880907 () Bool)

(assert (=> b!948159 m!880907))

(declare-fun m!880909 () Bool)

(assert (=> bm!41181 m!880909))

(declare-fun m!880911 () Bool)

(assert (=> b!948142 m!880911))

(declare-fun m!880913 () Bool)

(assert (=> b!948142 m!880913))

(declare-fun m!880915 () Bool)

(assert (=> b!948142 m!880915))

(declare-fun m!880917 () Bool)

(assert (=> b!948142 m!880917))

(declare-fun m!880919 () Bool)

(assert (=> b!948142 m!880919))

(declare-fun m!880921 () Bool)

(assert (=> b!948142 m!880921))

(declare-fun m!880923 () Bool)

(assert (=> b!948142 m!880923))

(assert (=> b!948142 m!880917))

(assert (=> b!948142 m!880921))

(declare-fun m!880925 () Bool)

(assert (=> b!948142 m!880925))

(declare-fun m!880927 () Bool)

(assert (=> b!948142 m!880927))

(declare-fun m!880929 () Bool)

(assert (=> b!948142 m!880929))

(declare-fun m!880931 () Bool)

(assert (=> b!948142 m!880931))

(declare-fun m!880933 () Bool)

(assert (=> b!948142 m!880933))

(declare-fun m!880935 () Bool)

(assert (=> b!948142 m!880935))

(assert (=> b!948142 m!880903))

(assert (=> b!948142 m!880897))

(assert (=> b!948142 m!880915))

(declare-fun m!880937 () Bool)

(assert (=> b!948142 m!880937))

(assert (=> b!948142 m!880927))

(declare-fun m!880939 () Bool)

(assert (=> b!948142 m!880939))

(assert (=> b!948161 m!880903))

(assert (=> b!948161 m!880903))

(assert (=> b!948161 m!880905))

(declare-fun m!880941 () Bool)

(assert (=> b!948155 m!880941))

(declare-fun m!880943 () Bool)

(assert (=> bm!41182 m!880943))

(declare-fun m!880945 () Bool)

(assert (=> b!948146 m!880945))

(assert (=> b!948146 m!880903))

(declare-fun m!880947 () Bool)

(assert (=> b!948146 m!880947))

(assert (=> b!948146 m!880903))

(declare-fun m!880949 () Bool)

(assert (=> b!948146 m!880949))

(assert (=> b!948146 m!880945))

(declare-fun m!880951 () Bool)

(assert (=> b!948146 m!880951))

(assert (=> b!948146 m!880949))

(assert (=> b!948045 d!114761))

(declare-fun d!114763 () Bool)

(declare-fun res!636183 () Bool)

(declare-fun e!533743 () Bool)

(assert (=> d!114763 (=> (not res!636183) (not e!533743))))

(declare-fun simpleValid!367 (LongMapFixedSize!4890) Bool)

(assert (=> d!114763 (= res!636183 (simpleValid!367 thiss!1141))))

(assert (=> d!114763 (= (valid!1861 thiss!1141) e!533743)))

(declare-fun b!948171 () Bool)

(declare-fun res!636184 () Bool)

(assert (=> b!948171 (=> (not res!636184) (not e!533743))))

(declare-fun arrayCountValidKeys!0 (array!57412 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948171 (= res!636184 (= (arrayCountValidKeys!0 (_keys!10660 thiss!1141) #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))) (_size!2500 thiss!1141)))))

(declare-fun b!948172 () Bool)

(declare-fun res!636185 () Bool)

(assert (=> b!948172 (=> (not res!636185) (not e!533743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57412 (_ BitVec 32)) Bool)

(assert (=> b!948172 (= res!636185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)))))

(declare-fun b!948173 () Bool)

(declare-datatypes ((List!19317 0))(
  ( (Nil!19314) (Cons!19313 (h!20469 (_ BitVec 64)) (t!27644 List!19317)) )
))
(declare-fun arrayNoDuplicates!0 (array!57412 (_ BitVec 32) List!19317) Bool)

(assert (=> b!948173 (= e!533743 (arrayNoDuplicates!0 (_keys!10660 thiss!1141) #b00000000000000000000000000000000 Nil!19314))))

(assert (= (and d!114763 res!636183) b!948171))

(assert (= (and b!948171 res!636184) b!948172))

(assert (= (and b!948172 res!636185) b!948173))

(declare-fun m!880953 () Bool)

(assert (=> d!114763 m!880953))

(declare-fun m!880955 () Bool)

(assert (=> b!948171 m!880955))

(declare-fun m!880957 () Bool)

(assert (=> b!948172 m!880957))

(declare-fun m!880959 () Bool)

(assert (=> b!948173 m!880959))

(assert (=> start!80912 d!114763))

(declare-fun condMapEmpty!32947 () Bool)

(declare-fun mapDefault!32947 () ValueCell!9870)

(assert (=> mapNonEmpty!32941 (= condMapEmpty!32947 (= mapRest!32941 ((as const (Array (_ BitVec 32) ValueCell!9870)) mapDefault!32947)))))

(declare-fun e!533748 () Bool)

(declare-fun mapRes!32947 () Bool)

(assert (=> mapNonEmpty!32941 (= tp!63156 (and e!533748 mapRes!32947))))

(declare-fun b!948180 () Bool)

(declare-fun e!533749 () Bool)

(assert (=> b!948180 (= e!533749 tp_is_empty!20703)))

(declare-fun mapIsEmpty!32947 () Bool)

(assert (=> mapIsEmpty!32947 mapRes!32947))

(declare-fun b!948181 () Bool)

(assert (=> b!948181 (= e!533748 tp_is_empty!20703)))

(declare-fun mapNonEmpty!32947 () Bool)

(declare-fun tp!63165 () Bool)

(assert (=> mapNonEmpty!32947 (= mapRes!32947 (and tp!63165 e!533749))))

(declare-fun mapRest!32947 () (Array (_ BitVec 32) ValueCell!9870))

(declare-fun mapKey!32947 () (_ BitVec 32))

(declare-fun mapValue!32947 () ValueCell!9870)

(assert (=> mapNonEmpty!32947 (= mapRest!32941 (store mapRest!32947 mapKey!32947 mapValue!32947))))

(assert (= (and mapNonEmpty!32941 condMapEmpty!32947) mapIsEmpty!32947))

(assert (= (and mapNonEmpty!32941 (not condMapEmpty!32947)) mapNonEmpty!32947))

(assert (= (and mapNonEmpty!32947 ((_ is ValueCellFull!9870) mapValue!32947)) b!948180))

(assert (= (and mapNonEmpty!32941 ((_ is ValueCellFull!9870) mapDefault!32947)) b!948181))

(declare-fun m!880961 () Bool)

(assert (=> mapNonEmpty!32947 m!880961))

(declare-fun b_lambda!14309 () Bool)

(assert (= b_lambda!14307 (or (and b!948037 b_free!18195) b_lambda!14309)))

(check-sat (not b!948152) (not b!948145) (not b!948173) (not b!948097) (not b!948161) (not b!948159) (not b!948172) (not d!114751) (not bm!41181) (not mapNonEmpty!32947) (not bm!41180) (not b!948147) (not b!948155) (not d!114763) (not b!948099) b_and!29625 (not bm!41178) tp_is_empty!20703 (not bm!41182) (not b!948142) (not b!948146) (not b!948086) (not d!114761) (not b!948171) (not d!114759) (not b_lambda!14309) (not b_next!18195))
(check-sat b_and!29625 (not b_next!18195))
(get-model)

(declare-fun d!114765 () Bool)

(declare-fun isEmpty!704 (Option!496) Bool)

(assert (=> d!114765 (= (isDefined!362 (getValueByKey!490 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756)) (not (isEmpty!704 (getValueByKey!490 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756))))))

(declare-fun bs!26644 () Bool)

(assert (= bs!26644 d!114765))

(assert (=> bs!26644 m!880891))

(declare-fun m!880963 () Bool)

(assert (=> bs!26644 m!880963))

(assert (=> b!948099 d!114765))

(declare-fun b!948192 () Bool)

(declare-fun e!533755 () Option!496)

(assert (=> b!948192 (= e!533755 (getValueByKey!490 (t!27641 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))) key!756))))

(declare-fun b!948190 () Bool)

(declare-fun e!533754 () Option!496)

(assert (=> b!948190 (= e!533754 (Some!495 (_2!6772 (h!20468 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))))))))

(declare-fun b!948191 () Bool)

(assert (=> b!948191 (= e!533754 e!533755)))

(declare-fun c!98814 () Bool)

(assert (=> b!948191 (= c!98814 (and ((_ is Cons!19312) (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))) (not (= (_1!6772 (h!20468 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))))) key!756))))))

(declare-fun b!948193 () Bool)

(assert (=> b!948193 (= e!533755 None!494)))

(declare-fun d!114767 () Bool)

(declare-fun c!98813 () Bool)

(assert (=> d!114767 (= c!98813 (and ((_ is Cons!19312) (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))) (= (_1!6772 (h!20468 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))))) key!756)))))

(assert (=> d!114767 (= (getValueByKey!490 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756) e!533754)))

(assert (= (and d!114767 c!98813) b!948190))

(assert (= (and d!114767 (not c!98813)) b!948191))

(assert (= (and b!948191 c!98814) b!948192))

(assert (= (and b!948191 (not c!98814)) b!948193))

(declare-fun m!880965 () Bool)

(assert (=> b!948192 m!880965))

(assert (=> b!948099 d!114767))

(declare-fun d!114769 () Bool)

(declare-fun lt!426934 () (_ BitVec 32))

(assert (=> d!114769 (and (bvsge lt!426934 #b00000000000000000000000000000000) (bvsle lt!426934 (bvsub (size!28086 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!533761 () (_ BitVec 32))

(assert (=> d!114769 (= lt!426934 e!533761)))

(declare-fun c!98820 () Bool)

(assert (=> d!114769 (= c!98820 (bvsge #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(assert (=> d!114769 (and (bvsle #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28086 (_keys!10660 thiss!1141)) (size!28086 (_keys!10660 thiss!1141))))))

(assert (=> d!114769 (= (arrayCountValidKeys!0 (_keys!10660 thiss!1141) #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))) lt!426934)))

(declare-fun b!948202 () Bool)

(declare-fun e!533760 () (_ BitVec 32))

(declare-fun call!41190 () (_ BitVec 32))

(assert (=> b!948202 (= e!533760 call!41190)))

(declare-fun b!948203 () Bool)

(assert (=> b!948203 (= e!533760 (bvadd #b00000000000000000000000000000001 call!41190))))

(declare-fun b!948204 () Bool)

(assert (=> b!948204 (= e!533761 e!533760)))

(declare-fun c!98819 () Bool)

(assert (=> b!948204 (= c!98819 (validKeyInArray!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41187 () Bool)

(assert (=> bm!41187 (= call!41190 (arrayCountValidKeys!0 (_keys!10660 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28086 (_keys!10660 thiss!1141))))))

(declare-fun b!948205 () Bool)

(assert (=> b!948205 (= e!533761 #b00000000000000000000000000000000)))

(assert (= (and d!114769 c!98820) b!948205))

(assert (= (and d!114769 (not c!98820)) b!948204))

(assert (= (and b!948204 c!98819) b!948203))

(assert (= (and b!948204 (not c!98819)) b!948202))

(assert (= (or b!948203 b!948202) bm!41187))

(assert (=> b!948204 m!880903))

(assert (=> b!948204 m!880903))

(assert (=> b!948204 m!880905))

(declare-fun m!880967 () Bool)

(assert (=> bm!41187 m!880967))

(assert (=> b!948171 d!114769))

(declare-fun d!114771 () Bool)

(declare-fun get!14501 (Option!496) V!32569)

(assert (=> d!114771 (= (apply!871 lt!426920 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14501 (getValueByKey!490 (toList!6125 lt!426920) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26645 () Bool)

(assert (= bs!26645 d!114771))

(declare-fun m!880969 () Bool)

(assert (=> bs!26645 m!880969))

(assert (=> bs!26645 m!880969))

(declare-fun m!880971 () Bool)

(assert (=> bs!26645 m!880971))

(assert (=> b!948155 d!114771))

(assert (=> d!114761 d!114753))

(declare-fun b!948224 () Bool)

(declare-fun e!533775 () SeekEntryResult!9124)

(assert (=> b!948224 (= e!533775 (Intermediate!9124 false (toIndex!0 key!756 (mask!27497 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!948225 () Bool)

(declare-fun lt!426940 () SeekEntryResult!9124)

(assert (=> b!948225 (and (bvsge (index!38869 lt!426940) #b00000000000000000000000000000000) (bvslt (index!38869 lt!426940) (size!28086 (_keys!10660 thiss!1141))))))

(declare-fun e!533776 () Bool)

(assert (=> b!948225 (= e!533776 (= (select (arr!27613 (_keys!10660 thiss!1141)) (index!38869 lt!426940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948226 () Bool)

(declare-fun e!533772 () Bool)

(declare-fun e!533774 () Bool)

(assert (=> b!948226 (= e!533772 e!533774)))

(declare-fun res!636192 () Bool)

(assert (=> b!948226 (= res!636192 (and ((_ is Intermediate!9124) lt!426940) (not (undefined!9936 lt!426940)) (bvslt (x!81576 lt!426940) #b01111111111111111111111111111110) (bvsge (x!81576 lt!426940) #b00000000000000000000000000000000) (bvsge (x!81576 lt!426940) #b00000000000000000000000000000000)))))

(assert (=> b!948226 (=> (not res!636192) (not e!533774))))

(declare-fun b!948227 () Bool)

(declare-fun e!533773 () SeekEntryResult!9124)

(assert (=> b!948227 (= e!533773 (Intermediate!9124 true (toIndex!0 key!756 (mask!27497 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!948228 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948228 (= e!533775 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27497 thiss!1141)) #b00000000000000000000000000000000 (mask!27497 thiss!1141)) key!756 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)))))

(declare-fun b!948229 () Bool)

(assert (=> b!948229 (= e!533773 e!533775)))

(declare-fun c!98827 () Bool)

(declare-fun lt!426939 () (_ BitVec 64))

(assert (=> b!948229 (= c!98827 (or (= lt!426939 key!756) (= (bvadd lt!426939 lt!426939) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948231 () Bool)

(assert (=> b!948231 (and (bvsge (index!38869 lt!426940) #b00000000000000000000000000000000) (bvslt (index!38869 lt!426940) (size!28086 (_keys!10660 thiss!1141))))))

(declare-fun res!636194 () Bool)

(assert (=> b!948231 (= res!636194 (= (select (arr!27613 (_keys!10660 thiss!1141)) (index!38869 lt!426940)) key!756))))

(assert (=> b!948231 (=> res!636194 e!533776)))

(assert (=> b!948231 (= e!533774 e!533776)))

(declare-fun b!948232 () Bool)

(assert (=> b!948232 (= e!533772 (bvsge (x!81576 lt!426940) #b01111111111111111111111111111110))))

(declare-fun d!114773 () Bool)

(assert (=> d!114773 e!533772))

(declare-fun c!98829 () Bool)

(assert (=> d!114773 (= c!98829 (and ((_ is Intermediate!9124) lt!426940) (undefined!9936 lt!426940)))))

(assert (=> d!114773 (= lt!426940 e!533773)))

(declare-fun c!98828 () Bool)

(assert (=> d!114773 (= c!98828 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114773 (= lt!426939 (select (arr!27613 (_keys!10660 thiss!1141)) (toIndex!0 key!756 (mask!27497 thiss!1141))))))

(assert (=> d!114773 (validMask!0 (mask!27497 thiss!1141))))

(assert (=> d!114773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27497 thiss!1141)) key!756 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)) lt!426940)))

(declare-fun b!948230 () Bool)

(assert (=> b!948230 (and (bvsge (index!38869 lt!426940) #b00000000000000000000000000000000) (bvslt (index!38869 lt!426940) (size!28086 (_keys!10660 thiss!1141))))))

(declare-fun res!636193 () Bool)

(assert (=> b!948230 (= res!636193 (= (select (arr!27613 (_keys!10660 thiss!1141)) (index!38869 lt!426940)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948230 (=> res!636193 e!533776)))

(assert (= (and d!114773 c!98828) b!948227))

(assert (= (and d!114773 (not c!98828)) b!948229))

(assert (= (and b!948229 c!98827) b!948224))

(assert (= (and b!948229 (not c!98827)) b!948228))

(assert (= (and d!114773 c!98829) b!948232))

(assert (= (and d!114773 (not c!98829)) b!948226))

(assert (= (and b!948226 res!636192) b!948231))

(assert (= (and b!948231 (not res!636194)) b!948230))

(assert (= (and b!948230 (not res!636193)) b!948225))

(declare-fun m!880973 () Bool)

(assert (=> b!948231 m!880973))

(assert (=> b!948230 m!880973))

(assert (=> b!948225 m!880973))

(assert (=> b!948228 m!880883))

(declare-fun m!880975 () Bool)

(assert (=> b!948228 m!880975))

(assert (=> b!948228 m!880975))

(declare-fun m!880977 () Bool)

(assert (=> b!948228 m!880977))

(assert (=> d!114773 m!880883))

(declare-fun m!880979 () Bool)

(assert (=> d!114773 m!880979))

(assert (=> d!114773 m!880845))

(assert (=> d!114751 d!114773))

(declare-fun d!114775 () Bool)

(declare-fun lt!426946 () (_ BitVec 32))

(declare-fun lt!426945 () (_ BitVec 32))

(assert (=> d!114775 (= lt!426946 (bvmul (bvxor lt!426945 (bvlshr lt!426945 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114775 (= lt!426945 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114775 (and (bvsge (mask!27497 thiss!1141) #b00000000000000000000000000000000) (let ((res!636195 (let ((h!20470 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81592 (bvmul (bvxor h!20470 (bvlshr h!20470 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81592 (bvlshr x!81592 #b00000000000000000000000000001101)) (mask!27497 thiss!1141)))))) (and (bvslt res!636195 (bvadd (mask!27497 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636195 #b00000000000000000000000000000000))))))

(assert (=> d!114775 (= (toIndex!0 key!756 (mask!27497 thiss!1141)) (bvand (bvxor lt!426946 (bvlshr lt!426946 #b00000000000000000000000000001101)) (mask!27497 thiss!1141)))))

(assert (=> d!114751 d!114775))

(assert (=> d!114751 d!114753))

(declare-fun b!948243 () Bool)

(declare-fun res!636207 () Bool)

(declare-fun e!533779 () Bool)

(assert (=> b!948243 (=> (not res!636207) (not e!533779))))

(declare-fun size!28089 (LongMapFixedSize!4890) (_ BitVec 32))

(assert (=> b!948243 (= res!636207 (= (size!28089 thiss!1141) (bvadd (_size!2500 thiss!1141) (bvsdiv (bvadd (extraKeys!5477 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!114777 () Bool)

(declare-fun res!636206 () Bool)

(assert (=> d!114777 (=> (not res!636206) (not e!533779))))

(assert (=> d!114777 (= res!636206 (validMask!0 (mask!27497 thiss!1141)))))

(assert (=> d!114777 (= (simpleValid!367 thiss!1141) e!533779)))

(declare-fun b!948242 () Bool)

(declare-fun res!636205 () Bool)

(assert (=> b!948242 (=> (not res!636205) (not e!533779))))

(assert (=> b!948242 (= res!636205 (bvsge (size!28089 thiss!1141) (_size!2500 thiss!1141)))))

(declare-fun b!948244 () Bool)

(assert (=> b!948244 (= e!533779 (and (bvsge (extraKeys!5477 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5477 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2500 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!948241 () Bool)

(declare-fun res!636204 () Bool)

(assert (=> b!948241 (=> (not res!636204) (not e!533779))))

(assert (=> b!948241 (= res!636204 (and (= (size!28085 (_values!5768 thiss!1141)) (bvadd (mask!27497 thiss!1141) #b00000000000000000000000000000001)) (= (size!28086 (_keys!10660 thiss!1141)) (size!28085 (_values!5768 thiss!1141))) (bvsge (_size!2500 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2500 thiss!1141) (bvadd (mask!27497 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114777 res!636206) b!948241))

(assert (= (and b!948241 res!636204) b!948242))

(assert (= (and b!948242 res!636205) b!948243))

(assert (= (and b!948243 res!636207) b!948244))

(declare-fun m!880981 () Bool)

(assert (=> b!948243 m!880981))

(assert (=> d!114777 m!880845))

(assert (=> b!948242 m!880981))

(assert (=> d!114763 d!114777))

(declare-fun d!114779 () Bool)

(declare-fun e!533782 () Bool)

(assert (=> d!114779 e!533782))

(declare-fun res!636212 () Bool)

(assert (=> d!114779 (=> (not res!636212) (not e!533782))))

(declare-fun lt!426958 () ListLongMap!12219)

(assert (=> d!114779 (= res!636212 (contains!5207 lt!426958 (_1!6772 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))))))

(declare-fun lt!426956 () List!19316)

(assert (=> d!114779 (= lt!426958 (ListLongMap!12220 lt!426956))))

(declare-fun lt!426955 () Unit!31945)

(declare-fun lt!426957 () Unit!31945)

(assert (=> d!114779 (= lt!426955 lt!426957)))

(assert (=> d!114779 (= (getValueByKey!490 lt!426956 (_1!6772 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!262 (List!19316 (_ BitVec 64) V!32569) Unit!31945)

(assert (=> d!114779 (= lt!426957 (lemmaContainsTupThenGetReturnValue!262 lt!426956 (_1!6772 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))))))

(declare-fun insertStrictlySorted!319 (List!19316 (_ BitVec 64) V!32569) List!19316)

(assert (=> d!114779 (= lt!426956 (insertStrictlySorted!319 (toList!6125 call!41186) (_1!6772 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))))))

(assert (=> d!114779 (= (+!2855 call!41186 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))) lt!426958)))

(declare-fun b!948249 () Bool)

(declare-fun res!636213 () Bool)

(assert (=> b!948249 (=> (not res!636213) (not e!533782))))

(assert (=> b!948249 (= res!636213 (= (getValueByKey!490 (toList!6125 lt!426958) (_1!6772 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))))))))

(declare-fun b!948250 () Bool)

(declare-fun contains!5208 (List!19316 tuple2!13522) Bool)

(assert (=> b!948250 (= e!533782 (contains!5208 (toList!6125 lt!426958) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))))))

(assert (= (and d!114779 res!636212) b!948249))

(assert (= (and b!948249 res!636213) b!948250))

(declare-fun m!880983 () Bool)

(assert (=> d!114779 m!880983))

(declare-fun m!880985 () Bool)

(assert (=> d!114779 m!880985))

(declare-fun m!880987 () Bool)

(assert (=> d!114779 m!880987))

(declare-fun m!880989 () Bool)

(assert (=> d!114779 m!880989))

(declare-fun m!880991 () Bool)

(assert (=> b!948249 m!880991))

(declare-fun m!880993 () Bool)

(assert (=> b!948250 m!880993))

(assert (=> b!948147 d!114779))

(declare-fun d!114781 () Bool)

(assert (=> d!114781 (= (apply!871 lt!426920 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)) (get!14501 (getValueByKey!490 (toList!6125 lt!426920) (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26646 () Bool)

(assert (= bs!26646 d!114781))

(assert (=> bs!26646 m!880903))

(declare-fun m!880995 () Bool)

(assert (=> bs!26646 m!880995))

(assert (=> bs!26646 m!880995))

(declare-fun m!880997 () Bool)

(assert (=> bs!26646 m!880997))

(assert (=> b!948146 d!114781))

(declare-fun d!114783 () Bool)

(declare-fun c!98832 () Bool)

(assert (=> d!114783 (= c!98832 ((_ is ValueCellFull!9870) (select (arr!27612 (_values!5768 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!533785 () V!32569)

(assert (=> d!114783 (= (get!14500 (select (arr!27612 (_values!5768 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1644 (defaultEntry!5745 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!533785)))

(declare-fun b!948255 () Bool)

(declare-fun get!14502 (ValueCell!9870 V!32569) V!32569)

(assert (=> b!948255 (= e!533785 (get!14502 (select (arr!27612 (_values!5768 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1644 (defaultEntry!5745 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948256 () Bool)

(declare-fun get!14503 (ValueCell!9870 V!32569) V!32569)

(assert (=> b!948256 (= e!533785 (get!14503 (select (arr!27612 (_values!5768 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1644 (defaultEntry!5745 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114783 c!98832) b!948255))

(assert (= (and d!114783 (not c!98832)) b!948256))

(assert (=> b!948255 m!880949))

(assert (=> b!948255 m!880945))

(declare-fun m!880999 () Bool)

(assert (=> b!948255 m!880999))

(assert (=> b!948256 m!880949))

(assert (=> b!948256 m!880945))

(declare-fun m!881001 () Bool)

(assert (=> b!948256 m!881001))

(assert (=> b!948146 d!114783))

(declare-fun d!114785 () Bool)

(assert (=> d!114785 (isDefined!362 (getValueByKey!490 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756))))

(declare-fun lt!426961 () Unit!31945)

(declare-fun choose!1572 (List!19316 (_ BitVec 64)) Unit!31945)

(assert (=> d!114785 (= lt!426961 (choose!1572 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756))))

(declare-fun e!533788 () Bool)

(assert (=> d!114785 e!533788))

(declare-fun res!636216 () Bool)

(assert (=> d!114785 (=> (not res!636216) (not e!533788))))

(declare-fun isStrictlySorted!508 (List!19316) Bool)

(assert (=> d!114785 (= res!636216 (isStrictlySorted!508 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))))))

(assert (=> d!114785 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756) lt!426961)))

(declare-fun b!948259 () Bool)

(assert (=> b!948259 (= e!533788 (containsKey!457 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756))))

(assert (= (and d!114785 res!636216) b!948259))

(assert (=> d!114785 m!880891))

(assert (=> d!114785 m!880891))

(assert (=> d!114785 m!880893))

(declare-fun m!881003 () Bool)

(assert (=> d!114785 m!881003))

(declare-fun m!881005 () Bool)

(assert (=> d!114785 m!881005))

(assert (=> b!948259 m!880887))

(assert (=> b!948097 d!114785))

(assert (=> b!948097 d!114765))

(assert (=> b!948097 d!114767))

(declare-fun d!114787 () Bool)

(assert (=> d!114787 (= (validKeyInArray!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948161 d!114787))

(declare-fun d!114789 () Bool)

(declare-fun e!533789 () Bool)

(assert (=> d!114789 e!533789))

(declare-fun res!636217 () Bool)

(assert (=> d!114789 (=> (not res!636217) (not e!533789))))

(declare-fun lt!426965 () ListLongMap!12219)

(assert (=> d!114789 (= res!636217 (contains!5207 lt!426965 (_1!6772 (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))))))))

(declare-fun lt!426963 () List!19316)

(assert (=> d!114789 (= lt!426965 (ListLongMap!12220 lt!426963))))

(declare-fun lt!426962 () Unit!31945)

(declare-fun lt!426964 () Unit!31945)

(assert (=> d!114789 (= lt!426962 lt!426964)))

(assert (=> d!114789 (= (getValueByKey!490 lt!426963 (_1!6772 (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))))) (Some!495 (_2!6772 (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))))))))

(assert (=> d!114789 (= lt!426964 (lemmaContainsTupThenGetReturnValue!262 lt!426963 (_1!6772 (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))) (_2!6772 (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))))))))

(assert (=> d!114789 (= lt!426963 (insertStrictlySorted!319 (toList!6125 (ite c!98806 call!41184 (ite c!98808 call!41185 call!41181))) (_1!6772 (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))) (_2!6772 (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))))))))

(assert (=> d!114789 (= (+!2855 (ite c!98806 call!41184 (ite c!98808 call!41185 call!41181)) (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))) lt!426965)))

(declare-fun b!948260 () Bool)

(declare-fun res!636218 () Bool)

(assert (=> b!948260 (=> (not res!636218) (not e!533789))))

(assert (=> b!948260 (= res!636218 (= (getValueByKey!490 (toList!6125 lt!426965) (_1!6772 (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141))))) (Some!495 (_2!6772 (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))))))))

(declare-fun b!948261 () Bool)

(assert (=> b!948261 (= e!533789 (contains!5208 (toList!6125 lt!426965) (ite (or c!98806 c!98808) (tuple2!13523 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5581 thiss!1141)) (tuple2!13523 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5581 thiss!1141)))))))

(assert (= (and d!114789 res!636217) b!948260))

(assert (= (and b!948260 res!636218) b!948261))

(declare-fun m!881007 () Bool)

(assert (=> d!114789 m!881007))

(declare-fun m!881009 () Bool)

(assert (=> d!114789 m!881009))

(declare-fun m!881011 () Bool)

(assert (=> d!114789 m!881011))

(declare-fun m!881013 () Bool)

(assert (=> d!114789 m!881013))

(declare-fun m!881015 () Bool)

(assert (=> b!948260 m!881015))

(declare-fun m!881017 () Bool)

(assert (=> b!948261 m!881017))

(assert (=> bm!41182 d!114789))

(declare-fun d!114791 () Bool)

(assert (=> d!114791 (= (apply!871 lt!426920 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14501 (getValueByKey!490 (toList!6125 lt!426920) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26647 () Bool)

(assert (= bs!26647 d!114791))

(declare-fun m!881019 () Bool)

(assert (=> bs!26647 m!881019))

(assert (=> bs!26647 m!881019))

(declare-fun m!881021 () Bool)

(assert (=> bs!26647 m!881021))

(assert (=> b!948145 d!114791))

(declare-fun b!948275 () Bool)

(declare-fun e!533797 () SeekEntryResult!9124)

(assert (=> b!948275 (= e!533797 (MissingVacant!9124 (index!38869 lt!426853)))))

(declare-fun b!948276 () Bool)

(declare-fun c!98840 () Bool)

(declare-fun lt!426970 () (_ BitVec 64))

(assert (=> b!948276 (= c!98840 (= lt!426970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533796 () SeekEntryResult!9124)

(assert (=> b!948276 (= e!533796 e!533797)))

(declare-fun b!948277 () Bool)

(declare-fun e!533798 () SeekEntryResult!9124)

(assert (=> b!948277 (= e!533798 e!533796)))

(declare-fun c!98841 () Bool)

(assert (=> b!948277 (= c!98841 (= lt!426970 key!756))))

(declare-fun b!948278 () Bool)

(assert (=> b!948278 (= e!533797 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81576 lt!426853) #b00000000000000000000000000000001) (nextIndex!0 (index!38869 lt!426853) (x!81576 lt!426853) (mask!27497 thiss!1141)) (index!38869 lt!426853) key!756 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)))))

(declare-fun b!948279 () Bool)

(assert (=> b!948279 (= e!533798 Undefined!9124)))

(declare-fun d!114793 () Bool)

(declare-fun lt!426971 () SeekEntryResult!9124)

(assert (=> d!114793 (and (or ((_ is Undefined!9124) lt!426971) (not ((_ is Found!9124) lt!426971)) (and (bvsge (index!38868 lt!426971) #b00000000000000000000000000000000) (bvslt (index!38868 lt!426971) (size!28086 (_keys!10660 thiss!1141))))) (or ((_ is Undefined!9124) lt!426971) ((_ is Found!9124) lt!426971) (not ((_ is MissingVacant!9124) lt!426971)) (not (= (index!38870 lt!426971) (index!38869 lt!426853))) (and (bvsge (index!38870 lt!426971) #b00000000000000000000000000000000) (bvslt (index!38870 lt!426971) (size!28086 (_keys!10660 thiss!1141))))) (or ((_ is Undefined!9124) lt!426971) (ite ((_ is Found!9124) lt!426971) (= (select (arr!27613 (_keys!10660 thiss!1141)) (index!38868 lt!426971)) key!756) (and ((_ is MissingVacant!9124) lt!426971) (= (index!38870 lt!426971) (index!38869 lt!426853)) (= (select (arr!27613 (_keys!10660 thiss!1141)) (index!38870 lt!426971)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114793 (= lt!426971 e!533798)))

(declare-fun c!98839 () Bool)

(assert (=> d!114793 (= c!98839 (bvsge (x!81576 lt!426853) #b01111111111111111111111111111110))))

(assert (=> d!114793 (= lt!426970 (select (arr!27613 (_keys!10660 thiss!1141)) (index!38869 lt!426853)))))

(assert (=> d!114793 (validMask!0 (mask!27497 thiss!1141))))

(assert (=> d!114793 (= (seekKeyOrZeroReturnVacant!0 (x!81576 lt!426853) (index!38869 lt!426853) (index!38869 lt!426853) key!756 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)) lt!426971)))

(declare-fun b!948274 () Bool)

(assert (=> b!948274 (= e!533796 (Found!9124 (index!38869 lt!426853)))))

(assert (= (and d!114793 c!98839) b!948279))

(assert (= (and d!114793 (not c!98839)) b!948277))

(assert (= (and b!948277 c!98841) b!948274))

(assert (= (and b!948277 (not c!98841)) b!948276))

(assert (= (and b!948276 c!98840) b!948275))

(assert (= (and b!948276 (not c!98840)) b!948278))

(declare-fun m!881023 () Bool)

(assert (=> b!948278 m!881023))

(assert (=> b!948278 m!881023))

(declare-fun m!881025 () Bool)

(assert (=> b!948278 m!881025))

(declare-fun m!881027 () Bool)

(assert (=> d!114793 m!881027))

(declare-fun m!881029 () Bool)

(assert (=> d!114793 m!881029))

(assert (=> d!114793 m!880877))

(assert (=> d!114793 m!880845))

(assert (=> b!948086 d!114793))

(assert (=> b!948152 d!114787))

(declare-fun d!114795 () Bool)

(declare-fun e!533799 () Bool)

(assert (=> d!114795 e!533799))

(declare-fun res!636219 () Bool)

(assert (=> d!114795 (=> res!636219 e!533799)))

(declare-fun lt!426974 () Bool)

(assert (=> d!114795 (= res!636219 (not lt!426974))))

(declare-fun lt!426972 () Bool)

(assert (=> d!114795 (= lt!426974 lt!426972)))

(declare-fun lt!426973 () Unit!31945)

(declare-fun e!533800 () Unit!31945)

(assert (=> d!114795 (= lt!426973 e!533800)))

(declare-fun c!98842 () Bool)

(assert (=> d!114795 (= c!98842 lt!426972)))

(assert (=> d!114795 (= lt!426972 (containsKey!457 (toList!6125 lt!426920) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114795 (= (contains!5207 lt!426920 #b1000000000000000000000000000000000000000000000000000000000000000) lt!426974)))

(declare-fun b!948280 () Bool)

(declare-fun lt!426975 () Unit!31945)

(assert (=> b!948280 (= e!533800 lt!426975)))

(assert (=> b!948280 (= lt!426975 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6125 lt!426920) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948280 (isDefined!362 (getValueByKey!490 (toList!6125 lt!426920) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948281 () Bool)

(declare-fun Unit!31949 () Unit!31945)

(assert (=> b!948281 (= e!533800 Unit!31949)))

(declare-fun b!948282 () Bool)

(assert (=> b!948282 (= e!533799 (isDefined!362 (getValueByKey!490 (toList!6125 lt!426920) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114795 c!98842) b!948280))

(assert (= (and d!114795 (not c!98842)) b!948281))

(assert (= (and d!114795 (not res!636219)) b!948282))

(declare-fun m!881031 () Bool)

(assert (=> d!114795 m!881031))

(declare-fun m!881033 () Bool)

(assert (=> b!948280 m!881033))

(assert (=> b!948280 m!881019))

(assert (=> b!948280 m!881019))

(declare-fun m!881035 () Bool)

(assert (=> b!948280 m!881035))

(assert (=> b!948282 m!881019))

(assert (=> b!948282 m!881019))

(assert (=> b!948282 m!881035))

(assert (=> bm!41178 d!114795))

(declare-fun d!114797 () Bool)

(declare-fun res!636224 () Bool)

(declare-fun e!533805 () Bool)

(assert (=> d!114797 (=> res!636224 e!533805)))

(assert (=> d!114797 (= res!636224 (and ((_ is Cons!19312) (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))) (= (_1!6772 (h!20468 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))))) key!756)))))

(assert (=> d!114797 (= (containsKey!457 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))) key!756) e!533805)))

(declare-fun b!948287 () Bool)

(declare-fun e!533806 () Bool)

(assert (=> b!948287 (= e!533805 e!533806)))

(declare-fun res!636225 () Bool)

(assert (=> b!948287 (=> (not res!636225) (not e!533806))))

(assert (=> b!948287 (= res!636225 (and (or (not ((_ is Cons!19312) (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))))) (bvsle (_1!6772 (h!20468 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))))) key!756)) ((_ is Cons!19312) (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))) (bvslt (_1!6772 (h!20468 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141))))) key!756)))))

(declare-fun b!948288 () Bool)

(assert (=> b!948288 (= e!533806 (containsKey!457 (t!27641 (toList!6125 (getCurrentListMap!3358 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)))) key!756))))

(assert (= (and d!114797 (not res!636224)) b!948287))

(assert (= (and b!948287 res!636225) b!948288))

(declare-fun m!881037 () Bool)

(assert (=> b!948288 m!881037))

(assert (=> d!114759 d!114797))

(declare-fun d!114799 () Bool)

(declare-fun e!533807 () Bool)

(assert (=> d!114799 e!533807))

(declare-fun res!636226 () Bool)

(assert (=> d!114799 (=> res!636226 e!533807)))

(declare-fun lt!426978 () Bool)

(assert (=> d!114799 (= res!636226 (not lt!426978))))

(declare-fun lt!426976 () Bool)

(assert (=> d!114799 (= lt!426978 lt!426976)))

(declare-fun lt!426977 () Unit!31945)

(declare-fun e!533808 () Unit!31945)

(assert (=> d!114799 (= lt!426977 e!533808)))

(declare-fun c!98843 () Bool)

(assert (=> d!114799 (= c!98843 lt!426976)))

(assert (=> d!114799 (= lt!426976 (containsKey!457 (toList!6125 lt!426920) (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114799 (= (contains!5207 lt!426920 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)) lt!426978)))

(declare-fun b!948289 () Bool)

(declare-fun lt!426979 () Unit!31945)

(assert (=> b!948289 (= e!533808 lt!426979)))

(assert (=> b!948289 (= lt!426979 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6125 lt!426920) (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948289 (isDefined!362 (getValueByKey!490 (toList!6125 lt!426920) (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948290 () Bool)

(declare-fun Unit!31950 () Unit!31945)

(assert (=> b!948290 (= e!533808 Unit!31950)))

(declare-fun b!948291 () Bool)

(assert (=> b!948291 (= e!533807 (isDefined!362 (getValueByKey!490 (toList!6125 lt!426920) (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114799 c!98843) b!948289))

(assert (= (and d!114799 (not c!98843)) b!948290))

(assert (= (and d!114799 (not res!636226)) b!948291))

(assert (=> d!114799 m!880903))

(declare-fun m!881039 () Bool)

(assert (=> d!114799 m!881039))

(assert (=> b!948289 m!880903))

(declare-fun m!881041 () Bool)

(assert (=> b!948289 m!881041))

(assert (=> b!948289 m!880903))

(assert (=> b!948289 m!880995))

(assert (=> b!948289 m!880995))

(declare-fun m!881043 () Bool)

(assert (=> b!948289 m!881043))

(assert (=> b!948291 m!880903))

(assert (=> b!948291 m!880995))

(assert (=> b!948291 m!880995))

(assert (=> b!948291 m!881043))

(assert (=> b!948159 d!114799))

(declare-fun d!114801 () Bool)

(declare-fun e!533809 () Bool)

(assert (=> d!114801 e!533809))

(declare-fun res!636227 () Bool)

(assert (=> d!114801 (=> res!636227 e!533809)))

(declare-fun lt!426982 () Bool)

(assert (=> d!114801 (= res!636227 (not lt!426982))))

(declare-fun lt!426980 () Bool)

(assert (=> d!114801 (= lt!426982 lt!426980)))

(declare-fun lt!426981 () Unit!31945)

(declare-fun e!533810 () Unit!31945)

(assert (=> d!114801 (= lt!426981 e!533810)))

(declare-fun c!98844 () Bool)

(assert (=> d!114801 (= c!98844 lt!426980)))

(assert (=> d!114801 (= lt!426980 (containsKey!457 (toList!6125 lt!426920) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114801 (= (contains!5207 lt!426920 #b0000000000000000000000000000000000000000000000000000000000000000) lt!426982)))

(declare-fun b!948292 () Bool)

(declare-fun lt!426983 () Unit!31945)

(assert (=> b!948292 (= e!533810 lt!426983)))

(assert (=> b!948292 (= lt!426983 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6125 lt!426920) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948292 (isDefined!362 (getValueByKey!490 (toList!6125 lt!426920) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948293 () Bool)

(declare-fun Unit!31951 () Unit!31945)

(assert (=> b!948293 (= e!533810 Unit!31951)))

(declare-fun b!948294 () Bool)

(assert (=> b!948294 (= e!533809 (isDefined!362 (getValueByKey!490 (toList!6125 lt!426920) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114801 c!98844) b!948292))

(assert (= (and d!114801 (not c!98844)) b!948293))

(assert (= (and d!114801 (not res!636227)) b!948294))

(declare-fun m!881045 () Bool)

(assert (=> d!114801 m!881045))

(declare-fun m!881047 () Bool)

(assert (=> b!948292 m!881047))

(assert (=> b!948292 m!880969))

(assert (=> b!948292 m!880969))

(declare-fun m!881049 () Bool)

(assert (=> b!948292 m!881049))

(assert (=> b!948294 m!880969))

(assert (=> b!948294 m!880969))

(assert (=> b!948294 m!881049))

(assert (=> bm!41181 d!114801))

(declare-fun d!114803 () Bool)

(assert (=> d!114803 (= (apply!871 (+!2855 lt!426923 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141))) lt!426926) (get!14501 (getValueByKey!490 (toList!6125 (+!2855 lt!426923 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141)))) lt!426926)))))

(declare-fun bs!26648 () Bool)

(assert (= bs!26648 d!114803))

(declare-fun m!881051 () Bool)

(assert (=> bs!26648 m!881051))

(assert (=> bs!26648 m!881051))

(declare-fun m!881053 () Bool)

(assert (=> bs!26648 m!881053))

(assert (=> b!948142 d!114803))

(declare-fun d!114805 () Bool)

(assert (=> d!114805 (= (apply!871 lt!426923 lt!426926) (get!14501 (getValueByKey!490 (toList!6125 lt!426923) lt!426926)))))

(declare-fun bs!26649 () Bool)

(assert (= bs!26649 d!114805))

(declare-fun m!881055 () Bool)

(assert (=> bs!26649 m!881055))

(assert (=> bs!26649 m!881055))

(declare-fun m!881057 () Bool)

(assert (=> bs!26649 m!881057))

(assert (=> b!948142 d!114805))

(declare-fun d!114807 () Bool)

(assert (=> d!114807 (= (apply!871 (+!2855 lt!426927 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141))) lt!426921) (apply!871 lt!426927 lt!426921))))

(declare-fun lt!426986 () Unit!31945)

(declare-fun choose!1573 (ListLongMap!12219 (_ BitVec 64) V!32569 (_ BitVec 64)) Unit!31945)

(assert (=> d!114807 (= lt!426986 (choose!1573 lt!426927 lt!426912 (minValue!5581 thiss!1141) lt!426921))))

(declare-fun e!533813 () Bool)

(assert (=> d!114807 e!533813))

(declare-fun res!636230 () Bool)

(assert (=> d!114807 (=> (not res!636230) (not e!533813))))

(assert (=> d!114807 (= res!636230 (contains!5207 lt!426927 lt!426921))))

(assert (=> d!114807 (= (addApplyDifferent!454 lt!426927 lt!426912 (minValue!5581 thiss!1141) lt!426921) lt!426986)))

(declare-fun b!948298 () Bool)

(assert (=> b!948298 (= e!533813 (not (= lt!426921 lt!426912)))))

(assert (= (and d!114807 res!636230) b!948298))

(assert (=> d!114807 m!880915))

(assert (=> d!114807 m!880937))

(declare-fun m!881059 () Bool)

(assert (=> d!114807 m!881059))

(assert (=> d!114807 m!880915))

(declare-fun m!881061 () Bool)

(assert (=> d!114807 m!881061))

(assert (=> d!114807 m!880929))

(assert (=> b!948142 d!114807))

(declare-fun d!114809 () Bool)

(declare-fun e!533814 () Bool)

(assert (=> d!114809 e!533814))

(declare-fun res!636231 () Bool)

(assert (=> d!114809 (=> res!636231 e!533814)))

(declare-fun lt!426989 () Bool)

(assert (=> d!114809 (= res!636231 (not lt!426989))))

(declare-fun lt!426987 () Bool)

(assert (=> d!114809 (= lt!426989 lt!426987)))

(declare-fun lt!426988 () Unit!31945)

(declare-fun e!533815 () Unit!31945)

(assert (=> d!114809 (= lt!426988 e!533815)))

(declare-fun c!98845 () Bool)

(assert (=> d!114809 (= c!98845 lt!426987)))

(assert (=> d!114809 (= lt!426987 (containsKey!457 (toList!6125 (+!2855 lt!426910 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))) lt!426913))))

(assert (=> d!114809 (= (contains!5207 (+!2855 lt!426910 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141))) lt!426913) lt!426989)))

(declare-fun b!948299 () Bool)

(declare-fun lt!426990 () Unit!31945)

(assert (=> b!948299 (= e!533815 lt!426990)))

(assert (=> b!948299 (= lt!426990 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6125 (+!2855 lt!426910 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))) lt!426913))))

(assert (=> b!948299 (isDefined!362 (getValueByKey!490 (toList!6125 (+!2855 lt!426910 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))) lt!426913))))

(declare-fun b!948300 () Bool)

(declare-fun Unit!31952 () Unit!31945)

(assert (=> b!948300 (= e!533815 Unit!31952)))

(declare-fun b!948301 () Bool)

(assert (=> b!948301 (= e!533814 (isDefined!362 (getValueByKey!490 (toList!6125 (+!2855 lt!426910 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))) lt!426913)))))

(assert (= (and d!114809 c!98845) b!948299))

(assert (= (and d!114809 (not c!98845)) b!948300))

(assert (= (and d!114809 (not res!636231)) b!948301))

(declare-fun m!881063 () Bool)

(assert (=> d!114809 m!881063))

(declare-fun m!881065 () Bool)

(assert (=> b!948299 m!881065))

(declare-fun m!881067 () Bool)

(assert (=> b!948299 m!881067))

(assert (=> b!948299 m!881067))

(declare-fun m!881069 () Bool)

(assert (=> b!948299 m!881069))

(assert (=> b!948301 m!881067))

(assert (=> b!948301 m!881067))

(assert (=> b!948301 m!881069))

(assert (=> b!948142 d!114809))

(declare-fun d!114811 () Bool)

(assert (=> d!114811 (= (apply!871 (+!2855 lt!426927 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141))) lt!426921) (get!14501 (getValueByKey!490 (toList!6125 (+!2855 lt!426927 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141)))) lt!426921)))))

(declare-fun bs!26650 () Bool)

(assert (= bs!26650 d!114811))

(declare-fun m!881071 () Bool)

(assert (=> bs!26650 m!881071))

(assert (=> bs!26650 m!881071))

(declare-fun m!881073 () Bool)

(assert (=> bs!26650 m!881073))

(assert (=> b!948142 d!114811))

(declare-fun d!114813 () Bool)

(declare-fun e!533816 () Bool)

(assert (=> d!114813 e!533816))

(declare-fun res!636232 () Bool)

(assert (=> d!114813 (=> (not res!636232) (not e!533816))))

(declare-fun lt!426994 () ListLongMap!12219)

(assert (=> d!114813 (= res!636232 (contains!5207 lt!426994 (_1!6772 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141)))))))

(declare-fun lt!426992 () List!19316)

(assert (=> d!114813 (= lt!426994 (ListLongMap!12220 lt!426992))))

(declare-fun lt!426991 () Unit!31945)

(declare-fun lt!426993 () Unit!31945)

(assert (=> d!114813 (= lt!426991 lt!426993)))

(assert (=> d!114813 (= (getValueByKey!490 lt!426992 (_1!6772 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141)))))))

(assert (=> d!114813 (= lt!426993 (lemmaContainsTupThenGetReturnValue!262 lt!426992 (_1!6772 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141)))))))

(assert (=> d!114813 (= lt!426992 (insertStrictlySorted!319 (toList!6125 lt!426923) (_1!6772 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141)))))))

(assert (=> d!114813 (= (+!2855 lt!426923 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141))) lt!426994)))

(declare-fun b!948302 () Bool)

(declare-fun res!636233 () Bool)

(assert (=> b!948302 (=> (not res!636233) (not e!533816))))

(assert (=> b!948302 (= res!636233 (= (getValueByKey!490 (toList!6125 lt!426994) (_1!6772 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141))))))))

(declare-fun b!948303 () Bool)

(assert (=> b!948303 (= e!533816 (contains!5208 (toList!6125 lt!426994) (tuple2!13523 lt!426930 (minValue!5581 thiss!1141))))))

(assert (= (and d!114813 res!636232) b!948302))

(assert (= (and b!948302 res!636233) b!948303))

(declare-fun m!881075 () Bool)

(assert (=> d!114813 m!881075))

(declare-fun m!881077 () Bool)

(assert (=> d!114813 m!881077))

(declare-fun m!881079 () Bool)

(assert (=> d!114813 m!881079))

(declare-fun m!881081 () Bool)

(assert (=> d!114813 m!881081))

(declare-fun m!881083 () Bool)

(assert (=> b!948302 m!881083))

(declare-fun m!881085 () Bool)

(assert (=> b!948303 m!881085))

(assert (=> b!948142 d!114813))

(declare-fun d!114815 () Bool)

(declare-fun e!533817 () Bool)

(assert (=> d!114815 e!533817))

(declare-fun res!636234 () Bool)

(assert (=> d!114815 (=> (not res!636234) (not e!533817))))

(declare-fun lt!426998 () ListLongMap!12219)

(assert (=> d!114815 (= res!636234 (contains!5207 lt!426998 (_1!6772 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141)))))))

(declare-fun lt!426996 () List!19316)

(assert (=> d!114815 (= lt!426998 (ListLongMap!12220 lt!426996))))

(declare-fun lt!426995 () Unit!31945)

(declare-fun lt!426997 () Unit!31945)

(assert (=> d!114815 (= lt!426995 lt!426997)))

(assert (=> d!114815 (= (getValueByKey!490 lt!426996 (_1!6772 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141)))))))

(assert (=> d!114815 (= lt!426997 (lemmaContainsTupThenGetReturnValue!262 lt!426996 (_1!6772 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141)))))))

(assert (=> d!114815 (= lt!426996 (insertStrictlySorted!319 (toList!6125 lt!426911) (_1!6772 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141)))))))

(assert (=> d!114815 (= (+!2855 lt!426911 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141))) lt!426998)))

(declare-fun b!948304 () Bool)

(declare-fun res!636235 () Bool)

(assert (=> b!948304 (=> (not res!636235) (not e!533817))))

(assert (=> b!948304 (= res!636235 (= (getValueByKey!490 (toList!6125 lt!426998) (_1!6772 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141))))))))

(declare-fun b!948305 () Bool)

(assert (=> b!948305 (= e!533817 (contains!5208 (toList!6125 lt!426998) (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141))))))

(assert (= (and d!114815 res!636234) b!948304))

(assert (= (and b!948304 res!636235) b!948305))

(declare-fun m!881087 () Bool)

(assert (=> d!114815 m!881087))

(declare-fun m!881089 () Bool)

(assert (=> d!114815 m!881089))

(declare-fun m!881091 () Bool)

(assert (=> d!114815 m!881091))

(declare-fun m!881093 () Bool)

(assert (=> d!114815 m!881093))

(declare-fun m!881095 () Bool)

(assert (=> b!948304 m!881095))

(declare-fun m!881097 () Bool)

(assert (=> b!948305 m!881097))

(assert (=> b!948142 d!114815))

(declare-fun d!114817 () Bool)

(assert (=> d!114817 (= (apply!871 lt!426927 lt!426921) (get!14501 (getValueByKey!490 (toList!6125 lt!426927) lt!426921)))))

(declare-fun bs!26651 () Bool)

(assert (= bs!26651 d!114817))

(declare-fun m!881099 () Bool)

(assert (=> bs!26651 m!881099))

(assert (=> bs!26651 m!881099))

(declare-fun m!881101 () Bool)

(assert (=> bs!26651 m!881101))

(assert (=> b!948142 d!114817))

(declare-fun d!114819 () Bool)

(assert (=> d!114819 (= (apply!871 lt!426911 lt!426922) (get!14501 (getValueByKey!490 (toList!6125 lt!426911) lt!426922)))))

(declare-fun bs!26652 () Bool)

(assert (= bs!26652 d!114819))

(declare-fun m!881103 () Bool)

(assert (=> bs!26652 m!881103))

(assert (=> bs!26652 m!881103))

(declare-fun m!881105 () Bool)

(assert (=> bs!26652 m!881105))

(assert (=> b!948142 d!114819))

(declare-fun b!948330 () Bool)

(assert (=> b!948330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(assert (=> b!948330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28085 (_values!5768 thiss!1141))))))

(declare-fun e!533837 () Bool)

(declare-fun lt!427017 () ListLongMap!12219)

(assert (=> b!948330 (= e!533837 (= (apply!871 lt!427017 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)) (get!14500 (select (arr!27612 (_values!5768 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1644 (defaultEntry!5745 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948331 () Bool)

(declare-fun lt!427019 () Unit!31945)

(declare-fun lt!427013 () Unit!31945)

(assert (=> b!948331 (= lt!427019 lt!427013)))

(declare-fun lt!427016 () (_ BitVec 64))

(declare-fun lt!427018 () V!32569)

(declare-fun lt!427014 () ListLongMap!12219)

(declare-fun lt!427015 () (_ BitVec 64))

(assert (=> b!948331 (not (contains!5207 (+!2855 lt!427014 (tuple2!13523 lt!427015 lt!427018)) lt!427016))))

(declare-fun addStillNotContains!223 (ListLongMap!12219 (_ BitVec 64) V!32569 (_ BitVec 64)) Unit!31945)

(assert (=> b!948331 (= lt!427013 (addStillNotContains!223 lt!427014 lt!427015 lt!427018 lt!427016))))

(assert (=> b!948331 (= lt!427016 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!948331 (= lt!427018 (get!14500 (select (arr!27612 (_values!5768 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1644 (defaultEntry!5745 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!948331 (= lt!427015 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun call!41193 () ListLongMap!12219)

(assert (=> b!948331 (= lt!427014 call!41193)))

(declare-fun e!533834 () ListLongMap!12219)

(assert (=> b!948331 (= e!533834 (+!2855 call!41193 (tuple2!13523 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000) (get!14500 (select (arr!27612 (_values!5768 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1644 (defaultEntry!5745 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!948332 () Bool)

(declare-fun e!533832 () ListLongMap!12219)

(assert (=> b!948332 (= e!533832 e!533834)))

(declare-fun c!98854 () Bool)

(assert (=> b!948332 (= c!98854 (validKeyInArray!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114821 () Bool)

(declare-fun e!533836 () Bool)

(assert (=> d!114821 e!533836))

(declare-fun res!636244 () Bool)

(assert (=> d!114821 (=> (not res!636244) (not e!533836))))

(assert (=> d!114821 (= res!636244 (not (contains!5207 lt!427017 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114821 (= lt!427017 e!533832)))

(declare-fun c!98857 () Bool)

(assert (=> d!114821 (= c!98857 (bvsge #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(assert (=> d!114821 (validMask!0 (mask!27497 thiss!1141))))

(assert (=> d!114821 (= (getCurrentListMapNoExtraKeys!3310 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5745 thiss!1141)) lt!427017)))

(declare-fun b!948333 () Bool)

(assert (=> b!948333 (= e!533834 call!41193)))

(declare-fun b!948334 () Bool)

(declare-fun e!533833 () Bool)

(declare-fun isEmpty!705 (ListLongMap!12219) Bool)

(assert (=> b!948334 (= e!533833 (isEmpty!705 lt!427017))))

(declare-fun bm!41190 () Bool)

(assert (=> bm!41190 (= call!41193 (getCurrentListMapNoExtraKeys!3310 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5745 thiss!1141)))))

(declare-fun b!948335 () Bool)

(assert (=> b!948335 (= e!533833 (= lt!427017 (getCurrentListMapNoExtraKeys!3310 (_keys!10660 thiss!1141) (_values!5768 thiss!1141) (mask!27497 thiss!1141) (extraKeys!5477 thiss!1141) (zeroValue!5581 thiss!1141) (minValue!5581 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5745 thiss!1141))))))

(declare-fun b!948336 () Bool)

(assert (=> b!948336 (= e!533832 (ListLongMap!12220 Nil!19313))))

(declare-fun b!948337 () Bool)

(declare-fun e!533835 () Bool)

(assert (=> b!948337 (= e!533835 e!533837)))

(assert (=> b!948337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(declare-fun res!636247 () Bool)

(assert (=> b!948337 (= res!636247 (contains!5207 lt!427017 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948337 (=> (not res!636247) (not e!533837))))

(declare-fun b!948338 () Bool)

(declare-fun e!533838 () Bool)

(assert (=> b!948338 (= e!533838 (validKeyInArray!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948338 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!948339 () Bool)

(declare-fun res!636245 () Bool)

(assert (=> b!948339 (=> (not res!636245) (not e!533836))))

(assert (=> b!948339 (= res!636245 (not (contains!5207 lt!427017 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948340 () Bool)

(assert (=> b!948340 (= e!533836 e!533835)))

(declare-fun c!98855 () Bool)

(assert (=> b!948340 (= c!98855 e!533838)))

(declare-fun res!636246 () Bool)

(assert (=> b!948340 (=> (not res!636246) (not e!533838))))

(assert (=> b!948340 (= res!636246 (bvslt #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(declare-fun b!948341 () Bool)

(assert (=> b!948341 (= e!533835 e!533833)))

(declare-fun c!98856 () Bool)

(assert (=> b!948341 (= c!98856 (bvslt #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(assert (= (and d!114821 c!98857) b!948336))

(assert (= (and d!114821 (not c!98857)) b!948332))

(assert (= (and b!948332 c!98854) b!948331))

(assert (= (and b!948332 (not c!98854)) b!948333))

(assert (= (or b!948331 b!948333) bm!41190))

(assert (= (and d!114821 res!636244) b!948339))

(assert (= (and b!948339 res!636245) b!948340))

(assert (= (and b!948340 res!636246) b!948338))

(assert (= (and b!948340 c!98855) b!948337))

(assert (= (and b!948340 (not c!98855)) b!948341))

(assert (= (and b!948337 res!636247) b!948330))

(assert (= (and b!948341 c!98856) b!948335))

(assert (= (and b!948341 (not c!98856)) b!948334))

(declare-fun b_lambda!14311 () Bool)

(assert (=> (not b_lambda!14311) (not b!948330)))

(assert (=> b!948330 t!27643))

(declare-fun b_and!29627 () Bool)

(assert (= b_and!29625 (and (=> t!27643 result!12253) b_and!29627)))

(declare-fun b_lambda!14313 () Bool)

(assert (=> (not b_lambda!14313) (not b!948331)))

(assert (=> b!948331 t!27643))

(declare-fun b_and!29629 () Bool)

(assert (= b_and!29627 (and (=> t!27643 result!12253) b_and!29629)))

(assert (=> b!948332 m!880903))

(assert (=> b!948332 m!880903))

(assert (=> b!948332 m!880905))

(declare-fun m!881107 () Bool)

(assert (=> d!114821 m!881107))

(assert (=> d!114821 m!880845))

(assert (=> b!948337 m!880903))

(assert (=> b!948337 m!880903))

(declare-fun m!881109 () Bool)

(assert (=> b!948337 m!881109))

(declare-fun m!881111 () Bool)

(assert (=> b!948335 m!881111))

(assert (=> b!948338 m!880903))

(assert (=> b!948338 m!880903))

(assert (=> b!948338 m!880905))

(assert (=> b!948330 m!880945))

(assert (=> b!948330 m!880903))

(assert (=> b!948330 m!880903))

(declare-fun m!881113 () Bool)

(assert (=> b!948330 m!881113))

(assert (=> b!948330 m!880949))

(assert (=> b!948330 m!880945))

(assert (=> b!948330 m!880951))

(assert (=> b!948330 m!880949))

(declare-fun m!881115 () Bool)

(assert (=> b!948331 m!881115))

(declare-fun m!881117 () Bool)

(assert (=> b!948331 m!881117))

(declare-fun m!881119 () Bool)

(assert (=> b!948331 m!881119))

(assert (=> b!948331 m!880945))

(assert (=> b!948331 m!880903))

(declare-fun m!881121 () Bool)

(assert (=> b!948331 m!881121))

(assert (=> b!948331 m!881115))

(assert (=> b!948331 m!880949))

(assert (=> b!948331 m!880945))

(assert (=> b!948331 m!880951))

(assert (=> b!948331 m!880949))

(declare-fun m!881123 () Bool)

(assert (=> b!948339 m!881123))

(assert (=> bm!41190 m!881111))

(declare-fun m!881125 () Bool)

(assert (=> b!948334 m!881125))

(assert (=> b!948142 d!114821))

(declare-fun d!114823 () Bool)

(assert (=> d!114823 (= (apply!871 (+!2855 lt!426911 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141))) lt!426922) (get!14501 (getValueByKey!490 (toList!6125 (+!2855 lt!426911 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141)))) lt!426922)))))

(declare-fun bs!26653 () Bool)

(assert (= bs!26653 d!114823))

(declare-fun m!881127 () Bool)

(assert (=> bs!26653 m!881127))

(assert (=> bs!26653 m!881127))

(declare-fun m!881129 () Bool)

(assert (=> bs!26653 m!881129))

(assert (=> b!948142 d!114823))

(declare-fun d!114825 () Bool)

(assert (=> d!114825 (= (apply!871 (+!2855 lt!426923 (tuple2!13523 lt!426930 (minValue!5581 thiss!1141))) lt!426926) (apply!871 lt!426923 lt!426926))))

(declare-fun lt!427020 () Unit!31945)

(assert (=> d!114825 (= lt!427020 (choose!1573 lt!426923 lt!426930 (minValue!5581 thiss!1141) lt!426926))))

(declare-fun e!533839 () Bool)

(assert (=> d!114825 e!533839))

(declare-fun res!636248 () Bool)

(assert (=> d!114825 (=> (not res!636248) (not e!533839))))

(assert (=> d!114825 (= res!636248 (contains!5207 lt!426923 lt!426926))))

(assert (=> d!114825 (= (addApplyDifferent!454 lt!426923 lt!426930 (minValue!5581 thiss!1141) lt!426926) lt!427020)))

(declare-fun b!948342 () Bool)

(assert (=> b!948342 (= e!533839 (not (= lt!426926 lt!426930)))))

(assert (= (and d!114825 res!636248) b!948342))

(assert (=> d!114825 m!880921))

(assert (=> d!114825 m!880925))

(declare-fun m!881131 () Bool)

(assert (=> d!114825 m!881131))

(assert (=> d!114825 m!880921))

(declare-fun m!881133 () Bool)

(assert (=> d!114825 m!881133))

(assert (=> d!114825 m!880935))

(assert (=> b!948142 d!114825))

(declare-fun d!114827 () Bool)

(declare-fun e!533840 () Bool)

(assert (=> d!114827 e!533840))

(declare-fun res!636249 () Bool)

(assert (=> d!114827 (=> (not res!636249) (not e!533840))))

(declare-fun lt!427024 () ListLongMap!12219)

(assert (=> d!114827 (= res!636249 (contains!5207 lt!427024 (_1!6772 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))))))

(declare-fun lt!427022 () List!19316)

(assert (=> d!114827 (= lt!427024 (ListLongMap!12220 lt!427022))))

(declare-fun lt!427021 () Unit!31945)

(declare-fun lt!427023 () Unit!31945)

(assert (=> d!114827 (= lt!427021 lt!427023)))

(assert (=> d!114827 (= (getValueByKey!490 lt!427022 (_1!6772 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))))))

(assert (=> d!114827 (= lt!427023 (lemmaContainsTupThenGetReturnValue!262 lt!427022 (_1!6772 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))))))

(assert (=> d!114827 (= lt!427022 (insertStrictlySorted!319 (toList!6125 lt!426910) (_1!6772 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))))))

(assert (=> d!114827 (= (+!2855 lt!426910 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141))) lt!427024)))

(declare-fun b!948343 () Bool)

(declare-fun res!636250 () Bool)

(assert (=> b!948343 (=> (not res!636250) (not e!533840))))

(assert (=> b!948343 (= res!636250 (= (getValueByKey!490 (toList!6125 lt!427024) (_1!6772 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141))))))))

(declare-fun b!948344 () Bool)

(assert (=> b!948344 (= e!533840 (contains!5208 (toList!6125 lt!427024) (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141))))))

(assert (= (and d!114827 res!636249) b!948343))

(assert (= (and b!948343 res!636250) b!948344))

(declare-fun m!881135 () Bool)

(assert (=> d!114827 m!881135))

(declare-fun m!881137 () Bool)

(assert (=> d!114827 m!881137))

(declare-fun m!881139 () Bool)

(assert (=> d!114827 m!881139))

(declare-fun m!881141 () Bool)

(assert (=> d!114827 m!881141))

(declare-fun m!881143 () Bool)

(assert (=> b!948343 m!881143))

(declare-fun m!881145 () Bool)

(assert (=> b!948344 m!881145))

(assert (=> b!948142 d!114827))

(declare-fun d!114829 () Bool)

(declare-fun e!533841 () Bool)

(assert (=> d!114829 e!533841))

(declare-fun res!636251 () Bool)

(assert (=> d!114829 (=> (not res!636251) (not e!533841))))

(declare-fun lt!427028 () ListLongMap!12219)

(assert (=> d!114829 (= res!636251 (contains!5207 lt!427028 (_1!6772 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141)))))))

(declare-fun lt!427026 () List!19316)

(assert (=> d!114829 (= lt!427028 (ListLongMap!12220 lt!427026))))

(declare-fun lt!427025 () Unit!31945)

(declare-fun lt!427027 () Unit!31945)

(assert (=> d!114829 (= lt!427025 lt!427027)))

(assert (=> d!114829 (= (getValueByKey!490 lt!427026 (_1!6772 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141)))))))

(assert (=> d!114829 (= lt!427027 (lemmaContainsTupThenGetReturnValue!262 lt!427026 (_1!6772 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141)))))))

(assert (=> d!114829 (= lt!427026 (insertStrictlySorted!319 (toList!6125 lt!426927) (_1!6772 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141))) (_2!6772 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141)))))))

(assert (=> d!114829 (= (+!2855 lt!426927 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141))) lt!427028)))

(declare-fun b!948345 () Bool)

(declare-fun res!636252 () Bool)

(assert (=> b!948345 (=> (not res!636252) (not e!533841))))

(assert (=> b!948345 (= res!636252 (= (getValueByKey!490 (toList!6125 lt!427028) (_1!6772 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141)))) (Some!495 (_2!6772 (tuple2!13523 lt!426912 (minValue!5581 thiss!1141))))))))

(declare-fun b!948346 () Bool)

(assert (=> b!948346 (= e!533841 (contains!5208 (toList!6125 lt!427028) (tuple2!13523 lt!426912 (minValue!5581 thiss!1141))))))

(assert (= (and d!114829 res!636251) b!948345))

(assert (= (and b!948345 res!636252) b!948346))

(declare-fun m!881147 () Bool)

(assert (=> d!114829 m!881147))

(declare-fun m!881149 () Bool)

(assert (=> d!114829 m!881149))

(declare-fun m!881151 () Bool)

(assert (=> d!114829 m!881151))

(declare-fun m!881153 () Bool)

(assert (=> d!114829 m!881153))

(declare-fun m!881155 () Bool)

(assert (=> b!948345 m!881155))

(declare-fun m!881157 () Bool)

(assert (=> b!948346 m!881157))

(assert (=> b!948142 d!114829))

(declare-fun d!114831 () Bool)

(assert (=> d!114831 (= (apply!871 (+!2855 lt!426911 (tuple2!13523 lt!426925 (zeroValue!5581 thiss!1141))) lt!426922) (apply!871 lt!426911 lt!426922))))

(declare-fun lt!427029 () Unit!31945)

(assert (=> d!114831 (= lt!427029 (choose!1573 lt!426911 lt!426925 (zeroValue!5581 thiss!1141) lt!426922))))

(declare-fun e!533842 () Bool)

(assert (=> d!114831 e!533842))

(declare-fun res!636253 () Bool)

(assert (=> d!114831 (=> (not res!636253) (not e!533842))))

(assert (=> d!114831 (= res!636253 (contains!5207 lt!426911 lt!426922))))

(assert (=> d!114831 (= (addApplyDifferent!454 lt!426911 lt!426925 (zeroValue!5581 thiss!1141) lt!426922) lt!427029)))

(declare-fun b!948347 () Bool)

(assert (=> b!948347 (= e!533842 (not (= lt!426922 lt!426925)))))

(assert (= (and d!114831 res!636253) b!948347))

(assert (=> d!114831 m!880917))

(assert (=> d!114831 m!880919))

(declare-fun m!881159 () Bool)

(assert (=> d!114831 m!881159))

(assert (=> d!114831 m!880917))

(declare-fun m!881161 () Bool)

(assert (=> d!114831 m!881161))

(assert (=> d!114831 m!880933))

(assert (=> b!948142 d!114831))

(declare-fun d!114833 () Bool)

(assert (=> d!114833 (contains!5207 (+!2855 lt!426910 (tuple2!13523 lt!426915 (zeroValue!5581 thiss!1141))) lt!426913)))

(declare-fun lt!427032 () Unit!31945)

(declare-fun choose!1574 (ListLongMap!12219 (_ BitVec 64) V!32569 (_ BitVec 64)) Unit!31945)

(assert (=> d!114833 (= lt!427032 (choose!1574 lt!426910 lt!426915 (zeroValue!5581 thiss!1141) lt!426913))))

(assert (=> d!114833 (contains!5207 lt!426910 lt!426913)))

(assert (=> d!114833 (= (addStillContains!574 lt!426910 lt!426915 (zeroValue!5581 thiss!1141) lt!426913) lt!427032)))

(declare-fun bs!26654 () Bool)

(assert (= bs!26654 d!114833))

(assert (=> bs!26654 m!880927))

(assert (=> bs!26654 m!880927))

(assert (=> bs!26654 m!880939))

(declare-fun m!881163 () Bool)

(assert (=> bs!26654 m!881163))

(declare-fun m!881165 () Bool)

(assert (=> bs!26654 m!881165))

(assert (=> b!948142 d!114833))

(declare-fun b!948360 () Bool)

(declare-fun e!533852 () Bool)

(declare-fun e!533853 () Bool)

(assert (=> b!948360 (= e!533852 e!533853)))

(declare-fun c!98860 () Bool)

(assert (=> b!948360 (= c!98860 (validKeyInArray!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948361 () Bool)

(declare-fun call!41196 () Bool)

(assert (=> b!948361 (= e!533853 call!41196)))

(declare-fun bm!41193 () Bool)

(assert (=> bm!41193 (= call!41196 (arrayNoDuplicates!0 (_keys!10660 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98860 (Cons!19313 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000) Nil!19314) Nil!19314)))))

(declare-fun b!948362 () Bool)

(assert (=> b!948362 (= e!533853 call!41196)))

(declare-fun b!948363 () Bool)

(declare-fun e!533851 () Bool)

(assert (=> b!948363 (= e!533851 e!533852)))

(declare-fun res!636262 () Bool)

(assert (=> b!948363 (=> (not res!636262) (not e!533852))))

(declare-fun e!533854 () Bool)

(assert (=> b!948363 (= res!636262 (not e!533854))))

(declare-fun res!636261 () Bool)

(assert (=> b!948363 (=> (not res!636261) (not e!533854))))

(assert (=> b!948363 (= res!636261 (validKeyInArray!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948359 () Bool)

(declare-fun contains!5209 (List!19317 (_ BitVec 64)) Bool)

(assert (=> b!948359 (= e!533854 (contains!5209 Nil!19314 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114835 () Bool)

(declare-fun res!636260 () Bool)

(assert (=> d!114835 (=> res!636260 e!533851)))

(assert (=> d!114835 (= res!636260 (bvsge #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(assert (=> d!114835 (= (arrayNoDuplicates!0 (_keys!10660 thiss!1141) #b00000000000000000000000000000000 Nil!19314) e!533851)))

(assert (= (and d!114835 (not res!636260)) b!948363))

(assert (= (and b!948363 res!636261) b!948359))

(assert (= (and b!948363 res!636262) b!948360))

(assert (= (and b!948360 c!98860) b!948361))

(assert (= (and b!948360 (not c!98860)) b!948362))

(assert (= (or b!948361 b!948362) bm!41193))

(assert (=> b!948360 m!880903))

(assert (=> b!948360 m!880903))

(assert (=> b!948360 m!880905))

(assert (=> bm!41193 m!880903))

(declare-fun m!881167 () Bool)

(assert (=> bm!41193 m!881167))

(assert (=> b!948363 m!880903))

(assert (=> b!948363 m!880903))

(assert (=> b!948363 m!880905))

(assert (=> b!948359 m!880903))

(assert (=> b!948359 m!880903))

(declare-fun m!881169 () Bool)

(assert (=> b!948359 m!881169))

(assert (=> b!948173 d!114835))

(assert (=> bm!41180 d!114821))

(declare-fun bm!41196 () Bool)

(declare-fun call!41199 () Bool)

(assert (=> bm!41196 (= call!41199 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10660 thiss!1141) (mask!27497 thiss!1141)))))

(declare-fun b!948372 () Bool)

(declare-fun e!533862 () Bool)

(declare-fun e!533863 () Bool)

(assert (=> b!948372 (= e!533862 e!533863)))

(declare-fun c!98863 () Bool)

(assert (=> b!948372 (= c!98863 (validKeyInArray!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948373 () Bool)

(assert (=> b!948373 (= e!533863 call!41199)))

(declare-fun b!948374 () Bool)

(declare-fun e!533861 () Bool)

(assert (=> b!948374 (= e!533863 e!533861)))

(declare-fun lt!427040 () (_ BitVec 64))

(assert (=> b!948374 (= lt!427040 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427041 () Unit!31945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57412 (_ BitVec 64) (_ BitVec 32)) Unit!31945)

(assert (=> b!948374 (= lt!427041 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10660 thiss!1141) lt!427040 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!948374 (arrayContainsKey!0 (_keys!10660 thiss!1141) lt!427040 #b00000000000000000000000000000000)))

(declare-fun lt!427039 () Unit!31945)

(assert (=> b!948374 (= lt!427039 lt!427041)))

(declare-fun res!636268 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57412 (_ BitVec 32)) SeekEntryResult!9124)

(assert (=> b!948374 (= res!636268 (= (seekEntryOrOpen!0 (select (arr!27613 (_keys!10660 thiss!1141)) #b00000000000000000000000000000000) (_keys!10660 thiss!1141) (mask!27497 thiss!1141)) (Found!9124 #b00000000000000000000000000000000)))))

(assert (=> b!948374 (=> (not res!636268) (not e!533861))))

(declare-fun d!114837 () Bool)

(declare-fun res!636267 () Bool)

(assert (=> d!114837 (=> res!636267 e!533862)))

(assert (=> d!114837 (= res!636267 (bvsge #b00000000000000000000000000000000 (size!28086 (_keys!10660 thiss!1141))))))

(assert (=> d!114837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10660 thiss!1141) (mask!27497 thiss!1141)) e!533862)))

(declare-fun b!948375 () Bool)

(assert (=> b!948375 (= e!533861 call!41199)))

(assert (= (and d!114837 (not res!636267)) b!948372))

(assert (= (and b!948372 c!98863) b!948374))

(assert (= (and b!948372 (not c!98863)) b!948373))

(assert (= (and b!948374 res!636268) b!948375))

(assert (= (or b!948375 b!948373) bm!41196))

(declare-fun m!881171 () Bool)

(assert (=> bm!41196 m!881171))

(assert (=> b!948372 m!880903))

(assert (=> b!948372 m!880903))

(assert (=> b!948372 m!880905))

(assert (=> b!948374 m!880903))

(declare-fun m!881173 () Bool)

(assert (=> b!948374 m!881173))

(declare-fun m!881175 () Bool)

(assert (=> b!948374 m!881175))

(assert (=> b!948374 m!880903))

(declare-fun m!881177 () Bool)

(assert (=> b!948374 m!881177))

(assert (=> b!948172 d!114837))

(declare-fun condMapEmpty!32948 () Bool)

(declare-fun mapDefault!32948 () ValueCell!9870)

(assert (=> mapNonEmpty!32947 (= condMapEmpty!32948 (= mapRest!32947 ((as const (Array (_ BitVec 32) ValueCell!9870)) mapDefault!32948)))))

(declare-fun e!533864 () Bool)

(declare-fun mapRes!32948 () Bool)

(assert (=> mapNonEmpty!32947 (= tp!63165 (and e!533864 mapRes!32948))))

(declare-fun b!948376 () Bool)

(declare-fun e!533865 () Bool)

(assert (=> b!948376 (= e!533865 tp_is_empty!20703)))

(declare-fun mapIsEmpty!32948 () Bool)

(assert (=> mapIsEmpty!32948 mapRes!32948))

(declare-fun b!948377 () Bool)

(assert (=> b!948377 (= e!533864 tp_is_empty!20703)))

(declare-fun mapNonEmpty!32948 () Bool)

(declare-fun tp!63166 () Bool)

(assert (=> mapNonEmpty!32948 (= mapRes!32948 (and tp!63166 e!533865))))

(declare-fun mapRest!32948 () (Array (_ BitVec 32) ValueCell!9870))

(declare-fun mapValue!32948 () ValueCell!9870)

(declare-fun mapKey!32948 () (_ BitVec 32))

(assert (=> mapNonEmpty!32948 (= mapRest!32947 (store mapRest!32948 mapKey!32948 mapValue!32948))))

(assert (= (and mapNonEmpty!32947 condMapEmpty!32948) mapIsEmpty!32948))

(assert (= (and mapNonEmpty!32947 (not condMapEmpty!32948)) mapNonEmpty!32948))

(assert (= (and mapNonEmpty!32948 ((_ is ValueCellFull!9870) mapValue!32948)) b!948376))

(assert (= (and mapNonEmpty!32947 ((_ is ValueCellFull!9870) mapDefault!32948)) b!948377))

(declare-fun m!881179 () Bool)

(assert (=> mapNonEmpty!32948 m!881179))

(declare-fun b_lambda!14315 () Bool)

(assert (= b_lambda!14311 (or (and b!948037 b_free!18195) b_lambda!14315)))

(declare-fun b_lambda!14317 () Bool)

(assert (= b_lambda!14313 (or (and b!948037 b_free!18195) b_lambda!14317)))

(check-sat (not b!948249) (not d!114773) (not b!948250) (not d!114825) (not b!948278) (not bm!41190) (not b!948334) (not d!114815) (not bm!41196) (not d!114833) (not d!114795) (not d!114817) (not d!114803) (not d!114799) (not b!948374) (not d!114823) (not b!948343) (not b!948335) (not b!948344) (not b!948243) (not b!948289) (not d!114809) (not b!948228) (not b!948338) (not b_lambda!14315) (not d!114801) (not b!948261) (not b!948360) (not b!948204) (not b_lambda!14317) (not b!948332) (not b!948291) (not b!948301) (not bm!41193) (not b!948345) (not b!948339) (not b!948330) (not b!948304) (not d!114771) tp_is_empty!20703 (not d!114811) (not b!948302) (not d!114779) (not b!948346) (not b!948256) (not d!114793) (not b!948192) (not b!948337) (not d!114821) (not b!948305) (not b!948260) (not d!114805) (not b!948280) (not b!948292) (not b!948359) b_and!29629 (not d!114781) (not d!114785) (not b!948288) (not d!114791) (not d!114807) (not d!114789) (not b!948255) (not b!948331) (not b!948259) (not d!114831) (not b!948299) (not b!948294) (not d!114777) (not d!114765) (not b!948372) (not b!948363) (not b!948282) (not mapNonEmpty!32948) (not b!948242) (not d!114827) (not b_lambda!14309) (not b_next!18195) (not d!114813) (not d!114829) (not bm!41187) (not d!114819) (not b!948303))
(check-sat b_and!29629 (not b_next!18195))
