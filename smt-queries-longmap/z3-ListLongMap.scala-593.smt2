; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15704 () Bool)

(assert start!15704)

(declare-fun b!156611 () Bool)

(declare-fun b_free!3367 () Bool)

(declare-fun b_next!3367 () Bool)

(assert (=> b!156611 (= b_free!3367 (not b_next!3367))))

(declare-fun tp!12625 () Bool)

(declare-fun b_and!9795 () Bool)

(assert (=> b!156611 (= tp!12625 b_and!9795)))

(declare-fun mapIsEmpty!5396 () Bool)

(declare-fun mapRes!5396 () Bool)

(assert (=> mapIsEmpty!5396 mapRes!5396))

(declare-fun b!156608 () Bool)

(declare-fun e!102418 () Bool)

(declare-fun tp_is_empty!3169 () Bool)

(assert (=> b!156608 (= e!102418 tp_is_empty!3169)))

(declare-fun b!156609 () Bool)

(declare-fun res!74007 () Bool)

(declare-fun e!102421 () Bool)

(assert (=> b!156609 (=> (not res!74007) (not e!102421))))

(declare-datatypes ((V!3873 0))(
  ( (V!3874 (val!1629 Int)) )
))
(declare-datatypes ((ValueCell!1241 0))(
  ( (ValueCellFull!1241 (v!3495 V!3873)) (EmptyCell!1241) )
))
(declare-datatypes ((array!5377 0))(
  ( (array!5378 (arr!2546 (Array (_ BitVec 32) (_ BitVec 64))) (size!2824 (_ BitVec 32))) )
))
(declare-datatypes ((array!5379 0))(
  ( (array!5380 (arr!2547 (Array (_ BitVec 32) ValueCell!1241)) (size!2825 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1390 0))(
  ( (LongMapFixedSize!1391 (defaultEntry!3137 Int) (mask!7592 (_ BitVec 32)) (extraKeys!2878 (_ BitVec 32)) (zeroValue!2980 V!3873) (minValue!2980 V!3873) (_size!744 (_ BitVec 32)) (_keys!4912 array!5377) (_values!3120 array!5379) (_vacant!744 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1390)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5377 (_ BitVec 32)) Bool)

(assert (=> b!156609 (= res!74007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4912 thiss!1248) (mask!7592 thiss!1248)))))

(declare-fun mapNonEmpty!5396 () Bool)

(declare-fun tp!12626 () Bool)

(declare-fun e!102419 () Bool)

(assert (=> mapNonEmpty!5396 (= mapRes!5396 (and tp!12626 e!102419))))

(declare-fun mapRest!5396 () (Array (_ BitVec 32) ValueCell!1241))

(declare-fun mapValue!5396 () ValueCell!1241)

(declare-fun mapKey!5396 () (_ BitVec 32))

(assert (=> mapNonEmpty!5396 (= (arr!2547 (_values!3120 thiss!1248)) (store mapRest!5396 mapKey!5396 mapValue!5396))))

(declare-fun res!74008 () Bool)

(assert (=> start!15704 (=> (not res!74008) (not e!102421))))

(declare-fun valid!685 (LongMapFixedSize!1390) Bool)

(assert (=> start!15704 (= res!74008 (valid!685 thiss!1248))))

(assert (=> start!15704 e!102421))

(declare-fun e!102420 () Bool)

(assert (=> start!15704 e!102420))

(assert (=> start!15704 true))

(declare-fun b!156610 () Bool)

(declare-fun e!102423 () Bool)

(assert (=> b!156610 (= e!102423 (and e!102418 mapRes!5396))))

(declare-fun condMapEmpty!5396 () Bool)

(declare-fun mapDefault!5396 () ValueCell!1241)

(assert (=> b!156610 (= condMapEmpty!5396 (= (arr!2547 (_values!3120 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1241)) mapDefault!5396)))))

(declare-fun array_inv!1613 (array!5377) Bool)

(declare-fun array_inv!1614 (array!5379) Bool)

(assert (=> b!156611 (= e!102420 (and tp!12625 tp_is_empty!3169 (array_inv!1613 (_keys!4912 thiss!1248)) (array_inv!1614 (_values!3120 thiss!1248)) e!102423))))

(declare-fun b!156612 () Bool)

(assert (=> b!156612 (= e!102419 tp_is_empty!3169)))

(declare-fun b!156613 () Bool)

(assert (=> b!156613 (= e!102421 false)))

(declare-fun lt!81624 () Bool)

(declare-datatypes ((List!1843 0))(
  ( (Nil!1840) (Cons!1839 (h!2448 (_ BitVec 64)) (t!6637 List!1843)) )
))
(declare-fun arrayNoDuplicates!0 (array!5377 (_ BitVec 32) List!1843) Bool)

(assert (=> b!156613 (= lt!81624 (arrayNoDuplicates!0 (_keys!4912 thiss!1248) #b00000000000000000000000000000000 Nil!1840))))

(declare-fun b!156614 () Bool)

(declare-fun res!74005 () Bool)

(assert (=> b!156614 (=> (not res!74005) (not e!102421))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156614 (= res!74005 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156615 () Bool)

(declare-fun res!74004 () Bool)

(assert (=> b!156615 (=> (not res!74004) (not e!102421))))

(assert (=> b!156615 (= res!74004 (and (= (size!2825 (_values!3120 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7592 thiss!1248))) (= (size!2824 (_keys!4912 thiss!1248)) (size!2825 (_values!3120 thiss!1248))) (bvsge (mask!7592 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2878 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2878 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2878 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2878 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2878 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2878 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2878 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156616 () Bool)

(declare-fun res!74006 () Bool)

(assert (=> b!156616 (=> (not res!74006) (not e!102421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156616 (= res!74006 (validMask!0 (mask!7592 thiss!1248)))))

(assert (= (and start!15704 res!74008) b!156614))

(assert (= (and b!156614 res!74005) b!156616))

(assert (= (and b!156616 res!74006) b!156615))

(assert (= (and b!156615 res!74004) b!156609))

(assert (= (and b!156609 res!74007) b!156613))

(assert (= (and b!156610 condMapEmpty!5396) mapIsEmpty!5396))

(assert (= (and b!156610 (not condMapEmpty!5396)) mapNonEmpty!5396))

(get-info :version)

(assert (= (and mapNonEmpty!5396 ((_ is ValueCellFull!1241) mapValue!5396)) b!156612))

(assert (= (and b!156610 ((_ is ValueCellFull!1241) mapDefault!5396)) b!156608))

(assert (= b!156611 b!156610))

(assert (= start!15704 b!156611))

(declare-fun m!190247 () Bool)

(assert (=> b!156609 m!190247))

(declare-fun m!190249 () Bool)

(assert (=> mapNonEmpty!5396 m!190249))

(declare-fun m!190251 () Bool)

(assert (=> start!15704 m!190251))

(declare-fun m!190253 () Bool)

(assert (=> b!156611 m!190253))

(declare-fun m!190255 () Bool)

(assert (=> b!156611 m!190255))

(declare-fun m!190257 () Bool)

(assert (=> b!156616 m!190257))

(declare-fun m!190259 () Bool)

(assert (=> b!156613 m!190259))

(check-sat (not b!156613) (not b!156611) (not b!156616) tp_is_empty!3169 b_and!9795 (not b_next!3367) (not start!15704) (not mapNonEmpty!5396) (not b!156609))
(check-sat b_and!9795 (not b_next!3367))
