; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70234 () Bool)

(assert start!70234)

(declare-fun b_free!12627 () Bool)

(declare-fun b_next!12627 () Bool)

(assert (=> start!70234 (= b_free!12627 (not b_next!12627))))

(declare-fun tp!44602 () Bool)

(declare-fun b_and!21415 () Bool)

(assert (=> start!70234 (= tp!44602 b_and!21415)))

(declare-fun b!815967 () Bool)

(declare-fun res!557140 () Bool)

(declare-fun e!452554 () Bool)

(assert (=> b!815967 (=> (not res!557140) (not e!452554))))

(declare-datatypes ((array!44874 0))(
  ( (array!44875 (arr!21495 (Array (_ BitVec 32) (_ BitVec 64))) (size!21916 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44874)

(declare-datatypes ((V!24117 0))(
  ( (V!24118 (val!7216 Int)) )
))
(declare-datatypes ((ValueCell!6753 0))(
  ( (ValueCellFull!6753 (v!9643 V!24117)) (EmptyCell!6753) )
))
(declare-datatypes ((array!44876 0))(
  ( (array!44877 (arr!21496 (Array (_ BitVec 32) ValueCell!6753)) (size!21917 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44876)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!815967 (= res!557140 (and (= (size!21917 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21916 _keys!976) (size!21917 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!557143 () Bool)

(assert (=> start!70234 (=> (not res!557143) (not e!452554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70234 (= res!557143 (validMask!0 mask!1312))))

(assert (=> start!70234 e!452554))

(declare-fun tp_is_empty!14337 () Bool)

(assert (=> start!70234 tp_is_empty!14337))

(declare-fun array_inv!17201 (array!44874) Bool)

(assert (=> start!70234 (array_inv!17201 _keys!976)))

(assert (=> start!70234 true))

(declare-fun e!452558 () Bool)

(declare-fun array_inv!17202 (array!44876) Bool)

(assert (=> start!70234 (and (array_inv!17202 _values!788) e!452558)))

(assert (=> start!70234 tp!44602))

(declare-fun b!815968 () Bool)

(declare-fun e!452553 () Bool)

(assert (=> b!815968 (= e!452554 (not e!452553))))

(declare-fun res!557142 () Bool)

(assert (=> b!815968 (=> res!557142 e!452553)))

(assert (=> b!815968 (= res!557142 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9472 0))(
  ( (tuple2!9473 (_1!4747 (_ BitVec 64)) (_2!4747 V!24117)) )
))
(declare-datatypes ((List!15302 0))(
  ( (Nil!15299) (Cons!15298 (h!16427 tuple2!9472) (t!21623 List!15302)) )
))
(declare-datatypes ((ListLongMap!8295 0))(
  ( (ListLongMap!8296 (toList!4163 List!15302)) )
))
(declare-fun lt!365374 () ListLongMap!8295)

(declare-fun lt!365373 () ListLongMap!8295)

(assert (=> b!815968 (= lt!365374 lt!365373)))

(declare-fun zeroValueBefore!34 () V!24117)

(declare-fun zeroValueAfter!34 () V!24117)

(declare-fun minValue!754 () V!24117)

(declare-datatypes ((Unit!27818 0))(
  ( (Unit!27819) )
))
(declare-fun lt!365371 () Unit!27818)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!320 (array!44874 array!44876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24117 V!24117 V!24117 V!24117 (_ BitVec 32) Int) Unit!27818)

(assert (=> b!815968 (= lt!365371 (lemmaNoChangeToArrayThenSameMapNoExtras!320 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2210 (array!44874 array!44876 (_ BitVec 32) (_ BitVec 32) V!24117 V!24117 (_ BitVec 32) Int) ListLongMap!8295)

(assert (=> b!815968 (= lt!365373 (getCurrentListMapNoExtraKeys!2210 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815968 (= lt!365374 (getCurrentListMapNoExtraKeys!2210 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815969 () Bool)

(declare-fun e!452557 () Bool)

(assert (=> b!815969 (= e!452557 tp_is_empty!14337)))

(declare-fun b!815970 () Bool)

(declare-fun e!452556 () Bool)

(assert (=> b!815970 (= e!452556 tp_is_empty!14337)))

(declare-fun b!815971 () Bool)

(assert (=> b!815971 (= e!452553 true)))

(declare-fun lt!365372 () ListLongMap!8295)

(declare-fun getCurrentListMap!2390 (array!44874 array!44876 (_ BitVec 32) (_ BitVec 32) V!24117 V!24117 (_ BitVec 32) Int) ListLongMap!8295)

(assert (=> b!815971 (= lt!365372 (getCurrentListMap!2390 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365375 () ListLongMap!8295)

(declare-fun +!1796 (ListLongMap!8295 tuple2!9472) ListLongMap!8295)

(assert (=> b!815971 (= lt!365375 (+!1796 (getCurrentListMap!2390 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapNonEmpty!23092 () Bool)

(declare-fun mapRes!23092 () Bool)

(declare-fun tp!44601 () Bool)

(assert (=> mapNonEmpty!23092 (= mapRes!23092 (and tp!44601 e!452557))))

(declare-fun mapValue!23092 () ValueCell!6753)

(declare-fun mapKey!23092 () (_ BitVec 32))

(declare-fun mapRest!23092 () (Array (_ BitVec 32) ValueCell!6753))

(assert (=> mapNonEmpty!23092 (= (arr!21496 _values!788) (store mapRest!23092 mapKey!23092 mapValue!23092))))

(declare-fun mapIsEmpty!23092 () Bool)

(assert (=> mapIsEmpty!23092 mapRes!23092))

(declare-fun b!815972 () Bool)

(assert (=> b!815972 (= e!452558 (and e!452556 mapRes!23092))))

(declare-fun condMapEmpty!23092 () Bool)

(declare-fun mapDefault!23092 () ValueCell!6753)

(assert (=> b!815972 (= condMapEmpty!23092 (= (arr!21496 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6753)) mapDefault!23092)))))

(declare-fun b!815973 () Bool)

(declare-fun res!557144 () Bool)

(assert (=> b!815973 (=> (not res!557144) (not e!452554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44874 (_ BitVec 32)) Bool)

(assert (=> b!815973 (= res!557144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815974 () Bool)

(declare-fun res!557141 () Bool)

(assert (=> b!815974 (=> (not res!557141) (not e!452554))))

(declare-datatypes ((List!15303 0))(
  ( (Nil!15300) (Cons!15299 (h!16428 (_ BitVec 64)) (t!21624 List!15303)) )
))
(declare-fun arrayNoDuplicates!0 (array!44874 (_ BitVec 32) List!15303) Bool)

(assert (=> b!815974 (= res!557141 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15300))))

(assert (= (and start!70234 res!557143) b!815967))

(assert (= (and b!815967 res!557140) b!815973))

(assert (= (and b!815973 res!557144) b!815974))

(assert (= (and b!815974 res!557141) b!815968))

(assert (= (and b!815968 (not res!557142)) b!815971))

(assert (= (and b!815972 condMapEmpty!23092) mapIsEmpty!23092))

(assert (= (and b!815972 (not condMapEmpty!23092)) mapNonEmpty!23092))

(get-info :version)

(assert (= (and mapNonEmpty!23092 ((_ is ValueCellFull!6753) mapValue!23092)) b!815969))

(assert (= (and b!815972 ((_ is ValueCellFull!6753) mapDefault!23092)) b!815970))

(assert (= start!70234 b!815972))

(declare-fun m!757613 () Bool)

(assert (=> start!70234 m!757613))

(declare-fun m!757615 () Bool)

(assert (=> start!70234 m!757615))

(declare-fun m!757617 () Bool)

(assert (=> start!70234 m!757617))

(declare-fun m!757619 () Bool)

(assert (=> b!815971 m!757619))

(declare-fun m!757621 () Bool)

(assert (=> b!815971 m!757621))

(assert (=> b!815971 m!757621))

(declare-fun m!757623 () Bool)

(assert (=> b!815971 m!757623))

(declare-fun m!757625 () Bool)

(assert (=> mapNonEmpty!23092 m!757625))

(declare-fun m!757627 () Bool)

(assert (=> b!815968 m!757627))

(declare-fun m!757629 () Bool)

(assert (=> b!815968 m!757629))

(declare-fun m!757631 () Bool)

(assert (=> b!815968 m!757631))

(declare-fun m!757633 () Bool)

(assert (=> b!815974 m!757633))

(declare-fun m!757635 () Bool)

(assert (=> b!815973 m!757635))

(check-sat (not b_next!12627) (not b!815973) tp_is_empty!14337 (not start!70234) (not b!815968) b_and!21415 (not b!815971) (not b!815974) (not mapNonEmpty!23092))
(check-sat b_and!21415 (not b_next!12627))
