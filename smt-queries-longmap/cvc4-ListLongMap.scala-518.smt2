; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13068 () Bool)

(assert start!13068)

(declare-fun b!114065 () Bool)

(declare-fun b_free!2613 () Bool)

(declare-fun b_next!2613 () Bool)

(assert (=> b!114065 (= b_free!2613 (not b_next!2613))))

(declare-fun tp!10198 () Bool)

(declare-fun b_and!7019 () Bool)

(assert (=> b!114065 (= tp!10198 b_and!7019)))

(declare-fun b!114069 () Bool)

(declare-fun b_free!2615 () Bool)

(declare-fun b_next!2615 () Bool)

(assert (=> b!114069 (= b_free!2615 (not b_next!2615))))

(declare-fun tp!10197 () Bool)

(declare-fun b_and!7021 () Bool)

(assert (=> b!114069 (= tp!10197 b_and!7021)))

(declare-fun mapIsEmpty!4097 () Bool)

(declare-fun mapRes!4098 () Bool)

(assert (=> mapIsEmpty!4097 mapRes!4098))

(declare-datatypes ((V!3277 0))(
  ( (V!3278 (val!1406 Int)) )
))
(declare-datatypes ((array!4447 0))(
  ( (array!4448 (arr!2107 (Array (_ BitVec 32) (_ BitVec 64))) (size!2367 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1018 0))(
  ( (ValueCellFull!1018 (v!2979 V!3277)) (EmptyCell!1018) )
))
(declare-datatypes ((array!4449 0))(
  ( (array!4450 (arr!2108 (Array (_ BitVec 32) ValueCell!1018)) (size!2368 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!944 0))(
  ( (LongMapFixedSize!945 (defaultEntry!2678 Int) (mask!6870 (_ BitVec 32)) (extraKeys!2467 (_ BitVec 32)) (zeroValue!2545 V!3277) (minValue!2545 V!3277) (_size!521 (_ BitVec 32)) (_keys!4400 array!4447) (_values!2661 array!4449) (_vacant!521 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!744 0))(
  ( (Cell!745 (v!2980 LongMapFixedSize!944)) )
))
(declare-datatypes ((LongMap!744 0))(
  ( (LongMap!745 (underlying!383 Cell!744)) )
))
(declare-fun thiss!992 () LongMap!744)

(declare-fun e!74177 () Bool)

(declare-fun e!74173 () Bool)

(declare-fun tp_is_empty!2723 () Bool)

(declare-fun array_inv!1325 (array!4447) Bool)

(declare-fun array_inv!1326 (array!4449) Bool)

(assert (=> b!114065 (= e!74177 (and tp!10198 tp_is_empty!2723 (array_inv!1325 (_keys!4400 (v!2980 (underlying!383 thiss!992)))) (array_inv!1326 (_values!2661 (v!2980 (underlying!383 thiss!992)))) e!74173))))

(declare-fun mapNonEmpty!4097 () Bool)

(declare-fun mapRes!4097 () Bool)

(declare-fun tp!10199 () Bool)

(declare-fun e!74176 () Bool)

(assert (=> mapNonEmpty!4097 (= mapRes!4097 (and tp!10199 e!74176))))

(declare-fun mapRest!4098 () (Array (_ BitVec 32) ValueCell!1018))

(declare-fun mapValue!4098 () ValueCell!1018)

(declare-fun newMap!16 () LongMapFixedSize!944)

(declare-fun mapKey!4097 () (_ BitVec 32))

(assert (=> mapNonEmpty!4097 (= (arr!2108 (_values!2661 newMap!16)) (store mapRest!4098 mapKey!4097 mapValue!4098))))

(declare-fun b!114067 () Bool)

(declare-fun e!74171 () Bool)

(declare-fun e!74174 () Bool)

(assert (=> b!114067 (= e!74171 (and e!74174 mapRes!4097))))

(declare-fun condMapEmpty!4098 () Bool)

(declare-fun mapDefault!4098 () ValueCell!1018)

