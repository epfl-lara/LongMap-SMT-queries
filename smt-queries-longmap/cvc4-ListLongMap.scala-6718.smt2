; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84284 () Bool)

(assert start!84284)

(declare-fun res!659774 () Bool)

(declare-fun e!555866 () Bool)

(assert (=> start!84284 (=> (not res!659774) (not e!555866))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84284 (= res!659774 (validMask!0 mask!1948))))

(assert (=> start!84284 e!555866))

(assert (=> start!84284 true))

(declare-datatypes ((V!35765 0))(
  ( (V!35766 (val!11594 Int)) )
))
(declare-datatypes ((ValueCell!11062 0))(
  ( (ValueCellFull!11062 (v!14156 V!35765)) (EmptyCell!11062) )
))
(declare-datatypes ((array!62145 0))(
  ( (array!62146 (arr!29930 (Array (_ BitVec 32) ValueCell!11062)) (size!30409 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62145)

(declare-fun e!555863 () Bool)

(declare-fun array_inv!23131 (array!62145) Bool)

(assert (=> start!84284 (and (array_inv!23131 _values!1278) e!555863)))

(declare-datatypes ((array!62147 0))(
  ( (array!62148 (arr!29931 (Array (_ BitVec 32) (_ BitVec 64))) (size!30410 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62147)

(declare-fun array_inv!23132 (array!62147) Bool)

(assert (=> start!84284 (array_inv!23132 _keys!1544)))

(declare-fun mapNonEmpty!36659 () Bool)

(declare-fun mapRes!36659 () Bool)

(declare-fun tp!69514 () Bool)

(declare-fun e!555867 () Bool)

(assert (=> mapNonEmpty!36659 (= mapRes!36659 (and tp!69514 e!555867))))

(declare-fun mapValue!36659 () ValueCell!11062)

(declare-fun mapRest!36659 () (Array (_ BitVec 32) ValueCell!11062))

(declare-fun mapKey!36659 () (_ BitVec 32))

(assert (=> mapNonEmpty!36659 (= (arr!29930 _values!1278) (store mapRest!36659 mapKey!36659 mapValue!36659))))

(declare-fun b!986029 () Bool)

(assert (=> b!986029 (= e!555866 false)))

(declare-fun lt!437426 () Bool)

(declare-datatypes ((List!20726 0))(
  ( (Nil!20723) (Cons!20722 (h!21884 (_ BitVec 64)) (t!29625 List!20726)) )
))
(declare-fun arrayNoDuplicates!0 (array!62147 (_ BitVec 32) List!20726) Bool)

(assert (=> b!986029 (= lt!437426 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20723))))

(declare-fun b!986030 () Bool)

(declare-fun res!659773 () Bool)

(assert (=> b!986030 (=> (not res!659773) (not e!555866))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986030 (= res!659773 (and (= (size!30409 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30410 _keys!1544) (size!30409 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36659 () Bool)

(assert (=> mapIsEmpty!36659 mapRes!36659))

(declare-fun b!986031 () Bool)

(declare-fun res!659772 () Bool)

(assert (=> b!986031 (=> (not res!659772) (not e!555866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62147 (_ BitVec 32)) Bool)

(assert (=> b!986031 (= res!659772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986032 () Bool)

(declare-fun e!555864 () Bool)

(declare-fun tp_is_empty!23087 () Bool)

(assert (=> b!986032 (= e!555864 tp_is_empty!23087)))

(declare-fun b!986033 () Bool)

(assert (=> b!986033 (= e!555867 tp_is_empty!23087)))

(declare-fun b!986034 () Bool)

(assert (=> b!986034 (= e!555863 (and e!555864 mapRes!36659))))

(declare-fun condMapEmpty!36659 () Bool)

(declare-fun mapDefault!36659 () ValueCell!11062)

