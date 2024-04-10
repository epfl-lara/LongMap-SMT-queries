; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83620 () Bool)

(assert start!83620)

(declare-fun b!976950 () Bool)

(declare-fun e!550635 () Bool)

(declare-fun tp_is_empty!22467 () Bool)

(assert (=> b!976950 (= e!550635 tp_is_empty!22467)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!34939 0))(
  ( (V!34940 (val!11284 Int)) )
))
(declare-datatypes ((ValueCell!10752 0))(
  ( (ValueCellFull!10752 (v!13845 V!34939)) (EmptyCell!10752) )
))
(declare-datatypes ((array!60961 0))(
  ( (array!60962 (arr!29343 (Array (_ BitVec 32) ValueCell!10752)) (size!29822 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60961)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun b!976951 () Bool)

(declare-fun e!550636 () Bool)

(declare-datatypes ((array!60963 0))(
  ( (array!60964 (arr!29344 (Array (_ BitVec 32) (_ BitVec 64))) (size!29823 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60963)

(assert (=> b!976951 (= e!550636 (and (= (size!29822 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29823 _keys!1544) (size!29822 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011) (= (size!29823 _keys!1544) (bvadd #b00000000000000000000000000000001 mask!1948)) (bvsgt #b00000000000000000000000000000000 (size!29823 _keys!1544))))))

(declare-fun mapNonEmpty!35714 () Bool)

(declare-fun mapRes!35714 () Bool)

(declare-fun tp!67966 () Bool)

(assert (=> mapNonEmpty!35714 (= mapRes!35714 (and tp!67966 e!550635))))

(declare-fun mapRest!35714 () (Array (_ BitVec 32) ValueCell!10752))

(declare-fun mapKey!35714 () (_ BitVec 32))

(declare-fun mapValue!35714 () ValueCell!10752)

(assert (=> mapNonEmpty!35714 (= (arr!29343 _values!1278) (store mapRest!35714 mapKey!35714 mapValue!35714))))

(declare-fun b!976952 () Bool)

(declare-fun e!550632 () Bool)

(declare-fun e!550634 () Bool)

(assert (=> b!976952 (= e!550632 (and e!550634 mapRes!35714))))

(declare-fun condMapEmpty!35714 () Bool)

(declare-fun mapDefault!35714 () ValueCell!10752)

(assert (=> b!976952 (= condMapEmpty!35714 (= (arr!29343 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10752)) mapDefault!35714)))))

(declare-fun b!976953 () Bool)

(assert (=> b!976953 (= e!550634 tp_is_empty!22467)))

(declare-fun res!653931 () Bool)

(assert (=> start!83620 (=> (not res!653931) (not e!550636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83620 (= res!653931 (validMask!0 mask!1948))))

(assert (=> start!83620 e!550636))

(assert (=> start!83620 true))

(declare-fun array_inv!22685 (array!60961) Bool)

(assert (=> start!83620 (and (array_inv!22685 _values!1278) e!550632)))

(declare-fun array_inv!22686 (array!60963) Bool)

(assert (=> start!83620 (array_inv!22686 _keys!1544)))

(declare-fun mapIsEmpty!35714 () Bool)

(assert (=> mapIsEmpty!35714 mapRes!35714))

(assert (= (and start!83620 res!653931) b!976951))

(assert (= (and b!976952 condMapEmpty!35714) mapIsEmpty!35714))

(assert (= (and b!976952 (not condMapEmpty!35714)) mapNonEmpty!35714))

(get-info :version)

(assert (= (and mapNonEmpty!35714 ((_ is ValueCellFull!10752) mapValue!35714)) b!976950))

(assert (= (and b!976952 ((_ is ValueCellFull!10752) mapDefault!35714)) b!976953))

(assert (= start!83620 b!976952))

(declare-fun m!904403 () Bool)

(assert (=> mapNonEmpty!35714 m!904403))

(declare-fun m!904405 () Bool)

(assert (=> start!83620 m!904405))

(declare-fun m!904407 () Bool)

(assert (=> start!83620 m!904407))

(declare-fun m!904409 () Bool)

(assert (=> start!83620 m!904409))

(check-sat (not start!83620) (not mapNonEmpty!35714) tp_is_empty!22467)
(check-sat)
(get-model)

(declare-fun d!116617 () Bool)

(assert (=> d!116617 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83620 d!116617))

(declare-fun d!116619 () Bool)

(assert (=> d!116619 (= (array_inv!22685 _values!1278) (bvsge (size!29822 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83620 d!116619))

(declare-fun d!116621 () Bool)

(assert (=> d!116621 (= (array_inv!22686 _keys!1544) (bvsge (size!29823 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83620 d!116621))

(declare-fun mapNonEmpty!35720 () Bool)

(declare-fun mapRes!35720 () Bool)

(declare-fun tp!67972 () Bool)

(declare-fun e!550656 () Bool)

(assert (=> mapNonEmpty!35720 (= mapRes!35720 (and tp!67972 e!550656))))

(declare-fun mapRest!35720 () (Array (_ BitVec 32) ValueCell!10752))

(declare-fun mapValue!35720 () ValueCell!10752)

(declare-fun mapKey!35720 () (_ BitVec 32))

(assert (=> mapNonEmpty!35720 (= mapRest!35714 (store mapRest!35720 mapKey!35720 mapValue!35720))))

(declare-fun b!976972 () Bool)

(assert (=> b!976972 (= e!550656 tp_is_empty!22467)))

(declare-fun condMapEmpty!35720 () Bool)

(declare-fun mapDefault!35720 () ValueCell!10752)

(assert (=> mapNonEmpty!35714 (= condMapEmpty!35720 (= mapRest!35714 ((as const (Array (_ BitVec 32) ValueCell!10752)) mapDefault!35720)))))

(declare-fun e!550657 () Bool)

(assert (=> mapNonEmpty!35714 (= tp!67966 (and e!550657 mapRes!35720))))

(declare-fun b!976973 () Bool)

(assert (=> b!976973 (= e!550657 tp_is_empty!22467)))

(declare-fun mapIsEmpty!35720 () Bool)

(assert (=> mapIsEmpty!35720 mapRes!35720))

(assert (= (and mapNonEmpty!35714 condMapEmpty!35720) mapIsEmpty!35720))

(assert (= (and mapNonEmpty!35714 (not condMapEmpty!35720)) mapNonEmpty!35720))

(assert (= (and mapNonEmpty!35720 ((_ is ValueCellFull!10752) mapValue!35720)) b!976972))

(assert (= (and mapNonEmpty!35714 ((_ is ValueCellFull!10752) mapDefault!35720)) b!976973))

(declare-fun m!904419 () Bool)

(assert (=> mapNonEmpty!35720 m!904419))

(check-sat (not mapNonEmpty!35720) tp_is_empty!22467)
(check-sat)
