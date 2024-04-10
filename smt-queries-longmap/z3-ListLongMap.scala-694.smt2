; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16670 () Bool)

(assert start!16670)

(declare-fun b!166835 () Bool)

(declare-fun b_free!3975 () Bool)

(declare-fun b_next!3975 () Bool)

(assert (=> b!166835 (= b_free!3975 (not b_next!3975))))

(declare-fun tp!14525 () Bool)

(declare-fun b_and!10389 () Bool)

(assert (=> b!166835 (= tp!14525 b_and!10389)))

(declare-fun b!166824 () Bool)

(declare-fun e!109499 () Bool)

(declare-fun tp_is_empty!3777 () Bool)

(assert (=> b!166824 (= e!109499 tp_is_empty!3777)))

(declare-fun b!166825 () Bool)

(declare-datatypes ((Unit!5084 0))(
  ( (Unit!5085) )
))
(declare-fun e!109495 () Unit!5084)

(declare-fun lt!83456 () Unit!5084)

(assert (=> b!166825 (= e!109495 lt!83456)))

(declare-datatypes ((V!4683 0))(
  ( (V!4684 (val!1933 Int)) )
))
(declare-datatypes ((ValueCell!1545 0))(
  ( (ValueCellFull!1545 (v!3798 V!4683)) (EmptyCell!1545) )
))
(declare-datatypes ((array!6651 0))(
  ( (array!6652 (arr!3161 (Array (_ BitVec 32) (_ BitVec 64))) (size!3449 (_ BitVec 32))) )
))
(declare-datatypes ((array!6653 0))(
  ( (array!6654 (arr!3162 (Array (_ BitVec 32) ValueCell!1545)) (size!3450 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1998 0))(
  ( (LongMapFixedSize!1999 (defaultEntry!3441 Int) (mask!8178 (_ BitVec 32)) (extraKeys!3182 (_ BitVec 32)) (zeroValue!3284 V!4683) (minValue!3284 V!4683) (_size!1048 (_ BitVec 32)) (_keys!5266 array!6651) (_values!3424 array!6653) (_vacant!1048 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1998)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!93 (array!6651 array!6653 (_ BitVec 32) (_ BitVec 32) V!4683 V!4683 (_ BitVec 64) Int) Unit!5084)

(assert (=> b!166825 (= lt!83456 (lemmaInListMapThenSeekEntryOrOpenFindsIt!93 (_keys!5266 thiss!1248) (_values!3424 thiss!1248) (mask!8178 thiss!1248) (extraKeys!3182 thiss!1248) (zeroValue!3284 thiss!1248) (minValue!3284 thiss!1248) key!828 (defaultEntry!3441 thiss!1248)))))

(declare-fun res!79309 () Bool)

(declare-datatypes ((SeekEntryResult!464 0))(
  ( (MissingZero!464 (index!4024 (_ BitVec 32))) (Found!464 (index!4025 (_ BitVec 32))) (Intermediate!464 (undefined!1276 Bool) (index!4026 (_ BitVec 32)) (x!18468 (_ BitVec 32))) (Undefined!464) (MissingVacant!464 (index!4027 (_ BitVec 32))) )
))
(declare-fun lt!83458 () SeekEntryResult!464)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166825 (= res!79309 (inRange!0 (index!4025 lt!83458) (mask!8178 thiss!1248)))))

(declare-fun e!109496 () Bool)

(assert (=> b!166825 (=> (not res!79309) (not e!109496))))

(assert (=> b!166825 e!109496))

(declare-fun mapNonEmpty!6384 () Bool)

(declare-fun mapRes!6384 () Bool)

(declare-fun tp!14526 () Bool)

(assert (=> mapNonEmpty!6384 (= mapRes!6384 (and tp!14526 e!109499))))

(declare-fun mapKey!6384 () (_ BitVec 32))

(declare-fun mapRest!6384 () (Array (_ BitVec 32) ValueCell!1545))

(declare-fun mapValue!6384 () ValueCell!1545)

(assert (=> mapNonEmpty!6384 (= (arr!3162 (_values!3424 thiss!1248)) (store mapRest!6384 mapKey!6384 mapValue!6384))))

(declare-fun mapIsEmpty!6384 () Bool)

(assert (=> mapIsEmpty!6384 mapRes!6384))

(declare-fun res!79312 () Bool)

(declare-fun e!109493 () Bool)

(assert (=> start!16670 (=> (not res!79312) (not e!109493))))

(declare-fun valid!875 (LongMapFixedSize!1998) Bool)

(assert (=> start!16670 (= res!79312 (valid!875 thiss!1248))))

(assert (=> start!16670 e!109493))

(declare-fun e!109498 () Bool)

(assert (=> start!16670 e!109498))

(assert (=> start!16670 true))

(declare-fun b!166826 () Bool)

(declare-fun e!109490 () Bool)

(assert (=> b!166826 (= e!109490 false)))

(declare-fun lt!83455 () Bool)

(declare-datatypes ((List!2105 0))(
  ( (Nil!2102) (Cons!2101 (h!2718 (_ BitVec 64)) (t!6907 List!2105)) )
))
(declare-fun arrayNoDuplicates!0 (array!6651 (_ BitVec 32) List!2105) Bool)

(assert (=> b!166826 (= lt!83455 (arrayNoDuplicates!0 (_keys!5266 thiss!1248) #b00000000000000000000000000000000 Nil!2102))))

(declare-fun b!166827 () Bool)

(declare-fun Unit!5086 () Unit!5084)

(assert (=> b!166827 (= e!109495 Unit!5086)))

(declare-fun lt!83457 () Unit!5084)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!95 (array!6651 array!6653 (_ BitVec 32) (_ BitVec 32) V!4683 V!4683 (_ BitVec 64) Int) Unit!5084)

(assert (=> b!166827 (= lt!83457 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!95 (_keys!5266 thiss!1248) (_values!3424 thiss!1248) (mask!8178 thiss!1248) (extraKeys!3182 thiss!1248) (zeroValue!3284 thiss!1248) (minValue!3284 thiss!1248) key!828 (defaultEntry!3441 thiss!1248)))))

(assert (=> b!166827 false))

(declare-fun b!166828 () Bool)

(assert (=> b!166828 (= e!109496 (= (select (arr!3161 (_keys!5266 thiss!1248)) (index!4025 lt!83458)) key!828))))

(declare-fun b!166829 () Bool)

(declare-fun e!109497 () Bool)

(declare-fun e!109492 () Bool)

(assert (=> b!166829 (= e!109497 (and e!109492 mapRes!6384))))

(declare-fun condMapEmpty!6384 () Bool)

(declare-fun mapDefault!6384 () ValueCell!1545)

(assert (=> b!166829 (= condMapEmpty!6384 (= (arr!3162 (_values!3424 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1545)) mapDefault!6384)))))

(declare-fun b!166830 () Bool)

(assert (=> b!166830 (= e!109492 tp_is_empty!3777)))

(declare-fun b!166831 () Bool)

(declare-fun e!109494 () Bool)

(assert (=> b!166831 (= e!109494 e!109490)))

(declare-fun res!79313 () Bool)

(assert (=> b!166831 (=> (not res!79313) (not e!109490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166831 (= res!79313 (validMask!0 (mask!8178 thiss!1248)))))

(declare-fun lt!83454 () Unit!5084)

(assert (=> b!166831 (= lt!83454 e!109495)))

(declare-fun c!30244 () Bool)

(declare-datatypes ((tuple2!3116 0))(
  ( (tuple2!3117 (_1!1569 (_ BitVec 64)) (_2!1569 V!4683)) )
))
(declare-datatypes ((List!2106 0))(
  ( (Nil!2103) (Cons!2102 (h!2719 tuple2!3116) (t!6908 List!2106)) )
))
(declare-datatypes ((ListLongMap!2071 0))(
  ( (ListLongMap!2072 (toList!1051 List!2106)) )
))
(declare-fun contains!1093 (ListLongMap!2071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!709 (array!6651 array!6653 (_ BitVec 32) (_ BitVec 32) V!4683 V!4683 (_ BitVec 32) Int) ListLongMap!2071)

(assert (=> b!166831 (= c!30244 (contains!1093 (getCurrentListMap!709 (_keys!5266 thiss!1248) (_values!3424 thiss!1248) (mask!8178 thiss!1248) (extraKeys!3182 thiss!1248) (zeroValue!3284 thiss!1248) (minValue!3284 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3441 thiss!1248)) key!828))))

(declare-fun b!166832 () Bool)

(declare-fun res!79308 () Bool)

(assert (=> b!166832 (=> (not res!79308) (not e!109493))))

(assert (=> b!166832 (= res!79308 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166833 () Bool)

(assert (=> b!166833 (= e!109493 e!109494)))

(declare-fun res!79310 () Bool)

(assert (=> b!166833 (=> (not res!79310) (not e!109494))))

(get-info :version)

(assert (=> b!166833 (= res!79310 (and (not ((_ is Undefined!464) lt!83458)) (not ((_ is MissingVacant!464) lt!83458)) (not ((_ is MissingZero!464) lt!83458)) ((_ is Found!464) lt!83458)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6651 (_ BitVec 32)) SeekEntryResult!464)

(assert (=> b!166833 (= lt!83458 (seekEntryOrOpen!0 key!828 (_keys!5266 thiss!1248) (mask!8178 thiss!1248)))))

(declare-fun b!166834 () Bool)

(declare-fun res!79311 () Bool)

(assert (=> b!166834 (=> (not res!79311) (not e!109490))))

(assert (=> b!166834 (= res!79311 (and (= (size!3450 (_values!3424 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8178 thiss!1248))) (= (size!3449 (_keys!5266 thiss!1248)) (size!3450 (_values!3424 thiss!1248))) (bvsge (mask!8178 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3182 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3182 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun array_inv!2029 (array!6651) Bool)

(declare-fun array_inv!2030 (array!6653) Bool)

(assert (=> b!166835 (= e!109498 (and tp!14525 tp_is_empty!3777 (array_inv!2029 (_keys!5266 thiss!1248)) (array_inv!2030 (_values!3424 thiss!1248)) e!109497))))

(declare-fun b!166836 () Bool)

(declare-fun res!79314 () Bool)

(assert (=> b!166836 (=> (not res!79314) (not e!109490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6651 (_ BitVec 32)) Bool)

(assert (=> b!166836 (= res!79314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5266 thiss!1248) (mask!8178 thiss!1248)))))

(assert (= (and start!16670 res!79312) b!166832))

(assert (= (and b!166832 res!79308) b!166833))

(assert (= (and b!166833 res!79310) b!166831))

(assert (= (and b!166831 c!30244) b!166825))

(assert (= (and b!166831 (not c!30244)) b!166827))

(assert (= (and b!166825 res!79309) b!166828))

(assert (= (and b!166831 res!79313) b!166834))

(assert (= (and b!166834 res!79311) b!166836))

(assert (= (and b!166836 res!79314) b!166826))

(assert (= (and b!166829 condMapEmpty!6384) mapIsEmpty!6384))

(assert (= (and b!166829 (not condMapEmpty!6384)) mapNonEmpty!6384))

(assert (= (and mapNonEmpty!6384 ((_ is ValueCellFull!1545) mapValue!6384)) b!166824))

(assert (= (and b!166829 ((_ is ValueCellFull!1545) mapDefault!6384)) b!166830))

(assert (= b!166835 b!166829))

(assert (= start!16670 b!166835))

(declare-fun m!196159 () Bool)

(assert (=> start!16670 m!196159))

(declare-fun m!196161 () Bool)

(assert (=> b!166826 m!196161))

(declare-fun m!196163 () Bool)

(assert (=> b!166825 m!196163))

(declare-fun m!196165 () Bool)

(assert (=> b!166825 m!196165))

(declare-fun m!196167 () Bool)

(assert (=> b!166831 m!196167))

(declare-fun m!196169 () Bool)

(assert (=> b!166831 m!196169))

(assert (=> b!166831 m!196169))

(declare-fun m!196171 () Bool)

(assert (=> b!166831 m!196171))

(declare-fun m!196173 () Bool)

(assert (=> mapNonEmpty!6384 m!196173))

(declare-fun m!196175 () Bool)

(assert (=> b!166828 m!196175))

(declare-fun m!196177 () Bool)

(assert (=> b!166833 m!196177))

(declare-fun m!196179 () Bool)

(assert (=> b!166835 m!196179))

(declare-fun m!196181 () Bool)

(assert (=> b!166835 m!196181))

(declare-fun m!196183 () Bool)

(assert (=> b!166836 m!196183))

(declare-fun m!196185 () Bool)

(assert (=> b!166827 m!196185))

(check-sat (not b!166831) (not b!166833) b_and!10389 (not b!166826) (not b!166835) (not b_next!3975) (not b!166827) (not b!166825) (not mapNonEmpty!6384) (not b!166836) (not start!16670) tp_is_empty!3777)
(check-sat b_and!10389 (not b_next!3975))
