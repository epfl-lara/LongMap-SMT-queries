; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15578 () Bool)

(assert start!15578)

(declare-fun b!154836 () Bool)

(declare-fun b_free!3241 () Bool)

(declare-fun b_next!3241 () Bool)

(assert (=> b!154836 (= b_free!3241 (not b_next!3241))))

(declare-fun tp!12248 () Bool)

(declare-fun b_and!9629 () Bool)

(assert (=> b!154836 (= tp!12248 b_and!9629)))

(declare-fun b!154830 () Bool)

(declare-fun e!101143 () Bool)

(declare-fun tp_is_empty!3043 () Bool)

(assert (=> b!154830 (= e!101143 tp_is_empty!3043)))

(declare-fun b!154831 () Bool)

(declare-fun e!101144 () Bool)

(assert (=> b!154831 (= e!101144 false)))

(declare-fun lt!81132 () Bool)

(declare-datatypes ((V!3705 0))(
  ( (V!3706 (val!1566 Int)) )
))
(declare-datatypes ((ValueCell!1178 0))(
  ( (ValueCellFull!1178 (v!3425 V!3705)) (EmptyCell!1178) )
))
(declare-datatypes ((array!5119 0))(
  ( (array!5120 (arr!2416 (Array (_ BitVec 32) (_ BitVec 64))) (size!2695 (_ BitVec 32))) )
))
(declare-datatypes ((array!5121 0))(
  ( (array!5122 (arr!2417 (Array (_ BitVec 32) ValueCell!1178)) (size!2696 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1264 0))(
  ( (LongMapFixedSize!1265 (defaultEntry!3074 Int) (mask!7486 (_ BitVec 32)) (extraKeys!2815 (_ BitVec 32)) (zeroValue!2917 V!3705) (minValue!2917 V!3705) (_size!681 (_ BitVec 32)) (_keys!4848 array!5119) (_values!3057 array!5121) (_vacant!681 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1264)

(declare-datatypes ((List!1817 0))(
  ( (Nil!1814) (Cons!1813 (h!2422 (_ BitVec 64)) (t!6610 List!1817)) )
))
(declare-fun arrayNoDuplicates!0 (array!5119 (_ BitVec 32) List!1817) Bool)

(assert (=> b!154831 (= lt!81132 (arrayNoDuplicates!0 (_keys!4848 thiss!1248) #b00000000000000000000000000000000 Nil!1814))))

(declare-fun b!154832 () Bool)

(declare-fun res!73064 () Bool)

(assert (=> b!154832 (=> (not res!73064) (not e!101144))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154832 (= res!73064 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154833 () Bool)

(declare-fun res!73063 () Bool)

(assert (=> b!154833 (=> (not res!73063) (not e!101144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5119 (_ BitVec 32)) Bool)

(assert (=> b!154833 (= res!73063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4848 thiss!1248) (mask!7486 thiss!1248)))))

(declare-fun res!73060 () Bool)

(assert (=> start!15578 (=> (not res!73060) (not e!101144))))

(declare-fun valid!632 (LongMapFixedSize!1264) Bool)

(assert (=> start!15578 (= res!73060 (valid!632 thiss!1248))))

(assert (=> start!15578 e!101144))

(declare-fun e!101145 () Bool)

(assert (=> start!15578 e!101145))

(assert (=> start!15578 true))

(declare-fun b!154834 () Bool)

(declare-fun res!73062 () Bool)

(assert (=> b!154834 (=> (not res!73062) (not e!101144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154834 (= res!73062 (validMask!0 (mask!7486 thiss!1248)))))

(declare-fun mapNonEmpty!5207 () Bool)

(declare-fun mapRes!5207 () Bool)

(declare-fun tp!12247 () Bool)

(declare-fun e!101146 () Bool)

(assert (=> mapNonEmpty!5207 (= mapRes!5207 (and tp!12247 e!101146))))

(declare-fun mapKey!5207 () (_ BitVec 32))

(declare-fun mapValue!5207 () ValueCell!1178)

(declare-fun mapRest!5207 () (Array (_ BitVec 32) ValueCell!1178))

(assert (=> mapNonEmpty!5207 (= (arr!2417 (_values!3057 thiss!1248)) (store mapRest!5207 mapKey!5207 mapValue!5207))))

(declare-fun b!154835 () Bool)

(assert (=> b!154835 (= e!101146 tp_is_empty!3043)))

(declare-fun mapIsEmpty!5207 () Bool)

(assert (=> mapIsEmpty!5207 mapRes!5207))

(declare-fun e!101142 () Bool)

(declare-fun array_inv!1549 (array!5119) Bool)

(declare-fun array_inv!1550 (array!5121) Bool)

(assert (=> b!154836 (= e!101145 (and tp!12248 tp_is_empty!3043 (array_inv!1549 (_keys!4848 thiss!1248)) (array_inv!1550 (_values!3057 thiss!1248)) e!101142))))

(declare-fun b!154837 () Bool)

(assert (=> b!154837 (= e!101142 (and e!101143 mapRes!5207))))

(declare-fun condMapEmpty!5207 () Bool)

(declare-fun mapDefault!5207 () ValueCell!1178)

(assert (=> b!154837 (= condMapEmpty!5207 (= (arr!2417 (_values!3057 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1178)) mapDefault!5207)))))

(declare-fun b!154838 () Bool)

(declare-fun res!73061 () Bool)

(assert (=> b!154838 (=> (not res!73061) (not e!101144))))

(assert (=> b!154838 (= res!73061 (and (= (size!2696 (_values!3057 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7486 thiss!1248))) (= (size!2695 (_keys!4848 thiss!1248)) (size!2696 (_values!3057 thiss!1248))) (bvsge (mask!7486 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2815 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2815 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2815 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2815 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2815 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2815 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2815 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!15578 res!73060) b!154832))

(assert (= (and b!154832 res!73064) b!154834))

(assert (= (and b!154834 res!73062) b!154838))

(assert (= (and b!154838 res!73061) b!154833))

(assert (= (and b!154833 res!73063) b!154831))

(assert (= (and b!154837 condMapEmpty!5207) mapIsEmpty!5207))

(assert (= (and b!154837 (not condMapEmpty!5207)) mapNonEmpty!5207))

(get-info :version)

(assert (= (and mapNonEmpty!5207 ((_ is ValueCellFull!1178) mapValue!5207)) b!154835))

(assert (= (and b!154837 ((_ is ValueCellFull!1178) mapDefault!5207)) b!154830))

(assert (= b!154836 b!154837))

(assert (= start!15578 b!154836))

(declare-fun m!188479 () Bool)

(assert (=> start!15578 m!188479))

(declare-fun m!188481 () Bool)

(assert (=> b!154833 m!188481))

(declare-fun m!188483 () Bool)

(assert (=> b!154831 m!188483))

(declare-fun m!188485 () Bool)

(assert (=> b!154834 m!188485))

(declare-fun m!188487 () Bool)

(assert (=> mapNonEmpty!5207 m!188487))

(declare-fun m!188489 () Bool)

(assert (=> b!154836 m!188489))

(declare-fun m!188491 () Bool)

(assert (=> b!154836 m!188491))

(check-sat (not b!154833) (not mapNonEmpty!5207) (not b!154831) b_and!9629 tp_is_empty!3043 (not start!15578) (not b!154834) (not b!154836) (not b_next!3241))
(check-sat b_and!9629 (not b_next!3241))
