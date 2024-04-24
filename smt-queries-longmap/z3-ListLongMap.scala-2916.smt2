; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41638 () Bool)

(assert start!41638)

(declare-fun b_free!11305 () Bool)

(declare-fun b_next!11305 () Bool)

(assert (=> start!41638 (= b_free!11305 (not b_next!11305))))

(declare-fun tp!39916 () Bool)

(declare-fun b_and!19663 () Bool)

(assert (=> start!41638 (= tp!39916 b_and!19663)))

(declare-fun b!465073 () Bool)

(declare-fun res!278047 () Bool)

(declare-fun e!271749 () Bool)

(assert (=> b!465073 (=> (not res!278047) (not e!271749))))

(declare-datatypes ((array!29248 0))(
  ( (array!29249 (arr!14054 (Array (_ BitVec 32) (_ BitVec 64))) (size!14406 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29248)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29248 (_ BitVec 32)) Bool)

(assert (=> b!465073 (= res!278047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20779 () Bool)

(declare-fun mapRes!20779 () Bool)

(declare-fun tp!39915 () Bool)

(declare-fun e!271752 () Bool)

(assert (=> mapNonEmpty!20779 (= mapRes!20779 (and tp!39915 e!271752))))

(declare-datatypes ((V!18083 0))(
  ( (V!18084 (val!6411 Int)) )
))
(declare-datatypes ((ValueCell!6023 0))(
  ( (ValueCellFull!6023 (v!8699 V!18083)) (EmptyCell!6023) )
))
(declare-datatypes ((array!29250 0))(
  ( (array!29251 (arr!14055 (Array (_ BitVec 32) ValueCell!6023)) (size!14407 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29250)

(declare-fun mapValue!20779 () ValueCell!6023)

(declare-fun mapKey!20779 () (_ BitVec 32))

(declare-fun mapRest!20779 () (Array (_ BitVec 32) ValueCell!6023))

(assert (=> mapNonEmpty!20779 (= (arr!14055 _values!833) (store mapRest!20779 mapKey!20779 mapValue!20779))))

(declare-fun b!465074 () Bool)

(declare-fun e!271753 () Bool)

(declare-fun tp_is_empty!12733 () Bool)

(assert (=> b!465074 (= e!271753 tp_is_empty!12733)))

(declare-fun mapIsEmpty!20779 () Bool)

(assert (=> mapIsEmpty!20779 mapRes!20779))

(declare-fun b!465075 () Bool)

(declare-fun res!278048 () Bool)

(assert (=> b!465075 (=> (not res!278048) (not e!271749))))

(declare-datatypes ((List!8425 0))(
  ( (Nil!8422) (Cons!8421 (h!9277 (_ BitVec 64)) (t!14365 List!8425)) )
))
(declare-fun arrayNoDuplicates!0 (array!29248 (_ BitVec 32) List!8425) Bool)

(assert (=> b!465075 (= res!278048 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8422))))

(declare-fun b!465076 () Bool)

(assert (=> b!465076 (= e!271752 tp_is_empty!12733)))

(declare-fun b!465077 () Bool)

(assert (=> b!465077 (= e!271749 (not true))))

(declare-datatypes ((tuple2!8338 0))(
  ( (tuple2!8339 (_1!4180 (_ BitVec 64)) (_2!4180 V!18083)) )
))
(declare-datatypes ((List!8426 0))(
  ( (Nil!8423) (Cons!8422 (h!9278 tuple2!8338) (t!14366 List!8426)) )
))
(declare-datatypes ((ListLongMap!7253 0))(
  ( (ListLongMap!7254 (toList!3642 List!8426)) )
))
(declare-fun lt!210030 () ListLongMap!7253)

(declare-fun lt!210028 () ListLongMap!7253)

(assert (=> b!465077 (= lt!210030 lt!210028)))

(declare-fun zeroValue!794 () V!18083)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13502 0))(
  ( (Unit!13503) )
))
(declare-fun lt!210029 () Unit!13502)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18083)

(declare-fun minValueAfter!38 () V!18083)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!29 (array!29248 array!29250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18083 V!18083 V!18083 V!18083 (_ BitVec 32) Int) Unit!13502)

(assert (=> b!465077 (= lt!210029 (lemmaNoChangeToArrayThenSameMapNoExtras!29 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1869 (array!29248 array!29250 (_ BitVec 32) (_ BitVec 32) V!18083 V!18083 (_ BitVec 32) Int) ListLongMap!7253)

(assert (=> b!465077 (= lt!210028 (getCurrentListMapNoExtraKeys!1869 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465077 (= lt!210030 (getCurrentListMapNoExtraKeys!1869 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!278046 () Bool)

(assert (=> start!41638 (=> (not res!278046) (not e!271749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41638 (= res!278046 (validMask!0 mask!1365))))

(assert (=> start!41638 e!271749))

(assert (=> start!41638 tp_is_empty!12733))

(assert (=> start!41638 tp!39916))

(assert (=> start!41638 true))

(declare-fun array_inv!10234 (array!29248) Bool)

(assert (=> start!41638 (array_inv!10234 _keys!1025)))

(declare-fun e!271750 () Bool)

(declare-fun array_inv!10235 (array!29250) Bool)

(assert (=> start!41638 (and (array_inv!10235 _values!833) e!271750)))

(declare-fun b!465078 () Bool)

(assert (=> b!465078 (= e!271750 (and e!271753 mapRes!20779))))

(declare-fun condMapEmpty!20779 () Bool)

(declare-fun mapDefault!20779 () ValueCell!6023)

(assert (=> b!465078 (= condMapEmpty!20779 (= (arr!14055 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6023)) mapDefault!20779)))))

(declare-fun b!465079 () Bool)

(declare-fun res!278045 () Bool)

(assert (=> b!465079 (=> (not res!278045) (not e!271749))))

(assert (=> b!465079 (= res!278045 (and (= (size!14407 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14406 _keys!1025) (size!14407 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41638 res!278046) b!465079))

(assert (= (and b!465079 res!278045) b!465073))

(assert (= (and b!465073 res!278047) b!465075))

(assert (= (and b!465075 res!278048) b!465077))

(assert (= (and b!465078 condMapEmpty!20779) mapIsEmpty!20779))

(assert (= (and b!465078 (not condMapEmpty!20779)) mapNonEmpty!20779))

(get-info :version)

(assert (= (and mapNonEmpty!20779 ((_ is ValueCellFull!6023) mapValue!20779)) b!465076))

(assert (= (and b!465078 ((_ is ValueCellFull!6023) mapDefault!20779)) b!465074))

(assert (= start!41638 b!465078))

(declare-fun m!447595 () Bool)

(assert (=> b!465077 m!447595))

(declare-fun m!447597 () Bool)

(assert (=> b!465077 m!447597))

(declare-fun m!447599 () Bool)

(assert (=> b!465077 m!447599))

(declare-fun m!447601 () Bool)

(assert (=> mapNonEmpty!20779 m!447601))

(declare-fun m!447603 () Bool)

(assert (=> b!465075 m!447603))

(declare-fun m!447605 () Bool)

(assert (=> b!465073 m!447605))

(declare-fun m!447607 () Bool)

(assert (=> start!41638 m!447607))

(declare-fun m!447609 () Bool)

(assert (=> start!41638 m!447609))

(declare-fun m!447611 () Bool)

(assert (=> start!41638 m!447611))

(check-sat tp_is_empty!12733 b_and!19663 (not b!465073) (not start!41638) (not mapNonEmpty!20779) (not b!465077) (not b_next!11305) (not b!465075))
(check-sat b_and!19663 (not b_next!11305))
