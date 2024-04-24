; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15686 () Bool)

(assert start!15686)

(declare-fun b!156370 () Bool)

(declare-fun b_free!3349 () Bool)

(declare-fun b_next!3349 () Bool)

(assert (=> b!156370 (= b_free!3349 (not b_next!3349))))

(declare-fun tp!12571 () Bool)

(declare-fun b_and!9777 () Bool)

(assert (=> b!156370 (= tp!12571 b_and!9777)))

(declare-fun b!156365 () Bool)

(declare-fun e!102260 () Bool)

(declare-fun tp_is_empty!3151 () Bool)

(assert (=> b!156365 (= e!102260 tp_is_empty!3151)))

(declare-fun b!156366 () Bool)

(declare-fun e!102257 () Bool)

(declare-fun mapRes!5369 () Bool)

(assert (=> b!156366 (= e!102257 (and e!102260 mapRes!5369))))

(declare-fun condMapEmpty!5369 () Bool)

(declare-datatypes ((V!3849 0))(
  ( (V!3850 (val!1620 Int)) )
))
(declare-datatypes ((ValueCell!1232 0))(
  ( (ValueCellFull!1232 (v!3486 V!3849)) (EmptyCell!1232) )
))
(declare-datatypes ((array!5341 0))(
  ( (array!5342 (arr!2528 (Array (_ BitVec 32) (_ BitVec 64))) (size!2806 (_ BitVec 32))) )
))
(declare-datatypes ((array!5343 0))(
  ( (array!5344 (arr!2529 (Array (_ BitVec 32) ValueCell!1232)) (size!2807 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1372 0))(
  ( (LongMapFixedSize!1373 (defaultEntry!3128 Int) (mask!7577 (_ BitVec 32)) (extraKeys!2869 (_ BitVec 32)) (zeroValue!2971 V!3849) (minValue!2971 V!3849) (_size!735 (_ BitVec 32)) (_keys!4903 array!5341) (_values!3111 array!5343) (_vacant!735 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1372)

(declare-fun mapDefault!5369 () ValueCell!1232)

(assert (=> b!156366 (= condMapEmpty!5369 (= (arr!2529 (_values!3111 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1232)) mapDefault!5369)))))

(declare-fun b!156367 () Bool)

(declare-fun res!73873 () Bool)

(declare-fun e!102256 () Bool)

(assert (=> b!156367 (=> (not res!73873) (not e!102256))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156367 (= res!73873 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156368 () Bool)

(declare-fun res!73871 () Bool)

(assert (=> b!156368 (=> (not res!73871) (not e!102256))))

(assert (=> b!156368 (= res!73871 (and (= (size!2807 (_values!3111 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7577 thiss!1248))) (= (size!2806 (_keys!4903 thiss!1248)) (size!2807 (_values!3111 thiss!1248))) (bvsge (mask!7577 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2869 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2869 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2869 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2869 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2869 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2869 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2869 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156369 () Bool)

(declare-fun res!73870 () Bool)

(assert (=> b!156369 (=> (not res!73870) (not e!102256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156369 (= res!73870 (validMask!0 (mask!7577 thiss!1248)))))

(declare-fun e!102259 () Bool)

(declare-fun array_inv!1599 (array!5341) Bool)

(declare-fun array_inv!1600 (array!5343) Bool)

(assert (=> b!156370 (= e!102259 (and tp!12571 tp_is_empty!3151 (array_inv!1599 (_keys!4903 thiss!1248)) (array_inv!1600 (_values!3111 thiss!1248)) e!102257))))

(declare-fun mapIsEmpty!5369 () Bool)

(assert (=> mapIsEmpty!5369 mapRes!5369))

(declare-fun mapNonEmpty!5369 () Bool)

(declare-fun tp!12572 () Bool)

(declare-fun e!102258 () Bool)

(assert (=> mapNonEmpty!5369 (= mapRes!5369 (and tp!12572 e!102258))))

(declare-fun mapKey!5369 () (_ BitVec 32))

(declare-fun mapRest!5369 () (Array (_ BitVec 32) ValueCell!1232))

(declare-fun mapValue!5369 () ValueCell!1232)

(assert (=> mapNonEmpty!5369 (= (arr!2529 (_values!3111 thiss!1248)) (store mapRest!5369 mapKey!5369 mapValue!5369))))

(declare-fun b!156372 () Bool)

(assert (=> b!156372 (= e!102258 tp_is_empty!3151)))

(declare-fun b!156373 () Bool)

(assert (=> b!156373 (= e!102256 false)))

(declare-fun lt!81597 () Bool)

(declare-datatypes ((List!1837 0))(
  ( (Nil!1834) (Cons!1833 (h!2442 (_ BitVec 64)) (t!6631 List!1837)) )
))
(declare-fun arrayNoDuplicates!0 (array!5341 (_ BitVec 32) List!1837) Bool)

(assert (=> b!156373 (= lt!81597 (arrayNoDuplicates!0 (_keys!4903 thiss!1248) #b00000000000000000000000000000000 Nil!1834))))

(declare-fun res!73872 () Bool)

(assert (=> start!15686 (=> (not res!73872) (not e!102256))))

(declare-fun valid!681 (LongMapFixedSize!1372) Bool)

(assert (=> start!15686 (= res!73872 (valid!681 thiss!1248))))

(assert (=> start!15686 e!102256))

(assert (=> start!15686 e!102259))

(assert (=> start!15686 true))

(declare-fun b!156371 () Bool)

(declare-fun res!73869 () Bool)

(assert (=> b!156371 (=> (not res!73869) (not e!102256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5341 (_ BitVec 32)) Bool)

(assert (=> b!156371 (= res!73869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4903 thiss!1248) (mask!7577 thiss!1248)))))

(assert (= (and start!15686 res!73872) b!156367))

(assert (= (and b!156367 res!73873) b!156369))

(assert (= (and b!156369 res!73870) b!156368))

(assert (= (and b!156368 res!73871) b!156371))

(assert (= (and b!156371 res!73869) b!156373))

(assert (= (and b!156366 condMapEmpty!5369) mapIsEmpty!5369))

(assert (= (and b!156366 (not condMapEmpty!5369)) mapNonEmpty!5369))

(get-info :version)

(assert (= (and mapNonEmpty!5369 ((_ is ValueCellFull!1232) mapValue!5369)) b!156372))

(assert (= (and b!156366 ((_ is ValueCellFull!1232) mapDefault!5369)) b!156365))

(assert (= b!156370 b!156366))

(assert (= start!15686 b!156370))

(declare-fun m!190121 () Bool)

(assert (=> b!156373 m!190121))

(declare-fun m!190123 () Bool)

(assert (=> start!15686 m!190123))

(declare-fun m!190125 () Bool)

(assert (=> b!156369 m!190125))

(declare-fun m!190127 () Bool)

(assert (=> b!156371 m!190127))

(declare-fun m!190129 () Bool)

(assert (=> mapNonEmpty!5369 m!190129))

(declare-fun m!190131 () Bool)

(assert (=> b!156370 m!190131))

(declare-fun m!190133 () Bool)

(assert (=> b!156370 m!190133))

(check-sat (not b!156371) b_and!9777 (not b!156369) (not mapNonEmpty!5369) tp_is_empty!3151 (not b!156370) (not b_next!3349) (not b!156373) (not start!15686))
(check-sat b_and!9777 (not b_next!3349))
