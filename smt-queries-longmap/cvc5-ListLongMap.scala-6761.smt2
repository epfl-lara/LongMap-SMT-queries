; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84840 () Bool)

(assert start!84840)

(declare-fun b!991643 () Bool)

(declare-fun res!662837 () Bool)

(declare-fun e!559292 () Bool)

(assert (=> b!991643 (=> (not res!662837) (not e!559292))))

(declare-datatypes ((array!62649 0))(
  ( (array!62650 (arr!30171 (Array (_ BitVec 32) (_ BitVec 64))) (size!30650 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62649)

(assert (=> b!991643 (= res!662837 (and (bvsle #b00000000000000000000000000000000 (size!30650 _keys!1945)) (bvslt (size!30650 _keys!1945) #b01111111111111111111111111111111)))))

(declare-fun b!991644 () Bool)

(declare-fun res!662836 () Bool)

(assert (=> b!991644 (=> (not res!662836) (not e!559292))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62649 (_ BitVec 32)) Bool)

(assert (=> b!991644 (= res!662836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991645 () Bool)

(declare-fun e!559290 () Bool)

(declare-fun e!559293 () Bool)

(declare-fun mapRes!37077 () Bool)

(assert (=> b!991645 (= e!559290 (and e!559293 mapRes!37077))))

(declare-fun condMapEmpty!37077 () Bool)

(declare-datatypes ((V!36105 0))(
  ( (V!36106 (val!11721 Int)) )
))
(declare-datatypes ((ValueCell!11189 0))(
  ( (ValueCellFull!11189 (v!14297 V!36105)) (EmptyCell!11189) )
))
(declare-datatypes ((array!62651 0))(
  ( (array!62652 (arr!30172 (Array (_ BitVec 32) ValueCell!11189)) (size!30651 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62651)

(declare-fun mapDefault!37077 () ValueCell!11189)

