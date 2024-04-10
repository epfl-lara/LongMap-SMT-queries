; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84816 () Bool)

(assert start!84816)

(declare-fun mapNonEmpty!37059 () Bool)

(declare-fun mapRes!37059 () Bool)

(declare-fun tp!70130 () Bool)

(declare-fun e!559201 () Bool)

(assert (=> mapNonEmpty!37059 (= mapRes!37059 (and tp!70130 e!559201))))

(declare-datatypes ((V!36093 0))(
  ( (V!36094 (val!11717 Int)) )
))
(declare-datatypes ((ValueCell!11185 0))(
  ( (ValueCellFull!11185 (v!14293 V!36093)) (EmptyCell!11185) )
))
(declare-fun mapRest!37059 () (Array (_ BitVec 32) ValueCell!11185))

(declare-datatypes ((array!62629 0))(
  ( (array!62630 (arr!30163 (Array (_ BitVec 32) ValueCell!11185)) (size!30642 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62629)

(declare-fun mapValue!37059 () ValueCell!11185)

(declare-fun mapKey!37059 () (_ BitVec 32))

(assert (=> mapNonEmpty!37059 (= (arr!30163 _values!1551) (store mapRest!37059 mapKey!37059 mapValue!37059))))

(declare-fun mapIsEmpty!37059 () Bool)

(assert (=> mapIsEmpty!37059 mapRes!37059))

(declare-fun b!991529 () Bool)

(declare-fun res!662786 () Bool)

(declare-fun e!559203 () Bool)

(assert (=> b!991529 (=> (not res!662786) (not e!559203))))

(declare-datatypes ((array!62631 0))(
  ( (array!62632 (arr!30164 (Array (_ BitVec 32) (_ BitVec 64))) (size!30643 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62631)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62631 (_ BitVec 32)) Bool)

(assert (=> b!991529 (= res!662786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991530 () Bool)

(assert (=> b!991530 (= e!559203 (bvsgt #b00000000000000000000000000000000 (size!30643 _keys!1945)))))

(declare-fun b!991531 () Bool)

(declare-fun e!559204 () Bool)

(declare-fun tp_is_empty!23333 () Bool)

(assert (=> b!991531 (= e!559204 tp_is_empty!23333)))

(declare-fun res!662787 () Bool)

(assert (=> start!84816 (=> (not res!662787) (not e!559203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84816 (= res!662787 (validMask!0 mask!2471))))

(assert (=> start!84816 e!559203))

(assert (=> start!84816 true))

(declare-fun e!559200 () Bool)

(declare-fun array_inv!23295 (array!62629) Bool)

(assert (=> start!84816 (and (array_inv!23295 _values!1551) e!559200)))

(declare-fun array_inv!23296 (array!62631) Bool)

(assert (=> start!84816 (array_inv!23296 _keys!1945)))

(declare-fun b!991532 () Bool)

(declare-fun res!662788 () Bool)

(assert (=> b!991532 (=> (not res!662788) (not e!559203))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991532 (= res!662788 (and (= (size!30642 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30643 _keys!1945) (size!30642 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991533 () Bool)

(assert (=> b!991533 (= e!559200 (and e!559204 mapRes!37059))))

(declare-fun condMapEmpty!37059 () Bool)

(declare-fun mapDefault!37059 () ValueCell!11185)

