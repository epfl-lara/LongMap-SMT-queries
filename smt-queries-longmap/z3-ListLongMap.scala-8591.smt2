; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105000 () Bool)

(assert start!105000)

(declare-fun b_free!26581 () Bool)

(declare-fun b_next!26581 () Bool)

(assert (=> start!105000 (= b_free!26581 (not b_next!26581))))

(declare-fun tp!93232 () Bool)

(declare-fun b_and!44351 () Bool)

(assert (=> start!105000 (= tp!93232 b_and!44351)))

(declare-fun b!1250295 () Bool)

(declare-fun e!709661 () Bool)

(assert (=> b!1250295 (= e!709661 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47343 0))(
  ( (V!47344 (val!15804 Int)) )
))
(declare-fun minValueAfter!43 () V!47343)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47343)

(declare-datatypes ((array!80685 0))(
  ( (array!80686 (arr!38905 (Array (_ BitVec 32) (_ BitVec 64))) (size!39442 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80685)

(declare-datatypes ((ValueCell!14978 0))(
  ( (ValueCellFull!14978 (v!18496 V!47343)) (EmptyCell!14978) )
))
(declare-datatypes ((array!80687 0))(
  ( (array!80688 (arr!38906 (Array (_ BitVec 32) ValueCell!14978)) (size!39443 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80687)

(declare-datatypes ((tuple2!20382 0))(
  ( (tuple2!20383 (_1!10202 (_ BitVec 64)) (_2!10202 V!47343)) )
))
(declare-datatypes ((List!27635 0))(
  ( (Nil!27632) (Cons!27631 (h!28849 tuple2!20382) (t!41098 List!27635)) )
))
(declare-datatypes ((ListLongMap!18263 0))(
  ( (ListLongMap!18264 (toList!9147 List!27635)) )
))
(declare-fun lt!564055 () ListLongMap!18263)

(declare-fun getCurrentListMapNoExtraKeys!5582 (array!80685 array!80687 (_ BitVec 32) (_ BitVec 32) V!47343 V!47343 (_ BitVec 32) Int) ListLongMap!18263)

(assert (=> b!1250295 (= lt!564055 (getCurrentListMapNoExtraKeys!5582 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47343)

(declare-fun lt!564056 () ListLongMap!18263)

(assert (=> b!1250295 (= lt!564056 (getCurrentListMapNoExtraKeys!5582 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48985 () Bool)

(declare-fun mapRes!48985 () Bool)

(declare-fun tp!93233 () Bool)

(declare-fun e!709660 () Bool)

(assert (=> mapNonEmpty!48985 (= mapRes!48985 (and tp!93233 e!709660))))

(declare-fun mapKey!48985 () (_ BitVec 32))

(declare-fun mapValue!48985 () ValueCell!14978)

(declare-fun mapRest!48985 () (Array (_ BitVec 32) ValueCell!14978))

(assert (=> mapNonEmpty!48985 (= (arr!38906 _values!914) (store mapRest!48985 mapKey!48985 mapValue!48985))))

(declare-fun res!833730 () Bool)

(assert (=> start!105000 (=> (not res!833730) (not e!709661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105000 (= res!833730 (validMask!0 mask!1466))))

(assert (=> start!105000 e!709661))

(assert (=> start!105000 true))

(assert (=> start!105000 tp!93232))

(declare-fun tp_is_empty!31483 () Bool)

(assert (=> start!105000 tp_is_empty!31483))

(declare-fun array_inv!29795 (array!80685) Bool)

(assert (=> start!105000 (array_inv!29795 _keys!1118)))

(declare-fun e!709663 () Bool)

(declare-fun array_inv!29796 (array!80687) Bool)

(assert (=> start!105000 (and (array_inv!29796 _values!914) e!709663)))

(declare-fun b!1250296 () Bool)

(declare-fun e!709662 () Bool)

(assert (=> b!1250296 (= e!709663 (and e!709662 mapRes!48985))))

(declare-fun condMapEmpty!48985 () Bool)

(declare-fun mapDefault!48985 () ValueCell!14978)

(assert (=> b!1250296 (= condMapEmpty!48985 (= (arr!38906 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14978)) mapDefault!48985)))))

(declare-fun b!1250297 () Bool)

(declare-fun res!833728 () Bool)

(assert (=> b!1250297 (=> (not res!833728) (not e!709661))))

(assert (=> b!1250297 (= res!833728 (and (= (size!39443 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39442 _keys!1118) (size!39443 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48985 () Bool)

(assert (=> mapIsEmpty!48985 mapRes!48985))

(declare-fun b!1250298 () Bool)

(declare-fun res!833731 () Bool)

(assert (=> b!1250298 (=> (not res!833731) (not e!709661))))

(declare-datatypes ((List!27636 0))(
  ( (Nil!27633) (Cons!27632 (h!28850 (_ BitVec 64)) (t!41099 List!27636)) )
))
(declare-fun arrayNoDuplicates!0 (array!80685 (_ BitVec 32) List!27636) Bool)

(assert (=> b!1250298 (= res!833731 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27633))))

(declare-fun b!1250299 () Bool)

(assert (=> b!1250299 (= e!709662 tp_is_empty!31483)))

(declare-fun b!1250300 () Bool)

(assert (=> b!1250300 (= e!709660 tp_is_empty!31483)))

(declare-fun b!1250301 () Bool)

(declare-fun res!833729 () Bool)

(assert (=> b!1250301 (=> (not res!833729) (not e!709661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80685 (_ BitVec 32)) Bool)

(assert (=> b!1250301 (= res!833729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105000 res!833730) b!1250297))

(assert (= (and b!1250297 res!833728) b!1250301))

(assert (= (and b!1250301 res!833729) b!1250298))

(assert (= (and b!1250298 res!833731) b!1250295))

(assert (= (and b!1250296 condMapEmpty!48985) mapIsEmpty!48985))

(assert (= (and b!1250296 (not condMapEmpty!48985)) mapNonEmpty!48985))

(get-info :version)

(assert (= (and mapNonEmpty!48985 ((_ is ValueCellFull!14978) mapValue!48985)) b!1250300))

(assert (= (and b!1250296 ((_ is ValueCellFull!14978) mapDefault!48985)) b!1250299))

(assert (= start!105000 b!1250296))

(declare-fun m!1151619 () Bool)

(assert (=> b!1250298 m!1151619))

(declare-fun m!1151621 () Bool)

(assert (=> start!105000 m!1151621))

(declare-fun m!1151623 () Bool)

(assert (=> start!105000 m!1151623))

(declare-fun m!1151625 () Bool)

(assert (=> start!105000 m!1151625))

(declare-fun m!1151627 () Bool)

(assert (=> b!1250301 m!1151627))

(declare-fun m!1151629 () Bool)

(assert (=> mapNonEmpty!48985 m!1151629))

(declare-fun m!1151631 () Bool)

(assert (=> b!1250295 m!1151631))

(declare-fun m!1151633 () Bool)

(assert (=> b!1250295 m!1151633))

(check-sat (not b_next!26581) (not b!1250295) tp_is_empty!31483 (not mapNonEmpty!48985) (not b!1250298) (not b!1250301) b_and!44351 (not start!105000))
(check-sat b_and!44351 (not b_next!26581))
