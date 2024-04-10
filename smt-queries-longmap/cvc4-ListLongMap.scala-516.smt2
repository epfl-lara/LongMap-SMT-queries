; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12954 () Bool)

(assert start!12954)

(declare-fun b!112871 () Bool)

(declare-fun b_free!2589 () Bool)

(declare-fun b_next!2589 () Bool)

(assert (=> b!112871 (= b_free!2589 (not b_next!2589))))

(declare-fun tp!10120 () Bool)

(declare-fun b_and!6939 () Bool)

(assert (=> b!112871 (= tp!10120 b_and!6939)))

(declare-fun b!112885 () Bool)

(declare-fun b_free!2591 () Bool)

(declare-fun b_next!2591 () Bool)

(assert (=> b!112885 (= b_free!2591 (not b_next!2591))))

(declare-fun tp!10122 () Bool)

(declare-fun b_and!6941 () Bool)

(assert (=> b!112885 (= tp!10122 b_and!6941)))

(declare-fun mapIsEmpty!4055 () Bool)

(declare-fun mapRes!4056 () Bool)

(assert (=> mapIsEmpty!4055 mapRes!4056))

(declare-fun mapNonEmpty!4055 () Bool)

(declare-fun mapRes!4055 () Bool)

(declare-fun tp!10119 () Bool)

(declare-fun e!73388 () Bool)

(assert (=> mapNonEmpty!4055 (= mapRes!4055 (and tp!10119 e!73388))))

(declare-datatypes ((V!3261 0))(
  ( (V!3262 (val!1400 Int)) )
))
(declare-datatypes ((array!4421 0))(
  ( (array!4422 (arr!2095 (Array (_ BitVec 32) (_ BitVec 64))) (size!2354 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1012 0))(
  ( (ValueCellFull!1012 (v!2960 V!3261)) (EmptyCell!1012) )
))
(declare-datatypes ((array!4423 0))(
  ( (array!4424 (arr!2096 (Array (_ BitVec 32) ValueCell!1012)) (size!2355 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!932 0))(
  ( (LongMapFixedSize!933 (defaultEntry!2662 Int) (mask!6846 (_ BitVec 32)) (extraKeys!2453 (_ BitVec 32)) (zeroValue!2530 V!3261) (minValue!2530 V!3261) (_size!515 (_ BitVec 32)) (_keys!4382 array!4421) (_values!2645 array!4423) (_vacant!515 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!732 0))(
  ( (Cell!733 (v!2961 LongMapFixedSize!932)) )
))
(declare-datatypes ((LongMap!732 0))(
  ( (LongMap!733 (underlying!377 Cell!732)) )
))
(declare-fun thiss!992 () LongMap!732)

(declare-fun mapKey!4056 () (_ BitVec 32))

(declare-fun mapRest!4055 () (Array (_ BitVec 32) ValueCell!1012))

(declare-fun mapValue!4055 () ValueCell!1012)

(assert (=> mapNonEmpty!4055 (= (arr!2096 (_values!2645 (v!2961 (underlying!377 thiss!992)))) (store mapRest!4055 mapKey!4056 mapValue!4055))))

(declare-fun e!73390 () Bool)

(declare-fun e!73387 () Bool)

(declare-fun tp_is_empty!2711 () Bool)

(declare-fun array_inv!1319 (array!4421) Bool)

(declare-fun array_inv!1320 (array!4423) Bool)

(assert (=> b!112871 (= e!73387 (and tp!10120 tp_is_empty!2711 (array_inv!1319 (_keys!4382 (v!2961 (underlying!377 thiss!992)))) (array_inv!1320 (_values!2645 (v!2961 (underlying!377 thiss!992)))) e!73390))))

(declare-fun b!112872 () Bool)

(declare-fun e!73392 () Bool)

(declare-fun e!73394 () Bool)

(assert (=> b!112872 (= e!73392 (and e!73394 mapRes!4056))))

(declare-fun condMapEmpty!4056 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!932)

(declare-fun mapDefault!4055 () ValueCell!1012)

