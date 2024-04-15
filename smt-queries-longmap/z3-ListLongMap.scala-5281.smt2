; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70836 () Bool)

(assert start!70836)

(declare-fun b_free!13093 () Bool)

(declare-fun b_next!13093 () Bool)

(assert (=> start!70836 (= b_free!13093 (not b_next!13093))))

(declare-fun tp!46027 () Bool)

(declare-fun b_and!21951 () Bool)

(assert (=> start!70836 (= tp!46027 b_and!21951)))

(declare-fun b!822725 () Bool)

(declare-fun res!561146 () Bool)

(declare-fun e!457486 () Bool)

(assert (=> b!822725 (=> (not res!561146) (not e!457486))))

(declare-datatypes ((array!45769 0))(
  ( (array!45770 (arr!21934 (Array (_ BitVec 32) (_ BitVec 64))) (size!22355 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45769)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24739 0))(
  ( (V!24740 (val!7449 Int)) )
))
(declare-datatypes ((ValueCell!6986 0))(
  ( (ValueCellFull!6986 (v!9875 V!24739)) (EmptyCell!6986) )
))
(declare-datatypes ((array!45771 0))(
  ( (array!45772 (arr!21935 (Array (_ BitVec 32) ValueCell!6986)) (size!22356 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45771)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822725 (= res!561146 (and (= (size!22356 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22355 _keys!976) (size!22356 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822726 () Bool)

(declare-fun e!457489 () Bool)

(declare-fun e!457488 () Bool)

(declare-fun mapRes!23818 () Bool)

(assert (=> b!822726 (= e!457489 (and e!457488 mapRes!23818))))

(declare-fun condMapEmpty!23818 () Bool)

(declare-fun mapDefault!23818 () ValueCell!6986)

(assert (=> b!822726 (= condMapEmpty!23818 (= (arr!21935 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6986)) mapDefault!23818)))))

(declare-fun b!822727 () Bool)

(declare-fun e!457485 () Bool)

(assert (=> b!822727 (= e!457485 true)))

(declare-datatypes ((tuple2!9846 0))(
  ( (tuple2!9847 (_1!4934 (_ BitVec 64)) (_2!4934 V!24739)) )
))
(declare-datatypes ((List!15657 0))(
  ( (Nil!15654) (Cons!15653 (h!16782 tuple2!9846) (t!21987 List!15657)) )
))
(declare-datatypes ((ListLongMap!8659 0))(
  ( (ListLongMap!8660 (toList!4345 List!15657)) )
))
(declare-fun lt!370463 () ListLongMap!8659)

(declare-fun lt!370468 () ListLongMap!8659)

(declare-fun lt!370466 () tuple2!9846)

(declare-fun +!1922 (ListLongMap!8659 tuple2!9846) ListLongMap!8659)

(assert (=> b!822727 (= lt!370463 (+!1922 lt!370468 lt!370466))))

(declare-fun lt!370465 () ListLongMap!8659)

(declare-fun zeroValueAfter!34 () V!24739)

(declare-datatypes ((Unit!28112 0))(
  ( (Unit!28113) )
))
(declare-fun lt!370464 () Unit!28112)

(declare-fun minValue!754 () V!24739)

(declare-fun addCommutativeForDiffKeys!453 (ListLongMap!8659 (_ BitVec 64) V!24739 (_ BitVec 64) V!24739) Unit!28112)

(assert (=> b!822727 (= lt!370464 (addCommutativeForDiffKeys!453 lt!370465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370467 () ListLongMap!8659)

(assert (=> b!822727 (= lt!370467 lt!370463)))

(declare-fun lt!370461 () tuple2!9846)

(assert (=> b!822727 (= lt!370463 (+!1922 (+!1922 lt!370465 lt!370466) lt!370461))))

(assert (=> b!822727 (= lt!370466 (tuple2!9847 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370469 () ListLongMap!8659)

(assert (=> b!822727 (= lt!370469 lt!370468)))

(assert (=> b!822727 (= lt!370468 (+!1922 lt!370465 lt!370461))))

(assert (=> b!822727 (= lt!370461 (tuple2!9847 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2464 (array!45769 array!45771 (_ BitVec 32) (_ BitVec 32) V!24739 V!24739 (_ BitVec 32) Int) ListLongMap!8659)

(assert (=> b!822727 (= lt!370467 (getCurrentListMap!2464 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24739)

(assert (=> b!822727 (= lt!370469 (getCurrentListMap!2464 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822728 () Bool)

(declare-fun res!561145 () Bool)

(assert (=> b!822728 (=> (not res!561145) (not e!457486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45769 (_ BitVec 32)) Bool)

(assert (=> b!822728 (= res!561145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822729 () Bool)

(declare-fun tp_is_empty!14803 () Bool)

(assert (=> b!822729 (= e!457488 tp_is_empty!14803)))

(declare-fun b!822730 () Bool)

(declare-fun res!561147 () Bool)

(assert (=> b!822730 (=> (not res!561147) (not e!457486))))

(declare-datatypes ((List!15658 0))(
  ( (Nil!15655) (Cons!15654 (h!16783 (_ BitVec 64)) (t!21988 List!15658)) )
))
(declare-fun arrayNoDuplicates!0 (array!45769 (_ BitVec 32) List!15658) Bool)

(assert (=> b!822730 (= res!561147 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15655))))

(declare-fun mapIsEmpty!23818 () Bool)

(assert (=> mapIsEmpty!23818 mapRes!23818))

(declare-fun b!822731 () Bool)

(assert (=> b!822731 (= e!457486 (not e!457485))))

(declare-fun res!561144 () Bool)

(assert (=> b!822731 (=> res!561144 e!457485)))

(assert (=> b!822731 (= res!561144 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370462 () ListLongMap!8659)

(assert (=> b!822731 (= lt!370465 lt!370462)))

(declare-fun lt!370460 () Unit!28112)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!483 (array!45769 array!45771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24739 V!24739 V!24739 V!24739 (_ BitVec 32) Int) Unit!28112)

(assert (=> b!822731 (= lt!370460 (lemmaNoChangeToArrayThenSameMapNoExtras!483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2390 (array!45769 array!45771 (_ BitVec 32) (_ BitVec 32) V!24739 V!24739 (_ BitVec 32) Int) ListLongMap!8659)

(assert (=> b!822731 (= lt!370462 (getCurrentListMapNoExtraKeys!2390 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822731 (= lt!370465 (getCurrentListMapNoExtraKeys!2390 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561143 () Bool)

(assert (=> start!70836 (=> (not res!561143) (not e!457486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70836 (= res!561143 (validMask!0 mask!1312))))

(assert (=> start!70836 e!457486))

(assert (=> start!70836 tp_is_empty!14803))

(declare-fun array_inv!17579 (array!45769) Bool)

(assert (=> start!70836 (array_inv!17579 _keys!976)))

(assert (=> start!70836 true))

(declare-fun array_inv!17580 (array!45771) Bool)

(assert (=> start!70836 (and (array_inv!17580 _values!788) e!457489)))

(assert (=> start!70836 tp!46027))

(declare-fun b!822732 () Bool)

(declare-fun e!457490 () Bool)

(assert (=> b!822732 (= e!457490 tp_is_empty!14803)))

(declare-fun mapNonEmpty!23818 () Bool)

(declare-fun tp!46026 () Bool)

(assert (=> mapNonEmpty!23818 (= mapRes!23818 (and tp!46026 e!457490))))

(declare-fun mapKey!23818 () (_ BitVec 32))

(declare-fun mapRest!23818 () (Array (_ BitVec 32) ValueCell!6986))

(declare-fun mapValue!23818 () ValueCell!6986)

(assert (=> mapNonEmpty!23818 (= (arr!21935 _values!788) (store mapRest!23818 mapKey!23818 mapValue!23818))))

(assert (= (and start!70836 res!561143) b!822725))

(assert (= (and b!822725 res!561146) b!822728))

(assert (= (and b!822728 res!561145) b!822730))

(assert (= (and b!822730 res!561147) b!822731))

(assert (= (and b!822731 (not res!561144)) b!822727))

(assert (= (and b!822726 condMapEmpty!23818) mapIsEmpty!23818))

(assert (= (and b!822726 (not condMapEmpty!23818)) mapNonEmpty!23818))

(get-info :version)

(assert (= (and mapNonEmpty!23818 ((_ is ValueCellFull!6986) mapValue!23818)) b!822732))

(assert (= (and b!822726 ((_ is ValueCellFull!6986) mapDefault!23818)) b!822729))

(assert (= start!70836 b!822726))

(declare-fun m!764225 () Bool)

(assert (=> b!822731 m!764225))

(declare-fun m!764227 () Bool)

(assert (=> b!822731 m!764227))

(declare-fun m!764229 () Bool)

(assert (=> b!822731 m!764229))

(declare-fun m!764231 () Bool)

(assert (=> b!822730 m!764231))

(declare-fun m!764233 () Bool)

(assert (=> start!70836 m!764233))

(declare-fun m!764235 () Bool)

(assert (=> start!70836 m!764235))

(declare-fun m!764237 () Bool)

(assert (=> start!70836 m!764237))

(declare-fun m!764239 () Bool)

(assert (=> mapNonEmpty!23818 m!764239))

(declare-fun m!764241 () Bool)

(assert (=> b!822727 m!764241))

(assert (=> b!822727 m!764241))

(declare-fun m!764243 () Bool)

(assert (=> b!822727 m!764243))

(declare-fun m!764245 () Bool)

(assert (=> b!822727 m!764245))

(declare-fun m!764247 () Bool)

(assert (=> b!822727 m!764247))

(declare-fun m!764249 () Bool)

(assert (=> b!822727 m!764249))

(declare-fun m!764251 () Bool)

(assert (=> b!822727 m!764251))

(declare-fun m!764253 () Bool)

(assert (=> b!822727 m!764253))

(declare-fun m!764255 () Bool)

(assert (=> b!822728 m!764255))

(check-sat (not b_next!13093) b_and!21951 (not mapNonEmpty!23818) (not b!822730) (not b!822731) (not start!70836) tp_is_empty!14803 (not b!822728) (not b!822727))
(check-sat b_and!21951 (not b_next!13093))
