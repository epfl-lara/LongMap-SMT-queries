; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78104 () Bool)

(assert start!78104)

(declare-fun b_free!16615 () Bool)

(declare-fun b_next!16615 () Bool)

(assert (=> start!78104 (= b_free!16615 (not b_next!16615))))

(declare-fun tp!58118 () Bool)

(declare-fun b_and!27189 () Bool)

(assert (=> start!78104 (= tp!58118 b_and!27189)))

(declare-fun mapIsEmpty!30274 () Bool)

(declare-fun mapRes!30274 () Bool)

(assert (=> mapIsEmpty!30274 mapRes!30274))

(declare-fun b!911599 () Bool)

(declare-fun res!615017 () Bool)

(declare-fun e!511268 () Bool)

(assert (=> b!911599 (=> (not res!615017) (not e!511268))))

(declare-datatypes ((array!54068 0))(
  ( (array!54069 (arr!25989 (Array (_ BitVec 32) (_ BitVec 64))) (size!26448 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54068)

(declare-datatypes ((List!18255 0))(
  ( (Nil!18252) (Cons!18251 (h!19397 (_ BitVec 64)) (t!25842 List!18255)) )
))
(declare-fun arrayNoDuplicates!0 (array!54068 (_ BitVec 32) List!18255) Bool)

(assert (=> b!911599 (= res!615017 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18252))))

(declare-fun res!615016 () Bool)

(assert (=> start!78104 (=> (not res!615016) (not e!511268))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78104 (= res!615016 (validMask!0 mask!1756))))

(assert (=> start!78104 e!511268))

(declare-datatypes ((V!30343 0))(
  ( (V!30344 (val!9567 Int)) )
))
(declare-datatypes ((ValueCell!9035 0))(
  ( (ValueCellFull!9035 (v!12077 V!30343)) (EmptyCell!9035) )
))
(declare-datatypes ((array!54070 0))(
  ( (array!54071 (arr!25990 (Array (_ BitVec 32) ValueCell!9035)) (size!26449 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54070)

(declare-fun e!511269 () Bool)

(declare-fun array_inv!20314 (array!54070) Bool)

(assert (=> start!78104 (and (array_inv!20314 _values!1152) e!511269)))

(assert (=> start!78104 tp!58118))

(assert (=> start!78104 true))

(declare-fun tp_is_empty!19033 () Bool)

(assert (=> start!78104 tp_is_empty!19033))

(declare-fun array_inv!20315 (array!54068) Bool)

(assert (=> start!78104 (array_inv!20315 _keys!1386)))

(declare-fun b!911600 () Bool)

(declare-fun res!615018 () Bool)

(assert (=> b!911600 (=> (not res!615018) (not e!511268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54068 (_ BitVec 32)) Bool)

(assert (=> b!911600 (= res!615018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911601 () Bool)

(declare-fun e!511272 () Bool)

(assert (=> b!911601 (= e!511272 tp_is_empty!19033)))

(declare-fun b!911602 () Bool)

(assert (=> b!911602 (= e!511269 (and e!511272 mapRes!30274))))

(declare-fun condMapEmpty!30274 () Bool)

(declare-fun mapDefault!30274 () ValueCell!9035)

