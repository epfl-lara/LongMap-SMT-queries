; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79966 () Bool)

(assert start!79966)

(declare-fun b!940033 () Bool)

(declare-fun b_free!17839 () Bool)

(declare-fun b_next!17839 () Bool)

(assert (=> b!940033 (= b_free!17839 (not b_next!17839))))

(declare-fun tp!61992 () Bool)

(declare-fun b_and!29225 () Bool)

(assert (=> b!940033 (= tp!61992 b_and!29225)))

(declare-fun b!940027 () Bool)

(declare-fun e!528212 () Bool)

(declare-fun e!528210 () Bool)

(declare-fun mapRes!32311 () Bool)

(assert (=> b!940027 (= e!528212 (and e!528210 mapRes!32311))))

(declare-fun condMapEmpty!32311 () Bool)

(declare-datatypes ((V!32095 0))(
  ( (V!32096 (val!10224 Int)) )
))
(declare-datatypes ((ValueCell!9692 0))(
  ( (ValueCellFull!9692 (v!12754 V!32095)) (EmptyCell!9692) )
))
(declare-datatypes ((array!56607 0))(
  ( (array!56608 (arr!27239 (Array (_ BitVec 32) ValueCell!9692)) (size!27702 (_ BitVec 32))) )
))
(declare-datatypes ((array!56609 0))(
  ( (array!56610 (arr!27240 (Array (_ BitVec 32) (_ BitVec 64))) (size!27703 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4534 0))(
  ( (LongMapFixedSize!4535 (defaultEntry!5558 Int) (mask!27088 (_ BitVec 32)) (extraKeys!5290 (_ BitVec 32)) (zeroValue!5394 V!32095) (minValue!5394 V!32095) (_size!2322 (_ BitVec 32)) (_keys!10403 array!56609) (_values!5581 array!56607) (_vacant!2322 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4534)

(declare-fun mapDefault!32311 () ValueCell!9692)

(assert (=> b!940027 (= condMapEmpty!32311 (= (arr!27239 (_values!5581 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9692)) mapDefault!32311)))))

(declare-fun b!940028 () Bool)

(declare-fun res!632136 () Bool)

(declare-fun e!528211 () Bool)

(assert (=> b!940028 (=> (not res!632136) (not e!528211))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940028 (= res!632136 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940029 () Bool)

(declare-fun tp_is_empty!20347 () Bool)

(assert (=> b!940029 (= e!528210 tp_is_empty!20347)))

(declare-fun b!940030 () Bool)

(declare-fun e!528213 () Bool)

(declare-fun e!528214 () Bool)

(assert (=> b!940030 (= e!528213 (not e!528214))))

(declare-fun res!632137 () Bool)

(assert (=> b!940030 (=> res!632137 e!528214)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940030 (= res!632137 (not (validMask!0 (mask!27088 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940030 (arrayContainsKey!0 (_keys!10403 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8995 0))(
  ( (MissingZero!8995 (index!38351 (_ BitVec 32))) (Found!8995 (index!38352 (_ BitVec 32))) (Intermediate!8995 (undefined!9807 Bool) (index!38353 (_ BitVec 32)) (x!80635 (_ BitVec 32))) (Undefined!8995) (MissingVacant!8995 (index!38354 (_ BitVec 32))) )
))
(declare-fun lt!424422 () SeekEntryResult!8995)

(declare-datatypes ((Unit!31645 0))(
  ( (Unit!31646) )
))
(declare-fun lt!424424 () Unit!31645)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56609 (_ BitVec 64) (_ BitVec 32)) Unit!31645)

(assert (=> b!940030 (= lt!424424 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10403 thiss!1141) key!756 (index!38352 lt!424422)))))

(declare-fun res!632139 () Bool)

(assert (=> start!79966 (=> (not res!632139) (not e!528211))))

(declare-fun valid!1747 (LongMapFixedSize!4534) Bool)

(assert (=> start!79966 (= res!632139 (valid!1747 thiss!1141))))

(assert (=> start!79966 e!528211))

(declare-fun e!528215 () Bool)

(assert (=> start!79966 e!528215))

(assert (=> start!79966 true))

(declare-fun mapNonEmpty!32311 () Bool)

(declare-fun tp!61993 () Bool)

(declare-fun e!528216 () Bool)

(assert (=> mapNonEmpty!32311 (= mapRes!32311 (and tp!61993 e!528216))))

(declare-fun mapRest!32311 () (Array (_ BitVec 32) ValueCell!9692))

(declare-fun mapKey!32311 () (_ BitVec 32))

(declare-fun mapValue!32311 () ValueCell!9692)

(assert (=> mapNonEmpty!32311 (= (arr!27239 (_values!5581 thiss!1141)) (store mapRest!32311 mapKey!32311 mapValue!32311))))

(declare-fun b!940031 () Bool)

(assert (=> b!940031 (= e!528216 tp_is_empty!20347)))

(declare-fun b!940032 () Bool)

(declare-fun res!632138 () Bool)

(assert (=> b!940032 (=> res!632138 e!528214)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56609 (_ BitVec 32)) Bool)

(assert (=> b!940032 (= res!632138 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10403 thiss!1141) (mask!27088 thiss!1141))))))

(declare-fun array_inv!21244 (array!56609) Bool)

(declare-fun array_inv!21245 (array!56607) Bool)

(assert (=> b!940033 (= e!528215 (and tp!61992 tp_is_empty!20347 (array_inv!21244 (_keys!10403 thiss!1141)) (array_inv!21245 (_values!5581 thiss!1141)) e!528212))))

(declare-fun mapIsEmpty!32311 () Bool)

(assert (=> mapIsEmpty!32311 mapRes!32311))

(declare-fun b!940034 () Bool)

(declare-fun res!632141 () Bool)

(assert (=> b!940034 (=> res!632141 e!528214)))

(assert (=> b!940034 (= res!632141 (or (not (= (size!27702 (_values!5581 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27088 thiss!1141)))) (not (= (size!27703 (_keys!10403 thiss!1141)) (size!27702 (_values!5581 thiss!1141)))) (bvslt (mask!27088 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5290 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5290 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940035 () Bool)

(assert (=> b!940035 (= e!528214 true)))

(declare-fun lt!424423 () Bool)

(declare-datatypes ((List!19199 0))(
  ( (Nil!19196) (Cons!19195 (h!20341 (_ BitVec 64)) (t!27505 List!19199)) )
))
(declare-fun arrayNoDuplicates!0 (array!56609 (_ BitVec 32) List!19199) Bool)

(assert (=> b!940035 (= lt!424423 (arrayNoDuplicates!0 (_keys!10403 thiss!1141) #b00000000000000000000000000000000 Nil!19196))))

(declare-fun b!940036 () Bool)

(assert (=> b!940036 (= e!528211 e!528213)))

(declare-fun res!632140 () Bool)

(assert (=> b!940036 (=> (not res!632140) (not e!528213))))

(get-info :version)

(assert (=> b!940036 (= res!632140 ((_ is Found!8995) lt!424422))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56609 (_ BitVec 32)) SeekEntryResult!8995)

(assert (=> b!940036 (= lt!424422 (seekEntry!0 key!756 (_keys!10403 thiss!1141) (mask!27088 thiss!1141)))))

(assert (= (and start!79966 res!632139) b!940028))

(assert (= (and b!940028 res!632136) b!940036))

(assert (= (and b!940036 res!632140) b!940030))

(assert (= (and b!940030 (not res!632137)) b!940034))

(assert (= (and b!940034 (not res!632141)) b!940032))

(assert (= (and b!940032 (not res!632138)) b!940035))

(assert (= (and b!940027 condMapEmpty!32311) mapIsEmpty!32311))

(assert (= (and b!940027 (not condMapEmpty!32311)) mapNonEmpty!32311))

(assert (= (and mapNonEmpty!32311 ((_ is ValueCellFull!9692) mapValue!32311)) b!940031))

(assert (= (and b!940027 ((_ is ValueCellFull!9692) mapDefault!32311)) b!940029))

(assert (= b!940033 b!940027))

(assert (= start!79966 b!940033))

(declare-fun m!875015 () Bool)

(assert (=> start!79966 m!875015))

(declare-fun m!875017 () Bool)

(assert (=> b!940036 m!875017))

(declare-fun m!875019 () Bool)

(assert (=> b!940033 m!875019))

(declare-fun m!875021 () Bool)

(assert (=> b!940033 m!875021))

(declare-fun m!875023 () Bool)

(assert (=> b!940032 m!875023))

(declare-fun m!875025 () Bool)

(assert (=> mapNonEmpty!32311 m!875025))

(declare-fun m!875027 () Bool)

(assert (=> b!940030 m!875027))

(declare-fun m!875029 () Bool)

(assert (=> b!940030 m!875029))

(declare-fun m!875031 () Bool)

(assert (=> b!940030 m!875031))

(declare-fun m!875033 () Bool)

(assert (=> b!940035 m!875033))

(check-sat (not b!940035) (not b!940030) (not b!940036) (not b!940032) tp_is_empty!20347 (not start!79966) (not b!940033) (not mapNonEmpty!32311) (not b_next!17839) b_and!29225)
(check-sat b_and!29225 (not b_next!17839))
