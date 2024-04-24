; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16816 () Bool)

(assert start!16816)

(declare-fun b!169509 () Bool)

(declare-fun b_free!4135 () Bool)

(declare-fun b_next!4135 () Bool)

(assert (=> b!169509 (= b_free!4135 (not b_next!4135))))

(declare-fun tp!15011 () Bool)

(declare-fun b_and!10563 () Bool)

(assert (=> b!169509 (= tp!15011 b_and!10563)))

(declare-fun b!169502 () Bool)

(declare-fun b_free!4137 () Bool)

(declare-fun b_next!4137 () Bool)

(assert (=> b!169502 (= b_free!4137 (not b_next!4137))))

(declare-fun tp!15012 () Bool)

(declare-fun b_and!10565 () Bool)

(assert (=> b!169502 (= tp!15012 b_and!10565)))

(declare-fun b!169501 () Bool)

(declare-fun e!111697 () Bool)

(declare-fun tp_is_empty!3919 () Bool)

(assert (=> b!169501 (= e!111697 tp_is_empty!3919)))

(declare-fun mapNonEmpty!6626 () Bool)

(declare-fun mapRes!6627 () Bool)

(declare-fun tp!15009 () Bool)

(declare-fun e!111695 () Bool)

(assert (=> mapNonEmpty!6626 (= mapRes!6627 (and tp!15009 e!111695))))

(declare-datatypes ((V!4873 0))(
  ( (V!4874 (val!2004 Int)) )
))
(declare-datatypes ((ValueCell!1616 0))(
  ( (ValueCellFull!1616 (v!3870 V!4873)) (EmptyCell!1616) )
))
(declare-fun mapValue!6626 () ValueCell!1616)

(declare-fun mapRest!6626 () (Array (_ BitVec 32) ValueCell!1616))

(declare-fun mapKey!6627 () (_ BitVec 32))

(declare-datatypes ((array!6921 0))(
  ( (array!6922 (arr!3296 (Array (_ BitVec 32) (_ BitVec 64))) (size!3584 (_ BitVec 32))) )
))
(declare-datatypes ((array!6923 0))(
  ( (array!6924 (arr!3297 (Array (_ BitVec 32) ValueCell!1616)) (size!3585 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2140 0))(
  ( (LongMapFixedSize!2141 (defaultEntry!3512 Int) (mask!8297 (_ BitVec 32)) (extraKeys!3253 (_ BitVec 32)) (zeroValue!3355 V!4873) (minValue!3355 V!4873) (_size!1119 (_ BitVec 32)) (_keys!5337 array!6921) (_values!3495 array!6923) (_vacant!1119 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3188 0))(
  ( (tuple2!3189 (_1!1605 Bool) (_2!1605 LongMapFixedSize!2140)) )
))
(declare-fun err!75 () tuple2!3188)

(assert (=> mapNonEmpty!6626 (= (arr!3297 (_values!3495 (_2!1605 err!75))) (store mapRest!6626 mapKey!6627 mapValue!6626))))

(declare-fun b!169503 () Bool)

(declare-fun e!111700 () Bool)

(declare-fun e!111693 () Bool)

(assert (=> b!169503 (= e!111700 (and e!111693 mapRes!6627))))

(declare-fun condMapEmpty!6626 () Bool)

(declare-fun mapDefault!6627 () ValueCell!1616)

(assert (=> b!169503 (= condMapEmpty!6626 (= (arr!3297 (_values!3495 (_2!1605 err!75))) ((as const (Array (_ BitVec 32) ValueCell!1616)) mapDefault!6627)))))

(declare-fun b!169504 () Bool)

(declare-fun e!111701 () Bool)

(declare-fun e!111696 () Bool)

(assert (=> b!169504 (= e!111701 e!111696)))

(declare-fun res!80625 () Bool)

(assert (=> b!169504 (=> (not res!80625) (not e!111696))))

(declare-datatypes ((SeekEntryResult!517 0))(
  ( (MissingZero!517 (index!4236 (_ BitVec 32))) (Found!517 (index!4237 (_ BitVec 32))) (Intermediate!517 (undefined!1329 Bool) (index!4238 (_ BitVec 32)) (x!18713 (_ BitVec 32))) (Undefined!517) (MissingVacant!517 (index!4239 (_ BitVec 32))) )
))
(declare-fun lt!84977 () SeekEntryResult!517)

(get-info :version)

(assert (=> b!169504 (= res!80625 (and (not ((_ is Undefined!517) lt!84977)) (not ((_ is MissingVacant!517) lt!84977)) (not ((_ is MissingZero!517) lt!84977)) (not ((_ is Found!517) lt!84977))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun thiss!1248 () LongMapFixedSize!2140)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6921 (_ BitVec 32)) SeekEntryResult!517)

(assert (=> b!169504 (= lt!84977 (seekEntryOrOpen!0 key!828 (_keys!5337 thiss!1248) (mask!8297 thiss!1248)))))

(declare-fun b!169505 () Bool)

(declare-fun e!111702 () Bool)

(declare-fun e!111698 () Bool)

(declare-fun mapRes!6626 () Bool)

(assert (=> b!169505 (= e!111702 (and e!111698 mapRes!6626))))

(declare-fun condMapEmpty!6627 () Bool)

(declare-fun mapDefault!6626 () ValueCell!1616)

(assert (=> b!169505 (= condMapEmpty!6627 (= (arr!3297 (_values!3495 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1616)) mapDefault!6626)))))

(declare-fun b!169506 () Bool)

(assert (=> b!169506 (= e!111695 tp_is_empty!3919)))

(declare-fun e!111699 () Bool)

(declare-fun array_inv!2113 (array!6921) Bool)

(declare-fun array_inv!2114 (array!6923) Bool)

(assert (=> b!169502 (= e!111699 (and tp!15012 tp_is_empty!3919 (array_inv!2113 (_keys!5337 thiss!1248)) (array_inv!2114 (_values!3495 thiss!1248)) e!111702))))

(declare-fun res!80624 () Bool)

(assert (=> start!16816 (=> (not res!80624) (not e!111701))))

(declare-fun valid!934 (LongMapFixedSize!2140) Bool)

(assert (=> start!16816 (= res!80624 (valid!934 thiss!1248))))

(assert (=> start!16816 e!111701))

(assert (=> start!16816 e!111699))

(assert (=> start!16816 true))

(declare-fun mapIsEmpty!6626 () Bool)

(assert (=> mapIsEmpty!6626 mapRes!6627))

(declare-fun b!169507 () Bool)

(assert (=> b!169507 (= e!111698 tp_is_empty!3919)))

(declare-fun b!169508 () Bool)

(declare-fun res!80623 () Bool)

(assert (=> b!169508 (=> (not res!80623) (not e!111701))))

(assert (=> b!169508 (= res!80623 (not (= key!828 (bvneg key!828))))))

(declare-fun e!111704 () Bool)

(assert (=> b!169509 (= e!111704 (and tp!15011 tp_is_empty!3919 (array_inv!2113 (_keys!5337 (_2!1605 err!75))) (array_inv!2114 (_values!3495 (_2!1605 err!75))) e!111700))))

(declare-fun mapNonEmpty!6627 () Bool)

(declare-fun tp!15010 () Bool)

(assert (=> mapNonEmpty!6627 (= mapRes!6626 (and tp!15010 e!111697))))

(declare-fun mapRest!6627 () (Array (_ BitVec 32) ValueCell!1616))

(declare-fun mapValue!6627 () ValueCell!1616)

(declare-fun mapKey!6626 () (_ BitVec 32))

(assert (=> mapNonEmpty!6627 (= (arr!3297 (_values!3495 thiss!1248)) (store mapRest!6627 mapKey!6626 mapValue!6627))))

(declare-fun b!169510 () Bool)

(assert (=> b!169510 (= e!111693 tp_is_empty!3919)))

(declare-fun mapIsEmpty!6627 () Bool)

(assert (=> mapIsEmpty!6627 mapRes!6626))

(declare-fun b!169511 () Bool)

(assert (=> b!169511 (= e!111696 false)))

(declare-fun lt!84978 () Bool)

(assert (=> b!169511 (= lt!84978 (valid!934 (_2!1605 err!75)))))

(assert (=> b!169511 true))

(assert (=> b!169511 e!111704))

(assert (= (and start!16816 res!80624) b!169508))

(assert (= (and b!169508 res!80623) b!169504))

(assert (= (and b!169504 res!80625) b!169511))

(assert (= (and b!169503 condMapEmpty!6626) mapIsEmpty!6626))

(assert (= (and b!169503 (not condMapEmpty!6626)) mapNonEmpty!6626))

(assert (= (and mapNonEmpty!6626 ((_ is ValueCellFull!1616) mapValue!6626)) b!169506))

(assert (= (and b!169503 ((_ is ValueCellFull!1616) mapDefault!6627)) b!169510))

(assert (= b!169509 b!169503))

(assert (= b!169511 b!169509))

(assert (= (and b!169505 condMapEmpty!6627) mapIsEmpty!6627))

(assert (= (and b!169505 (not condMapEmpty!6627)) mapNonEmpty!6627))

(assert (= (and mapNonEmpty!6627 ((_ is ValueCellFull!1616) mapValue!6627)) b!169501))

(assert (= (and b!169505 ((_ is ValueCellFull!1616) mapDefault!6626)) b!169507))

(assert (= b!169502 b!169505))

(assert (= start!16816 b!169502))

(declare-fun m!198647 () Bool)

(assert (=> mapNonEmpty!6627 m!198647))

(declare-fun m!198649 () Bool)

(assert (=> b!169502 m!198649))

(declare-fun m!198651 () Bool)

(assert (=> b!169502 m!198651))

(declare-fun m!198653 () Bool)

(assert (=> start!16816 m!198653))

(declare-fun m!198655 () Bool)

(assert (=> b!169509 m!198655))

(declare-fun m!198657 () Bool)

(assert (=> b!169509 m!198657))

(declare-fun m!198659 () Bool)

(assert (=> b!169504 m!198659))

(declare-fun m!198661 () Bool)

(assert (=> b!169511 m!198661))

(declare-fun m!198663 () Bool)

(assert (=> mapNonEmpty!6626 m!198663))

(check-sat (not b!169511) (not b!169502) b_and!10565 b_and!10563 (not mapNonEmpty!6627) (not b_next!4135) (not b!169504) (not b_next!4137) (not b!169509) (not start!16816) tp_is_empty!3919 (not mapNonEmpty!6626))
(check-sat b_and!10563 b_and!10565 (not b_next!4137) (not b_next!4135))
