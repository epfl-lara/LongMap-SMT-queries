; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106896 () Bool)

(assert start!106896)

(declare-fun res!844044 () Bool)

(declare-fun e!722458 () Bool)

(assert (=> start!106896 (=> (not res!844044) (not e!722458))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106896 (= res!844044 (validMask!0 mask!1730))))

(assert (=> start!106896 e!722458))

(declare-datatypes ((V!48699 0))(
  ( (V!48700 (val!16389 Int)) )
))
(declare-datatypes ((ValueCell!15461 0))(
  ( (ValueCellFull!15461 (v!19025 V!48699)) (EmptyCell!15461) )
))
(declare-datatypes ((array!82524 0))(
  ( (array!82525 (arr!39804 (Array (_ BitVec 32) ValueCell!15461)) (size!40340 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82524)

(declare-fun e!722456 () Bool)

(declare-fun array_inv!30293 (array!82524) Bool)

(assert (=> start!106896 (and (array_inv!30293 _values!1134) e!722456)))

(assert (=> start!106896 true))

(declare-datatypes ((array!82526 0))(
  ( (array!82527 (arr!39805 (Array (_ BitVec 32) (_ BitVec 64))) (size!40341 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82526)

(declare-fun array_inv!30294 (array!82526) Bool)

(assert (=> start!106896 (array_inv!30294 _keys!1364)))

(declare-fun b!1268029 () Bool)

(declare-fun e!722454 () Bool)

(declare-fun mapRes!50509 () Bool)

(assert (=> b!1268029 (= e!722456 (and e!722454 mapRes!50509))))

(declare-fun condMapEmpty!50509 () Bool)

(declare-fun mapDefault!50509 () ValueCell!15461)

