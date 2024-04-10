; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105562 () Bool)

(assert start!105562)

(declare-fun b_free!27177 () Bool)

(declare-fun b_next!27177 () Bool)

(assert (=> start!105562 (= b_free!27177 (not b_next!27177))))

(declare-fun tp!95050 () Bool)

(declare-fun b_and!45043 () Bool)

(assert (=> start!105562 (= tp!95050 b_and!45043)))

(declare-fun b!1257574 () Bool)

(declare-fun res!838273 () Bool)

(declare-fun e!715109 () Bool)

(assert (=> b!1257574 (=> (not res!838273) (not e!715109))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81792 0))(
  ( (array!81793 (arr!39453 (Array (_ BitVec 32) (_ BitVec 64))) (size!39989 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81792)

(declare-datatypes ((V!48137 0))(
  ( (V!48138 (val!16102 Int)) )
))
(declare-datatypes ((ValueCell!15276 0))(
  ( (ValueCellFull!15276 (v!18804 V!48137)) (EmptyCell!15276) )
))
(declare-datatypes ((array!81794 0))(
  ( (array!81795 (arr!39454 (Array (_ BitVec 32) ValueCell!15276)) (size!39990 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81794)

(assert (=> b!1257574 (= res!838273 (and (= (size!39990 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39989 _keys!1118) (size!39990 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257575 () Bool)

(declare-fun e!715108 () Bool)

(declare-fun tp_is_empty!32079 () Bool)

(assert (=> b!1257575 (= e!715108 tp_is_empty!32079)))

(declare-fun b!1257576 () Bool)

(declare-fun e!715110 () Bool)

(assert (=> b!1257576 (= e!715110 tp_is_empty!32079)))

(declare-fun res!838272 () Bool)

(assert (=> start!105562 (=> (not res!838272) (not e!715109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105562 (= res!838272 (validMask!0 mask!1466))))

(assert (=> start!105562 e!715109))

(assert (=> start!105562 true))

(assert (=> start!105562 tp!95050))

(assert (=> start!105562 tp_is_empty!32079))

(declare-fun array_inv!30051 (array!81792) Bool)

(assert (=> start!105562 (array_inv!30051 _keys!1118)))

(declare-fun e!715107 () Bool)

(declare-fun array_inv!30052 (array!81794) Bool)

(assert (=> start!105562 (and (array_inv!30052 _values!914) e!715107)))

(declare-fun mapNonEmpty!49909 () Bool)

(declare-fun mapRes!49909 () Bool)

(declare-fun tp!95051 () Bool)

(assert (=> mapNonEmpty!49909 (= mapRes!49909 (and tp!95051 e!715108))))

(declare-fun mapValue!49909 () ValueCell!15276)

(declare-fun mapRest!49909 () (Array (_ BitVec 32) ValueCell!15276))

(declare-fun mapKey!49909 () (_ BitVec 32))

(assert (=> mapNonEmpty!49909 (= (arr!39454 _values!914) (store mapRest!49909 mapKey!49909 mapValue!49909))))

(declare-fun b!1257577 () Bool)

(assert (=> b!1257577 (= e!715109 (not true))))

(declare-datatypes ((tuple2!20804 0))(
  ( (tuple2!20805 (_1!10413 (_ BitVec 64)) (_2!10413 V!48137)) )
))
(declare-datatypes ((List!28019 0))(
  ( (Nil!28016) (Cons!28015 (h!29224 tuple2!20804) (t!41510 List!28019)) )
))
(declare-datatypes ((ListLongMap!18677 0))(
  ( (ListLongMap!18678 (toList!9354 List!28019)) )
))
(declare-fun lt!568802 () ListLongMap!18677)

(declare-fun lt!568803 () ListLongMap!18677)

(assert (=> b!1257577 (= lt!568802 lt!568803)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48137)

(declare-fun zeroValue!871 () V!48137)

(declare-datatypes ((Unit!41892 0))(
  ( (Unit!41893) )
))
(declare-fun lt!568801 () Unit!41892)

(declare-fun minValueBefore!43 () V!48137)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1096 (array!81792 array!81794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48137 V!48137 V!48137 V!48137 (_ BitVec 32) Int) Unit!41892)

(assert (=> b!1257577 (= lt!568801 (lemmaNoChangeToArrayThenSameMapNoExtras!1096 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5732 (array!81792 array!81794 (_ BitVec 32) (_ BitVec 32) V!48137 V!48137 (_ BitVec 32) Int) ListLongMap!18677)

(assert (=> b!1257577 (= lt!568803 (getCurrentListMapNoExtraKeys!5732 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257577 (= lt!568802 (getCurrentListMapNoExtraKeys!5732 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49909 () Bool)

(assert (=> mapIsEmpty!49909 mapRes!49909))

(declare-fun b!1257578 () Bool)

(declare-fun res!838271 () Bool)

(assert (=> b!1257578 (=> (not res!838271) (not e!715109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81792 (_ BitVec 32)) Bool)

(assert (=> b!1257578 (= res!838271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257579 () Bool)

(declare-fun res!838270 () Bool)

(assert (=> b!1257579 (=> (not res!838270) (not e!715109))))

(declare-datatypes ((List!28020 0))(
  ( (Nil!28017) (Cons!28016 (h!29225 (_ BitVec 64)) (t!41511 List!28020)) )
))
(declare-fun arrayNoDuplicates!0 (array!81792 (_ BitVec 32) List!28020) Bool)

(assert (=> b!1257579 (= res!838270 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28017))))

(declare-fun b!1257580 () Bool)

(assert (=> b!1257580 (= e!715107 (and e!715110 mapRes!49909))))

(declare-fun condMapEmpty!49909 () Bool)

(declare-fun mapDefault!49909 () ValueCell!15276)

(assert (=> b!1257580 (= condMapEmpty!49909 (= (arr!39454 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15276)) mapDefault!49909)))))

(assert (= (and start!105562 res!838272) b!1257574))

(assert (= (and b!1257574 res!838273) b!1257578))

(assert (= (and b!1257578 res!838271) b!1257579))

(assert (= (and b!1257579 res!838270) b!1257577))

(assert (= (and b!1257580 condMapEmpty!49909) mapIsEmpty!49909))

(assert (= (and b!1257580 (not condMapEmpty!49909)) mapNonEmpty!49909))

(get-info :version)

(assert (= (and mapNonEmpty!49909 ((_ is ValueCellFull!15276) mapValue!49909)) b!1257575))

(assert (= (and b!1257580 ((_ is ValueCellFull!15276) mapDefault!49909)) b!1257576))

(assert (= start!105562 b!1257580))

(declare-fun m!1158143 () Bool)

(assert (=> b!1257578 m!1158143))

(declare-fun m!1158145 () Bool)

(assert (=> b!1257577 m!1158145))

(declare-fun m!1158147 () Bool)

(assert (=> b!1257577 m!1158147))

(declare-fun m!1158149 () Bool)

(assert (=> b!1257577 m!1158149))

(declare-fun m!1158151 () Bool)

(assert (=> mapNonEmpty!49909 m!1158151))

(declare-fun m!1158153 () Bool)

(assert (=> b!1257579 m!1158153))

(declare-fun m!1158155 () Bool)

(assert (=> start!105562 m!1158155))

(declare-fun m!1158157 () Bool)

(assert (=> start!105562 m!1158157))

(declare-fun m!1158159 () Bool)

(assert (=> start!105562 m!1158159))

(check-sat (not mapNonEmpty!49909) (not b_next!27177) (not b!1257579) (not b!1257577) (not start!105562) tp_is_empty!32079 b_and!45043 (not b!1257578))
(check-sat b_and!45043 (not b_next!27177))
