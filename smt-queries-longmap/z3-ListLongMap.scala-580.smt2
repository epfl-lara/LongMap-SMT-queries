; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15626 () Bool)

(assert start!15626)

(declare-fun b!155674 () Bool)

(declare-fun b_free!3289 () Bool)

(declare-fun b_next!3289 () Bool)

(assert (=> b!155674 (= b_free!3289 (not b_next!3289))))

(declare-fun tp!12391 () Bool)

(declare-fun b_and!9717 () Bool)

(assert (=> b!155674 (= tp!12391 b_and!9717)))

(declare-fun b!155672 () Bool)

(declare-fun e!101699 () Bool)

(assert (=> b!155672 (= e!101699 false)))

(declare-fun lt!81444 () Bool)

(declare-datatypes ((V!3769 0))(
  ( (V!3770 (val!1590 Int)) )
))
(declare-datatypes ((ValueCell!1202 0))(
  ( (ValueCellFull!1202 (v!3456 V!3769)) (EmptyCell!1202) )
))
(declare-datatypes ((array!5221 0))(
  ( (array!5222 (arr!2468 (Array (_ BitVec 32) (_ BitVec 64))) (size!2746 (_ BitVec 32))) )
))
(declare-datatypes ((array!5223 0))(
  ( (array!5224 (arr!2469 (Array (_ BitVec 32) ValueCell!1202)) (size!2747 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1312 0))(
  ( (LongMapFixedSize!1313 (defaultEntry!3098 Int) (mask!7527 (_ BitVec 32)) (extraKeys!2839 (_ BitVec 32)) (zeroValue!2941 V!3769) (minValue!2941 V!3769) (_size!705 (_ BitVec 32)) (_keys!4873 array!5221) (_values!3081 array!5223) (_vacant!705 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1312)

(declare-datatypes ((List!1813 0))(
  ( (Nil!1810) (Cons!1809 (h!2418 (_ BitVec 64)) (t!6607 List!1813)) )
))
(declare-fun arrayNoDuplicates!0 (array!5221 (_ BitVec 32) List!1813) Bool)

(assert (=> b!155672 (= lt!81444 (arrayNoDuplicates!0 (_keys!4873 thiss!1248) #b00000000000000000000000000000000 Nil!1810))))

(declare-fun mapNonEmpty!5279 () Bool)

(declare-fun mapRes!5279 () Bool)

(declare-fun tp!12392 () Bool)

(declare-fun e!101702 () Bool)

(assert (=> mapNonEmpty!5279 (= mapRes!5279 (and tp!12392 e!101702))))

(declare-fun mapValue!5279 () ValueCell!1202)

(declare-fun mapRest!5279 () (Array (_ BitVec 32) ValueCell!1202))

(declare-fun mapKey!5279 () (_ BitVec 32))

(assert (=> mapNonEmpty!5279 (= (arr!2469 (_values!3081 thiss!1248)) (store mapRest!5279 mapKey!5279 mapValue!5279))))

(declare-fun res!73539 () Bool)

(assert (=> start!15626 (=> (not res!73539) (not e!101699))))

(declare-fun valid!655 (LongMapFixedSize!1312) Bool)

(assert (=> start!15626 (= res!73539 (valid!655 thiss!1248))))

(assert (=> start!15626 e!101699))

(declare-fun e!101698 () Bool)

(assert (=> start!15626 e!101698))

(assert (=> start!15626 true))

(declare-fun b!155673 () Bool)

(declare-fun res!73538 () Bool)

(assert (=> b!155673 (=> (not res!73538) (not e!101699))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155673 (= res!73538 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!101701 () Bool)

(declare-fun tp_is_empty!3091 () Bool)

(declare-fun array_inv!1559 (array!5221) Bool)

(declare-fun array_inv!1560 (array!5223) Bool)

(assert (=> b!155674 (= e!101698 (and tp!12391 tp_is_empty!3091 (array_inv!1559 (_keys!4873 thiss!1248)) (array_inv!1560 (_values!3081 thiss!1248)) e!101701))))

(declare-fun b!155675 () Bool)

(declare-fun res!73536 () Bool)

(assert (=> b!155675 (=> (not res!73536) (not e!101699))))

(assert (=> b!155675 (= res!73536 (and (= (size!2747 (_values!3081 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7527 thiss!1248))) (= (size!2746 (_keys!4873 thiss!1248)) (size!2747 (_values!3081 thiss!1248))) (bvsge (mask!7527 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2839 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2839 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2839 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2839 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2839 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2839 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2839 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5279 () Bool)

(assert (=> mapIsEmpty!5279 mapRes!5279))

(declare-fun b!155676 () Bool)

(declare-fun e!101700 () Bool)

(assert (=> b!155676 (= e!101701 (and e!101700 mapRes!5279))))

(declare-fun condMapEmpty!5279 () Bool)

(declare-fun mapDefault!5279 () ValueCell!1202)

(assert (=> b!155676 (= condMapEmpty!5279 (= (arr!2469 (_values!3081 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1202)) mapDefault!5279)))))

(declare-fun b!155677 () Bool)

(assert (=> b!155677 (= e!101700 tp_is_empty!3091)))

(declare-fun b!155678 () Bool)

(declare-fun res!73540 () Bool)

(assert (=> b!155678 (=> (not res!73540) (not e!101699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5221 (_ BitVec 32)) Bool)

(assert (=> b!155678 (= res!73540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4873 thiss!1248) (mask!7527 thiss!1248)))))

(declare-fun b!155679 () Bool)

(assert (=> b!155679 (= e!101702 tp_is_empty!3091)))

(declare-fun b!155680 () Bool)

(declare-fun res!73537 () Bool)

(assert (=> b!155680 (=> (not res!73537) (not e!101699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155680 (= res!73537 (validMask!0 (mask!7527 thiss!1248)))))

(assert (= (and start!15626 res!73539) b!155673))

(assert (= (and b!155673 res!73538) b!155680))

(assert (= (and b!155680 res!73537) b!155675))

(assert (= (and b!155675 res!73536) b!155678))

(assert (= (and b!155678 res!73540) b!155672))

(assert (= (and b!155676 condMapEmpty!5279) mapIsEmpty!5279))

(assert (= (and b!155676 (not condMapEmpty!5279)) mapNonEmpty!5279))

(get-info :version)

(assert (= (and mapNonEmpty!5279 ((_ is ValueCellFull!1202) mapValue!5279)) b!155679))

(assert (= (and b!155676 ((_ is ValueCellFull!1202) mapDefault!5279)) b!155677))

(assert (= b!155674 b!155676))

(assert (= start!15626 b!155674))

(declare-fun m!189617 () Bool)

(assert (=> b!155672 m!189617))

(declare-fun m!189619 () Bool)

(assert (=> mapNonEmpty!5279 m!189619))

(declare-fun m!189621 () Bool)

(assert (=> start!15626 m!189621))

(declare-fun m!189623 () Bool)

(assert (=> b!155680 m!189623))

(declare-fun m!189625 () Bool)

(assert (=> b!155674 m!189625))

(declare-fun m!189627 () Bool)

(assert (=> b!155674 m!189627))

(declare-fun m!189629 () Bool)

(assert (=> b!155678 m!189629))

(check-sat (not b!155674) b_and!9717 (not mapNonEmpty!5279) (not b!155678) (not b!155680) (not start!15626) (not b!155672) tp_is_empty!3091 (not b_next!3289))
(check-sat b_and!9717 (not b_next!3289))
