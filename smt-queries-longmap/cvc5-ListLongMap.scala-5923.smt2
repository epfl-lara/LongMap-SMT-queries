; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77050 () Bool)

(assert start!77050)

(declare-fun b!899844 () Bool)

(declare-fun b_free!16039 () Bool)

(declare-fun b_next!16039 () Bool)

(assert (=> b!899844 (= b_free!16039 (not b_next!16039))))

(declare-fun tp!56201 () Bool)

(declare-fun b_and!26353 () Bool)

(assert (=> b!899844 (= tp!56201 b_and!26353)))

(declare-fun b!899843 () Bool)

(declare-fun e!503556 () Bool)

(declare-fun tp_is_empty!18367 () Bool)

(assert (=> b!899843 (= e!503556 tp_is_empty!18367)))

(declare-fun e!503555 () Bool)

(declare-fun e!503554 () Bool)

(declare-datatypes ((array!52780 0))(
  ( (array!52781 (arr!25363 (Array (_ BitVec 32) (_ BitVec 64))) (size!25821 (_ BitVec 32))) )
))
(declare-datatypes ((V!29455 0))(
  ( (V!29456 (val!9234 Int)) )
))
(declare-datatypes ((ValueCell!8702 0))(
  ( (ValueCellFull!8702 (v!11729 V!29455)) (EmptyCell!8702) )
))
(declare-datatypes ((array!52782 0))(
  ( (array!52783 (arr!25364 (Array (_ BitVec 32) ValueCell!8702)) (size!25822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4420 0))(
  ( (LongMapFixedSize!4421 (defaultEntry!5438 Int) (mask!26207 (_ BitVec 32)) (extraKeys!5161 (_ BitVec 32)) (zeroValue!5265 V!29455) (minValue!5265 V!29455) (_size!2265 (_ BitVec 32)) (_keys!10233 array!52780) (_values!5452 array!52782) (_vacant!2265 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4420)

(declare-fun array_inv!19900 (array!52780) Bool)

(declare-fun array_inv!19901 (array!52782) Bool)

(assert (=> b!899844 (= e!503554 (and tp!56201 tp_is_empty!18367 (array_inv!19900 (_keys!10233 thiss!1181)) (array_inv!19901 (_values!5452 thiss!1181)) e!503555))))

(declare-fun b!899845 () Bool)

(declare-fun e!503561 () Bool)

(assert (=> b!899845 (= e!503561 (or (not (= (size!25822 (_values!5452 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26207 thiss!1181)))) (not (= (size!25821 (_keys!10233 thiss!1181)) (size!25822 (_values!5452 thiss!1181)))) (bvslt (mask!26207 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5161 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5161 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!899846 () Bool)

(declare-fun e!503553 () Bool)

(declare-datatypes ((SeekEntryResult!8934 0))(
  ( (MissingZero!8934 (index!38107 (_ BitVec 32))) (Found!8934 (index!38108 (_ BitVec 32))) (Intermediate!8934 (undefined!9746 Bool) (index!38109 (_ BitVec 32)) (x!76677 (_ BitVec 32))) (Undefined!8934) (MissingVacant!8934 (index!38110 (_ BitVec 32))) )
))
(declare-fun lt!406485 () SeekEntryResult!8934)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899846 (= e!503553 (inRange!0 (index!38108 lt!406485) (mask!26207 thiss!1181)))))

(declare-fun b!899847 () Bool)

(declare-fun e!503557 () Bool)

(declare-fun e!503559 () Bool)

(assert (=> b!899847 (= e!503557 (not e!503559))))

(declare-fun res!607797 () Bool)

(assert (=> b!899847 (=> res!607797 e!503559)))

(assert (=> b!899847 (= res!607797 (not (is-Found!8934 lt!406485)))))

(assert (=> b!899847 e!503553))

(declare-fun res!607796 () Bool)

(assert (=> b!899847 (=> res!607796 e!503553)))

(assert (=> b!899847 (= res!607796 (not (is-Found!8934 lt!406485)))))

(declare-datatypes ((Unit!30574 0))(
  ( (Unit!30575) )
))
(declare-fun lt!406486 () Unit!30574)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!98 (array!52780 array!52782 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 64)) Unit!30574)

(assert (=> b!899847 (= lt!406486 (lemmaSeekEntryGivesInRangeIndex!98 (_keys!10233 thiss!1181) (_values!5452 thiss!1181) (mask!26207 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52780 (_ BitVec 32)) SeekEntryResult!8934)

(assert (=> b!899847 (= lt!406485 (seekEntry!0 key!785 (_keys!10233 thiss!1181) (mask!26207 thiss!1181)))))

(declare-fun b!899848 () Bool)

(declare-fun e!503558 () Bool)

(assert (=> b!899848 (= e!503558 tp_is_empty!18367)))

(declare-fun mapIsEmpty!29220 () Bool)

(declare-fun mapRes!29220 () Bool)

(assert (=> mapIsEmpty!29220 mapRes!29220))

(declare-fun mapNonEmpty!29220 () Bool)

(declare-fun tp!56200 () Bool)

(assert (=> mapNonEmpty!29220 (= mapRes!29220 (and tp!56200 e!503556))))

(declare-fun mapRest!29220 () (Array (_ BitVec 32) ValueCell!8702))

(declare-fun mapValue!29220 () ValueCell!8702)

(declare-fun mapKey!29220 () (_ BitVec 32))

(assert (=> mapNonEmpty!29220 (= (arr!25364 (_values!5452 thiss!1181)) (store mapRest!29220 mapKey!29220 mapValue!29220))))

(declare-fun b!899850 () Bool)

(assert (=> b!899850 (= e!503555 (and e!503558 mapRes!29220))))

(declare-fun condMapEmpty!29220 () Bool)

(declare-fun mapDefault!29220 () ValueCell!8702)

