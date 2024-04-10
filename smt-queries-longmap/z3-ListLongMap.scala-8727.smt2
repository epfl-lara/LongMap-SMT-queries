; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105858 () Bool)

(assert start!105858)

(declare-fun b_free!27399 () Bool)

(declare-fun b_next!27399 () Bool)

(assert (=> start!105858 (= b_free!27399 (not b_next!27399))))

(declare-fun tp!95729 () Bool)

(declare-fun b_and!45307 () Bool)

(assert (=> start!105858 (= tp!95729 b_and!45307)))

(declare-fun b!1260937 () Bool)

(declare-fun res!840289 () Bool)

(declare-fun e!717588 () Bool)

(assert (=> b!1260937 (=> (not res!840289) (not e!717588))))

(declare-datatypes ((array!82218 0))(
  ( (array!82219 (arr!39662 (Array (_ BitVec 32) (_ BitVec 64))) (size!40198 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82218)

(declare-datatypes ((List!28177 0))(
  ( (Nil!28174) (Cons!28173 (h!29382 (_ BitVec 64)) (t!41676 List!28177)) )
))
(declare-fun arrayNoDuplicates!0 (array!82218 (_ BitVec 32) List!28177) Bool)

(assert (=> b!1260937 (= res!840289 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28174))))

(declare-fun mapIsEmpty!50254 () Bool)

(declare-fun mapRes!50254 () Bool)

(assert (=> mapIsEmpty!50254 mapRes!50254))

(declare-fun b!1260938 () Bool)

(assert (=> b!1260938 (= e!717588 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48433 0))(
  ( (V!48434 (val!16213 Int)) )
))
(declare-datatypes ((tuple2!20980 0))(
  ( (tuple2!20981 (_1!10501 (_ BitVec 64)) (_2!10501 V!48433)) )
))
(declare-datatypes ((List!28178 0))(
  ( (Nil!28175) (Cons!28174 (h!29383 tuple2!20980) (t!41677 List!28178)) )
))
(declare-datatypes ((ListLongMap!18853 0))(
  ( (ListLongMap!18854 (toList!9442 List!28178)) )
))
(declare-fun lt!571484 () ListLongMap!18853)

(declare-fun minValueAfter!43 () V!48433)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48433)

(declare-datatypes ((ValueCell!15387 0))(
  ( (ValueCellFull!15387 (v!18917 V!48433)) (EmptyCell!15387) )
))
(declare-datatypes ((array!82220 0))(
  ( (array!82221 (arr!39663 (Array (_ BitVec 32) ValueCell!15387)) (size!40199 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82220)

(declare-fun getCurrentListMapNoExtraKeys!5810 (array!82218 array!82220 (_ BitVec 32) (_ BitVec 32) V!48433 V!48433 (_ BitVec 32) Int) ListLongMap!18853)

(assert (=> b!1260938 (= lt!571484 (getCurrentListMapNoExtraKeys!5810 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!571485 () ListLongMap!18853)

(declare-fun minValueBefore!43 () V!48433)

(assert (=> b!1260938 (= lt!571485 (getCurrentListMapNoExtraKeys!5810 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260939 () Bool)

(declare-fun res!840287 () Bool)

(assert (=> b!1260939 (=> (not res!840287) (not e!717588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82218 (_ BitVec 32)) Bool)

(assert (=> b!1260939 (= res!840287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260940 () Bool)

(declare-fun e!717590 () Bool)

(declare-fun tp_is_empty!32301 () Bool)

(assert (=> b!1260940 (= e!717590 tp_is_empty!32301)))

(declare-fun mapNonEmpty!50254 () Bool)

(declare-fun tp!95728 () Bool)

(declare-fun e!717587 () Bool)

(assert (=> mapNonEmpty!50254 (= mapRes!50254 (and tp!95728 e!717587))))

(declare-fun mapValue!50254 () ValueCell!15387)

(declare-fun mapRest!50254 () (Array (_ BitVec 32) ValueCell!15387))

(declare-fun mapKey!50254 () (_ BitVec 32))

(assert (=> mapNonEmpty!50254 (= (arr!39663 _values!914) (store mapRest!50254 mapKey!50254 mapValue!50254))))

(declare-fun b!1260941 () Bool)

(declare-fun e!717586 () Bool)

(assert (=> b!1260941 (= e!717586 (and e!717590 mapRes!50254))))

(declare-fun condMapEmpty!50254 () Bool)

(declare-fun mapDefault!50254 () ValueCell!15387)

(assert (=> b!1260941 (= condMapEmpty!50254 (= (arr!39663 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15387)) mapDefault!50254)))))

(declare-fun res!840288 () Bool)

(assert (=> start!105858 (=> (not res!840288) (not e!717588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105858 (= res!840288 (validMask!0 mask!1466))))

(assert (=> start!105858 e!717588))

(assert (=> start!105858 true))

(assert (=> start!105858 tp!95729))

(assert (=> start!105858 tp_is_empty!32301))

(declare-fun array_inv!30193 (array!82218) Bool)

(assert (=> start!105858 (array_inv!30193 _keys!1118)))

(declare-fun array_inv!30194 (array!82220) Bool)

(assert (=> start!105858 (and (array_inv!30194 _values!914) e!717586)))

(declare-fun b!1260942 () Bool)

(declare-fun res!840286 () Bool)

(assert (=> b!1260942 (=> (not res!840286) (not e!717588))))

(assert (=> b!1260942 (= res!840286 (and (= (size!40199 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40198 _keys!1118) (size!40199 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260943 () Bool)

(assert (=> b!1260943 (= e!717587 tp_is_empty!32301)))

(assert (= (and start!105858 res!840288) b!1260942))

(assert (= (and b!1260942 res!840286) b!1260939))

(assert (= (and b!1260939 res!840287) b!1260937))

(assert (= (and b!1260937 res!840289) b!1260938))

(assert (= (and b!1260941 condMapEmpty!50254) mapIsEmpty!50254))

(assert (= (and b!1260941 (not condMapEmpty!50254)) mapNonEmpty!50254))

(get-info :version)

(assert (= (and mapNonEmpty!50254 ((_ is ValueCellFull!15387) mapValue!50254)) b!1260943))

(assert (= (and b!1260941 ((_ is ValueCellFull!15387) mapDefault!50254)) b!1260940))

(assert (= start!105858 b!1260941))

(declare-fun m!1161681 () Bool)

(assert (=> b!1260939 m!1161681))

(declare-fun m!1161683 () Bool)

(assert (=> b!1260937 m!1161683))

(declare-fun m!1161685 () Bool)

(assert (=> mapNonEmpty!50254 m!1161685))

(declare-fun m!1161687 () Bool)

(assert (=> start!105858 m!1161687))

(declare-fun m!1161689 () Bool)

(assert (=> start!105858 m!1161689))

(declare-fun m!1161691 () Bool)

(assert (=> start!105858 m!1161691))

(declare-fun m!1161693 () Bool)

(assert (=> b!1260938 m!1161693))

(declare-fun m!1161695 () Bool)

(assert (=> b!1260938 m!1161695))

(check-sat (not b!1260938) b_and!45307 (not b!1260937) (not start!105858) tp_is_empty!32301 (not b!1260939) (not mapNonEmpty!50254) (not b_next!27399))
(check-sat b_and!45307 (not b_next!27399))
