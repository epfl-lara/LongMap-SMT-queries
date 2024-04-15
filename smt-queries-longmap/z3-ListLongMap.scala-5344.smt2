; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71406 () Bool)

(assert start!71406)

(declare-fun b_free!13471 () Bool)

(declare-fun b_next!13471 () Bool)

(assert (=> start!71406 (= b_free!13471 (not b_next!13471))))

(declare-fun tp!47194 () Bool)

(declare-fun b_and!22451 () Bool)

(assert (=> start!71406 (= tp!47194 b_and!22451)))

(declare-fun b!829253 () Bool)

(declare-fun res!564958 () Bool)

(declare-fun e!462217 () Bool)

(assert (=> b!829253 (=> (not res!564958) (not e!462217))))

(declare-datatypes ((array!46503 0))(
  ( (array!46504 (arr!22290 (Array (_ BitVec 32) (_ BitVec 64))) (size!22711 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46503)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25243 0))(
  ( (V!25244 (val!7638 Int)) )
))
(declare-datatypes ((ValueCell!7175 0))(
  ( (ValueCellFull!7175 (v!10072 V!25243)) (EmptyCell!7175) )
))
(declare-datatypes ((array!46505 0))(
  ( (array!46506 (arr!22291 (Array (_ BitVec 32) ValueCell!7175)) (size!22712 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46505)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829253 (= res!564958 (and (= (size!22712 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22711 _keys!976) (size!22712 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829254 () Bool)

(declare-fun e!462222 () Bool)

(declare-fun e!462219 () Bool)

(declare-fun mapRes!24418 () Bool)

(assert (=> b!829254 (= e!462222 (and e!462219 mapRes!24418))))

(declare-fun condMapEmpty!24418 () Bool)

(declare-fun mapDefault!24418 () ValueCell!7175)

(assert (=> b!829254 (= condMapEmpty!24418 (= (arr!22291 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7175)) mapDefault!24418)))))

(declare-fun b!829255 () Bool)

(declare-fun tp_is_empty!15181 () Bool)

(assert (=> b!829255 (= e!462219 tp_is_empty!15181)))

(declare-datatypes ((tuple2!10142 0))(
  ( (tuple2!10143 (_1!5082 (_ BitVec 64)) (_2!5082 V!25243)) )
))
(declare-datatypes ((List!15928 0))(
  ( (Nil!15925) (Cons!15924 (h!17053 tuple2!10142) (t!22280 List!15928)) )
))
(declare-datatypes ((ListLongMap!8955 0))(
  ( (ListLongMap!8956 (toList!4493 List!15928)) )
))
(declare-fun lt!375908 () ListLongMap!8955)

(declare-fun lt!375909 () ListLongMap!8955)

(declare-fun zeroValueAfter!34 () V!25243)

(declare-fun b!829256 () Bool)

(declare-fun lt!375910 () tuple2!10142)

(declare-fun e!462221 () Bool)

(declare-fun +!2003 (ListLongMap!8955 tuple2!10142) ListLongMap!8955)

(assert (=> b!829256 (= e!462221 (= lt!375909 (+!2003 (+!2003 lt!375908 (tuple2!10143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!375910)))))

(declare-fun b!829258 () Bool)

(declare-fun res!564960 () Bool)

(assert (=> b!829258 (=> (not res!564960) (not e!462217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46503 (_ BitVec 32)) Bool)

(assert (=> b!829258 (= res!564960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829259 () Bool)

(declare-fun res!564957 () Bool)

(assert (=> b!829259 (=> (not res!564957) (not e!462217))))

(declare-datatypes ((List!15929 0))(
  ( (Nil!15926) (Cons!15925 (h!17054 (_ BitVec 64)) (t!22281 List!15929)) )
))
(declare-fun arrayNoDuplicates!0 (array!46503 (_ BitVec 32) List!15929) Bool)

(assert (=> b!829259 (= res!564957 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15926))))

(declare-fun mapNonEmpty!24418 () Bool)

(declare-fun tp!47193 () Bool)

(declare-fun e!462223 () Bool)

(assert (=> mapNonEmpty!24418 (= mapRes!24418 (and tp!47193 e!462223))))

(declare-fun mapKey!24418 () (_ BitVec 32))

(declare-fun mapValue!24418 () ValueCell!7175)

(declare-fun mapRest!24418 () (Array (_ BitVec 32) ValueCell!7175))

(assert (=> mapNonEmpty!24418 (= (arr!22291 _values!788) (store mapRest!24418 mapKey!24418 mapValue!24418))))

(declare-fun mapIsEmpty!24418 () Bool)

(assert (=> mapIsEmpty!24418 mapRes!24418))

(declare-fun b!829260 () Bool)

(declare-fun e!462220 () Bool)

(assert (=> b!829260 (= e!462220 true)))

(assert (=> b!829260 e!462221))

(declare-fun res!564961 () Bool)

(assert (=> b!829260 (=> (not res!564961) (not e!462221))))

(declare-fun lt!375911 () ListLongMap!8955)

(assert (=> b!829260 (= res!564961 (= lt!375911 (+!2003 lt!375908 lt!375910)))))

(declare-fun minValue!754 () V!25243)

(assert (=> b!829260 (= lt!375910 (tuple2!10143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2546 (array!46503 array!46505 (_ BitVec 32) (_ BitVec 32) V!25243 V!25243 (_ BitVec 32) Int) ListLongMap!8955)

(assert (=> b!829260 (= lt!375909 (getCurrentListMap!2546 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25243)

(assert (=> b!829260 (= lt!375911 (getCurrentListMap!2546 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829261 () Bool)

(assert (=> b!829261 (= e!462217 (not e!462220))))

(declare-fun res!564959 () Bool)

(assert (=> b!829261 (=> res!564959 e!462220)))

(assert (=> b!829261 (= res!564959 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!375913 () ListLongMap!8955)

(assert (=> b!829261 (= lt!375908 lt!375913)))

(declare-datatypes ((Unit!28361 0))(
  ( (Unit!28362) )
))
(declare-fun lt!375912 () Unit!28361)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!592 (array!46503 array!46505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25243 V!25243 V!25243 V!25243 (_ BitVec 32) Int) Unit!28361)

(assert (=> b!829261 (= lt!375912 (lemmaNoChangeToArrayThenSameMapNoExtras!592 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2522 (array!46503 array!46505 (_ BitVec 32) (_ BitVec 32) V!25243 V!25243 (_ BitVec 32) Int) ListLongMap!8955)

(assert (=> b!829261 (= lt!375913 (getCurrentListMapNoExtraKeys!2522 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829261 (= lt!375908 (getCurrentListMapNoExtraKeys!2522 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829257 () Bool)

(assert (=> b!829257 (= e!462223 tp_is_empty!15181)))

(declare-fun res!564956 () Bool)

(assert (=> start!71406 (=> (not res!564956) (not e!462217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71406 (= res!564956 (validMask!0 mask!1312))))

(assert (=> start!71406 e!462217))

(assert (=> start!71406 tp_is_empty!15181))

(declare-fun array_inv!17821 (array!46503) Bool)

(assert (=> start!71406 (array_inv!17821 _keys!976)))

(assert (=> start!71406 true))

(declare-fun array_inv!17822 (array!46505) Bool)

(assert (=> start!71406 (and (array_inv!17822 _values!788) e!462222)))

(assert (=> start!71406 tp!47194))

(assert (= (and start!71406 res!564956) b!829253))

(assert (= (and b!829253 res!564958) b!829258))

(assert (= (and b!829258 res!564960) b!829259))

(assert (= (and b!829259 res!564957) b!829261))

(assert (= (and b!829261 (not res!564959)) b!829260))

(assert (= (and b!829260 res!564961) b!829256))

(assert (= (and b!829254 condMapEmpty!24418) mapIsEmpty!24418))

(assert (= (and b!829254 (not condMapEmpty!24418)) mapNonEmpty!24418))

(get-info :version)

(assert (= (and mapNonEmpty!24418 ((_ is ValueCellFull!7175) mapValue!24418)) b!829257))

(assert (= (and b!829254 ((_ is ValueCellFull!7175) mapDefault!24418)) b!829255))

(assert (= start!71406 b!829254))

(declare-fun m!771733 () Bool)

(assert (=> start!71406 m!771733))

(declare-fun m!771735 () Bool)

(assert (=> start!71406 m!771735))

(declare-fun m!771737 () Bool)

(assert (=> start!71406 m!771737))

(declare-fun m!771739 () Bool)

(assert (=> mapNonEmpty!24418 m!771739))

(declare-fun m!771741 () Bool)

(assert (=> b!829259 m!771741))

(declare-fun m!771743 () Bool)

(assert (=> b!829258 m!771743))

(declare-fun m!771745 () Bool)

(assert (=> b!829260 m!771745))

(declare-fun m!771747 () Bool)

(assert (=> b!829260 m!771747))

(declare-fun m!771749 () Bool)

(assert (=> b!829260 m!771749))

(declare-fun m!771751 () Bool)

(assert (=> b!829261 m!771751))

(declare-fun m!771753 () Bool)

(assert (=> b!829261 m!771753))

(declare-fun m!771755 () Bool)

(assert (=> b!829261 m!771755))

(declare-fun m!771757 () Bool)

(assert (=> b!829256 m!771757))

(assert (=> b!829256 m!771757))

(declare-fun m!771759 () Bool)

(assert (=> b!829256 m!771759))

(check-sat tp_is_empty!15181 (not mapNonEmpty!24418) b_and!22451 (not b_next!13471) (not b!829258) (not b!829256) (not b!829259) (not b!829261) (not b!829260) (not start!71406))
(check-sat b_and!22451 (not b_next!13471))
