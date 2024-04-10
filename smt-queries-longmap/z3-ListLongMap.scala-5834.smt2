; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75308 () Bool)

(assert start!75308)

(declare-fun b!887162 () Bool)

(declare-fun b_free!15507 () Bool)

(declare-fun b_next!15507 () Bool)

(assert (=> b!887162 (= b_free!15507 (not b_next!15507))))

(declare-fun tp!54455 () Bool)

(declare-fun b_and!25713 () Bool)

(assert (=> b!887162 (= tp!54455 b_and!25713)))

(declare-fun mapIsEmpty!28272 () Bool)

(declare-fun mapRes!28272 () Bool)

(assert (=> mapIsEmpty!28272 mapRes!28272))

(declare-fun b!887157 () Bool)

(declare-fun e!493992 () Bool)

(declare-fun e!493990 () Bool)

(assert (=> b!887157 (= e!493992 (and e!493990 mapRes!28272))))

(declare-fun condMapEmpty!28272 () Bool)

(declare-datatypes ((V!28745 0))(
  ( (V!28746 (val!8968 Int)) )
))
(declare-datatypes ((ValueCell!8436 0))(
  ( (ValueCellFull!8436 (v!11416 V!28745)) (EmptyCell!8436) )
))
(declare-datatypes ((array!51630 0))(
  ( (array!51631 (arr!24831 (Array (_ BitVec 32) ValueCell!8436)) (size!25271 (_ BitVec 32))) )
))
(declare-datatypes ((array!51632 0))(
  ( (array!51633 (arr!24832 (Array (_ BitVec 32) (_ BitVec 64))) (size!25272 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3888 0))(
  ( (LongMapFixedSize!3889 (defaultEntry!5132 Int) (mask!25525 (_ BitVec 32)) (extraKeys!4825 (_ BitVec 32)) (zeroValue!4929 V!28745) (minValue!4929 V!28745) (_size!1999 (_ BitVec 32)) (_keys!9807 array!51632) (_values!5116 array!51630) (_vacant!1999 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1048 0))(
  ( (Cell!1049 (v!11417 LongMapFixedSize!3888)) )
))
(declare-datatypes ((LongMap!1048 0))(
  ( (LongMap!1049 (underlying!535 Cell!1048)) )
))
(declare-fun thiss!833 () LongMap!1048)

(declare-fun mapDefault!28272 () ValueCell!8436)

(assert (=> b!887157 (= condMapEmpty!28272 (= (arr!24831 (_values!5116 (v!11417 (underlying!535 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8436)) mapDefault!28272)))))

(declare-fun res!602068 () Bool)

(declare-fun e!493986 () Bool)

(assert (=> start!75308 (=> (not res!602068) (not e!493986))))

(declare-fun valid!1515 (LongMap!1048) Bool)

(assert (=> start!75308 (= res!602068 (valid!1515 thiss!833))))

(assert (=> start!75308 e!493986))

(declare-fun e!493989 () Bool)

(assert (=> start!75308 e!493989))

(assert (=> start!75308 true))

(declare-fun b!887158 () Bool)

(declare-fun tp_is_empty!17835 () Bool)

(assert (=> b!887158 (= e!493990 tp_is_empty!17835)))

(declare-fun b!887159 () Bool)

(declare-fun e!493988 () Bool)

(assert (=> b!887159 (= e!493988 tp_is_empty!17835)))

(declare-fun b!887160 () Bool)

(declare-fun e!493987 () Bool)

(assert (=> b!887160 (= e!493989 e!493987)))

(declare-fun b!887161 () Bool)

(assert (=> b!887161 (= e!493986 false)))

(declare-fun lt!401202 () Bool)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun contains!4302 (LongMap!1048 (_ BitVec 64)) Bool)

(assert (=> b!887161 (= lt!401202 (contains!4302 thiss!833 key!673))))

(declare-fun lt!401203 () V!28745)

(declare-fun apply!390 (LongMapFixedSize!3888 (_ BitVec 64)) V!28745)

(assert (=> b!887161 (= lt!401203 (apply!390 (v!11417 (underlying!535 thiss!833)) key!673))))

(declare-fun e!493991 () Bool)

(declare-fun array_inv!19546 (array!51632) Bool)

(declare-fun array_inv!19547 (array!51630) Bool)

(assert (=> b!887162 (= e!493991 (and tp!54455 tp_is_empty!17835 (array_inv!19546 (_keys!9807 (v!11417 (underlying!535 thiss!833)))) (array_inv!19547 (_values!5116 (v!11417 (underlying!535 thiss!833)))) e!493992))))

(declare-fun b!887163 () Bool)

(assert (=> b!887163 (= e!493987 e!493991)))

(declare-fun mapNonEmpty!28272 () Bool)

(declare-fun tp!54454 () Bool)

(assert (=> mapNonEmpty!28272 (= mapRes!28272 (and tp!54454 e!493988))))

(declare-fun mapValue!28272 () ValueCell!8436)

(declare-fun mapRest!28272 () (Array (_ BitVec 32) ValueCell!8436))

(declare-fun mapKey!28272 () (_ BitVec 32))

(assert (=> mapNonEmpty!28272 (= (arr!24831 (_values!5116 (v!11417 (underlying!535 thiss!833)))) (store mapRest!28272 mapKey!28272 mapValue!28272))))

(assert (= (and start!75308 res!602068) b!887161))

(assert (= (and b!887157 condMapEmpty!28272) mapIsEmpty!28272))

(assert (= (and b!887157 (not condMapEmpty!28272)) mapNonEmpty!28272))

(get-info :version)

(assert (= (and mapNonEmpty!28272 ((_ is ValueCellFull!8436) mapValue!28272)) b!887159))

(assert (= (and b!887157 ((_ is ValueCellFull!8436) mapDefault!28272)) b!887158))

(assert (= b!887162 b!887157))

(assert (= b!887163 b!887162))

(assert (= b!887160 b!887163))

(assert (= start!75308 b!887160))

(declare-fun m!826883 () Bool)

(assert (=> start!75308 m!826883))

(declare-fun m!826885 () Bool)

(assert (=> b!887161 m!826885))

(declare-fun m!826887 () Bool)

(assert (=> b!887161 m!826887))

(declare-fun m!826889 () Bool)

(assert (=> b!887162 m!826889))

(declare-fun m!826891 () Bool)

(assert (=> b!887162 m!826891))

(declare-fun m!826893 () Bool)

(assert (=> mapNonEmpty!28272 m!826893))

(check-sat (not b_next!15507) (not b!887161) (not mapNonEmpty!28272) b_and!25713 (not b!887162) tp_is_empty!17835 (not start!75308))
(check-sat b_and!25713 (not b_next!15507))
