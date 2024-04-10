; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77964 () Bool)

(assert start!77964)

(declare-fun b_free!16507 () Bool)

(declare-fun b_next!16507 () Bool)

(assert (=> start!77964 (= b_free!16507 (not b_next!16507))))

(declare-fun tp!57789 () Bool)

(declare-fun b_and!27077 () Bool)

(assert (=> start!77964 (= tp!57789 b_and!27077)))

(declare-fun b!910211 () Bool)

(declare-fun res!614242 () Bool)

(declare-fun e!510314 () Bool)

(assert (=> b!910211 (=> (not res!614242) (not e!510314))))

(declare-datatypes ((array!53868 0))(
  ( (array!53869 (arr!25891 (Array (_ BitVec 32) (_ BitVec 64))) (size!26350 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53868)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53868 (_ BitVec 32)) Bool)

(assert (=> b!910211 (= res!614242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910212 () Bool)

(declare-fun res!614241 () Bool)

(assert (=> b!910212 (=> (not res!614241) (not e!510314))))

(declare-datatypes ((List!18187 0))(
  ( (Nil!18184) (Cons!18183 (h!19329 (_ BitVec 64)) (t!25770 List!18187)) )
))
(declare-fun arrayNoDuplicates!0 (array!53868 (_ BitVec 32) List!18187) Bool)

(assert (=> b!910212 (= res!614241 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18184))))

(declare-fun mapIsEmpty!30106 () Bool)

(declare-fun mapRes!30106 () Bool)

(assert (=> mapIsEmpty!30106 mapRes!30106))

(declare-fun b!910213 () Bool)

(declare-fun e!510316 () Bool)

(declare-fun e!510317 () Bool)

(assert (=> b!910213 (= e!510316 (and e!510317 mapRes!30106))))

(declare-fun condMapEmpty!30106 () Bool)

(declare-datatypes ((V!30199 0))(
  ( (V!30200 (val!9513 Int)) )
))
(declare-datatypes ((ValueCell!8981 0))(
  ( (ValueCellFull!8981 (v!12021 V!30199)) (EmptyCell!8981) )
))
(declare-datatypes ((array!53870 0))(
  ( (array!53871 (arr!25892 (Array (_ BitVec 32) ValueCell!8981)) (size!26351 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53870)

(declare-fun mapDefault!30106 () ValueCell!8981)

