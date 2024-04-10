; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80264 () Bool)

(assert start!80264)

(declare-fun b!942778 () Bool)

(declare-fun b_free!17963 () Bool)

(declare-fun b_next!17963 () Bool)

(assert (=> b!942778 (= b_free!17963 (not b_next!17963))))

(declare-fun tp!62394 () Bool)

(declare-fun b_and!29375 () Bool)

(assert (=> b!942778 (= tp!62394 b_and!29375)))

(declare-fun mapIsEmpty!32528 () Bool)

(declare-fun mapRes!32528 () Bool)

(assert (=> mapIsEmpty!32528 mapRes!32528))

(declare-fun mapNonEmpty!32528 () Bool)

(declare-fun tp!62395 () Bool)

(declare-fun e!530079 () Bool)

(assert (=> mapNonEmpty!32528 (= mapRes!32528 (and tp!62395 e!530079))))

(declare-datatypes ((V!32259 0))(
  ( (V!32260 (val!10286 Int)) )
))
(declare-datatypes ((ValueCell!9754 0))(
  ( (ValueCellFull!9754 (v!12817 V!32259)) (EmptyCell!9754) )
))
(declare-fun mapValue!32528 () ValueCell!9754)

(declare-fun mapRest!32528 () (Array (_ BitVec 32) ValueCell!9754))

(declare-datatypes ((array!56908 0))(
  ( (array!56909 (arr!27380 (Array (_ BitVec 32) ValueCell!9754)) (size!27845 (_ BitVec 32))) )
))
(declare-datatypes ((array!56910 0))(
  ( (array!56911 (arr!27381 (Array (_ BitVec 32) (_ BitVec 64))) (size!27846 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4658 0))(
  ( (LongMapFixedSize!4659 (defaultEntry!5620 Int) (mask!27234 (_ BitVec 32)) (extraKeys!5352 (_ BitVec 32)) (zeroValue!5456 V!32259) (minValue!5456 V!32259) (_size!2384 (_ BitVec 32)) (_keys!10494 array!56910) (_values!5643 array!56908) (_vacant!2384 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4658)

(declare-fun mapKey!32528 () (_ BitVec 32))

(assert (=> mapNonEmpty!32528 (= (arr!27380 (_values!5643 thiss!1141)) (store mapRest!32528 mapKey!32528 mapValue!32528))))

(declare-fun b!942772 () Bool)

(declare-fun e!530078 () Bool)

(assert (=> b!942772 (= e!530078 false)))

(declare-fun lt!425194 () Bool)

(declare-datatypes ((List!19223 0))(
  ( (Nil!19220) (Cons!19219 (h!20369 (_ BitVec 64)) (t!27538 List!19223)) )
))
(declare-fun arrayNoDuplicates!0 (array!56910 (_ BitVec 32) List!19223) Bool)

(assert (=> b!942772 (= lt!425194 (arrayNoDuplicates!0 (_keys!10494 thiss!1141) #b00000000000000000000000000000000 Nil!19220))))

(declare-fun b!942773 () Bool)

(declare-fun e!530080 () Bool)

(declare-fun tp_is_empty!20471 () Bool)

(assert (=> b!942773 (= e!530080 tp_is_empty!20471)))

(declare-fun b!942774 () Bool)

(declare-fun res!633503 () Bool)

(assert (=> b!942774 (=> (not res!633503) (not e!530078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56910 (_ BitVec 32)) Bool)

(assert (=> b!942774 (= res!633503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10494 thiss!1141) (mask!27234 thiss!1141)))))

(declare-fun b!942775 () Bool)

(declare-fun res!633501 () Bool)

(assert (=> b!942775 (=> (not res!633501) (not e!530078))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942775 (= res!633501 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942776 () Bool)

(declare-fun res!633504 () Bool)

(assert (=> b!942776 (=> (not res!633504) (not e!530078))))

(assert (=> b!942776 (= res!633504 (and (= (size!27845 (_values!5643 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27234 thiss!1141))) (= (size!27846 (_keys!10494 thiss!1141)) (size!27845 (_values!5643 thiss!1141))) (bvsge (mask!27234 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5352 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5352 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942777 () Bool)

(declare-fun res!633505 () Bool)

(assert (=> b!942777 (=> (not res!633505) (not e!530078))))

(declare-datatypes ((SeekEntryResult!9037 0))(
  ( (MissingZero!9037 (index!38519 (_ BitVec 32))) (Found!9037 (index!38520 (_ BitVec 32))) (Intermediate!9037 (undefined!9849 Bool) (index!38521 (_ BitVec 32)) (x!80950 (_ BitVec 32))) (Undefined!9037) (MissingVacant!9037 (index!38522 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56910 (_ BitVec 32)) SeekEntryResult!9037)

(assert (=> b!942777 (= res!633505 (not (is-Found!9037 (seekEntry!0 key!756 (_keys!10494 thiss!1141) (mask!27234 thiss!1141)))))))

(declare-fun b!942779 () Bool)

(declare-fun res!633506 () Bool)

(assert (=> b!942779 (=> (not res!633506) (not e!530078))))

(declare-datatypes ((tuple2!13412 0))(
  ( (tuple2!13413 (_1!6717 (_ BitVec 64)) (_2!6717 V!32259)) )
))
(declare-datatypes ((List!19224 0))(
  ( (Nil!19221) (Cons!19220 (h!20370 tuple2!13412) (t!27539 List!19224)) )
))
(declare-datatypes ((ListLongMap!12109 0))(
  ( (ListLongMap!12110 (toList!6070 List!19224)) )
))
(declare-fun contains!5140 (ListLongMap!12109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3304 (array!56910 array!56908 (_ BitVec 32) (_ BitVec 32) V!32259 V!32259 (_ BitVec 32) Int) ListLongMap!12109)

(assert (=> b!942779 (= res!633506 (contains!5140 (getCurrentListMap!3304 (_keys!10494 thiss!1141) (_values!5643 thiss!1141) (mask!27234 thiss!1141) (extraKeys!5352 thiss!1141) (zeroValue!5456 thiss!1141) (minValue!5456 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5620 thiss!1141)) key!756))))

(declare-fun b!942780 () Bool)

(assert (=> b!942780 (= e!530079 tp_is_empty!20471)))

(declare-fun b!942781 () Bool)

(declare-fun e!530077 () Bool)

(assert (=> b!942781 (= e!530077 (and e!530080 mapRes!32528))))

(declare-fun condMapEmpty!32528 () Bool)

(declare-fun mapDefault!32528 () ValueCell!9754)

