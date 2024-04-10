; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84804 () Bool)

(assert start!84804)

(declare-fun b!991469 () Bool)

(declare-fun e!559149 () Bool)

(declare-fun tp_is_empty!23327 () Bool)

(assert (=> b!991469 (= e!559149 tp_is_empty!23327)))

(declare-fun res!662761 () Bool)

(declare-fun e!559150 () Bool)

(assert (=> start!84804 (=> (not res!662761) (not e!559150))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84804 (= res!662761 (validMask!0 mask!2471))))

(assert (=> start!84804 e!559150))

(assert (=> start!84804 true))

(declare-datatypes ((V!36085 0))(
  ( (V!36086 (val!11714 Int)) )
))
(declare-datatypes ((ValueCell!11182 0))(
  ( (ValueCellFull!11182 (v!14290 V!36085)) (EmptyCell!11182) )
))
(declare-datatypes ((array!62615 0))(
  ( (array!62616 (arr!30157 (Array (_ BitVec 32) ValueCell!11182)) (size!30636 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62615)

(declare-fun e!559151 () Bool)

(declare-fun array_inv!23289 (array!62615) Bool)

(assert (=> start!84804 (and (array_inv!23289 _values!1551) e!559151)))

(declare-datatypes ((array!62617 0))(
  ( (array!62618 (arr!30158 (Array (_ BitVec 32) (_ BitVec 64))) (size!30637 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62617)

(declare-fun array_inv!23290 (array!62617) Bool)

(assert (=> start!84804 (array_inv!23290 _keys!1945)))

(declare-fun b!991470 () Bool)

(declare-fun mapRes!37047 () Bool)

(assert (=> b!991470 (= e!559151 (and e!559149 mapRes!37047))))

(declare-fun condMapEmpty!37047 () Bool)

(declare-fun mapDefault!37047 () ValueCell!11182)

