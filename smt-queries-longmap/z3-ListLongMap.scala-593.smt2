; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15704 () Bool)

(assert start!15704)

(declare-fun b!156422 () Bool)

(declare-fun b_free!3367 () Bool)

(declare-fun b_next!3367 () Bool)

(assert (=> b!156422 (= b_free!3367 (not b_next!3367))))

(declare-fun tp!12626 () Bool)

(declare-fun b_and!9755 () Bool)

(assert (=> b!156422 (= tp!12626 b_and!9755)))

(declare-fun b!156414 () Bool)

(declare-fun e!102296 () Bool)

(assert (=> b!156414 (= e!102296 false)))

(declare-fun lt!81384 () Bool)

(declare-datatypes ((V!3873 0))(
  ( (V!3874 (val!1629 Int)) )
))
(declare-datatypes ((ValueCell!1241 0))(
  ( (ValueCellFull!1241 (v!3488 V!3873)) (EmptyCell!1241) )
))
(declare-datatypes ((array!5371 0))(
  ( (array!5372 (arr!2542 (Array (_ BitVec 32) (_ BitVec 64))) (size!2821 (_ BitVec 32))) )
))
(declare-datatypes ((array!5373 0))(
  ( (array!5374 (arr!2543 (Array (_ BitVec 32) ValueCell!1241)) (size!2822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1390 0))(
  ( (LongMapFixedSize!1391 (defaultEntry!3137 Int) (mask!7591 (_ BitVec 32)) (extraKeys!2878 (_ BitVec 32)) (zeroValue!2980 V!3873) (minValue!2980 V!3873) (_size!744 (_ BitVec 32)) (_keys!4911 array!5371) (_values!3120 array!5373) (_vacant!744 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1390)

(declare-datatypes ((List!1857 0))(
  ( (Nil!1854) (Cons!1853 (h!2462 (_ BitVec 64)) (t!6650 List!1857)) )
))
(declare-fun arrayNoDuplicates!0 (array!5371 (_ BitVec 32) List!1857) Bool)

(assert (=> b!156414 (= lt!81384 (arrayNoDuplicates!0 (_keys!4911 thiss!1248) #b00000000000000000000000000000000 Nil!1854))))

(declare-fun b!156415 () Bool)

(declare-fun res!73888 () Bool)

(assert (=> b!156415 (=> (not res!73888) (not e!102296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5371 (_ BitVec 32)) Bool)

(assert (=> b!156415 (= res!73888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4911 thiss!1248) (mask!7591 thiss!1248)))))

(declare-fun b!156417 () Bool)

(declare-fun e!102293 () Bool)

(declare-fun e!102298 () Bool)

(declare-fun mapRes!5396 () Bool)

(assert (=> b!156417 (= e!102293 (and e!102298 mapRes!5396))))

(declare-fun condMapEmpty!5396 () Bool)

(declare-fun mapDefault!5396 () ValueCell!1241)

(assert (=> b!156417 (= condMapEmpty!5396 (= (arr!2543 (_values!3120 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1241)) mapDefault!5396)))))

(declare-fun b!156418 () Bool)

(declare-fun res!73889 () Bool)

(assert (=> b!156418 (=> (not res!73889) (not e!102296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156418 (= res!73889 (validMask!0 (mask!7591 thiss!1248)))))

(declare-fun mapIsEmpty!5396 () Bool)

(assert (=> mapIsEmpty!5396 mapRes!5396))

(declare-fun b!156419 () Bool)

(declare-fun e!102297 () Bool)

(declare-fun tp_is_empty!3169 () Bool)

(assert (=> b!156419 (= e!102297 tp_is_empty!3169)))

(declare-fun b!156420 () Bool)

(declare-fun res!73890 () Bool)

(assert (=> b!156420 (=> (not res!73890) (not e!102296))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156420 (= res!73890 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156421 () Bool)

(assert (=> b!156421 (= e!102298 tp_is_empty!3169)))

(declare-fun res!73891 () Bool)

(assert (=> start!15704 (=> (not res!73891) (not e!102296))))

(declare-fun valid!674 (LongMapFixedSize!1390) Bool)

(assert (=> start!15704 (= res!73891 (valid!674 thiss!1248))))

(assert (=> start!15704 e!102296))

(declare-fun e!102294 () Bool)

(assert (=> start!15704 e!102294))

(assert (=> start!15704 true))

(declare-fun b!156416 () Bool)

(declare-fun res!73892 () Bool)

(assert (=> b!156416 (=> (not res!73892) (not e!102296))))

(assert (=> b!156416 (= res!73892 (and (= (size!2822 (_values!3120 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7591 thiss!1248))) (= (size!2821 (_keys!4911 thiss!1248)) (size!2822 (_values!3120 thiss!1248))) (bvsge (mask!7591 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2878 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2878 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2878 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2878 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2878 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2878 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2878 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5396 () Bool)

(declare-fun tp!12625 () Bool)

(assert (=> mapNonEmpty!5396 (= mapRes!5396 (and tp!12625 e!102297))))

(declare-fun mapValue!5396 () ValueCell!1241)

(declare-fun mapKey!5396 () (_ BitVec 32))

(declare-fun mapRest!5396 () (Array (_ BitVec 32) ValueCell!1241))

(assert (=> mapNonEmpty!5396 (= (arr!2543 (_values!3120 thiss!1248)) (store mapRest!5396 mapKey!5396 mapValue!5396))))

(declare-fun array_inv!1639 (array!5371) Bool)

(declare-fun array_inv!1640 (array!5373) Bool)

(assert (=> b!156422 (= e!102294 (and tp!12626 tp_is_empty!3169 (array_inv!1639 (_keys!4911 thiss!1248)) (array_inv!1640 (_values!3120 thiss!1248)) e!102293))))

(assert (= (and start!15704 res!73891) b!156420))

(assert (= (and b!156420 res!73890) b!156418))

(assert (= (and b!156418 res!73889) b!156416))

(assert (= (and b!156416 res!73892) b!156415))

(assert (= (and b!156415 res!73888) b!156414))

(assert (= (and b!156417 condMapEmpty!5396) mapIsEmpty!5396))

(assert (= (and b!156417 (not condMapEmpty!5396)) mapNonEmpty!5396))

(get-info :version)

(assert (= (and mapNonEmpty!5396 ((_ is ValueCellFull!1241) mapValue!5396)) b!156419))

(assert (= (and b!156417 ((_ is ValueCellFull!1241) mapDefault!5396)) b!156421))

(assert (= b!156422 b!156417))

(assert (= start!15704 b!156422))

(declare-fun m!189445 () Bool)

(assert (=> start!15704 m!189445))

(declare-fun m!189447 () Bool)

(assert (=> b!156418 m!189447))

(declare-fun m!189449 () Bool)

(assert (=> b!156422 m!189449))

(declare-fun m!189451 () Bool)

(assert (=> b!156422 m!189451))

(declare-fun m!189453 () Bool)

(assert (=> b!156414 m!189453))

(declare-fun m!189455 () Bool)

(assert (=> mapNonEmpty!5396 m!189455))

(declare-fun m!189457 () Bool)

(assert (=> b!156415 m!189457))

(check-sat (not start!15704) (not b!156422) (not mapNonEmpty!5396) (not b_next!3367) (not b!156415) (not b!156418) tp_is_empty!3169 (not b!156414) b_and!9755)
(check-sat b_and!9755 (not b_next!3367))
