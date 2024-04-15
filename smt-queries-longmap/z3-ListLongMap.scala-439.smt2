; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8250 () Bool)

(assert start!8250)

(declare-fun b!52360 () Bool)

(declare-fun b_free!1657 () Bool)

(declare-fun b_next!1657 () Bool)

(assert (=> b!52360 (= b_free!1657 (not b_next!1657))))

(declare-fun tp!7071 () Bool)

(declare-fun b_and!2869 () Bool)

(assert (=> b!52360 (= tp!7071 b_and!2869)))

(declare-fun b!52357 () Bool)

(declare-fun b_free!1659 () Bool)

(declare-fun b_next!1659 () Bool)

(assert (=> b!52357 (= b_free!1659 (not b_next!1659))))

(declare-fun tp!7073 () Bool)

(declare-fun b_and!2871 () Bool)

(assert (=> b!52357 (= tp!7073 b_and!2871)))

(declare-fun mapIsEmpty!2405 () Bool)

(declare-fun mapRes!2405 () Bool)

(assert (=> mapIsEmpty!2405 mapRes!2405))

(declare-fun b!52354 () Bool)

(declare-fun e!34092 () Bool)

(declare-fun tp_is_empty!2245 () Bool)

(assert (=> b!52354 (= e!34092 tp_is_empty!2245)))

(declare-fun b!52355 () Bool)

(declare-fun e!34095 () Bool)

(assert (=> b!52355 (= e!34095 tp_is_empty!2245)))

(declare-fun e!34088 () Bool)

(declare-datatypes ((V!2641 0))(
  ( (V!2642 (val!1167 Int)) )
))
(declare-datatypes ((array!3393 0))(
  ( (array!3394 (arr!1618 (Array (_ BitVec 32) (_ BitVec 64))) (size!1848 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!779 0))(
  ( (ValueCellFull!779 (v!2220 V!2641)) (EmptyCell!779) )
))
(declare-datatypes ((array!3395 0))(
  ( (array!3396 (arr!1619 (Array (_ BitVec 32) ValueCell!779)) (size!1849 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!466 0))(
  ( (LongMapFixedSize!467 (defaultEntry!1947 Int) (mask!5771 (_ BitVec 32)) (extraKeys!1838 (_ BitVec 32)) (zeroValue!1865 V!2641) (minValue!1865 V!2641) (_size!282 (_ BitVec 32)) (_keys!3566 array!3393) (_values!1930 array!3395) (_vacant!282 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!466)

(declare-fun e!34093 () Bool)

(declare-fun array_inv!989 (array!3393) Bool)

(declare-fun array_inv!990 (array!3395) Bool)

(assert (=> b!52357 (= e!34088 (and tp!7073 tp_is_empty!2245 (array_inv!989 (_keys!3566 newMap!16)) (array_inv!990 (_values!1930 newMap!16)) e!34093))))

(declare-fun b!52358 () Bool)

(declare-fun res!29781 () Bool)

(declare-fun e!34094 () Bool)

(assert (=> b!52358 (=> (not res!29781) (not e!34094))))

(declare-datatypes ((Cell!286 0))(
  ( (Cell!287 (v!2221 LongMapFixedSize!466)) )
))
(declare-datatypes ((LongMap!286 0))(
  ( (LongMap!287 (underlying!154 Cell!286)) )
))
(declare-fun thiss!992 () LongMap!286)

(assert (=> b!52358 (= res!29781 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5771 newMap!16)) (_size!282 (v!2221 (underlying!154 thiss!992)))))))

(declare-fun mapNonEmpty!2405 () Bool)

(declare-fun mapRes!2406 () Bool)

(declare-fun tp!7072 () Bool)

(assert (=> mapNonEmpty!2405 (= mapRes!2406 (and tp!7072 e!34095))))

(declare-fun mapKey!2406 () (_ BitVec 32))

(declare-fun mapValue!2406 () ValueCell!779)

(declare-fun mapRest!2405 () (Array (_ BitVec 32) ValueCell!779))

(assert (=> mapNonEmpty!2405 (= (arr!1619 (_values!1930 (v!2221 (underlying!154 thiss!992)))) (store mapRest!2405 mapKey!2406 mapValue!2406))))

(declare-fun mapIsEmpty!2406 () Bool)

(assert (=> mapIsEmpty!2406 mapRes!2406))

(declare-fun b!52359 () Bool)

(declare-fun e!34084 () Bool)

(declare-fun e!34086 () Bool)

(assert (=> b!52359 (= e!34084 e!34086)))

(declare-fun e!34096 () Bool)

(assert (=> b!52360 (= e!34086 (and tp!7071 tp_is_empty!2245 (array_inv!989 (_keys!3566 (v!2221 (underlying!154 thiss!992)))) (array_inv!990 (_values!1930 (v!2221 (underlying!154 thiss!992)))) e!34096))))

(declare-fun b!52356 () Bool)

(declare-fun e!34085 () Bool)

(assert (=> b!52356 (= e!34096 (and e!34085 mapRes!2406))))

(declare-fun condMapEmpty!2406 () Bool)

(declare-fun mapDefault!2405 () ValueCell!779)

(assert (=> b!52356 (= condMapEmpty!2406 (= (arr!1619 (_values!1930 (v!2221 (underlying!154 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!779)) mapDefault!2405)))))

(declare-fun res!29782 () Bool)

(assert (=> start!8250 (=> (not res!29782) (not e!34094))))

(declare-fun valid!177 (LongMap!286) Bool)

(assert (=> start!8250 (= res!29782 (valid!177 thiss!992))))

(assert (=> start!8250 e!34094))

(declare-fun e!34089 () Bool)

(assert (=> start!8250 e!34089))

(assert (=> start!8250 true))

(assert (=> start!8250 e!34088))

(declare-fun b!52361 () Bool)

(declare-fun e!34087 () Bool)

(assert (=> b!52361 (= e!34087 tp_is_empty!2245)))

(declare-fun b!52362 () Bool)

(declare-fun res!29783 () Bool)

(assert (=> b!52362 (=> (not res!29783) (not e!34094))))

(declare-fun valid!178 (LongMapFixedSize!466) Bool)

(assert (=> b!52362 (= res!29783 (valid!178 newMap!16))))

(declare-fun b!52363 () Bool)

(declare-fun res!29784 () Bool)

(assert (=> b!52363 (=> (not res!29784) (not e!34094))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!52363 (= res!29784 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1848 (_keys!3566 (v!2221 (underlying!154 thiss!992)))))))))

(declare-fun b!52364 () Bool)

(assert (=> b!52364 (= e!34094 false)))

(declare-datatypes ((tuple2!1852 0))(
  ( (tuple2!1853 (_1!937 (_ BitVec 64)) (_2!937 V!2641)) )
))
(declare-datatypes ((List!1336 0))(
  ( (Nil!1333) (Cons!1332 (h!1912 tuple2!1852) (t!4369 List!1336)) )
))
(declare-datatypes ((ListLongMap!1255 0))(
  ( (ListLongMap!1256 (toList!643 List!1336)) )
))
(declare-fun lt!21265 () ListLongMap!1255)

(declare-fun map!1014 (LongMapFixedSize!466) ListLongMap!1255)

(assert (=> b!52364 (= lt!21265 (map!1014 newMap!16))))

(declare-fun lt!21266 () ListLongMap!1255)

(declare-fun getCurrentListMap!350 (array!3393 array!3395 (_ BitVec 32) (_ BitVec 32) V!2641 V!2641 (_ BitVec 32) Int) ListLongMap!1255)

(assert (=> b!52364 (= lt!21266 (getCurrentListMap!350 (_keys!3566 (v!2221 (underlying!154 thiss!992))) (_values!1930 (v!2221 (underlying!154 thiss!992))) (mask!5771 (v!2221 (underlying!154 thiss!992))) (extraKeys!1838 (v!2221 (underlying!154 thiss!992))) (zeroValue!1865 (v!2221 (underlying!154 thiss!992))) (minValue!1865 (v!2221 (underlying!154 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1947 (v!2221 (underlying!154 thiss!992)))))))

(declare-fun b!52365 () Bool)

(assert (=> b!52365 (= e!34089 e!34084)))

(declare-fun mapNonEmpty!2406 () Bool)

(declare-fun tp!7074 () Bool)

(assert (=> mapNonEmpty!2406 (= mapRes!2405 (and tp!7074 e!34087))))

(declare-fun mapRest!2406 () (Array (_ BitVec 32) ValueCell!779))

(declare-fun mapKey!2405 () (_ BitVec 32))

(declare-fun mapValue!2405 () ValueCell!779)

(assert (=> mapNonEmpty!2406 (= (arr!1619 (_values!1930 newMap!16)) (store mapRest!2406 mapKey!2405 mapValue!2405))))

(declare-fun b!52366 () Bool)

(assert (=> b!52366 (= e!34093 (and e!34092 mapRes!2405))))

(declare-fun condMapEmpty!2405 () Bool)

(declare-fun mapDefault!2406 () ValueCell!779)

(assert (=> b!52366 (= condMapEmpty!2405 (= (arr!1619 (_values!1930 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!779)) mapDefault!2406)))))

(declare-fun b!52367 () Bool)

(assert (=> b!52367 (= e!34085 tp_is_empty!2245)))

(assert (= (and start!8250 res!29782) b!52363))

(assert (= (and b!52363 res!29784) b!52362))

(assert (= (and b!52362 res!29783) b!52358))

(assert (= (and b!52358 res!29781) b!52364))

(assert (= (and b!52356 condMapEmpty!2406) mapIsEmpty!2406))

(assert (= (and b!52356 (not condMapEmpty!2406)) mapNonEmpty!2405))

(get-info :version)

(assert (= (and mapNonEmpty!2405 ((_ is ValueCellFull!779) mapValue!2406)) b!52355))

(assert (= (and b!52356 ((_ is ValueCellFull!779) mapDefault!2405)) b!52367))

(assert (= b!52360 b!52356))

(assert (= b!52359 b!52360))

(assert (= b!52365 b!52359))

(assert (= start!8250 b!52365))

(assert (= (and b!52366 condMapEmpty!2405) mapIsEmpty!2405))

(assert (= (and b!52366 (not condMapEmpty!2405)) mapNonEmpty!2406))

(assert (= (and mapNonEmpty!2406 ((_ is ValueCellFull!779) mapValue!2405)) b!52361))

(assert (= (and b!52366 ((_ is ValueCellFull!779) mapDefault!2406)) b!52354))

(assert (= b!52357 b!52366))

(assert (= start!8250 b!52357))

(declare-fun m!44743 () Bool)

(assert (=> b!52364 m!44743))

(declare-fun m!44745 () Bool)

(assert (=> b!52364 m!44745))

(declare-fun m!44747 () Bool)

(assert (=> start!8250 m!44747))

(declare-fun m!44749 () Bool)

(assert (=> b!52362 m!44749))

(declare-fun m!44751 () Bool)

(assert (=> b!52357 m!44751))

(declare-fun m!44753 () Bool)

(assert (=> b!52357 m!44753))

(declare-fun m!44755 () Bool)

(assert (=> b!52360 m!44755))

(declare-fun m!44757 () Bool)

(assert (=> b!52360 m!44757))

(declare-fun m!44759 () Bool)

(assert (=> mapNonEmpty!2405 m!44759))

(declare-fun m!44761 () Bool)

(assert (=> mapNonEmpty!2406 m!44761))

(check-sat (not mapNonEmpty!2406) (not b!52364) (not b!52362) (not start!8250) (not b_next!1657) tp_is_empty!2245 (not mapNonEmpty!2405) b_and!2871 b_and!2869 (not b!52360) (not b_next!1659) (not b!52357))
(check-sat b_and!2869 b_and!2871 (not b_next!1657) (not b_next!1659))
