; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16594 () Bool)

(assert start!16594)

(declare-fun b!165261 () Bool)

(declare-fun b_free!3895 () Bool)

(declare-fun b_next!3895 () Bool)

(assert (=> b!165261 (= b_free!3895 (not b_next!3895))))

(declare-fun tp!14285 () Bool)

(declare-fun b_and!10283 () Bool)

(assert (=> b!165261 (= tp!14285 b_and!10283)))

(declare-fun b!165257 () Bool)

(declare-fun e!108402 () Bool)

(declare-fun e!108400 () Bool)

(declare-fun mapRes!6264 () Bool)

(assert (=> b!165257 (= e!108402 (and e!108400 mapRes!6264))))

(declare-fun condMapEmpty!6264 () Bool)

(declare-datatypes ((V!4577 0))(
  ( (V!4578 (val!1893 Int)) )
))
(declare-datatypes ((ValueCell!1505 0))(
  ( (ValueCellFull!1505 (v!3752 V!4577)) (EmptyCell!1505) )
))
(declare-datatypes ((array!6471 0))(
  ( (array!6472 (arr!3070 (Array (_ BitVec 32) (_ BitVec 64))) (size!3359 (_ BitVec 32))) )
))
(declare-datatypes ((array!6473 0))(
  ( (array!6474 (arr!3071 (Array (_ BitVec 32) ValueCell!1505)) (size!3360 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1918 0))(
  ( (LongMapFixedSize!1919 (defaultEntry!3401 Int) (mask!8111 (_ BitVec 32)) (extraKeys!3142 (_ BitVec 32)) (zeroValue!3244 V!4577) (minValue!3244 V!4577) (_size!1008 (_ BitVec 32)) (_keys!5225 array!6471) (_values!3384 array!6473) (_vacant!1008 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1918)

(declare-fun mapDefault!6264 () ValueCell!1505)

(assert (=> b!165257 (= condMapEmpty!6264 (= (arr!3071 (_values!3384 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1505)) mapDefault!6264)))))

(declare-fun b!165258 () Bool)

(declare-fun res!78379 () Bool)

(declare-fun e!108405 () Bool)

(assert (=> b!165258 (=> (not res!78379) (not e!108405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6471 (_ BitVec 32)) Bool)

(assert (=> b!165258 (= res!78379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5225 thiss!1248) (mask!8111 thiss!1248)))))

(declare-fun b!165259 () Bool)

(assert (=> b!165259 (= e!108405 false)))

(declare-fun lt!82884 () Bool)

(declare-datatypes ((List!2054 0))(
  ( (Nil!2051) (Cons!2050 (h!2667 (_ BitVec 64)) (t!6847 List!2054)) )
))
(declare-fun arrayNoDuplicates!0 (array!6471 (_ BitVec 32) List!2054) Bool)

(assert (=> b!165259 (= lt!82884 (arrayNoDuplicates!0 (_keys!5225 thiss!1248) #b00000000000000000000000000000000 Nil!2051))))

(declare-fun b!165260 () Bool)

(declare-fun e!108399 () Bool)

(assert (=> b!165260 (= e!108399 e!108405)))

(declare-fun res!78373 () Bool)

(assert (=> b!165260 (=> (not res!78373) (not e!108405))))

(declare-datatypes ((SeekEntryResult!445 0))(
  ( (MissingZero!445 (index!3948 (_ BitVec 32))) (Found!445 (index!3949 (_ BitVec 32))) (Intermediate!445 (undefined!1257 Bool) (index!3950 (_ BitVec 32)) (x!18344 (_ BitVec 32))) (Undefined!445) (MissingVacant!445 (index!3951 (_ BitVec 32))) )
))
(declare-fun lt!82883 () SeekEntryResult!445)

(get-info :version)

(assert (=> b!165260 (= res!78373 (and (not ((_ is Undefined!445) lt!82883)) (not ((_ is MissingVacant!445) lt!82883)) (not ((_ is MissingZero!445) lt!82883)) ((_ is Found!445) lt!82883)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6471 (_ BitVec 32)) SeekEntryResult!445)

(assert (=> b!165260 (= lt!82883 (seekEntryOrOpen!0 key!828 (_keys!5225 thiss!1248) (mask!8111 thiss!1248)))))

(declare-fun e!108403 () Bool)

(declare-fun tp_is_empty!3697 () Bool)

(declare-fun array_inv!1973 (array!6471) Bool)

(declare-fun array_inv!1974 (array!6473) Bool)

(assert (=> b!165261 (= e!108403 (and tp!14285 tp_is_empty!3697 (array_inv!1973 (_keys!5225 thiss!1248)) (array_inv!1974 (_values!3384 thiss!1248)) e!108402))))

(declare-fun mapIsEmpty!6264 () Bool)

(assert (=> mapIsEmpty!6264 mapRes!6264))

(declare-fun b!165262 () Bool)

(assert (=> b!165262 (= e!108400 tp_is_empty!3697)))

(declare-fun res!78378 () Bool)

(assert (=> start!16594 (=> (not res!78378) (not e!108399))))

(declare-fun valid!854 (LongMapFixedSize!1918) Bool)

(assert (=> start!16594 (= res!78378 (valid!854 thiss!1248))))

(assert (=> start!16594 e!108399))

(assert (=> start!16594 e!108403))

(assert (=> start!16594 true))

(declare-fun b!165263 () Bool)

(declare-fun res!78376 () Bool)

(assert (=> b!165263 (=> (not res!78376) (not e!108405))))

(assert (=> b!165263 (= res!78376 (and (= (size!3360 (_values!3384 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8111 thiss!1248))) (= (size!3359 (_keys!5225 thiss!1248)) (size!3360 (_values!3384 thiss!1248))) (bvsge (mask!8111 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3142 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3142 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165264 () Bool)

(declare-fun res!78377 () Bool)

(assert (=> b!165264 (=> (not res!78377) (not e!108399))))

(assert (=> b!165264 (= res!78377 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6264 () Bool)

(declare-fun tp!14286 () Bool)

(declare-fun e!108401 () Bool)

(assert (=> mapNonEmpty!6264 (= mapRes!6264 (and tp!14286 e!108401))))

(declare-fun mapKey!6264 () (_ BitVec 32))

(declare-fun mapValue!6264 () ValueCell!1505)

(declare-fun mapRest!6264 () (Array (_ BitVec 32) ValueCell!1505))

(assert (=> mapNonEmpty!6264 (= (arr!3071 (_values!3384 thiss!1248)) (store mapRest!6264 mapKey!6264 mapValue!6264))))

(declare-fun b!165265 () Bool)

(declare-fun res!78374 () Bool)

(assert (=> b!165265 (=> (not res!78374) (not e!108405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165265 (= res!78374 (validMask!0 (mask!8111 thiss!1248)))))

(declare-fun b!165266 () Bool)

(assert (=> b!165266 (= e!108401 tp_is_empty!3697)))

(declare-fun b!165267 () Bool)

(declare-fun res!78375 () Bool)

(assert (=> b!165267 (=> (not res!78375) (not e!108405))))

(declare-datatypes ((tuple2!3054 0))(
  ( (tuple2!3055 (_1!1538 (_ BitVec 64)) (_2!1538 V!4577)) )
))
(declare-datatypes ((List!2055 0))(
  ( (Nil!2052) (Cons!2051 (h!2668 tuple2!3054) (t!6848 List!2055)) )
))
(declare-datatypes ((ListLongMap!1997 0))(
  ( (ListLongMap!1998 (toList!1014 List!2055)) )
))
(declare-fun contains!1059 (ListLongMap!1997 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!656 (array!6471 array!6473 (_ BitVec 32) (_ BitVec 32) V!4577 V!4577 (_ BitVec 32) Int) ListLongMap!1997)

(assert (=> b!165267 (= res!78375 (not (contains!1059 (getCurrentListMap!656 (_keys!5225 thiss!1248) (_values!3384 thiss!1248) (mask!8111 thiss!1248) (extraKeys!3142 thiss!1248) (zeroValue!3244 thiss!1248) (minValue!3244 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3401 thiss!1248)) key!828)))))

(assert (= (and start!16594 res!78378) b!165264))

(assert (= (and b!165264 res!78377) b!165260))

(assert (= (and b!165260 res!78373) b!165267))

(assert (= (and b!165267 res!78375) b!165265))

(assert (= (and b!165265 res!78374) b!165263))

(assert (= (and b!165263 res!78376) b!165258))

(assert (= (and b!165258 res!78379) b!165259))

(assert (= (and b!165257 condMapEmpty!6264) mapIsEmpty!6264))

(assert (= (and b!165257 (not condMapEmpty!6264)) mapNonEmpty!6264))

(assert (= (and mapNonEmpty!6264 ((_ is ValueCellFull!1505) mapValue!6264)) b!165266))

(assert (= (and b!165257 ((_ is ValueCellFull!1505) mapDefault!6264)) b!165262))

(assert (= b!165261 b!165257))

(assert (= start!16594 b!165261))

(declare-fun m!194611 () Bool)

(assert (=> b!165260 m!194611))

(declare-fun m!194613 () Bool)

(assert (=> b!165261 m!194613))

(declare-fun m!194615 () Bool)

(assert (=> b!165261 m!194615))

(declare-fun m!194617 () Bool)

(assert (=> start!16594 m!194617))

(declare-fun m!194619 () Bool)

(assert (=> b!165259 m!194619))

(declare-fun m!194621 () Bool)

(assert (=> b!165265 m!194621))

(declare-fun m!194623 () Bool)

(assert (=> b!165267 m!194623))

(assert (=> b!165267 m!194623))

(declare-fun m!194625 () Bool)

(assert (=> b!165267 m!194625))

(declare-fun m!194627 () Bool)

(assert (=> b!165258 m!194627))

(declare-fun m!194629 () Bool)

(assert (=> mapNonEmpty!6264 m!194629))

(check-sat (not b_next!3895) b_and!10283 (not mapNonEmpty!6264) (not b!165259) (not b!165261) (not start!16594) tp_is_empty!3697 (not b!165265) (not b!165260) (not b!165258) (not b!165267))
(check-sat b_and!10283 (not b_next!3895))
