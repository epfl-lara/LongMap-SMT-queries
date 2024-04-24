; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105720 () Bool)

(assert start!105720)

(declare-fun b_free!27133 () Bool)

(declare-fun b_next!27133 () Bool)

(assert (=> start!105720 (= b_free!27133 (not b_next!27133))))

(declare-fun tp!94916 () Bool)

(declare-fun b_and!44991 () Bool)

(assert (=> start!105720 (= tp!94916 b_and!44991)))

(declare-fun b!1258174 () Bool)

(declare-fun e!715439 () Bool)

(declare-fun tp_is_empty!32035 () Bool)

(assert (=> b!1258174 (= e!715439 tp_is_empty!32035)))

(declare-fun b!1258175 () Bool)

(declare-fun e!715440 () Bool)

(declare-fun e!715442 () Bool)

(declare-fun mapRes!49840 () Bool)

(assert (=> b!1258175 (= e!715440 (and e!715442 mapRes!49840))))

(declare-fun condMapEmpty!49840 () Bool)

(declare-datatypes ((V!48079 0))(
  ( (V!48080 (val!16080 Int)) )
))
(declare-datatypes ((ValueCell!15254 0))(
  ( (ValueCellFull!15254 (v!18777 V!48079)) (EmptyCell!15254) )
))
(declare-datatypes ((array!81755 0))(
  ( (array!81756 (arr!39431 (Array (_ BitVec 32) ValueCell!15254)) (size!39968 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81755)

(declare-fun mapDefault!49840 () ValueCell!15254)

(assert (=> b!1258175 (= condMapEmpty!49840 (= (arr!39431 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15254)) mapDefault!49840)))))

(declare-fun mapIsEmpty!49840 () Bool)

(assert (=> mapIsEmpty!49840 mapRes!49840))

(declare-fun b!1258176 () Bool)

(declare-fun e!715444 () Bool)

(declare-fun e!715443 () Bool)

(assert (=> b!1258176 (= e!715444 e!715443)))

(declare-fun res!838379 () Bool)

(assert (=> b!1258176 (=> res!838379 e!715443)))

(declare-datatypes ((tuple2!20798 0))(
  ( (tuple2!20799 (_1!10410 (_ BitVec 64)) (_2!10410 V!48079)) )
))
(declare-datatypes ((List!28028 0))(
  ( (Nil!28025) (Cons!28024 (h!29242 tuple2!20798) (t!41509 List!28028)) )
))
(declare-datatypes ((ListLongMap!18679 0))(
  ( (ListLongMap!18680 (toList!9355 List!28028)) )
))
(declare-fun lt!568877 () ListLongMap!18679)

(declare-fun contains!7584 (ListLongMap!18679 (_ BitVec 64)) Bool)

(assert (=> b!1258176 (= res!838379 (contains!7584 lt!568877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48079)

(declare-datatypes ((array!81757 0))(
  ( (array!81758 (arr!39432 (Array (_ BitVec 32) (_ BitVec 64))) (size!39969 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81757)

(declare-fun minValueBefore!43 () V!48079)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun getCurrentListMap!4561 (array!81757 array!81755 (_ BitVec 32) (_ BitVec 32) V!48079 V!48079 (_ BitVec 32) Int) ListLongMap!18679)

(assert (=> b!1258176 (= lt!568877 (getCurrentListMap!4561 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258177 () Bool)

(assert (=> b!1258177 (= e!715442 tp_is_empty!32035)))

(declare-fun mapNonEmpty!49840 () Bool)

(declare-fun tp!94915 () Bool)

(assert (=> mapNonEmpty!49840 (= mapRes!49840 (and tp!94915 e!715439))))

(declare-fun mapValue!49840 () ValueCell!15254)

(declare-fun mapKey!49840 () (_ BitVec 32))

(declare-fun mapRest!49840 () (Array (_ BitVec 32) ValueCell!15254))

(assert (=> mapNonEmpty!49840 (= (arr!39431 _values!914) (store mapRest!49840 mapKey!49840 mapValue!49840))))

(declare-fun b!1258178 () Bool)

(declare-fun res!838382 () Bool)

(declare-fun e!715438 () Bool)

(assert (=> b!1258178 (=> (not res!838382) (not e!715438))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258178 (= res!838382 (and (= (size!39968 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39969 _keys!1118) (size!39968 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258180 () Bool)

(declare-fun res!838383 () Bool)

(assert (=> b!1258180 (=> (not res!838383) (not e!715438))))

(declare-datatypes ((List!28029 0))(
  ( (Nil!28026) (Cons!28025 (h!29243 (_ BitVec 64)) (t!41510 List!28029)) )
))
(declare-fun arrayNoDuplicates!0 (array!81757 (_ BitVec 32) List!28029) Bool)

(assert (=> b!1258180 (= res!838383 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28026))))

(declare-fun b!1258181 () Bool)

(declare-fun res!838380 () Bool)

(assert (=> b!1258181 (=> (not res!838380) (not e!715438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81757 (_ BitVec 32)) Bool)

(assert (=> b!1258181 (= res!838380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258182 () Bool)

(assert (=> b!1258182 (= e!715438 (not e!715444))))

(declare-fun res!838384 () Bool)

(assert (=> b!1258182 (=> res!838384 e!715444)))

(assert (=> b!1258182 (= res!838384 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568878 () ListLongMap!18679)

(declare-fun lt!568880 () ListLongMap!18679)

(assert (=> b!1258182 (= lt!568878 lt!568880)))

(declare-fun minValueAfter!43 () V!48079)

(declare-datatypes ((Unit!41851 0))(
  ( (Unit!41852) )
))
(declare-fun lt!568881 () Unit!41851)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1086 (array!81757 array!81755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48079 V!48079 V!48079 V!48079 (_ BitVec 32) Int) Unit!41851)

(assert (=> b!1258182 (= lt!568881 (lemmaNoChangeToArrayThenSameMapNoExtras!1086 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5772 (array!81757 array!81755 (_ BitVec 32) (_ BitVec 32) V!48079 V!48079 (_ BitVec 32) Int) ListLongMap!18679)

(assert (=> b!1258182 (= lt!568880 (getCurrentListMapNoExtraKeys!5772 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258182 (= lt!568878 (getCurrentListMapNoExtraKeys!5772 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258179 () Bool)

(assert (=> b!1258179 (= e!715443 true)))

(declare-fun -!2069 (ListLongMap!18679 (_ BitVec 64)) ListLongMap!18679)

(assert (=> b!1258179 (= (-!2069 lt!568877 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568877)))

(declare-fun lt!568879 () Unit!41851)

(declare-fun removeNotPresentStillSame!141 (ListLongMap!18679 (_ BitVec 64)) Unit!41851)

(assert (=> b!1258179 (= lt!568879 (removeNotPresentStillSame!141 lt!568877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!838381 () Bool)

(assert (=> start!105720 (=> (not res!838381) (not e!715438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105720 (= res!838381 (validMask!0 mask!1466))))

(assert (=> start!105720 e!715438))

(assert (=> start!105720 true))

(assert (=> start!105720 tp!94916))

(assert (=> start!105720 tp_is_empty!32035))

(declare-fun array_inv!30173 (array!81757) Bool)

(assert (=> start!105720 (array_inv!30173 _keys!1118)))

(declare-fun array_inv!30174 (array!81755) Bool)

(assert (=> start!105720 (and (array_inv!30174 _values!914) e!715440)))

(assert (= (and start!105720 res!838381) b!1258178))

(assert (= (and b!1258178 res!838382) b!1258181))

(assert (= (and b!1258181 res!838380) b!1258180))

(assert (= (and b!1258180 res!838383) b!1258182))

(assert (= (and b!1258182 (not res!838384)) b!1258176))

(assert (= (and b!1258176 (not res!838379)) b!1258179))

(assert (= (and b!1258175 condMapEmpty!49840) mapIsEmpty!49840))

(assert (= (and b!1258175 (not condMapEmpty!49840)) mapNonEmpty!49840))

(get-info :version)

(assert (= (and mapNonEmpty!49840 ((_ is ValueCellFull!15254) mapValue!49840)) b!1258174))

(assert (= (and b!1258175 ((_ is ValueCellFull!15254) mapDefault!49840)) b!1258177))

(assert (= start!105720 b!1258175))

(declare-fun m!1159113 () Bool)

(assert (=> b!1258176 m!1159113))

(declare-fun m!1159115 () Bool)

(assert (=> b!1258176 m!1159115))

(declare-fun m!1159117 () Bool)

(assert (=> b!1258181 m!1159117))

(declare-fun m!1159119 () Bool)

(assert (=> b!1258180 m!1159119))

(declare-fun m!1159121 () Bool)

(assert (=> start!105720 m!1159121))

(declare-fun m!1159123 () Bool)

(assert (=> start!105720 m!1159123))

(declare-fun m!1159125 () Bool)

(assert (=> start!105720 m!1159125))

(declare-fun m!1159127 () Bool)

(assert (=> b!1258182 m!1159127))

(declare-fun m!1159129 () Bool)

(assert (=> b!1258182 m!1159129))

(declare-fun m!1159131 () Bool)

(assert (=> b!1258182 m!1159131))

(declare-fun m!1159133 () Bool)

(assert (=> mapNonEmpty!49840 m!1159133))

(declare-fun m!1159135 () Bool)

(assert (=> b!1258179 m!1159135))

(declare-fun m!1159137 () Bool)

(assert (=> b!1258179 m!1159137))

(check-sat b_and!44991 (not mapNonEmpty!49840) (not b!1258181) (not b!1258180) tp_is_empty!32035 (not b!1258182) (not b!1258179) (not b!1258176) (not start!105720) (not b_next!27133))
(check-sat b_and!44991 (not b_next!27133))
