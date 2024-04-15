; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15602 () Bool)

(assert start!15602)

(declare-fun b!155158 () Bool)

(declare-fun b_free!3265 () Bool)

(declare-fun b_next!3265 () Bool)

(assert (=> b!155158 (= b_free!3265 (not b_next!3265))))

(declare-fun tp!12320 () Bool)

(declare-fun b_and!9653 () Bool)

(assert (=> b!155158 (= tp!12320 b_and!9653)))

(declare-fun b!155154 () Bool)

(declare-fun res!73240 () Bool)

(declare-fun e!101357 () Bool)

(assert (=> b!155154 (=> (not res!73240) (not e!101357))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155154 (= res!73240 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155155 () Bool)

(declare-fun res!73242 () Bool)

(assert (=> b!155155 (=> (not res!73242) (not e!101357))))

(declare-datatypes ((V!3737 0))(
  ( (V!3738 (val!1578 Int)) )
))
(declare-datatypes ((ValueCell!1190 0))(
  ( (ValueCellFull!1190 (v!3437 V!3737)) (EmptyCell!1190) )
))
(declare-datatypes ((array!5167 0))(
  ( (array!5168 (arr!2440 (Array (_ BitVec 32) (_ BitVec 64))) (size!2719 (_ BitVec 32))) )
))
(declare-datatypes ((array!5169 0))(
  ( (array!5170 (arr!2441 (Array (_ BitVec 32) ValueCell!1190)) (size!2720 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1288 0))(
  ( (LongMapFixedSize!1289 (defaultEntry!3086 Int) (mask!7506 (_ BitVec 32)) (extraKeys!2827 (_ BitVec 32)) (zeroValue!2929 V!3737) (minValue!2929 V!3737) (_size!693 (_ BitVec 32)) (_keys!4860 array!5167) (_values!3069 array!5169) (_vacant!693 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1288)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5167 (_ BitVec 32)) Bool)

(assert (=> b!155155 (= res!73242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4860 thiss!1248) (mask!7506 thiss!1248)))))

(declare-fun b!155156 () Bool)

(declare-fun res!73243 () Bool)

(assert (=> b!155156 (=> (not res!73243) (not e!101357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155156 (= res!73243 (validMask!0 (mask!7506 thiss!1248)))))

(declare-fun b!155157 () Bool)

(assert (=> b!155157 (= e!101357 false)))

(declare-fun lt!81168 () Bool)

(declare-datatypes ((List!1824 0))(
  ( (Nil!1821) (Cons!1820 (h!2429 (_ BitVec 64)) (t!6617 List!1824)) )
))
(declare-fun arrayNoDuplicates!0 (array!5167 (_ BitVec 32) List!1824) Bool)

(assert (=> b!155157 (= lt!81168 (arrayNoDuplicates!0 (_keys!4860 thiss!1248) #b00000000000000000000000000000000 Nil!1821))))

(declare-fun e!101360 () Bool)

(declare-fun tp_is_empty!3067 () Bool)

(declare-fun e!101361 () Bool)

(declare-fun array_inv!1565 (array!5167) Bool)

(declare-fun array_inv!1566 (array!5169) Bool)

(assert (=> b!155158 (= e!101360 (and tp!12320 tp_is_empty!3067 (array_inv!1565 (_keys!4860 thiss!1248)) (array_inv!1566 (_values!3069 thiss!1248)) e!101361))))

(declare-fun res!73241 () Bool)

(assert (=> start!15602 (=> (not res!73241) (not e!101357))))

(declare-fun valid!639 (LongMapFixedSize!1288) Bool)

(assert (=> start!15602 (= res!73241 (valid!639 thiss!1248))))

(assert (=> start!15602 e!101357))

(assert (=> start!15602 e!101360))

(assert (=> start!15602 true))

(declare-fun mapIsEmpty!5243 () Bool)

(declare-fun mapRes!5243 () Bool)

(assert (=> mapIsEmpty!5243 mapRes!5243))

(declare-fun b!155159 () Bool)

(declare-fun res!73244 () Bool)

(assert (=> b!155159 (=> (not res!73244) (not e!101357))))

(assert (=> b!155159 (= res!73244 (and (= (size!2720 (_values!3069 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7506 thiss!1248))) (= (size!2719 (_keys!4860 thiss!1248)) (size!2720 (_values!3069 thiss!1248))) (bvsge (mask!7506 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2827 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2827 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2827 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155160 () Bool)

(declare-fun e!101358 () Bool)

(assert (=> b!155160 (= e!101358 tp_is_empty!3067)))

(declare-fun b!155161 () Bool)

(declare-fun e!101362 () Bool)

(assert (=> b!155161 (= e!101361 (and e!101362 mapRes!5243))))

(declare-fun condMapEmpty!5243 () Bool)

(declare-fun mapDefault!5243 () ValueCell!1190)

(assert (=> b!155161 (= condMapEmpty!5243 (= (arr!2441 (_values!3069 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1190)) mapDefault!5243)))))

(declare-fun mapNonEmpty!5243 () Bool)

(declare-fun tp!12319 () Bool)

(assert (=> mapNonEmpty!5243 (= mapRes!5243 (and tp!12319 e!101358))))

(declare-fun mapKey!5243 () (_ BitVec 32))

(declare-fun mapValue!5243 () ValueCell!1190)

(declare-fun mapRest!5243 () (Array (_ BitVec 32) ValueCell!1190))

(assert (=> mapNonEmpty!5243 (= (arr!2441 (_values!3069 thiss!1248)) (store mapRest!5243 mapKey!5243 mapValue!5243))))

(declare-fun b!155162 () Bool)

(assert (=> b!155162 (= e!101362 tp_is_empty!3067)))

(assert (= (and start!15602 res!73241) b!155154))

(assert (= (and b!155154 res!73240) b!155156))

(assert (= (and b!155156 res!73243) b!155159))

(assert (= (and b!155159 res!73244) b!155155))

(assert (= (and b!155155 res!73242) b!155157))

(assert (= (and b!155161 condMapEmpty!5243) mapIsEmpty!5243))

(assert (= (and b!155161 (not condMapEmpty!5243)) mapNonEmpty!5243))

(get-info :version)

(assert (= (and mapNonEmpty!5243 ((_ is ValueCellFull!1190) mapValue!5243)) b!155160))

(assert (= (and b!155161 ((_ is ValueCellFull!1190) mapDefault!5243)) b!155162))

(assert (= b!155158 b!155161))

(assert (= start!15602 b!155158))

(declare-fun m!188647 () Bool)

(assert (=> start!15602 m!188647))

(declare-fun m!188649 () Bool)

(assert (=> b!155156 m!188649))

(declare-fun m!188651 () Bool)

(assert (=> b!155158 m!188651))

(declare-fun m!188653 () Bool)

(assert (=> b!155158 m!188653))

(declare-fun m!188655 () Bool)

(assert (=> mapNonEmpty!5243 m!188655))

(declare-fun m!188657 () Bool)

(assert (=> b!155157 m!188657))

(declare-fun m!188659 () Bool)

(assert (=> b!155155 m!188659))

(check-sat (not start!15602) (not b!155158) (not b!155155) (not mapNonEmpty!5243) (not b!155157) b_and!9653 (not b_next!3265) tp_is_empty!3067 (not b!155156))
(check-sat b_and!9653 (not b_next!3265))
