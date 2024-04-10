; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80842 () Bool)

(assert start!80842)

(declare-fun b!947556 () Bool)

(declare-fun b_free!18179 () Bool)

(declare-fun b_next!18179 () Bool)

(assert (=> b!947556 (= b_free!18179 (not b_next!18179))))

(declare-fun tp!63098 () Bool)

(declare-fun b_and!29601 () Bool)

(assert (=> b!947556 (= tp!63098 b_and!29601)))

(declare-fun b!947547 () Bool)

(declare-fun res!635916 () Bool)

(declare-fun e!533333 () Bool)

(assert (=> b!947547 (=> (not res!635916) (not e!533333))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!947547 (= res!635916 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947548 () Bool)

(declare-fun res!635913 () Bool)

(declare-fun e!533329 () Bool)

(assert (=> b!947548 (=> res!635913 e!533329)))

(declare-datatypes ((SeekEntryResult!9117 0))(
  ( (MissingZero!9117 (index!38839 (_ BitVec 32))) (Found!9117 (index!38840 (_ BitVec 32))) (Intermediate!9117 (undefined!9929 Bool) (index!38841 (_ BitVec 32)) (x!81517 (_ BitVec 32))) (Undefined!9117) (MissingVacant!9117 (index!38842 (_ BitVec 32))) )
))
(declare-fun lt!426599 () SeekEntryResult!9117)

(declare-datatypes ((V!32547 0))(
  ( (V!32548 (val!10394 Int)) )
))
(declare-datatypes ((ValueCell!9862 0))(
  ( (ValueCellFull!9862 (v!12928 V!32547)) (EmptyCell!9862) )
))
(declare-datatypes ((array!57372 0))(
  ( (array!57373 (arr!27596 (Array (_ BitVec 32) ValueCell!9862)) (size!28069 (_ BitVec 32))) )
))
(declare-datatypes ((array!57374 0))(
  ( (array!57375 (arr!27597 (Array (_ BitVec 32) (_ BitVec 64))) (size!28070 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4874 0))(
  ( (LongMapFixedSize!4875 (defaultEntry!5734 Int) (mask!27474 (_ BitVec 32)) (extraKeys!5466 (_ BitVec 32)) (zeroValue!5570 V!32547) (minValue!5570 V!32547) (_size!2492 (_ BitVec 32)) (_keys!10645 array!57374) (_values!5757 array!57372) (_vacant!2492 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4874)

(assert (=> b!947548 (= res!635913 (or (bvslt (index!38840 lt!426599) #b00000000000000000000000000000000) (bvsge (index!38840 lt!426599) (size!28070 (_keys!10645 thiss!1141)))))))

(declare-fun b!947549 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947549 (= e!533329 (validKeyInArray!0 (select (arr!27597 (_keys!10645 thiss!1141)) (index!38840 lt!426599))))))

(declare-fun mapNonEmpty!32908 () Bool)

(declare-fun mapRes!32908 () Bool)

(declare-fun tp!63099 () Bool)

(declare-fun e!533327 () Bool)

(assert (=> mapNonEmpty!32908 (= mapRes!32908 (and tp!63099 e!533327))))

(declare-fun mapKey!32908 () (_ BitVec 32))

(declare-fun mapValue!32908 () ValueCell!9862)

(declare-fun mapRest!32908 () (Array (_ BitVec 32) ValueCell!9862))

(assert (=> mapNonEmpty!32908 (= (arr!27596 (_values!5757 thiss!1141)) (store mapRest!32908 mapKey!32908 mapValue!32908))))

(declare-fun b!947550 () Bool)

(declare-fun res!635915 () Bool)

(assert (=> b!947550 (=> res!635915 e!533329)))

(assert (=> b!947550 (= res!635915 (or (not (= (size!28069 (_values!5757 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27474 thiss!1141)))) (not (= (size!28070 (_keys!10645 thiss!1141)) (size!28069 (_values!5757 thiss!1141)))) (bvslt (mask!27474 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5466 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5466 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947552 () Bool)

(declare-fun e!533331 () Bool)

(assert (=> b!947552 (= e!533331 (not e!533329))))

(declare-fun res!635917 () Bool)

(assert (=> b!947552 (=> res!635917 e!533329)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947552 (= res!635917 (not (validMask!0 (mask!27474 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947552 (arrayContainsKey!0 (_keys!10645 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31930 0))(
  ( (Unit!31931) )
))
(declare-fun lt!426600 () Unit!31930)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57374 (_ BitVec 64) (_ BitVec 32)) Unit!31930)

(assert (=> b!947552 (= lt!426600 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10645 thiss!1141) key!756 (index!38840 lt!426599)))))

(declare-fun b!947553 () Bool)

(declare-fun res!635914 () Bool)

(assert (=> b!947553 (=> res!635914 e!533329)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57374 (_ BitVec 32)) Bool)

(assert (=> b!947553 (= res!635914 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10645 thiss!1141) (mask!27474 thiss!1141))))))

(declare-fun b!947554 () Bool)

(declare-fun e!533328 () Bool)

(declare-fun e!533326 () Bool)

(assert (=> b!947554 (= e!533328 (and e!533326 mapRes!32908))))

(declare-fun condMapEmpty!32908 () Bool)

(declare-fun mapDefault!32908 () ValueCell!9862)

