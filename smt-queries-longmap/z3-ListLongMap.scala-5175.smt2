; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70016 () Bool)

(assert start!70016)

(declare-fun b_free!12457 () Bool)

(declare-fun b_next!12457 () Bool)

(assert (=> start!70016 (= b_free!12457 (not b_next!12457))))

(declare-fun tp!44085 () Bool)

(declare-fun b_and!21203 () Bool)

(assert (=> start!70016 (= tp!44085 b_and!21203)))

(declare-fun b!813707 () Bool)

(declare-fun res!555893 () Bool)

(declare-fun e!450960 () Bool)

(assert (=> b!813707 (=> (not res!555893) (not e!450960))))

(declare-datatypes ((array!44537 0))(
  ( (array!44538 (arr!21329 (Array (_ BitVec 32) (_ BitVec 64))) (size!21750 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44537)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23891 0))(
  ( (V!23892 (val!7131 Int)) )
))
(declare-datatypes ((ValueCell!6668 0))(
  ( (ValueCellFull!6668 (v!9552 V!23891)) (EmptyCell!6668) )
))
(declare-datatypes ((array!44539 0))(
  ( (array!44540 (arr!21330 (Array (_ BitVec 32) ValueCell!6668)) (size!21751 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44539)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813707 (= res!555893 (and (= (size!21751 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21750 _keys!976) (size!21751 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813708 () Bool)

(declare-fun e!450962 () Bool)

(declare-fun tp_is_empty!14167 () Bool)

(assert (=> b!813708 (= e!450962 tp_is_empty!14167)))

(declare-fun mapIsEmpty!22831 () Bool)

(declare-fun mapRes!22831 () Bool)

(assert (=> mapIsEmpty!22831 mapRes!22831))

(declare-fun res!555896 () Bool)

(assert (=> start!70016 (=> (not res!555896) (not e!450960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70016 (= res!555896 (validMask!0 mask!1312))))

(assert (=> start!70016 e!450960))

(assert (=> start!70016 tp_is_empty!14167))

(declare-fun array_inv!17157 (array!44537) Bool)

(assert (=> start!70016 (array_inv!17157 _keys!976)))

(assert (=> start!70016 true))

(declare-fun e!450959 () Bool)

(declare-fun array_inv!17158 (array!44539) Bool)

(assert (=> start!70016 (and (array_inv!17158 _values!788) e!450959)))

(assert (=> start!70016 tp!44085))

(declare-fun b!813709 () Bool)

(assert (=> b!813709 (= e!450959 (and e!450962 mapRes!22831))))

(declare-fun condMapEmpty!22831 () Bool)

(declare-fun mapDefault!22831 () ValueCell!6668)

(assert (=> b!813709 (= condMapEmpty!22831 (= (arr!21330 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6668)) mapDefault!22831)))))

(declare-fun b!813710 () Bool)

(declare-fun res!555894 () Bool)

(assert (=> b!813710 (=> (not res!555894) (not e!450960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44537 (_ BitVec 32)) Bool)

(assert (=> b!813710 (= res!555894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22831 () Bool)

(declare-fun tp!44086 () Bool)

(declare-fun e!450961 () Bool)

(assert (=> mapNonEmpty!22831 (= mapRes!22831 (and tp!44086 e!450961))))

(declare-fun mapRest!22831 () (Array (_ BitVec 32) ValueCell!6668))

(declare-fun mapValue!22831 () ValueCell!6668)

(declare-fun mapKey!22831 () (_ BitVec 32))

(assert (=> mapNonEmpty!22831 (= (arr!21330 _values!788) (store mapRest!22831 mapKey!22831 mapValue!22831))))

(declare-fun b!813711 () Bool)

(assert (=> b!813711 (= e!450961 tp_is_empty!14167)))

(declare-fun b!813712 () Bool)

(declare-fun res!555895 () Bool)

(assert (=> b!813712 (=> (not res!555895) (not e!450960))))

(declare-datatypes ((List!15207 0))(
  ( (Nil!15204) (Cons!15203 (h!16332 (_ BitVec 64)) (t!21515 List!15207)) )
))
(declare-fun arrayNoDuplicates!0 (array!44537 (_ BitVec 32) List!15207) Bool)

(assert (=> b!813712 (= res!555895 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15204))))

(declare-fun b!813713 () Bool)

(assert (=> b!813713 (= e!450960 false)))

(declare-fun zeroValueAfter!34 () V!23891)

(declare-fun minValue!754 () V!23891)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9380 0))(
  ( (tuple2!9381 (_1!4701 (_ BitVec 64)) (_2!4701 V!23891)) )
))
(declare-datatypes ((List!15208 0))(
  ( (Nil!15205) (Cons!15204 (h!16333 tuple2!9380) (t!21516 List!15208)) )
))
(declare-datatypes ((ListLongMap!8193 0))(
  ( (ListLongMap!8194 (toList!4112 List!15208)) )
))
(declare-fun lt!364199 () ListLongMap!8193)

(declare-fun getCurrentListMapNoExtraKeys!2177 (array!44537 array!44539 (_ BitVec 32) (_ BitVec 32) V!23891 V!23891 (_ BitVec 32) Int) ListLongMap!8193)

(assert (=> b!813713 (= lt!364199 (getCurrentListMapNoExtraKeys!2177 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23891)

(declare-fun lt!364200 () ListLongMap!8193)

(assert (=> b!813713 (= lt!364200 (getCurrentListMapNoExtraKeys!2177 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70016 res!555896) b!813707))

(assert (= (and b!813707 res!555893) b!813710))

(assert (= (and b!813710 res!555894) b!813712))

(assert (= (and b!813712 res!555895) b!813713))

(assert (= (and b!813709 condMapEmpty!22831) mapIsEmpty!22831))

(assert (= (and b!813709 (not condMapEmpty!22831)) mapNonEmpty!22831))

(get-info :version)

(assert (= (and mapNonEmpty!22831 ((_ is ValueCellFull!6668) mapValue!22831)) b!813711))

(assert (= (and b!813709 ((_ is ValueCellFull!6668) mapDefault!22831)) b!813708))

(assert (= start!70016 b!813709))

(declare-fun m!755109 () Bool)

(assert (=> start!70016 m!755109))

(declare-fun m!755111 () Bool)

(assert (=> start!70016 m!755111))

(declare-fun m!755113 () Bool)

(assert (=> start!70016 m!755113))

(declare-fun m!755115 () Bool)

(assert (=> b!813712 m!755115))

(declare-fun m!755117 () Bool)

(assert (=> b!813710 m!755117))

(declare-fun m!755119 () Bool)

(assert (=> b!813713 m!755119))

(declare-fun m!755121 () Bool)

(assert (=> b!813713 m!755121))

(declare-fun m!755123 () Bool)

(assert (=> mapNonEmpty!22831 m!755123))

(check-sat tp_is_empty!14167 (not start!70016) (not b_next!12457) (not b!813712) (not mapNonEmpty!22831) b_and!21203 (not b!813713) (not b!813710))
(check-sat b_and!21203 (not b_next!12457))
