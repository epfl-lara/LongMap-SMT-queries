; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80266 () Bool)

(assert start!80266)

(declare-fun b!942813 () Bool)

(declare-fun b_free!17965 () Bool)

(declare-fun b_next!17965 () Bool)

(assert (=> b!942813 (= b_free!17965 (not b_next!17965))))

(declare-fun tp!62401 () Bool)

(declare-fun b_and!29377 () Bool)

(assert (=> b!942813 (= tp!62401 b_and!29377)))

(declare-fun res!633522 () Bool)

(declare-fun e!530098 () Bool)

(assert (=> start!80266 (=> (not res!633522) (not e!530098))))

(declare-datatypes ((V!32263 0))(
  ( (V!32264 (val!10287 Int)) )
))
(declare-datatypes ((ValueCell!9755 0))(
  ( (ValueCellFull!9755 (v!12818 V!32263)) (EmptyCell!9755) )
))
(declare-datatypes ((array!56912 0))(
  ( (array!56913 (arr!27382 (Array (_ BitVec 32) ValueCell!9755)) (size!27847 (_ BitVec 32))) )
))
(declare-datatypes ((array!56914 0))(
  ( (array!56915 (arr!27383 (Array (_ BitVec 32) (_ BitVec 64))) (size!27848 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4660 0))(
  ( (LongMapFixedSize!4661 (defaultEntry!5621 Int) (mask!27237 (_ BitVec 32)) (extraKeys!5353 (_ BitVec 32)) (zeroValue!5457 V!32263) (minValue!5457 V!32263) (_size!2385 (_ BitVec 32)) (_keys!10495 array!56914) (_values!5644 array!56912) (_vacant!2385 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4660)

(declare-fun valid!1783 (LongMapFixedSize!4660) Bool)

(assert (=> start!80266 (= res!633522 (valid!1783 thiss!1141))))

(assert (=> start!80266 e!530098))

(declare-fun e!530096 () Bool)

(assert (=> start!80266 e!530096))

(assert (=> start!80266 true))

(declare-fun b!942805 () Bool)

(declare-fun e!530097 () Bool)

(declare-fun tp_is_empty!20473 () Bool)

(assert (=> b!942805 (= e!530097 tp_is_empty!20473)))

(declare-fun b!942806 () Bool)

(declare-fun res!633525 () Bool)

(assert (=> b!942806 (=> (not res!633525) (not e!530098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56914 (_ BitVec 32)) Bool)

(assert (=> b!942806 (= res!633525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10495 thiss!1141) (mask!27237 thiss!1141)))))

(declare-fun mapIsEmpty!32531 () Bool)

(declare-fun mapRes!32531 () Bool)

(assert (=> mapIsEmpty!32531 mapRes!32531))

(declare-fun b!942807 () Bool)

(declare-fun res!633523 () Bool)

(assert (=> b!942807 (=> (not res!633523) (not e!530098))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13414 0))(
  ( (tuple2!13415 (_1!6718 (_ BitVec 64)) (_2!6718 V!32263)) )
))
(declare-datatypes ((List!19225 0))(
  ( (Nil!19222) (Cons!19221 (h!20371 tuple2!13414) (t!27540 List!19225)) )
))
(declare-datatypes ((ListLongMap!12111 0))(
  ( (ListLongMap!12112 (toList!6071 List!19225)) )
))
(declare-fun contains!5141 (ListLongMap!12111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3305 (array!56914 array!56912 (_ BitVec 32) (_ BitVec 32) V!32263 V!32263 (_ BitVec 32) Int) ListLongMap!12111)

(assert (=> b!942807 (= res!633523 (contains!5141 (getCurrentListMap!3305 (_keys!10495 thiss!1141) (_values!5644 thiss!1141) (mask!27237 thiss!1141) (extraKeys!5353 thiss!1141) (zeroValue!5457 thiss!1141) (minValue!5457 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5621 thiss!1141)) key!756))))

(declare-fun b!942808 () Bool)

(declare-fun res!633527 () Bool)

(assert (=> b!942808 (=> (not res!633527) (not e!530098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942808 (= res!633527 (validMask!0 (mask!27237 thiss!1141)))))

(declare-fun b!942809 () Bool)

(assert (=> b!942809 (= e!530098 false)))

(declare-fun lt!425197 () Bool)

(declare-datatypes ((List!19226 0))(
  ( (Nil!19223) (Cons!19222 (h!20372 (_ BitVec 64)) (t!27541 List!19226)) )
))
(declare-fun arrayNoDuplicates!0 (array!56914 (_ BitVec 32) List!19226) Bool)

(assert (=> b!942809 (= lt!425197 (arrayNoDuplicates!0 (_keys!10495 thiss!1141) #b00000000000000000000000000000000 Nil!19223))))

(declare-fun b!942810 () Bool)

(declare-fun res!633526 () Bool)

(assert (=> b!942810 (=> (not res!633526) (not e!530098))))

(assert (=> b!942810 (= res!633526 (and (= (size!27847 (_values!5644 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27237 thiss!1141))) (= (size!27848 (_keys!10495 thiss!1141)) (size!27847 (_values!5644 thiss!1141))) (bvsge (mask!27237 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5353 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5353 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942811 () Bool)

(declare-fun res!633524 () Bool)

(assert (=> b!942811 (=> (not res!633524) (not e!530098))))

(assert (=> b!942811 (= res!633524 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942812 () Bool)

(declare-fun e!530099 () Bool)

(assert (=> b!942812 (= e!530099 tp_is_empty!20473)))

(declare-fun e!530095 () Bool)

(declare-fun array_inv!21272 (array!56914) Bool)

(declare-fun array_inv!21273 (array!56912) Bool)

(assert (=> b!942813 (= e!530096 (and tp!62401 tp_is_empty!20473 (array_inv!21272 (_keys!10495 thiss!1141)) (array_inv!21273 (_values!5644 thiss!1141)) e!530095))))

(declare-fun b!942814 () Bool)

(declare-fun res!633521 () Bool)

(assert (=> b!942814 (=> (not res!633521) (not e!530098))))

(declare-datatypes ((SeekEntryResult!9038 0))(
  ( (MissingZero!9038 (index!38523 (_ BitVec 32))) (Found!9038 (index!38524 (_ BitVec 32))) (Intermediate!9038 (undefined!9850 Bool) (index!38525 (_ BitVec 32)) (x!80959 (_ BitVec 32))) (Undefined!9038) (MissingVacant!9038 (index!38526 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56914 (_ BitVec 32)) SeekEntryResult!9038)

(assert (=> b!942814 (= res!633521 (not (is-Found!9038 (seekEntry!0 key!756 (_keys!10495 thiss!1141) (mask!27237 thiss!1141)))))))

(declare-fun b!942815 () Bool)

(assert (=> b!942815 (= e!530095 (and e!530097 mapRes!32531))))

(declare-fun condMapEmpty!32531 () Bool)

(declare-fun mapDefault!32531 () ValueCell!9755)

