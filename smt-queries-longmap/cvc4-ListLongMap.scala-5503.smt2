; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72806 () Bool)

(assert start!72806)

(declare-fun b!844928 () Bool)

(declare-fun e!471663 () Bool)

(declare-fun tp_is_empty!15857 () Bool)

(assert (=> b!844928 (= e!471663 tp_is_empty!15857)))

(declare-fun b!844929 () Bool)

(declare-fun res!574013 () Bool)

(declare-fun e!471665 () Bool)

(assert (=> b!844929 (=> (not res!574013) (not e!471665))))

(declare-datatypes ((array!47940 0))(
  ( (array!47941 (arr!23001 (Array (_ BitVec 32) (_ BitVec 64))) (size!23441 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47940)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47940 (_ BitVec 32)) Bool)

(assert (=> b!844929 (= res!574013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844930 () Bool)

(declare-fun res!574010 () Bool)

(assert (=> b!844930 (=> (not res!574010) (not e!471665))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26189 0))(
  ( (V!26190 (val!7976 Int)) )
))
(declare-datatypes ((ValueCell!7489 0))(
  ( (ValueCellFull!7489 (v!10401 V!26189)) (EmptyCell!7489) )
))
(declare-datatypes ((array!47942 0))(
  ( (array!47943 (arr!23002 (Array (_ BitVec 32) ValueCell!7489)) (size!23442 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47942)

(assert (=> b!844930 (= res!574010 (and (= (size!23442 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23441 _keys!868) (size!23442 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25385 () Bool)

(declare-fun mapRes!25385 () Bool)

(assert (=> mapIsEmpty!25385 mapRes!25385))

(declare-fun b!844931 () Bool)

(assert (=> b!844931 (= e!471665 false)))

(declare-fun lt!381352 () Bool)

(declare-datatypes ((List!16289 0))(
  ( (Nil!16286) (Cons!16285 (h!17416 (_ BitVec 64)) (t!22660 List!16289)) )
))
(declare-fun arrayNoDuplicates!0 (array!47940 (_ BitVec 32) List!16289) Bool)

(assert (=> b!844931 (= lt!381352 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16286))))

(declare-fun b!844932 () Bool)

(declare-fun e!471666 () Bool)

(assert (=> b!844932 (= e!471666 tp_is_empty!15857)))

(declare-fun b!844933 () Bool)

(declare-fun e!471667 () Bool)

(assert (=> b!844933 (= e!471667 (and e!471663 mapRes!25385))))

(declare-fun condMapEmpty!25385 () Bool)

(declare-fun mapDefault!25385 () ValueCell!7489)

