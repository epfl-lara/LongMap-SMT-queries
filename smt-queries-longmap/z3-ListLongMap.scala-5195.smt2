; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70172 () Bool)

(assert start!70172)

(declare-fun b_free!12579 () Bool)

(declare-fun b_next!12579 () Bool)

(assert (=> start!70172 (= b_free!12579 (not b_next!12579))))

(declare-fun tp!44454 () Bool)

(declare-fun b_and!21359 () Bool)

(assert (=> start!70172 (= tp!44454 b_and!21359)))

(declare-fun b!815319 () Bool)

(declare-fun res!556765 () Bool)

(declare-fun e!452081 () Bool)

(assert (=> b!815319 (=> (not res!556765) (not e!452081))))

(declare-datatypes ((array!44778 0))(
  ( (array!44779 (arr!21448 (Array (_ BitVec 32) (_ BitVec 64))) (size!21869 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44778)

(declare-datatypes ((List!15262 0))(
  ( (Nil!15259) (Cons!15258 (h!16387 (_ BitVec 64)) (t!21581 List!15262)) )
))
(declare-fun arrayNoDuplicates!0 (array!44778 (_ BitVec 32) List!15262) Bool)

(assert (=> b!815319 (= res!556765 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15259))))

(declare-fun b!815320 () Bool)

(declare-fun e!452082 () Bool)

(declare-fun e!452079 () Bool)

(declare-fun mapRes!23017 () Bool)

(assert (=> b!815320 (= e!452082 (and e!452079 mapRes!23017))))

(declare-fun condMapEmpty!23017 () Bool)

(declare-datatypes ((V!24053 0))(
  ( (V!24054 (val!7192 Int)) )
))
(declare-datatypes ((ValueCell!6729 0))(
  ( (ValueCellFull!6729 (v!9619 V!24053)) (EmptyCell!6729) )
))
(declare-datatypes ((array!44780 0))(
  ( (array!44781 (arr!21449 (Array (_ BitVec 32) ValueCell!6729)) (size!21870 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44780)

(declare-fun mapDefault!23017 () ValueCell!6729)

(assert (=> b!815320 (= condMapEmpty!23017 (= (arr!21449 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6729)) mapDefault!23017)))))

(declare-fun b!815321 () Bool)

(assert (=> b!815321 (= e!452081 (not true))))

(declare-datatypes ((tuple2!9430 0))(
  ( (tuple2!9431 (_1!4726 (_ BitVec 64)) (_2!4726 V!24053)) )
))
(declare-datatypes ((List!15263 0))(
  ( (Nil!15260) (Cons!15259 (h!16388 tuple2!9430) (t!21582 List!15263)) )
))
(declare-datatypes ((ListLongMap!8253 0))(
  ( (ListLongMap!8254 (toList!4142 List!15263)) )
))
(declare-fun lt!364998 () ListLongMap!8253)

(declare-fun lt!364999 () ListLongMap!8253)

(assert (=> b!815321 (= lt!364998 lt!364999)))

(declare-fun zeroValueBefore!34 () V!24053)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24053)

(declare-fun minValue!754 () V!24053)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27782 0))(
  ( (Unit!27783) )
))
(declare-fun lt!364997 () Unit!27782)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!302 (array!44778 array!44780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24053 V!24053 V!24053 V!24053 (_ BitVec 32) Int) Unit!27782)

(assert (=> b!815321 (= lt!364997 (lemmaNoChangeToArrayThenSameMapNoExtras!302 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2192 (array!44778 array!44780 (_ BitVec 32) (_ BitVec 32) V!24053 V!24053 (_ BitVec 32) Int) ListLongMap!8253)

(assert (=> b!815321 (= lt!364999 (getCurrentListMapNoExtraKeys!2192 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815321 (= lt!364998 (getCurrentListMapNoExtraKeys!2192 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815322 () Bool)

(declare-fun res!556764 () Bool)

(assert (=> b!815322 (=> (not res!556764) (not e!452081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44778 (_ BitVec 32)) Bool)

(assert (=> b!815322 (= res!556764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815323 () Bool)

(declare-fun tp_is_empty!14289 () Bool)

(assert (=> b!815323 (= e!452079 tp_is_empty!14289)))

(declare-fun b!815324 () Bool)

(declare-fun e!452080 () Bool)

(assert (=> b!815324 (= e!452080 tp_is_empty!14289)))

(declare-fun mapIsEmpty!23017 () Bool)

(assert (=> mapIsEmpty!23017 mapRes!23017))

(declare-fun b!815325 () Bool)

(declare-fun res!556762 () Bool)

(assert (=> b!815325 (=> (not res!556762) (not e!452081))))

(assert (=> b!815325 (= res!556762 (and (= (size!21870 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21869 _keys!976) (size!21870 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23017 () Bool)

(declare-fun tp!44455 () Bool)

(assert (=> mapNonEmpty!23017 (= mapRes!23017 (and tp!44455 e!452080))))

(declare-fun mapKey!23017 () (_ BitVec 32))

(declare-fun mapValue!23017 () ValueCell!6729)

(declare-fun mapRest!23017 () (Array (_ BitVec 32) ValueCell!6729))

(assert (=> mapNonEmpty!23017 (= (arr!21449 _values!788) (store mapRest!23017 mapKey!23017 mapValue!23017))))

(declare-fun res!556763 () Bool)

(assert (=> start!70172 (=> (not res!556763) (not e!452081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70172 (= res!556763 (validMask!0 mask!1312))))

(assert (=> start!70172 e!452081))

(assert (=> start!70172 tp_is_empty!14289))

(declare-fun array_inv!17161 (array!44778) Bool)

(assert (=> start!70172 (array_inv!17161 _keys!976)))

(assert (=> start!70172 true))

(declare-fun array_inv!17162 (array!44780) Bool)

(assert (=> start!70172 (and (array_inv!17162 _values!788) e!452082)))

(assert (=> start!70172 tp!44454))

(assert (= (and start!70172 res!556763) b!815325))

(assert (= (and b!815325 res!556762) b!815322))

(assert (= (and b!815322 res!556764) b!815319))

(assert (= (and b!815319 res!556765) b!815321))

(assert (= (and b!815320 condMapEmpty!23017) mapIsEmpty!23017))

(assert (= (and b!815320 (not condMapEmpty!23017)) mapNonEmpty!23017))

(get-info :version)

(assert (= (and mapNonEmpty!23017 ((_ is ValueCellFull!6729) mapValue!23017)) b!815324))

(assert (= (and b!815320 ((_ is ValueCellFull!6729) mapDefault!23017)) b!815323))

(assert (= start!70172 b!815320))

(declare-fun m!757001 () Bool)

(assert (=> start!70172 m!757001))

(declare-fun m!757003 () Bool)

(assert (=> start!70172 m!757003))

(declare-fun m!757005 () Bool)

(assert (=> start!70172 m!757005))

(declare-fun m!757007 () Bool)

(assert (=> b!815322 m!757007))

(declare-fun m!757009 () Bool)

(assert (=> mapNonEmpty!23017 m!757009))

(declare-fun m!757011 () Bool)

(assert (=> b!815319 m!757011))

(declare-fun m!757013 () Bool)

(assert (=> b!815321 m!757013))

(declare-fun m!757015 () Bool)

(assert (=> b!815321 m!757015))

(declare-fun m!757017 () Bool)

(assert (=> b!815321 m!757017))

(check-sat (not start!70172) (not b_next!12579) b_and!21359 (not b!815321) (not b!815319) (not b!815322) (not mapNonEmpty!23017) tp_is_empty!14289)
(check-sat b_and!21359 (not b_next!12579))
