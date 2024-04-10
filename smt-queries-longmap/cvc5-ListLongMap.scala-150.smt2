; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2940 () Bool)

(assert start!2940)

(declare-fun b!16751 () Bool)

(declare-fun b_free!577 () Bool)

(declare-fun b_next!577 () Bool)

(assert (=> b!16751 (= b_free!577 (not b_next!577))))

(declare-fun tp!2917 () Bool)

(declare-fun b_and!1219 () Bool)

(assert (=> b!16751 (= tp!2917 b_and!1219)))

(declare-fun mapNonEmpty!692 () Bool)

(declare-fun mapRes!692 () Bool)

(declare-fun tp!2918 () Bool)

(declare-fun e!10391 () Bool)

(assert (=> mapNonEmpty!692 (= mapRes!692 (and tp!2918 e!10391))))

(declare-datatypes ((V!947 0))(
  ( (V!948 (val!447 Int)) )
))
(declare-datatypes ((ValueCell!221 0))(
  ( (ValueCellFull!221 (v!1394 V!947)) (EmptyCell!221) )
))
(declare-fun mapValue!692 () ValueCell!221)

(declare-fun mapKey!692 () (_ BitVec 32))

(declare-datatypes ((array!885 0))(
  ( (array!886 (arr!425 (Array (_ BitVec 32) ValueCell!221)) (size!514 (_ BitVec 32))) )
))
(declare-datatypes ((array!887 0))(
  ( (array!888 (arr!426 (Array (_ BitVec 32) (_ BitVec 64))) (size!515 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!28 0))(
  ( (LongMapFixedSize!29 (defaultEntry!1624 Int) (mask!4532 (_ BitVec 32)) (extraKeys!1538 (_ BitVec 32)) (zeroValue!1561 V!947) (minValue!1561 V!947) (_size!45 (_ BitVec 32)) (_keys!3049 array!887) (_values!1622 array!885) (_vacant!45 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!28 0))(
  ( (Cell!29 (v!1395 LongMapFixedSize!28)) )
))
(declare-datatypes ((LongMap!28 0))(
  ( (LongMap!29 (underlying!25 Cell!28)) )
))
(declare-fun thiss!848 () LongMap!28)

(declare-fun mapRest!692 () (Array (_ BitVec 32) ValueCell!221))

(assert (=> mapNonEmpty!692 (= (arr!425 (_values!1622 (v!1395 (underlying!25 thiss!848)))) (store mapRest!692 mapKey!692 mapValue!692))))

(declare-fun b!16749 () Bool)

(declare-fun tp_is_empty!841 () Bool)

(assert (=> b!16749 (= e!10391 tp_is_empty!841)))

(declare-fun b!16750 () Bool)

(declare-fun e!10390 () Bool)

(declare-fun e!10393 () Bool)

(assert (=> b!16750 (= e!10390 e!10393)))

(declare-fun e!10394 () Bool)

(declare-fun e!10395 () Bool)

(declare-fun array_inv!301 (array!887) Bool)

(declare-fun array_inv!302 (array!885) Bool)

(assert (=> b!16751 (= e!10394 (and tp!2917 tp_is_empty!841 (array_inv!301 (_keys!3049 (v!1395 (underlying!25 thiss!848)))) (array_inv!302 (_values!1622 (v!1395 (underlying!25 thiss!848)))) e!10395))))

(declare-fun b!16752 () Bool)

(declare-fun e!10392 () Bool)

(assert (=> b!16752 (= e!10395 (and e!10392 mapRes!692))))

(declare-fun condMapEmpty!692 () Bool)

(declare-fun mapDefault!692 () ValueCell!221)

