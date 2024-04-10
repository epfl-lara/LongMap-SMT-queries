; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79988 () Bool)

(assert start!79988)

(declare-fun b!940334 () Bool)

(declare-fun b_free!17843 () Bool)

(declare-fun b_next!17843 () Bool)

(assert (=> b!940334 (= b_free!17843 (not b_next!17843))))

(declare-fun tp!62003 () Bool)

(declare-fun b_and!29255 () Bool)

(assert (=> b!940334 (= tp!62003 b_and!29255)))

(declare-fun mapIsEmpty!32317 () Bool)

(declare-fun mapRes!32317 () Bool)

(assert (=> mapIsEmpty!32317 mapRes!32317))

(declare-fun b!940326 () Bool)

(declare-fun e!528406 () Bool)

(declare-fun tp_is_empty!20351 () Bool)

(assert (=> b!940326 (= e!528406 tp_is_empty!20351)))

(declare-fun b!940327 () Bool)

(declare-fun e!528409 () Bool)

(assert (=> b!940327 (= e!528409 tp_is_empty!20351)))

(declare-fun b!940328 () Bool)

(declare-fun e!528412 () Bool)

(declare-fun e!528408 () Bool)

(assert (=> b!940328 (= e!528412 (not e!528408))))

(declare-fun res!632284 () Bool)

(assert (=> b!940328 (=> res!632284 e!528408)))

(declare-datatypes ((V!32099 0))(
  ( (V!32100 (val!10226 Int)) )
))
(declare-datatypes ((ValueCell!9694 0))(
  ( (ValueCellFull!9694 (v!12757 V!32099)) (EmptyCell!9694) )
))
(declare-datatypes ((array!56650 0))(
  ( (array!56651 (arr!27260 (Array (_ BitVec 32) ValueCell!9694)) (size!27721 (_ BitVec 32))) )
))
(declare-datatypes ((array!56652 0))(
  ( (array!56653 (arr!27261 (Array (_ BitVec 32) (_ BitVec 64))) (size!27722 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4538 0))(
  ( (LongMapFixedSize!4539 (defaultEntry!5560 Int) (mask!27097 (_ BitVec 32)) (extraKeys!5292 (_ BitVec 32)) (zeroValue!5396 V!32099) (minValue!5396 V!32099) (_size!2324 (_ BitVec 32)) (_keys!10410 array!56652) (_values!5583 array!56650) (_vacant!2324 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4538)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940328 (= res!632284 (not (validMask!0 (mask!27097 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940328 (arrayContainsKey!0 (_keys!10410 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31760 0))(
  ( (Unit!31761) )
))
(declare-fun lt!424678 () Unit!31760)

(declare-datatypes ((SeekEntryResult!8996 0))(
  ( (MissingZero!8996 (index!38355 (_ BitVec 32))) (Found!8996 (index!38356 (_ BitVec 32))) (Intermediate!8996 (undefined!9808 Bool) (index!38357 (_ BitVec 32)) (x!80641 (_ BitVec 32))) (Undefined!8996) (MissingVacant!8996 (index!38358 (_ BitVec 32))) )
))
(declare-fun lt!424676 () SeekEntryResult!8996)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56652 (_ BitVec 64) (_ BitVec 32)) Unit!31760)

(assert (=> b!940328 (= lt!424678 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10410 thiss!1141) key!756 (index!38356 lt!424676)))))

(declare-fun b!940329 () Bool)

(declare-fun e!528407 () Bool)

(assert (=> b!940329 (= e!528407 e!528412)))

(declare-fun res!632282 () Bool)

(assert (=> b!940329 (=> (not res!632282) (not e!528412))))

(assert (=> b!940329 (= res!632282 (is-Found!8996 lt!424676))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56652 (_ BitVec 32)) SeekEntryResult!8996)

(assert (=> b!940329 (= lt!424676 (seekEntry!0 key!756 (_keys!10410 thiss!1141) (mask!27097 thiss!1141)))))

(declare-fun b!940330 () Bool)

(declare-fun res!632287 () Bool)

(assert (=> b!940330 (=> res!632287 e!528408)))

(assert (=> b!940330 (= res!632287 (or (not (= (size!27721 (_values!5583 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27097 thiss!1141)))) (not (= (size!27722 (_keys!10410 thiss!1141)) (size!27721 (_values!5583 thiss!1141)))) (bvslt (mask!27097 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5292 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5292 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940331 () Bool)

(assert (=> b!940331 (= e!528408 true)))

(declare-fun lt!424677 () Bool)

(declare-datatypes ((List!19185 0))(
  ( (Nil!19182) (Cons!19181 (h!20327 (_ BitVec 64)) (t!27500 List!19185)) )
))
(declare-fun arrayNoDuplicates!0 (array!56652 (_ BitVec 32) List!19185) Bool)

(assert (=> b!940331 (= lt!424677 (arrayNoDuplicates!0 (_keys!10410 thiss!1141) #b00000000000000000000000000000000 Nil!19182))))

(declare-fun b!940332 () Bool)

(declare-fun res!632286 () Bool)

(assert (=> b!940332 (=> res!632286 e!528408)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56652 (_ BitVec 32)) Bool)

(assert (=> b!940332 (= res!632286 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10410 thiss!1141) (mask!27097 thiss!1141))))))

(declare-fun b!940333 () Bool)

(declare-fun res!632283 () Bool)

(assert (=> b!940333 (=> (not res!632283) (not e!528407))))

(assert (=> b!940333 (= res!632283 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940335 () Bool)

(declare-fun e!528410 () Bool)

(assert (=> b!940335 (= e!528410 (and e!528406 mapRes!32317))))

(declare-fun condMapEmpty!32317 () Bool)

(declare-fun mapDefault!32317 () ValueCell!9694)

