; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105682 () Bool)

(assert start!105682)

(declare-fun b_free!27271 () Bool)

(declare-fun b_next!27271 () Bool)

(assert (=> start!105682 (= b_free!27271 (not b_next!27271))))

(declare-fun tp!95339 () Bool)

(declare-fun b_and!45137 () Bool)

(assert (=> start!105682 (= tp!95339 b_and!45137)))

(declare-fun b!1258797 () Bool)

(declare-datatypes ((V!48263 0))(
  ( (V!48264 (val!16149 Int)) )
))
(declare-datatypes ((tuple2!20952 0))(
  ( (tuple2!20953 (_1!10487 (_ BitVec 64)) (_2!10487 V!48263)) )
))
(declare-datatypes ((List!28160 0))(
  ( (Nil!28157) (Cons!28156 (h!29365 tuple2!20952) (t!41646 List!28160)) )
))
(declare-datatypes ((ListLongMap!18825 0))(
  ( (ListLongMap!18826 (toList!9428 List!28160)) )
))
(declare-fun lt!569288 () ListLongMap!18825)

(declare-fun lt!569282 () tuple2!20952)

(declare-fun e!716001 () Bool)

(declare-fun lt!569284 () ListLongMap!18825)

(declare-fun +!4230 (ListLongMap!18825 tuple2!20952) ListLongMap!18825)

(assert (=> b!1258797 (= e!716001 (= lt!569288 (+!4230 lt!569284 lt!569282)))))

(declare-fun b!1258798 () Bool)

(declare-fun e!716007 () Bool)

(declare-fun e!716004 () Bool)

(declare-fun mapRes!50056 () Bool)

(assert (=> b!1258798 (= e!716007 (and e!716004 mapRes!50056))))

(declare-fun condMapEmpty!50056 () Bool)

(declare-datatypes ((ValueCell!15323 0))(
  ( (ValueCellFull!15323 (v!18850 V!48263)) (EmptyCell!15323) )
))
(declare-datatypes ((array!81895 0))(
  ( (array!81896 (arr!39503 (Array (_ BitVec 32) ValueCell!15323)) (size!40041 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81895)

(declare-fun mapDefault!50056 () ValueCell!15323)

(assert (=> b!1258798 (= condMapEmpty!50056 (= (arr!39503 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15323)) mapDefault!50056)))))

(declare-fun b!1258799 () Bool)

(declare-fun e!716006 () Bool)

(assert (=> b!1258799 (= e!716006 true)))

(declare-fun lt!569286 () Bool)

(declare-fun lt!569285 () ListLongMap!18825)

(declare-fun contains!7545 (ListLongMap!18825 (_ BitVec 64)) Bool)

(assert (=> b!1258799 (= lt!569286 (contains!7545 lt!569285 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1258799 e!716001))

(declare-fun res!838968 () Bool)

(assert (=> b!1258799 (=> (not res!838968) (not e!716001))))

(declare-fun lt!569287 () ListLongMap!18825)

(declare-fun minValueBefore!43 () V!48263)

(assert (=> b!1258799 (= res!838968 (= lt!569287 (+!4230 lt!569285 (tuple2!20953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!569283 () ListLongMap!18825)

(assert (=> b!1258799 (= lt!569285 (+!4230 lt!569283 lt!569282))))

(declare-fun zeroValue!871 () V!48263)

(assert (=> b!1258799 (= lt!569282 (tuple2!20953 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48263)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81897 0))(
  ( (array!81898 (arr!39504 (Array (_ BitVec 32) (_ BitVec 64))) (size!40042 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81897)

(declare-fun getCurrentListMap!4519 (array!81897 array!81895 (_ BitVec 32) (_ BitVec 32) V!48263 V!48263 (_ BitVec 32) Int) ListLongMap!18825)

(assert (=> b!1258799 (= lt!569288 (getCurrentListMap!4519 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258799 (= lt!569287 (getCurrentListMap!4519 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258800 () Bool)

(declare-fun e!716005 () Bool)

(assert (=> b!1258800 (= e!716005 (not e!716006))))

(declare-fun res!838972 () Bool)

(assert (=> b!1258800 (=> res!838972 e!716006)))

(assert (=> b!1258800 (= res!838972 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1258800 (= lt!569283 lt!569284)))

(declare-datatypes ((Unit!41804 0))(
  ( (Unit!41805) )
))
(declare-fun lt!569289 () Unit!41804)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1126 (array!81897 array!81895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48263 V!48263 V!48263 V!48263 (_ BitVec 32) Int) Unit!41804)

(assert (=> b!1258800 (= lt!569289 (lemmaNoChangeToArrayThenSameMapNoExtras!1126 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5804 (array!81897 array!81895 (_ BitVec 32) (_ BitVec 32) V!48263 V!48263 (_ BitVec 32) Int) ListLongMap!18825)

(assert (=> b!1258800 (= lt!569284 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258800 (= lt!569283 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50056 () Bool)

(declare-fun tp!95338 () Bool)

(declare-fun e!716002 () Bool)

(assert (=> mapNonEmpty!50056 (= mapRes!50056 (and tp!95338 e!716002))))

(declare-fun mapRest!50056 () (Array (_ BitVec 32) ValueCell!15323))

(declare-fun mapKey!50056 () (_ BitVec 32))

(declare-fun mapValue!50056 () ValueCell!15323)

(assert (=> mapNonEmpty!50056 (= (arr!39503 _values!914) (store mapRest!50056 mapKey!50056 mapValue!50056))))

(declare-fun b!1258801 () Bool)

(declare-fun res!838970 () Bool)

(assert (=> b!1258801 (=> (not res!838970) (not e!716005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81897 (_ BitVec 32)) Bool)

(assert (=> b!1258801 (= res!838970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50056 () Bool)

(assert (=> mapIsEmpty!50056 mapRes!50056))

(declare-fun b!1258802 () Bool)

(declare-fun res!838971 () Bool)

(assert (=> b!1258802 (=> (not res!838971) (not e!716005))))

(declare-datatypes ((List!28161 0))(
  ( (Nil!28158) (Cons!28157 (h!29366 (_ BitVec 64)) (t!41647 List!28161)) )
))
(declare-fun arrayNoDuplicates!0 (array!81897 (_ BitVec 32) List!28161) Bool)

(assert (=> b!1258802 (= res!838971 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28158))))

(declare-fun b!1258803 () Bool)

(declare-fun tp_is_empty!32173 () Bool)

(assert (=> b!1258803 (= e!716004 tp_is_empty!32173)))

(declare-fun res!838969 () Bool)

(assert (=> start!105682 (=> (not res!838969) (not e!716005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105682 (= res!838969 (validMask!0 mask!1466))))

(assert (=> start!105682 e!716005))

(assert (=> start!105682 true))

(assert (=> start!105682 tp!95339))

(assert (=> start!105682 tp_is_empty!32173))

(declare-fun array_inv!30223 (array!81897) Bool)

(assert (=> start!105682 (array_inv!30223 _keys!1118)))

(declare-fun array_inv!30224 (array!81895) Bool)

(assert (=> start!105682 (and (array_inv!30224 _values!914) e!716007)))

(declare-fun b!1258804 () Bool)

(assert (=> b!1258804 (= e!716002 tp_is_empty!32173)))

(declare-fun b!1258805 () Bool)

(declare-fun res!838973 () Bool)

(assert (=> b!1258805 (=> (not res!838973) (not e!716005))))

(assert (=> b!1258805 (= res!838973 (and (= (size!40041 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40042 _keys!1118) (size!40041 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105682 res!838969) b!1258805))

(assert (= (and b!1258805 res!838973) b!1258801))

(assert (= (and b!1258801 res!838970) b!1258802))

(assert (= (and b!1258802 res!838971) b!1258800))

(assert (= (and b!1258800 (not res!838972)) b!1258799))

(assert (= (and b!1258799 res!838968) b!1258797))

(assert (= (and b!1258798 condMapEmpty!50056) mapIsEmpty!50056))

(assert (= (and b!1258798 (not condMapEmpty!50056)) mapNonEmpty!50056))

(get-info :version)

(assert (= (and mapNonEmpty!50056 ((_ is ValueCellFull!15323) mapValue!50056)) b!1258804))

(assert (= (and b!1258798 ((_ is ValueCellFull!15323) mapDefault!50056)) b!1258803))

(assert (= start!105682 b!1258798))

(declare-fun m!1158701 () Bool)

(assert (=> b!1258801 m!1158701))

(declare-fun m!1158703 () Bool)

(assert (=> start!105682 m!1158703))

(declare-fun m!1158705 () Bool)

(assert (=> start!105682 m!1158705))

(declare-fun m!1158707 () Bool)

(assert (=> start!105682 m!1158707))

(declare-fun m!1158709 () Bool)

(assert (=> b!1258800 m!1158709))

(declare-fun m!1158711 () Bool)

(assert (=> b!1258800 m!1158711))

(declare-fun m!1158713 () Bool)

(assert (=> b!1258800 m!1158713))

(declare-fun m!1158715 () Bool)

(assert (=> mapNonEmpty!50056 m!1158715))

(declare-fun m!1158717 () Bool)

(assert (=> b!1258802 m!1158717))

(declare-fun m!1158719 () Bool)

(assert (=> b!1258799 m!1158719))

(declare-fun m!1158721 () Bool)

(assert (=> b!1258799 m!1158721))

(declare-fun m!1158723 () Bool)

(assert (=> b!1258799 m!1158723))

(declare-fun m!1158725 () Bool)

(assert (=> b!1258799 m!1158725))

(declare-fun m!1158727 () Bool)

(assert (=> b!1258799 m!1158727))

(declare-fun m!1158729 () Bool)

(assert (=> b!1258797 m!1158729))

(check-sat (not mapNonEmpty!50056) (not b!1258800) tp_is_empty!32173 b_and!45137 (not start!105682) (not b!1258801) (not b!1258799) (not b!1258802) (not b_next!27271) (not b!1258797))
(check-sat b_and!45137 (not b_next!27271))
