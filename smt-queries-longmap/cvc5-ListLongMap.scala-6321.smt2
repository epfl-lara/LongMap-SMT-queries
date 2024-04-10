; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81232 () Bool)

(assert start!81232)

(declare-fun b!950491 () Bool)

(declare-fun b_free!18247 () Bool)

(declare-fun b_next!18247 () Bool)

(assert (=> b!950491 (= b_free!18247 (not b_next!18247))))

(declare-fun tp!63339 () Bool)

(declare-fun b_and!29705 () Bool)

(assert (=> b!950491 (= tp!63339 b_and!29705)))

(declare-fun b!950488 () Bool)

(declare-fun res!637225 () Bool)

(declare-fun e!535147 () Bool)

(assert (=> b!950488 (=> (not res!637225) (not e!535147))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32639 0))(
  ( (V!32640 (val!10428 Int)) )
))
(declare-datatypes ((ValueCell!9896 0))(
  ( (ValueCellFull!9896 (v!12972 V!32639)) (EmptyCell!9896) )
))
(declare-datatypes ((array!57530 0))(
  ( (array!57531 (arr!27664 (Array (_ BitVec 32) ValueCell!9896)) (size!28141 (_ BitVec 32))) )
))
(declare-datatypes ((array!57532 0))(
  ( (array!57533 (arr!27665 (Array (_ BitVec 32) (_ BitVec 64))) (size!28142 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4942 0))(
  ( (LongMapFixedSize!4943 (defaultEntry!5784 Int) (mask!27588 (_ BitVec 32)) (extraKeys!5516 (_ BitVec 32)) (zeroValue!5620 V!32639) (minValue!5620 V!32639) (_size!2526 (_ BitVec 32)) (_keys!10721 array!57532) (_values!5807 array!57530) (_vacant!2526 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4942)

(declare-datatypes ((SeekEntryResult!9143 0))(
  ( (MissingZero!9143 (index!38943 (_ BitVec 32))) (Found!9143 (index!38944 (_ BitVec 32))) (Intermediate!9143 (undefined!9955 Bool) (index!38945 (_ BitVec 32)) (x!81779 (_ BitVec 32))) (Undefined!9143) (MissingVacant!9143 (index!38946 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57532 (_ BitVec 32)) SeekEntryResult!9143)

(assert (=> b!950488 (= res!637225 (not (is-Found!9143 (seekEntry!0 key!756 (_keys!10721 thiss!1141) (mask!27588 thiss!1141)))))))

(declare-fun b!950489 () Bool)

(declare-fun res!637228 () Bool)

(assert (=> b!950489 (=> (not res!637228) (not e!535147))))

(assert (=> b!950489 (= res!637228 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950490 () Bool)

(declare-fun e!535148 () Bool)

(declare-fun tp_is_empty!20755 () Bool)

(assert (=> b!950490 (= e!535148 tp_is_empty!20755)))

(declare-fun e!535143 () Bool)

(declare-fun e!535145 () Bool)

(declare-fun array_inv!21472 (array!57532) Bool)

(declare-fun array_inv!21473 (array!57530) Bool)

(assert (=> b!950491 (= e!535143 (and tp!63339 tp_is_empty!20755 (array_inv!21472 (_keys!10721 thiss!1141)) (array_inv!21473 (_values!5807 thiss!1141)) e!535145))))

(declare-fun b!950492 () Bool)

(declare-fun e!535149 () Bool)

(assert (=> b!950492 (= e!535147 (not e!535149))))

(declare-fun res!637226 () Bool)

(assert (=> b!950492 (=> res!637226 e!535149)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950492 (= res!637226 (not (validMask!0 (mask!27588 thiss!1141))))))

(declare-fun lt!428058 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57532 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950492 (= lt!428058 (arrayScanForKey!0 (_keys!10721 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950492 (arrayContainsKey!0 (_keys!10721 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31993 0))(
  ( (Unit!31994) )
))
(declare-fun lt!428057 () Unit!31993)

(declare-fun lemmaKeyInListMapIsInArray!320 (array!57532 array!57530 (_ BitVec 32) (_ BitVec 32) V!32639 V!32639 (_ BitVec 64) Int) Unit!31993)

(assert (=> b!950492 (= lt!428057 (lemmaKeyInListMapIsInArray!320 (_keys!10721 thiss!1141) (_values!5807 thiss!1141) (mask!27588 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) key!756 (defaultEntry!5784 thiss!1141)))))

(declare-fun b!950493 () Bool)

(declare-fun mapRes!33047 () Bool)

(assert (=> b!950493 (= e!535145 (and e!535148 mapRes!33047))))

(declare-fun condMapEmpty!33047 () Bool)

(declare-fun mapDefault!33047 () ValueCell!9896)

