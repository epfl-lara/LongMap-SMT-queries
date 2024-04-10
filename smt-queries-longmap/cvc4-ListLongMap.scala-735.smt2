; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17150 () Bool)

(assert start!17150)

(declare-fun b!172354 () Bool)

(declare-fun b_free!4253 () Bool)

(declare-fun b_next!4253 () Bool)

(assert (=> b!172354 (= b_free!4253 (not b_next!4253))))

(declare-fun tp!15402 () Bool)

(declare-fun b_and!10693 () Bool)

(assert (=> b!172354 (= tp!15402 b_and!10693)))

(declare-fun b!172348 () Bool)

(declare-fun e!113767 () Bool)

(declare-datatypes ((V!5013 0))(
  ( (V!5014 (val!2057 Int)) )
))
(declare-datatypes ((ValueCell!1669 0))(
  ( (ValueCellFull!1669 (v!3925 V!5013)) (EmptyCell!1669) )
))
(declare-datatypes ((array!7169 0))(
  ( (array!7170 (arr!3409 (Array (_ BitVec 32) (_ BitVec 64))) (size!3705 (_ BitVec 32))) )
))
(declare-datatypes ((array!7171 0))(
  ( (array!7172 (arr!3410 (Array (_ BitVec 32) ValueCell!1669)) (size!3706 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2246 0))(
  ( (LongMapFixedSize!2247 (defaultEntry!3569 Int) (mask!8410 (_ BitVec 32)) (extraKeys!3308 (_ BitVec 32)) (zeroValue!3410 V!5013) (minValue!3412 V!5013) (_size!1172 (_ BitVec 32)) (_keys!5405 array!7169) (_values!3552 array!7171) (_vacant!1172 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2246)

(assert (=> b!172348 (= e!113767 (and (= (size!3706 (_values!3552 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8410 thiss!1248))) (not (= (size!3705 (_keys!5405 thiss!1248)) (size!3706 (_values!3552 thiss!1248))))))))

(declare-fun b!172349 () Bool)

(declare-fun e!113765 () Bool)

(declare-fun tp_is_empty!4025 () Bool)

(assert (=> b!172349 (= e!113765 tp_is_empty!4025)))

(declare-fun res!81835 () Bool)

(assert (=> start!17150 (=> (not res!81835) (not e!113767))))

(declare-fun valid!954 (LongMapFixedSize!2246) Bool)

(assert (=> start!17150 (= res!81835 (valid!954 thiss!1248))))

(assert (=> start!17150 e!113767))

(declare-fun e!113766 () Bool)

(assert (=> start!17150 e!113766))

(assert (=> start!17150 true))

(declare-fun b!172350 () Bool)

(declare-fun e!113768 () Bool)

(declare-fun mapRes!6843 () Bool)

(assert (=> b!172350 (= e!113768 (and e!113765 mapRes!6843))))

(declare-fun condMapEmpty!6843 () Bool)

(declare-fun mapDefault!6843 () ValueCell!1669)

