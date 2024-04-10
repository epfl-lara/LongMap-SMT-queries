; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78020 () Bool)

(assert start!78020)

(declare-fun b_free!16547 () Bool)

(declare-fun b_next!16547 () Bool)

(assert (=> start!78020 (= b_free!16547 (not b_next!16547))))

(declare-fun tp!57911 () Bool)

(declare-fun b_and!27119 () Bool)

(assert (=> start!78020 (= tp!57911 b_and!27119)))

(declare-fun b!910758 () Bool)

(declare-fun e!510686 () Bool)

(declare-fun tp_is_empty!18965 () Bool)

(assert (=> b!910758 (= e!510686 tp_is_empty!18965)))

(declare-fun b!910759 () Bool)

(declare-fun res!614545 () Bool)

(declare-fun e!510689 () Bool)

(assert (=> b!910759 (=> (not res!614545) (not e!510689))))

(declare-datatypes ((array!53942 0))(
  ( (array!53943 (arr!25927 (Array (_ BitVec 32) (_ BitVec 64))) (size!26386 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53942)

(declare-datatypes ((List!18211 0))(
  ( (Nil!18208) (Cons!18207 (h!19353 (_ BitVec 64)) (t!25796 List!18211)) )
))
(declare-fun arrayNoDuplicates!0 (array!53942 (_ BitVec 32) List!18211) Bool)

(assert (=> b!910759 (= res!614545 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18208))))

(declare-fun b!910760 () Bool)

(assert (=> b!910760 (= e!510689 false)))

(declare-datatypes ((V!30251 0))(
  ( (V!30252 (val!9533 Int)) )
))
(declare-datatypes ((ValueCell!9001 0))(
  ( (ValueCellFull!9001 (v!12042 V!30251)) (EmptyCell!9001) )
))
(declare-datatypes ((array!53944 0))(
  ( (array!53945 (arr!25928 (Array (_ BitVec 32) ValueCell!9001)) (size!26387 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53944)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30251)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!410303 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30251)

(declare-datatypes ((tuple2!12420 0))(
  ( (tuple2!12421 (_1!6221 (_ BitVec 64)) (_2!6221 V!30251)) )
))
(declare-datatypes ((List!18212 0))(
  ( (Nil!18209) (Cons!18208 (h!19354 tuple2!12420) (t!25797 List!18212)) )
))
(declare-datatypes ((ListLongMap!11117 0))(
  ( (ListLongMap!11118 (toList!5574 List!18212)) )
))
(declare-fun contains!4618 (ListLongMap!11117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2836 (array!53942 array!53944 (_ BitVec 32) (_ BitVec 32) V!30251 V!30251 (_ BitVec 32) Int) ListLongMap!11117)

(assert (=> b!910760 (= lt!410303 (contains!4618 (getCurrentListMap!2836 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!910761 () Bool)

(declare-fun res!614546 () Bool)

(assert (=> b!910761 (=> (not res!614546) (not e!510689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53942 (_ BitVec 32)) Bool)

(assert (=> b!910761 (= res!614546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910762 () Bool)

(declare-fun e!510690 () Bool)

(declare-fun mapRes!30169 () Bool)

(assert (=> b!910762 (= e!510690 (and e!510686 mapRes!30169))))

(declare-fun condMapEmpty!30169 () Bool)

(declare-fun mapDefault!30169 () ValueCell!9001)

