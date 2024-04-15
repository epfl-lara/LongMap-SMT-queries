; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15638 () Bool)

(assert start!15638)

(declare-fun b!155636 () Bool)

(declare-fun b_free!3301 () Bool)

(declare-fun b_next!3301 () Bool)

(assert (=> b!155636 (= b_free!3301 (not b_next!3301))))

(declare-fun tp!12427 () Bool)

(declare-fun b_and!9689 () Bool)

(assert (=> b!155636 (= tp!12427 b_and!9689)))

(declare-fun res!73505 () Bool)

(declare-fun e!101686 () Bool)

(assert (=> start!15638 (=> (not res!73505) (not e!101686))))

(declare-datatypes ((V!3785 0))(
  ( (V!3786 (val!1596 Int)) )
))
(declare-datatypes ((ValueCell!1208 0))(
  ( (ValueCellFull!1208 (v!3455 V!3785)) (EmptyCell!1208) )
))
(declare-datatypes ((array!5239 0))(
  ( (array!5240 (arr!2476 (Array (_ BitVec 32) (_ BitVec 64))) (size!2755 (_ BitVec 32))) )
))
(declare-datatypes ((array!5241 0))(
  ( (array!5242 (arr!2477 (Array (_ BitVec 32) ValueCell!1208)) (size!2756 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1324 0))(
  ( (LongMapFixedSize!1325 (defaultEntry!3104 Int) (mask!7536 (_ BitVec 32)) (extraKeys!2845 (_ BitVec 32)) (zeroValue!2947 V!3785) (minValue!2947 V!3785) (_size!711 (_ BitVec 32)) (_keys!4878 array!5239) (_values!3087 array!5241) (_vacant!711 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1324)

(declare-fun valid!650 (LongMapFixedSize!1324) Bool)

(assert (=> start!15638 (= res!73505 (valid!650 thiss!1248))))

(assert (=> start!15638 e!101686))

(declare-fun e!101684 () Bool)

(assert (=> start!15638 e!101684))

(assert (=> start!15638 true))

(declare-fun tp_is_empty!3103 () Bool)

(assert (=> start!15638 tp_is_empty!3103))

(declare-fun b!155634 () Bool)

(declare-fun e!101683 () Bool)

(assert (=> b!155634 (= e!101683 tp_is_empty!3103)))

(declare-fun b!155635 () Bool)

(assert (=> b!155635 (= e!101686 (not true))))

(declare-fun lt!81225 () Bool)

(declare-fun v!309 () V!3785)

(assert (=> b!155635 (= lt!81225 (valid!650 (LongMapFixedSize!1325 (defaultEntry!3104 thiss!1248) (mask!7536 thiss!1248) (bvor (extraKeys!2845 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2947 thiss!1248) (_size!711 thiss!1248) (_keys!4878 thiss!1248) (_values!3087 thiss!1248) (_vacant!711 thiss!1248))))))

(declare-datatypes ((tuple2!2806 0))(
  ( (tuple2!2807 (_1!1414 (_ BitVec 64)) (_2!1414 V!3785)) )
))
(declare-datatypes ((List!1834 0))(
  ( (Nil!1831) (Cons!1830 (h!2439 tuple2!2806) (t!6627 List!1834)) )
))
(declare-datatypes ((ListLongMap!1793 0))(
  ( (ListLongMap!1794 (toList!912 List!1834)) )
))
(declare-fun +!182 (ListLongMap!1793 tuple2!2806) ListLongMap!1793)

(declare-fun getCurrentListMap!563 (array!5239 array!5241 (_ BitVec 32) (_ BitVec 32) V!3785 V!3785 (_ BitVec 32) Int) ListLongMap!1793)

(assert (=> b!155635 (= (+!182 (getCurrentListMap!563 (_keys!4878 thiss!1248) (_values!3087 thiss!1248) (mask!7536 thiss!1248) (extraKeys!2845 thiss!1248) (zeroValue!2947 thiss!1248) (minValue!2947 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3104 thiss!1248)) (tuple2!2807 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!563 (_keys!4878 thiss!1248) (_values!3087 thiss!1248) (mask!7536 thiss!1248) (bvor (extraKeys!2845 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2947 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3104 thiss!1248)))))

(declare-datatypes ((Unit!4918 0))(
  ( (Unit!4919) )
))
(declare-fun lt!81224 () Unit!4918)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!72 (array!5239 array!5241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3785 V!3785 V!3785 Int) Unit!4918)

(assert (=> b!155635 (= lt!81224 (lemmaChangeZeroKeyThenAddPairToListMap!72 (_keys!4878 thiss!1248) (_values!3087 thiss!1248) (mask!7536 thiss!1248) (extraKeys!2845 thiss!1248) (bvor (extraKeys!2845 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2947 thiss!1248) v!309 (minValue!2947 thiss!1248) (defaultEntry!3104 thiss!1248)))))

(declare-fun e!101682 () Bool)

(declare-fun array_inv!1589 (array!5239) Bool)

(declare-fun array_inv!1590 (array!5241) Bool)

(assert (=> b!155636 (= e!101684 (and tp!12427 tp_is_empty!3103 (array_inv!1589 (_keys!4878 thiss!1248)) (array_inv!1590 (_values!3087 thiss!1248)) e!101682))))

(declare-fun b!155637 () Bool)

(declare-fun e!101681 () Bool)

(assert (=> b!155637 (= e!101681 tp_is_empty!3103)))

(declare-fun b!155638 () Bool)

(declare-fun res!73504 () Bool)

(assert (=> b!155638 (=> (not res!73504) (not e!101686))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155638 (= res!73504 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!5297 () Bool)

(declare-fun mapRes!5297 () Bool)

(assert (=> mapIsEmpty!5297 mapRes!5297))

(declare-fun b!155639 () Bool)

(assert (=> b!155639 (= e!101682 (and e!101681 mapRes!5297))))

(declare-fun condMapEmpty!5297 () Bool)

(declare-fun mapDefault!5297 () ValueCell!1208)

(assert (=> b!155639 (= condMapEmpty!5297 (= (arr!2477 (_values!3087 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1208)) mapDefault!5297)))))

(declare-fun mapNonEmpty!5297 () Bool)

(declare-fun tp!12428 () Bool)

(assert (=> mapNonEmpty!5297 (= mapRes!5297 (and tp!12428 e!101683))))

(declare-fun mapValue!5297 () ValueCell!1208)

(declare-fun mapRest!5297 () (Array (_ BitVec 32) ValueCell!1208))

(declare-fun mapKey!5297 () (_ BitVec 32))

(assert (=> mapNonEmpty!5297 (= (arr!2477 (_values!3087 thiss!1248)) (store mapRest!5297 mapKey!5297 mapValue!5297))))

(assert (= (and start!15638 res!73505) b!155638))

(assert (= (and b!155638 res!73504) b!155635))

(assert (= (and b!155639 condMapEmpty!5297) mapIsEmpty!5297))

(assert (= (and b!155639 (not condMapEmpty!5297)) mapNonEmpty!5297))

(get-info :version)

(assert (= (and mapNonEmpty!5297 ((_ is ValueCellFull!1208) mapValue!5297)) b!155634))

(assert (= (and b!155639 ((_ is ValueCellFull!1208) mapDefault!5297)) b!155637))

(assert (= b!155636 b!155639))

(assert (= start!15638 b!155636))

(declare-fun m!188899 () Bool)

(assert (=> start!15638 m!188899))

(declare-fun m!188901 () Bool)

(assert (=> b!155635 m!188901))

(declare-fun m!188903 () Bool)

(assert (=> b!155635 m!188903))

(assert (=> b!155635 m!188901))

(declare-fun m!188905 () Bool)

(assert (=> b!155635 m!188905))

(declare-fun m!188907 () Bool)

(assert (=> b!155635 m!188907))

(declare-fun m!188909 () Bool)

(assert (=> b!155635 m!188909))

(declare-fun m!188911 () Bool)

(assert (=> b!155636 m!188911))

(declare-fun m!188913 () Bool)

(assert (=> b!155636 m!188913))

(declare-fun m!188915 () Bool)

(assert (=> mapNonEmpty!5297 m!188915))

(check-sat (not mapNonEmpty!5297) (not b!155636) (not b_next!3301) b_and!9689 (not start!15638) (not b!155635) tp_is_empty!3103)
(check-sat b_and!9689 (not b_next!3301))
