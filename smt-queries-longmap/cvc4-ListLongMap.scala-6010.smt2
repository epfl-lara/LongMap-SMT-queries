; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77932 () Bool)

(assert start!77932)

(declare-fun b_free!16475 () Bool)

(declare-fun b_next!16475 () Bool)

(assert (=> start!77932 (= b_free!16475 (not b_next!16475))))

(declare-fun tp!57693 () Bool)

(declare-fun b_and!27045 () Bool)

(assert (=> start!77932 (= tp!57693 b_and!27045)))

(declare-fun res!614052 () Bool)

(declare-fun e!510075 () Bool)

(assert (=> start!77932 (=> (not res!614052) (not e!510075))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77932 (= res!614052 (validMask!0 mask!1756))))

(assert (=> start!77932 e!510075))

(declare-datatypes ((V!30155 0))(
  ( (V!30156 (val!9497 Int)) )
))
(declare-datatypes ((ValueCell!8965 0))(
  ( (ValueCellFull!8965 (v!12005 V!30155)) (EmptyCell!8965) )
))
(declare-datatypes ((array!53808 0))(
  ( (array!53809 (arr!25861 (Array (_ BitVec 32) ValueCell!8965)) (size!26320 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53808)

(declare-fun e!510077 () Bool)

(declare-fun array_inv!20228 (array!53808) Bool)

(assert (=> start!77932 (and (array_inv!20228 _values!1152) e!510077)))

(assert (=> start!77932 tp!57693))

(assert (=> start!77932 true))

(declare-fun tp_is_empty!18893 () Bool)

(assert (=> start!77932 tp_is_empty!18893))

(declare-datatypes ((array!53810 0))(
  ( (array!53811 (arr!25862 (Array (_ BitVec 32) (_ BitVec 64))) (size!26321 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53810)

(declare-fun array_inv!20229 (array!53810) Bool)

(assert (=> start!77932 (array_inv!20229 _keys!1386)))

(declare-fun mapNonEmpty!30058 () Bool)

(declare-fun mapRes!30058 () Bool)

(declare-fun tp!57692 () Bool)

(declare-fun e!510074 () Bool)

(assert (=> mapNonEmpty!30058 (= mapRes!30058 (and tp!57692 e!510074))))

(declare-fun mapRest!30058 () (Array (_ BitVec 32) ValueCell!8965))

(declare-fun mapKey!30058 () (_ BitVec 32))

(declare-fun mapValue!30058 () ValueCell!8965)

(assert (=> mapNonEmpty!30058 (= (arr!25861 _values!1152) (store mapRest!30058 mapKey!30058 mapValue!30058))))

(declare-fun b!909875 () Bool)

(assert (=> b!909875 (= e!510075 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410117 () Bool)

(declare-fun zeroValue!1094 () V!30155)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30155)

(declare-datatypes ((tuple2!12376 0))(
  ( (tuple2!12377 (_1!6199 (_ BitVec 64)) (_2!6199 V!30155)) )
))
(declare-datatypes ((List!18169 0))(
  ( (Nil!18166) (Cons!18165 (h!19311 tuple2!12376) (t!25752 List!18169)) )
))
(declare-datatypes ((ListLongMap!11073 0))(
  ( (ListLongMap!11074 (toList!5552 List!18169)) )
))
(declare-fun contains!4595 (ListLongMap!11073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2814 (array!53810 array!53808 (_ BitVec 32) (_ BitVec 32) V!30155 V!30155 (_ BitVec 32) Int) ListLongMap!11073)

(assert (=> b!909875 (= lt!410117 (contains!4595 (getCurrentListMap!2814 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909876 () Bool)

(assert (=> b!909876 (= e!510074 tp_is_empty!18893)))

(declare-fun b!909877 () Bool)

(declare-fun res!614049 () Bool)

(assert (=> b!909877 (=> (not res!614049) (not e!510075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53810 (_ BitVec 32)) Bool)

(assert (=> b!909877 (= res!614049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909878 () Bool)

(declare-fun e!510076 () Bool)

(assert (=> b!909878 (= e!510077 (and e!510076 mapRes!30058))))

(declare-fun condMapEmpty!30058 () Bool)

(declare-fun mapDefault!30058 () ValueCell!8965)

