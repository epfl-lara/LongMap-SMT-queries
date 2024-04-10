; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80894 () Bool)

(assert start!80894)

(declare-fun b!947878 () Bool)

(declare-fun b_free!18191 () Bool)

(declare-fun b_next!18191 () Bool)

(assert (=> b!947878 (= b_free!18191 (not b_next!18191))))

(declare-fun tp!63140 () Bool)

(declare-fun b_and!29615 () Bool)

(assert (=> b!947878 (= tp!63140 b_and!29615)))

(declare-fun b!947875 () Bool)

(declare-fun res!636061 () Bool)

(declare-fun e!533568 () Bool)

(assert (=> b!947875 (=> (not res!636061) (not e!533568))))

(declare-datatypes ((V!32563 0))(
  ( (V!32564 (val!10400 Int)) )
))
(declare-datatypes ((ValueCell!9868 0))(
  ( (ValueCellFull!9868 (v!12935 V!32563)) (EmptyCell!9868) )
))
(declare-datatypes ((array!57400 0))(
  ( (array!57401 (arr!27608 (Array (_ BitVec 32) ValueCell!9868)) (size!28081 (_ BitVec 32))) )
))
(declare-datatypes ((array!57402 0))(
  ( (array!57403 (arr!27609 (Array (_ BitVec 32) (_ BitVec 64))) (size!28082 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4886 0))(
  ( (LongMapFixedSize!4887 (defaultEntry!5742 Int) (mask!27490 (_ BitVec 32)) (extraKeys!5474 (_ BitVec 32)) (zeroValue!5578 V!32563) (minValue!5578 V!32563) (_size!2498 (_ BitVec 32)) (_keys!10656 array!57402) (_values!5765 array!57400) (_vacant!2498 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4886)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13518 0))(
  ( (tuple2!13519 (_1!6770 (_ BitVec 64)) (_2!6770 V!32563)) )
))
(declare-datatypes ((List!19313 0))(
  ( (Nil!19310) (Cons!19309 (h!20465 tuple2!13518) (t!27636 List!19313)) )
))
(declare-datatypes ((ListLongMap!12215 0))(
  ( (ListLongMap!12216 (toList!6123 List!19313)) )
))
(declare-fun contains!5205 (ListLongMap!12215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3356 (array!57402 array!57400 (_ BitVec 32) (_ BitVec 32) V!32563 V!32563 (_ BitVec 32) Int) ListLongMap!12215)

(assert (=> b!947875 (= res!636061 (contains!5205 (getCurrentListMap!3356 (_keys!10656 thiss!1141) (_values!5765 thiss!1141) (mask!27490 thiss!1141) (extraKeys!5474 thiss!1141) (zeroValue!5578 thiss!1141) (minValue!5578 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5742 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!32932 () Bool)

(declare-fun mapRes!32932 () Bool)

(assert (=> mapIsEmpty!32932 mapRes!32932))

(declare-fun mapNonEmpty!32932 () Bool)

(declare-fun tp!63141 () Bool)

(declare-fun e!533565 () Bool)

(assert (=> mapNonEmpty!32932 (= mapRes!32932 (and tp!63141 e!533565))))

(declare-fun mapValue!32932 () ValueCell!9868)

(declare-fun mapRest!32932 () (Array (_ BitVec 32) ValueCell!9868))

(declare-fun mapKey!32932 () (_ BitVec 32))

(assert (=> mapNonEmpty!32932 (= (arr!27608 (_values!5765 thiss!1141)) (store mapRest!32932 mapKey!32932 mapValue!32932))))

(declare-fun b!947876 () Bool)

(declare-fun tp_is_empty!20699 () Bool)

(assert (=> b!947876 (= e!533565 tp_is_empty!20699)))

(declare-fun b!947877 () Bool)

(declare-fun e!533569 () Bool)

(assert (=> b!947877 (= e!533569 tp_is_empty!20699)))

(declare-fun e!533567 () Bool)

(declare-fun e!533566 () Bool)

(declare-fun array_inv!21430 (array!57402) Bool)

(declare-fun array_inv!21431 (array!57400) Bool)

(assert (=> b!947878 (= e!533566 (and tp!63140 tp_is_empty!20699 (array_inv!21430 (_keys!10656 thiss!1141)) (array_inv!21431 (_values!5765 thiss!1141)) e!533567))))

(declare-fun b!947879 () Bool)

(declare-fun res!636059 () Bool)

(assert (=> b!947879 (=> (not res!636059) (not e!533568))))

(declare-datatypes ((SeekEntryResult!9122 0))(
  ( (MissingZero!9122 (index!38859 (_ BitVec 32))) (Found!9122 (index!38860 (_ BitVec 32))) (Intermediate!9122 (undefined!9934 Bool) (index!38861 (_ BitVec 32)) (x!81556 (_ BitVec 32))) (Undefined!9122) (MissingVacant!9122 (index!38862 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57402 (_ BitVec 32)) SeekEntryResult!9122)

(assert (=> b!947879 (= res!636059 (not (is-Found!9122 (seekEntry!0 key!756 (_keys!10656 thiss!1141) (mask!27490 thiss!1141)))))))

(declare-fun b!947880 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947880 (= e!533568 (not (validMask!0 (mask!27490 thiss!1141))))))

(declare-fun b!947881 () Bool)

(assert (=> b!947881 (= e!533567 (and e!533569 mapRes!32932))))

(declare-fun condMapEmpty!32932 () Bool)

(declare-fun mapDefault!32932 () ValueCell!9868)

