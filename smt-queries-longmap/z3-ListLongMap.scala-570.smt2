; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15566 () Bool)

(assert start!15566)

(declare-fun b!154863 () Bool)

(declare-fun b_free!3229 () Bool)

(declare-fun b_next!3229 () Bool)

(assert (=> b!154863 (= b_free!3229 (not b_next!3229))))

(declare-fun tp!12212 () Bool)

(declare-fun b_and!9657 () Bool)

(assert (=> b!154863 (= tp!12212 b_and!9657)))

(declare-fun b!154862 () Bool)

(declare-fun res!73088 () Bool)

(declare-fun e!101162 () Bool)

(assert (=> b!154862 (=> (not res!73088) (not e!101162))))

(declare-datatypes ((V!3689 0))(
  ( (V!3690 (val!1560 Int)) )
))
(declare-datatypes ((ValueCell!1172 0))(
  ( (ValueCellFull!1172 (v!3426 V!3689)) (EmptyCell!1172) )
))
(declare-datatypes ((array!5101 0))(
  ( (array!5102 (arr!2408 (Array (_ BitVec 32) (_ BitVec 64))) (size!2686 (_ BitVec 32))) )
))
(declare-datatypes ((array!5103 0))(
  ( (array!5104 (arr!2409 (Array (_ BitVec 32) ValueCell!1172)) (size!2687 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1252 0))(
  ( (LongMapFixedSize!1253 (defaultEntry!3068 Int) (mask!7477 (_ BitVec 32)) (extraKeys!2809 (_ BitVec 32)) (zeroValue!2911 V!3689) (minValue!2911 V!3689) (_size!675 (_ BitVec 32)) (_keys!4843 array!5101) (_values!3051 array!5103) (_vacant!675 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1252)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5101 (_ BitVec 32)) Bool)

(assert (=> b!154862 (= res!73088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4843 thiss!1248) (mask!7477 thiss!1248)))))

(declare-fun res!73090 () Bool)

(assert (=> start!15566 (=> (not res!73090) (not e!101162))))

(declare-fun valid!635 (LongMapFixedSize!1252) Bool)

(assert (=> start!15566 (= res!73090 (valid!635 thiss!1248))))

(assert (=> start!15566 e!101162))

(declare-fun e!101159 () Bool)

(assert (=> start!15566 e!101159))

(assert (=> start!15566 true))

(declare-fun mapNonEmpty!5189 () Bool)

(declare-fun mapRes!5189 () Bool)

(declare-fun tp!12211 () Bool)

(declare-fun e!101160 () Bool)

(assert (=> mapNonEmpty!5189 (= mapRes!5189 (and tp!12211 e!101160))))

(declare-fun mapValue!5189 () ValueCell!1172)

(declare-fun mapRest!5189 () (Array (_ BitVec 32) ValueCell!1172))

(declare-fun mapKey!5189 () (_ BitVec 32))

(assert (=> mapNonEmpty!5189 (= (arr!2409 (_values!3051 thiss!1248)) (store mapRest!5189 mapKey!5189 mapValue!5189))))

(declare-fun tp_is_empty!3031 () Bool)

(declare-fun e!101161 () Bool)

(declare-fun array_inv!1519 (array!5101) Bool)

(declare-fun array_inv!1520 (array!5103) Bool)

(assert (=> b!154863 (= e!101159 (and tp!12212 tp_is_empty!3031 (array_inv!1519 (_keys!4843 thiss!1248)) (array_inv!1520 (_values!3051 thiss!1248)) e!101161))))

(declare-fun b!154864 () Bool)

(declare-fun e!101163 () Bool)

(assert (=> b!154864 (= e!101163 tp_is_empty!3031)))

(declare-fun b!154865 () Bool)

(declare-fun res!73087 () Bool)

(assert (=> b!154865 (=> (not res!73087) (not e!101162))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154865 (= res!73087 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5189 () Bool)

(assert (=> mapIsEmpty!5189 mapRes!5189))

(declare-fun b!154866 () Bool)

(assert (=> b!154866 (= e!101160 tp_is_empty!3031)))

(declare-fun b!154867 () Bool)

(assert (=> b!154867 (= e!101161 (and e!101163 mapRes!5189))))

(declare-fun condMapEmpty!5189 () Bool)

(declare-fun mapDefault!5189 () ValueCell!1172)

(assert (=> b!154867 (= condMapEmpty!5189 (= (arr!2409 (_values!3051 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1172)) mapDefault!5189)))))

(declare-fun b!154868 () Bool)

(declare-fun res!73089 () Bool)

(assert (=> b!154868 (=> (not res!73089) (not e!101162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154868 (= res!73089 (validMask!0 (mask!7477 thiss!1248)))))

(declare-fun b!154869 () Bool)

(assert (=> b!154869 (= e!101162 false)))

(declare-fun lt!81354 () Bool)

(declare-datatypes ((List!1791 0))(
  ( (Nil!1788) (Cons!1787 (h!2396 (_ BitVec 64)) (t!6585 List!1791)) )
))
(declare-fun arrayNoDuplicates!0 (array!5101 (_ BitVec 32) List!1791) Bool)

(assert (=> b!154869 (= lt!81354 (arrayNoDuplicates!0 (_keys!4843 thiss!1248) #b00000000000000000000000000000000 Nil!1788))))

(declare-fun b!154870 () Bool)

(declare-fun res!73086 () Bool)

(assert (=> b!154870 (=> (not res!73086) (not e!101162))))

(assert (=> b!154870 (= res!73086 (and (= (size!2687 (_values!3051 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7477 thiss!1248))) (= (size!2686 (_keys!4843 thiss!1248)) (size!2687 (_values!3051 thiss!1248))) (bvsge (mask!7477 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2809 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2809 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2809 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2809 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!15566 res!73090) b!154865))

(assert (= (and b!154865 res!73087) b!154868))

(assert (= (and b!154868 res!73089) b!154870))

(assert (= (and b!154870 res!73086) b!154862))

(assert (= (and b!154862 res!73088) b!154869))

(assert (= (and b!154867 condMapEmpty!5189) mapIsEmpty!5189))

(assert (= (and b!154867 (not condMapEmpty!5189)) mapNonEmpty!5189))

(get-info :version)

(assert (= (and mapNonEmpty!5189 ((_ is ValueCellFull!1172) mapValue!5189)) b!154866))

(assert (= (and b!154867 ((_ is ValueCellFull!1172) mapDefault!5189)) b!154864))

(assert (= b!154863 b!154867))

(assert (= start!15566 b!154863))

(declare-fun m!189197 () Bool)

(assert (=> b!154863 m!189197))

(declare-fun m!189199 () Bool)

(assert (=> b!154863 m!189199))

(declare-fun m!189201 () Bool)

(assert (=> b!154868 m!189201))

(declare-fun m!189203 () Bool)

(assert (=> b!154862 m!189203))

(declare-fun m!189205 () Bool)

(assert (=> mapNonEmpty!5189 m!189205))

(declare-fun m!189207 () Bool)

(assert (=> start!15566 m!189207))

(declare-fun m!189209 () Bool)

(assert (=> b!154869 m!189209))

(check-sat (not b_next!3229) (not mapNonEmpty!5189) tp_is_empty!3031 (not b!154863) (not b!154862) (not start!15566) b_and!9657 (not b!154869) (not b!154868))
(check-sat b_and!9657 (not b_next!3229))
