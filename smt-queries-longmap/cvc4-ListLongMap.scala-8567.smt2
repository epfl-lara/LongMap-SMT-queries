; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104614 () Bool)

(assert start!104614)

(declare-fun res!832382 () Bool)

(declare-fun e!707688 () Bool)

(assert (=> start!104614 (=> (not res!832382) (not e!707688))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104614 (= res!832382 (validMask!0 mask!1466))))

(assert (=> start!104614 e!707688))

(assert (=> start!104614 true))

(declare-datatypes ((array!80382 0))(
  ( (array!80383 (arr!38760 (Array (_ BitVec 32) (_ BitVec 64))) (size!39296 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80382)

(declare-fun array_inv!29597 (array!80382) Bool)

(assert (=> start!104614 (array_inv!29597 _keys!1118)))

(declare-datatypes ((V!47155 0))(
  ( (V!47156 (val!15734 Int)) )
))
(declare-datatypes ((ValueCell!14908 0))(
  ( (ValueCellFull!14908 (v!18430 V!47155)) (EmptyCell!14908) )
))
(declare-datatypes ((array!80384 0))(
  ( (array!80385 (arr!38761 (Array (_ BitVec 32) ValueCell!14908)) (size!39297 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80384)

(declare-fun e!707691 () Bool)

(declare-fun array_inv!29598 (array!80384) Bool)

(assert (=> start!104614 (and (array_inv!29598 _values!914) e!707691)))

(declare-fun b!1247467 () Bool)

(declare-fun res!832381 () Bool)

(assert (=> b!1247467 (=> (not res!832381) (not e!707688))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247467 (= res!832381 (and (= (size!39297 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39296 _keys!1118) (size!39297 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247468 () Bool)

(declare-fun e!707690 () Bool)

(declare-fun mapRes!48769 () Bool)

(assert (=> b!1247468 (= e!707691 (and e!707690 mapRes!48769))))

(declare-fun condMapEmpty!48769 () Bool)

(declare-fun mapDefault!48769 () ValueCell!14908)

