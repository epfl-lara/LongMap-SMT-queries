; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70282 () Bool)

(assert start!70282)

(declare-fun b_free!12657 () Bool)

(declare-fun b_next!12657 () Bool)

(assert (=> start!70282 (= b_free!12657 (not b_next!12657))))

(declare-fun tp!44694 () Bool)

(declare-fun b_and!21457 () Bool)

(assert (=> start!70282 (= tp!44694 b_and!21457)))

(declare-fun res!557449 () Bool)

(declare-fun e!452937 () Bool)

(assert (=> start!70282 (=> (not res!557449) (not e!452937))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70282 (= res!557449 (validMask!0 mask!1312))))

(assert (=> start!70282 e!452937))

(declare-fun tp_is_empty!14367 () Bool)

(assert (=> start!70282 tp_is_empty!14367))

(declare-datatypes ((array!44936 0))(
  ( (array!44937 (arr!21525 (Array (_ BitVec 32) (_ BitVec 64))) (size!21946 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44936)

(declare-fun array_inv!17225 (array!44936) Bool)

(assert (=> start!70282 (array_inv!17225 _keys!976)))

(assert (=> start!70282 true))

(declare-datatypes ((V!24157 0))(
  ( (V!24158 (val!7231 Int)) )
))
(declare-datatypes ((ValueCell!6768 0))(
  ( (ValueCellFull!6768 (v!9659 V!24157)) (EmptyCell!6768) )
))
(declare-datatypes ((array!44938 0))(
  ( (array!44939 (arr!21526 (Array (_ BitVec 32) ValueCell!6768)) (size!21947 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44938)

(declare-fun e!452938 () Bool)

(declare-fun array_inv!17226 (array!44938) Bool)

(assert (=> start!70282 (and (array_inv!17226 _values!788) e!452938)))

(assert (=> start!70282 tp!44694))

(declare-fun b!816511 () Bool)

(declare-fun res!557448 () Bool)

(assert (=> b!816511 (=> (not res!557448) (not e!452937))))

(declare-datatypes ((List!15331 0))(
  ( (Nil!15328) (Cons!15327 (h!16456 (_ BitVec 64)) (t!21654 List!15331)) )
))
(declare-fun arrayNoDuplicates!0 (array!44936 (_ BitVec 32) List!15331) Bool)

(assert (=> b!816511 (= res!557448 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15328))))

(declare-fun mapIsEmpty!23140 () Bool)

(declare-fun mapRes!23140 () Bool)

(assert (=> mapIsEmpty!23140 mapRes!23140))

(declare-fun b!816512 () Bool)

(declare-fun e!452936 () Bool)

(assert (=> b!816512 (= e!452936 tp_is_empty!14367)))

(declare-fun b!816513 () Bool)

(declare-fun e!452935 () Bool)

(assert (=> b!816513 (= e!452935 true)))

(declare-fun zeroValueAfter!34 () V!24157)

(declare-fun minValue!754 () V!24157)

(declare-datatypes ((tuple2!9502 0))(
  ( (tuple2!9503 (_1!4762 (_ BitVec 64)) (_2!4762 V!24157)) )
))
(declare-datatypes ((List!15332 0))(
  ( (Nil!15329) (Cons!15328 (h!16457 tuple2!9502) (t!21655 List!15332)) )
))
(declare-datatypes ((ListLongMap!8325 0))(
  ( (ListLongMap!8326 (toList!4178 List!15332)) )
))
(declare-fun lt!365720 () ListLongMap!8325)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMap!2403 (array!44936 array!44938 (_ BitVec 32) (_ BitVec 32) V!24157 V!24157 (_ BitVec 32) Int) ListLongMap!8325)

(assert (=> b!816513 (= lt!365720 (getCurrentListMap!2403 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24157)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365722 () ListLongMap!8325)

(declare-fun +!1809 (ListLongMap!8325 tuple2!9502) ListLongMap!8325)

(assert (=> b!816513 (= lt!365722 (+!1809 (getCurrentListMap!2403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816514 () Bool)

(assert (=> b!816514 (= e!452938 (and e!452936 mapRes!23140))))

(declare-fun condMapEmpty!23140 () Bool)

(declare-fun mapDefault!23140 () ValueCell!6768)

(assert (=> b!816514 (= condMapEmpty!23140 (= (arr!21526 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6768)) mapDefault!23140)))))

(declare-fun b!816515 () Bool)

(declare-fun e!452934 () Bool)

(assert (=> b!816515 (= e!452934 tp_is_empty!14367)))

(declare-fun b!816516 () Bool)

(assert (=> b!816516 (= e!452937 (not e!452935))))

(declare-fun res!557447 () Bool)

(assert (=> b!816516 (=> res!557447 e!452935)))

(assert (=> b!816516 (= res!557447 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365718 () ListLongMap!8325)

(declare-fun lt!365719 () ListLongMap!8325)

(assert (=> b!816516 (= lt!365718 lt!365719)))

(declare-datatypes ((Unit!27844 0))(
  ( (Unit!27845) )
))
(declare-fun lt!365721 () Unit!27844)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!332 (array!44936 array!44938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24157 V!24157 V!24157 V!24157 (_ BitVec 32) Int) Unit!27844)

(assert (=> b!816516 (= lt!365721 (lemmaNoChangeToArrayThenSameMapNoExtras!332 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2222 (array!44936 array!44938 (_ BitVec 32) (_ BitVec 32) V!24157 V!24157 (_ BitVec 32) Int) ListLongMap!8325)

(assert (=> b!816516 (= lt!365719 (getCurrentListMapNoExtraKeys!2222 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816516 (= lt!365718 (getCurrentListMapNoExtraKeys!2222 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816517 () Bool)

(declare-fun res!557450 () Bool)

(assert (=> b!816517 (=> (not res!557450) (not e!452937))))

(assert (=> b!816517 (= res!557450 (and (= (size!21947 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21946 _keys!976) (size!21947 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816518 () Bool)

(declare-fun res!557451 () Bool)

(assert (=> b!816518 (=> (not res!557451) (not e!452937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44936 (_ BitVec 32)) Bool)

(assert (=> b!816518 (= res!557451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23140 () Bool)

(declare-fun tp!44695 () Bool)

(assert (=> mapNonEmpty!23140 (= mapRes!23140 (and tp!44695 e!452934))))

(declare-fun mapKey!23140 () (_ BitVec 32))

(declare-fun mapRest!23140 () (Array (_ BitVec 32) ValueCell!6768))

(declare-fun mapValue!23140 () ValueCell!6768)

(assert (=> mapNonEmpty!23140 (= (arr!21526 _values!788) (store mapRest!23140 mapKey!23140 mapValue!23140))))

(assert (= (and start!70282 res!557449) b!816517))

(assert (= (and b!816517 res!557450) b!816518))

(assert (= (and b!816518 res!557451) b!816511))

(assert (= (and b!816511 res!557448) b!816516))

(assert (= (and b!816516 (not res!557447)) b!816513))

(assert (= (and b!816514 condMapEmpty!23140) mapIsEmpty!23140))

(assert (= (and b!816514 (not condMapEmpty!23140)) mapNonEmpty!23140))

(get-info :version)

(assert (= (and mapNonEmpty!23140 ((_ is ValueCellFull!6768) mapValue!23140)) b!816515))

(assert (= (and b!816514 ((_ is ValueCellFull!6768) mapDefault!23140)) b!816512))

(assert (= start!70282 b!816514))

(declare-fun m!758143 () Bool)

(assert (=> start!70282 m!758143))

(declare-fun m!758145 () Bool)

(assert (=> start!70282 m!758145))

(declare-fun m!758147 () Bool)

(assert (=> start!70282 m!758147))

(declare-fun m!758149 () Bool)

(assert (=> mapNonEmpty!23140 m!758149))

(declare-fun m!758151 () Bool)

(assert (=> b!816518 m!758151))

(declare-fun m!758153 () Bool)

(assert (=> b!816513 m!758153))

(declare-fun m!758155 () Bool)

(assert (=> b!816513 m!758155))

(assert (=> b!816513 m!758155))

(declare-fun m!758157 () Bool)

(assert (=> b!816513 m!758157))

(declare-fun m!758159 () Bool)

(assert (=> b!816511 m!758159))

(declare-fun m!758161 () Bool)

(assert (=> b!816516 m!758161))

(declare-fun m!758163 () Bool)

(assert (=> b!816516 m!758163))

(declare-fun m!758165 () Bool)

(assert (=> b!816516 m!758165))

(check-sat (not mapNonEmpty!23140) (not start!70282) (not b_next!12657) tp_is_empty!14367 (not b!816516) b_and!21457 (not b!816518) (not b!816513) (not b!816511))
(check-sat b_and!21457 (not b_next!12657))
