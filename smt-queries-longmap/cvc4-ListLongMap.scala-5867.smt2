; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75736 () Bool)

(assert start!75736)

(declare-fun b!890536 () Bool)

(declare-fun b_free!15707 () Bool)

(declare-fun b_next!15707 () Bool)

(assert (=> b!890536 (= b_free!15707 (not b_next!15707))))

(declare-fun tp!55090 () Bool)

(declare-fun b_and!25947 () Bool)

(assert (=> b!890536 (= tp!55090 b_and!25947)))

(declare-fun res!603381 () Bool)

(declare-fun e!496704 () Bool)

(assert (=> start!75736 (=> (not res!603381) (not e!496704))))

(declare-datatypes ((array!52050 0))(
  ( (array!52051 (arr!25031 (Array (_ BitVec 32) (_ BitVec 64))) (size!25475 (_ BitVec 32))) )
))
(declare-datatypes ((V!29011 0))(
  ( (V!29012 (val!9068 Int)) )
))
(declare-datatypes ((ValueCell!8536 0))(
  ( (ValueCellFull!8536 (v!11546 V!29011)) (EmptyCell!8536) )
))
(declare-datatypes ((array!52052 0))(
  ( (array!52053 (arr!25032 (Array (_ BitVec 32) ValueCell!8536)) (size!25476 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4088 0))(
  ( (LongMapFixedSize!4089 (defaultEntry!5241 Int) (mask!25716 (_ BitVec 32)) (extraKeys!4935 (_ BitVec 32)) (zeroValue!5039 V!29011) (minValue!5039 V!29011) (_size!2099 (_ BitVec 32)) (_keys!9924 array!52050) (_values!5226 array!52052) (_vacant!2099 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4088)

(declare-fun valid!1586 (LongMapFixedSize!4088) Bool)

(assert (=> start!75736 (= res!603381 (valid!1586 thiss!1181))))

(assert (=> start!75736 e!496704))

(declare-fun e!496705 () Bool)

(assert (=> start!75736 e!496705))

(assert (=> start!75736 true))

(declare-fun b!890531 () Bool)

(declare-fun e!496708 () Bool)

(declare-fun e!496709 () Bool)

(assert (=> b!890531 (= e!496708 e!496709)))

(declare-fun res!603384 () Bool)

(assert (=> b!890531 (=> res!603384 e!496709)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890531 (= res!603384 (not (validMask!0 (mask!25716 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890531 (arrayContainsKey!0 (_keys!9924 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8802 0))(
  ( (MissingZero!8802 (index!37579 (_ BitVec 32))) (Found!8802 (index!37580 (_ BitVec 32))) (Intermediate!8802 (undefined!9614 Bool) (index!37581 (_ BitVec 32)) (x!75650 (_ BitVec 32))) (Undefined!8802) (MissingVacant!8802 (index!37582 (_ BitVec 32))) )
))
(declare-fun lt!402334 () SeekEntryResult!8802)

(declare-datatypes ((Unit!30304 0))(
  ( (Unit!30305) )
))
(declare-fun lt!402333 () Unit!30304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52050 (_ BitVec 64) (_ BitVec 32)) Unit!30304)

(assert (=> b!890531 (= lt!402333 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9924 thiss!1181) key!785 (index!37580 lt!402334)))))

(declare-fun b!890532 () Bool)

(declare-fun e!496702 () Bool)

(declare-fun tp_is_empty!18035 () Bool)

(assert (=> b!890532 (= e!496702 tp_is_empty!18035)))

(declare-fun mapNonEmpty!28607 () Bool)

(declare-fun mapRes!28607 () Bool)

(declare-fun tp!55089 () Bool)

(assert (=> mapNonEmpty!28607 (= mapRes!28607 (and tp!55089 e!496702))))

(declare-fun mapKey!28607 () (_ BitVec 32))

(declare-fun mapValue!28607 () ValueCell!8536)

(declare-fun mapRest!28607 () (Array (_ BitVec 32) ValueCell!8536))

(assert (=> mapNonEmpty!28607 (= (arr!25032 (_values!5226 thiss!1181)) (store mapRest!28607 mapKey!28607 mapValue!28607))))

(declare-fun b!890533 () Bool)

(declare-fun res!603386 () Bool)

(assert (=> b!890533 (=> (not res!603386) (not e!496704))))

(assert (=> b!890533 (= res!603386 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890534 () Bool)

(declare-fun res!603382 () Bool)

(assert (=> b!890534 (=> res!603382 e!496709)))

(assert (=> b!890534 (= res!603382 (or (not (= (size!25476 (_values!5226 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25716 thiss!1181)))) (not (= (size!25475 (_keys!9924 thiss!1181)) (size!25476 (_values!5226 thiss!1181)))) (bvslt (mask!25716 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4935 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4935 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890535 () Bool)

(declare-fun e!496707 () Bool)

(declare-fun e!496706 () Bool)

(assert (=> b!890535 (= e!496707 (and e!496706 mapRes!28607))))

(declare-fun condMapEmpty!28607 () Bool)

(declare-fun mapDefault!28607 () ValueCell!8536)

