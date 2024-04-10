; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15596 () Bool)

(assert start!15596)

(declare-fun b!155281 () Bool)

(declare-fun b_free!3263 () Bool)

(declare-fun b_next!3263 () Bool)

(assert (=> b!155281 (= b_free!3263 (not b_next!3263))))

(declare-fun tp!12313 () Bool)

(declare-fun b_and!9677 () Bool)

(assert (=> b!155281 (= tp!12313 b_and!9677)))

(declare-fun b!155274 () Bool)

(declare-fun e!101444 () Bool)

(declare-fun tp_is_empty!3065 () Bool)

(assert (=> b!155274 (= e!101444 tp_is_empty!3065)))

(declare-fun b!155275 () Bool)

(declare-fun res!73323 () Bool)

(declare-fun e!101440 () Bool)

(assert (=> b!155275 (=> (not res!73323) (not e!101440))))

(declare-datatypes ((V!3733 0))(
  ( (V!3734 (val!1577 Int)) )
))
(declare-datatypes ((ValueCell!1189 0))(
  ( (ValueCellFull!1189 (v!3442 V!3733)) (EmptyCell!1189) )
))
(declare-datatypes ((array!5183 0))(
  ( (array!5184 (arr!2449 (Array (_ BitVec 32) (_ BitVec 64))) (size!2727 (_ BitVec 32))) )
))
(declare-datatypes ((array!5185 0))(
  ( (array!5186 (arr!2450 (Array (_ BitVec 32) ValueCell!1189)) (size!2728 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1286 0))(
  ( (LongMapFixedSize!1287 (defaultEntry!3085 Int) (mask!7504 (_ BitVec 32)) (extraKeys!2826 (_ BitVec 32)) (zeroValue!2928 V!3733) (minValue!2928 V!3733) (_size!692 (_ BitVec 32)) (_keys!4860 array!5183) (_values!3068 array!5185) (_vacant!692 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1286)

(assert (=> b!155275 (= res!73323 (and (= (size!2728 (_values!3068 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7504 thiss!1248))) (= (size!2727 (_keys!4860 thiss!1248)) (size!2728 (_values!3068 thiss!1248))) (bvsge (mask!7504 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2826 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2826 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2826 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2826 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2826 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2826 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2826 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5240 () Bool)

(declare-fun mapRes!5240 () Bool)

(assert (=> mapIsEmpty!5240 mapRes!5240))

(declare-fun b!155276 () Bool)

(declare-fun e!101443 () Bool)

(assert (=> b!155276 (= e!101443 tp_is_empty!3065)))

(declare-fun b!155277 () Bool)

(assert (=> b!155277 (= e!101440 false)))

(declare-fun lt!81346 () Bool)

(declare-datatypes ((List!1820 0))(
  ( (Nil!1817) (Cons!1816 (h!2425 (_ BitVec 64)) (t!6622 List!1820)) )
))
(declare-fun arrayNoDuplicates!0 (array!5183 (_ BitVec 32) List!1820) Bool)

(assert (=> b!155277 (= lt!81346 (arrayNoDuplicates!0 (_keys!4860 thiss!1248) #b00000000000000000000000000000000 Nil!1817))))

(declare-fun res!73321 () Bool)

(assert (=> start!15596 (=> (not res!73321) (not e!101440))))

(declare-fun valid!632 (LongMapFixedSize!1286) Bool)

(assert (=> start!15596 (= res!73321 (valid!632 thiss!1248))))

(assert (=> start!15596 e!101440))

(declare-fun e!101445 () Bool)

(assert (=> start!15596 e!101445))

(assert (=> start!15596 true))

(declare-fun b!155278 () Bool)

(declare-fun res!73324 () Bool)

(assert (=> b!155278 (=> (not res!73324) (not e!101440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155278 (= res!73324 (validMask!0 (mask!7504 thiss!1248)))))

(declare-fun b!155279 () Bool)

(declare-fun e!101442 () Bool)

(assert (=> b!155279 (= e!101442 (and e!101444 mapRes!5240))))

(declare-fun condMapEmpty!5240 () Bool)

(declare-fun mapDefault!5240 () ValueCell!1189)

