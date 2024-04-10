; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80868 () Bool)

(assert start!80868)

(declare-fun b!947683 () Bool)

(declare-fun b_free!18185 () Bool)

(declare-fun b_next!18185 () Bool)

(assert (=> b!947683 (= b_free!18185 (not b_next!18185))))

(declare-fun tp!63119 () Bool)

(declare-fun b_and!29607 () Bool)

(assert (=> b!947683 (= tp!63119 b_and!29607)))

(declare-fun e!533441 () Bool)

(declare-fun e!533437 () Bool)

(declare-fun tp_is_empty!20693 () Bool)

(declare-datatypes ((V!32555 0))(
  ( (V!32556 (val!10397 Int)) )
))
(declare-datatypes ((ValueCell!9865 0))(
  ( (ValueCellFull!9865 (v!12931 V!32555)) (EmptyCell!9865) )
))
(declare-datatypes ((array!57386 0))(
  ( (array!57387 (arr!27602 (Array (_ BitVec 32) ValueCell!9865)) (size!28075 (_ BitVec 32))) )
))
(declare-datatypes ((array!57388 0))(
  ( (array!57389 (arr!27603 (Array (_ BitVec 32) (_ BitVec 64))) (size!28076 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4880 0))(
  ( (LongMapFixedSize!4881 (defaultEntry!5737 Int) (mask!27482 (_ BitVec 32)) (extraKeys!5469 (_ BitVec 32)) (zeroValue!5573 V!32555) (minValue!5573 V!32555) (_size!2495 (_ BitVec 32)) (_keys!10650 array!57388) (_values!5760 array!57386) (_vacant!2495 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4880)

(declare-fun array_inv!21426 (array!57388) Bool)

(declare-fun array_inv!21427 (array!57386) Bool)

(assert (=> b!947683 (= e!533437 (and tp!63119 tp_is_empty!20693 (array_inv!21426 (_keys!10650 thiss!1141)) (array_inv!21427 (_values!5760 thiss!1141)) e!533441))))

(declare-fun b!947684 () Bool)

(declare-fun e!533439 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13514 0))(
  ( (tuple2!13515 (_1!6768 (_ BitVec 64)) (_2!6768 V!32555)) )
))
(declare-datatypes ((List!19310 0))(
  ( (Nil!19307) (Cons!19306 (h!20462 tuple2!13514) (t!27631 List!19310)) )
))
(declare-datatypes ((ListLongMap!12211 0))(
  ( (ListLongMap!12212 (toList!6121 List!19310)) )
))
(declare-fun contains!5203 (ListLongMap!12211 (_ BitVec 64)) Bool)

(declare-fun map!13066 (LongMapFixedSize!4880) ListLongMap!12211)

(assert (=> b!947684 (= e!533439 (not (contains!5203 (map!13066 thiss!1141) key!756)))))

(declare-datatypes ((SeekEntryResult!9120 0))(
  ( (MissingZero!9120 (index!38851 (_ BitVec 32))) (Found!9120 (index!38852 (_ BitVec 32))) (Intermediate!9120 (undefined!9932 Bool) (index!38853 (_ BitVec 32)) (x!81536 (_ BitVec 32))) (Undefined!9120) (MissingVacant!9120 (index!38854 (_ BitVec 32))) )
))
(declare-fun lt!426651 () SeekEntryResult!9120)

(declare-fun getCurrentListMap!3354 (array!57388 array!57386 (_ BitVec 32) (_ BitVec 32) V!32555 V!32555 (_ BitVec 32) Int) ListLongMap!12211)

(assert (=> b!947684 (contains!5203 (getCurrentListMap!3354 (_keys!10650 thiss!1141) (_values!5760 thiss!1141) (mask!27482 thiss!1141) (extraKeys!5469 thiss!1141) (zeroValue!5573 thiss!1141) (minValue!5573 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5737 thiss!1141)) (select (arr!27603 (_keys!10650 thiss!1141)) (index!38852 lt!426651)))))

(declare-datatypes ((Unit!31936 0))(
  ( (Unit!31937) )
))
(declare-fun lt!426649 () Unit!31936)

(declare-fun lemmaValidKeyInArrayIsInListMap!268 (array!57388 array!57386 (_ BitVec 32) (_ BitVec 32) V!32555 V!32555 (_ BitVec 32) Int) Unit!31936)

(assert (=> b!947684 (= lt!426649 (lemmaValidKeyInArrayIsInListMap!268 (_keys!10650 thiss!1141) (_values!5760 thiss!1141) (mask!27482 thiss!1141) (extraKeys!5469 thiss!1141) (zeroValue!5573 thiss!1141) (minValue!5573 thiss!1141) (index!38852 lt!426651) (defaultEntry!5737 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947684 (arrayContainsKey!0 (_keys!10650 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426650 () Unit!31936)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57388 (_ BitVec 64) (_ BitVec 32)) Unit!31936)

(assert (=> b!947684 (= lt!426650 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10650 thiss!1141) key!756 (index!38852 lt!426651)))))

(declare-fun b!947685 () Bool)

(declare-fun e!533438 () Bool)

(assert (=> b!947685 (= e!533438 tp_is_empty!20693)))

(declare-fun mapIsEmpty!32920 () Bool)

(declare-fun mapRes!32920 () Bool)

(assert (=> mapIsEmpty!32920 mapRes!32920))

(declare-fun b!947687 () Bool)

(declare-fun res!635975 () Bool)

(declare-fun e!533435 () Bool)

(assert (=> b!947687 (=> (not res!635975) (not e!533435))))

(assert (=> b!947687 (= res!635975 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947688 () Bool)

(assert (=> b!947688 (= e!533435 e!533439)))

(declare-fun res!635976 () Bool)

(assert (=> b!947688 (=> (not res!635976) (not e!533439))))

(assert (=> b!947688 (= res!635976 (is-Found!9120 lt!426651))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57388 (_ BitVec 32)) SeekEntryResult!9120)

(assert (=> b!947688 (= lt!426651 (seekEntry!0 key!756 (_keys!10650 thiss!1141) (mask!27482 thiss!1141)))))

(declare-fun mapNonEmpty!32920 () Bool)

(declare-fun tp!63120 () Bool)

(declare-fun e!533436 () Bool)

(assert (=> mapNonEmpty!32920 (= mapRes!32920 (and tp!63120 e!533436))))

(declare-fun mapRest!32920 () (Array (_ BitVec 32) ValueCell!9865))

(declare-fun mapValue!32920 () ValueCell!9865)

(declare-fun mapKey!32920 () (_ BitVec 32))

(assert (=> mapNonEmpty!32920 (= (arr!27602 (_values!5760 thiss!1141)) (store mapRest!32920 mapKey!32920 mapValue!32920))))

(declare-fun b!947689 () Bool)

(assert (=> b!947689 (= e!533436 tp_is_empty!20693)))

(declare-fun res!635977 () Bool)

(assert (=> start!80868 (=> (not res!635977) (not e!533435))))

(declare-fun valid!1858 (LongMapFixedSize!4880) Bool)

(assert (=> start!80868 (= res!635977 (valid!1858 thiss!1141))))

(assert (=> start!80868 e!533435))

(assert (=> start!80868 e!533437))

(assert (=> start!80868 true))

(declare-fun b!947686 () Bool)

(assert (=> b!947686 (= e!533441 (and e!533438 mapRes!32920))))

(declare-fun condMapEmpty!32920 () Bool)

(declare-fun mapDefault!32920 () ValueCell!9865)

