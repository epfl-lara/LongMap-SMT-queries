; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105318 () Bool)

(assert start!105318)

(declare-fun b_free!26995 () Bool)

(declare-fun b_next!26995 () Bool)

(assert (=> start!105318 (= b_free!26995 (not b_next!26995))))

(declare-fun tp!94495 () Bool)

(declare-fun b_and!44815 () Bool)

(assert (=> start!105318 (= tp!94495 b_and!44815)))

(declare-fun b!1254849 () Bool)

(declare-fun res!836655 () Bool)

(declare-fun e!713110 () Bool)

(assert (=> b!1254849 (=> (not res!836655) (not e!713110))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81373 0))(
  ( (array!81374 (arr!39247 (Array (_ BitVec 32) (_ BitVec 64))) (size!39785 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81373)

(declare-datatypes ((V!47895 0))(
  ( (V!47896 (val!16011 Int)) )
))
(declare-datatypes ((ValueCell!15185 0))(
  ( (ValueCellFull!15185 (v!18710 V!47895)) (EmptyCell!15185) )
))
(declare-datatypes ((array!81375 0))(
  ( (array!81376 (arr!39248 (Array (_ BitVec 32) ValueCell!15185)) (size!39786 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81375)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254849 (= res!836655 (and (= (size!39786 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39785 _keys!1118) (size!39786 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254850 () Bool)

(declare-fun res!836654 () Bool)

(assert (=> b!1254850 (=> (not res!836654) (not e!713110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81373 (_ BitVec 32)) Bool)

(assert (=> b!1254850 (= res!836654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254851 () Bool)

(declare-fun e!713112 () Bool)

(declare-fun tp_is_empty!31897 () Bool)

(assert (=> b!1254851 (= e!713112 tp_is_empty!31897)))

(declare-fun mapNonEmpty!49627 () Bool)

(declare-fun mapRes!49627 () Bool)

(declare-fun tp!94496 () Bool)

(declare-fun e!713109 () Bool)

(assert (=> mapNonEmpty!49627 (= mapRes!49627 (and tp!94496 e!713109))))

(declare-fun mapKey!49627 () (_ BitVec 32))

(declare-fun mapValue!49627 () ValueCell!15185)

(declare-fun mapRest!49627 () (Array (_ BitVec 32) ValueCell!15185))

(assert (=> mapNonEmpty!49627 (= (arr!39248 _values!914) (store mapRest!49627 mapKey!49627 mapValue!49627))))

(declare-fun mapIsEmpty!49627 () Bool)

(assert (=> mapIsEmpty!49627 mapRes!49627))

(declare-fun res!836652 () Bool)

(assert (=> start!105318 (=> (not res!836652) (not e!713110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105318 (= res!836652 (validMask!0 mask!1466))))

(assert (=> start!105318 e!713110))

(assert (=> start!105318 true))

(assert (=> start!105318 tp!94495))

(assert (=> start!105318 tp_is_empty!31897))

(declare-fun array_inv!30045 (array!81373) Bool)

(assert (=> start!105318 (array_inv!30045 _keys!1118)))

(declare-fun e!713113 () Bool)

(declare-fun array_inv!30046 (array!81375) Bool)

(assert (=> start!105318 (and (array_inv!30046 _values!914) e!713113)))

(declare-fun b!1254852 () Bool)

(declare-fun res!836653 () Bool)

(assert (=> b!1254852 (=> (not res!836653) (not e!713110))))

(declare-datatypes ((List!27966 0))(
  ( (Nil!27963) (Cons!27962 (h!29171 (_ BitVec 64)) (t!41442 List!27966)) )
))
(declare-fun arrayNoDuplicates!0 (array!81373 (_ BitVec 32) List!27966) Bool)

(assert (=> b!1254852 (= res!836653 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27963))))

(declare-fun b!1254853 () Bool)

(assert (=> b!1254853 (= e!713109 tp_is_empty!31897)))

(declare-fun b!1254854 () Bool)

(assert (=> b!1254854 (= e!713113 (and e!713112 mapRes!49627))))

(declare-fun condMapEmpty!49627 () Bool)

(declare-fun mapDefault!49627 () ValueCell!15185)

(assert (=> b!1254854 (= condMapEmpty!49627 (= (arr!39248 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15185)) mapDefault!49627)))))

(declare-fun b!1254855 () Bool)

(assert (=> b!1254855 (= e!713110 (not true))))

(declare-datatypes ((tuple2!20756 0))(
  ( (tuple2!20757 (_1!10389 (_ BitVec 64)) (_2!10389 V!47895)) )
))
(declare-datatypes ((List!27967 0))(
  ( (Nil!27964) (Cons!27963 (h!29172 tuple2!20756) (t!41443 List!27967)) )
))
(declare-datatypes ((ListLongMap!18629 0))(
  ( (ListLongMap!18630 (toList!9330 List!27967)) )
))
(declare-fun lt!567184 () ListLongMap!18629)

(declare-fun lt!567183 () ListLongMap!18629)

(assert (=> b!1254855 (= lt!567184 lt!567183)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47895)

(declare-fun zeroValue!871 () V!47895)

(declare-datatypes ((Unit!41627 0))(
  ( (Unit!41628) )
))
(declare-fun lt!567182 () Unit!41627)

(declare-fun minValueBefore!43 () V!47895)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1047 (array!81373 array!81375 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47895 V!47895 V!47895 V!47895 (_ BitVec 32) Int) Unit!41627)

(assert (=> b!1254855 (= lt!567182 (lemmaNoChangeToArrayThenSameMapNoExtras!1047 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5725 (array!81373 array!81375 (_ BitVec 32) (_ BitVec 32) V!47895 V!47895 (_ BitVec 32) Int) ListLongMap!18629)

(assert (=> b!1254855 (= lt!567183 (getCurrentListMapNoExtraKeys!5725 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254855 (= lt!567184 (getCurrentListMapNoExtraKeys!5725 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105318 res!836652) b!1254849))

(assert (= (and b!1254849 res!836655) b!1254850))

(assert (= (and b!1254850 res!836654) b!1254852))

(assert (= (and b!1254852 res!836653) b!1254855))

(assert (= (and b!1254854 condMapEmpty!49627) mapIsEmpty!49627))

(assert (= (and b!1254854 (not condMapEmpty!49627)) mapNonEmpty!49627))

(get-info :version)

(assert (= (and mapNonEmpty!49627 ((_ is ValueCellFull!15185) mapValue!49627)) b!1254853))

(assert (= (and b!1254854 ((_ is ValueCellFull!15185) mapDefault!49627)) b!1254851))

(assert (= start!105318 b!1254854))

(declare-fun m!1155223 () Bool)

(assert (=> b!1254852 m!1155223))

(declare-fun m!1155225 () Bool)

(assert (=> b!1254850 m!1155225))

(declare-fun m!1155227 () Bool)

(assert (=> mapNonEmpty!49627 m!1155227))

(declare-fun m!1155229 () Bool)

(assert (=> start!105318 m!1155229))

(declare-fun m!1155231 () Bool)

(assert (=> start!105318 m!1155231))

(declare-fun m!1155233 () Bool)

(assert (=> start!105318 m!1155233))

(declare-fun m!1155235 () Bool)

(assert (=> b!1254855 m!1155235))

(declare-fun m!1155237 () Bool)

(assert (=> b!1254855 m!1155237))

(declare-fun m!1155239 () Bool)

(assert (=> b!1254855 m!1155239))

(check-sat (not b!1254850) tp_is_empty!31897 (not mapNonEmpty!49627) (not start!105318) b_and!44815 (not b!1254855) (not b_next!26995) (not b!1254852))
(check-sat b_and!44815 (not b_next!26995))
