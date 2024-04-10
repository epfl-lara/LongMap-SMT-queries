; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19476 () Bool)

(assert start!19476)

(declare-fun b!191274 () Bool)

(declare-fun b_free!4677 () Bool)

(declare-fun b_next!4677 () Bool)

(assert (=> b!191274 (= b_free!4677 (not b_next!4677))))

(declare-fun tp!16877 () Bool)

(declare-fun b_and!11347 () Bool)

(assert (=> b!191274 (= tp!16877 b_and!11347)))

(declare-fun b!191270 () Bool)

(declare-fun e!125871 () Bool)

(declare-fun e!125869 () Bool)

(assert (=> b!191270 (= e!125871 (not e!125869))))

(declare-fun res!90403 () Bool)

(assert (=> b!191270 (=> res!90403 e!125869)))

(declare-datatypes ((V!5579 0))(
  ( (V!5580 (val!2269 Int)) )
))
(declare-datatypes ((ValueCell!1881 0))(
  ( (ValueCellFull!1881 (v!4206 V!5579)) (EmptyCell!1881) )
))
(declare-datatypes ((array!8135 0))(
  ( (array!8136 (arr!3833 (Array (_ BitVec 32) (_ BitVec 64))) (size!4155 (_ BitVec 32))) )
))
(declare-datatypes ((array!8137 0))(
  ( (array!8138 (arr!3834 (Array (_ BitVec 32) ValueCell!1881)) (size!4156 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2670 0))(
  ( (LongMapFixedSize!2671 (defaultEntry!3903 Int) (mask!9119 (_ BitVec 32)) (extraKeys!3640 (_ BitVec 32)) (zeroValue!3744 V!5579) (minValue!3744 V!5579) (_size!1384 (_ BitVec 32)) (_keys!5880 array!8135) (_values!3886 array!8137) (_vacant!1384 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2670)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191270 (= res!90403 (not (validMask!0 (mask!9119 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!677 0))(
  ( (MissingZero!677 (index!4878 (_ BitVec 32))) (Found!677 (index!4879 (_ BitVec 32))) (Intermediate!677 (undefined!1489 Bool) (index!4880 (_ BitVec 32)) (x!20531 (_ BitVec 32))) (Undefined!677) (MissingVacant!677 (index!4881 (_ BitVec 32))) )
))
(declare-fun lt!94921 () SeekEntryResult!677)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3528 0))(
  ( (tuple2!3529 (_1!1775 (_ BitVec 64)) (_2!1775 V!5579)) )
))
(declare-datatypes ((List!2422 0))(
  ( (Nil!2419) (Cons!2418 (h!3057 tuple2!3528) (t!7334 List!2422)) )
))
(declare-datatypes ((ListLongMap!2445 0))(
  ( (ListLongMap!2446 (toList!1238 List!2422)) )
))
(declare-fun lt!94918 () ListLongMap!2445)

(declare-fun v!309 () V!5579)

(declare-fun +!306 (ListLongMap!2445 tuple2!3528) ListLongMap!2445)

(declare-fun getCurrentListMap!886 (array!8135 array!8137 (_ BitVec 32) (_ BitVec 32) V!5579 V!5579 (_ BitVec 32) Int) ListLongMap!2445)

(assert (=> b!191270 (= (+!306 lt!94918 (tuple2!3529 key!828 v!309)) (getCurrentListMap!886 (_keys!5880 thiss!1248) (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248))) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-datatypes ((Unit!5784 0))(
  ( (Unit!5785) )
))
(declare-fun lt!94917 () Unit!5784)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!107 (array!8135 array!8137 (_ BitVec 32) (_ BitVec 32) V!5579 V!5579 (_ BitVec 32) (_ BitVec 64) V!5579 Int) Unit!5784)

(assert (=> b!191270 (= lt!94917 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!107 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) (index!4879 lt!94921) key!828 v!309 (defaultEntry!3903 thiss!1248)))))

(declare-fun lt!94916 () Unit!5784)

(declare-fun e!125870 () Unit!5784)

(assert (=> b!191270 (= lt!94916 e!125870)))

(declare-fun c!34430 () Bool)

(declare-fun contains!1351 (ListLongMap!2445 (_ BitVec 64)) Bool)

(assert (=> b!191270 (= c!34430 (contains!1351 lt!94918 key!828))))

(assert (=> b!191270 (= lt!94918 (getCurrentListMap!886 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun b!191271 () Bool)

(declare-fun e!125867 () Bool)

(declare-fun e!125868 () Bool)

(declare-fun mapRes!7683 () Bool)

(assert (=> b!191271 (= e!125867 (and e!125868 mapRes!7683))))

(declare-fun condMapEmpty!7683 () Bool)

(declare-fun mapDefault!7683 () ValueCell!1881)

(assert (=> b!191271 (= condMapEmpty!7683 (= (arr!3834 (_values!3886 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1881)) mapDefault!7683)))))

(declare-fun b!191272 () Bool)

(declare-fun e!125866 () Bool)

(assert (=> b!191272 (= e!125866 (= (select (arr!3833 (_keys!5880 thiss!1248)) (index!4879 lt!94921)) key!828))))

(declare-fun b!191273 () Bool)

(declare-fun lt!94920 () Unit!5784)

(assert (=> b!191273 (= e!125870 lt!94920)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!172 (array!8135 array!8137 (_ BitVec 32) (_ BitVec 32) V!5579 V!5579 (_ BitVec 64) Int) Unit!5784)

(assert (=> b!191273 (= lt!94920 (lemmaInListMapThenSeekEntryOrOpenFindsIt!172 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) key!828 (defaultEntry!3903 thiss!1248)))))

(declare-fun res!90404 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191273 (= res!90404 (inRange!0 (index!4879 lt!94921) (mask!9119 thiss!1248)))))

(assert (=> b!191273 (=> (not res!90404) (not e!125866))))

(assert (=> b!191273 e!125866))

(declare-fun tp_is_empty!4449 () Bool)

(declare-fun e!125865 () Bool)

(declare-fun array_inv!2485 (array!8135) Bool)

(declare-fun array_inv!2486 (array!8137) Bool)

(assert (=> b!191274 (= e!125865 (and tp!16877 tp_is_empty!4449 (array_inv!2485 (_keys!5880 thiss!1248)) (array_inv!2486 (_values!3886 thiss!1248)) e!125867))))

(declare-fun b!191275 () Bool)

(declare-fun e!125864 () Bool)

(assert (=> b!191275 (= e!125864 e!125871)))

(declare-fun res!90406 () Bool)

(assert (=> b!191275 (=> (not res!90406) (not e!125871))))

(get-info :version)

(assert (=> b!191275 (= res!90406 (and (not ((_ is Undefined!677) lt!94921)) (not ((_ is MissingVacant!677) lt!94921)) (not ((_ is MissingZero!677) lt!94921)) ((_ is Found!677) lt!94921)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8135 (_ BitVec 32)) SeekEntryResult!677)

(assert (=> b!191275 (= lt!94921 (seekEntryOrOpen!0 key!828 (_keys!5880 thiss!1248) (mask!9119 thiss!1248)))))

(declare-fun b!191276 () Bool)

(declare-fun res!90402 () Bool)

(assert (=> b!191276 (=> (not res!90402) (not e!125864))))

(assert (=> b!191276 (= res!90402 (not (= key!828 (bvneg key!828))))))

(declare-fun b!191277 () Bool)

(declare-fun Unit!5786 () Unit!5784)

(assert (=> b!191277 (= e!125870 Unit!5786)))

(declare-fun lt!94919 () Unit!5784)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!179 (array!8135 array!8137 (_ BitVec 32) (_ BitVec 32) V!5579 V!5579 (_ BitVec 64) Int) Unit!5784)

(assert (=> b!191277 (= lt!94919 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!179 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) key!828 (defaultEntry!3903 thiss!1248)))))

(assert (=> b!191277 false))

(declare-fun mapIsEmpty!7683 () Bool)

(assert (=> mapIsEmpty!7683 mapRes!7683))

(declare-fun b!191278 () Bool)

(assert (=> b!191278 (= e!125868 tp_is_empty!4449)))

(declare-fun mapNonEmpty!7683 () Bool)

(declare-fun tp!16878 () Bool)

(declare-fun e!125873 () Bool)

(assert (=> mapNonEmpty!7683 (= mapRes!7683 (and tp!16878 e!125873))))

(declare-fun mapRest!7683 () (Array (_ BitVec 32) ValueCell!1881))

(declare-fun mapKey!7683 () (_ BitVec 32))

(declare-fun mapValue!7683 () ValueCell!1881)

(assert (=> mapNonEmpty!7683 (= (arr!3834 (_values!3886 thiss!1248)) (store mapRest!7683 mapKey!7683 mapValue!7683))))

(declare-fun res!90405 () Bool)

(assert (=> start!19476 (=> (not res!90405) (not e!125864))))

(declare-fun valid!1096 (LongMapFixedSize!2670) Bool)

(assert (=> start!19476 (= res!90405 (valid!1096 thiss!1248))))

(assert (=> start!19476 e!125864))

(assert (=> start!19476 e!125865))

(assert (=> start!19476 true))

(assert (=> start!19476 tp_is_empty!4449))

(declare-fun b!191279 () Bool)

(assert (=> b!191279 (= e!125873 tp_is_empty!4449)))

(declare-fun b!191280 () Bool)

(assert (=> b!191280 (= e!125869 (or (not (= (size!4156 (_values!3886 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9119 thiss!1248)))) (not (= (size!4155 (_keys!5880 thiss!1248)) (size!4156 (_values!3886 thiss!1248)))) (bvsge (mask!9119 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and start!19476 res!90405) b!191276))

(assert (= (and b!191276 res!90402) b!191275))

(assert (= (and b!191275 res!90406) b!191270))

(assert (= (and b!191270 c!34430) b!191273))

(assert (= (and b!191270 (not c!34430)) b!191277))

(assert (= (and b!191273 res!90404) b!191272))

(assert (= (and b!191270 (not res!90403)) b!191280))

(assert (= (and b!191271 condMapEmpty!7683) mapIsEmpty!7683))

(assert (= (and b!191271 (not condMapEmpty!7683)) mapNonEmpty!7683))

(assert (= (and mapNonEmpty!7683 ((_ is ValueCellFull!1881) mapValue!7683)) b!191279))

(assert (= (and b!191271 ((_ is ValueCellFull!1881) mapDefault!7683)) b!191278))

(assert (= b!191274 b!191271))

(assert (= start!19476 b!191274))

(declare-fun m!217849 () Bool)

(assert (=> start!19476 m!217849))

(declare-fun m!217851 () Bool)

(assert (=> b!191270 m!217851))

(declare-fun m!217853 () Bool)

(assert (=> b!191270 m!217853))

(declare-fun m!217855 () Bool)

(assert (=> b!191270 m!217855))

(declare-fun m!217857 () Bool)

(assert (=> b!191270 m!217857))

(declare-fun m!217859 () Bool)

(assert (=> b!191270 m!217859))

(declare-fun m!217861 () Bool)

(assert (=> b!191270 m!217861))

(declare-fun m!217863 () Bool)

(assert (=> b!191270 m!217863))

(declare-fun m!217865 () Bool)

(assert (=> b!191272 m!217865))

(declare-fun m!217867 () Bool)

(assert (=> mapNonEmpty!7683 m!217867))

(declare-fun m!217869 () Bool)

(assert (=> b!191277 m!217869))

(declare-fun m!217871 () Bool)

(assert (=> b!191274 m!217871))

(declare-fun m!217873 () Bool)

(assert (=> b!191274 m!217873))

(declare-fun m!217875 () Bool)

(assert (=> b!191275 m!217875))

(declare-fun m!217877 () Bool)

(assert (=> b!191273 m!217877))

(declare-fun m!217879 () Bool)

(assert (=> b!191273 m!217879))

(check-sat (not mapNonEmpty!7683) (not b!191274) (not b!191277) b_and!11347 (not b!191275) (not start!19476) (not b!191270) tp_is_empty!4449 (not b!191273) (not b_next!4677))
(check-sat b_and!11347 (not b_next!4677))
(get-model)

(declare-fun b!191330 () Bool)

(declare-fun lt!94944 () SeekEntryResult!677)

(assert (=> b!191330 (and (bvsge (index!4878 lt!94944) #b00000000000000000000000000000000) (bvslt (index!4878 lt!94944) (size!4155 (_keys!5880 thiss!1248))))))

(declare-fun res!90433 () Bool)

(assert (=> b!191330 (= res!90433 (= (select (arr!3833 (_keys!5880 thiss!1248)) (index!4878 lt!94944)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!125913 () Bool)

(assert (=> b!191330 (=> (not res!90433) (not e!125913))))

(declare-fun b!191331 () Bool)

(declare-fun e!125914 () Bool)

(assert (=> b!191331 (= e!125914 e!125913)))

(declare-fun res!90431 () Bool)

(declare-fun call!19299 () Bool)

(assert (=> b!191331 (= res!90431 call!19299)))

(assert (=> b!191331 (=> (not res!90431) (not e!125913))))

(declare-fun d!56127 () Bool)

(assert (=> d!56127 e!125914))

(declare-fun c!34438 () Bool)

(assert (=> d!56127 (= c!34438 ((_ is MissingZero!677) lt!94944))))

(assert (=> d!56127 (= lt!94944 (seekEntryOrOpen!0 key!828 (_keys!5880 thiss!1248) (mask!9119 thiss!1248)))))

(declare-fun lt!94945 () Unit!5784)

(declare-fun choose!1034 (array!8135 array!8137 (_ BitVec 32) (_ BitVec 32) V!5579 V!5579 (_ BitVec 64) Int) Unit!5784)

(assert (=> d!56127 (= lt!94945 (choose!1034 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) key!828 (defaultEntry!3903 thiss!1248)))))

(assert (=> d!56127 (validMask!0 (mask!9119 thiss!1248))))

(assert (=> d!56127 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!179 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) key!828 (defaultEntry!3903 thiss!1248)) lt!94945)))

(declare-fun bm!19296 () Bool)

(assert (=> bm!19296 (= call!19299 (inRange!0 (ite c!34438 (index!4878 lt!94944) (index!4881 lt!94944)) (mask!9119 thiss!1248)))))

(declare-fun b!191332 () Bool)

(declare-fun res!90432 () Bool)

(declare-fun e!125915 () Bool)

(assert (=> b!191332 (=> (not res!90432) (not e!125915))))

(assert (=> b!191332 (= res!90432 (= (select (arr!3833 (_keys!5880 thiss!1248)) (index!4881 lt!94944)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191332 (and (bvsge (index!4881 lt!94944) #b00000000000000000000000000000000) (bvslt (index!4881 lt!94944) (size!4155 (_keys!5880 thiss!1248))))))

(declare-fun b!191333 () Bool)

(declare-fun call!19300 () Bool)

(assert (=> b!191333 (= e!125915 (not call!19300))))

(declare-fun b!191334 () Bool)

(declare-fun res!90430 () Bool)

(assert (=> b!191334 (=> (not res!90430) (not e!125915))))

(assert (=> b!191334 (= res!90430 call!19299)))

(declare-fun e!125912 () Bool)

(assert (=> b!191334 (= e!125912 e!125915)))

(declare-fun b!191335 () Bool)

(assert (=> b!191335 (= e!125912 ((_ is Undefined!677) lt!94944))))

(declare-fun bm!19297 () Bool)

(declare-fun arrayContainsKey!0 (array!8135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19297 (= call!19300 (arrayContainsKey!0 (_keys!5880 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!191336 () Bool)

(assert (=> b!191336 (= e!125914 e!125912)))

(declare-fun c!34439 () Bool)

(assert (=> b!191336 (= c!34439 ((_ is MissingVacant!677) lt!94944))))

(declare-fun b!191337 () Bool)

(assert (=> b!191337 (= e!125913 (not call!19300))))

(assert (= (and d!56127 c!34438) b!191331))

(assert (= (and d!56127 (not c!34438)) b!191336))

(assert (= (and b!191331 res!90431) b!191330))

(assert (= (and b!191330 res!90433) b!191337))

(assert (= (and b!191336 c!34439) b!191334))

(assert (= (and b!191336 (not c!34439)) b!191335))

(assert (= (and b!191334 res!90430) b!191332))

(assert (= (and b!191332 res!90432) b!191333))

(assert (= (or b!191331 b!191334) bm!19296))

(assert (= (or b!191337 b!191333) bm!19297))

(declare-fun m!217913 () Bool)

(assert (=> bm!19296 m!217913))

(assert (=> d!56127 m!217875))

(declare-fun m!217915 () Bool)

(assert (=> d!56127 m!217915))

(assert (=> d!56127 m!217855))

(declare-fun m!217917 () Bool)

(assert (=> bm!19297 m!217917))

(declare-fun m!217919 () Bool)

(assert (=> b!191330 m!217919))

(declare-fun m!217921 () Bool)

(assert (=> b!191332 m!217921))

(assert (=> b!191277 d!56127))

(declare-fun d!56129 () Bool)

(declare-fun e!125918 () Bool)

(assert (=> d!56129 e!125918))

(declare-fun res!90438 () Bool)

(assert (=> d!56129 (=> (not res!90438) (not e!125918))))

(declare-fun lt!94950 () SeekEntryResult!677)

(assert (=> d!56129 (= res!90438 ((_ is Found!677) lt!94950))))

(assert (=> d!56129 (= lt!94950 (seekEntryOrOpen!0 key!828 (_keys!5880 thiss!1248) (mask!9119 thiss!1248)))))

(declare-fun lt!94951 () Unit!5784)

(declare-fun choose!1035 (array!8135 array!8137 (_ BitVec 32) (_ BitVec 32) V!5579 V!5579 (_ BitVec 64) Int) Unit!5784)

(assert (=> d!56129 (= lt!94951 (choose!1035 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) key!828 (defaultEntry!3903 thiss!1248)))))

(assert (=> d!56129 (validMask!0 (mask!9119 thiss!1248))))

(assert (=> d!56129 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!172 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) key!828 (defaultEntry!3903 thiss!1248)) lt!94951)))

(declare-fun b!191342 () Bool)

(declare-fun res!90439 () Bool)

(assert (=> b!191342 (=> (not res!90439) (not e!125918))))

(assert (=> b!191342 (= res!90439 (inRange!0 (index!4879 lt!94950) (mask!9119 thiss!1248)))))

(declare-fun b!191343 () Bool)

(assert (=> b!191343 (= e!125918 (= (select (arr!3833 (_keys!5880 thiss!1248)) (index!4879 lt!94950)) key!828))))

(assert (=> b!191343 (and (bvsge (index!4879 lt!94950) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94950) (size!4155 (_keys!5880 thiss!1248))))))

(assert (= (and d!56129 res!90438) b!191342))

(assert (= (and b!191342 res!90439) b!191343))

(assert (=> d!56129 m!217875))

(declare-fun m!217923 () Bool)

(assert (=> d!56129 m!217923))

(assert (=> d!56129 m!217855))

(declare-fun m!217925 () Bool)

(assert (=> b!191342 m!217925))

(declare-fun m!217927 () Bool)

(assert (=> b!191343 m!217927))

(assert (=> b!191273 d!56129))

(declare-fun d!56131 () Bool)

(assert (=> d!56131 (= (inRange!0 (index!4879 lt!94921) (mask!9119 thiss!1248)) (and (bvsge (index!4879 lt!94921) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94921) (bvadd (mask!9119 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191273 d!56131))

(declare-fun d!56133 () Bool)

(declare-fun res!90446 () Bool)

(declare-fun e!125921 () Bool)

(assert (=> d!56133 (=> (not res!90446) (not e!125921))))

(declare-fun simpleValid!197 (LongMapFixedSize!2670) Bool)

(assert (=> d!56133 (= res!90446 (simpleValid!197 thiss!1248))))

(assert (=> d!56133 (= (valid!1096 thiss!1248) e!125921)))

(declare-fun b!191350 () Bool)

(declare-fun res!90447 () Bool)

(assert (=> b!191350 (=> (not res!90447) (not e!125921))))

(declare-fun arrayCountValidKeys!0 (array!8135 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!191350 (= res!90447 (= (arrayCountValidKeys!0 (_keys!5880 thiss!1248) #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))) (_size!1384 thiss!1248)))))

(declare-fun b!191351 () Bool)

(declare-fun res!90448 () Bool)

(assert (=> b!191351 (=> (not res!90448) (not e!125921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8135 (_ BitVec 32)) Bool)

(assert (=> b!191351 (= res!90448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5880 thiss!1248) (mask!9119 thiss!1248)))))

(declare-fun b!191352 () Bool)

(declare-datatypes ((List!2423 0))(
  ( (Nil!2420) (Cons!2419 (h!3058 (_ BitVec 64)) (t!7337 List!2423)) )
))
(declare-fun arrayNoDuplicates!0 (array!8135 (_ BitVec 32) List!2423) Bool)

(assert (=> b!191352 (= e!125921 (arrayNoDuplicates!0 (_keys!5880 thiss!1248) #b00000000000000000000000000000000 Nil!2420))))

(assert (= (and d!56133 res!90446) b!191350))

(assert (= (and b!191350 res!90447) b!191351))

(assert (= (and b!191351 res!90448) b!191352))

(declare-fun m!217929 () Bool)

(assert (=> d!56133 m!217929))

(declare-fun m!217931 () Bool)

(assert (=> b!191350 m!217931))

(declare-fun m!217933 () Bool)

(assert (=> b!191351 m!217933))

(declare-fun m!217935 () Bool)

(assert (=> b!191352 m!217935))

(assert (=> start!19476 d!56133))

(declare-fun b!191365 () Bool)

(declare-fun e!125929 () SeekEntryResult!677)

(declare-fun lt!94958 () SeekEntryResult!677)

(assert (=> b!191365 (= e!125929 (Found!677 (index!4880 lt!94958)))))

(declare-fun b!191366 () Bool)

(declare-fun e!125928 () SeekEntryResult!677)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8135 (_ BitVec 32)) SeekEntryResult!677)

(assert (=> b!191366 (= e!125928 (seekKeyOrZeroReturnVacant!0 (x!20531 lt!94958) (index!4880 lt!94958) (index!4880 lt!94958) key!828 (_keys!5880 thiss!1248) (mask!9119 thiss!1248)))))

(declare-fun b!191367 () Bool)

(assert (=> b!191367 (= e!125928 (MissingZero!677 (index!4880 lt!94958)))))

(declare-fun b!191368 () Bool)

(declare-fun c!34447 () Bool)

(declare-fun lt!94959 () (_ BitVec 64))

(assert (=> b!191368 (= c!34447 (= lt!94959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191368 (= e!125929 e!125928)))

(declare-fun d!56135 () Bool)

(declare-fun lt!94960 () SeekEntryResult!677)

(assert (=> d!56135 (and (or ((_ is Undefined!677) lt!94960) (not ((_ is Found!677) lt!94960)) (and (bvsge (index!4879 lt!94960) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94960) (size!4155 (_keys!5880 thiss!1248))))) (or ((_ is Undefined!677) lt!94960) ((_ is Found!677) lt!94960) (not ((_ is MissingZero!677) lt!94960)) (and (bvsge (index!4878 lt!94960) #b00000000000000000000000000000000) (bvslt (index!4878 lt!94960) (size!4155 (_keys!5880 thiss!1248))))) (or ((_ is Undefined!677) lt!94960) ((_ is Found!677) lt!94960) ((_ is MissingZero!677) lt!94960) (not ((_ is MissingVacant!677) lt!94960)) (and (bvsge (index!4881 lt!94960) #b00000000000000000000000000000000) (bvslt (index!4881 lt!94960) (size!4155 (_keys!5880 thiss!1248))))) (or ((_ is Undefined!677) lt!94960) (ite ((_ is Found!677) lt!94960) (= (select (arr!3833 (_keys!5880 thiss!1248)) (index!4879 lt!94960)) key!828) (ite ((_ is MissingZero!677) lt!94960) (= (select (arr!3833 (_keys!5880 thiss!1248)) (index!4878 lt!94960)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!677) lt!94960) (= (select (arr!3833 (_keys!5880 thiss!1248)) (index!4881 lt!94960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!125930 () SeekEntryResult!677)

(assert (=> d!56135 (= lt!94960 e!125930)))

(declare-fun c!34446 () Bool)

(assert (=> d!56135 (= c!34446 (and ((_ is Intermediate!677) lt!94958) (undefined!1489 lt!94958)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8135 (_ BitVec 32)) SeekEntryResult!677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56135 (= lt!94958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9119 thiss!1248)) key!828 (_keys!5880 thiss!1248) (mask!9119 thiss!1248)))))

(assert (=> d!56135 (validMask!0 (mask!9119 thiss!1248))))

(assert (=> d!56135 (= (seekEntryOrOpen!0 key!828 (_keys!5880 thiss!1248) (mask!9119 thiss!1248)) lt!94960)))

(declare-fun b!191369 () Bool)

(assert (=> b!191369 (= e!125930 e!125929)))

(assert (=> b!191369 (= lt!94959 (select (arr!3833 (_keys!5880 thiss!1248)) (index!4880 lt!94958)))))

(declare-fun c!34448 () Bool)

(assert (=> b!191369 (= c!34448 (= lt!94959 key!828))))

(declare-fun b!191370 () Bool)

(assert (=> b!191370 (= e!125930 Undefined!677)))

(assert (= (and d!56135 c!34446) b!191370))

(assert (= (and d!56135 (not c!34446)) b!191369))

(assert (= (and b!191369 c!34448) b!191365))

(assert (= (and b!191369 (not c!34448)) b!191368))

(assert (= (and b!191368 c!34447) b!191367))

(assert (= (and b!191368 (not c!34447)) b!191366))

(declare-fun m!217937 () Bool)

(assert (=> b!191366 m!217937))

(declare-fun m!217939 () Bool)

(assert (=> d!56135 m!217939))

(declare-fun m!217941 () Bool)

(assert (=> d!56135 m!217941))

(assert (=> d!56135 m!217941))

(declare-fun m!217943 () Bool)

(assert (=> d!56135 m!217943))

(declare-fun m!217945 () Bool)

(assert (=> d!56135 m!217945))

(assert (=> d!56135 m!217855))

(declare-fun m!217947 () Bool)

(assert (=> d!56135 m!217947))

(declare-fun m!217949 () Bool)

(assert (=> b!191369 m!217949))

(assert (=> b!191275 d!56135))

(declare-fun d!56137 () Bool)

(assert (=> d!56137 (= (array_inv!2485 (_keys!5880 thiss!1248)) (bvsge (size!4155 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191274 d!56137))

(declare-fun d!56139 () Bool)

(assert (=> d!56139 (= (array_inv!2486 (_values!3886 thiss!1248)) (bvsge (size!4156 (_values!3886 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191274 d!56139))

(declare-fun b!191413 () Bool)

(declare-fun e!125968 () Bool)

(declare-fun e!125960 () Bool)

(assert (=> b!191413 (= e!125968 e!125960)))

(declare-fun c!34466 () Bool)

(assert (=> b!191413 (= c!34466 (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191414 () Bool)

(declare-fun e!125969 () Bool)

(declare-fun e!125959 () Bool)

(assert (=> b!191414 (= e!125969 e!125959)))

(declare-fun res!90472 () Bool)

(declare-fun call!19320 () Bool)

(assert (=> b!191414 (= res!90472 call!19320)))

(assert (=> b!191414 (=> (not res!90472) (not e!125959))))

(declare-fun b!191415 () Bool)

(declare-fun e!125957 () Bool)

(declare-fun lt!95026 () ListLongMap!2445)

(declare-fun apply!181 (ListLongMap!2445 (_ BitVec 64)) V!5579)

(assert (=> b!191415 (= e!125957 (= (apply!181 lt!95026 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3744 thiss!1248)))))

(declare-fun e!125962 () Bool)

(declare-fun b!191416 () Bool)

(declare-fun get!2210 (ValueCell!1881 V!5579) V!5579)

(declare-fun dynLambda!524 (Int (_ BitVec 64)) V!5579)

(assert (=> b!191416 (= e!125962 (= (apply!181 lt!95026 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000)) (get!2210 (select (arr!3834 (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!524 (defaultEntry!3903 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248))))))))

(assert (=> b!191416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))

(declare-fun b!191417 () Bool)

(declare-fun e!125965 () ListLongMap!2445)

(declare-fun call!19321 () ListLongMap!2445)

(assert (=> b!191417 (= e!125965 call!19321)))

(declare-fun b!191418 () Bool)

(declare-fun e!125966 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!191418 (= e!125966 (validKeyInArray!0 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191419 () Bool)

(declare-fun e!125964 () ListLongMap!2445)

(declare-fun call!19315 () ListLongMap!2445)

(assert (=> b!191419 (= e!125964 (+!306 call!19315 (tuple2!3529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3744 thiss!1248))))))

(declare-fun b!191420 () Bool)

(declare-fun call!19317 () Bool)

(assert (=> b!191420 (= e!125960 (not call!19317))))

(declare-fun bm!19312 () Bool)

(declare-fun call!19316 () ListLongMap!2445)

(declare-fun call!19318 () ListLongMap!2445)

(assert (=> bm!19312 (= call!19316 call!19318)))

(declare-fun b!191421 () Bool)

(declare-fun call!19319 () ListLongMap!2445)

(assert (=> b!191421 (= e!125965 call!19319)))

(declare-fun bm!19313 () Bool)

(assert (=> bm!19313 (= call!19319 call!19316)))

(declare-fun b!191422 () Bool)

(declare-fun res!90475 () Bool)

(assert (=> b!191422 (=> (not res!90475) (not e!125968))))

(assert (=> b!191422 (= res!90475 e!125969)))

(declare-fun c!34462 () Bool)

(assert (=> b!191422 (= c!34462 (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!191423 () Bool)

(declare-fun e!125967 () Bool)

(assert (=> b!191423 (= e!125967 e!125962)))

(declare-fun res!90469 () Bool)

(assert (=> b!191423 (=> (not res!90469) (not e!125962))))

(assert (=> b!191423 (= res!90469 (contains!1351 lt!95026 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191423 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))

(declare-fun b!191424 () Bool)

(declare-fun e!125958 () Bool)

(assert (=> b!191424 (= e!125958 (validKeyInArray!0 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191425 () Bool)

(assert (=> b!191425 (= e!125960 e!125957)))

(declare-fun res!90470 () Bool)

(assert (=> b!191425 (= res!90470 call!19317)))

(assert (=> b!191425 (=> (not res!90470) (not e!125957))))

(declare-fun b!191426 () Bool)

(declare-fun e!125961 () Unit!5784)

(declare-fun Unit!5787 () Unit!5784)

(assert (=> b!191426 (= e!125961 Unit!5787)))

(declare-fun b!191427 () Bool)

(declare-fun c!34465 () Bool)

(assert (=> b!191427 (= c!34465 (and (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!125963 () ListLongMap!2445)

(assert (=> b!191427 (= e!125963 e!125965)))

(declare-fun b!191428 () Bool)

(declare-fun lt!95011 () Unit!5784)

(assert (=> b!191428 (= e!125961 lt!95011)))

(declare-fun lt!95017 () ListLongMap!2445)

(declare-fun getCurrentListMapNoExtraKeys!214 (array!8135 array!8137 (_ BitVec 32) (_ BitVec 32) V!5579 V!5579 (_ BitVec 32) Int) ListLongMap!2445)

(assert (=> b!191428 (= lt!95017 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248))) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun lt!95008 () (_ BitVec 64))

(assert (=> b!191428 (= lt!95008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95019 () (_ BitVec 64))

(assert (=> b!191428 (= lt!95019 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95013 () Unit!5784)

(declare-fun addStillContains!157 (ListLongMap!2445 (_ BitVec 64) V!5579 (_ BitVec 64)) Unit!5784)

(assert (=> b!191428 (= lt!95013 (addStillContains!157 lt!95017 lt!95008 (zeroValue!3744 thiss!1248) lt!95019))))

(assert (=> b!191428 (contains!1351 (+!306 lt!95017 (tuple2!3529 lt!95008 (zeroValue!3744 thiss!1248))) lt!95019)))

(declare-fun lt!95016 () Unit!5784)

(assert (=> b!191428 (= lt!95016 lt!95013)))

(declare-fun lt!95022 () ListLongMap!2445)

(assert (=> b!191428 (= lt!95022 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248))) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun lt!95018 () (_ BitVec 64))

(assert (=> b!191428 (= lt!95018 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95014 () (_ BitVec 64))

(assert (=> b!191428 (= lt!95014 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95025 () Unit!5784)

(declare-fun addApplyDifferent!157 (ListLongMap!2445 (_ BitVec 64) V!5579 (_ BitVec 64)) Unit!5784)

(assert (=> b!191428 (= lt!95025 (addApplyDifferent!157 lt!95022 lt!95018 (minValue!3744 thiss!1248) lt!95014))))

(assert (=> b!191428 (= (apply!181 (+!306 lt!95022 (tuple2!3529 lt!95018 (minValue!3744 thiss!1248))) lt!95014) (apply!181 lt!95022 lt!95014))))

(declare-fun lt!95007 () Unit!5784)

(assert (=> b!191428 (= lt!95007 lt!95025)))

(declare-fun lt!95020 () ListLongMap!2445)

(assert (=> b!191428 (= lt!95020 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248))) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun lt!95010 () (_ BitVec 64))

(assert (=> b!191428 (= lt!95010 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95021 () (_ BitVec 64))

(assert (=> b!191428 (= lt!95021 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95005 () Unit!5784)

(assert (=> b!191428 (= lt!95005 (addApplyDifferent!157 lt!95020 lt!95010 (zeroValue!3744 thiss!1248) lt!95021))))

(assert (=> b!191428 (= (apply!181 (+!306 lt!95020 (tuple2!3529 lt!95010 (zeroValue!3744 thiss!1248))) lt!95021) (apply!181 lt!95020 lt!95021))))

(declare-fun lt!95006 () Unit!5784)

(assert (=> b!191428 (= lt!95006 lt!95005)))

(declare-fun lt!95023 () ListLongMap!2445)

(assert (=> b!191428 (= lt!95023 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248))) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun lt!95009 () (_ BitVec 64))

(assert (=> b!191428 (= lt!95009 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95012 () (_ BitVec 64))

(assert (=> b!191428 (= lt!95012 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191428 (= lt!95011 (addApplyDifferent!157 lt!95023 lt!95009 (minValue!3744 thiss!1248) lt!95012))))

(assert (=> b!191428 (= (apply!181 (+!306 lt!95023 (tuple2!3529 lt!95009 (minValue!3744 thiss!1248))) lt!95012) (apply!181 lt!95023 lt!95012))))

(declare-fun c!34461 () Bool)

(declare-fun c!34464 () Bool)

(declare-fun bm!19314 () Bool)

(assert (=> bm!19314 (= call!19315 (+!306 (ite c!34464 call!19318 (ite c!34461 call!19316 call!19319)) (ite (or c!34464 c!34461) (tuple2!3529 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3744 thiss!1248)) (tuple2!3529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3744 thiss!1248)))))))

(declare-fun d!56141 () Bool)

(assert (=> d!56141 e!125968))

(declare-fun res!90474 () Bool)

(assert (=> d!56141 (=> (not res!90474) (not e!125968))))

(assert (=> d!56141 (= res!90474 (or (bvsge #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))))

(declare-fun lt!95015 () ListLongMap!2445)

(assert (=> d!56141 (= lt!95026 lt!95015)))

(declare-fun lt!95024 () Unit!5784)

(assert (=> d!56141 (= lt!95024 e!125961)))

(declare-fun c!34463 () Bool)

(assert (=> d!56141 (= c!34463 e!125958)))

(declare-fun res!90467 () Bool)

(assert (=> d!56141 (=> (not res!90467) (not e!125958))))

(assert (=> d!56141 (= res!90467 (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))

(assert (=> d!56141 (= lt!95015 e!125964)))

(assert (=> d!56141 (= c!34464 (and (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56141 (validMask!0 (mask!9119 thiss!1248))))

(assert (=> d!56141 (= (getCurrentListMap!886 (_keys!5880 thiss!1248) (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248))) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)) lt!95026)))

(declare-fun b!191429 () Bool)

(assert (=> b!191429 (= e!125969 (not call!19320))))

(declare-fun bm!19315 () Bool)

(assert (=> bm!19315 (= call!19318 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248))) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun bm!19316 () Bool)

(assert (=> bm!19316 (= call!19321 call!19315)))

(declare-fun b!191430 () Bool)

(declare-fun res!90473 () Bool)

(assert (=> b!191430 (=> (not res!90473) (not e!125968))))

(assert (=> b!191430 (= res!90473 e!125967)))

(declare-fun res!90471 () Bool)

(assert (=> b!191430 (=> res!90471 e!125967)))

(assert (=> b!191430 (= res!90471 (not e!125966))))

(declare-fun res!90468 () Bool)

(assert (=> b!191430 (=> (not res!90468) (not e!125966))))

(assert (=> b!191430 (= res!90468 (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))

(declare-fun bm!19317 () Bool)

(assert (=> bm!19317 (= call!19320 (contains!1351 lt!95026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191431 () Bool)

(assert (=> b!191431 (= e!125963 call!19321)))

(declare-fun b!191432 () Bool)

(assert (=> b!191432 (= e!125959 (= (apply!181 lt!95026 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3744 thiss!1248)))))

(declare-fun bm!19318 () Bool)

(assert (=> bm!19318 (= call!19317 (contains!1351 lt!95026 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191433 () Bool)

(assert (=> b!191433 (= e!125964 e!125963)))

(assert (=> b!191433 (= c!34461 (and (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!56141 c!34464) b!191419))

(assert (= (and d!56141 (not c!34464)) b!191433))

(assert (= (and b!191433 c!34461) b!191431))

(assert (= (and b!191433 (not c!34461)) b!191427))

(assert (= (and b!191427 c!34465) b!191417))

(assert (= (and b!191427 (not c!34465)) b!191421))

(assert (= (or b!191417 b!191421) bm!19313))

(assert (= (or b!191431 bm!19313) bm!19312))

(assert (= (or b!191431 b!191417) bm!19316))

(assert (= (or b!191419 bm!19312) bm!19315))

(assert (= (or b!191419 bm!19316) bm!19314))

(assert (= (and d!56141 res!90467) b!191424))

(assert (= (and d!56141 c!34463) b!191428))

(assert (= (and d!56141 (not c!34463)) b!191426))

(assert (= (and d!56141 res!90474) b!191430))

(assert (= (and b!191430 res!90468) b!191418))

(assert (= (and b!191430 (not res!90471)) b!191423))

(assert (= (and b!191423 res!90469) b!191416))

(assert (= (and b!191430 res!90473) b!191422))

(assert (= (and b!191422 c!34462) b!191414))

(assert (= (and b!191422 (not c!34462)) b!191429))

(assert (= (and b!191414 res!90472) b!191432))

(assert (= (or b!191414 b!191429) bm!19317))

(assert (= (and b!191422 res!90475) b!191413))

(assert (= (and b!191413 c!34466) b!191425))

(assert (= (and b!191413 (not c!34466)) b!191420))

(assert (= (and b!191425 res!90470) b!191415))

(assert (= (or b!191425 b!191420) bm!19318))

(declare-fun b_lambda!7391 () Bool)

(assert (=> (not b_lambda!7391) (not b!191416)))

(declare-fun t!7336 () Bool)

(declare-fun tb!2873 () Bool)

(assert (=> (and b!191274 (= (defaultEntry!3903 thiss!1248) (defaultEntry!3903 thiss!1248)) t!7336) tb!2873))

(declare-fun result!4897 () Bool)

(assert (=> tb!2873 (= result!4897 tp_is_empty!4449)))

(assert (=> b!191416 t!7336))

(declare-fun b_and!11351 () Bool)

(assert (= b_and!11347 (and (=> t!7336 result!4897) b_and!11351)))

(assert (=> d!56141 m!217855))

(declare-fun m!217951 () Bool)

(assert (=> b!191418 m!217951))

(assert (=> b!191418 m!217951))

(declare-fun m!217953 () Bool)

(assert (=> b!191418 m!217953))

(declare-fun m!217955 () Bool)

(assert (=> b!191432 m!217955))

(declare-fun m!217957 () Bool)

(assert (=> bm!19318 m!217957))

(assert (=> b!191423 m!217951))

(assert (=> b!191423 m!217951))

(declare-fun m!217959 () Bool)

(assert (=> b!191423 m!217959))

(declare-fun m!217961 () Bool)

(assert (=> bm!19317 m!217961))

(assert (=> b!191424 m!217951))

(assert (=> b!191424 m!217951))

(assert (=> b!191424 m!217953))

(declare-fun m!217963 () Bool)

(assert (=> bm!19314 m!217963))

(declare-fun m!217965 () Bool)

(assert (=> b!191428 m!217965))

(declare-fun m!217967 () Bool)

(assert (=> b!191428 m!217967))

(declare-fun m!217969 () Bool)

(assert (=> b!191428 m!217969))

(declare-fun m!217971 () Bool)

(assert (=> b!191428 m!217971))

(declare-fun m!217973 () Bool)

(assert (=> b!191428 m!217973))

(declare-fun m!217975 () Bool)

(assert (=> b!191428 m!217975))

(declare-fun m!217977 () Bool)

(assert (=> b!191428 m!217977))

(declare-fun m!217979 () Bool)

(assert (=> b!191428 m!217979))

(assert (=> b!191428 m!217951))

(assert (=> b!191428 m!217969))

(declare-fun m!217981 () Bool)

(assert (=> b!191428 m!217981))

(declare-fun m!217983 () Bool)

(assert (=> b!191428 m!217983))

(assert (=> b!191428 m!217971))

(declare-fun m!217985 () Bool)

(assert (=> b!191428 m!217985))

(declare-fun m!217987 () Bool)

(assert (=> b!191428 m!217987))

(declare-fun m!217989 () Bool)

(assert (=> b!191428 m!217989))

(assert (=> b!191428 m!217979))

(declare-fun m!217991 () Bool)

(assert (=> b!191428 m!217991))

(declare-fun m!217993 () Bool)

(assert (=> b!191428 m!217993))

(assert (=> b!191428 m!217975))

(declare-fun m!217995 () Bool)

(assert (=> b!191428 m!217995))

(declare-fun m!217997 () Bool)

(assert (=> b!191416 m!217997))

(assert (=> b!191416 m!217951))

(declare-fun m!217999 () Bool)

(assert (=> b!191416 m!217999))

(assert (=> b!191416 m!217999))

(assert (=> b!191416 m!217997))

(declare-fun m!218001 () Bool)

(assert (=> b!191416 m!218001))

(assert (=> b!191416 m!217951))

(declare-fun m!218003 () Bool)

(assert (=> b!191416 m!218003))

(assert (=> bm!19315 m!217973))

(declare-fun m!218005 () Bool)

(assert (=> b!191419 m!218005))

(declare-fun m!218007 () Bool)

(assert (=> b!191415 m!218007))

(assert (=> b!191270 d!56141))

(declare-fun d!56143 () Bool)

(assert (=> d!56143 (= (validMask!0 (mask!9119 thiss!1248)) (and (or (= (mask!9119 thiss!1248) #b00000000000000000000000000000111) (= (mask!9119 thiss!1248) #b00000000000000000000000000001111) (= (mask!9119 thiss!1248) #b00000000000000000000000000011111) (= (mask!9119 thiss!1248) #b00000000000000000000000000111111) (= (mask!9119 thiss!1248) #b00000000000000000000000001111111) (= (mask!9119 thiss!1248) #b00000000000000000000000011111111) (= (mask!9119 thiss!1248) #b00000000000000000000000111111111) (= (mask!9119 thiss!1248) #b00000000000000000000001111111111) (= (mask!9119 thiss!1248) #b00000000000000000000011111111111) (= (mask!9119 thiss!1248) #b00000000000000000000111111111111) (= (mask!9119 thiss!1248) #b00000000000000000001111111111111) (= (mask!9119 thiss!1248) #b00000000000000000011111111111111) (= (mask!9119 thiss!1248) #b00000000000000000111111111111111) (= (mask!9119 thiss!1248) #b00000000000000001111111111111111) (= (mask!9119 thiss!1248) #b00000000000000011111111111111111) (= (mask!9119 thiss!1248) #b00000000000000111111111111111111) (= (mask!9119 thiss!1248) #b00000000000001111111111111111111) (= (mask!9119 thiss!1248) #b00000000000011111111111111111111) (= (mask!9119 thiss!1248) #b00000000000111111111111111111111) (= (mask!9119 thiss!1248) #b00000000001111111111111111111111) (= (mask!9119 thiss!1248) #b00000000011111111111111111111111) (= (mask!9119 thiss!1248) #b00000000111111111111111111111111) (= (mask!9119 thiss!1248) #b00000001111111111111111111111111) (= (mask!9119 thiss!1248) #b00000011111111111111111111111111) (= (mask!9119 thiss!1248) #b00000111111111111111111111111111) (= (mask!9119 thiss!1248) #b00001111111111111111111111111111) (= (mask!9119 thiss!1248) #b00011111111111111111111111111111) (= (mask!9119 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9119 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!191270 d!56143))

(declare-fun d!56145 () Bool)

(declare-fun e!125972 () Bool)

(assert (=> d!56145 e!125972))

(declare-fun res!90478 () Bool)

(assert (=> d!56145 (=> (not res!90478) (not e!125972))))

(assert (=> d!56145 (= res!90478 (and (bvsge (index!4879 lt!94921) #b00000000000000000000000000000000) (bvslt (index!4879 lt!94921) (size!4156 (_values!3886 thiss!1248)))))))

(declare-fun lt!95029 () Unit!5784)

(declare-fun choose!1036 (array!8135 array!8137 (_ BitVec 32) (_ BitVec 32) V!5579 V!5579 (_ BitVec 32) (_ BitVec 64) V!5579 Int) Unit!5784)

(assert (=> d!56145 (= lt!95029 (choose!1036 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) (index!4879 lt!94921) key!828 v!309 (defaultEntry!3903 thiss!1248)))))

(assert (=> d!56145 (validMask!0 (mask!9119 thiss!1248))))

(assert (=> d!56145 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!107 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) (index!4879 lt!94921) key!828 v!309 (defaultEntry!3903 thiss!1248)) lt!95029)))

(declare-fun b!191438 () Bool)

(assert (=> b!191438 (= e!125972 (= (+!306 (getCurrentListMap!886 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)) (tuple2!3529 key!828 v!309)) (getCurrentListMap!886 (_keys!5880 thiss!1248) (array!8138 (store (arr!3834 (_values!3886 thiss!1248)) (index!4879 lt!94921) (ValueCellFull!1881 v!309)) (size!4156 (_values!3886 thiss!1248))) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248))))))

(assert (= (and d!56145 res!90478) b!191438))

(declare-fun m!218009 () Bool)

(assert (=> d!56145 m!218009))

(assert (=> d!56145 m!217855))

(assert (=> b!191438 m!217857))

(assert (=> b!191438 m!217857))

(declare-fun m!218011 () Bool)

(assert (=> b!191438 m!218011))

(assert (=> b!191438 m!217863))

(assert (=> b!191438 m!217859))

(assert (=> b!191270 d!56145))

(declare-fun b!191439 () Bool)

(declare-fun e!125984 () Bool)

(declare-fun e!125976 () Bool)

(assert (=> b!191439 (= e!125984 e!125976)))

(declare-fun c!34472 () Bool)

(assert (=> b!191439 (= c!34472 (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191440 () Bool)

(declare-fun e!125985 () Bool)

(declare-fun e!125975 () Bool)

(assert (=> b!191440 (= e!125985 e!125975)))

(declare-fun res!90484 () Bool)

(declare-fun call!19327 () Bool)

(assert (=> b!191440 (= res!90484 call!19327)))

(assert (=> b!191440 (=> (not res!90484) (not e!125975))))

(declare-fun b!191441 () Bool)

(declare-fun e!125973 () Bool)

(declare-fun lt!95051 () ListLongMap!2445)

(assert (=> b!191441 (= e!125973 (= (apply!181 lt!95051 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3744 thiss!1248)))))

(declare-fun b!191442 () Bool)

(declare-fun e!125978 () Bool)

(assert (=> b!191442 (= e!125978 (= (apply!181 lt!95051 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000)) (get!2210 (select (arr!3834 (_values!3886 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!524 (defaultEntry!3903 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_values!3886 thiss!1248))))))

(assert (=> b!191442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))

(declare-fun b!191443 () Bool)

(declare-fun e!125981 () ListLongMap!2445)

(declare-fun call!19328 () ListLongMap!2445)

(assert (=> b!191443 (= e!125981 call!19328)))

(declare-fun b!191444 () Bool)

(declare-fun e!125982 () Bool)

(assert (=> b!191444 (= e!125982 (validKeyInArray!0 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191445 () Bool)

(declare-fun e!125980 () ListLongMap!2445)

(declare-fun call!19322 () ListLongMap!2445)

(assert (=> b!191445 (= e!125980 (+!306 call!19322 (tuple2!3529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3744 thiss!1248))))))

(declare-fun b!191446 () Bool)

(declare-fun call!19324 () Bool)

(assert (=> b!191446 (= e!125976 (not call!19324))))

(declare-fun bm!19319 () Bool)

(declare-fun call!19323 () ListLongMap!2445)

(declare-fun call!19325 () ListLongMap!2445)

(assert (=> bm!19319 (= call!19323 call!19325)))

(declare-fun b!191447 () Bool)

(declare-fun call!19326 () ListLongMap!2445)

(assert (=> b!191447 (= e!125981 call!19326)))

(declare-fun bm!19320 () Bool)

(assert (=> bm!19320 (= call!19326 call!19323)))

(declare-fun b!191448 () Bool)

(declare-fun res!90487 () Bool)

(assert (=> b!191448 (=> (not res!90487) (not e!125984))))

(assert (=> b!191448 (= res!90487 e!125985)))

(declare-fun c!34468 () Bool)

(assert (=> b!191448 (= c!34468 (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!191449 () Bool)

(declare-fun e!125983 () Bool)

(assert (=> b!191449 (= e!125983 e!125978)))

(declare-fun res!90481 () Bool)

(assert (=> b!191449 (=> (not res!90481) (not e!125978))))

(assert (=> b!191449 (= res!90481 (contains!1351 lt!95051 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))

(declare-fun b!191450 () Bool)

(declare-fun e!125974 () Bool)

(assert (=> b!191450 (= e!125974 (validKeyInArray!0 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191451 () Bool)

(assert (=> b!191451 (= e!125976 e!125973)))

(declare-fun res!90482 () Bool)

(assert (=> b!191451 (= res!90482 call!19324)))

(assert (=> b!191451 (=> (not res!90482) (not e!125973))))

(declare-fun b!191452 () Bool)

(declare-fun e!125977 () Unit!5784)

(declare-fun Unit!5788 () Unit!5784)

(assert (=> b!191452 (= e!125977 Unit!5788)))

(declare-fun b!191453 () Bool)

(declare-fun c!34471 () Bool)

(assert (=> b!191453 (= c!34471 (and (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!125979 () ListLongMap!2445)

(assert (=> b!191453 (= e!125979 e!125981)))

(declare-fun b!191454 () Bool)

(declare-fun lt!95036 () Unit!5784)

(assert (=> b!191454 (= e!125977 lt!95036)))

(declare-fun lt!95042 () ListLongMap!2445)

(assert (=> b!191454 (= lt!95042 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun lt!95033 () (_ BitVec 64))

(assert (=> b!191454 (= lt!95033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95044 () (_ BitVec 64))

(assert (=> b!191454 (= lt!95044 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95038 () Unit!5784)

(assert (=> b!191454 (= lt!95038 (addStillContains!157 lt!95042 lt!95033 (zeroValue!3744 thiss!1248) lt!95044))))

(assert (=> b!191454 (contains!1351 (+!306 lt!95042 (tuple2!3529 lt!95033 (zeroValue!3744 thiss!1248))) lt!95044)))

(declare-fun lt!95041 () Unit!5784)

(assert (=> b!191454 (= lt!95041 lt!95038)))

(declare-fun lt!95047 () ListLongMap!2445)

(assert (=> b!191454 (= lt!95047 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun lt!95043 () (_ BitVec 64))

(assert (=> b!191454 (= lt!95043 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95039 () (_ BitVec 64))

(assert (=> b!191454 (= lt!95039 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95050 () Unit!5784)

(assert (=> b!191454 (= lt!95050 (addApplyDifferent!157 lt!95047 lt!95043 (minValue!3744 thiss!1248) lt!95039))))

(assert (=> b!191454 (= (apply!181 (+!306 lt!95047 (tuple2!3529 lt!95043 (minValue!3744 thiss!1248))) lt!95039) (apply!181 lt!95047 lt!95039))))

(declare-fun lt!95032 () Unit!5784)

(assert (=> b!191454 (= lt!95032 lt!95050)))

(declare-fun lt!95045 () ListLongMap!2445)

(assert (=> b!191454 (= lt!95045 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun lt!95035 () (_ BitVec 64))

(assert (=> b!191454 (= lt!95035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95046 () (_ BitVec 64))

(assert (=> b!191454 (= lt!95046 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95030 () Unit!5784)

(assert (=> b!191454 (= lt!95030 (addApplyDifferent!157 lt!95045 lt!95035 (zeroValue!3744 thiss!1248) lt!95046))))

(assert (=> b!191454 (= (apply!181 (+!306 lt!95045 (tuple2!3529 lt!95035 (zeroValue!3744 thiss!1248))) lt!95046) (apply!181 lt!95045 lt!95046))))

(declare-fun lt!95031 () Unit!5784)

(assert (=> b!191454 (= lt!95031 lt!95030)))

(declare-fun lt!95048 () ListLongMap!2445)

(assert (=> b!191454 (= lt!95048 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun lt!95034 () (_ BitVec 64))

(assert (=> b!191454 (= lt!95034 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95037 () (_ BitVec 64))

(assert (=> b!191454 (= lt!95037 (select (arr!3833 (_keys!5880 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191454 (= lt!95036 (addApplyDifferent!157 lt!95048 lt!95034 (minValue!3744 thiss!1248) lt!95037))))

(assert (=> b!191454 (= (apply!181 (+!306 lt!95048 (tuple2!3529 lt!95034 (minValue!3744 thiss!1248))) lt!95037) (apply!181 lt!95048 lt!95037))))

(declare-fun bm!19321 () Bool)

(declare-fun c!34467 () Bool)

(declare-fun c!34470 () Bool)

(assert (=> bm!19321 (= call!19322 (+!306 (ite c!34470 call!19325 (ite c!34467 call!19323 call!19326)) (ite (or c!34470 c!34467) (tuple2!3529 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3744 thiss!1248)) (tuple2!3529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3744 thiss!1248)))))))

(declare-fun d!56147 () Bool)

(assert (=> d!56147 e!125984))

(declare-fun res!90486 () Bool)

(assert (=> d!56147 (=> (not res!90486) (not e!125984))))

(assert (=> d!56147 (= res!90486 (or (bvsge #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))))

(declare-fun lt!95040 () ListLongMap!2445)

(assert (=> d!56147 (= lt!95051 lt!95040)))

(declare-fun lt!95049 () Unit!5784)

(assert (=> d!56147 (= lt!95049 e!125977)))

(declare-fun c!34469 () Bool)

(assert (=> d!56147 (= c!34469 e!125974)))

(declare-fun res!90479 () Bool)

(assert (=> d!56147 (=> (not res!90479) (not e!125974))))

(assert (=> d!56147 (= res!90479 (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))

(assert (=> d!56147 (= lt!95040 e!125980)))

(assert (=> d!56147 (= c!34470 (and (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56147 (validMask!0 (mask!9119 thiss!1248))))

(assert (=> d!56147 (= (getCurrentListMap!886 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)) lt!95051)))

(declare-fun b!191455 () Bool)

(assert (=> b!191455 (= e!125985 (not call!19327))))

(declare-fun bm!19322 () Bool)

(assert (=> bm!19322 (= call!19325 (getCurrentListMapNoExtraKeys!214 (_keys!5880 thiss!1248) (_values!3886 thiss!1248) (mask!9119 thiss!1248) (extraKeys!3640 thiss!1248) (zeroValue!3744 thiss!1248) (minValue!3744 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3903 thiss!1248)))))

(declare-fun bm!19323 () Bool)

(assert (=> bm!19323 (= call!19328 call!19322)))

(declare-fun b!191456 () Bool)

(declare-fun res!90485 () Bool)

(assert (=> b!191456 (=> (not res!90485) (not e!125984))))

(assert (=> b!191456 (= res!90485 e!125983)))

(declare-fun res!90483 () Bool)

(assert (=> b!191456 (=> res!90483 e!125983)))

(assert (=> b!191456 (= res!90483 (not e!125982))))

(declare-fun res!90480 () Bool)

(assert (=> b!191456 (=> (not res!90480) (not e!125982))))

(assert (=> b!191456 (= res!90480 (bvslt #b00000000000000000000000000000000 (size!4155 (_keys!5880 thiss!1248))))))

(declare-fun bm!19324 () Bool)

(assert (=> bm!19324 (= call!19327 (contains!1351 lt!95051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191457 () Bool)

(assert (=> b!191457 (= e!125979 call!19328)))

(declare-fun b!191458 () Bool)

(assert (=> b!191458 (= e!125975 (= (apply!181 lt!95051 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3744 thiss!1248)))))

(declare-fun bm!19325 () Bool)

(assert (=> bm!19325 (= call!19324 (contains!1351 lt!95051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191459 () Bool)

(assert (=> b!191459 (= e!125980 e!125979)))

(assert (=> b!191459 (= c!34467 (and (not (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3640 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!56147 c!34470) b!191445))

(assert (= (and d!56147 (not c!34470)) b!191459))

(assert (= (and b!191459 c!34467) b!191457))

(assert (= (and b!191459 (not c!34467)) b!191453))

(assert (= (and b!191453 c!34471) b!191443))

(assert (= (and b!191453 (not c!34471)) b!191447))

(assert (= (or b!191443 b!191447) bm!19320))

(assert (= (or b!191457 bm!19320) bm!19319))

(assert (= (or b!191457 b!191443) bm!19323))

(assert (= (or b!191445 bm!19319) bm!19322))

(assert (= (or b!191445 bm!19323) bm!19321))

(assert (= (and d!56147 res!90479) b!191450))

(assert (= (and d!56147 c!34469) b!191454))

(assert (= (and d!56147 (not c!34469)) b!191452))

(assert (= (and d!56147 res!90486) b!191456))

(assert (= (and b!191456 res!90480) b!191444))

(assert (= (and b!191456 (not res!90483)) b!191449))

(assert (= (and b!191449 res!90481) b!191442))

(assert (= (and b!191456 res!90485) b!191448))

(assert (= (and b!191448 c!34468) b!191440))

(assert (= (and b!191448 (not c!34468)) b!191455))

(assert (= (and b!191440 res!90484) b!191458))

(assert (= (or b!191440 b!191455) bm!19324))

(assert (= (and b!191448 res!90487) b!191439))

(assert (= (and b!191439 c!34472) b!191451))

(assert (= (and b!191439 (not c!34472)) b!191446))

(assert (= (and b!191451 res!90482) b!191441))

(assert (= (or b!191451 b!191446) bm!19325))

(declare-fun b_lambda!7393 () Bool)

(assert (=> (not b_lambda!7393) (not b!191442)))

(assert (=> b!191442 t!7336))

(declare-fun b_and!11353 () Bool)

(assert (= b_and!11351 (and (=> t!7336 result!4897) b_and!11353)))

(assert (=> d!56147 m!217855))

(assert (=> b!191444 m!217951))

(assert (=> b!191444 m!217951))

(assert (=> b!191444 m!217953))

(declare-fun m!218013 () Bool)

(assert (=> b!191458 m!218013))

(declare-fun m!218015 () Bool)

(assert (=> bm!19325 m!218015))

(assert (=> b!191449 m!217951))

(assert (=> b!191449 m!217951))

(declare-fun m!218017 () Bool)

(assert (=> b!191449 m!218017))

(declare-fun m!218019 () Bool)

(assert (=> bm!19324 m!218019))

(assert (=> b!191450 m!217951))

(assert (=> b!191450 m!217951))

(assert (=> b!191450 m!217953))

(declare-fun m!218021 () Bool)

(assert (=> bm!19321 m!218021))

(declare-fun m!218023 () Bool)

(assert (=> b!191454 m!218023))

(declare-fun m!218025 () Bool)

(assert (=> b!191454 m!218025))

(declare-fun m!218027 () Bool)

(assert (=> b!191454 m!218027))

(declare-fun m!218029 () Bool)

(assert (=> b!191454 m!218029))

(declare-fun m!218031 () Bool)

(assert (=> b!191454 m!218031))

(declare-fun m!218033 () Bool)

(assert (=> b!191454 m!218033))

(declare-fun m!218035 () Bool)

(assert (=> b!191454 m!218035))

(declare-fun m!218037 () Bool)

(assert (=> b!191454 m!218037))

(assert (=> b!191454 m!217951))

(assert (=> b!191454 m!218027))

(declare-fun m!218039 () Bool)

(assert (=> b!191454 m!218039))

(declare-fun m!218041 () Bool)

(assert (=> b!191454 m!218041))

(assert (=> b!191454 m!218029))

(declare-fun m!218043 () Bool)

(assert (=> b!191454 m!218043))

(declare-fun m!218045 () Bool)

(assert (=> b!191454 m!218045))

(declare-fun m!218047 () Bool)

(assert (=> b!191454 m!218047))

(assert (=> b!191454 m!218037))

(declare-fun m!218049 () Bool)

(assert (=> b!191454 m!218049))

(declare-fun m!218051 () Bool)

(assert (=> b!191454 m!218051))

(assert (=> b!191454 m!218033))

(declare-fun m!218053 () Bool)

(assert (=> b!191454 m!218053))

(assert (=> b!191442 m!217997))

(assert (=> b!191442 m!217951))

(declare-fun m!218055 () Bool)

(assert (=> b!191442 m!218055))

(assert (=> b!191442 m!218055))

(assert (=> b!191442 m!217997))

(declare-fun m!218057 () Bool)

(assert (=> b!191442 m!218057))

(assert (=> b!191442 m!217951))

(declare-fun m!218059 () Bool)

(assert (=> b!191442 m!218059))

(assert (=> bm!19322 m!218031))

(declare-fun m!218061 () Bool)

(assert (=> b!191445 m!218061))

(declare-fun m!218063 () Bool)

(assert (=> b!191441 m!218063))

(assert (=> b!191270 d!56147))

(declare-fun d!56149 () Bool)

(declare-fun e!125991 () Bool)

(assert (=> d!56149 e!125991))

(declare-fun res!90490 () Bool)

(assert (=> d!56149 (=> res!90490 e!125991)))

(declare-fun lt!95063 () Bool)

(assert (=> d!56149 (= res!90490 (not lt!95063))))

(declare-fun lt!95061 () Bool)

(assert (=> d!56149 (= lt!95063 lt!95061)))

(declare-fun lt!95060 () Unit!5784)

(declare-fun e!125990 () Unit!5784)

(assert (=> d!56149 (= lt!95060 e!125990)))

(declare-fun c!34475 () Bool)

(assert (=> d!56149 (= c!34475 lt!95061)))

(declare-fun containsKey!242 (List!2422 (_ BitVec 64)) Bool)

(assert (=> d!56149 (= lt!95061 (containsKey!242 (toList!1238 lt!94918) key!828))))

(assert (=> d!56149 (= (contains!1351 lt!94918 key!828) lt!95063)))

(declare-fun b!191466 () Bool)

(declare-fun lt!95062 () Unit!5784)

(assert (=> b!191466 (= e!125990 lt!95062)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!190 (List!2422 (_ BitVec 64)) Unit!5784)

(assert (=> b!191466 (= lt!95062 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1238 lt!94918) key!828))))

(declare-datatypes ((Option!244 0))(
  ( (Some!243 (v!4210 V!5579)) (None!242) )
))
(declare-fun isDefined!191 (Option!244) Bool)

(declare-fun getValueByKey!238 (List!2422 (_ BitVec 64)) Option!244)

(assert (=> b!191466 (isDefined!191 (getValueByKey!238 (toList!1238 lt!94918) key!828))))

(declare-fun b!191467 () Bool)

(declare-fun Unit!5789 () Unit!5784)

(assert (=> b!191467 (= e!125990 Unit!5789)))

(declare-fun b!191468 () Bool)

(assert (=> b!191468 (= e!125991 (isDefined!191 (getValueByKey!238 (toList!1238 lt!94918) key!828)))))

(assert (= (and d!56149 c!34475) b!191466))

(assert (= (and d!56149 (not c!34475)) b!191467))

(assert (= (and d!56149 (not res!90490)) b!191468))

(declare-fun m!218065 () Bool)

(assert (=> d!56149 m!218065))

(declare-fun m!218067 () Bool)

(assert (=> b!191466 m!218067))

(declare-fun m!218069 () Bool)

(assert (=> b!191466 m!218069))

(assert (=> b!191466 m!218069))

(declare-fun m!218071 () Bool)

(assert (=> b!191466 m!218071))

(assert (=> b!191468 m!218069))

(assert (=> b!191468 m!218069))

(assert (=> b!191468 m!218071))

(assert (=> b!191270 d!56149))

(declare-fun d!56151 () Bool)

(declare-fun e!125994 () Bool)

(assert (=> d!56151 e!125994))

(declare-fun res!90495 () Bool)

(assert (=> d!56151 (=> (not res!90495) (not e!125994))))

(declare-fun lt!95072 () ListLongMap!2445)

(assert (=> d!56151 (= res!90495 (contains!1351 lt!95072 (_1!1775 (tuple2!3529 key!828 v!309))))))

(declare-fun lt!95074 () List!2422)

(assert (=> d!56151 (= lt!95072 (ListLongMap!2446 lt!95074))))

(declare-fun lt!95075 () Unit!5784)

(declare-fun lt!95073 () Unit!5784)

(assert (=> d!56151 (= lt!95075 lt!95073)))

(assert (=> d!56151 (= (getValueByKey!238 lt!95074 (_1!1775 (tuple2!3529 key!828 v!309))) (Some!243 (_2!1775 (tuple2!3529 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!125 (List!2422 (_ BitVec 64) V!5579) Unit!5784)

(assert (=> d!56151 (= lt!95073 (lemmaContainsTupThenGetReturnValue!125 lt!95074 (_1!1775 (tuple2!3529 key!828 v!309)) (_2!1775 (tuple2!3529 key!828 v!309))))))

(declare-fun insertStrictlySorted!128 (List!2422 (_ BitVec 64) V!5579) List!2422)

(assert (=> d!56151 (= lt!95074 (insertStrictlySorted!128 (toList!1238 lt!94918) (_1!1775 (tuple2!3529 key!828 v!309)) (_2!1775 (tuple2!3529 key!828 v!309))))))

(assert (=> d!56151 (= (+!306 lt!94918 (tuple2!3529 key!828 v!309)) lt!95072)))

(declare-fun b!191473 () Bool)

(declare-fun res!90496 () Bool)

(assert (=> b!191473 (=> (not res!90496) (not e!125994))))

(assert (=> b!191473 (= res!90496 (= (getValueByKey!238 (toList!1238 lt!95072) (_1!1775 (tuple2!3529 key!828 v!309))) (Some!243 (_2!1775 (tuple2!3529 key!828 v!309)))))))

(declare-fun b!191474 () Bool)

(declare-fun contains!1352 (List!2422 tuple2!3528) Bool)

(assert (=> b!191474 (= e!125994 (contains!1352 (toList!1238 lt!95072) (tuple2!3529 key!828 v!309)))))

(assert (= (and d!56151 res!90495) b!191473))

(assert (= (and b!191473 res!90496) b!191474))

(declare-fun m!218073 () Bool)

(assert (=> d!56151 m!218073))

(declare-fun m!218075 () Bool)

(assert (=> d!56151 m!218075))

(declare-fun m!218077 () Bool)

(assert (=> d!56151 m!218077))

(declare-fun m!218079 () Bool)

(assert (=> d!56151 m!218079))

(declare-fun m!218081 () Bool)

(assert (=> b!191473 m!218081))

(declare-fun m!218083 () Bool)

(assert (=> b!191474 m!218083))

(assert (=> b!191270 d!56151))

(declare-fun condMapEmpty!7689 () Bool)

(declare-fun mapDefault!7689 () ValueCell!1881)

(assert (=> mapNonEmpty!7683 (= condMapEmpty!7689 (= mapRest!7683 ((as const (Array (_ BitVec 32) ValueCell!1881)) mapDefault!7689)))))

(declare-fun e!126000 () Bool)

(declare-fun mapRes!7689 () Bool)

(assert (=> mapNonEmpty!7683 (= tp!16878 (and e!126000 mapRes!7689))))

(declare-fun mapNonEmpty!7689 () Bool)

(declare-fun tp!16887 () Bool)

(declare-fun e!125999 () Bool)

(assert (=> mapNonEmpty!7689 (= mapRes!7689 (and tp!16887 e!125999))))

(declare-fun mapRest!7689 () (Array (_ BitVec 32) ValueCell!1881))

(declare-fun mapValue!7689 () ValueCell!1881)

(declare-fun mapKey!7689 () (_ BitVec 32))

(assert (=> mapNonEmpty!7689 (= mapRest!7683 (store mapRest!7689 mapKey!7689 mapValue!7689))))

(declare-fun b!191481 () Bool)

(assert (=> b!191481 (= e!125999 tp_is_empty!4449)))

(declare-fun mapIsEmpty!7689 () Bool)

(assert (=> mapIsEmpty!7689 mapRes!7689))

(declare-fun b!191482 () Bool)

(assert (=> b!191482 (= e!126000 tp_is_empty!4449)))

(assert (= (and mapNonEmpty!7683 condMapEmpty!7689) mapIsEmpty!7689))

(assert (= (and mapNonEmpty!7683 (not condMapEmpty!7689)) mapNonEmpty!7689))

(assert (= (and mapNonEmpty!7689 ((_ is ValueCellFull!1881) mapValue!7689)) b!191481))

(assert (= (and mapNonEmpty!7683 ((_ is ValueCellFull!1881) mapDefault!7689)) b!191482))

(declare-fun m!218085 () Bool)

(assert (=> mapNonEmpty!7689 m!218085))

(declare-fun b_lambda!7395 () Bool)

(assert (= b_lambda!7391 (or (and b!191274 b_free!4677) b_lambda!7395)))

(declare-fun b_lambda!7397 () Bool)

(assert (= b_lambda!7393 (or (and b!191274 b_free!4677) b_lambda!7397)))

(check-sat (not b!191342) (not b!191351) (not b!191366) (not b_lambda!7397) (not b!191350) (not b!191454) (not bm!19296) (not b!191424) (not b_next!4677) (not b!191428) (not d!56145) (not b!191416) (not b!191473) (not b!191450) (not bm!19297) (not bm!19317) (not b!191468) (not b!191415) (not b_lambda!7395) (not d!56149) (not b!191458) (not b!191449) (not bm!19315) (not b!191418) (not b!191442) (not b!191432) (not b!191419) (not bm!19314) tp_is_empty!4449 (not b!191474) (not mapNonEmpty!7689) (not bm!19321) (not b!191438) b_and!11353 (not b!191441) (not b!191445) (not d!56135) (not d!56151) (not b!191423) (not bm!19325) (not d!56133) (not d!56127) (not bm!19322) (not bm!19324) (not d!56141) (not d!56129) (not b!191466) (not b!191444) (not bm!19318) (not b!191352) (not d!56147))
(check-sat b_and!11353 (not b_next!4677))
