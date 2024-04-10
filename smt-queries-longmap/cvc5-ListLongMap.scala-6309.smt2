; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80838 () Bool)

(assert start!80838)

(declare-fun b!947480 () Bool)

(declare-fun b_free!18175 () Bool)

(declare-fun b_next!18175 () Bool)

(assert (=> b!947480 (= b_free!18175 (not b_next!18175))))

(declare-fun tp!63086 () Bool)

(declare-fun b_and!29597 () Bool)

(assert (=> b!947480 (= tp!63086 b_and!29597)))

(declare-fun b!947475 () Bool)

(declare-fun res!635872 () Bool)

(declare-fun e!533285 () Bool)

(assert (=> b!947475 (=> (not res!635872) (not e!533285))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!947475 (= res!635872 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947476 () Bool)

(declare-fun e!533281 () Bool)

(assert (=> b!947476 (= e!533285 e!533281)))

(declare-fun res!635871 () Bool)

(assert (=> b!947476 (=> (not res!635871) (not e!533281))))

(declare-datatypes ((SeekEntryResult!9115 0))(
  ( (MissingZero!9115 (index!38831 (_ BitVec 32))) (Found!9115 (index!38832 (_ BitVec 32))) (Intermediate!9115 (undefined!9927 Bool) (index!38833 (_ BitVec 32)) (x!81515 (_ BitVec 32))) (Undefined!9115) (MissingVacant!9115 (index!38834 (_ BitVec 32))) )
))
(declare-fun lt!426587 () SeekEntryResult!9115)

(assert (=> b!947476 (= res!635871 (is-Found!9115 lt!426587))))

(declare-datatypes ((V!32543 0))(
  ( (V!32544 (val!10392 Int)) )
))
(declare-datatypes ((ValueCell!9860 0))(
  ( (ValueCellFull!9860 (v!12926 V!32543)) (EmptyCell!9860) )
))
(declare-datatypes ((array!57364 0))(
  ( (array!57365 (arr!27592 (Array (_ BitVec 32) ValueCell!9860)) (size!28065 (_ BitVec 32))) )
))
(declare-datatypes ((array!57366 0))(
  ( (array!57367 (arr!27593 (Array (_ BitVec 32) (_ BitVec 64))) (size!28066 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4870 0))(
  ( (LongMapFixedSize!4871 (defaultEntry!5732 Int) (mask!27472 (_ BitVec 32)) (extraKeys!5464 (_ BitVec 32)) (zeroValue!5568 V!32543) (minValue!5568 V!32543) (_size!2490 (_ BitVec 32)) (_keys!10643 array!57366) (_values!5755 array!57364) (_vacant!2490 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4870)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57366 (_ BitVec 32)) SeekEntryResult!9115)

(assert (=> b!947476 (= lt!426587 (seekEntry!0 key!756 (_keys!10643 thiss!1141) (mask!27472 thiss!1141)))))

(declare-fun mapNonEmpty!32902 () Bool)

(declare-fun mapRes!32902 () Bool)

(declare-fun tp!63087 () Bool)

(declare-fun e!533279 () Bool)

(assert (=> mapNonEmpty!32902 (= mapRes!32902 (and tp!63087 e!533279))))

(declare-fun mapValue!32902 () ValueCell!9860)

(declare-fun mapKey!32902 () (_ BitVec 32))

(declare-fun mapRest!32902 () (Array (_ BitVec 32) ValueCell!9860))

(assert (=> mapNonEmpty!32902 (= (arr!27592 (_values!5755 thiss!1141)) (store mapRest!32902 mapKey!32902 mapValue!32902))))

(declare-fun b!947477 () Bool)

(declare-fun e!533278 () Bool)

(assert (=> b!947477 (= e!533281 (not e!533278))))

(declare-fun res!635866 () Bool)

(assert (=> b!947477 (=> res!635866 e!533278)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947477 (= res!635866 (not (validMask!0 (mask!27472 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947477 (arrayContainsKey!0 (_keys!10643 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31926 0))(
  ( (Unit!31927) )
))
(declare-fun lt!426588 () Unit!31926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57366 (_ BitVec 64) (_ BitVec 32)) Unit!31926)

(assert (=> b!947477 (= lt!426588 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10643 thiss!1141) key!756 (index!38832 lt!426587)))))

(declare-fun b!947478 () Bool)

(declare-fun res!635865 () Bool)

(assert (=> b!947478 (=> res!635865 e!533278)))

(assert (=> b!947478 (= res!635865 (or (not (= (size!28065 (_values!5755 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27472 thiss!1141)))) (not (= (size!28066 (_keys!10643 thiss!1141)) (size!28065 (_values!5755 thiss!1141)))) (bvslt (mask!27472 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5464 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5464 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!635867 () Bool)

(assert (=> start!80838 (=> (not res!635867) (not e!533285))))

(declare-fun valid!1855 (LongMapFixedSize!4870) Bool)

(assert (=> start!80838 (= res!635867 (valid!1855 thiss!1141))))

(assert (=> start!80838 e!533285))

(declare-fun e!533280 () Bool)

(assert (=> start!80838 e!533280))

(assert (=> start!80838 true))

(declare-fun b!947479 () Bool)

(declare-fun res!635869 () Bool)

(assert (=> b!947479 (=> res!635869 e!533278)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57366 (_ BitVec 32)) Bool)

(assert (=> b!947479 (= res!635869 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10643 thiss!1141) (mask!27472 thiss!1141))))))

(declare-fun tp_is_empty!20683 () Bool)

(declare-fun e!533283 () Bool)

(declare-fun array_inv!21420 (array!57366) Bool)

(declare-fun array_inv!21421 (array!57364) Bool)

(assert (=> b!947480 (= e!533280 (and tp!63086 tp_is_empty!20683 (array_inv!21420 (_keys!10643 thiss!1141)) (array_inv!21421 (_values!5755 thiss!1141)) e!533283))))

(declare-fun mapIsEmpty!32902 () Bool)

(assert (=> mapIsEmpty!32902 mapRes!32902))

(declare-fun b!947481 () Bool)

(assert (=> b!947481 (= e!533279 tp_is_empty!20683)))

(declare-fun b!947482 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947482 (= e!533278 (validKeyInArray!0 (select (arr!27593 (_keys!10643 thiss!1141)) (index!38832 lt!426587))))))

(declare-fun b!947483 () Bool)

(declare-fun e!533284 () Bool)

(assert (=> b!947483 (= e!533283 (and e!533284 mapRes!32902))))

(declare-fun condMapEmpty!32902 () Bool)

(declare-fun mapDefault!32902 () ValueCell!9860)

