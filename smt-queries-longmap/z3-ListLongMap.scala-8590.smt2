; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104766 () Bool)

(assert start!104766)

(declare-fun b_free!26575 () Bool)

(declare-fun b_next!26575 () Bool)

(assert (=> start!104766 (= b_free!26575 (not b_next!26575))))

(declare-fun tp!93215 () Bool)

(declare-fun b_and!44325 () Bool)

(assert (=> start!104766 (= tp!93215 b_and!44325)))

(declare-fun mapNonEmpty!48976 () Bool)

(declare-fun mapRes!48976 () Bool)

(declare-fun tp!93214 () Bool)

(declare-fun e!708727 () Bool)

(assert (=> mapNonEmpty!48976 (= mapRes!48976 (and tp!93214 e!708727))))

(declare-datatypes ((V!47335 0))(
  ( (V!47336 (val!15801 Int)) )
))
(declare-datatypes ((ValueCell!14975 0))(
  ( (ValueCellFull!14975 (v!18496 V!47335)) (EmptyCell!14975) )
))
(declare-fun mapValue!48976 () ValueCell!14975)

(declare-fun mapRest!48976 () (Array (_ BitVec 32) ValueCell!14975))

(declare-datatypes ((array!80553 0))(
  ( (array!80554 (arr!38844 (Array (_ BitVec 32) ValueCell!14975)) (size!39382 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80553)

(declare-fun mapKey!48976 () (_ BitVec 32))

(assert (=> mapNonEmpty!48976 (= (arr!38844 _values!914) (store mapRest!48976 mapKey!48976 mapValue!48976))))

(declare-fun b!1248845 () Bool)

(declare-fun e!708724 () Bool)

(assert (=> b!1248845 (= e!708724 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47335)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47335)

(declare-datatypes ((tuple2!20430 0))(
  ( (tuple2!20431 (_1!10226 (_ BitVec 64)) (_2!10226 V!47335)) )
))
(declare-datatypes ((List!27660 0))(
  ( (Nil!27657) (Cons!27656 (h!28865 tuple2!20430) (t!41122 List!27660)) )
))
(declare-datatypes ((ListLongMap!18303 0))(
  ( (ListLongMap!18304 (toList!9167 List!27660)) )
))
(declare-fun lt!563375 () ListLongMap!18303)

(declare-datatypes ((array!80555 0))(
  ( (array!80556 (arr!38845 (Array (_ BitVec 32) (_ BitVec 64))) (size!39383 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80555)

(declare-fun getCurrentListMapNoExtraKeys!5584 (array!80555 array!80553 (_ BitVec 32) (_ BitVec 32) V!47335 V!47335 (_ BitVec 32) Int) ListLongMap!18303)

(assert (=> b!1248845 (= lt!563375 (getCurrentListMapNoExtraKeys!5584 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47335)

(declare-fun lt!563374 () ListLongMap!18303)

(assert (=> b!1248845 (= lt!563374 (getCurrentListMapNoExtraKeys!5584 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48976 () Bool)

(assert (=> mapIsEmpty!48976 mapRes!48976))

(declare-fun b!1248846 () Bool)

(declare-fun res!833133 () Bool)

(assert (=> b!1248846 (=> (not res!833133) (not e!708724))))

(assert (=> b!1248846 (= res!833133 (and (= (size!39382 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39383 _keys!1118) (size!39382 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833135 () Bool)

(assert (=> start!104766 (=> (not res!833135) (not e!708724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104766 (= res!833135 (validMask!0 mask!1466))))

(assert (=> start!104766 e!708724))

(assert (=> start!104766 true))

(assert (=> start!104766 tp!93215))

(declare-fun tp_is_empty!31477 () Bool)

(assert (=> start!104766 tp_is_empty!31477))

(declare-fun array_inv!29779 (array!80555) Bool)

(assert (=> start!104766 (array_inv!29779 _keys!1118)))

(declare-fun e!708725 () Bool)

(declare-fun array_inv!29780 (array!80553) Bool)

(assert (=> start!104766 (and (array_inv!29780 _values!914) e!708725)))

(declare-fun b!1248847 () Bool)

(assert (=> b!1248847 (= e!708727 tp_is_empty!31477)))

(declare-fun b!1248848 () Bool)

(declare-fun e!708723 () Bool)

(assert (=> b!1248848 (= e!708723 tp_is_empty!31477)))

(declare-fun b!1248849 () Bool)

(declare-fun res!833132 () Bool)

(assert (=> b!1248849 (=> (not res!833132) (not e!708724))))

(declare-datatypes ((List!27661 0))(
  ( (Nil!27658) (Cons!27657 (h!28866 (_ BitVec 64)) (t!41123 List!27661)) )
))
(declare-fun arrayNoDuplicates!0 (array!80555 (_ BitVec 32) List!27661) Bool)

(assert (=> b!1248849 (= res!833132 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27658))))

(declare-fun b!1248850 () Bool)

(assert (=> b!1248850 (= e!708725 (and e!708723 mapRes!48976))))

(declare-fun condMapEmpty!48976 () Bool)

(declare-fun mapDefault!48976 () ValueCell!14975)

(assert (=> b!1248850 (= condMapEmpty!48976 (= (arr!38844 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14975)) mapDefault!48976)))))

(declare-fun b!1248851 () Bool)

(declare-fun res!833134 () Bool)

(assert (=> b!1248851 (=> (not res!833134) (not e!708724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80555 (_ BitVec 32)) Bool)

(assert (=> b!1248851 (= res!833134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104766 res!833135) b!1248846))

(assert (= (and b!1248846 res!833133) b!1248851))

(assert (= (and b!1248851 res!833134) b!1248849))

(assert (= (and b!1248849 res!833132) b!1248845))

(assert (= (and b!1248850 condMapEmpty!48976) mapIsEmpty!48976))

(assert (= (and b!1248850 (not condMapEmpty!48976)) mapNonEmpty!48976))

(get-info :version)

(assert (= (and mapNonEmpty!48976 ((_ is ValueCellFull!14975) mapValue!48976)) b!1248847))

(assert (= (and b!1248850 ((_ is ValueCellFull!14975) mapDefault!48976)) b!1248848))

(assert (= start!104766 b!1248850))

(declare-fun m!1149439 () Bool)

(assert (=> start!104766 m!1149439))

(declare-fun m!1149441 () Bool)

(assert (=> start!104766 m!1149441))

(declare-fun m!1149443 () Bool)

(assert (=> start!104766 m!1149443))

(declare-fun m!1149445 () Bool)

(assert (=> mapNonEmpty!48976 m!1149445))

(declare-fun m!1149447 () Bool)

(assert (=> b!1248849 m!1149447))

(declare-fun m!1149449 () Bool)

(assert (=> b!1248845 m!1149449))

(declare-fun m!1149451 () Bool)

(assert (=> b!1248845 m!1149451))

(declare-fun m!1149453 () Bool)

(assert (=> b!1248851 m!1149453))

(check-sat (not start!104766) (not b!1248849) tp_is_empty!31477 (not b_next!26575) (not mapNonEmpty!48976) b_and!44325 (not b!1248851) (not b!1248845))
(check-sat b_and!44325 (not b_next!26575))
