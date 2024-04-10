; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75706 () Bool)

(assert start!75706)

(declare-fun b!890113 () Bool)

(declare-fun b_free!15677 () Bool)

(declare-fun b_next!15677 () Bool)

(assert (=> b!890113 (= b_free!15677 (not b_next!15677))))

(declare-fun tp!55000 () Bool)

(declare-fun b_and!25917 () Bool)

(assert (=> b!890113 (= tp!55000 b_and!25917)))

(declare-fun b!890112 () Bool)

(declare-fun e!496340 () Bool)

(declare-fun tp_is_empty!18005 () Bool)

(assert (=> b!890112 (= e!496340 tp_is_empty!18005)))

(declare-datatypes ((array!51990 0))(
  ( (array!51991 (arr!25001 (Array (_ BitVec 32) (_ BitVec 64))) (size!25445 (_ BitVec 32))) )
))
(declare-datatypes ((V!28971 0))(
  ( (V!28972 (val!9053 Int)) )
))
(declare-datatypes ((ValueCell!8521 0))(
  ( (ValueCellFull!8521 (v!11531 V!28971)) (EmptyCell!8521) )
))
(declare-datatypes ((array!51992 0))(
  ( (array!51993 (arr!25002 (Array (_ BitVec 32) ValueCell!8521)) (size!25446 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4058 0))(
  ( (LongMapFixedSize!4059 (defaultEntry!5226 Int) (mask!25691 (_ BitVec 32)) (extraKeys!4920 (_ BitVec 32)) (zeroValue!5024 V!28971) (minValue!5024 V!28971) (_size!2084 (_ BitVec 32)) (_keys!9909 array!51990) (_values!5211 array!51992) (_vacant!2084 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4058)

(declare-fun e!496339 () Bool)

(declare-fun e!496341 () Bool)

(declare-fun array_inv!19660 (array!51990) Bool)

(declare-fun array_inv!19661 (array!51992) Bool)

(assert (=> b!890113 (= e!496341 (and tp!55000 tp_is_empty!18005 (array_inv!19660 (_keys!9909 thiss!1181)) (array_inv!19661 (_values!5211 thiss!1181)) e!496339))))

(declare-fun mapNonEmpty!28562 () Bool)

(declare-fun mapRes!28562 () Bool)

(declare-fun tp!54999 () Bool)

(declare-fun e!496336 () Bool)

(assert (=> mapNonEmpty!28562 (= mapRes!28562 (and tp!54999 e!496336))))

(declare-fun mapRest!28562 () (Array (_ BitVec 32) ValueCell!8521))

(declare-fun mapValue!28562 () ValueCell!8521)

(declare-fun mapKey!28562 () (_ BitVec 32))

(assert (=> mapNonEmpty!28562 (= (arr!25002 (_values!5211 thiss!1181)) (store mapRest!28562 mapKey!28562 mapValue!28562))))

(declare-fun b!890114 () Bool)

(assert (=> b!890114 (= e!496339 (and e!496340 mapRes!28562))))

(declare-fun condMapEmpty!28562 () Bool)

(declare-fun mapDefault!28562 () ValueCell!8521)

