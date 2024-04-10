; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77622 () Bool)

(assert start!77622)

(declare-fun b_free!16207 () Bool)

(declare-fun b_next!16207 () Bool)

(assert (=> start!77622 (= b_free!16207 (not b_next!16207))))

(declare-fun tp!56882 () Bool)

(declare-fun b_and!26573 () Bool)

(assert (=> start!77622 (= tp!56882 b_and!26573)))

(declare-fun b!904767 () Bool)

(declare-fun res!610503 () Bool)

(declare-fun e!506985 () Bool)

(assert (=> b!904767 (=> (not res!610503) (not e!506985))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904767 (= res!610503 (inRange!0 i!717 mask!1756))))

(declare-fun b!904768 () Bool)

(declare-fun e!506987 () Bool)

(assert (=> b!904768 (= e!506985 (not e!506987))))

(declare-fun res!610505 () Bool)

(assert (=> b!904768 (=> res!610505 e!506987)))

(declare-datatypes ((array!53294 0))(
  ( (array!53295 (arr!25606 (Array (_ BitVec 32) (_ BitVec 64))) (size!26065 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53294)

(assert (=> b!904768 (= res!610505 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26065 _keys!1386))))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904768 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!29799 0))(
  ( (V!29800 (val!9363 Int)) )
))
(declare-datatypes ((ValueCell!8831 0))(
  ( (ValueCellFull!8831 (v!11868 V!29799)) (EmptyCell!8831) )
))
(declare-datatypes ((array!53296 0))(
  ( (array!53297 (arr!25607 (Array (_ BitVec 32) ValueCell!8831)) (size!26066 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53296)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29799)

(declare-datatypes ((Unit!30690 0))(
  ( (Unit!30691) )
))
(declare-fun lt!408318 () Unit!30690)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29799)

(declare-fun lemmaKeyInListMapIsInArray!188 (array!53294 array!53296 (_ BitVec 32) (_ BitVec 32) V!29799 V!29799 (_ BitVec 64) Int) Unit!30690)

(assert (=> b!904768 (= lt!408318 (lemmaKeyInListMapIsInArray!188 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904769 () Bool)

(declare-fun res!610500 () Bool)

(assert (=> b!904769 (=> (not res!610500) (not e!506985))))

(declare-datatypes ((List!17981 0))(
  ( (Nil!17978) (Cons!17977 (h!19123 (_ BitVec 64)) (t!25364 List!17981)) )
))
(declare-fun arrayNoDuplicates!0 (array!53294 (_ BitVec 32) List!17981) Bool)

(assert (=> b!904769 (= res!610500 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17978))))

(declare-fun b!904770 () Bool)

(declare-fun res!610504 () Bool)

(assert (=> b!904770 (=> (not res!610504) (not e!506985))))

(assert (=> b!904770 (= res!610504 (and (= (select (arr!25606 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904771 () Bool)

(declare-fun res!610497 () Bool)

(assert (=> b!904771 (=> (not res!610497) (not e!506985))))

(declare-datatypes ((tuple2!12168 0))(
  ( (tuple2!12169 (_1!6095 (_ BitVec 64)) (_2!6095 V!29799)) )
))
(declare-datatypes ((List!17982 0))(
  ( (Nil!17979) (Cons!17978 (h!19124 tuple2!12168) (t!25365 List!17982)) )
))
(declare-datatypes ((ListLongMap!10865 0))(
  ( (ListLongMap!10866 (toList!5448 List!17982)) )
))
(declare-fun contains!4495 (ListLongMap!10865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2716 (array!53294 array!53296 (_ BitVec 32) (_ BitVec 32) V!29799 V!29799 (_ BitVec 32) Int) ListLongMap!10865)

(assert (=> b!904771 (= res!610497 (contains!4495 (getCurrentListMap!2716 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!904772 () Bool)

(declare-fun res!610498 () Bool)

(assert (=> b!904772 (=> (not res!610498) (not e!506985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53294 (_ BitVec 32)) Bool)

(assert (=> b!904772 (= res!610498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904773 () Bool)

(declare-fun e!506991 () Bool)

(declare-fun tp_is_empty!18625 () Bool)

(assert (=> b!904773 (= e!506991 tp_is_empty!18625)))

(declare-fun b!904774 () Bool)

(declare-fun e!506986 () Bool)

(declare-fun e!506989 () Bool)

(declare-fun mapRes!29650 () Bool)

(assert (=> b!904774 (= e!506986 (and e!506989 mapRes!29650))))

(declare-fun condMapEmpty!29650 () Bool)

(declare-fun mapDefault!29650 () ValueCell!8831)

