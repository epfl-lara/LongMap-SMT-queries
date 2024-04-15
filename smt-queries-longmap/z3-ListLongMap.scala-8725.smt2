; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105840 () Bool)

(assert start!105840)

(declare-fun b_free!27385 () Bool)

(declare-fun b_next!27385 () Bool)

(assert (=> start!105840 (= b_free!27385 (not b_next!27385))))

(declare-fun tp!95686 () Bool)

(declare-fun b_and!45275 () Bool)

(assert (=> start!105840 (= tp!95686 b_and!45275)))

(declare-fun mapIsEmpty!50233 () Bool)

(declare-fun mapRes!50233 () Bool)

(assert (=> mapIsEmpty!50233 mapRes!50233))

(declare-fun b!1260709 () Bool)

(declare-fun res!840163 () Bool)

(declare-fun e!717437 () Bool)

(assert (=> b!1260709 (=> (not res!840163) (not e!717437))))

(declare-datatypes ((array!82117 0))(
  ( (array!82118 (arr!39612 (Array (_ BitVec 32) (_ BitVec 64))) (size!40150 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82117)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82117 (_ BitVec 32)) Bool)

(assert (=> b!1260709 (= res!840163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260710 () Bool)

(assert (=> b!1260710 (= e!717437 (not true))))

(declare-datatypes ((V!48415 0))(
  ( (V!48416 (val!16206 Int)) )
))
(declare-datatypes ((tuple2!21046 0))(
  ( (tuple2!21047 (_1!10534 (_ BitVec 64)) (_2!10534 V!48415)) )
))
(declare-datatypes ((List!28245 0))(
  ( (Nil!28242) (Cons!28241 (h!29450 tuple2!21046) (t!41735 List!28245)) )
))
(declare-datatypes ((ListLongMap!18919 0))(
  ( (ListLongMap!18920 (toList!9475 List!28245)) )
))
(declare-fun lt!571256 () ListLongMap!18919)

(declare-fun lt!571257 () ListLongMap!18919)

(assert (=> b!1260710 (= lt!571256 lt!571257)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48415)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((Unit!41896 0))(
  ( (Unit!41897) )
))
(declare-fun lt!571258 () Unit!41896)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48415)

(declare-datatypes ((ValueCell!15380 0))(
  ( (ValueCellFull!15380 (v!18909 V!48415)) (EmptyCell!15380) )
))
(declare-datatypes ((array!82119 0))(
  ( (array!82120 (arr!39613 (Array (_ BitVec 32) ValueCell!15380)) (size!40151 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82119)

(declare-fun minValueBefore!43 () V!48415)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1166 (array!82117 array!82119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48415 V!48415 V!48415 V!48415 (_ BitVec 32) Int) Unit!41896)

(assert (=> b!1260710 (= lt!571258 (lemmaNoChangeToArrayThenSameMapNoExtras!1166 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5844 (array!82117 array!82119 (_ BitVec 32) (_ BitVec 32) V!48415 V!48415 (_ BitVec 32) Int) ListLongMap!18919)

(assert (=> b!1260710 (= lt!571257 (getCurrentListMapNoExtraKeys!5844 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260710 (= lt!571256 (getCurrentListMapNoExtraKeys!5844 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50233 () Bool)

(declare-fun tp!95687 () Bool)

(declare-fun e!717439 () Bool)

(assert (=> mapNonEmpty!50233 (= mapRes!50233 (and tp!95687 e!717439))))

(declare-fun mapRest!50233 () (Array (_ BitVec 32) ValueCell!15380))

(declare-fun mapKey!50233 () (_ BitVec 32))

(declare-fun mapValue!50233 () ValueCell!15380)

(assert (=> mapNonEmpty!50233 (= (arr!39613 _values!914) (store mapRest!50233 mapKey!50233 mapValue!50233))))

(declare-fun b!1260711 () Bool)

(declare-fun e!717440 () Bool)

(declare-fun tp_is_empty!32287 () Bool)

(assert (=> b!1260711 (= e!717440 tp_is_empty!32287)))

(declare-fun b!1260712 () Bool)

(assert (=> b!1260712 (= e!717439 tp_is_empty!32287)))

(declare-fun b!1260708 () Bool)

(declare-fun res!840164 () Bool)

(assert (=> b!1260708 (=> (not res!840164) (not e!717437))))

(declare-datatypes ((List!28246 0))(
  ( (Nil!28243) (Cons!28242 (h!29451 (_ BitVec 64)) (t!41736 List!28246)) )
))
(declare-fun arrayNoDuplicates!0 (array!82117 (_ BitVec 32) List!28246) Bool)

(assert (=> b!1260708 (= res!840164 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28243))))

(declare-fun res!840165 () Bool)

(assert (=> start!105840 (=> (not res!840165) (not e!717437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105840 (= res!840165 (validMask!0 mask!1466))))

(assert (=> start!105840 e!717437))

(assert (=> start!105840 true))

(assert (=> start!105840 tp!95686))

(assert (=> start!105840 tp_is_empty!32287))

(declare-fun array_inv!30305 (array!82117) Bool)

(assert (=> start!105840 (array_inv!30305 _keys!1118)))

(declare-fun e!717436 () Bool)

(declare-fun array_inv!30306 (array!82119) Bool)

(assert (=> start!105840 (and (array_inv!30306 _values!914) e!717436)))

(declare-fun b!1260713 () Bool)

(assert (=> b!1260713 (= e!717436 (and e!717440 mapRes!50233))))

(declare-fun condMapEmpty!50233 () Bool)

(declare-fun mapDefault!50233 () ValueCell!15380)

(assert (=> b!1260713 (= condMapEmpty!50233 (= (arr!39613 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15380)) mapDefault!50233)))))

(declare-fun b!1260714 () Bool)

(declare-fun res!840162 () Bool)

(assert (=> b!1260714 (=> (not res!840162) (not e!717437))))

(assert (=> b!1260714 (= res!840162 (and (= (size!40151 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40150 _keys!1118) (size!40151 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105840 res!840165) b!1260714))

(assert (= (and b!1260714 res!840162) b!1260709))

(assert (= (and b!1260709 res!840163) b!1260708))

(assert (= (and b!1260708 res!840164) b!1260710))

(assert (= (and b!1260713 condMapEmpty!50233) mapIsEmpty!50233))

(assert (= (and b!1260713 (not condMapEmpty!50233)) mapNonEmpty!50233))

(get-info :version)

(assert (= (and mapNonEmpty!50233 ((_ is ValueCellFull!15380) mapValue!50233)) b!1260712))

(assert (= (and b!1260713 ((_ is ValueCellFull!15380) mapDefault!50233)) b!1260711))

(assert (= start!105840 b!1260713))

(declare-fun m!1161043 () Bool)

(assert (=> b!1260709 m!1161043))

(declare-fun m!1161045 () Bool)

(assert (=> mapNonEmpty!50233 m!1161045))

(declare-fun m!1161047 () Bool)

(assert (=> b!1260710 m!1161047))

(declare-fun m!1161049 () Bool)

(assert (=> b!1260710 m!1161049))

(declare-fun m!1161051 () Bool)

(assert (=> b!1260710 m!1161051))

(declare-fun m!1161053 () Bool)

(assert (=> start!105840 m!1161053))

(declare-fun m!1161055 () Bool)

(assert (=> start!105840 m!1161055))

(declare-fun m!1161057 () Bool)

(assert (=> start!105840 m!1161057))

(declare-fun m!1161059 () Bool)

(assert (=> b!1260708 m!1161059))

(check-sat (not b!1260709) (not start!105840) b_and!45275 tp_is_empty!32287 (not b!1260708) (not mapNonEmpty!50233) (not b!1260710) (not b_next!27385))
(check-sat b_and!45275 (not b_next!27385))
