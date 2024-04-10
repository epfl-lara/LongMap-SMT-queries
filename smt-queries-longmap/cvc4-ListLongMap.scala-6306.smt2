; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80772 () Bool)

(assert start!80772)

(declare-fun b!947070 () Bool)

(declare-fun b_free!18161 () Bool)

(declare-fun b_next!18161 () Bool)

(assert (=> b!947070 (= b_free!18161 (not b_next!18161))))

(declare-fun tp!63035 () Bool)

(declare-fun b_and!29583 () Bool)

(assert (=> b!947070 (= tp!63035 b_and!29583)))

(declare-fun b!947064 () Bool)

(declare-fun e!532994 () Bool)

(declare-fun tp_is_empty!20669 () Bool)

(assert (=> b!947064 (= e!532994 tp_is_empty!20669)))

(declare-fun b!947065 () Bool)

(declare-fun e!532991 () Bool)

(assert (=> b!947065 (= e!532991 tp_is_empty!20669)))

(declare-fun mapIsEmpty!32872 () Bool)

(declare-fun mapRes!32872 () Bool)

(assert (=> mapIsEmpty!32872 mapRes!32872))

(declare-fun b!947066 () Bool)

(declare-fun e!532988 () Bool)

(assert (=> b!947066 (= e!532988 (and e!532991 mapRes!32872))))

(declare-fun condMapEmpty!32872 () Bool)

(declare-datatypes ((V!32523 0))(
  ( (V!32524 (val!10385 Int)) )
))
(declare-datatypes ((ValueCell!9853 0))(
  ( (ValueCellFull!9853 (v!12919 V!32523)) (EmptyCell!9853) )
))
(declare-datatypes ((array!57330 0))(
  ( (array!57331 (arr!27578 (Array (_ BitVec 32) ValueCell!9853)) (size!28051 (_ BitVec 32))) )
))
(declare-datatypes ((array!57332 0))(
  ( (array!57333 (arr!27579 (Array (_ BitVec 32) (_ BitVec 64))) (size!28052 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4856 0))(
  ( (LongMapFixedSize!4857 (defaultEntry!5725 Int) (mask!27450 (_ BitVec 32)) (extraKeys!5457 (_ BitVec 32)) (zeroValue!5561 V!32523) (minValue!5561 V!32523) (_size!2483 (_ BitVec 32)) (_keys!10630 array!57332) (_values!5748 array!57330) (_vacant!2483 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4856)

(declare-fun mapDefault!32872 () ValueCell!9853)

