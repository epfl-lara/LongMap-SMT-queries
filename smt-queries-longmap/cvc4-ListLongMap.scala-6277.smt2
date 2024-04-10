; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80288 () Bool)

(assert start!80288)

(declare-fun b!943169 () Bool)

(declare-fun b_free!17987 () Bool)

(declare-fun b_next!17987 () Bool)

(assert (=> b!943169 (= b_free!17987 (not b_next!17987))))

(declare-fun tp!62466 () Bool)

(declare-fun b_and!29399 () Bool)

(assert (=> b!943169 (= tp!62466 b_and!29399)))

(declare-fun b!943168 () Bool)

(declare-fun res!633755 () Bool)

(declare-fun e!530293 () Bool)

(assert (=> b!943168 (=> (not res!633755) (not e!530293))))

(declare-datatypes ((V!32291 0))(
  ( (V!32292 (val!10298 Int)) )
))
(declare-datatypes ((ValueCell!9766 0))(
  ( (ValueCellFull!9766 (v!12829 V!32291)) (EmptyCell!9766) )
))
(declare-datatypes ((array!56956 0))(
  ( (array!56957 (arr!27404 (Array (_ BitVec 32) ValueCell!9766)) (size!27869 (_ BitVec 32))) )
))
(declare-datatypes ((array!56958 0))(
  ( (array!56959 (arr!27405 (Array (_ BitVec 32) (_ BitVec 64))) (size!27870 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4682 0))(
  ( (LongMapFixedSize!4683 (defaultEntry!5632 Int) (mask!27254 (_ BitVec 32)) (extraKeys!5364 (_ BitVec 32)) (zeroValue!5468 V!32291) (minValue!5468 V!32291) (_size!2396 (_ BitVec 32)) (_keys!10506 array!56958) (_values!5655 array!56956) (_vacant!2396 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4682)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943168 (= res!633755 (validMask!0 (mask!27254 thiss!1141)))))

(declare-fun tp_is_empty!20495 () Bool)

(declare-fun e!530298 () Bool)

(declare-fun e!530294 () Bool)

(declare-fun array_inv!21292 (array!56958) Bool)

(declare-fun array_inv!21293 (array!56956) Bool)

(assert (=> b!943169 (= e!530294 (and tp!62466 tp_is_empty!20495 (array_inv!21292 (_keys!10506 thiss!1141)) (array_inv!21293 (_values!5655 thiss!1141)) e!530298))))

(declare-fun b!943170 () Bool)

(declare-fun res!633752 () Bool)

(assert (=> b!943170 (=> (not res!633752) (not e!530293))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9046 0))(
  ( (MissingZero!9046 (index!38555 (_ BitVec 32))) (Found!9046 (index!38556 (_ BitVec 32))) (Intermediate!9046 (undefined!9858 Bool) (index!38557 (_ BitVec 32)) (x!80991 (_ BitVec 32))) (Undefined!9046) (MissingVacant!9046 (index!38558 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56958 (_ BitVec 32)) SeekEntryResult!9046)

(assert (=> b!943170 (= res!633752 (not (is-Found!9046 (seekEntry!0 key!756 (_keys!10506 thiss!1141) (mask!27254 thiss!1141)))))))

(declare-fun mapIsEmpty!32564 () Bool)

(declare-fun mapRes!32564 () Bool)

(assert (=> mapIsEmpty!32564 mapRes!32564))

(declare-fun b!943171 () Bool)

(declare-fun e!530297 () Bool)

(assert (=> b!943171 (= e!530297 tp_is_empty!20495)))

(declare-fun b!943173 () Bool)

(assert (=> b!943173 (= e!530293 false)))

(declare-fun lt!425230 () Bool)

(declare-datatypes ((List!19242 0))(
  ( (Nil!19239) (Cons!19238 (h!20388 (_ BitVec 64)) (t!27557 List!19242)) )
))
(declare-fun arrayNoDuplicates!0 (array!56958 (_ BitVec 32) List!19242) Bool)

(assert (=> b!943173 (= lt!425230 (arrayNoDuplicates!0 (_keys!10506 thiss!1141) #b00000000000000000000000000000000 Nil!19239))))

(declare-fun b!943174 () Bool)

(declare-fun res!633757 () Bool)

(assert (=> b!943174 (=> (not res!633757) (not e!530293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56958 (_ BitVec 32)) Bool)

(assert (=> b!943174 (= res!633757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10506 thiss!1141) (mask!27254 thiss!1141)))))

(declare-fun b!943175 () Bool)

(declare-fun res!633753 () Bool)

(assert (=> b!943175 (=> (not res!633753) (not e!530293))))

(assert (=> b!943175 (= res!633753 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943176 () Bool)

(declare-fun res!633754 () Bool)

(assert (=> b!943176 (=> (not res!633754) (not e!530293))))

(assert (=> b!943176 (= res!633754 (and (= (size!27869 (_values!5655 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27254 thiss!1141))) (= (size!27870 (_keys!10506 thiss!1141)) (size!27869 (_values!5655 thiss!1141))) (bvsge (mask!27254 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5364 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5364 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943177 () Bool)

(declare-fun e!530296 () Bool)

(assert (=> b!943177 (= e!530298 (and e!530296 mapRes!32564))))

(declare-fun condMapEmpty!32564 () Bool)

(declare-fun mapDefault!32564 () ValueCell!9766)

