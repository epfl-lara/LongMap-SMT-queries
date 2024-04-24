; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70890 () Bool)

(assert start!70890)

(declare-fun b_free!12997 () Bool)

(declare-fun b_next!12997 () Bool)

(assert (=> start!70890 (= b_free!12997 (not b_next!12997))))

(declare-fun tp!45732 () Bool)

(declare-fun b_and!21869 () Bool)

(assert (=> start!70890 (= tp!45732 b_and!21869)))

(declare-fun b!822375 () Bool)

(declare-fun res!560733 () Bool)

(declare-fun e!457138 () Bool)

(assert (=> b!822375 (=> (not res!560733) (not e!457138))))

(declare-datatypes ((array!45613 0))(
  ( (array!45614 (arr!21853 (Array (_ BitVec 32) (_ BitVec 64))) (size!22273 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45613)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45613 (_ BitVec 32)) Bool)

(assert (=> b!822375 (= res!560733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23668 () Bool)

(declare-fun mapRes!23668 () Bool)

(assert (=> mapIsEmpty!23668 mapRes!23668))

(declare-fun b!822376 () Bool)

(declare-fun e!457135 () Bool)

(assert (=> b!822376 (= e!457138 (not e!457135))))

(declare-fun res!560731 () Bool)

(assert (=> b!822376 (=> res!560731 e!457135)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822376 (= res!560731 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24611 0))(
  ( (V!24612 (val!7401 Int)) )
))
(declare-datatypes ((tuple2!9680 0))(
  ( (tuple2!9681 (_1!4851 (_ BitVec 64)) (_2!4851 V!24611)) )
))
(declare-datatypes ((List!15473 0))(
  ( (Nil!15470) (Cons!15469 (h!16604 tuple2!9680) (t!21800 List!15473)) )
))
(declare-datatypes ((ListLongMap!8505 0))(
  ( (ListLongMap!8506 (toList!4268 List!15473)) )
))
(declare-fun lt!369599 () ListLongMap!8505)

(declare-fun lt!369597 () ListLongMap!8505)

(assert (=> b!822376 (= lt!369599 lt!369597)))

(declare-fun zeroValueBefore!34 () V!24611)

(declare-fun zeroValueAfter!34 () V!24611)

(declare-fun minValue!754 () V!24611)

(declare-datatypes ((ValueCell!6938 0))(
  ( (ValueCellFull!6938 (v!9832 V!24611)) (EmptyCell!6938) )
))
(declare-datatypes ((array!45615 0))(
  ( (array!45616 (arr!21854 (Array (_ BitVec 32) ValueCell!6938)) (size!22274 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45615)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28086 0))(
  ( (Unit!28087) )
))
(declare-fun lt!369596 () Unit!28086)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!446 (array!45613 array!45615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24611 V!24611 V!24611 V!24611 (_ BitVec 32) Int) Unit!28086)

(assert (=> b!822376 (= lt!369596 (lemmaNoChangeToArrayThenSameMapNoExtras!446 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2358 (array!45613 array!45615 (_ BitVec 32) (_ BitVec 32) V!24611 V!24611 (_ BitVec 32) Int) ListLongMap!8505)

(assert (=> b!822376 (= lt!369597 (getCurrentListMapNoExtraKeys!2358 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822376 (= lt!369599 (getCurrentListMapNoExtraKeys!2358 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822377 () Bool)

(declare-fun res!560729 () Bool)

(assert (=> b!822377 (=> (not res!560729) (not e!457138))))

(declare-datatypes ((List!15474 0))(
  ( (Nil!15471) (Cons!15470 (h!16605 (_ BitVec 64)) (t!21801 List!15474)) )
))
(declare-fun arrayNoDuplicates!0 (array!45613 (_ BitVec 32) List!15474) Bool)

(assert (=> b!822377 (= res!560729 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15471))))

(declare-fun b!822378 () Bool)

(declare-fun e!457137 () Bool)

(declare-fun tp_is_empty!14707 () Bool)

(assert (=> b!822378 (= e!457137 tp_is_empty!14707)))

(declare-fun b!822379 () Bool)

(declare-fun e!457136 () Bool)

(assert (=> b!822379 (= e!457136 tp_is_empty!14707)))

(declare-fun res!560732 () Bool)

(assert (=> start!70890 (=> (not res!560732) (not e!457138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70890 (= res!560732 (validMask!0 mask!1312))))

(assert (=> start!70890 e!457138))

(assert (=> start!70890 tp_is_empty!14707))

(declare-fun array_inv!17491 (array!45613) Bool)

(assert (=> start!70890 (array_inv!17491 _keys!976)))

(assert (=> start!70890 true))

(declare-fun e!457134 () Bool)

(declare-fun array_inv!17492 (array!45615) Bool)

(assert (=> start!70890 (and (array_inv!17492 _values!788) e!457134)))

(assert (=> start!70890 tp!45732))

(declare-fun b!822380 () Bool)

(assert (=> b!822380 (= e!457135 true)))

(declare-fun lt!369598 () ListLongMap!8505)

(declare-fun getCurrentListMap!2426 (array!45613 array!45615 (_ BitVec 32) (_ BitVec 32) V!24611 V!24611 (_ BitVec 32) Int) ListLongMap!8505)

(assert (=> b!822380 (= lt!369598 (getCurrentListMap!2426 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822381 () Bool)

(assert (=> b!822381 (= e!457134 (and e!457136 mapRes!23668))))

(declare-fun condMapEmpty!23668 () Bool)

(declare-fun mapDefault!23668 () ValueCell!6938)

(assert (=> b!822381 (= condMapEmpty!23668 (= (arr!21854 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6938)) mapDefault!23668)))))

(declare-fun b!822382 () Bool)

(declare-fun res!560730 () Bool)

(assert (=> b!822382 (=> (not res!560730) (not e!457138))))

(assert (=> b!822382 (= res!560730 (and (= (size!22274 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22273 _keys!976) (size!22274 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23668 () Bool)

(declare-fun tp!45733 () Bool)

(assert (=> mapNonEmpty!23668 (= mapRes!23668 (and tp!45733 e!457137))))

(declare-fun mapKey!23668 () (_ BitVec 32))

(declare-fun mapValue!23668 () ValueCell!6938)

(declare-fun mapRest!23668 () (Array (_ BitVec 32) ValueCell!6938))

(assert (=> mapNonEmpty!23668 (= (arr!21854 _values!788) (store mapRest!23668 mapKey!23668 mapValue!23668))))

(assert (= (and start!70890 res!560732) b!822382))

(assert (= (and b!822382 res!560730) b!822375))

(assert (= (and b!822375 res!560733) b!822377))

(assert (= (and b!822377 res!560729) b!822376))

(assert (= (and b!822376 (not res!560731)) b!822380))

(assert (= (and b!822381 condMapEmpty!23668) mapIsEmpty!23668))

(assert (= (and b!822381 (not condMapEmpty!23668)) mapNonEmpty!23668))

(get-info :version)

(assert (= (and mapNonEmpty!23668 ((_ is ValueCellFull!6938) mapValue!23668)) b!822378))

(assert (= (and b!822381 ((_ is ValueCellFull!6938) mapDefault!23668)) b!822379))

(assert (= start!70890 b!822381))

(declare-fun m!764551 () Bool)

(assert (=> start!70890 m!764551))

(declare-fun m!764553 () Bool)

(assert (=> start!70890 m!764553))

(declare-fun m!764555 () Bool)

(assert (=> start!70890 m!764555))

(declare-fun m!764557 () Bool)

(assert (=> b!822375 m!764557))

(declare-fun m!764559 () Bool)

(assert (=> mapNonEmpty!23668 m!764559))

(declare-fun m!764561 () Bool)

(assert (=> b!822376 m!764561))

(declare-fun m!764563 () Bool)

(assert (=> b!822376 m!764563))

(declare-fun m!764565 () Bool)

(assert (=> b!822376 m!764565))

(declare-fun m!764567 () Bool)

(assert (=> b!822377 m!764567))

(declare-fun m!764569 () Bool)

(assert (=> b!822380 m!764569))

(check-sat tp_is_empty!14707 (not b!822380) (not b!822376) b_and!21869 (not mapNonEmpty!23668) (not b!822377) (not b_next!12997) (not start!70890) (not b!822375))
(check-sat b_and!21869 (not b_next!12997))
