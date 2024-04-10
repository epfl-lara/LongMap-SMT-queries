; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79962 () Bool)

(assert start!79962)

(declare-fun b!940024 () Bool)

(declare-fun b_free!17817 () Bool)

(declare-fun b_next!17817 () Bool)

(assert (=> b!940024 (= b_free!17817 (not b_next!17817))))

(declare-fun tp!61925 () Bool)

(declare-fun b_and!29229 () Bool)

(assert (=> b!940024 (= tp!61925 b_and!29229)))

(declare-fun e!528140 () Bool)

(declare-datatypes ((V!32065 0))(
  ( (V!32066 (val!10213 Int)) )
))
(declare-datatypes ((ValueCell!9681 0))(
  ( (ValueCellFull!9681 (v!12744 V!32065)) (EmptyCell!9681) )
))
(declare-datatypes ((array!56598 0))(
  ( (array!56599 (arr!27234 (Array (_ BitVec 32) ValueCell!9681)) (size!27695 (_ BitVec 32))) )
))
(declare-datatypes ((array!56600 0))(
  ( (array!56601 (arr!27235 (Array (_ BitVec 32) (_ BitVec 64))) (size!27696 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4512 0))(
  ( (LongMapFixedSize!4513 (defaultEntry!5547 Int) (mask!27076 (_ BitVec 32)) (extraKeys!5279 (_ BitVec 32)) (zeroValue!5383 V!32065) (minValue!5383 V!32065) (_size!2311 (_ BitVec 32)) (_keys!10397 array!56600) (_values!5570 array!56598) (_vacant!2311 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4512)

(declare-fun e!528138 () Bool)

(declare-fun tp_is_empty!20325 () Bool)

(declare-fun array_inv!21178 (array!56600) Bool)

(declare-fun array_inv!21179 (array!56598) Bool)

(assert (=> b!940024 (= e!528138 (and tp!61925 tp_is_empty!20325 (array_inv!21178 (_keys!10397 thiss!1141)) (array_inv!21179 (_values!5570 thiss!1141)) e!528140))))

(declare-fun mapNonEmpty!32278 () Bool)

(declare-fun mapRes!32278 () Bool)

(declare-fun tp!61926 () Bool)

(declare-fun e!528142 () Bool)

(assert (=> mapNonEmpty!32278 (= mapRes!32278 (and tp!61926 e!528142))))

(declare-fun mapKey!32278 () (_ BitVec 32))

(declare-fun mapRest!32278 () (Array (_ BitVec 32) ValueCell!9681))

(declare-fun mapValue!32278 () ValueCell!9681)

(assert (=> mapNonEmpty!32278 (= (arr!27234 (_values!5570 thiss!1141)) (store mapRest!32278 mapKey!32278 mapValue!32278))))

(declare-fun mapIsEmpty!32278 () Bool)

(assert (=> mapIsEmpty!32278 mapRes!32278))

(declare-fun b!940026 () Bool)

(declare-fun e!528139 () Bool)

(assert (=> b!940026 (= e!528139 tp_is_empty!20325)))

(declare-fun b!940027 () Bool)

(assert (=> b!940027 (= e!528142 tp_is_empty!20325)))

(declare-fun b!940028 () Bool)

(declare-fun res!632136 () Bool)

(declare-fun e!528141 () Bool)

(assert (=> b!940028 (=> (not res!632136) (not e!528141))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940028 (= res!632136 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940029 () Bool)

(assert (=> b!940029 (= e!528141 false)))

(declare-datatypes ((SeekEntryResult!8987 0))(
  ( (MissingZero!8987 (index!38319 (_ BitVec 32))) (Found!8987 (index!38320 (_ BitVec 32))) (Intermediate!8987 (undefined!9799 Bool) (index!38321 (_ BitVec 32)) (x!80600 (_ BitVec 32))) (Undefined!8987) (MissingVacant!8987 (index!38322 (_ BitVec 32))) )
))
(declare-fun lt!424603 () SeekEntryResult!8987)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56600 (_ BitVec 32)) SeekEntryResult!8987)

(assert (=> b!940029 (= lt!424603 (seekEntry!0 key!756 (_keys!10397 thiss!1141) (mask!27076 thiss!1141)))))

(declare-fun res!632137 () Bool)

(assert (=> start!79962 (=> (not res!632137) (not e!528141))))

(declare-fun valid!1732 (LongMapFixedSize!4512) Bool)

(assert (=> start!79962 (= res!632137 (valid!1732 thiss!1141))))

(assert (=> start!79962 e!528141))

(assert (=> start!79962 e!528138))

(assert (=> start!79962 true))

(declare-fun b!940025 () Bool)

(assert (=> b!940025 (= e!528140 (and e!528139 mapRes!32278))))

(declare-fun condMapEmpty!32278 () Bool)

(declare-fun mapDefault!32278 () ValueCell!9681)

(assert (=> b!940025 (= condMapEmpty!32278 (= (arr!27234 (_values!5570 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9681)) mapDefault!32278)))))

(assert (= (and start!79962 res!632137) b!940028))

(assert (= (and b!940028 res!632136) b!940029))

(assert (= (and b!940025 condMapEmpty!32278) mapIsEmpty!32278))

(assert (= (and b!940025 (not condMapEmpty!32278)) mapNonEmpty!32278))

(get-info :version)

(assert (= (and mapNonEmpty!32278 ((_ is ValueCellFull!9681) mapValue!32278)) b!940027))

(assert (= (and b!940025 ((_ is ValueCellFull!9681) mapDefault!32278)) b!940026))

(assert (= b!940024 b!940025))

(assert (= start!79962 b!940024))

(declare-fun m!875633 () Bool)

(assert (=> b!940024 m!875633))

(declare-fun m!875635 () Bool)

(assert (=> b!940024 m!875635))

(declare-fun m!875637 () Bool)

(assert (=> mapNonEmpty!32278 m!875637))

(declare-fun m!875639 () Bool)

(assert (=> b!940029 m!875639))

(declare-fun m!875641 () Bool)

(assert (=> start!79962 m!875641))

(check-sat (not b!940024) (not mapNonEmpty!32278) (not b_next!17817) b_and!29229 (not start!79962) (not b!940029) tp_is_empty!20325)
(check-sat b_and!29229 (not b_next!17817))
