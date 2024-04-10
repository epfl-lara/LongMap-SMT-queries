; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105484 () Bool)

(assert start!105484)

(declare-fun b_free!27121 () Bool)

(declare-fun b_next!27121 () Bool)

(assert (=> start!105484 (= b_free!27121 (not b_next!27121))))

(declare-fun tp!94880 () Bool)

(declare-fun b_and!44977 () Bool)

(assert (=> start!105484 (= tp!94880 b_and!44977)))

(declare-fun res!837756 () Bool)

(declare-fun e!714466 () Bool)

(assert (=> start!105484 (=> (not res!837756) (not e!714466))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105484 (= res!837756 (validMask!0 mask!1466))))

(assert (=> start!105484 e!714466))

(assert (=> start!105484 true))

(assert (=> start!105484 tp!94880))

(declare-fun tp_is_empty!32023 () Bool)

(assert (=> start!105484 tp_is_empty!32023))

(declare-datatypes ((array!81684 0))(
  ( (array!81685 (arr!39400 (Array (_ BitVec 32) (_ BitVec 64))) (size!39936 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81684)

(declare-fun array_inv!30015 (array!81684) Bool)

(assert (=> start!105484 (array_inv!30015 _keys!1118)))

(declare-datatypes ((V!48063 0))(
  ( (V!48064 (val!16074 Int)) )
))
(declare-datatypes ((ValueCell!15248 0))(
  ( (ValueCellFull!15248 (v!18775 V!48063)) (EmptyCell!15248) )
))
(declare-datatypes ((array!81686 0))(
  ( (array!81687 (arr!39401 (Array (_ BitVec 32) ValueCell!15248)) (size!39937 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81686)

(declare-fun e!714469 () Bool)

(declare-fun array_inv!30016 (array!81686) Bool)

(assert (=> start!105484 (and (array_inv!30016 _values!914) e!714469)))

(declare-fun b!1256707 () Bool)

(declare-fun e!714467 () Bool)

(assert (=> b!1256707 (= e!714467 tp_is_empty!32023)))

(declare-fun b!1256708 () Bool)

(declare-fun e!714465 () Bool)

(declare-fun e!714471 () Bool)

(assert (=> b!1256708 (= e!714465 e!714471)))

(declare-fun res!837755 () Bool)

(assert (=> b!1256708 (=> res!837755 e!714471)))

(declare-datatypes ((tuple2!20764 0))(
  ( (tuple2!20765 (_1!10393 (_ BitVec 64)) (_2!10393 V!48063)) )
))
(declare-datatypes ((List!27981 0))(
  ( (Nil!27978) (Cons!27977 (h!29186 tuple2!20764) (t!41470 List!27981)) )
))
(declare-datatypes ((ListLongMap!18637 0))(
  ( (ListLongMap!18638 (toList!9334 List!27981)) )
))
(declare-fun lt!568305 () ListLongMap!18637)

(declare-fun contains!7552 (ListLongMap!18637 (_ BitVec 64)) Bool)

(assert (=> b!1256708 (= res!837755 (contains!7552 lt!568305 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48063)

(declare-fun minValueBefore!43 () V!48063)

(declare-fun getCurrentListMap!4557 (array!81684 array!81686 (_ BitVec 32) (_ BitVec 32) V!48063 V!48063 (_ BitVec 32) Int) ListLongMap!18637)

(assert (=> b!1256708 (= lt!568305 (getCurrentListMap!4557 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256709 () Bool)

(declare-fun e!714468 () Bool)

(assert (=> b!1256709 (= e!714468 tp_is_empty!32023)))

(declare-fun b!1256710 () Bool)

(assert (=> b!1256710 (= e!714471 true)))

(declare-fun -!2084 (ListLongMap!18637 (_ BitVec 64)) ListLongMap!18637)

(assert (=> b!1256710 (= (-!2084 lt!568305 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568305)))

(declare-datatypes ((Unit!41852 0))(
  ( (Unit!41853) )
))
(declare-fun lt!568306 () Unit!41852)

(declare-fun removeNotPresentStillSame!137 (ListLongMap!18637 (_ BitVec 64)) Unit!41852)

(assert (=> b!1256710 (= lt!568306 (removeNotPresentStillSame!137 lt!568305 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256711 () Bool)

(declare-fun res!837751 () Bool)

(assert (=> b!1256711 (=> (not res!837751) (not e!714466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81684 (_ BitVec 32)) Bool)

(assert (=> b!1256711 (= res!837751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256712 () Bool)

(declare-fun res!837752 () Bool)

(assert (=> b!1256712 (=> (not res!837752) (not e!714466))))

(declare-datatypes ((List!27982 0))(
  ( (Nil!27979) (Cons!27978 (h!29187 (_ BitVec 64)) (t!41471 List!27982)) )
))
(declare-fun arrayNoDuplicates!0 (array!81684 (_ BitVec 32) List!27982) Bool)

(assert (=> b!1256712 (= res!837752 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27979))))

(declare-fun mapNonEmpty!49822 () Bool)

(declare-fun mapRes!49822 () Bool)

(declare-fun tp!94879 () Bool)

(assert (=> mapNonEmpty!49822 (= mapRes!49822 (and tp!94879 e!714467))))

(declare-fun mapRest!49822 () (Array (_ BitVec 32) ValueCell!15248))

(declare-fun mapValue!49822 () ValueCell!15248)

(declare-fun mapKey!49822 () (_ BitVec 32))

(assert (=> mapNonEmpty!49822 (= (arr!39401 _values!914) (store mapRest!49822 mapKey!49822 mapValue!49822))))

(declare-fun b!1256713 () Bool)

(assert (=> b!1256713 (= e!714466 (not e!714465))))

(declare-fun res!837753 () Bool)

(assert (=> b!1256713 (=> res!837753 e!714465)))

(assert (=> b!1256713 (= res!837753 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568304 () ListLongMap!18637)

(declare-fun lt!568307 () ListLongMap!18637)

(assert (=> b!1256713 (= lt!568304 lt!568307)))

(declare-fun lt!568303 () Unit!41852)

(declare-fun minValueAfter!43 () V!48063)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1080 (array!81684 array!81686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48063 V!48063 V!48063 V!48063 (_ BitVec 32) Int) Unit!41852)

(assert (=> b!1256713 (= lt!568303 (lemmaNoChangeToArrayThenSameMapNoExtras!1080 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5716 (array!81684 array!81686 (_ BitVec 32) (_ BitVec 32) V!48063 V!48063 (_ BitVec 32) Int) ListLongMap!18637)

(assert (=> b!1256713 (= lt!568307 (getCurrentListMapNoExtraKeys!5716 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256713 (= lt!568304 (getCurrentListMapNoExtraKeys!5716 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256714 () Bool)

(declare-fun res!837754 () Bool)

(assert (=> b!1256714 (=> (not res!837754) (not e!714466))))

(assert (=> b!1256714 (= res!837754 (and (= (size!39937 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39936 _keys!1118) (size!39937 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256715 () Bool)

(assert (=> b!1256715 (= e!714469 (and e!714468 mapRes!49822))))

(declare-fun condMapEmpty!49822 () Bool)

(declare-fun mapDefault!49822 () ValueCell!15248)

