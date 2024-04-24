; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105006 () Bool)

(assert start!105006)

(declare-fun b_free!26587 () Bool)

(declare-fun b_next!26587 () Bool)

(assert (=> start!105006 (= b_free!26587 (not b_next!26587))))

(declare-fun tp!93251 () Bool)

(declare-fun b_and!44357 () Bool)

(assert (=> start!105006 (= tp!93251 b_and!44357)))

(declare-fun b!1250358 () Bool)

(declare-fun e!709707 () Bool)

(assert (=> b!1250358 (= e!709707 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47351 0))(
  ( (V!47352 (val!15807 Int)) )
))
(declare-fun minValueAfter!43 () V!47351)

(declare-datatypes ((tuple2!20388 0))(
  ( (tuple2!20389 (_1!10205 (_ BitVec 64)) (_2!10205 V!47351)) )
))
(declare-datatypes ((List!27641 0))(
  ( (Nil!27638) (Cons!27637 (h!28855 tuple2!20388) (t!41104 List!27641)) )
))
(declare-datatypes ((ListLongMap!18269 0))(
  ( (ListLongMap!18270 (toList!9150 List!27641)) )
))
(declare-fun lt!564073 () ListLongMap!18269)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47351)

(declare-datatypes ((array!80697 0))(
  ( (array!80698 (arr!38911 (Array (_ BitVec 32) (_ BitVec 64))) (size!39448 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80697)

(declare-datatypes ((ValueCell!14981 0))(
  ( (ValueCellFull!14981 (v!18499 V!47351)) (EmptyCell!14981) )
))
(declare-datatypes ((array!80699 0))(
  ( (array!80700 (arr!38912 (Array (_ BitVec 32) ValueCell!14981)) (size!39449 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80699)

(declare-fun getCurrentListMapNoExtraKeys!5585 (array!80697 array!80699 (_ BitVec 32) (_ BitVec 32) V!47351 V!47351 (_ BitVec 32) Int) ListLongMap!18269)

(assert (=> b!1250358 (= lt!564073 (getCurrentListMapNoExtraKeys!5585 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!564074 () ListLongMap!18269)

(declare-fun minValueBefore!43 () V!47351)

(assert (=> b!1250358 (= lt!564074 (getCurrentListMapNoExtraKeys!5585 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250359 () Bool)

(declare-fun e!709705 () Bool)

(declare-fun e!709708 () Bool)

(declare-fun mapRes!48994 () Bool)

(assert (=> b!1250359 (= e!709705 (and e!709708 mapRes!48994))))

(declare-fun condMapEmpty!48994 () Bool)

(declare-fun mapDefault!48994 () ValueCell!14981)

(assert (=> b!1250359 (= condMapEmpty!48994 (= (arr!38912 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14981)) mapDefault!48994)))))

(declare-fun mapNonEmpty!48994 () Bool)

(declare-fun tp!93250 () Bool)

(declare-fun e!709709 () Bool)

(assert (=> mapNonEmpty!48994 (= mapRes!48994 (and tp!93250 e!709709))))

(declare-fun mapKey!48994 () (_ BitVec 32))

(declare-fun mapValue!48994 () ValueCell!14981)

(declare-fun mapRest!48994 () (Array (_ BitVec 32) ValueCell!14981))

(assert (=> mapNonEmpty!48994 (= (arr!38912 _values!914) (store mapRest!48994 mapKey!48994 mapValue!48994))))

(declare-fun b!1250360 () Bool)

(declare-fun tp_is_empty!31489 () Bool)

(assert (=> b!1250360 (= e!709709 tp_is_empty!31489)))

(declare-fun b!1250361 () Bool)

(assert (=> b!1250361 (= e!709708 tp_is_empty!31489)))

(declare-fun res!833765 () Bool)

(assert (=> start!105006 (=> (not res!833765) (not e!709707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105006 (= res!833765 (validMask!0 mask!1466))))

(assert (=> start!105006 e!709707))

(assert (=> start!105006 true))

(assert (=> start!105006 tp!93251))

(assert (=> start!105006 tp_is_empty!31489))

(declare-fun array_inv!29801 (array!80697) Bool)

(assert (=> start!105006 (array_inv!29801 _keys!1118)))

(declare-fun array_inv!29802 (array!80699) Bool)

(assert (=> start!105006 (and (array_inv!29802 _values!914) e!709705)))

(declare-fun mapIsEmpty!48994 () Bool)

(assert (=> mapIsEmpty!48994 mapRes!48994))

(declare-fun b!1250362 () Bool)

(declare-fun res!833766 () Bool)

(assert (=> b!1250362 (=> (not res!833766) (not e!709707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80697 (_ BitVec 32)) Bool)

(assert (=> b!1250362 (= res!833766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250363 () Bool)

(declare-fun res!833767 () Bool)

(assert (=> b!1250363 (=> (not res!833767) (not e!709707))))

(assert (=> b!1250363 (= res!833767 (and (= (size!39449 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39448 _keys!1118) (size!39449 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250364 () Bool)

(declare-fun res!833764 () Bool)

(assert (=> b!1250364 (=> (not res!833764) (not e!709707))))

(declare-datatypes ((List!27642 0))(
  ( (Nil!27639) (Cons!27638 (h!28856 (_ BitVec 64)) (t!41105 List!27642)) )
))
(declare-fun arrayNoDuplicates!0 (array!80697 (_ BitVec 32) List!27642) Bool)

(assert (=> b!1250364 (= res!833764 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27639))))

(assert (= (and start!105006 res!833765) b!1250363))

(assert (= (and b!1250363 res!833767) b!1250362))

(assert (= (and b!1250362 res!833766) b!1250364))

(assert (= (and b!1250364 res!833764) b!1250358))

(assert (= (and b!1250359 condMapEmpty!48994) mapIsEmpty!48994))

(assert (= (and b!1250359 (not condMapEmpty!48994)) mapNonEmpty!48994))

(get-info :version)

(assert (= (and mapNonEmpty!48994 ((_ is ValueCellFull!14981) mapValue!48994)) b!1250360))

(assert (= (and b!1250359 ((_ is ValueCellFull!14981) mapDefault!48994)) b!1250361))

(assert (= start!105006 b!1250359))

(declare-fun m!1151667 () Bool)

(assert (=> b!1250364 m!1151667))

(declare-fun m!1151669 () Bool)

(assert (=> b!1250362 m!1151669))

(declare-fun m!1151671 () Bool)

(assert (=> b!1250358 m!1151671))

(declare-fun m!1151673 () Bool)

(assert (=> b!1250358 m!1151673))

(declare-fun m!1151675 () Bool)

(assert (=> mapNonEmpty!48994 m!1151675))

(declare-fun m!1151677 () Bool)

(assert (=> start!105006 m!1151677))

(declare-fun m!1151679 () Bool)

(assert (=> start!105006 m!1151679))

(declare-fun m!1151681 () Bool)

(assert (=> start!105006 m!1151681))

(check-sat b_and!44357 tp_is_empty!31489 (not b!1250364) (not b_next!26587) (not b!1250358) (not start!105006) (not b!1250362) (not mapNonEmpty!48994))
(check-sat b_and!44357 (not b_next!26587))
