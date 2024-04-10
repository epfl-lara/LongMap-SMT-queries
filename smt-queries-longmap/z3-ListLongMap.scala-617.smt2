; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16052 () Bool)

(assert start!16052)

(declare-fun b!159274 () Bool)

(declare-fun b_free!3513 () Bool)

(declare-fun b_next!3513 () Bool)

(assert (=> b!159274 (= b_free!3513 (not b_next!3513))))

(declare-fun tp!13108 () Bool)

(declare-fun b_and!9927 () Bool)

(assert (=> b!159274 (= tp!13108 b_and!9927)))

(declare-fun b!159264 () Bool)

(declare-fun e!104268 () Bool)

(assert (=> b!159264 (= e!104268 false)))

(declare-fun lt!81982 () Bool)

(declare-datatypes ((V!4067 0))(
  ( (V!4068 (val!1702 Int)) )
))
(declare-datatypes ((ValueCell!1314 0))(
  ( (ValueCellFull!1314 (v!3567 V!4067)) (EmptyCell!1314) )
))
(declare-datatypes ((array!5709 0))(
  ( (array!5710 (arr!2699 (Array (_ BitVec 32) (_ BitVec 64))) (size!2983 (_ BitVec 32))) )
))
(declare-datatypes ((array!5711 0))(
  ( (array!5712 (arr!2700 (Array (_ BitVec 32) ValueCell!1314)) (size!2984 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1536 0))(
  ( (LongMapFixedSize!1537 (defaultEntry!3210 Int) (mask!7756 (_ BitVec 32)) (extraKeys!2951 (_ BitVec 32)) (zeroValue!3053 V!4067) (minValue!3053 V!4067) (_size!817 (_ BitVec 32)) (_keys!5011 array!5709) (_values!3193 array!5711) (_vacant!817 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1536)

(declare-datatypes ((List!1900 0))(
  ( (Nil!1897) (Cons!1896 (h!2509 (_ BitVec 64)) (t!6702 List!1900)) )
))
(declare-fun arrayNoDuplicates!0 (array!5709 (_ BitVec 32) List!1900) Bool)

(assert (=> b!159264 (= lt!81982 (arrayNoDuplicates!0 (_keys!5011 thiss!1248) #b00000000000000000000000000000000 Nil!1897))))

(declare-fun b!159265 () Bool)

(declare-fun e!104263 () Bool)

(declare-fun tp_is_empty!3315 () Bool)

(assert (=> b!159265 (= e!104263 tp_is_empty!3315)))

(declare-fun b!159266 () Bool)

(declare-fun e!104267 () Bool)

(assert (=> b!159266 (= e!104267 tp_is_empty!3315)))

(declare-fun b!159267 () Bool)

(declare-fun res!75218 () Bool)

(assert (=> b!159267 (=> (not res!75218) (not e!104268))))

(assert (=> b!159267 (= res!75218 (and (= (size!2984 (_values!3193 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7756 thiss!1248))) (= (size!2983 (_keys!5011 thiss!1248)) (size!2984 (_values!3193 thiss!1248))) (bvsge (mask!7756 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2951 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2951 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5660 () Bool)

(declare-fun mapRes!5660 () Bool)

(declare-fun tp!13109 () Bool)

(assert (=> mapNonEmpty!5660 (= mapRes!5660 (and tp!13109 e!104267))))

(declare-fun mapKey!5660 () (_ BitVec 32))

(declare-fun mapRest!5660 () (Array (_ BitVec 32) ValueCell!1314))

(declare-fun mapValue!5660 () ValueCell!1314)

(assert (=> mapNonEmpty!5660 (= (arr!2700 (_values!3193 thiss!1248)) (store mapRest!5660 mapKey!5660 mapValue!5660))))

(declare-fun b!159268 () Bool)

(declare-fun res!75221 () Bool)

(assert (=> b!159268 (=> (not res!75221) (not e!104268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159268 (= res!75221 (validMask!0 (mask!7756 thiss!1248)))))

(declare-fun res!75222 () Bool)

(assert (=> start!16052 (=> (not res!75222) (not e!104268))))

(declare-fun valid!720 (LongMapFixedSize!1536) Bool)

(assert (=> start!16052 (= res!75222 (valid!720 thiss!1248))))

(assert (=> start!16052 e!104268))

(declare-fun e!104266 () Bool)

(assert (=> start!16052 e!104266))

(assert (=> start!16052 true))

(declare-fun mapIsEmpty!5660 () Bool)

(assert (=> mapIsEmpty!5660 mapRes!5660))

(declare-fun b!159269 () Bool)

(declare-fun res!75220 () Bool)

(assert (=> b!159269 (=> (not res!75220) (not e!104268))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2882 0))(
  ( (tuple2!2883 (_1!1452 (_ BitVec 64)) (_2!1452 V!4067)) )
))
(declare-datatypes ((List!1901 0))(
  ( (Nil!1898) (Cons!1897 (h!2510 tuple2!2882) (t!6703 List!1901)) )
))
(declare-datatypes ((ListLongMap!1869 0))(
  ( (ListLongMap!1870 (toList!950 List!1901)) )
))
(declare-fun contains!986 (ListLongMap!1869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!614 (array!5709 array!5711 (_ BitVec 32) (_ BitVec 32) V!4067 V!4067 (_ BitVec 32) Int) ListLongMap!1869)

(assert (=> b!159269 (= res!75220 (contains!986 (getCurrentListMap!614 (_keys!5011 thiss!1248) (_values!3193 thiss!1248) (mask!7756 thiss!1248) (extraKeys!2951 thiss!1248) (zeroValue!3053 thiss!1248) (minValue!3053 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3210 thiss!1248)) key!828))))

(declare-fun b!159270 () Bool)

(declare-fun e!104264 () Bool)

(assert (=> b!159270 (= e!104264 (and e!104263 mapRes!5660))))

(declare-fun condMapEmpty!5660 () Bool)

(declare-fun mapDefault!5660 () ValueCell!1314)

(assert (=> b!159270 (= condMapEmpty!5660 (= (arr!2700 (_values!3193 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1314)) mapDefault!5660)))))

(declare-fun b!159271 () Bool)

(declare-fun res!75223 () Bool)

(assert (=> b!159271 (=> (not res!75223) (not e!104268))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!309 0))(
  ( (MissingZero!309 (index!3404 (_ BitVec 32))) (Found!309 (index!3405 (_ BitVec 32))) (Intermediate!309 (undefined!1121 Bool) (index!3406 (_ BitVec 32)) (x!17589 (_ BitVec 32))) (Undefined!309) (MissingVacant!309 (index!3407 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5709 (_ BitVec 32)) SeekEntryResult!309)

(assert (=> b!159271 (= res!75223 ((_ is Undefined!309) (seekEntryOrOpen!0 key!828 (_keys!5011 thiss!1248) (mask!7756 thiss!1248))))))

(declare-fun b!159272 () Bool)

(declare-fun res!75224 () Bool)

(assert (=> b!159272 (=> (not res!75224) (not e!104268))))

(assert (=> b!159272 (= res!75224 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159273 () Bool)

(declare-fun res!75219 () Bool)

(assert (=> b!159273 (=> (not res!75219) (not e!104268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5709 (_ BitVec 32)) Bool)

(assert (=> b!159273 (= res!75219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5011 thiss!1248) (mask!7756 thiss!1248)))))

(declare-fun array_inv!1717 (array!5709) Bool)

(declare-fun array_inv!1718 (array!5711) Bool)

(assert (=> b!159274 (= e!104266 (and tp!13108 tp_is_empty!3315 (array_inv!1717 (_keys!5011 thiss!1248)) (array_inv!1718 (_values!3193 thiss!1248)) e!104264))))

(assert (= (and start!16052 res!75222) b!159272))

(assert (= (and b!159272 res!75224) b!159271))

(assert (= (and b!159271 res!75223) b!159269))

(assert (= (and b!159269 res!75220) b!159268))

(assert (= (and b!159268 res!75221) b!159267))

(assert (= (and b!159267 res!75218) b!159273))

(assert (= (and b!159273 res!75219) b!159264))

(assert (= (and b!159270 condMapEmpty!5660) mapIsEmpty!5660))

(assert (= (and b!159270 (not condMapEmpty!5660)) mapNonEmpty!5660))

(assert (= (and mapNonEmpty!5660 ((_ is ValueCellFull!1314) mapValue!5660)) b!159266))

(assert (= (and b!159270 ((_ is ValueCellFull!1314) mapDefault!5660)) b!159265))

(assert (= b!159274 b!159270))

(assert (= start!16052 b!159274))

(declare-fun m!191597 () Bool)

(assert (=> b!159271 m!191597))

(declare-fun m!191599 () Bool)

(assert (=> b!159273 m!191599))

(declare-fun m!191601 () Bool)

(assert (=> b!159269 m!191601))

(assert (=> b!159269 m!191601))

(declare-fun m!191603 () Bool)

(assert (=> b!159269 m!191603))

(declare-fun m!191605 () Bool)

(assert (=> b!159274 m!191605))

(declare-fun m!191607 () Bool)

(assert (=> b!159274 m!191607))

(declare-fun m!191609 () Bool)

(assert (=> mapNonEmpty!5660 m!191609))

(declare-fun m!191611 () Bool)

(assert (=> b!159268 m!191611))

(declare-fun m!191613 () Bool)

(assert (=> b!159264 m!191613))

(declare-fun m!191615 () Bool)

(assert (=> start!16052 m!191615))

(check-sat b_and!9927 (not b_next!3513) (not mapNonEmpty!5660) (not b!159271) (not b!159269) (not b!159274) (not b!159268) (not b!159264) (not start!16052) (not b!159273) tp_is_empty!3315)
(check-sat b_and!9927 (not b_next!3513))
