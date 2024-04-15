; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71066 () Bool)

(assert start!71066)

(declare-fun b_free!13273 () Bool)

(declare-fun b_next!13273 () Bool)

(assert (=> start!71066 (= b_free!13273 (not b_next!13273))))

(declare-fun tp!46575 () Bool)

(declare-fun b_and!22161 () Bool)

(assert (=> start!71066 (= tp!46575 b_and!22161)))

(declare-fun b!825312 () Bool)

(declare-fun res!562674 () Bool)

(declare-fun e!459381 () Bool)

(assert (=> b!825312 (=> (not res!562674) (not e!459381))))

(declare-datatypes ((array!46113 0))(
  ( (array!46114 (arr!22103 (Array (_ BitVec 32) (_ BitVec 64))) (size!22524 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46113)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46113 (_ BitVec 32)) Bool)

(assert (=> b!825312 (= res!562674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825313 () Bool)

(declare-fun e!459387 () Bool)

(declare-fun tp_is_empty!14983 () Bool)

(assert (=> b!825313 (= e!459387 tp_is_empty!14983)))

(declare-fun b!825314 () Bool)

(declare-fun e!459380 () Bool)

(assert (=> b!825314 (= e!459380 true)))

(declare-datatypes ((V!24979 0))(
  ( (V!24980 (val!7539 Int)) )
))
(declare-datatypes ((tuple2!9986 0))(
  ( (tuple2!9987 (_1!5004 (_ BitVec 64)) (_2!5004 V!24979)) )
))
(declare-fun lt!372600 () tuple2!9986)

(declare-datatypes ((List!15779 0))(
  ( (Nil!15776) (Cons!15775 (h!16904 tuple2!9986) (t!22115 List!15779)) )
))
(declare-datatypes ((ListLongMap!8799 0))(
  ( (ListLongMap!8800 (toList!4415 List!15779)) )
))
(declare-fun lt!372604 () ListLongMap!8799)

(declare-fun lt!372601 () tuple2!9986)

(declare-fun lt!372602 () ListLongMap!8799)

(declare-fun +!1952 (ListLongMap!8799 tuple2!9986) ListLongMap!8799)

(assert (=> b!825314 (= lt!372602 (+!1952 (+!1952 lt!372604 lt!372601) lt!372600))))

(declare-fun lt!372597 () ListLongMap!8799)

(declare-fun lt!372608 () ListLongMap!8799)

(declare-fun lt!372609 () ListLongMap!8799)

(assert (=> b!825314 (and (= lt!372597 lt!372608) (= lt!372609 lt!372608) (= lt!372609 lt!372597))))

(declare-fun lt!372605 () ListLongMap!8799)

(assert (=> b!825314 (= lt!372608 (+!1952 lt!372605 lt!372601))))

(declare-fun lt!372598 () ListLongMap!8799)

(assert (=> b!825314 (= lt!372597 (+!1952 lt!372598 lt!372601))))

(declare-fun zeroValueBefore!34 () V!24979)

(declare-fun zeroValueAfter!34 () V!24979)

(declare-datatypes ((Unit!28243 0))(
  ( (Unit!28244) )
))
(declare-fun lt!372606 () Unit!28243)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!219 (ListLongMap!8799 (_ BitVec 64) V!24979 V!24979) Unit!28243)

(assert (=> b!825314 (= lt!372606 (addSameAsAddTwiceSameKeyDiffValues!219 lt!372598 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459382 () Bool)

(assert (=> b!825314 e!459382))

(declare-fun res!562679 () Bool)

(assert (=> b!825314 (=> (not res!562679) (not e!459382))))

(declare-fun lt!372603 () ListLongMap!8799)

(assert (=> b!825314 (= res!562679 (= lt!372603 lt!372605))))

(declare-fun lt!372596 () tuple2!9986)

(assert (=> b!825314 (= lt!372605 (+!1952 lt!372598 lt!372596))))

(assert (=> b!825314 (= lt!372598 (+!1952 lt!372604 lt!372600))))

(assert (=> b!825314 (= lt!372601 (tuple2!9987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459383 () Bool)

(assert (=> b!825314 e!459383))

(declare-fun res!562680 () Bool)

(assert (=> b!825314 (=> (not res!562680) (not e!459383))))

(assert (=> b!825314 (= res!562680 (= lt!372603 (+!1952 (+!1952 lt!372604 lt!372596) lt!372600)))))

(declare-fun minValue!754 () V!24979)

(assert (=> b!825314 (= lt!372600 (tuple2!9987 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825314 (= lt!372596 (tuple2!9987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((ValueCell!7076 0))(
  ( (ValueCellFull!7076 (v!9966 V!24979)) (EmptyCell!7076) )
))
(declare-datatypes ((array!46115 0))(
  ( (array!46116 (arr!22104 (Array (_ BitVec 32) ValueCell!7076)) (size!22525 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46115)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2502 (array!46113 array!46115 (_ BitVec 32) (_ BitVec 32) V!24979 V!24979 (_ BitVec 32) Int) ListLongMap!8799)

(assert (=> b!825314 (= lt!372609 (getCurrentListMap!2502 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825314 (= lt!372603 (getCurrentListMap!2502 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825315 () Bool)

(declare-fun res!562675 () Bool)

(assert (=> b!825315 (=> (not res!562675) (not e!459381))))

(assert (=> b!825315 (= res!562675 (and (= (size!22525 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22524 _keys!976) (size!22525 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825316 () Bool)

(declare-fun res!562678 () Bool)

(assert (=> b!825316 (=> (not res!562678) (not e!459381))))

(declare-datatypes ((List!15780 0))(
  ( (Nil!15777) (Cons!15776 (h!16905 (_ BitVec 64)) (t!22116 List!15780)) )
))
(declare-fun arrayNoDuplicates!0 (array!46113 (_ BitVec 32) List!15780) Bool)

(assert (=> b!825316 (= res!562678 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15777))))

(declare-fun lt!372607 () ListLongMap!8799)

(declare-fun b!825317 () Bool)

(assert (=> b!825317 (= e!459383 (= lt!372609 (+!1952 (+!1952 lt!372607 (tuple2!9987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372600)))))

(declare-fun b!825318 () Bool)

(assert (=> b!825318 (= e!459382 (= lt!372609 (+!1952 (+!1952 lt!372607 lt!372600) lt!372601)))))

(declare-fun b!825319 () Bool)

(assert (=> b!825319 (= e!459381 (not e!459380))))

(declare-fun res!562676 () Bool)

(assert (=> b!825319 (=> res!562676 e!459380)))

(assert (=> b!825319 (= res!562676 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825319 (= lt!372604 lt!372607)))

(declare-fun lt!372599 () Unit!28243)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!546 (array!46113 array!46115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24979 V!24979 V!24979 V!24979 (_ BitVec 32) Int) Unit!28243)

(assert (=> b!825319 (= lt!372599 (lemmaNoChangeToArrayThenSameMapNoExtras!546 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2453 (array!46113 array!46115 (_ BitVec 32) (_ BitVec 32) V!24979 V!24979 (_ BitVec 32) Int) ListLongMap!8799)

(assert (=> b!825319 (= lt!372607 (getCurrentListMapNoExtraKeys!2453 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825319 (= lt!372604 (getCurrentListMapNoExtraKeys!2453 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562677 () Bool)

(assert (=> start!71066 (=> (not res!562677) (not e!459381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71066 (= res!562677 (validMask!0 mask!1312))))

(assert (=> start!71066 e!459381))

(assert (=> start!71066 tp_is_empty!14983))

(declare-fun array_inv!17689 (array!46113) Bool)

(assert (=> start!71066 (array_inv!17689 _keys!976)))

(assert (=> start!71066 true))

(declare-fun e!459385 () Bool)

(declare-fun array_inv!17690 (array!46115) Bool)

(assert (=> start!71066 (and (array_inv!17690 _values!788) e!459385)))

(assert (=> start!71066 tp!46575))

(declare-fun b!825320 () Bool)

(declare-fun e!459384 () Bool)

(assert (=> b!825320 (= e!459384 tp_is_empty!14983)))

(declare-fun mapIsEmpty!24097 () Bool)

(declare-fun mapRes!24097 () Bool)

(assert (=> mapIsEmpty!24097 mapRes!24097))

(declare-fun mapNonEmpty!24097 () Bool)

(declare-fun tp!46576 () Bool)

(assert (=> mapNonEmpty!24097 (= mapRes!24097 (and tp!46576 e!459387))))

(declare-fun mapRest!24097 () (Array (_ BitVec 32) ValueCell!7076))

(declare-fun mapValue!24097 () ValueCell!7076)

(declare-fun mapKey!24097 () (_ BitVec 32))

(assert (=> mapNonEmpty!24097 (= (arr!22104 _values!788) (store mapRest!24097 mapKey!24097 mapValue!24097))))

(declare-fun b!825321 () Bool)

(assert (=> b!825321 (= e!459385 (and e!459384 mapRes!24097))))

(declare-fun condMapEmpty!24097 () Bool)

(declare-fun mapDefault!24097 () ValueCell!7076)

(assert (=> b!825321 (= condMapEmpty!24097 (= (arr!22104 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7076)) mapDefault!24097)))))

(assert (= (and start!71066 res!562677) b!825315))

(assert (= (and b!825315 res!562675) b!825312))

(assert (= (and b!825312 res!562674) b!825316))

(assert (= (and b!825316 res!562678) b!825319))

(assert (= (and b!825319 (not res!562676)) b!825314))

(assert (= (and b!825314 res!562680) b!825317))

(assert (= (and b!825314 res!562679) b!825318))

(assert (= (and b!825321 condMapEmpty!24097) mapIsEmpty!24097))

(assert (= (and b!825321 (not condMapEmpty!24097)) mapNonEmpty!24097))

(get-info :version)

(assert (= (and mapNonEmpty!24097 ((_ is ValueCellFull!7076) mapValue!24097)) b!825313))

(assert (= (and b!825321 ((_ is ValueCellFull!7076) mapDefault!24097)) b!825320))

(assert (= start!71066 b!825321))

(declare-fun m!767037 () Bool)

(assert (=> b!825316 m!767037))

(declare-fun m!767039 () Bool)

(assert (=> b!825312 m!767039))

(declare-fun m!767041 () Bool)

(assert (=> b!825319 m!767041))

(declare-fun m!767043 () Bool)

(assert (=> b!825319 m!767043))

(declare-fun m!767045 () Bool)

(assert (=> b!825319 m!767045))

(declare-fun m!767047 () Bool)

(assert (=> b!825317 m!767047))

(assert (=> b!825317 m!767047))

(declare-fun m!767049 () Bool)

(assert (=> b!825317 m!767049))

(declare-fun m!767051 () Bool)

(assert (=> start!71066 m!767051))

(declare-fun m!767053 () Bool)

(assert (=> start!71066 m!767053))

(declare-fun m!767055 () Bool)

(assert (=> start!71066 m!767055))

(declare-fun m!767057 () Bool)

(assert (=> b!825314 m!767057))

(declare-fun m!767059 () Bool)

(assert (=> b!825314 m!767059))

(declare-fun m!767061 () Bool)

(assert (=> b!825314 m!767061))

(declare-fun m!767063 () Bool)

(assert (=> b!825314 m!767063))

(assert (=> b!825314 m!767057))

(declare-fun m!767065 () Bool)

(assert (=> b!825314 m!767065))

(declare-fun m!767067 () Bool)

(assert (=> b!825314 m!767067))

(declare-fun m!767069 () Bool)

(assert (=> b!825314 m!767069))

(declare-fun m!767071 () Bool)

(assert (=> b!825314 m!767071))

(declare-fun m!767073 () Bool)

(assert (=> b!825314 m!767073))

(declare-fun m!767075 () Bool)

(assert (=> b!825314 m!767075))

(assert (=> b!825314 m!767061))

(declare-fun m!767077 () Bool)

(assert (=> b!825314 m!767077))

(declare-fun m!767079 () Bool)

(assert (=> mapNonEmpty!24097 m!767079))

(declare-fun m!767081 () Bool)

(assert (=> b!825318 m!767081))

(assert (=> b!825318 m!767081))

(declare-fun m!767083 () Bool)

(assert (=> b!825318 m!767083))

(check-sat (not b!825312) (not b!825317) (not b!825316) (not start!71066) (not b!825318) (not b!825314) (not b!825319) b_and!22161 (not mapNonEmpty!24097) tp_is_empty!14983 (not b_next!13273))
(check-sat b_and!22161 (not b_next!13273))
