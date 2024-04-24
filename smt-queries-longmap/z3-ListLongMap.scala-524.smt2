; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13138 () Bool)

(assert start!13138)

(declare-fun b!115156 () Bool)

(declare-fun b_free!2677 () Bool)

(declare-fun b_next!2677 () Bool)

(assert (=> b!115156 (= b_free!2677 (not b_next!2677))))

(declare-fun tp!10396 () Bool)

(declare-fun b_and!7141 () Bool)

(assert (=> b!115156 (= tp!10396 b_and!7141)))

(declare-fun b!115152 () Bool)

(declare-fun b_free!2679 () Bool)

(declare-fun b_next!2679 () Bool)

(assert (=> b!115152 (= b_free!2679 (not b_next!2679))))

(declare-fun tp!10395 () Bool)

(declare-fun b_and!7143 () Bool)

(assert (=> b!115152 (= tp!10395 b_and!7143)))

(declare-fun res!56552 () Bool)

(declare-fun e!75036 () Bool)

(assert (=> start!13138 (=> (not res!56552) (not e!75036))))

(declare-datatypes ((V!3321 0))(
  ( (V!3322 (val!1422 Int)) )
))
(declare-datatypes ((array!4499 0))(
  ( (array!4500 (arr!2132 (Array (_ BitVec 32) (_ BitVec 64))) (size!2392 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1034 0))(
  ( (ValueCellFull!1034 (v!3014 V!3321)) (EmptyCell!1034) )
))
(declare-datatypes ((array!4501 0))(
  ( (array!4502 (arr!2133 (Array (_ BitVec 32) ValueCell!1034)) (size!2393 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!976 0))(
  ( (LongMapFixedSize!977 (defaultEntry!2697 Int) (mask!6901 (_ BitVec 32)) (extraKeys!2486 (_ BitVec 32)) (zeroValue!2564 V!3321) (minValue!2564 V!3321) (_size!537 (_ BitVec 32)) (_keys!4419 array!4499) (_values!2680 array!4501) (_vacant!537 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!776 0))(
  ( (Cell!777 (v!3015 LongMapFixedSize!976)) )
))
(declare-datatypes ((LongMap!776 0))(
  ( (LongMap!777 (underlying!399 Cell!776)) )
))
(declare-fun thiss!992 () LongMap!776)

(declare-fun valid!466 (LongMap!776) Bool)

(assert (=> start!13138 (= res!56552 (valid!466 thiss!992))))

(assert (=> start!13138 e!75036))

(declare-fun e!75043 () Bool)

(assert (=> start!13138 e!75043))

(assert (=> start!13138 true))

(declare-fun e!75037 () Bool)

(assert (=> start!13138 e!75037))

(declare-fun b!115149 () Bool)

(declare-fun e!75047 () Bool)

(declare-fun e!75046 () Bool)

(declare-fun mapRes!4198 () Bool)

(assert (=> b!115149 (= e!75047 (and e!75046 mapRes!4198))))

(declare-fun condMapEmpty!4198 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!976)

(declare-fun mapDefault!4198 () ValueCell!1034)

(assert (=> b!115149 (= condMapEmpty!4198 (= (arr!2133 (_values!2680 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1034)) mapDefault!4198)))))

(declare-fun mapIsEmpty!4197 () Bool)

(declare-fun mapRes!4197 () Bool)

(assert (=> mapIsEmpty!4197 mapRes!4197))

(declare-fun b!115150 () Bool)

(declare-fun tp_is_empty!2755 () Bool)

(assert (=> b!115150 (= e!75046 tp_is_empty!2755)))

(declare-fun b!115151 () Bool)

(declare-fun e!75045 () Bool)

(assert (=> b!115151 (= e!75045 tp_is_empty!2755)))

(declare-fun mapIsEmpty!4198 () Bool)

(assert (=> mapIsEmpty!4198 mapRes!4198))

(declare-fun array_inv!1327 (array!4499) Bool)

(declare-fun array_inv!1328 (array!4501) Bool)

(assert (=> b!115152 (= e!75037 (and tp!10395 tp_is_empty!2755 (array_inv!1327 (_keys!4419 newMap!16)) (array_inv!1328 (_values!2680 newMap!16)) e!75047))))

(declare-fun b!115153 () Bool)

(declare-fun res!56554 () Bool)

(assert (=> b!115153 (=> (not res!56554) (not e!75036))))

(declare-fun valid!467 (LongMapFixedSize!976) Bool)

(assert (=> b!115153 (= res!56554 (valid!467 newMap!16))))

(declare-fun b!115154 () Bool)

(declare-fun res!56555 () Bool)

(assert (=> b!115154 (=> (not res!56555) (not e!75036))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2462 0))(
  ( (tuple2!2463 (_1!1242 (_ BitVec 64)) (_2!1242 V!3321)) )
))
(declare-datatypes ((List!1647 0))(
  ( (Nil!1644) (Cons!1643 (h!2243 tuple2!2462) (t!5897 List!1647)) )
))
(declare-datatypes ((ListLongMap!1589 0))(
  ( (ListLongMap!1590 (toList!810 List!1647)) )
))
(declare-fun getCurrentListMap!491 (array!4499 array!4501 (_ BitVec 32) (_ BitVec 32) V!3321 V!3321 (_ BitVec 32) Int) ListLongMap!1589)

(declare-fun map!1331 (LongMapFixedSize!976) ListLongMap!1589)

(assert (=> b!115154 (= res!56555 (= (getCurrentListMap!491 (_keys!4419 (v!3015 (underlying!399 thiss!992))) (_values!2680 (v!3015 (underlying!399 thiss!992))) (mask!6901 (v!3015 (underlying!399 thiss!992))) (extraKeys!2486 (v!3015 (underlying!399 thiss!992))) (zeroValue!2564 (v!3015 (underlying!399 thiss!992))) (minValue!2564 (v!3015 (underlying!399 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2697 (v!3015 (underlying!399 thiss!992)))) (map!1331 newMap!16)))))

(declare-fun mapNonEmpty!4197 () Bool)

(declare-fun tp!10394 () Bool)

(declare-fun e!75035 () Bool)

(assert (=> mapNonEmpty!4197 (= mapRes!4198 (and tp!10394 e!75035))))

(declare-fun mapValue!4198 () ValueCell!1034)

(declare-fun mapRest!4198 () (Array (_ BitVec 32) ValueCell!1034))

(declare-fun mapKey!4198 () (_ BitVec 32))

(assert (=> mapNonEmpty!4197 (= (arr!2133 (_values!2680 newMap!16)) (store mapRest!4198 mapKey!4198 mapValue!4198))))

(declare-fun b!115155 () Bool)

(assert (=> b!115155 (= e!75035 tp_is_empty!2755)))

(declare-fun e!75042 () Bool)

(declare-fun e!75040 () Bool)

(assert (=> b!115156 (= e!75040 (and tp!10396 tp_is_empty!2755 (array_inv!1327 (_keys!4419 (v!3015 (underlying!399 thiss!992)))) (array_inv!1328 (_values!2680 (v!3015 (underlying!399 thiss!992)))) e!75042))))

(declare-fun b!115157 () Bool)

(declare-fun e!75039 () Bool)

(assert (=> b!115157 (= e!75039 tp_is_empty!2755)))

(declare-fun b!115158 () Bool)

(assert (=> b!115158 (= e!75036 (and (or (= (select (arr!2132 (_keys!4419 (v!3015 (underlying!399 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2132 (_keys!4419 (v!3015 (underlying!399 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2392 (_keys!4419 (v!3015 (underlying!399 thiss!992)))))))))

(declare-fun b!115159 () Bool)

(declare-fun e!75038 () Bool)

(assert (=> b!115159 (= e!75038 e!75040)))

(declare-fun b!115160 () Bool)

(assert (=> b!115160 (= e!75042 (and e!75039 mapRes!4197))))

(declare-fun condMapEmpty!4197 () Bool)

(declare-fun mapDefault!4197 () ValueCell!1034)

(assert (=> b!115160 (= condMapEmpty!4197 (= (arr!2133 (_values!2680 (v!3015 (underlying!399 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1034)) mapDefault!4197)))))

(declare-fun b!115161 () Bool)

(declare-fun res!56551 () Bool)

(assert (=> b!115161 (=> (not res!56551) (not e!75036))))

(assert (=> b!115161 (= res!56551 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2392 (_keys!4419 (v!3015 (underlying!399 thiss!992)))))))))

(declare-fun mapNonEmpty!4198 () Bool)

(declare-fun tp!10393 () Bool)

(assert (=> mapNonEmpty!4198 (= mapRes!4197 (and tp!10393 e!75045))))

(declare-fun mapRest!4197 () (Array (_ BitVec 32) ValueCell!1034))

(declare-fun mapValue!4197 () ValueCell!1034)

(declare-fun mapKey!4197 () (_ BitVec 32))

(assert (=> mapNonEmpty!4198 (= (arr!2133 (_values!2680 (v!3015 (underlying!399 thiss!992)))) (store mapRest!4197 mapKey!4197 mapValue!4197))))

(declare-fun b!115162 () Bool)

(assert (=> b!115162 (= e!75043 e!75038)))

(declare-fun b!115163 () Bool)

(declare-fun res!56553 () Bool)

(assert (=> b!115163 (=> (not res!56553) (not e!75036))))

(assert (=> b!115163 (= res!56553 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6901 newMap!16)) (_size!537 (v!3015 (underlying!399 thiss!992)))))))

(assert (= (and start!13138 res!56552) b!115161))

(assert (= (and b!115161 res!56551) b!115153))

(assert (= (and b!115153 res!56554) b!115163))

(assert (= (and b!115163 res!56553) b!115154))

(assert (= (and b!115154 res!56555) b!115158))

(assert (= (and b!115160 condMapEmpty!4197) mapIsEmpty!4197))

(assert (= (and b!115160 (not condMapEmpty!4197)) mapNonEmpty!4198))

(get-info :version)

(assert (= (and mapNonEmpty!4198 ((_ is ValueCellFull!1034) mapValue!4197)) b!115151))

(assert (= (and b!115160 ((_ is ValueCellFull!1034) mapDefault!4197)) b!115157))

(assert (= b!115156 b!115160))

(assert (= b!115159 b!115156))

(assert (= b!115162 b!115159))

(assert (= start!13138 b!115162))

(assert (= (and b!115149 condMapEmpty!4198) mapIsEmpty!4198))

(assert (= (and b!115149 (not condMapEmpty!4198)) mapNonEmpty!4197))

(assert (= (and mapNonEmpty!4197 ((_ is ValueCellFull!1034) mapValue!4198)) b!115155))

(assert (= (and b!115149 ((_ is ValueCellFull!1034) mapDefault!4198)) b!115150))

(assert (= b!115152 b!115149))

(assert (= start!13138 b!115152))

(declare-fun m!131283 () Bool)

(assert (=> mapNonEmpty!4198 m!131283))

(declare-fun m!131285 () Bool)

(assert (=> start!13138 m!131285))

(declare-fun m!131287 () Bool)

(assert (=> b!115152 m!131287))

(declare-fun m!131289 () Bool)

(assert (=> b!115152 m!131289))

(declare-fun m!131291 () Bool)

(assert (=> b!115153 m!131291))

(declare-fun m!131293 () Bool)

(assert (=> b!115154 m!131293))

(declare-fun m!131295 () Bool)

(assert (=> b!115154 m!131295))

(declare-fun m!131297 () Bool)

(assert (=> b!115158 m!131297))

(declare-fun m!131299 () Bool)

(assert (=> b!115156 m!131299))

(declare-fun m!131301 () Bool)

(assert (=> b!115156 m!131301))

(declare-fun m!131303 () Bool)

(assert (=> mapNonEmpty!4197 m!131303))

(check-sat (not b!115156) b_and!7143 b_and!7141 (not b!115153) (not start!13138) (not b!115152) tp_is_empty!2755 (not b_next!2679) (not b_next!2677) (not b!115154) (not mapNonEmpty!4198) (not mapNonEmpty!4197))
(check-sat b_and!7141 b_and!7143 (not b_next!2677) (not b_next!2679))
