; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71296 () Bool)

(assert start!71296)

(declare-fun b_free!13297 () Bool)

(declare-fun b_next!13297 () Bool)

(assert (=> start!71296 (= b_free!13297 (not b_next!13297))))

(declare-fun tp!46651 () Bool)

(declare-fun b_and!22233 () Bool)

(assert (=> start!71296 (= tp!46651 b_and!22233)))

(declare-fun mapIsEmpty!24136 () Bool)

(declare-fun mapRes!24136 () Bool)

(assert (=> mapIsEmpty!24136 mapRes!24136))

(declare-fun b!827018 () Bool)

(declare-fun e!460526 () Bool)

(declare-fun tp_is_empty!15007 () Bool)

(assert (=> b!827018 (= e!460526 tp_is_empty!15007)))

(declare-fun b!827019 () Bool)

(declare-fun e!460533 () Bool)

(assert (=> b!827019 (= e!460533 tp_is_empty!15007)))

(declare-fun b!827020 () Bool)

(declare-fun e!460531 () Bool)

(assert (=> b!827020 (= e!460531 (and e!460526 mapRes!24136))))

(declare-fun condMapEmpty!24136 () Bool)

(declare-datatypes ((V!25011 0))(
  ( (V!25012 (val!7551 Int)) )
))
(declare-datatypes ((ValueCell!7088 0))(
  ( (ValueCellFull!7088 (v!9985 V!25011)) (EmptyCell!7088) )
))
(declare-datatypes ((array!46197 0))(
  ( (array!46198 (arr!22139 (Array (_ BitVec 32) ValueCell!7088)) (size!22559 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46197)

(declare-fun mapDefault!24136 () ValueCell!7088)

(assert (=> b!827020 (= condMapEmpty!24136 (= (arr!22139 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7088)) mapDefault!24136)))))

(declare-fun res!563487 () Bool)

(declare-fun e!460529 () Bool)

(assert (=> start!71296 (=> (not res!563487) (not e!460529))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71296 (= res!563487 (validMask!0 mask!1312))))

(assert (=> start!71296 e!460529))

(assert (=> start!71296 tp_is_empty!15007))

(declare-datatypes ((array!46199 0))(
  ( (array!46200 (arr!22140 (Array (_ BitVec 32) (_ BitVec 64))) (size!22560 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46199)

(declare-fun array_inv!17689 (array!46199) Bool)

(assert (=> start!71296 (array_inv!17689 _keys!976)))

(assert (=> start!71296 true))

(declare-fun array_inv!17690 (array!46197) Bool)

(assert (=> start!71296 (and (array_inv!17690 _values!788) e!460531)))

(assert (=> start!71296 tp!46651))

(declare-fun b!827021 () Bool)

(declare-datatypes ((tuple2!9924 0))(
  ( (tuple2!9925 (_1!4973 (_ BitVec 64)) (_2!4973 V!25011)) )
))
(declare-fun lt!373884 () tuple2!9924)

(declare-fun zeroValueAfter!34 () V!25011)

(declare-datatypes ((List!15705 0))(
  ( (Nil!15702) (Cons!15701 (h!16836 tuple2!9924) (t!22044 List!15705)) )
))
(declare-datatypes ((ListLongMap!8749 0))(
  ( (ListLongMap!8750 (toList!4390 List!15705)) )
))
(declare-fun lt!373877 () ListLongMap!8749)

(declare-fun lt!373881 () ListLongMap!8749)

(declare-fun e!460528 () Bool)

(declare-fun +!1937 (ListLongMap!8749 tuple2!9924) ListLongMap!8749)

(assert (=> b!827021 (= e!460528 (= lt!373881 (+!1937 (+!1937 lt!373877 (tuple2!9925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373884)))))

(declare-fun b!827022 () Bool)

(declare-fun res!563486 () Bool)

(assert (=> b!827022 (=> (not res!563486) (not e!460529))))

(declare-datatypes ((List!15706 0))(
  ( (Nil!15703) (Cons!15702 (h!16837 (_ BitVec 64)) (t!22045 List!15706)) )
))
(declare-fun arrayNoDuplicates!0 (array!46199 (_ BitVec 32) List!15706) Bool)

(assert (=> b!827022 (= res!563486 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15703))))

(declare-fun e!460532 () Bool)

(declare-fun lt!373878 () tuple2!9924)

(declare-fun b!827023 () Bool)

(assert (=> b!827023 (= e!460532 (= lt!373881 (+!1937 (+!1937 lt!373877 lt!373884) lt!373878)))))

(declare-fun b!827024 () Bool)

(declare-fun res!563484 () Bool)

(assert (=> b!827024 (=> (not res!563484) (not e!460529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46199 (_ BitVec 32)) Bool)

(assert (=> b!827024 (= res!563484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24136 () Bool)

(declare-fun tp!46650 () Bool)

(assert (=> mapNonEmpty!24136 (= mapRes!24136 (and tp!46650 e!460533))))

(declare-fun mapValue!24136 () ValueCell!7088)

(declare-fun mapKey!24136 () (_ BitVec 32))

(declare-fun mapRest!24136 () (Array (_ BitVec 32) ValueCell!7088))

(assert (=> mapNonEmpty!24136 (= (arr!22139 _values!788) (store mapRest!24136 mapKey!24136 mapValue!24136))))

(declare-fun b!827025 () Bool)

(declare-fun res!563485 () Bool)

(assert (=> b!827025 (=> (not res!563485) (not e!460529))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827025 (= res!563485 (and (= (size!22559 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22560 _keys!976) (size!22559 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827026 () Bool)

(declare-fun e!460530 () Bool)

(assert (=> b!827026 (= e!460530 true)))

(declare-fun lt!373879 () ListLongMap!8749)

(declare-fun lt!373882 () ListLongMap!8749)

(assert (=> b!827026 (= lt!373879 (+!1937 (+!1937 lt!373882 lt!373878) lt!373884))))

(declare-fun lt!373885 () ListLongMap!8749)

(declare-fun lt!373876 () ListLongMap!8749)

(assert (=> b!827026 (and (= lt!373885 lt!373876) (= lt!373881 lt!373876) (= lt!373881 lt!373885))))

(declare-fun lt!373875 () ListLongMap!8749)

(assert (=> b!827026 (= lt!373876 (+!1937 lt!373875 lt!373878))))

(declare-fun lt!373880 () ListLongMap!8749)

(assert (=> b!827026 (= lt!373885 (+!1937 lt!373880 lt!373878))))

(declare-fun zeroValueBefore!34 () V!25011)

(declare-datatypes ((Unit!28332 0))(
  ( (Unit!28333) )
))
(declare-fun lt!373887 () Unit!28332)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!222 (ListLongMap!8749 (_ BitVec 64) V!25011 V!25011) Unit!28332)

(assert (=> b!827026 (= lt!373887 (addSameAsAddTwiceSameKeyDiffValues!222 lt!373880 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!827026 e!460532))

(declare-fun res!563482 () Bool)

(assert (=> b!827026 (=> (not res!563482) (not e!460532))))

(declare-fun lt!373886 () ListLongMap!8749)

(assert (=> b!827026 (= res!563482 (= lt!373886 lt!373875))))

(declare-fun lt!373888 () tuple2!9924)

(assert (=> b!827026 (= lt!373875 (+!1937 lt!373880 lt!373888))))

(assert (=> b!827026 (= lt!373880 (+!1937 lt!373882 lt!373884))))

(assert (=> b!827026 (= lt!373878 (tuple2!9925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!827026 e!460528))

(declare-fun res!563483 () Bool)

(assert (=> b!827026 (=> (not res!563483) (not e!460528))))

(assert (=> b!827026 (= res!563483 (= lt!373886 (+!1937 (+!1937 lt!373882 lt!373888) lt!373884)))))

(declare-fun minValue!754 () V!25011)

(assert (=> b!827026 (= lt!373884 (tuple2!9925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!827026 (= lt!373888 (tuple2!9925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2513 (array!46199 array!46197 (_ BitVec 32) (_ BitVec 32) V!25011 V!25011 (_ BitVec 32) Int) ListLongMap!8749)

(assert (=> b!827026 (= lt!373881 (getCurrentListMap!2513 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827026 (= lt!373886 (getCurrentListMap!2513 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827027 () Bool)

(assert (=> b!827027 (= e!460529 (not e!460530))))

(declare-fun res!563488 () Bool)

(assert (=> b!827027 (=> res!563488 e!460530)))

(assert (=> b!827027 (= res!563488 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827027 (= lt!373882 lt!373877)))

(declare-fun lt!373883 () Unit!28332)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!557 (array!46199 array!46197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25011 V!25011 V!25011 V!25011 (_ BitVec 32) Int) Unit!28332)

(assert (=> b!827027 (= lt!373883 (lemmaNoChangeToArrayThenSameMapNoExtras!557 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2469 (array!46199 array!46197 (_ BitVec 32) (_ BitVec 32) V!25011 V!25011 (_ BitVec 32) Int) ListLongMap!8749)

(assert (=> b!827027 (= lt!373877 (getCurrentListMapNoExtraKeys!2469 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827027 (= lt!373882 (getCurrentListMapNoExtraKeys!2469 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71296 res!563487) b!827025))

(assert (= (and b!827025 res!563485) b!827024))

(assert (= (and b!827024 res!563484) b!827022))

(assert (= (and b!827022 res!563486) b!827027))

(assert (= (and b!827027 (not res!563488)) b!827026))

(assert (= (and b!827026 res!563483) b!827021))

(assert (= (and b!827026 res!563482) b!827023))

(assert (= (and b!827020 condMapEmpty!24136) mapIsEmpty!24136))

(assert (= (and b!827020 (not condMapEmpty!24136)) mapNonEmpty!24136))

(get-info :version)

(assert (= (and mapNonEmpty!24136 ((_ is ValueCellFull!7088) mapValue!24136)) b!827019))

(assert (= (and b!827020 ((_ is ValueCellFull!7088) mapDefault!24136)) b!827018))

(assert (= start!71296 b!827020))

(declare-fun m!769957 () Bool)

(assert (=> b!827026 m!769957))

(declare-fun m!769959 () Bool)

(assert (=> b!827026 m!769959))

(declare-fun m!769961 () Bool)

(assert (=> b!827026 m!769961))

(declare-fun m!769963 () Bool)

(assert (=> b!827026 m!769963))

(assert (=> b!827026 m!769957))

(declare-fun m!769965 () Bool)

(assert (=> b!827026 m!769965))

(declare-fun m!769967 () Bool)

(assert (=> b!827026 m!769967))

(declare-fun m!769969 () Bool)

(assert (=> b!827026 m!769969))

(declare-fun m!769971 () Bool)

(assert (=> b!827026 m!769971))

(declare-fun m!769973 () Bool)

(assert (=> b!827026 m!769973))

(assert (=> b!827026 m!769965))

(declare-fun m!769975 () Bool)

(assert (=> b!827026 m!769975))

(declare-fun m!769977 () Bool)

(assert (=> b!827026 m!769977))

(declare-fun m!769979 () Bool)

(assert (=> b!827022 m!769979))

(declare-fun m!769981 () Bool)

(assert (=> b!827021 m!769981))

(assert (=> b!827021 m!769981))

(declare-fun m!769983 () Bool)

(assert (=> b!827021 m!769983))

(declare-fun m!769985 () Bool)

(assert (=> b!827023 m!769985))

(assert (=> b!827023 m!769985))

(declare-fun m!769987 () Bool)

(assert (=> b!827023 m!769987))

(declare-fun m!769989 () Bool)

(assert (=> start!71296 m!769989))

(declare-fun m!769991 () Bool)

(assert (=> start!71296 m!769991))

(declare-fun m!769993 () Bool)

(assert (=> start!71296 m!769993))

(declare-fun m!769995 () Bool)

(assert (=> b!827024 m!769995))

(declare-fun m!769997 () Bool)

(assert (=> b!827027 m!769997))

(declare-fun m!769999 () Bool)

(assert (=> b!827027 m!769999))

(declare-fun m!770001 () Bool)

(assert (=> b!827027 m!770001))

(declare-fun m!770003 () Bool)

(assert (=> mapNonEmpty!24136 m!770003))

(check-sat tp_is_empty!15007 (not b!827021) (not b_next!13297) (not b!827027) (not b!827024) b_and!22233 (not b!827022) (not start!71296) (not mapNonEmpty!24136) (not b!827023) (not b!827026))
(check-sat b_and!22233 (not b_next!13297))
