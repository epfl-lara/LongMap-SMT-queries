; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13228 () Bool)

(assert start!13228)

(declare-fun b!116634 () Bool)

(declare-fun b_free!2761 () Bool)

(declare-fun b_next!2761 () Bool)

(assert (=> b!116634 (= b_free!2761 (not b_next!2761))))

(declare-fun tp!10657 () Bool)

(declare-fun b_and!7267 () Bool)

(assert (=> b!116634 (= tp!10657 b_and!7267)))

(declare-fun b!116636 () Bool)

(declare-fun b_free!2763 () Bool)

(declare-fun b_next!2763 () Bool)

(assert (=> b!116636 (= b_free!2763 (not b_next!2763))))

(declare-fun tp!10658 () Bool)

(declare-fun b_and!7269 () Bool)

(assert (=> b!116636 (= tp!10658 b_and!7269)))

(declare-fun b!116626 () Bool)

(declare-fun res!57116 () Bool)

(declare-fun e!76189 () Bool)

(assert (=> b!116626 (=> (not res!57116) (not e!76189))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3377 0))(
  ( (V!3378 (val!1443 Int)) )
))
(declare-datatypes ((array!4601 0))(
  ( (array!4602 (arr!2181 (Array (_ BitVec 32) (_ BitVec 64))) (size!2442 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1055 0))(
  ( (ValueCellFull!1055 (v!3055 V!3377)) (EmptyCell!1055) )
))
(declare-datatypes ((array!4603 0))(
  ( (array!4604 (arr!2182 (Array (_ BitVec 32) ValueCell!1055)) (size!2443 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1018 0))(
  ( (LongMapFixedSize!1019 (defaultEntry!2721 Int) (mask!6941 (_ BitVec 32)) (extraKeys!2510 (_ BitVec 32)) (zeroValue!2588 V!3377) (minValue!2588 V!3377) (_size!558 (_ BitVec 32)) (_keys!4444 array!4601) (_values!2704 array!4603) (_vacant!558 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!816 0))(
  ( (Cell!817 (v!3056 LongMapFixedSize!1018)) )
))
(declare-datatypes ((LongMap!816 0))(
  ( (LongMap!817 (underlying!419 Cell!816)) )
))
(declare-fun thiss!992 () LongMap!816)

(assert (=> b!116626 (= res!57116 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2442 (_keys!4444 (v!3056 (underlying!419 thiss!992)))))))))

(declare-fun mapNonEmpty!4333 () Bool)

(declare-fun mapRes!4334 () Bool)

(declare-fun tp!10655 () Bool)

(declare-fun e!76196 () Bool)

(assert (=> mapNonEmpty!4333 (= mapRes!4334 (and tp!10655 e!76196))))

(declare-fun mapKey!4333 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!1018)

(declare-fun mapValue!4333 () ValueCell!1055)

(declare-fun mapRest!4334 () (Array (_ BitVec 32) ValueCell!1055))

(assert (=> mapNonEmpty!4333 (= (arr!2182 (_values!2704 newMap!16)) (store mapRest!4334 mapKey!4333 mapValue!4333))))

(declare-fun b!116628 () Bool)

(declare-fun e!76192 () Bool)

(declare-fun e!76188 () Bool)

(assert (=> b!116628 (= e!76192 e!76188)))

(declare-fun b!116629 () Bool)

(declare-fun e!76197 () Bool)

(declare-fun tp_is_empty!2797 () Bool)

(assert (=> b!116629 (= e!76197 tp_is_empty!2797)))

(declare-fun b!116630 () Bool)

(declare-fun res!57114 () Bool)

(assert (=> b!116630 (=> (not res!57114) (not e!76189))))

(assert (=> b!116630 (= res!57114 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6941 newMap!16)) (_size!558 (v!3056 (underlying!419 thiss!992)))))))

(declare-fun b!116631 () Bool)

(declare-fun res!57117 () Bool)

(assert (=> b!116631 (=> (not res!57117) (not e!76189))))

(declare-datatypes ((tuple2!2542 0))(
  ( (tuple2!2543 (_1!1282 (_ BitVec 64)) (_2!1282 V!3377)) )
))
(declare-datatypes ((List!1681 0))(
  ( (Nil!1678) (Cons!1677 (h!2277 tuple2!2542) (t!5947 List!1681)) )
))
(declare-datatypes ((ListLongMap!1657 0))(
  ( (ListLongMap!1658 (toList!844 List!1681)) )
))
(declare-fun getCurrentListMap!525 (array!4601 array!4603 (_ BitVec 32) (_ BitVec 32) V!3377 V!3377 (_ BitVec 32) Int) ListLongMap!1657)

(declare-fun map!1362 (LongMapFixedSize!1018) ListLongMap!1657)

(assert (=> b!116631 (= res!57117 (= (getCurrentListMap!525 (_keys!4444 (v!3056 (underlying!419 thiss!992))) (_values!2704 (v!3056 (underlying!419 thiss!992))) (mask!6941 (v!3056 (underlying!419 thiss!992))) (extraKeys!2510 (v!3056 (underlying!419 thiss!992))) (zeroValue!2588 (v!3056 (underlying!419 thiss!992))) (minValue!2588 (v!3056 (underlying!419 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3056 (underlying!419 thiss!992)))) (map!1362 newMap!16)))))

(declare-fun b!116632 () Bool)

(declare-fun e!76193 () Bool)

(assert (=> b!116632 (= e!76193 tp_is_empty!2797)))

(declare-fun mapIsEmpty!4333 () Bool)

(declare-fun mapRes!4333 () Bool)

(assert (=> mapIsEmpty!4333 mapRes!4333))

(declare-fun b!116633 () Bool)

(declare-fun e!76195 () Bool)

(assert (=> b!116633 (= e!76195 tp_is_empty!2797)))

(declare-fun e!76198 () Bool)

(declare-fun e!76191 () Bool)

(declare-fun array_inv!1373 (array!4601) Bool)

(declare-fun array_inv!1374 (array!4603) Bool)

(assert (=> b!116634 (= e!76198 (and tp!10657 tp_is_empty!2797 (array_inv!1373 (_keys!4444 (v!3056 (underlying!419 thiss!992)))) (array_inv!1374 (_values!2704 (v!3056 (underlying!419 thiss!992)))) e!76191))))

(declare-fun b!116635 () Bool)

(declare-fun res!57115 () Bool)

(assert (=> b!116635 (=> (not res!57115) (not e!76189))))

(assert (=> b!116635 (= res!57115 (and (or (= (select (arr!2181 (_keys!4444 (v!3056 (underlying!419 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2181 (_keys!4444 (v!3056 (underlying!419 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!4334 () Bool)

(assert (=> mapIsEmpty!4334 mapRes!4334))

(declare-fun b!116627 () Bool)

(assert (=> b!116627 (= e!76188 e!76198)))

(declare-fun res!57113 () Bool)

(assert (=> start!13228 (=> (not res!57113) (not e!76189))))

(declare-fun valid!483 (LongMap!816) Bool)

(assert (=> start!13228 (= res!57113 (valid!483 thiss!992))))

(assert (=> start!13228 e!76189))

(assert (=> start!13228 e!76192))

(assert (=> start!13228 true))

(declare-fun e!76199 () Bool)

(assert (=> start!13228 e!76199))

(declare-fun e!76200 () Bool)

(assert (=> b!116636 (= e!76199 (and tp!10658 tp_is_empty!2797 (array_inv!1373 (_keys!4444 newMap!16)) (array_inv!1374 (_values!2704 newMap!16)) e!76200))))

(declare-fun b!116637 () Bool)

(assert (=> b!116637 (= e!76191 (and e!76197 mapRes!4333))))

(declare-fun condMapEmpty!4334 () Bool)

(declare-fun mapDefault!4333 () ValueCell!1055)

