; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41778 () Bool)

(assert start!41778)

(declare-fun b_free!11413 () Bool)

(declare-fun b_next!11413 () Bool)

(assert (=> start!41778 (= b_free!11413 (not b_next!11413))))

(declare-fun tp!40245 () Bool)

(declare-fun b_and!19791 () Bool)

(assert (=> start!41778 (= tp!40245 b_and!19791)))

(declare-fun mapNonEmpty!20947 () Bool)

(declare-fun mapRes!20947 () Bool)

(declare-fun tp!40246 () Bool)

(declare-fun e!272866 () Bool)

(assert (=> mapNonEmpty!20947 (= mapRes!20947 (and tp!40246 e!272866))))

(declare-datatypes ((V!18227 0))(
  ( (V!18228 (val!6465 Int)) )
))
(declare-datatypes ((ValueCell!6077 0))(
  ( (ValueCellFull!6077 (v!8754 V!18227)) (EmptyCell!6077) )
))
(declare-fun mapValue!20947 () ValueCell!6077)

(declare-fun mapKey!20947 () (_ BitVec 32))

(declare-datatypes ((array!29456 0))(
  ( (array!29457 (arr!14156 (Array (_ BitVec 32) ValueCell!6077)) (size!14508 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29456)

(declare-fun mapRest!20947 () (Array (_ BitVec 32) ValueCell!6077))

(assert (=> mapNonEmpty!20947 (= (arr!14156 _values!833) (store mapRest!20947 mapKey!20947 mapValue!20947))))

(declare-fun b!466613 () Bool)

(declare-fun res!278944 () Bool)

(declare-fun e!272863 () Bool)

(assert (=> b!466613 (=> (not res!278944) (not e!272863))))

(declare-datatypes ((array!29458 0))(
  ( (array!29459 (arr!14157 (Array (_ BitVec 32) (_ BitVec 64))) (size!14509 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29458)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29458 (_ BitVec 32)) Bool)

(assert (=> b!466613 (= res!278944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466614 () Bool)

(declare-fun e!272865 () Bool)

(assert (=> b!466614 (= e!272865 true)))

(declare-fun zeroValue!794 () V!18227)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8416 0))(
  ( (tuple2!8417 (_1!4219 (_ BitVec 64)) (_2!4219 V!18227)) )
))
(declare-datatypes ((List!8496 0))(
  ( (Nil!8493) (Cons!8492 (h!9348 tuple2!8416) (t!14440 List!8496)) )
))
(declare-datatypes ((ListLongMap!7331 0))(
  ( (ListLongMap!7332 (toList!3681 List!8496)) )
))
(declare-fun lt!210954 () ListLongMap!7331)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18227)

(declare-fun getCurrentListMap!2129 (array!29458 array!29456 (_ BitVec 32) (_ BitVec 32) V!18227 V!18227 (_ BitVec 32) Int) ListLongMap!7331)

(assert (=> b!466614 (= lt!210954 (getCurrentListMap!2129 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18227)

(declare-fun lt!210950 () ListLongMap!7331)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1678 (ListLongMap!7331 tuple2!8416) ListLongMap!7331)

(assert (=> b!466614 (= lt!210950 (+!1678 (getCurrentListMap!2129 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8417 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278943 () Bool)

(assert (=> start!41778 (=> (not res!278943) (not e!272863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41778 (= res!278943 (validMask!0 mask!1365))))

(assert (=> start!41778 e!272863))

(declare-fun tp_is_empty!12841 () Bool)

(assert (=> start!41778 tp_is_empty!12841))

(assert (=> start!41778 tp!40245))

(assert (=> start!41778 true))

(declare-fun array_inv!10304 (array!29458) Bool)

(assert (=> start!41778 (array_inv!10304 _keys!1025)))

(declare-fun e!272864 () Bool)

(declare-fun array_inv!10305 (array!29456) Bool)

(assert (=> start!41778 (and (array_inv!10305 _values!833) e!272864)))

(declare-fun b!466615 () Bool)

(declare-fun res!278947 () Bool)

(assert (=> b!466615 (=> (not res!278947) (not e!272863))))

(declare-datatypes ((List!8497 0))(
  ( (Nil!8494) (Cons!8493 (h!9349 (_ BitVec 64)) (t!14441 List!8497)) )
))
(declare-fun arrayNoDuplicates!0 (array!29458 (_ BitVec 32) List!8497) Bool)

(assert (=> b!466615 (= res!278947 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8494))))

(declare-fun b!466616 () Bool)

(declare-fun e!272862 () Bool)

(assert (=> b!466616 (= e!272862 tp_is_empty!12841)))

(declare-fun b!466617 () Bool)

(assert (=> b!466617 (= e!272863 (not e!272865))))

(declare-fun res!278946 () Bool)

(assert (=> b!466617 (=> res!278946 e!272865)))

(assert (=> b!466617 (= res!278946 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210953 () ListLongMap!7331)

(declare-fun lt!210952 () ListLongMap!7331)

(assert (=> b!466617 (= lt!210953 lt!210952)))

(declare-datatypes ((Unit!13574 0))(
  ( (Unit!13575) )
))
(declare-fun lt!210951 () Unit!13574)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!64 (array!29458 array!29456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18227 V!18227 V!18227 V!18227 (_ BitVec 32) Int) Unit!13574)

(assert (=> b!466617 (= lt!210951 (lemmaNoChangeToArrayThenSameMapNoExtras!64 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1904 (array!29458 array!29456 (_ BitVec 32) (_ BitVec 32) V!18227 V!18227 (_ BitVec 32) Int) ListLongMap!7331)

(assert (=> b!466617 (= lt!210952 (getCurrentListMapNoExtraKeys!1904 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466617 (= lt!210953 (getCurrentListMapNoExtraKeys!1904 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466618 () Bool)

(assert (=> b!466618 (= e!272866 tp_is_empty!12841)))

(declare-fun mapIsEmpty!20947 () Bool)

(assert (=> mapIsEmpty!20947 mapRes!20947))

(declare-fun b!466619 () Bool)

(declare-fun res!278945 () Bool)

(assert (=> b!466619 (=> (not res!278945) (not e!272863))))

(assert (=> b!466619 (= res!278945 (and (= (size!14508 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14509 _keys!1025) (size!14508 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466620 () Bool)

(assert (=> b!466620 (= e!272864 (and e!272862 mapRes!20947))))

(declare-fun condMapEmpty!20947 () Bool)

(declare-fun mapDefault!20947 () ValueCell!6077)

(assert (=> b!466620 (= condMapEmpty!20947 (= (arr!14156 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6077)) mapDefault!20947)))))

(assert (= (and start!41778 res!278943) b!466619))

(assert (= (and b!466619 res!278945) b!466613))

(assert (= (and b!466613 res!278944) b!466615))

(assert (= (and b!466615 res!278947) b!466617))

(assert (= (and b!466617 (not res!278946)) b!466614))

(assert (= (and b!466620 condMapEmpty!20947) mapIsEmpty!20947))

(assert (= (and b!466620 (not condMapEmpty!20947)) mapNonEmpty!20947))

(get-info :version)

(assert (= (and mapNonEmpty!20947 ((_ is ValueCellFull!6077) mapValue!20947)) b!466618))

(assert (= (and b!466620 ((_ is ValueCellFull!6077) mapDefault!20947)) b!466616))

(assert (= start!41778 b!466620))

(declare-fun m!449073 () Bool)

(assert (=> start!41778 m!449073))

(declare-fun m!449075 () Bool)

(assert (=> start!41778 m!449075))

(declare-fun m!449077 () Bool)

(assert (=> start!41778 m!449077))

(declare-fun m!449079 () Bool)

(assert (=> b!466615 m!449079))

(declare-fun m!449081 () Bool)

(assert (=> b!466614 m!449081))

(declare-fun m!449083 () Bool)

(assert (=> b!466614 m!449083))

(assert (=> b!466614 m!449083))

(declare-fun m!449085 () Bool)

(assert (=> b!466614 m!449085))

(declare-fun m!449087 () Bool)

(assert (=> b!466617 m!449087))

(declare-fun m!449089 () Bool)

(assert (=> b!466617 m!449089))

(declare-fun m!449091 () Bool)

(assert (=> b!466617 m!449091))

(declare-fun m!449093 () Bool)

(assert (=> mapNonEmpty!20947 m!449093))

(declare-fun m!449095 () Bool)

(assert (=> b!466613 m!449095))

(check-sat (not b!466615) (not b!466617) (not b!466613) b_and!19791 (not start!41778) (not mapNonEmpty!20947) tp_is_empty!12841 (not b!466614) (not b_next!11413))
(check-sat b_and!19791 (not b_next!11413))
