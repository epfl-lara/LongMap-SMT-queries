; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105580 () Bool)

(assert start!105580)

(declare-fun b_free!27199 () Bool)

(declare-fun b_next!27199 () Bool)

(assert (=> start!105580 (= b_free!27199 (not b_next!27199))))

(declare-fun tp!95117 () Bool)

(declare-fun b_and!45047 () Bool)

(assert (=> start!105580 (= tp!95117 b_and!45047)))

(declare-fun mapNonEmpty!49942 () Bool)

(declare-fun mapRes!49942 () Bool)

(declare-fun tp!95116 () Bool)

(declare-fun e!715228 () Bool)

(assert (=> mapNonEmpty!49942 (= mapRes!49942 (and tp!95116 e!715228))))

(declare-datatypes ((V!48167 0))(
  ( (V!48168 (val!16113 Int)) )
))
(declare-datatypes ((ValueCell!15287 0))(
  ( (ValueCellFull!15287 (v!18814 V!48167)) (EmptyCell!15287) )
))
(declare-fun mapRest!49942 () (Array (_ BitVec 32) ValueCell!15287))

(declare-datatypes ((array!81755 0))(
  ( (array!81756 (arr!39435 (Array (_ BitVec 32) ValueCell!15287)) (size!39973 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81755)

(declare-fun mapValue!49942 () ValueCell!15287)

(declare-fun mapKey!49942 () (_ BitVec 32))

(assert (=> mapNonEmpty!49942 (= (arr!39435 _values!914) (store mapRest!49942 mapKey!49942 mapValue!49942))))

(declare-fun b!1257723 () Bool)

(declare-fun res!838362 () Bool)

(declare-fun e!715227 () Bool)

(assert (=> b!1257723 (=> (not res!838362) (not e!715227))))

(declare-datatypes ((array!81757 0))(
  ( (array!81758 (arr!39436 (Array (_ BitVec 32) (_ BitVec 64))) (size!39974 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81757)

(declare-datatypes ((List!28108 0))(
  ( (Nil!28105) (Cons!28104 (h!29313 (_ BitVec 64)) (t!41590 List!28108)) )
))
(declare-fun arrayNoDuplicates!0 (array!81757 (_ BitVec 32) List!28108) Bool)

(assert (=> b!1257723 (= res!838362 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28105))))

(declare-fun b!1257724 () Bool)

(declare-fun res!838365 () Bool)

(assert (=> b!1257724 (=> (not res!838365) (not e!715227))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81757 (_ BitVec 32)) Bool)

(assert (=> b!1257724 (= res!838365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49942 () Bool)

(assert (=> mapIsEmpty!49942 mapRes!49942))

(declare-fun b!1257725 () Bool)

(declare-fun tp_is_empty!32101 () Bool)

(assert (=> b!1257725 (= e!715228 tp_is_empty!32101)))

(declare-fun b!1257726 () Bool)

(declare-fun e!715229 () Bool)

(declare-fun e!715231 () Bool)

(assert (=> b!1257726 (= e!715229 (and e!715231 mapRes!49942))))

(declare-fun condMapEmpty!49942 () Bool)

(declare-fun mapDefault!49942 () ValueCell!15287)

(assert (=> b!1257726 (= condMapEmpty!49942 (= (arr!39435 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15287)) mapDefault!49942)))))

(declare-fun b!1257727 () Bool)

(declare-fun res!838363 () Bool)

(assert (=> b!1257727 (=> (not res!838363) (not e!715227))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257727 (= res!838363 (and (= (size!39973 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39974 _keys!1118) (size!39973 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257728 () Bool)

(assert (=> b!1257728 (= e!715227 (not true))))

(declare-datatypes ((tuple2!20900 0))(
  ( (tuple2!20901 (_1!10461 (_ BitVec 64)) (_2!10461 V!48167)) )
))
(declare-datatypes ((List!28109 0))(
  ( (Nil!28106) (Cons!28105 (h!29314 tuple2!20900) (t!41591 List!28109)) )
))
(declare-datatypes ((ListLongMap!18773 0))(
  ( (ListLongMap!18774 (toList!9402 List!28109)) )
))
(declare-fun lt!568723 () ListLongMap!18773)

(declare-fun lt!568722 () ListLongMap!18773)

(assert (=> b!1257728 (= lt!568723 lt!568722)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48167)

(declare-fun zeroValue!871 () V!48167)

(declare-datatypes ((Unit!41763 0))(
  ( (Unit!41764) )
))
(declare-fun lt!568721 () Unit!41763)

(declare-fun minValueBefore!43 () V!48167)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1106 (array!81757 array!81755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48167 V!48167 V!48167 V!48167 (_ BitVec 32) Int) Unit!41763)

(assert (=> b!1257728 (= lt!568721 (lemmaNoChangeToArrayThenSameMapNoExtras!1106 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5784 (array!81757 array!81755 (_ BitVec 32) (_ BitVec 32) V!48167 V!48167 (_ BitVec 32) Int) ListLongMap!18773)

(assert (=> b!1257728 (= lt!568722 (getCurrentListMapNoExtraKeys!5784 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257728 (= lt!568723 (getCurrentListMapNoExtraKeys!5784 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838364 () Bool)

(assert (=> start!105580 (=> (not res!838364) (not e!715227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105580 (= res!838364 (validMask!0 mask!1466))))

(assert (=> start!105580 e!715227))

(assert (=> start!105580 true))

(assert (=> start!105580 tp!95117))

(assert (=> start!105580 tp_is_empty!32101))

(declare-fun array_inv!30171 (array!81757) Bool)

(assert (=> start!105580 (array_inv!30171 _keys!1118)))

(declare-fun array_inv!30172 (array!81755) Bool)

(assert (=> start!105580 (and (array_inv!30172 _values!914) e!715229)))

(declare-fun b!1257729 () Bool)

(assert (=> b!1257729 (= e!715231 tp_is_empty!32101)))

(assert (= (and start!105580 res!838364) b!1257727))

(assert (= (and b!1257727 res!838363) b!1257724))

(assert (= (and b!1257724 res!838365) b!1257723))

(assert (= (and b!1257723 res!838362) b!1257728))

(assert (= (and b!1257726 condMapEmpty!49942) mapIsEmpty!49942))

(assert (= (and b!1257726 (not condMapEmpty!49942)) mapNonEmpty!49942))

(get-info :version)

(assert (= (and mapNonEmpty!49942 ((_ is ValueCellFull!15287) mapValue!49942)) b!1257725))

(assert (= (and b!1257726 ((_ is ValueCellFull!15287) mapDefault!49942)) b!1257729))

(assert (= start!105580 b!1257726))

(declare-fun m!1157821 () Bool)

(assert (=> mapNonEmpty!49942 m!1157821))

(declare-fun m!1157823 () Bool)

(assert (=> b!1257728 m!1157823))

(declare-fun m!1157825 () Bool)

(assert (=> b!1257728 m!1157825))

(declare-fun m!1157827 () Bool)

(assert (=> b!1257728 m!1157827))

(declare-fun m!1157829 () Bool)

(assert (=> start!105580 m!1157829))

(declare-fun m!1157831 () Bool)

(assert (=> start!105580 m!1157831))

(declare-fun m!1157833 () Bool)

(assert (=> start!105580 m!1157833))

(declare-fun m!1157835 () Bool)

(assert (=> b!1257724 m!1157835))

(declare-fun m!1157837 () Bool)

(assert (=> b!1257723 m!1157837))

(check-sat b_and!45047 (not b!1257728) (not mapNonEmpty!49942) (not b!1257724) tp_is_empty!32101 (not b!1257723) (not start!105580) (not b_next!27199))
(check-sat b_and!45047 (not b_next!27199))
