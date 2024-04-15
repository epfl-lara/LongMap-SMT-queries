; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41516 () Bool)

(assert start!41516)

(declare-fun b_free!11197 () Bool)

(declare-fun b_next!11197 () Bool)

(assert (=> start!41516 (= b_free!11197 (not b_next!11197))))

(declare-fun tp!39588 () Bool)

(declare-fun b_and!19511 () Bool)

(assert (=> start!41516 (= tp!39588 b_and!19511)))

(declare-fun mapIsEmpty!20614 () Bool)

(declare-fun mapRes!20614 () Bool)

(assert (=> mapIsEmpty!20614 mapRes!20614))

(declare-fun b!463644 () Bool)

(declare-fun e!270750 () Bool)

(declare-fun e!270753 () Bool)

(assert (=> b!463644 (= e!270750 (and e!270753 mapRes!20614))))

(declare-fun condMapEmpty!20614 () Bool)

(declare-datatypes ((V!17939 0))(
  ( (V!17940 (val!6357 Int)) )
))
(declare-datatypes ((ValueCell!5969 0))(
  ( (ValueCellFull!5969 (v!8638 V!17939)) (EmptyCell!5969) )
))
(declare-datatypes ((array!29041 0))(
  ( (array!29042 (arr!13952 (Array (_ BitVec 32) ValueCell!5969)) (size!14305 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29041)

(declare-fun mapDefault!20614 () ValueCell!5969)

(assert (=> b!463644 (= condMapEmpty!20614 (= (arr!13952 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5969)) mapDefault!20614)))))

(declare-fun b!463645 () Bool)

(declare-fun tp_is_empty!12625 () Bool)

(assert (=> b!463645 (= e!270753 tp_is_empty!12625)))

(declare-fun res!277247 () Bool)

(declare-fun e!270751 () Bool)

(assert (=> start!41516 (=> (not res!277247) (not e!270751))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41516 (= res!277247 (validMask!0 mask!1365))))

(assert (=> start!41516 e!270751))

(assert (=> start!41516 tp_is_empty!12625))

(assert (=> start!41516 tp!39588))

(assert (=> start!41516 true))

(declare-datatypes ((array!29043 0))(
  ( (array!29044 (arr!13953 (Array (_ BitVec 32) (_ BitVec 64))) (size!14306 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29043)

(declare-fun array_inv!10152 (array!29043) Bool)

(assert (=> start!41516 (array_inv!10152 _keys!1025)))

(declare-fun array_inv!10153 (array!29041) Bool)

(assert (=> start!41516 (and (array_inv!10153 _values!833) e!270750)))

(declare-fun b!463646 () Bool)

(declare-fun e!270752 () Bool)

(assert (=> b!463646 (= e!270752 tp_is_empty!12625)))

(declare-fun b!463647 () Bool)

(declare-fun res!277245 () Bool)

(assert (=> b!463647 (=> (not res!277245) (not e!270751))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463647 (= res!277245 (and (= (size!14305 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14306 _keys!1025) (size!14305 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463648 () Bool)

(declare-fun res!277244 () Bool)

(assert (=> b!463648 (=> (not res!277244) (not e!270751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29043 (_ BitVec 32)) Bool)

(assert (=> b!463648 (= res!277244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20614 () Bool)

(declare-fun tp!39589 () Bool)

(assert (=> mapNonEmpty!20614 (= mapRes!20614 (and tp!39589 e!270752))))

(declare-fun mapRest!20614 () (Array (_ BitVec 32) ValueCell!5969))

(declare-fun mapValue!20614 () ValueCell!5969)

(declare-fun mapKey!20614 () (_ BitVec 32))

(assert (=> mapNonEmpty!20614 (= (arr!13952 _values!833) (store mapRest!20614 mapKey!20614 mapValue!20614))))

(declare-fun b!463649 () Bool)

(assert (=> b!463649 (= e!270751 false)))

(declare-fun zeroValue!794 () V!17939)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17939)

(declare-datatypes ((tuple2!8358 0))(
  ( (tuple2!8359 (_1!4190 (_ BitVec 64)) (_2!4190 V!17939)) )
))
(declare-datatypes ((List!8445 0))(
  ( (Nil!8442) (Cons!8441 (h!9297 tuple2!8358) (t!14382 List!8445)) )
))
(declare-datatypes ((ListLongMap!7261 0))(
  ( (ListLongMap!7262 (toList!3646 List!8445)) )
))
(declare-fun lt!209282 () ListLongMap!7261)

(declare-fun getCurrentListMapNoExtraKeys!1838 (array!29043 array!29041 (_ BitVec 32) (_ BitVec 32) V!17939 V!17939 (_ BitVec 32) Int) ListLongMap!7261)

(assert (=> b!463649 (= lt!209282 (getCurrentListMapNoExtraKeys!1838 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17939)

(declare-fun lt!209281 () ListLongMap!7261)

(assert (=> b!463649 (= lt!209281 (getCurrentListMapNoExtraKeys!1838 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463650 () Bool)

(declare-fun res!277246 () Bool)

(assert (=> b!463650 (=> (not res!277246) (not e!270751))))

(declare-datatypes ((List!8446 0))(
  ( (Nil!8443) (Cons!8442 (h!9298 (_ BitVec 64)) (t!14383 List!8446)) )
))
(declare-fun arrayNoDuplicates!0 (array!29043 (_ BitVec 32) List!8446) Bool)

(assert (=> b!463650 (= res!277246 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8443))))

(assert (= (and start!41516 res!277247) b!463647))

(assert (= (and b!463647 res!277245) b!463648))

(assert (= (and b!463648 res!277244) b!463650))

(assert (= (and b!463650 res!277246) b!463649))

(assert (= (and b!463644 condMapEmpty!20614) mapIsEmpty!20614))

(assert (= (and b!463644 (not condMapEmpty!20614)) mapNonEmpty!20614))

(get-info :version)

(assert (= (and mapNonEmpty!20614 ((_ is ValueCellFull!5969) mapValue!20614)) b!463646))

(assert (= (and b!463644 ((_ is ValueCellFull!5969) mapDefault!20614)) b!463645))

(assert (= start!41516 b!463644))

(declare-fun m!445659 () Bool)

(assert (=> b!463648 m!445659))

(declare-fun m!445661 () Bool)

(assert (=> start!41516 m!445661))

(declare-fun m!445663 () Bool)

(assert (=> start!41516 m!445663))

(declare-fun m!445665 () Bool)

(assert (=> start!41516 m!445665))

(declare-fun m!445667 () Bool)

(assert (=> mapNonEmpty!20614 m!445667))

(declare-fun m!445669 () Bool)

(assert (=> b!463649 m!445669))

(declare-fun m!445671 () Bool)

(assert (=> b!463649 m!445671))

(declare-fun m!445673 () Bool)

(assert (=> b!463650 m!445673))

(check-sat (not start!41516) (not mapNonEmpty!20614) (not b!463649) b_and!19511 (not b!463650) (not b!463648) (not b_next!11197) tp_is_empty!12625)
(check-sat b_and!19511 (not b_next!11197))
