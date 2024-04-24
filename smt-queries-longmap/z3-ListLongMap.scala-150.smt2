; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2936 () Bool)

(assert start!2936)

(declare-fun b!16712 () Bool)

(declare-fun b_free!577 () Bool)

(declare-fun b_next!577 () Bool)

(assert (=> b!16712 (= b_free!577 (not b_next!577))))

(declare-fun tp!2918 () Bool)

(declare-fun b_and!1213 () Bool)

(assert (=> b!16712 (= tp!2918 b_and!1213)))

(declare-fun mapIsEmpty!692 () Bool)

(declare-fun mapRes!692 () Bool)

(assert (=> mapIsEmpty!692 mapRes!692))

(declare-fun b!16707 () Bool)

(declare-fun e!10359 () Bool)

(declare-fun tp_is_empty!841 () Bool)

(assert (=> b!16707 (= e!10359 tp_is_empty!841)))

(declare-fun b!16708 () Bool)

(declare-fun e!10361 () Bool)

(assert (=> b!16708 (= e!10361 (and e!10359 mapRes!692))))

(declare-fun condMapEmpty!692 () Bool)

(declare-datatypes ((V!947 0))(
  ( (V!948 (val!447 Int)) )
))
(declare-datatypes ((ValueCell!221 0))(
  ( (ValueCellFull!221 (v!1394 V!947)) (EmptyCell!221) )
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
  ( (Cell!29 (v!1395 LongMapFixedSize!28)) )
))
(declare-datatypes ((LongMap!28 0))(
  ( (LongMap!29 (underlying!25 Cell!28)) )
))
(declare-fun thiss!848 () LongMap!28)

(declare-fun mapDefault!692 () ValueCell!221)

(assert (=> b!16708 (= condMapEmpty!692 (= (arr!416 (_values!1622 (v!1395 (underlying!25 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!221)) mapDefault!692)))))

(declare-fun b!16709 () Bool)

(declare-fun e!10362 () Bool)

(assert (=> b!16709 (= e!10362 tp_is_empty!841)))

(declare-fun b!16710 () Bool)

(declare-fun e!10358 () Bool)

(declare-fun e!10363 () Bool)

(assert (=> b!16710 (= e!10358 e!10363)))

(declare-fun lt!4132 () Bool)

(declare-fun valid!22 (LongMap!28) Bool)

(assert (=> start!2936 (= lt!4132 (valid!22 thiss!848))))

(assert (=> start!2936 false))

(declare-fun e!10360 () Bool)

(assert (=> start!2936 e!10360))

(declare-fun b!16711 () Bool)

(assert (=> b!16711 (= e!10360 e!10358)))

(declare-fun mapNonEmpty!692 () Bool)

(declare-fun tp!2917 () Bool)

(assert (=> mapNonEmpty!692 (= mapRes!692 (and tp!2917 e!10362))))

(declare-fun mapKey!692 () (_ BitVec 32))

(declare-fun mapValue!692 () ValueCell!221)

(declare-fun mapRest!692 () (Array (_ BitVec 32) ValueCell!221))

(assert (=> mapNonEmpty!692 (= (arr!416 (_values!1622 (v!1395 (underlying!25 thiss!848)))) (store mapRest!692 mapKey!692 mapValue!692))))

(declare-fun array_inv!305 (array!869) Bool)

(declare-fun array_inv!306 (array!867) Bool)

(assert (=> b!16712 (= e!10363 (and tp!2918 tp_is_empty!841 (array_inv!305 (_keys!3049 (v!1395 (underlying!25 thiss!848)))) (array_inv!306 (_values!1622 (v!1395 (underlying!25 thiss!848)))) e!10361))))

(assert (= (and b!16708 condMapEmpty!692) mapIsEmpty!692))

(assert (= (and b!16708 (not condMapEmpty!692)) mapNonEmpty!692))

(get-info :version)

(assert (= (and mapNonEmpty!692 ((_ is ValueCellFull!221) mapValue!692)) b!16709))

(assert (= (and b!16708 ((_ is ValueCellFull!221) mapDefault!692)) b!16707))

(assert (= b!16712 b!16708))

(assert (= b!16710 b!16712))

(assert (= b!16711 b!16710))

(assert (= start!2936 b!16711))

(declare-fun m!11779 () Bool)

(assert (=> start!2936 m!11779))

(declare-fun m!11781 () Bool)

(assert (=> mapNonEmpty!692 m!11781))

(declare-fun m!11783 () Bool)

(assert (=> b!16712 m!11783))

(declare-fun m!11785 () Bool)

(assert (=> b!16712 m!11785))

(check-sat b_and!1213 (not mapNonEmpty!692) tp_is_empty!841 (not b!16712) (not start!2936) (not b_next!577))
(check-sat b_and!1213 (not b_next!577))
