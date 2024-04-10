; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75312 () Bool)

(assert start!75312)

(declare-fun b!887204 () Bool)

(declare-fun b_free!15511 () Bool)

(declare-fun b_next!15511 () Bool)

(assert (=> b!887204 (= b_free!15511 (not b_next!15511))))

(declare-fun tp!54466 () Bool)

(declare-fun b_and!25717 () Bool)

(assert (=> b!887204 (= tp!54466 b_and!25717)))

(declare-fun b!887201 () Bool)

(declare-fun e!494042 () Bool)

(declare-fun tp_is_empty!17839 () Bool)

(assert (=> b!887201 (= e!494042 tp_is_empty!17839)))

(declare-fun b!887202 () Bool)

(declare-fun e!494040 () Bool)

(assert (=> b!887202 (= e!494040 tp_is_empty!17839)))

(declare-fun mapNonEmpty!28278 () Bool)

(declare-fun mapRes!28278 () Bool)

(declare-fun tp!54467 () Bool)

(assert (=> mapNonEmpty!28278 (= mapRes!28278 (and tp!54467 e!494040))))

(declare-fun mapKey!28278 () (_ BitVec 32))

(declare-datatypes ((V!28751 0))(
  ( (V!28752 (val!8970 Int)) )
))
(declare-datatypes ((ValueCell!8438 0))(
  ( (ValueCellFull!8438 (v!11420 V!28751)) (EmptyCell!8438) )
))
(declare-datatypes ((array!51638 0))(
  ( (array!51639 (arr!24835 (Array (_ BitVec 32) ValueCell!8438)) (size!25275 (_ BitVec 32))) )
))
(declare-datatypes ((array!51640 0))(
  ( (array!51641 (arr!24836 (Array (_ BitVec 32) (_ BitVec 64))) (size!25276 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3892 0))(
  ( (LongMapFixedSize!3893 (defaultEntry!5134 Int) (mask!25529 (_ BitVec 32)) (extraKeys!4827 (_ BitVec 32)) (zeroValue!4931 V!28751) (minValue!4931 V!28751) (_size!2001 (_ BitVec 32)) (_keys!9809 array!51640) (_values!5118 array!51638) (_vacant!2001 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1052 0))(
  ( (Cell!1053 (v!11421 LongMapFixedSize!3892)) )
))
(declare-datatypes ((LongMap!1052 0))(
  ( (LongMap!1053 (underlying!537 Cell!1052)) )
))
(declare-fun thiss!833 () LongMap!1052)

(declare-fun mapRest!28278 () (Array (_ BitVec 32) ValueCell!8438))

(declare-fun mapValue!28278 () ValueCell!8438)

(assert (=> mapNonEmpty!28278 (= (arr!24835 (_values!5118 (v!11421 (underlying!537 thiss!833)))) (store mapRest!28278 mapKey!28278 mapValue!28278))))

(declare-fun b!887203 () Bool)

(declare-fun e!494043 () Bool)

(declare-fun key!673 () (_ BitVec 64))

(declare-datatypes ((Option!438 0))(
  ( (Some!437 (v!11422 V!28751)) (None!436) )
))
(declare-fun isDefined!314 (Option!438) Bool)

(declare-datatypes ((tuple2!11916 0))(
  ( (tuple2!11917 (_1!5969 (_ BitVec 64)) (_2!5969 V!28751)) )
))
(declare-datatypes ((List!17678 0))(
  ( (Nil!17675) (Cons!17674 (h!18805 tuple2!11916) (t!24961 List!17678)) )
))
(declare-fun getValueByKey!432 (List!17678 (_ BitVec 64)) Option!438)

(declare-datatypes ((ListLongMap!10613 0))(
  ( (ListLongMap!10614 (toList!5322 List!17678)) )
))
(declare-fun map!12082 (LongMap!1052) ListLongMap!10613)

(assert (=> b!887203 (= e!494043 (not (isDefined!314 (getValueByKey!432 (toList!5322 (map!12082 thiss!833)) key!673))))))

(declare-fun e!494035 () Bool)

(declare-fun e!494039 () Bool)

(declare-fun array_inv!19548 (array!51640) Bool)

(declare-fun array_inv!19549 (array!51638) Bool)

(assert (=> b!887204 (= e!494039 (and tp!54466 tp_is_empty!17839 (array_inv!19548 (_keys!9809 (v!11421 (underlying!537 thiss!833)))) (array_inv!19549 (_values!5118 (v!11421 (underlying!537 thiss!833)))) e!494035))))

(declare-fun b!887205 () Bool)

(assert (=> b!887205 (= e!494035 (and e!494042 mapRes!28278))))

(declare-fun condMapEmpty!28278 () Bool)

(declare-fun mapDefault!28278 () ValueCell!8438)

