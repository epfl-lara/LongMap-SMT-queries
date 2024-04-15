; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15686 () Bool)

(assert start!15686)

(declare-fun b!156175 () Bool)

(declare-fun b_free!3349 () Bool)

(declare-fun b_next!3349 () Bool)

(assert (=> b!156175 (= b_free!3349 (not b_next!3349))))

(declare-fun tp!12572 () Bool)

(declare-fun b_and!9737 () Bool)

(assert (=> b!156175 (= tp!12572 b_and!9737)))

(declare-fun b!156171 () Bool)

(declare-fun res!73754 () Bool)

(declare-fun e!102136 () Bool)

(assert (=> b!156171 (=> (not res!73754) (not e!102136))))

(declare-datatypes ((V!3849 0))(
  ( (V!3850 (val!1620 Int)) )
))
(declare-datatypes ((ValueCell!1232 0))(
  ( (ValueCellFull!1232 (v!3479 V!3849)) (EmptyCell!1232) )
))
(declare-datatypes ((array!5335 0))(
  ( (array!5336 (arr!2524 (Array (_ BitVec 32) (_ BitVec 64))) (size!2803 (_ BitVec 32))) )
))
(declare-datatypes ((array!5337 0))(
  ( (array!5338 (arr!2525 (Array (_ BitVec 32) ValueCell!1232)) (size!2804 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1372 0))(
  ( (LongMapFixedSize!1373 (defaultEntry!3128 Int) (mask!7576 (_ BitVec 32)) (extraKeys!2869 (_ BitVec 32)) (zeroValue!2971 V!3849) (minValue!2971 V!3849) (_size!735 (_ BitVec 32)) (_keys!4902 array!5335) (_values!3111 array!5337) (_vacant!735 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1372)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5335 (_ BitVec 32)) Bool)

(assert (=> b!156171 (= res!73754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4902 thiss!1248) (mask!7576 thiss!1248)))))

(declare-fun b!156172 () Bool)

(declare-fun res!73756 () Bool)

(assert (=> b!156172 (=> (not res!73756) (not e!102136))))

(assert (=> b!156172 (= res!73756 (and (= (size!2804 (_values!3111 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7576 thiss!1248))) (= (size!2803 (_keys!4902 thiss!1248)) (size!2804 (_values!3111 thiss!1248))) (bvsge (mask!7576 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2869 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2869 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2869 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2869 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2869 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2869 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2869 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156173 () Bool)

(declare-fun e!102133 () Bool)

(declare-fun tp_is_empty!3151 () Bool)

(assert (=> b!156173 (= e!102133 tp_is_empty!3151)))

(declare-fun b!156174 () Bool)

(declare-fun res!73757 () Bool)

(assert (=> b!156174 (=> (not res!73757) (not e!102136))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156174 (= res!73757 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5369 () Bool)

(declare-fun mapRes!5369 () Bool)

(assert (=> mapIsEmpty!5369 mapRes!5369))

(declare-fun mapNonEmpty!5369 () Bool)

(declare-fun tp!12571 () Bool)

(assert (=> mapNonEmpty!5369 (= mapRes!5369 (and tp!12571 e!102133))))

(declare-fun mapKey!5369 () (_ BitVec 32))

(declare-fun mapRest!5369 () (Array (_ BitVec 32) ValueCell!1232))

(declare-fun mapValue!5369 () ValueCell!1232)

(assert (=> mapNonEmpty!5369 (= (arr!2525 (_values!3111 thiss!1248)) (store mapRest!5369 mapKey!5369 mapValue!5369))))

(declare-fun b!156176 () Bool)

(declare-fun e!102132 () Bool)

(assert (=> b!156176 (= e!102132 tp_is_empty!3151)))

(declare-fun b!156177 () Bool)

(assert (=> b!156177 (= e!102136 false)))

(declare-fun lt!81357 () Bool)

(declare-datatypes ((List!1850 0))(
  ( (Nil!1847) (Cons!1846 (h!2455 (_ BitVec 64)) (t!6643 List!1850)) )
))
(declare-fun arrayNoDuplicates!0 (array!5335 (_ BitVec 32) List!1850) Bool)

(assert (=> b!156177 (= lt!81357 (arrayNoDuplicates!0 (_keys!4902 thiss!1248) #b00000000000000000000000000000000 Nil!1847))))

(declare-fun res!73755 () Bool)

(assert (=> start!15686 (=> (not res!73755) (not e!102136))))

(declare-fun valid!669 (LongMapFixedSize!1372) Bool)

(assert (=> start!15686 (= res!73755 (valid!669 thiss!1248))))

(assert (=> start!15686 e!102136))

(declare-fun e!102134 () Bool)

(assert (=> start!15686 e!102134))

(assert (=> start!15686 true))

(declare-fun e!102131 () Bool)

(declare-fun array_inv!1629 (array!5335) Bool)

(declare-fun array_inv!1630 (array!5337) Bool)

(assert (=> b!156175 (= e!102134 (and tp!12572 tp_is_empty!3151 (array_inv!1629 (_keys!4902 thiss!1248)) (array_inv!1630 (_values!3111 thiss!1248)) e!102131))))

(declare-fun b!156178 () Bool)

(assert (=> b!156178 (= e!102131 (and e!102132 mapRes!5369))))

(declare-fun condMapEmpty!5369 () Bool)

(declare-fun mapDefault!5369 () ValueCell!1232)

(assert (=> b!156178 (= condMapEmpty!5369 (= (arr!2525 (_values!3111 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1232)) mapDefault!5369)))))

(declare-fun b!156179 () Bool)

(declare-fun res!73753 () Bool)

(assert (=> b!156179 (=> (not res!73753) (not e!102136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156179 (= res!73753 (validMask!0 (mask!7576 thiss!1248)))))

(assert (= (and start!15686 res!73755) b!156174))

(assert (= (and b!156174 res!73757) b!156179))

(assert (= (and b!156179 res!73753) b!156172))

(assert (= (and b!156172 res!73756) b!156171))

(assert (= (and b!156171 res!73754) b!156177))

(assert (= (and b!156178 condMapEmpty!5369) mapIsEmpty!5369))

(assert (= (and b!156178 (not condMapEmpty!5369)) mapNonEmpty!5369))

(get-info :version)

(assert (= (and mapNonEmpty!5369 ((_ is ValueCellFull!1232) mapValue!5369)) b!156173))

(assert (= (and b!156178 ((_ is ValueCellFull!1232) mapDefault!5369)) b!156176))

(assert (= b!156175 b!156178))

(assert (= start!15686 b!156175))

(declare-fun m!189319 () Bool)

(assert (=> mapNonEmpty!5369 m!189319))

(declare-fun m!189321 () Bool)

(assert (=> b!156177 m!189321))

(declare-fun m!189323 () Bool)

(assert (=> b!156179 m!189323))

(declare-fun m!189325 () Bool)

(assert (=> b!156175 m!189325))

(declare-fun m!189327 () Bool)

(assert (=> b!156175 m!189327))

(declare-fun m!189329 () Bool)

(assert (=> start!15686 m!189329))

(declare-fun m!189331 () Bool)

(assert (=> b!156171 m!189331))

(check-sat (not mapNonEmpty!5369) (not start!15686) (not b!156179) (not b!156175) (not b!156171) b_and!9737 (not b_next!3349) (not b!156177) tp_is_empty!3151)
(check-sat b_and!9737 (not b_next!3349))
