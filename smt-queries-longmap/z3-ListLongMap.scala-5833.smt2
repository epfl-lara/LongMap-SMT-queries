; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75302 () Bool)

(assert start!75302)

(declare-fun b!887100 () Bool)

(declare-fun b_free!15501 () Bool)

(declare-fun b_next!15501 () Bool)

(assert (=> b!887100 (= b_free!15501 (not b_next!15501))))

(declare-fun tp!54436 () Bool)

(declare-fun b_and!25707 () Bool)

(assert (=> b!887100 (= tp!54436 b_and!25707)))

(declare-fun b!887094 () Bool)

(declare-fun e!493913 () Bool)

(declare-fun e!493916 () Bool)

(assert (=> b!887094 (= e!493913 e!493916)))

(declare-fun b!887095 () Bool)

(declare-fun e!493917 () Bool)

(declare-fun tp_is_empty!17829 () Bool)

(assert (=> b!887095 (= e!493917 tp_is_empty!17829)))

(declare-fun b!887096 () Bool)

(declare-fun e!493914 () Bool)

(assert (=> b!887096 (= e!493914 tp_is_empty!17829)))

(declare-fun mapNonEmpty!28263 () Bool)

(declare-fun mapRes!28263 () Bool)

(declare-fun tp!54437 () Bool)

(assert (=> mapNonEmpty!28263 (= mapRes!28263 (and tp!54437 e!493917))))

(declare-fun mapKey!28263 () (_ BitVec 32))

(declare-datatypes ((V!28737 0))(
  ( (V!28738 (val!8965 Int)) )
))
(declare-datatypes ((ValueCell!8433 0))(
  ( (ValueCellFull!8433 (v!11410 V!28737)) (EmptyCell!8433) )
))
(declare-datatypes ((array!51618 0))(
  ( (array!51619 (arr!24825 (Array (_ BitVec 32) ValueCell!8433)) (size!25265 (_ BitVec 32))) )
))
(declare-datatypes ((array!51620 0))(
  ( (array!51621 (arr!24826 (Array (_ BitVec 32) (_ BitVec 64))) (size!25266 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3882 0))(
  ( (LongMapFixedSize!3883 (defaultEntry!5129 Int) (mask!25520 (_ BitVec 32)) (extraKeys!4822 (_ BitVec 32)) (zeroValue!4926 V!28737) (minValue!4926 V!28737) (_size!1996 (_ BitVec 32)) (_keys!9804 array!51620) (_values!5113 array!51618) (_vacant!1996 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1042 0))(
  ( (Cell!1043 (v!11411 LongMapFixedSize!3882)) )
))
(declare-datatypes ((LongMap!1042 0))(
  ( (LongMap!1043 (underlying!532 Cell!1042)) )
))
(declare-fun thiss!833 () LongMap!1042)

(declare-fun mapRest!28263 () (Array (_ BitVec 32) ValueCell!8433))

(declare-fun mapValue!28263 () ValueCell!8433)

(assert (=> mapNonEmpty!28263 (= (arr!24825 (_values!5113 (v!11411 (underlying!532 thiss!833)))) (store mapRest!28263 mapKey!28263 mapValue!28263))))

(declare-fun b!887097 () Bool)

(declare-fun e!493915 () Bool)

(assert (=> b!887097 (= e!493915 false)))

(declare-fun lt!401188 () V!28737)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun apply!388 (LongMapFixedSize!3882 (_ BitVec 64)) V!28737)

(assert (=> b!887097 (= lt!401188 (apply!388 (v!11411 (underlying!532 thiss!833)) key!673))))

(declare-fun b!887098 () Bool)

(declare-fun e!493918 () Bool)

(assert (=> b!887098 (= e!493918 (and e!493914 mapRes!28263))))

(declare-fun condMapEmpty!28263 () Bool)

(declare-fun mapDefault!28263 () ValueCell!8433)

(assert (=> b!887098 (= condMapEmpty!28263 (= (arr!24825 (_values!5113 (v!11411 (underlying!532 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8433)) mapDefault!28263)))))

(declare-fun b!887099 () Bool)

(declare-fun e!493919 () Bool)

(assert (=> b!887099 (= e!493916 e!493919)))

(declare-fun array_inv!19544 (array!51620) Bool)

(declare-fun array_inv!19545 (array!51618) Bool)

(assert (=> b!887100 (= e!493919 (and tp!54436 tp_is_empty!17829 (array_inv!19544 (_keys!9804 (v!11411 (underlying!532 thiss!833)))) (array_inv!19545 (_values!5113 (v!11411 (underlying!532 thiss!833)))) e!493918))))

(declare-fun res!602059 () Bool)

(assert (=> start!75302 (=> (not res!602059) (not e!493915))))

(declare-fun valid!1513 (LongMap!1042) Bool)

(assert (=> start!75302 (= res!602059 (valid!1513 thiss!833))))

(assert (=> start!75302 e!493915))

(assert (=> start!75302 e!493913))

(assert (=> start!75302 true))

(declare-fun mapIsEmpty!28263 () Bool)

(assert (=> mapIsEmpty!28263 mapRes!28263))

(assert (= (and start!75302 res!602059) b!887097))

(assert (= (and b!887098 condMapEmpty!28263) mapIsEmpty!28263))

(assert (= (and b!887098 (not condMapEmpty!28263)) mapNonEmpty!28263))

(get-info :version)

(assert (= (and mapNonEmpty!28263 ((_ is ValueCellFull!8433) mapValue!28263)) b!887095))

(assert (= (and b!887098 ((_ is ValueCellFull!8433) mapDefault!28263)) b!887096))

(assert (= b!887100 b!887098))

(assert (= b!887099 b!887100))

(assert (= b!887094 b!887099))

(assert (= start!75302 b!887094))

(declare-fun m!826851 () Bool)

(assert (=> mapNonEmpty!28263 m!826851))

(declare-fun m!826853 () Bool)

(assert (=> b!887097 m!826853))

(declare-fun m!826855 () Bool)

(assert (=> b!887100 m!826855))

(declare-fun m!826857 () Bool)

(assert (=> b!887100 m!826857))

(declare-fun m!826859 () Bool)

(assert (=> start!75302 m!826859))

(check-sat (not mapNonEmpty!28263) b_and!25707 (not b_next!15501) tp_is_empty!17829 (not b!887100) (not b!887097) (not start!75302))
(check-sat b_and!25707 (not b_next!15501))
