; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105852 () Bool)

(assert start!105852)

(declare-fun b_free!27229 () Bool)

(declare-fun b_next!27229 () Bool)

(assert (=> start!105852 (= b_free!27229 (not b_next!27229))))

(declare-fun tp!95209 () Bool)

(declare-fun b_and!45105 () Bool)

(assert (=> start!105852 (= tp!95209 b_and!45105)))

(declare-fun b!1259530 () Bool)

(declare-fun res!839156 () Bool)

(declare-fun e!716423 () Bool)

(assert (=> b!1259530 (=> (not res!839156) (not e!716423))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81939 0))(
  ( (array!81940 (arr!39521 (Array (_ BitVec 32) (_ BitVec 64))) (size!40058 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81939)

(declare-datatypes ((V!48207 0))(
  ( (V!48208 (val!16128 Int)) )
))
(declare-datatypes ((ValueCell!15302 0))(
  ( (ValueCellFull!15302 (v!18826 V!48207)) (EmptyCell!15302) )
))
(declare-datatypes ((array!81941 0))(
  ( (array!81942 (arr!39522 (Array (_ BitVec 32) ValueCell!15302)) (size!40059 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81941)

(assert (=> b!1259530 (= res!839156 (and (= (size!40059 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40058 _keys!1118) (size!40059 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49990 () Bool)

(declare-fun mapRes!49990 () Bool)

(declare-fun tp!95210 () Bool)

(declare-fun e!716420 () Bool)

(assert (=> mapNonEmpty!49990 (= mapRes!49990 (and tp!95210 e!716420))))

(declare-fun mapValue!49990 () ValueCell!15302)

(declare-fun mapRest!49990 () (Array (_ BitVec 32) ValueCell!15302))

(declare-fun mapKey!49990 () (_ BitVec 32))

(assert (=> mapNonEmpty!49990 (= (arr!39522 _values!914) (store mapRest!49990 mapKey!49990 mapValue!49990))))

(declare-fun mapIsEmpty!49990 () Bool)

(assert (=> mapIsEmpty!49990 mapRes!49990))

(declare-fun b!1259531 () Bool)

(declare-fun e!716421 () Bool)

(assert (=> b!1259531 (= e!716421 true)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20854 0))(
  ( (tuple2!20855 (_1!10438 (_ BitVec 64)) (_2!10438 V!48207)) )
))
(declare-datatypes ((List!28085 0))(
  ( (Nil!28082) (Cons!28081 (h!29299 tuple2!20854) (t!41570 List!28085)) )
))
(declare-datatypes ((ListLongMap!18735 0))(
  ( (ListLongMap!18736 (toList!9383 List!28085)) )
))
(declare-fun lt!569580 () ListLongMap!18735)

(declare-fun zeroValue!871 () V!48207)

(declare-fun minValueBefore!43 () V!48207)

(declare-fun getCurrentListMap!4572 (array!81939 array!81941 (_ BitVec 32) (_ BitVec 32) V!48207 V!48207 (_ BitVec 32) Int) ListLongMap!18735)

(assert (=> b!1259531 (= lt!569580 (getCurrentListMap!4572 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259532 () Bool)

(declare-fun e!716424 () Bool)

(declare-fun e!716422 () Bool)

(assert (=> b!1259532 (= e!716424 (and e!716422 mapRes!49990))))

(declare-fun condMapEmpty!49990 () Bool)

(declare-fun mapDefault!49990 () ValueCell!15302)

(assert (=> b!1259532 (= condMapEmpty!49990 (= (arr!39522 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15302)) mapDefault!49990)))))

(declare-fun res!839154 () Bool)

(assert (=> start!105852 (=> (not res!839154) (not e!716423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105852 (= res!839154 (validMask!0 mask!1466))))

(assert (=> start!105852 e!716423))

(assert (=> start!105852 true))

(assert (=> start!105852 tp!95209))

(declare-fun tp_is_empty!32131 () Bool)

(assert (=> start!105852 tp_is_empty!32131))

(declare-fun array_inv!30239 (array!81939) Bool)

(assert (=> start!105852 (array_inv!30239 _keys!1118)))

(declare-fun array_inv!30240 (array!81941) Bool)

(assert (=> start!105852 (and (array_inv!30240 _values!914) e!716424)))

(declare-fun b!1259533 () Bool)

(assert (=> b!1259533 (= e!716420 tp_is_empty!32131)))

(declare-fun b!1259534 () Bool)

(assert (=> b!1259534 (= e!716423 (not e!716421))))

(declare-fun res!839157 () Bool)

(assert (=> b!1259534 (=> res!839157 e!716421)))

(assert (=> b!1259534 (= res!839157 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569581 () ListLongMap!18735)

(declare-fun lt!569579 () ListLongMap!18735)

(assert (=> b!1259534 (= lt!569581 lt!569579)))

(declare-fun minValueAfter!43 () V!48207)

(declare-datatypes ((Unit!41909 0))(
  ( (Unit!41910) )
))
(declare-fun lt!569582 () Unit!41909)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1113 (array!81939 array!81941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48207 V!48207 V!48207 V!48207 (_ BitVec 32) Int) Unit!41909)

(assert (=> b!1259534 (= lt!569582 (lemmaNoChangeToArrayThenSameMapNoExtras!1113 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5799 (array!81939 array!81941 (_ BitVec 32) (_ BitVec 32) V!48207 V!48207 (_ BitVec 32) Int) ListLongMap!18735)

(assert (=> b!1259534 (= lt!569579 (getCurrentListMapNoExtraKeys!5799 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259534 (= lt!569581 (getCurrentListMapNoExtraKeys!5799 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259535 () Bool)

(declare-fun res!839153 () Bool)

(assert (=> b!1259535 (=> (not res!839153) (not e!716423))))

(declare-datatypes ((List!28086 0))(
  ( (Nil!28083) (Cons!28082 (h!29300 (_ BitVec 64)) (t!41571 List!28086)) )
))
(declare-fun arrayNoDuplicates!0 (array!81939 (_ BitVec 32) List!28086) Bool)

(assert (=> b!1259535 (= res!839153 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28083))))

(declare-fun b!1259536 () Bool)

(assert (=> b!1259536 (= e!716422 tp_is_empty!32131)))

(declare-fun b!1259537 () Bool)

(declare-fun res!839155 () Bool)

(assert (=> b!1259537 (=> (not res!839155) (not e!716423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81939 (_ BitVec 32)) Bool)

(assert (=> b!1259537 (= res!839155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105852 res!839154) b!1259530))

(assert (= (and b!1259530 res!839156) b!1259537))

(assert (= (and b!1259537 res!839155) b!1259535))

(assert (= (and b!1259535 res!839153) b!1259534))

(assert (= (and b!1259534 (not res!839157)) b!1259531))

(assert (= (and b!1259532 condMapEmpty!49990) mapIsEmpty!49990))

(assert (= (and b!1259532 (not condMapEmpty!49990)) mapNonEmpty!49990))

(get-info :version)

(assert (= (and mapNonEmpty!49990 ((_ is ValueCellFull!15302) mapValue!49990)) b!1259533))

(assert (= (and b!1259532 ((_ is ValueCellFull!15302) mapDefault!49990)) b!1259536))

(assert (= start!105852 b!1259532))

(declare-fun m!1160301 () Bool)

(assert (=> b!1259537 m!1160301))

(declare-fun m!1160303 () Bool)

(assert (=> b!1259531 m!1160303))

(declare-fun m!1160305 () Bool)

(assert (=> b!1259535 m!1160305))

(declare-fun m!1160307 () Bool)

(assert (=> b!1259534 m!1160307))

(declare-fun m!1160309 () Bool)

(assert (=> b!1259534 m!1160309))

(declare-fun m!1160311 () Bool)

(assert (=> b!1259534 m!1160311))

(declare-fun m!1160313 () Bool)

(assert (=> mapNonEmpty!49990 m!1160313))

(declare-fun m!1160315 () Bool)

(assert (=> start!105852 m!1160315))

(declare-fun m!1160317 () Bool)

(assert (=> start!105852 m!1160317))

(declare-fun m!1160319 () Bool)

(assert (=> start!105852 m!1160319))

(check-sat (not start!105852) tp_is_empty!32131 b_and!45105 (not mapNonEmpty!49990) (not b!1259535) (not b_next!27229) (not b!1259537) (not b!1259531) (not b!1259534))
(check-sat b_and!45105 (not b_next!27229))
