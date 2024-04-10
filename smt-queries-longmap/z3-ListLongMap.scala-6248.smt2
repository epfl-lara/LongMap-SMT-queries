; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79956 () Bool)

(assert start!79956)

(declare-fun b!939973 () Bool)

(declare-fun b_free!17811 () Bool)

(declare-fun b_next!17811 () Bool)

(assert (=> b!939973 (= b_free!17811 (not b_next!17811))))

(declare-fun tp!61907 () Bool)

(declare-fun b_and!29223 () Bool)

(assert (=> b!939973 (= tp!61907 b_and!29223)))

(declare-fun res!632119 () Bool)

(declare-fun e!528083 () Bool)

(assert (=> start!79956 (=> (not res!632119) (not e!528083))))

(declare-datatypes ((V!32057 0))(
  ( (V!32058 (val!10210 Int)) )
))
(declare-datatypes ((ValueCell!9678 0))(
  ( (ValueCellFull!9678 (v!12741 V!32057)) (EmptyCell!9678) )
))
(declare-datatypes ((array!56586 0))(
  ( (array!56587 (arr!27228 (Array (_ BitVec 32) ValueCell!9678)) (size!27689 (_ BitVec 32))) )
))
(declare-datatypes ((array!56588 0))(
  ( (array!56589 (arr!27229 (Array (_ BitVec 32) (_ BitVec 64))) (size!27690 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4506 0))(
  ( (LongMapFixedSize!4507 (defaultEntry!5544 Int) (mask!27071 (_ BitVec 32)) (extraKeys!5276 (_ BitVec 32)) (zeroValue!5380 V!32057) (minValue!5380 V!32057) (_size!2308 (_ BitVec 32)) (_keys!10394 array!56588) (_values!5567 array!56586) (_vacant!2308 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4506)

(declare-fun valid!1730 (LongMapFixedSize!4506) Bool)

(assert (=> start!79956 (= res!632119 (valid!1730 thiss!1141))))

(assert (=> start!79956 e!528083))

(declare-fun e!528084 () Bool)

(assert (=> start!79956 e!528084))

(assert (=> start!79956 true))

(declare-fun b!939970 () Bool)

(declare-fun e!528086 () Bool)

(declare-fun tp_is_empty!20319 () Bool)

(assert (=> b!939970 (= e!528086 tp_is_empty!20319)))

(declare-fun mapNonEmpty!32269 () Bool)

(declare-fun mapRes!32269 () Bool)

(declare-fun tp!61908 () Bool)

(declare-fun e!528085 () Bool)

(assert (=> mapNonEmpty!32269 (= mapRes!32269 (and tp!61908 e!528085))))

(declare-fun mapRest!32269 () (Array (_ BitVec 32) ValueCell!9678))

(declare-fun mapValue!32269 () ValueCell!9678)

(declare-fun mapKey!32269 () (_ BitVec 32))

(assert (=> mapNonEmpty!32269 (= (arr!27228 (_values!5567 thiss!1141)) (store mapRest!32269 mapKey!32269 mapValue!32269))))

(declare-fun b!939971 () Bool)

(declare-fun e!528088 () Bool)

(assert (=> b!939971 (= e!528088 (and e!528086 mapRes!32269))))

(declare-fun condMapEmpty!32269 () Bool)

(declare-fun mapDefault!32269 () ValueCell!9678)

(assert (=> b!939971 (= condMapEmpty!32269 (= (arr!27228 (_values!5567 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9678)) mapDefault!32269)))))

(declare-fun b!939972 () Bool)

(assert (=> b!939972 (= e!528085 tp_is_empty!20319)))

(declare-fun array_inv!21174 (array!56588) Bool)

(declare-fun array_inv!21175 (array!56586) Bool)

(assert (=> b!939973 (= e!528084 (and tp!61907 tp_is_empty!20319 (array_inv!21174 (_keys!10394 thiss!1141)) (array_inv!21175 (_values!5567 thiss!1141)) e!528088))))

(declare-fun mapIsEmpty!32269 () Bool)

(assert (=> mapIsEmpty!32269 mapRes!32269))

(declare-fun b!939974 () Bool)

(declare-fun res!632118 () Bool)

(assert (=> b!939974 (=> (not res!632118) (not e!528083))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!939974 (= res!632118 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939975 () Bool)

(assert (=> b!939975 (= e!528083 false)))

(declare-datatypes ((SeekEntryResult!8985 0))(
  ( (MissingZero!8985 (index!38311 (_ BitVec 32))) (Found!8985 (index!38312 (_ BitVec 32))) (Intermediate!8985 (undefined!9797 Bool) (index!38313 (_ BitVec 32)) (x!80590 (_ BitVec 32))) (Undefined!8985) (MissingVacant!8985 (index!38314 (_ BitVec 32))) )
))
(declare-fun lt!424594 () SeekEntryResult!8985)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56588 (_ BitVec 32)) SeekEntryResult!8985)

(assert (=> b!939975 (= lt!424594 (seekEntry!0 key!756 (_keys!10394 thiss!1141) (mask!27071 thiss!1141)))))

(assert (= (and start!79956 res!632119) b!939974))

(assert (= (and b!939974 res!632118) b!939975))

(assert (= (and b!939971 condMapEmpty!32269) mapIsEmpty!32269))

(assert (= (and b!939971 (not condMapEmpty!32269)) mapNonEmpty!32269))

(get-info :version)

(assert (= (and mapNonEmpty!32269 ((_ is ValueCellFull!9678) mapValue!32269)) b!939972))

(assert (= (and b!939971 ((_ is ValueCellFull!9678) mapDefault!32269)) b!939970))

(assert (= b!939973 b!939971))

(assert (= start!79956 b!939973))

(declare-fun m!875603 () Bool)

(assert (=> start!79956 m!875603))

(declare-fun m!875605 () Bool)

(assert (=> mapNonEmpty!32269 m!875605))

(declare-fun m!875607 () Bool)

(assert (=> b!939973 m!875607))

(declare-fun m!875609 () Bool)

(assert (=> b!939973 m!875609))

(declare-fun m!875611 () Bool)

(assert (=> b!939975 m!875611))

(check-sat (not b!939973) b_and!29223 (not start!79956) (not b_next!17811) (not b!939975) tp_is_empty!20319 (not mapNonEmpty!32269))
(check-sat b_and!29223 (not b_next!17811))
