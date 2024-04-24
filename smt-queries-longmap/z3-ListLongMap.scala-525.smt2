; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13144 () Bool)

(assert start!13144)

(declare-fun b!115284 () Bool)

(declare-fun b_free!2689 () Bool)

(declare-fun b_next!2689 () Bool)

(assert (=> b!115284 (= b_free!2689 (not b_next!2689))))

(declare-fun tp!10429 () Bool)

(declare-fun b_and!7153 () Bool)

(assert (=> b!115284 (= tp!10429 b_and!7153)))

(declare-fun b!115286 () Bool)

(declare-fun b_free!2691 () Bool)

(declare-fun b_next!2691 () Bool)

(assert (=> b!115286 (= b_free!2691 (not b_next!2691))))

(declare-fun tp!10432 () Bool)

(declare-fun b_and!7155 () Bool)

(assert (=> b!115286 (= tp!10432 b_and!7155)))

(declare-fun b!115282 () Bool)

(declare-fun e!75161 () Bool)

(declare-fun e!75162 () Bool)

(declare-fun mapRes!4215 () Bool)

(assert (=> b!115282 (= e!75161 (and e!75162 mapRes!4215))))

(declare-fun condMapEmpty!4216 () Bool)

(declare-datatypes ((V!3329 0))(
  ( (V!3330 (val!1425 Int)) )
))
(declare-datatypes ((array!4511 0))(
  ( (array!4512 (arr!2138 (Array (_ BitVec 32) (_ BitVec 64))) (size!2398 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1037 0))(
  ( (ValueCellFull!1037 (v!3020 V!3329)) (EmptyCell!1037) )
))
(declare-datatypes ((array!4513 0))(
  ( (array!4514 (arr!2139 (Array (_ BitVec 32) ValueCell!1037)) (size!2399 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!982 0))(
  ( (LongMapFixedSize!983 (defaultEntry!2700 Int) (mask!6906 (_ BitVec 32)) (extraKeys!2489 (_ BitVec 32)) (zeroValue!2567 V!3329) (minValue!2567 V!3329) (_size!540 (_ BitVec 32)) (_keys!4422 array!4511) (_values!2683 array!4513) (_vacant!540 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!982)

(declare-fun mapDefault!4215 () ValueCell!1037)

(assert (=> b!115282 (= condMapEmpty!4216 (= (arr!2139 (_values!2683 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1037)) mapDefault!4215)))))

(declare-fun mapIsEmpty!4215 () Bool)

(assert (=> mapIsEmpty!4215 mapRes!4215))

(declare-fun mapNonEmpty!4215 () Bool)

(declare-fun tp!10430 () Bool)

(declare-fun e!75152 () Bool)

(assert (=> mapNonEmpty!4215 (= mapRes!4215 (and tp!10430 e!75152))))

(declare-fun mapValue!4215 () ValueCell!1037)

(declare-fun mapKey!4216 () (_ BitVec 32))

(declare-fun mapRest!4215 () (Array (_ BitVec 32) ValueCell!1037))

(assert (=> mapNonEmpty!4215 (= (arr!2139 (_values!2683 newMap!16)) (store mapRest!4215 mapKey!4216 mapValue!4215))))

(declare-fun res!56595 () Bool)

(declare-fun e!75164 () Bool)

(assert (=> start!13144 (=> (not res!56595) (not e!75164))))

(declare-datatypes ((Cell!782 0))(
  ( (Cell!783 (v!3021 LongMapFixedSize!982)) )
))
(declare-datatypes ((LongMap!782 0))(
  ( (LongMap!783 (underlying!402 Cell!782)) )
))
(declare-fun thiss!992 () LongMap!782)

(declare-fun valid!470 (LongMap!782) Bool)

(assert (=> start!13144 (= res!56595 (valid!470 thiss!992))))

(assert (=> start!13144 e!75164))

(declare-fun e!75153 () Bool)

(assert (=> start!13144 e!75153))

(assert (=> start!13144 true))

(declare-fun e!75158 () Bool)

(assert (=> start!13144 e!75158))

(declare-fun b!115283 () Bool)

(declare-fun res!56596 () Bool)

(assert (=> b!115283 (=> (not res!56596) (not e!75164))))

(assert (=> b!115283 (= res!56596 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6906 newMap!16)) (_size!540 (v!3021 (underlying!402 thiss!992)))))))

(declare-fun tp_is_empty!2761 () Bool)

(declare-fun e!75159 () Bool)

(declare-fun e!75154 () Bool)

(declare-fun array_inv!1331 (array!4511) Bool)

(declare-fun array_inv!1332 (array!4513) Bool)

(assert (=> b!115284 (= e!75154 (and tp!10429 tp_is_empty!2761 (array_inv!1331 (_keys!4422 (v!3021 (underlying!402 thiss!992)))) (array_inv!1332 (_values!2683 (v!3021 (underlying!402 thiss!992)))) e!75159))))

(declare-fun b!115285 () Bool)

(declare-fun e!75157 () Bool)

(assert (=> b!115285 (= e!75157 tp_is_empty!2761)))

(assert (=> b!115286 (= e!75158 (and tp!10432 tp_is_empty!2761 (array_inv!1331 (_keys!4422 newMap!16)) (array_inv!1332 (_values!2683 newMap!16)) e!75161))))

(declare-fun b!115287 () Bool)

(declare-fun res!56597 () Bool)

(assert (=> b!115287 (=> (not res!56597) (not e!75164))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!115287 (= res!56597 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2398 (_keys!4422 (v!3021 (underlying!402 thiss!992)))))))))

(declare-fun b!115288 () Bool)

(declare-fun e!75160 () Bool)

(assert (=> b!115288 (= e!75160 tp_is_empty!2761)))

(declare-fun b!115289 () Bool)

(declare-fun e!75163 () Bool)

(assert (=> b!115289 (= e!75163 e!75154)))

(declare-fun mapIsEmpty!4216 () Bool)

(declare-fun mapRes!4216 () Bool)

(assert (=> mapIsEmpty!4216 mapRes!4216))

(declare-fun mapNonEmpty!4216 () Bool)

(declare-fun tp!10431 () Bool)

(assert (=> mapNonEmpty!4216 (= mapRes!4216 (and tp!10431 e!75157))))

(declare-fun mapRest!4216 () (Array (_ BitVec 32) ValueCell!1037))

(declare-fun mapKey!4215 () (_ BitVec 32))

(declare-fun mapValue!4216 () ValueCell!1037)

(assert (=> mapNonEmpty!4216 (= (arr!2139 (_values!2683 (v!3021 (underlying!402 thiss!992)))) (store mapRest!4216 mapKey!4215 mapValue!4216))))

(declare-fun b!115290 () Bool)

(assert (=> b!115290 (= e!75153 e!75163)))

(declare-fun b!115291 () Bool)

(assert (=> b!115291 (= e!75164 false)))

(declare-datatypes ((tuple2!2466 0))(
  ( (tuple2!2467 (_1!1244 (_ BitVec 64)) (_2!1244 V!3329)) )
))
(declare-datatypes ((List!1649 0))(
  ( (Nil!1646) (Cons!1645 (h!2245 tuple2!2466) (t!5899 List!1649)) )
))
(declare-datatypes ((ListLongMap!1593 0))(
  ( (ListLongMap!1594 (toList!812 List!1649)) )
))
(declare-fun lt!59925 () ListLongMap!1593)

(declare-fun map!1335 (LongMapFixedSize!982) ListLongMap!1593)

(assert (=> b!115291 (= lt!59925 (map!1335 newMap!16))))

(declare-fun lt!59924 () ListLongMap!1593)

(declare-fun getCurrentListMap!493 (array!4511 array!4513 (_ BitVec 32) (_ BitVec 32) V!3329 V!3329 (_ BitVec 32) Int) ListLongMap!1593)

(assert (=> b!115291 (= lt!59924 (getCurrentListMap!493 (_keys!4422 (v!3021 (underlying!402 thiss!992))) (_values!2683 (v!3021 (underlying!402 thiss!992))) (mask!6906 (v!3021 (underlying!402 thiss!992))) (extraKeys!2489 (v!3021 (underlying!402 thiss!992))) (zeroValue!2567 (v!3021 (underlying!402 thiss!992))) (minValue!2567 (v!3021 (underlying!402 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2700 (v!3021 (underlying!402 thiss!992)))))))

(declare-fun b!115292 () Bool)

(assert (=> b!115292 (= e!75152 tp_is_empty!2761)))

(declare-fun b!115293 () Bool)

(declare-fun res!56594 () Bool)

(assert (=> b!115293 (=> (not res!56594) (not e!75164))))

(declare-fun valid!471 (LongMapFixedSize!982) Bool)

(assert (=> b!115293 (= res!56594 (valid!471 newMap!16))))

(declare-fun b!115294 () Bool)

(assert (=> b!115294 (= e!75159 (and e!75160 mapRes!4216))))

(declare-fun condMapEmpty!4215 () Bool)

(declare-fun mapDefault!4216 () ValueCell!1037)

(assert (=> b!115294 (= condMapEmpty!4215 (= (arr!2139 (_values!2683 (v!3021 (underlying!402 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1037)) mapDefault!4216)))))

(declare-fun b!115295 () Bool)

(assert (=> b!115295 (= e!75162 tp_is_empty!2761)))

(assert (= (and start!13144 res!56595) b!115287))

(assert (= (and b!115287 res!56597) b!115293))

(assert (= (and b!115293 res!56594) b!115283))

(assert (= (and b!115283 res!56596) b!115291))

(assert (= (and b!115294 condMapEmpty!4215) mapIsEmpty!4216))

(assert (= (and b!115294 (not condMapEmpty!4215)) mapNonEmpty!4216))

(get-info :version)

(assert (= (and mapNonEmpty!4216 ((_ is ValueCellFull!1037) mapValue!4216)) b!115285))

(assert (= (and b!115294 ((_ is ValueCellFull!1037) mapDefault!4216)) b!115288))

(assert (= b!115284 b!115294))

(assert (= b!115289 b!115284))

(assert (= b!115290 b!115289))

(assert (= start!13144 b!115290))

(assert (= (and b!115282 condMapEmpty!4216) mapIsEmpty!4215))

(assert (= (and b!115282 (not condMapEmpty!4216)) mapNonEmpty!4215))

(assert (= (and mapNonEmpty!4215 ((_ is ValueCellFull!1037) mapValue!4215)) b!115292))

(assert (= (and b!115282 ((_ is ValueCellFull!1037) mapDefault!4215)) b!115295))

(assert (= b!115286 b!115282))

(assert (= start!13144 b!115286))

(declare-fun m!131349 () Bool)

(assert (=> mapNonEmpty!4216 m!131349))

(declare-fun m!131351 () Bool)

(assert (=> b!115293 m!131351))

(declare-fun m!131353 () Bool)

(assert (=> start!13144 m!131353))

(declare-fun m!131355 () Bool)

(assert (=> b!115284 m!131355))

(declare-fun m!131357 () Bool)

(assert (=> b!115284 m!131357))

(declare-fun m!131359 () Bool)

(assert (=> b!115286 m!131359))

(declare-fun m!131361 () Bool)

(assert (=> b!115286 m!131361))

(declare-fun m!131363 () Bool)

(assert (=> mapNonEmpty!4215 m!131363))

(declare-fun m!131365 () Bool)

(assert (=> b!115291 m!131365))

(declare-fun m!131367 () Bool)

(assert (=> b!115291 m!131367))

(check-sat (not b!115286) (not b!115293) (not b_next!2691) (not mapNonEmpty!4216) (not start!13144) b_and!7155 tp_is_empty!2761 b_and!7153 (not b!115291) (not b!115284) (not mapNonEmpty!4215) (not b_next!2689))
(check-sat b_and!7153 b_and!7155 (not b_next!2689) (not b_next!2691))
