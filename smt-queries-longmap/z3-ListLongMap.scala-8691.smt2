; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105562 () Bool)

(assert start!105562)

(declare-fun b_free!27181 () Bool)

(declare-fun b_next!27181 () Bool)

(assert (=> start!105562 (= b_free!27181 (not b_next!27181))))

(declare-fun tp!95063 () Bool)

(declare-fun b_and!45029 () Bool)

(assert (=> start!105562 (= tp!95063 b_and!45029)))

(declare-fun b!1257534 () Bool)

(declare-fun e!715092 () Bool)

(declare-fun tp_is_empty!32083 () Bool)

(assert (=> b!1257534 (= e!715092 tp_is_empty!32083)))

(declare-fun mapNonEmpty!49915 () Bool)

(declare-fun mapRes!49915 () Bool)

(declare-fun tp!95062 () Bool)

(declare-fun e!715095 () Bool)

(assert (=> mapNonEmpty!49915 (= mapRes!49915 (and tp!95062 e!715095))))

(declare-datatypes ((V!48143 0))(
  ( (V!48144 (val!16104 Int)) )
))
(declare-datatypes ((ValueCell!15278 0))(
  ( (ValueCellFull!15278 (v!18805 V!48143)) (EmptyCell!15278) )
))
(declare-fun mapValue!49915 () ValueCell!15278)

(declare-fun mapRest!49915 () (Array (_ BitVec 32) ValueCell!15278))

(declare-datatypes ((array!81725 0))(
  ( (array!81726 (arr!39420 (Array (_ BitVec 32) ValueCell!15278)) (size!39958 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81725)

(declare-fun mapKey!49915 () (_ BitVec 32))

(assert (=> mapNonEmpty!49915 (= (arr!39420 _values!914) (store mapRest!49915 mapKey!49915 mapValue!49915))))

(declare-fun b!1257535 () Bool)

(declare-fun e!715094 () Bool)

(assert (=> b!1257535 (= e!715094 (and e!715092 mapRes!49915))))

(declare-fun condMapEmpty!49915 () Bool)

(declare-fun mapDefault!49915 () ValueCell!15278)

(assert (=> b!1257535 (= condMapEmpty!49915 (= (arr!39420 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15278)) mapDefault!49915)))))

(declare-fun mapIsEmpty!49915 () Bool)

(assert (=> mapIsEmpty!49915 mapRes!49915))

(declare-fun b!1257536 () Bool)

(declare-fun res!838255 () Bool)

(declare-fun e!715093 () Bool)

(assert (=> b!1257536 (=> (not res!838255) (not e!715093))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81727 0))(
  ( (array!81728 (arr!39421 (Array (_ BitVec 32) (_ BitVec 64))) (size!39959 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81727)

(assert (=> b!1257536 (= res!838255 (and (= (size!39958 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39959 _keys!1118) (size!39958 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!838254 () Bool)

(assert (=> start!105562 (=> (not res!838254) (not e!715093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105562 (= res!838254 (validMask!0 mask!1466))))

(assert (=> start!105562 e!715093))

(assert (=> start!105562 true))

(assert (=> start!105562 tp!95063))

(assert (=> start!105562 tp_is_empty!32083))

(declare-fun array_inv!30161 (array!81727) Bool)

(assert (=> start!105562 (array_inv!30161 _keys!1118)))

(declare-fun array_inv!30162 (array!81725) Bool)

(assert (=> start!105562 (and (array_inv!30162 _values!914) e!715094)))

(declare-fun b!1257537 () Bool)

(declare-fun res!838256 () Bool)

(assert (=> b!1257537 (=> (not res!838256) (not e!715093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81727 (_ BitVec 32)) Bool)

(assert (=> b!1257537 (= res!838256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257538 () Bool)

(declare-fun res!838257 () Bool)

(assert (=> b!1257538 (=> (not res!838257) (not e!715093))))

(declare-datatypes ((List!28099 0))(
  ( (Nil!28096) (Cons!28095 (h!29304 (_ BitVec 64)) (t!41581 List!28099)) )
))
(declare-fun arrayNoDuplicates!0 (array!81727 (_ BitVec 32) List!28099) Bool)

(assert (=> b!1257538 (= res!838257 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28096))))

(declare-fun b!1257539 () Bool)

(assert (=> b!1257539 (= e!715093 (not true))))

(declare-datatypes ((tuple2!20892 0))(
  ( (tuple2!20893 (_1!10457 (_ BitVec 64)) (_2!10457 V!48143)) )
))
(declare-datatypes ((List!28100 0))(
  ( (Nil!28097) (Cons!28096 (h!29305 tuple2!20892) (t!41582 List!28100)) )
))
(declare-datatypes ((ListLongMap!18765 0))(
  ( (ListLongMap!18766 (toList!9398 List!28100)) )
))
(declare-fun lt!568642 () ListLongMap!18765)

(declare-fun lt!568640 () ListLongMap!18765)

(assert (=> b!1257539 (= lt!568642 lt!568640)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41755 0))(
  ( (Unit!41756) )
))
(declare-fun lt!568641 () Unit!41755)

(declare-fun minValueAfter!43 () V!48143)

(declare-fun zeroValue!871 () V!48143)

(declare-fun minValueBefore!43 () V!48143)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1102 (array!81727 array!81725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48143 V!48143 V!48143 V!48143 (_ BitVec 32) Int) Unit!41755)

(assert (=> b!1257539 (= lt!568641 (lemmaNoChangeToArrayThenSameMapNoExtras!1102 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5780 (array!81727 array!81725 (_ BitVec 32) (_ BitVec 32) V!48143 V!48143 (_ BitVec 32) Int) ListLongMap!18765)

(assert (=> b!1257539 (= lt!568640 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257539 (= lt!568642 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257540 () Bool)

(assert (=> b!1257540 (= e!715095 tp_is_empty!32083)))

(assert (= (and start!105562 res!838254) b!1257536))

(assert (= (and b!1257536 res!838255) b!1257537))

(assert (= (and b!1257537 res!838256) b!1257538))

(assert (= (and b!1257538 res!838257) b!1257539))

(assert (= (and b!1257535 condMapEmpty!49915) mapIsEmpty!49915))

(assert (= (and b!1257535 (not condMapEmpty!49915)) mapNonEmpty!49915))

(get-info :version)

(assert (= (and mapNonEmpty!49915 ((_ is ValueCellFull!15278) mapValue!49915)) b!1257540))

(assert (= (and b!1257535 ((_ is ValueCellFull!15278) mapDefault!49915)) b!1257534))

(assert (= start!105562 b!1257535))

(declare-fun m!1157659 () Bool)

(assert (=> b!1257537 m!1157659))

(declare-fun m!1157661 () Bool)

(assert (=> start!105562 m!1157661))

(declare-fun m!1157663 () Bool)

(assert (=> start!105562 m!1157663))

(declare-fun m!1157665 () Bool)

(assert (=> start!105562 m!1157665))

(declare-fun m!1157667 () Bool)

(assert (=> mapNonEmpty!49915 m!1157667))

(declare-fun m!1157669 () Bool)

(assert (=> b!1257539 m!1157669))

(declare-fun m!1157671 () Bool)

(assert (=> b!1257539 m!1157671))

(declare-fun m!1157673 () Bool)

(assert (=> b!1257539 m!1157673))

(declare-fun m!1157675 () Bool)

(assert (=> b!1257538 m!1157675))

(check-sat (not b!1257538) (not mapNonEmpty!49915) (not b_next!27181) tp_is_empty!32083 (not start!105562) (not b!1257537) (not b!1257539) b_and!45029)
(check-sat b_and!45029 (not b_next!27181))
