; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105772 () Bool)

(assert start!105772)

(declare-fun b_free!27163 () Bool)

(declare-fun b_next!27163 () Bool)

(assert (=> start!105772 (= b_free!27163 (not b_next!27163))))

(declare-fun tp!95008 () Bool)

(declare-fun b_and!45031 () Bool)

(assert (=> start!105772 (= tp!95008 b_and!45031)))

(declare-fun b!1258732 () Bool)

(declare-fun res!838706 () Bool)

(declare-fun e!715853 () Bool)

(assert (=> b!1258732 (=> (not res!838706) (not e!715853))))

(declare-datatypes ((array!81813 0))(
  ( (array!81814 (arr!39459 (Array (_ BitVec 32) (_ BitVec 64))) (size!39996 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81813)

(declare-datatypes ((List!28049 0))(
  ( (Nil!28046) (Cons!28045 (h!29263 (_ BitVec 64)) (t!41532 List!28049)) )
))
(declare-fun arrayNoDuplicates!0 (array!81813 (_ BitVec 32) List!28049) Bool)

(assert (=> b!1258732 (= res!838706 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28046))))

(declare-fun b!1258733 () Bool)

(declare-fun res!838709 () Bool)

(assert (=> b!1258733 (=> (not res!838709) (not e!715853))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48119 0))(
  ( (V!48120 (val!16095 Int)) )
))
(declare-datatypes ((ValueCell!15269 0))(
  ( (ValueCellFull!15269 (v!18793 V!48119)) (EmptyCell!15269) )
))
(declare-datatypes ((array!81815 0))(
  ( (array!81816 (arr!39460 (Array (_ BitVec 32) ValueCell!15269)) (size!39997 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81815)

(assert (=> b!1258733 (= res!838709 (and (= (size!39997 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39996 _keys!1118) (size!39997 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258734 () Bool)

(declare-fun e!715851 () Bool)

(declare-fun tp_is_empty!32065 () Bool)

(assert (=> b!1258734 (= e!715851 tp_is_empty!32065)))

(declare-fun res!838707 () Bool)

(assert (=> start!105772 (=> (not res!838707) (not e!715853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105772 (= res!838707 (validMask!0 mask!1466))))

(assert (=> start!105772 e!715853))

(assert (=> start!105772 true))

(assert (=> start!105772 tp!95008))

(assert (=> start!105772 tp_is_empty!32065))

(declare-fun array_inv!30195 (array!81813) Bool)

(assert (=> start!105772 (array_inv!30195 _keys!1118)))

(declare-fun e!715850 () Bool)

(declare-fun array_inv!30196 (array!81815) Bool)

(assert (=> start!105772 (and (array_inv!30196 _values!914) e!715850)))

(declare-fun b!1258735 () Bool)

(assert (=> b!1258735 (= e!715853 (not true))))

(declare-datatypes ((tuple2!20822 0))(
  ( (tuple2!20823 (_1!10422 (_ BitVec 64)) (_2!10422 V!48119)) )
))
(declare-datatypes ((List!28050 0))(
  ( (Nil!28047) (Cons!28046 (h!29264 tuple2!20822) (t!41533 List!28050)) )
))
(declare-datatypes ((ListLongMap!18703 0))(
  ( (ListLongMap!18704 (toList!9367 List!28050)) )
))
(declare-fun lt!569223 () ListLongMap!18703)

(declare-fun lt!569222 () ListLongMap!18703)

(assert (=> b!1258735 (= lt!569223 lt!569222)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41877 0))(
  ( (Unit!41878) )
))
(declare-fun lt!569224 () Unit!41877)

(declare-fun minValueAfter!43 () V!48119)

(declare-fun zeroValue!871 () V!48119)

(declare-fun minValueBefore!43 () V!48119)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1097 (array!81813 array!81815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48119 V!48119 V!48119 V!48119 (_ BitVec 32) Int) Unit!41877)

(assert (=> b!1258735 (= lt!569224 (lemmaNoChangeToArrayThenSameMapNoExtras!1097 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5783 (array!81813 array!81815 (_ BitVec 32) (_ BitVec 32) V!48119 V!48119 (_ BitVec 32) Int) ListLongMap!18703)

(assert (=> b!1258735 (= lt!569222 (getCurrentListMapNoExtraKeys!5783 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258735 (= lt!569223 (getCurrentListMapNoExtraKeys!5783 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258736 () Bool)

(declare-fun res!838708 () Bool)

(assert (=> b!1258736 (=> (not res!838708) (not e!715853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81813 (_ BitVec 32)) Bool)

(assert (=> b!1258736 (= res!838708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258737 () Bool)

(declare-fun e!715849 () Bool)

(declare-fun mapRes!49888 () Bool)

(assert (=> b!1258737 (= e!715850 (and e!715849 mapRes!49888))))

(declare-fun condMapEmpty!49888 () Bool)

(declare-fun mapDefault!49888 () ValueCell!15269)

(assert (=> b!1258737 (= condMapEmpty!49888 (= (arr!39460 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15269)) mapDefault!49888)))))

(declare-fun mapIsEmpty!49888 () Bool)

(assert (=> mapIsEmpty!49888 mapRes!49888))

(declare-fun mapNonEmpty!49888 () Bool)

(declare-fun tp!95009 () Bool)

(assert (=> mapNonEmpty!49888 (= mapRes!49888 (and tp!95009 e!715851))))

(declare-fun mapRest!49888 () (Array (_ BitVec 32) ValueCell!15269))

(declare-fun mapValue!49888 () ValueCell!15269)

(declare-fun mapKey!49888 () (_ BitVec 32))

(assert (=> mapNonEmpty!49888 (= (arr!39460 _values!914) (store mapRest!49888 mapKey!49888 mapValue!49888))))

(declare-fun b!1258738 () Bool)

(assert (=> b!1258738 (= e!715849 tp_is_empty!32065)))

(assert (= (and start!105772 res!838707) b!1258733))

(assert (= (and b!1258733 res!838709) b!1258736))

(assert (= (and b!1258736 res!838708) b!1258732))

(assert (= (and b!1258732 res!838706) b!1258735))

(assert (= (and b!1258737 condMapEmpty!49888) mapIsEmpty!49888))

(assert (= (and b!1258737 (not condMapEmpty!49888)) mapNonEmpty!49888))

(get-info :version)

(assert (= (and mapNonEmpty!49888 ((_ is ValueCellFull!15269) mapValue!49888)) b!1258734))

(assert (= (and b!1258737 ((_ is ValueCellFull!15269) mapDefault!49888)) b!1258738))

(assert (= start!105772 b!1258737))

(declare-fun m!1159629 () Bool)

(assert (=> start!105772 m!1159629))

(declare-fun m!1159631 () Bool)

(assert (=> start!105772 m!1159631))

(declare-fun m!1159633 () Bool)

(assert (=> start!105772 m!1159633))

(declare-fun m!1159635 () Bool)

(assert (=> b!1258732 m!1159635))

(declare-fun m!1159637 () Bool)

(assert (=> b!1258736 m!1159637))

(declare-fun m!1159639 () Bool)

(assert (=> b!1258735 m!1159639))

(declare-fun m!1159641 () Bool)

(assert (=> b!1258735 m!1159641))

(declare-fun m!1159643 () Bool)

(assert (=> b!1258735 m!1159643))

(declare-fun m!1159645 () Bool)

(assert (=> mapNonEmpty!49888 m!1159645))

(check-sat (not mapNonEmpty!49888) (not b!1258732) (not b!1258735) (not b_next!27163) b_and!45031 tp_is_empty!32065 (not b!1258736) (not start!105772))
(check-sat b_and!45031 (not b_next!27163))
