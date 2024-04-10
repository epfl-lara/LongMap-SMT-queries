; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104670 () Bool)

(assert start!104670)

(declare-fun b_free!26487 () Bool)

(declare-fun b_next!26487 () Bool)

(assert (=> start!104670 (= b_free!26487 (not b_next!26487))))

(declare-fun tp!92947 () Bool)

(declare-fun b_and!44251 () Bool)

(assert (=> start!104670 (= tp!92947 b_and!44251)))

(declare-fun mapNonEmpty!48841 () Bool)

(declare-fun mapRes!48841 () Bool)

(declare-fun tp!92948 () Bool)

(declare-fun e!708064 () Bool)

(assert (=> mapNonEmpty!48841 (= mapRes!48841 (and tp!92948 e!708064))))

(declare-datatypes ((V!47217 0))(
  ( (V!47218 (val!15757 Int)) )
))
(declare-datatypes ((ValueCell!14931 0))(
  ( (ValueCellFull!14931 (v!18453 V!47217)) (EmptyCell!14931) )
))
(declare-fun mapValue!48841 () ValueCell!14931)

(declare-fun mapKey!48841 () (_ BitVec 32))

(declare-fun mapRest!48841 () (Array (_ BitVec 32) ValueCell!14931))

(declare-datatypes ((array!80472 0))(
  ( (array!80473 (arr!38804 (Array (_ BitVec 32) ValueCell!14931)) (size!39340 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80472)

(assert (=> mapNonEmpty!48841 (= (arr!38804 _values!914) (store mapRest!48841 mapKey!48841 mapValue!48841))))

(declare-fun b!1247930 () Bool)

(declare-fun e!708060 () Bool)

(declare-fun tp_is_empty!31389 () Bool)

(assert (=> b!1247930 (= e!708060 tp_is_empty!31389)))

(declare-fun b!1247931 () Bool)

(declare-fun res!832620 () Bool)

(declare-fun e!708061 () Bool)

(assert (=> b!1247931 (=> (not res!832620) (not e!708061))))

(declare-datatypes ((array!80474 0))(
  ( (array!80475 (arr!38805 (Array (_ BitVec 32) (_ BitVec 64))) (size!39341 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80474)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80474 (_ BitVec 32)) Bool)

(assert (=> b!1247931 (= res!832620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247932 () Bool)

(declare-fun e!708063 () Bool)

(assert (=> b!1247932 (= e!708063 (and e!708060 mapRes!48841))))

(declare-fun condMapEmpty!48841 () Bool)

(declare-fun mapDefault!48841 () ValueCell!14931)

(assert (=> b!1247932 (= condMapEmpty!48841 (= (arr!38804 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14931)) mapDefault!48841)))))

(declare-fun b!1247933 () Bool)

(assert (=> b!1247933 (= e!708064 tp_is_empty!31389)))

(declare-fun b!1247934 () Bool)

(declare-fun res!832618 () Bool)

(assert (=> b!1247934 (=> (not res!832618) (not e!708061))))

(declare-datatypes ((List!27543 0))(
  ( (Nil!27540) (Cons!27539 (h!28748 (_ BitVec 64)) (t!41012 List!27543)) )
))
(declare-fun arrayNoDuplicates!0 (array!80474 (_ BitVec 32) List!27543) Bool)

(assert (=> b!1247934 (= res!832618 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27540))))

(declare-fun b!1247935 () Bool)

(declare-fun res!832617 () Bool)

(assert (=> b!1247935 (=> (not res!832617) (not e!708061))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247935 (= res!832617 (and (= (size!39340 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39341 _keys!1118) (size!39340 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48841 () Bool)

(assert (=> mapIsEmpty!48841 mapRes!48841))

(declare-fun b!1247936 () Bool)

(assert (=> b!1247936 (= e!708061 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20296 0))(
  ( (tuple2!20297 (_1!10159 (_ BitVec 64)) (_2!10159 V!47217)) )
))
(declare-datatypes ((List!27544 0))(
  ( (Nil!27541) (Cons!27540 (h!28749 tuple2!20296) (t!41013 List!27544)) )
))
(declare-datatypes ((ListLongMap!18169 0))(
  ( (ListLongMap!18170 (toList!9100 List!27544)) )
))
(declare-fun lt!563335 () ListLongMap!18169)

(declare-fun zeroValue!871 () V!47217)

(declare-fun minValueBefore!43 () V!47217)

(declare-fun getCurrentListMapNoExtraKeys!5507 (array!80474 array!80472 (_ BitVec 32) (_ BitVec 32) V!47217 V!47217 (_ BitVec 32) Int) ListLongMap!18169)

(assert (=> b!1247936 (= lt!563335 (getCurrentListMapNoExtraKeys!5507 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!832619 () Bool)

(assert (=> start!104670 (=> (not res!832619) (not e!708061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104670 (= res!832619 (validMask!0 mask!1466))))

(assert (=> start!104670 e!708061))

(assert (=> start!104670 true))

(assert (=> start!104670 tp!92947))

(assert (=> start!104670 tp_is_empty!31389))

(declare-fun array_inv!29625 (array!80474) Bool)

(assert (=> start!104670 (array_inv!29625 _keys!1118)))

(declare-fun array_inv!29626 (array!80472) Bool)

(assert (=> start!104670 (and (array_inv!29626 _values!914) e!708063)))

(assert (= (and start!104670 res!832619) b!1247935))

(assert (= (and b!1247935 res!832617) b!1247931))

(assert (= (and b!1247931 res!832620) b!1247934))

(assert (= (and b!1247934 res!832618) b!1247936))

(assert (= (and b!1247932 condMapEmpty!48841) mapIsEmpty!48841))

(assert (= (and b!1247932 (not condMapEmpty!48841)) mapNonEmpty!48841))

(get-info :version)

(assert (= (and mapNonEmpty!48841 ((_ is ValueCellFull!14931) mapValue!48841)) b!1247933))

(assert (= (and b!1247932 ((_ is ValueCellFull!14931) mapDefault!48841)) b!1247930))

(assert (= start!104670 b!1247932))

(declare-fun m!1149263 () Bool)

(assert (=> b!1247936 m!1149263))

(declare-fun m!1149265 () Bool)

(assert (=> b!1247934 m!1149265))

(declare-fun m!1149267 () Bool)

(assert (=> start!104670 m!1149267))

(declare-fun m!1149269 () Bool)

(assert (=> start!104670 m!1149269))

(declare-fun m!1149271 () Bool)

(assert (=> start!104670 m!1149271))

(declare-fun m!1149273 () Bool)

(assert (=> b!1247931 m!1149273))

(declare-fun m!1149275 () Bool)

(assert (=> mapNonEmpty!48841 m!1149275))

(check-sat (not b!1247931) (not mapNonEmpty!48841) (not b!1247934) (not b!1247936) (not b_next!26487) tp_is_empty!31389 b_and!44251 (not start!104670))
(check-sat b_and!44251 (not b_next!26487))
