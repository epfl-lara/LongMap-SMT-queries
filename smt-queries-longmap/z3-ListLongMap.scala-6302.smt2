; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80808 () Bool)

(assert start!80808)

(declare-fun b!947160 () Bool)

(declare-fun b_free!18133 () Bool)

(declare-fun b_next!18133 () Bool)

(assert (=> b!947160 (= b_free!18133 (not b_next!18133))))

(declare-fun tp!62938 () Bool)

(declare-fun b_and!29565 () Bool)

(assert (=> b!947160 (= tp!62938 b_and!29565)))

(declare-fun res!635637 () Bool)

(declare-fun e!532964 () Bool)

(assert (=> start!80808 (=> (not res!635637) (not e!532964))))

(declare-datatypes ((V!32487 0))(
  ( (V!32488 (val!10371 Int)) )
))
(declare-datatypes ((ValueCell!9839 0))(
  ( (ValueCellFull!9839 (v!12902 V!32487)) (EmptyCell!9839) )
))
(declare-datatypes ((array!57317 0))(
  ( (array!57318 (arr!27571 (Array (_ BitVec 32) ValueCell!9839)) (size!28042 (_ BitVec 32))) )
))
(declare-datatypes ((array!57319 0))(
  ( (array!57320 (arr!27572 (Array (_ BitVec 32) (_ BitVec 64))) (size!28043 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4828 0))(
  ( (LongMapFixedSize!4829 (defaultEntry!5711 Int) (mask!27451 (_ BitVec 32)) (extraKeys!5443 (_ BitVec 32)) (zeroValue!5547 V!32487) (minValue!5547 V!32487) (_size!2469 (_ BitVec 32)) (_keys!10631 array!57319) (_values!5734 array!57317) (_vacant!2469 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4828)

(declare-fun valid!1851 (LongMapFixedSize!4828) Bool)

(assert (=> start!80808 (= res!635637 (valid!1851 thiss!1141))))

(assert (=> start!80808 e!532964))

(declare-fun e!532968 () Bool)

(assert (=> start!80808 e!532968))

(assert (=> start!80808 true))

(declare-fun b!947159 () Bool)

(declare-fun e!532965 () Bool)

(declare-fun tp_is_empty!20641 () Bool)

(assert (=> b!947159 (= e!532965 tp_is_empty!20641)))

(declare-fun mapIsEmpty!32815 () Bool)

(declare-fun mapRes!32815 () Bool)

(assert (=> mapIsEmpty!32815 mapRes!32815))

(declare-fun e!532970 () Bool)

(declare-fun array_inv!21496 (array!57319) Bool)

(declare-fun array_inv!21497 (array!57317) Bool)

(assert (=> b!947160 (= e!532968 (and tp!62938 tp_is_empty!20641 (array_inv!21496 (_keys!10631 thiss!1141)) (array_inv!21497 (_values!5734 thiss!1141)) e!532970))))

(declare-fun b!947161 () Bool)

(declare-fun e!532966 () Bool)

(declare-fun e!532963 () Bool)

(assert (=> b!947161 (= e!532966 (not e!532963))))

(declare-fun res!635638 () Bool)

(assert (=> b!947161 (=> res!635638 e!532963)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947161 (= res!635638 (not (validMask!0 (mask!27451 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947161 (arrayContainsKey!0 (_keys!10631 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31879 0))(
  ( (Unit!31880) )
))
(declare-fun lt!426601 () Unit!31879)

(declare-datatypes ((SeekEntryResult!9058 0))(
  ( (MissingZero!9058 (index!38603 (_ BitVec 32))) (Found!9058 (index!38604 (_ BitVec 32))) (Intermediate!9058 (undefined!9870 Bool) (index!38605 (_ BitVec 32)) (x!81333 (_ BitVec 32))) (Undefined!9058) (MissingVacant!9058 (index!38606 (_ BitVec 32))) )
))
(declare-fun lt!426600 () SeekEntryResult!9058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57319 (_ BitVec 64) (_ BitVec 32)) Unit!31879)

(assert (=> b!947161 (= lt!426601 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10631 thiss!1141) key!756 (index!38604 lt!426600)))))

(declare-fun mapNonEmpty!32815 () Bool)

(declare-fun tp!62937 () Bool)

(assert (=> mapNonEmpty!32815 (= mapRes!32815 (and tp!62937 e!532965))))

(declare-fun mapRest!32815 () (Array (_ BitVec 32) ValueCell!9839))

(declare-fun mapValue!32815 () ValueCell!9839)

(declare-fun mapKey!32815 () (_ BitVec 32))

(assert (=> mapNonEmpty!32815 (= (arr!27571 (_values!5734 thiss!1141)) (store mapRest!32815 mapKey!32815 mapValue!32815))))

(declare-fun b!947162 () Bool)

(declare-fun res!635639 () Bool)

(assert (=> b!947162 (=> (not res!635639) (not e!532964))))

(assert (=> b!947162 (= res!635639 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947163 () Bool)

(declare-fun e!532967 () Bool)

(assert (=> b!947163 (= e!532970 (and e!532967 mapRes!32815))))

(declare-fun condMapEmpty!32815 () Bool)

(declare-fun mapDefault!32815 () ValueCell!9839)

(assert (=> b!947163 (= condMapEmpty!32815 (= (arr!27571 (_values!5734 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9839)) mapDefault!32815)))))

(declare-fun b!947164 () Bool)

(assert (=> b!947164 (= e!532964 e!532966)))

(declare-fun res!635640 () Bool)

(assert (=> b!947164 (=> (not res!635640) (not e!532966))))

(get-info :version)

(assert (=> b!947164 (= res!635640 ((_ is Found!9058) lt!426600))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57319 (_ BitVec 32)) SeekEntryResult!9058)

(assert (=> b!947164 (= lt!426600 (seekEntry!0 key!756 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)))))

(declare-fun b!947165 () Bool)

(assert (=> b!947165 (= e!532963 (or (not (= (size!28042 (_values!5734 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27451 thiss!1141)))) (= (size!28043 (_keys!10631 thiss!1141)) (size!28042 (_values!5734 thiss!1141)))))))

(declare-fun b!947166 () Bool)

(assert (=> b!947166 (= e!532967 tp_is_empty!20641)))

(assert (= (and start!80808 res!635637) b!947162))

(assert (= (and b!947162 res!635639) b!947164))

(assert (= (and b!947164 res!635640) b!947161))

(assert (= (and b!947161 (not res!635638)) b!947165))

(assert (= (and b!947163 condMapEmpty!32815) mapIsEmpty!32815))

(assert (= (and b!947163 (not condMapEmpty!32815)) mapNonEmpty!32815))

(assert (= (and mapNonEmpty!32815 ((_ is ValueCellFull!9839) mapValue!32815)) b!947159))

(assert (= (and b!947163 ((_ is ValueCellFull!9839) mapDefault!32815)) b!947166))

(assert (= b!947160 b!947163))

(assert (= start!80808 b!947160))

(declare-fun m!881005 () Bool)

(assert (=> b!947161 m!881005))

(declare-fun m!881007 () Bool)

(assert (=> b!947161 m!881007))

(declare-fun m!881009 () Bool)

(assert (=> b!947161 m!881009))

(declare-fun m!881011 () Bool)

(assert (=> mapNonEmpty!32815 m!881011))

(declare-fun m!881013 () Bool)

(assert (=> b!947160 m!881013))

(declare-fun m!881015 () Bool)

(assert (=> b!947160 m!881015))

(declare-fun m!881017 () Bool)

(assert (=> b!947164 m!881017))

(declare-fun m!881019 () Bool)

(assert (=> start!80808 m!881019))

(check-sat b_and!29565 (not b_next!18133) (not start!80808) (not mapNonEmpty!32815) (not b!947161) (not b!947164) (not b!947160) tp_is_empty!20641)
(check-sat b_and!29565 (not b_next!18133))
(get-model)

(declare-fun d!114835 () Bool)

(assert (=> d!114835 (= (validMask!0 (mask!27451 thiss!1141)) (and (or (= (mask!27451 thiss!1141) #b00000000000000000000000000000111) (= (mask!27451 thiss!1141) #b00000000000000000000000000001111) (= (mask!27451 thiss!1141) #b00000000000000000000000000011111) (= (mask!27451 thiss!1141) #b00000000000000000000000000111111) (= (mask!27451 thiss!1141) #b00000000000000000000000001111111) (= (mask!27451 thiss!1141) #b00000000000000000000000011111111) (= (mask!27451 thiss!1141) #b00000000000000000000000111111111) (= (mask!27451 thiss!1141) #b00000000000000000000001111111111) (= (mask!27451 thiss!1141) #b00000000000000000000011111111111) (= (mask!27451 thiss!1141) #b00000000000000000000111111111111) (= (mask!27451 thiss!1141) #b00000000000000000001111111111111) (= (mask!27451 thiss!1141) #b00000000000000000011111111111111) (= (mask!27451 thiss!1141) #b00000000000000000111111111111111) (= (mask!27451 thiss!1141) #b00000000000000001111111111111111) (= (mask!27451 thiss!1141) #b00000000000000011111111111111111) (= (mask!27451 thiss!1141) #b00000000000000111111111111111111) (= (mask!27451 thiss!1141) #b00000000000001111111111111111111) (= (mask!27451 thiss!1141) #b00000000000011111111111111111111) (= (mask!27451 thiss!1141) #b00000000000111111111111111111111) (= (mask!27451 thiss!1141) #b00000000001111111111111111111111) (= (mask!27451 thiss!1141) #b00000000011111111111111111111111) (= (mask!27451 thiss!1141) #b00000000111111111111111111111111) (= (mask!27451 thiss!1141) #b00000001111111111111111111111111) (= (mask!27451 thiss!1141) #b00000011111111111111111111111111) (= (mask!27451 thiss!1141) #b00000111111111111111111111111111) (= (mask!27451 thiss!1141) #b00001111111111111111111111111111) (= (mask!27451 thiss!1141) #b00011111111111111111111111111111) (= (mask!27451 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27451 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947161 d!114835))

(declare-fun d!114837 () Bool)

(declare-fun res!635669 () Bool)

(declare-fun e!533023 () Bool)

(assert (=> d!114837 (=> res!635669 e!533023)))

(assert (=> d!114837 (= res!635669 (= (select (arr!27572 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114837 (= (arrayContainsKey!0 (_keys!10631 thiss!1141) key!756 #b00000000000000000000000000000000) e!533023)))

(declare-fun b!947219 () Bool)

(declare-fun e!533024 () Bool)

(assert (=> b!947219 (= e!533023 e!533024)))

(declare-fun res!635670 () Bool)

(assert (=> b!947219 (=> (not res!635670) (not e!533024))))

(assert (=> b!947219 (= res!635670 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28043 (_keys!10631 thiss!1141))))))

(declare-fun b!947220 () Bool)

(assert (=> b!947220 (= e!533024 (arrayContainsKey!0 (_keys!10631 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114837 (not res!635669)) b!947219))

(assert (= (and b!947219 res!635670) b!947220))

(declare-fun m!881053 () Bool)

(assert (=> d!114837 m!881053))

(declare-fun m!881055 () Bool)

(assert (=> b!947220 m!881055))

(assert (=> b!947161 d!114837))

(declare-fun d!114839 () Bool)

(assert (=> d!114839 (arrayContainsKey!0 (_keys!10631 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426616 () Unit!31879)

(declare-fun choose!13 (array!57319 (_ BitVec 64) (_ BitVec 32)) Unit!31879)

(assert (=> d!114839 (= lt!426616 (choose!13 (_keys!10631 thiss!1141) key!756 (index!38604 lt!426600)))))

(assert (=> d!114839 (bvsge (index!38604 lt!426600) #b00000000000000000000000000000000)))

(assert (=> d!114839 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10631 thiss!1141) key!756 (index!38604 lt!426600)) lt!426616)))

(declare-fun bs!26614 () Bool)

(assert (= bs!26614 d!114839))

(assert (=> bs!26614 m!881007))

(declare-fun m!881057 () Bool)

(assert (=> bs!26614 m!881057))

(assert (=> b!947161 d!114839))

(declare-fun b!947233 () Bool)

(declare-fun e!533031 () SeekEntryResult!9058)

(declare-fun lt!426627 () SeekEntryResult!9058)

(assert (=> b!947233 (= e!533031 (Found!9058 (index!38605 lt!426627)))))

(declare-fun d!114841 () Bool)

(declare-fun lt!426628 () SeekEntryResult!9058)

(assert (=> d!114841 (and (or ((_ is MissingVacant!9058) lt!426628) (not ((_ is Found!9058) lt!426628)) (and (bvsge (index!38604 lt!426628) #b00000000000000000000000000000000) (bvslt (index!38604 lt!426628) (size!28043 (_keys!10631 thiss!1141))))) (not ((_ is MissingVacant!9058) lt!426628)) (or (not ((_ is Found!9058) lt!426628)) (= (select (arr!27572 (_keys!10631 thiss!1141)) (index!38604 lt!426628)) key!756)))))

(declare-fun e!533032 () SeekEntryResult!9058)

(assert (=> d!114841 (= lt!426628 e!533032)))

(declare-fun c!98823 () Bool)

(assert (=> d!114841 (= c!98823 (and ((_ is Intermediate!9058) lt!426627) (undefined!9870 lt!426627)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57319 (_ BitVec 32)) SeekEntryResult!9058)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114841 (= lt!426627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27451 thiss!1141)) key!756 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)))))

(assert (=> d!114841 (validMask!0 (mask!27451 thiss!1141))))

(assert (=> d!114841 (= (seekEntry!0 key!756 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)) lt!426628)))

(declare-fun b!947234 () Bool)

(declare-fun e!533033 () SeekEntryResult!9058)

(declare-fun lt!426625 () SeekEntryResult!9058)

(assert (=> b!947234 (= e!533033 (ite ((_ is MissingVacant!9058) lt!426625) (MissingZero!9058 (index!38606 lt!426625)) lt!426625))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57319 (_ BitVec 32)) SeekEntryResult!9058)

(assert (=> b!947234 (= lt!426625 (seekKeyOrZeroReturnVacant!0 (x!81333 lt!426627) (index!38605 lt!426627) (index!38605 lt!426627) key!756 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)))))

(declare-fun b!947235 () Bool)

(assert (=> b!947235 (= e!533033 (MissingZero!9058 (index!38605 lt!426627)))))

(declare-fun b!947236 () Bool)

(declare-fun c!98825 () Bool)

(declare-fun lt!426626 () (_ BitVec 64))

(assert (=> b!947236 (= c!98825 (= lt!426626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947236 (= e!533031 e!533033)))

(declare-fun b!947237 () Bool)

(assert (=> b!947237 (= e!533032 e!533031)))

(assert (=> b!947237 (= lt!426626 (select (arr!27572 (_keys!10631 thiss!1141)) (index!38605 lt!426627)))))

(declare-fun c!98824 () Bool)

(assert (=> b!947237 (= c!98824 (= lt!426626 key!756))))

(declare-fun b!947238 () Bool)

(assert (=> b!947238 (= e!533032 Undefined!9058)))

(assert (= (and d!114841 c!98823) b!947238))

(assert (= (and d!114841 (not c!98823)) b!947237))

(assert (= (and b!947237 c!98824) b!947233))

(assert (= (and b!947237 (not c!98824)) b!947236))

(assert (= (and b!947236 c!98825) b!947235))

(assert (= (and b!947236 (not c!98825)) b!947234))

(declare-fun m!881059 () Bool)

(assert (=> d!114841 m!881059))

(declare-fun m!881061 () Bool)

(assert (=> d!114841 m!881061))

(assert (=> d!114841 m!881061))

(declare-fun m!881063 () Bool)

(assert (=> d!114841 m!881063))

(assert (=> d!114841 m!881005))

(declare-fun m!881065 () Bool)

(assert (=> b!947234 m!881065))

(declare-fun m!881067 () Bool)

(assert (=> b!947237 m!881067))

(assert (=> b!947164 d!114841))

(declare-fun d!114843 () Bool)

(declare-fun res!635677 () Bool)

(declare-fun e!533036 () Bool)

(assert (=> d!114843 (=> (not res!635677) (not e!533036))))

(declare-fun simpleValid!357 (LongMapFixedSize!4828) Bool)

(assert (=> d!114843 (= res!635677 (simpleValid!357 thiss!1141))))

(assert (=> d!114843 (= (valid!1851 thiss!1141) e!533036)))

(declare-fun b!947245 () Bool)

(declare-fun res!635678 () Bool)

(assert (=> b!947245 (=> (not res!635678) (not e!533036))))

(declare-fun arrayCountValidKeys!0 (array!57319 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947245 (= res!635678 (= (arrayCountValidKeys!0 (_keys!10631 thiss!1141) #b00000000000000000000000000000000 (size!28043 (_keys!10631 thiss!1141))) (_size!2469 thiss!1141)))))

(declare-fun b!947246 () Bool)

(declare-fun res!635679 () Bool)

(assert (=> b!947246 (=> (not res!635679) (not e!533036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57319 (_ BitVec 32)) Bool)

(assert (=> b!947246 (= res!635679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)))))

(declare-fun b!947247 () Bool)

(declare-datatypes ((List!19282 0))(
  ( (Nil!19279) (Cons!19278 (h!20437 (_ BitVec 64)) (t!27595 List!19282)) )
))
(declare-fun arrayNoDuplicates!0 (array!57319 (_ BitVec 32) List!19282) Bool)

(assert (=> b!947247 (= e!533036 (arrayNoDuplicates!0 (_keys!10631 thiss!1141) #b00000000000000000000000000000000 Nil!19279))))

(assert (= (and d!114843 res!635677) b!947245))

(assert (= (and b!947245 res!635678) b!947246))

(assert (= (and b!947246 res!635679) b!947247))

(declare-fun m!881069 () Bool)

(assert (=> d!114843 m!881069))

(declare-fun m!881071 () Bool)

(assert (=> b!947245 m!881071))

(declare-fun m!881073 () Bool)

(assert (=> b!947246 m!881073))

(declare-fun m!881075 () Bool)

(assert (=> b!947247 m!881075))

(assert (=> start!80808 d!114843))

(declare-fun d!114845 () Bool)

(assert (=> d!114845 (= (array_inv!21496 (_keys!10631 thiss!1141)) (bvsge (size!28043 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947160 d!114845))

(declare-fun d!114847 () Bool)

(assert (=> d!114847 (= (array_inv!21497 (_values!5734 thiss!1141)) (bvsge (size!28042 (_values!5734 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947160 d!114847))

(declare-fun mapNonEmpty!32824 () Bool)

(declare-fun mapRes!32824 () Bool)

(declare-fun tp!62953 () Bool)

(declare-fun e!533041 () Bool)

(assert (=> mapNonEmpty!32824 (= mapRes!32824 (and tp!62953 e!533041))))

(declare-fun mapRest!32824 () (Array (_ BitVec 32) ValueCell!9839))

(declare-fun mapKey!32824 () (_ BitVec 32))

(declare-fun mapValue!32824 () ValueCell!9839)

(assert (=> mapNonEmpty!32824 (= mapRest!32815 (store mapRest!32824 mapKey!32824 mapValue!32824))))

(declare-fun mapIsEmpty!32824 () Bool)

(assert (=> mapIsEmpty!32824 mapRes!32824))

(declare-fun b!947254 () Bool)

(assert (=> b!947254 (= e!533041 tp_is_empty!20641)))

(declare-fun b!947255 () Bool)

(declare-fun e!533042 () Bool)

(assert (=> b!947255 (= e!533042 tp_is_empty!20641)))

(declare-fun condMapEmpty!32824 () Bool)

(declare-fun mapDefault!32824 () ValueCell!9839)

(assert (=> mapNonEmpty!32815 (= condMapEmpty!32824 (= mapRest!32815 ((as const (Array (_ BitVec 32) ValueCell!9839)) mapDefault!32824)))))

(assert (=> mapNonEmpty!32815 (= tp!62937 (and e!533042 mapRes!32824))))

(assert (= (and mapNonEmpty!32815 condMapEmpty!32824) mapIsEmpty!32824))

(assert (= (and mapNonEmpty!32815 (not condMapEmpty!32824)) mapNonEmpty!32824))

(assert (= (and mapNonEmpty!32824 ((_ is ValueCellFull!9839) mapValue!32824)) b!947254))

(assert (= (and mapNonEmpty!32815 ((_ is ValueCellFull!9839) mapDefault!32824)) b!947255))

(declare-fun m!881077 () Bool)

(assert (=> mapNonEmpty!32824 m!881077))

(check-sat (not d!114843) (not b!947220) (not d!114841) b_and!29565 (not b_next!18133) (not d!114839) tp_is_empty!20641 (not b!947247) (not b!947234) (not b!947246) (not mapNonEmpty!32824) (not b!947245))
(check-sat b_and!29565 (not b_next!18133))
(get-model)

(assert (=> d!114839 d!114837))

(declare-fun d!114849 () Bool)

(assert (=> d!114849 (arrayContainsKey!0 (_keys!10631 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114849 true))

(declare-fun _$60!433 () Unit!31879)

(assert (=> d!114849 (= (choose!13 (_keys!10631 thiss!1141) key!756 (index!38604 lt!426600)) _$60!433)))

(declare-fun bs!26615 () Bool)

(assert (= bs!26615 d!114849))

(assert (=> bs!26615 m!881007))

(assert (=> d!114839 d!114849))

(declare-fun b!947264 () Bool)

(declare-fun e!533048 () (_ BitVec 32))

(declare-fun call!41124 () (_ BitVec 32))

(assert (=> b!947264 (= e!533048 call!41124)))

(declare-fun b!947265 () Bool)

(declare-fun e!533047 () (_ BitVec 32))

(assert (=> b!947265 (= e!533047 #b00000000000000000000000000000000)))

(declare-fun bm!41121 () Bool)

(assert (=> bm!41121 (= call!41124 (arrayCountValidKeys!0 (_keys!10631 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28043 (_keys!10631 thiss!1141))))))

(declare-fun b!947266 () Bool)

(assert (=> b!947266 (= e!533048 (bvadd #b00000000000000000000000000000001 call!41124))))

(declare-fun d!114851 () Bool)

(declare-fun lt!426631 () (_ BitVec 32))

(assert (=> d!114851 (and (bvsge lt!426631 #b00000000000000000000000000000000) (bvsle lt!426631 (bvsub (size!28043 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114851 (= lt!426631 e!533047)))

(declare-fun c!98831 () Bool)

(assert (=> d!114851 (= c!98831 (bvsge #b00000000000000000000000000000000 (size!28043 (_keys!10631 thiss!1141))))))

(assert (=> d!114851 (and (bvsle #b00000000000000000000000000000000 (size!28043 (_keys!10631 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28043 (_keys!10631 thiss!1141)) (size!28043 (_keys!10631 thiss!1141))))))

(assert (=> d!114851 (= (arrayCountValidKeys!0 (_keys!10631 thiss!1141) #b00000000000000000000000000000000 (size!28043 (_keys!10631 thiss!1141))) lt!426631)))

(declare-fun b!947267 () Bool)

(assert (=> b!947267 (= e!533047 e!533048)))

(declare-fun c!98830 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947267 (= c!98830 (validKeyInArray!0 (select (arr!27572 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114851 c!98831) b!947265))

(assert (= (and d!114851 (not c!98831)) b!947267))

(assert (= (and b!947267 c!98830) b!947266))

(assert (= (and b!947267 (not c!98830)) b!947264))

(assert (= (or b!947266 b!947264) bm!41121))

(declare-fun m!881079 () Bool)

(assert (=> bm!41121 m!881079))

(assert (=> b!947267 m!881053))

(assert (=> b!947267 m!881053))

(declare-fun m!881081 () Bool)

(assert (=> b!947267 m!881081))

(assert (=> b!947245 d!114851))

(declare-fun bm!41124 () Bool)

(declare-fun call!41127 () Bool)

(assert (=> bm!41124 (= call!41127 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10631 thiss!1141) (mask!27451 thiss!1141)))))

(declare-fun b!947276 () Bool)

(declare-fun e!533055 () Bool)

(declare-fun e!533056 () Bool)

(assert (=> b!947276 (= e!533055 e!533056)))

(declare-fun c!98834 () Bool)

(assert (=> b!947276 (= c!98834 (validKeyInArray!0 (select (arr!27572 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114853 () Bool)

(declare-fun res!635684 () Bool)

(assert (=> d!114853 (=> res!635684 e!533055)))

(assert (=> d!114853 (= res!635684 (bvsge #b00000000000000000000000000000000 (size!28043 (_keys!10631 thiss!1141))))))

(assert (=> d!114853 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)) e!533055)))

(declare-fun b!947277 () Bool)

(assert (=> b!947277 (= e!533056 call!41127)))

(declare-fun b!947278 () Bool)

(declare-fun e!533057 () Bool)

(assert (=> b!947278 (= e!533057 call!41127)))

(declare-fun b!947279 () Bool)

(assert (=> b!947279 (= e!533056 e!533057)))

(declare-fun lt!426639 () (_ BitVec 64))

(assert (=> b!947279 (= lt!426639 (select (arr!27572 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426640 () Unit!31879)

(assert (=> b!947279 (= lt!426640 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10631 thiss!1141) lt!426639 #b00000000000000000000000000000000))))

(assert (=> b!947279 (arrayContainsKey!0 (_keys!10631 thiss!1141) lt!426639 #b00000000000000000000000000000000)))

(declare-fun lt!426638 () Unit!31879)

(assert (=> b!947279 (= lt!426638 lt!426640)))

(declare-fun res!635685 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57319 (_ BitVec 32)) SeekEntryResult!9058)

(assert (=> b!947279 (= res!635685 (= (seekEntryOrOpen!0 (select (arr!27572 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000) (_keys!10631 thiss!1141) (mask!27451 thiss!1141)) (Found!9058 #b00000000000000000000000000000000)))))

(assert (=> b!947279 (=> (not res!635685) (not e!533057))))

(assert (= (and d!114853 (not res!635684)) b!947276))

(assert (= (and b!947276 c!98834) b!947279))

(assert (= (and b!947276 (not c!98834)) b!947277))

(assert (= (and b!947279 res!635685) b!947278))

(assert (= (or b!947278 b!947277) bm!41124))

(declare-fun m!881083 () Bool)

(assert (=> bm!41124 m!881083))

(assert (=> b!947276 m!881053))

(assert (=> b!947276 m!881053))

(assert (=> b!947276 m!881081))

(assert (=> b!947279 m!881053))

(declare-fun m!881085 () Bool)

(assert (=> b!947279 m!881085))

(declare-fun m!881087 () Bool)

(assert (=> b!947279 m!881087))

(assert (=> b!947279 m!881053))

(declare-fun m!881089 () Bool)

(assert (=> b!947279 m!881089))

(assert (=> b!947246 d!114853))

(declare-fun d!114855 () Bool)

(declare-fun res!635686 () Bool)

(declare-fun e!533058 () Bool)

(assert (=> d!114855 (=> res!635686 e!533058)))

(assert (=> d!114855 (= res!635686 (= (select (arr!27572 (_keys!10631 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114855 (= (arrayContainsKey!0 (_keys!10631 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!533058)))

(declare-fun b!947280 () Bool)

(declare-fun e!533059 () Bool)

(assert (=> b!947280 (= e!533058 e!533059)))

(declare-fun res!635687 () Bool)

(assert (=> b!947280 (=> (not res!635687) (not e!533059))))

(assert (=> b!947280 (= res!635687 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28043 (_keys!10631 thiss!1141))))))

(declare-fun b!947281 () Bool)

(assert (=> b!947281 (= e!533059 (arrayContainsKey!0 (_keys!10631 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114855 (not res!635686)) b!947280))

(assert (= (and b!947280 res!635687) b!947281))

(declare-fun m!881091 () Bool)

(assert (=> d!114855 m!881091))

(declare-fun m!881093 () Bool)

(assert (=> b!947281 m!881093))

(assert (=> b!947220 d!114855))

(declare-fun b!947292 () Bool)

(declare-fun res!635699 () Bool)

(declare-fun e!533062 () Bool)

(assert (=> b!947292 (=> (not res!635699) (not e!533062))))

(declare-fun size!28048 (LongMapFixedSize!4828) (_ BitVec 32))

(assert (=> b!947292 (= res!635699 (= (size!28048 thiss!1141) (bvadd (_size!2469 thiss!1141) (bvsdiv (bvadd (extraKeys!5443 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!947291 () Bool)

(declare-fun res!635696 () Bool)

(assert (=> b!947291 (=> (not res!635696) (not e!533062))))

(assert (=> b!947291 (= res!635696 (bvsge (size!28048 thiss!1141) (_size!2469 thiss!1141)))))

(declare-fun d!114857 () Bool)

(declare-fun res!635697 () Bool)

(assert (=> d!114857 (=> (not res!635697) (not e!533062))))

(assert (=> d!114857 (= res!635697 (validMask!0 (mask!27451 thiss!1141)))))

(assert (=> d!114857 (= (simpleValid!357 thiss!1141) e!533062)))

(declare-fun b!947290 () Bool)

(declare-fun res!635698 () Bool)

(assert (=> b!947290 (=> (not res!635698) (not e!533062))))

(assert (=> b!947290 (= res!635698 (and (= (size!28042 (_values!5734 thiss!1141)) (bvadd (mask!27451 thiss!1141) #b00000000000000000000000000000001)) (= (size!28043 (_keys!10631 thiss!1141)) (size!28042 (_values!5734 thiss!1141))) (bvsge (_size!2469 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2469 thiss!1141) (bvadd (mask!27451 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!947293 () Bool)

(assert (=> b!947293 (= e!533062 (and (bvsge (extraKeys!5443 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5443 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2469 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114857 res!635697) b!947290))

(assert (= (and b!947290 res!635698) b!947291))

(assert (= (and b!947291 res!635696) b!947292))

(assert (= (and b!947292 res!635699) b!947293))

(declare-fun m!881095 () Bool)

(assert (=> b!947292 m!881095))

(assert (=> b!947291 m!881095))

(assert (=> d!114857 m!881005))

(assert (=> d!114843 d!114857))

(declare-fun b!947306 () Bool)

(declare-fun e!533069 () SeekEntryResult!9058)

(assert (=> b!947306 (= e!533069 Undefined!9058)))

(declare-fun b!947307 () Bool)

(declare-fun c!98842 () Bool)

(declare-fun lt!426645 () (_ BitVec 64))

(assert (=> b!947307 (= c!98842 (= lt!426645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533070 () SeekEntryResult!9058)

(declare-fun e!533071 () SeekEntryResult!9058)

(assert (=> b!947307 (= e!533070 e!533071)))

(declare-fun b!947309 () Bool)

(assert (=> b!947309 (= e!533069 e!533070)))

(declare-fun c!98841 () Bool)

(assert (=> b!947309 (= c!98841 (= lt!426645 key!756))))

(declare-fun b!947310 () Bool)

(assert (=> b!947310 (= e!533071 (MissingVacant!9058 (index!38605 lt!426627)))))

(declare-fun b!947311 () Bool)

(assert (=> b!947311 (= e!533070 (Found!9058 (index!38605 lt!426627)))))

(declare-fun lt!426646 () SeekEntryResult!9058)

(declare-fun d!114859 () Bool)

(assert (=> d!114859 (and (or ((_ is Undefined!9058) lt!426646) (not ((_ is Found!9058) lt!426646)) (and (bvsge (index!38604 lt!426646) #b00000000000000000000000000000000) (bvslt (index!38604 lt!426646) (size!28043 (_keys!10631 thiss!1141))))) (or ((_ is Undefined!9058) lt!426646) ((_ is Found!9058) lt!426646) (not ((_ is MissingVacant!9058) lt!426646)) (not (= (index!38606 lt!426646) (index!38605 lt!426627))) (and (bvsge (index!38606 lt!426646) #b00000000000000000000000000000000) (bvslt (index!38606 lt!426646) (size!28043 (_keys!10631 thiss!1141))))) (or ((_ is Undefined!9058) lt!426646) (ite ((_ is Found!9058) lt!426646) (= (select (arr!27572 (_keys!10631 thiss!1141)) (index!38604 lt!426646)) key!756) (and ((_ is MissingVacant!9058) lt!426646) (= (index!38606 lt!426646) (index!38605 lt!426627)) (= (select (arr!27572 (_keys!10631 thiss!1141)) (index!38606 lt!426646)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114859 (= lt!426646 e!533069)))

(declare-fun c!98843 () Bool)

(assert (=> d!114859 (= c!98843 (bvsge (x!81333 lt!426627) #b01111111111111111111111111111110))))

(assert (=> d!114859 (= lt!426645 (select (arr!27572 (_keys!10631 thiss!1141)) (index!38605 lt!426627)))))

(assert (=> d!114859 (validMask!0 (mask!27451 thiss!1141))))

(assert (=> d!114859 (= (seekKeyOrZeroReturnVacant!0 (x!81333 lt!426627) (index!38605 lt!426627) (index!38605 lt!426627) key!756 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)) lt!426646)))

(declare-fun b!947308 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947308 (= e!533071 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81333 lt!426627) #b00000000000000000000000000000001) (nextIndex!0 (index!38605 lt!426627) (bvadd (x!81333 lt!426627) #b00000000000000000000000000000001) (mask!27451 thiss!1141)) (index!38605 lt!426627) key!756 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)))))

(assert (= (and d!114859 c!98843) b!947306))

(assert (= (and d!114859 (not c!98843)) b!947309))

(assert (= (and b!947309 c!98841) b!947311))

(assert (= (and b!947309 (not c!98841)) b!947307))

(assert (= (and b!947307 c!98842) b!947310))

(assert (= (and b!947307 (not c!98842)) b!947308))

(declare-fun m!881097 () Bool)

(assert (=> d!114859 m!881097))

(declare-fun m!881099 () Bool)

(assert (=> d!114859 m!881099))

(assert (=> d!114859 m!881067))

(assert (=> d!114859 m!881005))

(declare-fun m!881101 () Bool)

(assert (=> b!947308 m!881101))

(assert (=> b!947308 m!881101))

(declare-fun m!881103 () Bool)

(assert (=> b!947308 m!881103))

(assert (=> b!947234 d!114859))

(declare-fun b!947330 () Bool)

(declare-fun e!533084 () SeekEntryResult!9058)

(assert (=> b!947330 (= e!533084 (Intermediate!9058 false (toIndex!0 key!756 (mask!27451 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!947331 () Bool)

(declare-fun e!533083 () SeekEntryResult!9058)

(assert (=> b!947331 (= e!533083 (Intermediate!9058 true (toIndex!0 key!756 (mask!27451 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!947332 () Bool)

(declare-fun e!533085 () Bool)

(declare-fun e!533086 () Bool)

(assert (=> b!947332 (= e!533085 e!533086)))

(declare-fun res!635708 () Bool)

(declare-fun lt!426652 () SeekEntryResult!9058)

(assert (=> b!947332 (= res!635708 (and ((_ is Intermediate!9058) lt!426652) (not (undefined!9870 lt!426652)) (bvslt (x!81333 lt!426652) #b01111111111111111111111111111110) (bvsge (x!81333 lt!426652) #b00000000000000000000000000000000) (bvsge (x!81333 lt!426652) #b00000000000000000000000000000000)))))

(assert (=> b!947332 (=> (not res!635708) (not e!533086))))

(declare-fun b!947333 () Bool)

(assert (=> b!947333 (and (bvsge (index!38605 lt!426652) #b00000000000000000000000000000000) (bvslt (index!38605 lt!426652) (size!28043 (_keys!10631 thiss!1141))))))

(declare-fun res!635707 () Bool)

(assert (=> b!947333 (= res!635707 (= (select (arr!27572 (_keys!10631 thiss!1141)) (index!38605 lt!426652)) key!756))))

(declare-fun e!533082 () Bool)

(assert (=> b!947333 (=> res!635707 e!533082)))

(assert (=> b!947333 (= e!533086 e!533082)))

(declare-fun b!947334 () Bool)

(assert (=> b!947334 (and (bvsge (index!38605 lt!426652) #b00000000000000000000000000000000) (bvslt (index!38605 lt!426652) (size!28043 (_keys!10631 thiss!1141))))))

(assert (=> b!947334 (= e!533082 (= (select (arr!27572 (_keys!10631 thiss!1141)) (index!38605 lt!426652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947335 () Bool)

(assert (=> b!947335 (= e!533085 (bvsge (x!81333 lt!426652) #b01111111111111111111111111111110))))

(declare-fun b!947336 () Bool)

(assert (=> b!947336 (= e!533083 e!533084)))

(declare-fun c!98852 () Bool)

(declare-fun lt!426651 () (_ BitVec 64))

(assert (=> b!947336 (= c!98852 (or (= lt!426651 key!756) (= (bvadd lt!426651 lt!426651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!114861 () Bool)

(assert (=> d!114861 e!533085))

(declare-fun c!98850 () Bool)

(assert (=> d!114861 (= c!98850 (and ((_ is Intermediate!9058) lt!426652) (undefined!9870 lt!426652)))))

(assert (=> d!114861 (= lt!426652 e!533083)))

(declare-fun c!98851 () Bool)

(assert (=> d!114861 (= c!98851 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114861 (= lt!426651 (select (arr!27572 (_keys!10631 thiss!1141)) (toIndex!0 key!756 (mask!27451 thiss!1141))))))

(assert (=> d!114861 (validMask!0 (mask!27451 thiss!1141))))

(assert (=> d!114861 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27451 thiss!1141)) key!756 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)) lt!426652)))

(declare-fun b!947337 () Bool)

(assert (=> b!947337 (and (bvsge (index!38605 lt!426652) #b00000000000000000000000000000000) (bvslt (index!38605 lt!426652) (size!28043 (_keys!10631 thiss!1141))))))

(declare-fun res!635706 () Bool)

(assert (=> b!947337 (= res!635706 (= (select (arr!27572 (_keys!10631 thiss!1141)) (index!38605 lt!426652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947337 (=> res!635706 e!533082)))

(declare-fun b!947338 () Bool)

(assert (=> b!947338 (= e!533084 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27451 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27451 thiss!1141)) key!756 (_keys!10631 thiss!1141) (mask!27451 thiss!1141)))))

(assert (= (and d!114861 c!98851) b!947331))

(assert (= (and d!114861 (not c!98851)) b!947336))

(assert (= (and b!947336 c!98852) b!947330))

(assert (= (and b!947336 (not c!98852)) b!947338))

(assert (= (and d!114861 c!98850) b!947335))

(assert (= (and d!114861 (not c!98850)) b!947332))

(assert (= (and b!947332 res!635708) b!947333))

(assert (= (and b!947333 (not res!635707)) b!947337))

(assert (= (and b!947337 (not res!635706)) b!947334))

(assert (=> b!947338 m!881061))

(declare-fun m!881105 () Bool)

(assert (=> b!947338 m!881105))

(assert (=> b!947338 m!881105))

(declare-fun m!881107 () Bool)

(assert (=> b!947338 m!881107))

(assert (=> d!114861 m!881061))

(declare-fun m!881109 () Bool)

(assert (=> d!114861 m!881109))

(assert (=> d!114861 m!881005))

(declare-fun m!881111 () Bool)

(assert (=> b!947333 m!881111))

(assert (=> b!947337 m!881111))

(assert (=> b!947334 m!881111))

(assert (=> d!114841 d!114861))

(declare-fun d!114863 () Bool)

(declare-fun lt!426658 () (_ BitVec 32))

(declare-fun lt!426657 () (_ BitVec 32))

(assert (=> d!114863 (= lt!426658 (bvmul (bvxor lt!426657 (bvlshr lt!426657 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114863 (= lt!426657 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114863 (and (bvsge (mask!27451 thiss!1141) #b00000000000000000000000000000000) (let ((res!635709 (let ((h!20438 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81352 (bvmul (bvxor h!20438 (bvlshr h!20438 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81352 (bvlshr x!81352 #b00000000000000000000000000001101)) (mask!27451 thiss!1141)))))) (and (bvslt res!635709 (bvadd (mask!27451 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635709 #b00000000000000000000000000000000))))))

(assert (=> d!114863 (= (toIndex!0 key!756 (mask!27451 thiss!1141)) (bvand (bvxor lt!426658 (bvlshr lt!426658 #b00000000000000000000000000001101)) (mask!27451 thiss!1141)))))

(assert (=> d!114841 d!114863))

(assert (=> d!114841 d!114835))

(declare-fun b!947349 () Bool)

(declare-fun e!533096 () Bool)

(declare-fun contains!5197 (List!19282 (_ BitVec 64)) Bool)

(assert (=> b!947349 (= e!533096 (contains!5197 Nil!19279 (select (arr!27572 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947350 () Bool)

(declare-fun e!533097 () Bool)

(declare-fun call!41130 () Bool)

(assert (=> b!947350 (= e!533097 call!41130)))

(declare-fun d!114865 () Bool)

(declare-fun res!635716 () Bool)

(declare-fun e!533098 () Bool)

(assert (=> d!114865 (=> res!635716 e!533098)))

(assert (=> d!114865 (= res!635716 (bvsge #b00000000000000000000000000000000 (size!28043 (_keys!10631 thiss!1141))))))

(assert (=> d!114865 (= (arrayNoDuplicates!0 (_keys!10631 thiss!1141) #b00000000000000000000000000000000 Nil!19279) e!533098)))

(declare-fun b!947351 () Bool)

(declare-fun e!533095 () Bool)

(assert (=> b!947351 (= e!533098 e!533095)))

(declare-fun res!635717 () Bool)

(assert (=> b!947351 (=> (not res!635717) (not e!533095))))

(assert (=> b!947351 (= res!635717 (not e!533096))))

(declare-fun res!635718 () Bool)

(assert (=> b!947351 (=> (not res!635718) (not e!533096))))

(assert (=> b!947351 (= res!635718 (validKeyInArray!0 (select (arr!27572 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947352 () Bool)

(assert (=> b!947352 (= e!533097 call!41130)))

(declare-fun b!947353 () Bool)

(assert (=> b!947353 (= e!533095 e!533097)))

(declare-fun c!98855 () Bool)

(assert (=> b!947353 (= c!98855 (validKeyInArray!0 (select (arr!27572 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41127 () Bool)

(assert (=> bm!41127 (= call!41130 (arrayNoDuplicates!0 (_keys!10631 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98855 (Cons!19278 (select (arr!27572 (_keys!10631 thiss!1141)) #b00000000000000000000000000000000) Nil!19279) Nil!19279)))))

(assert (= (and d!114865 (not res!635716)) b!947351))

(assert (= (and b!947351 res!635718) b!947349))

(assert (= (and b!947351 res!635717) b!947353))

(assert (= (and b!947353 c!98855) b!947350))

(assert (= (and b!947353 (not c!98855)) b!947352))

(assert (= (or b!947350 b!947352) bm!41127))

(assert (=> b!947349 m!881053))

(assert (=> b!947349 m!881053))

(declare-fun m!881113 () Bool)

(assert (=> b!947349 m!881113))

(assert (=> b!947351 m!881053))

(assert (=> b!947351 m!881053))

(assert (=> b!947351 m!881081))

(assert (=> b!947353 m!881053))

(assert (=> b!947353 m!881053))

(assert (=> b!947353 m!881081))

(assert (=> bm!41127 m!881053))

(declare-fun m!881115 () Bool)

(assert (=> bm!41127 m!881115))

(assert (=> b!947247 d!114865))

(declare-fun mapNonEmpty!32825 () Bool)

(declare-fun mapRes!32825 () Bool)

(declare-fun tp!62954 () Bool)

(declare-fun e!533099 () Bool)

(assert (=> mapNonEmpty!32825 (= mapRes!32825 (and tp!62954 e!533099))))

(declare-fun mapRest!32825 () (Array (_ BitVec 32) ValueCell!9839))

(declare-fun mapValue!32825 () ValueCell!9839)

(declare-fun mapKey!32825 () (_ BitVec 32))

(assert (=> mapNonEmpty!32825 (= mapRest!32824 (store mapRest!32825 mapKey!32825 mapValue!32825))))

(declare-fun mapIsEmpty!32825 () Bool)

(assert (=> mapIsEmpty!32825 mapRes!32825))

(declare-fun b!947354 () Bool)

(assert (=> b!947354 (= e!533099 tp_is_empty!20641)))

(declare-fun b!947355 () Bool)

(declare-fun e!533100 () Bool)

(assert (=> b!947355 (= e!533100 tp_is_empty!20641)))

(declare-fun condMapEmpty!32825 () Bool)

(declare-fun mapDefault!32825 () ValueCell!9839)

(assert (=> mapNonEmpty!32824 (= condMapEmpty!32825 (= mapRest!32824 ((as const (Array (_ BitVec 32) ValueCell!9839)) mapDefault!32825)))))

(assert (=> mapNonEmpty!32824 (= tp!62953 (and e!533100 mapRes!32825))))

(assert (= (and mapNonEmpty!32824 condMapEmpty!32825) mapIsEmpty!32825))

(assert (= (and mapNonEmpty!32824 (not condMapEmpty!32825)) mapNonEmpty!32825))

(assert (= (and mapNonEmpty!32825 ((_ is ValueCellFull!9839) mapValue!32825)) b!947354))

(assert (= (and mapNonEmpty!32824 ((_ is ValueCellFull!9839) mapDefault!32825)) b!947355))

(declare-fun m!881117 () Bool)

(assert (=> mapNonEmpty!32825 m!881117))

(check-sat (not b!947267) (not b!947292) (not bm!41121) (not b!947276) b_and!29565 (not b!947351) (not b!947308) (not bm!41127) (not b!947281) (not b!947291) (not bm!41124) (not d!114861) (not b_next!18133) (not d!114859) tp_is_empty!20641 (not b!947353) (not b!947279) (not b!947349) (not b!947338) (not d!114849) (not mapNonEmpty!32825) (not d!114857))
(check-sat b_and!29565 (not b_next!18133))
