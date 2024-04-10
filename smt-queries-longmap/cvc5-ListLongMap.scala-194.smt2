; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3784 () Bool)

(assert start!3784)

(declare-fun b!26450 () Bool)

(declare-fun e!17230 () Bool)

(assert (=> b!26450 (= e!17230 false)))

(declare-fun lt!10367 () Bool)

(declare-datatypes ((array!1453 0))(
  ( (array!1454 (arr!684 (Array (_ BitVec 32) (_ BitVec 64))) (size!785 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1453)

(declare-datatypes ((List!590 0))(
  ( (Nil!587) (Cons!586 (h!1153 (_ BitVec 64)) (t!3277 List!590)) )
))
(declare-fun arrayNoDuplicates!0 (array!1453 (_ BitVec 32) List!590) Bool)

(assert (=> b!26450 (= lt!10367 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!587))))

(declare-fun b!26451 () Bool)

(declare-fun res!15702 () Bool)

(assert (=> b!26451 (=> (not res!15702) (not e!17230))))

(declare-datatypes ((V!1299 0))(
  ( (V!1300 (val!579 Int)) )
))
(declare-datatypes ((ValueCell!353 0))(
  ( (ValueCellFull!353 (v!1665 V!1299)) (EmptyCell!353) )
))
(declare-datatypes ((array!1455 0))(
  ( (array!1456 (arr!685 (Array (_ BitVec 32) ValueCell!353)) (size!786 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1455)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26451 (= res!15702 (and (= (size!786 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!785 _keys!1833) (size!786 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26452 () Bool)

(declare-fun res!15700 () Bool)

(assert (=> b!26452 (=> (not res!15700) (not e!17230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1453 (_ BitVec 32)) Bool)

(assert (=> b!26452 (= res!15700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1174 () Bool)

(declare-fun mapRes!1174 () Bool)

(assert (=> mapIsEmpty!1174 mapRes!1174))

(declare-fun b!26453 () Bool)

(declare-fun e!17233 () Bool)

(declare-fun tp_is_empty!1105 () Bool)

(assert (=> b!26453 (= e!17233 tp_is_empty!1105)))

(declare-fun b!26454 () Bool)

(declare-fun e!17234 () Bool)

(assert (=> b!26454 (= e!17234 tp_is_empty!1105)))

(declare-fun res!15701 () Bool)

(assert (=> start!3784 (=> (not res!15701) (not e!17230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3784 (= res!15701 (validMask!0 mask!2294))))

(assert (=> start!3784 e!17230))

(assert (=> start!3784 true))

(declare-fun e!17231 () Bool)

(declare-fun array_inv!467 (array!1455) Bool)

(assert (=> start!3784 (and (array_inv!467 _values!1501) e!17231)))

(declare-fun array_inv!468 (array!1453) Bool)

(assert (=> start!3784 (array_inv!468 _keys!1833)))

(declare-fun mapNonEmpty!1174 () Bool)

(declare-fun tp!3694 () Bool)

(assert (=> mapNonEmpty!1174 (= mapRes!1174 (and tp!3694 e!17234))))

(declare-fun mapValue!1174 () ValueCell!353)

(declare-fun mapRest!1174 () (Array (_ BitVec 32) ValueCell!353))

(declare-fun mapKey!1174 () (_ BitVec 32))

(assert (=> mapNonEmpty!1174 (= (arr!685 _values!1501) (store mapRest!1174 mapKey!1174 mapValue!1174))))

(declare-fun b!26455 () Bool)

(assert (=> b!26455 (= e!17231 (and e!17233 mapRes!1174))))

(declare-fun condMapEmpty!1174 () Bool)

(declare-fun mapDefault!1174 () ValueCell!353)

