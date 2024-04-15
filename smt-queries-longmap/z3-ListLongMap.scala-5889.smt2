; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75882 () Bool)

(assert start!75882)

(declare-fun b!892796 () Bool)

(declare-fun b_free!15835 () Bool)

(declare-fun b_next!15835 () Bool)

(assert (=> b!892796 (= b_free!15835 (not b_next!15835))))

(declare-fun tp!55478 () Bool)

(declare-fun b_and!26071 () Bool)

(assert (=> b!892796 (= tp!55478 b_and!26071)))

(declare-fun b!892791 () Bool)

(declare-fun e!498486 () Bool)

(declare-fun tp_is_empty!18163 () Bool)

(assert (=> b!892791 (= e!498486 tp_is_empty!18163)))

(declare-fun mapIsEmpty!28802 () Bool)

(declare-fun mapRes!28802 () Bool)

(assert (=> mapIsEmpty!28802 mapRes!28802))

(declare-fun b!892792 () Bool)

(declare-fun e!498488 () Bool)

(assert (=> b!892792 (= e!498488 tp_is_empty!18163)))

(declare-fun b!892793 () Bool)

(declare-fun e!498483 () Bool)

(declare-datatypes ((SeekEntryResult!8861 0))(
  ( (MissingZero!8861 (index!37815 (_ BitVec 32))) (Found!8861 (index!37816 (_ BitVec 32))) (Intermediate!8861 (undefined!9673 Bool) (index!37817 (_ BitVec 32)) (x!75908 (_ BitVec 32))) (Undefined!8861) (MissingVacant!8861 (index!37818 (_ BitVec 32))) )
))
(declare-fun lt!403271 () SeekEntryResult!8861)

(declare-datatypes ((array!52291 0))(
  ( (array!52292 (arr!25151 (Array (_ BitVec 32) (_ BitVec 64))) (size!25597 (_ BitVec 32))) )
))
(declare-datatypes ((V!29183 0))(
  ( (V!29184 (val!9132 Int)) )
))
(declare-datatypes ((ValueCell!8600 0))(
  ( (ValueCellFull!8600 (v!11607 V!29183)) (EmptyCell!8600) )
))
(declare-datatypes ((array!52293 0))(
  ( (array!52294 (arr!25152 (Array (_ BitVec 32) ValueCell!8600)) (size!25598 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4216 0))(
  ( (LongMapFixedSize!4217 (defaultEntry!5308 Int) (mask!25823 (_ BitVec 32)) (extraKeys!5003 (_ BitVec 32)) (zeroValue!5107 V!29183) (minValue!5107 V!29183) (_size!2163 (_ BitVec 32)) (_keys!9988 array!52291) (_values!5294 array!52293) (_vacant!2163 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4216)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892793 (= e!498483 (inRange!0 (index!37816 lt!403271) (mask!25823 thiss!1181)))))

(declare-fun b!892794 () Bool)

(declare-fun e!498484 () Bool)

(assert (=> b!892794 (= e!498484 (and e!498488 mapRes!28802))))

(declare-fun condMapEmpty!28802 () Bool)

(declare-fun mapDefault!28802 () ValueCell!8600)

(assert (=> b!892794 (= condMapEmpty!28802 (= (arr!25152 (_values!5294 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8600)) mapDefault!28802)))))

(declare-fun b!892795 () Bool)

(declare-fun res!604747 () Bool)

(declare-fun e!498485 () Bool)

(assert (=> b!892795 (=> (not res!604747) (not e!498485))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892795 (= res!604747 (not (= key!785 (bvneg key!785))))))

(declare-fun e!498487 () Bool)

(declare-fun array_inv!19814 (array!52291) Bool)

(declare-fun array_inv!19815 (array!52293) Bool)

(assert (=> b!892796 (= e!498487 (and tp!55478 tp_is_empty!18163 (array_inv!19814 (_keys!9988 thiss!1181)) (array_inv!19815 (_values!5294 thiss!1181)) e!498484))))

(declare-fun b!892797 () Bool)

(assert (=> b!892797 (= e!498485 (not true))))

(assert (=> b!892797 e!498483))

(declare-fun res!604749 () Bool)

(assert (=> b!892797 (=> res!604749 e!498483)))

(get-info :version)

(assert (=> b!892797 (= res!604749 (not ((_ is Found!8861) lt!403271)))))

(declare-datatypes ((Unit!30356 0))(
  ( (Unit!30357) )
))
(declare-fun lt!403270 () Unit!30356)

(declare-fun lemmaSeekEntryGivesInRangeIndex!59 (array!52291 array!52293 (_ BitVec 32) (_ BitVec 32) V!29183 V!29183 (_ BitVec 64)) Unit!30356)

(assert (=> b!892797 (= lt!403270 (lemmaSeekEntryGivesInRangeIndex!59 (_keys!9988 thiss!1181) (_values!5294 thiss!1181) (mask!25823 thiss!1181) (extraKeys!5003 thiss!1181) (zeroValue!5107 thiss!1181) (minValue!5107 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52291 (_ BitVec 32)) SeekEntryResult!8861)

(assert (=> b!892797 (= lt!403271 (seekEntry!0 key!785 (_keys!9988 thiss!1181) (mask!25823 thiss!1181)))))

(declare-fun res!604748 () Bool)

(assert (=> start!75882 (=> (not res!604748) (not e!498485))))

(declare-fun valid!1635 (LongMapFixedSize!4216) Bool)

(assert (=> start!75882 (= res!604748 (valid!1635 thiss!1181))))

(assert (=> start!75882 e!498485))

(assert (=> start!75882 e!498487))

(assert (=> start!75882 true))

(declare-fun mapNonEmpty!28802 () Bool)

(declare-fun tp!55477 () Bool)

(assert (=> mapNonEmpty!28802 (= mapRes!28802 (and tp!55477 e!498486))))

(declare-fun mapKey!28802 () (_ BitVec 32))

(declare-fun mapValue!28802 () ValueCell!8600)

(declare-fun mapRest!28802 () (Array (_ BitVec 32) ValueCell!8600))

(assert (=> mapNonEmpty!28802 (= (arr!25152 (_values!5294 thiss!1181)) (store mapRest!28802 mapKey!28802 mapValue!28802))))

(assert (= (and start!75882 res!604748) b!892795))

(assert (= (and b!892795 res!604747) b!892797))

(assert (= (and b!892797 (not res!604749)) b!892793))

(assert (= (and b!892794 condMapEmpty!28802) mapIsEmpty!28802))

(assert (= (and b!892794 (not condMapEmpty!28802)) mapNonEmpty!28802))

(assert (= (and mapNonEmpty!28802 ((_ is ValueCellFull!8600) mapValue!28802)) b!892791))

(assert (= (and b!892794 ((_ is ValueCellFull!8600) mapDefault!28802)) b!892792))

(assert (= b!892796 b!892794))

(assert (= start!75882 b!892796))

(declare-fun m!830433 () Bool)

(assert (=> b!892793 m!830433))

(declare-fun m!830435 () Bool)

(assert (=> mapNonEmpty!28802 m!830435))

(declare-fun m!830437 () Bool)

(assert (=> b!892796 m!830437))

(declare-fun m!830439 () Bool)

(assert (=> b!892796 m!830439))

(declare-fun m!830441 () Bool)

(assert (=> start!75882 m!830441))

(declare-fun m!830443 () Bool)

(assert (=> b!892797 m!830443))

(declare-fun m!830445 () Bool)

(assert (=> b!892797 m!830445))

(check-sat (not b!892796) (not b_next!15835) tp_is_empty!18163 (not start!75882) b_and!26071 (not b!892797) (not b!892793) (not mapNonEmpty!28802))
(check-sat b_and!26071 (not b_next!15835))
