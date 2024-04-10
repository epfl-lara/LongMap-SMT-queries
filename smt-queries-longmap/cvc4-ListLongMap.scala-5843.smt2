; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75492 () Bool)

(assert start!75492)

(declare-fun b!888352 () Bool)

(declare-fun b_free!15563 () Bool)

(declare-fun b_next!15563 () Bool)

(assert (=> b!888352 (= b_free!15563 (not b_next!15563))))

(declare-fun tp!54639 () Bool)

(declare-fun b_and!25801 () Bool)

(assert (=> b!888352 (= tp!54639 b_and!25801)))

(declare-fun mapNonEmpty!28373 () Bool)

(declare-fun mapRes!28373 () Bool)

(declare-fun tp!54640 () Bool)

(declare-fun e!494965 () Bool)

(assert (=> mapNonEmpty!28373 (= mapRes!28373 (and tp!54640 e!494965))))

(declare-datatypes ((V!28819 0))(
  ( (V!28820 (val!8996 Int)) )
))
(declare-datatypes ((ValueCell!8464 0))(
  ( (ValueCellFull!8464 (v!11469 V!28819)) (EmptyCell!8464) )
))
(declare-fun mapValue!28373 () ValueCell!8464)

(declare-datatypes ((array!51752 0))(
  ( (array!51753 (arr!24887 (Array (_ BitVec 32) (_ BitVec 64))) (size!25328 (_ BitVec 32))) )
))
(declare-datatypes ((array!51754 0))(
  ( (array!51755 (arr!24888 (Array (_ BitVec 32) ValueCell!8464)) (size!25329 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3944 0))(
  ( (LongMapFixedSize!3945 (defaultEntry!5166 Int) (mask!25584 (_ BitVec 32)) (extraKeys!4860 (_ BitVec 32)) (zeroValue!4964 V!28819) (minValue!4964 V!28819) (_size!2027 (_ BitVec 32)) (_keys!9845 array!51752) (_values!5151 array!51754) (_vacant!2027 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3944)

(declare-fun mapRest!28373 () (Array (_ BitVec 32) ValueCell!8464))

(declare-fun mapKey!28373 () (_ BitVec 32))

(assert (=> mapNonEmpty!28373 (= (arr!24888 (_values!5151 thiss!1181)) (store mapRest!28373 mapKey!28373 mapValue!28373))))

(declare-fun mapIsEmpty!28373 () Bool)

(assert (=> mapIsEmpty!28373 mapRes!28373))

(declare-fun b!888349 () Bool)

(declare-fun e!494963 () Bool)

(declare-fun tp_is_empty!17891 () Bool)

(assert (=> b!888349 (= e!494963 tp_is_empty!17891)))

(declare-fun b!888350 () Bool)

(declare-fun e!494962 () Bool)

(assert (=> b!888350 (= e!494962 (and e!494963 mapRes!28373))))

(declare-fun condMapEmpty!28373 () Bool)

(declare-fun mapDefault!28373 () ValueCell!8464)

