; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8232 () Bool)

(assert start!8232)

(declare-fun b!51992 () Bool)

(declare-fun b_free!1621 () Bool)

(declare-fun b_next!1621 () Bool)

(assert (=> b!51992 (= b_free!1621 (not b_next!1621))))

(declare-fun tp!6966 () Bool)

(declare-fun b_and!2829 () Bool)

(assert (=> b!51992 (= tp!6966 b_and!2829)))

(declare-fun b!51983 () Bool)

(declare-fun b_free!1623 () Bool)

(declare-fun b_next!1623 () Bool)

(assert (=> b!51983 (= b_free!1623 (not b_next!1623))))

(declare-fun tp!6965 () Bool)

(declare-fun b_and!2831 () Bool)

(assert (=> b!51983 (= tp!6965 b_and!2831)))

(declare-fun b!51975 () Bool)

(declare-fun res!29665 () Bool)

(declare-fun e!33747 () Bool)

(assert (=> b!51975 (=> (not res!29665) (not e!33747))))

(declare-datatypes ((V!2617 0))(
  ( (V!2618 (val!1158 Int)) )
))
(declare-datatypes ((array!3363 0))(
  ( (array!3364 (arr!1604 (Array (_ BitVec 32) (_ BitVec 64))) (size!1833 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!770 0))(
  ( (ValueCellFull!770 (v!2206 V!2617)) (EmptyCell!770) )
))
(declare-datatypes ((array!3365 0))(
  ( (array!3366 (arr!1605 (Array (_ BitVec 32) ValueCell!770)) (size!1834 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!448 0))(
  ( (LongMapFixedSize!449 (defaultEntry!1938 Int) (mask!5757 (_ BitVec 32)) (extraKeys!1829 (_ BitVec 32)) (zeroValue!1856 V!2617) (minValue!1856 V!2617) (_size!273 (_ BitVec 32)) (_keys!3558 array!3363) (_values!1921 array!3365) (_vacant!273 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!270 0))(
  ( (Cell!271 (v!2207 LongMapFixedSize!448)) )
))
(declare-datatypes ((LongMap!270 0))(
  ( (LongMap!271 (underlying!146 Cell!270)) )
))
(declare-fun thiss!992 () LongMap!270)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3363 (_ BitVec 32)) Bool)

(assert (=> b!51975 (= res!29665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3558 (v!2207 (underlying!146 thiss!992))) (mask!5757 (v!2207 (underlying!146 thiss!992)))))))

(declare-fun b!51976 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51976 (= e!33747 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!51977 () Bool)

(declare-fun e!33748 () Bool)

(declare-fun e!33751 () Bool)

(assert (=> b!51977 (= e!33748 e!33751)))

(declare-fun b!51978 () Bool)

(declare-fun res!29660 () Bool)

(assert (=> b!51978 (=> (not res!29660) (not e!33747))))

(declare-fun newMap!16 () LongMapFixedSize!448)

(assert (=> b!51978 (= res!29660 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5757 newMap!16)) (_size!273 (v!2207 (underlying!146 thiss!992)))))))

(declare-fun mapNonEmpty!2351 () Bool)

(declare-fun mapRes!2352 () Bool)

(declare-fun tp!6964 () Bool)

(declare-fun e!33744 () Bool)

(assert (=> mapNonEmpty!2351 (= mapRes!2352 (and tp!6964 e!33744))))

(declare-fun mapValue!2352 () ValueCell!770)

(declare-fun mapRest!2352 () (Array (_ BitVec 32) ValueCell!770))

(declare-fun mapKey!2351 () (_ BitVec 32))

(assert (=> mapNonEmpty!2351 (= (arr!1605 (_values!1921 (v!2207 (underlying!146 thiss!992)))) (store mapRest!2352 mapKey!2351 mapValue!2352))))

(declare-fun b!51979 () Bool)

(declare-fun e!33746 () Bool)

(declare-fun e!33739 () Bool)

(assert (=> b!51979 (= e!33746 (and e!33739 mapRes!2352))))

(declare-fun condMapEmpty!2351 () Bool)

(declare-fun mapDefault!2352 () ValueCell!770)

(assert (=> b!51979 (= condMapEmpty!2351 (= (arr!1605 (_values!1921 (v!2207 (underlying!146 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!770)) mapDefault!2352)))))

(declare-fun b!51980 () Bool)

(declare-fun res!29659 () Bool)

(assert (=> b!51980 (=> (not res!29659) (not e!33747))))

(assert (=> b!51980 (= res!29659 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1833 (_keys!3558 (v!2207 (underlying!146 thiss!992)))))))))

(declare-fun b!51981 () Bool)

(declare-fun e!33750 () Bool)

(declare-fun tp_is_empty!2227 () Bool)

(assert (=> b!51981 (= e!33750 tp_is_empty!2227)))

(declare-fun b!51982 () Bool)

(declare-fun e!33743 () Bool)

(assert (=> b!51982 (= e!33751 e!33743)))

(declare-fun e!33745 () Bool)

(declare-fun e!33742 () Bool)

(declare-fun array_inv!967 (array!3363) Bool)

(declare-fun array_inv!968 (array!3365) Bool)

(assert (=> b!51983 (= e!33742 (and tp!6965 tp_is_empty!2227 (array_inv!967 (_keys!3558 newMap!16)) (array_inv!968 (_values!1921 newMap!16)) e!33745))))

(declare-fun b!51984 () Bool)

(declare-fun res!29663 () Bool)

(assert (=> b!51984 (=> (not res!29663) (not e!33747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51984 (= res!29663 (validMask!0 (mask!5757 (v!2207 (underlying!146 thiss!992)))))))

(declare-fun b!51985 () Bool)

(assert (=> b!51985 (= e!33739 tp_is_empty!2227)))

(declare-fun mapIsEmpty!2351 () Bool)

(assert (=> mapIsEmpty!2351 mapRes!2352))

(declare-fun mapIsEmpty!2352 () Bool)

(declare-fun mapRes!2351 () Bool)

(assert (=> mapIsEmpty!2352 mapRes!2351))

(declare-fun mapNonEmpty!2352 () Bool)

(declare-fun tp!6963 () Bool)

(assert (=> mapNonEmpty!2352 (= mapRes!2351 (and tp!6963 e!33750))))

(declare-fun mapRest!2351 () (Array (_ BitVec 32) ValueCell!770))

(declare-fun mapKey!2352 () (_ BitVec 32))

(declare-fun mapValue!2351 () ValueCell!770)

(assert (=> mapNonEmpty!2352 (= (arr!1605 (_values!1921 newMap!16)) (store mapRest!2351 mapKey!2352 mapValue!2351))))

(declare-fun b!51987 () Bool)

(declare-fun res!29664 () Bool)

(assert (=> b!51987 (=> (not res!29664) (not e!33747))))

(declare-fun valid!169 (LongMapFixedSize!448) Bool)

(assert (=> b!51987 (= res!29664 (valid!169 newMap!16))))

(declare-fun b!51988 () Bool)

(declare-fun e!33740 () Bool)

(assert (=> b!51988 (= e!33745 (and e!33740 mapRes!2351))))

(declare-fun condMapEmpty!2352 () Bool)

(declare-fun mapDefault!2351 () ValueCell!770)

(assert (=> b!51988 (= condMapEmpty!2352 (= (arr!1605 (_values!1921 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!770)) mapDefault!2351)))))

(declare-fun b!51989 () Bool)

(declare-fun res!29661 () Bool)

(assert (=> b!51989 (=> (not res!29661) (not e!33747))))

(assert (=> b!51989 (= res!29661 (and (= (size!1834 (_values!1921 (v!2207 (underlying!146 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5757 (v!2207 (underlying!146 thiss!992))))) (= (size!1833 (_keys!3558 (v!2207 (underlying!146 thiss!992)))) (size!1834 (_values!1921 (v!2207 (underlying!146 thiss!992))))) (bvsge (mask!5757 (v!2207 (underlying!146 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1829 (v!2207 (underlying!146 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1829 (v!2207 (underlying!146 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51990 () Bool)

(assert (=> b!51990 (= e!33744 tp_is_empty!2227)))

(declare-fun b!51991 () Bool)

(declare-fun res!29658 () Bool)

(assert (=> b!51991 (=> (not res!29658) (not e!33747))))

(declare-datatypes ((List!1321 0))(
  ( (Nil!1318) (Cons!1317 (h!1897 (_ BitVec 64)) (t!4355 List!1321)) )
))
(declare-fun arrayNoDuplicates!0 (array!3363 (_ BitVec 32) List!1321) Bool)

(assert (=> b!51991 (= res!29658 (arrayNoDuplicates!0 (_keys!3558 (v!2207 (underlying!146 thiss!992))) #b00000000000000000000000000000000 Nil!1318))))

(assert (=> b!51992 (= e!33743 (and tp!6966 tp_is_empty!2227 (array_inv!967 (_keys!3558 (v!2207 (underlying!146 thiss!992)))) (array_inv!968 (_values!1921 (v!2207 (underlying!146 thiss!992)))) e!33746))))

(declare-fun b!51986 () Bool)

(assert (=> b!51986 (= e!33740 tp_is_empty!2227)))

(declare-fun res!29662 () Bool)

(assert (=> start!8232 (=> (not res!29662) (not e!33747))))

(declare-fun valid!170 (LongMap!270) Bool)

(assert (=> start!8232 (= res!29662 (valid!170 thiss!992))))

(assert (=> start!8232 e!33747))

(assert (=> start!8232 e!33748))

(assert (=> start!8232 true))

(assert (=> start!8232 e!33742))

(assert (= (and start!8232 res!29662) b!51980))

(assert (= (and b!51980 res!29659) b!51987))

(assert (= (and b!51987 res!29664) b!51978))

(assert (= (and b!51978 res!29660) b!51984))

(assert (= (and b!51984 res!29663) b!51989))

(assert (= (and b!51989 res!29661) b!51975))

(assert (= (and b!51975 res!29665) b!51991))

(assert (= (and b!51991 res!29658) b!51976))

(assert (= (and b!51979 condMapEmpty!2351) mapIsEmpty!2351))

(assert (= (and b!51979 (not condMapEmpty!2351)) mapNonEmpty!2351))

(get-info :version)

(assert (= (and mapNonEmpty!2351 ((_ is ValueCellFull!770) mapValue!2352)) b!51990))

(assert (= (and b!51979 ((_ is ValueCellFull!770) mapDefault!2352)) b!51985))

(assert (= b!51992 b!51979))

(assert (= b!51982 b!51992))

(assert (= b!51977 b!51982))

(assert (= start!8232 b!51977))

(assert (= (and b!51988 condMapEmpty!2352) mapIsEmpty!2352))

(assert (= (and b!51988 (not condMapEmpty!2352)) mapNonEmpty!2352))

(assert (= (and mapNonEmpty!2352 ((_ is ValueCellFull!770) mapValue!2351)) b!51981))

(assert (= (and b!51988 ((_ is ValueCellFull!770) mapDefault!2351)) b!51986))

(assert (= b!51983 b!51988))

(assert (= start!8232 b!51983))

(declare-fun m!44527 () Bool)

(assert (=> mapNonEmpty!2352 m!44527))

(declare-fun m!44529 () Bool)

(assert (=> b!51987 m!44529))

(declare-fun m!44531 () Bool)

(assert (=> b!51975 m!44531))

(declare-fun m!44533 () Bool)

(assert (=> b!51984 m!44533))

(declare-fun m!44535 () Bool)

(assert (=> b!51992 m!44535))

(declare-fun m!44537 () Bool)

(assert (=> b!51992 m!44537))

(declare-fun m!44539 () Bool)

(assert (=> start!8232 m!44539))

(declare-fun m!44541 () Bool)

(assert (=> mapNonEmpty!2351 m!44541))

(declare-fun m!44543 () Bool)

(assert (=> b!51991 m!44543))

(declare-fun m!44545 () Bool)

(assert (=> b!51983 m!44545))

(declare-fun m!44547 () Bool)

(assert (=> b!51983 m!44547))

(check-sat (not b!51991) (not b_next!1623) b_and!2829 (not b!51987) (not b!51984) (not b_next!1621) (not mapNonEmpty!2351) (not b!51975) (not b!51992) (not mapNonEmpty!2352) (not start!8232) (not b!51983) b_and!2831 tp_is_empty!2227)
(check-sat b_and!2829 b_and!2831 (not b_next!1621) (not b_next!1623))
