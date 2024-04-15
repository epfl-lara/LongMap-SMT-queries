; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75414 () Bool)

(assert start!75414)

(declare-fun b!887737 () Bool)

(declare-fun b_free!15547 () Bool)

(declare-fun b_next!15547 () Bool)

(assert (=> b!887737 (= b_free!15547 (not b_next!15547))))

(declare-fun tp!54588 () Bool)

(declare-fun b_and!25757 () Bool)

(assert (=> b!887737 (= tp!54588 b_and!25757)))

(declare-fun mapIsEmpty!28345 () Bool)

(declare-fun mapRes!28345 () Bool)

(assert (=> mapIsEmpty!28345 mapRes!28345))

(declare-fun mapNonEmpty!28345 () Bool)

(declare-fun tp!54589 () Bool)

(declare-fun e!494542 () Bool)

(assert (=> mapNonEmpty!28345 (= mapRes!28345 (and tp!54589 e!494542))))

(declare-datatypes ((array!51701 0))(
  ( (array!51702 (arr!24863 (Array (_ BitVec 32) (_ BitVec 64))) (size!25305 (_ BitVec 32))) )
))
(declare-datatypes ((V!28799 0))(
  ( (V!28800 (val!8988 Int)) )
))
(declare-datatypes ((ValueCell!8456 0))(
  ( (ValueCellFull!8456 (v!11452 V!28799)) (EmptyCell!8456) )
))
(declare-datatypes ((array!51703 0))(
  ( (array!51704 (arr!24864 (Array (_ BitVec 32) ValueCell!8456)) (size!25306 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3928 0))(
  ( (LongMapFixedSize!3929 (defaultEntry!5155 Int) (mask!25558 (_ BitVec 32)) (extraKeys!4849 (_ BitVec 32)) (zeroValue!4953 V!28799) (minValue!4953 V!28799) (_size!2019 (_ BitVec 32)) (_keys!9827 array!51701) (_values!5140 array!51703) (_vacant!2019 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3928)

(declare-fun mapRest!28345 () (Array (_ BitVec 32) ValueCell!8456))

(declare-fun mapKey!28345 () (_ BitVec 32))

(declare-fun mapValue!28345 () ValueCell!8456)

(assert (=> mapNonEmpty!28345 (= (arr!24864 (_values!5140 thiss!1181)) (store mapRest!28345 mapKey!28345 mapValue!28345))))

(declare-fun tp_is_empty!17875 () Bool)

(declare-fun e!494543 () Bool)

(declare-fun e!494545 () Bool)

(declare-fun array_inv!19614 (array!51701) Bool)

(declare-fun array_inv!19615 (array!51703) Bool)

(assert (=> b!887737 (= e!494543 (and tp!54588 tp_is_empty!17875 (array_inv!19614 (_keys!9827 thiss!1181)) (array_inv!19615 (_values!5140 thiss!1181)) e!494545))))

(declare-fun b!887738 () Bool)

(declare-fun e!494544 () Bool)

(assert (=> b!887738 (= e!494545 (and e!494544 mapRes!28345))))

(declare-fun condMapEmpty!28345 () Bool)

(declare-fun mapDefault!28345 () ValueCell!8456)

(assert (=> b!887738 (= condMapEmpty!28345 (= (arr!24864 (_values!5140 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8456)) mapDefault!28345)))))

(declare-fun b!887739 () Bool)

(assert (=> b!887739 (= e!494542 tp_is_empty!17875)))

(declare-fun b!887740 () Bool)

(assert (=> b!887740 (= e!494544 tp_is_empty!17875)))

(declare-fun b!887741 () Bool)

(declare-fun e!494541 () Bool)

(assert (=> b!887741 (= e!494541 false)))

(declare-fun lt!401295 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4291 (LongMapFixedSize!3928 (_ BitVec 64)) Bool)

(assert (=> b!887741 (= lt!401295 (contains!4291 thiss!1181 key!785))))

(declare-fun res!602117 () Bool)

(assert (=> start!75414 (=> (not res!602117) (not e!494541))))

(declare-fun valid!1540 (LongMapFixedSize!3928) Bool)

(assert (=> start!75414 (= res!602117 (valid!1540 thiss!1181))))

(assert (=> start!75414 e!494541))

(assert (=> start!75414 e!494543))

(assert (=> start!75414 true))

(declare-fun b!887742 () Bool)

(declare-fun res!602118 () Bool)

(assert (=> b!887742 (=> (not res!602118) (not e!494541))))

(assert (=> b!887742 (= res!602118 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4849 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!75414 res!602117) b!887742))

(assert (= (and b!887742 res!602118) b!887741))

(assert (= (and b!887738 condMapEmpty!28345) mapIsEmpty!28345))

(assert (= (and b!887738 (not condMapEmpty!28345)) mapNonEmpty!28345))

(get-info :version)

(assert (= (and mapNonEmpty!28345 ((_ is ValueCellFull!8456) mapValue!28345)) b!887739))

(assert (= (and b!887738 ((_ is ValueCellFull!8456) mapDefault!28345)) b!887740))

(assert (= b!887737 b!887738))

(assert (= start!75414 b!887737))

(declare-fun m!826667 () Bool)

(assert (=> mapNonEmpty!28345 m!826667))

(declare-fun m!826669 () Bool)

(assert (=> b!887737 m!826669))

(declare-fun m!826671 () Bool)

(assert (=> b!887737 m!826671))

(declare-fun m!826673 () Bool)

(assert (=> b!887741 m!826673))

(declare-fun m!826675 () Bool)

(assert (=> start!75414 m!826675))

(check-sat (not b!887737) (not b_next!15547) tp_is_empty!17875 (not mapNonEmpty!28345) (not start!75414) b_and!25757 (not b!887741))
(check-sat b_and!25757 (not b_next!15547))
