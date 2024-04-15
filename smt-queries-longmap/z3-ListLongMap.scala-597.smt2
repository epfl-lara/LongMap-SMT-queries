; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15728 () Bool)

(assert start!15728)

(declare-fun b!156741 () Bool)

(declare-fun b_free!3391 () Bool)

(declare-fun b_next!3391 () Bool)

(assert (=> b!156741 (= b_free!3391 (not b_next!3391))))

(declare-fun tp!12698 () Bool)

(declare-fun b_and!9779 () Bool)

(assert (=> b!156741 (= tp!12698 b_and!9779)))

(declare-fun b!156738 () Bool)

(declare-fun res!74070 () Bool)

(declare-fun e!102509 () Bool)

(assert (=> b!156738 (=> (not res!74070) (not e!102509))))

(declare-datatypes ((V!3905 0))(
  ( (V!3906 (val!1641 Int)) )
))
(declare-datatypes ((ValueCell!1253 0))(
  ( (ValueCellFull!1253 (v!3500 V!3905)) (EmptyCell!1253) )
))
(declare-datatypes ((array!5419 0))(
  ( (array!5420 (arr!2566 (Array (_ BitVec 32) (_ BitVec 64))) (size!2845 (_ BitVec 32))) )
))
(declare-datatypes ((array!5421 0))(
  ( (array!5422 (arr!2567 (Array (_ BitVec 32) ValueCell!1253)) (size!2846 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1414 0))(
  ( (LongMapFixedSize!1415 (defaultEntry!3149 Int) (mask!7611 (_ BitVec 32)) (extraKeys!2890 (_ BitVec 32)) (zeroValue!2992 V!3905) (minValue!2992 V!3905) (_size!756 (_ BitVec 32)) (_keys!4923 array!5419) (_values!3132 array!5421) (_vacant!756 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1414)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156738 (= res!74070 (validMask!0 (mask!7611 thiss!1248)))))

(declare-fun b!156739 () Bool)

(declare-fun res!74069 () Bool)

(assert (=> b!156739 (=> (not res!74069) (not e!102509))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156739 (= res!74069 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156740 () Bool)

(declare-fun res!74072 () Bool)

(assert (=> b!156740 (=> (not res!74072) (not e!102509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5419 (_ BitVec 32)) Bool)

(assert (=> b!156740 (= res!74072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4923 thiss!1248) (mask!7611 thiss!1248)))))

(declare-fun e!102513 () Bool)

(declare-fun e!102510 () Bool)

(declare-fun tp_is_empty!3193 () Bool)

(declare-fun array_inv!1655 (array!5419) Bool)

(declare-fun array_inv!1656 (array!5421) Bool)

(assert (=> b!156741 (= e!102510 (and tp!12698 tp_is_empty!3193 (array_inv!1655 (_keys!4923 thiss!1248)) (array_inv!1656 (_values!3132 thiss!1248)) e!102513))))

(declare-fun b!156742 () Bool)

(declare-fun e!102511 () Bool)

(assert (=> b!156742 (= e!102511 tp_is_empty!3193)))

(declare-fun mapNonEmpty!5432 () Bool)

(declare-fun mapRes!5432 () Bool)

(declare-fun tp!12697 () Bool)

(assert (=> mapNonEmpty!5432 (= mapRes!5432 (and tp!12697 e!102511))))

(declare-fun mapKey!5432 () (_ BitVec 32))

(declare-fun mapValue!5432 () ValueCell!1253)

(declare-fun mapRest!5432 () (Array (_ BitVec 32) ValueCell!1253))

(assert (=> mapNonEmpty!5432 (= (arr!2567 (_values!3132 thiss!1248)) (store mapRest!5432 mapKey!5432 mapValue!5432))))

(declare-fun res!74068 () Bool)

(assert (=> start!15728 (=> (not res!74068) (not e!102509))))

(declare-fun valid!682 (LongMapFixedSize!1414) Bool)

(assert (=> start!15728 (= res!74068 (valid!682 thiss!1248))))

(assert (=> start!15728 e!102509))

(assert (=> start!15728 e!102510))

(assert (=> start!15728 true))

(declare-fun b!156743 () Bool)

(declare-fun e!102514 () Bool)

(assert (=> b!156743 (= e!102513 (and e!102514 mapRes!5432))))

(declare-fun condMapEmpty!5432 () Bool)

(declare-fun mapDefault!5432 () ValueCell!1253)

(assert (=> b!156743 (= condMapEmpty!5432 (= (arr!2567 (_values!3132 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1253)) mapDefault!5432)))))

(declare-fun b!156744 () Bool)

(declare-fun res!74071 () Bool)

(assert (=> b!156744 (=> (not res!74071) (not e!102509))))

(assert (=> b!156744 (= res!74071 (and (= (size!2846 (_values!3132 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7611 thiss!1248))) (= (size!2845 (_keys!4923 thiss!1248)) (size!2846 (_values!3132 thiss!1248))) (bvsge (mask!7611 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2890 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2890 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2890 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2890 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2890 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2890 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2890 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156745 () Bool)

(assert (=> b!156745 (= e!102514 tp_is_empty!3193)))

(declare-fun mapIsEmpty!5432 () Bool)

(assert (=> mapIsEmpty!5432 mapRes!5432))

(declare-fun b!156746 () Bool)

(assert (=> b!156746 (= e!102509 false)))

(declare-fun lt!81420 () Bool)

(declare-datatypes ((List!1865 0))(
  ( (Nil!1862) (Cons!1861 (h!2470 (_ BitVec 64)) (t!6658 List!1865)) )
))
(declare-fun arrayNoDuplicates!0 (array!5419 (_ BitVec 32) List!1865) Bool)

(assert (=> b!156746 (= lt!81420 (arrayNoDuplicates!0 (_keys!4923 thiss!1248) #b00000000000000000000000000000000 Nil!1862))))

(assert (= (and start!15728 res!74068) b!156739))

(assert (= (and b!156739 res!74069) b!156738))

(assert (= (and b!156738 res!74070) b!156744))

(assert (= (and b!156744 res!74071) b!156740))

(assert (= (and b!156740 res!74072) b!156746))

(assert (= (and b!156743 condMapEmpty!5432) mapIsEmpty!5432))

(assert (= (and b!156743 (not condMapEmpty!5432)) mapNonEmpty!5432))

(get-info :version)

(assert (= (and mapNonEmpty!5432 ((_ is ValueCellFull!1253) mapValue!5432)) b!156742))

(assert (= (and b!156743 ((_ is ValueCellFull!1253) mapDefault!5432)) b!156745))

(assert (= b!156741 b!156743))

(assert (= start!15728 b!156741))

(declare-fun m!189613 () Bool)

(assert (=> b!156741 m!189613))

(declare-fun m!189615 () Bool)

(assert (=> b!156741 m!189615))

(declare-fun m!189617 () Bool)

(assert (=> mapNonEmpty!5432 m!189617))

(declare-fun m!189619 () Bool)

(assert (=> b!156746 m!189619))

(declare-fun m!189621 () Bool)

(assert (=> b!156740 m!189621))

(declare-fun m!189623 () Bool)

(assert (=> b!156738 m!189623))

(declare-fun m!189625 () Bool)

(assert (=> start!15728 m!189625))

(check-sat (not start!15728) (not b!156740) (not mapNonEmpty!5432) (not b!156746) (not b_next!3391) (not b!156741) b_and!9779 tp_is_empty!3193 (not b!156738))
(check-sat b_and!9779 (not b_next!3391))
