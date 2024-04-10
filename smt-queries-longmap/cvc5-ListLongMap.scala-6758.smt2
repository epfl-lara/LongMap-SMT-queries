; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84800 () Bool)

(assert start!84800)

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun e!559121 () Bool)

(declare-datatypes ((V!36081 0))(
  ( (V!36082 (val!11712 Int)) )
))
(declare-datatypes ((ValueCell!11180 0))(
  ( (ValueCellFull!11180 (v!14288 V!36081)) (EmptyCell!11180) )
))
(declare-datatypes ((array!62607 0))(
  ( (array!62608 (arr!30153 (Array (_ BitVec 32) ValueCell!11180)) (size!30632 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62607)

(declare-fun b!991445 () Bool)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62609 0))(
  ( (array!62610 (arr!30154 (Array (_ BitVec 32) (_ BitVec 64))) (size!30633 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62609)

(assert (=> b!991445 (= e!559121 (and (= (size!30632 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30633 _keys!1945) (size!30632 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011) (= (size!30633 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471)) (bvsgt #b00000000000000000000000000000000 (size!30633 _keys!1945))))))

(declare-fun mapIsEmpty!37041 () Bool)

(declare-fun mapRes!37041 () Bool)

(assert (=> mapIsEmpty!37041 mapRes!37041))

(declare-fun b!991446 () Bool)

(declare-fun e!559122 () Bool)

(declare-fun tp_is_empty!23323 () Bool)

(assert (=> b!991446 (= e!559122 tp_is_empty!23323)))

(declare-fun res!662755 () Bool)

(assert (=> start!84800 (=> (not res!662755) (not e!559121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84800 (= res!662755 (validMask!0 mask!2471))))

(assert (=> start!84800 e!559121))

(assert (=> start!84800 true))

(declare-fun e!559120 () Bool)

(declare-fun array_inv!23285 (array!62607) Bool)

(assert (=> start!84800 (and (array_inv!23285 _values!1551) e!559120)))

(declare-fun array_inv!23286 (array!62609) Bool)

(assert (=> start!84800 (array_inv!23286 _keys!1945)))

(declare-fun b!991447 () Bool)

(declare-fun e!559123 () Bool)

(assert (=> b!991447 (= e!559120 (and e!559123 mapRes!37041))))

(declare-fun condMapEmpty!37041 () Bool)

(declare-fun mapDefault!37041 () ValueCell!11180)

