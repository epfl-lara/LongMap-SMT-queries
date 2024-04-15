; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70058 () Bool)

(assert start!70058)

(declare-fun b_free!12499 () Bool)

(declare-fun b_next!12499 () Bool)

(assert (=> start!70058 (= b_free!12499 (not b_next!12499))))

(declare-fun tp!44211 () Bool)

(declare-fun b_and!21245 () Bool)

(assert (=> start!70058 (= tp!44211 b_and!21245)))

(declare-fun b!814148 () Bool)

(declare-fun res!556145 () Bool)

(declare-fun e!451277 () Bool)

(assert (=> b!814148 (=> (not res!556145) (not e!451277))))

(declare-datatypes ((array!44617 0))(
  ( (array!44618 (arr!21369 (Array (_ BitVec 32) (_ BitVec 64))) (size!21790 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44617)

(declare-datatypes ((List!15233 0))(
  ( (Nil!15230) (Cons!15229 (h!16358 (_ BitVec 64)) (t!21541 List!15233)) )
))
(declare-fun arrayNoDuplicates!0 (array!44617 (_ BitVec 32) List!15233) Bool)

(assert (=> b!814148 (= res!556145 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15230))))

(declare-fun b!814149 () Bool)

(declare-fun e!451276 () Bool)

(declare-fun tp_is_empty!14209 () Bool)

(assert (=> b!814149 (= e!451276 tp_is_empty!14209)))

(declare-fun mapIsEmpty!22894 () Bool)

(declare-fun mapRes!22894 () Bool)

(assert (=> mapIsEmpty!22894 mapRes!22894))

(declare-fun b!814150 () Bool)

(declare-fun res!556146 () Bool)

(assert (=> b!814150 (=> (not res!556146) (not e!451277))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44617 (_ BitVec 32)) Bool)

(assert (=> b!814150 (= res!556146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556148 () Bool)

(assert (=> start!70058 (=> (not res!556148) (not e!451277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70058 (= res!556148 (validMask!0 mask!1312))))

(assert (=> start!70058 e!451277))

(assert (=> start!70058 tp_is_empty!14209))

(declare-fun array_inv!17183 (array!44617) Bool)

(assert (=> start!70058 (array_inv!17183 _keys!976)))

(assert (=> start!70058 true))

(declare-datatypes ((V!23947 0))(
  ( (V!23948 (val!7152 Int)) )
))
(declare-datatypes ((ValueCell!6689 0))(
  ( (ValueCellFull!6689 (v!9573 V!23947)) (EmptyCell!6689) )
))
(declare-datatypes ((array!44619 0))(
  ( (array!44620 (arr!21370 (Array (_ BitVec 32) ValueCell!6689)) (size!21791 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44619)

(declare-fun e!451278 () Bool)

(declare-fun array_inv!17184 (array!44619) Bool)

(assert (=> start!70058 (and (array_inv!17184 _values!788) e!451278)))

(assert (=> start!70058 tp!44211))

(declare-fun b!814151 () Bool)

(declare-fun res!556147 () Bool)

(assert (=> b!814151 (=> (not res!556147) (not e!451277))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814151 (= res!556147 (and (= (size!21791 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21790 _keys!976) (size!21791 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814152 () Bool)

(declare-fun e!451275 () Bool)

(assert (=> b!814152 (= e!451275 tp_is_empty!14209)))

(declare-fun mapNonEmpty!22894 () Bool)

(declare-fun tp!44212 () Bool)

(assert (=> mapNonEmpty!22894 (= mapRes!22894 (and tp!44212 e!451275))))

(declare-fun mapKey!22894 () (_ BitVec 32))

(declare-fun mapRest!22894 () (Array (_ BitVec 32) ValueCell!6689))

(declare-fun mapValue!22894 () ValueCell!6689)

(assert (=> mapNonEmpty!22894 (= (arr!21370 _values!788) (store mapRest!22894 mapKey!22894 mapValue!22894))))

(declare-fun b!814153 () Bool)

(assert (=> b!814153 (= e!451278 (and e!451276 mapRes!22894))))

(declare-fun condMapEmpty!22894 () Bool)

(declare-fun mapDefault!22894 () ValueCell!6689)

(assert (=> b!814153 (= condMapEmpty!22894 (= (arr!21370 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6689)) mapDefault!22894)))))

(declare-fun b!814154 () Bool)

(assert (=> b!814154 (= e!451277 (not true))))

(declare-datatypes ((tuple2!9406 0))(
  ( (tuple2!9407 (_1!4714 (_ BitVec 64)) (_2!4714 V!23947)) )
))
(declare-datatypes ((List!15234 0))(
  ( (Nil!15231) (Cons!15230 (h!16359 tuple2!9406) (t!21542 List!15234)) )
))
(declare-datatypes ((ListLongMap!8219 0))(
  ( (ListLongMap!8220 (toList!4125 List!15234)) )
))
(declare-fun lt!364354 () ListLongMap!8219)

(declare-fun lt!364356 () ListLongMap!8219)

(assert (=> b!814154 (= lt!364354 lt!364356)))

(declare-fun zeroValueBefore!34 () V!23947)

(declare-fun zeroValueAfter!34 () V!23947)

(declare-fun minValue!754 () V!23947)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27684 0))(
  ( (Unit!27685) )
))
(declare-fun lt!364355 () Unit!27684)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!283 (array!44617 array!44619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23947 V!23947 V!23947 V!23947 (_ BitVec 32) Int) Unit!27684)

(assert (=> b!814154 (= lt!364355 (lemmaNoChangeToArrayThenSameMapNoExtras!283 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2190 (array!44617 array!44619 (_ BitVec 32) (_ BitVec 32) V!23947 V!23947 (_ BitVec 32) Int) ListLongMap!8219)

(assert (=> b!814154 (= lt!364356 (getCurrentListMapNoExtraKeys!2190 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814154 (= lt!364354 (getCurrentListMapNoExtraKeys!2190 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70058 res!556148) b!814151))

(assert (= (and b!814151 res!556147) b!814150))

(assert (= (and b!814150 res!556146) b!814148))

(assert (= (and b!814148 res!556145) b!814154))

(assert (= (and b!814153 condMapEmpty!22894) mapIsEmpty!22894))

(assert (= (and b!814153 (not condMapEmpty!22894)) mapNonEmpty!22894))

(get-info :version)

(assert (= (and mapNonEmpty!22894 ((_ is ValueCellFull!6689) mapValue!22894)) b!814152))

(assert (= (and b!814153 ((_ is ValueCellFull!6689) mapDefault!22894)) b!814149))

(assert (= start!70058 b!814153))

(declare-fun m!755463 () Bool)

(assert (=> b!814148 m!755463))

(declare-fun m!755465 () Bool)

(assert (=> mapNonEmpty!22894 m!755465))

(declare-fun m!755467 () Bool)

(assert (=> start!70058 m!755467))

(declare-fun m!755469 () Bool)

(assert (=> start!70058 m!755469))

(declare-fun m!755471 () Bool)

(assert (=> start!70058 m!755471))

(declare-fun m!755473 () Bool)

(assert (=> b!814150 m!755473))

(declare-fun m!755475 () Bool)

(assert (=> b!814154 m!755475))

(declare-fun m!755477 () Bool)

(assert (=> b!814154 m!755477))

(declare-fun m!755479 () Bool)

(assert (=> b!814154 m!755479))

(check-sat (not b_next!12499) (not b!814154) (not b!814150) b_and!21245 (not start!70058) (not mapNonEmpty!22894) tp_is_empty!14209 (not b!814148))
(check-sat b_and!21245 (not b_next!12499))
