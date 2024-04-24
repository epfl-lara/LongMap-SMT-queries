; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42304 () Bool)

(assert start!42304)

(declare-fun b_free!11809 () Bool)

(declare-fun b_next!11809 () Bool)

(assert (=> start!42304 (= b_free!11809 (not b_next!11809))))

(declare-fun tp!41458 () Bool)

(declare-fun b_and!20265 () Bool)

(assert (=> start!42304 (= tp!41458 b_and!20265)))

(declare-fun b!472071 () Bool)

(declare-fun e!276752 () Bool)

(declare-fun tp_is_empty!13237 () Bool)

(assert (=> b!472071 (= e!276752 tp_is_empty!13237)))

(declare-fun b!472072 () Bool)

(declare-fun e!276754 () Bool)

(assert (=> b!472072 (= e!276754 tp_is_empty!13237)))

(declare-fun res!282010 () Bool)

(declare-fun e!276750 () Bool)

(assert (=> start!42304 (=> (not res!282010) (not e!276750))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42304 (= res!282010 (validMask!0 mask!1365))))

(assert (=> start!42304 e!276750))

(assert (=> start!42304 tp_is_empty!13237))

(assert (=> start!42304 tp!41458))

(assert (=> start!42304 true))

(declare-datatypes ((array!30222 0))(
  ( (array!30223 (arr!14531 (Array (_ BitVec 32) (_ BitVec 64))) (size!14883 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30222)

(declare-fun array_inv!10570 (array!30222) Bool)

(assert (=> start!42304 (array_inv!10570 _keys!1025)))

(declare-datatypes ((V!18755 0))(
  ( (V!18756 (val!6663 Int)) )
))
(declare-datatypes ((ValueCell!6275 0))(
  ( (ValueCellFull!6275 (v!8955 V!18755)) (EmptyCell!6275) )
))
(declare-datatypes ((array!30224 0))(
  ( (array!30225 (arr!14532 (Array (_ BitVec 32) ValueCell!6275)) (size!14884 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30224)

(declare-fun e!276753 () Bool)

(declare-fun array_inv!10571 (array!30224) Bool)

(assert (=> start!42304 (and (array_inv!10571 _values!833) e!276753)))

(declare-fun b!472073 () Bool)

(declare-fun res!282008 () Bool)

(assert (=> b!472073 (=> (not res!282008) (not e!276750))))

(declare-datatypes ((List!8763 0))(
  ( (Nil!8760) (Cons!8759 (h!9615 (_ BitVec 64)) (t!14723 List!8763)) )
))
(declare-fun arrayNoDuplicates!0 (array!30222 (_ BitVec 32) List!8763) Bool)

(assert (=> b!472073 (= res!282008 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8760))))

(declare-fun mapNonEmpty!21565 () Bool)

(declare-fun mapRes!21565 () Bool)

(declare-fun tp!41457 () Bool)

(assert (=> mapNonEmpty!21565 (= mapRes!21565 (and tp!41457 e!276752))))

(declare-fun mapValue!21565 () ValueCell!6275)

(declare-fun mapRest!21565 () (Array (_ BitVec 32) ValueCell!6275))

(declare-fun mapKey!21565 () (_ BitVec 32))

(assert (=> mapNonEmpty!21565 (= (arr!14532 _values!833) (store mapRest!21565 mapKey!21565 mapValue!21565))))

(declare-fun b!472074 () Bool)

(assert (=> b!472074 (= e!276753 (and e!276754 mapRes!21565))))

(declare-fun condMapEmpty!21565 () Bool)

(declare-fun mapDefault!21565 () ValueCell!6275)

(assert (=> b!472074 (= condMapEmpty!21565 (= (arr!14532 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6275)) mapDefault!21565)))))

(declare-fun b!472075 () Bool)

(declare-fun res!282007 () Bool)

(assert (=> b!472075 (=> (not res!282007) (not e!276750))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472075 (= res!282007 (and (= (size!14884 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14883 _keys!1025) (size!14884 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21565 () Bool)

(assert (=> mapIsEmpty!21565 mapRes!21565))

(declare-fun b!472076 () Bool)

(declare-fun res!282009 () Bool)

(assert (=> b!472076 (=> (not res!282009) (not e!276750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30222 (_ BitVec 32)) Bool)

(assert (=> b!472076 (= res!282009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472077 () Bool)

(declare-fun e!276751 () Bool)

(assert (=> b!472077 (= e!276751 true)))

(declare-fun minValueBefore!38 () V!18755)

(declare-fun zeroValue!794 () V!18755)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8696 0))(
  ( (tuple2!8697 (_1!4359 (_ BitVec 64)) (_2!4359 V!18755)) )
))
(declare-datatypes ((List!8764 0))(
  ( (Nil!8761) (Cons!8760 (h!9616 tuple2!8696) (t!14724 List!8764)) )
))
(declare-datatypes ((ListLongMap!7611 0))(
  ( (ListLongMap!7612 (toList!3821 List!8764)) )
))
(declare-fun lt!214205 () ListLongMap!7611)

(declare-fun getCurrentListMap!2191 (array!30222 array!30224 (_ BitVec 32) (_ BitVec 32) V!18755 V!18755 (_ BitVec 32) Int) ListLongMap!7611)

(assert (=> b!472077 (= lt!214205 (getCurrentListMap!2191 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472078 () Bool)

(assert (=> b!472078 (= e!276750 (not e!276751))))

(declare-fun res!282011 () Bool)

(assert (=> b!472078 (=> res!282011 e!276751)))

(assert (=> b!472078 (= res!282011 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214206 () ListLongMap!7611)

(declare-fun lt!214203 () ListLongMap!7611)

(assert (=> b!472078 (= lt!214206 lt!214203)))

(declare-fun minValueAfter!38 () V!18755)

(declare-datatypes ((Unit!13855 0))(
  ( (Unit!13856) )
))
(declare-fun lt!214204 () Unit!13855)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!196 (array!30222 array!30224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18755 V!18755 V!18755 V!18755 (_ BitVec 32) Int) Unit!13855)

(assert (=> b!472078 (= lt!214204 (lemmaNoChangeToArrayThenSameMapNoExtras!196 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2036 (array!30222 array!30224 (_ BitVec 32) (_ BitVec 32) V!18755 V!18755 (_ BitVec 32) Int) ListLongMap!7611)

(assert (=> b!472078 (= lt!214203 (getCurrentListMapNoExtraKeys!2036 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472078 (= lt!214206 (getCurrentListMapNoExtraKeys!2036 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42304 res!282010) b!472075))

(assert (= (and b!472075 res!282007) b!472076))

(assert (= (and b!472076 res!282009) b!472073))

(assert (= (and b!472073 res!282008) b!472078))

(assert (= (and b!472078 (not res!282011)) b!472077))

(assert (= (and b!472074 condMapEmpty!21565) mapIsEmpty!21565))

(assert (= (and b!472074 (not condMapEmpty!21565)) mapNonEmpty!21565))

(get-info :version)

(assert (= (and mapNonEmpty!21565 ((_ is ValueCellFull!6275) mapValue!21565)) b!472071))

(assert (= (and b!472074 ((_ is ValueCellFull!6275) mapDefault!21565)) b!472072))

(assert (= start!42304 b!472074))

(declare-fun m!454339 () Bool)

(assert (=> b!472076 m!454339))

(declare-fun m!454341 () Bool)

(assert (=> mapNonEmpty!21565 m!454341))

(declare-fun m!454343 () Bool)

(assert (=> start!42304 m!454343))

(declare-fun m!454345 () Bool)

(assert (=> start!42304 m!454345))

(declare-fun m!454347 () Bool)

(assert (=> start!42304 m!454347))

(declare-fun m!454349 () Bool)

(assert (=> b!472073 m!454349))

(declare-fun m!454351 () Bool)

(assert (=> b!472078 m!454351))

(declare-fun m!454353 () Bool)

(assert (=> b!472078 m!454353))

(declare-fun m!454355 () Bool)

(assert (=> b!472078 m!454355))

(declare-fun m!454357 () Bool)

(assert (=> b!472077 m!454357))

(check-sat (not b_next!11809) (not b!472076) (not b!472078) tp_is_empty!13237 b_and!20265 (not start!42304) (not mapNonEmpty!21565) (not b!472077) (not b!472073))
(check-sat b_and!20265 (not b_next!11809))
