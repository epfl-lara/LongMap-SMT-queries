; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107716 () Bool)

(assert start!107716)

(declare-fun b!1274341 () Bool)

(declare-fun b_free!27697 () Bool)

(declare-fun b_next!27697 () Bool)

(assert (=> b!1274341 (= b_free!27697 (not b_next!27697))))

(declare-fun tp!97626 () Bool)

(declare-fun b_and!45755 () Bool)

(assert (=> b!1274341 (= tp!97626 b_and!45755)))

(declare-fun b!1274338 () Bool)

(declare-fun res!847177 () Bool)

(declare-fun e!727075 () Bool)

(assert (=> b!1274338 (=> (not res!847177) (not e!727075))))

(declare-datatypes ((V!49283 0))(
  ( (V!49284 (val!16608 Int)) )
))
(declare-datatypes ((ValueCell!15680 0))(
  ( (ValueCellFull!15680 (v!19240 V!49283)) (EmptyCell!15680) )
))
(declare-datatypes ((array!83415 0))(
  ( (array!83416 (arr!40232 (Array (_ BitVec 32) ValueCell!15680)) (size!40774 (_ BitVec 32))) )
))
(declare-datatypes ((array!83417 0))(
  ( (array!83418 (arr!40233 (Array (_ BitVec 32) (_ BitVec 64))) (size!40775 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6124 0))(
  ( (LongMapFixedSize!6125 (defaultEntry!6708 Int) (mask!34535 (_ BitVec 32)) (extraKeys!6387 (_ BitVec 32)) (zeroValue!6493 V!49283) (minValue!6493 V!49283) (_size!3117 (_ BitVec 32)) (_keys!12157 array!83417) (_values!6731 array!83415) (_vacant!3117 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6124)

(assert (=> b!1274338 (= res!847177 (and (= (size!40774 (_values!6731 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34535 thiss!1559))) (= (size!40775 (_keys!12157 thiss!1559)) (size!40774 (_values!6731 thiss!1559))) (bvsge (mask!34535 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6387 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6387 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun res!847176 () Bool)

(assert (=> start!107716 (=> (not res!847176) (not e!727075))))

(declare-fun valid!2299 (LongMapFixedSize!6124) Bool)

(assert (=> start!107716 (= res!847176 (valid!2299 thiss!1559))))

(assert (=> start!107716 e!727075))

(declare-fun e!727079 () Bool)

(assert (=> start!107716 e!727079))

(declare-fun b!1274339 () Bool)

(declare-fun e!727080 () Bool)

(declare-fun tp_is_empty!33067 () Bool)

(assert (=> b!1274339 (= e!727080 tp_is_empty!33067)))

(declare-fun b!1274340 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83417 (_ BitVec 32)) Bool)

(assert (=> b!1274340 (= e!727075 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12157 thiss!1559) (mask!34535 thiss!1559))))))

(declare-fun mapNonEmpty!51210 () Bool)

(declare-fun mapRes!51210 () Bool)

(declare-fun tp!97625 () Bool)

(declare-fun e!727076 () Bool)

(assert (=> mapNonEmpty!51210 (= mapRes!51210 (and tp!97625 e!727076))))

(declare-fun mapValue!51210 () ValueCell!15680)

(declare-fun mapRest!51210 () (Array (_ BitVec 32) ValueCell!15680))

(declare-fun mapKey!51210 () (_ BitVec 32))

(assert (=> mapNonEmpty!51210 (= (arr!40232 (_values!6731 thiss!1559)) (store mapRest!51210 mapKey!51210 mapValue!51210))))

(declare-fun e!727077 () Bool)

(declare-fun array_inv!30767 (array!83417) Bool)

(declare-fun array_inv!30768 (array!83415) Bool)

(assert (=> b!1274341 (= e!727079 (and tp!97626 tp_is_empty!33067 (array_inv!30767 (_keys!12157 thiss!1559)) (array_inv!30768 (_values!6731 thiss!1559)) e!727077))))

(declare-fun b!1274342 () Bool)

(declare-fun res!847175 () Bool)

(assert (=> b!1274342 (=> (not res!847175) (not e!727075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1274342 (= res!847175 (validMask!0 (mask!34535 thiss!1559)))))

(declare-fun b!1274343 () Bool)

(assert (=> b!1274343 (= e!727076 tp_is_empty!33067)))

(declare-fun b!1274344 () Bool)

(assert (=> b!1274344 (= e!727077 (and e!727080 mapRes!51210))))

(declare-fun condMapEmpty!51210 () Bool)

(declare-fun mapDefault!51210 () ValueCell!15680)

(assert (=> b!1274344 (= condMapEmpty!51210 (= (arr!40232 (_values!6731 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15680)) mapDefault!51210)))))

(declare-fun mapIsEmpty!51210 () Bool)

(assert (=> mapIsEmpty!51210 mapRes!51210))

(assert (= (and start!107716 res!847176) b!1274342))

(assert (= (and b!1274342 res!847175) b!1274338))

(assert (= (and b!1274338 res!847177) b!1274340))

(assert (= (and b!1274344 condMapEmpty!51210) mapIsEmpty!51210))

(assert (= (and b!1274344 (not condMapEmpty!51210)) mapNonEmpty!51210))

(get-info :version)

(assert (= (and mapNonEmpty!51210 ((_ is ValueCellFull!15680) mapValue!51210)) b!1274343))

(assert (= (and b!1274344 ((_ is ValueCellFull!15680) mapDefault!51210)) b!1274339))

(assert (= b!1274341 b!1274344))

(assert (= start!107716 b!1274341))

(declare-fun m!1172021 () Bool)

(assert (=> b!1274341 m!1172021))

(declare-fun m!1172023 () Bool)

(assert (=> b!1274341 m!1172023))

(declare-fun m!1172025 () Bool)

(assert (=> start!107716 m!1172025))

(declare-fun m!1172027 () Bool)

(assert (=> mapNonEmpty!51210 m!1172027))

(declare-fun m!1172029 () Bool)

(assert (=> b!1274342 m!1172029))

(declare-fun m!1172031 () Bool)

(assert (=> b!1274340 m!1172031))

(check-sat tp_is_empty!33067 (not b!1274341) (not b_next!27697) (not b!1274342) b_and!45755 (not start!107716) (not b!1274340) (not mapNonEmpty!51210))
(check-sat b_and!45755 (not b_next!27697))
(get-model)

(declare-fun d!140393 () Bool)

(assert (=> d!140393 (= (array_inv!30767 (_keys!12157 thiss!1559)) (bvsge (size!40775 (_keys!12157 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274341 d!140393))

(declare-fun d!140395 () Bool)

(assert (=> d!140395 (= (array_inv!30768 (_values!6731 thiss!1559)) (bvsge (size!40774 (_values!6731 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274341 d!140395))

(declare-fun d!140397 () Bool)

(assert (=> d!140397 (= (validMask!0 (mask!34535 thiss!1559)) (and (or (= (mask!34535 thiss!1559) #b00000000000000000000000000000111) (= (mask!34535 thiss!1559) #b00000000000000000000000000001111) (= (mask!34535 thiss!1559) #b00000000000000000000000000011111) (= (mask!34535 thiss!1559) #b00000000000000000000000000111111) (= (mask!34535 thiss!1559) #b00000000000000000000000001111111) (= (mask!34535 thiss!1559) #b00000000000000000000000011111111) (= (mask!34535 thiss!1559) #b00000000000000000000000111111111) (= (mask!34535 thiss!1559) #b00000000000000000000001111111111) (= (mask!34535 thiss!1559) #b00000000000000000000011111111111) (= (mask!34535 thiss!1559) #b00000000000000000000111111111111) (= (mask!34535 thiss!1559) #b00000000000000000001111111111111) (= (mask!34535 thiss!1559) #b00000000000000000011111111111111) (= (mask!34535 thiss!1559) #b00000000000000000111111111111111) (= (mask!34535 thiss!1559) #b00000000000000001111111111111111) (= (mask!34535 thiss!1559) #b00000000000000011111111111111111) (= (mask!34535 thiss!1559) #b00000000000000111111111111111111) (= (mask!34535 thiss!1559) #b00000000000001111111111111111111) (= (mask!34535 thiss!1559) #b00000000000011111111111111111111) (= (mask!34535 thiss!1559) #b00000000000111111111111111111111) (= (mask!34535 thiss!1559) #b00000000001111111111111111111111) (= (mask!34535 thiss!1559) #b00000000011111111111111111111111) (= (mask!34535 thiss!1559) #b00000000111111111111111111111111) (= (mask!34535 thiss!1559) #b00000001111111111111111111111111) (= (mask!34535 thiss!1559) #b00000011111111111111111111111111) (= (mask!34535 thiss!1559) #b00000111111111111111111111111111) (= (mask!34535 thiss!1559) #b00001111111111111111111111111111) (= (mask!34535 thiss!1559) #b00011111111111111111111111111111) (= (mask!34535 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34535 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1274342 d!140397))

(declare-fun d!140399 () Bool)

(declare-fun res!847202 () Bool)

(declare-fun e!727119 () Bool)

(assert (=> d!140399 (=> (not res!847202) (not e!727119))))

(declare-fun simpleValid!461 (LongMapFixedSize!6124) Bool)

(assert (=> d!140399 (= res!847202 (simpleValid!461 thiss!1559))))

(assert (=> d!140399 (= (valid!2299 thiss!1559) e!727119)))

(declare-fun b!1274393 () Bool)

(declare-fun res!847203 () Bool)

(assert (=> b!1274393 (=> (not res!847203) (not e!727119))))

(declare-fun arrayCountValidKeys!0 (array!83417 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274393 (= res!847203 (= (arrayCountValidKeys!0 (_keys!12157 thiss!1559) #b00000000000000000000000000000000 (size!40775 (_keys!12157 thiss!1559))) (_size!3117 thiss!1559)))))

(declare-fun b!1274394 () Bool)

(declare-fun res!847204 () Bool)

(assert (=> b!1274394 (=> (not res!847204) (not e!727119))))

(assert (=> b!1274394 (= res!847204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12157 thiss!1559) (mask!34535 thiss!1559)))))

(declare-fun b!1274395 () Bool)

(declare-datatypes ((List!28590 0))(
  ( (Nil!28587) (Cons!28586 (h!29804 (_ BitVec 64)) (t!42115 List!28590)) )
))
(declare-fun arrayNoDuplicates!0 (array!83417 (_ BitVec 32) List!28590) Bool)

(assert (=> b!1274395 (= e!727119 (arrayNoDuplicates!0 (_keys!12157 thiss!1559) #b00000000000000000000000000000000 Nil!28587))))

(assert (= (and d!140399 res!847202) b!1274393))

(assert (= (and b!1274393 res!847203) b!1274394))

(assert (= (and b!1274394 res!847204) b!1274395))

(declare-fun m!1172057 () Bool)

(assert (=> d!140399 m!1172057))

(declare-fun m!1172059 () Bool)

(assert (=> b!1274393 m!1172059))

(assert (=> b!1274394 m!1172031))

(declare-fun m!1172061 () Bool)

(assert (=> b!1274395 m!1172061))

(assert (=> start!107716 d!140399))

(declare-fun b!1274404 () Bool)

(declare-fun e!727126 () Bool)

(declare-fun call!62650 () Bool)

(assert (=> b!1274404 (= e!727126 call!62650)))

(declare-fun b!1274405 () Bool)

(declare-fun e!727127 () Bool)

(assert (=> b!1274405 (= e!727127 e!727126)))

(declare-fun lt!575597 () (_ BitVec 64))

(assert (=> b!1274405 (= lt!575597 (select (arr!40233 (_keys!12157 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42299 0))(
  ( (Unit!42300) )
))
(declare-fun lt!575596 () Unit!42299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83417 (_ BitVec 64) (_ BitVec 32)) Unit!42299)

(assert (=> b!1274405 (= lt!575596 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12157 thiss!1559) lt!575597 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1274405 (arrayContainsKey!0 (_keys!12157 thiss!1559) lt!575597 #b00000000000000000000000000000000)))

(declare-fun lt!575595 () Unit!42299)

(assert (=> b!1274405 (= lt!575595 lt!575596)))

(declare-fun res!847210 () Bool)

(declare-datatypes ((SeekEntryResult!9950 0))(
  ( (MissingZero!9950 (index!42171 (_ BitVec 32))) (Found!9950 (index!42172 (_ BitVec 32))) (Intermediate!9950 (undefined!10762 Bool) (index!42173 (_ BitVec 32)) (x!112513 (_ BitVec 32))) (Undefined!9950) (MissingVacant!9950 (index!42174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83417 (_ BitVec 32)) SeekEntryResult!9950)

(assert (=> b!1274405 (= res!847210 (= (seekEntryOrOpen!0 (select (arr!40233 (_keys!12157 thiss!1559)) #b00000000000000000000000000000000) (_keys!12157 thiss!1559) (mask!34535 thiss!1559)) (Found!9950 #b00000000000000000000000000000000)))))

(assert (=> b!1274405 (=> (not res!847210) (not e!727126))))

(declare-fun b!1274406 () Bool)

(assert (=> b!1274406 (= e!727127 call!62650)))

(declare-fun bm!62647 () Bool)

(assert (=> bm!62647 (= call!62650 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12157 thiss!1559) (mask!34535 thiss!1559)))))

(declare-fun d!140401 () Bool)

(declare-fun res!847209 () Bool)

(declare-fun e!727128 () Bool)

(assert (=> d!140401 (=> res!847209 e!727128)))

(assert (=> d!140401 (= res!847209 (bvsge #b00000000000000000000000000000000 (size!40775 (_keys!12157 thiss!1559))))))

(assert (=> d!140401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12157 thiss!1559) (mask!34535 thiss!1559)) e!727128)))

(declare-fun b!1274407 () Bool)

(assert (=> b!1274407 (= e!727128 e!727127)))

(declare-fun c!124147 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274407 (= c!124147 (validKeyInArray!0 (select (arr!40233 (_keys!12157 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!140401 (not res!847209)) b!1274407))

(assert (= (and b!1274407 c!124147) b!1274405))

(assert (= (and b!1274407 (not c!124147)) b!1274406))

(assert (= (and b!1274405 res!847210) b!1274404))

(assert (= (or b!1274404 b!1274406) bm!62647))

(declare-fun m!1172063 () Bool)

(assert (=> b!1274405 m!1172063))

(declare-fun m!1172065 () Bool)

(assert (=> b!1274405 m!1172065))

(declare-fun m!1172067 () Bool)

(assert (=> b!1274405 m!1172067))

(assert (=> b!1274405 m!1172063))

(declare-fun m!1172069 () Bool)

(assert (=> b!1274405 m!1172069))

(declare-fun m!1172071 () Bool)

(assert (=> bm!62647 m!1172071))

(assert (=> b!1274407 m!1172063))

(assert (=> b!1274407 m!1172063))

(declare-fun m!1172073 () Bool)

(assert (=> b!1274407 m!1172073))

(assert (=> b!1274340 d!140401))

(declare-fun b!1274415 () Bool)

(declare-fun e!727133 () Bool)

(assert (=> b!1274415 (= e!727133 tp_is_empty!33067)))

(declare-fun condMapEmpty!51219 () Bool)

(declare-fun mapDefault!51219 () ValueCell!15680)

(assert (=> mapNonEmpty!51210 (= condMapEmpty!51219 (= mapRest!51210 ((as const (Array (_ BitVec 32) ValueCell!15680)) mapDefault!51219)))))

(declare-fun mapRes!51219 () Bool)

(assert (=> mapNonEmpty!51210 (= tp!97625 (and e!727133 mapRes!51219))))

(declare-fun mapNonEmpty!51219 () Bool)

(declare-fun tp!97641 () Bool)

(declare-fun e!727134 () Bool)

(assert (=> mapNonEmpty!51219 (= mapRes!51219 (and tp!97641 e!727134))))

(declare-fun mapRest!51219 () (Array (_ BitVec 32) ValueCell!15680))

(declare-fun mapValue!51219 () ValueCell!15680)

(declare-fun mapKey!51219 () (_ BitVec 32))

(assert (=> mapNonEmpty!51219 (= mapRest!51210 (store mapRest!51219 mapKey!51219 mapValue!51219))))

(declare-fun mapIsEmpty!51219 () Bool)

(assert (=> mapIsEmpty!51219 mapRes!51219))

(declare-fun b!1274414 () Bool)

(assert (=> b!1274414 (= e!727134 tp_is_empty!33067)))

(assert (= (and mapNonEmpty!51210 condMapEmpty!51219) mapIsEmpty!51219))

(assert (= (and mapNonEmpty!51210 (not condMapEmpty!51219)) mapNonEmpty!51219))

(assert (= (and mapNonEmpty!51219 ((_ is ValueCellFull!15680) mapValue!51219)) b!1274414))

(assert (= (and mapNonEmpty!51210 ((_ is ValueCellFull!15680) mapDefault!51219)) b!1274415))

(declare-fun m!1172075 () Bool)

(assert (=> mapNonEmpty!51219 m!1172075))

(check-sat (not b_next!27697) (not b!1274405) (not b!1274394) (not b!1274393) (not mapNonEmpty!51219) (not bm!62647) b_and!45755 (not d!140399) (not b!1274395) tp_is_empty!33067 (not b!1274407))
(check-sat b_and!45755 (not b_next!27697))
