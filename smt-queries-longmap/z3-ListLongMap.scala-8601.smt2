; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104838 () Bool)

(assert start!104838)

(declare-fun b_free!26643 () Bool)

(declare-fun b_next!26643 () Bool)

(assert (=> start!104838 (= b_free!26643 (not b_next!26643))))

(declare-fun tp!93419 () Bool)

(declare-fun b_and!44411 () Bool)

(assert (=> start!104838 (= tp!93419 b_and!44411)))

(declare-fun b!1249641 () Bool)

(declare-fun e!709280 () Bool)

(declare-fun e!709279 () Bool)

(declare-fun mapRes!49078 () Bool)

(assert (=> b!1249641 (= e!709280 (and e!709279 mapRes!49078))))

(declare-fun condMapEmpty!49078 () Bool)

(declare-datatypes ((V!47425 0))(
  ( (V!47426 (val!15835 Int)) )
))
(declare-datatypes ((ValueCell!15009 0))(
  ( (ValueCellFull!15009 (v!18531 V!47425)) (EmptyCell!15009) )
))
(declare-datatypes ((array!80768 0))(
  ( (array!80769 (arr!38951 (Array (_ BitVec 32) ValueCell!15009)) (size!39487 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80768)

(declare-fun mapDefault!49078 () ValueCell!15009)

(assert (=> b!1249641 (= condMapEmpty!49078 (= (arr!38951 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15009)) mapDefault!49078)))))

(declare-fun mapIsEmpty!49078 () Bool)

(assert (=> mapIsEmpty!49078 mapRes!49078))

(declare-fun b!1249642 () Bool)

(declare-fun res!833581 () Bool)

(declare-fun e!709282 () Bool)

(assert (=> b!1249642 (=> (not res!833581) (not e!709282))))

(declare-datatypes ((array!80770 0))(
  ( (array!80771 (arr!38952 (Array (_ BitVec 32) (_ BitVec 64))) (size!39488 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80770)

(declare-datatypes ((List!27641 0))(
  ( (Nil!27638) (Cons!27637 (h!28846 (_ BitVec 64)) (t!41112 List!27641)) )
))
(declare-fun arrayNoDuplicates!0 (array!80770 (_ BitVec 32) List!27641) Bool)

(assert (=> b!1249642 (= res!833581 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27638))))

(declare-fun res!833580 () Bool)

(assert (=> start!104838 (=> (not res!833580) (not e!709282))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104838 (= res!833580 (validMask!0 mask!1466))))

(assert (=> start!104838 e!709282))

(assert (=> start!104838 true))

(assert (=> start!104838 tp!93419))

(declare-fun tp_is_empty!31545 () Bool)

(assert (=> start!104838 tp_is_empty!31545))

(declare-fun array_inv!29723 (array!80770) Bool)

(assert (=> start!104838 (array_inv!29723 _keys!1118)))

(declare-fun array_inv!29724 (array!80768) Bool)

(assert (=> start!104838 (and (array_inv!29724 _values!914) e!709280)))

(declare-fun b!1249643 () Bool)

(declare-fun res!833582 () Bool)

(assert (=> b!1249643 (=> (not res!833582) (not e!709282))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249643 (= res!833582 (and (= (size!39487 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39488 _keys!1118) (size!39487 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249644 () Bool)

(assert (=> b!1249644 (= e!709282 (not true))))

(declare-datatypes ((tuple2!20398 0))(
  ( (tuple2!20399 (_1!10210 (_ BitVec 64)) (_2!10210 V!47425)) )
))
(declare-datatypes ((List!27642 0))(
  ( (Nil!27639) (Cons!27638 (h!28847 tuple2!20398) (t!41113 List!27642)) )
))
(declare-datatypes ((ListLongMap!18271 0))(
  ( (ListLongMap!18272 (toList!9151 List!27642)) )
))
(declare-fun lt!563816 () ListLongMap!18271)

(declare-fun lt!563818 () ListLongMap!18271)

(assert (=> b!1249644 (= lt!563816 lt!563818)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47425)

(declare-datatypes ((Unit!41499 0))(
  ( (Unit!41500) )
))
(declare-fun lt!563817 () Unit!41499)

(declare-fun zeroValue!871 () V!47425)

(declare-fun minValueBefore!43 () V!47425)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!922 (array!80770 array!80768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47425 V!47425 V!47425 V!47425 (_ BitVec 32) Int) Unit!41499)

(assert (=> b!1249644 (= lt!563817 (lemmaNoChangeToArrayThenSameMapNoExtras!922 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5558 (array!80770 array!80768 (_ BitVec 32) (_ BitVec 32) V!47425 V!47425 (_ BitVec 32) Int) ListLongMap!18271)

(assert (=> b!1249644 (= lt!563818 (getCurrentListMapNoExtraKeys!5558 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249644 (= lt!563816 (getCurrentListMapNoExtraKeys!5558 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249645 () Bool)

(declare-fun res!833583 () Bool)

(assert (=> b!1249645 (=> (not res!833583) (not e!709282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80770 (_ BitVec 32)) Bool)

(assert (=> b!1249645 (= res!833583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249646 () Bool)

(assert (=> b!1249646 (= e!709279 tp_is_empty!31545)))

(declare-fun b!1249647 () Bool)

(declare-fun e!709281 () Bool)

(assert (=> b!1249647 (= e!709281 tp_is_empty!31545)))

(declare-fun mapNonEmpty!49078 () Bool)

(declare-fun tp!93418 () Bool)

(assert (=> mapNonEmpty!49078 (= mapRes!49078 (and tp!93418 e!709281))))

(declare-fun mapRest!49078 () (Array (_ BitVec 32) ValueCell!15009))

(declare-fun mapValue!49078 () ValueCell!15009)

(declare-fun mapKey!49078 () (_ BitVec 32))

(assert (=> mapNonEmpty!49078 (= (arr!38951 _values!914) (store mapRest!49078 mapKey!49078 mapValue!49078))))

(assert (= (and start!104838 res!833580) b!1249643))

(assert (= (and b!1249643 res!833582) b!1249645))

(assert (= (and b!1249645 res!833583) b!1249642))

(assert (= (and b!1249642 res!833581) b!1249644))

(assert (= (and b!1249641 condMapEmpty!49078) mapIsEmpty!49078))

(assert (= (and b!1249641 (not condMapEmpty!49078)) mapNonEmpty!49078))

(get-info :version)

(assert (= (and mapNonEmpty!49078 ((_ is ValueCellFull!15009) mapValue!49078)) b!1249647))

(assert (= (and b!1249641 ((_ is ValueCellFull!15009) mapDefault!49078)) b!1249646))

(assert (= start!104838 b!1249641))

(declare-fun m!1150541 () Bool)

(assert (=> b!1249644 m!1150541))

(declare-fun m!1150543 () Bool)

(assert (=> b!1249644 m!1150543))

(declare-fun m!1150545 () Bool)

(assert (=> b!1249644 m!1150545))

(declare-fun m!1150547 () Bool)

(assert (=> b!1249645 m!1150547))

(declare-fun m!1150549 () Bool)

(assert (=> start!104838 m!1150549))

(declare-fun m!1150551 () Bool)

(assert (=> start!104838 m!1150551))

(declare-fun m!1150553 () Bool)

(assert (=> start!104838 m!1150553))

(declare-fun m!1150555 () Bool)

(assert (=> mapNonEmpty!49078 m!1150555))

(declare-fun m!1150557 () Bool)

(assert (=> b!1249642 m!1150557))

(check-sat (not b_next!26643) (not b!1249644) tp_is_empty!31545 (not start!104838) (not mapNonEmpty!49078) (not b!1249645) (not b!1249642) b_and!44411)
(check-sat b_and!44411 (not b_next!26643))
