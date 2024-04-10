; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16956 () Bool)

(assert start!16956)

(declare-fun b!170469 () Bool)

(declare-fun b_free!4203 () Bool)

(declare-fun b_next!4203 () Bool)

(assert (=> b!170469 (= b_free!4203 (not b_next!4203))))

(declare-fun tp!15233 () Bool)

(declare-fun b_and!10617 () Bool)

(assert (=> b!170469 (= tp!15233 b_and!10617)))

(declare-fun b!170464 () Bool)

(declare-fun e!112483 () Bool)

(declare-fun tp_is_empty!3975 () Bool)

(assert (=> b!170464 (= e!112483 tp_is_empty!3975)))

(declare-fun mapNonEmpty!6749 () Bool)

(declare-fun mapRes!6749 () Bool)

(declare-fun tp!15232 () Bool)

(declare-fun e!112486 () Bool)

(assert (=> mapNonEmpty!6749 (= mapRes!6749 (and tp!15232 e!112486))))

(declare-datatypes ((V!4947 0))(
  ( (V!4948 (val!2032 Int)) )
))
(declare-datatypes ((ValueCell!1644 0))(
  ( (ValueCellFull!1644 (v!3897 V!4947)) (EmptyCell!1644) )
))
(declare-fun mapRest!6749 () (Array (_ BitVec 32) ValueCell!1644))

(declare-fun mapKey!6749 () (_ BitVec 32))

(declare-fun mapValue!6749 () ValueCell!1644)

(declare-datatypes ((array!7059 0))(
  ( (array!7060 (arr!3359 (Array (_ BitVec 32) (_ BitVec 64))) (size!3652 (_ BitVec 32))) )
))
(declare-datatypes ((array!7061 0))(
  ( (array!7062 (arr!3360 (Array (_ BitVec 32) ValueCell!1644)) (size!3653 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2196 0))(
  ( (LongMapFixedSize!2197 (defaultEntry!3540 Int) (mask!8354 (_ BitVec 32)) (extraKeys!3281 (_ BitVec 32)) (zeroValue!3383 V!4947) (minValue!3383 V!4947) (_size!1147 (_ BitVec 32)) (_keys!5370 array!7059) (_values!3523 array!7061) (_vacant!1147 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2196)

(assert (=> mapNonEmpty!6749 (= (arr!3360 (_values!3523 thiss!1248)) (store mapRest!6749 mapKey!6749 mapValue!6749))))

(declare-fun b!170466 () Bool)

(declare-fun res!81034 () Bool)

(declare-fun e!112488 () Bool)

(assert (=> b!170466 (=> (not res!81034) (not e!112488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170466 (= res!81034 (validMask!0 (mask!8354 thiss!1248)))))

(declare-fun mapIsEmpty!6749 () Bool)

(assert (=> mapIsEmpty!6749 mapRes!6749))

(declare-fun b!170467 () Bool)

(declare-fun e!112485 () Bool)

(assert (=> b!170467 (= e!112485 (and e!112483 mapRes!6749))))

(declare-fun condMapEmpty!6749 () Bool)

(declare-fun mapDefault!6749 () ValueCell!1644)

(assert (=> b!170467 (= condMapEmpty!6749 (= (arr!3360 (_values!3523 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1644)) mapDefault!6749)))))

(declare-fun b!170468 () Bool)

(assert (=> b!170468 (= e!112486 tp_is_empty!3975)))

(declare-fun b!170465 () Bool)

(assert (=> b!170465 (= e!112488 (and (= (size!3653 (_values!3523 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8354 thiss!1248))) (= (size!3652 (_keys!5370 thiss!1248)) (size!3653 (_values!3523 thiss!1248))) (bvsge (mask!8354 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3281 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3281 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3281 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt (bvor (extraKeys!3281 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011)))))

(declare-fun res!81035 () Bool)

(assert (=> start!16956 (=> (not res!81035) (not e!112488))))

(declare-fun valid!939 (LongMapFixedSize!2196) Bool)

(assert (=> start!16956 (= res!81035 (valid!939 thiss!1248))))

(assert (=> start!16956 e!112488))

(declare-fun e!112487 () Bool)

(assert (=> start!16956 e!112487))

(assert (=> start!16956 true))

(declare-fun array_inv!2149 (array!7059) Bool)

(declare-fun array_inv!2150 (array!7061) Bool)

(assert (=> b!170469 (= e!112487 (and tp!15233 tp_is_empty!3975 (array_inv!2149 (_keys!5370 thiss!1248)) (array_inv!2150 (_values!3523 thiss!1248)) e!112485))))

(declare-fun b!170470 () Bool)

(declare-fun res!81036 () Bool)

(assert (=> b!170470 (=> (not res!81036) (not e!112488))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170470 (= res!81036 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!16956 res!81035) b!170470))

(assert (= (and b!170470 res!81036) b!170466))

(assert (= (and b!170466 res!81034) b!170465))

(assert (= (and b!170467 condMapEmpty!6749) mapIsEmpty!6749))

(assert (= (and b!170467 (not condMapEmpty!6749)) mapNonEmpty!6749))

(get-info :version)

(assert (= (and mapNonEmpty!6749 ((_ is ValueCellFull!1644) mapValue!6749)) b!170468))

(assert (= (and b!170467 ((_ is ValueCellFull!1644) mapDefault!6749)) b!170464))

(assert (= b!170469 b!170467))

(assert (= start!16956 b!170469))

(declare-fun m!198963 () Bool)

(assert (=> mapNonEmpty!6749 m!198963))

(declare-fun m!198965 () Bool)

(assert (=> b!170466 m!198965))

(declare-fun m!198967 () Bool)

(assert (=> start!16956 m!198967))

(declare-fun m!198969 () Bool)

(assert (=> b!170469 m!198969))

(declare-fun m!198971 () Bool)

(assert (=> b!170469 m!198971))

(check-sat tp_is_empty!3975 (not b!170469) (not mapNonEmpty!6749) (not start!16956) (not b_next!4203) (not b!170466) b_and!10617)
(check-sat b_and!10617 (not b_next!4203))
