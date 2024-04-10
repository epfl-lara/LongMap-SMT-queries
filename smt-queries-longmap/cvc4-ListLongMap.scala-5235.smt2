; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70494 () Bool)

(assert start!70494)

(declare-fun b_free!12821 () Bool)

(declare-fun b_next!12821 () Bool)

(assert (=> start!70494 (= b_free!12821 (not b_next!12821))))

(declare-fun tp!45195 () Bool)

(declare-fun b_and!21651 () Bool)

(assert (=> start!70494 (= tp!45195 b_and!21651)))

(declare-fun b!818841 () Bool)

(declare-fun e!454616 () Bool)

(declare-fun tp_is_empty!14531 () Bool)

(assert (=> b!818841 (= e!454616 tp_is_empty!14531)))

(declare-fun b!818842 () Bool)

(declare-fun res!558794 () Bool)

(declare-fun e!454615 () Bool)

(assert (=> b!818842 (=> (not res!558794) (not e!454615))))

(declare-datatypes ((array!45260 0))(
  ( (array!45261 (arr!21684 (Array (_ BitVec 32) (_ BitVec 64))) (size!22105 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45260)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45260 (_ BitVec 32)) Bool)

(assert (=> b!818842 (= res!558794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23395 () Bool)

(declare-fun mapRes!23395 () Bool)

(assert (=> mapIsEmpty!23395 mapRes!23395))

(declare-fun b!818844 () Bool)

(declare-fun e!454618 () Bool)

(assert (=> b!818844 (= e!454615 (not e!454618))))

(declare-fun res!558797 () Bool)

(assert (=> b!818844 (=> res!558797 e!454618)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818844 (= res!558797 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24375 0))(
  ( (V!24376 (val!7313 Int)) )
))
(declare-datatypes ((tuple2!9614 0))(
  ( (tuple2!9615 (_1!4818 (_ BitVec 64)) (_2!4818 V!24375)) )
))
(declare-datatypes ((List!15446 0))(
  ( (Nil!15443) (Cons!15442 (h!16571 tuple2!9614) (t!21775 List!15446)) )
))
(declare-datatypes ((ListLongMap!8437 0))(
  ( (ListLongMap!8438 (toList!4234 List!15446)) )
))
(declare-fun lt!367112 () ListLongMap!8437)

(declare-fun lt!367109 () ListLongMap!8437)

(assert (=> b!818844 (= lt!367112 lt!367109)))

(declare-datatypes ((Unit!27949 0))(
  ( (Unit!27950) )
))
(declare-fun lt!367105 () Unit!27949)

(declare-fun zeroValueBefore!34 () V!24375)

(declare-fun zeroValueAfter!34 () V!24375)

(declare-fun minValue!754 () V!24375)

(declare-datatypes ((ValueCell!6850 0))(
  ( (ValueCellFull!6850 (v!9742 V!24375)) (EmptyCell!6850) )
))
(declare-datatypes ((array!45262 0))(
  ( (array!45263 (arr!21685 (Array (_ BitVec 32) ValueCell!6850)) (size!22106 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45262)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!381 (array!45260 array!45262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24375 V!24375 V!24375 V!24375 (_ BitVec 32) Int) Unit!27949)

(assert (=> b!818844 (= lt!367105 (lemmaNoChangeToArrayThenSameMapNoExtras!381 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2271 (array!45260 array!45262 (_ BitVec 32) (_ BitVec 32) V!24375 V!24375 (_ BitVec 32) Int) ListLongMap!8437)

(assert (=> b!818844 (= lt!367109 (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818844 (= lt!367112 (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!367103 () ListLongMap!8437)

(declare-fun b!818843 () Bool)

(declare-fun e!454619 () Bool)

(declare-fun +!1831 (ListLongMap!8437 tuple2!9614) ListLongMap!8437)

(assert (=> b!818843 (= e!454619 (= lt!367103 (+!1831 lt!367109 (tuple2!9615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun res!558793 () Bool)

(assert (=> start!70494 (=> (not res!558793) (not e!454615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70494 (= res!558793 (validMask!0 mask!1312))))

(assert (=> start!70494 e!454615))

(assert (=> start!70494 tp_is_empty!14531))

(declare-fun array_inv!17339 (array!45260) Bool)

(assert (=> start!70494 (array_inv!17339 _keys!976)))

(assert (=> start!70494 true))

(declare-fun e!454613 () Bool)

(declare-fun array_inv!17340 (array!45262) Bool)

(assert (=> start!70494 (and (array_inv!17340 _values!788) e!454613)))

(assert (=> start!70494 tp!45195))

(declare-fun b!818845 () Bool)

(assert (=> b!818845 (= e!454618 true)))

(declare-fun lt!367110 () ListLongMap!8437)

(declare-fun lt!367107 () tuple2!9614)

(declare-fun lt!367111 () tuple2!9614)

(assert (=> b!818845 (= lt!367110 (+!1831 (+!1831 lt!367109 lt!367107) lt!367111))))

(declare-fun lt!367104 () ListLongMap!8437)

(assert (=> b!818845 (= (+!1831 lt!367112 lt!367111) (+!1831 lt!367104 lt!367111))))

(declare-fun lt!367108 () Unit!27949)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!172 (ListLongMap!8437 (_ BitVec 64) V!24375 V!24375) Unit!27949)

(assert (=> b!818845 (= lt!367108 (addSameAsAddTwiceSameKeyDiffValues!172 lt!367112 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818845 (= lt!367111 (tuple2!9615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!818845 e!454619))

(declare-fun res!558796 () Bool)

(assert (=> b!818845 (=> (not res!558796) (not e!454619))))

(declare-fun lt!367106 () ListLongMap!8437)

(assert (=> b!818845 (= res!558796 (= lt!367106 lt!367104))))

(assert (=> b!818845 (= lt!367104 (+!1831 lt!367112 lt!367107))))

(assert (=> b!818845 (= lt!367107 (tuple2!9615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2438 (array!45260 array!45262 (_ BitVec 32) (_ BitVec 32) V!24375 V!24375 (_ BitVec 32) Int) ListLongMap!8437)

(assert (=> b!818845 (= lt!367103 (getCurrentListMap!2438 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818845 (= lt!367106 (getCurrentListMap!2438 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818846 () Bool)

(declare-fun e!454617 () Bool)

(assert (=> b!818846 (= e!454613 (and e!454617 mapRes!23395))))

(declare-fun condMapEmpty!23395 () Bool)

(declare-fun mapDefault!23395 () ValueCell!6850)

