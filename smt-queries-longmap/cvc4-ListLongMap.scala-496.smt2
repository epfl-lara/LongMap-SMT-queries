; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11262 () Bool)

(assert start!11262)

(declare-fun b!92724 () Bool)

(declare-fun b_free!2349 () Bool)

(declare-fun b_next!2349 () Bool)

(assert (=> b!92724 (= b_free!2349 (not b_next!2349))))

(declare-fun tp!9308 () Bool)

(declare-fun b_and!5627 () Bool)

(assert (=> b!92724 (= tp!9308 b_and!5627)))

(declare-fun b!92719 () Bool)

(declare-fun b_free!2351 () Bool)

(declare-fun b_next!2351 () Bool)

(assert (=> b!92719 (= b_free!2351 (not b_next!2351))))

(declare-fun tp!9306 () Bool)

(declare-fun b_and!5629 () Bool)

(assert (=> b!92719 (= tp!9306 b_and!5629)))

(declare-fun res!47129 () Bool)

(declare-fun e!60459 () Bool)

(assert (=> start!11262 (=> (not res!47129) (not e!60459))))

(declare-datatypes ((V!3101 0))(
  ( (V!3102 (val!1340 Int)) )
))
(declare-datatypes ((array!4153 0))(
  ( (array!4154 (arr!1975 (Array (_ BitVec 32) (_ BitVec 64))) (size!2223 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!952 0))(
  ( (ValueCellFull!952 (v!2735 V!3101)) (EmptyCell!952) )
))
(declare-datatypes ((array!4155 0))(
  ( (array!4156 (arr!1976 (Array (_ BitVec 32) ValueCell!952)) (size!2224 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!812 0))(
  ( (LongMapFixedSize!813 (defaultEntry!2420 Int) (mask!6486 (_ BitVec 32)) (extraKeys!2249 (_ BitVec 32)) (zeroValue!2307 V!3101) (minValue!2307 V!3101) (_size!455 (_ BitVec 32)) (_keys!4102 array!4153) (_values!2403 array!4155) (_vacant!455 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!612 0))(
  ( (Cell!613 (v!2736 LongMapFixedSize!812)) )
))
(declare-datatypes ((LongMap!612 0))(
  ( (LongMap!613 (underlying!317 Cell!612)) )
))
(declare-fun thiss!992 () LongMap!612)

(declare-fun valid!360 (LongMap!612) Bool)

(assert (=> start!11262 (= res!47129 (valid!360 thiss!992))))

(assert (=> start!11262 e!60459))

(declare-fun e!60466 () Bool)

(assert (=> start!11262 e!60466))

(assert (=> start!11262 true))

(declare-fun e!60463 () Bool)

(assert (=> start!11262 e!60463))

(declare-fun b!92717 () Bool)

(declare-fun e!60458 () Bool)

(declare-fun tp_is_empty!2591 () Bool)

(assert (=> b!92717 (= e!60458 tp_is_empty!2591)))

(declare-fun b!92718 () Bool)

(declare-fun res!47130 () Bool)

(assert (=> b!92718 (=> (not res!47130) (not e!60459))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!92718 (= res!47130 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2223 (_keys!4102 (v!2736 (underlying!317 thiss!992)))))))))

(declare-fun newMap!16 () LongMapFixedSize!812)

(declare-fun e!60462 () Bool)

(declare-fun array_inv!1225 (array!4153) Bool)

(declare-fun array_inv!1226 (array!4155) Bool)

(assert (=> b!92719 (= e!60463 (and tp!9306 tp_is_empty!2591 (array_inv!1225 (_keys!4102 newMap!16)) (array_inv!1226 (_values!2403 newMap!16)) e!60462))))

(declare-fun b!92720 () Bool)

(declare-fun e!60457 () Bool)

(assert (=> b!92720 (= e!60466 e!60457)))

(declare-fun mapNonEmpty!3601 () Bool)

(declare-fun mapRes!3601 () Bool)

(declare-fun tp!9307 () Bool)

(assert (=> mapNonEmpty!3601 (= mapRes!3601 (and tp!9307 e!60458))))

(declare-fun mapKey!3601 () (_ BitVec 32))

(declare-fun mapValue!3602 () ValueCell!952)

(declare-fun mapRest!3602 () (Array (_ BitVec 32) ValueCell!952))

(assert (=> mapNonEmpty!3601 (= (arr!1976 (_values!2403 (v!2736 (underlying!317 thiss!992)))) (store mapRest!3602 mapKey!3601 mapValue!3602))))

(declare-fun b!92721 () Bool)

(declare-fun e!60453 () Bool)

(declare-fun mapRes!3602 () Bool)

(assert (=> b!92721 (= e!60462 (and e!60453 mapRes!3602))))

(declare-fun condMapEmpty!3602 () Bool)

(declare-fun mapDefault!3601 () ValueCell!952)

