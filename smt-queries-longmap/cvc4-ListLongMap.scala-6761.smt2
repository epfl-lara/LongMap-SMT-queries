; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84844 () Bool)

(assert start!84844)

(declare-fun res!662863 () Bool)

(declare-fun e!559320 () Bool)

(assert (=> start!84844 (=> (not res!662863) (not e!559320))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84844 (= res!662863 (validMask!0 mask!2471))))

(assert (=> start!84844 e!559320))

(assert (=> start!84844 true))

(declare-datatypes ((V!36109 0))(
  ( (V!36110 (val!11723 Int)) )
))
(declare-datatypes ((ValueCell!11191 0))(
  ( (ValueCellFull!11191 (v!14299 V!36109)) (EmptyCell!11191) )
))
(declare-datatypes ((array!62657 0))(
  ( (array!62658 (arr!30175 (Array (_ BitVec 32) ValueCell!11191)) (size!30654 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62657)

(declare-fun e!559322 () Bool)

(declare-fun array_inv!23305 (array!62657) Bool)

(assert (=> start!84844 (and (array_inv!23305 _values!1551) e!559322)))

(declare-datatypes ((array!62659 0))(
  ( (array!62660 (arr!30176 (Array (_ BitVec 32) (_ BitVec 64))) (size!30655 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62659)

(declare-fun array_inv!23306 (array!62659) Bool)

(assert (=> start!84844 (array_inv!23306 _keys!1945)))

(declare-fun b!991685 () Bool)

(declare-fun e!559321 () Bool)

(declare-fun tp_is_empty!23345 () Bool)

(assert (=> b!991685 (= e!559321 tp_is_empty!23345)))

(declare-fun mapIsEmpty!37083 () Bool)

(declare-fun mapRes!37083 () Bool)

(assert (=> mapIsEmpty!37083 mapRes!37083))

(declare-fun b!991686 () Bool)

(declare-fun e!559324 () Bool)

(assert (=> b!991686 (= e!559324 tp_is_empty!23345)))

(declare-fun b!991687 () Bool)

(assert (=> b!991687 (= e!559322 (and e!559321 mapRes!37083))))

(declare-fun condMapEmpty!37083 () Bool)

(declare-fun mapDefault!37083 () ValueCell!11191)

