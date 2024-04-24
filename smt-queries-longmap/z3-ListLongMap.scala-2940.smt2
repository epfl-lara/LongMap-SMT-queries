; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41832 () Bool)

(assert start!41832)

(declare-fun b_free!11449 () Bool)

(declare-fun b_next!11449 () Bool)

(assert (=> start!41832 (= b_free!11449 (not b_next!11449))))

(declare-fun tp!40356 () Bool)

(declare-fun b_and!19839 () Bool)

(assert (=> start!41832 (= tp!40356 b_and!19839)))

(declare-fun mapNonEmpty!21004 () Bool)

(declare-fun mapRes!21004 () Bool)

(declare-fun tp!40357 () Bool)

(declare-fun e!273270 () Bool)

(assert (=> mapNonEmpty!21004 (= mapRes!21004 (and tp!40357 e!273270))))

(declare-datatypes ((V!18275 0))(
  ( (V!18276 (val!6483 Int)) )
))
(declare-datatypes ((ValueCell!6095 0))(
  ( (ValueCellFull!6095 (v!8773 V!18275)) (EmptyCell!6095) )
))
(declare-datatypes ((array!29524 0))(
  ( (array!29525 (arr!14189 (Array (_ BitVec 32) ValueCell!6095)) (size!14541 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29524)

(declare-fun mapRest!21004 () (Array (_ BitVec 32) ValueCell!6095))

(declare-fun mapValue!21004 () ValueCell!6095)

(declare-fun mapKey!21004 () (_ BitVec 32))

(assert (=> mapNonEmpty!21004 (= (arr!14189 _values!833) (store mapRest!21004 mapKey!21004 mapValue!21004))))

(declare-fun res!279269 () Bool)

(declare-fun e!273267 () Bool)

(assert (=> start!41832 (=> (not res!279269) (not e!273267))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41832 (= res!279269 (validMask!0 mask!1365))))

(assert (=> start!41832 e!273267))

(declare-fun tp_is_empty!12877 () Bool)

(assert (=> start!41832 tp_is_empty!12877))

(assert (=> start!41832 tp!40356))

(assert (=> start!41832 true))

(declare-datatypes ((array!29526 0))(
  ( (array!29527 (arr!14190 (Array (_ BitVec 32) (_ BitVec 64))) (size!14542 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29526)

(declare-fun array_inv!10330 (array!29526) Bool)

(assert (=> start!41832 (array_inv!10330 _keys!1025)))

(declare-fun e!273269 () Bool)

(declare-fun array_inv!10331 (array!29524) Bool)

(assert (=> start!41832 (and (array_inv!10331 _values!833) e!273269)))

(declare-fun mapIsEmpty!21004 () Bool)

(assert (=> mapIsEmpty!21004 mapRes!21004))

(declare-fun b!467200 () Bool)

(declare-fun e!273266 () Bool)

(assert (=> b!467200 (= e!273269 (and e!273266 mapRes!21004))))

(declare-fun condMapEmpty!21004 () Bool)

(declare-fun mapDefault!21004 () ValueCell!6095)

(assert (=> b!467200 (= condMapEmpty!21004 (= (arr!14189 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6095)) mapDefault!21004)))))

(declare-fun b!467201 () Bool)

(assert (=> b!467201 (= e!273266 tp_is_empty!12877)))

(declare-fun b!467202 () Bool)

(assert (=> b!467202 (= e!273267 (not true))))

(declare-datatypes ((tuple2!8442 0))(
  ( (tuple2!8443 (_1!4232 (_ BitVec 64)) (_2!4232 V!18275)) )
))
(declare-datatypes ((List!8521 0))(
  ( (Nil!8518) (Cons!8517 (h!9373 tuple2!8442) (t!14467 List!8521)) )
))
(declare-datatypes ((ListLongMap!7357 0))(
  ( (ListLongMap!7358 (toList!3694 List!8521)) )
))
(declare-fun lt!211285 () ListLongMap!7357)

(declare-fun lt!211286 () ListLongMap!7357)

(assert (=> b!467202 (= lt!211285 lt!211286)))

(declare-fun minValueBefore!38 () V!18275)

(declare-fun zeroValue!794 () V!18275)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13600 0))(
  ( (Unit!13601) )
))
(declare-fun lt!211284 () Unit!13600)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18275)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!76 (array!29526 array!29524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18275 V!18275 V!18275 V!18275 (_ BitVec 32) Int) Unit!13600)

(assert (=> b!467202 (= lt!211284 (lemmaNoChangeToArrayThenSameMapNoExtras!76 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1916 (array!29526 array!29524 (_ BitVec 32) (_ BitVec 32) V!18275 V!18275 (_ BitVec 32) Int) ListLongMap!7357)

(assert (=> b!467202 (= lt!211286 (getCurrentListMapNoExtraKeys!1916 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467202 (= lt!211285 (getCurrentListMapNoExtraKeys!1916 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467203 () Bool)

(declare-fun res!279266 () Bool)

(assert (=> b!467203 (=> (not res!279266) (not e!273267))))

(declare-datatypes ((List!8522 0))(
  ( (Nil!8519) (Cons!8518 (h!9374 (_ BitVec 64)) (t!14468 List!8522)) )
))
(declare-fun arrayNoDuplicates!0 (array!29526 (_ BitVec 32) List!8522) Bool)

(assert (=> b!467203 (= res!279266 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8519))))

(declare-fun b!467204 () Bool)

(declare-fun res!279268 () Bool)

(assert (=> b!467204 (=> (not res!279268) (not e!273267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29526 (_ BitVec 32)) Bool)

(assert (=> b!467204 (= res!279268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467205 () Bool)

(assert (=> b!467205 (= e!273270 tp_is_empty!12877)))

(declare-fun b!467206 () Bool)

(declare-fun res!279267 () Bool)

(assert (=> b!467206 (=> (not res!279267) (not e!273267))))

(assert (=> b!467206 (= res!279267 (and (= (size!14541 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14542 _keys!1025) (size!14541 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41832 res!279269) b!467206))

(assert (= (and b!467206 res!279267) b!467204))

(assert (= (and b!467204 res!279268) b!467203))

(assert (= (and b!467203 res!279266) b!467202))

(assert (= (and b!467200 condMapEmpty!21004) mapIsEmpty!21004))

(assert (= (and b!467200 (not condMapEmpty!21004)) mapNonEmpty!21004))

(get-info :version)

(assert (= (and mapNonEmpty!21004 ((_ is ValueCellFull!6095) mapValue!21004)) b!467205))

(assert (= (and b!467200 ((_ is ValueCellFull!6095) mapDefault!21004)) b!467201))

(assert (= start!41832 b!467200))

(declare-fun m!449621 () Bool)

(assert (=> b!467204 m!449621))

(declare-fun m!449623 () Bool)

(assert (=> b!467202 m!449623))

(declare-fun m!449625 () Bool)

(assert (=> b!467202 m!449625))

(declare-fun m!449627 () Bool)

(assert (=> b!467202 m!449627))

(declare-fun m!449629 () Bool)

(assert (=> b!467203 m!449629))

(declare-fun m!449631 () Bool)

(assert (=> mapNonEmpty!21004 m!449631))

(declare-fun m!449633 () Bool)

(assert (=> start!41832 m!449633))

(declare-fun m!449635 () Bool)

(assert (=> start!41832 m!449635))

(declare-fun m!449637 () Bool)

(assert (=> start!41832 m!449637))

(check-sat (not b!467203) (not start!41832) (not b!467202) tp_is_empty!12877 b_and!19839 (not b!467204) (not b_next!11449) (not mapNonEmpty!21004))
(check-sat b_and!19839 (not b_next!11449))
