; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15614 () Bool)

(assert start!15614)

(declare-fun b!155321 () Bool)

(declare-fun b_free!3277 () Bool)

(declare-fun b_next!3277 () Bool)

(assert (=> b!155321 (= b_free!3277 (not b_next!3277))))

(declare-fun tp!12355 () Bool)

(declare-fun b_and!9665 () Bool)

(assert (=> b!155321 (= tp!12355 b_and!9665)))

(declare-fun b!155316 () Bool)

(declare-fun e!101470 () Bool)

(declare-fun e!101467 () Bool)

(declare-fun mapRes!5261 () Bool)

(assert (=> b!155316 (= e!101470 (and e!101467 mapRes!5261))))

(declare-fun condMapEmpty!5261 () Bool)

(declare-datatypes ((V!3753 0))(
  ( (V!3754 (val!1584 Int)) )
))
(declare-datatypes ((ValueCell!1196 0))(
  ( (ValueCellFull!1196 (v!3443 V!3753)) (EmptyCell!1196) )
))
(declare-datatypes ((array!5191 0))(
  ( (array!5192 (arr!2452 (Array (_ BitVec 32) (_ BitVec 64))) (size!2731 (_ BitVec 32))) )
))
(declare-datatypes ((array!5193 0))(
  ( (array!5194 (arr!2453 (Array (_ BitVec 32) ValueCell!1196)) (size!2732 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1300 0))(
  ( (LongMapFixedSize!1301 (defaultEntry!3092 Int) (mask!7516 (_ BitVec 32)) (extraKeys!2833 (_ BitVec 32)) (zeroValue!2935 V!3753) (minValue!2935 V!3753) (_size!699 (_ BitVec 32)) (_keys!4866 array!5191) (_values!3075 array!5193) (_vacant!699 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1300)

(declare-fun mapDefault!5261 () ValueCell!1196)

(assert (=> b!155316 (= condMapEmpty!5261 (= (arr!2453 (_values!3075 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1196)) mapDefault!5261)))))

(declare-fun b!155317 () Bool)

(declare-fun e!101466 () Bool)

(declare-fun tp_is_empty!3079 () Bool)

(assert (=> b!155317 (= e!101466 tp_is_empty!3079)))

(declare-fun b!155318 () Bool)

(declare-fun res!73332 () Bool)

(declare-fun e!101469 () Bool)

(assert (=> b!155318 (=> (not res!73332) (not e!101469))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155318 (= res!73332 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155319 () Bool)

(declare-fun res!73331 () Bool)

(assert (=> b!155319 (=> (not res!73331) (not e!101469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5191 (_ BitVec 32)) Bool)

(assert (=> b!155319 (= res!73331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4866 thiss!1248) (mask!7516 thiss!1248)))))

(declare-fun b!155320 () Bool)

(assert (=> b!155320 (= e!101467 tp_is_empty!3079)))

(declare-fun e!101465 () Bool)

(declare-fun array_inv!1573 (array!5191) Bool)

(declare-fun array_inv!1574 (array!5193) Bool)

(assert (=> b!155321 (= e!101465 (and tp!12355 tp_is_empty!3079 (array_inv!1573 (_keys!4866 thiss!1248)) (array_inv!1574 (_values!3075 thiss!1248)) e!101470))))

(declare-fun res!73333 () Bool)

(assert (=> start!15614 (=> (not res!73333) (not e!101469))))

(declare-fun valid!642 (LongMapFixedSize!1300) Bool)

(assert (=> start!15614 (= res!73333 (valid!642 thiss!1248))))

(assert (=> start!15614 e!101469))

(assert (=> start!15614 e!101465))

(assert (=> start!15614 true))

(declare-fun b!155322 () Bool)

(declare-fun res!73330 () Bool)

(assert (=> b!155322 (=> (not res!73330) (not e!101469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155322 (= res!73330 (validMask!0 (mask!7516 thiss!1248)))))

(declare-fun mapIsEmpty!5261 () Bool)

(assert (=> mapIsEmpty!5261 mapRes!5261))

(declare-fun b!155323 () Bool)

(assert (=> b!155323 (= e!101469 false)))

(declare-fun lt!81186 () Bool)

(declare-datatypes ((List!1827 0))(
  ( (Nil!1824) (Cons!1823 (h!2432 (_ BitVec 64)) (t!6620 List!1827)) )
))
(declare-fun arrayNoDuplicates!0 (array!5191 (_ BitVec 32) List!1827) Bool)

(assert (=> b!155323 (= lt!81186 (arrayNoDuplicates!0 (_keys!4866 thiss!1248) #b00000000000000000000000000000000 Nil!1824))))

(declare-fun b!155324 () Bool)

(declare-fun res!73334 () Bool)

(assert (=> b!155324 (=> (not res!73334) (not e!101469))))

(assert (=> b!155324 (= res!73334 (and (= (size!2732 (_values!3075 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7516 thiss!1248))) (= (size!2731 (_keys!4866 thiss!1248)) (size!2732 (_values!3075 thiss!1248))) (bvsge (mask!7516 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2833 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2833 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2833 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2833 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5261 () Bool)

(declare-fun tp!12356 () Bool)

(assert (=> mapNonEmpty!5261 (= mapRes!5261 (and tp!12356 e!101466))))

(declare-fun mapValue!5261 () ValueCell!1196)

(declare-fun mapKey!5261 () (_ BitVec 32))

(declare-fun mapRest!5261 () (Array (_ BitVec 32) ValueCell!1196))

(assert (=> mapNonEmpty!5261 (= (arr!2453 (_values!3075 thiss!1248)) (store mapRest!5261 mapKey!5261 mapValue!5261))))

(assert (= (and start!15614 res!73333) b!155318))

(assert (= (and b!155318 res!73332) b!155322))

(assert (= (and b!155322 res!73330) b!155324))

(assert (= (and b!155324 res!73334) b!155319))

(assert (= (and b!155319 res!73331) b!155323))

(assert (= (and b!155316 condMapEmpty!5261) mapIsEmpty!5261))

(assert (= (and b!155316 (not condMapEmpty!5261)) mapNonEmpty!5261))

(get-info :version)

(assert (= (and mapNonEmpty!5261 ((_ is ValueCellFull!1196) mapValue!5261)) b!155317))

(assert (= (and b!155316 ((_ is ValueCellFull!1196) mapDefault!5261)) b!155320))

(assert (= b!155321 b!155316))

(assert (= start!15614 b!155321))

(declare-fun m!188731 () Bool)

(assert (=> start!15614 m!188731))

(declare-fun m!188733 () Bool)

(assert (=> b!155323 m!188733))

(declare-fun m!188735 () Bool)

(assert (=> b!155322 m!188735))

(declare-fun m!188737 () Bool)

(assert (=> mapNonEmpty!5261 m!188737))

(declare-fun m!188739 () Bool)

(assert (=> b!155321 m!188739))

(declare-fun m!188741 () Bool)

(assert (=> b!155321 m!188741))

(declare-fun m!188743 () Bool)

(assert (=> b!155319 m!188743))

(check-sat (not start!15614) (not b!155319) b_and!9665 tp_is_empty!3079 (not b!155322) (not mapNonEmpty!5261) (not b!155323) (not b!155321) (not b_next!3277))
(check-sat b_and!9665 (not b_next!3277))
