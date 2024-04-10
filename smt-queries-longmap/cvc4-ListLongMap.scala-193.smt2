; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3782 () Bool)

(assert start!3782)

(declare-fun b!26432 () Bool)

(declare-fun e!17218 () Bool)

(assert (=> b!26432 (= e!17218 false)))

(declare-fun lt!10364 () Bool)

(declare-datatypes ((array!1449 0))(
  ( (array!1450 (arr!682 (Array (_ BitVec 32) (_ BitVec 64))) (size!783 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1449)

(declare-datatypes ((List!589 0))(
  ( (Nil!586) (Cons!585 (h!1152 (_ BitVec 64)) (t!3276 List!589)) )
))
(declare-fun arrayNoDuplicates!0 (array!1449 (_ BitVec 32) List!589) Bool)

(assert (=> b!26432 (= lt!10364 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!586))))

(declare-fun b!26433 () Bool)

(declare-fun res!15691 () Bool)

(assert (=> b!26433 (=> (not res!15691) (not e!17218))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1449 (_ BitVec 32)) Bool)

(assert (=> b!26433 (= res!15691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26434 () Bool)

(declare-fun res!15692 () Bool)

(assert (=> b!26434 (=> (not res!15692) (not e!17218))))

(declare-datatypes ((V!1295 0))(
  ( (V!1296 (val!578 Int)) )
))
(declare-datatypes ((ValueCell!352 0))(
  ( (ValueCellFull!352 (v!1664 V!1295)) (EmptyCell!352) )
))
(declare-datatypes ((array!1451 0))(
  ( (array!1452 (arr!683 (Array (_ BitVec 32) ValueCell!352)) (size!784 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1451)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26434 (= res!15692 (and (= (size!784 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!783 _keys!1833) (size!784 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!15693 () Bool)

(assert (=> start!3782 (=> (not res!15693) (not e!17218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3782 (= res!15693 (validMask!0 mask!2294))))

(assert (=> start!3782 e!17218))

(assert (=> start!3782 true))

(declare-fun e!17217 () Bool)

(declare-fun array_inv!465 (array!1451) Bool)

(assert (=> start!3782 (and (array_inv!465 _values!1501) e!17217)))

(declare-fun array_inv!466 (array!1449) Bool)

(assert (=> start!3782 (array_inv!466 _keys!1833)))

(declare-fun mapNonEmpty!1171 () Bool)

(declare-fun mapRes!1171 () Bool)

(declare-fun tp!3691 () Bool)

(declare-fun e!17216 () Bool)

(assert (=> mapNonEmpty!1171 (= mapRes!1171 (and tp!3691 e!17216))))

(declare-fun mapValue!1171 () ValueCell!352)

(declare-fun mapRest!1171 () (Array (_ BitVec 32) ValueCell!352))

(declare-fun mapKey!1171 () (_ BitVec 32))

(assert (=> mapNonEmpty!1171 (= (arr!683 _values!1501) (store mapRest!1171 mapKey!1171 mapValue!1171))))

(declare-fun mapIsEmpty!1171 () Bool)

(assert (=> mapIsEmpty!1171 mapRes!1171))

(declare-fun b!26435 () Bool)

(declare-fun tp_is_empty!1103 () Bool)

(assert (=> b!26435 (= e!17216 tp_is_empty!1103)))

(declare-fun b!26436 () Bool)

(declare-fun e!17215 () Bool)

(assert (=> b!26436 (= e!17217 (and e!17215 mapRes!1171))))

(declare-fun condMapEmpty!1171 () Bool)

(declare-fun mapDefault!1171 () ValueCell!352)

