; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16270 () Bool)

(assert start!16270)

(declare-fun b!162135 () Bool)

(declare-fun b_free!3727 () Bool)

(declare-fun b_next!3727 () Bool)

(assert (=> b!162135 (= b_free!3727 (not b_next!3727))))

(declare-fun tp!13751 () Bool)

(declare-fun b_and!10115 () Bool)

(assert (=> b!162135 (= tp!13751 b_and!10115)))

(declare-fun b!162134 () Bool)

(declare-fun e!106197 () Bool)

(declare-fun tp_is_empty!3529 () Bool)

(assert (=> b!162134 (= e!106197 tp_is_empty!3529)))

(declare-fun e!106198 () Bool)

(declare-datatypes ((V!4353 0))(
  ( (V!4354 (val!1809 Int)) )
))
(declare-datatypes ((ValueCell!1421 0))(
  ( (ValueCellFull!1421 (v!3668 V!4353)) (EmptyCell!1421) )
))
(declare-datatypes ((array!6117 0))(
  ( (array!6118 (arr!2902 (Array (_ BitVec 32) (_ BitVec 64))) (size!3187 (_ BitVec 32))) )
))
(declare-datatypes ((array!6119 0))(
  ( (array!6120 (arr!2903 (Array (_ BitVec 32) ValueCell!1421)) (size!3188 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1750 0))(
  ( (LongMapFixedSize!1751 (defaultEntry!3317 Int) (mask!7934 (_ BitVec 32)) (extraKeys!3058 (_ BitVec 32)) (zeroValue!3160 V!4353) (minValue!3160 V!4353) (_size!924 (_ BitVec 32)) (_keys!5117 array!6117) (_values!3300 array!6119) (_vacant!924 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1750)

(declare-fun e!106201 () Bool)

(declare-fun array_inv!1873 (array!6117) Bool)

(declare-fun array_inv!1874 (array!6119) Bool)

(assert (=> b!162135 (= e!106198 (and tp!13751 tp_is_empty!3529 (array_inv!1873 (_keys!5117 thiss!1248)) (array_inv!1874 (_values!3300 thiss!1248)) e!106201))))

(declare-fun b!162136 () Bool)

(declare-fun res!76766 () Bool)

(declare-fun e!106199 () Bool)

(assert (=> b!162136 (=> (not res!76766) (not e!106199))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162136 (= res!76766 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162137 () Bool)

(declare-datatypes ((SeekEntryResult!385 0))(
  ( (MissingZero!385 (index!3708 (_ BitVec 32))) (Found!385 (index!3709 (_ BitVec 32))) (Intermediate!385 (undefined!1197 Bool) (index!3710 (_ BitVec 32)) (x!17952 (_ BitVec 32))) (Undefined!385) (MissingVacant!385 (index!3711 (_ BitVec 32))) )
))
(declare-fun lt!82230 () SeekEntryResult!385)

(get-info :version)

(assert (=> b!162137 (= e!106199 (and (not ((_ is Undefined!385) lt!82230)) (not ((_ is MissingVacant!385) lt!82230)) ((_ is MissingZero!385) lt!82230) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6117 (_ BitVec 32)) SeekEntryResult!385)

(assert (=> b!162137 (= lt!82230 (seekEntryOrOpen!0 key!828 (_keys!5117 thiss!1248) (mask!7934 thiss!1248)))))

(declare-fun b!162139 () Bool)

(declare-fun e!106196 () Bool)

(declare-fun mapRes!5981 () Bool)

(assert (=> b!162139 (= e!106201 (and e!106196 mapRes!5981))))

(declare-fun condMapEmpty!5981 () Bool)

(declare-fun mapDefault!5981 () ValueCell!1421)

(assert (=> b!162139 (= condMapEmpty!5981 (= (arr!2903 (_values!3300 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1421)) mapDefault!5981)))))

(declare-fun mapIsEmpty!5981 () Bool)

(assert (=> mapIsEmpty!5981 mapRes!5981))

(declare-fun mapNonEmpty!5981 () Bool)

(declare-fun tp!13750 () Bool)

(assert (=> mapNonEmpty!5981 (= mapRes!5981 (and tp!13750 e!106197))))

(declare-fun mapValue!5981 () ValueCell!1421)

(declare-fun mapRest!5981 () (Array (_ BitVec 32) ValueCell!1421))

(declare-fun mapKey!5981 () (_ BitVec 32))

(assert (=> mapNonEmpty!5981 (= (arr!2903 (_values!3300 thiss!1248)) (store mapRest!5981 mapKey!5981 mapValue!5981))))

(declare-fun res!76767 () Bool)

(assert (=> start!16270 (=> (not res!76767) (not e!106199))))

(declare-fun valid!793 (LongMapFixedSize!1750) Bool)

(assert (=> start!16270 (= res!76767 (valid!793 thiss!1248))))

(assert (=> start!16270 e!106199))

(assert (=> start!16270 e!106198))

(assert (=> start!16270 true))

(declare-fun b!162138 () Bool)

(assert (=> b!162138 (= e!106196 tp_is_empty!3529)))

(assert (= (and start!16270 res!76767) b!162136))

(assert (= (and b!162136 res!76766) b!162137))

(assert (= (and b!162139 condMapEmpty!5981) mapIsEmpty!5981))

(assert (= (and b!162139 (not condMapEmpty!5981)) mapNonEmpty!5981))

(assert (= (and mapNonEmpty!5981 ((_ is ValueCellFull!1421) mapValue!5981)) b!162134))

(assert (= (and b!162139 ((_ is ValueCellFull!1421) mapDefault!5981)) b!162138))

(assert (= b!162135 b!162139))

(assert (= start!16270 b!162135))

(declare-fun m!192841 () Bool)

(assert (=> b!162135 m!192841))

(declare-fun m!192843 () Bool)

(assert (=> b!162135 m!192843))

(declare-fun m!192845 () Bool)

(assert (=> b!162137 m!192845))

(declare-fun m!192847 () Bool)

(assert (=> mapNonEmpty!5981 m!192847))

(declare-fun m!192849 () Bool)

(assert (=> start!16270 m!192849))

(check-sat (not b!162135) (not b_next!3727) (not b!162137) b_and!10115 tp_is_empty!3529 (not mapNonEmpty!5981) (not start!16270))
(check-sat b_and!10115 (not b_next!3727))
