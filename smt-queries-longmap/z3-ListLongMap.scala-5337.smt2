; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71292 () Bool)

(assert start!71292)

(declare-fun b_free!13429 () Bool)

(declare-fun b_next!13429 () Bool)

(assert (=> start!71292 (= b_free!13429 (not b_next!13429))))

(declare-fun tp!47056 () Bool)

(declare-fun b_and!22361 () Bool)

(assert (=> start!71292 (= tp!47056 b_and!22361)))

(declare-fun b!827979 () Bool)

(declare-fun e!461331 () Bool)

(declare-fun tp_is_empty!15139 () Bool)

(assert (=> b!827979 (= e!461331 tp_is_empty!15139)))

(declare-fun b!827980 () Bool)

(declare-fun e!461333 () Bool)

(declare-fun e!461335 () Bool)

(declare-fun mapRes!24343 () Bool)

(assert (=> b!827980 (= e!461333 (and e!461335 mapRes!24343))))

(declare-fun condMapEmpty!24343 () Bool)

(declare-datatypes ((V!25187 0))(
  ( (V!25188 (val!7617 Int)) )
))
(declare-datatypes ((ValueCell!7154 0))(
  ( (ValueCellFull!7154 (v!10047 V!25187)) (EmptyCell!7154) )
))
(declare-datatypes ((array!46417 0))(
  ( (array!46418 (arr!22251 (Array (_ BitVec 32) ValueCell!7154)) (size!22672 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46417)

(declare-fun mapDefault!24343 () ValueCell!7154)

(assert (=> b!827980 (= condMapEmpty!24343 (= (arr!22251 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7154)) mapDefault!24343)))))

(declare-fun b!827981 () Bool)

(declare-fun e!461332 () Bool)

(assert (=> b!827981 (= e!461332 true)))

(declare-datatypes ((tuple2!10108 0))(
  ( (tuple2!10109 (_1!5065 (_ BitVec 64)) (_2!5065 V!25187)) )
))
(declare-datatypes ((List!15895 0))(
  ( (Nil!15892) (Cons!15891 (h!17020 tuple2!10108) (t!22239 List!15895)) )
))
(declare-datatypes ((ListLongMap!8921 0))(
  ( (ListLongMap!8922 (toList!4476 List!15895)) )
))
(declare-fun lt!375005 () ListLongMap!8921)

(declare-datatypes ((array!46419 0))(
  ( (array!46420 (arr!22252 (Array (_ BitVec 32) (_ BitVec 64))) (size!22673 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46419)

(declare-fun zeroValueAfter!34 () V!25187)

(declare-fun minValue!754 () V!25187)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMap!2531 (array!46419 array!46417 (_ BitVec 32) (_ BitVec 32) V!25187 V!25187 (_ BitVec 32) Int) ListLongMap!8921)

(assert (=> b!827981 (= lt!375005 (getCurrentListMap!2531 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25187)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!375004 () ListLongMap!8921)

(declare-fun +!1987 (ListLongMap!8921 tuple2!10108) ListLongMap!8921)

(assert (=> b!827981 (= lt!375004 (+!1987 (getCurrentListMap!2531 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!827982 () Bool)

(declare-fun res!564278 () Bool)

(declare-fun e!461336 () Bool)

(assert (=> b!827982 (=> (not res!564278) (not e!461336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46419 (_ BitVec 32)) Bool)

(assert (=> b!827982 (= res!564278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827983 () Bool)

(assert (=> b!827983 (= e!461336 (not e!461332))))

(declare-fun res!564279 () Bool)

(assert (=> b!827983 (=> res!564279 e!461332)))

(assert (=> b!827983 (= res!564279 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!375001 () ListLongMap!8921)

(declare-fun lt!375002 () ListLongMap!8921)

(assert (=> b!827983 (= lt!375001 lt!375002)))

(declare-datatypes ((Unit!28323 0))(
  ( (Unit!28324) )
))
(declare-fun lt!375003 () Unit!28323)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!577 (array!46419 array!46417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25187 V!25187 V!25187 V!25187 (_ BitVec 32) Int) Unit!28323)

(assert (=> b!827983 (= lt!375003 (lemmaNoChangeToArrayThenSameMapNoExtras!577 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2507 (array!46419 array!46417 (_ BitVec 32) (_ BitVec 32) V!25187 V!25187 (_ BitVec 32) Int) ListLongMap!8921)

(assert (=> b!827983 (= lt!375002 (getCurrentListMapNoExtraKeys!2507 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827983 (= lt!375001 (getCurrentListMapNoExtraKeys!2507 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827984 () Bool)

(declare-fun res!564280 () Bool)

(assert (=> b!827984 (=> (not res!564280) (not e!461336))))

(assert (=> b!827984 (= res!564280 (and (= (size!22672 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22673 _keys!976) (size!22672 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24343 () Bool)

(assert (=> mapIsEmpty!24343 mapRes!24343))

(declare-fun b!827978 () Bool)

(assert (=> b!827978 (= e!461335 tp_is_empty!15139)))

(declare-fun res!564281 () Bool)

(assert (=> start!71292 (=> (not res!564281) (not e!461336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71292 (= res!564281 (validMask!0 mask!1312))))

(assert (=> start!71292 e!461336))

(assert (=> start!71292 tp_is_empty!15139))

(declare-fun array_inv!17787 (array!46419) Bool)

(assert (=> start!71292 (array_inv!17787 _keys!976)))

(assert (=> start!71292 true))

(declare-fun array_inv!17788 (array!46417) Bool)

(assert (=> start!71292 (and (array_inv!17788 _values!788) e!461333)))

(assert (=> start!71292 tp!47056))

(declare-fun mapNonEmpty!24343 () Bool)

(declare-fun tp!47055 () Bool)

(assert (=> mapNonEmpty!24343 (= mapRes!24343 (and tp!47055 e!461331))))

(declare-fun mapValue!24343 () ValueCell!7154)

(declare-fun mapKey!24343 () (_ BitVec 32))

(declare-fun mapRest!24343 () (Array (_ BitVec 32) ValueCell!7154))

(assert (=> mapNonEmpty!24343 (= (arr!22251 _values!788) (store mapRest!24343 mapKey!24343 mapValue!24343))))

(declare-fun b!827985 () Bool)

(declare-fun res!564282 () Bool)

(assert (=> b!827985 (=> (not res!564282) (not e!461336))))

(declare-datatypes ((List!15896 0))(
  ( (Nil!15893) (Cons!15892 (h!17021 (_ BitVec 64)) (t!22240 List!15896)) )
))
(declare-fun arrayNoDuplicates!0 (array!46419 (_ BitVec 32) List!15896) Bool)

(assert (=> b!827985 (= res!564282 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15893))))

(assert (= (and start!71292 res!564281) b!827984))

(assert (= (and b!827984 res!564280) b!827982))

(assert (= (and b!827982 res!564278) b!827985))

(assert (= (and b!827985 res!564282) b!827983))

(assert (= (and b!827983 (not res!564279)) b!827981))

(assert (= (and b!827980 condMapEmpty!24343) mapIsEmpty!24343))

(assert (= (and b!827980 (not condMapEmpty!24343)) mapNonEmpty!24343))

(get-info :version)

(assert (= (and mapNonEmpty!24343 ((_ is ValueCellFull!7154) mapValue!24343)) b!827979))

(assert (= (and b!827980 ((_ is ValueCellFull!7154) mapDefault!24343)) b!827978))

(assert (= start!71292 b!827980))

(declare-fun m!770417 () Bool)

(assert (=> mapNonEmpty!24343 m!770417))

(declare-fun m!770419 () Bool)

(assert (=> start!71292 m!770419))

(declare-fun m!770421 () Bool)

(assert (=> start!71292 m!770421))

(declare-fun m!770423 () Bool)

(assert (=> start!71292 m!770423))

(declare-fun m!770425 () Bool)

(assert (=> b!827982 m!770425))

(declare-fun m!770427 () Bool)

(assert (=> b!827981 m!770427))

(declare-fun m!770429 () Bool)

(assert (=> b!827981 m!770429))

(assert (=> b!827981 m!770429))

(declare-fun m!770431 () Bool)

(assert (=> b!827981 m!770431))

(declare-fun m!770433 () Bool)

(assert (=> b!827983 m!770433))

(declare-fun m!770435 () Bool)

(assert (=> b!827983 m!770435))

(declare-fun m!770437 () Bool)

(assert (=> b!827983 m!770437))

(declare-fun m!770439 () Bool)

(assert (=> b!827985 m!770439))

(check-sat tp_is_empty!15139 (not b_next!13429) (not b!827982) b_and!22361 (not b!827983) (not b!827985) (not mapNonEmpty!24343) (not start!71292) (not b!827981))
(check-sat b_and!22361 (not b_next!13429))
