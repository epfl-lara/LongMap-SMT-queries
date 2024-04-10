; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72292 () Bool)

(assert start!72292)

(declare-fun b!837587 () Bool)

(declare-fun res!569633 () Bool)

(declare-fun e!467486 () Bool)

(assert (=> b!837587 (=> (not res!569633) (not e!467486))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!46984 0))(
  ( (array!46985 (arr!22523 (Array (_ BitVec 32) (_ BitVec 64))) (size!22963 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46984)

(declare-datatypes ((V!25505 0))(
  ( (V!25506 (val!7719 Int)) )
))
(declare-datatypes ((ValueCell!7232 0))(
  ( (ValueCellFull!7232 (v!10144 V!25505)) (EmptyCell!7232) )
))
(declare-datatypes ((array!46986 0))(
  ( (array!46987 (arr!22524 (Array (_ BitVec 32) ValueCell!7232)) (size!22964 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46986)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837587 (= res!569633 (and (= (size!22964 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22963 _keys!868) (size!22964 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837588 () Bool)

(declare-fun e!467485 () Bool)

(declare-fun tp_is_empty!15343 () Bool)

(assert (=> b!837588 (= e!467485 tp_is_empty!15343)))

(declare-fun mapNonEmpty!24614 () Bool)

(declare-fun mapRes!24614 () Bool)

(declare-fun tp!47608 () Bool)

(assert (=> mapNonEmpty!24614 (= mapRes!24614 (and tp!47608 e!467485))))

(declare-fun mapKey!24614 () (_ BitVec 32))

(declare-fun mapValue!24614 () ValueCell!7232)

(declare-fun mapRest!24614 () (Array (_ BitVec 32) ValueCell!7232))

(assert (=> mapNonEmpty!24614 (= (arr!22524 _values!688) (store mapRest!24614 mapKey!24614 mapValue!24614))))

(declare-fun b!837589 () Bool)

(assert (=> b!837589 (= e!467486 false)))

(declare-fun lt!380581 () Bool)

(declare-datatypes ((List!16031 0))(
  ( (Nil!16028) (Cons!16027 (h!17158 (_ BitVec 64)) (t!22402 List!16031)) )
))
(declare-fun arrayNoDuplicates!0 (array!46984 (_ BitVec 32) List!16031) Bool)

(assert (=> b!837589 (= lt!380581 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16028))))

(declare-fun res!569631 () Bool)

(assert (=> start!72292 (=> (not res!569631) (not e!467486))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72292 (= res!569631 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22963 _keys!868))))))

(assert (=> start!72292 e!467486))

(assert (=> start!72292 true))

(declare-fun array_inv!17950 (array!46984) Bool)

(assert (=> start!72292 (array_inv!17950 _keys!868)))

(declare-fun e!467487 () Bool)

(declare-fun array_inv!17951 (array!46986) Bool)

(assert (=> start!72292 (and (array_inv!17951 _values!688) e!467487)))

(declare-fun b!837590 () Bool)

(declare-fun res!569630 () Bool)

(assert (=> b!837590 (=> (not res!569630) (not e!467486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46984 (_ BitVec 32)) Bool)

(assert (=> b!837590 (= res!569630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837591 () Bool)

(declare-fun res!569632 () Bool)

(assert (=> b!837591 (=> (not res!569632) (not e!467486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837591 (= res!569632 (validMask!0 mask!1196))))

(declare-fun b!837592 () Bool)

(declare-fun e!467488 () Bool)

(assert (=> b!837592 (= e!467488 tp_is_empty!15343)))

(declare-fun b!837593 () Bool)

(assert (=> b!837593 (= e!467487 (and e!467488 mapRes!24614))))

(declare-fun condMapEmpty!24614 () Bool)

(declare-fun mapDefault!24614 () ValueCell!7232)

