; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75600 () Bool)

(assert start!75600)

(declare-fun b!888881 () Bool)

(declare-fun b_free!15547 () Bool)

(declare-fun b_next!15547 () Bool)

(assert (=> b!888881 (= b_free!15547 (not b_next!15547))))

(declare-fun tp!54588 () Bool)

(declare-fun b_and!25793 () Bool)

(assert (=> b!888881 (= tp!54588 b_and!25793)))

(declare-fun b!888879 () Bool)

(declare-fun e!495275 () Bool)

(declare-fun tp_is_empty!17875 () Bool)

(assert (=> b!888879 (= e!495275 tp_is_empty!17875)))

(declare-fun b!888880 () Bool)

(declare-fun res!602572 () Bool)

(declare-fun e!495273 () Bool)

(assert (=> b!888880 (=> (not res!602572) (not e!495273))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!51757 0))(
  ( (array!51758 (arr!24886 (Array (_ BitVec 32) (_ BitVec 64))) (size!25327 (_ BitVec 32))) )
))
(declare-datatypes ((V!28799 0))(
  ( (V!28800 (val!8988 Int)) )
))
(declare-datatypes ((ValueCell!8456 0))(
  ( (ValueCellFull!8456 (v!11457 V!28799)) (EmptyCell!8456) )
))
(declare-datatypes ((array!51759 0))(
  ( (array!51760 (arr!24887 (Array (_ BitVec 32) ValueCell!8456)) (size!25328 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3928 0))(
  ( (LongMapFixedSize!3929 (defaultEntry!5155 Int) (mask!25608 (_ BitVec 32)) (extraKeys!4849 (_ BitVec 32)) (zeroValue!4953 V!28799) (minValue!4953 V!28799) (_size!2019 (_ BitVec 32)) (_keys!9860 array!51757) (_values!5140 array!51759) (_vacant!2019 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3928)

(assert (=> b!888880 (= res!602572 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4849 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!28345 () Bool)

(declare-fun mapRes!28345 () Bool)

(assert (=> mapIsEmpty!28345 mapRes!28345))

(declare-fun e!495272 () Bool)

(declare-fun e!495270 () Bool)

(declare-fun array_inv!19620 (array!51757) Bool)

(declare-fun array_inv!19621 (array!51759) Bool)

(assert (=> b!888881 (= e!495270 (and tp!54588 tp_is_empty!17875 (array_inv!19620 (_keys!9860 thiss!1181)) (array_inv!19621 (_values!5140 thiss!1181)) e!495272))))

(declare-fun res!602571 () Bool)

(assert (=> start!75600 (=> (not res!602571) (not e!495273))))

(declare-fun valid!1542 (LongMapFixedSize!3928) Bool)

(assert (=> start!75600 (= res!602571 (valid!1542 thiss!1181))))

(assert (=> start!75600 e!495273))

(assert (=> start!75600 e!495270))

(assert (=> start!75600 true))

(declare-fun mapNonEmpty!28345 () Bool)

(declare-fun tp!54589 () Bool)

(declare-fun e!495274 () Bool)

(assert (=> mapNonEmpty!28345 (= mapRes!28345 (and tp!54589 e!495274))))

(declare-fun mapKey!28345 () (_ BitVec 32))

(declare-fun mapRest!28345 () (Array (_ BitVec 32) ValueCell!8456))

(declare-fun mapValue!28345 () ValueCell!8456)

(assert (=> mapNonEmpty!28345 (= (arr!24887 (_values!5140 thiss!1181)) (store mapRest!28345 mapKey!28345 mapValue!28345))))

(declare-fun b!888882 () Bool)

(assert (=> b!888882 (= e!495273 false)))

(declare-fun lt!401892 () Bool)

(declare-fun contains!4293 (LongMapFixedSize!3928 (_ BitVec 64)) Bool)

(assert (=> b!888882 (= lt!401892 (contains!4293 thiss!1181 key!785))))

(declare-fun b!888883 () Bool)

(assert (=> b!888883 (= e!495274 tp_is_empty!17875)))

(declare-fun b!888884 () Bool)

(assert (=> b!888884 (= e!495272 (and e!495275 mapRes!28345))))

(declare-fun condMapEmpty!28345 () Bool)

(declare-fun mapDefault!28345 () ValueCell!8456)

(assert (=> b!888884 (= condMapEmpty!28345 (= (arr!24887 (_values!5140 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8456)) mapDefault!28345)))))

(assert (= (and start!75600 res!602571) b!888880))

(assert (= (and b!888880 res!602572) b!888882))

(assert (= (and b!888884 condMapEmpty!28345) mapIsEmpty!28345))

(assert (= (and b!888884 (not condMapEmpty!28345)) mapNonEmpty!28345))

(get-info :version)

(assert (= (and mapNonEmpty!28345 ((_ is ValueCellFull!8456) mapValue!28345)) b!888883))

(assert (= (and b!888884 ((_ is ValueCellFull!8456) mapDefault!28345)) b!888879))

(assert (= b!888881 b!888884))

(assert (= start!75600 b!888881))

(declare-fun m!828719 () Bool)

(assert (=> b!888881 m!828719))

(declare-fun m!828721 () Bool)

(assert (=> b!888881 m!828721))

(declare-fun m!828723 () Bool)

(assert (=> start!75600 m!828723))

(declare-fun m!828725 () Bool)

(assert (=> mapNonEmpty!28345 m!828725))

(declare-fun m!828727 () Bool)

(assert (=> b!888882 m!828727))

(check-sat (not start!75600) (not mapNonEmpty!28345) tp_is_empty!17875 (not b_next!15547) b_and!25793 (not b!888881) (not b!888882))
(check-sat b_and!25793 (not b_next!15547))
