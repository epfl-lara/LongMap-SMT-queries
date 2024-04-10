; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16280 () Bool)

(assert start!16280)

(declare-fun b!162417 () Bool)

(declare-fun b_free!3741 () Bool)

(declare-fun b_next!3741 () Bool)

(assert (=> b!162417 (= b_free!3741 (not b_next!3741))))

(declare-fun tp!13793 () Bool)

(declare-fun b_and!10155 () Bool)

(assert (=> b!162417 (= tp!13793 b_and!10155)))

(declare-fun b!162413 () Bool)

(declare-fun res!76908 () Bool)

(declare-fun e!106430 () Bool)

(assert (=> b!162413 (=> (not res!76908) (not e!106430))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162413 (= res!76908 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162414 () Bool)

(declare-fun e!106428 () Bool)

(declare-fun tp_is_empty!3543 () Bool)

(assert (=> b!162414 (= e!106428 tp_is_empty!3543)))

(declare-fun mapNonEmpty!6002 () Bool)

(declare-fun mapRes!6002 () Bool)

(declare-fun tp!13792 () Bool)

(assert (=> mapNonEmpty!6002 (= mapRes!6002 (and tp!13792 e!106428))))

(declare-datatypes ((V!4371 0))(
  ( (V!4372 (val!1816 Int)) )
))
(declare-datatypes ((ValueCell!1428 0))(
  ( (ValueCellFull!1428 (v!3681 V!4371)) (EmptyCell!1428) )
))
(declare-fun mapRest!6002 () (Array (_ BitVec 32) ValueCell!1428))

(declare-fun mapKey!6002 () (_ BitVec 32))

(declare-datatypes ((array!6165 0))(
  ( (array!6166 (arr!2927 (Array (_ BitVec 32) (_ BitVec 64))) (size!3211 (_ BitVec 32))) )
))
(declare-datatypes ((array!6167 0))(
  ( (array!6168 (arr!2928 (Array (_ BitVec 32) ValueCell!1428)) (size!3212 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1764 0))(
  ( (LongMapFixedSize!1765 (defaultEntry!3324 Int) (mask!7946 (_ BitVec 32)) (extraKeys!3065 (_ BitVec 32)) (zeroValue!3167 V!4371) (minValue!3167 V!4371) (_size!931 (_ BitVec 32)) (_keys!5125 array!6165) (_values!3307 array!6167) (_vacant!931 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1764)

(declare-fun mapValue!6002 () ValueCell!1428)

(assert (=> mapNonEmpty!6002 (= (arr!2928 (_values!3307 thiss!1248)) (store mapRest!6002 mapKey!6002 mapValue!6002))))

(declare-fun b!162415 () Bool)

(declare-fun e!106434 () Bool)

(declare-fun e!106433 () Bool)

(assert (=> b!162415 (= e!106434 (and e!106433 mapRes!6002))))

(declare-fun condMapEmpty!6002 () Bool)

(declare-fun mapDefault!6002 () ValueCell!1428)

(assert (=> b!162415 (= condMapEmpty!6002 (= (arr!2928 (_values!3307 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1428)) mapDefault!6002)))))

(declare-fun b!162416 () Bool)

(declare-fun e!106432 () Bool)

(assert (=> b!162416 (= e!106430 e!106432)))

(declare-fun res!76909 () Bool)

(assert (=> b!162416 (=> (not res!76909) (not e!106432))))

(declare-datatypes ((SeekEntryResult!382 0))(
  ( (MissingZero!382 (index!3696 (_ BitVec 32))) (Found!382 (index!3697 (_ BitVec 32))) (Intermediate!382 (undefined!1194 Bool) (index!3698 (_ BitVec 32)) (x!17966 (_ BitVec 32))) (Undefined!382) (MissingVacant!382 (index!3699 (_ BitVec 32))) )
))
(declare-fun lt!82438 () SeekEntryResult!382)

(get-info :version)

(assert (=> b!162416 (= res!76909 (and (not ((_ is Undefined!382) lt!82438)) (not ((_ is MissingVacant!382) lt!82438)) ((_ is MissingZero!382) lt!82438)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6165 (_ BitVec 32)) SeekEntryResult!382)

(assert (=> b!162416 (= lt!82438 (seekEntryOrOpen!0 key!828 (_keys!5125 thiss!1248) (mask!7946 thiss!1248)))))

(declare-fun e!106431 () Bool)

(declare-fun array_inv!1873 (array!6165) Bool)

(declare-fun array_inv!1874 (array!6167) Bool)

(assert (=> b!162417 (= e!106431 (and tp!13793 tp_is_empty!3543 (array_inv!1873 (_keys!5125 thiss!1248)) (array_inv!1874 (_values!3307 thiss!1248)) e!106434))))

(declare-fun res!76910 () Bool)

(assert (=> start!16280 (=> (not res!76910) (not e!106430))))

(declare-fun valid!798 (LongMapFixedSize!1764) Bool)

(assert (=> start!16280 (= res!76910 (valid!798 thiss!1248))))

(assert (=> start!16280 e!106430))

(assert (=> start!16280 e!106431))

(assert (=> start!16280 true))

(assert (=> start!16280 tp_is_empty!3543))

(declare-fun b!162412 () Bool)

(assert (=> b!162412 (= e!106432 false)))

(declare-fun lt!82437 () Bool)

(declare-fun v!309 () V!4371)

(declare-datatypes ((tuple2!2992 0))(
  ( (tuple2!2993 (_1!1507 Bool) (_2!1507 LongMapFixedSize!1764)) )
))
(declare-fun updateHelperNewKey!79 (LongMapFixedSize!1764 (_ BitVec 64) V!4371 (_ BitVec 32)) tuple2!2992)

(assert (=> b!162412 (= lt!82437 (valid!798 (_2!1507 (updateHelperNewKey!79 thiss!1248 key!828 v!309 (index!3696 lt!82438)))))))

(declare-fun b!162418 () Bool)

(assert (=> b!162418 (= e!106433 tp_is_empty!3543)))

(declare-fun mapIsEmpty!6002 () Bool)

(assert (=> mapIsEmpty!6002 mapRes!6002))

(assert (= (and start!16280 res!76910) b!162413))

(assert (= (and b!162413 res!76908) b!162416))

(assert (= (and b!162416 res!76909) b!162412))

(assert (= (and b!162415 condMapEmpty!6002) mapIsEmpty!6002))

(assert (= (and b!162415 (not condMapEmpty!6002)) mapNonEmpty!6002))

(assert (= (and mapNonEmpty!6002 ((_ is ValueCellFull!1428) mapValue!6002)) b!162414))

(assert (= (and b!162415 ((_ is ValueCellFull!1428) mapDefault!6002)) b!162418))

(assert (= b!162417 b!162415))

(assert (= start!16280 b!162417))

(declare-fun m!193535 () Bool)

(assert (=> b!162412 m!193535))

(declare-fun m!193537 () Bool)

(assert (=> b!162412 m!193537))

(declare-fun m!193539 () Bool)

(assert (=> b!162416 m!193539))

(declare-fun m!193541 () Bool)

(assert (=> mapNonEmpty!6002 m!193541))

(declare-fun m!193543 () Bool)

(assert (=> start!16280 m!193543))

(declare-fun m!193545 () Bool)

(assert (=> b!162417 m!193545))

(declare-fun m!193547 () Bool)

(assert (=> b!162417 m!193547))

(check-sat (not b_next!3741) (not mapNonEmpty!6002) (not b!162416) b_and!10155 (not start!16280) (not b!162412) tp_is_empty!3543 (not b!162417))
(check-sat b_and!10155 (not b_next!3741))
