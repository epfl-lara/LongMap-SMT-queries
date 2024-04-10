; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80840 () Bool)

(assert start!80840)

(declare-fun b!947519 () Bool)

(declare-fun b_free!18177 () Bool)

(declare-fun b_next!18177 () Bool)

(assert (=> b!947519 (= b_free!18177 (not b_next!18177))))

(declare-fun tp!63093 () Bool)

(declare-fun b_and!29599 () Bool)

(assert (=> b!947519 (= tp!63093 b_and!29599)))

(declare-fun b!947511 () Bool)

(declare-fun e!533303 () Bool)

(declare-fun e!533304 () Bool)

(declare-fun mapRes!32905 () Bool)

(assert (=> b!947511 (= e!533303 (and e!533304 mapRes!32905))))

(declare-fun condMapEmpty!32905 () Bool)

(declare-datatypes ((V!32545 0))(
  ( (V!32546 (val!10393 Int)) )
))
(declare-datatypes ((ValueCell!9861 0))(
  ( (ValueCellFull!9861 (v!12927 V!32545)) (EmptyCell!9861) )
))
(declare-datatypes ((array!57368 0))(
  ( (array!57369 (arr!27594 (Array (_ BitVec 32) ValueCell!9861)) (size!28067 (_ BitVec 32))) )
))
(declare-datatypes ((array!57370 0))(
  ( (array!57371 (arr!27595 (Array (_ BitVec 32) (_ BitVec 64))) (size!28068 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4872 0))(
  ( (LongMapFixedSize!4873 (defaultEntry!5733 Int) (mask!27473 (_ BitVec 32)) (extraKeys!5465 (_ BitVec 32)) (zeroValue!5569 V!32545) (minValue!5569 V!32545) (_size!2491 (_ BitVec 32)) (_keys!10644 array!57370) (_values!5756 array!57368) (_vacant!2491 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4872)

(declare-fun mapDefault!32905 () ValueCell!9861)

(assert (=> b!947511 (= condMapEmpty!32905 (= (arr!27594 (_values!5756 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9861)) mapDefault!32905)))))

(declare-fun res!635896 () Bool)

(declare-fun e!533306 () Bool)

(assert (=> start!80840 (=> (not res!635896) (not e!533306))))

(declare-fun valid!1856 (LongMapFixedSize!4872) Bool)

(assert (=> start!80840 (= res!635896 (valid!1856 thiss!1141))))

(assert (=> start!80840 e!533306))

(declare-fun e!533307 () Bool)

(assert (=> start!80840 e!533307))

(assert (=> start!80840 true))

(declare-fun b!947512 () Bool)

(declare-fun e!533305 () Bool)

(declare-datatypes ((SeekEntryResult!9116 0))(
  ( (MissingZero!9116 (index!38835 (_ BitVec 32))) (Found!9116 (index!38836 (_ BitVec 32))) (Intermediate!9116 (undefined!9928 Bool) (index!38837 (_ BitVec 32)) (x!81516 (_ BitVec 32))) (Undefined!9116) (MissingVacant!9116 (index!38838 (_ BitVec 32))) )
))
(declare-fun lt!426593 () SeekEntryResult!9116)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947512 (= e!533305 (validKeyInArray!0 (select (arr!27595 (_keys!10644 thiss!1141)) (index!38836 lt!426593))))))

(declare-fun b!947513 () Bool)

(declare-fun res!635889 () Bool)

(assert (=> b!947513 (=> res!635889 e!533305)))

(assert (=> b!947513 (= res!635889 (or (not (= (size!28067 (_values!5756 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27473 thiss!1141)))) (not (= (size!28068 (_keys!10644 thiss!1141)) (size!28067 (_values!5756 thiss!1141)))) (bvslt (mask!27473 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5465 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5465 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947514 () Bool)

(declare-fun res!635895 () Bool)

(assert (=> b!947514 (=> res!635895 e!533305)))

(assert (=> b!947514 (= res!635895 (or (bvslt (index!38836 lt!426593) #b00000000000000000000000000000000) (bvsge (index!38836 lt!426593) (size!28068 (_keys!10644 thiss!1141)))))))

(declare-fun mapIsEmpty!32905 () Bool)

(assert (=> mapIsEmpty!32905 mapRes!32905))

(declare-fun b!947515 () Bool)

(declare-fun res!635890 () Bool)

(assert (=> b!947515 (=> res!635890 e!533305)))

(declare-datatypes ((List!19307 0))(
  ( (Nil!19304) (Cons!19303 (h!20459 (_ BitVec 64)) (t!27628 List!19307)) )
))
(declare-fun arrayNoDuplicates!0 (array!57370 (_ BitVec 32) List!19307) Bool)

(assert (=> b!947515 (= res!635890 (not (arrayNoDuplicates!0 (_keys!10644 thiss!1141) #b00000000000000000000000000000000 Nil!19304)))))

(declare-fun mapNonEmpty!32905 () Bool)

(declare-fun tp!63092 () Bool)

(declare-fun e!533308 () Bool)

(assert (=> mapNonEmpty!32905 (= mapRes!32905 (and tp!63092 e!533308))))

(declare-fun mapRest!32905 () (Array (_ BitVec 32) ValueCell!9861))

(declare-fun mapValue!32905 () ValueCell!9861)

(declare-fun mapKey!32905 () (_ BitVec 32))

(assert (=> mapNonEmpty!32905 (= (arr!27594 (_values!5756 thiss!1141)) (store mapRest!32905 mapKey!32905 mapValue!32905))))

(declare-fun b!947516 () Bool)

(declare-fun tp_is_empty!20685 () Bool)

(assert (=> b!947516 (= e!533304 tp_is_empty!20685)))

(declare-fun b!947517 () Bool)

(declare-fun e!533309 () Bool)

(assert (=> b!947517 (= e!533309 (not e!533305))))

(declare-fun res!635891 () Bool)

(assert (=> b!947517 (=> res!635891 e!533305)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947517 (= res!635891 (not (validMask!0 (mask!27473 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947517 (arrayContainsKey!0 (_keys!10644 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31928 0))(
  ( (Unit!31929) )
))
(declare-fun lt!426594 () Unit!31928)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57370 (_ BitVec 64) (_ BitVec 32)) Unit!31928)

(assert (=> b!947517 (= lt!426594 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10644 thiss!1141) key!756 (index!38836 lt!426593)))))

(declare-fun b!947518 () Bool)

(declare-fun res!635894 () Bool)

(assert (=> b!947518 (=> (not res!635894) (not e!533306))))

(assert (=> b!947518 (= res!635894 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!21422 (array!57370) Bool)

(declare-fun array_inv!21423 (array!57368) Bool)

(assert (=> b!947519 (= e!533307 (and tp!63093 tp_is_empty!20685 (array_inv!21422 (_keys!10644 thiss!1141)) (array_inv!21423 (_values!5756 thiss!1141)) e!533303))))

(declare-fun b!947520 () Bool)

(assert (=> b!947520 (= e!533306 e!533309)))

(declare-fun res!635892 () Bool)

(assert (=> b!947520 (=> (not res!635892) (not e!533309))))

(get-info :version)

(assert (=> b!947520 (= res!635892 ((_ is Found!9116) lt!426593))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57370 (_ BitVec 32)) SeekEntryResult!9116)

(assert (=> b!947520 (= lt!426593 (seekEntry!0 key!756 (_keys!10644 thiss!1141) (mask!27473 thiss!1141)))))

(declare-fun b!947521 () Bool)

(assert (=> b!947521 (= e!533308 tp_is_empty!20685)))

(declare-fun b!947522 () Bool)

(declare-fun res!635893 () Bool)

(assert (=> b!947522 (=> res!635893 e!533305)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57370 (_ BitVec 32)) Bool)

(assert (=> b!947522 (= res!635893 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10644 thiss!1141) (mask!27473 thiss!1141))))))

(assert (= (and start!80840 res!635896) b!947518))

(assert (= (and b!947518 res!635894) b!947520))

(assert (= (and b!947520 res!635892) b!947517))

(assert (= (and b!947517 (not res!635891)) b!947513))

(assert (= (and b!947513 (not res!635889)) b!947522))

(assert (= (and b!947522 (not res!635893)) b!947515))

(assert (= (and b!947515 (not res!635890)) b!947514))

(assert (= (and b!947514 (not res!635895)) b!947512))

(assert (= (and b!947511 condMapEmpty!32905) mapIsEmpty!32905))

(assert (= (and b!947511 (not condMapEmpty!32905)) mapNonEmpty!32905))

(assert (= (and mapNonEmpty!32905 ((_ is ValueCellFull!9861) mapValue!32905)) b!947521))

(assert (= (and b!947511 ((_ is ValueCellFull!9861) mapDefault!32905)) b!947516))

(assert (= b!947519 b!947511))

(assert (= start!80840 b!947519))

(declare-fun m!880431 () Bool)

(assert (=> mapNonEmpty!32905 m!880431))

(declare-fun m!880433 () Bool)

(assert (=> b!947519 m!880433))

(declare-fun m!880435 () Bool)

(assert (=> b!947519 m!880435))

(declare-fun m!880437 () Bool)

(assert (=> b!947520 m!880437))

(declare-fun m!880439 () Bool)

(assert (=> b!947522 m!880439))

(declare-fun m!880441 () Bool)

(assert (=> start!80840 m!880441))

(declare-fun m!880443 () Bool)

(assert (=> b!947512 m!880443))

(assert (=> b!947512 m!880443))

(declare-fun m!880445 () Bool)

(assert (=> b!947512 m!880445))

(declare-fun m!880447 () Bool)

(assert (=> b!947515 m!880447))

(declare-fun m!880449 () Bool)

(assert (=> b!947517 m!880449))

(declare-fun m!880451 () Bool)

(assert (=> b!947517 m!880451))

(declare-fun m!880453 () Bool)

(assert (=> b!947517 m!880453))

(check-sat (not b!947519) (not b!947517) b_and!29599 (not b!947522) (not b!947515) (not start!80840) (not b!947512) tp_is_empty!20685 (not mapNonEmpty!32905) (not b_next!18177) (not b!947520))
(check-sat b_and!29599 (not b_next!18177))
(get-model)

(declare-fun d!114689 () Bool)

(declare-fun res!635927 () Bool)

(declare-fun e!533336 () Bool)

(assert (=> d!114689 (=> (not res!635927) (not e!533336))))

(declare-fun simpleValid!364 (LongMapFixedSize!4872) Bool)

(assert (=> d!114689 (= res!635927 (simpleValid!364 thiss!1141))))

(assert (=> d!114689 (= (valid!1856 thiss!1141) e!533336)))

(declare-fun b!947565 () Bool)

(declare-fun res!635928 () Bool)

(assert (=> b!947565 (=> (not res!635928) (not e!533336))))

(declare-fun arrayCountValidKeys!0 (array!57370 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947565 (= res!635928 (= (arrayCountValidKeys!0 (_keys!10644 thiss!1141) #b00000000000000000000000000000000 (size!28068 (_keys!10644 thiss!1141))) (_size!2491 thiss!1141)))))

(declare-fun b!947566 () Bool)

(declare-fun res!635929 () Bool)

(assert (=> b!947566 (=> (not res!635929) (not e!533336))))

(assert (=> b!947566 (= res!635929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10644 thiss!1141) (mask!27473 thiss!1141)))))

(declare-fun b!947567 () Bool)

(assert (=> b!947567 (= e!533336 (arrayNoDuplicates!0 (_keys!10644 thiss!1141) #b00000000000000000000000000000000 Nil!19304))))

(assert (= (and d!114689 res!635927) b!947565))

(assert (= (and b!947565 res!635928) b!947566))

(assert (= (and b!947566 res!635929) b!947567))

(declare-fun m!880479 () Bool)

(assert (=> d!114689 m!880479))

(declare-fun m!880481 () Bool)

(assert (=> b!947565 m!880481))

(assert (=> b!947566 m!880439))

(assert (=> b!947567 m!880447))

(assert (=> start!80840 d!114689))

(declare-fun d!114691 () Bool)

(assert (=> d!114691 (= (validMask!0 (mask!27473 thiss!1141)) (and (or (= (mask!27473 thiss!1141) #b00000000000000000000000000000111) (= (mask!27473 thiss!1141) #b00000000000000000000000000001111) (= (mask!27473 thiss!1141) #b00000000000000000000000000011111) (= (mask!27473 thiss!1141) #b00000000000000000000000000111111) (= (mask!27473 thiss!1141) #b00000000000000000000000001111111) (= (mask!27473 thiss!1141) #b00000000000000000000000011111111) (= (mask!27473 thiss!1141) #b00000000000000000000000111111111) (= (mask!27473 thiss!1141) #b00000000000000000000001111111111) (= (mask!27473 thiss!1141) #b00000000000000000000011111111111) (= (mask!27473 thiss!1141) #b00000000000000000000111111111111) (= (mask!27473 thiss!1141) #b00000000000000000001111111111111) (= (mask!27473 thiss!1141) #b00000000000000000011111111111111) (= (mask!27473 thiss!1141) #b00000000000000000111111111111111) (= (mask!27473 thiss!1141) #b00000000000000001111111111111111) (= (mask!27473 thiss!1141) #b00000000000000011111111111111111) (= (mask!27473 thiss!1141) #b00000000000000111111111111111111) (= (mask!27473 thiss!1141) #b00000000000001111111111111111111) (= (mask!27473 thiss!1141) #b00000000000011111111111111111111) (= (mask!27473 thiss!1141) #b00000000000111111111111111111111) (= (mask!27473 thiss!1141) #b00000000001111111111111111111111) (= (mask!27473 thiss!1141) #b00000000011111111111111111111111) (= (mask!27473 thiss!1141) #b00000000111111111111111111111111) (= (mask!27473 thiss!1141) #b00000001111111111111111111111111) (= (mask!27473 thiss!1141) #b00000011111111111111111111111111) (= (mask!27473 thiss!1141) #b00000111111111111111111111111111) (= (mask!27473 thiss!1141) #b00001111111111111111111111111111) (= (mask!27473 thiss!1141) #b00011111111111111111111111111111) (= (mask!27473 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27473 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947517 d!114691))

(declare-fun d!114693 () Bool)

(declare-fun res!635934 () Bool)

(declare-fun e!533341 () Bool)

(assert (=> d!114693 (=> res!635934 e!533341)))

(assert (=> d!114693 (= res!635934 (= (select (arr!27595 (_keys!10644 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114693 (= (arrayContainsKey!0 (_keys!10644 thiss!1141) key!756 #b00000000000000000000000000000000) e!533341)))

(declare-fun b!947572 () Bool)

(declare-fun e!533342 () Bool)

(assert (=> b!947572 (= e!533341 e!533342)))

(declare-fun res!635935 () Bool)

(assert (=> b!947572 (=> (not res!635935) (not e!533342))))

(assert (=> b!947572 (= res!635935 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28068 (_keys!10644 thiss!1141))))))

(declare-fun b!947573 () Bool)

(assert (=> b!947573 (= e!533342 (arrayContainsKey!0 (_keys!10644 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114693 (not res!635934)) b!947572))

(assert (= (and b!947572 res!635935) b!947573))

(declare-fun m!880483 () Bool)

(assert (=> d!114693 m!880483))

(declare-fun m!880485 () Bool)

(assert (=> b!947573 m!880485))

(assert (=> b!947517 d!114693))

(declare-fun d!114695 () Bool)

(assert (=> d!114695 (arrayContainsKey!0 (_keys!10644 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426603 () Unit!31928)

(declare-fun choose!13 (array!57370 (_ BitVec 64) (_ BitVec 32)) Unit!31928)

(assert (=> d!114695 (= lt!426603 (choose!13 (_keys!10644 thiss!1141) key!756 (index!38836 lt!426593)))))

(assert (=> d!114695 (bvsge (index!38836 lt!426593) #b00000000000000000000000000000000)))

(assert (=> d!114695 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10644 thiss!1141) key!756 (index!38836 lt!426593)) lt!426603)))

(declare-fun bs!26632 () Bool)

(assert (= bs!26632 d!114695))

(assert (=> bs!26632 m!880451))

(declare-fun m!880487 () Bool)

(assert (=> bs!26632 m!880487))

(assert (=> b!947517 d!114695))

(declare-fun d!114697 () Bool)

(declare-fun res!635940 () Bool)

(declare-fun e!533349 () Bool)

(assert (=> d!114697 (=> res!635940 e!533349)))

(assert (=> d!114697 (= res!635940 (bvsge #b00000000000000000000000000000000 (size!28068 (_keys!10644 thiss!1141))))))

(assert (=> d!114697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10644 thiss!1141) (mask!27473 thiss!1141)) e!533349)))

(declare-fun b!947582 () Bool)

(declare-fun e!533351 () Bool)

(assert (=> b!947582 (= e!533349 e!533351)))

(declare-fun c!98705 () Bool)

(assert (=> b!947582 (= c!98705 (validKeyInArray!0 (select (arr!27595 (_keys!10644 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947583 () Bool)

(declare-fun e!533350 () Bool)

(assert (=> b!947583 (= e!533351 e!533350)))

(declare-fun lt!426612 () (_ BitVec 64))

(assert (=> b!947583 (= lt!426612 (select (arr!27595 (_keys!10644 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426611 () Unit!31928)

(assert (=> b!947583 (= lt!426611 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10644 thiss!1141) lt!426612 #b00000000000000000000000000000000))))

(assert (=> b!947583 (arrayContainsKey!0 (_keys!10644 thiss!1141) lt!426612 #b00000000000000000000000000000000)))

(declare-fun lt!426610 () Unit!31928)

(assert (=> b!947583 (= lt!426610 lt!426611)))

(declare-fun res!635941 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57370 (_ BitVec 32)) SeekEntryResult!9116)

(assert (=> b!947583 (= res!635941 (= (seekEntryOrOpen!0 (select (arr!27595 (_keys!10644 thiss!1141)) #b00000000000000000000000000000000) (_keys!10644 thiss!1141) (mask!27473 thiss!1141)) (Found!9116 #b00000000000000000000000000000000)))))

(assert (=> b!947583 (=> (not res!635941) (not e!533350))))

(declare-fun bm!41118 () Bool)

(declare-fun call!41121 () Bool)

(assert (=> bm!41118 (= call!41121 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10644 thiss!1141) (mask!27473 thiss!1141)))))

(declare-fun b!947584 () Bool)

(assert (=> b!947584 (= e!533350 call!41121)))

(declare-fun b!947585 () Bool)

(assert (=> b!947585 (= e!533351 call!41121)))

(assert (= (and d!114697 (not res!635940)) b!947582))

(assert (= (and b!947582 c!98705) b!947583))

(assert (= (and b!947582 (not c!98705)) b!947585))

(assert (= (and b!947583 res!635941) b!947584))

(assert (= (or b!947584 b!947585) bm!41118))

(assert (=> b!947582 m!880483))

(assert (=> b!947582 m!880483))

(declare-fun m!880489 () Bool)

(assert (=> b!947582 m!880489))

(assert (=> b!947583 m!880483))

(declare-fun m!880491 () Bool)

(assert (=> b!947583 m!880491))

(declare-fun m!880493 () Bool)

(assert (=> b!947583 m!880493))

(assert (=> b!947583 m!880483))

(declare-fun m!880495 () Bool)

(assert (=> b!947583 m!880495))

(declare-fun m!880497 () Bool)

(assert (=> bm!41118 m!880497))

(assert (=> b!947522 d!114697))

(declare-fun d!114699 () Bool)

(assert (=> d!114699 (= (array_inv!21422 (_keys!10644 thiss!1141)) (bvsge (size!28068 (_keys!10644 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947519 d!114699))

(declare-fun d!114701 () Bool)

(assert (=> d!114701 (= (array_inv!21423 (_values!5756 thiss!1141)) (bvsge (size!28067 (_values!5756 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947519 d!114701))

(declare-fun d!114703 () Bool)

(declare-fun lt!426624 () SeekEntryResult!9116)

(assert (=> d!114703 (and (or ((_ is MissingVacant!9116) lt!426624) (not ((_ is Found!9116) lt!426624)) (and (bvsge (index!38836 lt!426624) #b00000000000000000000000000000000) (bvslt (index!38836 lt!426624) (size!28068 (_keys!10644 thiss!1141))))) (not ((_ is MissingVacant!9116) lt!426624)) (or (not ((_ is Found!9116) lt!426624)) (= (select (arr!27595 (_keys!10644 thiss!1141)) (index!38836 lt!426624)) key!756)))))

(declare-fun e!533360 () SeekEntryResult!9116)

(assert (=> d!114703 (= lt!426624 e!533360)))

(declare-fun c!98713 () Bool)

(declare-fun lt!426622 () SeekEntryResult!9116)

(assert (=> d!114703 (= c!98713 (and ((_ is Intermediate!9116) lt!426622) (undefined!9928 lt!426622)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57370 (_ BitVec 32)) SeekEntryResult!9116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114703 (= lt!426622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27473 thiss!1141)) key!756 (_keys!10644 thiss!1141) (mask!27473 thiss!1141)))))

(assert (=> d!114703 (validMask!0 (mask!27473 thiss!1141))))

(assert (=> d!114703 (= (seekEntry!0 key!756 (_keys!10644 thiss!1141) (mask!27473 thiss!1141)) lt!426624)))

(declare-fun b!947598 () Bool)

(declare-fun c!98712 () Bool)

(declare-fun lt!426623 () (_ BitVec 64))

(assert (=> b!947598 (= c!98712 (= lt!426623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533358 () SeekEntryResult!9116)

(declare-fun e!533359 () SeekEntryResult!9116)

(assert (=> b!947598 (= e!533358 e!533359)))

(declare-fun b!947599 () Bool)

(assert (=> b!947599 (= e!533360 e!533358)))

(assert (=> b!947599 (= lt!426623 (select (arr!27595 (_keys!10644 thiss!1141)) (index!38837 lt!426622)))))

(declare-fun c!98714 () Bool)

(assert (=> b!947599 (= c!98714 (= lt!426623 key!756))))

(declare-fun b!947600 () Bool)

(declare-fun lt!426621 () SeekEntryResult!9116)

(assert (=> b!947600 (= e!533359 (ite ((_ is MissingVacant!9116) lt!426621) (MissingZero!9116 (index!38838 lt!426621)) lt!426621))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57370 (_ BitVec 32)) SeekEntryResult!9116)

(assert (=> b!947600 (= lt!426621 (seekKeyOrZeroReturnVacant!0 (x!81516 lt!426622) (index!38837 lt!426622) (index!38837 lt!426622) key!756 (_keys!10644 thiss!1141) (mask!27473 thiss!1141)))))

(declare-fun b!947601 () Bool)

(assert (=> b!947601 (= e!533360 Undefined!9116)))

(declare-fun b!947602 () Bool)

(assert (=> b!947602 (= e!533358 (Found!9116 (index!38837 lt!426622)))))

(declare-fun b!947603 () Bool)

(assert (=> b!947603 (= e!533359 (MissingZero!9116 (index!38837 lt!426622)))))

(assert (= (and d!114703 c!98713) b!947601))

(assert (= (and d!114703 (not c!98713)) b!947599))

(assert (= (and b!947599 c!98714) b!947602))

(assert (= (and b!947599 (not c!98714)) b!947598))

(assert (= (and b!947598 c!98712) b!947603))

(assert (= (and b!947598 (not c!98712)) b!947600))

(declare-fun m!880499 () Bool)

(assert (=> d!114703 m!880499))

(declare-fun m!880501 () Bool)

(assert (=> d!114703 m!880501))

(assert (=> d!114703 m!880501))

(declare-fun m!880503 () Bool)

(assert (=> d!114703 m!880503))

(assert (=> d!114703 m!880449))

(declare-fun m!880505 () Bool)

(assert (=> b!947599 m!880505))

(declare-fun m!880507 () Bool)

(assert (=> b!947600 m!880507))

(assert (=> b!947520 d!114703))

(declare-fun b!947614 () Bool)

(declare-fun e!533370 () Bool)

(declare-fun call!41124 () Bool)

(assert (=> b!947614 (= e!533370 call!41124)))

(declare-fun bm!41121 () Bool)

(declare-fun c!98717 () Bool)

(assert (=> bm!41121 (= call!41124 (arrayNoDuplicates!0 (_keys!10644 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98717 (Cons!19303 (select (arr!27595 (_keys!10644 thiss!1141)) #b00000000000000000000000000000000) Nil!19304) Nil!19304)))))

(declare-fun b!947615 () Bool)

(declare-fun e!533372 () Bool)

(declare-fun contains!5200 (List!19307 (_ BitVec 64)) Bool)

(assert (=> b!947615 (= e!533372 (contains!5200 Nil!19304 (select (arr!27595 (_keys!10644 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947616 () Bool)

(declare-fun e!533369 () Bool)

(assert (=> b!947616 (= e!533369 e!533370)))

(assert (=> b!947616 (= c!98717 (validKeyInArray!0 (select (arr!27595 (_keys!10644 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947617 () Bool)

(assert (=> b!947617 (= e!533370 call!41124)))

(declare-fun b!947618 () Bool)

(declare-fun e!533371 () Bool)

(assert (=> b!947618 (= e!533371 e!533369)))

(declare-fun res!635950 () Bool)

(assert (=> b!947618 (=> (not res!635950) (not e!533369))))

(assert (=> b!947618 (= res!635950 (not e!533372))))

(declare-fun res!635948 () Bool)

(assert (=> b!947618 (=> (not res!635948) (not e!533372))))

(assert (=> b!947618 (= res!635948 (validKeyInArray!0 (select (arr!27595 (_keys!10644 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114705 () Bool)

(declare-fun res!635949 () Bool)

(assert (=> d!114705 (=> res!635949 e!533371)))

(assert (=> d!114705 (= res!635949 (bvsge #b00000000000000000000000000000000 (size!28068 (_keys!10644 thiss!1141))))))

(assert (=> d!114705 (= (arrayNoDuplicates!0 (_keys!10644 thiss!1141) #b00000000000000000000000000000000 Nil!19304) e!533371)))

(assert (= (and d!114705 (not res!635949)) b!947618))

(assert (= (and b!947618 res!635948) b!947615))

(assert (= (and b!947618 res!635950) b!947616))

(assert (= (and b!947616 c!98717) b!947617))

(assert (= (and b!947616 (not c!98717)) b!947614))

(assert (= (or b!947617 b!947614) bm!41121))

(assert (=> bm!41121 m!880483))

(declare-fun m!880509 () Bool)

(assert (=> bm!41121 m!880509))

(assert (=> b!947615 m!880483))

(assert (=> b!947615 m!880483))

(declare-fun m!880511 () Bool)

(assert (=> b!947615 m!880511))

(assert (=> b!947616 m!880483))

(assert (=> b!947616 m!880483))

(assert (=> b!947616 m!880489))

(assert (=> b!947618 m!880483))

(assert (=> b!947618 m!880483))

(assert (=> b!947618 m!880489))

(assert (=> b!947515 d!114705))

(declare-fun d!114707 () Bool)

(assert (=> d!114707 (= (validKeyInArray!0 (select (arr!27595 (_keys!10644 thiss!1141)) (index!38836 lt!426593))) (and (not (= (select (arr!27595 (_keys!10644 thiss!1141)) (index!38836 lt!426593)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27595 (_keys!10644 thiss!1141)) (index!38836 lt!426593)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!947512 d!114707))

(declare-fun mapIsEmpty!32911 () Bool)

(declare-fun mapRes!32911 () Bool)

(assert (=> mapIsEmpty!32911 mapRes!32911))

(declare-fun mapNonEmpty!32911 () Bool)

(declare-fun tp!63102 () Bool)

(declare-fun e!533378 () Bool)

(assert (=> mapNonEmpty!32911 (= mapRes!32911 (and tp!63102 e!533378))))

(declare-fun mapValue!32911 () ValueCell!9861)

(declare-fun mapRest!32911 () (Array (_ BitVec 32) ValueCell!9861))

(declare-fun mapKey!32911 () (_ BitVec 32))

(assert (=> mapNonEmpty!32911 (= mapRest!32905 (store mapRest!32911 mapKey!32911 mapValue!32911))))

(declare-fun b!947626 () Bool)

(declare-fun e!533377 () Bool)

(assert (=> b!947626 (= e!533377 tp_is_empty!20685)))

(declare-fun condMapEmpty!32911 () Bool)

(declare-fun mapDefault!32911 () ValueCell!9861)

(assert (=> mapNonEmpty!32905 (= condMapEmpty!32911 (= mapRest!32905 ((as const (Array (_ BitVec 32) ValueCell!9861)) mapDefault!32911)))))

(assert (=> mapNonEmpty!32905 (= tp!63092 (and e!533377 mapRes!32911))))

(declare-fun b!947625 () Bool)

(assert (=> b!947625 (= e!533378 tp_is_empty!20685)))

(assert (= (and mapNonEmpty!32905 condMapEmpty!32911) mapIsEmpty!32911))

(assert (= (and mapNonEmpty!32905 (not condMapEmpty!32911)) mapNonEmpty!32911))

(assert (= (and mapNonEmpty!32911 ((_ is ValueCellFull!9861) mapValue!32911)) b!947625))

(assert (= (and mapNonEmpty!32905 ((_ is ValueCellFull!9861) mapDefault!32911)) b!947626))

(declare-fun m!880513 () Bool)

(assert (=> mapNonEmpty!32911 m!880513))

(check-sat (not bm!41118) (not b!947565) (not b!947567) (not b!947615) b_and!29599 (not b!947583) (not b!947566) (not b!947582) tp_is_empty!20685 (not b!947618) (not d!114689) (not b_next!18177) (not b!947573) (not bm!41121) (not b!947616) (not b!947600) (not d!114703) (not mapNonEmpty!32911) (not d!114695))
(check-sat b_and!29599 (not b_next!18177))
