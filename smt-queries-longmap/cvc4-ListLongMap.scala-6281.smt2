; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80312 () Bool)

(assert start!80312)

(declare-fun b!943545 () Bool)

(declare-fun b_free!18011 () Bool)

(declare-fun b_next!18011 () Bool)

(assert (=> b!943545 (= b_free!18011 (not b_next!18011))))

(declare-fun tp!62538 () Bool)

(declare-fun b_and!29423 () Bool)

(assert (=> b!943545 (= tp!62538 b_and!29423)))

(declare-fun b!943540 () Bool)

(declare-fun res!633983 () Bool)

(declare-fun e!530513 () Bool)

(assert (=> b!943540 (=> (not res!633983) (not e!530513))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32323 0))(
  ( (V!32324 (val!10310 Int)) )
))
(declare-datatypes ((ValueCell!9778 0))(
  ( (ValueCellFull!9778 (v!12841 V!32323)) (EmptyCell!9778) )
))
(declare-datatypes ((array!57004 0))(
  ( (array!57005 (arr!27428 (Array (_ BitVec 32) ValueCell!9778)) (size!27893 (_ BitVec 32))) )
))
(declare-datatypes ((array!57006 0))(
  ( (array!57007 (arr!27429 (Array (_ BitVec 32) (_ BitVec 64))) (size!27894 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4706 0))(
  ( (LongMapFixedSize!4707 (defaultEntry!5644 Int) (mask!27274 (_ BitVec 32)) (extraKeys!5376 (_ BitVec 32)) (zeroValue!5480 V!32323) (minValue!5480 V!32323) (_size!2408 (_ BitVec 32)) (_keys!10518 array!57006) (_values!5667 array!57004) (_vacant!2408 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4706)

(declare-datatypes ((SeekEntryResult!9055 0))(
  ( (MissingZero!9055 (index!38591 (_ BitVec 32))) (Found!9055 (index!38592 (_ BitVec 32))) (Intermediate!9055 (undefined!9867 Bool) (index!38593 (_ BitVec 32)) (x!81032 (_ BitVec 32))) (Undefined!9055) (MissingVacant!9055 (index!38594 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57006 (_ BitVec 32)) SeekEntryResult!9055)

(assert (=> b!943540 (= res!633983 (not (is-Found!9055 (seekEntry!0 key!756 (_keys!10518 thiss!1141) (mask!27274 thiss!1141)))))))

(declare-fun b!943541 () Bool)

(declare-fun e!530512 () Bool)

(declare-fun tp_is_empty!20519 () Bool)

(assert (=> b!943541 (= e!530512 tp_is_empty!20519)))

(declare-fun b!943542 () Bool)

(declare-fun res!633982 () Bool)

(assert (=> b!943542 (=> (not res!633982) (not e!530513))))

(declare-datatypes ((tuple2!13448 0))(
  ( (tuple2!13449 (_1!6735 (_ BitVec 64)) (_2!6735 V!32323)) )
))
(declare-datatypes ((List!19257 0))(
  ( (Nil!19254) (Cons!19253 (h!20403 tuple2!13448) (t!27572 List!19257)) )
))
(declare-datatypes ((ListLongMap!12145 0))(
  ( (ListLongMap!12146 (toList!6088 List!19257)) )
))
(declare-fun contains!5158 (ListLongMap!12145 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3322 (array!57006 array!57004 (_ BitVec 32) (_ BitVec 32) V!32323 V!32323 (_ BitVec 32) Int) ListLongMap!12145)

(assert (=> b!943542 (= res!633982 (contains!5158 (getCurrentListMap!3322 (_keys!10518 thiss!1141) (_values!5667 thiss!1141) (mask!27274 thiss!1141) (extraKeys!5376 thiss!1141) (zeroValue!5480 thiss!1141) (minValue!5480 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5644 thiss!1141)) key!756))))

(declare-fun b!943543 () Bool)

(assert (=> b!943543 (= e!530513 (not (and (bvslt #b00000000000000000000000000000000 (size!27894 (_keys!10518 thiss!1141))) (bvslt (size!27894 (_keys!10518 thiss!1141)) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!57006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943543 (arrayContainsKey!0 (_keys!10518 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31818 0))(
  ( (Unit!31819) )
))
(declare-fun lt!425266 () Unit!31818)

(declare-fun lemmaKeyInListMapIsInArray!292 (array!57006 array!57004 (_ BitVec 32) (_ BitVec 32) V!32323 V!32323 (_ BitVec 64) Int) Unit!31818)

(assert (=> b!943543 (= lt!425266 (lemmaKeyInListMapIsInArray!292 (_keys!10518 thiss!1141) (_values!5667 thiss!1141) (mask!27274 thiss!1141) (extraKeys!5376 thiss!1141) (zeroValue!5480 thiss!1141) (minValue!5480 thiss!1141) key!756 (defaultEntry!5644 thiss!1141)))))

(declare-fun res!633981 () Bool)

(assert (=> start!80312 (=> (not res!633981) (not e!530513))))

(declare-fun valid!1800 (LongMapFixedSize!4706) Bool)

(assert (=> start!80312 (= res!633981 (valid!1800 thiss!1141))))

(assert (=> start!80312 e!530513))

(declare-fun e!530511 () Bool)

(assert (=> start!80312 e!530511))

(assert (=> start!80312 true))

(declare-fun mapIsEmpty!32600 () Bool)

(declare-fun mapRes!32600 () Bool)

(assert (=> mapIsEmpty!32600 mapRes!32600))

(declare-fun b!943544 () Bool)

(declare-fun res!633980 () Bool)

(assert (=> b!943544 (=> (not res!633980) (not e!530513))))

(assert (=> b!943544 (= res!633980 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!530509 () Bool)

(declare-fun array_inv!21314 (array!57006) Bool)

(declare-fun array_inv!21315 (array!57004) Bool)

(assert (=> b!943545 (= e!530511 (and tp!62538 tp_is_empty!20519 (array_inv!21314 (_keys!10518 thiss!1141)) (array_inv!21315 (_values!5667 thiss!1141)) e!530509))))

(declare-fun b!943546 () Bool)

(assert (=> b!943546 (= e!530509 (and e!530512 mapRes!32600))))

(declare-fun condMapEmpty!32600 () Bool)

(declare-fun mapDefault!32600 () ValueCell!9778)

