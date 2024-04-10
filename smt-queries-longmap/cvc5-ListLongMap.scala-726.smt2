; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16948 () Bool)

(assert start!16948)

(declare-fun b!170381 () Bool)

(declare-fun b_free!4195 () Bool)

(declare-fun b_next!4195 () Bool)

(assert (=> b!170381 (= b_free!4195 (not b_next!4195))))

(declare-fun tp!15209 () Bool)

(declare-fun b_and!10609 () Bool)

(assert (=> b!170381 (= tp!15209 b_and!10609)))

(declare-fun b!170380 () Bool)

(declare-fun e!112413 () Bool)

(declare-fun tp_is_empty!3967 () Bool)

(assert (=> b!170380 (= e!112413 tp_is_empty!3967)))

(declare-fun e!112412 () Bool)

(declare-fun e!112414 () Bool)

(declare-datatypes ((V!4937 0))(
  ( (V!4938 (val!2028 Int)) )
))
(declare-datatypes ((ValueCell!1640 0))(
  ( (ValueCellFull!1640 (v!3893 V!4937)) (EmptyCell!1640) )
))
(declare-datatypes ((array!7043 0))(
  ( (array!7044 (arr!3351 (Array (_ BitVec 32) (_ BitVec 64))) (size!3644 (_ BitVec 32))) )
))
(declare-datatypes ((array!7045 0))(
  ( (array!7046 (arr!3352 (Array (_ BitVec 32) ValueCell!1640)) (size!3645 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2188 0))(
  ( (LongMapFixedSize!2189 (defaultEntry!3536 Int) (mask!8348 (_ BitVec 32)) (extraKeys!3277 (_ BitVec 32)) (zeroValue!3379 V!4937) (minValue!3379 V!4937) (_size!1143 (_ BitVec 32)) (_keys!5366 array!7043) (_values!3519 array!7045) (_vacant!1143 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2188)

(declare-fun array_inv!2143 (array!7043) Bool)

(declare-fun array_inv!2144 (array!7045) Bool)

(assert (=> b!170381 (= e!112412 (and tp!15209 tp_is_empty!3967 (array_inv!2143 (_keys!5366 thiss!1248)) (array_inv!2144 (_values!3519 thiss!1248)) e!112414))))

(declare-fun b!170382 () Bool)

(declare-fun res!80998 () Bool)

(declare-fun e!112416 () Bool)

(assert (=> b!170382 (=> (not res!80998) (not e!112416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170382 (= res!80998 (validMask!0 (mask!8348 thiss!1248)))))

(declare-fun b!170383 () Bool)

(declare-fun e!112411 () Bool)

(assert (=> b!170383 (= e!112411 tp_is_empty!3967)))

(declare-fun b!170384 () Bool)

(declare-fun mapRes!6737 () Bool)

(assert (=> b!170384 (= e!112414 (and e!112411 mapRes!6737))))

(declare-fun condMapEmpty!6737 () Bool)

(declare-fun mapDefault!6737 () ValueCell!1640)

