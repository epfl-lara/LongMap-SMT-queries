; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16960 () Bool)

(assert start!16960)

(declare-fun b!170510 () Bool)

(declare-fun b_free!4207 () Bool)

(declare-fun b_next!4207 () Bool)

(assert (=> b!170510 (= b_free!4207 (not b_next!4207))))

(declare-fun tp!15244 () Bool)

(declare-fun b_and!10621 () Bool)

(assert (=> b!170510 (= tp!15244 b_and!10621)))

(declare-fun mapNonEmpty!6755 () Bool)

(declare-fun mapRes!6755 () Bool)

(declare-fun tp!15245 () Bool)

(declare-fun e!112519 () Bool)

(assert (=> mapNonEmpty!6755 (= mapRes!6755 (and tp!15245 e!112519))))

(declare-datatypes ((V!4953 0))(
  ( (V!4954 (val!2034 Int)) )
))
(declare-datatypes ((ValueCell!1646 0))(
  ( (ValueCellFull!1646 (v!3899 V!4953)) (EmptyCell!1646) )
))
(declare-fun mapValue!6755 () ValueCell!1646)

(declare-datatypes ((array!7067 0))(
  ( (array!7068 (arr!3363 (Array (_ BitVec 32) (_ BitVec 64))) (size!3656 (_ BitVec 32))) )
))
(declare-datatypes ((array!7069 0))(
  ( (array!7070 (arr!3364 (Array (_ BitVec 32) ValueCell!1646)) (size!3657 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2200 0))(
  ( (LongMapFixedSize!2201 (defaultEntry!3542 Int) (mask!8358 (_ BitVec 32)) (extraKeys!3283 (_ BitVec 32)) (zeroValue!3385 V!4953) (minValue!3385 V!4953) (_size!1149 (_ BitVec 32)) (_keys!5372 array!7067) (_values!3525 array!7069) (_vacant!1149 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2200)

(declare-fun mapKey!6755 () (_ BitVec 32))

(declare-fun mapRest!6755 () (Array (_ BitVec 32) ValueCell!1646))

(assert (=> mapNonEmpty!6755 (= (arr!3364 (_values!3525 thiss!1248)) (store mapRest!6755 mapKey!6755 mapValue!6755))))

(declare-fun b!170506 () Bool)

(declare-fun tp_is_empty!3979 () Bool)

(assert (=> b!170506 (= e!112519 tp_is_empty!3979)))

(declare-fun b!170507 () Bool)

(declare-fun e!112520 () Bool)

(declare-fun e!112524 () Bool)

(assert (=> b!170507 (= e!112520 (and e!112524 mapRes!6755))))

(declare-fun condMapEmpty!6755 () Bool)

(declare-fun mapDefault!6755 () ValueCell!1646)

