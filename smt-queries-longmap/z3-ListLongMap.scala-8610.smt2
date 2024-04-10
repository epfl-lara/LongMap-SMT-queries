; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104906 () Bool)

(assert start!104906)

(declare-fun b_free!26697 () Bool)

(declare-fun b_next!26697 () Bool)

(assert (=> start!104906 (= b_free!26697 (not b_next!26697))))

(declare-fun tp!93583 () Bool)

(declare-fun b_and!44473 () Bool)

(assert (=> start!104906 (= tp!93583 b_and!44473)))

(declare-fun b!1250402 () Bool)

(declare-fun res!834048 () Bool)

(declare-fun e!709853 () Bool)

(assert (=> b!1250402 (=> (not res!834048) (not e!709853))))

(declare-datatypes ((array!80866 0))(
  ( (array!80867 (arr!38999 (Array (_ BitVec 32) (_ BitVec 64))) (size!39535 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80866)

(declare-datatypes ((List!27677 0))(
  ( (Nil!27674) (Cons!27673 (h!28882 (_ BitVec 64)) (t!41150 List!27677)) )
))
(declare-fun arrayNoDuplicates!0 (array!80866 (_ BitVec 32) List!27677) Bool)

(assert (=> b!1250402 (= res!834048 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27674))))

(declare-fun b!1250404 () Bool)

(declare-fun e!709851 () Bool)

(declare-fun tp_is_empty!31599 () Bool)

(assert (=> b!1250404 (= e!709851 tp_is_empty!31599)))

(declare-fun mapIsEmpty!49162 () Bool)

(declare-fun mapRes!49162 () Bool)

(assert (=> mapIsEmpty!49162 mapRes!49162))

(declare-fun b!1250405 () Bool)

(declare-fun res!834046 () Bool)

(assert (=> b!1250405 (=> (not res!834046) (not e!709853))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47497 0))(
  ( (V!47498 (val!15862 Int)) )
))
(declare-datatypes ((ValueCell!15036 0))(
  ( (ValueCellFull!15036 (v!18558 V!47497)) (EmptyCell!15036) )
))
(declare-datatypes ((array!80868 0))(
  ( (array!80869 (arr!39000 (Array (_ BitVec 32) ValueCell!15036)) (size!39536 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80868)

(assert (=> b!1250405 (= res!834046 (and (= (size!39536 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39535 _keys!1118) (size!39536 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250406 () Bool)

(declare-fun e!709849 () Bool)

(assert (=> b!1250406 (= e!709849 (and e!709851 mapRes!49162))))

(declare-fun condMapEmpty!49162 () Bool)

(declare-fun mapDefault!49162 () ValueCell!15036)

(assert (=> b!1250406 (= condMapEmpty!49162 (= (arr!39000 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15036)) mapDefault!49162)))))

(declare-fun b!1250407 () Bool)

(declare-fun e!709847 () Bool)

(assert (=> b!1250407 (= e!709847 tp_is_empty!31599)))

(declare-fun b!1250408 () Bool)

(declare-fun res!834044 () Bool)

(assert (=> b!1250408 (=> (not res!834044) (not e!709853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80866 (_ BitVec 32)) Bool)

(assert (=> b!1250408 (= res!834044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250409 () Bool)

(declare-fun e!709852 () Bool)

(assert (=> b!1250409 (= e!709853 (not e!709852))))

(declare-fun res!834047 () Bool)

(assert (=> b!1250409 (=> res!834047 e!709852)))

(assert (=> b!1250409 (= res!834047 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20436 0))(
  ( (tuple2!20437 (_1!10229 (_ BitVec 64)) (_2!10229 V!47497)) )
))
(declare-datatypes ((List!27678 0))(
  ( (Nil!27675) (Cons!27674 (h!28883 tuple2!20436) (t!41151 List!27678)) )
))
(declare-datatypes ((ListLongMap!18309 0))(
  ( (ListLongMap!18310 (toList!9170 List!27678)) )
))
(declare-fun lt!564211 () ListLongMap!18309)

(declare-fun lt!564208 () ListLongMap!18309)

(assert (=> b!1250409 (= lt!564211 lt!564208)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47497)

(declare-fun zeroValue!871 () V!47497)

(declare-datatypes ((Unit!41531 0))(
  ( (Unit!41532) )
))
(declare-fun lt!564212 () Unit!41531)

(declare-fun minValueBefore!43 () V!47497)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!937 (array!80866 array!80868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47497 V!47497 V!47497 V!47497 (_ BitVec 32) Int) Unit!41531)

(assert (=> b!1250409 (= lt!564212 (lemmaNoChangeToArrayThenSameMapNoExtras!937 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5573 (array!80866 array!80868 (_ BitVec 32) (_ BitVec 32) V!47497 V!47497 (_ BitVec 32) Int) ListLongMap!18309)

(assert (=> b!1250409 (= lt!564208 (getCurrentListMapNoExtraKeys!5573 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250409 (= lt!564211 (getCurrentListMapNoExtraKeys!5573 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250403 () Bool)

(declare-fun e!709848 () Bool)

(assert (=> b!1250403 (= e!709848 true)))

(declare-fun lt!564209 () ListLongMap!18309)

(declare-fun -!1998 (ListLongMap!18309 (_ BitVec 64)) ListLongMap!18309)

(assert (=> b!1250403 (= (-!1998 lt!564209 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564209)))

(declare-fun lt!564210 () Unit!41531)

(declare-fun removeNotPresentStillSame!93 (ListLongMap!18309 (_ BitVec 64)) Unit!41531)

(assert (=> b!1250403 (= lt!564210 (removeNotPresentStillSame!93 lt!564209 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!834045 () Bool)

(assert (=> start!104906 (=> (not res!834045) (not e!709853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104906 (= res!834045 (validMask!0 mask!1466))))

(assert (=> start!104906 e!709853))

(assert (=> start!104906 true))

(assert (=> start!104906 tp!93583))

(assert (=> start!104906 tp_is_empty!31599))

(declare-fun array_inv!29753 (array!80866) Bool)

(assert (=> start!104906 (array_inv!29753 _keys!1118)))

(declare-fun array_inv!29754 (array!80868) Bool)

(assert (=> start!104906 (and (array_inv!29754 _values!914) e!709849)))

(declare-fun b!1250410 () Bool)

(assert (=> b!1250410 (= e!709852 e!709848)))

(declare-fun res!834049 () Bool)

(assert (=> b!1250410 (=> res!834049 e!709848)))

(declare-fun contains!7486 (ListLongMap!18309 (_ BitVec 64)) Bool)

(assert (=> b!1250410 (= res!834049 (contains!7486 lt!564209 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4447 (array!80866 array!80868 (_ BitVec 32) (_ BitVec 32) V!47497 V!47497 (_ BitVec 32) Int) ListLongMap!18309)

(assert (=> b!1250410 (= lt!564209 (getCurrentListMap!4447 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49162 () Bool)

(declare-fun tp!93584 () Bool)

(assert (=> mapNonEmpty!49162 (= mapRes!49162 (and tp!93584 e!709847))))

(declare-fun mapRest!49162 () (Array (_ BitVec 32) ValueCell!15036))

(declare-fun mapValue!49162 () ValueCell!15036)

(declare-fun mapKey!49162 () (_ BitVec 32))

(assert (=> mapNonEmpty!49162 (= (arr!39000 _values!914) (store mapRest!49162 mapKey!49162 mapValue!49162))))

(assert (= (and start!104906 res!834045) b!1250405))

(assert (= (and b!1250405 res!834046) b!1250408))

(assert (= (and b!1250408 res!834044) b!1250402))

(assert (= (and b!1250402 res!834048) b!1250409))

(assert (= (and b!1250409 (not res!834047)) b!1250410))

(assert (= (and b!1250410 (not res!834049)) b!1250403))

(assert (= (and b!1250406 condMapEmpty!49162) mapIsEmpty!49162))

(assert (= (and b!1250406 (not condMapEmpty!49162)) mapNonEmpty!49162))

(get-info :version)

(assert (= (and mapNonEmpty!49162 ((_ is ValueCellFull!15036) mapValue!49162)) b!1250407))

(assert (= (and b!1250406 ((_ is ValueCellFull!15036) mapDefault!49162)) b!1250404))

(assert (= start!104906 b!1250406))

(declare-fun m!1151233 () Bool)

(assert (=> mapNonEmpty!49162 m!1151233))

(declare-fun m!1151235 () Bool)

(assert (=> b!1250409 m!1151235))

(declare-fun m!1151237 () Bool)

(assert (=> b!1250409 m!1151237))

(declare-fun m!1151239 () Bool)

(assert (=> b!1250409 m!1151239))

(declare-fun m!1151241 () Bool)

(assert (=> b!1250402 m!1151241))

(declare-fun m!1151243 () Bool)

(assert (=> b!1250410 m!1151243))

(declare-fun m!1151245 () Bool)

(assert (=> b!1250410 m!1151245))

(declare-fun m!1151247 () Bool)

(assert (=> b!1250408 m!1151247))

(declare-fun m!1151249 () Bool)

(assert (=> start!104906 m!1151249))

(declare-fun m!1151251 () Bool)

(assert (=> start!104906 m!1151251))

(declare-fun m!1151253 () Bool)

(assert (=> start!104906 m!1151253))

(declare-fun m!1151255 () Bool)

(assert (=> b!1250403 m!1151255))

(declare-fun m!1151257 () Bool)

(assert (=> b!1250403 m!1151257))

(check-sat (not start!104906) (not b!1250408) b_and!44473 (not mapNonEmpty!49162) tp_is_empty!31599 (not b!1250402) (not b!1250410) (not b_next!26697) (not b!1250409) (not b!1250403))
(check-sat b_and!44473 (not b_next!26697))
