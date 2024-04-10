; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106194 () Bool)

(assert start!106194)

(declare-fun b_free!27531 () Bool)

(declare-fun b_next!27531 () Bool)

(assert (=> start!106194 (= b_free!27531 (not b_next!27531))))

(declare-fun tp!96158 () Bool)

(declare-fun b_and!45563 () Bool)

(assert (=> start!106194 (= tp!96158 b_and!45563)))

(declare-fun b!1264346 () Bool)

(declare-fun e!719928 () Bool)

(declare-fun e!719924 () Bool)

(declare-fun mapRes!50485 () Bool)

(assert (=> b!1264346 (= e!719928 (and e!719924 mapRes!50485))))

(declare-fun condMapEmpty!50485 () Bool)

(declare-datatypes ((V!48609 0))(
  ( (V!48610 (val!16279 Int)) )
))
(declare-datatypes ((ValueCell!15453 0))(
  ( (ValueCellFull!15453 (v!18993 V!48609)) (EmptyCell!15453) )
))
(declare-datatypes ((array!82494 0))(
  ( (array!82495 (arr!39789 (Array (_ BitVec 32) ValueCell!15453)) (size!40325 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82494)

(declare-fun mapDefault!50485 () ValueCell!15453)

(assert (=> b!1264346 (= condMapEmpty!50485 (= (arr!39789 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15453)) mapDefault!50485)))))

(declare-fun b!1264347 () Bool)

(declare-fun res!842019 () Bool)

(declare-fun e!719927 () Bool)

(assert (=> b!1264347 (=> (not res!842019) (not e!719927))))

(declare-datatypes ((array!82496 0))(
  ( (array!82497 (arr!39790 (Array (_ BitVec 32) (_ BitVec 64))) (size!40326 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82496)

(declare-datatypes ((List!28268 0))(
  ( (Nil!28265) (Cons!28264 (h!29473 (_ BitVec 64)) (t!41789 List!28268)) )
))
(declare-fun arrayNoDuplicates!0 (array!82496 (_ BitVec 32) List!28268) Bool)

(assert (=> b!1264347 (= res!842019 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28265))))

(declare-fun b!1264348 () Bool)

(declare-fun e!719930 () Bool)

(declare-datatypes ((tuple2!21078 0))(
  ( (tuple2!21079 (_1!10550 (_ BitVec 64)) (_2!10550 V!48609)) )
))
(declare-datatypes ((List!28269 0))(
  ( (Nil!28266) (Cons!28265 (h!29474 tuple2!21078) (t!41790 List!28269)) )
))
(declare-datatypes ((ListLongMap!18951 0))(
  ( (ListLongMap!18952 (toList!9491 List!28269)) )
))
(declare-fun lt!573682 () ListLongMap!18951)

(declare-fun lt!573684 () ListLongMap!18951)

(declare-fun -!2149 (ListLongMap!18951 (_ BitVec 64)) ListLongMap!18951)

(assert (=> b!1264348 (= e!719930 (= (-!2149 lt!573682 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573684))))

(declare-fun lt!573683 () ListLongMap!18951)

(declare-fun lt!573679 () ListLongMap!18951)

(assert (=> b!1264348 (= (-!2149 lt!573683 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573679)))

(declare-datatypes ((Unit!42137 0))(
  ( (Unit!42138) )
))
(declare-fun lt!573687 () Unit!42137)

(declare-fun minValueBefore!43 () V!48609)

(declare-fun addThenRemoveForNewKeyIsSame!381 (ListLongMap!18951 (_ BitVec 64) V!48609) Unit!42137)

(assert (=> b!1264348 (= lt!573687 (addThenRemoveForNewKeyIsSame!381 lt!573679 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!719926 () Bool)

(assert (=> b!1264348 e!719926))

(declare-fun res!842017 () Bool)

(assert (=> b!1264348 (=> (not res!842017) (not e!719926))))

(assert (=> b!1264348 (= res!842017 (= lt!573682 lt!573683))))

(declare-fun +!4261 (ListLongMap!18951 tuple2!21078) ListLongMap!18951)

(assert (=> b!1264348 (= lt!573683 (+!4261 lt!573679 (tuple2!21079 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!573686 () ListLongMap!18951)

(declare-fun lt!573681 () tuple2!21078)

(assert (=> b!1264348 (= lt!573679 (+!4261 lt!573686 lt!573681))))

(declare-fun zeroValue!871 () V!48609)

(assert (=> b!1264348 (= lt!573681 (tuple2!21079 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!48609)

(declare-fun getCurrentListMap!4658 (array!82496 array!82494 (_ BitVec 32) (_ BitVec 32) V!48609 V!48609 (_ BitVec 32) Int) ListLongMap!18951)

(assert (=> b!1264348 (= lt!573684 (getCurrentListMap!4658 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264348 (= lt!573682 (getCurrentListMap!4658 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264349 () Bool)

(declare-fun e!719925 () Bool)

(declare-fun tp_is_empty!32433 () Bool)

(assert (=> b!1264349 (= e!719925 tp_is_empty!32433)))

(declare-fun b!1264350 () Bool)

(assert (=> b!1264350 (= e!719924 tp_is_empty!32433)))

(declare-fun b!1264351 () Bool)

(declare-fun res!842018 () Bool)

(assert (=> b!1264351 (=> (not res!842018) (not e!719927))))

(assert (=> b!1264351 (= res!842018 (and (= (size!40325 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40326 _keys!1118) (size!40325 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!842015 () Bool)

(assert (=> start!106194 (=> (not res!842015) (not e!719927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106194 (= res!842015 (validMask!0 mask!1466))))

(assert (=> start!106194 e!719927))

(assert (=> start!106194 true))

(assert (=> start!106194 tp!96158))

(assert (=> start!106194 tp_is_empty!32433))

(declare-fun array_inv!30281 (array!82496) Bool)

(assert (=> start!106194 (array_inv!30281 _keys!1118)))

(declare-fun array_inv!30282 (array!82494) Bool)

(assert (=> start!106194 (and (array_inv!30282 _values!914) e!719928)))

(declare-fun mapNonEmpty!50485 () Bool)

(declare-fun tp!96157 () Bool)

(assert (=> mapNonEmpty!50485 (= mapRes!50485 (and tp!96157 e!719925))))

(declare-fun mapRest!50485 () (Array (_ BitVec 32) ValueCell!15453))

(declare-fun mapValue!50485 () ValueCell!15453)

(declare-fun mapKey!50485 () (_ BitVec 32))

(assert (=> mapNonEmpty!50485 (= (arr!39789 _values!914) (store mapRest!50485 mapKey!50485 mapValue!50485))))

(declare-fun lt!573685 () ListLongMap!18951)

(declare-fun b!1264352 () Bool)

(assert (=> b!1264352 (= e!719926 (= lt!573684 (+!4261 lt!573685 lt!573681)))))

(declare-fun b!1264353 () Bool)

(declare-fun res!842016 () Bool)

(assert (=> b!1264353 (=> (not res!842016) (not e!719927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82496 (_ BitVec 32)) Bool)

(assert (=> b!1264353 (= res!842016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1264354 () Bool)

(assert (=> b!1264354 (= e!719927 (not e!719930))))

(declare-fun res!842020 () Bool)

(assert (=> b!1264354 (=> res!842020 e!719930)))

(assert (=> b!1264354 (= res!842020 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1264354 (= lt!573686 lt!573685)))

(declare-fun lt!573680 () Unit!42137)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1195 (array!82496 array!82494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48609 V!48609 V!48609 V!48609 (_ BitVec 32) Int) Unit!42137)

(assert (=> b!1264354 (= lt!573680 (lemmaNoChangeToArrayThenSameMapNoExtras!1195 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5853 (array!82496 array!82494 (_ BitVec 32) (_ BitVec 32) V!48609 V!48609 (_ BitVec 32) Int) ListLongMap!18951)

(assert (=> b!1264354 (= lt!573685 (getCurrentListMapNoExtraKeys!5853 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264354 (= lt!573686 (getCurrentListMapNoExtraKeys!5853 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50485 () Bool)

(assert (=> mapIsEmpty!50485 mapRes!50485))

(assert (= (and start!106194 res!842015) b!1264351))

(assert (= (and b!1264351 res!842018) b!1264353))

(assert (= (and b!1264353 res!842016) b!1264347))

(assert (= (and b!1264347 res!842019) b!1264354))

(assert (= (and b!1264354 (not res!842020)) b!1264348))

(assert (= (and b!1264348 res!842017) b!1264352))

(assert (= (and b!1264346 condMapEmpty!50485) mapIsEmpty!50485))

(assert (= (and b!1264346 (not condMapEmpty!50485)) mapNonEmpty!50485))

(get-info :version)

(assert (= (and mapNonEmpty!50485 ((_ is ValueCellFull!15453) mapValue!50485)) b!1264349))

(assert (= (and b!1264346 ((_ is ValueCellFull!15453) mapDefault!50485)) b!1264350))

(assert (= start!106194 b!1264346))

(declare-fun m!1164877 () Bool)

(assert (=> b!1264352 m!1164877))

(declare-fun m!1164879 () Bool)

(assert (=> b!1264354 m!1164879))

(declare-fun m!1164881 () Bool)

(assert (=> b!1264354 m!1164881))

(declare-fun m!1164883 () Bool)

(assert (=> b!1264354 m!1164883))

(declare-fun m!1164885 () Bool)

(assert (=> mapNonEmpty!50485 m!1164885))

(declare-fun m!1164887 () Bool)

(assert (=> b!1264353 m!1164887))

(declare-fun m!1164889 () Bool)

(assert (=> b!1264348 m!1164889))

(declare-fun m!1164891 () Bool)

(assert (=> b!1264348 m!1164891))

(declare-fun m!1164893 () Bool)

(assert (=> b!1264348 m!1164893))

(declare-fun m!1164895 () Bool)

(assert (=> b!1264348 m!1164895))

(declare-fun m!1164897 () Bool)

(assert (=> b!1264348 m!1164897))

(declare-fun m!1164899 () Bool)

(assert (=> b!1264348 m!1164899))

(declare-fun m!1164901 () Bool)

(assert (=> b!1264348 m!1164901))

(declare-fun m!1164903 () Bool)

(assert (=> b!1264347 m!1164903))

(declare-fun m!1164905 () Bool)

(assert (=> start!106194 m!1164905))

(declare-fun m!1164907 () Bool)

(assert (=> start!106194 m!1164907))

(declare-fun m!1164909 () Bool)

(assert (=> start!106194 m!1164909))

(check-sat b_and!45563 (not b!1264353) (not b!1264352) (not b!1264347) (not b!1264348) (not b_next!27531) (not mapNonEmpty!50485) (not start!106194) tp_is_empty!32433 (not b!1264354))
(check-sat b_and!45563 (not b_next!27531))
