; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72730 () Bool)

(assert start!72730)

(declare-fun b!844130 () Bool)

(declare-fun e!471095 () Bool)

(assert (=> b!844130 (= e!471095 false)))

(declare-fun lt!381238 () Bool)

(declare-datatypes ((array!47800 0))(
  ( (array!47801 (arr!22931 (Array (_ BitVec 32) (_ BitVec 64))) (size!23371 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47800)

(declare-datatypes ((List!16261 0))(
  ( (Nil!16258) (Cons!16257 (h!17388 (_ BitVec 64)) (t!22632 List!16261)) )
))
(declare-fun arrayNoDuplicates!0 (array!47800 (_ BitVec 32) List!16261) Bool)

(assert (=> b!844130 (= lt!381238 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16258))))

(declare-fun mapIsEmpty!25271 () Bool)

(declare-fun mapRes!25271 () Bool)

(assert (=> mapIsEmpty!25271 mapRes!25271))

(declare-fun b!844131 () Bool)

(declare-fun e!471096 () Bool)

(declare-fun tp_is_empty!15781 () Bool)

(assert (=> b!844131 (= e!471096 tp_is_empty!15781)))

(declare-fun b!844132 () Bool)

(declare-fun e!471093 () Bool)

(assert (=> b!844132 (= e!471093 tp_is_empty!15781)))

(declare-fun b!844133 () Bool)

(declare-fun res!573557 () Bool)

(assert (=> b!844133 (=> (not res!573557) (not e!471095))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47800 (_ BitVec 32)) Bool)

(assert (=> b!844133 (= res!573557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25271 () Bool)

(declare-fun tp!48589 () Bool)

(assert (=> mapNonEmpty!25271 (= mapRes!25271 (and tp!48589 e!471093))))

(declare-datatypes ((V!26089 0))(
  ( (V!26090 (val!7938 Int)) )
))
(declare-datatypes ((ValueCell!7451 0))(
  ( (ValueCellFull!7451 (v!10363 V!26089)) (EmptyCell!7451) )
))
(declare-fun mapValue!25271 () ValueCell!7451)

(declare-fun mapKey!25271 () (_ BitVec 32))

(declare-fun mapRest!25271 () (Array (_ BitVec 32) ValueCell!7451))

(declare-datatypes ((array!47802 0))(
  ( (array!47803 (arr!22932 (Array (_ BitVec 32) ValueCell!7451)) (size!23372 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47802)

(assert (=> mapNonEmpty!25271 (= (arr!22932 _values!688) (store mapRest!25271 mapKey!25271 mapValue!25271))))

(declare-fun b!844134 () Bool)

(declare-fun res!573556 () Bool)

(assert (=> b!844134 (=> (not res!573556) (not e!471095))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844134 (= res!573556 (and (= (size!23372 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23371 _keys!868) (size!23372 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!573554 () Bool)

(assert (=> start!72730 (=> (not res!573554) (not e!471095))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72730 (= res!573554 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23371 _keys!868))))))

(assert (=> start!72730 e!471095))

(assert (=> start!72730 true))

(declare-fun array_inv!18236 (array!47800) Bool)

(assert (=> start!72730 (array_inv!18236 _keys!868)))

(declare-fun e!471097 () Bool)

(declare-fun array_inv!18237 (array!47802) Bool)

(assert (=> start!72730 (and (array_inv!18237 _values!688) e!471097)))

(declare-fun b!844135 () Bool)

(declare-fun res!573555 () Bool)

(assert (=> b!844135 (=> (not res!573555) (not e!471095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844135 (= res!573555 (validMask!0 mask!1196))))

(declare-fun b!844136 () Bool)

(assert (=> b!844136 (= e!471097 (and e!471096 mapRes!25271))))

(declare-fun condMapEmpty!25271 () Bool)

(declare-fun mapDefault!25271 () ValueCell!7451)

