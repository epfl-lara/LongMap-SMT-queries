; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80770 () Bool)

(assert start!80770)

(declare-fun b!947037 () Bool)

(declare-fun b_free!18159 () Bool)

(declare-fun b_next!18159 () Bool)

(assert (=> b!947037 (= b_free!18159 (not b_next!18159))))

(declare-fun tp!63029 () Bool)

(declare-fun b_and!29581 () Bool)

(assert (=> b!947037 (= tp!63029 b_and!29581)))

(declare-fun e!532966 () Bool)

(declare-fun e!532969 () Bool)

(declare-datatypes ((V!32521 0))(
  ( (V!32522 (val!10384 Int)) )
))
(declare-datatypes ((ValueCell!9852 0))(
  ( (ValueCellFull!9852 (v!12918 V!32521)) (EmptyCell!9852) )
))
(declare-datatypes ((array!57326 0))(
  ( (array!57327 (arr!27576 (Array (_ BitVec 32) ValueCell!9852)) (size!28049 (_ BitVec 32))) )
))
(declare-datatypes ((array!57328 0))(
  ( (array!57329 (arr!27577 (Array (_ BitVec 32) (_ BitVec 64))) (size!28050 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4854 0))(
  ( (LongMapFixedSize!4855 (defaultEntry!5724 Int) (mask!27449 (_ BitVec 32)) (extraKeys!5456 (_ BitVec 32)) (zeroValue!5560 V!32521) (minValue!5560 V!32521) (_size!2482 (_ BitVec 32)) (_keys!10629 array!57328) (_values!5747 array!57326) (_vacant!2482 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4854)

(declare-fun tp_is_empty!20667 () Bool)

(declare-fun array_inv!21408 (array!57328) Bool)

(declare-fun array_inv!21409 (array!57326) Bool)

(assert (=> b!947037 (= e!532969 (and tp!63029 tp_is_empty!20667 (array_inv!21408 (_keys!10629 thiss!1141)) (array_inv!21409 (_values!5747 thiss!1141)) e!532966))))

(declare-fun b!947038 () Bool)

(declare-fun res!635634 () Bool)

(declare-fun e!532965 () Bool)

(assert (=> b!947038 (=> res!635634 e!532965)))

(assert (=> b!947038 (= res!635634 (or (not (= (size!28049 (_values!5747 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27449 thiss!1141)))) (not (= (size!28050 (_keys!10629 thiss!1141)) (size!28049 (_values!5747 thiss!1141)))) (bvslt (mask!27449 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5456 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5456 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947039 () Bool)

(declare-fun e!532964 () Bool)

(declare-fun e!532967 () Bool)

(assert (=> b!947039 (= e!532964 e!532967)))

(declare-fun res!635632 () Bool)

(assert (=> b!947039 (=> (not res!635632) (not e!532967))))

(declare-datatypes ((SeekEntryResult!9108 0))(
  ( (MissingZero!9108 (index!38803 (_ BitVec 32))) (Found!9108 (index!38804 (_ BitVec 32))) (Intermediate!9108 (undefined!9920 Bool) (index!38805 (_ BitVec 32)) (x!81460 (_ BitVec 32))) (Undefined!9108) (MissingVacant!9108 (index!38806 (_ BitVec 32))) )
))
(declare-fun lt!426467 () SeekEntryResult!9108)

(get-info :version)

(assert (=> b!947039 (= res!635632 ((_ is Found!9108) lt!426467))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57328 (_ BitVec 32)) SeekEntryResult!9108)

(assert (=> b!947039 (= lt!426467 (seekEntry!0 key!756 (_keys!10629 thiss!1141) (mask!27449 thiss!1141)))))

(declare-fun b!947040 () Bool)

(declare-fun e!532963 () Bool)

(declare-fun mapRes!32869 () Bool)

(assert (=> b!947040 (= e!532966 (and e!532963 mapRes!32869))))

(declare-fun condMapEmpty!32869 () Bool)

(declare-fun mapDefault!32869 () ValueCell!9852)

(assert (=> b!947040 (= condMapEmpty!32869 (= (arr!27576 (_values!5747 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9852)) mapDefault!32869)))))

(declare-fun b!947041 () Bool)

(assert (=> b!947041 (= e!532963 tp_is_empty!20667)))

(declare-fun b!947042 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57328 (_ BitVec 32)) Bool)

(assert (=> b!947042 (= e!532965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10629 thiss!1141) (mask!27449 thiss!1141)))))

(declare-fun res!635635 () Bool)

(assert (=> start!80770 (=> (not res!635635) (not e!532964))))

(declare-fun valid!1849 (LongMapFixedSize!4854) Bool)

(assert (=> start!80770 (= res!635635 (valid!1849 thiss!1141))))

(assert (=> start!80770 e!532964))

(assert (=> start!80770 e!532969))

(assert (=> start!80770 true))

(declare-fun mapNonEmpty!32869 () Bool)

(declare-fun tp!63030 () Bool)

(declare-fun e!532970 () Bool)

(assert (=> mapNonEmpty!32869 (= mapRes!32869 (and tp!63030 e!532970))))

(declare-fun mapRest!32869 () (Array (_ BitVec 32) ValueCell!9852))

(declare-fun mapKey!32869 () (_ BitVec 32))

(declare-fun mapValue!32869 () ValueCell!9852)

(assert (=> mapNonEmpty!32869 (= (arr!27576 (_values!5747 thiss!1141)) (store mapRest!32869 mapKey!32869 mapValue!32869))))

(declare-fun b!947043 () Bool)

(assert (=> b!947043 (= e!532967 (not e!532965))))

(declare-fun res!635633 () Bool)

(assert (=> b!947043 (=> res!635633 e!532965)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947043 (= res!635633 (not (validMask!0 (mask!27449 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947043 (arrayContainsKey!0 (_keys!10629 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31914 0))(
  ( (Unit!31915) )
))
(declare-fun lt!426468 () Unit!31914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57328 (_ BitVec 64) (_ BitVec 32)) Unit!31914)

(assert (=> b!947043 (= lt!426468 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10629 thiss!1141) key!756 (index!38804 lt!426467)))))

(declare-fun mapIsEmpty!32869 () Bool)

(assert (=> mapIsEmpty!32869 mapRes!32869))

(declare-fun b!947044 () Bool)

(assert (=> b!947044 (= e!532970 tp_is_empty!20667)))

(declare-fun b!947045 () Bool)

(declare-fun res!635631 () Bool)

(assert (=> b!947045 (=> (not res!635631) (not e!532964))))

(assert (=> b!947045 (= res!635631 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80770 res!635635) b!947045))

(assert (= (and b!947045 res!635631) b!947039))

(assert (= (and b!947039 res!635632) b!947043))

(assert (= (and b!947043 (not res!635633)) b!947038))

(assert (= (and b!947038 (not res!635634)) b!947042))

(assert (= (and b!947040 condMapEmpty!32869) mapIsEmpty!32869))

(assert (= (and b!947040 (not condMapEmpty!32869)) mapNonEmpty!32869))

(assert (= (and mapNonEmpty!32869 ((_ is ValueCellFull!9852) mapValue!32869)) b!947044))

(assert (= (and b!947040 ((_ is ValueCellFull!9852) mapDefault!32869)) b!947041))

(assert (= b!947037 b!947040))

(assert (= start!80770 b!947037))

(declare-fun m!880145 () Bool)

(assert (=> mapNonEmpty!32869 m!880145))

(declare-fun m!880147 () Bool)

(assert (=> b!947037 m!880147))

(declare-fun m!880149 () Bool)

(assert (=> b!947037 m!880149))

(declare-fun m!880151 () Bool)

(assert (=> start!80770 m!880151))

(declare-fun m!880153 () Bool)

(assert (=> b!947042 m!880153))

(declare-fun m!880155 () Bool)

(assert (=> b!947039 m!880155))

(declare-fun m!880157 () Bool)

(assert (=> b!947043 m!880157))

(declare-fun m!880159 () Bool)

(assert (=> b!947043 m!880159))

(declare-fun m!880161 () Bool)

(assert (=> b!947043 m!880161))

(check-sat (not mapNonEmpty!32869) (not b_next!18159) (not b!947037) (not b!947039) (not b!947043) (not b!947042) (not start!80770) b_and!29581 tp_is_empty!20667)
(check-sat b_and!29581 (not b_next!18159))
(get-model)

(declare-fun b!947081 () Bool)

(declare-fun e!533002 () Bool)

(declare-fun e!533001 () Bool)

(assert (=> b!947081 (= e!533002 e!533001)))

(declare-fun lt!426483 () (_ BitVec 64))

(assert (=> b!947081 (= lt!426483 (select (arr!27577 (_keys!10629 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426481 () Unit!31914)

(assert (=> b!947081 (= lt!426481 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10629 thiss!1141) lt!426483 #b00000000000000000000000000000000))))

(assert (=> b!947081 (arrayContainsKey!0 (_keys!10629 thiss!1141) lt!426483 #b00000000000000000000000000000000)))

(declare-fun lt!426482 () Unit!31914)

(assert (=> b!947081 (= lt!426482 lt!426481)))

(declare-fun res!635655 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57328 (_ BitVec 32)) SeekEntryResult!9108)

(assert (=> b!947081 (= res!635655 (= (seekEntryOrOpen!0 (select (arr!27577 (_keys!10629 thiss!1141)) #b00000000000000000000000000000000) (_keys!10629 thiss!1141) (mask!27449 thiss!1141)) (Found!9108 #b00000000000000000000000000000000)))))

(assert (=> b!947081 (=> (not res!635655) (not e!533001))))

(declare-fun b!947082 () Bool)

(declare-fun call!41106 () Bool)

(assert (=> b!947082 (= e!533001 call!41106)))

(declare-fun b!947083 () Bool)

(declare-fun e!533003 () Bool)

(assert (=> b!947083 (= e!533003 e!533002)))

(declare-fun c!98663 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947083 (= c!98663 (validKeyInArray!0 (select (arr!27577 (_keys!10629 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41103 () Bool)

(assert (=> bm!41103 (= call!41106 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10629 thiss!1141) (mask!27449 thiss!1141)))))

(declare-fun b!947084 () Bool)

(assert (=> b!947084 (= e!533002 call!41106)))

(declare-fun d!114631 () Bool)

(declare-fun res!635656 () Bool)

(assert (=> d!114631 (=> res!635656 e!533003)))

(assert (=> d!114631 (= res!635656 (bvsge #b00000000000000000000000000000000 (size!28050 (_keys!10629 thiss!1141))))))

(assert (=> d!114631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10629 thiss!1141) (mask!27449 thiss!1141)) e!533003)))

(assert (= (and d!114631 (not res!635656)) b!947083))

(assert (= (and b!947083 c!98663) b!947081))

(assert (= (and b!947083 (not c!98663)) b!947084))

(assert (= (and b!947081 res!635655) b!947082))

(assert (= (or b!947082 b!947084) bm!41103))

(declare-fun m!880181 () Bool)

(assert (=> b!947081 m!880181))

(declare-fun m!880183 () Bool)

(assert (=> b!947081 m!880183))

(declare-fun m!880185 () Bool)

(assert (=> b!947081 m!880185))

(assert (=> b!947081 m!880181))

(declare-fun m!880187 () Bool)

(assert (=> b!947081 m!880187))

(assert (=> b!947083 m!880181))

(assert (=> b!947083 m!880181))

(declare-fun m!880189 () Bool)

(assert (=> b!947083 m!880189))

(declare-fun m!880191 () Bool)

(assert (=> bm!41103 m!880191))

(assert (=> b!947042 d!114631))

(declare-fun d!114633 () Bool)

(assert (=> d!114633 (= (validMask!0 (mask!27449 thiss!1141)) (and (or (= (mask!27449 thiss!1141) #b00000000000000000000000000000111) (= (mask!27449 thiss!1141) #b00000000000000000000000000001111) (= (mask!27449 thiss!1141) #b00000000000000000000000000011111) (= (mask!27449 thiss!1141) #b00000000000000000000000000111111) (= (mask!27449 thiss!1141) #b00000000000000000000000001111111) (= (mask!27449 thiss!1141) #b00000000000000000000000011111111) (= (mask!27449 thiss!1141) #b00000000000000000000000111111111) (= (mask!27449 thiss!1141) #b00000000000000000000001111111111) (= (mask!27449 thiss!1141) #b00000000000000000000011111111111) (= (mask!27449 thiss!1141) #b00000000000000000000111111111111) (= (mask!27449 thiss!1141) #b00000000000000000001111111111111) (= (mask!27449 thiss!1141) #b00000000000000000011111111111111) (= (mask!27449 thiss!1141) #b00000000000000000111111111111111) (= (mask!27449 thiss!1141) #b00000000000000001111111111111111) (= (mask!27449 thiss!1141) #b00000000000000011111111111111111) (= (mask!27449 thiss!1141) #b00000000000000111111111111111111) (= (mask!27449 thiss!1141) #b00000000000001111111111111111111) (= (mask!27449 thiss!1141) #b00000000000011111111111111111111) (= (mask!27449 thiss!1141) #b00000000000111111111111111111111) (= (mask!27449 thiss!1141) #b00000000001111111111111111111111) (= (mask!27449 thiss!1141) #b00000000011111111111111111111111) (= (mask!27449 thiss!1141) #b00000000111111111111111111111111) (= (mask!27449 thiss!1141) #b00000001111111111111111111111111) (= (mask!27449 thiss!1141) #b00000011111111111111111111111111) (= (mask!27449 thiss!1141) #b00000111111111111111111111111111) (= (mask!27449 thiss!1141) #b00001111111111111111111111111111) (= (mask!27449 thiss!1141) #b00011111111111111111111111111111) (= (mask!27449 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27449 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947043 d!114633))

(declare-fun d!114635 () Bool)

(declare-fun res!635661 () Bool)

(declare-fun e!533008 () Bool)

(assert (=> d!114635 (=> res!635661 e!533008)))

(assert (=> d!114635 (= res!635661 (= (select (arr!27577 (_keys!10629 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114635 (= (arrayContainsKey!0 (_keys!10629 thiss!1141) key!756 #b00000000000000000000000000000000) e!533008)))

(declare-fun b!947089 () Bool)

(declare-fun e!533009 () Bool)

(assert (=> b!947089 (= e!533008 e!533009)))

(declare-fun res!635662 () Bool)

(assert (=> b!947089 (=> (not res!635662) (not e!533009))))

(assert (=> b!947089 (= res!635662 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28050 (_keys!10629 thiss!1141))))))

(declare-fun b!947090 () Bool)

(assert (=> b!947090 (= e!533009 (arrayContainsKey!0 (_keys!10629 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114635 (not res!635661)) b!947089))

(assert (= (and b!947089 res!635662) b!947090))

(assert (=> d!114635 m!880181))

(declare-fun m!880193 () Bool)

(assert (=> b!947090 m!880193))

(assert (=> b!947043 d!114635))

(declare-fun d!114637 () Bool)

(assert (=> d!114637 (arrayContainsKey!0 (_keys!10629 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426486 () Unit!31914)

(declare-fun choose!13 (array!57328 (_ BitVec 64) (_ BitVec 32)) Unit!31914)

(assert (=> d!114637 (= lt!426486 (choose!13 (_keys!10629 thiss!1141) key!756 (index!38804 lt!426467)))))

(assert (=> d!114637 (bvsge (index!38804 lt!426467) #b00000000000000000000000000000000)))

(assert (=> d!114637 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10629 thiss!1141) key!756 (index!38804 lt!426467)) lt!426486)))

(declare-fun bs!26620 () Bool)

(assert (= bs!26620 d!114637))

(assert (=> bs!26620 m!880159))

(declare-fun m!880195 () Bool)

(assert (=> bs!26620 m!880195))

(assert (=> b!947043 d!114637))

(declare-fun b!947103 () Bool)

(declare-fun c!98670 () Bool)

(declare-fun lt!426496 () (_ BitVec 64))

(assert (=> b!947103 (= c!98670 (= lt!426496 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533016 () SeekEntryResult!9108)

(declare-fun e!533017 () SeekEntryResult!9108)

(assert (=> b!947103 (= e!533016 e!533017)))

(declare-fun b!947104 () Bool)

(declare-fun e!533018 () SeekEntryResult!9108)

(assert (=> b!947104 (= e!533018 Undefined!9108)))

(declare-fun b!947105 () Bool)

(declare-fun lt!426497 () SeekEntryResult!9108)

(assert (=> b!947105 (= e!533017 (MissingZero!9108 (index!38805 lt!426497)))))

(declare-fun b!947106 () Bool)

(assert (=> b!947106 (= e!533016 (Found!9108 (index!38805 lt!426497)))))

(declare-fun b!947107 () Bool)

(declare-fun lt!426495 () SeekEntryResult!9108)

(assert (=> b!947107 (= e!533017 (ite ((_ is MissingVacant!9108) lt!426495) (MissingZero!9108 (index!38806 lt!426495)) lt!426495))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57328 (_ BitVec 32)) SeekEntryResult!9108)

(assert (=> b!947107 (= lt!426495 (seekKeyOrZeroReturnVacant!0 (x!81460 lt!426497) (index!38805 lt!426497) (index!38805 lt!426497) key!756 (_keys!10629 thiss!1141) (mask!27449 thiss!1141)))))

(declare-fun d!114639 () Bool)

(declare-fun lt!426498 () SeekEntryResult!9108)

(assert (=> d!114639 (and (or ((_ is MissingVacant!9108) lt!426498) (not ((_ is Found!9108) lt!426498)) (and (bvsge (index!38804 lt!426498) #b00000000000000000000000000000000) (bvslt (index!38804 lt!426498) (size!28050 (_keys!10629 thiss!1141))))) (not ((_ is MissingVacant!9108) lt!426498)) (or (not ((_ is Found!9108) lt!426498)) (= (select (arr!27577 (_keys!10629 thiss!1141)) (index!38804 lt!426498)) key!756)))))

(assert (=> d!114639 (= lt!426498 e!533018)))

(declare-fun c!98671 () Bool)

(assert (=> d!114639 (= c!98671 (and ((_ is Intermediate!9108) lt!426497) (undefined!9920 lt!426497)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57328 (_ BitVec 32)) SeekEntryResult!9108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114639 (= lt!426497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27449 thiss!1141)) key!756 (_keys!10629 thiss!1141) (mask!27449 thiss!1141)))))

(assert (=> d!114639 (validMask!0 (mask!27449 thiss!1141))))

(assert (=> d!114639 (= (seekEntry!0 key!756 (_keys!10629 thiss!1141) (mask!27449 thiss!1141)) lt!426498)))

(declare-fun b!947108 () Bool)

(assert (=> b!947108 (= e!533018 e!533016)))

(assert (=> b!947108 (= lt!426496 (select (arr!27577 (_keys!10629 thiss!1141)) (index!38805 lt!426497)))))

(declare-fun c!98672 () Bool)

(assert (=> b!947108 (= c!98672 (= lt!426496 key!756))))

(assert (= (and d!114639 c!98671) b!947104))

(assert (= (and d!114639 (not c!98671)) b!947108))

(assert (= (and b!947108 c!98672) b!947106))

(assert (= (and b!947108 (not c!98672)) b!947103))

(assert (= (and b!947103 c!98670) b!947105))

(assert (= (and b!947103 (not c!98670)) b!947107))

(declare-fun m!880197 () Bool)

(assert (=> b!947107 m!880197))

(declare-fun m!880199 () Bool)

(assert (=> d!114639 m!880199))

(declare-fun m!880201 () Bool)

(assert (=> d!114639 m!880201))

(assert (=> d!114639 m!880201))

(declare-fun m!880203 () Bool)

(assert (=> d!114639 m!880203))

(assert (=> d!114639 m!880157))

(declare-fun m!880205 () Bool)

(assert (=> b!947108 m!880205))

(assert (=> b!947039 d!114639))

(declare-fun d!114641 () Bool)

(declare-fun res!635669 () Bool)

(declare-fun e!533021 () Bool)

(assert (=> d!114641 (=> (not res!635669) (not e!533021))))

(declare-fun simpleValid!361 (LongMapFixedSize!4854) Bool)

(assert (=> d!114641 (= res!635669 (simpleValid!361 thiss!1141))))

(assert (=> d!114641 (= (valid!1849 thiss!1141) e!533021)))

(declare-fun b!947115 () Bool)

(declare-fun res!635670 () Bool)

(assert (=> b!947115 (=> (not res!635670) (not e!533021))))

(declare-fun arrayCountValidKeys!0 (array!57328 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947115 (= res!635670 (= (arrayCountValidKeys!0 (_keys!10629 thiss!1141) #b00000000000000000000000000000000 (size!28050 (_keys!10629 thiss!1141))) (_size!2482 thiss!1141)))))

(declare-fun b!947116 () Bool)

(declare-fun res!635671 () Bool)

(assert (=> b!947116 (=> (not res!635671) (not e!533021))))

(assert (=> b!947116 (= res!635671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10629 thiss!1141) (mask!27449 thiss!1141)))))

(declare-fun b!947117 () Bool)

(declare-datatypes ((List!19301 0))(
  ( (Nil!19298) (Cons!19297 (h!20453 (_ BitVec 64)) (t!27622 List!19301)) )
))
(declare-fun arrayNoDuplicates!0 (array!57328 (_ BitVec 32) List!19301) Bool)

(assert (=> b!947117 (= e!533021 (arrayNoDuplicates!0 (_keys!10629 thiss!1141) #b00000000000000000000000000000000 Nil!19298))))

(assert (= (and d!114641 res!635669) b!947115))

(assert (= (and b!947115 res!635670) b!947116))

(assert (= (and b!947116 res!635671) b!947117))

(declare-fun m!880207 () Bool)

(assert (=> d!114641 m!880207))

(declare-fun m!880209 () Bool)

(assert (=> b!947115 m!880209))

(assert (=> b!947116 m!880153))

(declare-fun m!880211 () Bool)

(assert (=> b!947117 m!880211))

(assert (=> start!80770 d!114641))

(declare-fun d!114643 () Bool)

(assert (=> d!114643 (= (array_inv!21408 (_keys!10629 thiss!1141)) (bvsge (size!28050 (_keys!10629 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947037 d!114643))

(declare-fun d!114645 () Bool)

(assert (=> d!114645 (= (array_inv!21409 (_values!5747 thiss!1141)) (bvsge (size!28049 (_values!5747 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947037 d!114645))

(declare-fun b!947125 () Bool)

(declare-fun e!533026 () Bool)

(assert (=> b!947125 (= e!533026 tp_is_empty!20667)))

(declare-fun b!947124 () Bool)

(declare-fun e!533027 () Bool)

(assert (=> b!947124 (= e!533027 tp_is_empty!20667)))

(declare-fun mapIsEmpty!32875 () Bool)

(declare-fun mapRes!32875 () Bool)

(assert (=> mapIsEmpty!32875 mapRes!32875))

(declare-fun mapNonEmpty!32875 () Bool)

(declare-fun tp!63039 () Bool)

(assert (=> mapNonEmpty!32875 (= mapRes!32875 (and tp!63039 e!533027))))

(declare-fun mapRest!32875 () (Array (_ BitVec 32) ValueCell!9852))

(declare-fun mapValue!32875 () ValueCell!9852)

(declare-fun mapKey!32875 () (_ BitVec 32))

(assert (=> mapNonEmpty!32875 (= mapRest!32869 (store mapRest!32875 mapKey!32875 mapValue!32875))))

(declare-fun condMapEmpty!32875 () Bool)

(declare-fun mapDefault!32875 () ValueCell!9852)

(assert (=> mapNonEmpty!32869 (= condMapEmpty!32875 (= mapRest!32869 ((as const (Array (_ BitVec 32) ValueCell!9852)) mapDefault!32875)))))

(assert (=> mapNonEmpty!32869 (= tp!63030 (and e!533026 mapRes!32875))))

(assert (= (and mapNonEmpty!32869 condMapEmpty!32875) mapIsEmpty!32875))

(assert (= (and mapNonEmpty!32869 (not condMapEmpty!32875)) mapNonEmpty!32875))

(assert (= (and mapNonEmpty!32875 ((_ is ValueCellFull!9852) mapValue!32875)) b!947124))

(assert (= (and mapNonEmpty!32869 ((_ is ValueCellFull!9852) mapDefault!32875)) b!947125))

(declare-fun m!880213 () Bool)

(assert (=> mapNonEmpty!32875 m!880213))

(check-sat (not b!947083) (not d!114639) (not b_next!18159) (not b!947116) (not d!114637) (not d!114641) (not b!947090) (not bm!41103) (not b!947081) (not b!947107) (not b!947115) (not mapNonEmpty!32875) b_and!29581 tp_is_empty!20667 (not b!947117))
(check-sat b_and!29581 (not b_next!18159))
