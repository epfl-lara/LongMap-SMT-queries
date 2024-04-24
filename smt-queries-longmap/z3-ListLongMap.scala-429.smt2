; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8016 () Bool)

(assert start!8016)

(declare-fun b!50208 () Bool)

(declare-fun b_free!1537 () Bool)

(declare-fun b_next!1537 () Bool)

(assert (=> b!50208 (= b_free!1537 (not b_next!1537))))

(declare-fun tp!6668 () Bool)

(declare-fun b_and!2745 () Bool)

(assert (=> b!50208 (= tp!6668 b_and!2745)))

(declare-fun b!50202 () Bool)

(declare-fun b_free!1539 () Bool)

(declare-fun b_next!1539 () Bool)

(assert (=> b!50202 (= b_free!1539 (not b_next!1539))))

(declare-fun tp!6667 () Bool)

(declare-fun b_and!2747 () Bool)

(assert (=> b!50202 (= tp!6667 b_and!2747)))

(declare-fun b!50199 () Bool)

(declare-fun e!32418 () Bool)

(declare-fun tp_is_empty!2185 () Bool)

(assert (=> b!50199 (= e!32418 tp_is_empty!2185)))

(declare-fun b!50200 () Bool)

(declare-fun e!32421 () Bool)

(declare-fun mapRes!2181 () Bool)

(assert (=> b!50200 (= e!32421 (and e!32418 mapRes!2181))))

(declare-fun condMapEmpty!2182 () Bool)

(declare-datatypes ((V!2561 0))(
  ( (V!2562 (val!1137 Int)) )
))
(declare-datatypes ((array!3267 0))(
  ( (array!3268 (arr!1562 (Array (_ BitVec 32) (_ BitVec 64))) (size!1785 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!749 0))(
  ( (ValueCellFull!749 (v!2160 V!2561)) (EmptyCell!749) )
))
(declare-datatypes ((array!3269 0))(
  ( (array!3270 (arr!1563 (Array (_ BitVec 32) ValueCell!749)) (size!1786 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!406 0))(
  ( (LongMapFixedSize!407 (defaultEntry!1917 Int) (mask!5704 (_ BitVec 32)) (extraKeys!1808 (_ BitVec 32)) (zeroValue!1835 V!2561) (minValue!1835 V!2561) (_size!252 (_ BitVec 32)) (_keys!3525 array!3267) (_values!1900 array!3269) (_vacant!252 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!406)

(declare-fun mapDefault!2182 () ValueCell!749)

(assert (=> b!50200 (= condMapEmpty!2182 (= (arr!1563 (_values!1900 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2182)))))

(declare-fun b!50201 () Bool)

(declare-fun e!32424 () Bool)

(assert (=> b!50201 (= e!32424 tp_is_empty!2185)))

(declare-fun b!50203 () Bool)

(declare-fun e!32416 () Bool)

(declare-fun e!32415 () Bool)

(assert (=> b!50203 (= e!32416 e!32415)))

(declare-fun b!50204 () Bool)

(declare-fun res!28940 () Bool)

(declare-fun e!32414 () Bool)

(assert (=> b!50204 (=> (not res!28940) (not e!32414))))

(declare-fun valid!146 (LongMapFixedSize!406) Bool)

(assert (=> b!50204 (= res!28940 (valid!146 newMap!16))))

(declare-fun b!50205 () Bool)

(declare-fun e!32413 () Bool)

(assert (=> b!50205 (= e!32413 tp_is_empty!2185)))

(declare-fun b!50206 () Bool)

(declare-fun res!28942 () Bool)

(assert (=> b!50206 (=> (not res!28942) (not e!32414))))

(declare-datatypes ((Cell!230 0))(
  ( (Cell!231 (v!2161 LongMapFixedSize!406)) )
))
(declare-datatypes ((LongMap!230 0))(
  ( (LongMap!231 (underlying!126 Cell!230)) )
))
(declare-fun thiss!992 () LongMap!230)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50206 (= res!28942 (validMask!0 (mask!5704 (v!2161 (underlying!126 thiss!992)))))))

(declare-fun mapIsEmpty!2181 () Bool)

(declare-fun mapRes!2182 () Bool)

(assert (=> mapIsEmpty!2181 mapRes!2182))

(declare-fun b!50207 () Bool)

(declare-fun res!28943 () Bool)

(assert (=> b!50207 (=> (not res!28943) (not e!32414))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50207 (= res!28943 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992)))))))))

(declare-fun res!28944 () Bool)

(assert (=> start!8016 (=> (not res!28944) (not e!32414))))

(declare-fun valid!147 (LongMap!230) Bool)

(assert (=> start!8016 (= res!28944 (valid!147 thiss!992))))

(assert (=> start!8016 e!32414))

(assert (=> start!8016 e!32416))

(assert (=> start!8016 true))

(declare-fun e!32412 () Bool)

(assert (=> start!8016 e!32412))

(declare-fun array_inv!939 (array!3267) Bool)

(declare-fun array_inv!940 (array!3269) Bool)

(assert (=> b!50202 (= e!32412 (and tp!6667 tp_is_empty!2185 (array_inv!939 (_keys!3525 newMap!16)) (array_inv!940 (_values!1900 newMap!16)) e!32421))))

(declare-fun e!32422 () Bool)

(declare-fun e!32417 () Bool)

(assert (=> b!50208 (= e!32422 (and tp!6668 tp_is_empty!2185 (array_inv!939 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) (array_inv!940 (_values!1900 (v!2161 (underlying!126 thiss!992)))) e!32417))))

(declare-fun b!50209 () Bool)

(declare-fun e!32423 () Bool)

(assert (=> b!50209 (= e!32423 tp_is_empty!2185)))

(declare-fun b!50210 () Bool)

(assert (=> b!50210 (= e!32417 (and e!32413 mapRes!2182))))

(declare-fun condMapEmpty!2181 () Bool)

(declare-fun mapDefault!2181 () ValueCell!749)

(assert (=> b!50210 (= condMapEmpty!2181 (= (arr!1563 (_values!1900 (v!2161 (underlying!126 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2181)))))

(declare-fun b!50211 () Bool)

(assert (=> b!50211 (= e!32415 e!32422)))

(declare-fun b!50212 () Bool)

(assert (=> b!50212 (= e!32414 (not (= (size!1786 (_values!1900 (v!2161 (underlying!126 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5704 (v!2161 (underlying!126 thiss!992)))))))))

(declare-fun mapNonEmpty!2181 () Bool)

(declare-fun tp!6670 () Bool)

(assert (=> mapNonEmpty!2181 (= mapRes!2181 (and tp!6670 e!32424))))

(declare-fun mapValue!2181 () ValueCell!749)

(declare-fun mapKey!2181 () (_ BitVec 32))

(declare-fun mapRest!2181 () (Array (_ BitVec 32) ValueCell!749))

(assert (=> mapNonEmpty!2181 (= (arr!1563 (_values!1900 newMap!16)) (store mapRest!2181 mapKey!2181 mapValue!2181))))

(declare-fun mapIsEmpty!2182 () Bool)

(assert (=> mapIsEmpty!2182 mapRes!2181))

(declare-fun b!50213 () Bool)

(declare-fun res!28941 () Bool)

(assert (=> b!50213 (=> (not res!28941) (not e!32414))))

(assert (=> b!50213 (= res!28941 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5704 newMap!16)) (_size!252 (v!2161 (underlying!126 thiss!992)))))))

(declare-fun mapNonEmpty!2182 () Bool)

(declare-fun tp!6669 () Bool)

(assert (=> mapNonEmpty!2182 (= mapRes!2182 (and tp!6669 e!32423))))

(declare-fun mapValue!2182 () ValueCell!749)

(declare-fun mapKey!2182 () (_ BitVec 32))

(declare-fun mapRest!2182 () (Array (_ BitVec 32) ValueCell!749))

(assert (=> mapNonEmpty!2182 (= (arr!1563 (_values!1900 (v!2161 (underlying!126 thiss!992)))) (store mapRest!2182 mapKey!2182 mapValue!2182))))

(assert (= (and start!8016 res!28944) b!50207))

(assert (= (and b!50207 res!28943) b!50204))

(assert (= (and b!50204 res!28940) b!50213))

(assert (= (and b!50213 res!28941) b!50206))

(assert (= (and b!50206 res!28942) b!50212))

(assert (= (and b!50210 condMapEmpty!2181) mapIsEmpty!2181))

(assert (= (and b!50210 (not condMapEmpty!2181)) mapNonEmpty!2182))

(get-info :version)

(assert (= (and mapNonEmpty!2182 ((_ is ValueCellFull!749) mapValue!2182)) b!50209))

(assert (= (and b!50210 ((_ is ValueCellFull!749) mapDefault!2181)) b!50205))

(assert (= b!50208 b!50210))

(assert (= b!50211 b!50208))

(assert (= b!50203 b!50211))

(assert (= start!8016 b!50203))

(assert (= (and b!50200 condMapEmpty!2182) mapIsEmpty!2182))

(assert (= (and b!50200 (not condMapEmpty!2182)) mapNonEmpty!2181))

(assert (= (and mapNonEmpty!2181 ((_ is ValueCellFull!749) mapValue!2181)) b!50201))

(assert (= (and b!50200 ((_ is ValueCellFull!749) mapDefault!2182)) b!50199))

(assert (= b!50202 b!50200))

(assert (= start!8016 b!50202))

(declare-fun m!43487 () Bool)

(assert (=> mapNonEmpty!2182 m!43487))

(declare-fun m!43489 () Bool)

(assert (=> b!50202 m!43489))

(declare-fun m!43491 () Bool)

(assert (=> b!50202 m!43491))

(declare-fun m!43493 () Bool)

(assert (=> b!50206 m!43493))

(declare-fun m!43495 () Bool)

(assert (=> start!8016 m!43495))

(declare-fun m!43497 () Bool)

(assert (=> b!50208 m!43497))

(declare-fun m!43499 () Bool)

(assert (=> b!50208 m!43499))

(declare-fun m!43501 () Bool)

(assert (=> mapNonEmpty!2181 m!43501))

(declare-fun m!43503 () Bool)

(assert (=> b!50204 m!43503))

(check-sat b_and!2747 (not start!8016) (not b!50206) b_and!2745 (not b!50204) (not b_next!1537) (not b_next!1539) tp_is_empty!2185 (not b!50202) (not mapNonEmpty!2181) (not mapNonEmpty!2182) (not b!50208))
(check-sat b_and!2745 b_and!2747 (not b_next!1537) (not b_next!1539))
(get-model)

(declare-fun d!10127 () Bool)

(assert (=> d!10127 (= (validMask!0 (mask!5704 (v!2161 (underlying!126 thiss!992)))) (and (or (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000001111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000011111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000001111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000011111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000001111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000011111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000001111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000011111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000001111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000011111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000001111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000011111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000111111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000001111111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000011111111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000111111111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000001111111111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000011111111111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000111111111111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00001111111111111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00011111111111111111111111111111) (= (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50206 d!10127))

(declare-fun d!10129 () Bool)

(assert (=> d!10129 (= (valid!147 thiss!992) (valid!146 (v!2161 (underlying!126 thiss!992))))))

(declare-fun bs!2358 () Bool)

(assert (= bs!2358 d!10129))

(declare-fun m!43541 () Bool)

(assert (=> bs!2358 m!43541))

(assert (=> start!8016 d!10129))

(declare-fun d!10131 () Bool)

(assert (=> d!10131 (= (array_inv!939 (_keys!3525 newMap!16)) (bvsge (size!1785 (_keys!3525 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50202 d!10131))

(declare-fun d!10133 () Bool)

(assert (=> d!10133 (= (array_inv!940 (_values!1900 newMap!16)) (bvsge (size!1786 (_values!1900 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50202 d!10133))

(declare-fun d!10135 () Bool)

(assert (=> d!10135 (= (array_inv!939 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) (bvsge (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50208 d!10135))

(declare-fun d!10137 () Bool)

(assert (=> d!10137 (= (array_inv!940 (_values!1900 (v!2161 (underlying!126 thiss!992)))) (bvsge (size!1786 (_values!1900 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50208 d!10137))

(declare-fun d!10139 () Bool)

(declare-fun res!28981 () Bool)

(declare-fun e!32505 () Bool)

(assert (=> d!10139 (=> (not res!28981) (not e!32505))))

(declare-fun simpleValid!34 (LongMapFixedSize!406) Bool)

(assert (=> d!10139 (= res!28981 (simpleValid!34 newMap!16))))

(assert (=> d!10139 (= (valid!146 newMap!16) e!32505)))

(declare-fun b!50310 () Bool)

(declare-fun res!28982 () Bool)

(assert (=> b!50310 (=> (not res!28982) (not e!32505))))

(declare-fun arrayCountValidKeys!0 (array!3267 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50310 (= res!28982 (= (arrayCountValidKeys!0 (_keys!3525 newMap!16) #b00000000000000000000000000000000 (size!1785 (_keys!3525 newMap!16))) (_size!252 newMap!16)))))

(declare-fun b!50311 () Bool)

(declare-fun res!28983 () Bool)

(assert (=> b!50311 (=> (not res!28983) (not e!32505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3267 (_ BitVec 32)) Bool)

(assert (=> b!50311 (= res!28983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3525 newMap!16) (mask!5704 newMap!16)))))

(declare-fun b!50312 () Bool)

(declare-datatypes ((List!1315 0))(
  ( (Nil!1312) (Cons!1311 (h!1891 (_ BitVec 64)) (t!4349 List!1315)) )
))
(declare-fun arrayNoDuplicates!0 (array!3267 (_ BitVec 32) List!1315) Bool)

(assert (=> b!50312 (= e!32505 (arrayNoDuplicates!0 (_keys!3525 newMap!16) #b00000000000000000000000000000000 Nil!1312))))

(assert (= (and d!10139 res!28981) b!50310))

(assert (= (and b!50310 res!28982) b!50311))

(assert (= (and b!50311 res!28983) b!50312))

(declare-fun m!43543 () Bool)

(assert (=> d!10139 m!43543))

(declare-fun m!43545 () Bool)

(assert (=> b!50310 m!43545))

(declare-fun m!43547 () Bool)

(assert (=> b!50311 m!43547))

(declare-fun m!43549 () Bool)

(assert (=> b!50312 m!43549))

(assert (=> b!50204 d!10139))

(declare-fun condMapEmpty!2197 () Bool)

(declare-fun mapDefault!2197 () ValueCell!749)

(assert (=> mapNonEmpty!2182 (= condMapEmpty!2197 (= mapRest!2182 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2197)))))

(declare-fun e!32510 () Bool)

(declare-fun mapRes!2197 () Bool)

(assert (=> mapNonEmpty!2182 (= tp!6669 (and e!32510 mapRes!2197))))

(declare-fun mapNonEmpty!2197 () Bool)

(declare-fun tp!6697 () Bool)

(declare-fun e!32511 () Bool)

(assert (=> mapNonEmpty!2197 (= mapRes!2197 (and tp!6697 e!32511))))

(declare-fun mapRest!2197 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapKey!2197 () (_ BitVec 32))

(declare-fun mapValue!2197 () ValueCell!749)

(assert (=> mapNonEmpty!2197 (= mapRest!2182 (store mapRest!2197 mapKey!2197 mapValue!2197))))

(declare-fun mapIsEmpty!2197 () Bool)

(assert (=> mapIsEmpty!2197 mapRes!2197))

(declare-fun b!50320 () Bool)

(assert (=> b!50320 (= e!32510 tp_is_empty!2185)))

(declare-fun b!50319 () Bool)

(assert (=> b!50319 (= e!32511 tp_is_empty!2185)))

(assert (= (and mapNonEmpty!2182 condMapEmpty!2197) mapIsEmpty!2197))

(assert (= (and mapNonEmpty!2182 (not condMapEmpty!2197)) mapNonEmpty!2197))

(assert (= (and mapNonEmpty!2197 ((_ is ValueCellFull!749) mapValue!2197)) b!50319))

(assert (= (and mapNonEmpty!2182 ((_ is ValueCellFull!749) mapDefault!2197)) b!50320))

(declare-fun m!43551 () Bool)

(assert (=> mapNonEmpty!2197 m!43551))

(declare-fun condMapEmpty!2198 () Bool)

(declare-fun mapDefault!2198 () ValueCell!749)

(assert (=> mapNonEmpty!2181 (= condMapEmpty!2198 (= mapRest!2181 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2198)))))

(declare-fun e!32512 () Bool)

(declare-fun mapRes!2198 () Bool)

(assert (=> mapNonEmpty!2181 (= tp!6670 (and e!32512 mapRes!2198))))

(declare-fun mapNonEmpty!2198 () Bool)

(declare-fun tp!6698 () Bool)

(declare-fun e!32513 () Bool)

(assert (=> mapNonEmpty!2198 (= mapRes!2198 (and tp!6698 e!32513))))

(declare-fun mapValue!2198 () ValueCell!749)

(declare-fun mapRest!2198 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapKey!2198 () (_ BitVec 32))

(assert (=> mapNonEmpty!2198 (= mapRest!2181 (store mapRest!2198 mapKey!2198 mapValue!2198))))

(declare-fun mapIsEmpty!2198 () Bool)

(assert (=> mapIsEmpty!2198 mapRes!2198))

(declare-fun b!50322 () Bool)

(assert (=> b!50322 (= e!32512 tp_is_empty!2185)))

(declare-fun b!50321 () Bool)

(assert (=> b!50321 (= e!32513 tp_is_empty!2185)))

(assert (= (and mapNonEmpty!2181 condMapEmpty!2198) mapIsEmpty!2198))

(assert (= (and mapNonEmpty!2181 (not condMapEmpty!2198)) mapNonEmpty!2198))

(assert (= (and mapNonEmpty!2198 ((_ is ValueCellFull!749) mapValue!2198)) b!50321))

(assert (= (and mapNonEmpty!2181 ((_ is ValueCellFull!749) mapDefault!2198)) b!50322))

(declare-fun m!43553 () Bool)

(assert (=> mapNonEmpty!2198 m!43553))

(check-sat b_and!2747 (not b!50311) (not mapNonEmpty!2197) b_and!2745 (not b!50310) (not b_next!1539) tp_is_empty!2185 (not d!10129) (not b!50312) (not b_next!1537) (not d!10139) (not mapNonEmpty!2198))
(check-sat b_and!2745 b_and!2747 (not b_next!1537) (not b_next!1539))
(get-model)

(declare-fun b!50334 () Bool)

(declare-fun e!32516 () Bool)

(assert (=> b!50334 (= e!32516 (and (bvsge (extraKeys!1808 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1808 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!252 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!50332 () Bool)

(declare-fun res!28992 () Bool)

(assert (=> b!50332 (=> (not res!28992) (not e!32516))))

(declare-fun size!1791 (LongMapFixedSize!406) (_ BitVec 32))

(assert (=> b!50332 (= res!28992 (bvsge (size!1791 newMap!16) (_size!252 newMap!16)))))

(declare-fun b!50331 () Bool)

(declare-fun res!28995 () Bool)

(assert (=> b!50331 (=> (not res!28995) (not e!32516))))

(assert (=> b!50331 (= res!28995 (and (= (size!1786 (_values!1900 newMap!16)) (bvadd (mask!5704 newMap!16) #b00000000000000000000000000000001)) (= (size!1785 (_keys!3525 newMap!16)) (size!1786 (_values!1900 newMap!16))) (bvsge (_size!252 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!252 newMap!16) (bvadd (mask!5704 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!50333 () Bool)

(declare-fun res!28993 () Bool)

(assert (=> b!50333 (=> (not res!28993) (not e!32516))))

(assert (=> b!50333 (= res!28993 (= (size!1791 newMap!16) (bvadd (_size!252 newMap!16) (bvsdiv (bvadd (extraKeys!1808 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!10141 () Bool)

(declare-fun res!28994 () Bool)

(assert (=> d!10141 (=> (not res!28994) (not e!32516))))

(assert (=> d!10141 (= res!28994 (validMask!0 (mask!5704 newMap!16)))))

(assert (=> d!10141 (= (simpleValid!34 newMap!16) e!32516)))

(assert (= (and d!10141 res!28994) b!50331))

(assert (= (and b!50331 res!28995) b!50332))

(assert (= (and b!50332 res!28992) b!50333))

(assert (= (and b!50333 res!28993) b!50334))

(declare-fun m!43555 () Bool)

(assert (=> b!50332 m!43555))

(assert (=> b!50333 m!43555))

(declare-fun m!43557 () Bool)

(assert (=> d!10141 m!43557))

(assert (=> d!10139 d!10141))

(declare-fun d!10143 () Bool)

(declare-fun res!28996 () Bool)

(declare-fun e!32517 () Bool)

(assert (=> d!10143 (=> (not res!28996) (not e!32517))))

(assert (=> d!10143 (= res!28996 (simpleValid!34 (v!2161 (underlying!126 thiss!992))))))

(assert (=> d!10143 (= (valid!146 (v!2161 (underlying!126 thiss!992))) e!32517)))

(declare-fun b!50335 () Bool)

(declare-fun res!28997 () Bool)

(assert (=> b!50335 (=> (not res!28997) (not e!32517))))

(assert (=> b!50335 (= res!28997 (= (arrayCountValidKeys!0 (_keys!3525 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000000 (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992))))) (_size!252 (v!2161 (underlying!126 thiss!992)))))))

(declare-fun b!50336 () Bool)

(declare-fun res!28998 () Bool)

(assert (=> b!50336 (=> (not res!28998) (not e!32517))))

(assert (=> b!50336 (= res!28998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3525 (v!2161 (underlying!126 thiss!992))) (mask!5704 (v!2161 (underlying!126 thiss!992)))))))

(declare-fun b!50337 () Bool)

(assert (=> b!50337 (= e!32517 (arrayNoDuplicates!0 (_keys!3525 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000000 Nil!1312))))

(assert (= (and d!10143 res!28996) b!50335))

(assert (= (and b!50335 res!28997) b!50336))

(assert (= (and b!50336 res!28998) b!50337))

(declare-fun m!43559 () Bool)

(assert (=> d!10143 m!43559))

(declare-fun m!43561 () Bool)

(assert (=> b!50335 m!43561))

(declare-fun m!43563 () Bool)

(assert (=> b!50336 m!43563))

(declare-fun m!43565 () Bool)

(assert (=> b!50337 m!43565))

(assert (=> d!10129 d!10143))

(declare-fun b!50346 () Bool)

(declare-fun e!32524 () Bool)

(declare-fun call!3875 () Bool)

(assert (=> b!50346 (= e!32524 call!3875)))

(declare-fun b!50347 () Bool)

(declare-fun e!32526 () Bool)

(assert (=> b!50347 (= e!32526 e!32524)))

(declare-fun lt!21010 () (_ BitVec 64))

(assert (=> b!50347 (= lt!21010 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1430 0))(
  ( (Unit!1431) )
))
(declare-fun lt!21011 () Unit!1430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3267 (_ BitVec 64) (_ BitVec 32)) Unit!1430)

(assert (=> b!50347 (= lt!21011 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3525 newMap!16) lt!21010 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!50347 (arrayContainsKey!0 (_keys!3525 newMap!16) lt!21010 #b00000000000000000000000000000000)))

(declare-fun lt!21012 () Unit!1430)

(assert (=> b!50347 (= lt!21012 lt!21011)))

(declare-fun res!29003 () Bool)

(declare-datatypes ((SeekEntryResult!213 0))(
  ( (MissingZero!213 (index!2974 (_ BitVec 32))) (Found!213 (index!2975 (_ BitVec 32))) (Intermediate!213 (undefined!1025 Bool) (index!2976 (_ BitVec 32)) (x!9199 (_ BitVec 32))) (Undefined!213) (MissingVacant!213 (index!2977 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3267 (_ BitVec 32)) SeekEntryResult!213)

(assert (=> b!50347 (= res!29003 (= (seekEntryOrOpen!0 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) (_keys!3525 newMap!16) (mask!5704 newMap!16)) (Found!213 #b00000000000000000000000000000000)))))

(assert (=> b!50347 (=> (not res!29003) (not e!32524))))

(declare-fun d!10145 () Bool)

(declare-fun res!29004 () Bool)

(declare-fun e!32525 () Bool)

(assert (=> d!10145 (=> res!29004 e!32525)))

(assert (=> d!10145 (= res!29004 (bvsge #b00000000000000000000000000000000 (size!1785 (_keys!3525 newMap!16))))))

(assert (=> d!10145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3525 newMap!16) (mask!5704 newMap!16)) e!32525)))

(declare-fun b!50348 () Bool)

(assert (=> b!50348 (= e!32526 call!3875)))

(declare-fun b!50349 () Bool)

(assert (=> b!50349 (= e!32525 e!32526)))

(declare-fun c!6775 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!50349 (= c!6775 (validKeyInArray!0 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3872 () Bool)

(assert (=> bm!3872 (= call!3875 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3525 newMap!16) (mask!5704 newMap!16)))))

(assert (= (and d!10145 (not res!29004)) b!50349))

(assert (= (and b!50349 c!6775) b!50347))

(assert (= (and b!50349 (not c!6775)) b!50348))

(assert (= (and b!50347 res!29003) b!50346))

(assert (= (or b!50346 b!50348) bm!3872))

(declare-fun m!43567 () Bool)

(assert (=> b!50347 m!43567))

(declare-fun m!43569 () Bool)

(assert (=> b!50347 m!43569))

(declare-fun m!43571 () Bool)

(assert (=> b!50347 m!43571))

(assert (=> b!50347 m!43567))

(declare-fun m!43573 () Bool)

(assert (=> b!50347 m!43573))

(assert (=> b!50349 m!43567))

(assert (=> b!50349 m!43567))

(declare-fun m!43575 () Bool)

(assert (=> b!50349 m!43575))

(declare-fun m!43577 () Bool)

(assert (=> bm!3872 m!43577))

(assert (=> b!50311 d!10145))

(declare-fun b!50359 () Bool)

(declare-fun e!32532 () (_ BitVec 32))

(declare-fun call!3878 () (_ BitVec 32))

(assert (=> b!50359 (= e!32532 call!3878)))

(declare-fun b!50360 () Bool)

(assert (=> b!50360 (= e!32532 (bvadd #b00000000000000000000000000000001 call!3878))))

(declare-fun b!50358 () Bool)

(declare-fun e!32531 () (_ BitVec 32))

(assert (=> b!50358 (= e!32531 #b00000000000000000000000000000000)))

(declare-fun d!10147 () Bool)

(declare-fun lt!21015 () (_ BitVec 32))

(assert (=> d!10147 (and (bvsge lt!21015 #b00000000000000000000000000000000) (bvsle lt!21015 (bvsub (size!1785 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10147 (= lt!21015 e!32531)))

(declare-fun c!6781 () Bool)

(assert (=> d!10147 (= c!6781 (bvsge #b00000000000000000000000000000000 (size!1785 (_keys!3525 newMap!16))))))

(assert (=> d!10147 (and (bvsle #b00000000000000000000000000000000 (size!1785 (_keys!3525 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1785 (_keys!3525 newMap!16)) (size!1785 (_keys!3525 newMap!16))))))

(assert (=> d!10147 (= (arrayCountValidKeys!0 (_keys!3525 newMap!16) #b00000000000000000000000000000000 (size!1785 (_keys!3525 newMap!16))) lt!21015)))

(declare-fun b!50361 () Bool)

(assert (=> b!50361 (= e!32531 e!32532)))

(declare-fun c!6780 () Bool)

(assert (=> b!50361 (= c!6780 (validKeyInArray!0 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3875 () Bool)

(assert (=> bm!3875 (= call!3878 (arrayCountValidKeys!0 (_keys!3525 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1785 (_keys!3525 newMap!16))))))

(assert (= (and d!10147 c!6781) b!50358))

(assert (= (and d!10147 (not c!6781)) b!50361))

(assert (= (and b!50361 c!6780) b!50360))

(assert (= (and b!50361 (not c!6780)) b!50359))

(assert (= (or b!50360 b!50359) bm!3875))

(assert (=> b!50361 m!43567))

(assert (=> b!50361 m!43567))

(assert (=> b!50361 m!43575))

(declare-fun m!43579 () Bool)

(assert (=> bm!3875 m!43579))

(assert (=> b!50310 d!10147))

(declare-fun d!10149 () Bool)

(declare-fun res!29012 () Bool)

(declare-fun e!32544 () Bool)

(assert (=> d!10149 (=> res!29012 e!32544)))

(assert (=> d!10149 (= res!29012 (bvsge #b00000000000000000000000000000000 (size!1785 (_keys!3525 newMap!16))))))

(assert (=> d!10149 (= (arrayNoDuplicates!0 (_keys!3525 newMap!16) #b00000000000000000000000000000000 Nil!1312) e!32544)))

(declare-fun bm!3878 () Bool)

(declare-fun call!3881 () Bool)

(declare-fun c!6784 () Bool)

(assert (=> bm!3878 (= call!3881 (arrayNoDuplicates!0 (_keys!3525 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6784 (Cons!1311 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) Nil!1312) Nil!1312)))))

(declare-fun b!50372 () Bool)

(declare-fun e!32541 () Bool)

(assert (=> b!50372 (= e!32541 call!3881)))

(declare-fun b!50373 () Bool)

(declare-fun e!32542 () Bool)

(assert (=> b!50373 (= e!32544 e!32542)))

(declare-fun res!29011 () Bool)

(assert (=> b!50373 (=> (not res!29011) (not e!32542))))

(declare-fun e!32543 () Bool)

(assert (=> b!50373 (= res!29011 (not e!32543))))

(declare-fun res!29013 () Bool)

(assert (=> b!50373 (=> (not res!29013) (not e!32543))))

(assert (=> b!50373 (= res!29013 (validKeyInArray!0 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50374 () Bool)

(declare-fun contains!610 (List!1315 (_ BitVec 64)) Bool)

(assert (=> b!50374 (= e!32543 (contains!610 Nil!1312 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50375 () Bool)

(assert (=> b!50375 (= e!32542 e!32541)))

(assert (=> b!50375 (= c!6784 (validKeyInArray!0 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50376 () Bool)

(assert (=> b!50376 (= e!32541 call!3881)))

(assert (= (and d!10149 (not res!29012)) b!50373))

(assert (= (and b!50373 res!29013) b!50374))

(assert (= (and b!50373 res!29011) b!50375))

(assert (= (and b!50375 c!6784) b!50376))

(assert (= (and b!50375 (not c!6784)) b!50372))

(assert (= (or b!50376 b!50372) bm!3878))

(assert (=> bm!3878 m!43567))

(declare-fun m!43581 () Bool)

(assert (=> bm!3878 m!43581))

(assert (=> b!50373 m!43567))

(assert (=> b!50373 m!43567))

(assert (=> b!50373 m!43575))

(assert (=> b!50374 m!43567))

(assert (=> b!50374 m!43567))

(declare-fun m!43583 () Bool)

(assert (=> b!50374 m!43583))

(assert (=> b!50375 m!43567))

(assert (=> b!50375 m!43567))

(assert (=> b!50375 m!43575))

(assert (=> b!50312 d!10149))

(declare-fun condMapEmpty!2199 () Bool)

(declare-fun mapDefault!2199 () ValueCell!749)

(assert (=> mapNonEmpty!2197 (= condMapEmpty!2199 (= mapRest!2197 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2199)))))

(declare-fun e!32545 () Bool)

(declare-fun mapRes!2199 () Bool)

(assert (=> mapNonEmpty!2197 (= tp!6697 (and e!32545 mapRes!2199))))

(declare-fun mapNonEmpty!2199 () Bool)

(declare-fun tp!6699 () Bool)

(declare-fun e!32546 () Bool)

(assert (=> mapNonEmpty!2199 (= mapRes!2199 (and tp!6699 e!32546))))

(declare-fun mapKey!2199 () (_ BitVec 32))

(declare-fun mapRest!2199 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapValue!2199 () ValueCell!749)

(assert (=> mapNonEmpty!2199 (= mapRest!2197 (store mapRest!2199 mapKey!2199 mapValue!2199))))

(declare-fun mapIsEmpty!2199 () Bool)

(assert (=> mapIsEmpty!2199 mapRes!2199))

(declare-fun b!50378 () Bool)

(assert (=> b!50378 (= e!32545 tp_is_empty!2185)))

(declare-fun b!50377 () Bool)

(assert (=> b!50377 (= e!32546 tp_is_empty!2185)))

(assert (= (and mapNonEmpty!2197 condMapEmpty!2199) mapIsEmpty!2199))

(assert (= (and mapNonEmpty!2197 (not condMapEmpty!2199)) mapNonEmpty!2199))

(assert (= (and mapNonEmpty!2199 ((_ is ValueCellFull!749) mapValue!2199)) b!50377))

(assert (= (and mapNonEmpty!2197 ((_ is ValueCellFull!749) mapDefault!2199)) b!50378))

(declare-fun m!43585 () Bool)

(assert (=> mapNonEmpty!2199 m!43585))

(declare-fun condMapEmpty!2200 () Bool)

(declare-fun mapDefault!2200 () ValueCell!749)

(assert (=> mapNonEmpty!2198 (= condMapEmpty!2200 (= mapRest!2198 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2200)))))

(declare-fun e!32547 () Bool)

(declare-fun mapRes!2200 () Bool)

(assert (=> mapNonEmpty!2198 (= tp!6698 (and e!32547 mapRes!2200))))

(declare-fun mapNonEmpty!2200 () Bool)

(declare-fun tp!6700 () Bool)

(declare-fun e!32548 () Bool)

(assert (=> mapNonEmpty!2200 (= mapRes!2200 (and tp!6700 e!32548))))

(declare-fun mapRest!2200 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapKey!2200 () (_ BitVec 32))

(declare-fun mapValue!2200 () ValueCell!749)

(assert (=> mapNonEmpty!2200 (= mapRest!2198 (store mapRest!2200 mapKey!2200 mapValue!2200))))

(declare-fun mapIsEmpty!2200 () Bool)

(assert (=> mapIsEmpty!2200 mapRes!2200))

(declare-fun b!50380 () Bool)

(assert (=> b!50380 (= e!32547 tp_is_empty!2185)))

(declare-fun b!50379 () Bool)

(assert (=> b!50379 (= e!32548 tp_is_empty!2185)))

(assert (= (and mapNonEmpty!2198 condMapEmpty!2200) mapIsEmpty!2200))

(assert (= (and mapNonEmpty!2198 (not condMapEmpty!2200)) mapNonEmpty!2200))

(assert (= (and mapNonEmpty!2200 ((_ is ValueCellFull!749) mapValue!2200)) b!50379))

(assert (= (and mapNonEmpty!2198 ((_ is ValueCellFull!749) mapDefault!2200)) b!50380))

(declare-fun m!43587 () Bool)

(assert (=> mapNonEmpty!2200 m!43587))

(check-sat b_and!2747 (not bm!3878) (not b!50373) (not mapNonEmpty!2200) (not b!50337) (not mapNonEmpty!2199) (not b!50336) (not d!10141) (not b!50349) (not b_next!1537) (not b!50335) (not b_next!1539) tp_is_empty!2185 (not d!10143) (not bm!3872) (not b!50374) (not b!50332) (not b!50333) (not b!50375) b_and!2745 (not b!50347) (not b!50361) (not bm!3875))
(check-sat b_and!2745 b_and!2747 (not b_next!1537) (not b_next!1539))
(get-model)

(declare-fun d!10151 () Bool)

(declare-fun lt!21018 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!57 (List!1315) (InoxSet (_ BitVec 64)))

(assert (=> d!10151 (= lt!21018 (select (content!57 Nil!1312) (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32553 () Bool)

(assert (=> d!10151 (= lt!21018 e!32553)))

(declare-fun res!29018 () Bool)

(assert (=> d!10151 (=> (not res!29018) (not e!32553))))

(assert (=> d!10151 (= res!29018 ((_ is Cons!1311) Nil!1312))))

(assert (=> d!10151 (= (contains!610 Nil!1312 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)) lt!21018)))

(declare-fun b!50385 () Bool)

(declare-fun e!32554 () Bool)

(assert (=> b!50385 (= e!32553 e!32554)))

(declare-fun res!29019 () Bool)

(assert (=> b!50385 (=> res!29019 e!32554)))

(assert (=> b!50385 (= res!29019 (= (h!1891 Nil!1312) (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50386 () Bool)

(assert (=> b!50386 (= e!32554 (contains!610 (t!4349 Nil!1312) (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10151 res!29018) b!50385))

(assert (= (and b!50385 (not res!29019)) b!50386))

(declare-fun m!43589 () Bool)

(assert (=> d!10151 m!43589))

(assert (=> d!10151 m!43567))

(declare-fun m!43591 () Bool)

(assert (=> d!10151 m!43591))

(assert (=> b!50386 m!43567))

(declare-fun m!43593 () Bool)

(assert (=> b!50386 m!43593))

(assert (=> b!50374 d!10151))

(declare-fun d!10153 () Bool)

(assert (=> d!10153 (arrayContainsKey!0 (_keys!3525 newMap!16) lt!21010 #b00000000000000000000000000000000)))

(declare-fun lt!21021 () Unit!1430)

(declare-fun choose!13 (array!3267 (_ BitVec 64) (_ BitVec 32)) Unit!1430)

(assert (=> d!10153 (= lt!21021 (choose!13 (_keys!3525 newMap!16) lt!21010 #b00000000000000000000000000000000))))

(assert (=> d!10153 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10153 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3525 newMap!16) lt!21010 #b00000000000000000000000000000000) lt!21021)))

(declare-fun bs!2359 () Bool)

(assert (= bs!2359 d!10153))

(assert (=> bs!2359 m!43571))

(declare-fun m!43595 () Bool)

(assert (=> bs!2359 m!43595))

(assert (=> b!50347 d!10153))

(declare-fun d!10155 () Bool)

(declare-fun res!29024 () Bool)

(declare-fun e!32559 () Bool)

(assert (=> d!10155 (=> res!29024 e!32559)))

(assert (=> d!10155 (= res!29024 (= (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) lt!21010))))

(assert (=> d!10155 (= (arrayContainsKey!0 (_keys!3525 newMap!16) lt!21010 #b00000000000000000000000000000000) e!32559)))

(declare-fun b!50391 () Bool)

(declare-fun e!32560 () Bool)

(assert (=> b!50391 (= e!32559 e!32560)))

(declare-fun res!29025 () Bool)

(assert (=> b!50391 (=> (not res!29025) (not e!32560))))

(assert (=> b!50391 (= res!29025 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1785 (_keys!3525 newMap!16))))))

(declare-fun b!50392 () Bool)

(assert (=> b!50392 (= e!32560 (arrayContainsKey!0 (_keys!3525 newMap!16) lt!21010 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10155 (not res!29024)) b!50391))

(assert (= (and b!50391 res!29025) b!50392))

(assert (=> d!10155 m!43567))

(declare-fun m!43597 () Bool)

(assert (=> b!50392 m!43597))

(assert (=> b!50347 d!10155))

(declare-fun b!50405 () Bool)

(declare-fun e!32569 () SeekEntryResult!213)

(declare-fun e!32568 () SeekEntryResult!213)

(assert (=> b!50405 (= e!32569 e!32568)))

(declare-fun lt!21030 () (_ BitVec 64))

(declare-fun lt!21029 () SeekEntryResult!213)

(assert (=> b!50405 (= lt!21030 (select (arr!1562 (_keys!3525 newMap!16)) (index!2976 lt!21029)))))

(declare-fun c!6792 () Bool)

(assert (=> b!50405 (= c!6792 (= lt!21030 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50406 () Bool)

(declare-fun e!32567 () SeekEntryResult!213)

(assert (=> b!50406 (= e!32567 (MissingZero!213 (index!2976 lt!21029)))))

(declare-fun b!50407 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3267 (_ BitVec 32)) SeekEntryResult!213)

(assert (=> b!50407 (= e!32567 (seekKeyOrZeroReturnVacant!0 (x!9199 lt!21029) (index!2976 lt!21029) (index!2976 lt!21029) (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) (_keys!3525 newMap!16) (mask!5704 newMap!16)))))

(declare-fun b!50408 () Bool)

(declare-fun c!6791 () Bool)

(assert (=> b!50408 (= c!6791 (= lt!21030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!50408 (= e!32568 e!32567)))

(declare-fun d!10157 () Bool)

(declare-fun lt!21028 () SeekEntryResult!213)

(assert (=> d!10157 (and (or ((_ is Undefined!213) lt!21028) (not ((_ is Found!213) lt!21028)) (and (bvsge (index!2975 lt!21028) #b00000000000000000000000000000000) (bvslt (index!2975 lt!21028) (size!1785 (_keys!3525 newMap!16))))) (or ((_ is Undefined!213) lt!21028) ((_ is Found!213) lt!21028) (not ((_ is MissingZero!213) lt!21028)) (and (bvsge (index!2974 lt!21028) #b00000000000000000000000000000000) (bvslt (index!2974 lt!21028) (size!1785 (_keys!3525 newMap!16))))) (or ((_ is Undefined!213) lt!21028) ((_ is Found!213) lt!21028) ((_ is MissingZero!213) lt!21028) (not ((_ is MissingVacant!213) lt!21028)) (and (bvsge (index!2977 lt!21028) #b00000000000000000000000000000000) (bvslt (index!2977 lt!21028) (size!1785 (_keys!3525 newMap!16))))) (or ((_ is Undefined!213) lt!21028) (ite ((_ is Found!213) lt!21028) (= (select (arr!1562 (_keys!3525 newMap!16)) (index!2975 lt!21028)) (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!213) lt!21028) (= (select (arr!1562 (_keys!3525 newMap!16)) (index!2974 lt!21028)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!213) lt!21028) (= (select (arr!1562 (_keys!3525 newMap!16)) (index!2977 lt!21028)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10157 (= lt!21028 e!32569)))

(declare-fun c!6793 () Bool)

(assert (=> d!10157 (= c!6793 (and ((_ is Intermediate!213) lt!21029) (undefined!1025 lt!21029)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3267 (_ BitVec 32)) SeekEntryResult!213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10157 (= lt!21029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) (mask!5704 newMap!16)) (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) (_keys!3525 newMap!16) (mask!5704 newMap!16)))))

(assert (=> d!10157 (validMask!0 (mask!5704 newMap!16))))

(assert (=> d!10157 (= (seekEntryOrOpen!0 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) (_keys!3525 newMap!16) (mask!5704 newMap!16)) lt!21028)))

(declare-fun b!50409 () Bool)

(assert (=> b!50409 (= e!32568 (Found!213 (index!2976 lt!21029)))))

(declare-fun b!50410 () Bool)

(assert (=> b!50410 (= e!32569 Undefined!213)))

(assert (= (and d!10157 c!6793) b!50410))

(assert (= (and d!10157 (not c!6793)) b!50405))

(assert (= (and b!50405 c!6792) b!50409))

(assert (= (and b!50405 (not c!6792)) b!50408))

(assert (= (and b!50408 c!6791) b!50406))

(assert (= (and b!50408 (not c!6791)) b!50407))

(declare-fun m!43599 () Bool)

(assert (=> b!50405 m!43599))

(assert (=> b!50407 m!43567))

(declare-fun m!43601 () Bool)

(assert (=> b!50407 m!43601))

(assert (=> d!10157 m!43557))

(declare-fun m!43603 () Bool)

(assert (=> d!10157 m!43603))

(assert (=> d!10157 m!43567))

(declare-fun m!43605 () Bool)

(assert (=> d!10157 m!43605))

(assert (=> d!10157 m!43567))

(assert (=> d!10157 m!43603))

(declare-fun m!43607 () Bool)

(assert (=> d!10157 m!43607))

(declare-fun m!43609 () Bool)

(assert (=> d!10157 m!43609))

(declare-fun m!43611 () Bool)

(assert (=> d!10157 m!43611))

(assert (=> b!50347 d!10157))

(declare-fun b!50414 () Bool)

(declare-fun e!32570 () Bool)

(assert (=> b!50414 (= e!32570 (and (bvsge (extraKeys!1808 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1808 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!252 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50412 () Bool)

(declare-fun res!29026 () Bool)

(assert (=> b!50412 (=> (not res!29026) (not e!32570))))

(assert (=> b!50412 (= res!29026 (bvsge (size!1791 (v!2161 (underlying!126 thiss!992))) (_size!252 (v!2161 (underlying!126 thiss!992)))))))

(declare-fun b!50411 () Bool)

(declare-fun res!29029 () Bool)

(assert (=> b!50411 (=> (not res!29029) (not e!32570))))

(assert (=> b!50411 (= res!29029 (and (= (size!1786 (_values!1900 (v!2161 (underlying!126 thiss!992)))) (bvadd (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000001)) (= (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) (size!1786 (_values!1900 (v!2161 (underlying!126 thiss!992))))) (bvsge (_size!252 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!252 (v!2161 (underlying!126 thiss!992))) (bvadd (mask!5704 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!50413 () Bool)

(declare-fun res!29027 () Bool)

(assert (=> b!50413 (=> (not res!29027) (not e!32570))))

(assert (=> b!50413 (= res!29027 (= (size!1791 (v!2161 (underlying!126 thiss!992))) (bvadd (_size!252 (v!2161 (underlying!126 thiss!992))) (bvsdiv (bvadd (extraKeys!1808 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!10159 () Bool)

(declare-fun res!29028 () Bool)

(assert (=> d!10159 (=> (not res!29028) (not e!32570))))

(assert (=> d!10159 (= res!29028 (validMask!0 (mask!5704 (v!2161 (underlying!126 thiss!992)))))))

(assert (=> d!10159 (= (simpleValid!34 (v!2161 (underlying!126 thiss!992))) e!32570)))

(assert (= (and d!10159 res!29028) b!50411))

(assert (= (and b!50411 res!29029) b!50412))

(assert (= (and b!50412 res!29026) b!50413))

(assert (= (and b!50413 res!29027) b!50414))

(declare-fun m!43613 () Bool)

(assert (=> b!50412 m!43613))

(assert (=> b!50413 m!43613))

(assert (=> d!10159 m!43493))

(assert (=> d!10143 d!10159))

(declare-fun d!10161 () Bool)

(assert (=> d!10161 (= (validKeyInArray!0 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!50361 d!10161))

(declare-fun b!50416 () Bool)

(declare-fun e!32572 () (_ BitVec 32))

(declare-fun call!3882 () (_ BitVec 32))

(assert (=> b!50416 (= e!32572 call!3882)))

(declare-fun b!50417 () Bool)

(assert (=> b!50417 (= e!32572 (bvadd #b00000000000000000000000000000001 call!3882))))

(declare-fun b!50415 () Bool)

(declare-fun e!32571 () (_ BitVec 32))

(assert (=> b!50415 (= e!32571 #b00000000000000000000000000000000)))

(declare-fun d!10163 () Bool)

(declare-fun lt!21031 () (_ BitVec 32))

(assert (=> d!10163 (and (bvsge lt!21031 #b00000000000000000000000000000000) (bvsle lt!21031 (bvsub (size!1785 (_keys!3525 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!10163 (= lt!21031 e!32571)))

(declare-fun c!6795 () Bool)

(assert (=> d!10163 (= c!6795 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1785 (_keys!3525 newMap!16))))))

(assert (=> d!10163 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1785 (_keys!3525 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1785 (_keys!3525 newMap!16)) (size!1785 (_keys!3525 newMap!16))))))

(assert (=> d!10163 (= (arrayCountValidKeys!0 (_keys!3525 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1785 (_keys!3525 newMap!16))) lt!21031)))

(declare-fun b!50418 () Bool)

(assert (=> b!50418 (= e!32571 e!32572)))

(declare-fun c!6794 () Bool)

(assert (=> b!50418 (= c!6794 (validKeyInArray!0 (select (arr!1562 (_keys!3525 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3879 () Bool)

(assert (=> bm!3879 (= call!3882 (arrayCountValidKeys!0 (_keys!3525 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1785 (_keys!3525 newMap!16))))))

(assert (= (and d!10163 c!6795) b!50415))

(assert (= (and d!10163 (not c!6795)) b!50418))

(assert (= (and b!50418 c!6794) b!50417))

(assert (= (and b!50418 (not c!6794)) b!50416))

(assert (= (or b!50417 b!50416) bm!3879))

(declare-fun m!43615 () Bool)

(assert (=> b!50418 m!43615))

(assert (=> b!50418 m!43615))

(declare-fun m!43617 () Bool)

(assert (=> b!50418 m!43617))

(declare-fun m!43619 () Bool)

(assert (=> bm!3879 m!43619))

(assert (=> bm!3875 d!10163))

(assert (=> b!50375 d!10161))

(assert (=> b!50349 d!10161))

(declare-fun b!50419 () Bool)

(declare-fun e!32573 () Bool)

(declare-fun call!3883 () Bool)

(assert (=> b!50419 (= e!32573 call!3883)))

(declare-fun b!50420 () Bool)

(declare-fun e!32575 () Bool)

(assert (=> b!50420 (= e!32575 e!32573)))

(declare-fun lt!21032 () (_ BitVec 64))

(assert (=> b!50420 (= lt!21032 (select (arr!1562 (_keys!3525 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21033 () Unit!1430)

(assert (=> b!50420 (= lt!21033 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3525 newMap!16) lt!21032 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!50420 (arrayContainsKey!0 (_keys!3525 newMap!16) lt!21032 #b00000000000000000000000000000000)))

(declare-fun lt!21034 () Unit!1430)

(assert (=> b!50420 (= lt!21034 lt!21033)))

(declare-fun res!29030 () Bool)

(assert (=> b!50420 (= res!29030 (= (seekEntryOrOpen!0 (select (arr!1562 (_keys!3525 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3525 newMap!16) (mask!5704 newMap!16)) (Found!213 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!50420 (=> (not res!29030) (not e!32573))))

(declare-fun d!10165 () Bool)

(declare-fun res!29031 () Bool)

(declare-fun e!32574 () Bool)

(assert (=> d!10165 (=> res!29031 e!32574)))

(assert (=> d!10165 (= res!29031 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1785 (_keys!3525 newMap!16))))))

(assert (=> d!10165 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3525 newMap!16) (mask!5704 newMap!16)) e!32574)))

(declare-fun b!50421 () Bool)

(assert (=> b!50421 (= e!32575 call!3883)))

(declare-fun b!50422 () Bool)

(assert (=> b!50422 (= e!32574 e!32575)))

(declare-fun c!6796 () Bool)

(assert (=> b!50422 (= c!6796 (validKeyInArray!0 (select (arr!1562 (_keys!3525 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3880 () Bool)

(assert (=> bm!3880 (= call!3883 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3525 newMap!16) (mask!5704 newMap!16)))))

(assert (= (and d!10165 (not res!29031)) b!50422))

(assert (= (and b!50422 c!6796) b!50420))

(assert (= (and b!50422 (not c!6796)) b!50421))

(assert (= (and b!50420 res!29030) b!50419))

(assert (= (or b!50419 b!50421) bm!3880))

(assert (=> b!50420 m!43615))

(declare-fun m!43621 () Bool)

(assert (=> b!50420 m!43621))

(declare-fun m!43623 () Bool)

(assert (=> b!50420 m!43623))

(assert (=> b!50420 m!43615))

(declare-fun m!43625 () Bool)

(assert (=> b!50420 m!43625))

(assert (=> b!50422 m!43615))

(assert (=> b!50422 m!43615))

(assert (=> b!50422 m!43617))

(declare-fun m!43627 () Bool)

(assert (=> bm!3880 m!43627))

(assert (=> bm!3872 d!10165))

(declare-fun d!10167 () Bool)

(assert (=> d!10167 (= (size!1791 newMap!16) (bvadd (_size!252 newMap!16) (bvsdiv (bvadd (extraKeys!1808 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!50332 d!10167))

(assert (=> b!50333 d!10167))

(declare-fun b!50424 () Bool)

(declare-fun e!32577 () (_ BitVec 32))

(declare-fun call!3884 () (_ BitVec 32))

(assert (=> b!50424 (= e!32577 call!3884)))

(declare-fun b!50425 () Bool)

(assert (=> b!50425 (= e!32577 (bvadd #b00000000000000000000000000000001 call!3884))))

(declare-fun b!50423 () Bool)

(declare-fun e!32576 () (_ BitVec 32))

(assert (=> b!50423 (= e!32576 #b00000000000000000000000000000000)))

(declare-fun d!10169 () Bool)

(declare-fun lt!21035 () (_ BitVec 32))

(assert (=> d!10169 (and (bvsge lt!21035 #b00000000000000000000000000000000) (bvsle lt!21035 (bvsub (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!10169 (= lt!21035 e!32576)))

(declare-fun c!6798 () Bool)

(assert (=> d!10169 (= c!6798 (bvsge #b00000000000000000000000000000000 (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992))))))))

(assert (=> d!10169 (and (bvsle #b00000000000000000000000000000000 (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992))))))))

(assert (=> d!10169 (= (arrayCountValidKeys!0 (_keys!3525 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000000 (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992))))) lt!21035)))

(declare-fun b!50426 () Bool)

(assert (=> b!50426 (= e!32576 e!32577)))

(declare-fun c!6797 () Bool)

(assert (=> b!50426 (= c!6797 (validKeyInArray!0 (select (arr!1562 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3881 () Bool)

(assert (=> bm!3881 (= call!3884 (arrayCountValidKeys!0 (_keys!3525 (v!2161 (underlying!126 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992))))))))

(assert (= (and d!10169 c!6798) b!50423))

(assert (= (and d!10169 (not c!6798)) b!50426))

(assert (= (and b!50426 c!6797) b!50425))

(assert (= (and b!50426 (not c!6797)) b!50424))

(assert (= (or b!50425 b!50424) bm!3881))

(declare-fun m!43629 () Bool)

(assert (=> b!50426 m!43629))

(assert (=> b!50426 m!43629))

(declare-fun m!43631 () Bool)

(assert (=> b!50426 m!43631))

(declare-fun m!43633 () Bool)

(assert (=> bm!3881 m!43633))

(assert (=> b!50335 d!10169))

(declare-fun b!50427 () Bool)

(declare-fun e!32578 () Bool)

(declare-fun call!3885 () Bool)

(assert (=> b!50427 (= e!32578 call!3885)))

(declare-fun b!50428 () Bool)

(declare-fun e!32580 () Bool)

(assert (=> b!50428 (= e!32580 e!32578)))

(declare-fun lt!21036 () (_ BitVec 64))

(assert (=> b!50428 (= lt!21036 (select (arr!1562 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21037 () Unit!1430)

(assert (=> b!50428 (= lt!21037 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3525 (v!2161 (underlying!126 thiss!992))) lt!21036 #b00000000000000000000000000000000))))

(assert (=> b!50428 (arrayContainsKey!0 (_keys!3525 (v!2161 (underlying!126 thiss!992))) lt!21036 #b00000000000000000000000000000000)))

(declare-fun lt!21038 () Unit!1430)

(assert (=> b!50428 (= lt!21038 lt!21037)))

(declare-fun res!29032 () Bool)

(assert (=> b!50428 (= res!29032 (= (seekEntryOrOpen!0 (select (arr!1562 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000) (_keys!3525 (v!2161 (underlying!126 thiss!992))) (mask!5704 (v!2161 (underlying!126 thiss!992)))) (Found!213 #b00000000000000000000000000000000)))))

(assert (=> b!50428 (=> (not res!29032) (not e!32578))))

(declare-fun d!10171 () Bool)

(declare-fun res!29033 () Bool)

(declare-fun e!32579 () Bool)

(assert (=> d!10171 (=> res!29033 e!32579)))

(assert (=> d!10171 (= res!29033 (bvsge #b00000000000000000000000000000000 (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992))))))))

(assert (=> d!10171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3525 (v!2161 (underlying!126 thiss!992))) (mask!5704 (v!2161 (underlying!126 thiss!992)))) e!32579)))

(declare-fun b!50429 () Bool)

(assert (=> b!50429 (= e!32580 call!3885)))

(declare-fun b!50430 () Bool)

(assert (=> b!50430 (= e!32579 e!32580)))

(declare-fun c!6799 () Bool)

(assert (=> b!50430 (= c!6799 (validKeyInArray!0 (select (arr!1562 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3882 () Bool)

(assert (=> bm!3882 (= call!3885 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3525 (v!2161 (underlying!126 thiss!992))) (mask!5704 (v!2161 (underlying!126 thiss!992)))))))

(assert (= (and d!10171 (not res!29033)) b!50430))

(assert (= (and b!50430 c!6799) b!50428))

(assert (= (and b!50430 (not c!6799)) b!50429))

(assert (= (and b!50428 res!29032) b!50427))

(assert (= (or b!50427 b!50429) bm!3882))

(assert (=> b!50428 m!43629))

(declare-fun m!43635 () Bool)

(assert (=> b!50428 m!43635))

(declare-fun m!43637 () Bool)

(assert (=> b!50428 m!43637))

(assert (=> b!50428 m!43629))

(declare-fun m!43639 () Bool)

(assert (=> b!50428 m!43639))

(assert (=> b!50430 m!43629))

(assert (=> b!50430 m!43629))

(assert (=> b!50430 m!43631))

(declare-fun m!43641 () Bool)

(assert (=> bm!3882 m!43641))

(assert (=> b!50336 d!10171))

(declare-fun d!10173 () Bool)

(declare-fun res!29035 () Bool)

(declare-fun e!32584 () Bool)

(assert (=> d!10173 (=> res!29035 e!32584)))

(assert (=> d!10173 (= res!29035 (bvsge #b00000000000000000000000000000000 (size!1785 (_keys!3525 (v!2161 (underlying!126 thiss!992))))))))

(assert (=> d!10173 (= (arrayNoDuplicates!0 (_keys!3525 (v!2161 (underlying!126 thiss!992))) #b00000000000000000000000000000000 Nil!1312) e!32584)))

(declare-fun bm!3883 () Bool)

(declare-fun call!3886 () Bool)

(declare-fun c!6800 () Bool)

(assert (=> bm!3883 (= call!3886 (arrayNoDuplicates!0 (_keys!3525 (v!2161 (underlying!126 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6800 (Cons!1311 (select (arr!1562 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000) Nil!1312) Nil!1312)))))

(declare-fun b!50431 () Bool)

(declare-fun e!32581 () Bool)

(assert (=> b!50431 (= e!32581 call!3886)))

(declare-fun b!50432 () Bool)

(declare-fun e!32582 () Bool)

(assert (=> b!50432 (= e!32584 e!32582)))

(declare-fun res!29034 () Bool)

(assert (=> b!50432 (=> (not res!29034) (not e!32582))))

(declare-fun e!32583 () Bool)

(assert (=> b!50432 (= res!29034 (not e!32583))))

(declare-fun res!29036 () Bool)

(assert (=> b!50432 (=> (not res!29036) (not e!32583))))

(assert (=> b!50432 (= res!29036 (validKeyInArray!0 (select (arr!1562 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50433 () Bool)

(assert (=> b!50433 (= e!32583 (contains!610 Nil!1312 (select (arr!1562 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50434 () Bool)

(assert (=> b!50434 (= e!32582 e!32581)))

(assert (=> b!50434 (= c!6800 (validKeyInArray!0 (select (arr!1562 (_keys!3525 (v!2161 (underlying!126 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50435 () Bool)

(assert (=> b!50435 (= e!32581 call!3886)))

(assert (= (and d!10173 (not res!29035)) b!50432))

(assert (= (and b!50432 res!29036) b!50433))

(assert (= (and b!50432 res!29034) b!50434))

(assert (= (and b!50434 c!6800) b!50435))

(assert (= (and b!50434 (not c!6800)) b!50431))

(assert (= (or b!50435 b!50431) bm!3883))

(assert (=> bm!3883 m!43629))

(declare-fun m!43643 () Bool)

(assert (=> bm!3883 m!43643))

(assert (=> b!50432 m!43629))

(assert (=> b!50432 m!43629))

(assert (=> b!50432 m!43631))

(assert (=> b!50433 m!43629))

(assert (=> b!50433 m!43629))

(declare-fun m!43645 () Bool)

(assert (=> b!50433 m!43645))

(assert (=> b!50434 m!43629))

(assert (=> b!50434 m!43629))

(assert (=> b!50434 m!43631))

(assert (=> b!50337 d!10173))

(declare-fun d!10175 () Bool)

(assert (=> d!10175 (= (validMask!0 (mask!5704 newMap!16)) (and (or (= (mask!5704 newMap!16) #b00000000000000000000000000000111) (= (mask!5704 newMap!16) #b00000000000000000000000000001111) (= (mask!5704 newMap!16) #b00000000000000000000000000011111) (= (mask!5704 newMap!16) #b00000000000000000000000000111111) (= (mask!5704 newMap!16) #b00000000000000000000000001111111) (= (mask!5704 newMap!16) #b00000000000000000000000011111111) (= (mask!5704 newMap!16) #b00000000000000000000000111111111) (= (mask!5704 newMap!16) #b00000000000000000000001111111111) (= (mask!5704 newMap!16) #b00000000000000000000011111111111) (= (mask!5704 newMap!16) #b00000000000000000000111111111111) (= (mask!5704 newMap!16) #b00000000000000000001111111111111) (= (mask!5704 newMap!16) #b00000000000000000011111111111111) (= (mask!5704 newMap!16) #b00000000000000000111111111111111) (= (mask!5704 newMap!16) #b00000000000000001111111111111111) (= (mask!5704 newMap!16) #b00000000000000011111111111111111) (= (mask!5704 newMap!16) #b00000000000000111111111111111111) (= (mask!5704 newMap!16) #b00000000000001111111111111111111) (= (mask!5704 newMap!16) #b00000000000011111111111111111111) (= (mask!5704 newMap!16) #b00000000000111111111111111111111) (= (mask!5704 newMap!16) #b00000000001111111111111111111111) (= (mask!5704 newMap!16) #b00000000011111111111111111111111) (= (mask!5704 newMap!16) #b00000000111111111111111111111111) (= (mask!5704 newMap!16) #b00000001111111111111111111111111) (= (mask!5704 newMap!16) #b00000011111111111111111111111111) (= (mask!5704 newMap!16) #b00000111111111111111111111111111) (= (mask!5704 newMap!16) #b00001111111111111111111111111111) (= (mask!5704 newMap!16) #b00011111111111111111111111111111) (= (mask!5704 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5704 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10141 d!10175))

(declare-fun d!10177 () Bool)

(declare-fun res!29038 () Bool)

(declare-fun e!32588 () Bool)

(assert (=> d!10177 (=> res!29038 e!32588)))

(assert (=> d!10177 (= res!29038 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1785 (_keys!3525 newMap!16))))))

(assert (=> d!10177 (= (arrayNoDuplicates!0 (_keys!3525 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6784 (Cons!1311 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) Nil!1312) Nil!1312)) e!32588)))

(declare-fun call!3887 () Bool)

(declare-fun c!6801 () Bool)

(declare-fun bm!3884 () Bool)

(assert (=> bm!3884 (= call!3887 (arrayNoDuplicates!0 (_keys!3525 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6801 (Cons!1311 (select (arr!1562 (_keys!3525 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6784 (Cons!1311 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) Nil!1312) Nil!1312)) (ite c!6784 (Cons!1311 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) Nil!1312) Nil!1312))))))

(declare-fun b!50436 () Bool)

(declare-fun e!32585 () Bool)

(assert (=> b!50436 (= e!32585 call!3887)))

(declare-fun b!50437 () Bool)

(declare-fun e!32586 () Bool)

(assert (=> b!50437 (= e!32588 e!32586)))

(declare-fun res!29037 () Bool)

(assert (=> b!50437 (=> (not res!29037) (not e!32586))))

(declare-fun e!32587 () Bool)

(assert (=> b!50437 (= res!29037 (not e!32587))))

(declare-fun res!29039 () Bool)

(assert (=> b!50437 (=> (not res!29039) (not e!32587))))

(assert (=> b!50437 (= res!29039 (validKeyInArray!0 (select (arr!1562 (_keys!3525 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50438 () Bool)

(assert (=> b!50438 (= e!32587 (contains!610 (ite c!6784 (Cons!1311 (select (arr!1562 (_keys!3525 newMap!16)) #b00000000000000000000000000000000) Nil!1312) Nil!1312) (select (arr!1562 (_keys!3525 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50439 () Bool)

(assert (=> b!50439 (= e!32586 e!32585)))

(assert (=> b!50439 (= c!6801 (validKeyInArray!0 (select (arr!1562 (_keys!3525 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50440 () Bool)

(assert (=> b!50440 (= e!32585 call!3887)))

(assert (= (and d!10177 (not res!29038)) b!50437))

(assert (= (and b!50437 res!29039) b!50438))

(assert (= (and b!50437 res!29037) b!50439))

(assert (= (and b!50439 c!6801) b!50440))

(assert (= (and b!50439 (not c!6801)) b!50436))

(assert (= (or b!50440 b!50436) bm!3884))

(assert (=> bm!3884 m!43615))

(declare-fun m!43647 () Bool)

(assert (=> bm!3884 m!43647))

(assert (=> b!50437 m!43615))

(assert (=> b!50437 m!43615))

(assert (=> b!50437 m!43617))

(assert (=> b!50438 m!43615))

(assert (=> b!50438 m!43615))

(declare-fun m!43649 () Bool)

(assert (=> b!50438 m!43649))

(assert (=> b!50439 m!43615))

(assert (=> b!50439 m!43615))

(assert (=> b!50439 m!43617))

(assert (=> bm!3878 d!10177))

(assert (=> b!50373 d!10161))

(declare-fun condMapEmpty!2201 () Bool)

(declare-fun mapDefault!2201 () ValueCell!749)

(assert (=> mapNonEmpty!2200 (= condMapEmpty!2201 (= mapRest!2200 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2201)))))

(declare-fun e!32589 () Bool)

(declare-fun mapRes!2201 () Bool)

(assert (=> mapNonEmpty!2200 (= tp!6700 (and e!32589 mapRes!2201))))

(declare-fun mapNonEmpty!2201 () Bool)

(declare-fun tp!6701 () Bool)

(declare-fun e!32590 () Bool)

(assert (=> mapNonEmpty!2201 (= mapRes!2201 (and tp!6701 e!32590))))

(declare-fun mapRest!2201 () (Array (_ BitVec 32) ValueCell!749))

(declare-fun mapKey!2201 () (_ BitVec 32))

(declare-fun mapValue!2201 () ValueCell!749)

(assert (=> mapNonEmpty!2201 (= mapRest!2200 (store mapRest!2201 mapKey!2201 mapValue!2201))))

(declare-fun mapIsEmpty!2201 () Bool)

(assert (=> mapIsEmpty!2201 mapRes!2201))

(declare-fun b!50442 () Bool)

(assert (=> b!50442 (= e!32589 tp_is_empty!2185)))

(declare-fun b!50441 () Bool)

(assert (=> b!50441 (= e!32590 tp_is_empty!2185)))

(assert (= (and mapNonEmpty!2200 condMapEmpty!2201) mapIsEmpty!2201))

(assert (= (and mapNonEmpty!2200 (not condMapEmpty!2201)) mapNonEmpty!2201))

(assert (= (and mapNonEmpty!2201 ((_ is ValueCellFull!749) mapValue!2201)) b!50441))

(assert (= (and mapNonEmpty!2200 ((_ is ValueCellFull!749) mapDefault!2201)) b!50442))

(declare-fun m!43651 () Bool)

(assert (=> mapNonEmpty!2201 m!43651))

(declare-fun condMapEmpty!2202 () Bool)

(declare-fun mapDefault!2202 () ValueCell!749)

(assert (=> mapNonEmpty!2199 (= condMapEmpty!2202 (= mapRest!2199 ((as const (Array (_ BitVec 32) ValueCell!749)) mapDefault!2202)))))

(declare-fun e!32591 () Bool)

(declare-fun mapRes!2202 () Bool)

(assert (=> mapNonEmpty!2199 (= tp!6699 (and e!32591 mapRes!2202))))

(declare-fun mapNonEmpty!2202 () Bool)

(declare-fun tp!6702 () Bool)

(declare-fun e!32592 () Bool)

(assert (=> mapNonEmpty!2202 (= mapRes!2202 (and tp!6702 e!32592))))

(declare-fun mapValue!2202 () ValueCell!749)

(declare-fun mapKey!2202 () (_ BitVec 32))

(declare-fun mapRest!2202 () (Array (_ BitVec 32) ValueCell!749))

(assert (=> mapNonEmpty!2202 (= mapRest!2199 (store mapRest!2202 mapKey!2202 mapValue!2202))))

(declare-fun mapIsEmpty!2202 () Bool)

(assert (=> mapIsEmpty!2202 mapRes!2202))

(declare-fun b!50444 () Bool)

(assert (=> b!50444 (= e!32591 tp_is_empty!2185)))

(declare-fun b!50443 () Bool)

(assert (=> b!50443 (= e!32592 tp_is_empty!2185)))

(assert (= (and mapNonEmpty!2199 condMapEmpty!2202) mapIsEmpty!2202))

(assert (= (and mapNonEmpty!2199 (not condMapEmpty!2202)) mapNonEmpty!2202))

(assert (= (and mapNonEmpty!2202 ((_ is ValueCellFull!749) mapValue!2202)) b!50443))

(assert (= (and mapNonEmpty!2199 ((_ is ValueCellFull!749) mapDefault!2202)) b!50444))

(declare-fun m!43653 () Bool)

(assert (=> mapNonEmpty!2202 m!43653))

(check-sat (not d!10153) (not b!50392) b_and!2747 (not bm!3882) (not b!50422) (not bm!3883) (not b!50438) (not bm!3884) b_and!2745 (not b!50437) (not d!10151) (not bm!3881) (not b!50439) (not b!50433) (not b!50413) (not bm!3880) (not b!50430) (not d!10159) (not bm!3879) (not b!50428) (not b!50434) (not b!50407) (not b!50418) (not b_next!1537) (not d!10157) (not b!50432) (not b!50386) (not b!50426) (not b!50420) (not mapNonEmpty!2201) (not b_next!1539) (not mapNonEmpty!2202) tp_is_empty!2185 (not b!50412))
(check-sat b_and!2745 b_and!2747 (not b_next!1537) (not b_next!1539))
