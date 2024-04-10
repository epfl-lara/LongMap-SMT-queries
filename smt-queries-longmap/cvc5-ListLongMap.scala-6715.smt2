; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84262 () Bool)

(assert start!84262)

(declare-fun b!985831 () Bool)

(declare-fun e!555702 () Bool)

(declare-fun tp_is_empty!23065 () Bool)

(assert (=> b!985831 (= e!555702 tp_is_empty!23065)))

(declare-fun b!985832 () Bool)

(declare-fun e!555698 () Bool)

(assert (=> b!985832 (= e!555698 false)))

(declare-fun lt!437393 () Bool)

(declare-datatypes ((array!62105 0))(
  ( (array!62106 (arr!29910 (Array (_ BitVec 32) (_ BitVec 64))) (size!30389 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62105)

(declare-datatypes ((List!20717 0))(
  ( (Nil!20714) (Cons!20713 (h!21875 (_ BitVec 64)) (t!29616 List!20717)) )
))
(declare-fun arrayNoDuplicates!0 (array!62105 (_ BitVec 32) List!20717) Bool)

(assert (=> b!985832 (= lt!437393 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20714))))

(declare-fun mapIsEmpty!36626 () Bool)

(declare-fun mapRes!36626 () Bool)

(assert (=> mapIsEmpty!36626 mapRes!36626))

(declare-fun res!659673 () Bool)

(assert (=> start!84262 (=> (not res!659673) (not e!555698))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84262 (= res!659673 (validMask!0 mask!1948))))

(assert (=> start!84262 e!555698))

(assert (=> start!84262 true))

(declare-datatypes ((V!35737 0))(
  ( (V!35738 (val!11583 Int)) )
))
(declare-datatypes ((ValueCell!11051 0))(
  ( (ValueCellFull!11051 (v!14145 V!35737)) (EmptyCell!11051) )
))
(declare-datatypes ((array!62107 0))(
  ( (array!62108 (arr!29911 (Array (_ BitVec 32) ValueCell!11051)) (size!30390 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62107)

(declare-fun e!555701 () Bool)

(declare-fun array_inv!23117 (array!62107) Bool)

(assert (=> start!84262 (and (array_inv!23117 _values!1278) e!555701)))

(declare-fun array_inv!23118 (array!62105) Bool)

(assert (=> start!84262 (array_inv!23118 _keys!1544)))

(declare-fun mapNonEmpty!36626 () Bool)

(declare-fun tp!69481 () Bool)

(declare-fun e!555700 () Bool)

(assert (=> mapNonEmpty!36626 (= mapRes!36626 (and tp!69481 e!555700))))

(declare-fun mapValue!36626 () ValueCell!11051)

(declare-fun mapKey!36626 () (_ BitVec 32))

(declare-fun mapRest!36626 () (Array (_ BitVec 32) ValueCell!11051))

(assert (=> mapNonEmpty!36626 (= (arr!29911 _values!1278) (store mapRest!36626 mapKey!36626 mapValue!36626))))

(declare-fun b!985833 () Bool)

(declare-fun res!659675 () Bool)

(assert (=> b!985833 (=> (not res!659675) (not e!555698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62105 (_ BitVec 32)) Bool)

(assert (=> b!985833 (= res!659675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985834 () Bool)

(declare-fun res!659674 () Bool)

(assert (=> b!985834 (=> (not res!659674) (not e!555698))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985834 (= res!659674 (and (= (size!30390 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30389 _keys!1544) (size!30390 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985835 () Bool)

(assert (=> b!985835 (= e!555701 (and e!555702 mapRes!36626))))

(declare-fun condMapEmpty!36626 () Bool)

(declare-fun mapDefault!36626 () ValueCell!11051)

