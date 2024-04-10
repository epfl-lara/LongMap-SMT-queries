; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41526 () Bool)

(assert start!41526)

(declare-fun b_free!11193 () Bool)

(declare-fun b_next!11193 () Bool)

(assert (=> start!41526 (= b_free!11193 (not b_next!11193))))

(declare-fun tp!39577 () Bool)

(declare-fun b_and!19533 () Bool)

(assert (=> start!41526 (= tp!39577 b_and!19533)))

(declare-fun mapNonEmpty!20608 () Bool)

(declare-fun mapRes!20608 () Bool)

(declare-fun tp!39576 () Bool)

(declare-fun e!270896 () Bool)

(assert (=> mapNonEmpty!20608 (= mapRes!20608 (and tp!39576 e!270896))))

(declare-datatypes ((V!17933 0))(
  ( (V!17934 (val!6355 Int)) )
))
(declare-datatypes ((ValueCell!5967 0))(
  ( (ValueCellFull!5967 (v!8642 V!17933)) (EmptyCell!5967) )
))
(declare-datatypes ((array!29031 0))(
  ( (array!29032 (arr!13947 (Array (_ BitVec 32) ValueCell!5967)) (size!14299 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29031)

(declare-fun mapValue!20608 () ValueCell!5967)

(declare-fun mapKey!20608 () (_ BitVec 32))

(declare-fun mapRest!20608 () (Array (_ BitVec 32) ValueCell!5967))

(assert (=> mapNonEmpty!20608 (= (arr!13947 _values!833) (store mapRest!20608 mapKey!20608 mapValue!20608))))

(declare-fun b!463873 () Bool)

(declare-fun tp_is_empty!12621 () Bool)

(assert (=> b!463873 (= e!270896 tp_is_empty!12621)))

(declare-fun mapIsEmpty!20608 () Bool)

(assert (=> mapIsEmpty!20608 mapRes!20608))

(declare-fun b!463874 () Bool)

(declare-fun e!270895 () Bool)

(declare-fun e!270893 () Bool)

(assert (=> b!463874 (= e!270895 (and e!270893 mapRes!20608))))

(declare-fun condMapEmpty!20608 () Bool)

(declare-fun mapDefault!20608 () ValueCell!5967)

(assert (=> b!463874 (= condMapEmpty!20608 (= (arr!13947 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5967)) mapDefault!20608)))))

(declare-fun b!463875 () Bool)

(declare-fun e!270897 () Bool)

(assert (=> b!463875 (= e!270897 false)))

(declare-fun zeroValue!794 () V!17933)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8324 0))(
  ( (tuple2!8325 (_1!4173 (_ BitVec 64)) (_2!4173 V!17933)) )
))
(declare-datatypes ((List!8418 0))(
  ( (Nil!8415) (Cons!8414 (h!9270 tuple2!8324) (t!14364 List!8418)) )
))
(declare-datatypes ((ListLongMap!7237 0))(
  ( (ListLongMap!7238 (toList!3634 List!8418)) )
))
(declare-fun lt!209504 () ListLongMap!7237)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29033 0))(
  ( (array!29034 (arr!13948 (Array (_ BitVec 32) (_ BitVec 64))) (size!14300 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29033)

(declare-fun minValueAfter!38 () V!17933)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1814 (array!29033 array!29031 (_ BitVec 32) (_ BitVec 32) V!17933 V!17933 (_ BitVec 32) Int) ListLongMap!7237)

(assert (=> b!463875 (= lt!209504 (getCurrentListMapNoExtraKeys!1814 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209503 () ListLongMap!7237)

(declare-fun minValueBefore!38 () V!17933)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463875 (= lt!209503 (getCurrentListMapNoExtraKeys!1814 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463876 () Bool)

(declare-fun res!277352 () Bool)

(assert (=> b!463876 (=> (not res!277352) (not e!270897))))

(assert (=> b!463876 (= res!277352 (and (= (size!14299 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14300 _keys!1025) (size!14299 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463877 () Bool)

(assert (=> b!463877 (= e!270893 tp_is_empty!12621)))

(declare-fun b!463879 () Bool)

(declare-fun res!277349 () Bool)

(assert (=> b!463879 (=> (not res!277349) (not e!270897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29033 (_ BitVec 32)) Bool)

(assert (=> b!463879 (= res!277349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463878 () Bool)

(declare-fun res!277350 () Bool)

(assert (=> b!463878 (=> (not res!277350) (not e!270897))))

(declare-datatypes ((List!8419 0))(
  ( (Nil!8416) (Cons!8415 (h!9271 (_ BitVec 64)) (t!14365 List!8419)) )
))
(declare-fun arrayNoDuplicates!0 (array!29033 (_ BitVec 32) List!8419) Bool)

(assert (=> b!463878 (= res!277350 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8416))))

(declare-fun res!277351 () Bool)

(assert (=> start!41526 (=> (not res!277351) (not e!270897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41526 (= res!277351 (validMask!0 mask!1365))))

(assert (=> start!41526 e!270897))

(assert (=> start!41526 tp_is_empty!12621))

(assert (=> start!41526 tp!39577))

(assert (=> start!41526 true))

(declare-fun array_inv!10080 (array!29033) Bool)

(assert (=> start!41526 (array_inv!10080 _keys!1025)))

(declare-fun array_inv!10081 (array!29031) Bool)

(assert (=> start!41526 (and (array_inv!10081 _values!833) e!270895)))

(assert (= (and start!41526 res!277351) b!463876))

(assert (= (and b!463876 res!277352) b!463879))

(assert (= (and b!463879 res!277349) b!463878))

(assert (= (and b!463878 res!277350) b!463875))

(assert (= (and b!463874 condMapEmpty!20608) mapIsEmpty!20608))

(assert (= (and b!463874 (not condMapEmpty!20608)) mapNonEmpty!20608))

(get-info :version)

(assert (= (and mapNonEmpty!20608 ((_ is ValueCellFull!5967) mapValue!20608)) b!463873))

(assert (= (and b!463874 ((_ is ValueCellFull!5967) mapDefault!20608)) b!463877))

(assert (= start!41526 b!463874))

(declare-fun m!446361 () Bool)

(assert (=> b!463878 m!446361))

(declare-fun m!446363 () Bool)

(assert (=> b!463875 m!446363))

(declare-fun m!446365 () Bool)

(assert (=> b!463875 m!446365))

(declare-fun m!446367 () Bool)

(assert (=> b!463879 m!446367))

(declare-fun m!446369 () Bool)

(assert (=> start!41526 m!446369))

(declare-fun m!446371 () Bool)

(assert (=> start!41526 m!446371))

(declare-fun m!446373 () Bool)

(assert (=> start!41526 m!446373))

(declare-fun m!446375 () Bool)

(assert (=> mapNonEmpty!20608 m!446375))

(check-sat (not mapNonEmpty!20608) (not b!463879) (not b_next!11193) (not b!463878) (not b!463875) (not start!41526) tp_is_empty!12621 b_and!19533)
(check-sat b_and!19533 (not b_next!11193))
