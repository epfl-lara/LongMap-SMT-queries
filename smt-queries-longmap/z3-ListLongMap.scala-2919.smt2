; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41670 () Bool)

(assert start!41670)

(declare-fun b_free!11323 () Bool)

(declare-fun b_next!11323 () Bool)

(assert (=> start!41670 (= b_free!11323 (not b_next!11323))))

(declare-fun tp!39972 () Bool)

(declare-fun b_and!19689 () Bool)

(assert (=> start!41670 (= tp!39972 b_and!19689)))

(declare-fun mapNonEmpty!20809 () Bool)

(declare-fun mapRes!20809 () Bool)

(declare-fun tp!39973 () Bool)

(declare-fun e!271941 () Bool)

(assert (=> mapNonEmpty!20809 (= mapRes!20809 (and tp!39973 e!271941))))

(declare-datatypes ((V!18107 0))(
  ( (V!18108 (val!6420 Int)) )
))
(declare-datatypes ((ValueCell!6032 0))(
  ( (ValueCellFull!6032 (v!8708 V!18107)) (EmptyCell!6032) )
))
(declare-datatypes ((array!29286 0))(
  ( (array!29287 (arr!14072 (Array (_ BitVec 32) ValueCell!6032)) (size!14424 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29286)

(declare-fun mapRest!20809 () (Array (_ BitVec 32) ValueCell!6032))

(declare-fun mapValue!20809 () ValueCell!6032)

(declare-fun mapKey!20809 () (_ BitVec 32))

(assert (=> mapNonEmpty!20809 (= (arr!14072 _values!833) (store mapRest!20809 mapKey!20809 mapValue!20809))))

(declare-fun b!465349 () Bool)

(declare-fun e!271943 () Bool)

(declare-fun e!271946 () Bool)

(assert (=> b!465349 (= e!271943 (not e!271946))))

(declare-fun res!278189 () Bool)

(assert (=> b!465349 (=> res!278189 e!271946)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465349 (= res!278189 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8348 0))(
  ( (tuple2!8349 (_1!4185 (_ BitVec 64)) (_2!4185 V!18107)) )
))
(declare-datatypes ((List!8436 0))(
  ( (Nil!8433) (Cons!8432 (h!9288 tuple2!8348) (t!14378 List!8436)) )
))
(declare-datatypes ((ListLongMap!7263 0))(
  ( (ListLongMap!7264 (toList!3647 List!8436)) )
))
(declare-fun lt!210157 () ListLongMap!7263)

(declare-fun lt!210153 () ListLongMap!7263)

(assert (=> b!465349 (= lt!210157 lt!210153)))

(declare-fun minValueBefore!38 () V!18107)

(declare-fun zeroValue!794 () V!18107)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((array!29288 0))(
  ( (array!29289 (arr!14073 (Array (_ BitVec 32) (_ BitVec 64))) (size!14425 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29288)

(declare-fun minValueAfter!38 () V!18107)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13512 0))(
  ( (Unit!13513) )
))
(declare-fun lt!210155 () Unit!13512)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!34 (array!29288 array!29286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18107 V!18107 V!18107 V!18107 (_ BitVec 32) Int) Unit!13512)

(assert (=> b!465349 (= lt!210155 (lemmaNoChangeToArrayThenSameMapNoExtras!34 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1874 (array!29288 array!29286 (_ BitVec 32) (_ BitVec 32) V!18107 V!18107 (_ BitVec 32) Int) ListLongMap!7263)

(assert (=> b!465349 (= lt!210153 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465349 (= lt!210157 (getCurrentListMapNoExtraKeys!1874 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20809 () Bool)

(assert (=> mapIsEmpty!20809 mapRes!20809))

(declare-fun b!465350 () Bool)

(declare-fun tp_is_empty!12751 () Bool)

(assert (=> b!465350 (= e!271941 tp_is_empty!12751)))

(declare-fun b!465351 () Bool)

(declare-fun res!278186 () Bool)

(assert (=> b!465351 (=> (not res!278186) (not e!271943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29288 (_ BitVec 32)) Bool)

(assert (=> b!465351 (= res!278186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465352 () Bool)

(declare-fun e!271942 () Bool)

(assert (=> b!465352 (= e!271942 tp_is_empty!12751)))

(declare-fun res!278187 () Bool)

(assert (=> start!41670 (=> (not res!278187) (not e!271943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41670 (= res!278187 (validMask!0 mask!1365))))

(assert (=> start!41670 e!271943))

(assert (=> start!41670 tp_is_empty!12751))

(assert (=> start!41670 tp!39972))

(assert (=> start!41670 true))

(declare-fun array_inv!10244 (array!29288) Bool)

(assert (=> start!41670 (array_inv!10244 _keys!1025)))

(declare-fun e!271944 () Bool)

(declare-fun array_inv!10245 (array!29286) Bool)

(assert (=> start!41670 (and (array_inv!10245 _values!833) e!271944)))

(declare-fun b!465353 () Bool)

(declare-fun res!278190 () Bool)

(assert (=> b!465353 (=> (not res!278190) (not e!271943))))

(declare-datatypes ((List!8437 0))(
  ( (Nil!8434) (Cons!8433 (h!9289 (_ BitVec 64)) (t!14379 List!8437)) )
))
(declare-fun arrayNoDuplicates!0 (array!29288 (_ BitVec 32) List!8437) Bool)

(assert (=> b!465353 (= res!278190 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8434))))

(declare-fun b!465354 () Bool)

(assert (=> b!465354 (= e!271946 true)))

(declare-fun lt!210156 () ListLongMap!7263)

(declare-fun getCurrentListMap!2100 (array!29288 array!29286 (_ BitVec 32) (_ BitVec 32) V!18107 V!18107 (_ BitVec 32) Int) ListLongMap!7263)

(assert (=> b!465354 (= lt!210156 (getCurrentListMap!2100 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210154 () ListLongMap!7263)

(declare-fun +!1649 (ListLongMap!7263 tuple2!8348) ListLongMap!7263)

(assert (=> b!465354 (= lt!210154 (+!1649 (getCurrentListMap!2100 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8349 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465355 () Bool)

(assert (=> b!465355 (= e!271944 (and e!271942 mapRes!20809))))

(declare-fun condMapEmpty!20809 () Bool)

(declare-fun mapDefault!20809 () ValueCell!6032)

(assert (=> b!465355 (= condMapEmpty!20809 (= (arr!14072 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6032)) mapDefault!20809)))))

(declare-fun b!465356 () Bool)

(declare-fun res!278188 () Bool)

(assert (=> b!465356 (=> (not res!278188) (not e!271943))))

(assert (=> b!465356 (= res!278188 (and (= (size!14424 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14425 _keys!1025) (size!14424 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41670 res!278187) b!465356))

(assert (= (and b!465356 res!278188) b!465351))

(assert (= (and b!465351 res!278186) b!465353))

(assert (= (and b!465353 res!278190) b!465349))

(assert (= (and b!465349 (not res!278189)) b!465354))

(assert (= (and b!465355 condMapEmpty!20809) mapIsEmpty!20809))

(assert (= (and b!465355 (not condMapEmpty!20809)) mapNonEmpty!20809))

(get-info :version)

(assert (= (and mapNonEmpty!20809 ((_ is ValueCellFull!6032) mapValue!20809)) b!465350))

(assert (= (and b!465355 ((_ is ValueCellFull!6032) mapDefault!20809)) b!465352))

(assert (= start!41670 b!465355))

(declare-fun m!447823 () Bool)

(assert (=> mapNonEmpty!20809 m!447823))

(declare-fun m!447825 () Bool)

(assert (=> start!41670 m!447825))

(declare-fun m!447827 () Bool)

(assert (=> start!41670 m!447827))

(declare-fun m!447829 () Bool)

(assert (=> start!41670 m!447829))

(declare-fun m!447831 () Bool)

(assert (=> b!465354 m!447831))

(declare-fun m!447833 () Bool)

(assert (=> b!465354 m!447833))

(assert (=> b!465354 m!447833))

(declare-fun m!447835 () Bool)

(assert (=> b!465354 m!447835))

(declare-fun m!447837 () Bool)

(assert (=> b!465351 m!447837))

(declare-fun m!447839 () Bool)

(assert (=> b!465349 m!447839))

(declare-fun m!447841 () Bool)

(assert (=> b!465349 m!447841))

(declare-fun m!447843 () Bool)

(assert (=> b!465349 m!447843))

(declare-fun m!447845 () Bool)

(assert (=> b!465353 m!447845))

(check-sat (not b!465354) (not b!465353) (not b!465351) tp_is_empty!12751 (not b!465349) b_and!19689 (not mapNonEmpty!20809) (not start!41670) (not b_next!11323))
(check-sat b_and!19689 (not b_next!11323))
