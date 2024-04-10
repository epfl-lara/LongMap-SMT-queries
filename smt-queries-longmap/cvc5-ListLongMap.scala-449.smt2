; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8306 () Bool)

(assert start!8306)

(declare-fun b!54335 () Bool)

(declare-fun b_free!1777 () Bool)

(declare-fun b_next!1777 () Bool)

(assert (=> b!54335 (= b_free!1777 (not b_next!1777))))

(declare-fun tp!7434 () Bool)

(declare-fun b_and!3095 () Bool)

(assert (=> b!54335 (= tp!7434 b_and!3095)))

(declare-fun b!54322 () Bool)

(declare-fun b_free!1779 () Bool)

(declare-fun b_next!1779 () Bool)

(assert (=> b!54322 (= b_free!1779 (not b_next!1779))))

(declare-fun tp!7432 () Bool)

(declare-fun b_and!3097 () Bool)

(assert (=> b!54322 (= tp!7432 b_and!3097)))

(declare-fun b!54315 () Bool)

(declare-fun e!35474 () Bool)

(declare-fun tp_is_empty!2305 () Bool)

(assert (=> b!54315 (= e!35474 tp_is_empty!2305)))

(declare-fun b!54316 () Bool)

(declare-fun res!30747 () Bool)

(declare-fun e!35467 () Bool)

(assert (=> b!54316 (=> (not res!30747) (not e!35467))))

(declare-datatypes ((V!2721 0))(
  ( (V!2722 (val!1197 Int)) )
))
(declare-datatypes ((array!3533 0))(
  ( (array!3534 (arr!1689 (Array (_ BitVec 32) (_ BitVec 64))) (size!1918 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!809 0))(
  ( (ValueCellFull!809 (v!2280 V!2721)) (EmptyCell!809) )
))
(declare-datatypes ((array!3535 0))(
  ( (array!3536 (arr!1690 (Array (_ BitVec 32) ValueCell!809)) (size!1919 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!526 0))(
  ( (LongMapFixedSize!527 (defaultEntry!1977 Int) (mask!5822 (_ BitVec 32)) (extraKeys!1868 (_ BitVec 32)) (zeroValue!1895 V!2721) (minValue!1895 V!2721) (_size!312 (_ BitVec 32)) (_keys!3597 array!3533) (_values!1960 array!3535) (_vacant!312 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!342 0))(
  ( (Cell!343 (v!2281 LongMapFixedSize!526)) )
))
(declare-datatypes ((LongMap!342 0))(
  ( (LongMap!343 (underlying!182 Cell!342)) )
))
(declare-fun thiss!992 () LongMap!342)

(assert (=> b!54316 (= res!30747 (and (= (size!1919 (_values!1960 (v!2281 (underlying!182 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5822 (v!2281 (underlying!182 thiss!992))))) (= (size!1918 (_keys!3597 (v!2281 (underlying!182 thiss!992)))) (size!1919 (_values!1960 (v!2281 (underlying!182 thiss!992))))) (bvsge (mask!5822 (v!2281 (underlying!182 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1868 (v!2281 (underlying!182 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1868 (v!2281 (underlying!182 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!54317 () Bool)

(declare-fun res!30742 () Bool)

(assert (=> b!54317 (=> (not res!30742) (not e!35467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!54317 (= res!30742 (validMask!0 (mask!5822 (v!2281 (underlying!182 thiss!992)))))))

(declare-fun mapNonEmpty!2585 () Bool)

(declare-fun mapRes!2586 () Bool)

(declare-fun tp!7433 () Bool)

(declare-fun e!35469 () Bool)

(assert (=> mapNonEmpty!2585 (= mapRes!2586 (and tp!7433 e!35469))))

(declare-fun mapKey!2586 () (_ BitVec 32))

(declare-fun mapValue!2585 () ValueCell!809)

(declare-fun newMap!16 () LongMapFixedSize!526)

(declare-fun mapRest!2585 () (Array (_ BitVec 32) ValueCell!809))

(assert (=> mapNonEmpty!2585 (= (arr!1690 (_values!1960 newMap!16)) (store mapRest!2585 mapKey!2586 mapValue!2585))))

(declare-fun b!54319 () Bool)

(declare-fun res!30750 () Bool)

(declare-fun e!35470 () Bool)

(assert (=> b!54319 (=> (not res!30750) (not e!35470))))

(declare-fun valid!202 (LongMapFixedSize!526) Bool)

(assert (=> b!54319 (= res!30750 (valid!202 newMap!16))))

(declare-fun b!54320 () Bool)

(declare-fun e!35464 () Bool)

(declare-fun e!35472 () Bool)

(assert (=> b!54320 (= e!35464 e!35472)))

(declare-fun b!54321 () Bool)

(declare-fun e!35473 () Bool)

(assert (=> b!54321 (= e!35470 e!35473)))

(declare-fun res!30746 () Bool)

(assert (=> b!54321 (=> (not res!30746) (not e!35473))))

(declare-datatypes ((tuple2!1916 0))(
  ( (tuple2!1917 (_1!969 (_ BitVec 64)) (_2!969 V!2721)) )
))
(declare-datatypes ((List!1371 0))(
  ( (Nil!1368) (Cons!1367 (h!1947 tuple2!1916) (t!4517 List!1371)) )
))
(declare-datatypes ((ListLongMap!1305 0))(
  ( (ListLongMap!1306 (toList!668 List!1371)) )
))
(declare-fun lt!21630 () ListLongMap!1305)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!21628 () ListLongMap!1305)

(assert (=> b!54321 (= res!30746 (and (= lt!21628 lt!21630) (not (= (select (arr!1689 (_keys!3597 (v!2281 (underlying!182 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1689 (_keys!3597 (v!2281 (underlying!182 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1051 (LongMapFixedSize!526) ListLongMap!1305)

(assert (=> b!54321 (= lt!21630 (map!1051 newMap!16))))

(declare-fun getCurrentListMap!378 (array!3533 array!3535 (_ BitVec 32) (_ BitVec 32) V!2721 V!2721 (_ BitVec 32) Int) ListLongMap!1305)

(assert (=> b!54321 (= lt!21628 (getCurrentListMap!378 (_keys!3597 (v!2281 (underlying!182 thiss!992))) (_values!1960 (v!2281 (underlying!182 thiss!992))) (mask!5822 (v!2281 (underlying!182 thiss!992))) (extraKeys!1868 (v!2281 (underlying!182 thiss!992))) (zeroValue!1895 (v!2281 (underlying!182 thiss!992))) (minValue!1895 (v!2281 (underlying!182 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1977 (v!2281 (underlying!182 thiss!992)))))))

(declare-fun e!35468 () Bool)

(declare-fun e!35475 () Bool)

(declare-fun array_inv!1043 (array!3533) Bool)

(declare-fun array_inv!1044 (array!3535) Bool)

(assert (=> b!54322 (= e!35475 (and tp!7432 tp_is_empty!2305 (array_inv!1043 (_keys!3597 newMap!16)) (array_inv!1044 (_values!1960 newMap!16)) e!35468))))

(declare-fun b!54323 () Bool)

(declare-fun res!30751 () Bool)

(assert (=> b!54323 (=> (not res!30751) (not e!35467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3533 (_ BitVec 32)) Bool)

(assert (=> b!54323 (= res!30751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3597 (v!2281 (underlying!182 thiss!992))) (mask!5822 (v!2281 (underlying!182 thiss!992)))))))

(declare-fun b!54324 () Bool)

(assert (=> b!54324 (= e!35468 (and e!35474 mapRes!2586))))

(declare-fun condMapEmpty!2585 () Bool)

(declare-fun mapDefault!2585 () ValueCell!809)

