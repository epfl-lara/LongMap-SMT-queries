; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71036 () Bool)

(assert start!71036)

(declare-fun b_free!13243 () Bool)

(declare-fun b_next!13243 () Bool)

(assert (=> start!71036 (= b_free!13243 (not b_next!13243))))

(declare-fun tp!46486 () Bool)

(declare-fun b_and!22131 () Bool)

(assert (=> start!71036 (= tp!46486 b_and!22131)))

(declare-fun b!824862 () Bool)

(declare-datatypes ((V!24939 0))(
  ( (V!24940 (val!7524 Int)) )
))
(declare-datatypes ((tuple2!9960 0))(
  ( (tuple2!9961 (_1!4991 (_ BitVec 64)) (_2!4991 V!24939)) )
))
(declare-datatypes ((List!15760 0))(
  ( (Nil!15757) (Cons!15756 (h!16885 tuple2!9960) (t!22096 List!15760)) )
))
(declare-datatypes ((ListLongMap!8773 0))(
  ( (ListLongMap!8774 (toList!4402 List!15760)) )
))
(declare-fun lt!371971 () ListLongMap!8773)

(declare-fun lt!371975 () ListLongMap!8773)

(declare-fun e!459026 () Bool)

(declare-fun lt!371978 () tuple2!9960)

(declare-fun lt!371967 () tuple2!9960)

(declare-fun +!1939 (ListLongMap!8773 tuple2!9960) ListLongMap!8773)

(assert (=> b!824862 (= e!459026 (= lt!371971 (+!1939 (+!1939 lt!371975 lt!371967) lt!371978)))))

(declare-fun res!562361 () Bool)

(declare-fun e!459027 () Bool)

(assert (=> start!71036 (=> (not res!562361) (not e!459027))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71036 (= res!562361 (validMask!0 mask!1312))))

(assert (=> start!71036 e!459027))

(declare-fun tp_is_empty!14953 () Bool)

(assert (=> start!71036 tp_is_empty!14953))

(declare-datatypes ((array!46061 0))(
  ( (array!46062 (arr!22077 (Array (_ BitVec 32) (_ BitVec 64))) (size!22498 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46061)

(declare-fun array_inv!17677 (array!46061) Bool)

(assert (=> start!71036 (array_inv!17677 _keys!976)))

(assert (=> start!71036 true))

(declare-datatypes ((ValueCell!7061 0))(
  ( (ValueCellFull!7061 (v!9951 V!24939)) (EmptyCell!7061) )
))
(declare-datatypes ((array!46063 0))(
  ( (array!46064 (arr!22078 (Array (_ BitVec 32) ValueCell!7061)) (size!22499 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46063)

(declare-fun e!459021 () Bool)

(declare-fun array_inv!17678 (array!46063) Bool)

(assert (=> start!71036 (and (array_inv!17678 _values!788) e!459021)))

(assert (=> start!71036 tp!46486))

(declare-fun b!824863 () Bool)

(declare-fun e!459023 () Bool)

(assert (=> b!824863 (= e!459023 tp_is_empty!14953)))

(declare-fun mapIsEmpty!24052 () Bool)

(declare-fun mapRes!24052 () Bool)

(assert (=> mapIsEmpty!24052 mapRes!24052))

(declare-fun zeroValueAfter!34 () V!24939)

(declare-fun b!824864 () Bool)

(declare-fun e!459022 () Bool)

(assert (=> b!824864 (= e!459022 (= lt!371971 (+!1939 (+!1939 lt!371975 (tuple2!9961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!371967)))))

(declare-fun mapNonEmpty!24052 () Bool)

(declare-fun tp!46485 () Bool)

(declare-fun e!459020 () Bool)

(assert (=> mapNonEmpty!24052 (= mapRes!24052 (and tp!46485 e!459020))))

(declare-fun mapRest!24052 () (Array (_ BitVec 32) ValueCell!7061))

(declare-fun mapValue!24052 () ValueCell!7061)

(declare-fun mapKey!24052 () (_ BitVec 32))

(assert (=> mapNonEmpty!24052 (= (arr!22078 _values!788) (store mapRest!24052 mapKey!24052 mapValue!24052))))

(declare-fun b!824865 () Bool)

(assert (=> b!824865 (= e!459021 (and e!459023 mapRes!24052))))

(declare-fun condMapEmpty!24052 () Bool)

(declare-fun mapDefault!24052 () ValueCell!7061)

(assert (=> b!824865 (= condMapEmpty!24052 (= (arr!22078 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7061)) mapDefault!24052)))))

(declare-fun b!824866 () Bool)

(declare-fun e!459024 () Bool)

(assert (=> b!824866 (= e!459024 true)))

(declare-fun lt!371977 () ListLongMap!8773)

(declare-fun lt!371969 () ListLongMap!8773)

(assert (=> b!824866 (= lt!371969 (+!1939 (+!1939 lt!371977 lt!371978) lt!371967))))

(declare-fun lt!371979 () ListLongMap!8773)

(declare-fun lt!371974 () ListLongMap!8773)

(assert (=> b!824866 (and (= lt!371979 lt!371974) (= lt!371971 lt!371974) (= lt!371971 lt!371979))))

(declare-fun lt!371973 () ListLongMap!8773)

(assert (=> b!824866 (= lt!371974 (+!1939 lt!371973 lt!371978))))

(declare-fun lt!371968 () ListLongMap!8773)

(assert (=> b!824866 (= lt!371979 (+!1939 lt!371968 lt!371978))))

(declare-fun zeroValueBefore!34 () V!24939)

(declare-datatypes ((Unit!28227 0))(
  ( (Unit!28228) )
))
(declare-fun lt!371972 () Unit!28227)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!213 (ListLongMap!8773 (_ BitVec 64) V!24939 V!24939) Unit!28227)

(assert (=> b!824866 (= lt!371972 (addSameAsAddTwiceSameKeyDiffValues!213 lt!371968 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!824866 e!459026))

(declare-fun res!562364 () Bool)

(assert (=> b!824866 (=> (not res!562364) (not e!459026))))

(declare-fun lt!371976 () ListLongMap!8773)

(assert (=> b!824866 (= res!562364 (= lt!371976 lt!371973))))

(declare-fun lt!371970 () tuple2!9960)

(assert (=> b!824866 (= lt!371973 (+!1939 lt!371968 lt!371970))))

(assert (=> b!824866 (= lt!371968 (+!1939 lt!371977 lt!371967))))

(assert (=> b!824866 (= lt!371978 (tuple2!9961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!824866 e!459022))

(declare-fun res!562365 () Bool)

(assert (=> b!824866 (=> (not res!562365) (not e!459022))))

(assert (=> b!824866 (= res!562365 (= lt!371976 (+!1939 (+!1939 lt!371977 lt!371970) lt!371967)))))

(declare-fun minValue!754 () V!24939)

(assert (=> b!824866 (= lt!371967 (tuple2!9961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!824866 (= lt!371970 (tuple2!9961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2496 (array!46061 array!46063 (_ BitVec 32) (_ BitVec 32) V!24939 V!24939 (_ BitVec 32) Int) ListLongMap!8773)

(assert (=> b!824866 (= lt!371971 (getCurrentListMap!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824866 (= lt!371976 (getCurrentListMap!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824867 () Bool)

(assert (=> b!824867 (= e!459020 tp_is_empty!14953)))

(declare-fun b!824868 () Bool)

(declare-fun res!562360 () Bool)

(assert (=> b!824868 (=> (not res!562360) (not e!459027))))

(declare-datatypes ((List!15761 0))(
  ( (Nil!15758) (Cons!15757 (h!16886 (_ BitVec 64)) (t!22097 List!15761)) )
))
(declare-fun arrayNoDuplicates!0 (array!46061 (_ BitVec 32) List!15761) Bool)

(assert (=> b!824868 (= res!562360 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15758))))

(declare-fun b!824869 () Bool)

(declare-fun res!562362 () Bool)

(assert (=> b!824869 (=> (not res!562362) (not e!459027))))

(assert (=> b!824869 (= res!562362 (and (= (size!22499 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22498 _keys!976) (size!22499 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824870 () Bool)

(assert (=> b!824870 (= e!459027 (not e!459024))))

(declare-fun res!562359 () Bool)

(assert (=> b!824870 (=> res!562359 e!459024)))

(assert (=> b!824870 (= res!562359 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!824870 (= lt!371977 lt!371975)))

(declare-fun lt!371966 () Unit!28227)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!538 (array!46061 array!46063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24939 V!24939 V!24939 V!24939 (_ BitVec 32) Int) Unit!28227)

(assert (=> b!824870 (= lt!371966 (lemmaNoChangeToArrayThenSameMapNoExtras!538 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2445 (array!46061 array!46063 (_ BitVec 32) (_ BitVec 32) V!24939 V!24939 (_ BitVec 32) Int) ListLongMap!8773)

(assert (=> b!824870 (= lt!371975 (getCurrentListMapNoExtraKeys!2445 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824870 (= lt!371977 (getCurrentListMapNoExtraKeys!2445 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824871 () Bool)

(declare-fun res!562363 () Bool)

(assert (=> b!824871 (=> (not res!562363) (not e!459027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46061 (_ BitVec 32)) Bool)

(assert (=> b!824871 (= res!562363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71036 res!562361) b!824869))

(assert (= (and b!824869 res!562362) b!824871))

(assert (= (and b!824871 res!562363) b!824868))

(assert (= (and b!824868 res!562360) b!824870))

(assert (= (and b!824870 (not res!562359)) b!824866))

(assert (= (and b!824866 res!562365) b!824864))

(assert (= (and b!824866 res!562364) b!824862))

(assert (= (and b!824865 condMapEmpty!24052) mapIsEmpty!24052))

(assert (= (and b!824865 (not condMapEmpty!24052)) mapNonEmpty!24052))

(get-info :version)

(assert (= (and mapNonEmpty!24052 ((_ is ValueCellFull!7061) mapValue!24052)) b!824867))

(assert (= (and b!824865 ((_ is ValueCellFull!7061) mapDefault!24052)) b!824863))

(assert (= start!71036 b!824865))

(declare-fun m!766317 () Bool)

(assert (=> b!824866 m!766317))

(declare-fun m!766319 () Bool)

(assert (=> b!824866 m!766319))

(declare-fun m!766321 () Bool)

(assert (=> b!824866 m!766321))

(declare-fun m!766323 () Bool)

(assert (=> b!824866 m!766323))

(declare-fun m!766325 () Bool)

(assert (=> b!824866 m!766325))

(declare-fun m!766327 () Bool)

(assert (=> b!824866 m!766327))

(declare-fun m!766329 () Bool)

(assert (=> b!824866 m!766329))

(assert (=> b!824866 m!766325))

(declare-fun m!766331 () Bool)

(assert (=> b!824866 m!766331))

(assert (=> b!824866 m!766321))

(declare-fun m!766333 () Bool)

(assert (=> b!824866 m!766333))

(declare-fun m!766335 () Bool)

(assert (=> b!824866 m!766335))

(declare-fun m!766337 () Bool)

(assert (=> b!824866 m!766337))

(declare-fun m!766339 () Bool)

(assert (=> b!824864 m!766339))

(assert (=> b!824864 m!766339))

(declare-fun m!766341 () Bool)

(assert (=> b!824864 m!766341))

(declare-fun m!766343 () Bool)

(assert (=> start!71036 m!766343))

(declare-fun m!766345 () Bool)

(assert (=> start!71036 m!766345))

(declare-fun m!766347 () Bool)

(assert (=> start!71036 m!766347))

(declare-fun m!766349 () Bool)

(assert (=> b!824862 m!766349))

(assert (=> b!824862 m!766349))

(declare-fun m!766351 () Bool)

(assert (=> b!824862 m!766351))

(declare-fun m!766353 () Bool)

(assert (=> b!824870 m!766353))

(declare-fun m!766355 () Bool)

(assert (=> b!824870 m!766355))

(declare-fun m!766357 () Bool)

(assert (=> b!824870 m!766357))

(declare-fun m!766359 () Bool)

(assert (=> b!824871 m!766359))

(declare-fun m!766361 () Bool)

(assert (=> mapNonEmpty!24052 m!766361))

(declare-fun m!766363 () Bool)

(assert (=> b!824868 m!766363))

(check-sat (not b!824862) (not mapNonEmpty!24052) (not start!71036) b_and!22131 (not b!824864) tp_is_empty!14953 (not b_next!13243) (not b!824870) (not b!824868) (not b!824866) (not b!824871))
(check-sat b_and!22131 (not b_next!13243))
