; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15674 () Bool)

(assert start!15674)

(declare-fun b!156017 () Bool)

(declare-fun b_free!3337 () Bool)

(declare-fun b_next!3337 () Bool)

(assert (=> b!156017 (= b_free!3337 (not b_next!3337))))

(declare-fun tp!12535 () Bool)

(declare-fun b_and!9725 () Bool)

(assert (=> b!156017 (= tp!12535 b_and!9725)))

(declare-fun b!156009 () Bool)

(declare-fun e!102024 () Bool)

(declare-fun e!102023 () Bool)

(declare-fun mapRes!5351 () Bool)

(assert (=> b!156009 (= e!102024 (and e!102023 mapRes!5351))))

(declare-fun condMapEmpty!5351 () Bool)

(declare-datatypes ((V!3833 0))(
  ( (V!3834 (val!1614 Int)) )
))
(declare-datatypes ((ValueCell!1226 0))(
  ( (ValueCellFull!1226 (v!3473 V!3833)) (EmptyCell!1226) )
))
(declare-datatypes ((array!5311 0))(
  ( (array!5312 (arr!2512 (Array (_ BitVec 32) (_ BitVec 64))) (size!2791 (_ BitVec 32))) )
))
(declare-datatypes ((array!5313 0))(
  ( (array!5314 (arr!2513 (Array (_ BitVec 32) ValueCell!1226)) (size!2792 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1360 0))(
  ( (LongMapFixedSize!1361 (defaultEntry!3122 Int) (mask!7566 (_ BitVec 32)) (extraKeys!2863 (_ BitVec 32)) (zeroValue!2965 V!3833) (minValue!2965 V!3833) (_size!729 (_ BitVec 32)) (_keys!4896 array!5311) (_values!3105 array!5313) (_vacant!729 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1360)

(declare-fun mapDefault!5351 () ValueCell!1226)

(assert (=> b!156009 (= condMapEmpty!5351 (= (arr!2513 (_values!3105 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1226)) mapDefault!5351)))))

(declare-fun b!156010 () Bool)

(declare-fun res!73667 () Bool)

(declare-fun e!102025 () Bool)

(assert (=> b!156010 (=> (not res!73667) (not e!102025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156010 (= res!73667 (validMask!0 (mask!7566 thiss!1248)))))

(declare-fun b!156011 () Bool)

(assert (=> b!156011 (= e!102025 false)))

(declare-fun lt!81339 () Bool)

(declare-datatypes ((List!1846 0))(
  ( (Nil!1843) (Cons!1842 (h!2451 (_ BitVec 64)) (t!6639 List!1846)) )
))
(declare-fun arrayNoDuplicates!0 (array!5311 (_ BitVec 32) List!1846) Bool)

(assert (=> b!156011 (= lt!81339 (arrayNoDuplicates!0 (_keys!4896 thiss!1248) #b00000000000000000000000000000000 Nil!1843))))

(declare-fun b!156012 () Bool)

(declare-fun tp_is_empty!3139 () Bool)

(assert (=> b!156012 (= e!102023 tp_is_empty!3139)))

(declare-fun mapIsEmpty!5351 () Bool)

(assert (=> mapIsEmpty!5351 mapRes!5351))

(declare-fun res!73663 () Bool)

(assert (=> start!15674 (=> (not res!73663) (not e!102025))))

(declare-fun valid!665 (LongMapFixedSize!1360) Bool)

(assert (=> start!15674 (= res!73663 (valid!665 thiss!1248))))

(assert (=> start!15674 e!102025))

(declare-fun e!102027 () Bool)

(assert (=> start!15674 e!102027))

(assert (=> start!15674 true))

(declare-fun b!156013 () Bool)

(declare-fun res!73664 () Bool)

(assert (=> b!156013 (=> (not res!73664) (not e!102025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5311 (_ BitVec 32)) Bool)

(assert (=> b!156013 (= res!73664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4896 thiss!1248) (mask!7566 thiss!1248)))))

(declare-fun b!156014 () Bool)

(declare-fun res!73665 () Bool)

(assert (=> b!156014 (=> (not res!73665) (not e!102025))))

(assert (=> b!156014 (= res!73665 (and (= (size!2792 (_values!3105 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7566 thiss!1248))) (= (size!2791 (_keys!4896 thiss!1248)) (size!2792 (_values!3105 thiss!1248))) (bvsge (mask!7566 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2863 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2863 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2863 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2863 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2863 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2863 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2863 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156015 () Bool)

(declare-fun res!73666 () Bool)

(assert (=> b!156015 (=> (not res!73666) (not e!102025))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156015 (= res!73666 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156016 () Bool)

(declare-fun e!102026 () Bool)

(assert (=> b!156016 (= e!102026 tp_is_empty!3139)))

(declare-fun array_inv!1619 (array!5311) Bool)

(declare-fun array_inv!1620 (array!5313) Bool)

(assert (=> b!156017 (= e!102027 (and tp!12535 tp_is_empty!3139 (array_inv!1619 (_keys!4896 thiss!1248)) (array_inv!1620 (_values!3105 thiss!1248)) e!102024))))

(declare-fun mapNonEmpty!5351 () Bool)

(declare-fun tp!12536 () Bool)

(assert (=> mapNonEmpty!5351 (= mapRes!5351 (and tp!12536 e!102026))))

(declare-fun mapRest!5351 () (Array (_ BitVec 32) ValueCell!1226))

(declare-fun mapValue!5351 () ValueCell!1226)

(declare-fun mapKey!5351 () (_ BitVec 32))

(assert (=> mapNonEmpty!5351 (= (arr!2513 (_values!3105 thiss!1248)) (store mapRest!5351 mapKey!5351 mapValue!5351))))

(assert (= (and start!15674 res!73663) b!156015))

(assert (= (and b!156015 res!73666) b!156010))

(assert (= (and b!156010 res!73667) b!156014))

(assert (= (and b!156014 res!73665) b!156013))

(assert (= (and b!156013 res!73664) b!156011))

(assert (= (and b!156009 condMapEmpty!5351) mapIsEmpty!5351))

(assert (= (and b!156009 (not condMapEmpty!5351)) mapNonEmpty!5351))

(get-info :version)

(assert (= (and mapNonEmpty!5351 ((_ is ValueCellFull!1226) mapValue!5351)) b!156016))

(assert (= (and b!156009 ((_ is ValueCellFull!1226) mapDefault!5351)) b!156012))

(assert (= b!156017 b!156009))

(assert (= start!15674 b!156017))

(declare-fun m!189235 () Bool)

(assert (=> b!156013 m!189235))

(declare-fun m!189237 () Bool)

(assert (=> start!15674 m!189237))

(declare-fun m!189239 () Bool)

(assert (=> b!156017 m!189239))

(declare-fun m!189241 () Bool)

(assert (=> b!156017 m!189241))

(declare-fun m!189243 () Bool)

(assert (=> b!156011 m!189243))

(declare-fun m!189245 () Bool)

(assert (=> mapNonEmpty!5351 m!189245))

(declare-fun m!189247 () Bool)

(assert (=> b!156010 m!189247))

(check-sat b_and!9725 (not b!156017) (not b_next!3337) (not b!156011) (not b!156013) (not start!15674) tp_is_empty!3139 (not b!156010) (not mapNonEmpty!5351))
(check-sat b_and!9725 (not b_next!3337))
