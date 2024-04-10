; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16156 () Bool)

(assert start!16156)

(declare-fun b!160983 () Bool)

(declare-fun b_free!3617 () Bool)

(declare-fun b_next!3617 () Bool)

(assert (=> b!160983 (= b_free!3617 (not b_next!3617))))

(declare-fun tp!13421 () Bool)

(declare-fun b_and!10031 () Bool)

(assert (=> b!160983 (= tp!13421 b_and!10031)))

(declare-fun b!160980 () Bool)

(declare-fun res!76312 () Bool)

(declare-fun e!105202 () Bool)

(assert (=> b!160980 (=> (not res!76312) (not e!105202))))

(declare-datatypes ((V!4205 0))(
  ( (V!4206 (val!1754 Int)) )
))
(declare-datatypes ((ValueCell!1366 0))(
  ( (ValueCellFull!1366 (v!3619 V!4205)) (EmptyCell!1366) )
))
(declare-datatypes ((array!5917 0))(
  ( (array!5918 (arr!2803 (Array (_ BitVec 32) (_ BitVec 64))) (size!3087 (_ BitVec 32))) )
))
(declare-datatypes ((array!5919 0))(
  ( (array!5920 (arr!2804 (Array (_ BitVec 32) ValueCell!1366)) (size!3088 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1640 0))(
  ( (LongMapFixedSize!1641 (defaultEntry!3262 Int) (mask!7842 (_ BitVec 32)) (extraKeys!3003 (_ BitVec 32)) (zeroValue!3105 V!4205) (minValue!3105 V!4205) (_size!869 (_ BitVec 32)) (_keys!5063 array!5917) (_values!3245 array!5919) (_vacant!869 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1640)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5917 (_ BitVec 32)) Bool)

(assert (=> b!160980 (= res!76312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5063 thiss!1248) (mask!7842 thiss!1248)))))

(declare-fun b!160981 () Bool)

(declare-fun res!76314 () Bool)

(assert (=> b!160981 (=> (not res!76314) (not e!105202))))

(assert (=> b!160981 (= res!76314 (and (= (size!3088 (_values!3245 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7842 thiss!1248))) (= (size!3087 (_keys!5063 thiss!1248)) (size!3088 (_values!3245 thiss!1248))) (bvsge (mask!7842 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3003 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3003 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!76311 () Bool)

(assert (=> start!16156 (=> (not res!76311) (not e!105202))))

(declare-fun valid!756 (LongMapFixedSize!1640) Bool)

(assert (=> start!16156 (= res!76311 (valid!756 thiss!1248))))

(assert (=> start!16156 e!105202))

(declare-fun e!105199 () Bool)

(assert (=> start!16156 e!105199))

(assert (=> start!16156 true))

(declare-fun b!160982 () Bool)

(declare-fun e!105201 () Bool)

(declare-fun e!105203 () Bool)

(declare-fun mapRes!5816 () Bool)

(assert (=> b!160982 (= e!105201 (and e!105203 mapRes!5816))))

(declare-fun condMapEmpty!5816 () Bool)

(declare-fun mapDefault!5816 () ValueCell!1366)

