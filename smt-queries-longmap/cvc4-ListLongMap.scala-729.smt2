; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16970 () Bool)

(assert start!16970)

(declare-fun b!170615 () Bool)

(declare-fun b_free!4217 () Bool)

(declare-fun b_next!4217 () Bool)

(assert (=> b!170615 (= b_free!4217 (not b_next!4217))))

(declare-fun tp!15275 () Bool)

(declare-fun b_and!10631 () Bool)

(assert (=> b!170615 (= tp!15275 b_and!10631)))

(declare-fun res!81097 () Bool)

(declare-fun e!112613 () Bool)

(assert (=> start!16970 (=> (not res!81097) (not e!112613))))

(declare-datatypes ((V!4965 0))(
  ( (V!4966 (val!2039 Int)) )
))
(declare-datatypes ((ValueCell!1651 0))(
  ( (ValueCellFull!1651 (v!3904 V!4965)) (EmptyCell!1651) )
))
(declare-datatypes ((array!7087 0))(
  ( (array!7088 (arr!3373 (Array (_ BitVec 32) (_ BitVec 64))) (size!3666 (_ BitVec 32))) )
))
(declare-datatypes ((array!7089 0))(
  ( (array!7090 (arr!3374 (Array (_ BitVec 32) ValueCell!1651)) (size!3667 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2210 0))(
  ( (LongMapFixedSize!2211 (defaultEntry!3547 Int) (mask!8365 (_ BitVec 32)) (extraKeys!3288 (_ BitVec 32)) (zeroValue!3390 V!4965) (minValue!3390 V!4965) (_size!1154 (_ BitVec 32)) (_keys!5377 array!7087) (_values!3530 array!7089) (_vacant!1154 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2210)

(declare-fun valid!942 (LongMapFixedSize!2210) Bool)

(assert (=> start!16970 (= res!81097 (valid!942 thiss!1248))))

(assert (=> start!16970 e!112613))

(declare-fun e!112609 () Bool)

(assert (=> start!16970 e!112609))

(assert (=> start!16970 true))

(declare-fun mapNonEmpty!6770 () Bool)

(declare-fun mapRes!6770 () Bool)

(declare-fun tp!15274 () Bool)

(declare-fun e!112614 () Bool)

(assert (=> mapNonEmpty!6770 (= mapRes!6770 (and tp!15274 e!112614))))

(declare-fun mapValue!6770 () ValueCell!1651)

(declare-fun mapRest!6770 () (Array (_ BitVec 32) ValueCell!1651))

(declare-fun mapKey!6770 () (_ BitVec 32))

(assert (=> mapNonEmpty!6770 (= (arr!3374 (_values!3530 thiss!1248)) (store mapRest!6770 mapKey!6770 mapValue!6770))))

(declare-fun b!170611 () Bool)

(declare-fun e!112611 () Bool)

(declare-fun tp_is_empty!3989 () Bool)

(assert (=> b!170611 (= e!112611 tp_is_empty!3989)))

(declare-fun mapIsEmpty!6770 () Bool)

(assert (=> mapIsEmpty!6770 mapRes!6770))

(declare-fun b!170612 () Bool)

(declare-fun e!112610 () Bool)

(assert (=> b!170612 (= e!112610 (and e!112611 mapRes!6770))))

(declare-fun condMapEmpty!6770 () Bool)

(declare-fun mapDefault!6770 () ValueCell!1651)

