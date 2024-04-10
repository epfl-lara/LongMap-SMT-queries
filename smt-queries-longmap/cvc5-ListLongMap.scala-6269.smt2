; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80196 () Bool)

(assert start!80196)

(declare-fun b!942165 () Bool)

(declare-fun b_free!17935 () Bool)

(declare-fun b_next!17935 () Bool)

(assert (=> b!942165 (= b_free!17935 (not b_next!17935))))

(declare-fun tp!62302 () Bool)

(declare-fun b_and!29347 () Bool)

(assert (=> b!942165 (= tp!62302 b_and!29347)))

(declare-fun b!942162 () Bool)

(declare-fun e!529721 () Bool)

(declare-fun tp_is_empty!20443 () Bool)

(assert (=> b!942162 (= e!529721 tp_is_empty!20443)))

(declare-fun mapNonEmpty!32477 () Bool)

(declare-fun mapRes!32477 () Bool)

(declare-fun tp!62301 () Bool)

(declare-fun e!529725 () Bool)

(assert (=> mapNonEmpty!32477 (= mapRes!32477 (and tp!62301 e!529725))))

(declare-datatypes ((V!32223 0))(
  ( (V!32224 (val!10272 Int)) )
))
(declare-datatypes ((ValueCell!9740 0))(
  ( (ValueCellFull!9740 (v!12803 V!32223)) (EmptyCell!9740) )
))
(declare-fun mapRest!32477 () (Array (_ BitVec 32) ValueCell!9740))

(declare-fun mapKey!32477 () (_ BitVec 32))

(declare-datatypes ((array!56846 0))(
  ( (array!56847 (arr!27352 (Array (_ BitVec 32) ValueCell!9740)) (size!27817 (_ BitVec 32))) )
))
(declare-datatypes ((array!56848 0))(
  ( (array!56849 (arr!27353 (Array (_ BitVec 32) (_ BitVec 64))) (size!27818 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4630 0))(
  ( (LongMapFixedSize!4631 (defaultEntry!5606 Int) (mask!27203 (_ BitVec 32)) (extraKeys!5338 (_ BitVec 32)) (zeroValue!5442 V!32223) (minValue!5442 V!32223) (_size!2370 (_ BitVec 32)) (_keys!10474 array!56848) (_values!5629 array!56846) (_vacant!2370 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4630)

(declare-fun mapValue!32477 () ValueCell!9740)

(assert (=> mapNonEmpty!32477 (= (arr!27352 (_values!5629 thiss!1141)) (store mapRest!32477 mapKey!32477 mapValue!32477))))

(declare-fun b!942163 () Bool)

(declare-fun res!633169 () Bool)

(declare-fun e!529724 () Bool)

(assert (=> b!942163 (=> (not res!633169) (not e!529724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942163 (= res!633169 (validMask!0 (mask!27203 thiss!1141)))))

(declare-fun b!942164 () Bool)

(declare-fun e!529722 () Bool)

(assert (=> b!942164 (= e!529722 (and e!529721 mapRes!32477))))

(declare-fun condMapEmpty!32477 () Bool)

(declare-fun mapDefault!32477 () ValueCell!9740)

