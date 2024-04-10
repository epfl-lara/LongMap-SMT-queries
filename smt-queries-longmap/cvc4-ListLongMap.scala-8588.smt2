; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104762 () Bool)

(assert start!104762)

(declare-fun b_free!26567 () Bool)

(declare-fun b_next!26567 () Bool)

(assert (=> start!104762 (= b_free!26567 (not b_next!26567))))

(declare-fun tp!93190 () Bool)

(declare-fun b_and!44335 () Bool)

(assert (=> start!104762 (= tp!93190 b_and!44335)))

(declare-fun b!1248843 () Bool)

(declare-fun res!833126 () Bool)

(declare-fun e!708710 () Bool)

(assert (=> b!1248843 (=> (not res!833126) (not e!708710))))

(declare-datatypes ((array!80624 0))(
  ( (array!80625 (arr!38879 (Array (_ BitVec 32) (_ BitVec 64))) (size!39415 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80624)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80624 (_ BitVec 32)) Bool)

(assert (=> b!1248843 (= res!833126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248844 () Bool)

(declare-fun res!833127 () Bool)

(assert (=> b!1248844 (=> (not res!833127) (not e!708710))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47323 0))(
  ( (V!47324 (val!15797 Int)) )
))
(declare-datatypes ((ValueCell!14971 0))(
  ( (ValueCellFull!14971 (v!18493 V!47323)) (EmptyCell!14971) )
))
(declare-datatypes ((array!80626 0))(
  ( (array!80627 (arr!38880 (Array (_ BitVec 32) ValueCell!14971)) (size!39416 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80626)

(assert (=> b!1248844 (= res!833127 (and (= (size!39416 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39415 _keys!1118) (size!39416 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248846 () Bool)

(declare-fun e!708711 () Bool)

(declare-fun tp_is_empty!31469 () Bool)

(assert (=> b!1248846 (= e!708711 tp_is_empty!31469)))

(declare-fun b!1248847 () Bool)

(declare-fun e!708712 () Bool)

(declare-fun mapRes!48964 () Bool)

(assert (=> b!1248847 (= e!708712 (and e!708711 mapRes!48964))))

(declare-fun condMapEmpty!48964 () Bool)

(declare-fun mapDefault!48964 () ValueCell!14971)

