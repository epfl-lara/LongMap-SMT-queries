; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77976 () Bool)

(assert start!77976)

(declare-fun b_free!16519 () Bool)

(declare-fun b_next!16519 () Bool)

(assert (=> start!77976 (= b_free!16519 (not b_next!16519))))

(declare-fun tp!57825 () Bool)

(declare-fun b_and!27089 () Bool)

(assert (=> start!77976 (= tp!57825 b_and!27089)))

(declare-fun b!910341 () Bool)

(declare-fun res!614319 () Bool)

(declare-fun e!510405 () Bool)

(assert (=> b!910341 (=> (not res!614319) (not e!510405))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!910341 (= res!614319 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!30124 () Bool)

(declare-fun mapRes!30124 () Bool)

(declare-fun tp!57824 () Bool)

(declare-fun e!510406 () Bool)

(assert (=> mapNonEmpty!30124 (= mapRes!30124 (and tp!57824 e!510406))))

(declare-datatypes ((V!30215 0))(
  ( (V!30216 (val!9519 Int)) )
))
(declare-datatypes ((ValueCell!8987 0))(
  ( (ValueCellFull!8987 (v!12027 V!30215)) (EmptyCell!8987) )
))
(declare-datatypes ((array!53888 0))(
  ( (array!53889 (arr!25901 (Array (_ BitVec 32) ValueCell!8987)) (size!26360 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53888)

(declare-fun mapValue!30124 () ValueCell!8987)

(declare-fun mapKey!30124 () (_ BitVec 32))

(declare-fun mapRest!30124 () (Array (_ BitVec 32) ValueCell!8987))

(assert (=> mapNonEmpty!30124 (= (arr!25901 _values!1152) (store mapRest!30124 mapKey!30124 mapValue!30124))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!53890 0))(
  ( (array!53891 (arr!25902 (Array (_ BitVec 32) (_ BitVec 64))) (size!26361 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53890)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun b!910342 () Bool)

(assert (=> b!910342 (= e!510405 (and (= (select (arr!25902 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!26361 _keys!1386))))))

(declare-fun res!614321 () Bool)

(assert (=> start!77976 (=> (not res!614321) (not e!510405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77976 (= res!614321 (validMask!0 mask!1756))))

(assert (=> start!77976 e!510405))

(declare-fun e!510408 () Bool)

(declare-fun array_inv!20256 (array!53888) Bool)

(assert (=> start!77976 (and (array_inv!20256 _values!1152) e!510408)))

(assert (=> start!77976 tp!57825))

(assert (=> start!77976 true))

(declare-fun tp_is_empty!18937 () Bool)

(assert (=> start!77976 tp_is_empty!18937))

(declare-fun array_inv!20257 (array!53890) Bool)

(assert (=> start!77976 (array_inv!20257 _keys!1386)))

(declare-fun mapIsEmpty!30124 () Bool)

(assert (=> mapIsEmpty!30124 mapRes!30124))

(declare-fun b!910343 () Bool)

(declare-fun res!614320 () Bool)

(assert (=> b!910343 (=> (not res!614320) (not e!510405))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30215)

(declare-fun minValue!1094 () V!30215)

(declare-datatypes ((tuple2!12402 0))(
  ( (tuple2!12403 (_1!6212 (_ BitVec 64)) (_2!6212 V!30215)) )
))
(declare-datatypes ((List!18193 0))(
  ( (Nil!18190) (Cons!18189 (h!19335 tuple2!12402) (t!25776 List!18193)) )
))
(declare-datatypes ((ListLongMap!11099 0))(
  ( (ListLongMap!11100 (toList!5565 List!18193)) )
))
(declare-fun contains!4608 (ListLongMap!11099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2827 (array!53890 array!53888 (_ BitVec 32) (_ BitVec 32) V!30215 V!30215 (_ BitVec 32) Int) ListLongMap!11099)

(assert (=> b!910343 (= res!614320 (contains!4608 (getCurrentListMap!2827 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!910344 () Bool)

(declare-fun res!614322 () Bool)

(assert (=> b!910344 (=> (not res!614322) (not e!510405))))

(assert (=> b!910344 (= res!614322 (and (= (size!26360 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26361 _keys!1386) (size!26360 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910345 () Bool)

(declare-fun e!510407 () Bool)

(assert (=> b!910345 (= e!510408 (and e!510407 mapRes!30124))))

(declare-fun condMapEmpty!30124 () Bool)

(declare-fun mapDefault!30124 () ValueCell!8987)

