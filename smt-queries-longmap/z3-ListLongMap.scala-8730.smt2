; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105876 () Bool)

(assert start!105876)

(declare-fun b_free!27417 () Bool)

(declare-fun b_next!27417 () Bool)

(assert (=> start!105876 (= b_free!27417 (not b_next!27417))))

(declare-fun tp!95782 () Bool)

(declare-fun b_and!45325 () Bool)

(assert (=> start!105876 (= tp!95782 b_and!45325)))

(declare-fun mapNonEmpty!50281 () Bool)

(declare-fun mapRes!50281 () Bool)

(declare-fun tp!95783 () Bool)

(declare-fun e!717721 () Bool)

(assert (=> mapNonEmpty!50281 (= mapRes!50281 (and tp!95783 e!717721))))

(declare-datatypes ((V!48457 0))(
  ( (V!48458 (val!16222 Int)) )
))
(declare-datatypes ((ValueCell!15396 0))(
  ( (ValueCellFull!15396 (v!18926 V!48457)) (EmptyCell!15396) )
))
(declare-fun mapRest!50281 () (Array (_ BitVec 32) ValueCell!15396))

(declare-datatypes ((array!82252 0))(
  ( (array!82253 (arr!39679 (Array (_ BitVec 32) ValueCell!15396)) (size!40215 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82252)

(declare-fun mapKey!50281 () (_ BitVec 32))

(declare-fun mapValue!50281 () ValueCell!15396)

(assert (=> mapNonEmpty!50281 (= (arr!39679 _values!914) (store mapRest!50281 mapKey!50281 mapValue!50281))))

(declare-fun b!1261126 () Bool)

(declare-fun res!840397 () Bool)

(declare-fun e!717723 () Bool)

(assert (=> b!1261126 (=> (not res!840397) (not e!717723))))

(declare-datatypes ((array!82254 0))(
  ( (array!82255 (arr!39680 (Array (_ BitVec 32) (_ BitVec 64))) (size!40216 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82254)

(declare-datatypes ((List!28190 0))(
  ( (Nil!28187) (Cons!28186 (h!29395 (_ BitVec 64)) (t!41689 List!28190)) )
))
(declare-fun arrayNoDuplicates!0 (array!82254 (_ BitVec 32) List!28190) Bool)

(assert (=> b!1261126 (= res!840397 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28187))))

(declare-fun b!1261127 () Bool)

(declare-fun res!840396 () Bool)

(assert (=> b!1261127 (=> (not res!840396) (not e!717723))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1261127 (= res!840396 (and (= (size!40215 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40216 _keys!1118) (size!40215 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261128 () Bool)

(declare-fun tp_is_empty!32319 () Bool)

(assert (=> b!1261128 (= e!717721 tp_is_empty!32319)))

(declare-fun b!1261129 () Bool)

(declare-fun e!717725 () Bool)

(assert (=> b!1261129 (= e!717725 tp_is_empty!32319)))

(declare-fun b!1261130 () Bool)

(declare-fun e!717722 () Bool)

(assert (=> b!1261130 (= e!717722 (and e!717725 mapRes!50281))))

(declare-fun condMapEmpty!50281 () Bool)

(declare-fun mapDefault!50281 () ValueCell!15396)

(assert (=> b!1261130 (= condMapEmpty!50281 (= (arr!39679 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15396)) mapDefault!50281)))))

(declare-fun mapIsEmpty!50281 () Bool)

(assert (=> mapIsEmpty!50281 mapRes!50281))

(declare-fun res!840395 () Bool)

(assert (=> start!105876 (=> (not res!840395) (not e!717723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105876 (= res!840395 (validMask!0 mask!1466))))

(assert (=> start!105876 e!717723))

(assert (=> start!105876 true))

(assert (=> start!105876 tp!95782))

(assert (=> start!105876 tp_is_empty!32319))

(declare-fun array_inv!30209 (array!82254) Bool)

(assert (=> start!105876 (array_inv!30209 _keys!1118)))

(declare-fun array_inv!30210 (array!82252) Bool)

(assert (=> start!105876 (and (array_inv!30210 _values!914) e!717722)))

(declare-fun b!1261131 () Bool)

(declare-fun res!840394 () Bool)

(assert (=> b!1261131 (=> (not res!840394) (not e!717723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82254 (_ BitVec 32)) Bool)

(assert (=> b!1261131 (= res!840394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261132 () Bool)

(assert (=> b!1261132 (= e!717723 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48457)

(declare-fun zeroValue!871 () V!48457)

(declare-datatypes ((tuple2!20992 0))(
  ( (tuple2!20993 (_1!10507 (_ BitVec 64)) (_2!10507 V!48457)) )
))
(declare-datatypes ((List!28191 0))(
  ( (Nil!28188) (Cons!28187 (h!29396 tuple2!20992) (t!41690 List!28191)) )
))
(declare-datatypes ((ListLongMap!18865 0))(
  ( (ListLongMap!18866 (toList!9448 List!28191)) )
))
(declare-fun lt!571538 () ListLongMap!18865)

(declare-fun getCurrentListMapNoExtraKeys!5816 (array!82254 array!82252 (_ BitVec 32) (_ BitVec 32) V!48457 V!48457 (_ BitVec 32) Int) ListLongMap!18865)

(assert (=> b!1261132 (= lt!571538 (getCurrentListMapNoExtraKeys!5816 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48457)

(declare-fun lt!571539 () ListLongMap!18865)

(assert (=> b!1261132 (= lt!571539 (getCurrentListMapNoExtraKeys!5816 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105876 res!840395) b!1261127))

(assert (= (and b!1261127 res!840396) b!1261131))

(assert (= (and b!1261131 res!840394) b!1261126))

(assert (= (and b!1261126 res!840397) b!1261132))

(assert (= (and b!1261130 condMapEmpty!50281) mapIsEmpty!50281))

(assert (= (and b!1261130 (not condMapEmpty!50281)) mapNonEmpty!50281))

(get-info :version)

(assert (= (and mapNonEmpty!50281 ((_ is ValueCellFull!15396) mapValue!50281)) b!1261128))

(assert (= (and b!1261130 ((_ is ValueCellFull!15396) mapDefault!50281)) b!1261129))

(assert (= start!105876 b!1261130))

(declare-fun m!1161825 () Bool)

(assert (=> b!1261132 m!1161825))

(declare-fun m!1161827 () Bool)

(assert (=> b!1261132 m!1161827))

(declare-fun m!1161829 () Bool)

(assert (=> b!1261131 m!1161829))

(declare-fun m!1161831 () Bool)

(assert (=> mapNonEmpty!50281 m!1161831))

(declare-fun m!1161833 () Bool)

(assert (=> b!1261126 m!1161833))

(declare-fun m!1161835 () Bool)

(assert (=> start!105876 m!1161835))

(declare-fun m!1161837 () Bool)

(assert (=> start!105876 m!1161837))

(declare-fun m!1161839 () Bool)

(assert (=> start!105876 m!1161839))

(check-sat tp_is_empty!32319 b_and!45325 (not b!1261126) (not b_next!27417) (not start!105876) (not b!1261132) (not mapNonEmpty!50281) (not b!1261131))
(check-sat b_and!45325 (not b_next!27417))
