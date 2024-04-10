; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75756 () Bool)

(assert start!75756)

(declare-fun b!890868 () Bool)

(declare-fun b_free!15727 () Bool)

(declare-fun b_next!15727 () Bool)

(assert (=> b!890868 (= b_free!15727 (not b_next!15727))))

(declare-fun tp!55150 () Bool)

(declare-fun b_and!25967 () Bool)

(assert (=> b!890868 (= tp!55150 b_and!25967)))

(declare-fun mapNonEmpty!28637 () Bool)

(declare-fun mapRes!28637 () Bool)

(declare-fun tp!55149 () Bool)

(declare-fun e!496974 () Bool)

(assert (=> mapNonEmpty!28637 (= mapRes!28637 (and tp!55149 e!496974))))

(declare-datatypes ((array!52090 0))(
  ( (array!52091 (arr!25051 (Array (_ BitVec 32) (_ BitVec 64))) (size!25495 (_ BitVec 32))) )
))
(declare-datatypes ((V!29039 0))(
  ( (V!29040 (val!9078 Int)) )
))
(declare-datatypes ((ValueCell!8546 0))(
  ( (ValueCellFull!8546 (v!11556 V!29039)) (EmptyCell!8546) )
))
(declare-datatypes ((array!52092 0))(
  ( (array!52093 (arr!25052 (Array (_ BitVec 32) ValueCell!8546)) (size!25496 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4108 0))(
  ( (LongMapFixedSize!4109 (defaultEntry!5251 Int) (mask!25734 (_ BitVec 32)) (extraKeys!4945 (_ BitVec 32)) (zeroValue!5049 V!29039) (minValue!5049 V!29039) (_size!2109 (_ BitVec 32)) (_keys!9934 array!52090) (_values!5236 array!52092) (_vacant!2109 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4108)

(declare-fun mapKey!28637 () (_ BitVec 32))

(declare-fun mapValue!28637 () ValueCell!8546)

(declare-fun mapRest!28637 () (Array (_ BitVec 32) ValueCell!8546))

(assert (=> mapNonEmpty!28637 (= (arr!25052 (_values!5236 thiss!1181)) (store mapRest!28637 mapKey!28637 mapValue!28637))))

(declare-fun b!890861 () Bool)

(declare-fun tp_is_empty!18055 () Bool)

(assert (=> b!890861 (= e!496974 tp_is_empty!18055)))

(declare-fun b!890862 () Bool)

(declare-fun res!603596 () Bool)

(declare-fun e!496976 () Bool)

(assert (=> b!890862 (=> res!603596 e!496976)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52090 (_ BitVec 32)) Bool)

(assert (=> b!890862 (= res!603596 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9934 thiss!1181) (mask!25734 thiss!1181))))))

(declare-fun b!890863 () Bool)

(declare-fun e!496980 () Bool)

(declare-fun e!496979 () Bool)

(assert (=> b!890863 (= e!496980 (and e!496979 mapRes!28637))))

(declare-fun condMapEmpty!28637 () Bool)

(declare-fun mapDefault!28637 () ValueCell!8546)

