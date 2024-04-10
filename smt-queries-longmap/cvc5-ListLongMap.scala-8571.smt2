; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104634 () Bool)

(assert start!104634)

(declare-fun res!832471 () Bool)

(declare-fun e!707838 () Bool)

(assert (=> start!104634 (=> (not res!832471) (not e!707838))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104634 (= res!832471 (validMask!0 mask!1466))))

(assert (=> start!104634 e!707838))

(assert (=> start!104634 true))

(declare-datatypes ((array!80420 0))(
  ( (array!80421 (arr!38779 (Array (_ BitVec 32) (_ BitVec 64))) (size!39315 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80420)

(declare-fun array_inv!29607 (array!80420) Bool)

(assert (=> start!104634 (array_inv!29607 _keys!1118)))

(declare-datatypes ((V!47183 0))(
  ( (V!47184 (val!15744 Int)) )
))
(declare-datatypes ((ValueCell!14918 0))(
  ( (ValueCellFull!14918 (v!18440 V!47183)) (EmptyCell!14918) )
))
(declare-datatypes ((array!80422 0))(
  ( (array!80423 (arr!38780 (Array (_ BitVec 32) ValueCell!14918)) (size!39316 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80422)

(declare-fun e!707842 () Bool)

(declare-fun array_inv!29608 (array!80422) Bool)

(assert (=> start!104634 (and (array_inv!29608 _values!914) e!707842)))

(declare-fun b!1247647 () Bool)

(declare-fun res!832473 () Bool)

(assert (=> b!1247647 (=> (not res!832473) (not e!707838))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247647 (= res!832473 (and (= (size!39316 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39315 _keys!1118) (size!39316 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247648 () Bool)

(declare-fun e!707840 () Bool)

(declare-fun tp_is_empty!31363 () Bool)

(assert (=> b!1247648 (= e!707840 tp_is_empty!31363)))

(declare-fun b!1247649 () Bool)

(declare-fun e!707841 () Bool)

(declare-fun mapRes!48799 () Bool)

(assert (=> b!1247649 (= e!707842 (and e!707841 mapRes!48799))))

(declare-fun condMapEmpty!48799 () Bool)

(declare-fun mapDefault!48799 () ValueCell!14918)

