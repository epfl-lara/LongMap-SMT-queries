; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16816 () Bool)

(assert start!16816)

(declare-fun b!169309 () Bool)

(declare-fun b_free!4135 () Bool)

(declare-fun b_next!4135 () Bool)

(assert (=> b!169309 (= b_free!4135 (not b_next!4135))))

(declare-fun tp!15012 () Bool)

(declare-fun b_and!10523 () Bool)

(assert (=> b!169309 (= tp!15012 b_and!10523)))

(declare-fun b!169316 () Bool)

(declare-fun b_free!4137 () Bool)

(declare-fun b_next!4137 () Bool)

(assert (=> b!169316 (= b_free!4137 (not b_next!4137))))

(declare-fun tp!15009 () Bool)

(declare-fun b_and!10525 () Bool)

(assert (=> b!169316 (= tp!15009 b_and!10525)))

(declare-fun mapNonEmpty!6626 () Bool)

(declare-fun mapRes!6626 () Bool)

(declare-fun tp!15011 () Bool)

(declare-fun e!111576 () Bool)

(assert (=> mapNonEmpty!6626 (= mapRes!6626 (and tp!15011 e!111576))))

(declare-datatypes ((V!4873 0))(
  ( (V!4874 (val!2004 Int)) )
))
(declare-datatypes ((ValueCell!1616 0))(
  ( (ValueCellFull!1616 (v!3863 V!4873)) (EmptyCell!1616) )
))
(declare-datatypes ((array!6915 0))(
  ( (array!6916 (arr!3292 (Array (_ BitVec 32) (_ BitVec 64))) (size!3581 (_ BitVec 32))) )
))
(declare-datatypes ((array!6917 0))(
  ( (array!6918 (arr!3293 (Array (_ BitVec 32) ValueCell!1616)) (size!3582 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2140 0))(
  ( (LongMapFixedSize!2141 (defaultEntry!3512 Int) (mask!8296 (_ BitVec 32)) (extraKeys!3253 (_ BitVec 32)) (zeroValue!3355 V!4873) (minValue!3355 V!4873) (_size!1119 (_ BitVec 32)) (_keys!5336 array!6915) (_values!3495 array!6917) (_vacant!1119 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3224 0))(
  ( (tuple2!3225 (_1!1623 Bool) (_2!1623 LongMapFixedSize!2140)) )
))
(declare-fun err!75 () tuple2!3224)

(declare-fun mapKey!6626 () (_ BitVec 32))

(declare-fun mapRest!6626 () (Array (_ BitVec 32) ValueCell!1616))

(declare-fun mapValue!6627 () ValueCell!1616)

(assert (=> mapNonEmpty!6626 (= (arr!3293 (_values!3495 (_2!1623 err!75))) (store mapRest!6626 mapKey!6626 mapValue!6627))))

(declare-fun b!169307 () Bool)

(declare-fun e!111575 () Bool)

(declare-fun tp_is_empty!3919 () Bool)

(assert (=> b!169307 (= e!111575 tp_is_empty!3919)))

(declare-fun b!169308 () Bool)

(declare-fun e!111578 () Bool)

(declare-fun mapRes!6627 () Bool)

(assert (=> b!169308 (= e!111578 (and e!111575 mapRes!6627))))

(declare-fun condMapEmpty!6627 () Bool)

(declare-fun thiss!1248 () LongMapFixedSize!2140)

(declare-fun mapDefault!6626 () ValueCell!1616)

(assert (=> b!169308 (= condMapEmpty!6627 (= (arr!3293 (_values!3495 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1616)) mapDefault!6626)))))

(declare-fun b!169310 () Bool)

(assert (=> b!169310 (= e!111576 tp_is_empty!3919)))

(declare-fun mapNonEmpty!6627 () Bool)

(declare-fun tp!15010 () Bool)

(declare-fun e!111569 () Bool)

(assert (=> mapNonEmpty!6627 (= mapRes!6627 (and tp!15010 e!111569))))

(declare-fun mapKey!6627 () (_ BitVec 32))

(declare-fun mapRest!6627 () (Array (_ BitVec 32) ValueCell!1616))

(declare-fun mapValue!6626 () ValueCell!1616)

(assert (=> mapNonEmpty!6627 (= (arr!3293 (_values!3495 thiss!1248)) (store mapRest!6627 mapKey!6627 mapValue!6626))))

(declare-fun b!169311 () Bool)

(declare-fun e!111568 () Bool)

(declare-fun e!111573 () Bool)

(assert (=> b!169311 (= e!111568 (and e!111573 mapRes!6626))))

(declare-fun condMapEmpty!6626 () Bool)

(declare-fun mapDefault!6627 () ValueCell!1616)

(assert (=> b!169311 (= condMapEmpty!6626 (= (arr!3293 (_values!3495 (_2!1623 err!75))) ((as const (Array (_ BitVec 32) ValueCell!1616)) mapDefault!6627)))))

(declare-fun b!169312 () Bool)

(assert (=> b!169312 (= e!111569 tp_is_empty!3919)))

(declare-fun b!169313 () Bool)

(declare-fun e!111579 () Bool)

(declare-fun e!111572 () Bool)

(assert (=> b!169313 (= e!111579 e!111572)))

(declare-fun res!80509 () Bool)

(assert (=> b!169313 (=> (not res!80509) (not e!111572))))

(declare-datatypes ((SeekEntryResult!536 0))(
  ( (MissingZero!536 (index!4312 (_ BitVec 32))) (Found!536 (index!4313 (_ BitVec 32))) (Intermediate!536 (undefined!1348 Bool) (index!4314 (_ BitVec 32)) (x!18731 (_ BitVec 32))) (Undefined!536) (MissingVacant!536 (index!4315 (_ BitVec 32))) )
))
(declare-fun lt!84737 () SeekEntryResult!536)

(get-info :version)

(assert (=> b!169313 (= res!80509 (and (not ((_ is Undefined!536) lt!84737)) (not ((_ is MissingVacant!536) lt!84737)) (not ((_ is MissingZero!536) lt!84737)) (not ((_ is Found!536) lt!84737))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6915 (_ BitVec 32)) SeekEntryResult!536)

(assert (=> b!169313 (= lt!84737 (seekEntryOrOpen!0 key!828 (_keys!5336 thiss!1248) (mask!8296 thiss!1248)))))

(declare-fun b!169314 () Bool)

(assert (=> b!169314 (= e!111573 tp_is_empty!3919)))

(declare-fun b!169315 () Bool)

(declare-fun res!80508 () Bool)

(assert (=> b!169315 (=> (not res!80508) (not e!111579))))

(assert (=> b!169315 (= res!80508 (not (= key!828 (bvneg key!828))))))

(declare-fun e!111570 () Bool)

(declare-fun array_inv!2117 (array!6915) Bool)

(declare-fun array_inv!2118 (array!6917) Bool)

(assert (=> b!169316 (= e!111570 (and tp!15009 tp_is_empty!3919 (array_inv!2117 (_keys!5336 thiss!1248)) (array_inv!2118 (_values!3495 thiss!1248)) e!111578))))

(declare-fun b!169317 () Bool)

(assert (=> b!169317 (= e!111572 false)))

(declare-fun lt!84738 () Bool)

(declare-fun valid!938 (LongMapFixedSize!2140) Bool)

(assert (=> b!169317 (= lt!84738 (valid!938 (_2!1623 err!75)))))

(assert (=> b!169317 true))

(declare-fun e!111571 () Bool)

(assert (=> b!169317 e!111571))

(assert (=> b!169309 (= e!111571 (and tp!15012 tp_is_empty!3919 (array_inv!2117 (_keys!5336 (_2!1623 err!75))) (array_inv!2118 (_values!3495 (_2!1623 err!75))) e!111568))))

(declare-fun res!80507 () Bool)

(assert (=> start!16816 (=> (not res!80507) (not e!111579))))

(assert (=> start!16816 (= res!80507 (valid!938 thiss!1248))))

(assert (=> start!16816 e!111579))

(assert (=> start!16816 e!111570))

(assert (=> start!16816 true))

(declare-fun mapIsEmpty!6626 () Bool)

(assert (=> mapIsEmpty!6626 mapRes!6627))

(declare-fun mapIsEmpty!6627 () Bool)

(assert (=> mapIsEmpty!6627 mapRes!6626))

(assert (= (and start!16816 res!80507) b!169315))

(assert (= (and b!169315 res!80508) b!169313))

(assert (= (and b!169313 res!80509) b!169317))

(assert (= (and b!169311 condMapEmpty!6626) mapIsEmpty!6627))

(assert (= (and b!169311 (not condMapEmpty!6626)) mapNonEmpty!6626))

(assert (= (and mapNonEmpty!6626 ((_ is ValueCellFull!1616) mapValue!6627)) b!169310))

(assert (= (and b!169311 ((_ is ValueCellFull!1616) mapDefault!6627)) b!169314))

(assert (= b!169309 b!169311))

(assert (= b!169317 b!169309))

(assert (= (and b!169308 condMapEmpty!6627) mapIsEmpty!6626))

(assert (= (and b!169308 (not condMapEmpty!6627)) mapNonEmpty!6627))

(assert (= (and mapNonEmpty!6627 ((_ is ValueCellFull!1616) mapValue!6626)) b!169312))

(assert (= (and b!169308 ((_ is ValueCellFull!1616) mapDefault!6626)) b!169307))

(assert (= b!169316 b!169308))

(assert (= start!16816 b!169316))

(declare-fun m!197845 () Bool)

(assert (=> start!16816 m!197845))

(declare-fun m!197847 () Bool)

(assert (=> mapNonEmpty!6626 m!197847))

(declare-fun m!197849 () Bool)

(assert (=> mapNonEmpty!6627 m!197849))

(declare-fun m!197851 () Bool)

(assert (=> b!169317 m!197851))

(declare-fun m!197853 () Bool)

(assert (=> b!169313 m!197853))

(declare-fun m!197855 () Bool)

(assert (=> b!169309 m!197855))

(declare-fun m!197857 () Bool)

(assert (=> b!169309 m!197857))

(declare-fun m!197859 () Bool)

(assert (=> b!169316 m!197859))

(declare-fun m!197861 () Bool)

(assert (=> b!169316 m!197861))

(check-sat (not b!169316) (not b!169313) b_and!10523 (not b!169309) b_and!10525 (not mapNonEmpty!6626) (not mapNonEmpty!6627) (not b_next!4137) (not start!16816) (not b_next!4135) (not b!169317) tp_is_empty!3919)
(check-sat b_and!10523 b_and!10525 (not b_next!4137) (not b_next!4135))
