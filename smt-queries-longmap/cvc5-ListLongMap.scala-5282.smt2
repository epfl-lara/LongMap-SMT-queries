; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70862 () Bool)

(assert start!70862)

(declare-fun b_free!13099 () Bool)

(declare-fun b_next!13099 () Bool)

(assert (=> start!70862 (= b_free!13099 (not b_next!13099))))

(declare-fun tp!46044 () Bool)

(declare-fun b_and!21983 () Bool)

(assert (=> start!70862 (= tp!46044 b_and!21983)))

(declare-fun b!823044 () Bool)

(declare-fun res!561295 () Bool)

(declare-fun e!457694 () Bool)

(assert (=> b!823044 (=> (not res!561295) (not e!457694))))

(declare-datatypes ((array!45812 0))(
  ( (array!45813 (arr!21955 (Array (_ BitVec 32) (_ BitVec 64))) (size!22376 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45812)

(declare-datatypes ((List!15663 0))(
  ( (Nil!15660) (Cons!15659 (h!16788 (_ BitVec 64)) (t!22002 List!15663)) )
))
(declare-fun arrayNoDuplicates!0 (array!45812 (_ BitVec 32) List!15663) Bool)

(assert (=> b!823044 (= res!561295 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15660))))

(declare-fun b!823045 () Bool)

(declare-fun e!457690 () Bool)

(declare-fun tp_is_empty!14809 () Bool)

(assert (=> b!823045 (= e!457690 tp_is_empty!14809)))

(declare-fun b!823046 () Bool)

(declare-fun res!561298 () Bool)

(assert (=> b!823046 (=> (not res!561298) (not e!457694))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45812 (_ BitVec 32)) Bool)

(assert (=> b!823046 (= res!561298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823047 () Bool)

(declare-fun e!457693 () Bool)

(assert (=> b!823047 (= e!457693 true)))

(declare-datatypes ((V!24747 0))(
  ( (V!24748 (val!7452 Int)) )
))
(declare-datatypes ((tuple2!9850 0))(
  ( (tuple2!9851 (_1!4936 (_ BitVec 64)) (_2!4936 V!24747)) )
))
(declare-datatypes ((List!15664 0))(
  ( (Nil!15661) (Cons!15660 (h!16789 tuple2!9850) (t!22003 List!15664)) )
))
(declare-datatypes ((ListLongMap!8673 0))(
  ( (ListLongMap!8674 (toList!4352 List!15664)) )
))
(declare-fun lt!370801 () ListLongMap!8673)

(declare-fun lt!370798 () ListLongMap!8673)

(declare-fun lt!370797 () tuple2!9850)

(declare-fun +!1901 (ListLongMap!8673 tuple2!9850) ListLongMap!8673)

(assert (=> b!823047 (= lt!370801 (+!1901 lt!370798 lt!370797))))

(declare-fun zeroValueAfter!34 () V!24747)

(declare-fun minValue!754 () V!24747)

(declare-datatypes ((Unit!28170 0))(
  ( (Unit!28171) )
))
(declare-fun lt!370793 () Unit!28170)

(declare-fun lt!370794 () ListLongMap!8673)

(declare-fun addCommutativeForDiffKeys!464 (ListLongMap!8673 (_ BitVec 64) V!24747 (_ BitVec 64) V!24747) Unit!28170)

(assert (=> b!823047 (= lt!370793 (addCommutativeForDiffKeys!464 lt!370794 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370800 () ListLongMap!8673)

(assert (=> b!823047 (= lt!370800 lt!370801)))

(declare-fun lt!370796 () tuple2!9850)

(assert (=> b!823047 (= lt!370801 (+!1901 (+!1901 lt!370794 lt!370797) lt!370796))))

(assert (=> b!823047 (= lt!370797 (tuple2!9851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370795 () ListLongMap!8673)

(assert (=> b!823047 (= lt!370795 lt!370798)))

(assert (=> b!823047 (= lt!370798 (+!1901 lt!370794 lt!370796))))

(assert (=> b!823047 (= lt!370796 (tuple2!9851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!6989 0))(
  ( (ValueCellFull!6989 (v!9884 V!24747)) (EmptyCell!6989) )
))
(declare-datatypes ((array!45814 0))(
  ( (array!45815 (arr!21956 (Array (_ BitVec 32) ValueCell!6989)) (size!22377 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45814)

(declare-fun getCurrentListMap!2515 (array!45812 array!45814 (_ BitVec 32) (_ BitVec 32) V!24747 V!24747 (_ BitVec 32) Int) ListLongMap!8673)

(assert (=> b!823047 (= lt!370800 (getCurrentListMap!2515 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24747)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823047 (= lt!370795 (getCurrentListMap!2515 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823048 () Bool)

(declare-fun e!457689 () Bool)

(declare-fun e!457692 () Bool)

(declare-fun mapRes!23827 () Bool)

(assert (=> b!823048 (= e!457689 (and e!457692 mapRes!23827))))

(declare-fun condMapEmpty!23827 () Bool)

(declare-fun mapDefault!23827 () ValueCell!6989)

