; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41502 () Bool)

(assert start!41502)

(declare-fun b_free!11169 () Bool)

(declare-fun b_next!11169 () Bool)

(assert (=> start!41502 (= b_free!11169 (not b_next!11169))))

(declare-fun tp!39504 () Bool)

(declare-fun b_and!19509 () Bool)

(assert (=> start!41502 (= tp!39504 b_and!19509)))

(declare-fun mapNonEmpty!20572 () Bool)

(declare-fun mapRes!20572 () Bool)

(declare-fun tp!39505 () Bool)

(declare-fun e!270715 () Bool)

(assert (=> mapNonEmpty!20572 (= mapRes!20572 (and tp!39505 e!270715))))

(declare-datatypes ((V!17901 0))(
  ( (V!17902 (val!6343 Int)) )
))
(declare-datatypes ((ValueCell!5955 0))(
  ( (ValueCellFull!5955 (v!8630 V!17901)) (EmptyCell!5955) )
))
(declare-datatypes ((array!28987 0))(
  ( (array!28988 (arr!13925 (Array (_ BitVec 32) ValueCell!5955)) (size!14277 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28987)

(declare-fun mapValue!20572 () ValueCell!5955)

(declare-fun mapRest!20572 () (Array (_ BitVec 32) ValueCell!5955))

(declare-fun mapKey!20572 () (_ BitVec 32))

(assert (=> mapNonEmpty!20572 (= (arr!13925 _values!833) (store mapRest!20572 mapKey!20572 mapValue!20572))))

(declare-fun mapIsEmpty!20572 () Bool)

(assert (=> mapIsEmpty!20572 mapRes!20572))

(declare-fun b!463621 () Bool)

(declare-fun e!270714 () Bool)

(declare-fun tp_is_empty!12597 () Bool)

(assert (=> b!463621 (= e!270714 tp_is_empty!12597)))

(declare-fun b!463622 () Bool)

(declare-fun e!270716 () Bool)

(assert (=> b!463622 (= e!270716 false)))

(declare-fun zeroValue!794 () V!17901)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28989 0))(
  ( (array!28990 (arr!13926 (Array (_ BitVec 32) (_ BitVec 64))) (size!14278 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28989)

(declare-fun minValueAfter!38 () V!17901)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8308 0))(
  ( (tuple2!8309 (_1!4165 (_ BitVec 64)) (_2!4165 V!17901)) )
))
(declare-datatypes ((List!8401 0))(
  ( (Nil!8398) (Cons!8397 (h!9253 tuple2!8308) (t!14347 List!8401)) )
))
(declare-datatypes ((ListLongMap!7221 0))(
  ( (ListLongMap!7222 (toList!3626 List!8401)) )
))
(declare-fun lt!209431 () ListLongMap!7221)

(declare-fun getCurrentListMapNoExtraKeys!1806 (array!28989 array!28987 (_ BitVec 32) (_ BitVec 32) V!17901 V!17901 (_ BitVec 32) Int) ListLongMap!7221)

(assert (=> b!463622 (= lt!209431 (getCurrentListMapNoExtraKeys!1806 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!209432 () ListLongMap!7221)

(declare-fun minValueBefore!38 () V!17901)

(assert (=> b!463622 (= lt!209432 (getCurrentListMapNoExtraKeys!1806 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!277207 () Bool)

(assert (=> start!41502 (=> (not res!277207) (not e!270716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41502 (= res!277207 (validMask!0 mask!1365))))

(assert (=> start!41502 e!270716))

(assert (=> start!41502 tp_is_empty!12597))

(assert (=> start!41502 tp!39504))

(assert (=> start!41502 true))

(declare-fun array_inv!10064 (array!28989) Bool)

(assert (=> start!41502 (array_inv!10064 _keys!1025)))

(declare-fun e!270717 () Bool)

(declare-fun array_inv!10065 (array!28987) Bool)

(assert (=> start!41502 (and (array_inv!10065 _values!833) e!270717)))

(declare-fun b!463623 () Bool)

(declare-fun res!277205 () Bool)

(assert (=> b!463623 (=> (not res!277205) (not e!270716))))

(assert (=> b!463623 (= res!277205 (and (= (size!14277 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14278 _keys!1025) (size!14277 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463624 () Bool)

(assert (=> b!463624 (= e!270715 tp_is_empty!12597)))

(declare-fun b!463625 () Bool)

(declare-fun res!277208 () Bool)

(assert (=> b!463625 (=> (not res!277208) (not e!270716))))

(declare-datatypes ((List!8402 0))(
  ( (Nil!8399) (Cons!8398 (h!9254 (_ BitVec 64)) (t!14348 List!8402)) )
))
(declare-fun arrayNoDuplicates!0 (array!28989 (_ BitVec 32) List!8402) Bool)

(assert (=> b!463625 (= res!277208 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8399))))

(declare-fun b!463626 () Bool)

(assert (=> b!463626 (= e!270717 (and e!270714 mapRes!20572))))

(declare-fun condMapEmpty!20572 () Bool)

(declare-fun mapDefault!20572 () ValueCell!5955)

(assert (=> b!463626 (= condMapEmpty!20572 (= (arr!13925 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5955)) mapDefault!20572)))))

(declare-fun b!463627 () Bool)

(declare-fun res!277206 () Bool)

(assert (=> b!463627 (=> (not res!277206) (not e!270716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28989 (_ BitVec 32)) Bool)

(assert (=> b!463627 (= res!277206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41502 res!277207) b!463623))

(assert (= (and b!463623 res!277205) b!463627))

(assert (= (and b!463627 res!277206) b!463625))

(assert (= (and b!463625 res!277208) b!463622))

(assert (= (and b!463626 condMapEmpty!20572) mapIsEmpty!20572))

(assert (= (and b!463626 (not condMapEmpty!20572)) mapNonEmpty!20572))

(get-info :version)

(assert (= (and mapNonEmpty!20572 ((_ is ValueCellFull!5955) mapValue!20572)) b!463624))

(assert (= (and b!463626 ((_ is ValueCellFull!5955) mapDefault!20572)) b!463621))

(assert (= start!41502 b!463626))

(declare-fun m!446169 () Bool)

(assert (=> b!463625 m!446169))

(declare-fun m!446171 () Bool)

(assert (=> mapNonEmpty!20572 m!446171))

(declare-fun m!446173 () Bool)

(assert (=> start!41502 m!446173))

(declare-fun m!446175 () Bool)

(assert (=> start!41502 m!446175))

(declare-fun m!446177 () Bool)

(assert (=> start!41502 m!446177))

(declare-fun m!446179 () Bool)

(assert (=> b!463627 m!446179))

(declare-fun m!446181 () Bool)

(assert (=> b!463622 m!446181))

(declare-fun m!446183 () Bool)

(assert (=> b!463622 m!446183))

(check-sat (not b_next!11169) tp_is_empty!12597 (not start!41502) (not b!463627) (not b!463625) (not mapNonEmpty!20572) b_and!19509 (not b!463622))
(check-sat b_and!19509 (not b_next!11169))
