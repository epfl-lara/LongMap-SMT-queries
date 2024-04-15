; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2930 () Bool)

(assert start!2930)

(declare-fun b!16697 () Bool)

(declare-fun b_free!577 () Bool)

(declare-fun b_next!577 () Bool)

(assert (=> b!16697 (= b_free!577 (not b_next!577))))

(declare-fun tp!2918 () Bool)

(declare-fun b_and!1213 () Bool)

(assert (=> b!16697 (= tp!2918 b_and!1213)))

(declare-fun e!10352 () Bool)

(declare-fun e!10354 () Bool)

(declare-datatypes ((V!947 0))(
  ( (V!948 (val!447 Int)) )
))
(declare-datatypes ((ValueCell!221 0))(
  ( (ValueCellFull!221 (v!1393 V!947)) (EmptyCell!221) )
))
(declare-datatypes ((array!867 0))(
  ( (array!868 (arr!416 (Array (_ BitVec 32) ValueCell!221)) (size!505 (_ BitVec 32))) )
))
(declare-datatypes ((array!869 0))(
  ( (array!870 (arr!417 (Array (_ BitVec 32) (_ BitVec 64))) (size!506 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!28 0))(
  ( (LongMapFixedSize!29 (defaultEntry!1624 Int) (mask!4532 (_ BitVec 32)) (extraKeys!1538 (_ BitVec 32)) (zeroValue!1561 V!947) (minValue!1561 V!947) (_size!45 (_ BitVec 32)) (_keys!3049 array!869) (_values!1622 array!867) (_vacant!45 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!28 0))(
  ( (Cell!29 (v!1394 LongMapFixedSize!28)) )
))
(declare-datatypes ((LongMap!28 0))(
  ( (LongMap!29 (underlying!25 Cell!28)) )
))
(declare-fun thiss!848 () LongMap!28)

(declare-fun tp_is_empty!841 () Bool)

(declare-fun array_inv!305 (array!869) Bool)

(declare-fun array_inv!306 (array!867) Bool)

(assert (=> b!16697 (= e!10354 (and tp!2918 tp_is_empty!841 (array_inv!305 (_keys!3049 (v!1394 (underlying!25 thiss!848)))) (array_inv!306 (_values!1622 (v!1394 (underlying!25 thiss!848)))) e!10352))))

(declare-fun lt!4128 () Bool)

(declare-fun valid!22 (LongMap!28) Bool)

(assert (=> start!2930 (= lt!4128 (valid!22 thiss!848))))

(assert (=> start!2930 false))

(declare-fun e!10348 () Bool)

(assert (=> start!2930 e!10348))

(declare-fun b!16698 () Bool)

(declare-fun e!10351 () Bool)

(assert (=> b!16698 (= e!10351 tp_is_empty!841)))

(declare-fun b!16699 () Bool)

(declare-fun e!10350 () Bool)

(assert (=> b!16699 (= e!10348 e!10350)))

(declare-fun mapNonEmpty!692 () Bool)

(declare-fun mapRes!692 () Bool)

(declare-fun tp!2917 () Bool)

(assert (=> mapNonEmpty!692 (= mapRes!692 (and tp!2917 e!10351))))

(declare-fun mapRest!692 () (Array (_ BitVec 32) ValueCell!221))

(declare-fun mapKey!692 () (_ BitVec 32))

(declare-fun mapValue!692 () ValueCell!221)

(assert (=> mapNonEmpty!692 (= (arr!416 (_values!1622 (v!1394 (underlying!25 thiss!848)))) (store mapRest!692 mapKey!692 mapValue!692))))

(declare-fun b!16700 () Bool)

(assert (=> b!16700 (= e!10350 e!10354)))

(declare-fun mapIsEmpty!692 () Bool)

(assert (=> mapIsEmpty!692 mapRes!692))

(declare-fun b!16701 () Bool)

(declare-fun e!10353 () Bool)

(assert (=> b!16701 (= e!10353 tp_is_empty!841)))

(declare-fun b!16702 () Bool)

(assert (=> b!16702 (= e!10352 (and e!10353 mapRes!692))))

(declare-fun condMapEmpty!692 () Bool)

(declare-fun mapDefault!692 () ValueCell!221)

(assert (=> b!16702 (= condMapEmpty!692 (= (arr!416 (_values!1622 (v!1394 (underlying!25 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!221)) mapDefault!692)))))

(assert (= (and b!16702 condMapEmpty!692) mapIsEmpty!692))

(assert (= (and b!16702 (not condMapEmpty!692)) mapNonEmpty!692))

(get-info :version)

(assert (= (and mapNonEmpty!692 ((_ is ValueCellFull!221) mapValue!692)) b!16698))

(assert (= (and b!16702 ((_ is ValueCellFull!221) mapDefault!692)) b!16701))

(assert (= b!16697 b!16702))

(assert (= b!16700 b!16697))

(assert (= b!16699 b!16700))

(assert (= start!2930 b!16699))

(declare-fun m!11765 () Bool)

(assert (=> b!16697 m!11765))

(declare-fun m!11767 () Bool)

(assert (=> b!16697 m!11767))

(declare-fun m!11769 () Bool)

(assert (=> start!2930 m!11769))

(declare-fun m!11771 () Bool)

(assert (=> mapNonEmpty!692 m!11771))

(check-sat (not b!16697) tp_is_empty!841 b_and!1213 (not b_next!577) (not start!2930) (not mapNonEmpty!692))
(check-sat b_and!1213 (not b_next!577))
