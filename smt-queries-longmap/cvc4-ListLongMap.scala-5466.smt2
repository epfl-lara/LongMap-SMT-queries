; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72584 () Bool)

(assert start!72584)

(declare-fun mapIsEmpty!25052 () Bool)

(declare-fun mapRes!25052 () Bool)

(assert (=> mapIsEmpty!25052 mapRes!25052))

(declare-fun b!842597 () Bool)

(declare-fun res!572678 () Bool)

(declare-fun e!470001 () Bool)

(assert (=> b!842597 (=> (not res!572678) (not e!470001))))

(declare-datatypes ((array!47540 0))(
  ( (array!47541 (arr!22801 (Array (_ BitVec 32) (_ BitVec 64))) (size!23241 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47540)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47540 (_ BitVec 32)) Bool)

(assert (=> b!842597 (= res!572678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842598 () Bool)

(declare-fun res!572679 () Bool)

(assert (=> b!842598 (=> (not res!572679) (not e!470001))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25893 0))(
  ( (V!25894 (val!7865 Int)) )
))
(declare-datatypes ((ValueCell!7378 0))(
  ( (ValueCellFull!7378 (v!10290 V!25893)) (EmptyCell!7378) )
))
(declare-datatypes ((array!47542 0))(
  ( (array!47543 (arr!22802 (Array (_ BitVec 32) ValueCell!7378)) (size!23242 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47542)

(assert (=> b!842598 (= res!572679 (and (= (size!23242 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23241 _keys!868) (size!23242 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!572681 () Bool)

(assert (=> start!72584 (=> (not res!572681) (not e!470001))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72584 (= res!572681 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23241 _keys!868))))))

(assert (=> start!72584 e!470001))

(assert (=> start!72584 true))

(declare-fun array_inv!18144 (array!47540) Bool)

(assert (=> start!72584 (array_inv!18144 _keys!868)))

(declare-fun e!470000 () Bool)

(declare-fun array_inv!18145 (array!47542) Bool)

(assert (=> start!72584 (and (array_inv!18145 _values!688) e!470000)))

(declare-fun b!842599 () Bool)

(declare-fun e!469999 () Bool)

(declare-fun tp_is_empty!15635 () Bool)

(assert (=> b!842599 (= e!469999 tp_is_empty!15635)))

(declare-fun b!842600 () Bool)

(declare-fun res!572680 () Bool)

(assert (=> b!842600 (=> (not res!572680) (not e!470001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842600 (= res!572680 (validMask!0 mask!1196))))

(declare-fun b!842601 () Bool)

(assert (=> b!842601 (= e!470001 false)))

(declare-fun lt!381019 () Bool)

(declare-datatypes ((List!16215 0))(
  ( (Nil!16212) (Cons!16211 (h!17342 (_ BitVec 64)) (t!22586 List!16215)) )
))
(declare-fun arrayNoDuplicates!0 (array!47540 (_ BitVec 32) List!16215) Bool)

(assert (=> b!842601 (= lt!381019 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16212))))

(declare-fun b!842602 () Bool)

(assert (=> b!842602 (= e!470000 (and e!469999 mapRes!25052))))

(declare-fun condMapEmpty!25052 () Bool)

(declare-fun mapDefault!25052 () ValueCell!7378)

