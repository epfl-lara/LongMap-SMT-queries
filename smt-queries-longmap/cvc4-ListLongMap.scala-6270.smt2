; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80218 () Bool)

(assert start!80218)

(declare-fun b!942359 () Bool)

(declare-fun b_free!17945 () Bool)

(declare-fun b_next!17945 () Bool)

(assert (=> b!942359 (= b_free!17945 (not b_next!17945))))

(declare-fun tp!62334 () Bool)

(declare-fun b_and!29357 () Bool)

(assert (=> b!942359 (= tp!62334 b_and!29357)))

(declare-fun b!942352 () Bool)

(declare-fun res!633268 () Bool)

(declare-fun e!529841 () Bool)

(assert (=> b!942352 (=> (not res!633268) (not e!529841))))

(declare-datatypes ((V!32235 0))(
  ( (V!32236 (val!10277 Int)) )
))
(declare-datatypes ((ValueCell!9745 0))(
  ( (ValueCellFull!9745 (v!12808 V!32235)) (EmptyCell!9745) )
))
(declare-datatypes ((array!56868 0))(
  ( (array!56869 (arr!27362 (Array (_ BitVec 32) ValueCell!9745)) (size!27827 (_ BitVec 32))) )
))
(declare-datatypes ((array!56870 0))(
  ( (array!56871 (arr!27363 (Array (_ BitVec 32) (_ BitVec 64))) (size!27828 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4640 0))(
  ( (LongMapFixedSize!4641 (defaultEntry!5611 Int) (mask!27213 (_ BitVec 32)) (extraKeys!5343 (_ BitVec 32)) (zeroValue!5447 V!32235) (minValue!5447 V!32235) (_size!2375 (_ BitVec 32)) (_keys!10481 array!56870) (_values!5634 array!56868) (_vacant!2375 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4640)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942352 (= res!633268 (validMask!0 (mask!27213 thiss!1141)))))

(declare-fun b!942353 () Bool)

(declare-datatypes ((List!19213 0))(
  ( (Nil!19210) (Cons!19209 (h!20359 (_ BitVec 64)) (t!27528 List!19213)) )
))
(declare-fun arrayNoDuplicates!0 (array!56870 (_ BitVec 32) List!19213) Bool)

(assert (=> b!942353 (= e!529841 (not (arrayNoDuplicates!0 (_keys!10481 thiss!1141) #b00000000000000000000000000000000 Nil!19210)))))

(declare-fun b!942354 () Bool)

(declare-fun e!529837 () Bool)

(declare-fun e!529839 () Bool)

(declare-fun mapRes!32495 () Bool)

(assert (=> b!942354 (= e!529837 (and e!529839 mapRes!32495))))

(declare-fun condMapEmpty!32495 () Bool)

(declare-fun mapDefault!32495 () ValueCell!9745)

