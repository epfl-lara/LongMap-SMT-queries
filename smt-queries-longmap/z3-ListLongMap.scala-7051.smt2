; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89594 () Bool)

(assert start!89594)

(declare-fun b!1025622 () Bool)

(declare-fun b_free!20359 () Bool)

(declare-fun b_next!20359 () Bool)

(assert (=> b!1025622 (= b_free!20359 (not b_next!20359))))

(declare-fun tp!72123 () Bool)

(declare-fun b_and!32615 () Bool)

(assert (=> b!1025622 (= tp!72123 b_and!32615)))

(declare-fun b!1025612 () Bool)

(declare-fun e!578204 () Bool)

(declare-fun tp_is_empty!24079 () Bool)

(assert (=> b!1025612 (= e!578204 tp_is_empty!24079)))

(declare-fun b!1025613 () Bool)

(declare-fun e!578209 () Bool)

(assert (=> b!1025613 (= e!578209 true)))

(declare-fun lt!451093 () Bool)

(declare-datatypes ((V!36979 0))(
  ( (V!36980 (val!12090 Int)) )
))
(declare-datatypes ((ValueCell!11336 0))(
  ( (ValueCellFull!11336 (v!14655 V!36979)) (EmptyCell!11336) )
))
(declare-datatypes ((array!64257 0))(
  ( (array!64258 (arr!30931 (Array (_ BitVec 32) (_ BitVec 64))) (size!31445 (_ BitVec 32))) )
))
(declare-datatypes ((array!64259 0))(
  ( (array!64260 (arr!30932 (Array (_ BitVec 32) ValueCell!11336)) (size!31446 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5266 0))(
  ( (LongMapFixedSize!5267 (defaultEntry!5985 Int) (mask!29693 (_ BitVec 32)) (extraKeys!5717 (_ BitVec 32)) (zeroValue!5821 V!36979) (minValue!5821 V!36979) (_size!2688 (_ BitVec 32)) (_keys!11170 array!64257) (_values!6008 array!64259) (_vacant!2688 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5266)

(declare-datatypes ((List!21712 0))(
  ( (Nil!21709) (Cons!21708 (h!22915 (_ BitVec 64)) (t!30766 List!21712)) )
))
(declare-fun arrayNoDuplicates!0 (array!64257 (_ BitVec 32) List!21712) Bool)

(assert (=> b!1025613 (= lt!451093 (arrayNoDuplicates!0 (_keys!11170 thiss!1427) #b00000000000000000000000000000000 Nil!21709))))

(declare-fun b!1025614 () Bool)

(declare-fun res!686316 () Bool)

(assert (=> b!1025614 (=> res!686316 e!578209)))

(declare-fun contains!5966 (List!21712 (_ BitVec 64)) Bool)

(assert (=> b!1025614 (= res!686316 (contains!5966 Nil!21709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025615 () Bool)

(declare-fun res!686317 () Bool)

(assert (=> b!1025615 (=> res!686317 e!578209)))

(declare-fun noDuplicate!1469 (List!21712) Bool)

(assert (=> b!1025615 (= res!686317 (not (noDuplicate!1469 Nil!21709)))))

(declare-fun mapNonEmpty!37547 () Bool)

(declare-fun mapRes!37547 () Bool)

(declare-fun tp!72122 () Bool)

(declare-fun e!578206 () Bool)

(assert (=> mapNonEmpty!37547 (= mapRes!37547 (and tp!72122 e!578206))))

(declare-fun mapRest!37547 () (Array (_ BitVec 32) ValueCell!11336))

(declare-fun mapKey!37547 () (_ BitVec 32))

(declare-fun mapValue!37547 () ValueCell!11336)

(assert (=> mapNonEmpty!37547 (= (arr!30932 (_values!6008 thiss!1427)) (store mapRest!37547 mapKey!37547 mapValue!37547))))

(declare-fun b!1025616 () Bool)

(declare-fun e!578203 () Bool)

(assert (=> b!1025616 (= e!578203 (and e!578204 mapRes!37547))))

(declare-fun condMapEmpty!37547 () Bool)

(declare-fun mapDefault!37547 () ValueCell!11336)

(assert (=> b!1025616 (= condMapEmpty!37547 (= (arr!30932 (_values!6008 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11336)) mapDefault!37547)))))

(declare-fun b!1025617 () Bool)

(declare-fun e!578207 () Bool)

(declare-fun e!578205 () Bool)

(assert (=> b!1025617 (= e!578207 e!578205)))

(declare-fun res!686319 () Bool)

(assert (=> b!1025617 (=> (not res!686319) (not e!578205))))

(declare-datatypes ((SeekEntryResult!9546 0))(
  ( (MissingZero!9546 (index!40555 (_ BitVec 32))) (Found!9546 (index!40556 (_ BitVec 32))) (Intermediate!9546 (undefined!10358 Bool) (index!40557 (_ BitVec 32)) (x!91046 (_ BitVec 32))) (Undefined!9546) (MissingVacant!9546 (index!40558 (_ BitVec 32))) )
))
(declare-fun lt!451094 () SeekEntryResult!9546)

(get-info :version)

(assert (=> b!1025617 (= res!686319 ((_ is Found!9546) lt!451094))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64257 (_ BitVec 32)) SeekEntryResult!9546)

(assert (=> b!1025617 (= lt!451094 (seekEntry!0 key!909 (_keys!11170 thiss!1427) (mask!29693 thiss!1427)))))

(declare-fun b!1025618 () Bool)

(declare-fun res!686315 () Bool)

(assert (=> b!1025618 (=> (not res!686315) (not e!578207))))

(assert (=> b!1025618 (= res!686315 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025619 () Bool)

(assert (=> b!1025619 (= e!578205 (not e!578209))))

(declare-fun res!686318 () Bool)

(assert (=> b!1025619 (=> res!686318 e!578209)))

(assert (=> b!1025619 (= res!686318 (or (bvsge (size!31445 (_keys!11170 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31445 (_keys!11170 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64257 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025619 (= (arrayCountValidKeys!0 (array!64258 (store (arr!30931 (_keys!11170 thiss!1427)) (index!40556 lt!451094) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31445 (_keys!11170 thiss!1427))) #b00000000000000000000000000000000 (size!31445 (_keys!11170 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11170 thiss!1427) #b00000000000000000000000000000000 (size!31445 (_keys!11170 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33350 0))(
  ( (Unit!33351) )
))
(declare-fun lt!451092 () Unit!33350)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64257 (_ BitVec 32) (_ BitVec 64)) Unit!33350)

(assert (=> b!1025619 (= lt!451092 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11170 thiss!1427) (index!40556 lt!451094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!686320 () Bool)

(assert (=> start!89594 (=> (not res!686320) (not e!578207))))

(declare-fun valid!2010 (LongMapFixedSize!5266) Bool)

(assert (=> start!89594 (= res!686320 (valid!2010 thiss!1427))))

(assert (=> start!89594 e!578207))

(declare-fun e!578202 () Bool)

(assert (=> start!89594 e!578202))

(assert (=> start!89594 true))

(declare-fun b!1025620 () Bool)

(declare-fun res!686321 () Bool)

(assert (=> b!1025620 (=> res!686321 e!578209)))

(assert (=> b!1025620 (= res!686321 (contains!5966 Nil!21709 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025621 () Bool)

(assert (=> b!1025621 (= e!578206 tp_is_empty!24079)))

(declare-fun array_inv!23979 (array!64257) Bool)

(declare-fun array_inv!23980 (array!64259) Bool)

(assert (=> b!1025622 (= e!578202 (and tp!72123 tp_is_empty!24079 (array_inv!23979 (_keys!11170 thiss!1427)) (array_inv!23980 (_values!6008 thiss!1427)) e!578203))))

(declare-fun mapIsEmpty!37547 () Bool)

(assert (=> mapIsEmpty!37547 mapRes!37547))

(assert (= (and start!89594 res!686320) b!1025618))

(assert (= (and b!1025618 res!686315) b!1025617))

(assert (= (and b!1025617 res!686319) b!1025619))

(assert (= (and b!1025619 (not res!686318)) b!1025615))

(assert (= (and b!1025615 (not res!686317)) b!1025614))

(assert (= (and b!1025614 (not res!686316)) b!1025620))

(assert (= (and b!1025620 (not res!686321)) b!1025613))

(assert (= (and b!1025616 condMapEmpty!37547) mapIsEmpty!37547))

(assert (= (and b!1025616 (not condMapEmpty!37547)) mapNonEmpty!37547))

(assert (= (and mapNonEmpty!37547 ((_ is ValueCellFull!11336) mapValue!37547)) b!1025621))

(assert (= (and b!1025616 ((_ is ValueCellFull!11336) mapDefault!37547)) b!1025612))

(assert (= b!1025622 b!1025616))

(assert (= start!89594 b!1025622))

(declare-fun m!944337 () Bool)

(assert (=> b!1025620 m!944337))

(declare-fun m!944339 () Bool)

(assert (=> b!1025614 m!944339))

(declare-fun m!944341 () Bool)

(assert (=> start!89594 m!944341))

(declare-fun m!944343 () Bool)

(assert (=> b!1025619 m!944343))

(declare-fun m!944345 () Bool)

(assert (=> b!1025619 m!944345))

(declare-fun m!944347 () Bool)

(assert (=> b!1025619 m!944347))

(declare-fun m!944349 () Bool)

(assert (=> b!1025619 m!944349))

(declare-fun m!944351 () Bool)

(assert (=> b!1025613 m!944351))

(declare-fun m!944353 () Bool)

(assert (=> b!1025617 m!944353))

(declare-fun m!944355 () Bool)

(assert (=> mapNonEmpty!37547 m!944355))

(declare-fun m!944357 () Bool)

(assert (=> b!1025615 m!944357))

(declare-fun m!944359 () Bool)

(assert (=> b!1025622 m!944359))

(declare-fun m!944361 () Bool)

(assert (=> b!1025622 m!944361))

(check-sat (not b!1025619) (not b!1025622) (not b_next!20359) (not b!1025614) (not b!1025613) (not b!1025615) (not b!1025617) tp_is_empty!24079 (not b!1025620) (not mapNonEmpty!37547) (not start!89594) b_and!32615)
(check-sat b_and!32615 (not b_next!20359))
