; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16958 () Bool)

(assert start!16958)

(declare-fun b!170297 () Bool)

(declare-fun b_free!4201 () Bool)

(declare-fun b_next!4201 () Bool)

(assert (=> b!170297 (= b_free!4201 (not b_next!4201))))

(declare-fun tp!15226 () Bool)

(declare-fun b_and!10589 () Bool)

(assert (=> b!170297 (= tp!15226 b_and!10589)))

(declare-fun mapNonEmpty!6746 () Bool)

(declare-fun mapRes!6746 () Bool)

(declare-fun tp!15227 () Bool)

(declare-fun e!112369 () Bool)

(assert (=> mapNonEmpty!6746 (= mapRes!6746 (and tp!15227 e!112369))))

(declare-datatypes ((V!4945 0))(
  ( (V!4946 (val!2031 Int)) )
))
(declare-datatypes ((ValueCell!1643 0))(
  ( (ValueCellFull!1643 (v!3890 V!4945)) (EmptyCell!1643) )
))
(declare-fun mapValue!6746 () ValueCell!1643)

(declare-fun mapKey!6746 () (_ BitVec 32))

(declare-datatypes ((array!7035 0))(
  ( (array!7036 (arr!3346 (Array (_ BitVec 32) (_ BitVec 64))) (size!3640 (_ BitVec 32))) )
))
(declare-datatypes ((array!7037 0))(
  ( (array!7038 (arr!3347 (Array (_ BitVec 32) ValueCell!1643)) (size!3641 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2194 0))(
  ( (LongMapFixedSize!2195 (defaultEntry!3539 Int) (mask!8352 (_ BitVec 32)) (extraKeys!3280 (_ BitVec 32)) (zeroValue!3382 V!4945) (minValue!3382 V!4945) (_size!1146 (_ BitVec 32)) (_keys!5368 array!7035) (_values!3522 array!7037) (_vacant!1146 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2194)

(declare-fun mapRest!6746 () (Array (_ BitVec 32) ValueCell!1643))

(assert (=> mapNonEmpty!6746 (= (arr!3347 (_values!3522 thiss!1248)) (store mapRest!6746 mapKey!6746 mapValue!6746))))

(declare-fun mapIsEmpty!6746 () Bool)

(assert (=> mapIsEmpty!6746 mapRes!6746))

(declare-fun b!170296 () Bool)

(declare-fun res!80931 () Bool)

(declare-fun e!112368 () Bool)

(assert (=> b!170296 (=> (not res!80931) (not e!112368))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170296 (= res!80931 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170298 () Bool)

(declare-fun e!112364 () Bool)

(declare-fun e!112366 () Bool)

(assert (=> b!170298 (= e!112364 (and e!112366 mapRes!6746))))

(declare-fun condMapEmpty!6746 () Bool)

(declare-fun mapDefault!6746 () ValueCell!1643)

(assert (=> b!170298 (= condMapEmpty!6746 (= (arr!3347 (_values!3522 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1643)) mapDefault!6746)))))

(declare-fun b!170299 () Bool)

(declare-fun tp_is_empty!3973 () Bool)

(assert (=> b!170299 (= e!112366 tp_is_empty!3973)))

(declare-fun b!170300 () Bool)

(assert (=> b!170300 (= e!112368 (and (= (size!3641 (_values!3522 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8352 thiss!1248))) (= (size!3640 (_keys!5368 thiss!1248)) (size!3641 (_values!3522 thiss!1248))) (bvsge (mask!8352 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3280 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3280 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3280 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt (bvor (extraKeys!3280 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011)))))

(declare-fun b!170301 () Bool)

(assert (=> b!170301 (= e!112369 tp_is_empty!3973)))

(declare-fun b!170302 () Bool)

(declare-fun res!80930 () Bool)

(assert (=> b!170302 (=> (not res!80930) (not e!112368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170302 (= res!80930 (validMask!0 (mask!8352 thiss!1248)))))

(declare-fun res!80932 () Bool)

(assert (=> start!16958 (=> (not res!80932) (not e!112368))))

(declare-fun valid!957 (LongMapFixedSize!2194) Bool)

(assert (=> start!16958 (= res!80932 (valid!957 thiss!1248))))

(assert (=> start!16958 e!112368))

(declare-fun e!112365 () Bool)

(assert (=> start!16958 e!112365))

(assert (=> start!16958 true))

(declare-fun array_inv!2155 (array!7035) Bool)

(declare-fun array_inv!2156 (array!7037) Bool)

(assert (=> b!170297 (= e!112365 (and tp!15226 tp_is_empty!3973 (array_inv!2155 (_keys!5368 thiss!1248)) (array_inv!2156 (_values!3522 thiss!1248)) e!112364))))

(assert (= (and start!16958 res!80932) b!170296))

(assert (= (and b!170296 res!80931) b!170302))

(assert (= (and b!170302 res!80930) b!170300))

(assert (= (and b!170298 condMapEmpty!6746) mapIsEmpty!6746))

(assert (= (and b!170298 (not condMapEmpty!6746)) mapNonEmpty!6746))

(get-info :version)

(assert (= (and mapNonEmpty!6746 ((_ is ValueCellFull!1643) mapValue!6746)) b!170301))

(assert (= (and b!170298 ((_ is ValueCellFull!1643) mapDefault!6746)) b!170299))

(assert (= b!170297 b!170298))

(assert (= start!16958 b!170297))

(declare-fun m!198333 () Bool)

(assert (=> mapNonEmpty!6746 m!198333))

(declare-fun m!198335 () Bool)

(assert (=> b!170302 m!198335))

(declare-fun m!198337 () Bool)

(assert (=> start!16958 m!198337))

(declare-fun m!198339 () Bool)

(assert (=> b!170297 m!198339))

(declare-fun m!198341 () Bool)

(assert (=> b!170297 m!198341))

(check-sat (not b!170302) tp_is_empty!3973 (not mapNonEmpty!6746) b_and!10589 (not start!16958) (not b!170297) (not b_next!4201))
(check-sat b_and!10589 (not b_next!4201))
