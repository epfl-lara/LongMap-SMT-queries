; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106068 () Bool)

(assert start!106068)

(declare-fun b_free!27385 () Bool)

(declare-fun b_next!27385 () Bool)

(assert (=> start!106068 (= b_free!27385 (not b_next!27385))))

(declare-fun tp!95687 () Bool)

(declare-fun b_and!45295 () Bool)

(assert (=> start!106068 (= tp!95687 b_and!45295)))

(declare-fun b!1262095 () Bool)

(declare-fun e!718331 () Bool)

(assert (=> b!1262095 (= e!718331 (not true))))

(declare-datatypes ((V!48415 0))(
  ( (V!48416 (val!16206 Int)) )
))
(declare-datatypes ((tuple2!20984 0))(
  ( (tuple2!20985 (_1!10503 (_ BitVec 64)) (_2!10503 V!48415)) )
))
(declare-datatypes ((List!28205 0))(
  ( (Nil!28202) (Cons!28201 (h!29419 tuple2!20984) (t!41696 List!28205)) )
))
(declare-datatypes ((ListLongMap!18865 0))(
  ( (ListLongMap!18866 (toList!9448 List!28205)) )
))
(declare-fun lt!571919 () ListLongMap!18865)

(declare-fun lt!571920 () ListLongMap!18865)

(assert (=> b!1262095 (= lt!571919 lt!571920)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!42034 0))(
  ( (Unit!42035) )
))
(declare-fun lt!571921 () Unit!42034)

(declare-fun minValueAfter!43 () V!48415)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48415)

(declare-datatypes ((array!82241 0))(
  ( (array!82242 (arr!39669 (Array (_ BitVec 32) (_ BitVec 64))) (size!40206 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82241)

(declare-datatypes ((ValueCell!15380 0))(
  ( (ValueCellFull!15380 (v!18906 V!48415)) (EmptyCell!15380) )
))
(declare-datatypes ((array!82243 0))(
  ( (array!82244 (arr!39670 (Array (_ BitVec 32) ValueCell!15380)) (size!40207 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82243)

(declare-fun minValueBefore!43 () V!48415)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1168 (array!82241 array!82243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48415 V!48415 V!48415 V!48415 (_ BitVec 32) Int) Unit!42034)

(assert (=> b!1262095 (= lt!571921 (lemmaNoChangeToArrayThenSameMapNoExtras!1168 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5854 (array!82241 array!82243 (_ BitVec 32) (_ BitVec 32) V!48415 V!48415 (_ BitVec 32) Int) ListLongMap!18865)

(assert (=> b!1262095 (= lt!571920 (getCurrentListMapNoExtraKeys!5854 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262095 (= lt!571919 (getCurrentListMapNoExtraKeys!5854 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262096 () Bool)

(declare-fun res!840724 () Bool)

(assert (=> b!1262096 (=> (not res!840724) (not e!718331))))

(assert (=> b!1262096 (= res!840724 (and (= (size!40207 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40206 _keys!1118) (size!40207 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!840722 () Bool)

(assert (=> start!106068 (=> (not res!840722) (not e!718331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106068 (= res!840722 (validMask!0 mask!1466))))

(assert (=> start!106068 e!718331))

(assert (=> start!106068 true))

(assert (=> start!106068 tp!95687))

(declare-fun tp_is_empty!32287 () Bool)

(assert (=> start!106068 tp_is_empty!32287))

(declare-fun array_inv!30345 (array!82241) Bool)

(assert (=> start!106068 (array_inv!30345 _keys!1118)))

(declare-fun e!718329 () Bool)

(declare-fun array_inv!30346 (array!82243) Bool)

(assert (=> start!106068 (and (array_inv!30346 _values!914) e!718329)))

(declare-fun b!1262097 () Bool)

(declare-fun res!840723 () Bool)

(assert (=> b!1262097 (=> (not res!840723) (not e!718331))))

(declare-datatypes ((List!28206 0))(
  ( (Nil!28203) (Cons!28202 (h!29420 (_ BitVec 64)) (t!41697 List!28206)) )
))
(declare-fun arrayNoDuplicates!0 (array!82241 (_ BitVec 32) List!28206) Bool)

(assert (=> b!1262097 (= res!840723 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28203))))

(declare-fun b!1262098 () Bool)

(declare-fun e!718328 () Bool)

(assert (=> b!1262098 (= e!718328 tp_is_empty!32287)))

(declare-fun mapIsEmpty!50233 () Bool)

(declare-fun mapRes!50233 () Bool)

(assert (=> mapIsEmpty!50233 mapRes!50233))

(declare-fun b!1262099 () Bool)

(declare-fun e!718330 () Bool)

(assert (=> b!1262099 (= e!718329 (and e!718330 mapRes!50233))))

(declare-fun condMapEmpty!50233 () Bool)

(declare-fun mapDefault!50233 () ValueCell!15380)

(assert (=> b!1262099 (= condMapEmpty!50233 (= (arr!39670 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15380)) mapDefault!50233)))))

(declare-fun b!1262100 () Bool)

(declare-fun res!840725 () Bool)

(assert (=> b!1262100 (=> (not res!840725) (not e!718331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82241 (_ BitVec 32)) Bool)

(assert (=> b!1262100 (= res!840725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262101 () Bool)

(assert (=> b!1262101 (= e!718330 tp_is_empty!32287)))

(declare-fun mapNonEmpty!50233 () Bool)

(declare-fun tp!95686 () Bool)

(assert (=> mapNonEmpty!50233 (= mapRes!50233 (and tp!95686 e!718328))))

(declare-fun mapRest!50233 () (Array (_ BitVec 32) ValueCell!15380))

(declare-fun mapValue!50233 () ValueCell!15380)

(declare-fun mapKey!50233 () (_ BitVec 32))

(assert (=> mapNonEmpty!50233 (= (arr!39670 _values!914) (store mapRest!50233 mapKey!50233 mapValue!50233))))

(assert (= (and start!106068 res!840722) b!1262096))

(assert (= (and b!1262096 res!840724) b!1262100))

(assert (= (and b!1262100 res!840725) b!1262097))

(assert (= (and b!1262097 res!840723) b!1262095))

(assert (= (and b!1262099 condMapEmpty!50233) mapIsEmpty!50233))

(assert (= (and b!1262099 (not condMapEmpty!50233)) mapNonEmpty!50233))

(get-info :version)

(assert (= (and mapNonEmpty!50233 ((_ is ValueCellFull!15380) mapValue!50233)) b!1262098))

(assert (= (and b!1262099 ((_ is ValueCellFull!15380) mapDefault!50233)) b!1262101))

(assert (= start!106068 b!1262099))

(declare-fun m!1163175 () Bool)

(assert (=> b!1262100 m!1163175))

(declare-fun m!1163177 () Bool)

(assert (=> start!106068 m!1163177))

(declare-fun m!1163179 () Bool)

(assert (=> start!106068 m!1163179))

(declare-fun m!1163181 () Bool)

(assert (=> start!106068 m!1163181))

(declare-fun m!1163183 () Bool)

(assert (=> mapNonEmpty!50233 m!1163183))

(declare-fun m!1163185 () Bool)

(assert (=> b!1262097 m!1163185))

(declare-fun m!1163187 () Bool)

(assert (=> b!1262095 m!1163187))

(declare-fun m!1163189 () Bool)

(assert (=> b!1262095 m!1163189))

(declare-fun m!1163191 () Bool)

(assert (=> b!1262095 m!1163191))

(check-sat (not mapNonEmpty!50233) (not b!1262097) tp_is_empty!32287 (not b!1262095) (not b!1262100) (not start!106068) b_and!45295 (not b_next!27385))
(check-sat b_and!45295 (not b_next!27385))
