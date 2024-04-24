; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105784 () Bool)

(assert start!105784)

(declare-fun b_free!27175 () Bool)

(declare-fun b_next!27175 () Bool)

(assert (=> start!105784 (= b_free!27175 (not b_next!27175))))

(declare-fun tp!95044 () Bool)

(declare-fun b_and!45043 () Bool)

(assert (=> start!105784 (= tp!95044 b_and!45043)))

(declare-fun mapNonEmpty!49906 () Bool)

(declare-fun mapRes!49906 () Bool)

(declare-fun tp!95045 () Bool)

(declare-fun e!715940 () Bool)

(assert (=> mapNonEmpty!49906 (= mapRes!49906 (and tp!95045 e!715940))))

(declare-fun mapKey!49906 () (_ BitVec 32))

(declare-datatypes ((V!48135 0))(
  ( (V!48136 (val!16101 Int)) )
))
(declare-datatypes ((ValueCell!15275 0))(
  ( (ValueCellFull!15275 (v!18799 V!48135)) (EmptyCell!15275) )
))
(declare-fun mapValue!49906 () ValueCell!15275)

(declare-datatypes ((array!81835 0))(
  ( (array!81836 (arr!39470 (Array (_ BitVec 32) ValueCell!15275)) (size!40007 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81835)

(declare-fun mapRest!49906 () (Array (_ BitVec 32) ValueCell!15275))

(assert (=> mapNonEmpty!49906 (= (arr!39470 _values!914) (store mapRest!49906 mapKey!49906 mapValue!49906))))

(declare-fun b!1258858 () Bool)

(declare-fun res!838781 () Bool)

(declare-fun e!715942 () Bool)

(assert (=> b!1258858 (=> (not res!838781) (not e!715942))))

(declare-datatypes ((array!81837 0))(
  ( (array!81838 (arr!39471 (Array (_ BitVec 32) (_ BitVec 64))) (size!40008 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81837)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81837 (_ BitVec 32)) Bool)

(assert (=> b!1258858 (= res!838781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258859 () Bool)

(declare-fun e!715943 () Bool)

(declare-fun tp_is_empty!32077 () Bool)

(assert (=> b!1258859 (= e!715943 tp_is_empty!32077)))

(declare-fun res!838778 () Bool)

(assert (=> start!105784 (=> (not res!838778) (not e!715942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105784 (= res!838778 (validMask!0 mask!1466))))

(assert (=> start!105784 e!715942))

(assert (=> start!105784 true))

(assert (=> start!105784 tp!95044))

(assert (=> start!105784 tp_is_empty!32077))

(declare-fun array_inv!30201 (array!81837) Bool)

(assert (=> start!105784 (array_inv!30201 _keys!1118)))

(declare-fun e!715939 () Bool)

(declare-fun array_inv!30202 (array!81835) Bool)

(assert (=> start!105784 (and (array_inv!30202 _values!914) e!715939)))

(declare-fun b!1258860 () Bool)

(declare-fun res!838779 () Bool)

(assert (=> b!1258860 (=> (not res!838779) (not e!715942))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258860 (= res!838779 (and (= (size!40007 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40008 _keys!1118) (size!40007 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49906 () Bool)

(assert (=> mapIsEmpty!49906 mapRes!49906))

(declare-fun b!1258861 () Bool)

(assert (=> b!1258861 (= e!715940 tp_is_empty!32077)))

(declare-fun b!1258862 () Bool)

(assert (=> b!1258862 (= e!715939 (and e!715943 mapRes!49906))))

(declare-fun condMapEmpty!49906 () Bool)

(declare-fun mapDefault!49906 () ValueCell!15275)

(assert (=> b!1258862 (= condMapEmpty!49906 (= (arr!39470 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15275)) mapDefault!49906)))))

(declare-fun b!1258863 () Bool)

(declare-fun res!838780 () Bool)

(assert (=> b!1258863 (=> (not res!838780) (not e!715942))))

(declare-datatypes ((List!28055 0))(
  ( (Nil!28052) (Cons!28051 (h!29269 (_ BitVec 64)) (t!41538 List!28055)) )
))
(declare-fun arrayNoDuplicates!0 (array!81837 (_ BitVec 32) List!28055) Bool)

(assert (=> b!1258863 (= res!838780 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28052))))

(declare-fun b!1258864 () Bool)

(assert (=> b!1258864 (= e!715942 (not true))))

(declare-datatypes ((tuple2!20828 0))(
  ( (tuple2!20829 (_1!10425 (_ BitVec 64)) (_2!10425 V!48135)) )
))
(declare-datatypes ((List!28056 0))(
  ( (Nil!28053) (Cons!28052 (h!29270 tuple2!20828) (t!41539 List!28056)) )
))
(declare-datatypes ((ListLongMap!18709 0))(
  ( (ListLongMap!18710 (toList!9370 List!28056)) )
))
(declare-fun lt!569276 () ListLongMap!18709)

(declare-fun lt!569278 () ListLongMap!18709)

(assert (=> b!1258864 (= lt!569276 lt!569278)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41883 0))(
  ( (Unit!41884) )
))
(declare-fun lt!569277 () Unit!41883)

(declare-fun minValueAfter!43 () V!48135)

(declare-fun zeroValue!871 () V!48135)

(declare-fun minValueBefore!43 () V!48135)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1100 (array!81837 array!81835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48135 V!48135 V!48135 V!48135 (_ BitVec 32) Int) Unit!41883)

(assert (=> b!1258864 (= lt!569277 (lemmaNoChangeToArrayThenSameMapNoExtras!1100 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5786 (array!81837 array!81835 (_ BitVec 32) (_ BitVec 32) V!48135 V!48135 (_ BitVec 32) Int) ListLongMap!18709)

(assert (=> b!1258864 (= lt!569278 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258864 (= lt!569276 (getCurrentListMapNoExtraKeys!5786 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105784 res!838778) b!1258860))

(assert (= (and b!1258860 res!838779) b!1258858))

(assert (= (and b!1258858 res!838781) b!1258863))

(assert (= (and b!1258863 res!838780) b!1258864))

(assert (= (and b!1258862 condMapEmpty!49906) mapIsEmpty!49906))

(assert (= (and b!1258862 (not condMapEmpty!49906)) mapNonEmpty!49906))

(get-info :version)

(assert (= (and mapNonEmpty!49906 ((_ is ValueCellFull!15275) mapValue!49906)) b!1258861))

(assert (= (and b!1258862 ((_ is ValueCellFull!15275) mapDefault!49906)) b!1258859))

(assert (= start!105784 b!1258862))

(declare-fun m!1159737 () Bool)

(assert (=> b!1258864 m!1159737))

(declare-fun m!1159739 () Bool)

(assert (=> b!1258864 m!1159739))

(declare-fun m!1159741 () Bool)

(assert (=> b!1258864 m!1159741))

(declare-fun m!1159743 () Bool)

(assert (=> mapNonEmpty!49906 m!1159743))

(declare-fun m!1159745 () Bool)

(assert (=> b!1258863 m!1159745))

(declare-fun m!1159747 () Bool)

(assert (=> b!1258858 m!1159747))

(declare-fun m!1159749 () Bool)

(assert (=> start!105784 m!1159749))

(declare-fun m!1159751 () Bool)

(assert (=> start!105784 m!1159751))

(declare-fun m!1159753 () Bool)

(assert (=> start!105784 m!1159753))

(check-sat (not b!1258858) (not mapNonEmpty!49906) (not b_next!27175) b_and!45043 (not start!105784) tp_is_empty!32077 (not b!1258864) (not b!1258863))
(check-sat b_and!45043 (not b_next!27175))
