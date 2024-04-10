; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70086 () Bool)

(assert start!70086)

(declare-fun b_free!12507 () Bool)

(declare-fun b_next!12507 () Bool)

(assert (=> start!70086 (= b_free!12507 (not b_next!12507))))

(declare-fun tp!44236 () Bool)

(declare-fun b_and!21279 () Bool)

(assert (=> start!70086 (= tp!44236 b_and!21279)))

(declare-fun b!814478 () Bool)

(declare-fun res!556302 () Bool)

(declare-fun e!451485 () Bool)

(assert (=> b!814478 (=> (not res!556302) (not e!451485))))

(declare-datatypes ((array!44636 0))(
  ( (array!44637 (arr!21378 (Array (_ BitVec 32) (_ BitVec 64))) (size!21799 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44636)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44636 (_ BitVec 32)) Bool)

(assert (=> b!814478 (= res!556302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814479 () Bool)

(declare-fun e!451484 () Bool)

(declare-fun tp_is_empty!14217 () Bool)

(assert (=> b!814479 (= e!451484 tp_is_empty!14217)))

(declare-fun b!814480 () Bool)

(declare-fun e!451488 () Bool)

(assert (=> b!814480 (= e!451488 tp_is_empty!14217)))

(declare-fun res!556300 () Bool)

(assert (=> start!70086 (=> (not res!556300) (not e!451485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70086 (= res!556300 (validMask!0 mask!1312))))

(assert (=> start!70086 e!451485))

(assert (=> start!70086 tp_is_empty!14217))

(declare-fun array_inv!17107 (array!44636) Bool)

(assert (=> start!70086 (array_inv!17107 _keys!976)))

(assert (=> start!70086 true))

(declare-datatypes ((V!23957 0))(
  ( (V!23958 (val!7156 Int)) )
))
(declare-datatypes ((ValueCell!6693 0))(
  ( (ValueCellFull!6693 (v!9583 V!23957)) (EmptyCell!6693) )
))
(declare-datatypes ((array!44638 0))(
  ( (array!44639 (arr!21379 (Array (_ BitVec 32) ValueCell!6693)) (size!21800 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44638)

(declare-fun e!451486 () Bool)

(declare-fun array_inv!17108 (array!44638) Bool)

(assert (=> start!70086 (and (array_inv!17108 _values!788) e!451486)))

(assert (=> start!70086 tp!44236))

(declare-fun b!814481 () Bool)

(declare-fun res!556299 () Bool)

(assert (=> b!814481 (=> (not res!556299) (not e!451485))))

(declare-datatypes ((List!15211 0))(
  ( (Nil!15208) (Cons!15207 (h!16336 (_ BitVec 64)) (t!21528 List!15211)) )
))
(declare-fun arrayNoDuplicates!0 (array!44636 (_ BitVec 32) List!15211) Bool)

(assert (=> b!814481 (= res!556299 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15208))))

(declare-fun b!814482 () Bool)

(assert (=> b!814482 (= e!451485 (not true))))

(declare-datatypes ((tuple2!9378 0))(
  ( (tuple2!9379 (_1!4700 (_ BitVec 64)) (_2!4700 V!23957)) )
))
(declare-datatypes ((List!15212 0))(
  ( (Nil!15209) (Cons!15208 (h!16337 tuple2!9378) (t!21529 List!15212)) )
))
(declare-datatypes ((ListLongMap!8201 0))(
  ( (ListLongMap!8202 (toList!4116 List!15212)) )
))
(declare-fun lt!364634 () ListLongMap!8201)

(declare-fun lt!364635 () ListLongMap!8201)

(assert (=> b!814482 (= lt!364634 lt!364635)))

(declare-fun zeroValueBefore!34 () V!23957)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23957)

(declare-fun minValue!754 () V!23957)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27730 0))(
  ( (Unit!27731) )
))
(declare-fun lt!364633 () Unit!27730)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!276 (array!44636 array!44638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23957 V!23957 V!23957 V!23957 (_ BitVec 32) Int) Unit!27730)

(assert (=> b!814482 (= lt!364633 (lemmaNoChangeToArrayThenSameMapNoExtras!276 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2166 (array!44636 array!44638 (_ BitVec 32) (_ BitVec 32) V!23957 V!23957 (_ BitVec 32) Int) ListLongMap!8201)

(assert (=> b!814482 (= lt!364635 (getCurrentListMapNoExtraKeys!2166 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814482 (= lt!364634 (getCurrentListMapNoExtraKeys!2166 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814483 () Bool)

(declare-fun mapRes!22906 () Bool)

(assert (=> b!814483 (= e!451486 (and e!451488 mapRes!22906))))

(declare-fun condMapEmpty!22906 () Bool)

(declare-fun mapDefault!22906 () ValueCell!6693)

(assert (=> b!814483 (= condMapEmpty!22906 (= (arr!21379 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6693)) mapDefault!22906)))))

(declare-fun mapIsEmpty!22906 () Bool)

(assert (=> mapIsEmpty!22906 mapRes!22906))

(declare-fun mapNonEmpty!22906 () Bool)

(declare-fun tp!44235 () Bool)

(assert (=> mapNonEmpty!22906 (= mapRes!22906 (and tp!44235 e!451484))))

(declare-fun mapRest!22906 () (Array (_ BitVec 32) ValueCell!6693))

(declare-fun mapValue!22906 () ValueCell!6693)

(declare-fun mapKey!22906 () (_ BitVec 32))

(assert (=> mapNonEmpty!22906 (= (arr!21379 _values!788) (store mapRest!22906 mapKey!22906 mapValue!22906))))

(declare-fun b!814484 () Bool)

(declare-fun res!556301 () Bool)

(assert (=> b!814484 (=> (not res!556301) (not e!451485))))

(assert (=> b!814484 (= res!556301 (and (= (size!21800 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21799 _keys!976) (size!21800 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70086 res!556300) b!814484))

(assert (= (and b!814484 res!556301) b!814478))

(assert (= (and b!814478 res!556302) b!814481))

(assert (= (and b!814481 res!556299) b!814482))

(assert (= (and b!814483 condMapEmpty!22906) mapIsEmpty!22906))

(assert (= (and b!814483 (not condMapEmpty!22906)) mapNonEmpty!22906))

(get-info :version)

(assert (= (and mapNonEmpty!22906 ((_ is ValueCellFull!6693) mapValue!22906)) b!814479))

(assert (= (and b!814483 ((_ is ValueCellFull!6693) mapDefault!22906)) b!814480))

(assert (= start!70086 b!814483))

(declare-fun m!756287 () Bool)

(assert (=> b!814482 m!756287))

(declare-fun m!756289 () Bool)

(assert (=> b!814482 m!756289))

(declare-fun m!756291 () Bool)

(assert (=> b!814482 m!756291))

(declare-fun m!756293 () Bool)

(assert (=> start!70086 m!756293))

(declare-fun m!756295 () Bool)

(assert (=> start!70086 m!756295))

(declare-fun m!756297 () Bool)

(assert (=> start!70086 m!756297))

(declare-fun m!756299 () Bool)

(assert (=> b!814481 m!756299))

(declare-fun m!756301 () Bool)

(assert (=> b!814478 m!756301))

(declare-fun m!756303 () Bool)

(assert (=> mapNonEmpty!22906 m!756303))

(check-sat (not mapNonEmpty!22906) (not b!814482) (not b!814481) (not start!70086) (not b_next!12507) tp_is_empty!14217 b_and!21279 (not b!814478))
(check-sat b_and!21279 (not b_next!12507))
