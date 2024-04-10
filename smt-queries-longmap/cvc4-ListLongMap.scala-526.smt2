; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13150 () Bool)

(assert start!13150)

(declare-fun b!115567 () Bool)

(declare-fun b_free!2709 () Bool)

(declare-fun b_next!2709 () Bool)

(assert (=> b!115567 (= b_free!2709 (not b_next!2709))))

(declare-fun tp!10489 () Bool)

(declare-fun b_and!7179 () Bool)

(assert (=> b!115567 (= tp!10489 b_and!7179)))

(declare-fun b!115564 () Bool)

(declare-fun b_free!2711 () Bool)

(declare-fun b_next!2711 () Bool)

(assert (=> b!115564 (= b_free!2711 (not b_next!2711))))

(declare-fun tp!10490 () Bool)

(declare-fun b_and!7181 () Bool)

(assert (=> b!115564 (= tp!10490 b_and!7181)))

(declare-fun mapNonEmpty!4245 () Bool)

(declare-fun mapRes!4245 () Bool)

(declare-fun tp!10492 () Bool)

(declare-fun e!75399 () Bool)

(assert (=> mapNonEmpty!4245 (= mapRes!4245 (and tp!10492 e!75399))))

(declare-fun mapKey!4246 () (_ BitVec 32))

(declare-datatypes ((V!3341 0))(
  ( (V!3342 (val!1430 Int)) )
))
(declare-datatypes ((ValueCell!1042 0))(
  ( (ValueCellFull!1042 (v!3029 V!3341)) (EmptyCell!1042) )
))
(declare-fun mapRest!4245 () (Array (_ BitVec 32) ValueCell!1042))

(declare-datatypes ((array!4545 0))(
  ( (array!4546 (arr!2155 (Array (_ BitVec 32) (_ BitVec 64))) (size!2415 (_ BitVec 32))) )
))
(declare-datatypes ((array!4547 0))(
  ( (array!4548 (arr!2156 (Array (_ BitVec 32) ValueCell!1042)) (size!2416 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!992 0))(
  ( (LongMapFixedSize!993 (defaultEntry!2705 Int) (mask!6913 (_ BitVec 32)) (extraKeys!2494 (_ BitVec 32)) (zeroValue!2572 V!3341) (minValue!2572 V!3341) (_size!545 (_ BitVec 32)) (_keys!4427 array!4545) (_values!2688 array!4547) (_vacant!545 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!992)

(declare-fun mapValue!4246 () ValueCell!1042)

(assert (=> mapNonEmpty!4245 (= (arr!2156 (_values!2688 newMap!16)) (store mapRest!4245 mapKey!4246 mapValue!4246))))

(declare-fun tp_is_empty!2771 () Bool)

(declare-fun e!75404 () Bool)

(declare-fun e!75405 () Bool)

(declare-fun array_inv!1357 (array!4545) Bool)

(declare-fun array_inv!1358 (array!4547) Bool)

(assert (=> b!115564 (= e!75405 (and tp!10490 tp_is_empty!2771 (array_inv!1357 (_keys!4427 newMap!16)) (array_inv!1358 (_values!2688 newMap!16)) e!75404))))

(declare-fun b!115565 () Bool)

(declare-fun e!75400 () Bool)

(assert (=> b!115565 (= e!75400 tp_is_empty!2771)))

(declare-fun b!115566 () Bool)

(declare-fun e!75403 () Bool)

(declare-fun e!75398 () Bool)

(declare-fun mapRes!4246 () Bool)

(assert (=> b!115566 (= e!75403 (and e!75398 mapRes!4246))))

(declare-fun condMapEmpty!4246 () Bool)

(declare-datatypes ((Cell!792 0))(
  ( (Cell!793 (v!3030 LongMapFixedSize!992)) )
))
(declare-datatypes ((LongMap!792 0))(
  ( (LongMap!793 (underlying!407 Cell!792)) )
))
(declare-fun thiss!992 () LongMap!792)

(declare-fun mapDefault!4245 () ValueCell!1042)

