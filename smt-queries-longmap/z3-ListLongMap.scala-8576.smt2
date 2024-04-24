; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104898 () Bool)

(assert start!104898)

(declare-fun b_free!26491 () Bool)

(declare-fun b_next!26491 () Bool)

(assert (=> start!104898 (= b_free!26491 (not b_next!26491))))

(declare-fun tp!92960 () Bool)

(declare-fun b_and!44257 () Bool)

(assert (=> start!104898 (= tp!92960 b_and!44257)))

(declare-fun b!1249277 () Bool)

(declare-fun e!708939 () Bool)

(declare-fun e!708941 () Bool)

(declare-fun mapRes!48847 () Bool)

(assert (=> b!1249277 (= e!708939 (and e!708941 mapRes!48847))))

(declare-fun condMapEmpty!48847 () Bool)

(declare-datatypes ((V!47223 0))(
  ( (V!47224 (val!15759 Int)) )
))
(declare-datatypes ((ValueCell!14933 0))(
  ( (ValueCellFull!14933 (v!18451 V!47223)) (EmptyCell!14933) )
))
(declare-datatypes ((array!80511 0))(
  ( (array!80512 (arr!38819 (Array (_ BitVec 32) ValueCell!14933)) (size!39356 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80511)

(declare-fun mapDefault!48847 () ValueCell!14933)

(assert (=> b!1249277 (= condMapEmpty!48847 (= (arr!38819 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14933)) mapDefault!48847)))))

(declare-fun mapNonEmpty!48847 () Bool)

(declare-fun tp!92959 () Bool)

(declare-fun e!708940 () Bool)

(assert (=> mapNonEmpty!48847 (= mapRes!48847 (and tp!92959 e!708940))))

(declare-fun mapKey!48847 () (_ BitVec 32))

(declare-fun mapRest!48847 () (Array (_ BitVec 32) ValueCell!14933))

(declare-fun mapValue!48847 () ValueCell!14933)

(assert (=> mapNonEmpty!48847 (= (arr!38819 _values!914) (store mapRest!48847 mapKey!48847 mapValue!48847))))

(declare-fun res!833162 () Bool)

(declare-fun e!708938 () Bool)

(assert (=> start!104898 (=> (not res!833162) (not e!708938))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104898 (= res!833162 (validMask!0 mask!1466))))

(assert (=> start!104898 e!708938))

(assert (=> start!104898 true))

(assert (=> start!104898 tp!92960))

(declare-fun tp_is_empty!31393 () Bool)

(assert (=> start!104898 tp_is_empty!31393))

(declare-datatypes ((array!80513 0))(
  ( (array!80514 (arr!38820 (Array (_ BitVec 32) (_ BitVec 64))) (size!39357 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80513)

(declare-fun array_inv!29733 (array!80513) Bool)

(assert (=> start!104898 (array_inv!29733 _keys!1118)))

(declare-fun array_inv!29734 (array!80511) Bool)

(assert (=> start!104898 (and (array_inv!29734 _values!914) e!708939)))

(declare-fun b!1249278 () Bool)

(assert (=> b!1249278 (= e!708940 tp_is_empty!31393)))

(declare-fun b!1249279 () Bool)

(declare-fun res!833164 () Bool)

(assert (=> b!1249279 (=> (not res!833164) (not e!708938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80513 (_ BitVec 32)) Bool)

(assert (=> b!1249279 (= res!833164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249280 () Bool)

(assert (=> b!1249280 (= e!708938 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47223)

(declare-fun minValueBefore!43 () V!47223)

(declare-datatypes ((tuple2!20312 0))(
  ( (tuple2!20313 (_1!10167 (_ BitVec 64)) (_2!10167 V!47223)) )
))
(declare-datatypes ((List!27568 0))(
  ( (Nil!27565) (Cons!27564 (h!28782 tuple2!20312) (t!41029 List!27568)) )
))
(declare-datatypes ((ListLongMap!18193 0))(
  ( (ListLongMap!18194 (toList!9112 List!27568)) )
))
(declare-fun lt!563825 () ListLongMap!18193)

(declare-fun getCurrentListMapNoExtraKeys!5547 (array!80513 array!80511 (_ BitVec 32) (_ BitVec 32) V!47223 V!47223 (_ BitVec 32) Int) ListLongMap!18193)

(assert (=> b!1249280 (= lt!563825 (getCurrentListMapNoExtraKeys!5547 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48847 () Bool)

(assert (=> mapIsEmpty!48847 mapRes!48847))

(declare-fun b!1249281 () Bool)

(declare-fun res!833163 () Bool)

(assert (=> b!1249281 (=> (not res!833163) (not e!708938))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249281 (= res!833163 (and (= (size!39356 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39357 _keys!1118) (size!39356 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249282 () Bool)

(declare-fun res!833161 () Bool)

(assert (=> b!1249282 (=> (not res!833161) (not e!708938))))

(declare-datatypes ((List!27569 0))(
  ( (Nil!27566) (Cons!27565 (h!28783 (_ BitVec 64)) (t!41030 List!27569)) )
))
(declare-fun arrayNoDuplicates!0 (array!80513 (_ BitVec 32) List!27569) Bool)

(assert (=> b!1249282 (= res!833161 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27566))))

(declare-fun b!1249283 () Bool)

(assert (=> b!1249283 (= e!708941 tp_is_empty!31393)))

(assert (= (and start!104898 res!833162) b!1249281))

(assert (= (and b!1249281 res!833163) b!1249279))

(assert (= (and b!1249279 res!833164) b!1249282))

(assert (= (and b!1249282 res!833161) b!1249280))

(assert (= (and b!1249277 condMapEmpty!48847) mapIsEmpty!48847))

(assert (= (and b!1249277 (not condMapEmpty!48847)) mapNonEmpty!48847))

(get-info :version)

(assert (= (and mapNonEmpty!48847 ((_ is ValueCellFull!14933) mapValue!48847)) b!1249278))

(assert (= (and b!1249277 ((_ is ValueCellFull!14933) mapDefault!48847)) b!1249283))

(assert (= start!104898 b!1249277))

(declare-fun m!1150903 () Bool)

(assert (=> b!1249282 m!1150903))

(declare-fun m!1150905 () Bool)

(assert (=> b!1249280 m!1150905))

(declare-fun m!1150907 () Bool)

(assert (=> mapNonEmpty!48847 m!1150907))

(declare-fun m!1150909 () Bool)

(assert (=> b!1249279 m!1150909))

(declare-fun m!1150911 () Bool)

(assert (=> start!104898 m!1150911))

(declare-fun m!1150913 () Bool)

(assert (=> start!104898 m!1150913))

(declare-fun m!1150915 () Bool)

(assert (=> start!104898 m!1150915))

(check-sat (not b!1249282) (not b_next!26491) (not start!104898) (not mapNonEmpty!48847) (not b!1249279) tp_is_empty!31393 b_and!44257 (not b!1249280))
(check-sat b_and!44257 (not b_next!26491))
