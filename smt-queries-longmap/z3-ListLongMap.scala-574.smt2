; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15590 () Bool)

(assert start!15590)

(declare-fun b!155193 () Bool)

(declare-fun b_free!3253 () Bool)

(declare-fun b_next!3253 () Bool)

(assert (=> b!155193 (= b_free!3253 (not b_next!3253))))

(declare-fun tp!12284 () Bool)

(declare-fun b_and!9681 () Bool)

(assert (=> b!155193 (= tp!12284 b_and!9681)))

(declare-fun b!155186 () Bool)

(declare-fun e!101378 () Bool)

(declare-fun tp_is_empty!3055 () Bool)

(assert (=> b!155186 (= e!101378 tp_is_empty!3055)))

(declare-fun b!155187 () Bool)

(declare-fun e!101377 () Bool)

(assert (=> b!155187 (= e!101377 tp_is_empty!3055)))

(declare-fun res!73268 () Bool)

(declare-fun e!101374 () Bool)

(assert (=> start!15590 (=> (not res!73268) (not e!101374))))

(declare-datatypes ((V!3721 0))(
  ( (V!3722 (val!1572 Int)) )
))
(declare-datatypes ((ValueCell!1184 0))(
  ( (ValueCellFull!1184 (v!3438 V!3721)) (EmptyCell!1184) )
))
(declare-datatypes ((array!5149 0))(
  ( (array!5150 (arr!2432 (Array (_ BitVec 32) (_ BitVec 64))) (size!2710 (_ BitVec 32))) )
))
(declare-datatypes ((array!5151 0))(
  ( (array!5152 (arr!2433 (Array (_ BitVec 32) ValueCell!1184)) (size!2711 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1276 0))(
  ( (LongMapFixedSize!1277 (defaultEntry!3080 Int) (mask!7497 (_ BitVec 32)) (extraKeys!2821 (_ BitVec 32)) (zeroValue!2923 V!3721) (minValue!2923 V!3721) (_size!687 (_ BitVec 32)) (_keys!4855 array!5149) (_values!3063 array!5151) (_vacant!687 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1276)

(declare-fun valid!643 (LongMapFixedSize!1276) Bool)

(assert (=> start!15590 (= res!73268 (valid!643 thiss!1248))))

(assert (=> start!15590 e!101374))

(declare-fun e!101375 () Bool)

(assert (=> start!15590 e!101375))

(assert (=> start!15590 true))

(declare-fun b!155188 () Bool)

(declare-fun res!73266 () Bool)

(assert (=> b!155188 (=> (not res!73266) (not e!101374))))

(assert (=> b!155188 (= res!73266 (and (= (size!2711 (_values!3063 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7497 thiss!1248))) (= (size!2710 (_keys!4855 thiss!1248)) (size!2711 (_values!3063 thiss!1248))) (bvsge (mask!7497 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2821 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2821 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2821 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2821 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2821 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2821 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2821 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155189 () Bool)

(declare-fun res!73270 () Bool)

(assert (=> b!155189 (=> (not res!73270) (not e!101374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155189 (= res!73270 (validMask!0 (mask!7497 thiss!1248)))))

(declare-fun b!155190 () Bool)

(assert (=> b!155190 (= e!101374 false)))

(declare-fun lt!81390 () Bool)

(declare-datatypes ((List!1800 0))(
  ( (Nil!1797) (Cons!1796 (h!2405 (_ BitVec 64)) (t!6594 List!1800)) )
))
(declare-fun arrayNoDuplicates!0 (array!5149 (_ BitVec 32) List!1800) Bool)

(assert (=> b!155190 (= lt!81390 (arrayNoDuplicates!0 (_keys!4855 thiss!1248) #b00000000000000000000000000000000 Nil!1797))))

(declare-fun b!155191 () Bool)

(declare-fun res!73269 () Bool)

(assert (=> b!155191 (=> (not res!73269) (not e!101374))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155191 (= res!73269 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155192 () Bool)

(declare-fun e!101379 () Bool)

(declare-fun mapRes!5225 () Bool)

(assert (=> b!155192 (= e!101379 (and e!101378 mapRes!5225))))

(declare-fun condMapEmpty!5225 () Bool)

(declare-fun mapDefault!5225 () ValueCell!1184)

(assert (=> b!155192 (= condMapEmpty!5225 (= (arr!2433 (_values!3063 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1184)) mapDefault!5225)))))

(declare-fun array_inv!1537 (array!5149) Bool)

(declare-fun array_inv!1538 (array!5151) Bool)

(assert (=> b!155193 (= e!101375 (and tp!12284 tp_is_empty!3055 (array_inv!1537 (_keys!4855 thiss!1248)) (array_inv!1538 (_values!3063 thiss!1248)) e!101379))))

(declare-fun mapIsEmpty!5225 () Bool)

(assert (=> mapIsEmpty!5225 mapRes!5225))

(declare-fun mapNonEmpty!5225 () Bool)

(declare-fun tp!12283 () Bool)

(assert (=> mapNonEmpty!5225 (= mapRes!5225 (and tp!12283 e!101377))))

(declare-fun mapValue!5225 () ValueCell!1184)

(declare-fun mapRest!5225 () (Array (_ BitVec 32) ValueCell!1184))

(declare-fun mapKey!5225 () (_ BitVec 32))

(assert (=> mapNonEmpty!5225 (= (arr!2433 (_values!3063 thiss!1248)) (store mapRest!5225 mapKey!5225 mapValue!5225))))

(declare-fun b!155194 () Bool)

(declare-fun res!73267 () Bool)

(assert (=> b!155194 (=> (not res!73267) (not e!101374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5149 (_ BitVec 32)) Bool)

(assert (=> b!155194 (= res!73267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4855 thiss!1248) (mask!7497 thiss!1248)))))

(assert (= (and start!15590 res!73268) b!155191))

(assert (= (and b!155191 res!73269) b!155189))

(assert (= (and b!155189 res!73270) b!155188))

(assert (= (and b!155188 res!73266) b!155194))

(assert (= (and b!155194 res!73267) b!155190))

(assert (= (and b!155192 condMapEmpty!5225) mapIsEmpty!5225))

(assert (= (and b!155192 (not condMapEmpty!5225)) mapNonEmpty!5225))

(get-info :version)

(assert (= (and mapNonEmpty!5225 ((_ is ValueCellFull!1184) mapValue!5225)) b!155187))

(assert (= (and b!155192 ((_ is ValueCellFull!1184) mapDefault!5225)) b!155186))

(assert (= b!155193 b!155192))

(assert (= start!15590 b!155193))

(declare-fun m!189365 () Bool)

(assert (=> mapNonEmpty!5225 m!189365))

(declare-fun m!189367 () Bool)

(assert (=> b!155190 m!189367))

(declare-fun m!189369 () Bool)

(assert (=> b!155194 m!189369))

(declare-fun m!189371 () Bool)

(assert (=> b!155189 m!189371))

(declare-fun m!189373 () Bool)

(assert (=> b!155193 m!189373))

(declare-fun m!189375 () Bool)

(assert (=> b!155193 m!189375))

(declare-fun m!189377 () Bool)

(assert (=> start!15590 m!189377))

(check-sat (not start!15590) (not b_next!3253) (not b!155189) b_and!9681 (not mapNonEmpty!5225) (not b!155194) tp_is_empty!3055 (not b!155193) (not b!155190))
(check-sat b_and!9681 (not b_next!3253))
