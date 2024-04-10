; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79984 () Bool)

(assert start!79984)

(declare-fun b!940268 () Bool)

(declare-fun b_free!17839 () Bool)

(declare-fun b_next!17839 () Bool)

(assert (=> b!940268 (= b_free!17839 (not b_next!17839))))

(declare-fun tp!61992 () Bool)

(declare-fun b_and!29251 () Bool)

(assert (=> b!940268 (= tp!61992 b_and!29251)))

(declare-fun b!940266 () Bool)

(declare-fun e!528361 () Bool)

(declare-fun e!528362 () Bool)

(assert (=> b!940266 (= e!528361 e!528362)))

(declare-fun res!632248 () Bool)

(assert (=> b!940266 (=> (not res!632248) (not e!528362))))

(declare-datatypes ((SeekEntryResult!8994 0))(
  ( (MissingZero!8994 (index!38347 (_ BitVec 32))) (Found!8994 (index!38348 (_ BitVec 32))) (Intermediate!8994 (undefined!9806 Bool) (index!38349 (_ BitVec 32)) (x!80639 (_ BitVec 32))) (Undefined!8994) (MissingVacant!8994 (index!38350 (_ BitVec 32))) )
))
(declare-fun lt!424658 () SeekEntryResult!8994)

(assert (=> b!940266 (= res!632248 (is-Found!8994 lt!424658))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32095 0))(
  ( (V!32096 (val!10224 Int)) )
))
(declare-datatypes ((ValueCell!9692 0))(
  ( (ValueCellFull!9692 (v!12755 V!32095)) (EmptyCell!9692) )
))
(declare-datatypes ((array!56642 0))(
  ( (array!56643 (arr!27256 (Array (_ BitVec 32) ValueCell!9692)) (size!27717 (_ BitVec 32))) )
))
(declare-datatypes ((array!56644 0))(
  ( (array!56645 (arr!27257 (Array (_ BitVec 32) (_ BitVec 64))) (size!27718 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4534 0))(
  ( (LongMapFixedSize!4535 (defaultEntry!5558 Int) (mask!27095 (_ BitVec 32)) (extraKeys!5290 (_ BitVec 32)) (zeroValue!5394 V!32095) (minValue!5394 V!32095) (_size!2322 (_ BitVec 32)) (_keys!10408 array!56644) (_values!5581 array!56642) (_vacant!2322 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4534)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56644 (_ BitVec 32)) SeekEntryResult!8994)

(assert (=> b!940266 (= lt!424658 (seekEntry!0 key!756 (_keys!10408 thiss!1141) (mask!27095 thiss!1141)))))

(declare-fun b!940267 () Bool)

(declare-fun e!528360 () Bool)

(declare-fun tp_is_empty!20347 () Bool)

(assert (=> b!940267 (= e!528360 tp_is_empty!20347)))

(declare-fun e!528359 () Bool)

(declare-fun e!528357 () Bool)

(declare-fun array_inv!21188 (array!56644) Bool)

(declare-fun array_inv!21189 (array!56642) Bool)

(assert (=> b!940268 (= e!528359 (and tp!61992 tp_is_empty!20347 (array_inv!21188 (_keys!10408 thiss!1141)) (array_inv!21189 (_values!5581 thiss!1141)) e!528357))))

(declare-fun b!940269 () Bool)

(declare-fun e!528364 () Bool)

(assert (=> b!940269 (= e!528364 true)))

(declare-fun lt!424659 () Bool)

(declare-datatypes ((List!19183 0))(
  ( (Nil!19180) (Cons!19179 (h!20325 (_ BitVec 64)) (t!27498 List!19183)) )
))
(declare-fun arrayNoDuplicates!0 (array!56644 (_ BitVec 32) List!19183) Bool)

(assert (=> b!940269 (= lt!424659 (arrayNoDuplicates!0 (_keys!10408 thiss!1141) #b00000000000000000000000000000000 Nil!19180))))

(declare-fun mapIsEmpty!32311 () Bool)

(declare-fun mapRes!32311 () Bool)

(assert (=> mapIsEmpty!32311 mapRes!32311))

(declare-fun res!632250 () Bool)

(assert (=> start!79984 (=> (not res!632250) (not e!528361))))

(declare-fun valid!1739 (LongMapFixedSize!4534) Bool)

(assert (=> start!79984 (= res!632250 (valid!1739 thiss!1141))))

(assert (=> start!79984 e!528361))

(assert (=> start!79984 e!528359))

(assert (=> start!79984 true))

(declare-fun b!940270 () Bool)

(declare-fun res!632247 () Bool)

(assert (=> b!940270 (=> res!632247 e!528364)))

(assert (=> b!940270 (= res!632247 (or (not (= (size!27717 (_values!5581 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27095 thiss!1141)))) (not (= (size!27718 (_keys!10408 thiss!1141)) (size!27717 (_values!5581 thiss!1141)))) (bvslt (mask!27095 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5290 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5290 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940271 () Bool)

(declare-fun res!632249 () Bool)

(assert (=> b!940271 (=> (not res!632249) (not e!528361))))

(assert (=> b!940271 (= res!632249 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32311 () Bool)

(declare-fun tp!61991 () Bool)

(assert (=> mapNonEmpty!32311 (= mapRes!32311 (and tp!61991 e!528360))))

(declare-fun mapValue!32311 () ValueCell!9692)

(declare-fun mapRest!32311 () (Array (_ BitVec 32) ValueCell!9692))

(declare-fun mapKey!32311 () (_ BitVec 32))

(assert (=> mapNonEmpty!32311 (= (arr!27256 (_values!5581 thiss!1141)) (store mapRest!32311 mapKey!32311 mapValue!32311))))

(declare-fun b!940272 () Bool)

(declare-fun res!632246 () Bool)

(assert (=> b!940272 (=> res!632246 e!528364)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56644 (_ BitVec 32)) Bool)

(assert (=> b!940272 (= res!632246 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10408 thiss!1141) (mask!27095 thiss!1141))))))

(declare-fun b!940273 () Bool)

(declare-fun e!528363 () Bool)

(assert (=> b!940273 (= e!528357 (and e!528363 mapRes!32311))))

(declare-fun condMapEmpty!32311 () Bool)

(declare-fun mapDefault!32311 () ValueCell!9692)

