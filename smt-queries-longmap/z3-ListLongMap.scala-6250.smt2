; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79968 () Bool)

(assert start!79968)

(declare-fun b!940078 () Bool)

(declare-fun b_free!17823 () Bool)

(declare-fun b_next!17823 () Bool)

(assert (=> b!940078 (= b_free!17823 (not b_next!17823))))

(declare-fun tp!61943 () Bool)

(declare-fun b_and!29235 () Bool)

(assert (=> b!940078 (= tp!61943 b_and!29235)))

(declare-fun tp_is_empty!20331 () Bool)

(declare-fun e!528195 () Bool)

(declare-datatypes ((V!32073 0))(
  ( (V!32074 (val!10216 Int)) )
))
(declare-datatypes ((ValueCell!9684 0))(
  ( (ValueCellFull!9684 (v!12747 V!32073)) (EmptyCell!9684) )
))
(declare-datatypes ((array!56610 0))(
  ( (array!56611 (arr!27240 (Array (_ BitVec 32) ValueCell!9684)) (size!27701 (_ BitVec 32))) )
))
(declare-datatypes ((array!56612 0))(
  ( (array!56613 (arr!27241 (Array (_ BitVec 32) (_ BitVec 64))) (size!27702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4518 0))(
  ( (LongMapFixedSize!4519 (defaultEntry!5550 Int) (mask!27081 (_ BitVec 32)) (extraKeys!5282 (_ BitVec 32)) (zeroValue!5386 V!32073) (minValue!5386 V!32073) (_size!2314 (_ BitVec 32)) (_keys!10400 array!56612) (_values!5573 array!56610) (_vacant!2314 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4518)

(declare-fun e!528194 () Bool)

(declare-fun array_inv!21182 (array!56612) Bool)

(declare-fun array_inv!21183 (array!56610) Bool)

(assert (=> b!940078 (= e!528194 (and tp!61943 tp_is_empty!20331 (array_inv!21182 (_keys!10400 thiss!1141)) (array_inv!21183 (_values!5573 thiss!1141)) e!528195))))

(declare-fun b!940079 () Bool)

(declare-fun e!528196 () Bool)

(assert (=> b!940079 (= e!528196 tp_is_empty!20331)))

(declare-fun res!632155 () Bool)

(declare-fun e!528192 () Bool)

(assert (=> start!79968 (=> (not res!632155) (not e!528192))))

(declare-fun valid!1735 (LongMapFixedSize!4518) Bool)

(assert (=> start!79968 (= res!632155 (valid!1735 thiss!1141))))

(assert (=> start!79968 e!528192))

(assert (=> start!79968 e!528194))

(assert (=> start!79968 true))

(declare-fun mapNonEmpty!32287 () Bool)

(declare-fun mapRes!32287 () Bool)

(declare-fun tp!61944 () Bool)

(assert (=> mapNonEmpty!32287 (= mapRes!32287 (and tp!61944 e!528196))))

(declare-fun mapRest!32287 () (Array (_ BitVec 32) ValueCell!9684))

(declare-fun mapValue!32287 () ValueCell!9684)

(declare-fun mapKey!32287 () (_ BitVec 32))

(assert (=> mapNonEmpty!32287 (= (arr!27240 (_values!5573 thiss!1141)) (store mapRest!32287 mapKey!32287 mapValue!32287))))

(declare-fun mapIsEmpty!32287 () Bool)

(assert (=> mapIsEmpty!32287 mapRes!32287))

(declare-fun b!940080 () Bool)

(declare-fun res!632154 () Bool)

(assert (=> b!940080 (=> (not res!632154) (not e!528192))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940080 (= res!632154 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940081 () Bool)

(assert (=> b!940081 (= e!528192 false)))

(declare-datatypes ((SeekEntryResult!8989 0))(
  ( (MissingZero!8989 (index!38327 (_ BitVec 32))) (Found!8989 (index!38328 (_ BitVec 32))) (Intermediate!8989 (undefined!9801 Bool) (index!38329 (_ BitVec 32)) (x!80610 (_ BitVec 32))) (Undefined!8989) (MissingVacant!8989 (index!38330 (_ BitVec 32))) )
))
(declare-fun lt!424612 () SeekEntryResult!8989)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56612 (_ BitVec 32)) SeekEntryResult!8989)

(assert (=> b!940081 (= lt!424612 (seekEntry!0 key!756 (_keys!10400 thiss!1141) (mask!27081 thiss!1141)))))

(declare-fun b!940082 () Bool)

(declare-fun e!528193 () Bool)

(assert (=> b!940082 (= e!528195 (and e!528193 mapRes!32287))))

(declare-fun condMapEmpty!32287 () Bool)

(declare-fun mapDefault!32287 () ValueCell!9684)

(assert (=> b!940082 (= condMapEmpty!32287 (= (arr!27240 (_values!5573 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9684)) mapDefault!32287)))))

(declare-fun b!940083 () Bool)

(assert (=> b!940083 (= e!528193 tp_is_empty!20331)))

(assert (= (and start!79968 res!632155) b!940080))

(assert (= (and b!940080 res!632154) b!940081))

(assert (= (and b!940082 condMapEmpty!32287) mapIsEmpty!32287))

(assert (= (and b!940082 (not condMapEmpty!32287)) mapNonEmpty!32287))

(get-info :version)

(assert (= (and mapNonEmpty!32287 ((_ is ValueCellFull!9684) mapValue!32287)) b!940079))

(assert (= (and b!940082 ((_ is ValueCellFull!9684) mapDefault!32287)) b!940083))

(assert (= b!940078 b!940082))

(assert (= start!79968 b!940078))

(declare-fun m!875663 () Bool)

(assert (=> b!940078 m!875663))

(declare-fun m!875665 () Bool)

(assert (=> b!940078 m!875665))

(declare-fun m!875667 () Bool)

(assert (=> start!79968 m!875667))

(declare-fun m!875669 () Bool)

(assert (=> mapNonEmpty!32287 m!875669))

(declare-fun m!875671 () Bool)

(assert (=> b!940081 m!875671))

(check-sat (not b_next!17823) tp_is_empty!20331 (not mapNonEmpty!32287) (not start!79968) b_and!29235 (not b!940081) (not b!940078))
(check-sat b_and!29235 (not b_next!17823))
