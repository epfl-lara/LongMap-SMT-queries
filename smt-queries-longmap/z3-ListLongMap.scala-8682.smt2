; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105486 () Bool)

(assert start!105486)

(declare-fun b_free!27127 () Bool)

(declare-fun b_next!27127 () Bool)

(assert (=> start!105486 (= b_free!27127 (not b_next!27127))))

(declare-fun tp!94897 () Bool)

(declare-fun b_and!44965 () Bool)

(assert (=> start!105486 (= tp!94897 b_and!44965)))

(declare-fun b!1256706 () Bool)

(declare-fun e!714486 () Bool)

(assert (=> b!1256706 (= e!714486 true)))

(declare-datatypes ((V!48071 0))(
  ( (V!48072 (val!16077 Int)) )
))
(declare-datatypes ((tuple2!20854 0))(
  ( (tuple2!20855 (_1!10438 (_ BitVec 64)) (_2!10438 V!48071)) )
))
(declare-datatypes ((List!28062 0))(
  ( (Nil!28059) (Cons!28058 (h!29267 tuple2!20854) (t!41542 List!28062)) )
))
(declare-datatypes ((ListLongMap!18727 0))(
  ( (ListLongMap!18728 (toList!9379 List!28062)) )
))
(declare-fun lt!568171 () ListLongMap!18727)

(declare-fun -!2043 (ListLongMap!18727 (_ BitVec 64)) ListLongMap!18727)

(assert (=> b!1256706 (= (-!2043 lt!568171 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568171)))

(declare-datatypes ((Unit!41715 0))(
  ( (Unit!41716) )
))
(declare-fun lt!568169 () Unit!41715)

(declare-fun removeNotPresentStillSame!138 (ListLongMap!18727 (_ BitVec 64)) Unit!41715)

(assert (=> b!1256706 (= lt!568169 (removeNotPresentStillSame!138 lt!568171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!837766 () Bool)

(declare-fun e!714484 () Bool)

(assert (=> start!105486 (=> (not res!837766) (not e!714484))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105486 (= res!837766 (validMask!0 mask!1466))))

(assert (=> start!105486 e!714484))

(assert (=> start!105486 true))

(assert (=> start!105486 tp!94897))

(declare-fun tp_is_empty!32029 () Bool)

(assert (=> start!105486 tp_is_empty!32029))

(declare-datatypes ((array!81627 0))(
  ( (array!81628 (arr!39372 (Array (_ BitVec 32) (_ BitVec 64))) (size!39910 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81627)

(declare-fun array_inv!30129 (array!81627) Bool)

(assert (=> start!105486 (array_inv!30129 _keys!1118)))

(declare-datatypes ((ValueCell!15251 0))(
  ( (ValueCellFull!15251 (v!18777 V!48071)) (EmptyCell!15251) )
))
(declare-datatypes ((array!81629 0))(
  ( (array!81630 (arr!39373 (Array (_ BitVec 32) ValueCell!15251)) (size!39911 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81629)

(declare-fun e!714488 () Bool)

(declare-fun array_inv!30130 (array!81629) Bool)

(assert (=> start!105486 (and (array_inv!30130 _values!914) e!714488)))

(declare-fun mapNonEmpty!49831 () Bool)

(declare-fun mapRes!49831 () Bool)

(declare-fun tp!94898 () Bool)

(declare-fun e!714483 () Bool)

(assert (=> mapNonEmpty!49831 (= mapRes!49831 (and tp!94898 e!714483))))

(declare-fun mapKey!49831 () (_ BitVec 32))

(declare-fun mapValue!49831 () ValueCell!15251)

(declare-fun mapRest!49831 () (Array (_ BitVec 32) ValueCell!15251))

(assert (=> mapNonEmpty!49831 (= (arr!39373 _values!914) (store mapRest!49831 mapKey!49831 mapValue!49831))))

(declare-fun b!1256707 () Bool)

(declare-fun e!714485 () Bool)

(assert (=> b!1256707 (= e!714485 e!714486)))

(declare-fun res!837765 () Bool)

(assert (=> b!1256707 (=> res!837765 e!714486)))

(declare-fun contains!7530 (ListLongMap!18727 (_ BitVec 64)) Bool)

(assert (=> b!1256707 (= res!837765 (contains!7530 lt!568171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48071)

(declare-fun minValueBefore!43 () V!48071)

(declare-fun getCurrentListMap!4489 (array!81627 array!81629 (_ BitVec 32) (_ BitVec 32) V!48071 V!48071 (_ BitVec 32) Int) ListLongMap!18727)

(assert (=> b!1256707 (= lt!568171 (getCurrentListMap!4489 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256708 () Bool)

(assert (=> b!1256708 (= e!714483 tp_is_empty!32029)))

(declare-fun b!1256709 () Bool)

(assert (=> b!1256709 (= e!714484 (not e!714485))))

(declare-fun res!837767 () Bool)

(assert (=> b!1256709 (=> res!837767 e!714485)))

(assert (=> b!1256709 (= res!837767 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568170 () ListLongMap!18727)

(declare-fun lt!568173 () ListLongMap!18727)

(assert (=> b!1256709 (= lt!568170 lt!568173)))

(declare-fun minValueAfter!43 () V!48071)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!568172 () Unit!41715)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1086 (array!81627 array!81629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48071 V!48071 V!48071 V!48071 (_ BitVec 32) Int) Unit!41715)

(assert (=> b!1256709 (= lt!568172 (lemmaNoChangeToArrayThenSameMapNoExtras!1086 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5764 (array!81627 array!81629 (_ BitVec 32) (_ BitVec 32) V!48071 V!48071 (_ BitVec 32) Int) ListLongMap!18727)

(assert (=> b!1256709 (= lt!568173 (getCurrentListMapNoExtraKeys!5764 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256709 (= lt!568170 (getCurrentListMapNoExtraKeys!5764 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256710 () Bool)

(declare-fun e!714487 () Bool)

(assert (=> b!1256710 (= e!714487 tp_is_empty!32029)))

(declare-fun b!1256711 () Bool)

(assert (=> b!1256711 (= e!714488 (and e!714487 mapRes!49831))))

(declare-fun condMapEmpty!49831 () Bool)

(declare-fun mapDefault!49831 () ValueCell!15251)

(assert (=> b!1256711 (= condMapEmpty!49831 (= (arr!39373 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15251)) mapDefault!49831)))))

(declare-fun mapIsEmpty!49831 () Bool)

(assert (=> mapIsEmpty!49831 mapRes!49831))

(declare-fun b!1256712 () Bool)

(declare-fun res!837768 () Bool)

(assert (=> b!1256712 (=> (not res!837768) (not e!714484))))

(declare-datatypes ((List!28063 0))(
  ( (Nil!28060) (Cons!28059 (h!29268 (_ BitVec 64)) (t!41543 List!28063)) )
))
(declare-fun arrayNoDuplicates!0 (array!81627 (_ BitVec 32) List!28063) Bool)

(assert (=> b!1256712 (= res!837768 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28060))))

(declare-fun b!1256713 () Bool)

(declare-fun res!837769 () Bool)

(assert (=> b!1256713 (=> (not res!837769) (not e!714484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81627 (_ BitVec 32)) Bool)

(assert (=> b!1256713 (= res!837769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256714 () Bool)

(declare-fun res!837770 () Bool)

(assert (=> b!1256714 (=> (not res!837770) (not e!714484))))

(assert (=> b!1256714 (= res!837770 (and (= (size!39911 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39910 _keys!1118) (size!39911 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105486 res!837766) b!1256714))

(assert (= (and b!1256714 res!837770) b!1256713))

(assert (= (and b!1256713 res!837769) b!1256712))

(assert (= (and b!1256712 res!837768) b!1256709))

(assert (= (and b!1256709 (not res!837767)) b!1256707))

(assert (= (and b!1256707 (not res!837765)) b!1256706))

(assert (= (and b!1256711 condMapEmpty!49831) mapIsEmpty!49831))

(assert (= (and b!1256711 (not condMapEmpty!49831)) mapNonEmpty!49831))

(get-info :version)

(assert (= (and mapNonEmpty!49831 ((_ is ValueCellFull!15251) mapValue!49831)) b!1256708))

(assert (= (and b!1256711 ((_ is ValueCellFull!15251) mapDefault!49831)) b!1256710))

(assert (= start!105486 b!1256711))

(declare-fun m!1156903 () Bool)

(assert (=> b!1256706 m!1156903))

(declare-fun m!1156905 () Bool)

(assert (=> b!1256706 m!1156905))

(declare-fun m!1156907 () Bool)

(assert (=> mapNonEmpty!49831 m!1156907))

(declare-fun m!1156909 () Bool)

(assert (=> b!1256713 m!1156909))

(declare-fun m!1156911 () Bool)

(assert (=> b!1256712 m!1156911))

(declare-fun m!1156913 () Bool)

(assert (=> b!1256709 m!1156913))

(declare-fun m!1156915 () Bool)

(assert (=> b!1256709 m!1156915))

(declare-fun m!1156917 () Bool)

(assert (=> b!1256709 m!1156917))

(declare-fun m!1156919 () Bool)

(assert (=> b!1256707 m!1156919))

(declare-fun m!1156921 () Bool)

(assert (=> b!1256707 m!1156921))

(declare-fun m!1156923 () Bool)

(assert (=> start!105486 m!1156923))

(declare-fun m!1156925 () Bool)

(assert (=> start!105486 m!1156925))

(declare-fun m!1156927 () Bool)

(assert (=> start!105486 m!1156927))

(check-sat (not mapNonEmpty!49831) (not b!1256713) (not start!105486) b_and!44965 (not b_next!27127) (not b!1256707) (not b!1256706) tp_is_empty!32029 (not b!1256709) (not b!1256712))
(check-sat b_and!44965 (not b_next!27127))
