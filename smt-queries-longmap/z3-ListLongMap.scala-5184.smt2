; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70070 () Bool)

(assert start!70070)

(declare-fun b_free!12511 () Bool)

(declare-fun b_next!12511 () Bool)

(assert (=> start!70070 (= b_free!12511 (not b_next!12511))))

(declare-fun tp!44247 () Bool)

(declare-fun b_and!21257 () Bool)

(assert (=> start!70070 (= tp!44247 b_and!21257)))

(declare-fun b!814274 () Bool)

(declare-fun e!451366 () Bool)

(declare-fun tp_is_empty!14221 () Bool)

(assert (=> b!814274 (= e!451366 tp_is_empty!14221)))

(declare-fun res!556217 () Bool)

(declare-fun e!451364 () Bool)

(assert (=> start!70070 (=> (not res!556217) (not e!451364))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70070 (= res!556217 (validMask!0 mask!1312))))

(assert (=> start!70070 e!451364))

(assert (=> start!70070 tp_is_empty!14221))

(declare-datatypes ((array!44639 0))(
  ( (array!44640 (arr!21380 (Array (_ BitVec 32) (_ BitVec 64))) (size!21801 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44639)

(declare-fun array_inv!17191 (array!44639) Bool)

(assert (=> start!70070 (array_inv!17191 _keys!976)))

(assert (=> start!70070 true))

(declare-datatypes ((V!23963 0))(
  ( (V!23964 (val!7158 Int)) )
))
(declare-datatypes ((ValueCell!6695 0))(
  ( (ValueCellFull!6695 (v!9579 V!23963)) (EmptyCell!6695) )
))
(declare-datatypes ((array!44641 0))(
  ( (array!44642 (arr!21381 (Array (_ BitVec 32) ValueCell!6695)) (size!21802 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44641)

(declare-fun e!451365 () Bool)

(declare-fun array_inv!17192 (array!44641) Bool)

(assert (=> start!70070 (and (array_inv!17192 _values!788) e!451365)))

(assert (=> start!70070 tp!44247))

(declare-fun mapNonEmpty!22912 () Bool)

(declare-fun mapRes!22912 () Bool)

(declare-fun tp!44248 () Bool)

(assert (=> mapNonEmpty!22912 (= mapRes!22912 (and tp!44248 e!451366))))

(declare-fun mapKey!22912 () (_ BitVec 32))

(declare-fun mapValue!22912 () ValueCell!6695)

(declare-fun mapRest!22912 () (Array (_ BitVec 32) ValueCell!6695))

(assert (=> mapNonEmpty!22912 (= (arr!21381 _values!788) (store mapRest!22912 mapKey!22912 mapValue!22912))))

(declare-fun b!814275 () Bool)

(assert (=> b!814275 (= e!451364 (not true))))

(declare-datatypes ((tuple2!9414 0))(
  ( (tuple2!9415 (_1!4718 (_ BitVec 64)) (_2!4718 V!23963)) )
))
(declare-datatypes ((List!15242 0))(
  ( (Nil!15239) (Cons!15238 (h!16367 tuple2!9414) (t!21550 List!15242)) )
))
(declare-datatypes ((ListLongMap!8227 0))(
  ( (ListLongMap!8228 (toList!4129 List!15242)) )
))
(declare-fun lt!364408 () ListLongMap!8227)

(declare-fun lt!364409 () ListLongMap!8227)

(assert (=> b!814275 (= lt!364408 lt!364409)))

(declare-fun zeroValueBefore!34 () V!23963)

(declare-datatypes ((Unit!27692 0))(
  ( (Unit!27693) )
))
(declare-fun lt!364410 () Unit!27692)

(declare-fun zeroValueAfter!34 () V!23963)

(declare-fun minValue!754 () V!23963)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!287 (array!44639 array!44641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23963 V!23963 V!23963 V!23963 (_ BitVec 32) Int) Unit!27692)

(assert (=> b!814275 (= lt!364410 (lemmaNoChangeToArrayThenSameMapNoExtras!287 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2194 (array!44639 array!44641 (_ BitVec 32) (_ BitVec 32) V!23963 V!23963 (_ BitVec 32) Int) ListLongMap!8227)

(assert (=> b!814275 (= lt!364409 (getCurrentListMapNoExtraKeys!2194 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814275 (= lt!364408 (getCurrentListMapNoExtraKeys!2194 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814276 () Bool)

(declare-fun res!556220 () Bool)

(assert (=> b!814276 (=> (not res!556220) (not e!451364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44639 (_ BitVec 32)) Bool)

(assert (=> b!814276 (= res!556220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22912 () Bool)

(assert (=> mapIsEmpty!22912 mapRes!22912))

(declare-fun b!814277 () Bool)

(declare-fun e!451368 () Bool)

(assert (=> b!814277 (= e!451368 tp_is_empty!14221)))

(declare-fun b!814278 () Bool)

(declare-fun res!556219 () Bool)

(assert (=> b!814278 (=> (not res!556219) (not e!451364))))

(declare-datatypes ((List!15243 0))(
  ( (Nil!15240) (Cons!15239 (h!16368 (_ BitVec 64)) (t!21551 List!15243)) )
))
(declare-fun arrayNoDuplicates!0 (array!44639 (_ BitVec 32) List!15243) Bool)

(assert (=> b!814278 (= res!556219 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15240))))

(declare-fun b!814279 () Bool)

(assert (=> b!814279 (= e!451365 (and e!451368 mapRes!22912))))

(declare-fun condMapEmpty!22912 () Bool)

(declare-fun mapDefault!22912 () ValueCell!6695)

(assert (=> b!814279 (= condMapEmpty!22912 (= (arr!21381 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6695)) mapDefault!22912)))))

(declare-fun b!814280 () Bool)

(declare-fun res!556218 () Bool)

(assert (=> b!814280 (=> (not res!556218) (not e!451364))))

(assert (=> b!814280 (= res!556218 (and (= (size!21802 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21801 _keys!976) (size!21802 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70070 res!556217) b!814280))

(assert (= (and b!814280 res!556218) b!814276))

(assert (= (and b!814276 res!556220) b!814278))

(assert (= (and b!814278 res!556219) b!814275))

(assert (= (and b!814279 condMapEmpty!22912) mapIsEmpty!22912))

(assert (= (and b!814279 (not condMapEmpty!22912)) mapNonEmpty!22912))

(get-info :version)

(assert (= (and mapNonEmpty!22912 ((_ is ValueCellFull!6695) mapValue!22912)) b!814274))

(assert (= (and b!814279 ((_ is ValueCellFull!6695) mapDefault!22912)) b!814277))

(assert (= start!70070 b!814279))

(declare-fun m!755571 () Bool)

(assert (=> b!814275 m!755571))

(declare-fun m!755573 () Bool)

(assert (=> b!814275 m!755573))

(declare-fun m!755575 () Bool)

(assert (=> b!814275 m!755575))

(declare-fun m!755577 () Bool)

(assert (=> b!814278 m!755577))

(declare-fun m!755579 () Bool)

(assert (=> start!70070 m!755579))

(declare-fun m!755581 () Bool)

(assert (=> start!70070 m!755581))

(declare-fun m!755583 () Bool)

(assert (=> start!70070 m!755583))

(declare-fun m!755585 () Bool)

(assert (=> b!814276 m!755585))

(declare-fun m!755587 () Bool)

(assert (=> mapNonEmpty!22912 m!755587))

(check-sat (not mapNonEmpty!22912) (not start!70070) tp_is_empty!14221 (not b!814278) (not b!814275) (not b_next!12511) b_and!21257 (not b!814276))
(check-sat b_and!21257 (not b_next!12511))
