; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80772 () Bool)

(assert start!80772)

(declare-fun b!946909 () Bool)

(declare-fun b_free!18163 () Bool)

(declare-fun b_next!18163 () Bool)

(assert (=> b!946909 (= b_free!18163 (not b_next!18163))))

(declare-fun tp!63046 () Bool)

(declare-fun b_and!29559 () Bool)

(assert (=> b!946909 (= tp!63046 b_and!29559)))

(declare-fun mapNonEmpty!32878 () Bool)

(declare-fun mapRes!32878 () Bool)

(declare-fun tp!63045 () Bool)

(declare-fun e!532899 () Bool)

(assert (=> mapNonEmpty!32878 (= mapRes!32878 (and tp!63045 e!532899))))

(declare-datatypes ((V!32527 0))(
  ( (V!32528 (val!10386 Int)) )
))
(declare-datatypes ((ValueCell!9854 0))(
  ( (ValueCellFull!9854 (v!12919 V!32527)) (EmptyCell!9854) )
))
(declare-fun mapRest!32878 () (Array (_ BitVec 32) ValueCell!9854))

(declare-datatypes ((array!57301 0))(
  ( (array!57302 (arr!27563 (Array (_ BitVec 32) ValueCell!9854)) (size!28038 (_ BitVec 32))) )
))
(declare-datatypes ((array!57303 0))(
  ( (array!57304 (arr!27564 (Array (_ BitVec 32) (_ BitVec 64))) (size!28039 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4858 0))(
  ( (LongMapFixedSize!4859 (defaultEntry!5726 Int) (mask!27449 (_ BitVec 32)) (extraKeys!5458 (_ BitVec 32)) (zeroValue!5562 V!32527) (minValue!5562 V!32527) (_size!2484 (_ BitVec 32)) (_keys!10628 array!57303) (_values!5749 array!57301) (_vacant!2484 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4858)

(declare-fun mapKey!32878 () (_ BitVec 32))

(declare-fun mapValue!32878 () ValueCell!9854)

(assert (=> mapNonEmpty!32878 (= (arr!27563 (_values!5749 thiss!1141)) (store mapRest!32878 mapKey!32878 mapValue!32878))))

(declare-fun b!946907 () Bool)

(declare-fun res!635576 () Bool)

(declare-fun e!532898 () Bool)

(assert (=> b!946907 (=> res!635576 e!532898)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57303 (_ BitVec 32)) Bool)

(assert (=> b!946907 (= res!635576 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10628 thiss!1141) (mask!27449 thiss!1141))))))

(declare-fun b!946908 () Bool)

(declare-fun e!532897 () Bool)

(declare-fun e!532901 () Bool)

(assert (=> b!946908 (= e!532897 e!532901)))

(declare-fun res!635577 () Bool)

(assert (=> b!946908 (=> (not res!635577) (not e!532901))))

(declare-datatypes ((SeekEntryResult!9111 0))(
  ( (MissingZero!9111 (index!38815 (_ BitVec 32))) (Found!9111 (index!38816 (_ BitVec 32))) (Intermediate!9111 (undefined!9923 Bool) (index!38817 (_ BitVec 32)) (x!81474 (_ BitVec 32))) (Undefined!9111) (MissingVacant!9111 (index!38818 (_ BitVec 32))) )
))
(declare-fun lt!426267 () SeekEntryResult!9111)

(get-info :version)

(assert (=> b!946908 (= res!635577 ((_ is Found!9111) lt!426267))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57303 (_ BitVec 32)) SeekEntryResult!9111)

(assert (=> b!946908 (= lt!426267 (seekEntry!0 key!756 (_keys!10628 thiss!1141) (mask!27449 thiss!1141)))))

(declare-fun e!532900 () Bool)

(declare-fun tp_is_empty!20671 () Bool)

(declare-fun e!532902 () Bool)

(declare-fun array_inv!21458 (array!57303) Bool)

(declare-fun array_inv!21459 (array!57301) Bool)

(assert (=> b!946909 (= e!532900 (and tp!63046 tp_is_empty!20671 (array_inv!21458 (_keys!10628 thiss!1141)) (array_inv!21459 (_values!5749 thiss!1141)) e!532902))))

(declare-fun res!635574 () Bool)

(assert (=> start!80772 (=> (not res!635574) (not e!532897))))

(declare-fun valid!1856 (LongMapFixedSize!4858) Bool)

(assert (=> start!80772 (= res!635574 (valid!1856 thiss!1141))))

(assert (=> start!80772 e!532897))

(assert (=> start!80772 e!532900))

(assert (=> start!80772 true))

(declare-fun mapIsEmpty!32878 () Bool)

(assert (=> mapIsEmpty!32878 mapRes!32878))

(declare-fun b!946910 () Bool)

(declare-fun res!635575 () Bool)

(assert (=> b!946910 (=> (not res!635575) (not e!532897))))

(assert (=> b!946910 (= res!635575 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946911 () Bool)

(assert (=> b!946911 (= e!532899 tp_is_empty!20671)))

(declare-fun b!946912 () Bool)

(declare-fun e!532896 () Bool)

(assert (=> b!946912 (= e!532902 (and e!532896 mapRes!32878))))

(declare-fun condMapEmpty!32878 () Bool)

(declare-fun mapDefault!32878 () ValueCell!9854)

(assert (=> b!946912 (= condMapEmpty!32878 (= (arr!27563 (_values!5749 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9854)) mapDefault!32878)))))

(declare-fun b!946913 () Bool)

(declare-fun res!635579 () Bool)

(assert (=> b!946913 (=> res!635579 e!532898)))

(assert (=> b!946913 (= res!635579 (or (not (= (size!28038 (_values!5749 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27449 thiss!1141)))) (not (= (size!28039 (_keys!10628 thiss!1141)) (size!28038 (_values!5749 thiss!1141)))) (bvslt (mask!27449 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5458 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5458 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!946914 () Bool)

(assert (=> b!946914 (= e!532901 (not e!532898))))

(declare-fun res!635578 () Bool)

(assert (=> b!946914 (=> res!635578 e!532898)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946914 (= res!635578 (not (validMask!0 (mask!27449 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946914 (arrayContainsKey!0 (_keys!10628 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31804 0))(
  ( (Unit!31805) )
))
(declare-fun lt!426268 () Unit!31804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57303 (_ BitVec 64) (_ BitVec 32)) Unit!31804)

(assert (=> b!946914 (= lt!426268 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10628 thiss!1141) key!756 (index!38816 lt!426267)))))

(declare-fun b!946915 () Bool)

(assert (=> b!946915 (= e!532896 tp_is_empty!20671)))

(declare-fun b!946916 () Bool)

(declare-datatypes ((List!19307 0))(
  ( (Nil!19304) (Cons!19303 (h!20459 (_ BitVec 64)) (t!27619 List!19307)) )
))
(declare-fun arrayNoDuplicates!0 (array!57303 (_ BitVec 32) List!19307) Bool)

(assert (=> b!946916 (= e!532898 (arrayNoDuplicates!0 (_keys!10628 thiss!1141) #b00000000000000000000000000000000 Nil!19304))))

(assert (= (and start!80772 res!635574) b!946910))

(assert (= (and b!946910 res!635575) b!946908))

(assert (= (and b!946908 res!635577) b!946914))

(assert (= (and b!946914 (not res!635578)) b!946913))

(assert (= (and b!946913 (not res!635579)) b!946907))

(assert (= (and b!946907 (not res!635576)) b!946916))

(assert (= (and b!946912 condMapEmpty!32878) mapIsEmpty!32878))

(assert (= (and b!946912 (not condMapEmpty!32878)) mapNonEmpty!32878))

(assert (= (and mapNonEmpty!32878 ((_ is ValueCellFull!9854) mapValue!32878)) b!946911))

(assert (= (and b!946912 ((_ is ValueCellFull!9854) mapDefault!32878)) b!946915))

(assert (= b!946909 b!946912))

(assert (= start!80772 b!946909))

(declare-fun m!879457 () Bool)

(assert (=> b!946908 m!879457))

(declare-fun m!879459 () Bool)

(assert (=> b!946916 m!879459))

(declare-fun m!879461 () Bool)

(assert (=> start!80772 m!879461))

(declare-fun m!879463 () Bool)

(assert (=> b!946909 m!879463))

(declare-fun m!879465 () Bool)

(assert (=> b!946909 m!879465))

(declare-fun m!879467 () Bool)

(assert (=> mapNonEmpty!32878 m!879467))

(declare-fun m!879469 () Bool)

(assert (=> b!946914 m!879469))

(declare-fun m!879471 () Bool)

(assert (=> b!946914 m!879471))

(declare-fun m!879473 () Bool)

(assert (=> b!946914 m!879473))

(declare-fun m!879475 () Bool)

(assert (=> b!946907 m!879475))

(check-sat b_and!29559 tp_is_empty!20671 (not b_next!18163) (not b!946908) (not b!946907) (not b!946916) (not b!946909) (not mapNonEmpty!32878) (not b!946914) (not start!80772))
(check-sat b_and!29559 (not b_next!18163))
(get-model)

(declare-fun d!114451 () Bool)

(assert (=> d!114451 (= (validMask!0 (mask!27449 thiss!1141)) (and (or (= (mask!27449 thiss!1141) #b00000000000000000000000000000111) (= (mask!27449 thiss!1141) #b00000000000000000000000000001111) (= (mask!27449 thiss!1141) #b00000000000000000000000000011111) (= (mask!27449 thiss!1141) #b00000000000000000000000000111111) (= (mask!27449 thiss!1141) #b00000000000000000000000001111111) (= (mask!27449 thiss!1141) #b00000000000000000000000011111111) (= (mask!27449 thiss!1141) #b00000000000000000000000111111111) (= (mask!27449 thiss!1141) #b00000000000000000000001111111111) (= (mask!27449 thiss!1141) #b00000000000000000000011111111111) (= (mask!27449 thiss!1141) #b00000000000000000000111111111111) (= (mask!27449 thiss!1141) #b00000000000000000001111111111111) (= (mask!27449 thiss!1141) #b00000000000000000011111111111111) (= (mask!27449 thiss!1141) #b00000000000000000111111111111111) (= (mask!27449 thiss!1141) #b00000000000000001111111111111111) (= (mask!27449 thiss!1141) #b00000000000000011111111111111111) (= (mask!27449 thiss!1141) #b00000000000000111111111111111111) (= (mask!27449 thiss!1141) #b00000000000001111111111111111111) (= (mask!27449 thiss!1141) #b00000000000011111111111111111111) (= (mask!27449 thiss!1141) #b00000000000111111111111111111111) (= (mask!27449 thiss!1141) #b00000000001111111111111111111111) (= (mask!27449 thiss!1141) #b00000000011111111111111111111111) (= (mask!27449 thiss!1141) #b00000000111111111111111111111111) (= (mask!27449 thiss!1141) #b00000001111111111111111111111111) (= (mask!27449 thiss!1141) #b00000011111111111111111111111111) (= (mask!27449 thiss!1141) #b00000111111111111111111111111111) (= (mask!27449 thiss!1141) #b00001111111111111111111111111111) (= (mask!27449 thiss!1141) #b00011111111111111111111111111111) (= (mask!27449 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27449 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946914 d!114451))

(declare-fun d!114453 () Bool)

(declare-fun res!635620 () Bool)

(declare-fun e!532956 () Bool)

(assert (=> d!114453 (=> res!635620 e!532956)))

(assert (=> d!114453 (= res!635620 (= (select (arr!27564 (_keys!10628 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114453 (= (arrayContainsKey!0 (_keys!10628 thiss!1141) key!756 #b00000000000000000000000000000000) e!532956)))

(declare-fun b!946981 () Bool)

(declare-fun e!532957 () Bool)

(assert (=> b!946981 (= e!532956 e!532957)))

(declare-fun res!635621 () Bool)

(assert (=> b!946981 (=> (not res!635621) (not e!532957))))

(assert (=> b!946981 (= res!635621 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28039 (_keys!10628 thiss!1141))))))

(declare-fun b!946982 () Bool)

(assert (=> b!946982 (= e!532957 (arrayContainsKey!0 (_keys!10628 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114453 (not res!635620)) b!946981))

(assert (= (and b!946981 res!635621) b!946982))

(declare-fun m!879517 () Bool)

(assert (=> d!114453 m!879517))

(declare-fun m!879519 () Bool)

(assert (=> b!946982 m!879519))

(assert (=> b!946914 d!114453))

(declare-fun d!114455 () Bool)

(assert (=> d!114455 (arrayContainsKey!0 (_keys!10628 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426283 () Unit!31804)

(declare-fun choose!13 (array!57303 (_ BitVec 64) (_ BitVec 32)) Unit!31804)

(assert (=> d!114455 (= lt!426283 (choose!13 (_keys!10628 thiss!1141) key!756 (index!38816 lt!426267)))))

(assert (=> d!114455 (bvsge (index!38816 lt!426267) #b00000000000000000000000000000000)))

(assert (=> d!114455 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10628 thiss!1141) key!756 (index!38816 lt!426267)) lt!426283)))

(declare-fun bs!26591 () Bool)

(assert (= bs!26591 d!114455))

(assert (=> bs!26591 m!879471))

(declare-fun m!879521 () Bool)

(assert (=> bs!26591 m!879521))

(assert (=> b!946914 d!114455))

(declare-fun d!114457 () Bool)

(assert (=> d!114457 (= (array_inv!21458 (_keys!10628 thiss!1141)) (bvsge (size!28039 (_keys!10628 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946909 d!114457))

(declare-fun d!114459 () Bool)

(assert (=> d!114459 (= (array_inv!21459 (_values!5749 thiss!1141)) (bvsge (size!28038 (_values!5749 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946909 d!114459))

(declare-fun d!114461 () Bool)

(declare-fun res!635628 () Bool)

(declare-fun e!532960 () Bool)

(assert (=> d!114461 (=> (not res!635628) (not e!532960))))

(declare-fun simpleValid!362 (LongMapFixedSize!4858) Bool)

(assert (=> d!114461 (= res!635628 (simpleValid!362 thiss!1141))))

(assert (=> d!114461 (= (valid!1856 thiss!1141) e!532960)))

(declare-fun b!946989 () Bool)

(declare-fun res!635629 () Bool)

(assert (=> b!946989 (=> (not res!635629) (not e!532960))))

(declare-fun arrayCountValidKeys!0 (array!57303 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946989 (= res!635629 (= (arrayCountValidKeys!0 (_keys!10628 thiss!1141) #b00000000000000000000000000000000 (size!28039 (_keys!10628 thiss!1141))) (_size!2484 thiss!1141)))))

(declare-fun b!946990 () Bool)

(declare-fun res!635630 () Bool)

(assert (=> b!946990 (=> (not res!635630) (not e!532960))))

(assert (=> b!946990 (= res!635630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10628 thiss!1141) (mask!27449 thiss!1141)))))

(declare-fun b!946991 () Bool)

(assert (=> b!946991 (= e!532960 (arrayNoDuplicates!0 (_keys!10628 thiss!1141) #b00000000000000000000000000000000 Nil!19304))))

(assert (= (and d!114461 res!635628) b!946989))

(assert (= (and b!946989 res!635629) b!946990))

(assert (= (and b!946990 res!635630) b!946991))

(declare-fun m!879523 () Bool)

(assert (=> d!114461 m!879523))

(declare-fun m!879525 () Bool)

(assert (=> b!946989 m!879525))

(assert (=> b!946990 m!879475))

(assert (=> b!946991 m!879459))

(assert (=> start!80772 d!114461))

(declare-fun b!947004 () Bool)

(declare-fun e!532968 () SeekEntryResult!9111)

(assert (=> b!947004 (= e!532968 Undefined!9111)))

(declare-fun b!947005 () Bool)

(declare-fun e!532969 () SeekEntryResult!9111)

(declare-fun lt!426294 () SeekEntryResult!9111)

(assert (=> b!947005 (= e!532969 (MissingZero!9111 (index!38817 lt!426294)))))

(declare-fun b!947006 () Bool)

(declare-fun e!532967 () SeekEntryResult!9111)

(assert (=> b!947006 (= e!532968 e!532967)))

(declare-fun lt!426295 () (_ BitVec 64))

(assert (=> b!947006 (= lt!426295 (select (arr!27564 (_keys!10628 thiss!1141)) (index!38817 lt!426294)))))

(declare-fun c!98615 () Bool)

(assert (=> b!947006 (= c!98615 (= lt!426295 key!756))))

(declare-fun b!947007 () Bool)

(declare-fun c!98614 () Bool)

(assert (=> b!947007 (= c!98614 (= lt!426295 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947007 (= e!532967 e!532969)))

(declare-fun d!114463 () Bool)

(declare-fun lt!426293 () SeekEntryResult!9111)

(assert (=> d!114463 (and (or ((_ is MissingVacant!9111) lt!426293) (not ((_ is Found!9111) lt!426293)) (and (bvsge (index!38816 lt!426293) #b00000000000000000000000000000000) (bvslt (index!38816 lt!426293) (size!28039 (_keys!10628 thiss!1141))))) (not ((_ is MissingVacant!9111) lt!426293)) (or (not ((_ is Found!9111) lt!426293)) (= (select (arr!27564 (_keys!10628 thiss!1141)) (index!38816 lt!426293)) key!756)))))

(assert (=> d!114463 (= lt!426293 e!532968)))

(declare-fun c!98616 () Bool)

(assert (=> d!114463 (= c!98616 (and ((_ is Intermediate!9111) lt!426294) (undefined!9923 lt!426294)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57303 (_ BitVec 32)) SeekEntryResult!9111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114463 (= lt!426294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27449 thiss!1141)) key!756 (_keys!10628 thiss!1141) (mask!27449 thiss!1141)))))

(assert (=> d!114463 (validMask!0 (mask!27449 thiss!1141))))

(assert (=> d!114463 (= (seekEntry!0 key!756 (_keys!10628 thiss!1141) (mask!27449 thiss!1141)) lt!426293)))

(declare-fun b!947008 () Bool)

(assert (=> b!947008 (= e!532967 (Found!9111 (index!38817 lt!426294)))))

(declare-fun b!947009 () Bool)

(declare-fun lt!426292 () SeekEntryResult!9111)

(assert (=> b!947009 (= e!532969 (ite ((_ is MissingVacant!9111) lt!426292) (MissingZero!9111 (index!38818 lt!426292)) lt!426292))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57303 (_ BitVec 32)) SeekEntryResult!9111)

(assert (=> b!947009 (= lt!426292 (seekKeyOrZeroReturnVacant!0 (x!81474 lt!426294) (index!38817 lt!426294) (index!38817 lt!426294) key!756 (_keys!10628 thiss!1141) (mask!27449 thiss!1141)))))

(assert (= (and d!114463 c!98616) b!947004))

(assert (= (and d!114463 (not c!98616)) b!947006))

(assert (= (and b!947006 c!98615) b!947008))

(assert (= (and b!947006 (not c!98615)) b!947007))

(assert (= (and b!947007 c!98614) b!947005))

(assert (= (and b!947007 (not c!98614)) b!947009))

(declare-fun m!879527 () Bool)

(assert (=> b!947006 m!879527))

(declare-fun m!879529 () Bool)

(assert (=> d!114463 m!879529))

(declare-fun m!879531 () Bool)

(assert (=> d!114463 m!879531))

(assert (=> d!114463 m!879531))

(declare-fun m!879533 () Bool)

(assert (=> d!114463 m!879533))

(assert (=> d!114463 m!879469))

(declare-fun m!879535 () Bool)

(assert (=> b!947009 m!879535))

(assert (=> b!946908 d!114463))

(declare-fun b!947018 () Bool)

(declare-fun e!532976 () Bool)

(declare-fun call!41083 () Bool)

(assert (=> b!947018 (= e!532976 call!41083)))

(declare-fun d!114465 () Bool)

(declare-fun res!635635 () Bool)

(declare-fun e!532978 () Bool)

(assert (=> d!114465 (=> res!635635 e!532978)))

(assert (=> d!114465 (= res!635635 (bvsge #b00000000000000000000000000000000 (size!28039 (_keys!10628 thiss!1141))))))

(assert (=> d!114465 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10628 thiss!1141) (mask!27449 thiss!1141)) e!532978)))

(declare-fun bm!41080 () Bool)

(assert (=> bm!41080 (= call!41083 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10628 thiss!1141) (mask!27449 thiss!1141)))))

(declare-fun b!947019 () Bool)

(assert (=> b!947019 (= e!532978 e!532976)))

(declare-fun c!98619 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947019 (= c!98619 (validKeyInArray!0 (select (arr!27564 (_keys!10628 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947020 () Bool)

(declare-fun e!532977 () Bool)

(assert (=> b!947020 (= e!532976 e!532977)))

(declare-fun lt!426304 () (_ BitVec 64))

(assert (=> b!947020 (= lt!426304 (select (arr!27564 (_keys!10628 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426302 () Unit!31804)

(assert (=> b!947020 (= lt!426302 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10628 thiss!1141) lt!426304 #b00000000000000000000000000000000))))

(assert (=> b!947020 (arrayContainsKey!0 (_keys!10628 thiss!1141) lt!426304 #b00000000000000000000000000000000)))

(declare-fun lt!426303 () Unit!31804)

(assert (=> b!947020 (= lt!426303 lt!426302)))

(declare-fun res!635636 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57303 (_ BitVec 32)) SeekEntryResult!9111)

(assert (=> b!947020 (= res!635636 (= (seekEntryOrOpen!0 (select (arr!27564 (_keys!10628 thiss!1141)) #b00000000000000000000000000000000) (_keys!10628 thiss!1141) (mask!27449 thiss!1141)) (Found!9111 #b00000000000000000000000000000000)))))

(assert (=> b!947020 (=> (not res!635636) (not e!532977))))

(declare-fun b!947021 () Bool)

(assert (=> b!947021 (= e!532977 call!41083)))

(assert (= (and d!114465 (not res!635635)) b!947019))

(assert (= (and b!947019 c!98619) b!947020))

(assert (= (and b!947019 (not c!98619)) b!947018))

(assert (= (and b!947020 res!635636) b!947021))

(assert (= (or b!947021 b!947018) bm!41080))

(declare-fun m!879537 () Bool)

(assert (=> bm!41080 m!879537))

(assert (=> b!947019 m!879517))

(assert (=> b!947019 m!879517))

(declare-fun m!879539 () Bool)

(assert (=> b!947019 m!879539))

(assert (=> b!947020 m!879517))

(declare-fun m!879541 () Bool)

(assert (=> b!947020 m!879541))

(declare-fun m!879543 () Bool)

(assert (=> b!947020 m!879543))

(assert (=> b!947020 m!879517))

(declare-fun m!879545 () Bool)

(assert (=> b!947020 m!879545))

(assert (=> b!946907 d!114465))

(declare-fun b!947032 () Bool)

(declare-fun e!532990 () Bool)

(declare-fun call!41086 () Bool)

(assert (=> b!947032 (= e!532990 call!41086)))

(declare-fun bm!41083 () Bool)

(declare-fun c!98622 () Bool)

(assert (=> bm!41083 (= call!41086 (arrayNoDuplicates!0 (_keys!10628 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98622 (Cons!19303 (select (arr!27564 (_keys!10628 thiss!1141)) #b00000000000000000000000000000000) Nil!19304) Nil!19304)))))

(declare-fun b!947034 () Bool)

(declare-fun e!532989 () Bool)

(declare-fun contains!5160 (List!19307 (_ BitVec 64)) Bool)

(assert (=> b!947034 (= e!532989 (contains!5160 Nil!19304 (select (arr!27564 (_keys!10628 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947035 () Bool)

(declare-fun e!532988 () Bool)

(assert (=> b!947035 (= e!532988 e!532990)))

(assert (=> b!947035 (= c!98622 (validKeyInArray!0 (select (arr!27564 (_keys!10628 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947036 () Bool)

(assert (=> b!947036 (= e!532990 call!41086)))

(declare-fun d!114467 () Bool)

(declare-fun res!635643 () Bool)

(declare-fun e!532987 () Bool)

(assert (=> d!114467 (=> res!635643 e!532987)))

(assert (=> d!114467 (= res!635643 (bvsge #b00000000000000000000000000000000 (size!28039 (_keys!10628 thiss!1141))))))

(assert (=> d!114467 (= (arrayNoDuplicates!0 (_keys!10628 thiss!1141) #b00000000000000000000000000000000 Nil!19304) e!532987)))

(declare-fun b!947033 () Bool)

(assert (=> b!947033 (= e!532987 e!532988)))

(declare-fun res!635645 () Bool)

(assert (=> b!947033 (=> (not res!635645) (not e!532988))))

(assert (=> b!947033 (= res!635645 (not e!532989))))

(declare-fun res!635644 () Bool)

(assert (=> b!947033 (=> (not res!635644) (not e!532989))))

(assert (=> b!947033 (= res!635644 (validKeyInArray!0 (select (arr!27564 (_keys!10628 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114467 (not res!635643)) b!947033))

(assert (= (and b!947033 res!635644) b!947034))

(assert (= (and b!947033 res!635645) b!947035))

(assert (= (and b!947035 c!98622) b!947032))

(assert (= (and b!947035 (not c!98622)) b!947036))

(assert (= (or b!947032 b!947036) bm!41083))

(assert (=> bm!41083 m!879517))

(declare-fun m!879547 () Bool)

(assert (=> bm!41083 m!879547))

(assert (=> b!947034 m!879517))

(assert (=> b!947034 m!879517))

(declare-fun m!879549 () Bool)

(assert (=> b!947034 m!879549))

(assert (=> b!947035 m!879517))

(assert (=> b!947035 m!879517))

(assert (=> b!947035 m!879539))

(assert (=> b!947033 m!879517))

(assert (=> b!947033 m!879517))

(assert (=> b!947033 m!879539))

(assert (=> b!946916 d!114467))

(declare-fun b!947044 () Bool)

(declare-fun e!532996 () Bool)

(assert (=> b!947044 (= e!532996 tp_is_empty!20671)))

(declare-fun mapNonEmpty!32887 () Bool)

(declare-fun mapRes!32887 () Bool)

(declare-fun tp!63061 () Bool)

(declare-fun e!532995 () Bool)

(assert (=> mapNonEmpty!32887 (= mapRes!32887 (and tp!63061 e!532995))))

(declare-fun mapValue!32887 () ValueCell!9854)

(declare-fun mapKey!32887 () (_ BitVec 32))

(declare-fun mapRest!32887 () (Array (_ BitVec 32) ValueCell!9854))

(assert (=> mapNonEmpty!32887 (= mapRest!32878 (store mapRest!32887 mapKey!32887 mapValue!32887))))

(declare-fun b!947043 () Bool)

(assert (=> b!947043 (= e!532995 tp_is_empty!20671)))

(declare-fun mapIsEmpty!32887 () Bool)

(assert (=> mapIsEmpty!32887 mapRes!32887))

(declare-fun condMapEmpty!32887 () Bool)

(declare-fun mapDefault!32887 () ValueCell!9854)

(assert (=> mapNonEmpty!32878 (= condMapEmpty!32887 (= mapRest!32878 ((as const (Array (_ BitVec 32) ValueCell!9854)) mapDefault!32887)))))

(assert (=> mapNonEmpty!32878 (= tp!63045 (and e!532996 mapRes!32887))))

(assert (= (and mapNonEmpty!32878 condMapEmpty!32887) mapIsEmpty!32887))

(assert (= (and mapNonEmpty!32878 (not condMapEmpty!32887)) mapNonEmpty!32887))

(assert (= (and mapNonEmpty!32887 ((_ is ValueCellFull!9854) mapValue!32887)) b!947043))

(assert (= (and mapNonEmpty!32878 ((_ is ValueCellFull!9854) mapDefault!32887)) b!947044))

(declare-fun m!879551 () Bool)

(assert (=> mapNonEmpty!32887 m!879551))

(check-sat (not b!947020) (not b!947033) (not b!946990) (not bm!41080) tp_is_empty!20671 (not b!947035) (not b!946982) (not d!114455) (not d!114461) (not d!114463) (not b!947034) (not b!947019) b_and!29559 (not mapNonEmpty!32887) (not b!947009) (not b_next!18163) (not b!946989) (not b!946991) (not bm!41083))
(check-sat b_and!29559 (not b_next!18163))
