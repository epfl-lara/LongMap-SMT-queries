; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16060 () Bool)

(assert start!16060)

(declare-fun b!159377 () Bool)

(declare-fun b_free!3517 () Bool)

(declare-fun b_next!3517 () Bool)

(assert (=> b!159377 (= b_free!3517 (not b_next!3517))))

(declare-fun tp!13120 () Bool)

(declare-fun b_and!9945 () Bool)

(assert (=> b!159377 (= tp!13120 b_and!9945)))

(declare-fun e!104325 () Bool)

(declare-fun e!104328 () Bool)

(declare-datatypes ((V!4073 0))(
  ( (V!4074 (val!1704 Int)) )
))
(declare-datatypes ((ValueCell!1316 0))(
  ( (ValueCellFull!1316 (v!3570 V!4073)) (EmptyCell!1316) )
))
(declare-datatypes ((array!5703 0))(
  ( (array!5704 (arr!2696 (Array (_ BitVec 32) (_ BitVec 64))) (size!2980 (_ BitVec 32))) )
))
(declare-datatypes ((array!5705 0))(
  ( (array!5706 (arr!2697 (Array (_ BitVec 32) ValueCell!1316)) (size!2981 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1540 0))(
  ( (LongMapFixedSize!1541 (defaultEntry!3212 Int) (mask!7760 (_ BitVec 32)) (extraKeys!2953 (_ BitVec 32)) (zeroValue!3055 V!4073) (minValue!3055 V!4073) (_size!819 (_ BitVec 32)) (_keys!5013 array!5703) (_values!3195 array!5705) (_vacant!819 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1540)

(declare-fun tp_is_empty!3319 () Bool)

(declare-fun array_inv!1717 (array!5703) Bool)

(declare-fun array_inv!1718 (array!5705) Bool)

(assert (=> b!159377 (= e!104325 (and tp!13120 tp_is_empty!3319 (array_inv!1717 (_keys!5013 thiss!1248)) (array_inv!1718 (_values!3195 thiss!1248)) e!104328))))

(declare-fun b!159378 () Bool)

(declare-fun e!104324 () Bool)

(declare-fun mapRes!5666 () Bool)

(assert (=> b!159378 (= e!104328 (and e!104324 mapRes!5666))))

(declare-fun condMapEmpty!5666 () Bool)

(declare-fun mapDefault!5666 () ValueCell!1316)

(assert (=> b!159378 (= condMapEmpty!5666 (= (arr!2697 (_values!3195 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1316)) mapDefault!5666)))))

(declare-fun b!159379 () Bool)

(declare-fun res!75286 () Bool)

(declare-fun e!104327 () Bool)

(assert (=> b!159379 (=> (not res!75286) (not e!104327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5703 (_ BitVec 32)) Bool)

(assert (=> b!159379 (= res!75286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5013 thiss!1248) (mask!7760 thiss!1248)))))

(declare-fun b!159380 () Bool)

(declare-fun res!75282 () Bool)

(assert (=> b!159380 (=> (not res!75282) (not e!104327))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159380 (= res!75282 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159381 () Bool)

(declare-fun res!75287 () Bool)

(assert (=> b!159381 (=> (not res!75287) (not e!104327))))

(assert (=> b!159381 (= res!75287 (and (= (size!2981 (_values!3195 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7760 thiss!1248))) (= (size!2980 (_keys!5013 thiss!1248)) (size!2981 (_values!3195 thiss!1248))) (bvsge (mask!7760 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2953 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2953 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!5666 () Bool)

(assert (=> mapIsEmpty!5666 mapRes!5666))

(declare-fun res!75283 () Bool)

(assert (=> start!16060 (=> (not res!75283) (not e!104327))))

(declare-fun valid!741 (LongMapFixedSize!1540) Bool)

(assert (=> start!16060 (= res!75283 (valid!741 thiss!1248))))

(assert (=> start!16060 e!104327))

(assert (=> start!16060 e!104325))

(assert (=> start!16060 true))

(declare-fun mapNonEmpty!5666 () Bool)

(declare-fun tp!13121 () Bool)

(declare-fun e!104326 () Bool)

(assert (=> mapNonEmpty!5666 (= mapRes!5666 (and tp!13121 e!104326))))

(declare-fun mapRest!5666 () (Array (_ BitVec 32) ValueCell!1316))

(declare-fun mapKey!5666 () (_ BitVec 32))

(declare-fun mapValue!5666 () ValueCell!1316)

(assert (=> mapNonEmpty!5666 (= (arr!2697 (_values!3195 thiss!1248)) (store mapRest!5666 mapKey!5666 mapValue!5666))))

(declare-fun b!159382 () Bool)

(assert (=> b!159382 (= e!104326 tp_is_empty!3319)))

(declare-fun b!159383 () Bool)

(declare-fun res!75281 () Bool)

(assert (=> b!159383 (=> (not res!75281) (not e!104327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159383 (= res!75281 (validMask!0 (mask!7760 thiss!1248)))))

(declare-fun b!159384 () Bool)

(assert (=> b!159384 (= e!104327 false)))

(declare-fun lt!82047 () Bool)

(declare-datatypes ((List!1883 0))(
  ( (Nil!1880) (Cons!1879 (h!2492 (_ BitVec 64)) (t!6677 List!1883)) )
))
(declare-fun arrayNoDuplicates!0 (array!5703 (_ BitVec 32) List!1883) Bool)

(assert (=> b!159384 (= lt!82047 (arrayNoDuplicates!0 (_keys!5013 thiss!1248) #b00000000000000000000000000000000 Nil!1880))))

(declare-fun b!159385 () Bool)

(assert (=> b!159385 (= e!104324 tp_is_empty!3319)))

(declare-fun b!159386 () Bool)

(declare-fun res!75285 () Bool)

(assert (=> b!159386 (=> (not res!75285) (not e!104327))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!303 0))(
  ( (MissingZero!303 (index!3380 (_ BitVec 32))) (Found!303 (index!3381 (_ BitVec 32))) (Intermediate!303 (undefined!1115 Bool) (index!3382 (_ BitVec 32)) (x!17591 (_ BitVec 32))) (Undefined!303) (MissingVacant!303 (index!3383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5703 (_ BitVec 32)) SeekEntryResult!303)

(assert (=> b!159386 (= res!75285 ((_ is Undefined!303) (seekEntryOrOpen!0 key!828 (_keys!5013 thiss!1248) (mask!7760 thiss!1248))))))

(declare-fun b!159387 () Bool)

(declare-fun res!75284 () Bool)

(assert (=> b!159387 (=> (not res!75284) (not e!104327))))

(declare-datatypes ((tuple2!2818 0))(
  ( (tuple2!2819 (_1!1420 (_ BitVec 64)) (_2!1420 V!4073)) )
))
(declare-datatypes ((List!1884 0))(
  ( (Nil!1881) (Cons!1880 (h!2493 tuple2!2818) (t!6678 List!1884)) )
))
(declare-datatypes ((ListLongMap!1817 0))(
  ( (ListLongMap!1818 (toList!924 List!1884)) )
))
(declare-fun contains!970 (ListLongMap!1817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!591 (array!5703 array!5705 (_ BitVec 32) (_ BitVec 32) V!4073 V!4073 (_ BitVec 32) Int) ListLongMap!1817)

(assert (=> b!159387 (= res!75284 (contains!970 (getCurrentListMap!591 (_keys!5013 thiss!1248) (_values!3195 thiss!1248) (mask!7760 thiss!1248) (extraKeys!2953 thiss!1248) (zeroValue!3055 thiss!1248) (minValue!3055 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3212 thiss!1248)) key!828))))

(assert (= (and start!16060 res!75283) b!159380))

(assert (= (and b!159380 res!75282) b!159386))

(assert (= (and b!159386 res!75285) b!159387))

(assert (= (and b!159387 res!75284) b!159383))

(assert (= (and b!159383 res!75281) b!159381))

(assert (= (and b!159381 res!75287) b!159379))

(assert (= (and b!159379 res!75286) b!159384))

(assert (= (and b!159378 condMapEmpty!5666) mapIsEmpty!5666))

(assert (= (and b!159378 (not condMapEmpty!5666)) mapNonEmpty!5666))

(assert (= (and mapNonEmpty!5666 ((_ is ValueCellFull!1316) mapValue!5666)) b!159382))

(assert (= (and b!159378 ((_ is ValueCellFull!1316) mapDefault!5666)) b!159385))

(assert (= b!159377 b!159378))

(assert (= start!16060 b!159377))

(declare-fun m!191819 () Bool)

(assert (=> b!159386 m!191819))

(declare-fun m!191821 () Bool)

(assert (=> mapNonEmpty!5666 m!191821))

(declare-fun m!191823 () Bool)

(assert (=> b!159377 m!191823))

(declare-fun m!191825 () Bool)

(assert (=> b!159377 m!191825))

(declare-fun m!191827 () Bool)

(assert (=> start!16060 m!191827))

(declare-fun m!191829 () Bool)

(assert (=> b!159383 m!191829))

(declare-fun m!191831 () Bool)

(assert (=> b!159387 m!191831))

(assert (=> b!159387 m!191831))

(declare-fun m!191833 () Bool)

(assert (=> b!159387 m!191833))

(declare-fun m!191835 () Bool)

(assert (=> b!159379 m!191835))

(declare-fun m!191837 () Bool)

(assert (=> b!159384 m!191837))

(check-sat (not b!159383) (not b!159387) (not b!159384) (not b!159377) (not start!16060) b_and!9945 (not b!159379) (not b!159386) (not mapNonEmpty!5666) tp_is_empty!3319 (not b_next!3517))
(check-sat b_and!9945 (not b_next!3517))
