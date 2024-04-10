; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80200 () Bool)

(assert start!80200)

(declare-fun b!942220 () Bool)

(declare-fun b_free!17939 () Bool)

(declare-fun b_next!17939 () Bool)

(assert (=> b!942220 (= b_free!17939 (not b_next!17939))))

(declare-fun tp!62314 () Bool)

(declare-fun b_and!29351 () Bool)

(assert (=> b!942220 (= tp!62314 b_and!29351)))

(declare-fun b!942216 () Bool)

(declare-fun res!633197 () Bool)

(declare-fun e!529758 () Bool)

(assert (=> b!942216 (=> (not res!633197) (not e!529758))))

(declare-datatypes ((V!32227 0))(
  ( (V!32228 (val!10274 Int)) )
))
(declare-datatypes ((ValueCell!9742 0))(
  ( (ValueCellFull!9742 (v!12805 V!32227)) (EmptyCell!9742) )
))
(declare-datatypes ((array!56854 0))(
  ( (array!56855 (arr!27356 (Array (_ BitVec 32) ValueCell!9742)) (size!27821 (_ BitVec 32))) )
))
(declare-datatypes ((array!56856 0))(
  ( (array!56857 (arr!27357 (Array (_ BitVec 32) (_ BitVec 64))) (size!27822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4634 0))(
  ( (LongMapFixedSize!4635 (defaultEntry!5608 Int) (mask!27205 (_ BitVec 32)) (extraKeys!5340 (_ BitVec 32)) (zeroValue!5444 V!32227) (minValue!5444 V!32227) (_size!2372 (_ BitVec 32)) (_keys!10476 array!56856) (_values!5631 array!56854) (_vacant!2372 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4634)

(assert (=> b!942216 (= res!633197 (and (= (size!27821 (_values!5631 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27205 thiss!1141))) (= (size!27822 (_keys!10476 thiss!1141)) (size!27821 (_values!5631 thiss!1141))) (bvsge (mask!27205 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5340 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5340 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942217 () Bool)

(declare-fun e!529757 () Bool)

(declare-fun tp_is_empty!20447 () Bool)

(assert (=> b!942217 (= e!529757 tp_is_empty!20447)))

(declare-fun b!942218 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56856 (_ BitVec 32)) Bool)

(assert (=> b!942218 (= e!529758 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10476 thiss!1141) (mask!27205 thiss!1141))))))

(declare-fun b!942219 () Bool)

(declare-fun e!529761 () Bool)

(assert (=> b!942219 (= e!529761 tp_is_empty!20447)))

(declare-fun res!633200 () Bool)

(assert (=> start!80200 (=> (not res!633200) (not e!529758))))

(declare-fun valid!1773 (LongMapFixedSize!4634) Bool)

(assert (=> start!80200 (= res!633200 (valid!1773 thiss!1141))))

(assert (=> start!80200 e!529758))

(declare-fun e!529756 () Bool)

(assert (=> start!80200 e!529756))

(assert (=> start!80200 true))

(declare-fun e!529759 () Bool)

(declare-fun array_inv!21256 (array!56856) Bool)

(declare-fun array_inv!21257 (array!56854) Bool)

(assert (=> b!942220 (= e!529756 (and tp!62314 tp_is_empty!20447 (array_inv!21256 (_keys!10476 thiss!1141)) (array_inv!21257 (_values!5631 thiss!1141)) e!529759))))

(declare-fun mapNonEmpty!32483 () Bool)

(declare-fun mapRes!32483 () Bool)

(declare-fun tp!62313 () Bool)

(assert (=> mapNonEmpty!32483 (= mapRes!32483 (and tp!62313 e!529757))))

(declare-fun mapKey!32483 () (_ BitVec 32))

(declare-fun mapValue!32483 () ValueCell!9742)

(declare-fun mapRest!32483 () (Array (_ BitVec 32) ValueCell!9742))

(assert (=> mapNonEmpty!32483 (= (arr!27356 (_values!5631 thiss!1141)) (store mapRest!32483 mapKey!32483 mapValue!32483))))

(declare-fun mapIsEmpty!32483 () Bool)

(assert (=> mapIsEmpty!32483 mapRes!32483))

(declare-fun b!942221 () Bool)

(declare-fun res!633199 () Bool)

(assert (=> b!942221 (=> (not res!633199) (not e!529758))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9030 0))(
  ( (MissingZero!9030 (index!38491 (_ BitVec 32))) (Found!9030 (index!38492 (_ BitVec 32))) (Intermediate!9030 (undefined!9842 Bool) (index!38493 (_ BitVec 32)) (x!80887 (_ BitVec 32))) (Undefined!9030) (MissingVacant!9030 (index!38494 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56856 (_ BitVec 32)) SeekEntryResult!9030)

(assert (=> b!942221 (= res!633199 (not (is-Found!9030 (seekEntry!0 key!756 (_keys!10476 thiss!1141) (mask!27205 thiss!1141)))))))

(declare-fun b!942222 () Bool)

(declare-fun res!633198 () Bool)

(assert (=> b!942222 (=> (not res!633198) (not e!529758))))

(assert (=> b!942222 (= res!633198 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942223 () Bool)

(declare-fun res!633196 () Bool)

(assert (=> b!942223 (=> (not res!633196) (not e!529758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942223 (= res!633196 (validMask!0 (mask!27205 thiss!1141)))))

(declare-fun b!942224 () Bool)

(assert (=> b!942224 (= e!529759 (and e!529761 mapRes!32483))))

(declare-fun condMapEmpty!32483 () Bool)

(declare-fun mapDefault!32483 () ValueCell!9742)

