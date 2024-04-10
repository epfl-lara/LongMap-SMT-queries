; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72286 () Bool)

(assert start!72286)

(declare-fun b!837524 () Bool)

(declare-fun e!467440 () Bool)

(declare-fun tp_is_empty!15337 () Bool)

(assert (=> b!837524 (= e!467440 tp_is_empty!15337)))

(declare-fun b!837526 () Bool)

(declare-fun e!467443 () Bool)

(assert (=> b!837526 (= e!467443 tp_is_empty!15337)))

(declare-fun b!837527 () Bool)

(declare-fun e!467442 () Bool)

(assert (=> b!837527 (= e!467442 false)))

(declare-fun lt!380572 () Bool)

(declare-datatypes ((array!46972 0))(
  ( (array!46973 (arr!22517 (Array (_ BitVec 32) (_ BitVec 64))) (size!22957 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46972)

(declare-datatypes ((List!16029 0))(
  ( (Nil!16026) (Cons!16025 (h!17156 (_ BitVec 64)) (t!22400 List!16029)) )
))
(declare-fun arrayNoDuplicates!0 (array!46972 (_ BitVec 32) List!16029) Bool)

(assert (=> b!837527 (= lt!380572 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16026))))

(declare-fun b!837528 () Bool)

(declare-fun res!569597 () Bool)

(assert (=> b!837528 (=> (not res!569597) (not e!467442))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46972 (_ BitVec 32)) Bool)

(assert (=> b!837528 (= res!569597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837529 () Bool)

(declare-fun e!467441 () Bool)

(declare-fun mapRes!24605 () Bool)

(assert (=> b!837529 (= e!467441 (and e!467440 mapRes!24605))))

(declare-fun condMapEmpty!24605 () Bool)

(declare-datatypes ((V!25497 0))(
  ( (V!25498 (val!7716 Int)) )
))
(declare-datatypes ((ValueCell!7229 0))(
  ( (ValueCellFull!7229 (v!10141 V!25497)) (EmptyCell!7229) )
))
(declare-datatypes ((array!46974 0))(
  ( (array!46975 (arr!22518 (Array (_ BitVec 32) ValueCell!7229)) (size!22958 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46974)

(declare-fun mapDefault!24605 () ValueCell!7229)

