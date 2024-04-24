; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105778 () Bool)

(assert start!105778)

(declare-fun b_free!27169 () Bool)

(declare-fun b_next!27169 () Bool)

(assert (=> start!105778 (= b_free!27169 (not b_next!27169))))

(declare-fun tp!95027 () Bool)

(declare-fun b_and!45037 () Bool)

(assert (=> start!105778 (= tp!95027 b_and!45037)))

(declare-fun b!1258795 () Bool)

(declare-fun res!838745 () Bool)

(declare-fun e!715895 () Bool)

(assert (=> b!1258795 (=> (not res!838745) (not e!715895))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!81823 0))(
  ( (array!81824 (arr!39464 (Array (_ BitVec 32) (_ BitVec 64))) (size!40001 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81823)

(declare-datatypes ((V!48127 0))(
  ( (V!48128 (val!16098 Int)) )
))
(declare-datatypes ((ValueCell!15272 0))(
  ( (ValueCellFull!15272 (v!18796 V!48127)) (EmptyCell!15272) )
))
(declare-datatypes ((array!81825 0))(
  ( (array!81826 (arr!39465 (Array (_ BitVec 32) ValueCell!15272)) (size!40002 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81825)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258795 (= res!838745 (and (= (size!40002 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40001 _keys!1118) (size!40002 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258796 () Bool)

(assert (=> b!1258796 (= e!715895 (not true))))

(declare-datatypes ((tuple2!20824 0))(
  ( (tuple2!20825 (_1!10423 (_ BitVec 64)) (_2!10423 V!48127)) )
))
(declare-datatypes ((List!28051 0))(
  ( (Nil!28048) (Cons!28047 (h!29265 tuple2!20824) (t!41534 List!28051)) )
))
(declare-datatypes ((ListLongMap!18705 0))(
  ( (ListLongMap!18706 (toList!9368 List!28051)) )
))
(declare-fun lt!569250 () ListLongMap!18705)

(declare-fun lt!569249 () ListLongMap!18705)

(assert (=> b!1258796 (= lt!569250 lt!569249)))

(declare-fun minValueAfter!43 () V!48127)

(declare-fun zeroValue!871 () V!48127)

(declare-fun minValueBefore!43 () V!48127)

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41879 0))(
  ( (Unit!41880) )
))
(declare-fun lt!569251 () Unit!41879)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1098 (array!81823 array!81825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48127 V!48127 V!48127 V!48127 (_ BitVec 32) Int) Unit!41879)

(assert (=> b!1258796 (= lt!569251 (lemmaNoChangeToArrayThenSameMapNoExtras!1098 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5784 (array!81823 array!81825 (_ BitVec 32) (_ BitVec 32) V!48127 V!48127 (_ BitVec 32) Int) ListLongMap!18705)

(assert (=> b!1258796 (= lt!569249 (getCurrentListMapNoExtraKeys!5784 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258796 (= lt!569250 (getCurrentListMapNoExtraKeys!5784 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258797 () Bool)

(declare-fun e!715894 () Bool)

(declare-fun tp_is_empty!32071 () Bool)

(assert (=> b!1258797 (= e!715894 tp_is_empty!32071)))

(declare-fun mapNonEmpty!49897 () Bool)

(declare-fun mapRes!49897 () Bool)

(declare-fun tp!95026 () Bool)

(declare-fun e!715896 () Bool)

(assert (=> mapNonEmpty!49897 (= mapRes!49897 (and tp!95026 e!715896))))

(declare-fun mapValue!49897 () ValueCell!15272)

(declare-fun mapKey!49897 () (_ BitVec 32))

(declare-fun mapRest!49897 () (Array (_ BitVec 32) ValueCell!15272))

(assert (=> mapNonEmpty!49897 (= (arr!39465 _values!914) (store mapRest!49897 mapKey!49897 mapValue!49897))))

(declare-fun b!1258798 () Bool)

(assert (=> b!1258798 (= e!715896 tp_is_empty!32071)))

(declare-fun b!1258799 () Bool)

(declare-fun res!838743 () Bool)

(assert (=> b!1258799 (=> (not res!838743) (not e!715895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81823 (_ BitVec 32)) Bool)

(assert (=> b!1258799 (= res!838743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!838744 () Bool)

(assert (=> start!105778 (=> (not res!838744) (not e!715895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105778 (= res!838744 (validMask!0 mask!1466))))

(assert (=> start!105778 e!715895))

(assert (=> start!105778 true))

(assert (=> start!105778 tp!95027))

(assert (=> start!105778 tp_is_empty!32071))

(declare-fun array_inv!30199 (array!81823) Bool)

(assert (=> start!105778 (array_inv!30199 _keys!1118)))

(declare-fun e!715897 () Bool)

(declare-fun array_inv!30200 (array!81825) Bool)

(assert (=> start!105778 (and (array_inv!30200 _values!914) e!715897)))

(declare-fun mapIsEmpty!49897 () Bool)

(assert (=> mapIsEmpty!49897 mapRes!49897))

(declare-fun b!1258800 () Bool)

(assert (=> b!1258800 (= e!715897 (and e!715894 mapRes!49897))))

(declare-fun condMapEmpty!49897 () Bool)

(declare-fun mapDefault!49897 () ValueCell!15272)

(assert (=> b!1258800 (= condMapEmpty!49897 (= (arr!39465 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15272)) mapDefault!49897)))))

(declare-fun b!1258801 () Bool)

(declare-fun res!838742 () Bool)

(assert (=> b!1258801 (=> (not res!838742) (not e!715895))))

(declare-datatypes ((List!28052 0))(
  ( (Nil!28049) (Cons!28048 (h!29266 (_ BitVec 64)) (t!41535 List!28052)) )
))
(declare-fun arrayNoDuplicates!0 (array!81823 (_ BitVec 32) List!28052) Bool)

(assert (=> b!1258801 (= res!838742 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28049))))

(assert (= (and start!105778 res!838744) b!1258795))

(assert (= (and b!1258795 res!838745) b!1258799))

(assert (= (and b!1258799 res!838743) b!1258801))

(assert (= (and b!1258801 res!838742) b!1258796))

(assert (= (and b!1258800 condMapEmpty!49897) mapIsEmpty!49897))

(assert (= (and b!1258800 (not condMapEmpty!49897)) mapNonEmpty!49897))

(get-info :version)

(assert (= (and mapNonEmpty!49897 ((_ is ValueCellFull!15272) mapValue!49897)) b!1258798))

(assert (= (and b!1258800 ((_ is ValueCellFull!15272) mapDefault!49897)) b!1258797))

(assert (= start!105778 b!1258800))

(declare-fun m!1159683 () Bool)

(assert (=> b!1258796 m!1159683))

(declare-fun m!1159685 () Bool)

(assert (=> b!1258796 m!1159685))

(declare-fun m!1159687 () Bool)

(assert (=> b!1258796 m!1159687))

(declare-fun m!1159689 () Bool)

(assert (=> b!1258799 m!1159689))

(declare-fun m!1159691 () Bool)

(assert (=> mapNonEmpty!49897 m!1159691))

(declare-fun m!1159693 () Bool)

(assert (=> start!105778 m!1159693))

(declare-fun m!1159695 () Bool)

(assert (=> start!105778 m!1159695))

(declare-fun m!1159697 () Bool)

(assert (=> start!105778 m!1159697))

(declare-fun m!1159699 () Bool)

(assert (=> b!1258801 m!1159699))

(check-sat (not b_next!27169) b_and!45037 (not b!1258799) (not b!1258796) (not start!105778) (not mapNonEmpty!49897) tp_is_empty!32071 (not b!1258801))
(check-sat b_and!45037 (not b_next!27169))
