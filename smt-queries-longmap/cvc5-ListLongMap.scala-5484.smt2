; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72688 () Bool)

(assert start!72688)

(declare-fun b!843689 () Bool)

(declare-fun res!573302 () Bool)

(declare-fun e!470780 () Bool)

(assert (=> b!843689 (=> (not res!573302) (not e!470780))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843689 (= res!573302 (validMask!0 mask!1196))))

(declare-fun b!843690 () Bool)

(declare-fun e!470781 () Bool)

(declare-fun tp_is_empty!15739 () Bool)

(assert (=> b!843690 (= e!470781 tp_is_empty!15739)))

(declare-fun b!843691 () Bool)

(assert (=> b!843691 (= e!470780 false)))

(declare-fun lt!381175 () Bool)

(declare-datatypes ((array!47724 0))(
  ( (array!47725 (arr!22893 (Array (_ BitVec 32) (_ BitVec 64))) (size!23333 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47724)

(declare-datatypes ((List!16245 0))(
  ( (Nil!16242) (Cons!16241 (h!17372 (_ BitVec 64)) (t!22616 List!16245)) )
))
(declare-fun arrayNoDuplicates!0 (array!47724 (_ BitVec 32) List!16245) Bool)

(assert (=> b!843691 (= lt!381175 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16242))))

(declare-fun res!573303 () Bool)

(assert (=> start!72688 (=> (not res!573303) (not e!470780))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72688 (= res!573303 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23333 _keys!868))))))

(assert (=> start!72688 e!470780))

(assert (=> start!72688 true))

(declare-fun array_inv!18206 (array!47724) Bool)

(assert (=> start!72688 (array_inv!18206 _keys!868)))

(declare-datatypes ((V!26033 0))(
  ( (V!26034 (val!7917 Int)) )
))
(declare-datatypes ((ValueCell!7430 0))(
  ( (ValueCellFull!7430 (v!10342 V!26033)) (EmptyCell!7430) )
))
(declare-datatypes ((array!47726 0))(
  ( (array!47727 (arr!22894 (Array (_ BitVec 32) ValueCell!7430)) (size!23334 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47726)

(declare-fun e!470779 () Bool)

(declare-fun array_inv!18207 (array!47726) Bool)

(assert (=> start!72688 (and (array_inv!18207 _values!688) e!470779)))

(declare-fun mapIsEmpty!25208 () Bool)

(declare-fun mapRes!25208 () Bool)

(assert (=> mapIsEmpty!25208 mapRes!25208))

(declare-fun b!843692 () Bool)

(declare-fun res!573304 () Bool)

(assert (=> b!843692 (=> (not res!573304) (not e!470780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47724 (_ BitVec 32)) Bool)

(assert (=> b!843692 (= res!573304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843693 () Bool)

(declare-fun e!470782 () Bool)

(assert (=> b!843693 (= e!470782 tp_is_empty!15739)))

(declare-fun b!843694 () Bool)

(declare-fun res!573305 () Bool)

(assert (=> b!843694 (=> (not res!573305) (not e!470780))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843694 (= res!573305 (and (= (size!23334 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23333 _keys!868) (size!23334 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843695 () Bool)

(assert (=> b!843695 (= e!470779 (and e!470781 mapRes!25208))))

(declare-fun condMapEmpty!25208 () Bool)

(declare-fun mapDefault!25208 () ValueCell!7430)

