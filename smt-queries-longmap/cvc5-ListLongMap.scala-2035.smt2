; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35378 () Bool)

(assert start!35378)

(declare-fun b!354188 () Bool)

(declare-fun res!196354 () Bool)

(declare-fun e!217029 () Bool)

(assert (=> b!354188 (=> (not res!196354) (not e!217029))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19249 0))(
  ( (array!19250 (arr!9118 (Array (_ BitVec 32) (_ BitVec 64))) (size!9470 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19249)

(declare-datatypes ((V!11419 0))(
  ( (V!11420 (val!3960 Int)) )
))
(declare-datatypes ((ValueCell!3572 0))(
  ( (ValueCellFull!3572 (v!6154 V!11419)) (EmptyCell!3572) )
))
(declare-datatypes ((array!19251 0))(
  ( (array!19252 (arr!9119 (Array (_ BitVec 32) ValueCell!3572)) (size!9471 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19251)

(assert (=> b!354188 (= res!196354 (and (= (size!9471 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9470 _keys!1456) (size!9471 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354189 () Bool)

(declare-fun e!217028 () Bool)

(declare-fun e!217027 () Bool)

(declare-fun mapRes!13254 () Bool)

(assert (=> b!354189 (= e!217028 (and e!217027 mapRes!13254))))

(declare-fun condMapEmpty!13254 () Bool)

(declare-fun mapDefault!13254 () ValueCell!3572)

