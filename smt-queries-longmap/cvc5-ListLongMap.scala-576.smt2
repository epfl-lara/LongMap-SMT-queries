; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15598 () Bool)

(assert start!15598)

(declare-fun b!155307 () Bool)

(declare-fun b_free!3265 () Bool)

(declare-fun b_next!3265 () Bool)

(assert (=> b!155307 (= b_free!3265 (not b_next!3265))))

(declare-fun tp!12320 () Bool)

(declare-fun b_and!9679 () Bool)

(assert (=> b!155307 (= tp!12320 b_and!9679)))

(declare-fun res!73338 () Bool)

(declare-fun e!101463 () Bool)

(assert (=> start!15598 (=> (not res!73338) (not e!101463))))

(declare-datatypes ((V!3737 0))(
  ( (V!3738 (val!1578 Int)) )
))
(declare-datatypes ((ValueCell!1190 0))(
  ( (ValueCellFull!1190 (v!3443 V!3737)) (EmptyCell!1190) )
))
(declare-datatypes ((array!5187 0))(
  ( (array!5188 (arr!2451 (Array (_ BitVec 32) (_ BitVec 64))) (size!2729 (_ BitVec 32))) )
))
(declare-datatypes ((array!5189 0))(
  ( (array!5190 (arr!2452 (Array (_ BitVec 32) ValueCell!1190)) (size!2730 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1288 0))(
  ( (LongMapFixedSize!1289 (defaultEntry!3086 Int) (mask!7507 (_ BitVec 32)) (extraKeys!2827 (_ BitVec 32)) (zeroValue!2929 V!3737) (minValue!2929 V!3737) (_size!693 (_ BitVec 32)) (_keys!4861 array!5187) (_values!3069 array!5189) (_vacant!693 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1288)

(declare-fun valid!633 (LongMapFixedSize!1288) Bool)

(assert (=> start!15598 (= res!73338 (valid!633 thiss!1248))))

(assert (=> start!15598 e!101463))

(declare-fun e!101461 () Bool)

(assert (=> start!15598 e!101461))

(assert (=> start!15598 true))

(declare-fun b!155301 () Bool)

(declare-fun res!73335 () Bool)

(assert (=> b!155301 (=> (not res!73335) (not e!101463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155301 (= res!73335 (validMask!0 (mask!7507 thiss!1248)))))

(declare-fun b!155302 () Bool)

(assert (=> b!155302 (= e!101463 false)))

(declare-fun lt!81349 () Bool)

(declare-datatypes ((List!1821 0))(
  ( (Nil!1818) (Cons!1817 (h!2426 (_ BitVec 64)) (t!6623 List!1821)) )
))
(declare-fun arrayNoDuplicates!0 (array!5187 (_ BitVec 32) List!1821) Bool)

(assert (=> b!155302 (= lt!81349 (arrayNoDuplicates!0 (_keys!4861 thiss!1248) #b00000000000000000000000000000000 Nil!1818))))

(declare-fun b!155303 () Bool)

(declare-fun res!73337 () Bool)

(assert (=> b!155303 (=> (not res!73337) (not e!101463))))

(assert (=> b!155303 (= res!73337 (and (= (size!2730 (_values!3069 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7507 thiss!1248))) (= (size!2729 (_keys!4861 thiss!1248)) (size!2730 (_values!3069 thiss!1248))) (bvsge (mask!7507 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2827 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2827 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2827 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5243 () Bool)

(declare-fun mapRes!5243 () Bool)

(assert (=> mapIsEmpty!5243 mapRes!5243))

(declare-fun b!155304 () Bool)

(declare-fun e!101462 () Bool)

(declare-fun e!101458 () Bool)

(assert (=> b!155304 (= e!101462 (and e!101458 mapRes!5243))))

(declare-fun condMapEmpty!5243 () Bool)

(declare-fun mapDefault!5243 () ValueCell!1190)

