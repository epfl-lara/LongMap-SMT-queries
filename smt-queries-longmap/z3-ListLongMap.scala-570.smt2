; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15564 () Bool)

(assert start!15564)

(declare-fun b!154846 () Bool)

(declare-fun b_free!3231 () Bool)

(declare-fun b_next!3231 () Bool)

(assert (=> b!154846 (= b_free!3231 (not b_next!3231))))

(declare-fun tp!12217 () Bool)

(declare-fun b_and!9645 () Bool)

(assert (=> b!154846 (= tp!12217 b_and!9645)))

(declare-fun b!154842 () Bool)

(declare-fun res!73080 () Bool)

(declare-fun e!101153 () Bool)

(assert (=> b!154842 (=> (not res!73080) (not e!101153))))

(declare-datatypes ((V!3691 0))(
  ( (V!3692 (val!1561 Int)) )
))
(declare-datatypes ((ValueCell!1173 0))(
  ( (ValueCellFull!1173 (v!3426 V!3691)) (EmptyCell!1173) )
))
(declare-datatypes ((array!5119 0))(
  ( (array!5120 (arr!2417 (Array (_ BitVec 32) (_ BitVec 64))) (size!2695 (_ BitVec 32))) )
))
(declare-datatypes ((array!5121 0))(
  ( (array!5122 (arr!2418 (Array (_ BitVec 32) ValueCell!1173)) (size!2696 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1254 0))(
  ( (LongMapFixedSize!1255 (defaultEntry!3069 Int) (mask!7478 (_ BitVec 32)) (extraKeys!2810 (_ BitVec 32)) (zeroValue!2912 V!3691) (minValue!2912 V!3691) (_size!676 (_ BitVec 32)) (_keys!4844 array!5119) (_values!3052 array!5121) (_vacant!676 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1254)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5119 (_ BitVec 32)) Bool)

(assert (=> b!154842 (= res!73080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4844 thiss!1248) (mask!7478 thiss!1248)))))

(declare-fun mapIsEmpty!5192 () Bool)

(declare-fun mapRes!5192 () Bool)

(assert (=> mapIsEmpty!5192 mapRes!5192))

(declare-fun b!154843 () Bool)

(declare-fun e!101155 () Bool)

(declare-fun e!101157 () Bool)

(assert (=> b!154843 (= e!101155 (and e!101157 mapRes!5192))))

(declare-fun condMapEmpty!5192 () Bool)

(declare-fun mapDefault!5192 () ValueCell!1173)

(assert (=> b!154843 (= condMapEmpty!5192 (= (arr!2418 (_values!3052 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1173)) mapDefault!5192)))))

(declare-fun res!73081 () Bool)

(assert (=> start!15564 (=> (not res!73081) (not e!101153))))

(declare-fun valid!621 (LongMapFixedSize!1254) Bool)

(assert (=> start!15564 (= res!73081 (valid!621 thiss!1248))))

(assert (=> start!15564 e!101153))

(declare-fun e!101156 () Bool)

(assert (=> start!15564 e!101156))

(assert (=> start!15564 true))

(declare-fun b!154844 () Bool)

(declare-fun res!73084 () Bool)

(assert (=> b!154844 (=> (not res!73084) (not e!101153))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154844 (= res!73084 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5192 () Bool)

(declare-fun tp!12218 () Bool)

(declare-fun e!101152 () Bool)

(assert (=> mapNonEmpty!5192 (= mapRes!5192 (and tp!12218 e!101152))))

(declare-fun mapKey!5192 () (_ BitVec 32))

(declare-fun mapRest!5192 () (Array (_ BitVec 32) ValueCell!1173))

(declare-fun mapValue!5192 () ValueCell!1173)

(assert (=> mapNonEmpty!5192 (= (arr!2418 (_values!3052 thiss!1248)) (store mapRest!5192 mapKey!5192 mapValue!5192))))

(declare-fun b!154845 () Bool)

(declare-fun res!73082 () Bool)

(assert (=> b!154845 (=> (not res!73082) (not e!101153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154845 (= res!73082 (validMask!0 (mask!7478 thiss!1248)))))

(declare-fun tp_is_empty!3033 () Bool)

(declare-fun array_inv!1527 (array!5119) Bool)

(declare-fun array_inv!1528 (array!5121) Bool)

(assert (=> b!154846 (= e!101156 (and tp!12217 tp_is_empty!3033 (array_inv!1527 (_keys!4844 thiss!1248)) (array_inv!1528 (_values!3052 thiss!1248)) e!101155))))

(declare-fun b!154847 () Bool)

(declare-fun res!73083 () Bool)

(assert (=> b!154847 (=> (not res!73083) (not e!101153))))

(assert (=> b!154847 (= res!73083 (and (= (size!2696 (_values!3052 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7478 thiss!1248))) (= (size!2695 (_keys!4844 thiss!1248)) (size!2696 (_values!3052 thiss!1248))) (bvsge (mask!7478 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2810 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2810 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2810 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2810 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2810 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2810 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2810 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!154848 () Bool)

(assert (=> b!154848 (= e!101152 tp_is_empty!3033)))

(declare-fun b!154849 () Bool)

(assert (=> b!154849 (= e!101157 tp_is_empty!3033)))

(declare-fun b!154850 () Bool)

(assert (=> b!154850 (= e!101153 false)))

(declare-fun lt!81298 () Bool)

(declare-datatypes ((List!1810 0))(
  ( (Nil!1807) (Cons!1806 (h!2415 (_ BitVec 64)) (t!6612 List!1810)) )
))
(declare-fun arrayNoDuplicates!0 (array!5119 (_ BitVec 32) List!1810) Bool)

(assert (=> b!154850 (= lt!81298 (arrayNoDuplicates!0 (_keys!4844 thiss!1248) #b00000000000000000000000000000000 Nil!1807))))

(assert (= (and start!15564 res!73081) b!154844))

(assert (= (and b!154844 res!73084) b!154845))

(assert (= (and b!154845 res!73082) b!154847))

(assert (= (and b!154847 res!73083) b!154842))

(assert (= (and b!154842 res!73080) b!154850))

(assert (= (and b!154843 condMapEmpty!5192) mapIsEmpty!5192))

(assert (= (and b!154843 (not condMapEmpty!5192)) mapNonEmpty!5192))

(get-info :version)

(assert (= (and mapNonEmpty!5192 ((_ is ValueCellFull!1173) mapValue!5192)) b!154848))

(assert (= (and b!154843 ((_ is ValueCellFull!1173) mapDefault!5192)) b!154849))

(assert (= b!154846 b!154843))

(assert (= start!15564 b!154846))

(declare-fun m!189029 () Bool)

(assert (=> start!15564 m!189029))

(declare-fun m!189031 () Bool)

(assert (=> mapNonEmpty!5192 m!189031))

(declare-fun m!189033 () Bool)

(assert (=> b!154842 m!189033))

(declare-fun m!189035 () Bool)

(assert (=> b!154845 m!189035))

(declare-fun m!189037 () Bool)

(assert (=> b!154846 m!189037))

(declare-fun m!189039 () Bool)

(assert (=> b!154846 m!189039))

(declare-fun m!189041 () Bool)

(assert (=> b!154850 m!189041))

(check-sat tp_is_empty!3033 (not b!154850) (not b!154845) (not mapNonEmpty!5192) (not b_next!3231) (not b!154846) b_and!9645 (not b!154842) (not start!15564))
(check-sat b_and!9645 (not b_next!3231))
