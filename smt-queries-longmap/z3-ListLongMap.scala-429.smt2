; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8014 () Bool)

(assert start!8014)

(declare-fun b!50301 () Bool)

(declare-fun b_free!1541 () Bool)

(declare-fun b_next!1541 () Bool)

(assert (=> b!50301 (= b_free!1541 (not b_next!1541))))

(declare-fun tp!6679 () Bool)

(declare-fun b_and!2751 () Bool)

(assert (=> b!50301 (= tp!6679 b_and!2751)))

(declare-fun b!50307 () Bool)

(declare-fun b_free!1543 () Bool)

(declare-fun b_next!1543 () Bool)

(assert (=> b!50307 (= b_free!1543 (not b_next!1543))))

(declare-fun tp!6681 () Bool)

(declare-fun b_and!2753 () Bool)

(assert (=> b!50307 (= tp!6681 b_and!2753)))

(declare-datatypes ((V!2563 0))(
  ( (V!2564 (val!1138 Int)) )
))
(declare-datatypes ((array!3285 0))(
  ( (array!3286 (arr!1571 (Array (_ BitVec 32) (_ BitVec 64))) (size!1794 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!750 0))(
  ( (ValueCellFull!750 (v!2162 V!2563)) (EmptyCell!750) )
))
(declare-datatypes ((array!3287 0))(
  ( (array!3288 (arr!1572 (Array (_ BitVec 32) ValueCell!750)) (size!1795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!408 0))(
  ( (LongMapFixedSize!409 (defaultEntry!1918 Int) (mask!5705 (_ BitVec 32)) (extraKeys!1809 (_ BitVec 32)) (zeroValue!1836 V!2563) (minValue!1836 V!2563) (_size!253 (_ BitVec 32)) (_keys!3526 array!3285) (_values!1901 array!3287) (_vacant!253 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!234 0))(
  ( (Cell!235 (v!2163 LongMapFixedSize!408)) )
))
(declare-datatypes ((LongMap!234 0))(
  ( (LongMap!235 (underlying!128 Cell!234)) )
))
(declare-fun thiss!992 () LongMap!234)

(declare-fun e!32495 () Bool)

(declare-fun e!32490 () Bool)

(declare-fun tp_is_empty!2187 () Bool)

(declare-fun array_inv!963 (array!3285) Bool)

(declare-fun array_inv!964 (array!3287) Bool)

(assert (=> b!50301 (= e!32495 (and tp!6679 tp_is_empty!2187 (array_inv!963 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) (array_inv!964 (_values!1901 (v!2163 (underlying!128 thiss!992)))) e!32490))))

(declare-fun b!50302 () Bool)

(declare-fun e!32498 () Bool)

(declare-fun mapRes!2188 () Bool)

(assert (=> b!50302 (= e!32490 (and e!32498 mapRes!2188))))

(declare-fun condMapEmpty!2187 () Bool)

(declare-fun mapDefault!2188 () ValueCell!750)

(assert (=> b!50302 (= condMapEmpty!2187 (= (arr!1572 (_values!1901 (v!2163 (underlying!128 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!750)) mapDefault!2188)))))

(declare-fun mapIsEmpty!2187 () Bool)

(assert (=> mapIsEmpty!2187 mapRes!2188))

(declare-fun b!50303 () Bool)

(declare-fun e!32496 () Bool)

(declare-fun e!32491 () Bool)

(assert (=> b!50303 (= e!32496 e!32491)))

(declare-fun b!50304 () Bool)

(declare-fun res!28984 () Bool)

(declare-fun e!32492 () Bool)

(assert (=> b!50304 (=> (not res!28984) (not e!32492))))

(declare-fun newMap!16 () LongMapFixedSize!408)

(assert (=> b!50304 (= res!28984 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5705 newMap!16)) (_size!253 (v!2163 (underlying!128 thiss!992)))))))

(declare-fun b!50305 () Bool)

(assert (=> b!50305 (= e!32491 e!32495)))

(declare-fun res!28980 () Bool)

(assert (=> start!8014 (=> (not res!28980) (not e!32492))))

(declare-fun valid!135 (LongMap!234) Bool)

(assert (=> start!8014 (= res!28980 (valid!135 thiss!992))))

(assert (=> start!8014 e!32492))

(assert (=> start!8014 e!32496))

(assert (=> start!8014 true))

(declare-fun e!32494 () Bool)

(assert (=> start!8014 e!32494))

(declare-fun mapNonEmpty!2187 () Bool)

(declare-fun mapRes!2187 () Bool)

(declare-fun tp!6680 () Bool)

(declare-fun e!32499 () Bool)

(assert (=> mapNonEmpty!2187 (= mapRes!2187 (and tp!6680 e!32499))))

(declare-fun mapKey!2187 () (_ BitVec 32))

(declare-fun mapValue!2187 () ValueCell!750)

(declare-fun mapRest!2188 () (Array (_ BitVec 32) ValueCell!750))

(assert (=> mapNonEmpty!2187 (= (arr!1572 (_values!1901 newMap!16)) (store mapRest!2188 mapKey!2187 mapValue!2187))))

(declare-fun b!50306 () Bool)

(assert (=> b!50306 (= e!32492 (not (= (size!1795 (_values!1901 (v!2163 (underlying!128 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5705 (v!2163 (underlying!128 thiss!992)))))))))

(declare-fun e!32500 () Bool)

(assert (=> b!50307 (= e!32494 (and tp!6681 tp_is_empty!2187 (array_inv!963 (_keys!3526 newMap!16)) (array_inv!964 (_values!1901 newMap!16)) e!32500))))

(declare-fun mapIsEmpty!2188 () Bool)

(assert (=> mapIsEmpty!2188 mapRes!2187))

(declare-fun b!50308 () Bool)

(declare-fun res!28983 () Bool)

(assert (=> b!50308 (=> (not res!28983) (not e!32492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50308 (= res!28983 (validMask!0 (mask!5705 (v!2163 (underlying!128 thiss!992)))))))

(declare-fun b!50309 () Bool)

(declare-fun res!28981 () Bool)

(assert (=> b!50309 (=> (not res!28981) (not e!32492))))

(declare-fun valid!136 (LongMapFixedSize!408) Bool)

(assert (=> b!50309 (= res!28981 (valid!136 newMap!16))))

(declare-fun b!50310 () Bool)

(declare-fun e!32489 () Bool)

(assert (=> b!50310 (= e!32500 (and e!32489 mapRes!2187))))

(declare-fun condMapEmpty!2188 () Bool)

(declare-fun mapDefault!2187 () ValueCell!750)

(assert (=> b!50310 (= condMapEmpty!2188 (= (arr!1572 (_values!1901 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!750)) mapDefault!2187)))))

(declare-fun b!50311 () Bool)

(assert (=> b!50311 (= e!32489 tp_is_empty!2187)))

(declare-fun b!50312 () Bool)

(declare-fun res!28982 () Bool)

(assert (=> b!50312 (=> (not res!28982) (not e!32492))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50312 (= res!28982 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992)))))))))

(declare-fun b!50313 () Bool)

(assert (=> b!50313 (= e!32499 tp_is_empty!2187)))

(declare-fun b!50314 () Bool)

(assert (=> b!50314 (= e!32498 tp_is_empty!2187)))

(declare-fun mapNonEmpty!2188 () Bool)

(declare-fun tp!6682 () Bool)

(declare-fun e!32497 () Bool)

(assert (=> mapNonEmpty!2188 (= mapRes!2188 (and tp!6682 e!32497))))

(declare-fun mapRest!2187 () (Array (_ BitVec 32) ValueCell!750))

(declare-fun mapValue!2188 () ValueCell!750)

(declare-fun mapKey!2188 () (_ BitVec 32))

(assert (=> mapNonEmpty!2188 (= (arr!1572 (_values!1901 (v!2163 (underlying!128 thiss!992)))) (store mapRest!2187 mapKey!2188 mapValue!2188))))

(declare-fun b!50315 () Bool)

(assert (=> b!50315 (= e!32497 tp_is_empty!2187)))

(assert (= (and start!8014 res!28980) b!50312))

(assert (= (and b!50312 res!28982) b!50309))

(assert (= (and b!50309 res!28981) b!50304))

(assert (= (and b!50304 res!28984) b!50308))

(assert (= (and b!50308 res!28983) b!50306))

(assert (= (and b!50302 condMapEmpty!2187) mapIsEmpty!2187))

(assert (= (and b!50302 (not condMapEmpty!2187)) mapNonEmpty!2188))

(get-info :version)

(assert (= (and mapNonEmpty!2188 ((_ is ValueCellFull!750) mapValue!2188)) b!50315))

(assert (= (and b!50302 ((_ is ValueCellFull!750) mapDefault!2188)) b!50314))

(assert (= b!50301 b!50302))

(assert (= b!50305 b!50301))

(assert (= b!50303 b!50305))

(assert (= start!8014 b!50303))

(assert (= (and b!50310 condMapEmpty!2188) mapIsEmpty!2188))

(assert (= (and b!50310 (not condMapEmpty!2188)) mapNonEmpty!2187))

(assert (= (and mapNonEmpty!2187 ((_ is ValueCellFull!750) mapValue!2187)) b!50313))

(assert (= (and b!50310 ((_ is ValueCellFull!750) mapDefault!2187)) b!50311))

(assert (= b!50307 b!50310))

(assert (= start!8014 b!50307))

(declare-fun m!43629 () Bool)

(assert (=> b!50309 m!43629))

(declare-fun m!43631 () Bool)

(assert (=> mapNonEmpty!2187 m!43631))

(declare-fun m!43633 () Bool)

(assert (=> b!50301 m!43633))

(declare-fun m!43635 () Bool)

(assert (=> b!50301 m!43635))

(declare-fun m!43637 () Bool)

(assert (=> mapNonEmpty!2188 m!43637))

(declare-fun m!43639 () Bool)

(assert (=> b!50307 m!43639))

(declare-fun m!43641 () Bool)

(assert (=> b!50307 m!43641))

(declare-fun m!43643 () Bool)

(assert (=> b!50308 m!43643))

(declare-fun m!43645 () Bool)

(assert (=> start!8014 m!43645))

(check-sat (not b!50301) (not b!50307) b_and!2753 (not b!50308) (not b_next!1541) (not b!50309) (not mapNonEmpty!2187) b_and!2751 tp_is_empty!2187 (not b_next!1543) (not mapNonEmpty!2188) (not start!8014))
(check-sat b_and!2751 b_and!2753 (not b_next!1541) (not b_next!1543))
(get-model)

(declare-fun d!10141 () Bool)

(assert (=> d!10141 (= (array_inv!963 (_keys!3526 newMap!16)) (bvsge (size!1794 (_keys!3526 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50307 d!10141))

(declare-fun d!10143 () Bool)

(assert (=> d!10143 (= (array_inv!964 (_values!1901 newMap!16)) (bvsge (size!1795 (_values!1901 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50307 d!10143))

(declare-fun d!10145 () Bool)

(assert (=> d!10145 (= (validMask!0 (mask!5705 (v!2163 (underlying!128 thiss!992)))) (and (or (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000001111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000011111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000001111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000011111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000001111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000011111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000001111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000011111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000001111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000011111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000001111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000011111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000111111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000001111111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000011111111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000111111111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000001111111111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000011111111111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000111111111111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00001111111111111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00011111111111111111111111111111) (= (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50308 d!10145))

(declare-fun d!10147 () Bool)

(declare-fun res!29006 () Bool)

(declare-fun e!32542 () Bool)

(assert (=> d!10147 (=> (not res!29006) (not e!32542))))

(declare-fun simpleValid!34 (LongMapFixedSize!408) Bool)

(assert (=> d!10147 (= res!29006 (simpleValid!34 newMap!16))))

(assert (=> d!10147 (= (valid!136 newMap!16) e!32542)))

(declare-fun b!50367 () Bool)

(declare-fun res!29007 () Bool)

(assert (=> b!50367 (=> (not res!29007) (not e!32542))))

(declare-fun arrayCountValidKeys!0 (array!3285 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50367 (= res!29007 (= (arrayCountValidKeys!0 (_keys!3526 newMap!16) #b00000000000000000000000000000000 (size!1794 (_keys!3526 newMap!16))) (_size!253 newMap!16)))))

(declare-fun b!50368 () Bool)

(declare-fun res!29008 () Bool)

(assert (=> b!50368 (=> (not res!29008) (not e!32542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3285 (_ BitVec 32)) Bool)

(assert (=> b!50368 (= res!29008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3526 newMap!16) (mask!5705 newMap!16)))))

(declare-fun b!50369 () Bool)

(declare-datatypes ((List!1329 0))(
  ( (Nil!1326) (Cons!1325 (h!1905 (_ BitVec 64)) (t!4363 List!1329)) )
))
(declare-fun arrayNoDuplicates!0 (array!3285 (_ BitVec 32) List!1329) Bool)

(assert (=> b!50369 (= e!32542 (arrayNoDuplicates!0 (_keys!3526 newMap!16) #b00000000000000000000000000000000 Nil!1326))))

(assert (= (and d!10147 res!29006) b!50367))

(assert (= (and b!50367 res!29007) b!50368))

(assert (= (and b!50368 res!29008) b!50369))

(declare-fun m!43665 () Bool)

(assert (=> d!10147 m!43665))

(declare-fun m!43667 () Bool)

(assert (=> b!50367 m!43667))

(declare-fun m!43669 () Bool)

(assert (=> b!50368 m!43669))

(declare-fun m!43671 () Bool)

(assert (=> b!50369 m!43671))

(assert (=> b!50309 d!10147))

(declare-fun d!10149 () Bool)

(assert (=> d!10149 (= (array_inv!963 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) (bvsge (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50301 d!10149))

(declare-fun d!10151 () Bool)

(assert (=> d!10151 (= (array_inv!964 (_values!1901 (v!2163 (underlying!128 thiss!992)))) (bvsge (size!1795 (_values!1901 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50301 d!10151))

(declare-fun d!10153 () Bool)

(assert (=> d!10153 (= (valid!135 thiss!992) (valid!136 (v!2163 (underlying!128 thiss!992))))))

(declare-fun bs!2358 () Bool)

(assert (= bs!2358 d!10153))

(declare-fun m!43673 () Bool)

(assert (=> bs!2358 m!43673))

(assert (=> start!8014 d!10153))

(declare-fun b!50376 () Bool)

(declare-fun e!32548 () Bool)

(assert (=> b!50376 (= e!32548 tp_is_empty!2187)))

(declare-fun condMapEmpty!2197 () Bool)

(declare-fun mapDefault!2197 () ValueCell!750)

(assert (=> mapNonEmpty!2188 (= condMapEmpty!2197 (= mapRest!2187 ((as const (Array (_ BitVec 32) ValueCell!750)) mapDefault!2197)))))

(declare-fun e!32547 () Bool)

(declare-fun mapRes!2197 () Bool)

(assert (=> mapNonEmpty!2188 (= tp!6682 (and e!32547 mapRes!2197))))

(declare-fun b!50377 () Bool)

(assert (=> b!50377 (= e!32547 tp_is_empty!2187)))

(declare-fun mapIsEmpty!2197 () Bool)

(assert (=> mapIsEmpty!2197 mapRes!2197))

(declare-fun mapNonEmpty!2197 () Bool)

(declare-fun tp!6697 () Bool)

(assert (=> mapNonEmpty!2197 (= mapRes!2197 (and tp!6697 e!32548))))

(declare-fun mapRest!2197 () (Array (_ BitVec 32) ValueCell!750))

(declare-fun mapValue!2197 () ValueCell!750)

(declare-fun mapKey!2197 () (_ BitVec 32))

(assert (=> mapNonEmpty!2197 (= mapRest!2187 (store mapRest!2197 mapKey!2197 mapValue!2197))))

(assert (= (and mapNonEmpty!2188 condMapEmpty!2197) mapIsEmpty!2197))

(assert (= (and mapNonEmpty!2188 (not condMapEmpty!2197)) mapNonEmpty!2197))

(assert (= (and mapNonEmpty!2197 ((_ is ValueCellFull!750) mapValue!2197)) b!50376))

(assert (= (and mapNonEmpty!2188 ((_ is ValueCellFull!750) mapDefault!2197)) b!50377))

(declare-fun m!43675 () Bool)

(assert (=> mapNonEmpty!2197 m!43675))

(declare-fun b!50378 () Bool)

(declare-fun e!32550 () Bool)

(assert (=> b!50378 (= e!32550 tp_is_empty!2187)))

(declare-fun condMapEmpty!2198 () Bool)

(declare-fun mapDefault!2198 () ValueCell!750)

(assert (=> mapNonEmpty!2187 (= condMapEmpty!2198 (= mapRest!2188 ((as const (Array (_ BitVec 32) ValueCell!750)) mapDefault!2198)))))

(declare-fun e!32549 () Bool)

(declare-fun mapRes!2198 () Bool)

(assert (=> mapNonEmpty!2187 (= tp!6680 (and e!32549 mapRes!2198))))

(declare-fun b!50379 () Bool)

(assert (=> b!50379 (= e!32549 tp_is_empty!2187)))

(declare-fun mapIsEmpty!2198 () Bool)

(assert (=> mapIsEmpty!2198 mapRes!2198))

(declare-fun mapNonEmpty!2198 () Bool)

(declare-fun tp!6698 () Bool)

(assert (=> mapNonEmpty!2198 (= mapRes!2198 (and tp!6698 e!32550))))

(declare-fun mapKey!2198 () (_ BitVec 32))

(declare-fun mapRest!2198 () (Array (_ BitVec 32) ValueCell!750))

(declare-fun mapValue!2198 () ValueCell!750)

(assert (=> mapNonEmpty!2198 (= mapRest!2188 (store mapRest!2198 mapKey!2198 mapValue!2198))))

(assert (= (and mapNonEmpty!2187 condMapEmpty!2198) mapIsEmpty!2198))

(assert (= (and mapNonEmpty!2187 (not condMapEmpty!2198)) mapNonEmpty!2198))

(assert (= (and mapNonEmpty!2198 ((_ is ValueCellFull!750) mapValue!2198)) b!50378))

(assert (= (and mapNonEmpty!2187 ((_ is ValueCellFull!750) mapDefault!2198)) b!50379))

(declare-fun m!43677 () Bool)

(assert (=> mapNonEmpty!2198 m!43677))

(check-sat (not d!10147) (not b!50368) b_and!2753 (not mapNonEmpty!2198) (not b_next!1541) (not b!50367) (not mapNonEmpty!2197) b_and!2751 (not d!10153) (not b_next!1543) (not b!50369) tp_is_empty!2187)
(check-sat b_and!2751 b_and!2753 (not b_next!1541) (not b_next!1543))
(get-model)

(declare-fun b!50390 () Bool)

(declare-fun e!32560 () Bool)

(declare-fun contains!619 (List!1329 (_ BitVec 64)) Bool)

(assert (=> b!50390 (= e!32560 (contains!619 Nil!1326 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3886 () Bool)

(declare-fun call!3889 () Bool)

(declare-fun c!6791 () Bool)

(assert (=> bm!3886 (= call!3889 (arrayNoDuplicates!0 (_keys!3526 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6791 (Cons!1325 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) Nil!1326) Nil!1326)))))

(declare-fun b!50391 () Bool)

(declare-fun e!32559 () Bool)

(assert (=> b!50391 (= e!32559 call!3889)))

(declare-fun b!50392 () Bool)

(assert (=> b!50392 (= e!32559 call!3889)))

(declare-fun d!10155 () Bool)

(declare-fun res!29015 () Bool)

(declare-fun e!32561 () Bool)

(assert (=> d!10155 (=> res!29015 e!32561)))

(assert (=> d!10155 (= res!29015 (bvsge #b00000000000000000000000000000000 (size!1794 (_keys!3526 newMap!16))))))

(assert (=> d!10155 (= (arrayNoDuplicates!0 (_keys!3526 newMap!16) #b00000000000000000000000000000000 Nil!1326) e!32561)))

(declare-fun b!50393 () Bool)

(declare-fun e!32562 () Bool)

(assert (=> b!50393 (= e!32561 e!32562)))

(declare-fun res!29016 () Bool)

(assert (=> b!50393 (=> (not res!29016) (not e!32562))))

(assert (=> b!50393 (= res!29016 (not e!32560))))

(declare-fun res!29017 () Bool)

(assert (=> b!50393 (=> (not res!29017) (not e!32560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!50393 (= res!29017 (validKeyInArray!0 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50394 () Bool)

(assert (=> b!50394 (= e!32562 e!32559)))

(assert (=> b!50394 (= c!6791 (validKeyInArray!0 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10155 (not res!29015)) b!50393))

(assert (= (and b!50393 res!29017) b!50390))

(assert (= (and b!50393 res!29016) b!50394))

(assert (= (and b!50394 c!6791) b!50391))

(assert (= (and b!50394 (not c!6791)) b!50392))

(assert (= (or b!50391 b!50392) bm!3886))

(declare-fun m!43679 () Bool)

(assert (=> b!50390 m!43679))

(assert (=> b!50390 m!43679))

(declare-fun m!43681 () Bool)

(assert (=> b!50390 m!43681))

(assert (=> bm!3886 m!43679))

(declare-fun m!43683 () Bool)

(assert (=> bm!3886 m!43683))

(assert (=> b!50393 m!43679))

(assert (=> b!50393 m!43679))

(declare-fun m!43685 () Bool)

(assert (=> b!50393 m!43685))

(assert (=> b!50394 m!43679))

(assert (=> b!50394 m!43679))

(assert (=> b!50394 m!43685))

(assert (=> b!50369 d!10155))

(declare-fun b!50405 () Bool)

(declare-fun res!29029 () Bool)

(declare-fun e!32565 () Bool)

(assert (=> b!50405 (=> (not res!29029) (not e!32565))))

(declare-fun size!1798 (LongMapFixedSize!408) (_ BitVec 32))

(assert (=> b!50405 (= res!29029 (= (size!1798 newMap!16) (bvadd (_size!253 newMap!16) (bvsdiv (bvadd (extraKeys!1809 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!10157 () Bool)

(declare-fun res!29027 () Bool)

(assert (=> d!10157 (=> (not res!29027) (not e!32565))))

(assert (=> d!10157 (= res!29027 (validMask!0 (mask!5705 newMap!16)))))

(assert (=> d!10157 (= (simpleValid!34 newMap!16) e!32565)))

(declare-fun b!50404 () Bool)

(declare-fun res!29026 () Bool)

(assert (=> b!50404 (=> (not res!29026) (not e!32565))))

(assert (=> b!50404 (= res!29026 (bvsge (size!1798 newMap!16) (_size!253 newMap!16)))))

(declare-fun b!50403 () Bool)

(declare-fun res!29028 () Bool)

(assert (=> b!50403 (=> (not res!29028) (not e!32565))))

(assert (=> b!50403 (= res!29028 (and (= (size!1795 (_values!1901 newMap!16)) (bvadd (mask!5705 newMap!16) #b00000000000000000000000000000001)) (= (size!1794 (_keys!3526 newMap!16)) (size!1795 (_values!1901 newMap!16))) (bvsge (_size!253 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!253 newMap!16) (bvadd (mask!5705 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!50406 () Bool)

(assert (=> b!50406 (= e!32565 (and (bvsge (extraKeys!1809 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1809 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!253 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!10157 res!29027) b!50403))

(assert (= (and b!50403 res!29028) b!50404))

(assert (= (and b!50404 res!29026) b!50405))

(assert (= (and b!50405 res!29029) b!50406))

(declare-fun m!43687 () Bool)

(assert (=> b!50405 m!43687))

(declare-fun m!43689 () Bool)

(assert (=> d!10157 m!43689))

(assert (=> b!50404 m!43687))

(assert (=> d!10147 d!10157))

(declare-fun d!10159 () Bool)

(declare-fun res!29030 () Bool)

(declare-fun e!32566 () Bool)

(assert (=> d!10159 (=> (not res!29030) (not e!32566))))

(assert (=> d!10159 (= res!29030 (simpleValid!34 (v!2163 (underlying!128 thiss!992))))))

(assert (=> d!10159 (= (valid!136 (v!2163 (underlying!128 thiss!992))) e!32566)))

(declare-fun b!50407 () Bool)

(declare-fun res!29031 () Bool)

(assert (=> b!50407 (=> (not res!29031) (not e!32566))))

(assert (=> b!50407 (= res!29031 (= (arrayCountValidKeys!0 (_keys!3526 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000000 (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992))))) (_size!253 (v!2163 (underlying!128 thiss!992)))))))

(declare-fun b!50408 () Bool)

(declare-fun res!29032 () Bool)

(assert (=> b!50408 (=> (not res!29032) (not e!32566))))

(assert (=> b!50408 (= res!29032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3526 (v!2163 (underlying!128 thiss!992))) (mask!5705 (v!2163 (underlying!128 thiss!992)))))))

(declare-fun b!50409 () Bool)

(assert (=> b!50409 (= e!32566 (arrayNoDuplicates!0 (_keys!3526 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000000 Nil!1326))))

(assert (= (and d!10159 res!29030) b!50407))

(assert (= (and b!50407 res!29031) b!50408))

(assert (= (and b!50408 res!29032) b!50409))

(declare-fun m!43691 () Bool)

(assert (=> d!10159 m!43691))

(declare-fun m!43693 () Bool)

(assert (=> b!50407 m!43693))

(declare-fun m!43695 () Bool)

(assert (=> b!50408 m!43695))

(declare-fun m!43697 () Bool)

(assert (=> b!50409 m!43697))

(assert (=> d!10153 d!10159))

(declare-fun d!10161 () Bool)

(declare-fun lt!21049 () (_ BitVec 32))

(assert (=> d!10161 (and (bvsge lt!21049 #b00000000000000000000000000000000) (bvsle lt!21049 (bvsub (size!1794 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32572 () (_ BitVec 32))

(assert (=> d!10161 (= lt!21049 e!32572)))

(declare-fun c!6797 () Bool)

(assert (=> d!10161 (= c!6797 (bvsge #b00000000000000000000000000000000 (size!1794 (_keys!3526 newMap!16))))))

(assert (=> d!10161 (and (bvsle #b00000000000000000000000000000000 (size!1794 (_keys!3526 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1794 (_keys!3526 newMap!16)) (size!1794 (_keys!3526 newMap!16))))))

(assert (=> d!10161 (= (arrayCountValidKeys!0 (_keys!3526 newMap!16) #b00000000000000000000000000000000 (size!1794 (_keys!3526 newMap!16))) lt!21049)))

(declare-fun bm!3889 () Bool)

(declare-fun call!3892 () (_ BitVec 32))

(assert (=> bm!3889 (= call!3892 (arrayCountValidKeys!0 (_keys!3526 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1794 (_keys!3526 newMap!16))))))

(declare-fun b!50418 () Bool)

(declare-fun e!32571 () (_ BitVec 32))

(assert (=> b!50418 (= e!32571 call!3892)))

(declare-fun b!50419 () Bool)

(assert (=> b!50419 (= e!32571 (bvadd #b00000000000000000000000000000001 call!3892))))

(declare-fun b!50420 () Bool)

(assert (=> b!50420 (= e!32572 e!32571)))

(declare-fun c!6796 () Bool)

(assert (=> b!50420 (= c!6796 (validKeyInArray!0 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50421 () Bool)

(assert (=> b!50421 (= e!32572 #b00000000000000000000000000000000)))

(assert (= (and d!10161 c!6797) b!50421))

(assert (= (and d!10161 (not c!6797)) b!50420))

(assert (= (and b!50420 c!6796) b!50419))

(assert (= (and b!50420 (not c!6796)) b!50418))

(assert (= (or b!50419 b!50418) bm!3889))

(declare-fun m!43699 () Bool)

(assert (=> bm!3889 m!43699))

(assert (=> b!50420 m!43679))

(assert (=> b!50420 m!43679))

(assert (=> b!50420 m!43685))

(assert (=> b!50367 d!10161))

(declare-fun b!50430 () Bool)

(declare-fun e!32579 () Bool)

(declare-fun call!3895 () Bool)

(assert (=> b!50430 (= e!32579 call!3895)))

(declare-fun b!50432 () Bool)

(declare-fun e!32580 () Bool)

(assert (=> b!50432 (= e!32580 e!32579)))

(declare-fun c!6800 () Bool)

(assert (=> b!50432 (= c!6800 (validKeyInArray!0 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50433 () Bool)

(declare-fun e!32581 () Bool)

(assert (=> b!50433 (= e!32581 call!3895)))

(declare-fun bm!3892 () Bool)

(assert (=> bm!3892 (= call!3895 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3526 newMap!16) (mask!5705 newMap!16)))))

(declare-fun d!10163 () Bool)

(declare-fun res!29037 () Bool)

(assert (=> d!10163 (=> res!29037 e!32580)))

(assert (=> d!10163 (= res!29037 (bvsge #b00000000000000000000000000000000 (size!1794 (_keys!3526 newMap!16))))))

(assert (=> d!10163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3526 newMap!16) (mask!5705 newMap!16)) e!32580)))

(declare-fun b!50431 () Bool)

(assert (=> b!50431 (= e!32579 e!32581)))

(declare-fun lt!21057 () (_ BitVec 64))

(assert (=> b!50431 (= lt!21057 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1419 0))(
  ( (Unit!1420) )
))
(declare-fun lt!21058 () Unit!1419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3285 (_ BitVec 64) (_ BitVec 32)) Unit!1419)

(assert (=> b!50431 (= lt!21058 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3526 newMap!16) lt!21057 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!50431 (arrayContainsKey!0 (_keys!3526 newMap!16) lt!21057 #b00000000000000000000000000000000)))

(declare-fun lt!21056 () Unit!1419)

(assert (=> b!50431 (= lt!21056 lt!21058)))

(declare-fun res!29038 () Bool)

(declare-datatypes ((SeekEntryResult!219 0))(
  ( (MissingZero!219 (index!2998 (_ BitVec 32))) (Found!219 (index!2999 (_ BitVec 32))) (Intermediate!219 (undefined!1031 Bool) (index!3000 (_ BitVec 32)) (x!9205 (_ BitVec 32))) (Undefined!219) (MissingVacant!219 (index!3001 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3285 (_ BitVec 32)) SeekEntryResult!219)

(assert (=> b!50431 (= res!29038 (= (seekEntryOrOpen!0 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) (_keys!3526 newMap!16) (mask!5705 newMap!16)) (Found!219 #b00000000000000000000000000000000)))))

(assert (=> b!50431 (=> (not res!29038) (not e!32581))))

(assert (= (and d!10163 (not res!29037)) b!50432))

(assert (= (and b!50432 c!6800) b!50431))

(assert (= (and b!50432 (not c!6800)) b!50430))

(assert (= (and b!50431 res!29038) b!50433))

(assert (= (or b!50433 b!50430) bm!3892))

(assert (=> b!50432 m!43679))

(assert (=> b!50432 m!43679))

(assert (=> b!50432 m!43685))

(declare-fun m!43701 () Bool)

(assert (=> bm!3892 m!43701))

(assert (=> b!50431 m!43679))

(declare-fun m!43703 () Bool)

(assert (=> b!50431 m!43703))

(declare-fun m!43705 () Bool)

(assert (=> b!50431 m!43705))

(assert (=> b!50431 m!43679))

(declare-fun m!43707 () Bool)

(assert (=> b!50431 m!43707))

(assert (=> b!50368 d!10163))

(declare-fun b!50434 () Bool)

(declare-fun e!32583 () Bool)

(assert (=> b!50434 (= e!32583 tp_is_empty!2187)))

(declare-fun condMapEmpty!2199 () Bool)

(declare-fun mapDefault!2199 () ValueCell!750)

(assert (=> mapNonEmpty!2198 (= condMapEmpty!2199 (= mapRest!2198 ((as const (Array (_ BitVec 32) ValueCell!750)) mapDefault!2199)))))

(declare-fun e!32582 () Bool)

(declare-fun mapRes!2199 () Bool)

(assert (=> mapNonEmpty!2198 (= tp!6698 (and e!32582 mapRes!2199))))

(declare-fun b!50435 () Bool)

(assert (=> b!50435 (= e!32582 tp_is_empty!2187)))

(declare-fun mapIsEmpty!2199 () Bool)

(assert (=> mapIsEmpty!2199 mapRes!2199))

(declare-fun mapNonEmpty!2199 () Bool)

(declare-fun tp!6699 () Bool)

(assert (=> mapNonEmpty!2199 (= mapRes!2199 (and tp!6699 e!32583))))

(declare-fun mapRest!2199 () (Array (_ BitVec 32) ValueCell!750))

(declare-fun mapValue!2199 () ValueCell!750)

(declare-fun mapKey!2199 () (_ BitVec 32))

(assert (=> mapNonEmpty!2199 (= mapRest!2198 (store mapRest!2199 mapKey!2199 mapValue!2199))))

(assert (= (and mapNonEmpty!2198 condMapEmpty!2199) mapIsEmpty!2199))

(assert (= (and mapNonEmpty!2198 (not condMapEmpty!2199)) mapNonEmpty!2199))

(assert (= (and mapNonEmpty!2199 ((_ is ValueCellFull!750) mapValue!2199)) b!50434))

(assert (= (and mapNonEmpty!2198 ((_ is ValueCellFull!750) mapDefault!2199)) b!50435))

(declare-fun m!43709 () Bool)

(assert (=> mapNonEmpty!2199 m!43709))

(declare-fun b!50436 () Bool)

(declare-fun e!32585 () Bool)

(assert (=> b!50436 (= e!32585 tp_is_empty!2187)))

(declare-fun condMapEmpty!2200 () Bool)

(declare-fun mapDefault!2200 () ValueCell!750)

(assert (=> mapNonEmpty!2197 (= condMapEmpty!2200 (= mapRest!2197 ((as const (Array (_ BitVec 32) ValueCell!750)) mapDefault!2200)))))

(declare-fun e!32584 () Bool)

(declare-fun mapRes!2200 () Bool)

(assert (=> mapNonEmpty!2197 (= tp!6697 (and e!32584 mapRes!2200))))

(declare-fun b!50437 () Bool)

(assert (=> b!50437 (= e!32584 tp_is_empty!2187)))

(declare-fun mapIsEmpty!2200 () Bool)

(assert (=> mapIsEmpty!2200 mapRes!2200))

(declare-fun mapNonEmpty!2200 () Bool)

(declare-fun tp!6700 () Bool)

(assert (=> mapNonEmpty!2200 (= mapRes!2200 (and tp!6700 e!32585))))

(declare-fun mapKey!2200 () (_ BitVec 32))

(declare-fun mapValue!2200 () ValueCell!750)

(declare-fun mapRest!2200 () (Array (_ BitVec 32) ValueCell!750))

(assert (=> mapNonEmpty!2200 (= mapRest!2197 (store mapRest!2200 mapKey!2200 mapValue!2200))))

(assert (= (and mapNonEmpty!2197 condMapEmpty!2200) mapIsEmpty!2200))

(assert (= (and mapNonEmpty!2197 (not condMapEmpty!2200)) mapNonEmpty!2200))

(assert (= (and mapNonEmpty!2200 ((_ is ValueCellFull!750) mapValue!2200)) b!50436))

(assert (= (and mapNonEmpty!2197 ((_ is ValueCellFull!750) mapDefault!2200)) b!50437))

(declare-fun m!43711 () Bool)

(assert (=> mapNonEmpty!2200 m!43711))

(check-sat (not b!50420) (not bm!3889) (not b!50432) (not b!50393) (not b!50394) (not b_next!1541) b_and!2751 (not d!10159) tp_is_empty!2187 (not b_next!1543) (not mapNonEmpty!2200) (not b!50431) (not b!50408) (not b!50390) (not b!50405) (not d!10157) b_and!2753 (not b!50404) (not mapNonEmpty!2199) (not bm!3892) (not b!50407) (not bm!3886) (not b!50409))
(check-sat b_and!2751 b_and!2753 (not b_next!1541) (not b_next!1543))
(get-model)

(declare-fun d!10165 () Bool)

(assert (=> d!10165 (= (validKeyInArray!0 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!50393 d!10165))

(declare-fun b!50438 () Bool)

(declare-fun e!32586 () Bool)

(declare-fun call!3896 () Bool)

(assert (=> b!50438 (= e!32586 call!3896)))

(declare-fun b!50440 () Bool)

(declare-fun e!32587 () Bool)

(assert (=> b!50440 (= e!32587 e!32586)))

(declare-fun c!6801 () Bool)

(assert (=> b!50440 (= c!6801 (validKeyInArray!0 (select (arr!1571 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50441 () Bool)

(declare-fun e!32588 () Bool)

(assert (=> b!50441 (= e!32588 call!3896)))

(declare-fun bm!3893 () Bool)

(assert (=> bm!3893 (= call!3896 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3526 (v!2163 (underlying!128 thiss!992))) (mask!5705 (v!2163 (underlying!128 thiss!992)))))))

(declare-fun d!10167 () Bool)

(declare-fun res!29039 () Bool)

(assert (=> d!10167 (=> res!29039 e!32587)))

(assert (=> d!10167 (= res!29039 (bvsge #b00000000000000000000000000000000 (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992))))))))

(assert (=> d!10167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3526 (v!2163 (underlying!128 thiss!992))) (mask!5705 (v!2163 (underlying!128 thiss!992)))) e!32587)))

(declare-fun b!50439 () Bool)

(assert (=> b!50439 (= e!32586 e!32588)))

(declare-fun lt!21060 () (_ BitVec 64))

(assert (=> b!50439 (= lt!21060 (select (arr!1571 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21061 () Unit!1419)

(assert (=> b!50439 (= lt!21061 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3526 (v!2163 (underlying!128 thiss!992))) lt!21060 #b00000000000000000000000000000000))))

(assert (=> b!50439 (arrayContainsKey!0 (_keys!3526 (v!2163 (underlying!128 thiss!992))) lt!21060 #b00000000000000000000000000000000)))

(declare-fun lt!21059 () Unit!1419)

(assert (=> b!50439 (= lt!21059 lt!21061)))

(declare-fun res!29040 () Bool)

(assert (=> b!50439 (= res!29040 (= (seekEntryOrOpen!0 (select (arr!1571 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000) (_keys!3526 (v!2163 (underlying!128 thiss!992))) (mask!5705 (v!2163 (underlying!128 thiss!992)))) (Found!219 #b00000000000000000000000000000000)))))

(assert (=> b!50439 (=> (not res!29040) (not e!32588))))

(assert (= (and d!10167 (not res!29039)) b!50440))

(assert (= (and b!50440 c!6801) b!50439))

(assert (= (and b!50440 (not c!6801)) b!50438))

(assert (= (and b!50439 res!29040) b!50441))

(assert (= (or b!50441 b!50438) bm!3893))

(declare-fun m!43713 () Bool)

(assert (=> b!50440 m!43713))

(assert (=> b!50440 m!43713))

(declare-fun m!43715 () Bool)

(assert (=> b!50440 m!43715))

(declare-fun m!43717 () Bool)

(assert (=> bm!3893 m!43717))

(assert (=> b!50439 m!43713))

(declare-fun m!43719 () Bool)

(assert (=> b!50439 m!43719))

(declare-fun m!43721 () Bool)

(assert (=> b!50439 m!43721))

(assert (=> b!50439 m!43713))

(declare-fun m!43723 () Bool)

(assert (=> b!50439 m!43723))

(assert (=> b!50408 d!10167))

(declare-fun b!50442 () Bool)

(declare-fun e!32590 () Bool)

(assert (=> b!50442 (= e!32590 (contains!619 Nil!1326 (select (arr!1571 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3894 () Bool)

(declare-fun call!3897 () Bool)

(declare-fun c!6802 () Bool)

(assert (=> bm!3894 (= call!3897 (arrayNoDuplicates!0 (_keys!3526 (v!2163 (underlying!128 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6802 (Cons!1325 (select (arr!1571 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000) Nil!1326) Nil!1326)))))

(declare-fun b!50443 () Bool)

(declare-fun e!32589 () Bool)

(assert (=> b!50443 (= e!32589 call!3897)))

(declare-fun b!50444 () Bool)

(assert (=> b!50444 (= e!32589 call!3897)))

(declare-fun d!10169 () Bool)

(declare-fun res!29041 () Bool)

(declare-fun e!32591 () Bool)

(assert (=> d!10169 (=> res!29041 e!32591)))

(assert (=> d!10169 (= res!29041 (bvsge #b00000000000000000000000000000000 (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992))))))))

(assert (=> d!10169 (= (arrayNoDuplicates!0 (_keys!3526 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000000 Nil!1326) e!32591)))

(declare-fun b!50445 () Bool)

(declare-fun e!32592 () Bool)

(assert (=> b!50445 (= e!32591 e!32592)))

(declare-fun res!29042 () Bool)

(assert (=> b!50445 (=> (not res!29042) (not e!32592))))

(assert (=> b!50445 (= res!29042 (not e!32590))))

(declare-fun res!29043 () Bool)

(assert (=> b!50445 (=> (not res!29043) (not e!32590))))

(assert (=> b!50445 (= res!29043 (validKeyInArray!0 (select (arr!1571 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50446 () Bool)

(assert (=> b!50446 (= e!32592 e!32589)))

(assert (=> b!50446 (= c!6802 (validKeyInArray!0 (select (arr!1571 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10169 (not res!29041)) b!50445))

(assert (= (and b!50445 res!29043) b!50442))

(assert (= (and b!50445 res!29042) b!50446))

(assert (= (and b!50446 c!6802) b!50443))

(assert (= (and b!50446 (not c!6802)) b!50444))

(assert (= (or b!50443 b!50444) bm!3894))

(assert (=> b!50442 m!43713))

(assert (=> b!50442 m!43713))

(declare-fun m!43725 () Bool)

(assert (=> b!50442 m!43725))

(assert (=> bm!3894 m!43713))

(declare-fun m!43727 () Bool)

(assert (=> bm!3894 m!43727))

(assert (=> b!50445 m!43713))

(assert (=> b!50445 m!43713))

(assert (=> b!50445 m!43715))

(assert (=> b!50446 m!43713))

(assert (=> b!50446 m!43713))

(assert (=> b!50446 m!43715))

(assert (=> b!50409 d!10169))

(declare-fun d!10171 () Bool)

(assert (=> d!10171 (= (validMask!0 (mask!5705 newMap!16)) (and (or (= (mask!5705 newMap!16) #b00000000000000000000000000000111) (= (mask!5705 newMap!16) #b00000000000000000000000000001111) (= (mask!5705 newMap!16) #b00000000000000000000000000011111) (= (mask!5705 newMap!16) #b00000000000000000000000000111111) (= (mask!5705 newMap!16) #b00000000000000000000000001111111) (= (mask!5705 newMap!16) #b00000000000000000000000011111111) (= (mask!5705 newMap!16) #b00000000000000000000000111111111) (= (mask!5705 newMap!16) #b00000000000000000000001111111111) (= (mask!5705 newMap!16) #b00000000000000000000011111111111) (= (mask!5705 newMap!16) #b00000000000000000000111111111111) (= (mask!5705 newMap!16) #b00000000000000000001111111111111) (= (mask!5705 newMap!16) #b00000000000000000011111111111111) (= (mask!5705 newMap!16) #b00000000000000000111111111111111) (= (mask!5705 newMap!16) #b00000000000000001111111111111111) (= (mask!5705 newMap!16) #b00000000000000011111111111111111) (= (mask!5705 newMap!16) #b00000000000000111111111111111111) (= (mask!5705 newMap!16) #b00000000000001111111111111111111) (= (mask!5705 newMap!16) #b00000000000011111111111111111111) (= (mask!5705 newMap!16) #b00000000000111111111111111111111) (= (mask!5705 newMap!16) #b00000000001111111111111111111111) (= (mask!5705 newMap!16) #b00000000011111111111111111111111) (= (mask!5705 newMap!16) #b00000000111111111111111111111111) (= (mask!5705 newMap!16) #b00000001111111111111111111111111) (= (mask!5705 newMap!16) #b00000011111111111111111111111111) (= (mask!5705 newMap!16) #b00000111111111111111111111111111) (= (mask!5705 newMap!16) #b00001111111111111111111111111111) (= (mask!5705 newMap!16) #b00011111111111111111111111111111) (= (mask!5705 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5705 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10157 d!10171))

(assert (=> b!50394 d!10165))

(declare-fun d!10173 () Bool)

(declare-fun lt!21062 () (_ BitVec 32))

(assert (=> d!10173 (and (bvsge lt!21062 #b00000000000000000000000000000000) (bvsle lt!21062 (bvsub (size!1794 (_keys!3526 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!32594 () (_ BitVec 32))

(assert (=> d!10173 (= lt!21062 e!32594)))

(declare-fun c!6804 () Bool)

(assert (=> d!10173 (= c!6804 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1794 (_keys!3526 newMap!16))))))

(assert (=> d!10173 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1794 (_keys!3526 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1794 (_keys!3526 newMap!16)) (size!1794 (_keys!3526 newMap!16))))))

(assert (=> d!10173 (= (arrayCountValidKeys!0 (_keys!3526 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1794 (_keys!3526 newMap!16))) lt!21062)))

(declare-fun bm!3895 () Bool)

(declare-fun call!3898 () (_ BitVec 32))

(assert (=> bm!3895 (= call!3898 (arrayCountValidKeys!0 (_keys!3526 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1794 (_keys!3526 newMap!16))))))

(declare-fun b!50447 () Bool)

(declare-fun e!32593 () (_ BitVec 32))

(assert (=> b!50447 (= e!32593 call!3898)))

(declare-fun b!50448 () Bool)

(assert (=> b!50448 (= e!32593 (bvadd #b00000000000000000000000000000001 call!3898))))

(declare-fun b!50449 () Bool)

(assert (=> b!50449 (= e!32594 e!32593)))

(declare-fun c!6803 () Bool)

(assert (=> b!50449 (= c!6803 (validKeyInArray!0 (select (arr!1571 (_keys!3526 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50450 () Bool)

(assert (=> b!50450 (= e!32594 #b00000000000000000000000000000000)))

(assert (= (and d!10173 c!6804) b!50450))

(assert (= (and d!10173 (not c!6804)) b!50449))

(assert (= (and b!50449 c!6803) b!50448))

(assert (= (and b!50449 (not c!6803)) b!50447))

(assert (= (or b!50448 b!50447) bm!3895))

(declare-fun m!43729 () Bool)

(assert (=> bm!3895 m!43729))

(declare-fun m!43731 () Bool)

(assert (=> b!50449 m!43731))

(assert (=> b!50449 m!43731))

(declare-fun m!43733 () Bool)

(assert (=> b!50449 m!43733))

(assert (=> bm!3889 d!10173))

(declare-fun d!10175 () Bool)

(assert (=> d!10175 (arrayContainsKey!0 (_keys!3526 newMap!16) lt!21057 #b00000000000000000000000000000000)))

(declare-fun lt!21065 () Unit!1419)

(declare-fun choose!13 (array!3285 (_ BitVec 64) (_ BitVec 32)) Unit!1419)

(assert (=> d!10175 (= lt!21065 (choose!13 (_keys!3526 newMap!16) lt!21057 #b00000000000000000000000000000000))))

(assert (=> d!10175 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10175 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3526 newMap!16) lt!21057 #b00000000000000000000000000000000) lt!21065)))

(declare-fun bs!2359 () Bool)

(assert (= bs!2359 d!10175))

(assert (=> bs!2359 m!43705))

(declare-fun m!43735 () Bool)

(assert (=> bs!2359 m!43735))

(assert (=> b!50431 d!10175))

(declare-fun d!10177 () Bool)

(declare-fun res!29048 () Bool)

(declare-fun e!32599 () Bool)

(assert (=> d!10177 (=> res!29048 e!32599)))

(assert (=> d!10177 (= res!29048 (= (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) lt!21057))))

(assert (=> d!10177 (= (arrayContainsKey!0 (_keys!3526 newMap!16) lt!21057 #b00000000000000000000000000000000) e!32599)))

(declare-fun b!50455 () Bool)

(declare-fun e!32600 () Bool)

(assert (=> b!50455 (= e!32599 e!32600)))

(declare-fun res!29049 () Bool)

(assert (=> b!50455 (=> (not res!29049) (not e!32600))))

(assert (=> b!50455 (= res!29049 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1794 (_keys!3526 newMap!16))))))

(declare-fun b!50456 () Bool)

(assert (=> b!50456 (= e!32600 (arrayContainsKey!0 (_keys!3526 newMap!16) lt!21057 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10177 (not res!29048)) b!50455))

(assert (= (and b!50455 res!29049) b!50456))

(assert (=> d!10177 m!43679))

(declare-fun m!43737 () Bool)

(assert (=> b!50456 m!43737))

(assert (=> b!50431 d!10177))

(declare-fun d!10179 () Bool)

(declare-fun lt!21072 () SeekEntryResult!219)

(assert (=> d!10179 (and (or ((_ is Undefined!219) lt!21072) (not ((_ is Found!219) lt!21072)) (and (bvsge (index!2999 lt!21072) #b00000000000000000000000000000000) (bvslt (index!2999 lt!21072) (size!1794 (_keys!3526 newMap!16))))) (or ((_ is Undefined!219) lt!21072) ((_ is Found!219) lt!21072) (not ((_ is MissingZero!219) lt!21072)) (and (bvsge (index!2998 lt!21072) #b00000000000000000000000000000000) (bvslt (index!2998 lt!21072) (size!1794 (_keys!3526 newMap!16))))) (or ((_ is Undefined!219) lt!21072) ((_ is Found!219) lt!21072) ((_ is MissingZero!219) lt!21072) (not ((_ is MissingVacant!219) lt!21072)) (and (bvsge (index!3001 lt!21072) #b00000000000000000000000000000000) (bvslt (index!3001 lt!21072) (size!1794 (_keys!3526 newMap!16))))) (or ((_ is Undefined!219) lt!21072) (ite ((_ is Found!219) lt!21072) (= (select (arr!1571 (_keys!3526 newMap!16)) (index!2999 lt!21072)) (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!219) lt!21072) (= (select (arr!1571 (_keys!3526 newMap!16)) (index!2998 lt!21072)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!219) lt!21072) (= (select (arr!1571 (_keys!3526 newMap!16)) (index!3001 lt!21072)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!32609 () SeekEntryResult!219)

(assert (=> d!10179 (= lt!21072 e!32609)))

(declare-fun c!6812 () Bool)

(declare-fun lt!21073 () SeekEntryResult!219)

(assert (=> d!10179 (= c!6812 (and ((_ is Intermediate!219) lt!21073) (undefined!1031 lt!21073)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3285 (_ BitVec 32)) SeekEntryResult!219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10179 (= lt!21073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) (mask!5705 newMap!16)) (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) (_keys!3526 newMap!16) (mask!5705 newMap!16)))))

(assert (=> d!10179 (validMask!0 (mask!5705 newMap!16))))

(assert (=> d!10179 (= (seekEntryOrOpen!0 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) (_keys!3526 newMap!16) (mask!5705 newMap!16)) lt!21072)))

(declare-fun b!50469 () Bool)

(declare-fun e!32607 () SeekEntryResult!219)

(assert (=> b!50469 (= e!32607 (Found!219 (index!3000 lt!21073)))))

(declare-fun b!50470 () Bool)

(assert (=> b!50470 (= e!32609 Undefined!219)))

(declare-fun b!50471 () Bool)

(declare-fun e!32608 () SeekEntryResult!219)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3285 (_ BitVec 32)) SeekEntryResult!219)

(assert (=> b!50471 (= e!32608 (seekKeyOrZeroReturnVacant!0 (x!9205 lt!21073) (index!3000 lt!21073) (index!3000 lt!21073) (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) (_keys!3526 newMap!16) (mask!5705 newMap!16)))))

(declare-fun b!50472 () Bool)

(declare-fun c!6813 () Bool)

(declare-fun lt!21074 () (_ BitVec 64))

(assert (=> b!50472 (= c!6813 (= lt!21074 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!50472 (= e!32607 e!32608)))

(declare-fun b!50473 () Bool)

(assert (=> b!50473 (= e!32608 (MissingZero!219 (index!3000 lt!21073)))))

(declare-fun b!50474 () Bool)

(assert (=> b!50474 (= e!32609 e!32607)))

(assert (=> b!50474 (= lt!21074 (select (arr!1571 (_keys!3526 newMap!16)) (index!3000 lt!21073)))))

(declare-fun c!6811 () Bool)

(assert (=> b!50474 (= c!6811 (= lt!21074 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10179 c!6812) b!50470))

(assert (= (and d!10179 (not c!6812)) b!50474))

(assert (= (and b!50474 c!6811) b!50469))

(assert (= (and b!50474 (not c!6811)) b!50472))

(assert (= (and b!50472 c!6813) b!50473))

(assert (= (and b!50472 (not c!6813)) b!50471))

(declare-fun m!43739 () Bool)

(assert (=> d!10179 m!43739))

(assert (=> d!10179 m!43679))

(declare-fun m!43741 () Bool)

(assert (=> d!10179 m!43741))

(declare-fun m!43743 () Bool)

(assert (=> d!10179 m!43743))

(declare-fun m!43745 () Bool)

(assert (=> d!10179 m!43745))

(assert (=> d!10179 m!43679))

(assert (=> d!10179 m!43739))

(declare-fun m!43747 () Bool)

(assert (=> d!10179 m!43747))

(assert (=> d!10179 m!43689))

(assert (=> b!50471 m!43679))

(declare-fun m!43749 () Bool)

(assert (=> b!50471 m!43749))

(declare-fun m!43751 () Bool)

(assert (=> b!50474 m!43751))

(assert (=> b!50431 d!10179))

(assert (=> b!50432 d!10165))

(declare-fun b!50477 () Bool)

(declare-fun res!29053 () Bool)

(declare-fun e!32610 () Bool)

(assert (=> b!50477 (=> (not res!29053) (not e!32610))))

(assert (=> b!50477 (= res!29053 (= (size!1798 (v!2163 (underlying!128 thiss!992))) (bvadd (_size!253 (v!2163 (underlying!128 thiss!992))) (bvsdiv (bvadd (extraKeys!1809 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!10181 () Bool)

(declare-fun res!29051 () Bool)

(assert (=> d!10181 (=> (not res!29051) (not e!32610))))

(assert (=> d!10181 (= res!29051 (validMask!0 (mask!5705 (v!2163 (underlying!128 thiss!992)))))))

(assert (=> d!10181 (= (simpleValid!34 (v!2163 (underlying!128 thiss!992))) e!32610)))

(declare-fun b!50476 () Bool)

(declare-fun res!29050 () Bool)

(assert (=> b!50476 (=> (not res!29050) (not e!32610))))

(assert (=> b!50476 (= res!29050 (bvsge (size!1798 (v!2163 (underlying!128 thiss!992))) (_size!253 (v!2163 (underlying!128 thiss!992)))))))

(declare-fun b!50475 () Bool)

(declare-fun res!29052 () Bool)

(assert (=> b!50475 (=> (not res!29052) (not e!32610))))

(assert (=> b!50475 (= res!29052 (and (= (size!1795 (_values!1901 (v!2163 (underlying!128 thiss!992)))) (bvadd (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000001)) (= (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) (size!1795 (_values!1901 (v!2163 (underlying!128 thiss!992))))) (bvsge (_size!253 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!253 (v!2163 (underlying!128 thiss!992))) (bvadd (mask!5705 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!50478 () Bool)

(assert (=> b!50478 (= e!32610 (and (bvsge (extraKeys!1809 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1809 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!253 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000000)))))

(assert (= (and d!10181 res!29051) b!50475))

(assert (= (and b!50475 res!29052) b!50476))

(assert (= (and b!50476 res!29050) b!50477))

(assert (= (and b!50477 res!29053) b!50478))

(declare-fun m!43753 () Bool)

(assert (=> b!50477 m!43753))

(assert (=> d!10181 m!43643))

(assert (=> b!50476 m!43753))

(assert (=> d!10159 d!10181))

(assert (=> b!50420 d!10165))

(declare-fun b!50479 () Bool)

(declare-fun e!32611 () Bool)

(declare-fun call!3899 () Bool)

(assert (=> b!50479 (= e!32611 call!3899)))

(declare-fun b!50481 () Bool)

(declare-fun e!32612 () Bool)

(assert (=> b!50481 (= e!32612 e!32611)))

(declare-fun c!6814 () Bool)

(assert (=> b!50481 (= c!6814 (validKeyInArray!0 (select (arr!1571 (_keys!3526 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50482 () Bool)

(declare-fun e!32613 () Bool)

(assert (=> b!50482 (= e!32613 call!3899)))

(declare-fun bm!3896 () Bool)

(assert (=> bm!3896 (= call!3899 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3526 newMap!16) (mask!5705 newMap!16)))))

(declare-fun d!10183 () Bool)

(declare-fun res!29054 () Bool)

(assert (=> d!10183 (=> res!29054 e!32612)))

(assert (=> d!10183 (= res!29054 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1794 (_keys!3526 newMap!16))))))

(assert (=> d!10183 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3526 newMap!16) (mask!5705 newMap!16)) e!32612)))

(declare-fun b!50480 () Bool)

(assert (=> b!50480 (= e!32611 e!32613)))

(declare-fun lt!21076 () (_ BitVec 64))

(assert (=> b!50480 (= lt!21076 (select (arr!1571 (_keys!3526 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21077 () Unit!1419)

(assert (=> b!50480 (= lt!21077 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3526 newMap!16) lt!21076 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!50480 (arrayContainsKey!0 (_keys!3526 newMap!16) lt!21076 #b00000000000000000000000000000000)))

(declare-fun lt!21075 () Unit!1419)

(assert (=> b!50480 (= lt!21075 lt!21077)))

(declare-fun res!29055 () Bool)

(assert (=> b!50480 (= res!29055 (= (seekEntryOrOpen!0 (select (arr!1571 (_keys!3526 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3526 newMap!16) (mask!5705 newMap!16)) (Found!219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!50480 (=> (not res!29055) (not e!32613))))

(assert (= (and d!10183 (not res!29054)) b!50481))

(assert (= (and b!50481 c!6814) b!50480))

(assert (= (and b!50481 (not c!6814)) b!50479))

(assert (= (and b!50480 res!29055) b!50482))

(assert (= (or b!50482 b!50479) bm!3896))

(assert (=> b!50481 m!43731))

(assert (=> b!50481 m!43731))

(assert (=> b!50481 m!43733))

(declare-fun m!43755 () Bool)

(assert (=> bm!3896 m!43755))

(assert (=> b!50480 m!43731))

(declare-fun m!43757 () Bool)

(assert (=> b!50480 m!43757))

(declare-fun m!43759 () Bool)

(assert (=> b!50480 m!43759))

(assert (=> b!50480 m!43731))

(declare-fun m!43761 () Bool)

(assert (=> b!50480 m!43761))

(assert (=> bm!3892 d!10183))

(declare-fun d!10185 () Bool)

(declare-fun lt!21080 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!56 (List!1329) (InoxSet (_ BitVec 64)))

(assert (=> d!10185 (= lt!21080 (select (content!56 Nil!1326) (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32619 () Bool)

(assert (=> d!10185 (= lt!21080 e!32619)))

(declare-fun res!29061 () Bool)

(assert (=> d!10185 (=> (not res!29061) (not e!32619))))

(assert (=> d!10185 (= res!29061 ((_ is Cons!1325) Nil!1326))))

(assert (=> d!10185 (= (contains!619 Nil!1326 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)) lt!21080)))

(declare-fun b!50487 () Bool)

(declare-fun e!32618 () Bool)

(assert (=> b!50487 (= e!32619 e!32618)))

(declare-fun res!29060 () Bool)

(assert (=> b!50487 (=> res!29060 e!32618)))

(assert (=> b!50487 (= res!29060 (= (h!1905 Nil!1326) (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50488 () Bool)

(assert (=> b!50488 (= e!32618 (contains!619 (t!4363 Nil!1326) (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10185 res!29061) b!50487))

(assert (= (and b!50487 (not res!29060)) b!50488))

(declare-fun m!43763 () Bool)

(assert (=> d!10185 m!43763))

(assert (=> d!10185 m!43679))

(declare-fun m!43765 () Bool)

(assert (=> d!10185 m!43765))

(assert (=> b!50488 m!43679))

(declare-fun m!43767 () Bool)

(assert (=> b!50488 m!43767))

(assert (=> b!50390 d!10185))

(declare-fun d!10187 () Bool)

(assert (=> d!10187 (= (size!1798 newMap!16) (bvadd (_size!253 newMap!16) (bvsdiv (bvadd (extraKeys!1809 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!50404 d!10187))

(assert (=> b!50405 d!10187))

(declare-fun b!50489 () Bool)

(declare-fun e!32621 () Bool)

(assert (=> b!50489 (= e!32621 (contains!619 (ite c!6791 (Cons!1325 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) Nil!1326) Nil!1326) (select (arr!1571 (_keys!3526 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3897 () Bool)

(declare-fun call!3900 () Bool)

(declare-fun c!6815 () Bool)

(assert (=> bm!3897 (= call!3900 (arrayNoDuplicates!0 (_keys!3526 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6815 (Cons!1325 (select (arr!1571 (_keys!3526 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6791 (Cons!1325 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) Nil!1326) Nil!1326)) (ite c!6791 (Cons!1325 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) Nil!1326) Nil!1326))))))

(declare-fun b!50490 () Bool)

(declare-fun e!32620 () Bool)

(assert (=> b!50490 (= e!32620 call!3900)))

(declare-fun b!50491 () Bool)

(assert (=> b!50491 (= e!32620 call!3900)))

(declare-fun d!10189 () Bool)

(declare-fun res!29062 () Bool)

(declare-fun e!32622 () Bool)

(assert (=> d!10189 (=> res!29062 e!32622)))

(assert (=> d!10189 (= res!29062 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1794 (_keys!3526 newMap!16))))))

(assert (=> d!10189 (= (arrayNoDuplicates!0 (_keys!3526 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6791 (Cons!1325 (select (arr!1571 (_keys!3526 newMap!16)) #b00000000000000000000000000000000) Nil!1326) Nil!1326)) e!32622)))

(declare-fun b!50492 () Bool)

(declare-fun e!32623 () Bool)

(assert (=> b!50492 (= e!32622 e!32623)))

(declare-fun res!29063 () Bool)

(assert (=> b!50492 (=> (not res!29063) (not e!32623))))

(assert (=> b!50492 (= res!29063 (not e!32621))))

(declare-fun res!29064 () Bool)

(assert (=> b!50492 (=> (not res!29064) (not e!32621))))

(assert (=> b!50492 (= res!29064 (validKeyInArray!0 (select (arr!1571 (_keys!3526 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50493 () Bool)

(assert (=> b!50493 (= e!32623 e!32620)))

(assert (=> b!50493 (= c!6815 (validKeyInArray!0 (select (arr!1571 (_keys!3526 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10189 (not res!29062)) b!50492))

(assert (= (and b!50492 res!29064) b!50489))

(assert (= (and b!50492 res!29063) b!50493))

(assert (= (and b!50493 c!6815) b!50490))

(assert (= (and b!50493 (not c!6815)) b!50491))

(assert (= (or b!50490 b!50491) bm!3897))

(assert (=> b!50489 m!43731))

(assert (=> b!50489 m!43731))

(declare-fun m!43769 () Bool)

(assert (=> b!50489 m!43769))

(assert (=> bm!3897 m!43731))

(declare-fun m!43771 () Bool)

(assert (=> bm!3897 m!43771))

(assert (=> b!50492 m!43731))

(assert (=> b!50492 m!43731))

(assert (=> b!50492 m!43733))

(assert (=> b!50493 m!43731))

(assert (=> b!50493 m!43731))

(assert (=> b!50493 m!43733))

(assert (=> bm!3886 d!10189))

(declare-fun d!10191 () Bool)

(declare-fun lt!21081 () (_ BitVec 32))

(assert (=> d!10191 (and (bvsge lt!21081 #b00000000000000000000000000000000) (bvsle lt!21081 (bvsub (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!32625 () (_ BitVec 32))

(assert (=> d!10191 (= lt!21081 e!32625)))

(declare-fun c!6817 () Bool)

(assert (=> d!10191 (= c!6817 (bvsge #b00000000000000000000000000000000 (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992))))))))

(assert (=> d!10191 (and (bvsle #b00000000000000000000000000000000 (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992))))))))

(assert (=> d!10191 (= (arrayCountValidKeys!0 (_keys!3526 (v!2163 (underlying!128 thiss!992))) #b00000000000000000000000000000000 (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992))))) lt!21081)))

(declare-fun bm!3898 () Bool)

(declare-fun call!3901 () (_ BitVec 32))

(assert (=> bm!3898 (= call!3901 (arrayCountValidKeys!0 (_keys!3526 (v!2163 (underlying!128 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1794 (_keys!3526 (v!2163 (underlying!128 thiss!992))))))))

(declare-fun b!50494 () Bool)

(declare-fun e!32624 () (_ BitVec 32))

(assert (=> b!50494 (= e!32624 call!3901)))

(declare-fun b!50495 () Bool)

(assert (=> b!50495 (= e!32624 (bvadd #b00000000000000000000000000000001 call!3901))))

(declare-fun b!50496 () Bool)

(assert (=> b!50496 (= e!32625 e!32624)))

(declare-fun c!6816 () Bool)

(assert (=> b!50496 (= c!6816 (validKeyInArray!0 (select (arr!1571 (_keys!3526 (v!2163 (underlying!128 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50497 () Bool)

(assert (=> b!50497 (= e!32625 #b00000000000000000000000000000000)))

(assert (= (and d!10191 c!6817) b!50497))

(assert (= (and d!10191 (not c!6817)) b!50496))

(assert (= (and b!50496 c!6816) b!50495))

(assert (= (and b!50496 (not c!6816)) b!50494))

(assert (= (or b!50495 b!50494) bm!3898))

(declare-fun m!43773 () Bool)

(assert (=> bm!3898 m!43773))

(assert (=> b!50496 m!43713))

(assert (=> b!50496 m!43713))

(assert (=> b!50496 m!43715))

(assert (=> b!50407 d!10191))

(declare-fun b!50498 () Bool)

(declare-fun e!32627 () Bool)

(assert (=> b!50498 (= e!32627 tp_is_empty!2187)))

(declare-fun condMapEmpty!2201 () Bool)

(declare-fun mapDefault!2201 () ValueCell!750)

(assert (=> mapNonEmpty!2199 (= condMapEmpty!2201 (= mapRest!2199 ((as const (Array (_ BitVec 32) ValueCell!750)) mapDefault!2201)))))

(declare-fun e!32626 () Bool)

(declare-fun mapRes!2201 () Bool)

(assert (=> mapNonEmpty!2199 (= tp!6699 (and e!32626 mapRes!2201))))

(declare-fun b!50499 () Bool)

(assert (=> b!50499 (= e!32626 tp_is_empty!2187)))

(declare-fun mapIsEmpty!2201 () Bool)

(assert (=> mapIsEmpty!2201 mapRes!2201))

(declare-fun mapNonEmpty!2201 () Bool)

(declare-fun tp!6701 () Bool)

(assert (=> mapNonEmpty!2201 (= mapRes!2201 (and tp!6701 e!32627))))

(declare-fun mapValue!2201 () ValueCell!750)

(declare-fun mapKey!2201 () (_ BitVec 32))

(declare-fun mapRest!2201 () (Array (_ BitVec 32) ValueCell!750))

(assert (=> mapNonEmpty!2201 (= mapRest!2199 (store mapRest!2201 mapKey!2201 mapValue!2201))))

(assert (= (and mapNonEmpty!2199 condMapEmpty!2201) mapIsEmpty!2201))

(assert (= (and mapNonEmpty!2199 (not condMapEmpty!2201)) mapNonEmpty!2201))

(assert (= (and mapNonEmpty!2201 ((_ is ValueCellFull!750) mapValue!2201)) b!50498))

(assert (= (and mapNonEmpty!2199 ((_ is ValueCellFull!750) mapDefault!2201)) b!50499))

(declare-fun m!43775 () Bool)

(assert (=> mapNonEmpty!2201 m!43775))

(declare-fun b!50500 () Bool)

(declare-fun e!32629 () Bool)

(assert (=> b!50500 (= e!32629 tp_is_empty!2187)))

(declare-fun condMapEmpty!2202 () Bool)

(declare-fun mapDefault!2202 () ValueCell!750)

(assert (=> mapNonEmpty!2200 (= condMapEmpty!2202 (= mapRest!2200 ((as const (Array (_ BitVec 32) ValueCell!750)) mapDefault!2202)))))

(declare-fun e!32628 () Bool)

(declare-fun mapRes!2202 () Bool)

(assert (=> mapNonEmpty!2200 (= tp!6700 (and e!32628 mapRes!2202))))

(declare-fun b!50501 () Bool)

(assert (=> b!50501 (= e!32628 tp_is_empty!2187)))

(declare-fun mapIsEmpty!2202 () Bool)

(assert (=> mapIsEmpty!2202 mapRes!2202))

(declare-fun mapNonEmpty!2202 () Bool)

(declare-fun tp!6702 () Bool)

(assert (=> mapNonEmpty!2202 (= mapRes!2202 (and tp!6702 e!32629))))

(declare-fun mapRest!2202 () (Array (_ BitVec 32) ValueCell!750))

(declare-fun mapKey!2202 () (_ BitVec 32))

(declare-fun mapValue!2202 () ValueCell!750)

(assert (=> mapNonEmpty!2202 (= mapRest!2200 (store mapRest!2202 mapKey!2202 mapValue!2202))))

(assert (= (and mapNonEmpty!2200 condMapEmpty!2202) mapIsEmpty!2202))

(assert (= (and mapNonEmpty!2200 (not condMapEmpty!2202)) mapNonEmpty!2202))

(assert (= (and mapNonEmpty!2202 ((_ is ValueCellFull!750) mapValue!2202)) b!50500))

(assert (= (and mapNonEmpty!2200 ((_ is ValueCellFull!750) mapDefault!2202)) b!50501))

(declare-fun m!43777 () Bool)

(assert (=> mapNonEmpty!2202 m!43777))

(check-sat (not bm!3894) (not b!50440) (not b!50492) (not d!10181) (not mapNonEmpty!2201) (not b!50449) (not b_next!1541) (not b!50471) (not b!50456) (not bm!3897) (not b!50442) (not bm!3896) tp_is_empty!2187 (not b!50481) (not b!50477) (not b!50476) b_and!2753 (not d!10175) (not d!10179) (not b!50446) (not b!50488) (not b!50496) (not d!10185) (not b!50480) (not bm!3895) (not b!50489) (not b!50493) (not bm!3893) b_and!2751 (not b!50439) (not bm!3898) (not mapNonEmpty!2202) (not b!50445) (not b_next!1543))
(check-sat b_and!2751 b_and!2753 (not b_next!1541) (not b_next!1543))
