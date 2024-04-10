; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80170 () Bool)

(assert start!80170)

(declare-fun b!942003 () Bool)

(declare-fun b_free!17933 () Bool)

(declare-fun b_next!17933 () Bool)

(assert (=> b!942003 (= b_free!17933 (not b_next!17933))))

(declare-fun tp!62291 () Bool)

(declare-fun b_and!29345 () Bool)

(assert (=> b!942003 (= tp!62291 b_and!29345)))

(declare-fun e!529631 () Bool)

(declare-datatypes ((V!32219 0))(
  ( (V!32220 (val!10271 Int)) )
))
(declare-datatypes ((ValueCell!9739 0))(
  ( (ValueCellFull!9739 (v!12802 V!32219)) (EmptyCell!9739) )
))
(declare-datatypes ((array!56840 0))(
  ( (array!56841 (arr!27350 (Array (_ BitVec 32) ValueCell!9739)) (size!27814 (_ BitVec 32))) )
))
(declare-datatypes ((array!56842 0))(
  ( (array!56843 (arr!27351 (Array (_ BitVec 32) (_ BitVec 64))) (size!27815 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4628 0))(
  ( (LongMapFixedSize!4629 (defaultEntry!5605 Int) (mask!27194 (_ BitVec 32)) (extraKeys!5337 (_ BitVec 32)) (zeroValue!5441 V!32219) (minValue!5441 V!32219) (_size!2369 (_ BitVec 32)) (_keys!10469 array!56842) (_values!5628 array!56840) (_vacant!2369 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4628)

(declare-fun tp_is_empty!20441 () Bool)

(declare-fun e!529629 () Bool)

(declare-fun array_inv!21252 (array!56842) Bool)

(declare-fun array_inv!21253 (array!56840) Bool)

(assert (=> b!942003 (= e!529629 (and tp!62291 tp_is_empty!20441 (array_inv!21252 (_keys!10469 thiss!1141)) (array_inv!21253 (_values!5628 thiss!1141)) e!529631))))

(declare-fun mapIsEmpty!32470 () Bool)

(declare-fun mapRes!32470 () Bool)

(assert (=> mapIsEmpty!32470 mapRes!32470))

(declare-fun b!942004 () Bool)

(declare-fun res!633108 () Bool)

(declare-fun e!529632 () Bool)

(assert (=> b!942004 (=> (not res!633108) (not e!529632))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9028 0))(
  ( (MissingZero!9028 (index!38483 (_ BitVec 32))) (Found!9028 (index!38484 (_ BitVec 32))) (Intermediate!9028 (undefined!9840 Bool) (index!38485 (_ BitVec 32)) (x!80860 (_ BitVec 32))) (Undefined!9028) (MissingVacant!9028 (index!38486 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56842 (_ BitVec 32)) SeekEntryResult!9028)

(assert (=> b!942004 (= res!633108 (not (is-Found!9028 (seekEntry!0 key!756 (_keys!10469 thiss!1141) (mask!27194 thiss!1141)))))))

(declare-fun b!942005 () Bool)

(declare-fun res!633107 () Bool)

(assert (=> b!942005 (=> (not res!633107) (not e!529632))))

(assert (=> b!942005 (= res!633107 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942006 () Bool)

(declare-fun e!529633 () Bool)

(assert (=> b!942006 (= e!529633 tp_is_empty!20441)))

(declare-fun mapNonEmpty!32470 () Bool)

(declare-fun tp!62292 () Bool)

(assert (=> mapNonEmpty!32470 (= mapRes!32470 (and tp!62292 e!529633))))

(declare-fun mapValue!32470 () ValueCell!9739)

(declare-fun mapKey!32470 () (_ BitVec 32))

(declare-fun mapRest!32470 () (Array (_ BitVec 32) ValueCell!9739))

(assert (=> mapNonEmpty!32470 (= (arr!27350 (_values!5628 thiss!1141)) (store mapRest!32470 mapKey!32470 mapValue!32470))))

(declare-fun b!942007 () Bool)

(assert (=> b!942007 (= e!529632 (and (= (size!27814 (_values!5628 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27194 thiss!1141))) (= (size!27815 (_keys!10469 thiss!1141)) (size!27814 (_values!5628 thiss!1141))) (bvsge (mask!27194 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5337 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5337 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942008 () Bool)

(declare-fun e!529630 () Bool)

(assert (=> b!942008 (= e!529631 (and e!529630 mapRes!32470))))

(declare-fun condMapEmpty!32470 () Bool)

(declare-fun mapDefault!32470 () ValueCell!9739)

