; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77676 () Bool)

(assert start!77676)

(declare-fun b_free!16261 () Bool)

(declare-fun b_next!16261 () Bool)

(assert (=> start!77676 (= b_free!16261 (not b_next!16261))))

(declare-fun tp!57045 () Bool)

(declare-fun b_and!26675 () Bool)

(assert (=> start!77676 (= tp!57045 b_and!26675)))

(declare-fun b!905861 () Bool)

(declare-fun e!507631 () Bool)

(declare-fun e!507628 () Bool)

(assert (=> b!905861 (= e!507631 (not e!507628))))

(declare-fun res!611303 () Bool)

(assert (=> b!905861 (=> res!611303 e!507628)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53400 0))(
  ( (array!53401 (arr!25659 (Array (_ BitVec 32) (_ BitVec 64))) (size!26118 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53400)

(assert (=> b!905861 (= res!611303 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26118 _keys!1386))))))

(declare-datatypes ((V!29871 0))(
  ( (V!29872 (val!9390 Int)) )
))
(declare-datatypes ((ValueCell!8858 0))(
  ( (ValueCellFull!8858 (v!11895 V!29871)) (EmptyCell!8858) )
))
(declare-datatypes ((array!53402 0))(
  ( (array!53403 (arr!25660 (Array (_ BitVec 32) ValueCell!8858)) (size!26119 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53402)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408708 () V!29871)

(declare-fun get!13484 (ValueCell!8858 V!29871) V!29871)

(declare-fun dynLambda!1336 (Int (_ BitVec 64)) V!29871)

(assert (=> b!905861 (= lt!408708 (get!13484 (select (arr!25660 _values!1152) i!717) (dynLambda!1336 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905861 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((Unit!30738 0))(
  ( (Unit!30739) )
))
(declare-fun lt!408707 () Unit!30738)

(declare-fun zeroValue!1094 () V!29871)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29871)

(declare-fun lemmaKeyInListMapIsInArray!208 (array!53400 array!53402 (_ BitVec 32) (_ BitVec 32) V!29871 V!29871 (_ BitVec 64) Int) Unit!30738)

(assert (=> b!905861 (= lt!408707 (lemmaKeyInListMapIsInArray!208 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29731 () Bool)

(declare-fun mapRes!29731 () Bool)

(declare-fun tp!57044 () Bool)

(declare-fun e!507630 () Bool)

(assert (=> mapNonEmpty!29731 (= mapRes!29731 (and tp!57044 e!507630))))

(declare-fun mapRest!29731 () (Array (_ BitVec 32) ValueCell!8858))

(declare-fun mapValue!29731 () ValueCell!8858)

(declare-fun mapKey!29731 () (_ BitVec 32))

(assert (=> mapNonEmpty!29731 (= (arr!25660 _values!1152) (store mapRest!29731 mapKey!29731 mapValue!29731))))

(declare-fun b!905862 () Bool)

(declare-fun res!611302 () Bool)

(assert (=> b!905862 (=> (not res!611302) (not e!507631))))

(assert (=> b!905862 (= res!611302 (and (= (select (arr!25659 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905863 () Bool)

(declare-fun tp_is_empty!18679 () Bool)

(assert (=> b!905863 (= e!507630 tp_is_empty!18679)))

(declare-fun b!905864 () Bool)

(declare-fun e!507629 () Bool)

(assert (=> b!905864 (= e!507629 tp_is_empty!18679)))

(declare-fun b!905865 () Bool)

(declare-fun e!507626 () Bool)

(assert (=> b!905865 (= e!507626 e!507631)))

(declare-fun res!611309 () Bool)

(assert (=> b!905865 (=> (not res!611309) (not e!507631))))

(declare-datatypes ((tuple2!12218 0))(
  ( (tuple2!12219 (_1!6120 (_ BitVec 64)) (_2!6120 V!29871)) )
))
(declare-datatypes ((List!18028 0))(
  ( (Nil!18025) (Cons!18024 (h!19170 tuple2!12218) (t!25461 List!18028)) )
))
(declare-datatypes ((ListLongMap!10915 0))(
  ( (ListLongMap!10916 (toList!5473 List!18028)) )
))
(declare-fun lt!408709 () ListLongMap!10915)

(declare-fun contains!4518 (ListLongMap!10915 (_ BitVec 64)) Bool)

(assert (=> b!905865 (= res!611309 (contains!4518 lt!408709 k!1033))))

(declare-fun getCurrentListMap!2739 (array!53400 array!53402 (_ BitVec 32) (_ BitVec 32) V!29871 V!29871 (_ BitVec 32) Int) ListLongMap!10915)

(assert (=> b!905865 (= lt!408709 (getCurrentListMap!2739 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905866 () Bool)

(declare-fun e!507632 () Bool)

(assert (=> b!905866 (= e!507628 e!507632)))

(declare-fun res!611301 () Bool)

(assert (=> b!905866 (=> res!611301 e!507632)))

(declare-fun lt!408710 () ListLongMap!10915)

(assert (=> b!905866 (= res!611301 (not (contains!4518 lt!408710 k!1033)))))

(assert (=> b!905866 (= lt!408710 (getCurrentListMap!2739 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905867 () Bool)

(declare-fun res!611305 () Bool)

(assert (=> b!905867 (=> (not res!611305) (not e!507626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53400 (_ BitVec 32)) Bool)

(assert (=> b!905867 (= res!611305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905868 () Bool)

(declare-fun res!611300 () Bool)

(assert (=> b!905868 (=> (not res!611300) (not e!507631))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905868 (= res!611300 (inRange!0 i!717 mask!1756))))

(declare-fun b!905869 () Bool)

(declare-fun e!507633 () Bool)

(assert (=> b!905869 (= e!507633 (and e!507629 mapRes!29731))))

(declare-fun condMapEmpty!29731 () Bool)

(declare-fun mapDefault!29731 () ValueCell!8858)

