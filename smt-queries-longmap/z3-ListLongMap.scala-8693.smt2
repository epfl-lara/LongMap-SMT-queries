; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105802 () Bool)

(assert start!105802)

(declare-fun b_free!27193 () Bool)

(declare-fun b_next!27193 () Bool)

(assert (=> start!105802 (= b_free!27193 (not b_next!27193))))

(declare-fun tp!95098 () Bool)

(declare-fun b_and!45061 () Bool)

(assert (=> start!105802 (= tp!95098 b_and!45061)))

(declare-fun b!1259047 () Bool)

(declare-fun res!838888 () Bool)

(declare-fun e!716077 () Bool)

(assert (=> b!1259047 (=> (not res!838888) (not e!716077))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81869 0))(
  ( (array!81870 (arr!39487 (Array (_ BitVec 32) (_ BitVec 64))) (size!40024 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81869)

(declare-datatypes ((V!48159 0))(
  ( (V!48160 (val!16110 Int)) )
))
(declare-datatypes ((ValueCell!15284 0))(
  ( (ValueCellFull!15284 (v!18808 V!48159)) (EmptyCell!15284) )
))
(declare-datatypes ((array!81871 0))(
  ( (array!81872 (arr!39488 (Array (_ BitVec 32) ValueCell!15284)) (size!40025 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81871)

(assert (=> b!1259047 (= res!838888 (and (= (size!40025 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40024 _keys!1118) (size!40025 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259048 () Bool)

(declare-fun e!716074 () Bool)

(declare-fun tp_is_empty!32095 () Bool)

(assert (=> b!1259048 (= e!716074 tp_is_empty!32095)))

(declare-fun b!1259049 () Bool)

(declare-fun e!716076 () Bool)

(declare-fun mapRes!49933 () Bool)

(assert (=> b!1259049 (= e!716076 (and e!716074 mapRes!49933))))

(declare-fun condMapEmpty!49933 () Bool)

(declare-fun mapDefault!49933 () ValueCell!15284)

(assert (=> b!1259049 (= condMapEmpty!49933 (= (arr!39488 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15284)) mapDefault!49933)))))

(declare-fun b!1259050 () Bool)

(declare-fun e!716078 () Bool)

(assert (=> b!1259050 (= e!716078 tp_is_empty!32095)))

(declare-fun b!1259051 () Bool)

(assert (=> b!1259051 (= e!716077 (not true))))

(declare-datatypes ((tuple2!20838 0))(
  ( (tuple2!20839 (_1!10430 (_ BitVec 64)) (_2!10430 V!48159)) )
))
(declare-datatypes ((List!28066 0))(
  ( (Nil!28063) (Cons!28062 (h!29280 tuple2!20838) (t!41549 List!28066)) )
))
(declare-datatypes ((ListLongMap!18719 0))(
  ( (ListLongMap!18720 (toList!9375 List!28066)) )
))
(declare-fun lt!569358 () ListLongMap!18719)

(declare-fun lt!569359 () ListLongMap!18719)

(assert (=> b!1259051 (= lt!569358 lt!569359)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48159)

(declare-fun zeroValue!871 () V!48159)

(declare-datatypes ((Unit!41893 0))(
  ( (Unit!41894) )
))
(declare-fun lt!569357 () Unit!41893)

(declare-fun minValueBefore!43 () V!48159)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1105 (array!81869 array!81871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48159 V!48159 V!48159 V!48159 (_ BitVec 32) Int) Unit!41893)

(assert (=> b!1259051 (= lt!569357 (lemmaNoChangeToArrayThenSameMapNoExtras!1105 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5791 (array!81869 array!81871 (_ BitVec 32) (_ BitVec 32) V!48159 V!48159 (_ BitVec 32) Int) ListLongMap!18719)

(assert (=> b!1259051 (= lt!569359 (getCurrentListMapNoExtraKeys!5791 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259051 (= lt!569358 (getCurrentListMapNoExtraKeys!5791 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49933 () Bool)

(declare-fun tp!95099 () Bool)

(assert (=> mapNonEmpty!49933 (= mapRes!49933 (and tp!95099 e!716078))))

(declare-fun mapValue!49933 () ValueCell!15284)

(declare-fun mapKey!49933 () (_ BitVec 32))

(declare-fun mapRest!49933 () (Array (_ BitVec 32) ValueCell!15284))

(assert (=> mapNonEmpty!49933 (= (arr!39488 _values!914) (store mapRest!49933 mapKey!49933 mapValue!49933))))

(declare-fun mapIsEmpty!49933 () Bool)

(assert (=> mapIsEmpty!49933 mapRes!49933))

(declare-fun res!838886 () Bool)

(assert (=> start!105802 (=> (not res!838886) (not e!716077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105802 (= res!838886 (validMask!0 mask!1466))))

(assert (=> start!105802 e!716077))

(assert (=> start!105802 true))

(assert (=> start!105802 tp!95098))

(assert (=> start!105802 tp_is_empty!32095))

(declare-fun array_inv!30215 (array!81869) Bool)

(assert (=> start!105802 (array_inv!30215 _keys!1118)))

(declare-fun array_inv!30216 (array!81871) Bool)

(assert (=> start!105802 (and (array_inv!30216 _values!914) e!716076)))

(declare-fun b!1259052 () Bool)

(declare-fun res!838887 () Bool)

(assert (=> b!1259052 (=> (not res!838887) (not e!716077))))

(declare-datatypes ((List!28067 0))(
  ( (Nil!28064) (Cons!28063 (h!29281 (_ BitVec 64)) (t!41550 List!28067)) )
))
(declare-fun arrayNoDuplicates!0 (array!81869 (_ BitVec 32) List!28067) Bool)

(assert (=> b!1259052 (= res!838887 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28064))))

(declare-fun b!1259053 () Bool)

(declare-fun res!838889 () Bool)

(assert (=> b!1259053 (=> (not res!838889) (not e!716077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81869 (_ BitVec 32)) Bool)

(assert (=> b!1259053 (= res!838889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105802 res!838886) b!1259047))

(assert (= (and b!1259047 res!838888) b!1259053))

(assert (= (and b!1259053 res!838889) b!1259052))

(assert (= (and b!1259052 res!838887) b!1259051))

(assert (= (and b!1259049 condMapEmpty!49933) mapIsEmpty!49933))

(assert (= (and b!1259049 (not condMapEmpty!49933)) mapNonEmpty!49933))

(get-info :version)

(assert (= (and mapNonEmpty!49933 ((_ is ValueCellFull!15284) mapValue!49933)) b!1259050))

(assert (= (and b!1259049 ((_ is ValueCellFull!15284) mapDefault!49933)) b!1259048))

(assert (= start!105802 b!1259049))

(declare-fun m!1159899 () Bool)

(assert (=> b!1259051 m!1159899))

(declare-fun m!1159901 () Bool)

(assert (=> b!1259051 m!1159901))

(declare-fun m!1159903 () Bool)

(assert (=> b!1259051 m!1159903))

(declare-fun m!1159905 () Bool)

(assert (=> b!1259052 m!1159905))

(declare-fun m!1159907 () Bool)

(assert (=> start!105802 m!1159907))

(declare-fun m!1159909 () Bool)

(assert (=> start!105802 m!1159909))

(declare-fun m!1159911 () Bool)

(assert (=> start!105802 m!1159911))

(declare-fun m!1159913 () Bool)

(assert (=> b!1259053 m!1159913))

(declare-fun m!1159915 () Bool)

(assert (=> mapNonEmpty!49933 m!1159915))

(check-sat (not start!105802) (not b!1259051) (not b!1259052) tp_is_empty!32095 b_and!45061 (not b!1259053) (not b_next!27193) (not mapNonEmpty!49933))
(check-sat b_and!45061 (not b_next!27193))
