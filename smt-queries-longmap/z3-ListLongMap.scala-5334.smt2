; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71244 () Bool)

(assert start!71244)

(declare-fun b_free!13411 () Bool)

(declare-fun b_next!13411 () Bool)

(assert (=> start!71244 (= b_free!13411 (not b_next!13411))))

(declare-fun tp!46995 () Bool)

(declare-fun b_and!22323 () Bool)

(assert (=> start!71244 (= tp!46995 b_and!22323)))

(declare-fun b!827518 () Bool)

(declare-fun res!564057 () Bool)

(declare-fun e!461021 () Bool)

(assert (=> b!827518 (=> (not res!564057) (not e!461021))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25163 0))(
  ( (V!25164 (val!7608 Int)) )
))
(declare-datatypes ((ValueCell!7145 0))(
  ( (ValueCellFull!7145 (v!10037 V!25163)) (EmptyCell!7145) )
))
(declare-datatypes ((array!46379 0))(
  ( (array!46380 (arr!22234 (Array (_ BitVec 32) ValueCell!7145)) (size!22655 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46379)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!46381 0))(
  ( (array!46382 (arr!22235 (Array (_ BitVec 32) (_ BitVec 64))) (size!22656 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46381)

(assert (=> b!827518 (= res!564057 (and (= (size!22655 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22656 _keys!976) (size!22655 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827519 () Bool)

(declare-fun e!461023 () Bool)

(declare-fun tp_is_empty!15121 () Bool)

(assert (=> b!827519 (= e!461023 tp_is_empty!15121)))

(declare-fun res!564055 () Bool)

(assert (=> start!71244 (=> (not res!564055) (not e!461021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71244 (= res!564055 (validMask!0 mask!1312))))

(assert (=> start!71244 e!461021))

(assert (=> start!71244 tp_is_empty!15121))

(declare-fun array_inv!17777 (array!46381) Bool)

(assert (=> start!71244 (array_inv!17777 _keys!976)))

(assert (=> start!71244 true))

(declare-fun e!461024 () Bool)

(declare-fun array_inv!17778 (array!46379) Bool)

(assert (=> start!71244 (and (array_inv!17778 _values!788) e!461024)))

(assert (=> start!71244 tp!46995))

(declare-fun mapIsEmpty!24310 () Bool)

(declare-fun mapRes!24310 () Bool)

(assert (=> mapIsEmpty!24310 mapRes!24310))

(declare-fun b!827520 () Bool)

(declare-fun res!564058 () Bool)

(assert (=> b!827520 (=> (not res!564058) (not e!461021))))

(declare-datatypes ((List!15882 0))(
  ( (Nil!15879) (Cons!15878 (h!17007 (_ BitVec 64)) (t!22222 List!15882)) )
))
(declare-fun arrayNoDuplicates!0 (array!46381 (_ BitVec 32) List!15882) Bool)

(assert (=> b!827520 (= res!564058 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15879))))

(declare-fun b!827521 () Bool)

(declare-fun res!564056 () Bool)

(assert (=> b!827521 (=> (not res!564056) (not e!461021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46381 (_ BitVec 32)) Bool)

(assert (=> b!827521 (= res!564056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827522 () Bool)

(declare-fun e!461020 () Bool)

(assert (=> b!827522 (= e!461020 tp_is_empty!15121)))

(declare-fun b!827523 () Bool)

(assert (=> b!827523 (= e!461021 false)))

(declare-datatypes ((tuple2!10096 0))(
  ( (tuple2!10097 (_1!5059 (_ BitVec 64)) (_2!5059 V!25163)) )
))
(declare-datatypes ((List!15883 0))(
  ( (Nil!15880) (Cons!15879 (h!17008 tuple2!10096) (t!22223 List!15883)) )
))
(declare-datatypes ((ListLongMap!8909 0))(
  ( (ListLongMap!8910 (toList!4470 List!15883)) )
))
(declare-fun lt!374756 () ListLongMap!8909)

(declare-fun zeroValueAfter!34 () V!25163)

(declare-fun minValue!754 () V!25163)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2502 (array!46381 array!46379 (_ BitVec 32) (_ BitVec 32) V!25163 V!25163 (_ BitVec 32) Int) ListLongMap!8909)

(assert (=> b!827523 (= lt!374756 (getCurrentListMapNoExtraKeys!2502 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25163)

(declare-fun lt!374755 () ListLongMap!8909)

(assert (=> b!827523 (= lt!374755 (getCurrentListMapNoExtraKeys!2502 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24310 () Bool)

(declare-fun tp!46996 () Bool)

(assert (=> mapNonEmpty!24310 (= mapRes!24310 (and tp!46996 e!461023))))

(declare-fun mapKey!24310 () (_ BitVec 32))

(declare-fun mapRest!24310 () (Array (_ BitVec 32) ValueCell!7145))

(declare-fun mapValue!24310 () ValueCell!7145)

(assert (=> mapNonEmpty!24310 (= (arr!22234 _values!788) (store mapRest!24310 mapKey!24310 mapValue!24310))))

(declare-fun b!827524 () Bool)

(assert (=> b!827524 (= e!461024 (and e!461020 mapRes!24310))))

(declare-fun condMapEmpty!24310 () Bool)

(declare-fun mapDefault!24310 () ValueCell!7145)

(assert (=> b!827524 (= condMapEmpty!24310 (= (arr!22234 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7145)) mapDefault!24310)))))

(assert (= (and start!71244 res!564055) b!827518))

(assert (= (and b!827518 res!564057) b!827521))

(assert (= (and b!827521 res!564056) b!827520))

(assert (= (and b!827520 res!564058) b!827523))

(assert (= (and b!827524 condMapEmpty!24310) mapIsEmpty!24310))

(assert (= (and b!827524 (not condMapEmpty!24310)) mapNonEmpty!24310))

(get-info :version)

(assert (= (and mapNonEmpty!24310 ((_ is ValueCellFull!7145) mapValue!24310)) b!827519))

(assert (= (and b!827524 ((_ is ValueCellFull!7145) mapDefault!24310)) b!827522))

(assert (= start!71244 b!827524))

(declare-fun m!770015 () Bool)

(assert (=> start!71244 m!770015))

(declare-fun m!770017 () Bool)

(assert (=> start!71244 m!770017))

(declare-fun m!770019 () Bool)

(assert (=> start!71244 m!770019))

(declare-fun m!770021 () Bool)

(assert (=> b!827523 m!770021))

(declare-fun m!770023 () Bool)

(assert (=> b!827523 m!770023))

(declare-fun m!770025 () Bool)

(assert (=> b!827521 m!770025))

(declare-fun m!770027 () Bool)

(assert (=> mapNonEmpty!24310 m!770027))

(declare-fun m!770029 () Bool)

(assert (=> b!827520 m!770029))

(check-sat (not b!827520) b_and!22323 (not b!827521) tp_is_empty!15121 (not b_next!13411) (not start!71244) (not mapNonEmpty!24310) (not b!827523))
(check-sat b_and!22323 (not b_next!13411))
