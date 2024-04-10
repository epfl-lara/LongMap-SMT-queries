; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75606 () Bool)

(assert start!75606)

(declare-fun b!889082 () Bool)

(declare-fun b_free!15603 () Bool)

(declare-fun b_next!15603 () Bool)

(assert (=> b!889082 (= b_free!15603 (not b_next!15603))))

(declare-fun tp!54771 () Bool)

(declare-fun b_and!25843 () Bool)

(assert (=> b!889082 (= tp!54771 b_and!25843)))

(declare-fun b!889077 () Bool)

(declare-fun res!602592 () Bool)

(declare-fun e!495526 () Bool)

(assert (=> b!889077 (=> (not res!602592) (not e!495526))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889077 (= res!602592 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889078 () Bool)

(declare-fun e!495521 () Bool)

(declare-fun tp_is_empty!17931 () Bool)

(assert (=> b!889078 (= e!495521 tp_is_empty!17931)))

(declare-fun b!889079 () Bool)

(declare-fun e!495523 () Bool)

(assert (=> b!889079 (= e!495523 tp_is_empty!17931)))

(declare-fun b!889080 () Bool)

(declare-fun e!495522 () Bool)

(declare-fun mapRes!28444 () Bool)

(assert (=> b!889080 (= e!495522 (and e!495521 mapRes!28444))))

(declare-fun condMapEmpty!28444 () Bool)

(declare-datatypes ((array!51838 0))(
  ( (array!51839 (arr!24927 (Array (_ BitVec 32) (_ BitVec 64))) (size!25370 (_ BitVec 32))) )
))
(declare-datatypes ((V!28873 0))(
  ( (V!28874 (val!9016 Int)) )
))
(declare-datatypes ((ValueCell!8484 0))(
  ( (ValueCellFull!8484 (v!11494 V!28873)) (EmptyCell!8484) )
))
(declare-datatypes ((array!51840 0))(
  ( (array!51841 (arr!24928 (Array (_ BitVec 32) ValueCell!8484)) (size!25371 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3984 0))(
  ( (LongMapFixedSize!3985 (defaultEntry!5189 Int) (mask!25627 (_ BitVec 32)) (extraKeys!4883 (_ BitVec 32)) (zeroValue!4987 V!28873) (minValue!4987 V!28873) (_size!2047 (_ BitVec 32)) (_keys!9871 array!51838) (_values!5174 array!51840) (_vacant!2047 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3984)

(declare-fun mapDefault!28444 () ValueCell!8484)

(assert (=> b!889080 (= condMapEmpty!28444 (= (arr!24928 (_values!5174 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8484)) mapDefault!28444)))))

(declare-fun b!889081 () Bool)

(assert (=> b!889081 (= e!495526 (not (= (size!25370 (_keys!9871 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25627 thiss!1181)))))))

(declare-fun e!495525 () Bool)

(declare-fun array_inv!19616 (array!51838) Bool)

(declare-fun array_inv!19617 (array!51840) Bool)

(assert (=> b!889082 (= e!495525 (and tp!54771 tp_is_empty!17931 (array_inv!19616 (_keys!9871 thiss!1181)) (array_inv!19617 (_values!5174 thiss!1181)) e!495522))))

(declare-fun res!602594 () Bool)

(assert (=> start!75606 (=> (not res!602594) (not e!495526))))

(declare-fun valid!1554 (LongMapFixedSize!3984) Bool)

(assert (=> start!75606 (= res!602594 (valid!1554 thiss!1181))))

(assert (=> start!75606 e!495526))

(assert (=> start!75606 e!495525))

(assert (=> start!75606 true))

(declare-fun mapIsEmpty!28444 () Bool)

(assert (=> mapIsEmpty!28444 mapRes!28444))

(declare-fun mapNonEmpty!28444 () Bool)

(declare-fun tp!54770 () Bool)

(assert (=> mapNonEmpty!28444 (= mapRes!28444 (and tp!54770 e!495523))))

(declare-fun mapKey!28444 () (_ BitVec 32))

(declare-fun mapValue!28444 () ValueCell!8484)

(declare-fun mapRest!28444 () (Array (_ BitVec 32) ValueCell!8484))

(assert (=> mapNonEmpty!28444 (= (arr!24928 (_values!5174 thiss!1181)) (store mapRest!28444 mapKey!28444 mapValue!28444))))

(declare-fun b!889083 () Bool)

(declare-fun res!602593 () Bool)

(assert (=> b!889083 (=> (not res!602593) (not e!495526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889083 (= res!602593 (validMask!0 (mask!25627 thiss!1181)))))

(assert (= (and start!75606 res!602594) b!889077))

(assert (= (and b!889077 res!602592) b!889083))

(assert (= (and b!889083 res!602593) b!889081))

(assert (= (and b!889080 condMapEmpty!28444) mapIsEmpty!28444))

(assert (= (and b!889080 (not condMapEmpty!28444)) mapNonEmpty!28444))

(get-info :version)

(assert (= (and mapNonEmpty!28444 ((_ is ValueCellFull!8484) mapValue!28444)) b!889079))

(assert (= (and b!889080 ((_ is ValueCellFull!8484) mapDefault!28444)) b!889078))

(assert (= b!889082 b!889080))

(assert (= start!75606 b!889082))

(declare-fun m!828163 () Bool)

(assert (=> b!889082 m!828163))

(declare-fun m!828165 () Bool)

(assert (=> b!889082 m!828165))

(declare-fun m!828167 () Bool)

(assert (=> start!75606 m!828167))

(declare-fun m!828169 () Bool)

(assert (=> mapNonEmpty!28444 m!828169))

(declare-fun m!828171 () Bool)

(assert (=> b!889083 m!828171))

(check-sat (not mapNonEmpty!28444) (not b_next!15603) b_and!25843 (not b!889083) (not b!889082) tp_is_empty!17931 (not start!75606))
(check-sat b_and!25843 (not b_next!15603))
(get-model)

(declare-fun d!110137 () Bool)

(assert (=> d!110137 (= (array_inv!19616 (_keys!9871 thiss!1181)) (bvsge (size!25370 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889082 d!110137))

(declare-fun d!110139 () Bool)

(assert (=> d!110139 (= (array_inv!19617 (_values!5174 thiss!1181)) (bvsge (size!25371 (_values!5174 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889082 d!110139))

(declare-fun d!110141 () Bool)

(assert (=> d!110141 (= (validMask!0 (mask!25627 thiss!1181)) (and (or (= (mask!25627 thiss!1181) #b00000000000000000000000000000111) (= (mask!25627 thiss!1181) #b00000000000000000000000000001111) (= (mask!25627 thiss!1181) #b00000000000000000000000000011111) (= (mask!25627 thiss!1181) #b00000000000000000000000000111111) (= (mask!25627 thiss!1181) #b00000000000000000000000001111111) (= (mask!25627 thiss!1181) #b00000000000000000000000011111111) (= (mask!25627 thiss!1181) #b00000000000000000000000111111111) (= (mask!25627 thiss!1181) #b00000000000000000000001111111111) (= (mask!25627 thiss!1181) #b00000000000000000000011111111111) (= (mask!25627 thiss!1181) #b00000000000000000000111111111111) (= (mask!25627 thiss!1181) #b00000000000000000001111111111111) (= (mask!25627 thiss!1181) #b00000000000000000011111111111111) (= (mask!25627 thiss!1181) #b00000000000000000111111111111111) (= (mask!25627 thiss!1181) #b00000000000000001111111111111111) (= (mask!25627 thiss!1181) #b00000000000000011111111111111111) (= (mask!25627 thiss!1181) #b00000000000000111111111111111111) (= (mask!25627 thiss!1181) #b00000000000001111111111111111111) (= (mask!25627 thiss!1181) #b00000000000011111111111111111111) (= (mask!25627 thiss!1181) #b00000000000111111111111111111111) (= (mask!25627 thiss!1181) #b00000000001111111111111111111111) (= (mask!25627 thiss!1181) #b00000000011111111111111111111111) (= (mask!25627 thiss!1181) #b00000000111111111111111111111111) (= (mask!25627 thiss!1181) #b00000001111111111111111111111111) (= (mask!25627 thiss!1181) #b00000011111111111111111111111111) (= (mask!25627 thiss!1181) #b00000111111111111111111111111111) (= (mask!25627 thiss!1181) #b00001111111111111111111111111111) (= (mask!25627 thiss!1181) #b00011111111111111111111111111111) (= (mask!25627 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25627 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!889083 d!110141))

(declare-fun d!110143 () Bool)

(declare-fun res!602610 () Bool)

(declare-fun e!495547 () Bool)

(assert (=> d!110143 (=> (not res!602610) (not e!495547))))

(declare-fun simpleValid!293 (LongMapFixedSize!3984) Bool)

(assert (=> d!110143 (= res!602610 (simpleValid!293 thiss!1181))))

(assert (=> d!110143 (= (valid!1554 thiss!1181) e!495547)))

(declare-fun b!889111 () Bool)

(declare-fun res!602611 () Bool)

(assert (=> b!889111 (=> (not res!602611) (not e!495547))))

(declare-fun arrayCountValidKeys!0 (array!51838 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889111 (= res!602611 (= (arrayCountValidKeys!0 (_keys!9871 thiss!1181) #b00000000000000000000000000000000 (size!25370 (_keys!9871 thiss!1181))) (_size!2047 thiss!1181)))))

(declare-fun b!889112 () Bool)

(declare-fun res!602612 () Bool)

(assert (=> b!889112 (=> (not res!602612) (not e!495547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51838 (_ BitVec 32)) Bool)

(assert (=> b!889112 (= res!602612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9871 thiss!1181) (mask!25627 thiss!1181)))))

(declare-fun b!889113 () Bool)

(declare-datatypes ((List!17697 0))(
  ( (Nil!17694) (Cons!17693 (h!18824 (_ BitVec 64)) (t!24996 List!17697)) )
))
(declare-fun arrayNoDuplicates!0 (array!51838 (_ BitVec 32) List!17697) Bool)

(assert (=> b!889113 (= e!495547 (arrayNoDuplicates!0 (_keys!9871 thiss!1181) #b00000000000000000000000000000000 Nil!17694))))

(assert (= (and d!110143 res!602610) b!889111))

(assert (= (and b!889111 res!602611) b!889112))

(assert (= (and b!889112 res!602612) b!889113))

(declare-fun m!828183 () Bool)

(assert (=> d!110143 m!828183))

(declare-fun m!828185 () Bool)

(assert (=> b!889111 m!828185))

(declare-fun m!828187 () Bool)

(assert (=> b!889112 m!828187))

(declare-fun m!828189 () Bool)

(assert (=> b!889113 m!828189))

(assert (=> start!75606 d!110143))

(declare-fun mapIsEmpty!28450 () Bool)

(declare-fun mapRes!28450 () Bool)

(assert (=> mapIsEmpty!28450 mapRes!28450))

(declare-fun condMapEmpty!28450 () Bool)

(declare-fun mapDefault!28450 () ValueCell!8484)

(assert (=> mapNonEmpty!28444 (= condMapEmpty!28450 (= mapRest!28444 ((as const (Array (_ BitVec 32) ValueCell!8484)) mapDefault!28450)))))

(declare-fun e!495553 () Bool)

(assert (=> mapNonEmpty!28444 (= tp!54770 (and e!495553 mapRes!28450))))

(declare-fun b!889120 () Bool)

(declare-fun e!495552 () Bool)

(assert (=> b!889120 (= e!495552 tp_is_empty!17931)))

(declare-fun b!889121 () Bool)

(assert (=> b!889121 (= e!495553 tp_is_empty!17931)))

(declare-fun mapNonEmpty!28450 () Bool)

(declare-fun tp!54780 () Bool)

(assert (=> mapNonEmpty!28450 (= mapRes!28450 (and tp!54780 e!495552))))

(declare-fun mapKey!28450 () (_ BitVec 32))

(declare-fun mapRest!28450 () (Array (_ BitVec 32) ValueCell!8484))

(declare-fun mapValue!28450 () ValueCell!8484)

(assert (=> mapNonEmpty!28450 (= mapRest!28444 (store mapRest!28450 mapKey!28450 mapValue!28450))))

(assert (= (and mapNonEmpty!28444 condMapEmpty!28450) mapIsEmpty!28450))

(assert (= (and mapNonEmpty!28444 (not condMapEmpty!28450)) mapNonEmpty!28450))

(assert (= (and mapNonEmpty!28450 ((_ is ValueCellFull!8484) mapValue!28450)) b!889120))

(assert (= (and mapNonEmpty!28444 ((_ is ValueCellFull!8484) mapDefault!28450)) b!889121))

(declare-fun m!828191 () Bool)

(assert (=> mapNonEmpty!28450 m!828191))

(check-sat (not b!889113) (not d!110143) (not b!889111) (not b!889112) (not b_next!15603) (not mapNonEmpty!28450) tp_is_empty!17931 b_and!25843)
(check-sat b_and!25843 (not b_next!15603))
(get-model)

(declare-fun b!889130 () Bool)

(declare-fun e!495561 () Bool)

(declare-fun e!495560 () Bool)

(assert (=> b!889130 (= e!495561 e!495560)))

(declare-fun c!93936 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!889130 (= c!93936 (validKeyInArray!0 (select (arr!24927 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889132 () Bool)

(declare-fun call!39504 () Bool)

(assert (=> b!889132 (= e!495560 call!39504)))

(declare-fun b!889133 () Bool)

(declare-fun e!495562 () Bool)

(assert (=> b!889133 (= e!495560 e!495562)))

(declare-fun lt!401987 () (_ BitVec 64))

(assert (=> b!889133 (= lt!401987 (select (arr!24927 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30280 0))(
  ( (Unit!30281) )
))
(declare-fun lt!401988 () Unit!30280)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51838 (_ BitVec 64) (_ BitVec 32)) Unit!30280)

(assert (=> b!889133 (= lt!401988 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9871 thiss!1181) lt!401987 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!889133 (arrayContainsKey!0 (_keys!9871 thiss!1181) lt!401987 #b00000000000000000000000000000000)))

(declare-fun lt!401989 () Unit!30280)

(assert (=> b!889133 (= lt!401989 lt!401988)))

(declare-fun res!602618 () Bool)

(declare-datatypes ((SeekEntryResult!8770 0))(
  ( (MissingZero!8770 (index!37451 (_ BitVec 32))) (Found!8770 (index!37452 (_ BitVec 32))) (Intermediate!8770 (undefined!9582 Bool) (index!37453 (_ BitVec 32)) (x!75474 (_ BitVec 32))) (Undefined!8770) (MissingVacant!8770 (index!37454 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51838 (_ BitVec 32)) SeekEntryResult!8770)

(assert (=> b!889133 (= res!602618 (= (seekEntryOrOpen!0 (select (arr!24927 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000) (_keys!9871 thiss!1181) (mask!25627 thiss!1181)) (Found!8770 #b00000000000000000000000000000000)))))

(assert (=> b!889133 (=> (not res!602618) (not e!495562))))

(declare-fun bm!39501 () Bool)

(assert (=> bm!39501 (= call!39504 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9871 thiss!1181) (mask!25627 thiss!1181)))))

(declare-fun b!889131 () Bool)

(assert (=> b!889131 (= e!495562 call!39504)))

(declare-fun d!110145 () Bool)

(declare-fun res!602617 () Bool)

(assert (=> d!110145 (=> res!602617 e!495561)))

(assert (=> d!110145 (= res!602617 (bvsge #b00000000000000000000000000000000 (size!25370 (_keys!9871 thiss!1181))))))

(assert (=> d!110145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9871 thiss!1181) (mask!25627 thiss!1181)) e!495561)))

(assert (= (and d!110145 (not res!602617)) b!889130))

(assert (= (and b!889130 c!93936) b!889133))

(assert (= (and b!889130 (not c!93936)) b!889132))

(assert (= (and b!889133 res!602618) b!889131))

(assert (= (or b!889131 b!889132) bm!39501))

(declare-fun m!828193 () Bool)

(assert (=> b!889130 m!828193))

(assert (=> b!889130 m!828193))

(declare-fun m!828195 () Bool)

(assert (=> b!889130 m!828195))

(assert (=> b!889133 m!828193))

(declare-fun m!828197 () Bool)

(assert (=> b!889133 m!828197))

(declare-fun m!828199 () Bool)

(assert (=> b!889133 m!828199))

(assert (=> b!889133 m!828193))

(declare-fun m!828201 () Bool)

(assert (=> b!889133 m!828201))

(declare-fun m!828203 () Bool)

(assert (=> bm!39501 m!828203))

(assert (=> b!889112 d!110145))

(declare-fun b!889142 () Bool)

(declare-fun e!495568 () (_ BitVec 32))

(declare-fun call!39507 () (_ BitVec 32))

(assert (=> b!889142 (= e!495568 call!39507)))

(declare-fun b!889143 () Bool)

(declare-fun e!495567 () (_ BitVec 32))

(assert (=> b!889143 (= e!495567 e!495568)))

(declare-fun c!93941 () Bool)

(assert (=> b!889143 (= c!93941 (validKeyInArray!0 (select (arr!24927 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110147 () Bool)

(declare-fun lt!401992 () (_ BitVec 32))

(assert (=> d!110147 (and (bvsge lt!401992 #b00000000000000000000000000000000) (bvsle lt!401992 (bvsub (size!25370 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110147 (= lt!401992 e!495567)))

(declare-fun c!93942 () Bool)

(assert (=> d!110147 (= c!93942 (bvsge #b00000000000000000000000000000000 (size!25370 (_keys!9871 thiss!1181))))))

(assert (=> d!110147 (and (bvsle #b00000000000000000000000000000000 (size!25370 (_keys!9871 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25370 (_keys!9871 thiss!1181)) (size!25370 (_keys!9871 thiss!1181))))))

(assert (=> d!110147 (= (arrayCountValidKeys!0 (_keys!9871 thiss!1181) #b00000000000000000000000000000000 (size!25370 (_keys!9871 thiss!1181))) lt!401992)))

(declare-fun b!889144 () Bool)

(assert (=> b!889144 (= e!495568 (bvadd #b00000000000000000000000000000001 call!39507))))

(declare-fun b!889145 () Bool)

(assert (=> b!889145 (= e!495567 #b00000000000000000000000000000000)))

(declare-fun bm!39504 () Bool)

(assert (=> bm!39504 (= call!39507 (arrayCountValidKeys!0 (_keys!9871 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25370 (_keys!9871 thiss!1181))))))

(assert (= (and d!110147 c!93942) b!889145))

(assert (= (and d!110147 (not c!93942)) b!889143))

(assert (= (and b!889143 c!93941) b!889144))

(assert (= (and b!889143 (not c!93941)) b!889142))

(assert (= (or b!889144 b!889142) bm!39504))

(assert (=> b!889143 m!828193))

(assert (=> b!889143 m!828193))

(assert (=> b!889143 m!828195))

(declare-fun m!828205 () Bool)

(assert (=> bm!39504 m!828205))

(assert (=> b!889111 d!110147))

(declare-fun b!889156 () Bool)

(declare-fun res!602629 () Bool)

(declare-fun e!495571 () Bool)

(assert (=> b!889156 (=> (not res!602629) (not e!495571))))

(declare-fun size!25374 (LongMapFixedSize!3984) (_ BitVec 32))

(assert (=> b!889156 (= res!602629 (= (size!25374 thiss!1181) (bvadd (_size!2047 thiss!1181) (bvsdiv (bvadd (extraKeys!4883 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!110149 () Bool)

(declare-fun res!602630 () Bool)

(assert (=> d!110149 (=> (not res!602630) (not e!495571))))

(assert (=> d!110149 (= res!602630 (validMask!0 (mask!25627 thiss!1181)))))

(assert (=> d!110149 (= (simpleValid!293 thiss!1181) e!495571)))

(declare-fun b!889154 () Bool)

(declare-fun res!602627 () Bool)

(assert (=> b!889154 (=> (not res!602627) (not e!495571))))

(assert (=> b!889154 (= res!602627 (and (= (size!25371 (_values!5174 thiss!1181)) (bvadd (mask!25627 thiss!1181) #b00000000000000000000000000000001)) (= (size!25370 (_keys!9871 thiss!1181)) (size!25371 (_values!5174 thiss!1181))) (bvsge (_size!2047 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2047 thiss!1181) (bvadd (mask!25627 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!889157 () Bool)

(assert (=> b!889157 (= e!495571 (and (bvsge (extraKeys!4883 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4883 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2047 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!889155 () Bool)

(declare-fun res!602628 () Bool)

(assert (=> b!889155 (=> (not res!602628) (not e!495571))))

(assert (=> b!889155 (= res!602628 (bvsge (size!25374 thiss!1181) (_size!2047 thiss!1181)))))

(assert (= (and d!110149 res!602630) b!889154))

(assert (= (and b!889154 res!602627) b!889155))

(assert (= (and b!889155 res!602628) b!889156))

(assert (= (and b!889156 res!602629) b!889157))

(declare-fun m!828207 () Bool)

(assert (=> b!889156 m!828207))

(assert (=> d!110149 m!828171))

(assert (=> b!889155 m!828207))

(assert (=> d!110143 d!110149))

(declare-fun d!110151 () Bool)

(declare-fun res!602639 () Bool)

(declare-fun e!495583 () Bool)

(assert (=> d!110151 (=> res!602639 e!495583)))

(assert (=> d!110151 (= res!602639 (bvsge #b00000000000000000000000000000000 (size!25370 (_keys!9871 thiss!1181))))))

(assert (=> d!110151 (= (arrayNoDuplicates!0 (_keys!9871 thiss!1181) #b00000000000000000000000000000000 Nil!17694) e!495583)))

(declare-fun b!889168 () Bool)

(declare-fun e!495582 () Bool)

(assert (=> b!889168 (= e!495583 e!495582)))

(declare-fun res!602637 () Bool)

(assert (=> b!889168 (=> (not res!602637) (not e!495582))))

(declare-fun e!495581 () Bool)

(assert (=> b!889168 (= res!602637 (not e!495581))))

(declare-fun res!602638 () Bool)

(assert (=> b!889168 (=> (not res!602638) (not e!495581))))

(assert (=> b!889168 (= res!602638 (validKeyInArray!0 (select (arr!24927 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889169 () Bool)

(declare-fun e!495580 () Bool)

(declare-fun call!39510 () Bool)

(assert (=> b!889169 (= e!495580 call!39510)))

(declare-fun b!889170 () Bool)

(declare-fun contains!4336 (List!17697 (_ BitVec 64)) Bool)

(assert (=> b!889170 (= e!495581 (contains!4336 Nil!17694 (select (arr!24927 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889171 () Bool)

(assert (=> b!889171 (= e!495580 call!39510)))

(declare-fun bm!39507 () Bool)

(declare-fun c!93945 () Bool)

(assert (=> bm!39507 (= call!39510 (arrayNoDuplicates!0 (_keys!9871 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93945 (Cons!17693 (select (arr!24927 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000) Nil!17694) Nil!17694)))))

(declare-fun b!889172 () Bool)

(assert (=> b!889172 (= e!495582 e!495580)))

(assert (=> b!889172 (= c!93945 (validKeyInArray!0 (select (arr!24927 (_keys!9871 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110151 (not res!602639)) b!889168))

(assert (= (and b!889168 res!602638) b!889170))

(assert (= (and b!889168 res!602637) b!889172))

(assert (= (and b!889172 c!93945) b!889171))

(assert (= (and b!889172 (not c!93945)) b!889169))

(assert (= (or b!889171 b!889169) bm!39507))

(assert (=> b!889168 m!828193))

(assert (=> b!889168 m!828193))

(assert (=> b!889168 m!828195))

(assert (=> b!889170 m!828193))

(assert (=> b!889170 m!828193))

(declare-fun m!828209 () Bool)

(assert (=> b!889170 m!828209))

(assert (=> bm!39507 m!828193))

(declare-fun m!828211 () Bool)

(assert (=> bm!39507 m!828211))

(assert (=> b!889172 m!828193))

(assert (=> b!889172 m!828193))

(assert (=> b!889172 m!828195))

(assert (=> b!889113 d!110151))

(declare-fun mapIsEmpty!28451 () Bool)

(declare-fun mapRes!28451 () Bool)

(assert (=> mapIsEmpty!28451 mapRes!28451))

(declare-fun condMapEmpty!28451 () Bool)

(declare-fun mapDefault!28451 () ValueCell!8484)

(assert (=> mapNonEmpty!28450 (= condMapEmpty!28451 (= mapRest!28450 ((as const (Array (_ BitVec 32) ValueCell!8484)) mapDefault!28451)))))

(declare-fun e!495585 () Bool)

(assert (=> mapNonEmpty!28450 (= tp!54780 (and e!495585 mapRes!28451))))

(declare-fun b!889173 () Bool)

(declare-fun e!495584 () Bool)

(assert (=> b!889173 (= e!495584 tp_is_empty!17931)))

(declare-fun b!889174 () Bool)

(assert (=> b!889174 (= e!495585 tp_is_empty!17931)))

(declare-fun mapNonEmpty!28451 () Bool)

(declare-fun tp!54781 () Bool)

(assert (=> mapNonEmpty!28451 (= mapRes!28451 (and tp!54781 e!495584))))

(declare-fun mapKey!28451 () (_ BitVec 32))

(declare-fun mapValue!28451 () ValueCell!8484)

(declare-fun mapRest!28451 () (Array (_ BitVec 32) ValueCell!8484))

(assert (=> mapNonEmpty!28451 (= mapRest!28450 (store mapRest!28451 mapKey!28451 mapValue!28451))))

(assert (= (and mapNonEmpty!28450 condMapEmpty!28451) mapIsEmpty!28451))

(assert (= (and mapNonEmpty!28450 (not condMapEmpty!28451)) mapNonEmpty!28451))

(assert (= (and mapNonEmpty!28451 ((_ is ValueCellFull!8484) mapValue!28451)) b!889173))

(assert (= (and mapNonEmpty!28450 ((_ is ValueCellFull!8484) mapDefault!28451)) b!889174))

(declare-fun m!828213 () Bool)

(assert (=> mapNonEmpty!28451 m!828213))

(check-sat (not b!889170) (not mapNonEmpty!28451) (not b!889168) (not b_next!15603) (not b!889156) (not b!889172) (not bm!39504) (not bm!39501) (not d!110149) (not b!889130) (not b!889155) tp_is_empty!17931 (not bm!39507) b_and!25843 (not b!889133) (not b!889143))
(check-sat b_and!25843 (not b_next!15603))
