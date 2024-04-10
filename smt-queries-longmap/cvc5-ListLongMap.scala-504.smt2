; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11798 () Bool)

(assert start!11798)

(declare-fun b!99030 () Bool)

(declare-fun b_free!2437 () Bool)

(declare-fun b_next!2437 () Bool)

(assert (=> b!99030 (= b_free!2437 (not b_next!2437))))

(declare-fun tp!9602 () Bool)

(declare-fun b_and!6087 () Bool)

(assert (=> b!99030 (= tp!9602 b_and!6087)))

(declare-fun b!99029 () Bool)

(declare-fun b_free!2439 () Bool)

(declare-fun b_next!2439 () Bool)

(assert (=> b!99029 (= b_free!2439 (not b_next!2439))))

(declare-fun tp!9604 () Bool)

(declare-fun b_and!6089 () Bool)

(assert (=> b!99029 (= tp!9604 b_and!6089)))

(declare-fun b!99018 () Bool)

(declare-fun res!49784 () Bool)

(declare-fun e!64531 () Bool)

(assert (=> b!99018 (=> (not res!49784) (not e!64531))))

(declare-datatypes ((V!3161 0))(
  ( (V!3162 (val!1362 Int)) )
))
(declare-datatypes ((array!4251 0))(
  ( (array!4252 (arr!2019 (Array (_ BitVec 32) (_ BitVec 64))) (size!2270 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!974 0))(
  ( (ValueCellFull!974 (v!2813 V!3161)) (EmptyCell!974) )
))
(declare-datatypes ((array!4253 0))(
  ( (array!4254 (arr!2020 (Array (_ BitVec 32) ValueCell!974)) (size!2271 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!856 0))(
  ( (LongMapFixedSize!857 (defaultEntry!2501 Int) (mask!6608 (_ BitVec 32)) (extraKeys!2318 (_ BitVec 32)) (zeroValue!2382 V!3161) (minValue!2382 V!3161) (_size!477 (_ BitVec 32)) (_keys!4195 array!4251) (_values!2484 array!4253) (_vacant!477 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!656 0))(
  ( (Cell!657 (v!2814 LongMapFixedSize!856)) )
))
(declare-datatypes ((LongMap!656 0))(
  ( (LongMap!657 (underlying!339 Cell!656)) )
))
(declare-fun thiss!992 () LongMap!656)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!99018 (= res!49784 (validMask!0 (mask!6608 (v!2814 (underlying!339 thiss!992)))))))

(declare-fun b!99019 () Bool)

(declare-fun res!49782 () Bool)

(declare-fun e!64525 () Bool)

(assert (=> b!99019 (=> (not res!49782) (not e!64525))))

(declare-fun newMap!16 () LongMapFixedSize!856)

(declare-fun valid!387 (LongMapFixedSize!856) Bool)

(assert (=> b!99019 (= res!49782 (valid!387 newMap!16))))

(declare-fun b!99020 () Bool)

(declare-fun e!64533 () Bool)

(declare-fun tp_is_empty!2635 () Bool)

(assert (=> b!99020 (= e!64533 tp_is_empty!2635)))

(declare-fun mapNonEmpty!3765 () Bool)

(declare-fun mapRes!3765 () Bool)

(declare-fun tp!9601 () Bool)

(assert (=> mapNonEmpty!3765 (= mapRes!3765 (and tp!9601 e!64533))))

(declare-fun mapRest!3766 () (Array (_ BitVec 32) ValueCell!974))

(declare-fun mapValue!3766 () ValueCell!974)

(declare-fun mapKey!3765 () (_ BitVec 32))

(assert (=> mapNonEmpty!3765 (= (arr!2020 (_values!2484 (v!2814 (underlying!339 thiss!992)))) (store mapRest!3766 mapKey!3765 mapValue!3766))))

(declare-fun b!99021 () Bool)

(declare-fun e!64523 () Bool)

(declare-fun e!64526 () Bool)

(declare-fun mapRes!3766 () Bool)

(assert (=> b!99021 (= e!64523 (and e!64526 mapRes!3766))))

(declare-fun condMapEmpty!3765 () Bool)

(declare-fun mapDefault!3765 () ValueCell!974)

