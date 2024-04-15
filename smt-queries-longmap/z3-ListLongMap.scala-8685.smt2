; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105504 () Bool)

(assert start!105504)

(declare-fun b_free!27145 () Bool)

(declare-fun b_next!27145 () Bool)

(assert (=> start!105504 (= b_free!27145 (not b_next!27145))))

(declare-fun tp!94952 () Bool)

(declare-fun b_and!44983 () Bool)

(assert (=> start!105504 (= tp!94952 b_and!44983)))

(declare-fun mapIsEmpty!49858 () Bool)

(declare-fun mapRes!49858 () Bool)

(assert (=> mapIsEmpty!49858 mapRes!49858))

(declare-fun b!1256949 () Bool)

(declare-fun e!714675 () Bool)

(assert (=> b!1256949 (= e!714675 true)))

(declare-datatypes ((V!48095 0))(
  ( (V!48096 (val!16086 Int)) )
))
(declare-datatypes ((tuple2!20866 0))(
  ( (tuple2!20867 (_1!10444 (_ BitVec 64)) (_2!10444 V!48095)) )
))
(declare-datatypes ((List!28073 0))(
  ( (Nil!28070) (Cons!28069 (h!29278 tuple2!20866) (t!41553 List!28073)) )
))
(declare-datatypes ((ListLongMap!18739 0))(
  ( (ListLongMap!18740 (toList!9385 List!28073)) )
))
(declare-fun lt!568307 () ListLongMap!18739)

(declare-fun -!2048 (ListLongMap!18739 (_ BitVec 64)) ListLongMap!18739)

(assert (=> b!1256949 (= (-!2048 lt!568307 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568307)))

(declare-datatypes ((Unit!41727 0))(
  ( (Unit!41728) )
))
(declare-fun lt!568308 () Unit!41727)

(declare-fun removeNotPresentStillSame!143 (ListLongMap!18739 (_ BitVec 64)) Unit!41727)

(assert (=> b!1256949 (= lt!568308 (removeNotPresentStillSame!143 lt!568307 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256950 () Bool)

(declare-fun e!714673 () Bool)

(assert (=> b!1256950 (= e!714673 e!714675)))

(declare-fun res!837927 () Bool)

(assert (=> b!1256950 (=> res!837927 e!714675)))

(declare-fun contains!7536 (ListLongMap!18739 (_ BitVec 64)) Bool)

(assert (=> b!1256950 (= res!837927 (contains!7536 lt!568307 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48095)

(declare-datatypes ((array!81657 0))(
  ( (array!81658 (arr!39387 (Array (_ BitVec 32) (_ BitVec 64))) (size!39925 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81657)

(declare-fun minValueBefore!43 () V!48095)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15260 0))(
  ( (ValueCellFull!15260 (v!18786 V!48095)) (EmptyCell!15260) )
))
(declare-datatypes ((array!81659 0))(
  ( (array!81660 (arr!39388 (Array (_ BitVec 32) ValueCell!15260)) (size!39926 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81659)

(declare-fun getCurrentListMap!4495 (array!81657 array!81659 (_ BitVec 32) (_ BitVec 32) V!48095 V!48095 (_ BitVec 32) Int) ListLongMap!18739)

(assert (=> b!1256950 (= lt!568307 (getCurrentListMap!4495 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256951 () Bool)

(declare-fun e!714672 () Bool)

(declare-fun tp_is_empty!32047 () Bool)

(assert (=> b!1256951 (= e!714672 tp_is_empty!32047)))

(declare-fun b!1256952 () Bool)

(declare-fun res!837929 () Bool)

(declare-fun e!714676 () Bool)

(assert (=> b!1256952 (=> (not res!837929) (not e!714676))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1256952 (= res!837929 (and (= (size!39926 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39925 _keys!1118) (size!39926 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!837930 () Bool)

(assert (=> start!105504 (=> (not res!837930) (not e!714676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105504 (= res!837930 (validMask!0 mask!1466))))

(assert (=> start!105504 e!714676))

(assert (=> start!105504 true))

(assert (=> start!105504 tp!94952))

(assert (=> start!105504 tp_is_empty!32047))

(declare-fun array_inv!30139 (array!81657) Bool)

(assert (=> start!105504 (array_inv!30139 _keys!1118)))

(declare-fun e!714678 () Bool)

(declare-fun array_inv!30140 (array!81659) Bool)

(assert (=> start!105504 (and (array_inv!30140 _values!914) e!714678)))

(declare-fun b!1256953 () Bool)

(assert (=> b!1256953 (= e!714678 (and e!714672 mapRes!49858))))

(declare-fun condMapEmpty!49858 () Bool)

(declare-fun mapDefault!49858 () ValueCell!15260)

(assert (=> b!1256953 (= condMapEmpty!49858 (= (arr!39388 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15260)) mapDefault!49858)))))

(declare-fun b!1256954 () Bool)

(declare-fun e!714674 () Bool)

(assert (=> b!1256954 (= e!714674 tp_is_empty!32047)))

(declare-fun mapNonEmpty!49858 () Bool)

(declare-fun tp!94951 () Bool)

(assert (=> mapNonEmpty!49858 (= mapRes!49858 (and tp!94951 e!714674))))

(declare-fun mapRest!49858 () (Array (_ BitVec 32) ValueCell!15260))

(declare-fun mapKey!49858 () (_ BitVec 32))

(declare-fun mapValue!49858 () ValueCell!15260)

(assert (=> mapNonEmpty!49858 (= (arr!39388 _values!914) (store mapRest!49858 mapKey!49858 mapValue!49858))))

(declare-fun b!1256955 () Bool)

(declare-fun res!837932 () Bool)

(assert (=> b!1256955 (=> (not res!837932) (not e!714676))))

(declare-datatypes ((List!28074 0))(
  ( (Nil!28071) (Cons!28070 (h!29279 (_ BitVec 64)) (t!41554 List!28074)) )
))
(declare-fun arrayNoDuplicates!0 (array!81657 (_ BitVec 32) List!28074) Bool)

(assert (=> b!1256955 (= res!837932 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28071))))

(declare-fun b!1256956 () Bool)

(assert (=> b!1256956 (= e!714676 (not e!714673))))

(declare-fun res!837928 () Bool)

(assert (=> b!1256956 (=> res!837928 e!714673)))

(assert (=> b!1256956 (= res!837928 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568305 () ListLongMap!18739)

(declare-fun lt!568306 () ListLongMap!18739)

(assert (=> b!1256956 (= lt!568305 lt!568306)))

(declare-fun minValueAfter!43 () V!48095)

(declare-fun lt!568304 () Unit!41727)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1091 (array!81657 array!81659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48095 V!48095 V!48095 V!48095 (_ BitVec 32) Int) Unit!41727)

(assert (=> b!1256956 (= lt!568304 (lemmaNoChangeToArrayThenSameMapNoExtras!1091 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5769 (array!81657 array!81659 (_ BitVec 32) (_ BitVec 32) V!48095 V!48095 (_ BitVec 32) Int) ListLongMap!18739)

(assert (=> b!1256956 (= lt!568306 (getCurrentListMapNoExtraKeys!5769 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256956 (= lt!568305 (getCurrentListMapNoExtraKeys!5769 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256957 () Bool)

(declare-fun res!837931 () Bool)

(assert (=> b!1256957 (=> (not res!837931) (not e!714676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81657 (_ BitVec 32)) Bool)

(assert (=> b!1256957 (= res!837931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105504 res!837930) b!1256952))

(assert (= (and b!1256952 res!837929) b!1256957))

(assert (= (and b!1256957 res!837931) b!1256955))

(assert (= (and b!1256955 res!837932) b!1256956))

(assert (= (and b!1256956 (not res!837928)) b!1256950))

(assert (= (and b!1256950 (not res!837927)) b!1256949))

(assert (= (and b!1256953 condMapEmpty!49858) mapIsEmpty!49858))

(assert (= (and b!1256953 (not condMapEmpty!49858)) mapNonEmpty!49858))

(get-info :version)

(assert (= (and mapNonEmpty!49858 ((_ is ValueCellFull!15260) mapValue!49858)) b!1256954))

(assert (= (and b!1256953 ((_ is ValueCellFull!15260) mapDefault!49858)) b!1256951))

(assert (= start!105504 b!1256953))

(declare-fun m!1157137 () Bool)

(assert (=> b!1256955 m!1157137))

(declare-fun m!1157139 () Bool)

(assert (=> b!1256957 m!1157139))

(declare-fun m!1157141 () Bool)

(assert (=> b!1256950 m!1157141))

(declare-fun m!1157143 () Bool)

(assert (=> b!1256950 m!1157143))

(declare-fun m!1157145 () Bool)

(assert (=> b!1256949 m!1157145))

(declare-fun m!1157147 () Bool)

(assert (=> b!1256949 m!1157147))

(declare-fun m!1157149 () Bool)

(assert (=> mapNonEmpty!49858 m!1157149))

(declare-fun m!1157151 () Bool)

(assert (=> start!105504 m!1157151))

(declare-fun m!1157153 () Bool)

(assert (=> start!105504 m!1157153))

(declare-fun m!1157155 () Bool)

(assert (=> start!105504 m!1157155))

(declare-fun m!1157157 () Bool)

(assert (=> b!1256956 m!1157157))

(declare-fun m!1157159 () Bool)

(assert (=> b!1256956 m!1157159))

(declare-fun m!1157161 () Bool)

(assert (=> b!1256956 m!1157161))

(check-sat (not start!105504) (not b!1256950) (not b!1256949) (not mapNonEmpty!49858) (not b!1256955) (not b_next!27145) b_and!44983 (not b!1256956) tp_is_empty!32047 (not b!1256957))
(check-sat b_and!44983 (not b_next!27145))
