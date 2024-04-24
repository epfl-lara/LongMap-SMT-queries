; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76326 () Bool)

(assert start!76326)

(declare-fun b!895489 () Bool)

(declare-fun b_free!15877 () Bool)

(declare-fun b_next!15877 () Bool)

(assert (=> b!895489 (= b_free!15877 (not b_next!15877))))

(declare-fun tp!55622 () Bool)

(declare-fun b_and!26179 () Bool)

(assert (=> b!895489 (= tp!55622 b_and!26179)))

(declare-fun b!895486 () Bool)

(declare-fun res!605735 () Bool)

(declare-fun e!500282 () Bool)

(assert (=> b!895486 (=> (not res!605735) (not e!500282))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895486 (= res!605735 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895487 () Bool)

(declare-fun e!500280 () Bool)

(declare-fun e!500281 () Bool)

(declare-fun mapRes!28884 () Bool)

(assert (=> b!895487 (= e!500280 (and e!500281 mapRes!28884))))

(declare-fun condMapEmpty!28884 () Bool)

(declare-datatypes ((array!52441 0))(
  ( (array!52442 (arr!25216 (Array (_ BitVec 32) (_ BitVec 64))) (size!25663 (_ BitVec 32))) )
))
(declare-datatypes ((V!29239 0))(
  ( (V!29240 (val!9153 Int)) )
))
(declare-datatypes ((ValueCell!8621 0))(
  ( (ValueCellFull!8621 (v!11640 V!29239)) (EmptyCell!8621) )
))
(declare-datatypes ((array!52443 0))(
  ( (array!52444 (arr!25217 (Array (_ BitVec 32) ValueCell!8621)) (size!25664 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4258 0))(
  ( (LongMapFixedSize!4259 (defaultEntry!5341 Int) (mask!25947 (_ BitVec 32)) (extraKeys!5037 (_ BitVec 32)) (zeroValue!5141 V!29239) (minValue!5141 V!29239) (_size!2184 (_ BitVec 32)) (_keys!10067 array!52441) (_values!5328 array!52443) (_vacant!2184 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4258)

(declare-fun mapDefault!28884 () ValueCell!8621)

(assert (=> b!895487 (= condMapEmpty!28884 (= (arr!25217 (_values!5328 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8621)) mapDefault!28884)))))

(declare-fun mapNonEmpty!28884 () Bool)

(declare-fun tp!55623 () Bool)

(declare-fun e!500283 () Bool)

(assert (=> mapNonEmpty!28884 (= mapRes!28884 (and tp!55623 e!500283))))

(declare-fun mapRest!28884 () (Array (_ BitVec 32) ValueCell!8621))

(declare-fun mapValue!28884 () ValueCell!8621)

(declare-fun mapKey!28884 () (_ BitVec 32))

(assert (=> mapNonEmpty!28884 (= (arr!25217 (_values!5328 thiss!1181)) (store mapRest!28884 mapKey!28884 mapValue!28884))))

(declare-fun b!895488 () Bool)

(declare-fun e!500278 () Bool)

(assert (=> b!895488 (= e!500278 (not (= (size!25664 (_values!5328 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25947 thiss!1181)))))))

(declare-fun tp_is_empty!18205 () Bool)

(declare-fun e!500277 () Bool)

(declare-fun array_inv!19848 (array!52441) Bool)

(declare-fun array_inv!19849 (array!52443) Bool)

(assert (=> b!895489 (= e!500277 (and tp!55622 tp_is_empty!18205 (array_inv!19848 (_keys!10067 thiss!1181)) (array_inv!19849 (_values!5328 thiss!1181)) e!500280))))

(declare-fun mapIsEmpty!28884 () Bool)

(assert (=> mapIsEmpty!28884 mapRes!28884))

(declare-fun b!895490 () Bool)

(assert (=> b!895490 (= e!500282 e!500278)))

(declare-fun res!605736 () Bool)

(assert (=> b!895490 (=> (not res!605736) (not e!500278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895490 (= res!605736 (validMask!0 (mask!25947 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8824 0))(
  ( (MissingZero!8824 (index!37667 (_ BitVec 32))) (Found!8824 (index!37668 (_ BitVec 32))) (Intermediate!8824 (undefined!9636 Bool) (index!37669 (_ BitVec 32)) (x!76034 (_ BitVec 32))) (Undefined!8824) (MissingVacant!8824 (index!37670 (_ BitVec 32))) )
))
(declare-fun lt!404669 () SeekEntryResult!8824)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52441 (_ BitVec 32)) SeekEntryResult!8824)

(assert (=> b!895490 (= lt!404669 (seekEntry!0 key!785 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)))))

(declare-fun res!605734 () Bool)

(assert (=> start!76326 (=> (not res!605734) (not e!500282))))

(declare-fun valid!1658 (LongMapFixedSize!4258) Bool)

(assert (=> start!76326 (= res!605734 (valid!1658 thiss!1181))))

(assert (=> start!76326 e!500282))

(assert (=> start!76326 e!500277))

(assert (=> start!76326 true))

(declare-fun b!895491 () Bool)

(assert (=> b!895491 (= e!500281 tp_is_empty!18205)))

(declare-fun b!895492 () Bool)

(assert (=> b!895492 (= e!500283 tp_is_empty!18205)))

(assert (= (and start!76326 res!605734) b!895486))

(assert (= (and b!895486 res!605735) b!895490))

(assert (= (and b!895490 res!605736) b!895488))

(assert (= (and b!895487 condMapEmpty!28884) mapIsEmpty!28884))

(assert (= (and b!895487 (not condMapEmpty!28884)) mapNonEmpty!28884))

(get-info :version)

(assert (= (and mapNonEmpty!28884 ((_ is ValueCellFull!8621) mapValue!28884)) b!895492))

(assert (= (and b!895487 ((_ is ValueCellFull!8621) mapDefault!28884)) b!895491))

(assert (= b!895489 b!895487))

(assert (= start!76326 b!895489))

(declare-fun m!833891 () Bool)

(assert (=> mapNonEmpty!28884 m!833891))

(declare-fun m!833893 () Bool)

(assert (=> b!895489 m!833893))

(declare-fun m!833895 () Bool)

(assert (=> b!895489 m!833895))

(declare-fun m!833897 () Bool)

(assert (=> b!895490 m!833897))

(declare-fun m!833899 () Bool)

(assert (=> b!895490 m!833899))

(declare-fun m!833901 () Bool)

(assert (=> start!76326 m!833901))

(check-sat (not b_next!15877) (not b!895490) (not mapNonEmpty!28884) (not start!76326) (not b!895489) b_and!26179 tp_is_empty!18205)
(check-sat b_and!26179 (not b_next!15877))
(get-model)

(declare-fun d!110989 () Bool)

(assert (=> d!110989 (= (array_inv!19848 (_keys!10067 thiss!1181)) (bvsge (size!25663 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895489 d!110989))

(declare-fun d!110991 () Bool)

(assert (=> d!110991 (= (array_inv!19849 (_values!5328 thiss!1181)) (bvsge (size!25664 (_values!5328 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895489 d!110991))

(declare-fun d!110993 () Bool)

(declare-fun res!605761 () Bool)

(declare-fun e!500328 () Bool)

(assert (=> d!110993 (=> (not res!605761) (not e!500328))))

(declare-fun simpleValid!301 (LongMapFixedSize!4258) Bool)

(assert (=> d!110993 (= res!605761 (simpleValid!301 thiss!1181))))

(assert (=> d!110993 (= (valid!1658 thiss!1181) e!500328)))

(declare-fun b!895541 () Bool)

(declare-fun res!605762 () Bool)

(assert (=> b!895541 (=> (not res!605762) (not e!500328))))

(declare-fun arrayCountValidKeys!0 (array!52441 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895541 (= res!605762 (= (arrayCountValidKeys!0 (_keys!10067 thiss!1181) #b00000000000000000000000000000000 (size!25663 (_keys!10067 thiss!1181))) (_size!2184 thiss!1181)))))

(declare-fun b!895542 () Bool)

(declare-fun res!605763 () Bool)

(assert (=> b!895542 (=> (not res!605763) (not e!500328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52441 (_ BitVec 32)) Bool)

(assert (=> b!895542 (= res!605763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)))))

(declare-fun b!895543 () Bool)

(declare-datatypes ((List!17760 0))(
  ( (Nil!17757) (Cons!17756 (h!18895 (_ BitVec 64)) (t!25091 List!17760)) )
))
(declare-fun arrayNoDuplicates!0 (array!52441 (_ BitVec 32) List!17760) Bool)

(assert (=> b!895543 (= e!500328 (arrayNoDuplicates!0 (_keys!10067 thiss!1181) #b00000000000000000000000000000000 Nil!17757))))

(assert (= (and d!110993 res!605761) b!895541))

(assert (= (and b!895541 res!605762) b!895542))

(assert (= (and b!895542 res!605763) b!895543))

(declare-fun m!833927 () Bool)

(assert (=> d!110993 m!833927))

(declare-fun m!833929 () Bool)

(assert (=> b!895541 m!833929))

(declare-fun m!833931 () Bool)

(assert (=> b!895542 m!833931))

(declare-fun m!833933 () Bool)

(assert (=> b!895543 m!833933))

(assert (=> start!76326 d!110993))

(declare-fun d!110995 () Bool)

(assert (=> d!110995 (= (validMask!0 (mask!25947 thiss!1181)) (and (or (= (mask!25947 thiss!1181) #b00000000000000000000000000000111) (= (mask!25947 thiss!1181) #b00000000000000000000000000001111) (= (mask!25947 thiss!1181) #b00000000000000000000000000011111) (= (mask!25947 thiss!1181) #b00000000000000000000000000111111) (= (mask!25947 thiss!1181) #b00000000000000000000000001111111) (= (mask!25947 thiss!1181) #b00000000000000000000000011111111) (= (mask!25947 thiss!1181) #b00000000000000000000000111111111) (= (mask!25947 thiss!1181) #b00000000000000000000001111111111) (= (mask!25947 thiss!1181) #b00000000000000000000011111111111) (= (mask!25947 thiss!1181) #b00000000000000000000111111111111) (= (mask!25947 thiss!1181) #b00000000000000000001111111111111) (= (mask!25947 thiss!1181) #b00000000000000000011111111111111) (= (mask!25947 thiss!1181) #b00000000000000000111111111111111) (= (mask!25947 thiss!1181) #b00000000000000001111111111111111) (= (mask!25947 thiss!1181) #b00000000000000011111111111111111) (= (mask!25947 thiss!1181) #b00000000000000111111111111111111) (= (mask!25947 thiss!1181) #b00000000000001111111111111111111) (= (mask!25947 thiss!1181) #b00000000000011111111111111111111) (= (mask!25947 thiss!1181) #b00000000000111111111111111111111) (= (mask!25947 thiss!1181) #b00000000001111111111111111111111) (= (mask!25947 thiss!1181) #b00000000011111111111111111111111) (= (mask!25947 thiss!1181) #b00000000111111111111111111111111) (= (mask!25947 thiss!1181) #b00000001111111111111111111111111) (= (mask!25947 thiss!1181) #b00000011111111111111111111111111) (= (mask!25947 thiss!1181) #b00000111111111111111111111111111) (= (mask!25947 thiss!1181) #b00001111111111111111111111111111) (= (mask!25947 thiss!1181) #b00011111111111111111111111111111) (= (mask!25947 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25947 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895490 d!110995))

(declare-fun b!895556 () Bool)

(declare-fun e!500336 () SeekEntryResult!8824)

(declare-fun e!500335 () SeekEntryResult!8824)

(assert (=> b!895556 (= e!500336 e!500335)))

(declare-fun lt!404687 () (_ BitVec 64))

(declare-fun lt!404684 () SeekEntryResult!8824)

(assert (=> b!895556 (= lt!404687 (select (arr!25216 (_keys!10067 thiss!1181)) (index!37669 lt!404684)))))

(declare-fun c!94700 () Bool)

(assert (=> b!895556 (= c!94700 (= lt!404687 key!785))))

(declare-fun b!895557 () Bool)

(declare-fun c!94698 () Bool)

(assert (=> b!895557 (= c!94698 (= lt!404687 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500337 () SeekEntryResult!8824)

(assert (=> b!895557 (= e!500335 e!500337)))

(declare-fun b!895558 () Bool)

(assert (=> b!895558 (= e!500337 (MissingZero!8824 (index!37669 lt!404684)))))

(declare-fun b!895559 () Bool)

(assert (=> b!895559 (= e!500336 Undefined!8824)))

(declare-fun d!110997 () Bool)

(declare-fun lt!404686 () SeekEntryResult!8824)

(assert (=> d!110997 (and (or ((_ is MissingVacant!8824) lt!404686) (not ((_ is Found!8824) lt!404686)) (and (bvsge (index!37668 lt!404686) #b00000000000000000000000000000000) (bvslt (index!37668 lt!404686) (size!25663 (_keys!10067 thiss!1181))))) (not ((_ is MissingVacant!8824) lt!404686)) (or (not ((_ is Found!8824) lt!404686)) (= (select (arr!25216 (_keys!10067 thiss!1181)) (index!37668 lt!404686)) key!785)))))

(assert (=> d!110997 (= lt!404686 e!500336)))

(declare-fun c!94699 () Bool)

(assert (=> d!110997 (= c!94699 (and ((_ is Intermediate!8824) lt!404684) (undefined!9636 lt!404684)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52441 (_ BitVec 32)) SeekEntryResult!8824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110997 (= lt!404684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25947 thiss!1181)) key!785 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)))))

(assert (=> d!110997 (validMask!0 (mask!25947 thiss!1181))))

(assert (=> d!110997 (= (seekEntry!0 key!785 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)) lt!404686)))

(declare-fun b!895560 () Bool)

(declare-fun lt!404685 () SeekEntryResult!8824)

(assert (=> b!895560 (= e!500337 (ite ((_ is MissingVacant!8824) lt!404685) (MissingZero!8824 (index!37670 lt!404685)) lt!404685))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52441 (_ BitVec 32)) SeekEntryResult!8824)

(assert (=> b!895560 (= lt!404685 (seekKeyOrZeroReturnVacant!0 (x!76034 lt!404684) (index!37669 lt!404684) (index!37669 lt!404684) key!785 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)))))

(declare-fun b!895561 () Bool)

(assert (=> b!895561 (= e!500335 (Found!8824 (index!37669 lt!404684)))))

(assert (= (and d!110997 c!94699) b!895559))

(assert (= (and d!110997 (not c!94699)) b!895556))

(assert (= (and b!895556 c!94700) b!895561))

(assert (= (and b!895556 (not c!94700)) b!895557))

(assert (= (and b!895557 c!94698) b!895558))

(assert (= (and b!895557 (not c!94698)) b!895560))

(declare-fun m!833935 () Bool)

(assert (=> b!895556 m!833935))

(declare-fun m!833937 () Bool)

(assert (=> d!110997 m!833937))

(declare-fun m!833939 () Bool)

(assert (=> d!110997 m!833939))

(assert (=> d!110997 m!833939))

(declare-fun m!833941 () Bool)

(assert (=> d!110997 m!833941))

(assert (=> d!110997 m!833897))

(declare-fun m!833943 () Bool)

(assert (=> b!895560 m!833943))

(assert (=> b!895490 d!110997))

(declare-fun mapNonEmpty!28893 () Bool)

(declare-fun mapRes!28893 () Bool)

(declare-fun tp!55638 () Bool)

(declare-fun e!500343 () Bool)

(assert (=> mapNonEmpty!28893 (= mapRes!28893 (and tp!55638 e!500343))))

(declare-fun mapKey!28893 () (_ BitVec 32))

(declare-fun mapRest!28893 () (Array (_ BitVec 32) ValueCell!8621))

(declare-fun mapValue!28893 () ValueCell!8621)

(assert (=> mapNonEmpty!28893 (= mapRest!28884 (store mapRest!28893 mapKey!28893 mapValue!28893))))

(declare-fun b!895568 () Bool)

(assert (=> b!895568 (= e!500343 tp_is_empty!18205)))

(declare-fun mapIsEmpty!28893 () Bool)

(assert (=> mapIsEmpty!28893 mapRes!28893))

(declare-fun condMapEmpty!28893 () Bool)

(declare-fun mapDefault!28893 () ValueCell!8621)

(assert (=> mapNonEmpty!28884 (= condMapEmpty!28893 (= mapRest!28884 ((as const (Array (_ BitVec 32) ValueCell!8621)) mapDefault!28893)))))

(declare-fun e!500342 () Bool)

(assert (=> mapNonEmpty!28884 (= tp!55623 (and e!500342 mapRes!28893))))

(declare-fun b!895569 () Bool)

(assert (=> b!895569 (= e!500342 tp_is_empty!18205)))

(assert (= (and mapNonEmpty!28884 condMapEmpty!28893) mapIsEmpty!28893))

(assert (= (and mapNonEmpty!28884 (not condMapEmpty!28893)) mapNonEmpty!28893))

(assert (= (and mapNonEmpty!28893 ((_ is ValueCellFull!8621) mapValue!28893)) b!895568))

(assert (= (and mapNonEmpty!28884 ((_ is ValueCellFull!8621) mapDefault!28893)) b!895569))

(declare-fun m!833945 () Bool)

(assert (=> mapNonEmpty!28893 m!833945))

(check-sat (not b_next!15877) (not b!895543) (not mapNonEmpty!28893) (not b!895542) (not d!110997) (not b!895541) (not b!895560) (not d!110993) b_and!26179 tp_is_empty!18205)
(check-sat b_and!26179 (not b_next!15877))
(get-model)

(declare-fun b!895580 () Bool)

(declare-fun res!605774 () Bool)

(declare-fun e!500346 () Bool)

(assert (=> b!895580 (=> (not res!605774) (not e!500346))))

(declare-fun size!25669 (LongMapFixedSize!4258) (_ BitVec 32))

(assert (=> b!895580 (= res!605774 (= (size!25669 thiss!1181) (bvadd (_size!2184 thiss!1181) (bvsdiv (bvadd (extraKeys!5037 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!110999 () Bool)

(declare-fun res!605772 () Bool)

(assert (=> d!110999 (=> (not res!605772) (not e!500346))))

(assert (=> d!110999 (= res!605772 (validMask!0 (mask!25947 thiss!1181)))))

(assert (=> d!110999 (= (simpleValid!301 thiss!1181) e!500346)))

(declare-fun b!895579 () Bool)

(declare-fun res!605775 () Bool)

(assert (=> b!895579 (=> (not res!605775) (not e!500346))))

(assert (=> b!895579 (= res!605775 (bvsge (size!25669 thiss!1181) (_size!2184 thiss!1181)))))

(declare-fun b!895578 () Bool)

(declare-fun res!605773 () Bool)

(assert (=> b!895578 (=> (not res!605773) (not e!500346))))

(assert (=> b!895578 (= res!605773 (and (= (size!25664 (_values!5328 thiss!1181)) (bvadd (mask!25947 thiss!1181) #b00000000000000000000000000000001)) (= (size!25663 (_keys!10067 thiss!1181)) (size!25664 (_values!5328 thiss!1181))) (bvsge (_size!2184 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2184 thiss!1181) (bvadd (mask!25947 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!895581 () Bool)

(assert (=> b!895581 (= e!500346 (and (bvsge (extraKeys!5037 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5037 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2184 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!110999 res!605772) b!895578))

(assert (= (and b!895578 res!605773) b!895579))

(assert (= (and b!895579 res!605775) b!895580))

(assert (= (and b!895580 res!605774) b!895581))

(declare-fun m!833947 () Bool)

(assert (=> b!895580 m!833947))

(assert (=> d!110999 m!833897))

(assert (=> b!895579 m!833947))

(assert (=> d!110993 d!110999))

(declare-fun b!895592 () Bool)

(declare-fun e!500356 () Bool)

(declare-fun e!500355 () Bool)

(assert (=> b!895592 (= e!500356 e!500355)))

(declare-fun c!94703 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895592 (= c!94703 (validKeyInArray!0 (select (arr!25216 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895593 () Bool)

(declare-fun e!500358 () Bool)

(assert (=> b!895593 (= e!500358 e!500356)))

(declare-fun res!605784 () Bool)

(assert (=> b!895593 (=> (not res!605784) (not e!500356))))

(declare-fun e!500357 () Bool)

(assert (=> b!895593 (= res!605784 (not e!500357))))

(declare-fun res!605782 () Bool)

(assert (=> b!895593 (=> (not res!605782) (not e!500357))))

(assert (=> b!895593 (= res!605782 (validKeyInArray!0 (select (arr!25216 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111001 () Bool)

(declare-fun res!605783 () Bool)

(assert (=> d!111001 (=> res!605783 e!500358)))

(assert (=> d!111001 (= res!605783 (bvsge #b00000000000000000000000000000000 (size!25663 (_keys!10067 thiss!1181))))))

(assert (=> d!111001 (= (arrayNoDuplicates!0 (_keys!10067 thiss!1181) #b00000000000000000000000000000000 Nil!17757) e!500358)))

(declare-fun b!895594 () Bool)

(declare-fun contains!4365 (List!17760 (_ BitVec 64)) Bool)

(assert (=> b!895594 (= e!500357 (contains!4365 Nil!17757 (select (arr!25216 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895595 () Bool)

(declare-fun call!39766 () Bool)

(assert (=> b!895595 (= e!500355 call!39766)))

(declare-fun b!895596 () Bool)

(assert (=> b!895596 (= e!500355 call!39766)))

(declare-fun bm!39763 () Bool)

(assert (=> bm!39763 (= call!39766 (arrayNoDuplicates!0 (_keys!10067 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94703 (Cons!17756 (select (arr!25216 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000) Nil!17757) Nil!17757)))))

(assert (= (and d!111001 (not res!605783)) b!895593))

(assert (= (and b!895593 res!605782) b!895594))

(assert (= (and b!895593 res!605784) b!895592))

(assert (= (and b!895592 c!94703) b!895596))

(assert (= (and b!895592 (not c!94703)) b!895595))

(assert (= (or b!895596 b!895595) bm!39763))

(declare-fun m!833949 () Bool)

(assert (=> b!895592 m!833949))

(assert (=> b!895592 m!833949))

(declare-fun m!833951 () Bool)

(assert (=> b!895592 m!833951))

(assert (=> b!895593 m!833949))

(assert (=> b!895593 m!833949))

(assert (=> b!895593 m!833951))

(assert (=> b!895594 m!833949))

(assert (=> b!895594 m!833949))

(declare-fun m!833953 () Bool)

(assert (=> b!895594 m!833953))

(assert (=> bm!39763 m!833949))

(declare-fun m!833955 () Bool)

(assert (=> bm!39763 m!833955))

(assert (=> b!895543 d!111001))

(declare-fun b!895605 () Bool)

(declare-fun e!500364 () (_ BitVec 32))

(declare-fun call!39769 () (_ BitVec 32))

(assert (=> b!895605 (= e!500364 call!39769)))

(declare-fun bm!39766 () Bool)

(assert (=> bm!39766 (= call!39769 (arrayCountValidKeys!0 (_keys!10067 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25663 (_keys!10067 thiss!1181))))))

(declare-fun d!111003 () Bool)

(declare-fun lt!404690 () (_ BitVec 32))

(assert (=> d!111003 (and (bvsge lt!404690 #b00000000000000000000000000000000) (bvsle lt!404690 (bvsub (size!25663 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!500363 () (_ BitVec 32))

(assert (=> d!111003 (= lt!404690 e!500363)))

(declare-fun c!94708 () Bool)

(assert (=> d!111003 (= c!94708 (bvsge #b00000000000000000000000000000000 (size!25663 (_keys!10067 thiss!1181))))))

(assert (=> d!111003 (and (bvsle #b00000000000000000000000000000000 (size!25663 (_keys!10067 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25663 (_keys!10067 thiss!1181)) (size!25663 (_keys!10067 thiss!1181))))))

(assert (=> d!111003 (= (arrayCountValidKeys!0 (_keys!10067 thiss!1181) #b00000000000000000000000000000000 (size!25663 (_keys!10067 thiss!1181))) lt!404690)))

(declare-fun b!895606 () Bool)

(assert (=> b!895606 (= e!500364 (bvadd #b00000000000000000000000000000001 call!39769))))

(declare-fun b!895607 () Bool)

(assert (=> b!895607 (= e!500363 e!500364)))

(declare-fun c!94709 () Bool)

(assert (=> b!895607 (= c!94709 (validKeyInArray!0 (select (arr!25216 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895608 () Bool)

(assert (=> b!895608 (= e!500363 #b00000000000000000000000000000000)))

(assert (= (and d!111003 c!94708) b!895608))

(assert (= (and d!111003 (not c!94708)) b!895607))

(assert (= (and b!895607 c!94709) b!895606))

(assert (= (and b!895607 (not c!94709)) b!895605))

(assert (= (or b!895606 b!895605) bm!39766))

(declare-fun m!833957 () Bool)

(assert (=> bm!39766 m!833957))

(assert (=> b!895607 m!833949))

(assert (=> b!895607 m!833949))

(assert (=> b!895607 m!833951))

(assert (=> b!895541 d!111003))

(declare-fun b!895627 () Bool)

(declare-fun lt!404696 () SeekEntryResult!8824)

(assert (=> b!895627 (and (bvsge (index!37669 lt!404696) #b00000000000000000000000000000000) (bvslt (index!37669 lt!404696) (size!25663 (_keys!10067 thiss!1181))))))

(declare-fun e!500376 () Bool)

(assert (=> b!895627 (= e!500376 (= (select (arr!25216 (_keys!10067 thiss!1181)) (index!37669 lt!404696)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!895628 () Bool)

(assert (=> b!895628 (and (bvsge (index!37669 lt!404696) #b00000000000000000000000000000000) (bvslt (index!37669 lt!404696) (size!25663 (_keys!10067 thiss!1181))))))

(declare-fun res!605792 () Bool)

(assert (=> b!895628 (= res!605792 (= (select (arr!25216 (_keys!10067 thiss!1181)) (index!37669 lt!404696)) key!785))))

(assert (=> b!895628 (=> res!605792 e!500376)))

(declare-fun e!500377 () Bool)

(assert (=> b!895628 (= e!500377 e!500376)))

(declare-fun b!895629 () Bool)

(declare-fun e!500378 () SeekEntryResult!8824)

(assert (=> b!895629 (= e!500378 (Intermediate!8824 true (toIndex!0 key!785 (mask!25947 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun d!111005 () Bool)

(declare-fun e!500379 () Bool)

(assert (=> d!111005 e!500379))

(declare-fun c!94716 () Bool)

(assert (=> d!111005 (= c!94716 (and ((_ is Intermediate!8824) lt!404696) (undefined!9636 lt!404696)))))

(assert (=> d!111005 (= lt!404696 e!500378)))

(declare-fun c!94718 () Bool)

(assert (=> d!111005 (= c!94718 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!404695 () (_ BitVec 64))

(assert (=> d!111005 (= lt!404695 (select (arr!25216 (_keys!10067 thiss!1181)) (toIndex!0 key!785 (mask!25947 thiss!1181))))))

(assert (=> d!111005 (validMask!0 (mask!25947 thiss!1181))))

(assert (=> d!111005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25947 thiss!1181)) key!785 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)) lt!404696)))

(declare-fun b!895630 () Bool)

(declare-fun e!500375 () SeekEntryResult!8824)

(assert (=> b!895630 (= e!500375 (Intermediate!8824 false (toIndex!0 key!785 (mask!25947 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895631 () Bool)

(assert (=> b!895631 (= e!500379 e!500377)))

(declare-fun res!605791 () Bool)

(assert (=> b!895631 (= res!605791 (and ((_ is Intermediate!8824) lt!404696) (not (undefined!9636 lt!404696)) (bvslt (x!76034 lt!404696) #b01111111111111111111111111111110) (bvsge (x!76034 lt!404696) #b00000000000000000000000000000000) (bvsge (x!76034 lt!404696) #b00000000000000000000000000000000)))))

(assert (=> b!895631 (=> (not res!605791) (not e!500377))))

(declare-fun b!895632 () Bool)

(assert (=> b!895632 (= e!500378 e!500375)))

(declare-fun c!94717 () Bool)

(assert (=> b!895632 (= c!94717 (or (= lt!404695 key!785) (= (bvadd lt!404695 lt!404695) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!895633 () Bool)

(assert (=> b!895633 (= e!500379 (bvsge (x!76034 lt!404696) #b01111111111111111111111111111110))))

(declare-fun b!895634 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895634 (= e!500375 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25947 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!25947 thiss!1181)) key!785 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)))))

(declare-fun b!895635 () Bool)

(assert (=> b!895635 (and (bvsge (index!37669 lt!404696) #b00000000000000000000000000000000) (bvslt (index!37669 lt!404696) (size!25663 (_keys!10067 thiss!1181))))))

(declare-fun res!605793 () Bool)

(assert (=> b!895635 (= res!605793 (= (select (arr!25216 (_keys!10067 thiss!1181)) (index!37669 lt!404696)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895635 (=> res!605793 e!500376)))

(assert (= (and d!111005 c!94718) b!895629))

(assert (= (and d!111005 (not c!94718)) b!895632))

(assert (= (and b!895632 c!94717) b!895630))

(assert (= (and b!895632 (not c!94717)) b!895634))

(assert (= (and d!111005 c!94716) b!895633))

(assert (= (and d!111005 (not c!94716)) b!895631))

(assert (= (and b!895631 res!605791) b!895628))

(assert (= (and b!895628 (not res!605792)) b!895635))

(assert (= (and b!895635 (not res!605793)) b!895627))

(assert (=> d!111005 m!833939))

(declare-fun m!833959 () Bool)

(assert (=> d!111005 m!833959))

(assert (=> d!111005 m!833897))

(declare-fun m!833961 () Bool)

(assert (=> b!895635 m!833961))

(assert (=> b!895628 m!833961))

(assert (=> b!895634 m!833939))

(declare-fun m!833963 () Bool)

(assert (=> b!895634 m!833963))

(assert (=> b!895634 m!833963))

(declare-fun m!833965 () Bool)

(assert (=> b!895634 m!833965))

(assert (=> b!895627 m!833961))

(assert (=> d!110997 d!111005))

(declare-fun d!111007 () Bool)

(declare-fun lt!404702 () (_ BitVec 32))

(declare-fun lt!404701 () (_ BitVec 32))

(assert (=> d!111007 (= lt!404702 (bvmul (bvxor lt!404701 (bvlshr lt!404701 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111007 (= lt!404701 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111007 (and (bvsge (mask!25947 thiss!1181) #b00000000000000000000000000000000) (let ((res!605794 (let ((h!18896 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76050 (bvmul (bvxor h!18896 (bvlshr h!18896 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76050 (bvlshr x!76050 #b00000000000000000000000000001101)) (mask!25947 thiss!1181)))))) (and (bvslt res!605794 (bvadd (mask!25947 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605794 #b00000000000000000000000000000000))))))

(assert (=> d!111007 (= (toIndex!0 key!785 (mask!25947 thiss!1181)) (bvand (bvxor lt!404702 (bvlshr lt!404702 #b00000000000000000000000000001101)) (mask!25947 thiss!1181)))))

(assert (=> d!110997 d!111007))

(assert (=> d!110997 d!110995))

(declare-fun b!895644 () Bool)

(declare-fun e!500388 () Bool)

(declare-fun e!500387 () Bool)

(assert (=> b!895644 (= e!500388 e!500387)))

(declare-fun lt!404711 () (_ BitVec 64))

(assert (=> b!895644 (= lt!404711 (select (arr!25216 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30440 0))(
  ( (Unit!30441) )
))
(declare-fun lt!404709 () Unit!30440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52441 (_ BitVec 64) (_ BitVec 32)) Unit!30440)

(assert (=> b!895644 (= lt!404709 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10067 thiss!1181) lt!404711 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895644 (arrayContainsKey!0 (_keys!10067 thiss!1181) lt!404711 #b00000000000000000000000000000000)))

(declare-fun lt!404710 () Unit!30440)

(assert (=> b!895644 (= lt!404710 lt!404709)))

(declare-fun res!605799 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52441 (_ BitVec 32)) SeekEntryResult!8824)

(assert (=> b!895644 (= res!605799 (= (seekEntryOrOpen!0 (select (arr!25216 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000) (_keys!10067 thiss!1181) (mask!25947 thiss!1181)) (Found!8824 #b00000000000000000000000000000000)))))

(assert (=> b!895644 (=> (not res!605799) (not e!500387))))

(declare-fun b!895645 () Bool)

(declare-fun call!39772 () Bool)

(assert (=> b!895645 (= e!500388 call!39772)))

(declare-fun b!895646 () Bool)

(assert (=> b!895646 (= e!500387 call!39772)))

(declare-fun d!111009 () Bool)

(declare-fun res!605800 () Bool)

(declare-fun e!500386 () Bool)

(assert (=> d!111009 (=> res!605800 e!500386)))

(assert (=> d!111009 (= res!605800 (bvsge #b00000000000000000000000000000000 (size!25663 (_keys!10067 thiss!1181))))))

(assert (=> d!111009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)) e!500386)))

(declare-fun b!895647 () Bool)

(assert (=> b!895647 (= e!500386 e!500388)))

(declare-fun c!94721 () Bool)

(assert (=> b!895647 (= c!94721 (validKeyInArray!0 (select (arr!25216 (_keys!10067 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39769 () Bool)

(assert (=> bm!39769 (= call!39772 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10067 thiss!1181) (mask!25947 thiss!1181)))))

(assert (= (and d!111009 (not res!605800)) b!895647))

(assert (= (and b!895647 c!94721) b!895644))

(assert (= (and b!895647 (not c!94721)) b!895645))

(assert (= (and b!895644 res!605799) b!895646))

(assert (= (or b!895646 b!895645) bm!39769))

(assert (=> b!895644 m!833949))

(declare-fun m!833967 () Bool)

(assert (=> b!895644 m!833967))

(declare-fun m!833969 () Bool)

(assert (=> b!895644 m!833969))

(assert (=> b!895644 m!833949))

(declare-fun m!833971 () Bool)

(assert (=> b!895644 m!833971))

(assert (=> b!895647 m!833949))

(assert (=> b!895647 m!833949))

(assert (=> b!895647 m!833951))

(declare-fun m!833973 () Bool)

(assert (=> bm!39769 m!833973))

(assert (=> b!895542 d!111009))

(declare-fun b!895660 () Bool)

(declare-fun e!500395 () SeekEntryResult!8824)

(assert (=> b!895660 (= e!500395 (Found!8824 (index!37669 lt!404684)))))

(declare-fun b!895661 () Bool)

(declare-fun e!500396 () SeekEntryResult!8824)

(assert (=> b!895661 (= e!500396 e!500395)))

(declare-fun c!94730 () Bool)

(declare-fun lt!404717 () (_ BitVec 64))

(assert (=> b!895661 (= c!94730 (= lt!404717 key!785))))

(declare-fun b!895662 () Bool)

(declare-fun c!94729 () Bool)

(assert (=> b!895662 (= c!94729 (= lt!404717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500397 () SeekEntryResult!8824)

(assert (=> b!895662 (= e!500395 e!500397)))

(declare-fun b!895663 () Bool)

(assert (=> b!895663 (= e!500397 (MissingVacant!8824 (index!37669 lt!404684)))))

(declare-fun b!895664 () Bool)

(assert (=> b!895664 (= e!500397 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76034 lt!404684) #b00000000000000000000000000000001) (nextIndex!0 (index!37669 lt!404684) (bvadd (x!76034 lt!404684) #b00000000000000000000000000000001) (mask!25947 thiss!1181)) (index!37669 lt!404684) key!785 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)))))

(declare-fun d!111011 () Bool)

(declare-fun lt!404716 () SeekEntryResult!8824)

(assert (=> d!111011 (and (or ((_ is Undefined!8824) lt!404716) (not ((_ is Found!8824) lt!404716)) (and (bvsge (index!37668 lt!404716) #b00000000000000000000000000000000) (bvslt (index!37668 lt!404716) (size!25663 (_keys!10067 thiss!1181))))) (or ((_ is Undefined!8824) lt!404716) ((_ is Found!8824) lt!404716) (not ((_ is MissingVacant!8824) lt!404716)) (not (= (index!37670 lt!404716) (index!37669 lt!404684))) (and (bvsge (index!37670 lt!404716) #b00000000000000000000000000000000) (bvslt (index!37670 lt!404716) (size!25663 (_keys!10067 thiss!1181))))) (or ((_ is Undefined!8824) lt!404716) (ite ((_ is Found!8824) lt!404716) (= (select (arr!25216 (_keys!10067 thiss!1181)) (index!37668 lt!404716)) key!785) (and ((_ is MissingVacant!8824) lt!404716) (= (index!37670 lt!404716) (index!37669 lt!404684)) (= (select (arr!25216 (_keys!10067 thiss!1181)) (index!37670 lt!404716)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111011 (= lt!404716 e!500396)))

(declare-fun c!94728 () Bool)

(assert (=> d!111011 (= c!94728 (bvsge (x!76034 lt!404684) #b01111111111111111111111111111110))))

(assert (=> d!111011 (= lt!404717 (select (arr!25216 (_keys!10067 thiss!1181)) (index!37669 lt!404684)))))

(assert (=> d!111011 (validMask!0 (mask!25947 thiss!1181))))

(assert (=> d!111011 (= (seekKeyOrZeroReturnVacant!0 (x!76034 lt!404684) (index!37669 lt!404684) (index!37669 lt!404684) key!785 (_keys!10067 thiss!1181) (mask!25947 thiss!1181)) lt!404716)))

(declare-fun b!895665 () Bool)

(assert (=> b!895665 (= e!500396 Undefined!8824)))

(assert (= (and d!111011 c!94728) b!895665))

(assert (= (and d!111011 (not c!94728)) b!895661))

(assert (= (and b!895661 c!94730) b!895660))

(assert (= (and b!895661 (not c!94730)) b!895662))

(assert (= (and b!895662 c!94729) b!895663))

(assert (= (and b!895662 (not c!94729)) b!895664))

(declare-fun m!833975 () Bool)

(assert (=> b!895664 m!833975))

(assert (=> b!895664 m!833975))

(declare-fun m!833977 () Bool)

(assert (=> b!895664 m!833977))

(declare-fun m!833979 () Bool)

(assert (=> d!111011 m!833979))

(declare-fun m!833981 () Bool)

(assert (=> d!111011 m!833981))

(assert (=> d!111011 m!833935))

(assert (=> d!111011 m!833897))

(assert (=> b!895560 d!111011))

(declare-fun mapNonEmpty!28894 () Bool)

(declare-fun mapRes!28894 () Bool)

(declare-fun tp!55639 () Bool)

(declare-fun e!500399 () Bool)

(assert (=> mapNonEmpty!28894 (= mapRes!28894 (and tp!55639 e!500399))))

(declare-fun mapValue!28894 () ValueCell!8621)

(declare-fun mapKey!28894 () (_ BitVec 32))

(declare-fun mapRest!28894 () (Array (_ BitVec 32) ValueCell!8621))

(assert (=> mapNonEmpty!28894 (= mapRest!28893 (store mapRest!28894 mapKey!28894 mapValue!28894))))

(declare-fun b!895666 () Bool)

(assert (=> b!895666 (= e!500399 tp_is_empty!18205)))

(declare-fun mapIsEmpty!28894 () Bool)

(assert (=> mapIsEmpty!28894 mapRes!28894))

(declare-fun condMapEmpty!28894 () Bool)

(declare-fun mapDefault!28894 () ValueCell!8621)

(assert (=> mapNonEmpty!28893 (= condMapEmpty!28894 (= mapRest!28893 ((as const (Array (_ BitVec 32) ValueCell!8621)) mapDefault!28894)))))

(declare-fun e!500398 () Bool)

(assert (=> mapNonEmpty!28893 (= tp!55638 (and e!500398 mapRes!28894))))

(declare-fun b!895667 () Bool)

(assert (=> b!895667 (= e!500398 tp_is_empty!18205)))

(assert (= (and mapNonEmpty!28893 condMapEmpty!28894) mapIsEmpty!28894))

(assert (= (and mapNonEmpty!28893 (not condMapEmpty!28894)) mapNonEmpty!28894))

(assert (= (and mapNonEmpty!28894 ((_ is ValueCellFull!8621) mapValue!28894)) b!895666))

(assert (= (and mapNonEmpty!28893 ((_ is ValueCellFull!8621) mapDefault!28894)) b!895667))

(declare-fun m!833983 () Bool)

(assert (=> mapNonEmpty!28894 m!833983))

(check-sat (not b_next!15877) (not b!895594) (not b!895579) (not d!111005) (not mapNonEmpty!28894) (not b!895593) (not b!895607) (not b!895580) (not d!111011) (not b!895634) (not b!895644) (not b!895592) (not bm!39769) (not bm!39766) (not d!110999) (not bm!39763) b_and!26179 tp_is_empty!18205 (not b!895664) (not b!895647))
(check-sat b_and!26179 (not b_next!15877))
