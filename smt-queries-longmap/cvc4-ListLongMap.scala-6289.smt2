; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80416 () Bool)

(assert start!80416)

(declare-fun b!944609 () Bool)

(declare-fun b_free!18059 () Bool)

(declare-fun b_next!18059 () Bool)

(assert (=> b!944609 (= b_free!18059 (not b_next!18059))))

(declare-fun tp!62687 () Bool)

(declare-fun b_and!29477 () Bool)

(assert (=> b!944609 (= tp!62687 b_and!29477)))

(declare-fun b!944599 () Bool)

(declare-fun res!634558 () Bool)

(declare-fun e!531202 () Bool)

(assert (=> b!944599 (=> (not res!634558) (not e!531202))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32387 0))(
  ( (V!32388 (val!10334 Int)) )
))
(declare-datatypes ((ValueCell!9802 0))(
  ( (ValueCellFull!9802 (v!12866 V!32387)) (EmptyCell!9802) )
))
(declare-datatypes ((array!57102 0))(
  ( (array!57103 (arr!27476 (Array (_ BitVec 32) ValueCell!9802)) (size!27942 (_ BitVec 32))) )
))
(declare-datatypes ((array!57104 0))(
  ( (array!57105 (arr!27477 (Array (_ BitVec 32) (_ BitVec 64))) (size!27943 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4754 0))(
  ( (LongMapFixedSize!4755 (defaultEntry!5672 Int) (mask!27324 (_ BitVec 32)) (extraKeys!5404 (_ BitVec 32)) (zeroValue!5508 V!32387) (minValue!5508 V!32387) (_size!2432 (_ BitVec 32)) (_keys!10550 array!57104) (_values!5695 array!57102) (_vacant!2432 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4754)

(declare-datatypes ((SeekEntryResult!9071 0))(
  ( (MissingZero!9071 (index!38655 (_ BitVec 32))) (Found!9071 (index!38656 (_ BitVec 32))) (Intermediate!9071 (undefined!9883 Bool) (index!38657 (_ BitVec 32)) (x!81130 (_ BitVec 32))) (Undefined!9071) (MissingVacant!9071 (index!38658 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57104 (_ BitVec 32)) SeekEntryResult!9071)

(assert (=> b!944599 (= res!634558 (not (is-Found!9071 (seekEntry!0 key!756 (_keys!10550 thiss!1141) (mask!27324 thiss!1141)))))))

(declare-fun b!944600 () Bool)

(declare-fun e!531196 () Bool)

(assert (=> b!944600 (= e!531202 (not e!531196))))

(declare-fun res!634563 () Bool)

(assert (=> b!944600 (=> res!634563 e!531196)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944600 (= res!634563 (not (validMask!0 (mask!27324 thiss!1141))))))

(declare-fun lt!425685 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57104 (_ BitVec 32)) Bool)

(assert (=> b!944600 (arrayForallSeekEntryOrOpenFound!0 lt!425685 (_keys!10550 thiss!1141) (mask!27324 thiss!1141))))

(declare-datatypes ((Unit!31858 0))(
  ( (Unit!31859) )
))
(declare-fun lt!425683 () Unit!31858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31858)

(assert (=> b!944600 (= lt!425683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10550 thiss!1141) (mask!27324 thiss!1141) #b00000000000000000000000000000000 lt!425685))))

(declare-fun arrayScanForKey!0 (array!57104 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944600 (= lt!425685 (arrayScanForKey!0 (_keys!10550 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944600 (arrayContainsKey!0 (_keys!10550 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425682 () Unit!31858)

(declare-fun lemmaKeyInListMapIsInArray!309 (array!57104 array!57102 (_ BitVec 32) (_ BitVec 32) V!32387 V!32387 (_ BitVec 64) Int) Unit!31858)

(assert (=> b!944600 (= lt!425682 (lemmaKeyInListMapIsInArray!309 (_keys!10550 thiss!1141) (_values!5695 thiss!1141) (mask!27324 thiss!1141) (extraKeys!5404 thiss!1141) (zeroValue!5508 thiss!1141) (minValue!5508 thiss!1141) key!756 (defaultEntry!5672 thiss!1141)))))

(declare-fun b!944601 () Bool)

(declare-fun res!634556 () Bool)

(assert (=> b!944601 (=> res!634556 e!531196)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944601 (= res!634556 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944602 () Bool)

(declare-fun res!634560 () Bool)

(assert (=> b!944602 (=> res!634560 e!531196)))

(assert (=> b!944602 (= res!634560 (not (= (size!27943 (_keys!10550 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27324 thiss!1141)))))))

(declare-fun mapIsEmpty!32676 () Bool)

(declare-fun mapRes!32676 () Bool)

(assert (=> mapIsEmpty!32676 mapRes!32676))

(declare-fun res!634562 () Bool)

(assert (=> start!80416 (=> (not res!634562) (not e!531202))))

(declare-fun valid!1818 (LongMapFixedSize!4754) Bool)

(assert (=> start!80416 (= res!634562 (valid!1818 thiss!1141))))

(assert (=> start!80416 e!531202))

(declare-fun e!531197 () Bool)

(assert (=> start!80416 e!531197))

(assert (=> start!80416 true))

(declare-fun b!944603 () Bool)

(declare-fun res!634561 () Bool)

(assert (=> b!944603 (=> (not res!634561) (not e!531202))))

(declare-datatypes ((tuple2!13486 0))(
  ( (tuple2!13487 (_1!6754 (_ BitVec 64)) (_2!6754 V!32387)) )
))
(declare-datatypes ((List!19277 0))(
  ( (Nil!19274) (Cons!19273 (h!20424 tuple2!13486) (t!27594 List!19277)) )
))
(declare-datatypes ((ListLongMap!12183 0))(
  ( (ListLongMap!12184 (toList!6107 List!19277)) )
))
(declare-fun contains!5179 (ListLongMap!12183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3341 (array!57104 array!57102 (_ BitVec 32) (_ BitVec 32) V!32387 V!32387 (_ BitVec 32) Int) ListLongMap!12183)

(assert (=> b!944603 (= res!634561 (contains!5179 (getCurrentListMap!3341 (_keys!10550 thiss!1141) (_values!5695 thiss!1141) (mask!27324 thiss!1141) (extraKeys!5404 thiss!1141) (zeroValue!5508 thiss!1141) (minValue!5508 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5672 thiss!1141)) key!756))))

(declare-fun b!944604 () Bool)

(declare-fun e!531198 () Bool)

(declare-fun tp_is_empty!20567 () Bool)

(assert (=> b!944604 (= e!531198 tp_is_empty!20567)))

(declare-fun b!944605 () Bool)

(declare-fun e!531199 () Bool)

(assert (=> b!944605 (= e!531199 tp_is_empty!20567)))

(declare-fun b!944606 () Bool)

(declare-fun res!634557 () Bool)

(assert (=> b!944606 (=> (not res!634557) (not e!531202))))

(assert (=> b!944606 (= res!634557 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32676 () Bool)

(declare-fun tp!62686 () Bool)

(assert (=> mapNonEmpty!32676 (= mapRes!32676 (and tp!62686 e!531199))))

(declare-fun mapValue!32676 () ValueCell!9802)

(declare-fun mapRest!32676 () (Array (_ BitVec 32) ValueCell!9802))

(declare-fun mapKey!32676 () (_ BitVec 32))

(assert (=> mapNonEmpty!32676 (= (arr!27476 (_values!5695 thiss!1141)) (store mapRest!32676 mapKey!32676 mapValue!32676))))

(declare-fun b!944607 () Bool)

(declare-fun e!531201 () Bool)

(assert (=> b!944607 (= e!531201 (and e!531198 mapRes!32676))))

(declare-fun condMapEmpty!32676 () Bool)

(declare-fun mapDefault!32676 () ValueCell!9802)

