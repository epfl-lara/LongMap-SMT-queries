; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76778 () Bool)

(assert start!76778)

(declare-fun b!898289 () Bool)

(declare-fun b_free!16013 () Bool)

(declare-fun b_next!16013 () Bool)

(assert (=> b!898289 (= b_free!16013 (not b_next!16013))))

(declare-fun tp!56104 () Bool)

(declare-fun b_and!26305 () Bool)

(assert (=> b!898289 (= tp!56104 b_and!26305)))

(declare-fun b!898285 () Bool)

(declare-fun e!502471 () Bool)

(declare-datatypes ((SeekEntryResult!8924 0))(
  ( (MissingZero!8924 (index!38067 (_ BitVec 32))) (Found!8924 (index!38068 (_ BitVec 32))) (Intermediate!8924 (undefined!9736 Bool) (index!38069 (_ BitVec 32)) (x!76553 (_ BitVec 32))) (Undefined!8924) (MissingVacant!8924 (index!38070 (_ BitVec 32))) )
))
(declare-fun lt!405480 () SeekEntryResult!8924)

(declare-datatypes ((array!52718 0))(
  ( (array!52719 (arr!25337 (Array (_ BitVec 32) (_ BitVec 64))) (size!25792 (_ BitVec 32))) )
))
(declare-datatypes ((V!29419 0))(
  ( (V!29420 (val!9221 Int)) )
))
(declare-datatypes ((ValueCell!8689 0))(
  ( (ValueCellFull!8689 (v!11711 V!29419)) (EmptyCell!8689) )
))
(declare-datatypes ((array!52720 0))(
  ( (array!52721 (arr!25338 (Array (_ BitVec 32) ValueCell!8689)) (size!25793 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4394 0))(
  ( (LongMapFixedSize!4395 (defaultEntry!5409 Int) (mask!26133 (_ BitVec 32)) (extraKeys!5124 (_ BitVec 32)) (zeroValue!5228 V!29419) (minValue!5228 V!29419) (_size!2252 (_ BitVec 32)) (_keys!10182 array!52718) (_values!5415 array!52720) (_vacant!2252 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4394)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898285 (= e!502471 (inRange!0 (index!38068 lt!405480) (mask!26133 thiss!1181)))))

(declare-fun b!898286 () Bool)

(declare-fun res!607085 () Bool)

(declare-fun e!502468 () Bool)

(assert (=> b!898286 (=> (not res!607085) (not e!502468))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!898286 (= res!607085 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29163 () Bool)

(declare-fun mapRes!29163 () Bool)

(assert (=> mapIsEmpty!29163 mapRes!29163))

(declare-fun b!898288 () Bool)

(declare-fun e!502465 () Bool)

(declare-fun tp_is_empty!18341 () Bool)

(assert (=> b!898288 (= e!502465 tp_is_empty!18341)))

(declare-fun e!502467 () Bool)

(declare-fun e!502469 () Bool)

(declare-fun array_inv!19886 (array!52718) Bool)

(declare-fun array_inv!19887 (array!52720) Bool)

(assert (=> b!898289 (= e!502469 (and tp!56104 tp_is_empty!18341 (array_inv!19886 (_keys!10182 thiss!1181)) (array_inv!19887 (_values!5415 thiss!1181)) e!502467))))

(declare-fun mapNonEmpty!29163 () Bool)

(declare-fun tp!56105 () Bool)

(declare-fun e!502472 () Bool)

(assert (=> mapNonEmpty!29163 (= mapRes!29163 (and tp!56105 e!502472))))

(declare-fun mapValue!29163 () ValueCell!8689)

(declare-fun mapRest!29163 () (Array (_ BitVec 32) ValueCell!8689))

(declare-fun mapKey!29163 () (_ BitVec 32))

(assert (=> mapNonEmpty!29163 (= (arr!25338 (_values!5415 thiss!1181)) (store mapRest!29163 mapKey!29163 mapValue!29163))))

(declare-fun b!898290 () Bool)

(assert (=> b!898290 (= e!502467 (and e!502465 mapRes!29163))))

(declare-fun condMapEmpty!29163 () Bool)

(declare-fun mapDefault!29163 () ValueCell!8689)

