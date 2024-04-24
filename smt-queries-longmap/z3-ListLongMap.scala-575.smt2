; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15596 () Bool)

(assert start!15596)

(declare-fun b!155272 () Bool)

(declare-fun b_free!3259 () Bool)

(declare-fun b_next!3259 () Bool)

(assert (=> b!155272 (= b_free!3259 (not b_next!3259))))

(declare-fun tp!12301 () Bool)

(declare-fun b_and!9687 () Bool)

(assert (=> b!155272 (= tp!12301 b_and!9687)))

(declare-fun b!155267 () Bool)

(declare-fun e!101432 () Bool)

(assert (=> b!155267 (= e!101432 false)))

(declare-fun lt!81399 () Bool)

(declare-datatypes ((V!3729 0))(
  ( (V!3730 (val!1575 Int)) )
))
(declare-datatypes ((ValueCell!1187 0))(
  ( (ValueCellFull!1187 (v!3441 V!3729)) (EmptyCell!1187) )
))
(declare-datatypes ((array!5161 0))(
  ( (array!5162 (arr!2438 (Array (_ BitVec 32) (_ BitVec 64))) (size!2716 (_ BitVec 32))) )
))
(declare-datatypes ((array!5163 0))(
  ( (array!5164 (arr!2439 (Array (_ BitVec 32) ValueCell!1187)) (size!2717 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1282 0))(
  ( (LongMapFixedSize!1283 (defaultEntry!3083 Int) (mask!7502 (_ BitVec 32)) (extraKeys!2824 (_ BitVec 32)) (zeroValue!2926 V!3729) (minValue!2926 V!3729) (_size!690 (_ BitVec 32)) (_keys!4858 array!5161) (_values!3066 array!5163) (_vacant!690 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1282)

(declare-datatypes ((List!1802 0))(
  ( (Nil!1799) (Cons!1798 (h!2407 (_ BitVec 64)) (t!6596 List!1802)) )
))
(declare-fun arrayNoDuplicates!0 (array!5161 (_ BitVec 32) List!1802) Bool)

(assert (=> b!155267 (= lt!81399 (arrayNoDuplicates!0 (_keys!4858 thiss!1248) #b00000000000000000000000000000000 Nil!1799))))

(declare-fun b!155268 () Bool)

(declare-fun res!73312 () Bool)

(assert (=> b!155268 (=> (not res!73312) (not e!101432))))

(assert (=> b!155268 (= res!73312 (and (= (size!2717 (_values!3066 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7502 thiss!1248))) (= (size!2716 (_keys!4858 thiss!1248)) (size!2717 (_values!3066 thiss!1248))) (bvsge (mask!7502 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2824 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2824 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2824 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2824 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2824 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2824 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2824 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155269 () Bool)

(declare-fun e!101429 () Bool)

(declare-fun e!101430 () Bool)

(declare-fun mapRes!5234 () Bool)

(assert (=> b!155269 (= e!101429 (and e!101430 mapRes!5234))))

(declare-fun condMapEmpty!5234 () Bool)

(declare-fun mapDefault!5234 () ValueCell!1187)

(assert (=> b!155269 (= condMapEmpty!5234 (= (arr!2439 (_values!3066 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1187)) mapDefault!5234)))))

(declare-fun mapNonEmpty!5234 () Bool)

(declare-fun tp!12302 () Bool)

(declare-fun e!101431 () Bool)

(assert (=> mapNonEmpty!5234 (= mapRes!5234 (and tp!12302 e!101431))))

(declare-fun mapKey!5234 () (_ BitVec 32))

(declare-fun mapValue!5234 () ValueCell!1187)

(declare-fun mapRest!5234 () (Array (_ BitVec 32) ValueCell!1187))

(assert (=> mapNonEmpty!5234 (= (arr!2439 (_values!3066 thiss!1248)) (store mapRest!5234 mapKey!5234 mapValue!5234))))

(declare-fun b!155270 () Bool)

(declare-fun res!73315 () Bool)

(assert (=> b!155270 (=> (not res!73315) (not e!101432))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155270 (= res!73315 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155271 () Bool)

(declare-fun res!73311 () Bool)

(assert (=> b!155271 (=> (not res!73311) (not e!101432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155271 (= res!73311 (validMask!0 (mask!7502 thiss!1248)))))

(declare-fun e!101428 () Bool)

(declare-fun tp_is_empty!3061 () Bool)

(declare-fun array_inv!1541 (array!5161) Bool)

(declare-fun array_inv!1542 (array!5163) Bool)

(assert (=> b!155272 (= e!101428 (and tp!12301 tp_is_empty!3061 (array_inv!1541 (_keys!4858 thiss!1248)) (array_inv!1542 (_values!3066 thiss!1248)) e!101429))))

(declare-fun b!155273 () Bool)

(assert (=> b!155273 (= e!101431 tp_is_empty!3061)))

(declare-fun b!155274 () Bool)

(assert (=> b!155274 (= e!101430 tp_is_empty!3061)))

(declare-fun res!73314 () Bool)

(assert (=> start!15596 (=> (not res!73314) (not e!101432))))

(declare-fun valid!645 (LongMapFixedSize!1282) Bool)

(assert (=> start!15596 (= res!73314 (valid!645 thiss!1248))))

(assert (=> start!15596 e!101432))

(assert (=> start!15596 e!101428))

(assert (=> start!15596 true))

(declare-fun b!155275 () Bool)

(declare-fun res!73313 () Bool)

(assert (=> b!155275 (=> (not res!73313) (not e!101432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5161 (_ BitVec 32)) Bool)

(assert (=> b!155275 (= res!73313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4858 thiss!1248) (mask!7502 thiss!1248)))))

(declare-fun mapIsEmpty!5234 () Bool)

(assert (=> mapIsEmpty!5234 mapRes!5234))

(assert (= (and start!15596 res!73314) b!155270))

(assert (= (and b!155270 res!73315) b!155271))

(assert (= (and b!155271 res!73311) b!155268))

(assert (= (and b!155268 res!73312) b!155275))

(assert (= (and b!155275 res!73313) b!155267))

(assert (= (and b!155269 condMapEmpty!5234) mapIsEmpty!5234))

(assert (= (and b!155269 (not condMapEmpty!5234)) mapNonEmpty!5234))

(get-info :version)

(assert (= (and mapNonEmpty!5234 ((_ is ValueCellFull!1187) mapValue!5234)) b!155273))

(assert (= (and b!155269 ((_ is ValueCellFull!1187) mapDefault!5234)) b!155274))

(assert (= b!155272 b!155269))

(assert (= start!15596 b!155272))

(declare-fun m!189407 () Bool)

(assert (=> b!155271 m!189407))

(declare-fun m!189409 () Bool)

(assert (=> b!155267 m!189409))

(declare-fun m!189411 () Bool)

(assert (=> b!155272 m!189411))

(declare-fun m!189413 () Bool)

(assert (=> b!155272 m!189413))

(declare-fun m!189415 () Bool)

(assert (=> mapNonEmpty!5234 m!189415))

(declare-fun m!189417 () Bool)

(assert (=> start!15596 m!189417))

(declare-fun m!189419 () Bool)

(assert (=> b!155275 m!189419))

(check-sat (not b!155272) (not b!155267) (not start!15596) (not b!155275) (not mapNonEmpty!5234) tp_is_empty!3061 (not b_next!3259) (not b!155271) b_and!9687)
(check-sat b_and!9687 (not b_next!3259))
