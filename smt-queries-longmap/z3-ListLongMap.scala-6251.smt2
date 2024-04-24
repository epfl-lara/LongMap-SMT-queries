; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80140 () Bool)

(assert start!80140)

(declare-fun b!941018 () Bool)

(declare-fun b_free!17827 () Bool)

(declare-fun b_next!17827 () Bool)

(assert (=> b!941018 (= b_free!17827 (not b_next!17827))))

(declare-fun tp!61956 () Bool)

(declare-fun b_and!29249 () Bool)

(assert (=> b!941018 (= tp!61956 b_and!29249)))

(declare-fun res!632511 () Bool)

(declare-fun e!528812 () Bool)

(assert (=> start!80140 (=> (not res!632511) (not e!528812))))

(declare-datatypes ((V!32079 0))(
  ( (V!32080 (val!10218 Int)) )
))
(declare-datatypes ((ValueCell!9686 0))(
  ( (ValueCellFull!9686 (v!12746 V!32079)) (EmptyCell!9686) )
))
(declare-datatypes ((array!56669 0))(
  ( (array!56670 (arr!27265 (Array (_ BitVec 32) ValueCell!9686)) (size!27727 (_ BitVec 32))) )
))
(declare-datatypes ((array!56671 0))(
  ( (array!56672 (arr!27266 (Array (_ BitVec 32) (_ BitVec 64))) (size!27728 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4522 0))(
  ( (LongMapFixedSize!4523 (defaultEntry!5552 Int) (mask!27128 (_ BitVec 32)) (extraKeys!5284 (_ BitVec 32)) (zeroValue!5388 V!32079) (minValue!5388 V!32079) (_size!2316 (_ BitVec 32)) (_keys!10430 array!56671) (_values!5575 array!56669) (_vacant!2316 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4522)

(declare-fun valid!1744 (LongMapFixedSize!4522) Bool)

(assert (=> start!80140 (= res!632511 (valid!1744 thiss!1141))))

(assert (=> start!80140 e!528812))

(declare-fun e!528810 () Bool)

(assert (=> start!80140 e!528810))

(assert (=> start!80140 true))

(declare-fun b!941017 () Bool)

(assert (=> b!941017 (= e!528812 false)))

(declare-datatypes ((SeekEntryResult!8945 0))(
  ( (MissingZero!8945 (index!38151 (_ BitVec 32))) (Found!8945 (index!38152 (_ BitVec 32))) (Intermediate!8945 (undefined!9757 Bool) (index!38153 (_ BitVec 32)) (x!80588 (_ BitVec 32))) (Undefined!8945) (MissingVacant!8945 (index!38154 (_ BitVec 32))) )
))
(declare-fun lt!424979 () SeekEntryResult!8945)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56671 (_ BitVec 32)) SeekEntryResult!8945)

(assert (=> b!941017 (= lt!424979 (seekEntry!0 key!756 (_keys!10430 thiss!1141) (mask!27128 thiss!1141)))))

(declare-fun e!528811 () Bool)

(declare-fun tp_is_empty!20335 () Bool)

(declare-fun array_inv!21288 (array!56671) Bool)

(declare-fun array_inv!21289 (array!56669) Bool)

(assert (=> b!941018 (= e!528810 (and tp!61956 tp_is_empty!20335 (array_inv!21288 (_keys!10430 thiss!1141)) (array_inv!21289 (_values!5575 thiss!1141)) e!528811))))

(declare-fun mapIsEmpty!32293 () Bool)

(declare-fun mapRes!32293 () Bool)

(assert (=> mapIsEmpty!32293 mapRes!32293))

(declare-fun b!941019 () Bool)

(declare-fun res!632510 () Bool)

(assert (=> b!941019 (=> (not res!632510) (not e!528812))))

(assert (=> b!941019 (= res!632510 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32293 () Bool)

(declare-fun tp!61957 () Bool)

(declare-fun e!528809 () Bool)

(assert (=> mapNonEmpty!32293 (= mapRes!32293 (and tp!61957 e!528809))))

(declare-fun mapValue!32293 () ValueCell!9686)

(declare-fun mapKey!32293 () (_ BitVec 32))

(declare-fun mapRest!32293 () (Array (_ BitVec 32) ValueCell!9686))

(assert (=> mapNonEmpty!32293 (= (arr!27265 (_values!5575 thiss!1141)) (store mapRest!32293 mapKey!32293 mapValue!32293))))

(declare-fun b!941020 () Bool)

(assert (=> b!941020 (= e!528809 tp_is_empty!20335)))

(declare-fun b!941021 () Bool)

(declare-fun e!528813 () Bool)

(assert (=> b!941021 (= e!528813 tp_is_empty!20335)))

(declare-fun b!941022 () Bool)

(assert (=> b!941022 (= e!528811 (and e!528813 mapRes!32293))))

(declare-fun condMapEmpty!32293 () Bool)

(declare-fun mapDefault!32293 () ValueCell!9686)

(assert (=> b!941022 (= condMapEmpty!32293 (= (arr!27265 (_values!5575 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9686)) mapDefault!32293)))))

(assert (= (and start!80140 res!632511) b!941019))

(assert (= (and b!941019 res!632510) b!941017))

(assert (= (and b!941022 condMapEmpty!32293) mapIsEmpty!32293))

(assert (= (and b!941022 (not condMapEmpty!32293)) mapNonEmpty!32293))

(get-info :version)

(assert (= (and mapNonEmpty!32293 ((_ is ValueCellFull!9686) mapValue!32293)) b!941020))

(assert (= (and b!941022 ((_ is ValueCellFull!9686) mapDefault!32293)) b!941021))

(assert (= b!941018 b!941022))

(assert (= start!80140 b!941018))

(declare-fun m!876977 () Bool)

(assert (=> start!80140 m!876977))

(declare-fun m!876979 () Bool)

(assert (=> b!941017 m!876979))

(declare-fun m!876981 () Bool)

(assert (=> b!941018 m!876981))

(declare-fun m!876983 () Bool)

(assert (=> b!941018 m!876983))

(declare-fun m!876985 () Bool)

(assert (=> mapNonEmpty!32293 m!876985))

(check-sat (not b!941018) (not b!941017) tp_is_empty!20335 b_and!29249 (not start!80140) (not b_next!17827) (not mapNonEmpty!32293))
(check-sat b_and!29249 (not b_next!17827))
