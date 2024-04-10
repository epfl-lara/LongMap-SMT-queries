; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75498 () Bool)

(assert start!75498)

(declare-fun b!888405 () Bool)

(declare-fun b_free!15569 () Bool)

(declare-fun b_next!15569 () Bool)

(assert (=> b!888405 (= b_free!15569 (not b_next!15569))))

(declare-fun tp!54658 () Bool)

(declare-fun b_and!25807 () Bool)

(assert (=> b!888405 (= tp!54658 b_and!25807)))

(declare-fun b!888401 () Bool)

(declare-fun e!495019 () Bool)

(assert (=> b!888401 (= e!495019 false)))

(declare-fun lt!401730 () Bool)

(declare-datatypes ((array!51764 0))(
  ( (array!51765 (arr!24893 (Array (_ BitVec 32) (_ BitVec 64))) (size!25334 (_ BitVec 32))) )
))
(declare-datatypes ((V!28827 0))(
  ( (V!28828 (val!8999 Int)) )
))
(declare-datatypes ((ValueCell!8467 0))(
  ( (ValueCellFull!8467 (v!11472 V!28827)) (EmptyCell!8467) )
))
(declare-datatypes ((array!51766 0))(
  ( (array!51767 (arr!24894 (Array (_ BitVec 32) ValueCell!8467)) (size!25335 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3950 0))(
  ( (LongMapFixedSize!3951 (defaultEntry!5169 Int) (mask!25589 (_ BitVec 32)) (extraKeys!4863 (_ BitVec 32)) (zeroValue!4967 V!28827) (minValue!4967 V!28827) (_size!2030 (_ BitVec 32)) (_keys!9848 array!51764) (_values!5154 array!51766) (_vacant!2030 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3950)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4322 (LongMapFixedSize!3950 (_ BitVec 64)) Bool)

(assert (=> b!888401 (= lt!401730 (contains!4322 thiss!1181 key!785))))

(declare-fun mapNonEmpty!28382 () Bool)

(declare-fun mapRes!28382 () Bool)

(declare-fun tp!54657 () Bool)

(declare-fun e!495020 () Bool)

(assert (=> mapNonEmpty!28382 (= mapRes!28382 (and tp!54657 e!495020))))

(declare-fun mapKey!28382 () (_ BitVec 32))

(declare-fun mapRest!28382 () (Array (_ BitVec 32) ValueCell!8467))

(declare-fun mapValue!28382 () ValueCell!8467)

(assert (=> mapNonEmpty!28382 (= (arr!24894 (_values!5154 thiss!1181)) (store mapRest!28382 mapKey!28382 mapValue!28382))))

(declare-fun b!888402 () Bool)

(declare-fun e!495018 () Bool)

(declare-fun tp_is_empty!17897 () Bool)

(assert (=> b!888402 (= e!495018 tp_is_empty!17897)))

(declare-fun res!602363 () Bool)

(assert (=> start!75498 (=> (not res!602363) (not e!495019))))

(declare-fun valid!1541 (LongMapFixedSize!3950) Bool)

(assert (=> start!75498 (= res!602363 (valid!1541 thiss!1181))))

(assert (=> start!75498 e!495019))

(declare-fun e!495016 () Bool)

(assert (=> start!75498 e!495016))

(assert (=> start!75498 true))

(declare-fun mapIsEmpty!28382 () Bool)

(assert (=> mapIsEmpty!28382 mapRes!28382))

(declare-fun b!888403 () Bool)

(declare-fun e!495017 () Bool)

(assert (=> b!888403 (= e!495017 (and e!495018 mapRes!28382))))

(declare-fun condMapEmpty!28382 () Bool)

(declare-fun mapDefault!28382 () ValueCell!8467)

