; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16690 () Bool)

(assert start!16690)

(declare-fun b!167191 () Bool)

(declare-fun b_free!3991 () Bool)

(declare-fun b_next!3991 () Bool)

(assert (=> b!167191 (= b_free!3991 (not b_next!3991))))

(declare-fun tp!14574 () Bool)

(declare-fun b_and!10419 () Bool)

(assert (=> b!167191 (= tp!14574 b_and!10419)))

(declare-fun mapNonEmpty!6408 () Bool)

(declare-fun mapRes!6408 () Bool)

(declare-fun tp!14573 () Bool)

(declare-fun e!109760 () Bool)

(assert (=> mapNonEmpty!6408 (= mapRes!6408 (and tp!14573 e!109760))))

(declare-datatypes ((V!4705 0))(
  ( (V!4706 (val!1941 Int)) )
))
(declare-datatypes ((ValueCell!1553 0))(
  ( (ValueCellFull!1553 (v!3807 V!4705)) (EmptyCell!1553) )
))
(declare-fun mapRest!6408 () (Array (_ BitVec 32) ValueCell!1553))

(declare-datatypes ((array!6669 0))(
  ( (array!6670 (arr!3170 (Array (_ BitVec 32) (_ BitVec 64))) (size!3458 (_ BitVec 32))) )
))
(declare-datatypes ((array!6671 0))(
  ( (array!6672 (arr!3171 (Array (_ BitVec 32) ValueCell!1553)) (size!3459 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2014 0))(
  ( (LongMapFixedSize!2015 (defaultEntry!3449 Int) (mask!8192 (_ BitVec 32)) (extraKeys!3190 (_ BitVec 32)) (zeroValue!3292 V!4705) (minValue!3292 V!4705) (_size!1056 (_ BitVec 32)) (_keys!5274 array!6669) (_values!3432 array!6671) (_vacant!1056 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2014)

(declare-fun mapKey!6408 () (_ BitVec 32))

(declare-fun mapValue!6408 () ValueCell!1553)

(assert (=> mapNonEmpty!6408 (= (arr!3171 (_values!3432 thiss!1248)) (store mapRest!6408 mapKey!6408 mapValue!6408))))

(declare-fun b!167183 () Bool)

(declare-fun res!79500 () Bool)

(declare-fun e!109758 () Bool)

(assert (=> b!167183 (=> (not res!79500) (not e!109758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6669 (_ BitVec 32)) Bool)

(assert (=> b!167183 (= res!79500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5274 thiss!1248) (mask!8192 thiss!1248)))))

(declare-fun b!167184 () Bool)

(declare-datatypes ((Unit!5121 0))(
  ( (Unit!5122) )
))
(declare-fun e!109759 () Unit!5121)

(declare-fun Unit!5123 () Unit!5121)

(assert (=> b!167184 (= e!109759 Unit!5123)))

(declare-fun lt!83637 () Unit!5121)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!99 (array!6669 array!6671 (_ BitVec 32) (_ BitVec 32) V!4705 V!4705 (_ BitVec 64) Int) Unit!5121)

(assert (=> b!167184 (= lt!83637 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!99 (_keys!5274 thiss!1248) (_values!3432 thiss!1248) (mask!8192 thiss!1248) (extraKeys!3190 thiss!1248) (zeroValue!3292 thiss!1248) (minValue!3292 thiss!1248) key!828 (defaultEntry!3449 thiss!1248)))))

(assert (=> b!167184 false))

(declare-fun b!167185 () Bool)

(declare-datatypes ((SeekEntryResult!466 0))(
  ( (MissingZero!466 (index!4032 (_ BitVec 32))) (Found!466 (index!4033 (_ BitVec 32))) (Intermediate!466 (undefined!1278 Bool) (index!4034 (_ BitVec 32)) (x!18494 (_ BitVec 32))) (Undefined!466) (MissingVacant!466 (index!4035 (_ BitVec 32))) )
))
(declare-fun lt!83633 () SeekEntryResult!466)

(declare-fun e!109763 () Bool)

(assert (=> b!167185 (= e!109763 (= (select (arr!3170 (_keys!5274 thiss!1248)) (index!4033 lt!83633)) key!828))))

(declare-fun b!167186 () Bool)

(declare-fun e!109761 () Bool)

(assert (=> b!167186 (= e!109761 e!109758)))

(declare-fun res!79501 () Bool)

(assert (=> b!167186 (=> (not res!79501) (not e!109758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167186 (= res!79501 (validMask!0 (mask!8192 thiss!1248)))))

(declare-fun lt!83634 () Unit!5121)

(assert (=> b!167186 (= lt!83634 e!109759)))

(declare-fun c!30281 () Bool)

(declare-datatypes ((tuple2!3088 0))(
  ( (tuple2!3089 (_1!1555 (_ BitVec 64)) (_2!1555 V!4705)) )
))
(declare-datatypes ((List!2103 0))(
  ( (Nil!2100) (Cons!2099 (h!2716 tuple2!3088) (t!6897 List!2103)) )
))
(declare-datatypes ((ListLongMap!2049 0))(
  ( (ListLongMap!2050 (toList!1040 List!2103)) )
))
(declare-fun contains!1092 (ListLongMap!2049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!702 (array!6669 array!6671 (_ BitVec 32) (_ BitVec 32) V!4705 V!4705 (_ BitVec 32) Int) ListLongMap!2049)

(assert (=> b!167186 (= c!30281 (contains!1092 (getCurrentListMap!702 (_keys!5274 thiss!1248) (_values!3432 thiss!1248) (mask!8192 thiss!1248) (extraKeys!3190 thiss!1248) (zeroValue!3292 thiss!1248) (minValue!3292 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3449 thiss!1248)) key!828))))

(declare-fun b!167187 () Bool)

(declare-fun e!109754 () Bool)

(declare-fun e!109756 () Bool)

(assert (=> b!167187 (= e!109754 (and e!109756 mapRes!6408))))

(declare-fun condMapEmpty!6408 () Bool)

(declare-fun mapDefault!6408 () ValueCell!1553)

(assert (=> b!167187 (= condMapEmpty!6408 (= (arr!3171 (_values!3432 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1553)) mapDefault!6408)))))

(declare-fun b!167188 () Bool)

(declare-fun lt!83636 () Unit!5121)

(assert (=> b!167188 (= e!109759 lt!83636)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!103 (array!6669 array!6671 (_ BitVec 32) (_ BitVec 32) V!4705 V!4705 (_ BitVec 64) Int) Unit!5121)

(assert (=> b!167188 (= lt!83636 (lemmaInListMapThenSeekEntryOrOpenFindsIt!103 (_keys!5274 thiss!1248) (_values!3432 thiss!1248) (mask!8192 thiss!1248) (extraKeys!3190 thiss!1248) (zeroValue!3292 thiss!1248) (minValue!3292 thiss!1248) key!828 (defaultEntry!3449 thiss!1248)))))

(declare-fun res!79499 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167188 (= res!79499 (inRange!0 (index!4033 lt!83633) (mask!8192 thiss!1248)))))

(assert (=> b!167188 (=> (not res!79499) (not e!109763))))

(assert (=> b!167188 e!109763))

(declare-fun b!167189 () Bool)

(declare-fun e!109762 () Bool)

(assert (=> b!167189 (= e!109762 e!109761)))

(declare-fun res!79503 () Bool)

(assert (=> b!167189 (=> (not res!79503) (not e!109761))))

(get-info :version)

(assert (=> b!167189 (= res!79503 (and (not ((_ is Undefined!466) lt!83633)) (not ((_ is MissingVacant!466) lt!83633)) (not ((_ is MissingZero!466) lt!83633)) ((_ is Found!466) lt!83633)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6669 (_ BitVec 32)) SeekEntryResult!466)

(assert (=> b!167189 (= lt!83633 (seekEntryOrOpen!0 key!828 (_keys!5274 thiss!1248) (mask!8192 thiss!1248)))))

(declare-fun b!167190 () Bool)

(declare-fun res!79497 () Bool)

(assert (=> b!167190 (=> (not res!79497) (not e!109758))))

(assert (=> b!167190 (= res!79497 (and (= (size!3459 (_values!3432 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8192 thiss!1248))) (= (size!3458 (_keys!5274 thiss!1248)) (size!3459 (_values!3432 thiss!1248))) (bvsge (mask!8192 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3190 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3190 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!79498 () Bool)

(assert (=> start!16690 (=> (not res!79498) (not e!109762))))

(declare-fun valid!891 (LongMapFixedSize!2014) Bool)

(assert (=> start!16690 (= res!79498 (valid!891 thiss!1248))))

(assert (=> start!16690 e!109762))

(declare-fun e!109755 () Bool)

(assert (=> start!16690 e!109755))

(assert (=> start!16690 true))

(declare-fun tp_is_empty!3793 () Bool)

(declare-fun array_inv!2025 (array!6669) Bool)

(declare-fun array_inv!2026 (array!6671) Bool)

(assert (=> b!167191 (= e!109755 (and tp!14574 tp_is_empty!3793 (array_inv!2025 (_keys!5274 thiss!1248)) (array_inv!2026 (_values!3432 thiss!1248)) e!109754))))

(declare-fun b!167192 () Bool)

(declare-fun res!79502 () Bool)

(assert (=> b!167192 (=> (not res!79502) (not e!109762))))

(assert (=> b!167192 (= res!79502 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167193 () Bool)

(assert (=> b!167193 (= e!109760 tp_is_empty!3793)))

(declare-fun b!167194 () Bool)

(assert (=> b!167194 (= e!109758 false)))

(declare-fun lt!83635 () Bool)

(declare-datatypes ((List!2104 0))(
  ( (Nil!2101) (Cons!2100 (h!2717 (_ BitVec 64)) (t!6898 List!2104)) )
))
(declare-fun arrayNoDuplicates!0 (array!6669 (_ BitVec 32) List!2104) Bool)

(assert (=> b!167194 (= lt!83635 (arrayNoDuplicates!0 (_keys!5274 thiss!1248) #b00000000000000000000000000000000 Nil!2101))))

(declare-fun mapIsEmpty!6408 () Bool)

(assert (=> mapIsEmpty!6408 mapRes!6408))

(declare-fun b!167195 () Bool)

(assert (=> b!167195 (= e!109756 tp_is_empty!3793)))

(assert (= (and start!16690 res!79498) b!167192))

(assert (= (and b!167192 res!79502) b!167189))

(assert (= (and b!167189 res!79503) b!167186))

(assert (= (and b!167186 c!30281) b!167188))

(assert (= (and b!167186 (not c!30281)) b!167184))

(assert (= (and b!167188 res!79499) b!167185))

(assert (= (and b!167186 res!79501) b!167190))

(assert (= (and b!167190 res!79497) b!167183))

(assert (= (and b!167183 res!79500) b!167194))

(assert (= (and b!167187 condMapEmpty!6408) mapIsEmpty!6408))

(assert (= (and b!167187 (not condMapEmpty!6408)) mapNonEmpty!6408))

(assert (= (and mapNonEmpty!6408 ((_ is ValueCellFull!1553) mapValue!6408)) b!167193))

(assert (= (and b!167187 ((_ is ValueCellFull!1553) mapDefault!6408)) b!167195))

(assert (= b!167191 b!167187))

(assert (= start!16690 b!167191))

(declare-fun m!196565 () Bool)

(assert (=> b!167183 m!196565))

(declare-fun m!196567 () Bool)

(assert (=> b!167189 m!196567))

(declare-fun m!196569 () Bool)

(assert (=> b!167185 m!196569))

(declare-fun m!196571 () Bool)

(assert (=> b!167194 m!196571))

(declare-fun m!196573 () Bool)

(assert (=> b!167188 m!196573))

(declare-fun m!196575 () Bool)

(assert (=> b!167188 m!196575))

(declare-fun m!196577 () Bool)

(assert (=> mapNonEmpty!6408 m!196577))

(declare-fun m!196579 () Bool)

(assert (=> b!167184 m!196579))

(declare-fun m!196581 () Bool)

(assert (=> start!16690 m!196581))

(declare-fun m!196583 () Bool)

(assert (=> b!167186 m!196583))

(declare-fun m!196585 () Bool)

(assert (=> b!167186 m!196585))

(assert (=> b!167186 m!196585))

(declare-fun m!196587 () Bool)

(assert (=> b!167186 m!196587))

(declare-fun m!196589 () Bool)

(assert (=> b!167191 m!196589))

(declare-fun m!196591 () Bool)

(assert (=> b!167191 m!196591))

(check-sat (not b_next!3991) (not b!167191) (not b!167189) (not b!167184) b_and!10419 (not mapNonEmpty!6408) (not b!167194) (not b!167188) tp_is_empty!3793 (not start!16690) (not b!167186) (not b!167183))
(check-sat b_and!10419 (not b_next!3991))
