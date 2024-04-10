; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72698 () Bool)

(assert start!72698)

(declare-fun b!843794 () Bool)

(declare-fun res!573362 () Bool)

(declare-fun e!470853 () Bool)

(assert (=> b!843794 (=> (not res!573362) (not e!470853))))

(declare-datatypes ((array!47742 0))(
  ( (array!47743 (arr!22902 (Array (_ BitVec 32) (_ BitVec 64))) (size!23342 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47742)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47742 (_ BitVec 32)) Bool)

(assert (=> b!843794 (= res!573362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573363 () Bool)

(assert (=> start!72698 (=> (not res!573363) (not e!470853))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72698 (= res!573363 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23342 _keys!868))))))

(assert (=> start!72698 e!470853))

(assert (=> start!72698 true))

(declare-fun array_inv!18214 (array!47742) Bool)

(assert (=> start!72698 (array_inv!18214 _keys!868)))

(declare-datatypes ((V!26045 0))(
  ( (V!26046 (val!7922 Int)) )
))
(declare-datatypes ((ValueCell!7435 0))(
  ( (ValueCellFull!7435 (v!10347 V!26045)) (EmptyCell!7435) )
))
(declare-datatypes ((array!47744 0))(
  ( (array!47745 (arr!22903 (Array (_ BitVec 32) ValueCell!7435)) (size!23343 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47744)

(declare-fun e!470857 () Bool)

(declare-fun array_inv!18215 (array!47744) Bool)

(assert (=> start!72698 (and (array_inv!18215 _values!688) e!470857)))

(declare-fun mapIsEmpty!25223 () Bool)

(declare-fun mapRes!25223 () Bool)

(assert (=> mapIsEmpty!25223 mapRes!25223))

(declare-fun b!843795 () Bool)

(declare-fun e!470855 () Bool)

(declare-fun tp_is_empty!15749 () Bool)

(assert (=> b!843795 (= e!470855 tp_is_empty!15749)))

(declare-fun b!843796 () Bool)

(declare-fun e!470856 () Bool)

(assert (=> b!843796 (= e!470856 tp_is_empty!15749)))

(declare-fun b!843797 () Bool)

(declare-fun res!573364 () Bool)

(assert (=> b!843797 (=> (not res!573364) (not e!470853))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843797 (= res!573364 (and (= (size!23343 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23342 _keys!868) (size!23343 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843798 () Bool)

(assert (=> b!843798 (= e!470853 false)))

(declare-fun lt!381190 () Bool)

(declare-datatypes ((List!16249 0))(
  ( (Nil!16246) (Cons!16245 (h!17376 (_ BitVec 64)) (t!22620 List!16249)) )
))
(declare-fun arrayNoDuplicates!0 (array!47742 (_ BitVec 32) List!16249) Bool)

(assert (=> b!843798 (= lt!381190 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16246))))

(declare-fun mapNonEmpty!25223 () Bool)

(declare-fun tp!48541 () Bool)

(assert (=> mapNonEmpty!25223 (= mapRes!25223 (and tp!48541 e!470856))))

(declare-fun mapKey!25223 () (_ BitVec 32))

(declare-fun mapRest!25223 () (Array (_ BitVec 32) ValueCell!7435))

(declare-fun mapValue!25223 () ValueCell!7435)

(assert (=> mapNonEmpty!25223 (= (arr!22903 _values!688) (store mapRest!25223 mapKey!25223 mapValue!25223))))

(declare-fun b!843799 () Bool)

(assert (=> b!843799 (= e!470857 (and e!470855 mapRes!25223))))

(declare-fun condMapEmpty!25223 () Bool)

(declare-fun mapDefault!25223 () ValueCell!7435)

