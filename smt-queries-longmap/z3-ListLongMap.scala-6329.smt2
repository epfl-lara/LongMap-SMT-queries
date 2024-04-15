; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81522 () Bool)

(assert start!81522)

(declare-fun b!952445 () Bool)

(declare-fun b_free!18295 () Bool)

(declare-fun b_next!18295 () Bool)

(assert (=> b!952445 (= b_free!18295 (not b_next!18295))))

(declare-fun tp!63510 () Bool)

(declare-fun b_and!29751 () Bool)

(assert (=> b!952445 (= tp!63510 b_and!29751)))

(declare-fun mapIsEmpty!33145 () Bool)

(declare-fun mapRes!33145 () Bool)

(assert (=> mapIsEmpty!33145 mapRes!33145))

(declare-fun mapNonEmpty!33145 () Bool)

(declare-fun tp!63511 () Bool)

(declare-fun e!536396 () Bool)

(assert (=> mapNonEmpty!33145 (= mapRes!33145 (and tp!63511 e!536396))))

(declare-datatypes ((V!32703 0))(
  ( (V!32704 (val!10452 Int)) )
))
(declare-datatypes ((ValueCell!9920 0))(
  ( (ValueCellFull!9920 (v!13003 V!32703)) (EmptyCell!9920) )
))
(declare-fun mapRest!33145 () (Array (_ BitVec 32) ValueCell!9920))

(declare-fun mapValue!33145 () ValueCell!9920)

(declare-datatypes ((array!57607 0))(
  ( (array!57608 (arr!27695 (Array (_ BitVec 32) ValueCell!9920)) (size!28176 (_ BitVec 32))) )
))
(declare-datatypes ((array!57609 0))(
  ( (array!57610 (arr!27696 (Array (_ BitVec 32) (_ BitVec 64))) (size!28177 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4990 0))(
  ( (LongMapFixedSize!4991 (defaultEntry!5828 Int) (mask!27675 (_ BitVec 32)) (extraKeys!5560 (_ BitVec 32)) (zeroValue!5664 V!32703) (minValue!5664 V!32703) (_size!2550 (_ BitVec 32)) (_keys!10779 array!57609) (_values!5851 array!57607) (_vacant!2550 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4990)

(declare-fun mapKey!33145 () (_ BitVec 32))

(assert (=> mapNonEmpty!33145 (= (arr!27695 (_values!5851 thiss!1141)) (store mapRest!33145 mapKey!33145 mapValue!33145))))

(declare-fun b!952442 () Bool)

(declare-fun res!638078 () Bool)

(declare-fun e!536394 () Bool)

(assert (=> b!952442 (=> res!638078 e!536394)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57609 (_ BitVec 32)) Bool)

(assert (=> b!952442 (= res!638078 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10779 thiss!1141) (mask!27675 thiss!1141))))))

(declare-fun b!952443 () Bool)

(declare-fun res!638074 () Bool)

(declare-fun e!536393 () Bool)

(assert (=> b!952443 (=> (not res!638074) (not e!536393))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!952443 (= res!638074 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952444 () Bool)

(assert (=> b!952444 (= e!536393 (not e!536394))))

(declare-fun res!638075 () Bool)

(assert (=> b!952444 (=> res!638075 e!536394)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952444 (= res!638075 (not (validMask!0 (mask!27675 thiss!1141))))))

(declare-fun lt!429065 () (_ BitVec 32))

(assert (=> b!952444 (arrayForallSeekEntryOrOpenFound!0 lt!429065 (_keys!10779 thiss!1141) (mask!27675 thiss!1141))))

(declare-datatypes ((Unit!31921 0))(
  ( (Unit!31922) )
))
(declare-fun lt!429066 () Unit!31921)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31921)

(assert (=> b!952444 (= lt!429066 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10779 thiss!1141) (mask!27675 thiss!1141) #b00000000000000000000000000000000 lt!429065))))

(declare-fun arrayScanForKey!0 (array!57609 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952444 (= lt!429065 (arrayScanForKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952444 (arrayContainsKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429067 () Unit!31921)

(declare-fun lemmaKeyInListMapIsInArray!318 (array!57609 array!57607 (_ BitVec 32) (_ BitVec 32) V!32703 V!32703 (_ BitVec 64) Int) Unit!31921)

(assert (=> b!952444 (= lt!429067 (lemmaKeyInListMapIsInArray!318 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) key!756 (defaultEntry!5828 thiss!1141)))))

(declare-fun tp_is_empty!20803 () Bool)

(declare-fun e!536399 () Bool)

(declare-fun e!536397 () Bool)

(declare-fun array_inv!21554 (array!57609) Bool)

(declare-fun array_inv!21555 (array!57607) Bool)

(assert (=> b!952445 (= e!536397 (and tp!63510 tp_is_empty!20803 (array_inv!21554 (_keys!10779 thiss!1141)) (array_inv!21555 (_values!5851 thiss!1141)) e!536399))))

(declare-fun b!952446 () Bool)

(declare-fun res!638077 () Bool)

(assert (=> b!952446 (=> res!638077 e!536394)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952446 (= res!638077 (not (validKeyInArray!0 key!756)))))

(declare-fun b!952448 () Bool)

(declare-fun res!638072 () Bool)

(assert (=> b!952448 (=> (not res!638072) (not e!536393))))

(declare-datatypes ((tuple2!13630 0))(
  ( (tuple2!13631 (_1!6826 (_ BitVec 64)) (_2!6826 V!32703)) )
))
(declare-datatypes ((List!19369 0))(
  ( (Nil!19366) (Cons!19365 (h!20527 tuple2!13630) (t!27717 List!19369)) )
))
(declare-datatypes ((ListLongMap!12317 0))(
  ( (ListLongMap!12318 (toList!6174 List!19369)) )
))
(declare-fun contains!5212 (ListLongMap!12317 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3336 (array!57609 array!57607 (_ BitVec 32) (_ BitVec 32) V!32703 V!32703 (_ BitVec 32) Int) ListLongMap!12317)

(assert (=> b!952448 (= res!638072 (contains!5212 (getCurrentListMap!3336 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)) key!756))))

(declare-fun b!952449 () Bool)

(declare-fun e!536398 () Bool)

(assert (=> b!952449 (= e!536398 tp_is_empty!20803)))

(declare-fun b!952450 () Bool)

(declare-datatypes ((SeekEntryResult!9157 0))(
  ( (MissingZero!9157 (index!38999 (_ BitVec 32))) (Found!9157 (index!39000 (_ BitVec 32))) (Intermediate!9157 (undefined!9969 Bool) (index!39001 (_ BitVec 32)) (x!81948 (_ BitVec 32))) (Undefined!9157) (MissingVacant!9157 (index!39002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57609 (_ BitVec 32)) SeekEntryResult!9157)

(assert (=> b!952450 (= e!536394 (= (seekEntryOrOpen!0 key!756 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)) (Found!9157 lt!429065)))))

(declare-fun b!952451 () Bool)

(declare-fun res!638071 () Bool)

(assert (=> b!952451 (=> (not res!638071) (not e!536393))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57609 (_ BitVec 32)) SeekEntryResult!9157)

(assert (=> b!952451 (= res!638071 (not ((_ is Found!9157) (seekEntry!0 key!756 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)))))))

(declare-fun res!638073 () Bool)

(assert (=> start!81522 (=> (not res!638073) (not e!536393))))

(declare-fun valid!1904 (LongMapFixedSize!4990) Bool)

(assert (=> start!81522 (= res!638073 (valid!1904 thiss!1141))))

(assert (=> start!81522 e!536393))

(assert (=> start!81522 e!536397))

(assert (=> start!81522 true))

(declare-fun b!952447 () Bool)

(assert (=> b!952447 (= e!536396 tp_is_empty!20803)))

(declare-fun b!952452 () Bool)

(declare-fun res!638076 () Bool)

(assert (=> b!952452 (=> res!638076 e!536394)))

(assert (=> b!952452 (= res!638076 (not (= (size!28177 (_keys!10779 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27675 thiss!1141)))))))

(declare-fun b!952453 () Bool)

(assert (=> b!952453 (= e!536399 (and e!536398 mapRes!33145))))

(declare-fun condMapEmpty!33145 () Bool)

(declare-fun mapDefault!33145 () ValueCell!9920)

(assert (=> b!952453 (= condMapEmpty!33145 (= (arr!27695 (_values!5851 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9920)) mapDefault!33145)))))

(assert (= (and start!81522 res!638073) b!952443))

(assert (= (and b!952443 res!638074) b!952451))

(assert (= (and b!952451 res!638071) b!952448))

(assert (= (and b!952448 res!638072) b!952444))

(assert (= (and b!952444 (not res!638075)) b!952452))

(assert (= (and b!952452 (not res!638076)) b!952442))

(assert (= (and b!952442 (not res!638078)) b!952446))

(assert (= (and b!952446 (not res!638077)) b!952450))

(assert (= (and b!952453 condMapEmpty!33145) mapIsEmpty!33145))

(assert (= (and b!952453 (not condMapEmpty!33145)) mapNonEmpty!33145))

(assert (= (and mapNonEmpty!33145 ((_ is ValueCellFull!9920) mapValue!33145)) b!952447))

(assert (= (and b!952453 ((_ is ValueCellFull!9920) mapDefault!33145)) b!952449))

(assert (= b!952445 b!952453))

(assert (= start!81522 b!952445))

(declare-fun m!884041 () Bool)

(assert (=> b!952445 m!884041))

(declare-fun m!884043 () Bool)

(assert (=> b!952445 m!884043))

(declare-fun m!884045 () Bool)

(assert (=> b!952444 m!884045))

(declare-fun m!884047 () Bool)

(assert (=> b!952444 m!884047))

(declare-fun m!884049 () Bool)

(assert (=> b!952444 m!884049))

(declare-fun m!884051 () Bool)

(assert (=> b!952444 m!884051))

(declare-fun m!884053 () Bool)

(assert (=> b!952444 m!884053))

(declare-fun m!884055 () Bool)

(assert (=> b!952444 m!884055))

(declare-fun m!884057 () Bool)

(assert (=> b!952446 m!884057))

(declare-fun m!884059 () Bool)

(assert (=> start!81522 m!884059))

(declare-fun m!884061 () Bool)

(assert (=> b!952448 m!884061))

(assert (=> b!952448 m!884061))

(declare-fun m!884063 () Bool)

(assert (=> b!952448 m!884063))

(declare-fun m!884065 () Bool)

(assert (=> b!952451 m!884065))

(declare-fun m!884067 () Bool)

(assert (=> b!952442 m!884067))

(declare-fun m!884069 () Bool)

(assert (=> mapNonEmpty!33145 m!884069))

(declare-fun m!884071 () Bool)

(assert (=> b!952450 m!884071))

(check-sat (not b!952445) b_and!29751 (not b_next!18295) tp_is_empty!20803 (not b!952444) (not b!952450) (not b!952451) (not mapNonEmpty!33145) (not start!81522) (not b!952446) (not b!952442) (not b!952448))
(check-sat b_and!29751 (not b_next!18295))
(get-model)

(declare-fun d!115363 () Bool)

(assert (=> d!115363 (= (array_inv!21554 (_keys!10779 thiss!1141)) (bvsge (size!28177 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952445 d!115363))

(declare-fun d!115365 () Bool)

(assert (=> d!115365 (= (array_inv!21555 (_values!5851 thiss!1141)) (bvsge (size!28176 (_values!5851 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952445 d!115365))

(declare-fun d!115367 () Bool)

(declare-fun lt!429094 () SeekEntryResult!9157)

(assert (=> d!115367 (and (or ((_ is Undefined!9157) lt!429094) (not ((_ is Found!9157) lt!429094)) (and (bvsge (index!39000 lt!429094) #b00000000000000000000000000000000) (bvslt (index!39000 lt!429094) (size!28177 (_keys!10779 thiss!1141))))) (or ((_ is Undefined!9157) lt!429094) ((_ is Found!9157) lt!429094) (not ((_ is MissingZero!9157) lt!429094)) (and (bvsge (index!38999 lt!429094) #b00000000000000000000000000000000) (bvslt (index!38999 lt!429094) (size!28177 (_keys!10779 thiss!1141))))) (or ((_ is Undefined!9157) lt!429094) ((_ is Found!9157) lt!429094) ((_ is MissingZero!9157) lt!429094) (not ((_ is MissingVacant!9157) lt!429094)) (and (bvsge (index!39002 lt!429094) #b00000000000000000000000000000000) (bvslt (index!39002 lt!429094) (size!28177 (_keys!10779 thiss!1141))))) (or ((_ is Undefined!9157) lt!429094) (ite ((_ is Found!9157) lt!429094) (= (select (arr!27696 (_keys!10779 thiss!1141)) (index!39000 lt!429094)) key!756) (ite ((_ is MissingZero!9157) lt!429094) (= (select (arr!27696 (_keys!10779 thiss!1141)) (index!38999 lt!429094)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9157) lt!429094) (= (select (arr!27696 (_keys!10779 thiss!1141)) (index!39002 lt!429094)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!536448 () SeekEntryResult!9157)

(assert (=> d!115367 (= lt!429094 e!536448)))

(declare-fun c!99628 () Bool)

(declare-fun lt!429092 () SeekEntryResult!9157)

(assert (=> d!115367 (= c!99628 (and ((_ is Intermediate!9157) lt!429092) (undefined!9969 lt!429092)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57609 (_ BitVec 32)) SeekEntryResult!9157)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115367 (= lt!429092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27675 thiss!1141)) key!756 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)))))

(assert (=> d!115367 (validMask!0 (mask!27675 thiss!1141))))

(assert (=> d!115367 (= (seekEntryOrOpen!0 key!756 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)) lt!429094)))

(declare-fun b!952538 () Bool)

(declare-fun e!536449 () SeekEntryResult!9157)

(assert (=> b!952538 (= e!536449 (Found!9157 (index!39001 lt!429092)))))

(declare-fun b!952539 () Bool)

(declare-fun c!99627 () Bool)

(declare-fun lt!429093 () (_ BitVec 64))

(assert (=> b!952539 (= c!99627 (= lt!429093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536450 () SeekEntryResult!9157)

(assert (=> b!952539 (= e!536449 e!536450)))

(declare-fun b!952540 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57609 (_ BitVec 32)) SeekEntryResult!9157)

(assert (=> b!952540 (= e!536450 (seekKeyOrZeroReturnVacant!0 (x!81948 lt!429092) (index!39001 lt!429092) (index!39001 lt!429092) key!756 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)))))

(declare-fun b!952541 () Bool)

(assert (=> b!952541 (= e!536448 e!536449)))

(assert (=> b!952541 (= lt!429093 (select (arr!27696 (_keys!10779 thiss!1141)) (index!39001 lt!429092)))))

(declare-fun c!99626 () Bool)

(assert (=> b!952541 (= c!99626 (= lt!429093 key!756))))

(declare-fun b!952542 () Bool)

(assert (=> b!952542 (= e!536450 (MissingZero!9157 (index!39001 lt!429092)))))

(declare-fun b!952543 () Bool)

(assert (=> b!952543 (= e!536448 Undefined!9157)))

(assert (= (and d!115367 c!99628) b!952543))

(assert (= (and d!115367 (not c!99628)) b!952541))

(assert (= (and b!952541 c!99626) b!952538))

(assert (= (and b!952541 (not c!99626)) b!952539))

(assert (= (and b!952539 c!99627) b!952542))

(assert (= (and b!952539 (not c!99627)) b!952540))

(declare-fun m!884137 () Bool)

(assert (=> d!115367 m!884137))

(declare-fun m!884139 () Bool)

(assert (=> d!115367 m!884139))

(declare-fun m!884141 () Bool)

(assert (=> d!115367 m!884141))

(declare-fun m!884143 () Bool)

(assert (=> d!115367 m!884143))

(declare-fun m!884145 () Bool)

(assert (=> d!115367 m!884145))

(assert (=> d!115367 m!884137))

(assert (=> d!115367 m!884051))

(declare-fun m!884147 () Bool)

(assert (=> b!952540 m!884147))

(declare-fun m!884149 () Bool)

(assert (=> b!952541 m!884149))

(assert (=> b!952450 d!115367))

(declare-fun d!115369 () Bool)

(declare-fun res!638131 () Bool)

(declare-fun e!536455 () Bool)

(assert (=> d!115369 (=> res!638131 e!536455)))

(assert (=> d!115369 (= res!638131 (= (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115369 (= (arrayContainsKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000) e!536455)))

(declare-fun b!952548 () Bool)

(declare-fun e!536456 () Bool)

(assert (=> b!952548 (= e!536455 e!536456)))

(declare-fun res!638132 () Bool)

(assert (=> b!952548 (=> (not res!638132) (not e!536456))))

(assert (=> b!952548 (= res!638132 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28177 (_keys!10779 thiss!1141))))))

(declare-fun b!952549 () Bool)

(assert (=> b!952549 (= e!536456 (arrayContainsKey!0 (_keys!10779 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115369 (not res!638131)) b!952548))

(assert (= (and b!952548 res!638132) b!952549))

(declare-fun m!884151 () Bool)

(assert (=> d!115369 m!884151))

(declare-fun m!884153 () Bool)

(assert (=> b!952549 m!884153))

(assert (=> b!952444 d!115369))

(declare-fun d!115371 () Bool)

(declare-fun e!536459 () Bool)

(assert (=> d!115371 e!536459))

(declare-fun c!99631 () Bool)

(assert (=> d!115371 (= c!99631 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429097 () Unit!31921)

(declare-fun choose!1608 (array!57609 array!57607 (_ BitVec 32) (_ BitVec 32) V!32703 V!32703 (_ BitVec 64) Int) Unit!31921)

(assert (=> d!115371 (= lt!429097 (choose!1608 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) key!756 (defaultEntry!5828 thiss!1141)))))

(assert (=> d!115371 (validMask!0 (mask!27675 thiss!1141))))

(assert (=> d!115371 (= (lemmaKeyInListMapIsInArray!318 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) key!756 (defaultEntry!5828 thiss!1141)) lt!429097)))

(declare-fun b!952554 () Bool)

(assert (=> b!952554 (= e!536459 (arrayContainsKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952555 () Bool)

(assert (=> b!952555 (= e!536459 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115371 c!99631) b!952554))

(assert (= (and d!115371 (not c!99631)) b!952555))

(declare-fun m!884155 () Bool)

(assert (=> d!115371 m!884155))

(assert (=> d!115371 m!884051))

(assert (=> b!952554 m!884055))

(assert (=> b!952444 d!115371))

(declare-fun d!115373 () Bool)

(assert (=> d!115373 (arrayForallSeekEntryOrOpenFound!0 lt!429065 (_keys!10779 thiss!1141) (mask!27675 thiss!1141))))

(declare-fun lt!429100 () Unit!31921)

(declare-fun choose!38 (array!57609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31921)

(assert (=> d!115373 (= lt!429100 (choose!38 (_keys!10779 thiss!1141) (mask!27675 thiss!1141) #b00000000000000000000000000000000 lt!429065))))

(assert (=> d!115373 (validMask!0 (mask!27675 thiss!1141))))

(assert (=> d!115373 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10779 thiss!1141) (mask!27675 thiss!1141) #b00000000000000000000000000000000 lt!429065) lt!429100)))

(declare-fun bs!26734 () Bool)

(assert (= bs!26734 d!115373))

(assert (=> bs!26734 m!884049))

(declare-fun m!884157 () Bool)

(assert (=> bs!26734 m!884157))

(assert (=> bs!26734 m!884051))

(assert (=> b!952444 d!115373))

(declare-fun d!115375 () Bool)

(declare-fun lt!429103 () (_ BitVec 32))

(assert (=> d!115375 (and (or (bvslt lt!429103 #b00000000000000000000000000000000) (bvsge lt!429103 (size!28177 (_keys!10779 thiss!1141))) (and (bvsge lt!429103 #b00000000000000000000000000000000) (bvslt lt!429103 (size!28177 (_keys!10779 thiss!1141))))) (bvsge lt!429103 #b00000000000000000000000000000000) (bvslt lt!429103 (size!28177 (_keys!10779 thiss!1141))) (= (select (arr!27696 (_keys!10779 thiss!1141)) lt!429103) key!756))))

(declare-fun e!536462 () (_ BitVec 32))

(assert (=> d!115375 (= lt!429103 e!536462)))

(declare-fun c!99634 () Bool)

(assert (=> d!115375 (= c!99634 (= (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115375 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10779 thiss!1141))) (bvslt (size!28177 (_keys!10779 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115375 (= (arrayScanForKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429103)))

(declare-fun b!952560 () Bool)

(assert (=> b!952560 (= e!536462 #b00000000000000000000000000000000)))

(declare-fun b!952561 () Bool)

(assert (=> b!952561 (= e!536462 (arrayScanForKey!0 (_keys!10779 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115375 c!99634) b!952560))

(assert (= (and d!115375 (not c!99634)) b!952561))

(declare-fun m!884159 () Bool)

(assert (=> d!115375 m!884159))

(assert (=> d!115375 m!884151))

(declare-fun m!884161 () Bool)

(assert (=> b!952561 m!884161))

(assert (=> b!952444 d!115375))

(declare-fun d!115377 () Bool)

(assert (=> d!115377 (= (validMask!0 (mask!27675 thiss!1141)) (and (or (= (mask!27675 thiss!1141) #b00000000000000000000000000000111) (= (mask!27675 thiss!1141) #b00000000000000000000000000001111) (= (mask!27675 thiss!1141) #b00000000000000000000000000011111) (= (mask!27675 thiss!1141) #b00000000000000000000000000111111) (= (mask!27675 thiss!1141) #b00000000000000000000000001111111) (= (mask!27675 thiss!1141) #b00000000000000000000000011111111) (= (mask!27675 thiss!1141) #b00000000000000000000000111111111) (= (mask!27675 thiss!1141) #b00000000000000000000001111111111) (= (mask!27675 thiss!1141) #b00000000000000000000011111111111) (= (mask!27675 thiss!1141) #b00000000000000000000111111111111) (= (mask!27675 thiss!1141) #b00000000000000000001111111111111) (= (mask!27675 thiss!1141) #b00000000000000000011111111111111) (= (mask!27675 thiss!1141) #b00000000000000000111111111111111) (= (mask!27675 thiss!1141) #b00000000000000001111111111111111) (= (mask!27675 thiss!1141) #b00000000000000011111111111111111) (= (mask!27675 thiss!1141) #b00000000000000111111111111111111) (= (mask!27675 thiss!1141) #b00000000000001111111111111111111) (= (mask!27675 thiss!1141) #b00000000000011111111111111111111) (= (mask!27675 thiss!1141) #b00000000000111111111111111111111) (= (mask!27675 thiss!1141) #b00000000001111111111111111111111) (= (mask!27675 thiss!1141) #b00000000011111111111111111111111) (= (mask!27675 thiss!1141) #b00000000111111111111111111111111) (= (mask!27675 thiss!1141) #b00000001111111111111111111111111) (= (mask!27675 thiss!1141) #b00000011111111111111111111111111) (= (mask!27675 thiss!1141) #b00000111111111111111111111111111) (= (mask!27675 thiss!1141) #b00001111111111111111111111111111) (= (mask!27675 thiss!1141) #b00011111111111111111111111111111) (= (mask!27675 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27675 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!952444 d!115377))

(declare-fun b!952570 () Bool)

(declare-fun e!536469 () Bool)

(declare-fun e!536470 () Bool)

(assert (=> b!952570 (= e!536469 e!536470)))

(declare-fun c!99637 () Bool)

(assert (=> b!952570 (= c!99637 (validKeyInArray!0 (select (arr!27696 (_keys!10779 thiss!1141)) lt!429065)))))

(declare-fun b!952571 () Bool)

(declare-fun e!536471 () Bool)

(assert (=> b!952571 (= e!536470 e!536471)))

(declare-fun lt!429110 () (_ BitVec 64))

(assert (=> b!952571 (= lt!429110 (select (arr!27696 (_keys!10779 thiss!1141)) lt!429065))))

(declare-fun lt!429111 () Unit!31921)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57609 (_ BitVec 64) (_ BitVec 32)) Unit!31921)

(assert (=> b!952571 (= lt!429111 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10779 thiss!1141) lt!429110 lt!429065))))

(assert (=> b!952571 (arrayContainsKey!0 (_keys!10779 thiss!1141) lt!429110 #b00000000000000000000000000000000)))

(declare-fun lt!429112 () Unit!31921)

(assert (=> b!952571 (= lt!429112 lt!429111)))

(declare-fun res!638138 () Bool)

(assert (=> b!952571 (= res!638138 (= (seekEntryOrOpen!0 (select (arr!27696 (_keys!10779 thiss!1141)) lt!429065) (_keys!10779 thiss!1141) (mask!27675 thiss!1141)) (Found!9157 lt!429065)))))

(assert (=> b!952571 (=> (not res!638138) (not e!536471))))

(declare-fun b!952572 () Bool)

(declare-fun call!41576 () Bool)

(assert (=> b!952572 (= e!536470 call!41576)))

(declare-fun b!952573 () Bool)

(assert (=> b!952573 (= e!536471 call!41576)))

(declare-fun d!115379 () Bool)

(declare-fun res!638137 () Bool)

(assert (=> d!115379 (=> res!638137 e!536469)))

(assert (=> d!115379 (= res!638137 (bvsge lt!429065 (size!28177 (_keys!10779 thiss!1141))))))

(assert (=> d!115379 (= (arrayForallSeekEntryOrOpenFound!0 lt!429065 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)) e!536469)))

(declare-fun bm!41573 () Bool)

(assert (=> bm!41573 (= call!41576 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429065 #b00000000000000000000000000000001) (_keys!10779 thiss!1141) (mask!27675 thiss!1141)))))

(assert (= (and d!115379 (not res!638137)) b!952570))

(assert (= (and b!952570 c!99637) b!952571))

(assert (= (and b!952570 (not c!99637)) b!952572))

(assert (= (and b!952571 res!638138) b!952573))

(assert (= (or b!952573 b!952572) bm!41573))

(declare-fun m!884163 () Bool)

(assert (=> b!952570 m!884163))

(assert (=> b!952570 m!884163))

(declare-fun m!884165 () Bool)

(assert (=> b!952570 m!884165))

(assert (=> b!952571 m!884163))

(declare-fun m!884167 () Bool)

(assert (=> b!952571 m!884167))

(declare-fun m!884169 () Bool)

(assert (=> b!952571 m!884169))

(assert (=> b!952571 m!884163))

(declare-fun m!884171 () Bool)

(assert (=> b!952571 m!884171))

(declare-fun m!884173 () Bool)

(assert (=> bm!41573 m!884173))

(assert (=> b!952444 d!115379))

(declare-fun d!115381 () Bool)

(declare-fun res!638145 () Bool)

(declare-fun e!536474 () Bool)

(assert (=> d!115381 (=> (not res!638145) (not e!536474))))

(declare-fun simpleValid!383 (LongMapFixedSize!4990) Bool)

(assert (=> d!115381 (= res!638145 (simpleValid!383 thiss!1141))))

(assert (=> d!115381 (= (valid!1904 thiss!1141) e!536474)))

(declare-fun b!952580 () Bool)

(declare-fun res!638146 () Bool)

(assert (=> b!952580 (=> (not res!638146) (not e!536474))))

(declare-fun arrayCountValidKeys!0 (array!57609 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952580 (= res!638146 (= (arrayCountValidKeys!0 (_keys!10779 thiss!1141) #b00000000000000000000000000000000 (size!28177 (_keys!10779 thiss!1141))) (_size!2550 thiss!1141)))))

(declare-fun b!952581 () Bool)

(declare-fun res!638147 () Bool)

(assert (=> b!952581 (=> (not res!638147) (not e!536474))))

(assert (=> b!952581 (= res!638147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)))))

(declare-fun b!952582 () Bool)

(declare-datatypes ((List!19371 0))(
  ( (Nil!19368) (Cons!19367 (h!20529 (_ BitVec 64)) (t!27721 List!19371)) )
))
(declare-fun arrayNoDuplicates!0 (array!57609 (_ BitVec 32) List!19371) Bool)

(assert (=> b!952582 (= e!536474 (arrayNoDuplicates!0 (_keys!10779 thiss!1141) #b00000000000000000000000000000000 Nil!19368))))

(assert (= (and d!115381 res!638145) b!952580))

(assert (= (and b!952580 res!638146) b!952581))

(assert (= (and b!952581 res!638147) b!952582))

(declare-fun m!884175 () Bool)

(assert (=> d!115381 m!884175))

(declare-fun m!884177 () Bool)

(assert (=> b!952580 m!884177))

(assert (=> b!952581 m!884067))

(declare-fun m!884179 () Bool)

(assert (=> b!952582 m!884179))

(assert (=> start!81522 d!115381))

(declare-fun d!115383 () Bool)

(declare-fun e!536480 () Bool)

(assert (=> d!115383 e!536480))

(declare-fun res!638150 () Bool)

(assert (=> d!115383 (=> res!638150 e!536480)))

(declare-fun lt!429124 () Bool)

(assert (=> d!115383 (= res!638150 (not lt!429124))))

(declare-fun lt!429121 () Bool)

(assert (=> d!115383 (= lt!429124 lt!429121)))

(declare-fun lt!429122 () Unit!31921)

(declare-fun e!536479 () Unit!31921)

(assert (=> d!115383 (= lt!429122 e!536479)))

(declare-fun c!99640 () Bool)

(assert (=> d!115383 (= c!99640 lt!429121)))

(declare-fun containsKey!473 (List!19369 (_ BitVec 64)) Bool)

(assert (=> d!115383 (= lt!429121 (containsKey!473 (toList!6174 (getCurrentListMap!3336 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141))) key!756))))

(assert (=> d!115383 (= (contains!5212 (getCurrentListMap!3336 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)) key!756) lt!429124)))

(declare-fun b!952589 () Bool)

(declare-fun lt!429123 () Unit!31921)

(assert (=> b!952589 (= e!536479 lt!429123)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!368 (List!19369 (_ BitVec 64)) Unit!31921)

(assert (=> b!952589 (= lt!429123 (lemmaContainsKeyImpliesGetValueByKeyDefined!368 (toList!6174 (getCurrentListMap!3336 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141))) key!756))))

(declare-datatypes ((Option!515 0))(
  ( (Some!514 (v!13006 V!32703)) (None!513) )
))
(declare-fun isDefined!381 (Option!515) Bool)

(declare-fun getValueByKey!509 (List!19369 (_ BitVec 64)) Option!515)

(assert (=> b!952589 (isDefined!381 (getValueByKey!509 (toList!6174 (getCurrentListMap!3336 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141))) key!756))))

(declare-fun b!952590 () Bool)

(declare-fun Unit!31925 () Unit!31921)

(assert (=> b!952590 (= e!536479 Unit!31925)))

(declare-fun b!952591 () Bool)

(assert (=> b!952591 (= e!536480 (isDefined!381 (getValueByKey!509 (toList!6174 (getCurrentListMap!3336 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141))) key!756)))))

(assert (= (and d!115383 c!99640) b!952589))

(assert (= (and d!115383 (not c!99640)) b!952590))

(assert (= (and d!115383 (not res!638150)) b!952591))

(declare-fun m!884181 () Bool)

(assert (=> d!115383 m!884181))

(declare-fun m!884183 () Bool)

(assert (=> b!952589 m!884183))

(declare-fun m!884185 () Bool)

(assert (=> b!952589 m!884185))

(assert (=> b!952589 m!884185))

(declare-fun m!884187 () Bool)

(assert (=> b!952589 m!884187))

(assert (=> b!952591 m!884185))

(assert (=> b!952591 m!884185))

(assert (=> b!952591 m!884187))

(assert (=> b!952448 d!115383))

(declare-fun bm!41588 () Bool)

(declare-fun call!41593 () ListLongMap!12317)

(declare-fun call!41597 () ListLongMap!12317)

(assert (=> bm!41588 (= call!41593 call!41597)))

(declare-fun b!952634 () Bool)

(declare-fun c!99653 () Bool)

(assert (=> b!952634 (= c!99653 (and (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!536509 () ListLongMap!12317)

(declare-fun e!536508 () ListLongMap!12317)

(assert (=> b!952634 (= e!536509 e!536508)))

(declare-fun b!952635 () Bool)

(declare-fun e!536516 () Bool)

(declare-fun lt!429174 () ListLongMap!12317)

(declare-fun apply!880 (ListLongMap!12317 (_ BitVec 64)) V!32703)

(assert (=> b!952635 (= e!536516 (= (apply!880 lt!429174 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5664 thiss!1141)))))

(declare-fun b!952636 () Bool)

(declare-fun e!536515 () ListLongMap!12317)

(assert (=> b!952636 (= e!536515 e!536509)))

(declare-fun c!99657 () Bool)

(assert (=> b!952636 (= c!99657 (and (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952637 () Bool)

(declare-fun e!536514 () Bool)

(declare-fun call!41596 () Bool)

(assert (=> b!952637 (= e!536514 (not call!41596))))

(declare-fun b!952638 () Bool)

(declare-fun +!2890 (ListLongMap!12317 tuple2!13630) ListLongMap!12317)

(assert (=> b!952638 (= e!536515 (+!2890 call!41597 (tuple2!13631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5664 thiss!1141))))))

(declare-fun bm!41589 () Bool)

(assert (=> bm!41589 (= call!41596 (contains!5212 lt!429174 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952639 () Bool)

(declare-fun e!536513 () Unit!31921)

(declare-fun lt!429171 () Unit!31921)

(assert (=> b!952639 (= e!536513 lt!429171)))

(declare-fun lt!429182 () ListLongMap!12317)

(declare-fun getCurrentListMapNoExtraKeys!3362 (array!57609 array!57607 (_ BitVec 32) (_ BitVec 32) V!32703 V!32703 (_ BitVec 32) Int) ListLongMap!12317)

(assert (=> b!952639 (= lt!429182 (getCurrentListMapNoExtraKeys!3362 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun lt!429172 () (_ BitVec 64))

(assert (=> b!952639 (= lt!429172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429186 () (_ BitVec 64))

(assert (=> b!952639 (= lt!429186 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429169 () Unit!31921)

(declare-fun addStillContains!579 (ListLongMap!12317 (_ BitVec 64) V!32703 (_ BitVec 64)) Unit!31921)

(assert (=> b!952639 (= lt!429169 (addStillContains!579 lt!429182 lt!429172 (zeroValue!5664 thiss!1141) lt!429186))))

(assert (=> b!952639 (contains!5212 (+!2890 lt!429182 (tuple2!13631 lt!429172 (zeroValue!5664 thiss!1141))) lt!429186)))

(declare-fun lt!429178 () Unit!31921)

(assert (=> b!952639 (= lt!429178 lt!429169)))

(declare-fun lt!429173 () ListLongMap!12317)

(assert (=> b!952639 (= lt!429173 (getCurrentListMapNoExtraKeys!3362 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun lt!429170 () (_ BitVec 64))

(assert (=> b!952639 (= lt!429170 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429188 () (_ BitVec 64))

(assert (=> b!952639 (= lt!429188 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429189 () Unit!31921)

(declare-fun addApplyDifferent!459 (ListLongMap!12317 (_ BitVec 64) V!32703 (_ BitVec 64)) Unit!31921)

(assert (=> b!952639 (= lt!429189 (addApplyDifferent!459 lt!429173 lt!429170 (minValue!5664 thiss!1141) lt!429188))))

(assert (=> b!952639 (= (apply!880 (+!2890 lt!429173 (tuple2!13631 lt!429170 (minValue!5664 thiss!1141))) lt!429188) (apply!880 lt!429173 lt!429188))))

(declare-fun lt!429190 () Unit!31921)

(assert (=> b!952639 (= lt!429190 lt!429189)))

(declare-fun lt!429184 () ListLongMap!12317)

(assert (=> b!952639 (= lt!429184 (getCurrentListMapNoExtraKeys!3362 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun lt!429179 () (_ BitVec 64))

(assert (=> b!952639 (= lt!429179 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429180 () (_ BitVec 64))

(assert (=> b!952639 (= lt!429180 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429187 () Unit!31921)

(assert (=> b!952639 (= lt!429187 (addApplyDifferent!459 lt!429184 lt!429179 (zeroValue!5664 thiss!1141) lt!429180))))

(assert (=> b!952639 (= (apply!880 (+!2890 lt!429184 (tuple2!13631 lt!429179 (zeroValue!5664 thiss!1141))) lt!429180) (apply!880 lt!429184 lt!429180))))

(declare-fun lt!429181 () Unit!31921)

(assert (=> b!952639 (= lt!429181 lt!429187)))

(declare-fun lt!429175 () ListLongMap!12317)

(assert (=> b!952639 (= lt!429175 (getCurrentListMapNoExtraKeys!3362 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun lt!429185 () (_ BitVec 64))

(assert (=> b!952639 (= lt!429185 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429177 () (_ BitVec 64))

(assert (=> b!952639 (= lt!429177 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952639 (= lt!429171 (addApplyDifferent!459 lt!429175 lt!429185 (minValue!5664 thiss!1141) lt!429177))))

(assert (=> b!952639 (= (apply!880 (+!2890 lt!429175 (tuple2!13631 lt!429185 (minValue!5664 thiss!1141))) lt!429177) (apply!880 lt!429175 lt!429177))))

(declare-fun b!952640 () Bool)

(assert (=> b!952640 (= e!536508 call!41593)))

(declare-fun b!952641 () Bool)

(declare-fun e!536517 () Bool)

(declare-fun e!536518 () Bool)

(assert (=> b!952641 (= e!536517 e!536518)))

(declare-fun res!638173 () Bool)

(assert (=> b!952641 (=> (not res!638173) (not e!536518))))

(assert (=> b!952641 (= res!638173 (contains!5212 lt!429174 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10779 thiss!1141))))))

(declare-fun b!952642 () Bool)

(declare-fun get!14559 (ValueCell!9920 V!32703) V!32703)

(declare-fun dynLambda!1646 (Int (_ BitVec 64)) V!32703)

(assert (=> b!952642 (= e!536518 (= (apply!880 lt!429174 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000)) (get!14559 (select (arr!27695 (_values!5851 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1646 (defaultEntry!5828 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28176 (_values!5851 thiss!1141))))))

(assert (=> b!952642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10779 thiss!1141))))))

(declare-fun b!952643 () Bool)

(declare-fun e!536511 () Bool)

(assert (=> b!952643 (= e!536514 e!536511)))

(declare-fun res!638170 () Bool)

(assert (=> b!952643 (= res!638170 call!41596)))

(assert (=> b!952643 (=> (not res!638170) (not e!536511))))

(declare-fun b!952644 () Bool)

(declare-fun e!536519 () Bool)

(declare-fun e!536510 () Bool)

(assert (=> b!952644 (= e!536519 e!536510)))

(declare-fun c!99658 () Bool)

(assert (=> b!952644 (= c!99658 (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41591 () Bool)

(declare-fun call!41594 () ListLongMap!12317)

(declare-fun c!99656 () Bool)

(declare-fun call!41595 () ListLongMap!12317)

(declare-fun call!41592 () ListLongMap!12317)

(assert (=> bm!41591 (= call!41597 (+!2890 (ite c!99656 call!41594 (ite c!99657 call!41595 call!41592)) (ite (or c!99656 c!99657) (tuple2!13631 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5664 thiss!1141)) (tuple2!13631 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5664 thiss!1141)))))))

(declare-fun b!952645 () Bool)

(declare-fun res!638174 () Bool)

(assert (=> b!952645 (=> (not res!638174) (not e!536519))))

(assert (=> b!952645 (= res!638174 e!536517)))

(declare-fun res!638171 () Bool)

(assert (=> b!952645 (=> res!638171 e!536517)))

(declare-fun e!536512 () Bool)

(assert (=> b!952645 (= res!638171 (not e!536512))))

(declare-fun res!638172 () Bool)

(assert (=> b!952645 (=> (not res!638172) (not e!536512))))

(assert (=> b!952645 (= res!638172 (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10779 thiss!1141))))))

(declare-fun b!952646 () Bool)

(declare-fun e!536507 () Bool)

(assert (=> b!952646 (= e!536507 (validKeyInArray!0 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41592 () Bool)

(assert (=> bm!41592 (= call!41595 call!41594)))

(declare-fun b!952647 () Bool)

(assert (=> b!952647 (= e!536511 (= (apply!880 lt!429174 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5664 thiss!1141)))))

(declare-fun bm!41593 () Bool)

(assert (=> bm!41593 (= call!41594 (getCurrentListMapNoExtraKeys!3362 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun b!952648 () Bool)

(declare-fun res!638176 () Bool)

(assert (=> b!952648 (=> (not res!638176) (not e!536519))))

(assert (=> b!952648 (= res!638176 e!536514)))

(declare-fun c!99655 () Bool)

(assert (=> b!952648 (= c!99655 (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!952649 () Bool)

(assert (=> b!952649 (= e!536509 call!41593)))

(declare-fun b!952650 () Bool)

(declare-fun call!41591 () Bool)

(assert (=> b!952650 (= e!536510 (not call!41591))))

(declare-fun b!952651 () Bool)

(declare-fun Unit!31926 () Unit!31921)

(assert (=> b!952651 (= e!536513 Unit!31926)))

(declare-fun b!952652 () Bool)

(assert (=> b!952652 (= e!536508 call!41592)))

(declare-fun bm!41594 () Bool)

(assert (=> bm!41594 (= call!41591 (contains!5212 lt!429174 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952653 () Bool)

(assert (=> b!952653 (= e!536512 (validKeyInArray!0 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952654 () Bool)

(assert (=> b!952654 (= e!536510 e!536516)))

(declare-fun res!638175 () Bool)

(assert (=> b!952654 (= res!638175 call!41591)))

(assert (=> b!952654 (=> (not res!638175) (not e!536516))))

(declare-fun bm!41590 () Bool)

(assert (=> bm!41590 (= call!41592 call!41595)))

(declare-fun d!115385 () Bool)

(assert (=> d!115385 e!536519))

(declare-fun res!638177 () Bool)

(assert (=> d!115385 (=> (not res!638177) (not e!536519))))

(assert (=> d!115385 (= res!638177 (or (bvsge #b00000000000000000000000000000000 (size!28177 (_keys!10779 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10779 thiss!1141))))))))

(declare-fun lt!429176 () ListLongMap!12317)

(assert (=> d!115385 (= lt!429174 lt!429176)))

(declare-fun lt!429183 () Unit!31921)

(assert (=> d!115385 (= lt!429183 e!536513)))

(declare-fun c!99654 () Bool)

(assert (=> d!115385 (= c!99654 e!536507)))

(declare-fun res!638169 () Bool)

(assert (=> d!115385 (=> (not res!638169) (not e!536507))))

(assert (=> d!115385 (= res!638169 (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10779 thiss!1141))))))

(assert (=> d!115385 (= lt!429176 e!536515)))

(assert (=> d!115385 (= c!99656 (and (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115385 (validMask!0 (mask!27675 thiss!1141))))

(assert (=> d!115385 (= (getCurrentListMap!3336 (_keys!10779 thiss!1141) (_values!5851 thiss!1141) (mask!27675 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)) lt!429174)))

(assert (= (and d!115385 c!99656) b!952638))

(assert (= (and d!115385 (not c!99656)) b!952636))

(assert (= (and b!952636 c!99657) b!952649))

(assert (= (and b!952636 (not c!99657)) b!952634))

(assert (= (and b!952634 c!99653) b!952640))

(assert (= (and b!952634 (not c!99653)) b!952652))

(assert (= (or b!952640 b!952652) bm!41590))

(assert (= (or b!952649 bm!41590) bm!41592))

(assert (= (or b!952649 b!952640) bm!41588))

(assert (= (or b!952638 bm!41592) bm!41593))

(assert (= (or b!952638 bm!41588) bm!41591))

(assert (= (and d!115385 res!638169) b!952646))

(assert (= (and d!115385 c!99654) b!952639))

(assert (= (and d!115385 (not c!99654)) b!952651))

(assert (= (and d!115385 res!638177) b!952645))

(assert (= (and b!952645 res!638172) b!952653))

(assert (= (and b!952645 (not res!638171)) b!952641))

(assert (= (and b!952641 res!638173) b!952642))

(assert (= (and b!952645 res!638174) b!952648))

(assert (= (and b!952648 c!99655) b!952643))

(assert (= (and b!952648 (not c!99655)) b!952637))

(assert (= (and b!952643 res!638170) b!952647))

(assert (= (or b!952643 b!952637) bm!41589))

(assert (= (and b!952648 res!638176) b!952644))

(assert (= (and b!952644 c!99658) b!952654))

(assert (= (and b!952644 (not c!99658)) b!952650))

(assert (= (and b!952654 res!638175) b!952635))

(assert (= (or b!952654 b!952650) bm!41594))

(declare-fun b_lambda!14401 () Bool)

(assert (=> (not b_lambda!14401) (not b!952642)))

(declare-fun t!27720 () Bool)

(declare-fun tb!6201 () Bool)

(assert (=> (and b!952445 (= (defaultEntry!5828 thiss!1141) (defaultEntry!5828 thiss!1141)) t!27720) tb!6201))

(declare-fun result!12341 () Bool)

(assert (=> tb!6201 (= result!12341 tp_is_empty!20803)))

(assert (=> b!952642 t!27720))

(declare-fun b_and!29757 () Bool)

(assert (= b_and!29751 (and (=> t!27720 result!12341) b_and!29757)))

(assert (=> b!952641 m!884151))

(assert (=> b!952641 m!884151))

(declare-fun m!884189 () Bool)

(assert (=> b!952641 m!884189))

(assert (=> b!952642 m!884151))

(declare-fun m!884191 () Bool)

(assert (=> b!952642 m!884191))

(declare-fun m!884193 () Bool)

(assert (=> b!952642 m!884193))

(declare-fun m!884195 () Bool)

(assert (=> b!952642 m!884195))

(assert (=> b!952642 m!884151))

(assert (=> b!952642 m!884193))

(assert (=> b!952642 m!884195))

(declare-fun m!884197 () Bool)

(assert (=> b!952642 m!884197))

(declare-fun m!884199 () Bool)

(assert (=> bm!41589 m!884199))

(declare-fun m!884201 () Bool)

(assert (=> bm!41591 m!884201))

(declare-fun m!884203 () Bool)

(assert (=> b!952638 m!884203))

(declare-fun m!884205 () Bool)

(assert (=> b!952639 m!884205))

(declare-fun m!884207 () Bool)

(assert (=> b!952639 m!884207))

(declare-fun m!884209 () Bool)

(assert (=> b!952639 m!884209))

(declare-fun m!884211 () Bool)

(assert (=> b!952639 m!884211))

(declare-fun m!884213 () Bool)

(assert (=> b!952639 m!884213))

(assert (=> b!952639 m!884211))

(declare-fun m!884215 () Bool)

(assert (=> b!952639 m!884215))

(declare-fun m!884217 () Bool)

(assert (=> b!952639 m!884217))

(declare-fun m!884219 () Bool)

(assert (=> b!952639 m!884219))

(declare-fun m!884221 () Bool)

(assert (=> b!952639 m!884221))

(assert (=> b!952639 m!884151))

(declare-fun m!884223 () Bool)

(assert (=> b!952639 m!884223))

(declare-fun m!884225 () Bool)

(assert (=> b!952639 m!884225))

(declare-fun m!884227 () Bool)

(assert (=> b!952639 m!884227))

(declare-fun m!884229 () Bool)

(assert (=> b!952639 m!884229))

(assert (=> b!952639 m!884219))

(declare-fun m!884231 () Bool)

(assert (=> b!952639 m!884231))

(declare-fun m!884233 () Bool)

(assert (=> b!952639 m!884233))

(assert (=> b!952639 m!884227))

(assert (=> b!952639 m!884217))

(declare-fun m!884235 () Bool)

(assert (=> b!952639 m!884235))

(assert (=> b!952653 m!884151))

(assert (=> b!952653 m!884151))

(declare-fun m!884237 () Bool)

(assert (=> b!952653 m!884237))

(assert (=> b!952646 m!884151))

(assert (=> b!952646 m!884151))

(assert (=> b!952646 m!884237))

(assert (=> d!115385 m!884051))

(declare-fun m!884239 () Bool)

(assert (=> b!952647 m!884239))

(declare-fun m!884241 () Bool)

(assert (=> bm!41594 m!884241))

(declare-fun m!884243 () Bool)

(assert (=> b!952635 m!884243))

(assert (=> bm!41593 m!884223))

(assert (=> b!952448 d!115385))

(declare-fun b!952657 () Bool)

(declare-fun e!536520 () Bool)

(declare-fun e!536521 () Bool)

(assert (=> b!952657 (= e!536520 e!536521)))

(declare-fun c!99659 () Bool)

(assert (=> b!952657 (= c!99659 (validKeyInArray!0 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952658 () Bool)

(declare-fun e!536522 () Bool)

(assert (=> b!952658 (= e!536521 e!536522)))

(declare-fun lt!429191 () (_ BitVec 64))

(assert (=> b!952658 (= lt!429191 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429192 () Unit!31921)

(assert (=> b!952658 (= lt!429192 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10779 thiss!1141) lt!429191 #b00000000000000000000000000000000))))

(assert (=> b!952658 (arrayContainsKey!0 (_keys!10779 thiss!1141) lt!429191 #b00000000000000000000000000000000)))

(declare-fun lt!429193 () Unit!31921)

(assert (=> b!952658 (= lt!429193 lt!429192)))

(declare-fun res!638179 () Bool)

(assert (=> b!952658 (= res!638179 (= (seekEntryOrOpen!0 (select (arr!27696 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000) (_keys!10779 thiss!1141) (mask!27675 thiss!1141)) (Found!9157 #b00000000000000000000000000000000)))))

(assert (=> b!952658 (=> (not res!638179) (not e!536522))))

(declare-fun b!952659 () Bool)

(declare-fun call!41598 () Bool)

(assert (=> b!952659 (= e!536521 call!41598)))

(declare-fun b!952660 () Bool)

(assert (=> b!952660 (= e!536522 call!41598)))

(declare-fun d!115387 () Bool)

(declare-fun res!638178 () Bool)

(assert (=> d!115387 (=> res!638178 e!536520)))

(assert (=> d!115387 (= res!638178 (bvsge #b00000000000000000000000000000000 (size!28177 (_keys!10779 thiss!1141))))))

(assert (=> d!115387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)) e!536520)))

(declare-fun bm!41595 () Bool)

(assert (=> bm!41595 (= call!41598 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10779 thiss!1141) (mask!27675 thiss!1141)))))

(assert (= (and d!115387 (not res!638178)) b!952657))

(assert (= (and b!952657 c!99659) b!952658))

(assert (= (and b!952657 (not c!99659)) b!952659))

(assert (= (and b!952658 res!638179) b!952660))

(assert (= (or b!952660 b!952659) bm!41595))

(assert (=> b!952657 m!884151))

(assert (=> b!952657 m!884151))

(assert (=> b!952657 m!884237))

(assert (=> b!952658 m!884151))

(declare-fun m!884245 () Bool)

(assert (=> b!952658 m!884245))

(declare-fun m!884247 () Bool)

(assert (=> b!952658 m!884247))

(assert (=> b!952658 m!884151))

(declare-fun m!884249 () Bool)

(assert (=> b!952658 m!884249))

(declare-fun m!884251 () Bool)

(assert (=> bm!41595 m!884251))

(assert (=> b!952442 d!115387))

(declare-fun d!115389 () Bool)

(assert (=> d!115389 (= (validKeyInArray!0 key!756) (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952446 d!115389))

(declare-fun b!952673 () Bool)

(declare-fun c!99666 () Bool)

(declare-fun lt!429205 () (_ BitVec 64))

(assert (=> b!952673 (= c!99666 (= lt!429205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536529 () SeekEntryResult!9157)

(declare-fun e!536531 () SeekEntryResult!9157)

(assert (=> b!952673 (= e!536529 e!536531)))

(declare-fun b!952674 () Bool)

(declare-fun lt!429204 () SeekEntryResult!9157)

(assert (=> b!952674 (= e!536531 (MissingZero!9157 (index!39001 lt!429204)))))

(declare-fun b!952675 () Bool)

(declare-fun e!536530 () SeekEntryResult!9157)

(assert (=> b!952675 (= e!536530 Undefined!9157)))

(declare-fun b!952677 () Bool)

(declare-fun lt!429203 () SeekEntryResult!9157)

(assert (=> b!952677 (= e!536531 (ite ((_ is MissingVacant!9157) lt!429203) (MissingZero!9157 (index!39002 lt!429203)) lt!429203))))

(assert (=> b!952677 (= lt!429203 (seekKeyOrZeroReturnVacant!0 (x!81948 lt!429204) (index!39001 lt!429204) (index!39001 lt!429204) key!756 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)))))

(declare-fun b!952678 () Bool)

(assert (=> b!952678 (= e!536530 e!536529)))

(assert (=> b!952678 (= lt!429205 (select (arr!27696 (_keys!10779 thiss!1141)) (index!39001 lt!429204)))))

(declare-fun c!99667 () Bool)

(assert (=> b!952678 (= c!99667 (= lt!429205 key!756))))

(declare-fun b!952676 () Bool)

(assert (=> b!952676 (= e!536529 (Found!9157 (index!39001 lt!429204)))))

(declare-fun d!115391 () Bool)

(declare-fun lt!429202 () SeekEntryResult!9157)

(assert (=> d!115391 (and (or ((_ is MissingVacant!9157) lt!429202) (not ((_ is Found!9157) lt!429202)) (and (bvsge (index!39000 lt!429202) #b00000000000000000000000000000000) (bvslt (index!39000 lt!429202) (size!28177 (_keys!10779 thiss!1141))))) (not ((_ is MissingVacant!9157) lt!429202)) (or (not ((_ is Found!9157) lt!429202)) (= (select (arr!27696 (_keys!10779 thiss!1141)) (index!39000 lt!429202)) key!756)))))

(assert (=> d!115391 (= lt!429202 e!536530)))

(declare-fun c!99668 () Bool)

(assert (=> d!115391 (= c!99668 (and ((_ is Intermediate!9157) lt!429204) (undefined!9969 lt!429204)))))

(assert (=> d!115391 (= lt!429204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27675 thiss!1141)) key!756 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)))))

(assert (=> d!115391 (validMask!0 (mask!27675 thiss!1141))))

(assert (=> d!115391 (= (seekEntry!0 key!756 (_keys!10779 thiss!1141) (mask!27675 thiss!1141)) lt!429202)))

(assert (= (and d!115391 c!99668) b!952675))

(assert (= (and d!115391 (not c!99668)) b!952678))

(assert (= (and b!952678 c!99667) b!952676))

(assert (= (and b!952678 (not c!99667)) b!952673))

(assert (= (and b!952673 c!99666) b!952674))

(assert (= (and b!952673 (not c!99666)) b!952677))

(declare-fun m!884253 () Bool)

(assert (=> b!952677 m!884253))

(declare-fun m!884255 () Bool)

(assert (=> b!952678 m!884255))

(declare-fun m!884257 () Bool)

(assert (=> d!115391 m!884257))

(assert (=> d!115391 m!884137))

(assert (=> d!115391 m!884137))

(assert (=> d!115391 m!884139))

(assert (=> d!115391 m!884051))

(assert (=> b!952451 d!115391))

(declare-fun mapNonEmpty!33154 () Bool)

(declare-fun mapRes!33154 () Bool)

(declare-fun tp!63526 () Bool)

(declare-fun e!536536 () Bool)

(assert (=> mapNonEmpty!33154 (= mapRes!33154 (and tp!63526 e!536536))))

(declare-fun mapKey!33154 () (_ BitVec 32))

(declare-fun mapValue!33154 () ValueCell!9920)

(declare-fun mapRest!33154 () (Array (_ BitVec 32) ValueCell!9920))

(assert (=> mapNonEmpty!33154 (= mapRest!33145 (store mapRest!33154 mapKey!33154 mapValue!33154))))

(declare-fun mapIsEmpty!33154 () Bool)

(assert (=> mapIsEmpty!33154 mapRes!33154))

(declare-fun b!952686 () Bool)

(declare-fun e!536537 () Bool)

(assert (=> b!952686 (= e!536537 tp_is_empty!20803)))

(declare-fun b!952685 () Bool)

(assert (=> b!952685 (= e!536536 tp_is_empty!20803)))

(declare-fun condMapEmpty!33154 () Bool)

(declare-fun mapDefault!33154 () ValueCell!9920)

(assert (=> mapNonEmpty!33145 (= condMapEmpty!33154 (= mapRest!33145 ((as const (Array (_ BitVec 32) ValueCell!9920)) mapDefault!33154)))))

(assert (=> mapNonEmpty!33145 (= tp!63511 (and e!536537 mapRes!33154))))

(assert (= (and mapNonEmpty!33145 condMapEmpty!33154) mapIsEmpty!33154))

(assert (= (and mapNonEmpty!33145 (not condMapEmpty!33154)) mapNonEmpty!33154))

(assert (= (and mapNonEmpty!33154 ((_ is ValueCellFull!9920) mapValue!33154)) b!952685))

(assert (= (and mapNonEmpty!33145 ((_ is ValueCellFull!9920) mapDefault!33154)) b!952686))

(declare-fun m!884259 () Bool)

(assert (=> mapNonEmpty!33154 m!884259))

(declare-fun b_lambda!14403 () Bool)

(assert (= b_lambda!14401 (or (and b!952445 b_free!18295) b_lambda!14403)))

(check-sat (not b!952570) (not bm!41589) b_and!29757 (not bm!41573) (not b!952540) (not b!952591) (not b!952677) (not b!952658) (not b!952641) (not b!952653) (not b!952642) (not bm!41591) (not b!952639) (not b!952580) (not d!115367) (not b!952561) (not d!115391) (not d!115371) (not b_next!18295) (not b!952581) (not bm!41594) tp_is_empty!20803 (not mapNonEmpty!33154) (not b!952647) (not d!115385) (not b!952582) (not b!952657) (not d!115373) (not bm!41595) (not d!115381) (not bm!41593) (not b!952589) (not b!952646) (not b!952635) (not b!952571) (not b!952554) (not b_lambda!14403) (not d!115383) (not b!952549) (not b!952638))
(check-sat b_and!29757 (not b_next!18295))
