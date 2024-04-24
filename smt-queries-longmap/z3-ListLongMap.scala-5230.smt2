; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70610 () Bool)

(assert start!70610)

(declare-fun b_free!12787 () Bool)

(declare-fun b_next!12787 () Bool)

(assert (=> start!70610 (= b_free!12787 (not b_next!12787))))

(declare-fun tp!45090 () Bool)

(declare-fun b_and!21617 () Bool)

(assert (=> start!70610 (= tp!45090 b_and!21617)))

(declare-fun b!819153 () Bool)

(declare-fun res!558801 () Bool)

(declare-fun e!454769 () Bool)

(assert (=> b!819153 (=> (not res!558801) (not e!454769))))

(declare-datatypes ((array!45193 0))(
  ( (array!45194 (arr!21647 (Array (_ BitVec 32) (_ BitVec 64))) (size!22067 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45193)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24331 0))(
  ( (V!24332 (val!7296 Int)) )
))
(declare-datatypes ((ValueCell!6833 0))(
  ( (ValueCellFull!6833 (v!9725 V!24331)) (EmptyCell!6833) )
))
(declare-datatypes ((array!45195 0))(
  ( (array!45196 (arr!21648 (Array (_ BitVec 32) ValueCell!6833)) (size!22068 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45195)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819153 (= res!558801 (and (= (size!22068 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22067 _keys!976) (size!22068 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23341 () Bool)

(declare-fun mapRes!23341 () Bool)

(assert (=> mapIsEmpty!23341 mapRes!23341))

(declare-fun mapNonEmpty!23341 () Bool)

(declare-fun tp!45091 () Bool)

(declare-fun e!454766 () Bool)

(assert (=> mapNonEmpty!23341 (= mapRes!23341 (and tp!45091 e!454766))))

(declare-fun mapKey!23341 () (_ BitVec 32))

(declare-fun mapValue!23341 () ValueCell!6833)

(declare-fun mapRest!23341 () (Array (_ BitVec 32) ValueCell!6833))

(assert (=> mapNonEmpty!23341 (= (arr!21648 _values!788) (store mapRest!23341 mapKey!23341 mapValue!23341))))

(declare-fun res!558802 () Bool)

(assert (=> start!70610 (=> (not res!558802) (not e!454769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70610 (= res!558802 (validMask!0 mask!1312))))

(assert (=> start!70610 e!454769))

(declare-fun tp_is_empty!14497 () Bool)

(assert (=> start!70610 tp_is_empty!14497))

(declare-fun array_inv!17339 (array!45193) Bool)

(assert (=> start!70610 (array_inv!17339 _keys!976)))

(assert (=> start!70610 true))

(declare-fun e!454767 () Bool)

(declare-fun array_inv!17340 (array!45195) Bool)

(assert (=> start!70610 (and (array_inv!17340 _values!788) e!454767)))

(assert (=> start!70610 tp!45090))

(declare-fun b!819154 () Bool)

(declare-fun e!454765 () Bool)

(assert (=> b!819154 (= e!454769 (not e!454765))))

(declare-fun res!558800 () Bool)

(assert (=> b!819154 (=> res!558800 e!454765)))

(assert (=> b!819154 (= res!558800 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9502 0))(
  ( (tuple2!9503 (_1!4762 (_ BitVec 64)) (_2!4762 V!24331)) )
))
(declare-datatypes ((List!15314 0))(
  ( (Nil!15311) (Cons!15310 (h!16445 tuple2!9502) (t!21633 List!15314)) )
))
(declare-datatypes ((ListLongMap!8327 0))(
  ( (ListLongMap!8328 (toList!4179 List!15314)) )
))
(declare-fun lt!366991 () ListLongMap!8327)

(declare-fun lt!366993 () ListLongMap!8327)

(assert (=> b!819154 (= lt!366991 lt!366993)))

(declare-fun zeroValueBefore!34 () V!24331)

(declare-fun zeroValueAfter!34 () V!24331)

(declare-fun minValue!754 () V!24331)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27911 0))(
  ( (Unit!27912) )
))
(declare-fun lt!366994 () Unit!27911)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!365 (array!45193 array!45195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24331 V!24331 V!24331 V!24331 (_ BitVec 32) Int) Unit!27911)

(assert (=> b!819154 (= lt!366994 (lemmaNoChangeToArrayThenSameMapNoExtras!365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2277 (array!45193 array!45195 (_ BitVec 32) (_ BitVec 32) V!24331 V!24331 (_ BitVec 32) Int) ListLongMap!8327)

(assert (=> b!819154 (= lt!366993 (getCurrentListMapNoExtraKeys!2277 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819154 (= lt!366991 (getCurrentListMapNoExtraKeys!2277 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819155 () Bool)

(declare-fun res!558804 () Bool)

(assert (=> b!819155 (=> (not res!558804) (not e!454769))))

(declare-datatypes ((List!15315 0))(
  ( (Nil!15312) (Cons!15311 (h!16446 (_ BitVec 64)) (t!21634 List!15315)) )
))
(declare-fun arrayNoDuplicates!0 (array!45193 (_ BitVec 32) List!15315) Bool)

(assert (=> b!819155 (= res!558804 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15312))))

(declare-fun b!819156 () Bool)

(assert (=> b!819156 (= e!454765 true)))

(declare-fun lt!366992 () ListLongMap!8327)

(declare-fun getCurrentListMap!2374 (array!45193 array!45195 (_ BitVec 32) (_ BitVec 32) V!24331 V!24331 (_ BitVec 32) Int) ListLongMap!8327)

(assert (=> b!819156 (= lt!366992 (getCurrentListMap!2374 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819157 () Bool)

(declare-fun e!454768 () Bool)

(assert (=> b!819157 (= e!454768 tp_is_empty!14497)))

(declare-fun b!819158 () Bool)

(declare-fun res!558803 () Bool)

(assert (=> b!819158 (=> (not res!558803) (not e!454769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45193 (_ BitVec 32)) Bool)

(assert (=> b!819158 (= res!558803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819159 () Bool)

(assert (=> b!819159 (= e!454767 (and e!454768 mapRes!23341))))

(declare-fun condMapEmpty!23341 () Bool)

(declare-fun mapDefault!23341 () ValueCell!6833)

(assert (=> b!819159 (= condMapEmpty!23341 (= (arr!21648 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6833)) mapDefault!23341)))))

(declare-fun b!819160 () Bool)

(assert (=> b!819160 (= e!454766 tp_is_empty!14497)))

(assert (= (and start!70610 res!558802) b!819153))

(assert (= (and b!819153 res!558801) b!819158))

(assert (= (and b!819158 res!558803) b!819155))

(assert (= (and b!819155 res!558804) b!819154))

(assert (= (and b!819154 (not res!558800)) b!819156))

(assert (= (and b!819159 condMapEmpty!23341) mapIsEmpty!23341))

(assert (= (and b!819159 (not condMapEmpty!23341)) mapNonEmpty!23341))

(get-info :version)

(assert (= (and mapNonEmpty!23341 ((_ is ValueCellFull!6833) mapValue!23341)) b!819160))

(assert (= (and b!819159 ((_ is ValueCellFull!6833) mapDefault!23341)) b!819157))

(assert (= start!70610 b!819159))

(declare-fun m!760987 () Bool)

(assert (=> b!819155 m!760987))

(declare-fun m!760989 () Bool)

(assert (=> b!819158 m!760989))

(declare-fun m!760991 () Bool)

(assert (=> b!819154 m!760991))

(declare-fun m!760993 () Bool)

(assert (=> b!819154 m!760993))

(declare-fun m!760995 () Bool)

(assert (=> b!819154 m!760995))

(declare-fun m!760997 () Bool)

(assert (=> b!819156 m!760997))

(declare-fun m!760999 () Bool)

(assert (=> start!70610 m!760999))

(declare-fun m!761001 () Bool)

(assert (=> start!70610 m!761001))

(declare-fun m!761003 () Bool)

(assert (=> start!70610 m!761003))

(declare-fun m!761005 () Bool)

(assert (=> mapNonEmpty!23341 m!761005))

(check-sat (not mapNonEmpty!23341) (not b!819154) (not b_next!12787) (not b!819158) tp_is_empty!14497 b_and!21617 (not start!70610) (not b!819156) (not b!819155))
(check-sat b_and!21617 (not b_next!12787))
