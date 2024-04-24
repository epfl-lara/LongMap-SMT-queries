; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41570 () Bool)

(assert start!41570)

(declare-fun b_free!11251 () Bool)

(declare-fun b_next!11251 () Bool)

(assert (=> start!41570 (= b_free!11251 (not b_next!11251))))

(declare-fun tp!39750 () Bool)

(declare-fun b_and!19601 () Bool)

(assert (=> start!41570 (= tp!39750 b_and!19601)))

(declare-fun mapIsEmpty!20695 () Bool)

(declare-fun mapRes!20695 () Bool)

(assert (=> mapIsEmpty!20695 mapRes!20695))

(declare-fun b!464421 () Bool)

(declare-fun e!271290 () Bool)

(declare-fun e!271291 () Bool)

(assert (=> b!464421 (= e!271290 (and e!271291 mapRes!20695))))

(declare-fun condMapEmpty!20695 () Bool)

(declare-datatypes ((V!18011 0))(
  ( (V!18012 (val!6384 Int)) )
))
(declare-datatypes ((ValueCell!5996 0))(
  ( (ValueCellFull!5996 (v!8672 V!18011)) (EmptyCell!5996) )
))
(declare-datatypes ((array!29142 0))(
  ( (array!29143 (arr!14002 (Array (_ BitVec 32) ValueCell!5996)) (size!14354 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29142)

(declare-fun mapDefault!20695 () ValueCell!5996)

(assert (=> b!464421 (= condMapEmpty!20695 (= (arr!14002 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5996)) mapDefault!20695)))))

(declare-fun b!464422 () Bool)

(declare-fun tp_is_empty!12679 () Bool)

(assert (=> b!464422 (= e!271291 tp_is_empty!12679)))

(declare-fun b!464423 () Bool)

(declare-fun res!277691 () Bool)

(declare-fun e!271293 () Bool)

(assert (=> b!464423 (=> (not res!277691) (not e!271293))))

(declare-datatypes ((array!29144 0))(
  ( (array!29145 (arr!14003 (Array (_ BitVec 32) (_ BitVec 64))) (size!14355 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29144)

(declare-datatypes ((List!8386 0))(
  ( (Nil!8383) (Cons!8382 (h!9238 (_ BitVec 64)) (t!14324 List!8386)) )
))
(declare-fun arrayNoDuplicates!0 (array!29144 (_ BitVec 32) List!8386) Bool)

(assert (=> b!464423 (= res!277691 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8383))))

(declare-fun b!464424 () Bool)

(declare-fun res!277690 () Bool)

(assert (=> b!464424 (=> (not res!277690) (not e!271293))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29144 (_ BitVec 32)) Bool)

(assert (=> b!464424 (= res!277690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277693 () Bool)

(assert (=> start!41570 (=> (not res!277693) (not e!271293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41570 (= res!277693 (validMask!0 mask!1365))))

(assert (=> start!41570 e!271293))

(assert (=> start!41570 tp_is_empty!12679))

(assert (=> start!41570 tp!39750))

(assert (=> start!41570 true))

(declare-fun array_inv!10196 (array!29144) Bool)

(assert (=> start!41570 (array_inv!10196 _keys!1025)))

(declare-fun array_inv!10197 (array!29142) Bool)

(assert (=> start!41570 (and (array_inv!10197 _values!833) e!271290)))

(declare-fun mapNonEmpty!20695 () Bool)

(declare-fun tp!39751 () Bool)

(declare-fun e!271289 () Bool)

(assert (=> mapNonEmpty!20695 (= mapRes!20695 (and tp!39751 e!271289))))

(declare-fun mapRest!20695 () (Array (_ BitVec 32) ValueCell!5996))

(declare-fun mapKey!20695 () (_ BitVec 32))

(declare-fun mapValue!20695 () ValueCell!5996)

(assert (=> mapNonEmpty!20695 (= (arr!14002 _values!833) (store mapRest!20695 mapKey!20695 mapValue!20695))))

(declare-fun b!464425 () Bool)

(declare-fun res!277692 () Bool)

(assert (=> b!464425 (=> (not res!277692) (not e!271293))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464425 (= res!277692 (and (= (size!14354 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14355 _keys!1025) (size!14354 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464426 () Bool)

(assert (=> b!464426 (= e!271293 (not true))))

(declare-datatypes ((tuple2!8302 0))(
  ( (tuple2!8303 (_1!4162 (_ BitVec 64)) (_2!4162 V!18011)) )
))
(declare-datatypes ((List!8387 0))(
  ( (Nil!8384) (Cons!8383 (h!9239 tuple2!8302) (t!14325 List!8387)) )
))
(declare-datatypes ((ListLongMap!7217 0))(
  ( (ListLongMap!7218 (toList!3624 List!8387)) )
))
(declare-fun lt!209745 () ListLongMap!7217)

(declare-fun lt!209746 () ListLongMap!7217)

(assert (=> b!464426 (= lt!209745 lt!209746)))

(declare-fun minValueBefore!38 () V!18011)

(declare-fun zeroValue!794 () V!18011)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13466 0))(
  ( (Unit!13467) )
))
(declare-fun lt!209747 () Unit!13466)

(declare-fun minValueAfter!38 () V!18011)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!11 (array!29144 array!29142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18011 V!18011 V!18011 V!18011 (_ BitVec 32) Int) Unit!13466)

(assert (=> b!464426 (= lt!209747 (lemmaNoChangeToArrayThenSameMapNoExtras!11 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1851 (array!29144 array!29142 (_ BitVec 32) (_ BitVec 32) V!18011 V!18011 (_ BitVec 32) Int) ListLongMap!7217)

(assert (=> b!464426 (= lt!209746 (getCurrentListMapNoExtraKeys!1851 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464426 (= lt!209745 (getCurrentListMapNoExtraKeys!1851 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464427 () Bool)

(assert (=> b!464427 (= e!271289 tp_is_empty!12679)))

(assert (= (and start!41570 res!277693) b!464425))

(assert (= (and b!464425 res!277692) b!464424))

(assert (= (and b!464424 res!277690) b!464423))

(assert (= (and b!464423 res!277691) b!464426))

(assert (= (and b!464421 condMapEmpty!20695) mapIsEmpty!20695))

(assert (= (and b!464421 (not condMapEmpty!20695)) mapNonEmpty!20695))

(get-info :version)

(assert (= (and mapNonEmpty!20695 ((_ is ValueCellFull!5996) mapValue!20695)) b!464427))

(assert (= (and b!464421 ((_ is ValueCellFull!5996) mapDefault!20695)) b!464422))

(assert (= start!41570 b!464421))

(declare-fun m!447043 () Bool)

(assert (=> b!464426 m!447043))

(declare-fun m!447045 () Bool)

(assert (=> b!464426 m!447045))

(declare-fun m!447047 () Bool)

(assert (=> b!464426 m!447047))

(declare-fun m!447049 () Bool)

(assert (=> start!41570 m!447049))

(declare-fun m!447051 () Bool)

(assert (=> start!41570 m!447051))

(declare-fun m!447053 () Bool)

(assert (=> start!41570 m!447053))

(declare-fun m!447055 () Bool)

(assert (=> b!464424 m!447055))

(declare-fun m!447057 () Bool)

(assert (=> b!464423 m!447057))

(declare-fun m!447059 () Bool)

(assert (=> mapNonEmpty!20695 m!447059))

(check-sat tp_is_empty!12679 (not b!464423) (not b_next!11251) (not mapNonEmpty!20695) b_and!19601 (not b!464424) (not b!464426) (not start!41570))
(check-sat b_and!19601 (not b_next!11251))
