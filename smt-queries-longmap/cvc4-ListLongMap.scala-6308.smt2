; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80818 () Bool)

(assert start!80818)

(declare-fun b!947379 () Bool)

(declare-fun b_free!18173 () Bool)

(declare-fun b_next!18173 () Bool)

(assert (=> b!947379 (= b_free!18173 (not b_next!18173))))

(declare-fun tp!63077 () Bool)

(declare-fun b_and!29595 () Bool)

(assert (=> b!947379 (= tp!63077 b_and!29595)))

(declare-fun b!947372 () Bool)

(declare-fun res!635817 () Bool)

(declare-fun e!533214 () Bool)

(assert (=> b!947372 (=> res!635817 e!533214)))

(declare-datatypes ((V!32539 0))(
  ( (V!32540 (val!10391 Int)) )
))
(declare-datatypes ((ValueCell!9859 0))(
  ( (ValueCellFull!9859 (v!12925 V!32539)) (EmptyCell!9859) )
))
(declare-datatypes ((array!57358 0))(
  ( (array!57359 (arr!27590 (Array (_ BitVec 32) ValueCell!9859)) (size!28063 (_ BitVec 32))) )
))
(declare-datatypes ((array!57360 0))(
  ( (array!57361 (arr!27591 (Array (_ BitVec 32) (_ BitVec 64))) (size!28064 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4868 0))(
  ( (LongMapFixedSize!4869 (defaultEntry!5731 Int) (mask!27466 (_ BitVec 32)) (extraKeys!5463 (_ BitVec 32)) (zeroValue!5567 V!32539) (minValue!5567 V!32539) (_size!2489 (_ BitVec 32)) (_keys!10640 array!57360) (_values!5754 array!57358) (_vacant!2489 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4868)

(assert (=> b!947372 (= res!635817 (or (not (= (size!28063 (_values!5754 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27466 thiss!1141)))) (not (= (size!28064 (_keys!10640 thiss!1141)) (size!28063 (_values!5754 thiss!1141)))) (bvslt (mask!27466 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5463 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5463 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947373 () Bool)

(declare-datatypes ((SeekEntryResult!9114 0))(
  ( (MissingZero!9114 (index!38827 (_ BitVec 32))) (Found!9114 (index!38828 (_ BitVec 32))) (Intermediate!9114 (undefined!9926 Bool) (index!38829 (_ BitVec 32)) (x!81498 (_ BitVec 32))) (Undefined!9114) (MissingVacant!9114 (index!38830 (_ BitVec 32))) )
))
(declare-fun lt!426558 () SeekEntryResult!9114)

(assert (=> b!947373 (= e!533214 (and (bvsge (index!38828 lt!426558) #b00000000000000000000000000000000) (bvslt (index!38828 lt!426558) (size!28064 (_keys!10640 thiss!1141)))))))

(declare-fun mapIsEmpty!32896 () Bool)

(declare-fun mapRes!32896 () Bool)

(assert (=> mapIsEmpty!32896 mapRes!32896))

(declare-fun b!947374 () Bool)

(declare-fun e!533212 () Bool)

(assert (=> b!947374 (= e!533212 (not e!533214))))

(declare-fun res!635816 () Bool)

(assert (=> b!947374 (=> res!635816 e!533214)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947374 (= res!635816 (not (validMask!0 (mask!27466 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947374 (arrayContainsKey!0 (_keys!10640 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31924 0))(
  ( (Unit!31925) )
))
(declare-fun lt!426557 () Unit!31924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57360 (_ BitVec 64) (_ BitVec 32)) Unit!31924)

(assert (=> b!947374 (= lt!426557 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10640 thiss!1141) key!756 (index!38828 lt!426558)))))

(declare-fun b!947375 () Bool)

(declare-fun res!635813 () Bool)

(assert (=> b!947375 (=> res!635813 e!533214)))

(declare-datatypes ((List!19306 0))(
  ( (Nil!19303) (Cons!19302 (h!20458 (_ BitVec 64)) (t!27627 List!19306)) )
))
(declare-fun arrayNoDuplicates!0 (array!57360 (_ BitVec 32) List!19306) Bool)

(assert (=> b!947375 (= res!635813 (not (arrayNoDuplicates!0 (_keys!10640 thiss!1141) #b00000000000000000000000000000000 Nil!19303)))))

(declare-fun b!947376 () Bool)

(declare-fun res!635815 () Bool)

(declare-fun e!533209 () Bool)

(assert (=> b!947376 (=> (not res!635815) (not e!533209))))

(assert (=> b!947376 (= res!635815 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32896 () Bool)

(declare-fun tp!63078 () Bool)

(declare-fun e!533211 () Bool)

(assert (=> mapNonEmpty!32896 (= mapRes!32896 (and tp!63078 e!533211))))

(declare-fun mapRest!32896 () (Array (_ BitVec 32) ValueCell!9859))

(declare-fun mapKey!32896 () (_ BitVec 32))

(declare-fun mapValue!32896 () ValueCell!9859)

(assert (=> mapNonEmpty!32896 (= (arr!27590 (_values!5754 thiss!1141)) (store mapRest!32896 mapKey!32896 mapValue!32896))))

(declare-fun b!947378 () Bool)

(declare-fun e!533215 () Bool)

(declare-fun tp_is_empty!20681 () Bool)

(assert (=> b!947378 (= e!533215 tp_is_empty!20681)))

(declare-fun e!533210 () Bool)

(declare-fun e!533213 () Bool)

(declare-fun array_inv!21418 (array!57360) Bool)

(declare-fun array_inv!21419 (array!57358) Bool)

(assert (=> b!947379 (= e!533213 (and tp!63077 tp_is_empty!20681 (array_inv!21418 (_keys!10640 thiss!1141)) (array_inv!21419 (_values!5754 thiss!1141)) e!533210))))

(declare-fun b!947380 () Bool)

(declare-fun res!635818 () Bool)

(assert (=> b!947380 (=> res!635818 e!533214)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57360 (_ BitVec 32)) Bool)

(assert (=> b!947380 (= res!635818 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10640 thiss!1141) (mask!27466 thiss!1141))))))

(declare-fun b!947381 () Bool)

(assert (=> b!947381 (= e!533210 (and e!533215 mapRes!32896))))

(declare-fun condMapEmpty!32896 () Bool)

(declare-fun mapDefault!32896 () ValueCell!9859)

