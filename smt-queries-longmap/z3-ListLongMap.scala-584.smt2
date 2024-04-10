; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15648 () Bool)

(assert start!15648)

(declare-fun b!155925 () Bool)

(declare-fun b_free!3315 () Bool)

(declare-fun b_next!3315 () Bool)

(assert (=> b!155925 (= b_free!3315 (not b_next!3315))))

(declare-fun tp!12470 () Bool)

(declare-fun b_and!9729 () Bool)

(assert (=> b!155925 (= tp!12470 b_and!9729)))

(declare-fun b!155921 () Bool)

(declare-fun e!101922 () Bool)

(declare-fun e!101927 () Bool)

(declare-fun mapRes!5318 () Bool)

(assert (=> b!155921 (= e!101922 (and e!101927 mapRes!5318))))

(declare-fun condMapEmpty!5318 () Bool)

(declare-datatypes ((V!3803 0))(
  ( (V!3804 (val!1603 Int)) )
))
(declare-datatypes ((ValueCell!1215 0))(
  ( (ValueCellFull!1215 (v!3468 V!3803)) (EmptyCell!1215) )
))
(declare-datatypes ((array!5287 0))(
  ( (array!5288 (arr!2501 (Array (_ BitVec 32) (_ BitVec 64))) (size!2779 (_ BitVec 32))) )
))
(declare-datatypes ((array!5289 0))(
  ( (array!5290 (arr!2502 (Array (_ BitVec 32) ValueCell!1215)) (size!2780 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1338 0))(
  ( (LongMapFixedSize!1339 (defaultEntry!3111 Int) (mask!7548 (_ BitVec 32)) (extraKeys!2852 (_ BitVec 32)) (zeroValue!2954 V!3803) (minValue!2954 V!3803) (_size!718 (_ BitVec 32)) (_keys!4886 array!5287) (_values!3094 array!5289) (_vacant!718 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1338)

(declare-fun mapDefault!5318 () ValueCell!1215)

(assert (=> b!155921 (= condMapEmpty!5318 (= (arr!2502 (_values!3094 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1215)) mapDefault!5318)))))

(declare-fun res!73655 () Bool)

(declare-fun e!101923 () Bool)

(assert (=> start!15648 (=> (not res!73655) (not e!101923))))

(declare-fun valid!651 (LongMapFixedSize!1338) Bool)

(assert (=> start!15648 (= res!73655 (valid!651 thiss!1248))))

(assert (=> start!15648 e!101923))

(declare-fun e!101925 () Bool)

(assert (=> start!15648 e!101925))

(assert (=> start!15648 true))

(declare-fun tp_is_empty!3117 () Bool)

(assert (=> start!15648 tp_is_empty!3117))

(declare-fun b!155922 () Bool)

(declare-fun res!73656 () Bool)

(assert (=> b!155922 (=> (not res!73656) (not e!101923))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155922 (= res!73656 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155923 () Bool)

(declare-fun e!101926 () Bool)

(assert (=> b!155923 (= e!101926 tp_is_empty!3117)))

(declare-fun b!155924 () Bool)

(declare-fun e!101924 () Bool)

(assert (=> b!155924 (= e!101924 true)))

(declare-fun lt!81463 () Bool)

(declare-fun lt!81462 () LongMapFixedSize!1338)

(declare-datatypes ((tuple2!2840 0))(
  ( (tuple2!2841 (_1!1431 (_ BitVec 64)) (_2!1431 V!3803)) )
))
(declare-datatypes ((List!1838 0))(
  ( (Nil!1835) (Cons!1834 (h!2443 tuple2!2840) (t!6640 List!1838)) )
))
(declare-datatypes ((ListLongMap!1827 0))(
  ( (ListLongMap!1828 (toList!929 List!1838)) )
))
(declare-fun contains!973 (ListLongMap!1827 (_ BitVec 64)) Bool)

(declare-fun map!1536 (LongMapFixedSize!1338) ListLongMap!1827)

(assert (=> b!155924 (= lt!81463 (contains!973 (map!1536 lt!81462) key!828))))

(declare-fun array_inv!1579 (array!5287) Bool)

(declare-fun array_inv!1580 (array!5289) Bool)

(assert (=> b!155925 (= e!101925 (and tp!12470 tp_is_empty!3117 (array_inv!1579 (_keys!4886 thiss!1248)) (array_inv!1580 (_values!3094 thiss!1248)) e!101922))))

(declare-fun b!155926 () Bool)

(assert (=> b!155926 (= e!101927 tp_is_empty!3117)))

(declare-fun mapNonEmpty!5318 () Bool)

(declare-fun tp!12469 () Bool)

(assert (=> mapNonEmpty!5318 (= mapRes!5318 (and tp!12469 e!101926))))

(declare-fun mapValue!5318 () ValueCell!1215)

(declare-fun mapRest!5318 () (Array (_ BitVec 32) ValueCell!1215))

(declare-fun mapKey!5318 () (_ BitVec 32))

(assert (=> mapNonEmpty!5318 (= (arr!2502 (_values!3094 thiss!1248)) (store mapRest!5318 mapKey!5318 mapValue!5318))))

(declare-fun b!155927 () Bool)

(assert (=> b!155927 (= e!101923 (not e!101924))))

(declare-fun res!73657 () Bool)

(assert (=> b!155927 (=> res!73657 e!101924)))

(assert (=> b!155927 (= res!73657 (not (valid!651 lt!81462)))))

(declare-fun v!309 () V!3803)

(assert (=> b!155927 (= lt!81462 (LongMapFixedSize!1339 (defaultEntry!3111 thiss!1248) (mask!7548 thiss!1248) (bvor (extraKeys!2852 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2954 thiss!1248) (_size!718 thiss!1248) (_keys!4886 thiss!1248) (_values!3094 thiss!1248) (_vacant!718 thiss!1248)))))

(declare-fun +!197 (ListLongMap!1827 tuple2!2840) ListLongMap!1827)

(declare-fun getCurrentListMap!593 (array!5287 array!5289 (_ BitVec 32) (_ BitVec 32) V!3803 V!3803 (_ BitVec 32) Int) ListLongMap!1827)

(assert (=> b!155927 (= (+!197 (getCurrentListMap!593 (_keys!4886 thiss!1248) (_values!3094 thiss!1248) (mask!7548 thiss!1248) (extraKeys!2852 thiss!1248) (zeroValue!2954 thiss!1248) (minValue!2954 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3111 thiss!1248)) (tuple2!2841 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!593 (_keys!4886 thiss!1248) (_values!3094 thiss!1248) (mask!7548 thiss!1248) (bvor (extraKeys!2852 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2954 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3111 thiss!1248)))))

(declare-datatypes ((Unit!4938 0))(
  ( (Unit!4939) )
))
(declare-fun lt!81461 () Unit!4938)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!76 (array!5287 array!5289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3803 V!3803 V!3803 Int) Unit!4938)

(assert (=> b!155927 (= lt!81461 (lemmaChangeZeroKeyThenAddPairToListMap!76 (_keys!4886 thiss!1248) (_values!3094 thiss!1248) (mask!7548 thiss!1248) (extraKeys!2852 thiss!1248) (bvor (extraKeys!2852 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2954 thiss!1248) v!309 (minValue!2954 thiss!1248) (defaultEntry!3111 thiss!1248)))))

(declare-fun mapIsEmpty!5318 () Bool)

(assert (=> mapIsEmpty!5318 mapRes!5318))

(assert (= (and start!15648 res!73655) b!155922))

(assert (= (and b!155922 res!73656) b!155927))

(assert (= (and b!155927 (not res!73657)) b!155924))

(assert (= (and b!155921 condMapEmpty!5318) mapIsEmpty!5318))

(assert (= (and b!155921 (not condMapEmpty!5318)) mapNonEmpty!5318))

(get-info :version)

(assert (= (and mapNonEmpty!5318 ((_ is ValueCellFull!1215) mapValue!5318)) b!155923))

(assert (= (and b!155921 ((_ is ValueCellFull!1215) mapDefault!5318)) b!155926))

(assert (= b!155925 b!155921))

(assert (= start!15648 b!155925))

(declare-fun m!189661 () Bool)

(assert (=> b!155927 m!189661))

(declare-fun m!189663 () Bool)

(assert (=> b!155927 m!189663))

(declare-fun m!189665 () Bool)

(assert (=> b!155927 m!189665))

(declare-fun m!189667 () Bool)

(assert (=> b!155927 m!189667))

(assert (=> b!155927 m!189663))

(declare-fun m!189669 () Bool)

(assert (=> b!155927 m!189669))

(declare-fun m!189671 () Bool)

(assert (=> b!155925 m!189671))

(declare-fun m!189673 () Bool)

(assert (=> b!155925 m!189673))

(declare-fun m!189675 () Bool)

(assert (=> mapNonEmpty!5318 m!189675))

(declare-fun m!189677 () Bool)

(assert (=> b!155924 m!189677))

(assert (=> b!155924 m!189677))

(declare-fun m!189679 () Bool)

(assert (=> b!155924 m!189679))

(declare-fun m!189681 () Bool)

(assert (=> start!15648 m!189681))

(check-sat tp_is_empty!3117 (not mapNonEmpty!5318) (not start!15648) b_and!9729 (not b_next!3315) (not b!155927) (not b!155925) (not b!155924))
(check-sat b_and!9729 (not b_next!3315))
