; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8016 () Bool)

(assert start!8016)

(declare-fun b!50190 () Bool)

(declare-fun b_free!1537 () Bool)

(declare-fun b_next!1537 () Bool)

(assert (=> b!50190 (= b_free!1537 (not b_next!1537))))

(declare-fun tp!6670 () Bool)

(declare-fun b_and!2749 () Bool)

(assert (=> b!50190 (= tp!6670 b_and!2749)))

(declare-fun b!50204 () Bool)

(declare-fun b_free!1539 () Bool)

(declare-fun b_next!1539 () Bool)

(assert (=> b!50204 (= b_free!1539 (not b_next!1539))))

(declare-fun tp!6667 () Bool)

(declare-fun b_and!2751 () Bool)

(assert (=> b!50204 (= tp!6667 b_and!2751)))

(declare-datatypes ((V!2561 0))(
  ( (V!2562 (val!1137 Int)) )
))
(declare-datatypes ((array!3261 0))(
  ( (array!3262 (arr!1558 (Array (_ BitVec 32) (_ BitVec 64))) (size!1782 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!749 0))(
  ( (ValueCellFull!749 (v!2158 V!2561)) (EmptyCell!749) )
))
(declare-datatypes ((array!3263 0))(
  ( (array!3264 (arr!1559 (Array (_ BitVec 32) ValueCell!749)) (size!1783 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!406 0))(
  ( (LongMapFixedSize!407 (defaultEntry!1917 Int) (mask!5703 (_ BitVec 32)) (extraKeys!1808 (_ BitVec 32)) (zeroValue!1835 V!2561) (minValue!1835 V!2561) (_size!252 (_ BitVec 32)) (_keys!3524 array!3261) (_values!1900 array!3263) (_vacant!252 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!232 0))(
  ( (Cell!233 (v!2159 LongMapFixedSize!406)) )
))
(declare-datatypes ((LongMap!232 0))(
  ( (LongMap!233 (underlying!127 Cell!232)) )
))
(declare-fun thiss!992 () LongMap!232)

(declare-fun e!32415 () Bool)

(declare-fun tp_is_empty!2185 () Bool)

(declare-fun e!32409 () Bool)

(declare-fun array_inv!951 (array!3261) Bool)

(declare-fun array_inv!952 (array!3263) Bool)

(assert (=> b!50190 (= e!32409 (and tp!6670 tp_is_empty!2185 (array_inv!951 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) (array_inv!952 (_values!1900 (v!2159 (underlying!127 thiss!992)))) e!32415))))

(declare-fun b!50191 () Bool)

(declare-fun e!32407 () Bool)

(assert (=> b!50191 (= e!32407 tp_is_empty!2185)))

(declare-fun mapIsEmpty!2181 () Bool)

(declare-fun mapRes!2182 () Bool)

(assert (=> mapIsEmpty!2181 mapRes!2182))

(declare-fun b!50192 () Bool)

(declare-fun e!32412 () Bool)

(assert (=> b!50192 (= e!32412 (and e!32407 mapRes!2182))))

(declare-fun condMapEmpty!2182 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!406)

(declare-fun mapDefault!2182 () ValueCell!749)

(assert (=> b!50192 (= condMapEmpty!2182 (= (arr!1559 (_values!1900 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2182)))))

(declare-fun b!50193 () Bool)

(declare-fun res!28948 () Bool)

(declare-fun e!32417 () Bool)

(assert (=> b!50193 (=> (not res!28948) (not e!32417))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50193 (= res!28948 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992)))))))))

(declare-fun mapIsEmpty!2182 () Bool)

(declare-fun mapRes!2181 () Bool)

(assert (=> mapIsEmpty!2182 mapRes!2181))

(declare-fun b!50194 () Bool)

(declare-fun e!32418 () Bool)

(assert (=> b!50194 (= e!32418 tp_is_empty!2185)))

(declare-fun b!50195 () Bool)

(declare-fun e!32410 () Bool)

(assert (=> b!50195 (= e!32410 e!32409)))

(declare-fun res!28947 () Bool)

(assert (=> start!8016 (=> (not res!28947) (not e!32417))))

(declare-fun valid!144 (LongMap!232) Bool)

(assert (=> start!8016 (= res!28947 (valid!144 thiss!992))))

(assert (=> start!8016 e!32417))

(declare-fun e!32416 () Bool)

(assert (=> start!8016 e!32416))

(assert (=> start!8016 true))

(declare-fun e!32414 () Bool)

(assert (=> start!8016 e!32414))

(declare-fun mapNonEmpty!2181 () Bool)

(declare-fun tp!6669 () Bool)

(declare-fun e!32406 () Bool)

(assert (=> mapNonEmpty!2181 (= mapRes!2182 (and tp!6669 e!32406))))

(declare-fun mapKey!2182 () (_ BitVec 32))

(declare-fun mapRest!2181 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapValue!2181 () ValueCell!749)

(assert (=> mapNonEmpty!2181 (= (arr!1559 (_values!1900 newMap!16)) (store mapRest!2181 mapKey!2182 mapValue!2181))))

(declare-fun b!50196 () Bool)

(assert (=> b!50196 (= e!32406 tp_is_empty!2185)))

(declare-fun b!50197 () Bool)

(declare-fun res!28946 () Bool)

(assert (=> b!50197 (=> (not res!28946) (not e!32417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50197 (= res!28946 (validMask!0 (mask!5703 (v!2159 (underlying!127 thiss!992)))))))

(declare-fun b!50198 () Bool)

(declare-fun res!28949 () Bool)

(assert (=> b!50198 (=> (not res!28949) (not e!32417))))

(declare-fun valid!145 (LongMapFixedSize!406) Bool)

(assert (=> b!50198 (= res!28949 (valid!145 newMap!16))))

(declare-fun b!50199 () Bool)

(declare-fun e!32413 () Bool)

(assert (=> b!50199 (= e!32415 (and e!32413 mapRes!2181))))

(declare-fun condMapEmpty!2181 () Bool)

(declare-fun mapDefault!2181 () ValueCell!749)

(assert (=> b!50199 (= condMapEmpty!2181 (= (arr!1559 (_values!1900 (v!2159 (underlying!127 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2181)))))

(declare-fun b!50200 () Bool)

(assert (=> b!50200 (= e!32416 e!32410)))

(declare-fun b!50201 () Bool)

(assert (=> b!50201 (= e!32413 tp_is_empty!2185)))

(declare-fun b!50202 () Bool)

(declare-fun res!28945 () Bool)

(assert (=> b!50202 (=> (not res!28945) (not e!32417))))

(assert (=> b!50202 (= res!28945 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5703 newMap!16)) (_size!252 (v!2159 (underlying!127 thiss!992)))))))

(declare-fun mapNonEmpty!2182 () Bool)

(declare-fun tp!6668 () Bool)

(assert (=> mapNonEmpty!2182 (= mapRes!2181 (and tp!6668 e!32418))))

(declare-fun mapRest!2182 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapValue!2182 () ValueCell!749)

(declare-fun mapKey!2181 () (_ BitVec 32))

(assert (=> mapNonEmpty!2182 (= (arr!1559 (_values!1900 (v!2159 (underlying!127 thiss!992)))) (store mapRest!2182 mapKey!2181 mapValue!2182))))

(declare-fun b!50203 () Bool)

(assert (=> b!50203 (= e!32417 (not (= (size!1783 (_values!1900 (v!2159 (underlying!127 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5703 (v!2159 (underlying!127 thiss!992)))))))))

(assert (=> b!50204 (= e!32414 (and tp!6667 tp_is_empty!2185 (array_inv!951 (_keys!3524 newMap!16)) (array_inv!952 (_values!1900 newMap!16)) e!32412))))

(assert (= (and start!8016 res!28947) b!50193))

(assert (= (and b!50193 res!28948) b!50198))

(assert (= (and b!50198 res!28949) b!50202))

(assert (= (and b!50202 res!28945) b!50197))

(assert (= (and b!50197 res!28946) b!50203))

(assert (= (and b!50199 condMapEmpty!2181) mapIsEmpty!2182))

(assert (= (and b!50199 (not condMapEmpty!2181)) mapNonEmpty!2182))

(get-info :version)

(assert (= (and mapNonEmpty!2182 ((_ is ValueCellFull!749) mapValue!2182)) b!50194))

(assert (= (and b!50199 ((_ is ValueCellFull!749) mapDefault!2181)) b!50201))

(assert (= b!50190 b!50199))

(assert (= b!50195 b!50190))

(assert (= b!50200 b!50195))

(assert (= start!8016 b!50200))

(assert (= (and b!50192 condMapEmpty!2182) mapIsEmpty!2181))

(assert (= (and b!50192 (not condMapEmpty!2182)) mapNonEmpty!2181))

(assert (= (and mapNonEmpty!2181 ((_ is ValueCellFull!749) mapValue!2181)) b!50196))

(assert (= (and b!50192 ((_ is ValueCellFull!749) mapDefault!2182)) b!50191))

(assert (= b!50204 b!50192))

(assert (= start!8016 b!50204))

(declare-fun m!43529 () Bool)

(assert (=> mapNonEmpty!2182 m!43529))

(declare-fun m!43531 () Bool)

(assert (=> b!50190 m!43531))

(declare-fun m!43533 () Bool)

(assert (=> b!50190 m!43533))

(declare-fun m!43535 () Bool)

(assert (=> b!50198 m!43535))

(declare-fun m!43537 () Bool)

(assert (=> start!8016 m!43537))

(declare-fun m!43539 () Bool)

(assert (=> b!50197 m!43539))

(declare-fun m!43541 () Bool)

(assert (=> mapNonEmpty!2181 m!43541))

(declare-fun m!43543 () Bool)

(assert (=> b!50204 m!43543))

(declare-fun m!43545 () Bool)

(assert (=> b!50204 m!43545))

(check-sat (not mapNonEmpty!2181) (not b!50198) b_and!2749 (not start!8016) (not b!50190) (not b!50197) (not b_next!1537) tp_is_empty!2185 (not b!50204) b_and!2751 (not mapNonEmpty!2182) (not b_next!1539))
(check-sat b_and!2749 b_and!2751 (not b_next!1537) (not b_next!1539))
(get-model)

(declare-fun d!10117 () Bool)

(assert (=> d!10117 (= (validMask!0 (mask!5703 (v!2159 (underlying!127 thiss!992)))) (and (or (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000001111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000011111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000001111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000011111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000001111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000011111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000001111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000011111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000001111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000011111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000001111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000011111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000111111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000001111111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000011111111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000111111111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000001111111111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000011111111111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000111111111111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00001111111111111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00011111111111111111111111111111) (= (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50197 d!10117))

(declare-fun d!10119 () Bool)

(declare-fun res!28986 () Bool)

(declare-fun e!32499 () Bool)

(assert (=> d!10119 (=> (not res!28986) (not e!32499))))

(declare-fun simpleValid!34 (LongMapFixedSize!406) Bool)

(assert (=> d!10119 (= res!28986 (simpleValid!34 newMap!16))))

(assert (=> d!10119 (= (valid!145 newMap!16) e!32499)))

(declare-fun b!50301 () Bool)

(declare-fun res!28987 () Bool)

(assert (=> b!50301 (=> (not res!28987) (not e!32499))))

(declare-fun arrayCountValidKeys!0 (array!3261 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50301 (= res!28987 (= (arrayCountValidKeys!0 (_keys!3524 newMap!16) #b00000000000000000000000000000000 (size!1782 (_keys!3524 newMap!16))) (_size!252 newMap!16)))))

(declare-fun b!50302 () Bool)

(declare-fun res!28988 () Bool)

(assert (=> b!50302 (=> (not res!28988) (not e!32499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3261 (_ BitVec 32)) Bool)

(assert (=> b!50302 (= res!28988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3524 newMap!16) (mask!5703 newMap!16)))))

(declare-fun b!50303 () Bool)

(declare-datatypes ((List!1325 0))(
  ( (Nil!1322) (Cons!1321 (h!1901 (_ BitVec 64)) (t!4358 List!1325)) )
))
(declare-fun arrayNoDuplicates!0 (array!3261 (_ BitVec 32) List!1325) Bool)

(assert (=> b!50303 (= e!32499 (arrayNoDuplicates!0 (_keys!3524 newMap!16) #b00000000000000000000000000000000 Nil!1322))))

(assert (= (and d!10119 res!28986) b!50301))

(assert (= (and b!50301 res!28987) b!50302))

(assert (= (and b!50302 res!28988) b!50303))

(declare-fun m!43583 () Bool)

(assert (=> d!10119 m!43583))

(declare-fun m!43585 () Bool)

(assert (=> b!50301 m!43585))

(declare-fun m!43587 () Bool)

(assert (=> b!50302 m!43587))

(declare-fun m!43589 () Bool)

(assert (=> b!50303 m!43589))

(assert (=> b!50198 d!10119))

(declare-fun d!10121 () Bool)

(assert (=> d!10121 (= (array_inv!951 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) (bvsge (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50190 d!10121))

(declare-fun d!10123 () Bool)

(assert (=> d!10123 (= (array_inv!952 (_values!1900 (v!2159 (underlying!127 thiss!992)))) (bvsge (size!1783 (_values!1900 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50190 d!10123))

(declare-fun d!10125 () Bool)

(assert (=> d!10125 (= (array_inv!951 (_keys!3524 newMap!16)) (bvsge (size!1782 (_keys!3524 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50204 d!10125))

(declare-fun d!10127 () Bool)

(assert (=> d!10127 (= (array_inv!952 (_values!1900 newMap!16)) (bvsge (size!1783 (_values!1900 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50204 d!10127))

(declare-fun d!10129 () Bool)

(assert (=> d!10129 (= (valid!144 thiss!992) (valid!145 (v!2159 (underlying!127 thiss!992))))))

(declare-fun bs!2357 () Bool)

(assert (= bs!2357 d!10129))

(declare-fun m!43591 () Bool)

(assert (=> bs!2357 m!43591))

(assert (=> start!8016 d!10129))

(declare-fun b!50311 () Bool)

(declare-fun e!32505 () Bool)

(assert (=> b!50311 (= e!32505 tp_is_empty!2185)))

(declare-fun mapIsEmpty!2197 () Bool)

(declare-fun mapRes!2197 () Bool)

(assert (=> mapIsEmpty!2197 mapRes!2197))

(declare-fun b!50310 () Bool)

(declare-fun e!32504 () Bool)

(assert (=> b!50310 (= e!32504 tp_is_empty!2185)))

(declare-fun condMapEmpty!2197 () Bool)

(declare-fun mapDefault!2197 () ValueCell!749)

(assert (=> mapNonEmpty!2182 (= condMapEmpty!2197 (= mapRest!2182 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2197)))))

(assert (=> mapNonEmpty!2182 (= tp!6668 (and e!32505 mapRes!2197))))

(declare-fun mapNonEmpty!2197 () Bool)

(declare-fun tp!6697 () Bool)

(assert (=> mapNonEmpty!2197 (= mapRes!2197 (and tp!6697 e!32504))))

(declare-fun mapValue!2197 () ValueCell!749)

(declare-fun mapKey!2197 () (_ BitVec 32))

(declare-fun mapRest!2197 () (Array (_ BitVec 32) ValueCell!749))

(assert (=> mapNonEmpty!2197 (= mapRest!2182 (store mapRest!2197 mapKey!2197 mapValue!2197))))

(assert (= (and mapNonEmpty!2182 condMapEmpty!2197) mapIsEmpty!2197))

(assert (= (and mapNonEmpty!2182 (not condMapEmpty!2197)) mapNonEmpty!2197))

(assert (= (and mapNonEmpty!2197 ((_ is ValueCellFull!749) mapValue!2197)) b!50310))

(assert (= (and mapNonEmpty!2182 ((_ is ValueCellFull!749) mapDefault!2197)) b!50311))

(declare-fun m!43593 () Bool)

(assert (=> mapNonEmpty!2197 m!43593))

(declare-fun b!50313 () Bool)

(declare-fun e!32507 () Bool)

(assert (=> b!50313 (= e!32507 tp_is_empty!2185)))

(declare-fun mapIsEmpty!2198 () Bool)

(declare-fun mapRes!2198 () Bool)

(assert (=> mapIsEmpty!2198 mapRes!2198))

(declare-fun b!50312 () Bool)

(declare-fun e!32506 () Bool)

(assert (=> b!50312 (= e!32506 tp_is_empty!2185)))

(declare-fun condMapEmpty!2198 () Bool)

(declare-fun mapDefault!2198 () ValueCell!749)

(assert (=> mapNonEmpty!2181 (= condMapEmpty!2198 (= mapRest!2181 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2198)))))

(assert (=> mapNonEmpty!2181 (= tp!6669 (and e!32507 mapRes!2198))))

(declare-fun mapNonEmpty!2198 () Bool)

(declare-fun tp!6698 () Bool)

(assert (=> mapNonEmpty!2198 (= mapRes!2198 (and tp!6698 e!32506))))

(declare-fun mapKey!2198 () (_ BitVec 32))

(declare-fun mapRest!2198 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapValue!2198 () ValueCell!749)

(assert (=> mapNonEmpty!2198 (= mapRest!2181 (store mapRest!2198 mapKey!2198 mapValue!2198))))

(assert (= (and mapNonEmpty!2181 condMapEmpty!2198) mapIsEmpty!2198))

(assert (= (and mapNonEmpty!2181 (not condMapEmpty!2198)) mapNonEmpty!2198))

(assert (= (and mapNonEmpty!2198 ((_ is ValueCellFull!749) mapValue!2198)) b!50312))

(assert (= (and mapNonEmpty!2181 ((_ is ValueCellFull!749) mapDefault!2198)) b!50313))

(declare-fun m!43595 () Bool)

(assert (=> mapNonEmpty!2198 m!43595))

(check-sat (not b!50301) (not d!10119) b_and!2749 (not mapNonEmpty!2197) (not b!50303) (not b!50302) (not b_next!1537) b_and!2751 (not mapNonEmpty!2198) (not b_next!1539) (not d!10129) tp_is_empty!2185)
(check-sat b_and!2749 b_and!2751 (not b_next!1537) (not b_next!1539))
(get-model)

(declare-fun b!50325 () Bool)

(declare-fun e!32510 () Bool)

(assert (=> b!50325 (= e!32510 (and (bvsge (extraKeys!1808 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1808 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!252 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!50324 () Bool)

(declare-fun res!29000 () Bool)

(assert (=> b!50324 (=> (not res!29000) (not e!32510))))

(declare-fun size!1788 (LongMapFixedSize!406) (_ BitVec 32))

(assert (=> b!50324 (= res!29000 (= (size!1788 newMap!16) (bvadd (_size!252 newMap!16) (bvsdiv (bvadd (extraKeys!1808 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!50323 () Bool)

(declare-fun res!28998 () Bool)

(assert (=> b!50323 (=> (not res!28998) (not e!32510))))

(assert (=> b!50323 (= res!28998 (bvsge (size!1788 newMap!16) (_size!252 newMap!16)))))

(declare-fun b!50322 () Bool)

(declare-fun res!28999 () Bool)

(assert (=> b!50322 (=> (not res!28999) (not e!32510))))

(assert (=> b!50322 (= res!28999 (and (= (size!1783 (_values!1900 newMap!16)) (bvadd (mask!5703 newMap!16) #b00000000000000000000000000000001)) (= (size!1782 (_keys!3524 newMap!16)) (size!1783 (_values!1900 newMap!16))) (bvsge (_size!252 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!252 newMap!16) (bvadd (mask!5703 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!10131 () Bool)

(declare-fun res!28997 () Bool)

(assert (=> d!10131 (=> (not res!28997) (not e!32510))))

(assert (=> d!10131 (= res!28997 (validMask!0 (mask!5703 newMap!16)))))

(assert (=> d!10131 (= (simpleValid!34 newMap!16) e!32510)))

(assert (= (and d!10131 res!28997) b!50322))

(assert (= (and b!50322 res!28999) b!50323))

(assert (= (and b!50323 res!28998) b!50324))

(assert (= (and b!50324 res!29000) b!50325))

(declare-fun m!43597 () Bool)

(assert (=> b!50324 m!43597))

(assert (=> b!50323 m!43597))

(declare-fun m!43599 () Bool)

(assert (=> d!10131 m!43599))

(assert (=> d!10119 d!10131))

(declare-fun d!10133 () Bool)

(declare-fun res!29001 () Bool)

(declare-fun e!32511 () Bool)

(assert (=> d!10133 (=> (not res!29001) (not e!32511))))

(assert (=> d!10133 (= res!29001 (simpleValid!34 (v!2159 (underlying!127 thiss!992))))))

(assert (=> d!10133 (= (valid!145 (v!2159 (underlying!127 thiss!992))) e!32511)))

(declare-fun b!50326 () Bool)

(declare-fun res!29002 () Bool)

(assert (=> b!50326 (=> (not res!29002) (not e!32511))))

(assert (=> b!50326 (= res!29002 (= (arrayCountValidKeys!0 (_keys!3524 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000000 (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992))))) (_size!252 (v!2159 (underlying!127 thiss!992)))))))

(declare-fun b!50327 () Bool)

(declare-fun res!29003 () Bool)

(assert (=> b!50327 (=> (not res!29003) (not e!32511))))

(assert (=> b!50327 (= res!29003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3524 (v!2159 (underlying!127 thiss!992))) (mask!5703 (v!2159 (underlying!127 thiss!992)))))))

(declare-fun b!50328 () Bool)

(assert (=> b!50328 (= e!32511 (arrayNoDuplicates!0 (_keys!3524 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000000 Nil!1322))))

(assert (= (and d!10133 res!29001) b!50326))

(assert (= (and b!50326 res!29002) b!50327))

(assert (= (and b!50327 res!29003) b!50328))

(declare-fun m!43601 () Bool)

(assert (=> d!10133 m!43601))

(declare-fun m!43603 () Bool)

(assert (=> b!50326 m!43603))

(declare-fun m!43605 () Bool)

(assert (=> b!50327 m!43605))

(declare-fun m!43607 () Bool)

(assert (=> b!50328 m!43607))

(assert (=> d!10129 d!10133))

(declare-fun bm!3885 () Bool)

(declare-fun call!3888 () (_ BitVec 32))

(assert (=> bm!3885 (= call!3888 (arrayCountValidKeys!0 (_keys!3524 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1782 (_keys!3524 newMap!16))))))

(declare-fun b!50337 () Bool)

(declare-fun e!32516 () (_ BitVec 32))

(assert (=> b!50337 (= e!32516 call!3888)))

(declare-fun b!50339 () Bool)

(assert (=> b!50339 (= e!32516 (bvadd #b00000000000000000000000000000001 call!3888))))

(declare-fun b!50340 () Bool)

(declare-fun e!32517 () (_ BitVec 32))

(assert (=> b!50340 (= e!32517 e!32516)))

(declare-fun c!6771 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!50340 (= c!6771 (validKeyInArray!0 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10135 () Bool)

(declare-fun lt!21033 () (_ BitVec 32))

(assert (=> d!10135 (and (bvsge lt!21033 #b00000000000000000000000000000000) (bvsle lt!21033 (bvsub (size!1782 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10135 (= lt!21033 e!32517)))

(declare-fun c!6770 () Bool)

(assert (=> d!10135 (= c!6770 (bvsge #b00000000000000000000000000000000 (size!1782 (_keys!3524 newMap!16))))))

(assert (=> d!10135 (and (bvsle #b00000000000000000000000000000000 (size!1782 (_keys!3524 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1782 (_keys!3524 newMap!16)) (size!1782 (_keys!3524 newMap!16))))))

(assert (=> d!10135 (= (arrayCountValidKeys!0 (_keys!3524 newMap!16) #b00000000000000000000000000000000 (size!1782 (_keys!3524 newMap!16))) lt!21033)))

(declare-fun b!50338 () Bool)

(assert (=> b!50338 (= e!32517 #b00000000000000000000000000000000)))

(assert (= (and d!10135 c!6770) b!50338))

(assert (= (and d!10135 (not c!6770)) b!50340))

(assert (= (and b!50340 c!6771) b!50339))

(assert (= (and b!50340 (not c!6771)) b!50337))

(assert (= (or b!50339 b!50337) bm!3885))

(declare-fun m!43609 () Bool)

(assert (=> bm!3885 m!43609))

(declare-fun m!43611 () Bool)

(assert (=> b!50340 m!43611))

(assert (=> b!50340 m!43611))

(declare-fun m!43613 () Bool)

(assert (=> b!50340 m!43613))

(assert (=> b!50301 d!10135))

(declare-fun d!10137 () Bool)

(declare-fun res!29008 () Bool)

(declare-fun e!32525 () Bool)

(assert (=> d!10137 (=> res!29008 e!32525)))

(assert (=> d!10137 (= res!29008 (bvsge #b00000000000000000000000000000000 (size!1782 (_keys!3524 newMap!16))))))

(assert (=> d!10137 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3524 newMap!16) (mask!5703 newMap!16)) e!32525)))

(declare-fun b!50349 () Bool)

(declare-fun e!32524 () Bool)

(declare-fun call!3891 () Bool)

(assert (=> b!50349 (= e!32524 call!3891)))

(declare-fun b!50350 () Bool)

(declare-fun e!32526 () Bool)

(assert (=> b!50350 (= e!32525 e!32526)))

(declare-fun c!6774 () Bool)

(assert (=> b!50350 (= c!6774 (validKeyInArray!0 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50351 () Bool)

(assert (=> b!50351 (= e!32526 e!32524)))

(declare-fun lt!21041 () (_ BitVec 64))

(assert (=> b!50351 (= lt!21041 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1424 0))(
  ( (Unit!1425) )
))
(declare-fun lt!21040 () Unit!1424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3261 (_ BitVec 64) (_ BitVec 32)) Unit!1424)

(assert (=> b!50351 (= lt!21040 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3524 newMap!16) lt!21041 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!50351 (arrayContainsKey!0 (_keys!3524 newMap!16) lt!21041 #b00000000000000000000000000000000)))

(declare-fun lt!21042 () Unit!1424)

(assert (=> b!50351 (= lt!21042 lt!21040)))

(declare-fun res!29009 () Bool)

(declare-datatypes ((SeekEntryResult!222 0))(
  ( (MissingZero!222 (index!3010 (_ BitVec 32))) (Found!222 (index!3011 (_ BitVec 32))) (Intermediate!222 (undefined!1034 Bool) (index!3012 (_ BitVec 32)) (x!9207 (_ BitVec 32))) (Undefined!222) (MissingVacant!222 (index!3013 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3261 (_ BitVec 32)) SeekEntryResult!222)

(assert (=> b!50351 (= res!29009 (= (seekEntryOrOpen!0 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) (_keys!3524 newMap!16) (mask!5703 newMap!16)) (Found!222 #b00000000000000000000000000000000)))))

(assert (=> b!50351 (=> (not res!29009) (not e!32524))))

(declare-fun bm!3888 () Bool)

(assert (=> bm!3888 (= call!3891 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3524 newMap!16) (mask!5703 newMap!16)))))

(declare-fun b!50352 () Bool)

(assert (=> b!50352 (= e!32526 call!3891)))

(assert (= (and d!10137 (not res!29008)) b!50350))

(assert (= (and b!50350 c!6774) b!50351))

(assert (= (and b!50350 (not c!6774)) b!50352))

(assert (= (and b!50351 res!29009) b!50349))

(assert (= (or b!50349 b!50352) bm!3888))

(assert (=> b!50350 m!43611))

(assert (=> b!50350 m!43611))

(assert (=> b!50350 m!43613))

(assert (=> b!50351 m!43611))

(declare-fun m!43615 () Bool)

(assert (=> b!50351 m!43615))

(declare-fun m!43617 () Bool)

(assert (=> b!50351 m!43617))

(assert (=> b!50351 m!43611))

(declare-fun m!43619 () Bool)

(assert (=> b!50351 m!43619))

(declare-fun m!43621 () Bool)

(assert (=> bm!3888 m!43621))

(assert (=> b!50302 d!10137))

(declare-fun b!50364 () Bool)

(declare-fun e!32536 () Bool)

(declare-fun e!32537 () Bool)

(assert (=> b!50364 (= e!32536 e!32537)))

(declare-fun res!29017 () Bool)

(assert (=> b!50364 (=> (not res!29017) (not e!32537))))

(declare-fun e!32538 () Bool)

(assert (=> b!50364 (= res!29017 (not e!32538))))

(declare-fun res!29016 () Bool)

(assert (=> b!50364 (=> (not res!29016) (not e!32538))))

(assert (=> b!50364 (= res!29016 (validKeyInArray!0 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50365 () Bool)

(declare-fun e!32535 () Bool)

(declare-fun call!3894 () Bool)

(assert (=> b!50365 (= e!32535 call!3894)))

(declare-fun b!50366 () Bool)

(assert (=> b!50366 (= e!32537 e!32535)))

(declare-fun c!6777 () Bool)

(assert (=> b!50366 (= c!6777 (validKeyInArray!0 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3891 () Bool)

(assert (=> bm!3891 (= call!3894 (arrayNoDuplicates!0 (_keys!3524 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6777 (Cons!1321 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) Nil!1322) Nil!1322)))))

(declare-fun b!50367 () Bool)

(declare-fun contains!615 (List!1325 (_ BitVec 64)) Bool)

(assert (=> b!50367 (= e!32538 (contains!615 Nil!1322 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10139 () Bool)

(declare-fun res!29018 () Bool)

(assert (=> d!10139 (=> res!29018 e!32536)))

(assert (=> d!10139 (= res!29018 (bvsge #b00000000000000000000000000000000 (size!1782 (_keys!3524 newMap!16))))))

(assert (=> d!10139 (= (arrayNoDuplicates!0 (_keys!3524 newMap!16) #b00000000000000000000000000000000 Nil!1322) e!32536)))

(declare-fun b!50363 () Bool)

(assert (=> b!50363 (= e!32535 call!3894)))

(assert (= (and d!10139 (not res!29018)) b!50364))

(assert (= (and b!50364 res!29016) b!50367))

(assert (= (and b!50364 res!29017) b!50366))

(assert (= (and b!50366 c!6777) b!50365))

(assert (= (and b!50366 (not c!6777)) b!50363))

(assert (= (or b!50365 b!50363) bm!3891))

(assert (=> b!50364 m!43611))

(assert (=> b!50364 m!43611))

(assert (=> b!50364 m!43613))

(assert (=> b!50366 m!43611))

(assert (=> b!50366 m!43611))

(assert (=> b!50366 m!43613))

(assert (=> bm!3891 m!43611))

(declare-fun m!43623 () Bool)

(assert (=> bm!3891 m!43623))

(assert (=> b!50367 m!43611))

(assert (=> b!50367 m!43611))

(declare-fun m!43625 () Bool)

(assert (=> b!50367 m!43625))

(assert (=> b!50303 d!10139))

(declare-fun b!50369 () Bool)

(declare-fun e!32540 () Bool)

(assert (=> b!50369 (= e!32540 tp_is_empty!2185)))

(declare-fun mapIsEmpty!2199 () Bool)

(declare-fun mapRes!2199 () Bool)

(assert (=> mapIsEmpty!2199 mapRes!2199))

(declare-fun b!50368 () Bool)

(declare-fun e!32539 () Bool)

(assert (=> b!50368 (= e!32539 tp_is_empty!2185)))

(declare-fun condMapEmpty!2199 () Bool)

(declare-fun mapDefault!2199 () ValueCell!749)

(assert (=> mapNonEmpty!2198 (= condMapEmpty!2199 (= mapRest!2198 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2199)))))

(assert (=> mapNonEmpty!2198 (= tp!6698 (and e!32540 mapRes!2199))))

(declare-fun mapNonEmpty!2199 () Bool)

(declare-fun tp!6699 () Bool)

(assert (=> mapNonEmpty!2199 (= mapRes!2199 (and tp!6699 e!32539))))

(declare-fun mapRest!2199 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapKey!2199 () (_ BitVec 32))

(declare-fun mapValue!2199 () ValueCell!749)

(assert (=> mapNonEmpty!2199 (= mapRest!2198 (store mapRest!2199 mapKey!2199 mapValue!2199))))

(assert (= (and mapNonEmpty!2198 condMapEmpty!2199) mapIsEmpty!2199))

(assert (= (and mapNonEmpty!2198 (not condMapEmpty!2199)) mapNonEmpty!2199))

(assert (= (and mapNonEmpty!2199 ((_ is ValueCellFull!749) mapValue!2199)) b!50368))

(assert (= (and mapNonEmpty!2198 ((_ is ValueCellFull!749) mapDefault!2199)) b!50369))

(declare-fun m!43627 () Bool)

(assert (=> mapNonEmpty!2199 m!43627))

(declare-fun b!50371 () Bool)

(declare-fun e!32542 () Bool)

(assert (=> b!50371 (= e!32542 tp_is_empty!2185)))

(declare-fun mapIsEmpty!2200 () Bool)

(declare-fun mapRes!2200 () Bool)

(assert (=> mapIsEmpty!2200 mapRes!2200))

(declare-fun b!50370 () Bool)

(declare-fun e!32541 () Bool)

(assert (=> b!50370 (= e!32541 tp_is_empty!2185)))

(declare-fun condMapEmpty!2200 () Bool)

(declare-fun mapDefault!2200 () ValueCell!749)

(assert (=> mapNonEmpty!2197 (= condMapEmpty!2200 (= mapRest!2197 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2200)))))

(assert (=> mapNonEmpty!2197 (= tp!6697 (and e!32542 mapRes!2200))))

(declare-fun mapNonEmpty!2200 () Bool)

(declare-fun tp!6700 () Bool)

(assert (=> mapNonEmpty!2200 (= mapRes!2200 (and tp!6700 e!32541))))

(declare-fun mapKey!2200 () (_ BitVec 32))

(declare-fun mapRest!2200 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapValue!2200 () ValueCell!749)

(assert (=> mapNonEmpty!2200 (= mapRest!2197 (store mapRest!2200 mapKey!2200 mapValue!2200))))

(assert (= (and mapNonEmpty!2197 condMapEmpty!2200) mapIsEmpty!2200))

(assert (= (and mapNonEmpty!2197 (not condMapEmpty!2200)) mapNonEmpty!2200))

(assert (= (and mapNonEmpty!2200 ((_ is ValueCellFull!749) mapValue!2200)) b!50370))

(assert (= (and mapNonEmpty!2197 ((_ is ValueCellFull!749) mapDefault!2200)) b!50371))

(declare-fun m!43629 () Bool)

(assert (=> mapNonEmpty!2200 m!43629))

(check-sat (not b!50324) (not b!50327) (not b!50351) (not b!50326) (not b!50323) b_and!2749 (not bm!3891) (not b_next!1537) tp_is_empty!2185 (not mapNonEmpty!2200) (not bm!3888) b_and!2751 (not bm!3885) (not b!50366) (not b!50364) (not b!50340) (not d!10133) (not b_next!1539) (not b!50328) (not mapNonEmpty!2199) (not d!10131) (not b!50367) (not b!50350))
(check-sat b_and!2749 b_and!2751 (not b_next!1537) (not b_next!1539))
(get-model)

(declare-fun d!10141 () Bool)

(declare-fun res!29019 () Bool)

(declare-fun e!32544 () Bool)

(assert (=> d!10141 (=> res!29019 e!32544)))

(assert (=> d!10141 (= res!29019 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1782 (_keys!3524 newMap!16))))))

(assert (=> d!10141 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3524 newMap!16) (mask!5703 newMap!16)) e!32544)))

(declare-fun b!50372 () Bool)

(declare-fun e!32543 () Bool)

(declare-fun call!3895 () Bool)

(assert (=> b!50372 (= e!32543 call!3895)))

(declare-fun b!50373 () Bool)

(declare-fun e!32545 () Bool)

(assert (=> b!50373 (= e!32544 e!32545)))

(declare-fun c!6778 () Bool)

(assert (=> b!50373 (= c!6778 (validKeyInArray!0 (select (arr!1558 (_keys!3524 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50374 () Bool)

(assert (=> b!50374 (= e!32545 e!32543)))

(declare-fun lt!21044 () (_ BitVec 64))

(assert (=> b!50374 (= lt!21044 (select (arr!1558 (_keys!3524 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21043 () Unit!1424)

(assert (=> b!50374 (= lt!21043 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3524 newMap!16) lt!21044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!50374 (arrayContainsKey!0 (_keys!3524 newMap!16) lt!21044 #b00000000000000000000000000000000)))

(declare-fun lt!21045 () Unit!1424)

(assert (=> b!50374 (= lt!21045 lt!21043)))

(declare-fun res!29020 () Bool)

(assert (=> b!50374 (= res!29020 (= (seekEntryOrOpen!0 (select (arr!1558 (_keys!3524 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3524 newMap!16) (mask!5703 newMap!16)) (Found!222 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!50374 (=> (not res!29020) (not e!32543))))

(declare-fun bm!3892 () Bool)

(assert (=> bm!3892 (= call!3895 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3524 newMap!16) (mask!5703 newMap!16)))))

(declare-fun b!50375 () Bool)

(assert (=> b!50375 (= e!32545 call!3895)))

(assert (= (and d!10141 (not res!29019)) b!50373))

(assert (= (and b!50373 c!6778) b!50374))

(assert (= (and b!50373 (not c!6778)) b!50375))

(assert (= (and b!50374 res!29020) b!50372))

(assert (= (or b!50372 b!50375) bm!3892))

(declare-fun m!43631 () Bool)

(assert (=> b!50373 m!43631))

(assert (=> b!50373 m!43631))

(declare-fun m!43633 () Bool)

(assert (=> b!50373 m!43633))

(assert (=> b!50374 m!43631))

(declare-fun m!43635 () Bool)

(assert (=> b!50374 m!43635))

(declare-fun m!43637 () Bool)

(assert (=> b!50374 m!43637))

(assert (=> b!50374 m!43631))

(declare-fun m!43639 () Bool)

(assert (=> b!50374 m!43639))

(declare-fun m!43641 () Bool)

(assert (=> bm!3892 m!43641))

(assert (=> bm!3888 d!10141))

(declare-fun d!10143 () Bool)

(declare-fun res!29021 () Bool)

(declare-fun e!32547 () Bool)

(assert (=> d!10143 (=> res!29021 e!32547)))

(assert (=> d!10143 (= res!29021 (bvsge #b00000000000000000000000000000000 (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992))))))))

(assert (=> d!10143 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3524 (v!2159 (underlying!127 thiss!992))) (mask!5703 (v!2159 (underlying!127 thiss!992)))) e!32547)))

(declare-fun b!50376 () Bool)

(declare-fun e!32546 () Bool)

(declare-fun call!3896 () Bool)

(assert (=> b!50376 (= e!32546 call!3896)))

(declare-fun b!50377 () Bool)

(declare-fun e!32548 () Bool)

(assert (=> b!50377 (= e!32547 e!32548)))

(declare-fun c!6779 () Bool)

(assert (=> b!50377 (= c!6779 (validKeyInArray!0 (select (arr!1558 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50378 () Bool)

(assert (=> b!50378 (= e!32548 e!32546)))

(declare-fun lt!21047 () (_ BitVec 64))

(assert (=> b!50378 (= lt!21047 (select (arr!1558 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21046 () Unit!1424)

(assert (=> b!50378 (= lt!21046 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3524 (v!2159 (underlying!127 thiss!992))) lt!21047 #b00000000000000000000000000000000))))

(assert (=> b!50378 (arrayContainsKey!0 (_keys!3524 (v!2159 (underlying!127 thiss!992))) lt!21047 #b00000000000000000000000000000000)))

(declare-fun lt!21048 () Unit!1424)

(assert (=> b!50378 (= lt!21048 lt!21046)))

(declare-fun res!29022 () Bool)

(assert (=> b!50378 (= res!29022 (= (seekEntryOrOpen!0 (select (arr!1558 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000) (_keys!3524 (v!2159 (underlying!127 thiss!992))) (mask!5703 (v!2159 (underlying!127 thiss!992)))) (Found!222 #b00000000000000000000000000000000)))))

(assert (=> b!50378 (=> (not res!29022) (not e!32546))))

(declare-fun bm!3893 () Bool)

(assert (=> bm!3893 (= call!3896 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3524 (v!2159 (underlying!127 thiss!992))) (mask!5703 (v!2159 (underlying!127 thiss!992)))))))

(declare-fun b!50379 () Bool)

(assert (=> b!50379 (= e!32548 call!3896)))

(assert (= (and d!10143 (not res!29021)) b!50377))

(assert (= (and b!50377 c!6779) b!50378))

(assert (= (and b!50377 (not c!6779)) b!50379))

(assert (= (and b!50378 res!29022) b!50376))

(assert (= (or b!50376 b!50379) bm!3893))

(declare-fun m!43643 () Bool)

(assert (=> b!50377 m!43643))

(assert (=> b!50377 m!43643))

(declare-fun m!43645 () Bool)

(assert (=> b!50377 m!43645))

(assert (=> b!50378 m!43643))

(declare-fun m!43647 () Bool)

(assert (=> b!50378 m!43647))

(declare-fun m!43649 () Bool)

(assert (=> b!50378 m!43649))

(assert (=> b!50378 m!43643))

(declare-fun m!43651 () Bool)

(assert (=> b!50378 m!43651))

(declare-fun m!43653 () Bool)

(assert (=> bm!3893 m!43653))

(assert (=> b!50327 d!10143))

(declare-fun b!50381 () Bool)

(declare-fun e!32550 () Bool)

(declare-fun e!32551 () Bool)

(assert (=> b!50381 (= e!32550 e!32551)))

(declare-fun res!29024 () Bool)

(assert (=> b!50381 (=> (not res!29024) (not e!32551))))

(declare-fun e!32552 () Bool)

(assert (=> b!50381 (= res!29024 (not e!32552))))

(declare-fun res!29023 () Bool)

(assert (=> b!50381 (=> (not res!29023) (not e!32552))))

(assert (=> b!50381 (= res!29023 (validKeyInArray!0 (select (arr!1558 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50382 () Bool)

(declare-fun e!32549 () Bool)

(declare-fun call!3897 () Bool)

(assert (=> b!50382 (= e!32549 call!3897)))

(declare-fun b!50383 () Bool)

(assert (=> b!50383 (= e!32551 e!32549)))

(declare-fun c!6780 () Bool)

(assert (=> b!50383 (= c!6780 (validKeyInArray!0 (select (arr!1558 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3894 () Bool)

(assert (=> bm!3894 (= call!3897 (arrayNoDuplicates!0 (_keys!3524 (v!2159 (underlying!127 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6780 (Cons!1321 (select (arr!1558 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000) Nil!1322) Nil!1322)))))

(declare-fun b!50384 () Bool)

(assert (=> b!50384 (= e!32552 (contains!615 Nil!1322 (select (arr!1558 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10145 () Bool)

(declare-fun res!29025 () Bool)

(assert (=> d!10145 (=> res!29025 e!32550)))

(assert (=> d!10145 (= res!29025 (bvsge #b00000000000000000000000000000000 (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992))))))))

(assert (=> d!10145 (= (arrayNoDuplicates!0 (_keys!3524 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000000 Nil!1322) e!32550)))

(declare-fun b!50380 () Bool)

(assert (=> b!50380 (= e!32549 call!3897)))

(assert (= (and d!10145 (not res!29025)) b!50381))

(assert (= (and b!50381 res!29023) b!50384))

(assert (= (and b!50381 res!29024) b!50383))

(assert (= (and b!50383 c!6780) b!50382))

(assert (= (and b!50383 (not c!6780)) b!50380))

(assert (= (or b!50382 b!50380) bm!3894))

(assert (=> b!50381 m!43643))

(assert (=> b!50381 m!43643))

(assert (=> b!50381 m!43645))

(assert (=> b!50383 m!43643))

(assert (=> b!50383 m!43643))

(assert (=> b!50383 m!43645))

(assert (=> bm!3894 m!43643))

(declare-fun m!43655 () Bool)

(assert (=> bm!3894 m!43655))

(assert (=> b!50384 m!43643))

(assert (=> b!50384 m!43643))

(declare-fun m!43657 () Bool)

(assert (=> b!50384 m!43657))

(assert (=> b!50328 d!10145))

(declare-fun d!10147 () Bool)

(assert (=> d!10147 (= (validMask!0 (mask!5703 newMap!16)) (and (or (= (mask!5703 newMap!16) #b00000000000000000000000000000111) (= (mask!5703 newMap!16) #b00000000000000000000000000001111) (= (mask!5703 newMap!16) #b00000000000000000000000000011111) (= (mask!5703 newMap!16) #b00000000000000000000000000111111) (= (mask!5703 newMap!16) #b00000000000000000000000001111111) (= (mask!5703 newMap!16) #b00000000000000000000000011111111) (= (mask!5703 newMap!16) #b00000000000000000000000111111111) (= (mask!5703 newMap!16) #b00000000000000000000001111111111) (= (mask!5703 newMap!16) #b00000000000000000000011111111111) (= (mask!5703 newMap!16) #b00000000000000000000111111111111) (= (mask!5703 newMap!16) #b00000000000000000001111111111111) (= (mask!5703 newMap!16) #b00000000000000000011111111111111) (= (mask!5703 newMap!16) #b00000000000000000111111111111111) (= (mask!5703 newMap!16) #b00000000000000001111111111111111) (= (mask!5703 newMap!16) #b00000000000000011111111111111111) (= (mask!5703 newMap!16) #b00000000000000111111111111111111) (= (mask!5703 newMap!16) #b00000000000001111111111111111111) (= (mask!5703 newMap!16) #b00000000000011111111111111111111) (= (mask!5703 newMap!16) #b00000000000111111111111111111111) (= (mask!5703 newMap!16) #b00000000001111111111111111111111) (= (mask!5703 newMap!16) #b00000000011111111111111111111111) (= (mask!5703 newMap!16) #b00000000111111111111111111111111) (= (mask!5703 newMap!16) #b00000001111111111111111111111111) (= (mask!5703 newMap!16) #b00000011111111111111111111111111) (= (mask!5703 newMap!16) #b00000111111111111111111111111111) (= (mask!5703 newMap!16) #b00001111111111111111111111111111) (= (mask!5703 newMap!16) #b00011111111111111111111111111111) (= (mask!5703 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5703 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10131 d!10147))

(declare-fun bm!3895 () Bool)

(declare-fun call!3898 () (_ BitVec 32))

(assert (=> bm!3895 (= call!3898 (arrayCountValidKeys!0 (_keys!3524 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1782 (_keys!3524 newMap!16))))))

(declare-fun b!50385 () Bool)

(declare-fun e!32553 () (_ BitVec 32))

(assert (=> b!50385 (= e!32553 call!3898)))

(declare-fun b!50387 () Bool)

(assert (=> b!50387 (= e!32553 (bvadd #b00000000000000000000000000000001 call!3898))))

(declare-fun b!50388 () Bool)

(declare-fun e!32554 () (_ BitVec 32))

(assert (=> b!50388 (= e!32554 e!32553)))

(declare-fun c!6782 () Bool)

(assert (=> b!50388 (= c!6782 (validKeyInArray!0 (select (arr!1558 (_keys!3524 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10149 () Bool)

(declare-fun lt!21049 () (_ BitVec 32))

(assert (=> d!10149 (and (bvsge lt!21049 #b00000000000000000000000000000000) (bvsle lt!21049 (bvsub (size!1782 (_keys!3524 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!10149 (= lt!21049 e!32554)))

(declare-fun c!6781 () Bool)

(assert (=> d!10149 (= c!6781 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1782 (_keys!3524 newMap!16))))))

(assert (=> d!10149 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1782 (_keys!3524 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1782 (_keys!3524 newMap!16)) (size!1782 (_keys!3524 newMap!16))))))

(assert (=> d!10149 (= (arrayCountValidKeys!0 (_keys!3524 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1782 (_keys!3524 newMap!16))) lt!21049)))

(declare-fun b!50386 () Bool)

(assert (=> b!50386 (= e!32554 #b00000000000000000000000000000000)))

(assert (= (and d!10149 c!6781) b!50386))

(assert (= (and d!10149 (not c!6781)) b!50388))

(assert (= (and b!50388 c!6782) b!50387))

(assert (= (and b!50388 (not c!6782)) b!50385))

(assert (= (or b!50387 b!50385) bm!3895))

(declare-fun m!43659 () Bool)

(assert (=> bm!3895 m!43659))

(assert (=> b!50388 m!43631))

(assert (=> b!50388 m!43631))

(assert (=> b!50388 m!43633))

(assert (=> bm!3885 d!10149))

(declare-fun d!10151 () Bool)

(assert (=> d!10151 (= (validKeyInArray!0 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!50364 d!10151))

(assert (=> b!50366 d!10151))

(declare-fun b!50392 () Bool)

(declare-fun e!32555 () Bool)

(assert (=> b!50392 (= e!32555 (and (bvsge (extraKeys!1808 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1808 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!252 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50391 () Bool)

(declare-fun res!29029 () Bool)

(assert (=> b!50391 (=> (not res!29029) (not e!32555))))

(assert (=> b!50391 (= res!29029 (= (size!1788 (v!2159 (underlying!127 thiss!992))) (bvadd (_size!252 (v!2159 (underlying!127 thiss!992))) (bvsdiv (bvadd (extraKeys!1808 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!50390 () Bool)

(declare-fun res!29027 () Bool)

(assert (=> b!50390 (=> (not res!29027) (not e!32555))))

(assert (=> b!50390 (= res!29027 (bvsge (size!1788 (v!2159 (underlying!127 thiss!992))) (_size!252 (v!2159 (underlying!127 thiss!992)))))))

(declare-fun b!50389 () Bool)

(declare-fun res!29028 () Bool)

(assert (=> b!50389 (=> (not res!29028) (not e!32555))))

(assert (=> b!50389 (= res!29028 (and (= (size!1783 (_values!1900 (v!2159 (underlying!127 thiss!992)))) (bvadd (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000001)) (= (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) (size!1783 (_values!1900 (v!2159 (underlying!127 thiss!992))))) (bvsge (_size!252 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!252 (v!2159 (underlying!127 thiss!992))) (bvadd (mask!5703 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun d!10153 () Bool)

(declare-fun res!29026 () Bool)

(assert (=> d!10153 (=> (not res!29026) (not e!32555))))

(assert (=> d!10153 (= res!29026 (validMask!0 (mask!5703 (v!2159 (underlying!127 thiss!992)))))))

(assert (=> d!10153 (= (simpleValid!34 (v!2159 (underlying!127 thiss!992))) e!32555)))

(assert (= (and d!10153 res!29026) b!50389))

(assert (= (and b!50389 res!29028) b!50390))

(assert (= (and b!50390 res!29027) b!50391))

(assert (= (and b!50391 res!29029) b!50392))

(declare-fun m!43661 () Bool)

(assert (=> b!50391 m!43661))

(assert (=> b!50390 m!43661))

(assert (=> d!10153 m!43539))

(assert (=> d!10133 d!10153))

(assert (=> b!50340 d!10151))

(declare-fun b!50394 () Bool)

(declare-fun e!32557 () Bool)

(declare-fun e!32558 () Bool)

(assert (=> b!50394 (= e!32557 e!32558)))

(declare-fun res!29031 () Bool)

(assert (=> b!50394 (=> (not res!29031) (not e!32558))))

(declare-fun e!32559 () Bool)

(assert (=> b!50394 (= res!29031 (not e!32559))))

(declare-fun res!29030 () Bool)

(assert (=> b!50394 (=> (not res!29030) (not e!32559))))

(assert (=> b!50394 (= res!29030 (validKeyInArray!0 (select (arr!1558 (_keys!3524 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50395 () Bool)

(declare-fun e!32556 () Bool)

(declare-fun call!3899 () Bool)

(assert (=> b!50395 (= e!32556 call!3899)))

(declare-fun b!50396 () Bool)

(assert (=> b!50396 (= e!32558 e!32556)))

(declare-fun c!6783 () Bool)

(assert (=> b!50396 (= c!6783 (validKeyInArray!0 (select (arr!1558 (_keys!3524 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3896 () Bool)

(assert (=> bm!3896 (= call!3899 (arrayNoDuplicates!0 (_keys!3524 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6783 (Cons!1321 (select (arr!1558 (_keys!3524 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6777 (Cons!1321 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) Nil!1322) Nil!1322)) (ite c!6777 (Cons!1321 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) Nil!1322) Nil!1322))))))

(declare-fun b!50397 () Bool)

(assert (=> b!50397 (= e!32559 (contains!615 (ite c!6777 (Cons!1321 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) Nil!1322) Nil!1322) (select (arr!1558 (_keys!3524 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10155 () Bool)

(declare-fun res!29032 () Bool)

(assert (=> d!10155 (=> res!29032 e!32557)))

(assert (=> d!10155 (= res!29032 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1782 (_keys!3524 newMap!16))))))

(assert (=> d!10155 (= (arrayNoDuplicates!0 (_keys!3524 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6777 (Cons!1321 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) Nil!1322) Nil!1322)) e!32557)))

(declare-fun b!50393 () Bool)

(assert (=> b!50393 (= e!32556 call!3899)))

(assert (= (and d!10155 (not res!29032)) b!50394))

(assert (= (and b!50394 res!29030) b!50397))

(assert (= (and b!50394 res!29031) b!50396))

(assert (= (and b!50396 c!6783) b!50395))

(assert (= (and b!50396 (not c!6783)) b!50393))

(assert (= (or b!50395 b!50393) bm!3896))

(assert (=> b!50394 m!43631))

(assert (=> b!50394 m!43631))

(assert (=> b!50394 m!43633))

(assert (=> b!50396 m!43631))

(assert (=> b!50396 m!43631))

(assert (=> b!50396 m!43633))

(assert (=> bm!3896 m!43631))

(declare-fun m!43663 () Bool)

(assert (=> bm!3896 m!43663))

(assert (=> b!50397 m!43631))

(assert (=> b!50397 m!43631))

(declare-fun m!43665 () Bool)

(assert (=> b!50397 m!43665))

(assert (=> bm!3891 d!10155))

(declare-fun d!10157 () Bool)

(declare-fun lt!21052 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!56 (List!1325) (InoxSet (_ BitVec 64)))

(assert (=> d!10157 (= lt!21052 (select (content!56 Nil!1322) (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32564 () Bool)

(assert (=> d!10157 (= lt!21052 e!32564)))

(declare-fun res!29038 () Bool)

(assert (=> d!10157 (=> (not res!29038) (not e!32564))))

(assert (=> d!10157 (= res!29038 ((_ is Cons!1321) Nil!1322))))

(assert (=> d!10157 (= (contains!615 Nil!1322 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)) lt!21052)))

(declare-fun b!50402 () Bool)

(declare-fun e!32565 () Bool)

(assert (=> b!50402 (= e!32564 e!32565)))

(declare-fun res!29037 () Bool)

(assert (=> b!50402 (=> res!29037 e!32565)))

(assert (=> b!50402 (= res!29037 (= (h!1901 Nil!1322) (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50403 () Bool)

(assert (=> b!50403 (= e!32565 (contains!615 (t!4358 Nil!1322) (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10157 res!29038) b!50402))

(assert (= (and b!50402 (not res!29037)) b!50403))

(declare-fun m!43667 () Bool)

(assert (=> d!10157 m!43667))

(assert (=> d!10157 m!43611))

(declare-fun m!43669 () Bool)

(assert (=> d!10157 m!43669))

(assert (=> b!50403 m!43611))

(declare-fun m!43671 () Bool)

(assert (=> b!50403 m!43671))

(assert (=> b!50367 d!10157))

(declare-fun d!10159 () Bool)

(assert (=> d!10159 (= (size!1788 newMap!16) (bvadd (_size!252 newMap!16) (bvsdiv (bvadd (extraKeys!1808 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!50323 d!10159))

(assert (=> b!50324 d!10159))

(assert (=> b!50350 d!10151))

(declare-fun d!10161 () Bool)

(assert (=> d!10161 (arrayContainsKey!0 (_keys!3524 newMap!16) lt!21041 #b00000000000000000000000000000000)))

(declare-fun lt!21055 () Unit!1424)

(declare-fun choose!13 (array!3261 (_ BitVec 64) (_ BitVec 32)) Unit!1424)

(assert (=> d!10161 (= lt!21055 (choose!13 (_keys!3524 newMap!16) lt!21041 #b00000000000000000000000000000000))))

(assert (=> d!10161 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10161 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3524 newMap!16) lt!21041 #b00000000000000000000000000000000) lt!21055)))

(declare-fun bs!2358 () Bool)

(assert (= bs!2358 d!10161))

(assert (=> bs!2358 m!43617))

(declare-fun m!43673 () Bool)

(assert (=> bs!2358 m!43673))

(assert (=> b!50351 d!10161))

(declare-fun d!10163 () Bool)

(declare-fun res!29043 () Bool)

(declare-fun e!32570 () Bool)

(assert (=> d!10163 (=> res!29043 e!32570)))

(assert (=> d!10163 (= res!29043 (= (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) lt!21041))))

(assert (=> d!10163 (= (arrayContainsKey!0 (_keys!3524 newMap!16) lt!21041 #b00000000000000000000000000000000) e!32570)))

(declare-fun b!50408 () Bool)

(declare-fun e!32571 () Bool)

(assert (=> b!50408 (= e!32570 e!32571)))

(declare-fun res!29044 () Bool)

(assert (=> b!50408 (=> (not res!29044) (not e!32571))))

(assert (=> b!50408 (= res!29044 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1782 (_keys!3524 newMap!16))))))

(declare-fun b!50409 () Bool)

(assert (=> b!50409 (= e!32571 (arrayContainsKey!0 (_keys!3524 newMap!16) lt!21041 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10163 (not res!29043)) b!50408))

(assert (= (and b!50408 res!29044) b!50409))

(assert (=> d!10163 m!43611))

(declare-fun m!43675 () Bool)

(assert (=> b!50409 m!43675))

(assert (=> b!50351 d!10163))

(declare-fun d!10165 () Bool)

(declare-fun lt!21062 () SeekEntryResult!222)

(assert (=> d!10165 (and (or ((_ is Undefined!222) lt!21062) (not ((_ is Found!222) lt!21062)) (and (bvsge (index!3011 lt!21062) #b00000000000000000000000000000000) (bvslt (index!3011 lt!21062) (size!1782 (_keys!3524 newMap!16))))) (or ((_ is Undefined!222) lt!21062) ((_ is Found!222) lt!21062) (not ((_ is MissingZero!222) lt!21062)) (and (bvsge (index!3010 lt!21062) #b00000000000000000000000000000000) (bvslt (index!3010 lt!21062) (size!1782 (_keys!3524 newMap!16))))) (or ((_ is Undefined!222) lt!21062) ((_ is Found!222) lt!21062) ((_ is MissingZero!222) lt!21062) (not ((_ is MissingVacant!222) lt!21062)) (and (bvsge (index!3013 lt!21062) #b00000000000000000000000000000000) (bvslt (index!3013 lt!21062) (size!1782 (_keys!3524 newMap!16))))) (or ((_ is Undefined!222) lt!21062) (ite ((_ is Found!222) lt!21062) (= (select (arr!1558 (_keys!3524 newMap!16)) (index!3011 lt!21062)) (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!222) lt!21062) (= (select (arr!1558 (_keys!3524 newMap!16)) (index!3010 lt!21062)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!222) lt!21062) (= (select (arr!1558 (_keys!3524 newMap!16)) (index!3013 lt!21062)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!32578 () SeekEntryResult!222)

(assert (=> d!10165 (= lt!21062 e!32578)))

(declare-fun c!6792 () Bool)

(declare-fun lt!21063 () SeekEntryResult!222)

(assert (=> d!10165 (= c!6792 (and ((_ is Intermediate!222) lt!21063) (undefined!1034 lt!21063)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3261 (_ BitVec 32)) SeekEntryResult!222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10165 (= lt!21063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) (mask!5703 newMap!16)) (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) (_keys!3524 newMap!16) (mask!5703 newMap!16)))))

(assert (=> d!10165 (validMask!0 (mask!5703 newMap!16))))

(assert (=> d!10165 (= (seekEntryOrOpen!0 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) (_keys!3524 newMap!16) (mask!5703 newMap!16)) lt!21062)))

(declare-fun b!50422 () Bool)

(declare-fun e!32580 () SeekEntryResult!222)

(assert (=> b!50422 (= e!32578 e!32580)))

(declare-fun lt!21064 () (_ BitVec 64))

(assert (=> b!50422 (= lt!21064 (select (arr!1558 (_keys!3524 newMap!16)) (index!3012 lt!21063)))))

(declare-fun c!6791 () Bool)

(assert (=> b!50422 (= c!6791 (= lt!21064 (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50423 () Bool)

(assert (=> b!50423 (= e!32578 Undefined!222)))

(declare-fun b!50424 () Bool)

(declare-fun e!32579 () SeekEntryResult!222)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3261 (_ BitVec 32)) SeekEntryResult!222)

(assert (=> b!50424 (= e!32579 (seekKeyOrZeroReturnVacant!0 (x!9207 lt!21063) (index!3012 lt!21063) (index!3012 lt!21063) (select (arr!1558 (_keys!3524 newMap!16)) #b00000000000000000000000000000000) (_keys!3524 newMap!16) (mask!5703 newMap!16)))))

(declare-fun b!50425 () Bool)

(declare-fun c!6790 () Bool)

(assert (=> b!50425 (= c!6790 (= lt!21064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!50425 (= e!32580 e!32579)))

(declare-fun b!50426 () Bool)

(assert (=> b!50426 (= e!32579 (MissingZero!222 (index!3012 lt!21063)))))

(declare-fun b!50427 () Bool)

(assert (=> b!50427 (= e!32580 (Found!222 (index!3012 lt!21063)))))

(assert (= (and d!10165 c!6792) b!50423))

(assert (= (and d!10165 (not c!6792)) b!50422))

(assert (= (and b!50422 c!6791) b!50427))

(assert (= (and b!50422 (not c!6791)) b!50425))

(assert (= (and b!50425 c!6790) b!50426))

(assert (= (and b!50425 (not c!6790)) b!50424))

(declare-fun m!43677 () Bool)

(assert (=> d!10165 m!43677))

(assert (=> d!10165 m!43611))

(declare-fun m!43679 () Bool)

(assert (=> d!10165 m!43679))

(assert (=> d!10165 m!43599))

(assert (=> d!10165 m!43679))

(assert (=> d!10165 m!43611))

(declare-fun m!43681 () Bool)

(assert (=> d!10165 m!43681))

(declare-fun m!43683 () Bool)

(assert (=> d!10165 m!43683))

(declare-fun m!43685 () Bool)

(assert (=> d!10165 m!43685))

(declare-fun m!43687 () Bool)

(assert (=> b!50422 m!43687))

(assert (=> b!50424 m!43611))

(declare-fun m!43689 () Bool)

(assert (=> b!50424 m!43689))

(assert (=> b!50351 d!10165))

(declare-fun bm!3897 () Bool)

(declare-fun call!3900 () (_ BitVec 32))

(assert (=> bm!3897 (= call!3900 (arrayCountValidKeys!0 (_keys!3524 (v!2159 (underlying!127 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992))))))))

(declare-fun b!50428 () Bool)

(declare-fun e!32581 () (_ BitVec 32))

(assert (=> b!50428 (= e!32581 call!3900)))

(declare-fun b!50430 () Bool)

(assert (=> b!50430 (= e!32581 (bvadd #b00000000000000000000000000000001 call!3900))))

(declare-fun b!50431 () Bool)

(declare-fun e!32582 () (_ BitVec 32))

(assert (=> b!50431 (= e!32582 e!32581)))

(declare-fun c!6794 () Bool)

(assert (=> b!50431 (= c!6794 (validKeyInArray!0 (select (arr!1558 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10167 () Bool)

(declare-fun lt!21065 () (_ BitVec 32))

(assert (=> d!10167 (and (bvsge lt!21065 #b00000000000000000000000000000000) (bvsle lt!21065 (bvsub (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!10167 (= lt!21065 e!32582)))

(declare-fun c!6793 () Bool)

(assert (=> d!10167 (= c!6793 (bvsge #b00000000000000000000000000000000 (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992))))))))

(assert (=> d!10167 (and (bvsle #b00000000000000000000000000000000 (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992)))) (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992))))))))

(assert (=> d!10167 (= (arrayCountValidKeys!0 (_keys!3524 (v!2159 (underlying!127 thiss!992))) #b00000000000000000000000000000000 (size!1782 (_keys!3524 (v!2159 (underlying!127 thiss!992))))) lt!21065)))

(declare-fun b!50429 () Bool)

(assert (=> b!50429 (= e!32582 #b00000000000000000000000000000000)))

(assert (= (and d!10167 c!6793) b!50429))

(assert (= (and d!10167 (not c!6793)) b!50431))

(assert (= (and b!50431 c!6794) b!50430))

(assert (= (and b!50431 (not c!6794)) b!50428))

(assert (= (or b!50430 b!50428) bm!3897))

(declare-fun m!43691 () Bool)

(assert (=> bm!3897 m!43691))

(assert (=> b!50431 m!43643))

(assert (=> b!50431 m!43643))

(assert (=> b!50431 m!43645))

(assert (=> b!50326 d!10167))

(declare-fun b!50433 () Bool)

(declare-fun e!32584 () Bool)

(assert (=> b!50433 (= e!32584 tp_is_empty!2185)))

(declare-fun mapIsEmpty!2201 () Bool)

(declare-fun mapRes!2201 () Bool)

(assert (=> mapIsEmpty!2201 mapRes!2201))

(declare-fun b!50432 () Bool)

(declare-fun e!32583 () Bool)

(assert (=> b!50432 (= e!32583 tp_is_empty!2185)))

(declare-fun condMapEmpty!2201 () Bool)

(declare-fun mapDefault!2201 () ValueCell!749)

(assert (=> mapNonEmpty!2200 (= condMapEmpty!2201 (= mapRest!2200 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2201)))))

(assert (=> mapNonEmpty!2200 (= tp!6700 (and e!32584 mapRes!2201))))

(declare-fun mapNonEmpty!2201 () Bool)

(declare-fun tp!6701 () Bool)

(assert (=> mapNonEmpty!2201 (= mapRes!2201 (and tp!6701 e!32583))))

(declare-fun mapRest!2201 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapKey!2201 () (_ BitVec 32))

(declare-fun mapValue!2201 () ValueCell!749)

(assert (=> mapNonEmpty!2201 (= mapRest!2200 (store mapRest!2201 mapKey!2201 mapValue!2201))))

(assert (= (and mapNonEmpty!2200 condMapEmpty!2201) mapIsEmpty!2201))

(assert (= (and mapNonEmpty!2200 (not condMapEmpty!2201)) mapNonEmpty!2201))

(assert (= (and mapNonEmpty!2201 ((_ is ValueCellFull!749) mapValue!2201)) b!50432))

(assert (= (and mapNonEmpty!2200 ((_ is ValueCellFull!749) mapDefault!2201)) b!50433))

(declare-fun m!43693 () Bool)

(assert (=> mapNonEmpty!2201 m!43693))

(declare-fun b!50435 () Bool)

(declare-fun e!32586 () Bool)

(assert (=> b!50435 (= e!32586 tp_is_empty!2185)))

(declare-fun mapIsEmpty!2202 () Bool)

(declare-fun mapRes!2202 () Bool)

(assert (=> mapIsEmpty!2202 mapRes!2202))

(declare-fun b!50434 () Bool)

(declare-fun e!32585 () Bool)

(assert (=> b!50434 (= e!32585 tp_is_empty!2185)))

(declare-fun condMapEmpty!2202 () Bool)

(declare-fun mapDefault!2202 () ValueCell!749)

(assert (=> mapNonEmpty!2199 (= condMapEmpty!2202 (= mapRest!2199 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2202)))))

(assert (=> mapNonEmpty!2199 (= tp!6699 (and e!32586 mapRes!2202))))

(declare-fun mapNonEmpty!2202 () Bool)

(declare-fun tp!6702 () Bool)

(assert (=> mapNonEmpty!2202 (= mapRes!2202 (and tp!6702 e!32585))))

(declare-fun mapValue!2202 () ValueCell!749)

(declare-fun mapRest!2202 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapKey!2202 () (_ BitVec 32))

(assert (=> mapNonEmpty!2202 (= mapRest!2199 (store mapRest!2202 mapKey!2202 mapValue!2202))))

(assert (= (and mapNonEmpty!2199 condMapEmpty!2202) mapIsEmpty!2202))

(assert (= (and mapNonEmpty!2199 (not condMapEmpty!2202)) mapNonEmpty!2202))

(assert (= (and mapNonEmpty!2202 ((_ is ValueCellFull!749) mapValue!2202)) b!50434))

(assert (= (and mapNonEmpty!2199 ((_ is ValueCellFull!749) mapDefault!2202)) b!50435))

(declare-fun m!43695 () Bool)

(assert (=> mapNonEmpty!2202 m!43695))

(check-sat (not d!10165) (not b!50396) (not b!50384) (not b!50378) (not b!50403) b_and!2749 (not b!50431) (not b!50373) (not bm!3895) (not b_next!1537) (not b!50383) (not bm!3892) (not mapNonEmpty!2201) (not b!50388) (not b_next!1539) (not b!50391) (not b!50409) (not b!50394) (not mapNonEmpty!2202) (not bm!3896) (not bm!3893) (not b!50397) (not d!10153) (not b!50390) (not b!50424) (not d!10157) (not bm!3897) (not b!50377) (not d!10161) (not b!50374) tp_is_empty!2185 (not b!50381) b_and!2751 (not bm!3894))
(check-sat b_and!2749 b_and!2751 (not b_next!1537) (not b_next!1539))
