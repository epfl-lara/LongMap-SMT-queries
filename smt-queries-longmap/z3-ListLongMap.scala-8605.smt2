; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104870 () Bool)

(assert start!104870)

(declare-fun b_free!26665 () Bool)

(declare-fun b_next!26665 () Bool)

(assert (=> start!104870 (= b_free!26665 (not b_next!26665))))

(declare-fun tp!93487 () Bool)

(declare-fun b_and!44423 () Bool)

(assert (=> start!104870 (= tp!93487 b_and!44423)))

(declare-fun b!1249888 () Bool)

(declare-fun res!833721 () Bool)

(declare-fun e!709469 () Bool)

(assert (=> b!1249888 (=> (not res!833721) (not e!709469))))

(declare-datatypes ((array!80727 0))(
  ( (array!80728 (arr!38930 (Array (_ BitVec 32) (_ BitVec 64))) (size!39468 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80727)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80727 (_ BitVec 32)) Bool)

(assert (=> b!1249888 (= res!833721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249889 () Bool)

(declare-fun e!709472 () Bool)

(declare-fun tp_is_empty!31567 () Bool)

(assert (=> b!1249889 (= e!709472 tp_is_empty!31567)))

(declare-fun mapIsEmpty!49114 () Bool)

(declare-fun mapRes!49114 () Bool)

(assert (=> mapIsEmpty!49114 mapRes!49114))

(declare-fun b!1249890 () Bool)

(declare-fun res!833720 () Bool)

(assert (=> b!1249890 (=> (not res!833720) (not e!709469))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47455 0))(
  ( (V!47456 (val!15846 Int)) )
))
(declare-datatypes ((ValueCell!15020 0))(
  ( (ValueCellFull!15020 (v!18541 V!47455)) (EmptyCell!15020) )
))
(declare-datatypes ((array!80729 0))(
  ( (array!80730 (arr!38931 (Array (_ BitVec 32) ValueCell!15020)) (size!39469 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80729)

(assert (=> b!1249890 (= res!833720 (and (= (size!39469 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39468 _keys!1118) (size!39469 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833716 () Bool)

(assert (=> start!104870 (=> (not res!833716) (not e!709469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104870 (= res!833716 (validMask!0 mask!1466))))

(assert (=> start!104870 e!709469))

(assert (=> start!104870 true))

(assert (=> start!104870 tp!93487))

(assert (=> start!104870 tp_is_empty!31567))

(declare-fun array_inv!29835 (array!80727) Bool)

(assert (=> start!104870 (array_inv!29835 _keys!1118)))

(declare-fun e!709466 () Bool)

(declare-fun array_inv!29836 (array!80729) Bool)

(assert (=> start!104870 (and (array_inv!29836 _values!914) e!709466)))

(declare-fun b!1249891 () Bool)

(declare-fun e!709468 () Bool)

(assert (=> b!1249891 (= e!709466 (and e!709468 mapRes!49114))))

(declare-fun condMapEmpty!49114 () Bool)

(declare-fun mapDefault!49114 () ValueCell!15020)

(assert (=> b!1249891 (= condMapEmpty!49114 (= (arr!38931 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15020)) mapDefault!49114)))))

(declare-fun mapNonEmpty!49114 () Bool)

(declare-fun tp!93488 () Bool)

(assert (=> mapNonEmpty!49114 (= mapRes!49114 (and tp!93488 e!709472))))

(declare-fun mapKey!49114 () (_ BitVec 32))

(declare-fun mapValue!49114 () ValueCell!15020)

(declare-fun mapRest!49114 () (Array (_ BitVec 32) ValueCell!15020))

(assert (=> mapNonEmpty!49114 (= (arr!38931 _values!914) (store mapRest!49114 mapKey!49114 mapValue!49114))))

(declare-fun b!1249892 () Bool)

(declare-fun e!709470 () Bool)

(assert (=> b!1249892 (= e!709469 (not e!709470))))

(declare-fun res!833719 () Bool)

(assert (=> b!1249892 (=> res!833719 e!709470)))

(assert (=> b!1249892 (= res!833719 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20492 0))(
  ( (tuple2!20493 (_1!10257 (_ BitVec 64)) (_2!10257 V!47455)) )
))
(declare-datatypes ((List!27720 0))(
  ( (Nil!27717) (Cons!27716 (h!28925 tuple2!20492) (t!41184 List!27720)) )
))
(declare-datatypes ((ListLongMap!18365 0))(
  ( (ListLongMap!18366 (toList!9198 List!27720)) )
))
(declare-fun lt!563791 () ListLongMap!18365)

(declare-fun lt!563790 () ListLongMap!18365)

(assert (=> b!1249892 (= lt!563791 lt!563790)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41364 0))(
  ( (Unit!41365) )
))
(declare-fun lt!563789 () Unit!41364)

(declare-fun minValueAfter!43 () V!47455)

(declare-fun zeroValue!871 () V!47455)

(declare-fun minValueBefore!43 () V!47455)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!937 (array!80727 array!80729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47455 V!47455 V!47455 V!47455 (_ BitVec 32) Int) Unit!41364)

(assert (=> b!1249892 (= lt!563789 (lemmaNoChangeToArrayThenSameMapNoExtras!937 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5615 (array!80727 array!80729 (_ BitVec 32) (_ BitVec 32) V!47455 V!47455 (_ BitVec 32) Int) ListLongMap!18365)

(assert (=> b!1249892 (= lt!563790 (getCurrentListMapNoExtraKeys!5615 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249892 (= lt!563791 (getCurrentListMapNoExtraKeys!5615 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249893 () Bool)

(assert (=> b!1249893 (= e!709468 tp_is_empty!31567)))

(declare-fun b!1249894 () Bool)

(declare-fun res!833718 () Bool)

(assert (=> b!1249894 (=> (not res!833718) (not e!709469))))

(declare-datatypes ((List!27721 0))(
  ( (Nil!27718) (Cons!27717 (h!28926 (_ BitVec 64)) (t!41185 List!27721)) )
))
(declare-fun arrayNoDuplicates!0 (array!80727 (_ BitVec 32) List!27721) Bool)

(assert (=> b!1249894 (= res!833718 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27718))))

(declare-fun b!1249895 () Bool)

(declare-fun e!709467 () Bool)

(assert (=> b!1249895 (= e!709467 true)))

(declare-fun lt!563792 () ListLongMap!18365)

(declare-fun -!1947 (ListLongMap!18365 (_ BitVec 64)) ListLongMap!18365)

(assert (=> b!1249895 (= (-!1947 lt!563792 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563792)))

(declare-fun lt!563793 () Unit!41364)

(declare-fun removeNotPresentStillSame!75 (ListLongMap!18365 (_ BitVec 64)) Unit!41364)

(assert (=> b!1249895 (= lt!563793 (removeNotPresentStillSame!75 lt!563792 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1249896 () Bool)

(assert (=> b!1249896 (= e!709470 e!709467)))

(declare-fun res!833717 () Bool)

(assert (=> b!1249896 (=> res!833717 e!709467)))

(declare-fun contains!7447 (ListLongMap!18365 (_ BitVec 64)) Bool)

(assert (=> b!1249896 (= res!833717 (contains!7447 lt!563792 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4374 (array!80727 array!80729 (_ BitVec 32) (_ BitVec 32) V!47455 V!47455 (_ BitVec 32) Int) ListLongMap!18365)

(assert (=> b!1249896 (= lt!563792 (getCurrentListMap!4374 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104870 res!833716) b!1249890))

(assert (= (and b!1249890 res!833720) b!1249888))

(assert (= (and b!1249888 res!833721) b!1249894))

(assert (= (and b!1249894 res!833718) b!1249892))

(assert (= (and b!1249892 (not res!833719)) b!1249896))

(assert (= (and b!1249896 (not res!833717)) b!1249895))

(assert (= (and b!1249891 condMapEmpty!49114) mapIsEmpty!49114))

(assert (= (and b!1249891 (not condMapEmpty!49114)) mapNonEmpty!49114))

(get-info :version)

(assert (= (and mapNonEmpty!49114 ((_ is ValueCellFull!15020) mapValue!49114)) b!1249889))

(assert (= (and b!1249891 ((_ is ValueCellFull!15020) mapDefault!49114)) b!1249893))

(assert (= start!104870 b!1249891))

(declare-fun m!1150297 () Bool)

(assert (=> b!1249895 m!1150297))

(declare-fun m!1150299 () Bool)

(assert (=> b!1249895 m!1150299))

(declare-fun m!1150301 () Bool)

(assert (=> b!1249888 m!1150301))

(declare-fun m!1150303 () Bool)

(assert (=> b!1249892 m!1150303))

(declare-fun m!1150305 () Bool)

(assert (=> b!1249892 m!1150305))

(declare-fun m!1150307 () Bool)

(assert (=> b!1249892 m!1150307))

(declare-fun m!1150309 () Bool)

(assert (=> mapNonEmpty!49114 m!1150309))

(declare-fun m!1150311 () Bool)

(assert (=> start!104870 m!1150311))

(declare-fun m!1150313 () Bool)

(assert (=> start!104870 m!1150313))

(declare-fun m!1150315 () Bool)

(assert (=> start!104870 m!1150315))

(declare-fun m!1150317 () Bool)

(assert (=> b!1249896 m!1150317))

(declare-fun m!1150319 () Bool)

(assert (=> b!1249896 m!1150319))

(declare-fun m!1150321 () Bool)

(assert (=> b!1249894 m!1150321))

(check-sat (not b!1249892) (not b!1249896) (not b!1249888) (not start!104870) (not b!1249894) tp_is_empty!31567 (not b_next!26665) (not mapNonEmpty!49114) b_and!44423 (not b!1249895))
(check-sat b_and!44423 (not b_next!26665))
