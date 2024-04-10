; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71104 () Bool)

(assert start!71104)

(declare-fun b_free!13291 () Bool)

(declare-fun b_next!13291 () Bool)

(assert (=> start!71104 (= b_free!13291 (not b_next!13291))))

(declare-fun tp!46629 () Bool)

(declare-fun b_and!22205 () Bool)

(assert (=> start!71104 (= tp!46629 b_and!22205)))

(declare-fun b!825830 () Bool)

(declare-fun e!459749 () Bool)

(declare-datatypes ((array!46184 0))(
  ( (array!46185 (arr!22138 (Array (_ BitVec 32) (_ BitVec 64))) (size!22559 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46184)

(assert (=> b!825830 (= e!459749 (bvsle #b00000000000000000000000000000000 (size!22559 _keys!976)))))

(declare-fun b!825831 () Bool)

(declare-fun e!459750 () Bool)

(declare-fun tp_is_empty!15001 () Bool)

(assert (=> b!825831 (= e!459750 tp_is_empty!15001)))

(declare-fun b!825832 () Bool)

(declare-fun e!459748 () Bool)

(assert (=> b!825832 (= e!459748 e!459749)))

(declare-fun res!562971 () Bool)

(assert (=> b!825832 (=> res!562971 e!459749)))

(declare-datatypes ((V!25003 0))(
  ( (V!25004 (val!7548 Int)) )
))
(declare-datatypes ((tuple2!9996 0))(
  ( (tuple2!9997 (_1!5009 (_ BitVec 64)) (_2!5009 V!25003)) )
))
(declare-fun lt!373217 () tuple2!9996)

(declare-datatypes ((List!15797 0))(
  ( (Nil!15794) (Cons!15793 (h!16922 tuple2!9996) (t!22142 List!15797)) )
))
(declare-datatypes ((ListLongMap!8819 0))(
  ( (ListLongMap!8820 (toList!4425 List!15797)) )
))
(declare-fun lt!373216 () ListLongMap!8819)

(declare-fun lt!373227 () tuple2!9996)

(declare-fun lt!373218 () ListLongMap!8819)

(declare-fun +!1932 (ListLongMap!8819 tuple2!9996) ListLongMap!8819)

(assert (=> b!825832 (= res!562971 (not (= lt!373216 (+!1932 (+!1932 lt!373218 lt!373217) lt!373227))))))

(declare-fun lt!373222 () ListLongMap!8819)

(declare-fun lt!373215 () ListLongMap!8819)

(assert (=> b!825832 (and (= lt!373222 lt!373215) (= lt!373216 lt!373215) (= lt!373216 lt!373222))))

(declare-fun lt!373226 () ListLongMap!8819)

(assert (=> b!825832 (= lt!373215 (+!1932 lt!373226 lt!373217))))

(declare-fun lt!373219 () ListLongMap!8819)

(assert (=> b!825832 (= lt!373222 (+!1932 lt!373219 lt!373217))))

(declare-fun zeroValueBefore!34 () V!25003)

(declare-fun zeroValueAfter!34 () V!25003)

(declare-datatypes ((Unit!28311 0))(
  ( (Unit!28312) )
))
(declare-fun lt!373223 () Unit!28311)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!215 (ListLongMap!8819 (_ BitVec 64) V!25003 V!25003) Unit!28311)

(assert (=> b!825832 (= lt!373223 (addSameAsAddTwiceSameKeyDiffValues!215 lt!373219 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459752 () Bool)

(assert (=> b!825832 e!459752))

(declare-fun res!562977 () Bool)

(assert (=> b!825832 (=> (not res!562977) (not e!459752))))

(declare-fun lt!373220 () ListLongMap!8819)

(assert (=> b!825832 (= res!562977 (= lt!373220 lt!373226))))

(declare-fun lt!373225 () tuple2!9996)

(assert (=> b!825832 (= lt!373226 (+!1932 lt!373219 lt!373225))))

(assert (=> b!825832 (= lt!373219 (+!1932 lt!373218 lt!373227))))

(assert (=> b!825832 (= lt!373217 (tuple2!9997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459755 () Bool)

(assert (=> b!825832 e!459755))

(declare-fun res!562974 () Bool)

(assert (=> b!825832 (=> (not res!562974) (not e!459755))))

(assert (=> b!825832 (= res!562974 (= lt!373220 (+!1932 (+!1932 lt!373218 lt!373225) lt!373227)))))

(declare-fun minValue!754 () V!25003)

(assert (=> b!825832 (= lt!373227 (tuple2!9997 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825832 (= lt!373225 (tuple2!9997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((ValueCell!7085 0))(
  ( (ValueCellFull!7085 (v!9981 V!25003)) (EmptyCell!7085) )
))
(declare-datatypes ((array!46186 0))(
  ( (array!46187 (arr!22139 (Array (_ BitVec 32) ValueCell!7085)) (size!22560 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46186)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2555 (array!46184 array!46186 (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 (_ BitVec 32) Int) ListLongMap!8819)

(assert (=> b!825832 (= lt!373216 (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825832 (= lt!373220 (getCurrentListMap!2555 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825833 () Bool)

(declare-fun e!459754 () Bool)

(assert (=> b!825833 (= e!459754 (not e!459748))))

(declare-fun res!562978 () Bool)

(assert (=> b!825833 (=> res!562978 e!459748)))

(assert (=> b!825833 (= res!562978 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373224 () ListLongMap!8819)

(assert (=> b!825833 (= lt!373218 lt!373224)))

(declare-fun lt!373221 () Unit!28311)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!544 (array!46184 array!46186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 V!25003 V!25003 (_ BitVec 32) Int) Unit!28311)

(assert (=> b!825833 (= lt!373221 (lemmaNoChangeToArrayThenSameMapNoExtras!544 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2434 (array!46184 array!46186 (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 (_ BitVec 32) Int) ListLongMap!8819)

(assert (=> b!825833 (= lt!373224 (getCurrentListMapNoExtraKeys!2434 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825833 (= lt!373218 (getCurrentListMapNoExtraKeys!2434 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825834 () Bool)

(declare-fun res!562976 () Bool)

(assert (=> b!825834 (=> (not res!562976) (not e!459754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46184 (_ BitVec 32)) Bool)

(assert (=> b!825834 (= res!562976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24124 () Bool)

(declare-fun mapRes!24124 () Bool)

(declare-fun tp!46630 () Bool)

(assert (=> mapNonEmpty!24124 (= mapRes!24124 (and tp!46630 e!459750))))

(declare-fun mapValue!24124 () ValueCell!7085)

(declare-fun mapKey!24124 () (_ BitVec 32))

(declare-fun mapRest!24124 () (Array (_ BitVec 32) ValueCell!7085))

(assert (=> mapNonEmpty!24124 (= (arr!22139 _values!788) (store mapRest!24124 mapKey!24124 mapValue!24124))))

(declare-fun b!825835 () Bool)

(assert (=> b!825835 (= e!459752 (= lt!373216 (+!1932 (+!1932 lt!373224 lt!373227) lt!373217)))))

(declare-fun b!825836 () Bool)

(declare-fun e!459751 () Bool)

(assert (=> b!825836 (= e!459751 tp_is_empty!15001)))

(declare-fun b!825837 () Bool)

(declare-fun e!459753 () Bool)

(assert (=> b!825837 (= e!459753 (and e!459751 mapRes!24124))))

(declare-fun condMapEmpty!24124 () Bool)

(declare-fun mapDefault!24124 () ValueCell!7085)

