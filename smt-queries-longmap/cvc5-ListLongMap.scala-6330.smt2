; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81574 () Bool)

(assert start!81574)

(declare-fun b!952946 () Bool)

(declare-fun b_free!18301 () Bool)

(declare-fun b_next!18301 () Bool)

(assert (=> b!952946 (= b_free!18301 (not b_next!18301))))

(declare-fun tp!63530 () Bool)

(declare-fun b_and!29785 () Bool)

(assert (=> b!952946 (= tp!63530 b_and!29785)))

(declare-fun mapIsEmpty!33157 () Bool)

(declare-fun mapRes!33157 () Bool)

(assert (=> mapIsEmpty!33157 mapRes!33157))

(declare-fun b!952942 () Bool)

(declare-fun e!536702 () Bool)

(declare-fun tp_is_empty!20809 () Bool)

(assert (=> b!952942 (= e!536702 tp_is_empty!20809)))

(declare-fun res!638298 () Bool)

(declare-fun e!536700 () Bool)

(assert (=> start!81574 (=> (not res!638298) (not e!536700))))

(declare-datatypes ((V!32711 0))(
  ( (V!32712 (val!10455 Int)) )
))
(declare-datatypes ((ValueCell!9923 0))(
  ( (ValueCellFull!9923 (v!13008 V!32711)) (EmptyCell!9923) )
))
(declare-datatypes ((array!57656 0))(
  ( (array!57657 (arr!27718 (Array (_ BitVec 32) ValueCell!9923)) (size!28197 (_ BitVec 32))) )
))
(declare-datatypes ((array!57658 0))(
  ( (array!57659 (arr!27719 (Array (_ BitVec 32) (_ BitVec 64))) (size!28198 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4996 0))(
  ( (LongMapFixedSize!4997 (defaultEntry!5833 Int) (mask!27694 (_ BitVec 32)) (extraKeys!5565 (_ BitVec 32)) (zeroValue!5669 V!32711) (minValue!5669 V!32711) (_size!2553 (_ BitVec 32)) (_keys!10792 array!57658) (_values!5856 array!57656) (_vacant!2553 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4996)

(declare-fun valid!1901 (LongMapFixedSize!4996) Bool)

(assert (=> start!81574 (= res!638298 (valid!1901 thiss!1141))))

(assert (=> start!81574 e!536700))

(declare-fun e!536699 () Bool)

(assert (=> start!81574 e!536699))

(assert (=> start!81574 true))

(declare-fun b!952943 () Bool)

(declare-fun res!638301 () Bool)

(assert (=> b!952943 (=> (not res!638301) (not e!536700))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!952943 (= res!638301 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952944 () Bool)

(declare-fun res!638300 () Bool)

(assert (=> b!952944 (=> (not res!638300) (not e!536700))))

(declare-datatypes ((tuple2!13590 0))(
  ( (tuple2!13591 (_1!6806 (_ BitVec 64)) (_2!6806 V!32711)) )
))
(declare-datatypes ((List!19370 0))(
  ( (Nil!19367) (Cons!19366 (h!20528 tuple2!13590) (t!27729 List!19370)) )
))
(declare-datatypes ((ListLongMap!12287 0))(
  ( (ListLongMap!12288 (toList!6159 List!19370)) )
))
(declare-fun contains!5254 (ListLongMap!12287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3392 (array!57658 array!57656 (_ BitVec 32) (_ BitVec 32) V!32711 V!32711 (_ BitVec 32) Int) ListLongMap!12287)

(assert (=> b!952944 (= res!638300 (contains!5254 (getCurrentListMap!3392 (_keys!10792 thiss!1141) (_values!5856 thiss!1141) (mask!27694 thiss!1141) (extraKeys!5565 thiss!1141) (zeroValue!5669 thiss!1141) (minValue!5669 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5833 thiss!1141)) key!756))))

(declare-fun b!952945 () Bool)

(assert (=> b!952945 (= e!536700 (not true))))

(assert (=> b!952945 false))

(declare-datatypes ((Unit!32055 0))(
  ( (Unit!32056) )
))
(declare-fun lt!429453 () Unit!32055)

(declare-fun lt!429450 () (_ BitVec 32))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57658 (_ BitVec 32)) Unit!32055)

(assert (=> b!952945 (= lt!429453 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429450 (_keys!10792 thiss!1141) (mask!27694 thiss!1141)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57658 (_ BitVec 32)) Bool)

(assert (=> b!952945 (arrayForallSeekEntryOrOpenFound!0 lt!429450 (_keys!10792 thiss!1141) (mask!27694 thiss!1141))))

(declare-fun lt!429451 () Unit!32055)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32055)

(assert (=> b!952945 (= lt!429451 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10792 thiss!1141) (mask!27694 thiss!1141) #b00000000000000000000000000000000 lt!429450))))

(declare-fun arrayScanForKey!0 (array!57658 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952945 (= lt!429450 (arrayScanForKey!0 (_keys!10792 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952945 (arrayContainsKey!0 (_keys!10792 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429452 () Unit!32055)

(declare-fun lemmaKeyInListMapIsInArray!338 (array!57658 array!57656 (_ BitVec 32) (_ BitVec 32) V!32711 V!32711 (_ BitVec 64) Int) Unit!32055)

(assert (=> b!952945 (= lt!429452 (lemmaKeyInListMapIsInArray!338 (_keys!10792 thiss!1141) (_values!5856 thiss!1141) (mask!27694 thiss!1141) (extraKeys!5565 thiss!1141) (zeroValue!5669 thiss!1141) (minValue!5669 thiss!1141) key!756 (defaultEntry!5833 thiss!1141)))))

(declare-fun mapNonEmpty!33157 () Bool)

(declare-fun tp!63531 () Bool)

(declare-fun e!536698 () Bool)

(assert (=> mapNonEmpty!33157 (= mapRes!33157 (and tp!63531 e!536698))))

(declare-fun mapValue!33157 () ValueCell!9923)

(declare-fun mapRest!33157 () (Array (_ BitVec 32) ValueCell!9923))

(declare-fun mapKey!33157 () (_ BitVec 32))

(assert (=> mapNonEmpty!33157 (= (arr!27718 (_values!5856 thiss!1141)) (store mapRest!33157 mapKey!33157 mapValue!33157))))

(declare-fun e!536701 () Bool)

(declare-fun array_inv!21510 (array!57658) Bool)

(declare-fun array_inv!21511 (array!57656) Bool)

(assert (=> b!952946 (= e!536699 (and tp!63530 tp_is_empty!20809 (array_inv!21510 (_keys!10792 thiss!1141)) (array_inv!21511 (_values!5856 thiss!1141)) e!536701))))

(declare-fun b!952947 () Bool)

(declare-fun res!638299 () Bool)

(assert (=> b!952947 (=> (not res!638299) (not e!536700))))

(declare-datatypes ((SeekEntryResult!9164 0))(
  ( (MissingZero!9164 (index!39027 (_ BitVec 32))) (Found!9164 (index!39028 (_ BitVec 32))) (Intermediate!9164 (undefined!9976 Bool) (index!39029 (_ BitVec 32)) (x!81978 (_ BitVec 32))) (Undefined!9164) (MissingVacant!9164 (index!39030 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57658 (_ BitVec 32)) SeekEntryResult!9164)

(assert (=> b!952947 (= res!638299 (not (is-Found!9164 (seekEntry!0 key!756 (_keys!10792 thiss!1141) (mask!27694 thiss!1141)))))))

(declare-fun b!952948 () Bool)

(assert (=> b!952948 (= e!536698 tp_is_empty!20809)))

(declare-fun b!952949 () Bool)

(assert (=> b!952949 (= e!536701 (and e!536702 mapRes!33157))))

(declare-fun condMapEmpty!33157 () Bool)

(declare-fun mapDefault!33157 () ValueCell!9923)

