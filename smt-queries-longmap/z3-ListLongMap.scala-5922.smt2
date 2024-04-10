; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76980 () Bool)

(assert start!76980)

(declare-fun b!899472 () Bool)

(declare-fun b_free!16035 () Bool)

(declare-fun b_next!16035 () Bool)

(assert (=> b!899472 (= b_free!16035 (not b_next!16035))))

(declare-fun tp!56184 () Bool)

(declare-fun b_and!26343 () Bool)

(assert (=> b!899472 (= tp!56184 b_and!26343)))

(declare-fun b!899467 () Bool)

(declare-fun e!503305 () Bool)

(declare-fun e!503310 () Bool)

(assert (=> b!899467 (= e!503305 (not e!503310))))

(declare-fun res!607628 () Bool)

(assert (=> b!899467 (=> res!607628 e!503310)))

(declare-datatypes ((SeekEntryResult!8933 0))(
  ( (MissingZero!8933 (index!38103 (_ BitVec 32))) (Found!8933 (index!38104 (_ BitVec 32))) (Intermediate!8933 (undefined!9745 Bool) (index!38105 (_ BitVec 32)) (x!76650 (_ BitVec 32))) (Undefined!8933) (MissingVacant!8933 (index!38106 (_ BitVec 32))) )
))
(declare-fun lt!406246 () SeekEntryResult!8933)

(get-info :version)

(assert (=> b!899467 (= res!607628 (not ((_ is Found!8933) lt!406246)))))

(declare-fun e!503304 () Bool)

(assert (=> b!899467 e!503304))

(declare-fun res!607627 () Bool)

(assert (=> b!899467 (=> res!607627 e!503304)))

(assert (=> b!899467 (= res!607627 (not ((_ is Found!8933) lt!406246)))))

(declare-datatypes ((Unit!30566 0))(
  ( (Unit!30567) )
))
(declare-fun lt!406247 () Unit!30566)

(declare-datatypes ((array!52770 0))(
  ( (array!52771 (arr!25359 (Array (_ BitVec 32) (_ BitVec 64))) (size!25816 (_ BitVec 32))) )
))
(declare-datatypes ((V!29449 0))(
  ( (V!29450 (val!9232 Int)) )
))
(declare-datatypes ((ValueCell!8700 0))(
  ( (ValueCellFull!8700 (v!11726 V!29449)) (EmptyCell!8700) )
))
(declare-datatypes ((array!52772 0))(
  ( (array!52773 (arr!25360 (Array (_ BitVec 32) ValueCell!8700)) (size!25817 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4416 0))(
  ( (LongMapFixedSize!4417 (defaultEntry!5432 Int) (mask!26190 (_ BitVec 32)) (extraKeys!5153 (_ BitVec 32)) (zeroValue!5257 V!29449) (minValue!5257 V!29449) (_size!2263 (_ BitVec 32)) (_keys!10221 array!52770) (_values!5444 array!52772) (_vacant!2263 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4416)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!97 (array!52770 array!52772 (_ BitVec 32) (_ BitVec 32) V!29449 V!29449 (_ BitVec 64)) Unit!30566)

(assert (=> b!899467 (= lt!406247 (lemmaSeekEntryGivesInRangeIndex!97 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52770 (_ BitVec 32)) SeekEntryResult!8933)

(assert (=> b!899467 (= lt!406246 (seekEntry!0 key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)))))

(declare-fun b!899468 () Bool)

(declare-fun res!607630 () Bool)

(assert (=> b!899468 (=> (not res!607630) (not e!503305))))

(assert (=> b!899468 (= res!607630 (not (= key!785 (bvneg key!785))))))

(declare-fun res!607631 () Bool)

(assert (=> start!76980 (=> (not res!607631) (not e!503305))))

(declare-fun valid!1696 (LongMapFixedSize!4416) Bool)

(assert (=> start!76980 (= res!607631 (valid!1696 thiss!1181))))

(assert (=> start!76980 e!503305))

(declare-fun e!503311 () Bool)

(assert (=> start!76980 e!503311))

(assert (=> start!76980 true))

(declare-fun b!899469 () Bool)

(declare-fun e!503308 () Bool)

(declare-fun tp_is_empty!18363 () Bool)

(assert (=> b!899469 (= e!503308 tp_is_empty!18363)))

(declare-fun b!899470 () Bool)

(declare-fun e!503307 () Bool)

(assert (=> b!899470 (= e!503307 (or (not (= (size!25817 (_values!5444 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26190 thiss!1181)))) (not (= (size!25816 (_keys!10221 thiss!1181)) (size!25817 (_values!5444 thiss!1181)))) (bvslt (mask!26190 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5153 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!29210 () Bool)

(declare-fun mapRes!29210 () Bool)

(assert (=> mapIsEmpty!29210 mapRes!29210))

(declare-fun mapNonEmpty!29210 () Bool)

(declare-fun tp!56185 () Bool)

(declare-fun e!503303 () Bool)

(assert (=> mapNonEmpty!29210 (= mapRes!29210 (and tp!56185 e!503303))))

(declare-fun mapValue!29210 () ValueCell!8700)

(declare-fun mapRest!29210 () (Array (_ BitVec 32) ValueCell!8700))

(declare-fun mapKey!29210 () (_ BitVec 32))

(assert (=> mapNonEmpty!29210 (= (arr!25360 (_values!5444 thiss!1181)) (store mapRest!29210 mapKey!29210 mapValue!29210))))

(declare-fun b!899471 () Bool)

(assert (=> b!899471 (= e!503310 e!503307)))

(declare-fun res!607629 () Bool)

(assert (=> b!899471 (=> res!607629 e!503307)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899471 (= res!607629 (not (validMask!0 (mask!26190 thiss!1181))))))

(declare-datatypes ((tuple2!12046 0))(
  ( (tuple2!12047 (_1!6034 (_ BitVec 64)) (_2!6034 V!29449)) )
))
(declare-datatypes ((List!17849 0))(
  ( (Nil!17846) (Cons!17845 (h!18989 tuple2!12046) (t!25196 List!17849)) )
))
(declare-datatypes ((ListLongMap!10743 0))(
  ( (ListLongMap!10744 (toList!5387 List!17849)) )
))
(declare-fun contains!4420 (ListLongMap!10743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2661 (array!52770 array!52772 (_ BitVec 32) (_ BitVec 32) V!29449 V!29449 (_ BitVec 32) Int) ListLongMap!10743)

(assert (=> b!899471 (contains!4420 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246)))))

(declare-fun lt!406244 () Unit!30566)

(declare-fun lemmaValidKeyInArrayIsInListMap!250 (array!52770 array!52772 (_ BitVec 32) (_ BitVec 32) V!29449 V!29449 (_ BitVec 32) Int) Unit!30566)

(assert (=> b!899471 (= lt!406244 (lemmaValidKeyInArrayIsInListMap!250 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) (index!38104 lt!406246) (defaultEntry!5432 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899471 (arrayContainsKey!0 (_keys!10221 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406245 () Unit!30566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52770 (_ BitVec 64) (_ BitVec 32)) Unit!30566)

(assert (=> b!899471 (= lt!406245 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10221 thiss!1181) key!785 (index!38104 lt!406246)))))

(declare-fun e!503306 () Bool)

(declare-fun array_inv!19898 (array!52770) Bool)

(declare-fun array_inv!19899 (array!52772) Bool)

(assert (=> b!899472 (= e!503311 (and tp!56184 tp_is_empty!18363 (array_inv!19898 (_keys!10221 thiss!1181)) (array_inv!19899 (_values!5444 thiss!1181)) e!503306))))

(declare-fun b!899473 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899473 (= e!503304 (inRange!0 (index!38104 lt!406246) (mask!26190 thiss!1181)))))

(declare-fun b!899474 () Bool)

(assert (=> b!899474 (= e!503303 tp_is_empty!18363)))

(declare-fun b!899475 () Bool)

(assert (=> b!899475 (= e!503306 (and e!503308 mapRes!29210))))

(declare-fun condMapEmpty!29210 () Bool)

(declare-fun mapDefault!29210 () ValueCell!8700)

(assert (=> b!899475 (= condMapEmpty!29210 (= (arr!25360 (_values!5444 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8700)) mapDefault!29210)))))

(assert (= (and start!76980 res!607631) b!899468))

(assert (= (and b!899468 res!607630) b!899467))

(assert (= (and b!899467 (not res!607627)) b!899473))

(assert (= (and b!899467 (not res!607628)) b!899471))

(assert (= (and b!899471 (not res!607629)) b!899470))

(assert (= (and b!899475 condMapEmpty!29210) mapIsEmpty!29210))

(assert (= (and b!899475 (not condMapEmpty!29210)) mapNonEmpty!29210))

(assert (= (and mapNonEmpty!29210 ((_ is ValueCellFull!8700) mapValue!29210)) b!899474))

(assert (= (and b!899475 ((_ is ValueCellFull!8700) mapDefault!29210)) b!899469))

(assert (= b!899472 b!899475))

(assert (= start!76980 b!899472))

(declare-fun m!835945 () Bool)

(assert (=> b!899472 m!835945))

(declare-fun m!835947 () Bool)

(assert (=> b!899472 m!835947))

(declare-fun m!835949 () Bool)

(assert (=> b!899467 m!835949))

(declare-fun m!835951 () Bool)

(assert (=> b!899467 m!835951))

(declare-fun m!835953 () Bool)

(assert (=> start!76980 m!835953))

(declare-fun m!835955 () Bool)

(assert (=> mapNonEmpty!29210 m!835955))

(declare-fun m!835957 () Bool)

(assert (=> b!899471 m!835957))

(declare-fun m!835959 () Bool)

(assert (=> b!899471 m!835959))

(declare-fun m!835961 () Bool)

(assert (=> b!899471 m!835961))

(declare-fun m!835963 () Bool)

(assert (=> b!899471 m!835963))

(declare-fun m!835965 () Bool)

(assert (=> b!899471 m!835965))

(declare-fun m!835967 () Bool)

(assert (=> b!899471 m!835967))

(assert (=> b!899471 m!835967))

(assert (=> b!899471 m!835963))

(declare-fun m!835969 () Bool)

(assert (=> b!899471 m!835969))

(declare-fun m!835971 () Bool)

(assert (=> b!899473 m!835971))

(check-sat (not b!899467) (not mapNonEmpty!29210) (not start!76980) (not b!899471) (not b!899473) (not b_next!16035) b_and!26343 tp_is_empty!18363 (not b!899472))
(check-sat b_and!26343 (not b_next!16035))
(get-model)

(declare-fun d!111485 () Bool)

(declare-fun e!503341 () Bool)

(assert (=> d!111485 e!503341))

(declare-fun res!607649 () Bool)

(assert (=> d!111485 (=> res!607649 e!503341)))

(declare-fun lt!406265 () SeekEntryResult!8933)

(assert (=> d!111485 (= res!607649 (not ((_ is Found!8933) lt!406265)))))

(assert (=> d!111485 (= lt!406265 (seekEntry!0 key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)))))

(declare-fun lt!406264 () Unit!30566)

(declare-fun choose!1502 (array!52770 array!52772 (_ BitVec 32) (_ BitVec 32) V!29449 V!29449 (_ BitVec 64)) Unit!30566)

(assert (=> d!111485 (= lt!406264 (choose!1502 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) key!785))))

(assert (=> d!111485 (validMask!0 (mask!26190 thiss!1181))))

(assert (=> d!111485 (= (lemmaSeekEntryGivesInRangeIndex!97 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) key!785) lt!406264)))

(declare-fun b!899505 () Bool)

(assert (=> b!899505 (= e!503341 (inRange!0 (index!38104 lt!406265) (mask!26190 thiss!1181)))))

(assert (= (and d!111485 (not res!607649)) b!899505))

(assert (=> d!111485 m!835951))

(declare-fun m!836001 () Bool)

(assert (=> d!111485 m!836001))

(assert (=> d!111485 m!835959))

(declare-fun m!836003 () Bool)

(assert (=> b!899505 m!836003))

(assert (=> b!899467 d!111485))

(declare-fun d!111487 () Bool)

(declare-fun lt!406275 () SeekEntryResult!8933)

(assert (=> d!111487 (and (or ((_ is MissingVacant!8933) lt!406275) (not ((_ is Found!8933) lt!406275)) (and (bvsge (index!38104 lt!406275) #b00000000000000000000000000000000) (bvslt (index!38104 lt!406275) (size!25816 (_keys!10221 thiss!1181))))) (not ((_ is MissingVacant!8933) lt!406275)) (or (not ((_ is Found!8933) lt!406275)) (= (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406275)) key!785)))))

(declare-fun e!503349 () SeekEntryResult!8933)

(assert (=> d!111487 (= lt!406275 e!503349)))

(declare-fun c!95151 () Bool)

(declare-fun lt!406277 () SeekEntryResult!8933)

(assert (=> d!111487 (= c!95151 (and ((_ is Intermediate!8933) lt!406277) (undefined!9745 lt!406277)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52770 (_ BitVec 32)) SeekEntryResult!8933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111487 (= lt!406277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26190 thiss!1181)) key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)))))

(assert (=> d!111487 (validMask!0 (mask!26190 thiss!1181))))

(assert (=> d!111487 (= (seekEntry!0 key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)) lt!406275)))

(declare-fun b!899518 () Bool)

(declare-fun c!95152 () Bool)

(declare-fun lt!406276 () (_ BitVec 64))

(assert (=> b!899518 (= c!95152 (= lt!406276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503348 () SeekEntryResult!8933)

(declare-fun e!503350 () SeekEntryResult!8933)

(assert (=> b!899518 (= e!503348 e!503350)))

(declare-fun b!899519 () Bool)

(assert (=> b!899519 (= e!503349 e!503348)))

(assert (=> b!899519 (= lt!406276 (select (arr!25359 (_keys!10221 thiss!1181)) (index!38105 lt!406277)))))

(declare-fun c!95150 () Bool)

(assert (=> b!899519 (= c!95150 (= lt!406276 key!785))))

(declare-fun b!899520 () Bool)

(assert (=> b!899520 (= e!503350 (MissingZero!8933 (index!38105 lt!406277)))))

(declare-fun b!899521 () Bool)

(assert (=> b!899521 (= e!503348 (Found!8933 (index!38105 lt!406277)))))

(declare-fun b!899522 () Bool)

(assert (=> b!899522 (= e!503349 Undefined!8933)))

(declare-fun b!899523 () Bool)

(declare-fun lt!406274 () SeekEntryResult!8933)

(assert (=> b!899523 (= e!503350 (ite ((_ is MissingVacant!8933) lt!406274) (MissingZero!8933 (index!38106 lt!406274)) lt!406274))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52770 (_ BitVec 32)) SeekEntryResult!8933)

(assert (=> b!899523 (= lt!406274 (seekKeyOrZeroReturnVacant!0 (x!76650 lt!406277) (index!38105 lt!406277) (index!38105 lt!406277) key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)))))

(assert (= (and d!111487 c!95151) b!899522))

(assert (= (and d!111487 (not c!95151)) b!899519))

(assert (= (and b!899519 c!95150) b!899521))

(assert (= (and b!899519 (not c!95150)) b!899518))

(assert (= (and b!899518 c!95152) b!899520))

(assert (= (and b!899518 (not c!95152)) b!899523))

(declare-fun m!836005 () Bool)

(assert (=> d!111487 m!836005))

(declare-fun m!836007 () Bool)

(assert (=> d!111487 m!836007))

(assert (=> d!111487 m!836007))

(declare-fun m!836009 () Bool)

(assert (=> d!111487 m!836009))

(assert (=> d!111487 m!835959))

(declare-fun m!836011 () Bool)

(assert (=> b!899519 m!836011))

(declare-fun m!836013 () Bool)

(assert (=> b!899523 m!836013))

(assert (=> b!899467 d!111487))

(declare-fun d!111489 () Bool)

(assert (=> d!111489 (= (array_inv!19898 (_keys!10221 thiss!1181)) (bvsge (size!25816 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899472 d!111489))

(declare-fun d!111491 () Bool)

(assert (=> d!111491 (= (array_inv!19899 (_values!5444 thiss!1181)) (bvsge (size!25817 (_values!5444 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899472 d!111491))

(declare-fun d!111493 () Bool)

(declare-fun e!503355 () Bool)

(assert (=> d!111493 e!503355))

(declare-fun res!607652 () Bool)

(assert (=> d!111493 (=> res!607652 e!503355)))

(declare-fun lt!406289 () Bool)

(assert (=> d!111493 (= res!607652 (not lt!406289))))

(declare-fun lt!406286 () Bool)

(assert (=> d!111493 (= lt!406289 lt!406286)))

(declare-fun lt!406287 () Unit!30566)

(declare-fun e!503356 () Unit!30566)

(assert (=> d!111493 (= lt!406287 e!503356)))

(declare-fun c!95155 () Bool)

(assert (=> d!111493 (= c!95155 lt!406286)))

(declare-fun containsKey!428 (List!17849 (_ BitVec 64)) Bool)

(assert (=> d!111493 (= lt!406286 (containsKey!428 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))

(assert (=> d!111493 (= (contains!4420 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))) lt!406289)))

(declare-fun b!899530 () Bool)

(declare-fun lt!406288 () Unit!30566)

(assert (=> b!899530 (= e!503356 lt!406288)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!324 (List!17849 (_ BitVec 64)) Unit!30566)

(assert (=> b!899530 (= lt!406288 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))

(declare-datatypes ((Option!465 0))(
  ( (Some!464 (v!11728 V!29449)) (None!463) )
))
(declare-fun isDefined!333 (Option!465) Bool)

(declare-fun getValueByKey!459 (List!17849 (_ BitVec 64)) Option!465)

(assert (=> b!899530 (isDefined!333 (getValueByKey!459 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))

(declare-fun b!899531 () Bool)

(declare-fun Unit!30568 () Unit!30566)

(assert (=> b!899531 (= e!503356 Unit!30568)))

(declare-fun b!899532 () Bool)

(assert (=> b!899532 (= e!503355 (isDefined!333 (getValueByKey!459 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246)))))))

(assert (= (and d!111493 c!95155) b!899530))

(assert (= (and d!111493 (not c!95155)) b!899531))

(assert (= (and d!111493 (not res!607652)) b!899532))

(assert (=> d!111493 m!835963))

(declare-fun m!836015 () Bool)

(assert (=> d!111493 m!836015))

(assert (=> b!899530 m!835963))

(declare-fun m!836017 () Bool)

(assert (=> b!899530 m!836017))

(assert (=> b!899530 m!835963))

(declare-fun m!836019 () Bool)

(assert (=> b!899530 m!836019))

(assert (=> b!899530 m!836019))

(declare-fun m!836021 () Bool)

(assert (=> b!899530 m!836021))

(assert (=> b!899532 m!835963))

(assert (=> b!899532 m!836019))

(assert (=> b!899532 m!836019))

(assert (=> b!899532 m!836021))

(assert (=> b!899471 d!111493))

(declare-fun d!111495 () Bool)

(declare-fun res!607657 () Bool)

(declare-fun e!503361 () Bool)

(assert (=> d!111495 (=> res!607657 e!503361)))

(assert (=> d!111495 (= res!607657 (= (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111495 (= (arrayContainsKey!0 (_keys!10221 thiss!1181) key!785 #b00000000000000000000000000000000) e!503361)))

(declare-fun b!899537 () Bool)

(declare-fun e!503362 () Bool)

(assert (=> b!899537 (= e!503361 e!503362)))

(declare-fun res!607658 () Bool)

(assert (=> b!899537 (=> (not res!607658) (not e!503362))))

(assert (=> b!899537 (= res!607658 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun b!899538 () Bool)

(assert (=> b!899538 (= e!503362 (arrayContainsKey!0 (_keys!10221 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111495 (not res!607657)) b!899537))

(assert (= (and b!899537 res!607658) b!899538))

(declare-fun m!836023 () Bool)

(assert (=> d!111495 m!836023))

(declare-fun m!836025 () Bool)

(assert (=> b!899538 m!836025))

(assert (=> b!899471 d!111495))

(declare-fun d!111497 () Bool)

(declare-fun e!503365 () Bool)

(assert (=> d!111497 e!503365))

(declare-fun res!607661 () Bool)

(assert (=> d!111497 (=> (not res!607661) (not e!503365))))

(assert (=> d!111497 (= res!607661 (and (bvsge (index!38104 lt!406246) #b00000000000000000000000000000000) (bvslt (index!38104 lt!406246) (size!25816 (_keys!10221 thiss!1181)))))))

(declare-fun lt!406292 () Unit!30566)

(declare-fun choose!1503 (array!52770 array!52772 (_ BitVec 32) (_ BitVec 32) V!29449 V!29449 (_ BitVec 32) Int) Unit!30566)

(assert (=> d!111497 (= lt!406292 (choose!1503 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) (index!38104 lt!406246) (defaultEntry!5432 thiss!1181)))))

(assert (=> d!111497 (validMask!0 (mask!26190 thiss!1181))))

(assert (=> d!111497 (= (lemmaValidKeyInArrayIsInListMap!250 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) (index!38104 lt!406246) (defaultEntry!5432 thiss!1181)) lt!406292)))

(declare-fun b!899541 () Bool)

(assert (=> b!899541 (= e!503365 (contains!4420 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))

(assert (= (and d!111497 res!607661) b!899541))

(declare-fun m!836027 () Bool)

(assert (=> d!111497 m!836027))

(assert (=> d!111497 m!835959))

(assert (=> b!899541 m!835967))

(assert (=> b!899541 m!835963))

(assert (=> b!899541 m!835967))

(assert (=> b!899541 m!835963))

(assert (=> b!899541 m!835969))

(assert (=> b!899471 d!111497))

(declare-fun b!899584 () Bool)

(declare-fun e!503404 () Unit!30566)

(declare-fun lt!406340 () Unit!30566)

(assert (=> b!899584 (= e!503404 lt!406340)))

(declare-fun lt!406338 () ListLongMap!10743)

(declare-fun getCurrentListMapNoExtraKeys!3281 (array!52770 array!52772 (_ BitVec 32) (_ BitVec 32) V!29449 V!29449 (_ BitVec 32) Int) ListLongMap!10743)

(assert (=> b!899584 (= lt!406338 (getCurrentListMapNoExtraKeys!3281 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))))

(declare-fun lt!406353 () (_ BitVec 64))

(assert (=> b!899584 (= lt!406353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406348 () (_ BitVec 64))

(assert (=> b!899584 (= lt!406348 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406354 () Unit!30566)

(declare-fun addStillContains!335 (ListLongMap!10743 (_ BitVec 64) V!29449 (_ BitVec 64)) Unit!30566)

(assert (=> b!899584 (= lt!406354 (addStillContains!335 lt!406338 lt!406353 (zeroValue!5257 thiss!1181) lt!406348))))

(declare-fun +!2594 (ListLongMap!10743 tuple2!12046) ListLongMap!10743)

(assert (=> b!899584 (contains!4420 (+!2594 lt!406338 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181))) lt!406348)))

(declare-fun lt!406344 () Unit!30566)

(assert (=> b!899584 (= lt!406344 lt!406354)))

(declare-fun lt!406355 () ListLongMap!10743)

(assert (=> b!899584 (= lt!406355 (getCurrentListMapNoExtraKeys!3281 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))))

(declare-fun lt!406358 () (_ BitVec 64))

(assert (=> b!899584 (= lt!406358 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406349 () (_ BitVec 64))

(assert (=> b!899584 (= lt!406349 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406341 () Unit!30566)

(declare-fun addApplyDifferent!335 (ListLongMap!10743 (_ BitVec 64) V!29449 (_ BitVec 64)) Unit!30566)

(assert (=> b!899584 (= lt!406341 (addApplyDifferent!335 lt!406355 lt!406358 (minValue!5257 thiss!1181) lt!406349))))

(declare-fun apply!413 (ListLongMap!10743 (_ BitVec 64)) V!29449)

(assert (=> b!899584 (= (apply!413 (+!2594 lt!406355 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181))) lt!406349) (apply!413 lt!406355 lt!406349))))

(declare-fun lt!406339 () Unit!30566)

(assert (=> b!899584 (= lt!406339 lt!406341)))

(declare-fun lt!406345 () ListLongMap!10743)

(assert (=> b!899584 (= lt!406345 (getCurrentListMapNoExtraKeys!3281 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))))

(declare-fun lt!406337 () (_ BitVec 64))

(assert (=> b!899584 (= lt!406337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406351 () (_ BitVec 64))

(assert (=> b!899584 (= lt!406351 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406356 () Unit!30566)

(assert (=> b!899584 (= lt!406356 (addApplyDifferent!335 lt!406345 lt!406337 (zeroValue!5257 thiss!1181) lt!406351))))

(assert (=> b!899584 (= (apply!413 (+!2594 lt!406345 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181))) lt!406351) (apply!413 lt!406345 lt!406351))))

(declare-fun lt!406357 () Unit!30566)

(assert (=> b!899584 (= lt!406357 lt!406356)))

(declare-fun lt!406352 () ListLongMap!10743)

(assert (=> b!899584 (= lt!406352 (getCurrentListMapNoExtraKeys!3281 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))))

(declare-fun lt!406347 () (_ BitVec 64))

(assert (=> b!899584 (= lt!406347 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406346 () (_ BitVec 64))

(assert (=> b!899584 (= lt!406346 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899584 (= lt!406340 (addApplyDifferent!335 lt!406352 lt!406347 (minValue!5257 thiss!1181) lt!406346))))

(assert (=> b!899584 (= (apply!413 (+!2594 lt!406352 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181))) lt!406346) (apply!413 lt!406352 lt!406346))))

(declare-fun bm!39955 () Bool)

(declare-fun call!39964 () ListLongMap!10743)

(assert (=> bm!39955 (= call!39964 (getCurrentListMapNoExtraKeys!3281 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))))

(declare-fun b!899585 () Bool)

(declare-fun e!503392 () ListLongMap!10743)

(declare-fun call!39958 () ListLongMap!10743)

(assert (=> b!899585 (= e!503392 call!39958)))

(declare-fun b!899586 () Bool)

(declare-fun call!39959 () ListLongMap!10743)

(assert (=> b!899586 (= e!503392 call!39959)))

(declare-fun b!899587 () Bool)

(declare-fun res!607684 () Bool)

(declare-fun e!503400 () Bool)

(assert (=> b!899587 (=> (not res!607684) (not e!503400))))

(declare-fun e!503401 () Bool)

(assert (=> b!899587 (= res!607684 e!503401)))

(declare-fun c!95171 () Bool)

(assert (=> b!899587 (= c!95171 (not (= (bvand (extraKeys!5153 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!899588 () Bool)

(declare-fun res!607687 () Bool)

(assert (=> b!899588 (=> (not res!607687) (not e!503400))))

(declare-fun e!503399 () Bool)

(assert (=> b!899588 (= res!607687 e!503399)))

(declare-fun res!607688 () Bool)

(assert (=> b!899588 (=> res!607688 e!503399)))

(declare-fun e!503393 () Bool)

(assert (=> b!899588 (= res!607688 (not e!503393))))

(declare-fun res!607681 () Bool)

(assert (=> b!899588 (=> (not res!607681) (not e!503393))))

(assert (=> b!899588 (= res!607681 (bvslt #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun b!899589 () Bool)

(declare-fun call!39961 () Bool)

(assert (=> b!899589 (= e!503401 (not call!39961))))

(declare-fun b!899590 () Bool)

(declare-fun e!503403 () ListLongMap!10743)

(declare-fun call!39962 () ListLongMap!10743)

(assert (=> b!899590 (= e!503403 (+!2594 call!39962 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))))))

(declare-fun d!111499 () Bool)

(assert (=> d!111499 e!503400))

(declare-fun res!607680 () Bool)

(assert (=> d!111499 (=> (not res!607680) (not e!503400))))

(assert (=> d!111499 (= res!607680 (or (bvsge #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))))

(declare-fun lt!406350 () ListLongMap!10743)

(declare-fun lt!406342 () ListLongMap!10743)

(assert (=> d!111499 (= lt!406350 lt!406342)))

(declare-fun lt!406343 () Unit!30566)

(assert (=> d!111499 (= lt!406343 e!503404)))

(declare-fun c!95173 () Bool)

(declare-fun e!503397 () Bool)

(assert (=> d!111499 (= c!95173 e!503397)))

(declare-fun res!607685 () Bool)

(assert (=> d!111499 (=> (not res!607685) (not e!503397))))

(assert (=> d!111499 (= res!607685 (bvslt #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(assert (=> d!111499 (= lt!406342 e!503403)))

(declare-fun c!95172 () Bool)

(assert (=> d!111499 (= c!95172 (and (not (= (bvand (extraKeys!5153 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5153 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111499 (validMask!0 (mask!26190 thiss!1181))))

(assert (=> d!111499 (= (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)) lt!406350)))

(declare-fun b!899591 () Bool)

(declare-fun e!503395 () Bool)

(assert (=> b!899591 (= e!503401 e!503395)))

(declare-fun res!607683 () Bool)

(assert (=> b!899591 (= res!607683 call!39961)))

(assert (=> b!899591 (=> (not res!607683) (not e!503395))))

(declare-fun b!899592 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!899592 (= e!503397 (validKeyInArray!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39956 () Bool)

(assert (=> bm!39956 (= call!39961 (contains!4420 lt!406350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899593 () Bool)

(declare-fun e!503396 () Bool)

(assert (=> b!899593 (= e!503396 (= (apply!413 lt!406350 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5257 thiss!1181)))))

(declare-fun c!95168 () Bool)

(declare-fun call!39963 () ListLongMap!10743)

(declare-fun bm!39957 () Bool)

(assert (=> bm!39957 (= call!39962 (+!2594 (ite c!95172 call!39964 (ite c!95168 call!39963 call!39958)) (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))))))

(declare-fun b!899594 () Bool)

(declare-fun e!503394 () Bool)

(assert (=> b!899594 (= e!503394 e!503396)))

(declare-fun res!607686 () Bool)

(declare-fun call!39960 () Bool)

(assert (=> b!899594 (= res!607686 call!39960)))

(assert (=> b!899594 (=> (not res!607686) (not e!503396))))

(declare-fun b!899595 () Bool)

(assert (=> b!899595 (= e!503393 (validKeyInArray!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899596 () Bool)

(declare-fun e!503398 () Bool)

(declare-fun get!13337 (ValueCell!8700 V!29449) V!29449)

(declare-fun dynLambda!1307 (Int (_ BitVec 64)) V!29449)

(assert (=> b!899596 (= e!503398 (= (apply!413 lt!406350 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)) (get!13337 (select (arr!25360 (_values!5444 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1307 (defaultEntry!5432 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25817 (_values!5444 thiss!1181))))))

(assert (=> b!899596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun bm!39958 () Bool)

(assert (=> bm!39958 (= call!39960 (contains!4420 lt!406350 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899597 () Bool)

(assert (=> b!899597 (= e!503399 e!503398)))

(declare-fun res!607682 () Bool)

(assert (=> b!899597 (=> (not res!607682) (not e!503398))))

(assert (=> b!899597 (= res!607682 (contains!4420 lt!406350 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899597 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun b!899598 () Bool)

(declare-fun e!503402 () ListLongMap!10743)

(assert (=> b!899598 (= e!503403 e!503402)))

(assert (=> b!899598 (= c!95168 (and (not (= (bvand (extraKeys!5153 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5153 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899599 () Bool)

(declare-fun Unit!30569 () Unit!30566)

(assert (=> b!899599 (= e!503404 Unit!30569)))

(declare-fun b!899600 () Bool)

(assert (=> b!899600 (= e!503402 call!39959)))

(declare-fun bm!39959 () Bool)

(assert (=> bm!39959 (= call!39958 call!39963)))

(declare-fun b!899601 () Bool)

(assert (=> b!899601 (= e!503400 e!503394)))

(declare-fun c!95169 () Bool)

(assert (=> b!899601 (= c!95169 (not (= (bvand (extraKeys!5153 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39960 () Bool)

(assert (=> bm!39960 (= call!39963 call!39964)))

(declare-fun b!899602 () Bool)

(assert (=> b!899602 (= e!503394 (not call!39960))))

(declare-fun bm!39961 () Bool)

(assert (=> bm!39961 (= call!39959 call!39962)))

(declare-fun b!899603 () Bool)

(declare-fun c!95170 () Bool)

(assert (=> b!899603 (= c!95170 (and (not (= (bvand (extraKeys!5153 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5153 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!899603 (= e!503402 e!503392)))

(declare-fun b!899604 () Bool)

(assert (=> b!899604 (= e!503395 (= (apply!413 lt!406350 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5257 thiss!1181)))))

(assert (= (and d!111499 c!95172) b!899590))

(assert (= (and d!111499 (not c!95172)) b!899598))

(assert (= (and b!899598 c!95168) b!899600))

(assert (= (and b!899598 (not c!95168)) b!899603))

(assert (= (and b!899603 c!95170) b!899586))

(assert (= (and b!899603 (not c!95170)) b!899585))

(assert (= (or b!899586 b!899585) bm!39959))

(assert (= (or b!899600 bm!39959) bm!39960))

(assert (= (or b!899600 b!899586) bm!39961))

(assert (= (or b!899590 bm!39960) bm!39955))

(assert (= (or b!899590 bm!39961) bm!39957))

(assert (= (and d!111499 res!607685) b!899592))

(assert (= (and d!111499 c!95173) b!899584))

(assert (= (and d!111499 (not c!95173)) b!899599))

(assert (= (and d!111499 res!607680) b!899588))

(assert (= (and b!899588 res!607681) b!899595))

(assert (= (and b!899588 (not res!607688)) b!899597))

(assert (= (and b!899597 res!607682) b!899596))

(assert (= (and b!899588 res!607687) b!899587))

(assert (= (and b!899587 c!95171) b!899591))

(assert (= (and b!899587 (not c!95171)) b!899589))

(assert (= (and b!899591 res!607683) b!899604))

(assert (= (or b!899591 b!899589) bm!39956))

(assert (= (and b!899587 res!607684) b!899601))

(assert (= (and b!899601 c!95169) b!899594))

(assert (= (and b!899601 (not c!95169)) b!899602))

(assert (= (and b!899594 res!607686) b!899593))

(assert (= (or b!899594 b!899602) bm!39958))

(declare-fun b_lambda!12991 () Bool)

(assert (=> (not b_lambda!12991) (not b!899596)))

(declare-fun t!25198 () Bool)

(declare-fun tb!5199 () Bool)

(assert (=> (and b!899472 (= (defaultEntry!5432 thiss!1181) (defaultEntry!5432 thiss!1181)) t!25198) tb!5199))

(declare-fun result!10169 () Bool)

(assert (=> tb!5199 (= result!10169 tp_is_empty!18363)))

(assert (=> b!899596 t!25198))

(declare-fun b_and!26347 () Bool)

(assert (= b_and!26343 (and (=> t!25198 result!10169) b_and!26347)))

(declare-fun m!836029 () Bool)

(assert (=> bm!39957 m!836029))

(declare-fun m!836031 () Bool)

(assert (=> bm!39955 m!836031))

(declare-fun m!836033 () Bool)

(assert (=> b!899604 m!836033))

(declare-fun m!836035 () Bool)

(assert (=> b!899590 m!836035))

(declare-fun m!836037 () Bool)

(assert (=> b!899584 m!836037))

(assert (=> b!899584 m!836023))

(declare-fun m!836039 () Bool)

(assert (=> b!899584 m!836039))

(declare-fun m!836041 () Bool)

(assert (=> b!899584 m!836041))

(declare-fun m!836043 () Bool)

(assert (=> b!899584 m!836043))

(declare-fun m!836045 () Bool)

(assert (=> b!899584 m!836045))

(declare-fun m!836047 () Bool)

(assert (=> b!899584 m!836047))

(declare-fun m!836049 () Bool)

(assert (=> b!899584 m!836049))

(assert (=> b!899584 m!836043))

(assert (=> b!899584 m!836047))

(declare-fun m!836051 () Bool)

(assert (=> b!899584 m!836051))

(declare-fun m!836053 () Bool)

(assert (=> b!899584 m!836053))

(declare-fun m!836055 () Bool)

(assert (=> b!899584 m!836055))

(declare-fun m!836057 () Bool)

(assert (=> b!899584 m!836057))

(assert (=> b!899584 m!836039))

(declare-fun m!836059 () Bool)

(assert (=> b!899584 m!836059))

(assert (=> b!899584 m!836031))

(declare-fun m!836061 () Bool)

(assert (=> b!899584 m!836061))

(assert (=> b!899584 m!836051))

(declare-fun m!836063 () Bool)

(assert (=> b!899584 m!836063))

(declare-fun m!836065 () Bool)

(assert (=> b!899584 m!836065))

(assert (=> b!899597 m!836023))

(assert (=> b!899597 m!836023))

(declare-fun m!836067 () Bool)

(assert (=> b!899597 m!836067))

(assert (=> b!899595 m!836023))

(assert (=> b!899595 m!836023))

(declare-fun m!836069 () Bool)

(assert (=> b!899595 m!836069))

(assert (=> b!899592 m!836023))

(assert (=> b!899592 m!836023))

(assert (=> b!899592 m!836069))

(declare-fun m!836071 () Bool)

(assert (=> b!899593 m!836071))

(declare-fun m!836073 () Bool)

(assert (=> bm!39956 m!836073))

(declare-fun m!836075 () Bool)

(assert (=> bm!39958 m!836075))

(assert (=> d!111499 m!835959))

(declare-fun m!836077 () Bool)

(assert (=> b!899596 m!836077))

(declare-fun m!836079 () Bool)

(assert (=> b!899596 m!836079))

(declare-fun m!836081 () Bool)

(assert (=> b!899596 m!836081))

(assert (=> b!899596 m!836023))

(assert (=> b!899596 m!836079))

(assert (=> b!899596 m!836023))

(declare-fun m!836083 () Bool)

(assert (=> b!899596 m!836083))

(assert (=> b!899596 m!836077))

(assert (=> b!899471 d!111499))

(declare-fun d!111501 () Bool)

(assert (=> d!111501 (arrayContainsKey!0 (_keys!10221 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406361 () Unit!30566)

(declare-fun choose!13 (array!52770 (_ BitVec 64) (_ BitVec 32)) Unit!30566)

(assert (=> d!111501 (= lt!406361 (choose!13 (_keys!10221 thiss!1181) key!785 (index!38104 lt!406246)))))

(assert (=> d!111501 (bvsge (index!38104 lt!406246) #b00000000000000000000000000000000)))

(assert (=> d!111501 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10221 thiss!1181) key!785 (index!38104 lt!406246)) lt!406361)))

(declare-fun bs!25252 () Bool)

(assert (= bs!25252 d!111501))

(assert (=> bs!25252 m!835957))

(declare-fun m!836085 () Bool)

(assert (=> bs!25252 m!836085))

(assert (=> b!899471 d!111501))

(declare-fun d!111503 () Bool)

(assert (=> d!111503 (= (validMask!0 (mask!26190 thiss!1181)) (and (or (= (mask!26190 thiss!1181) #b00000000000000000000000000000111) (= (mask!26190 thiss!1181) #b00000000000000000000000000001111) (= (mask!26190 thiss!1181) #b00000000000000000000000000011111) (= (mask!26190 thiss!1181) #b00000000000000000000000000111111) (= (mask!26190 thiss!1181) #b00000000000000000000000001111111) (= (mask!26190 thiss!1181) #b00000000000000000000000011111111) (= (mask!26190 thiss!1181) #b00000000000000000000000111111111) (= (mask!26190 thiss!1181) #b00000000000000000000001111111111) (= (mask!26190 thiss!1181) #b00000000000000000000011111111111) (= (mask!26190 thiss!1181) #b00000000000000000000111111111111) (= (mask!26190 thiss!1181) #b00000000000000000001111111111111) (= (mask!26190 thiss!1181) #b00000000000000000011111111111111) (= (mask!26190 thiss!1181) #b00000000000000000111111111111111) (= (mask!26190 thiss!1181) #b00000000000000001111111111111111) (= (mask!26190 thiss!1181) #b00000000000000011111111111111111) (= (mask!26190 thiss!1181) #b00000000000000111111111111111111) (= (mask!26190 thiss!1181) #b00000000000001111111111111111111) (= (mask!26190 thiss!1181) #b00000000000011111111111111111111) (= (mask!26190 thiss!1181) #b00000000000111111111111111111111) (= (mask!26190 thiss!1181) #b00000000001111111111111111111111) (= (mask!26190 thiss!1181) #b00000000011111111111111111111111) (= (mask!26190 thiss!1181) #b00000000111111111111111111111111) (= (mask!26190 thiss!1181) #b00000001111111111111111111111111) (= (mask!26190 thiss!1181) #b00000011111111111111111111111111) (= (mask!26190 thiss!1181) #b00000111111111111111111111111111) (= (mask!26190 thiss!1181) #b00001111111111111111111111111111) (= (mask!26190 thiss!1181) #b00011111111111111111111111111111) (= (mask!26190 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26190 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!899471 d!111503))

(declare-fun d!111505 () Bool)

(assert (=> d!111505 (= (inRange!0 (index!38104 lt!406246) (mask!26190 thiss!1181)) (and (bvsge (index!38104 lt!406246) #b00000000000000000000000000000000) (bvslt (index!38104 lt!406246) (bvadd (mask!26190 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899473 d!111505))

(declare-fun d!111507 () Bool)

(declare-fun res!607695 () Bool)

(declare-fun e!503407 () Bool)

(assert (=> d!111507 (=> (not res!607695) (not e!503407))))

(declare-fun simpleValid!327 (LongMapFixedSize!4416) Bool)

(assert (=> d!111507 (= res!607695 (simpleValid!327 thiss!1181))))

(assert (=> d!111507 (= (valid!1696 thiss!1181) e!503407)))

(declare-fun b!899613 () Bool)

(declare-fun res!607696 () Bool)

(assert (=> b!899613 (=> (not res!607696) (not e!503407))))

(declare-fun arrayCountValidKeys!0 (array!52770 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899613 (= res!607696 (= (arrayCountValidKeys!0 (_keys!10221 thiss!1181) #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))) (_size!2263 thiss!1181)))))

(declare-fun b!899614 () Bool)

(declare-fun res!607697 () Bool)

(assert (=> b!899614 (=> (not res!607697) (not e!503407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52770 (_ BitVec 32)) Bool)

(assert (=> b!899614 (= res!607697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)))))

(declare-fun b!899615 () Bool)

(declare-datatypes ((List!17850 0))(
  ( (Nil!17847) (Cons!17846 (h!18990 (_ BitVec 64)) (t!25199 List!17850)) )
))
(declare-fun arrayNoDuplicates!0 (array!52770 (_ BitVec 32) List!17850) Bool)

(assert (=> b!899615 (= e!503407 (arrayNoDuplicates!0 (_keys!10221 thiss!1181) #b00000000000000000000000000000000 Nil!17847))))

(assert (= (and d!111507 res!607695) b!899613))

(assert (= (and b!899613 res!607696) b!899614))

(assert (= (and b!899614 res!607697) b!899615))

(declare-fun m!836087 () Bool)

(assert (=> d!111507 m!836087))

(declare-fun m!836089 () Bool)

(assert (=> b!899613 m!836089))

(declare-fun m!836091 () Bool)

(assert (=> b!899614 m!836091))

(declare-fun m!836093 () Bool)

(assert (=> b!899615 m!836093))

(assert (=> start!76980 d!111507))

(declare-fun b!899623 () Bool)

(declare-fun e!503413 () Bool)

(assert (=> b!899623 (= e!503413 tp_is_empty!18363)))

(declare-fun mapIsEmpty!29216 () Bool)

(declare-fun mapRes!29216 () Bool)

(assert (=> mapIsEmpty!29216 mapRes!29216))

(declare-fun b!899622 () Bool)

(declare-fun e!503412 () Bool)

(assert (=> b!899622 (= e!503412 tp_is_empty!18363)))

(declare-fun condMapEmpty!29216 () Bool)

(declare-fun mapDefault!29216 () ValueCell!8700)

(assert (=> mapNonEmpty!29210 (= condMapEmpty!29216 (= mapRest!29210 ((as const (Array (_ BitVec 32) ValueCell!8700)) mapDefault!29216)))))

(assert (=> mapNonEmpty!29210 (= tp!56185 (and e!503413 mapRes!29216))))

(declare-fun mapNonEmpty!29216 () Bool)

(declare-fun tp!56194 () Bool)

(assert (=> mapNonEmpty!29216 (= mapRes!29216 (and tp!56194 e!503412))))

(declare-fun mapRest!29216 () (Array (_ BitVec 32) ValueCell!8700))

(declare-fun mapKey!29216 () (_ BitVec 32))

(declare-fun mapValue!29216 () ValueCell!8700)

(assert (=> mapNonEmpty!29216 (= mapRest!29210 (store mapRest!29216 mapKey!29216 mapValue!29216))))

(assert (= (and mapNonEmpty!29210 condMapEmpty!29216) mapIsEmpty!29216))

(assert (= (and mapNonEmpty!29210 (not condMapEmpty!29216)) mapNonEmpty!29216))

(assert (= (and mapNonEmpty!29216 ((_ is ValueCellFull!8700) mapValue!29216)) b!899622))

(assert (= (and mapNonEmpty!29210 ((_ is ValueCellFull!8700) mapDefault!29216)) b!899623))

(declare-fun m!836095 () Bool)

(assert (=> mapNonEmpty!29216 m!836095))

(declare-fun b_lambda!12993 () Bool)

(assert (= b_lambda!12991 (or (and b!899472 b_free!16035) b_lambda!12993)))

(check-sat b_and!26347 (not b_lambda!12993) (not bm!39957) (not d!111487) (not b!899596) (not d!111493) (not bm!39955) (not b!899593) (not bm!39958) (not b_next!16035) (not b!899604) (not d!111507) (not b!899505) (not b!899590) (not b!899530) (not d!111485) (not b!899615) (not b!899595) (not d!111497) (not b!899541) (not b!899614) (not b!899523) (not d!111499) (not b!899532) (not b!899592) (not b!899584) (not b!899613) (not mapNonEmpty!29216) (not d!111501) (not b!899597) (not bm!39956) tp_is_empty!18363 (not b!899538))
(check-sat b_and!26347 (not b_next!16035))
(get-model)

(declare-fun d!111509 () Bool)

(declare-fun get!13338 (Option!465) V!29449)

(assert (=> d!111509 (= (apply!413 lt!406350 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13338 (getValueByKey!459 (toList!5387 lt!406350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25253 () Bool)

(assert (= bs!25253 d!111509))

(declare-fun m!836097 () Bool)

(assert (=> bs!25253 m!836097))

(assert (=> bs!25253 m!836097))

(declare-fun m!836099 () Bool)

(assert (=> bs!25253 m!836099))

(assert (=> b!899593 d!111509))

(declare-fun b!899642 () Bool)

(declare-fun e!503424 () SeekEntryResult!8933)

(declare-fun e!503425 () SeekEntryResult!8933)

(assert (=> b!899642 (= e!503424 e!503425)))

(declare-fun c!95180 () Bool)

(declare-fun lt!406367 () (_ BitVec 64))

(assert (=> b!899642 (= c!95180 (or (= lt!406367 key!785) (= (bvadd lt!406367 lt!406367) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899643 () Bool)

(assert (=> b!899643 (= e!503425 (Intermediate!8933 false (toIndex!0 key!785 (mask!26190 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899644 () Bool)

(declare-fun e!503428 () Bool)

(declare-fun e!503427 () Bool)

(assert (=> b!899644 (= e!503428 e!503427)))

(declare-fun res!607706 () Bool)

(declare-fun lt!406366 () SeekEntryResult!8933)

(assert (=> b!899644 (= res!607706 (and ((_ is Intermediate!8933) lt!406366) (not (undefined!9745 lt!406366)) (bvslt (x!76650 lt!406366) #b01111111111111111111111111111110) (bvsge (x!76650 lt!406366) #b00000000000000000000000000000000) (bvsge (x!76650 lt!406366) #b00000000000000000000000000000000)))))

(assert (=> b!899644 (=> (not res!607706) (not e!503427))))

(declare-fun b!899645 () Bool)

(assert (=> b!899645 (and (bvsge (index!38105 lt!406366) #b00000000000000000000000000000000) (bvslt (index!38105 lt!406366) (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun e!503426 () Bool)

(assert (=> b!899645 (= e!503426 (= (select (arr!25359 (_keys!10221 thiss!1181)) (index!38105 lt!406366)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!111511 () Bool)

(assert (=> d!111511 e!503428))

(declare-fun c!95181 () Bool)

(assert (=> d!111511 (= c!95181 (and ((_ is Intermediate!8933) lt!406366) (undefined!9745 lt!406366)))))

(assert (=> d!111511 (= lt!406366 e!503424)))

(declare-fun c!95182 () Bool)

(assert (=> d!111511 (= c!95182 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111511 (= lt!406367 (select (arr!25359 (_keys!10221 thiss!1181)) (toIndex!0 key!785 (mask!26190 thiss!1181))))))

(assert (=> d!111511 (validMask!0 (mask!26190 thiss!1181))))

(assert (=> d!111511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26190 thiss!1181)) key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)) lt!406366)))

(declare-fun b!899646 () Bool)

(assert (=> b!899646 (= e!503424 (Intermediate!8933 true (toIndex!0 key!785 (mask!26190 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!899647 () Bool)

(assert (=> b!899647 (and (bvsge (index!38105 lt!406366) #b00000000000000000000000000000000) (bvslt (index!38105 lt!406366) (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun res!607705 () Bool)

(assert (=> b!899647 (= res!607705 (= (select (arr!25359 (_keys!10221 thiss!1181)) (index!38105 lt!406366)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899647 (=> res!607705 e!503426)))

(declare-fun b!899648 () Bool)

(assert (=> b!899648 (= e!503428 (bvsge (x!76650 lt!406366) #b01111111111111111111111111111110))))

(declare-fun b!899649 () Bool)

(assert (=> b!899649 (and (bvsge (index!38105 lt!406366) #b00000000000000000000000000000000) (bvslt (index!38105 lt!406366) (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun res!607704 () Bool)

(assert (=> b!899649 (= res!607704 (= (select (arr!25359 (_keys!10221 thiss!1181)) (index!38105 lt!406366)) key!785))))

(assert (=> b!899649 (=> res!607704 e!503426)))

(assert (=> b!899649 (= e!503427 e!503426)))

(declare-fun b!899650 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899650 (= e!503425 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26190 thiss!1181)) #b00000000000000000000000000000000 (mask!26190 thiss!1181)) key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)))))

(assert (= (and d!111511 c!95182) b!899646))

(assert (= (and d!111511 (not c!95182)) b!899642))

(assert (= (and b!899642 c!95180) b!899643))

(assert (= (and b!899642 (not c!95180)) b!899650))

(assert (= (and d!111511 c!95181) b!899648))

(assert (= (and d!111511 (not c!95181)) b!899644))

(assert (= (and b!899644 res!607706) b!899649))

(assert (= (and b!899649 (not res!607704)) b!899647))

(assert (= (and b!899647 (not res!607705)) b!899645))

(assert (=> b!899650 m!836007))

(declare-fun m!836101 () Bool)

(assert (=> b!899650 m!836101))

(assert (=> b!899650 m!836101))

(declare-fun m!836103 () Bool)

(assert (=> b!899650 m!836103))

(assert (=> d!111511 m!836007))

(declare-fun m!836105 () Bool)

(assert (=> d!111511 m!836105))

(assert (=> d!111511 m!835959))

(declare-fun m!836107 () Bool)

(assert (=> b!899647 m!836107))

(assert (=> b!899645 m!836107))

(assert (=> b!899649 m!836107))

(assert (=> d!111487 d!111511))

(declare-fun d!111513 () Bool)

(declare-fun lt!406373 () (_ BitVec 32))

(declare-fun lt!406372 () (_ BitVec 32))

(assert (=> d!111513 (= lt!406373 (bvmul (bvxor lt!406372 (bvlshr lt!406372 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111513 (= lt!406372 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111513 (and (bvsge (mask!26190 thiss!1181) #b00000000000000000000000000000000) (let ((res!607707 (let ((h!18991 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76666 (bvmul (bvxor h!18991 (bvlshr h!18991 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76666 (bvlshr x!76666 #b00000000000000000000000000001101)) (mask!26190 thiss!1181)))))) (and (bvslt res!607707 (bvadd (mask!26190 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607707 #b00000000000000000000000000000000))))))

(assert (=> d!111513 (= (toIndex!0 key!785 (mask!26190 thiss!1181)) (bvand (bvxor lt!406373 (bvlshr lt!406373 #b00000000000000000000000000001101)) (mask!26190 thiss!1181)))))

(assert (=> d!111487 d!111513))

(assert (=> d!111487 d!111503))

(declare-fun d!111515 () Bool)

(declare-fun e!503429 () Bool)

(assert (=> d!111515 e!503429))

(declare-fun res!607708 () Bool)

(assert (=> d!111515 (=> res!607708 e!503429)))

(declare-fun lt!406377 () Bool)

(assert (=> d!111515 (= res!607708 (not lt!406377))))

(declare-fun lt!406374 () Bool)

(assert (=> d!111515 (= lt!406377 lt!406374)))

(declare-fun lt!406375 () Unit!30566)

(declare-fun e!503430 () Unit!30566)

(assert (=> d!111515 (= lt!406375 e!503430)))

(declare-fun c!95183 () Bool)

(assert (=> d!111515 (= c!95183 lt!406374)))

(assert (=> d!111515 (= lt!406374 (containsKey!428 (toList!5387 lt!406350) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111515 (= (contains!4420 lt!406350 #b0000000000000000000000000000000000000000000000000000000000000000) lt!406377)))

(declare-fun b!899651 () Bool)

(declare-fun lt!406376 () Unit!30566)

(assert (=> b!899651 (= e!503430 lt!406376)))

(assert (=> b!899651 (= lt!406376 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5387 lt!406350) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899651 (isDefined!333 (getValueByKey!459 (toList!5387 lt!406350) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899652 () Bool)

(declare-fun Unit!30570 () Unit!30566)

(assert (=> b!899652 (= e!503430 Unit!30570)))

(declare-fun b!899653 () Bool)

(assert (=> b!899653 (= e!503429 (isDefined!333 (getValueByKey!459 (toList!5387 lt!406350) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111515 c!95183) b!899651))

(assert (= (and d!111515 (not c!95183)) b!899652))

(assert (= (and d!111515 (not res!607708)) b!899653))

(declare-fun m!836109 () Bool)

(assert (=> d!111515 m!836109))

(declare-fun m!836111 () Bool)

(assert (=> b!899651 m!836111))

(declare-fun m!836113 () Bool)

(assert (=> b!899651 m!836113))

(assert (=> b!899651 m!836113))

(declare-fun m!836115 () Bool)

(assert (=> b!899651 m!836115))

(assert (=> b!899653 m!836113))

(assert (=> b!899653 m!836113))

(assert (=> b!899653 m!836115))

(assert (=> bm!39956 d!111515))

(declare-fun d!111517 () Bool)

(declare-fun e!503433 () Bool)

(assert (=> d!111517 e!503433))

(declare-fun res!607714 () Bool)

(assert (=> d!111517 (=> (not res!607714) (not e!503433))))

(declare-fun lt!406388 () ListLongMap!10743)

(assert (=> d!111517 (= res!607714 (contains!4420 lt!406388 (_1!6034 (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))))))))

(declare-fun lt!406387 () List!17849)

(assert (=> d!111517 (= lt!406388 (ListLongMap!10744 lt!406387))))

(declare-fun lt!406386 () Unit!30566)

(declare-fun lt!406389 () Unit!30566)

(assert (=> d!111517 (= lt!406386 lt!406389)))

(assert (=> d!111517 (= (getValueByKey!459 lt!406387 (_1!6034 (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))))) (Some!464 (_2!6034 (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!250 (List!17849 (_ BitVec 64) V!29449) Unit!30566)

(assert (=> d!111517 (= lt!406389 (lemmaContainsTupThenGetReturnValue!250 lt!406387 (_1!6034 (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))) (_2!6034 (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))))))))

(declare-fun insertStrictlySorted!307 (List!17849 (_ BitVec 64) V!29449) List!17849)

(assert (=> d!111517 (= lt!406387 (insertStrictlySorted!307 (toList!5387 (ite c!95172 call!39964 (ite c!95168 call!39963 call!39958))) (_1!6034 (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))) (_2!6034 (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))))))))

(assert (=> d!111517 (= (+!2594 (ite c!95172 call!39964 (ite c!95168 call!39963 call!39958)) (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))) lt!406388)))

(declare-fun b!899658 () Bool)

(declare-fun res!607713 () Bool)

(assert (=> b!899658 (=> (not res!607713) (not e!503433))))

(assert (=> b!899658 (= res!607713 (= (getValueByKey!459 (toList!5387 lt!406388) (_1!6034 (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))))) (Some!464 (_2!6034 (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))))))))

(declare-fun b!899659 () Bool)

(declare-fun contains!4421 (List!17849 tuple2!12046) Bool)

(assert (=> b!899659 (= e!503433 (contains!4421 (toList!5387 lt!406388) (ite (or c!95172 c!95168) (tuple2!12047 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5257 thiss!1181)) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))))))

(assert (= (and d!111517 res!607714) b!899658))

(assert (= (and b!899658 res!607713) b!899659))

(declare-fun m!836117 () Bool)

(assert (=> d!111517 m!836117))

(declare-fun m!836119 () Bool)

(assert (=> d!111517 m!836119))

(declare-fun m!836121 () Bool)

(assert (=> d!111517 m!836121))

(declare-fun m!836123 () Bool)

(assert (=> d!111517 m!836123))

(declare-fun m!836125 () Bool)

(assert (=> b!899658 m!836125))

(declare-fun m!836127 () Bool)

(assert (=> b!899659 m!836127))

(assert (=> bm!39957 d!111517))

(declare-fun d!111519 () Bool)

(declare-fun res!607715 () Bool)

(declare-fun e!503434 () Bool)

(assert (=> d!111519 (=> res!607715 e!503434)))

(assert (=> d!111519 (= res!607715 (= (select (arr!25359 (_keys!10221 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111519 (= (arrayContainsKey!0 (_keys!10221 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!503434)))

(declare-fun b!899660 () Bool)

(declare-fun e!503435 () Bool)

(assert (=> b!899660 (= e!503434 e!503435)))

(declare-fun res!607716 () Bool)

(assert (=> b!899660 (=> (not res!607716) (not e!503435))))

(assert (=> b!899660 (= res!607716 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun b!899661 () Bool)

(assert (=> b!899661 (= e!503435 (arrayContainsKey!0 (_keys!10221 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111519 (not res!607715)) b!899660))

(assert (= (and b!899660 res!607716) b!899661))

(declare-fun m!836129 () Bool)

(assert (=> d!111519 m!836129))

(declare-fun m!836131 () Bool)

(assert (=> b!899661 m!836131))

(assert (=> b!899538 d!111519))

(declare-fun d!111521 () Bool)

(assert (=> d!111521 (= (validKeyInArray!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899592 d!111521))

(declare-fun d!111523 () Bool)

(assert (=> d!111523 (= (apply!413 lt!406350 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13338 (getValueByKey!459 (toList!5387 lt!406350) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25254 () Bool)

(assert (= bs!25254 d!111523))

(assert (=> bs!25254 m!836113))

(assert (=> bs!25254 m!836113))

(declare-fun m!836133 () Bool)

(assert (=> bs!25254 m!836133))

(assert (=> b!899604 d!111523))

(declare-fun d!111525 () Bool)

(assert (=> d!111525 (= (inRange!0 (index!38104 lt!406265) (mask!26190 thiss!1181)) (and (bvsge (index!38104 lt!406265) #b00000000000000000000000000000000) (bvslt (index!38104 lt!406265) (bvadd (mask!26190 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899505 d!111525))

(declare-fun d!111527 () Bool)

(declare-fun e!503436 () Bool)

(assert (=> d!111527 e!503436))

(declare-fun res!607718 () Bool)

(assert (=> d!111527 (=> (not res!607718) (not e!503436))))

(declare-fun lt!406392 () ListLongMap!10743)

(assert (=> d!111527 (= res!607718 (contains!4420 lt!406392 (_1!6034 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))))))

(declare-fun lt!406391 () List!17849)

(assert (=> d!111527 (= lt!406392 (ListLongMap!10744 lt!406391))))

(declare-fun lt!406390 () Unit!30566)

(declare-fun lt!406393 () Unit!30566)

(assert (=> d!111527 (= lt!406390 lt!406393)))

(assert (=> d!111527 (= (getValueByKey!459 lt!406391 (_1!6034 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))))))

(assert (=> d!111527 (= lt!406393 (lemmaContainsTupThenGetReturnValue!250 lt!406391 (_1!6034 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))))))

(assert (=> d!111527 (= lt!406391 (insertStrictlySorted!307 (toList!5387 call!39962) (_1!6034 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))))))

(assert (=> d!111527 (= (+!2594 call!39962 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))) lt!406392)))

(declare-fun b!899662 () Bool)

(declare-fun res!607717 () Bool)

(assert (=> b!899662 (=> (not res!607717) (not e!503436))))

(assert (=> b!899662 (= res!607717 (= (getValueByKey!459 (toList!5387 lt!406392) (_1!6034 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))))))))

(declare-fun b!899663 () Bool)

(assert (=> b!899663 (= e!503436 (contains!4421 (toList!5387 lt!406392) (tuple2!12047 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5257 thiss!1181))))))

(assert (= (and d!111527 res!607718) b!899662))

(assert (= (and b!899662 res!607717) b!899663))

(declare-fun m!836135 () Bool)

(assert (=> d!111527 m!836135))

(declare-fun m!836137 () Bool)

(assert (=> d!111527 m!836137))

(declare-fun m!836139 () Bool)

(assert (=> d!111527 m!836139))

(declare-fun m!836141 () Bool)

(assert (=> d!111527 m!836141))

(declare-fun m!836143 () Bool)

(assert (=> b!899662 m!836143))

(declare-fun m!836145 () Bool)

(assert (=> b!899663 m!836145))

(assert (=> b!899590 d!111527))

(assert (=> d!111485 d!111487))

(declare-fun d!111529 () Bool)

(declare-fun e!503439 () Bool)

(assert (=> d!111529 e!503439))

(declare-fun res!607721 () Bool)

(assert (=> d!111529 (=> res!607721 e!503439)))

(declare-fun lt!406396 () SeekEntryResult!8933)

(assert (=> d!111529 (= res!607721 (not ((_ is Found!8933) lt!406396)))))

(assert (=> d!111529 (= lt!406396 (seekEntry!0 key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)))))

(assert (=> d!111529 true))

(declare-fun _$36!372 () Unit!30566)

(assert (=> d!111529 (= (choose!1502 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) key!785) _$36!372)))

(declare-fun b!899666 () Bool)

(assert (=> b!899666 (= e!503439 (inRange!0 (index!38104 lt!406396) (mask!26190 thiss!1181)))))

(assert (= (and d!111529 (not res!607721)) b!899666))

(assert (=> d!111529 m!835951))

(declare-fun m!836147 () Bool)

(assert (=> b!899666 m!836147))

(assert (=> d!111485 d!111529))

(assert (=> d!111485 d!111503))

(declare-fun d!111531 () Bool)

(assert (=> d!111531 (= (apply!413 (+!2594 lt!406345 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181))) lt!406351) (get!13338 (getValueByKey!459 (toList!5387 (+!2594 lt!406345 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181)))) lt!406351)))))

(declare-fun bs!25255 () Bool)

(assert (= bs!25255 d!111531))

(declare-fun m!836149 () Bool)

(assert (=> bs!25255 m!836149))

(assert (=> bs!25255 m!836149))

(declare-fun m!836151 () Bool)

(assert (=> bs!25255 m!836151))

(assert (=> b!899584 d!111531))

(declare-fun d!111533 () Bool)

(declare-fun e!503440 () Bool)

(assert (=> d!111533 e!503440))

(declare-fun res!607722 () Bool)

(assert (=> d!111533 (=> res!607722 e!503440)))

(declare-fun lt!406400 () Bool)

(assert (=> d!111533 (= res!607722 (not lt!406400))))

(declare-fun lt!406397 () Bool)

(assert (=> d!111533 (= lt!406400 lt!406397)))

(declare-fun lt!406398 () Unit!30566)

(declare-fun e!503441 () Unit!30566)

(assert (=> d!111533 (= lt!406398 e!503441)))

(declare-fun c!95184 () Bool)

(assert (=> d!111533 (= c!95184 lt!406397)))

(assert (=> d!111533 (= lt!406397 (containsKey!428 (toList!5387 (+!2594 lt!406338 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))) lt!406348))))

(assert (=> d!111533 (= (contains!4420 (+!2594 lt!406338 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181))) lt!406348) lt!406400)))

(declare-fun b!899667 () Bool)

(declare-fun lt!406399 () Unit!30566)

(assert (=> b!899667 (= e!503441 lt!406399)))

(assert (=> b!899667 (= lt!406399 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5387 (+!2594 lt!406338 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))) lt!406348))))

(assert (=> b!899667 (isDefined!333 (getValueByKey!459 (toList!5387 (+!2594 lt!406338 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))) lt!406348))))

(declare-fun b!899668 () Bool)

(declare-fun Unit!30571 () Unit!30566)

(assert (=> b!899668 (= e!503441 Unit!30571)))

(declare-fun b!899669 () Bool)

(assert (=> b!899669 (= e!503440 (isDefined!333 (getValueByKey!459 (toList!5387 (+!2594 lt!406338 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))) lt!406348)))))

(assert (= (and d!111533 c!95184) b!899667))

(assert (= (and d!111533 (not c!95184)) b!899668))

(assert (= (and d!111533 (not res!607722)) b!899669))

(declare-fun m!836153 () Bool)

(assert (=> d!111533 m!836153))

(declare-fun m!836155 () Bool)

(assert (=> b!899667 m!836155))

(declare-fun m!836157 () Bool)

(assert (=> b!899667 m!836157))

(assert (=> b!899667 m!836157))

(declare-fun m!836159 () Bool)

(assert (=> b!899667 m!836159))

(assert (=> b!899669 m!836157))

(assert (=> b!899669 m!836157))

(assert (=> b!899669 m!836159))

(assert (=> b!899584 d!111533))

(declare-fun d!111535 () Bool)

(declare-fun e!503442 () Bool)

(assert (=> d!111535 e!503442))

(declare-fun res!607724 () Bool)

(assert (=> d!111535 (=> (not res!607724) (not e!503442))))

(declare-fun lt!406403 () ListLongMap!10743)

(assert (=> d!111535 (= res!607724 (contains!4420 lt!406403 (_1!6034 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181)))))))

(declare-fun lt!406402 () List!17849)

(assert (=> d!111535 (= lt!406403 (ListLongMap!10744 lt!406402))))

(declare-fun lt!406401 () Unit!30566)

(declare-fun lt!406404 () Unit!30566)

(assert (=> d!111535 (= lt!406401 lt!406404)))

(assert (=> d!111535 (= (getValueByKey!459 lt!406402 (_1!6034 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181)))))))

(assert (=> d!111535 (= lt!406404 (lemmaContainsTupThenGetReturnValue!250 lt!406402 (_1!6034 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181)))))))

(assert (=> d!111535 (= lt!406402 (insertStrictlySorted!307 (toList!5387 lt!406345) (_1!6034 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181)))))))

(assert (=> d!111535 (= (+!2594 lt!406345 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181))) lt!406403)))

(declare-fun b!899670 () Bool)

(declare-fun res!607723 () Bool)

(assert (=> b!899670 (=> (not res!607723) (not e!503442))))

(assert (=> b!899670 (= res!607723 (= (getValueByKey!459 (toList!5387 lt!406403) (_1!6034 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181))))))))

(declare-fun b!899671 () Bool)

(assert (=> b!899671 (= e!503442 (contains!4421 (toList!5387 lt!406403) (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181))))))

(assert (= (and d!111535 res!607724) b!899670))

(assert (= (and b!899670 res!607723) b!899671))

(declare-fun m!836161 () Bool)

(assert (=> d!111535 m!836161))

(declare-fun m!836163 () Bool)

(assert (=> d!111535 m!836163))

(declare-fun m!836165 () Bool)

(assert (=> d!111535 m!836165))

(declare-fun m!836167 () Bool)

(assert (=> d!111535 m!836167))

(declare-fun m!836169 () Bool)

(assert (=> b!899670 m!836169))

(declare-fun m!836171 () Bool)

(assert (=> b!899671 m!836171))

(assert (=> b!899584 d!111535))

(declare-fun d!111537 () Bool)

(declare-fun e!503443 () Bool)

(assert (=> d!111537 e!503443))

(declare-fun res!607726 () Bool)

(assert (=> d!111537 (=> (not res!607726) (not e!503443))))

(declare-fun lt!406407 () ListLongMap!10743)

(assert (=> d!111537 (= res!607726 (contains!4420 lt!406407 (_1!6034 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))))))

(declare-fun lt!406406 () List!17849)

(assert (=> d!111537 (= lt!406407 (ListLongMap!10744 lt!406406))))

(declare-fun lt!406405 () Unit!30566)

(declare-fun lt!406408 () Unit!30566)

(assert (=> d!111537 (= lt!406405 lt!406408)))

(assert (=> d!111537 (= (getValueByKey!459 lt!406406 (_1!6034 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))))))

(assert (=> d!111537 (= lt!406408 (lemmaContainsTupThenGetReturnValue!250 lt!406406 (_1!6034 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))))))

(assert (=> d!111537 (= lt!406406 (insertStrictlySorted!307 (toList!5387 lt!406338) (_1!6034 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))))))

(assert (=> d!111537 (= (+!2594 lt!406338 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181))) lt!406407)))

(declare-fun b!899672 () Bool)

(declare-fun res!607725 () Bool)

(assert (=> b!899672 (=> (not res!607725) (not e!503443))))

(assert (=> b!899672 (= res!607725 (= (getValueByKey!459 (toList!5387 lt!406407) (_1!6034 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181))))))))

(declare-fun b!899673 () Bool)

(assert (=> b!899673 (= e!503443 (contains!4421 (toList!5387 lt!406407) (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181))))))

(assert (= (and d!111537 res!607726) b!899672))

(assert (= (and b!899672 res!607725) b!899673))

(declare-fun m!836173 () Bool)

(assert (=> d!111537 m!836173))

(declare-fun m!836175 () Bool)

(assert (=> d!111537 m!836175))

(declare-fun m!836177 () Bool)

(assert (=> d!111537 m!836177))

(declare-fun m!836179 () Bool)

(assert (=> d!111537 m!836179))

(declare-fun m!836181 () Bool)

(assert (=> b!899672 m!836181))

(declare-fun m!836183 () Bool)

(assert (=> b!899673 m!836183))

(assert (=> b!899584 d!111537))

(declare-fun d!111539 () Bool)

(assert (=> d!111539 (= (apply!413 (+!2594 lt!406345 (tuple2!12047 lt!406337 (zeroValue!5257 thiss!1181))) lt!406351) (apply!413 lt!406345 lt!406351))))

(declare-fun lt!406411 () Unit!30566)

(declare-fun choose!1504 (ListLongMap!10743 (_ BitVec 64) V!29449 (_ BitVec 64)) Unit!30566)

(assert (=> d!111539 (= lt!406411 (choose!1504 lt!406345 lt!406337 (zeroValue!5257 thiss!1181) lt!406351))))

(declare-fun e!503446 () Bool)

(assert (=> d!111539 e!503446))

(declare-fun res!607729 () Bool)

(assert (=> d!111539 (=> (not res!607729) (not e!503446))))

(assert (=> d!111539 (= res!607729 (contains!4420 lt!406345 lt!406351))))

(assert (=> d!111539 (= (addApplyDifferent!335 lt!406345 lt!406337 (zeroValue!5257 thiss!1181) lt!406351) lt!406411)))

(declare-fun b!899677 () Bool)

(assert (=> b!899677 (= e!503446 (not (= lt!406351 lt!406337)))))

(assert (= (and d!111539 res!607729) b!899677))

(assert (=> d!111539 m!836039))

(assert (=> d!111539 m!836059))

(declare-fun m!836185 () Bool)

(assert (=> d!111539 m!836185))

(declare-fun m!836187 () Bool)

(assert (=> d!111539 m!836187))

(assert (=> d!111539 m!836061))

(assert (=> d!111539 m!836039))

(assert (=> b!899584 d!111539))

(declare-fun b!899702 () Bool)

(declare-fun res!607740 () Bool)

(declare-fun e!503466 () Bool)

(assert (=> b!899702 (=> (not res!607740) (not e!503466))))

(declare-fun lt!406427 () ListLongMap!10743)

(assert (=> b!899702 (= res!607740 (not (contains!4420 lt!406427 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899703 () Bool)

(declare-fun lt!406430 () Unit!30566)

(declare-fun lt!406432 () Unit!30566)

(assert (=> b!899703 (= lt!406430 lt!406432)))

(declare-fun lt!406429 () V!29449)

(declare-fun lt!406428 () (_ BitVec 64))

(declare-fun lt!406431 () ListLongMap!10743)

(declare-fun lt!406426 () (_ BitVec 64))

(assert (=> b!899703 (not (contains!4420 (+!2594 lt!406431 (tuple2!12047 lt!406426 lt!406429)) lt!406428))))

(declare-fun addStillNotContains!216 (ListLongMap!10743 (_ BitVec 64) V!29449 (_ BitVec 64)) Unit!30566)

(assert (=> b!899703 (= lt!406432 (addStillNotContains!216 lt!406431 lt!406426 lt!406429 lt!406428))))

(assert (=> b!899703 (= lt!406428 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!899703 (= lt!406429 (get!13337 (select (arr!25360 (_values!5444 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1307 (defaultEntry!5432 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!899703 (= lt!406426 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun call!39967 () ListLongMap!10743)

(assert (=> b!899703 (= lt!406431 call!39967)))

(declare-fun e!503463 () ListLongMap!10743)

(assert (=> b!899703 (= e!503463 (+!2594 call!39967 (tuple2!12047 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000) (get!13337 (select (arr!25360 (_values!5444 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1307 (defaultEntry!5432 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!899704 () Bool)

(declare-fun e!503467 () Bool)

(assert (=> b!899704 (= e!503466 e!503467)))

(declare-fun c!95196 () Bool)

(declare-fun e!503464 () Bool)

(assert (=> b!899704 (= c!95196 e!503464)))

(declare-fun res!607739 () Bool)

(assert (=> b!899704 (=> (not res!607739) (not e!503464))))

(assert (=> b!899704 (= res!607739 (bvslt #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun b!899705 () Bool)

(declare-fun e!503461 () ListLongMap!10743)

(assert (=> b!899705 (= e!503461 (ListLongMap!10744 Nil!17846))))

(declare-fun b!899706 () Bool)

(assert (=> b!899706 (= e!503464 (validKeyInArray!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899706 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!899707 () Bool)

(assert (=> b!899707 (= e!503463 call!39967)))

(declare-fun b!899708 () Bool)

(assert (=> b!899708 (= e!503461 e!503463)))

(declare-fun c!95193 () Bool)

(assert (=> b!899708 (= c!95193 (validKeyInArray!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899709 () Bool)

(declare-fun e!503462 () Bool)

(declare-fun isEmpty!688 (ListLongMap!10743) Bool)

(assert (=> b!899709 (= e!503462 (isEmpty!688 lt!406427))))

(declare-fun b!899710 () Bool)

(assert (=> b!899710 (= e!503462 (= lt!406427 (getCurrentListMapNoExtraKeys!3281 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5432 thiss!1181))))))

(declare-fun b!899711 () Bool)

(assert (=> b!899711 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(assert (=> b!899711 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25817 (_values!5444 thiss!1181))))))

(declare-fun e!503465 () Bool)

(assert (=> b!899711 (= e!503465 (= (apply!413 lt!406427 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)) (get!13337 (select (arr!25360 (_values!5444 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1307 (defaultEntry!5432 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!111541 () Bool)

(assert (=> d!111541 e!503466))

(declare-fun res!607738 () Bool)

(assert (=> d!111541 (=> (not res!607738) (not e!503466))))

(assert (=> d!111541 (= res!607738 (not (contains!4420 lt!406427 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111541 (= lt!406427 e!503461)))

(declare-fun c!95195 () Bool)

(assert (=> d!111541 (= c!95195 (bvsge #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(assert (=> d!111541 (validMask!0 (mask!26190 thiss!1181))))

(assert (=> d!111541 (= (getCurrentListMapNoExtraKeys!3281 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)) lt!406427)))

(declare-fun b!899712 () Bool)

(assert (=> b!899712 (= e!503467 e!503465)))

(assert (=> b!899712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun res!607741 () Bool)

(assert (=> b!899712 (= res!607741 (contains!4420 lt!406427 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899712 (=> (not res!607741) (not e!503465))))

(declare-fun bm!39964 () Bool)

(assert (=> bm!39964 (= call!39967 (getCurrentListMapNoExtraKeys!3281 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5432 thiss!1181)))))

(declare-fun b!899713 () Bool)

(assert (=> b!899713 (= e!503467 e!503462)))

(declare-fun c!95194 () Bool)

(assert (=> b!899713 (= c!95194 (bvslt #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(assert (= (and d!111541 c!95195) b!899705))

(assert (= (and d!111541 (not c!95195)) b!899708))

(assert (= (and b!899708 c!95193) b!899703))

(assert (= (and b!899708 (not c!95193)) b!899707))

(assert (= (or b!899703 b!899707) bm!39964))

(assert (= (and d!111541 res!607738) b!899702))

(assert (= (and b!899702 res!607740) b!899704))

(assert (= (and b!899704 res!607739) b!899706))

(assert (= (and b!899704 c!95196) b!899712))

(assert (= (and b!899704 (not c!95196)) b!899713))

(assert (= (and b!899712 res!607741) b!899711))

(assert (= (and b!899713 c!95194) b!899710))

(assert (= (and b!899713 (not c!95194)) b!899709))

(declare-fun b_lambda!12995 () Bool)

(assert (=> (not b_lambda!12995) (not b!899703)))

(assert (=> b!899703 t!25198))

(declare-fun b_and!26349 () Bool)

(assert (= b_and!26347 (and (=> t!25198 result!10169) b_and!26349)))

(declare-fun b_lambda!12997 () Bool)

(assert (=> (not b_lambda!12997) (not b!899711)))

(assert (=> b!899711 t!25198))

(declare-fun b_and!26351 () Bool)

(assert (= b_and!26349 (and (=> t!25198 result!10169) b_and!26351)))

(assert (=> b!899703 m!836023))

(declare-fun m!836189 () Bool)

(assert (=> b!899703 m!836189))

(assert (=> b!899703 m!836077))

(assert (=> b!899703 m!836079))

(assert (=> b!899703 m!836081))

(assert (=> b!899703 m!836077))

(assert (=> b!899703 m!836079))

(declare-fun m!836191 () Bool)

(assert (=> b!899703 m!836191))

(declare-fun m!836193 () Bool)

(assert (=> b!899703 m!836193))

(assert (=> b!899703 m!836193))

(declare-fun m!836195 () Bool)

(assert (=> b!899703 m!836195))

(declare-fun m!836197 () Bool)

(assert (=> b!899702 m!836197))

(declare-fun m!836199 () Bool)

(assert (=> bm!39964 m!836199))

(assert (=> b!899706 m!836023))

(assert (=> b!899706 m!836023))

(assert (=> b!899706 m!836069))

(declare-fun m!836201 () Bool)

(assert (=> b!899709 m!836201))

(assert (=> b!899711 m!836023))

(assert (=> b!899711 m!836023))

(declare-fun m!836203 () Bool)

(assert (=> b!899711 m!836203))

(assert (=> b!899711 m!836077))

(assert (=> b!899711 m!836079))

(assert (=> b!899711 m!836081))

(assert (=> b!899711 m!836077))

(assert (=> b!899711 m!836079))

(declare-fun m!836205 () Bool)

(assert (=> d!111541 m!836205))

(assert (=> d!111541 m!835959))

(assert (=> b!899708 m!836023))

(assert (=> b!899708 m!836023))

(assert (=> b!899708 m!836069))

(assert (=> b!899712 m!836023))

(assert (=> b!899712 m!836023))

(declare-fun m!836207 () Bool)

(assert (=> b!899712 m!836207))

(assert (=> b!899710 m!836199))

(assert (=> b!899584 d!111541))

(declare-fun d!111543 () Bool)

(assert (=> d!111543 (= (apply!413 (+!2594 lt!406352 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181))) lt!406346) (get!13338 (getValueByKey!459 (toList!5387 (+!2594 lt!406352 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181)))) lt!406346)))))

(declare-fun bs!25256 () Bool)

(assert (= bs!25256 d!111543))

(declare-fun m!836209 () Bool)

(assert (=> bs!25256 m!836209))

(assert (=> bs!25256 m!836209))

(declare-fun m!836211 () Bool)

(assert (=> bs!25256 m!836211))

(assert (=> b!899584 d!111543))

(declare-fun d!111545 () Bool)

(assert (=> d!111545 (= (apply!413 lt!406345 lt!406351) (get!13338 (getValueByKey!459 (toList!5387 lt!406345) lt!406351)))))

(declare-fun bs!25257 () Bool)

(assert (= bs!25257 d!111545))

(declare-fun m!836213 () Bool)

(assert (=> bs!25257 m!836213))

(assert (=> bs!25257 m!836213))

(declare-fun m!836215 () Bool)

(assert (=> bs!25257 m!836215))

(assert (=> b!899584 d!111545))

(declare-fun d!111547 () Bool)

(assert (=> d!111547 (= (apply!413 lt!406352 lt!406346) (get!13338 (getValueByKey!459 (toList!5387 lt!406352) lt!406346)))))

(declare-fun bs!25258 () Bool)

(assert (= bs!25258 d!111547))

(declare-fun m!836217 () Bool)

(assert (=> bs!25258 m!836217))

(assert (=> bs!25258 m!836217))

(declare-fun m!836219 () Bool)

(assert (=> bs!25258 m!836219))

(assert (=> b!899584 d!111547))

(declare-fun d!111549 () Bool)

(assert (=> d!111549 (contains!4420 (+!2594 lt!406338 (tuple2!12047 lt!406353 (zeroValue!5257 thiss!1181))) lt!406348)))

(declare-fun lt!406435 () Unit!30566)

(declare-fun choose!1505 (ListLongMap!10743 (_ BitVec 64) V!29449 (_ BitVec 64)) Unit!30566)

(assert (=> d!111549 (= lt!406435 (choose!1505 lt!406338 lt!406353 (zeroValue!5257 thiss!1181) lt!406348))))

(assert (=> d!111549 (contains!4420 lt!406338 lt!406348)))

(assert (=> d!111549 (= (addStillContains!335 lt!406338 lt!406353 (zeroValue!5257 thiss!1181) lt!406348) lt!406435)))

(declare-fun bs!25259 () Bool)

(assert (= bs!25259 d!111549))

(assert (=> bs!25259 m!836047))

(assert (=> bs!25259 m!836047))

(assert (=> bs!25259 m!836049))

(declare-fun m!836221 () Bool)

(assert (=> bs!25259 m!836221))

(declare-fun m!836223 () Bool)

(assert (=> bs!25259 m!836223))

(assert (=> b!899584 d!111549))

(declare-fun d!111551 () Bool)

(assert (=> d!111551 (= (apply!413 (+!2594 lt!406355 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181))) lt!406349) (get!13338 (getValueByKey!459 (toList!5387 (+!2594 lt!406355 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181)))) lt!406349)))))

(declare-fun bs!25260 () Bool)

(assert (= bs!25260 d!111551))

(declare-fun m!836225 () Bool)

(assert (=> bs!25260 m!836225))

(assert (=> bs!25260 m!836225))

(declare-fun m!836227 () Bool)

(assert (=> bs!25260 m!836227))

(assert (=> b!899584 d!111551))

(declare-fun d!111553 () Bool)

(assert (=> d!111553 (= (apply!413 (+!2594 lt!406355 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181))) lt!406349) (apply!413 lt!406355 lt!406349))))

(declare-fun lt!406436 () Unit!30566)

(assert (=> d!111553 (= lt!406436 (choose!1504 lt!406355 lt!406358 (minValue!5257 thiss!1181) lt!406349))))

(declare-fun e!503468 () Bool)

(assert (=> d!111553 e!503468))

(declare-fun res!607742 () Bool)

(assert (=> d!111553 (=> (not res!607742) (not e!503468))))

(assert (=> d!111553 (= res!607742 (contains!4420 lt!406355 lt!406349))))

(assert (=> d!111553 (= (addApplyDifferent!335 lt!406355 lt!406358 (minValue!5257 thiss!1181) lt!406349) lt!406436)))

(declare-fun b!899715 () Bool)

(assert (=> b!899715 (= e!503468 (not (= lt!406349 lt!406358)))))

(assert (= (and d!111553 res!607742) b!899715))

(assert (=> d!111553 m!836043))

(assert (=> d!111553 m!836045))

(declare-fun m!836229 () Bool)

(assert (=> d!111553 m!836229))

(declare-fun m!836231 () Bool)

(assert (=> d!111553 m!836231))

(assert (=> d!111553 m!836041))

(assert (=> d!111553 m!836043))

(assert (=> b!899584 d!111553))

(declare-fun d!111555 () Bool)

(declare-fun e!503469 () Bool)

(assert (=> d!111555 e!503469))

(declare-fun res!607744 () Bool)

(assert (=> d!111555 (=> (not res!607744) (not e!503469))))

(declare-fun lt!406439 () ListLongMap!10743)

(assert (=> d!111555 (= res!607744 (contains!4420 lt!406439 (_1!6034 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181)))))))

(declare-fun lt!406438 () List!17849)

(assert (=> d!111555 (= lt!406439 (ListLongMap!10744 lt!406438))))

(declare-fun lt!406437 () Unit!30566)

(declare-fun lt!406440 () Unit!30566)

(assert (=> d!111555 (= lt!406437 lt!406440)))

(assert (=> d!111555 (= (getValueByKey!459 lt!406438 (_1!6034 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181)))))))

(assert (=> d!111555 (= lt!406440 (lemmaContainsTupThenGetReturnValue!250 lt!406438 (_1!6034 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181)))))))

(assert (=> d!111555 (= lt!406438 (insertStrictlySorted!307 (toList!5387 lt!406352) (_1!6034 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181)))))))

(assert (=> d!111555 (= (+!2594 lt!406352 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181))) lt!406439)))

(declare-fun b!899716 () Bool)

(declare-fun res!607743 () Bool)

(assert (=> b!899716 (=> (not res!607743) (not e!503469))))

(assert (=> b!899716 (= res!607743 (= (getValueByKey!459 (toList!5387 lt!406439) (_1!6034 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181))))))))

(declare-fun b!899717 () Bool)

(assert (=> b!899717 (= e!503469 (contains!4421 (toList!5387 lt!406439) (tuple2!12047 lt!406347 (minValue!5257 thiss!1181))))))

(assert (= (and d!111555 res!607744) b!899716))

(assert (= (and b!899716 res!607743) b!899717))

(declare-fun m!836233 () Bool)

(assert (=> d!111555 m!836233))

(declare-fun m!836235 () Bool)

(assert (=> d!111555 m!836235))

(declare-fun m!836237 () Bool)

(assert (=> d!111555 m!836237))

(declare-fun m!836239 () Bool)

(assert (=> d!111555 m!836239))

(declare-fun m!836241 () Bool)

(assert (=> b!899716 m!836241))

(declare-fun m!836243 () Bool)

(assert (=> b!899717 m!836243))

(assert (=> b!899584 d!111555))

(declare-fun d!111557 () Bool)

(assert (=> d!111557 (= (apply!413 (+!2594 lt!406352 (tuple2!12047 lt!406347 (minValue!5257 thiss!1181))) lt!406346) (apply!413 lt!406352 lt!406346))))

(declare-fun lt!406441 () Unit!30566)

(assert (=> d!111557 (= lt!406441 (choose!1504 lt!406352 lt!406347 (minValue!5257 thiss!1181) lt!406346))))

(declare-fun e!503470 () Bool)

(assert (=> d!111557 e!503470))

(declare-fun res!607745 () Bool)

(assert (=> d!111557 (=> (not res!607745) (not e!503470))))

(assert (=> d!111557 (= res!607745 (contains!4420 lt!406352 lt!406346))))

(assert (=> d!111557 (= (addApplyDifferent!335 lt!406352 lt!406347 (minValue!5257 thiss!1181) lt!406346) lt!406441)))

(declare-fun b!899718 () Bool)

(assert (=> b!899718 (= e!503470 (not (= lt!406346 lt!406347)))))

(assert (= (and d!111557 res!607745) b!899718))

(assert (=> d!111557 m!836051))

(assert (=> d!111557 m!836053))

(declare-fun m!836245 () Bool)

(assert (=> d!111557 m!836245))

(declare-fun m!836247 () Bool)

(assert (=> d!111557 m!836247))

(assert (=> d!111557 m!836065))

(assert (=> d!111557 m!836051))

(assert (=> b!899584 d!111557))

(declare-fun d!111559 () Bool)

(declare-fun e!503471 () Bool)

(assert (=> d!111559 e!503471))

(declare-fun res!607747 () Bool)

(assert (=> d!111559 (=> (not res!607747) (not e!503471))))

(declare-fun lt!406444 () ListLongMap!10743)

(assert (=> d!111559 (= res!607747 (contains!4420 lt!406444 (_1!6034 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181)))))))

(declare-fun lt!406443 () List!17849)

(assert (=> d!111559 (= lt!406444 (ListLongMap!10744 lt!406443))))

(declare-fun lt!406442 () Unit!30566)

(declare-fun lt!406445 () Unit!30566)

(assert (=> d!111559 (= lt!406442 lt!406445)))

(assert (=> d!111559 (= (getValueByKey!459 lt!406443 (_1!6034 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181)))))))

(assert (=> d!111559 (= lt!406445 (lemmaContainsTupThenGetReturnValue!250 lt!406443 (_1!6034 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181)))))))

(assert (=> d!111559 (= lt!406443 (insertStrictlySorted!307 (toList!5387 lt!406355) (_1!6034 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181))) (_2!6034 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181)))))))

(assert (=> d!111559 (= (+!2594 lt!406355 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181))) lt!406444)))

(declare-fun b!899719 () Bool)

(declare-fun res!607746 () Bool)

(assert (=> b!899719 (=> (not res!607746) (not e!503471))))

(assert (=> b!899719 (= res!607746 (= (getValueByKey!459 (toList!5387 lt!406444) (_1!6034 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181)))) (Some!464 (_2!6034 (tuple2!12047 lt!406358 (minValue!5257 thiss!1181))))))))

(declare-fun b!899720 () Bool)

(assert (=> b!899720 (= e!503471 (contains!4421 (toList!5387 lt!406444) (tuple2!12047 lt!406358 (minValue!5257 thiss!1181))))))

(assert (= (and d!111559 res!607747) b!899719))

(assert (= (and b!899719 res!607746) b!899720))

(declare-fun m!836249 () Bool)

(assert (=> d!111559 m!836249))

(declare-fun m!836251 () Bool)

(assert (=> d!111559 m!836251))

(declare-fun m!836253 () Bool)

(assert (=> d!111559 m!836253))

(declare-fun m!836255 () Bool)

(assert (=> d!111559 m!836255))

(declare-fun m!836257 () Bool)

(assert (=> b!899719 m!836257))

(declare-fun m!836259 () Bool)

(assert (=> b!899720 m!836259))

(assert (=> b!899584 d!111559))

(declare-fun d!111561 () Bool)

(assert (=> d!111561 (= (apply!413 lt!406355 lt!406349) (get!13338 (getValueByKey!459 (toList!5387 lt!406355) lt!406349)))))

(declare-fun bs!25261 () Bool)

(assert (= bs!25261 d!111561))

(declare-fun m!836261 () Bool)

(assert (=> bs!25261 m!836261))

(assert (=> bs!25261 m!836261))

(declare-fun m!836263 () Bool)

(assert (=> bs!25261 m!836263))

(assert (=> b!899584 d!111561))

(declare-fun b!899731 () Bool)

(declare-fun e!503483 () Bool)

(declare-fun call!39970 () Bool)

(assert (=> b!899731 (= e!503483 call!39970)))

(declare-fun bm!39967 () Bool)

(declare-fun c!95199 () Bool)

(assert (=> bm!39967 (= call!39970 (arrayNoDuplicates!0 (_keys!10221 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95199 (Cons!17846 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000) Nil!17847) Nil!17847)))))

(declare-fun d!111563 () Bool)

(declare-fun res!607754 () Bool)

(declare-fun e!503482 () Bool)

(assert (=> d!111563 (=> res!607754 e!503482)))

(assert (=> d!111563 (= res!607754 (bvsge #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(assert (=> d!111563 (= (arrayNoDuplicates!0 (_keys!10221 thiss!1181) #b00000000000000000000000000000000 Nil!17847) e!503482)))

(declare-fun b!899732 () Bool)

(declare-fun e!503480 () Bool)

(declare-fun contains!4422 (List!17850 (_ BitVec 64)) Bool)

(assert (=> b!899732 (= e!503480 (contains!4422 Nil!17847 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899733 () Bool)

(declare-fun e!503481 () Bool)

(assert (=> b!899733 (= e!503482 e!503481)))

(declare-fun res!607755 () Bool)

(assert (=> b!899733 (=> (not res!607755) (not e!503481))))

(assert (=> b!899733 (= res!607755 (not e!503480))))

(declare-fun res!607756 () Bool)

(assert (=> b!899733 (=> (not res!607756) (not e!503480))))

(assert (=> b!899733 (= res!607756 (validKeyInArray!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899734 () Bool)

(assert (=> b!899734 (= e!503483 call!39970)))

(declare-fun b!899735 () Bool)

(assert (=> b!899735 (= e!503481 e!503483)))

(assert (=> b!899735 (= c!95199 (validKeyInArray!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111563 (not res!607754)) b!899733))

(assert (= (and b!899733 res!607756) b!899732))

(assert (= (and b!899733 res!607755) b!899735))

(assert (= (and b!899735 c!95199) b!899731))

(assert (= (and b!899735 (not c!95199)) b!899734))

(assert (= (or b!899731 b!899734) bm!39967))

(assert (=> bm!39967 m!836023))

(declare-fun m!836265 () Bool)

(assert (=> bm!39967 m!836265))

(assert (=> b!899732 m!836023))

(assert (=> b!899732 m!836023))

(declare-fun m!836267 () Bool)

(assert (=> b!899732 m!836267))

(assert (=> b!899733 m!836023))

(assert (=> b!899733 m!836023))

(assert (=> b!899733 m!836069))

(assert (=> b!899735 m!836023))

(assert (=> b!899735 m!836023))

(assert (=> b!899735 m!836069))

(assert (=> b!899615 d!111563))

(declare-fun d!111565 () Bool)

(declare-fun res!607761 () Bool)

(declare-fun e!503488 () Bool)

(assert (=> d!111565 (=> res!607761 e!503488)))

(assert (=> d!111565 (= res!607761 (and ((_ is Cons!17845) (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))) (= (_1!6034 (h!18989 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246)))))))

(assert (=> d!111565 (= (containsKey!428 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))) e!503488)))

(declare-fun b!899740 () Bool)

(declare-fun e!503489 () Bool)

(assert (=> b!899740 (= e!503488 e!503489)))

(declare-fun res!607762 () Bool)

(assert (=> b!899740 (=> (not res!607762) (not e!503489))))

(assert (=> b!899740 (= res!607762 (and (or (not ((_ is Cons!17845) (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))))) (bvsle (_1!6034 (h!18989 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246)))) ((_ is Cons!17845) (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))) (bvslt (_1!6034 (h!18989 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246)))))))

(declare-fun b!899741 () Bool)

(assert (=> b!899741 (= e!503489 (containsKey!428 (t!25196 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))

(assert (= (and d!111565 (not res!607761)) b!899740))

(assert (= (and b!899740 res!607762) b!899741))

(assert (=> b!899741 m!835963))

(declare-fun m!836269 () Bool)

(assert (=> b!899741 m!836269))

(assert (=> d!111493 d!111565))

(assert (=> bm!39955 d!111541))

(declare-fun e!503497 () SeekEntryResult!8933)

(declare-fun b!899754 () Bool)

(assert (=> b!899754 (= e!503497 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76650 lt!406277) #b00000000000000000000000000000001) (nextIndex!0 (index!38105 lt!406277) (x!76650 lt!406277) (mask!26190 thiss!1181)) (index!38105 lt!406277) key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)))))

(declare-fun b!899755 () Bool)

(declare-fun e!503498 () SeekEntryResult!8933)

(declare-fun e!503496 () SeekEntryResult!8933)

(assert (=> b!899755 (= e!503498 e!503496)))

(declare-fun c!95208 () Bool)

(declare-fun lt!406450 () (_ BitVec 64))

(assert (=> b!899755 (= c!95208 (= lt!406450 key!785))))

(declare-fun b!899756 () Bool)

(assert (=> b!899756 (= e!503498 Undefined!8933)))

(declare-fun b!899757 () Bool)

(declare-fun c!95207 () Bool)

(assert (=> b!899757 (= c!95207 (= lt!406450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899757 (= e!503496 e!503497)))

(declare-fun lt!406451 () SeekEntryResult!8933)

(declare-fun d!111567 () Bool)

(assert (=> d!111567 (and (or ((_ is Undefined!8933) lt!406451) (not ((_ is Found!8933) lt!406451)) (and (bvsge (index!38104 lt!406451) #b00000000000000000000000000000000) (bvslt (index!38104 lt!406451) (size!25816 (_keys!10221 thiss!1181))))) (or ((_ is Undefined!8933) lt!406451) ((_ is Found!8933) lt!406451) (not ((_ is MissingVacant!8933) lt!406451)) (not (= (index!38106 lt!406451) (index!38105 lt!406277))) (and (bvsge (index!38106 lt!406451) #b00000000000000000000000000000000) (bvslt (index!38106 lt!406451) (size!25816 (_keys!10221 thiss!1181))))) (or ((_ is Undefined!8933) lt!406451) (ite ((_ is Found!8933) lt!406451) (= (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406451)) key!785) (and ((_ is MissingVacant!8933) lt!406451) (= (index!38106 lt!406451) (index!38105 lt!406277)) (= (select (arr!25359 (_keys!10221 thiss!1181)) (index!38106 lt!406451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111567 (= lt!406451 e!503498)))

(declare-fun c!95206 () Bool)

(assert (=> d!111567 (= c!95206 (bvsge (x!76650 lt!406277) #b01111111111111111111111111111110))))

(assert (=> d!111567 (= lt!406450 (select (arr!25359 (_keys!10221 thiss!1181)) (index!38105 lt!406277)))))

(assert (=> d!111567 (validMask!0 (mask!26190 thiss!1181))))

(assert (=> d!111567 (= (seekKeyOrZeroReturnVacant!0 (x!76650 lt!406277) (index!38105 lt!406277) (index!38105 lt!406277) key!785 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)) lt!406451)))

(declare-fun b!899758 () Bool)

(assert (=> b!899758 (= e!503497 (MissingVacant!8933 (index!38105 lt!406277)))))

(declare-fun b!899759 () Bool)

(assert (=> b!899759 (= e!503496 (Found!8933 (index!38105 lt!406277)))))

(assert (= (and d!111567 c!95206) b!899756))

(assert (= (and d!111567 (not c!95206)) b!899755))

(assert (= (and b!899755 c!95208) b!899759))

(assert (= (and b!899755 (not c!95208)) b!899757))

(assert (= (and b!899757 c!95207) b!899758))

(assert (= (and b!899757 (not c!95207)) b!899754))

(declare-fun m!836271 () Bool)

(assert (=> b!899754 m!836271))

(assert (=> b!899754 m!836271))

(declare-fun m!836273 () Bool)

(assert (=> b!899754 m!836273))

(declare-fun m!836275 () Bool)

(assert (=> d!111567 m!836275))

(declare-fun m!836277 () Bool)

(assert (=> d!111567 m!836277))

(assert (=> d!111567 m!836011))

(assert (=> d!111567 m!835959))

(assert (=> b!899523 d!111567))

(declare-fun b!899768 () Bool)

(declare-fun e!503503 () (_ BitVec 32))

(declare-fun e!503504 () (_ BitVec 32))

(assert (=> b!899768 (= e!503503 e!503504)))

(declare-fun c!95213 () Bool)

(assert (=> b!899768 (= c!95213 (validKeyInArray!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111569 () Bool)

(declare-fun lt!406454 () (_ BitVec 32))

(assert (=> d!111569 (and (bvsge lt!406454 #b00000000000000000000000000000000) (bvsle lt!406454 (bvsub (size!25816 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111569 (= lt!406454 e!503503)))

(declare-fun c!95214 () Bool)

(assert (=> d!111569 (= c!95214 (bvsge #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(assert (=> d!111569 (and (bvsle #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25816 (_keys!10221 thiss!1181)) (size!25816 (_keys!10221 thiss!1181))))))

(assert (=> d!111569 (= (arrayCountValidKeys!0 (_keys!10221 thiss!1181) #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))) lt!406454)))

(declare-fun bm!39970 () Bool)

(declare-fun call!39973 () (_ BitVec 32))

(assert (=> bm!39970 (= call!39973 (arrayCountValidKeys!0 (_keys!10221 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25816 (_keys!10221 thiss!1181))))))

(declare-fun b!899769 () Bool)

(assert (=> b!899769 (= e!503504 call!39973)))

(declare-fun b!899770 () Bool)

(assert (=> b!899770 (= e!503504 (bvadd #b00000000000000000000000000000001 call!39973))))

(declare-fun b!899771 () Bool)

(assert (=> b!899771 (= e!503503 #b00000000000000000000000000000000)))

(assert (= (and d!111569 c!95214) b!899771))

(assert (= (and d!111569 (not c!95214)) b!899768))

(assert (= (and b!899768 c!95213) b!899770))

(assert (= (and b!899768 (not c!95213)) b!899769))

(assert (= (or b!899770 b!899769) bm!39970))

(assert (=> b!899768 m!836023))

(assert (=> b!899768 m!836023))

(assert (=> b!899768 m!836069))

(declare-fun m!836279 () Bool)

(assert (=> bm!39970 m!836279))

(assert (=> b!899613 d!111569))

(declare-fun b!899782 () Bool)

(declare-fun res!607774 () Bool)

(declare-fun e!503507 () Bool)

(assert (=> b!899782 (=> (not res!607774) (not e!503507))))

(declare-fun size!25820 (LongMapFixedSize!4416) (_ BitVec 32))

(assert (=> b!899782 (= res!607774 (= (size!25820 thiss!1181) (bvadd (_size!2263 thiss!1181) (bvsdiv (bvadd (extraKeys!5153 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!899781 () Bool)

(declare-fun res!607773 () Bool)

(assert (=> b!899781 (=> (not res!607773) (not e!503507))))

(assert (=> b!899781 (= res!607773 (bvsge (size!25820 thiss!1181) (_size!2263 thiss!1181)))))

(declare-fun b!899783 () Bool)

(assert (=> b!899783 (= e!503507 (and (bvsge (extraKeys!5153 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5153 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2263 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!899780 () Bool)

(declare-fun res!607772 () Bool)

(assert (=> b!899780 (=> (not res!607772) (not e!503507))))

(assert (=> b!899780 (= res!607772 (and (= (size!25817 (_values!5444 thiss!1181)) (bvadd (mask!26190 thiss!1181) #b00000000000000000000000000000001)) (= (size!25816 (_keys!10221 thiss!1181)) (size!25817 (_values!5444 thiss!1181))) (bvsge (_size!2263 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2263 thiss!1181) (bvadd (mask!26190 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!111571 () Bool)

(declare-fun res!607771 () Bool)

(assert (=> d!111571 (=> (not res!607771) (not e!503507))))

(assert (=> d!111571 (= res!607771 (validMask!0 (mask!26190 thiss!1181)))))

(assert (=> d!111571 (= (simpleValid!327 thiss!1181) e!503507)))

(assert (= (and d!111571 res!607771) b!899780))

(assert (= (and b!899780 res!607772) b!899781))

(assert (= (and b!899781 res!607773) b!899782))

(assert (= (and b!899782 res!607774) b!899783))

(declare-fun m!836281 () Bool)

(assert (=> b!899782 m!836281))

(assert (=> b!899781 m!836281))

(assert (=> d!111571 m!835959))

(assert (=> d!111507 d!111571))

(assert (=> d!111499 d!111503))

(declare-fun b!899792 () Bool)

(declare-fun e!503516 () Bool)

(declare-fun e!503514 () Bool)

(assert (=> b!899792 (= e!503516 e!503514)))

(declare-fun c!95217 () Bool)

(assert (=> b!899792 (= c!95217 (validKeyInArray!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39973 () Bool)

(declare-fun call!39976 () Bool)

(assert (=> bm!39973 (= call!39976 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10221 thiss!1181) (mask!26190 thiss!1181)))))

(declare-fun b!899793 () Bool)

(declare-fun e!503515 () Bool)

(assert (=> b!899793 (= e!503514 e!503515)))

(declare-fun lt!406463 () (_ BitVec 64))

(assert (=> b!899793 (= lt!406463 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406461 () Unit!30566)

(assert (=> b!899793 (= lt!406461 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10221 thiss!1181) lt!406463 #b00000000000000000000000000000000))))

(assert (=> b!899793 (arrayContainsKey!0 (_keys!10221 thiss!1181) lt!406463 #b00000000000000000000000000000000)))

(declare-fun lt!406462 () Unit!30566)

(assert (=> b!899793 (= lt!406462 lt!406461)))

(declare-fun res!607780 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52770 (_ BitVec 32)) SeekEntryResult!8933)

(assert (=> b!899793 (= res!607780 (= (seekEntryOrOpen!0 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000) (_keys!10221 thiss!1181) (mask!26190 thiss!1181)) (Found!8933 #b00000000000000000000000000000000)))))

(assert (=> b!899793 (=> (not res!607780) (not e!503515))))

(declare-fun d!111573 () Bool)

(declare-fun res!607779 () Bool)

(assert (=> d!111573 (=> res!607779 e!503516)))

(assert (=> d!111573 (= res!607779 (bvsge #b00000000000000000000000000000000 (size!25816 (_keys!10221 thiss!1181))))))

(assert (=> d!111573 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10221 thiss!1181) (mask!26190 thiss!1181)) e!503516)))

(declare-fun b!899794 () Bool)

(assert (=> b!899794 (= e!503514 call!39976)))

(declare-fun b!899795 () Bool)

(assert (=> b!899795 (= e!503515 call!39976)))

(assert (= (and d!111573 (not res!607779)) b!899792))

(assert (= (and b!899792 c!95217) b!899793))

(assert (= (and b!899792 (not c!95217)) b!899794))

(assert (= (and b!899793 res!607780) b!899795))

(assert (= (or b!899795 b!899794) bm!39973))

(assert (=> b!899792 m!836023))

(assert (=> b!899792 m!836023))

(assert (=> b!899792 m!836069))

(declare-fun m!836283 () Bool)

(assert (=> bm!39973 m!836283))

(assert (=> b!899793 m!836023))

(declare-fun m!836285 () Bool)

(assert (=> b!899793 m!836285))

(declare-fun m!836287 () Bool)

(assert (=> b!899793 m!836287))

(assert (=> b!899793 m!836023))

(declare-fun m!836289 () Bool)

(assert (=> b!899793 m!836289))

(assert (=> b!899614 d!111573))

(declare-fun d!111575 () Bool)

(declare-fun e!503517 () Bool)

(assert (=> d!111575 e!503517))

(declare-fun res!607781 () Bool)

(assert (=> d!111575 (=> res!607781 e!503517)))

(declare-fun lt!406467 () Bool)

(assert (=> d!111575 (= res!607781 (not lt!406467))))

(declare-fun lt!406464 () Bool)

(assert (=> d!111575 (= lt!406467 lt!406464)))

(declare-fun lt!406465 () Unit!30566)

(declare-fun e!503518 () Unit!30566)

(assert (=> d!111575 (= lt!406465 e!503518)))

(declare-fun c!95218 () Bool)

(assert (=> d!111575 (= c!95218 lt!406464)))

(assert (=> d!111575 (= lt!406464 (containsKey!428 (toList!5387 lt!406350) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111575 (= (contains!4420 lt!406350 #b1000000000000000000000000000000000000000000000000000000000000000) lt!406467)))

(declare-fun b!899796 () Bool)

(declare-fun lt!406466 () Unit!30566)

(assert (=> b!899796 (= e!503518 lt!406466)))

(assert (=> b!899796 (= lt!406466 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5387 lt!406350) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!899796 (isDefined!333 (getValueByKey!459 (toList!5387 lt!406350) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899797 () Bool)

(declare-fun Unit!30572 () Unit!30566)

(assert (=> b!899797 (= e!503518 Unit!30572)))

(declare-fun b!899798 () Bool)

(assert (=> b!899798 (= e!503517 (isDefined!333 (getValueByKey!459 (toList!5387 lt!406350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111575 c!95218) b!899796))

(assert (= (and d!111575 (not c!95218)) b!899797))

(assert (= (and d!111575 (not res!607781)) b!899798))

(declare-fun m!836291 () Bool)

(assert (=> d!111575 m!836291))

(declare-fun m!836293 () Bool)

(assert (=> b!899796 m!836293))

(assert (=> b!899796 m!836097))

(assert (=> b!899796 m!836097))

(declare-fun m!836295 () Bool)

(assert (=> b!899796 m!836295))

(assert (=> b!899798 m!836097))

(assert (=> b!899798 m!836097))

(assert (=> b!899798 m!836295))

(assert (=> bm!39958 d!111575))

(assert (=> d!111501 d!111495))

(declare-fun d!111577 () Bool)

(assert (=> d!111577 (arrayContainsKey!0 (_keys!10221 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111577 true))

(declare-fun _$60!424 () Unit!30566)

(assert (=> d!111577 (= (choose!13 (_keys!10221 thiss!1181) key!785 (index!38104 lt!406246)) _$60!424)))

(declare-fun bs!25262 () Bool)

(assert (= bs!25262 d!111577))

(assert (=> bs!25262 m!835957))

(assert (=> d!111501 d!111577))

(declare-fun d!111579 () Bool)

(declare-fun e!503519 () Bool)

(assert (=> d!111579 e!503519))

(declare-fun res!607782 () Bool)

(assert (=> d!111579 (=> res!607782 e!503519)))

(declare-fun lt!406471 () Bool)

(assert (=> d!111579 (= res!607782 (not lt!406471))))

(declare-fun lt!406468 () Bool)

(assert (=> d!111579 (= lt!406471 lt!406468)))

(declare-fun lt!406469 () Unit!30566)

(declare-fun e!503520 () Unit!30566)

(assert (=> d!111579 (= lt!406469 e!503520)))

(declare-fun c!95219 () Bool)

(assert (=> d!111579 (= c!95219 lt!406468)))

(assert (=> d!111579 (= lt!406468 (containsKey!428 (toList!5387 lt!406350) (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111579 (= (contains!4420 lt!406350 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)) lt!406471)))

(declare-fun b!899799 () Bool)

(declare-fun lt!406470 () Unit!30566)

(assert (=> b!899799 (= e!503520 lt!406470)))

(assert (=> b!899799 (= lt!406470 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5387 lt!406350) (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899799 (isDefined!333 (getValueByKey!459 (toList!5387 lt!406350) (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899800 () Bool)

(declare-fun Unit!30573 () Unit!30566)

(assert (=> b!899800 (= e!503520 Unit!30573)))

(declare-fun b!899801 () Bool)

(assert (=> b!899801 (= e!503519 (isDefined!333 (getValueByKey!459 (toList!5387 lt!406350) (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111579 c!95219) b!899799))

(assert (= (and d!111579 (not c!95219)) b!899800))

(assert (= (and d!111579 (not res!607782)) b!899801))

(assert (=> d!111579 m!836023))

(declare-fun m!836297 () Bool)

(assert (=> d!111579 m!836297))

(assert (=> b!899799 m!836023))

(declare-fun m!836299 () Bool)

(assert (=> b!899799 m!836299))

(assert (=> b!899799 m!836023))

(declare-fun m!836301 () Bool)

(assert (=> b!899799 m!836301))

(assert (=> b!899799 m!836301))

(declare-fun m!836303 () Bool)

(assert (=> b!899799 m!836303))

(assert (=> b!899801 m!836023))

(assert (=> b!899801 m!836301))

(assert (=> b!899801 m!836301))

(assert (=> b!899801 m!836303))

(assert (=> b!899597 d!111579))

(declare-fun d!111581 () Bool)

(declare-fun isEmpty!689 (Option!465) Bool)

(assert (=> d!111581 (= (isDefined!333 (getValueByKey!459 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246)))) (not (isEmpty!689 (getValueByKey!459 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))))

(declare-fun bs!25263 () Bool)

(assert (= bs!25263 d!111581))

(assert (=> bs!25263 m!836019))

(declare-fun m!836305 () Bool)

(assert (=> bs!25263 m!836305))

(assert (=> b!899532 d!111581))

(declare-fun b!899810 () Bool)

(declare-fun e!503525 () Option!465)

(assert (=> b!899810 (= e!503525 (Some!464 (_2!6034 (h!18989 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))))))))

(declare-fun b!899813 () Bool)

(declare-fun e!503526 () Option!465)

(assert (=> b!899813 (= e!503526 None!463)))

(declare-fun d!111583 () Bool)

(declare-fun c!95224 () Bool)

(assert (=> d!111583 (= c!95224 (and ((_ is Cons!17845) (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))) (= (_1!6034 (h!18989 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246)))))))

(assert (=> d!111583 (= (getValueByKey!459 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))) e!503525)))

(declare-fun b!899811 () Bool)

(assert (=> b!899811 (= e!503525 e!503526)))

(declare-fun c!95225 () Bool)

(assert (=> b!899811 (= c!95225 (and ((_ is Cons!17845) (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))) (not (= (_1!6034 (h!18989 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))))

(declare-fun b!899812 () Bool)

(assert (=> b!899812 (= e!503526 (getValueByKey!459 (t!25196 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))

(assert (= (and d!111583 c!95224) b!899810))

(assert (= (and d!111583 (not c!95224)) b!899811))

(assert (= (and b!899811 c!95225) b!899812))

(assert (= (and b!899811 (not c!95225)) b!899813))

(assert (=> b!899812 m!835963))

(declare-fun m!836307 () Bool)

(assert (=> b!899812 m!836307))

(assert (=> b!899532 d!111583))

(declare-fun d!111585 () Bool)

(assert (=> d!111585 (contains!4420 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246)))))

(assert (=> d!111585 true))

(declare-fun _$16!184 () Unit!30566)

(assert (=> d!111585 (= (choose!1503 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) (index!38104 lt!406246) (defaultEntry!5432 thiss!1181)) _$16!184)))

(declare-fun bs!25264 () Bool)

(assert (= bs!25264 d!111585))

(assert (=> bs!25264 m!835967))

(assert (=> bs!25264 m!835963))

(assert (=> bs!25264 m!835967))

(assert (=> bs!25264 m!835963))

(assert (=> bs!25264 m!835969))

(assert (=> d!111497 d!111585))

(assert (=> d!111497 d!111503))

(declare-fun d!111587 () Bool)

(assert (=> d!111587 (= (apply!413 lt!406350 (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000)) (get!13338 (getValueByKey!459 (toList!5387 lt!406350) (select (arr!25359 (_keys!10221 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25265 () Bool)

(assert (= bs!25265 d!111587))

(assert (=> bs!25265 m!836023))

(assert (=> bs!25265 m!836301))

(assert (=> bs!25265 m!836301))

(declare-fun m!836309 () Bool)

(assert (=> bs!25265 m!836309))

(assert (=> b!899596 d!111587))

(declare-fun d!111589 () Bool)

(declare-fun c!95228 () Bool)

(assert (=> d!111589 (= c!95228 ((_ is ValueCellFull!8700) (select (arr!25360 (_values!5444 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!503529 () V!29449)

(assert (=> d!111589 (= (get!13337 (select (arr!25360 (_values!5444 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1307 (defaultEntry!5432 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!503529)))

(declare-fun b!899818 () Bool)

(declare-fun get!13339 (ValueCell!8700 V!29449) V!29449)

(assert (=> b!899818 (= e!503529 (get!13339 (select (arr!25360 (_values!5444 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1307 (defaultEntry!5432 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!899819 () Bool)

(declare-fun get!13340 (ValueCell!8700 V!29449) V!29449)

(assert (=> b!899819 (= e!503529 (get!13340 (select (arr!25360 (_values!5444 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1307 (defaultEntry!5432 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111589 c!95228) b!899818))

(assert (= (and d!111589 (not c!95228)) b!899819))

(assert (=> b!899818 m!836077))

(assert (=> b!899818 m!836079))

(declare-fun m!836311 () Bool)

(assert (=> b!899818 m!836311))

(assert (=> b!899819 m!836077))

(assert (=> b!899819 m!836079))

(declare-fun m!836313 () Bool)

(assert (=> b!899819 m!836313))

(assert (=> b!899596 d!111589))

(declare-fun d!111591 () Bool)

(assert (=> d!111591 (isDefined!333 (getValueByKey!459 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))

(declare-fun lt!406474 () Unit!30566)

(declare-fun choose!1506 (List!17849 (_ BitVec 64)) Unit!30566)

(assert (=> d!111591 (= lt!406474 (choose!1506 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))

(declare-fun e!503532 () Bool)

(assert (=> d!111591 e!503532))

(declare-fun res!607785 () Bool)

(assert (=> d!111591 (=> (not res!607785) (not e!503532))))

(declare-fun isStrictlySorted!499 (List!17849) Bool)

(assert (=> d!111591 (= res!607785 (isStrictlySorted!499 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181)))))))

(assert (=> d!111591 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))) lt!406474)))

(declare-fun b!899822 () Bool)

(assert (=> b!899822 (= e!503532 (containsKey!428 (toList!5387 (getCurrentListMap!2661 (_keys!10221 thiss!1181) (_values!5444 thiss!1181) (mask!26190 thiss!1181) (extraKeys!5153 thiss!1181) (zeroValue!5257 thiss!1181) (minValue!5257 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5432 thiss!1181))) (select (arr!25359 (_keys!10221 thiss!1181)) (index!38104 lt!406246))))))

(assert (= (and d!111591 res!607785) b!899822))

(assert (=> d!111591 m!835963))

(assert (=> d!111591 m!836019))

(assert (=> d!111591 m!836019))

(assert (=> d!111591 m!836021))

(assert (=> d!111591 m!835963))

(declare-fun m!836315 () Bool)

(assert (=> d!111591 m!836315))

(declare-fun m!836317 () Bool)

(assert (=> d!111591 m!836317))

(assert (=> b!899822 m!835963))

(assert (=> b!899822 m!836015))

(assert (=> b!899530 d!111591))

(assert (=> b!899530 d!111581))

(assert (=> b!899530 d!111583))

(assert (=> b!899595 d!111521))

(assert (=> b!899541 d!111493))

(assert (=> b!899541 d!111499))

(declare-fun b!899824 () Bool)

(declare-fun e!503534 () Bool)

(assert (=> b!899824 (= e!503534 tp_is_empty!18363)))

(declare-fun mapIsEmpty!29217 () Bool)

(declare-fun mapRes!29217 () Bool)

(assert (=> mapIsEmpty!29217 mapRes!29217))

(declare-fun b!899823 () Bool)

(declare-fun e!503533 () Bool)

(assert (=> b!899823 (= e!503533 tp_is_empty!18363)))

(declare-fun condMapEmpty!29217 () Bool)

(declare-fun mapDefault!29217 () ValueCell!8700)

(assert (=> mapNonEmpty!29216 (= condMapEmpty!29217 (= mapRest!29216 ((as const (Array (_ BitVec 32) ValueCell!8700)) mapDefault!29217)))))

(assert (=> mapNonEmpty!29216 (= tp!56194 (and e!503534 mapRes!29217))))

(declare-fun mapNonEmpty!29217 () Bool)

(declare-fun tp!56195 () Bool)

(assert (=> mapNonEmpty!29217 (= mapRes!29217 (and tp!56195 e!503533))))

(declare-fun mapValue!29217 () ValueCell!8700)

(declare-fun mapKey!29217 () (_ BitVec 32))

(declare-fun mapRest!29217 () (Array (_ BitVec 32) ValueCell!8700))

(assert (=> mapNonEmpty!29217 (= mapRest!29216 (store mapRest!29217 mapKey!29217 mapValue!29217))))

(assert (= (and mapNonEmpty!29216 condMapEmpty!29217) mapIsEmpty!29217))

(assert (= (and mapNonEmpty!29216 (not condMapEmpty!29217)) mapNonEmpty!29217))

(assert (= (and mapNonEmpty!29217 ((_ is ValueCellFull!8700) mapValue!29217)) b!899823))

(assert (= (and mapNonEmpty!29216 ((_ is ValueCellFull!8700) mapDefault!29217)) b!899824))

(declare-fun m!836319 () Bool)

(assert (=> mapNonEmpty!29217 m!836319))

(declare-fun b_lambda!12999 () Bool)

(assert (= b_lambda!12997 (or (and b!899472 b_free!16035) b_lambda!12999)))

(declare-fun b_lambda!13001 () Bool)

(assert (= b_lambda!12995 (or (and b!899472 b_free!16035) b_lambda!13001)))

(check-sat (not b!899782) (not b!899653) (not b!899733) (not b!899651) (not d!111517) (not b!899812) (not b!899650) (not b!899666) (not bm!39964) (not b!899671) (not d!111533) (not b!899818) (not d!111559) (not b!899741) (not b!899667) (not b!899768) (not bm!39970) (not b!899663) (not b!899796) (not b_lambda!12993) (not d!111543) (not d!111549) (not b_lambda!12999) (not d!111571) (not b!899717) (not b!899720) (not b!899706) (not d!111591) (not d!111585) (not b!899672) (not b!899711) (not d!111531) (not b!899822) (not d!111577) (not d!111537) (not b!899703) (not d!111581) (not d!111511) (not bm!39973) (not d!111561) (not d!111553) (not b!899709) (not b!899708) (not d!111567) (not d!111515) (not b!899673) (not d!111545) (not d!111539) (not mapNonEmpty!29217) (not b!899716) (not d!111587) (not b!899659) (not b!899712) (not b_lambda!13001) (not b!899658) b_and!26351 (not b!899792) (not b!899669) (not d!111527) (not d!111579) (not b!899661) (not b!899670) (not b!899719) (not b!899754) (not b!899662) (not b!899819) (not d!111541) (not b!899732) (not d!111547) (not b!899702) (not b_next!16035) (not d!111529) (not d!111555) (not b!899799) (not b!899798) (not d!111509) (not d!111557) (not b!899793) (not d!111575) (not bm!39967) (not d!111535) tp_is_empty!18363 (not b!899781) (not d!111523) (not b!899710) (not b!899735) (not b!899801) (not d!111551))
(check-sat b_and!26351 (not b_next!16035))
