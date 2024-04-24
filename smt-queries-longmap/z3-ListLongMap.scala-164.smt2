; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3126 () Bool)

(assert start!3126)

(declare-fun b!19014 () Bool)

(declare-fun b_free!661 () Bool)

(declare-fun b_next!661 () Bool)

(assert (=> b!19014 (= b_free!661 (not b_next!661))))

(declare-fun tp!3181 () Bool)

(declare-fun b_and!1315 () Bool)

(assert (=> b!19014 (= tp!3181 b_and!1315)))

(declare-fun e!12205 () Bool)

(declare-fun tp_is_empty!925 () Bool)

(declare-datatypes ((V!1059 0))(
  ( (V!1060 (val!489 Int)) )
))
(declare-datatypes ((ValueCell!263 0))(
  ( (ValueCellFull!263 (v!1494 V!1059)) (EmptyCell!263) )
))
(declare-datatypes ((array!1041 0))(
  ( (array!1042 (arr!500 (Array (_ BitVec 32) ValueCell!263)) (size!590 (_ BitVec 32))) )
))
(declare-datatypes ((array!1043 0))(
  ( (array!1044 (arr!501 (Array (_ BitVec 32) (_ BitVec 64))) (size!591 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!112 0))(
  ( (LongMapFixedSize!113 (defaultEntry!1675 Int) (mask!4614 (_ BitVec 32)) (extraKeys!1585 (_ BitVec 32)) (zeroValue!1609 V!1059) (minValue!1609 V!1059) (_size!89 (_ BitVec 32)) (_keys!3100 array!1043) (_values!1671 array!1041) (_vacant!89 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!112 0))(
  ( (Cell!113 (v!1495 LongMapFixedSize!112)) )
))
(declare-datatypes ((LongMap!112 0))(
  ( (LongMap!113 (underlying!67 Cell!112)) )
))
(declare-fun thiss!938 () LongMap!112)

(declare-fun e!12207 () Bool)

(declare-fun array_inv!363 (array!1043) Bool)

(declare-fun array_inv!364 (array!1041) Bool)

(assert (=> b!19014 (= e!12207 (and tp!3181 tp_is_empty!925 (array_inv!363 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) (array_inv!364 (_values!1671 (v!1495 (underlying!67 thiss!938)))) e!12205))))

(declare-fun res!13035 () Bool)

(declare-fun e!12204 () Bool)

(assert (=> start!3126 (=> (not res!13035) (not e!12204))))

(declare-fun valid!62 (LongMap!112) Bool)

(assert (=> start!3126 (= res!13035 (valid!62 thiss!938))))

(assert (=> start!3126 e!12204))

(declare-fun e!12208 () Bool)

(assert (=> start!3126 e!12208))

(declare-fun b!19015 () Bool)

(declare-fun e!12210 () Bool)

(assert (=> b!19015 (= e!12210 e!12207)))

(declare-fun b!19016 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19016 (= e!12204 (not (validMask!0 (mask!4614 (v!1495 (underlying!67 thiss!938))))))))

(declare-fun mapIsEmpty!829 () Bool)

(declare-fun mapRes!829 () Bool)

(assert (=> mapIsEmpty!829 mapRes!829))

(declare-fun b!19017 () Bool)

(declare-fun e!12206 () Bool)

(assert (=> b!19017 (= e!12206 tp_is_empty!925)))

(declare-fun mapNonEmpty!829 () Bool)

(declare-fun tp!3180 () Bool)

(assert (=> mapNonEmpty!829 (= mapRes!829 (and tp!3180 e!12206))))

(declare-fun mapValue!829 () ValueCell!263)

(declare-fun mapRest!829 () (Array (_ BitVec 32) ValueCell!263))

(declare-fun mapKey!829 () (_ BitVec 32))

(assert (=> mapNonEmpty!829 (= (arr!500 (_values!1671 (v!1495 (underlying!67 thiss!938)))) (store mapRest!829 mapKey!829 mapValue!829))))

(declare-fun b!19018 () Bool)

(declare-fun e!12209 () Bool)

(assert (=> b!19018 (= e!12205 (and e!12209 mapRes!829))))

(declare-fun condMapEmpty!829 () Bool)

(declare-fun mapDefault!829 () ValueCell!263)

(assert (=> b!19018 (= condMapEmpty!829 (= (arr!500 (_values!1671 (v!1495 (underlying!67 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!263)) mapDefault!829)))))

(declare-fun b!19019 () Bool)

(assert (=> b!19019 (= e!12209 tp_is_empty!925)))

(declare-fun b!19020 () Bool)

(assert (=> b!19020 (= e!12208 e!12210)))

(assert (= (and start!3126 res!13035) b!19016))

(assert (= (and b!19018 condMapEmpty!829) mapIsEmpty!829))

(assert (= (and b!19018 (not condMapEmpty!829)) mapNonEmpty!829))

(get-info :version)

(assert (= (and mapNonEmpty!829 ((_ is ValueCellFull!263) mapValue!829)) b!19017))

(assert (= (and b!19018 ((_ is ValueCellFull!263) mapDefault!829)) b!19019))

(assert (= b!19014 b!19018))

(assert (= b!19015 b!19014))

(assert (= b!19020 b!19015))

(assert (= start!3126 b!19020))

(declare-fun m!13461 () Bool)

(assert (=> b!19014 m!13461))

(declare-fun m!13463 () Bool)

(assert (=> b!19014 m!13463))

(declare-fun m!13465 () Bool)

(assert (=> start!3126 m!13465))

(declare-fun m!13467 () Bool)

(assert (=> b!19016 m!13467))

(declare-fun m!13469 () Bool)

(assert (=> mapNonEmpty!829 m!13469))

(check-sat (not b_next!661) (not mapNonEmpty!829) tp_is_empty!925 (not b!19014) (not start!3126) b_and!1315 (not b!19016))
(check-sat b_and!1315 (not b_next!661))
(get-model)

(declare-fun d!3515 () Bool)

(assert (=> d!3515 (= (validMask!0 (mask!4614 (v!1495 (underlying!67 thiss!938)))) (and (or (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000001111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000011111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000001111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000011111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000001111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000011111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000001111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000011111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000001111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000011111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000001111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000011111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000111111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000001111111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000011111111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000111111111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000001111111111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000011111111111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000111111111111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00001111111111111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00011111111111111111111111111111) (= (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!19016 d!3515))

(declare-fun d!3517 () Bool)

(declare-fun valid!65 (LongMapFixedSize!112) Bool)

(assert (=> d!3517 (= (valid!62 thiss!938) (valid!65 (v!1495 (underlying!67 thiss!938))))))

(declare-fun bs!860 () Bool)

(assert (= bs!860 d!3517))

(declare-fun m!13491 () Bool)

(assert (=> bs!860 m!13491))

(assert (=> start!3126 d!3517))

(declare-fun d!3519 () Bool)

(assert (=> d!3519 (= (array_inv!363 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) (bvsge (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19014 d!3519))

(declare-fun d!3521 () Bool)

(assert (=> d!3521 (= (array_inv!364 (_values!1671 (v!1495 (underlying!67 thiss!938)))) (bvsge (size!590 (_values!1671 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19014 d!3521))

(declare-fun mapNonEmpty!838 () Bool)

(declare-fun mapRes!838 () Bool)

(declare-fun tp!3196 () Bool)

(declare-fun e!12263 () Bool)

(assert (=> mapNonEmpty!838 (= mapRes!838 (and tp!3196 e!12263))))

(declare-fun mapValue!838 () ValueCell!263)

(declare-fun mapRest!838 () (Array (_ BitVec 32) ValueCell!263))

(declare-fun mapKey!838 () (_ BitVec 32))

(assert (=> mapNonEmpty!838 (= mapRest!829 (store mapRest!838 mapKey!838 mapValue!838))))

(declare-fun b!19069 () Bool)

(assert (=> b!19069 (= e!12263 tp_is_empty!925)))

(declare-fun condMapEmpty!838 () Bool)

(declare-fun mapDefault!838 () ValueCell!263)

(assert (=> mapNonEmpty!829 (= condMapEmpty!838 (= mapRest!829 ((as const (Array (_ BitVec 32) ValueCell!263)) mapDefault!838)))))

(declare-fun e!12264 () Bool)

(assert (=> mapNonEmpty!829 (= tp!3180 (and e!12264 mapRes!838))))

(declare-fun mapIsEmpty!838 () Bool)

(assert (=> mapIsEmpty!838 mapRes!838))

(declare-fun b!19070 () Bool)

(assert (=> b!19070 (= e!12264 tp_is_empty!925)))

(assert (= (and mapNonEmpty!829 condMapEmpty!838) mapIsEmpty!838))

(assert (= (and mapNonEmpty!829 (not condMapEmpty!838)) mapNonEmpty!838))

(assert (= (and mapNonEmpty!838 ((_ is ValueCellFull!263) mapValue!838)) b!19069))

(assert (= (and mapNonEmpty!829 ((_ is ValueCellFull!263) mapDefault!838)) b!19070))

(declare-fun m!13493 () Bool)

(assert (=> mapNonEmpty!838 m!13493))

(check-sat (not b_next!661) (not d!3517) tp_is_empty!925 (not mapNonEmpty!838) b_and!1315)
(check-sat b_and!1315 (not b_next!661))
(get-model)

(declare-fun d!3523 () Bool)

(declare-fun res!13048 () Bool)

(declare-fun e!12267 () Bool)

(assert (=> d!3523 (=> (not res!13048) (not e!12267))))

(declare-fun simpleValid!10 (LongMapFixedSize!112) Bool)

(assert (=> d!3523 (= res!13048 (simpleValid!10 (v!1495 (underlying!67 thiss!938))))))

(assert (=> d!3523 (= (valid!65 (v!1495 (underlying!67 thiss!938))) e!12267)))

(declare-fun b!19077 () Bool)

(declare-fun res!13049 () Bool)

(assert (=> b!19077 (=> (not res!13049) (not e!12267))))

(declare-fun arrayCountValidKeys!0 (array!1043 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19077 (= res!13049 (= (arrayCountValidKeys!0 (_keys!3100 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938))))) (_size!89 (v!1495 (underlying!67 thiss!938)))))))

(declare-fun b!19078 () Bool)

(declare-fun res!13050 () Bool)

(assert (=> b!19078 (=> (not res!13050) (not e!12267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1043 (_ BitVec 32)) Bool)

(assert (=> b!19078 (= res!13050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3100 (v!1495 (underlying!67 thiss!938))) (mask!4614 (v!1495 (underlying!67 thiss!938)))))))

(declare-fun b!19079 () Bool)

(declare-datatypes ((List!541 0))(
  ( (Nil!538) (Cons!537 (h!1103 (_ BitVec 64)) (t!3178 List!541)) )
))
(declare-fun arrayNoDuplicates!0 (array!1043 (_ BitVec 32) List!541) Bool)

(assert (=> b!19079 (= e!12267 (arrayNoDuplicates!0 (_keys!3100 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000000 Nil!538))))

(assert (= (and d!3523 res!13048) b!19077))

(assert (= (and b!19077 res!13049) b!19078))

(assert (= (and b!19078 res!13050) b!19079))

(declare-fun m!13495 () Bool)

(assert (=> d!3523 m!13495))

(declare-fun m!13497 () Bool)

(assert (=> b!19077 m!13497))

(declare-fun m!13499 () Bool)

(assert (=> b!19078 m!13499))

(declare-fun m!13501 () Bool)

(assert (=> b!19079 m!13501))

(assert (=> d!3517 d!3523))

(declare-fun mapNonEmpty!839 () Bool)

(declare-fun mapRes!839 () Bool)

(declare-fun tp!3197 () Bool)

(declare-fun e!12268 () Bool)

(assert (=> mapNonEmpty!839 (= mapRes!839 (and tp!3197 e!12268))))

(declare-fun mapValue!839 () ValueCell!263)

(declare-fun mapRest!839 () (Array (_ BitVec 32) ValueCell!263))

(declare-fun mapKey!839 () (_ BitVec 32))

(assert (=> mapNonEmpty!839 (= mapRest!838 (store mapRest!839 mapKey!839 mapValue!839))))

(declare-fun b!19080 () Bool)

(assert (=> b!19080 (= e!12268 tp_is_empty!925)))

(declare-fun condMapEmpty!839 () Bool)

(declare-fun mapDefault!839 () ValueCell!263)

(assert (=> mapNonEmpty!838 (= condMapEmpty!839 (= mapRest!838 ((as const (Array (_ BitVec 32) ValueCell!263)) mapDefault!839)))))

(declare-fun e!12269 () Bool)

(assert (=> mapNonEmpty!838 (= tp!3196 (and e!12269 mapRes!839))))

(declare-fun mapIsEmpty!839 () Bool)

(assert (=> mapIsEmpty!839 mapRes!839))

(declare-fun b!19081 () Bool)

(assert (=> b!19081 (= e!12269 tp_is_empty!925)))

(assert (= (and mapNonEmpty!838 condMapEmpty!839) mapIsEmpty!839))

(assert (= (and mapNonEmpty!838 (not condMapEmpty!839)) mapNonEmpty!839))

(assert (= (and mapNonEmpty!839 ((_ is ValueCellFull!263) mapValue!839)) b!19080))

(assert (= (and mapNonEmpty!838 ((_ is ValueCellFull!263) mapDefault!839)) b!19081))

(declare-fun m!13503 () Bool)

(assert (=> mapNonEmpty!839 m!13503))

(check-sat (not b!19077) tp_is_empty!925 (not b!19078) (not mapNonEmpty!839) b_and!1315 (not d!3523) (not b!19079) (not b_next!661))
(check-sat b_and!1315 (not b_next!661))
(get-model)

(declare-fun b!19092 () Bool)

(declare-fun e!12278 () Bool)

(declare-fun call!880 () Bool)

(assert (=> b!19092 (= e!12278 call!880)))

(declare-fun b!19093 () Bool)

(declare-fun e!12281 () Bool)

(declare-fun e!12279 () Bool)

(assert (=> b!19093 (= e!12281 e!12279)))

(declare-fun res!13059 () Bool)

(assert (=> b!19093 (=> (not res!13059) (not e!12279))))

(declare-fun e!12280 () Bool)

(assert (=> b!19093 (= res!13059 (not e!12280))))

(declare-fun res!13057 () Bool)

(assert (=> b!19093 (=> (not res!13057) (not e!12280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!19093 (= res!13057 (validKeyInArray!0 (select (arr!501 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun d!3525 () Bool)

(declare-fun res!13058 () Bool)

(assert (=> d!3525 (=> res!13058 e!12281)))

(assert (=> d!3525 (= res!13058 (bvsge #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938))))))))

(assert (=> d!3525 (= (arrayNoDuplicates!0 (_keys!3100 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000000 Nil!538) e!12281)))

(declare-fun b!19094 () Bool)

(declare-fun contains!217 (List!541 (_ BitVec 64)) Bool)

(assert (=> b!19094 (= e!12280 (contains!217 Nil!538 (select (arr!501 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun bm!877 () Bool)

(declare-fun c!2036 () Bool)

(assert (=> bm!877 (= call!880 (arrayNoDuplicates!0 (_keys!3100 (v!1495 (underlying!67 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2036 (Cons!537 (select (arr!501 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000) Nil!538) Nil!538)))))

(declare-fun b!19095 () Bool)

(assert (=> b!19095 (= e!12279 e!12278)))

(assert (=> b!19095 (= c!2036 (validKeyInArray!0 (select (arr!501 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19096 () Bool)

(assert (=> b!19096 (= e!12278 call!880)))

(assert (= (and d!3525 (not res!13058)) b!19093))

(assert (= (and b!19093 res!13057) b!19094))

(assert (= (and b!19093 res!13059) b!19095))

(assert (= (and b!19095 c!2036) b!19096))

(assert (= (and b!19095 (not c!2036)) b!19092))

(assert (= (or b!19096 b!19092) bm!877))

(declare-fun m!13505 () Bool)

(assert (=> b!19093 m!13505))

(assert (=> b!19093 m!13505))

(declare-fun m!13507 () Bool)

(assert (=> b!19093 m!13507))

(assert (=> b!19094 m!13505))

(assert (=> b!19094 m!13505))

(declare-fun m!13509 () Bool)

(assert (=> b!19094 m!13509))

(assert (=> bm!877 m!13505))

(declare-fun m!13511 () Bool)

(assert (=> bm!877 m!13511))

(assert (=> b!19095 m!13505))

(assert (=> b!19095 m!13505))

(assert (=> b!19095 m!13507))

(assert (=> b!19079 d!3525))

(declare-fun d!3527 () Bool)

(declare-fun res!13065 () Bool)

(declare-fun e!12288 () Bool)

(assert (=> d!3527 (=> res!13065 e!12288)))

(assert (=> d!3527 (= res!13065 (bvsge #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938))))))))

(assert (=> d!3527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3100 (v!1495 (underlying!67 thiss!938))) (mask!4614 (v!1495 (underlying!67 thiss!938)))) e!12288)))

(declare-fun b!19105 () Bool)

(declare-fun e!12289 () Bool)

(assert (=> b!19105 (= e!12288 e!12289)))

(declare-fun c!2039 () Bool)

(assert (=> b!19105 (= c!2039 (validKeyInArray!0 (select (arr!501 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19106 () Bool)

(declare-fun e!12290 () Bool)

(assert (=> b!19106 (= e!12289 e!12290)))

(declare-fun lt!5396 () (_ BitVec 64))

(assert (=> b!19106 (= lt!5396 (select (arr!501 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!388 0))(
  ( (Unit!389) )
))
(declare-fun lt!5395 () Unit!388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1043 (_ BitVec 64) (_ BitVec 32)) Unit!388)

(assert (=> b!19106 (= lt!5395 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3100 (v!1495 (underlying!67 thiss!938))) lt!5396 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19106 (arrayContainsKey!0 (_keys!3100 (v!1495 (underlying!67 thiss!938))) lt!5396 #b00000000000000000000000000000000)))

(declare-fun lt!5397 () Unit!388)

(assert (=> b!19106 (= lt!5397 lt!5395)))

(declare-fun res!13064 () Bool)

(declare-datatypes ((SeekEntryResult!44 0))(
  ( (MissingZero!44 (index!2296 (_ BitVec 32))) (Found!44 (index!2297 (_ BitVec 32))) (Intermediate!44 (undefined!856 Bool) (index!2298 (_ BitVec 32)) (x!4699 (_ BitVec 32))) (Undefined!44) (MissingVacant!44 (index!2299 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1043 (_ BitVec 32)) SeekEntryResult!44)

(assert (=> b!19106 (= res!13064 (= (seekEntryOrOpen!0 (select (arr!501 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000) (_keys!3100 (v!1495 (underlying!67 thiss!938))) (mask!4614 (v!1495 (underlying!67 thiss!938)))) (Found!44 #b00000000000000000000000000000000)))))

(assert (=> b!19106 (=> (not res!13064) (not e!12290))))

(declare-fun b!19107 () Bool)

(declare-fun call!883 () Bool)

(assert (=> b!19107 (= e!12289 call!883)))

(declare-fun bm!880 () Bool)

(assert (=> bm!880 (= call!883 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3100 (v!1495 (underlying!67 thiss!938))) (mask!4614 (v!1495 (underlying!67 thiss!938)))))))

(declare-fun b!19108 () Bool)

(assert (=> b!19108 (= e!12290 call!883)))

(assert (= (and d!3527 (not res!13065)) b!19105))

(assert (= (and b!19105 c!2039) b!19106))

(assert (= (and b!19105 (not c!2039)) b!19107))

(assert (= (and b!19106 res!13064) b!19108))

(assert (= (or b!19108 b!19107) bm!880))

(assert (=> b!19105 m!13505))

(assert (=> b!19105 m!13505))

(assert (=> b!19105 m!13507))

(assert (=> b!19106 m!13505))

(declare-fun m!13513 () Bool)

(assert (=> b!19106 m!13513))

(declare-fun m!13515 () Bool)

(assert (=> b!19106 m!13515))

(assert (=> b!19106 m!13505))

(declare-fun m!13517 () Bool)

(assert (=> b!19106 m!13517))

(declare-fun m!13519 () Bool)

(assert (=> bm!880 m!13519))

(assert (=> b!19078 d!3527))

(declare-fun b!19118 () Bool)

(declare-fun res!13075 () Bool)

(declare-fun e!12293 () Bool)

(assert (=> b!19118 (=> (not res!13075) (not e!12293))))

(declare-fun size!596 (LongMapFixedSize!112) (_ BitVec 32))

(assert (=> b!19118 (= res!13075 (bvsge (size!596 (v!1495 (underlying!67 thiss!938))) (_size!89 (v!1495 (underlying!67 thiss!938)))))))

(declare-fun b!19117 () Bool)

(declare-fun res!13076 () Bool)

(assert (=> b!19117 (=> (not res!13076) (not e!12293))))

(assert (=> b!19117 (= res!13076 (and (= (size!590 (_values!1671 (v!1495 (underlying!67 thiss!938)))) (bvadd (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000001)) (= (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) (size!590 (_values!1671 (v!1495 (underlying!67 thiss!938))))) (bvsge (_size!89 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!89 (v!1495 (underlying!67 thiss!938))) (bvadd (mask!4614 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000001))))))

(declare-fun d!3529 () Bool)

(declare-fun res!13077 () Bool)

(assert (=> d!3529 (=> (not res!13077) (not e!12293))))

(assert (=> d!3529 (= res!13077 (validMask!0 (mask!4614 (v!1495 (underlying!67 thiss!938)))))))

(assert (=> d!3529 (= (simpleValid!10 (v!1495 (underlying!67 thiss!938))) e!12293)))

(declare-fun b!19119 () Bool)

(declare-fun res!13074 () Bool)

(assert (=> b!19119 (=> (not res!13074) (not e!12293))))

(assert (=> b!19119 (= res!13074 (= (size!596 (v!1495 (underlying!67 thiss!938))) (bvadd (_size!89 (v!1495 (underlying!67 thiss!938))) (bvsdiv (bvadd (extraKeys!1585 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!19120 () Bool)

(assert (=> b!19120 (= e!12293 (and (bvsge (extraKeys!1585 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000000) (bvsle (extraKeys!1585 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000011) (bvsge (_vacant!89 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000000)))))

(assert (= (and d!3529 res!13077) b!19117))

(assert (= (and b!19117 res!13076) b!19118))

(assert (= (and b!19118 res!13075) b!19119))

(assert (= (and b!19119 res!13074) b!19120))

(declare-fun m!13521 () Bool)

(assert (=> b!19118 m!13521))

(assert (=> d!3529 m!13467))

(assert (=> b!19119 m!13521))

(assert (=> d!3523 d!3529))

(declare-fun b!19129 () Bool)

(declare-fun e!12299 () (_ BitVec 32))

(declare-fun call!886 () (_ BitVec 32))

(assert (=> b!19129 (= e!12299 (bvadd #b00000000000000000000000000000001 call!886))))

(declare-fun d!3531 () Bool)

(declare-fun lt!5400 () (_ BitVec 32))

(assert (=> d!3531 (and (bvsge lt!5400 #b00000000000000000000000000000000) (bvsle lt!5400 (bvsub (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun e!12298 () (_ BitVec 32))

(assert (=> d!3531 (= lt!5400 e!12298)))

(declare-fun c!2045 () Bool)

(assert (=> d!3531 (= c!2045 (bvsge #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938))))))))

(assert (=> d!3531 (and (bvsle #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938))))))))

(assert (=> d!3531 (= (arrayCountValidKeys!0 (_keys!3100 (v!1495 (underlying!67 thiss!938))) #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938))))) lt!5400)))

(declare-fun bm!883 () Bool)

(assert (=> bm!883 (= call!886 (arrayCountValidKeys!0 (_keys!3100 (v!1495 (underlying!67 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!591 (_keys!3100 (v!1495 (underlying!67 thiss!938))))))))

(declare-fun b!19130 () Bool)

(assert (=> b!19130 (= e!12298 e!12299)))

(declare-fun c!2044 () Bool)

(assert (=> b!19130 (= c!2044 (validKeyInArray!0 (select (arr!501 (_keys!3100 (v!1495 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19131 () Bool)

(assert (=> b!19131 (= e!12299 call!886)))

(declare-fun b!19132 () Bool)

(assert (=> b!19132 (= e!12298 #b00000000000000000000000000000000)))

(assert (= (and d!3531 c!2045) b!19132))

(assert (= (and d!3531 (not c!2045)) b!19130))

(assert (= (and b!19130 c!2044) b!19129))

(assert (= (and b!19130 (not c!2044)) b!19131))

(assert (= (or b!19129 b!19131) bm!883))

(declare-fun m!13523 () Bool)

(assert (=> bm!883 m!13523))

(assert (=> b!19130 m!13505))

(assert (=> b!19130 m!13505))

(assert (=> b!19130 m!13507))

(assert (=> b!19077 d!3531))

(declare-fun mapNonEmpty!840 () Bool)

(declare-fun mapRes!840 () Bool)

(declare-fun tp!3198 () Bool)

(declare-fun e!12300 () Bool)

(assert (=> mapNonEmpty!840 (= mapRes!840 (and tp!3198 e!12300))))

(declare-fun mapKey!840 () (_ BitVec 32))

(declare-fun mapValue!840 () ValueCell!263)

(declare-fun mapRest!840 () (Array (_ BitVec 32) ValueCell!263))

(assert (=> mapNonEmpty!840 (= mapRest!839 (store mapRest!840 mapKey!840 mapValue!840))))

(declare-fun b!19133 () Bool)

(assert (=> b!19133 (= e!12300 tp_is_empty!925)))

(declare-fun condMapEmpty!840 () Bool)

(declare-fun mapDefault!840 () ValueCell!263)

(assert (=> mapNonEmpty!839 (= condMapEmpty!840 (= mapRest!839 ((as const (Array (_ BitVec 32) ValueCell!263)) mapDefault!840)))))

(declare-fun e!12301 () Bool)

(assert (=> mapNonEmpty!839 (= tp!3197 (and e!12301 mapRes!840))))

(declare-fun mapIsEmpty!840 () Bool)

(assert (=> mapIsEmpty!840 mapRes!840))

(declare-fun b!19134 () Bool)

(assert (=> b!19134 (= e!12301 tp_is_empty!925)))

(assert (= (and mapNonEmpty!839 condMapEmpty!840) mapIsEmpty!840))

(assert (= (and mapNonEmpty!839 (not condMapEmpty!840)) mapNonEmpty!840))

(assert (= (and mapNonEmpty!840 ((_ is ValueCellFull!263) mapValue!840)) b!19133))

(assert (= (and mapNonEmpty!839 ((_ is ValueCellFull!263) mapDefault!840)) b!19134))

(declare-fun m!13525 () Bool)

(assert (=> mapNonEmpty!840 m!13525))

(check-sat (not b!19093) (not b_next!661) (not b!19119) (not b!19106) (not bm!883) (not bm!880) (not b!19095) (not d!3529) (not mapNonEmpty!840) (not b!19130) (not b!19094) (not b!19105) (not bm!877) tp_is_empty!925 b_and!1315 (not b!19118))
(check-sat b_and!1315 (not b_next!661))
