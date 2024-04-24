; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8052 () Bool)

(assert start!8052)

(declare-fun b!50484 () Bool)

(declare-fun b_free!1549 () Bool)

(declare-fun b_next!1549 () Bool)

(assert (=> b!50484 (= b_free!1549 (not b_next!1549))))

(declare-fun tp!6713 () Bool)

(declare-fun b_and!2757 () Bool)

(assert (=> b!50484 (= tp!6713 b_and!2757)))

(declare-fun b!50483 () Bool)

(declare-fun b_free!1551 () Bool)

(declare-fun b_next!1551 () Bool)

(assert (=> b!50483 (= b_free!1551 (not b_next!1551))))

(declare-fun tp!6712 () Bool)

(declare-fun b_and!2759 () Bool)

(assert (=> b!50483 (= tp!6712 b_and!2759)))

(declare-fun b!50476 () Bool)

(declare-fun e!32629 () Bool)

(declare-fun tp_is_empty!2191 () Bool)

(assert (=> b!50476 (= e!32629 tp_is_empty!2191)))

(declare-fun b!50477 () Bool)

(declare-fun e!32626 () Bool)

(declare-fun e!32628 () Bool)

(declare-fun mapRes!2207 () Bool)

(assert (=> b!50477 (= e!32626 (and e!32628 mapRes!2207))))

(declare-fun condMapEmpty!2208 () Bool)

(declare-datatypes ((V!2569 0))(
  ( (V!2570 (val!1140 Int)) )
))
(declare-datatypes ((array!3281 0))(
  ( (array!3282 (arr!1568 (Array (_ BitVec 32) (_ BitVec 64))) (size!1792 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!752 0))(
  ( (ValueCellFull!752 (v!2167 V!2569)) (EmptyCell!752) )
))
(declare-datatypes ((array!3283 0))(
  ( (array!3284 (arr!1569 (Array (_ BitVec 32) ValueCell!752)) (size!1793 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!412 0))(
  ( (LongMapFixedSize!413 (defaultEntry!1920 Int) (mask!5712 (_ BitVec 32)) (extraKeys!1811 (_ BitVec 32)) (zeroValue!1838 V!2569) (minValue!1838 V!2569) (_size!255 (_ BitVec 32)) (_keys!3530 array!3281) (_values!1903 array!3283) (_vacant!255 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!412)

(declare-fun mapDefault!2208 () ValueCell!752)

(assert (=> b!50477 (= condMapEmpty!2208 (= (arr!1569 (_values!1903 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2208)))))

(declare-fun b!50478 () Bool)

(declare-fun e!32631 () Bool)

(declare-datatypes ((Cell!236 0))(
  ( (Cell!237 (v!2168 LongMapFixedSize!412)) )
))
(declare-datatypes ((LongMap!236 0))(
  ( (LongMap!237 (underlying!129 Cell!236)) )
))
(declare-fun thiss!992 () LongMap!236)

(assert (=> b!50478 (= e!32631 (and (= (size!1793 (_values!1903 (v!2168 (underlying!129 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5712 (v!2168 (underlying!129 thiss!992))))) (not (= (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) (size!1793 (_values!1903 (v!2168 (underlying!129 thiss!992))))))))))

(declare-fun b!50479 () Bool)

(declare-fun e!32627 () Bool)

(declare-fun e!32622 () Bool)

(assert (=> b!50479 (= e!32627 e!32622)))

(declare-fun mapNonEmpty!2207 () Bool)

(declare-fun tp!6711 () Bool)

(declare-fun e!32623 () Bool)

(assert (=> mapNonEmpty!2207 (= mapRes!2207 (and tp!6711 e!32623))))

(declare-fun mapKey!2207 () (_ BitVec 32))

(declare-fun mapRest!2207 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapValue!2207 () ValueCell!752)

(assert (=> mapNonEmpty!2207 (= (arr!1569 (_values!1903 newMap!16)) (store mapRest!2207 mapKey!2207 mapValue!2207))))

(declare-fun b!50480 () Bool)

(declare-fun res!29052 () Bool)

(assert (=> b!50480 (=> (not res!29052) (not e!32631))))

(declare-fun valid!150 (LongMapFixedSize!412) Bool)

(assert (=> b!50480 (= res!29052 (valid!150 newMap!16))))

(declare-fun b!50481 () Bool)

(declare-fun res!29051 () Bool)

(assert (=> b!50481 (=> (not res!29051) (not e!32631))))

(assert (=> b!50481 (= res!29051 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5712 newMap!16)) (_size!255 (v!2168 (underlying!129 thiss!992)))))))

(declare-fun b!50482 () Bool)

(declare-fun e!32624 () Bool)

(declare-fun mapRes!2208 () Bool)

(assert (=> b!50482 (= e!32624 (and e!32629 mapRes!2208))))

(declare-fun condMapEmpty!2207 () Bool)

(declare-fun mapDefault!2207 () ValueCell!752)

(assert (=> b!50482 (= condMapEmpty!2207 (= (arr!1569 (_values!1903 (v!2168 (underlying!129 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2207)))))

(declare-fun mapIsEmpty!2207 () Bool)

(assert (=> mapIsEmpty!2207 mapRes!2207))

(declare-fun e!32625 () Bool)

(declare-fun array_inv!943 (array!3281) Bool)

(declare-fun array_inv!944 (array!3283) Bool)

(assert (=> b!50483 (= e!32625 (and tp!6712 tp_is_empty!2191 (array_inv!943 (_keys!3530 newMap!16)) (array_inv!944 (_values!1903 newMap!16)) e!32626))))

(assert (=> b!50484 (= e!32622 (and tp!6713 tp_is_empty!2191 (array_inv!943 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) (array_inv!944 (_values!1903 (v!2168 (underlying!129 thiss!992)))) e!32624))))

(declare-fun mapNonEmpty!2208 () Bool)

(declare-fun tp!6714 () Bool)

(declare-fun e!32620 () Bool)

(assert (=> mapNonEmpty!2208 (= mapRes!2208 (and tp!6714 e!32620))))

(declare-fun mapKey!2208 () (_ BitVec 32))

(declare-fun mapRest!2208 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapValue!2208 () ValueCell!752)

(assert (=> mapNonEmpty!2208 (= (arr!1569 (_values!1903 (v!2168 (underlying!129 thiss!992)))) (store mapRest!2208 mapKey!2208 mapValue!2208))))

(declare-fun b!50475 () Bool)

(assert (=> b!50475 (= e!32628 tp_is_empty!2191)))

(declare-fun res!29050 () Bool)

(assert (=> start!8052 (=> (not res!29050) (not e!32631))))

(declare-fun valid!151 (LongMap!236) Bool)

(assert (=> start!8052 (= res!29050 (valid!151 thiss!992))))

(assert (=> start!8052 e!32631))

(declare-fun e!32619 () Bool)

(assert (=> start!8052 e!32619))

(assert (=> start!8052 true))

(assert (=> start!8052 e!32625))

(declare-fun b!50485 () Bool)

(assert (=> b!50485 (= e!32620 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2208 () Bool)

(assert (=> mapIsEmpty!2208 mapRes!2208))

(declare-fun b!50486 () Bool)

(assert (=> b!50486 (= e!32623 tp_is_empty!2191)))

(declare-fun b!50487 () Bool)

(assert (=> b!50487 (= e!32619 e!32627)))

(declare-fun b!50488 () Bool)

(declare-fun res!29054 () Bool)

(assert (=> b!50488 (=> (not res!29054) (not e!32631))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50488 (= res!29054 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992)))))))))

(declare-fun b!50489 () Bool)

(declare-fun res!29053 () Bool)

(assert (=> b!50489 (=> (not res!29053) (not e!32631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50489 (= res!29053 (validMask!0 (mask!5712 (v!2168 (underlying!129 thiss!992)))))))

(assert (= (and start!8052 res!29050) b!50488))

(assert (= (and b!50488 res!29054) b!50480))

(assert (= (and b!50480 res!29052) b!50481))

(assert (= (and b!50481 res!29051) b!50489))

(assert (= (and b!50489 res!29053) b!50478))

(assert (= (and b!50482 condMapEmpty!2207) mapIsEmpty!2208))

(assert (= (and b!50482 (not condMapEmpty!2207)) mapNonEmpty!2208))

(get-info :version)

(assert (= (and mapNonEmpty!2208 ((_ is ValueCellFull!752) mapValue!2208)) b!50485))

(assert (= (and b!50482 ((_ is ValueCellFull!752) mapDefault!2207)) b!50476))

(assert (= b!50484 b!50482))

(assert (= b!50479 b!50484))

(assert (= b!50487 b!50479))

(assert (= start!8052 b!50487))

(assert (= (and b!50477 condMapEmpty!2208) mapIsEmpty!2207))

(assert (= (and b!50477 (not condMapEmpty!2208)) mapNonEmpty!2207))

(assert (= (and mapNonEmpty!2207 ((_ is ValueCellFull!752) mapValue!2207)) b!50486))

(assert (= (and b!50477 ((_ is ValueCellFull!752) mapDefault!2208)) b!50475))

(assert (= b!50483 b!50477))

(assert (= start!8052 b!50483))

(declare-fun m!43655 () Bool)

(assert (=> mapNonEmpty!2208 m!43655))

(declare-fun m!43657 () Bool)

(assert (=> b!50484 m!43657))

(declare-fun m!43659 () Bool)

(assert (=> b!50484 m!43659))

(declare-fun m!43661 () Bool)

(assert (=> mapNonEmpty!2207 m!43661))

(declare-fun m!43663 () Bool)

(assert (=> b!50489 m!43663))

(declare-fun m!43665 () Bool)

(assert (=> start!8052 m!43665))

(declare-fun m!43667 () Bool)

(assert (=> b!50480 m!43667))

(declare-fun m!43669 () Bool)

(assert (=> b!50483 m!43669))

(declare-fun m!43671 () Bool)

(assert (=> b!50483 m!43671))

(check-sat (not mapNonEmpty!2207) (not start!8052) (not b!50483) tp_is_empty!2191 (not mapNonEmpty!2208) b_and!2759 (not b!50489) (not b_next!1549) (not b_next!1551) (not b!50480) b_and!2757 (not b!50484))
(check-sat b_and!2757 b_and!2759 (not b_next!1549) (not b_next!1551))
(get-model)

(declare-fun d!10181 () Bool)

(assert (=> d!10181 (= (array_inv!943 (_keys!3530 newMap!16)) (bvsge (size!1792 (_keys!3530 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50483 d!10181))

(declare-fun d!10183 () Bool)

(assert (=> d!10183 (= (array_inv!944 (_values!1903 newMap!16)) (bvsge (size!1793 (_values!1903 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50483 d!10183))

(declare-fun d!10185 () Bool)

(assert (=> d!10185 (= (array_inv!943 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) (bvsge (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50484 d!10185))

(declare-fun d!10187 () Bool)

(assert (=> d!10187 (= (array_inv!944 (_values!1903 (v!2168 (underlying!129 thiss!992)))) (bvsge (size!1793 (_values!1903 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50484 d!10187))

(declare-fun d!10189 () Bool)

(assert (=> d!10189 (= (valid!151 thiss!992) (valid!150 (v!2168 (underlying!129 thiss!992))))))

(declare-fun bs!2363 () Bool)

(assert (= bs!2363 d!10189))

(declare-fun m!43709 () Bool)

(assert (=> bs!2363 m!43709))

(assert (=> start!8052 d!10189))

(declare-fun d!10191 () Bool)

(declare-fun res!29091 () Bool)

(declare-fun e!32712 () Bool)

(assert (=> d!10191 (=> (not res!29091) (not e!32712))))

(declare-fun simpleValid!35 (LongMapFixedSize!412) Bool)

(assert (=> d!10191 (= res!29091 (simpleValid!35 newMap!16))))

(assert (=> d!10191 (= (valid!150 newMap!16) e!32712)))

(declare-fun b!50586 () Bool)

(declare-fun res!29092 () Bool)

(assert (=> b!50586 (=> (not res!29092) (not e!32712))))

(declare-fun arrayCountValidKeys!0 (array!3281 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50586 (= res!29092 (= (arrayCountValidKeys!0 (_keys!3530 newMap!16) #b00000000000000000000000000000000 (size!1792 (_keys!3530 newMap!16))) (_size!255 newMap!16)))))

(declare-fun b!50587 () Bool)

(declare-fun res!29093 () Bool)

(assert (=> b!50587 (=> (not res!29093) (not e!32712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3281 (_ BitVec 32)) Bool)

(assert (=> b!50587 (= res!29093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3530 newMap!16) (mask!5712 newMap!16)))))

(declare-fun b!50588 () Bool)

(declare-datatypes ((List!1316 0))(
  ( (Nil!1313) (Cons!1312 (h!1892 (_ BitVec 64)) (t!4350 List!1316)) )
))
(declare-fun arrayNoDuplicates!0 (array!3281 (_ BitVec 32) List!1316) Bool)

(assert (=> b!50588 (= e!32712 (arrayNoDuplicates!0 (_keys!3530 newMap!16) #b00000000000000000000000000000000 Nil!1313))))

(assert (= (and d!10191 res!29091) b!50586))

(assert (= (and b!50586 res!29092) b!50587))

(assert (= (and b!50587 res!29093) b!50588))

(declare-fun m!43711 () Bool)

(assert (=> d!10191 m!43711))

(declare-fun m!43713 () Bool)

(assert (=> b!50586 m!43713))

(declare-fun m!43715 () Bool)

(assert (=> b!50587 m!43715))

(declare-fun m!43717 () Bool)

(assert (=> b!50588 m!43717))

(assert (=> b!50480 d!10191))

(declare-fun d!10193 () Bool)

(assert (=> d!10193 (= (validMask!0 (mask!5712 (v!2168 (underlying!129 thiss!992)))) (and (or (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000001111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000011111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000001111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000011111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000001111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000011111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000001111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000011111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000001111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000011111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000001111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000011111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000111111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000001111111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000011111111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000111111111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000001111111111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000011111111111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000111111111111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00001111111111111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00011111111111111111111111111111) (= (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50489 d!10193))

(declare-fun condMapEmpty!2223 () Bool)

(declare-fun mapDefault!2223 () ValueCell!752)

(assert (=> mapNonEmpty!2207 (= condMapEmpty!2223 (= mapRest!2207 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2223)))))

(declare-fun e!32717 () Bool)

(declare-fun mapRes!2223 () Bool)

(assert (=> mapNonEmpty!2207 (= tp!6711 (and e!32717 mapRes!2223))))

(declare-fun b!50596 () Bool)

(assert (=> b!50596 (= e!32717 tp_is_empty!2191)))

(declare-fun b!50595 () Bool)

(declare-fun e!32718 () Bool)

(assert (=> b!50595 (= e!32718 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2223 () Bool)

(assert (=> mapIsEmpty!2223 mapRes!2223))

(declare-fun mapNonEmpty!2223 () Bool)

(declare-fun tp!6741 () Bool)

(assert (=> mapNonEmpty!2223 (= mapRes!2223 (and tp!6741 e!32718))))

(declare-fun mapRest!2223 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapKey!2223 () (_ BitVec 32))

(declare-fun mapValue!2223 () ValueCell!752)

(assert (=> mapNonEmpty!2223 (= mapRest!2207 (store mapRest!2223 mapKey!2223 mapValue!2223))))

(assert (= (and mapNonEmpty!2207 condMapEmpty!2223) mapIsEmpty!2223))

(assert (= (and mapNonEmpty!2207 (not condMapEmpty!2223)) mapNonEmpty!2223))

(assert (= (and mapNonEmpty!2223 ((_ is ValueCellFull!752) mapValue!2223)) b!50595))

(assert (= (and mapNonEmpty!2207 ((_ is ValueCellFull!752) mapDefault!2223)) b!50596))

(declare-fun m!43719 () Bool)

(assert (=> mapNonEmpty!2223 m!43719))

(declare-fun condMapEmpty!2224 () Bool)

(declare-fun mapDefault!2224 () ValueCell!752)

(assert (=> mapNonEmpty!2208 (= condMapEmpty!2224 (= mapRest!2208 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2224)))))

(declare-fun e!32719 () Bool)

(declare-fun mapRes!2224 () Bool)

(assert (=> mapNonEmpty!2208 (= tp!6714 (and e!32719 mapRes!2224))))

(declare-fun b!50598 () Bool)

(assert (=> b!50598 (= e!32719 tp_is_empty!2191)))

(declare-fun b!50597 () Bool)

(declare-fun e!32720 () Bool)

(assert (=> b!50597 (= e!32720 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2224 () Bool)

(assert (=> mapIsEmpty!2224 mapRes!2224))

(declare-fun mapNonEmpty!2224 () Bool)

(declare-fun tp!6742 () Bool)

(assert (=> mapNonEmpty!2224 (= mapRes!2224 (and tp!6742 e!32720))))

(declare-fun mapRest!2224 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapKey!2224 () (_ BitVec 32))

(declare-fun mapValue!2224 () ValueCell!752)

(assert (=> mapNonEmpty!2224 (= mapRest!2208 (store mapRest!2224 mapKey!2224 mapValue!2224))))

(assert (= (and mapNonEmpty!2208 condMapEmpty!2224) mapIsEmpty!2224))

(assert (= (and mapNonEmpty!2208 (not condMapEmpty!2224)) mapNonEmpty!2224))

(assert (= (and mapNonEmpty!2224 ((_ is ValueCellFull!752) mapValue!2224)) b!50597))

(assert (= (and mapNonEmpty!2208 ((_ is ValueCellFull!752) mapDefault!2224)) b!50598))

(declare-fun m!43721 () Bool)

(assert (=> mapNonEmpty!2224 m!43721))

(check-sat (not b_next!1551) (not b!50587) (not b!50586) (not d!10189) (not mapNonEmpty!2223) (not b!50588) (not mapNonEmpty!2224) tp_is_empty!2191 (not d!10191) b_and!2759 b_and!2757 (not b_next!1549))
(check-sat b_and!2757 b_and!2759 (not b_next!1549) (not b_next!1551))
(get-model)

(declare-fun b!50609 () Bool)

(declare-fun res!29104 () Bool)

(declare-fun e!32723 () Bool)

(assert (=> b!50609 (=> (not res!29104) (not e!32723))))

(declare-fun size!1798 (LongMapFixedSize!412) (_ BitVec 32))

(assert (=> b!50609 (= res!29104 (= (size!1798 newMap!16) (bvadd (_size!255 newMap!16) (bvsdiv (bvadd (extraKeys!1811 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!50610 () Bool)

(assert (=> b!50610 (= e!32723 (and (bvsge (extraKeys!1811 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1811 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!255 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!50608 () Bool)

(declare-fun res!29102 () Bool)

(assert (=> b!50608 (=> (not res!29102) (not e!32723))))

(assert (=> b!50608 (= res!29102 (bvsge (size!1798 newMap!16) (_size!255 newMap!16)))))

(declare-fun b!50607 () Bool)

(declare-fun res!29105 () Bool)

(assert (=> b!50607 (=> (not res!29105) (not e!32723))))

(assert (=> b!50607 (= res!29105 (and (= (size!1793 (_values!1903 newMap!16)) (bvadd (mask!5712 newMap!16) #b00000000000000000000000000000001)) (= (size!1792 (_keys!3530 newMap!16)) (size!1793 (_values!1903 newMap!16))) (bvsge (_size!255 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!255 newMap!16) (bvadd (mask!5712 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!10195 () Bool)

(declare-fun res!29103 () Bool)

(assert (=> d!10195 (=> (not res!29103) (not e!32723))))

(assert (=> d!10195 (= res!29103 (validMask!0 (mask!5712 newMap!16)))))

(assert (=> d!10195 (= (simpleValid!35 newMap!16) e!32723)))

(assert (= (and d!10195 res!29103) b!50607))

(assert (= (and b!50607 res!29105) b!50608))

(assert (= (and b!50608 res!29102) b!50609))

(assert (= (and b!50609 res!29104) b!50610))

(declare-fun m!43723 () Bool)

(assert (=> b!50609 m!43723))

(assert (=> b!50608 m!43723))

(declare-fun m!43725 () Bool)

(assert (=> d!10195 m!43725))

(assert (=> d!10191 d!10195))

(declare-fun b!50619 () Bool)

(declare-fun e!32728 () (_ BitVec 32))

(declare-fun call!3890 () (_ BitVec 32))

(assert (=> b!50619 (= e!32728 (bvadd #b00000000000000000000000000000001 call!3890))))

(declare-fun b!50620 () Bool)

(declare-fun e!32729 () (_ BitVec 32))

(assert (=> b!50620 (= e!32729 #b00000000000000000000000000000000)))

(declare-fun d!10197 () Bool)

(declare-fun lt!21041 () (_ BitVec 32))

(assert (=> d!10197 (and (bvsge lt!21041 #b00000000000000000000000000000000) (bvsle lt!21041 (bvsub (size!1792 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10197 (= lt!21041 e!32729)))

(declare-fun c!6807 () Bool)

(assert (=> d!10197 (= c!6807 (bvsge #b00000000000000000000000000000000 (size!1792 (_keys!3530 newMap!16))))))

(assert (=> d!10197 (and (bvsle #b00000000000000000000000000000000 (size!1792 (_keys!3530 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1792 (_keys!3530 newMap!16)) (size!1792 (_keys!3530 newMap!16))))))

(assert (=> d!10197 (= (arrayCountValidKeys!0 (_keys!3530 newMap!16) #b00000000000000000000000000000000 (size!1792 (_keys!3530 newMap!16))) lt!21041)))

(declare-fun b!50621 () Bool)

(assert (=> b!50621 (= e!32729 e!32728)))

(declare-fun c!6806 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!50621 (= c!6806 (validKeyInArray!0 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3887 () Bool)

(assert (=> bm!3887 (= call!3890 (arrayCountValidKeys!0 (_keys!3530 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1792 (_keys!3530 newMap!16))))))

(declare-fun b!50622 () Bool)

(assert (=> b!50622 (= e!32728 call!3890)))

(assert (= (and d!10197 c!6807) b!50620))

(assert (= (and d!10197 (not c!6807)) b!50621))

(assert (= (and b!50621 c!6806) b!50619))

(assert (= (and b!50621 (not c!6806)) b!50622))

(assert (= (or b!50619 b!50622) bm!3887))

(declare-fun m!43727 () Bool)

(assert (=> b!50621 m!43727))

(assert (=> b!50621 m!43727))

(declare-fun m!43729 () Bool)

(assert (=> b!50621 m!43729))

(declare-fun m!43731 () Bool)

(assert (=> bm!3887 m!43731))

(assert (=> b!50586 d!10197))

(declare-fun bm!3890 () Bool)

(declare-fun call!3893 () Bool)

(assert (=> bm!3890 (= call!3893 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3530 newMap!16) (mask!5712 newMap!16)))))

(declare-fun b!50631 () Bool)

(declare-fun e!32737 () Bool)

(declare-fun e!32736 () Bool)

(assert (=> b!50631 (= e!32737 e!32736)))

(declare-fun c!6810 () Bool)

(assert (=> b!50631 (= c!6810 (validKeyInArray!0 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50632 () Bool)

(declare-fun e!32738 () Bool)

(assert (=> b!50632 (= e!32738 call!3893)))

(declare-fun b!50633 () Bool)

(assert (=> b!50633 (= e!32736 e!32738)))

(declare-fun lt!21050 () (_ BitVec 64))

(assert (=> b!50633 (= lt!21050 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1432 0))(
  ( (Unit!1433) )
))
(declare-fun lt!21048 () Unit!1432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3281 (_ BitVec 64) (_ BitVec 32)) Unit!1432)

(assert (=> b!50633 (= lt!21048 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3530 newMap!16) lt!21050 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!50633 (arrayContainsKey!0 (_keys!3530 newMap!16) lt!21050 #b00000000000000000000000000000000)))

(declare-fun lt!21049 () Unit!1432)

(assert (=> b!50633 (= lt!21049 lt!21048)))

(declare-fun res!29111 () Bool)

(declare-datatypes ((SeekEntryResult!214 0))(
  ( (MissingZero!214 (index!2978 (_ BitVec 32))) (Found!214 (index!2979 (_ BitVec 32))) (Intermediate!214 (undefined!1026 Bool) (index!2980 (_ BitVec 32)) (x!9246 (_ BitVec 32))) (Undefined!214) (MissingVacant!214 (index!2981 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3281 (_ BitVec 32)) SeekEntryResult!214)

(assert (=> b!50633 (= res!29111 (= (seekEntryOrOpen!0 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) (_keys!3530 newMap!16) (mask!5712 newMap!16)) (Found!214 #b00000000000000000000000000000000)))))

(assert (=> b!50633 (=> (not res!29111) (not e!32738))))

(declare-fun b!50634 () Bool)

(assert (=> b!50634 (= e!32736 call!3893)))

(declare-fun d!10199 () Bool)

(declare-fun res!29110 () Bool)

(assert (=> d!10199 (=> res!29110 e!32737)))

(assert (=> d!10199 (= res!29110 (bvsge #b00000000000000000000000000000000 (size!1792 (_keys!3530 newMap!16))))))

(assert (=> d!10199 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3530 newMap!16) (mask!5712 newMap!16)) e!32737)))

(assert (= (and d!10199 (not res!29110)) b!50631))

(assert (= (and b!50631 c!6810) b!50633))

(assert (= (and b!50631 (not c!6810)) b!50634))

(assert (= (and b!50633 res!29111) b!50632))

(assert (= (or b!50632 b!50634) bm!3890))

(declare-fun m!43733 () Bool)

(assert (=> bm!3890 m!43733))

(assert (=> b!50631 m!43727))

(assert (=> b!50631 m!43727))

(assert (=> b!50631 m!43729))

(assert (=> b!50633 m!43727))

(declare-fun m!43735 () Bool)

(assert (=> b!50633 m!43735))

(declare-fun m!43737 () Bool)

(assert (=> b!50633 m!43737))

(assert (=> b!50633 m!43727))

(declare-fun m!43739 () Bool)

(assert (=> b!50633 m!43739))

(assert (=> b!50587 d!10199))

(declare-fun b!50645 () Bool)

(declare-fun e!32750 () Bool)

(declare-fun e!32748 () Bool)

(assert (=> b!50645 (= e!32750 e!32748)))

(declare-fun res!29120 () Bool)

(assert (=> b!50645 (=> (not res!29120) (not e!32748))))

(declare-fun e!32749 () Bool)

(assert (=> b!50645 (= res!29120 (not e!32749))))

(declare-fun res!29119 () Bool)

(assert (=> b!50645 (=> (not res!29119) (not e!32749))))

(assert (=> b!50645 (= res!29119 (validKeyInArray!0 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50646 () Bool)

(declare-fun e!32747 () Bool)

(assert (=> b!50646 (= e!32748 e!32747)))

(declare-fun c!6813 () Bool)

(assert (=> b!50646 (= c!6813 (validKeyInArray!0 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3893 () Bool)

(declare-fun call!3896 () Bool)

(assert (=> bm!3893 (= call!3896 (arrayNoDuplicates!0 (_keys!3530 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6813 (Cons!1312 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) Nil!1313) Nil!1313)))))

(declare-fun b!50647 () Bool)

(assert (=> b!50647 (= e!32747 call!3896)))

(declare-fun b!50649 () Bool)

(declare-fun contains!611 (List!1316 (_ BitVec 64)) Bool)

(assert (=> b!50649 (= e!32749 (contains!611 Nil!1313 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10201 () Bool)

(declare-fun res!29118 () Bool)

(assert (=> d!10201 (=> res!29118 e!32750)))

(assert (=> d!10201 (= res!29118 (bvsge #b00000000000000000000000000000000 (size!1792 (_keys!3530 newMap!16))))))

(assert (=> d!10201 (= (arrayNoDuplicates!0 (_keys!3530 newMap!16) #b00000000000000000000000000000000 Nil!1313) e!32750)))

(declare-fun b!50648 () Bool)

(assert (=> b!50648 (= e!32747 call!3896)))

(assert (= (and d!10201 (not res!29118)) b!50645))

(assert (= (and b!50645 res!29119) b!50649))

(assert (= (and b!50645 res!29120) b!50646))

(assert (= (and b!50646 c!6813) b!50648))

(assert (= (and b!50646 (not c!6813)) b!50647))

(assert (= (or b!50648 b!50647) bm!3893))

(assert (=> b!50645 m!43727))

(assert (=> b!50645 m!43727))

(assert (=> b!50645 m!43729))

(assert (=> b!50646 m!43727))

(assert (=> b!50646 m!43727))

(assert (=> b!50646 m!43729))

(assert (=> bm!3893 m!43727))

(declare-fun m!43741 () Bool)

(assert (=> bm!3893 m!43741))

(assert (=> b!50649 m!43727))

(assert (=> b!50649 m!43727))

(declare-fun m!43743 () Bool)

(assert (=> b!50649 m!43743))

(assert (=> b!50588 d!10201))

(declare-fun d!10203 () Bool)

(declare-fun res!29121 () Bool)

(declare-fun e!32751 () Bool)

(assert (=> d!10203 (=> (not res!29121) (not e!32751))))

(assert (=> d!10203 (= res!29121 (simpleValid!35 (v!2168 (underlying!129 thiss!992))))))

(assert (=> d!10203 (= (valid!150 (v!2168 (underlying!129 thiss!992))) e!32751)))

(declare-fun b!50650 () Bool)

(declare-fun res!29122 () Bool)

(assert (=> b!50650 (=> (not res!29122) (not e!32751))))

(assert (=> b!50650 (= res!29122 (= (arrayCountValidKeys!0 (_keys!3530 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000000 (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992))))) (_size!255 (v!2168 (underlying!129 thiss!992)))))))

(declare-fun b!50651 () Bool)

(declare-fun res!29123 () Bool)

(assert (=> b!50651 (=> (not res!29123) (not e!32751))))

(assert (=> b!50651 (= res!29123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3530 (v!2168 (underlying!129 thiss!992))) (mask!5712 (v!2168 (underlying!129 thiss!992)))))))

(declare-fun b!50652 () Bool)

(assert (=> b!50652 (= e!32751 (arrayNoDuplicates!0 (_keys!3530 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000000 Nil!1313))))

(assert (= (and d!10203 res!29121) b!50650))

(assert (= (and b!50650 res!29122) b!50651))

(assert (= (and b!50651 res!29123) b!50652))

(declare-fun m!43745 () Bool)

(assert (=> d!10203 m!43745))

(declare-fun m!43747 () Bool)

(assert (=> b!50650 m!43747))

(declare-fun m!43749 () Bool)

(assert (=> b!50651 m!43749))

(declare-fun m!43751 () Bool)

(assert (=> b!50652 m!43751))

(assert (=> d!10189 d!10203))

(declare-fun condMapEmpty!2225 () Bool)

(declare-fun mapDefault!2225 () ValueCell!752)

(assert (=> mapNonEmpty!2224 (= condMapEmpty!2225 (= mapRest!2224 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2225)))))

(declare-fun e!32752 () Bool)

(declare-fun mapRes!2225 () Bool)

(assert (=> mapNonEmpty!2224 (= tp!6742 (and e!32752 mapRes!2225))))

(declare-fun b!50654 () Bool)

(assert (=> b!50654 (= e!32752 tp_is_empty!2191)))

(declare-fun b!50653 () Bool)

(declare-fun e!32753 () Bool)

(assert (=> b!50653 (= e!32753 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2225 () Bool)

(assert (=> mapIsEmpty!2225 mapRes!2225))

(declare-fun mapNonEmpty!2225 () Bool)

(declare-fun tp!6743 () Bool)

(assert (=> mapNonEmpty!2225 (= mapRes!2225 (and tp!6743 e!32753))))

(declare-fun mapRest!2225 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapValue!2225 () ValueCell!752)

(declare-fun mapKey!2225 () (_ BitVec 32))

(assert (=> mapNonEmpty!2225 (= mapRest!2224 (store mapRest!2225 mapKey!2225 mapValue!2225))))

(assert (= (and mapNonEmpty!2224 condMapEmpty!2225) mapIsEmpty!2225))

(assert (= (and mapNonEmpty!2224 (not condMapEmpty!2225)) mapNonEmpty!2225))

(assert (= (and mapNonEmpty!2225 ((_ is ValueCellFull!752) mapValue!2225)) b!50653))

(assert (= (and mapNonEmpty!2224 ((_ is ValueCellFull!752) mapDefault!2225)) b!50654))

(declare-fun m!43753 () Bool)

(assert (=> mapNonEmpty!2225 m!43753))

(declare-fun condMapEmpty!2226 () Bool)

(declare-fun mapDefault!2226 () ValueCell!752)

(assert (=> mapNonEmpty!2223 (= condMapEmpty!2226 (= mapRest!2223 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2226)))))

(declare-fun e!32754 () Bool)

(declare-fun mapRes!2226 () Bool)

(assert (=> mapNonEmpty!2223 (= tp!6741 (and e!32754 mapRes!2226))))

(declare-fun b!50656 () Bool)

(assert (=> b!50656 (= e!32754 tp_is_empty!2191)))

(declare-fun b!50655 () Bool)

(declare-fun e!32755 () Bool)

(assert (=> b!50655 (= e!32755 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2226 () Bool)

(assert (=> mapIsEmpty!2226 mapRes!2226))

(declare-fun mapNonEmpty!2226 () Bool)

(declare-fun tp!6744 () Bool)

(assert (=> mapNonEmpty!2226 (= mapRes!2226 (and tp!6744 e!32755))))

(declare-fun mapKey!2226 () (_ BitVec 32))

(declare-fun mapRest!2226 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapValue!2226 () ValueCell!752)

(assert (=> mapNonEmpty!2226 (= mapRest!2223 (store mapRest!2226 mapKey!2226 mapValue!2226))))

(assert (= (and mapNonEmpty!2223 condMapEmpty!2226) mapIsEmpty!2226))

(assert (= (and mapNonEmpty!2223 (not condMapEmpty!2226)) mapNonEmpty!2226))

(assert (= (and mapNonEmpty!2226 ((_ is ValueCellFull!752) mapValue!2226)) b!50655))

(assert (= (and mapNonEmpty!2223 ((_ is ValueCellFull!752) mapDefault!2226)) b!50656))

(declare-fun m!43755 () Bool)

(assert (=> mapNonEmpty!2226 m!43755))

(check-sat (not b!50609) (not d!10203) (not b_next!1551) (not b!50621) (not b!50645) (not bm!3887) (not b!50633) (not b!50651) (not mapNonEmpty!2225) tp_is_empty!2191 (not b!50631) (not b!50649) (not bm!3890) (not b_next!1549) (not b!50652) (not b!50646) (not b!50608) (not bm!3893) (not d!10195) b_and!2759 (not mapNonEmpty!2226) (not b!50650) b_and!2757)
(check-sat b_and!2757 b_and!2759 (not b_next!1549) (not b_next!1551))
(get-model)

(declare-fun bm!3894 () Bool)

(declare-fun call!3897 () Bool)

(assert (=> bm!3894 (= call!3897 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3530 newMap!16) (mask!5712 newMap!16)))))

(declare-fun b!50657 () Bool)

(declare-fun e!32757 () Bool)

(declare-fun e!32756 () Bool)

(assert (=> b!50657 (= e!32757 e!32756)))

(declare-fun c!6814 () Bool)

(assert (=> b!50657 (= c!6814 (validKeyInArray!0 (select (arr!1568 (_keys!3530 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50658 () Bool)

(declare-fun e!32758 () Bool)

(assert (=> b!50658 (= e!32758 call!3897)))

(declare-fun b!50659 () Bool)

(assert (=> b!50659 (= e!32756 e!32758)))

(declare-fun lt!21053 () (_ BitVec 64))

(assert (=> b!50659 (= lt!21053 (select (arr!1568 (_keys!3530 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21051 () Unit!1432)

(assert (=> b!50659 (= lt!21051 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3530 newMap!16) lt!21053 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!50659 (arrayContainsKey!0 (_keys!3530 newMap!16) lt!21053 #b00000000000000000000000000000000)))

(declare-fun lt!21052 () Unit!1432)

(assert (=> b!50659 (= lt!21052 lt!21051)))

(declare-fun res!29125 () Bool)

(assert (=> b!50659 (= res!29125 (= (seekEntryOrOpen!0 (select (arr!1568 (_keys!3530 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3530 newMap!16) (mask!5712 newMap!16)) (Found!214 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!50659 (=> (not res!29125) (not e!32758))))

(declare-fun b!50660 () Bool)

(assert (=> b!50660 (= e!32756 call!3897)))

(declare-fun d!10205 () Bool)

(declare-fun res!29124 () Bool)

(assert (=> d!10205 (=> res!29124 e!32757)))

(assert (=> d!10205 (= res!29124 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1792 (_keys!3530 newMap!16))))))

(assert (=> d!10205 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3530 newMap!16) (mask!5712 newMap!16)) e!32757)))

(assert (= (and d!10205 (not res!29124)) b!50657))

(assert (= (and b!50657 c!6814) b!50659))

(assert (= (and b!50657 (not c!6814)) b!50660))

(assert (= (and b!50659 res!29125) b!50658))

(assert (= (or b!50658 b!50660) bm!3894))

(declare-fun m!43757 () Bool)

(assert (=> bm!3894 m!43757))

(declare-fun m!43759 () Bool)

(assert (=> b!50657 m!43759))

(assert (=> b!50657 m!43759))

(declare-fun m!43761 () Bool)

(assert (=> b!50657 m!43761))

(assert (=> b!50659 m!43759))

(declare-fun m!43763 () Bool)

(assert (=> b!50659 m!43763))

(declare-fun m!43765 () Bool)

(assert (=> b!50659 m!43765))

(assert (=> b!50659 m!43759))

(declare-fun m!43767 () Bool)

(assert (=> b!50659 m!43767))

(assert (=> bm!3890 d!10205))

(declare-fun d!10207 () Bool)

(declare-fun lt!21056 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!58 (List!1316) (InoxSet (_ BitVec 64)))

(assert (=> d!10207 (= lt!21056 (select (content!58 Nil!1313) (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32764 () Bool)

(assert (=> d!10207 (= lt!21056 e!32764)))

(declare-fun res!29130 () Bool)

(assert (=> d!10207 (=> (not res!29130) (not e!32764))))

(assert (=> d!10207 (= res!29130 ((_ is Cons!1312) Nil!1313))))

(assert (=> d!10207 (= (contains!611 Nil!1313 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)) lt!21056)))

(declare-fun b!50665 () Bool)

(declare-fun e!32763 () Bool)

(assert (=> b!50665 (= e!32764 e!32763)))

(declare-fun res!29131 () Bool)

(assert (=> b!50665 (=> res!29131 e!32763)))

(assert (=> b!50665 (= res!29131 (= (h!1892 Nil!1313) (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50666 () Bool)

(assert (=> b!50666 (= e!32763 (contains!611 (t!4350 Nil!1313) (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10207 res!29130) b!50665))

(assert (= (and b!50665 (not res!29131)) b!50666))

(declare-fun m!43769 () Bool)

(assert (=> d!10207 m!43769))

(assert (=> d!10207 m!43727))

(declare-fun m!43771 () Bool)

(assert (=> d!10207 m!43771))

(assert (=> b!50666 m!43727))

(declare-fun m!43773 () Bool)

(assert (=> b!50666 m!43773))

(assert (=> b!50649 d!10207))

(declare-fun d!10209 () Bool)

(assert (=> d!10209 (= (validMask!0 (mask!5712 newMap!16)) (and (or (= (mask!5712 newMap!16) #b00000000000000000000000000000111) (= (mask!5712 newMap!16) #b00000000000000000000000000001111) (= (mask!5712 newMap!16) #b00000000000000000000000000011111) (= (mask!5712 newMap!16) #b00000000000000000000000000111111) (= (mask!5712 newMap!16) #b00000000000000000000000001111111) (= (mask!5712 newMap!16) #b00000000000000000000000011111111) (= (mask!5712 newMap!16) #b00000000000000000000000111111111) (= (mask!5712 newMap!16) #b00000000000000000000001111111111) (= (mask!5712 newMap!16) #b00000000000000000000011111111111) (= (mask!5712 newMap!16) #b00000000000000000000111111111111) (= (mask!5712 newMap!16) #b00000000000000000001111111111111) (= (mask!5712 newMap!16) #b00000000000000000011111111111111) (= (mask!5712 newMap!16) #b00000000000000000111111111111111) (= (mask!5712 newMap!16) #b00000000000000001111111111111111) (= (mask!5712 newMap!16) #b00000000000000011111111111111111) (= (mask!5712 newMap!16) #b00000000000000111111111111111111) (= (mask!5712 newMap!16) #b00000000000001111111111111111111) (= (mask!5712 newMap!16) #b00000000000011111111111111111111) (= (mask!5712 newMap!16) #b00000000000111111111111111111111) (= (mask!5712 newMap!16) #b00000000001111111111111111111111) (= (mask!5712 newMap!16) #b00000000011111111111111111111111) (= (mask!5712 newMap!16) #b00000000111111111111111111111111) (= (mask!5712 newMap!16) #b00000001111111111111111111111111) (= (mask!5712 newMap!16) #b00000011111111111111111111111111) (= (mask!5712 newMap!16) #b00000111111111111111111111111111) (= (mask!5712 newMap!16) #b00001111111111111111111111111111) (= (mask!5712 newMap!16) #b00011111111111111111111111111111) (= (mask!5712 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5712 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10195 d!10209))

(declare-fun b!50667 () Bool)

(declare-fun e!32765 () (_ BitVec 32))

(declare-fun call!3898 () (_ BitVec 32))

(assert (=> b!50667 (= e!32765 (bvadd #b00000000000000000000000000000001 call!3898))))

(declare-fun b!50668 () Bool)

(declare-fun e!32766 () (_ BitVec 32))

(assert (=> b!50668 (= e!32766 #b00000000000000000000000000000000)))

(declare-fun d!10211 () Bool)

(declare-fun lt!21057 () (_ BitVec 32))

(assert (=> d!10211 (and (bvsge lt!21057 #b00000000000000000000000000000000) (bvsle lt!21057 (bvsub (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!10211 (= lt!21057 e!32766)))

(declare-fun c!6816 () Bool)

(assert (=> d!10211 (= c!6816 (bvsge #b00000000000000000000000000000000 (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992))))))))

(assert (=> d!10211 (and (bvsle #b00000000000000000000000000000000 (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992))))))))

(assert (=> d!10211 (= (arrayCountValidKeys!0 (_keys!3530 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000000 (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992))))) lt!21057)))

(declare-fun b!50669 () Bool)

(assert (=> b!50669 (= e!32766 e!32765)))

(declare-fun c!6815 () Bool)

(assert (=> b!50669 (= c!6815 (validKeyInArray!0 (select (arr!1568 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3895 () Bool)

(assert (=> bm!3895 (= call!3898 (arrayCountValidKeys!0 (_keys!3530 (v!2168 (underlying!129 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992))))))))

(declare-fun b!50670 () Bool)

(assert (=> b!50670 (= e!32765 call!3898)))

(assert (= (and d!10211 c!6816) b!50668))

(assert (= (and d!10211 (not c!6816)) b!50669))

(assert (= (and b!50669 c!6815) b!50667))

(assert (= (and b!50669 (not c!6815)) b!50670))

(assert (= (or b!50667 b!50670) bm!3895))

(declare-fun m!43775 () Bool)

(assert (=> b!50669 m!43775))

(assert (=> b!50669 m!43775))

(declare-fun m!43777 () Bool)

(assert (=> b!50669 m!43777))

(declare-fun m!43779 () Bool)

(assert (=> bm!3895 m!43779))

(assert (=> b!50650 d!10211))

(declare-fun d!10213 () Bool)

(assert (=> d!10213 (= (validKeyInArray!0 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!50631 d!10213))

(declare-fun bm!3896 () Bool)

(declare-fun call!3899 () Bool)

(assert (=> bm!3896 (= call!3899 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3530 (v!2168 (underlying!129 thiss!992))) (mask!5712 (v!2168 (underlying!129 thiss!992)))))))

(declare-fun b!50671 () Bool)

(declare-fun e!32768 () Bool)

(declare-fun e!32767 () Bool)

(assert (=> b!50671 (= e!32768 e!32767)))

(declare-fun c!6817 () Bool)

(assert (=> b!50671 (= c!6817 (validKeyInArray!0 (select (arr!1568 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50672 () Bool)

(declare-fun e!32769 () Bool)

(assert (=> b!50672 (= e!32769 call!3899)))

(declare-fun b!50673 () Bool)

(assert (=> b!50673 (= e!32767 e!32769)))

(declare-fun lt!21060 () (_ BitVec 64))

(assert (=> b!50673 (= lt!21060 (select (arr!1568 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21058 () Unit!1432)

(assert (=> b!50673 (= lt!21058 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3530 (v!2168 (underlying!129 thiss!992))) lt!21060 #b00000000000000000000000000000000))))

(assert (=> b!50673 (arrayContainsKey!0 (_keys!3530 (v!2168 (underlying!129 thiss!992))) lt!21060 #b00000000000000000000000000000000)))

(declare-fun lt!21059 () Unit!1432)

(assert (=> b!50673 (= lt!21059 lt!21058)))

(declare-fun res!29133 () Bool)

(assert (=> b!50673 (= res!29133 (= (seekEntryOrOpen!0 (select (arr!1568 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000) (_keys!3530 (v!2168 (underlying!129 thiss!992))) (mask!5712 (v!2168 (underlying!129 thiss!992)))) (Found!214 #b00000000000000000000000000000000)))))

(assert (=> b!50673 (=> (not res!29133) (not e!32769))))

(declare-fun b!50674 () Bool)

(assert (=> b!50674 (= e!32767 call!3899)))

(declare-fun d!10215 () Bool)

(declare-fun res!29132 () Bool)

(assert (=> d!10215 (=> res!29132 e!32768)))

(assert (=> d!10215 (= res!29132 (bvsge #b00000000000000000000000000000000 (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992))))))))

(assert (=> d!10215 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3530 (v!2168 (underlying!129 thiss!992))) (mask!5712 (v!2168 (underlying!129 thiss!992)))) e!32768)))

(assert (= (and d!10215 (not res!29132)) b!50671))

(assert (= (and b!50671 c!6817) b!50673))

(assert (= (and b!50671 (not c!6817)) b!50674))

(assert (= (and b!50673 res!29133) b!50672))

(assert (= (or b!50672 b!50674) bm!3896))

(declare-fun m!43781 () Bool)

(assert (=> bm!3896 m!43781))

(assert (=> b!50671 m!43775))

(assert (=> b!50671 m!43775))

(assert (=> b!50671 m!43777))

(assert (=> b!50673 m!43775))

(declare-fun m!43783 () Bool)

(assert (=> b!50673 m!43783))

(declare-fun m!43785 () Bool)

(assert (=> b!50673 m!43785))

(assert (=> b!50673 m!43775))

(declare-fun m!43787 () Bool)

(assert (=> b!50673 m!43787))

(assert (=> b!50651 d!10215))

(declare-fun b!50675 () Bool)

(declare-fun e!32773 () Bool)

(declare-fun e!32771 () Bool)

(assert (=> b!50675 (= e!32773 e!32771)))

(declare-fun res!29136 () Bool)

(assert (=> b!50675 (=> (not res!29136) (not e!32771))))

(declare-fun e!32772 () Bool)

(assert (=> b!50675 (= res!29136 (not e!32772))))

(declare-fun res!29135 () Bool)

(assert (=> b!50675 (=> (not res!29135) (not e!32772))))

(assert (=> b!50675 (= res!29135 (validKeyInArray!0 (select (arr!1568 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50676 () Bool)

(declare-fun e!32770 () Bool)

(assert (=> b!50676 (= e!32771 e!32770)))

(declare-fun c!6818 () Bool)

(assert (=> b!50676 (= c!6818 (validKeyInArray!0 (select (arr!1568 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3897 () Bool)

(declare-fun call!3900 () Bool)

(assert (=> bm!3897 (= call!3900 (arrayNoDuplicates!0 (_keys!3530 (v!2168 (underlying!129 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6818 (Cons!1312 (select (arr!1568 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000) Nil!1313) Nil!1313)))))

(declare-fun b!50677 () Bool)

(assert (=> b!50677 (= e!32770 call!3900)))

(declare-fun b!50679 () Bool)

(assert (=> b!50679 (= e!32772 (contains!611 Nil!1313 (select (arr!1568 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10217 () Bool)

(declare-fun res!29134 () Bool)

(assert (=> d!10217 (=> res!29134 e!32773)))

(assert (=> d!10217 (= res!29134 (bvsge #b00000000000000000000000000000000 (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992))))))))

(assert (=> d!10217 (= (arrayNoDuplicates!0 (_keys!3530 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000000 Nil!1313) e!32773)))

(declare-fun b!50678 () Bool)

(assert (=> b!50678 (= e!32770 call!3900)))

(assert (= (and d!10217 (not res!29134)) b!50675))

(assert (= (and b!50675 res!29135) b!50679))

(assert (= (and b!50675 res!29136) b!50676))

(assert (= (and b!50676 c!6818) b!50678))

(assert (= (and b!50676 (not c!6818)) b!50677))

(assert (= (or b!50678 b!50677) bm!3897))

(assert (=> b!50675 m!43775))

(assert (=> b!50675 m!43775))

(assert (=> b!50675 m!43777))

(assert (=> b!50676 m!43775))

(assert (=> b!50676 m!43775))

(assert (=> b!50676 m!43777))

(assert (=> bm!3897 m!43775))

(declare-fun m!43789 () Bool)

(assert (=> bm!3897 m!43789))

(assert (=> b!50679 m!43775))

(assert (=> b!50679 m!43775))

(declare-fun m!43791 () Bool)

(assert (=> b!50679 m!43791))

(assert (=> b!50652 d!10217))

(declare-fun d!10219 () Bool)

(assert (=> d!10219 (arrayContainsKey!0 (_keys!3530 newMap!16) lt!21050 #b00000000000000000000000000000000)))

(declare-fun lt!21063 () Unit!1432)

(declare-fun choose!13 (array!3281 (_ BitVec 64) (_ BitVec 32)) Unit!1432)

(assert (=> d!10219 (= lt!21063 (choose!13 (_keys!3530 newMap!16) lt!21050 #b00000000000000000000000000000000))))

(assert (=> d!10219 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10219 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3530 newMap!16) lt!21050 #b00000000000000000000000000000000) lt!21063)))

(declare-fun bs!2364 () Bool)

(assert (= bs!2364 d!10219))

(assert (=> bs!2364 m!43737))

(declare-fun m!43793 () Bool)

(assert (=> bs!2364 m!43793))

(assert (=> b!50633 d!10219))

(declare-fun d!10221 () Bool)

(declare-fun res!29141 () Bool)

(declare-fun e!32778 () Bool)

(assert (=> d!10221 (=> res!29141 e!32778)))

(assert (=> d!10221 (= res!29141 (= (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) lt!21050))))

(assert (=> d!10221 (= (arrayContainsKey!0 (_keys!3530 newMap!16) lt!21050 #b00000000000000000000000000000000) e!32778)))

(declare-fun b!50684 () Bool)

(declare-fun e!32779 () Bool)

(assert (=> b!50684 (= e!32778 e!32779)))

(declare-fun res!29142 () Bool)

(assert (=> b!50684 (=> (not res!29142) (not e!32779))))

(assert (=> b!50684 (= res!29142 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1792 (_keys!3530 newMap!16))))))

(declare-fun b!50685 () Bool)

(assert (=> b!50685 (= e!32779 (arrayContainsKey!0 (_keys!3530 newMap!16) lt!21050 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10221 (not res!29141)) b!50684))

(assert (= (and b!50684 res!29142) b!50685))

(assert (=> d!10221 m!43727))

(declare-fun m!43795 () Bool)

(assert (=> b!50685 m!43795))

(assert (=> b!50633 d!10221))

(declare-fun b!50698 () Bool)

(declare-fun e!32788 () SeekEntryResult!214)

(declare-fun lt!21072 () SeekEntryResult!214)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3281 (_ BitVec 32)) SeekEntryResult!214)

(assert (=> b!50698 (= e!32788 (seekKeyOrZeroReturnVacant!0 (x!9246 lt!21072) (index!2980 lt!21072) (index!2980 lt!21072) (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) (_keys!3530 newMap!16) (mask!5712 newMap!16)))))

(declare-fun b!50699 () Bool)

(declare-fun c!6827 () Bool)

(declare-fun lt!21071 () (_ BitVec 64))

(assert (=> b!50699 (= c!6827 (= lt!21071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32787 () SeekEntryResult!214)

(assert (=> b!50699 (= e!32787 e!32788)))

(declare-fun b!50700 () Bool)

(assert (=> b!50700 (= e!32788 (MissingZero!214 (index!2980 lt!21072)))))

(declare-fun d!10223 () Bool)

(declare-fun lt!21070 () SeekEntryResult!214)

(assert (=> d!10223 (and (or ((_ is Undefined!214) lt!21070) (not ((_ is Found!214) lt!21070)) (and (bvsge (index!2979 lt!21070) #b00000000000000000000000000000000) (bvslt (index!2979 lt!21070) (size!1792 (_keys!3530 newMap!16))))) (or ((_ is Undefined!214) lt!21070) ((_ is Found!214) lt!21070) (not ((_ is MissingZero!214) lt!21070)) (and (bvsge (index!2978 lt!21070) #b00000000000000000000000000000000) (bvslt (index!2978 lt!21070) (size!1792 (_keys!3530 newMap!16))))) (or ((_ is Undefined!214) lt!21070) ((_ is Found!214) lt!21070) ((_ is MissingZero!214) lt!21070) (not ((_ is MissingVacant!214) lt!21070)) (and (bvsge (index!2981 lt!21070) #b00000000000000000000000000000000) (bvslt (index!2981 lt!21070) (size!1792 (_keys!3530 newMap!16))))) (or ((_ is Undefined!214) lt!21070) (ite ((_ is Found!214) lt!21070) (= (select (arr!1568 (_keys!3530 newMap!16)) (index!2979 lt!21070)) (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!214) lt!21070) (= (select (arr!1568 (_keys!3530 newMap!16)) (index!2978 lt!21070)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!214) lt!21070) (= (select (arr!1568 (_keys!3530 newMap!16)) (index!2981 lt!21070)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!32786 () SeekEntryResult!214)

(assert (=> d!10223 (= lt!21070 e!32786)))

(declare-fun c!6825 () Bool)

(assert (=> d!10223 (= c!6825 (and ((_ is Intermediate!214) lt!21072) (undefined!1026 lt!21072)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3281 (_ BitVec 32)) SeekEntryResult!214)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10223 (= lt!21072 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) (mask!5712 newMap!16)) (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) (_keys!3530 newMap!16) (mask!5712 newMap!16)))))

(assert (=> d!10223 (validMask!0 (mask!5712 newMap!16))))

(assert (=> d!10223 (= (seekEntryOrOpen!0 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) (_keys!3530 newMap!16) (mask!5712 newMap!16)) lt!21070)))

(declare-fun b!50701 () Bool)

(assert (=> b!50701 (= e!32786 e!32787)))

(assert (=> b!50701 (= lt!21071 (select (arr!1568 (_keys!3530 newMap!16)) (index!2980 lt!21072)))))

(declare-fun c!6826 () Bool)

(assert (=> b!50701 (= c!6826 (= lt!21071 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50702 () Bool)

(assert (=> b!50702 (= e!32786 Undefined!214)))

(declare-fun b!50703 () Bool)

(assert (=> b!50703 (= e!32787 (Found!214 (index!2980 lt!21072)))))

(assert (= (and d!10223 c!6825) b!50702))

(assert (= (and d!10223 (not c!6825)) b!50701))

(assert (= (and b!50701 c!6826) b!50703))

(assert (= (and b!50701 (not c!6826)) b!50699))

(assert (= (and b!50699 c!6827) b!50700))

(assert (= (and b!50699 (not c!6827)) b!50698))

(assert (=> b!50698 m!43727))

(declare-fun m!43797 () Bool)

(assert (=> b!50698 m!43797))

(declare-fun m!43799 () Bool)

(assert (=> d!10223 m!43799))

(assert (=> d!10223 m!43727))

(declare-fun m!43801 () Bool)

(assert (=> d!10223 m!43801))

(declare-fun m!43803 () Bool)

(assert (=> d!10223 m!43803))

(assert (=> d!10223 m!43727))

(assert (=> d!10223 m!43799))

(assert (=> d!10223 m!43725))

(declare-fun m!43805 () Bool)

(assert (=> d!10223 m!43805))

(declare-fun m!43807 () Bool)

(assert (=> d!10223 m!43807))

(declare-fun m!43809 () Bool)

(assert (=> b!50701 m!43809))

(assert (=> b!50633 d!10223))

(assert (=> b!50645 d!10213))

(declare-fun b!50706 () Bool)

(declare-fun res!29145 () Bool)

(declare-fun e!32789 () Bool)

(assert (=> b!50706 (=> (not res!29145) (not e!32789))))

(assert (=> b!50706 (= res!29145 (= (size!1798 (v!2168 (underlying!129 thiss!992))) (bvadd (_size!255 (v!2168 (underlying!129 thiss!992))) (bvsdiv (bvadd (extraKeys!1811 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!50707 () Bool)

(assert (=> b!50707 (= e!32789 (and (bvsge (extraKeys!1811 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1811 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!255 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50705 () Bool)

(declare-fun res!29143 () Bool)

(assert (=> b!50705 (=> (not res!29143) (not e!32789))))

(assert (=> b!50705 (= res!29143 (bvsge (size!1798 (v!2168 (underlying!129 thiss!992))) (_size!255 (v!2168 (underlying!129 thiss!992)))))))

(declare-fun b!50704 () Bool)

(declare-fun res!29146 () Bool)

(assert (=> b!50704 (=> (not res!29146) (not e!32789))))

(assert (=> b!50704 (= res!29146 (and (= (size!1793 (_values!1903 (v!2168 (underlying!129 thiss!992)))) (bvadd (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000001)) (= (size!1792 (_keys!3530 (v!2168 (underlying!129 thiss!992)))) (size!1793 (_values!1903 (v!2168 (underlying!129 thiss!992))))) (bvsge (_size!255 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!255 (v!2168 (underlying!129 thiss!992))) (bvadd (mask!5712 (v!2168 (underlying!129 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun d!10225 () Bool)

(declare-fun res!29144 () Bool)

(assert (=> d!10225 (=> (not res!29144) (not e!32789))))

(assert (=> d!10225 (= res!29144 (validMask!0 (mask!5712 (v!2168 (underlying!129 thiss!992)))))))

(assert (=> d!10225 (= (simpleValid!35 (v!2168 (underlying!129 thiss!992))) e!32789)))

(assert (= (and d!10225 res!29144) b!50704))

(assert (= (and b!50704 res!29146) b!50705))

(assert (= (and b!50705 res!29143) b!50706))

(assert (= (and b!50706 res!29145) b!50707))

(declare-fun m!43811 () Bool)

(assert (=> b!50706 m!43811))

(assert (=> b!50705 m!43811))

(assert (=> d!10225 m!43663))

(assert (=> d!10203 d!10225))

(assert (=> b!50646 d!10213))

(declare-fun d!10227 () Bool)

(assert (=> d!10227 (= (size!1798 newMap!16) (bvadd (_size!255 newMap!16) (bvsdiv (bvadd (extraKeys!1811 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!50608 d!10227))

(declare-fun b!50708 () Bool)

(declare-fun e!32793 () Bool)

(declare-fun e!32791 () Bool)

(assert (=> b!50708 (= e!32793 e!32791)))

(declare-fun res!29149 () Bool)

(assert (=> b!50708 (=> (not res!29149) (not e!32791))))

(declare-fun e!32792 () Bool)

(assert (=> b!50708 (= res!29149 (not e!32792))))

(declare-fun res!29148 () Bool)

(assert (=> b!50708 (=> (not res!29148) (not e!32792))))

(assert (=> b!50708 (= res!29148 (validKeyInArray!0 (select (arr!1568 (_keys!3530 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50709 () Bool)

(declare-fun e!32790 () Bool)

(assert (=> b!50709 (= e!32791 e!32790)))

(declare-fun c!6828 () Bool)

(assert (=> b!50709 (= c!6828 (validKeyInArray!0 (select (arr!1568 (_keys!3530 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!3901 () Bool)

(declare-fun bm!3898 () Bool)

(assert (=> bm!3898 (= call!3901 (arrayNoDuplicates!0 (_keys!3530 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6828 (Cons!1312 (select (arr!1568 (_keys!3530 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6813 (Cons!1312 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) Nil!1313) Nil!1313)) (ite c!6813 (Cons!1312 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) Nil!1313) Nil!1313))))))

(declare-fun b!50710 () Bool)

(assert (=> b!50710 (= e!32790 call!3901)))

(declare-fun b!50712 () Bool)

(assert (=> b!50712 (= e!32792 (contains!611 (ite c!6813 (Cons!1312 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) Nil!1313) Nil!1313) (select (arr!1568 (_keys!3530 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10229 () Bool)

(declare-fun res!29147 () Bool)

(assert (=> d!10229 (=> res!29147 e!32793)))

(assert (=> d!10229 (= res!29147 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1792 (_keys!3530 newMap!16))))))

(assert (=> d!10229 (= (arrayNoDuplicates!0 (_keys!3530 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6813 (Cons!1312 (select (arr!1568 (_keys!3530 newMap!16)) #b00000000000000000000000000000000) Nil!1313) Nil!1313)) e!32793)))

(declare-fun b!50711 () Bool)

(assert (=> b!50711 (= e!32790 call!3901)))

(assert (= (and d!10229 (not res!29147)) b!50708))

(assert (= (and b!50708 res!29148) b!50712))

(assert (= (and b!50708 res!29149) b!50709))

(assert (= (and b!50709 c!6828) b!50711))

(assert (= (and b!50709 (not c!6828)) b!50710))

(assert (= (or b!50711 b!50710) bm!3898))

(assert (=> b!50708 m!43759))

(assert (=> b!50708 m!43759))

(assert (=> b!50708 m!43761))

(assert (=> b!50709 m!43759))

(assert (=> b!50709 m!43759))

(assert (=> b!50709 m!43761))

(assert (=> bm!3898 m!43759))

(declare-fun m!43813 () Bool)

(assert (=> bm!3898 m!43813))

(assert (=> b!50712 m!43759))

(assert (=> b!50712 m!43759))

(declare-fun m!43815 () Bool)

(assert (=> b!50712 m!43815))

(assert (=> bm!3893 d!10229))

(assert (=> b!50609 d!10227))

(assert (=> b!50621 d!10213))

(declare-fun b!50713 () Bool)

(declare-fun e!32794 () (_ BitVec 32))

(declare-fun call!3902 () (_ BitVec 32))

(assert (=> b!50713 (= e!32794 (bvadd #b00000000000000000000000000000001 call!3902))))

(declare-fun b!50714 () Bool)

(declare-fun e!32795 () (_ BitVec 32))

(assert (=> b!50714 (= e!32795 #b00000000000000000000000000000000)))

(declare-fun d!10231 () Bool)

(declare-fun lt!21073 () (_ BitVec 32))

(assert (=> d!10231 (and (bvsge lt!21073 #b00000000000000000000000000000000) (bvsle lt!21073 (bvsub (size!1792 (_keys!3530 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!10231 (= lt!21073 e!32795)))

(declare-fun c!6830 () Bool)

(assert (=> d!10231 (= c!6830 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1792 (_keys!3530 newMap!16))))))

(assert (=> d!10231 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1792 (_keys!3530 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1792 (_keys!3530 newMap!16)) (size!1792 (_keys!3530 newMap!16))))))

(assert (=> d!10231 (= (arrayCountValidKeys!0 (_keys!3530 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1792 (_keys!3530 newMap!16))) lt!21073)))

(declare-fun b!50715 () Bool)

(assert (=> b!50715 (= e!32795 e!32794)))

(declare-fun c!6829 () Bool)

(assert (=> b!50715 (= c!6829 (validKeyInArray!0 (select (arr!1568 (_keys!3530 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3899 () Bool)

(assert (=> bm!3899 (= call!3902 (arrayCountValidKeys!0 (_keys!3530 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1792 (_keys!3530 newMap!16))))))

(declare-fun b!50716 () Bool)

(assert (=> b!50716 (= e!32794 call!3902)))

(assert (= (and d!10231 c!6830) b!50714))

(assert (= (and d!10231 (not c!6830)) b!50715))

(assert (= (and b!50715 c!6829) b!50713))

(assert (= (and b!50715 (not c!6829)) b!50716))

(assert (= (or b!50713 b!50716) bm!3899))

(assert (=> b!50715 m!43759))

(assert (=> b!50715 m!43759))

(assert (=> b!50715 m!43761))

(declare-fun m!43817 () Bool)

(assert (=> bm!3899 m!43817))

(assert (=> bm!3887 d!10231))

(declare-fun condMapEmpty!2227 () Bool)

(declare-fun mapDefault!2227 () ValueCell!752)

(assert (=> mapNonEmpty!2226 (= condMapEmpty!2227 (= mapRest!2226 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2227)))))

(declare-fun e!32796 () Bool)

(declare-fun mapRes!2227 () Bool)

(assert (=> mapNonEmpty!2226 (= tp!6744 (and e!32796 mapRes!2227))))

(declare-fun b!50718 () Bool)

(assert (=> b!50718 (= e!32796 tp_is_empty!2191)))

(declare-fun b!50717 () Bool)

(declare-fun e!32797 () Bool)

(assert (=> b!50717 (= e!32797 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2227 () Bool)

(assert (=> mapIsEmpty!2227 mapRes!2227))

(declare-fun mapNonEmpty!2227 () Bool)

(declare-fun tp!6745 () Bool)

(assert (=> mapNonEmpty!2227 (= mapRes!2227 (and tp!6745 e!32797))))

(declare-fun mapKey!2227 () (_ BitVec 32))

(declare-fun mapValue!2227 () ValueCell!752)

(declare-fun mapRest!2227 () (Array (_ BitVec 32) ValueCell!752))

(assert (=> mapNonEmpty!2227 (= mapRest!2226 (store mapRest!2227 mapKey!2227 mapValue!2227))))

(assert (= (and mapNonEmpty!2226 condMapEmpty!2227) mapIsEmpty!2227))

(assert (= (and mapNonEmpty!2226 (not condMapEmpty!2227)) mapNonEmpty!2227))

(assert (= (and mapNonEmpty!2227 ((_ is ValueCellFull!752) mapValue!2227)) b!50717))

(assert (= (and mapNonEmpty!2226 ((_ is ValueCellFull!752) mapDefault!2227)) b!50718))

(declare-fun m!43819 () Bool)

(assert (=> mapNonEmpty!2227 m!43819))

(declare-fun condMapEmpty!2228 () Bool)

(declare-fun mapDefault!2228 () ValueCell!752)

(assert (=> mapNonEmpty!2225 (= condMapEmpty!2228 (= mapRest!2225 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2228)))))

(declare-fun e!32798 () Bool)

(declare-fun mapRes!2228 () Bool)

(assert (=> mapNonEmpty!2225 (= tp!6743 (and e!32798 mapRes!2228))))

(declare-fun b!50720 () Bool)

(assert (=> b!50720 (= e!32798 tp_is_empty!2191)))

(declare-fun b!50719 () Bool)

(declare-fun e!32799 () Bool)

(assert (=> b!50719 (= e!32799 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2228 () Bool)

(assert (=> mapIsEmpty!2228 mapRes!2228))

(declare-fun mapNonEmpty!2228 () Bool)

(declare-fun tp!6746 () Bool)

(assert (=> mapNonEmpty!2228 (= mapRes!2228 (and tp!6746 e!32799))))

(declare-fun mapValue!2228 () ValueCell!752)

(declare-fun mapRest!2228 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapKey!2228 () (_ BitVec 32))

(assert (=> mapNonEmpty!2228 (= mapRest!2225 (store mapRest!2228 mapKey!2228 mapValue!2228))))

(assert (= (and mapNonEmpty!2225 condMapEmpty!2228) mapIsEmpty!2228))

(assert (= (and mapNonEmpty!2225 (not condMapEmpty!2228)) mapNonEmpty!2228))

(assert (= (and mapNonEmpty!2228 ((_ is ValueCellFull!752) mapValue!2228)) b!50719))

(assert (= (and mapNonEmpty!2225 ((_ is ValueCellFull!752) mapDefault!2228)) b!50720))

(declare-fun m!43821 () Bool)

(assert (=> mapNonEmpty!2228 m!43821))

(check-sat (not d!10225) (not b!50706) (not b!50659) (not bm!3896) (not bm!3894) (not mapNonEmpty!2227) (not b!50679) (not b!50671) (not b_next!1549) (not b!50708) (not b!50657) (not bm!3899) (not b_next!1551) (not b!50698) (not d!10223) (not mapNonEmpty!2228) (not b!50673) (not b!50715) (not d!10207) (not bm!3897) (not bm!3898) (not bm!3895) (not b!50675) (not b!50669) (not b!50676) (not b!50709) (not b!50685) tp_is_empty!2191 (not d!10219) b_and!2759 (not b!50705) (not b!50666) b_and!2757 (not b!50712))
(check-sat b_and!2757 b_and!2759 (not b_next!1549) (not b_next!1551))
