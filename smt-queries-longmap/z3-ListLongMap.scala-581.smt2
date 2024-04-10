; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15630 () Bool)

(assert start!15630)

(declare-fun b!155735 () Bool)

(declare-fun b_free!3297 () Bool)

(declare-fun b_next!3297 () Bool)

(assert (=> b!155735 (= b_free!3297 (not b_next!3297))))

(declare-fun tp!12416 () Bool)

(declare-fun b_and!9711 () Bool)

(assert (=> b!155735 (= tp!12416 b_and!9711)))

(declare-fun b!155733 () Bool)

(declare-fun e!101747 () Bool)

(declare-fun tp_is_empty!3099 () Bool)

(assert (=> b!155733 (= e!101747 tp_is_empty!3099)))

(declare-fun b!155734 () Bool)

(declare-fun res!73576 () Bool)

(declare-fun e!101746 () Bool)

(assert (=> b!155734 (=> (not res!73576) (not e!101746))))

(declare-datatypes ((V!3779 0))(
  ( (V!3780 (val!1594 Int)) )
))
(declare-datatypes ((ValueCell!1206 0))(
  ( (ValueCellFull!1206 (v!3459 V!3779)) (EmptyCell!1206) )
))
(declare-datatypes ((array!5251 0))(
  ( (array!5252 (arr!2483 (Array (_ BitVec 32) (_ BitVec 64))) (size!2761 (_ BitVec 32))) )
))
(declare-datatypes ((array!5253 0))(
  ( (array!5254 (arr!2484 (Array (_ BitVec 32) ValueCell!1206)) (size!2762 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1320 0))(
  ( (LongMapFixedSize!1321 (defaultEntry!3102 Int) (mask!7533 (_ BitVec 32)) (extraKeys!2843 (_ BitVec 32)) (zeroValue!2945 V!3779) (minValue!2945 V!3779) (_size!709 (_ BitVec 32)) (_keys!4877 array!5251) (_values!3085 array!5253) (_vacant!709 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1320)

(assert (=> b!155734 (= res!73576 (and (= (size!2762 (_values!3085 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7533 thiss!1248))) (= (size!2761 (_keys!4877 thiss!1248)) (size!2762 (_values!3085 thiss!1248))) (bvsge (mask!7533 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2843 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2843 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2843 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2843 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2843 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2843 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2843 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun e!101751 () Bool)

(declare-fun e!101749 () Bool)

(declare-fun array_inv!1569 (array!5251) Bool)

(declare-fun array_inv!1570 (array!5253) Bool)

(assert (=> b!155735 (= e!101751 (and tp!12416 tp_is_empty!3099 (array_inv!1569 (_keys!4877 thiss!1248)) (array_inv!1570 (_values!3085 thiss!1248)) e!101749))))

(declare-fun b!155736 () Bool)

(declare-fun e!101750 () Bool)

(assert (=> b!155736 (= e!101750 tp_is_empty!3099)))

(declare-fun b!155737 () Bool)

(declare-fun res!73579 () Bool)

(assert (=> b!155737 (=> (not res!73579) (not e!101746))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155737 (= res!73579 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5291 () Bool)

(declare-fun mapRes!5291 () Bool)

(assert (=> mapIsEmpty!5291 mapRes!5291))

(declare-fun b!155738 () Bool)

(declare-fun res!73575 () Bool)

(assert (=> b!155738 (=> (not res!73575) (not e!101746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155738 (= res!73575 (validMask!0 (mask!7533 thiss!1248)))))

(declare-fun res!73577 () Bool)

(assert (=> start!15630 (=> (not res!73577) (not e!101746))))

(declare-fun valid!645 (LongMapFixedSize!1320) Bool)

(assert (=> start!15630 (= res!73577 (valid!645 thiss!1248))))

(assert (=> start!15630 e!101746))

(assert (=> start!15630 e!101751))

(assert (=> start!15630 true))

(declare-fun b!155739 () Bool)

(assert (=> b!155739 (= e!101746 false)))

(declare-fun lt!81397 () Bool)

(declare-datatypes ((List!1832 0))(
  ( (Nil!1829) (Cons!1828 (h!2437 (_ BitVec 64)) (t!6634 List!1832)) )
))
(declare-fun arrayNoDuplicates!0 (array!5251 (_ BitVec 32) List!1832) Bool)

(assert (=> b!155739 (= lt!81397 (arrayNoDuplicates!0 (_keys!4877 thiss!1248) #b00000000000000000000000000000000 Nil!1829))))

(declare-fun b!155740 () Bool)

(assert (=> b!155740 (= e!101749 (and e!101750 mapRes!5291))))

(declare-fun condMapEmpty!5291 () Bool)

(declare-fun mapDefault!5291 () ValueCell!1206)

(assert (=> b!155740 (= condMapEmpty!5291 (= (arr!2484 (_values!3085 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1206)) mapDefault!5291)))))

(declare-fun mapNonEmpty!5291 () Bool)

(declare-fun tp!12415 () Bool)

(assert (=> mapNonEmpty!5291 (= mapRes!5291 (and tp!12415 e!101747))))

(declare-fun mapRest!5291 () (Array (_ BitVec 32) ValueCell!1206))

(declare-fun mapKey!5291 () (_ BitVec 32))

(declare-fun mapValue!5291 () ValueCell!1206)

(assert (=> mapNonEmpty!5291 (= (arr!2484 (_values!3085 thiss!1248)) (store mapRest!5291 mapKey!5291 mapValue!5291))))

(declare-fun b!155741 () Bool)

(declare-fun res!73578 () Bool)

(assert (=> b!155741 (=> (not res!73578) (not e!101746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5251 (_ BitVec 32)) Bool)

(assert (=> b!155741 (= res!73578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4877 thiss!1248) (mask!7533 thiss!1248)))))

(assert (= (and start!15630 res!73577) b!155737))

(assert (= (and b!155737 res!73579) b!155738))

(assert (= (and b!155738 res!73575) b!155734))

(assert (= (and b!155734 res!73576) b!155741))

(assert (= (and b!155741 res!73578) b!155739))

(assert (= (and b!155740 condMapEmpty!5291) mapIsEmpty!5291))

(assert (= (and b!155740 (not condMapEmpty!5291)) mapNonEmpty!5291))

(get-info :version)

(assert (= (and mapNonEmpty!5291 ((_ is ValueCellFull!1206) mapValue!5291)) b!155733))

(assert (= (and b!155740 ((_ is ValueCellFull!1206) mapDefault!5291)) b!155736))

(assert (= b!155735 b!155740))

(assert (= start!15630 b!155735))

(declare-fun m!189491 () Bool)

(assert (=> b!155741 m!189491))

(declare-fun m!189493 () Bool)

(assert (=> b!155738 m!189493))

(declare-fun m!189495 () Bool)

(assert (=> mapNonEmpty!5291 m!189495))

(declare-fun m!189497 () Bool)

(assert (=> start!15630 m!189497))

(declare-fun m!189499 () Bool)

(assert (=> b!155739 m!189499))

(declare-fun m!189501 () Bool)

(assert (=> b!155735 m!189501))

(declare-fun m!189503 () Bool)

(assert (=> b!155735 m!189503))

(check-sat (not b_next!3297) (not start!15630) (not b!155735) b_and!9711 (not b!155738) tp_is_empty!3099 (not b!155739) (not mapNonEmpty!5291) (not b!155741))
(check-sat b_and!9711 (not b_next!3297))
