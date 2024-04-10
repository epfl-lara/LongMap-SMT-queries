; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72668 () Bool)

(assert start!72668)

(declare-fun b!843479 () Bool)

(declare-fun res!573183 () Bool)

(declare-fun e!470629 () Bool)

(assert (=> b!843479 (=> (not res!573183) (not e!470629))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47686 0))(
  ( (array!47687 (arr!22874 (Array (_ BitVec 32) (_ BitVec 64))) (size!23314 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47686)

(declare-datatypes ((V!26005 0))(
  ( (V!26006 (val!7907 Int)) )
))
(declare-datatypes ((ValueCell!7420 0))(
  ( (ValueCellFull!7420 (v!10332 V!26005)) (EmptyCell!7420) )
))
(declare-datatypes ((array!47688 0))(
  ( (array!47689 (arr!22875 (Array (_ BitVec 32) ValueCell!7420)) (size!23315 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47688)

(assert (=> b!843479 (= res!573183 (and (= (size!23315 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23314 _keys!868) (size!23315 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25178 () Bool)

(declare-fun mapRes!25178 () Bool)

(assert (=> mapIsEmpty!25178 mapRes!25178))

(declare-fun b!843480 () Bool)

(declare-fun e!470630 () Bool)

(declare-fun tp_is_empty!15719 () Bool)

(assert (=> b!843480 (= e!470630 tp_is_empty!15719)))

(declare-fun b!843481 () Bool)

(declare-fun res!573182 () Bool)

(assert (=> b!843481 (=> (not res!573182) (not e!470629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843481 (= res!573182 (validMask!0 mask!1196))))

(declare-fun b!843482 () Bool)

(declare-fun e!470631 () Bool)

(assert (=> b!843482 (= e!470631 tp_is_empty!15719)))

(declare-fun b!843483 () Bool)

(assert (=> b!843483 (= e!470629 false)))

(declare-fun lt!381145 () Bool)

(declare-datatypes ((List!16238 0))(
  ( (Nil!16235) (Cons!16234 (h!17365 (_ BitVec 64)) (t!22609 List!16238)) )
))
(declare-fun arrayNoDuplicates!0 (array!47686 (_ BitVec 32) List!16238) Bool)

(assert (=> b!843483 (= lt!381145 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16235))))

(declare-fun res!573184 () Bool)

(assert (=> start!72668 (=> (not res!573184) (not e!470629))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72668 (= res!573184 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23314 _keys!868))))))

(assert (=> start!72668 e!470629))

(assert (=> start!72668 true))

(declare-fun array_inv!18190 (array!47686) Bool)

(assert (=> start!72668 (array_inv!18190 _keys!868)))

(declare-fun e!470632 () Bool)

(declare-fun array_inv!18191 (array!47688) Bool)

(assert (=> start!72668 (and (array_inv!18191 _values!688) e!470632)))

(declare-fun mapNonEmpty!25178 () Bool)

(declare-fun tp!48496 () Bool)

(assert (=> mapNonEmpty!25178 (= mapRes!25178 (and tp!48496 e!470630))))

(declare-fun mapKey!25178 () (_ BitVec 32))

(declare-fun mapValue!25178 () ValueCell!7420)

(declare-fun mapRest!25178 () (Array (_ BitVec 32) ValueCell!7420))

(assert (=> mapNonEmpty!25178 (= (arr!22875 _values!688) (store mapRest!25178 mapKey!25178 mapValue!25178))))

(declare-fun b!843484 () Bool)

(assert (=> b!843484 (= e!470632 (and e!470631 mapRes!25178))))

(declare-fun condMapEmpty!25178 () Bool)

(declare-fun mapDefault!25178 () ValueCell!7420)

