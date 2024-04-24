; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71028 () Bool)

(assert start!71028)

(declare-fun b_free!13099 () Bool)

(declare-fun b_next!13099 () Bool)

(assert (=> start!71028 (= b_free!13099 (not b_next!13099))))

(declare-fun tp!46045 () Bool)

(declare-fun b_and!21993 () Bool)

(assert (=> start!71028 (= tp!46045 b_and!21993)))

(declare-fun b!823937 () Bool)

(declare-fun e!458269 () Bool)

(declare-fun tp_is_empty!14809 () Bool)

(assert (=> b!823937 (= e!458269 tp_is_empty!14809)))

(declare-fun b!823938 () Bool)

(declare-fun e!458271 () Bool)

(assert (=> b!823938 (= e!458271 true)))

(declare-datatypes ((V!24747 0))(
  ( (V!24748 (val!7452 Int)) )
))
(declare-datatypes ((tuple2!9768 0))(
  ( (tuple2!9769 (_1!4895 (_ BitVec 64)) (_2!4895 V!24747)) )
))
(declare-datatypes ((List!15554 0))(
  ( (Nil!15551) (Cons!15550 (h!16685 tuple2!9768) (t!21885 List!15554)) )
))
(declare-datatypes ((ListLongMap!8593 0))(
  ( (ListLongMap!8594 (toList!4312 List!15554)) )
))
(declare-fun lt!371154 () ListLongMap!8593)

(declare-fun lt!371149 () ListLongMap!8593)

(declare-fun lt!371153 () tuple2!9768)

(declare-fun +!1901 (ListLongMap!8593 tuple2!9768) ListLongMap!8593)

(assert (=> b!823938 (= lt!371154 (+!1901 lt!371149 lt!371153))))

(declare-fun lt!371150 () ListLongMap!8593)

(declare-datatypes ((Unit!28175 0))(
  ( (Unit!28176) )
))
(declare-fun lt!371148 () Unit!28175)

(declare-fun zeroValueAfter!34 () V!24747)

(declare-fun minValue!754 () V!24747)

(declare-fun addCommutativeForDiffKeys!459 (ListLongMap!8593 (_ BitVec 64) V!24747 (_ BitVec 64) V!24747) Unit!28175)

(assert (=> b!823938 (= lt!371148 (addCommutativeForDiffKeys!459 lt!371150 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371155 () ListLongMap!8593)

(assert (=> b!823938 (= lt!371155 lt!371154)))

(declare-fun lt!371151 () tuple2!9768)

(assert (=> b!823938 (= lt!371154 (+!1901 (+!1901 lt!371150 lt!371153) lt!371151))))

(assert (=> b!823938 (= lt!371153 (tuple2!9769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371147 () ListLongMap!8593)

(assert (=> b!823938 (= lt!371147 lt!371149)))

(assert (=> b!823938 (= lt!371149 (+!1901 lt!371150 lt!371151))))

(assert (=> b!823938 (= lt!371151 (tuple2!9769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45813 0))(
  ( (array!45814 (arr!21951 (Array (_ BitVec 32) (_ BitVec 64))) (size!22371 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45813)

(declare-datatypes ((ValueCell!6989 0))(
  ( (ValueCellFull!6989 (v!9884 V!24747)) (EmptyCell!6989) )
))
(declare-datatypes ((array!45815 0))(
  ( (array!45816 (arr!21952 (Array (_ BitVec 32) ValueCell!6989)) (size!22372 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45815)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2465 (array!45813 array!45815 (_ BitVec 32) (_ BitVec 32) V!24747 V!24747 (_ BitVec 32) Int) ListLongMap!8593)

(assert (=> b!823938 (= lt!371155 (getCurrentListMap!2465 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24747)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823938 (= lt!371147 (getCurrentListMap!2465 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561644 () Bool)

(declare-fun e!458268 () Bool)

(assert (=> start!71028 (=> (not res!561644) (not e!458268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71028 (= res!561644 (validMask!0 mask!1312))))

(assert (=> start!71028 e!458268))

(assert (=> start!71028 tp_is_empty!14809))

(declare-fun array_inv!17561 (array!45813) Bool)

(assert (=> start!71028 (array_inv!17561 _keys!976)))

(assert (=> start!71028 true))

(declare-fun e!458272 () Bool)

(declare-fun array_inv!17562 (array!45815) Bool)

(assert (=> start!71028 (and (array_inv!17562 _values!788) e!458272)))

(assert (=> start!71028 tp!46045))

(declare-fun b!823939 () Bool)

(declare-fun e!458267 () Bool)

(assert (=> b!823939 (= e!458267 tp_is_empty!14809)))

(declare-fun b!823940 () Bool)

(declare-fun res!561642 () Bool)

(assert (=> b!823940 (=> (not res!561642) (not e!458268))))

(declare-datatypes ((List!15555 0))(
  ( (Nil!15552) (Cons!15551 (h!16686 (_ BitVec 64)) (t!21886 List!15555)) )
))
(declare-fun arrayNoDuplicates!0 (array!45813 (_ BitVec 32) List!15555) Bool)

(assert (=> b!823940 (= res!561642 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15552))))

(declare-fun b!823941 () Bool)

(assert (=> b!823941 (= e!458268 (not e!458271))))

(declare-fun res!561640 () Bool)

(assert (=> b!823941 (=> res!561640 e!458271)))

(assert (=> b!823941 (= res!561640 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!371152 () ListLongMap!8593)

(assert (=> b!823941 (= lt!371150 lt!371152)))

(declare-fun lt!371156 () Unit!28175)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!484 (array!45813 array!45815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24747 V!24747 V!24747 V!24747 (_ BitVec 32) Int) Unit!28175)

(assert (=> b!823941 (= lt!371156 (lemmaNoChangeToArrayThenSameMapNoExtras!484 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2396 (array!45813 array!45815 (_ BitVec 32) (_ BitVec 32) V!24747 V!24747 (_ BitVec 32) Int) ListLongMap!8593)

(assert (=> b!823941 (= lt!371152 (getCurrentListMapNoExtraKeys!2396 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823941 (= lt!371150 (getCurrentListMapNoExtraKeys!2396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23827 () Bool)

(declare-fun mapRes!23827 () Bool)

(declare-fun tp!46044 () Bool)

(assert (=> mapNonEmpty!23827 (= mapRes!23827 (and tp!46044 e!458269))))

(declare-fun mapRest!23827 () (Array (_ BitVec 32) ValueCell!6989))

(declare-fun mapValue!23827 () ValueCell!6989)

(declare-fun mapKey!23827 () (_ BitVec 32))

(assert (=> mapNonEmpty!23827 (= (arr!21952 _values!788) (store mapRest!23827 mapKey!23827 mapValue!23827))))

(declare-fun b!823942 () Bool)

(assert (=> b!823942 (= e!458272 (and e!458267 mapRes!23827))))

(declare-fun condMapEmpty!23827 () Bool)

(declare-fun mapDefault!23827 () ValueCell!6989)

(assert (=> b!823942 (= condMapEmpty!23827 (= (arr!21952 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6989)) mapDefault!23827)))))

(declare-fun b!823943 () Bool)

(declare-fun res!561641 () Bool)

(assert (=> b!823943 (=> (not res!561641) (not e!458268))))

(assert (=> b!823943 (= res!561641 (and (= (size!22372 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22371 _keys!976) (size!22372 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23827 () Bool)

(assert (=> mapIsEmpty!23827 mapRes!23827))

(declare-fun b!823944 () Bool)

(declare-fun res!561643 () Bool)

(assert (=> b!823944 (=> (not res!561643) (not e!458268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45813 (_ BitVec 32)) Bool)

(assert (=> b!823944 (= res!561643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71028 res!561644) b!823943))

(assert (= (and b!823943 res!561641) b!823944))

(assert (= (and b!823944 res!561643) b!823940))

(assert (= (and b!823940 res!561642) b!823941))

(assert (= (and b!823941 (not res!561640)) b!823938))

(assert (= (and b!823942 condMapEmpty!23827) mapIsEmpty!23827))

(assert (= (and b!823942 (not condMapEmpty!23827)) mapNonEmpty!23827))

(get-info :version)

(assert (= (and mapNonEmpty!23827 ((_ is ValueCellFull!6989) mapValue!23827)) b!823937))

(assert (= (and b!823942 ((_ is ValueCellFull!6989) mapDefault!23827)) b!823939))

(assert (= start!71028 b!823942))

(declare-fun m!766355 () Bool)

(assert (=> start!71028 m!766355))

(declare-fun m!766357 () Bool)

(assert (=> start!71028 m!766357))

(declare-fun m!766359 () Bool)

(assert (=> start!71028 m!766359))

(declare-fun m!766361 () Bool)

(assert (=> b!823938 m!766361))

(declare-fun m!766363 () Bool)

(assert (=> b!823938 m!766363))

(declare-fun m!766365 () Bool)

(assert (=> b!823938 m!766365))

(declare-fun m!766367 () Bool)

(assert (=> b!823938 m!766367))

(declare-fun m!766369 () Bool)

(assert (=> b!823938 m!766369))

(declare-fun m!766371 () Bool)

(assert (=> b!823938 m!766371))

(declare-fun m!766373 () Bool)

(assert (=> b!823938 m!766373))

(assert (=> b!823938 m!766371))

(declare-fun m!766375 () Bool)

(assert (=> b!823940 m!766375))

(declare-fun m!766377 () Bool)

(assert (=> mapNonEmpty!23827 m!766377))

(declare-fun m!766379 () Bool)

(assert (=> b!823941 m!766379))

(declare-fun m!766381 () Bool)

(assert (=> b!823941 m!766381))

(declare-fun m!766383 () Bool)

(assert (=> b!823941 m!766383))

(declare-fun m!766385 () Bool)

(assert (=> b!823944 m!766385))

(check-sat (not b!823941) (not b!823938) (not mapNonEmpty!23827) (not b!823944) tp_is_empty!14809 (not b!823940) (not start!71028) (not b_next!13099) b_and!21993)
(check-sat b_and!21993 (not b_next!13099))
