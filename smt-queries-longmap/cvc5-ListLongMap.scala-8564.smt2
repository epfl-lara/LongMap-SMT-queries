; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104570 () Bool)

(assert start!104570)

(declare-fun b!1247175 () Bool)

(declare-fun res!832218 () Bool)

(declare-fun e!707466 () Bool)

(assert (=> b!1247175 (=> (not res!832218) (not e!707466))))

(declare-datatypes ((array!80334 0))(
  ( (array!80335 (arr!38738 (Array (_ BitVec 32) (_ BitVec 64))) (size!39274 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80334)

(assert (=> b!1247175 (= res!832218 (and (bvsle #b00000000000000000000000000000000 (size!39274 _keys!1118)) (bvslt (size!39274 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun b!1247176 () Bool)

(declare-fun e!707467 () Bool)

(declare-fun tp_is_empty!31321 () Bool)

(assert (=> b!1247176 (= e!707467 tp_is_empty!31321)))

(declare-fun b!1247177 () Bool)

(declare-fun res!832217 () Bool)

(assert (=> b!1247177 (=> (not res!832217) (not e!707466))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80334 (_ BitVec 32)) Bool)

(assert (=> b!1247177 (= res!832217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247178 () Bool)

(declare-fun e!707468 () Bool)

(assert (=> b!1247178 (= e!707468 tp_is_empty!31321)))

(declare-fun b!1247179 () Bool)

(declare-fun res!832219 () Bool)

(assert (=> b!1247179 (=> (not res!832219) (not e!707466))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47127 0))(
  ( (V!47128 (val!15723 Int)) )
))
(declare-datatypes ((ValueCell!14897 0))(
  ( (ValueCellFull!14897 (v!18418 V!47127)) (EmptyCell!14897) )
))
(declare-datatypes ((array!80336 0))(
  ( (array!80337 (arr!38739 (Array (_ BitVec 32) ValueCell!14897)) (size!39275 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80336)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247179 (= res!832219 (and (= (size!39275 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39274 _keys!1118) (size!39275 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48730 () Bool)

(declare-fun mapRes!48730 () Bool)

(assert (=> mapIsEmpty!48730 mapRes!48730))

(declare-fun b!1247180 () Bool)

(declare-fun e!707464 () Bool)

(assert (=> b!1247180 (= e!707464 (and e!707467 mapRes!48730))))

(declare-fun condMapEmpty!48730 () Bool)

(declare-fun mapDefault!48730 () ValueCell!14897)

