; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16968 () Bool)

(assert start!16968)

(declare-fun b!170595 () Bool)

(declare-fun b_free!4215 () Bool)

(declare-fun b_next!4215 () Bool)

(assert (=> b!170595 (= b_free!4215 (not b_next!4215))))

(declare-fun tp!15268 () Bool)

(declare-fun b_and!10629 () Bool)

(assert (=> b!170595 (= tp!15268 b_and!10629)))

(declare-fun b!170590 () Bool)

(declare-fun e!112595 () Bool)

(declare-fun tp_is_empty!3987 () Bool)

(assert (=> b!170590 (= e!112595 tp_is_empty!3987)))

(declare-fun mapNonEmpty!6767 () Bool)

(declare-fun mapRes!6767 () Bool)

(declare-fun tp!15269 () Bool)

(declare-fun e!112591 () Bool)

(assert (=> mapNonEmpty!6767 (= mapRes!6767 (and tp!15269 e!112591))))

(declare-datatypes ((V!4963 0))(
  ( (V!4964 (val!2038 Int)) )
))
(declare-datatypes ((ValueCell!1650 0))(
  ( (ValueCellFull!1650 (v!3903 V!4963)) (EmptyCell!1650) )
))
(declare-fun mapValue!6767 () ValueCell!1650)

(declare-datatypes ((array!7083 0))(
  ( (array!7084 (arr!3371 (Array (_ BitVec 32) (_ BitVec 64))) (size!3664 (_ BitVec 32))) )
))
(declare-datatypes ((array!7085 0))(
  ( (array!7086 (arr!3372 (Array (_ BitVec 32) ValueCell!1650)) (size!3665 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2208 0))(
  ( (LongMapFixedSize!2209 (defaultEntry!3546 Int) (mask!8364 (_ BitVec 32)) (extraKeys!3287 (_ BitVec 32)) (zeroValue!3389 V!4963) (minValue!3389 V!4963) (_size!1153 (_ BitVec 32)) (_keys!5376 array!7083) (_values!3529 array!7085) (_vacant!1153 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2208)

(declare-fun mapKey!6767 () (_ BitVec 32))

(declare-fun mapRest!6767 () (Array (_ BitVec 32) ValueCell!1650))

(assert (=> mapNonEmpty!6767 (= (arr!3372 (_values!3529 thiss!1248)) (store mapRest!6767 mapKey!6767 mapValue!6767))))

(declare-fun b!170591 () Bool)

(declare-fun res!81090 () Bool)

(declare-fun e!112596 () Bool)

(assert (=> b!170591 (=> (not res!81090) (not e!112596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170591 (= res!81090 (validMask!0 (mask!8364 thiss!1248)))))

(declare-fun b!170592 () Bool)

(assert (=> b!170592 (= e!112591 tp_is_empty!3987)))

(declare-fun b!170593 () Bool)

(assert (=> b!170593 (= e!112596 (and (= (size!3665 (_values!3529 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8364 thiss!1248))) (= (size!3664 (_keys!5376 thiss!1248)) (size!3665 (_values!3529 thiss!1248))) (bvsge (mask!8364 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3287 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3287 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3287 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3287 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3287 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3287 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (= (bvand (bvor (extraKeys!3287 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6767 () Bool)

(assert (=> mapIsEmpty!6767 mapRes!6767))

(declare-fun res!81089 () Bool)

(assert (=> start!16968 (=> (not res!81089) (not e!112596))))

(declare-fun valid!941 (LongMapFixedSize!2208) Bool)

(assert (=> start!16968 (= res!81089 (valid!941 thiss!1248))))

(assert (=> start!16968 e!112596))

(declare-fun e!112593 () Bool)

(assert (=> start!16968 e!112593))

(assert (=> start!16968 true))

(declare-fun b!170594 () Bool)

(declare-fun e!112594 () Bool)

(assert (=> b!170594 (= e!112594 (and e!112595 mapRes!6767))))

(declare-fun condMapEmpty!6767 () Bool)

(declare-fun mapDefault!6767 () ValueCell!1650)

(assert (=> b!170594 (= condMapEmpty!6767 (= (arr!3372 (_values!3529 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1650)) mapDefault!6767)))))

(declare-fun array_inv!2155 (array!7083) Bool)

(declare-fun array_inv!2156 (array!7085) Bool)

(assert (=> b!170595 (= e!112593 (and tp!15268 tp_is_empty!3987 (array_inv!2155 (_keys!5376 thiss!1248)) (array_inv!2156 (_values!3529 thiss!1248)) e!112594))))

(declare-fun b!170596 () Bool)

(declare-fun res!81088 () Bool)

(assert (=> b!170596 (=> (not res!81088) (not e!112596))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170596 (= res!81088 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!16968 res!81089) b!170596))

(assert (= (and b!170596 res!81088) b!170591))

(assert (= (and b!170591 res!81090) b!170593))

(assert (= (and b!170594 condMapEmpty!6767) mapIsEmpty!6767))

(assert (= (and b!170594 (not condMapEmpty!6767)) mapNonEmpty!6767))

(get-info :version)

(assert (= (and mapNonEmpty!6767 ((_ is ValueCellFull!1650) mapValue!6767)) b!170592))

(assert (= (and b!170594 ((_ is ValueCellFull!1650) mapDefault!6767)) b!170590))

(assert (= b!170595 b!170594))

(assert (= start!16968 b!170595))

(declare-fun m!199023 () Bool)

(assert (=> mapNonEmpty!6767 m!199023))

(declare-fun m!199025 () Bool)

(assert (=> b!170591 m!199025))

(declare-fun m!199027 () Bool)

(assert (=> start!16968 m!199027))

(declare-fun m!199029 () Bool)

(assert (=> b!170595 m!199029))

(declare-fun m!199031 () Bool)

(assert (=> b!170595 m!199031))

(check-sat (not b!170591) (not b_next!4215) b_and!10629 tp_is_empty!3987 (not mapNonEmpty!6767) (not start!16968) (not b!170595))
(check-sat b_and!10629 (not b_next!4215))
