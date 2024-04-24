; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80134 () Bool)

(assert start!80134)

(declare-fun b!940963 () Bool)

(declare-fun b_free!17821 () Bool)

(declare-fun b_next!17821 () Bool)

(assert (=> b!940963 (= b_free!17821 (not b_next!17821))))

(declare-fun tp!61938 () Bool)

(declare-fun b_and!29243 () Bool)

(assert (=> b!940963 (= tp!61938 b_and!29243)))

(declare-fun tp_is_empty!20329 () Bool)

(declare-datatypes ((V!32071 0))(
  ( (V!32072 (val!10215 Int)) )
))
(declare-datatypes ((ValueCell!9683 0))(
  ( (ValueCellFull!9683 (v!12743 V!32071)) (EmptyCell!9683) )
))
(declare-datatypes ((array!56657 0))(
  ( (array!56658 (arr!27259 (Array (_ BitVec 32) ValueCell!9683)) (size!27721 (_ BitVec 32))) )
))
(declare-datatypes ((array!56659 0))(
  ( (array!56660 (arr!27260 (Array (_ BitVec 32) (_ BitVec 64))) (size!27722 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4516 0))(
  ( (LongMapFixedSize!4517 (defaultEntry!5549 Int) (mask!27123 (_ BitVec 32)) (extraKeys!5281 (_ BitVec 32)) (zeroValue!5385 V!32071) (minValue!5385 V!32071) (_size!2313 (_ BitVec 32)) (_keys!10427 array!56659) (_values!5572 array!56657) (_vacant!2313 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4516)

(declare-fun e!528756 () Bool)

(declare-fun e!528760 () Bool)

(declare-fun array_inv!21282 (array!56659) Bool)

(declare-fun array_inv!21283 (array!56657) Bool)

(assert (=> b!940963 (= e!528760 (and tp!61938 tp_is_empty!20329 (array_inv!21282 (_keys!10427 thiss!1141)) (array_inv!21283 (_values!5572 thiss!1141)) e!528756))))

(declare-fun mapIsEmpty!32284 () Bool)

(declare-fun mapRes!32284 () Bool)

(assert (=> mapIsEmpty!32284 mapRes!32284))

(declare-fun b!940964 () Bool)

(declare-fun e!528759 () Bool)

(assert (=> b!940964 (= e!528759 tp_is_empty!20329)))

(declare-fun b!940965 () Bool)

(assert (=> b!940965 (= e!528756 (and e!528759 mapRes!32284))))

(declare-fun condMapEmpty!32284 () Bool)

(declare-fun mapDefault!32284 () ValueCell!9683)

(assert (=> b!940965 (= condMapEmpty!32284 (= (arr!27259 (_values!5572 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9683)) mapDefault!32284)))))

(declare-fun b!940966 () Bool)

(declare-fun e!528758 () Bool)

(assert (=> b!940966 (= e!528758 false)))

(declare-datatypes ((SeekEntryResult!8943 0))(
  ( (MissingZero!8943 (index!38143 (_ BitVec 32))) (Found!8943 (index!38144 (_ BitVec 32))) (Intermediate!8943 (undefined!9755 Bool) (index!38145 (_ BitVec 32)) (x!80578 (_ BitVec 32))) (Undefined!8943) (MissingVacant!8943 (index!38146 (_ BitVec 32))) )
))
(declare-fun lt!424970 () SeekEntryResult!8943)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56659 (_ BitVec 32)) SeekEntryResult!8943)

(assert (=> b!940966 (= lt!424970 (seekEntry!0 key!756 (_keys!10427 thiss!1141) (mask!27123 thiss!1141)))))

(declare-fun b!940967 () Bool)

(declare-fun res!632493 () Bool)

(assert (=> b!940967 (=> (not res!632493) (not e!528758))))

(assert (=> b!940967 (= res!632493 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!632492 () Bool)

(assert (=> start!80134 (=> (not res!632492) (not e!528758))))

(declare-fun valid!1741 (LongMapFixedSize!4516) Bool)

(assert (=> start!80134 (= res!632492 (valid!1741 thiss!1141))))

(assert (=> start!80134 e!528758))

(assert (=> start!80134 e!528760))

(assert (=> start!80134 true))

(declare-fun mapNonEmpty!32284 () Bool)

(declare-fun tp!61939 () Bool)

(declare-fun e!528755 () Bool)

(assert (=> mapNonEmpty!32284 (= mapRes!32284 (and tp!61939 e!528755))))

(declare-fun mapRest!32284 () (Array (_ BitVec 32) ValueCell!9683))

(declare-fun mapValue!32284 () ValueCell!9683)

(declare-fun mapKey!32284 () (_ BitVec 32))

(assert (=> mapNonEmpty!32284 (= (arr!27259 (_values!5572 thiss!1141)) (store mapRest!32284 mapKey!32284 mapValue!32284))))

(declare-fun b!940968 () Bool)

(assert (=> b!940968 (= e!528755 tp_is_empty!20329)))

(assert (= (and start!80134 res!632492) b!940967))

(assert (= (and b!940967 res!632493) b!940966))

(assert (= (and b!940965 condMapEmpty!32284) mapIsEmpty!32284))

(assert (= (and b!940965 (not condMapEmpty!32284)) mapNonEmpty!32284))

(get-info :version)

(assert (= (and mapNonEmpty!32284 ((_ is ValueCellFull!9683) mapValue!32284)) b!940968))

(assert (= (and b!940965 ((_ is ValueCellFull!9683) mapDefault!32284)) b!940964))

(assert (= b!940963 b!940965))

(assert (= start!80134 b!940963))

(declare-fun m!876947 () Bool)

(assert (=> b!940963 m!876947))

(declare-fun m!876949 () Bool)

(assert (=> b!940963 m!876949))

(declare-fun m!876951 () Bool)

(assert (=> b!940966 m!876951))

(declare-fun m!876953 () Bool)

(assert (=> start!80134 m!876953))

(declare-fun m!876955 () Bool)

(assert (=> mapNonEmpty!32284 m!876955))

(check-sat tp_is_empty!20329 b_and!29243 (not b_next!17821) (not b!940966) (not mapNonEmpty!32284) (not start!80134) (not b!940963))
(check-sat b_and!29243 (not b_next!17821))
