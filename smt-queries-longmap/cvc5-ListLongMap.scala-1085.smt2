; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22192 () Bool)

(assert start!22192)

(declare-fun b!232455 () Bool)

(declare-fun b_free!6259 () Bool)

(declare-fun b_next!6259 () Bool)

(assert (=> b!232455 (= b_free!6259 (not b_next!6259))))

(declare-fun tp!21919 () Bool)

(declare-fun b_and!13157 () Bool)

(assert (=> b!232455 (= tp!21919 b_and!13157)))

(declare-fun b!232440 () Bool)

(declare-fun res!114145 () Bool)

(declare-fun e!150948 () Bool)

(assert (=> b!232440 (=> (not res!114145) (not e!150948))))

(declare-fun call!21612 () Bool)

(assert (=> b!232440 (= res!114145 call!21612)))

(declare-fun e!150954 () Bool)

(assert (=> b!232440 (= e!150954 e!150948)))

(declare-fun b!232441 () Bool)

(declare-fun e!150944 () Bool)

(declare-fun e!150947 () Bool)

(declare-fun mapRes!10351 () Bool)

(assert (=> b!232441 (= e!150944 (and e!150947 mapRes!10351))))

(declare-fun condMapEmpty!10351 () Bool)

(declare-datatypes ((V!7809 0))(
  ( (V!7810 (val!3105 Int)) )
))
(declare-datatypes ((ValueCell!2717 0))(
  ( (ValueCellFull!2717 (v!5125 V!7809)) (EmptyCell!2717) )
))
(declare-datatypes ((array!11485 0))(
  ( (array!11486 (arr!5462 (Array (_ BitVec 32) ValueCell!2717)) (size!5795 (_ BitVec 32))) )
))
(declare-datatypes ((array!11487 0))(
  ( (array!11488 (arr!5463 (Array (_ BitVec 32) (_ BitVec 64))) (size!5796 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3334 0))(
  ( (LongMapFixedSize!3335 (defaultEntry!4326 Int) (mask!10240 (_ BitVec 32)) (extraKeys!4063 (_ BitVec 32)) (zeroValue!4167 V!7809) (minValue!4167 V!7809) (_size!1716 (_ BitVec 32)) (_keys!6380 array!11487) (_values!4309 array!11485) (_vacant!1716 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3334)

(declare-fun mapDefault!10351 () ValueCell!2717)
