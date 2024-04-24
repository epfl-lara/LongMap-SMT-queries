; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41486 () Bool)

(assert start!41486)

(declare-fun b_free!11167 () Bool)

(declare-fun b_next!11167 () Bool)

(assert (=> start!41486 (= b_free!11167 (not b_next!11167))))

(declare-fun tp!39498 () Bool)

(declare-fun b_and!19517 () Bool)

(assert (=> start!41486 (= tp!39498 b_and!19517)))

(declare-fun b!463539 () Bool)

(declare-fun e!270661 () Bool)

(declare-fun tp_is_empty!12595 () Bool)

(assert (=> b!463539 (= e!270661 tp_is_empty!12595)))

(declare-fun b!463540 () Bool)

(declare-fun res!277187 () Bool)

(declare-fun e!270659 () Bool)

(assert (=> b!463540 (=> (not res!277187) (not e!270659))))

(declare-datatypes ((array!28984 0))(
  ( (array!28985 (arr!13923 (Array (_ BitVec 32) (_ BitVec 64))) (size!14275 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28984)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28984 (_ BitVec 32)) Bool)

(assert (=> b!463540 (= res!277187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463541 () Bool)

(declare-fun e!270660 () Bool)

(assert (=> b!463541 (= e!270660 tp_is_empty!12595)))

(declare-fun b!463542 () Bool)

(assert (=> b!463542 (= e!270659 false)))

(declare-datatypes ((V!17899 0))(
  ( (V!17900 (val!6342 Int)) )
))
(declare-datatypes ((tuple2!8250 0))(
  ( (tuple2!8251 (_1!4136 (_ BitVec 64)) (_2!4136 V!17899)) )
))
(declare-datatypes ((List!8331 0))(
  ( (Nil!8328) (Cons!8327 (h!9183 tuple2!8250) (t!14269 List!8331)) )
))
(declare-datatypes ((ListLongMap!7165 0))(
  ( (ListLongMap!7166 (toList!3598 List!8331)) )
))
(declare-fun lt!209438 () ListLongMap!7165)

(declare-fun zeroValue!794 () V!17899)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5954 0))(
  ( (ValueCellFull!5954 (v!8630 V!17899)) (EmptyCell!5954) )
))
(declare-datatypes ((array!28986 0))(
  ( (array!28987 (arr!13924 (Array (_ BitVec 32) ValueCell!5954)) (size!14276 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28986)

(declare-fun minValueAfter!38 () V!17899)

(declare-fun getCurrentListMapNoExtraKeys!1825 (array!28984 array!28986 (_ BitVec 32) (_ BitVec 32) V!17899 V!17899 (_ BitVec 32) Int) ListLongMap!7165)

(assert (=> b!463542 (= lt!209438 (getCurrentListMapNoExtraKeys!1825 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209437 () ListLongMap!7165)

(declare-fun minValueBefore!38 () V!17899)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463542 (= lt!209437 (getCurrentListMapNoExtraKeys!1825 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463544 () Bool)

(declare-fun e!270663 () Bool)

(declare-fun mapRes!20569 () Bool)

(assert (=> b!463544 (= e!270663 (and e!270661 mapRes!20569))))

(declare-fun condMapEmpty!20569 () Bool)

(declare-fun mapDefault!20569 () ValueCell!5954)

(assert (=> b!463544 (= condMapEmpty!20569 (= (arr!13924 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5954)) mapDefault!20569)))))

(declare-fun mapNonEmpty!20569 () Bool)

(declare-fun tp!39499 () Bool)

(assert (=> mapNonEmpty!20569 (= mapRes!20569 (and tp!39499 e!270660))))

(declare-fun mapKey!20569 () (_ BitVec 32))

(declare-fun mapRest!20569 () (Array (_ BitVec 32) ValueCell!5954))

(declare-fun mapValue!20569 () ValueCell!5954)

(assert (=> mapNonEmpty!20569 (= (arr!13924 _values!833) (store mapRest!20569 mapKey!20569 mapValue!20569))))

(declare-fun b!463545 () Bool)

(declare-fun res!277189 () Bool)

(assert (=> b!463545 (=> (not res!277189) (not e!270659))))

(declare-datatypes ((List!8332 0))(
  ( (Nil!8329) (Cons!8328 (h!9184 (_ BitVec 64)) (t!14270 List!8332)) )
))
(declare-fun arrayNoDuplicates!0 (array!28984 (_ BitVec 32) List!8332) Bool)

(assert (=> b!463545 (= res!277189 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8329))))

(declare-fun mapIsEmpty!20569 () Bool)

(assert (=> mapIsEmpty!20569 mapRes!20569))

(declare-fun b!463543 () Bool)

(declare-fun res!277188 () Bool)

(assert (=> b!463543 (=> (not res!277188) (not e!270659))))

(assert (=> b!463543 (= res!277188 (and (= (size!14276 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14275 _keys!1025) (size!14276 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277186 () Bool)

(assert (=> start!41486 (=> (not res!277186) (not e!270659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41486 (= res!277186 (validMask!0 mask!1365))))

(assert (=> start!41486 e!270659))

(assert (=> start!41486 tp_is_empty!12595))

(assert (=> start!41486 tp!39498))

(assert (=> start!41486 true))

(declare-fun array_inv!10148 (array!28984) Bool)

(assert (=> start!41486 (array_inv!10148 _keys!1025)))

(declare-fun array_inv!10149 (array!28986) Bool)

(assert (=> start!41486 (and (array_inv!10149 _values!833) e!270663)))

(assert (= (and start!41486 res!277186) b!463543))

(assert (= (and b!463543 res!277188) b!463540))

(assert (= (and b!463540 res!277187) b!463545))

(assert (= (and b!463545 res!277189) b!463542))

(assert (= (and b!463544 condMapEmpty!20569) mapIsEmpty!20569))

(assert (= (and b!463544 (not condMapEmpty!20569)) mapNonEmpty!20569))

(get-info :version)

(assert (= (and mapNonEmpty!20569 ((_ is ValueCellFull!5954) mapValue!20569)) b!463541))

(assert (= (and b!463544 ((_ is ValueCellFull!5954) mapDefault!20569)) b!463539))

(assert (= start!41486 b!463544))

(declare-fun m!446335 () Bool)

(assert (=> b!463545 m!446335))

(declare-fun m!446337 () Bool)

(assert (=> b!463542 m!446337))

(declare-fun m!446339 () Bool)

(assert (=> b!463542 m!446339))

(declare-fun m!446341 () Bool)

(assert (=> start!41486 m!446341))

(declare-fun m!446343 () Bool)

(assert (=> start!41486 m!446343))

(declare-fun m!446345 () Bool)

(assert (=> start!41486 m!446345))

(declare-fun m!446347 () Bool)

(assert (=> mapNonEmpty!20569 m!446347))

(declare-fun m!446349 () Bool)

(assert (=> b!463540 m!446349))

(check-sat (not b!463545) b_and!19517 tp_is_empty!12595 (not b_next!11167) (not b!463540) (not b!463542) (not mapNonEmpty!20569) (not start!41486))
(check-sat b_and!19517 (not b_next!11167))
