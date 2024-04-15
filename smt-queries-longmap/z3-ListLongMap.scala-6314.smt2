; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81004 () Bool)

(assert start!81004)

(declare-fun b!948550 () Bool)

(declare-fun b_free!18205 () Bool)

(declare-fun b_next!18205 () Bool)

(assert (=> b!948550 (= b_free!18205 (not b_next!18205))))

(declare-fun tp!63194 () Bool)

(declare-fun b_and!29617 () Bool)

(assert (=> b!948550 (= tp!63194 b_and!29617)))

(declare-fun b!948543 () Bool)

(declare-fun res!636340 () Bool)

(declare-fun e!533964 () Bool)

(assert (=> b!948543 (=> (not res!636340) (not e!533964))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32583 0))(
  ( (V!32584 (val!10407 Int)) )
))
(declare-datatypes ((ValueCell!9875 0))(
  ( (ValueCellFull!9875 (v!12944 V!32583)) (EmptyCell!9875) )
))
(declare-datatypes ((array!57399 0))(
  ( (array!57400 (arr!27605 (Array (_ BitVec 32) ValueCell!9875)) (size!28082 (_ BitVec 32))) )
))
(declare-datatypes ((array!57401 0))(
  ( (array!57402 (arr!27606 (Array (_ BitVec 32) (_ BitVec 64))) (size!28083 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4900 0))(
  ( (LongMapFixedSize!4901 (defaultEntry!5754 Int) (mask!27515 (_ BitVec 32)) (extraKeys!5486 (_ BitVec 32)) (zeroValue!5590 V!32583) (minValue!5590 V!32583) (_size!2505 (_ BitVec 32)) (_keys!10672 array!57401) (_values!5777 array!57399) (_vacant!2505 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4900)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9126 0))(
  ( (MissingZero!9126 (index!38875 (_ BitVec 32))) (Found!9126 (index!38876 (_ BitVec 32))) (Intermediate!9126 (undefined!9938 Bool) (index!38877 (_ BitVec 32)) (x!81625 (_ BitVec 32))) (Undefined!9126) (MissingVacant!9126 (index!38878 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57401 (_ BitVec 32)) SeekEntryResult!9126)

(assert (=> b!948543 (= res!636340 (not ((_ is Found!9126) (seekEntry!0 key!756 (_keys!10672 thiss!1141) (mask!27515 thiss!1141)))))))

(declare-fun b!948544 () Bool)

(assert (=> b!948544 (= e!533964 (and (= (size!28082 (_values!5777 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27515 thiss!1141))) (= (size!28083 (_keys!10672 thiss!1141)) (size!28082 (_values!5777 thiss!1141))) (bvslt (mask!27515 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!948545 () Bool)

(declare-fun res!636337 () Bool)

(assert (=> b!948545 (=> (not res!636337) (not e!533964))))

(declare-datatypes ((tuple2!13572 0))(
  ( (tuple2!13573 (_1!6797 (_ BitVec 64)) (_2!6797 V!32583)) )
))
(declare-datatypes ((List!19323 0))(
  ( (Nil!19320) (Cons!19319 (h!20477 tuple2!13572) (t!27643 List!19323)) )
))
(declare-datatypes ((ListLongMap!12259 0))(
  ( (ListLongMap!12260 (toList!6145 List!19323)) )
))
(declare-fun contains!5174 (ListLongMap!12259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3307 (array!57401 array!57399 (_ BitVec 32) (_ BitVec 32) V!32583 V!32583 (_ BitVec 32) Int) ListLongMap!12259)

(assert (=> b!948545 (= res!636337 (contains!5174 (getCurrentListMap!3307 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32964 () Bool)

(declare-fun mapRes!32964 () Bool)

(declare-fun tp!63195 () Bool)

(declare-fun e!533966 () Bool)

(assert (=> mapNonEmpty!32964 (= mapRes!32964 (and tp!63195 e!533966))))

(declare-fun mapValue!32964 () ValueCell!9875)

(declare-fun mapKey!32964 () (_ BitVec 32))

(declare-fun mapRest!32964 () (Array (_ BitVec 32) ValueCell!9875))

(assert (=> mapNonEmpty!32964 (= (arr!27605 (_values!5777 thiss!1141)) (store mapRest!32964 mapKey!32964 mapValue!32964))))

(declare-fun mapIsEmpty!32964 () Bool)

(assert (=> mapIsEmpty!32964 mapRes!32964))

(declare-fun b!948546 () Bool)

(declare-fun res!636339 () Bool)

(assert (=> b!948546 (=> (not res!636339) (not e!533964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948546 (= res!636339 (validMask!0 (mask!27515 thiss!1141)))))

(declare-fun b!948547 () Bool)

(declare-fun tp_is_empty!20713 () Bool)

(assert (=> b!948547 (= e!533966 tp_is_empty!20713)))

(declare-fun b!948548 () Bool)

(declare-fun e!533965 () Bool)

(assert (=> b!948548 (= e!533965 tp_is_empty!20713)))

(declare-fun b!948549 () Bool)

(declare-fun res!636338 () Bool)

(assert (=> b!948549 (=> (not res!636338) (not e!533964))))

(assert (=> b!948549 (= res!636338 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!533963 () Bool)

(declare-fun e!533967 () Bool)

(declare-fun array_inv!21486 (array!57401) Bool)

(declare-fun array_inv!21487 (array!57399) Bool)

(assert (=> b!948550 (= e!533967 (and tp!63194 tp_is_empty!20713 (array_inv!21486 (_keys!10672 thiss!1141)) (array_inv!21487 (_values!5777 thiss!1141)) e!533963))))

(declare-fun res!636336 () Bool)

(assert (=> start!81004 (=> (not res!636336) (not e!533964))))

(declare-fun valid!1868 (LongMapFixedSize!4900) Bool)

(assert (=> start!81004 (= res!636336 (valid!1868 thiss!1141))))

(assert (=> start!81004 e!533964))

(assert (=> start!81004 e!533967))

(assert (=> start!81004 true))

(declare-fun b!948551 () Bool)

(assert (=> b!948551 (= e!533963 (and e!533965 mapRes!32964))))

(declare-fun condMapEmpty!32964 () Bool)

(declare-fun mapDefault!32964 () ValueCell!9875)

(assert (=> b!948551 (= condMapEmpty!32964 (= (arr!27605 (_values!5777 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9875)) mapDefault!32964)))))

(assert (= (and start!81004 res!636336) b!948549))

(assert (= (and b!948549 res!636338) b!948543))

(assert (= (and b!948543 res!636340) b!948545))

(assert (= (and b!948545 res!636337) b!948546))

(assert (= (and b!948546 res!636339) b!948544))

(assert (= (and b!948551 condMapEmpty!32964) mapIsEmpty!32964))

(assert (= (and b!948551 (not condMapEmpty!32964)) mapNonEmpty!32964))

(assert (= (and mapNonEmpty!32964 ((_ is ValueCellFull!9875) mapValue!32964)) b!948547))

(assert (= (and b!948551 ((_ is ValueCellFull!9875) mapDefault!32964)) b!948548))

(assert (= b!948550 b!948551))

(assert (= start!81004 b!948550))

(declare-fun m!880775 () Bool)

(assert (=> mapNonEmpty!32964 m!880775))

(declare-fun m!880777 () Bool)

(assert (=> start!81004 m!880777))

(declare-fun m!880779 () Bool)

(assert (=> b!948543 m!880779))

(declare-fun m!880781 () Bool)

(assert (=> b!948545 m!880781))

(assert (=> b!948545 m!880781))

(declare-fun m!880783 () Bool)

(assert (=> b!948545 m!880783))

(declare-fun m!880785 () Bool)

(assert (=> b!948546 m!880785))

(declare-fun m!880787 () Bool)

(assert (=> b!948550 m!880787))

(declare-fun m!880789 () Bool)

(assert (=> b!948550 m!880789))

(check-sat (not b!948543) (not b_next!18205) (not b!948550) (not b!948546) tp_is_empty!20713 b_and!29617 (not start!81004) (not mapNonEmpty!32964) (not b!948545))
(check-sat b_and!29617 (not b_next!18205))
(get-model)

(declare-fun d!114733 () Bool)

(assert (=> d!114733 (= (validMask!0 (mask!27515 thiss!1141)) (and (or (= (mask!27515 thiss!1141) #b00000000000000000000000000000111) (= (mask!27515 thiss!1141) #b00000000000000000000000000001111) (= (mask!27515 thiss!1141) #b00000000000000000000000000011111) (= (mask!27515 thiss!1141) #b00000000000000000000000000111111) (= (mask!27515 thiss!1141) #b00000000000000000000000001111111) (= (mask!27515 thiss!1141) #b00000000000000000000000011111111) (= (mask!27515 thiss!1141) #b00000000000000000000000111111111) (= (mask!27515 thiss!1141) #b00000000000000000000001111111111) (= (mask!27515 thiss!1141) #b00000000000000000000011111111111) (= (mask!27515 thiss!1141) #b00000000000000000000111111111111) (= (mask!27515 thiss!1141) #b00000000000000000001111111111111) (= (mask!27515 thiss!1141) #b00000000000000000011111111111111) (= (mask!27515 thiss!1141) #b00000000000000000111111111111111) (= (mask!27515 thiss!1141) #b00000000000000001111111111111111) (= (mask!27515 thiss!1141) #b00000000000000011111111111111111) (= (mask!27515 thiss!1141) #b00000000000000111111111111111111) (= (mask!27515 thiss!1141) #b00000000000001111111111111111111) (= (mask!27515 thiss!1141) #b00000000000011111111111111111111) (= (mask!27515 thiss!1141) #b00000000000111111111111111111111) (= (mask!27515 thiss!1141) #b00000000001111111111111111111111) (= (mask!27515 thiss!1141) #b00000000011111111111111111111111) (= (mask!27515 thiss!1141) #b00000000111111111111111111111111) (= (mask!27515 thiss!1141) #b00000001111111111111111111111111) (= (mask!27515 thiss!1141) #b00000011111111111111111111111111) (= (mask!27515 thiss!1141) #b00000111111111111111111111111111) (= (mask!27515 thiss!1141) #b00001111111111111111111111111111) (= (mask!27515 thiss!1141) #b00011111111111111111111111111111) (= (mask!27515 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27515 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948546 d!114733))

(declare-fun b!948618 () Bool)

(declare-fun e!534013 () SeekEntryResult!9126)

(declare-fun lt!427015 () SeekEntryResult!9126)

(assert (=> b!948618 (= e!534013 (Found!9126 (index!38877 lt!427015)))))

(declare-fun b!948619 () Bool)

(declare-fun e!534011 () SeekEntryResult!9126)

(declare-fun lt!427014 () SeekEntryResult!9126)

(assert (=> b!948619 (= e!534011 (ite ((_ is MissingVacant!9126) lt!427014) (MissingZero!9126 (index!38878 lt!427014)) lt!427014))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57401 (_ BitVec 32)) SeekEntryResult!9126)

(assert (=> b!948619 (= lt!427014 (seekKeyOrZeroReturnVacant!0 (x!81625 lt!427015) (index!38877 lt!427015) (index!38877 lt!427015) key!756 (_keys!10672 thiss!1141) (mask!27515 thiss!1141)))))

(declare-fun b!948620 () Bool)

(declare-fun e!534012 () SeekEntryResult!9126)

(assert (=> b!948620 (= e!534012 Undefined!9126)))

(declare-fun b!948621 () Bool)

(assert (=> b!948621 (= e!534012 e!534013)))

(declare-fun lt!427017 () (_ BitVec 64))

(assert (=> b!948621 (= lt!427017 (select (arr!27606 (_keys!10672 thiss!1141)) (index!38877 lt!427015)))))

(declare-fun c!98890 () Bool)

(assert (=> b!948621 (= c!98890 (= lt!427017 key!756))))

(declare-fun d!114735 () Bool)

(declare-fun lt!427016 () SeekEntryResult!9126)

(assert (=> d!114735 (and (or ((_ is MissingVacant!9126) lt!427016) (not ((_ is Found!9126) lt!427016)) (and (bvsge (index!38876 lt!427016) #b00000000000000000000000000000000) (bvslt (index!38876 lt!427016) (size!28083 (_keys!10672 thiss!1141))))) (not ((_ is MissingVacant!9126) lt!427016)) (or (not ((_ is Found!9126) lt!427016)) (= (select (arr!27606 (_keys!10672 thiss!1141)) (index!38876 lt!427016)) key!756)))))

(assert (=> d!114735 (= lt!427016 e!534012)))

(declare-fun c!98892 () Bool)

(assert (=> d!114735 (= c!98892 (and ((_ is Intermediate!9126) lt!427015) (undefined!9938 lt!427015)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57401 (_ BitVec 32)) SeekEntryResult!9126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114735 (= lt!427015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27515 thiss!1141)) key!756 (_keys!10672 thiss!1141) (mask!27515 thiss!1141)))))

(assert (=> d!114735 (validMask!0 (mask!27515 thiss!1141))))

(assert (=> d!114735 (= (seekEntry!0 key!756 (_keys!10672 thiss!1141) (mask!27515 thiss!1141)) lt!427016)))

(declare-fun b!948622 () Bool)

(assert (=> b!948622 (= e!534011 (MissingZero!9126 (index!38877 lt!427015)))))

(declare-fun b!948623 () Bool)

(declare-fun c!98891 () Bool)

(assert (=> b!948623 (= c!98891 (= lt!427017 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948623 (= e!534013 e!534011)))

(assert (= (and d!114735 c!98892) b!948620))

(assert (= (and d!114735 (not c!98892)) b!948621))

(assert (= (and b!948621 c!98890) b!948618))

(assert (= (and b!948621 (not c!98890)) b!948623))

(assert (= (and b!948623 c!98891) b!948622))

(assert (= (and b!948623 (not c!98891)) b!948619))

(declare-fun m!880823 () Bool)

(assert (=> b!948619 m!880823))

(declare-fun m!880825 () Bool)

(assert (=> b!948621 m!880825))

(declare-fun m!880827 () Bool)

(assert (=> d!114735 m!880827))

(declare-fun m!880829 () Bool)

(assert (=> d!114735 m!880829))

(assert (=> d!114735 m!880829))

(declare-fun m!880831 () Bool)

(assert (=> d!114735 m!880831))

(assert (=> d!114735 m!880785))

(assert (=> b!948543 d!114735))

(declare-fun d!114737 () Bool)

(assert (=> d!114737 (= (array_inv!21486 (_keys!10672 thiss!1141)) (bvsge (size!28083 (_keys!10672 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948550 d!114737))

(declare-fun d!114739 () Bool)

(assert (=> d!114739 (= (array_inv!21487 (_values!5777 thiss!1141)) (bvsge (size!28082 (_values!5777 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948550 d!114739))

(declare-fun d!114741 () Bool)

(declare-fun res!636377 () Bool)

(declare-fun e!534016 () Bool)

(assert (=> d!114741 (=> (not res!636377) (not e!534016))))

(declare-fun simpleValid!369 (LongMapFixedSize!4900) Bool)

(assert (=> d!114741 (= res!636377 (simpleValid!369 thiss!1141))))

(assert (=> d!114741 (= (valid!1868 thiss!1141) e!534016)))

(declare-fun b!948630 () Bool)

(declare-fun res!636378 () Bool)

(assert (=> b!948630 (=> (not res!636378) (not e!534016))))

(declare-fun arrayCountValidKeys!0 (array!57401 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948630 (= res!636378 (= (arrayCountValidKeys!0 (_keys!10672 thiss!1141) #b00000000000000000000000000000000 (size!28083 (_keys!10672 thiss!1141))) (_size!2505 thiss!1141)))))

(declare-fun b!948631 () Bool)

(declare-fun res!636379 () Bool)

(assert (=> b!948631 (=> (not res!636379) (not e!534016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57401 (_ BitVec 32)) Bool)

(assert (=> b!948631 (= res!636379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10672 thiss!1141) (mask!27515 thiss!1141)))))

(declare-fun b!948632 () Bool)

(declare-datatypes ((List!19325 0))(
  ( (Nil!19322) (Cons!19321 (h!20479 (_ BitVec 64)) (t!27647 List!19325)) )
))
(declare-fun arrayNoDuplicates!0 (array!57401 (_ BitVec 32) List!19325) Bool)

(assert (=> b!948632 (= e!534016 (arrayNoDuplicates!0 (_keys!10672 thiss!1141) #b00000000000000000000000000000000 Nil!19322))))

(assert (= (and d!114741 res!636377) b!948630))

(assert (= (and b!948630 res!636378) b!948631))

(assert (= (and b!948631 res!636379) b!948632))

(declare-fun m!880833 () Bool)

(assert (=> d!114741 m!880833))

(declare-fun m!880835 () Bool)

(assert (=> b!948630 m!880835))

(declare-fun m!880837 () Bool)

(assert (=> b!948631 m!880837))

(declare-fun m!880839 () Bool)

(assert (=> b!948632 m!880839))

(assert (=> start!81004 d!114741))

(declare-fun d!114743 () Bool)

(declare-fun e!534021 () Bool)

(assert (=> d!114743 e!534021))

(declare-fun res!636382 () Bool)

(assert (=> d!114743 (=> res!636382 e!534021)))

(declare-fun lt!427027 () Bool)

(assert (=> d!114743 (= res!636382 (not lt!427027))))

(declare-fun lt!427028 () Bool)

(assert (=> d!114743 (= lt!427027 lt!427028)))

(declare-datatypes ((Unit!31839 0))(
  ( (Unit!31840) )
))
(declare-fun lt!427026 () Unit!31839)

(declare-fun e!534022 () Unit!31839)

(assert (=> d!114743 (= lt!427026 e!534022)))

(declare-fun c!98895 () Bool)

(assert (=> d!114743 (= c!98895 lt!427028)))

(declare-fun containsKey!459 (List!19323 (_ BitVec 64)) Bool)

(assert (=> d!114743 (= lt!427028 (containsKey!459 (toList!6145 (getCurrentListMap!3307 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141))) key!756))))

(assert (=> d!114743 (= (contains!5174 (getCurrentListMap!3307 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)) key!756) lt!427027)))

(declare-fun b!948639 () Bool)

(declare-fun lt!427029 () Unit!31839)

(assert (=> b!948639 (= e!534022 lt!427029)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!354 (List!19323 (_ BitVec 64)) Unit!31839)

(assert (=> b!948639 (= lt!427029 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6145 (getCurrentListMap!3307 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141))) key!756))))

(declare-datatypes ((Option!501 0))(
  ( (Some!500 (v!12947 V!32583)) (None!499) )
))
(declare-fun isDefined!367 (Option!501) Bool)

(declare-fun getValueByKey!495 (List!19323 (_ BitVec 64)) Option!501)

(assert (=> b!948639 (isDefined!367 (getValueByKey!495 (toList!6145 (getCurrentListMap!3307 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141))) key!756))))

(declare-fun b!948640 () Bool)

(declare-fun Unit!31841 () Unit!31839)

(assert (=> b!948640 (= e!534022 Unit!31841)))

(declare-fun b!948641 () Bool)

(assert (=> b!948641 (= e!534021 (isDefined!367 (getValueByKey!495 (toList!6145 (getCurrentListMap!3307 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141))) key!756)))))

(assert (= (and d!114743 c!98895) b!948639))

(assert (= (and d!114743 (not c!98895)) b!948640))

(assert (= (and d!114743 (not res!636382)) b!948641))

(declare-fun m!880841 () Bool)

(assert (=> d!114743 m!880841))

(declare-fun m!880843 () Bool)

(assert (=> b!948639 m!880843))

(declare-fun m!880845 () Bool)

(assert (=> b!948639 m!880845))

(assert (=> b!948639 m!880845))

(declare-fun m!880847 () Bool)

(assert (=> b!948639 m!880847))

(assert (=> b!948641 m!880845))

(assert (=> b!948641 m!880845))

(assert (=> b!948641 m!880847))

(assert (=> b!948545 d!114743))

(declare-fun b!948684 () Bool)

(declare-fun e!534055 () Bool)

(declare-fun e!534056 () Bool)

(assert (=> b!948684 (= e!534055 e!534056)))

(declare-fun res!636403 () Bool)

(assert (=> b!948684 (=> (not res!636403) (not e!534056))))

(declare-fun lt!427075 () ListLongMap!12259)

(assert (=> b!948684 (= res!636403 (contains!5174 lt!427075 (select (arr!27606 (_keys!10672 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28083 (_keys!10672 thiss!1141))))))

(declare-fun b!948685 () Bool)

(declare-fun res!636407 () Bool)

(declare-fun e!534051 () Bool)

(assert (=> b!948685 (=> (not res!636407) (not e!534051))))

(declare-fun e!534052 () Bool)

(assert (=> b!948685 (= res!636407 e!534052)))

(declare-fun c!98909 () Bool)

(assert (=> b!948685 (= c!98909 (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!948686 () Bool)

(declare-fun e!534049 () Bool)

(assert (=> b!948686 (= e!534051 e!534049)))

(declare-fun c!98913 () Bool)

(assert (=> b!948686 (= c!98913 (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!948687 () Bool)

(declare-fun e!534054 () Bool)

(declare-fun apply!866 (ListLongMap!12259 (_ BitVec 64)) V!32583)

(assert (=> b!948687 (= e!534054 (= (apply!866 lt!427075 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5590 thiss!1141)))))

(declare-fun b!948688 () Bool)

(declare-fun e!534053 () ListLongMap!12259)

(declare-fun call!41227 () ListLongMap!12259)

(assert (=> b!948688 (= e!534053 call!41227)))

(declare-fun b!948690 () Bool)

(declare-fun e!534059 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948690 (= e!534059 (validKeyInArray!0 (select (arr!27606 (_keys!10672 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948691 () Bool)

(declare-fun call!41224 () Bool)

(assert (=> b!948691 (= e!534049 (not call!41224))))

(declare-fun bm!41218 () Bool)

(declare-fun call!41223 () ListLongMap!12259)

(declare-fun getCurrentListMapNoExtraKeys!3348 (array!57401 array!57399 (_ BitVec 32) (_ BitVec 32) V!32583 V!32583 (_ BitVec 32) Int) ListLongMap!12259)

(assert (=> bm!41218 (= call!41223 (getCurrentListMapNoExtraKeys!3348 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun b!948692 () Bool)

(declare-fun e!534057 () ListLongMap!12259)

(declare-fun call!41221 () ListLongMap!12259)

(declare-fun +!2876 (ListLongMap!12259 tuple2!13572) ListLongMap!12259)

(assert (=> b!948692 (= e!534057 (+!2876 call!41221 (tuple2!13573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5590 thiss!1141))))))

(declare-fun b!948693 () Bool)

(declare-fun call!41225 () ListLongMap!12259)

(assert (=> b!948693 (= e!534053 call!41225)))

(declare-fun b!948694 () Bool)

(declare-fun c!98910 () Bool)

(assert (=> b!948694 (= c!98910 (and (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!534061 () ListLongMap!12259)

(assert (=> b!948694 (= e!534061 e!534053)))

(declare-fun bm!41219 () Bool)

(assert (=> bm!41219 (= call!41227 call!41221)))

(declare-fun b!948695 () Bool)

(assert (=> b!948695 (= e!534057 e!534061)))

(declare-fun c!98912 () Bool)

(assert (=> b!948695 (= c!98912 (and (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41220 () Bool)

(declare-fun call!41226 () ListLongMap!12259)

(assert (=> bm!41220 (= call!41225 call!41226)))

(declare-fun b!948696 () Bool)

(declare-fun e!534058 () Bool)

(assert (=> b!948696 (= e!534058 (= (apply!866 lt!427075 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5590 thiss!1141)))))

(declare-fun b!948697 () Bool)

(assert (=> b!948697 (= e!534049 e!534058)))

(declare-fun res!636402 () Bool)

(assert (=> b!948697 (= res!636402 call!41224)))

(assert (=> b!948697 (=> (not res!636402) (not e!534058))))

(declare-fun d!114745 () Bool)

(assert (=> d!114745 e!534051))

(declare-fun res!636404 () Bool)

(assert (=> d!114745 (=> (not res!636404) (not e!534051))))

(assert (=> d!114745 (= res!636404 (or (bvsge #b00000000000000000000000000000000 (size!28083 (_keys!10672 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28083 (_keys!10672 thiss!1141))))))))

(declare-fun lt!427087 () ListLongMap!12259)

(assert (=> d!114745 (= lt!427075 lt!427087)))

(declare-fun lt!427080 () Unit!31839)

(declare-fun e!534050 () Unit!31839)

(assert (=> d!114745 (= lt!427080 e!534050)))

(declare-fun c!98908 () Bool)

(assert (=> d!114745 (= c!98908 e!534059)))

(declare-fun res!636401 () Bool)

(assert (=> d!114745 (=> (not res!636401) (not e!534059))))

(assert (=> d!114745 (= res!636401 (bvslt #b00000000000000000000000000000000 (size!28083 (_keys!10672 thiss!1141))))))

(assert (=> d!114745 (= lt!427087 e!534057)))

(declare-fun c!98911 () Bool)

(assert (=> d!114745 (= c!98911 (and (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114745 (validMask!0 (mask!27515 thiss!1141))))

(assert (=> d!114745 (= (getCurrentListMap!3307 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)) lt!427075)))

(declare-fun b!948689 () Bool)

(declare-fun call!41222 () Bool)

(assert (=> b!948689 (= e!534052 (not call!41222))))

(declare-fun bm!41221 () Bool)

(assert (=> bm!41221 (= call!41224 (contains!5174 lt!427075 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41222 () Bool)

(assert (=> bm!41222 (= call!41222 (contains!5174 lt!427075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948698 () Bool)

(declare-fun get!14503 (ValueCell!9875 V!32583) V!32583)

(declare-fun dynLambda!1632 (Int (_ BitVec 64)) V!32583)

(assert (=> b!948698 (= e!534056 (= (apply!866 lt!427075 (select (arr!27606 (_keys!10672 thiss!1141)) #b00000000000000000000000000000000)) (get!14503 (select (arr!27605 (_values!5777 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1632 (defaultEntry!5754 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28082 (_values!5777 thiss!1141))))))

(assert (=> b!948698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28083 (_keys!10672 thiss!1141))))))

(declare-fun b!948699 () Bool)

(assert (=> b!948699 (= e!534052 e!534054)))

(declare-fun res!636408 () Bool)

(assert (=> b!948699 (= res!636408 call!41222)))

(assert (=> b!948699 (=> (not res!636408) (not e!534054))))

(declare-fun b!948700 () Bool)

(declare-fun res!636406 () Bool)

(assert (=> b!948700 (=> (not res!636406) (not e!534051))))

(assert (=> b!948700 (= res!636406 e!534055)))

(declare-fun res!636405 () Bool)

(assert (=> b!948700 (=> res!636405 e!534055)))

(declare-fun e!534060 () Bool)

(assert (=> b!948700 (= res!636405 (not e!534060))))

(declare-fun res!636409 () Bool)

(assert (=> b!948700 (=> (not res!636409) (not e!534060))))

(assert (=> b!948700 (= res!636409 (bvslt #b00000000000000000000000000000000 (size!28083 (_keys!10672 thiss!1141))))))

(declare-fun bm!41223 () Bool)

(assert (=> bm!41223 (= call!41221 (+!2876 (ite c!98911 call!41223 (ite c!98912 call!41226 call!41225)) (ite (or c!98911 c!98912) (tuple2!13573 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5590 thiss!1141)) (tuple2!13573 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5590 thiss!1141)))))))

(declare-fun b!948701 () Bool)

(declare-fun lt!427084 () Unit!31839)

(assert (=> b!948701 (= e!534050 lt!427084)))

(declare-fun lt!427089 () ListLongMap!12259)

(assert (=> b!948701 (= lt!427089 (getCurrentListMapNoExtraKeys!3348 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun lt!427079 () (_ BitVec 64))

(assert (=> b!948701 (= lt!427079 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427078 () (_ BitVec 64))

(assert (=> b!948701 (= lt!427078 (select (arr!27606 (_keys!10672 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427074 () Unit!31839)

(declare-fun addStillContains!565 (ListLongMap!12259 (_ BitVec 64) V!32583 (_ BitVec 64)) Unit!31839)

(assert (=> b!948701 (= lt!427074 (addStillContains!565 lt!427089 lt!427079 (zeroValue!5590 thiss!1141) lt!427078))))

(assert (=> b!948701 (contains!5174 (+!2876 lt!427089 (tuple2!13573 lt!427079 (zeroValue!5590 thiss!1141))) lt!427078)))

(declare-fun lt!427083 () Unit!31839)

(assert (=> b!948701 (= lt!427083 lt!427074)))

(declare-fun lt!427091 () ListLongMap!12259)

(assert (=> b!948701 (= lt!427091 (getCurrentListMapNoExtraKeys!3348 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun lt!427081 () (_ BitVec 64))

(assert (=> b!948701 (= lt!427081 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427095 () (_ BitVec 64))

(assert (=> b!948701 (= lt!427095 (select (arr!27606 (_keys!10672 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427082 () Unit!31839)

(declare-fun addApplyDifferent!445 (ListLongMap!12259 (_ BitVec 64) V!32583 (_ BitVec 64)) Unit!31839)

(assert (=> b!948701 (= lt!427082 (addApplyDifferent!445 lt!427091 lt!427081 (minValue!5590 thiss!1141) lt!427095))))

(assert (=> b!948701 (= (apply!866 (+!2876 lt!427091 (tuple2!13573 lt!427081 (minValue!5590 thiss!1141))) lt!427095) (apply!866 lt!427091 lt!427095))))

(declare-fun lt!427093 () Unit!31839)

(assert (=> b!948701 (= lt!427093 lt!427082)))

(declare-fun lt!427085 () ListLongMap!12259)

(assert (=> b!948701 (= lt!427085 (getCurrentListMapNoExtraKeys!3348 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun lt!427092 () (_ BitVec 64))

(assert (=> b!948701 (= lt!427092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427094 () (_ BitVec 64))

(assert (=> b!948701 (= lt!427094 (select (arr!27606 (_keys!10672 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427088 () Unit!31839)

(assert (=> b!948701 (= lt!427088 (addApplyDifferent!445 lt!427085 lt!427092 (zeroValue!5590 thiss!1141) lt!427094))))

(assert (=> b!948701 (= (apply!866 (+!2876 lt!427085 (tuple2!13573 lt!427092 (zeroValue!5590 thiss!1141))) lt!427094) (apply!866 lt!427085 lt!427094))))

(declare-fun lt!427090 () Unit!31839)

(assert (=> b!948701 (= lt!427090 lt!427088)))

(declare-fun lt!427077 () ListLongMap!12259)

(assert (=> b!948701 (= lt!427077 (getCurrentListMapNoExtraKeys!3348 (_keys!10672 thiss!1141) (_values!5777 thiss!1141) (mask!27515 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun lt!427076 () (_ BitVec 64))

(assert (=> b!948701 (= lt!427076 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427086 () (_ BitVec 64))

(assert (=> b!948701 (= lt!427086 (select (arr!27606 (_keys!10672 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948701 (= lt!427084 (addApplyDifferent!445 lt!427077 lt!427076 (minValue!5590 thiss!1141) lt!427086))))

(assert (=> b!948701 (= (apply!866 (+!2876 lt!427077 (tuple2!13573 lt!427076 (minValue!5590 thiss!1141))) lt!427086) (apply!866 lt!427077 lt!427086))))

(declare-fun b!948702 () Bool)

(declare-fun Unit!31842 () Unit!31839)

(assert (=> b!948702 (= e!534050 Unit!31842)))

(declare-fun b!948703 () Bool)

(assert (=> b!948703 (= e!534060 (validKeyInArray!0 (select (arr!27606 (_keys!10672 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41224 () Bool)

(assert (=> bm!41224 (= call!41226 call!41223)))

(declare-fun b!948704 () Bool)

(assert (=> b!948704 (= e!534061 call!41227)))

(assert (= (and d!114745 c!98911) b!948692))

(assert (= (and d!114745 (not c!98911)) b!948695))

(assert (= (and b!948695 c!98912) b!948704))

(assert (= (and b!948695 (not c!98912)) b!948694))

(assert (= (and b!948694 c!98910) b!948688))

(assert (= (and b!948694 (not c!98910)) b!948693))

(assert (= (or b!948688 b!948693) bm!41220))

(assert (= (or b!948704 bm!41220) bm!41224))

(assert (= (or b!948704 b!948688) bm!41219))

(assert (= (or b!948692 bm!41224) bm!41218))

(assert (= (or b!948692 bm!41219) bm!41223))

(assert (= (and d!114745 res!636401) b!948690))

(assert (= (and d!114745 c!98908) b!948701))

(assert (= (and d!114745 (not c!98908)) b!948702))

(assert (= (and d!114745 res!636404) b!948700))

(assert (= (and b!948700 res!636409) b!948703))

(assert (= (and b!948700 (not res!636405)) b!948684))

(assert (= (and b!948684 res!636403) b!948698))

(assert (= (and b!948700 res!636406) b!948685))

(assert (= (and b!948685 c!98909) b!948699))

(assert (= (and b!948685 (not c!98909)) b!948689))

(assert (= (and b!948699 res!636408) b!948687))

(assert (= (or b!948699 b!948689) bm!41222))

(assert (= (and b!948685 res!636407) b!948686))

(assert (= (and b!948686 c!98913) b!948697))

(assert (= (and b!948686 (not c!98913)) b!948691))

(assert (= (and b!948697 res!636402) b!948696))

(assert (= (or b!948697 b!948691) bm!41221))

(declare-fun b_lambda!14313 () Bool)

(assert (=> (not b_lambda!14313) (not b!948698)))

(declare-fun t!27646 () Bool)

(declare-fun tb!6173 () Bool)

(assert (=> (and b!948550 (= (defaultEntry!5754 thiss!1141) (defaultEntry!5754 thiss!1141)) t!27646) tb!6173))

(declare-fun result!12257 () Bool)

(assert (=> tb!6173 (= result!12257 tp_is_empty!20713)))

(assert (=> b!948698 t!27646))

(declare-fun b_and!29623 () Bool)

(assert (= b_and!29617 (and (=> t!27646 result!12257) b_and!29623)))

(declare-fun m!880849 () Bool)

(assert (=> b!948696 m!880849))

(declare-fun m!880851 () Bool)

(assert (=> b!948684 m!880851))

(assert (=> b!948684 m!880851))

(declare-fun m!880853 () Bool)

(assert (=> b!948684 m!880853))

(assert (=> b!948690 m!880851))

(assert (=> b!948690 m!880851))

(declare-fun m!880855 () Bool)

(assert (=> b!948690 m!880855))

(assert (=> b!948703 m!880851))

(assert (=> b!948703 m!880851))

(assert (=> b!948703 m!880855))

(declare-fun m!880857 () Bool)

(assert (=> b!948701 m!880857))

(declare-fun m!880859 () Bool)

(assert (=> b!948701 m!880859))

(declare-fun m!880861 () Bool)

(assert (=> b!948701 m!880861))

(declare-fun m!880863 () Bool)

(assert (=> b!948701 m!880863))

(declare-fun m!880865 () Bool)

(assert (=> b!948701 m!880865))

(declare-fun m!880867 () Bool)

(assert (=> b!948701 m!880867))

(declare-fun m!880869 () Bool)

(assert (=> b!948701 m!880869))

(declare-fun m!880871 () Bool)

(assert (=> b!948701 m!880871))

(declare-fun m!880873 () Bool)

(assert (=> b!948701 m!880873))

(assert (=> b!948701 m!880867))

(declare-fun m!880875 () Bool)

(assert (=> b!948701 m!880875))

(declare-fun m!880877 () Bool)

(assert (=> b!948701 m!880877))

(declare-fun m!880879 () Bool)

(assert (=> b!948701 m!880879))

(assert (=> b!948701 m!880863))

(declare-fun m!880881 () Bool)

(assert (=> b!948701 m!880881))

(declare-fun m!880883 () Bool)

(assert (=> b!948701 m!880883))

(assert (=> b!948701 m!880851))

(assert (=> b!948701 m!880861))

(declare-fun m!880885 () Bool)

(assert (=> b!948701 m!880885))

(assert (=> b!948701 m!880869))

(declare-fun m!880887 () Bool)

(assert (=> b!948701 m!880887))

(assert (=> d!114745 m!880785))

(declare-fun m!880889 () Bool)

(assert (=> bm!41222 m!880889))

(declare-fun m!880891 () Bool)

(assert (=> bm!41221 m!880891))

(declare-fun m!880893 () Bool)

(assert (=> b!948698 m!880893))

(declare-fun m!880895 () Bool)

(assert (=> b!948698 m!880895))

(declare-fun m!880897 () Bool)

(assert (=> b!948698 m!880897))

(assert (=> b!948698 m!880895))

(assert (=> b!948698 m!880851))

(declare-fun m!880899 () Bool)

(assert (=> b!948698 m!880899))

(assert (=> b!948698 m!880851))

(assert (=> b!948698 m!880893))

(assert (=> bm!41218 m!880879))

(declare-fun m!880901 () Bool)

(assert (=> b!948687 m!880901))

(declare-fun m!880903 () Bool)

(assert (=> b!948692 m!880903))

(declare-fun m!880905 () Bool)

(assert (=> bm!41223 m!880905))

(assert (=> b!948545 d!114745))

(declare-fun mapIsEmpty!32973 () Bool)

(declare-fun mapRes!32973 () Bool)

(assert (=> mapIsEmpty!32973 mapRes!32973))

(declare-fun b!948714 () Bool)

(declare-fun e!534067 () Bool)

(assert (=> b!948714 (= e!534067 tp_is_empty!20713)))

(declare-fun b!948713 () Bool)

(declare-fun e!534066 () Bool)

(assert (=> b!948713 (= e!534066 tp_is_empty!20713)))

(declare-fun mapNonEmpty!32973 () Bool)

(declare-fun tp!63210 () Bool)

(assert (=> mapNonEmpty!32973 (= mapRes!32973 (and tp!63210 e!534066))))

(declare-fun mapKey!32973 () (_ BitVec 32))

(declare-fun mapRest!32973 () (Array (_ BitVec 32) ValueCell!9875))

(declare-fun mapValue!32973 () ValueCell!9875)

(assert (=> mapNonEmpty!32973 (= mapRest!32964 (store mapRest!32973 mapKey!32973 mapValue!32973))))

(declare-fun condMapEmpty!32973 () Bool)

(declare-fun mapDefault!32973 () ValueCell!9875)

(assert (=> mapNonEmpty!32964 (= condMapEmpty!32973 (= mapRest!32964 ((as const (Array (_ BitVec 32) ValueCell!9875)) mapDefault!32973)))))

(assert (=> mapNonEmpty!32964 (= tp!63195 (and e!534067 mapRes!32973))))

(assert (= (and mapNonEmpty!32964 condMapEmpty!32973) mapIsEmpty!32973))

(assert (= (and mapNonEmpty!32964 (not condMapEmpty!32973)) mapNonEmpty!32973))

(assert (= (and mapNonEmpty!32973 ((_ is ValueCellFull!9875) mapValue!32973)) b!948713))

(assert (= (and mapNonEmpty!32964 ((_ is ValueCellFull!9875) mapDefault!32973)) b!948714))

(declare-fun m!880907 () Bool)

(assert (=> mapNonEmpty!32973 m!880907))

(declare-fun b_lambda!14315 () Bool)

(assert (= b_lambda!14313 (or (and b!948550 b_free!18205) b_lambda!14315)))

(check-sat (not b!948692) (not b!948639) (not b!948696) (not b_lambda!14315) (not b!948632) (not b_next!18205) (not b!948687) (not bm!41218) (not b!948701) (not b!948684) (not b!948631) (not d!114741) (not b!948698) (not bm!41222) (not bm!41221) (not d!114735) (not b!948619) (not d!114743) (not d!114745) (not mapNonEmpty!32973) b_and!29623 (not b!948690) tp_is_empty!20713 (not b!948703) (not b!948641) (not bm!41223) (not b!948630))
(check-sat b_and!29623 (not b_next!18205))
