; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13144 () Bool)

(assert start!13144)

(declare-fun b!115253 () Bool)

(declare-fun b_free!2689 () Bool)

(declare-fun b_next!2689 () Bool)

(assert (=> b!115253 (= b_free!2689 (not b_next!2689))))

(declare-fun tp!10429 () Bool)

(declare-fun b_and!7145 () Bool)

(assert (=> b!115253 (= tp!10429 b_and!7145)))

(declare-fun b!115246 () Bool)

(declare-fun b_free!2691 () Bool)

(declare-fun b_next!2691 () Bool)

(assert (=> b!115246 (= b_free!2691 (not b_next!2691))))

(declare-fun tp!10431 () Bool)

(declare-fun b_and!7147 () Bool)

(assert (=> b!115246 (= tp!10431 b_and!7147)))

(declare-fun e!75131 () Bool)

(declare-fun tp_is_empty!2761 () Bool)

(declare-datatypes ((V!3329 0))(
  ( (V!3330 (val!1425 Int)) )
))
(declare-datatypes ((array!4505 0))(
  ( (array!4506 (arr!2134 (Array (_ BitVec 32) (_ BitVec 64))) (size!2395 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1037 0))(
  ( (ValueCellFull!1037 (v!3011 V!3329)) (EmptyCell!1037) )
))
(declare-datatypes ((array!4507 0))(
  ( (array!4508 (arr!2135 (Array (_ BitVec 32) ValueCell!1037)) (size!2396 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!982 0))(
  ( (LongMapFixedSize!983 (defaultEntry!2700 Int) (mask!6905 (_ BitVec 32)) (extraKeys!2489 (_ BitVec 32)) (zeroValue!2567 V!3329) (minValue!2567 V!3329) (_size!540 (_ BitVec 32)) (_keys!4421 array!4505) (_values!2683 array!4507) (_vacant!540 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!982)

(declare-fun e!75129 () Bool)

(declare-fun array_inv!1353 (array!4505) Bool)

(declare-fun array_inv!1354 (array!4507) Bool)

(assert (=> b!115246 (= e!75131 (and tp!10431 tp_is_empty!2761 (array_inv!1353 (_keys!4421 newMap!16)) (array_inv!1354 (_values!2683 newMap!16)) e!75129))))

(declare-fun mapNonEmpty!4215 () Bool)

(declare-fun mapRes!4216 () Bool)

(declare-fun tp!10430 () Bool)

(declare-fun e!75127 () Bool)

(assert (=> mapNonEmpty!4215 (= mapRes!4216 (and tp!10430 e!75127))))

(declare-fun mapRest!4216 () (Array (_ BitVec 32) ValueCell!1037))

(declare-fun mapValue!4215 () ValueCell!1037)

(declare-fun mapKey!4216 () (_ BitVec 32))

(assert (=> mapNonEmpty!4215 (= (arr!2135 (_values!2683 newMap!16)) (store mapRest!4216 mapKey!4216 mapValue!4215))))

(declare-fun b!115247 () Bool)

(declare-fun e!75126 () Bool)

(assert (=> b!115247 (= e!75126 tp_is_empty!2761)))

(declare-fun mapIsEmpty!4215 () Bool)

(assert (=> mapIsEmpty!4215 mapRes!4216))

(declare-fun b!115248 () Bool)

(declare-fun e!75133 () Bool)

(assert (=> b!115248 (= e!75129 (and e!75133 mapRes!4216))))

(declare-fun condMapEmpty!4216 () Bool)

(declare-fun mapDefault!4216 () ValueCell!1037)

(assert (=> b!115248 (= condMapEmpty!4216 (= (arr!2135 (_values!2683 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1037)) mapDefault!4216)))))

(declare-fun b!115249 () Bool)

(declare-fun res!56569 () Bool)

(declare-fun e!75135 () Bool)

(assert (=> b!115249 (=> (not res!56569) (not e!75135))))

(declare-datatypes ((Cell!770 0))(
  ( (Cell!771 (v!3012 LongMapFixedSize!982)) )
))
(declare-datatypes ((LongMap!770 0))(
  ( (LongMap!771 (underlying!396 Cell!770)) )
))
(declare-fun thiss!992 () LongMap!770)

(assert (=> b!115249 (= res!56569 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6905 newMap!16)) (_size!540 (v!3012 (underlying!396 thiss!992)))))))

(declare-fun b!115250 () Bool)

(declare-fun res!56571 () Bool)

(assert (=> b!115250 (=> (not res!56571) (not e!75135))))

(declare-fun valid!467 (LongMapFixedSize!982) Bool)

(assert (=> b!115250 (= res!56571 (valid!467 newMap!16))))

(declare-fun b!115251 () Bool)

(assert (=> b!115251 (= e!75135 false)))

(declare-datatypes ((tuple2!2476 0))(
  ( (tuple2!2477 (_1!1249 (_ BitVec 64)) (_2!1249 V!3329)) )
))
(declare-datatypes ((List!1662 0))(
  ( (Nil!1659) (Cons!1658 (h!2258 tuple2!2476) (t!5911 List!1662)) )
))
(declare-datatypes ((ListLongMap!1601 0))(
  ( (ListLongMap!1602 (toList!816 List!1662)) )
))
(declare-fun lt!59882 () ListLongMap!1601)

(declare-fun map!1321 (LongMapFixedSize!982) ListLongMap!1601)

(assert (=> b!115251 (= lt!59882 (map!1321 newMap!16))))

(declare-fun lt!59883 () ListLongMap!1601)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!487 (array!4505 array!4507 (_ BitVec 32) (_ BitVec 32) V!3329 V!3329 (_ BitVec 32) Int) ListLongMap!1601)

(assert (=> b!115251 (= lt!59883 (getCurrentListMap!487 (_keys!4421 (v!3012 (underlying!396 thiss!992))) (_values!2683 (v!3012 (underlying!396 thiss!992))) (mask!6905 (v!3012 (underlying!396 thiss!992))) (extraKeys!2489 (v!3012 (underlying!396 thiss!992))) (zeroValue!2567 (v!3012 (underlying!396 thiss!992))) (minValue!2567 (v!3012 (underlying!396 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2700 (v!3012 (underlying!396 thiss!992)))))))

(declare-fun res!56568 () Bool)

(assert (=> start!13144 (=> (not res!56568) (not e!75135))))

(declare-fun valid!468 (LongMap!770) Bool)

(assert (=> start!13144 (= res!56568 (valid!468 thiss!992))))

(assert (=> start!13144 e!75135))

(declare-fun e!75134 () Bool)

(assert (=> start!13144 e!75134))

(assert (=> start!13144 true))

(assert (=> start!13144 e!75131))

(declare-fun b!115252 () Bool)

(assert (=> b!115252 (= e!75133 tp_is_empty!2761)))

(declare-fun e!75132 () Bool)

(declare-fun e!75130 () Bool)

(assert (=> b!115253 (= e!75132 (and tp!10429 tp_is_empty!2761 (array_inv!1353 (_keys!4421 (v!3012 (underlying!396 thiss!992)))) (array_inv!1354 (_values!2683 (v!3012 (underlying!396 thiss!992)))) e!75130))))

(declare-fun b!115254 () Bool)

(declare-fun e!75137 () Bool)

(assert (=> b!115254 (= e!75137 tp_is_empty!2761)))

(declare-fun b!115255 () Bool)

(declare-fun res!56570 () Bool)

(assert (=> b!115255 (=> (not res!56570) (not e!75135))))

(assert (=> b!115255 (= res!56570 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2395 (_keys!4421 (v!3012 (underlying!396 thiss!992)))))))))

(declare-fun b!115256 () Bool)

(assert (=> b!115256 (= e!75127 tp_is_empty!2761)))

(declare-fun b!115257 () Bool)

(declare-fun e!75128 () Bool)

(assert (=> b!115257 (= e!75128 e!75132)))

(declare-fun b!115258 () Bool)

(assert (=> b!115258 (= e!75134 e!75128)))

(declare-fun mapIsEmpty!4216 () Bool)

(declare-fun mapRes!4215 () Bool)

(assert (=> mapIsEmpty!4216 mapRes!4215))

(declare-fun mapNonEmpty!4216 () Bool)

(declare-fun tp!10432 () Bool)

(assert (=> mapNonEmpty!4216 (= mapRes!4215 (and tp!10432 e!75137))))

(declare-fun mapValue!4216 () ValueCell!1037)

(declare-fun mapKey!4215 () (_ BitVec 32))

(declare-fun mapRest!4215 () (Array (_ BitVec 32) ValueCell!1037))

(assert (=> mapNonEmpty!4216 (= (arr!2135 (_values!2683 (v!3012 (underlying!396 thiss!992)))) (store mapRest!4215 mapKey!4215 mapValue!4216))))

(declare-fun b!115259 () Bool)

(assert (=> b!115259 (= e!75130 (and e!75126 mapRes!4215))))

(declare-fun condMapEmpty!4215 () Bool)

(declare-fun mapDefault!4215 () ValueCell!1037)

(assert (=> b!115259 (= condMapEmpty!4215 (= (arr!2135 (_values!2683 (v!3012 (underlying!396 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1037)) mapDefault!4215)))))

(assert (= (and start!13144 res!56568) b!115255))

(assert (= (and b!115255 res!56570) b!115250))

(assert (= (and b!115250 res!56571) b!115249))

(assert (= (and b!115249 res!56569) b!115251))

(assert (= (and b!115259 condMapEmpty!4215) mapIsEmpty!4216))

(assert (= (and b!115259 (not condMapEmpty!4215)) mapNonEmpty!4216))

(get-info :version)

(assert (= (and mapNonEmpty!4216 ((_ is ValueCellFull!1037) mapValue!4216)) b!115254))

(assert (= (and b!115259 ((_ is ValueCellFull!1037) mapDefault!4215)) b!115247))

(assert (= b!115253 b!115259))

(assert (= b!115257 b!115253))

(assert (= b!115258 b!115257))

(assert (= start!13144 b!115258))

(assert (= (and b!115248 condMapEmpty!4216) mapIsEmpty!4215))

(assert (= (and b!115248 (not condMapEmpty!4216)) mapNonEmpty!4215))

(assert (= (and mapNonEmpty!4215 ((_ is ValueCellFull!1037) mapValue!4215)) b!115256))

(assert (= (and b!115248 ((_ is ValueCellFull!1037) mapDefault!4216)) b!115252))

(assert (= b!115246 b!115248))

(assert (= start!13144 b!115246))

(declare-fun m!131187 () Bool)

(assert (=> b!115253 m!131187))

(declare-fun m!131189 () Bool)

(assert (=> b!115253 m!131189))

(declare-fun m!131191 () Bool)

(assert (=> b!115250 m!131191))

(declare-fun m!131193 () Bool)

(assert (=> mapNonEmpty!4215 m!131193))

(declare-fun m!131195 () Bool)

(assert (=> start!13144 m!131195))

(declare-fun m!131197 () Bool)

(assert (=> mapNonEmpty!4216 m!131197))

(declare-fun m!131199 () Bool)

(assert (=> b!115251 m!131199))

(declare-fun m!131201 () Bool)

(assert (=> b!115251 m!131201))

(declare-fun m!131203 () Bool)

(assert (=> b!115246 m!131203))

(declare-fun m!131205 () Bool)

(assert (=> b!115246 m!131205))

(check-sat (not b_next!2691) (not b_next!2689) tp_is_empty!2761 (not mapNonEmpty!4216) (not mapNonEmpty!4215) (not b!115246) b_and!7147 (not start!13144) (not b!115253) (not b!115251) b_and!7145 (not b!115250))
(check-sat b_and!7145 b_and!7147 (not b_next!2689) (not b_next!2691))
