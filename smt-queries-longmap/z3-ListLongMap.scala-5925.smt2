; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77156 () Bool)

(assert start!77156)

(declare-fun b!900514 () Bool)

(declare-fun b_free!16053 () Bool)

(declare-fun b_next!16053 () Bool)

(assert (=> b!900514 (= b_free!16053 (not b_next!16053))))

(declare-fun tp!56250 () Bool)

(declare-fun b_and!26375 () Bool)

(assert (=> b!900514 (= tp!56250 b_and!26375)))

(declare-fun b!900506 () Bool)

(declare-fun e!504028 () Bool)

(declare-fun tp_is_empty!18381 () Bool)

(assert (=> b!900506 (= e!504028 tp_is_empty!18381)))

(declare-fun b!900507 () Bool)

(declare-fun res!608120 () Bool)

(declare-fun e!504025 () Bool)

(assert (=> b!900507 (=> res!608120 e!504025)))

(declare-datatypes ((array!52812 0))(
  ( (array!52813 (arr!25377 (Array (_ BitVec 32) (_ BitVec 64))) (size!25836 (_ BitVec 32))) )
))
(declare-datatypes ((V!29473 0))(
  ( (V!29474 (val!9241 Int)) )
))
(declare-datatypes ((ValueCell!8709 0))(
  ( (ValueCellFull!8709 (v!11738 V!29473)) (EmptyCell!8709) )
))
(declare-datatypes ((array!52814 0))(
  ( (array!52815 (arr!25378 (Array (_ BitVec 32) ValueCell!8709)) (size!25837 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4434 0))(
  ( (LongMapFixedSize!4435 (defaultEntry!5451 Int) (mask!26238 (_ BitVec 32)) (extraKeys!5177 (_ BitVec 32)) (zeroValue!5281 V!29473) (minValue!5281 V!29473) (_size!2272 (_ BitVec 32)) (_keys!10255 array!52812) (_values!5468 array!52814) (_vacant!2272 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4434)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52812 (_ BitVec 32)) Bool)

(assert (=> b!900507 (= res!608120 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10255 thiss!1181) (mask!26238 thiss!1181))))))

(declare-fun b!900508 () Bool)

(declare-fun e!504026 () Bool)

(assert (=> b!900508 (= e!504026 tp_is_empty!18381)))

(declare-fun b!900509 () Bool)

(declare-fun e!504027 () Bool)

(declare-fun mapRes!29248 () Bool)

(assert (=> b!900509 (= e!504027 (and e!504026 mapRes!29248))))

(declare-fun condMapEmpty!29248 () Bool)

(declare-fun mapDefault!29248 () ValueCell!8709)

(assert (=> b!900509 (= condMapEmpty!29248 (= (arr!25378 (_values!5468 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8709)) mapDefault!29248)))))

(declare-fun b!900510 () Bool)

(declare-fun e!504030 () Bool)

(declare-fun e!504024 () Bool)

(assert (=> b!900510 (= e!504030 (not e!504024))))

(declare-fun res!608121 () Bool)

(assert (=> b!900510 (=> res!608121 e!504024)))

(declare-datatypes ((SeekEntryResult!8940 0))(
  ( (MissingZero!8940 (index!38131 (_ BitVec 32))) (Found!8940 (index!38132 (_ BitVec 32))) (Intermediate!8940 (undefined!9752 Bool) (index!38133 (_ BitVec 32)) (x!76727 (_ BitVec 32))) (Undefined!8940) (MissingVacant!8940 (index!38134 (_ BitVec 32))) )
))
(declare-fun lt!406895 () SeekEntryResult!8940)

(get-info :version)

(assert (=> b!900510 (= res!608121 (not ((_ is Found!8940) lt!406895)))))

(declare-fun e!504029 () Bool)

(assert (=> b!900510 e!504029))

(declare-fun res!608116 () Bool)

(assert (=> b!900510 (=> res!608116 e!504029)))

(assert (=> b!900510 (= res!608116 (not ((_ is Found!8940) lt!406895)))))

(declare-datatypes ((Unit!30590 0))(
  ( (Unit!30591) )
))
(declare-fun lt!406893 () Unit!30590)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!102 (array!52812 array!52814 (_ BitVec 32) (_ BitVec 32) V!29473 V!29473 (_ BitVec 64)) Unit!30590)

(assert (=> b!900510 (= lt!406893 (lemmaSeekEntryGivesInRangeIndex!102 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52812 (_ BitVec 32)) SeekEntryResult!8940)

(assert (=> b!900510 (= lt!406895 (seekEntry!0 key!785 (_keys!10255 thiss!1181) (mask!26238 thiss!1181)))))

(declare-fun b!900511 () Bool)

(declare-datatypes ((List!17855 0))(
  ( (Nil!17852) (Cons!17851 (h!18997 (_ BitVec 64)) (t!25208 List!17855)) )
))
(declare-fun arrayNoDuplicates!0 (array!52812 (_ BitVec 32) List!17855) Bool)

(assert (=> b!900511 (= e!504025 (arrayNoDuplicates!0 (_keys!10255 thiss!1181) #b00000000000000000000000000000000 Nil!17852))))

(declare-fun mapNonEmpty!29248 () Bool)

(declare-fun tp!56249 () Bool)

(assert (=> mapNonEmpty!29248 (= mapRes!29248 (and tp!56249 e!504028))))

(declare-fun mapRest!29248 () (Array (_ BitVec 32) ValueCell!8709))

(declare-fun mapValue!29248 () ValueCell!8709)

(declare-fun mapKey!29248 () (_ BitVec 32))

(assert (=> mapNonEmpty!29248 (= (arr!25378 (_values!5468 thiss!1181)) (store mapRest!29248 mapKey!29248 mapValue!29248))))

(declare-fun b!900512 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900512 (= e!504029 (inRange!0 (index!38132 lt!406895) (mask!26238 thiss!1181)))))

(declare-fun res!608118 () Bool)

(assert (=> start!77156 (=> (not res!608118) (not e!504030))))

(declare-fun valid!1701 (LongMapFixedSize!4434) Bool)

(assert (=> start!77156 (= res!608118 (valid!1701 thiss!1181))))

(assert (=> start!77156 e!504030))

(declare-fun e!504023 () Bool)

(assert (=> start!77156 e!504023))

(assert (=> start!77156 true))

(declare-fun mapIsEmpty!29248 () Bool)

(assert (=> mapIsEmpty!29248 mapRes!29248))

(declare-fun b!900513 () Bool)

(declare-fun res!608122 () Bool)

(assert (=> b!900513 (=> res!608122 e!504025)))

(assert (=> b!900513 (= res!608122 (or (not (= (size!25837 (_values!5468 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26238 thiss!1181)))) (not (= (size!25836 (_keys!10255 thiss!1181)) (size!25837 (_values!5468 thiss!1181)))) (bvslt (mask!26238 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5177 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5177 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun array_inv!19906 (array!52812) Bool)

(declare-fun array_inv!19907 (array!52814) Bool)

(assert (=> b!900514 (= e!504023 (and tp!56250 tp_is_empty!18381 (array_inv!19906 (_keys!10255 thiss!1181)) (array_inv!19907 (_values!5468 thiss!1181)) e!504027))))

(declare-fun b!900515 () Bool)

(declare-fun res!608119 () Bool)

(assert (=> b!900515 (=> (not res!608119) (not e!504030))))

(assert (=> b!900515 (= res!608119 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900516 () Bool)

(assert (=> b!900516 (= e!504024 e!504025)))

(declare-fun res!608117 () Bool)

(assert (=> b!900516 (=> res!608117 e!504025)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900516 (= res!608117 (not (validMask!0 (mask!26238 thiss!1181))))))

(declare-datatypes ((tuple2!12052 0))(
  ( (tuple2!12053 (_1!6037 (_ BitVec 64)) (_2!6037 V!29473)) )
))
(declare-datatypes ((List!17856 0))(
  ( (Nil!17853) (Cons!17852 (h!18998 tuple2!12052) (t!25209 List!17856)) )
))
(declare-datatypes ((ListLongMap!10749 0))(
  ( (ListLongMap!10750 (toList!5390 List!17856)) )
))
(declare-fun contains!4427 (ListLongMap!10749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2664 (array!52812 array!52814 (_ BitVec 32) (_ BitVec 32) V!29473 V!29473 (_ BitVec 32) Int) ListLongMap!10749)

(assert (=> b!900516 (contains!4427 (getCurrentListMap!2664 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181)) (select (arr!25377 (_keys!10255 thiss!1181)) (index!38132 lt!406895)))))

(declare-fun lt!406896 () Unit!30590)

(declare-fun lemmaValidKeyInArrayIsInListMap!253 (array!52812 array!52814 (_ BitVec 32) (_ BitVec 32) V!29473 V!29473 (_ BitVec 32) Int) Unit!30590)

(assert (=> b!900516 (= lt!406896 (lemmaValidKeyInArrayIsInListMap!253 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) (index!38132 lt!406895) (defaultEntry!5451 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900516 (arrayContainsKey!0 (_keys!10255 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406894 () Unit!30590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52812 (_ BitVec 64) (_ BitVec 32)) Unit!30590)

(assert (=> b!900516 (= lt!406894 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10255 thiss!1181) key!785 (index!38132 lt!406895)))))

(assert (= (and start!77156 res!608118) b!900515))

(assert (= (and b!900515 res!608119) b!900510))

(assert (= (and b!900510 (not res!608116)) b!900512))

(assert (= (and b!900510 (not res!608121)) b!900516))

(assert (= (and b!900516 (not res!608117)) b!900513))

(assert (= (and b!900513 (not res!608122)) b!900507))

(assert (= (and b!900507 (not res!608120)) b!900511))

(assert (= (and b!900509 condMapEmpty!29248) mapIsEmpty!29248))

(assert (= (and b!900509 (not condMapEmpty!29248)) mapNonEmpty!29248))

(assert (= (and mapNonEmpty!29248 ((_ is ValueCellFull!8709) mapValue!29248)) b!900506))

(assert (= (and b!900509 ((_ is ValueCellFull!8709) mapDefault!29248)) b!900508))

(assert (= b!900514 b!900509))

(assert (= start!77156 b!900514))

(declare-fun m!836949 () Bool)

(assert (=> b!900514 m!836949))

(declare-fun m!836951 () Bool)

(assert (=> b!900514 m!836951))

(declare-fun m!836953 () Bool)

(assert (=> b!900511 m!836953))

(declare-fun m!836955 () Bool)

(assert (=> b!900510 m!836955))

(declare-fun m!836957 () Bool)

(assert (=> b!900510 m!836957))

(declare-fun m!836959 () Bool)

(assert (=> start!77156 m!836959))

(declare-fun m!836961 () Bool)

(assert (=> mapNonEmpty!29248 m!836961))

(declare-fun m!836963 () Bool)

(assert (=> b!900507 m!836963))

(declare-fun m!836965 () Bool)

(assert (=> b!900512 m!836965))

(declare-fun m!836967 () Bool)

(assert (=> b!900516 m!836967))

(declare-fun m!836969 () Bool)

(assert (=> b!900516 m!836969))

(declare-fun m!836971 () Bool)

(assert (=> b!900516 m!836971))

(declare-fun m!836973 () Bool)

(assert (=> b!900516 m!836973))

(declare-fun m!836975 () Bool)

(assert (=> b!900516 m!836975))

(declare-fun m!836977 () Bool)

(assert (=> b!900516 m!836977))

(assert (=> b!900516 m!836977))

(assert (=> b!900516 m!836975))

(declare-fun m!836979 () Bool)

(assert (=> b!900516 m!836979))

(check-sat (not b_next!16053) (not b!900512) (not b!900510) b_and!26375 (not mapNonEmpty!29248) (not start!77156) (not b!900511) (not b!900516) tp_is_empty!18381 (not b!900507) (not b!900514))
(check-sat b_and!26375 (not b_next!16053))
(get-model)

(declare-fun d!111733 () Bool)

(declare-fun e!504060 () Bool)

(assert (=> d!111733 e!504060))

(declare-fun res!608146 () Bool)

(assert (=> d!111733 (=> res!608146 e!504060)))

(declare-fun lt!406914 () SeekEntryResult!8940)

(assert (=> d!111733 (= res!608146 (not ((_ is Found!8940) lt!406914)))))

(assert (=> d!111733 (= lt!406914 (seekEntry!0 key!785 (_keys!10255 thiss!1181) (mask!26238 thiss!1181)))))

(declare-fun lt!406913 () Unit!30590)

(declare-fun choose!1514 (array!52812 array!52814 (_ BitVec 32) (_ BitVec 32) V!29473 V!29473 (_ BitVec 64)) Unit!30590)

(assert (=> d!111733 (= lt!406913 (choose!1514 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) key!785))))

(assert (=> d!111733 (validMask!0 (mask!26238 thiss!1181))))

(assert (=> d!111733 (= (lemmaSeekEntryGivesInRangeIndex!102 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) key!785) lt!406913)))

(declare-fun b!900552 () Bool)

(assert (=> b!900552 (= e!504060 (inRange!0 (index!38132 lt!406914) (mask!26238 thiss!1181)))))

(assert (= (and d!111733 (not res!608146)) b!900552))

(assert (=> d!111733 m!836957))

(declare-fun m!837013 () Bool)

(assert (=> d!111733 m!837013))

(assert (=> d!111733 m!836971))

(declare-fun m!837015 () Bool)

(assert (=> b!900552 m!837015))

(assert (=> b!900510 d!111733))

(declare-fun d!111735 () Bool)

(declare-fun lt!406926 () SeekEntryResult!8940)

(assert (=> d!111735 (and (or ((_ is MissingVacant!8940) lt!406926) (not ((_ is Found!8940) lt!406926)) (and (bvsge (index!38132 lt!406926) #b00000000000000000000000000000000) (bvslt (index!38132 lt!406926) (size!25836 (_keys!10255 thiss!1181))))) (not ((_ is MissingVacant!8940) lt!406926)) (or (not ((_ is Found!8940) lt!406926)) (= (select (arr!25377 (_keys!10255 thiss!1181)) (index!38132 lt!406926)) key!785)))))

(declare-fun e!504069 () SeekEntryResult!8940)

(assert (=> d!111735 (= lt!406926 e!504069)))

(declare-fun c!95353 () Bool)

(declare-fun lt!406924 () SeekEntryResult!8940)

(assert (=> d!111735 (= c!95353 (and ((_ is Intermediate!8940) lt!406924) (undefined!9752 lt!406924)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52812 (_ BitVec 32)) SeekEntryResult!8940)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111735 (= lt!406924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26238 thiss!1181)) key!785 (_keys!10255 thiss!1181) (mask!26238 thiss!1181)))))

(assert (=> d!111735 (validMask!0 (mask!26238 thiss!1181))))

(assert (=> d!111735 (= (seekEntry!0 key!785 (_keys!10255 thiss!1181) (mask!26238 thiss!1181)) lt!406926)))

(declare-fun b!900565 () Bool)

(declare-fun e!504068 () SeekEntryResult!8940)

(assert (=> b!900565 (= e!504068 (Found!8940 (index!38133 lt!406924)))))

(declare-fun b!900566 () Bool)

(declare-fun e!504067 () SeekEntryResult!8940)

(assert (=> b!900566 (= e!504067 (MissingZero!8940 (index!38133 lt!406924)))))

(declare-fun b!900567 () Bool)

(declare-fun c!95354 () Bool)

(declare-fun lt!406925 () (_ BitVec 64))

(assert (=> b!900567 (= c!95354 (= lt!406925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900567 (= e!504068 e!504067)))

(declare-fun b!900568 () Bool)

(assert (=> b!900568 (= e!504069 Undefined!8940)))

(declare-fun b!900569 () Bool)

(assert (=> b!900569 (= e!504069 e!504068)))

(assert (=> b!900569 (= lt!406925 (select (arr!25377 (_keys!10255 thiss!1181)) (index!38133 lt!406924)))))

(declare-fun c!95355 () Bool)

(assert (=> b!900569 (= c!95355 (= lt!406925 key!785))))

(declare-fun b!900570 () Bool)

(declare-fun lt!406923 () SeekEntryResult!8940)

(assert (=> b!900570 (= e!504067 (ite ((_ is MissingVacant!8940) lt!406923) (MissingZero!8940 (index!38134 lt!406923)) lt!406923))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52812 (_ BitVec 32)) SeekEntryResult!8940)

(assert (=> b!900570 (= lt!406923 (seekKeyOrZeroReturnVacant!0 (x!76727 lt!406924) (index!38133 lt!406924) (index!38133 lt!406924) key!785 (_keys!10255 thiss!1181) (mask!26238 thiss!1181)))))

(assert (= (and d!111735 c!95353) b!900568))

(assert (= (and d!111735 (not c!95353)) b!900569))

(assert (= (and b!900569 c!95355) b!900565))

(assert (= (and b!900569 (not c!95355)) b!900567))

(assert (= (and b!900567 c!95354) b!900566))

(assert (= (and b!900567 (not c!95354)) b!900570))

(declare-fun m!837017 () Bool)

(assert (=> d!111735 m!837017))

(declare-fun m!837019 () Bool)

(assert (=> d!111735 m!837019))

(assert (=> d!111735 m!837019))

(declare-fun m!837021 () Bool)

(assert (=> d!111735 m!837021))

(assert (=> d!111735 m!836971))

(declare-fun m!837023 () Bool)

(assert (=> b!900569 m!837023))

(declare-fun m!837025 () Bool)

(assert (=> b!900570 m!837025))

(assert (=> b!900510 d!111735))

(declare-fun d!111737 () Bool)

(assert (=> d!111737 (= (array_inv!19906 (_keys!10255 thiss!1181)) (bvsge (size!25836 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900514 d!111737))

(declare-fun d!111739 () Bool)

(assert (=> d!111739 (= (array_inv!19907 (_values!5468 thiss!1181)) (bvsge (size!25837 (_values!5468 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900514 d!111739))

(declare-fun d!111741 () Bool)

(declare-fun res!608153 () Bool)

(declare-fun e!504072 () Bool)

(assert (=> d!111741 (=> (not res!608153) (not e!504072))))

(declare-fun simpleValid!330 (LongMapFixedSize!4434) Bool)

(assert (=> d!111741 (= res!608153 (simpleValid!330 thiss!1181))))

(assert (=> d!111741 (= (valid!1701 thiss!1181) e!504072)))

(declare-fun b!900577 () Bool)

(declare-fun res!608154 () Bool)

(assert (=> b!900577 (=> (not res!608154) (not e!504072))))

(declare-fun arrayCountValidKeys!0 (array!52812 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900577 (= res!608154 (= (arrayCountValidKeys!0 (_keys!10255 thiss!1181) #b00000000000000000000000000000000 (size!25836 (_keys!10255 thiss!1181))) (_size!2272 thiss!1181)))))

(declare-fun b!900578 () Bool)

(declare-fun res!608155 () Bool)

(assert (=> b!900578 (=> (not res!608155) (not e!504072))))

(assert (=> b!900578 (= res!608155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10255 thiss!1181) (mask!26238 thiss!1181)))))

(declare-fun b!900579 () Bool)

(assert (=> b!900579 (= e!504072 (arrayNoDuplicates!0 (_keys!10255 thiss!1181) #b00000000000000000000000000000000 Nil!17852))))

(assert (= (and d!111741 res!608153) b!900577))

(assert (= (and b!900577 res!608154) b!900578))

(assert (= (and b!900578 res!608155) b!900579))

(declare-fun m!837027 () Bool)

(assert (=> d!111741 m!837027))

(declare-fun m!837029 () Bool)

(assert (=> b!900577 m!837029))

(assert (=> b!900578 m!836963))

(assert (=> b!900579 m!836953))

(assert (=> start!77156 d!111741))

(declare-fun d!111743 () Bool)

(assert (=> d!111743 (= (validMask!0 (mask!26238 thiss!1181)) (and (or (= (mask!26238 thiss!1181) #b00000000000000000000000000000111) (= (mask!26238 thiss!1181) #b00000000000000000000000000001111) (= (mask!26238 thiss!1181) #b00000000000000000000000000011111) (= (mask!26238 thiss!1181) #b00000000000000000000000000111111) (= (mask!26238 thiss!1181) #b00000000000000000000000001111111) (= (mask!26238 thiss!1181) #b00000000000000000000000011111111) (= (mask!26238 thiss!1181) #b00000000000000000000000111111111) (= (mask!26238 thiss!1181) #b00000000000000000000001111111111) (= (mask!26238 thiss!1181) #b00000000000000000000011111111111) (= (mask!26238 thiss!1181) #b00000000000000000000111111111111) (= (mask!26238 thiss!1181) #b00000000000000000001111111111111) (= (mask!26238 thiss!1181) #b00000000000000000011111111111111) (= (mask!26238 thiss!1181) #b00000000000000000111111111111111) (= (mask!26238 thiss!1181) #b00000000000000001111111111111111) (= (mask!26238 thiss!1181) #b00000000000000011111111111111111) (= (mask!26238 thiss!1181) #b00000000000000111111111111111111) (= (mask!26238 thiss!1181) #b00000000000001111111111111111111) (= (mask!26238 thiss!1181) #b00000000000011111111111111111111) (= (mask!26238 thiss!1181) #b00000000000111111111111111111111) (= (mask!26238 thiss!1181) #b00000000001111111111111111111111) (= (mask!26238 thiss!1181) #b00000000011111111111111111111111) (= (mask!26238 thiss!1181) #b00000000111111111111111111111111) (= (mask!26238 thiss!1181) #b00000001111111111111111111111111) (= (mask!26238 thiss!1181) #b00000011111111111111111111111111) (= (mask!26238 thiss!1181) #b00000111111111111111111111111111) (= (mask!26238 thiss!1181) #b00001111111111111111111111111111) (= (mask!26238 thiss!1181) #b00011111111111111111111111111111) (= (mask!26238 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26238 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900516 d!111743))

(declare-fun d!111745 () Bool)

(declare-fun res!608160 () Bool)

(declare-fun e!504077 () Bool)

(assert (=> d!111745 (=> res!608160 e!504077)))

(assert (=> d!111745 (= res!608160 (= (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111745 (= (arrayContainsKey!0 (_keys!10255 thiss!1181) key!785 #b00000000000000000000000000000000) e!504077)))

(declare-fun b!900584 () Bool)

(declare-fun e!504078 () Bool)

(assert (=> b!900584 (= e!504077 e!504078)))

(declare-fun res!608161 () Bool)

(assert (=> b!900584 (=> (not res!608161) (not e!504078))))

(assert (=> b!900584 (= res!608161 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25836 (_keys!10255 thiss!1181))))))

(declare-fun b!900585 () Bool)

(assert (=> b!900585 (= e!504078 (arrayContainsKey!0 (_keys!10255 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111745 (not res!608160)) b!900584))

(assert (= (and b!900584 res!608161) b!900585))

(declare-fun m!837031 () Bool)

(assert (=> d!111745 m!837031))

(declare-fun m!837033 () Bool)

(assert (=> b!900585 m!837033))

(assert (=> b!900516 d!111745))

(declare-fun d!111747 () Bool)

(declare-fun e!504081 () Bool)

(assert (=> d!111747 e!504081))

(declare-fun res!608164 () Bool)

(assert (=> d!111747 (=> (not res!608164) (not e!504081))))

(assert (=> d!111747 (= res!608164 (and (bvsge (index!38132 lt!406895) #b00000000000000000000000000000000) (bvslt (index!38132 lt!406895) (size!25836 (_keys!10255 thiss!1181)))))))

(declare-fun lt!406929 () Unit!30590)

(declare-fun choose!1515 (array!52812 array!52814 (_ BitVec 32) (_ BitVec 32) V!29473 V!29473 (_ BitVec 32) Int) Unit!30590)

(assert (=> d!111747 (= lt!406929 (choose!1515 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) (index!38132 lt!406895) (defaultEntry!5451 thiss!1181)))))

(assert (=> d!111747 (validMask!0 (mask!26238 thiss!1181))))

(assert (=> d!111747 (= (lemmaValidKeyInArrayIsInListMap!253 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) (index!38132 lt!406895) (defaultEntry!5451 thiss!1181)) lt!406929)))

(declare-fun b!900588 () Bool)

(assert (=> b!900588 (= e!504081 (contains!4427 (getCurrentListMap!2664 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181)) (select (arr!25377 (_keys!10255 thiss!1181)) (index!38132 lt!406895))))))

(assert (= (and d!111747 res!608164) b!900588))

(declare-fun m!837035 () Bool)

(assert (=> d!111747 m!837035))

(assert (=> d!111747 m!836971))

(assert (=> b!900588 m!836977))

(assert (=> b!900588 m!836975))

(assert (=> b!900588 m!836977))

(assert (=> b!900588 m!836975))

(assert (=> b!900588 m!836979))

(assert (=> b!900516 d!111747))

(declare-fun d!111749 () Bool)

(declare-fun e!504087 () Bool)

(assert (=> d!111749 e!504087))

(declare-fun res!608167 () Bool)

(assert (=> d!111749 (=> res!608167 e!504087)))

(declare-fun lt!406940 () Bool)

(assert (=> d!111749 (= res!608167 (not lt!406940))))

(declare-fun lt!406941 () Bool)

(assert (=> d!111749 (= lt!406940 lt!406941)))

(declare-fun lt!406939 () Unit!30590)

(declare-fun e!504086 () Unit!30590)

(assert (=> d!111749 (= lt!406939 e!504086)))

(declare-fun c!95358 () Bool)

(assert (=> d!111749 (= c!95358 lt!406941)))

(declare-fun containsKey!431 (List!17856 (_ BitVec 64)) Bool)

(assert (=> d!111749 (= lt!406941 (containsKey!431 (toList!5390 (getCurrentListMap!2664 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181))) (select (arr!25377 (_keys!10255 thiss!1181)) (index!38132 lt!406895))))))

(assert (=> d!111749 (= (contains!4427 (getCurrentListMap!2664 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181)) (select (arr!25377 (_keys!10255 thiss!1181)) (index!38132 lt!406895))) lt!406940)))

(declare-fun b!900595 () Bool)

(declare-fun lt!406938 () Unit!30590)

(assert (=> b!900595 (= e!504086 lt!406938)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!327 (List!17856 (_ BitVec 64)) Unit!30590)

(assert (=> b!900595 (= lt!406938 (lemmaContainsKeyImpliesGetValueByKeyDefined!327 (toList!5390 (getCurrentListMap!2664 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181))) (select (arr!25377 (_keys!10255 thiss!1181)) (index!38132 lt!406895))))))

(declare-datatypes ((Option!468 0))(
  ( (Some!467 (v!11740 V!29473)) (None!466) )
))
(declare-fun isDefined!336 (Option!468) Bool)

(declare-fun getValueByKey!462 (List!17856 (_ BitVec 64)) Option!468)

(assert (=> b!900595 (isDefined!336 (getValueByKey!462 (toList!5390 (getCurrentListMap!2664 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181))) (select (arr!25377 (_keys!10255 thiss!1181)) (index!38132 lt!406895))))))

(declare-fun b!900596 () Bool)

(declare-fun Unit!30592 () Unit!30590)

(assert (=> b!900596 (= e!504086 Unit!30592)))

(declare-fun b!900597 () Bool)

(assert (=> b!900597 (= e!504087 (isDefined!336 (getValueByKey!462 (toList!5390 (getCurrentListMap!2664 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181))) (select (arr!25377 (_keys!10255 thiss!1181)) (index!38132 lt!406895)))))))

(assert (= (and d!111749 c!95358) b!900595))

(assert (= (and d!111749 (not c!95358)) b!900596))

(assert (= (and d!111749 (not res!608167)) b!900597))

(assert (=> d!111749 m!836975))

(declare-fun m!837037 () Bool)

(assert (=> d!111749 m!837037))

(assert (=> b!900595 m!836975))

(declare-fun m!837039 () Bool)

(assert (=> b!900595 m!837039))

(assert (=> b!900595 m!836975))

(declare-fun m!837041 () Bool)

(assert (=> b!900595 m!837041))

(assert (=> b!900595 m!837041))

(declare-fun m!837043 () Bool)

(assert (=> b!900595 m!837043))

(assert (=> b!900597 m!836975))

(assert (=> b!900597 m!837041))

(assert (=> b!900597 m!837041))

(assert (=> b!900597 m!837043))

(assert (=> b!900516 d!111749))

(declare-fun b!900640 () Bool)

(declare-fun e!504123 () ListLongMap!10749)

(declare-fun e!504126 () ListLongMap!10749)

(assert (=> b!900640 (= e!504123 e!504126)))

(declare-fun c!95371 () Bool)

(assert (=> b!900640 (= c!95371 (and (not (= (bvand (extraKeys!5177 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5177 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900641 () Bool)

(declare-fun e!504122 () Bool)

(declare-fun call!40048 () Bool)

(assert (=> b!900641 (= e!504122 (not call!40048))))

(declare-fun b!900642 () Bool)

(declare-fun call!40051 () ListLongMap!10749)

(assert (=> b!900642 (= e!504126 call!40051)))

(declare-fun bm!40045 () Bool)

(declare-fun lt!406988 () ListLongMap!10749)

(assert (=> bm!40045 (= call!40048 (contains!4427 lt!406988 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900643 () Bool)

(declare-fun e!504117 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!900643 (= e!504117 (validKeyInArray!0 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40046 () Bool)

(declare-fun call!40050 () ListLongMap!10749)

(declare-fun call!40053 () ListLongMap!10749)

(assert (=> bm!40046 (= call!40050 call!40053)))

(declare-fun b!900644 () Bool)

(declare-fun e!504116 () Bool)

(declare-fun apply!416 (ListLongMap!10749 (_ BitVec 64)) V!29473)

(declare-fun get!13352 (ValueCell!8709 V!29473) V!29473)

(declare-fun dynLambda!1310 (Int (_ BitVec 64)) V!29473)

(assert (=> b!900644 (= e!504116 (= (apply!416 lt!406988 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000)) (get!13352 (select (arr!25378 (_values!5468 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1310 (defaultEntry!5451 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900644 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25837 (_values!5468 thiss!1181))))))

(assert (=> b!900644 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25836 (_keys!10255 thiss!1181))))))

(declare-fun b!900645 () Bool)

(declare-fun e!504120 () Bool)

(assert (=> b!900645 (= e!504120 e!504116)))

(declare-fun res!608186 () Bool)

(assert (=> b!900645 (=> (not res!608186) (not e!504116))))

(assert (=> b!900645 (= res!608186 (contains!4427 lt!406988 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900645 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25836 (_keys!10255 thiss!1181))))))

(declare-fun b!900646 () Bool)

(declare-fun res!608194 () Bool)

(declare-fun e!504124 () Bool)

(assert (=> b!900646 (=> (not res!608194) (not e!504124))))

(declare-fun e!504118 () Bool)

(assert (=> b!900646 (= res!608194 e!504118)))

(declare-fun c!95374 () Bool)

(assert (=> b!900646 (= c!95374 (not (= (bvand (extraKeys!5177 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!111751 () Bool)

(assert (=> d!111751 e!504124))

(declare-fun res!608189 () Bool)

(assert (=> d!111751 (=> (not res!608189) (not e!504124))))

(assert (=> d!111751 (= res!608189 (or (bvsge #b00000000000000000000000000000000 (size!25836 (_keys!10255 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25836 (_keys!10255 thiss!1181))))))))

(declare-fun lt!407003 () ListLongMap!10749)

(assert (=> d!111751 (= lt!406988 lt!407003)))

(declare-fun lt!406991 () Unit!30590)

(declare-fun e!504115 () Unit!30590)

(assert (=> d!111751 (= lt!406991 e!504115)))

(declare-fun c!95375 () Bool)

(declare-fun e!504121 () Bool)

(assert (=> d!111751 (= c!95375 e!504121)))

(declare-fun res!608187 () Bool)

(assert (=> d!111751 (=> (not res!608187) (not e!504121))))

(assert (=> d!111751 (= res!608187 (bvslt #b00000000000000000000000000000000 (size!25836 (_keys!10255 thiss!1181))))))

(assert (=> d!111751 (= lt!407003 e!504123)))

(declare-fun c!95372 () Bool)

(assert (=> d!111751 (= c!95372 (and (not (= (bvand (extraKeys!5177 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5177 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111751 (validMask!0 (mask!26238 thiss!1181))))

(assert (=> d!111751 (= (getCurrentListMap!2664 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181)) lt!406988)))

(declare-fun b!900647 () Bool)

(declare-fun e!504125 () ListLongMap!10749)

(assert (=> b!900647 (= e!504125 call!40050)))

(declare-fun b!900648 () Bool)

(assert (=> b!900648 (= e!504124 e!504122)))

(declare-fun c!95373 () Bool)

(assert (=> b!900648 (= c!95373 (not (= (bvand (extraKeys!5177 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900649 () Bool)

(declare-fun call!40052 () ListLongMap!10749)

(declare-fun +!2597 (ListLongMap!10749 tuple2!12052) ListLongMap!10749)

(assert (=> b!900649 (= e!504123 (+!2597 call!40052 (tuple2!12053 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5281 thiss!1181))))))

(declare-fun b!900650 () Bool)

(declare-fun e!504114 () Bool)

(assert (=> b!900650 (= e!504114 (= (apply!416 lt!406988 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5281 thiss!1181)))))

(declare-fun bm!40047 () Bool)

(assert (=> bm!40047 (= call!40051 call!40052)))

(declare-fun bm!40048 () Bool)

(declare-fun call!40049 () ListLongMap!10749)

(assert (=> bm!40048 (= call!40053 call!40049)))

(declare-fun b!900651 () Bool)

(declare-fun e!504119 () Bool)

(assert (=> b!900651 (= e!504122 e!504119)))

(declare-fun res!608192 () Bool)

(assert (=> b!900651 (= res!608192 call!40048)))

(assert (=> b!900651 (=> (not res!608192) (not e!504119))))

(declare-fun bm!40049 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3284 (array!52812 array!52814 (_ BitVec 32) (_ BitVec 32) V!29473 V!29473 (_ BitVec 32) Int) ListLongMap!10749)

(assert (=> bm!40049 (= call!40049 (getCurrentListMapNoExtraKeys!3284 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181)))))

(declare-fun b!900652 () Bool)

(assert (=> b!900652 (= e!504119 (= (apply!416 lt!406988 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5281 thiss!1181)))))

(declare-fun b!900653 () Bool)

(assert (=> b!900653 (= e!504118 e!504114)))

(declare-fun res!608191 () Bool)

(declare-fun call!40054 () Bool)

(assert (=> b!900653 (= res!608191 call!40054)))

(assert (=> b!900653 (=> (not res!608191) (not e!504114))))

(declare-fun b!900654 () Bool)

(assert (=> b!900654 (= e!504121 (validKeyInArray!0 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900655 () Bool)

(assert (=> b!900655 (= e!504118 (not call!40054))))

(declare-fun bm!40050 () Bool)

(assert (=> bm!40050 (= call!40052 (+!2597 (ite c!95372 call!40049 (ite c!95371 call!40053 call!40050)) (ite (or c!95372 c!95371) (tuple2!12053 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5281 thiss!1181)) (tuple2!12053 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5281 thiss!1181)))))))

(declare-fun b!900656 () Bool)

(declare-fun Unit!30593 () Unit!30590)

(assert (=> b!900656 (= e!504115 Unit!30593)))

(declare-fun b!900657 () Bool)

(declare-fun res!608188 () Bool)

(assert (=> b!900657 (=> (not res!608188) (not e!504124))))

(assert (=> b!900657 (= res!608188 e!504120)))

(declare-fun res!608193 () Bool)

(assert (=> b!900657 (=> res!608193 e!504120)))

(assert (=> b!900657 (= res!608193 (not e!504117))))

(declare-fun res!608190 () Bool)

(assert (=> b!900657 (=> (not res!608190) (not e!504117))))

(assert (=> b!900657 (= res!608190 (bvslt #b00000000000000000000000000000000 (size!25836 (_keys!10255 thiss!1181))))))

(declare-fun b!900658 () Bool)

(assert (=> b!900658 (= e!504125 call!40051)))

(declare-fun b!900659 () Bool)

(declare-fun lt!407007 () Unit!30590)

(assert (=> b!900659 (= e!504115 lt!407007)))

(declare-fun lt!406986 () ListLongMap!10749)

(assert (=> b!900659 (= lt!406986 (getCurrentListMapNoExtraKeys!3284 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181)))))

(declare-fun lt!406999 () (_ BitVec 64))

(assert (=> b!900659 (= lt!406999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406995 () (_ BitVec 64))

(assert (=> b!900659 (= lt!406995 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407002 () Unit!30590)

(declare-fun addStillContains!338 (ListLongMap!10749 (_ BitVec 64) V!29473 (_ BitVec 64)) Unit!30590)

(assert (=> b!900659 (= lt!407002 (addStillContains!338 lt!406986 lt!406999 (zeroValue!5281 thiss!1181) lt!406995))))

(assert (=> b!900659 (contains!4427 (+!2597 lt!406986 (tuple2!12053 lt!406999 (zeroValue!5281 thiss!1181))) lt!406995)))

(declare-fun lt!406993 () Unit!30590)

(assert (=> b!900659 (= lt!406993 lt!407002)))

(declare-fun lt!407001 () ListLongMap!10749)

(assert (=> b!900659 (= lt!407001 (getCurrentListMapNoExtraKeys!3284 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181)))))

(declare-fun lt!406990 () (_ BitVec 64))

(assert (=> b!900659 (= lt!406990 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407006 () (_ BitVec 64))

(assert (=> b!900659 (= lt!407006 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406992 () Unit!30590)

(declare-fun addApplyDifferent!338 (ListLongMap!10749 (_ BitVec 64) V!29473 (_ BitVec 64)) Unit!30590)

(assert (=> b!900659 (= lt!406992 (addApplyDifferent!338 lt!407001 lt!406990 (minValue!5281 thiss!1181) lt!407006))))

(assert (=> b!900659 (= (apply!416 (+!2597 lt!407001 (tuple2!12053 lt!406990 (minValue!5281 thiss!1181))) lt!407006) (apply!416 lt!407001 lt!407006))))

(declare-fun lt!406987 () Unit!30590)

(assert (=> b!900659 (= lt!406987 lt!406992)))

(declare-fun lt!406996 () ListLongMap!10749)

(assert (=> b!900659 (= lt!406996 (getCurrentListMapNoExtraKeys!3284 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181)))))

(declare-fun lt!407004 () (_ BitVec 64))

(assert (=> b!900659 (= lt!407004 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406998 () (_ BitVec 64))

(assert (=> b!900659 (= lt!406998 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407005 () Unit!30590)

(assert (=> b!900659 (= lt!407005 (addApplyDifferent!338 lt!406996 lt!407004 (zeroValue!5281 thiss!1181) lt!406998))))

(assert (=> b!900659 (= (apply!416 (+!2597 lt!406996 (tuple2!12053 lt!407004 (zeroValue!5281 thiss!1181))) lt!406998) (apply!416 lt!406996 lt!406998))))

(declare-fun lt!406997 () Unit!30590)

(assert (=> b!900659 (= lt!406997 lt!407005)))

(declare-fun lt!406989 () ListLongMap!10749)

(assert (=> b!900659 (= lt!406989 (getCurrentListMapNoExtraKeys!3284 (_keys!10255 thiss!1181) (_values!5468 thiss!1181) (mask!26238 thiss!1181) (extraKeys!5177 thiss!1181) (zeroValue!5281 thiss!1181) (minValue!5281 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5451 thiss!1181)))))

(declare-fun lt!407000 () (_ BitVec 64))

(assert (=> b!900659 (= lt!407000 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406994 () (_ BitVec 64))

(assert (=> b!900659 (= lt!406994 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900659 (= lt!407007 (addApplyDifferent!338 lt!406989 lt!407000 (minValue!5281 thiss!1181) lt!406994))))

(assert (=> b!900659 (= (apply!416 (+!2597 lt!406989 (tuple2!12053 lt!407000 (minValue!5281 thiss!1181))) lt!406994) (apply!416 lt!406989 lt!406994))))

(declare-fun b!900660 () Bool)

(declare-fun c!95376 () Bool)

(assert (=> b!900660 (= c!95376 (and (not (= (bvand (extraKeys!5177 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5177 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!900660 (= e!504126 e!504125)))

(declare-fun bm!40051 () Bool)

(assert (=> bm!40051 (= call!40054 (contains!4427 lt!406988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111751 c!95372) b!900649))

(assert (= (and d!111751 (not c!95372)) b!900640))

(assert (= (and b!900640 c!95371) b!900642))

(assert (= (and b!900640 (not c!95371)) b!900660))

(assert (= (and b!900660 c!95376) b!900658))

(assert (= (and b!900660 (not c!95376)) b!900647))

(assert (= (or b!900658 b!900647) bm!40046))

(assert (= (or b!900642 bm!40046) bm!40048))

(assert (= (or b!900642 b!900658) bm!40047))

(assert (= (or b!900649 bm!40048) bm!40049))

(assert (= (or b!900649 bm!40047) bm!40050))

(assert (= (and d!111751 res!608187) b!900654))

(assert (= (and d!111751 c!95375) b!900659))

(assert (= (and d!111751 (not c!95375)) b!900656))

(assert (= (and d!111751 res!608189) b!900657))

(assert (= (and b!900657 res!608190) b!900643))

(assert (= (and b!900657 (not res!608193)) b!900645))

(assert (= (and b!900645 res!608186) b!900644))

(assert (= (and b!900657 res!608188) b!900646))

(assert (= (and b!900646 c!95374) b!900653))

(assert (= (and b!900646 (not c!95374)) b!900655))

(assert (= (and b!900653 res!608191) b!900650))

(assert (= (or b!900653 b!900655) bm!40051))

(assert (= (and b!900646 res!608194) b!900648))

(assert (= (and b!900648 c!95373) b!900651))

(assert (= (and b!900648 (not c!95373)) b!900641))

(assert (= (and b!900651 res!608192) b!900652))

(assert (= (or b!900651 b!900641) bm!40045))

(declare-fun b_lambda!13019 () Bool)

(assert (=> (not b_lambda!13019) (not b!900644)))

(declare-fun t!25212 () Bool)

(declare-fun tb!5205 () Bool)

(assert (=> (and b!900514 (= (defaultEntry!5451 thiss!1181) (defaultEntry!5451 thiss!1181)) t!25212) tb!5205))

(declare-fun result!10187 () Bool)

(assert (=> tb!5205 (= result!10187 tp_is_empty!18381)))

(assert (=> b!900644 t!25212))

(declare-fun b_and!26379 () Bool)

(assert (= b_and!26375 (and (=> t!25212 result!10187) b_and!26379)))

(assert (=> b!900643 m!837031))

(assert (=> b!900643 m!837031))

(declare-fun m!837045 () Bool)

(assert (=> b!900643 m!837045))

(assert (=> d!111751 m!836971))

(declare-fun m!837047 () Bool)

(assert (=> b!900644 m!837047))

(declare-fun m!837049 () Bool)

(assert (=> b!900644 m!837049))

(assert (=> b!900644 m!837047))

(assert (=> b!900644 m!837049))

(declare-fun m!837051 () Bool)

(assert (=> b!900644 m!837051))

(assert (=> b!900644 m!837031))

(declare-fun m!837053 () Bool)

(assert (=> b!900644 m!837053))

(assert (=> b!900644 m!837031))

(declare-fun m!837055 () Bool)

(assert (=> b!900659 m!837055))

(declare-fun m!837057 () Bool)

(assert (=> b!900659 m!837057))

(declare-fun m!837059 () Bool)

(assert (=> b!900659 m!837059))

(declare-fun m!837061 () Bool)

(assert (=> b!900659 m!837061))

(declare-fun m!837063 () Bool)

(assert (=> b!900659 m!837063))

(declare-fun m!837065 () Bool)

(assert (=> b!900659 m!837065))

(assert (=> b!900659 m!837057))

(declare-fun m!837067 () Bool)

(assert (=> b!900659 m!837067))

(declare-fun m!837069 () Bool)

(assert (=> b!900659 m!837069))

(declare-fun m!837071 () Bool)

(assert (=> b!900659 m!837071))

(declare-fun m!837073 () Bool)

(assert (=> b!900659 m!837073))

(assert (=> b!900659 m!837063))

(declare-fun m!837075 () Bool)

(assert (=> b!900659 m!837075))

(assert (=> b!900659 m!837067))

(declare-fun m!837077 () Bool)

(assert (=> b!900659 m!837077))

(declare-fun m!837079 () Bool)

(assert (=> b!900659 m!837079))

(declare-fun m!837081 () Bool)

(assert (=> b!900659 m!837081))

(declare-fun m!837083 () Bool)

(assert (=> b!900659 m!837083))

(assert (=> b!900659 m!837071))

(declare-fun m!837085 () Bool)

(assert (=> b!900659 m!837085))

(assert (=> b!900659 m!837031))

(declare-fun m!837087 () Bool)

(assert (=> bm!40050 m!837087))

(assert (=> b!900654 m!837031))

(assert (=> b!900654 m!837031))

(assert (=> b!900654 m!837045))

(assert (=> b!900645 m!837031))

(assert (=> b!900645 m!837031))

(declare-fun m!837089 () Bool)

(assert (=> b!900645 m!837089))

(declare-fun m!837091 () Bool)

(assert (=> b!900652 m!837091))

(declare-fun m!837093 () Bool)

(assert (=> bm!40051 m!837093))

(declare-fun m!837095 () Bool)

(assert (=> b!900649 m!837095))

(assert (=> bm!40049 m!837077))

(declare-fun m!837097 () Bool)

(assert (=> bm!40045 m!837097))

(declare-fun m!837099 () Bool)

(assert (=> b!900650 m!837099))

(assert (=> b!900516 d!111751))

(declare-fun d!111753 () Bool)

(assert (=> d!111753 (arrayContainsKey!0 (_keys!10255 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407010 () Unit!30590)

(declare-fun choose!13 (array!52812 (_ BitVec 64) (_ BitVec 32)) Unit!30590)

(assert (=> d!111753 (= lt!407010 (choose!13 (_keys!10255 thiss!1181) key!785 (index!38132 lt!406895)))))

(assert (=> d!111753 (bvsge (index!38132 lt!406895) #b00000000000000000000000000000000)))

(assert (=> d!111753 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10255 thiss!1181) key!785 (index!38132 lt!406895)) lt!407010)))

(declare-fun bs!25290 () Bool)

(assert (= bs!25290 d!111753))

(assert (=> bs!25290 m!836969))

(declare-fun m!837101 () Bool)

(assert (=> bs!25290 m!837101))

(assert (=> b!900516 d!111753))

(declare-fun b!900671 () Bool)

(declare-fun e!504134 () Bool)

(declare-fun e!504133 () Bool)

(assert (=> b!900671 (= e!504134 e!504133)))

(declare-fun lt!407017 () (_ BitVec 64))

(assert (=> b!900671 (= lt!407017 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407018 () Unit!30590)

(assert (=> b!900671 (= lt!407018 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10255 thiss!1181) lt!407017 #b00000000000000000000000000000000))))

(assert (=> b!900671 (arrayContainsKey!0 (_keys!10255 thiss!1181) lt!407017 #b00000000000000000000000000000000)))

(declare-fun lt!407019 () Unit!30590)

(assert (=> b!900671 (= lt!407019 lt!407018)))

(declare-fun res!608199 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52812 (_ BitVec 32)) SeekEntryResult!8940)

(assert (=> b!900671 (= res!608199 (= (seekEntryOrOpen!0 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000) (_keys!10255 thiss!1181) (mask!26238 thiss!1181)) (Found!8940 #b00000000000000000000000000000000)))))

(assert (=> b!900671 (=> (not res!608199) (not e!504133))))

(declare-fun d!111755 () Bool)

(declare-fun res!608200 () Bool)

(declare-fun e!504135 () Bool)

(assert (=> d!111755 (=> res!608200 e!504135)))

(assert (=> d!111755 (= res!608200 (bvsge #b00000000000000000000000000000000 (size!25836 (_keys!10255 thiss!1181))))))

(assert (=> d!111755 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10255 thiss!1181) (mask!26238 thiss!1181)) e!504135)))

(declare-fun bm!40054 () Bool)

(declare-fun call!40057 () Bool)

(assert (=> bm!40054 (= call!40057 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10255 thiss!1181) (mask!26238 thiss!1181)))))

(declare-fun b!900672 () Bool)

(assert (=> b!900672 (= e!504135 e!504134)))

(declare-fun c!95379 () Bool)

(assert (=> b!900672 (= c!95379 (validKeyInArray!0 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900673 () Bool)

(assert (=> b!900673 (= e!504134 call!40057)))

(declare-fun b!900674 () Bool)

(assert (=> b!900674 (= e!504133 call!40057)))

(assert (= (and d!111755 (not res!608200)) b!900672))

(assert (= (and b!900672 c!95379) b!900671))

(assert (= (and b!900672 (not c!95379)) b!900673))

(assert (= (and b!900671 res!608199) b!900674))

(assert (= (or b!900674 b!900673) bm!40054))

(assert (=> b!900671 m!837031))

(declare-fun m!837103 () Bool)

(assert (=> b!900671 m!837103))

(declare-fun m!837105 () Bool)

(assert (=> b!900671 m!837105))

(assert (=> b!900671 m!837031))

(declare-fun m!837107 () Bool)

(assert (=> b!900671 m!837107))

(declare-fun m!837109 () Bool)

(assert (=> bm!40054 m!837109))

(assert (=> b!900672 m!837031))

(assert (=> b!900672 m!837031))

(assert (=> b!900672 m!837045))

(assert (=> b!900507 d!111755))

(declare-fun d!111757 () Bool)

(assert (=> d!111757 (= (inRange!0 (index!38132 lt!406895) (mask!26238 thiss!1181)) (and (bvsge (index!38132 lt!406895) #b00000000000000000000000000000000) (bvslt (index!38132 lt!406895) (bvadd (mask!26238 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900512 d!111757))

(declare-fun d!111759 () Bool)

(declare-fun res!608208 () Bool)

(declare-fun e!504147 () Bool)

(assert (=> d!111759 (=> res!608208 e!504147)))

(assert (=> d!111759 (= res!608208 (bvsge #b00000000000000000000000000000000 (size!25836 (_keys!10255 thiss!1181))))))

(assert (=> d!111759 (= (arrayNoDuplicates!0 (_keys!10255 thiss!1181) #b00000000000000000000000000000000 Nil!17852) e!504147)))

(declare-fun b!900685 () Bool)

(declare-fun e!504145 () Bool)

(declare-fun contains!4428 (List!17855 (_ BitVec 64)) Bool)

(assert (=> b!900685 (= e!504145 (contains!4428 Nil!17852 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900686 () Bool)

(declare-fun e!504144 () Bool)

(declare-fun call!40060 () Bool)

(assert (=> b!900686 (= e!504144 call!40060)))

(declare-fun b!900687 () Bool)

(declare-fun e!504146 () Bool)

(assert (=> b!900687 (= e!504146 e!504144)))

(declare-fun c!95382 () Bool)

(assert (=> b!900687 (= c!95382 (validKeyInArray!0 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900688 () Bool)

(assert (=> b!900688 (= e!504144 call!40060)))

(declare-fun bm!40057 () Bool)

(assert (=> bm!40057 (= call!40060 (arrayNoDuplicates!0 (_keys!10255 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95382 (Cons!17851 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000) Nil!17852) Nil!17852)))))

(declare-fun b!900689 () Bool)

(assert (=> b!900689 (= e!504147 e!504146)))

(declare-fun res!608209 () Bool)

(assert (=> b!900689 (=> (not res!608209) (not e!504146))))

(assert (=> b!900689 (= res!608209 (not e!504145))))

(declare-fun res!608207 () Bool)

(assert (=> b!900689 (=> (not res!608207) (not e!504145))))

(assert (=> b!900689 (= res!608207 (validKeyInArray!0 (select (arr!25377 (_keys!10255 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111759 (not res!608208)) b!900689))

(assert (= (and b!900689 res!608207) b!900685))

(assert (= (and b!900689 res!608209) b!900687))

(assert (= (and b!900687 c!95382) b!900688))

(assert (= (and b!900687 (not c!95382)) b!900686))

(assert (= (or b!900688 b!900686) bm!40057))

(assert (=> b!900685 m!837031))

(assert (=> b!900685 m!837031))

(declare-fun m!837111 () Bool)

(assert (=> b!900685 m!837111))

(assert (=> b!900687 m!837031))

(assert (=> b!900687 m!837031))

(assert (=> b!900687 m!837045))

(assert (=> bm!40057 m!837031))

(declare-fun m!837113 () Bool)

(assert (=> bm!40057 m!837113))

(assert (=> b!900689 m!837031))

(assert (=> b!900689 m!837031))

(assert (=> b!900689 m!837045))

(assert (=> b!900511 d!111759))

(declare-fun mapNonEmpty!29254 () Bool)

(declare-fun mapRes!29254 () Bool)

(declare-fun tp!56259 () Bool)

(declare-fun e!504152 () Bool)

(assert (=> mapNonEmpty!29254 (= mapRes!29254 (and tp!56259 e!504152))))

(declare-fun mapRest!29254 () (Array (_ BitVec 32) ValueCell!8709))

(declare-fun mapKey!29254 () (_ BitVec 32))

(declare-fun mapValue!29254 () ValueCell!8709)

(assert (=> mapNonEmpty!29254 (= mapRest!29248 (store mapRest!29254 mapKey!29254 mapValue!29254))))

(declare-fun mapIsEmpty!29254 () Bool)

(assert (=> mapIsEmpty!29254 mapRes!29254))

(declare-fun b!900697 () Bool)

(declare-fun e!504153 () Bool)

(assert (=> b!900697 (= e!504153 tp_is_empty!18381)))

(declare-fun condMapEmpty!29254 () Bool)

(declare-fun mapDefault!29254 () ValueCell!8709)

(assert (=> mapNonEmpty!29248 (= condMapEmpty!29254 (= mapRest!29248 ((as const (Array (_ BitVec 32) ValueCell!8709)) mapDefault!29254)))))

(assert (=> mapNonEmpty!29248 (= tp!56249 (and e!504153 mapRes!29254))))

(declare-fun b!900696 () Bool)

(assert (=> b!900696 (= e!504152 tp_is_empty!18381)))

(assert (= (and mapNonEmpty!29248 condMapEmpty!29254) mapIsEmpty!29254))

(assert (= (and mapNonEmpty!29248 (not condMapEmpty!29254)) mapNonEmpty!29254))

(assert (= (and mapNonEmpty!29254 ((_ is ValueCellFull!8709) mapValue!29254)) b!900696))

(assert (= (and mapNonEmpty!29248 ((_ is ValueCellFull!8709) mapDefault!29254)) b!900697))

(declare-fun m!837115 () Bool)

(assert (=> mapNonEmpty!29254 m!837115))

(declare-fun b_lambda!13021 () Bool)

(assert (= b_lambda!13019 (or (and b!900514 b_free!16053) b_lambda!13021)))

(check-sat (not d!111749) b_and!26379 (not b_next!16053) (not b!900597) (not mapNonEmpty!29254) (not b!900588) (not bm!40049) (not b!900685) (not b!900671) (not d!111751) (not b!900585) (not b!900687) (not b!900570) (not bm!40054) (not b!900643) (not d!111741) (not b!900672) (not bm!40050) (not d!111753) (not b!900595) (not bm!40045) (not b!900577) (not bm!40051) (not b!900552) (not d!111747) (not b!900689) (not b!900644) (not d!111735) (not b!900579) (not b!900645) tp_is_empty!18381 (not b!900650) (not b!900649) (not b!900578) (not b!900654) (not b_lambda!13021) (not d!111733) (not b!900652) (not b!900659) (not bm!40057))
(check-sat b_and!26379 (not b_next!16053))
