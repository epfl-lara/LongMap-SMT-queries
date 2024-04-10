; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16326 () Bool)

(assert start!16326)

(declare-fun b!162870 () Bool)

(declare-fun b_free!3777 () Bool)

(declare-fun b_next!3777 () Bool)

(assert (=> b!162870 (= b_free!3777 (not b_next!3777))))

(declare-fun tp!13904 () Bool)

(declare-fun b_and!10191 () Bool)

(assert (=> b!162870 (= tp!13904 b_and!10191)))

(declare-fun mapNonEmpty!6059 () Bool)

(declare-fun mapRes!6059 () Bool)

(declare-fun tp!13903 () Bool)

(declare-fun e!106848 () Bool)

(assert (=> mapNonEmpty!6059 (= mapRes!6059 (and tp!13903 e!106848))))

(declare-datatypes ((V!4419 0))(
  ( (V!4420 (val!1834 Int)) )
))
(declare-datatypes ((ValueCell!1446 0))(
  ( (ValueCellFull!1446 (v!3699 V!4419)) (EmptyCell!1446) )
))
(declare-fun mapRest!6059 () (Array (_ BitVec 32) ValueCell!1446))

(declare-fun mapValue!6059 () ValueCell!1446)

(declare-fun mapKey!6059 () (_ BitVec 32))

(declare-datatypes ((array!6239 0))(
  ( (array!6240 (arr!2963 (Array (_ BitVec 32) (_ BitVec 64))) (size!3247 (_ BitVec 32))) )
))
(declare-datatypes ((array!6241 0))(
  ( (array!6242 (arr!2964 (Array (_ BitVec 32) ValueCell!1446)) (size!3248 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1800 0))(
  ( (LongMapFixedSize!1801 (defaultEntry!3342 Int) (mask!7978 (_ BitVec 32)) (extraKeys!3083 (_ BitVec 32)) (zeroValue!3185 V!4419) (minValue!3185 V!4419) (_size!949 (_ BitVec 32)) (_keys!5144 array!6239) (_values!3325 array!6241) (_vacant!949 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1800)

(assert (=> mapNonEmpty!6059 (= (arr!2964 (_values!3325 thiss!1248)) (store mapRest!6059 mapKey!6059 mapValue!6059))))

(declare-fun b!162867 () Bool)

(declare-fun res!77121 () Bool)

(declare-fun e!106842 () Bool)

(assert (=> b!162867 (=> (not res!77121) (not e!106842))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162867 (= res!77121 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162868 () Bool)

(declare-fun e!106843 () Bool)

(declare-fun e!106844 () Bool)

(assert (=> b!162868 (= e!106843 (and e!106844 mapRes!6059))))

(declare-fun condMapEmpty!6059 () Bool)

(declare-fun mapDefault!6059 () ValueCell!1446)

(assert (=> b!162868 (= condMapEmpty!6059 (= (arr!2964 (_values!3325 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1446)) mapDefault!6059)))))

(declare-fun b!162869 () Bool)

(declare-fun e!106846 () Bool)

(assert (=> b!162869 (= e!106842 e!106846)))

(declare-fun res!77122 () Bool)

(assert (=> b!162869 (=> (not res!77122) (not e!106846))))

(declare-datatypes ((SeekEntryResult!393 0))(
  ( (MissingZero!393 (index!3740 (_ BitVec 32))) (Found!393 (index!3741 (_ BitVec 32))) (Intermediate!393 (undefined!1205 Bool) (index!3742 (_ BitVec 32)) (x!18033 (_ BitVec 32))) (Undefined!393) (MissingVacant!393 (index!3743 (_ BitVec 32))) )
))
(declare-fun lt!82558 () SeekEntryResult!393)

(get-info :version)

(assert (=> b!162869 (= res!77122 (and (not ((_ is Undefined!393) lt!82558)) (not ((_ is MissingVacant!393) lt!82558)) (not ((_ is MissingZero!393) lt!82558)) ((_ is Found!393) lt!82558)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6239 (_ BitVec 32)) SeekEntryResult!393)

(assert (=> b!162869 (= lt!82558 (seekEntryOrOpen!0 key!828 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)))))

(declare-fun tp_is_empty!3579 () Bool)

(declare-fun e!106845 () Bool)

(declare-fun array_inv!1893 (array!6239) Bool)

(declare-fun array_inv!1894 (array!6241) Bool)

(assert (=> b!162870 (= e!106845 (and tp!13904 tp_is_empty!3579 (array_inv!1893 (_keys!5144 thiss!1248)) (array_inv!1894 (_values!3325 thiss!1248)) e!106843))))

(declare-fun b!162871 () Bool)

(assert (=> b!162871 (= e!106846 (not (= (size!3248 (_values!3325 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7978 thiss!1248)))))))

(declare-fun b!162872 () Bool)

(assert (=> b!162872 (= e!106844 tp_is_empty!3579)))

(declare-fun b!162866 () Bool)

(assert (=> b!162866 (= e!106848 tp_is_empty!3579)))

(declare-fun res!77120 () Bool)

(assert (=> start!16326 (=> (not res!77120) (not e!106842))))

(declare-fun valid!809 (LongMapFixedSize!1800) Bool)

(assert (=> start!16326 (= res!77120 (valid!809 thiss!1248))))

(assert (=> start!16326 e!106842))

(assert (=> start!16326 e!106845))

(assert (=> start!16326 true))

(declare-fun mapIsEmpty!6059 () Bool)

(assert (=> mapIsEmpty!6059 mapRes!6059))

(declare-fun b!162873 () Bool)

(declare-fun res!77123 () Bool)

(assert (=> b!162873 (=> (not res!77123) (not e!106846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!162873 (= res!77123 (validMask!0 (mask!7978 thiss!1248)))))

(assert (= (and start!16326 res!77120) b!162867))

(assert (= (and b!162867 res!77121) b!162869))

(assert (= (and b!162869 res!77122) b!162873))

(assert (= (and b!162873 res!77123) b!162871))

(assert (= (and b!162868 condMapEmpty!6059) mapIsEmpty!6059))

(assert (= (and b!162868 (not condMapEmpty!6059)) mapNonEmpty!6059))

(assert (= (and mapNonEmpty!6059 ((_ is ValueCellFull!1446) mapValue!6059)) b!162866))

(assert (= (and b!162868 ((_ is ValueCellFull!1446) mapDefault!6059)) b!162872))

(assert (= b!162870 b!162868))

(assert (= start!16326 b!162870))

(declare-fun m!193827 () Bool)

(assert (=> start!16326 m!193827))

(declare-fun m!193829 () Bool)

(assert (=> mapNonEmpty!6059 m!193829))

(declare-fun m!193831 () Bool)

(assert (=> b!162870 m!193831))

(declare-fun m!193833 () Bool)

(assert (=> b!162870 m!193833))

(declare-fun m!193835 () Bool)

(assert (=> b!162869 m!193835))

(declare-fun m!193837 () Bool)

(assert (=> b!162873 m!193837))

(check-sat tp_is_empty!3579 b_and!10191 (not b!162869) (not b_next!3777) (not b!162873) (not b!162870) (not start!16326) (not mapNonEmpty!6059))
(check-sat b_and!10191 (not b_next!3777))
(get-model)

(declare-fun d!51369 () Bool)

(declare-fun res!77142 () Bool)

(declare-fun e!106872 () Bool)

(assert (=> d!51369 (=> (not res!77142) (not e!106872))))

(declare-fun simpleValid!119 (LongMapFixedSize!1800) Bool)

(assert (=> d!51369 (= res!77142 (simpleValid!119 thiss!1248))))

(assert (=> d!51369 (= (valid!809 thiss!1248) e!106872)))

(declare-fun b!162904 () Bool)

(declare-fun res!77143 () Bool)

(assert (=> b!162904 (=> (not res!77143) (not e!106872))))

(declare-fun arrayCountValidKeys!0 (array!6239 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!162904 (= res!77143 (= (arrayCountValidKeys!0 (_keys!5144 thiss!1248) #b00000000000000000000000000000000 (size!3247 (_keys!5144 thiss!1248))) (_size!949 thiss!1248)))))

(declare-fun b!162905 () Bool)

(declare-fun res!77144 () Bool)

(assert (=> b!162905 (=> (not res!77144) (not e!106872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6239 (_ BitVec 32)) Bool)

(assert (=> b!162905 (= res!77144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)))))

(declare-fun b!162906 () Bool)

(declare-datatypes ((List!1988 0))(
  ( (Nil!1985) (Cons!1984 (h!2597 (_ BitVec 64)) (t!6790 List!1988)) )
))
(declare-fun arrayNoDuplicates!0 (array!6239 (_ BitVec 32) List!1988) Bool)

(assert (=> b!162906 (= e!106872 (arrayNoDuplicates!0 (_keys!5144 thiss!1248) #b00000000000000000000000000000000 Nil!1985))))

(assert (= (and d!51369 res!77142) b!162904))

(assert (= (and b!162904 res!77143) b!162905))

(assert (= (and b!162905 res!77144) b!162906))

(declare-fun m!193851 () Bool)

(assert (=> d!51369 m!193851))

(declare-fun m!193853 () Bool)

(assert (=> b!162904 m!193853))

(declare-fun m!193855 () Bool)

(assert (=> b!162905 m!193855))

(declare-fun m!193857 () Bool)

(assert (=> b!162906 m!193857))

(assert (=> start!16326 d!51369))

(declare-fun b!162919 () Bool)

(declare-fun e!106880 () SeekEntryResult!393)

(declare-fun e!106881 () SeekEntryResult!393)

(assert (=> b!162919 (= e!106880 e!106881)))

(declare-fun lt!82568 () (_ BitVec 64))

(declare-fun lt!82569 () SeekEntryResult!393)

(assert (=> b!162919 (= lt!82568 (select (arr!2963 (_keys!5144 thiss!1248)) (index!3742 lt!82569)))))

(declare-fun c!29994 () Bool)

(assert (=> b!162919 (= c!29994 (= lt!82568 key!828))))

(declare-fun b!162920 () Bool)

(assert (=> b!162920 (= e!106880 Undefined!393)))

(declare-fun d!51371 () Bool)

(declare-fun lt!82570 () SeekEntryResult!393)

(assert (=> d!51371 (and (or ((_ is Undefined!393) lt!82570) (not ((_ is Found!393) lt!82570)) (and (bvsge (index!3741 lt!82570) #b00000000000000000000000000000000) (bvslt (index!3741 lt!82570) (size!3247 (_keys!5144 thiss!1248))))) (or ((_ is Undefined!393) lt!82570) ((_ is Found!393) lt!82570) (not ((_ is MissingZero!393) lt!82570)) (and (bvsge (index!3740 lt!82570) #b00000000000000000000000000000000) (bvslt (index!3740 lt!82570) (size!3247 (_keys!5144 thiss!1248))))) (or ((_ is Undefined!393) lt!82570) ((_ is Found!393) lt!82570) ((_ is MissingZero!393) lt!82570) (not ((_ is MissingVacant!393) lt!82570)) (and (bvsge (index!3743 lt!82570) #b00000000000000000000000000000000) (bvslt (index!3743 lt!82570) (size!3247 (_keys!5144 thiss!1248))))) (or ((_ is Undefined!393) lt!82570) (ite ((_ is Found!393) lt!82570) (= (select (arr!2963 (_keys!5144 thiss!1248)) (index!3741 lt!82570)) key!828) (ite ((_ is MissingZero!393) lt!82570) (= (select (arr!2963 (_keys!5144 thiss!1248)) (index!3740 lt!82570)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!393) lt!82570) (= (select (arr!2963 (_keys!5144 thiss!1248)) (index!3743 lt!82570)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51371 (= lt!82570 e!106880)))

(declare-fun c!29995 () Bool)

(assert (=> d!51371 (= c!29995 (and ((_ is Intermediate!393) lt!82569) (undefined!1205 lt!82569)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6239 (_ BitVec 32)) SeekEntryResult!393)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51371 (= lt!82569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7978 thiss!1248)) key!828 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)))))

(assert (=> d!51371 (validMask!0 (mask!7978 thiss!1248))))

(assert (=> d!51371 (= (seekEntryOrOpen!0 key!828 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)) lt!82570)))

(declare-fun b!162921 () Bool)

(declare-fun e!106879 () SeekEntryResult!393)

(assert (=> b!162921 (= e!106879 (MissingZero!393 (index!3742 lt!82569)))))

(declare-fun b!162922 () Bool)

(declare-fun c!29993 () Bool)

(assert (=> b!162922 (= c!29993 (= lt!82568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!162922 (= e!106881 e!106879)))

(declare-fun b!162923 () Bool)

(assert (=> b!162923 (= e!106881 (Found!393 (index!3742 lt!82569)))))

(declare-fun b!162924 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6239 (_ BitVec 32)) SeekEntryResult!393)

(assert (=> b!162924 (= e!106879 (seekKeyOrZeroReturnVacant!0 (x!18033 lt!82569) (index!3742 lt!82569) (index!3742 lt!82569) key!828 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)))))

(assert (= (and d!51371 c!29995) b!162920))

(assert (= (and d!51371 (not c!29995)) b!162919))

(assert (= (and b!162919 c!29994) b!162923))

(assert (= (and b!162919 (not c!29994)) b!162922))

(assert (= (and b!162922 c!29993) b!162921))

(assert (= (and b!162922 (not c!29993)) b!162924))

(declare-fun m!193859 () Bool)

(assert (=> b!162919 m!193859))

(declare-fun m!193861 () Bool)

(assert (=> d!51371 m!193861))

(assert (=> d!51371 m!193837))

(declare-fun m!193863 () Bool)

(assert (=> d!51371 m!193863))

(declare-fun m!193865 () Bool)

(assert (=> d!51371 m!193865))

(assert (=> d!51371 m!193863))

(declare-fun m!193867 () Bool)

(assert (=> d!51371 m!193867))

(declare-fun m!193869 () Bool)

(assert (=> d!51371 m!193869))

(declare-fun m!193871 () Bool)

(assert (=> b!162924 m!193871))

(assert (=> b!162869 d!51371))

(declare-fun d!51373 () Bool)

(assert (=> d!51373 (= (array_inv!1893 (_keys!5144 thiss!1248)) (bvsge (size!3247 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162870 d!51373))

(declare-fun d!51375 () Bool)

(assert (=> d!51375 (= (array_inv!1894 (_values!3325 thiss!1248)) (bvsge (size!3248 (_values!3325 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!162870 d!51375))

(declare-fun d!51377 () Bool)

(assert (=> d!51377 (= (validMask!0 (mask!7978 thiss!1248)) (and (or (= (mask!7978 thiss!1248) #b00000000000000000000000000000111) (= (mask!7978 thiss!1248) #b00000000000000000000000000001111) (= (mask!7978 thiss!1248) #b00000000000000000000000000011111) (= (mask!7978 thiss!1248) #b00000000000000000000000000111111) (= (mask!7978 thiss!1248) #b00000000000000000000000001111111) (= (mask!7978 thiss!1248) #b00000000000000000000000011111111) (= (mask!7978 thiss!1248) #b00000000000000000000000111111111) (= (mask!7978 thiss!1248) #b00000000000000000000001111111111) (= (mask!7978 thiss!1248) #b00000000000000000000011111111111) (= (mask!7978 thiss!1248) #b00000000000000000000111111111111) (= (mask!7978 thiss!1248) #b00000000000000000001111111111111) (= (mask!7978 thiss!1248) #b00000000000000000011111111111111) (= (mask!7978 thiss!1248) #b00000000000000000111111111111111) (= (mask!7978 thiss!1248) #b00000000000000001111111111111111) (= (mask!7978 thiss!1248) #b00000000000000011111111111111111) (= (mask!7978 thiss!1248) #b00000000000000111111111111111111) (= (mask!7978 thiss!1248) #b00000000000001111111111111111111) (= (mask!7978 thiss!1248) #b00000000000011111111111111111111) (= (mask!7978 thiss!1248) #b00000000000111111111111111111111) (= (mask!7978 thiss!1248) #b00000000001111111111111111111111) (= (mask!7978 thiss!1248) #b00000000011111111111111111111111) (= (mask!7978 thiss!1248) #b00000000111111111111111111111111) (= (mask!7978 thiss!1248) #b00000001111111111111111111111111) (= (mask!7978 thiss!1248) #b00000011111111111111111111111111) (= (mask!7978 thiss!1248) #b00000111111111111111111111111111) (= (mask!7978 thiss!1248) #b00001111111111111111111111111111) (= (mask!7978 thiss!1248) #b00011111111111111111111111111111) (= (mask!7978 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7978 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!162873 d!51377))

(declare-fun b!162932 () Bool)

(declare-fun e!106887 () Bool)

(assert (=> b!162932 (= e!106887 tp_is_empty!3579)))

(declare-fun mapNonEmpty!6065 () Bool)

(declare-fun mapRes!6065 () Bool)

(declare-fun tp!13913 () Bool)

(declare-fun e!106886 () Bool)

(assert (=> mapNonEmpty!6065 (= mapRes!6065 (and tp!13913 e!106886))))

(declare-fun mapValue!6065 () ValueCell!1446)

(declare-fun mapKey!6065 () (_ BitVec 32))

(declare-fun mapRest!6065 () (Array (_ BitVec 32) ValueCell!1446))

(assert (=> mapNonEmpty!6065 (= mapRest!6059 (store mapRest!6065 mapKey!6065 mapValue!6065))))

(declare-fun condMapEmpty!6065 () Bool)

(declare-fun mapDefault!6065 () ValueCell!1446)

(assert (=> mapNonEmpty!6059 (= condMapEmpty!6065 (= mapRest!6059 ((as const (Array (_ BitVec 32) ValueCell!1446)) mapDefault!6065)))))

(assert (=> mapNonEmpty!6059 (= tp!13903 (and e!106887 mapRes!6065))))

(declare-fun mapIsEmpty!6065 () Bool)

(assert (=> mapIsEmpty!6065 mapRes!6065))

(declare-fun b!162931 () Bool)

(assert (=> b!162931 (= e!106886 tp_is_empty!3579)))

(assert (= (and mapNonEmpty!6059 condMapEmpty!6065) mapIsEmpty!6065))

(assert (= (and mapNonEmpty!6059 (not condMapEmpty!6065)) mapNonEmpty!6065))

(assert (= (and mapNonEmpty!6065 ((_ is ValueCellFull!1446) mapValue!6065)) b!162931))

(assert (= (and mapNonEmpty!6059 ((_ is ValueCellFull!1446) mapDefault!6065)) b!162932))

(declare-fun m!193873 () Bool)

(assert (=> mapNonEmpty!6065 m!193873))

(check-sat tp_is_empty!3579 b_and!10191 (not b_next!3777) (not b!162924) (not d!51371) (not d!51369) (not b!162904) (not b!162906) (not mapNonEmpty!6065) (not b!162905))
(check-sat b_and!10191 (not b_next!3777))
(get-model)

(declare-fun b!162951 () Bool)

(declare-fun e!106902 () Bool)

(declare-fun e!106901 () Bool)

(assert (=> b!162951 (= e!106902 e!106901)))

(declare-fun res!77153 () Bool)

(declare-fun lt!82575 () SeekEntryResult!393)

(assert (=> b!162951 (= res!77153 (and ((_ is Intermediate!393) lt!82575) (not (undefined!1205 lt!82575)) (bvslt (x!18033 lt!82575) #b01111111111111111111111111111110) (bvsge (x!18033 lt!82575) #b00000000000000000000000000000000) (bvsge (x!18033 lt!82575) #b00000000000000000000000000000000)))))

(assert (=> b!162951 (=> (not res!77153) (not e!106901))))

(declare-fun b!162952 () Bool)

(assert (=> b!162952 (and (bvsge (index!3742 lt!82575) #b00000000000000000000000000000000) (bvslt (index!3742 lt!82575) (size!3247 (_keys!5144 thiss!1248))))))

(declare-fun res!77152 () Bool)

(assert (=> b!162952 (= res!77152 (= (select (arr!2963 (_keys!5144 thiss!1248)) (index!3742 lt!82575)) key!828))))

(declare-fun e!106900 () Bool)

(assert (=> b!162952 (=> res!77152 e!106900)))

(assert (=> b!162952 (= e!106901 e!106900)))

(declare-fun b!162953 () Bool)

(declare-fun e!106898 () SeekEntryResult!393)

(assert (=> b!162953 (= e!106898 (Intermediate!393 false (toIndex!0 key!828 (mask!7978 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!162954 () Bool)

(declare-fun e!106899 () SeekEntryResult!393)

(assert (=> b!162954 (= e!106899 (Intermediate!393 true (toIndex!0 key!828 (mask!7978 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!162955 () Bool)

(assert (=> b!162955 (= e!106902 (bvsge (x!18033 lt!82575) #b01111111111111111111111111111110))))

(declare-fun d!51379 () Bool)

(assert (=> d!51379 e!106902))

(declare-fun c!30002 () Bool)

(assert (=> d!51379 (= c!30002 (and ((_ is Intermediate!393) lt!82575) (undefined!1205 lt!82575)))))

(assert (=> d!51379 (= lt!82575 e!106899)))

(declare-fun c!30003 () Bool)

(assert (=> d!51379 (= c!30003 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!82576 () (_ BitVec 64))

(assert (=> d!51379 (= lt!82576 (select (arr!2963 (_keys!5144 thiss!1248)) (toIndex!0 key!828 (mask!7978 thiss!1248))))))

(assert (=> d!51379 (validMask!0 (mask!7978 thiss!1248))))

(assert (=> d!51379 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7978 thiss!1248)) key!828 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)) lt!82575)))

(declare-fun b!162956 () Bool)

(assert (=> b!162956 (and (bvsge (index!3742 lt!82575) #b00000000000000000000000000000000) (bvslt (index!3742 lt!82575) (size!3247 (_keys!5144 thiss!1248))))))

(declare-fun res!77151 () Bool)

(assert (=> b!162956 (= res!77151 (= (select (arr!2963 (_keys!5144 thiss!1248)) (index!3742 lt!82575)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!162956 (=> res!77151 e!106900)))

(declare-fun b!162957 () Bool)

(assert (=> b!162957 (= e!106899 e!106898)))

(declare-fun c!30004 () Bool)

(assert (=> b!162957 (= c!30004 (or (= lt!82576 key!828) (= (bvadd lt!82576 lt!82576) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!162958 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!162958 (= e!106898 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7978 thiss!1248)) #b00000000000000000000000000000000 (mask!7978 thiss!1248)) key!828 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)))))

(declare-fun b!162959 () Bool)

(assert (=> b!162959 (and (bvsge (index!3742 lt!82575) #b00000000000000000000000000000000) (bvslt (index!3742 lt!82575) (size!3247 (_keys!5144 thiss!1248))))))

(assert (=> b!162959 (= e!106900 (= (select (arr!2963 (_keys!5144 thiss!1248)) (index!3742 lt!82575)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51379 c!30003) b!162954))

(assert (= (and d!51379 (not c!30003)) b!162957))

(assert (= (and b!162957 c!30004) b!162953))

(assert (= (and b!162957 (not c!30004)) b!162958))

(assert (= (and d!51379 c!30002) b!162955))

(assert (= (and d!51379 (not c!30002)) b!162951))

(assert (= (and b!162951 res!77153) b!162952))

(assert (= (and b!162952 (not res!77152)) b!162956))

(assert (= (and b!162956 (not res!77151)) b!162959))

(declare-fun m!193875 () Bool)

(assert (=> b!162952 m!193875))

(assert (=> b!162958 m!193863))

(declare-fun m!193877 () Bool)

(assert (=> b!162958 m!193877))

(assert (=> b!162958 m!193877))

(declare-fun m!193879 () Bool)

(assert (=> b!162958 m!193879))

(assert (=> b!162956 m!193875))

(assert (=> d!51379 m!193863))

(declare-fun m!193881 () Bool)

(assert (=> d!51379 m!193881))

(assert (=> d!51379 m!193837))

(assert (=> b!162959 m!193875))

(assert (=> d!51371 d!51379))

(declare-fun d!51381 () Bool)

(declare-fun lt!82582 () (_ BitVec 32))

(declare-fun lt!82581 () (_ BitVec 32))

(assert (=> d!51381 (= lt!82582 (bvmul (bvxor lt!82581 (bvlshr lt!82581 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51381 (= lt!82581 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51381 (and (bvsge (mask!7978 thiss!1248) #b00000000000000000000000000000000) (let ((res!77154 (let ((h!2598 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18049 (bvmul (bvxor h!2598 (bvlshr h!2598 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18049 (bvlshr x!18049 #b00000000000000000000000000001101)) (mask!7978 thiss!1248)))))) (and (bvslt res!77154 (bvadd (mask!7978 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77154 #b00000000000000000000000000000000))))))

(assert (=> d!51381 (= (toIndex!0 key!828 (mask!7978 thiss!1248)) (bvand (bvxor lt!82582 (bvlshr lt!82582 #b00000000000000000000000000001101)) (mask!7978 thiss!1248)))))

(assert (=> d!51371 d!51381))

(assert (=> d!51371 d!51377))

(declare-fun b!162970 () Bool)

(declare-fun e!106913 () Bool)

(declare-fun e!106911 () Bool)

(assert (=> b!162970 (= e!106913 e!106911)))

(declare-fun res!77162 () Bool)

(assert (=> b!162970 (=> (not res!77162) (not e!106911))))

(declare-fun e!106914 () Bool)

(assert (=> b!162970 (= res!77162 (not e!106914))))

(declare-fun res!77161 () Bool)

(assert (=> b!162970 (=> (not res!77161) (not e!106914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!162970 (= res!77161 (validKeyInArray!0 (select (arr!2963 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!162971 () Bool)

(declare-fun e!106912 () Bool)

(declare-fun call!17287 () Bool)

(assert (=> b!162971 (= e!106912 call!17287)))

(declare-fun d!51383 () Bool)

(declare-fun res!77163 () Bool)

(assert (=> d!51383 (=> res!77163 e!106913)))

(assert (=> d!51383 (= res!77163 (bvsge #b00000000000000000000000000000000 (size!3247 (_keys!5144 thiss!1248))))))

(assert (=> d!51383 (= (arrayNoDuplicates!0 (_keys!5144 thiss!1248) #b00000000000000000000000000000000 Nil!1985) e!106913)))

(declare-fun b!162972 () Bool)

(assert (=> b!162972 (= e!106911 e!106912)))

(declare-fun c!30007 () Bool)

(assert (=> b!162972 (= c!30007 (validKeyInArray!0 (select (arr!2963 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!162973 () Bool)

(declare-fun contains!1036 (List!1988 (_ BitVec 64)) Bool)

(assert (=> b!162973 (= e!106914 (contains!1036 Nil!1985 (select (arr!2963 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17284 () Bool)

(assert (=> bm!17284 (= call!17287 (arrayNoDuplicates!0 (_keys!5144 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30007 (Cons!1984 (select (arr!2963 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000) Nil!1985) Nil!1985)))))

(declare-fun b!162974 () Bool)

(assert (=> b!162974 (= e!106912 call!17287)))

(assert (= (and d!51383 (not res!77163)) b!162970))

(assert (= (and b!162970 res!77161) b!162973))

(assert (= (and b!162970 res!77162) b!162972))

(assert (= (and b!162972 c!30007) b!162971))

(assert (= (and b!162972 (not c!30007)) b!162974))

(assert (= (or b!162971 b!162974) bm!17284))

(declare-fun m!193883 () Bool)

(assert (=> b!162970 m!193883))

(assert (=> b!162970 m!193883))

(declare-fun m!193885 () Bool)

(assert (=> b!162970 m!193885))

(assert (=> b!162972 m!193883))

(assert (=> b!162972 m!193883))

(assert (=> b!162972 m!193885))

(assert (=> b!162973 m!193883))

(assert (=> b!162973 m!193883))

(declare-fun m!193887 () Bool)

(assert (=> b!162973 m!193887))

(assert (=> bm!17284 m!193883))

(declare-fun m!193889 () Bool)

(assert (=> bm!17284 m!193889))

(assert (=> b!162906 d!51383))

(declare-fun d!51385 () Bool)

(declare-fun lt!82585 () (_ BitVec 32))

(assert (=> d!51385 (and (bvsge lt!82585 #b00000000000000000000000000000000) (bvsle lt!82585 (bvsub (size!3247 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!106920 () (_ BitVec 32))

(assert (=> d!51385 (= lt!82585 e!106920)))

(declare-fun c!30012 () Bool)

(assert (=> d!51385 (= c!30012 (bvsge #b00000000000000000000000000000000 (size!3247 (_keys!5144 thiss!1248))))))

(assert (=> d!51385 (and (bvsle #b00000000000000000000000000000000 (size!3247 (_keys!5144 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3247 (_keys!5144 thiss!1248)) (size!3247 (_keys!5144 thiss!1248))))))

(assert (=> d!51385 (= (arrayCountValidKeys!0 (_keys!5144 thiss!1248) #b00000000000000000000000000000000 (size!3247 (_keys!5144 thiss!1248))) lt!82585)))

(declare-fun b!162983 () Bool)

(assert (=> b!162983 (= e!106920 #b00000000000000000000000000000000)))

(declare-fun b!162984 () Bool)

(declare-fun e!106919 () (_ BitVec 32))

(declare-fun call!17290 () (_ BitVec 32))

(assert (=> b!162984 (= e!106919 (bvadd #b00000000000000000000000000000001 call!17290))))

(declare-fun b!162985 () Bool)

(assert (=> b!162985 (= e!106920 e!106919)))

(declare-fun c!30013 () Bool)

(assert (=> b!162985 (= c!30013 (validKeyInArray!0 (select (arr!2963 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17287 () Bool)

(assert (=> bm!17287 (= call!17290 (arrayCountValidKeys!0 (_keys!5144 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3247 (_keys!5144 thiss!1248))))))

(declare-fun b!162986 () Bool)

(assert (=> b!162986 (= e!106919 call!17290)))

(assert (= (and d!51385 c!30012) b!162983))

(assert (= (and d!51385 (not c!30012)) b!162985))

(assert (= (and b!162985 c!30013) b!162984))

(assert (= (and b!162985 (not c!30013)) b!162986))

(assert (= (or b!162984 b!162986) bm!17287))

(assert (=> b!162985 m!193883))

(assert (=> b!162985 m!193883))

(assert (=> b!162985 m!193885))

(declare-fun m!193891 () Bool)

(assert (=> bm!17287 m!193891))

(assert (=> b!162904 d!51385))

(declare-fun b!162995 () Bool)

(declare-fun e!106929 () Bool)

(declare-fun e!106927 () Bool)

(assert (=> b!162995 (= e!106929 e!106927)))

(declare-fun c!30016 () Bool)

(assert (=> b!162995 (= c!30016 (validKeyInArray!0 (select (arr!2963 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51387 () Bool)

(declare-fun res!77168 () Bool)

(assert (=> d!51387 (=> res!77168 e!106929)))

(assert (=> d!51387 (= res!77168 (bvsge #b00000000000000000000000000000000 (size!3247 (_keys!5144 thiss!1248))))))

(assert (=> d!51387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)) e!106929)))

(declare-fun bm!17290 () Bool)

(declare-fun call!17293 () Bool)

(assert (=> bm!17290 (= call!17293 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5144 thiss!1248) (mask!7978 thiss!1248)))))

(declare-fun b!162996 () Bool)

(declare-fun e!106928 () Bool)

(assert (=> b!162996 (= e!106927 e!106928)))

(declare-fun lt!82592 () (_ BitVec 64))

(assert (=> b!162996 (= lt!82592 (select (arr!2963 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5035 0))(
  ( (Unit!5036) )
))
(declare-fun lt!82594 () Unit!5035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6239 (_ BitVec 64) (_ BitVec 32)) Unit!5035)

(assert (=> b!162996 (= lt!82594 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5144 thiss!1248) lt!82592 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!162996 (arrayContainsKey!0 (_keys!5144 thiss!1248) lt!82592 #b00000000000000000000000000000000)))

(declare-fun lt!82593 () Unit!5035)

(assert (=> b!162996 (= lt!82593 lt!82594)))

(declare-fun res!77169 () Bool)

(assert (=> b!162996 (= res!77169 (= (seekEntryOrOpen!0 (select (arr!2963 (_keys!5144 thiss!1248)) #b00000000000000000000000000000000) (_keys!5144 thiss!1248) (mask!7978 thiss!1248)) (Found!393 #b00000000000000000000000000000000)))))

(assert (=> b!162996 (=> (not res!77169) (not e!106928))))

(declare-fun b!162997 () Bool)

(assert (=> b!162997 (= e!106928 call!17293)))

(declare-fun b!162998 () Bool)

(assert (=> b!162998 (= e!106927 call!17293)))

(assert (= (and d!51387 (not res!77168)) b!162995))

(assert (= (and b!162995 c!30016) b!162996))

(assert (= (and b!162995 (not c!30016)) b!162998))

(assert (= (and b!162996 res!77169) b!162997))

(assert (= (or b!162997 b!162998) bm!17290))

(assert (=> b!162995 m!193883))

(assert (=> b!162995 m!193883))

(assert (=> b!162995 m!193885))

(declare-fun m!193893 () Bool)

(assert (=> bm!17290 m!193893))

(assert (=> b!162996 m!193883))

(declare-fun m!193895 () Bool)

(assert (=> b!162996 m!193895))

(declare-fun m!193897 () Bool)

(assert (=> b!162996 m!193897))

(assert (=> b!162996 m!193883))

(declare-fun m!193899 () Bool)

(assert (=> b!162996 m!193899))

(assert (=> b!162905 d!51387))

(declare-fun b!163011 () Bool)

(declare-fun e!106936 () SeekEntryResult!393)

(declare-fun e!106937 () SeekEntryResult!393)

(assert (=> b!163011 (= e!106936 e!106937)))

(declare-fun c!30024 () Bool)

(declare-fun lt!82600 () (_ BitVec 64))

(assert (=> b!163011 (= c!30024 (= lt!82600 key!828))))

(declare-fun lt!82599 () SeekEntryResult!393)

(declare-fun d!51389 () Bool)

(assert (=> d!51389 (and (or ((_ is Undefined!393) lt!82599) (not ((_ is Found!393) lt!82599)) (and (bvsge (index!3741 lt!82599) #b00000000000000000000000000000000) (bvslt (index!3741 lt!82599) (size!3247 (_keys!5144 thiss!1248))))) (or ((_ is Undefined!393) lt!82599) ((_ is Found!393) lt!82599) (not ((_ is MissingVacant!393) lt!82599)) (not (= (index!3743 lt!82599) (index!3742 lt!82569))) (and (bvsge (index!3743 lt!82599) #b00000000000000000000000000000000) (bvslt (index!3743 lt!82599) (size!3247 (_keys!5144 thiss!1248))))) (or ((_ is Undefined!393) lt!82599) (ite ((_ is Found!393) lt!82599) (= (select (arr!2963 (_keys!5144 thiss!1248)) (index!3741 lt!82599)) key!828) (and ((_ is MissingVacant!393) lt!82599) (= (index!3743 lt!82599) (index!3742 lt!82569)) (= (select (arr!2963 (_keys!5144 thiss!1248)) (index!3743 lt!82599)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51389 (= lt!82599 e!106936)))

(declare-fun c!30025 () Bool)

(assert (=> d!51389 (= c!30025 (bvsge (x!18033 lt!82569) #b01111111111111111111111111111110))))

(assert (=> d!51389 (= lt!82600 (select (arr!2963 (_keys!5144 thiss!1248)) (index!3742 lt!82569)))))

(assert (=> d!51389 (validMask!0 (mask!7978 thiss!1248))))

(assert (=> d!51389 (= (seekKeyOrZeroReturnVacant!0 (x!18033 lt!82569) (index!3742 lt!82569) (index!3742 lt!82569) key!828 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)) lt!82599)))

(declare-fun e!106938 () SeekEntryResult!393)

(declare-fun b!163012 () Bool)

(assert (=> b!163012 (= e!106938 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18033 lt!82569) #b00000000000000000000000000000001) (nextIndex!0 (index!3742 lt!82569) (x!18033 lt!82569) (mask!7978 thiss!1248)) (index!3742 lt!82569) key!828 (_keys!5144 thiss!1248) (mask!7978 thiss!1248)))))

(declare-fun b!163013 () Bool)

(assert (=> b!163013 (= e!106938 (MissingVacant!393 (index!3742 lt!82569)))))

(declare-fun b!163014 () Bool)

(assert (=> b!163014 (= e!106936 Undefined!393)))

(declare-fun b!163015 () Bool)

(declare-fun c!30023 () Bool)

(assert (=> b!163015 (= c!30023 (= lt!82600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163015 (= e!106937 e!106938)))

(declare-fun b!163016 () Bool)

(assert (=> b!163016 (= e!106937 (Found!393 (index!3742 lt!82569)))))

(assert (= (and d!51389 c!30025) b!163014))

(assert (= (and d!51389 (not c!30025)) b!163011))

(assert (= (and b!163011 c!30024) b!163016))

(assert (= (and b!163011 (not c!30024)) b!163015))

(assert (= (and b!163015 c!30023) b!163013))

(assert (= (and b!163015 (not c!30023)) b!163012))

(declare-fun m!193901 () Bool)

(assert (=> d!51389 m!193901))

(declare-fun m!193903 () Bool)

(assert (=> d!51389 m!193903))

(assert (=> d!51389 m!193859))

(assert (=> d!51389 m!193837))

(declare-fun m!193905 () Bool)

(assert (=> b!163012 m!193905))

(assert (=> b!163012 m!193905))

(declare-fun m!193907 () Bool)

(assert (=> b!163012 m!193907))

(assert (=> b!162924 d!51389))

(declare-fun b!163026 () Bool)

(declare-fun res!77180 () Bool)

(declare-fun e!106941 () Bool)

(assert (=> b!163026 (=> (not res!77180) (not e!106941))))

(declare-fun size!3251 (LongMapFixedSize!1800) (_ BitVec 32))

(assert (=> b!163026 (= res!77180 (bvsge (size!3251 thiss!1248) (_size!949 thiss!1248)))))

(declare-fun b!163025 () Bool)

(declare-fun res!77179 () Bool)

(assert (=> b!163025 (=> (not res!77179) (not e!106941))))

(assert (=> b!163025 (= res!77179 (and (= (size!3248 (_values!3325 thiss!1248)) (bvadd (mask!7978 thiss!1248) #b00000000000000000000000000000001)) (= (size!3247 (_keys!5144 thiss!1248)) (size!3248 (_values!3325 thiss!1248))) (bvsge (_size!949 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!949 thiss!1248) (bvadd (mask!7978 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!163027 () Bool)

(declare-fun res!77178 () Bool)

(assert (=> b!163027 (=> (not res!77178) (not e!106941))))

(assert (=> b!163027 (= res!77178 (= (size!3251 thiss!1248) (bvadd (_size!949 thiss!1248) (bvsdiv (bvadd (extraKeys!3083 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!51391 () Bool)

(declare-fun res!77181 () Bool)

(assert (=> d!51391 (=> (not res!77181) (not e!106941))))

(assert (=> d!51391 (= res!77181 (validMask!0 (mask!7978 thiss!1248)))))

(assert (=> d!51391 (= (simpleValid!119 thiss!1248) e!106941)))

(declare-fun b!163028 () Bool)

(assert (=> b!163028 (= e!106941 (and (bvsge (extraKeys!3083 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3083 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!949 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!51391 res!77181) b!163025))

(assert (= (and b!163025 res!77179) b!163026))

(assert (= (and b!163026 res!77180) b!163027))

(assert (= (and b!163027 res!77178) b!163028))

(declare-fun m!193909 () Bool)

(assert (=> b!163026 m!193909))

(assert (=> b!163027 m!193909))

(assert (=> d!51391 m!193837))

(assert (=> d!51369 d!51391))

(declare-fun b!163030 () Bool)

(declare-fun e!106943 () Bool)

(assert (=> b!163030 (= e!106943 tp_is_empty!3579)))

(declare-fun mapNonEmpty!6066 () Bool)

(declare-fun mapRes!6066 () Bool)

(declare-fun tp!13914 () Bool)

(declare-fun e!106942 () Bool)

(assert (=> mapNonEmpty!6066 (= mapRes!6066 (and tp!13914 e!106942))))

(declare-fun mapKey!6066 () (_ BitVec 32))

(declare-fun mapValue!6066 () ValueCell!1446)

(declare-fun mapRest!6066 () (Array (_ BitVec 32) ValueCell!1446))

(assert (=> mapNonEmpty!6066 (= mapRest!6065 (store mapRest!6066 mapKey!6066 mapValue!6066))))

(declare-fun condMapEmpty!6066 () Bool)

(declare-fun mapDefault!6066 () ValueCell!1446)

(assert (=> mapNonEmpty!6065 (= condMapEmpty!6066 (= mapRest!6065 ((as const (Array (_ BitVec 32) ValueCell!1446)) mapDefault!6066)))))

(assert (=> mapNonEmpty!6065 (= tp!13913 (and e!106943 mapRes!6066))))

(declare-fun mapIsEmpty!6066 () Bool)

(assert (=> mapIsEmpty!6066 mapRes!6066))

(declare-fun b!163029 () Bool)

(assert (=> b!163029 (= e!106942 tp_is_empty!3579)))

(assert (= (and mapNonEmpty!6065 condMapEmpty!6066) mapIsEmpty!6066))

(assert (= (and mapNonEmpty!6065 (not condMapEmpty!6066)) mapNonEmpty!6066))

(assert (= (and mapNonEmpty!6066 ((_ is ValueCellFull!1446) mapValue!6066)) b!163029))

(assert (= (and mapNonEmpty!6065 ((_ is ValueCellFull!1446) mapDefault!6066)) b!163030))

(declare-fun m!193911 () Bool)

(assert (=> mapNonEmpty!6066 m!193911))

(check-sat (not b!162973) tp_is_empty!3579 (not b!162972) b_and!10191 (not b_next!3777) (not b!162996) (not bm!17287) (not b!162985) (not d!51391) (not b!163027) (not bm!17290) (not d!51379) (not b!162995) (not b!163026) (not b!162970) (not bm!17284) (not mapNonEmpty!6066) (not d!51389) (not b!162958) (not b!163012))
(check-sat b_and!10191 (not b_next!3777))
