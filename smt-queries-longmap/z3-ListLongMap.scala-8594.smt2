; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104796 () Bool)

(assert start!104796)

(declare-fun b_free!26601 () Bool)

(declare-fun b_next!26601 () Bool)

(assert (=> start!104796 (= b_free!26601 (not b_next!26601))))

(declare-fun tp!93293 () Bool)

(declare-fun b_and!44369 () Bool)

(assert (=> start!104796 (= tp!93293 b_and!44369)))

(declare-fun b!1249200 () Bool)

(declare-fun e!708966 () Bool)

(assert (=> b!1249200 (= e!708966 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47369 0))(
  ( (V!47370 (val!15814 Int)) )
))
(declare-datatypes ((tuple2!20374 0))(
  ( (tuple2!20375 (_1!10198 (_ BitVec 64)) (_2!10198 V!47369)) )
))
(declare-datatypes ((List!27619 0))(
  ( (Nil!27616) (Cons!27615 (h!28824 tuple2!20374) (t!41090 List!27619)) )
))
(declare-datatypes ((ListLongMap!18247 0))(
  ( (ListLongMap!18248 (toList!9139 List!27619)) )
))
(declare-fun lt!563631 () ListLongMap!18247)

(declare-fun minValueAfter!43 () V!47369)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47369)

(declare-datatypes ((ValueCell!14988 0))(
  ( (ValueCellFull!14988 (v!18510 V!47369)) (EmptyCell!14988) )
))
(declare-datatypes ((array!80690 0))(
  ( (array!80691 (arr!38912 (Array (_ BitVec 32) ValueCell!14988)) (size!39448 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80690)

(declare-datatypes ((array!80692 0))(
  ( (array!80693 (arr!38913 (Array (_ BitVec 32) (_ BitVec 64))) (size!39449 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80692)

(declare-fun getCurrentListMapNoExtraKeys!5546 (array!80692 array!80690 (_ BitVec 32) (_ BitVec 32) V!47369 V!47369 (_ BitVec 32) Int) ListLongMap!18247)

(assert (=> b!1249200 (= lt!563631 (getCurrentListMapNoExtraKeys!5546 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!563632 () ListLongMap!18247)

(declare-fun minValueBefore!43 () V!47369)

(assert (=> b!1249200 (= lt!563632 (getCurrentListMapNoExtraKeys!5546 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49015 () Bool)

(declare-fun mapRes!49015 () Bool)

(declare-fun tp!93292 () Bool)

(declare-fun e!708964 () Bool)

(assert (=> mapNonEmpty!49015 (= mapRes!49015 (and tp!93292 e!708964))))

(declare-fun mapKey!49015 () (_ BitVec 32))

(declare-fun mapRest!49015 () (Array (_ BitVec 32) ValueCell!14988))

(declare-fun mapValue!49015 () ValueCell!14988)

(assert (=> mapNonEmpty!49015 (= (arr!38912 _values!914) (store mapRest!49015 mapKey!49015 mapValue!49015))))

(declare-fun b!1249201 () Bool)

(declare-fun tp_is_empty!31503 () Bool)

(assert (=> b!1249201 (= e!708964 tp_is_empty!31503)))

(declare-fun b!1249202 () Bool)

(declare-fun e!708965 () Bool)

(assert (=> b!1249202 (= e!708965 tp_is_empty!31503)))

(declare-fun res!833328 () Bool)

(assert (=> start!104796 (=> (not res!833328) (not e!708966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104796 (= res!833328 (validMask!0 mask!1466))))

(assert (=> start!104796 e!708966))

(assert (=> start!104796 true))

(assert (=> start!104796 tp!93293))

(assert (=> start!104796 tp_is_empty!31503))

(declare-fun array_inv!29697 (array!80692) Bool)

(assert (=> start!104796 (array_inv!29697 _keys!1118)))

(declare-fun e!708967 () Bool)

(declare-fun array_inv!29698 (array!80690) Bool)

(assert (=> start!104796 (and (array_inv!29698 _values!914) e!708967)))

(declare-fun mapIsEmpty!49015 () Bool)

(assert (=> mapIsEmpty!49015 mapRes!49015))

(declare-fun b!1249203 () Bool)

(declare-fun res!833330 () Bool)

(assert (=> b!1249203 (=> (not res!833330) (not e!708966))))

(declare-datatypes ((List!27620 0))(
  ( (Nil!27617) (Cons!27616 (h!28825 (_ BitVec 64)) (t!41091 List!27620)) )
))
(declare-fun arrayNoDuplicates!0 (array!80692 (_ BitVec 32) List!27620) Bool)

(assert (=> b!1249203 (= res!833330 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27617))))

(declare-fun b!1249204 () Bool)

(declare-fun res!833329 () Bool)

(assert (=> b!1249204 (=> (not res!833329) (not e!708966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80692 (_ BitVec 32)) Bool)

(assert (=> b!1249204 (= res!833329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249205 () Bool)

(declare-fun res!833331 () Bool)

(assert (=> b!1249205 (=> (not res!833331) (not e!708966))))

(assert (=> b!1249205 (= res!833331 (and (= (size!39448 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39449 _keys!1118) (size!39448 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249206 () Bool)

(assert (=> b!1249206 (= e!708967 (and e!708965 mapRes!49015))))

(declare-fun condMapEmpty!49015 () Bool)

(declare-fun mapDefault!49015 () ValueCell!14988)

(assert (=> b!1249206 (= condMapEmpty!49015 (= (arr!38912 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14988)) mapDefault!49015)))))

(assert (= (and start!104796 res!833328) b!1249205))

(assert (= (and b!1249205 res!833331) b!1249204))

(assert (= (and b!1249204 res!833329) b!1249203))

(assert (= (and b!1249203 res!833330) b!1249200))

(assert (= (and b!1249206 condMapEmpty!49015) mapIsEmpty!49015))

(assert (= (and b!1249206 (not condMapEmpty!49015)) mapNonEmpty!49015))

(get-info :version)

(assert (= (and mapNonEmpty!49015 ((_ is ValueCellFull!14988) mapValue!49015)) b!1249201))

(assert (= (and b!1249206 ((_ is ValueCellFull!14988) mapDefault!49015)) b!1249202))

(assert (= start!104796 b!1249206))

(declare-fun m!1150167 () Bool)

(assert (=> mapNonEmpty!49015 m!1150167))

(declare-fun m!1150169 () Bool)

(assert (=> b!1249203 m!1150169))

(declare-fun m!1150171 () Bool)

(assert (=> start!104796 m!1150171))

(declare-fun m!1150173 () Bool)

(assert (=> start!104796 m!1150173))

(declare-fun m!1150175 () Bool)

(assert (=> start!104796 m!1150175))

(declare-fun m!1150177 () Bool)

(assert (=> b!1249204 m!1150177))

(declare-fun m!1150179 () Bool)

(assert (=> b!1249200 m!1150179))

(declare-fun m!1150181 () Bool)

(assert (=> b!1249200 m!1150181))

(check-sat (not b!1249200) (not start!104796) (not b!1249204) (not b!1249203) (not mapNonEmpty!49015) b_and!44369 (not b_next!26601) tp_is_empty!31503)
(check-sat b_and!44369 (not b_next!26601))
