; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76614 () Bool)

(assert start!76614)

(declare-fun b!897306 () Bool)

(declare-fun b_free!15949 () Bool)

(declare-fun b_next!15949 () Bool)

(assert (=> b!897306 (= b_free!15949 (not b_next!15949))))

(declare-fun tp!55880 () Bool)

(declare-fun b_and!26251 () Bool)

(assert (=> b!897306 (= tp!55880 b_and!26251)))

(declare-fun b!897304 () Bool)

(declare-fun res!606474 () Bool)

(declare-fun e!501613 () Bool)

(assert (=> b!897304 (=> (not res!606474) (not e!501613))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897304 (= res!606474 (not (= key!785 (bvneg key!785))))))

(declare-fun res!606475 () Bool)

(assert (=> start!76614 (=> (not res!606475) (not e!501613))))

(declare-datatypes ((array!52609 0))(
  ( (array!52610 (arr!25288 (Array (_ BitVec 32) (_ BitVec 64))) (size!25740 (_ BitVec 32))) )
))
(declare-datatypes ((V!29335 0))(
  ( (V!29336 (val!9189 Int)) )
))
(declare-datatypes ((ValueCell!8657 0))(
  ( (ValueCellFull!8657 (v!11676 V!29335)) (EmptyCell!8657) )
))
(declare-datatypes ((array!52611 0))(
  ( (array!52612 (arr!25289 (Array (_ BitVec 32) ValueCell!8657)) (size!25741 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4330 0))(
  ( (LongMapFixedSize!4331 (defaultEntry!5377 Int) (mask!26060 (_ BitVec 32)) (extraKeys!5078 (_ BitVec 32)) (zeroValue!5182 V!29335) (minValue!5182 V!29335) (_size!2220 (_ BitVec 32)) (_keys!10138 array!52609) (_values!5369 array!52611) (_vacant!2220 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4330)

(declare-fun valid!1681 (LongMapFixedSize!4330) Bool)

(assert (=> start!76614 (= res!606475 (valid!1681 thiss!1181))))

(assert (=> start!76614 e!501613))

(declare-fun e!501618 () Bool)

(assert (=> start!76614 e!501618))

(assert (=> start!76614 true))

(declare-fun mapIsEmpty!29033 () Bool)

(declare-fun mapRes!29033 () Bool)

(assert (=> mapIsEmpty!29033 mapRes!29033))

(declare-fun mapNonEmpty!29033 () Bool)

(declare-fun tp!55879 () Bool)

(declare-fun e!501617 () Bool)

(assert (=> mapNonEmpty!29033 (= mapRes!29033 (and tp!55879 e!501617))))

(declare-fun mapKey!29033 () (_ BitVec 32))

(declare-fun mapRest!29033 () (Array (_ BitVec 32) ValueCell!8657))

(declare-fun mapValue!29033 () ValueCell!8657)

(assert (=> mapNonEmpty!29033 (= (arr!25289 (_values!5369 thiss!1181)) (store mapRest!29033 mapKey!29033 mapValue!29033))))

(declare-fun b!897305 () Bool)

(declare-fun tp_is_empty!18277 () Bool)

(assert (=> b!897305 (= e!501617 tp_is_empty!18277)))

(declare-fun e!501619 () Bool)

(declare-fun array_inv!19898 (array!52609) Bool)

(declare-fun array_inv!19899 (array!52611) Bool)

(assert (=> b!897306 (= e!501618 (and tp!55880 tp_is_empty!18277 (array_inv!19898 (_keys!10138 thiss!1181)) (array_inv!19899 (_values!5369 thiss!1181)) e!501619))))

(declare-fun b!897307 () Bool)

(declare-fun e!501616 () Bool)

(declare-datatypes ((SeekEntryResult!8848 0))(
  ( (MissingZero!8848 (index!37763 (_ BitVec 32))) (Found!8848 (index!37764 (_ BitVec 32))) (Intermediate!8848 (undefined!9660 Bool) (index!37765 (_ BitVec 32)) (x!76295 (_ BitVec 32))) (Undefined!8848) (MissingVacant!8848 (index!37766 (_ BitVec 32))) )
))
(declare-fun lt!405167 () SeekEntryResult!8848)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897307 (= e!501616 (inRange!0 (index!37764 lt!405167) (mask!26060 thiss!1181)))))

(declare-fun b!897308 () Bool)

(declare-fun e!501612 () Bool)

(assert (=> b!897308 (= e!501619 (and e!501612 mapRes!29033))))

(declare-fun condMapEmpty!29033 () Bool)

(declare-fun mapDefault!29033 () ValueCell!8657)

(assert (=> b!897308 (= condMapEmpty!29033 (= (arr!25289 (_values!5369 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8657)) mapDefault!29033)))))

(declare-fun b!897309 () Bool)

(assert (=> b!897309 (= e!501612 tp_is_empty!18277)))

(declare-fun b!897310 () Bool)

(declare-fun e!501614 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897310 (= e!501614 (validMask!0 (mask!26060 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897310 (arrayContainsKey!0 (_keys!10138 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30470 0))(
  ( (Unit!30471) )
))
(declare-fun lt!405165 () Unit!30470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52609 (_ BitVec 64) (_ BitVec 32)) Unit!30470)

(assert (=> b!897310 (= lt!405165 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10138 thiss!1181) key!785 (index!37764 lt!405167)))))

(declare-fun b!897311 () Bool)

(assert (=> b!897311 (= e!501613 (not e!501614))))

(declare-fun res!606473 () Bool)

(assert (=> b!897311 (=> res!606473 e!501614)))

(get-info :version)

(assert (=> b!897311 (= res!606473 (not ((_ is Found!8848) lt!405167)))))

(assert (=> b!897311 e!501616))

(declare-fun res!606476 () Bool)

(assert (=> b!897311 (=> res!606476 e!501616)))

(assert (=> b!897311 (= res!606476 (not ((_ is Found!8848) lt!405167)))))

(declare-fun lt!405166 () Unit!30470)

(declare-fun lemmaSeekEntryGivesInRangeIndex!76 (array!52609 array!52611 (_ BitVec 32) (_ BitVec 32) V!29335 V!29335 (_ BitVec 64)) Unit!30470)

(assert (=> b!897311 (= lt!405166 (lemmaSeekEntryGivesInRangeIndex!76 (_keys!10138 thiss!1181) (_values!5369 thiss!1181) (mask!26060 thiss!1181) (extraKeys!5078 thiss!1181) (zeroValue!5182 thiss!1181) (minValue!5182 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52609 (_ BitVec 32)) SeekEntryResult!8848)

(assert (=> b!897311 (= lt!405167 (seekEntry!0 key!785 (_keys!10138 thiss!1181) (mask!26060 thiss!1181)))))

(assert (= (and start!76614 res!606475) b!897304))

(assert (= (and b!897304 res!606474) b!897311))

(assert (= (and b!897311 (not res!606476)) b!897307))

(assert (= (and b!897311 (not res!606473)) b!897310))

(assert (= (and b!897308 condMapEmpty!29033) mapIsEmpty!29033))

(assert (= (and b!897308 (not condMapEmpty!29033)) mapNonEmpty!29033))

(assert (= (and mapNonEmpty!29033 ((_ is ValueCellFull!8657) mapValue!29033)) b!897305))

(assert (= (and b!897308 ((_ is ValueCellFull!8657) mapDefault!29033)) b!897309))

(assert (= b!897306 b!897308))

(assert (= start!76614 b!897306))

(declare-fun m!834883 () Bool)

(assert (=> b!897306 m!834883))

(declare-fun m!834885 () Bool)

(assert (=> b!897306 m!834885))

(declare-fun m!834887 () Bool)

(assert (=> mapNonEmpty!29033 m!834887))

(declare-fun m!834889 () Bool)

(assert (=> b!897307 m!834889))

(declare-fun m!834891 () Bool)

(assert (=> b!897310 m!834891))

(declare-fun m!834893 () Bool)

(assert (=> b!897310 m!834893))

(declare-fun m!834895 () Bool)

(assert (=> b!897310 m!834895))

(declare-fun m!834897 () Bool)

(assert (=> start!76614 m!834897))

(declare-fun m!834899 () Bool)

(assert (=> b!897311 m!834899))

(declare-fun m!834901 () Bool)

(assert (=> b!897311 m!834901))

(check-sat (not b!897307) (not start!76614) (not b!897306) (not b_next!15949) (not b!897311) tp_is_empty!18277 (not mapNonEmpty!29033) b_and!26251 (not b!897310))
(check-sat b_and!26251 (not b_next!15949))
(get-model)

(declare-fun d!111231 () Bool)

(assert (=> d!111231 (= (inRange!0 (index!37764 lt!405167) (mask!26060 thiss!1181)) (and (bvsge (index!37764 lt!405167) #b00000000000000000000000000000000) (bvslt (index!37764 lt!405167) (bvadd (mask!26060 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897307 d!111231))

(declare-fun d!111233 () Bool)

(assert (=> d!111233 (= (array_inv!19898 (_keys!10138 thiss!1181)) (bvsge (size!25740 (_keys!10138 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897306 d!111233))

(declare-fun d!111235 () Bool)

(assert (=> d!111235 (= (array_inv!19899 (_values!5369 thiss!1181)) (bvsge (size!25741 (_values!5369 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897306 d!111235))

(declare-fun d!111237 () Bool)

(declare-fun res!606507 () Bool)

(declare-fun e!501670 () Bool)

(assert (=> d!111237 (=> (not res!606507) (not e!501670))))

(declare-fun simpleValid!313 (LongMapFixedSize!4330) Bool)

(assert (=> d!111237 (= res!606507 (simpleValid!313 thiss!1181))))

(assert (=> d!111237 (= (valid!1681 thiss!1181) e!501670)))

(declare-fun b!897366 () Bool)

(declare-fun res!606508 () Bool)

(assert (=> b!897366 (=> (not res!606508) (not e!501670))))

(declare-fun arrayCountValidKeys!0 (array!52609 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897366 (= res!606508 (= (arrayCountValidKeys!0 (_keys!10138 thiss!1181) #b00000000000000000000000000000000 (size!25740 (_keys!10138 thiss!1181))) (_size!2220 thiss!1181)))))

(declare-fun b!897367 () Bool)

(declare-fun res!606509 () Bool)

(assert (=> b!897367 (=> (not res!606509) (not e!501670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52609 (_ BitVec 32)) Bool)

(assert (=> b!897367 (= res!606509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10138 thiss!1181) (mask!26060 thiss!1181)))))

(declare-fun b!897368 () Bool)

(declare-datatypes ((List!17773 0))(
  ( (Nil!17770) (Cons!17769 (h!18913 (_ BitVec 64)) (t!25104 List!17773)) )
))
(declare-fun arrayNoDuplicates!0 (array!52609 (_ BitVec 32) List!17773) Bool)

(assert (=> b!897368 (= e!501670 (arrayNoDuplicates!0 (_keys!10138 thiss!1181) #b00000000000000000000000000000000 Nil!17770))))

(assert (= (and d!111237 res!606507) b!897366))

(assert (= (and b!897366 res!606508) b!897367))

(assert (= (and b!897367 res!606509) b!897368))

(declare-fun m!834943 () Bool)

(assert (=> d!111237 m!834943))

(declare-fun m!834945 () Bool)

(assert (=> b!897366 m!834945))

(declare-fun m!834947 () Bool)

(assert (=> b!897367 m!834947))

(declare-fun m!834949 () Bool)

(assert (=> b!897368 m!834949))

(assert (=> start!76614 d!111237))

(declare-fun d!111239 () Bool)

(declare-fun e!501673 () Bool)

(assert (=> d!111239 e!501673))

(declare-fun res!606512 () Bool)

(assert (=> d!111239 (=> res!606512 e!501673)))

(declare-fun lt!405191 () SeekEntryResult!8848)

(assert (=> d!111239 (= res!606512 (not ((_ is Found!8848) lt!405191)))))

(assert (=> d!111239 (= lt!405191 (seekEntry!0 key!785 (_keys!10138 thiss!1181) (mask!26060 thiss!1181)))))

(declare-fun lt!405190 () Unit!30470)

(declare-fun choose!1484 (array!52609 array!52611 (_ BitVec 32) (_ BitVec 32) V!29335 V!29335 (_ BitVec 64)) Unit!30470)

(assert (=> d!111239 (= lt!405190 (choose!1484 (_keys!10138 thiss!1181) (_values!5369 thiss!1181) (mask!26060 thiss!1181) (extraKeys!5078 thiss!1181) (zeroValue!5182 thiss!1181) (minValue!5182 thiss!1181) key!785))))

(assert (=> d!111239 (validMask!0 (mask!26060 thiss!1181))))

(assert (=> d!111239 (= (lemmaSeekEntryGivesInRangeIndex!76 (_keys!10138 thiss!1181) (_values!5369 thiss!1181) (mask!26060 thiss!1181) (extraKeys!5078 thiss!1181) (zeroValue!5182 thiss!1181) (minValue!5182 thiss!1181) key!785) lt!405190)))

(declare-fun b!897371 () Bool)

(assert (=> b!897371 (= e!501673 (inRange!0 (index!37764 lt!405191) (mask!26060 thiss!1181)))))

(assert (= (and d!111239 (not res!606512)) b!897371))

(assert (=> d!111239 m!834901))

(declare-fun m!834951 () Bool)

(assert (=> d!111239 m!834951))

(assert (=> d!111239 m!834891))

(declare-fun m!834953 () Bool)

(assert (=> b!897371 m!834953))

(assert (=> b!897311 d!111239))

(declare-fun b!897384 () Bool)

(declare-fun e!501682 () SeekEntryResult!8848)

(declare-fun e!501681 () SeekEntryResult!8848)

(assert (=> b!897384 (= e!501682 e!501681)))

(declare-fun lt!405201 () (_ BitVec 64))

(declare-fun lt!405202 () SeekEntryResult!8848)

(assert (=> b!897384 (= lt!405201 (select (arr!25288 (_keys!10138 thiss!1181)) (index!37765 lt!405202)))))

(declare-fun c!94971 () Bool)

(assert (=> b!897384 (= c!94971 (= lt!405201 key!785))))

(declare-fun b!897385 () Bool)

(declare-fun c!94972 () Bool)

(assert (=> b!897385 (= c!94972 (= lt!405201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501680 () SeekEntryResult!8848)

(assert (=> b!897385 (= e!501681 e!501680)))

(declare-fun d!111241 () Bool)

(declare-fun lt!405203 () SeekEntryResult!8848)

(assert (=> d!111241 (and (or ((_ is MissingVacant!8848) lt!405203) (not ((_ is Found!8848) lt!405203)) (and (bvsge (index!37764 lt!405203) #b00000000000000000000000000000000) (bvslt (index!37764 lt!405203) (size!25740 (_keys!10138 thiss!1181))))) (not ((_ is MissingVacant!8848) lt!405203)) (or (not ((_ is Found!8848) lt!405203)) (= (select (arr!25288 (_keys!10138 thiss!1181)) (index!37764 lt!405203)) key!785)))))

(assert (=> d!111241 (= lt!405203 e!501682)))

(declare-fun c!94973 () Bool)

(assert (=> d!111241 (= c!94973 (and ((_ is Intermediate!8848) lt!405202) (undefined!9660 lt!405202)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52609 (_ BitVec 32)) SeekEntryResult!8848)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111241 (= lt!405202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26060 thiss!1181)) key!785 (_keys!10138 thiss!1181) (mask!26060 thiss!1181)))))

(assert (=> d!111241 (validMask!0 (mask!26060 thiss!1181))))

(assert (=> d!111241 (= (seekEntry!0 key!785 (_keys!10138 thiss!1181) (mask!26060 thiss!1181)) lt!405203)))

(declare-fun b!897386 () Bool)

(declare-fun lt!405200 () SeekEntryResult!8848)

(assert (=> b!897386 (= e!501680 (ite ((_ is MissingVacant!8848) lt!405200) (MissingZero!8848 (index!37766 lt!405200)) lt!405200))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52609 (_ BitVec 32)) SeekEntryResult!8848)

(assert (=> b!897386 (= lt!405200 (seekKeyOrZeroReturnVacant!0 (x!76295 lt!405202) (index!37765 lt!405202) (index!37765 lt!405202) key!785 (_keys!10138 thiss!1181) (mask!26060 thiss!1181)))))

(declare-fun b!897387 () Bool)

(assert (=> b!897387 (= e!501682 Undefined!8848)))

(declare-fun b!897388 () Bool)

(assert (=> b!897388 (= e!501681 (Found!8848 (index!37765 lt!405202)))))

(declare-fun b!897389 () Bool)

(assert (=> b!897389 (= e!501680 (MissingZero!8848 (index!37765 lt!405202)))))

(assert (= (and d!111241 c!94973) b!897387))

(assert (= (and d!111241 (not c!94973)) b!897384))

(assert (= (and b!897384 c!94971) b!897388))

(assert (= (and b!897384 (not c!94971)) b!897385))

(assert (= (and b!897385 c!94972) b!897389))

(assert (= (and b!897385 (not c!94972)) b!897386))

(declare-fun m!834955 () Bool)

(assert (=> b!897384 m!834955))

(declare-fun m!834957 () Bool)

(assert (=> d!111241 m!834957))

(declare-fun m!834959 () Bool)

(assert (=> d!111241 m!834959))

(assert (=> d!111241 m!834959))

(declare-fun m!834961 () Bool)

(assert (=> d!111241 m!834961))

(assert (=> d!111241 m!834891))

(declare-fun m!834963 () Bool)

(assert (=> b!897386 m!834963))

(assert (=> b!897311 d!111241))

(declare-fun d!111243 () Bool)

(assert (=> d!111243 (= (validMask!0 (mask!26060 thiss!1181)) (and (or (= (mask!26060 thiss!1181) #b00000000000000000000000000000111) (= (mask!26060 thiss!1181) #b00000000000000000000000000001111) (= (mask!26060 thiss!1181) #b00000000000000000000000000011111) (= (mask!26060 thiss!1181) #b00000000000000000000000000111111) (= (mask!26060 thiss!1181) #b00000000000000000000000001111111) (= (mask!26060 thiss!1181) #b00000000000000000000000011111111) (= (mask!26060 thiss!1181) #b00000000000000000000000111111111) (= (mask!26060 thiss!1181) #b00000000000000000000001111111111) (= (mask!26060 thiss!1181) #b00000000000000000000011111111111) (= (mask!26060 thiss!1181) #b00000000000000000000111111111111) (= (mask!26060 thiss!1181) #b00000000000000000001111111111111) (= (mask!26060 thiss!1181) #b00000000000000000011111111111111) (= (mask!26060 thiss!1181) #b00000000000000000111111111111111) (= (mask!26060 thiss!1181) #b00000000000000001111111111111111) (= (mask!26060 thiss!1181) #b00000000000000011111111111111111) (= (mask!26060 thiss!1181) #b00000000000000111111111111111111) (= (mask!26060 thiss!1181) #b00000000000001111111111111111111) (= (mask!26060 thiss!1181) #b00000000000011111111111111111111) (= (mask!26060 thiss!1181) #b00000000000111111111111111111111) (= (mask!26060 thiss!1181) #b00000000001111111111111111111111) (= (mask!26060 thiss!1181) #b00000000011111111111111111111111) (= (mask!26060 thiss!1181) #b00000000111111111111111111111111) (= (mask!26060 thiss!1181) #b00000001111111111111111111111111) (= (mask!26060 thiss!1181) #b00000011111111111111111111111111) (= (mask!26060 thiss!1181) #b00000111111111111111111111111111) (= (mask!26060 thiss!1181) #b00001111111111111111111111111111) (= (mask!26060 thiss!1181) #b00011111111111111111111111111111) (= (mask!26060 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26060 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897310 d!111243))

(declare-fun d!111245 () Bool)

(declare-fun res!606517 () Bool)

(declare-fun e!501687 () Bool)

(assert (=> d!111245 (=> res!606517 e!501687)))

(assert (=> d!111245 (= res!606517 (= (select (arr!25288 (_keys!10138 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111245 (= (arrayContainsKey!0 (_keys!10138 thiss!1181) key!785 #b00000000000000000000000000000000) e!501687)))

(declare-fun b!897394 () Bool)

(declare-fun e!501688 () Bool)

(assert (=> b!897394 (= e!501687 e!501688)))

(declare-fun res!606518 () Bool)

(assert (=> b!897394 (=> (not res!606518) (not e!501688))))

(assert (=> b!897394 (= res!606518 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25740 (_keys!10138 thiss!1181))))))

(declare-fun b!897395 () Bool)

(assert (=> b!897395 (= e!501688 (arrayContainsKey!0 (_keys!10138 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111245 (not res!606517)) b!897394))

(assert (= (and b!897394 res!606518) b!897395))

(declare-fun m!834965 () Bool)

(assert (=> d!111245 m!834965))

(declare-fun m!834967 () Bool)

(assert (=> b!897395 m!834967))

(assert (=> b!897310 d!111245))

(declare-fun d!111247 () Bool)

(assert (=> d!111247 (arrayContainsKey!0 (_keys!10138 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405206 () Unit!30470)

(declare-fun choose!13 (array!52609 (_ BitVec 64) (_ BitVec 32)) Unit!30470)

(assert (=> d!111247 (= lt!405206 (choose!13 (_keys!10138 thiss!1181) key!785 (index!37764 lt!405167)))))

(assert (=> d!111247 (bvsge (index!37764 lt!405167) #b00000000000000000000000000000000)))

(assert (=> d!111247 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10138 thiss!1181) key!785 (index!37764 lt!405167)) lt!405206)))

(declare-fun bs!25179 () Bool)

(assert (= bs!25179 d!111247))

(assert (=> bs!25179 m!834893))

(declare-fun m!834969 () Bool)

(assert (=> bs!25179 m!834969))

(assert (=> b!897310 d!111247))

(declare-fun mapIsEmpty!29042 () Bool)

(declare-fun mapRes!29042 () Bool)

(assert (=> mapIsEmpty!29042 mapRes!29042))

(declare-fun b!897403 () Bool)

(declare-fun e!501694 () Bool)

(assert (=> b!897403 (= e!501694 tp_is_empty!18277)))

(declare-fun b!897402 () Bool)

(declare-fun e!501693 () Bool)

(assert (=> b!897402 (= e!501693 tp_is_empty!18277)))

(declare-fun condMapEmpty!29042 () Bool)

(declare-fun mapDefault!29042 () ValueCell!8657)

(assert (=> mapNonEmpty!29033 (= condMapEmpty!29042 (= mapRest!29033 ((as const (Array (_ BitVec 32) ValueCell!8657)) mapDefault!29042)))))

(assert (=> mapNonEmpty!29033 (= tp!55879 (and e!501694 mapRes!29042))))

(declare-fun mapNonEmpty!29042 () Bool)

(declare-fun tp!55895 () Bool)

(assert (=> mapNonEmpty!29042 (= mapRes!29042 (and tp!55895 e!501693))))

(declare-fun mapRest!29042 () (Array (_ BitVec 32) ValueCell!8657))

(declare-fun mapValue!29042 () ValueCell!8657)

(declare-fun mapKey!29042 () (_ BitVec 32))

(assert (=> mapNonEmpty!29042 (= mapRest!29033 (store mapRest!29042 mapKey!29042 mapValue!29042))))

(assert (= (and mapNonEmpty!29033 condMapEmpty!29042) mapIsEmpty!29042))

(assert (= (and mapNonEmpty!29033 (not condMapEmpty!29042)) mapNonEmpty!29042))

(assert (= (and mapNonEmpty!29042 ((_ is ValueCellFull!8657) mapValue!29042)) b!897402))

(assert (= (and mapNonEmpty!29033 ((_ is ValueCellFull!8657) mapDefault!29042)) b!897403))

(declare-fun m!834971 () Bool)

(assert (=> mapNonEmpty!29042 m!834971))

(check-sat (not mapNonEmpty!29042) (not b!897367) (not d!111247) b_and!26251 (not b!897371) (not b!897386) (not b_next!15949) (not d!111239) (not d!111241) (not b!897395) (not b!897368) (not d!111237) (not b!897366) tp_is_empty!18277)
(check-sat b_and!26251 (not b_next!15949))
