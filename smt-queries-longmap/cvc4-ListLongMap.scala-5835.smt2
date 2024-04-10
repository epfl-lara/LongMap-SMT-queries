; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75316 () Bool)

(assert start!75316)

(declare-fun b!887254 () Bool)

(declare-fun b_free!15515 () Bool)

(declare-fun b_next!15515 () Bool)

(assert (=> b!887254 (= b_free!15515 (not b_next!15515))))

(declare-fun tp!54478 () Bool)

(declare-fun b_and!25721 () Bool)

(assert (=> b!887254 (= tp!54478 b_and!25721)))

(declare-fun b!887249 () Bool)

(declare-fun e!494092 () Bool)

(declare-fun e!494097 () Bool)

(assert (=> b!887249 (= e!494092 e!494097)))

(declare-fun res!602088 () Bool)

(assert (=> b!887249 (=> (not res!602088) (not e!494097))))

(declare-datatypes ((V!28755 0))(
  ( (V!28756 (val!8972 Int)) )
))
(declare-datatypes ((ValueCell!8440 0))(
  ( (ValueCellFull!8440 (v!11426 V!28755)) (EmptyCell!8440) )
))
(declare-datatypes ((array!51646 0))(
  ( (array!51647 (arr!24839 (Array (_ BitVec 32) ValueCell!8440)) (size!25279 (_ BitVec 32))) )
))
(declare-datatypes ((array!51648 0))(
  ( (array!51649 (arr!24840 (Array (_ BitVec 32) (_ BitVec 64))) (size!25280 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3896 0))(
  ( (LongMapFixedSize!3897 (defaultEntry!5136 Int) (mask!25531 (_ BitVec 32)) (extraKeys!4829 (_ BitVec 32)) (zeroValue!4933 V!28755) (minValue!4933 V!28755) (_size!2003 (_ BitVec 32)) (_keys!9811 array!51648) (_values!5120 array!51646) (_vacant!2003 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1056 0))(
  ( (Cell!1057 (v!11427 LongMapFixedSize!3896)) )
))
(declare-datatypes ((LongMap!1056 0))(
  ( (LongMap!1057 (underlying!539 Cell!1056)) )
))
(declare-fun thiss!833 () LongMap!1056)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun contains!4304 (LongMap!1056 (_ BitVec 64)) Bool)

(assert (=> b!887249 (= res!602088 (contains!4304 thiss!833 key!673))))

(declare-fun lt!401218 () V!28755)

(declare-fun apply!392 (LongMapFixedSize!3896 (_ BitVec 64)) V!28755)

(assert (=> b!887249 (= lt!401218 (apply!392 (v!11427 (underlying!539 thiss!833)) key!673))))

(declare-fun mapNonEmpty!28284 () Bool)

(declare-fun mapRes!28284 () Bool)

(declare-fun tp!54479 () Bool)

(declare-fun e!494091 () Bool)

(assert (=> mapNonEmpty!28284 (= mapRes!28284 (and tp!54479 e!494091))))

(declare-fun mapRest!28284 () (Array (_ BitVec 32) ValueCell!8440))

(declare-fun mapValue!28284 () ValueCell!8440)

(declare-fun mapKey!28284 () (_ BitVec 32))

(assert (=> mapNonEmpty!28284 (= (arr!24839 (_values!5120 (v!11427 (underlying!539 thiss!833)))) (store mapRest!28284 mapKey!28284 mapValue!28284))))

(declare-fun mapIsEmpty!28284 () Bool)

(assert (=> mapIsEmpty!28284 mapRes!28284))

(declare-fun b!887250 () Bool)

(declare-fun e!494093 () Bool)

(declare-fun e!494090 () Bool)

(assert (=> b!887250 (= e!494093 e!494090)))

(declare-fun b!887251 () Bool)

(declare-datatypes ((Option!440 0))(
  ( (Some!439 (v!11428 V!28755)) (None!438) )
))
(declare-fun isDefined!316 (Option!440) Bool)

(declare-datatypes ((tuple2!11920 0))(
  ( (tuple2!11921 (_1!5971 (_ BitVec 64)) (_2!5971 V!28755)) )
))
(declare-datatypes ((List!17680 0))(
  ( (Nil!17677) (Cons!17676 (h!18807 tuple2!11920) (t!24963 List!17680)) )
))
(declare-fun getValueByKey!434 (List!17680 (_ BitVec 64)) Option!440)

(declare-datatypes ((ListLongMap!10617 0))(
  ( (ListLongMap!10618 (toList!5324 List!17680)) )
))
(declare-fun map!12084 (LongMap!1056) ListLongMap!10617)

(assert (=> b!887251 (= e!494097 (not (isDefined!316 (getValueByKey!434 (toList!5324 (map!12084 thiss!833)) key!673))))))

(declare-fun res!602089 () Bool)

(assert (=> start!75316 (=> (not res!602089) (not e!494092))))

(declare-fun valid!1517 (LongMap!1056) Bool)

(assert (=> start!75316 (= res!602089 (valid!1517 thiss!833))))

(assert (=> start!75316 e!494092))

(assert (=> start!75316 e!494093))

(assert (=> start!75316 true))

(declare-fun b!887252 () Bool)

(declare-fun e!494089 () Bool)

(assert (=> b!887252 (= e!494090 e!494089)))

(declare-fun b!887253 () Bool)

(declare-fun e!494094 () Bool)

(declare-fun e!494096 () Bool)

(assert (=> b!887253 (= e!494094 (and e!494096 mapRes!28284))))

(declare-fun condMapEmpty!28284 () Bool)

(declare-fun mapDefault!28284 () ValueCell!8440)

