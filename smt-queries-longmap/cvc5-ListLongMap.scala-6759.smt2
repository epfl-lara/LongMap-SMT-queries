; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84812 () Bool)

(assert start!84812)

(declare-fun res!662768 () Bool)

(declare-fun e!559172 () Bool)

(assert (=> start!84812 (=> (not res!662768) (not e!559172))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84812 (= res!662768 (validMask!0 mask!2471))))

(assert (=> start!84812 e!559172))

(assert (=> start!84812 true))

(declare-datatypes ((V!36089 0))(
  ( (V!36090 (val!11715 Int)) )
))
(declare-datatypes ((ValueCell!11183 0))(
  ( (ValueCellFull!11183 (v!14291 V!36089)) (EmptyCell!11183) )
))
(declare-datatypes ((array!62621 0))(
  ( (array!62622 (arr!30159 (Array (_ BitVec 32) ValueCell!11183)) (size!30638 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62621)

(declare-fun e!559173 () Bool)

(declare-fun array_inv!23291 (array!62621) Bool)

(assert (=> start!84812 (and (array_inv!23291 _values!1551) e!559173)))

(declare-datatypes ((array!62623 0))(
  ( (array!62624 (arr!30160 (Array (_ BitVec 32) (_ BitVec 64))) (size!30639 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62623)

(declare-fun array_inv!23292 (array!62623) Bool)

(assert (=> start!84812 (array_inv!23292 _keys!1945)))

(declare-fun b!991493 () Bool)

(declare-fun e!559170 () Bool)

(declare-fun tp_is_empty!23329 () Bool)

(assert (=> b!991493 (= e!559170 tp_is_empty!23329)))

(declare-fun b!991494 () Bool)

(declare-fun res!662769 () Bool)

(assert (=> b!991494 (=> (not res!662769) (not e!559172))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991494 (= res!662769 (and (= (size!30638 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30639 _keys!1945) (size!30638 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991495 () Bool)

(assert (=> b!991495 (= e!559172 (bvsgt #b00000000000000000000000000000000 (size!30639 _keys!1945)))))

(declare-fun b!991496 () Bool)

(declare-fun mapRes!37053 () Bool)

(assert (=> b!991496 (= e!559173 (and e!559170 mapRes!37053))))

(declare-fun condMapEmpty!37053 () Bool)

(declare-fun mapDefault!37053 () ValueCell!11183)

