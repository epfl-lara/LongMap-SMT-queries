; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105782 () Bool)

(assert start!105782)

(declare-fun b_free!27345 () Bool)

(declare-fun b_next!27345 () Bool)

(assert (=> start!105782 (= b_free!27345 (not b_next!27345))))

(declare-fun tp!95563 () Bool)

(declare-fun b_and!45241 () Bool)

(assert (=> start!105782 (= tp!95563 b_and!45241)))

(declare-fun b!1260066 () Bool)

(declare-fun res!839763 () Bool)

(declare-fun e!716949 () Bool)

(assert (=> b!1260066 (=> (not res!839763) (not e!716949))))

(declare-datatypes ((array!82112 0))(
  ( (array!82113 (arr!39610 (Array (_ BitVec 32) (_ BitVec 64))) (size!40146 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82112)

(declare-datatypes ((List!28134 0))(
  ( (Nil!28131) (Cons!28130 (h!29339 (_ BitVec 64)) (t!41631 List!28134)) )
))
(declare-fun arrayNoDuplicates!0 (array!82112 (_ BitVec 32) List!28134) Bool)

(assert (=> b!1260066 (= res!839763 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28131))))

(declare-fun b!1260067 () Bool)

(declare-fun e!716945 () Bool)

(declare-fun tp_is_empty!32247 () Bool)

(assert (=> b!1260067 (= e!716945 tp_is_empty!32247)))

(declare-fun b!1260068 () Bool)

(declare-fun e!716946 () Bool)

(assert (=> b!1260068 (= e!716949 (not e!716946))))

(declare-fun res!839761 () Bool)

(assert (=> b!1260068 (=> res!839761 e!716946)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260068 (= res!839761 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48361 0))(
  ( (V!48362 (val!16186 Int)) )
))
(declare-datatypes ((tuple2!20932 0))(
  ( (tuple2!20933 (_1!10477 (_ BitVec 64)) (_2!10477 V!48361)) )
))
(declare-datatypes ((List!28135 0))(
  ( (Nil!28132) (Cons!28131 (h!29340 tuple2!20932) (t!41632 List!28135)) )
))
(declare-datatypes ((ListLongMap!18805 0))(
  ( (ListLongMap!18806 (toList!9418 List!28135)) )
))
(declare-fun lt!570710 () ListLongMap!18805)

(declare-fun lt!570706 () ListLongMap!18805)

(assert (=> b!1260068 (= lt!570710 lt!570706)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48361)

(declare-datatypes ((Unit!42021 0))(
  ( (Unit!42022) )
))
(declare-fun lt!570703 () Unit!42021)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48361)

(declare-datatypes ((ValueCell!15360 0))(
  ( (ValueCellFull!15360 (v!18889 V!48361)) (EmptyCell!15360) )
))
(declare-datatypes ((array!82114 0))(
  ( (array!82115 (arr!39611 (Array (_ BitVec 32) ValueCell!15360)) (size!40147 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82114)

(declare-fun minValueBefore!43 () V!48361)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1156 (array!82112 array!82114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48361 V!48361 V!48361 V!48361 (_ BitVec 32) Int) Unit!42021)

(assert (=> b!1260068 (= lt!570703 (lemmaNoChangeToArrayThenSameMapNoExtras!1156 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5792 (array!82112 array!82114 (_ BitVec 32) (_ BitVec 32) V!48361 V!48361 (_ BitVec 32) Int) ListLongMap!18805)

(assert (=> b!1260068 (= lt!570706 (getCurrentListMapNoExtraKeys!5792 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260068 (= lt!570710 (getCurrentListMapNoExtraKeys!5792 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260069 () Bool)

(assert (=> b!1260069 (= e!716946 true)))

(declare-fun lt!570705 () ListLongMap!18805)

(declare-fun lt!570704 () ListLongMap!18805)

(declare-fun -!2124 (ListLongMap!18805 (_ BitVec 64)) ListLongMap!18805)

(assert (=> b!1260069 (= lt!570705 (-!2124 lt!570704 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570708 () ListLongMap!18805)

(declare-fun lt!570707 () ListLongMap!18805)

(assert (=> b!1260069 (= (-!2124 lt!570708 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570707)))

(declare-fun lt!570711 () Unit!42021)

(declare-fun addThenRemoveForNewKeyIsSame!361 (ListLongMap!18805 (_ BitVec 64) V!48361) Unit!42021)

(assert (=> b!1260069 (= lt!570711 (addThenRemoveForNewKeyIsSame!361 lt!570707 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716947 () Bool)

(assert (=> b!1260069 e!716947))

(declare-fun res!839760 () Bool)

(assert (=> b!1260069 (=> (not res!839760) (not e!716947))))

(assert (=> b!1260069 (= res!839760 (= lt!570704 lt!570708))))

(declare-fun +!4222 (ListLongMap!18805 tuple2!20932) ListLongMap!18805)

(assert (=> b!1260069 (= lt!570708 (+!4222 lt!570707 (tuple2!20933 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570712 () tuple2!20932)

(assert (=> b!1260069 (= lt!570707 (+!4222 lt!570710 lt!570712))))

(assert (=> b!1260069 (= lt!570712 (tuple2!20933 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570709 () ListLongMap!18805)

(declare-fun getCurrentListMap!4615 (array!82112 array!82114 (_ BitVec 32) (_ BitVec 32) V!48361 V!48361 (_ BitVec 32) Int) ListLongMap!18805)

(assert (=> b!1260069 (= lt!570709 (getCurrentListMap!4615 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260069 (= lt!570704 (getCurrentListMap!4615 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260070 () Bool)

(declare-fun e!716944 () Bool)

(declare-fun mapRes!50170 () Bool)

(assert (=> b!1260070 (= e!716944 (and e!716945 mapRes!50170))))

(declare-fun condMapEmpty!50170 () Bool)

(declare-fun mapDefault!50170 () ValueCell!15360)

(assert (=> b!1260070 (= condMapEmpty!50170 (= (arr!39611 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15360)) mapDefault!50170)))))

(declare-fun res!839764 () Bool)

(assert (=> start!105782 (=> (not res!839764) (not e!716949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105782 (= res!839764 (validMask!0 mask!1466))))

(assert (=> start!105782 e!716949))

(assert (=> start!105782 true))

(assert (=> start!105782 tp!95563))

(assert (=> start!105782 tp_is_empty!32247))

(declare-fun array_inv!30157 (array!82112) Bool)

(assert (=> start!105782 (array_inv!30157 _keys!1118)))

(declare-fun array_inv!30158 (array!82114) Bool)

(assert (=> start!105782 (and (array_inv!30158 _values!914) e!716944)))

(declare-fun b!1260071 () Bool)

(assert (=> b!1260071 (= e!716947 (= lt!570709 (+!4222 lt!570706 lt!570712)))))

(declare-fun mapNonEmpty!50170 () Bool)

(declare-fun tp!95564 () Bool)

(declare-fun e!716950 () Bool)

(assert (=> mapNonEmpty!50170 (= mapRes!50170 (and tp!95564 e!716950))))

(declare-fun mapRest!50170 () (Array (_ BitVec 32) ValueCell!15360))

(declare-fun mapValue!50170 () ValueCell!15360)

(declare-fun mapKey!50170 () (_ BitVec 32))

(assert (=> mapNonEmpty!50170 (= (arr!39611 _values!914) (store mapRest!50170 mapKey!50170 mapValue!50170))))

(declare-fun mapIsEmpty!50170 () Bool)

(assert (=> mapIsEmpty!50170 mapRes!50170))

(declare-fun b!1260072 () Bool)

(assert (=> b!1260072 (= e!716950 tp_is_empty!32247)))

(declare-fun b!1260073 () Bool)

(declare-fun res!839762 () Bool)

(assert (=> b!1260073 (=> (not res!839762) (not e!716949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82112 (_ BitVec 32)) Bool)

(assert (=> b!1260073 (= res!839762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260074 () Bool)

(declare-fun res!839765 () Bool)

(assert (=> b!1260074 (=> (not res!839765) (not e!716949))))

(assert (=> b!1260074 (= res!839765 (and (= (size!40147 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40146 _keys!1118) (size!40147 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105782 res!839764) b!1260074))

(assert (= (and b!1260074 res!839765) b!1260073))

(assert (= (and b!1260073 res!839762) b!1260066))

(assert (= (and b!1260066 res!839763) b!1260068))

(assert (= (and b!1260068 (not res!839761)) b!1260069))

(assert (= (and b!1260069 res!839760) b!1260071))

(assert (= (and b!1260070 condMapEmpty!50170) mapIsEmpty!50170))

(assert (= (and b!1260070 (not condMapEmpty!50170)) mapNonEmpty!50170))

(get-info :version)

(assert (= (and mapNonEmpty!50170 ((_ is ValueCellFull!15360) mapValue!50170)) b!1260072))

(assert (= (and b!1260070 ((_ is ValueCellFull!15360) mapDefault!50170)) b!1260067))

(assert (= start!105782 b!1260070))

(declare-fun m!1160675 () Bool)

(assert (=> mapNonEmpty!50170 m!1160675))

(declare-fun m!1160677 () Bool)

(assert (=> b!1260069 m!1160677))

(declare-fun m!1160679 () Bool)

(assert (=> b!1260069 m!1160679))

(declare-fun m!1160681 () Bool)

(assert (=> b!1260069 m!1160681))

(declare-fun m!1160683 () Bool)

(assert (=> b!1260069 m!1160683))

(declare-fun m!1160685 () Bool)

(assert (=> b!1260069 m!1160685))

(declare-fun m!1160687 () Bool)

(assert (=> b!1260069 m!1160687))

(declare-fun m!1160689 () Bool)

(assert (=> b!1260069 m!1160689))

(declare-fun m!1160691 () Bool)

(assert (=> start!105782 m!1160691))

(declare-fun m!1160693 () Bool)

(assert (=> start!105782 m!1160693))

(declare-fun m!1160695 () Bool)

(assert (=> start!105782 m!1160695))

(declare-fun m!1160697 () Bool)

(assert (=> b!1260071 m!1160697))

(declare-fun m!1160699 () Bool)

(assert (=> b!1260073 m!1160699))

(declare-fun m!1160701 () Bool)

(assert (=> b!1260066 m!1160701))

(declare-fun m!1160703 () Bool)

(assert (=> b!1260068 m!1160703))

(declare-fun m!1160705 () Bool)

(assert (=> b!1260068 m!1160705))

(declare-fun m!1160707 () Bool)

(assert (=> b!1260068 m!1160707))

(check-sat (not b_next!27345) b_and!45241 (not start!105782) (not b!1260071) (not b!1260068) (not b!1260066) (not mapNonEmpty!50170) (not b!1260069) tp_is_empty!32247 (not b!1260073))
(check-sat b_and!45241 (not b_next!27345))
