; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105624 () Bool)

(assert start!105624)

(declare-fun b_free!27229 () Bool)

(declare-fun b_next!27229 () Bool)

(assert (=> start!105624 (= b_free!27229 (not b_next!27229))))

(declare-fun tp!95209 () Bool)

(declare-fun b_and!45085 () Bool)

(assert (=> start!105624 (= tp!95209 b_and!45085)))

(declare-fun b!1258143 () Bool)

(declare-fun res!838595 () Bool)

(declare-fun e!715528 () Bool)

(assert (=> b!1258143 (=> (not res!838595) (not e!715528))))

(declare-datatypes ((array!81813 0))(
  ( (array!81814 (arr!39463 (Array (_ BitVec 32) (_ BitVec 64))) (size!40001 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81813)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81813 (_ BitVec 32)) Bool)

(assert (=> b!1258143 (= res!838595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258144 () Bool)

(declare-fun e!715532 () Bool)

(assert (=> b!1258144 (= e!715532 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48207 0))(
  ( (V!48208 (val!16128 Int)) )
))
(declare-fun zeroValue!871 () V!48207)

(declare-fun minValueBefore!43 () V!48207)

(declare-datatypes ((tuple2!20918 0))(
  ( (tuple2!20919 (_1!10470 (_ BitVec 64)) (_2!10470 V!48207)) )
))
(declare-datatypes ((List!28126 0))(
  ( (Nil!28123) (Cons!28122 (h!29331 tuple2!20918) (t!41610 List!28126)) )
))
(declare-datatypes ((ListLongMap!18791 0))(
  ( (ListLongMap!18792 (toList!9411 List!28126)) )
))
(declare-fun lt!568916 () ListLongMap!18791)

(declare-datatypes ((ValueCell!15302 0))(
  ( (ValueCellFull!15302 (v!18829 V!48207)) (EmptyCell!15302) )
))
(declare-datatypes ((array!81815 0))(
  ( (array!81816 (arr!39464 (Array (_ BitVec 32) ValueCell!15302)) (size!40002 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81815)

(declare-fun getCurrentListMap!4502 (array!81813 array!81815 (_ BitVec 32) (_ BitVec 32) V!48207 V!48207 (_ BitVec 32) Int) ListLongMap!18791)

(assert (=> b!1258144 (= lt!568916 (getCurrentListMap!4502 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258145 () Bool)

(assert (=> b!1258145 (= e!715528 (not e!715532))))

(declare-fun res!838594 () Bool)

(assert (=> b!1258145 (=> res!838594 e!715532)))

(assert (=> b!1258145 (= res!838594 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!568918 () ListLongMap!18791)

(declare-fun lt!568917 () ListLongMap!18791)

(assert (=> b!1258145 (= lt!568918 lt!568917)))

(declare-datatypes ((Unit!41779 0))(
  ( (Unit!41780) )
))
(declare-fun lt!568919 () Unit!41779)

(declare-fun minValueAfter!43 () V!48207)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1114 (array!81813 array!81815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48207 V!48207 V!48207 V!48207 (_ BitVec 32) Int) Unit!41779)

(assert (=> b!1258145 (= lt!568919 (lemmaNoChangeToArrayThenSameMapNoExtras!1114 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5792 (array!81813 array!81815 (_ BitVec 32) (_ BitVec 32) V!48207 V!48207 (_ BitVec 32) Int) ListLongMap!18791)

(assert (=> b!1258145 (= lt!568917 (getCurrentListMapNoExtraKeys!5792 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258145 (= lt!568918 (getCurrentListMapNoExtraKeys!5792 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258146 () Bool)

(declare-fun e!715527 () Bool)

(declare-fun tp_is_empty!32131 () Bool)

(assert (=> b!1258146 (= e!715527 tp_is_empty!32131)))

(declare-fun b!1258147 () Bool)

(declare-fun res!838597 () Bool)

(assert (=> b!1258147 (=> (not res!838597) (not e!715528))))

(assert (=> b!1258147 (= res!838597 (and (= (size!40002 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40001 _keys!1118) (size!40002 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!838593 () Bool)

(assert (=> start!105624 (=> (not res!838593) (not e!715528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105624 (= res!838593 (validMask!0 mask!1466))))

(assert (=> start!105624 e!715528))

(assert (=> start!105624 true))

(assert (=> start!105624 tp!95209))

(assert (=> start!105624 tp_is_empty!32131))

(declare-fun array_inv!30191 (array!81813) Bool)

(assert (=> start!105624 (array_inv!30191 _keys!1118)))

(declare-fun e!715530 () Bool)

(declare-fun array_inv!30192 (array!81815) Bool)

(assert (=> start!105624 (and (array_inv!30192 _values!914) e!715530)))

(declare-fun b!1258148 () Bool)

(declare-fun mapRes!49990 () Bool)

(assert (=> b!1258148 (= e!715530 (and e!715527 mapRes!49990))))

(declare-fun condMapEmpty!49990 () Bool)

(declare-fun mapDefault!49990 () ValueCell!15302)

(assert (=> b!1258148 (= condMapEmpty!49990 (= (arr!39464 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15302)) mapDefault!49990)))))

(declare-fun b!1258149 () Bool)

(declare-fun e!715531 () Bool)

(assert (=> b!1258149 (= e!715531 tp_is_empty!32131)))

(declare-fun mapIsEmpty!49990 () Bool)

(assert (=> mapIsEmpty!49990 mapRes!49990))

(declare-fun mapNonEmpty!49990 () Bool)

(declare-fun tp!95210 () Bool)

(assert (=> mapNonEmpty!49990 (= mapRes!49990 (and tp!95210 e!715531))))

(declare-fun mapKey!49990 () (_ BitVec 32))

(declare-fun mapRest!49990 () (Array (_ BitVec 32) ValueCell!15302))

(declare-fun mapValue!49990 () ValueCell!15302)

(assert (=> mapNonEmpty!49990 (= (arr!39464 _values!914) (store mapRest!49990 mapKey!49990 mapValue!49990))))

(declare-fun b!1258150 () Bool)

(declare-fun res!838596 () Bool)

(assert (=> b!1258150 (=> (not res!838596) (not e!715528))))

(declare-datatypes ((List!28127 0))(
  ( (Nil!28124) (Cons!28123 (h!29332 (_ BitVec 64)) (t!41611 List!28127)) )
))
(declare-fun arrayNoDuplicates!0 (array!81813 (_ BitVec 32) List!28127) Bool)

(assert (=> b!1258150 (= res!838596 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28124))))

(assert (= (and start!105624 res!838593) b!1258147))

(assert (= (and b!1258147 res!838597) b!1258143))

(assert (= (and b!1258143 res!838595) b!1258150))

(assert (= (and b!1258150 res!838596) b!1258145))

(assert (= (and b!1258145 (not res!838594)) b!1258144))

(assert (= (and b!1258148 condMapEmpty!49990) mapIsEmpty!49990))

(assert (= (and b!1258148 (not condMapEmpty!49990)) mapNonEmpty!49990))

(get-info :version)

(assert (= (and mapNonEmpty!49990 ((_ is ValueCellFull!15302) mapValue!49990)) b!1258149))

(assert (= (and b!1258148 ((_ is ValueCellFull!15302) mapDefault!49990)) b!1258146))

(assert (= start!105624 b!1258148))

(declare-fun m!1158169 () Bool)

(assert (=> b!1258143 m!1158169))

(declare-fun m!1158171 () Bool)

(assert (=> mapNonEmpty!49990 m!1158171))

(declare-fun m!1158173 () Bool)

(assert (=> b!1258150 m!1158173))

(declare-fun m!1158175 () Bool)

(assert (=> start!105624 m!1158175))

(declare-fun m!1158177 () Bool)

(assert (=> start!105624 m!1158177))

(declare-fun m!1158179 () Bool)

(assert (=> start!105624 m!1158179))

(declare-fun m!1158181 () Bool)

(assert (=> b!1258144 m!1158181))

(declare-fun m!1158183 () Bool)

(assert (=> b!1258145 m!1158183))

(declare-fun m!1158185 () Bool)

(assert (=> b!1258145 m!1158185))

(declare-fun m!1158187 () Bool)

(assert (=> b!1258145 m!1158187))

(check-sat (not b!1258144) (not mapNonEmpty!49990) tp_is_empty!32131 b_and!45085 (not b!1258150) (not start!105624) (not b!1258143) (not b_next!27229) (not b!1258145))
(check-sat b_and!45085 (not b_next!27229))
