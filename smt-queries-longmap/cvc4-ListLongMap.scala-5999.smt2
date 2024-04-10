; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77850 () Bool)

(assert start!77850)

(declare-fun b_free!16409 () Bool)

(declare-fun b_next!16409 () Bool)

(assert (=> start!77850 (= b_free!16409 (not b_next!16409))))

(declare-fun tp!57492 () Bool)

(declare-fun b_and!26975 () Bool)

(assert (=> start!77850 (= tp!57492 b_and!26975)))

(declare-fun b!909047 () Bool)

(declare-fun res!613593 () Bool)

(declare-fun e!509506 () Bool)

(assert (=> b!909047 (=> (not res!613593) (not e!509506))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53682 0))(
  ( (array!53683 (arr!25799 (Array (_ BitVec 32) (_ BitVec 64))) (size!26258 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53682)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!909047 (= res!613593 (and (= (select (arr!25799 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!909048 () Bool)

(declare-fun e!509511 () Bool)

(declare-fun e!509505 () Bool)

(assert (=> b!909048 (= e!509511 e!509505)))

(declare-fun res!613585 () Bool)

(assert (=> b!909048 (=> res!613585 e!509505)))

(declare-datatypes ((V!30067 0))(
  ( (V!30068 (val!9464 Int)) )
))
(declare-datatypes ((tuple2!12334 0))(
  ( (tuple2!12335 (_1!6178 (_ BitVec 64)) (_2!6178 V!30067)) )
))
(declare-datatypes ((List!18127 0))(
  ( (Nil!18124) (Cons!18123 (h!19269 tuple2!12334) (t!25708 List!18127)) )
))
(declare-datatypes ((ListLongMap!11031 0))(
  ( (ListLongMap!11032 (toList!5531 List!18127)) )
))
(declare-fun lt!409940 () ListLongMap!11031)

(declare-fun contains!4573 (ListLongMap!11031 (_ BitVec 64)) Bool)

(assert (=> b!909048 (= res!613585 (not (contains!4573 lt!409940 k!1033)))))

(declare-datatypes ((ValueCell!8932 0))(
  ( (ValueCellFull!8932 (v!11971 V!30067)) (EmptyCell!8932) )
))
(declare-datatypes ((array!53684 0))(
  ( (array!53685 (arr!25800 (Array (_ BitVec 32) ValueCell!8932)) (size!26259 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53684)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30067)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30067)

(declare-fun getCurrentListMap!2793 (array!53682 array!53684 (_ BitVec 32) (_ BitVec 32) V!30067 V!30067 (_ BitVec 32) Int) ListLongMap!11031)

(assert (=> b!909048 (= lt!409940 (getCurrentListMap!2793 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!909049 () Bool)

(declare-fun e!509508 () Bool)

(declare-fun e!509507 () Bool)

(declare-fun mapRes!29956 () Bool)

(assert (=> b!909049 (= e!509508 (and e!509507 mapRes!29956))))

(declare-fun condMapEmpty!29956 () Bool)

(declare-fun mapDefault!29956 () ValueCell!8932)

