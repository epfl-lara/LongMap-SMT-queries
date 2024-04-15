; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8052 () Bool)

(assert start!8052)

(declare-fun b!50478 () Bool)

(declare-fun b_free!1549 () Bool)

(declare-fun b_next!1549 () Bool)

(assert (=> b!50478 (= b_free!1549 (not b_next!1549))))

(declare-fun tp!6711 () Bool)

(declare-fun b_and!2761 () Bool)

(assert (=> b!50478 (= tp!6711 b_and!2761)))

(declare-fun b!50477 () Bool)

(declare-fun b_free!1551 () Bool)

(declare-fun b_next!1551 () Bool)

(assert (=> b!50477 (= b_free!1551 (not b_next!1551))))

(declare-fun tp!6714 () Bool)

(declare-fun b_and!2763 () Bool)

(assert (=> b!50477 (= tp!6714 b_and!2763)))

(declare-fun mapNonEmpty!2207 () Bool)

(declare-fun mapRes!2208 () Bool)

(declare-fun tp!6712 () Bool)

(declare-fun e!32623 () Bool)

(assert (=> mapNonEmpty!2207 (= mapRes!2208 (and tp!6712 e!32623))))

(declare-fun mapKey!2208 () (_ BitVec 32))

(declare-datatypes ((V!2569 0))(
  ( (V!2570 (val!1140 Int)) )
))
(declare-datatypes ((array!3275 0))(
  ( (array!3276 (arr!1564 (Array (_ BitVec 32) (_ BitVec 64))) (size!1789 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!752 0))(
  ( (ValueCellFull!752 (v!2164 V!2569)) (EmptyCell!752) )
))
(declare-datatypes ((array!3277 0))(
  ( (array!3278 (arr!1565 (Array (_ BitVec 32) ValueCell!752)) (size!1790 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!412 0))(
  ( (LongMapFixedSize!413 (defaultEntry!1920 Int) (mask!5711 (_ BitVec 32)) (extraKeys!1811 (_ BitVec 32)) (zeroValue!1838 V!2569) (minValue!1838 V!2569) (_size!255 (_ BitVec 32)) (_keys!3529 array!3275) (_values!1903 array!3277) (_vacant!255 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!236 0))(
  ( (Cell!237 (v!2165 LongMapFixedSize!412)) )
))
(declare-datatypes ((LongMap!236 0))(
  ( (LongMap!237 (underlying!129 Cell!236)) )
))
(declare-fun thiss!992 () LongMap!236)

(declare-fun mapRest!2208 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapValue!2208 () ValueCell!752)

(assert (=> mapNonEmpty!2207 (= (arr!1565 (_values!1903 (v!2165 (underlying!129 thiss!992)))) (store mapRest!2208 mapKey!2208 mapValue!2208))))

(declare-fun b!50466 () Bool)

(declare-fun tp_is_empty!2191 () Bool)

(assert (=> b!50466 (= e!32623 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2207 () Bool)

(declare-fun mapRes!2207 () Bool)

(assert (=> mapIsEmpty!2207 mapRes!2207))

(declare-fun b!50467 () Bool)

(declare-fun e!32621 () Bool)

(assert (=> b!50467 (= e!32621 tp_is_empty!2191)))

(declare-fun b!50468 () Bool)

(declare-fun res!29056 () Bool)

(declare-fun e!32614 () Bool)

(assert (=> b!50468 (=> (not res!29056) (not e!32614))))

(declare-fun newMap!16 () LongMapFixedSize!412)

(declare-fun valid!146 (LongMapFixedSize!412) Bool)

(assert (=> b!50468 (= res!29056 (valid!146 newMap!16))))

(declare-fun b!50469 () Bool)

(declare-fun res!29057 () Bool)

(assert (=> b!50469 (=> (not res!29057) (not e!32614))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50469 (= res!29057 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992)))))))))

(declare-fun b!50470 () Bool)

(declare-fun res!29055 () Bool)

(assert (=> b!50470 (=> (not res!29055) (not e!32614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50470 (= res!29055 (validMask!0 (mask!5711 (v!2165 (underlying!129 thiss!992)))))))

(declare-fun b!50471 () Bool)

(declare-fun e!32617 () Bool)

(assert (=> b!50471 (= e!32617 tp_is_empty!2191)))

(declare-fun b!50472 () Bool)

(declare-fun e!32618 () Bool)

(assert (=> b!50472 (= e!32618 tp_is_empty!2191)))

(declare-fun b!50473 () Bool)

(declare-fun e!32622 () Bool)

(declare-fun e!32619 () Bool)

(assert (=> b!50473 (= e!32622 e!32619)))

(declare-fun b!50474 () Bool)

(declare-fun res!29059 () Bool)

(assert (=> b!50474 (=> (not res!29059) (not e!32614))))

(assert (=> b!50474 (= res!29059 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5711 newMap!16)) (_size!255 (v!2165 (underlying!129 thiss!992)))))))

(declare-fun res!29058 () Bool)

(assert (=> start!8052 (=> (not res!29058) (not e!32614))))

(declare-fun valid!147 (LongMap!236) Bool)

(assert (=> start!8052 (= res!29058 (valid!147 thiss!992))))

(assert (=> start!8052 e!32614))

(assert (=> start!8052 e!32622))

(assert (=> start!8052 true))

(declare-fun e!32620 () Bool)

(assert (=> start!8052 e!32620))

(declare-fun mapNonEmpty!2208 () Bool)

(declare-fun tp!6713 () Bool)

(assert (=> mapNonEmpty!2208 (= mapRes!2207 (and tp!6713 e!32621))))

(declare-fun mapValue!2207 () ValueCell!752)

(declare-fun mapRest!2207 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapKey!2207 () (_ BitVec 32))

(assert (=> mapNonEmpty!2208 (= (arr!1565 (_values!1903 newMap!16)) (store mapRest!2207 mapKey!2207 mapValue!2207))))

(declare-fun b!50475 () Bool)

(declare-fun e!32624 () Bool)

(assert (=> b!50475 (= e!32624 (and e!32617 mapRes!2208))))

(declare-fun condMapEmpty!2207 () Bool)

(declare-fun mapDefault!2207 () ValueCell!752)

(assert (=> b!50475 (= condMapEmpty!2207 (= (arr!1565 (_values!1903 (v!2165 (underlying!129 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2207)))))

(declare-fun b!50476 () Bool)

(declare-fun e!32613 () Bool)

(assert (=> b!50476 (= e!32619 e!32613)))

(declare-fun e!32625 () Bool)

(declare-fun array_inv!955 (array!3275) Bool)

(declare-fun array_inv!956 (array!3277) Bool)

(assert (=> b!50477 (= e!32620 (and tp!6714 tp_is_empty!2191 (array_inv!955 (_keys!3529 newMap!16)) (array_inv!956 (_values!1903 newMap!16)) e!32625))))

(declare-fun mapIsEmpty!2208 () Bool)

(assert (=> mapIsEmpty!2208 mapRes!2208))

(assert (=> b!50478 (= e!32613 (and tp!6711 tp_is_empty!2191 (array_inv!955 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) (array_inv!956 (_values!1903 (v!2165 (underlying!129 thiss!992)))) e!32624))))

(declare-fun b!50479 () Bool)

(assert (=> b!50479 (= e!32614 (and (= (size!1790 (_values!1903 (v!2165 (underlying!129 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5711 (v!2165 (underlying!129 thiss!992))))) (not (= (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) (size!1790 (_values!1903 (v!2165 (underlying!129 thiss!992))))))))))

(declare-fun b!50480 () Bool)

(assert (=> b!50480 (= e!32625 (and e!32618 mapRes!2207))))

(declare-fun condMapEmpty!2208 () Bool)

(declare-fun mapDefault!2208 () ValueCell!752)

(assert (=> b!50480 (= condMapEmpty!2208 (= (arr!1565 (_values!1903 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2208)))))

(assert (= (and start!8052 res!29058) b!50469))

(assert (= (and b!50469 res!29057) b!50468))

(assert (= (and b!50468 res!29056) b!50474))

(assert (= (and b!50474 res!29059) b!50470))

(assert (= (and b!50470 res!29055) b!50479))

(assert (= (and b!50475 condMapEmpty!2207) mapIsEmpty!2208))

(assert (= (and b!50475 (not condMapEmpty!2207)) mapNonEmpty!2207))

(get-info :version)

(assert (= (and mapNonEmpty!2207 ((_ is ValueCellFull!752) mapValue!2208)) b!50466))

(assert (= (and b!50475 ((_ is ValueCellFull!752) mapDefault!2207)) b!50471))

(assert (= b!50478 b!50475))

(assert (= b!50476 b!50478))

(assert (= b!50473 b!50476))

(assert (= start!8052 b!50473))

(assert (= (and b!50480 condMapEmpty!2208) mapIsEmpty!2207))

(assert (= (and b!50480 (not condMapEmpty!2208)) mapNonEmpty!2208))

(assert (= (and mapNonEmpty!2208 ((_ is ValueCellFull!752) mapValue!2207)) b!50467))

(assert (= (and b!50480 ((_ is ValueCellFull!752) mapDefault!2208)) b!50472))

(assert (= b!50477 b!50480))

(assert (= start!8052 b!50477))

(declare-fun m!43697 () Bool)

(assert (=> mapNonEmpty!2207 m!43697))

(declare-fun m!43699 () Bool)

(assert (=> start!8052 m!43699))

(declare-fun m!43701 () Bool)

(assert (=> b!50468 m!43701))

(declare-fun m!43703 () Bool)

(assert (=> b!50478 m!43703))

(declare-fun m!43705 () Bool)

(assert (=> b!50478 m!43705))

(declare-fun m!43707 () Bool)

(assert (=> b!50470 m!43707))

(declare-fun m!43709 () Bool)

(assert (=> mapNonEmpty!2208 m!43709))

(declare-fun m!43711 () Bool)

(assert (=> b!50477 m!43711))

(declare-fun m!43713 () Bool)

(assert (=> b!50477 m!43713))

(check-sat b_and!2763 (not b!50478) (not mapNonEmpty!2207) (not b!50477) (not start!8052) (not b_next!1551) tp_is_empty!2191 b_and!2761 (not b_next!1549) (not mapNonEmpty!2208) (not b!50470) (not b!50468))
(check-sat b_and!2761 b_and!2763 (not b_next!1549) (not b_next!1551))
(get-model)

(declare-fun d!10171 () Bool)

(assert (=> d!10171 (= (array_inv!955 (_keys!3529 newMap!16)) (bvsge (size!1789 (_keys!3529 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50477 d!10171))

(declare-fun d!10173 () Bool)

(assert (=> d!10173 (= (array_inv!956 (_values!1903 newMap!16)) (bvsge (size!1790 (_values!1903 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50477 d!10173))

(declare-fun d!10175 () Bool)

(declare-fun res!29096 () Bool)

(declare-fun e!32706 () Bool)

(assert (=> d!10175 (=> (not res!29096) (not e!32706))))

(declare-fun simpleValid!35 (LongMapFixedSize!412) Bool)

(assert (=> d!10175 (= res!29096 (simpleValid!35 newMap!16))))

(assert (=> d!10175 (= (valid!146 newMap!16) e!32706)))

(declare-fun b!50577 () Bool)

(declare-fun res!29097 () Bool)

(assert (=> b!50577 (=> (not res!29097) (not e!32706))))

(declare-fun arrayCountValidKeys!0 (array!3275 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50577 (= res!29097 (= (arrayCountValidKeys!0 (_keys!3529 newMap!16) #b00000000000000000000000000000000 (size!1789 (_keys!3529 newMap!16))) (_size!255 newMap!16)))))

(declare-fun b!50578 () Bool)

(declare-fun res!29098 () Bool)

(assert (=> b!50578 (=> (not res!29098) (not e!32706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3275 (_ BitVec 32)) Bool)

(assert (=> b!50578 (= res!29098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3529 newMap!16) (mask!5711 newMap!16)))))

(declare-fun b!50579 () Bool)

(declare-datatypes ((List!1326 0))(
  ( (Nil!1323) (Cons!1322 (h!1902 (_ BitVec 64)) (t!4359 List!1326)) )
))
(declare-fun arrayNoDuplicates!0 (array!3275 (_ BitVec 32) List!1326) Bool)

(assert (=> b!50579 (= e!32706 (arrayNoDuplicates!0 (_keys!3529 newMap!16) #b00000000000000000000000000000000 Nil!1323))))

(assert (= (and d!10175 res!29096) b!50577))

(assert (= (and b!50577 res!29097) b!50578))

(assert (= (and b!50578 res!29098) b!50579))

(declare-fun m!43751 () Bool)

(assert (=> d!10175 m!43751))

(declare-fun m!43753 () Bool)

(assert (=> b!50577 m!43753))

(declare-fun m!43755 () Bool)

(assert (=> b!50578 m!43755))

(declare-fun m!43757 () Bool)

(assert (=> b!50579 m!43757))

(assert (=> b!50468 d!10175))

(declare-fun d!10177 () Bool)

(assert (=> d!10177 (= (array_inv!955 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) (bvsge (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50478 d!10177))

(declare-fun d!10179 () Bool)

(assert (=> d!10179 (= (array_inv!956 (_values!1903 (v!2165 (underlying!129 thiss!992)))) (bvsge (size!1790 (_values!1903 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50478 d!10179))

(declare-fun d!10181 () Bool)

(assert (=> d!10181 (= (validMask!0 (mask!5711 (v!2165 (underlying!129 thiss!992)))) (and (or (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000001111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000011111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000001111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000011111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000001111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000011111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000001111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000011111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000001111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000011111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000001111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000011111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000111111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000001111111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000011111111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000111111111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000001111111111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000011111111111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000111111111111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00001111111111111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00011111111111111111111111111111) (= (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50470 d!10181))

(declare-fun d!10183 () Bool)

(assert (=> d!10183 (= (valid!147 thiss!992) (valid!146 (v!2165 (underlying!129 thiss!992))))))

(declare-fun bs!2362 () Bool)

(assert (= bs!2362 d!10183))

(declare-fun m!43759 () Bool)

(assert (=> bs!2362 m!43759))

(assert (=> start!8052 d!10183))

(declare-fun condMapEmpty!2223 () Bool)

(declare-fun mapDefault!2223 () ValueCell!752)

(assert (=> mapNonEmpty!2207 (= condMapEmpty!2223 (= mapRest!2208 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2223)))))

(declare-fun e!32712 () Bool)

(declare-fun mapRes!2223 () Bool)

(assert (=> mapNonEmpty!2207 (= tp!6712 (and e!32712 mapRes!2223))))

(declare-fun b!50587 () Bool)

(assert (=> b!50587 (= e!32712 tp_is_empty!2191)))

(declare-fun b!50586 () Bool)

(declare-fun e!32711 () Bool)

(assert (=> b!50586 (= e!32711 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2223 () Bool)

(assert (=> mapIsEmpty!2223 mapRes!2223))

(declare-fun mapNonEmpty!2223 () Bool)

(declare-fun tp!6741 () Bool)

(assert (=> mapNonEmpty!2223 (= mapRes!2223 (and tp!6741 e!32711))))

(declare-fun mapKey!2223 () (_ BitVec 32))

(declare-fun mapRest!2223 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapValue!2223 () ValueCell!752)

(assert (=> mapNonEmpty!2223 (= mapRest!2208 (store mapRest!2223 mapKey!2223 mapValue!2223))))

(assert (= (and mapNonEmpty!2207 condMapEmpty!2223) mapIsEmpty!2223))

(assert (= (and mapNonEmpty!2207 (not condMapEmpty!2223)) mapNonEmpty!2223))

(assert (= (and mapNonEmpty!2223 ((_ is ValueCellFull!752) mapValue!2223)) b!50586))

(assert (= (and mapNonEmpty!2207 ((_ is ValueCellFull!752) mapDefault!2223)) b!50587))

(declare-fun m!43761 () Bool)

(assert (=> mapNonEmpty!2223 m!43761))

(declare-fun condMapEmpty!2224 () Bool)

(declare-fun mapDefault!2224 () ValueCell!752)

(assert (=> mapNonEmpty!2208 (= condMapEmpty!2224 (= mapRest!2207 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2224)))))

(declare-fun e!32714 () Bool)

(declare-fun mapRes!2224 () Bool)

(assert (=> mapNonEmpty!2208 (= tp!6713 (and e!32714 mapRes!2224))))

(declare-fun b!50589 () Bool)

(assert (=> b!50589 (= e!32714 tp_is_empty!2191)))

(declare-fun b!50588 () Bool)

(declare-fun e!32713 () Bool)

(assert (=> b!50588 (= e!32713 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2224 () Bool)

(assert (=> mapIsEmpty!2224 mapRes!2224))

(declare-fun mapNonEmpty!2224 () Bool)

(declare-fun tp!6742 () Bool)

(assert (=> mapNonEmpty!2224 (= mapRes!2224 (and tp!6742 e!32713))))

(declare-fun mapRest!2224 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapValue!2224 () ValueCell!752)

(declare-fun mapKey!2224 () (_ BitVec 32))

(assert (=> mapNonEmpty!2224 (= mapRest!2207 (store mapRest!2224 mapKey!2224 mapValue!2224))))

(assert (= (and mapNonEmpty!2208 condMapEmpty!2224) mapIsEmpty!2224))

(assert (= (and mapNonEmpty!2208 (not condMapEmpty!2224)) mapNonEmpty!2224))

(assert (= (and mapNonEmpty!2224 ((_ is ValueCellFull!752) mapValue!2224)) b!50588))

(assert (= (and mapNonEmpty!2208 ((_ is ValueCellFull!752) mapDefault!2224)) b!50589))

(declare-fun m!43763 () Bool)

(assert (=> mapNonEmpty!2224 m!43763))

(check-sat (not d!10183) (not b_next!1551) (not d!10175) tp_is_empty!2191 (not b_next!1549) (not mapNonEmpty!2223) b_and!2761 (not b!50578) b_and!2763 (not b!50579) (not mapNonEmpty!2224) (not b!50577))
(check-sat b_and!2761 b_and!2763 (not b_next!1549) (not b_next!1551))
(get-model)

(declare-fun b!50601 () Bool)

(declare-fun e!32724 () Bool)

(declare-fun contains!616 (List!1326 (_ BitVec 64)) Bool)

(assert (=> b!50601 (= e!32724 (contains!616 Nil!1323 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50602 () Bool)

(declare-fun e!32723 () Bool)

(declare-fun e!32725 () Bool)

(assert (=> b!50602 (= e!32723 e!32725)))

(declare-fun res!29107 () Bool)

(assert (=> b!50602 (=> (not res!29107) (not e!32725))))

(assert (=> b!50602 (= res!29107 (not e!32724))))

(declare-fun res!29105 () Bool)

(assert (=> b!50602 (=> (not res!29105) (not e!32724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!50602 (= res!29105 (validKeyInArray!0 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50603 () Bool)

(declare-fun e!32726 () Bool)

(declare-fun call!3903 () Bool)

(assert (=> b!50603 (= e!32726 call!3903)))

(declare-fun d!10185 () Bool)

(declare-fun res!29106 () Bool)

(assert (=> d!10185 (=> res!29106 e!32723)))

(assert (=> d!10185 (= res!29106 (bvsge #b00000000000000000000000000000000 (size!1789 (_keys!3529 newMap!16))))))

(assert (=> d!10185 (= (arrayNoDuplicates!0 (_keys!3529 newMap!16) #b00000000000000000000000000000000 Nil!1323) e!32723)))

(declare-fun b!50600 () Bool)

(assert (=> b!50600 (= e!32725 e!32726)))

(declare-fun c!6797 () Bool)

(assert (=> b!50600 (= c!6797 (validKeyInArray!0 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50604 () Bool)

(assert (=> b!50604 (= e!32726 call!3903)))

(declare-fun bm!3900 () Bool)

(assert (=> bm!3900 (= call!3903 (arrayNoDuplicates!0 (_keys!3529 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6797 (Cons!1322 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) Nil!1323) Nil!1323)))))

(assert (= (and d!10185 (not res!29106)) b!50602))

(assert (= (and b!50602 res!29105) b!50601))

(assert (= (and b!50602 res!29107) b!50600))

(assert (= (and b!50600 c!6797) b!50603))

(assert (= (and b!50600 (not c!6797)) b!50604))

(assert (= (or b!50603 b!50604) bm!3900))

(declare-fun m!43765 () Bool)

(assert (=> b!50601 m!43765))

(assert (=> b!50601 m!43765))

(declare-fun m!43767 () Bool)

(assert (=> b!50601 m!43767))

(assert (=> b!50602 m!43765))

(assert (=> b!50602 m!43765))

(declare-fun m!43769 () Bool)

(assert (=> b!50602 m!43769))

(assert (=> b!50600 m!43765))

(assert (=> b!50600 m!43765))

(assert (=> b!50600 m!43769))

(assert (=> bm!3900 m!43765))

(declare-fun m!43771 () Bool)

(assert (=> bm!3900 m!43771))

(assert (=> b!50579 d!10185))

(declare-fun d!10187 () Bool)

(declare-fun res!29116 () Bool)

(declare-fun e!32729 () Bool)

(assert (=> d!10187 (=> (not res!29116) (not e!32729))))

(assert (=> d!10187 (= res!29116 (validMask!0 (mask!5711 newMap!16)))))

(assert (=> d!10187 (= (simpleValid!35 newMap!16) e!32729)))

(declare-fun b!50615 () Bool)

(declare-fun res!29118 () Bool)

(assert (=> b!50615 (=> (not res!29118) (not e!32729))))

(declare-fun size!1795 (LongMapFixedSize!412) (_ BitVec 32))

(assert (=> b!50615 (= res!29118 (= (size!1795 newMap!16) (bvadd (_size!255 newMap!16) (bvsdiv (bvadd (extraKeys!1811 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!50614 () Bool)

(declare-fun res!29119 () Bool)

(assert (=> b!50614 (=> (not res!29119) (not e!32729))))

(assert (=> b!50614 (= res!29119 (bvsge (size!1795 newMap!16) (_size!255 newMap!16)))))

(declare-fun b!50613 () Bool)

(declare-fun res!29117 () Bool)

(assert (=> b!50613 (=> (not res!29117) (not e!32729))))

(assert (=> b!50613 (= res!29117 (and (= (size!1790 (_values!1903 newMap!16)) (bvadd (mask!5711 newMap!16) #b00000000000000000000000000000001)) (= (size!1789 (_keys!3529 newMap!16)) (size!1790 (_values!1903 newMap!16))) (bvsge (_size!255 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!255 newMap!16) (bvadd (mask!5711 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!50616 () Bool)

(assert (=> b!50616 (= e!32729 (and (bvsge (extraKeys!1811 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1811 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!255 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!10187 res!29116) b!50613))

(assert (= (and b!50613 res!29117) b!50614))

(assert (= (and b!50614 res!29119) b!50615))

(assert (= (and b!50615 res!29118) b!50616))

(declare-fun m!43773 () Bool)

(assert (=> d!10187 m!43773))

(declare-fun m!43775 () Bool)

(assert (=> b!50615 m!43775))

(assert (=> b!50614 m!43775))

(assert (=> d!10175 d!10187))

(declare-fun d!10189 () Bool)

(declare-fun res!29120 () Bool)

(declare-fun e!32730 () Bool)

(assert (=> d!10189 (=> (not res!29120) (not e!32730))))

(assert (=> d!10189 (= res!29120 (simpleValid!35 (v!2165 (underlying!129 thiss!992))))))

(assert (=> d!10189 (= (valid!146 (v!2165 (underlying!129 thiss!992))) e!32730)))

(declare-fun b!50617 () Bool)

(declare-fun res!29121 () Bool)

(assert (=> b!50617 (=> (not res!29121) (not e!32730))))

(assert (=> b!50617 (= res!29121 (= (arrayCountValidKeys!0 (_keys!3529 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000000 (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992))))) (_size!255 (v!2165 (underlying!129 thiss!992)))))))

(declare-fun b!50618 () Bool)

(declare-fun res!29122 () Bool)

(assert (=> b!50618 (=> (not res!29122) (not e!32730))))

(assert (=> b!50618 (= res!29122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3529 (v!2165 (underlying!129 thiss!992))) (mask!5711 (v!2165 (underlying!129 thiss!992)))))))

(declare-fun b!50619 () Bool)

(assert (=> b!50619 (= e!32730 (arrayNoDuplicates!0 (_keys!3529 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000000 Nil!1323))))

(assert (= (and d!10189 res!29120) b!50617))

(assert (= (and b!50617 res!29121) b!50618))

(assert (= (and b!50618 res!29122) b!50619))

(declare-fun m!43777 () Bool)

(assert (=> d!10189 m!43777))

(declare-fun m!43779 () Bool)

(assert (=> b!50617 m!43779))

(declare-fun m!43781 () Bool)

(assert (=> b!50618 m!43781))

(declare-fun m!43783 () Bool)

(assert (=> b!50619 m!43783))

(assert (=> d!10183 d!10189))

(declare-fun b!50628 () Bool)

(declare-fun e!32736 () (_ BitVec 32))

(declare-fun call!3906 () (_ BitVec 32))

(assert (=> b!50628 (= e!32736 call!3906)))

(declare-fun d!10191 () Bool)

(declare-fun lt!21068 () (_ BitVec 32))

(assert (=> d!10191 (and (bvsge lt!21068 #b00000000000000000000000000000000) (bvsle lt!21068 (bvsub (size!1789 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32735 () (_ BitVec 32))

(assert (=> d!10191 (= lt!21068 e!32735)))

(declare-fun c!6802 () Bool)

(assert (=> d!10191 (= c!6802 (bvsge #b00000000000000000000000000000000 (size!1789 (_keys!3529 newMap!16))))))

(assert (=> d!10191 (and (bvsle #b00000000000000000000000000000000 (size!1789 (_keys!3529 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1789 (_keys!3529 newMap!16)) (size!1789 (_keys!3529 newMap!16))))))

(assert (=> d!10191 (= (arrayCountValidKeys!0 (_keys!3529 newMap!16) #b00000000000000000000000000000000 (size!1789 (_keys!3529 newMap!16))) lt!21068)))

(declare-fun b!50629 () Bool)

(assert (=> b!50629 (= e!32735 e!32736)))

(declare-fun c!6803 () Bool)

(assert (=> b!50629 (= c!6803 (validKeyInArray!0 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50630 () Bool)

(assert (=> b!50630 (= e!32736 (bvadd #b00000000000000000000000000000001 call!3906))))

(declare-fun bm!3903 () Bool)

(assert (=> bm!3903 (= call!3906 (arrayCountValidKeys!0 (_keys!3529 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1789 (_keys!3529 newMap!16))))))

(declare-fun b!50631 () Bool)

(assert (=> b!50631 (= e!32735 #b00000000000000000000000000000000)))

(assert (= (and d!10191 c!6802) b!50631))

(assert (= (and d!10191 (not c!6802)) b!50629))

(assert (= (and b!50629 c!6803) b!50630))

(assert (= (and b!50629 (not c!6803)) b!50628))

(assert (= (or b!50630 b!50628) bm!3903))

(assert (=> b!50629 m!43765))

(assert (=> b!50629 m!43765))

(assert (=> b!50629 m!43769))

(declare-fun m!43785 () Bool)

(assert (=> bm!3903 m!43785))

(assert (=> b!50577 d!10191))

(declare-fun b!50641 () Bool)

(declare-fun e!32743 () Bool)

(declare-fun call!3909 () Bool)

(assert (=> b!50641 (= e!32743 call!3909)))

(declare-fun b!50642 () Bool)

(declare-fun e!32744 () Bool)

(assert (=> b!50642 (= e!32744 e!32743)))

(declare-fun c!6806 () Bool)

(assert (=> b!50642 (= c!6806 (validKeyInArray!0 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10193 () Bool)

(declare-fun res!29128 () Bool)

(assert (=> d!10193 (=> res!29128 e!32744)))

(assert (=> d!10193 (= res!29128 (bvsge #b00000000000000000000000000000000 (size!1789 (_keys!3529 newMap!16))))))

(assert (=> d!10193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3529 newMap!16) (mask!5711 newMap!16)) e!32744)))

(declare-fun b!50640 () Bool)

(declare-fun e!32745 () Bool)

(assert (=> b!50640 (= e!32745 call!3909)))

(declare-fun b!50643 () Bool)

(assert (=> b!50643 (= e!32743 e!32745)))

(declare-fun lt!21077 () (_ BitVec 64))

(assert (=> b!50643 (= lt!21077 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1426 0))(
  ( (Unit!1427) )
))
(declare-fun lt!21075 () Unit!1426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3275 (_ BitVec 64) (_ BitVec 32)) Unit!1426)

(assert (=> b!50643 (= lt!21075 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3529 newMap!16) lt!21077 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!50643 (arrayContainsKey!0 (_keys!3529 newMap!16) lt!21077 #b00000000000000000000000000000000)))

(declare-fun lt!21076 () Unit!1426)

(assert (=> b!50643 (= lt!21076 lt!21075)))

(declare-fun res!29127 () Bool)

(declare-datatypes ((SeekEntryResult!223 0))(
  ( (MissingZero!223 (index!3014 (_ BitVec 32))) (Found!223 (index!3015 (_ BitVec 32))) (Intermediate!223 (undefined!1035 Bool) (index!3016 (_ BitVec 32)) (x!9254 (_ BitVec 32))) (Undefined!223) (MissingVacant!223 (index!3017 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3275 (_ BitVec 32)) SeekEntryResult!223)

(assert (=> b!50643 (= res!29127 (= (seekEntryOrOpen!0 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) (_keys!3529 newMap!16) (mask!5711 newMap!16)) (Found!223 #b00000000000000000000000000000000)))))

(assert (=> b!50643 (=> (not res!29127) (not e!32745))))

(declare-fun bm!3906 () Bool)

(assert (=> bm!3906 (= call!3909 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3529 newMap!16) (mask!5711 newMap!16)))))

(assert (= (and d!10193 (not res!29128)) b!50642))

(assert (= (and b!50642 c!6806) b!50643))

(assert (= (and b!50642 (not c!6806)) b!50641))

(assert (= (and b!50643 res!29127) b!50640))

(assert (= (or b!50640 b!50641) bm!3906))

(assert (=> b!50642 m!43765))

(assert (=> b!50642 m!43765))

(assert (=> b!50642 m!43769))

(assert (=> b!50643 m!43765))

(declare-fun m!43787 () Bool)

(assert (=> b!50643 m!43787))

(declare-fun m!43789 () Bool)

(assert (=> b!50643 m!43789))

(assert (=> b!50643 m!43765))

(declare-fun m!43791 () Bool)

(assert (=> b!50643 m!43791))

(declare-fun m!43793 () Bool)

(assert (=> bm!3906 m!43793))

(assert (=> b!50578 d!10193))

(declare-fun condMapEmpty!2225 () Bool)

(declare-fun mapDefault!2225 () ValueCell!752)

(assert (=> mapNonEmpty!2224 (= condMapEmpty!2225 (= mapRest!2224 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2225)))))

(declare-fun e!32747 () Bool)

(declare-fun mapRes!2225 () Bool)

(assert (=> mapNonEmpty!2224 (= tp!6742 (and e!32747 mapRes!2225))))

(declare-fun b!50645 () Bool)

(assert (=> b!50645 (= e!32747 tp_is_empty!2191)))

(declare-fun b!50644 () Bool)

(declare-fun e!32746 () Bool)

(assert (=> b!50644 (= e!32746 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2225 () Bool)

(assert (=> mapIsEmpty!2225 mapRes!2225))

(declare-fun mapNonEmpty!2225 () Bool)

(declare-fun tp!6743 () Bool)

(assert (=> mapNonEmpty!2225 (= mapRes!2225 (and tp!6743 e!32746))))

(declare-fun mapValue!2225 () ValueCell!752)

(declare-fun mapRest!2225 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapKey!2225 () (_ BitVec 32))

(assert (=> mapNonEmpty!2225 (= mapRest!2224 (store mapRest!2225 mapKey!2225 mapValue!2225))))

(assert (= (and mapNonEmpty!2224 condMapEmpty!2225) mapIsEmpty!2225))

(assert (= (and mapNonEmpty!2224 (not condMapEmpty!2225)) mapNonEmpty!2225))

(assert (= (and mapNonEmpty!2225 ((_ is ValueCellFull!752) mapValue!2225)) b!50644))

(assert (= (and mapNonEmpty!2224 ((_ is ValueCellFull!752) mapDefault!2225)) b!50645))

(declare-fun m!43795 () Bool)

(assert (=> mapNonEmpty!2225 m!43795))

(declare-fun condMapEmpty!2226 () Bool)

(declare-fun mapDefault!2226 () ValueCell!752)

(assert (=> mapNonEmpty!2223 (= condMapEmpty!2226 (= mapRest!2223 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2226)))))

(declare-fun e!32749 () Bool)

(declare-fun mapRes!2226 () Bool)

(assert (=> mapNonEmpty!2223 (= tp!6741 (and e!32749 mapRes!2226))))

(declare-fun b!50647 () Bool)

(assert (=> b!50647 (= e!32749 tp_is_empty!2191)))

(declare-fun b!50646 () Bool)

(declare-fun e!32748 () Bool)

(assert (=> b!50646 (= e!32748 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2226 () Bool)

(assert (=> mapIsEmpty!2226 mapRes!2226))

(declare-fun mapNonEmpty!2226 () Bool)

(declare-fun tp!6744 () Bool)

(assert (=> mapNonEmpty!2226 (= mapRes!2226 (and tp!6744 e!32748))))

(declare-fun mapRest!2226 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapKey!2226 () (_ BitVec 32))

(declare-fun mapValue!2226 () ValueCell!752)

(assert (=> mapNonEmpty!2226 (= mapRest!2223 (store mapRest!2226 mapKey!2226 mapValue!2226))))

(assert (= (and mapNonEmpty!2223 condMapEmpty!2226) mapIsEmpty!2226))

(assert (= (and mapNonEmpty!2223 (not condMapEmpty!2226)) mapNonEmpty!2226))

(assert (= (and mapNonEmpty!2226 ((_ is ValueCellFull!752) mapValue!2226)) b!50646))

(assert (= (and mapNonEmpty!2223 ((_ is ValueCellFull!752) mapDefault!2226)) b!50647))

(declare-fun m!43797 () Bool)

(assert (=> mapNonEmpty!2226 m!43797))

(check-sat b_and!2763 (not mapNonEmpty!2226) (not b!50642) (not b!50601) (not b!50600) (not bm!3903) (not bm!3906) b_and!2761 (not b!50619) (not b!50618) (not b!50614) (not b!50602) (not b_next!1551) (not b!50643) (not mapNonEmpty!2225) (not b!50617) (not d!10187) (not b!50629) tp_is_empty!2191 (not d!10189) (not b_next!1549) (not bm!3900) (not b!50615))
(check-sat b_and!2761 b_and!2763 (not b_next!1549) (not b_next!1551))
(get-model)

(declare-fun d!10195 () Bool)

(assert (=> d!10195 (arrayContainsKey!0 (_keys!3529 newMap!16) lt!21077 #b00000000000000000000000000000000)))

(declare-fun lt!21080 () Unit!1426)

(declare-fun choose!13 (array!3275 (_ BitVec 64) (_ BitVec 32)) Unit!1426)

(assert (=> d!10195 (= lt!21080 (choose!13 (_keys!3529 newMap!16) lt!21077 #b00000000000000000000000000000000))))

(assert (=> d!10195 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10195 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3529 newMap!16) lt!21077 #b00000000000000000000000000000000) lt!21080)))

(declare-fun bs!2363 () Bool)

(assert (= bs!2363 d!10195))

(assert (=> bs!2363 m!43789))

(declare-fun m!43799 () Bool)

(assert (=> bs!2363 m!43799))

(assert (=> b!50643 d!10195))

(declare-fun d!10197 () Bool)

(declare-fun res!29133 () Bool)

(declare-fun e!32754 () Bool)

(assert (=> d!10197 (=> res!29133 e!32754)))

(assert (=> d!10197 (= res!29133 (= (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) lt!21077))))

(assert (=> d!10197 (= (arrayContainsKey!0 (_keys!3529 newMap!16) lt!21077 #b00000000000000000000000000000000) e!32754)))

(declare-fun b!50652 () Bool)

(declare-fun e!32755 () Bool)

(assert (=> b!50652 (= e!32754 e!32755)))

(declare-fun res!29134 () Bool)

(assert (=> b!50652 (=> (not res!29134) (not e!32755))))

(assert (=> b!50652 (= res!29134 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1789 (_keys!3529 newMap!16))))))

(declare-fun b!50653 () Bool)

(assert (=> b!50653 (= e!32755 (arrayContainsKey!0 (_keys!3529 newMap!16) lt!21077 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10197 (not res!29133)) b!50652))

(assert (= (and b!50652 res!29134) b!50653))

(assert (=> d!10197 m!43765))

(declare-fun m!43801 () Bool)

(assert (=> b!50653 m!43801))

(assert (=> b!50643 d!10197))

(declare-fun b!50666 () Bool)

(declare-fun e!32762 () SeekEntryResult!223)

(declare-fun lt!21087 () SeekEntryResult!223)

(assert (=> b!50666 (= e!32762 (Found!223 (index!3016 lt!21087)))))

(declare-fun b!50667 () Bool)

(declare-fun e!32764 () SeekEntryResult!223)

(assert (=> b!50667 (= e!32764 e!32762)))

(declare-fun lt!21088 () (_ BitVec 64))

(assert (=> b!50667 (= lt!21088 (select (arr!1564 (_keys!3529 newMap!16)) (index!3016 lt!21087)))))

(declare-fun c!6815 () Bool)

(assert (=> b!50667 (= c!6815 (= lt!21088 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50668 () Bool)

(declare-fun e!32763 () SeekEntryResult!223)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3275 (_ BitVec 32)) SeekEntryResult!223)

(assert (=> b!50668 (= e!32763 (seekKeyOrZeroReturnVacant!0 (x!9254 lt!21087) (index!3016 lt!21087) (index!3016 lt!21087) (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) (_keys!3529 newMap!16) (mask!5711 newMap!16)))))

(declare-fun b!50669 () Bool)

(assert (=> b!50669 (= e!32764 Undefined!223)))

(declare-fun d!10199 () Bool)

(declare-fun lt!21089 () SeekEntryResult!223)

(assert (=> d!10199 (and (or ((_ is Undefined!223) lt!21089) (not ((_ is Found!223) lt!21089)) (and (bvsge (index!3015 lt!21089) #b00000000000000000000000000000000) (bvslt (index!3015 lt!21089) (size!1789 (_keys!3529 newMap!16))))) (or ((_ is Undefined!223) lt!21089) ((_ is Found!223) lt!21089) (not ((_ is MissingZero!223) lt!21089)) (and (bvsge (index!3014 lt!21089) #b00000000000000000000000000000000) (bvslt (index!3014 lt!21089) (size!1789 (_keys!3529 newMap!16))))) (or ((_ is Undefined!223) lt!21089) ((_ is Found!223) lt!21089) ((_ is MissingZero!223) lt!21089) (not ((_ is MissingVacant!223) lt!21089)) (and (bvsge (index!3017 lt!21089) #b00000000000000000000000000000000) (bvslt (index!3017 lt!21089) (size!1789 (_keys!3529 newMap!16))))) (or ((_ is Undefined!223) lt!21089) (ite ((_ is Found!223) lt!21089) (= (select (arr!1564 (_keys!3529 newMap!16)) (index!3015 lt!21089)) (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!223) lt!21089) (= (select (arr!1564 (_keys!3529 newMap!16)) (index!3014 lt!21089)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!223) lt!21089) (= (select (arr!1564 (_keys!3529 newMap!16)) (index!3017 lt!21089)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10199 (= lt!21089 e!32764)))

(declare-fun c!6813 () Bool)

(assert (=> d!10199 (= c!6813 (and ((_ is Intermediate!223) lt!21087) (undefined!1035 lt!21087)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3275 (_ BitVec 32)) SeekEntryResult!223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10199 (= lt!21087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) (mask!5711 newMap!16)) (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) (_keys!3529 newMap!16) (mask!5711 newMap!16)))))

(assert (=> d!10199 (validMask!0 (mask!5711 newMap!16))))

(assert (=> d!10199 (= (seekEntryOrOpen!0 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) (_keys!3529 newMap!16) (mask!5711 newMap!16)) lt!21089)))

(declare-fun b!50670 () Bool)

(declare-fun c!6814 () Bool)

(assert (=> b!50670 (= c!6814 (= lt!21088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!50670 (= e!32762 e!32763)))

(declare-fun b!50671 () Bool)

(assert (=> b!50671 (= e!32763 (MissingZero!223 (index!3016 lt!21087)))))

(assert (= (and d!10199 c!6813) b!50669))

(assert (= (and d!10199 (not c!6813)) b!50667))

(assert (= (and b!50667 c!6815) b!50666))

(assert (= (and b!50667 (not c!6815)) b!50670))

(assert (= (and b!50670 c!6814) b!50671))

(assert (= (and b!50670 (not c!6814)) b!50668))

(declare-fun m!43803 () Bool)

(assert (=> b!50667 m!43803))

(assert (=> b!50668 m!43765))

(declare-fun m!43805 () Bool)

(assert (=> b!50668 m!43805))

(assert (=> d!10199 m!43773))

(declare-fun m!43807 () Bool)

(assert (=> d!10199 m!43807))

(declare-fun m!43809 () Bool)

(assert (=> d!10199 m!43809))

(assert (=> d!10199 m!43765))

(declare-fun m!43811 () Bool)

(assert (=> d!10199 m!43811))

(declare-fun m!43813 () Bool)

(assert (=> d!10199 m!43813))

(assert (=> d!10199 m!43765))

(assert (=> d!10199 m!43809))

(declare-fun m!43815 () Bool)

(assert (=> d!10199 m!43815))

(assert (=> b!50643 d!10199))

(declare-fun b!50673 () Bool)

(declare-fun e!32765 () Bool)

(declare-fun call!3910 () Bool)

(assert (=> b!50673 (= e!32765 call!3910)))

(declare-fun b!50674 () Bool)

(declare-fun e!32766 () Bool)

(assert (=> b!50674 (= e!32766 e!32765)))

(declare-fun c!6816 () Bool)

(assert (=> b!50674 (= c!6816 (validKeyInArray!0 (select (arr!1564 (_keys!3529 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10201 () Bool)

(declare-fun res!29136 () Bool)

(assert (=> d!10201 (=> res!29136 e!32766)))

(assert (=> d!10201 (= res!29136 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1789 (_keys!3529 newMap!16))))))

(assert (=> d!10201 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3529 newMap!16) (mask!5711 newMap!16)) e!32766)))

(declare-fun b!50672 () Bool)

(declare-fun e!32767 () Bool)

(assert (=> b!50672 (= e!32767 call!3910)))

(declare-fun b!50675 () Bool)

(assert (=> b!50675 (= e!32765 e!32767)))

(declare-fun lt!21092 () (_ BitVec 64))

(assert (=> b!50675 (= lt!21092 (select (arr!1564 (_keys!3529 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21090 () Unit!1426)

(assert (=> b!50675 (= lt!21090 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3529 newMap!16) lt!21092 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!50675 (arrayContainsKey!0 (_keys!3529 newMap!16) lt!21092 #b00000000000000000000000000000000)))

(declare-fun lt!21091 () Unit!1426)

(assert (=> b!50675 (= lt!21091 lt!21090)))

(declare-fun res!29135 () Bool)

(assert (=> b!50675 (= res!29135 (= (seekEntryOrOpen!0 (select (arr!1564 (_keys!3529 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3529 newMap!16) (mask!5711 newMap!16)) (Found!223 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!50675 (=> (not res!29135) (not e!32767))))

(declare-fun bm!3907 () Bool)

(assert (=> bm!3907 (= call!3910 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3529 newMap!16) (mask!5711 newMap!16)))))

(assert (= (and d!10201 (not res!29136)) b!50674))

(assert (= (and b!50674 c!6816) b!50675))

(assert (= (and b!50674 (not c!6816)) b!50673))

(assert (= (and b!50675 res!29135) b!50672))

(assert (= (or b!50672 b!50673) bm!3907))

(declare-fun m!43817 () Bool)

(assert (=> b!50674 m!43817))

(assert (=> b!50674 m!43817))

(declare-fun m!43819 () Bool)

(assert (=> b!50674 m!43819))

(assert (=> b!50675 m!43817))

(declare-fun m!43821 () Bool)

(assert (=> b!50675 m!43821))

(declare-fun m!43823 () Bool)

(assert (=> b!50675 m!43823))

(assert (=> b!50675 m!43817))

(declare-fun m!43825 () Bool)

(assert (=> b!50675 m!43825))

(declare-fun m!43827 () Bool)

(assert (=> bm!3907 m!43827))

(assert (=> bm!3906 d!10201))

(declare-fun d!10203 () Bool)

(assert (=> d!10203 (= (validKeyInArray!0 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!50600 d!10203))

(declare-fun d!10205 () Bool)

(assert (=> d!10205 (= (size!1795 newMap!16) (bvadd (_size!255 newMap!16) (bvsdiv (bvadd (extraKeys!1811 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!50614 d!10205))

(declare-fun d!10207 () Bool)

(declare-fun lt!21095 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!57 (List!1326) (InoxSet (_ BitVec 64)))

(assert (=> d!10207 (= lt!21095 (select (content!57 Nil!1323) (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32772 () Bool)

(assert (=> d!10207 (= lt!21095 e!32772)))

(declare-fun res!29141 () Bool)

(assert (=> d!10207 (=> (not res!29141) (not e!32772))))

(assert (=> d!10207 (= res!29141 ((_ is Cons!1322) Nil!1323))))

(assert (=> d!10207 (= (contains!616 Nil!1323 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)) lt!21095)))

(declare-fun b!50680 () Bool)

(declare-fun e!32773 () Bool)

(assert (=> b!50680 (= e!32772 e!32773)))

(declare-fun res!29142 () Bool)

(assert (=> b!50680 (=> res!29142 e!32773)))

(assert (=> b!50680 (= res!29142 (= (h!1902 Nil!1323) (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50681 () Bool)

(assert (=> b!50681 (= e!32773 (contains!616 (t!4359 Nil!1323) (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10207 res!29141) b!50680))

(assert (= (and b!50680 (not res!29142)) b!50681))

(declare-fun m!43829 () Bool)

(assert (=> d!10207 m!43829))

(assert (=> d!10207 m!43765))

(declare-fun m!43831 () Bool)

(assert (=> d!10207 m!43831))

(assert (=> b!50681 m!43765))

(declare-fun m!43833 () Bool)

(assert (=> b!50681 m!43833))

(assert (=> b!50601 d!10207))

(assert (=> b!50615 d!10205))

(assert (=> b!50602 d!10203))

(declare-fun b!50682 () Bool)

(declare-fun e!32775 () (_ BitVec 32))

(declare-fun call!3911 () (_ BitVec 32))

(assert (=> b!50682 (= e!32775 call!3911)))

(declare-fun d!10209 () Bool)

(declare-fun lt!21096 () (_ BitVec 32))

(assert (=> d!10209 (and (bvsge lt!21096 #b00000000000000000000000000000000) (bvsle lt!21096 (bvsub (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!32774 () (_ BitVec 32))

(assert (=> d!10209 (= lt!21096 e!32774)))

(declare-fun c!6817 () Bool)

(assert (=> d!10209 (= c!6817 (bvsge #b00000000000000000000000000000000 (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992))))))))

(assert (=> d!10209 (and (bvsle #b00000000000000000000000000000000 (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992))))))))

(assert (=> d!10209 (= (arrayCountValidKeys!0 (_keys!3529 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000000 (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992))))) lt!21096)))

(declare-fun b!50683 () Bool)

(assert (=> b!50683 (= e!32774 e!32775)))

(declare-fun c!6818 () Bool)

(assert (=> b!50683 (= c!6818 (validKeyInArray!0 (select (arr!1564 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50684 () Bool)

(assert (=> b!50684 (= e!32775 (bvadd #b00000000000000000000000000000001 call!3911))))

(declare-fun bm!3908 () Bool)

(assert (=> bm!3908 (= call!3911 (arrayCountValidKeys!0 (_keys!3529 (v!2165 (underlying!129 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992))))))))

(declare-fun b!50685 () Bool)

(assert (=> b!50685 (= e!32774 #b00000000000000000000000000000000)))

(assert (= (and d!10209 c!6817) b!50685))

(assert (= (and d!10209 (not c!6817)) b!50683))

(assert (= (and b!50683 c!6818) b!50684))

(assert (= (and b!50683 (not c!6818)) b!50682))

(assert (= (or b!50684 b!50682) bm!3908))

(declare-fun m!43835 () Bool)

(assert (=> b!50683 m!43835))

(assert (=> b!50683 m!43835))

(declare-fun m!43837 () Bool)

(assert (=> b!50683 m!43837))

(declare-fun m!43839 () Bool)

(assert (=> bm!3908 m!43839))

(assert (=> b!50617 d!10209))

(declare-fun b!50687 () Bool)

(declare-fun e!32776 () Bool)

(declare-fun call!3912 () Bool)

(assert (=> b!50687 (= e!32776 call!3912)))

(declare-fun b!50688 () Bool)

(declare-fun e!32777 () Bool)

(assert (=> b!50688 (= e!32777 e!32776)))

(declare-fun c!6819 () Bool)

(assert (=> b!50688 (= c!6819 (validKeyInArray!0 (select (arr!1564 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10211 () Bool)

(declare-fun res!29144 () Bool)

(assert (=> d!10211 (=> res!29144 e!32777)))

(assert (=> d!10211 (= res!29144 (bvsge #b00000000000000000000000000000000 (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992))))))))

(assert (=> d!10211 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3529 (v!2165 (underlying!129 thiss!992))) (mask!5711 (v!2165 (underlying!129 thiss!992)))) e!32777)))

(declare-fun b!50686 () Bool)

(declare-fun e!32778 () Bool)

(assert (=> b!50686 (= e!32778 call!3912)))

(declare-fun b!50689 () Bool)

(assert (=> b!50689 (= e!32776 e!32778)))

(declare-fun lt!21099 () (_ BitVec 64))

(assert (=> b!50689 (= lt!21099 (select (arr!1564 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21097 () Unit!1426)

(assert (=> b!50689 (= lt!21097 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3529 (v!2165 (underlying!129 thiss!992))) lt!21099 #b00000000000000000000000000000000))))

(assert (=> b!50689 (arrayContainsKey!0 (_keys!3529 (v!2165 (underlying!129 thiss!992))) lt!21099 #b00000000000000000000000000000000)))

(declare-fun lt!21098 () Unit!1426)

(assert (=> b!50689 (= lt!21098 lt!21097)))

(declare-fun res!29143 () Bool)

(assert (=> b!50689 (= res!29143 (= (seekEntryOrOpen!0 (select (arr!1564 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000) (_keys!3529 (v!2165 (underlying!129 thiss!992))) (mask!5711 (v!2165 (underlying!129 thiss!992)))) (Found!223 #b00000000000000000000000000000000)))))

(assert (=> b!50689 (=> (not res!29143) (not e!32778))))

(declare-fun bm!3909 () Bool)

(assert (=> bm!3909 (= call!3912 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3529 (v!2165 (underlying!129 thiss!992))) (mask!5711 (v!2165 (underlying!129 thiss!992)))))))

(assert (= (and d!10211 (not res!29144)) b!50688))

(assert (= (and b!50688 c!6819) b!50689))

(assert (= (and b!50688 (not c!6819)) b!50687))

(assert (= (and b!50689 res!29143) b!50686))

(assert (= (or b!50686 b!50687) bm!3909))

(assert (=> b!50688 m!43835))

(assert (=> b!50688 m!43835))

(assert (=> b!50688 m!43837))

(assert (=> b!50689 m!43835))

(declare-fun m!43841 () Bool)

(assert (=> b!50689 m!43841))

(declare-fun m!43843 () Bool)

(assert (=> b!50689 m!43843))

(assert (=> b!50689 m!43835))

(declare-fun m!43845 () Bool)

(assert (=> b!50689 m!43845))

(declare-fun m!43847 () Bool)

(assert (=> bm!3909 m!43847))

(assert (=> b!50618 d!10211))

(declare-fun d!10213 () Bool)

(assert (=> d!10213 (= (validMask!0 (mask!5711 newMap!16)) (and (or (= (mask!5711 newMap!16) #b00000000000000000000000000000111) (= (mask!5711 newMap!16) #b00000000000000000000000000001111) (= (mask!5711 newMap!16) #b00000000000000000000000000011111) (= (mask!5711 newMap!16) #b00000000000000000000000000111111) (= (mask!5711 newMap!16) #b00000000000000000000000001111111) (= (mask!5711 newMap!16) #b00000000000000000000000011111111) (= (mask!5711 newMap!16) #b00000000000000000000000111111111) (= (mask!5711 newMap!16) #b00000000000000000000001111111111) (= (mask!5711 newMap!16) #b00000000000000000000011111111111) (= (mask!5711 newMap!16) #b00000000000000000000111111111111) (= (mask!5711 newMap!16) #b00000000000000000001111111111111) (= (mask!5711 newMap!16) #b00000000000000000011111111111111) (= (mask!5711 newMap!16) #b00000000000000000111111111111111) (= (mask!5711 newMap!16) #b00000000000000001111111111111111) (= (mask!5711 newMap!16) #b00000000000000011111111111111111) (= (mask!5711 newMap!16) #b00000000000000111111111111111111) (= (mask!5711 newMap!16) #b00000000000001111111111111111111) (= (mask!5711 newMap!16) #b00000000000011111111111111111111) (= (mask!5711 newMap!16) #b00000000000111111111111111111111) (= (mask!5711 newMap!16) #b00000000001111111111111111111111) (= (mask!5711 newMap!16) #b00000000011111111111111111111111) (= (mask!5711 newMap!16) #b00000000111111111111111111111111) (= (mask!5711 newMap!16) #b00000001111111111111111111111111) (= (mask!5711 newMap!16) #b00000011111111111111111111111111) (= (mask!5711 newMap!16) #b00000111111111111111111111111111) (= (mask!5711 newMap!16) #b00001111111111111111111111111111) (= (mask!5711 newMap!16) #b00011111111111111111111111111111) (= (mask!5711 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5711 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10187 d!10213))

(declare-fun b!50691 () Bool)

(declare-fun e!32780 () Bool)

(assert (=> b!50691 (= e!32780 (contains!616 Nil!1323 (select (arr!1564 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50692 () Bool)

(declare-fun e!32779 () Bool)

(declare-fun e!32781 () Bool)

(assert (=> b!50692 (= e!32779 e!32781)))

(declare-fun res!29147 () Bool)

(assert (=> b!50692 (=> (not res!29147) (not e!32781))))

(assert (=> b!50692 (= res!29147 (not e!32780))))

(declare-fun res!29145 () Bool)

(assert (=> b!50692 (=> (not res!29145) (not e!32780))))

(assert (=> b!50692 (= res!29145 (validKeyInArray!0 (select (arr!1564 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50693 () Bool)

(declare-fun e!32782 () Bool)

(declare-fun call!3913 () Bool)

(assert (=> b!50693 (= e!32782 call!3913)))

(declare-fun d!10215 () Bool)

(declare-fun res!29146 () Bool)

(assert (=> d!10215 (=> res!29146 e!32779)))

(assert (=> d!10215 (= res!29146 (bvsge #b00000000000000000000000000000000 (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992))))))))

(assert (=> d!10215 (= (arrayNoDuplicates!0 (_keys!3529 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000000 Nil!1323) e!32779)))

(declare-fun b!50690 () Bool)

(assert (=> b!50690 (= e!32781 e!32782)))

(declare-fun c!6820 () Bool)

(assert (=> b!50690 (= c!6820 (validKeyInArray!0 (select (arr!1564 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50694 () Bool)

(assert (=> b!50694 (= e!32782 call!3913)))

(declare-fun bm!3910 () Bool)

(assert (=> bm!3910 (= call!3913 (arrayNoDuplicates!0 (_keys!3529 (v!2165 (underlying!129 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6820 (Cons!1322 (select (arr!1564 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) #b00000000000000000000000000000000) Nil!1323) Nil!1323)))))

(assert (= (and d!10215 (not res!29146)) b!50692))

(assert (= (and b!50692 res!29145) b!50691))

(assert (= (and b!50692 res!29147) b!50690))

(assert (= (and b!50690 c!6820) b!50693))

(assert (= (and b!50690 (not c!6820)) b!50694))

(assert (= (or b!50693 b!50694) bm!3910))

(assert (=> b!50691 m!43835))

(assert (=> b!50691 m!43835))

(declare-fun m!43849 () Bool)

(assert (=> b!50691 m!43849))

(assert (=> b!50692 m!43835))

(assert (=> b!50692 m!43835))

(assert (=> b!50692 m!43837))

(assert (=> b!50690 m!43835))

(assert (=> b!50690 m!43835))

(assert (=> b!50690 m!43837))

(assert (=> bm!3910 m!43835))

(declare-fun m!43851 () Bool)

(assert (=> bm!3910 m!43851))

(assert (=> b!50619 d!10215))

(declare-fun b!50696 () Bool)

(declare-fun e!32784 () Bool)

(assert (=> b!50696 (= e!32784 (contains!616 (ite c!6797 (Cons!1322 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) Nil!1323) Nil!1323) (select (arr!1564 (_keys!3529 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50697 () Bool)

(declare-fun e!32783 () Bool)

(declare-fun e!32785 () Bool)

(assert (=> b!50697 (= e!32783 e!32785)))

(declare-fun res!29150 () Bool)

(assert (=> b!50697 (=> (not res!29150) (not e!32785))))

(assert (=> b!50697 (= res!29150 (not e!32784))))

(declare-fun res!29148 () Bool)

(assert (=> b!50697 (=> (not res!29148) (not e!32784))))

(assert (=> b!50697 (= res!29148 (validKeyInArray!0 (select (arr!1564 (_keys!3529 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50698 () Bool)

(declare-fun e!32786 () Bool)

(declare-fun call!3914 () Bool)

(assert (=> b!50698 (= e!32786 call!3914)))

(declare-fun d!10217 () Bool)

(declare-fun res!29149 () Bool)

(assert (=> d!10217 (=> res!29149 e!32783)))

(assert (=> d!10217 (= res!29149 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1789 (_keys!3529 newMap!16))))))

(assert (=> d!10217 (= (arrayNoDuplicates!0 (_keys!3529 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6797 (Cons!1322 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) Nil!1323) Nil!1323)) e!32783)))

(declare-fun b!50695 () Bool)

(assert (=> b!50695 (= e!32785 e!32786)))

(declare-fun c!6821 () Bool)

(assert (=> b!50695 (= c!6821 (validKeyInArray!0 (select (arr!1564 (_keys!3529 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50699 () Bool)

(assert (=> b!50699 (= e!32786 call!3914)))

(declare-fun bm!3911 () Bool)

(assert (=> bm!3911 (= call!3914 (arrayNoDuplicates!0 (_keys!3529 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6821 (Cons!1322 (select (arr!1564 (_keys!3529 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6797 (Cons!1322 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) Nil!1323) Nil!1323)) (ite c!6797 (Cons!1322 (select (arr!1564 (_keys!3529 newMap!16)) #b00000000000000000000000000000000) Nil!1323) Nil!1323))))))

(assert (= (and d!10217 (not res!29149)) b!50697))

(assert (= (and b!50697 res!29148) b!50696))

(assert (= (and b!50697 res!29150) b!50695))

(assert (= (and b!50695 c!6821) b!50698))

(assert (= (and b!50695 (not c!6821)) b!50699))

(assert (= (or b!50698 b!50699) bm!3911))

(assert (=> b!50696 m!43817))

(assert (=> b!50696 m!43817))

(declare-fun m!43853 () Bool)

(assert (=> b!50696 m!43853))

(assert (=> b!50697 m!43817))

(assert (=> b!50697 m!43817))

(assert (=> b!50697 m!43819))

(assert (=> b!50695 m!43817))

(assert (=> b!50695 m!43817))

(assert (=> b!50695 m!43819))

(assert (=> bm!3911 m!43817))

(declare-fun m!43855 () Bool)

(assert (=> bm!3911 m!43855))

(assert (=> bm!3900 d!10217))

(assert (=> b!50629 d!10203))

(declare-fun d!10219 () Bool)

(declare-fun res!29151 () Bool)

(declare-fun e!32787 () Bool)

(assert (=> d!10219 (=> (not res!29151) (not e!32787))))

(assert (=> d!10219 (= res!29151 (validMask!0 (mask!5711 (v!2165 (underlying!129 thiss!992)))))))

(assert (=> d!10219 (= (simpleValid!35 (v!2165 (underlying!129 thiss!992))) e!32787)))

(declare-fun b!50702 () Bool)

(declare-fun res!29153 () Bool)

(assert (=> b!50702 (=> (not res!29153) (not e!32787))))

(assert (=> b!50702 (= res!29153 (= (size!1795 (v!2165 (underlying!129 thiss!992))) (bvadd (_size!255 (v!2165 (underlying!129 thiss!992))) (bvsdiv (bvadd (extraKeys!1811 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!50701 () Bool)

(declare-fun res!29154 () Bool)

(assert (=> b!50701 (=> (not res!29154) (not e!32787))))

(assert (=> b!50701 (= res!29154 (bvsge (size!1795 (v!2165 (underlying!129 thiss!992))) (_size!255 (v!2165 (underlying!129 thiss!992)))))))

(declare-fun b!50700 () Bool)

(declare-fun res!29152 () Bool)

(assert (=> b!50700 (=> (not res!29152) (not e!32787))))

(assert (=> b!50700 (= res!29152 (and (= (size!1790 (_values!1903 (v!2165 (underlying!129 thiss!992)))) (bvadd (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000001)) (= (size!1789 (_keys!3529 (v!2165 (underlying!129 thiss!992)))) (size!1790 (_values!1903 (v!2165 (underlying!129 thiss!992))))) (bvsge (_size!255 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!255 (v!2165 (underlying!129 thiss!992))) (bvadd (mask!5711 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!50703 () Bool)

(assert (=> b!50703 (= e!32787 (and (bvsge (extraKeys!1811 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1811 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!255 (v!2165 (underlying!129 thiss!992))) #b00000000000000000000000000000000)))))

(assert (= (and d!10219 res!29151) b!50700))

(assert (= (and b!50700 res!29152) b!50701))

(assert (= (and b!50701 res!29154) b!50702))

(assert (= (and b!50702 res!29153) b!50703))

(assert (=> d!10219 m!43707))

(declare-fun m!43857 () Bool)

(assert (=> b!50702 m!43857))

(assert (=> b!50701 m!43857))

(assert (=> d!10189 d!10219))

(assert (=> b!50642 d!10203))

(declare-fun b!50704 () Bool)

(declare-fun e!32789 () (_ BitVec 32))

(declare-fun call!3915 () (_ BitVec 32))

(assert (=> b!50704 (= e!32789 call!3915)))

(declare-fun d!10221 () Bool)

(declare-fun lt!21100 () (_ BitVec 32))

(assert (=> d!10221 (and (bvsge lt!21100 #b00000000000000000000000000000000) (bvsle lt!21100 (bvsub (size!1789 (_keys!3529 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!32788 () (_ BitVec 32))

(assert (=> d!10221 (= lt!21100 e!32788)))

(declare-fun c!6822 () Bool)

(assert (=> d!10221 (= c!6822 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1789 (_keys!3529 newMap!16))))))

(assert (=> d!10221 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1789 (_keys!3529 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1789 (_keys!3529 newMap!16)) (size!1789 (_keys!3529 newMap!16))))))

(assert (=> d!10221 (= (arrayCountValidKeys!0 (_keys!3529 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1789 (_keys!3529 newMap!16))) lt!21100)))

(declare-fun b!50705 () Bool)

(assert (=> b!50705 (= e!32788 e!32789)))

(declare-fun c!6823 () Bool)

(assert (=> b!50705 (= c!6823 (validKeyInArray!0 (select (arr!1564 (_keys!3529 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50706 () Bool)

(assert (=> b!50706 (= e!32789 (bvadd #b00000000000000000000000000000001 call!3915))))

(declare-fun bm!3912 () Bool)

(assert (=> bm!3912 (= call!3915 (arrayCountValidKeys!0 (_keys!3529 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1789 (_keys!3529 newMap!16))))))

(declare-fun b!50707 () Bool)

(assert (=> b!50707 (= e!32788 #b00000000000000000000000000000000)))

(assert (= (and d!10221 c!6822) b!50707))

(assert (= (and d!10221 (not c!6822)) b!50705))

(assert (= (and b!50705 c!6823) b!50706))

(assert (= (and b!50705 (not c!6823)) b!50704))

(assert (= (or b!50706 b!50704) bm!3912))

(assert (=> b!50705 m!43817))

(assert (=> b!50705 m!43817))

(assert (=> b!50705 m!43819))

(declare-fun m!43859 () Bool)

(assert (=> bm!3912 m!43859))

(assert (=> bm!3903 d!10221))

(declare-fun condMapEmpty!2227 () Bool)

(declare-fun mapDefault!2227 () ValueCell!752)

(assert (=> mapNonEmpty!2225 (= condMapEmpty!2227 (= mapRest!2225 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2227)))))

(declare-fun e!32791 () Bool)

(declare-fun mapRes!2227 () Bool)

(assert (=> mapNonEmpty!2225 (= tp!6743 (and e!32791 mapRes!2227))))

(declare-fun b!50709 () Bool)

(assert (=> b!50709 (= e!32791 tp_is_empty!2191)))

(declare-fun b!50708 () Bool)

(declare-fun e!32790 () Bool)

(assert (=> b!50708 (= e!32790 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2227 () Bool)

(assert (=> mapIsEmpty!2227 mapRes!2227))

(declare-fun mapNonEmpty!2227 () Bool)

(declare-fun tp!6745 () Bool)

(assert (=> mapNonEmpty!2227 (= mapRes!2227 (and tp!6745 e!32790))))

(declare-fun mapValue!2227 () ValueCell!752)

(declare-fun mapKey!2227 () (_ BitVec 32))

(declare-fun mapRest!2227 () (Array (_ BitVec 32) ValueCell!752))

(assert (=> mapNonEmpty!2227 (= mapRest!2225 (store mapRest!2227 mapKey!2227 mapValue!2227))))

(assert (= (and mapNonEmpty!2225 condMapEmpty!2227) mapIsEmpty!2227))

(assert (= (and mapNonEmpty!2225 (not condMapEmpty!2227)) mapNonEmpty!2227))

(assert (= (and mapNonEmpty!2227 ((_ is ValueCellFull!752) mapValue!2227)) b!50708))

(assert (= (and mapNonEmpty!2225 ((_ is ValueCellFull!752) mapDefault!2227)) b!50709))

(declare-fun m!43861 () Bool)

(assert (=> mapNonEmpty!2227 m!43861))

(declare-fun condMapEmpty!2228 () Bool)

(declare-fun mapDefault!2228 () ValueCell!752)

(assert (=> mapNonEmpty!2226 (= condMapEmpty!2228 (= mapRest!2226 ((as const (Array (_ BitVec 32) ValueCell!752)) mapDefault!2228)))))

(declare-fun e!32793 () Bool)

(declare-fun mapRes!2228 () Bool)

(assert (=> mapNonEmpty!2226 (= tp!6744 (and e!32793 mapRes!2228))))

(declare-fun b!50711 () Bool)

(assert (=> b!50711 (= e!32793 tp_is_empty!2191)))

(declare-fun b!50710 () Bool)

(declare-fun e!32792 () Bool)

(assert (=> b!50710 (= e!32792 tp_is_empty!2191)))

(declare-fun mapIsEmpty!2228 () Bool)

(assert (=> mapIsEmpty!2228 mapRes!2228))

(declare-fun mapNonEmpty!2228 () Bool)

(declare-fun tp!6746 () Bool)

(assert (=> mapNonEmpty!2228 (= mapRes!2228 (and tp!6746 e!32792))))

(declare-fun mapRest!2228 () (Array (_ BitVec 32) ValueCell!752))

(declare-fun mapKey!2228 () (_ BitVec 32))

(declare-fun mapValue!2228 () ValueCell!752)

(assert (=> mapNonEmpty!2228 (= mapRest!2226 (store mapRest!2228 mapKey!2228 mapValue!2228))))

(assert (= (and mapNonEmpty!2226 condMapEmpty!2228) mapIsEmpty!2228))

(assert (= (and mapNonEmpty!2226 (not condMapEmpty!2228)) mapNonEmpty!2228))

(assert (= (and mapNonEmpty!2228 ((_ is ValueCellFull!752) mapValue!2228)) b!50710))

(assert (= (and mapNonEmpty!2226 ((_ is ValueCellFull!752) mapDefault!2228)) b!50711))

(declare-fun m!43863 () Bool)

(assert (=> mapNonEmpty!2228 m!43863))

(check-sat (not d!10199) (not b!50695) (not d!10219) (not bm!3912) (not b!50692) (not b!50701) (not bm!3911) tp_is_empty!2191 (not b!50689) (not bm!3907) (not b!50675) (not b!50674) b_and!2763 (not b!50696) (not b!50688) (not b!50705) (not b!50668) (not bm!3910) (not b!50697) (not b!50681) (not d!10207) (not b_next!1551) (not d!10195) (not mapNonEmpty!2228) (not bm!3909) (not b!50691) (not mapNonEmpty!2227) (not b_next!1549) (not b!50690) (not b!50683) (not b!50702) (not bm!3908) b_and!2761 (not b!50653))
(check-sat b_and!2761 b_and!2763 (not b_next!1549) (not b_next!1551))
