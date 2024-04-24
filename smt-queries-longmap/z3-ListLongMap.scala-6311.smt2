; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81058 () Bool)

(assert start!81058)

(declare-fun b!948736 () Bool)

(declare-fun b_free!18187 () Bool)

(declare-fun b_next!18187 () Bool)

(assert (=> b!948736 (= b_free!18187 (not b_next!18187))))

(declare-fun tp!63130 () Bool)

(declare-fun b_and!29621 () Bool)

(assert (=> b!948736 (= tp!63130 b_and!29621)))

(declare-fun b!948730 () Bool)

(declare-fun res!636381 () Bool)

(declare-fun e!534111 () Bool)

(assert (=> b!948730 (=> (not res!636381) (not e!534111))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32559 0))(
  ( (V!32560 (val!10398 Int)) )
))
(declare-datatypes ((ValueCell!9866 0))(
  ( (ValueCellFull!9866 (v!12930 V!32559)) (EmptyCell!9866) )
))
(declare-datatypes ((array!57443 0))(
  ( (array!57444 (arr!27625 (Array (_ BitVec 32) ValueCell!9866)) (size!28099 (_ BitVec 32))) )
))
(declare-datatypes ((array!57445 0))(
  ( (array!57446 (arr!27626 (Array (_ BitVec 32) (_ BitVec 64))) (size!28100 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4882 0))(
  ( (LongMapFixedSize!4883 (defaultEntry!5740 Int) (mask!27531 (_ BitVec 32)) (extraKeys!5472 (_ BitVec 32)) (zeroValue!5576 V!32559) (minValue!5576 V!32559) (_size!2496 (_ BitVec 32)) (_keys!10682 array!57445) (_values!5763 array!57443) (_vacant!2496 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4882)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9084 0))(
  ( (MissingZero!9084 (index!38707 (_ BitVec 32))) (Found!9084 (index!38708 (_ BitVec 32))) (Intermediate!9084 (undefined!9896 Bool) (index!38709 (_ BitVec 32)) (x!81532 (_ BitVec 32))) (Undefined!9084) (MissingVacant!9084 (index!38710 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57445 (_ BitVec 32)) SeekEntryResult!9084)

(assert (=> b!948730 (= res!636381 (not ((_ is Found!9084) (seekEntry!0 key!756 (_keys!10682 thiss!1141) (mask!27531 thiss!1141)))))))

(declare-fun b!948731 () Bool)

(declare-fun res!636379 () Bool)

(assert (=> b!948731 (=> (not res!636379) (not e!534111))))

(declare-datatypes ((tuple2!13496 0))(
  ( (tuple2!13497 (_1!6759 (_ BitVec 64)) (_2!6759 V!32559)) )
))
(declare-datatypes ((List!19298 0))(
  ( (Nil!19295) (Cons!19294 (h!20456 tuple2!13496) (t!27613 List!19298)) )
))
(declare-datatypes ((ListLongMap!12195 0))(
  ( (ListLongMap!12196 (toList!6113 List!19298)) )
))
(declare-fun contains!5206 (ListLongMap!12195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3346 (array!57445 array!57443 (_ BitVec 32) (_ BitVec 32) V!32559 V!32559 (_ BitVec 32) Int) ListLongMap!12195)

(assert (=> b!948731 (= res!636379 (contains!5206 (getCurrentListMap!3346 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32926 () Bool)

(declare-fun mapRes!32926 () Bool)

(declare-fun tp!63129 () Bool)

(declare-fun e!534110 () Bool)

(assert (=> mapNonEmpty!32926 (= mapRes!32926 (and tp!63129 e!534110))))

(declare-fun mapRest!32926 () (Array (_ BitVec 32) ValueCell!9866))

(declare-fun mapKey!32926 () (_ BitVec 32))

(declare-fun mapValue!32926 () ValueCell!9866)

(assert (=> mapNonEmpty!32926 (= (arr!27625 (_values!5763 thiss!1141)) (store mapRest!32926 mapKey!32926 mapValue!32926))))

(declare-fun res!636382 () Bool)

(assert (=> start!81058 (=> (not res!636382) (not e!534111))))

(declare-fun valid!1872 (LongMapFixedSize!4882) Bool)

(assert (=> start!81058 (= res!636382 (valid!1872 thiss!1141))))

(assert (=> start!81058 e!534111))

(declare-fun e!534114 () Bool)

(assert (=> start!81058 e!534114))

(assert (=> start!81058 true))

(declare-fun b!948732 () Bool)

(declare-fun res!636380 () Bool)

(assert (=> b!948732 (=> (not res!636380) (not e!534111))))

(assert (=> b!948732 (= res!636380 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948733 () Bool)

(declare-fun tp_is_empty!20695 () Bool)

(assert (=> b!948733 (= e!534110 tp_is_empty!20695)))

(declare-fun b!948734 () Bool)

(declare-fun e!534112 () Bool)

(declare-fun e!534113 () Bool)

(assert (=> b!948734 (= e!534112 (and e!534113 mapRes!32926))))

(declare-fun condMapEmpty!32926 () Bool)

(declare-fun mapDefault!32926 () ValueCell!9866)

(assert (=> b!948734 (= condMapEmpty!32926 (= (arr!27625 (_values!5763 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9866)) mapDefault!32926)))))

(declare-fun b!948735 () Bool)

(assert (=> b!948735 (= e!534113 tp_is_empty!20695)))

(declare-fun array_inv!21534 (array!57445) Bool)

(declare-fun array_inv!21535 (array!57443) Bool)

(assert (=> b!948736 (= e!534114 (and tp!63130 tp_is_empty!20695 (array_inv!21534 (_keys!10682 thiss!1141)) (array_inv!21535 (_values!5763 thiss!1141)) e!534112))))

(declare-fun b!948737 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948737 (= e!534111 (not (validMask!0 (mask!27531 thiss!1141))))))

(declare-fun mapIsEmpty!32926 () Bool)

(assert (=> mapIsEmpty!32926 mapRes!32926))

(assert (= (and start!81058 res!636382) b!948732))

(assert (= (and b!948732 res!636380) b!948730))

(assert (= (and b!948730 res!636381) b!948731))

(assert (= (and b!948731 res!636379) b!948737))

(assert (= (and b!948734 condMapEmpty!32926) mapIsEmpty!32926))

(assert (= (and b!948734 (not condMapEmpty!32926)) mapNonEmpty!32926))

(assert (= (and mapNonEmpty!32926 ((_ is ValueCellFull!9866) mapValue!32926)) b!948733))

(assert (= (and b!948734 ((_ is ValueCellFull!9866) mapDefault!32926)) b!948735))

(assert (= b!948736 b!948734))

(assert (= start!81058 b!948736))

(declare-fun m!881989 () Bool)

(assert (=> b!948731 m!881989))

(assert (=> b!948731 m!881989))

(declare-fun m!881991 () Bool)

(assert (=> b!948731 m!881991))

(declare-fun m!881993 () Bool)

(assert (=> b!948736 m!881993))

(declare-fun m!881995 () Bool)

(assert (=> b!948736 m!881995))

(declare-fun m!881997 () Bool)

(assert (=> mapNonEmpty!32926 m!881997))

(declare-fun m!881999 () Bool)

(assert (=> b!948730 m!881999))

(declare-fun m!882001 () Bool)

(assert (=> b!948737 m!882001))

(declare-fun m!882003 () Bool)

(assert (=> start!81058 m!882003))

(check-sat (not b!948731) tp_is_empty!20695 (not b!948737) b_and!29621 (not b!948730) (not b!948736) (not mapNonEmpty!32926) (not start!81058) (not b_next!18187))
(check-sat b_and!29621 (not b_next!18187))
(get-model)

(declare-fun d!115057 () Bool)

(declare-fun res!636413 () Bool)

(declare-fun e!534154 () Bool)

(assert (=> d!115057 (=> (not res!636413) (not e!534154))))

(declare-fun simpleValid!366 (LongMapFixedSize!4882) Bool)

(assert (=> d!115057 (= res!636413 (simpleValid!366 thiss!1141))))

(assert (=> d!115057 (= (valid!1872 thiss!1141) e!534154)))

(declare-fun b!948792 () Bool)

(declare-fun res!636414 () Bool)

(assert (=> b!948792 (=> (not res!636414) (not e!534154))))

(declare-fun arrayCountValidKeys!0 (array!57445 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948792 (= res!636414 (= (arrayCountValidKeys!0 (_keys!10682 thiss!1141) #b00000000000000000000000000000000 (size!28100 (_keys!10682 thiss!1141))) (_size!2496 thiss!1141)))))

(declare-fun b!948793 () Bool)

(declare-fun res!636415 () Bool)

(assert (=> b!948793 (=> (not res!636415) (not e!534154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57445 (_ BitVec 32)) Bool)

(assert (=> b!948793 (= res!636415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10682 thiss!1141) (mask!27531 thiss!1141)))))

(declare-fun b!948794 () Bool)

(declare-datatypes ((List!19301 0))(
  ( (Nil!19298) (Cons!19297 (h!20459 (_ BitVec 64)) (t!27618 List!19301)) )
))
(declare-fun arrayNoDuplicates!0 (array!57445 (_ BitVec 32) List!19301) Bool)

(assert (=> b!948794 (= e!534154 (arrayNoDuplicates!0 (_keys!10682 thiss!1141) #b00000000000000000000000000000000 Nil!19298))))

(assert (= (and d!115057 res!636413) b!948792))

(assert (= (and b!948792 res!636414) b!948793))

(assert (= (and b!948793 res!636415) b!948794))

(declare-fun m!882037 () Bool)

(assert (=> d!115057 m!882037))

(declare-fun m!882039 () Bool)

(assert (=> b!948792 m!882039))

(declare-fun m!882041 () Bool)

(assert (=> b!948793 m!882041))

(declare-fun m!882043 () Bool)

(assert (=> b!948794 m!882043))

(assert (=> start!81058 d!115057))

(declare-fun d!115059 () Bool)

(assert (=> d!115059 (= (validMask!0 (mask!27531 thiss!1141)) (and (or (= (mask!27531 thiss!1141) #b00000000000000000000000000000111) (= (mask!27531 thiss!1141) #b00000000000000000000000000001111) (= (mask!27531 thiss!1141) #b00000000000000000000000000011111) (= (mask!27531 thiss!1141) #b00000000000000000000000000111111) (= (mask!27531 thiss!1141) #b00000000000000000000000001111111) (= (mask!27531 thiss!1141) #b00000000000000000000000011111111) (= (mask!27531 thiss!1141) #b00000000000000000000000111111111) (= (mask!27531 thiss!1141) #b00000000000000000000001111111111) (= (mask!27531 thiss!1141) #b00000000000000000000011111111111) (= (mask!27531 thiss!1141) #b00000000000000000000111111111111) (= (mask!27531 thiss!1141) #b00000000000000000001111111111111) (= (mask!27531 thiss!1141) #b00000000000000000011111111111111) (= (mask!27531 thiss!1141) #b00000000000000000111111111111111) (= (mask!27531 thiss!1141) #b00000000000000001111111111111111) (= (mask!27531 thiss!1141) #b00000000000000011111111111111111) (= (mask!27531 thiss!1141) #b00000000000000111111111111111111) (= (mask!27531 thiss!1141) #b00000000000001111111111111111111) (= (mask!27531 thiss!1141) #b00000000000011111111111111111111) (= (mask!27531 thiss!1141) #b00000000000111111111111111111111) (= (mask!27531 thiss!1141) #b00000000001111111111111111111111) (= (mask!27531 thiss!1141) #b00000000011111111111111111111111) (= (mask!27531 thiss!1141) #b00000000111111111111111111111111) (= (mask!27531 thiss!1141) #b00000001111111111111111111111111) (= (mask!27531 thiss!1141) #b00000011111111111111111111111111) (= (mask!27531 thiss!1141) #b00000111111111111111111111111111) (= (mask!27531 thiss!1141) #b00001111111111111111111111111111) (= (mask!27531 thiss!1141) #b00011111111111111111111111111111) (= (mask!27531 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27531 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948737 d!115059))

(declare-fun d!115061 () Bool)

(assert (=> d!115061 (= (array_inv!21534 (_keys!10682 thiss!1141)) (bvsge (size!28100 (_keys!10682 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948736 d!115061))

(declare-fun d!115063 () Bool)

(assert (=> d!115063 (= (array_inv!21535 (_values!5763 thiss!1141)) (bvsge (size!28099 (_values!5763 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948736 d!115063))

(declare-fun b!948807 () Bool)

(declare-fun e!534163 () SeekEntryResult!9084)

(assert (=> b!948807 (= e!534163 Undefined!9084)))

(declare-fun d!115065 () Bool)

(declare-fun lt!427124 () SeekEntryResult!9084)

(assert (=> d!115065 (and (or ((_ is MissingVacant!9084) lt!427124) (not ((_ is Found!9084) lt!427124)) (and (bvsge (index!38708 lt!427124) #b00000000000000000000000000000000) (bvslt (index!38708 lt!427124) (size!28100 (_keys!10682 thiss!1141))))) (not ((_ is MissingVacant!9084) lt!427124)) (or (not ((_ is Found!9084) lt!427124)) (= (select (arr!27626 (_keys!10682 thiss!1141)) (index!38708 lt!427124)) key!756)))))

(assert (=> d!115065 (= lt!427124 e!534163)))

(declare-fun c!99038 () Bool)

(declare-fun lt!427121 () SeekEntryResult!9084)

(assert (=> d!115065 (= c!99038 (and ((_ is Intermediate!9084) lt!427121) (undefined!9896 lt!427121)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57445 (_ BitVec 32)) SeekEntryResult!9084)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115065 (= lt!427121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27531 thiss!1141)) key!756 (_keys!10682 thiss!1141) (mask!27531 thiss!1141)))))

(assert (=> d!115065 (validMask!0 (mask!27531 thiss!1141))))

(assert (=> d!115065 (= (seekEntry!0 key!756 (_keys!10682 thiss!1141) (mask!27531 thiss!1141)) lt!427124)))

(declare-fun b!948808 () Bool)

(declare-fun e!534161 () SeekEntryResult!9084)

(assert (=> b!948808 (= e!534161 (MissingZero!9084 (index!38709 lt!427121)))))

(declare-fun b!948809 () Bool)

(declare-fun e!534162 () SeekEntryResult!9084)

(assert (=> b!948809 (= e!534163 e!534162)))

(declare-fun lt!427122 () (_ BitVec 64))

(assert (=> b!948809 (= lt!427122 (select (arr!27626 (_keys!10682 thiss!1141)) (index!38709 lt!427121)))))

(declare-fun c!99037 () Bool)

(assert (=> b!948809 (= c!99037 (= lt!427122 key!756))))

(declare-fun b!948810 () Bool)

(assert (=> b!948810 (= e!534162 (Found!9084 (index!38709 lt!427121)))))

(declare-fun b!948811 () Bool)

(declare-fun lt!427123 () SeekEntryResult!9084)

(assert (=> b!948811 (= e!534161 (ite ((_ is MissingVacant!9084) lt!427123) (MissingZero!9084 (index!38710 lt!427123)) lt!427123))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57445 (_ BitVec 32)) SeekEntryResult!9084)

(assert (=> b!948811 (= lt!427123 (seekKeyOrZeroReturnVacant!0 (x!81532 lt!427121) (index!38709 lt!427121) (index!38709 lt!427121) key!756 (_keys!10682 thiss!1141) (mask!27531 thiss!1141)))))

(declare-fun b!948812 () Bool)

(declare-fun c!99039 () Bool)

(assert (=> b!948812 (= c!99039 (= lt!427122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948812 (= e!534162 e!534161)))

(assert (= (and d!115065 c!99038) b!948807))

(assert (= (and d!115065 (not c!99038)) b!948809))

(assert (= (and b!948809 c!99037) b!948810))

(assert (= (and b!948809 (not c!99037)) b!948812))

(assert (= (and b!948812 c!99039) b!948808))

(assert (= (and b!948812 (not c!99039)) b!948811))

(declare-fun m!882045 () Bool)

(assert (=> d!115065 m!882045))

(declare-fun m!882047 () Bool)

(assert (=> d!115065 m!882047))

(assert (=> d!115065 m!882047))

(declare-fun m!882049 () Bool)

(assert (=> d!115065 m!882049))

(assert (=> d!115065 m!882001))

(declare-fun m!882051 () Bool)

(assert (=> b!948809 m!882051))

(declare-fun m!882053 () Bool)

(assert (=> b!948811 m!882053))

(assert (=> b!948730 d!115065))

(declare-fun d!115067 () Bool)

(declare-fun e!534168 () Bool)

(assert (=> d!115067 e!534168))

(declare-fun res!636418 () Bool)

(assert (=> d!115067 (=> res!636418 e!534168)))

(declare-fun lt!427133 () Bool)

(assert (=> d!115067 (= res!636418 (not lt!427133))))

(declare-fun lt!427135 () Bool)

(assert (=> d!115067 (= lt!427133 lt!427135)))

(declare-datatypes ((Unit!31922 0))(
  ( (Unit!31923) )
))
(declare-fun lt!427134 () Unit!31922)

(declare-fun e!534169 () Unit!31922)

(assert (=> d!115067 (= lt!427134 e!534169)))

(declare-fun c!99042 () Bool)

(assert (=> d!115067 (= c!99042 lt!427135)))

(declare-fun containsKey!458 (List!19298 (_ BitVec 64)) Bool)

(assert (=> d!115067 (= lt!427135 (containsKey!458 (toList!6113 (getCurrentListMap!3346 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141))) key!756))))

(assert (=> d!115067 (= (contains!5206 (getCurrentListMap!3346 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)) key!756) lt!427133)))

(declare-fun b!948819 () Bool)

(declare-fun lt!427136 () Unit!31922)

(assert (=> b!948819 (= e!534169 lt!427136)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!352 (List!19298 (_ BitVec 64)) Unit!31922)

(assert (=> b!948819 (= lt!427136 (lemmaContainsKeyImpliesGetValueByKeyDefined!352 (toList!6113 (getCurrentListMap!3346 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141))) key!756))))

(declare-datatypes ((Option!493 0))(
  ( (Some!492 (v!12933 V!32559)) (None!491) )
))
(declare-fun isDefined!360 (Option!493) Bool)

(declare-fun getValueByKey!487 (List!19298 (_ BitVec 64)) Option!493)

(assert (=> b!948819 (isDefined!360 (getValueByKey!487 (toList!6113 (getCurrentListMap!3346 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141))) key!756))))

(declare-fun b!948820 () Bool)

(declare-fun Unit!31924 () Unit!31922)

(assert (=> b!948820 (= e!534169 Unit!31924)))

(declare-fun b!948821 () Bool)

(assert (=> b!948821 (= e!534168 (isDefined!360 (getValueByKey!487 (toList!6113 (getCurrentListMap!3346 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141))) key!756)))))

(assert (= (and d!115067 c!99042) b!948819))

(assert (= (and d!115067 (not c!99042)) b!948820))

(assert (= (and d!115067 (not res!636418)) b!948821))

(declare-fun m!882055 () Bool)

(assert (=> d!115067 m!882055))

(declare-fun m!882057 () Bool)

(assert (=> b!948819 m!882057))

(declare-fun m!882059 () Bool)

(assert (=> b!948819 m!882059))

(assert (=> b!948819 m!882059))

(declare-fun m!882061 () Bool)

(assert (=> b!948819 m!882061))

(assert (=> b!948821 m!882059))

(assert (=> b!948821 m!882059))

(assert (=> b!948821 m!882061))

(assert (=> b!948731 d!115067))

(declare-fun b!948864 () Bool)

(declare-fun res!636445 () Bool)

(declare-fun e!534199 () Bool)

(assert (=> b!948864 (=> (not res!636445) (not e!534199))))

(declare-fun e!534197 () Bool)

(assert (=> b!948864 (= res!636445 e!534197)))

(declare-fun c!99055 () Bool)

(assert (=> b!948864 (= c!99055 (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!948865 () Bool)

(declare-fun e!534202 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948865 (= e!534202 (validKeyInArray!0 (select (arr!27626 (_keys!10682 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948866 () Bool)

(declare-fun e!534205 () Bool)

(declare-fun e!534203 () Bool)

(assert (=> b!948866 (= e!534205 e!534203)))

(declare-fun res!636443 () Bool)

(assert (=> b!948866 (=> (not res!636443) (not e!534203))))

(declare-fun lt!427185 () ListLongMap!12195)

(assert (=> b!948866 (= res!636443 (contains!5206 lt!427185 (select (arr!27626 (_keys!10682 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10682 thiss!1141))))))

(declare-fun b!948867 () Bool)

(declare-fun c!99060 () Bool)

(assert (=> b!948867 (= c!99060 (and (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!534200 () ListLongMap!12195)

(declare-fun e!534198 () ListLongMap!12195)

(assert (=> b!948867 (= e!534200 e!534198)))

(declare-fun bm!41202 () Bool)

(declare-fun call!41210 () ListLongMap!12195)

(declare-fun getCurrentListMapNoExtraKeys!3353 (array!57445 array!57443 (_ BitVec 32) (_ BitVec 32) V!32559 V!32559 (_ BitVec 32) Int) ListLongMap!12195)

(assert (=> bm!41202 (= call!41210 (getCurrentListMapNoExtraKeys!3353 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun bm!41203 () Bool)

(declare-fun call!41211 () ListLongMap!12195)

(declare-fun call!41208 () ListLongMap!12195)

(assert (=> bm!41203 (= call!41211 call!41208)))

(declare-fun bm!41204 () Bool)

(declare-fun call!41207 () Bool)

(assert (=> bm!41204 (= call!41207 (contains!5206 lt!427185 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948868 () Bool)

(assert (=> b!948868 (= e!534197 (not call!41207))))

(declare-fun b!948869 () Bool)

(declare-fun e!534204 () Unit!31922)

(declare-fun lt!427186 () Unit!31922)

(assert (=> b!948869 (= e!534204 lt!427186)))

(declare-fun lt!427192 () ListLongMap!12195)

(assert (=> b!948869 (= lt!427192 (getCurrentListMapNoExtraKeys!3353 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun lt!427193 () (_ BitVec 64))

(assert (=> b!948869 (= lt!427193 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427182 () (_ BitVec 64))

(assert (=> b!948869 (= lt!427182 (select (arr!27626 (_keys!10682 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427195 () Unit!31922)

(declare-fun addStillContains!568 (ListLongMap!12195 (_ BitVec 64) V!32559 (_ BitVec 64)) Unit!31922)

(assert (=> b!948869 (= lt!427195 (addStillContains!568 lt!427192 lt!427193 (zeroValue!5576 thiss!1141) lt!427182))))

(declare-fun +!2865 (ListLongMap!12195 tuple2!13496) ListLongMap!12195)

(assert (=> b!948869 (contains!5206 (+!2865 lt!427192 (tuple2!13497 lt!427193 (zeroValue!5576 thiss!1141))) lt!427182)))

(declare-fun lt!427189 () Unit!31922)

(assert (=> b!948869 (= lt!427189 lt!427195)))

(declare-fun lt!427184 () ListLongMap!12195)

(assert (=> b!948869 (= lt!427184 (getCurrentListMapNoExtraKeys!3353 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun lt!427198 () (_ BitVec 64))

(assert (=> b!948869 (= lt!427198 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427201 () (_ BitVec 64))

(assert (=> b!948869 (= lt!427201 (select (arr!27626 (_keys!10682 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427202 () Unit!31922)

(declare-fun addApplyDifferent!449 (ListLongMap!12195 (_ BitVec 64) V!32559 (_ BitVec 64)) Unit!31922)

(assert (=> b!948869 (= lt!427202 (addApplyDifferent!449 lt!427184 lt!427198 (minValue!5576 thiss!1141) lt!427201))))

(declare-fun apply!879 (ListLongMap!12195 (_ BitVec 64)) V!32559)

(assert (=> b!948869 (= (apply!879 (+!2865 lt!427184 (tuple2!13497 lt!427198 (minValue!5576 thiss!1141))) lt!427201) (apply!879 lt!427184 lt!427201))))

(declare-fun lt!427188 () Unit!31922)

(assert (=> b!948869 (= lt!427188 lt!427202)))

(declare-fun lt!427197 () ListLongMap!12195)

(assert (=> b!948869 (= lt!427197 (getCurrentListMapNoExtraKeys!3353 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun lt!427183 () (_ BitVec 64))

(assert (=> b!948869 (= lt!427183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427199 () (_ BitVec 64))

(assert (=> b!948869 (= lt!427199 (select (arr!27626 (_keys!10682 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427194 () Unit!31922)

(assert (=> b!948869 (= lt!427194 (addApplyDifferent!449 lt!427197 lt!427183 (zeroValue!5576 thiss!1141) lt!427199))))

(assert (=> b!948869 (= (apply!879 (+!2865 lt!427197 (tuple2!13497 lt!427183 (zeroValue!5576 thiss!1141))) lt!427199) (apply!879 lt!427197 lt!427199))))

(declare-fun lt!427187 () Unit!31922)

(assert (=> b!948869 (= lt!427187 lt!427194)))

(declare-fun lt!427196 () ListLongMap!12195)

(assert (=> b!948869 (= lt!427196 (getCurrentListMapNoExtraKeys!3353 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun lt!427190 () (_ BitVec 64))

(assert (=> b!948869 (= lt!427190 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427191 () (_ BitVec 64))

(assert (=> b!948869 (= lt!427191 (select (arr!27626 (_keys!10682 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948869 (= lt!427186 (addApplyDifferent!449 lt!427196 lt!427190 (minValue!5576 thiss!1141) lt!427191))))

(assert (=> b!948869 (= (apply!879 (+!2865 lt!427196 (tuple2!13497 lt!427190 (minValue!5576 thiss!1141))) lt!427191) (apply!879 lt!427196 lt!427191))))

(declare-fun b!948870 () Bool)

(assert (=> b!948870 (= e!534198 call!41211)))

(declare-fun b!948871 () Bool)

(declare-fun e!534206 () Bool)

(assert (=> b!948871 (= e!534206 (= (apply!879 lt!427185 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5576 thiss!1141)))))

(declare-fun b!948872 () Bool)

(declare-fun Unit!31925 () Unit!31922)

(assert (=> b!948872 (= e!534204 Unit!31925)))

(declare-fun b!948873 () Bool)

(declare-fun res!636439 () Bool)

(assert (=> b!948873 (=> (not res!636439) (not e!534199))))

(assert (=> b!948873 (= res!636439 e!534205)))

(declare-fun res!636444 () Bool)

(assert (=> b!948873 (=> res!636444 e!534205)))

(assert (=> b!948873 (= res!636444 (not e!534202))))

(declare-fun res!636437 () Bool)

(assert (=> b!948873 (=> (not res!636437) (not e!534202))))

(assert (=> b!948873 (= res!636437 (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10682 thiss!1141))))))

(declare-fun b!948874 () Bool)

(declare-fun e!534207 () Bool)

(assert (=> b!948874 (= e!534207 (= (apply!879 lt!427185 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5576 thiss!1141)))))

(declare-fun b!948875 () Bool)

(declare-fun call!41206 () ListLongMap!12195)

(assert (=> b!948875 (= e!534200 call!41206)))

(declare-fun b!948876 () Bool)

(declare-fun e!534201 () Bool)

(assert (=> b!948876 (= e!534199 e!534201)))

(declare-fun c!99058 () Bool)

(assert (=> b!948876 (= c!99058 (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!948877 () Bool)

(declare-fun call!41209 () Bool)

(assert (=> b!948877 (= e!534201 (not call!41209))))

(declare-fun c!99056 () Bool)

(declare-fun call!41205 () ListLongMap!12195)

(declare-fun bm!41206 () Bool)

(declare-fun c!99059 () Bool)

(assert (=> bm!41206 (= call!41205 (+!2865 (ite c!99056 call!41210 (ite c!99059 call!41208 call!41211)) (ite (or c!99056 c!99059) (tuple2!13497 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5576 thiss!1141)) (tuple2!13497 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5576 thiss!1141)))))))

(declare-fun b!948878 () Bool)

(assert (=> b!948878 (= e!534198 call!41206)))

(declare-fun b!948879 () Bool)

(assert (=> b!948879 (= e!534201 e!534206)))

(declare-fun res!636440 () Bool)

(assert (=> b!948879 (= res!636440 call!41209)))

(assert (=> b!948879 (=> (not res!636440) (not e!534206))))

(declare-fun b!948880 () Bool)

(declare-fun get!14520 (ValueCell!9866 V!32559) V!32559)

(declare-fun dynLambda!1662 (Int (_ BitVec 64)) V!32559)

(assert (=> b!948880 (= e!534203 (= (apply!879 lt!427185 (select (arr!27626 (_keys!10682 thiss!1141)) #b00000000000000000000000000000000)) (get!14520 (select (arr!27625 (_values!5763 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1662 (defaultEntry!5740 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28099 (_values!5763 thiss!1141))))))

(assert (=> b!948880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10682 thiss!1141))))))

(declare-fun b!948881 () Bool)

(declare-fun e!534208 () ListLongMap!12195)

(assert (=> b!948881 (= e!534208 (+!2865 call!41205 (tuple2!13497 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5576 thiss!1141))))))

(declare-fun b!948882 () Bool)

(assert (=> b!948882 (= e!534208 e!534200)))

(assert (=> b!948882 (= c!99059 (and (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!948883 () Bool)

(declare-fun e!534196 () Bool)

(assert (=> b!948883 (= e!534196 (validKeyInArray!0 (select (arr!27626 (_keys!10682 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41207 () Bool)

(assert (=> bm!41207 (= call!41208 call!41210)))

(declare-fun b!948884 () Bool)

(assert (=> b!948884 (= e!534197 e!534207)))

(declare-fun res!636442 () Bool)

(assert (=> b!948884 (= res!636442 call!41207)))

(assert (=> b!948884 (=> (not res!636442) (not e!534207))))

(declare-fun bm!41208 () Bool)

(assert (=> bm!41208 (= call!41209 (contains!5206 lt!427185 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!115069 () Bool)

(assert (=> d!115069 e!534199))

(declare-fun res!636441 () Bool)

(assert (=> d!115069 (=> (not res!636441) (not e!534199))))

(assert (=> d!115069 (= res!636441 (or (bvsge #b00000000000000000000000000000000 (size!28100 (_keys!10682 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10682 thiss!1141))))))))

(declare-fun lt!427200 () ListLongMap!12195)

(assert (=> d!115069 (= lt!427185 lt!427200)))

(declare-fun lt!427181 () Unit!31922)

(assert (=> d!115069 (= lt!427181 e!534204)))

(declare-fun c!99057 () Bool)

(assert (=> d!115069 (= c!99057 e!534196)))

(declare-fun res!636438 () Bool)

(assert (=> d!115069 (=> (not res!636438) (not e!534196))))

(assert (=> d!115069 (= res!636438 (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10682 thiss!1141))))))

(assert (=> d!115069 (= lt!427200 e!534208)))

(assert (=> d!115069 (= c!99056 (and (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115069 (validMask!0 (mask!27531 thiss!1141))))

(assert (=> d!115069 (= (getCurrentListMap!3346 (_keys!10682 thiss!1141) (_values!5763 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)) lt!427185)))

(declare-fun bm!41205 () Bool)

(assert (=> bm!41205 (= call!41206 call!41205)))

(assert (= (and d!115069 c!99056) b!948881))

(assert (= (and d!115069 (not c!99056)) b!948882))

(assert (= (and b!948882 c!99059) b!948875))

(assert (= (and b!948882 (not c!99059)) b!948867))

(assert (= (and b!948867 c!99060) b!948878))

(assert (= (and b!948867 (not c!99060)) b!948870))

(assert (= (or b!948878 b!948870) bm!41203))

(assert (= (or b!948875 bm!41203) bm!41207))

(assert (= (or b!948875 b!948878) bm!41205))

(assert (= (or b!948881 bm!41207) bm!41202))

(assert (= (or b!948881 bm!41205) bm!41206))

(assert (= (and d!115069 res!636438) b!948883))

(assert (= (and d!115069 c!99057) b!948869))

(assert (= (and d!115069 (not c!99057)) b!948872))

(assert (= (and d!115069 res!636441) b!948873))

(assert (= (and b!948873 res!636437) b!948865))

(assert (= (and b!948873 (not res!636444)) b!948866))

(assert (= (and b!948866 res!636443) b!948880))

(assert (= (and b!948873 res!636439) b!948864))

(assert (= (and b!948864 c!99055) b!948884))

(assert (= (and b!948864 (not c!99055)) b!948868))

(assert (= (and b!948884 res!636442) b!948874))

(assert (= (or b!948884 b!948868) bm!41204))

(assert (= (and b!948864 res!636445) b!948876))

(assert (= (and b!948876 c!99058) b!948879))

(assert (= (and b!948876 (not c!99058)) b!948877))

(assert (= (and b!948879 res!636440) b!948871))

(assert (= (or b!948879 b!948877) bm!41208))

(declare-fun b_lambda!14317 () Bool)

(assert (=> (not b_lambda!14317) (not b!948880)))

(declare-fun t!27617 () Bool)

(declare-fun tb!6167 () Bool)

(assert (=> (and b!948736 (= (defaultEntry!5740 thiss!1141) (defaultEntry!5740 thiss!1141)) t!27617) tb!6167))

(declare-fun result!12239 () Bool)

(assert (=> tb!6167 (= result!12239 tp_is_empty!20695)))

(assert (=> b!948880 t!27617))

(declare-fun b_and!29627 () Bool)

(assert (= b_and!29621 (and (=> t!27617 result!12239) b_and!29627)))

(declare-fun m!882063 () Bool)

(assert (=> b!948874 m!882063))

(declare-fun m!882065 () Bool)

(assert (=> bm!41208 m!882065))

(declare-fun m!882067 () Bool)

(assert (=> b!948869 m!882067))

(declare-fun m!882069 () Bool)

(assert (=> b!948869 m!882069))

(declare-fun m!882071 () Bool)

(assert (=> b!948869 m!882071))

(declare-fun m!882073 () Bool)

(assert (=> b!948869 m!882073))

(assert (=> b!948869 m!882069))

(declare-fun m!882075 () Bool)

(assert (=> b!948869 m!882075))

(declare-fun m!882077 () Bool)

(assert (=> b!948869 m!882077))

(assert (=> b!948869 m!882075))

(declare-fun m!882079 () Bool)

(assert (=> b!948869 m!882079))

(declare-fun m!882081 () Bool)

(assert (=> b!948869 m!882081))

(declare-fun m!882083 () Bool)

(assert (=> b!948869 m!882083))

(declare-fun m!882085 () Bool)

(assert (=> b!948869 m!882085))

(declare-fun m!882087 () Bool)

(assert (=> b!948869 m!882087))

(declare-fun m!882089 () Bool)

(assert (=> b!948869 m!882089))

(declare-fun m!882091 () Bool)

(assert (=> b!948869 m!882091))

(assert (=> b!948869 m!882073))

(declare-fun m!882093 () Bool)

(assert (=> b!948869 m!882093))

(declare-fun m!882095 () Bool)

(assert (=> b!948869 m!882095))

(assert (=> b!948869 m!882081))

(declare-fun m!882097 () Bool)

(assert (=> b!948869 m!882097))

(declare-fun m!882099 () Bool)

(assert (=> b!948869 m!882099))

(assert (=> d!115069 m!882001))

(assert (=> b!948883 m!882089))

(assert (=> b!948883 m!882089))

(declare-fun m!882101 () Bool)

(assert (=> b!948883 m!882101))

(declare-fun m!882103 () Bool)

(assert (=> b!948881 m!882103))

(assert (=> b!948865 m!882089))

(assert (=> b!948865 m!882089))

(assert (=> b!948865 m!882101))

(declare-fun m!882105 () Bool)

(assert (=> bm!41206 m!882105))

(declare-fun m!882107 () Bool)

(assert (=> b!948880 m!882107))

(declare-fun m!882109 () Bool)

(assert (=> b!948880 m!882109))

(declare-fun m!882111 () Bool)

(assert (=> b!948880 m!882111))

(assert (=> b!948880 m!882107))

(assert (=> b!948880 m!882089))

(assert (=> b!948880 m!882109))

(assert (=> b!948880 m!882089))

(declare-fun m!882113 () Bool)

(assert (=> b!948880 m!882113))

(declare-fun m!882115 () Bool)

(assert (=> bm!41204 m!882115))

(assert (=> bm!41202 m!882087))

(declare-fun m!882117 () Bool)

(assert (=> b!948871 m!882117))

(assert (=> b!948866 m!882089))

(assert (=> b!948866 m!882089))

(declare-fun m!882119 () Bool)

(assert (=> b!948866 m!882119))

(assert (=> b!948731 d!115069))

(declare-fun b!948893 () Bool)

(declare-fun e!534214 () Bool)

(assert (=> b!948893 (= e!534214 tp_is_empty!20695)))

(declare-fun mapIsEmpty!32935 () Bool)

(declare-fun mapRes!32935 () Bool)

(assert (=> mapIsEmpty!32935 mapRes!32935))

(declare-fun mapNonEmpty!32935 () Bool)

(declare-fun tp!63145 () Bool)

(assert (=> mapNonEmpty!32935 (= mapRes!32935 (and tp!63145 e!534214))))

(declare-fun mapValue!32935 () ValueCell!9866)

(declare-fun mapKey!32935 () (_ BitVec 32))

(declare-fun mapRest!32935 () (Array (_ BitVec 32) ValueCell!9866))

(assert (=> mapNonEmpty!32935 (= mapRest!32926 (store mapRest!32935 mapKey!32935 mapValue!32935))))

(declare-fun condMapEmpty!32935 () Bool)

(declare-fun mapDefault!32935 () ValueCell!9866)

(assert (=> mapNonEmpty!32926 (= condMapEmpty!32935 (= mapRest!32926 ((as const (Array (_ BitVec 32) ValueCell!9866)) mapDefault!32935)))))

(declare-fun e!534213 () Bool)

(assert (=> mapNonEmpty!32926 (= tp!63129 (and e!534213 mapRes!32935))))

(declare-fun b!948894 () Bool)

(assert (=> b!948894 (= e!534213 tp_is_empty!20695)))

(assert (= (and mapNonEmpty!32926 condMapEmpty!32935) mapIsEmpty!32935))

(assert (= (and mapNonEmpty!32926 (not condMapEmpty!32935)) mapNonEmpty!32935))

(assert (= (and mapNonEmpty!32935 ((_ is ValueCellFull!9866) mapValue!32935)) b!948893))

(assert (= (and mapNonEmpty!32926 ((_ is ValueCellFull!9866) mapDefault!32935)) b!948894))

(declare-fun m!882121 () Bool)

(assert (=> mapNonEmpty!32935 m!882121))

(declare-fun b_lambda!14319 () Bool)

(assert (= b_lambda!14317 (or (and b!948736 b_free!18187) b_lambda!14319)))

(check-sat (not b_lambda!14319) (not d!115069) (not b!948811) (not bm!41204) (not bm!41206) (not d!115057) (not bm!41208) (not d!115065) (not b!948874) b_and!29627 (not b!948792) (not b!948794) (not mapNonEmpty!32935) tp_is_empty!20695 (not bm!41202) (not b!948883) (not b!948871) (not b_next!18187) (not b!948865) (not b!948866) (not b!948821) (not b!948793) (not b!948880) (not b!948869) (not b!948819) (not b!948881) (not d!115067))
(check-sat b_and!29627 (not b_next!18187))
