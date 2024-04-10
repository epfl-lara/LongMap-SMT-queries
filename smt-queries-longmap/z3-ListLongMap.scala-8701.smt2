; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105642 () Bool)

(assert start!105642)

(declare-fun b_free!27243 () Bool)

(declare-fun b_next!27243 () Bool)

(assert (=> start!105642 (= b_free!27243 (not b_next!27243))))

(declare-fun tp!95252 () Bool)

(declare-fun b_and!45117 () Bool)

(assert (=> start!105642 (= tp!95252 b_and!45117)))

(declare-fun b!1258393 () Bool)

(declare-fun e!715698 () Bool)

(declare-fun tp_is_empty!32145 () Bool)

(assert (=> b!1258393 (= e!715698 tp_is_empty!32145)))

(declare-fun b!1258394 () Bool)

(declare-fun res!838738 () Bool)

(declare-fun e!715701 () Bool)

(assert (=> b!1258394 (=> (not res!838738) (not e!715701))))

(declare-datatypes ((array!81912 0))(
  ( (array!81913 (arr!39512 (Array (_ BitVec 32) (_ BitVec 64))) (size!40048 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81912)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81912 (_ BitVec 32)) Bool)

(assert (=> b!1258394 (= res!838738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258395 () Bool)

(declare-fun e!715702 () Bool)

(assert (=> b!1258395 (= e!715702 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48225 0))(
  ( (V!48226 (val!16135 Int)) )
))
(declare-datatypes ((tuple2!20842 0))(
  ( (tuple2!20843 (_1!10432 (_ BitVec 64)) (_2!10432 V!48225)) )
))
(declare-datatypes ((List!28057 0))(
  ( (Nil!28054) (Cons!28053 (h!29262 tuple2!20842) (t!41550 List!28057)) )
))
(declare-datatypes ((ListLongMap!18715 0))(
  ( (ListLongMap!18716 (toList!9373 List!28057)) )
))
(declare-fun lt!569182 () ListLongMap!18715)

(declare-fun zeroValue!871 () V!48225)

(declare-datatypes ((ValueCell!15309 0))(
  ( (ValueCellFull!15309 (v!18837 V!48225)) (EmptyCell!15309) )
))
(declare-datatypes ((array!81914 0))(
  ( (array!81915 (arr!39513 (Array (_ BitVec 32) ValueCell!15309)) (size!40049 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81914)

(declare-fun minValueBefore!43 () V!48225)

(declare-fun getCurrentListMap!4578 (array!81912 array!81914 (_ BitVec 32) (_ BitVec 32) V!48225 V!48225 (_ BitVec 32) Int) ListLongMap!18715)

(assert (=> b!1258395 (= lt!569182 (getCurrentListMap!4578 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258396 () Bool)

(assert (=> b!1258396 (= e!715701 (not e!715702))))

(declare-fun res!838741 () Bool)

(assert (=> b!1258396 (=> res!838741 e!715702)))

(assert (=> b!1258396 (= res!838741 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569181 () ListLongMap!18715)

(declare-fun lt!569180 () ListLongMap!18715)

(assert (=> b!1258396 (= lt!569181 lt!569180)))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41928 0))(
  ( (Unit!41929) )
))
(declare-fun lt!569179 () Unit!41928)

(declare-fun minValueAfter!43 () V!48225)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1114 (array!81912 array!81914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48225 V!48225 V!48225 V!48225 (_ BitVec 32) Int) Unit!41928)

(assert (=> b!1258396 (= lt!569179 (lemmaNoChangeToArrayThenSameMapNoExtras!1114 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5750 (array!81912 array!81914 (_ BitVec 32) (_ BitVec 32) V!48225 V!48225 (_ BitVec 32) Int) ListLongMap!18715)

(assert (=> b!1258396 (= lt!569180 (getCurrentListMapNoExtraKeys!5750 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258396 (= lt!569181 (getCurrentListMapNoExtraKeys!5750 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258397 () Bool)

(declare-fun e!715700 () Bool)

(declare-fun e!715703 () Bool)

(declare-fun mapRes!50011 () Bool)

(assert (=> b!1258397 (= e!715700 (and e!715703 mapRes!50011))))

(declare-fun condMapEmpty!50011 () Bool)

(declare-fun mapDefault!50011 () ValueCell!15309)

(assert (=> b!1258397 (= condMapEmpty!50011 (= (arr!39513 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15309)) mapDefault!50011)))))

(declare-fun res!838742 () Bool)

(assert (=> start!105642 (=> (not res!838742) (not e!715701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105642 (= res!838742 (validMask!0 mask!1466))))

(assert (=> start!105642 e!715701))

(assert (=> start!105642 true))

(assert (=> start!105642 tp!95252))

(assert (=> start!105642 tp_is_empty!32145))

(declare-fun array_inv!30093 (array!81912) Bool)

(assert (=> start!105642 (array_inv!30093 _keys!1118)))

(declare-fun array_inv!30094 (array!81914) Bool)

(assert (=> start!105642 (and (array_inv!30094 _values!914) e!715700)))

(declare-fun b!1258398 () Bool)

(declare-fun res!838739 () Bool)

(assert (=> b!1258398 (=> (not res!838739) (not e!715701))))

(declare-datatypes ((List!28058 0))(
  ( (Nil!28055) (Cons!28054 (h!29263 (_ BitVec 64)) (t!41551 List!28058)) )
))
(declare-fun arrayNoDuplicates!0 (array!81912 (_ BitVec 32) List!28058) Bool)

(assert (=> b!1258398 (= res!838739 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28055))))

(declare-fun b!1258399 () Bool)

(declare-fun res!838740 () Bool)

(assert (=> b!1258399 (=> (not res!838740) (not e!715701))))

(assert (=> b!1258399 (= res!838740 (and (= (size!40049 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40048 _keys!1118) (size!40049 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50011 () Bool)

(assert (=> mapIsEmpty!50011 mapRes!50011))

(declare-fun mapNonEmpty!50011 () Bool)

(declare-fun tp!95251 () Bool)

(assert (=> mapNonEmpty!50011 (= mapRes!50011 (and tp!95251 e!715698))))

(declare-fun mapValue!50011 () ValueCell!15309)

(declare-fun mapRest!50011 () (Array (_ BitVec 32) ValueCell!15309))

(declare-fun mapKey!50011 () (_ BitVec 32))

(assert (=> mapNonEmpty!50011 (= (arr!39513 _values!914) (store mapRest!50011 mapKey!50011 mapValue!50011))))

(declare-fun b!1258400 () Bool)

(assert (=> b!1258400 (= e!715703 tp_is_empty!32145)))

(assert (= (and start!105642 res!838742) b!1258399))

(assert (= (and b!1258399 res!838740) b!1258394))

(assert (= (and b!1258394 res!838738) b!1258398))

(assert (= (and b!1258398 res!838739) b!1258396))

(assert (= (and b!1258396 (not res!838741)) b!1258395))

(assert (= (and b!1258397 condMapEmpty!50011) mapIsEmpty!50011))

(assert (= (and b!1258397 (not condMapEmpty!50011)) mapNonEmpty!50011))

(get-info :version)

(assert (= (and mapNonEmpty!50011 ((_ is ValueCellFull!15309) mapValue!50011)) b!1258393))

(assert (= (and b!1258397 ((_ is ValueCellFull!15309) mapDefault!50011)) b!1258400))

(assert (= start!105642 b!1258397))

(declare-fun m!1158829 () Bool)

(assert (=> b!1258395 m!1158829))

(declare-fun m!1158831 () Bool)

(assert (=> mapNonEmpty!50011 m!1158831))

(declare-fun m!1158833 () Bool)

(assert (=> b!1258394 m!1158833))

(declare-fun m!1158835 () Bool)

(assert (=> b!1258396 m!1158835))

(declare-fun m!1158837 () Bool)

(assert (=> b!1258396 m!1158837))

(declare-fun m!1158839 () Bool)

(assert (=> b!1258396 m!1158839))

(declare-fun m!1158841 () Bool)

(assert (=> start!105642 m!1158841))

(declare-fun m!1158843 () Bool)

(assert (=> start!105642 m!1158843))

(declare-fun m!1158845 () Bool)

(assert (=> start!105642 m!1158845))

(declare-fun m!1158847 () Bool)

(assert (=> b!1258398 m!1158847))

(check-sat b_and!45117 (not b_next!27243) (not mapNonEmpty!50011) (not b!1258394) (not start!105642) (not b!1258398) tp_is_empty!32145 (not b!1258395) (not b!1258396))
(check-sat b_and!45117 (not b_next!27243))
