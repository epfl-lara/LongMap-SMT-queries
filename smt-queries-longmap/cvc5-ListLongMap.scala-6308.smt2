; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80814 () Bool)

(assert start!80814)

(declare-fun b!947306 () Bool)

(declare-fun b_free!18169 () Bool)

(declare-fun b_next!18169 () Bool)

(assert (=> b!947306 (= b_free!18169 (not b_next!18169))))

(declare-fun tp!63065 () Bool)

(declare-fun b_and!29591 () Bool)

(assert (=> b!947306 (= tp!63065 b_and!29591)))

(declare-fun tp_is_empty!20677 () Bool)

(declare-fun e!533163 () Bool)

(declare-datatypes ((V!32535 0))(
  ( (V!32536 (val!10389 Int)) )
))
(declare-datatypes ((ValueCell!9857 0))(
  ( (ValueCellFull!9857 (v!12923 V!32535)) (EmptyCell!9857) )
))
(declare-datatypes ((array!57350 0))(
  ( (array!57351 (arr!27586 (Array (_ BitVec 32) ValueCell!9857)) (size!28059 (_ BitVec 32))) )
))
(declare-datatypes ((array!57352 0))(
  ( (array!57353 (arr!27587 (Array (_ BitVec 32) (_ BitVec 64))) (size!28060 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4864 0))(
  ( (LongMapFixedSize!4865 (defaultEntry!5729 Int) (mask!27464 (_ BitVec 32)) (extraKeys!5461 (_ BitVec 32)) (zeroValue!5565 V!32535) (minValue!5565 V!32535) (_size!2487 (_ BitVec 32)) (_keys!10638 array!57352) (_values!5752 array!57350) (_vacant!2487 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4864)

(declare-fun e!533166 () Bool)

(declare-fun array_inv!21414 (array!57352) Bool)

(declare-fun array_inv!21415 (array!57350) Bool)

(assert (=> b!947306 (= e!533163 (and tp!63065 tp_is_empty!20677 (array_inv!21414 (_keys!10638 thiss!1141)) (array_inv!21415 (_values!5752 thiss!1141)) e!533166))))

(declare-fun b!947307 () Bool)

(declare-fun res!635775 () Bool)

(declare-fun e!533167 () Bool)

(assert (=> b!947307 (=> (not res!635775) (not e!533167))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!947307 (= res!635775 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32890 () Bool)

(declare-fun mapRes!32890 () Bool)

(declare-fun tp!63066 () Bool)

(declare-fun e!533161 () Bool)

(assert (=> mapNonEmpty!32890 (= mapRes!32890 (and tp!63066 e!533161))))

(declare-fun mapValue!32890 () ValueCell!9857)

(declare-fun mapKey!32890 () (_ BitVec 32))

(declare-fun mapRest!32890 () (Array (_ BitVec 32) ValueCell!9857))

(assert (=> mapNonEmpty!32890 (= (arr!27586 (_values!5752 thiss!1141)) (store mapRest!32890 mapKey!32890 mapValue!32890))))

(declare-fun b!947308 () Bool)

(declare-fun e!533164 () Bool)

(declare-fun e!533168 () Bool)

(assert (=> b!947308 (= e!533164 (not e!533168))))

(declare-fun res!635773 () Bool)

(assert (=> b!947308 (=> res!635773 e!533168)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947308 (= res!635773 (not (validMask!0 (mask!27464 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947308 (arrayContainsKey!0 (_keys!10638 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9112 0))(
  ( (MissingZero!9112 (index!38819 (_ BitVec 32))) (Found!9112 (index!38820 (_ BitVec 32))) (Intermediate!9112 (undefined!9924 Bool) (index!38821 (_ BitVec 32)) (x!81496 (_ BitVec 32))) (Undefined!9112) (MissingVacant!9112 (index!38822 (_ BitVec 32))) )
))
(declare-fun lt!426545 () SeekEntryResult!9112)

(declare-datatypes ((Unit!31920 0))(
  ( (Unit!31921) )
))
(declare-fun lt!426546 () Unit!31920)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57352 (_ BitVec 64) (_ BitVec 32)) Unit!31920)

(assert (=> b!947308 (= lt!426546 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10638 thiss!1141) key!756 (index!38820 lt!426545)))))

(declare-fun b!947309 () Bool)

(assert (=> b!947309 (= e!533161 tp_is_empty!20677)))

(declare-fun b!947310 () Bool)

(declare-fun e!533162 () Bool)

(assert (=> b!947310 (= e!533162 tp_is_empty!20677)))

(declare-fun b!947311 () Bool)

(declare-fun res!635771 () Bool)

(assert (=> b!947311 (=> res!635771 e!533168)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57352 (_ BitVec 32)) Bool)

(assert (=> b!947311 (= res!635771 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10638 thiss!1141) (mask!27464 thiss!1141))))))

(declare-fun b!947312 () Bool)

(declare-fun res!635776 () Bool)

(assert (=> b!947312 (=> res!635776 e!533168)))

(declare-datatypes ((List!19304 0))(
  ( (Nil!19301) (Cons!19300 (h!20456 (_ BitVec 64)) (t!27625 List!19304)) )
))
(declare-fun arrayNoDuplicates!0 (array!57352 (_ BitVec 32) List!19304) Bool)

(assert (=> b!947312 (= res!635776 (not (arrayNoDuplicates!0 (_keys!10638 thiss!1141) #b00000000000000000000000000000000 Nil!19301)))))

(declare-fun res!635770 () Bool)

(assert (=> start!80814 (=> (not res!635770) (not e!533167))))

(declare-fun valid!1853 (LongMapFixedSize!4864) Bool)

(assert (=> start!80814 (= res!635770 (valid!1853 thiss!1141))))

(assert (=> start!80814 e!533167))

(assert (=> start!80814 e!533163))

(assert (=> start!80814 true))

(declare-fun b!947313 () Bool)

(assert (=> b!947313 (= e!533167 e!533164)))

(declare-fun res!635772 () Bool)

(assert (=> b!947313 (=> (not res!635772) (not e!533164))))

(assert (=> b!947313 (= res!635772 (is-Found!9112 lt!426545))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57352 (_ BitVec 32)) SeekEntryResult!9112)

(assert (=> b!947313 (= lt!426545 (seekEntry!0 key!756 (_keys!10638 thiss!1141) (mask!27464 thiss!1141)))))

(declare-fun b!947314 () Bool)

(declare-fun res!635774 () Bool)

(assert (=> b!947314 (=> res!635774 e!533168)))

(assert (=> b!947314 (= res!635774 (or (not (= (size!28059 (_values!5752 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27464 thiss!1141)))) (not (= (size!28060 (_keys!10638 thiss!1141)) (size!28059 (_values!5752 thiss!1141)))) (bvslt (mask!27464 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5461 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5461 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947315 () Bool)

(assert (=> b!947315 (= e!533168 (and (bvsge (index!38820 lt!426545) #b00000000000000000000000000000000) (bvslt (index!38820 lt!426545) (size!28060 (_keys!10638 thiss!1141)))))))

(declare-fun b!947316 () Bool)

(assert (=> b!947316 (= e!533166 (and e!533162 mapRes!32890))))

(declare-fun condMapEmpty!32890 () Bool)

(declare-fun mapDefault!32890 () ValueCell!9857)

