; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15260 () Bool)

(assert start!15260)

(declare-fun b!147224 () Bool)

(declare-fun b_free!3153 () Bool)

(declare-fun b_next!3153 () Bool)

(assert (=> b!147224 (= b_free!3153 (not b_next!3153))))

(declare-fun tp!11966 () Bool)

(declare-fun b_and!9243 () Bool)

(assert (=> b!147224 (= tp!11966 b_and!9243)))

(declare-fun b!147231 () Bool)

(declare-fun b_free!3155 () Bool)

(declare-fun b_next!3155 () Bool)

(assert (=> b!147231 (= b_free!3155 (not b_next!3155))))

(declare-fun tp!11968 () Bool)

(declare-fun b_and!9245 () Bool)

(assert (=> b!147231 (= tp!11968 b_and!9245)))

(declare-fun res!69970 () Bool)

(declare-fun e!96142 () Bool)

(assert (=> start!15260 (=> (not res!69970) (not e!96142))))

(declare-datatypes ((V!3637 0))(
  ( (V!3638 (val!1541 Int)) )
))
(declare-datatypes ((array!5033 0))(
  ( (array!5034 (arr!2377 (Array (_ BitVec 32) (_ BitVec 64))) (size!2653 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1153 0))(
  ( (ValueCellFull!1153 (v!3373 V!3637)) (EmptyCell!1153) )
))
(declare-datatypes ((array!5035 0))(
  ( (array!5036 (arr!2378 (Array (_ BitVec 32) ValueCell!1153)) (size!2654 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1214 0))(
  ( (LongMapFixedSize!1215 (defaultEntry!3026 Int) (mask!7408 (_ BitVec 32)) (extraKeys!2771 (_ BitVec 32)) (zeroValue!2871 V!3637) (minValue!2871 V!3637) (_size!656 (_ BitVec 32)) (_keys!4795 array!5033) (_values!3009 array!5035) (_vacant!656 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!996 0))(
  ( (Cell!997 (v!3374 LongMapFixedSize!1214)) )
))
(declare-datatypes ((LongMap!996 0))(
  ( (LongMap!997 (underlying!509 Cell!996)) )
))
(declare-fun thiss!992 () LongMap!996)

(declare-fun valid!594 (LongMap!996) Bool)

(assert (=> start!15260 (= res!69970 (valid!594 thiss!992))))

(assert (=> start!15260 e!96142))

(declare-fun e!96134 () Bool)

(assert (=> start!15260 e!96134))

(assert (=> start!15260 true))

(declare-fun e!96143 () Bool)

(assert (=> start!15260 e!96143))

(declare-fun b!147214 () Bool)

(declare-fun e!96141 () Bool)

(declare-fun tp_is_empty!2993 () Bool)

(assert (=> b!147214 (= e!96141 tp_is_empty!2993)))

(declare-fun b!147215 () Bool)

(declare-fun e!96139 () Bool)

(assert (=> b!147215 (= e!96139 tp_is_empty!2993)))

(declare-fun b!147216 () Bool)

(declare-fun e!96132 () Bool)

(assert (=> b!147216 (= e!96132 tp_is_empty!2993)))

(declare-fun mapNonEmpty!5055 () Bool)

(declare-fun mapRes!5056 () Bool)

(declare-fun tp!11967 () Bool)

(assert (=> mapNonEmpty!5055 (= mapRes!5056 (and tp!11967 e!96141))))

(declare-fun mapRest!5055 () (Array (_ BitVec 32) ValueCell!1153))

(declare-fun newMap!16 () LongMapFixedSize!1214)

(declare-fun mapKey!5056 () (_ BitVec 32))

(declare-fun mapValue!5056 () ValueCell!1153)

(assert (=> mapNonEmpty!5055 (= (arr!2378 (_values!3009 newMap!16)) (store mapRest!5055 mapKey!5056 mapValue!5056))))

(declare-fun b!147217 () Bool)

(declare-fun res!69975 () Bool)

(assert (=> b!147217 (=> (not res!69975) (not e!96142))))

(declare-fun valid!595 (LongMapFixedSize!1214) Bool)

(assert (=> b!147217 (= res!69975 (valid!595 newMap!16))))

(declare-fun b!147218 () Bool)

(declare-fun e!96140 () Bool)

(declare-fun e!96133 () Bool)

(assert (=> b!147218 (= e!96140 (and e!96133 mapRes!5056))))

(declare-fun condMapEmpty!5055 () Bool)

(declare-fun mapDefault!5056 () ValueCell!1153)

