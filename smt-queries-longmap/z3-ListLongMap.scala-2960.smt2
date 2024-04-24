; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41982 () Bool)

(assert start!41982)

(declare-fun b_free!11569 () Bool)

(declare-fun b_next!11569 () Bool)

(assert (=> start!41982 (= b_free!11569 (not b_next!11569))))

(declare-fun tp!40723 () Bool)

(declare-fun b_and!19977 () Bool)

(assert (=> start!41982 (= tp!40723 b_and!19977)))

(declare-fun mapIsEmpty!21190 () Bool)

(declare-fun mapRes!21190 () Bool)

(assert (=> mapIsEmpty!21190 mapRes!21190))

(declare-fun b!468821 () Bool)

(declare-fun e!274444 () Bool)

(declare-fun tp_is_empty!12997 () Bool)

(assert (=> b!468821 (= e!274444 tp_is_empty!12997)))

(declare-fun b!468822 () Bool)

(declare-fun e!274445 () Bool)

(declare-fun e!274446 () Bool)

(assert (=> b!468822 (= e!274445 (not e!274446))))

(declare-fun res!280207 () Bool)

(assert (=> b!468822 (=> res!280207 e!274446)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468822 (= res!280207 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18435 0))(
  ( (V!18436 (val!6543 Int)) )
))
(declare-datatypes ((tuple2!8524 0))(
  ( (tuple2!8525 (_1!4273 (_ BitVec 64)) (_2!4273 V!18435)) )
))
(declare-datatypes ((List!8600 0))(
  ( (Nil!8597) (Cons!8596 (h!9452 tuple2!8524) (t!14550 List!8600)) )
))
(declare-datatypes ((ListLongMap!7439 0))(
  ( (ListLongMap!7440 (toList!3735 List!8600)) )
))
(declare-fun lt!212244 () ListLongMap!7439)

(declare-fun lt!212242 () ListLongMap!7439)

(assert (=> b!468822 (= lt!212244 lt!212242)))

(declare-fun minValueBefore!38 () V!18435)

(declare-fun zeroValue!794 () V!18435)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29754 0))(
  ( (array!29755 (arr!14302 (Array (_ BitVec 32) (_ BitVec 64))) (size!14654 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29754)

(declare-datatypes ((ValueCell!6155 0))(
  ( (ValueCellFull!6155 (v!8833 V!18435)) (EmptyCell!6155) )
))
(declare-datatypes ((array!29756 0))(
  ( (array!29757 (arr!14303 (Array (_ BitVec 32) ValueCell!6155)) (size!14655 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29756)

(declare-datatypes ((Unit!13679 0))(
  ( (Unit!13680) )
))
(declare-fun lt!212239 () Unit!13679)

(declare-fun minValueAfter!38 () V!18435)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!114 (array!29754 array!29756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18435 V!18435 V!18435 V!18435 (_ BitVec 32) Int) Unit!13679)

(assert (=> b!468822 (= lt!212239 (lemmaNoChangeToArrayThenSameMapNoExtras!114 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1954 (array!29754 array!29756 (_ BitVec 32) (_ BitVec 32) V!18435 V!18435 (_ BitVec 32) Int) ListLongMap!7439)

(assert (=> b!468822 (= lt!212242 (getCurrentListMapNoExtraKeys!1954 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468822 (= lt!212244 (getCurrentListMapNoExtraKeys!1954 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468823 () Bool)

(declare-fun e!274447 () Bool)

(declare-fun e!274443 () Bool)

(assert (=> b!468823 (= e!274447 (and e!274443 mapRes!21190))))

(declare-fun condMapEmpty!21190 () Bool)

(declare-fun mapDefault!21190 () ValueCell!6155)

(assert (=> b!468823 (= condMapEmpty!21190 (= (arr!14303 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6155)) mapDefault!21190)))))

(declare-fun b!468824 () Bool)

(declare-fun res!280203 () Bool)

(assert (=> b!468824 (=> (not res!280203) (not e!274445))))

(declare-datatypes ((List!8601 0))(
  ( (Nil!8598) (Cons!8597 (h!9453 (_ BitVec 64)) (t!14551 List!8601)) )
))
(declare-fun arrayNoDuplicates!0 (array!29754 (_ BitVec 32) List!8601) Bool)

(assert (=> b!468824 (= res!280203 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8598))))

(declare-fun res!280205 () Bool)

(assert (=> start!41982 (=> (not res!280205) (not e!274445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41982 (= res!280205 (validMask!0 mask!1365))))

(assert (=> start!41982 e!274445))

(assert (=> start!41982 tp_is_empty!12997))

(assert (=> start!41982 tp!40723))

(assert (=> start!41982 true))

(declare-fun array_inv!10416 (array!29754) Bool)

(assert (=> start!41982 (array_inv!10416 _keys!1025)))

(declare-fun array_inv!10417 (array!29756) Bool)

(assert (=> start!41982 (and (array_inv!10417 _values!833) e!274447)))

(declare-fun b!468825 () Bool)

(assert (=> b!468825 (= e!274443 tp_is_empty!12997)))

(declare-fun b!468826 () Bool)

(declare-fun res!280204 () Bool)

(assert (=> b!468826 (=> (not res!280204) (not e!274445))))

(assert (=> b!468826 (= res!280204 (and (= (size!14655 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14654 _keys!1025) (size!14655 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468827 () Bool)

(assert (=> b!468827 (= e!274446 true)))

(declare-fun lt!212245 () tuple2!8524)

(declare-fun +!1695 (ListLongMap!7439 tuple2!8524) ListLongMap!7439)

(assert (=> b!468827 (= (+!1695 lt!212244 lt!212245) (+!1695 (+!1695 lt!212244 (tuple2!8525 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212245))))

(assert (=> b!468827 (= lt!212245 (tuple2!8525 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212241 () Unit!13679)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!101 (ListLongMap!7439 (_ BitVec 64) V!18435 V!18435) Unit!13679)

(assert (=> b!468827 (= lt!212241 (addSameAsAddTwiceSameKeyDiffValues!101 lt!212244 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212240 () ListLongMap!7439)

(declare-fun getCurrentListMap!2161 (array!29754 array!29756 (_ BitVec 32) (_ BitVec 32) V!18435 V!18435 (_ BitVec 32) Int) ListLongMap!7439)

(assert (=> b!468827 (= lt!212240 (getCurrentListMap!2161 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212243 () ListLongMap!7439)

(assert (=> b!468827 (= lt!212243 (getCurrentListMap!2161 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468828 () Bool)

(declare-fun res!280206 () Bool)

(assert (=> b!468828 (=> (not res!280206) (not e!274445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29754 (_ BitVec 32)) Bool)

(assert (=> b!468828 (= res!280206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21190 () Bool)

(declare-fun tp!40722 () Bool)

(assert (=> mapNonEmpty!21190 (= mapRes!21190 (and tp!40722 e!274444))))

(declare-fun mapRest!21190 () (Array (_ BitVec 32) ValueCell!6155))

(declare-fun mapKey!21190 () (_ BitVec 32))

(declare-fun mapValue!21190 () ValueCell!6155)

(assert (=> mapNonEmpty!21190 (= (arr!14303 _values!833) (store mapRest!21190 mapKey!21190 mapValue!21190))))

(assert (= (and start!41982 res!280205) b!468826))

(assert (= (and b!468826 res!280204) b!468828))

(assert (= (and b!468828 res!280206) b!468824))

(assert (= (and b!468824 res!280203) b!468822))

(assert (= (and b!468822 (not res!280207)) b!468827))

(assert (= (and b!468823 condMapEmpty!21190) mapIsEmpty!21190))

(assert (= (and b!468823 (not condMapEmpty!21190)) mapNonEmpty!21190))

(get-info :version)

(assert (= (and mapNonEmpty!21190 ((_ is ValueCellFull!6155) mapValue!21190)) b!468821))

(assert (= (and b!468823 ((_ is ValueCellFull!6155) mapDefault!21190)) b!468825))

(assert (= start!41982 b!468823))

(declare-fun m!451113 () Bool)

(assert (=> b!468827 m!451113))

(assert (=> b!468827 m!451113))

(declare-fun m!451115 () Bool)

(assert (=> b!468827 m!451115))

(declare-fun m!451117 () Bool)

(assert (=> b!468827 m!451117))

(declare-fun m!451119 () Bool)

(assert (=> b!468827 m!451119))

(declare-fun m!451121 () Bool)

(assert (=> b!468827 m!451121))

(declare-fun m!451123 () Bool)

(assert (=> b!468827 m!451123))

(declare-fun m!451125 () Bool)

(assert (=> mapNonEmpty!21190 m!451125))

(declare-fun m!451127 () Bool)

(assert (=> b!468824 m!451127))

(declare-fun m!451129 () Bool)

(assert (=> b!468828 m!451129))

(declare-fun m!451131 () Bool)

(assert (=> start!41982 m!451131))

(declare-fun m!451133 () Bool)

(assert (=> start!41982 m!451133))

(declare-fun m!451135 () Bool)

(assert (=> start!41982 m!451135))

(declare-fun m!451137 () Bool)

(assert (=> b!468822 m!451137))

(declare-fun m!451139 () Bool)

(assert (=> b!468822 m!451139))

(declare-fun m!451141 () Bool)

(assert (=> b!468822 m!451141))

(check-sat (not b!468822) (not b_next!11569) (not b!468827) tp_is_empty!12997 b_and!19977 (not start!41982) (not mapNonEmpty!21190) (not b!468828) (not b!468824))
(check-sat b_and!19977 (not b_next!11569))
