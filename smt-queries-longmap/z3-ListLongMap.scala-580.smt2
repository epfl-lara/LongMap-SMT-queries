; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15626 () Bool)

(assert start!15626)

(declare-fun b!155483 () Bool)

(declare-fun b_free!3289 () Bool)

(declare-fun b_next!3289 () Bool)

(assert (=> b!155483 (= b_free!3289 (not b_next!3289))))

(declare-fun tp!12391 () Bool)

(declare-fun b_and!9677 () Bool)

(assert (=> b!155483 (= tp!12391 b_and!9677)))

(declare-fun b!155478 () Bool)

(declare-fun res!73421 () Bool)

(declare-fun e!101574 () Bool)

(assert (=> b!155478 (=> (not res!73421) (not e!101574))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155478 (= res!73421 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5279 () Bool)

(declare-fun mapRes!5279 () Bool)

(declare-fun tp!12392 () Bool)

(declare-fun e!101573 () Bool)

(assert (=> mapNonEmpty!5279 (= mapRes!5279 (and tp!12392 e!101573))))

(declare-datatypes ((V!3769 0))(
  ( (V!3770 (val!1590 Int)) )
))
(declare-datatypes ((ValueCell!1202 0))(
  ( (ValueCellFull!1202 (v!3449 V!3769)) (EmptyCell!1202) )
))
(declare-fun mapValue!5279 () ValueCell!1202)

(declare-fun mapKey!5279 () (_ BitVec 32))

(declare-datatypes ((array!5215 0))(
  ( (array!5216 (arr!2464 (Array (_ BitVec 32) (_ BitVec 64))) (size!2743 (_ BitVec 32))) )
))
(declare-datatypes ((array!5217 0))(
  ( (array!5218 (arr!2465 (Array (_ BitVec 32) ValueCell!1202)) (size!2744 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1312 0))(
  ( (LongMapFixedSize!1313 (defaultEntry!3098 Int) (mask!7526 (_ BitVec 32)) (extraKeys!2839 (_ BitVec 32)) (zeroValue!2941 V!3769) (minValue!2941 V!3769) (_size!705 (_ BitVec 32)) (_keys!4872 array!5215) (_values!3081 array!5217) (_vacant!705 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1312)

(declare-fun mapRest!5279 () (Array (_ BitVec 32) ValueCell!1202))

(assert (=> mapNonEmpty!5279 (= (arr!2465 (_values!3081 thiss!1248)) (store mapRest!5279 mapKey!5279 mapValue!5279))))

(declare-fun b!155479 () Bool)

(declare-fun tp_is_empty!3091 () Bool)

(assert (=> b!155479 (= e!101573 tp_is_empty!3091)))

(declare-fun b!155480 () Bool)

(declare-fun res!73424 () Bool)

(assert (=> b!155480 (=> (not res!73424) (not e!101574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5215 (_ BitVec 32)) Bool)

(assert (=> b!155480 (= res!73424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4872 thiss!1248) (mask!7526 thiss!1248)))))

(declare-fun b!155481 () Bool)

(assert (=> b!155481 (= e!101574 false)))

(declare-fun lt!81204 () Bool)

(declare-datatypes ((List!1831 0))(
  ( (Nil!1828) (Cons!1827 (h!2436 (_ BitVec 64)) (t!6624 List!1831)) )
))
(declare-fun arrayNoDuplicates!0 (array!5215 (_ BitVec 32) List!1831) Bool)

(assert (=> b!155481 (= lt!81204 (arrayNoDuplicates!0 (_keys!4872 thiss!1248) #b00000000000000000000000000000000 Nil!1828))))

(declare-fun b!155482 () Bool)

(declare-fun e!101575 () Bool)

(declare-fun e!101577 () Bool)

(assert (=> b!155482 (= e!101575 (and e!101577 mapRes!5279))))

(declare-fun condMapEmpty!5279 () Bool)

(declare-fun mapDefault!5279 () ValueCell!1202)

(assert (=> b!155482 (= condMapEmpty!5279 (= (arr!2465 (_values!3081 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1202)) mapDefault!5279)))))

(declare-fun mapIsEmpty!5279 () Bool)

(assert (=> mapIsEmpty!5279 mapRes!5279))

(declare-fun e!101578 () Bool)

(declare-fun array_inv!1581 (array!5215) Bool)

(declare-fun array_inv!1582 (array!5217) Bool)

(assert (=> b!155483 (= e!101578 (and tp!12391 tp_is_empty!3091 (array_inv!1581 (_keys!4872 thiss!1248)) (array_inv!1582 (_values!3081 thiss!1248)) e!101575))))

(declare-fun b!155484 () Bool)

(declare-fun res!73422 () Bool)

(assert (=> b!155484 (=> (not res!73422) (not e!101574))))

(assert (=> b!155484 (= res!73422 (and (= (size!2744 (_values!3081 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7526 thiss!1248))) (= (size!2743 (_keys!4872 thiss!1248)) (size!2744 (_values!3081 thiss!1248))) (bvsge (mask!7526 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2839 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2839 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2839 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2839 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2839 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2839 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2839 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155486 () Bool)

(declare-fun res!73423 () Bool)

(assert (=> b!155486 (=> (not res!73423) (not e!101574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155486 (= res!73423 (validMask!0 (mask!7526 thiss!1248)))))

(declare-fun res!73420 () Bool)

(assert (=> start!15626 (=> (not res!73420) (not e!101574))))

(declare-fun valid!645 (LongMapFixedSize!1312) Bool)

(assert (=> start!15626 (= res!73420 (valid!645 thiss!1248))))

(assert (=> start!15626 e!101574))

(assert (=> start!15626 e!101578))

(assert (=> start!15626 true))

(declare-fun b!155485 () Bool)

(assert (=> b!155485 (= e!101577 tp_is_empty!3091)))

(assert (= (and start!15626 res!73420) b!155478))

(assert (= (and b!155478 res!73421) b!155486))

(assert (= (and b!155486 res!73423) b!155484))

(assert (= (and b!155484 res!73422) b!155480))

(assert (= (and b!155480 res!73424) b!155481))

(assert (= (and b!155482 condMapEmpty!5279) mapIsEmpty!5279))

(assert (= (and b!155482 (not condMapEmpty!5279)) mapNonEmpty!5279))

(get-info :version)

(assert (= (and mapNonEmpty!5279 ((_ is ValueCellFull!1202) mapValue!5279)) b!155479))

(assert (= (and b!155482 ((_ is ValueCellFull!1202) mapDefault!5279)) b!155485))

(assert (= b!155483 b!155482))

(assert (= start!15626 b!155483))

(declare-fun m!188815 () Bool)

(assert (=> start!15626 m!188815))

(declare-fun m!188817 () Bool)

(assert (=> b!155483 m!188817))

(declare-fun m!188819 () Bool)

(assert (=> b!155483 m!188819))

(declare-fun m!188821 () Bool)

(assert (=> b!155481 m!188821))

(declare-fun m!188823 () Bool)

(assert (=> b!155480 m!188823))

(declare-fun m!188825 () Bool)

(assert (=> b!155486 m!188825))

(declare-fun m!188827 () Bool)

(assert (=> mapNonEmpty!5279 m!188827))

(check-sat (not b_next!3289) (not b!155481) (not b!155483) b_and!9677 (not mapNonEmpty!5279) tp_is_empty!3091 (not b!155480) (not start!15626) (not b!155486))
(check-sat b_and!9677 (not b_next!3289))
