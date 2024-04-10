; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105852 () Bool)

(assert start!105852)

(declare-fun b_free!27393 () Bool)

(declare-fun b_next!27393 () Bool)

(assert (=> start!105852 (= b_free!27393 (not b_next!27393))))

(declare-fun tp!95710 () Bool)

(declare-fun b_and!45301 () Bool)

(assert (=> start!105852 (= tp!95710 b_and!45301)))

(declare-fun b!1260874 () Bool)

(declare-fun e!717542 () Bool)

(declare-fun tp_is_empty!32295 () Bool)

(assert (=> b!1260874 (= e!717542 tp_is_empty!32295)))

(declare-fun res!840253 () Bool)

(declare-fun e!717543 () Bool)

(assert (=> start!105852 (=> (not res!840253) (not e!717543))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105852 (= res!840253 (validMask!0 mask!1466))))

(assert (=> start!105852 e!717543))

(assert (=> start!105852 true))

(assert (=> start!105852 tp!95710))

(assert (=> start!105852 tp_is_empty!32295))

(declare-datatypes ((array!82206 0))(
  ( (array!82207 (arr!39656 (Array (_ BitVec 32) (_ BitVec 64))) (size!40192 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82206)

(declare-fun array_inv!30189 (array!82206) Bool)

(assert (=> start!105852 (array_inv!30189 _keys!1118)))

(declare-datatypes ((V!48425 0))(
  ( (V!48426 (val!16210 Int)) )
))
(declare-datatypes ((ValueCell!15384 0))(
  ( (ValueCellFull!15384 (v!18914 V!48425)) (EmptyCell!15384) )
))
(declare-datatypes ((array!82208 0))(
  ( (array!82209 (arr!39657 (Array (_ BitVec 32) ValueCell!15384)) (size!40193 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82208)

(declare-fun e!717545 () Bool)

(declare-fun array_inv!30190 (array!82208) Bool)

(assert (=> start!105852 (and (array_inv!30190 _values!914) e!717545)))

(declare-fun b!1260875 () Bool)

(declare-fun res!840250 () Bool)

(assert (=> b!1260875 (=> (not res!840250) (not e!717543))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1260875 (= res!840250 (and (= (size!40193 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40192 _keys!1118) (size!40193 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50245 () Bool)

(declare-fun mapRes!50245 () Bool)

(declare-fun tp!95711 () Bool)

(assert (=> mapNonEmpty!50245 (= mapRes!50245 (and tp!95711 e!717542))))

(declare-fun mapKey!50245 () (_ BitVec 32))

(declare-fun mapValue!50245 () ValueCell!15384)

(declare-fun mapRest!50245 () (Array (_ BitVec 32) ValueCell!15384))

(assert (=> mapNonEmpty!50245 (= (arr!39657 _values!914) (store mapRest!50245 mapKey!50245 mapValue!50245))))

(declare-fun b!1260876 () Bool)

(declare-fun res!840251 () Bool)

(assert (=> b!1260876 (=> (not res!840251) (not e!717543))))

(declare-datatypes ((List!28171 0))(
  ( (Nil!28168) (Cons!28167 (h!29376 (_ BitVec 64)) (t!41670 List!28171)) )
))
(declare-fun arrayNoDuplicates!0 (array!82206 (_ BitVec 32) List!28171) Bool)

(assert (=> b!1260876 (= res!840251 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28168))))

(declare-fun b!1260877 () Bool)

(declare-fun res!840252 () Bool)

(assert (=> b!1260877 (=> (not res!840252) (not e!717543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82206 (_ BitVec 32)) Bool)

(assert (=> b!1260877 (= res!840252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260878 () Bool)

(declare-fun e!717544 () Bool)

(assert (=> b!1260878 (= e!717544 tp_is_empty!32295)))

(declare-fun b!1260879 () Bool)

(assert (=> b!1260879 (= e!717543 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48425)

(declare-fun zeroValue!871 () V!48425)

(declare-datatypes ((tuple2!20974 0))(
  ( (tuple2!20975 (_1!10498 (_ BitVec 64)) (_2!10498 V!48425)) )
))
(declare-datatypes ((List!28172 0))(
  ( (Nil!28169) (Cons!28168 (h!29377 tuple2!20974) (t!41671 List!28172)) )
))
(declare-datatypes ((ListLongMap!18847 0))(
  ( (ListLongMap!18848 (toList!9439 List!28172)) )
))
(declare-fun lt!571467 () ListLongMap!18847)

(declare-fun getCurrentListMapNoExtraKeys!5807 (array!82206 array!82208 (_ BitVec 32) (_ BitVec 32) V!48425 V!48425 (_ BitVec 32) Int) ListLongMap!18847)

(assert (=> b!1260879 (= lt!571467 (getCurrentListMapNoExtraKeys!5807 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571466 () ListLongMap!18847)

(declare-fun minValueBefore!43 () V!48425)

(assert (=> b!1260879 (= lt!571466 (getCurrentListMapNoExtraKeys!5807 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50245 () Bool)

(assert (=> mapIsEmpty!50245 mapRes!50245))

(declare-fun b!1260880 () Bool)

(assert (=> b!1260880 (= e!717545 (and e!717544 mapRes!50245))))

(declare-fun condMapEmpty!50245 () Bool)

(declare-fun mapDefault!50245 () ValueCell!15384)

(assert (=> b!1260880 (= condMapEmpty!50245 (= (arr!39657 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15384)) mapDefault!50245)))))

(assert (= (and start!105852 res!840253) b!1260875))

(assert (= (and b!1260875 res!840250) b!1260877))

(assert (= (and b!1260877 res!840252) b!1260876))

(assert (= (and b!1260876 res!840251) b!1260879))

(assert (= (and b!1260880 condMapEmpty!50245) mapIsEmpty!50245))

(assert (= (and b!1260880 (not condMapEmpty!50245)) mapNonEmpty!50245))

(get-info :version)

(assert (= (and mapNonEmpty!50245 ((_ is ValueCellFull!15384) mapValue!50245)) b!1260874))

(assert (= (and b!1260880 ((_ is ValueCellFull!15384) mapDefault!50245)) b!1260878))

(assert (= start!105852 b!1260880))

(declare-fun m!1161633 () Bool)

(assert (=> b!1260876 m!1161633))

(declare-fun m!1161635 () Bool)

(assert (=> start!105852 m!1161635))

(declare-fun m!1161637 () Bool)

(assert (=> start!105852 m!1161637))

(declare-fun m!1161639 () Bool)

(assert (=> start!105852 m!1161639))

(declare-fun m!1161641 () Bool)

(assert (=> b!1260879 m!1161641))

(declare-fun m!1161643 () Bool)

(assert (=> b!1260879 m!1161643))

(declare-fun m!1161645 () Bool)

(assert (=> mapNonEmpty!50245 m!1161645))

(declare-fun m!1161647 () Bool)

(assert (=> b!1260877 m!1161647))

(check-sat (not b_next!27393) b_and!45301 (not start!105852) (not b!1260876) (not mapNonEmpty!50245) (not b!1260879) (not b!1260877) tp_is_empty!32295)
(check-sat b_and!45301 (not b_next!27393))
