; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15632 () Bool)

(assert start!15632)

(declare-fun b!155560 () Bool)

(declare-fun b_free!3295 () Bool)

(declare-fun b_next!3295 () Bool)

(assert (=> b!155560 (= b_free!3295 (not b_next!3295))))

(declare-fun tp!12410 () Bool)

(declare-fun b_and!9683 () Bool)

(assert (=> b!155560 (= tp!12410 b_and!9683)))

(declare-fun b!155559 () Bool)

(declare-fun e!101631 () Bool)

(declare-fun tp_is_empty!3097 () Bool)

(assert (=> b!155559 (= e!101631 tp_is_empty!3097)))

(declare-fun mapNonEmpty!5288 () Bool)

(declare-fun mapRes!5288 () Bool)

(declare-fun tp!12409 () Bool)

(declare-fun e!101632 () Bool)

(assert (=> mapNonEmpty!5288 (= mapRes!5288 (and tp!12409 e!101632))))

(declare-datatypes ((V!3777 0))(
  ( (V!3778 (val!1593 Int)) )
))
(declare-datatypes ((ValueCell!1205 0))(
  ( (ValueCellFull!1205 (v!3452 V!3777)) (EmptyCell!1205) )
))
(declare-fun mapValue!5288 () ValueCell!1205)

(declare-fun mapKey!5288 () (_ BitVec 32))

(declare-datatypes ((array!5227 0))(
  ( (array!5228 (arr!2470 (Array (_ BitVec 32) (_ BitVec 64))) (size!2749 (_ BitVec 32))) )
))
(declare-datatypes ((array!5229 0))(
  ( (array!5230 (arr!2471 (Array (_ BitVec 32) ValueCell!1205)) (size!2750 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1318 0))(
  ( (LongMapFixedSize!1319 (defaultEntry!3101 Int) (mask!7531 (_ BitVec 32)) (extraKeys!2842 (_ BitVec 32)) (zeroValue!2944 V!3777) (minValue!2944 V!3777) (_size!708 (_ BitVec 32)) (_keys!4875 array!5227) (_values!3084 array!5229) (_vacant!708 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1318)

(declare-fun mapRest!5288 () (Array (_ BitVec 32) ValueCell!1205))

(assert (=> mapNonEmpty!5288 (= (arr!2471 (_values!3084 thiss!1248)) (store mapRest!5288 mapKey!5288 mapValue!5288))))

(declare-fun e!101627 () Bool)

(declare-fun e!101629 () Bool)

(declare-fun array_inv!1583 (array!5227) Bool)

(declare-fun array_inv!1584 (array!5229) Bool)

(assert (=> b!155560 (= e!101627 (and tp!12410 tp_is_empty!3097 (array_inv!1583 (_keys!4875 thiss!1248)) (array_inv!1584 (_values!3084 thiss!1248)) e!101629))))

(declare-fun mapIsEmpty!5288 () Bool)

(assert (=> mapIsEmpty!5288 mapRes!5288))

(declare-fun b!155561 () Bool)

(declare-fun res!73467 () Bool)

(declare-fun e!101628 () Bool)

(assert (=> b!155561 (=> (not res!73467) (not e!101628))))

(assert (=> b!155561 (= res!73467 (and (= (size!2750 (_values!3084 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7531 thiss!1248))) (= (size!2749 (_keys!4875 thiss!1248)) (size!2750 (_values!3084 thiss!1248))) (bvsge (mask!7531 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2842 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2842 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2842 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2842 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2842 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2842 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2842 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155562 () Bool)

(declare-fun res!73466 () Bool)

(assert (=> b!155562 (=> (not res!73466) (not e!101628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155562 (= res!73466 (validMask!0 (mask!7531 thiss!1248)))))

(declare-fun b!155563 () Bool)

(assert (=> b!155563 (= e!101629 (and e!101631 mapRes!5288))))

(declare-fun condMapEmpty!5288 () Bool)

(declare-fun mapDefault!5288 () ValueCell!1205)

(assert (=> b!155563 (= condMapEmpty!5288 (= (arr!2471 (_values!3084 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1205)) mapDefault!5288)))))

(declare-fun b!155564 () Bool)

(assert (=> b!155564 (= e!101632 tp_is_empty!3097)))

(declare-fun res!73469 () Bool)

(assert (=> start!15632 (=> (not res!73469) (not e!101628))))

(declare-fun valid!647 (LongMapFixedSize!1318) Bool)

(assert (=> start!15632 (= res!73469 (valid!647 thiss!1248))))

(assert (=> start!15632 e!101628))

(assert (=> start!15632 e!101627))

(assert (=> start!15632 true))

(declare-fun b!155565 () Bool)

(assert (=> b!155565 (= e!101628 false)))

(declare-fun lt!81213 () Bool)

(declare-datatypes ((List!1833 0))(
  ( (Nil!1830) (Cons!1829 (h!2438 (_ BitVec 64)) (t!6626 List!1833)) )
))
(declare-fun arrayNoDuplicates!0 (array!5227 (_ BitVec 32) List!1833) Bool)

(assert (=> b!155565 (= lt!81213 (arrayNoDuplicates!0 (_keys!4875 thiss!1248) #b00000000000000000000000000000000 Nil!1830))))

(declare-fun b!155566 () Bool)

(declare-fun res!73468 () Bool)

(assert (=> b!155566 (=> (not res!73468) (not e!101628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5227 (_ BitVec 32)) Bool)

(assert (=> b!155566 (= res!73468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4875 thiss!1248) (mask!7531 thiss!1248)))))

(declare-fun b!155567 () Bool)

(declare-fun res!73465 () Bool)

(assert (=> b!155567 (=> (not res!73465) (not e!101628))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155567 (= res!73465 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!15632 res!73469) b!155567))

(assert (= (and b!155567 res!73465) b!155562))

(assert (= (and b!155562 res!73466) b!155561))

(assert (= (and b!155561 res!73467) b!155566))

(assert (= (and b!155566 res!73468) b!155565))

(assert (= (and b!155563 condMapEmpty!5288) mapIsEmpty!5288))

(assert (= (and b!155563 (not condMapEmpty!5288)) mapNonEmpty!5288))

(get-info :version)

(assert (= (and mapNonEmpty!5288 ((_ is ValueCellFull!1205) mapValue!5288)) b!155564))

(assert (= (and b!155563 ((_ is ValueCellFull!1205) mapDefault!5288)) b!155559))

(assert (= b!155560 b!155563))

(assert (= start!15632 b!155560))

(declare-fun m!188857 () Bool)

(assert (=> b!155560 m!188857))

(declare-fun m!188859 () Bool)

(assert (=> b!155560 m!188859))

(declare-fun m!188861 () Bool)

(assert (=> start!15632 m!188861))

(declare-fun m!188863 () Bool)

(assert (=> b!155562 m!188863))

(declare-fun m!188865 () Bool)

(assert (=> b!155565 m!188865))

(declare-fun m!188867 () Bool)

(assert (=> mapNonEmpty!5288 m!188867))

(declare-fun m!188869 () Bool)

(assert (=> b!155566 m!188869))

(check-sat (not b!155565) (not b_next!3295) tp_is_empty!3097 (not mapNonEmpty!5288) b_and!9683 (not start!15632) (not b!155560) (not b!155562) (not b!155566))
(check-sat b_and!9683 (not b_next!3295))
