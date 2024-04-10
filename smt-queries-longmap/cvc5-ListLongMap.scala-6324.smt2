; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81348 () Bool)

(assert start!81348)

(declare-fun b!951321 () Bool)

(declare-fun b_free!18265 () Bool)

(declare-fun b_next!18265 () Bool)

(assert (=> b!951321 (= b_free!18265 (not b_next!18265))))

(declare-fun tp!63403 () Bool)

(declare-fun b_and!29733 () Bool)

(assert (=> b!951321 (= tp!63403 b_and!29733)))

(declare-fun b!951320 () Bool)

(declare-fun res!637582 () Bool)

(declare-fun e!535679 () Bool)

(assert (=> b!951320 (=> res!637582 e!535679)))

(declare-datatypes ((V!32663 0))(
  ( (V!32664 (val!10437 Int)) )
))
(declare-datatypes ((ValueCell!9905 0))(
  ( (ValueCellFull!9905 (v!12984 V!32663)) (EmptyCell!9905) )
))
(declare-datatypes ((array!57572 0))(
  ( (array!57573 (arr!27682 (Array (_ BitVec 32) ValueCell!9905)) (size!28160 (_ BitVec 32))) )
))
(declare-datatypes ((array!57574 0))(
  ( (array!57575 (arr!27683 (Array (_ BitVec 32) (_ BitVec 64))) (size!28161 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4960 0))(
  ( (LongMapFixedSize!4961 (defaultEntry!5801 Int) (mask!27621 (_ BitVec 32)) (extraKeys!5533 (_ BitVec 32)) (zeroValue!5637 V!32663) (minValue!5637 V!32663) (_size!2535 (_ BitVec 32)) (_keys!10744 array!57574) (_values!5824 array!57572) (_vacant!2535 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4960)

(declare-fun lt!428511 () (_ BitVec 32))

(assert (=> b!951320 (= res!637582 (or (not (= (size!28161 (_keys!10744 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27621 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!28161 (_keys!10744 thiss!1141))) (bvslt lt!428511 #b00000000000000000000000000000000) (bvsgt lt!428511 (size!28161 (_keys!10744 thiss!1141)))))))

(declare-fun res!637586 () Bool)

(declare-fun e!535685 () Bool)

(assert (=> start!81348 (=> (not res!637586) (not e!535685))))

(declare-fun valid!1886 (LongMapFixedSize!4960) Bool)

(assert (=> start!81348 (= res!637586 (valid!1886 thiss!1141))))

(assert (=> start!81348 e!535685))

(declare-fun e!535682 () Bool)

(assert (=> start!81348 e!535682))

(assert (=> start!81348 true))

(declare-fun e!535680 () Bool)

(declare-fun tp_is_empty!20773 () Bool)

(declare-fun array_inv!21488 (array!57574) Bool)

(declare-fun array_inv!21489 (array!57572) Bool)

(assert (=> b!951321 (= e!535682 (and tp!63403 tp_is_empty!20773 (array_inv!21488 (_keys!10744 thiss!1141)) (array_inv!21489 (_values!5824 thiss!1141)) e!535680))))

(declare-fun b!951322 () Bool)

(declare-fun e!535684 () Bool)

(assert (=> b!951322 (= e!535684 tp_is_empty!20773)))

(declare-fun b!951323 () Bool)

(declare-fun res!637585 () Bool)

(assert (=> b!951323 (=> (not res!637585) (not e!535685))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13566 0))(
  ( (tuple2!13567 (_1!6794 (_ BitVec 64)) (_2!6794 V!32663)) )
))
(declare-datatypes ((List!19352 0))(
  ( (Nil!19349) (Cons!19348 (h!20509 tuple2!13566) (t!27699 List!19352)) )
))
(declare-datatypes ((ListLongMap!12263 0))(
  ( (ListLongMap!12264 (toList!6147 List!19352)) )
))
(declare-fun contains!5240 (ListLongMap!12263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3380 (array!57574 array!57572 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 32) Int) ListLongMap!12263)

(assert (=> b!951323 (= res!637585 (contains!5240 (getCurrentListMap!3380 (_keys!10744 thiss!1141) (_values!5824 thiss!1141) (mask!27621 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!33084 () Bool)

(declare-fun mapRes!33084 () Bool)

(assert (=> mapIsEmpty!33084 mapRes!33084))

(declare-fun b!951324 () Bool)

(assert (=> b!951324 (= e!535685 (not e!535679))))

(declare-fun res!637583 () Bool)

(assert (=> b!951324 (=> res!637583 e!535679)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951324 (= res!637583 (not (validMask!0 (mask!27621 thiss!1141))))))

(declare-fun arrayScanForKey!0 (array!57574 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951324 (= lt!428511 (arrayScanForKey!0 (_keys!10744 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951324 (arrayContainsKey!0 (_keys!10744 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!32015 0))(
  ( (Unit!32016) )
))
(declare-fun lt!428510 () Unit!32015)

(declare-fun lemmaKeyInListMapIsInArray!326 (array!57574 array!57572 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 64) Int) Unit!32015)

(assert (=> b!951324 (= lt!428510 (lemmaKeyInListMapIsInArray!326 (_keys!10744 thiss!1141) (_values!5824 thiss!1141) (mask!27621 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) key!756 (defaultEntry!5801 thiss!1141)))))

(declare-fun mapNonEmpty!33084 () Bool)

(declare-fun tp!63404 () Bool)

(declare-fun e!535681 () Bool)

(assert (=> mapNonEmpty!33084 (= mapRes!33084 (and tp!63404 e!535681))))

(declare-fun mapRest!33084 () (Array (_ BitVec 32) ValueCell!9905))

(declare-fun mapValue!33084 () ValueCell!9905)

(declare-fun mapKey!33084 () (_ BitVec 32))

(assert (=> mapNonEmpty!33084 (= (arr!27682 (_values!5824 thiss!1141)) (store mapRest!33084 mapKey!33084 mapValue!33084))))

(declare-fun b!951325 () Bool)

(declare-fun res!637581 () Bool)

(assert (=> b!951325 (=> (not res!637581) (not e!535685))))

(declare-datatypes ((SeekEntryResult!9151 0))(
  ( (MissingZero!9151 (index!38975 (_ BitVec 32))) (Found!9151 (index!38976 (_ BitVec 32))) (Intermediate!9151 (undefined!9963 Bool) (index!38977 (_ BitVec 32)) (x!81849 (_ BitVec 32))) (Undefined!9151) (MissingVacant!9151 (index!38978 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57574 (_ BitVec 32)) SeekEntryResult!9151)

(assert (=> b!951325 (= res!637581 (not (is-Found!9151 (seekEntry!0 key!756 (_keys!10744 thiss!1141) (mask!27621 thiss!1141)))))))

(declare-fun b!951326 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57574 (_ BitVec 32)) Bool)

(assert (=> b!951326 (= e!535679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10744 thiss!1141) (mask!27621 thiss!1141)))))

(declare-fun b!951327 () Bool)

(declare-fun res!637584 () Bool)

(assert (=> b!951327 (=> (not res!637584) (not e!535685))))

(assert (=> b!951327 (= res!637584 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951328 () Bool)

(assert (=> b!951328 (= e!535680 (and e!535684 mapRes!33084))))

(declare-fun condMapEmpty!33084 () Bool)

(declare-fun mapDefault!33084 () ValueCell!9905)

