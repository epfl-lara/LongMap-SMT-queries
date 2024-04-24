; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83786 () Bool)

(assert start!83786)

(declare-fun b!977841 () Bool)

(declare-fun e!551202 () Bool)

(declare-fun e!551199 () Bool)

(declare-fun mapRes!35711 () Bool)

(assert (=> b!977841 (= e!551202 (and e!551199 mapRes!35711))))

(declare-fun condMapEmpty!35711 () Bool)

(declare-datatypes ((V!34937 0))(
  ( (V!34938 (val!11283 Int)) )
))
(declare-datatypes ((ValueCell!10751 0))(
  ( (ValueCellFull!10751 (v!13841 V!34937)) (EmptyCell!10751) )
))
(declare-datatypes ((array!60996 0))(
  ( (array!60997 (arr!29356 (Array (_ BitVec 32) ValueCell!10751)) (size!29836 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60996)

(declare-fun mapDefault!35711 () ValueCell!10751)

(assert (=> b!977841 (= condMapEmpty!35711 (= (arr!29356 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10751)) mapDefault!35711)))))

(declare-fun mapNonEmpty!35711 () Bool)

(declare-fun tp!67964 () Bool)

(declare-fun e!551203 () Bool)

(assert (=> mapNonEmpty!35711 (= mapRes!35711 (and tp!67964 e!551203))))

(declare-fun mapRest!35711 () (Array (_ BitVec 32) ValueCell!10751))

(declare-fun mapValue!35711 () ValueCell!10751)

(declare-fun mapKey!35711 () (_ BitVec 32))

(assert (=> mapNonEmpty!35711 (= (arr!29356 _values!1278) (store mapRest!35711 mapKey!35711 mapValue!35711))))

(declare-fun mapIsEmpty!35711 () Bool)

(assert (=> mapIsEmpty!35711 mapRes!35711))

(declare-fun res!654272 () Bool)

(declare-fun e!551201 () Bool)

(assert (=> start!83786 (=> (not res!654272) (not e!551201))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83786 (= res!654272 (validMask!0 mask!1948))))

(assert (=> start!83786 e!551201))

(assert (=> start!83786 true))

(declare-fun array_inv!22751 (array!60996) Bool)

(assert (=> start!83786 (and (array_inv!22751 _values!1278) e!551202)))

(declare-datatypes ((array!60998 0))(
  ( (array!60999 (arr!29357 (Array (_ BitVec 32) (_ BitVec 64))) (size!29837 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60998)

(declare-fun array_inv!22752 (array!60998) Bool)

(assert (=> start!83786 (array_inv!22752 _keys!1544)))

(declare-fun b!977842 () Bool)

(declare-fun tp_is_empty!22465 () Bool)

(assert (=> b!977842 (= e!551203 tp_is_empty!22465)))

(declare-fun b!977843 () Bool)

(assert (=> b!977843 (= e!551199 tp_is_empty!22465)))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun b!977844 () Bool)

(assert (=> b!977844 (= e!551201 (and (= (size!29836 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29837 _keys!1544) (size!29836 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011) (= (size!29837 _keys!1544) (bvadd #b00000000000000000000000000000001 mask!1948)) (bvsgt #b00000000000000000000000000000000 (size!29837 _keys!1544))))))

(assert (= (and start!83786 res!654272) b!977844))

(assert (= (and b!977841 condMapEmpty!35711) mapIsEmpty!35711))

(assert (= (and b!977841 (not condMapEmpty!35711)) mapNonEmpty!35711))

(get-info :version)

(assert (= (and mapNonEmpty!35711 ((_ is ValueCellFull!10751) mapValue!35711)) b!977842))

(assert (= (and b!977841 ((_ is ValueCellFull!10751) mapDefault!35711)) b!977843))

(assert (= start!83786 b!977841))

(declare-fun m!905689 () Bool)

(assert (=> mapNonEmpty!35711 m!905689))

(declare-fun m!905691 () Bool)

(assert (=> start!83786 m!905691))

(declare-fun m!905693 () Bool)

(assert (=> start!83786 m!905693))

(declare-fun m!905695 () Bool)

(assert (=> start!83786 m!905695))

(check-sat (not start!83786) (not mapNonEmpty!35711) tp_is_empty!22465)
(check-sat)
(get-model)

(declare-fun d!116939 () Bool)

(assert (=> d!116939 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83786 d!116939))

(declare-fun d!116941 () Bool)

(assert (=> d!116941 (= (array_inv!22751 _values!1278) (bvsge (size!29836 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83786 d!116941))

(declare-fun d!116943 () Bool)

(assert (=> d!116943 (= (array_inv!22752 _keys!1544) (bvsge (size!29837 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83786 d!116943))

(declare-fun mapNonEmpty!35720 () Bool)

(declare-fun mapRes!35720 () Bool)

(declare-fun tp!67973 () Bool)

(declare-fun e!551239 () Bool)

(assert (=> mapNonEmpty!35720 (= mapRes!35720 (and tp!67973 e!551239))))

(declare-fun mapKey!35720 () (_ BitVec 32))

(declare-fun mapValue!35720 () ValueCell!10751)

(declare-fun mapRest!35720 () (Array (_ BitVec 32) ValueCell!10751))

(assert (=> mapNonEmpty!35720 (= mapRest!35711 (store mapRest!35720 mapKey!35720 mapValue!35720))))

(declare-fun b!977876 () Bool)

(declare-fun e!551238 () Bool)

(assert (=> b!977876 (= e!551238 tp_is_empty!22465)))

(declare-fun b!977875 () Bool)

(assert (=> b!977875 (= e!551239 tp_is_empty!22465)))

(declare-fun condMapEmpty!35720 () Bool)

(declare-fun mapDefault!35720 () ValueCell!10751)

(assert (=> mapNonEmpty!35711 (= condMapEmpty!35720 (= mapRest!35711 ((as const (Array (_ BitVec 32) ValueCell!10751)) mapDefault!35720)))))

(assert (=> mapNonEmpty!35711 (= tp!67964 (and e!551238 mapRes!35720))))

(declare-fun mapIsEmpty!35720 () Bool)

(assert (=> mapIsEmpty!35720 mapRes!35720))

(assert (= (and mapNonEmpty!35711 condMapEmpty!35720) mapIsEmpty!35720))

(assert (= (and mapNonEmpty!35711 (not condMapEmpty!35720)) mapNonEmpty!35720))

(assert (= (and mapNonEmpty!35720 ((_ is ValueCellFull!10751) mapValue!35720)) b!977875))

(assert (= (and mapNonEmpty!35711 ((_ is ValueCellFull!10751) mapDefault!35720)) b!977876))

(declare-fun m!905713 () Bool)

(assert (=> mapNonEmpty!35720 m!905713))

(check-sat (not mapNonEmpty!35720) tp_is_empty!22465)
(check-sat)
