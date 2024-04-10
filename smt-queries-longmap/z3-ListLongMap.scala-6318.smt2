; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81178 () Bool)

(assert start!81178)

(declare-fun b!949996 () Bool)

(declare-fun b_free!18231 () Bool)

(declare-fun b_next!18231 () Bool)

(assert (=> b!949996 (= b_free!18231 (not b_next!18231))))

(declare-fun tp!63286 () Bool)

(declare-fun b_and!29685 () Bool)

(assert (=> b!949996 (= tp!63286 b_and!29685)))

(declare-fun mapIsEmpty!33017 () Bool)

(declare-fun mapRes!33017 () Bool)

(assert (=> mapIsEmpty!33017 mapRes!33017))

(declare-fun b!949993 () Bool)

(declare-fun e!534841 () Bool)

(declare-fun tp_is_empty!20739 () Bool)

(assert (=> b!949993 (= e!534841 tp_is_empty!20739)))

(declare-fun b!949994 () Bool)

(declare-fun res!636994 () Bool)

(declare-fun e!534840 () Bool)

(assert (=> b!949994 (=> (not res!636994) (not e!534840))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32617 0))(
  ( (V!32618 (val!10420 Int)) )
))
(declare-datatypes ((ValueCell!9888 0))(
  ( (ValueCellFull!9888 (v!12962 V!32617)) (EmptyCell!9888) )
))
(declare-datatypes ((array!57494 0))(
  ( (array!57495 (arr!27648 (Array (_ BitVec 32) ValueCell!9888)) (size!28125 (_ BitVec 32))) )
))
(declare-datatypes ((array!57496 0))(
  ( (array!57497 (arr!27649 (Array (_ BitVec 32) (_ BitVec 64))) (size!28126 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4926 0))(
  ( (LongMapFixedSize!4927 (defaultEntry!5773 Int) (mask!27566 (_ BitVec 32)) (extraKeys!5505 (_ BitVec 32)) (zeroValue!5609 V!32617) (minValue!5609 V!32617) (_size!2518 (_ BitVec 32)) (_keys!10707 array!57496) (_values!5796 array!57494) (_vacant!2518 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4926)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9136 0))(
  ( (MissingZero!9136 (index!38915 (_ BitVec 32))) (Found!9136 (index!38916 (_ BitVec 32))) (Intermediate!9136 (undefined!9948 Bool) (index!38917 (_ BitVec 32)) (x!81728 (_ BitVec 32))) (Undefined!9136) (MissingVacant!9136 (index!38918 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57496 (_ BitVec 32)) SeekEntryResult!9136)

(assert (=> b!949994 (= res!636994 (not ((_ is Found!9136) (seekEntry!0 key!756 (_keys!10707 thiss!1141) (mask!27566 thiss!1141)))))))

(declare-fun mapNonEmpty!33017 () Bool)

(declare-fun tp!63285 () Bool)

(assert (=> mapNonEmpty!33017 (= mapRes!33017 (and tp!63285 e!534841))))

(declare-fun mapValue!33017 () ValueCell!9888)

(declare-fun mapKey!33017 () (_ BitVec 32))

(declare-fun mapRest!33017 () (Array (_ BitVec 32) ValueCell!9888))

(assert (=> mapNonEmpty!33017 (= (arr!27648 (_values!5796 thiss!1141)) (store mapRest!33017 mapKey!33017 mapValue!33017))))

(declare-fun b!949995 () Bool)

(declare-datatypes ((List!19333 0))(
  ( (Nil!19330) (Cons!19329 (h!20489 (_ BitVec 64)) (t!27670 List!19333)) )
))
(declare-fun arrayNoDuplicates!0 (array!57496 (_ BitVec 32) List!19333) Bool)

(assert (=> b!949995 (= e!534840 (not (arrayNoDuplicates!0 (_keys!10707 thiss!1141) #b00000000000000000000000000000000 Nil!19330)))))

(declare-fun e!534842 () Bool)

(declare-fun e!534843 () Bool)

(declare-fun array_inv!21460 (array!57496) Bool)

(declare-fun array_inv!21461 (array!57494) Bool)

(assert (=> b!949996 (= e!534842 (and tp!63286 tp_is_empty!20739 (array_inv!21460 (_keys!10707 thiss!1141)) (array_inv!21461 (_values!5796 thiss!1141)) e!534843))))

(declare-fun b!949997 () Bool)

(declare-fun res!636991 () Bool)

(assert (=> b!949997 (=> (not res!636991) (not e!534840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57496 (_ BitVec 32)) Bool)

(assert (=> b!949997 (= res!636991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10707 thiss!1141) (mask!27566 thiss!1141)))))

(declare-fun b!949998 () Bool)

(declare-fun res!636989 () Bool)

(assert (=> b!949998 (=> (not res!636989) (not e!534840))))

(assert (=> b!949998 (= res!636989 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949999 () Bool)

(declare-fun res!636992 () Bool)

(assert (=> b!949999 (=> (not res!636992) (not e!534840))))

(assert (=> b!949999 (= res!636992 (and (= (size!28125 (_values!5796 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27566 thiss!1141))) (= (size!28126 (_keys!10707 thiss!1141)) (size!28125 (_values!5796 thiss!1141))) (bvsge (mask!27566 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5505 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5505 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!950000 () Bool)

(declare-fun res!636988 () Bool)

(assert (=> b!950000 (=> (not res!636988) (not e!534840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950000 (= res!636988 (validMask!0 (mask!27566 thiss!1141)))))

(declare-fun res!636990 () Bool)

(assert (=> start!81178 (=> (not res!636990) (not e!534840))))

(declare-fun valid!1874 (LongMapFixedSize!4926) Bool)

(assert (=> start!81178 (= res!636990 (valid!1874 thiss!1141))))

(assert (=> start!81178 e!534840))

(assert (=> start!81178 e!534842))

(assert (=> start!81178 true))

(declare-fun b!949992 () Bool)

(declare-fun res!636993 () Bool)

(assert (=> b!949992 (=> (not res!636993) (not e!534840))))

(declare-datatypes ((tuple2!13542 0))(
  ( (tuple2!13543 (_1!6782 (_ BitVec 64)) (_2!6782 V!32617)) )
))
(declare-datatypes ((List!19334 0))(
  ( (Nil!19331) (Cons!19330 (h!20490 tuple2!13542) (t!27671 List!19334)) )
))
(declare-datatypes ((ListLongMap!12239 0))(
  ( (ListLongMap!12240 (toList!6135 List!19334)) )
))
(declare-fun contains!5225 (ListLongMap!12239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3368 (array!57496 array!57494 (_ BitVec 32) (_ BitVec 32) V!32617 V!32617 (_ BitVec 32) Int) ListLongMap!12239)

(assert (=> b!949992 (= res!636993 (contains!5225 (getCurrentListMap!3368 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141)) key!756))))

(declare-fun b!950001 () Bool)

(declare-fun e!534839 () Bool)

(assert (=> b!950001 (= e!534839 tp_is_empty!20739)))

(declare-fun b!950002 () Bool)

(assert (=> b!950002 (= e!534843 (and e!534839 mapRes!33017))))

(declare-fun condMapEmpty!33017 () Bool)

(declare-fun mapDefault!33017 () ValueCell!9888)

(assert (=> b!950002 (= condMapEmpty!33017 (= (arr!27648 (_values!5796 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9888)) mapDefault!33017)))))

(assert (= (and start!81178 res!636990) b!949998))

(assert (= (and b!949998 res!636989) b!949994))

(assert (= (and b!949994 res!636994) b!949992))

(assert (= (and b!949992 res!636993) b!950000))

(assert (= (and b!950000 res!636988) b!949999))

(assert (= (and b!949999 res!636992) b!949997))

(assert (= (and b!949997 res!636991) b!949995))

(assert (= (and b!950002 condMapEmpty!33017) mapIsEmpty!33017))

(assert (= (and b!950002 (not condMapEmpty!33017)) mapNonEmpty!33017))

(assert (= (and mapNonEmpty!33017 ((_ is ValueCellFull!9888) mapValue!33017)) b!949993))

(assert (= (and b!950002 ((_ is ValueCellFull!9888) mapDefault!33017)) b!950001))

(assert (= b!949996 b!950002))

(assert (= start!81178 b!949996))

(declare-fun m!882537 () Bool)

(assert (=> b!949997 m!882537))

(declare-fun m!882539 () Bool)

(assert (=> b!949992 m!882539))

(assert (=> b!949992 m!882539))

(declare-fun m!882541 () Bool)

(assert (=> b!949992 m!882541))

(declare-fun m!882543 () Bool)

(assert (=> mapNonEmpty!33017 m!882543))

(declare-fun m!882545 () Bool)

(assert (=> b!949994 m!882545))

(declare-fun m!882547 () Bool)

(assert (=> start!81178 m!882547))

(declare-fun m!882549 () Bool)

(assert (=> b!950000 m!882549))

(declare-fun m!882551 () Bool)

(assert (=> b!949996 m!882551))

(declare-fun m!882553 () Bool)

(assert (=> b!949996 m!882553))

(declare-fun m!882555 () Bool)

(assert (=> b!949995 m!882555))

(check-sat b_and!29685 (not mapNonEmpty!33017) (not b!949992) (not start!81178) (not b!949997) (not b!949996) tp_is_empty!20739 (not b!950000) (not b!949995) (not b!949994) (not b_next!18231))
(check-sat b_and!29685 (not b_next!18231))
(get-model)

(declare-fun b!950048 () Bool)

(declare-fun e!534868 () SeekEntryResult!9136)

(declare-fun e!534869 () SeekEntryResult!9136)

(assert (=> b!950048 (= e!534868 e!534869)))

(declare-fun lt!427841 () (_ BitVec 64))

(declare-fun lt!427842 () SeekEntryResult!9136)

(assert (=> b!950048 (= lt!427841 (select (arr!27649 (_keys!10707 thiss!1141)) (index!38917 lt!427842)))))

(declare-fun c!99188 () Bool)

(assert (=> b!950048 (= c!99188 (= lt!427841 key!756))))

(declare-fun b!950049 () Bool)

(declare-fun c!99189 () Bool)

(assert (=> b!950049 (= c!99189 (= lt!427841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534870 () SeekEntryResult!9136)

(assert (=> b!950049 (= e!534869 e!534870)))

(declare-fun b!950050 () Bool)

(assert (=> b!950050 (= e!534869 (Found!9136 (index!38917 lt!427842)))))

(declare-fun b!950051 () Bool)

(assert (=> b!950051 (= e!534870 (MissingZero!9136 (index!38917 lt!427842)))))

(declare-fun b!950052 () Bool)

(assert (=> b!950052 (= e!534868 Undefined!9136)))

(declare-fun b!950053 () Bool)

(declare-fun lt!427839 () SeekEntryResult!9136)

(assert (=> b!950053 (= e!534870 (ite ((_ is MissingVacant!9136) lt!427839) (MissingZero!9136 (index!38918 lt!427839)) lt!427839))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57496 (_ BitVec 32)) SeekEntryResult!9136)

(assert (=> b!950053 (= lt!427839 (seekKeyOrZeroReturnVacant!0 (x!81728 lt!427842) (index!38917 lt!427842) (index!38917 lt!427842) key!756 (_keys!10707 thiss!1141) (mask!27566 thiss!1141)))))

(declare-fun d!115145 () Bool)

(declare-fun lt!427840 () SeekEntryResult!9136)

(assert (=> d!115145 (and (or ((_ is MissingVacant!9136) lt!427840) (not ((_ is Found!9136) lt!427840)) (and (bvsge (index!38916 lt!427840) #b00000000000000000000000000000000) (bvslt (index!38916 lt!427840) (size!28126 (_keys!10707 thiss!1141))))) (not ((_ is MissingVacant!9136) lt!427840)) (or (not ((_ is Found!9136) lt!427840)) (= (select (arr!27649 (_keys!10707 thiss!1141)) (index!38916 lt!427840)) key!756)))))

(assert (=> d!115145 (= lt!427840 e!534868)))

(declare-fun c!99190 () Bool)

(assert (=> d!115145 (= c!99190 (and ((_ is Intermediate!9136) lt!427842) (undefined!9948 lt!427842)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57496 (_ BitVec 32)) SeekEntryResult!9136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115145 (= lt!427842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27566 thiss!1141)) key!756 (_keys!10707 thiss!1141) (mask!27566 thiss!1141)))))

(assert (=> d!115145 (validMask!0 (mask!27566 thiss!1141))))

(assert (=> d!115145 (= (seekEntry!0 key!756 (_keys!10707 thiss!1141) (mask!27566 thiss!1141)) lt!427840)))

(assert (= (and d!115145 c!99190) b!950052))

(assert (= (and d!115145 (not c!99190)) b!950048))

(assert (= (and b!950048 c!99188) b!950050))

(assert (= (and b!950048 (not c!99188)) b!950049))

(assert (= (and b!950049 c!99189) b!950051))

(assert (= (and b!950049 (not c!99189)) b!950053))

(declare-fun m!882577 () Bool)

(assert (=> b!950048 m!882577))

(declare-fun m!882579 () Bool)

(assert (=> b!950053 m!882579))

(declare-fun m!882581 () Bool)

(assert (=> d!115145 m!882581))

(declare-fun m!882583 () Bool)

(assert (=> d!115145 m!882583))

(assert (=> d!115145 m!882583))

(declare-fun m!882585 () Bool)

(assert (=> d!115145 m!882585))

(assert (=> d!115145 m!882549))

(assert (=> b!949994 d!115145))

(declare-fun b!950062 () Bool)

(declare-fun e!534877 () Bool)

(declare-fun call!41346 () Bool)

(assert (=> b!950062 (= e!534877 call!41346)))

(declare-fun d!115147 () Bool)

(declare-fun res!637021 () Bool)

(declare-fun e!534878 () Bool)

(assert (=> d!115147 (=> res!637021 e!534878)))

(assert (=> d!115147 (= res!637021 (bvsge #b00000000000000000000000000000000 (size!28126 (_keys!10707 thiss!1141))))))

(assert (=> d!115147 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10707 thiss!1141) (mask!27566 thiss!1141)) e!534878)))

(declare-fun b!950063 () Bool)

(assert (=> b!950063 (= e!534878 e!534877)))

(declare-fun c!99193 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950063 (= c!99193 (validKeyInArray!0 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950064 () Bool)

(declare-fun e!534879 () Bool)

(assert (=> b!950064 (= e!534877 e!534879)))

(declare-fun lt!427851 () (_ BitVec 64))

(assert (=> b!950064 (= lt!427851 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31985 0))(
  ( (Unit!31986) )
))
(declare-fun lt!427850 () Unit!31985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57496 (_ BitVec 64) (_ BitVec 32)) Unit!31985)

(assert (=> b!950064 (= lt!427850 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10707 thiss!1141) lt!427851 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950064 (arrayContainsKey!0 (_keys!10707 thiss!1141) lt!427851 #b00000000000000000000000000000000)))

(declare-fun lt!427849 () Unit!31985)

(assert (=> b!950064 (= lt!427849 lt!427850)))

(declare-fun res!637020 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57496 (_ BitVec 32)) SeekEntryResult!9136)

(assert (=> b!950064 (= res!637020 (= (seekEntryOrOpen!0 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000) (_keys!10707 thiss!1141) (mask!27566 thiss!1141)) (Found!9136 #b00000000000000000000000000000000)))))

(assert (=> b!950064 (=> (not res!637020) (not e!534879))))

(declare-fun b!950065 () Bool)

(assert (=> b!950065 (= e!534879 call!41346)))

(declare-fun bm!41343 () Bool)

(assert (=> bm!41343 (= call!41346 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10707 thiss!1141) (mask!27566 thiss!1141)))))

(assert (= (and d!115147 (not res!637021)) b!950063))

(assert (= (and b!950063 c!99193) b!950064))

(assert (= (and b!950063 (not c!99193)) b!950062))

(assert (= (and b!950064 res!637020) b!950065))

(assert (= (or b!950065 b!950062) bm!41343))

(declare-fun m!882587 () Bool)

(assert (=> b!950063 m!882587))

(assert (=> b!950063 m!882587))

(declare-fun m!882589 () Bool)

(assert (=> b!950063 m!882589))

(assert (=> b!950064 m!882587))

(declare-fun m!882591 () Bool)

(assert (=> b!950064 m!882591))

(declare-fun m!882593 () Bool)

(assert (=> b!950064 m!882593))

(assert (=> b!950064 m!882587))

(declare-fun m!882595 () Bool)

(assert (=> b!950064 m!882595))

(declare-fun m!882597 () Bool)

(assert (=> bm!41343 m!882597))

(assert (=> b!949997 d!115147))

(declare-fun d!115149 () Bool)

(declare-fun e!534884 () Bool)

(assert (=> d!115149 e!534884))

(declare-fun res!637024 () Bool)

(assert (=> d!115149 (=> res!637024 e!534884)))

(declare-fun lt!427860 () Bool)

(assert (=> d!115149 (= res!637024 (not lt!427860))))

(declare-fun lt!427861 () Bool)

(assert (=> d!115149 (= lt!427860 lt!427861)))

(declare-fun lt!427862 () Unit!31985)

(declare-fun e!534885 () Unit!31985)

(assert (=> d!115149 (= lt!427862 e!534885)))

(declare-fun c!99196 () Bool)

(assert (=> d!115149 (= c!99196 lt!427861)))

(declare-fun containsKey!463 (List!19334 (_ BitVec 64)) Bool)

(assert (=> d!115149 (= lt!427861 (containsKey!463 (toList!6135 (getCurrentListMap!3368 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141))) key!756))))

(assert (=> d!115149 (= (contains!5225 (getCurrentListMap!3368 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141)) key!756) lt!427860)))

(declare-fun b!950072 () Bool)

(declare-fun lt!427863 () Unit!31985)

(assert (=> b!950072 (= e!534885 lt!427863)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!359 (List!19334 (_ BitVec 64)) Unit!31985)

(assert (=> b!950072 (= lt!427863 (lemmaContainsKeyImpliesGetValueByKeyDefined!359 (toList!6135 (getCurrentListMap!3368 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141))) key!756))))

(declare-datatypes ((Option!502 0))(
  ( (Some!501 (v!12964 V!32617)) (None!500) )
))
(declare-fun isDefined!368 (Option!502) Bool)

(declare-fun getValueByKey!496 (List!19334 (_ BitVec 64)) Option!502)

(assert (=> b!950072 (isDefined!368 (getValueByKey!496 (toList!6135 (getCurrentListMap!3368 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141))) key!756))))

(declare-fun b!950073 () Bool)

(declare-fun Unit!31987 () Unit!31985)

(assert (=> b!950073 (= e!534885 Unit!31987)))

(declare-fun b!950074 () Bool)

(assert (=> b!950074 (= e!534884 (isDefined!368 (getValueByKey!496 (toList!6135 (getCurrentListMap!3368 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141))) key!756)))))

(assert (= (and d!115149 c!99196) b!950072))

(assert (= (and d!115149 (not c!99196)) b!950073))

(assert (= (and d!115149 (not res!637024)) b!950074))

(declare-fun m!882599 () Bool)

(assert (=> d!115149 m!882599))

(declare-fun m!882601 () Bool)

(assert (=> b!950072 m!882601))

(declare-fun m!882603 () Bool)

(assert (=> b!950072 m!882603))

(assert (=> b!950072 m!882603))

(declare-fun m!882605 () Bool)

(assert (=> b!950072 m!882605))

(assert (=> b!950074 m!882603))

(assert (=> b!950074 m!882603))

(assert (=> b!950074 m!882605))

(assert (=> b!949992 d!115149))

(declare-fun b!950117 () Bool)

(declare-fun res!637044 () Bool)

(declare-fun e!534917 () Bool)

(assert (=> b!950117 (=> (not res!637044) (not e!534917))))

(declare-fun e!534923 () Bool)

(assert (=> b!950117 (= res!637044 e!534923)))

(declare-fun c!99214 () Bool)

(assert (=> b!950117 (= c!99214 (not (= (bvand (extraKeys!5505 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!950118 () Bool)

(declare-fun e!534916 () Bool)

(declare-fun e!534921 () Bool)

(assert (=> b!950118 (= e!534916 e!534921)))

(declare-fun res!637046 () Bool)

(assert (=> b!950118 (=> (not res!637046) (not e!534921))))

(declare-fun lt!427918 () ListLongMap!12239)

(assert (=> b!950118 (= res!637046 (contains!5225 lt!427918 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950118 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10707 thiss!1141))))))

(declare-fun call!41365 () ListLongMap!12239)

(declare-fun c!99211 () Bool)

(declare-fun call!41364 () ListLongMap!12239)

(declare-fun call!41362 () ListLongMap!12239)

(declare-fun bm!41358 () Bool)

(declare-fun c!99210 () Bool)

(declare-fun call!41367 () ListLongMap!12239)

(declare-fun +!2861 (ListLongMap!12239 tuple2!13542) ListLongMap!12239)

(assert (=> bm!41358 (= call!41364 (+!2861 (ite c!99210 call!41365 (ite c!99211 call!41367 call!41362)) (ite (or c!99210 c!99211) (tuple2!13543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5609 thiss!1141)) (tuple2!13543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5609 thiss!1141)))))))

(declare-fun d!115151 () Bool)

(assert (=> d!115151 e!534917))

(declare-fun res!637049 () Bool)

(assert (=> d!115151 (=> (not res!637049) (not e!534917))))

(assert (=> d!115151 (= res!637049 (or (bvsge #b00000000000000000000000000000000 (size!28126 (_keys!10707 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10707 thiss!1141))))))))

(declare-fun lt!427916 () ListLongMap!12239)

(assert (=> d!115151 (= lt!427918 lt!427916)))

(declare-fun lt!427909 () Unit!31985)

(declare-fun e!534918 () Unit!31985)

(assert (=> d!115151 (= lt!427909 e!534918)))

(declare-fun c!99209 () Bool)

(declare-fun e!534922 () Bool)

(assert (=> d!115151 (= c!99209 e!534922)))

(declare-fun res!637048 () Bool)

(assert (=> d!115151 (=> (not res!637048) (not e!534922))))

(assert (=> d!115151 (= res!637048 (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10707 thiss!1141))))))

(declare-fun e!534913 () ListLongMap!12239)

(assert (=> d!115151 (= lt!427916 e!534913)))

(assert (=> d!115151 (= c!99210 (and (not (= (bvand (extraKeys!5505 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5505 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115151 (validMask!0 (mask!27566 thiss!1141))))

(assert (=> d!115151 (= (getCurrentListMap!3368 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141)) lt!427918)))

(declare-fun b!950119 () Bool)

(declare-fun e!534915 () Bool)

(declare-fun call!41366 () Bool)

(assert (=> b!950119 (= e!534915 (not call!41366))))

(declare-fun b!950120 () Bool)

(declare-fun e!534912 () Bool)

(assert (=> b!950120 (= e!534912 (validKeyInArray!0 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41359 () Bool)

(assert (=> bm!41359 (= call!41366 (contains!5225 lt!427918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950121 () Bool)

(declare-fun apply!877 (ListLongMap!12239 (_ BitVec 64)) V!32617)

(declare-fun get!14530 (ValueCell!9888 V!32617) V!32617)

(declare-fun dynLambda!1650 (Int (_ BitVec 64)) V!32617)

(assert (=> b!950121 (= e!534921 (= (apply!877 lt!427918 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000)) (get!14530 (select (arr!27648 (_values!5796 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1650 (defaultEntry!5773 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28125 (_values!5796 thiss!1141))))))

(assert (=> b!950121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10707 thiss!1141))))))

(declare-fun b!950122 () Bool)

(declare-fun c!99212 () Bool)

(assert (=> b!950122 (= c!99212 (and (not (= (bvand (extraKeys!5505 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5505 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!534919 () ListLongMap!12239)

(declare-fun e!534924 () ListLongMap!12239)

(assert (=> b!950122 (= e!534919 e!534924)))

(declare-fun b!950123 () Bool)

(declare-fun lt!427920 () Unit!31985)

(assert (=> b!950123 (= e!534918 lt!427920)))

(declare-fun lt!427929 () ListLongMap!12239)

(declare-fun getCurrentListMapNoExtraKeys!3316 (array!57496 array!57494 (_ BitVec 32) (_ BitVec 32) V!32617 V!32617 (_ BitVec 32) Int) ListLongMap!12239)

(assert (=> b!950123 (= lt!427929 (getCurrentListMapNoExtraKeys!3316 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141)))))

(declare-fun lt!427922 () (_ BitVec 64))

(assert (=> b!950123 (= lt!427922 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427924 () (_ BitVec 64))

(assert (=> b!950123 (= lt!427924 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427927 () Unit!31985)

(declare-fun addStillContains!580 (ListLongMap!12239 (_ BitVec 64) V!32617 (_ BitVec 64)) Unit!31985)

(assert (=> b!950123 (= lt!427927 (addStillContains!580 lt!427929 lt!427922 (zeroValue!5609 thiss!1141) lt!427924))))

(assert (=> b!950123 (contains!5225 (+!2861 lt!427929 (tuple2!13543 lt!427922 (zeroValue!5609 thiss!1141))) lt!427924)))

(declare-fun lt!427912 () Unit!31985)

(assert (=> b!950123 (= lt!427912 lt!427927)))

(declare-fun lt!427919 () ListLongMap!12239)

(assert (=> b!950123 (= lt!427919 (getCurrentListMapNoExtraKeys!3316 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141)))))

(declare-fun lt!427915 () (_ BitVec 64))

(assert (=> b!950123 (= lt!427915 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427910 () (_ BitVec 64))

(assert (=> b!950123 (= lt!427910 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427925 () Unit!31985)

(declare-fun addApplyDifferent!460 (ListLongMap!12239 (_ BitVec 64) V!32617 (_ BitVec 64)) Unit!31985)

(assert (=> b!950123 (= lt!427925 (addApplyDifferent!460 lt!427919 lt!427915 (minValue!5609 thiss!1141) lt!427910))))

(assert (=> b!950123 (= (apply!877 (+!2861 lt!427919 (tuple2!13543 lt!427915 (minValue!5609 thiss!1141))) lt!427910) (apply!877 lt!427919 lt!427910))))

(declare-fun lt!427908 () Unit!31985)

(assert (=> b!950123 (= lt!427908 lt!427925)))

(declare-fun lt!427911 () ListLongMap!12239)

(assert (=> b!950123 (= lt!427911 (getCurrentListMapNoExtraKeys!3316 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141)))))

(declare-fun lt!427923 () (_ BitVec 64))

(assert (=> b!950123 (= lt!427923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427928 () (_ BitVec 64))

(assert (=> b!950123 (= lt!427928 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427921 () Unit!31985)

(assert (=> b!950123 (= lt!427921 (addApplyDifferent!460 lt!427911 lt!427923 (zeroValue!5609 thiss!1141) lt!427928))))

(assert (=> b!950123 (= (apply!877 (+!2861 lt!427911 (tuple2!13543 lt!427923 (zeroValue!5609 thiss!1141))) lt!427928) (apply!877 lt!427911 lt!427928))))

(declare-fun lt!427913 () Unit!31985)

(assert (=> b!950123 (= lt!427913 lt!427921)))

(declare-fun lt!427917 () ListLongMap!12239)

(assert (=> b!950123 (= lt!427917 (getCurrentListMapNoExtraKeys!3316 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141)))))

(declare-fun lt!427914 () (_ BitVec 64))

(assert (=> b!950123 (= lt!427914 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427926 () (_ BitVec 64))

(assert (=> b!950123 (= lt!427926 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950123 (= lt!427920 (addApplyDifferent!460 lt!427917 lt!427914 (minValue!5609 thiss!1141) lt!427926))))

(assert (=> b!950123 (= (apply!877 (+!2861 lt!427917 (tuple2!13543 lt!427914 (minValue!5609 thiss!1141))) lt!427926) (apply!877 lt!427917 lt!427926))))

(declare-fun b!950124 () Bool)

(declare-fun Unit!31988 () Unit!31985)

(assert (=> b!950124 (= e!534918 Unit!31988)))

(declare-fun b!950125 () Bool)

(assert (=> b!950125 (= e!534922 (validKeyInArray!0 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950126 () Bool)

(declare-fun call!41361 () ListLongMap!12239)

(assert (=> b!950126 (= e!534919 call!41361)))

(declare-fun b!950127 () Bool)

(assert (=> b!950127 (= e!534917 e!534915)))

(declare-fun c!99213 () Bool)

(assert (=> b!950127 (= c!99213 (not (= (bvand (extraKeys!5505 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950128 () Bool)

(assert (=> b!950128 (= e!534924 call!41361)))

(declare-fun bm!41360 () Bool)

(assert (=> bm!41360 (= call!41361 call!41364)))

(declare-fun b!950129 () Bool)

(declare-fun e!534914 () Bool)

(assert (=> b!950129 (= e!534914 (= (apply!877 lt!427918 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5609 thiss!1141)))))

(declare-fun b!950130 () Bool)

(declare-fun e!534920 () Bool)

(assert (=> b!950130 (= e!534923 e!534920)))

(declare-fun res!637051 () Bool)

(declare-fun call!41363 () Bool)

(assert (=> b!950130 (= res!637051 call!41363)))

(assert (=> b!950130 (=> (not res!637051) (not e!534920))))

(declare-fun b!950131 () Bool)

(assert (=> b!950131 (= e!534913 (+!2861 call!41364 (tuple2!13543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5609 thiss!1141))))))

(declare-fun b!950132 () Bool)

(assert (=> b!950132 (= e!534915 e!534914)))

(declare-fun res!637043 () Bool)

(assert (=> b!950132 (= res!637043 call!41366)))

(assert (=> b!950132 (=> (not res!637043) (not e!534914))))

(declare-fun b!950133 () Bool)

(declare-fun res!637045 () Bool)

(assert (=> b!950133 (=> (not res!637045) (not e!534917))))

(assert (=> b!950133 (= res!637045 e!534916)))

(declare-fun res!637050 () Bool)

(assert (=> b!950133 (=> res!637050 e!534916)))

(assert (=> b!950133 (= res!637050 (not e!534912))))

(declare-fun res!637047 () Bool)

(assert (=> b!950133 (=> (not res!637047) (not e!534912))))

(assert (=> b!950133 (= res!637047 (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10707 thiss!1141))))))

(declare-fun bm!41361 () Bool)

(assert (=> bm!41361 (= call!41365 (getCurrentListMapNoExtraKeys!3316 (_keys!10707 thiss!1141) (_values!5796 thiss!1141) (mask!27566 thiss!1141) (extraKeys!5505 thiss!1141) (zeroValue!5609 thiss!1141) (minValue!5609 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5773 thiss!1141)))))

(declare-fun bm!41362 () Bool)

(assert (=> bm!41362 (= call!41362 call!41367)))

(declare-fun b!950134 () Bool)

(assert (=> b!950134 (= e!534913 e!534919)))

(assert (=> b!950134 (= c!99211 (and (not (= (bvand (extraKeys!5505 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5505 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41363 () Bool)

(assert (=> bm!41363 (= call!41363 (contains!5225 lt!427918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41364 () Bool)

(assert (=> bm!41364 (= call!41367 call!41365)))

(declare-fun b!950135 () Bool)

(assert (=> b!950135 (= e!534920 (= (apply!877 lt!427918 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5609 thiss!1141)))))

(declare-fun b!950136 () Bool)

(assert (=> b!950136 (= e!534923 (not call!41363))))

(declare-fun b!950137 () Bool)

(assert (=> b!950137 (= e!534924 call!41362)))

(assert (= (and d!115151 c!99210) b!950131))

(assert (= (and d!115151 (not c!99210)) b!950134))

(assert (= (and b!950134 c!99211) b!950126))

(assert (= (and b!950134 (not c!99211)) b!950122))

(assert (= (and b!950122 c!99212) b!950128))

(assert (= (and b!950122 (not c!99212)) b!950137))

(assert (= (or b!950128 b!950137) bm!41362))

(assert (= (or b!950126 bm!41362) bm!41364))

(assert (= (or b!950126 b!950128) bm!41360))

(assert (= (or b!950131 bm!41364) bm!41361))

(assert (= (or b!950131 bm!41360) bm!41358))

(assert (= (and d!115151 res!637048) b!950125))

(assert (= (and d!115151 c!99209) b!950123))

(assert (= (and d!115151 (not c!99209)) b!950124))

(assert (= (and d!115151 res!637049) b!950133))

(assert (= (and b!950133 res!637047) b!950120))

(assert (= (and b!950133 (not res!637050)) b!950118))

(assert (= (and b!950118 res!637046) b!950121))

(assert (= (and b!950133 res!637045) b!950117))

(assert (= (and b!950117 c!99214) b!950130))

(assert (= (and b!950117 (not c!99214)) b!950136))

(assert (= (and b!950130 res!637051) b!950135))

(assert (= (or b!950130 b!950136) bm!41363))

(assert (= (and b!950117 res!637044) b!950127))

(assert (= (and b!950127 c!99213) b!950132))

(assert (= (and b!950127 (not c!99213)) b!950119))

(assert (= (and b!950132 res!637043) b!950129))

(assert (= (or b!950132 b!950119) bm!41359))

(declare-fun b_lambda!14363 () Bool)

(assert (=> (not b_lambda!14363) (not b!950121)))

(declare-fun t!27673 () Bool)

(declare-fun tb!6189 () Bool)

(assert (=> (and b!949996 (= (defaultEntry!5773 thiss!1141) (defaultEntry!5773 thiss!1141)) t!27673) tb!6189))

(declare-fun result!12289 () Bool)

(assert (=> tb!6189 (= result!12289 tp_is_empty!20739)))

(assert (=> b!950121 t!27673))

(declare-fun b_and!29689 () Bool)

(assert (= b_and!29685 (and (=> t!27673 result!12289) b_and!29689)))

(declare-fun m!882607 () Bool)

(assert (=> b!950129 m!882607))

(declare-fun m!882609 () Bool)

(assert (=> b!950131 m!882609))

(declare-fun m!882611 () Bool)

(assert (=> bm!41359 m!882611))

(assert (=> b!950118 m!882587))

(assert (=> b!950118 m!882587))

(declare-fun m!882613 () Bool)

(assert (=> b!950118 m!882613))

(declare-fun m!882615 () Bool)

(assert (=> bm!41358 m!882615))

(declare-fun m!882617 () Bool)

(assert (=> bm!41363 m!882617))

(declare-fun m!882619 () Bool)

(assert (=> b!950123 m!882619))

(declare-fun m!882621 () Bool)

(assert (=> b!950123 m!882621))

(declare-fun m!882623 () Bool)

(assert (=> b!950123 m!882623))

(declare-fun m!882625 () Bool)

(assert (=> b!950123 m!882625))

(declare-fun m!882627 () Bool)

(assert (=> b!950123 m!882627))

(declare-fun m!882629 () Bool)

(assert (=> b!950123 m!882629))

(declare-fun m!882631 () Bool)

(assert (=> b!950123 m!882631))

(declare-fun m!882633 () Bool)

(assert (=> b!950123 m!882633))

(declare-fun m!882635 () Bool)

(assert (=> b!950123 m!882635))

(declare-fun m!882637 () Bool)

(assert (=> b!950123 m!882637))

(assert (=> b!950123 m!882635))

(assert (=> b!950123 m!882619))

(declare-fun m!882639 () Bool)

(assert (=> b!950123 m!882639))

(assert (=> b!950123 m!882631))

(assert (=> b!950123 m!882629))

(declare-fun m!882641 () Bool)

(assert (=> b!950123 m!882641))

(assert (=> b!950123 m!882587))

(declare-fun m!882643 () Bool)

(assert (=> b!950123 m!882643))

(declare-fun m!882645 () Bool)

(assert (=> b!950123 m!882645))

(declare-fun m!882647 () Bool)

(assert (=> b!950123 m!882647))

(declare-fun m!882649 () Bool)

(assert (=> b!950123 m!882649))

(assert (=> b!950125 m!882587))

(assert (=> b!950125 m!882587))

(assert (=> b!950125 m!882589))

(assert (=> d!115151 m!882549))

(assert (=> bm!41361 m!882625))

(declare-fun m!882651 () Bool)

(assert (=> b!950135 m!882651))

(assert (=> b!950121 m!882587))

(declare-fun m!882653 () Bool)

(assert (=> b!950121 m!882653))

(declare-fun m!882655 () Bool)

(assert (=> b!950121 m!882655))

(assert (=> b!950121 m!882587))

(declare-fun m!882657 () Bool)

(assert (=> b!950121 m!882657))

(assert (=> b!950121 m!882655))

(declare-fun m!882659 () Bool)

(assert (=> b!950121 m!882659))

(assert (=> b!950121 m!882657))

(assert (=> b!950120 m!882587))

(assert (=> b!950120 m!882587))

(assert (=> b!950120 m!882589))

(assert (=> b!949992 d!115151))

(declare-fun d!115153 () Bool)

(assert (=> d!115153 (= (array_inv!21460 (_keys!10707 thiss!1141)) (bvsge (size!28126 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949996 d!115153))

(declare-fun d!115155 () Bool)

(assert (=> d!115155 (= (array_inv!21461 (_values!5796 thiss!1141)) (bvsge (size!28125 (_values!5796 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949996 d!115155))

(declare-fun d!115157 () Bool)

(declare-fun res!637058 () Bool)

(declare-fun e!534927 () Bool)

(assert (=> d!115157 (=> (not res!637058) (not e!534927))))

(declare-fun simpleValid!373 (LongMapFixedSize!4926) Bool)

(assert (=> d!115157 (= res!637058 (simpleValid!373 thiss!1141))))

(assert (=> d!115157 (= (valid!1874 thiss!1141) e!534927)))

(declare-fun b!950146 () Bool)

(declare-fun res!637059 () Bool)

(assert (=> b!950146 (=> (not res!637059) (not e!534927))))

(declare-fun arrayCountValidKeys!0 (array!57496 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950146 (= res!637059 (= (arrayCountValidKeys!0 (_keys!10707 thiss!1141) #b00000000000000000000000000000000 (size!28126 (_keys!10707 thiss!1141))) (_size!2518 thiss!1141)))))

(declare-fun b!950147 () Bool)

(declare-fun res!637060 () Bool)

(assert (=> b!950147 (=> (not res!637060) (not e!534927))))

(assert (=> b!950147 (= res!637060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10707 thiss!1141) (mask!27566 thiss!1141)))))

(declare-fun b!950148 () Bool)

(assert (=> b!950148 (= e!534927 (arrayNoDuplicates!0 (_keys!10707 thiss!1141) #b00000000000000000000000000000000 Nil!19330))))

(assert (= (and d!115157 res!637058) b!950146))

(assert (= (and b!950146 res!637059) b!950147))

(assert (= (and b!950147 res!637060) b!950148))

(declare-fun m!882661 () Bool)

(assert (=> d!115157 m!882661))

(declare-fun m!882663 () Bool)

(assert (=> b!950146 m!882663))

(assert (=> b!950147 m!882537))

(assert (=> b!950148 m!882555))

(assert (=> start!81178 d!115157))

(declare-fun bm!41367 () Bool)

(declare-fun call!41370 () Bool)

(declare-fun c!99217 () Bool)

(assert (=> bm!41367 (= call!41370 (arrayNoDuplicates!0 (_keys!10707 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99217 (Cons!19329 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000) Nil!19330) Nil!19330)))))

(declare-fun b!950160 () Bool)

(declare-fun e!534938 () Bool)

(assert (=> b!950160 (= e!534938 call!41370)))

(declare-fun b!950161 () Bool)

(declare-fun e!534937 () Bool)

(assert (=> b!950161 (= e!534937 e!534938)))

(assert (=> b!950161 (= c!99217 (validKeyInArray!0 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950162 () Bool)

(assert (=> b!950162 (= e!534938 call!41370)))

(declare-fun b!950163 () Bool)

(declare-fun e!534936 () Bool)

(declare-fun contains!5226 (List!19333 (_ BitVec 64)) Bool)

(assert (=> b!950163 (= e!534936 (contains!5226 Nil!19330 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950159 () Bool)

(declare-fun e!534939 () Bool)

(assert (=> b!950159 (= e!534939 e!534937)))

(declare-fun res!637067 () Bool)

(assert (=> b!950159 (=> (not res!637067) (not e!534937))))

(assert (=> b!950159 (= res!637067 (not e!534936))))

(declare-fun res!637069 () Bool)

(assert (=> b!950159 (=> (not res!637069) (not e!534936))))

(assert (=> b!950159 (= res!637069 (validKeyInArray!0 (select (arr!27649 (_keys!10707 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115159 () Bool)

(declare-fun res!637068 () Bool)

(assert (=> d!115159 (=> res!637068 e!534939)))

(assert (=> d!115159 (= res!637068 (bvsge #b00000000000000000000000000000000 (size!28126 (_keys!10707 thiss!1141))))))

(assert (=> d!115159 (= (arrayNoDuplicates!0 (_keys!10707 thiss!1141) #b00000000000000000000000000000000 Nil!19330) e!534939)))

(assert (= (and d!115159 (not res!637068)) b!950159))

(assert (= (and b!950159 res!637069) b!950163))

(assert (= (and b!950159 res!637067) b!950161))

(assert (= (and b!950161 c!99217) b!950162))

(assert (= (and b!950161 (not c!99217)) b!950160))

(assert (= (or b!950162 b!950160) bm!41367))

(assert (=> bm!41367 m!882587))

(declare-fun m!882665 () Bool)

(assert (=> bm!41367 m!882665))

(assert (=> b!950161 m!882587))

(assert (=> b!950161 m!882587))

(assert (=> b!950161 m!882589))

(assert (=> b!950163 m!882587))

(assert (=> b!950163 m!882587))

(declare-fun m!882667 () Bool)

(assert (=> b!950163 m!882667))

(assert (=> b!950159 m!882587))

(assert (=> b!950159 m!882587))

(assert (=> b!950159 m!882589))

(assert (=> b!949995 d!115159))

(declare-fun d!115161 () Bool)

(assert (=> d!115161 (= (validMask!0 (mask!27566 thiss!1141)) (and (or (= (mask!27566 thiss!1141) #b00000000000000000000000000000111) (= (mask!27566 thiss!1141) #b00000000000000000000000000001111) (= (mask!27566 thiss!1141) #b00000000000000000000000000011111) (= (mask!27566 thiss!1141) #b00000000000000000000000000111111) (= (mask!27566 thiss!1141) #b00000000000000000000000001111111) (= (mask!27566 thiss!1141) #b00000000000000000000000011111111) (= (mask!27566 thiss!1141) #b00000000000000000000000111111111) (= (mask!27566 thiss!1141) #b00000000000000000000001111111111) (= (mask!27566 thiss!1141) #b00000000000000000000011111111111) (= (mask!27566 thiss!1141) #b00000000000000000000111111111111) (= (mask!27566 thiss!1141) #b00000000000000000001111111111111) (= (mask!27566 thiss!1141) #b00000000000000000011111111111111) (= (mask!27566 thiss!1141) #b00000000000000000111111111111111) (= (mask!27566 thiss!1141) #b00000000000000001111111111111111) (= (mask!27566 thiss!1141) #b00000000000000011111111111111111) (= (mask!27566 thiss!1141) #b00000000000000111111111111111111) (= (mask!27566 thiss!1141) #b00000000000001111111111111111111) (= (mask!27566 thiss!1141) #b00000000000011111111111111111111) (= (mask!27566 thiss!1141) #b00000000000111111111111111111111) (= (mask!27566 thiss!1141) #b00000000001111111111111111111111) (= (mask!27566 thiss!1141) #b00000000011111111111111111111111) (= (mask!27566 thiss!1141) #b00000000111111111111111111111111) (= (mask!27566 thiss!1141) #b00000001111111111111111111111111) (= (mask!27566 thiss!1141) #b00000011111111111111111111111111) (= (mask!27566 thiss!1141) #b00000111111111111111111111111111) (= (mask!27566 thiss!1141) #b00001111111111111111111111111111) (= (mask!27566 thiss!1141) #b00011111111111111111111111111111) (= (mask!27566 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27566 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950000 d!115161))

(declare-fun b!950171 () Bool)

(declare-fun e!534945 () Bool)

(assert (=> b!950171 (= e!534945 tp_is_empty!20739)))

(declare-fun mapIsEmpty!33023 () Bool)

(declare-fun mapRes!33023 () Bool)

(assert (=> mapIsEmpty!33023 mapRes!33023))

(declare-fun b!950170 () Bool)

(declare-fun e!534944 () Bool)

(assert (=> b!950170 (= e!534944 tp_is_empty!20739)))

(declare-fun condMapEmpty!33023 () Bool)

(declare-fun mapDefault!33023 () ValueCell!9888)

(assert (=> mapNonEmpty!33017 (= condMapEmpty!33023 (= mapRest!33017 ((as const (Array (_ BitVec 32) ValueCell!9888)) mapDefault!33023)))))

(assert (=> mapNonEmpty!33017 (= tp!63285 (and e!534945 mapRes!33023))))

(declare-fun mapNonEmpty!33023 () Bool)

(declare-fun tp!63295 () Bool)

(assert (=> mapNonEmpty!33023 (= mapRes!33023 (and tp!63295 e!534944))))

(declare-fun mapRest!33023 () (Array (_ BitVec 32) ValueCell!9888))

(declare-fun mapKey!33023 () (_ BitVec 32))

(declare-fun mapValue!33023 () ValueCell!9888)

(assert (=> mapNonEmpty!33023 (= mapRest!33017 (store mapRest!33023 mapKey!33023 mapValue!33023))))

(assert (= (and mapNonEmpty!33017 condMapEmpty!33023) mapIsEmpty!33023))

(assert (= (and mapNonEmpty!33017 (not condMapEmpty!33023)) mapNonEmpty!33023))

(assert (= (and mapNonEmpty!33023 ((_ is ValueCellFull!9888) mapValue!33023)) b!950170))

(assert (= (and mapNonEmpty!33017 ((_ is ValueCellFull!9888) mapDefault!33023)) b!950171))

(declare-fun m!882669 () Bool)

(assert (=> mapNonEmpty!33023 m!882669))

(declare-fun b_lambda!14365 () Bool)

(assert (= b_lambda!14363 (or (and b!949996 b_free!18231) b_lambda!14365)))

(check-sat (not b!950161) (not b!950125) (not b!950148) tp_is_empty!20739 (not b!950074) (not b!950147) (not b!950120) (not d!115149) (not b!950118) (not b!950159) (not b!950072) (not b!950063) (not d!115145) (not bm!41359) (not b!950129) (not b!950121) (not b!950131) (not b!950123) (not bm!41367) (not bm!41343) (not mapNonEmpty!33023) (not b_lambda!14365) (not d!115157) (not b!950146) (not d!115151) b_and!29689 (not b_next!18231) (not b!950053) (not b!950064) (not bm!41361) (not bm!41363) (not b!950163) (not b!950135) (not bm!41358))
(check-sat b_and!29689 (not b_next!18231))
