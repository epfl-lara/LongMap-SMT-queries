; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16810 () Bool)

(assert start!16810)

(declare-fun b!169400 () Bool)

(declare-fun b_free!4123 () Bool)

(declare-fun b_next!4123 () Bool)

(assert (=> b!169400 (= b_free!4123 (not b_next!4123))))

(declare-fun tp!14973 () Bool)

(declare-fun b_and!10551 () Bool)

(assert (=> b!169400 (= tp!14973 b_and!10551)))

(declare-fun b!169398 () Bool)

(declare-fun b_free!4125 () Bool)

(declare-fun b_next!4125 () Bool)

(assert (=> b!169398 (= b_free!4125 (not b_next!4125))))

(declare-fun tp!14976 () Bool)

(declare-fun b_and!10553 () Bool)

(assert (=> b!169398 (= tp!14976 b_and!10553)))

(declare-fun mapNonEmpty!6608 () Bool)

(declare-fun mapRes!6609 () Bool)

(declare-fun tp!14974 () Bool)

(declare-fun e!111587 () Bool)

(assert (=> mapNonEmpty!6608 (= mapRes!6609 (and tp!14974 e!111587))))

(declare-datatypes ((V!4865 0))(
  ( (V!4866 (val!2001 Int)) )
))
(declare-datatypes ((ValueCell!1613 0))(
  ( (ValueCellFull!1613 (v!3867 V!4865)) (EmptyCell!1613) )
))
(declare-datatypes ((array!6909 0))(
  ( (array!6910 (arr!3290 (Array (_ BitVec 32) (_ BitVec 64))) (size!3578 (_ BitVec 32))) )
))
(declare-datatypes ((array!6911 0))(
  ( (array!6912 (arr!3291 (Array (_ BitVec 32) ValueCell!1613)) (size!3579 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2134 0))(
  ( (LongMapFixedSize!2135 (defaultEntry!3509 Int) (mask!8292 (_ BitVec 32)) (extraKeys!3250 (_ BitVec 32)) (zeroValue!3352 V!4865) (minValue!3352 V!4865) (_size!1116 (_ BitVec 32)) (_keys!5334 array!6909) (_values!3492 array!6911) (_vacant!1116 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3178 0))(
  ( (tuple2!3179 (_1!1600 Bool) (_2!1600 LongMapFixedSize!2134)) )
))
(declare-fun err!63 () tuple2!3178)

(declare-fun mapKey!6609 () (_ BitVec 32))

(declare-fun mapRest!6609 () (Array (_ BitVec 32) ValueCell!1613))

(declare-fun mapValue!6608 () ValueCell!1613)

(assert (=> mapNonEmpty!6608 (= (arr!3291 (_values!3492 (_2!1600 err!63))) (store mapRest!6609 mapKey!6609 mapValue!6608))))

(declare-fun b!169388 () Bool)

(declare-fun res!80582 () Bool)

(declare-fun e!111586 () Bool)

(assert (=> b!169388 (=> (not res!80582) (not e!111586))))

(declare-fun lt!84954 () tuple2!3178)

(assert (=> b!169388 (= res!80582 (_1!1600 lt!84954))))

(declare-fun b!169389 () Bool)

(declare-fun e!111579 () Bool)

(declare-fun e!111583 () Bool)

(assert (=> b!169389 (= e!111579 (and e!111583 mapRes!6609))))

(declare-fun condMapEmpty!6609 () Bool)

(declare-fun mapDefault!6608 () ValueCell!1613)

(assert (=> b!169389 (= condMapEmpty!6609 (= (arr!3291 (_values!3492 (_2!1600 err!63))) ((as const (Array (_ BitVec 32) ValueCell!1613)) mapDefault!6608)))))

(declare-fun b!169390 () Bool)

(declare-fun e!111582 () Bool)

(declare-fun tp_is_empty!3913 () Bool)

(assert (=> b!169390 (= e!111582 tp_is_empty!3913)))

(declare-fun b!169391 () Bool)

(assert (=> b!169391 (= e!111587 tp_is_empty!3913)))

(declare-fun mapIsEmpty!6608 () Bool)

(declare-fun mapRes!6608 () Bool)

(assert (=> mapIsEmpty!6608 mapRes!6608))

(declare-fun b!169392 () Bool)

(assert (=> b!169392 (= e!111583 tp_is_empty!3913)))

(declare-fun b!169393 () Bool)

(declare-fun res!80585 () Bool)

(declare-fun e!111589 () Bool)

(assert (=> b!169393 (=> (not res!80585) (not e!111589))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169393 (= res!80585 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6609 () Bool)

(assert (=> mapIsEmpty!6609 mapRes!6609))

(declare-fun b!169394 () Bool)

(declare-fun e!111580 () Bool)

(assert (=> b!169394 (= e!111580 (and e!111582 mapRes!6608))))

(declare-fun condMapEmpty!6608 () Bool)

(declare-fun thiss!1248 () LongMapFixedSize!2134)

(declare-fun mapDefault!6609 () ValueCell!1613)

(assert (=> b!169394 (= condMapEmpty!6608 (= (arr!3291 (_values!3492 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1613)) mapDefault!6609)))))

(declare-fun mapNonEmpty!6609 () Bool)

(declare-fun tp!14975 () Bool)

(declare-fun e!111590 () Bool)

(assert (=> mapNonEmpty!6609 (= mapRes!6608 (and tp!14975 e!111590))))

(declare-fun mapValue!6609 () ValueCell!1613)

(declare-fun mapKey!6608 () (_ BitVec 32))

(declare-fun mapRest!6608 () (Array (_ BitVec 32) ValueCell!1613))

(assert (=> mapNonEmpty!6609 (= (arr!3291 (_values!3492 thiss!1248)) (store mapRest!6608 mapKey!6608 mapValue!6609))))

(declare-fun b!169395 () Bool)

(assert (=> b!169395 (= e!111586 false)))

(declare-fun lt!84953 () Bool)

(declare-datatypes ((tuple2!3180 0))(
  ( (tuple2!3181 (_1!1601 (_ BitVec 64)) (_2!1601 V!4865)) )
))
(declare-datatypes ((List!2164 0))(
  ( (Nil!2161) (Cons!2160 (h!2777 tuple2!3180) (t!6958 List!2164)) )
))
(declare-datatypes ((ListLongMap!2127 0))(
  ( (ListLongMap!2128 (toList!1079 List!2164)) )
))
(declare-fun contains!1131 (ListLongMap!2127 (_ BitVec 64)) Bool)

(declare-fun map!1814 (LongMapFixedSize!2134) ListLongMap!2127)

(assert (=> b!169395 (= lt!84953 (contains!1131 (map!1814 (_2!1600 lt!84954)) key!828))))

(declare-fun res!80584 () Bool)

(assert (=> start!16810 (=> (not res!80584) (not e!111589))))

(declare-fun valid!932 (LongMapFixedSize!2134) Bool)

(assert (=> start!16810 (= res!80584 (valid!932 thiss!1248))))

(assert (=> start!16810 e!111589))

(declare-fun e!111578 () Bool)

(assert (=> start!16810 e!111578))

(assert (=> start!16810 true))

(declare-fun b!169396 () Bool)

(declare-fun e!111588 () Bool)

(assert (=> b!169396 (= e!111589 e!111588)))

(declare-fun res!80583 () Bool)

(assert (=> b!169396 (=> (not res!80583) (not e!111588))))

(declare-datatypes ((SeekEntryResult!514 0))(
  ( (MissingZero!514 (index!4224 (_ BitVec 32))) (Found!514 (index!4225 (_ BitVec 32))) (Intermediate!514 (undefined!1326 Bool) (index!4226 (_ BitVec 32)) (x!18702 (_ BitVec 32))) (Undefined!514) (MissingVacant!514 (index!4227 (_ BitVec 32))) )
))
(declare-fun lt!84952 () SeekEntryResult!514)

(get-info :version)

(assert (=> b!169396 (= res!80583 (and (not ((_ is Undefined!514) lt!84952)) (not ((_ is MissingVacant!514) lt!84952)) (not ((_ is MissingZero!514) lt!84952)) (not ((_ is Found!514) lt!84952))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6909 (_ BitVec 32)) SeekEntryResult!514)

(assert (=> b!169396 (= lt!84952 (seekEntryOrOpen!0 key!828 (_keys!5334 thiss!1248) (mask!8292 thiss!1248)))))

(declare-fun b!169397 () Bool)

(assert (=> b!169397 (= e!111588 e!111586)))

(declare-fun res!80586 () Bool)

(assert (=> b!169397 (=> (not res!80586) (not e!111586))))

(assert (=> b!169397 (= res!80586 (valid!932 (_2!1600 lt!84954)))))

(assert (=> b!169397 (= lt!84954 err!63)))

(assert (=> b!169397 true))

(declare-fun e!111581 () Bool)

(assert (=> b!169397 e!111581))

(declare-fun array_inv!2109 (array!6909) Bool)

(declare-fun array_inv!2110 (array!6911) Bool)

(assert (=> b!169398 (= e!111578 (and tp!14976 tp_is_empty!3913 (array_inv!2109 (_keys!5334 thiss!1248)) (array_inv!2110 (_values!3492 thiss!1248)) e!111580))))

(declare-fun b!169399 () Bool)

(assert (=> b!169399 (= e!111590 tp_is_empty!3913)))

(assert (=> b!169400 (= e!111581 (and tp!14973 tp_is_empty!3913 (array_inv!2109 (_keys!5334 (_2!1600 err!63))) (array_inv!2110 (_values!3492 (_2!1600 err!63))) e!111579))))

(assert (= (and start!16810 res!80584) b!169393))

(assert (= (and b!169393 res!80585) b!169396))

(assert (= (and b!169396 res!80583) b!169397))

(assert (= (and b!169389 condMapEmpty!6609) mapIsEmpty!6609))

(assert (= (and b!169389 (not condMapEmpty!6609)) mapNonEmpty!6608))

(assert (= (and mapNonEmpty!6608 ((_ is ValueCellFull!1613) mapValue!6608)) b!169391))

(assert (= (and b!169389 ((_ is ValueCellFull!1613) mapDefault!6608)) b!169392))

(assert (= b!169400 b!169389))

(assert (= b!169397 b!169400))

(assert (= (and b!169397 res!80586) b!169388))

(assert (= (and b!169388 res!80582) b!169395))

(assert (= (and b!169394 condMapEmpty!6608) mapIsEmpty!6608))

(assert (= (and b!169394 (not condMapEmpty!6608)) mapNonEmpty!6609))

(assert (= (and mapNonEmpty!6609 ((_ is ValueCellFull!1613) mapValue!6609)) b!169399))

(assert (= (and b!169394 ((_ is ValueCellFull!1613) mapDefault!6609)) b!169390))

(assert (= b!169398 b!169394))

(assert (= start!16810 b!169398))

(declare-fun m!198581 () Bool)

(assert (=> b!169395 m!198581))

(assert (=> b!169395 m!198581))

(declare-fun m!198583 () Bool)

(assert (=> b!169395 m!198583))

(declare-fun m!198585 () Bool)

(assert (=> mapNonEmpty!6609 m!198585))

(declare-fun m!198587 () Bool)

(assert (=> mapNonEmpty!6608 m!198587))

(declare-fun m!198589 () Bool)

(assert (=> b!169396 m!198589))

(declare-fun m!198591 () Bool)

(assert (=> b!169397 m!198591))

(declare-fun m!198593 () Bool)

(assert (=> start!16810 m!198593))

(declare-fun m!198595 () Bool)

(assert (=> b!169398 m!198595))

(declare-fun m!198597 () Bool)

(assert (=> b!169398 m!198597))

(declare-fun m!198599 () Bool)

(assert (=> b!169400 m!198599))

(declare-fun m!198601 () Bool)

(assert (=> b!169400 m!198601))

(check-sat (not b_next!4123) (not mapNonEmpty!6608) (not start!16810) tp_is_empty!3913 (not b!169397) (not b!169400) (not b!169396) (not mapNonEmpty!6609) (not b!169395) (not b!169398) b_and!10551 (not b_next!4125) b_and!10553)
(check-sat b_and!10551 b_and!10553 (not b_next!4125) (not b_next!4123))
