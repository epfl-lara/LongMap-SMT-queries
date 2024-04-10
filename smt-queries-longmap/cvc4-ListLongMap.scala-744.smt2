; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17270 () Bool)

(assert start!17270)

(declare-fun b!173197 () Bool)

(declare-fun b_free!4307 () Bool)

(declare-fun b_next!4307 () Bool)

(assert (=> b!173197 (= b_free!4307 (not b_next!4307))))

(declare-fun tp!15582 () Bool)

(declare-fun b_and!10747 () Bool)

(assert (=> b!173197 (= tp!15582 b_and!10747)))

(declare-fun b!173196 () Bool)

(declare-fun res!82237 () Bool)

(declare-fun e!114403 () Bool)

(assert (=> b!173196 (=> (not res!82237) (not e!114403))))

(declare-datatypes ((V!5085 0))(
  ( (V!5086 (val!2084 Int)) )
))
(declare-datatypes ((ValueCell!1696 0))(
  ( (ValueCellFull!1696 (v!3952 V!5085)) (EmptyCell!1696) )
))
(declare-datatypes ((array!7287 0))(
  ( (array!7288 (arr!3463 (Array (_ BitVec 32) (_ BitVec 64))) (size!3762 (_ BitVec 32))) )
))
(declare-datatypes ((array!7289 0))(
  ( (array!7290 (arr!3464 (Array (_ BitVec 32) ValueCell!1696)) (size!3763 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2300 0))(
  ( (LongMapFixedSize!2301 (defaultEntry!3596 Int) (mask!8464 (_ BitVec 32)) (extraKeys!3335 (_ BitVec 32)) (zeroValue!3437 V!5085) (minValue!3439 V!5085) (_size!1199 (_ BitVec 32)) (_keys!5436 array!7287) (_values!3579 array!7289) (_vacant!1199 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2300)

(assert (=> b!173196 (= res!82237 (and (= (size!3763 (_values!3579 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8464 thiss!1248))) (= (size!3762 (_keys!5436 thiss!1248)) (size!3763 (_values!3579 thiss!1248))) (bvsge (mask!8464 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3335 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3335 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3335 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3335 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3335 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3335 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!3335 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!114401 () Bool)

(declare-fun e!114400 () Bool)

(declare-fun tp_is_empty!4079 () Bool)

(declare-fun array_inv!2217 (array!7287) Bool)

(declare-fun array_inv!2218 (array!7289) Bool)

(assert (=> b!173197 (= e!114401 (and tp!15582 tp_is_empty!4079 (array_inv!2217 (_keys!5436 thiss!1248)) (array_inv!2218 (_values!3579 thiss!1248)) e!114400))))

(declare-fun b!173198 () Bool)

(declare-fun e!114404 () Bool)

(assert (=> b!173198 (= e!114404 tp_is_empty!4079)))

(declare-fun res!82236 () Bool)

(assert (=> start!17270 (=> (not res!82236) (not e!114403))))

(declare-fun valid!972 (LongMapFixedSize!2300) Bool)

(assert (=> start!17270 (= res!82236 (valid!972 thiss!1248))))

(assert (=> start!17270 e!114403))

(assert (=> start!17270 e!114401))

(assert (=> start!17270 true))

(declare-fun b!173199 () Bool)

(declare-fun res!82238 () Bool)

(assert (=> b!173199 (=> (not res!82238) (not e!114403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7287 (_ BitVec 32)) Bool)

(assert (=> b!173199 (= res!82238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5436 thiss!1248) (mask!8464 thiss!1248)))))

(declare-fun b!173200 () Bool)

(declare-fun e!114402 () Bool)

(declare-fun mapRes!6942 () Bool)

(assert (=> b!173200 (= e!114400 (and e!114402 mapRes!6942))))

(declare-fun condMapEmpty!6942 () Bool)

(declare-fun mapDefault!6942 () ValueCell!1696)

