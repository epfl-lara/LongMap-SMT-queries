; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70884 () Bool)

(assert start!70884)

(declare-fun b_free!12991 () Bool)

(declare-fun b_next!12991 () Bool)

(assert (=> start!70884 (= b_free!12991 (not b_next!12991))))

(declare-fun tp!45714 () Bool)

(declare-fun b_and!21863 () Bool)

(assert (=> start!70884 (= tp!45714 b_and!21863)))

(declare-fun mapIsEmpty!23659 () Bool)

(declare-fun mapRes!23659 () Bool)

(assert (=> mapIsEmpty!23659 mapRes!23659))

(declare-fun b!822303 () Bool)

(declare-fun res!560687 () Bool)

(declare-fun e!457084 () Bool)

(assert (=> b!822303 (=> (not res!560687) (not e!457084))))

(declare-datatypes ((array!45601 0))(
  ( (array!45602 (arr!21847 (Array (_ BitVec 32) (_ BitVec 64))) (size!22267 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45601)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45601 (_ BitVec 32)) Bool)

(assert (=> b!822303 (= res!560687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822304 () Bool)

(declare-fun e!457083 () Bool)

(assert (=> b!822304 (= e!457084 (not e!457083))))

(declare-fun res!560684 () Bool)

(assert (=> b!822304 (=> res!560684 e!457083)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822304 (= res!560684 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24603 0))(
  ( (V!24604 (val!7398 Int)) )
))
(declare-datatypes ((tuple2!9674 0))(
  ( (tuple2!9675 (_1!4848 (_ BitVec 64)) (_2!4848 V!24603)) )
))
(declare-datatypes ((List!15467 0))(
  ( (Nil!15464) (Cons!15463 (h!16598 tuple2!9674) (t!21794 List!15467)) )
))
(declare-datatypes ((ListLongMap!8499 0))(
  ( (ListLongMap!8500 (toList!4265 List!15467)) )
))
(declare-fun lt!369562 () ListLongMap!8499)

(declare-fun lt!369563 () ListLongMap!8499)

(assert (=> b!822304 (= lt!369562 lt!369563)))

(declare-fun zeroValueBefore!34 () V!24603)

(declare-fun zeroValueAfter!34 () V!24603)

(declare-fun minValue!754 () V!24603)

(declare-datatypes ((ValueCell!6935 0))(
  ( (ValueCellFull!6935 (v!9829 V!24603)) (EmptyCell!6935) )
))
(declare-datatypes ((array!45603 0))(
  ( (array!45604 (arr!21848 (Array (_ BitVec 32) ValueCell!6935)) (size!22268 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45603)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28080 0))(
  ( (Unit!28081) )
))
(declare-fun lt!369560 () Unit!28080)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!443 (array!45601 array!45603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24603 V!24603 V!24603 V!24603 (_ BitVec 32) Int) Unit!28080)

(assert (=> b!822304 (= lt!369560 (lemmaNoChangeToArrayThenSameMapNoExtras!443 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2355 (array!45601 array!45603 (_ BitVec 32) (_ BitVec 32) V!24603 V!24603 (_ BitVec 32) Int) ListLongMap!8499)

(assert (=> b!822304 (= lt!369563 (getCurrentListMapNoExtraKeys!2355 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822304 (= lt!369562 (getCurrentListMapNoExtraKeys!2355 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23659 () Bool)

(declare-fun tp!45715 () Bool)

(declare-fun e!457080 () Bool)

(assert (=> mapNonEmpty!23659 (= mapRes!23659 (and tp!45715 e!457080))))

(declare-fun mapValue!23659 () ValueCell!6935)

(declare-fun mapRest!23659 () (Array (_ BitVec 32) ValueCell!6935))

(declare-fun mapKey!23659 () (_ BitVec 32))

(assert (=> mapNonEmpty!23659 (= (arr!21848 _values!788) (store mapRest!23659 mapKey!23659 mapValue!23659))))

(declare-fun b!822305 () Bool)

(declare-fun e!457079 () Bool)

(declare-fun e!457082 () Bool)

(assert (=> b!822305 (= e!457079 (and e!457082 mapRes!23659))))

(declare-fun condMapEmpty!23659 () Bool)

(declare-fun mapDefault!23659 () ValueCell!6935)

(assert (=> b!822305 (= condMapEmpty!23659 (= (arr!21848 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6935)) mapDefault!23659)))))

(declare-fun b!822306 () Bool)

(declare-fun tp_is_empty!14701 () Bool)

(assert (=> b!822306 (= e!457082 tp_is_empty!14701)))

(declare-fun res!560688 () Bool)

(assert (=> start!70884 (=> (not res!560688) (not e!457084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70884 (= res!560688 (validMask!0 mask!1312))))

(assert (=> start!70884 e!457084))

(assert (=> start!70884 tp_is_empty!14701))

(declare-fun array_inv!17487 (array!45601) Bool)

(assert (=> start!70884 (array_inv!17487 _keys!976)))

(assert (=> start!70884 true))

(declare-fun array_inv!17488 (array!45603) Bool)

(assert (=> start!70884 (and (array_inv!17488 _values!788) e!457079)))

(assert (=> start!70884 tp!45714))

(declare-fun b!822307 () Bool)

(assert (=> b!822307 (= e!457080 tp_is_empty!14701)))

(declare-fun b!822308 () Bool)

(declare-fun res!560686 () Bool)

(assert (=> b!822308 (=> (not res!560686) (not e!457084))))

(declare-datatypes ((List!15468 0))(
  ( (Nil!15465) (Cons!15464 (h!16599 (_ BitVec 64)) (t!21795 List!15468)) )
))
(declare-fun arrayNoDuplicates!0 (array!45601 (_ BitVec 32) List!15468) Bool)

(assert (=> b!822308 (= res!560686 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15465))))

(declare-fun b!822309 () Bool)

(assert (=> b!822309 (= e!457083 true)))

(declare-fun lt!369561 () ListLongMap!8499)

(declare-fun getCurrentListMap!2425 (array!45601 array!45603 (_ BitVec 32) (_ BitVec 32) V!24603 V!24603 (_ BitVec 32) Int) ListLongMap!8499)

(assert (=> b!822309 (= lt!369561 (getCurrentListMap!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822310 () Bool)

(declare-fun res!560685 () Bool)

(assert (=> b!822310 (=> (not res!560685) (not e!457084))))

(assert (=> b!822310 (= res!560685 (and (= (size!22268 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22267 _keys!976) (size!22268 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70884 res!560688) b!822310))

(assert (= (and b!822310 res!560685) b!822303))

(assert (= (and b!822303 res!560687) b!822308))

(assert (= (and b!822308 res!560686) b!822304))

(assert (= (and b!822304 (not res!560684)) b!822309))

(assert (= (and b!822305 condMapEmpty!23659) mapIsEmpty!23659))

(assert (= (and b!822305 (not condMapEmpty!23659)) mapNonEmpty!23659))

(get-info :version)

(assert (= (and mapNonEmpty!23659 ((_ is ValueCellFull!6935) mapValue!23659)) b!822307))

(assert (= (and b!822305 ((_ is ValueCellFull!6935) mapDefault!23659)) b!822306))

(assert (= start!70884 b!822305))

(declare-fun m!764491 () Bool)

(assert (=> b!822309 m!764491))

(declare-fun m!764493 () Bool)

(assert (=> mapNonEmpty!23659 m!764493))

(declare-fun m!764495 () Bool)

(assert (=> start!70884 m!764495))

(declare-fun m!764497 () Bool)

(assert (=> start!70884 m!764497))

(declare-fun m!764499 () Bool)

(assert (=> start!70884 m!764499))

(declare-fun m!764501 () Bool)

(assert (=> b!822308 m!764501))

(declare-fun m!764503 () Bool)

(assert (=> b!822303 m!764503))

(declare-fun m!764505 () Bool)

(assert (=> b!822304 m!764505))

(declare-fun m!764507 () Bool)

(assert (=> b!822304 m!764507))

(declare-fun m!764509 () Bool)

(assert (=> b!822304 m!764509))

(check-sat (not b!822303) (not b!822309) (not mapNonEmpty!23659) tp_is_empty!14701 b_and!21863 (not b!822304) (not b_next!12991) (not b!822308) (not start!70884))
(check-sat b_and!21863 (not b_next!12991))
