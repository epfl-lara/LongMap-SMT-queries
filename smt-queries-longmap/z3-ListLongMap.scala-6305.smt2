; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80734 () Bool)

(assert start!80734)

(declare-fun b!946820 () Bool)

(declare-fun b_free!18153 () Bool)

(declare-fun b_next!18153 () Bool)

(assert (=> b!946820 (= b_free!18153 (not b_next!18153))))

(declare-fun tp!63007 () Bool)

(declare-fun b_and!29575 () Bool)

(assert (=> b!946820 (= tp!63007 b_and!29575)))

(declare-fun res!635536 () Bool)

(declare-fun e!532816 () Bool)

(assert (=> start!80734 (=> (not res!635536) (not e!532816))))

(declare-datatypes ((V!32513 0))(
  ( (V!32514 (val!10381 Int)) )
))
(declare-datatypes ((ValueCell!9849 0))(
  ( (ValueCellFull!9849 (v!12915 V!32513)) (EmptyCell!9849) )
))
(declare-datatypes ((array!57312 0))(
  ( (array!57313 (arr!27570 (Array (_ BitVec 32) ValueCell!9849)) (size!28042 (_ BitVec 32))) )
))
(declare-datatypes ((array!57314 0))(
  ( (array!57315 (arr!27571 (Array (_ BitVec 32) (_ BitVec 64))) (size!28043 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4848 0))(
  ( (LongMapFixedSize!4849 (defaultEntry!5721 Int) (mask!27438 (_ BitVec 32)) (extraKeys!5453 (_ BitVec 32)) (zeroValue!5557 V!32513) (minValue!5557 V!32513) (_size!2479 (_ BitVec 32)) (_keys!10622 array!57314) (_values!5744 array!57312) (_vacant!2479 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4848)

(declare-fun valid!1847 (LongMapFixedSize!4848) Bool)

(assert (=> start!80734 (= res!635536 (valid!1847 thiss!1141))))

(assert (=> start!80734 e!532816))

(declare-fun e!532810 () Bool)

(assert (=> start!80734 e!532810))

(assert (=> start!80734 true))

(declare-fun b!946819 () Bool)

(declare-fun e!532812 () Bool)

(declare-fun tp_is_empty!20661 () Bool)

(assert (=> b!946819 (= e!532812 tp_is_empty!20661)))

(declare-fun e!532809 () Bool)

(declare-fun array_inv!21404 (array!57314) Bool)

(declare-fun array_inv!21405 (array!57312) Bool)

(assert (=> b!946820 (= e!532810 (and tp!63007 tp_is_empty!20661 (array_inv!21404 (_keys!10622 thiss!1141)) (array_inv!21405 (_values!5744 thiss!1141)) e!532809))))

(declare-fun mapIsEmpty!32856 () Bool)

(declare-fun mapRes!32856 () Bool)

(assert (=> mapIsEmpty!32856 mapRes!32856))

(declare-fun b!946821 () Bool)

(declare-fun e!532815 () Bool)

(declare-fun e!532814 () Bool)

(assert (=> b!946821 (= e!532815 (not e!532814))))

(declare-fun res!635537 () Bool)

(assert (=> b!946821 (=> res!635537 e!532814)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946821 (= res!635537 (not (validMask!0 (mask!27438 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946821 (arrayContainsKey!0 (_keys!10622 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9106 0))(
  ( (MissingZero!9106 (index!38795 (_ BitVec 32))) (Found!9106 (index!38796 (_ BitVec 32))) (Intermediate!9106 (undefined!9918 Bool) (index!38797 (_ BitVec 32)) (x!81433 (_ BitVec 32))) (Undefined!9106) (MissingVacant!9106 (index!38798 (_ BitVec 32))) )
))
(declare-fun lt!426405 () SeekEntryResult!9106)

(declare-datatypes ((Unit!31910 0))(
  ( (Unit!31911) )
))
(declare-fun lt!426404 () Unit!31910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57314 (_ BitVec 64) (_ BitVec 32)) Unit!31910)

(assert (=> b!946821 (= lt!426404 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10622 thiss!1141) key!756 (index!38796 lt!426405)))))

(declare-fun mapNonEmpty!32856 () Bool)

(declare-fun tp!63008 () Bool)

(declare-fun e!532811 () Bool)

(assert (=> mapNonEmpty!32856 (= mapRes!32856 (and tp!63008 e!532811))))

(declare-fun mapRest!32856 () (Array (_ BitVec 32) ValueCell!9849))

(declare-fun mapKey!32856 () (_ BitVec 32))

(declare-fun mapValue!32856 () ValueCell!9849)

(assert (=> mapNonEmpty!32856 (= (arr!27570 (_values!5744 thiss!1141)) (store mapRest!32856 mapKey!32856 mapValue!32856))))

(declare-fun b!946822 () Bool)

(assert (=> b!946822 (= e!532811 tp_is_empty!20661)))

(declare-fun b!946823 () Bool)

(assert (=> b!946823 (= e!532816 e!532815)))

(declare-fun res!635538 () Bool)

(assert (=> b!946823 (=> (not res!635538) (not e!532815))))

(get-info :version)

(assert (=> b!946823 (= res!635538 ((_ is Found!9106) lt!426405))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57314 (_ BitVec 32)) SeekEntryResult!9106)

(assert (=> b!946823 (= lt!426405 (seekEntry!0 key!756 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)))))

(declare-fun b!946824 () Bool)

(assert (=> b!946824 (= e!532809 (and e!532812 mapRes!32856))))

(declare-fun condMapEmpty!32856 () Bool)

(declare-fun mapDefault!32856 () ValueCell!9849)

(assert (=> b!946824 (= condMapEmpty!32856 (= (arr!27570 (_values!5744 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9849)) mapDefault!32856)))))

(declare-fun b!946825 () Bool)

(declare-fun res!635539 () Bool)

(assert (=> b!946825 (=> (not res!635539) (not e!532816))))

(assert (=> b!946825 (= res!635539 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946826 () Bool)

(assert (=> b!946826 (= e!532814 (or (not (= (size!28042 (_values!5744 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27438 thiss!1141)))) (not (= (size!28043 (_keys!10622 thiss!1141)) (size!28042 (_values!5744 thiss!1141)))) (bvslt (mask!27438 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5453 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5453 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!80734 res!635536) b!946825))

(assert (= (and b!946825 res!635539) b!946823))

(assert (= (and b!946823 res!635538) b!946821))

(assert (= (and b!946821 (not res!635537)) b!946826))

(assert (= (and b!946824 condMapEmpty!32856) mapIsEmpty!32856))

(assert (= (and b!946824 (not condMapEmpty!32856)) mapNonEmpty!32856))

(assert (= (and mapNonEmpty!32856 ((_ is ValueCellFull!9849) mapValue!32856)) b!946822))

(assert (= (and b!946824 ((_ is ValueCellFull!9849) mapDefault!32856)) b!946819))

(assert (= b!946820 b!946824))

(assert (= start!80734 b!946820))

(declare-fun m!880029 () Bool)

(assert (=> mapNonEmpty!32856 m!880029))

(declare-fun m!880031 () Bool)

(assert (=> start!80734 m!880031))

(declare-fun m!880033 () Bool)

(assert (=> b!946823 m!880033))

(declare-fun m!880035 () Bool)

(assert (=> b!946820 m!880035))

(declare-fun m!880037 () Bool)

(assert (=> b!946820 m!880037))

(declare-fun m!880039 () Bool)

(assert (=> b!946821 m!880039))

(declare-fun m!880041 () Bool)

(assert (=> b!946821 m!880041))

(declare-fun m!880043 () Bool)

(assert (=> b!946821 m!880043))

(check-sat tp_is_empty!20661 (not b!946821) (not b!946820) (not b!946823) b_and!29575 (not b_next!18153) (not start!80734) (not mapNonEmpty!32856))
(check-sat b_and!29575 (not b_next!18153))
(get-model)

(declare-fun d!114597 () Bool)

(declare-fun res!635558 () Bool)

(declare-fun e!532843 () Bool)

(assert (=> d!114597 (=> (not res!635558) (not e!532843))))

(declare-fun simpleValid!360 (LongMapFixedSize!4848) Bool)

(assert (=> d!114597 (= res!635558 (simpleValid!360 thiss!1141))))

(assert (=> d!114597 (= (valid!1847 thiss!1141) e!532843)))

(declare-fun b!946857 () Bool)

(declare-fun res!635559 () Bool)

(assert (=> b!946857 (=> (not res!635559) (not e!532843))))

(declare-fun arrayCountValidKeys!0 (array!57314 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946857 (= res!635559 (= (arrayCountValidKeys!0 (_keys!10622 thiss!1141) #b00000000000000000000000000000000 (size!28043 (_keys!10622 thiss!1141))) (_size!2479 thiss!1141)))))

(declare-fun b!946858 () Bool)

(declare-fun res!635560 () Bool)

(assert (=> b!946858 (=> (not res!635560) (not e!532843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57314 (_ BitVec 32)) Bool)

(assert (=> b!946858 (= res!635560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)))))

(declare-fun b!946859 () Bool)

(declare-datatypes ((List!19300 0))(
  ( (Nil!19297) (Cons!19296 (h!20451 (_ BitVec 64)) (t!27621 List!19300)) )
))
(declare-fun arrayNoDuplicates!0 (array!57314 (_ BitVec 32) List!19300) Bool)

(assert (=> b!946859 (= e!532843 (arrayNoDuplicates!0 (_keys!10622 thiss!1141) #b00000000000000000000000000000000 Nil!19297))))

(assert (= (and d!114597 res!635558) b!946857))

(assert (= (and b!946857 res!635559) b!946858))

(assert (= (and b!946858 res!635560) b!946859))

(declare-fun m!880061 () Bool)

(assert (=> d!114597 m!880061))

(declare-fun m!880063 () Bool)

(assert (=> b!946857 m!880063))

(declare-fun m!880065 () Bool)

(assert (=> b!946858 m!880065))

(declare-fun m!880067 () Bool)

(assert (=> b!946859 m!880067))

(assert (=> start!80734 d!114597))

(declare-fun d!114599 () Bool)

(assert (=> d!114599 (= (array_inv!21404 (_keys!10622 thiss!1141)) (bvsge (size!28043 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946820 d!114599))

(declare-fun d!114601 () Bool)

(assert (=> d!114601 (= (array_inv!21405 (_values!5744 thiss!1141)) (bvsge (size!28042 (_values!5744 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946820 d!114601))

(declare-fun b!946872 () Bool)

(declare-fun c!98628 () Bool)

(declare-fun lt!426420 () (_ BitVec 64))

(assert (=> b!946872 (= c!98628 (= lt!426420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532851 () SeekEntryResult!9106)

(declare-fun e!532850 () SeekEntryResult!9106)

(assert (=> b!946872 (= e!532851 e!532850)))

(declare-fun b!946873 () Bool)

(declare-fun lt!426422 () SeekEntryResult!9106)

(assert (=> b!946873 (= e!532851 (Found!9106 (index!38797 lt!426422)))))

(declare-fun b!946874 () Bool)

(assert (=> b!946874 (= e!532850 (MissingZero!9106 (index!38797 lt!426422)))))

(declare-fun b!946875 () Bool)

(declare-fun lt!426423 () SeekEntryResult!9106)

(assert (=> b!946875 (= e!532850 (ite ((_ is MissingVacant!9106) lt!426423) (MissingZero!9106 (index!38798 lt!426423)) lt!426423))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57314 (_ BitVec 32)) SeekEntryResult!9106)

(assert (=> b!946875 (= lt!426423 (seekKeyOrZeroReturnVacant!0 (x!81433 lt!426422) (index!38797 lt!426422) (index!38797 lt!426422) key!756 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)))))

(declare-fun b!946876 () Bool)

(declare-fun e!532852 () SeekEntryResult!9106)

(assert (=> b!946876 (= e!532852 Undefined!9106)))

(declare-fun d!114603 () Bool)

(declare-fun lt!426421 () SeekEntryResult!9106)

(assert (=> d!114603 (and (or ((_ is MissingVacant!9106) lt!426421) (not ((_ is Found!9106) lt!426421)) (and (bvsge (index!38796 lt!426421) #b00000000000000000000000000000000) (bvslt (index!38796 lt!426421) (size!28043 (_keys!10622 thiss!1141))))) (not ((_ is MissingVacant!9106) lt!426421)) (or (not ((_ is Found!9106) lt!426421)) (= (select (arr!27571 (_keys!10622 thiss!1141)) (index!38796 lt!426421)) key!756)))))

(assert (=> d!114603 (= lt!426421 e!532852)))

(declare-fun c!98629 () Bool)

(assert (=> d!114603 (= c!98629 (and ((_ is Intermediate!9106) lt!426422) (undefined!9918 lt!426422)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57314 (_ BitVec 32)) SeekEntryResult!9106)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114603 (= lt!426422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27438 thiss!1141)) key!756 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)))))

(assert (=> d!114603 (validMask!0 (mask!27438 thiss!1141))))

(assert (=> d!114603 (= (seekEntry!0 key!756 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)) lt!426421)))

(declare-fun b!946877 () Bool)

(assert (=> b!946877 (= e!532852 e!532851)))

(assert (=> b!946877 (= lt!426420 (select (arr!27571 (_keys!10622 thiss!1141)) (index!38797 lt!426422)))))

(declare-fun c!98630 () Bool)

(assert (=> b!946877 (= c!98630 (= lt!426420 key!756))))

(assert (= (and d!114603 c!98629) b!946876))

(assert (= (and d!114603 (not c!98629)) b!946877))

(assert (= (and b!946877 c!98630) b!946873))

(assert (= (and b!946877 (not c!98630)) b!946872))

(assert (= (and b!946872 c!98628) b!946874))

(assert (= (and b!946872 (not c!98628)) b!946875))

(declare-fun m!880069 () Bool)

(assert (=> b!946875 m!880069))

(declare-fun m!880071 () Bool)

(assert (=> d!114603 m!880071))

(declare-fun m!880073 () Bool)

(assert (=> d!114603 m!880073))

(assert (=> d!114603 m!880073))

(declare-fun m!880075 () Bool)

(assert (=> d!114603 m!880075))

(assert (=> d!114603 m!880039))

(declare-fun m!880077 () Bool)

(assert (=> b!946877 m!880077))

(assert (=> b!946823 d!114603))

(declare-fun d!114605 () Bool)

(assert (=> d!114605 (= (validMask!0 (mask!27438 thiss!1141)) (and (or (= (mask!27438 thiss!1141) #b00000000000000000000000000000111) (= (mask!27438 thiss!1141) #b00000000000000000000000000001111) (= (mask!27438 thiss!1141) #b00000000000000000000000000011111) (= (mask!27438 thiss!1141) #b00000000000000000000000000111111) (= (mask!27438 thiss!1141) #b00000000000000000000000001111111) (= (mask!27438 thiss!1141) #b00000000000000000000000011111111) (= (mask!27438 thiss!1141) #b00000000000000000000000111111111) (= (mask!27438 thiss!1141) #b00000000000000000000001111111111) (= (mask!27438 thiss!1141) #b00000000000000000000011111111111) (= (mask!27438 thiss!1141) #b00000000000000000000111111111111) (= (mask!27438 thiss!1141) #b00000000000000000001111111111111) (= (mask!27438 thiss!1141) #b00000000000000000011111111111111) (= (mask!27438 thiss!1141) #b00000000000000000111111111111111) (= (mask!27438 thiss!1141) #b00000000000000001111111111111111) (= (mask!27438 thiss!1141) #b00000000000000011111111111111111) (= (mask!27438 thiss!1141) #b00000000000000111111111111111111) (= (mask!27438 thiss!1141) #b00000000000001111111111111111111) (= (mask!27438 thiss!1141) #b00000000000011111111111111111111) (= (mask!27438 thiss!1141) #b00000000000111111111111111111111) (= (mask!27438 thiss!1141) #b00000000001111111111111111111111) (= (mask!27438 thiss!1141) #b00000000011111111111111111111111) (= (mask!27438 thiss!1141) #b00000000111111111111111111111111) (= (mask!27438 thiss!1141) #b00000001111111111111111111111111) (= (mask!27438 thiss!1141) #b00000011111111111111111111111111) (= (mask!27438 thiss!1141) #b00000111111111111111111111111111) (= (mask!27438 thiss!1141) #b00001111111111111111111111111111) (= (mask!27438 thiss!1141) #b00011111111111111111111111111111) (= (mask!27438 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27438 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946821 d!114605))

(declare-fun d!114607 () Bool)

(declare-fun res!635565 () Bool)

(declare-fun e!532857 () Bool)

(assert (=> d!114607 (=> res!635565 e!532857)))

(assert (=> d!114607 (= res!635565 (= (select (arr!27571 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114607 (= (arrayContainsKey!0 (_keys!10622 thiss!1141) key!756 #b00000000000000000000000000000000) e!532857)))

(declare-fun b!946882 () Bool)

(declare-fun e!532858 () Bool)

(assert (=> b!946882 (= e!532857 e!532858)))

(declare-fun res!635566 () Bool)

(assert (=> b!946882 (=> (not res!635566) (not e!532858))))

(assert (=> b!946882 (= res!635566 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28043 (_keys!10622 thiss!1141))))))

(declare-fun b!946883 () Bool)

(assert (=> b!946883 (= e!532858 (arrayContainsKey!0 (_keys!10622 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114607 (not res!635565)) b!946882))

(assert (= (and b!946882 res!635566) b!946883))

(declare-fun m!880079 () Bool)

(assert (=> d!114607 m!880079))

(declare-fun m!880081 () Bool)

(assert (=> b!946883 m!880081))

(assert (=> b!946821 d!114607))

(declare-fun d!114609 () Bool)

(assert (=> d!114609 (arrayContainsKey!0 (_keys!10622 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426426 () Unit!31910)

(declare-fun choose!13 (array!57314 (_ BitVec 64) (_ BitVec 32)) Unit!31910)

(assert (=> d!114609 (= lt!426426 (choose!13 (_keys!10622 thiss!1141) key!756 (index!38796 lt!426405)))))

(assert (=> d!114609 (bvsge (index!38796 lt!426405) #b00000000000000000000000000000000)))

(assert (=> d!114609 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10622 thiss!1141) key!756 (index!38796 lt!426405)) lt!426426)))

(declare-fun bs!26615 () Bool)

(assert (= bs!26615 d!114609))

(assert (=> bs!26615 m!880041))

(declare-fun m!880083 () Bool)

(assert (=> bs!26615 m!880083))

(assert (=> b!946821 d!114609))

(declare-fun b!946891 () Bool)

(declare-fun e!532863 () Bool)

(assert (=> b!946891 (= e!532863 tp_is_empty!20661)))

(declare-fun b!946890 () Bool)

(declare-fun e!532864 () Bool)

(assert (=> b!946890 (= e!532864 tp_is_empty!20661)))

(declare-fun mapIsEmpty!32862 () Bool)

(declare-fun mapRes!32862 () Bool)

(assert (=> mapIsEmpty!32862 mapRes!32862))

(declare-fun mapNonEmpty!32862 () Bool)

(declare-fun tp!63017 () Bool)

(assert (=> mapNonEmpty!32862 (= mapRes!32862 (and tp!63017 e!532864))))

(declare-fun mapRest!32862 () (Array (_ BitVec 32) ValueCell!9849))

(declare-fun mapKey!32862 () (_ BitVec 32))

(declare-fun mapValue!32862 () ValueCell!9849)

(assert (=> mapNonEmpty!32862 (= mapRest!32856 (store mapRest!32862 mapKey!32862 mapValue!32862))))

(declare-fun condMapEmpty!32862 () Bool)

(declare-fun mapDefault!32862 () ValueCell!9849)

(assert (=> mapNonEmpty!32856 (= condMapEmpty!32862 (= mapRest!32856 ((as const (Array (_ BitVec 32) ValueCell!9849)) mapDefault!32862)))))

(assert (=> mapNonEmpty!32856 (= tp!63008 (and e!532863 mapRes!32862))))

(assert (= (and mapNonEmpty!32856 condMapEmpty!32862) mapIsEmpty!32862))

(assert (= (and mapNonEmpty!32856 (not condMapEmpty!32862)) mapNonEmpty!32862))

(assert (= (and mapNonEmpty!32862 ((_ is ValueCellFull!9849) mapValue!32862)) b!946890))

(assert (= (and mapNonEmpty!32856 ((_ is ValueCellFull!9849) mapDefault!32862)) b!946891))

(declare-fun m!880085 () Bool)

(assert (=> mapNonEmpty!32862 m!880085))

(check-sat (not d!114597) (not b!946857) tp_is_empty!20661 b_and!29575 (not b_next!18153) (not b!946875) (not d!114603) (not b!946858) (not mapNonEmpty!32862) (not d!114609) (not b!946883) (not b!946859))
(check-sat b_and!29575 (not b_next!18153))
(get-model)

(assert (=> d!114609 d!114607))

(declare-fun d!114611 () Bool)

(assert (=> d!114611 (arrayContainsKey!0 (_keys!10622 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114611 true))

(declare-fun _$60!439 () Unit!31910)

(assert (=> d!114611 (= (choose!13 (_keys!10622 thiss!1141) key!756 (index!38796 lt!426405)) _$60!439)))

(declare-fun bs!26616 () Bool)

(assert (= bs!26616 d!114611))

(assert (=> bs!26616 m!880041))

(assert (=> d!114609 d!114611))

(declare-fun b!946904 () Bool)

(declare-fun e!532871 () SeekEntryResult!9106)

(assert (=> b!946904 (= e!532871 (Found!9106 (index!38797 lt!426422)))))

(declare-fun b!946905 () Bool)

(declare-fun c!98638 () Bool)

(declare-fun lt!426431 () (_ BitVec 64))

(assert (=> b!946905 (= c!98638 (= lt!426431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532872 () SeekEntryResult!9106)

(assert (=> b!946905 (= e!532871 e!532872)))

(declare-fun b!946906 () Bool)

(assert (=> b!946906 (= e!532872 (MissingVacant!9106 (index!38797 lt!426422)))))

(declare-fun b!946908 () Bool)

(declare-fun e!532873 () SeekEntryResult!9106)

(assert (=> b!946908 (= e!532873 e!532871)))

(declare-fun c!98637 () Bool)

(assert (=> b!946908 (= c!98637 (= lt!426431 key!756))))

(declare-fun b!946909 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946909 (= e!532872 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81433 lt!426422) #b00000000000000000000000000000001) (nextIndex!0 (index!38797 lt!426422) (x!81433 lt!426422) (mask!27438 thiss!1141)) (index!38797 lt!426422) key!756 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)))))

(declare-fun lt!426432 () SeekEntryResult!9106)

(declare-fun d!114613 () Bool)

(assert (=> d!114613 (and (or ((_ is Undefined!9106) lt!426432) (not ((_ is Found!9106) lt!426432)) (and (bvsge (index!38796 lt!426432) #b00000000000000000000000000000000) (bvslt (index!38796 lt!426432) (size!28043 (_keys!10622 thiss!1141))))) (or ((_ is Undefined!9106) lt!426432) ((_ is Found!9106) lt!426432) (not ((_ is MissingVacant!9106) lt!426432)) (not (= (index!38798 lt!426432) (index!38797 lt!426422))) (and (bvsge (index!38798 lt!426432) #b00000000000000000000000000000000) (bvslt (index!38798 lt!426432) (size!28043 (_keys!10622 thiss!1141))))) (or ((_ is Undefined!9106) lt!426432) (ite ((_ is Found!9106) lt!426432) (= (select (arr!27571 (_keys!10622 thiss!1141)) (index!38796 lt!426432)) key!756) (and ((_ is MissingVacant!9106) lt!426432) (= (index!38798 lt!426432) (index!38797 lt!426422)) (= (select (arr!27571 (_keys!10622 thiss!1141)) (index!38798 lt!426432)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114613 (= lt!426432 e!532873)))

(declare-fun c!98639 () Bool)

(assert (=> d!114613 (= c!98639 (bvsge (x!81433 lt!426422) #b01111111111111111111111111111110))))

(assert (=> d!114613 (= lt!426431 (select (arr!27571 (_keys!10622 thiss!1141)) (index!38797 lt!426422)))))

(assert (=> d!114613 (validMask!0 (mask!27438 thiss!1141))))

(assert (=> d!114613 (= (seekKeyOrZeroReturnVacant!0 (x!81433 lt!426422) (index!38797 lt!426422) (index!38797 lt!426422) key!756 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)) lt!426432)))

(declare-fun b!946907 () Bool)

(assert (=> b!946907 (= e!532873 Undefined!9106)))

(assert (= (and d!114613 c!98639) b!946907))

(assert (= (and d!114613 (not c!98639)) b!946908))

(assert (= (and b!946908 c!98637) b!946904))

(assert (= (and b!946908 (not c!98637)) b!946905))

(assert (= (and b!946905 c!98638) b!946906))

(assert (= (and b!946905 (not c!98638)) b!946909))

(declare-fun m!880087 () Bool)

(assert (=> b!946909 m!880087))

(assert (=> b!946909 m!880087))

(declare-fun m!880089 () Bool)

(assert (=> b!946909 m!880089))

(declare-fun m!880091 () Bool)

(assert (=> d!114613 m!880091))

(declare-fun m!880093 () Bool)

(assert (=> d!114613 m!880093))

(assert (=> d!114613 m!880077))

(assert (=> d!114613 m!880039))

(assert (=> b!946875 d!114613))

(declare-fun b!946920 () Bool)

(declare-fun res!635577 () Bool)

(declare-fun e!532876 () Bool)

(assert (=> b!946920 (=> (not res!635577) (not e!532876))))

(declare-fun size!28046 (LongMapFixedSize!4848) (_ BitVec 32))

(assert (=> b!946920 (= res!635577 (= (size!28046 thiss!1141) (bvadd (_size!2479 thiss!1141) (bvsdiv (bvadd (extraKeys!5453 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!946921 () Bool)

(assert (=> b!946921 (= e!532876 (and (bvsge (extraKeys!5453 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5453 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2479 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114615 () Bool)

(declare-fun res!635578 () Bool)

(assert (=> d!114615 (=> (not res!635578) (not e!532876))))

(assert (=> d!114615 (= res!635578 (validMask!0 (mask!27438 thiss!1141)))))

(assert (=> d!114615 (= (simpleValid!360 thiss!1141) e!532876)))

(declare-fun b!946919 () Bool)

(declare-fun res!635576 () Bool)

(assert (=> b!946919 (=> (not res!635576) (not e!532876))))

(assert (=> b!946919 (= res!635576 (bvsge (size!28046 thiss!1141) (_size!2479 thiss!1141)))))

(declare-fun b!946918 () Bool)

(declare-fun res!635575 () Bool)

(assert (=> b!946918 (=> (not res!635575) (not e!532876))))

(assert (=> b!946918 (= res!635575 (and (= (size!28042 (_values!5744 thiss!1141)) (bvadd (mask!27438 thiss!1141) #b00000000000000000000000000000001)) (= (size!28043 (_keys!10622 thiss!1141)) (size!28042 (_values!5744 thiss!1141))) (bvsge (_size!2479 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2479 thiss!1141) (bvadd (mask!27438 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114615 res!635578) b!946918))

(assert (= (and b!946918 res!635575) b!946919))

(assert (= (and b!946919 res!635576) b!946920))

(assert (= (and b!946920 res!635577) b!946921))

(declare-fun m!880095 () Bool)

(assert (=> b!946920 m!880095))

(assert (=> d!114615 m!880039))

(assert (=> b!946919 m!880095))

(assert (=> d!114597 d!114615))

(declare-fun d!114617 () Bool)

(declare-fun res!635579 () Bool)

(declare-fun e!532877 () Bool)

(assert (=> d!114617 (=> res!635579 e!532877)))

(assert (=> d!114617 (= res!635579 (= (select (arr!27571 (_keys!10622 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114617 (= (arrayContainsKey!0 (_keys!10622 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!532877)))

(declare-fun b!946922 () Bool)

(declare-fun e!532878 () Bool)

(assert (=> b!946922 (= e!532877 e!532878)))

(declare-fun res!635580 () Bool)

(assert (=> b!946922 (=> (not res!635580) (not e!532878))))

(assert (=> b!946922 (= res!635580 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28043 (_keys!10622 thiss!1141))))))

(declare-fun b!946923 () Bool)

(assert (=> b!946923 (= e!532878 (arrayContainsKey!0 (_keys!10622 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114617 (not res!635579)) b!946922))

(assert (= (and b!946922 res!635580) b!946923))

(declare-fun m!880097 () Bool)

(assert (=> d!114617 m!880097))

(declare-fun m!880099 () Bool)

(assert (=> b!946923 m!880099))

(assert (=> b!946883 d!114617))

(declare-fun b!946934 () Bool)

(declare-fun e!532890 () Bool)

(declare-fun call!41097 () Bool)

(assert (=> b!946934 (= e!532890 call!41097)))

(declare-fun b!946935 () Bool)

(declare-fun e!532889 () Bool)

(declare-fun e!532888 () Bool)

(assert (=> b!946935 (= e!532889 e!532888)))

(declare-fun res!635589 () Bool)

(assert (=> b!946935 (=> (not res!635589) (not e!532888))))

(declare-fun e!532887 () Bool)

(assert (=> b!946935 (= res!635589 (not e!532887))))

(declare-fun res!635588 () Bool)

(assert (=> b!946935 (=> (not res!635588) (not e!532887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946935 (= res!635588 (validKeyInArray!0 (select (arr!27571 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946936 () Bool)

(assert (=> b!946936 (= e!532888 e!532890)))

(declare-fun c!98642 () Bool)

(assert (=> b!946936 (= c!98642 (validKeyInArray!0 (select (arr!27571 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946937 () Bool)

(declare-fun contains!5197 (List!19300 (_ BitVec 64)) Bool)

(assert (=> b!946937 (= e!532887 (contains!5197 Nil!19297 (select (arr!27571 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946938 () Bool)

(assert (=> b!946938 (= e!532890 call!41097)))

(declare-fun d!114619 () Bool)

(declare-fun res!635587 () Bool)

(assert (=> d!114619 (=> res!635587 e!532889)))

(assert (=> d!114619 (= res!635587 (bvsge #b00000000000000000000000000000000 (size!28043 (_keys!10622 thiss!1141))))))

(assert (=> d!114619 (= (arrayNoDuplicates!0 (_keys!10622 thiss!1141) #b00000000000000000000000000000000 Nil!19297) e!532889)))

(declare-fun bm!41094 () Bool)

(assert (=> bm!41094 (= call!41097 (arrayNoDuplicates!0 (_keys!10622 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98642 (Cons!19296 (select (arr!27571 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000) Nil!19297) Nil!19297)))))

(assert (= (and d!114619 (not res!635587)) b!946935))

(assert (= (and b!946935 res!635588) b!946937))

(assert (= (and b!946935 res!635589) b!946936))

(assert (= (and b!946936 c!98642) b!946938))

(assert (= (and b!946936 (not c!98642)) b!946934))

(assert (= (or b!946938 b!946934) bm!41094))

(assert (=> b!946935 m!880079))

(assert (=> b!946935 m!880079))

(declare-fun m!880101 () Bool)

(assert (=> b!946935 m!880101))

(assert (=> b!946936 m!880079))

(assert (=> b!946936 m!880079))

(assert (=> b!946936 m!880101))

(assert (=> b!946937 m!880079))

(assert (=> b!946937 m!880079))

(declare-fun m!880103 () Bool)

(assert (=> b!946937 m!880103))

(assert (=> bm!41094 m!880079))

(declare-fun m!880105 () Bool)

(assert (=> bm!41094 m!880105))

(assert (=> b!946859 d!114619))

(declare-fun d!114621 () Bool)

(declare-fun res!635594 () Bool)

(declare-fun e!532899 () Bool)

(assert (=> d!114621 (=> res!635594 e!532899)))

(assert (=> d!114621 (= res!635594 (bvsge #b00000000000000000000000000000000 (size!28043 (_keys!10622 thiss!1141))))))

(assert (=> d!114621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)) e!532899)))

(declare-fun b!946947 () Bool)

(declare-fun e!532898 () Bool)

(declare-fun call!41100 () Bool)

(assert (=> b!946947 (= e!532898 call!41100)))

(declare-fun bm!41097 () Bool)

(assert (=> bm!41097 (= call!41100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10622 thiss!1141) (mask!27438 thiss!1141)))))

(declare-fun b!946948 () Bool)

(declare-fun e!532897 () Bool)

(assert (=> b!946948 (= e!532897 call!41100)))

(declare-fun b!946949 () Bool)

(assert (=> b!946949 (= e!532899 e!532897)))

(declare-fun c!98645 () Bool)

(assert (=> b!946949 (= c!98645 (validKeyInArray!0 (select (arr!27571 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946950 () Bool)

(assert (=> b!946950 (= e!532897 e!532898)))

(declare-fun lt!426439 () (_ BitVec 64))

(assert (=> b!946950 (= lt!426439 (select (arr!27571 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426440 () Unit!31910)

(assert (=> b!946950 (= lt!426440 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10622 thiss!1141) lt!426439 #b00000000000000000000000000000000))))

(assert (=> b!946950 (arrayContainsKey!0 (_keys!10622 thiss!1141) lt!426439 #b00000000000000000000000000000000)))

(declare-fun lt!426441 () Unit!31910)

(assert (=> b!946950 (= lt!426441 lt!426440)))

(declare-fun res!635595 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57314 (_ BitVec 32)) SeekEntryResult!9106)

(assert (=> b!946950 (= res!635595 (= (seekEntryOrOpen!0 (select (arr!27571 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000) (_keys!10622 thiss!1141) (mask!27438 thiss!1141)) (Found!9106 #b00000000000000000000000000000000)))))

(assert (=> b!946950 (=> (not res!635595) (not e!532898))))

(assert (= (and d!114621 (not res!635594)) b!946949))

(assert (= (and b!946949 c!98645) b!946950))

(assert (= (and b!946949 (not c!98645)) b!946948))

(assert (= (and b!946950 res!635595) b!946947))

(assert (= (or b!946947 b!946948) bm!41097))

(declare-fun m!880107 () Bool)

(assert (=> bm!41097 m!880107))

(assert (=> b!946949 m!880079))

(assert (=> b!946949 m!880079))

(assert (=> b!946949 m!880101))

(assert (=> b!946950 m!880079))

(declare-fun m!880109 () Bool)

(assert (=> b!946950 m!880109))

(declare-fun m!880111 () Bool)

(assert (=> b!946950 m!880111))

(assert (=> b!946950 m!880079))

(declare-fun m!880113 () Bool)

(assert (=> b!946950 m!880113))

(assert (=> b!946858 d!114621))

(declare-fun b!946970 () Bool)

(declare-fun e!532911 () SeekEntryResult!9106)

(assert (=> b!946970 (= e!532911 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27438 thiss!1141)) #b00000000000000000000000000000000 (mask!27438 thiss!1141)) key!756 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)))))

(declare-fun b!946971 () Bool)

(declare-fun e!532910 () SeekEntryResult!9106)

(assert (=> b!946971 (= e!532910 (Intermediate!9106 true (toIndex!0 key!756 (mask!27438 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946972 () Bool)

(declare-fun lt!426446 () SeekEntryResult!9106)

(assert (=> b!946972 (and (bvsge (index!38797 lt!426446) #b00000000000000000000000000000000) (bvslt (index!38797 lt!426446) (size!28043 (_keys!10622 thiss!1141))))))

(declare-fun res!635604 () Bool)

(assert (=> b!946972 (= res!635604 (= (select (arr!27571 (_keys!10622 thiss!1141)) (index!38797 lt!426446)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532913 () Bool)

(assert (=> b!946972 (=> res!635604 e!532913)))

(declare-fun b!946973 () Bool)

(declare-fun e!532914 () Bool)

(declare-fun e!532912 () Bool)

(assert (=> b!946973 (= e!532914 e!532912)))

(declare-fun res!635603 () Bool)

(assert (=> b!946973 (= res!635603 (and ((_ is Intermediate!9106) lt!426446) (not (undefined!9918 lt!426446)) (bvslt (x!81433 lt!426446) #b01111111111111111111111111111110) (bvsge (x!81433 lt!426446) #b00000000000000000000000000000000) (bvsge (x!81433 lt!426446) #b00000000000000000000000000000000)))))

(assert (=> b!946973 (=> (not res!635603) (not e!532912))))

(declare-fun b!946969 () Bool)

(assert (=> b!946969 (and (bvsge (index!38797 lt!426446) #b00000000000000000000000000000000) (bvslt (index!38797 lt!426446) (size!28043 (_keys!10622 thiss!1141))))))

(assert (=> b!946969 (= e!532913 (= (select (arr!27571 (_keys!10622 thiss!1141)) (index!38797 lt!426446)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!114623 () Bool)

(assert (=> d!114623 e!532914))

(declare-fun c!98653 () Bool)

(assert (=> d!114623 (= c!98653 (and ((_ is Intermediate!9106) lt!426446) (undefined!9918 lt!426446)))))

(assert (=> d!114623 (= lt!426446 e!532910)))

(declare-fun c!98652 () Bool)

(assert (=> d!114623 (= c!98652 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!426447 () (_ BitVec 64))

(assert (=> d!114623 (= lt!426447 (select (arr!27571 (_keys!10622 thiss!1141)) (toIndex!0 key!756 (mask!27438 thiss!1141))))))

(assert (=> d!114623 (validMask!0 (mask!27438 thiss!1141))))

(assert (=> d!114623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27438 thiss!1141)) key!756 (_keys!10622 thiss!1141) (mask!27438 thiss!1141)) lt!426446)))

(declare-fun b!946974 () Bool)

(assert (=> b!946974 (= e!532914 (bvsge (x!81433 lt!426446) #b01111111111111111111111111111110))))

(declare-fun b!946975 () Bool)

(assert (=> b!946975 (= e!532911 (Intermediate!9106 false (toIndex!0 key!756 (mask!27438 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946976 () Bool)

(assert (=> b!946976 (= e!532910 e!532911)))

(declare-fun c!98654 () Bool)

(assert (=> b!946976 (= c!98654 (or (= lt!426447 key!756) (= (bvadd lt!426447 lt!426447) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!946977 () Bool)

(assert (=> b!946977 (and (bvsge (index!38797 lt!426446) #b00000000000000000000000000000000) (bvslt (index!38797 lt!426446) (size!28043 (_keys!10622 thiss!1141))))))

(declare-fun res!635602 () Bool)

(assert (=> b!946977 (= res!635602 (= (select (arr!27571 (_keys!10622 thiss!1141)) (index!38797 lt!426446)) key!756))))

(assert (=> b!946977 (=> res!635602 e!532913)))

(assert (=> b!946977 (= e!532912 e!532913)))

(assert (= (and d!114623 c!98652) b!946971))

(assert (= (and d!114623 (not c!98652)) b!946976))

(assert (= (and b!946976 c!98654) b!946975))

(assert (= (and b!946976 (not c!98654)) b!946970))

(assert (= (and d!114623 c!98653) b!946974))

(assert (= (and d!114623 (not c!98653)) b!946973))

(assert (= (and b!946973 res!635603) b!946977))

(assert (= (and b!946977 (not res!635602)) b!946972))

(assert (= (and b!946972 (not res!635604)) b!946969))

(declare-fun m!880115 () Bool)

(assert (=> b!946977 m!880115))

(assert (=> b!946969 m!880115))

(assert (=> b!946970 m!880073))

(declare-fun m!880117 () Bool)

(assert (=> b!946970 m!880117))

(assert (=> b!946970 m!880117))

(declare-fun m!880119 () Bool)

(assert (=> b!946970 m!880119))

(assert (=> b!946972 m!880115))

(assert (=> d!114623 m!880073))

(declare-fun m!880121 () Bool)

(assert (=> d!114623 m!880121))

(assert (=> d!114623 m!880039))

(assert (=> d!114603 d!114623))

(declare-fun d!114625 () Bool)

(declare-fun lt!426453 () (_ BitVec 32))

(declare-fun lt!426452 () (_ BitVec 32))

(assert (=> d!114625 (= lt!426453 (bvmul (bvxor lt!426452 (bvlshr lt!426452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114625 (= lt!426452 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114625 (and (bvsge (mask!27438 thiss!1141) #b00000000000000000000000000000000) (let ((res!635605 (let ((h!20452 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81450 (bvmul (bvxor h!20452 (bvlshr h!20452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81450 (bvlshr x!81450 #b00000000000000000000000000001101)) (mask!27438 thiss!1141)))))) (and (bvslt res!635605 (bvadd (mask!27438 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635605 #b00000000000000000000000000000000))))))

(assert (=> d!114625 (= (toIndex!0 key!756 (mask!27438 thiss!1141)) (bvand (bvxor lt!426453 (bvlshr lt!426453 #b00000000000000000000000000001101)) (mask!27438 thiss!1141)))))

(assert (=> d!114603 d!114625))

(assert (=> d!114603 d!114605))

(declare-fun b!946987 () Bool)

(declare-fun e!532919 () (_ BitVec 32))

(declare-fun call!41103 () (_ BitVec 32))

(assert (=> b!946987 (= e!532919 (bvadd #b00000000000000000000000000000001 call!41103))))

(declare-fun bm!41100 () Bool)

(assert (=> bm!41100 (= call!41103 (arrayCountValidKeys!0 (_keys!10622 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28043 (_keys!10622 thiss!1141))))))

(declare-fun b!946988 () Bool)

(declare-fun e!532920 () (_ BitVec 32))

(assert (=> b!946988 (= e!532920 #b00000000000000000000000000000000)))

(declare-fun b!946989 () Bool)

(assert (=> b!946989 (= e!532920 e!532919)))

(declare-fun c!98659 () Bool)

(assert (=> b!946989 (= c!98659 (validKeyInArray!0 (select (arr!27571 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114627 () Bool)

(declare-fun lt!426456 () (_ BitVec 32))

(assert (=> d!114627 (and (bvsge lt!426456 #b00000000000000000000000000000000) (bvsle lt!426456 (bvsub (size!28043 (_keys!10622 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114627 (= lt!426456 e!532920)))

(declare-fun c!98660 () Bool)

(assert (=> d!114627 (= c!98660 (bvsge #b00000000000000000000000000000000 (size!28043 (_keys!10622 thiss!1141))))))

(assert (=> d!114627 (and (bvsle #b00000000000000000000000000000000 (size!28043 (_keys!10622 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28043 (_keys!10622 thiss!1141)) (size!28043 (_keys!10622 thiss!1141))))))

(assert (=> d!114627 (= (arrayCountValidKeys!0 (_keys!10622 thiss!1141) #b00000000000000000000000000000000 (size!28043 (_keys!10622 thiss!1141))) lt!426456)))

(declare-fun b!946986 () Bool)

(assert (=> b!946986 (= e!532919 call!41103)))

(assert (= (and d!114627 c!98660) b!946988))

(assert (= (and d!114627 (not c!98660)) b!946989))

(assert (= (and b!946989 c!98659) b!946987))

(assert (= (and b!946989 (not c!98659)) b!946986))

(assert (= (or b!946987 b!946986) bm!41100))

(declare-fun m!880123 () Bool)

(assert (=> bm!41100 m!880123))

(assert (=> b!946989 m!880079))

(assert (=> b!946989 m!880079))

(assert (=> b!946989 m!880101))

(assert (=> b!946857 d!114627))

(declare-fun b!946991 () Bool)

(declare-fun e!532921 () Bool)

(assert (=> b!946991 (= e!532921 tp_is_empty!20661)))

(declare-fun b!946990 () Bool)

(declare-fun e!532922 () Bool)

(assert (=> b!946990 (= e!532922 tp_is_empty!20661)))

(declare-fun mapIsEmpty!32863 () Bool)

(declare-fun mapRes!32863 () Bool)

(assert (=> mapIsEmpty!32863 mapRes!32863))

(declare-fun mapNonEmpty!32863 () Bool)

(declare-fun tp!63018 () Bool)

(assert (=> mapNonEmpty!32863 (= mapRes!32863 (and tp!63018 e!532922))))

(declare-fun mapKey!32863 () (_ BitVec 32))

(declare-fun mapRest!32863 () (Array (_ BitVec 32) ValueCell!9849))

(declare-fun mapValue!32863 () ValueCell!9849)

(assert (=> mapNonEmpty!32863 (= mapRest!32862 (store mapRest!32863 mapKey!32863 mapValue!32863))))

(declare-fun condMapEmpty!32863 () Bool)

(declare-fun mapDefault!32863 () ValueCell!9849)

(assert (=> mapNonEmpty!32862 (= condMapEmpty!32863 (= mapRest!32862 ((as const (Array (_ BitVec 32) ValueCell!9849)) mapDefault!32863)))))

(assert (=> mapNonEmpty!32862 (= tp!63017 (and e!532921 mapRes!32863))))

(assert (= (and mapNonEmpty!32862 condMapEmpty!32863) mapIsEmpty!32863))

(assert (= (and mapNonEmpty!32862 (not condMapEmpty!32863)) mapNonEmpty!32863))

(assert (= (and mapNonEmpty!32863 ((_ is ValueCellFull!9849) mapValue!32863)) b!946990))

(assert (= (and mapNonEmpty!32862 ((_ is ValueCellFull!9849) mapDefault!32863)) b!946991))

(declare-fun m!880125 () Bool)

(assert (=> mapNonEmpty!32863 m!880125))

(check-sat (not b!946919) (not d!114611) (not b!946937) (not b!946920) (not b!946970) tp_is_empty!20661 (not b!946923) (not b!946989) (not mapNonEmpty!32863) (not b!946909) b_and!29575 (not bm!41100) (not d!114615) (not b!946936) (not b!946949) (not bm!41094) (not bm!41097) (not d!114613) (not d!114623) (not b!946935) (not b!946950) (not b_next!18153))
(check-sat b_and!29575 (not b_next!18153))
