; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8250 () Bool)

(assert start!8250)

(declare-fun b!52375 () Bool)

(declare-fun b_free!1657 () Bool)

(declare-fun b_next!1657 () Bool)

(assert (=> b!52375 (= b_free!1657 (not b_next!1657))))

(declare-fun tp!7071 () Bool)

(declare-fun b_and!2865 () Bool)

(assert (=> b!52375 (= tp!7071 b_and!2865)))

(declare-fun b!52368 () Bool)

(declare-fun b_free!1659 () Bool)

(declare-fun b_next!1659 () Bool)

(assert (=> b!52368 (= b_free!1659 (not b_next!1659))))

(declare-fun tp!7074 () Bool)

(declare-fun b_and!2867 () Bool)

(assert (=> b!52368 (= tp!7074 b_and!2867)))

(declare-fun mapNonEmpty!2405 () Bool)

(declare-fun mapRes!2405 () Bool)

(declare-fun tp!7073 () Bool)

(declare-fun e!34101 () Bool)

(assert (=> mapNonEmpty!2405 (= mapRes!2405 (and tp!7073 e!34101))))

(declare-datatypes ((V!2641 0))(
  ( (V!2642 (val!1167 Int)) )
))
(declare-datatypes ((ValueCell!779 0))(
  ( (ValueCellFull!779 (v!2223 V!2641)) (EmptyCell!779) )
))
(declare-fun mapRest!2406 () (Array (_ BitVec 32) ValueCell!779))

(declare-datatypes ((array!3399 0))(
  ( (array!3400 (arr!1622 (Array (_ BitVec 32) (_ BitVec 64))) (size!1851 (_ BitVec 32))) )
))
(declare-datatypes ((array!3401 0))(
  ( (array!3402 (arr!1623 (Array (_ BitVec 32) ValueCell!779)) (size!1852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!466 0))(
  ( (LongMapFixedSize!467 (defaultEntry!1947 Int) (mask!5772 (_ BitVec 32)) (extraKeys!1838 (_ BitVec 32)) (zeroValue!1865 V!2641) (minValue!1865 V!2641) (_size!282 (_ BitVec 32)) (_keys!3567 array!3399) (_values!1930 array!3401) (_vacant!282 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!466)

(declare-fun mapKey!2406 () (_ BitVec 32))

(declare-fun mapValue!2406 () ValueCell!779)

(assert (=> mapNonEmpty!2405 (= (arr!1623 (_values!1930 newMap!16)) (store mapRest!2406 mapKey!2406 mapValue!2406))))

(declare-fun b!52364 () Bool)

(declare-fun e!34100 () Bool)

(declare-fun e!34092 () Bool)

(assert (=> b!52364 (= e!34100 e!34092)))

(declare-fun b!52365 () Bool)

(declare-fun e!34095 () Bool)

(declare-fun e!34102 () Bool)

(declare-fun mapRes!2406 () Bool)

(assert (=> b!52365 (= e!34095 (and e!34102 mapRes!2406))))

(declare-fun condMapEmpty!2405 () Bool)

(declare-datatypes ((Cell!286 0))(
  ( (Cell!287 (v!2224 LongMapFixedSize!466)) )
))
(declare-datatypes ((LongMap!286 0))(
  ( (LongMap!287 (underlying!154 Cell!286)) )
))
(declare-fun thiss!992 () LongMap!286)

(declare-fun mapDefault!2406 () ValueCell!779)

(assert (=> b!52365 (= condMapEmpty!2405 (= (arr!1623 (_values!1930 (v!2224 (underlying!154 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!779)) mapDefault!2406)))))

(declare-fun mapNonEmpty!2406 () Bool)

(declare-fun tp!7072 () Bool)

(declare-fun e!34097 () Bool)

(assert (=> mapNonEmpty!2406 (= mapRes!2406 (and tp!7072 e!34097))))

(declare-fun mapKey!2405 () (_ BitVec 32))

(declare-fun mapRest!2405 () (Array (_ BitVec 32) ValueCell!779))

(declare-fun mapValue!2405 () ValueCell!779)

(assert (=> mapNonEmpty!2406 (= (arr!1623 (_values!1930 (v!2224 (underlying!154 thiss!992)))) (store mapRest!2405 mapKey!2405 mapValue!2405))))

(declare-fun b!52366 () Bool)

(declare-fun e!34098 () Bool)

(declare-fun e!34090 () Bool)

(assert (=> b!52366 (= e!34098 (and e!34090 mapRes!2405))))

(declare-fun condMapEmpty!2406 () Bool)

(declare-fun mapDefault!2405 () ValueCell!779)

(assert (=> b!52366 (= condMapEmpty!2406 (= (arr!1623 (_values!1930 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!779)) mapDefault!2405)))))

(declare-fun b!52367 () Bool)

(declare-fun tp_is_empty!2245 () Bool)

(assert (=> b!52367 (= e!34090 tp_is_empty!2245)))

(declare-fun e!34094 () Bool)

(declare-fun array_inv!981 (array!3399) Bool)

(declare-fun array_inv!982 (array!3401) Bool)

(assert (=> b!52368 (= e!34094 (and tp!7074 tp_is_empty!2245 (array_inv!981 (_keys!3567 newMap!16)) (array_inv!982 (_values!1930 newMap!16)) e!34098))))

(declare-fun b!52369 () Bool)

(declare-fun e!34091 () Bool)

(assert (=> b!52369 (= e!34091 e!34100)))

(declare-fun b!52370 () Bool)

(declare-fun e!34093 () Bool)

(assert (=> b!52370 (= e!34093 false)))

(declare-datatypes ((tuple2!1830 0))(
  ( (tuple2!1831 (_1!926 (_ BitVec 64)) (_2!926 V!2641)) )
))
(declare-datatypes ((List!1324 0))(
  ( (Nil!1321) (Cons!1320 (h!1900 tuple2!1830) (t!4358 List!1324)) )
))
(declare-datatypes ((ListLongMap!1239 0))(
  ( (ListLongMap!1240 (toList!635 List!1324)) )
))
(declare-fun lt!21238 () ListLongMap!1239)

(declare-fun map!1013 (LongMapFixedSize!466) ListLongMap!1239)

(assert (=> b!52370 (= lt!21238 (map!1013 newMap!16))))

(declare-fun lt!21239 () ListLongMap!1239)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!343 (array!3399 array!3401 (_ BitVec 32) (_ BitVec 32) V!2641 V!2641 (_ BitVec 32) Int) ListLongMap!1239)

(assert (=> b!52370 (= lt!21239 (getCurrentListMap!343 (_keys!3567 (v!2224 (underlying!154 thiss!992))) (_values!1930 (v!2224 (underlying!154 thiss!992))) (mask!5772 (v!2224 (underlying!154 thiss!992))) (extraKeys!1838 (v!2224 (underlying!154 thiss!992))) (zeroValue!1865 (v!2224 (underlying!154 thiss!992))) (minValue!1865 (v!2224 (underlying!154 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1947 (v!2224 (underlying!154 thiss!992)))))))

(declare-fun b!52371 () Bool)

(declare-fun res!29777 () Bool)

(assert (=> b!52371 (=> (not res!29777) (not e!34093))))

(assert (=> b!52371 (= res!29777 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5772 newMap!16)) (_size!282 (v!2224 (underlying!154 thiss!992)))))))

(declare-fun b!52372 () Bool)

(declare-fun res!29779 () Bool)

(assert (=> b!52372 (=> (not res!29779) (not e!34093))))

(declare-fun valid!175 (LongMapFixedSize!466) Bool)

(assert (=> b!52372 (= res!29779 (valid!175 newMap!16))))

(declare-fun res!29776 () Bool)

(assert (=> start!8250 (=> (not res!29776) (not e!34093))))

(declare-fun valid!176 (LongMap!286) Bool)

(assert (=> start!8250 (= res!29776 (valid!176 thiss!992))))

(assert (=> start!8250 e!34093))

(assert (=> start!8250 e!34091))

(assert (=> start!8250 true))

(assert (=> start!8250 e!34094))

(declare-fun b!52363 () Bool)

(assert (=> b!52363 (= e!34097 tp_is_empty!2245)))

(declare-fun b!52373 () Bool)

(assert (=> b!52373 (= e!34101 tp_is_empty!2245)))

(declare-fun b!52374 () Bool)

(assert (=> b!52374 (= e!34102 tp_is_empty!2245)))

(declare-fun mapIsEmpty!2405 () Bool)

(assert (=> mapIsEmpty!2405 mapRes!2405))

(declare-fun mapIsEmpty!2406 () Bool)

(assert (=> mapIsEmpty!2406 mapRes!2406))

(assert (=> b!52375 (= e!34092 (and tp!7071 tp_is_empty!2245 (array_inv!981 (_keys!3567 (v!2224 (underlying!154 thiss!992)))) (array_inv!982 (_values!1930 (v!2224 (underlying!154 thiss!992)))) e!34095))))

(declare-fun b!52376 () Bool)

(declare-fun res!29778 () Bool)

(assert (=> b!52376 (=> (not res!29778) (not e!34093))))

(assert (=> b!52376 (= res!29778 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1851 (_keys!3567 (v!2224 (underlying!154 thiss!992)))))))))

(assert (= (and start!8250 res!29776) b!52376))

(assert (= (and b!52376 res!29778) b!52372))

(assert (= (and b!52372 res!29779) b!52371))

(assert (= (and b!52371 res!29777) b!52370))

(assert (= (and b!52365 condMapEmpty!2405) mapIsEmpty!2406))

(assert (= (and b!52365 (not condMapEmpty!2405)) mapNonEmpty!2406))

(get-info :version)

(assert (= (and mapNonEmpty!2406 ((_ is ValueCellFull!779) mapValue!2405)) b!52363))

(assert (= (and b!52365 ((_ is ValueCellFull!779) mapDefault!2406)) b!52374))

(assert (= b!52375 b!52365))

(assert (= b!52364 b!52375))

(assert (= b!52369 b!52364))

(assert (= start!8250 b!52369))

(assert (= (and b!52366 condMapEmpty!2406) mapIsEmpty!2405))

(assert (= (and b!52366 (not condMapEmpty!2406)) mapNonEmpty!2405))

(assert (= (and mapNonEmpty!2405 ((_ is ValueCellFull!779) mapValue!2406)) b!52373))

(assert (= (and b!52366 ((_ is ValueCellFull!779) mapDefault!2405)) b!52367))

(assert (= b!52368 b!52366))

(assert (= start!8250 b!52368))

(declare-fun m!44701 () Bool)

(assert (=> b!52372 m!44701))

(declare-fun m!44703 () Bool)

(assert (=> b!52368 m!44703))

(declare-fun m!44705 () Bool)

(assert (=> b!52368 m!44705))

(declare-fun m!44707 () Bool)

(assert (=> mapNonEmpty!2405 m!44707))

(declare-fun m!44709 () Bool)

(assert (=> mapNonEmpty!2406 m!44709))

(declare-fun m!44711 () Bool)

(assert (=> b!52375 m!44711))

(declare-fun m!44713 () Bool)

(assert (=> b!52375 m!44713))

(declare-fun m!44715 () Bool)

(assert (=> start!8250 m!44715))

(declare-fun m!44717 () Bool)

(assert (=> b!52370 m!44717))

(declare-fun m!44719 () Bool)

(assert (=> b!52370 m!44719))

(check-sat (not b!52372) (not b_next!1657) (not b!52375) (not b!52368) b_and!2865 (not start!8250) (not b_next!1659) tp_is_empty!2245 (not mapNonEmpty!2405) (not mapNonEmpty!2406) b_and!2867 (not b!52370))
(check-sat b_and!2865 b_and!2867 (not b_next!1657) (not b_next!1659))
