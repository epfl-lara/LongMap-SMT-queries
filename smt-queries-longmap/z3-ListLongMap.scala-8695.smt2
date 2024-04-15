; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105586 () Bool)

(assert start!105586)

(declare-fun b_free!27205 () Bool)

(declare-fun b_next!27205 () Bool)

(assert (=> start!105586 (= b_free!27205 (not b_next!27205))))

(declare-fun tp!95134 () Bool)

(declare-fun b_and!45053 () Bool)

(assert (=> start!105586 (= tp!95134 b_and!45053)))

(declare-fun b!1257786 () Bool)

(declare-fun e!715275 () Bool)

(declare-fun e!715272 () Bool)

(declare-fun mapRes!49951 () Bool)

(assert (=> b!1257786 (= e!715275 (and e!715272 mapRes!49951))))

(declare-fun condMapEmpty!49951 () Bool)

(declare-datatypes ((V!48175 0))(
  ( (V!48176 (val!16116 Int)) )
))
(declare-datatypes ((ValueCell!15290 0))(
  ( (ValueCellFull!15290 (v!18817 V!48175)) (EmptyCell!15290) )
))
(declare-datatypes ((array!81767 0))(
  ( (array!81768 (arr!39441 (Array (_ BitVec 32) ValueCell!15290)) (size!39979 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81767)

(declare-fun mapDefault!49951 () ValueCell!15290)

(assert (=> b!1257786 (= condMapEmpty!49951 (= (arr!39441 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15290)) mapDefault!49951)))))

(declare-fun mapNonEmpty!49951 () Bool)

(declare-fun tp!95135 () Bool)

(declare-fun e!715274 () Bool)

(assert (=> mapNonEmpty!49951 (= mapRes!49951 (and tp!95135 e!715274))))

(declare-fun mapKey!49951 () (_ BitVec 32))

(declare-fun mapValue!49951 () ValueCell!15290)

(declare-fun mapRest!49951 () (Array (_ BitVec 32) ValueCell!15290))

(assert (=> mapNonEmpty!49951 (= (arr!39441 _values!914) (store mapRest!49951 mapKey!49951 mapValue!49951))))

(declare-fun b!1257788 () Bool)

(declare-fun res!838400 () Bool)

(declare-fun e!715276 () Bool)

(assert (=> b!1257788 (=> (not res!838400) (not e!715276))))

(declare-datatypes ((array!81769 0))(
  ( (array!81770 (arr!39442 (Array (_ BitVec 32) (_ BitVec 64))) (size!39980 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81769)

(declare-datatypes ((List!28113 0))(
  ( (Nil!28110) (Cons!28109 (h!29318 (_ BitVec 64)) (t!41595 List!28113)) )
))
(declare-fun arrayNoDuplicates!0 (array!81769 (_ BitVec 32) List!28113) Bool)

(assert (=> b!1257788 (= res!838400 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28110))))

(declare-fun b!1257789 () Bool)

(declare-fun tp_is_empty!32107 () Bool)

(assert (=> b!1257789 (= e!715272 tp_is_empty!32107)))

(declare-fun b!1257790 () Bool)

(declare-fun res!838401 () Bool)

(assert (=> b!1257790 (=> (not res!838401) (not e!715276))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81769 (_ BitVec 32)) Bool)

(assert (=> b!1257790 (= res!838401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257791 () Bool)

(assert (=> b!1257791 (= e!715274 tp_is_empty!32107)))

(declare-fun mapIsEmpty!49951 () Bool)

(assert (=> mapIsEmpty!49951 mapRes!49951))

(declare-fun b!1257792 () Bool)

(declare-fun res!838398 () Bool)

(assert (=> b!1257792 (=> (not res!838398) (not e!715276))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257792 (= res!838398 (and (= (size!39979 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39980 _keys!1118) (size!39979 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!838399 () Bool)

(assert (=> start!105586 (=> (not res!838399) (not e!715276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105586 (= res!838399 (validMask!0 mask!1466))))

(assert (=> start!105586 e!715276))

(assert (=> start!105586 true))

(assert (=> start!105586 tp!95134))

(assert (=> start!105586 tp_is_empty!32107))

(declare-fun array_inv!30175 (array!81769) Bool)

(assert (=> start!105586 (array_inv!30175 _keys!1118)))

(declare-fun array_inv!30176 (array!81767) Bool)

(assert (=> start!105586 (and (array_inv!30176 _values!914) e!715275)))

(declare-fun b!1257787 () Bool)

(assert (=> b!1257787 (= e!715276 (not true))))

(declare-datatypes ((tuple2!20906 0))(
  ( (tuple2!20907 (_1!10464 (_ BitVec 64)) (_2!10464 V!48175)) )
))
(declare-datatypes ((List!28114 0))(
  ( (Nil!28111) (Cons!28110 (h!29319 tuple2!20906) (t!41596 List!28114)) )
))
(declare-datatypes ((ListLongMap!18779 0))(
  ( (ListLongMap!18780 (toList!9405 List!28114)) )
))
(declare-fun lt!568748 () ListLongMap!18779)

(declare-fun lt!568749 () ListLongMap!18779)

(assert (=> b!1257787 (= lt!568748 lt!568749)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48175)

(declare-fun minValueBefore!43 () V!48175)

(declare-fun zeroValue!871 () V!48175)

(declare-datatypes ((Unit!41769 0))(
  ( (Unit!41770) )
))
(declare-fun lt!568750 () Unit!41769)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1109 (array!81769 array!81767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48175 V!48175 V!48175 V!48175 (_ BitVec 32) Int) Unit!41769)

(assert (=> b!1257787 (= lt!568750 (lemmaNoChangeToArrayThenSameMapNoExtras!1109 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5787 (array!81769 array!81767 (_ BitVec 32) (_ BitVec 32) V!48175 V!48175 (_ BitVec 32) Int) ListLongMap!18779)

(assert (=> b!1257787 (= lt!568749 (getCurrentListMapNoExtraKeys!5787 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257787 (= lt!568748 (getCurrentListMapNoExtraKeys!5787 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105586 res!838399) b!1257792))

(assert (= (and b!1257792 res!838398) b!1257790))

(assert (= (and b!1257790 res!838401) b!1257788))

(assert (= (and b!1257788 res!838400) b!1257787))

(assert (= (and b!1257786 condMapEmpty!49951) mapIsEmpty!49951))

(assert (= (and b!1257786 (not condMapEmpty!49951)) mapNonEmpty!49951))

(get-info :version)

(assert (= (and mapNonEmpty!49951 ((_ is ValueCellFull!15290) mapValue!49951)) b!1257791))

(assert (= (and b!1257786 ((_ is ValueCellFull!15290) mapDefault!49951)) b!1257789))

(assert (= start!105586 b!1257786))

(declare-fun m!1157875 () Bool)

(assert (=> start!105586 m!1157875))

(declare-fun m!1157877 () Bool)

(assert (=> start!105586 m!1157877))

(declare-fun m!1157879 () Bool)

(assert (=> start!105586 m!1157879))

(declare-fun m!1157881 () Bool)

(assert (=> mapNonEmpty!49951 m!1157881))

(declare-fun m!1157883 () Bool)

(assert (=> b!1257787 m!1157883))

(declare-fun m!1157885 () Bool)

(assert (=> b!1257787 m!1157885))

(declare-fun m!1157887 () Bool)

(assert (=> b!1257787 m!1157887))

(declare-fun m!1157889 () Bool)

(assert (=> b!1257788 m!1157889))

(declare-fun m!1157891 () Bool)

(assert (=> b!1257790 m!1157891))

(check-sat (not start!105586) (not b!1257790) (not b!1257787) b_and!45053 (not b!1257788) tp_is_empty!32107 (not b_next!27205) (not mapNonEmpty!49951))
(check-sat b_and!45053 (not b_next!27205))
