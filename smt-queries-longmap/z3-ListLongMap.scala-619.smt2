; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16064 () Bool)

(assert start!16064)

(declare-fun b!159472 () Bool)

(declare-fun b_free!3525 () Bool)

(declare-fun b_next!3525 () Bool)

(assert (=> b!159472 (= b_free!3525 (not b_next!3525))))

(declare-fun tp!13145 () Bool)

(declare-fun b_and!9939 () Bool)

(assert (=> b!159472 (= tp!13145 b_and!9939)))

(declare-fun b!159462 () Bool)

(declare-fun e!104376 () Bool)

(declare-fun tp_is_empty!3327 () Bool)

(assert (=> b!159462 (= e!104376 tp_is_empty!3327)))

(declare-fun mapNonEmpty!5678 () Bool)

(declare-fun mapRes!5678 () Bool)

(declare-fun tp!13144 () Bool)

(declare-fun e!104373 () Bool)

(assert (=> mapNonEmpty!5678 (= mapRes!5678 (and tp!13144 e!104373))))

(declare-fun mapKey!5678 () (_ BitVec 32))

(declare-datatypes ((V!4083 0))(
  ( (V!4084 (val!1708 Int)) )
))
(declare-datatypes ((ValueCell!1320 0))(
  ( (ValueCellFull!1320 (v!3573 V!4083)) (EmptyCell!1320) )
))
(declare-fun mapRest!5678 () (Array (_ BitVec 32) ValueCell!1320))

(declare-datatypes ((array!5733 0))(
  ( (array!5734 (arr!2711 (Array (_ BitVec 32) (_ BitVec 64))) (size!2995 (_ BitVec 32))) )
))
(declare-datatypes ((array!5735 0))(
  ( (array!5736 (arr!2712 (Array (_ BitVec 32) ValueCell!1320)) (size!2996 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1548 0))(
  ( (LongMapFixedSize!1549 (defaultEntry!3216 Int) (mask!7766 (_ BitVec 32)) (extraKeys!2957 (_ BitVec 32)) (zeroValue!3059 V!4083) (minValue!3059 V!4083) (_size!823 (_ BitVec 32)) (_keys!5017 array!5733) (_values!3199 array!5735) (_vacant!823 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1548)

(declare-fun mapValue!5678 () ValueCell!1320)

(assert (=> mapNonEmpty!5678 (= (arr!2712 (_values!3199 thiss!1248)) (store mapRest!5678 mapKey!5678 mapValue!5678))))

(declare-fun b!159463 () Bool)

(declare-fun e!104372 () Bool)

(assert (=> b!159463 (= e!104372 false)))

(declare-fun lt!82000 () Bool)

(declare-datatypes ((List!1909 0))(
  ( (Nil!1906) (Cons!1905 (h!2518 (_ BitVec 64)) (t!6711 List!1909)) )
))
(declare-fun arrayNoDuplicates!0 (array!5733 (_ BitVec 32) List!1909) Bool)

(assert (=> b!159463 (= lt!82000 (arrayNoDuplicates!0 (_keys!5017 thiss!1248) #b00000000000000000000000000000000 Nil!1906))))

(declare-fun b!159464 () Bool)

(assert (=> b!159464 (= e!104373 tp_is_empty!3327)))

(declare-fun b!159465 () Bool)

(declare-fun res!75347 () Bool)

(assert (=> b!159465 (=> (not res!75347) (not e!104372))))

(assert (=> b!159465 (= res!75347 (and (= (size!2996 (_values!3199 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7766 thiss!1248))) (= (size!2995 (_keys!5017 thiss!1248)) (size!2996 (_values!3199 thiss!1248))) (bvsge (mask!7766 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2957 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2957 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!75349 () Bool)

(assert (=> start!16064 (=> (not res!75349) (not e!104372))))

(declare-fun valid!724 (LongMapFixedSize!1548) Bool)

(assert (=> start!16064 (= res!75349 (valid!724 thiss!1248))))

(assert (=> start!16064 e!104372))

(declare-fun e!104374 () Bool)

(assert (=> start!16064 e!104374))

(assert (=> start!16064 true))

(declare-fun mapIsEmpty!5678 () Bool)

(assert (=> mapIsEmpty!5678 mapRes!5678))

(declare-fun b!159466 () Bool)

(declare-fun res!75344 () Bool)

(assert (=> b!159466 (=> (not res!75344) (not e!104372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5733 (_ BitVec 32)) Bool)

(assert (=> b!159466 (= res!75344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5017 thiss!1248) (mask!7766 thiss!1248)))))

(declare-fun b!159467 () Bool)

(declare-fun res!75348 () Bool)

(assert (=> b!159467 (=> (not res!75348) (not e!104372))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159467 (= res!75348 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159468 () Bool)

(declare-fun res!75350 () Bool)

(assert (=> b!159468 (=> (not res!75350) (not e!104372))))

(declare-datatypes ((tuple2!2888 0))(
  ( (tuple2!2889 (_1!1455 (_ BitVec 64)) (_2!1455 V!4083)) )
))
(declare-datatypes ((List!1910 0))(
  ( (Nil!1907) (Cons!1906 (h!2519 tuple2!2888) (t!6712 List!1910)) )
))
(declare-datatypes ((ListLongMap!1875 0))(
  ( (ListLongMap!1876 (toList!953 List!1910)) )
))
(declare-fun contains!989 (ListLongMap!1875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!617 (array!5733 array!5735 (_ BitVec 32) (_ BitVec 32) V!4083 V!4083 (_ BitVec 32) Int) ListLongMap!1875)

(assert (=> b!159468 (= res!75350 (contains!989 (getCurrentListMap!617 (_keys!5017 thiss!1248) (_values!3199 thiss!1248) (mask!7766 thiss!1248) (extraKeys!2957 thiss!1248) (zeroValue!3059 thiss!1248) (minValue!3059 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3216 thiss!1248)) key!828))))

(declare-fun b!159469 () Bool)

(declare-fun res!75346 () Bool)

(assert (=> b!159469 (=> (not res!75346) (not e!104372))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!312 0))(
  ( (MissingZero!312 (index!3416 (_ BitVec 32))) (Found!312 (index!3417 (_ BitVec 32))) (Intermediate!312 (undefined!1124 Bool) (index!3418 (_ BitVec 32)) (x!17608 (_ BitVec 32))) (Undefined!312) (MissingVacant!312 (index!3419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5733 (_ BitVec 32)) SeekEntryResult!312)

(assert (=> b!159469 (= res!75346 ((_ is Undefined!312) (seekEntryOrOpen!0 key!828 (_keys!5017 thiss!1248) (mask!7766 thiss!1248))))))

(declare-fun b!159470 () Bool)

(declare-fun res!75345 () Bool)

(assert (=> b!159470 (=> (not res!75345) (not e!104372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159470 (= res!75345 (validMask!0 (mask!7766 thiss!1248)))))

(declare-fun b!159471 () Bool)

(declare-fun e!104375 () Bool)

(assert (=> b!159471 (= e!104375 (and e!104376 mapRes!5678))))

(declare-fun condMapEmpty!5678 () Bool)

(declare-fun mapDefault!5678 () ValueCell!1320)

(assert (=> b!159471 (= condMapEmpty!5678 (= (arr!2712 (_values!3199 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1320)) mapDefault!5678)))))

(declare-fun array_inv!1725 (array!5733) Bool)

(declare-fun array_inv!1726 (array!5735) Bool)

(assert (=> b!159472 (= e!104374 (and tp!13145 tp_is_empty!3327 (array_inv!1725 (_keys!5017 thiss!1248)) (array_inv!1726 (_values!3199 thiss!1248)) e!104375))))

(assert (= (and start!16064 res!75349) b!159467))

(assert (= (and b!159467 res!75348) b!159469))

(assert (= (and b!159469 res!75346) b!159468))

(assert (= (and b!159468 res!75350) b!159470))

(assert (= (and b!159470 res!75345) b!159465))

(assert (= (and b!159465 res!75347) b!159466))

(assert (= (and b!159466 res!75344) b!159463))

(assert (= (and b!159471 condMapEmpty!5678) mapIsEmpty!5678))

(assert (= (and b!159471 (not condMapEmpty!5678)) mapNonEmpty!5678))

(assert (= (and mapNonEmpty!5678 ((_ is ValueCellFull!1320) mapValue!5678)) b!159464))

(assert (= (and b!159471 ((_ is ValueCellFull!1320) mapDefault!5678)) b!159462))

(assert (= b!159472 b!159471))

(assert (= start!16064 b!159472))

(declare-fun m!191717 () Bool)

(assert (=> b!159472 m!191717))

(declare-fun m!191719 () Bool)

(assert (=> b!159472 m!191719))

(declare-fun m!191721 () Bool)

(assert (=> b!159466 m!191721))

(declare-fun m!191723 () Bool)

(assert (=> start!16064 m!191723))

(declare-fun m!191725 () Bool)

(assert (=> b!159468 m!191725))

(assert (=> b!159468 m!191725))

(declare-fun m!191727 () Bool)

(assert (=> b!159468 m!191727))

(declare-fun m!191729 () Bool)

(assert (=> b!159470 m!191729))

(declare-fun m!191731 () Bool)

(assert (=> b!159463 m!191731))

(declare-fun m!191733 () Bool)

(assert (=> b!159469 m!191733))

(declare-fun m!191735 () Bool)

(assert (=> mapNonEmpty!5678 m!191735))

(check-sat b_and!9939 (not b!159466) (not b!159468) (not b!159472) (not b_next!3525) (not b!159469) (not b!159463) tp_is_empty!3327 (not b!159470) (not start!16064) (not mapNonEmpty!5678))
(check-sat b_and!9939 (not b_next!3525))
