; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72770 () Bool)

(assert start!72770)

(declare-fun b!844550 () Bool)

(declare-fun res!573797 () Bool)

(declare-fun e!471397 () Bool)

(assert (=> b!844550 (=> (not res!573797) (not e!471397))))

(declare-datatypes ((array!47872 0))(
  ( (array!47873 (arr!22967 (Array (_ BitVec 32) (_ BitVec 64))) (size!23407 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47872)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47872 (_ BitVec 32)) Bool)

(assert (=> b!844550 (= res!573797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844551 () Bool)

(assert (=> b!844551 (= e!471397 false)))

(declare-fun lt!381298 () Bool)

(declare-datatypes ((List!16276 0))(
  ( (Nil!16273) (Cons!16272 (h!17403 (_ BitVec 64)) (t!22647 List!16276)) )
))
(declare-fun arrayNoDuplicates!0 (array!47872 (_ BitVec 32) List!16276) Bool)

(assert (=> b!844551 (= lt!381298 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16273))))

(declare-fun mapNonEmpty!25331 () Bool)

(declare-fun mapRes!25331 () Bool)

(declare-fun tp!48649 () Bool)

(declare-fun e!471393 () Bool)

(assert (=> mapNonEmpty!25331 (= mapRes!25331 (and tp!48649 e!471393))))

(declare-datatypes ((V!26141 0))(
  ( (V!26142 (val!7958 Int)) )
))
(declare-datatypes ((ValueCell!7471 0))(
  ( (ValueCellFull!7471 (v!10383 V!26141)) (EmptyCell!7471) )
))
(declare-fun mapValue!25331 () ValueCell!7471)

(declare-fun mapKey!25331 () (_ BitVec 32))

(declare-fun mapRest!25331 () (Array (_ BitVec 32) ValueCell!7471))

(declare-datatypes ((array!47874 0))(
  ( (array!47875 (arr!22968 (Array (_ BitVec 32) ValueCell!7471)) (size!23408 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47874)

(assert (=> mapNonEmpty!25331 (= (arr!22968 _values!688) (store mapRest!25331 mapKey!25331 mapValue!25331))))

(declare-fun b!844552 () Bool)

(declare-fun e!471394 () Bool)

(declare-fun tp_is_empty!15821 () Bool)

(assert (=> b!844552 (= e!471394 tp_is_empty!15821)))

(declare-fun b!844553 () Bool)

(declare-fun e!471396 () Bool)

(assert (=> b!844553 (= e!471396 (and e!471394 mapRes!25331))))

(declare-fun condMapEmpty!25331 () Bool)

(declare-fun mapDefault!25331 () ValueCell!7471)

