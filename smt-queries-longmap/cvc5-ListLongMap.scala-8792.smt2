; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106976 () Bool)

(assert start!106976)

(declare-fun mapIsEmpty!50578 () Bool)

(declare-fun mapRes!50578 () Bool)

(assert (=> mapIsEmpty!50578 mapRes!50578))

(declare-fun b!1268483 () Bool)

(declare-fun res!844274 () Bool)

(declare-fun e!722822 () Bool)

(assert (=> b!1268483 (=> (not res!844274) (not e!722822))))

(declare-datatypes ((V!48747 0))(
  ( (V!48748 (val!16407 Int)) )
))
(declare-datatypes ((ValueCell!15479 0))(
  ( (ValueCellFull!15479 (v!19044 V!48747)) (EmptyCell!15479) )
))
(declare-datatypes ((array!82604 0))(
  ( (array!82605 (arr!39839 (Array (_ BitVec 32) ValueCell!15479)) (size!40375 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82604)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82606 0))(
  ( (array!82607 (arr!39840 (Array (_ BitVec 32) (_ BitVec 64))) (size!40376 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82606)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268483 (= res!844274 (and (= (size!40375 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40376 _keys!1364) (size!40375 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268484 () Bool)

(declare-fun res!844272 () Bool)

(assert (=> b!1268484 (=> (not res!844272) (not e!722822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82606 (_ BitVec 32)) Bool)

(assert (=> b!1268484 (= res!844272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268485 () Bool)

(declare-fun e!722823 () Bool)

(declare-fun tp_is_empty!32665 () Bool)

(assert (=> b!1268485 (= e!722823 tp_is_empty!32665)))

(declare-fun b!1268486 () Bool)

(assert (=> b!1268486 (= e!722822 false)))

(declare-fun lt!574434 () Bool)

(declare-datatypes ((List!28383 0))(
  ( (Nil!28380) (Cons!28379 (h!29588 (_ BitVec 64)) (t!41912 List!28383)) )
))
(declare-fun arrayNoDuplicates!0 (array!82606 (_ BitVec 32) List!28383) Bool)

(assert (=> b!1268486 (= lt!574434 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28380))))

(declare-fun res!844273 () Bool)

(assert (=> start!106976 (=> (not res!844273) (not e!722822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106976 (= res!844273 (validMask!0 mask!1730))))

(assert (=> start!106976 e!722822))

(declare-fun e!722819 () Bool)

(declare-fun array_inv!30313 (array!82604) Bool)

(assert (=> start!106976 (and (array_inv!30313 _values!1134) e!722819)))

(assert (=> start!106976 true))

(declare-fun array_inv!30314 (array!82606) Bool)

(assert (=> start!106976 (array_inv!30314 _keys!1364)))

(declare-fun b!1268487 () Bool)

(assert (=> b!1268487 (= e!722819 (and e!722823 mapRes!50578))))

(declare-fun condMapEmpty!50578 () Bool)

(declare-fun mapDefault!50578 () ValueCell!15479)

