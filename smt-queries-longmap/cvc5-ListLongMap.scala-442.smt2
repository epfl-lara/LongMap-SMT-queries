; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8264 () Bool)

(assert start!8264)

(declare-fun b!52968 () Bool)

(declare-fun b_free!1693 () Bool)

(declare-fun b_next!1693 () Bool)

(assert (=> b!52968 (= b_free!1693 (not b_next!1693))))

(declare-fun tp!7182 () Bool)

(declare-fun b_and!2927 () Bool)

(assert (=> b!52968 (= tp!7182 b_and!2927)))

(declare-fun b!52950 () Bool)

(declare-fun b_free!1695 () Bool)

(declare-fun b_next!1695 () Bool)

(assert (=> b!52950 (= b_free!1695 (not b_next!1695))))

(declare-fun tp!7180 () Bool)

(declare-fun b_and!2929 () Bool)

(assert (=> b!52950 (= tp!7180 b_and!2929)))

(declare-fun e!34523 () Bool)

(declare-fun tp_is_empty!2263 () Bool)

(declare-fun e!34519 () Bool)

(declare-datatypes ((V!2665 0))(
  ( (V!2666 (val!1176 Int)) )
))
(declare-datatypes ((array!3449 0))(
  ( (array!3450 (arr!1647 (Array (_ BitVec 32) (_ BitVec 64))) (size!1876 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!788 0))(
  ( (ValueCellFull!788 (v!2241 V!2665)) (EmptyCell!788) )
))
(declare-datatypes ((array!3451 0))(
  ( (array!3452 (arr!1648 (Array (_ BitVec 32) ValueCell!788)) (size!1877 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!484 0))(
  ( (LongMapFixedSize!485 (defaultEntry!1956 Int) (mask!5787 (_ BitVec 32)) (extraKeys!1847 (_ BitVec 32)) (zeroValue!1874 V!2665) (minValue!1874 V!2665) (_size!291 (_ BitVec 32)) (_keys!3576 array!3449) (_values!1939 array!3451) (_vacant!291 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!484)

(declare-fun array_inv!1019 (array!3449) Bool)

(declare-fun array_inv!1020 (array!3451) Bool)

(assert (=> b!52950 (= e!34523 (and tp!7180 tp_is_empty!2263 (array_inv!1019 (_keys!3576 newMap!16)) (array_inv!1020 (_values!1939 newMap!16)) e!34519))))

(declare-fun b!52951 () Bool)

(declare-fun e!34522 () Bool)

(declare-fun e!34518 () Bool)

(assert (=> b!52951 (= e!34522 e!34518)))

(declare-fun res!30056 () Bool)

(assert (=> b!52951 (=> (not res!30056) (not e!34518))))

(declare-datatypes ((Cell!306 0))(
  ( (Cell!307 (v!2242 LongMapFixedSize!484)) )
))
(declare-datatypes ((LongMap!306 0))(
  ( (LongMap!307 (underlying!164 Cell!306)) )
))
(declare-fun thiss!992 () LongMap!306)

(declare-datatypes ((tuple2!1870 0))(
  ( (tuple2!1871 (_1!946 (_ BitVec 64)) (_2!946 V!2665)) )
))
(declare-datatypes ((List!1350 0))(
  ( (Nil!1347) (Cons!1346 (h!1926 tuple2!1870) (t!4412 List!1350)) )
))
(declare-datatypes ((ListLongMap!1277 0))(
  ( (ListLongMap!1278 (toList!654 List!1350)) )
))
(declare-fun lt!21377 () ListLongMap!1277)

(declare-fun lt!21378 () ListLongMap!1277)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!52951 (= res!30056 (and (= lt!21378 lt!21377) (not (= (select (arr!1647 (_keys!3576 (v!2242 (underlying!164 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1647 (_keys!3576 (v!2242 (underlying!164 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1025 (LongMapFixedSize!484) ListLongMap!1277)

(assert (=> b!52951 (= lt!21377 (map!1025 newMap!16))))

(declare-fun getCurrentListMap!366 (array!3449 array!3451 (_ BitVec 32) (_ BitVec 32) V!2665 V!2665 (_ BitVec 32) Int) ListLongMap!1277)

(assert (=> b!52951 (= lt!21378 (getCurrentListMap!366 (_keys!3576 (v!2242 (underlying!164 thiss!992))) (_values!1939 (v!2242 (underlying!164 thiss!992))) (mask!5787 (v!2242 (underlying!164 thiss!992))) (extraKeys!1847 (v!2242 (underlying!164 thiss!992))) (zeroValue!1874 (v!2242 (underlying!164 thiss!992))) (minValue!1874 (v!2242 (underlying!164 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1956 (v!2242 (underlying!164 thiss!992)))))))

(declare-fun b!52952 () Bool)

(declare-fun res!30055 () Bool)

(assert (=> b!52952 (=> (not res!30055) (not e!34522))))

(assert (=> b!52952 (= res!30055 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1876 (_keys!3576 (v!2242 (underlying!164 thiss!992)))))))))

(declare-fun mapNonEmpty!2459 () Bool)

(declare-fun mapRes!2459 () Bool)

(declare-fun tp!7181 () Bool)

(declare-fun e!34524 () Bool)

(assert (=> mapNonEmpty!2459 (= mapRes!2459 (and tp!7181 e!34524))))

(declare-fun mapValue!2460 () ValueCell!788)

(declare-fun mapRest!2460 () (Array (_ BitVec 32) ValueCell!788))

(declare-fun mapKey!2459 () (_ BitVec 32))

(assert (=> mapNonEmpty!2459 (= (arr!1648 (_values!1939 newMap!16)) (store mapRest!2460 mapKey!2459 mapValue!2460))))

(declare-fun b!52953 () Bool)

(declare-fun res!30049 () Bool)

(declare-fun e!34520 () Bool)

(assert (=> b!52953 (=> (not res!30049) (not e!34520))))

(assert (=> b!52953 (= res!30049 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1876 (_keys!3576 (v!2242 (underlying!164 thiss!992)))))))))

(declare-fun b!52954 () Bool)

(declare-fun e!34532 () Bool)

(declare-fun e!34531 () Bool)

(assert (=> b!52954 (= e!34532 e!34531)))

(declare-fun b!52955 () Bool)

(declare-fun e!34526 () Bool)

(assert (=> b!52955 (= e!34526 tp_is_empty!2263)))

(declare-fun res!30051 () Bool)

(assert (=> start!8264 (=> (not res!30051) (not e!34522))))

(declare-fun valid!181 (LongMap!306) Bool)

(assert (=> start!8264 (= res!30051 (valid!181 thiss!992))))

(assert (=> start!8264 e!34522))

(declare-fun e!34529 () Bool)

(assert (=> start!8264 e!34529))

(assert (=> start!8264 true))

(assert (=> start!8264 e!34523))

(declare-fun b!52956 () Bool)

(declare-fun e!34527 () Bool)

(assert (=> b!52956 (= e!34519 (and e!34527 mapRes!2459))))

(declare-fun condMapEmpty!2459 () Bool)

(declare-fun mapDefault!2459 () ValueCell!788)

