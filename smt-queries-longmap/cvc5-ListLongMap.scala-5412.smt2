; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72226 () Bool)

(assert start!72226)

(declare-fun b!837093 () Bool)

(declare-fun res!569343 () Bool)

(declare-fun e!467142 () Bool)

(assert (=> b!837093 (=> (not res!569343) (not e!467142))))

(declare-datatypes ((array!46912 0))(
  ( (array!46913 (arr!22490 (Array (_ BitVec 32) (_ BitVec 64))) (size!22930 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46912)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46912 (_ BitVec 32)) Bool)

(assert (=> b!837093 (= res!569343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24551 () Bool)

(declare-fun mapRes!24551 () Bool)

(assert (=> mapIsEmpty!24551 mapRes!24551))

(declare-fun mapNonEmpty!24551 () Bool)

(declare-fun tp!47545 () Bool)

(declare-fun e!467140 () Bool)

(assert (=> mapNonEmpty!24551 (= mapRes!24551 (and tp!47545 e!467140))))

(declare-datatypes ((V!25457 0))(
  ( (V!25458 (val!7701 Int)) )
))
(declare-datatypes ((ValueCell!7214 0))(
  ( (ValueCellFull!7214 (v!10125 V!25457)) (EmptyCell!7214) )
))
(declare-fun mapValue!24551 () ValueCell!7214)

(declare-fun mapKey!24551 () (_ BitVec 32))

(declare-fun mapRest!24551 () (Array (_ BitVec 32) ValueCell!7214))

(declare-datatypes ((array!46914 0))(
  ( (array!46915 (arr!22491 (Array (_ BitVec 32) ValueCell!7214)) (size!22931 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46914)

(assert (=> mapNonEmpty!24551 (= (arr!22491 _values!688) (store mapRest!24551 mapKey!24551 mapValue!24551))))

(declare-fun b!837094 () Bool)

(declare-fun res!569340 () Bool)

(assert (=> b!837094 (=> (not res!569340) (not e!467142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837094 (= res!569340 (validMask!0 mask!1196))))

(declare-fun b!837095 () Bool)

(declare-fun e!467141 () Bool)

(declare-fun e!467143 () Bool)

(assert (=> b!837095 (= e!467141 (and e!467143 mapRes!24551))))

(declare-fun condMapEmpty!24551 () Bool)

(declare-fun mapDefault!24551 () ValueCell!7214)

