; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105410 () Bool)

(assert start!105410)

(declare-fun b_free!27069 () Bool)

(declare-fun b_next!27069 () Bool)

(assert (=> start!105410 (= b_free!27069 (not b_next!27069))))

(declare-fun tp!94721 () Bool)

(declare-fun b_and!44915 () Bool)

(assert (=> start!105410 (= tp!94721 b_and!44915)))

(declare-fun b!1255849 () Bool)

(declare-fun e!713822 () Bool)

(declare-fun e!713819 () Bool)

(assert (=> b!1255849 (= e!713822 (not e!713819))))

(declare-fun res!837224 () Bool)

(assert (=> b!1255849 (=> res!837224 e!713819)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255849 (= res!837224 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47993 0))(
  ( (V!47994 (val!16048 Int)) )
))
(declare-datatypes ((tuple2!20724 0))(
  ( (tuple2!20725 (_1!10373 (_ BitVec 64)) (_2!10373 V!47993)) )
))
(declare-datatypes ((List!27945 0))(
  ( (Nil!27942) (Cons!27941 (h!29150 tuple2!20724) (t!41432 List!27945)) )
))
(declare-datatypes ((ListLongMap!18597 0))(
  ( (ListLongMap!18598 (toList!9314 List!27945)) )
))
(declare-fun lt!567793 () ListLongMap!18597)

(declare-fun lt!567791 () ListLongMap!18597)

(assert (=> b!1255849 (= lt!567793 lt!567791)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47993)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47993)

(declare-datatypes ((array!81584 0))(
  ( (array!81585 (arr!39351 (Array (_ BitVec 32) (_ BitVec 64))) (size!39887 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81584)

(declare-datatypes ((ValueCell!15222 0))(
  ( (ValueCellFull!15222 (v!18748 V!47993)) (EmptyCell!15222) )
))
(declare-datatypes ((array!81586 0))(
  ( (array!81587 (arr!39352 (Array (_ BitVec 32) ValueCell!15222)) (size!39888 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81586)

(declare-fun minValueBefore!43 () V!47993)

(declare-datatypes ((Unit!41814 0))(
  ( (Unit!41815) )
))
(declare-fun lt!567790 () Unit!41814)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1063 (array!81584 array!81586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47993 V!47993 V!47993 V!47993 (_ BitVec 32) Int) Unit!41814)

(assert (=> b!1255849 (= lt!567790 (lemmaNoChangeToArrayThenSameMapNoExtras!1063 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5699 (array!81584 array!81586 (_ BitVec 32) (_ BitVec 32) V!47993 V!47993 (_ BitVec 32) Int) ListLongMap!18597)

(assert (=> b!1255849 (= lt!567791 (getCurrentListMapNoExtraKeys!5699 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255849 (= lt!567793 (getCurrentListMapNoExtraKeys!5699 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255850 () Bool)

(declare-fun e!713824 () Bool)

(assert (=> b!1255850 (= e!713824 true)))

(declare-fun lt!567792 () ListLongMap!18597)

(declare-fun -!2067 (ListLongMap!18597 (_ BitVec 64)) ListLongMap!18597)

(assert (=> b!1255850 (= (-!2067 lt!567792 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567792)))

(declare-fun lt!567789 () Unit!41814)

(declare-fun removeNotPresentStillSame!120 (ListLongMap!18597 (_ BitVec 64)) Unit!41814)

(assert (=> b!1255850 (= lt!567789 (removeNotPresentStillSame!120 lt!567792 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49741 () Bool)

(declare-fun mapRes!49741 () Bool)

(declare-fun tp!94720 () Bool)

(declare-fun e!713820 () Bool)

(assert (=> mapNonEmpty!49741 (= mapRes!49741 (and tp!94720 e!713820))))

(declare-fun mapRest!49741 () (Array (_ BitVec 32) ValueCell!15222))

(declare-fun mapKey!49741 () (_ BitVec 32))

(declare-fun mapValue!49741 () ValueCell!15222)

(assert (=> mapNonEmpty!49741 (= (arr!39352 _values!914) (store mapRest!49741 mapKey!49741 mapValue!49741))))

(declare-fun b!1255851 () Bool)

(declare-fun e!713823 () Bool)

(declare-fun tp_is_empty!31971 () Bool)

(assert (=> b!1255851 (= e!713823 tp_is_empty!31971)))

(declare-fun b!1255852 () Bool)

(declare-fun res!837223 () Bool)

(assert (=> b!1255852 (=> (not res!837223) (not e!713822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81584 (_ BitVec 32)) Bool)

(assert (=> b!1255852 (= res!837223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255853 () Bool)

(assert (=> b!1255853 (= e!713819 e!713824)))

(declare-fun res!837222 () Bool)

(assert (=> b!1255853 (=> res!837222 e!713824)))

(declare-fun contains!7532 (ListLongMap!18597 (_ BitVec 64)) Bool)

(assert (=> b!1255853 (= res!837222 (contains!7532 lt!567792 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4538 (array!81584 array!81586 (_ BitVec 32) (_ BitVec 32) V!47993 V!47993 (_ BitVec 32) Int) ListLongMap!18597)

(assert (=> b!1255853 (= lt!567792 (getCurrentListMap!4538 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255854 () Bool)

(assert (=> b!1255854 (= e!713820 tp_is_empty!31971)))

(declare-fun b!1255855 () Bool)

(declare-fun res!837227 () Bool)

(assert (=> b!1255855 (=> (not res!837227) (not e!713822))))

(declare-datatypes ((List!27946 0))(
  ( (Nil!27943) (Cons!27942 (h!29151 (_ BitVec 64)) (t!41433 List!27946)) )
))
(declare-fun arrayNoDuplicates!0 (array!81584 (_ BitVec 32) List!27946) Bool)

(assert (=> b!1255855 (= res!837227 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27943))))

(declare-fun mapIsEmpty!49741 () Bool)

(assert (=> mapIsEmpty!49741 mapRes!49741))

(declare-fun b!1255856 () Bool)

(declare-fun e!713825 () Bool)

(assert (=> b!1255856 (= e!713825 (and e!713823 mapRes!49741))))

(declare-fun condMapEmpty!49741 () Bool)

(declare-fun mapDefault!49741 () ValueCell!15222)

(assert (=> b!1255856 (= condMapEmpty!49741 (= (arr!39352 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15222)) mapDefault!49741)))))

(declare-fun b!1255848 () Bool)

(declare-fun res!837225 () Bool)

(assert (=> b!1255848 (=> (not res!837225) (not e!713822))))

(assert (=> b!1255848 (= res!837225 (and (= (size!39888 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39887 _keys!1118) (size!39888 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!837226 () Bool)

(assert (=> start!105410 (=> (not res!837226) (not e!713822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105410 (= res!837226 (validMask!0 mask!1466))))

(assert (=> start!105410 e!713822))

(assert (=> start!105410 true))

(assert (=> start!105410 tp!94721))

(assert (=> start!105410 tp_is_empty!31971))

(declare-fun array_inv!29983 (array!81584) Bool)

(assert (=> start!105410 (array_inv!29983 _keys!1118)))

(declare-fun array_inv!29984 (array!81586) Bool)

(assert (=> start!105410 (and (array_inv!29984 _values!914) e!713825)))

(assert (= (and start!105410 res!837226) b!1255848))

(assert (= (and b!1255848 res!837225) b!1255852))

(assert (= (and b!1255852 res!837223) b!1255855))

(assert (= (and b!1255855 res!837227) b!1255849))

(assert (= (and b!1255849 (not res!837224)) b!1255853))

(assert (= (and b!1255853 (not res!837222)) b!1255850))

(assert (= (and b!1255856 condMapEmpty!49741) mapIsEmpty!49741))

(assert (= (and b!1255856 (not condMapEmpty!49741)) mapNonEmpty!49741))

(get-info :version)

(assert (= (and mapNonEmpty!49741 ((_ is ValueCellFull!15222) mapValue!49741)) b!1255854))

(assert (= (and b!1255856 ((_ is ValueCellFull!15222) mapDefault!49741)) b!1255851))

(assert (= start!105410 b!1255856))

(declare-fun m!1156543 () Bool)

(assert (=> b!1255853 m!1156543))

(declare-fun m!1156545 () Bool)

(assert (=> b!1255853 m!1156545))

(declare-fun m!1156547 () Bool)

(assert (=> start!105410 m!1156547))

(declare-fun m!1156549 () Bool)

(assert (=> start!105410 m!1156549))

(declare-fun m!1156551 () Bool)

(assert (=> start!105410 m!1156551))

(declare-fun m!1156553 () Bool)

(assert (=> b!1255849 m!1156553))

(declare-fun m!1156555 () Bool)

(assert (=> b!1255849 m!1156555))

(declare-fun m!1156557 () Bool)

(assert (=> b!1255849 m!1156557))

(declare-fun m!1156559 () Bool)

(assert (=> b!1255852 m!1156559))

(declare-fun m!1156561 () Bool)

(assert (=> b!1255850 m!1156561))

(declare-fun m!1156563 () Bool)

(assert (=> b!1255850 m!1156563))

(declare-fun m!1156565 () Bool)

(assert (=> mapNonEmpty!49741 m!1156565))

(declare-fun m!1156567 () Bool)

(assert (=> b!1255855 m!1156567))

(check-sat (not b!1255853) (not b_next!27069) (not start!105410) b_and!44915 (not b!1255855) (not b!1255849) (not b!1255852) (not mapNonEmpty!49741) (not b!1255850) tp_is_empty!31971)
(check-sat b_and!44915 (not b_next!27069))
