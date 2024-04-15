; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8232 () Bool)

(assert start!8232)

(declare-fun b!51977 () Bool)

(declare-fun b_free!1621 () Bool)

(declare-fun b_next!1621 () Bool)

(assert (=> b!51977 (= b_free!1621 (not b_next!1621))))

(declare-fun tp!6963 () Bool)

(declare-fun b_and!2833 () Bool)

(assert (=> b!51977 (= tp!6963 b_and!2833)))

(declare-fun b!51974 () Bool)

(declare-fun b_free!1623 () Bool)

(declare-fun b_next!1623 () Bool)

(assert (=> b!51974 (= b_free!1623 (not b_next!1623))))

(declare-fun tp!6965 () Bool)

(declare-fun b_and!2835 () Bool)

(assert (=> b!51974 (= tp!6965 b_and!2835)))

(declare-fun b!51966 () Bool)

(declare-fun e!33740 () Bool)

(declare-fun e!33737 () Bool)

(declare-fun mapRes!2351 () Bool)

(assert (=> b!51966 (= e!33740 (and e!33737 mapRes!2351))))

(declare-fun condMapEmpty!2351 () Bool)

(declare-datatypes ((V!2617 0))(
  ( (V!2618 (val!1158 Int)) )
))
(declare-datatypes ((array!3357 0))(
  ( (array!3358 (arr!1600 (Array (_ BitVec 32) (_ BitVec 64))) (size!1830 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!770 0))(
  ( (ValueCellFull!770 (v!2203 V!2617)) (EmptyCell!770) )
))
(declare-datatypes ((array!3359 0))(
  ( (array!3360 (arr!1601 (Array (_ BitVec 32) ValueCell!770)) (size!1831 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!448 0))(
  ( (LongMapFixedSize!449 (defaultEntry!1938 Int) (mask!5756 (_ BitVec 32)) (extraKeys!1829 (_ BitVec 32)) (zeroValue!1856 V!2617) (minValue!1856 V!2617) (_size!273 (_ BitVec 32)) (_keys!3557 array!3357) (_values!1921 array!3359) (_vacant!273 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!448)

(declare-fun mapDefault!2352 () ValueCell!770)

(assert (=> b!51966 (= condMapEmpty!2351 (= (arr!1601 (_values!1921 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!770)) mapDefault!2352)))))

(declare-fun b!51967 () Bool)

(declare-fun e!33744 () Bool)

(declare-fun e!33734 () Bool)

(declare-fun mapRes!2352 () Bool)

(assert (=> b!51967 (= e!33744 (and e!33734 mapRes!2352))))

(declare-fun condMapEmpty!2352 () Bool)

(declare-datatypes ((Cell!270 0))(
  ( (Cell!271 (v!2204 LongMapFixedSize!448)) )
))
(declare-datatypes ((LongMap!270 0))(
  ( (LongMap!271 (underlying!146 Cell!270)) )
))
(declare-fun thiss!992 () LongMap!270)

(declare-fun mapDefault!2351 () ValueCell!770)

(assert (=> b!51967 (= condMapEmpty!2352 (= (arr!1601 (_values!1921 (v!2204 (underlying!146 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!770)) mapDefault!2351)))))

(declare-fun res!29664 () Bool)

(declare-fun e!33733 () Bool)

(assert (=> start!8232 (=> (not res!29664) (not e!33733))))

(declare-fun valid!166 (LongMap!270) Bool)

(assert (=> start!8232 (= res!29664 (valid!166 thiss!992))))

(assert (=> start!8232 e!33733))

(declare-fun e!33743 () Bool)

(assert (=> start!8232 e!33743))

(assert (=> start!8232 true))

(declare-fun e!33739 () Bool)

(assert (=> start!8232 e!33739))

(declare-fun b!51968 () Bool)

(declare-fun res!29665 () Bool)

(assert (=> b!51968 (=> (not res!29665) (not e!33733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51968 (= res!29665 (validMask!0 (mask!5756 (v!2204 (underlying!146 thiss!992)))))))

(declare-fun b!51969 () Bool)

(declare-fun res!29666 () Bool)

(assert (=> b!51969 (=> (not res!29666) (not e!33733))))

(assert (=> b!51969 (= res!29666 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5756 newMap!16)) (_size!273 (v!2204 (underlying!146 thiss!992)))))))

(declare-fun b!51970 () Bool)

(declare-fun res!29668 () Bool)

(assert (=> b!51970 (=> (not res!29668) (not e!33733))))

(declare-fun valid!167 (LongMapFixedSize!448) Bool)

(assert (=> b!51970 (= res!29668 (valid!167 newMap!16))))

(declare-fun b!51971 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51971 (= e!33733 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!51972 () Bool)

(declare-fun e!33735 () Bool)

(declare-fun tp_is_empty!2227 () Bool)

(assert (=> b!51972 (= e!33735 tp_is_empty!2227)))

(declare-fun b!51973 () Bool)

(declare-fun res!29663 () Bool)

(assert (=> b!51973 (=> (not res!29663) (not e!33733))))

(declare-datatypes ((List!1331 0))(
  ( (Nil!1328) (Cons!1327 (h!1907 (_ BitVec 64)) (t!4364 List!1331)) )
))
(declare-fun arrayNoDuplicates!0 (array!3357 (_ BitVec 32) List!1331) Bool)

(assert (=> b!51973 (= res!29663 (arrayNoDuplicates!0 (_keys!3557 (v!2204 (underlying!146 thiss!992))) #b00000000000000000000000000000000 Nil!1328))))

(declare-fun array_inv!979 (array!3357) Bool)

(declare-fun array_inv!980 (array!3359) Bool)

(assert (=> b!51974 (= e!33739 (and tp!6965 tp_is_empty!2227 (array_inv!979 (_keys!3557 newMap!16)) (array_inv!980 (_values!1921 newMap!16)) e!33740))))

(declare-fun b!51975 () Bool)

(declare-fun e!33742 () Bool)

(assert (=> b!51975 (= e!33742 tp_is_empty!2227)))

(declare-fun b!51976 () Bool)

(assert (=> b!51976 (= e!33737 tp_is_empty!2227)))

(declare-fun e!33741 () Bool)

(assert (=> b!51977 (= e!33741 (and tp!6963 tp_is_empty!2227 (array_inv!979 (_keys!3557 (v!2204 (underlying!146 thiss!992)))) (array_inv!980 (_values!1921 (v!2204 (underlying!146 thiss!992)))) e!33744))))

(declare-fun b!51978 () Bool)

(declare-fun e!33745 () Bool)

(assert (=> b!51978 (= e!33745 e!33741)))

(declare-fun b!51979 () Bool)

(declare-fun res!29669 () Bool)

(assert (=> b!51979 (=> (not res!29669) (not e!33733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3357 (_ BitVec 32)) Bool)

(assert (=> b!51979 (= res!29669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3557 (v!2204 (underlying!146 thiss!992))) (mask!5756 (v!2204 (underlying!146 thiss!992)))))))

(declare-fun b!51980 () Bool)

(assert (=> b!51980 (= e!33734 tp_is_empty!2227)))

(declare-fun mapNonEmpty!2351 () Bool)

(declare-fun tp!6966 () Bool)

(assert (=> mapNonEmpty!2351 (= mapRes!2351 (and tp!6966 e!33735))))

(declare-fun mapRest!2351 () (Array (_ BitVec 32) ValueCell!770))

(declare-fun mapKey!2352 () (_ BitVec 32))

(declare-fun mapValue!2352 () ValueCell!770)

(assert (=> mapNonEmpty!2351 (= (arr!1601 (_values!1921 newMap!16)) (store mapRest!2351 mapKey!2352 mapValue!2352))))

(declare-fun b!51981 () Bool)

(assert (=> b!51981 (= e!33743 e!33745)))

(declare-fun b!51982 () Bool)

(declare-fun res!29667 () Bool)

(assert (=> b!51982 (=> (not res!29667) (not e!33733))))

(assert (=> b!51982 (= res!29667 (and (= (size!1831 (_values!1921 (v!2204 (underlying!146 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5756 (v!2204 (underlying!146 thiss!992))))) (= (size!1830 (_keys!3557 (v!2204 (underlying!146 thiss!992)))) (size!1831 (_values!1921 (v!2204 (underlying!146 thiss!992))))) (bvsge (mask!5756 (v!2204 (underlying!146 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1829 (v!2204 (underlying!146 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1829 (v!2204 (underlying!146 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!2352 () Bool)

(declare-fun tp!6964 () Bool)

(assert (=> mapNonEmpty!2352 (= mapRes!2352 (and tp!6964 e!33742))))

(declare-fun mapValue!2351 () ValueCell!770)

(declare-fun mapKey!2351 () (_ BitVec 32))

(declare-fun mapRest!2352 () (Array (_ BitVec 32) ValueCell!770))

(assert (=> mapNonEmpty!2352 (= (arr!1601 (_values!1921 (v!2204 (underlying!146 thiss!992)))) (store mapRest!2352 mapKey!2351 mapValue!2351))))

(declare-fun b!51983 () Bool)

(declare-fun res!29670 () Bool)

(assert (=> b!51983 (=> (not res!29670) (not e!33733))))

(assert (=> b!51983 (= res!29670 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1830 (_keys!3557 (v!2204 (underlying!146 thiss!992)))))))))

(declare-fun mapIsEmpty!2351 () Bool)

(assert (=> mapIsEmpty!2351 mapRes!2352))

(declare-fun mapIsEmpty!2352 () Bool)

(assert (=> mapIsEmpty!2352 mapRes!2351))

(assert (= (and start!8232 res!29664) b!51983))

(assert (= (and b!51983 res!29670) b!51970))

(assert (= (and b!51970 res!29668) b!51969))

(assert (= (and b!51969 res!29666) b!51968))

(assert (= (and b!51968 res!29665) b!51982))

(assert (= (and b!51982 res!29667) b!51979))

(assert (= (and b!51979 res!29669) b!51973))

(assert (= (and b!51973 res!29663) b!51971))

(assert (= (and b!51967 condMapEmpty!2352) mapIsEmpty!2351))

(assert (= (and b!51967 (not condMapEmpty!2352)) mapNonEmpty!2352))

(get-info :version)

(assert (= (and mapNonEmpty!2352 ((_ is ValueCellFull!770) mapValue!2351)) b!51975))

(assert (= (and b!51967 ((_ is ValueCellFull!770) mapDefault!2351)) b!51980))

(assert (= b!51977 b!51967))

(assert (= b!51978 b!51977))

(assert (= b!51981 b!51978))

(assert (= start!8232 b!51981))

(assert (= (and b!51966 condMapEmpty!2351) mapIsEmpty!2352))

(assert (= (and b!51966 (not condMapEmpty!2351)) mapNonEmpty!2351))

(assert (= (and mapNonEmpty!2351 ((_ is ValueCellFull!770) mapValue!2352)) b!51972))

(assert (= (and b!51966 ((_ is ValueCellFull!770) mapDefault!2352)) b!51976))

(assert (= b!51974 b!51966))

(assert (= start!8232 b!51974))

(declare-fun m!44569 () Bool)

(assert (=> b!51970 m!44569))

(declare-fun m!44571 () Bool)

(assert (=> b!51968 m!44571))

(declare-fun m!44573 () Bool)

(assert (=> b!51977 m!44573))

(declare-fun m!44575 () Bool)

(assert (=> b!51977 m!44575))

(declare-fun m!44577 () Bool)

(assert (=> b!51974 m!44577))

(declare-fun m!44579 () Bool)

(assert (=> b!51974 m!44579))

(declare-fun m!44581 () Bool)

(assert (=> mapNonEmpty!2352 m!44581))

(declare-fun m!44583 () Bool)

(assert (=> b!51979 m!44583))

(declare-fun m!44585 () Bool)

(assert (=> mapNonEmpty!2351 m!44585))

(declare-fun m!44587 () Bool)

(assert (=> b!51973 m!44587))

(declare-fun m!44589 () Bool)

(assert (=> start!8232 m!44589))

(check-sat tp_is_empty!2227 (not b!51974) (not b!51970) (not b!51979) b_and!2835 (not start!8232) (not b!51973) (not mapNonEmpty!2351) (not b!51977) (not b_next!1621) b_and!2833 (not b_next!1623) (not mapNonEmpty!2352) (not b!51968))
(check-sat b_and!2833 b_and!2835 (not b_next!1621) (not b_next!1623))
