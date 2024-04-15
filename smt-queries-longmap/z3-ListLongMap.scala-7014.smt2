; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89086 () Bool)

(assert start!89086)

(declare-fun b!1021236 () Bool)

(declare-fun b_free!20137 () Bool)

(declare-fun b_next!20137 () Bool)

(assert (=> b!1021236 (= b_free!20137 (not b_next!20137))))

(declare-fun tp!71443 () Bool)

(declare-fun b_and!32309 () Bool)

(assert (=> b!1021236 (= tp!71443 b_and!32309)))

(declare-fun b!1021234 () Bool)

(declare-fun e!575158 () Bool)

(declare-datatypes ((array!63695 0))(
  ( (array!63696 (arr!30660 (Array (_ BitVec 32) (_ BitVec 64))) (size!31173 (_ BitVec 32))) )
))
(declare-datatypes ((V!36683 0))(
  ( (V!36684 (val!11979 Int)) )
))
(declare-datatypes ((ValueCell!11225 0))(
  ( (ValueCellFull!11225 (v!14544 V!36683)) (EmptyCell!11225) )
))
(declare-datatypes ((array!63697 0))(
  ( (array!63698 (arr!30661 (Array (_ BitVec 32) ValueCell!11225)) (size!31174 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5044 0))(
  ( (LongMapFixedSize!5045 (defaultEntry!5874 Int) (mask!29438 (_ BitVec 32)) (extraKeys!5606 (_ BitVec 32)) (zeroValue!5710 V!36683) (minValue!5710 V!36683) (_size!2577 (_ BitVec 32)) (_keys!11015 array!63695) (_values!5897 array!63697) (_vacant!2577 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1110 0))(
  ( (Cell!1111 (v!14545 LongMapFixedSize!5044)) )
))
(declare-datatypes ((LongMap!1110 0))(
  ( (LongMap!1111 (underlying!566 Cell!1110)) )
))
(declare-fun thiss!1120 () LongMap!1110)

(declare-fun valid!1926 (LongMapFixedSize!5044) Bool)

(assert (=> b!1021234 (= e!575158 (not (valid!1926 (v!14545 (underlying!566 thiss!1120)))))))

(declare-fun b!1021235 () Bool)

(declare-fun e!575157 () Bool)

(declare-fun e!575156 () Bool)

(assert (=> b!1021235 (= e!575157 e!575156)))

(declare-fun res!684304 () Bool)

(assert (=> start!89086 (=> (not res!684304) (not e!575158))))

(declare-fun valid!1927 (LongMap!1110) Bool)

(assert (=> start!89086 (= res!684304 (valid!1927 thiss!1120))))

(assert (=> start!89086 e!575158))

(declare-fun e!575155 () Bool)

(assert (=> start!89086 e!575155))

(declare-fun tp_is_empty!23857 () Bool)

(declare-fun e!575152 () Bool)

(declare-fun array_inv!23791 (array!63695) Bool)

(declare-fun array_inv!23792 (array!63697) Bool)

(assert (=> b!1021236 (= e!575156 (and tp!71443 tp_is_empty!23857 (array_inv!23791 (_keys!11015 (v!14545 (underlying!566 thiss!1120)))) (array_inv!23792 (_values!5897 (v!14545 (underlying!566 thiss!1120)))) e!575152))))

(declare-fun b!1021237 () Bool)

(declare-fun e!575154 () Bool)

(declare-fun mapRes!37200 () Bool)

(assert (=> b!1021237 (= e!575152 (and e!575154 mapRes!37200))))

(declare-fun condMapEmpty!37200 () Bool)

(declare-fun mapDefault!37200 () ValueCell!11225)

(assert (=> b!1021237 (= condMapEmpty!37200 (= (arr!30661 (_values!5897 (v!14545 (underlying!566 thiss!1120)))) ((as const (Array (_ BitVec 32) ValueCell!11225)) mapDefault!37200)))))

(declare-fun b!1021238 () Bool)

(assert (=> b!1021238 (= e!575154 tp_is_empty!23857)))

(declare-fun b!1021239 () Bool)

(assert (=> b!1021239 (= e!575155 e!575157)))

(declare-fun mapNonEmpty!37200 () Bool)

(declare-fun tp!71442 () Bool)

(declare-fun e!575153 () Bool)

(assert (=> mapNonEmpty!37200 (= mapRes!37200 (and tp!71442 e!575153))))

(declare-fun mapValue!37200 () ValueCell!11225)

(declare-fun mapKey!37200 () (_ BitVec 32))

(declare-fun mapRest!37200 () (Array (_ BitVec 32) ValueCell!11225))

(assert (=> mapNonEmpty!37200 (= (arr!30661 (_values!5897 (v!14545 (underlying!566 thiss!1120)))) (store mapRest!37200 mapKey!37200 mapValue!37200))))

(declare-fun mapIsEmpty!37200 () Bool)

(assert (=> mapIsEmpty!37200 mapRes!37200))

(declare-fun b!1021240 () Bool)

(assert (=> b!1021240 (= e!575153 tp_is_empty!23857)))

(assert (= (and start!89086 res!684304) b!1021234))

(assert (= (and b!1021237 condMapEmpty!37200) mapIsEmpty!37200))

(assert (= (and b!1021237 (not condMapEmpty!37200)) mapNonEmpty!37200))

(get-info :version)

(assert (= (and mapNonEmpty!37200 ((_ is ValueCellFull!11225) mapValue!37200)) b!1021240))

(assert (= (and b!1021237 ((_ is ValueCellFull!11225) mapDefault!37200)) b!1021238))

(assert (= b!1021236 b!1021237))

(assert (= b!1021235 b!1021236))

(assert (= b!1021239 b!1021235))

(assert (= start!89086 b!1021239))

(declare-fun m!940325 () Bool)

(assert (=> b!1021234 m!940325))

(declare-fun m!940327 () Bool)

(assert (=> start!89086 m!940327))

(declare-fun m!940329 () Bool)

(assert (=> b!1021236 m!940329))

(declare-fun m!940331 () Bool)

(assert (=> b!1021236 m!940331))

(declare-fun m!940333 () Bool)

(assert (=> mapNonEmpty!37200 m!940333))

(check-sat b_and!32309 (not b!1021236) (not b_next!20137) (not mapNonEmpty!37200) (not b!1021234) (not start!89086) tp_is_empty!23857)
(check-sat b_and!32309 (not b_next!20137))
(get-model)

(declare-fun d!122363 () Bool)

(assert (=> d!122363 (= (valid!1927 thiss!1120) (valid!1926 (v!14545 (underlying!566 thiss!1120))))))

(declare-fun bs!29744 () Bool)

(assert (= bs!29744 d!122363))

(assert (=> bs!29744 m!940325))

(assert (=> start!89086 d!122363))

(declare-fun d!122365 () Bool)

(assert (=> d!122365 (= (array_inv!23791 (_keys!11015 (v!14545 (underlying!566 thiss!1120)))) (bvsge (size!31173 (_keys!11015 (v!14545 (underlying!566 thiss!1120)))) #b00000000000000000000000000000000))))

(assert (=> b!1021236 d!122365))

(declare-fun d!122367 () Bool)

(assert (=> d!122367 (= (array_inv!23792 (_values!5897 (v!14545 (underlying!566 thiss!1120)))) (bvsge (size!31174 (_values!5897 (v!14545 (underlying!566 thiss!1120)))) #b00000000000000000000000000000000))))

(assert (=> b!1021236 d!122367))

(declare-fun d!122369 () Bool)

(declare-fun res!684317 () Bool)

(declare-fun e!575210 () Bool)

(assert (=> d!122369 (=> (not res!684317) (not e!575210))))

(declare-fun simpleValid!386 (LongMapFixedSize!5044) Bool)

(assert (=> d!122369 (= res!684317 (simpleValid!386 (v!14545 (underlying!566 thiss!1120))))))

(assert (=> d!122369 (= (valid!1926 (v!14545 (underlying!566 thiss!1120))) e!575210)))

(declare-fun b!1021289 () Bool)

(declare-fun res!684318 () Bool)

(assert (=> b!1021289 (=> (not res!684318) (not e!575210))))

(declare-fun arrayCountValidKeys!0 (array!63695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1021289 (= res!684318 (= (arrayCountValidKeys!0 (_keys!11015 (v!14545 (underlying!566 thiss!1120))) #b00000000000000000000000000000000 (size!31173 (_keys!11015 (v!14545 (underlying!566 thiss!1120))))) (_size!2577 (v!14545 (underlying!566 thiss!1120)))))))

(declare-fun b!1021290 () Bool)

(declare-fun res!684319 () Bool)

(assert (=> b!1021290 (=> (not res!684319) (not e!575210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63695 (_ BitVec 32)) Bool)

(assert (=> b!1021290 (= res!684319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11015 (v!14545 (underlying!566 thiss!1120))) (mask!29438 (v!14545 (underlying!566 thiss!1120)))))))

(declare-fun b!1021291 () Bool)

(declare-datatypes ((List!21689 0))(
  ( (Nil!21686) (Cons!21685 (h!22883 (_ BitVec 64)) (t!30694 List!21689)) )
))
(declare-fun arrayNoDuplicates!0 (array!63695 (_ BitVec 32) List!21689) Bool)

(assert (=> b!1021291 (= e!575210 (arrayNoDuplicates!0 (_keys!11015 (v!14545 (underlying!566 thiss!1120))) #b00000000000000000000000000000000 Nil!21686))))

(assert (= (and d!122369 res!684317) b!1021289))

(assert (= (and b!1021289 res!684318) b!1021290))

(assert (= (and b!1021290 res!684319) b!1021291))

(declare-fun m!940355 () Bool)

(assert (=> d!122369 m!940355))

(declare-fun m!940357 () Bool)

(assert (=> b!1021289 m!940357))

(declare-fun m!940359 () Bool)

(assert (=> b!1021290 m!940359))

(declare-fun m!940361 () Bool)

(assert (=> b!1021291 m!940361))

(assert (=> b!1021234 d!122369))

(declare-fun mapIsEmpty!37209 () Bool)

(declare-fun mapRes!37209 () Bool)

(assert (=> mapIsEmpty!37209 mapRes!37209))

(declare-fun condMapEmpty!37209 () Bool)

(declare-fun mapDefault!37209 () ValueCell!11225)

(assert (=> mapNonEmpty!37200 (= condMapEmpty!37209 (= mapRest!37200 ((as const (Array (_ BitVec 32) ValueCell!11225)) mapDefault!37209)))))

(declare-fun e!575216 () Bool)

(assert (=> mapNonEmpty!37200 (= tp!71442 (and e!575216 mapRes!37209))))

(declare-fun b!1021299 () Bool)

(assert (=> b!1021299 (= e!575216 tp_is_empty!23857)))

(declare-fun b!1021298 () Bool)

(declare-fun e!575215 () Bool)

(assert (=> b!1021298 (= e!575215 tp_is_empty!23857)))

(declare-fun mapNonEmpty!37209 () Bool)

(declare-fun tp!71458 () Bool)

(assert (=> mapNonEmpty!37209 (= mapRes!37209 (and tp!71458 e!575215))))

(declare-fun mapValue!37209 () ValueCell!11225)

(declare-fun mapKey!37209 () (_ BitVec 32))

(declare-fun mapRest!37209 () (Array (_ BitVec 32) ValueCell!11225))

(assert (=> mapNonEmpty!37209 (= mapRest!37200 (store mapRest!37209 mapKey!37209 mapValue!37209))))

(assert (= (and mapNonEmpty!37200 condMapEmpty!37209) mapIsEmpty!37209))

(assert (= (and mapNonEmpty!37200 (not condMapEmpty!37209)) mapNonEmpty!37209))

(assert (= (and mapNonEmpty!37209 ((_ is ValueCellFull!11225) mapValue!37209)) b!1021298))

(assert (= (and mapNonEmpty!37200 ((_ is ValueCellFull!11225) mapDefault!37209)) b!1021299))

(declare-fun m!940363 () Bool)

(assert (=> mapNonEmpty!37209 m!940363))

(check-sat b_and!32309 (not mapNonEmpty!37209) (not b!1021291) tp_is_empty!23857 (not b!1021290) (not d!122369) (not b!1021289) (not d!122363) (not b_next!20137))
(check-sat b_and!32309 (not b_next!20137))
