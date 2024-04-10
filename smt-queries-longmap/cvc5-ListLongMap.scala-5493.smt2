; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72742 () Bool)

(assert start!72742)

(declare-fun b!844256 () Bool)

(declare-fun res!573629 () Bool)

(declare-fun e!471184 () Bool)

(assert (=> b!844256 (=> (not res!573629) (not e!471184))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844256 (= res!573629 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25289 () Bool)

(declare-fun mapRes!25289 () Bool)

(assert (=> mapIsEmpty!25289 mapRes!25289))

(declare-fun b!844257 () Bool)

(assert (=> b!844257 (= e!471184 false)))

(declare-fun lt!381256 () Bool)

(declare-datatypes ((array!47822 0))(
  ( (array!47823 (arr!22942 (Array (_ BitVec 32) (_ BitVec 64))) (size!23382 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47822)

(declare-datatypes ((List!16265 0))(
  ( (Nil!16262) (Cons!16261 (h!17392 (_ BitVec 64)) (t!22636 List!16265)) )
))
(declare-fun arrayNoDuplicates!0 (array!47822 (_ BitVec 32) List!16265) Bool)

(assert (=> b!844257 (= lt!381256 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16262))))

(declare-fun b!844258 () Bool)

(declare-fun e!471185 () Bool)

(declare-fun tp_is_empty!15793 () Bool)

(assert (=> b!844258 (= e!471185 tp_is_empty!15793)))

(declare-fun res!573628 () Bool)

(assert (=> start!72742 (=> (not res!573628) (not e!471184))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72742 (= res!573628 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23382 _keys!868))))))

(assert (=> start!72742 e!471184))

(assert (=> start!72742 true))

(declare-fun array_inv!18246 (array!47822) Bool)

(assert (=> start!72742 (array_inv!18246 _keys!868)))

(declare-datatypes ((V!26105 0))(
  ( (V!26106 (val!7944 Int)) )
))
(declare-datatypes ((ValueCell!7457 0))(
  ( (ValueCellFull!7457 (v!10369 V!26105)) (EmptyCell!7457) )
))
(declare-datatypes ((array!47824 0))(
  ( (array!47825 (arr!22943 (Array (_ BitVec 32) ValueCell!7457)) (size!23383 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47824)

(declare-fun e!471186 () Bool)

(declare-fun array_inv!18247 (array!47824) Bool)

(assert (=> start!72742 (and (array_inv!18247 _values!688) e!471186)))

(declare-fun b!844259 () Bool)

(declare-fun res!573627 () Bool)

(assert (=> b!844259 (=> (not res!573627) (not e!471184))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844259 (= res!573627 (and (= (size!23383 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23382 _keys!868) (size!23383 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844260 () Bool)

(declare-fun res!573626 () Bool)

(assert (=> b!844260 (=> (not res!573626) (not e!471184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47822 (_ BitVec 32)) Bool)

(assert (=> b!844260 (= res!573626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25289 () Bool)

(declare-fun tp!48607 () Bool)

(declare-fun e!471187 () Bool)

(assert (=> mapNonEmpty!25289 (= mapRes!25289 (and tp!48607 e!471187))))

(declare-fun mapKey!25289 () (_ BitVec 32))

(declare-fun mapValue!25289 () ValueCell!7457)

(declare-fun mapRest!25289 () (Array (_ BitVec 32) ValueCell!7457))

(assert (=> mapNonEmpty!25289 (= (arr!22943 _values!688) (store mapRest!25289 mapKey!25289 mapValue!25289))))

(declare-fun b!844261 () Bool)

(assert (=> b!844261 (= e!471186 (and e!471185 mapRes!25289))))

(declare-fun condMapEmpty!25289 () Bool)

(declare-fun mapDefault!25289 () ValueCell!7457)

