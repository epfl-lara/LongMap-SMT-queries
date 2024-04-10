; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105882 () Bool)

(assert start!105882)

(declare-fun b_free!27423 () Bool)

(declare-fun b_next!27423 () Bool)

(assert (=> start!105882 (= b_free!27423 (not b_next!27423))))

(declare-fun tp!95800 () Bool)

(declare-fun b_and!45331 () Bool)

(assert (=> start!105882 (= tp!95800 b_and!45331)))

(declare-fun b!1261189 () Bool)

(declare-fun e!717766 () Bool)

(assert (=> b!1261189 (= e!717766 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48465 0))(
  ( (V!48466 (val!16225 Int)) )
))
(declare-fun minValueAfter!43 () V!48465)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48465)

(declare-datatypes ((array!82264 0))(
  ( (array!82265 (arr!39685 (Array (_ BitVec 32) (_ BitVec 64))) (size!40221 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82264)

(declare-datatypes ((ValueCell!15399 0))(
  ( (ValueCellFull!15399 (v!18929 V!48465)) (EmptyCell!15399) )
))
(declare-datatypes ((array!82266 0))(
  ( (array!82267 (arr!39686 (Array (_ BitVec 32) ValueCell!15399)) (size!40222 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82266)

(declare-datatypes ((tuple2!20998 0))(
  ( (tuple2!20999 (_1!10510 (_ BitVec 64)) (_2!10510 V!48465)) )
))
(declare-datatypes ((List!28195 0))(
  ( (Nil!28192) (Cons!28191 (h!29400 tuple2!20998) (t!41694 List!28195)) )
))
(declare-datatypes ((ListLongMap!18871 0))(
  ( (ListLongMap!18872 (toList!9451 List!28195)) )
))
(declare-fun lt!571557 () ListLongMap!18871)

(declare-fun getCurrentListMapNoExtraKeys!5819 (array!82264 array!82266 (_ BitVec 32) (_ BitVec 32) V!48465 V!48465 (_ BitVec 32) Int) ListLongMap!18871)

(assert (=> b!1261189 (= lt!571557 (getCurrentListMapNoExtraKeys!5819 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48465)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!571556 () ListLongMap!18871)

(assert (=> b!1261189 (= lt!571556 (getCurrentListMapNoExtraKeys!5819 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50290 () Bool)

(declare-fun mapRes!50290 () Bool)

(assert (=> mapIsEmpty!50290 mapRes!50290))

(declare-fun b!1261190 () Bool)

(declare-fun res!840432 () Bool)

(assert (=> b!1261190 (=> (not res!840432) (not e!717766))))

(declare-datatypes ((List!28196 0))(
  ( (Nil!28193) (Cons!28192 (h!29401 (_ BitVec 64)) (t!41695 List!28196)) )
))
(declare-fun arrayNoDuplicates!0 (array!82264 (_ BitVec 32) List!28196) Bool)

(assert (=> b!1261190 (= res!840432 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28193))))

(declare-fun b!1261191 () Bool)

(declare-fun res!840431 () Bool)

(assert (=> b!1261191 (=> (not res!840431) (not e!717766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82264 (_ BitVec 32)) Bool)

(assert (=> b!1261191 (= res!840431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261192 () Bool)

(declare-fun res!840433 () Bool)

(assert (=> b!1261192 (=> (not res!840433) (not e!717766))))

(assert (=> b!1261192 (= res!840433 (and (= (size!40222 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40221 _keys!1118) (size!40222 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50290 () Bool)

(declare-fun tp!95801 () Bool)

(declare-fun e!717769 () Bool)

(assert (=> mapNonEmpty!50290 (= mapRes!50290 (and tp!95801 e!717769))))

(declare-fun mapValue!50290 () ValueCell!15399)

(declare-fun mapKey!50290 () (_ BitVec 32))

(declare-fun mapRest!50290 () (Array (_ BitVec 32) ValueCell!15399))

(assert (=> mapNonEmpty!50290 (= (arr!39686 _values!914) (store mapRest!50290 mapKey!50290 mapValue!50290))))

(declare-fun res!840430 () Bool)

(assert (=> start!105882 (=> (not res!840430) (not e!717766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105882 (= res!840430 (validMask!0 mask!1466))))

(assert (=> start!105882 e!717766))

(assert (=> start!105882 true))

(assert (=> start!105882 tp!95800))

(declare-fun tp_is_empty!32325 () Bool)

(assert (=> start!105882 tp_is_empty!32325))

(declare-fun array_inv!30213 (array!82264) Bool)

(assert (=> start!105882 (array_inv!30213 _keys!1118)))

(declare-fun e!717770 () Bool)

(declare-fun array_inv!30214 (array!82266) Bool)

(assert (=> start!105882 (and (array_inv!30214 _values!914) e!717770)))

(declare-fun b!1261193 () Bool)

(declare-fun e!717767 () Bool)

(assert (=> b!1261193 (= e!717767 tp_is_empty!32325)))

(declare-fun b!1261194 () Bool)

(assert (=> b!1261194 (= e!717769 tp_is_empty!32325)))

(declare-fun b!1261195 () Bool)

(assert (=> b!1261195 (= e!717770 (and e!717767 mapRes!50290))))

(declare-fun condMapEmpty!50290 () Bool)

(declare-fun mapDefault!50290 () ValueCell!15399)

(assert (=> b!1261195 (= condMapEmpty!50290 (= (arr!39686 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15399)) mapDefault!50290)))))

(assert (= (and start!105882 res!840430) b!1261192))

(assert (= (and b!1261192 res!840433) b!1261191))

(assert (= (and b!1261191 res!840431) b!1261190))

(assert (= (and b!1261190 res!840432) b!1261189))

(assert (= (and b!1261195 condMapEmpty!50290) mapIsEmpty!50290))

(assert (= (and b!1261195 (not condMapEmpty!50290)) mapNonEmpty!50290))

(get-info :version)

(assert (= (and mapNonEmpty!50290 ((_ is ValueCellFull!15399) mapValue!50290)) b!1261194))

(assert (= (and b!1261195 ((_ is ValueCellFull!15399) mapDefault!50290)) b!1261193))

(assert (= start!105882 b!1261195))

(declare-fun m!1161873 () Bool)

(assert (=> b!1261191 m!1161873))

(declare-fun m!1161875 () Bool)

(assert (=> mapNonEmpty!50290 m!1161875))

(declare-fun m!1161877 () Bool)

(assert (=> start!105882 m!1161877))

(declare-fun m!1161879 () Bool)

(assert (=> start!105882 m!1161879))

(declare-fun m!1161881 () Bool)

(assert (=> start!105882 m!1161881))

(declare-fun m!1161883 () Bool)

(assert (=> b!1261189 m!1161883))

(declare-fun m!1161885 () Bool)

(assert (=> b!1261189 m!1161885))

(declare-fun m!1161887 () Bool)

(assert (=> b!1261190 m!1161887))

(check-sat tp_is_empty!32325 (not b!1261191) (not mapNonEmpty!50290) (not b_next!27423) b_and!45331 (not b!1261190) (not b!1261189) (not start!105882))
(check-sat b_and!45331 (not b_next!27423))
