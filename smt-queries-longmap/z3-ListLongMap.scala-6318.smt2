; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81158 () Bool)

(assert start!81158)

(declare-fun b!949721 () Bool)

(declare-fun b_free!18229 () Bool)

(declare-fun b_next!18229 () Bool)

(assert (=> b!949721 (= b_free!18229 (not b_next!18229))))

(declare-fun tp!63280 () Bool)

(declare-fun b_and!29657 () Bool)

(assert (=> b!949721 (= tp!63280 b_and!29657)))

(declare-fun mapNonEmpty!33014 () Bool)

(declare-fun mapRes!33014 () Bool)

(declare-fun tp!63281 () Bool)

(declare-fun e!534676 () Bool)

(assert (=> mapNonEmpty!33014 (= mapRes!33014 (and tp!63281 e!534676))))

(declare-datatypes ((V!32615 0))(
  ( (V!32616 (val!10419 Int)) )
))
(declare-datatypes ((ValueCell!9887 0))(
  ( (ValueCellFull!9887 (v!12960 V!32615)) (EmptyCell!9887) )
))
(declare-fun mapValue!33014 () ValueCell!9887)

(declare-datatypes ((array!57455 0))(
  ( (array!57456 (arr!27629 (Array (_ BitVec 32) ValueCell!9887)) (size!28108 (_ BitVec 32))) )
))
(declare-datatypes ((array!57457 0))(
  ( (array!57458 (arr!27630 (Array (_ BitVec 32) (_ BitVec 64))) (size!28109 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4924 0))(
  ( (LongMapFixedSize!4925 (defaultEntry!5772 Int) (mask!27558 (_ BitVec 32)) (extraKeys!5504 (_ BitVec 32)) (zeroValue!5608 V!32615) (minValue!5608 V!32615) (_size!2517 (_ BitVec 32)) (_keys!10701 array!57457) (_values!5795 array!57455) (_vacant!2517 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4924)

(declare-fun mapKey!33014 () (_ BitVec 32))

(declare-fun mapRest!33014 () (Array (_ BitVec 32) ValueCell!9887))

(assert (=> mapNonEmpty!33014 (= (arr!27629 (_values!5795 thiss!1141)) (store mapRest!33014 mapKey!33014 mapValue!33014))))

(declare-fun e!534673 () Bool)

(declare-fun tp_is_empty!20737 () Bool)

(declare-fun e!534672 () Bool)

(declare-fun array_inv!21508 (array!57457) Bool)

(declare-fun array_inv!21509 (array!57455) Bool)

(assert (=> b!949721 (= e!534672 (and tp!63280 tp_is_empty!20737 (array_inv!21508 (_keys!10701 thiss!1141)) (array_inv!21509 (_values!5795 thiss!1141)) e!534673))))

(declare-fun mapIsEmpty!33014 () Bool)

(assert (=> mapIsEmpty!33014 mapRes!33014))

(declare-fun b!949722 () Bool)

(declare-fun res!636863 () Bool)

(declare-fun e!534675 () Bool)

(assert (=> b!949722 (=> (not res!636863) (not e!534675))))

(assert (=> b!949722 (= res!636863 (and (= (size!28108 (_values!5795 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27558 thiss!1141))) (= (size!28109 (_keys!10701 thiss!1141)) (size!28108 (_values!5795 thiss!1141))) (bvsge (mask!27558 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5504 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5504 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949723 () Bool)

(declare-fun res!636861 () Bool)

(assert (=> b!949723 (=> (not res!636861) (not e!534675))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9136 0))(
  ( (MissingZero!9136 (index!38915 (_ BitVec 32))) (Found!9136 (index!38916 (_ BitVec 32))) (Intermediate!9136 (undefined!9948 Bool) (index!38917 (_ BitVec 32)) (x!81723 (_ BitVec 32))) (Undefined!9136) (MissingVacant!9136 (index!38918 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57457 (_ BitVec 32)) SeekEntryResult!9136)

(assert (=> b!949723 (= res!636861 (not ((_ is Found!9136) (seekEntry!0 key!756 (_keys!10701 thiss!1141) (mask!27558 thiss!1141)))))))

(declare-fun b!949724 () Bool)

(declare-fun e!534677 () Bool)

(assert (=> b!949724 (= e!534677 tp_is_empty!20737)))

(declare-fun b!949725 () Bool)

(declare-fun res!636857 () Bool)

(assert (=> b!949725 (=> (not res!636857) (not e!534675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57457 (_ BitVec 32)) Bool)

(assert (=> b!949725 (= res!636857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10701 thiss!1141) (mask!27558 thiss!1141)))))

(declare-fun b!949726 () Bool)

(assert (=> b!949726 (= e!534676 tp_is_empty!20737)))

(declare-fun b!949727 () Bool)

(declare-datatypes ((List!19336 0))(
  ( (Nil!19333) (Cons!19332 (h!20492 (_ BitVec 64)) (t!27664 List!19336)) )
))
(declare-fun arrayNoDuplicates!0 (array!57457 (_ BitVec 32) List!19336) Bool)

(assert (=> b!949727 (= e!534675 (not (arrayNoDuplicates!0 (_keys!10701 thiss!1141) #b00000000000000000000000000000000 Nil!19333)))))

(declare-fun b!949728 () Bool)

(assert (=> b!949728 (= e!534673 (and e!534677 mapRes!33014))))

(declare-fun condMapEmpty!33014 () Bool)

(declare-fun mapDefault!33014 () ValueCell!9887)

(assert (=> b!949728 (= condMapEmpty!33014 (= (arr!27629 (_values!5795 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9887)) mapDefault!33014)))))

(declare-fun b!949720 () Bool)

(declare-fun res!636859 () Bool)

(assert (=> b!949720 (=> (not res!636859) (not e!534675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949720 (= res!636859 (validMask!0 (mask!27558 thiss!1141)))))

(declare-fun res!636862 () Bool)

(assert (=> start!81158 (=> (not res!636862) (not e!534675))))

(declare-fun valid!1880 (LongMapFixedSize!4924) Bool)

(assert (=> start!81158 (= res!636862 (valid!1880 thiss!1141))))

(assert (=> start!81158 e!534675))

(assert (=> start!81158 e!534672))

(assert (=> start!81158 true))

(declare-fun b!949729 () Bool)

(declare-fun res!636860 () Bool)

(assert (=> b!949729 (=> (not res!636860) (not e!534675))))

(assert (=> b!949729 (= res!636860 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949730 () Bool)

(declare-fun res!636858 () Bool)

(assert (=> b!949730 (=> (not res!636858) (not e!534675))))

(declare-datatypes ((tuple2!13590 0))(
  ( (tuple2!13591 (_1!6806 (_ BitVec 64)) (_2!6806 V!32615)) )
))
(declare-datatypes ((List!19337 0))(
  ( (Nil!19334) (Cons!19333 (h!20493 tuple2!13590) (t!27665 List!19337)) )
))
(declare-datatypes ((ListLongMap!12277 0))(
  ( (ListLongMap!12278 (toList!6154 List!19337)) )
))
(declare-fun contains!5187 (ListLongMap!12277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3316 (array!57457 array!57455 (_ BitVec 32) (_ BitVec 32) V!32615 V!32615 (_ BitVec 32) Int) ListLongMap!12277)

(assert (=> b!949730 (= res!636858 (contains!5187 (getCurrentListMap!3316 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)) key!756))))

(assert (= (and start!81158 res!636862) b!949729))

(assert (= (and b!949729 res!636860) b!949723))

(assert (= (and b!949723 res!636861) b!949730))

(assert (= (and b!949730 res!636858) b!949720))

(assert (= (and b!949720 res!636859) b!949722))

(assert (= (and b!949722 res!636863) b!949725))

(assert (= (and b!949725 res!636857) b!949727))

(assert (= (and b!949728 condMapEmpty!33014) mapIsEmpty!33014))

(assert (= (and b!949728 (not condMapEmpty!33014)) mapNonEmpty!33014))

(assert (= (and mapNonEmpty!33014 ((_ is ValueCellFull!9887) mapValue!33014)) b!949726))

(assert (= (and b!949728 ((_ is ValueCellFull!9887) mapDefault!33014)) b!949724))

(assert (= b!949721 b!949728))

(assert (= start!81158 b!949721))

(declare-fun m!881759 () Bool)

(assert (=> b!949725 m!881759))

(declare-fun m!881761 () Bool)

(assert (=> b!949720 m!881761))

(declare-fun m!881763 () Bool)

(assert (=> b!949721 m!881763))

(declare-fun m!881765 () Bool)

(assert (=> b!949721 m!881765))

(declare-fun m!881767 () Bool)

(assert (=> b!949727 m!881767))

(declare-fun m!881769 () Bool)

(assert (=> b!949723 m!881769))

(declare-fun m!881771 () Bool)

(assert (=> b!949730 m!881771))

(assert (=> b!949730 m!881771))

(declare-fun m!881773 () Bool)

(assert (=> b!949730 m!881773))

(declare-fun m!881775 () Bool)

(assert (=> start!81158 m!881775))

(declare-fun m!881777 () Bool)

(assert (=> mapNonEmpty!33014 m!881777))

(check-sat tp_is_empty!20737 (not b!949730) (not b!949721) (not b!949723) b_and!29657 (not mapNonEmpty!33014) (not b!949720) (not b!949727) (not b!949725) (not start!81158) (not b_next!18229))
(check-sat b_and!29657 (not b_next!18229))
(get-model)

(declare-fun d!114947 () Bool)

(declare-fun res!636912 () Bool)

(declare-fun e!534716 () Bool)

(assert (=> d!114947 (=> (not res!636912) (not e!534716))))

(declare-fun simpleValid!373 (LongMapFixedSize!4924) Bool)

(assert (=> d!114947 (= res!636912 (simpleValid!373 thiss!1141))))

(assert (=> d!114947 (= (valid!1880 thiss!1141) e!534716)))

(declare-fun b!949803 () Bool)

(declare-fun res!636913 () Bool)

(assert (=> b!949803 (=> (not res!636913) (not e!534716))))

(declare-fun arrayCountValidKeys!0 (array!57457 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949803 (= res!636913 (= (arrayCountValidKeys!0 (_keys!10701 thiss!1141) #b00000000000000000000000000000000 (size!28109 (_keys!10701 thiss!1141))) (_size!2517 thiss!1141)))))

(declare-fun b!949804 () Bool)

(declare-fun res!636914 () Bool)

(assert (=> b!949804 (=> (not res!636914) (not e!534716))))

(assert (=> b!949804 (= res!636914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10701 thiss!1141) (mask!27558 thiss!1141)))))

(declare-fun b!949805 () Bool)

(assert (=> b!949805 (= e!534716 (arrayNoDuplicates!0 (_keys!10701 thiss!1141) #b00000000000000000000000000000000 Nil!19333))))

(assert (= (and d!114947 res!636912) b!949803))

(assert (= (and b!949803 res!636913) b!949804))

(assert (= (and b!949804 res!636914) b!949805))

(declare-fun m!881819 () Bool)

(assert (=> d!114947 m!881819))

(declare-fun m!881821 () Bool)

(assert (=> b!949803 m!881821))

(assert (=> b!949804 m!881759))

(assert (=> b!949805 m!881767))

(assert (=> start!81158 d!114947))

(declare-fun b!949816 () Bool)

(declare-fun e!534728 () Bool)

(declare-fun call!41320 () Bool)

(assert (=> b!949816 (= e!534728 call!41320)))

(declare-fun b!949817 () Bool)

(declare-fun e!534727 () Bool)

(assert (=> b!949817 (= e!534727 e!534728)))

(declare-fun c!99119 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!949817 (= c!99119 (validKeyInArray!0 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41317 () Bool)

(assert (=> bm!41317 (= call!41320 (arrayNoDuplicates!0 (_keys!10701 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99119 (Cons!19332 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000) Nil!19333) Nil!19333)))))

(declare-fun d!114949 () Bool)

(declare-fun res!636922 () Bool)

(declare-fun e!534725 () Bool)

(assert (=> d!114949 (=> res!636922 e!534725)))

(assert (=> d!114949 (= res!636922 (bvsge #b00000000000000000000000000000000 (size!28109 (_keys!10701 thiss!1141))))))

(assert (=> d!114949 (= (arrayNoDuplicates!0 (_keys!10701 thiss!1141) #b00000000000000000000000000000000 Nil!19333) e!534725)))

(declare-fun b!949818 () Bool)

(assert (=> b!949818 (= e!534725 e!534727)))

(declare-fun res!636923 () Bool)

(assert (=> b!949818 (=> (not res!636923) (not e!534727))))

(declare-fun e!534726 () Bool)

(assert (=> b!949818 (= res!636923 (not e!534726))))

(declare-fun res!636921 () Bool)

(assert (=> b!949818 (=> (not res!636921) (not e!534726))))

(assert (=> b!949818 (= res!636921 (validKeyInArray!0 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949819 () Bool)

(declare-fun contains!5189 (List!19336 (_ BitVec 64)) Bool)

(assert (=> b!949819 (= e!534726 (contains!5189 Nil!19333 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949820 () Bool)

(assert (=> b!949820 (= e!534728 call!41320)))

(assert (= (and d!114949 (not res!636922)) b!949818))

(assert (= (and b!949818 res!636921) b!949819))

(assert (= (and b!949818 res!636923) b!949817))

(assert (= (and b!949817 c!99119) b!949820))

(assert (= (and b!949817 (not c!99119)) b!949816))

(assert (= (or b!949820 b!949816) bm!41317))

(declare-fun m!881823 () Bool)

(assert (=> b!949817 m!881823))

(assert (=> b!949817 m!881823))

(declare-fun m!881825 () Bool)

(assert (=> b!949817 m!881825))

(assert (=> bm!41317 m!881823))

(declare-fun m!881827 () Bool)

(assert (=> bm!41317 m!881827))

(assert (=> b!949818 m!881823))

(assert (=> b!949818 m!881823))

(assert (=> b!949818 m!881825))

(assert (=> b!949819 m!881823))

(assert (=> b!949819 m!881823))

(declare-fun m!881829 () Bool)

(assert (=> b!949819 m!881829))

(assert (=> b!949727 d!114949))

(declare-fun d!114951 () Bool)

(assert (=> d!114951 (= (array_inv!21508 (_keys!10701 thiss!1141)) (bvsge (size!28109 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949721 d!114951))

(declare-fun d!114953 () Bool)

(assert (=> d!114953 (= (array_inv!21509 (_values!5795 thiss!1141)) (bvsge (size!28108 (_values!5795 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949721 d!114953))

(declare-fun d!114955 () Bool)

(declare-fun res!636929 () Bool)

(declare-fun e!534737 () Bool)

(assert (=> d!114955 (=> res!636929 e!534737)))

(assert (=> d!114955 (= res!636929 (bvsge #b00000000000000000000000000000000 (size!28109 (_keys!10701 thiss!1141))))))

(assert (=> d!114955 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10701 thiss!1141) (mask!27558 thiss!1141)) e!534737)))

(declare-fun b!949829 () Bool)

(declare-fun e!534736 () Bool)

(declare-fun call!41323 () Bool)

(assert (=> b!949829 (= e!534736 call!41323)))

(declare-fun bm!41320 () Bool)

(assert (=> bm!41320 (= call!41323 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10701 thiss!1141) (mask!27558 thiss!1141)))))

(declare-fun b!949830 () Bool)

(declare-fun e!534735 () Bool)

(assert (=> b!949830 (= e!534736 e!534735)))

(declare-fun lt!427601 () (_ BitVec 64))

(assert (=> b!949830 (= lt!427601 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31863 0))(
  ( (Unit!31864) )
))
(declare-fun lt!427603 () Unit!31863)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57457 (_ BitVec 64) (_ BitVec 32)) Unit!31863)

(assert (=> b!949830 (= lt!427603 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10701 thiss!1141) lt!427601 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!949830 (arrayContainsKey!0 (_keys!10701 thiss!1141) lt!427601 #b00000000000000000000000000000000)))

(declare-fun lt!427602 () Unit!31863)

(assert (=> b!949830 (= lt!427602 lt!427603)))

(declare-fun res!636928 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57457 (_ BitVec 32)) SeekEntryResult!9136)

(assert (=> b!949830 (= res!636928 (= (seekEntryOrOpen!0 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000) (_keys!10701 thiss!1141) (mask!27558 thiss!1141)) (Found!9136 #b00000000000000000000000000000000)))))

(assert (=> b!949830 (=> (not res!636928) (not e!534735))))

(declare-fun b!949831 () Bool)

(assert (=> b!949831 (= e!534735 call!41323)))

(declare-fun b!949832 () Bool)

(assert (=> b!949832 (= e!534737 e!534736)))

(declare-fun c!99122 () Bool)

(assert (=> b!949832 (= c!99122 (validKeyInArray!0 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114955 (not res!636929)) b!949832))

(assert (= (and b!949832 c!99122) b!949830))

(assert (= (and b!949832 (not c!99122)) b!949829))

(assert (= (and b!949830 res!636928) b!949831))

(assert (= (or b!949831 b!949829) bm!41320))

(declare-fun m!881831 () Bool)

(assert (=> bm!41320 m!881831))

(assert (=> b!949830 m!881823))

(declare-fun m!881833 () Bool)

(assert (=> b!949830 m!881833))

(declare-fun m!881835 () Bool)

(assert (=> b!949830 m!881835))

(assert (=> b!949830 m!881823))

(declare-fun m!881837 () Bool)

(assert (=> b!949830 m!881837))

(assert (=> b!949832 m!881823))

(assert (=> b!949832 m!881823))

(assert (=> b!949832 m!881825))

(assert (=> b!949725 d!114955))

(declare-fun d!114957 () Bool)

(declare-fun e!534743 () Bool)

(assert (=> d!114957 e!534743))

(declare-fun res!636932 () Bool)

(assert (=> d!114957 (=> res!636932 e!534743)))

(declare-fun lt!427613 () Bool)

(assert (=> d!114957 (= res!636932 (not lt!427613))))

(declare-fun lt!427615 () Bool)

(assert (=> d!114957 (= lt!427613 lt!427615)))

(declare-fun lt!427614 () Unit!31863)

(declare-fun e!534742 () Unit!31863)

(assert (=> d!114957 (= lt!427614 e!534742)))

(declare-fun c!99125 () Bool)

(assert (=> d!114957 (= c!99125 lt!427615)))

(declare-fun containsKey!463 (List!19337 (_ BitVec 64)) Bool)

(assert (=> d!114957 (= lt!427615 (containsKey!463 (toList!6154 (getCurrentListMap!3316 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141))) key!756))))

(assert (=> d!114957 (= (contains!5187 (getCurrentListMap!3316 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)) key!756) lt!427613)))

(declare-fun b!949839 () Bool)

(declare-fun lt!427612 () Unit!31863)

(assert (=> b!949839 (= e!534742 lt!427612)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!358 (List!19337 (_ BitVec 64)) Unit!31863)

(assert (=> b!949839 (= lt!427612 (lemmaContainsKeyImpliesGetValueByKeyDefined!358 (toList!6154 (getCurrentListMap!3316 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141))) key!756))))

(declare-datatypes ((Option!505 0))(
  ( (Some!504 (v!12963 V!32615)) (None!503) )
))
(declare-fun isDefined!371 (Option!505) Bool)

(declare-fun getValueByKey!499 (List!19337 (_ BitVec 64)) Option!505)

(assert (=> b!949839 (isDefined!371 (getValueByKey!499 (toList!6154 (getCurrentListMap!3316 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141))) key!756))))

(declare-fun b!949840 () Bool)

(declare-fun Unit!31865 () Unit!31863)

(assert (=> b!949840 (= e!534742 Unit!31865)))

(declare-fun b!949841 () Bool)

(assert (=> b!949841 (= e!534743 (isDefined!371 (getValueByKey!499 (toList!6154 (getCurrentListMap!3316 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141))) key!756)))))

(assert (= (and d!114957 c!99125) b!949839))

(assert (= (and d!114957 (not c!99125)) b!949840))

(assert (= (and d!114957 (not res!636932)) b!949841))

(declare-fun m!881839 () Bool)

(assert (=> d!114957 m!881839))

(declare-fun m!881841 () Bool)

(assert (=> b!949839 m!881841))

(declare-fun m!881843 () Bool)

(assert (=> b!949839 m!881843))

(assert (=> b!949839 m!881843))

(declare-fun m!881845 () Bool)

(assert (=> b!949839 m!881845))

(assert (=> b!949841 m!881843))

(assert (=> b!949841 m!881843))

(assert (=> b!949841 m!881845))

(assert (=> b!949730 d!114957))

(declare-fun bm!41335 () Bool)

(declare-fun call!41341 () ListLongMap!12277)

(declare-fun call!41342 () ListLongMap!12277)

(assert (=> bm!41335 (= call!41341 call!41342)))

(declare-fun b!949884 () Bool)

(declare-fun e!534777 () Bool)

(declare-fun lt!427681 () ListLongMap!12277)

(declare-fun apply!870 (ListLongMap!12277 (_ BitVec 64)) V!32615)

(declare-fun get!14521 (ValueCell!9887 V!32615) V!32615)

(declare-fun dynLambda!1636 (Int (_ BitVec 64)) V!32615)

(assert (=> b!949884 (= e!534777 (= (apply!870 lt!427681 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)) (get!14521 (select (arr!27629 (_values!5795 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1636 (defaultEntry!5772 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949884 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28108 (_values!5795 thiss!1141))))))

(assert (=> b!949884 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28109 (_keys!10701 thiss!1141))))))

(declare-fun b!949885 () Bool)

(declare-fun e!534782 () Bool)

(declare-fun e!534776 () Bool)

(assert (=> b!949885 (= e!534782 e!534776)))

(declare-fun c!99139 () Bool)

(assert (=> b!949885 (= c!99139 (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949886 () Bool)

(declare-fun c!99140 () Bool)

(assert (=> b!949886 (= c!99140 (and (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!534775 () ListLongMap!12277)

(declare-fun e!534778 () ListLongMap!12277)

(assert (=> b!949886 (= e!534775 e!534778)))

(declare-fun b!949887 () Bool)

(declare-fun e!534779 () Unit!31863)

(declare-fun lt!427677 () Unit!31863)

(assert (=> b!949887 (= e!534779 lt!427677)))

(declare-fun lt!427675 () ListLongMap!12277)

(declare-fun getCurrentListMapNoExtraKeys!3352 (array!57457 array!57455 (_ BitVec 32) (_ BitVec 32) V!32615 V!32615 (_ BitVec 32) Int) ListLongMap!12277)

(assert (=> b!949887 (= lt!427675 (getCurrentListMapNoExtraKeys!3352 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun lt!427670 () (_ BitVec 64))

(assert (=> b!949887 (= lt!427670 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427679 () (_ BitVec 64))

(assert (=> b!949887 (= lt!427679 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427660 () Unit!31863)

(declare-fun addStillContains!569 (ListLongMap!12277 (_ BitVec 64) V!32615 (_ BitVec 64)) Unit!31863)

(assert (=> b!949887 (= lt!427660 (addStillContains!569 lt!427675 lt!427670 (zeroValue!5608 thiss!1141) lt!427679))))

(declare-fun +!2880 (ListLongMap!12277 tuple2!13590) ListLongMap!12277)

(assert (=> b!949887 (contains!5187 (+!2880 lt!427675 (tuple2!13591 lt!427670 (zeroValue!5608 thiss!1141))) lt!427679)))

(declare-fun lt!427674 () Unit!31863)

(assert (=> b!949887 (= lt!427674 lt!427660)))

(declare-fun lt!427671 () ListLongMap!12277)

(assert (=> b!949887 (= lt!427671 (getCurrentListMapNoExtraKeys!3352 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun lt!427664 () (_ BitVec 64))

(assert (=> b!949887 (= lt!427664 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427669 () (_ BitVec 64))

(assert (=> b!949887 (= lt!427669 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427678 () Unit!31863)

(declare-fun addApplyDifferent!449 (ListLongMap!12277 (_ BitVec 64) V!32615 (_ BitVec 64)) Unit!31863)

(assert (=> b!949887 (= lt!427678 (addApplyDifferent!449 lt!427671 lt!427664 (minValue!5608 thiss!1141) lt!427669))))

(assert (=> b!949887 (= (apply!870 (+!2880 lt!427671 (tuple2!13591 lt!427664 (minValue!5608 thiss!1141))) lt!427669) (apply!870 lt!427671 lt!427669))))

(declare-fun lt!427665 () Unit!31863)

(assert (=> b!949887 (= lt!427665 lt!427678)))

(declare-fun lt!427676 () ListLongMap!12277)

(assert (=> b!949887 (= lt!427676 (getCurrentListMapNoExtraKeys!3352 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun lt!427680 () (_ BitVec 64))

(assert (=> b!949887 (= lt!427680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427667 () (_ BitVec 64))

(assert (=> b!949887 (= lt!427667 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427668 () Unit!31863)

(assert (=> b!949887 (= lt!427668 (addApplyDifferent!449 lt!427676 lt!427680 (zeroValue!5608 thiss!1141) lt!427667))))

(assert (=> b!949887 (= (apply!870 (+!2880 lt!427676 (tuple2!13591 lt!427680 (zeroValue!5608 thiss!1141))) lt!427667) (apply!870 lt!427676 lt!427667))))

(declare-fun lt!427673 () Unit!31863)

(assert (=> b!949887 (= lt!427673 lt!427668)))

(declare-fun lt!427662 () ListLongMap!12277)

(assert (=> b!949887 (= lt!427662 (getCurrentListMapNoExtraKeys!3352 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun lt!427666 () (_ BitVec 64))

(assert (=> b!949887 (= lt!427666 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427661 () (_ BitVec 64))

(assert (=> b!949887 (= lt!427661 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949887 (= lt!427677 (addApplyDifferent!449 lt!427662 lt!427666 (minValue!5608 thiss!1141) lt!427661))))

(assert (=> b!949887 (= (apply!870 (+!2880 lt!427662 (tuple2!13591 lt!427666 (minValue!5608 thiss!1141))) lt!427661) (apply!870 lt!427662 lt!427661))))

(declare-fun b!949888 () Bool)

(declare-fun call!41343 () ListLongMap!12277)

(assert (=> b!949888 (= e!534778 call!41343)))

(declare-fun b!949889 () Bool)

(declare-fun e!534772 () Bool)

(assert (=> b!949889 (= e!534772 (= (apply!870 lt!427681 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5608 thiss!1141)))))

(declare-fun b!949890 () Bool)

(declare-fun e!534770 () Bool)

(assert (=> b!949890 (= e!534770 (validKeyInArray!0 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114959 () Bool)

(assert (=> d!114959 e!534782))

(declare-fun res!636956 () Bool)

(assert (=> d!114959 (=> (not res!636956) (not e!534782))))

(assert (=> d!114959 (= res!636956 (or (bvsge #b00000000000000000000000000000000 (size!28109 (_keys!10701 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28109 (_keys!10701 thiss!1141))))))))

(declare-fun lt!427672 () ListLongMap!12277)

(assert (=> d!114959 (= lt!427681 lt!427672)))

(declare-fun lt!427663 () Unit!31863)

(assert (=> d!114959 (= lt!427663 e!534779)))

(declare-fun c!99143 () Bool)

(declare-fun e!534773 () Bool)

(assert (=> d!114959 (= c!99143 e!534773)))

(declare-fun res!636953 () Bool)

(assert (=> d!114959 (=> (not res!636953) (not e!534773))))

(assert (=> d!114959 (= res!636953 (bvslt #b00000000000000000000000000000000 (size!28109 (_keys!10701 thiss!1141))))))

(declare-fun e!534774 () ListLongMap!12277)

(assert (=> d!114959 (= lt!427672 e!534774)))

(declare-fun c!99138 () Bool)

(assert (=> d!114959 (= c!99138 (and (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114959 (validMask!0 (mask!27558 thiss!1141))))

(assert (=> d!114959 (= (getCurrentListMap!3316 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)) lt!427681)))

(declare-fun b!949891 () Bool)

(declare-fun e!534781 () Bool)

(assert (=> b!949891 (= e!534776 e!534781)))

(declare-fun res!636957 () Bool)

(declare-fun call!41339 () Bool)

(assert (=> b!949891 (= res!636957 call!41339)))

(assert (=> b!949891 (=> (not res!636957) (not e!534781))))

(declare-fun b!949892 () Bool)

(assert (=> b!949892 (= e!534775 call!41343)))

(declare-fun bm!41336 () Bool)

(declare-fun call!41338 () ListLongMap!12277)

(assert (=> bm!41336 (= call!41343 call!41338)))

(declare-fun bm!41337 () Bool)

(declare-fun c!99142 () Bool)

(declare-fun call!41340 () ListLongMap!12277)

(assert (=> bm!41337 (= call!41338 (+!2880 (ite c!99138 call!41342 (ite c!99142 call!41341 call!41340)) (ite (or c!99138 c!99142) (tuple2!13591 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5608 thiss!1141)) (tuple2!13591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5608 thiss!1141)))))))

(declare-fun b!949893 () Bool)

(declare-fun e!534780 () Bool)

(assert (=> b!949893 (= e!534780 e!534777)))

(declare-fun res!636954 () Bool)

(assert (=> b!949893 (=> (not res!636954) (not e!534777))))

(assert (=> b!949893 (= res!636954 (contains!5187 lt!427681 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949893 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28109 (_keys!10701 thiss!1141))))))

(declare-fun b!949894 () Bool)

(assert (=> b!949894 (= e!534774 (+!2880 call!41338 (tuple2!13591 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5608 thiss!1141))))))

(declare-fun b!949895 () Bool)

(assert (=> b!949895 (= e!534773 (validKeyInArray!0 (select (arr!27630 (_keys!10701 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949896 () Bool)

(declare-fun e!534771 () Bool)

(declare-fun call!41344 () Bool)

(assert (=> b!949896 (= e!534771 (not call!41344))))

(declare-fun b!949897 () Bool)

(assert (=> b!949897 (= e!534781 (= (apply!870 lt!427681 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5608 thiss!1141)))))

(declare-fun b!949898 () Bool)

(declare-fun res!636955 () Bool)

(assert (=> b!949898 (=> (not res!636955) (not e!534782))))

(assert (=> b!949898 (= res!636955 e!534780)))

(declare-fun res!636951 () Bool)

(assert (=> b!949898 (=> res!636951 e!534780)))

(assert (=> b!949898 (= res!636951 (not e!534770))))

(declare-fun res!636959 () Bool)

(assert (=> b!949898 (=> (not res!636959) (not e!534770))))

(assert (=> b!949898 (= res!636959 (bvslt #b00000000000000000000000000000000 (size!28109 (_keys!10701 thiss!1141))))))

(declare-fun b!949899 () Bool)

(declare-fun Unit!31866 () Unit!31863)

(assert (=> b!949899 (= e!534779 Unit!31866)))

(declare-fun bm!41338 () Bool)

(assert (=> bm!41338 (= call!41340 call!41341)))

(declare-fun bm!41339 () Bool)

(assert (=> bm!41339 (= call!41342 (getCurrentListMapNoExtraKeys!3352 (_keys!10701 thiss!1141) (_values!5795 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun b!949900 () Bool)

(declare-fun res!636958 () Bool)

(assert (=> b!949900 (=> (not res!636958) (not e!534782))))

(assert (=> b!949900 (= res!636958 e!534771)))

(declare-fun c!99141 () Bool)

(assert (=> b!949900 (= c!99141 (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41340 () Bool)

(assert (=> bm!41340 (= call!41339 (contains!5187 lt!427681 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949901 () Bool)

(assert (=> b!949901 (= e!534771 e!534772)))

(declare-fun res!636952 () Bool)

(assert (=> b!949901 (= res!636952 call!41344)))

(assert (=> b!949901 (=> (not res!636952) (not e!534772))))

(declare-fun b!949902 () Bool)

(assert (=> b!949902 (= e!534776 (not call!41339))))

(declare-fun b!949903 () Bool)

(assert (=> b!949903 (= e!534778 call!41340)))

(declare-fun b!949904 () Bool)

(assert (=> b!949904 (= e!534774 e!534775)))

(assert (=> b!949904 (= c!99142 (and (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41341 () Bool)

(assert (=> bm!41341 (= call!41344 (contains!5187 lt!427681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!114959 c!99138) b!949894))

(assert (= (and d!114959 (not c!99138)) b!949904))

(assert (= (and b!949904 c!99142) b!949892))

(assert (= (and b!949904 (not c!99142)) b!949886))

(assert (= (and b!949886 c!99140) b!949888))

(assert (= (and b!949886 (not c!99140)) b!949903))

(assert (= (or b!949888 b!949903) bm!41338))

(assert (= (or b!949892 bm!41338) bm!41335))

(assert (= (or b!949892 b!949888) bm!41336))

(assert (= (or b!949894 bm!41335) bm!41339))

(assert (= (or b!949894 bm!41336) bm!41337))

(assert (= (and d!114959 res!636953) b!949895))

(assert (= (and d!114959 c!99143) b!949887))

(assert (= (and d!114959 (not c!99143)) b!949899))

(assert (= (and d!114959 res!636956) b!949898))

(assert (= (and b!949898 res!636959) b!949890))

(assert (= (and b!949898 (not res!636951)) b!949893))

(assert (= (and b!949893 res!636954) b!949884))

(assert (= (and b!949898 res!636955) b!949900))

(assert (= (and b!949900 c!99141) b!949901))

(assert (= (and b!949900 (not c!99141)) b!949896))

(assert (= (and b!949901 res!636952) b!949889))

(assert (= (or b!949901 b!949896) bm!41341))

(assert (= (and b!949900 res!636958) b!949885))

(assert (= (and b!949885 c!99139) b!949891))

(assert (= (and b!949885 (not c!99139)) b!949902))

(assert (= (and b!949891 res!636957) b!949897))

(assert (= (or b!949891 b!949902) bm!41340))

(declare-fun b_lambda!14345 () Bool)

(assert (=> (not b_lambda!14345) (not b!949884)))

(declare-fun t!27669 () Bool)

(declare-fun tb!6181 () Bool)

(assert (=> (and b!949721 (= (defaultEntry!5772 thiss!1141) (defaultEntry!5772 thiss!1141)) t!27669) tb!6181))

(declare-fun result!12281 () Bool)

(assert (=> tb!6181 (= result!12281 tp_is_empty!20737)))

(assert (=> b!949884 t!27669))

(declare-fun b_and!29663 () Bool)

(assert (= b_and!29657 (and (=> t!27669 result!12281) b_and!29663)))

(declare-fun m!881847 () Bool)

(assert (=> b!949889 m!881847))

(assert (=> b!949890 m!881823))

(assert (=> b!949890 m!881823))

(assert (=> b!949890 m!881825))

(assert (=> d!114959 m!881761))

(assert (=> b!949895 m!881823))

(assert (=> b!949895 m!881823))

(assert (=> b!949895 m!881825))

(declare-fun m!881849 () Bool)

(assert (=> bm!41339 m!881849))

(declare-fun m!881851 () Bool)

(assert (=> bm!41337 m!881851))

(declare-fun m!881853 () Bool)

(assert (=> bm!41340 m!881853))

(declare-fun m!881855 () Bool)

(assert (=> b!949894 m!881855))

(declare-fun m!881857 () Bool)

(assert (=> b!949897 m!881857))

(declare-fun m!881859 () Bool)

(assert (=> b!949884 m!881859))

(declare-fun m!881861 () Bool)

(assert (=> b!949884 m!881861))

(declare-fun m!881863 () Bool)

(assert (=> b!949884 m!881863))

(assert (=> b!949884 m!881823))

(assert (=> b!949884 m!881859))

(assert (=> b!949884 m!881861))

(assert (=> b!949884 m!881823))

(declare-fun m!881865 () Bool)

(assert (=> b!949884 m!881865))

(assert (=> b!949893 m!881823))

(assert (=> b!949893 m!881823))

(declare-fun m!881867 () Bool)

(assert (=> b!949893 m!881867))

(declare-fun m!881869 () Bool)

(assert (=> bm!41341 m!881869))

(declare-fun m!881871 () Bool)

(assert (=> b!949887 m!881871))

(declare-fun m!881873 () Bool)

(assert (=> b!949887 m!881873))

(assert (=> b!949887 m!881849))

(declare-fun m!881875 () Bool)

(assert (=> b!949887 m!881875))

(declare-fun m!881877 () Bool)

(assert (=> b!949887 m!881877))

(declare-fun m!881879 () Bool)

(assert (=> b!949887 m!881879))

(assert (=> b!949887 m!881877))

(declare-fun m!881881 () Bool)

(assert (=> b!949887 m!881881))

(declare-fun m!881883 () Bool)

(assert (=> b!949887 m!881883))

(declare-fun m!881885 () Bool)

(assert (=> b!949887 m!881885))

(declare-fun m!881887 () Bool)

(assert (=> b!949887 m!881887))

(assert (=> b!949887 m!881871))

(declare-fun m!881889 () Bool)

(assert (=> b!949887 m!881889))

(assert (=> b!949887 m!881823))

(declare-fun m!881891 () Bool)

(assert (=> b!949887 m!881891))

(declare-fun m!881893 () Bool)

(assert (=> b!949887 m!881893))

(declare-fun m!881895 () Bool)

(assert (=> b!949887 m!881895))

(assert (=> b!949887 m!881883))

(declare-fun m!881897 () Bool)

(assert (=> b!949887 m!881897))

(assert (=> b!949887 m!881893))

(declare-fun m!881899 () Bool)

(assert (=> b!949887 m!881899))

(assert (=> b!949730 d!114959))

(declare-fun d!114961 () Bool)

(assert (=> d!114961 (= (validMask!0 (mask!27558 thiss!1141)) (and (or (= (mask!27558 thiss!1141) #b00000000000000000000000000000111) (= (mask!27558 thiss!1141) #b00000000000000000000000000001111) (= (mask!27558 thiss!1141) #b00000000000000000000000000011111) (= (mask!27558 thiss!1141) #b00000000000000000000000000111111) (= (mask!27558 thiss!1141) #b00000000000000000000000001111111) (= (mask!27558 thiss!1141) #b00000000000000000000000011111111) (= (mask!27558 thiss!1141) #b00000000000000000000000111111111) (= (mask!27558 thiss!1141) #b00000000000000000000001111111111) (= (mask!27558 thiss!1141) #b00000000000000000000011111111111) (= (mask!27558 thiss!1141) #b00000000000000000000111111111111) (= (mask!27558 thiss!1141) #b00000000000000000001111111111111) (= (mask!27558 thiss!1141) #b00000000000000000011111111111111) (= (mask!27558 thiss!1141) #b00000000000000000111111111111111) (= (mask!27558 thiss!1141) #b00000000000000001111111111111111) (= (mask!27558 thiss!1141) #b00000000000000011111111111111111) (= (mask!27558 thiss!1141) #b00000000000000111111111111111111) (= (mask!27558 thiss!1141) #b00000000000001111111111111111111) (= (mask!27558 thiss!1141) #b00000000000011111111111111111111) (= (mask!27558 thiss!1141) #b00000000000111111111111111111111) (= (mask!27558 thiss!1141) #b00000000001111111111111111111111) (= (mask!27558 thiss!1141) #b00000000011111111111111111111111) (= (mask!27558 thiss!1141) #b00000000111111111111111111111111) (= (mask!27558 thiss!1141) #b00000001111111111111111111111111) (= (mask!27558 thiss!1141) #b00000011111111111111111111111111) (= (mask!27558 thiss!1141) #b00000111111111111111111111111111) (= (mask!27558 thiss!1141) #b00001111111111111111111111111111) (= (mask!27558 thiss!1141) #b00011111111111111111111111111111) (= (mask!27558 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27558 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!949720 d!114961))

(declare-fun b!949919 () Bool)

(declare-fun e!534791 () SeekEntryResult!9136)

(assert (=> b!949919 (= e!534791 Undefined!9136)))

(declare-fun b!949920 () Bool)

(declare-fun e!534790 () SeekEntryResult!9136)

(declare-fun lt!427691 () SeekEntryResult!9136)

(assert (=> b!949920 (= e!534790 (ite ((_ is MissingVacant!9136) lt!427691) (MissingZero!9136 (index!38918 lt!427691)) lt!427691))))

(declare-fun lt!427690 () SeekEntryResult!9136)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57457 (_ BitVec 32)) SeekEntryResult!9136)

(assert (=> b!949920 (= lt!427691 (seekKeyOrZeroReturnVacant!0 (x!81723 lt!427690) (index!38917 lt!427690) (index!38917 lt!427690) key!756 (_keys!10701 thiss!1141) (mask!27558 thiss!1141)))))

(declare-fun d!114963 () Bool)

(declare-fun lt!427692 () SeekEntryResult!9136)

(assert (=> d!114963 (and (or ((_ is MissingVacant!9136) lt!427692) (not ((_ is Found!9136) lt!427692)) (and (bvsge (index!38916 lt!427692) #b00000000000000000000000000000000) (bvslt (index!38916 lt!427692) (size!28109 (_keys!10701 thiss!1141))))) (not ((_ is MissingVacant!9136) lt!427692)) (or (not ((_ is Found!9136) lt!427692)) (= (select (arr!27630 (_keys!10701 thiss!1141)) (index!38916 lt!427692)) key!756)))))

(assert (=> d!114963 (= lt!427692 e!534791)))

(declare-fun c!99151 () Bool)

(assert (=> d!114963 (= c!99151 (and ((_ is Intermediate!9136) lt!427690) (undefined!9948 lt!427690)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57457 (_ BitVec 32)) SeekEntryResult!9136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114963 (= lt!427690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27558 thiss!1141)) key!756 (_keys!10701 thiss!1141) (mask!27558 thiss!1141)))))

(assert (=> d!114963 (validMask!0 (mask!27558 thiss!1141))))

(assert (=> d!114963 (= (seekEntry!0 key!756 (_keys!10701 thiss!1141) (mask!27558 thiss!1141)) lt!427692)))

(declare-fun b!949921 () Bool)

(declare-fun e!534789 () SeekEntryResult!9136)

(assert (=> b!949921 (= e!534789 (Found!9136 (index!38917 lt!427690)))))

(declare-fun b!949922 () Bool)

(assert (=> b!949922 (= e!534791 e!534789)))

(declare-fun lt!427693 () (_ BitVec 64))

(assert (=> b!949922 (= lt!427693 (select (arr!27630 (_keys!10701 thiss!1141)) (index!38917 lt!427690)))))

(declare-fun c!99152 () Bool)

(assert (=> b!949922 (= c!99152 (= lt!427693 key!756))))

(declare-fun b!949923 () Bool)

(declare-fun c!99150 () Bool)

(assert (=> b!949923 (= c!99150 (= lt!427693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949923 (= e!534789 e!534790)))

(declare-fun b!949924 () Bool)

(assert (=> b!949924 (= e!534790 (MissingZero!9136 (index!38917 lt!427690)))))

(assert (= (and d!114963 c!99151) b!949919))

(assert (= (and d!114963 (not c!99151)) b!949922))

(assert (= (and b!949922 c!99152) b!949921))

(assert (= (and b!949922 (not c!99152)) b!949923))

(assert (= (and b!949923 c!99150) b!949924))

(assert (= (and b!949923 (not c!99150)) b!949920))

(declare-fun m!881901 () Bool)

(assert (=> b!949920 m!881901))

(declare-fun m!881903 () Bool)

(assert (=> d!114963 m!881903))

(declare-fun m!881905 () Bool)

(assert (=> d!114963 m!881905))

(assert (=> d!114963 m!881905))

(declare-fun m!881907 () Bool)

(assert (=> d!114963 m!881907))

(assert (=> d!114963 m!881761))

(declare-fun m!881909 () Bool)

(assert (=> b!949922 m!881909))

(assert (=> b!949723 d!114963))

(declare-fun b!949931 () Bool)

(declare-fun e!534796 () Bool)

(assert (=> b!949931 (= e!534796 tp_is_empty!20737)))

(declare-fun b!949932 () Bool)

(declare-fun e!534797 () Bool)

(assert (=> b!949932 (= e!534797 tp_is_empty!20737)))

(declare-fun mapIsEmpty!33023 () Bool)

(declare-fun mapRes!33023 () Bool)

(assert (=> mapIsEmpty!33023 mapRes!33023))

(declare-fun mapNonEmpty!33023 () Bool)

(declare-fun tp!63296 () Bool)

(assert (=> mapNonEmpty!33023 (= mapRes!33023 (and tp!63296 e!534796))))

(declare-fun mapValue!33023 () ValueCell!9887)

(declare-fun mapKey!33023 () (_ BitVec 32))

(declare-fun mapRest!33023 () (Array (_ BitVec 32) ValueCell!9887))

(assert (=> mapNonEmpty!33023 (= mapRest!33014 (store mapRest!33023 mapKey!33023 mapValue!33023))))

(declare-fun condMapEmpty!33023 () Bool)

(declare-fun mapDefault!33023 () ValueCell!9887)

(assert (=> mapNonEmpty!33014 (= condMapEmpty!33023 (= mapRest!33014 ((as const (Array (_ BitVec 32) ValueCell!9887)) mapDefault!33023)))))

(assert (=> mapNonEmpty!33014 (= tp!63281 (and e!534797 mapRes!33023))))

(assert (= (and mapNonEmpty!33014 condMapEmpty!33023) mapIsEmpty!33023))

(assert (= (and mapNonEmpty!33014 (not condMapEmpty!33023)) mapNonEmpty!33023))

(assert (= (and mapNonEmpty!33023 ((_ is ValueCellFull!9887) mapValue!33023)) b!949931))

(assert (= (and mapNonEmpty!33014 ((_ is ValueCellFull!9887) mapDefault!33023)) b!949932))

(declare-fun m!881911 () Bool)

(assert (=> mapNonEmpty!33023 m!881911))

(declare-fun b_lambda!14347 () Bool)

(assert (= b_lambda!14345 (or (and b!949721 b_free!18229) b_lambda!14347)))

(check-sat (not b!949897) tp_is_empty!20737 (not bm!41320) (not bm!41339) (not d!114963) (not b!949841) (not d!114959) (not b!949890) (not b!949804) (not b!949805) (not b!949830) (not b_next!18229) (not bm!41340) (not b!949889) (not b!949818) (not bm!41337) (not bm!41317) (not b!949803) (not b!949817) (not b!949884) (not b!949893) (not b!949895) (not b_lambda!14347) (not bm!41341) (not mapNonEmpty!33023) (not b!949832) b_and!29663 (not b!949819) (not b!949920) (not d!114957) (not b!949887) (not b!949839) (not d!114947) (not b!949894))
(check-sat b_and!29663 (not b_next!18229))
