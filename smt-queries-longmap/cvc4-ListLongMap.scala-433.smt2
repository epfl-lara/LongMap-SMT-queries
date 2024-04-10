; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8130 () Bool)

(assert start!8130)

(declare-fun b!51311 () Bool)

(declare-fun b_free!1593 () Bool)

(declare-fun b_next!1593 () Bool)

(assert (=> b!51311 (= b_free!1593 (not b_next!1593))))

(declare-fun tp!6860 () Bool)

(declare-fun b_and!2803 () Bool)

(assert (=> b!51311 (= tp!6860 b_and!2803)))

(declare-fun b!51310 () Bool)

(declare-fun b_free!1595 () Bool)

(declare-fun b_next!1595 () Bool)

(assert (=> b!51310 (= b_free!1595 (not b_next!1595))))

(declare-fun tp!6861 () Bool)

(declare-fun b_and!2805 () Bool)

(assert (=> b!51310 (= tp!6861 b_and!2805)))

(declare-fun e!33277 () Bool)

(declare-fun e!33276 () Bool)

(declare-datatypes ((V!2597 0))(
  ( (V!2598 (val!1151 Int)) )
))
(declare-datatypes ((array!3343 0))(
  ( (array!3344 (arr!1597 (Array (_ BitVec 32) (_ BitVec 64))) (size!1823 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!763 0))(
  ( (ValueCellFull!763 (v!2190 V!2597)) (EmptyCell!763) )
))
(declare-datatypes ((array!3345 0))(
  ( (array!3346 (arr!1598 (Array (_ BitVec 32) ValueCell!763)) (size!1824 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!434 0))(
  ( (LongMapFixedSize!435 (defaultEntry!1931 Int) (mask!5735 (_ BitVec 32)) (extraKeys!1822 (_ BitVec 32)) (zeroValue!1849 V!2597) (minValue!1849 V!2597) (_size!266 (_ BitVec 32)) (_keys!3545 array!3343) (_values!1914 array!3345) (_vacant!266 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!434)

(declare-fun tp_is_empty!2213 () Bool)

(declare-fun array_inv!981 (array!3343) Bool)

(declare-fun array_inv!982 (array!3345) Bool)

(assert (=> b!51310 (= e!33276 (and tp!6861 tp_is_empty!2213 (array_inv!981 (_keys!3545 newMap!16)) (array_inv!982 (_values!1914 newMap!16)) e!33277))))

(declare-datatypes ((Cell!258 0))(
  ( (Cell!259 (v!2191 LongMapFixedSize!434)) )
))
(declare-datatypes ((LongMap!258 0))(
  ( (LongMap!259 (underlying!140 Cell!258)) )
))
(declare-fun thiss!992 () LongMap!258)

(declare-fun e!33269 () Bool)

(declare-fun e!33267 () Bool)

(assert (=> b!51311 (= e!33267 (and tp!6860 tp_is_empty!2213 (array_inv!981 (_keys!3545 (v!2191 (underlying!140 thiss!992)))) (array_inv!982 (_values!1914 (v!2191 (underlying!140 thiss!992)))) e!33269))))

(declare-fun b!51312 () Bool)

(declare-fun res!29373 () Bool)

(declare-fun e!33273 () Bool)

(assert (=> b!51312 (=> (not res!29373) (not e!33273))))

(assert (=> b!51312 (= res!29373 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5735 newMap!16)) (_size!266 (v!2191 (underlying!140 thiss!992)))))))

(declare-fun mapNonEmpty!2289 () Bool)

(declare-fun mapRes!2289 () Bool)

(declare-fun tp!6862 () Bool)

(declare-fun e!33270 () Bool)

(assert (=> mapNonEmpty!2289 (= mapRes!2289 (and tp!6862 e!33270))))

(declare-fun mapRest!2290 () (Array (_ BitVec 32) ValueCell!763))

(declare-fun mapKey!2290 () (_ BitVec 32))

(declare-fun mapValue!2289 () ValueCell!763)

(assert (=> mapNonEmpty!2289 (= (arr!1598 (_values!1914 (v!2191 (underlying!140 thiss!992)))) (store mapRest!2290 mapKey!2290 mapValue!2289))))

(declare-fun b!51313 () Bool)

(declare-fun e!33268 () Bool)

(assert (=> b!51313 (= e!33268 tp_is_empty!2213)))

(declare-fun mapNonEmpty!2290 () Bool)

(declare-fun mapRes!2290 () Bool)

(declare-fun tp!6859 () Bool)

(assert (=> mapNonEmpty!2290 (= mapRes!2290 (and tp!6859 e!33268))))

(declare-fun mapRest!2289 () (Array (_ BitVec 32) ValueCell!763))

(declare-fun mapValue!2290 () ValueCell!763)

(declare-fun mapKey!2289 () (_ BitVec 32))

(assert (=> mapNonEmpty!2290 (= (arr!1598 (_values!1914 newMap!16)) (store mapRest!2289 mapKey!2289 mapValue!2290))))

(declare-fun res!29371 () Bool)

(assert (=> start!8130 (=> (not res!29371) (not e!33273))))

(declare-fun valid!149 (LongMap!258) Bool)

(assert (=> start!8130 (= res!29371 (valid!149 thiss!992))))

(assert (=> start!8130 e!33273))

(declare-fun e!33265 () Bool)

(assert (=> start!8130 e!33265))

(assert (=> start!8130 true))

(assert (=> start!8130 e!33276))

(declare-fun b!51309 () Bool)

(declare-fun res!29372 () Bool)

(assert (=> b!51309 (=> (not res!29372) (not e!33273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51309 (= res!29372 (validMask!0 (mask!5735 (v!2191 (underlying!140 thiss!992)))))))

(declare-fun mapIsEmpty!2289 () Bool)

(assert (=> mapIsEmpty!2289 mapRes!2290))

(declare-fun b!51314 () Bool)

(assert (=> b!51314 (= e!33273 (and (= (size!1824 (_values!1914 (v!2191 (underlying!140 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5735 (v!2191 (underlying!140 thiss!992))))) (= (size!1823 (_keys!3545 (v!2191 (underlying!140 thiss!992)))) (size!1824 (_values!1914 (v!2191 (underlying!140 thiss!992))))) (bvsge (mask!5735 (v!2191 (underlying!140 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1822 (v!2191 (underlying!140 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!1822 (v!2191 (underlying!140 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51315 () Bool)

(declare-fun e!33266 () Bool)

(assert (=> b!51315 (= e!33266 tp_is_empty!2213)))

(declare-fun b!51316 () Bool)

(assert (=> b!51316 (= e!33270 tp_is_empty!2213)))

(declare-fun b!51317 () Bool)

(declare-fun e!33274 () Bool)

(assert (=> b!51317 (= e!33274 tp_is_empty!2213)))

(declare-fun b!51318 () Bool)

(declare-fun res!29374 () Bool)

(assert (=> b!51318 (=> (not res!29374) (not e!33273))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51318 (= res!29374 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1823 (_keys!3545 (v!2191 (underlying!140 thiss!992)))))))))

(declare-fun mapIsEmpty!2290 () Bool)

(assert (=> mapIsEmpty!2290 mapRes!2289))

(declare-fun b!51319 () Bool)

(declare-fun e!33272 () Bool)

(assert (=> b!51319 (= e!33265 e!33272)))

(declare-fun b!51320 () Bool)

(assert (=> b!51320 (= e!33272 e!33267)))

(declare-fun b!51321 () Bool)

(assert (=> b!51321 (= e!33277 (and e!33266 mapRes!2290))))

(declare-fun condMapEmpty!2290 () Bool)

(declare-fun mapDefault!2290 () ValueCell!763)

