; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11064 () Bool)

(assert start!11064)

(declare-fun b!90173 () Bool)

(declare-fun b_free!2289 () Bool)

(declare-fun b_next!2289 () Bool)

(assert (=> b!90173 (= b_free!2289 (not b_next!2289))))

(declare-fun tp!9113 () Bool)

(declare-fun b_and!5431 () Bool)

(assert (=> b!90173 (= tp!9113 b_and!5431)))

(declare-fun b!90177 () Bool)

(declare-fun b_free!2291 () Bool)

(declare-fun b_next!2291 () Bool)

(assert (=> b!90177 (= b_free!2291 (not b_next!2291))))

(declare-fun tp!9114 () Bool)

(declare-fun b_and!5433 () Bool)

(assert (=> b!90177 (= tp!9114 b_and!5433)))

(declare-fun b!90168 () Bool)

(declare-fun res!46045 () Bool)

(declare-fun e!58744 () Bool)

(assert (=> b!90168 (=> (not res!46045) (not e!58744))))

(declare-datatypes ((V!3061 0))(
  ( (V!3062 (val!1325 Int)) )
))
(declare-datatypes ((array!4087 0))(
  ( (array!4088 (arr!1945 (Array (_ BitVec 32) (_ BitVec 64))) (size!2192 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!937 0))(
  ( (ValueCellFull!937 (v!2694 V!3061)) (EmptyCell!937) )
))
(declare-datatypes ((array!4089 0))(
  ( (array!4090 (arr!1946 (Array (_ BitVec 32) ValueCell!937)) (size!2193 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!782 0))(
  ( (LongMapFixedSize!783 (defaultEntry!2389 Int) (mask!6441 (_ BitVec 32)) (extraKeys!2220 (_ BitVec 32)) (zeroValue!2277 V!3061) (minValue!2277 V!3061) (_size!440 (_ BitVec 32)) (_keys!4069 array!4087) (_values!2372 array!4089) (_vacant!440 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!782)

(declare-datatypes ((Cell!582 0))(
  ( (Cell!583 (v!2695 LongMapFixedSize!782)) )
))
(declare-datatypes ((LongMap!582 0))(
  ( (LongMap!583 (underlying!302 Cell!582)) )
))
(declare-fun thiss!992 () LongMap!582)

(assert (=> b!90168 (= res!46045 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6441 newMap!16)) (_size!440 (v!2695 (underlying!302 thiss!992)))))))

(declare-fun b!90169 () Bool)

(declare-fun res!46047 () Bool)

(assert (=> b!90169 (=> (not res!46047) (not e!58744))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!90169 (= res!46047 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2192 (_keys!4069 (v!2695 (underlying!302 thiss!992)))))))))

(declare-fun b!90170 () Bool)

(declare-fun e!58735 () Bool)

(declare-fun tp_is_empty!2561 () Bool)

(assert (=> b!90170 (= e!58735 tp_is_empty!2561)))

(declare-fun mapNonEmpty!3497 () Bool)

(declare-fun mapRes!3498 () Bool)

(declare-fun tp!9112 () Bool)

(declare-fun e!58730 () Bool)

(assert (=> mapNonEmpty!3497 (= mapRes!3498 (and tp!9112 e!58730))))

(declare-fun mapRest!3497 () (Array (_ BitVec 32) ValueCell!937))

(declare-fun mapKey!3497 () (_ BitVec 32))

(declare-fun mapValue!3497 () ValueCell!937)

(assert (=> mapNonEmpty!3497 (= (arr!1946 (_values!2372 newMap!16)) (store mapRest!3497 mapKey!3497 mapValue!3497))))

(declare-fun b!90171 () Bool)

(declare-fun e!58736 () Bool)

(assert (=> b!90171 (= e!58736 (and e!58735 mapRes!3498))))

(declare-fun condMapEmpty!3498 () Bool)

(declare-fun mapDefault!3497 () ValueCell!937)

