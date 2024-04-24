; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112298 () Bool)

(assert start!112298)

(declare-fun b!1328875 () Bool)

(declare-fun res!881443 () Bool)

(declare-fun e!757615 () Bool)

(assert (=> b!1328875 (=> (not res!881443) (not e!757615))))

(declare-datatypes ((array!89791 0))(
  ( (array!89792 (arr!43358 (Array (_ BitVec 32) (_ BitVec 64))) (size!43909 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89791)

(assert (=> b!1328875 (= res!881443 (and (bvsle #b00000000000000000000000000000000 (size!43909 _keys!1590)) (bvslt (size!43909 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!56257 () Bool)

(declare-fun mapRes!56257 () Bool)

(declare-fun tp!107164 () Bool)

(declare-fun e!757616 () Bool)

(assert (=> mapNonEmpty!56257 (= mapRes!56257 (and tp!107164 e!757616))))

(declare-datatypes ((V!53625 0))(
  ( (V!53626 (val!18270 Int)) )
))
(declare-datatypes ((ValueCell!17297 0))(
  ( (ValueCellFull!17297 (v!20901 V!53625)) (EmptyCell!17297) )
))
(declare-fun mapValue!56257 () ValueCell!17297)

(declare-datatypes ((array!89793 0))(
  ( (array!89794 (arr!43359 (Array (_ BitVec 32) ValueCell!17297)) (size!43910 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89793)

(declare-fun mapRest!56257 () (Array (_ BitVec 32) ValueCell!17297))

(declare-fun mapKey!56257 () (_ BitVec 32))

(assert (=> mapNonEmpty!56257 (= (arr!43359 _values!1320) (store mapRest!56257 mapKey!56257 mapValue!56257))))

(declare-fun b!1328876 () Bool)

(declare-fun res!881445 () Bool)

(assert (=> b!1328876 (=> (not res!881445) (not e!757615))))

(declare-datatypes ((List!30735 0))(
  ( (Nil!30732) (Cons!30731 (h!31949 (_ BitVec 64)) (t!44733 List!30735)) )
))
(declare-fun noDuplicate!2084 (List!30735) Bool)

(assert (=> b!1328876 (= res!881445 (noDuplicate!2084 Nil!30732))))

(declare-fun b!1328877 () Bool)

(declare-fun tp_is_empty!36391 () Bool)

(assert (=> b!1328877 (= e!757616 tp_is_empty!36391)))

(declare-fun b!1328878 () Bool)

(declare-fun e!757619 () Bool)

(assert (=> b!1328878 (= e!757615 e!757619)))

(declare-fun res!881448 () Bool)

(assert (=> b!1328878 (=> res!881448 e!757619)))

(declare-fun contains!8811 (List!30735 (_ BitVec 64)) Bool)

(assert (=> b!1328878 (= res!881448 (contains!8811 Nil!30732 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328879 () Bool)

(declare-fun e!757617 () Bool)

(assert (=> b!1328879 (= e!757617 tp_is_empty!36391)))

(declare-fun b!1328880 () Bool)

(declare-fun res!881447 () Bool)

(assert (=> b!1328880 (=> (not res!881447) (not e!757615))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89791 (_ BitVec 32)) Bool)

(assert (=> b!1328880 (= res!881447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881446 () Bool)

(assert (=> start!112298 (=> (not res!881446) (not e!757615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112298 (= res!881446 (validMask!0 mask!1998))))

(assert (=> start!112298 e!757615))

(assert (=> start!112298 true))

(declare-fun e!757614 () Bool)

(declare-fun array_inv!32989 (array!89793) Bool)

(assert (=> start!112298 (and (array_inv!32989 _values!1320) e!757614)))

(declare-fun array_inv!32990 (array!89791) Bool)

(assert (=> start!112298 (array_inv!32990 _keys!1590)))

(declare-fun b!1328881 () Bool)

(assert (=> b!1328881 (= e!757614 (and e!757617 mapRes!56257))))

(declare-fun condMapEmpty!56257 () Bool)

(declare-fun mapDefault!56257 () ValueCell!17297)

(assert (=> b!1328881 (= condMapEmpty!56257 (= (arr!43359 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17297)) mapDefault!56257)))))

(declare-fun b!1328882 () Bool)

(assert (=> b!1328882 (= e!757619 (contains!8811 Nil!30732 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!56257 () Bool)

(assert (=> mapIsEmpty!56257 mapRes!56257))

(declare-fun b!1328883 () Bool)

(declare-fun res!881444 () Bool)

(assert (=> b!1328883 (=> (not res!881444) (not e!757615))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328883 (= res!881444 (and (= (size!43910 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43909 _keys!1590) (size!43910 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112298 res!881446) b!1328883))

(assert (= (and b!1328883 res!881444) b!1328880))

(assert (= (and b!1328880 res!881447) b!1328875))

(assert (= (and b!1328875 res!881443) b!1328876))

(assert (= (and b!1328876 res!881445) b!1328878))

(assert (= (and b!1328878 (not res!881448)) b!1328882))

(assert (= (and b!1328881 condMapEmpty!56257) mapIsEmpty!56257))

(assert (= (and b!1328881 (not condMapEmpty!56257)) mapNonEmpty!56257))

(get-info :version)

(assert (= (and mapNonEmpty!56257 ((_ is ValueCellFull!17297) mapValue!56257)) b!1328877))

(assert (= (and b!1328881 ((_ is ValueCellFull!17297) mapDefault!56257)) b!1328879))

(assert (= start!112298 b!1328881))

(declare-fun m!1218439 () Bool)

(assert (=> b!1328876 m!1218439))

(declare-fun m!1218441 () Bool)

(assert (=> b!1328880 m!1218441))

(declare-fun m!1218443 () Bool)

(assert (=> mapNonEmpty!56257 m!1218443))

(declare-fun m!1218445 () Bool)

(assert (=> b!1328882 m!1218445))

(declare-fun m!1218447 () Bool)

(assert (=> b!1328878 m!1218447))

(declare-fun m!1218449 () Bool)

(assert (=> start!112298 m!1218449))

(declare-fun m!1218451 () Bool)

(assert (=> start!112298 m!1218451))

(declare-fun m!1218453 () Bool)

(assert (=> start!112298 m!1218453))

(check-sat (not b!1328882) (not b!1328876) (not mapNonEmpty!56257) (not start!112298) (not b!1328878) (not b!1328880) tp_is_empty!36391)
(check-sat)
(get-model)

(declare-fun b!1328946 () Bool)

(declare-fun e!757663 () Bool)

(declare-fun e!757664 () Bool)

(assert (=> b!1328946 (= e!757663 e!757664)))

(declare-fun c!126299 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328946 (= c!126299 (validKeyInArray!0 (select (arr!43358 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1328947 () Bool)

(declare-fun e!757662 () Bool)

(assert (=> b!1328947 (= e!757664 e!757662)))

(declare-fun lt!591205 () (_ BitVec 64))

(assert (=> b!1328947 (= lt!591205 (select (arr!43358 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43680 0))(
  ( (Unit!43681) )
))
(declare-fun lt!591204 () Unit!43680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89791 (_ BitVec 64) (_ BitVec 32)) Unit!43680)

(assert (=> b!1328947 (= lt!591204 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!591205 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1328947 (arrayContainsKey!0 _keys!1590 lt!591205 #b00000000000000000000000000000000)))

(declare-fun lt!591206 () Unit!43680)

(assert (=> b!1328947 (= lt!591206 lt!591204)))

(declare-fun res!881489 () Bool)

(declare-datatypes ((SeekEntryResult!10002 0))(
  ( (MissingZero!10002 (index!42379 (_ BitVec 32))) (Found!10002 (index!42380 (_ BitVec 32))) (Intermediate!10002 (undefined!10814 Bool) (index!42381 (_ BitVec 32)) (x!118356 (_ BitVec 32))) (Undefined!10002) (MissingVacant!10002 (index!42382 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89791 (_ BitVec 32)) SeekEntryResult!10002)

(assert (=> b!1328947 (= res!881489 (= (seekEntryOrOpen!0 (select (arr!43358 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10002 #b00000000000000000000000000000000)))))

(assert (=> b!1328947 (=> (not res!881489) (not e!757662))))

(declare-fun b!1328948 () Bool)

(declare-fun call!64887 () Bool)

(assert (=> b!1328948 (= e!757662 call!64887)))

(declare-fun d!143783 () Bool)

(declare-fun res!881490 () Bool)

(assert (=> d!143783 (=> res!881490 e!757663)))

(assert (=> d!143783 (= res!881490 (bvsge #b00000000000000000000000000000000 (size!43909 _keys!1590)))))

(assert (=> d!143783 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!757663)))

(declare-fun b!1328949 () Bool)

(assert (=> b!1328949 (= e!757664 call!64887)))

(declare-fun bm!64884 () Bool)

(assert (=> bm!64884 (= call!64887 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(assert (= (and d!143783 (not res!881490)) b!1328946))

(assert (= (and b!1328946 c!126299) b!1328947))

(assert (= (and b!1328946 (not c!126299)) b!1328949))

(assert (= (and b!1328947 res!881489) b!1328948))

(assert (= (or b!1328948 b!1328949) bm!64884))

(declare-fun m!1218487 () Bool)

(assert (=> b!1328946 m!1218487))

(assert (=> b!1328946 m!1218487))

(declare-fun m!1218489 () Bool)

(assert (=> b!1328946 m!1218489))

(assert (=> b!1328947 m!1218487))

(declare-fun m!1218491 () Bool)

(assert (=> b!1328947 m!1218491))

(declare-fun m!1218493 () Bool)

(assert (=> b!1328947 m!1218493))

(assert (=> b!1328947 m!1218487))

(declare-fun m!1218495 () Bool)

(assert (=> b!1328947 m!1218495))

(declare-fun m!1218497 () Bool)

(assert (=> bm!64884 m!1218497))

(assert (=> b!1328880 d!143783))

(declare-fun d!143785 () Bool)

(declare-fun lt!591209 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!655 (List!30735) (InoxSet (_ BitVec 64)))

(assert (=> d!143785 (= lt!591209 (select (content!655 Nil!30732) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!757670 () Bool)

(assert (=> d!143785 (= lt!591209 e!757670)))

(declare-fun res!881496 () Bool)

(assert (=> d!143785 (=> (not res!881496) (not e!757670))))

(assert (=> d!143785 (= res!881496 ((_ is Cons!30731) Nil!30732))))

(assert (=> d!143785 (= (contains!8811 Nil!30732 #b0000000000000000000000000000000000000000000000000000000000000000) lt!591209)))

(declare-fun b!1328954 () Bool)

(declare-fun e!757669 () Bool)

(assert (=> b!1328954 (= e!757670 e!757669)))

(declare-fun res!881495 () Bool)

(assert (=> b!1328954 (=> res!881495 e!757669)))

(assert (=> b!1328954 (= res!881495 (= (h!31949 Nil!30732) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328955 () Bool)

(assert (=> b!1328955 (= e!757669 (contains!8811 (t!44733 Nil!30732) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!143785 res!881496) b!1328954))

(assert (= (and b!1328954 (not res!881495)) b!1328955))

(declare-fun m!1218499 () Bool)

(assert (=> d!143785 m!1218499))

(declare-fun m!1218501 () Bool)

(assert (=> d!143785 m!1218501))

(declare-fun m!1218503 () Bool)

(assert (=> b!1328955 m!1218503))

(assert (=> b!1328878 d!143785))

(declare-fun d!143787 () Bool)

(declare-fun lt!591210 () Bool)

(assert (=> d!143787 (= lt!591210 (select (content!655 Nil!30732) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!757672 () Bool)

(assert (=> d!143787 (= lt!591210 e!757672)))

(declare-fun res!881498 () Bool)

(assert (=> d!143787 (=> (not res!881498) (not e!757672))))

(assert (=> d!143787 (= res!881498 ((_ is Cons!30731) Nil!30732))))

(assert (=> d!143787 (= (contains!8811 Nil!30732 #b1000000000000000000000000000000000000000000000000000000000000000) lt!591210)))

(declare-fun b!1328956 () Bool)

(declare-fun e!757671 () Bool)

(assert (=> b!1328956 (= e!757672 e!757671)))

(declare-fun res!881497 () Bool)

(assert (=> b!1328956 (=> res!881497 e!757671)))

(assert (=> b!1328956 (= res!881497 (= (h!31949 Nil!30732) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328957 () Bool)

(assert (=> b!1328957 (= e!757671 (contains!8811 (t!44733 Nil!30732) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!143787 res!881498) b!1328956))

(assert (= (and b!1328956 (not res!881497)) b!1328957))

(assert (=> d!143787 m!1218499))

(declare-fun m!1218505 () Bool)

(assert (=> d!143787 m!1218505))

(declare-fun m!1218507 () Bool)

(assert (=> b!1328957 m!1218507))

(assert (=> b!1328882 d!143787))

(declare-fun d!143789 () Bool)

(assert (=> d!143789 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112298 d!143789))

(declare-fun d!143791 () Bool)

(assert (=> d!143791 (= (array_inv!32989 _values!1320) (bvsge (size!43910 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112298 d!143791))

(declare-fun d!143793 () Bool)

(assert (=> d!143793 (= (array_inv!32990 _keys!1590) (bvsge (size!43909 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112298 d!143793))

(declare-fun d!143795 () Bool)

(declare-fun res!881503 () Bool)

(declare-fun e!757677 () Bool)

(assert (=> d!143795 (=> res!881503 e!757677)))

(assert (=> d!143795 (= res!881503 ((_ is Nil!30732) Nil!30732))))

(assert (=> d!143795 (= (noDuplicate!2084 Nil!30732) e!757677)))

(declare-fun b!1328962 () Bool)

(declare-fun e!757678 () Bool)

(assert (=> b!1328962 (= e!757677 e!757678)))

(declare-fun res!881504 () Bool)

(assert (=> b!1328962 (=> (not res!881504) (not e!757678))))

(assert (=> b!1328962 (= res!881504 (not (contains!8811 (t!44733 Nil!30732) (h!31949 Nil!30732))))))

(declare-fun b!1328963 () Bool)

(assert (=> b!1328963 (= e!757678 (noDuplicate!2084 (t!44733 Nil!30732)))))

(assert (= (and d!143795 (not res!881503)) b!1328962))

(assert (= (and b!1328962 res!881504) b!1328963))

(declare-fun m!1218509 () Bool)

(assert (=> b!1328962 m!1218509))

(declare-fun m!1218511 () Bool)

(assert (=> b!1328963 m!1218511))

(assert (=> b!1328876 d!143795))

(declare-fun mapNonEmpty!56266 () Bool)

(declare-fun mapRes!56266 () Bool)

(declare-fun tp!107173 () Bool)

(declare-fun e!757683 () Bool)

(assert (=> mapNonEmpty!56266 (= mapRes!56266 (and tp!107173 e!757683))))

(declare-fun mapValue!56266 () ValueCell!17297)

(declare-fun mapRest!56266 () (Array (_ BitVec 32) ValueCell!17297))

(declare-fun mapKey!56266 () (_ BitVec 32))

(assert (=> mapNonEmpty!56266 (= mapRest!56257 (store mapRest!56266 mapKey!56266 mapValue!56266))))

(declare-fun b!1328971 () Bool)

(declare-fun e!757684 () Bool)

(assert (=> b!1328971 (= e!757684 tp_is_empty!36391)))

(declare-fun mapIsEmpty!56266 () Bool)

(assert (=> mapIsEmpty!56266 mapRes!56266))

(declare-fun condMapEmpty!56266 () Bool)

(declare-fun mapDefault!56266 () ValueCell!17297)

(assert (=> mapNonEmpty!56257 (= condMapEmpty!56266 (= mapRest!56257 ((as const (Array (_ BitVec 32) ValueCell!17297)) mapDefault!56266)))))

(assert (=> mapNonEmpty!56257 (= tp!107164 (and e!757684 mapRes!56266))))

(declare-fun b!1328970 () Bool)

(assert (=> b!1328970 (= e!757683 tp_is_empty!36391)))

(assert (= (and mapNonEmpty!56257 condMapEmpty!56266) mapIsEmpty!56266))

(assert (= (and mapNonEmpty!56257 (not condMapEmpty!56266)) mapNonEmpty!56266))

(assert (= (and mapNonEmpty!56266 ((_ is ValueCellFull!17297) mapValue!56266)) b!1328970))

(assert (= (and mapNonEmpty!56257 ((_ is ValueCellFull!17297) mapDefault!56266)) b!1328971))

(declare-fun m!1218513 () Bool)

(assert (=> mapNonEmpty!56266 m!1218513))

(check-sat (not d!143785) (not b!1328947) (not b!1328955) (not b!1328946) (not b!1328957) (not d!143787) (not bm!64884) tp_is_empty!36391 (not b!1328963) (not b!1328962) (not mapNonEmpty!56266))
(check-sat)
