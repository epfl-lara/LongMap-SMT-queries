; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79966 () Bool)

(assert start!79966)

(declare-fun b!940065 () Bool)

(declare-fun b_free!17821 () Bool)

(declare-fun b_next!17821 () Bool)

(assert (=> b!940065 (= b_free!17821 (not b_next!17821))))

(declare-fun tp!61937 () Bool)

(declare-fun b_and!29233 () Bool)

(assert (=> b!940065 (= tp!61937 b_and!29233)))

(declare-fun b!940060 () Bool)

(declare-fun e!528175 () Bool)

(assert (=> b!940060 (= e!528175 false)))

(declare-datatypes ((SeekEntryResult!8988 0))(
  ( (MissingZero!8988 (index!38323 (_ BitVec 32))) (Found!8988 (index!38324 (_ BitVec 32))) (Intermediate!8988 (undefined!9800 Bool) (index!38325 (_ BitVec 32)) (x!80609 (_ BitVec 32))) (Undefined!8988) (MissingVacant!8988 (index!38326 (_ BitVec 32))) )
))
(declare-fun lt!424609 () SeekEntryResult!8988)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32071 0))(
  ( (V!32072 (val!10215 Int)) )
))
(declare-datatypes ((ValueCell!9683 0))(
  ( (ValueCellFull!9683 (v!12746 V!32071)) (EmptyCell!9683) )
))
(declare-datatypes ((array!56606 0))(
  ( (array!56607 (arr!27238 (Array (_ BitVec 32) ValueCell!9683)) (size!27699 (_ BitVec 32))) )
))
(declare-datatypes ((array!56608 0))(
  ( (array!56609 (arr!27239 (Array (_ BitVec 32) (_ BitVec 64))) (size!27700 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4516 0))(
  ( (LongMapFixedSize!4517 (defaultEntry!5549 Int) (mask!27080 (_ BitVec 32)) (extraKeys!5281 (_ BitVec 32)) (zeroValue!5385 V!32071) (minValue!5385 V!32071) (_size!2313 (_ BitVec 32)) (_keys!10399 array!56608) (_values!5572 array!56606) (_vacant!2313 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4516)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56608 (_ BitVec 32)) SeekEntryResult!8988)

(assert (=> b!940060 (= lt!424609 (seekEntry!0 key!756 (_keys!10399 thiss!1141) (mask!27080 thiss!1141)))))

(declare-fun b!940061 () Bool)

(declare-fun res!632148 () Bool)

(assert (=> b!940061 (=> (not res!632148) (not e!528175))))

(assert (=> b!940061 (= res!632148 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940062 () Bool)

(declare-fun e!528177 () Bool)

(declare-fun tp_is_empty!20329 () Bool)

(assert (=> b!940062 (= e!528177 tp_is_empty!20329)))

(declare-fun res!632149 () Bool)

(assert (=> start!79966 (=> (not res!632149) (not e!528175))))

(declare-fun valid!1734 (LongMapFixedSize!4516) Bool)

(assert (=> start!79966 (= res!632149 (valid!1734 thiss!1141))))

(assert (=> start!79966 e!528175))

(declare-fun e!528174 () Bool)

(assert (=> start!79966 e!528174))

(assert (=> start!79966 true))

(declare-fun mapNonEmpty!32284 () Bool)

(declare-fun mapRes!32284 () Bool)

(declare-fun tp!61938 () Bool)

(assert (=> mapNonEmpty!32284 (= mapRes!32284 (and tp!61938 e!528177))))

(declare-fun mapKey!32284 () (_ BitVec 32))

(declare-fun mapRest!32284 () (Array (_ BitVec 32) ValueCell!9683))

(declare-fun mapValue!32284 () ValueCell!9683)

(assert (=> mapNonEmpty!32284 (= (arr!27238 (_values!5572 thiss!1141)) (store mapRest!32284 mapKey!32284 mapValue!32284))))

(declare-fun b!940063 () Bool)

(declare-fun e!528176 () Bool)

(assert (=> b!940063 (= e!528176 tp_is_empty!20329)))

(declare-fun b!940064 () Bool)

(declare-fun e!528178 () Bool)

(assert (=> b!940064 (= e!528178 (and e!528176 mapRes!32284))))

(declare-fun condMapEmpty!32284 () Bool)

(declare-fun mapDefault!32284 () ValueCell!9683)

