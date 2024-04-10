; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8300 () Bool)

(assert start!8300)

(declare-fun b!54132 () Bool)

(declare-fun b_free!1765 () Bool)

(declare-fun b_next!1765 () Bool)

(assert (=> b!54132 (= b_free!1765 (not b_next!1765))))

(declare-fun tp!7396 () Bool)

(declare-fun b_and!3071 () Bool)

(assert (=> b!54132 (= tp!7396 b_and!3071)))

(declare-fun b!54130 () Bool)

(declare-fun b_free!1767 () Bool)

(declare-fun b_next!1767 () Bool)

(assert (=> b!54130 (= b_free!1767 (not b_next!1767))))

(declare-fun tp!7398 () Bool)

(declare-fun b_and!3073 () Bool)

(assert (=> b!54130 (= tp!7398 b_and!3073)))

(declare-fun mapNonEmpty!2567 () Bool)

(declare-fun mapRes!2568 () Bool)

(declare-fun tp!7397 () Bool)

(declare-fun e!35330 () Bool)

(assert (=> mapNonEmpty!2567 (= mapRes!2568 (and tp!7397 e!35330))))

(declare-datatypes ((V!2713 0))(
  ( (V!2714 (val!1194 Int)) )
))
(declare-datatypes ((ValueCell!806 0))(
  ( (ValueCellFull!806 (v!2274 V!2713)) (EmptyCell!806) )
))
(declare-fun mapRest!2567 () (Array (_ BitVec 32) ValueCell!806))

(declare-datatypes ((array!3521 0))(
  ( (array!3522 (arr!1683 (Array (_ BitVec 32) (_ BitVec 64))) (size!1912 (_ BitVec 32))) )
))
(declare-datatypes ((array!3523 0))(
  ( (array!3524 (arr!1684 (Array (_ BitVec 32) ValueCell!806)) (size!1913 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!520 0))(
  ( (LongMapFixedSize!521 (defaultEntry!1974 Int) (mask!5817 (_ BitVec 32)) (extraKeys!1865 (_ BitVec 32)) (zeroValue!1892 V!2713) (minValue!1892 V!2713) (_size!309 (_ BitVec 32)) (_keys!3594 array!3521) (_values!1957 array!3523) (_vacant!309 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!336 0))(
  ( (Cell!337 (v!2275 LongMapFixedSize!520)) )
))
(declare-datatypes ((LongMap!336 0))(
  ( (LongMap!337 (underlying!179 Cell!336)) )
))
(declare-fun thiss!992 () LongMap!336)

(declare-fun mapValue!2568 () ValueCell!806)

(declare-fun mapKey!2567 () (_ BitVec 32))

(assert (=> mapNonEmpty!2567 (= (arr!1684 (_values!1957 (v!2275 (underlying!179 thiss!992)))) (store mapRest!2567 mapKey!2567 mapValue!2568))))

(declare-fun b!54120 () Bool)

(declare-fun e!35332 () Bool)

(declare-fun e!35337 () Bool)

(assert (=> b!54120 (= e!35332 e!35337)))

(declare-fun res!30644 () Bool)

(assert (=> b!54120 (=> (not res!30644) (not e!35337))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1908 0))(
  ( (tuple2!1909 (_1!965 (_ BitVec 64)) (_2!965 V!2713)) )
))
(declare-datatypes ((List!1368 0))(
  ( (Nil!1365) (Cons!1364 (h!1944 tuple2!1908) (t!4502 List!1368)) )
))
(declare-datatypes ((ListLongMap!1301 0))(
  ( (ListLongMap!1302 (toList!666 List!1368)) )
))
(declare-fun lt!21591 () ListLongMap!1301)

(declare-fun contains!640 (ListLongMap!1301 (_ BitVec 64)) Bool)

(assert (=> b!54120 (= res!30644 (contains!640 lt!21591 (select (arr!1683 (_keys!3594 (v!2275 (underlying!179 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!520)

(declare-datatypes ((tuple2!1910 0))(
  ( (tuple2!1911 (_1!966 Bool) (_2!966 LongMapFixedSize!520)) )
))
(declare-fun lt!21592 () tuple2!1910)

(declare-fun update!48 (LongMapFixedSize!520 (_ BitVec 64) V!2713) tuple2!1910)

(declare-fun get!1004 (ValueCell!806 V!2713) V!2713)

(declare-fun dynLambda!279 (Int (_ BitVec 64)) V!2713)

(assert (=> b!54120 (= lt!21592 (update!48 newMap!16 (select (arr!1683 (_keys!3594 (v!2275 (underlying!179 thiss!992)))) from!355) (get!1004 (select (arr!1684 (_values!1957 (v!2275 (underlying!179 thiss!992)))) from!355) (dynLambda!279 (defaultEntry!1974 (v!2275 (underlying!179 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!2568 () Bool)

(declare-fun mapRes!2567 () Bool)

(declare-fun tp!7395 () Bool)

(declare-fun e!35329 () Bool)

(assert (=> mapNonEmpty!2568 (= mapRes!2567 (and tp!7395 e!35329))))

(declare-fun mapKey!2568 () (_ BitVec 32))

(declare-fun mapValue!2567 () ValueCell!806)

(declare-fun mapRest!2568 () (Array (_ BitVec 32) ValueCell!806))

(assert (=> mapNonEmpty!2568 (= (arr!1684 (_values!1957 newMap!16)) (store mapRest!2568 mapKey!2568 mapValue!2567))))

(declare-fun b!54121 () Bool)

(declare-fun e!35335 () Bool)

(declare-fun tp_is_empty!2299 () Bool)

(assert (=> b!54121 (= e!35335 tp_is_empty!2299)))

(declare-fun b!54122 () Bool)

(declare-fun e!35331 () Bool)

(assert (=> b!54122 (= e!35331 e!35332)))

(declare-fun res!30647 () Bool)

(assert (=> b!54122 (=> (not res!30647) (not e!35332))))

(declare-fun lt!21593 () ListLongMap!1301)

(assert (=> b!54122 (= res!30647 (and (= lt!21593 lt!21591) (not (= (select (arr!1683 (_keys!3594 (v!2275 (underlying!179 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1683 (_keys!3594 (v!2275 (underlying!179 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1047 (LongMapFixedSize!520) ListLongMap!1301)

(assert (=> b!54122 (= lt!21591 (map!1047 newMap!16))))

(declare-fun getCurrentListMap!376 (array!3521 array!3523 (_ BitVec 32) (_ BitVec 32) V!2713 V!2713 (_ BitVec 32) Int) ListLongMap!1301)

(assert (=> b!54122 (= lt!21593 (getCurrentListMap!376 (_keys!3594 (v!2275 (underlying!179 thiss!992))) (_values!1957 (v!2275 (underlying!179 thiss!992))) (mask!5817 (v!2275 (underlying!179 thiss!992))) (extraKeys!1865 (v!2275 (underlying!179 thiss!992))) (zeroValue!1892 (v!2275 (underlying!179 thiss!992))) (minValue!1892 (v!2275 (underlying!179 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1974 (v!2275 (underlying!179 thiss!992)))))))

(declare-fun b!54123 () Bool)

(declare-fun e!35336 () Bool)

(declare-fun e!35340 () Bool)

(assert (=> b!54123 (= e!35336 (and e!35340 mapRes!2567))))

(declare-fun condMapEmpty!2568 () Bool)

(declare-fun mapDefault!2568 () ValueCell!806)

