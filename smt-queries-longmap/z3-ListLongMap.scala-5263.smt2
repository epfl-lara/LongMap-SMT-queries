; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70692 () Bool)

(assert start!70692)

(declare-fun b_free!12985 () Bool)

(declare-fun b_next!12985 () Bool)

(assert (=> start!70692 (= b_free!12985 (not b_next!12985))))

(declare-fun tp!45697 () Bool)

(declare-fun b_and!21821 () Bool)

(assert (=> start!70692 (= tp!45697 b_and!21821)))

(declare-fun b!821091 () Bool)

(declare-fun res!560188 () Bool)

(declare-fun e!456300 () Bool)

(assert (=> b!821091 (=> (not res!560188) (not e!456300))))

(declare-datatypes ((array!45557 0))(
  ( (array!45558 (arr!21830 (Array (_ BitVec 32) (_ BitVec 64))) (size!22251 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45557)

(declare-datatypes ((List!15578 0))(
  ( (Nil!15575) (Cons!15574 (h!16703 (_ BitVec 64)) (t!21904 List!15578)) )
))
(declare-fun arrayNoDuplicates!0 (array!45557 (_ BitVec 32) List!15578) Bool)

(assert (=> b!821091 (= res!560188 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15575))))

(declare-fun b!821092 () Bool)

(declare-fun e!456297 () Bool)

(assert (=> b!821092 (= e!456297 true)))

(declare-datatypes ((V!24595 0))(
  ( (V!24596 (val!7395 Int)) )
))
(declare-datatypes ((tuple2!9768 0))(
  ( (tuple2!9769 (_1!4895 (_ BitVec 64)) (_2!4895 V!24595)) )
))
(declare-datatypes ((List!15579 0))(
  ( (Nil!15576) (Cons!15575 (h!16704 tuple2!9768) (t!21905 List!15579)) )
))
(declare-datatypes ((ListLongMap!8581 0))(
  ( (ListLongMap!8582 (toList!4306 List!15579)) )
))
(declare-fun lt!368929 () ListLongMap!8581)

(declare-fun zeroValueBefore!34 () V!24595)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24595)

(declare-datatypes ((ValueCell!6932 0))(
  ( (ValueCellFull!6932 (v!9820 V!24595)) (EmptyCell!6932) )
))
(declare-datatypes ((array!45559 0))(
  ( (array!45560 (arr!21831 (Array (_ BitVec 32) ValueCell!6932)) (size!22252 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45559)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2434 (array!45557 array!45559 (_ BitVec 32) (_ BitVec 32) V!24595 V!24595 (_ BitVec 32) Int) ListLongMap!8581)

(assert (=> b!821092 (= lt!368929 (getCurrentListMap!2434 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560190 () Bool)

(assert (=> start!70692 (=> (not res!560190) (not e!456300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70692 (= res!560190 (validMask!0 mask!1312))))

(assert (=> start!70692 e!456300))

(declare-fun tp_is_empty!14695 () Bool)

(assert (=> start!70692 tp_is_empty!14695))

(declare-fun array_inv!17517 (array!45557) Bool)

(assert (=> start!70692 (array_inv!17517 _keys!976)))

(assert (=> start!70692 true))

(declare-fun e!456298 () Bool)

(declare-fun array_inv!17518 (array!45559) Bool)

(assert (=> start!70692 (and (array_inv!17518 _values!788) e!456298)))

(assert (=> start!70692 tp!45697))

(declare-fun mapNonEmpty!23650 () Bool)

(declare-fun mapRes!23650 () Bool)

(declare-fun tp!45696 () Bool)

(declare-fun e!456299 () Bool)

(assert (=> mapNonEmpty!23650 (= mapRes!23650 (and tp!45696 e!456299))))

(declare-fun mapValue!23650 () ValueCell!6932)

(declare-fun mapRest!23650 () (Array (_ BitVec 32) ValueCell!6932))

(declare-fun mapKey!23650 () (_ BitVec 32))

(assert (=> mapNonEmpty!23650 (= (arr!21831 _values!788) (store mapRest!23650 mapKey!23650 mapValue!23650))))

(declare-fun b!821093 () Bool)

(assert (=> b!821093 (= e!456300 (not e!456297))))

(declare-fun res!560189 () Bool)

(assert (=> b!821093 (=> res!560189 e!456297)))

(assert (=> b!821093 (= res!560189 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!368930 () ListLongMap!8581)

(declare-fun lt!368927 () ListLongMap!8581)

(assert (=> b!821093 (= lt!368930 lt!368927)))

(declare-fun zeroValueAfter!34 () V!24595)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28035 0))(
  ( (Unit!28036) )
))
(declare-fun lt!368928 () Unit!28035)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!448 (array!45557 array!45559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24595 V!24595 V!24595 V!24595 (_ BitVec 32) Int) Unit!28035)

(assert (=> b!821093 (= lt!368928 (lemmaNoChangeToArrayThenSameMapNoExtras!448 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2355 (array!45557 array!45559 (_ BitVec 32) (_ BitVec 32) V!24595 V!24595 (_ BitVec 32) Int) ListLongMap!8581)

(assert (=> b!821093 (= lt!368927 (getCurrentListMapNoExtraKeys!2355 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821093 (= lt!368930 (getCurrentListMapNoExtraKeys!2355 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23650 () Bool)

(assert (=> mapIsEmpty!23650 mapRes!23650))

(declare-fun b!821094 () Bool)

(declare-fun res!560191 () Bool)

(assert (=> b!821094 (=> (not res!560191) (not e!456300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45557 (_ BitVec 32)) Bool)

(assert (=> b!821094 (= res!560191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821095 () Bool)

(declare-fun e!456301 () Bool)

(assert (=> b!821095 (= e!456301 tp_is_empty!14695)))

(declare-fun b!821096 () Bool)

(declare-fun res!560187 () Bool)

(assert (=> b!821096 (=> (not res!560187) (not e!456300))))

(assert (=> b!821096 (= res!560187 (and (= (size!22252 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22251 _keys!976) (size!22252 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821097 () Bool)

(assert (=> b!821097 (= e!456298 (and e!456301 mapRes!23650))))

(declare-fun condMapEmpty!23650 () Bool)

(declare-fun mapDefault!23650 () ValueCell!6932)

(assert (=> b!821097 (= condMapEmpty!23650 (= (arr!21831 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6932)) mapDefault!23650)))))

(declare-fun b!821098 () Bool)

(assert (=> b!821098 (= e!456299 tp_is_empty!14695)))

(assert (= (and start!70692 res!560190) b!821096))

(assert (= (and b!821096 res!560187) b!821094))

(assert (= (and b!821094 res!560191) b!821091))

(assert (= (and b!821091 res!560188) b!821093))

(assert (= (and b!821093 (not res!560189)) b!821092))

(assert (= (and b!821097 condMapEmpty!23650) mapIsEmpty!23650))

(assert (= (and b!821097 (not condMapEmpty!23650)) mapNonEmpty!23650))

(get-info :version)

(assert (= (and mapNonEmpty!23650 ((_ is ValueCellFull!6932) mapValue!23650)) b!821098))

(assert (= (and b!821097 ((_ is ValueCellFull!6932) mapDefault!23650)) b!821095))

(assert (= start!70692 b!821097))

(declare-fun m!762397 () Bool)

(assert (=> b!821094 m!762397))

(declare-fun m!762399 () Bool)

(assert (=> b!821091 m!762399))

(declare-fun m!762401 () Bool)

(assert (=> b!821093 m!762401))

(declare-fun m!762403 () Bool)

(assert (=> b!821093 m!762403))

(declare-fun m!762405 () Bool)

(assert (=> b!821093 m!762405))

(declare-fun m!762407 () Bool)

(assert (=> mapNonEmpty!23650 m!762407))

(declare-fun m!762409 () Bool)

(assert (=> b!821092 m!762409))

(declare-fun m!762411 () Bool)

(assert (=> start!70692 m!762411))

(declare-fun m!762413 () Bool)

(assert (=> start!70692 m!762413))

(declare-fun m!762415 () Bool)

(assert (=> start!70692 m!762415))

(check-sat (not b_next!12985) b_and!21821 (not b!821092) tp_is_empty!14695 (not b!821091) (not start!70692) (not mapNonEmpty!23650) (not b!821093) (not b!821094))
(check-sat b_and!21821 (not b_next!12985))
