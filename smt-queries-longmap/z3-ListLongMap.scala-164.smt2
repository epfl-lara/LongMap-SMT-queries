; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3120 () Bool)

(assert start!3120)

(declare-fun b!18998 () Bool)

(declare-fun b_free!661 () Bool)

(declare-fun b_next!661 () Bool)

(assert (=> b!18998 (= b_free!661 (not b_next!661))))

(declare-fun tp!3181 () Bool)

(declare-fun b_and!1315 () Bool)

(assert (=> b!18998 (= tp!3181 b_and!1315)))

(declare-fun mapNonEmpty!829 () Bool)

(declare-fun mapRes!829 () Bool)

(declare-fun tp!3180 () Bool)

(declare-fun e!12196 () Bool)

(assert (=> mapNonEmpty!829 (= mapRes!829 (and tp!3180 e!12196))))

(declare-fun mapKey!829 () (_ BitVec 32))

(declare-datatypes ((V!1059 0))(
  ( (V!1060 (val!489 Int)) )
))
(declare-datatypes ((ValueCell!263 0))(
  ( (ValueCellFull!263 (v!1493 V!1059)) (EmptyCell!263) )
))
(declare-fun mapRest!829 () (Array (_ BitVec 32) ValueCell!263))

(declare-fun mapValue!829 () ValueCell!263)

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
  ( (Cell!113 (v!1494 LongMapFixedSize!112)) )
))
(declare-datatypes ((LongMap!112 0))(
  ( (LongMap!113 (underlying!67 Cell!112)) )
))
(declare-fun thiss!938 () LongMap!112)

(assert (=> mapNonEmpty!829 (= (arr!500 (_values!1671 (v!1494 (underlying!67 thiss!938)))) (store mapRest!829 mapKey!829 mapValue!829))))

(declare-fun b!18996 () Bool)

(declare-fun tp_is_empty!925 () Bool)

(assert (=> b!18996 (= e!12196 tp_is_empty!925)))

(declare-fun mapIsEmpty!829 () Bool)

(assert (=> mapIsEmpty!829 mapRes!829))

(declare-fun b!18997 () Bool)

(declare-fun e!12195 () Bool)

(declare-fun e!12194 () Bool)

(assert (=> b!18997 (= e!12195 e!12194)))

(declare-fun e!12193 () Bool)

(declare-fun array_inv!355 (array!1043) Bool)

(declare-fun array_inv!356 (array!1041) Bool)

(assert (=> b!18998 (= e!12194 (and tp!3181 tp_is_empty!925 (array_inv!355 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) (array_inv!356 (_values!1671 (v!1494 (underlying!67 thiss!938)))) e!12193))))

(declare-fun b!18999 () Bool)

(declare-fun e!12190 () Bool)

(assert (=> b!18999 (= e!12190 tp_is_empty!925)))

(declare-fun b!19000 () Bool)

(declare-fun e!12192 () Bool)

(assert (=> b!19000 (= e!12192 e!12195)))

(declare-fun res!13025 () Bool)

(declare-fun e!12189 () Bool)

(assert (=> start!3120 (=> (not res!13025) (not e!12189))))

(declare-fun valid!63 (LongMap!112) Bool)

(assert (=> start!3120 (= res!13025 (valid!63 thiss!938))))

(assert (=> start!3120 e!12189))

(assert (=> start!3120 e!12192))

(declare-fun b!19001 () Bool)

(assert (=> b!19001 (= e!12193 (and e!12190 mapRes!829))))

(declare-fun condMapEmpty!829 () Bool)

(declare-fun mapDefault!829 () ValueCell!263)

(assert (=> b!19001 (= condMapEmpty!829 (= (arr!500 (_values!1671 (v!1494 (underlying!67 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!263)) mapDefault!829)))))

(declare-fun b!19002 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19002 (= e!12189 (not (validMask!0 (mask!4614 (v!1494 (underlying!67 thiss!938))))))))

(assert (= (and start!3120 res!13025) b!19002))

(assert (= (and b!19001 condMapEmpty!829) mapIsEmpty!829))

(assert (= (and b!19001 (not condMapEmpty!829)) mapNonEmpty!829))

(get-info :version)

(assert (= (and mapNonEmpty!829 ((_ is ValueCellFull!263) mapValue!829)) b!18996))

(assert (= (and b!19001 ((_ is ValueCellFull!263) mapDefault!829)) b!18999))

(assert (= b!18998 b!19001))

(assert (= b!18997 b!18998))

(assert (= b!19000 b!18997))

(assert (= start!3120 b!19000))

(declare-fun m!13447 () Bool)

(assert (=> mapNonEmpty!829 m!13447))

(declare-fun m!13449 () Bool)

(assert (=> b!18998 m!13449))

(declare-fun m!13451 () Bool)

(assert (=> b!18998 m!13451))

(declare-fun m!13453 () Bool)

(assert (=> start!3120 m!13453))

(declare-fun m!13455 () Bool)

(assert (=> b!19002 m!13455))

(check-sat (not mapNonEmpty!829) (not start!3120) b_and!1315 (not b_next!661) (not b!18998) (not b!19002) tp_is_empty!925)
(check-sat b_and!1315 (not b_next!661))
(get-model)

(declare-fun d!3509 () Bool)

(assert (=> d!3509 (= (array_inv!355 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) (bvsge (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!18998 d!3509))

(declare-fun d!3511 () Bool)

(assert (=> d!3511 (= (array_inv!356 (_values!1671 (v!1494 (underlying!67 thiss!938)))) (bvsge (size!590 (_values!1671 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!18998 d!3511))

(declare-fun d!3513 () Bool)

(assert (=> d!3513 (= (validMask!0 (mask!4614 (v!1494 (underlying!67 thiss!938)))) (and (or (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000001111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000011111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000001111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000011111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000001111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000011111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000001111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000011111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000001111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000011111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000001111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000011111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000111111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000001111111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000011111111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000111111111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000001111111111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000011111111111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000111111111111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00001111111111111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00011111111111111111111111111111) (= (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!19002 d!3513))

(declare-fun d!3515 () Bool)

(declare-fun valid!64 (LongMapFixedSize!112) Bool)

(assert (=> d!3515 (= (valid!63 thiss!938) (valid!64 (v!1494 (underlying!67 thiss!938))))))

(declare-fun bs!860 () Bool)

(assert (= bs!860 d!3515))

(declare-fun m!13477 () Bool)

(assert (=> bs!860 m!13477))

(assert (=> start!3120 d!3515))

(declare-fun condMapEmpty!838 () Bool)

(declare-fun mapDefault!838 () ValueCell!263)

(assert (=> mapNonEmpty!829 (= condMapEmpty!838 (= mapRest!829 ((as const (Array (_ BitVec 32) ValueCell!263)) mapDefault!838)))))

(declare-fun e!12250 () Bool)

(declare-fun mapRes!838 () Bool)

(assert (=> mapNonEmpty!829 (= tp!3180 (and e!12250 mapRes!838))))

(declare-fun mapNonEmpty!838 () Bool)

(declare-fun tp!3196 () Bool)

(declare-fun e!12249 () Bool)

(assert (=> mapNonEmpty!838 (= mapRes!838 (and tp!3196 e!12249))))

(declare-fun mapValue!838 () ValueCell!263)

(declare-fun mapKey!838 () (_ BitVec 32))

(declare-fun mapRest!838 () (Array (_ BitVec 32) ValueCell!263))

(assert (=> mapNonEmpty!838 (= mapRest!829 (store mapRest!838 mapKey!838 mapValue!838))))

(declare-fun mapIsEmpty!838 () Bool)

(assert (=> mapIsEmpty!838 mapRes!838))

(declare-fun b!19052 () Bool)

(assert (=> b!19052 (= e!12250 tp_is_empty!925)))

(declare-fun b!19051 () Bool)

(assert (=> b!19051 (= e!12249 tp_is_empty!925)))

(assert (= (and mapNonEmpty!829 condMapEmpty!838) mapIsEmpty!838))

(assert (= (and mapNonEmpty!829 (not condMapEmpty!838)) mapNonEmpty!838))

(assert (= (and mapNonEmpty!838 ((_ is ValueCellFull!263) mapValue!838)) b!19051))

(assert (= (and mapNonEmpty!829 ((_ is ValueCellFull!263) mapDefault!838)) b!19052))

(declare-fun m!13479 () Bool)

(assert (=> mapNonEmpty!838 m!13479))

(check-sat (not mapNonEmpty!838) b_and!1315 (not b_next!661) tp_is_empty!925 (not d!3515))
(check-sat b_and!1315 (not b_next!661))
(get-model)

(declare-fun d!3517 () Bool)

(declare-fun res!13038 () Bool)

(declare-fun e!12253 () Bool)

(assert (=> d!3517 (=> (not res!13038) (not e!12253))))

(declare-fun simpleValid!10 (LongMapFixedSize!112) Bool)

(assert (=> d!3517 (= res!13038 (simpleValid!10 (v!1494 (underlying!67 thiss!938))))))

(assert (=> d!3517 (= (valid!64 (v!1494 (underlying!67 thiss!938))) e!12253)))

(declare-fun b!19059 () Bool)

(declare-fun res!13039 () Bool)

(assert (=> b!19059 (=> (not res!13039) (not e!12253))))

(declare-fun arrayCountValidKeys!0 (array!1043 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19059 (= res!13039 (= (arrayCountValidKeys!0 (_keys!3100 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938))))) (_size!89 (v!1494 (underlying!67 thiss!938)))))))

(declare-fun b!19060 () Bool)

(declare-fun res!13040 () Bool)

(assert (=> b!19060 (=> (not res!13040) (not e!12253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1043 (_ BitVec 32)) Bool)

(assert (=> b!19060 (= res!13040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3100 (v!1494 (underlying!67 thiss!938))) (mask!4614 (v!1494 (underlying!67 thiss!938)))))))

(declare-fun b!19061 () Bool)

(declare-datatypes ((List!540 0))(
  ( (Nil!537) (Cons!536 (h!1102 (_ BitVec 64)) (t!3176 List!540)) )
))
(declare-fun arrayNoDuplicates!0 (array!1043 (_ BitVec 32) List!540) Bool)

(assert (=> b!19061 (= e!12253 (arrayNoDuplicates!0 (_keys!3100 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000000 Nil!537))))

(assert (= (and d!3517 res!13038) b!19059))

(assert (= (and b!19059 res!13039) b!19060))

(assert (= (and b!19060 res!13040) b!19061))

(declare-fun m!13481 () Bool)

(assert (=> d!3517 m!13481))

(declare-fun m!13483 () Bool)

(assert (=> b!19059 m!13483))

(declare-fun m!13485 () Bool)

(assert (=> b!19060 m!13485))

(declare-fun m!13487 () Bool)

(assert (=> b!19061 m!13487))

(assert (=> d!3515 d!3517))

(declare-fun condMapEmpty!839 () Bool)

(declare-fun mapDefault!839 () ValueCell!263)

(assert (=> mapNonEmpty!838 (= condMapEmpty!839 (= mapRest!838 ((as const (Array (_ BitVec 32) ValueCell!263)) mapDefault!839)))))

(declare-fun e!12255 () Bool)

(declare-fun mapRes!839 () Bool)

(assert (=> mapNonEmpty!838 (= tp!3196 (and e!12255 mapRes!839))))

(declare-fun mapNonEmpty!839 () Bool)

(declare-fun tp!3197 () Bool)

(declare-fun e!12254 () Bool)

(assert (=> mapNonEmpty!839 (= mapRes!839 (and tp!3197 e!12254))))

(declare-fun mapValue!839 () ValueCell!263)

(declare-fun mapKey!839 () (_ BitVec 32))

(declare-fun mapRest!839 () (Array (_ BitVec 32) ValueCell!263))

(assert (=> mapNonEmpty!839 (= mapRest!838 (store mapRest!839 mapKey!839 mapValue!839))))

(declare-fun mapIsEmpty!839 () Bool)

(assert (=> mapIsEmpty!839 mapRes!839))

(declare-fun b!19063 () Bool)

(assert (=> b!19063 (= e!12255 tp_is_empty!925)))

(declare-fun b!19062 () Bool)

(assert (=> b!19062 (= e!12254 tp_is_empty!925)))

(assert (= (and mapNonEmpty!838 condMapEmpty!839) mapIsEmpty!839))

(assert (= (and mapNonEmpty!838 (not condMapEmpty!839)) mapNonEmpty!839))

(assert (= (and mapNonEmpty!839 ((_ is ValueCellFull!263) mapValue!839)) b!19062))

(assert (= (and mapNonEmpty!838 ((_ is ValueCellFull!263) mapDefault!839)) b!19063))

(declare-fun m!13489 () Bool)

(assert (=> mapNonEmpty!839 m!13489))

(check-sat (not b!19060) (not d!3517) (not mapNonEmpty!839) (not b!19059) b_and!1315 (not b_next!661) tp_is_empty!925 (not b!19061))
(check-sat b_and!1315 (not b_next!661))
(get-model)

(declare-fun bm!877 () Bool)

(declare-fun call!880 () (_ BitVec 32))

(assert (=> bm!877 (= call!880 (arrayCountValidKeys!0 (_keys!3100 (v!1494 (underlying!67 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938))))))))

(declare-fun b!19072 () Bool)

(declare-fun e!12260 () (_ BitVec 32))

(assert (=> b!19072 (= e!12260 call!880)))

(declare-fun b!19073 () Bool)

(assert (=> b!19073 (= e!12260 (bvadd #b00000000000000000000000000000001 call!880))))

(declare-fun d!3519 () Bool)

(declare-fun lt!5387 () (_ BitVec 32))

(assert (=> d!3519 (and (bvsge lt!5387 #b00000000000000000000000000000000) (bvsle lt!5387 (bvsub (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun e!12261 () (_ BitVec 32))

(assert (=> d!3519 (= lt!5387 e!12261)))

(declare-fun c!2034 () Bool)

(assert (=> d!3519 (= c!2034 (bvsge #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938))))))))

(assert (=> d!3519 (and (bvsle #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938))))))))

(assert (=> d!3519 (= (arrayCountValidKeys!0 (_keys!3100 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938))))) lt!5387)))

(declare-fun b!19074 () Bool)

(assert (=> b!19074 (= e!12261 #b00000000000000000000000000000000)))

(declare-fun b!19075 () Bool)

(assert (=> b!19075 (= e!12261 e!12260)))

(declare-fun c!2035 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!19075 (= c!2035 (validKeyInArray!0 (select (arr!501 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (= (and d!3519 c!2034) b!19074))

(assert (= (and d!3519 (not c!2034)) b!19075))

(assert (= (and b!19075 c!2035) b!19073))

(assert (= (and b!19075 (not c!2035)) b!19072))

(assert (= (or b!19073 b!19072) bm!877))

(declare-fun m!13491 () Bool)

(assert (=> bm!877 m!13491))

(declare-fun m!13493 () Bool)

(assert (=> b!19075 m!13493))

(assert (=> b!19075 m!13493))

(declare-fun m!13495 () Bool)

(assert (=> b!19075 m!13495))

(assert (=> b!19059 d!3519))

(declare-fun b!19084 () Bool)

(declare-fun res!13051 () Bool)

(declare-fun e!12264 () Bool)

(assert (=> b!19084 (=> (not res!13051) (not e!12264))))

(assert (=> b!19084 (= res!13051 (and (= (size!590 (_values!1671 (v!1494 (underlying!67 thiss!938)))) (bvadd (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000001)) (= (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) (size!590 (_values!1671 (v!1494 (underlying!67 thiss!938))))) (bvsge (_size!89 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!89 (v!1494 (underlying!67 thiss!938))) (bvadd (mask!4614 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000001))))))

(declare-fun b!19087 () Bool)

(assert (=> b!19087 (= e!12264 (and (bvsge (extraKeys!1585 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000000) (bvsle (extraKeys!1585 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000011) (bvsge (_vacant!89 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000000)))))

(declare-fun b!19086 () Bool)

(declare-fun res!13052 () Bool)

(assert (=> b!19086 (=> (not res!13052) (not e!12264))))

(declare-fun size!596 (LongMapFixedSize!112) (_ BitVec 32))

(assert (=> b!19086 (= res!13052 (= (size!596 (v!1494 (underlying!67 thiss!938))) (bvadd (_size!89 (v!1494 (underlying!67 thiss!938))) (bvsdiv (bvadd (extraKeys!1585 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!19085 () Bool)

(declare-fun res!13050 () Bool)

(assert (=> b!19085 (=> (not res!13050) (not e!12264))))

(assert (=> b!19085 (= res!13050 (bvsge (size!596 (v!1494 (underlying!67 thiss!938))) (_size!89 (v!1494 (underlying!67 thiss!938)))))))

(declare-fun d!3521 () Bool)

(declare-fun res!13049 () Bool)

(assert (=> d!3521 (=> (not res!13049) (not e!12264))))

(assert (=> d!3521 (= res!13049 (validMask!0 (mask!4614 (v!1494 (underlying!67 thiss!938)))))))

(assert (=> d!3521 (= (simpleValid!10 (v!1494 (underlying!67 thiss!938))) e!12264)))

(assert (= (and d!3521 res!13049) b!19084))

(assert (= (and b!19084 res!13051) b!19085))

(assert (= (and b!19085 res!13050) b!19086))

(assert (= (and b!19086 res!13052) b!19087))

(declare-fun m!13497 () Bool)

(assert (=> b!19086 m!13497))

(assert (=> b!19085 m!13497))

(assert (=> d!3521 m!13455))

(assert (=> d!3517 d!3521))

(declare-fun b!19097 () Bool)

(declare-fun e!12271 () Bool)

(declare-fun call!883 () Bool)

(assert (=> b!19097 (= e!12271 call!883)))

(declare-fun b!19098 () Bool)

(declare-fun e!12272 () Bool)

(assert (=> b!19098 (= e!12272 call!883)))

(declare-fun bm!880 () Bool)

(assert (=> bm!880 (= call!883 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3100 (v!1494 (underlying!67 thiss!938))) (mask!4614 (v!1494 (underlying!67 thiss!938)))))))

(declare-fun b!19099 () Bool)

(declare-fun e!12273 () Bool)

(assert (=> b!19099 (= e!12273 e!12272)))

(declare-fun c!2038 () Bool)

(assert (=> b!19099 (= c!2038 (validKeyInArray!0 (select (arr!501 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun d!3523 () Bool)

(declare-fun res!13058 () Bool)

(assert (=> d!3523 (=> res!13058 e!12273)))

(assert (=> d!3523 (= res!13058 (bvsge #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938))))))))

(assert (=> d!3523 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3100 (v!1494 (underlying!67 thiss!938))) (mask!4614 (v!1494 (underlying!67 thiss!938)))) e!12273)))

(declare-fun b!19096 () Bool)

(assert (=> b!19096 (= e!12272 e!12271)))

(declare-fun lt!5395 () (_ BitVec 64))

(assert (=> b!19096 (= lt!5395 (select (arr!501 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!385 0))(
  ( (Unit!386) )
))
(declare-fun lt!5396 () Unit!385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1043 (_ BitVec 64) (_ BitVec 32)) Unit!385)

(assert (=> b!19096 (= lt!5396 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3100 (v!1494 (underlying!67 thiss!938))) lt!5395 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19096 (arrayContainsKey!0 (_keys!3100 (v!1494 (underlying!67 thiss!938))) lt!5395 #b00000000000000000000000000000000)))

(declare-fun lt!5394 () Unit!385)

(assert (=> b!19096 (= lt!5394 lt!5396)))

(declare-fun res!13057 () Bool)

(declare-datatypes ((SeekEntryResult!45 0))(
  ( (MissingZero!45 (index!2300 (_ BitVec 32))) (Found!45 (index!2301 (_ BitVec 32))) (Intermediate!45 (undefined!857 Bool) (index!2302 (_ BitVec 32)) (x!4700 (_ BitVec 32))) (Undefined!45) (MissingVacant!45 (index!2303 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1043 (_ BitVec 32)) SeekEntryResult!45)

(assert (=> b!19096 (= res!13057 (= (seekEntryOrOpen!0 (select (arr!501 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000) (_keys!3100 (v!1494 (underlying!67 thiss!938))) (mask!4614 (v!1494 (underlying!67 thiss!938)))) (Found!45 #b00000000000000000000000000000000)))))

(assert (=> b!19096 (=> (not res!13057) (not e!12271))))

(assert (= (and d!3523 (not res!13058)) b!19099))

(assert (= (and b!19099 c!2038) b!19096))

(assert (= (and b!19099 (not c!2038)) b!19098))

(assert (= (and b!19096 res!13057) b!19097))

(assert (= (or b!19097 b!19098) bm!880))

(declare-fun m!13499 () Bool)

(assert (=> bm!880 m!13499))

(assert (=> b!19099 m!13493))

(assert (=> b!19099 m!13493))

(assert (=> b!19099 m!13495))

(assert (=> b!19096 m!13493))

(declare-fun m!13501 () Bool)

(assert (=> b!19096 m!13501))

(declare-fun m!13503 () Bool)

(assert (=> b!19096 m!13503))

(assert (=> b!19096 m!13493))

(declare-fun m!13505 () Bool)

(assert (=> b!19096 m!13505))

(assert (=> b!19060 d!3523))

(declare-fun b!19110 () Bool)

(declare-fun e!12282 () Bool)

(declare-fun contains!218 (List!540 (_ BitVec 64)) Bool)

(assert (=> b!19110 (= e!12282 (contains!218 Nil!537 (select (arr!501 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun d!3525 () Bool)

(declare-fun res!13067 () Bool)

(declare-fun e!12283 () Bool)

(assert (=> d!3525 (=> res!13067 e!12283)))

(assert (=> d!3525 (= res!13067 (bvsge #b00000000000000000000000000000000 (size!591 (_keys!3100 (v!1494 (underlying!67 thiss!938))))))))

(assert (=> d!3525 (= (arrayNoDuplicates!0 (_keys!3100 (v!1494 (underlying!67 thiss!938))) #b00000000000000000000000000000000 Nil!537) e!12283)))

(declare-fun b!19111 () Bool)

(declare-fun e!12284 () Bool)

(assert (=> b!19111 (= e!12283 e!12284)))

(declare-fun res!13066 () Bool)

(assert (=> b!19111 (=> (not res!13066) (not e!12284))))

(assert (=> b!19111 (= res!13066 (not e!12282))))

(declare-fun res!13065 () Bool)

(assert (=> b!19111 (=> (not res!13065) (not e!12282))))

(assert (=> b!19111 (= res!13065 (validKeyInArray!0 (select (arr!501 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19112 () Bool)

(declare-fun e!12285 () Bool)

(declare-fun call!886 () Bool)

(assert (=> b!19112 (= e!12285 call!886)))

(declare-fun b!19113 () Bool)

(assert (=> b!19113 (= e!12285 call!886)))

(declare-fun bm!883 () Bool)

(declare-fun c!2041 () Bool)

(assert (=> bm!883 (= call!886 (arrayNoDuplicates!0 (_keys!3100 (v!1494 (underlying!67 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2041 (Cons!536 (select (arr!501 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000) Nil!537) Nil!537)))))

(declare-fun b!19114 () Bool)

(assert (=> b!19114 (= e!12284 e!12285)))

(assert (=> b!19114 (= c!2041 (validKeyInArray!0 (select (arr!501 (_keys!3100 (v!1494 (underlying!67 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (= (and d!3525 (not res!13067)) b!19111))

(assert (= (and b!19111 res!13065) b!19110))

(assert (= (and b!19111 res!13066) b!19114))

(assert (= (and b!19114 c!2041) b!19112))

(assert (= (and b!19114 (not c!2041)) b!19113))

(assert (= (or b!19112 b!19113) bm!883))

(assert (=> b!19110 m!13493))

(assert (=> b!19110 m!13493))

(declare-fun m!13507 () Bool)

(assert (=> b!19110 m!13507))

(assert (=> b!19111 m!13493))

(assert (=> b!19111 m!13493))

(assert (=> b!19111 m!13495))

(assert (=> bm!883 m!13493))

(declare-fun m!13509 () Bool)

(assert (=> bm!883 m!13509))

(assert (=> b!19114 m!13493))

(assert (=> b!19114 m!13493))

(assert (=> b!19114 m!13495))

(assert (=> b!19061 d!3525))

(declare-fun condMapEmpty!840 () Bool)

(declare-fun mapDefault!840 () ValueCell!263)

(assert (=> mapNonEmpty!839 (= condMapEmpty!840 (= mapRest!839 ((as const (Array (_ BitVec 32) ValueCell!263)) mapDefault!840)))))

(declare-fun e!12287 () Bool)

(declare-fun mapRes!840 () Bool)

(assert (=> mapNonEmpty!839 (= tp!3197 (and e!12287 mapRes!840))))

(declare-fun mapNonEmpty!840 () Bool)

(declare-fun tp!3198 () Bool)

(declare-fun e!12286 () Bool)

(assert (=> mapNonEmpty!840 (= mapRes!840 (and tp!3198 e!12286))))

(declare-fun mapKey!840 () (_ BitVec 32))

(declare-fun mapValue!840 () ValueCell!263)

(declare-fun mapRest!840 () (Array (_ BitVec 32) ValueCell!263))

(assert (=> mapNonEmpty!840 (= mapRest!839 (store mapRest!840 mapKey!840 mapValue!840))))

(declare-fun mapIsEmpty!840 () Bool)

(assert (=> mapIsEmpty!840 mapRes!840))

(declare-fun b!19116 () Bool)

(assert (=> b!19116 (= e!12287 tp_is_empty!925)))

(declare-fun b!19115 () Bool)

(assert (=> b!19115 (= e!12286 tp_is_empty!925)))

(assert (= (and mapNonEmpty!839 condMapEmpty!840) mapIsEmpty!840))

(assert (= (and mapNonEmpty!839 (not condMapEmpty!840)) mapNonEmpty!840))

(assert (= (and mapNonEmpty!840 ((_ is ValueCellFull!263) mapValue!840)) b!19115))

(assert (= (and mapNonEmpty!839 ((_ is ValueCellFull!263) mapDefault!840)) b!19116))

(declare-fun m!13511 () Bool)

(assert (=> mapNonEmpty!840 m!13511))

(check-sat (not b!19096) (not mapNonEmpty!840) (not bm!883) (not bm!877) (not b_next!661) tp_is_empty!925 (not b!19114) (not b!19085) (not b!19086) (not b!19075) (not b!19110) (not b!19111) (not bm!880) (not d!3521) b_and!1315 (not b!19099))
(check-sat b_and!1315 (not b_next!661))
