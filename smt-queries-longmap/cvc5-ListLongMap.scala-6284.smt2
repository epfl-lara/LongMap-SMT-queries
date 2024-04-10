; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80382 () Bool)

(assert start!80382)

(declare-fun b!944056 () Bool)

(declare-fun b_free!18025 () Bool)

(declare-fun b_next!18025 () Bool)

(assert (=> b!944056 (= b_free!18025 (not b_next!18025))))

(declare-fun tp!62584 () Bool)

(declare-fun b_and!29443 () Bool)

(assert (=> b!944056 (= tp!62584 b_and!29443)))

(declare-fun b!944055 () Bool)

(declare-fun res!634220 () Bool)

(declare-fun e!530841 () Bool)

(assert (=> b!944055 (=> (not res!634220) (not e!530841))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32343 0))(
  ( (V!32344 (val!10317 Int)) )
))
(declare-datatypes ((ValueCell!9785 0))(
  ( (ValueCellFull!9785 (v!12849 V!32343)) (EmptyCell!9785) )
))
(declare-datatypes ((array!57034 0))(
  ( (array!57035 (arr!27442 (Array (_ BitVec 32) ValueCell!9785)) (size!27908 (_ BitVec 32))) )
))
(declare-datatypes ((array!57036 0))(
  ( (array!57037 (arr!27443 (Array (_ BitVec 32) (_ BitVec 64))) (size!27909 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4720 0))(
  ( (LongMapFixedSize!4721 (defaultEntry!5655 Int) (mask!27297 (_ BitVec 32)) (extraKeys!5387 (_ BitVec 32)) (zeroValue!5491 V!32343) (minValue!5491 V!32343) (_size!2415 (_ BitVec 32)) (_keys!10533 array!57036) (_values!5678 array!57034) (_vacant!2415 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4720)

(declare-datatypes ((SeekEntryResult!9058 0))(
  ( (MissingZero!9058 (index!38603 (_ BitVec 32))) (Found!9058 (index!38604 (_ BitVec 32))) (Intermediate!9058 (undefined!9870 Bool) (index!38605 (_ BitVec 32)) (x!81077 (_ BitVec 32))) (Undefined!9058) (MissingVacant!9058 (index!38606 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57036 (_ BitVec 32)) SeekEntryResult!9058)

(assert (=> b!944055 (= res!634220 (not (is-Found!9058 (seekEntry!0 key!756 (_keys!10533 thiss!1141) (mask!27297 thiss!1141)))))))

(declare-fun tp_is_empty!20533 () Bool)

(declare-fun e!530843 () Bool)

(declare-fun e!530845 () Bool)

(declare-fun array_inv!21322 (array!57036) Bool)

(declare-fun array_inv!21323 (array!57034) Bool)

(assert (=> b!944056 (= e!530843 (and tp!62584 tp_is_empty!20533 (array_inv!21322 (_keys!10533 thiss!1141)) (array_inv!21323 (_values!5678 thiss!1141)) e!530845))))

(declare-fun b!944057 () Bool)

(declare-fun res!634216 () Bool)

(assert (=> b!944057 (=> (not res!634216) (not e!530841))))

(assert (=> b!944057 (= res!634216 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944058 () Bool)

(declare-fun e!530840 () Bool)

(assert (=> b!944058 (= e!530840 tp_is_empty!20533)))

(declare-fun mapNonEmpty!32625 () Bool)

(declare-fun mapRes!32625 () Bool)

(declare-fun tp!62585 () Bool)

(declare-fun e!530844 () Bool)

(assert (=> mapNonEmpty!32625 (= mapRes!32625 (and tp!62585 e!530844))))

(declare-fun mapKey!32625 () (_ BitVec 32))

(declare-fun mapValue!32625 () ValueCell!9785)

(declare-fun mapRest!32625 () (Array (_ BitVec 32) ValueCell!9785))

(assert (=> mapNonEmpty!32625 (= (arr!27442 (_values!5678 thiss!1141)) (store mapRest!32625 mapKey!32625 mapValue!32625))))

(declare-fun b!944059 () Bool)

(declare-fun e!530842 () Bool)

(assert (=> b!944059 (= e!530842 true)))

(declare-fun lt!425513 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57036 (_ BitVec 32)) Bool)

(assert (=> b!944059 (= lt!425513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10533 thiss!1141) (mask!27297 thiss!1141)))))

(declare-fun b!944060 () Bool)

(declare-fun res!634218 () Bool)

(assert (=> b!944060 (=> res!634218 e!530842)))

(declare-fun lt!425514 () (_ BitVec 32))

(assert (=> b!944060 (= res!634218 (or (not (= (size!27909 (_keys!10533 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27297 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27909 (_keys!10533 thiss!1141))) (bvslt lt!425514 #b00000000000000000000000000000000) (bvsgt lt!425514 (size!27909 (_keys!10533 thiss!1141)))))))

(declare-fun b!944061 () Bool)

(assert (=> b!944061 (= e!530844 tp_is_empty!20533)))

(declare-fun res!634219 () Bool)

(assert (=> start!80382 (=> (not res!634219) (not e!530841))))

(declare-fun valid!1803 (LongMapFixedSize!4720) Bool)

(assert (=> start!80382 (= res!634219 (valid!1803 thiss!1141))))

(assert (=> start!80382 e!530841))

(assert (=> start!80382 e!530843))

(assert (=> start!80382 true))

(declare-fun mapIsEmpty!32625 () Bool)

(assert (=> mapIsEmpty!32625 mapRes!32625))

(declare-fun b!944062 () Bool)

(assert (=> b!944062 (= e!530845 (and e!530840 mapRes!32625))))

(declare-fun condMapEmpty!32625 () Bool)

(declare-fun mapDefault!32625 () ValueCell!9785)

