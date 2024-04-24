; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106074 () Bool)

(assert start!106074)

(declare-fun b_free!27391 () Bool)

(declare-fun b_next!27391 () Bool)

(assert (=> start!106074 (= b_free!27391 (not b_next!27391))))

(declare-fun tp!95704 () Bool)

(declare-fun b_and!45301 () Bool)

(assert (=> start!106074 (= tp!95704 b_and!45301)))

(declare-fun b!1262158 () Bool)

(declare-fun e!718377 () Bool)

(declare-fun tp_is_empty!32293 () Bool)

(assert (=> b!1262158 (= e!718377 tp_is_empty!32293)))

(declare-fun b!1262159 () Bool)

(declare-fun res!840760 () Bool)

(declare-fun e!718374 () Bool)

(assert (=> b!1262159 (=> (not res!840760) (not e!718374))))

(declare-datatypes ((array!82251 0))(
  ( (array!82252 (arr!39674 (Array (_ BitVec 32) (_ BitVec 64))) (size!40211 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82251)

(declare-datatypes ((List!28208 0))(
  ( (Nil!28205) (Cons!28204 (h!29422 (_ BitVec 64)) (t!41699 List!28208)) )
))
(declare-fun arrayNoDuplicates!0 (array!82251 (_ BitVec 32) List!28208) Bool)

(assert (=> b!1262159 (= res!840760 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28205))))

(declare-fun b!1262160 () Bool)

(declare-fun e!718375 () Bool)

(assert (=> b!1262160 (= e!718375 tp_is_empty!32293)))

(declare-fun mapNonEmpty!50242 () Bool)

(declare-fun mapRes!50242 () Bool)

(declare-fun tp!95705 () Bool)

(assert (=> mapNonEmpty!50242 (= mapRes!50242 (and tp!95705 e!718377))))

(declare-fun mapKey!50242 () (_ BitVec 32))

(declare-datatypes ((V!48423 0))(
  ( (V!48424 (val!16209 Int)) )
))
(declare-datatypes ((ValueCell!15383 0))(
  ( (ValueCellFull!15383 (v!18909 V!48423)) (EmptyCell!15383) )
))
(declare-datatypes ((array!82253 0))(
  ( (array!82254 (arr!39675 (Array (_ BitVec 32) ValueCell!15383)) (size!40212 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82253)

(declare-fun mapRest!50242 () (Array (_ BitVec 32) ValueCell!15383))

(declare-fun mapValue!50242 () ValueCell!15383)

(assert (=> mapNonEmpty!50242 (= (arr!39675 _values!914) (store mapRest!50242 mapKey!50242 mapValue!50242))))

(declare-fun b!1262161 () Bool)

(declare-fun res!840759 () Bool)

(assert (=> b!1262161 (=> (not res!840759) (not e!718374))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1262161 (= res!840759 (and (= (size!40212 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40211 _keys!1118) (size!40212 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50242 () Bool)

(assert (=> mapIsEmpty!50242 mapRes!50242))

(declare-fun b!1262162 () Bool)

(assert (=> b!1262162 (= e!718374 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48423)

(declare-fun zeroValue!871 () V!48423)

(declare-datatypes ((tuple2!20986 0))(
  ( (tuple2!20987 (_1!10504 (_ BitVec 64)) (_2!10504 V!48423)) )
))
(declare-datatypes ((List!28209 0))(
  ( (Nil!28206) (Cons!28205 (h!29423 tuple2!20986) (t!41700 List!28209)) )
))
(declare-datatypes ((ListLongMap!18867 0))(
  ( (ListLongMap!18868 (toList!9449 List!28209)) )
))
(declare-fun lt!571944 () ListLongMap!18867)

(declare-fun getCurrentListMapNoExtraKeys!5855 (array!82251 array!82253 (_ BitVec 32) (_ BitVec 32) V!48423 V!48423 (_ BitVec 32) Int) ListLongMap!18867)

(assert (=> b!1262162 (= lt!571944 (getCurrentListMapNoExtraKeys!5855 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48423)

(declare-fun lt!571945 () ListLongMap!18867)

(assert (=> b!1262162 (= lt!571945 (getCurrentListMapNoExtraKeys!5855 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!840758 () Bool)

(assert (=> start!106074 (=> (not res!840758) (not e!718374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106074 (= res!840758 (validMask!0 mask!1466))))

(assert (=> start!106074 e!718374))

(assert (=> start!106074 true))

(assert (=> start!106074 tp!95704))

(assert (=> start!106074 tp_is_empty!32293))

(declare-fun array_inv!30349 (array!82251) Bool)

(assert (=> start!106074 (array_inv!30349 _keys!1118)))

(declare-fun e!718373 () Bool)

(declare-fun array_inv!30350 (array!82253) Bool)

(assert (=> start!106074 (and (array_inv!30350 _values!914) e!718373)))

(declare-fun b!1262163 () Bool)

(assert (=> b!1262163 (= e!718373 (and e!718375 mapRes!50242))))

(declare-fun condMapEmpty!50242 () Bool)

(declare-fun mapDefault!50242 () ValueCell!15383)

(assert (=> b!1262163 (= condMapEmpty!50242 (= (arr!39675 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15383)) mapDefault!50242)))))

(declare-fun b!1262164 () Bool)

(declare-fun res!840761 () Bool)

(assert (=> b!1262164 (=> (not res!840761) (not e!718374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82251 (_ BitVec 32)) Bool)

(assert (=> b!1262164 (= res!840761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!106074 res!840758) b!1262161))

(assert (= (and b!1262161 res!840759) b!1262164))

(assert (= (and b!1262164 res!840761) b!1262159))

(assert (= (and b!1262159 res!840760) b!1262162))

(assert (= (and b!1262163 condMapEmpty!50242) mapIsEmpty!50242))

(assert (= (and b!1262163 (not condMapEmpty!50242)) mapNonEmpty!50242))

(get-info :version)

(assert (= (and mapNonEmpty!50242 ((_ is ValueCellFull!15383) mapValue!50242)) b!1262158))

(assert (= (and b!1262163 ((_ is ValueCellFull!15383) mapDefault!50242)) b!1262160))

(assert (= start!106074 b!1262163))

(declare-fun m!1163229 () Bool)

(assert (=> start!106074 m!1163229))

(declare-fun m!1163231 () Bool)

(assert (=> start!106074 m!1163231))

(declare-fun m!1163233 () Bool)

(assert (=> start!106074 m!1163233))

(declare-fun m!1163235 () Bool)

(assert (=> mapNonEmpty!50242 m!1163235))

(declare-fun m!1163237 () Bool)

(assert (=> b!1262159 m!1163237))

(declare-fun m!1163239 () Bool)

(assert (=> b!1262162 m!1163239))

(declare-fun m!1163241 () Bool)

(assert (=> b!1262162 m!1163241))

(declare-fun m!1163243 () Bool)

(assert (=> b!1262164 m!1163243))

(check-sat (not b!1262162) tp_is_empty!32293 (not b_next!27391) (not b!1262159) (not b!1262164) (not mapNonEmpty!50242) b_and!45301 (not start!106074))
(check-sat b_and!45301 (not b_next!27391))
