; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13150 () Bool)

(assert start!13150)

(declare-fun b!115385 () Bool)

(declare-fun b_free!2701 () Bool)

(declare-fun b_next!2701 () Bool)

(assert (=> b!115385 (= b_free!2701 (not b_next!2701))))

(declare-fun tp!10465 () Bool)

(declare-fun b_and!7157 () Bool)

(assert (=> b!115385 (= tp!10465 b_and!7157)))

(declare-fun b!115373 () Bool)

(declare-fun b_free!2703 () Bool)

(declare-fun b_next!2703 () Bool)

(assert (=> b!115373 (= b_free!2703 (not b_next!2703))))

(declare-fun tp!10467 () Bool)

(declare-fun b_and!7159 () Bool)

(assert (=> b!115373 (= tp!10467 b_and!7159)))

(declare-fun mapNonEmpty!4233 () Bool)

(declare-fun mapRes!4233 () Bool)

(declare-fun tp!10466 () Bool)

(declare-fun e!75249 () Bool)

(assert (=> mapNonEmpty!4233 (= mapRes!4233 (and tp!10466 e!75249))))

(declare-fun mapKey!4233 () (_ BitVec 32))

(declare-datatypes ((V!3337 0))(
  ( (V!3338 (val!1428 Int)) )
))
(declare-datatypes ((ValueCell!1040 0))(
  ( (ValueCellFull!1040 (v!3017 V!3337)) (EmptyCell!1040) )
))
(declare-fun mapRest!4234 () (Array (_ BitVec 32) ValueCell!1040))

(declare-fun mapValue!4234 () ValueCell!1040)

(declare-datatypes ((array!4517 0))(
  ( (array!4518 (arr!2140 (Array (_ BitVec 32) (_ BitVec 64))) (size!2401 (_ BitVec 32))) )
))
(declare-datatypes ((array!4519 0))(
  ( (array!4520 (arr!2141 (Array (_ BitVec 32) ValueCell!1040)) (size!2402 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!988 0))(
  ( (LongMapFixedSize!989 (defaultEntry!2703 Int) (mask!6910 (_ BitVec 32)) (extraKeys!2492 (_ BitVec 32)) (zeroValue!2570 V!3337) (minValue!2570 V!3337) (_size!543 (_ BitVec 32)) (_keys!4424 array!4517) (_values!2686 array!4519) (_vacant!543 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!988)

(assert (=> mapNonEmpty!4233 (= (arr!2141 (_values!2686 newMap!16)) (store mapRest!4234 mapKey!4233 mapValue!4234))))

(declare-fun b!115372 () Bool)

(declare-fun e!75247 () Bool)

(declare-fun e!75255 () Bool)

(assert (=> b!115372 (= e!75247 (and e!75255 mapRes!4233))))

(declare-fun condMapEmpty!4233 () Bool)

(declare-fun mapDefault!4233 () ValueCell!1040)

(assert (=> b!115372 (= condMapEmpty!4233 (= (arr!2141 (_values!2686 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1040)) mapDefault!4233)))))

(declare-fun tp_is_empty!2767 () Bool)

(declare-fun e!75252 () Bool)

(declare-fun array_inv!1355 (array!4517) Bool)

(declare-fun array_inv!1356 (array!4519) Bool)

(assert (=> b!115373 (= e!75252 (and tp!10467 tp_is_empty!2767 (array_inv!1355 (_keys!4424 newMap!16)) (array_inv!1356 (_values!2686 newMap!16)) e!75247))))

(declare-fun b!115374 () Bool)

(assert (=> b!115374 (= e!75249 tp_is_empty!2767)))

(declare-fun b!115375 () Bool)

(declare-fun e!75248 () Bool)

(assert (=> b!115375 (= e!75248 tp_is_empty!2767)))

(declare-fun b!115376 () Bool)

(assert (=> b!115376 (= e!75255 tp_is_empty!2767)))

(declare-fun res!56605 () Bool)

(declare-fun e!75254 () Bool)

(assert (=> start!13150 (=> (not res!56605) (not e!75254))))

(declare-datatypes ((Cell!776 0))(
  ( (Cell!777 (v!3018 LongMapFixedSize!988)) )
))
(declare-datatypes ((LongMap!776 0))(
  ( (LongMap!777 (underlying!399 Cell!776)) )
))
(declare-fun thiss!992 () LongMap!776)

(declare-fun valid!469 (LongMap!776) Bool)

(assert (=> start!13150 (= res!56605 (valid!469 thiss!992))))

(assert (=> start!13150 e!75254))

(declare-fun e!75245 () Bool)

(assert (=> start!13150 e!75245))

(assert (=> start!13150 true))

(assert (=> start!13150 e!75252))

(declare-fun b!115377 () Bool)

(declare-fun e!75244 () Bool)

(declare-fun e!75246 () Bool)

(declare-fun mapRes!4234 () Bool)

(assert (=> b!115377 (= e!75244 (and e!75246 mapRes!4234))))

(declare-fun condMapEmpty!4234 () Bool)

(declare-fun mapDefault!4234 () ValueCell!1040)

(assert (=> b!115377 (= condMapEmpty!4234 (= (arr!2141 (_values!2686 (v!3018 (underlying!399 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1040)) mapDefault!4234)))))

(declare-fun b!115378 () Bool)

(assert (=> b!115378 (= e!75254 false)))

(declare-datatypes ((tuple2!2480 0))(
  ( (tuple2!2481 (_1!1251 (_ BitVec 64)) (_2!1251 V!3337)) )
))
(declare-datatypes ((List!1664 0))(
  ( (Nil!1661) (Cons!1660 (h!2260 tuple2!2480) (t!5913 List!1664)) )
))
(declare-datatypes ((ListLongMap!1605 0))(
  ( (ListLongMap!1606 (toList!818 List!1664)) )
))
(declare-fun lt!59900 () ListLongMap!1605)

(declare-fun map!1325 (LongMapFixedSize!988) ListLongMap!1605)

(assert (=> b!115378 (= lt!59900 (map!1325 newMap!16))))

(declare-fun lt!59901 () ListLongMap!1605)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!489 (array!4517 array!4519 (_ BitVec 32) (_ BitVec 32) V!3337 V!3337 (_ BitVec 32) Int) ListLongMap!1605)

(assert (=> b!115378 (= lt!59901 (getCurrentListMap!489 (_keys!4424 (v!3018 (underlying!399 thiss!992))) (_values!2686 (v!3018 (underlying!399 thiss!992))) (mask!6910 (v!3018 (underlying!399 thiss!992))) (extraKeys!2492 (v!3018 (underlying!399 thiss!992))) (zeroValue!2570 (v!3018 (underlying!399 thiss!992))) (minValue!2570 (v!3018 (underlying!399 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2703 (v!3018 (underlying!399 thiss!992)))))))

(declare-fun b!115379 () Bool)

(declare-fun res!56607 () Bool)

(assert (=> b!115379 (=> (not res!56607) (not e!75254))))

(assert (=> b!115379 (= res!56607 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6910 newMap!16)) (_size!543 (v!3018 (underlying!399 thiss!992)))))))

(declare-fun b!115380 () Bool)

(declare-fun res!56606 () Bool)

(assert (=> b!115380 (=> (not res!56606) (not e!75254))))

(assert (=> b!115380 (= res!56606 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2401 (_keys!4424 (v!3018 (underlying!399 thiss!992)))))))))

(declare-fun b!115381 () Bool)

(declare-fun e!75243 () Bool)

(declare-fun e!75250 () Bool)

(assert (=> b!115381 (= e!75243 e!75250)))

(declare-fun mapNonEmpty!4234 () Bool)

(declare-fun tp!10468 () Bool)

(assert (=> mapNonEmpty!4234 (= mapRes!4234 (and tp!10468 e!75248))))

(declare-fun mapValue!4233 () ValueCell!1040)

(declare-fun mapKey!4234 () (_ BitVec 32))

(declare-fun mapRest!4233 () (Array (_ BitVec 32) ValueCell!1040))

(assert (=> mapNonEmpty!4234 (= (arr!2141 (_values!2686 (v!3018 (underlying!399 thiss!992)))) (store mapRest!4233 mapKey!4234 mapValue!4233))))

(declare-fun mapIsEmpty!4233 () Bool)

(assert (=> mapIsEmpty!4233 mapRes!4234))

(declare-fun b!115382 () Bool)

(declare-fun res!56604 () Bool)

(assert (=> b!115382 (=> (not res!56604) (not e!75254))))

(declare-fun valid!470 (LongMapFixedSize!988) Bool)

(assert (=> b!115382 (= res!56604 (valid!470 newMap!16))))

(declare-fun b!115383 () Bool)

(assert (=> b!115383 (= e!75246 tp_is_empty!2767)))

(declare-fun mapIsEmpty!4234 () Bool)

(assert (=> mapIsEmpty!4234 mapRes!4233))

(declare-fun b!115384 () Bool)

(assert (=> b!115384 (= e!75245 e!75243)))

(assert (=> b!115385 (= e!75250 (and tp!10465 tp_is_empty!2767 (array_inv!1355 (_keys!4424 (v!3018 (underlying!399 thiss!992)))) (array_inv!1356 (_values!2686 (v!3018 (underlying!399 thiss!992)))) e!75244))))

(assert (= (and start!13150 res!56605) b!115380))

(assert (= (and b!115380 res!56606) b!115382))

(assert (= (and b!115382 res!56604) b!115379))

(assert (= (and b!115379 res!56607) b!115378))

(assert (= (and b!115377 condMapEmpty!4234) mapIsEmpty!4233))

(assert (= (and b!115377 (not condMapEmpty!4234)) mapNonEmpty!4234))

(get-info :version)

(assert (= (and mapNonEmpty!4234 ((_ is ValueCellFull!1040) mapValue!4233)) b!115375))

(assert (= (and b!115377 ((_ is ValueCellFull!1040) mapDefault!4234)) b!115383))

(assert (= b!115385 b!115377))

(assert (= b!115381 b!115385))

(assert (= b!115384 b!115381))

(assert (= start!13150 b!115384))

(assert (= (and b!115372 condMapEmpty!4233) mapIsEmpty!4234))

(assert (= (and b!115372 (not condMapEmpty!4233)) mapNonEmpty!4233))

(assert (= (and mapNonEmpty!4233 ((_ is ValueCellFull!1040) mapValue!4234)) b!115374))

(assert (= (and b!115372 ((_ is ValueCellFull!1040) mapDefault!4233)) b!115376))

(assert (= b!115373 b!115372))

(assert (= start!13150 b!115373))

(declare-fun m!131247 () Bool)

(assert (=> b!115373 m!131247))

(declare-fun m!131249 () Bool)

(assert (=> b!115373 m!131249))

(declare-fun m!131251 () Bool)

(assert (=> mapNonEmpty!4233 m!131251))

(declare-fun m!131253 () Bool)

(assert (=> start!13150 m!131253))

(declare-fun m!131255 () Bool)

(assert (=> mapNonEmpty!4234 m!131255))

(declare-fun m!131257 () Bool)

(assert (=> b!115385 m!131257))

(declare-fun m!131259 () Bool)

(assert (=> b!115385 m!131259))

(declare-fun m!131261 () Bool)

(assert (=> b!115378 m!131261))

(declare-fun m!131263 () Bool)

(assert (=> b!115378 m!131263))

(declare-fun m!131265 () Bool)

(assert (=> b!115382 m!131265))

(check-sat (not mapNonEmpty!4233) (not b_next!2701) b_and!7159 b_and!7157 (not b!115373) (not b_next!2703) (not b!115378) (not b!115385) (not start!13150) (not mapNonEmpty!4234) tp_is_empty!2767 (not b!115382))
(check-sat b_and!7157 b_and!7159 (not b_next!2701) (not b_next!2703))
