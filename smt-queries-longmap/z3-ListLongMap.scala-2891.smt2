; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41474 () Bool)

(assert start!41474)

(declare-fun b_free!11155 () Bool)

(declare-fun b_next!11155 () Bool)

(assert (=> start!41474 (= b_free!11155 (not b_next!11155))))

(declare-fun tp!39462 () Bool)

(declare-fun b_and!19469 () Bool)

(assert (=> start!41474 (= tp!39462 b_and!19469)))

(declare-fun mapNonEmpty!20551 () Bool)

(declare-fun mapRes!20551 () Bool)

(declare-fun tp!39463 () Bool)

(declare-fun e!270436 () Bool)

(assert (=> mapNonEmpty!20551 (= mapRes!20551 (and tp!39463 e!270436))))

(declare-datatypes ((V!17883 0))(
  ( (V!17884 (val!6336 Int)) )
))
(declare-datatypes ((ValueCell!5948 0))(
  ( (ValueCellFull!5948 (v!8617 V!17883)) (EmptyCell!5948) )
))
(declare-fun mapRest!20551 () (Array (_ BitVec 32) ValueCell!5948))

(declare-datatypes ((array!28959 0))(
  ( (array!28960 (arr!13911 (Array (_ BitVec 32) ValueCell!5948)) (size!14264 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28959)

(declare-fun mapKey!20551 () (_ BitVec 32))

(declare-fun mapValue!20551 () ValueCell!5948)

(assert (=> mapNonEmpty!20551 (= (arr!13911 _values!833) (store mapRest!20551 mapKey!20551 mapValue!20551))))

(declare-fun b!463204 () Bool)

(declare-fun res!276992 () Bool)

(declare-fun e!270438 () Bool)

(assert (=> b!463204 (=> (not res!276992) (not e!270438))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28961 0))(
  ( (array!28962 (arr!13912 (Array (_ BitVec 32) (_ BitVec 64))) (size!14265 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28961)

(assert (=> b!463204 (= res!276992 (and (= (size!14264 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14265 _keys!1025) (size!14264 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463205 () Bool)

(declare-fun res!276995 () Bool)

(assert (=> b!463205 (=> (not res!276995) (not e!270438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28961 (_ BitVec 32)) Bool)

(assert (=> b!463205 (= res!276995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463206 () Bool)

(declare-fun tp_is_empty!12583 () Bool)

(assert (=> b!463206 (= e!270436 tp_is_empty!12583)))

(declare-fun mapIsEmpty!20551 () Bool)

(assert (=> mapIsEmpty!20551 mapRes!20551))

(declare-fun b!463207 () Bool)

(declare-fun res!276993 () Bool)

(assert (=> b!463207 (=> (not res!276993) (not e!270438))))

(declare-datatypes ((List!8418 0))(
  ( (Nil!8415) (Cons!8414 (h!9270 (_ BitVec 64)) (t!14355 List!8418)) )
))
(declare-fun arrayNoDuplicates!0 (array!28961 (_ BitVec 32) List!8418) Bool)

(assert (=> b!463207 (= res!276993 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8415))))

(declare-fun res!276994 () Bool)

(assert (=> start!41474 (=> (not res!276994) (not e!270438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41474 (= res!276994 (validMask!0 mask!1365))))

(assert (=> start!41474 e!270438))

(assert (=> start!41474 tp_is_empty!12583))

(assert (=> start!41474 tp!39462))

(assert (=> start!41474 true))

(declare-fun array_inv!10122 (array!28961) Bool)

(assert (=> start!41474 (array_inv!10122 _keys!1025)))

(declare-fun e!270434 () Bool)

(declare-fun array_inv!10123 (array!28959) Bool)

(assert (=> start!41474 (and (array_inv!10123 _values!833) e!270434)))

(declare-fun b!463203 () Bool)

(declare-fun e!270437 () Bool)

(assert (=> b!463203 (= e!270434 (and e!270437 mapRes!20551))))

(declare-fun condMapEmpty!20551 () Bool)

(declare-fun mapDefault!20551 () ValueCell!5948)

(assert (=> b!463203 (= condMapEmpty!20551 (= (arr!13911 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5948)) mapDefault!20551)))))

(declare-fun b!463208 () Bool)

(assert (=> b!463208 (= e!270437 tp_is_empty!12583)))

(declare-fun b!463209 () Bool)

(assert (=> b!463209 (= e!270438 false)))

(declare-datatypes ((tuple2!8332 0))(
  ( (tuple2!8333 (_1!4177 (_ BitVec 64)) (_2!4177 V!17883)) )
))
(declare-datatypes ((List!8419 0))(
  ( (Nil!8416) (Cons!8415 (h!9271 tuple2!8332) (t!14356 List!8419)) )
))
(declare-datatypes ((ListLongMap!7235 0))(
  ( (ListLongMap!7236 (toList!3633 List!8419)) )
))
(declare-fun lt!209156 () ListLongMap!7235)

(declare-fun zeroValue!794 () V!17883)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17883)

(declare-fun getCurrentListMapNoExtraKeys!1825 (array!28961 array!28959 (_ BitVec 32) (_ BitVec 32) V!17883 V!17883 (_ BitVec 32) Int) ListLongMap!7235)

(assert (=> b!463209 (= lt!209156 (getCurrentListMapNoExtraKeys!1825 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17883)

(declare-fun lt!209155 () ListLongMap!7235)

(assert (=> b!463209 (= lt!209155 (getCurrentListMapNoExtraKeys!1825 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41474 res!276994) b!463204))

(assert (= (and b!463204 res!276992) b!463205))

(assert (= (and b!463205 res!276995) b!463207))

(assert (= (and b!463207 res!276993) b!463209))

(assert (= (and b!463203 condMapEmpty!20551) mapIsEmpty!20551))

(assert (= (and b!463203 (not condMapEmpty!20551)) mapNonEmpty!20551))

(get-info :version)

(assert (= (and mapNonEmpty!20551 ((_ is ValueCellFull!5948) mapValue!20551)) b!463206))

(assert (= (and b!463203 ((_ is ValueCellFull!5948) mapDefault!20551)) b!463208))

(assert (= start!41474 b!463203))

(declare-fun m!445323 () Bool)

(assert (=> b!463207 m!445323))

(declare-fun m!445325 () Bool)

(assert (=> b!463209 m!445325))

(declare-fun m!445327 () Bool)

(assert (=> b!463209 m!445327))

(declare-fun m!445329 () Bool)

(assert (=> mapNonEmpty!20551 m!445329))

(declare-fun m!445331 () Bool)

(assert (=> start!41474 m!445331))

(declare-fun m!445333 () Bool)

(assert (=> start!41474 m!445333))

(declare-fun m!445335 () Bool)

(assert (=> start!41474 m!445335))

(declare-fun m!445337 () Bool)

(assert (=> b!463205 m!445337))

(check-sat (not b!463207) (not mapNonEmpty!20551) tp_is_empty!12583 (not b!463209) b_and!19469 (not start!41474) (not b_next!11155) (not b!463205))
(check-sat b_and!19469 (not b_next!11155))
