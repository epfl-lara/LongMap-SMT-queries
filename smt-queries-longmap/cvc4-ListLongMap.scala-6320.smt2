; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81210 () Bool)

(assert start!81210)

(declare-fun b!950339 () Bool)

(declare-fun b_free!18245 () Bool)

(declare-fun b_next!18245 () Bool)

(assert (=> b!950339 (= b_free!18245 (not b_next!18245))))

(declare-fun tp!63330 () Bool)

(declare-fun b_and!29701 () Bool)

(assert (=> b!950339 (= tp!63330 b_and!29701)))

(declare-fun res!637165 () Bool)

(declare-fun e!535053 () Bool)

(assert (=> start!81210 (=> (not res!637165) (not e!535053))))

(declare-datatypes ((V!32635 0))(
  ( (V!32636 (val!10427 Int)) )
))
(declare-datatypes ((ValueCell!9895 0))(
  ( (ValueCellFull!9895 (v!12970 V!32635)) (EmptyCell!9895) )
))
(declare-datatypes ((array!57524 0))(
  ( (array!57525 (arr!27662 (Array (_ BitVec 32) ValueCell!9895)) (size!28139 (_ BitVec 32))) )
))
(declare-datatypes ((array!57526 0))(
  ( (array!57527 (arr!27663 (Array (_ BitVec 32) (_ BitVec 64))) (size!28140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4940 0))(
  ( (LongMapFixedSize!4941 (defaultEntry!5781 Int) (mask!27581 (_ BitVec 32)) (extraKeys!5513 (_ BitVec 32)) (zeroValue!5617 V!32635) (minValue!5617 V!32635) (_size!2525 (_ BitVec 32)) (_keys!10717 array!57526) (_values!5804 array!57524) (_vacant!2525 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4940)

(declare-fun valid!1878 (LongMapFixedSize!4940) Bool)

(assert (=> start!81210 (= res!637165 (valid!1878 thiss!1141))))

(assert (=> start!81210 e!535053))

(declare-fun e!535048 () Bool)

(assert (=> start!81210 e!535048))

(assert (=> start!81210 true))

(declare-fun b!950335 () Bool)

(declare-fun res!637166 () Bool)

(assert (=> b!950335 (=> (not res!637166) (not e!535053))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9142 0))(
  ( (MissingZero!9142 (index!38939 (_ BitVec 32))) (Found!9142 (index!38940 (_ BitVec 32))) (Intermediate!9142 (undefined!9954 Bool) (index!38941 (_ BitVec 32)) (x!81760 (_ BitVec 32))) (Undefined!9142) (MissingVacant!9142 (index!38942 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57526 (_ BitVec 32)) SeekEntryResult!9142)

(assert (=> b!950335 (= res!637166 (not (is-Found!9142 (seekEntry!0 key!756 (_keys!10717 thiss!1141) (mask!27581 thiss!1141)))))))

(declare-fun b!950336 () Bool)

(declare-fun e!535051 () Bool)

(declare-fun tp_is_empty!20753 () Bool)

(assert (=> b!950336 (= e!535051 tp_is_empty!20753)))

(declare-fun mapNonEmpty!33041 () Bool)

(declare-fun mapRes!33041 () Bool)

(declare-fun tp!63331 () Bool)

(declare-fun e!535050 () Bool)

(assert (=> mapNonEmpty!33041 (= mapRes!33041 (and tp!63331 e!535050))))

(declare-fun mapValue!33041 () ValueCell!9895)

(declare-fun mapRest!33041 () (Array (_ BitVec 32) ValueCell!9895))

(declare-fun mapKey!33041 () (_ BitVec 32))

(assert (=> mapNonEmpty!33041 (= (arr!27662 (_values!5804 thiss!1141)) (store mapRest!33041 mapKey!33041 mapValue!33041))))

(declare-fun b!950337 () Bool)

(declare-fun res!637167 () Bool)

(assert (=> b!950337 (=> (not res!637167) (not e!535053))))

(assert (=> b!950337 (= res!637167 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950338 () Bool)

(declare-fun res!637168 () Bool)

(assert (=> b!950338 (=> (not res!637168) (not e!535053))))

(declare-datatypes ((tuple2!13552 0))(
  ( (tuple2!13553 (_1!6787 (_ BitVec 64)) (_2!6787 V!32635)) )
))
(declare-datatypes ((List!19341 0))(
  ( (Nil!19338) (Cons!19337 (h!20497 tuple2!13552) (t!27680 List!19341)) )
))
(declare-datatypes ((ListLongMap!12249 0))(
  ( (ListLongMap!12250 (toList!6140 List!19341)) )
))
(declare-fun contains!5231 (ListLongMap!12249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3373 (array!57526 array!57524 (_ BitVec 32) (_ BitVec 32) V!32635 V!32635 (_ BitVec 32) Int) ListLongMap!12249)

(assert (=> b!950338 (= res!637168 (contains!5231 (getCurrentListMap!3373 (_keys!10717 thiss!1141) (_values!5804 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5513 thiss!1141) (zeroValue!5617 thiss!1141) (minValue!5617 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5781 thiss!1141)) key!756))))

(declare-fun e!535049 () Bool)

(declare-fun array_inv!21470 (array!57526) Bool)

(declare-fun array_inv!21471 (array!57524) Bool)

(assert (=> b!950339 (= e!535048 (and tp!63330 tp_is_empty!20753 (array_inv!21470 (_keys!10717 thiss!1141)) (array_inv!21471 (_values!5804 thiss!1141)) e!535049))))

(declare-fun b!950340 () Bool)

(assert (=> b!950340 (= e!535049 (and e!535051 mapRes!33041))))

(declare-fun condMapEmpty!33041 () Bool)

(declare-fun mapDefault!33041 () ValueCell!9895)

