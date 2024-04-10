; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77634 () Bool)

(assert start!77634)

(declare-fun b_free!16219 () Bool)

(declare-fun b_next!16219 () Bool)

(assert (=> start!77634 (= b_free!16219 (not b_next!16219))))

(declare-fun tp!56919 () Bool)

(declare-fun b_and!26591 () Bool)

(assert (=> start!77634 (= tp!56919 b_and!26591)))

(declare-fun b!905000 () Bool)

(declare-fun res!610674 () Bool)

(declare-fun e!507124 () Bool)

(assert (=> b!905000 (=> (not res!610674) (not e!507124))))

(declare-datatypes ((array!53318 0))(
  ( (array!53319 (arr!25618 (Array (_ BitVec 32) (_ BitVec 64))) (size!26077 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53318)

(declare-datatypes ((List!17993 0))(
  ( (Nil!17990) (Cons!17989 (h!19135 (_ BitVec 64)) (t!25384 List!17993)) )
))
(declare-fun arrayNoDuplicates!0 (array!53318 (_ BitVec 32) List!17993) Bool)

(assert (=> b!905000 (= res!610674 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17990))))

(declare-fun b!905001 () Bool)

(declare-fun e!507128 () Bool)

(assert (=> b!905001 (= e!507124 e!507128)))

(declare-fun res!610673 () Bool)

(assert (=> b!905001 (=> (not res!610673) (not e!507128))))

(declare-datatypes ((V!29815 0))(
  ( (V!29816 (val!9369 Int)) )
))
(declare-datatypes ((tuple2!12180 0))(
  ( (tuple2!12181 (_1!6101 (_ BitVec 64)) (_2!6101 V!29815)) )
))
(declare-datatypes ((List!17994 0))(
  ( (Nil!17991) (Cons!17990 (h!19136 tuple2!12180) (t!25385 List!17994)) )
))
(declare-datatypes ((ListLongMap!10877 0))(
  ( (ListLongMap!10878 (toList!5454 List!17994)) )
))
(declare-fun lt!408395 () ListLongMap!10877)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4500 (ListLongMap!10877 (_ BitVec 64)) Bool)

(assert (=> b!905001 (= res!610673 (contains!4500 lt!408395 k!1033))))

(declare-datatypes ((ValueCell!8837 0))(
  ( (ValueCellFull!8837 (v!11874 V!29815)) (EmptyCell!8837) )
))
(declare-datatypes ((array!53320 0))(
  ( (array!53321 (arr!25619 (Array (_ BitVec 32) ValueCell!8837)) (size!26078 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53320)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29815)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29815)

(declare-fun getCurrentListMap!2721 (array!53318 array!53320 (_ BitVec 32) (_ BitVec 32) V!29815 V!29815 (_ BitVec 32) Int) ListLongMap!10877)

(assert (=> b!905001 (= lt!408395 (getCurrentListMap!2721 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905002 () Bool)

(declare-fun e!507126 () Bool)

(declare-fun e!507125 () Bool)

(declare-fun mapRes!29668 () Bool)

(assert (=> b!905002 (= e!507126 (and e!507125 mapRes!29668))))

(declare-fun condMapEmpty!29668 () Bool)

(declare-fun mapDefault!29668 () ValueCell!8837)

