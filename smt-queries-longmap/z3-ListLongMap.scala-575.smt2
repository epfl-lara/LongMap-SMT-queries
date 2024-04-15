; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15596 () Bool)

(assert start!15596)

(declare-fun b!155074 () Bool)

(declare-fun b_free!3259 () Bool)

(declare-fun b_next!3259 () Bool)

(assert (=> b!155074 (= b_free!3259 (not b_next!3259))))

(declare-fun tp!12302 () Bool)

(declare-fun b_and!9647 () Bool)

(assert (=> b!155074 (= tp!12302 b_and!9647)))

(declare-fun mapIsEmpty!5234 () Bool)

(declare-fun mapRes!5234 () Bool)

(assert (=> mapIsEmpty!5234 mapRes!5234))

(declare-fun mapNonEmpty!5234 () Bool)

(declare-fun tp!12301 () Bool)

(declare-fun e!101308 () Bool)

(assert (=> mapNonEmpty!5234 (= mapRes!5234 (and tp!12301 e!101308))))

(declare-datatypes ((V!3729 0))(
  ( (V!3730 (val!1575 Int)) )
))
(declare-datatypes ((ValueCell!1187 0))(
  ( (ValueCellFull!1187 (v!3434 V!3729)) (EmptyCell!1187) )
))
(declare-fun mapValue!5234 () ValueCell!1187)

(declare-datatypes ((array!5155 0))(
  ( (array!5156 (arr!2434 (Array (_ BitVec 32) (_ BitVec 64))) (size!2713 (_ BitVec 32))) )
))
(declare-datatypes ((array!5157 0))(
  ( (array!5158 (arr!2435 (Array (_ BitVec 32) ValueCell!1187)) (size!2714 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1282 0))(
  ( (LongMapFixedSize!1283 (defaultEntry!3083 Int) (mask!7501 (_ BitVec 32)) (extraKeys!2824 (_ BitVec 32)) (zeroValue!2926 V!3729) (minValue!2926 V!3729) (_size!690 (_ BitVec 32)) (_keys!4857 array!5155) (_values!3066 array!5157) (_vacant!690 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1282)

(declare-fun mapRest!5234 () (Array (_ BitVec 32) ValueCell!1187))

(declare-fun mapKey!5234 () (_ BitVec 32))

(assert (=> mapNonEmpty!5234 (= (arr!2435 (_values!3066 thiss!1248)) (store mapRest!5234 mapKey!5234 mapValue!5234))))

(declare-fun b!155073 () Bool)

(declare-fun res!73195 () Bool)

(declare-fun e!101304 () Bool)

(assert (=> b!155073 (=> (not res!73195) (not e!101304))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155073 (= res!73195 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!101307 () Bool)

(declare-fun tp_is_empty!3061 () Bool)

(declare-fun e!101306 () Bool)

(declare-fun array_inv!1561 (array!5155) Bool)

(declare-fun array_inv!1562 (array!5157) Bool)

(assert (=> b!155074 (= e!101307 (and tp!12302 tp_is_empty!3061 (array_inv!1561 (_keys!4857 thiss!1248)) (array_inv!1562 (_values!3066 thiss!1248)) e!101306))))

(declare-fun b!155075 () Bool)

(declare-fun res!73199 () Bool)

(assert (=> b!155075 (=> (not res!73199) (not e!101304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155075 (= res!73199 (validMask!0 (mask!7501 thiss!1248)))))

(declare-fun b!155076 () Bool)

(assert (=> b!155076 (= e!101304 false)))

(declare-fun lt!81159 () Bool)

(declare-datatypes ((List!1821 0))(
  ( (Nil!1818) (Cons!1817 (h!2426 (_ BitVec 64)) (t!6614 List!1821)) )
))
(declare-fun arrayNoDuplicates!0 (array!5155 (_ BitVec 32) List!1821) Bool)

(assert (=> b!155076 (= lt!81159 (arrayNoDuplicates!0 (_keys!4857 thiss!1248) #b00000000000000000000000000000000 Nil!1818))))

(declare-fun b!155077 () Bool)

(declare-fun e!101305 () Bool)

(assert (=> b!155077 (= e!101306 (and e!101305 mapRes!5234))))

(declare-fun condMapEmpty!5234 () Bool)

(declare-fun mapDefault!5234 () ValueCell!1187)

(assert (=> b!155077 (= condMapEmpty!5234 (= (arr!2435 (_values!3066 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1187)) mapDefault!5234)))))

(declare-fun b!155078 () Bool)

(declare-fun res!73198 () Bool)

(assert (=> b!155078 (=> (not res!73198) (not e!101304))))

(assert (=> b!155078 (= res!73198 (and (= (size!2714 (_values!3066 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7501 thiss!1248))) (= (size!2713 (_keys!4857 thiss!1248)) (size!2714 (_values!3066 thiss!1248))) (bvsge (mask!7501 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2824 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2824 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2824 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2824 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2824 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2824 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2824 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!73196 () Bool)

(assert (=> start!15596 (=> (not res!73196) (not e!101304))))

(declare-fun valid!637 (LongMapFixedSize!1282) Bool)

(assert (=> start!15596 (= res!73196 (valid!637 thiss!1248))))

(assert (=> start!15596 e!101304))

(assert (=> start!15596 e!101307))

(assert (=> start!15596 true))

(declare-fun b!155079 () Bool)

(assert (=> b!155079 (= e!101305 tp_is_empty!3061)))

(declare-fun b!155080 () Bool)

(declare-fun res!73197 () Bool)

(assert (=> b!155080 (=> (not res!73197) (not e!101304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5155 (_ BitVec 32)) Bool)

(assert (=> b!155080 (= res!73197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4857 thiss!1248) (mask!7501 thiss!1248)))))

(declare-fun b!155081 () Bool)

(assert (=> b!155081 (= e!101308 tp_is_empty!3061)))

(assert (= (and start!15596 res!73196) b!155073))

(assert (= (and b!155073 res!73195) b!155075))

(assert (= (and b!155075 res!73199) b!155078))

(assert (= (and b!155078 res!73198) b!155080))

(assert (= (and b!155080 res!73197) b!155076))

(assert (= (and b!155077 condMapEmpty!5234) mapIsEmpty!5234))

(assert (= (and b!155077 (not condMapEmpty!5234)) mapNonEmpty!5234))

(get-info :version)

(assert (= (and mapNonEmpty!5234 ((_ is ValueCellFull!1187) mapValue!5234)) b!155081))

(assert (= (and b!155077 ((_ is ValueCellFull!1187) mapDefault!5234)) b!155079))

(assert (= b!155074 b!155077))

(assert (= start!15596 b!155074))

(declare-fun m!188605 () Bool)

(assert (=> b!155080 m!188605))

(declare-fun m!188607 () Bool)

(assert (=> start!15596 m!188607))

(declare-fun m!188609 () Bool)

(assert (=> b!155076 m!188609))

(declare-fun m!188611 () Bool)

(assert (=> b!155074 m!188611))

(declare-fun m!188613 () Bool)

(assert (=> b!155074 m!188613))

(declare-fun m!188615 () Bool)

(assert (=> b!155075 m!188615))

(declare-fun m!188617 () Bool)

(assert (=> mapNonEmpty!5234 m!188617))

(check-sat b_and!9647 (not b!155075) (not b!155080) (not b!155076) (not b!155074) (not start!15596) (not mapNonEmpty!5234) (not b_next!3259) tp_is_empty!3061)
(check-sat b_and!9647 (not b_next!3259))
