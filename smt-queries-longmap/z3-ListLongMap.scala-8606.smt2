; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104882 () Bool)

(assert start!104882)

(declare-fun b_free!26673 () Bool)

(declare-fun b_next!26673 () Bool)

(assert (=> start!104882 (= b_free!26673 (not b_next!26673))))

(declare-fun tp!93511 () Bool)

(declare-fun b_and!44449 () Bool)

(assert (=> start!104882 (= tp!93511 b_and!44449)))

(declare-fun b!1250078 () Bool)

(declare-fun e!709596 () Bool)

(declare-fun e!709599 () Bool)

(assert (=> b!1250078 (= e!709596 e!709599)))

(declare-fun res!833833 () Bool)

(assert (=> b!1250078 (=> res!833833 e!709599)))

(declare-datatypes ((V!47465 0))(
  ( (V!47466 (val!15850 Int)) )
))
(declare-datatypes ((tuple2!20416 0))(
  ( (tuple2!20417 (_1!10219 (_ BitVec 64)) (_2!10219 V!47465)) )
))
(declare-datatypes ((List!27660 0))(
  ( (Nil!27657) (Cons!27656 (h!28865 tuple2!20416) (t!41133 List!27660)) )
))
(declare-datatypes ((ListLongMap!18289 0))(
  ( (ListLongMap!18290 (toList!9160 List!27660)) )
))
(declare-fun lt!564029 () ListLongMap!18289)

(declare-fun contains!7476 (ListLongMap!18289 (_ BitVec 64)) Bool)

(assert (=> b!1250078 (= res!833833 (contains!7476 lt!564029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47465)

(declare-datatypes ((array!80820 0))(
  ( (array!80821 (arr!38976 (Array (_ BitVec 32) (_ BitVec 64))) (size!39512 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80820)

(declare-datatypes ((ValueCell!15024 0))(
  ( (ValueCellFull!15024 (v!18546 V!47465)) (EmptyCell!15024) )
))
(declare-datatypes ((array!80822 0))(
  ( (array!80823 (arr!38977 (Array (_ BitVec 32) ValueCell!15024)) (size!39513 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80822)

(declare-fun minValueBefore!43 () V!47465)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun getCurrentListMap!4437 (array!80820 array!80822 (_ BitVec 32) (_ BitVec 32) V!47465 V!47465 (_ BitVec 32) Int) ListLongMap!18289)

(assert (=> b!1250078 (= lt!564029 (getCurrentListMap!4437 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250079 () Bool)

(declare-fun e!709598 () Bool)

(declare-fun e!709600 () Bool)

(declare-fun mapRes!49126 () Bool)

(assert (=> b!1250079 (= e!709598 (and e!709600 mapRes!49126))))

(declare-fun condMapEmpty!49126 () Bool)

(declare-fun mapDefault!49126 () ValueCell!15024)

(assert (=> b!1250079 (= condMapEmpty!49126 (= (arr!38977 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15024)) mapDefault!49126)))))

(declare-fun b!1250080 () Bool)

(declare-fun e!709597 () Bool)

(assert (=> b!1250080 (= e!709597 (not e!709596))))

(declare-fun res!833830 () Bool)

(assert (=> b!1250080 (=> res!833830 e!709596)))

(assert (=> b!1250080 (= res!833830 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564028 () ListLongMap!18289)

(declare-fun lt!564030 () ListLongMap!18289)

(assert (=> b!1250080 (= lt!564028 lt!564030)))

(declare-fun minValueAfter!43 () V!47465)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41517 0))(
  ( (Unit!41518) )
))
(declare-fun lt!564032 () Unit!41517)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!931 (array!80820 array!80822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47465 V!47465 V!47465 V!47465 (_ BitVec 32) Int) Unit!41517)

(assert (=> b!1250080 (= lt!564032 (lemmaNoChangeToArrayThenSameMapNoExtras!931 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5567 (array!80820 array!80822 (_ BitVec 32) (_ BitVec 32) V!47465 V!47465 (_ BitVec 32) Int) ListLongMap!18289)

(assert (=> b!1250080 (= lt!564030 (getCurrentListMapNoExtraKeys!5567 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250080 (= lt!564028 (getCurrentListMapNoExtraKeys!5567 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250081 () Bool)

(declare-fun res!833828 () Bool)

(assert (=> b!1250081 (=> (not res!833828) (not e!709597))))

(assert (=> b!1250081 (= res!833828 (and (= (size!39513 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39512 _keys!1118) (size!39513 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833829 () Bool)

(assert (=> start!104882 (=> (not res!833829) (not e!709597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104882 (= res!833829 (validMask!0 mask!1466))))

(assert (=> start!104882 e!709597))

(assert (=> start!104882 true))

(assert (=> start!104882 tp!93511))

(declare-fun tp_is_empty!31575 () Bool)

(assert (=> start!104882 tp_is_empty!31575))

(declare-fun array_inv!29739 (array!80820) Bool)

(assert (=> start!104882 (array_inv!29739 _keys!1118)))

(declare-fun array_inv!29740 (array!80822) Bool)

(assert (=> start!104882 (and (array_inv!29740 _values!914) e!709598)))

(declare-fun mapIsEmpty!49126 () Bool)

(assert (=> mapIsEmpty!49126 mapRes!49126))

(declare-fun mapNonEmpty!49126 () Bool)

(declare-fun tp!93512 () Bool)

(declare-fun e!709601 () Bool)

(assert (=> mapNonEmpty!49126 (= mapRes!49126 (and tp!93512 e!709601))))

(declare-fun mapRest!49126 () (Array (_ BitVec 32) ValueCell!15024))

(declare-fun mapKey!49126 () (_ BitVec 32))

(declare-fun mapValue!49126 () ValueCell!15024)

(assert (=> mapNonEmpty!49126 (= (arr!38977 _values!914) (store mapRest!49126 mapKey!49126 mapValue!49126))))

(declare-fun b!1250082 () Bool)

(declare-fun res!833831 () Bool)

(assert (=> b!1250082 (=> (not res!833831) (not e!709597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80820 (_ BitVec 32)) Bool)

(assert (=> b!1250082 (= res!833831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250083 () Bool)

(declare-fun res!833832 () Bool)

(assert (=> b!1250083 (=> (not res!833832) (not e!709597))))

(declare-datatypes ((List!27661 0))(
  ( (Nil!27658) (Cons!27657 (h!28866 (_ BitVec 64)) (t!41134 List!27661)) )
))
(declare-fun arrayNoDuplicates!0 (array!80820 (_ BitVec 32) List!27661) Bool)

(assert (=> b!1250083 (= res!833832 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27658))))

(declare-fun b!1250084 () Bool)

(assert (=> b!1250084 (= e!709599 true)))

(declare-fun -!1991 (ListLongMap!18289 (_ BitVec 64)) ListLongMap!18289)

(assert (=> b!1250084 (= (-!1991 lt!564029 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564029)))

(declare-fun lt!564031 () Unit!41517)

(declare-fun removeNotPresentStillSame!86 (ListLongMap!18289 (_ BitVec 64)) Unit!41517)

(assert (=> b!1250084 (= lt!564031 (removeNotPresentStillSame!86 lt!564029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250085 () Bool)

(assert (=> b!1250085 (= e!709600 tp_is_empty!31575)))

(declare-fun b!1250086 () Bool)

(assert (=> b!1250086 (= e!709601 tp_is_empty!31575)))

(assert (= (and start!104882 res!833829) b!1250081))

(assert (= (and b!1250081 res!833828) b!1250082))

(assert (= (and b!1250082 res!833831) b!1250083))

(assert (= (and b!1250083 res!833832) b!1250080))

(assert (= (and b!1250080 (not res!833830)) b!1250078))

(assert (= (and b!1250078 (not res!833833)) b!1250084))

(assert (= (and b!1250079 condMapEmpty!49126) mapIsEmpty!49126))

(assert (= (and b!1250079 (not condMapEmpty!49126)) mapNonEmpty!49126))

(get-info :version)

(assert (= (and mapNonEmpty!49126 ((_ is ValueCellFull!15024) mapValue!49126)) b!1250086))

(assert (= (and b!1250079 ((_ is ValueCellFull!15024) mapDefault!49126)) b!1250085))

(assert (= start!104882 b!1250079))

(declare-fun m!1150921 () Bool)

(assert (=> b!1250084 m!1150921))

(declare-fun m!1150923 () Bool)

(assert (=> b!1250084 m!1150923))

(declare-fun m!1150925 () Bool)

(assert (=> b!1250083 m!1150925))

(declare-fun m!1150927 () Bool)

(assert (=> b!1250078 m!1150927))

(declare-fun m!1150929 () Bool)

(assert (=> b!1250078 m!1150929))

(declare-fun m!1150931 () Bool)

(assert (=> b!1250080 m!1150931))

(declare-fun m!1150933 () Bool)

(assert (=> b!1250080 m!1150933))

(declare-fun m!1150935 () Bool)

(assert (=> b!1250080 m!1150935))

(declare-fun m!1150937 () Bool)

(assert (=> start!104882 m!1150937))

(declare-fun m!1150939 () Bool)

(assert (=> start!104882 m!1150939))

(declare-fun m!1150941 () Bool)

(assert (=> start!104882 m!1150941))

(declare-fun m!1150943 () Bool)

(assert (=> b!1250082 m!1150943))

(declare-fun m!1150945 () Bool)

(assert (=> mapNonEmpty!49126 m!1150945))

(check-sat (not b!1250083) (not b!1250082) (not mapNonEmpty!49126) (not start!104882) (not b!1250080) (not b!1250084) tp_is_empty!31575 b_and!44449 (not b_next!26673) (not b!1250078))
(check-sat b_and!44449 (not b_next!26673))
