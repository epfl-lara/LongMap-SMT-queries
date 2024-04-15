; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15680 () Bool)

(assert start!15680)

(declare-fun b!156096 () Bool)

(declare-fun b_free!3343 () Bool)

(declare-fun b_next!3343 () Bool)

(assert (=> b!156096 (= b_free!3343 (not b_next!3343))))

(declare-fun tp!12553 () Bool)

(declare-fun b_and!9731 () Bool)

(assert (=> b!156096 (= tp!12553 b_and!9731)))

(declare-fun mapNonEmpty!5360 () Bool)

(declare-fun mapRes!5360 () Bool)

(declare-fun tp!12554 () Bool)

(declare-fun e!102077 () Bool)

(assert (=> mapNonEmpty!5360 (= mapRes!5360 (and tp!12554 e!102077))))

(declare-datatypes ((V!3841 0))(
  ( (V!3842 (val!1617 Int)) )
))
(declare-datatypes ((ValueCell!1229 0))(
  ( (ValueCellFull!1229 (v!3476 V!3841)) (EmptyCell!1229) )
))
(declare-fun mapValue!5360 () ValueCell!1229)

(declare-fun mapRest!5360 () (Array (_ BitVec 32) ValueCell!1229))

(declare-datatypes ((array!5323 0))(
  ( (array!5324 (arr!2518 (Array (_ BitVec 32) (_ BitVec 64))) (size!2797 (_ BitVec 32))) )
))
(declare-datatypes ((array!5325 0))(
  ( (array!5326 (arr!2519 (Array (_ BitVec 32) ValueCell!1229)) (size!2798 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1366 0))(
  ( (LongMapFixedSize!1367 (defaultEntry!3125 Int) (mask!7571 (_ BitVec 32)) (extraKeys!2866 (_ BitVec 32)) (zeroValue!2968 V!3841) (minValue!2968 V!3841) (_size!732 (_ BitVec 32)) (_keys!4899 array!5323) (_values!3108 array!5325) (_vacant!732 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1366)

(declare-fun mapKey!5360 () (_ BitVec 32))

(assert (=> mapNonEmpty!5360 (= (arr!2519 (_values!3108 thiss!1248)) (store mapRest!5360 mapKey!5360 mapValue!5360))))

(declare-fun b!156090 () Bool)

(declare-fun res!73711 () Bool)

(declare-fun e!102082 () Bool)

(assert (=> b!156090 (=> (not res!73711) (not e!102082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156090 (= res!73711 (validMask!0 (mask!7571 thiss!1248)))))

(declare-fun b!156091 () Bool)

(declare-fun res!73708 () Bool)

(assert (=> b!156091 (=> (not res!73708) (not e!102082))))

(assert (=> b!156091 (= res!73708 (and (= (size!2798 (_values!3108 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7571 thiss!1248))) (= (size!2797 (_keys!4899 thiss!1248)) (size!2798 (_values!3108 thiss!1248))) (bvsge (mask!7571 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2866 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2866 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2866 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2866 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2866 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2866 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2866 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156093 () Bool)

(declare-fun e!102080 () Bool)

(declare-fun e!102081 () Bool)

(assert (=> b!156093 (= e!102080 (and e!102081 mapRes!5360))))

(declare-fun condMapEmpty!5360 () Bool)

(declare-fun mapDefault!5360 () ValueCell!1229)

(assert (=> b!156093 (= condMapEmpty!5360 (= (arr!2519 (_values!3108 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1229)) mapDefault!5360)))))

(declare-fun b!156094 () Bool)

(declare-fun tp_is_empty!3145 () Bool)

(assert (=> b!156094 (= e!102081 tp_is_empty!3145)))

(declare-fun b!156095 () Bool)

(assert (=> b!156095 (= e!102082 false)))

(declare-fun lt!81348 () Bool)

(declare-datatypes ((List!1848 0))(
  ( (Nil!1845) (Cons!1844 (h!2453 (_ BitVec 64)) (t!6641 List!1848)) )
))
(declare-fun arrayNoDuplicates!0 (array!5323 (_ BitVec 32) List!1848) Bool)

(assert (=> b!156095 (= lt!81348 (arrayNoDuplicates!0 (_keys!4899 thiss!1248) #b00000000000000000000000000000000 Nil!1845))))

(declare-fun e!102079 () Bool)

(declare-fun array_inv!1623 (array!5323) Bool)

(declare-fun array_inv!1624 (array!5325) Bool)

(assert (=> b!156096 (= e!102079 (and tp!12553 tp_is_empty!3145 (array_inv!1623 (_keys!4899 thiss!1248)) (array_inv!1624 (_values!3108 thiss!1248)) e!102080))))

(declare-fun mapIsEmpty!5360 () Bool)

(assert (=> mapIsEmpty!5360 mapRes!5360))

(declare-fun b!156097 () Bool)

(assert (=> b!156097 (= e!102077 tp_is_empty!3145)))

(declare-fun b!156098 () Bool)

(declare-fun res!73709 () Bool)

(assert (=> b!156098 (=> (not res!73709) (not e!102082))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156098 (= res!73709 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!73710 () Bool)

(assert (=> start!15680 (=> (not res!73710) (not e!102082))))

(declare-fun valid!667 (LongMapFixedSize!1366) Bool)

(assert (=> start!15680 (= res!73710 (valid!667 thiss!1248))))

(assert (=> start!15680 e!102082))

(assert (=> start!15680 e!102079))

(assert (=> start!15680 true))

(declare-fun b!156092 () Bool)

(declare-fun res!73712 () Bool)

(assert (=> b!156092 (=> (not res!73712) (not e!102082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5323 (_ BitVec 32)) Bool)

(assert (=> b!156092 (= res!73712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4899 thiss!1248) (mask!7571 thiss!1248)))))

(assert (= (and start!15680 res!73710) b!156098))

(assert (= (and b!156098 res!73709) b!156090))

(assert (= (and b!156090 res!73711) b!156091))

(assert (= (and b!156091 res!73708) b!156092))

(assert (= (and b!156092 res!73712) b!156095))

(assert (= (and b!156093 condMapEmpty!5360) mapIsEmpty!5360))

(assert (= (and b!156093 (not condMapEmpty!5360)) mapNonEmpty!5360))

(get-info :version)

(assert (= (and mapNonEmpty!5360 ((_ is ValueCellFull!1229) mapValue!5360)) b!156097))

(assert (= (and b!156093 ((_ is ValueCellFull!1229) mapDefault!5360)) b!156094))

(assert (= b!156096 b!156093))

(assert (= start!15680 b!156096))

(declare-fun m!189277 () Bool)

(assert (=> b!156095 m!189277))

(declare-fun m!189279 () Bool)

(assert (=> b!156090 m!189279))

(declare-fun m!189281 () Bool)

(assert (=> mapNonEmpty!5360 m!189281))

(declare-fun m!189283 () Bool)

(assert (=> b!156096 m!189283))

(declare-fun m!189285 () Bool)

(assert (=> b!156096 m!189285))

(declare-fun m!189287 () Bool)

(assert (=> start!15680 m!189287))

(declare-fun m!189289 () Bool)

(assert (=> b!156092 m!189289))

(check-sat tp_is_empty!3145 (not b!156092) (not b_next!3343) b_and!9731 (not b!156095) (not mapNonEmpty!5360) (not b!156090) (not start!15680) (not b!156096))
(check-sat b_and!9731 (not b_next!3343))
