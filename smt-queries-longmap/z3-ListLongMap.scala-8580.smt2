; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104922 () Bool)

(assert start!104922)

(declare-fun b_free!26515 () Bool)

(declare-fun b_next!26515 () Bool)

(assert (=> start!104922 (= b_free!26515 (not b_next!26515))))

(declare-fun tp!93031 () Bool)

(declare-fun b_and!44281 () Bool)

(assert (=> start!104922 (= tp!93031 b_and!44281)))

(declare-fun b!1249529 () Bool)

(declare-fun e!709118 () Bool)

(declare-fun tp_is_empty!31417 () Bool)

(assert (=> b!1249529 (= e!709118 tp_is_empty!31417)))

(declare-fun res!833306 () Bool)

(declare-fun e!709120 () Bool)

(assert (=> start!104922 (=> (not res!833306) (not e!709120))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104922 (= res!833306 (validMask!0 mask!1466))))

(assert (=> start!104922 e!709120))

(assert (=> start!104922 true))

(assert (=> start!104922 tp!93031))

(assert (=> start!104922 tp_is_empty!31417))

(declare-datatypes ((array!80559 0))(
  ( (array!80560 (arr!38843 (Array (_ BitVec 32) (_ BitVec 64))) (size!39380 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80559)

(declare-fun array_inv!29755 (array!80559) Bool)

(assert (=> start!104922 (array_inv!29755 _keys!1118)))

(declare-datatypes ((V!47255 0))(
  ( (V!47256 (val!15771 Int)) )
))
(declare-datatypes ((ValueCell!14945 0))(
  ( (ValueCellFull!14945 (v!18463 V!47255)) (EmptyCell!14945) )
))
(declare-datatypes ((array!80561 0))(
  ( (array!80562 (arr!38844 (Array (_ BitVec 32) ValueCell!14945)) (size!39381 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80561)

(declare-fun e!709117 () Bool)

(declare-fun array_inv!29756 (array!80561) Bool)

(assert (=> start!104922 (and (array_inv!29756 _values!914) e!709117)))

(declare-fun b!1249530 () Bool)

(declare-fun e!709119 () Bool)

(assert (=> b!1249530 (= e!709119 tp_is_empty!31417)))

(declare-fun mapIsEmpty!48883 () Bool)

(declare-fun mapRes!48883 () Bool)

(assert (=> mapIsEmpty!48883 mapRes!48883))

(declare-fun b!1249531 () Bool)

(assert (=> b!1249531 (= e!709120 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20332 0))(
  ( (tuple2!20333 (_1!10177 (_ BitVec 64)) (_2!10177 V!47255)) )
))
(declare-datatypes ((List!27588 0))(
  ( (Nil!27585) (Cons!27584 (h!28802 tuple2!20332) (t!41049 List!27588)) )
))
(declare-datatypes ((ListLongMap!18213 0))(
  ( (ListLongMap!18214 (toList!9122 List!27588)) )
))
(declare-fun lt!563861 () ListLongMap!18213)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47255)

(declare-fun minValueBefore!43 () V!47255)

(declare-fun getCurrentListMapNoExtraKeys!5557 (array!80559 array!80561 (_ BitVec 32) (_ BitVec 32) V!47255 V!47255 (_ BitVec 32) Int) ListLongMap!18213)

(assert (=> b!1249531 (= lt!563861 (getCurrentListMapNoExtraKeys!5557 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249532 () Bool)

(declare-fun res!833308 () Bool)

(assert (=> b!1249532 (=> (not res!833308) (not e!709120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80559 (_ BitVec 32)) Bool)

(assert (=> b!1249532 (= res!833308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48883 () Bool)

(declare-fun tp!93032 () Bool)

(assert (=> mapNonEmpty!48883 (= mapRes!48883 (and tp!93032 e!709119))))

(declare-fun mapKey!48883 () (_ BitVec 32))

(declare-fun mapValue!48883 () ValueCell!14945)

(declare-fun mapRest!48883 () (Array (_ BitVec 32) ValueCell!14945))

(assert (=> mapNonEmpty!48883 (= (arr!38844 _values!914) (store mapRest!48883 mapKey!48883 mapValue!48883))))

(declare-fun b!1249533 () Bool)

(assert (=> b!1249533 (= e!709117 (and e!709118 mapRes!48883))))

(declare-fun condMapEmpty!48883 () Bool)

(declare-fun mapDefault!48883 () ValueCell!14945)

(assert (=> b!1249533 (= condMapEmpty!48883 (= (arr!38844 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14945)) mapDefault!48883)))))

(declare-fun b!1249534 () Bool)

(declare-fun res!833307 () Bool)

(assert (=> b!1249534 (=> (not res!833307) (not e!709120))))

(declare-datatypes ((List!27589 0))(
  ( (Nil!27586) (Cons!27585 (h!28803 (_ BitVec 64)) (t!41050 List!27589)) )
))
(declare-fun arrayNoDuplicates!0 (array!80559 (_ BitVec 32) List!27589) Bool)

(assert (=> b!1249534 (= res!833307 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27586))))

(declare-fun b!1249535 () Bool)

(declare-fun res!833305 () Bool)

(assert (=> b!1249535 (=> (not res!833305) (not e!709120))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249535 (= res!833305 (and (= (size!39381 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39380 _keys!1118) (size!39381 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104922 res!833306) b!1249535))

(assert (= (and b!1249535 res!833305) b!1249532))

(assert (= (and b!1249532 res!833308) b!1249534))

(assert (= (and b!1249534 res!833307) b!1249531))

(assert (= (and b!1249533 condMapEmpty!48883) mapIsEmpty!48883))

(assert (= (and b!1249533 (not condMapEmpty!48883)) mapNonEmpty!48883))

(get-info :version)

(assert (= (and mapNonEmpty!48883 ((_ is ValueCellFull!14945) mapValue!48883)) b!1249530))

(assert (= (and b!1249533 ((_ is ValueCellFull!14945) mapDefault!48883)) b!1249529))

(assert (= start!104922 b!1249533))

(declare-fun m!1151071 () Bool)

(assert (=> b!1249534 m!1151071))

(declare-fun m!1151073 () Bool)

(assert (=> start!104922 m!1151073))

(declare-fun m!1151075 () Bool)

(assert (=> start!104922 m!1151075))

(declare-fun m!1151077 () Bool)

(assert (=> start!104922 m!1151077))

(declare-fun m!1151079 () Bool)

(assert (=> b!1249531 m!1151079))

(declare-fun m!1151081 () Bool)

(assert (=> b!1249532 m!1151081))

(declare-fun m!1151083 () Bool)

(assert (=> mapNonEmpty!48883 m!1151083))

(check-sat (not b!1249534) (not b!1249532) (not mapNonEmpty!48883) (not b_next!26515) (not b!1249531) (not start!104922) b_and!44281 tp_is_empty!31417)
(check-sat b_and!44281 (not b_next!26515))
