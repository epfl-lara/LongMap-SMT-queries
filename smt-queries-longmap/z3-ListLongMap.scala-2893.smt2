; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41486 () Bool)

(assert start!41486)

(declare-fun b_free!11167 () Bool)

(declare-fun b_next!11167 () Bool)

(assert (=> start!41486 (= b_free!11167 (not b_next!11167))))

(declare-fun tp!39499 () Bool)

(declare-fun b_and!19481 () Bool)

(assert (=> start!41486 (= tp!39499 b_and!19481)))

(declare-fun b!463329 () Bool)

(declare-fun e!270524 () Bool)

(declare-fun tp_is_empty!12595 () Bool)

(assert (=> b!463329 (= e!270524 tp_is_empty!12595)))

(declare-fun b!463331 () Bool)

(declare-fun res!277065 () Bool)

(declare-fun e!270528 () Bool)

(assert (=> b!463331 (=> (not res!277065) (not e!270528))))

(declare-datatypes ((array!28983 0))(
  ( (array!28984 (arr!13923 (Array (_ BitVec 32) (_ BitVec 64))) (size!14276 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28983)

(declare-datatypes ((List!8425 0))(
  ( (Nil!8422) (Cons!8421 (h!9277 (_ BitVec 64)) (t!14362 List!8425)) )
))
(declare-fun arrayNoDuplicates!0 (array!28983 (_ BitVec 32) List!8425) Bool)

(assert (=> b!463331 (= res!277065 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8422))))

(declare-fun mapNonEmpty!20569 () Bool)

(declare-fun mapRes!20569 () Bool)

(declare-fun tp!39498 () Bool)

(assert (=> mapNonEmpty!20569 (= mapRes!20569 (and tp!39498 e!270524))))

(declare-datatypes ((V!17899 0))(
  ( (V!17900 (val!6342 Int)) )
))
(declare-datatypes ((ValueCell!5954 0))(
  ( (ValueCellFull!5954 (v!8623 V!17899)) (EmptyCell!5954) )
))
(declare-datatypes ((array!28985 0))(
  ( (array!28986 (arr!13924 (Array (_ BitVec 32) ValueCell!5954)) (size!14277 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28985)

(declare-fun mapRest!20569 () (Array (_ BitVec 32) ValueCell!5954))

(declare-fun mapValue!20569 () ValueCell!5954)

(declare-fun mapKey!20569 () (_ BitVec 32))

(assert (=> mapNonEmpty!20569 (= (arr!13924 _values!833) (store mapRest!20569 mapKey!20569 mapValue!20569))))

(declare-fun b!463332 () Bool)

(declare-fun e!270525 () Bool)

(declare-fun e!270527 () Bool)

(assert (=> b!463332 (= e!270525 (and e!270527 mapRes!20569))))

(declare-fun condMapEmpty!20569 () Bool)

(declare-fun mapDefault!20569 () ValueCell!5954)

(assert (=> b!463332 (= condMapEmpty!20569 (= (arr!13924 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5954)) mapDefault!20569)))))

(declare-fun mapIsEmpty!20569 () Bool)

(assert (=> mapIsEmpty!20569 mapRes!20569))

(declare-fun b!463333 () Bool)

(declare-fun res!277067 () Bool)

(assert (=> b!463333 (=> (not res!277067) (not e!270528))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463333 (= res!277067 (and (= (size!14277 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14276 _keys!1025) (size!14277 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463334 () Bool)

(assert (=> b!463334 (= e!270528 false)))

(declare-fun zeroValue!794 () V!17899)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8340 0))(
  ( (tuple2!8341 (_1!4181 (_ BitVec 64)) (_2!4181 V!17899)) )
))
(declare-datatypes ((List!8426 0))(
  ( (Nil!8423) (Cons!8422 (h!9278 tuple2!8340) (t!14363 List!8426)) )
))
(declare-datatypes ((ListLongMap!7243 0))(
  ( (ListLongMap!7244 (toList!3637 List!8426)) )
))
(declare-fun lt!209192 () ListLongMap!7243)

(declare-fun minValueAfter!38 () V!17899)

(declare-fun getCurrentListMapNoExtraKeys!1829 (array!28983 array!28985 (_ BitVec 32) (_ BitVec 32) V!17899 V!17899 (_ BitVec 32) Int) ListLongMap!7243)

(assert (=> b!463334 (= lt!209192 (getCurrentListMapNoExtraKeys!1829 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17899)

(declare-fun lt!209191 () ListLongMap!7243)

(assert (=> b!463334 (= lt!209191 (getCurrentListMapNoExtraKeys!1829 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463335 () Bool)

(declare-fun res!277064 () Bool)

(assert (=> b!463335 (=> (not res!277064) (not e!270528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28983 (_ BitVec 32)) Bool)

(assert (=> b!463335 (= res!277064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277066 () Bool)

(assert (=> start!41486 (=> (not res!277066) (not e!270528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41486 (= res!277066 (validMask!0 mask!1365))))

(assert (=> start!41486 e!270528))

(assert (=> start!41486 tp_is_empty!12595))

(assert (=> start!41486 tp!39499))

(assert (=> start!41486 true))

(declare-fun array_inv!10132 (array!28983) Bool)

(assert (=> start!41486 (array_inv!10132 _keys!1025)))

(declare-fun array_inv!10133 (array!28985) Bool)

(assert (=> start!41486 (and (array_inv!10133 _values!833) e!270525)))

(declare-fun b!463330 () Bool)

(assert (=> b!463330 (= e!270527 tp_is_empty!12595)))

(assert (= (and start!41486 res!277066) b!463333))

(assert (= (and b!463333 res!277067) b!463335))

(assert (= (and b!463335 res!277064) b!463331))

(assert (= (and b!463331 res!277065) b!463334))

(assert (= (and b!463332 condMapEmpty!20569) mapIsEmpty!20569))

(assert (= (and b!463332 (not condMapEmpty!20569)) mapNonEmpty!20569))

(get-info :version)

(assert (= (and mapNonEmpty!20569 ((_ is ValueCellFull!5954) mapValue!20569)) b!463329))

(assert (= (and b!463332 ((_ is ValueCellFull!5954) mapDefault!20569)) b!463330))

(assert (= start!41486 b!463332))

(declare-fun m!445419 () Bool)

(assert (=> start!41486 m!445419))

(declare-fun m!445421 () Bool)

(assert (=> start!41486 m!445421))

(declare-fun m!445423 () Bool)

(assert (=> start!41486 m!445423))

(declare-fun m!445425 () Bool)

(assert (=> mapNonEmpty!20569 m!445425))

(declare-fun m!445427 () Bool)

(assert (=> b!463334 m!445427))

(declare-fun m!445429 () Bool)

(assert (=> b!463334 m!445429))

(declare-fun m!445431 () Bool)

(assert (=> b!463331 m!445431))

(declare-fun m!445433 () Bool)

(assert (=> b!463335 m!445433))

(check-sat (not b!463335) (not mapNonEmpty!20569) (not b_next!11167) (not b!463334) (not b!463331) (not start!41486) tp_is_empty!12595 b_and!19481)
(check-sat b_and!19481 (not b_next!11167))
