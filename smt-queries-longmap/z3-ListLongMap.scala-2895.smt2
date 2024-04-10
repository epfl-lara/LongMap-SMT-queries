; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41514 () Bool)

(assert start!41514)

(declare-fun b_free!11181 () Bool)

(declare-fun b_next!11181 () Bool)

(assert (=> start!41514 (= b_free!11181 (not b_next!11181))))

(declare-fun tp!39541 () Bool)

(declare-fun b_and!19521 () Bool)

(assert (=> start!41514 (= tp!39541 b_and!19521)))

(declare-fun b!463747 () Bool)

(declare-fun e!270804 () Bool)

(declare-fun e!270807 () Bool)

(declare-fun mapRes!20590 () Bool)

(assert (=> b!463747 (= e!270804 (and e!270807 mapRes!20590))))

(declare-fun condMapEmpty!20590 () Bool)

(declare-datatypes ((V!17917 0))(
  ( (V!17918 (val!6349 Int)) )
))
(declare-datatypes ((ValueCell!5961 0))(
  ( (ValueCellFull!5961 (v!8636 V!17917)) (EmptyCell!5961) )
))
(declare-datatypes ((array!29009 0))(
  ( (array!29010 (arr!13936 (Array (_ BitVec 32) ValueCell!5961)) (size!14288 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29009)

(declare-fun mapDefault!20590 () ValueCell!5961)

(assert (=> b!463747 (= condMapEmpty!20590 (= (arr!13936 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5961)) mapDefault!20590)))))

(declare-fun b!463748 () Bool)

(declare-fun e!270806 () Bool)

(declare-fun tp_is_empty!12609 () Bool)

(assert (=> b!463748 (= e!270806 tp_is_empty!12609)))

(declare-fun mapNonEmpty!20590 () Bool)

(declare-fun tp!39540 () Bool)

(assert (=> mapNonEmpty!20590 (= mapRes!20590 (and tp!39540 e!270806))))

(declare-fun mapRest!20590 () (Array (_ BitVec 32) ValueCell!5961))

(declare-fun mapValue!20590 () ValueCell!5961)

(declare-fun mapKey!20590 () (_ BitVec 32))

(assert (=> mapNonEmpty!20590 (= (arr!13936 _values!833) (store mapRest!20590 mapKey!20590 mapValue!20590))))

(declare-fun b!463750 () Bool)

(declare-fun res!277280 () Bool)

(declare-fun e!270805 () Bool)

(assert (=> b!463750 (=> (not res!277280) (not e!270805))))

(declare-datatypes ((array!29011 0))(
  ( (array!29012 (arr!13937 (Array (_ BitVec 32) (_ BitVec 64))) (size!14289 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29011)

(declare-datatypes ((List!8410 0))(
  ( (Nil!8407) (Cons!8406 (h!9262 (_ BitVec 64)) (t!14356 List!8410)) )
))
(declare-fun arrayNoDuplicates!0 (array!29011 (_ BitVec 32) List!8410) Bool)

(assert (=> b!463750 (= res!277280 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8407))))

(declare-fun b!463749 () Bool)

(declare-fun res!277278 () Bool)

(assert (=> b!463749 (=> (not res!277278) (not e!270805))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29011 (_ BitVec 32)) Bool)

(assert (=> b!463749 (= res!277278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277279 () Bool)

(assert (=> start!41514 (=> (not res!277279) (not e!270805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41514 (= res!277279 (validMask!0 mask!1365))))

(assert (=> start!41514 e!270805))

(assert (=> start!41514 tp_is_empty!12609))

(assert (=> start!41514 tp!39541))

(assert (=> start!41514 true))

(declare-fun array_inv!10072 (array!29011) Bool)

(assert (=> start!41514 (array_inv!10072 _keys!1025)))

(declare-fun array_inv!10073 (array!29009) Bool)

(assert (=> start!41514 (and (array_inv!10073 _values!833) e!270804)))

(declare-fun mapIsEmpty!20590 () Bool)

(assert (=> mapIsEmpty!20590 mapRes!20590))

(declare-fun b!463751 () Bool)

(assert (=> b!463751 (= e!270805 false)))

(declare-fun zeroValue!794 () V!17917)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8316 0))(
  ( (tuple2!8317 (_1!4169 (_ BitVec 64)) (_2!4169 V!17917)) )
))
(declare-datatypes ((List!8411 0))(
  ( (Nil!8408) (Cons!8407 (h!9263 tuple2!8316) (t!14357 List!8411)) )
))
(declare-datatypes ((ListLongMap!7229 0))(
  ( (ListLongMap!7230 (toList!3630 List!8411)) )
))
(declare-fun lt!209468 () ListLongMap!7229)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17917)

(declare-fun getCurrentListMapNoExtraKeys!1810 (array!29011 array!29009 (_ BitVec 32) (_ BitVec 32) V!17917 V!17917 (_ BitVec 32) Int) ListLongMap!7229)

(assert (=> b!463751 (= lt!209468 (getCurrentListMapNoExtraKeys!1810 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17917)

(declare-fun lt!209467 () ListLongMap!7229)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463751 (= lt!209467 (getCurrentListMapNoExtraKeys!1810 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463752 () Bool)

(declare-fun res!277277 () Bool)

(assert (=> b!463752 (=> (not res!277277) (not e!270805))))

(assert (=> b!463752 (= res!277277 (and (= (size!14288 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14289 _keys!1025) (size!14288 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463753 () Bool)

(assert (=> b!463753 (= e!270807 tp_is_empty!12609)))

(assert (= (and start!41514 res!277279) b!463752))

(assert (= (and b!463752 res!277277) b!463749))

(assert (= (and b!463749 res!277278) b!463750))

(assert (= (and b!463750 res!277280) b!463751))

(assert (= (and b!463747 condMapEmpty!20590) mapIsEmpty!20590))

(assert (= (and b!463747 (not condMapEmpty!20590)) mapNonEmpty!20590))

(get-info :version)

(assert (= (and mapNonEmpty!20590 ((_ is ValueCellFull!5961) mapValue!20590)) b!463748))

(assert (= (and b!463747 ((_ is ValueCellFull!5961) mapDefault!20590)) b!463753))

(assert (= start!41514 b!463747))

(declare-fun m!446265 () Bool)

(assert (=> b!463749 m!446265))

(declare-fun m!446267 () Bool)

(assert (=> mapNonEmpty!20590 m!446267))

(declare-fun m!446269 () Bool)

(assert (=> start!41514 m!446269))

(declare-fun m!446271 () Bool)

(assert (=> start!41514 m!446271))

(declare-fun m!446273 () Bool)

(assert (=> start!41514 m!446273))

(declare-fun m!446275 () Bool)

(assert (=> b!463750 m!446275))

(declare-fun m!446277 () Bool)

(assert (=> b!463751 m!446277))

(declare-fun m!446279 () Bool)

(assert (=> b!463751 m!446279))

(check-sat (not mapNonEmpty!20590) b_and!19521 (not b_next!11181) (not b!463749) (not b!463750) (not start!41514) tp_is_empty!12609 (not b!463751))
(check-sat b_and!19521 (not b_next!11181))
