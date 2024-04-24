; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104988 () Bool)

(assert start!104988)

(declare-fun b_free!26569 () Bool)

(declare-fun b_next!26569 () Bool)

(assert (=> start!104988 (= b_free!26569 (not b_next!26569))))

(declare-fun tp!93196 () Bool)

(declare-fun b_and!44339 () Bool)

(assert (=> start!104988 (= tp!93196 b_and!44339)))

(declare-fun mapNonEmpty!48967 () Bool)

(declare-fun mapRes!48967 () Bool)

(declare-fun tp!93197 () Bool)

(declare-fun e!709572 () Bool)

(assert (=> mapNonEmpty!48967 (= mapRes!48967 (and tp!93197 e!709572))))

(declare-datatypes ((V!47327 0))(
  ( (V!47328 (val!15798 Int)) )
))
(declare-datatypes ((ValueCell!14972 0))(
  ( (ValueCellFull!14972 (v!18490 V!47327)) (EmptyCell!14972) )
))
(declare-fun mapValue!48967 () ValueCell!14972)

(declare-fun mapRest!48967 () (Array (_ BitVec 32) ValueCell!14972))

(declare-datatypes ((array!80663 0))(
  ( (array!80664 (arr!38894 (Array (_ BitVec 32) ValueCell!14972)) (size!39431 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80663)

(declare-fun mapKey!48967 () (_ BitVec 32))

(assert (=> mapNonEmpty!48967 (= (arr!38894 _values!914) (store mapRest!48967 mapKey!48967 mapValue!48967))))

(declare-fun mapIsEmpty!48967 () Bool)

(assert (=> mapIsEmpty!48967 mapRes!48967))

(declare-fun b!1250169 () Bool)

(declare-fun res!833657 () Bool)

(declare-fun e!709573 () Bool)

(assert (=> b!1250169 (=> (not res!833657) (not e!709573))))

(declare-datatypes ((array!80665 0))(
  ( (array!80666 (arr!38895 (Array (_ BitVec 32) (_ BitVec 64))) (size!39432 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80665)

(declare-datatypes ((List!27627 0))(
  ( (Nil!27624) (Cons!27623 (h!28841 (_ BitVec 64)) (t!41090 List!27627)) )
))
(declare-fun arrayNoDuplicates!0 (array!80665 (_ BitVec 32) List!27627) Bool)

(assert (=> b!1250169 (= res!833657 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27624))))

(declare-fun b!1250170 () Bool)

(declare-fun e!709570 () Bool)

(declare-fun e!709571 () Bool)

(assert (=> b!1250170 (= e!709570 (and e!709571 mapRes!48967))))

(declare-fun condMapEmpty!48967 () Bool)

(declare-fun mapDefault!48967 () ValueCell!14972)

(assert (=> b!1250170 (= condMapEmpty!48967 (= (arr!38894 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14972)) mapDefault!48967)))))

(declare-fun b!1250171 () Bool)

(declare-fun res!833659 () Bool)

(assert (=> b!1250171 (=> (not res!833659) (not e!709573))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80665 (_ BitVec 32)) Bool)

(assert (=> b!1250171 (= res!833659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833658 () Bool)

(assert (=> start!104988 (=> (not res!833658) (not e!709573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104988 (= res!833658 (validMask!0 mask!1466))))

(assert (=> start!104988 e!709573))

(assert (=> start!104988 true))

(assert (=> start!104988 tp!93196))

(declare-fun tp_is_empty!31471 () Bool)

(assert (=> start!104988 tp_is_empty!31471))

(declare-fun array_inv!29787 (array!80665) Bool)

(assert (=> start!104988 (array_inv!29787 _keys!1118)))

(declare-fun array_inv!29788 (array!80663) Bool)

(assert (=> start!104988 (and (array_inv!29788 _values!914) e!709570)))

(declare-fun b!1250172 () Bool)

(assert (=> b!1250172 (= e!709573 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47327)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47327)

(declare-datatypes ((tuple2!20374 0))(
  ( (tuple2!20375 (_1!10198 (_ BitVec 64)) (_2!10198 V!47327)) )
))
(declare-datatypes ((List!27628 0))(
  ( (Nil!27625) (Cons!27624 (h!28842 tuple2!20374) (t!41091 List!27628)) )
))
(declare-datatypes ((ListLongMap!18255 0))(
  ( (ListLongMap!18256 (toList!9143 List!27628)) )
))
(declare-fun lt!564019 () ListLongMap!18255)

(declare-fun getCurrentListMapNoExtraKeys!5578 (array!80665 array!80663 (_ BitVec 32) (_ BitVec 32) V!47327 V!47327 (_ BitVec 32) Int) ListLongMap!18255)

(assert (=> b!1250172 (= lt!564019 (getCurrentListMapNoExtraKeys!5578 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564020 () ListLongMap!18255)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47327)

(assert (=> b!1250172 (= lt!564020 (getCurrentListMapNoExtraKeys!5578 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250173 () Bool)

(assert (=> b!1250173 (= e!709572 tp_is_empty!31471)))

(declare-fun b!1250174 () Bool)

(assert (=> b!1250174 (= e!709571 tp_is_empty!31471)))

(declare-fun b!1250175 () Bool)

(declare-fun res!833656 () Bool)

(assert (=> b!1250175 (=> (not res!833656) (not e!709573))))

(assert (=> b!1250175 (= res!833656 (and (= (size!39431 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39432 _keys!1118) (size!39431 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104988 res!833658) b!1250175))

(assert (= (and b!1250175 res!833656) b!1250171))

(assert (= (and b!1250171 res!833659) b!1250169))

(assert (= (and b!1250169 res!833657) b!1250172))

(assert (= (and b!1250170 condMapEmpty!48967) mapIsEmpty!48967))

(assert (= (and b!1250170 (not condMapEmpty!48967)) mapNonEmpty!48967))

(get-info :version)

(assert (= (and mapNonEmpty!48967 ((_ is ValueCellFull!14972) mapValue!48967)) b!1250173))

(assert (= (and b!1250170 ((_ is ValueCellFull!14972) mapDefault!48967)) b!1250174))

(assert (= start!104988 b!1250170))

(declare-fun m!1151523 () Bool)

(assert (=> b!1250169 m!1151523))

(declare-fun m!1151525 () Bool)

(assert (=> mapNonEmpty!48967 m!1151525))

(declare-fun m!1151527 () Bool)

(assert (=> start!104988 m!1151527))

(declare-fun m!1151529 () Bool)

(assert (=> start!104988 m!1151529))

(declare-fun m!1151531 () Bool)

(assert (=> start!104988 m!1151531))

(declare-fun m!1151533 () Bool)

(assert (=> b!1250171 m!1151533))

(declare-fun m!1151535 () Bool)

(assert (=> b!1250172 m!1151535))

(declare-fun m!1151537 () Bool)

(assert (=> b!1250172 m!1151537))

(check-sat (not start!104988) b_and!44339 (not b!1250169) tp_is_empty!31471 (not b!1250172) (not mapNonEmpty!48967) (not b!1250171) (not b_next!26569))
(check-sat b_and!44339 (not b_next!26569))
