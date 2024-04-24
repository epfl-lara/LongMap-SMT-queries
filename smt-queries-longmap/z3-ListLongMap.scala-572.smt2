; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15578 () Bool)

(assert start!15578)

(declare-fun b!155032 () Bool)

(declare-fun b_free!3241 () Bool)

(declare-fun b_next!3241 () Bool)

(assert (=> b!155032 (= b_free!3241 (not b_next!3241))))

(declare-fun tp!12248 () Bool)

(declare-fun b_and!9669 () Bool)

(assert (=> b!155032 (= tp!12248 b_and!9669)))

(declare-fun res!73180 () Bool)

(declare-fun e!101267 () Bool)

(assert (=> start!15578 (=> (not res!73180) (not e!101267))))

(declare-datatypes ((V!3705 0))(
  ( (V!3706 (val!1566 Int)) )
))
(declare-datatypes ((ValueCell!1178 0))(
  ( (ValueCellFull!1178 (v!3432 V!3705)) (EmptyCell!1178) )
))
(declare-datatypes ((array!5125 0))(
  ( (array!5126 (arr!2420 (Array (_ BitVec 32) (_ BitVec 64))) (size!2698 (_ BitVec 32))) )
))
(declare-datatypes ((array!5127 0))(
  ( (array!5128 (arr!2421 (Array (_ BitVec 32) ValueCell!1178)) (size!2699 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1264 0))(
  ( (LongMapFixedSize!1265 (defaultEntry!3074 Int) (mask!7487 (_ BitVec 32)) (extraKeys!2815 (_ BitVec 32)) (zeroValue!2917 V!3705) (minValue!2917 V!3705) (_size!681 (_ BitVec 32)) (_keys!4849 array!5125) (_values!3057 array!5127) (_vacant!681 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1264)

(declare-fun valid!639 (LongMapFixedSize!1264) Bool)

(assert (=> start!15578 (= res!73180 (valid!639 thiss!1248))))

(assert (=> start!15578 e!101267))

(declare-fun e!101271 () Bool)

(assert (=> start!15578 e!101271))

(assert (=> start!15578 true))

(declare-fun mapNonEmpty!5207 () Bool)

(declare-fun mapRes!5207 () Bool)

(declare-fun tp!12247 () Bool)

(declare-fun e!101269 () Bool)

(assert (=> mapNonEmpty!5207 (= mapRes!5207 (and tp!12247 e!101269))))

(declare-fun mapKey!5207 () (_ BitVec 32))

(declare-fun mapValue!5207 () ValueCell!1178)

(declare-fun mapRest!5207 () (Array (_ BitVec 32) ValueCell!1178))

(assert (=> mapNonEmpty!5207 (= (arr!2421 (_values!3057 thiss!1248)) (store mapRest!5207 mapKey!5207 mapValue!5207))))

(declare-fun b!155024 () Bool)

(declare-fun res!73176 () Bool)

(assert (=> b!155024 (=> (not res!73176) (not e!101267))))

(assert (=> b!155024 (= res!73176 (and (= (size!2699 (_values!3057 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7487 thiss!1248))) (= (size!2698 (_keys!4849 thiss!1248)) (size!2699 (_values!3057 thiss!1248))) (bvsge (mask!7487 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2815 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2815 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2815 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2815 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2815 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2815 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2815 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155025 () Bool)

(declare-fun res!73179 () Bool)

(assert (=> b!155025 (=> (not res!73179) (not e!101267))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155025 (= res!73179 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155026 () Bool)

(declare-fun e!101270 () Bool)

(declare-fun e!101268 () Bool)

(assert (=> b!155026 (= e!101270 (and e!101268 mapRes!5207))))

(declare-fun condMapEmpty!5207 () Bool)

(declare-fun mapDefault!5207 () ValueCell!1178)

(assert (=> b!155026 (= condMapEmpty!5207 (= (arr!2421 (_values!3057 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1178)) mapDefault!5207)))))

(declare-fun b!155027 () Bool)

(declare-fun tp_is_empty!3043 () Bool)

(assert (=> b!155027 (= e!101268 tp_is_empty!3043)))

(declare-fun b!155028 () Bool)

(assert (=> b!155028 (= e!101267 false)))

(declare-fun lt!81372 () Bool)

(declare-datatypes ((List!1795 0))(
  ( (Nil!1792) (Cons!1791 (h!2400 (_ BitVec 64)) (t!6589 List!1795)) )
))
(declare-fun arrayNoDuplicates!0 (array!5125 (_ BitVec 32) List!1795) Bool)

(assert (=> b!155028 (= lt!81372 (arrayNoDuplicates!0 (_keys!4849 thiss!1248) #b00000000000000000000000000000000 Nil!1792))))

(declare-fun b!155029 () Bool)

(declare-fun res!73178 () Bool)

(assert (=> b!155029 (=> (not res!73178) (not e!101267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5125 (_ BitVec 32)) Bool)

(assert (=> b!155029 (= res!73178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4849 thiss!1248) (mask!7487 thiss!1248)))))

(declare-fun b!155030 () Bool)

(declare-fun res!73177 () Bool)

(assert (=> b!155030 (=> (not res!73177) (not e!101267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155030 (= res!73177 (validMask!0 (mask!7487 thiss!1248)))))

(declare-fun b!155031 () Bool)

(assert (=> b!155031 (= e!101269 tp_is_empty!3043)))

(declare-fun mapIsEmpty!5207 () Bool)

(assert (=> mapIsEmpty!5207 mapRes!5207))

(declare-fun array_inv!1527 (array!5125) Bool)

(declare-fun array_inv!1528 (array!5127) Bool)

(assert (=> b!155032 (= e!101271 (and tp!12248 tp_is_empty!3043 (array_inv!1527 (_keys!4849 thiss!1248)) (array_inv!1528 (_values!3057 thiss!1248)) e!101270))))

(assert (= (and start!15578 res!73180) b!155025))

(assert (= (and b!155025 res!73179) b!155030))

(assert (= (and b!155030 res!73177) b!155024))

(assert (= (and b!155024 res!73176) b!155029))

(assert (= (and b!155029 res!73178) b!155028))

(assert (= (and b!155026 condMapEmpty!5207) mapIsEmpty!5207))

(assert (= (and b!155026 (not condMapEmpty!5207)) mapNonEmpty!5207))

(get-info :version)

(assert (= (and mapNonEmpty!5207 ((_ is ValueCellFull!1178) mapValue!5207)) b!155031))

(assert (= (and b!155026 ((_ is ValueCellFull!1178) mapDefault!5207)) b!155027))

(assert (= b!155032 b!155026))

(assert (= start!15578 b!155032))

(declare-fun m!189281 () Bool)

(assert (=> b!155029 m!189281))

(declare-fun m!189283 () Bool)

(assert (=> b!155032 m!189283))

(declare-fun m!189285 () Bool)

(assert (=> b!155032 m!189285))

(declare-fun m!189287 () Bool)

(assert (=> b!155028 m!189287))

(declare-fun m!189289 () Bool)

(assert (=> start!15578 m!189289))

(declare-fun m!189291 () Bool)

(assert (=> mapNonEmpty!5207 m!189291))

(declare-fun m!189293 () Bool)

(assert (=> b!155030 m!189293))

(check-sat (not mapNonEmpty!5207) tp_is_empty!3043 b_and!9669 (not b!155028) (not b!155030) (not start!15578) (not b_next!3241) (not b!155029) (not b!155032))
(check-sat b_and!9669 (not b_next!3241))
