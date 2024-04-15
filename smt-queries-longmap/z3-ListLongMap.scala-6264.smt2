; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80042 () Bool)

(assert start!80042)

(declare-fun b!940998 () Bool)

(declare-fun b_free!17905 () Bool)

(declare-fun b_next!17905 () Bool)

(assert (=> b!940998 (= b_free!17905 (not b_next!17905))))

(declare-fun tp!62193 () Bool)

(declare-fun b_and!29291 () Bool)

(assert (=> b!940998 (= tp!62193 b_and!29291)))

(declare-fun res!632683 () Bool)

(declare-fun e!528991 () Bool)

(assert (=> start!80042 (=> (not res!632683) (not e!528991))))

(declare-datatypes ((V!32183 0))(
  ( (V!32184 (val!10257 Int)) )
))
(declare-datatypes ((ValueCell!9725 0))(
  ( (ValueCellFull!9725 (v!12787 V!32183)) (EmptyCell!9725) )
))
(declare-datatypes ((array!56741 0))(
  ( (array!56742 (arr!27305 (Array (_ BitVec 32) ValueCell!9725)) (size!27768 (_ BitVec 32))) )
))
(declare-datatypes ((array!56743 0))(
  ( (array!56744 (arr!27306 (Array (_ BitVec 32) (_ BitVec 64))) (size!27769 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4600 0))(
  ( (LongMapFixedSize!4601 (defaultEntry!5591 Int) (mask!27145 (_ BitVec 32)) (extraKeys!5323 (_ BitVec 32)) (zeroValue!5427 V!32183) (minValue!5427 V!32183) (_size!2355 (_ BitVec 32)) (_keys!10437 array!56743) (_values!5614 array!56741) (_vacant!2355 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4600)

(declare-fun valid!1770 (LongMapFixedSize!4600) Bool)

(assert (=> start!80042 (= res!632683 (valid!1770 thiss!1141))))

(assert (=> start!80042 e!528991))

(declare-fun e!528993 () Bool)

(assert (=> start!80042 e!528993))

(assert (=> start!80042 true))

(declare-fun mapNonEmpty!32413 () Bool)

(declare-fun mapRes!32413 () Bool)

(declare-fun tp!62194 () Bool)

(declare-fun e!528989 () Bool)

(assert (=> mapNonEmpty!32413 (= mapRes!32413 (and tp!62194 e!528989))))

(declare-fun mapRest!32413 () (Array (_ BitVec 32) ValueCell!9725))

(declare-fun mapValue!32413 () ValueCell!9725)

(declare-fun mapKey!32413 () (_ BitVec 32))

(assert (=> mapNonEmpty!32413 (= (arr!27305 (_values!5614 thiss!1141)) (store mapRest!32413 mapKey!32413 mapValue!32413))))

(declare-fun b!940994 () Bool)

(declare-fun e!528992 () Bool)

(declare-fun e!528990 () Bool)

(assert (=> b!940994 (= e!528992 (and e!528990 mapRes!32413))))

(declare-fun condMapEmpty!32413 () Bool)

(declare-fun mapDefault!32413 () ValueCell!9725)

(assert (=> b!940994 (= condMapEmpty!32413 (= (arr!27305 (_values!5614 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9725)) mapDefault!32413)))))

(declare-fun b!940995 () Bool)

(declare-fun res!632682 () Bool)

(assert (=> b!940995 (=> (not res!632682) (not e!528991))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9017 0))(
  ( (MissingZero!9017 (index!38439 (_ BitVec 32))) (Found!9017 (index!38440 (_ BitVec 32))) (Intermediate!9017 (undefined!9829 Bool) (index!38441 (_ BitVec 32)) (x!80753 (_ BitVec 32))) (Undefined!9017) (MissingVacant!9017 (index!38442 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56743 (_ BitVec 32)) SeekEntryResult!9017)

(assert (=> b!940995 (= res!632682 (not ((_ is Found!9017) (seekEntry!0 key!756 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)))))))

(declare-fun b!940996 () Bool)

(declare-fun tp_is_empty!20413 () Bool)

(assert (=> b!940996 (= e!528990 tp_is_empty!20413)))

(declare-fun b!940997 () Bool)

(assert (=> b!940997 (= e!528989 tp_is_empty!20413)))

(declare-fun array_inv!21286 (array!56743) Bool)

(declare-fun array_inv!21287 (array!56741) Bool)

(assert (=> b!940998 (= e!528993 (and tp!62193 tp_is_empty!20413 (array_inv!21286 (_keys!10437 thiss!1141)) (array_inv!21287 (_values!5614 thiss!1141)) e!528992))))

(declare-fun mapIsEmpty!32413 () Bool)

(assert (=> mapIsEmpty!32413 mapRes!32413))

(declare-fun b!940999 () Bool)

(declare-fun res!632684 () Bool)

(assert (=> b!940999 (=> (not res!632684) (not e!528991))))

(assert (=> b!940999 (= res!632684 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941000 () Bool)

(assert (=> b!941000 (= e!528991 (not (= (size!27768 (_values!5614 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27145 thiss!1141)))))))

(declare-fun b!941001 () Bool)

(declare-fun res!632681 () Bool)

(assert (=> b!941001 (=> (not res!632681) (not e!528991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941001 (= res!632681 (validMask!0 (mask!27145 thiss!1141)))))

(assert (= (and start!80042 res!632683) b!940999))

(assert (= (and b!940999 res!632684) b!940995))

(assert (= (and b!940995 res!632682) b!941001))

(assert (= (and b!941001 res!632681) b!941000))

(assert (= (and b!940994 condMapEmpty!32413) mapIsEmpty!32413))

(assert (= (and b!940994 (not condMapEmpty!32413)) mapNonEmpty!32413))

(assert (= (and mapNonEmpty!32413 ((_ is ValueCellFull!9725) mapValue!32413)) b!940997))

(assert (= (and b!940994 ((_ is ValueCellFull!9725) mapDefault!32413)) b!940996))

(assert (= b!940998 b!940994))

(assert (= start!80042 b!940998))

(declare-fun m!875677 () Bool)

(assert (=> b!941001 m!875677))

(declare-fun m!875679 () Bool)

(assert (=> mapNonEmpty!32413 m!875679))

(declare-fun m!875681 () Bool)

(assert (=> start!80042 m!875681))

(declare-fun m!875683 () Bool)

(assert (=> b!940998 m!875683))

(declare-fun m!875685 () Bool)

(assert (=> b!940998 m!875685))

(declare-fun m!875687 () Bool)

(assert (=> b!940995 m!875687))

(check-sat (not start!80042) (not b!940998) (not b!941001) (not b!940995) b_and!29291 tp_is_empty!20413 (not mapNonEmpty!32413) (not b_next!17905))
(check-sat b_and!29291 (not b_next!17905))
(get-model)

(declare-fun d!113845 () Bool)

(assert (=> d!113845 (= (array_inv!21286 (_keys!10437 thiss!1141)) (bvsge (size!27769 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940998 d!113845))

(declare-fun d!113847 () Bool)

(assert (=> d!113847 (= (array_inv!21287 (_values!5614 thiss!1141)) (bvsge (size!27768 (_values!5614 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940998 d!113847))

(declare-fun d!113849 () Bool)

(declare-fun res!632715 () Bool)

(declare-fun e!529032 () Bool)

(assert (=> d!113849 (=> (not res!632715) (not e!529032))))

(declare-fun simpleValid!340 (LongMapFixedSize!4600) Bool)

(assert (=> d!113849 (= res!632715 (simpleValid!340 thiss!1141))))

(assert (=> d!113849 (= (valid!1770 thiss!1141) e!529032)))

(declare-fun b!941056 () Bool)

(declare-fun res!632716 () Bool)

(assert (=> b!941056 (=> (not res!632716) (not e!529032))))

(declare-fun arrayCountValidKeys!0 (array!56743 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941056 (= res!632716 (= (arrayCountValidKeys!0 (_keys!10437 thiss!1141) #b00000000000000000000000000000000 (size!27769 (_keys!10437 thiss!1141))) (_size!2355 thiss!1141)))))

(declare-fun b!941057 () Bool)

(declare-fun res!632717 () Bool)

(assert (=> b!941057 (=> (not res!632717) (not e!529032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56743 (_ BitVec 32)) Bool)

(assert (=> b!941057 (= res!632717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)))))

(declare-fun b!941058 () Bool)

(declare-datatypes ((List!19216 0))(
  ( (Nil!19213) (Cons!19212 (h!20358 (_ BitVec 64)) (t!27522 List!19216)) )
))
(declare-fun arrayNoDuplicates!0 (array!56743 (_ BitVec 32) List!19216) Bool)

(assert (=> b!941058 (= e!529032 (arrayNoDuplicates!0 (_keys!10437 thiss!1141) #b00000000000000000000000000000000 Nil!19213))))

(assert (= (and d!113849 res!632715) b!941056))

(assert (= (and b!941056 res!632716) b!941057))

(assert (= (and b!941057 res!632717) b!941058))

(declare-fun m!875713 () Bool)

(assert (=> d!113849 m!875713))

(declare-fun m!875715 () Bool)

(assert (=> b!941056 m!875715))

(declare-fun m!875717 () Bool)

(assert (=> b!941057 m!875717))

(declare-fun m!875719 () Bool)

(assert (=> b!941058 m!875719))

(assert (=> start!80042 d!113849))

(declare-fun b!941071 () Bool)

(declare-fun e!529039 () SeekEntryResult!9017)

(declare-fun lt!424709 () SeekEntryResult!9017)

(assert (=> b!941071 (= e!529039 (ite ((_ is MissingVacant!9017) lt!424709) (MissingZero!9017 (index!38442 lt!424709)) lt!424709))))

(declare-fun lt!424706 () SeekEntryResult!9017)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56743 (_ BitVec 32)) SeekEntryResult!9017)

(assert (=> b!941071 (= lt!424709 (seekKeyOrZeroReturnVacant!0 (x!80753 lt!424706) (index!38441 lt!424706) (index!38441 lt!424706) key!756 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)))))

(declare-fun b!941072 () Bool)

(declare-fun e!529041 () SeekEntryResult!9017)

(assert (=> b!941072 (= e!529041 (Found!9017 (index!38441 lt!424706)))))

(declare-fun d!113851 () Bool)

(declare-fun lt!424707 () SeekEntryResult!9017)

(assert (=> d!113851 (and (or ((_ is MissingVacant!9017) lt!424707) (not ((_ is Found!9017) lt!424707)) (and (bvsge (index!38440 lt!424707) #b00000000000000000000000000000000) (bvslt (index!38440 lt!424707) (size!27769 (_keys!10437 thiss!1141))))) (not ((_ is MissingVacant!9017) lt!424707)) (or (not ((_ is Found!9017) lt!424707)) (= (select (arr!27306 (_keys!10437 thiss!1141)) (index!38440 lt!424707)) key!756)))))

(declare-fun e!529040 () SeekEntryResult!9017)

(assert (=> d!113851 (= lt!424707 e!529040)))

(declare-fun c!97979 () Bool)

(assert (=> d!113851 (= c!97979 (and ((_ is Intermediate!9017) lt!424706) (undefined!9829 lt!424706)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56743 (_ BitVec 32)) SeekEntryResult!9017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113851 (= lt!424706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27145 thiss!1141)) key!756 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)))))

(assert (=> d!113851 (validMask!0 (mask!27145 thiss!1141))))

(assert (=> d!113851 (= (seekEntry!0 key!756 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)) lt!424707)))

(declare-fun b!941073 () Bool)

(assert (=> b!941073 (= e!529040 e!529041)))

(declare-fun lt!424708 () (_ BitVec 64))

(assert (=> b!941073 (= lt!424708 (select (arr!27306 (_keys!10437 thiss!1141)) (index!38441 lt!424706)))))

(declare-fun c!97977 () Bool)

(assert (=> b!941073 (= c!97977 (= lt!424708 key!756))))

(declare-fun b!941074 () Bool)

(assert (=> b!941074 (= e!529040 Undefined!9017)))

(declare-fun b!941075 () Bool)

(declare-fun c!97978 () Bool)

(assert (=> b!941075 (= c!97978 (= lt!424708 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941075 (= e!529041 e!529039)))

(declare-fun b!941076 () Bool)

(assert (=> b!941076 (= e!529039 (MissingZero!9017 (index!38441 lt!424706)))))

(assert (= (and d!113851 c!97979) b!941074))

(assert (= (and d!113851 (not c!97979)) b!941073))

(assert (= (and b!941073 c!97977) b!941072))

(assert (= (and b!941073 (not c!97977)) b!941075))

(assert (= (and b!941075 c!97978) b!941076))

(assert (= (and b!941075 (not c!97978)) b!941071))

(declare-fun m!875721 () Bool)

(assert (=> b!941071 m!875721))

(declare-fun m!875723 () Bool)

(assert (=> d!113851 m!875723))

(declare-fun m!875725 () Bool)

(assert (=> d!113851 m!875725))

(assert (=> d!113851 m!875725))

(declare-fun m!875727 () Bool)

(assert (=> d!113851 m!875727))

(assert (=> d!113851 m!875677))

(declare-fun m!875729 () Bool)

(assert (=> b!941073 m!875729))

(assert (=> b!940995 d!113851))

(declare-fun d!113853 () Bool)

(assert (=> d!113853 (= (validMask!0 (mask!27145 thiss!1141)) (and (or (= (mask!27145 thiss!1141) #b00000000000000000000000000000111) (= (mask!27145 thiss!1141) #b00000000000000000000000000001111) (= (mask!27145 thiss!1141) #b00000000000000000000000000011111) (= (mask!27145 thiss!1141) #b00000000000000000000000000111111) (= (mask!27145 thiss!1141) #b00000000000000000000000001111111) (= (mask!27145 thiss!1141) #b00000000000000000000000011111111) (= (mask!27145 thiss!1141) #b00000000000000000000000111111111) (= (mask!27145 thiss!1141) #b00000000000000000000001111111111) (= (mask!27145 thiss!1141) #b00000000000000000000011111111111) (= (mask!27145 thiss!1141) #b00000000000000000000111111111111) (= (mask!27145 thiss!1141) #b00000000000000000001111111111111) (= (mask!27145 thiss!1141) #b00000000000000000011111111111111) (= (mask!27145 thiss!1141) #b00000000000000000111111111111111) (= (mask!27145 thiss!1141) #b00000000000000001111111111111111) (= (mask!27145 thiss!1141) #b00000000000000011111111111111111) (= (mask!27145 thiss!1141) #b00000000000000111111111111111111) (= (mask!27145 thiss!1141) #b00000000000001111111111111111111) (= (mask!27145 thiss!1141) #b00000000000011111111111111111111) (= (mask!27145 thiss!1141) #b00000000000111111111111111111111) (= (mask!27145 thiss!1141) #b00000000001111111111111111111111) (= (mask!27145 thiss!1141) #b00000000011111111111111111111111) (= (mask!27145 thiss!1141) #b00000000111111111111111111111111) (= (mask!27145 thiss!1141) #b00000001111111111111111111111111) (= (mask!27145 thiss!1141) #b00000011111111111111111111111111) (= (mask!27145 thiss!1141) #b00000111111111111111111111111111) (= (mask!27145 thiss!1141) #b00001111111111111111111111111111) (= (mask!27145 thiss!1141) #b00011111111111111111111111111111) (= (mask!27145 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27145 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941001 d!113853))

(declare-fun condMapEmpty!32422 () Bool)

(declare-fun mapDefault!32422 () ValueCell!9725)

(assert (=> mapNonEmpty!32413 (= condMapEmpty!32422 (= mapRest!32413 ((as const (Array (_ BitVec 32) ValueCell!9725)) mapDefault!32422)))))

(declare-fun e!529046 () Bool)

(declare-fun mapRes!32422 () Bool)

(assert (=> mapNonEmpty!32413 (= tp!62194 (and e!529046 mapRes!32422))))

(declare-fun b!941084 () Bool)

(assert (=> b!941084 (= e!529046 tp_is_empty!20413)))

(declare-fun mapNonEmpty!32422 () Bool)

(declare-fun tp!62209 () Bool)

(declare-fun e!529047 () Bool)

(assert (=> mapNonEmpty!32422 (= mapRes!32422 (and tp!62209 e!529047))))

(declare-fun mapValue!32422 () ValueCell!9725)

(declare-fun mapKey!32422 () (_ BitVec 32))

(declare-fun mapRest!32422 () (Array (_ BitVec 32) ValueCell!9725))

(assert (=> mapNonEmpty!32422 (= mapRest!32413 (store mapRest!32422 mapKey!32422 mapValue!32422))))

(declare-fun b!941083 () Bool)

(assert (=> b!941083 (= e!529047 tp_is_empty!20413)))

(declare-fun mapIsEmpty!32422 () Bool)

(assert (=> mapIsEmpty!32422 mapRes!32422))

(assert (= (and mapNonEmpty!32413 condMapEmpty!32422) mapIsEmpty!32422))

(assert (= (and mapNonEmpty!32413 (not condMapEmpty!32422)) mapNonEmpty!32422))

(assert (= (and mapNonEmpty!32422 ((_ is ValueCellFull!9725) mapValue!32422)) b!941083))

(assert (= (and mapNonEmpty!32413 ((_ is ValueCellFull!9725) mapDefault!32422)) b!941084))

(declare-fun m!875731 () Bool)

(assert (=> mapNonEmpty!32422 m!875731))

(check-sat (not d!113851) (not b_next!17905) (not b!941071) (not mapNonEmpty!32422) b_and!29291 (not d!113849) (not b!941057) tp_is_empty!20413 (not b!941056) (not b!941058))
(check-sat b_and!29291 (not b_next!17905))
(get-model)

(declare-fun b!941103 () Bool)

(declare-fun e!529061 () SeekEntryResult!9017)

(assert (=> b!941103 (= e!529061 (Intermediate!9017 true (toIndex!0 key!756 (mask!27145 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!941104 () Bool)

(declare-fun e!529059 () SeekEntryResult!9017)

(assert (=> b!941104 (= e!529059 (Intermediate!9017 false (toIndex!0 key!756 (mask!27145 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!941105 () Bool)

(declare-fun lt!424715 () SeekEntryResult!9017)

(assert (=> b!941105 (and (bvsge (index!38441 lt!424715) #b00000000000000000000000000000000) (bvslt (index!38441 lt!424715) (size!27769 (_keys!10437 thiss!1141))))))

(declare-fun e!529060 () Bool)

(assert (=> b!941105 (= e!529060 (= (select (arr!27306 (_keys!10437 thiss!1141)) (index!38441 lt!424715)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!941106 () Bool)

(declare-fun e!529062 () Bool)

(declare-fun e!529058 () Bool)

(assert (=> b!941106 (= e!529062 e!529058)))

(declare-fun res!632726 () Bool)

(assert (=> b!941106 (= res!632726 (and ((_ is Intermediate!9017) lt!424715) (not (undefined!9829 lt!424715)) (bvslt (x!80753 lt!424715) #b01111111111111111111111111111110) (bvsge (x!80753 lt!424715) #b00000000000000000000000000000000) (bvsge (x!80753 lt!424715) #b00000000000000000000000000000000)))))

(assert (=> b!941106 (=> (not res!632726) (not e!529058))))

(declare-fun d!113855 () Bool)

(assert (=> d!113855 e!529062))

(declare-fun c!97986 () Bool)

(assert (=> d!113855 (= c!97986 (and ((_ is Intermediate!9017) lt!424715) (undefined!9829 lt!424715)))))

(assert (=> d!113855 (= lt!424715 e!529061)))

(declare-fun c!97988 () Bool)

(assert (=> d!113855 (= c!97988 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!424714 () (_ BitVec 64))

(assert (=> d!113855 (= lt!424714 (select (arr!27306 (_keys!10437 thiss!1141)) (toIndex!0 key!756 (mask!27145 thiss!1141))))))

(assert (=> d!113855 (validMask!0 (mask!27145 thiss!1141))))

(assert (=> d!113855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27145 thiss!1141)) key!756 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)) lt!424715)))

(declare-fun b!941107 () Bool)

(assert (=> b!941107 (= e!529061 e!529059)))

(declare-fun c!97987 () Bool)

(assert (=> b!941107 (= c!97987 (or (= lt!424714 key!756) (= (bvadd lt!424714 lt!424714) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!941108 () Bool)

(assert (=> b!941108 (and (bvsge (index!38441 lt!424715) #b00000000000000000000000000000000) (bvslt (index!38441 lt!424715) (size!27769 (_keys!10437 thiss!1141))))))

(declare-fun res!632724 () Bool)

(assert (=> b!941108 (= res!632724 (= (select (arr!27306 (_keys!10437 thiss!1141)) (index!38441 lt!424715)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941108 (=> res!632724 e!529060)))

(declare-fun b!941109 () Bool)

(assert (=> b!941109 (and (bvsge (index!38441 lt!424715) #b00000000000000000000000000000000) (bvslt (index!38441 lt!424715) (size!27769 (_keys!10437 thiss!1141))))))

(declare-fun res!632725 () Bool)

(assert (=> b!941109 (= res!632725 (= (select (arr!27306 (_keys!10437 thiss!1141)) (index!38441 lt!424715)) key!756))))

(assert (=> b!941109 (=> res!632725 e!529060)))

(assert (=> b!941109 (= e!529058 e!529060)))

(declare-fun b!941110 () Bool)

(assert (=> b!941110 (= e!529062 (bvsge (x!80753 lt!424715) #b01111111111111111111111111111110))))

(declare-fun b!941111 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941111 (= e!529059 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27145 thiss!1141)) #b00000000000000000000000000000000 (mask!27145 thiss!1141)) key!756 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)))))

(assert (= (and d!113855 c!97988) b!941103))

(assert (= (and d!113855 (not c!97988)) b!941107))

(assert (= (and b!941107 c!97987) b!941104))

(assert (= (and b!941107 (not c!97987)) b!941111))

(assert (= (and d!113855 c!97986) b!941110))

(assert (= (and d!113855 (not c!97986)) b!941106))

(assert (= (and b!941106 res!632726) b!941109))

(assert (= (and b!941109 (not res!632725)) b!941108))

(assert (= (and b!941108 (not res!632724)) b!941105))

(assert (=> d!113855 m!875725))

(declare-fun m!875733 () Bool)

(assert (=> d!113855 m!875733))

(assert (=> d!113855 m!875677))

(assert (=> b!941111 m!875725))

(declare-fun m!875735 () Bool)

(assert (=> b!941111 m!875735))

(assert (=> b!941111 m!875735))

(declare-fun m!875737 () Bool)

(assert (=> b!941111 m!875737))

(declare-fun m!875739 () Bool)

(assert (=> b!941105 m!875739))

(assert (=> b!941108 m!875739))

(assert (=> b!941109 m!875739))

(assert (=> d!113851 d!113855))

(declare-fun d!113857 () Bool)

(declare-fun lt!424721 () (_ BitVec 32))

(declare-fun lt!424720 () (_ BitVec 32))

(assert (=> d!113857 (= lt!424721 (bvmul (bvxor lt!424720 (bvlshr lt!424720 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!113857 (= lt!424720 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!113857 (and (bvsge (mask!27145 thiss!1141) #b00000000000000000000000000000000) (let ((res!632727 (let ((h!20359 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80771 (bvmul (bvxor h!20359 (bvlshr h!20359 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80771 (bvlshr x!80771 #b00000000000000000000000000001101)) (mask!27145 thiss!1141)))))) (and (bvslt res!632727 (bvadd (mask!27145 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!632727 #b00000000000000000000000000000000))))))

(assert (=> d!113857 (= (toIndex!0 key!756 (mask!27145 thiss!1141)) (bvand (bvxor lt!424721 (bvlshr lt!424721 #b00000000000000000000000000001101)) (mask!27145 thiss!1141)))))

(assert (=> d!113851 d!113857))

(assert (=> d!113851 d!113853))

(declare-fun b!941120 () Bool)

(declare-fun e!529071 () Bool)

(declare-fun e!529070 () Bool)

(assert (=> b!941120 (= e!529071 e!529070)))

(declare-fun c!97991 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!941120 (= c!97991 (validKeyInArray!0 (select (arr!27306 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941121 () Bool)

(declare-fun e!529069 () Bool)

(declare-fun call!40891 () Bool)

(assert (=> b!941121 (= e!529069 call!40891)))

(declare-fun b!941122 () Bool)

(assert (=> b!941122 (= e!529070 call!40891)))

(declare-fun b!941123 () Bool)

(assert (=> b!941123 (= e!529070 e!529069)))

(declare-fun lt!424729 () (_ BitVec 64))

(assert (=> b!941123 (= lt!424729 (select (arr!27306 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31685 0))(
  ( (Unit!31686) )
))
(declare-fun lt!424728 () Unit!31685)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56743 (_ BitVec 64) (_ BitVec 32)) Unit!31685)

(assert (=> b!941123 (= lt!424728 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10437 thiss!1141) lt!424729 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941123 (arrayContainsKey!0 (_keys!10437 thiss!1141) lt!424729 #b00000000000000000000000000000000)))

(declare-fun lt!424730 () Unit!31685)

(assert (=> b!941123 (= lt!424730 lt!424728)))

(declare-fun res!632733 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56743 (_ BitVec 32)) SeekEntryResult!9017)

(assert (=> b!941123 (= res!632733 (= (seekEntryOrOpen!0 (select (arr!27306 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000) (_keys!10437 thiss!1141) (mask!27145 thiss!1141)) (Found!9017 #b00000000000000000000000000000000)))))

(assert (=> b!941123 (=> (not res!632733) (not e!529069))))

(declare-fun d!113859 () Bool)

(declare-fun res!632732 () Bool)

(assert (=> d!113859 (=> res!632732 e!529071)))

(assert (=> d!113859 (= res!632732 (bvsge #b00000000000000000000000000000000 (size!27769 (_keys!10437 thiss!1141))))))

(assert (=> d!113859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)) e!529071)))

(declare-fun bm!40888 () Bool)

(assert (=> bm!40888 (= call!40891 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10437 thiss!1141) (mask!27145 thiss!1141)))))

(assert (= (and d!113859 (not res!632732)) b!941120))

(assert (= (and b!941120 c!97991) b!941123))

(assert (= (and b!941120 (not c!97991)) b!941122))

(assert (= (and b!941123 res!632733) b!941121))

(assert (= (or b!941121 b!941122) bm!40888))

(declare-fun m!875741 () Bool)

(assert (=> b!941120 m!875741))

(assert (=> b!941120 m!875741))

(declare-fun m!875743 () Bool)

(assert (=> b!941120 m!875743))

(assert (=> b!941123 m!875741))

(declare-fun m!875745 () Bool)

(assert (=> b!941123 m!875745))

(declare-fun m!875747 () Bool)

(assert (=> b!941123 m!875747))

(assert (=> b!941123 m!875741))

(declare-fun m!875749 () Bool)

(assert (=> b!941123 m!875749))

(declare-fun m!875751 () Bool)

(assert (=> bm!40888 m!875751))

(assert (=> b!941057 d!113859))

(declare-fun bm!40891 () Bool)

(declare-fun call!40894 () Bool)

(declare-fun c!97994 () Bool)

(assert (=> bm!40891 (= call!40894 (arrayNoDuplicates!0 (_keys!10437 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97994 (Cons!19212 (select (arr!27306 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000) Nil!19213) Nil!19213)))))

(declare-fun b!941134 () Bool)

(declare-fun e!529081 () Bool)

(assert (=> b!941134 (= e!529081 call!40894)))

(declare-fun b!941135 () Bool)

(declare-fun e!529083 () Bool)

(assert (=> b!941135 (= e!529083 e!529081)))

(assert (=> b!941135 (= c!97994 (validKeyInArray!0 (select (arr!27306 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941136 () Bool)

(declare-fun e!529080 () Bool)

(declare-fun contains!5094 (List!19216 (_ BitVec 64)) Bool)

(assert (=> b!941136 (= e!529080 (contains!5094 Nil!19213 (select (arr!27306 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!113861 () Bool)

(declare-fun res!632740 () Bool)

(declare-fun e!529082 () Bool)

(assert (=> d!113861 (=> res!632740 e!529082)))

(assert (=> d!113861 (= res!632740 (bvsge #b00000000000000000000000000000000 (size!27769 (_keys!10437 thiss!1141))))))

(assert (=> d!113861 (= (arrayNoDuplicates!0 (_keys!10437 thiss!1141) #b00000000000000000000000000000000 Nil!19213) e!529082)))

(declare-fun b!941137 () Bool)

(assert (=> b!941137 (= e!529082 e!529083)))

(declare-fun res!632742 () Bool)

(assert (=> b!941137 (=> (not res!632742) (not e!529083))))

(assert (=> b!941137 (= res!632742 (not e!529080))))

(declare-fun res!632741 () Bool)

(assert (=> b!941137 (=> (not res!632741) (not e!529080))))

(assert (=> b!941137 (= res!632741 (validKeyInArray!0 (select (arr!27306 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941138 () Bool)

(assert (=> b!941138 (= e!529081 call!40894)))

(assert (= (and d!113861 (not res!632740)) b!941137))

(assert (= (and b!941137 res!632741) b!941136))

(assert (= (and b!941137 res!632742) b!941135))

(assert (= (and b!941135 c!97994) b!941138))

(assert (= (and b!941135 (not c!97994)) b!941134))

(assert (= (or b!941138 b!941134) bm!40891))

(assert (=> bm!40891 m!875741))

(declare-fun m!875753 () Bool)

(assert (=> bm!40891 m!875753))

(assert (=> b!941135 m!875741))

(assert (=> b!941135 m!875741))

(assert (=> b!941135 m!875743))

(assert (=> b!941136 m!875741))

(assert (=> b!941136 m!875741))

(declare-fun m!875755 () Bool)

(assert (=> b!941136 m!875755))

(assert (=> b!941137 m!875741))

(assert (=> b!941137 m!875741))

(assert (=> b!941137 m!875743))

(assert (=> b!941058 d!113861))

(declare-fun b!941151 () Bool)

(declare-fun e!529092 () SeekEntryResult!9017)

(assert (=> b!941151 (= e!529092 (MissingVacant!9017 (index!38441 lt!424706)))))

(declare-fun b!941152 () Bool)

(assert (=> b!941152 (= e!529092 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80753 lt!424706) #b00000000000000000000000000000001) (nextIndex!0 (index!38441 lt!424706) (x!80753 lt!424706) (mask!27145 thiss!1141)) (index!38441 lt!424706) key!756 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)))))

(declare-fun d!113863 () Bool)

(declare-fun lt!424735 () SeekEntryResult!9017)

(assert (=> d!113863 (and (or ((_ is Undefined!9017) lt!424735) (not ((_ is Found!9017) lt!424735)) (and (bvsge (index!38440 lt!424735) #b00000000000000000000000000000000) (bvslt (index!38440 lt!424735) (size!27769 (_keys!10437 thiss!1141))))) (or ((_ is Undefined!9017) lt!424735) ((_ is Found!9017) lt!424735) (not ((_ is MissingVacant!9017) lt!424735)) (not (= (index!38442 lt!424735) (index!38441 lt!424706))) (and (bvsge (index!38442 lt!424735) #b00000000000000000000000000000000) (bvslt (index!38442 lt!424735) (size!27769 (_keys!10437 thiss!1141))))) (or ((_ is Undefined!9017) lt!424735) (ite ((_ is Found!9017) lt!424735) (= (select (arr!27306 (_keys!10437 thiss!1141)) (index!38440 lt!424735)) key!756) (and ((_ is MissingVacant!9017) lt!424735) (= (index!38442 lt!424735) (index!38441 lt!424706)) (= (select (arr!27306 (_keys!10437 thiss!1141)) (index!38442 lt!424735)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!529091 () SeekEntryResult!9017)

(assert (=> d!113863 (= lt!424735 e!529091)))

(declare-fun c!98002 () Bool)

(assert (=> d!113863 (= c!98002 (bvsge (x!80753 lt!424706) #b01111111111111111111111111111110))))

(declare-fun lt!424736 () (_ BitVec 64))

(assert (=> d!113863 (= lt!424736 (select (arr!27306 (_keys!10437 thiss!1141)) (index!38441 lt!424706)))))

(assert (=> d!113863 (validMask!0 (mask!27145 thiss!1141))))

(assert (=> d!113863 (= (seekKeyOrZeroReturnVacant!0 (x!80753 lt!424706) (index!38441 lt!424706) (index!38441 lt!424706) key!756 (_keys!10437 thiss!1141) (mask!27145 thiss!1141)) lt!424735)))

(declare-fun b!941153 () Bool)

(declare-fun e!529090 () SeekEntryResult!9017)

(assert (=> b!941153 (= e!529090 (Found!9017 (index!38441 lt!424706)))))

(declare-fun b!941154 () Bool)

(assert (=> b!941154 (= e!529091 e!529090)))

(declare-fun c!98003 () Bool)

(assert (=> b!941154 (= c!98003 (= lt!424736 key!756))))

(declare-fun b!941155 () Bool)

(assert (=> b!941155 (= e!529091 Undefined!9017)))

(declare-fun b!941156 () Bool)

(declare-fun c!98001 () Bool)

(assert (=> b!941156 (= c!98001 (= lt!424736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941156 (= e!529090 e!529092)))

(assert (= (and d!113863 c!98002) b!941155))

(assert (= (and d!113863 (not c!98002)) b!941154))

(assert (= (and b!941154 c!98003) b!941153))

(assert (= (and b!941154 (not c!98003)) b!941156))

(assert (= (and b!941156 c!98001) b!941151))

(assert (= (and b!941156 (not c!98001)) b!941152))

(declare-fun m!875757 () Bool)

(assert (=> b!941152 m!875757))

(assert (=> b!941152 m!875757))

(declare-fun m!875759 () Bool)

(assert (=> b!941152 m!875759))

(declare-fun m!875761 () Bool)

(assert (=> d!113863 m!875761))

(declare-fun m!875763 () Bool)

(assert (=> d!113863 m!875763))

(assert (=> d!113863 m!875729))

(assert (=> d!113863 m!875677))

(assert (=> b!941071 d!113863))

(declare-fun b!941165 () Bool)

(declare-fun e!529097 () (_ BitVec 32))

(declare-fun e!529098 () (_ BitVec 32))

(assert (=> b!941165 (= e!529097 e!529098)))

(declare-fun c!98008 () Bool)

(assert (=> b!941165 (= c!98008 (validKeyInArray!0 (select (arr!27306 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941166 () Bool)

(assert (=> b!941166 (= e!529097 #b00000000000000000000000000000000)))

(declare-fun bm!40894 () Bool)

(declare-fun call!40897 () (_ BitVec 32))

(assert (=> bm!40894 (= call!40897 (arrayCountValidKeys!0 (_keys!10437 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27769 (_keys!10437 thiss!1141))))))

(declare-fun b!941167 () Bool)

(assert (=> b!941167 (= e!529098 call!40897)))

(declare-fun b!941168 () Bool)

(assert (=> b!941168 (= e!529098 (bvadd #b00000000000000000000000000000001 call!40897))))

(declare-fun d!113865 () Bool)

(declare-fun lt!424739 () (_ BitVec 32))

(assert (=> d!113865 (and (bvsge lt!424739 #b00000000000000000000000000000000) (bvsle lt!424739 (bvsub (size!27769 (_keys!10437 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!113865 (= lt!424739 e!529097)))

(declare-fun c!98009 () Bool)

(assert (=> d!113865 (= c!98009 (bvsge #b00000000000000000000000000000000 (size!27769 (_keys!10437 thiss!1141))))))

(assert (=> d!113865 (and (bvsle #b00000000000000000000000000000000 (size!27769 (_keys!10437 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27769 (_keys!10437 thiss!1141)) (size!27769 (_keys!10437 thiss!1141))))))

(assert (=> d!113865 (= (arrayCountValidKeys!0 (_keys!10437 thiss!1141) #b00000000000000000000000000000000 (size!27769 (_keys!10437 thiss!1141))) lt!424739)))

(assert (= (and d!113865 c!98009) b!941166))

(assert (= (and d!113865 (not c!98009)) b!941165))

(assert (= (and b!941165 c!98008) b!941168))

(assert (= (and b!941165 (not c!98008)) b!941167))

(assert (= (or b!941168 b!941167) bm!40894))

(assert (=> b!941165 m!875741))

(assert (=> b!941165 m!875741))

(assert (=> b!941165 m!875743))

(declare-fun m!875765 () Bool)

(assert (=> bm!40894 m!875765))

(assert (=> b!941056 d!113865))

(declare-fun b!941180 () Bool)

(declare-fun e!529101 () Bool)

(assert (=> b!941180 (= e!529101 (and (bvsge (extraKeys!5323 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5323 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2355 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!941179 () Bool)

(declare-fun res!632754 () Bool)

(assert (=> b!941179 (=> (not res!632754) (not e!529101))))

(declare-fun size!27774 (LongMapFixedSize!4600) (_ BitVec 32))

(assert (=> b!941179 (= res!632754 (= (size!27774 thiss!1141) (bvadd (_size!2355 thiss!1141) (bvsdiv (bvadd (extraKeys!5323 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!113867 () Bool)

(declare-fun res!632751 () Bool)

(assert (=> d!113867 (=> (not res!632751) (not e!529101))))

(assert (=> d!113867 (= res!632751 (validMask!0 (mask!27145 thiss!1141)))))

(assert (=> d!113867 (= (simpleValid!340 thiss!1141) e!529101)))

(declare-fun b!941177 () Bool)

(declare-fun res!632753 () Bool)

(assert (=> b!941177 (=> (not res!632753) (not e!529101))))

(assert (=> b!941177 (= res!632753 (and (= (size!27768 (_values!5614 thiss!1141)) (bvadd (mask!27145 thiss!1141) #b00000000000000000000000000000001)) (= (size!27769 (_keys!10437 thiss!1141)) (size!27768 (_values!5614 thiss!1141))) (bvsge (_size!2355 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2355 thiss!1141) (bvadd (mask!27145 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!941178 () Bool)

(declare-fun res!632752 () Bool)

(assert (=> b!941178 (=> (not res!632752) (not e!529101))))

(assert (=> b!941178 (= res!632752 (bvsge (size!27774 thiss!1141) (_size!2355 thiss!1141)))))

(assert (= (and d!113867 res!632751) b!941177))

(assert (= (and b!941177 res!632753) b!941178))

(assert (= (and b!941178 res!632752) b!941179))

(assert (= (and b!941179 res!632754) b!941180))

(declare-fun m!875767 () Bool)

(assert (=> b!941179 m!875767))

(assert (=> d!113867 m!875677))

(assert (=> b!941178 m!875767))

(assert (=> d!113849 d!113867))

(declare-fun condMapEmpty!32423 () Bool)

(declare-fun mapDefault!32423 () ValueCell!9725)

(assert (=> mapNonEmpty!32422 (= condMapEmpty!32423 (= mapRest!32422 ((as const (Array (_ BitVec 32) ValueCell!9725)) mapDefault!32423)))))

(declare-fun e!529102 () Bool)

(declare-fun mapRes!32423 () Bool)

(assert (=> mapNonEmpty!32422 (= tp!62209 (and e!529102 mapRes!32423))))

(declare-fun b!941182 () Bool)

(assert (=> b!941182 (= e!529102 tp_is_empty!20413)))

(declare-fun mapNonEmpty!32423 () Bool)

(declare-fun tp!62210 () Bool)

(declare-fun e!529103 () Bool)

(assert (=> mapNonEmpty!32423 (= mapRes!32423 (and tp!62210 e!529103))))

(declare-fun mapValue!32423 () ValueCell!9725)

(declare-fun mapRest!32423 () (Array (_ BitVec 32) ValueCell!9725))

(declare-fun mapKey!32423 () (_ BitVec 32))

(assert (=> mapNonEmpty!32423 (= mapRest!32422 (store mapRest!32423 mapKey!32423 mapValue!32423))))

(declare-fun b!941181 () Bool)

(assert (=> b!941181 (= e!529103 tp_is_empty!20413)))

(declare-fun mapIsEmpty!32423 () Bool)

(assert (=> mapIsEmpty!32423 mapRes!32423))

(assert (= (and mapNonEmpty!32422 condMapEmpty!32423) mapIsEmpty!32423))

(assert (= (and mapNonEmpty!32422 (not condMapEmpty!32423)) mapNonEmpty!32423))

(assert (= (and mapNonEmpty!32423 ((_ is ValueCellFull!9725) mapValue!32423)) b!941181))

(assert (= (and mapNonEmpty!32422 ((_ is ValueCellFull!9725) mapDefault!32423)) b!941182))

(declare-fun m!875769 () Bool)

(assert (=> mapNonEmpty!32423 m!875769))

(check-sat (not b!941178) (not mapNonEmpty!32423) b_and!29291 (not b!941136) (not bm!40888) (not d!113867) tp_is_empty!20413 (not b!941137) (not b!941120) (not b!941111) (not bm!40894) (not b_next!17905) (not b!941123) (not d!113863) (not bm!40891) (not b!941152) (not b!941135) (not b!941165) (not b!941179) (not d!113855))
(check-sat b_and!29291 (not b_next!17905))
