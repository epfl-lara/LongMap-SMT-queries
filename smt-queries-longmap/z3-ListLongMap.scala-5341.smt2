; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71352 () Bool)

(assert start!71352)

(declare-fun b_free!13453 () Bool)

(declare-fun b_next!13453 () Bool)

(assert (=> start!71352 (= b_free!13453 (not b_next!13453))))

(declare-fun tp!47133 () Bool)

(declare-fun b_and!22409 () Bool)

(assert (=> start!71352 (= tp!47133 b_and!22409)))

(declare-fun b!828649 () Bool)

(declare-fun res!564639 () Bool)

(declare-fun e!461801 () Bool)

(assert (=> b!828649 (=> (not res!564639) (not e!461801))))

(declare-datatypes ((array!46465 0))(
  ( (array!46466 (arr!22273 (Array (_ BitVec 32) (_ BitVec 64))) (size!22694 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46465)

(declare-datatypes ((V!25219 0))(
  ( (V!25220 (val!7629 Int)) )
))
(declare-datatypes ((ValueCell!7166 0))(
  ( (ValueCellFull!7166 (v!10061 V!25219)) (EmptyCell!7166) )
))
(declare-datatypes ((array!46467 0))(
  ( (array!46468 (arr!22274 (Array (_ BitVec 32) ValueCell!7166)) (size!22695 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46467)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828649 (= res!564639 (and (= (size!22695 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22694 _keys!976) (size!22695 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828650 () Bool)

(declare-fun e!461803 () Bool)

(declare-fun e!461806 () Bool)

(declare-fun mapRes!24385 () Bool)

(assert (=> b!828650 (= e!461803 (and e!461806 mapRes!24385))))

(declare-fun condMapEmpty!24385 () Bool)

(declare-fun mapDefault!24385 () ValueCell!7166)

(assert (=> b!828650 (= condMapEmpty!24385 (= (arr!22274 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7166)) mapDefault!24385)))))

(declare-datatypes ((tuple2!10126 0))(
  ( (tuple2!10127 (_1!5074 (_ BitVec 64)) (_2!5074 V!25219)) )
))
(declare-fun lt!375483 () tuple2!10126)

(declare-fun b!828651 () Bool)

(declare-fun e!461802 () Bool)

(declare-datatypes ((List!15913 0))(
  ( (Nil!15910) (Cons!15909 (h!17038 tuple2!10126) (t!22261 List!15913)) )
))
(declare-datatypes ((ListLongMap!8939 0))(
  ( (ListLongMap!8940 (toList!4485 List!15913)) )
))
(declare-fun lt!375487 () ListLongMap!8939)

(declare-fun lt!375488 () ListLongMap!8939)

(declare-fun +!1995 (ListLongMap!8939 tuple2!10126) ListLongMap!8939)

(assert (=> b!828651 (= e!461802 (= (+!1995 lt!375487 lt!375483) lt!375488))))

(declare-fun res!564640 () Bool)

(assert (=> start!71352 (=> (not res!564640) (not e!461801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71352 (= res!564640 (validMask!0 mask!1312))))

(assert (=> start!71352 e!461801))

(declare-fun tp_is_empty!15163 () Bool)

(assert (=> start!71352 tp_is_empty!15163))

(declare-fun array_inv!17805 (array!46465) Bool)

(assert (=> start!71352 (array_inv!17805 _keys!976)))

(assert (=> start!71352 true))

(declare-fun array_inv!17806 (array!46467) Bool)

(assert (=> start!71352 (and (array_inv!17806 _values!788) e!461803)))

(assert (=> start!71352 tp!47133))

(declare-fun b!828652 () Bool)

(declare-fun e!461800 () Bool)

(assert (=> b!828652 (= e!461800 e!461802)))

(declare-fun res!564637 () Bool)

(assert (=> b!828652 (=> res!564637 e!461802)))

(declare-fun lt!375482 () tuple2!10126)

(declare-fun lt!375485 () ListLongMap!8939)

(assert (=> b!828652 (= res!564637 (not (= lt!375488 (+!1995 (+!1995 lt!375485 lt!375482) lt!375483))))))

(declare-fun lt!375490 () ListLongMap!8939)

(declare-fun lt!375486 () ListLongMap!8939)

(assert (=> b!828652 (= (+!1995 lt!375490 lt!375483) (+!1995 lt!375486 lt!375483))))

(declare-fun zeroValueBefore!34 () V!25219)

(declare-fun zeroValueAfter!34 () V!25219)

(declare-datatypes ((Unit!28343 0))(
  ( (Unit!28344) )
))
(declare-fun lt!375489 () Unit!28343)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!247 (ListLongMap!8939 (_ BitVec 64) V!25219 V!25219) Unit!28343)

(assert (=> b!828652 (= lt!375489 (addSameAsAddTwiceSameKeyDiffValues!247 lt!375490 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!828652 (= lt!375483 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!461805 () Bool)

(assert (=> b!828652 e!461805))

(declare-fun res!564638 () Bool)

(assert (=> b!828652 (=> (not res!564638) (not e!461805))))

(assert (=> b!828652 (= res!564638 (= lt!375487 lt!375486))))

(assert (=> b!828652 (= lt!375486 (+!1995 lt!375490 lt!375482))))

(assert (=> b!828652 (= lt!375482 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!25219)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2539 (array!46465 array!46467 (_ BitVec 32) (_ BitVec 32) V!25219 V!25219 (_ BitVec 32) Int) ListLongMap!8939)

(assert (=> b!828652 (= lt!375488 (getCurrentListMap!2539 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828652 (= lt!375487 (getCurrentListMap!2539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828653 () Bool)

(assert (=> b!828653 (= e!461805 (= lt!375488 (+!1995 lt!375485 (tuple2!10127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!828654 () Bool)

(assert (=> b!828654 (= e!461801 (not e!461800))))

(declare-fun res!564641 () Bool)

(assert (=> b!828654 (=> res!564641 e!461800)))

(assert (=> b!828654 (= res!564641 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828654 (= lt!375490 lt!375485)))

(declare-fun lt!375484 () Unit!28343)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!585 (array!46465 array!46467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25219 V!25219 V!25219 V!25219 (_ BitVec 32) Int) Unit!28343)

(assert (=> b!828654 (= lt!375484 (lemmaNoChangeToArrayThenSameMapNoExtras!585 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2515 (array!46465 array!46467 (_ BitVec 32) (_ BitVec 32) V!25219 V!25219 (_ BitVec 32) Int) ListLongMap!8939)

(assert (=> b!828654 (= lt!375485 (getCurrentListMapNoExtraKeys!2515 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828654 (= lt!375490 (getCurrentListMapNoExtraKeys!2515 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828655 () Bool)

(declare-fun e!461799 () Bool)

(assert (=> b!828655 (= e!461799 tp_is_empty!15163)))

(declare-fun b!828656 () Bool)

(assert (=> b!828656 (= e!461806 tp_is_empty!15163)))

(declare-fun b!828657 () Bool)

(declare-fun res!564642 () Bool)

(assert (=> b!828657 (=> (not res!564642) (not e!461801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46465 (_ BitVec 32)) Bool)

(assert (=> b!828657 (= res!564642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24385 () Bool)

(declare-fun tp!47134 () Bool)

(assert (=> mapNonEmpty!24385 (= mapRes!24385 (and tp!47134 e!461799))))

(declare-fun mapRest!24385 () (Array (_ BitVec 32) ValueCell!7166))

(declare-fun mapKey!24385 () (_ BitVec 32))

(declare-fun mapValue!24385 () ValueCell!7166)

(assert (=> mapNonEmpty!24385 (= (arr!22274 _values!788) (store mapRest!24385 mapKey!24385 mapValue!24385))))

(declare-fun b!828658 () Bool)

(declare-fun res!564643 () Bool)

(assert (=> b!828658 (=> (not res!564643) (not e!461801))))

(declare-datatypes ((List!15914 0))(
  ( (Nil!15911) (Cons!15910 (h!17039 (_ BitVec 64)) (t!22262 List!15914)) )
))
(declare-fun arrayNoDuplicates!0 (array!46465 (_ BitVec 32) List!15914) Bool)

(assert (=> b!828658 (= res!564643 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15911))))

(declare-fun mapIsEmpty!24385 () Bool)

(assert (=> mapIsEmpty!24385 mapRes!24385))

(assert (= (and start!71352 res!564640) b!828649))

(assert (= (and b!828649 res!564639) b!828657))

(assert (= (and b!828657 res!564642) b!828658))

(assert (= (and b!828658 res!564643) b!828654))

(assert (= (and b!828654 (not res!564641)) b!828652))

(assert (= (and b!828652 res!564638) b!828653))

(assert (= (and b!828652 (not res!564637)) b!828651))

(assert (= (and b!828650 condMapEmpty!24385) mapIsEmpty!24385))

(assert (= (and b!828650 (not condMapEmpty!24385)) mapNonEmpty!24385))

(get-info :version)

(assert (= (and mapNonEmpty!24385 ((_ is ValueCellFull!7166) mapValue!24385)) b!828655))

(assert (= (and b!828650 ((_ is ValueCellFull!7166) mapDefault!24385)) b!828656))

(assert (= start!71352 b!828650))

(declare-fun m!771099 () Bool)

(assert (=> mapNonEmpty!24385 m!771099))

(declare-fun m!771101 () Bool)

(assert (=> b!828654 m!771101))

(declare-fun m!771103 () Bool)

(assert (=> b!828654 m!771103))

(declare-fun m!771105 () Bool)

(assert (=> b!828654 m!771105))

(declare-fun m!771107 () Bool)

(assert (=> b!828653 m!771107))

(declare-fun m!771109 () Bool)

(assert (=> b!828657 m!771109))

(declare-fun m!771111 () Bool)

(assert (=> b!828658 m!771111))

(declare-fun m!771113 () Bool)

(assert (=> b!828651 m!771113))

(declare-fun m!771115 () Bool)

(assert (=> b!828652 m!771115))

(declare-fun m!771117 () Bool)

(assert (=> b!828652 m!771117))

(declare-fun m!771119 () Bool)

(assert (=> b!828652 m!771119))

(declare-fun m!771121 () Bool)

(assert (=> b!828652 m!771121))

(declare-fun m!771123 () Bool)

(assert (=> b!828652 m!771123))

(declare-fun m!771125 () Bool)

(assert (=> b!828652 m!771125))

(declare-fun m!771127 () Bool)

(assert (=> b!828652 m!771127))

(assert (=> b!828652 m!771127))

(declare-fun m!771129 () Bool)

(assert (=> b!828652 m!771129))

(declare-fun m!771131 () Bool)

(assert (=> start!71352 m!771131))

(declare-fun m!771133 () Bool)

(assert (=> start!71352 m!771133))

(declare-fun m!771135 () Bool)

(assert (=> start!71352 m!771135))

(check-sat (not b!828657) tp_is_empty!15163 b_and!22409 (not mapNonEmpty!24385) (not b!828654) (not b!828652) (not b!828653) (not b!828658) (not b_next!13453) (not b!828651) (not start!71352))
(check-sat b_and!22409 (not b_next!13453))
