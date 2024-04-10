; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72682 () Bool)

(assert start!72682)

(declare-fun b!843626 () Bool)

(declare-fun res!573268 () Bool)

(declare-fun e!470737 () Bool)

(assert (=> b!843626 (=> (not res!573268) (not e!470737))))

(declare-datatypes ((array!47712 0))(
  ( (array!47713 (arr!22887 (Array (_ BitVec 32) (_ BitVec 64))) (size!23327 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47712)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47712 (_ BitVec 32)) Bool)

(assert (=> b!843626 (= res!573268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25199 () Bool)

(declare-fun mapRes!25199 () Bool)

(assert (=> mapIsEmpty!25199 mapRes!25199))

(declare-fun res!573269 () Bool)

(assert (=> start!72682 (=> (not res!573269) (not e!470737))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72682 (= res!573269 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23327 _keys!868))))))

(assert (=> start!72682 e!470737))

(assert (=> start!72682 true))

(declare-fun array_inv!18200 (array!47712) Bool)

(assert (=> start!72682 (array_inv!18200 _keys!868)))

(declare-datatypes ((V!26025 0))(
  ( (V!26026 (val!7914 Int)) )
))
(declare-datatypes ((ValueCell!7427 0))(
  ( (ValueCellFull!7427 (v!10339 V!26025)) (EmptyCell!7427) )
))
(declare-datatypes ((array!47714 0))(
  ( (array!47715 (arr!22888 (Array (_ BitVec 32) ValueCell!7427)) (size!23328 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47714)

(declare-fun e!470736 () Bool)

(declare-fun array_inv!18201 (array!47714) Bool)

(assert (=> start!72682 (and (array_inv!18201 _values!688) e!470736)))

(declare-fun mapNonEmpty!25199 () Bool)

(declare-fun tp!48517 () Bool)

(declare-fun e!470733 () Bool)

(assert (=> mapNonEmpty!25199 (= mapRes!25199 (and tp!48517 e!470733))))

(declare-fun mapValue!25199 () ValueCell!7427)

(declare-fun mapRest!25199 () (Array (_ BitVec 32) ValueCell!7427))

(declare-fun mapKey!25199 () (_ BitVec 32))

(assert (=> mapNonEmpty!25199 (= (arr!22888 _values!688) (store mapRest!25199 mapKey!25199 mapValue!25199))))

(declare-fun b!843627 () Bool)

(declare-fun res!573267 () Bool)

(assert (=> b!843627 (=> (not res!573267) (not e!470737))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843627 (= res!573267 (and (= (size!23328 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23327 _keys!868) (size!23328 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843628 () Bool)

(declare-fun res!573266 () Bool)

(assert (=> b!843628 (=> (not res!573266) (not e!470737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843628 (= res!573266 (validMask!0 mask!1196))))

(declare-fun b!843629 () Bool)

(assert (=> b!843629 (= e!470737 false)))

(declare-fun lt!381166 () Bool)

(declare-datatypes ((List!16243 0))(
  ( (Nil!16240) (Cons!16239 (h!17370 (_ BitVec 64)) (t!22614 List!16243)) )
))
(declare-fun arrayNoDuplicates!0 (array!47712 (_ BitVec 32) List!16243) Bool)

(assert (=> b!843629 (= lt!381166 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16240))))

(declare-fun b!843630 () Bool)

(declare-fun e!470734 () Bool)

(assert (=> b!843630 (= e!470736 (and e!470734 mapRes!25199))))

(declare-fun condMapEmpty!25199 () Bool)

(declare-fun mapDefault!25199 () ValueCell!7427)

