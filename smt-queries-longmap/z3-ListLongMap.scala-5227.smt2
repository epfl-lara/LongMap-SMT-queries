; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70406 () Bool)

(assert start!70406)

(declare-fun b_free!12769 () Bool)

(declare-fun b_next!12769 () Bool)

(assert (=> start!70406 (= b_free!12769 (not b_next!12769))))

(declare-fun tp!45037 () Bool)

(declare-fun b_and!21563 () Bool)

(assert (=> start!70406 (= tp!45037 b_and!21563)))

(declare-fun b!817797 () Bool)

(declare-fun e!453876 () Bool)

(declare-fun tp_is_empty!14479 () Bool)

(assert (=> b!817797 (= e!453876 tp_is_empty!14479)))

(declare-fun mapNonEmpty!23314 () Bool)

(declare-fun mapRes!23314 () Bool)

(declare-fun tp!45036 () Bool)

(assert (=> mapNonEmpty!23314 (= mapRes!23314 (and tp!45036 e!453876))))

(declare-datatypes ((V!24307 0))(
  ( (V!24308 (val!7287 Int)) )
))
(declare-datatypes ((ValueCell!6824 0))(
  ( (ValueCellFull!6824 (v!9710 V!24307)) (EmptyCell!6824) )
))
(declare-datatypes ((array!45135 0))(
  ( (array!45136 (arr!21623 (Array (_ BitVec 32) ValueCell!6824)) (size!22044 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45135)

(declare-fun mapKey!23314 () (_ BitVec 32))

(declare-fun mapValue!23314 () ValueCell!6824)

(declare-fun mapRest!23314 () (Array (_ BitVec 32) ValueCell!6824))

(assert (=> mapNonEmpty!23314 (= (arr!21623 _values!788) (store mapRest!23314 mapKey!23314 mapValue!23314))))

(declare-fun b!817798 () Bool)

(declare-fun e!453878 () Bool)

(declare-fun e!453877 () Bool)

(assert (=> b!817798 (= e!453878 (and e!453877 mapRes!23314))))

(declare-fun condMapEmpty!23314 () Bool)

(declare-fun mapDefault!23314 () ValueCell!6824)

(assert (=> b!817798 (= condMapEmpty!23314 (= (arr!21623 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6824)) mapDefault!23314)))))

(declare-fun res!558214 () Bool)

(declare-fun e!453880 () Bool)

(assert (=> start!70406 (=> (not res!558214) (not e!453880))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70406 (= res!558214 (validMask!0 mask!1312))))

(assert (=> start!70406 e!453880))

(assert (=> start!70406 tp_is_empty!14479))

(declare-datatypes ((array!45137 0))(
  ( (array!45138 (arr!21624 (Array (_ BitVec 32) (_ BitVec 64))) (size!22045 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45137)

(declare-fun array_inv!17359 (array!45137) Bool)

(assert (=> start!70406 (array_inv!17359 _keys!976)))

(assert (=> start!70406 true))

(declare-fun array_inv!17360 (array!45135) Bool)

(assert (=> start!70406 (and (array_inv!17360 _values!788) e!453878)))

(assert (=> start!70406 tp!45037))

(declare-fun b!817799 () Bool)

(declare-fun res!558215 () Bool)

(assert (=> b!817799 (=> (not res!558215) (not e!453880))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817799 (= res!558215 (and (= (size!22044 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22045 _keys!976) (size!22044 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817800 () Bool)

(declare-fun res!558213 () Bool)

(assert (=> b!817800 (=> (not res!558213) (not e!453880))))

(declare-datatypes ((List!15420 0))(
  ( (Nil!15417) (Cons!15416 (h!16545 (_ BitVec 64)) (t!21738 List!15420)) )
))
(declare-fun arrayNoDuplicates!0 (array!45137 (_ BitVec 32) List!15420) Bool)

(assert (=> b!817800 (= res!558213 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15417))))

(declare-fun b!817801 () Bool)

(declare-fun res!558217 () Bool)

(assert (=> b!817801 (=> (not res!558217) (not e!453880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45137 (_ BitVec 32)) Bool)

(assert (=> b!817801 (= res!558217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817802 () Bool)

(declare-fun e!453875 () Bool)

(assert (=> b!817802 (= e!453875 true)))

(declare-fun zeroValueBefore!34 () V!24307)

(declare-fun minValue!754 () V!24307)

(declare-datatypes ((tuple2!9596 0))(
  ( (tuple2!9597 (_1!4809 (_ BitVec 64)) (_2!4809 V!24307)) )
))
(declare-datatypes ((List!15421 0))(
  ( (Nil!15418) (Cons!15417 (h!16546 tuple2!9596) (t!21739 List!15421)) )
))
(declare-datatypes ((ListLongMap!8409 0))(
  ( (ListLongMap!8410 (toList!4220 List!15421)) )
))
(declare-fun lt!366286 () ListLongMap!8409)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2373 (array!45137 array!45135 (_ BitVec 32) (_ BitVec 32) V!24307 V!24307 (_ BitVec 32) Int) ListLongMap!8409)

(assert (=> b!817802 (= lt!366286 (getCurrentListMap!2373 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23314 () Bool)

(assert (=> mapIsEmpty!23314 mapRes!23314))

(declare-fun b!817803 () Bool)

(assert (=> b!817803 (= e!453880 (not e!453875))))

(declare-fun res!558216 () Bool)

(assert (=> b!817803 (=> res!558216 e!453875)))

(assert (=> b!817803 (= res!558216 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366287 () ListLongMap!8409)

(declare-fun lt!366288 () ListLongMap!8409)

(assert (=> b!817803 (= lt!366287 lt!366288)))

(declare-fun zeroValueAfter!34 () V!24307)

(declare-datatypes ((Unit!27866 0))(
  ( (Unit!27867) )
))
(declare-fun lt!366289 () Unit!27866)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!372 (array!45137 array!45135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24307 V!24307 V!24307 V!24307 (_ BitVec 32) Int) Unit!27866)

(assert (=> b!817803 (= lt!366289 (lemmaNoChangeToArrayThenSameMapNoExtras!372 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2279 (array!45137 array!45135 (_ BitVec 32) (_ BitVec 32) V!24307 V!24307 (_ BitVec 32) Int) ListLongMap!8409)

(assert (=> b!817803 (= lt!366288 (getCurrentListMapNoExtraKeys!2279 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817803 (= lt!366287 (getCurrentListMapNoExtraKeys!2279 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817804 () Bool)

(assert (=> b!817804 (= e!453877 tp_is_empty!14479)))

(assert (= (and start!70406 res!558214) b!817799))

(assert (= (and b!817799 res!558215) b!817801))

(assert (= (and b!817801 res!558217) b!817800))

(assert (= (and b!817800 res!558213) b!817803))

(assert (= (and b!817803 (not res!558216)) b!817802))

(assert (= (and b!817798 condMapEmpty!23314) mapIsEmpty!23314))

(assert (= (and b!817798 (not condMapEmpty!23314)) mapNonEmpty!23314))

(get-info :version)

(assert (= (and mapNonEmpty!23314 ((_ is ValueCellFull!6824) mapValue!23314)) b!817797))

(assert (= (and b!817798 ((_ is ValueCellFull!6824) mapDefault!23314)) b!817804))

(assert (= start!70406 b!817798))

(declare-fun m!758773 () Bool)

(assert (=> b!817802 m!758773))

(declare-fun m!758775 () Bool)

(assert (=> b!817801 m!758775))

(declare-fun m!758777 () Bool)

(assert (=> mapNonEmpty!23314 m!758777))

(declare-fun m!758779 () Bool)

(assert (=> b!817803 m!758779))

(declare-fun m!758781 () Bool)

(assert (=> b!817803 m!758781))

(declare-fun m!758783 () Bool)

(assert (=> b!817803 m!758783))

(declare-fun m!758785 () Bool)

(assert (=> b!817800 m!758785))

(declare-fun m!758787 () Bool)

(assert (=> start!70406 m!758787))

(declare-fun m!758789 () Bool)

(assert (=> start!70406 m!758789))

(declare-fun m!758791 () Bool)

(assert (=> start!70406 m!758791))

(check-sat tp_is_empty!14479 (not mapNonEmpty!23314) (not start!70406) (not b!817803) (not b!817802) (not b!817800) b_and!21563 (not b!817801) (not b_next!12769))
(check-sat b_and!21563 (not b_next!12769))
