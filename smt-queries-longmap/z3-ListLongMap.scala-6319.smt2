; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81202 () Bool)

(assert start!81202)

(declare-fun b!950232 () Bool)

(declare-fun b_free!18237 () Bool)

(declare-fun b_next!18237 () Bool)

(assert (=> b!950232 (= b_free!18237 (not b_next!18237))))

(declare-fun tp!63307 () Bool)

(declare-fun b_and!29693 () Bool)

(assert (=> b!950232 (= tp!63307 b_and!29693)))

(declare-fun mapNonEmpty!33029 () Bool)

(declare-fun mapRes!33029 () Bool)

(declare-fun tp!63306 () Bool)

(declare-fun e!534979 () Bool)

(assert (=> mapNonEmpty!33029 (= mapRes!33029 (and tp!63306 e!534979))))

(declare-datatypes ((V!32625 0))(
  ( (V!32626 (val!10423 Int)) )
))
(declare-datatypes ((ValueCell!9891 0))(
  ( (ValueCellFull!9891 (v!12966 V!32625)) (EmptyCell!9891) )
))
(declare-fun mapRest!33029 () (Array (_ BitVec 32) ValueCell!9891))

(declare-datatypes ((array!57508 0))(
  ( (array!57509 (arr!27654 (Array (_ BitVec 32) ValueCell!9891)) (size!28131 (_ BitVec 32))) )
))
(declare-datatypes ((array!57510 0))(
  ( (array!57511 (arr!27655 (Array (_ BitVec 32) (_ BitVec 64))) (size!28132 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4932 0))(
  ( (LongMapFixedSize!4933 (defaultEntry!5777 Int) (mask!27575 (_ BitVec 32)) (extraKeys!5509 (_ BitVec 32)) (zeroValue!5613 V!32625) (minValue!5613 V!32625) (_size!2521 (_ BitVec 32)) (_keys!10713 array!57510) (_values!5800 array!57508) (_vacant!2521 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4932)

(declare-fun mapKey!33029 () (_ BitVec 32))

(declare-fun mapValue!33029 () ValueCell!9891)

(assert (=> mapNonEmpty!33029 (= (arr!27654 (_values!5800 thiss!1141)) (store mapRest!33029 mapKey!33029 mapValue!33029))))

(declare-fun b!950227 () Bool)

(declare-fun e!534977 () Bool)

(declare-fun tp_is_empty!20745 () Bool)

(assert (=> b!950227 (= e!534977 tp_is_empty!20745)))

(declare-fun b!950228 () Bool)

(declare-fun res!637108 () Bool)

(declare-fun e!534981 () Bool)

(assert (=> b!950228 (=> (not res!637108) (not e!534981))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13544 0))(
  ( (tuple2!13545 (_1!6783 (_ BitVec 64)) (_2!6783 V!32625)) )
))
(declare-datatypes ((List!19335 0))(
  ( (Nil!19332) (Cons!19331 (h!20491 tuple2!13544) (t!27674 List!19335)) )
))
(declare-datatypes ((ListLongMap!12241 0))(
  ( (ListLongMap!12242 (toList!6136 List!19335)) )
))
(declare-fun contains!5227 (ListLongMap!12241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3369 (array!57510 array!57508 (_ BitVec 32) (_ BitVec 32) V!32625 V!32625 (_ BitVec 32) Int) ListLongMap!12241)

(assert (=> b!950228 (= res!637108 (contains!5227 (getCurrentListMap!3369 (_keys!10713 thiss!1141) (_values!5800 thiss!1141) (mask!27575 thiss!1141) (extraKeys!5509 thiss!1141) (zeroValue!5613 thiss!1141) (minValue!5613 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5777 thiss!1141)) key!756))))

(declare-fun b!950229 () Bool)

(assert (=> b!950229 (= e!534981 false)))

(declare-fun lt!427935 () Bool)

(declare-datatypes ((List!19336 0))(
  ( (Nil!19333) (Cons!19332 (h!20492 (_ BitVec 64)) (t!27675 List!19336)) )
))
(declare-fun arrayNoDuplicates!0 (array!57510 (_ BitVec 32) List!19336) Bool)

(assert (=> b!950229 (= lt!427935 (arrayNoDuplicates!0 (_keys!10713 thiss!1141) #b00000000000000000000000000000000 Nil!19333))))

(declare-fun b!950230 () Bool)

(declare-fun res!637105 () Bool)

(assert (=> b!950230 (=> (not res!637105) (not e!534981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57510 (_ BitVec 32)) Bool)

(assert (=> b!950230 (= res!637105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10713 thiss!1141) (mask!27575 thiss!1141)))))

(declare-fun mapIsEmpty!33029 () Bool)

(assert (=> mapIsEmpty!33029 mapRes!33029))

(declare-fun b!950231 () Bool)

(declare-fun e!534980 () Bool)

(assert (=> b!950231 (= e!534980 (and e!534977 mapRes!33029))))

(declare-fun condMapEmpty!33029 () Bool)

(declare-fun mapDefault!33029 () ValueCell!9891)

(assert (=> b!950231 (= condMapEmpty!33029 (= (arr!27654 (_values!5800 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9891)) mapDefault!33029)))))

(declare-fun e!534978 () Bool)

(declare-fun array_inv!21464 (array!57510) Bool)

(declare-fun array_inv!21465 (array!57508) Bool)

(assert (=> b!950232 (= e!534978 (and tp!63307 tp_is_empty!20745 (array_inv!21464 (_keys!10713 thiss!1141)) (array_inv!21465 (_values!5800 thiss!1141)) e!534980))))

(declare-fun b!950233 () Bool)

(declare-fun res!637109 () Bool)

(assert (=> b!950233 (=> (not res!637109) (not e!534981))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9138 0))(
  ( (MissingZero!9138 (index!38923 (_ BitVec 32))) (Found!9138 (index!38924 (_ BitVec 32))) (Intermediate!9138 (undefined!9950 Bool) (index!38925 (_ BitVec 32)) (x!81748 (_ BitVec 32))) (Undefined!9138) (MissingVacant!9138 (index!38926 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57510 (_ BitVec 32)) SeekEntryResult!9138)

(assert (=> b!950233 (= res!637109 (not ((_ is Found!9138) (seekEntry!0 key!756 (_keys!10713 thiss!1141) (mask!27575 thiss!1141)))))))

(declare-fun b!950234 () Bool)

(declare-fun res!637111 () Bool)

(assert (=> b!950234 (=> (not res!637111) (not e!534981))))

(assert (=> b!950234 (= res!637111 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950235 () Bool)

(declare-fun res!637110 () Bool)

(assert (=> b!950235 (=> (not res!637110) (not e!534981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950235 (= res!637110 (validMask!0 (mask!27575 thiss!1141)))))

(declare-fun b!950236 () Bool)

(declare-fun res!637107 () Bool)

(assert (=> b!950236 (=> (not res!637107) (not e!534981))))

(assert (=> b!950236 (= res!637107 (and (= (size!28131 (_values!5800 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27575 thiss!1141))) (= (size!28132 (_keys!10713 thiss!1141)) (size!28131 (_values!5800 thiss!1141))) (bvsge (mask!27575 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5509 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5509 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!637106 () Bool)

(assert (=> start!81202 (=> (not res!637106) (not e!534981))))

(declare-fun valid!1875 (LongMapFixedSize!4932) Bool)

(assert (=> start!81202 (= res!637106 (valid!1875 thiss!1141))))

(assert (=> start!81202 e!534981))

(assert (=> start!81202 e!534978))

(assert (=> start!81202 true))

(declare-fun b!950237 () Bool)

(assert (=> b!950237 (= e!534979 tp_is_empty!20745)))

(assert (= (and start!81202 res!637106) b!950234))

(assert (= (and b!950234 res!637111) b!950233))

(assert (= (and b!950233 res!637109) b!950228))

(assert (= (and b!950228 res!637108) b!950235))

(assert (= (and b!950235 res!637110) b!950236))

(assert (= (and b!950236 res!637107) b!950230))

(assert (= (and b!950230 res!637105) b!950229))

(assert (= (and b!950231 condMapEmpty!33029) mapIsEmpty!33029))

(assert (= (and b!950231 (not condMapEmpty!33029)) mapNonEmpty!33029))

(assert (= (and mapNonEmpty!33029 ((_ is ValueCellFull!9891) mapValue!33029)) b!950237))

(assert (= (and b!950231 ((_ is ValueCellFull!9891) mapDefault!33029)) b!950227))

(assert (= b!950232 b!950231))

(assert (= start!81202 b!950232))

(declare-fun m!882691 () Bool)

(assert (=> b!950230 m!882691))

(declare-fun m!882693 () Bool)

(assert (=> b!950228 m!882693))

(assert (=> b!950228 m!882693))

(declare-fun m!882695 () Bool)

(assert (=> b!950228 m!882695))

(declare-fun m!882697 () Bool)

(assert (=> b!950235 m!882697))

(declare-fun m!882699 () Bool)

(assert (=> b!950229 m!882699))

(declare-fun m!882701 () Bool)

(assert (=> start!81202 m!882701))

(declare-fun m!882703 () Bool)

(assert (=> b!950232 m!882703))

(declare-fun m!882705 () Bool)

(assert (=> b!950232 m!882705))

(declare-fun m!882707 () Bool)

(assert (=> mapNonEmpty!33029 m!882707))

(declare-fun m!882709 () Bool)

(assert (=> b!950233 m!882709))

(check-sat tp_is_empty!20745 (not b!950232) (not b!950228) (not b!950229) (not start!81202) (not b_next!18237) (not b!950233) (not mapNonEmpty!33029) b_and!29693 (not b!950235) (not b!950230))
(check-sat b_and!29693 (not b_next!18237))
