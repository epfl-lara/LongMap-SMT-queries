; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70332 () Bool)

(assert start!70332)

(declare-fun b_free!12709 () Bool)

(declare-fun b_next!12709 () Bool)

(assert (=> start!70332 (= b_free!12709 (not b_next!12709))))

(declare-fun tp!44853 () Bool)

(declare-fun b_and!21495 () Bool)

(assert (=> start!70332 (= tp!44853 b_and!21495)))

(declare-fun b!817053 () Bool)

(declare-fun res!557796 () Bool)

(declare-fun e!453341 () Bool)

(assert (=> b!817053 (=> (not res!557796) (not e!453341))))

(declare-datatypes ((array!45017 0))(
  ( (array!45018 (arr!21565 (Array (_ BitVec 32) (_ BitVec 64))) (size!21986 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45017)

(declare-datatypes ((List!15378 0))(
  ( (Nil!15375) (Cons!15374 (h!16503 (_ BitVec 64)) (t!21694 List!15378)) )
))
(declare-fun arrayNoDuplicates!0 (array!45017 (_ BitVec 32) List!15378) Bool)

(assert (=> b!817053 (= res!557796 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15375))))

(declare-fun mapIsEmpty!23221 () Bool)

(declare-fun mapRes!23221 () Bool)

(assert (=> mapIsEmpty!23221 mapRes!23221))

(declare-fun mapNonEmpty!23221 () Bool)

(declare-fun tp!44854 () Bool)

(declare-fun e!453343 () Bool)

(assert (=> mapNonEmpty!23221 (= mapRes!23221 (and tp!44854 e!453343))))

(declare-datatypes ((V!24227 0))(
  ( (V!24228 (val!7257 Int)) )
))
(declare-datatypes ((ValueCell!6794 0))(
  ( (ValueCellFull!6794 (v!9680 V!24227)) (EmptyCell!6794) )
))
(declare-fun mapRest!23221 () (Array (_ BitVec 32) ValueCell!6794))

(declare-fun mapValue!23221 () ValueCell!6794)

(declare-datatypes ((array!45019 0))(
  ( (array!45020 (arr!21566 (Array (_ BitVec 32) ValueCell!6794)) (size!21987 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45019)

(declare-fun mapKey!23221 () (_ BitVec 32))

(assert (=> mapNonEmpty!23221 (= (arr!21566 _values!788) (store mapRest!23221 mapKey!23221 mapValue!23221))))

(declare-fun b!817055 () Bool)

(declare-fun tp_is_empty!14419 () Bool)

(assert (=> b!817055 (= e!453343 tp_is_empty!14419)))

(declare-fun b!817056 () Bool)

(declare-fun e!453342 () Bool)

(assert (=> b!817056 (= e!453342 tp_is_empty!14419)))

(declare-fun b!817057 () Bool)

(declare-fun e!453345 () Bool)

(assert (=> b!817057 (= e!453345 (and e!453342 mapRes!23221))))

(declare-fun condMapEmpty!23221 () Bool)

(declare-fun mapDefault!23221 () ValueCell!6794)

(assert (=> b!817057 (= condMapEmpty!23221 (= (arr!21566 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6794)) mapDefault!23221)))))

(declare-fun res!557795 () Bool)

(assert (=> start!70332 (=> (not res!557795) (not e!453341))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70332 (= res!557795 (validMask!0 mask!1312))))

(assert (=> start!70332 e!453341))

(assert (=> start!70332 tp_is_empty!14419))

(declare-fun array_inv!17323 (array!45017) Bool)

(assert (=> start!70332 (array_inv!17323 _keys!976)))

(assert (=> start!70332 true))

(declare-fun array_inv!17324 (array!45019) Bool)

(assert (=> start!70332 (and (array_inv!17324 _values!788) e!453345)))

(assert (=> start!70332 tp!44853))

(declare-fun b!817054 () Bool)

(assert (=> b!817054 (= e!453341 (not true))))

(declare-datatypes ((tuple2!9558 0))(
  ( (tuple2!9559 (_1!4790 (_ BitVec 64)) (_2!4790 V!24227)) )
))
(declare-datatypes ((List!15379 0))(
  ( (Nil!15376) (Cons!15375 (h!16504 tuple2!9558) (t!21695 List!15379)) )
))
(declare-datatypes ((ListLongMap!8371 0))(
  ( (ListLongMap!8372 (toList!4201 List!15379)) )
))
(declare-fun lt!365949 () ListLongMap!8371)

(declare-fun lt!365947 () ListLongMap!8371)

(assert (=> b!817054 (= lt!365949 lt!365947)))

(declare-fun zeroValueBefore!34 () V!24227)

(declare-fun zeroValueAfter!34 () V!24227)

(declare-fun minValue!754 () V!24227)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27830 0))(
  ( (Unit!27831) )
))
(declare-fun lt!365948 () Unit!27830)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!354 (array!45017 array!45019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24227 V!24227 V!24227 V!24227 (_ BitVec 32) Int) Unit!27830)

(assert (=> b!817054 (= lt!365948 (lemmaNoChangeToArrayThenSameMapNoExtras!354 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2261 (array!45017 array!45019 (_ BitVec 32) (_ BitVec 32) V!24227 V!24227 (_ BitVec 32) Int) ListLongMap!8371)

(assert (=> b!817054 (= lt!365947 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817054 (= lt!365949 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817058 () Bool)

(declare-fun res!557794 () Bool)

(assert (=> b!817058 (=> (not res!557794) (not e!453341))))

(assert (=> b!817058 (= res!557794 (and (= (size!21987 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21986 _keys!976) (size!21987 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817059 () Bool)

(declare-fun res!557793 () Bool)

(assert (=> b!817059 (=> (not res!557793) (not e!453341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45017 (_ BitVec 32)) Bool)

(assert (=> b!817059 (= res!557793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70332 res!557795) b!817058))

(assert (= (and b!817058 res!557794) b!817059))

(assert (= (and b!817059 res!557793) b!817053))

(assert (= (and b!817053 res!557796) b!817054))

(assert (= (and b!817057 condMapEmpty!23221) mapIsEmpty!23221))

(assert (= (and b!817057 (not condMapEmpty!23221)) mapNonEmpty!23221))

(get-info :version)

(assert (= (and mapNonEmpty!23221 ((_ is ValueCellFull!6794) mapValue!23221)) b!817055))

(assert (= (and b!817057 ((_ is ValueCellFull!6794) mapDefault!23221)) b!817056))

(assert (= start!70332 b!817057))

(declare-fun m!758149 () Bool)

(assert (=> b!817054 m!758149))

(declare-fun m!758151 () Bool)

(assert (=> b!817054 m!758151))

(declare-fun m!758153 () Bool)

(assert (=> b!817054 m!758153))

(declare-fun m!758155 () Bool)

(assert (=> start!70332 m!758155))

(declare-fun m!758157 () Bool)

(assert (=> start!70332 m!758157))

(declare-fun m!758159 () Bool)

(assert (=> start!70332 m!758159))

(declare-fun m!758161 () Bool)

(assert (=> b!817053 m!758161))

(declare-fun m!758163 () Bool)

(assert (=> b!817059 m!758163))

(declare-fun m!758165 () Bool)

(assert (=> mapNonEmpty!23221 m!758165))

(check-sat tp_is_empty!14419 (not b!817059) b_and!21495 (not b!817053) (not b_next!12709) (not start!70332) (not b!817054) (not mapNonEmpty!23221))
(check-sat b_and!21495 (not b_next!12709))
