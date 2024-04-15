; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79948 () Bool)

(assert start!79948)

(declare-fun b!939824 () Bool)

(declare-fun b_free!17821 () Bool)

(declare-fun b_next!17821 () Bool)

(assert (=> b!939824 (= b_free!17821 (not b_next!17821))))

(declare-fun tp!61939 () Bool)

(declare-fun b_and!29207 () Bool)

(assert (=> b!939824 (= tp!61939 b_and!29207)))

(declare-fun b!939821 () Bool)

(declare-fun e!528029 () Bool)

(assert (=> b!939821 (= e!528029 false)))

(declare-datatypes ((SeekEntryResult!8988 0))(
  ( (MissingZero!8988 (index!38323 (_ BitVec 32))) (Found!8988 (index!38324 (_ BitVec 32))) (Intermediate!8988 (undefined!9800 Bool) (index!38325 (_ BitVec 32)) (x!80604 (_ BitVec 32))) (Undefined!8988) (MissingVacant!8988 (index!38326 (_ BitVec 32))) )
))
(declare-fun lt!424373 () SeekEntryResult!8988)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32071 0))(
  ( (V!32072 (val!10215 Int)) )
))
(declare-datatypes ((ValueCell!9683 0))(
  ( (ValueCellFull!9683 (v!12745 V!32071)) (EmptyCell!9683) )
))
(declare-datatypes ((array!56571 0))(
  ( (array!56572 (arr!27221 (Array (_ BitVec 32) ValueCell!9683)) (size!27684 (_ BitVec 32))) )
))
(declare-datatypes ((array!56573 0))(
  ( (array!56574 (arr!27222 (Array (_ BitVec 32) (_ BitVec 64))) (size!27685 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4516 0))(
  ( (LongMapFixedSize!4517 (defaultEntry!5549 Int) (mask!27073 (_ BitVec 32)) (extraKeys!5281 (_ BitVec 32)) (zeroValue!5385 V!32071) (minValue!5385 V!32071) (_size!2313 (_ BitVec 32)) (_keys!10394 array!56573) (_values!5572 array!56571) (_vacant!2313 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4516)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56573 (_ BitVec 32)) SeekEntryResult!8988)

(assert (=> b!939821 (= lt!424373 (seekEntry!0 key!756 (_keys!10394 thiss!1141) (mask!27073 thiss!1141)))))

(declare-fun b!939823 () Bool)

(declare-fun e!528026 () Bool)

(declare-fun tp_is_empty!20329 () Bool)

(assert (=> b!939823 (= e!528026 tp_is_empty!20329)))

(declare-fun e!528028 () Bool)

(declare-fun e!528030 () Bool)

(declare-fun array_inv!21232 (array!56573) Bool)

(declare-fun array_inv!21233 (array!56571) Bool)

(assert (=> b!939824 (= e!528028 (and tp!61939 tp_is_empty!20329 (array_inv!21232 (_keys!10394 thiss!1141)) (array_inv!21233 (_values!5572 thiss!1141)) e!528030))))

(declare-fun mapIsEmpty!32284 () Bool)

(declare-fun mapRes!32284 () Bool)

(assert (=> mapIsEmpty!32284 mapRes!32284))

(declare-fun mapNonEmpty!32284 () Bool)

(declare-fun tp!61938 () Bool)

(declare-fun e!528025 () Bool)

(assert (=> mapNonEmpty!32284 (= mapRes!32284 (and tp!61938 e!528025))))

(declare-fun mapValue!32284 () ValueCell!9683)

(declare-fun mapKey!32284 () (_ BitVec 32))

(declare-fun mapRest!32284 () (Array (_ BitVec 32) ValueCell!9683))

(assert (=> mapNonEmpty!32284 (= (arr!27221 (_values!5572 thiss!1141)) (store mapRest!32284 mapKey!32284 mapValue!32284))))

(declare-fun b!939825 () Bool)

(assert (=> b!939825 (= e!528030 (and e!528026 mapRes!32284))))

(declare-fun condMapEmpty!32284 () Bool)

(declare-fun mapDefault!32284 () ValueCell!9683)

(assert (=> b!939825 (= condMapEmpty!32284 (= (arr!27221 (_values!5572 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9683)) mapDefault!32284)))))

(declare-fun b!939826 () Bool)

(declare-fun res!632038 () Bool)

(assert (=> b!939826 (=> (not res!632038) (not e!528029))))

(assert (=> b!939826 (= res!632038 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939822 () Bool)

(assert (=> b!939822 (= e!528025 tp_is_empty!20329)))

(declare-fun res!632039 () Bool)

(assert (=> start!79948 (=> (not res!632039) (not e!528029))))

(declare-fun valid!1741 (LongMapFixedSize!4516) Bool)

(assert (=> start!79948 (= res!632039 (valid!1741 thiss!1141))))

(assert (=> start!79948 e!528029))

(assert (=> start!79948 e!528028))

(assert (=> start!79948 true))

(assert (= (and start!79948 res!632039) b!939826))

(assert (= (and b!939826 res!632038) b!939821))

(assert (= (and b!939825 condMapEmpty!32284) mapIsEmpty!32284))

(assert (= (and b!939825 (not condMapEmpty!32284)) mapNonEmpty!32284))

(get-info :version)

(assert (= (and mapNonEmpty!32284 ((_ is ValueCellFull!9683) mapValue!32284)) b!939822))

(assert (= (and b!939825 ((_ is ValueCellFull!9683) mapDefault!32284)) b!939823))

(assert (= b!939824 b!939825))

(assert (= start!79948 b!939824))

(declare-fun m!874895 () Bool)

(assert (=> b!939821 m!874895))

(declare-fun m!874897 () Bool)

(assert (=> b!939824 m!874897))

(declare-fun m!874899 () Bool)

(assert (=> b!939824 m!874899))

(declare-fun m!874901 () Bool)

(assert (=> mapNonEmpty!32284 m!874901))

(declare-fun m!874903 () Bool)

(assert (=> start!79948 m!874903))

(check-sat tp_is_empty!20329 (not b!939824) b_and!29207 (not b_next!17821) (not start!79948) (not mapNonEmpty!32284) (not b!939821))
(check-sat b_and!29207 (not b_next!17821))
