; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80258 () Bool)

(assert start!80258)

(declare-fun b!942675 () Bool)

(declare-fun b_free!17957 () Bool)

(declare-fun b_next!17957 () Bool)

(assert (=> b!942675 (= b_free!17957 (not b_next!17957))))

(declare-fun tp!62377 () Bool)

(declare-fun b_and!29369 () Bool)

(assert (=> b!942675 (= tp!62377 b_and!29369)))

(declare-fun b!942673 () Bool)

(declare-fun res!633442 () Bool)

(declare-fun e!530023 () Bool)

(assert (=> b!942673 (=> (not res!633442) (not e!530023))))

(declare-datatypes ((V!32251 0))(
  ( (V!32252 (val!10283 Int)) )
))
(declare-datatypes ((ValueCell!9751 0))(
  ( (ValueCellFull!9751 (v!12814 V!32251)) (EmptyCell!9751) )
))
(declare-datatypes ((array!56896 0))(
  ( (array!56897 (arr!27374 (Array (_ BitVec 32) ValueCell!9751)) (size!27839 (_ BitVec 32))) )
))
(declare-datatypes ((array!56898 0))(
  ( (array!56899 (arr!27375 (Array (_ BitVec 32) (_ BitVec 64))) (size!27840 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4652 0))(
  ( (LongMapFixedSize!4653 (defaultEntry!5617 Int) (mask!27229 (_ BitVec 32)) (extraKeys!5349 (_ BitVec 32)) (zeroValue!5453 V!32251) (minValue!5453 V!32251) (_size!2381 (_ BitVec 32)) (_keys!10491 array!56898) (_values!5640 array!56896) (_vacant!2381 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4652)

(assert (=> b!942673 (= res!633442 (and (= (size!27839 (_values!5640 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27229 thiss!1141))) (= (size!27840 (_keys!10491 thiss!1141)) (size!27839 (_values!5640 thiss!1141))) (bvsge (mask!27229 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5349 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5349 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32519 () Bool)

(declare-fun mapRes!32519 () Bool)

(declare-fun tp!62376 () Bool)

(declare-fun e!530027 () Bool)

(assert (=> mapNonEmpty!32519 (= mapRes!32519 (and tp!62376 e!530027))))

(declare-fun mapRest!32519 () (Array (_ BitVec 32) ValueCell!9751))

(declare-fun mapKey!32519 () (_ BitVec 32))

(declare-fun mapValue!32519 () ValueCell!9751)

(assert (=> mapNonEmpty!32519 (= (arr!27374 (_values!5640 thiss!1141)) (store mapRest!32519 mapKey!32519 mapValue!32519))))

(declare-fun res!633441 () Bool)

(assert (=> start!80258 (=> (not res!633441) (not e!530023))))

(declare-fun valid!1781 (LongMapFixedSize!4652) Bool)

(assert (=> start!80258 (= res!633441 (valid!1781 thiss!1141))))

(assert (=> start!80258 e!530023))

(declare-fun e!530025 () Bool)

(assert (=> start!80258 e!530025))

(assert (=> start!80258 true))

(declare-fun b!942674 () Bool)

(assert (=> b!942674 (= e!530023 false)))

(declare-fun lt!425185 () Bool)

(declare-datatypes ((List!19219 0))(
  ( (Nil!19216) (Cons!19215 (h!20365 (_ BitVec 64)) (t!27534 List!19219)) )
))
(declare-fun arrayNoDuplicates!0 (array!56898 (_ BitVec 32) List!19219) Bool)

(assert (=> b!942674 (= lt!425185 (arrayNoDuplicates!0 (_keys!10491 thiss!1141) #b00000000000000000000000000000000 Nil!19216))))

(declare-fun e!530028 () Bool)

(declare-fun tp_is_empty!20465 () Bool)

(declare-fun array_inv!21268 (array!56898) Bool)

(declare-fun array_inv!21269 (array!56896) Bool)

(assert (=> b!942675 (= e!530025 (and tp!62377 tp_is_empty!20465 (array_inv!21268 (_keys!10491 thiss!1141)) (array_inv!21269 (_values!5640 thiss!1141)) e!530028))))

(declare-fun b!942676 () Bool)

(declare-fun res!633443 () Bool)

(assert (=> b!942676 (=> (not res!633443) (not e!530023))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942676 (= res!633443 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942677 () Bool)

(declare-fun res!633437 () Bool)

(assert (=> b!942677 (=> (not res!633437) (not e!530023))))

(declare-datatypes ((tuple2!13408 0))(
  ( (tuple2!13409 (_1!6715 (_ BitVec 64)) (_2!6715 V!32251)) )
))
(declare-datatypes ((List!19220 0))(
  ( (Nil!19217) (Cons!19216 (h!20366 tuple2!13408) (t!27535 List!19220)) )
))
(declare-datatypes ((ListLongMap!12105 0))(
  ( (ListLongMap!12106 (toList!6068 List!19220)) )
))
(declare-fun contains!5138 (ListLongMap!12105 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3302 (array!56898 array!56896 (_ BitVec 32) (_ BitVec 32) V!32251 V!32251 (_ BitVec 32) Int) ListLongMap!12105)

(assert (=> b!942677 (= res!633437 (contains!5138 (getCurrentListMap!3302 (_keys!10491 thiss!1141) (_values!5640 thiss!1141) (mask!27229 thiss!1141) (extraKeys!5349 thiss!1141) (zeroValue!5453 thiss!1141) (minValue!5453 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5617 thiss!1141)) key!756))))

(declare-fun b!942678 () Bool)

(declare-fun res!633438 () Bool)

(assert (=> b!942678 (=> (not res!633438) (not e!530023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942678 (= res!633438 (validMask!0 (mask!27229 thiss!1141)))))

(declare-fun b!942679 () Bool)

(declare-fun res!633440 () Bool)

(assert (=> b!942679 (=> (not res!633440) (not e!530023))))

(declare-datatypes ((SeekEntryResult!9035 0))(
  ( (MissingZero!9035 (index!38511 (_ BitVec 32))) (Found!9035 (index!38512 (_ BitVec 32))) (Intermediate!9035 (undefined!9847 Bool) (index!38513 (_ BitVec 32)) (x!80940 (_ BitVec 32))) (Undefined!9035) (MissingVacant!9035 (index!38514 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56898 (_ BitVec 32)) SeekEntryResult!9035)

(assert (=> b!942679 (= res!633440 (not (is-Found!9035 (seekEntry!0 key!756 (_keys!10491 thiss!1141) (mask!27229 thiss!1141)))))))

(declare-fun b!942680 () Bool)

(declare-fun res!633439 () Bool)

(assert (=> b!942680 (=> (not res!633439) (not e!530023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56898 (_ BitVec 32)) Bool)

(assert (=> b!942680 (= res!633439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10491 thiss!1141) (mask!27229 thiss!1141)))))

(declare-fun b!942681 () Bool)

(assert (=> b!942681 (= e!530027 tp_is_empty!20465)))

(declare-fun b!942682 () Bool)

(declare-fun e!530024 () Bool)

(assert (=> b!942682 (= e!530028 (and e!530024 mapRes!32519))))

(declare-fun condMapEmpty!32519 () Bool)

(declare-fun mapDefault!32519 () ValueCell!9751)

