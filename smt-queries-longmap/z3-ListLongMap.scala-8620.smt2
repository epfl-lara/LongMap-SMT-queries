; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104982 () Bool)

(assert start!104982)

(declare-fun b_free!26755 () Bool)

(declare-fun b_next!26755 () Bool)

(assert (=> start!104982 (= b_free!26755 (not b_next!26755))))

(declare-fun tp!93761 () Bool)

(declare-fun b_and!44523 () Bool)

(assert (=> start!104982 (= tp!93761 b_and!44523)))

(declare-fun res!834592 () Bool)

(declare-fun e!710512 () Bool)

(assert (=> start!104982 (=> (not res!834592) (not e!710512))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104982 (= res!834592 (validMask!0 mask!1466))))

(assert (=> start!104982 e!710512))

(assert (=> start!104982 true))

(assert (=> start!104982 tp!93761))

(declare-fun tp_is_empty!31657 () Bool)

(assert (=> start!104982 tp_is_empty!31657))

(declare-datatypes ((array!80899 0))(
  ( (array!80900 (arr!39015 (Array (_ BitVec 32) (_ BitVec 64))) (size!39553 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80899)

(declare-fun array_inv!29889 (array!80899) Bool)

(assert (=> start!104982 (array_inv!29889 _keys!1118)))

(declare-datatypes ((V!47575 0))(
  ( (V!47576 (val!15891 Int)) )
))
(declare-datatypes ((ValueCell!15065 0))(
  ( (ValueCellFull!15065 (v!18587 V!47575)) (EmptyCell!15065) )
))
(declare-datatypes ((array!80901 0))(
  ( (array!80902 (arr!39016 (Array (_ BitVec 32) ValueCell!15065)) (size!39554 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80901)

(declare-fun e!710516 () Bool)

(declare-fun array_inv!29890 (array!80901) Bool)

(assert (=> start!104982 (and (array_inv!29890 _values!914) e!710516)))

(declare-fun b!1251260 () Bool)

(declare-fun e!710514 () Bool)

(assert (=> b!1251260 (= e!710514 tp_is_empty!31657)))

(declare-fun b!1251261 () Bool)

(declare-fun e!710515 () Bool)

(assert (=> b!1251261 (= e!710515 tp_is_empty!31657)))

(declare-fun b!1251262 () Bool)

(declare-fun res!834587 () Bool)

(assert (=> b!1251262 (=> (not res!834587) (not e!710512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80899 (_ BitVec 32)) Bool)

(assert (=> b!1251262 (= res!834587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251263 () Bool)

(declare-fun e!710513 () Bool)

(assert (=> b!1251263 (= e!710512 (not e!710513))))

(declare-fun res!834590 () Bool)

(assert (=> b!1251263 (=> res!834590 e!710513)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251263 (= res!834590 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20572 0))(
  ( (tuple2!20573 (_1!10297 (_ BitVec 64)) (_2!10297 V!47575)) )
))
(declare-datatypes ((List!27789 0))(
  ( (Nil!27786) (Cons!27785 (h!28994 tuple2!20572) (t!41255 List!27789)) )
))
(declare-datatypes ((ListLongMap!18445 0))(
  ( (ListLongMap!18446 (toList!9238 List!27789)) )
))
(declare-fun lt!564591 () ListLongMap!18445)

(declare-fun lt!564592 () ListLongMap!18445)

(assert (=> b!1251263 (= lt!564591 lt!564592)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47575)

(declare-fun minValueBefore!43 () V!47575)

(declare-datatypes ((Unit!41442 0))(
  ( (Unit!41443) )
))
(declare-fun lt!564590 () Unit!41442)

(declare-fun minValueAfter!43 () V!47575)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!966 (array!80899 array!80901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47575 V!47575 V!47575 V!47575 (_ BitVec 32) Int) Unit!41442)

(assert (=> b!1251263 (= lt!564590 (lemmaNoChangeToArrayThenSameMapNoExtras!966 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5644 (array!80899 array!80901 (_ BitVec 32) (_ BitVec 32) V!47575 V!47575 (_ BitVec 32) Int) ListLongMap!18445)

(assert (=> b!1251263 (= lt!564592 (getCurrentListMapNoExtraKeys!5644 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251263 (= lt!564591 (getCurrentListMapNoExtraKeys!5644 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49252 () Bool)

(declare-fun mapRes!49252 () Bool)

(assert (=> mapIsEmpty!49252 mapRes!49252))

(declare-fun b!1251264 () Bool)

(declare-fun e!710511 () Bool)

(assert (=> b!1251264 (= e!710511 true)))

(declare-fun lt!564589 () ListLongMap!18445)

(declare-fun -!1982 (ListLongMap!18445 (_ BitVec 64)) ListLongMap!18445)

(assert (=> b!1251264 (= (-!1982 lt!564589 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564589)))

(declare-fun lt!564588 () Unit!41442)

(declare-fun removeNotPresentStillSame!110 (ListLongMap!18445 (_ BitVec 64)) Unit!41442)

(assert (=> b!1251264 (= lt!564588 (removeNotPresentStillSame!110 lt!564589 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251265 () Bool)

(assert (=> b!1251265 (= e!710516 (and e!710515 mapRes!49252))))

(declare-fun condMapEmpty!49252 () Bool)

(declare-fun mapDefault!49252 () ValueCell!15065)

(assert (=> b!1251265 (= condMapEmpty!49252 (= (arr!39016 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15065)) mapDefault!49252)))))

(declare-fun mapNonEmpty!49252 () Bool)

(declare-fun tp!93760 () Bool)

(assert (=> mapNonEmpty!49252 (= mapRes!49252 (and tp!93760 e!710514))))

(declare-fun mapKey!49252 () (_ BitVec 32))

(declare-fun mapRest!49252 () (Array (_ BitVec 32) ValueCell!15065))

(declare-fun mapValue!49252 () ValueCell!15065)

(assert (=> mapNonEmpty!49252 (= (arr!39016 _values!914) (store mapRest!49252 mapKey!49252 mapValue!49252))))

(declare-fun b!1251266 () Bool)

(declare-fun res!834588 () Bool)

(assert (=> b!1251266 (=> (not res!834588) (not e!710512))))

(declare-datatypes ((List!27790 0))(
  ( (Nil!27787) (Cons!27786 (h!28995 (_ BitVec 64)) (t!41256 List!27790)) )
))
(declare-fun arrayNoDuplicates!0 (array!80899 (_ BitVec 32) List!27790) Bool)

(assert (=> b!1251266 (= res!834588 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27787))))

(declare-fun b!1251267 () Bool)

(assert (=> b!1251267 (= e!710513 e!710511)))

(declare-fun res!834591 () Bool)

(assert (=> b!1251267 (=> res!834591 e!710511)))

(declare-fun contains!7480 (ListLongMap!18445 (_ BitVec 64)) Bool)

(assert (=> b!1251267 (= res!834591 (contains!7480 lt!564589 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4406 (array!80899 array!80901 (_ BitVec 32) (_ BitVec 32) V!47575 V!47575 (_ BitVec 32) Int) ListLongMap!18445)

(assert (=> b!1251267 (= lt!564589 (getCurrentListMap!4406 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251268 () Bool)

(declare-fun res!834589 () Bool)

(assert (=> b!1251268 (=> (not res!834589) (not e!710512))))

(assert (=> b!1251268 (= res!834589 (and (= (size!39554 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39553 _keys!1118) (size!39554 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104982 res!834592) b!1251268))

(assert (= (and b!1251268 res!834589) b!1251262))

(assert (= (and b!1251262 res!834587) b!1251266))

(assert (= (and b!1251266 res!834588) b!1251263))

(assert (= (and b!1251263 (not res!834590)) b!1251267))

(assert (= (and b!1251267 (not res!834591)) b!1251264))

(assert (= (and b!1251265 condMapEmpty!49252) mapIsEmpty!49252))

(assert (= (and b!1251265 (not condMapEmpty!49252)) mapNonEmpty!49252))

(get-info :version)

(assert (= (and mapNonEmpty!49252 ((_ is ValueCellFull!15065) mapValue!49252)) b!1251260))

(assert (= (and b!1251265 ((_ is ValueCellFull!15065) mapDefault!49252)) b!1251261))

(assert (= start!104982 b!1251265))

(declare-fun m!1151593 () Bool)

(assert (=> mapNonEmpty!49252 m!1151593))

(declare-fun m!1151595 () Bool)

(assert (=> b!1251266 m!1151595))

(declare-fun m!1151597 () Bool)

(assert (=> b!1251267 m!1151597))

(declare-fun m!1151599 () Bool)

(assert (=> b!1251267 m!1151599))

(declare-fun m!1151601 () Bool)

(assert (=> start!104982 m!1151601))

(declare-fun m!1151603 () Bool)

(assert (=> start!104982 m!1151603))

(declare-fun m!1151605 () Bool)

(assert (=> start!104982 m!1151605))

(declare-fun m!1151607 () Bool)

(assert (=> b!1251262 m!1151607))

(declare-fun m!1151609 () Bool)

(assert (=> b!1251263 m!1151609))

(declare-fun m!1151611 () Bool)

(assert (=> b!1251263 m!1151611))

(declare-fun m!1151613 () Bool)

(assert (=> b!1251263 m!1151613))

(declare-fun m!1151615 () Bool)

(assert (=> b!1251264 m!1151615))

(declare-fun m!1151617 () Bool)

(assert (=> b!1251264 m!1151617))

(check-sat (not b!1251264) (not b!1251262) (not b!1251267) b_and!44523 (not mapNonEmpty!49252) (not b_next!26755) tp_is_empty!31657 (not b!1251266) (not start!104982) (not b!1251263))
(check-sat b_and!44523 (not b_next!26755))
