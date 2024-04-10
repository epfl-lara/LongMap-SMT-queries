; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72680 () Bool)

(assert start!72680)

(declare-fun b!843605 () Bool)

(declare-fun res!573255 () Bool)

(declare-fun e!470719 () Bool)

(assert (=> b!843605 (=> (not res!573255) (not e!470719))))

(declare-datatypes ((array!47708 0))(
  ( (array!47709 (arr!22885 (Array (_ BitVec 32) (_ BitVec 64))) (size!23325 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47708)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47708 (_ BitVec 32)) Bool)

(assert (=> b!843605 (= res!573255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843606 () Bool)

(declare-fun e!470718 () Bool)

(declare-fun e!470722 () Bool)

(declare-fun mapRes!25196 () Bool)

(assert (=> b!843606 (= e!470718 (and e!470722 mapRes!25196))))

(declare-fun condMapEmpty!25196 () Bool)

(declare-datatypes ((V!26021 0))(
  ( (V!26022 (val!7913 Int)) )
))
(declare-datatypes ((ValueCell!7426 0))(
  ( (ValueCellFull!7426 (v!10338 V!26021)) (EmptyCell!7426) )
))
(declare-datatypes ((array!47710 0))(
  ( (array!47711 (arr!22886 (Array (_ BitVec 32) ValueCell!7426)) (size!23326 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47710)

(declare-fun mapDefault!25196 () ValueCell!7426)

