; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72344 () Bool)

(assert start!72344)

(declare-fun b!838133 () Bool)

(declare-fun e!467876 () Bool)

(assert (=> b!838133 (= e!467876 false)))

(declare-fun lt!380659 () Bool)

(declare-datatypes ((array!47080 0))(
  ( (array!47081 (arr!22571 (Array (_ BitVec 32) (_ BitVec 64))) (size!23011 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47080)

(declare-datatypes ((List!16048 0))(
  ( (Nil!16045) (Cons!16044 (h!17175 (_ BitVec 64)) (t!22419 List!16048)) )
))
(declare-fun arrayNoDuplicates!0 (array!47080 (_ BitVec 32) List!16048) Bool)

(assert (=> b!838133 (= lt!380659 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16045))))

(declare-fun res!569944 () Bool)

(assert (=> start!72344 (=> (not res!569944) (not e!467876))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72344 (= res!569944 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23011 _keys!868))))))

(assert (=> start!72344 e!467876))

(assert (=> start!72344 true))

(declare-fun array_inv!17986 (array!47080) Bool)

(assert (=> start!72344 (array_inv!17986 _keys!868)))

(declare-datatypes ((V!25573 0))(
  ( (V!25574 (val!7745 Int)) )
))
(declare-datatypes ((ValueCell!7258 0))(
  ( (ValueCellFull!7258 (v!10170 V!25573)) (EmptyCell!7258) )
))
(declare-datatypes ((array!47082 0))(
  ( (array!47083 (arr!22572 (Array (_ BitVec 32) ValueCell!7258)) (size!23012 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47082)

(declare-fun e!467874 () Bool)

(declare-fun array_inv!17987 (array!47082) Bool)

(assert (=> start!72344 (and (array_inv!17987 _values!688) e!467874)))

(declare-fun b!838134 () Bool)

(declare-fun res!569943 () Bool)

(assert (=> b!838134 (=> (not res!569943) (not e!467876))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!838134 (= res!569943 (and (= (size!23012 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23011 _keys!868) (size!23012 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838135 () Bool)

(declare-fun e!467878 () Bool)

(declare-fun tp_is_empty!15395 () Bool)

(assert (=> b!838135 (= e!467878 tp_is_empty!15395)))

(declare-fun mapNonEmpty!24692 () Bool)

(declare-fun mapRes!24692 () Bool)

(declare-fun tp!47686 () Bool)

(declare-fun e!467877 () Bool)

(assert (=> mapNonEmpty!24692 (= mapRes!24692 (and tp!47686 e!467877))))

(declare-fun mapRest!24692 () (Array (_ BitVec 32) ValueCell!7258))

(declare-fun mapValue!24692 () ValueCell!7258)

(declare-fun mapKey!24692 () (_ BitVec 32))

(assert (=> mapNonEmpty!24692 (= (arr!22572 _values!688) (store mapRest!24692 mapKey!24692 mapValue!24692))))

(declare-fun b!838136 () Bool)

(assert (=> b!838136 (= e!467874 (and e!467878 mapRes!24692))))

(declare-fun condMapEmpty!24692 () Bool)

(declare-fun mapDefault!24692 () ValueCell!7258)

