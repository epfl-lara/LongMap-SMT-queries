; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104818 () Bool)

(assert start!104818)

(declare-fun b_free!26623 () Bool)

(declare-fun b_next!26623 () Bool)

(assert (=> start!104818 (= b_free!26623 (not b_next!26623))))

(declare-fun tp!93359 () Bool)

(declare-fun b_and!44391 () Bool)

(assert (=> start!104818 (= tp!93359 b_and!44391)))

(declare-fun b!1249431 () Bool)

(declare-fun res!833461 () Bool)

(declare-fun e!709128 () Bool)

(assert (=> b!1249431 (=> (not res!833461) (not e!709128))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80732 0))(
  ( (array!80733 (arr!38933 (Array (_ BitVec 32) (_ BitVec 64))) (size!39469 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80732)

(declare-datatypes ((V!47399 0))(
  ( (V!47400 (val!15825 Int)) )
))
(declare-datatypes ((ValueCell!14999 0))(
  ( (ValueCellFull!14999 (v!18521 V!47399)) (EmptyCell!14999) )
))
(declare-datatypes ((array!80734 0))(
  ( (array!80735 (arr!38934 (Array (_ BitVec 32) ValueCell!14999)) (size!39470 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80734)

(assert (=> b!1249431 (= res!833461 (and (= (size!39470 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39469 _keys!1118) (size!39470 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249432 () Bool)

(declare-fun res!833462 () Bool)

(assert (=> b!1249432 (=> (not res!833462) (not e!709128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80732 (_ BitVec 32)) Bool)

(assert (=> b!1249432 (= res!833462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833463 () Bool)

(assert (=> start!104818 (=> (not res!833463) (not e!709128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104818 (= res!833463 (validMask!0 mask!1466))))

(assert (=> start!104818 e!709128))

(assert (=> start!104818 true))

(assert (=> start!104818 tp!93359))

(declare-fun tp_is_empty!31525 () Bool)

(assert (=> start!104818 tp_is_empty!31525))

(declare-fun array_inv!29711 (array!80732) Bool)

(assert (=> start!104818 (array_inv!29711 _keys!1118)))

(declare-fun e!709130 () Bool)

(declare-fun array_inv!29712 (array!80734) Bool)

(assert (=> start!104818 (and (array_inv!29712 _values!914) e!709130)))

(declare-fun b!1249433 () Bool)

(declare-fun e!709132 () Bool)

(declare-fun mapRes!49048 () Bool)

(assert (=> b!1249433 (= e!709130 (and e!709132 mapRes!49048))))

(declare-fun condMapEmpty!49048 () Bool)

(declare-fun mapDefault!49048 () ValueCell!14999)

