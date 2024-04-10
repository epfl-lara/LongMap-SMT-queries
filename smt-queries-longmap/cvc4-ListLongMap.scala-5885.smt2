; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75844 () Bool)

(assert start!75844)

(declare-fun b!892416 () Bool)

(declare-fun b_free!15815 () Bool)

(declare-fun b_next!15815 () Bool)

(assert (=> b!892416 (= b_free!15815 (not b_next!15815))))

(declare-fun tp!55414 () Bool)

(declare-fun b_and!26055 () Bool)

(assert (=> b!892416 (= tp!55414 b_and!26055)))

(declare-fun mapNonEmpty!28769 () Bool)

(declare-fun mapRes!28769 () Bool)

(declare-fun tp!55413 () Bool)

(declare-fun e!498163 () Bool)

(assert (=> mapNonEmpty!28769 (= mapRes!28769 (and tp!55413 e!498163))))

(declare-fun mapKey!28769 () (_ BitVec 32))

(declare-datatypes ((V!29155 0))(
  ( (V!29156 (val!9122 Int)) )
))
(declare-datatypes ((ValueCell!8590 0))(
  ( (ValueCellFull!8590 (v!11600 V!29155)) (EmptyCell!8590) )
))
(declare-fun mapRest!28769 () (Array (_ BitVec 32) ValueCell!8590))

(declare-datatypes ((array!52266 0))(
  ( (array!52267 (arr!25139 (Array (_ BitVec 32) (_ BitVec 64))) (size!25583 (_ BitVec 32))) )
))
(declare-datatypes ((array!52268 0))(
  ( (array!52269 (arr!25140 (Array (_ BitVec 32) ValueCell!8590)) (size!25584 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4196 0))(
  ( (LongMapFixedSize!4197 (defaultEntry!5295 Int) (mask!25806 (_ BitVec 32)) (extraKeys!4989 (_ BitVec 32)) (zeroValue!5093 V!29155) (minValue!5093 V!29155) (_size!2153 (_ BitVec 32)) (_keys!9978 array!52266) (_values!5280 array!52268) (_vacant!2153 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4196)

(declare-fun mapValue!28769 () ValueCell!8590)

(assert (=> mapNonEmpty!28769 (= (arr!25140 (_values!5280 thiss!1181)) (store mapRest!28769 mapKey!28769 mapValue!28769))))

(declare-fun b!892411 () Bool)

(declare-fun res!604613 () Bool)

(declare-fun e!498161 () Bool)

(assert (=> b!892411 (=> res!604613 e!498161)))

(declare-datatypes ((List!17783 0))(
  ( (Nil!17780) (Cons!17779 (h!18910 (_ BitVec 64)) (t!25082 List!17783)) )
))
(declare-fun arrayNoDuplicates!0 (array!52266 (_ BitVec 32) List!17783) Bool)

(assert (=> b!892411 (= res!604613 (not (arrayNoDuplicates!0 (_keys!9978 thiss!1181) #b00000000000000000000000000000000 Nil!17780)))))

(declare-fun b!892412 () Bool)

(declare-fun res!604612 () Bool)

(declare-fun e!498168 () Bool)

(assert (=> b!892412 (=> (not res!604612) (not e!498168))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892412 (= res!604612 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892413 () Bool)

(assert (=> b!892413 (= e!498161 true)))

(declare-fun lt!403175 () Bool)

(declare-datatypes ((tuple2!11994 0))(
  ( (tuple2!11995 (_1!6008 (_ BitVec 64)) (_2!6008 V!29155)) )
))
(declare-datatypes ((List!17784 0))(
  ( (Nil!17781) (Cons!17780 (h!18911 tuple2!11994) (t!25083 List!17784)) )
))
(declare-datatypes ((ListLongMap!10691 0))(
  ( (ListLongMap!10692 (toList!5361 List!17784)) )
))
(declare-fun lt!403179 () ListLongMap!10691)

(declare-fun contains!4363 (ListLongMap!10691 (_ BitVec 64)) Bool)

(assert (=> b!892413 (= lt!403175 (contains!4363 lt!403179 key!785))))

(declare-fun b!892414 () Bool)

(declare-fun e!498160 () Bool)

(declare-datatypes ((SeekEntryResult!8847 0))(
  ( (MissingZero!8847 (index!37759 (_ BitVec 32))) (Found!8847 (index!37760 (_ BitVec 32))) (Intermediate!8847 (undefined!9659 Bool) (index!37761 (_ BitVec 32)) (x!75839 (_ BitVec 32))) (Undefined!8847) (MissingVacant!8847 (index!37762 (_ BitVec 32))) )
))
(declare-fun lt!403177 () SeekEntryResult!8847)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892414 (= e!498160 (inRange!0 (index!37760 lt!403177) (mask!25806 thiss!1181)))))

(declare-fun b!892415 () Bool)

(declare-fun e!498164 () Bool)

(declare-fun tp_is_empty!18143 () Bool)

(assert (=> b!892415 (= e!498164 tp_is_empty!18143)))

(declare-fun e!498165 () Bool)

(declare-fun e!498162 () Bool)

(declare-fun array_inv!19744 (array!52266) Bool)

(declare-fun array_inv!19745 (array!52268) Bool)

(assert (=> b!892416 (= e!498162 (and tp!55414 tp_is_empty!18143 (array_inv!19744 (_keys!9978 thiss!1181)) (array_inv!19745 (_values!5280 thiss!1181)) e!498165))))

(declare-fun b!892417 () Bool)

(assert (=> b!892417 (= e!498165 (and e!498164 mapRes!28769))))

(declare-fun condMapEmpty!28769 () Bool)

(declare-fun mapDefault!28769 () ValueCell!8590)

