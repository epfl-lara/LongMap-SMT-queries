; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105324 () Bool)

(assert start!105324)

(declare-fun b_free!26997 () Bool)

(declare-fun b_next!26997 () Bool)

(assert (=> start!105324 (= b_free!26997 (not b_next!26997))))

(declare-fun tp!94502 () Bool)

(declare-fun b_and!44835 () Bool)

(assert (=> start!105324 (= tp!94502 b_and!44835)))

(declare-fun b!1254952 () Bool)

(declare-fun e!713171 () Bool)

(declare-fun tp_is_empty!31899 () Bool)

(assert (=> b!1254952 (= e!713171 tp_is_empty!31899)))

(declare-fun b!1254953 () Bool)

(declare-fun res!836706 () Bool)

(declare-fun e!713172 () Bool)

(assert (=> b!1254953 (=> (not res!836706) (not e!713172))))

(declare-datatypes ((array!81454 0))(
  ( (array!81455 (arr!39287 (Array (_ BitVec 32) (_ BitVec 64))) (size!39823 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81454)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81454 (_ BitVec 32)) Bool)

(assert (=> b!1254953 (= res!836706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254954 () Bool)

(declare-fun res!836705 () Bool)

(assert (=> b!1254954 (=> (not res!836705) (not e!713172))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47897 0))(
  ( (V!47898 (val!16012 Int)) )
))
(declare-datatypes ((ValueCell!15186 0))(
  ( (ValueCellFull!15186 (v!18712 V!47897)) (EmptyCell!15186) )
))
(declare-datatypes ((array!81456 0))(
  ( (array!81457 (arr!39288 (Array (_ BitVec 32) ValueCell!15186)) (size!39824 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81456)

(assert (=> b!1254954 (= res!836705 (and (= (size!39824 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39823 _keys!1118) (size!39824 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254955 () Bool)

(declare-fun res!836704 () Bool)

(assert (=> b!1254955 (=> (not res!836704) (not e!713172))))

(declare-datatypes ((List!27905 0))(
  ( (Nil!27902) (Cons!27901 (h!29110 (_ BitVec 64)) (t!41390 List!27905)) )
))
(declare-fun arrayNoDuplicates!0 (array!81454 (_ BitVec 32) List!27905) Bool)

(assert (=> b!1254955 (= res!836704 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27902))))

(declare-fun mapIsEmpty!49630 () Bool)

(declare-fun mapRes!49630 () Bool)

(assert (=> mapIsEmpty!49630 mapRes!49630))

(declare-fun res!836707 () Bool)

(assert (=> start!105324 (=> (not res!836707) (not e!713172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105324 (= res!836707 (validMask!0 mask!1466))))

(assert (=> start!105324 e!713172))

(assert (=> start!105324 true))

(assert (=> start!105324 tp!94502))

(assert (=> start!105324 tp_is_empty!31899))

(declare-fun array_inv!29945 (array!81454) Bool)

(assert (=> start!105324 (array_inv!29945 _keys!1118)))

(declare-fun e!713169 () Bool)

(declare-fun array_inv!29946 (array!81456) Bool)

(assert (=> start!105324 (and (array_inv!29946 _values!914) e!713169)))

(declare-fun mapNonEmpty!49630 () Bool)

(declare-fun tp!94501 () Bool)

(assert (=> mapNonEmpty!49630 (= mapRes!49630 (and tp!94501 e!713171))))

(declare-fun mapRest!49630 () (Array (_ BitVec 32) ValueCell!15186))

(declare-fun mapValue!49630 () ValueCell!15186)

(declare-fun mapKey!49630 () (_ BitVec 32))

(assert (=> mapNonEmpty!49630 (= (arr!39288 _values!914) (store mapRest!49630 mapKey!49630 mapValue!49630))))

(declare-fun b!1254956 () Bool)

(declare-fun e!713170 () Bool)

(assert (=> b!1254956 (= e!713169 (and e!713170 mapRes!49630))))

(declare-fun condMapEmpty!49630 () Bool)

(declare-fun mapDefault!49630 () ValueCell!15186)

(assert (=> b!1254956 (= condMapEmpty!49630 (= (arr!39288 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15186)) mapDefault!49630)))))

(declare-fun b!1254957 () Bool)

(assert (=> b!1254957 (= e!713170 tp_is_empty!31899)))

(declare-fun b!1254958 () Bool)

(assert (=> b!1254958 (= e!713172 (not true))))

(declare-datatypes ((tuple2!20682 0))(
  ( (tuple2!20683 (_1!10352 (_ BitVec 64)) (_2!10352 V!47897)) )
))
(declare-datatypes ((List!27906 0))(
  ( (Nil!27903) (Cons!27902 (h!29111 tuple2!20682) (t!41391 List!27906)) )
))
(declare-datatypes ((ListLongMap!18555 0))(
  ( (ListLongMap!18556 (toList!9293 List!27906)) )
))
(declare-fun lt!567372 () ListLongMap!18555)

(declare-fun lt!567370 () ListLongMap!18555)

(assert (=> b!1254958 (= lt!567372 lt!567370)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47897)

(declare-fun zeroValue!871 () V!47897)

(declare-fun minValueBefore!43 () V!47897)

(declare-datatypes ((Unit!41772 0))(
  ( (Unit!41773) )
))
(declare-fun lt!567371 () Unit!41772)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1042 (array!81454 array!81456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47897 V!47897 V!47897 V!47897 (_ BitVec 32) Int) Unit!41772)

(assert (=> b!1254958 (= lt!567371 (lemmaNoChangeToArrayThenSameMapNoExtras!1042 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5678 (array!81454 array!81456 (_ BitVec 32) (_ BitVec 32) V!47897 V!47897 (_ BitVec 32) Int) ListLongMap!18555)

(assert (=> b!1254958 (= lt!567370 (getCurrentListMapNoExtraKeys!5678 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254958 (= lt!567372 (getCurrentListMapNoExtraKeys!5678 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105324 res!836707) b!1254954))

(assert (= (and b!1254954 res!836705) b!1254953))

(assert (= (and b!1254953 res!836706) b!1254955))

(assert (= (and b!1254955 res!836704) b!1254958))

(assert (= (and b!1254956 condMapEmpty!49630) mapIsEmpty!49630))

(assert (= (and b!1254956 (not condMapEmpty!49630)) mapNonEmpty!49630))

(get-info :version)

(assert (= (and mapNonEmpty!49630 ((_ is ValueCellFull!15186) mapValue!49630)) b!1254952))

(assert (= (and b!1254956 ((_ is ValueCellFull!15186) mapDefault!49630)) b!1254957))

(assert (= start!105324 b!1254956))

(declare-fun m!1155761 () Bool)

(assert (=> start!105324 m!1155761))

(declare-fun m!1155763 () Bool)

(assert (=> start!105324 m!1155763))

(declare-fun m!1155765 () Bool)

(assert (=> start!105324 m!1155765))

(declare-fun m!1155767 () Bool)

(assert (=> b!1254955 m!1155767))

(declare-fun m!1155769 () Bool)

(assert (=> b!1254958 m!1155769))

(declare-fun m!1155771 () Bool)

(assert (=> b!1254958 m!1155771))

(declare-fun m!1155773 () Bool)

(assert (=> b!1254958 m!1155773))

(declare-fun m!1155775 () Bool)

(assert (=> mapNonEmpty!49630 m!1155775))

(declare-fun m!1155777 () Bool)

(assert (=> b!1254953 m!1155777))

(check-sat (not b!1254955) (not b_next!26997) (not b!1254958) b_and!44835 (not start!105324) tp_is_empty!31899 (not mapNonEmpty!49630) (not b!1254953))
(check-sat b_and!44835 (not b_next!26997))
